local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local PlaceName = game:GetService("AssetService"):GetGamePlacesAsync(game.GameId):GetCurrentPage()[1].Name
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

getfenv().getgenv().PlaceName = PlaceName

local Window

Rayfield:Notify({
        Title = "UNIX Loaded",
        Content = "Exploiting Shitty Games.. ",
        Duration = 6.5,
        Image = "eye"
})

Window = Rayfield:CreateWindow({
        Name = "U N I X - " .. PlaceName,
        LoadingTitle = "U N I X - " .. PlaceName,
        LoadingSubtitle = "by 0x256",
        Theme = "Default",
        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true,
        ConfigurationSaving = {
            Enabled = true,
            FileName = "UNIX-" .. PlaceName
        },

        Discord = {
            Enabled = true,
            Invite = "2sZV8k3B97",
            RememberJoins = true
        },
})

local moneyLoop = false
local farmWinsLoop = false
local instantDrill = false
local goldenEggExploit = false
local maxDrillRange = false
local autoOpenEgg = false
local eggOptions = {}
local eggAmount = 1 


-- Retarded Announcement / LOL

firesignal(game:GetService("ReplicatedStorage").AnnouncementEvent.OnClientEvent, "Thanks for using Unix Hub, Make sure to join our discord")

-- Egg Dropdown / Cost 

if workspace:FindFirstChild("KPets") and workspace.KPets:FindFirstChild("Eggs") then
    for _, egg in pairs(workspace.KPets.Eggs:GetChildren()) do
        if egg:IsA("Model") then
            local replicatedEgg = game:GetService("ReplicatedStorage").KPets.Eggs:FindFirstChild(egg.Name)
            if replicatedEgg and replicatedEgg:FindFirstChild("Cost") then
                local costValue = replicatedEgg.Cost.Value
                local formattedCost = costValue >= 1e12 and string.format("%d", costValue):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
                    or costValue >= 1e9 and string.format("%.1f Bil", costValue/1e9)
                    or costValue >= 1e6 and string.format("%.1f Mil", costValue/1e6)
                    or costValue >= 1e3 and string.format("%.1f K", costValue/1e3)
                    or string.format("%d", costValue)
                table.insert(eggOptions, egg.Name .. " (" .. formattedCost .. ")")
            end
        end
    end
end

local function OpenInvite()
    local InviteCode = "2sZV8k3B97"
    local request = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    if request then
        request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                cmd = "INVITE_BROWSER",
                args = {code = InviteCode},
                nonce = HttpService:GenerateGUID(false)
            })
        })
    end
end

OpenInvite()

Exploit = Window:CreateTab("Exploits", "eye")

Exploit:CreateSection("Drill")

Exploit:CreateSlider({
    Name = "Drill Power Multiplier",
    Range = {0, 10},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 10,
    Flag = "DrillPower",
    Callback = function(Value)
        pcall(function()
            local DrillPowerMultiplier = LocalPlayer:FindFirstChild("DrillPowerMultiplier")
            if DrillPowerMultiplier then
                DrillPowerMultiplier.Value = Value
            end
        end)
    end,
})

Exploit:CreateToggle({
    Name = "Instant Drill",
    Default = false,
    Flag = "InstantDrill",
    Callback = function(Value)
        instantDrill = Value
        if instantDrill then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                tool:SetAttribute("DigSpeed", 0)
            end
        else 
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                tool:SetAttribute("DigSpeed", 1)
            end
        end
    end,
})

Exploit:CreateToggle({
    Name = "Max Drill Range",
    Default = false,
    Flag = "MaxDrillRange",
    Callback = function(Value)
        maxDrillRange = Value
        if maxDrillRange then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                tool:SetAttribute("DigSize", 1200)
            end
        else 
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                tool:SetAttribute("DigSize", 10)
            end
        end
    end,
})

Exploit:CreateSection("Money / Wins")

