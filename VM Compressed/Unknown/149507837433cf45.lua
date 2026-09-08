print("loading windui")

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

print("loaded windui")

print("---------------------")

print()

print("------ Neow Hub Start ------ ")

warn("READY TO LOAD A SCRIPT")
warn('NOTE (1/2): If you see error: ImageLabel is not a valid member of Frame "Flame", NOT tell it about me!')
warn('NOTE (2/2): Im think, it mistake by WindUI Library Developer/Scripter.')

local a, b = "Unknown", ""
if identifyexecutor then
    local x, y = identifyexecutor()
    if typeof(x) == "string" then a = x end
    if typeof(y) == "string" then b = y end
end

local raw = a .. (b ~= "" and (" " .. b) or "")
local executor = raw:match("^%s*(%S+)") or "Unknown"

local UserInputService = game:GetService("UserInputService")
local screenSize = workspace.CurrentCamera.ViewportSize

local function ShowPopup(title, content)
    local proceedEvent = Instance.new("BindableEvent")

    WindUI:Popup({
        Title = title,
        Icon = "info",
        Content = content,
        Buttons = {
            {
                Title = "Continue",
                Icon = "arrow-right",
                Callback = function()
                    proceedEvent:Fire()
                end,
                Variant = "Tertiary",
            },
        }
    })

    proceedEvent.Event:Wait()
end

local success, result = pcall(DetectDevice)

if success and result == true then
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        ShowPopup(
            "Warning!",
            "Are you playing on mobile.\nThis script is NOT tested for mobile.\nDo you want to continue?\n(If not, just close the script)"
        )
    elseif UserInputService.KeyboardEnabled then
        if screenSize.X <= 1366 and screenSize.Y <= 768 then
            ShowPopup(
                "Warning!",
                "Are you probably using a laptop.\nThis script is tested for PC, but not laptop.\nDo you want to continue?\n(If not, just close the script)"
            )
        end
    end
end

if not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled then
-- nothing do (cuz script is tested on PC)
else
	print("User confirmed, continuing script execution...")
end

if executor == "Unknown" and DetectExecutor then
	ShowPopup(
        "Warning!",
        "Failed to detect your executor.\nDo you want to continue?\n(If not, just close the script)"
    )
end

