

_G.ARK_ANTI_PIRATE = true

local success, remoteData = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/zxkuhl/ARK_HUB/main/ark_codes.txt")
end)

local localA = "19582749284729174918274819274"
local localB = "92837492837492837492837492837"


local remoteA, remoteB
if success and remoteData then
    local lines = remoteData:split("\n")
    remoteA = lines[1]
    remoteB = lines[2]
end

local Player = game:GetService("Players").LocalPlayer

if not success or remoteA ~= localA or remoteB ~= localB then
    Player:Kick("PIRATING IS ILLEGAL\nIS UP TO 250,000 DOLLARS AND 5 YEARS IN JAIL.")
    while true do task.wait() end
end


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "ARK",
    Icon = 10180536602,
    LoadingTitle = "ARK",
    LoadingSubtitle = "By zxkuhl",
    Theme = "Default",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ARK_AC",
        FileName = "ARK_HUB"
    },
    Discord = {
        Enabled = true,
        Invite = "KPUPp4m9pJ",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "KEY",
        Subtitle = "Enter key",
        Note = "Get key in Discord",
        FileName = "KEY_FILE",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Jcheeks130"}
    }
})


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

----------------------------------------------------
---------------------- MAIN TAB --------------------
----------------------------------------------------
local MainTab = Window:CreateTab("MAIN", 4483362458)
local MainSection = MainTab:CreateSection("MAIN FEATURES")

if not _G.ARK_ANTI_PIRATE then
    local Player = game:GetService("Players").LocalPlayer
    Player:Kick("PIRATING IS ILLEGAL")
    while true do end
end

-- Buttons
MainTab:CreateButton({
    Name = "Infinite Yield",
    SectionParent = MainSection,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
    end
})

MainTab:CreateButton({
    Name = "Fly",
    SectionParent = MainSection,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        end)
    end
})

MainTab:CreateButton({
    Name = "Dark Dex",
    SectionParent = MainSection,
    Callback = function()
        pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
        end)
    end
})



----------------------------------------------------
------------------ ARK PROTECTION ------------------
----------------------------------------------------
local ARK_Protection_Enabled = false

MainTab:CreateToggle({
    Name = "ARK Protection",
    CurrentValue = false,
    SectionParent = MainSection,
    Flag = "ARK_Protection",
    Callback = function(state)
        ARK_Protection_Enabled = state
        if state then
            Rayfield:Notify({
                Title = "ARK Protection",
                Content = "Client protection activated.",
                Duration = 5,
                Image = 8248378219
            })
            print("ARK Protection: ENABLED")

            -- Kick prevention
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local oldNamecall = mt.__namecall
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if ARK_Protection_Enabled and (method == "Kick" or method == "kick") then
                    return nil
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)

            -- Humanoid protection (fixed: movement now works)
            task.spawn(function()
                while ARK_Protection_Enabled do
                    local char = LocalPlayer.Character
                    if char then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then
                            -- Keep health safe but allow normal movement
                            hum.Health = math.max(hum.Health, 5)
                            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                            hum.BreakJointsOnDeath = false
                        end
                    end
                    task.wait(0.5)
                end
            end)


            task.spawn(function()
                local lastTick = 0
                local spamCount = 0
                while ARK_Protection_Enabled do
                    if tick() - lastTick < 0.01 then
                        spamCount += 1
                        if spamCount > 50 then
                            warn("⚠ Crash remote spam detected — blocked")
                            spamCount = 0
                        end
                    else
                        spamCount = 0
                    end
                    lastTick = tick()
                    task.wait()
                end
            end)
        else
            Rayfield:Notify({
                Title = "ARK Protection",
                Content = "Protection disabled.",
                Duration = 5,
                Image = 8248378219
            })
            print("ARK Protection: DISABLED")
        end
    end
})

-- Section
local InteractionSection = MainTab:CreateSection("Player Interaction")

-----------------------------
-- 2️⃣ Health Bar Overlay
-----------------------------
local HealthOverlayEnabled = false
local healthOverlays = {}

local function UpdateHealthBars()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            if not healthOverlays[player] then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "HealthBarOverlay"
                billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChildWhichIsA("BasePart")
                billboard.Size = UDim2.new(0,100,0,10)
                billboard.StudsOffset = Vector3.new(0,3,0)
                billboard.AlwaysOnTop = true
                local bar = Instance.new("Frame")
                bar.BackgroundColor3 = Color3.fromRGB(0,255,0)
                bar.Size = UDim2.new(1,0,1,0)
                bar.Parent = billboard
                billboard.Parent = game.CoreGui
                healthOverlays[player] = {Gui=billboard, Bar=bar}
            end
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                healthOverlays[player].Bar.Size = UDim2.new(math.clamp(hum.Health/hum.MaxHealth,0,1),0,1,0)
            end
        end
    end
end

MainTab:CreateToggle({
    Name = "Health Bar Overlay",
    CurrentValue = false,
    SectionParent = InteractionSection,
    Callback = function(state)
        HealthOverlayEnabled = state
        if state then
            task.spawn(function()
                while HealthOverlayEnabled do
                    UpdateHealthBars()
                    task.wait(0.2)
                end
            end)
        else
            for _, data in pairs(healthOverlays) do
                data.Gui:Destroy()
            end
            healthOverlays = {}
        end
    end
})

-----------------------------
-- 3️⃣ Player Tracker
-----------------------------
local TrackerEnabled = false
local trackerLabels = {}

