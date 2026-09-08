-- [[ Pookie Music | Rayfield Engine (Fixed Refresh Duplicate Bug) ]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local SoundService = game:GetService("SoundService")

-- Local Workspace Setup
if makefolder and not isfolder("PookieMusicLibrary") then
    makefolder("PookieMusicLibrary")
end

-- Persistent Audio Instance
local AudioPlayer = SoundService:FindFirstChild("PookieAudioEngine") or Instance.new("Sound")
AudioPlayer.Name = "PookieAudioEngine"
AudioPlayer.Volume = 0.5
AudioPlayer.Looped = true
AudioPlayer.Parent = SoundService

local function playTrack(id, name)
    local cleanId = tostring(id):gsub("%D", "")
    if cleanId ~= "" then
        AudioPlayer:Stop()
        AudioPlayer.SoundId = "rbxassetid://" .. cleanId
        AudioPlayer:Play()
        Rayfield:Notify({
            Title = "▶ Now Playing",
            Content = name or ("Asset ID: " .. cleanId),
            Duration = 3,
            Image = 4483345998
        })
    end
end

-- [[ Window Setup ]]
local Window = Rayfield:CreateWindow({
    Name = "🔴 Pookie Music | Standalone 🎀",
    LoadingTitle = "Pookie Music Engine",
    LoadingSubtitle = "by Pookie",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

-- [[ TAB 1: SOUND ID PLAYER ]]
local IDTab = Window:CreateTab("Sound ID Player", 4483345998)

IDTab:CreateSection("Custom Roblox Asset ID")

local customIdInput = ""
IDTab:CreateInput({
    Name = "Enter Sound Asset ID",
    PlaceholderText = "Paste ID here...",
    RemoveTextOnFocus = false,
    Callback = function(text)
        customIdInput = text
    end,
})

IDTab:CreateButton({
    Name = "▶ Play Sound ID",
    Callback = function()
        playTrack(customIdInput, "Custom Sound Stream")
    end,
})

IDTab:CreateButton({
    Name = "⏹ Stop Playback",
    Callback = function()
        AudioPlayer:Stop()
        Rayfield:Notify({
            Title = "Stopped",
            Content = "Audio playback stopped.",
            Duration = 2,
            Image = 4483345998
        })
    end,
})

IDTab:CreateSlider({
    Name = "Master Volume",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "VolumeSlider",
    Callback = function(Value)
        AudioPlayer.Volume = Value / 100
    end,
})

-- [[ TAB 2: LOCAL MP3 LIBRARY ]]
local LibTab = Window:CreateTab("Local MP3 Library", 4483345998)

LibTab:CreateSection("workspace/PookieMusicLibrary/")

local localButtonElements = {}

local function loadLocalAudioFiles()
    -- Destroy actual Roblox UI instances created by Rayfield
    for _, element in ipairs(localButtonElements) do
        if element and typeof(element) == "Instance" then
            element:Destroy()
        end
    end
    table.clear(localButtonElements)

    if listfiles and isfolder and isfolder("PookieMusicLibrary") then
        local files = listfiles("PookieMusicLibrary")
        for _, filePath in ipairs(files) do
            local fileName = filePath:match("([^/\\]+)$")
            if fileName and (fileName:match("%.mp3$") or fileName:match("%.ogg$")) then
                local btnObj = LibTab:CreateButton({
                    Name = "📁 " .. fileName,
                    Callback = function()
                        if getcustomasset then
                            AudioPlayer:Stop()
                            AudioPlayer.SoundId = getcustomasset(filePath)
                            AudioPlayer:Play()
                            Rayfield:Notify({
                                Title = "Playing Local File",
                                Content = fileName,
                                Duration = 3,
                                Image = 4483345998
                            })
                        end
                    end,
                })
                
                -- Capture the real UI instance inside Rayfield's table
                if btnObj and btnObj.Element then
                    table.insert(localButtonElements, btnObj.Element)
                end
            end
        end
    end
end

LibTab:CreateButton({
    Name = "🔄 Refresh Folder Files",
    Callback = function()
        loadLocalAudioFiles()
    end,
})

loadLocalAudioFiles()

-- [[ TAB 3: USER GUIDE ]]
local GuideTab = Window:CreateTab("User Guide", 4483345998)

GuideTab:CreateSection("How to Use Pookie Music")

GuideTab:CreateParagraph({
    Title = "1. Playing Custom Sound IDs",
    Content = "Paste any valid numerical Roblox sound ID into the 'Sound ID Player' tab and hit Play."
})

GuideTab:CreateParagraph({
    Title = "2. Local MP3 Files",
    Content = "Place your .mp3 or .ogg files into 'workspace/PookieMusicLibrary/'. Hitting 'Refresh Folder Files' will now properly purge the list before re-scanning."
})
