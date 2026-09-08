local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "RR Emote Unlocker", HidePremium = false, SaveConfig = true, ConfigFolder = "EmotePlayerConfig"})

local EmoteTab = Window:MakeTab({
    Name = "Emotes",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local EmoteNames = {}
for _, emote in pairs(game:GetService("ReplicatedStorage").Emotes:GetChildren()) do
    table.insert(EmoteNames, emote.Name)
end

local SelectedEmote = EmoteNames[1]
local LoopEmotes = false
local FavoriteEmotes = {}

local ConfigFolder = "EmotePlayerConfig"
local ConfigFile = "FavoriteEmotes.json"
local function SaveConfig()
    if not isfolder(ConfigFolder) then
        makefolder(ConfigFolder)
    end
    writefile(ConfigFolder .. "/" .. ConfigFile, game:GetService("HttpService"):JSONEncode(FavoriteEmotes))
end

local function LoadConfig()
    if isfolder(ConfigFolder) and isfile(ConfigFolder .. "/" .. ConfigFile) then
        FavoriteEmotes = game:GetService("HttpService"):JSONDecode(readfile(ConfigFolder .. "/" .. ConfigFile))
    end
end

LoadConfig()

EmoteTab:AddDropdown({
    Name = "Select Emote",
    Default = SelectedEmote,
    Options = EmoteNames,
    Callback = function(Value)
        SelectedEmote = Value
    end    
})

EmoteTab:AddToggle({
    Name = "Loop Emotes",
    Default = false,
    Callback = function(Value)
        LoopEmotes = Value
    end    
})

local function PlayEmote()
    local args = {
        [1] = {
            ["Name"] = SelectedEmote,
            ["Type"] = "PlayEmote"
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Replicate"):FireServer(unpack(args))
end

local function WaitForEmoteToFinish()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.AnimationPlayed:Wait()
        end
    end
end

EmoteTab:AddButton({
    Name = "Play Emote",
    Callback = function()
        if LoopEmotes then
            while LoopEmotes do
                PlayEmote()
                WaitForEmoteToFinish()
            end
        else
            PlayEmote()
        end
    end    
})

OrionLib:Init()