local function UpdatePlayerTracker()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not trackerLabels[player] then
                local label = Instance.new("BillboardGui")
                label.Name = "PlayerTracker"
                label.Adornee = player.Character.HumanoidRootPart
                label.Size = UDim2.new(0,150,0,20)
                label.StudsOffset = Vector3.new(0,5,0)
                label.AlwaysOnTop = true
                local textLabel = Instance.new("TextLabel")
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(255,255,255)
                textLabel.TextStrokeTransparency = 0
                textLabel.Size = UDim2.new(1,0,1,0)
                textLabel.TextScaled = true
                textLabel.Text = player.Name
                textLabel.Parent = label
                label.Parent = game.CoreGui
                trackerLabels[player] = textLabel
            end
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                trackerLabels[player].Text = player.Name.." | X:"..math.floor(hrp.Position.X).." Y:"..math.floor(hrp.Position.Y).." Z:"..math.floor(hrp.Position.Z)
            end
        end
    end
end

MainTab:CreateToggle({
    Name = "Player Tracker",
    CurrentValue = false,
    SectionParent = InteractionSection,
    Callback = function(state)
        TrackerEnabled = state
        if state then
            task.spawn(function()
                while TrackerEnabled do
                    UpdatePlayerTracker()
                    task.wait(0.3)
                end
            end)
        else
            for _, label in pairs(trackerLabels) do
                label.Parent:Destroy()
            end
            trackerLabels = {}
        end
    end
})

----------------------------------------------------
------------------ ANTI CLIENT CHECK ---------------
----------------------------------------------------
local AntiClientEnabled = false

MainTab:CreateToggle({
    Name = "Anti Client Check",
    CurrentValue = false,
    SectionParent = MainSection,
    Flag = "ANTI_CLIENT",
    Callback = function(state)
        AntiClientEnabled = state
        if state then
            Rayfield:Notify({
                Title = "Anti Client Check",
                Content = "Anti-exploit measures active.",
                Duration = 5,
                Image = 8248378219
            })
            print("Anti Client Check: ENABLED")

            task.spawn(function()
                local mt = getrawmetatable(game)
                setreadonly(mt, false)
                local oldNamecall = mt.__namecall
                mt.__namecall = newcclosure(function(self, ...)
                    local method = getnamecallmethod()
                    if AntiClientEnabled and (method == "FireServer" or method == "InvokeServer") then
                        return nil
                    end
                    return oldNamecall(self, ...)
                end)
                setreadonly(mt, true)
            end)
        else
            Rayfield:Notify({
                Title = "Anti Client Check",
                Content = "Anti-exploit measures disabled.",
                Duration = 5,
                Image = 8248378219
            })
            print("Anti Client Check: DISABLED")
        end
    end
})

----------------------------------------------------
---------------------- GAME TAB --------------------
----------------------------------------------------
local GameTab = Window:CreateTab("GAME", 4483362458 )
local GameSection = GameTab:CreateSection("Game Info")

if not _G.ARK_ANTI_PIRATE then
    local Player = game:GetService("Players").LocalPlayer
    Player:Kick("PIRATING IS ILLEGAL")
    while true do end
end

local Toggle = GameTab:CreateToggle({
    Name = "Player /kick/ban/join/leave/ Notifications",
    CurrentValue = false,
    Flag = "PlayerNotifyToggle",
    Callback = function(Value)
        if Value then
            -- ENABLE notifier
       loadstring(game:HttpGet("https://raw.githubusercontent.com/zxkuhl/Player-notifier/main/Nodification%20system"))()
        else
            -- DISABLE notifier (optional)
            print("Player notifier disabled")
        end
    end,
})

local success, productInfo = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)

local gameName = (success and productInfo and productInfo.Name) or "Unknown"
local gameNameBox = GameTab:CreateLabel("Game Name: " .. gameName)
local currentPlayersBox = GameTab:CreateLabel("[moment of local player join] Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers)
local localPlayerBox = GameTab:CreateLabel("Local Player: " .. LocalPlayer.DisplayName .. " (" .. LocalPlayer.Name .. ")")
local pingBox = GameTab:CreateLabel("Ping: Unbound")
local timeSinceStartBox = GameTab:CreateLabel("Time Since Start: 0s")

local startTime = tick()
RunService.RenderStepped:Connect(function()
    currentPlayersBox:SetText("Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers)
    timeSinceStartBox:SetText("Time Since Start: " .. math.floor(tick() - startTime) .. "s")
end)

----------------------------------------------------
---------------------- INFO TAB --------------------
----------------------------------------------------

local InfoTab = Window:CreateTab("INFO", 4483362458)
local InfoSection = InfoTab:CreateSection("ARK HUB INFORMATION")

if not _G.ARK_ANTI_PIRATE then
    local Player = game:GetService("Players").LocalPlayer
    Player:Kick("PIRATING IS ILLEGAL")
    while true do end
end

InfoTab:CreateLabel("ARK Hub — Made by zxkuhl PIRATING IS ILLEGAL DO NOT COPY MY WORK MAKE YOUR OWN!")
InfoTab:CreateLabel("Version: 3.9")
InfoTab:CreateLabel("UPDATE LOG: added new tabs as well as new features ")
InfoTab:CreateLabel("DISCORD SERVER: KittyScripts.")

InfoTab:CreateButton({
    Name = "Copy Discord Invite",
    SectionParent = InfoSection,
    Callback = function()
        setclipboard("https://discord.gg/KPUPp4m9pJ")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord invite copied to clipboard.",
            Duration = 3
        })
    end
})

