local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local close = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(183, 101, 255)
Frame.Position = UDim2.new(0.369825214, 0, 0.423832893, 0)
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(125, 102, 255)
Title.Position = UDim2.new(0.01, 0, 0.00832893, 0)
Title.Size = UDim2.new(0, 303, 0, 35)
Title.Font = Enum.Font.Cartoon
Title.Text = "تليجرام | @steluaz"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 40.000

close.Parent = Frame
close.BackgroundColor3 = Color3.fromRGB(125, 102, 255)
close.Position = UDim2.new(0.879518092, 0, 0.00832893, 0)
close.Size = UDim2.new(0, 40, 0, 35)
close.Font = Enum.Font.GothamBlack
close.Text = "X"
close.TextColor3 = Color3.new(0, 0, 0)
close.TextScaled = true
close.TextSize = 14
close.TextWrapped = true
close.MouseButton1Down:Connect(function()
    Frame.Visible = false
end)

ScrollingFrame.Parent = Frame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0.01, 0, 0.2, 0)
ScrollingFrame.Size = UDim2.new(0, 340, 0, 200)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 6

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.CellSize = UDim2.new(0, 94, 0, 35) 
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 10)

local function AddButton(parent, config)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.BackgroundColor3 = Color3.fromRGB(125, 102, 255)
    Button.Size = UDim2.new(0, 94, 0, 35)
    Button.Font = Enum.Font.Cartoon
    Button.Text = config.Name or "Button"
    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextSize = 20.000
    Button.MouseButton1Click:Connect(config.Callback or function() end)

    parent.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y + 10)
end

AddButton(ScrollingFrame, {
    Name = "طياران",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end
})

AddButton(ScrollingFrame, {
    Name = "اختفاء",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))()
    end
})

AddButton(ScrollingFrame, {
    Name = "رقصات",
    Callback = function()
        loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afem"))()
    end
})

