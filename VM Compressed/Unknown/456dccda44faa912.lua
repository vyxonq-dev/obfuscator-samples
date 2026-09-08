--[[

                ,_
                 :`.            .--//._
                  `.`-.        /  ',-""""'
                    `. ``~-._.'_."/
                      `~-._ .` `~;
                           ;.    /
                          /     /
                 Asu ,_.-';_,.'`
                      `"-;`/
                        ,'`

        October 2025 Halloween BABFT source 
           Thanks for using this script

                  love you all <3

]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

--// vars
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

if not workspace:FindFirstChild("Houses") then
	local StarterGui = game:GetService("StarterGui")
			StarterGui:SetCore("SendNotification", {
			Title = "Candy Farm - Asu",
			Text = "There is no Halloween event, or you may be on a server without the update",
			Icon = "rbxassetid://7781250539", 
			Duration = 4
			})
	return
end

local Houses = workspace:WaitForChild("Houses")


local FarmBool = false
local hidegui = true
local a, b, c, d, e, f = 0, 0, 0, 0, 0, 0
local FCMASTER = true

player.CharacterAdded:Connect(function(char)
    character = char
    hrp = character:WaitForChild("HumanoidRootPart")
end)

--// ReGui UI library by depthso - Depso
local ImGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua"))()

local PrefabsId = "rbxassetid://" .. tostring(ImGui.PrefabsId)

ImGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})

local baseTemplate = {
    TitleAlign = Enum.TextXAlignment.Left,
    TextDisabled = Color3.fromRGB(200, 200, 200),
    Text = Color3.fromRGB(255, 255, 255),
    TabText = Color3.fromRGB(255, 255, 255),
    TabTextActive = Color3.fromRGB(255, 255, 255),
    FrameBg = Color3.fromRGB(20, 20, 20),
    FrameBgTransparency = 0.3,
    FrameBgActive = Color3.fromRGB(40, 40, 40),
    FrameBgTransparencyActive = 0.3,
    CheckMark = Color3.fromRGB(180, 100, 40),
    SliderGrab = Color3.fromRGB(180, 100, 40),
    ButtonsBg = Color3.fromRGB(100, 50, 20),
    CollapsingHeaderBg = Color3.fromRGB(50, 25, 10),
    CollapsingHeaderText = Color3.fromRGB(255, 255, 255),
    RadioButtonHoveredBg = Color3.fromRGB(180, 100, 40),
    WindowBg = Color3.fromRGB(15, 15, 15),
    TitleBarBg = Color3.fromRGB(15, 15, 15),
    TitleBarBgActive = Color3.fromRGB(30, 30, 30),
    Border = Color3.fromRGB(50, 25, 10),
    ResizeGrab = Color3.fromRGB(50, 25, 10),
    RegionBgTransparency = 1,
    TabBg = Color3.fromRGB(252, 50, 1),
    TabBgActive = Color3.fromRGB(252, 100, 1),
}

--// Interface size adj
local Exploit = ImGui:TabsWindow({
        Title = "Candy Farm - Halloween 2025 🎃",
        Size = UDim2.fromOffset(254, 308), --// old: 254, 200
        Position = UDim2.new(0.5, 7, 0.5, -100),
        NoClose = true,
    })

    ImGui:DefineTheme("baseTemplate", baseTemplate)
    Exploit:SetTheme("baseTemplate")

    
--// tabs
local Method1 = Exploit:CreateTab({
	Name = "Method 1",
})

local Method2 = Exploit:CreateTab({
	Name = "Method 2",
})

local Info = Exploit:CreateTab({
	Name = "Info",
})

local Credit = Exploit:CreateTab({
	Name = "Credit",
})

--// funcs
local function joindiscord() --// thanks hahaxio
    local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    if requestFunc then
        pcall(function()
            requestFunc({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = game.HttpService:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = game.HttpService:GenerateGUID(false),
                    args = {code = "eyUFHKV2cM"}
                })
            })
        end)
    end
end

--// AutoFarm
local function enableAntiAFK()
    if not connection then
        connection = player.Idled:Connect(function()
            if getgenv().afk6464 then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        end)
    end
end

function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

queueteleport =  missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or queueonteleport)

local function disableAntiAFK()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

local function loop()
    while FcMaster do
        if getgenv().afk6464 then
            enableAntiAFK()
        else
            disableAntiAFK()
        end
        wait(4)
    end