local SocialsSection = InfoTab:CreateSection("SOCIALS")

InfoTab:CreateButton({
    Name = "TIKTOK[copy and paste]",
    SectionParent = SocialsSection,
    Callback = function()
        setclipboard("https://www.tiktok.com/@zxkuhl")
Rayfield:Notify({
            Title = "Copied!",
            Content = "TikTok link copied copied to clipboard, paste in browser!",
            Duration = 3
        })
    end
})

InfoTab:CreateButton({
    Name = "ROBLOX[copy and paste]",
    SectionParent = SocialsSection,
    Callback = function()
        setclipboard("https://www.roblox.com/users/1885859525/profile")
    Rayfield:Notify({
            Title = "Copied!",
            Content = "Roblox link copied copied to clipboard, paste in browser!",
            Duration = 3
        })
    end
})

InfoTab:CreateButton({
    Name = "YOUTUBE [copy and paste]",
    SectionParent = SocialsSection,
    Callback = function()
        setclipboard("https://www.youtube.com/@zxkuhl")
    Rayfield:Notify({
            Title = "Copied!",
            Content = "YouTube link copied copied to clipboard, paste in browser!",
            Duration = 3
        })
    end
})

----------------------------------------------------
--------------- LOCAL PLAYER TAB -------------------
----------------------------------------------------
local LocalTab = Window:CreateTab("LOCAL PLAYER", 4483362458)
local LPSection = LocalTab:CreateSection("Player Mods")

if not _G.ARK_ANTI_PIRATE then
    local Player = game:GetService("Players").LocalPlayer
    Player:Kick("PIRATING IS ILLEGAL")
    while true do end
end

local AntiRagdollEnabled = false

LocalTab:CreateToggle({
    Name = "Anti Ragdoll / Sit / Fling/",
    CurrentValue = false,
    SectionParent = LPSection,
    Callback = function(state)
        AntiRagdollEnabled = state
        if state then
            task.spawn(function()
                while AntiRagdollEnabled do
                    if LocalPlayer.Character then
                        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if hum then
                            -- Anti ragdoll / sit
                            hum.Sit = false
                            hum.PlatformStand = false
                            -- Anti fling (keep velocity zeroed)
                            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.Velocity = Vector3.zero
                                hrp.RotVelocity = Vector3.zero
                            end
                        end
                    end
                    task.wait(0) -- enforce constantly
                end
            end)
        end
    end
})

LocalTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    SectionParent = LPSection,
    Callback = function(v)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    end
})

LocalTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 300},
    Increment = 1,
    CurrentValue = 50,
    SectionParent = LPSection,
    Callback = function(v)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = v
        end
    end
})

LocalTab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    SectionParent = LPSection,
    Callback = function(v)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local h = LocalPlayer.Character.Humanoid
            if v then
                h.MaxHealth = math.huge
                h.Health = math.huge
            else
                h.MaxHealth = 100
                h.Health = 100
            end
        end
    end
})

LocalTab:CreateButton({
    Name = "Infinite Jump (SPAM JUMP FOR IT TO WORK)",
    SectionParent = LPSection,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
        end)
    end
})

LocalTab:CreateButton({
    Name = "Become Invisible",
    SectionParent = LPSection,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
        end)
    end
})

----------------------------------------------------
------------------ TOOLS TAB -----------------------
----------------------------------------------------
local ToolsTab = Window:CreateTab("TOOLS", 4483362458)
local ToolsSection = ToolsTab:CreateSection("Utilities")

if not _G.ARK_ANTI_PIRATE then
    local Player = game:GetService("Players").LocalPlayer
    Player:Kick("PIRATING IS ILLEGAL")
    while true do end
end

