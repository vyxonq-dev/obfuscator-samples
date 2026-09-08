-- https://www.roblox.com/games/136764190843219/Knockout
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local w = lib:Window("Knockout!")

local UserInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local plr = players.LocalPlayer
local camera = workspace.CurrentCamera

local pushPower = 50

local function pushPlayer()
    local character = plr.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        local look = camera.CFrame.LookVector

        local horizontalDirection = Vector3.new(look.X, 0, look.Z).Unit
        
        hrp.AssemblyLinearVelocity = Vector3.new(
            horizontalDirection.X * pushPower,
            hrp.AssemblyLinearVelocity.Y,
            horizontalDirection.Z * pushPower
        )
    end
end

w:Button("Push", function ()
    pushPlayer()
end)
w:Box("Push Power", function(t)
    local num = tonumber(t)
    if num then
        pushPower = num
    end
end)
w:Label("~ t.me/arceusxcommunity", Color3.fromRGB(127, 143, 166))

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then
        pushPlayer()
    end
end)