AddButton(ScrollingFrame, {
    Name = "ادمن",
    Callback = function()
        defaultsettings = {
            prefix = ';';
            StayOpen = false;
            keepIY = true;
            logsEnabled = false;
            jLogsEnabled = false;
            aliases = {};
            binds = {};
            WayPoints = {};
            PluginsTable = {};
        }
        defaults = game:GetService("HttpService"):JSONEncode(defaultsettings)
        writefile("IY_FE.iy",defaults)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

AddButton(ScrollingFrame, {
    Name = "مشيات",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end
})

AddButton(ScrollingFrame, {
    Name = "ايم بوت",
    Callback = function()
        _G.HeadSize = 30 _G.Disabled = true  
        game:GetService('RunService').RenderStepped:connect(function() 
            if _G.Disabled then 
                for i,v in next, game:GetService('Players'):GetPlayers() do 
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
                        pcall(function() 
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
                            v.Character.HumanoidRootPart.Transparency = 0.7 
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black") 
                            v.Character.HumanoidRootPart.Material = "Neon" 
                            v.Character.HumanoidRootPart.CanCollide = false 
                        end) 
                    end 
                end 
            end 
        end)
    end
})

AddButton(ScrollingFrame, {
    Name = "hitbox",
    Callback = function()
        _G.HeadSize = 10
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})

AddButton(ScrollingFrame, {
    Name = "سرعه",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/R7KScript/Arabic-speed/refs/heads/main/Arabic.speed.txt"))() 
    end
})

AddButton(ScrollingFrame, {
    Name = "مشيات 2",
    Callback = function()
        loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afem"))()
    end
})

AddButton(ScrollingFrame, {
    Name = "Esp",
    Callback = function()
        local FillColor = Color3.fromRGB(175,25,255)
        local DepthMode = "AlwaysOnTop"
        local FillTransparency = 0.5
        local OutlineColor = Color3.fromRGB(255,255,255)
        local OutlineTransparency = 0
        local CoreGui = game:FindService("CoreGui")
        local Players = game:FindService("Players")
        local lp = Players.LocalPlayer
        local connections = {}
        local Storage = Instance.new("Folder")
        Storage.Parent = CoreGui
        Storage.Name = "Highlight_Storage"
        local function Highlight(plr)
            local Highlight = Instance.new("Highlight")
            Highlight.Name = plr.Name
            Highlight.FillColor = FillColor
            Highlight.DepthMode = DepthMode
            Highlight.FillTransparency = FillTransparency
            Highlight.OutlineColor = OutlineColor
            Highlight.OutlineTransparency = 0
            Highlight.Parent = Storage
            local plrchar = plr.Character
            if plrchar then
                Highlight.Adornee = plrchar
            end
            connections[plr] = plr.CharacterAdded:Connect(function(char)
                Highlight.Adornee = char
            end)
        end
        Players.PlayerAdded:Connect(Highlight)
        for i,v in next, Players:GetPlayers() do
            Highlight(v)
        end
        Players.PlayerRemoving:Connect(function(plr)
            local plrname = plr.Name
            if Storage[plrname] then
                Storage[plrname]:Destroy()
            end
            if connections[plr] then
                connections[plr]:Disconnect()
            end
        end)
    end
})

AddButton(ScrollingFrame, {
    Name = "مشي فلهواء",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

AddButton(ScrollingFrame, {
    Name = "مراقبة الناس",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/wyvdb7gr'))()
    end
})
AddButton(ScrollingFrame, {
    Name = "جلخ",
    Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "تحول دود",
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()                    game:GetService("StarterGui"):SetCore("SendNotification", { 
 Title = "賲賳 氐賳毓 丕丿賲 丕亘賵 卮丕乇亘 V3";
 Text = "氐賱賷 毓賱賶 丕賱賳亘賷";
 Icon = "rbxthumb://type=Asset&id=11007670961&w=150&h=150"})
Duration = 5;
    end
})
AddButton(ScrollingFrame, {
    Name = "زومبي",
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/n42Ougzx/raw'),true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "كيبورد",
    Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/manimcool21/Keyboard-FE/main/Protected%20(3).lua'),true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "R6",
    Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/Imagnir/r6animsforr15/main/r6anims.lua'),true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "تطير",
    Callback = function()
   loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Nameless-Admin-no-byfron-ui-11288"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "زيادة الافريم",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "توقيف الزمن",
    Callback = function()
   loadstring (game: HttpGet (' https://raw.githubusercontent.com/creepstu/fuzzy-octo-giggle/main/Source'))()
    end
})
AddButton(ScrollingFrame, {
    Name = "اغاني",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Music%20Gui.txt"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "مطرقه",
    Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/nNSuskqK",true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "قفل",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Sector9922/SECTOR-SHIFT-LOCK/main/SECTOR%20SHIFT%20LOCK"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "99ليله",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua", true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ليله99 2",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ليله99 3",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "بلوكس فروت",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = " ماب مزرعه",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب مزرعه 2",
    Callback = function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب مزرعه 3",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
    end
})
AddButton(ScrollingFrame, {
    Name = " ماب سرقه",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Hamza3270308/Stealabrainrot/refs/heads/main/Laserhun.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب سرقه 2",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/StealaCountry"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب سرقه 3",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "وار تايكون",
    Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon', true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب بيوت",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/speedwavevip/Speed_Aya/refs/heads/main/languages"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب بيوت 2",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب بيوت 3",
    Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ALFA-IRAQ-34036"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "حرب وقت",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/R7KScript/Arabic-speed/refs/heads/main/sword.Lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "كينج لجسي",
    Callback = function()
   repeat wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "بلو لوك",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/ArbixHubV1/refs/heads/main/Source.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب القطار",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب العضلات",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ام ام تو",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Blind-Man-Walking/Mm2/refs/heads/main/Test"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ام ام تو 2",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Universal-Script/ODPH/refs/heads/main/Premium"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ام ام تو 3",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Mado7/MadoHub/refs/heads/main/madohubmain.lua.txt"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ام ام تو 4",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconLords/Random-Shit/main/mm2.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "TPS",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/TPS-Script/main/Main-ByteHub.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "امرجنسي",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/nova7q/nova/refs/heads/main/nova"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "Fisch",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ماب القنبله",
    Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TvonHub-40198"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "تحولات",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "حرب سيرير",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Baconontop/BedwarsV3/main/icecatBedwars.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ادوبت مي",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/FOXTROXHACKS/Roblox-Scripts/main/Adopt-Me/Adopt-Me-Auto-Race.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "داهود",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Balligusapos/Balligusapos/main/DHIDIOT"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "سكربت RTX",
    Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/Z6m1aPy1",true))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ايفيد",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "ايفيد 2",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/PepesGH1/stuff/main/evadeloader.lua"))()
    end
})
AddButton(ScrollingFrame, {
    Name = "يزيد فريمات",
    Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/MrLamon/MLamon-Hub/refs/heads/main/Protected_4747902775072511.lua.txt"))()
    end
})