ToolsTab:CreateButton({
    Name = "Spectate Player",
    Callback = function()
       local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v51,v52) local v53=0;local v54;while true do if ((0 + 0)==v53) then v54={};for v75=2 -1 , #v51 do v6(v54,v0(v4(v1(v2(v51,v75,v75 + 1 )),v1(v2(v52,(2 -1) + (v75% #v52) ,(1 -0) + (v75% #v52) + 1 + 0 )))%(1253 -(915 + 82)) ));end v53=2 -1 ;end if (v53==1) then return v5(v54);end end end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=game.Workspace.CurrentCamera;local v10=v8.LocalPlayer;local v11=game:GetService(v7("\22\222\47\215\213\45\221\63\209\207\38\223\60\204\255\38","\156\67\173\74\165"));local v12=Instance.new(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70"),v10:WaitForChild(v7("\96\26\35\11\251\66\49\55\27","\158\48\118\66\114")));local v13=Instance.new(v7("\159\33\8\34\81\176\239\191\43\30","\155\203\68\112\86\19\197"),v12);v13.Size=UDim2.new((0 + 0) -(0 -0) ,391 -291 ,(1187 -(1069 + 118)) -0 ,(199 -111) -(104 -56) );v13.Position=UDim2.new(0 + 0 ,14 -4 ,(0 -0) + 0 + 0 ,(835 -(368 + 423)) -(106 -72) );v13.Text="Menu ";v13.BackgroundColor3=Color3.fromRGB(18 -(10 + 8) ,(526 -389) + 13 ,576 -(763 -(416 + 26)) );v13.TextColor3=Color3.fromRGB(814 -559 ,110 + 145 ,450 -195 );v13.Draggable=true;v13.Active=true;local v21=Instance.new(v7("\96\207\55\241\69","\152\38\189\86\156\32\24\133"),v12);v21.Size=UDim2.new((1851 -(145 + 293)) -((877 -(44 + 386)) + (2452 -(998 + 488))) ,(174 + 373) -(285 + 62) ,772 -(201 + 571) ,2117 -((2841 -(116 + 1022)) + (474 -360)) );v21.Position=UDim2.new(702 -(221 + 155 + (1186 -861)) , -((1221 -877) -134),(859.5 -(814 + 45)) -0 , -((105 -62) + 6 + 101));v21.BackgroundColor3=Color3.fromRGB((39 + 71) -60 ,(949 -(261 + 624)) -((15 -6) + (1085 -(1020 + 60))) ,426 -((1508 -(630 + 793)) + 291) );v21.Visible=false;local v26=Instance.new(v7("\200\82\191\82\222\66\179\82\243\89","\38\156\55\199"),v21);v26.Size=UDim2.new((4286 -3021) -(243 + (4838 -3816)) ,(45 + 69) -84 ,0 -0 ,1777 -(760 + 987) );v26.Position=UDim2.new(1, -(25 + 5),(3093 -(1789 + 124)) -((1889 -(745 + 21)) + 20 + 37) ,0 -0 );v26.Text="X";v26.BackgroundColor3=Color3.fromRGB((639 -476) + 1 + 36 ,0,254 -(163 + 91) );v26.TextColor3=Color3.fromRGB(201 + 54 ,(3240 -(87 + 968)) -((8227 -6358) + 56 + 5) ,72 + (413 -230) );local v32=Instance.new(v7("\156\120\100\60\49\97\238\87\167\115","\35\200\29\28\72\115\20\154"),v21);v32.Size=UDim2.new(1, -((1518 -(447 + 966)) -(205 -130)),0 -0 ,5 + 25 );v32.Position=UDim2.new((1817 -(1703 + 114)) -0 ,(701 -(376 + 325)) + 0 ,1474 -(1329 + (237 -92)) ,(2987 -2016) -(41 + 99 + 831) );v32.Text=v7("\42\186\221\218\142\56\116\24\255\193\211\140\53\49\11","\84\121\223\177\191\237\76");local v36=Instance.new(v7("\136\85\219\175\54\92\57\207\188\112\219\161\55\85","\161\219\54\169\192\90\48\80"),v21);v36.Size=UDim2.new(1,(4074 -2224) -((1423 -(9 + 5)) + 441) ,(1095 -(85 + 291)) -((1280 -(243 + 1022)) + 703) , -(19 + (79 -58)));v36.Position=UDim2.new((362 + 76) -(262 + 176) ,(2901 -(1123 + 57)) -(281 + 64 + (1630 -(163 + 91))) ,(2618 -(1869 + 61)) -(56 + 142 + 490) ,176 -(478 -342) );v36.CanvasSize=UDim2.new((0 -0) -0 ,0 + 0 ,0 -0 ,0 + 0 );v36.ScrollBarThickness=1211 -((2170 -(1329 + 145)) + 510) ;local v41=Instance.new(v7("\124\107\44\44\90\86\44\36\80\77\21\49","\69\41\34\96"),v36);v41.SortOrder=Enum.SortOrder.LayoutOrder;local function v44() for v65,v66 in pairs(v36:GetChildren()) do if v66:IsA(v7("\136\198\207\30\32\62\168\215\216\4","\75\220\163\183\106\98")) then v66:Destroy();end end for v67,v68 in pairs(v8:GetPlayers()) do if (v68~=v10) then local v73=0;local v74;while true do if (v73==0) then local v77=971 -(140 + 831) ;while true do if (v77==(1850 -(1409 + 441))) then v74=Instance.new(v7("\54\191\147\35\251\23\174\159\56\215","\185\98\218\235\87"),v36);v74.Size=UDim2.new((719 -(15 + 703)) -0 ,(585 + 677) -((1529 -(262 + 176)) + (1892 -(345 + 1376))) ,(688 -(198 + 490)) + (0 -0) ,94 -(153 -89) );v77=1;end if (v77==1) then v73=1;break;end end end if (v73==2) then v74.TextColor3=Color3.fromRGB(1461 -(696 + 510) ,(1998 -1045) -((1470 -(1091 + 171)) + 79 + 411) ,(69 -47) + (772 -539) );v74.MouseButton1Click:Connect(function() v32.Text=v7("\248\44\34\229\202\171\223\53\41\225\132\234","\202\171\92\71\134\190")   .. v68.Name ;local v84=v68.Character;if (v84 and v84:FindFirstChild(v7("\1\212\33\137\39\206\37\140\27\206\35\156\25\192\62\156","\232\73\161\76"))) then v9.CameraSubject=v84:FindFirstChild(v7("\147\204\79\92\16\180\208\70\111\17\180\205\114\92\12\175","\126\219\185\34\61"));end end);break;end if (v73==(375 -(123 + 251))) then v74.Text=v68.Name;v74.BackgroundColor3=Color3.fromRGB((1152 -920) -162 ,444 -((821 -(208 + 490)) + 22 + 229) ,(155 + 192) -(1113 -(660 + 176)) );v73=1 + 1 ;end end end end game:GetService(v7("\63\218\95\96\106\114\225\192\25\199","\135\108\174\62\18\30\23\147")):SetCore(v7("\133\236\36\207\54\161\39\206\176\224\41\202\12\167\60\201","\167\214\137\74\171\120\206\83"),{[v7("\191\249\38\81\253","\199\235\144\82\61\152")]=v7("\52\6\188\40\19\23\173\46","\75\103\118\217"),[v7("\243\81\104\0","\126\167\52\16\116\217")]="by zxkuhl",[v7("\225\45\47\142","\156\168\78\64\224\212\121")]=v7("\21\236\189\218\15\251\168\204\93\161\234\218\30\254\160\147\38\253\182\203\19\168\172\202\90\191\246\159\81\190\245\154\86\187\241\158\80\190\244\154\65\249\248\159\82\190\227\198\90\191\240\158","\174\103\142\197")});Duration=(203.4 -(14 + 188)) + (675 -(534 + 141)) ;v36.CanvasSize=UDim2.new(0,(337 + 499) -(660 + 156 + 20) ,0 + 0 , #v8:GetPlayers() * ((8 -4) + (40 -14)) );end local function v45() local v56=0 -0 ;local v57;local v58;local v59;while true do if (v56==0) then v57=0 + 0 ;v58=nil;v56=1;end if ((1 + 0)==v56) then v59=nil;while true do if (v57==(397 -(115 + 281))) then while true do if (v58==(0 -0)) then v59=(168 + 34) -((33 -19) + 188) ;while true do if (v59==0) then v32.Text=v7("\101\45\83\61\38\74\184\87\104\79\52\36\71\253\68","\152\54\72\63\88\69\62");v9.CameraSubject=(v10.Character and v10.Character:FindFirstChild(v7("\252\209\227\93\218\203\231\88","\60\180\164\142"))) or v9 ;break;end end break;end end break;end if (v57==(0 -0)) then local v82=0;while true do if (v82==1) then v57=1;break;end if (v82==0) then v58=867 -(550 + 317) ;v59=nil;v82=1 -0 ;end end end end break;end end end local function v46() v21.Visible= not v21.Visible;end local v47=false;local v48,v49,v50;v13.InputBegan:Connect(function(v61) if (v61.UserInputType==Enum.UserInputType.MouseButton1) then local v69=0;local v70;while true do if (v69==(0 -0)) then v70=(1886 -1211) -(534 + (426 -(134 + 151))) ;while true do if (v70==((1665 -(970 + 695)) + (0 -0))) then local v85=1990 -(582 + 1408) ;while true do if (v85==(0 -0)) then v47=true;v49=v61.Position;v85=1;end if (v85==(1 -0)) then v70=(3 -2) + 0 ;break;end end end if (v70==((1825 -(1195 + 629)) + (0 -0))) then v50=v13.Position;break;end end break;end end end end);v13.InputChanged:Connect(function(v62) if (v62.UserInputType==Enum.UserInputType.MouseMovement) then v48=v62;end end);v13.InputEnded:Connect(function(v63) if (v63.UserInputType==Enum.UserInputType.MouseButton1) then v47=false;end end);v11.InputChanged:Connect(function(v64) if ((v64==v48) and v47) then local v71=(241 -(187 + 54)) -0 ;local v72;while true do if (v71==((780 -(162 + 618)) -(0 + 0))) then v72=v64.Position-v49 ;v13.Position=UDim2.new(v50.X.Scale,v50.X.Offset + v72.X ,v50.Y.Scale,v50.Y.Offset + v72.Y );break;end end end end);v26.MouseButton1Click:Connect(v45);v13.MouseButton1Click:Connect(v46);v8.PlayerAdded:Connect(v44);v8.PlayerRemoving:Connect(v44);v44();
    end
})

