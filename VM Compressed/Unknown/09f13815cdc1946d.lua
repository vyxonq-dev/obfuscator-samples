local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("KELL SCRIPT HUB", "BloodTheme")

local ScriptsTab = Window:NewTab("KELL Scripts")
local Section = ScriptsTab:NewSection("Available Scripts")

Section:NewButton("Kell Events", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/FsJZG5qu"))()
end)

Section:NewButton("Spooky Scary Skeletons", "", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://95156028272944"
    sound.Pitch = 0.2
    sound.Volume = 1
    sound.Looped = true
    sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    sound:Play()
end)

Section:NewButton("Project Kell", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MpXKM60v"))()
end)

Section:NewButton("Instant Prompt", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/puULbfQ2"))()
end)

local AdminTab = Window:NewTab("Admin Scripts")
local AdminSection = AdminTab:NewSection("")

AdminSection:NewButton("Infinite Yield", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

AdminSection:NewButton("QuirkyCMD", "", function()
    loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
end)

AdminSection:NewButton("Nameless Admin", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
end)

local UtilsTab = Window:NewTab("Utilities")
local UtilsSection = UtilsTab:NewSection("")

UtilsSection:NewButton("Stop Music", "", function()
    local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        for _, v in ipairs(playerGui:GetDescendants()) do
            if v:IsA("Sound") and v.Looped then
                v:Stop()
                pcall(function() v:Destroy() end)
            end
        end
    end
end)

UtilsSection:NewButton("Destroy GUI", "", function()
    pcall(function()
        local coreGui = game:GetService("CoreGui")
        for _, child in ipairs(coreGui:GetChildren()) do
            if child.Name:lower():find("kell") or child.Name:lower():find("kell script hub") or child.Name:lower():find("kell scripts") then
                child:Destroy()
            end
        end
        local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            for _, sg in ipairs(playerGui:GetChildren()) do
                if sg:IsA("ScreenGui") and (sg.Name:lower():find("kell") or sg.Name:lower():find("kell script hub")) then
                    sg:Destroy()
                end
            end
        end
    end)
end)

UtilsSection:NewButton("Custom died sound effect", "", function()
    local plr = game.Players.LocalPlayer
    local playerGui = plr:WaitForChild("PlayerGui")
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://171270157"
    sound.Volume = 1
    sound.Parent = playerGui
    local function connectHumanoid(humanoid)
        if humanoid and humanoid:IsA("Humanoid") then
            humanoid.Died:Connect(function()
                sound:Play()
            end)
        end
    end
    if plr.Character then
        connectHumanoid(plr.Character:FindFirstChild("Humanoid"))
    end
    plr.CharacterAdded:Connect(function(char)
        local humanoid = char:WaitForChild("Humanoid")
        connectHumanoid(humanoid)
    end)
end)

local UniTab = Window:NewTab("Universal")
local UniSection = UniTab:NewSection("Universal Scripts")

UniSection:NewButton("c00lclan", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/14EU4i8n", true))()
end)

UniSection:NewButton("Fe Animations", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"))()
end)

UniSection:NewButton("Free private server", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DeadlyScripts/Deadly-Scripts/refs/heads/main/Free%20Private%20Server.Lua"))()
end)

UniSection:NewButton("Keyboard", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
end)

UniSection:NewButton("System Broken", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
end)

UniSection:NewButton("Kater Hub", "", function()
    loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
end)

UniSection:NewButton("Quiz Bot", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Damian-11/quizbot/master/quizbot.luau"))()
end)

local ChatTab = Window:NewTab("Chat")
local ChatSection = ChatTab:NewSection("")

ChatSection:NewButton("X bypasser", "", function()
    local ok, err = pcall(function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/Glazed41/2f1fcab96105b7481e26249de70fddd6/raw/a6701bc97ce994c2c51bd4dff1bc1c199c1043eb/Glazed"))()
    end)
    if not ok then
        print("X bypasser failed:", err)
    end
end)

ChatSection:NewButton("AnnaBypasser", "", function()
    local ok, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true))()
    end)
    if not ok then
        print("AnnaBypasser failed:", err)
    end
end)

local FPSTab = Window:NewTab("First Person Shooter")
local FPSSection = FPSTab:NewSection("")

FPSSection:NewButton("FPS Label", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/qjCwGRGb"))()
end)

FPSSection:NewButton("Aimbot", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/open-src-scripts/refs/heads/main/Universal%20Aimbot.lua",true))()
end)

FPSSection:NewButton("ESP", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/p6JVfkuf"))()
end)