end

spawn(loop)

if not getgenv().afk6464 then
    getgenv().afk6464 = false
end

local connection
local Pool = {}

local function ResetScript()
    hidegui = false
    FarmBool = false
    FCMASTER = false
    Exploit:Remove()
    connection:Disconnect()
    Pool = {}
end

local function Force(part, ws)
    if Pool[part] then return end

    Pool[part] = RunService.Heartbeat:Connect(function()
        if not FarmBool or not part or not part.Parent then
            Pool[part]:Disconnect()
            Pool[part] = nil
            return
        end
        part.CFrame = hrp.CFrame
        part.Size = Vector3.new(10, 10, 10)
        part.CanCollide = false
        part.Transparency = 1

        if ws ~= 0 then
            character:WaitForChild("Humanoid").WalkSpeed = ws
        end

    end)
end

local function AutoFarm()
    local ws = character:WaitForChild("Humanoid").WalkSpeed
    local h = Houses:GetDescendants()
    for _, sdf in ipairs(h) do
        if sdf.Name == "DoorInnerTouch" and sdf:IsA("BasePart") then
            if not sdf:GetAttribute("Forced") then
                a = a + 1
                Force(sdf, ws)
                sdf:SetAttribute("Forced", true)
            end
        end
    end

    for _, sdf in ipairs(h) do
        if sdf.Name == "GiantHand" then
            sdf:Destroy()
        end
    end

end

connection = Houses.ChildAdded:Connect(function()
    if not FarmBool then return end
    task.wait(0.3)
    AutoFarm()
end)

--// BackPack ns tff
spawn(function()
    while FCMASTER do
        if hidegui then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.ItemGained.DisplayGainedItem.LocalScript.Disabled = true
            end)
        else
            game:GetService("Players").LocalPlayer.PlayerGui.ItemGained.DisplayGainedItem.LocalScript.Disabled = false
        end
        task.wait(0.05)
    end
end)

Method1:Separator({Text="Candy Farm [This server only]"})

local AntiAfkToggle = Method1:Checkbox({
	Label = "Anti-Afk",
	Value = true,
	Callback = function(self, Value)
		getgenv().afk6464 = Value
	end,
})

local qzd = Method1:Checkbox({
	Label = "Hide Boring UI",
	Value = false,
	Callback = function(self, Value)
        hidegui = Value
	end,
})

local farm = Method1:Button({
	Text = "Start Candy Farm",
    --BackgroundColor3 = Color3.fromRGB(80, 200, 90), --// Color3.fromRGB(245, 60, 60) red
    Size = UDim2.new(1, 0, 0, 40),
    NoTheme = false,
	Callback = function(self)
        if not FarmBool then
            self.BackgroundColor3 = Color3.fromRGB(245, 60, 60)
            self.Text = "Stop Candy Farm"
        else
            self.BackgroundColor3 = Color3.fromRGB(252, 100, 1)
            self.Text = "Start Candy Farm"
        end

        FarmBool = not FarmBool
        AutoFarm()
	end,
})

farm.BackgroundColor3 = Color3.fromRGB(252, 100, 1)

Method1:Separator({Text="Stats"})

local T_Elapsed_Label = Method1:Label({
                            Text = "Time Elapsed: 00:00:00",
                        })

local elapsedSeconds = 0
local tracking = false
local function Labelform(sec)
    local h = math.floor(sec / 3600)
    local m = math.floor((sec % 3600) / 60)
    local s = sec % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

    local UserInventory = {}
    local Inventory = player.Data

    for _, child in pairs(Inventory:GetChildren()) do
        if child:IsA("IntValue") then

            UserInventory[child.Name] = child.Value
        end
    end

    local Numberofhouse = Method1:Label({
                            Text = "Total House: 0",
                        })

local numberoffakehouse = Method1:Label({
                            Text = "Total fake House: 0",
                        })

local numberofcandy = Method1:Label({
                            Text = "Total Candy: 0",
                        })

local candyblue = Method1:Label({
                            Text = "Blue candy: 0",
                        })

local candyyellow = Method1:Label({
                            Text = "Yellow Candy: 0",
                        })
local candypurple = Method1:Label({
                            Text = "Purple Candy: 0",
                        })