ToolsTab:CreateButton({
    Name = "Server Hop",
    SectionParent = ToolsSection,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))():Teleport(game.PlaceId)
        end)
    end
})

ToolsTab:CreateButton({
    Name = "Anti AFK",
    SectionParent = ToolsSection,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk"))()
        end)
    end
})

ToolsTab:CreateButton({
    Name = "Player Info (Console)",
    SectionParent = ToolsSection,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxkuhl/Player-info-grabber-/main/Grabber"))()
    end
})

ToolsTab:CreateButton({
    Name = "Open Teleport Menu",
    SectionParent = ToolsSection,
    Callback = function()
        pcall(function()
           local Gui = Instance.new("ScreenGui")
local BackGround = Instance.new("Frame")
local PlayerTextBox = Instance.new("TextBox")
local ExitGuiButton = Instance.new("TextButton")
local TeleportButton = Instance.new("ImageButton")
local FastTeleportButton = Instance.new("TextButton")


Gui.Name = "Gui"
Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.ResetOnSpawn = false

BackGround.Name = "BackGround"
BackGround.Parent = Gui
BackGround.Active = true
BackGround.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BackGround.BorderColor3 = Color3.fromRGB(27, 42, 53)
BackGround.BorderSizePixel = 0
BackGround.Draggable = true
BackGround.Position = UDim2.new(0.414194375, -35, 0.447971016, -5)
BackGround.Size = UDim2.new(0, 220, 0, 70)
BackGround.Active = true
BackGround.Draggable = true

PlayerTextBox.Name = "PlayerTextBox"
PlayerTextBox.Parent = BackGround
PlayerTextBox.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
PlayerTextBox.BorderColor3 = Color3.fromRGB(38, 38, 38)
PlayerTextBox.BorderSizePixel = 3
PlayerTextBox.Position = UDim2.new(0.0606889203, 0, 0.156255662, 0)
PlayerTextBox.Size = UDim2.new(0, 189, 0, 47)
PlayerTextBox.ClearTextOnFocus = false
PlayerTextBox.Font = Enum.Font.JosefinSans
PlayerTextBox.PlaceholderText = "Player Username"
PlayerTextBox.Text = ""
PlayerTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTextBox.TextScaled = true
PlayerTextBox.TextSize = 14.000
PlayerTextBox.TextWrapped = true

ExitGuiButton.Name = "ExitGuiButton"
ExitGuiButton.Parent = BackGround
ExitGuiButton.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
ExitGuiButton.BorderColor3 = Color3.fromRGB(50, 50, 50)
ExitGuiButton.BorderSizePixel = 3
ExitGuiButton.Position = UDim2.new(0.853980601, 0, -0.304931432, 0)
ExitGuiButton.Size = UDim2.new(0, 21, 0, 21)
ExitGuiButton.Font = Enum.Font.JosefinSans
ExitGuiButton.Text = "X"
ExitGuiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitGuiButton.TextSize = 14.000
ExitGuiButton.TextWrapped = true

TeleportButton.Name = "TeleportButton"
TeleportButton.Parent = BackGround
TeleportButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.BorderColor3 = Color3.fromRGB(50, 50, 50)
TeleportButton.BorderSizePixel = 3
TeleportButton.Position = UDim2.new(0.763071358, 0, -0.304931432, 0)
TeleportButton.Size = UDim2.new(0, 20, 0, 20)
TeleportButton.Image = "http://www.roblox.com/asset/?id=7676225854"

FastTeleportButton.Name = "FastTeleportButton"
FastTeleportButton.Parent = BackGround
FastTeleportButton.BackgroundColor3 = Color3.fromRGB(255, 64, 67)
FastTeleportButton.BorderColor3 = Color3.fromRGB(50, 50, 50)
FastTeleportButton.BorderSizePixel = 3
FastTeleportButton.Position = UDim2.new(0.672162294, 0, -0.304931402, 0)
FastTeleportButton.Size = UDim2.new(0, 20, 0, 20)
FastTeleportButton.Font = Enum.Font.SourceSans
FastTeleportButton.Text = ""
FastTeleportButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FastTeleportButton.TextSize = 14.000

--Hide Menu
local UIS = game:GetService("UserInputService")
local guiMode = true
local fastTpMode = false
local fastWhileMode = false

UIS.InputBegan:Connect(function (UserInput)
	if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Insert then
		if guiMode == true then
			Gui.Enabled = false
			guiMode = false
		else
			Gui.Enabled = true
			guiMode = true
		end
	end
end)

--Teleport
PlayerTextBox.FocusLost:Connect(function(enter)
	if enter then
		local boxText = PlayerTextBox.Text
		local plr1 = game.Players.LocalPlayer.Character
		local plr2 = game:GetService("Players"):FindFirstChild(boxText)

		plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame
	end
end)

--Exit Button
ExitGuiButton.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)

--Button Teleport
TeleportButton.MouseButton1Click:Connect(function()
	local playerText = PlayerTextBox.Text
	local p1 = game.Players.LocalPlayer.Character
	local p2 = game:GetService("Players"):FindFirstChild(playerText)

	p1.HumanoidRootPart.CFrame = p2.Character.HumanoidRootPart.CFrame
end)

--Fast Teleport
FastTeleportButton.MouseButton1Click:Connect(function()
	if fastTpMode == true then
		FastTeleportButton.BackgroundColor3 = Color3.fromRGB(255, 64, 67)
		fastTpMode = false
		if fastTpMode == false then
			fastWhileMode = false
		end
	else
		FastTeleportButton.BackgroundColor3 = Color3.fromRGB(67, 255, 67)
		fastTpMode = true
		if fastTpMode == true then
			fastWhileMode = true
			while fastWhileMode == true do
				wait()
				local plText = PlayerTextBox.Text
				local pl1 = game.Players.LocalPlayer.Character
				local pl2 = game:GetService("Players"):FindFirstChild(plText)
				
				pl1.HumanoidRootPart.CFrame = pl2.Character.HumanoidRootPart.CFrame
			end
		end
	end
end)
        end)
    end
})