local inf = 1.797693e308 -- very ez method to get infinity
-- sadly luau will ignore the 1e380 which is infinity and default to 0 seconds :(
local Size, MinSize, MaxSize
local title
local TargetPlayer
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer -- wait... GRABBING YOUR ACCOUNT?!?! (jk lol)
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HRP = Character:WaitForChild("HumanoidRootPart")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local PlaceId = game.PlaceId
local JobId = game.JobId
local Name = LocalPlayer.Name
local DisplayName = LocalPlayer.DisplayName
local MarketplaceService = game:GetService("MarketplaceService")
local root = Character:FindFirstChild("HumanoidRootPart")
local infJump -- INFINITE YIELD COPIED !!!!1!!!
infJumpDebounce = false -- INFINITE YIELD COPIED !!!!1!!!

Humanoid.UseJumpPower = true -- fixing JumpPower bug: not changing

local function KickPlayer(reason)
    if LocalPlayer then
        local msg = "You have been kicked by Neow Hub.\nReason: " .. (reason or "No reason")
        LocalPlayer:Kick(msg)
    else
		warn("failed to kick localplayer with reason:" .. (reason or "No reason"))
		error("error: not found localplayer", 0)
    end
end

local function NotifyFiltered(title, desc, icon)
    local iconMap = {
        failed = "circle-x",
        warning = "circle-alert",
        success = "circle-check",
        info = "info",
	question = "circle-question-mark"
    }
    local chosenIcon = "info"
    if icon then
        chosenIcon = iconMap[icon:lower()] or icon
    end
    WindUI:Notify({
        Title = title or "Notification | Neow Hub",
        Content = desc or "No description provided.",
        Icon = chosenIcon or "info"
    })
end

local function IsValidNumber(input)
    return input and tostring(input):match("^%d+%.?%d*$") ~= nil
end

local function getRoot()
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function teleport(position)
    local root = getRoot()
    if root then
        root.CFrame = CFrame.new(position)
        return true
    end
    return false
end

local function ismaxlike(input, valueType)
    local lower = input:lower()
    if lower == "max" or lower == "maximum" then
        return true, true
    end
    if lower:match("^m.*x") then
        NotifyFiltered("Neow Hub | Note", "Possible, you want to change "..valueType.." to maximum.\nTo set "..valueType.." to maximum, use: max / maximum", "warning")
        return true, false
    end
    return false, false
end

local function isminlike(input, valueType)
    local lower = input:lower()
    if lower == "min" or lower == "minimum" then
        return true, true
    end
    if lower:match("^m[^x]*i") then
        NotifyFiltered("Neow Hub | Note", "Possible, you want to change "..valueType.." to minimum.\nTo set "..valueType.." to minimum, use: min / minimum", "warning")
        return true, false
    end
    return false, false
end

local function isinflike(input, valueType)
    local lower = input:lower()
    if lower:match("^inf[a-z]*") then
        NotifyFiltered("Neow Hub | Note", "Possible, you want to change "..valueType.." to maximum.\nTo set "..valueType.." to maximum, use: max / maximum", "warning")
        return true
    end
    return false
end

local function setValue(input, minValue, maxValue, valueType, setFunc)
    if input == "" then return end
    local lower = input:lower()
    if lower == "m" then
        NotifyFiltered("Neow Hub | Note", 'You entered only "m".\nPlease type more letters to indicate max or min for '..valueType, "warning")
        return
    end
    local maxIndex = lower:find("max")
    local minIndex = lower:find("min")
    local useMax, useMin = false, false
    if maxIndex and minIndex then
        if maxIndex < minIndex then
            useMax = true
        else
            useMin = true
        end
    elseif maxIndex then
        useMax = true
    elseif minIndex then
        useMin = true
    end
    if useMax then
        input = tostring(maxValue)
    elseif useMin then
        input = tostring(minValue)
    elseif isinflike(input, valueType) then
        return
    elseif not tonumber(input) then
        NotifyFiltered("Neow Hub | Invalid Input", "Please enter a number or 'max / minimum'.", "failed")
        return
    end
    if not IsValidNumber(input) then
        NotifyFiltered("Neow Hub | Invalid Input", "Please enter only numbers (no letters or symbols).", "failed")
        return
    end
    local num = tonumber(input)
    if not num or num < minValue or num > maxValue then
        NotifyFiltered("Neow Hub | Invalid "..valueType, "Enter a value between "..minValue.." and "..maxValue..".", "failed")
        return
    end
    setFunc(math.clamp(num, minValue, maxValue))
    if useMax then
        NotifyFiltered("Neow Hub | Success", valueType.." set to maximum ("..num..")", "success")
    elseif useMin then
        NotifyFiltered("Neow Hub | Success", valueType.." set to minimum ("..num..")", "success")
    else
        NotifyFiltered("Neow Hub | Success", valueType.." set to "..num, "success")
    end
end

print("loaded all locals/functions")
warn("others locals/functions will be loaded later!")

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    title = "(📱) Neow Hub | Clicky Keyboard Tower"
    Size = UDim2.fromOffset(500, 400)
    MinSize = Vector2.new(450, 320)
    MaxSize = Vector2.new(600, 450)
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled then
    title = "(🖥) Neow Hub | Clicky Keyboard Tower"
    Size = UDim2.fromOffset(600, 500)
    MinSize = Vector2.new(520, 350)
    MaxSize = Vector2.new(700, 500)
	--[[
    Size = UDim2.fromOffset(600, 500)
    MinSize = Vector2.new(520, 350)
    MaxSize = Vector2.new(700, 500)
	--]]
else
    title = "(❓) Neow Hub | Clicky Keyboard Tower"
    Size = UDim2.fromOffset(540, 440)
    MinSize = Vector2.new(480, 360)
    MaxSize = Vector2.new(680, 480)
end

local Window = WindUI:CreateWindow({
    Title = title,
    Icon = "cat",
    Author = "by BadScriptsMaker ",
    Folder = "NeowHub123",

    Size = Size,
    MinSize = MinSize,
    MaxSize = MaxSize,
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,

    User = {
        Enabled = true,
        Anonymous = false
    },
})

local Player = Window:Tab({
    Title = "Player",
    Icon = "user-round-cog",
	Desc = "Allows to change speed, JumpPower and etc",
    Locked = false,
})

local Teleport = Window:Tab({
    Title = "Teleport",
    Icon = "step-forward",
	Desc = "Teleport to: End/Start and etc",
    Locked = false,
})

local Security = Window:Tab({
    Title = "Security",
    Icon = "shield",
	Desc = "Safes you to death",
    Locked = false,
})

local Optimization = Window:Tab({
    Title = "Optimization",
    Icon = "arrow-big-up-dash",
	Desc = "It may help boost FPS.",
    Locked = false,
})

local FunTab = Window:Tab({
    Title = "Auto-Emoji",
    Icon = "laugh",
	Desc = "(NEW) Fun function",
    Locked = lockedscript,
})

local MoreTab = Window:Tab({
    Title = "Other",
    Icon = "circle-ellipsis",
	Desc = "Others functions",
    Locked = false,
})

local ermidk = Window:Tab({
    Title = "---------------------",
    Locked = true,
})

local ChangeLog = Window:Tab({
    Title = "Change Log",
	Icon = "circle-question-mark",
	Desc = "Here new updates info",
    Locked = false,
})

local Credits = Window:Tab({
    Title = "Credits",
	Icon = "heart",
	Desc = "Here who helped to create a script",
    Locked = false,
})

local Section = ChangeLog:Section({ 
    Title = "Change Log",
})

local Paragraph = ChangeLog:Paragraph({
    Title = "Current version: v2.0.0 BETA",
    Desc = nil,
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Button = ChangeLog:Button({
    Title = "v2.0.0 BETA",
    Desc = 'Update is big, so much changes.\nSearch "Neow Hub Keyless" with game "Clicky Keyboard Tower" (in ScriptBlox) or click here to copy link.',
    Locked = false,
    Callback = function()
        if not setclipboard() then
			NotifyFiltered("Your exploit is not supporting setclipboard().", "failed")
		else
			setclipboard("https://pastefy.app/3eCs4qdD/raw")
		    NotifyFiltered("Success copied!\nPaste your copied link to browser.", "success")
    end
end
})

local Paragraph = ChangeLog:Paragraph({
    Title = "v1.0.2 BETA",
    Desc = '• Added checker game',
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Paragraph = ChangeLog:Paragraph({
    Title = "v1.0.1 BETA",
    Desc = '• Changed "May to boost FPS" to "It may help boost FPS."',
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Paragraph = ChangeLog:Paragraph({
    Title = "v1.0.0 BETA",
    Desc = "• Released a beta version\n• The best script by this game\n• Second script in this game (ye useful info)\n\nYea, script is small and im going to add more functions.",
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Section = Player:Section({ 
    Title = "Player",
})

Player:Input({
    Title = "WalkSpeed",
    Desc = "Changes your character's walkspeed",
    Type = "Input",
    Placeholder = "By Default: 16",
    Callback = function(input)
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            setValue(input, 1, 300, "WalkSpeed", function(val) humanoid.WalkSpeed = val end)
        end
    end
})

Player:Input({
    Title = "JumpPower",
    Desc = "Changes your character's jump power",
    Type = "Input",
    Placeholder = "By Default: 50",
    Callback = function(input)
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            setValue(input, 1, 1000, "JumpPower", function(val) humanoid.JumpPower = val end)
        end
    end
})

Player:Input({
    Title = "Gravity",
    Desc = "Changes your character's gravity",
    Type = "Input",
    Placeholder = "By Default: 196.2",
    Callback = function(input)
        setValue(input, 1, 1000, "Gravity", function(val) workspace.Gravity = val end)
    end
})

local Toggle = Player:Toggle({
    Title = "InfJump",
    Desc = "Allows to infinite jumpping\n(Credits: Infinite yield)",
    Icon = "check",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)

        if infJump then
            infJump:Disconnect()
            infJump = nil
        end
        
        if state then
            infJumpDebounce = false
            infJump = UserInputService.JumpRequest:Connect(function()
                if not infJumpDebounce then
                    infJumpDebounce = true
                    local character = LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                        if humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                    infJumpDebounce = false
                end
            end)
        end
    end
})

local RunService = game:GetService("RunService")
local Noclipping = nil
local Clip = false

local Toggle = Player:Toggle({
    Title = "Noclip",
    Desc = "Allows to pass through walls and objects\n(Credits: Infinite yield)",
    Icon = "check",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)

        if Noclipping then
            Noclipping:Disconnect()
            Noclipping = nil
        end

        Clip = not state

        if state then
            Noclipping = RunService.Stepped:Connect(function()
                local character = game.Players.LocalPlayer.Character
                if character and not Clip then
                    for _, child in pairs(character:GetDescendants()) do
                        if child:IsA("BasePart") and child.CanCollide == true then
                            child.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
})

local Section = Teleport:Section({ 
    Title = "Teleport",
})

local localPlayer = game.Players.LocalPlayer
local TargetPlayer = nil

local Input = Teleport:Input({
    Title = "Teleport to player",
    Desc = "Using an easy method, supports all executors.",
    Value = nil,
    Type = "Input",
    Placeholder = "Enter your target...",
    Callback = function(input)
		if input == "" then return end

        local inputLower = input:lower()
        local lp = LocalPlayer

        if lp.Name:lower() == inputLower or lp.DisplayName:lower() == inputLower then
            return
        end

        TargetPlayer = nil
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= lp then
                local nameLower = p.Name:lower()
                local displayLower = p.DisplayName:lower()

                if nameLower == inputLower
                    or displayLower == inputLower
                    or nameLower:sub(1, #inputLower) == inputLower
                    or displayLower:sub(1, #inputLower) == inputLower then

                    TargetPlayer = p
                    break
                end
            end
        end

        if TargetPlayer then
            if TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local lpHRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if lpHRP then
                    print("Teleporting to:", TargetPlayer.Name, "at position", TargetPlayer.Character.HumanoidRootPart.Position)
                    lpHRP.CFrame = CFrame.new(TargetPlayer.Character.HumanoidRootPart.Position)
                    NotifyFiltered("Neow Hub | Teleport Success", "Successfully teleported to " .. TargetPlayer.DisplayName .. " (" .. TargetPlayer.Name .. ")!", "success")
                else
                    NotifyFiltered("Neow Hub | Teleport Error", "Your character has no HumanoidRootPart!", "failed")
                end
            else
                NotifyFiltered("Neow Hub | Teleport Error", "Player has no character! Cannot teleport to this player right now.", "failed")
            end
        else
            NotifyFiltered("Neow Hub | Teleport Error", "Player not found! Please re-check your target username or DisplayName.", "failed")
        end
    end
})


local Button = Teleport:Button({
    Title = "Teleport to end",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-65, 567, 254))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to spawn",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-117, 14, -44))
    end
})

local Paragraph = Teleport:Paragraph({
    Title = "-------------",
    Desc = nil,
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Button = Teleport:Button({
    Title = "Teleport to troll part (Start)",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-211, 85, -14))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to troll part (End)",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-211, 85, -94))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to troll part button",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-217, 85, -77))
    end
})

local Paragraph = Teleport:Paragraph({
    Title = "-------------",
    Desc = nil,
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Button = Teleport:Button({
    Title = "Teleport to troll part 2 (Start)",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(43, 114, 36))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to troll part 2 (End)",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(43, 114, 93))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to troll part 2 button",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(50, 114, 86))
    end
})

local Paragraph = Teleport:Paragraph({
    Title = "-------------",
    Desc = nil,
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Button = Teleport:Button({
    Title = "Teleport to troll part 3 (Start)",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(40, 307, 102))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to troll part 3 (End)",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-21, 307, 101))
    end
})

local Button = Teleport:Button({
    Title = "Teleport to troll part 3 button",
    Desc = "Using an easy method, supports all executors.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-19, 307, 117))
    end
})

local Paragraph = Teleport:Paragraph({
    Title = "-------------",
    Desc = nil,
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Button = Teleport:Button({
    Title = "Teleport to group zone",
    Desc = "Using an easy method, supports all executors.\nDelete/Use noclip to left.",
    Locked = false,
    Callback = function()
        teleport(Vector3.new(-59, 6, 71))
	end
})

local Button = Teleport:Button({
    Title = "Claim all in group zone",
    Desc = "Claiming: Speed Coil, Boombox and teleporting back.\nPlease, don't reset when teleporting!",
    Locked = false,
    Callback = function()
        local root = getRoot()
        if not root then
            NotifyFiltered("Neow Hub | Group Zone", "Player root not found, teleport canceled.", "failed")
            return
        end

        local OldPosPlayer = root.Position

        local success, err = pcall(function()
            teleport(Vector3.new(-65, 6, 78))
            task.wait(0.55)
            teleport(Vector3.new(-54, 6, 79))
            task.wait(0.55)
        end)

        if not success then
            NotifyFiltered("Neow Hub | Group Zone", "Teleporting failed: "..tostring(err), "failed")
            return
        end

        local newRoot = getRoot()
        if newRoot then
            teleport(OldPosPlayer)
            NotifyFiltered("Neow Hub | Group Zone", "Successfully claimed all and teleported back!", "success")
        else
            NotifyFiltered("Neow Hub | Group Zone", "Successfully claimed all, but player root not detected after teleport!", "warning")
        end
    end
})

local Button = Teleport:Button({
    Title = "Claim all in group zone + win zone",
    Desc = "Claiming: Boombox, Speed Coil, Gravity Coil, Rainbow Magic Carpet and teleporting back.\nPlease, don't reset when teleporting!",
    Locked = false,
    Callback = function()
        local root = getRoot()
        if not root then
            NotifyFiltered("Neow Hub | Group Zone", "Player root not found, teleport canceled.", "failed")
            return
        end

        local oldPos = root.Position

        local success, err = pcall(function()
            teleport(Vector3.new(-65, 6, 78))
            task.wait(0.55)
            teleport(Vector3.new(-74, 565, 263))
            task.wait(0.55)
            teleport(Vector3.new(-55, 565, 262))
            task.wait(0.55)
            teleport(Vector3.new(-55, 565, 268))
            task.wait(0.55)
        end)

        if not success then
            NotifyFiltered("Neow Hub | Group Zone", "Teleporting failed: "..tostring(err), "failed")
            return
        end

        if teleport(oldPos) then
            NotifyFiltered("Neow Hub | Group Zone", "Successfully claimed all and teleported back!", "success")
        else
            NotifyFiltered("Neow Hub | Group Zone", "Successfully claimed all, but player root not detected after teleport!", "warning")
        end
    end
})

local Button = Teleport:Button({
    Title = "Delete group barrier",
    Desc = "Using an easy method to delete",
    Locked = false,
    Callback = function()
        local worldExtras = workspace:FindFirstChild("World Extras")
        if worldExtras then
            local barrier = worldExtras:FindFirstChild("GroupBarrier")
            if barrier then
                barrier:Destroy()
            end
            for _, obj in pairs(worldExtras:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "Part" then
                    if obj:FindFirstChildWhichIsA("SurfaceGui") then
                        obj:Destroy()
                    end
                end
            end
        end
    end
})

local SpawnPosition = Vector3.new(-211, 85, -14)
local VoidY = -15

local Section = Security:Section({ 
    Title = "Security",
})

game:GetService("RunService").RenderStepped:Connect(function()
    if not AntiVoidEnabled then return end

    if not LocalPlayer then return end

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")

    if root.Position.Y <= VoidY then
        root.CFrame = CFrame.new(SpawnPosition)
    end
end)

local Toggle = Security:Toggle({
    Title = "Anti-Void",
    Desc = "Prevents falling into the void by teleporting to Troll Part (Start).",
    Default = false,
    Callback = function(state)
        AntiVoidEnabled = state
    end
})

local Toggle = Security:Button({
    Title = "Delete slap",
    Desc = "Deleting MeshSlap2, to make obby easy.",
    Default = false,
    Callback = function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Part") then
                for _, child in ipairs(obj:GetChildren()) do
                    if child:IsA("RigidConstraint") or child:IsA("WeldConstraint") or child:IsA("HingeConstraint") then
                        obj:Destroy()
                        break
                    end
                end
            end
        end
    end
})

local Toggle = Security:Button({
    Title = "Delete damage/kill parts",
    Desc = "Deletes KillBricks folder to make the obby easier.",
    Default = false,
    Callback = function()
        local folder = workspace:FindFirstChild("KillBricks")
        if folder then
            folder:Destroy()
        end
    end
})

local Section = MoreTab:Section({ 
    Title = "Other",
})

if executor == "Xeno" then
local Button = MoreTab:Button({
    Title = "ServerHop",
    Desc = "Credits: infinite yield\n(Serverhopping may take more 1-2 mins!)",
    Locked = false,
    Callback = function()
        local servers = {}

        local success, req = pcall(function()
            return game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
        end)

        if success then
            local body = HttpService:JSONDecode(req)
            if body and body.data then
                for _, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) then
                        if v.playing < v.maxPlayers and v.id ~= JobId then
                            table.insert(servers, 1, v.id)
                        end
                    end
                end
            end
        else
            warn("Failed to fetch server list: " .. tostring(req))
            return
        end

        if #servers > 0 then
            local randomServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(PlaceId, randomServer, Players.LocalPlayer)
        else
            warn("No available servers to hop to!")
        end
    end
})
else
local Button = MoreTab:Button({
    Title = "ServerHop",
    Desc = "Credits: infinite yield",
    Locked = false,
    Callback = function()
        local servers = {}

        local success, req = pcall(function()
            return game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
        end)

        if success then
            local body = HttpService:JSONDecode(req)
            if body and body.data then
                for _, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) then
                        if v.playing < v.maxPlayers and v.id ~= JobId then
                            table.insert(servers, 1, v.id)
                        end
                    end
                end
            end
        else
            warn("Failed to fetch server list: " .. tostring(req))
            return
        end

        if #servers > 0 then
            local randomServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(PlaceId, randomServer, Players.LocalPlayer)
        else
            warn("No available servers to hop to!")
        end
    end
})
end

if executor == "Xeno" then
local Button = MoreTab:Button({
    Title = "Rejoin (FIXED)",
    Desc = "Rejoining to server\n(Rejoining may take more 1-2 mins!)",
    Locked = false,
    Callback = function()
		Players.LocalPlayer:Kick("\nRejoining...")
		task.wait(0.1)
		TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
	end
})
else
local Button = MoreTab:Button({
    Title = "Rejoin (FIXED)",
    Desc = "Rejoining to server",
    Locked = false,
    Callback = function()
		Players.LocalPlayer:Kick("\nRejoining...")
		task.wait(0.1)
		TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
	end
})
end

local Button = MoreTab:Button({
    Title = "Infinite Yield",
    Desc = "Popular script",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

local Section = Credits:Section({ 
    Title = "Credits",
})

local Paragraph = Credits:Paragraph({
    Title = "Infinite Yield:",
    Desc = "InfJump, Noclip, ServerHop",
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Paragraph = Credits:Paragraph({
    Title = "Tabs/Scripts:",
    Desc = 'ChatGPT: Fixed a bit broken bugs "Auto-Emoji"\nBtw, very thank to him, he helped to make "Auto-Emoji" better :)',
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Paragraph = Credits:Paragraph({
    Title = "Tested executors:",
    Desc = "Xeno, Seliware",
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Section = Optimization:Section({ 
    Title = "Anti-lag (Optimization)",
})

local Toggle = Optimization:Button({
    Title = "Delete Fog (ONLY HALLOWEEN EVENT)",
    -- Desc = "Deletes fog, boosting FPS.\n(Maybe freeze Roblox 5-15 secs)\n(Status: Working)",
	Desc = "Status: DOWN!",
    Default = false,
	-- Locked = false,
	Locked = true,
    Callback = function()
	-- fixed by friend, thx to him!
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("MeshPart") and obj.Name == "MeshPart" then
                obj:Destroy()
            end
        end
    end
})

local Toggle = Optimization:Button({
    Title = "Delete ModelKey",
    Desc = "Deletes keys, maybe boost FPS.\n(Freezes Roblox 5-15 secs)\n(Makes tower impossible, use infjump)",
    Default = false,
    Callback = function()
        local Targets = { 
            "ModelKey",
            "KeyMesh",
            "Sensor"
        }
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model") then
                for _, name in ipairs(Targets) do
                    if obj.Name == name then
                        obj:Destroy()
                        break
                    end
                end
            end
        end
    end
})

local Toggle = Optimization:Button({
    Title = "Delete useless gamepasses",
    Desc = "Deletes useless gamepasses, maybe boost FPS.\n(Maybe freeze Roblox)",
    Default = false,
    Callback = function()
        local GamePasses = {
            "Slap Gear Gamepass Button!",
            "Rainbow carpet Gamepass Button!",
            "Grapple Hook Gamepass Button!",
            "Jetpack Gamepass Button!"
        }

        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model") then
                for _, name in ipairs(GamePasses) do
                    if obj.Name == name then
                        obj:Destroy()
                        break
                    end
                end
            end
        end
    end
})

local Section = FunTab:Section({ 
    Title = "Auto-Emoji",
})

local Paragraph = FunTab:Paragraph({
    Title = "Auto-Emoji is not avaliable in that script.",
    Desc = "Use a FE Version, which is avaliable in all games!",
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local ButtonExecute = FunTab:Button({
    Title = "Execute Auto-Emoji FE Version ",
    Desc = "Uses loadstring.\nScript by BadScriptsMaker",
    Default = false,
    Callback = function()
	NotifyFiltered("Neow Hub | Loading", 'Loading "Auto-Emoji FE Version", by BadScriptsMaker\n\n( - Script by creator Neow Hub, can be safely executed.)', "warning")
    loadstring(game:HttpGet('https://pastefy.app/cju5Mfan/raw'))()
	NotifyFiltered("Neow Hub | Success", 'Successfully loaded "Auto-Emoji FE Version"!', "success")
    end
})

if executor == "Unknown" then
warn("[DEBUG] Executor: " .. executor .. " (FAILED TO DETECT).")
else
warn("[DEBUG] Executor: " .. executor .. " (SUCCESS TO DETECT).")
end

print("------ Neow Hub End ------ ")