spawn(function()
    while FCMASTER do 
        if FarmBool then
            tracking = true
            elapsedSeconds = elapsedSeconds + 1
            T_Elapsed_Label.Text = "Time Elapsed: " .. Labelform(elapsedSeconds)

            --//stats
            local blue = Players.LocalPlayer.Data.CandyBlue.Value
            local yellow = Players.LocalPlayer.Data.CandyOrange.Value
            local purple = Players.LocalPlayer.Data.CandyPurple.Value
            d = blue - UserInventory["CandyBlue"]
            e = yellow - UserInventory["CandyOrange"]
            f = purple - UserInventory["CandyPurple"]

            c = d + e + f
            b = a - c

            Numberofhouse.Text = string.format("Total House: %d", a)
            numberoffakehouse.Text = string.format("Total fake House: %d", b)
            numberofcandy.Text = string.format("Total Candy: %d", c)
            candyblue.Text = string.format("Blue candy: %d", d)
            candyyellow.Text = string.format("Yellow Candy: %d", e)
            candypurple.Text = string.format("Purple Candy: %d", f)
        else
            tracking = false
        end
        task.wait(1)
    end
end)

Credit:Button({
	Text = "Unload Script",
    Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(245, 60, 60),
	Callback = function(self)
        ResetScript()
	end,
})

Credit:Separator({Text="misc"})

Credit:Button({
        Text = "Join Discord",
        Size = UDim2.fromScale(1, 0),
        NoTheme = true,
        BackgroundColor3 = Color3.fromRGB(252, 130, 1),
        Callback = function()
            setclipboard("https://discord.gg/eyUFHKV2cM")
            pcall(function() joindiscord() end)
        end,
    })

local JobId = game.JobId
local PlaceId = game.PlaceId
local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))

httprequest =  missing("function", request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request))

Credit:Button({
	Text = "Server Hop", --// IY Shop script
    Size = UDim2.fromScale(1, 0),
    BackgroundColor3 = Color3.fromRGB(252, 75, 1),
	Callback = function(self)
        wait(0.2)
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", 537413528)})
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end
        
        if #servers > 0 then
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/CandyFarm.lua'))()")
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
        end
	end,
})


Method2:Separator({Text="Candy Farm [Server Hop]"})

Method2:Button({
	Text = "Start Candy Farm",
    BackgroundColor3 = Color3.fromRGB(252, 100, 1), --// Color3.fromRGB(245, 60, 60) red
    Size = UDim2.new(1, 0, 0, 40),
    NoTheme = false,
	Callback = function(self)
            self.Text = "Started!"
            AutoFarm()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/LoopCandyFarm.lua'))()
	end,
})

Method2:Separator({
	Text = "Important:"
})

Method2:Label({
    TextWrapped = true,
    Text = "This method claim houses and then change server. It is the most efficient way to farm candy. <b>Not all executors support it.</b> If you want to play babft while farming candy, use method 1.\n\nOnce you start it, the only way to stop it is to <b>close Roblox.</b> The interface will not appear in the next server, <b>but it will continue to farm.</b>",
    RichText = true
})

Credit:Separator({
	Text = "Owner"
})

Credit:Label({
	Text = " @thereal_asu - Asu"
})

Credit:Separator({
	Text = "Library"
})

Credit:Label({
	Text = " Dear ReGui by Depthso <3"
})

Credit:Separator({
	Text = "Note"
})

Credit:Label({
    TextWrapped = true,
	Text = "If you want to use more script about Build A Boat For Treasure, join the discord! Cool stuff in here :)"
})

Info:Separator({
	Text = "Note"
})

Info:Label({
    TextWrapped = true,
    Text = "<b>DO NOT toggle 'Hide Boring UI'</b> while auto farming. <b>Enable it when there is no reward card on your screen</b>. Tap the big green button and the magic happens. It claims all the houses instantly, without you seeing anything happen.\n",
    RichText = true
})

Info:Label({
    TextWrapped = true,
    TextColor3 = Color3.fromRGB(252, 100, 1),
    Text = "<b>Basically, you can do other things at the same time as farming candy.</b>\n",
    RichText = true
})

Info:Separator({
	Text = "About this script"
})

Info:Label({
    TextWrapped = true,
	Text = "This script is free and keyless. It's also open source." --// if you skid, make sure to credit me and it will be okay :)
})