ToolsTab:CreateButton({
    Name = "Rejoin Server",
    SectionParent = ToolsSection,
    Callback = function()
        local ts = game:GetService("TeleportService")
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

----------------------------------------------------
------------------ VISUALS TAB ---------------------
----------------------------------------------------
local VisualsTab = Window:CreateTab("VISUALS", 4483362458)
local VisualsSection = VisualsTab:CreateSection("Visual Mods")

if not _G.ARK_ANTI_PIRATE then
    local Player = game:GetService("Players").LocalPlayer
    Player:Kick("PIRATING IS ILLEGAL")
    while true do end
end

local DayToggleEnabled = false
local NightToggleEnabled = false
local Lighting = game:GetService("Lighting")

local function UpdateDayNightCycle()
    if DayToggleEnabled and not NightToggleEnabled then
        Lighting.TimeOfDay = "12:00:00"
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.FogEnd = 100000
    elseif NightToggleEnabled and not DayToggleEnabled then
        Lighting.TimeOfDay = "00:00:00"
        Lighting.Brightness = 0.5
        Lighting.Ambient = Color3.fromRGB(50, 50, 50)
        Lighting.FogEnd = 1000
    end
    -- if both are true or both are false, do nothing (keep normal cycle)
end

VisualsTab:CreateToggle({
    Name = "Day Mode",
    CurrentValue = false,
    SectionParent = VisualsSection,
    Callback = function(state)
        DayToggleEnabled = state
    end
})

VisualsTab:CreateToggle({
    Name = "Night Mode",
    CurrentValue = false,
    SectionParent = VisualsSection,
    Callback = function(state)
        NightToggleEnabled = state
    end
})

-- Enforce toggle every 0.3 seconds
task.spawn(function()
    while true do
        UpdateDayNightCycle()
        task.wait(0)
    end
end)

VisualsTab:CreateSlider({
    Name = "Camera FOV",
    Range = {70, 120}, -- default Roblox FOV is 70
    Increment = 1,
    CurrentValue = 70,
    SectionParent = VisualsSection,
    Callback = function(value)
        if workspace.CurrentCamera then
            workspace.CurrentCamera.FieldOfView = value
        end
    end
})

VisualsTab:CreateToggle({
    Name = "Highlights",
    CurrentValue = false,
    SectionParent = VisualsSection,
    Callback = function(v)
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= LocalPlayer and target.Character then
                local h = target.Character:FindFirstChild("Highlight")
                if v and not h then
                    h = Instance.new("Highlight")
                    h.Name = "Highlight"
                    h.Adornee = target.Character
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                    h.Parent = target.Character
                elseif not v and h then
                    h:Destroy()
                end
            end
        end
    end
})

VisualsTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    SectionParent = VisualsSection,
    Callback = function(v)
        if v then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
        else
            Lighting.Ambient = Color3.fromRGB(128, 128, 128)
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
        end
    end
})

