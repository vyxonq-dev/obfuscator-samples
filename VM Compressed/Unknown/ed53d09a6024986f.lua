-- 📚 Library & Main Window
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Verbal Hub v3", "BloodTheme")

-- 🛠️ Developers Crew Tab
local DevTab = Window:NewTab("🛠️ Developers Crew")
local DevSec = DevTab:NewSection("People who helped with this script")
DevSec:NewLabel("👑 oj10ftap [OWNER]")
DevSec:NewLabel("   Creator Of Verbal Hub. Made Everything.")
DevSec:NewLabel("👤 gojo_kj140 [ADMIN]")
DevSec:NewLabel("   Thank you for helping me with many things!")

-- ℹ️ Info Tab
local InfoTab = Window:NewTab("ℹ️ VERBAL Info")
local InfoSection = InfoTab:NewSection("Script Version & Updates")
InfoSection:NewLabel("📜 Version 1.5")
InfoSection:NewLabel("🕒 Ping: " .. tostring(math.random(80, 300)) .. "ms | Time: 00:22")

-- 📦 Update Logs Tab
local UpdateTab = Window:NewTab("📦 Update Logs")
local UpdateSection = UpdateTab:NewSection("Recent Changes")
UpdateSection:NewLabel("- Added Admins Section")
UpdateSection:NewLabel("- Improved GUI layout")

-- 👑 Owner stuff Tab
local OwnerTab = Window:NewTab("👑 Owner stuff")
local OwnerSection = OwnerTab:NewSection("Reserved for oj10ftap")

-- 🔍 Search Tab
local SearchTab = Window:NewTab("🔍 Search")
local SearchSection = SearchTab:NewSection("Search Features Coming Soon")

-- 🌀 FTAP Tab
local FtapTab = Window:NewTab("🌀 ftap")
local FtapSection = FtapTab:NewSection("Welcome to ftap tab!")
FtapSection:NewButton("⚡ Run FTAP Script", "Execute FTAP/BLIZT Script", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-FTAP-BLIZT-And-More-41160"))()
end)

-- 🔁 Open/Close Toggle
local OpenCloseTab = Window:NewTab("📂 Open / Close")
local ToggleSec = OpenCloseTab:NewSection("Toggle GUI")
ToggleSec:NewButton("🔓 Open GUI", "Re-enable GUI if closed", function()
    game:GetService("CoreGui").VerbalHubv3.Enabled = true
end)
ToggleSec:NewButton("🔒 Close GUI", "Disable GUI temporarily", function()
    game:GetService("CoreGui").VerbalHubv3.Enabled = false
end)

-- 📱 Mobile Touch Move Support
function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                       startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- 🖼️ Apply drag to GUI frames
for _, gui in pairs(game.CoreGui:GetDescendants()) do
    if gui:IsA("Frame") then
        pcall(function()
            makeDraggable(gui)
        end)
    end
end