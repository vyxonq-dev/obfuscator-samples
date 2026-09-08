-- // Made by @Flames9925 | Edited by @NyxaSylph

local cloneref = (cloneref or clonereference or function(instance)
    return instance
end)

local Players = cloneref(game:GetService("Players"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local LPlayer = Players.LocalPlayer

repeat task.wait() until game:IsLoaded() and LPlayer

LPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local Loader = {}

Loader.Files = {
    ["Bizzare Lineage"] = {
        File = "BA/Main.lua",
        CreatorId = 33161040
    },
    ["A Universal Time"] = {
        File = "AUT/Main.lua",
        CreatorId = 6556072
    },
    ["Anime Expeditions"] = {
        File = "AE/Main.lua",
        CreatorId = 35929511
    },
    ["Iron Soul"] = {
        File = "IS/Main.lua",
        CreatorId = 559846885
    },
}

function Loader:LoadByCreatorId(CreatorId)
    for GameName, Data in pairs(self.Files) do
        if Data.CreatorId == CreatorId then
            
            local Url = "https://raw.githubusercontent.com/NyxaSylph/Vellure/main/" .. Data.File
            
            local Success, Result = pcall(function()
                return loadstring(game:HttpGet(Url))()
            end)

            if Success then
                print("✅ Loaded:", GameName)
            else
                warn("❌ Load failed:", Result)
            end

            return
        end
    end

    warn("UNSUPPORTED GAME 🤡")
end

Loader:LoadByCreatorId(game.CreatorId)
return Loade