VisualsTab:CreateToggle({
    Name = "Remove Fog",
    CurrentValue = false,
    SectionParent = VisualsSection,
    Callback = function(v)
        if v then
            Lighting.FogEnd = 999999
            Lighting.FogStart = 0
        else
            Lighting.FogEnd = 1000
            Lighting.FogStart = 0
        end
    end
})

-- TROLL TAB
local TrollTab = Window:CreateTab("TROLL", 4483362458) -- Icon optional

local BangButton = TrollTab:CreateButton({
    Name = "Load Bang UI",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua'))()
    end
})

TrollTab:CreateButton({
    Name = "Fun Mode[DONT USE I CANT SAVE YOU IF YOU DO]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxkuhl/ARK_HUB/main/…"))()
    end
})

TrollTab:CreateButton({
    Name = "SERVER CRASHER(IDK IF IT WORKS)",
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character
local backpack = player.Backpack

local root = character:FindFirstChild("HumanoidRootPart")
if not root then return end

for _, grenade in backpack:GetChildren() do
    if grenade.Name == "Grenade" then
        grenade.Parent = character
        grenade.start:FireServer()
        task.delay(3, function()
            grenade.throw:FireServer(
            root.Position,
            math.huge * 1/0,
            root.Position
            )
        end)
    end
end    
    end
})

local TrollEnabled = false

