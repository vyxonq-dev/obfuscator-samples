local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Yapppppp",
    Icon = 0, 
    LoadingTitle = "mm2 hub  keysystem (vbu3)",
    LoadingSubtitle = "loading",
    Theme = "Default", 
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = BluHub, -- Create a custom folder for your hub/game
       FileName = "BluHub"
    },
 
    Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "tmSTMS78MZ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true,
    KeySettings = {
       Title = "autofarm n stuff - MM2",
       Subtitle = "Key System",
       Note = "Join the discord for the key https://discord.gg/tmSTMS78MZ", -- Use this to tell the user how to get a key
       FileName = "Yapuh", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"MM2NEWHOLYAURA"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("HUB FOR MM2222 - mm2", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("tap to load script")
 Section:Set("Section Example")
 
 local Button = Tab:CreateButton({
    Name = "Tap to load script",
    Callback = function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/p7reeessssssxxxx/idk/refs/heads/main/mm2fent.lua"))()
    end,
 })

 Rayfield:LoadConfiguration()