Exploit:CreateToggle({
    Name = "Farm Money (Better pets = more money)",
    Default = false,
    Callback = function(Value)
        moneyLoop = Value
        
        if Value then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local tool = character:FindFirstChildOfClass("Tool")
            if not tool then
                tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                if tool then
                    Rayfield:Notify({
                        Title = "Warning",
                        Content = "Please equip your drill",
                        Duration = 5,
                        Image = "eye"
                    })
                    return
                end
            end
            
            if tool then
                Rayfield:Notify({
                    Title = "Success",
                    Content = "Get better pets to get more money!",
                    Duration = 5,
                    Image = "eye"
                })
                while moneyLoop do
                    local args = { [1] = game:GetService("Players").LocalPlayer.Character[tool.Name] }
                    game:GetService("ReplicatedStorage"):WaitForChild("GiveCash"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            else 
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Please have a drill, Better pets will give you more money",
                    Duration = 5,
                    Image = "eye"
                })
            end
        end
    end
})

Exploit:CreateToggle({
    Name = "Farm Wins",
    Default = false,
    Callback = function(Value)
        farmWinsLoop = Value
        
        if Value then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = character:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                local touchParts = {
                    workspace.Worlds.Dinosaur.EndZone.EndCircle.Part,
                    workspace.Worlds.Frozen.EndZone.EndCircle.Part,
                    workspace.Worlds.Jungle.EndZone.EndCircle.Part,
                    workspace.Worlds.Magic.EndZone.EndCircle.Part,
                    workspace.Worlds.Main.EndZone.EndCircle.Part
                }
                
                local function fireTouches()
                    for _, part in ipairs(touchParts) do
                        firetouchinterest(hrp, part, 0)
                        task.wait(0.5)
                        firetouchinterest(hrp, part, 1)
                    end
                end
                
                while farmWinsLoop do
                    fireTouches()
                    task.wait(3)
                end
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Failed to find Player idk why lol... load in lil nigga",
                    Duration = 5,
                    Image = "eye"
                })
            end
        end
    end
})

Exploit:CreateSection("Eggs")

local EggDropdown = Exploit:CreateDropdown({
    Name = "Select Egg",
    Options = eggOptions,
    CurrentOption = eggOptions[1],
    MultipleOptions = false,
    Flag = "EggSelector",
    Callback = function(Selected)
    end,
})

local EggInput = Exploit:CreateSlider({
    Name = "Egg Amount (dont need a gamepass)",
    Range = {1, 20},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "Egg",
    Callback = function(Amount)
        eggAmount = Amount
    end,
})

local ExploitGolden = Exploit:CreateToggle({
    Name = "Golden Egg Exploit (Every Egg will hatch into a golden pet)",
    Default = false,
    Flag = "GoldenEggExploit",
    Callback = function(Value)
        goldenEggExploit = Value
    end,
})

Exploit:CreateToggle({
    Name = "Auto Open Egg",
    Default = false,
    Flag = "AutoOpenEgg",
    Callback = function(Value)
        autoOpenEgg = Value

        if goldenEggExploit then
            Rayfield:Notify({
                Title = "Success",
                Content = "After you hatching, Please hatch a normal egg, to fix the UI being broken",
                Duration = 5,
                Image = "eye"
            })
        end

        
        while autoOpenEgg do
            local NewEgg = nil

            local selectedOption = EggDropdown.CurrentOption
            local selectedEgg = type(selectedOption) == "table" and selectedOption[1] or selectedOption
            selectedEgg = selectedEgg and string.match(selectedEgg, "^[^(]+"):gsub("%s+$", "")

            local openAmount = eggAmount
            
            if selectedEgg then

                if goldenEggExploit then
                    NewEgg = "Golden " .. selectedEgg

                else
                    NewEgg = selectedEgg
                end

                local args = {
                    [1] = NewEgg,
                    [2] = openAmount
                }

                table.foreach(args, print)
                game:GetService("ReplicatedStorage"):WaitForChild("KPets"):WaitForChild("Events"):WaitForChild("Hatch"):FireServer(unpack(args))
            end
            task.wait(0.1)
        end
    end,
})