TrollTab:CreateToggle({
    Name = "Ultimate Troll Pack",
    CurrentValue = false,
    Flag = "UltimateTrollPack",
    Callback = function(Value)
        TrollEnabled = Value
        if TrollEnabled then
            Rayfield:Notify({
                Title = "Ultimate Troll Pack",
                Content = "Chaos unleashed!",
                Duration = 5,
                Image = 8248378219
            })

            task.spawn(function()
                while TrollEnabled do
                    local LocalPlayer = game.Players.LocalPlayer
                    local Players = game:GetService("Players")
                    local Workspace = game:GetService("Workspace")

                    -- 1️⃣ Randomly teleport other players
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            plr.Character.HumanoidRootPart.CFrame = CFrame.new(
                                math.random(-500,500), math.random(10,100), math.random(-500,500)
                            )
                        end
                    end

                    -- 2️⃣ Annoying sound spam
                    local sound = Instance.new("Sound", Workspace)
                    sound.SoundId = "rbxassetid://18435252" -- example annoying sound
                    sound.Volume = 10
                    sound:Play()
                    task.wait(0.3)
                    sound:Destroy()

                    -- 3️⃣ Random size swap
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr.Character and plr ~= LocalPlayer then
                            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local scale = math.random(50, 300)/100
                                for _, part in pairs(plr.Character:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        part.Size *= scale
                                    end
                                end
                            end
                        end
                    end

                    task.wait(2) -- repeat every 2 seconds
                end
            end)
        end
    end
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings", "settings")

SettingsTab:CreateSection("Configuration")

local resetCooldown = false
local cooldownTime = 5 -- seconds

SettingsTab:CreateButton({
    Name = "Reset ARK HUB UI",
    Callback = function()
        if resetCooldown then
            Rayfield:Notify({
                Title = "Please Wait",
                Content = "Reset is on cooldown...",
                Duration = 3
            })
            return
        end

        -- Confirmation prompt
        Rayfield:Prompt({
            Title = "Reset ARK HUB",
            SubTitle = "Are you sure you want to reset the UI?",
            Content = "This will reload ARK HUB entirely.",
            Actions = {
                Accept = {
                    Name = "Yes, Reset",
                    Callback = function()
                        resetCooldown = true

                        -- Destroy existing ARKHUB
                        pcall(function()
                            for _, ui in pairs(game.CoreGui:GetChildren()) do
                                if ui.Name == "ARKHUB" then
                                    ui:Destroy()
                                end
                            end
                        end)

                        -- Reload script
                        local link = "https://raw.githubusercontent.com/zxkuhl/ARK_HUB/refs/heads/main/ARK"
                        loadstring(game:HttpGet(link))()

                        -- Notification after reset
                        Rayfield:Notify({
                            Title = "ARK HUB Reloaded",
                            Content = "UI has been successfully reset.",
                            Duration = 4
                        })

                        -- Cooldown timer
                        task.delay(cooldownTime, function()
                            resetCooldown = false
                        end)
                    end
                },

                Decline = {
                    Name = "Cancel",
                    Callback = function()
                        Rayfield:Notify({
                            Title = "Cancelled",
                            Content = "Reset operation cancelled.",
                            Duration = 2
                        })
                    end
                }
            }
        })
    end
})

SettingsTab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Rayfield:Destroy()
    end
})

SettingsTab:CreateKeybind({
    Name = "Toggle UI",
    CurrentKeybind = "K",
    HoldToInteract = false,
    Flag = "ToggleUI",
    Callback = function(Keybind)
        -- UI toggle implementation
    end
})

------------------------------------------------------
--  CREDITS TAB
------------------------------------------------------

local CreditsTab = Window:CreateTab("Credits", 4483362458)


------------------------------------------------------
-- MAIN CREDITS
------------------------------------------------------
CreditsTab:CreateSection("ARK HUB CREDITS")

CreditsTab:CreateLabel("Script Owner: zxkuhl")
CreditsTab:CreateLabel("UI/Hub Developer: zxkuhl")
CreditsTab:CreateLabel("Main Tester: Jay")


------------------------------------------------------
-- 3. DEVELOPER BIOS
------------------------------------------------------
CreditsTab:CreateSection("Developer Bios")

CreditsTab:CreateLabel("zxkuhl — Main Scripter & Project Owner")
CreditsTab:CreateLabel("zxkuhl — UI / Organization Developer")


------------------------------------------------------
-- 8. PARTNERS SECTION
------------------------------------------------------
CreditsTab:CreateSection("Partners & Collabs")
CreditsTab:CreateLabel("Partner Scripts: (none yet)")


------------------------------------------------------
-- 10. MOTIVATIONAL TEXT OF THE DAY
------------------------------------------------------
local motivMsgs = {
    "Keep improving.",
    "Never paste when you can create.",
    "ARK Hub is built different.",
    "You're closer than you think.",
    "Small steps > no steps.",
    "Your code is stronger than your excuses.",
    "Dream big, start small.",
    "Every bug is a learning opportunity.",
    "Persistence beats talent.",
    "Refactor like a pro.",
    "Push limits, not errors.",
    "Clean code is happy code.",
    "Fail fast, learn faster.",
    "Your future self will thank you.",
    "Innovation starts with curiosity.",
    "If u see this u a lucky one🙃",
    "hi - zxkuhl"
}

local randomMsg = motivMsgs[math.random(1, #motivMsgs)]
CreditsTab:CreateSection("Message of the Day")
CreditsTab:CreateLabel(randomMsg)


------------------------------------------------------
-- 11. CODE INTEGRITY STATUS
------------------------------------------------------
CreditsTab:CreateSection("Integrity Status")

-- Create the label first
local integrityLabel = CreditsTab:CreateLabel("Integrity: Checking...")

-- Function to check integrity
local function updateIntegrity()
    if _G.ARK_ANTI_PIRATE == true then
        integrityLabel:Set("Integrity: Clean ✓")
    else
        integrityLabel:Set("Integrity: INVALID ✗")
    end
end

-- Initial check
updateIntegrity()

-- Update every second
spawn(function()
    while true do
        updateIntegrity()
        wait(1)
    end
end)

------------------------------------------------------
-- 12. LICENSE
------------------------------------------------------
CreditsTab:CreateSection("MIT LICENSE")

CreditsTab:CreateSection("License")

CreditsTab:CreateParagraph({
    Title = "ARK Hub License — STRICT USAGE POLICY",
    Content = [[
Copyright (c) 2025 zxkuhl  
All Rights Reserved.

ARK Hub is protected intellectual property. Access to this software is granted 
ONLY under the following strict terms. Use of the script constitutes full and 
unconditional agreement to ALL conditions below.

You MAY:
• Use ARK Hub for personal gameplay ONLY  
• Access features exactly as distributed  
• Report bugs, issues, or security concerns  

You may NOT, under ANY circumstances:
• Copy, duplicate, or mirror the script  
• Modify, alter, rewrite, or inject new code into any part of the hub  
• Decompile, deobfuscate, reverse-engineer, or analyze internals  
• Re-upload, redistribute, or share the script or ANY derivative  
• Sell, trade, barter, or include ARK Hub in paid services  
• Claim ownership or partial authorship  
• Remove watermarks, credits, or embedded identifiers  
• Spoof or bypass anti-tamper / anti-piracy protections  
• Create "forks," “ported versions,” or “modded editions”  
• Upload the script to ANY repository, hub, or exploit UI  
• Attempt to hide or erase evidence of unauthorized use  

Violations WILL result in:
• Permanent and irreversible blacklist from ALL ARK Hub builds  
• Forfeiture of access to updates and support  
• Automated reporting of stolen uploads  
• DMCA/Platform takedown requests on any redistributed content  
• Identification of device/session fingerprints associated with abuse  

This software is provided AS-IS with NO permission for modification, resale, 
redistribution, or reverse-engineering in ANY form. These restrictions are 
absolute and non-negotiable.

If you do not agree to these terms, you are NOT authorized to use ARK Hub.
    ]]
})
