--[[
and yeah i don't have enough time to add icons for tabs bruh
]]

local cloneref = cloneref or function(r) return r end -- the 'then' made the script not working

-- //SERVICES\\
local v = cloneref(game:GetService("VoiceChatService"))
local cg = cloneref(game:GetService("CoreGui"))
local ws = cloneref(game:GetService("Workspace"))
local lg = cloneref(game:GetService("Lighting"))
local rf = cloneref(game:GetService("ReplicatedFirst"))
local rs = cloneref(game:GetService("ReplicatedStorage"))
local sg = cloneref(game:GetService("StarterGui"))
local ss = cloneref(game:GetService("SoundService"))
local tcs = cloneref(game:GetService("TextChatService"))
local gs = cloneref(game:GetService("GamepassService"))
local hs = cloneref(game:GetService("HttpService"))
local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()
local Window = Luna:CreateWindow({
    Name = "ByeRobloxVCBan",
    Subtitle = "V1.0.0",
    LogoID = "82795327169782",
    LoadingEnabled = true,
    LoadingTitle = "ByeRobloxVCBan Setup",
    LoadingSubtitle = "by GozBlox (F4X) | ByeRobloxVCBan Is Currently Creating The UI Please Wait...",

    ConfigSettings = {
        RootFolder = nil, 
        ConfigFolder = "ByeRobloxVCBan Loader"
    },

    KeySystem = false,
    KeySettings = {
        Title = "ByeRobloxVCBan KeySystem",
        Subtitle = "Key System",
        Note = "idk there no key system",
        SaveInRoot = false,
        SaveKey = true,
        Key = {"Free Palestine"},
        SecondAction = {
            Enabled = true,
            Type = "Link",
            Parameter = ""
        }
    }
})

Luna:Notification({ 
    Title = "ByeRobloxVCBan Notification",
    Icon = "notifications_active",
    ImageSource = "Material",
    Content = "You are now using version V1.0.0. Don't forget to read the Important Tab first."
})

local important = Window:CreateTab({
    Name = "Important",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})
important:CreateSection("Help")
local exeHelp = important:CreateParagraph({
    Title = "We Need Your Help",
    Content = "We want all users to tell us if the exploit works in their executor, and how to tell us is by going to our github and this is the link: (https://github.com/GozBlox/ByeRobloxVCBan) meaning create an issue and say for example: Delta Is Supporting this exploit and this will be very helpful to us"
})
important:CreateSection("Try These Exploits")
local vr7Exploit = important:CreateButton({
    Name = "VR7",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP"))()
        Luna:Destroy()
    end
})

local vcTab = Window:CreateTab({
    Name = "VC Bypasser",
    Icon = "view_in_ar",
    ImageSource = "Material",
    ShowTitle = true
})
vcTab:CreateSection("VC Ban Bypasser")
local wibvb = vcTab:CreateParagraph({
    Title = "What is Bypass VC Ban",
    Content = "If Roblox banned you from voice chat because you said a bad word or they banned you for an unconvincing and unfair reason, you can click the button below this message to bypass the voice chat ban (the button only works if you have voice chat and you have been banned from it, and if you do not have voice chat activated at all, it will not give you free voice chat at all, If our exploit does not work and there is a bug, open an issue on our GitHub and we will contact you and solve the problems)"
})
local githubLink = vcTab:CreateLabel({
    Text = "https://github.com/GozBlox/ByeRobloxVCBan",
    Style = 3
})
local vcBanBypasser = vcTab:CreateButton({
    Name = "Bypass VC Ban",
    Callback = function()
        v:joinVoice()
    end
})