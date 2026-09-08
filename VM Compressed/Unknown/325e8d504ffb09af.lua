local lucky = Instance.new("Tool")
lucky.Parent = game.ReplicatedStorage
local luckyblock = Instance.new("Part")
luckyblock.Parent = lucky
luckyblock.Name = "Handle"
luckyblock.Size = Vector3.new(1.5, 1.5, 1.5)
local decalTextureId = "rbxassetid://8277401585"

local TriggeredFunctions = {
    ["glitchiness"] = {Chance = 20, CallBack = "functions/glitchiness"}
}

function setDecalsToAllFaces()
    local faces = Enum.NormalId:GetEnumItems()
    for _, face in ipairs(faces) do
        local decal = Instance.new("Decal")
        decal.Texture = decalTextureId
        decal.Parent = luckyblock
        decal.Face = face
    end
end

function activator(block)
    block.Activated:Connect(function()
        local isFunction = math.random(1, 100) <= 25
        if isFunction then
            for name, data in pairs(TriggeredFunctions) do
                if math.random(1, 100) <= data.Chance then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Lucky-block-assets/refs/heads/main/" .. data.CallBack .. ".lua"))()
                end
            end
        else
            local isTool = math.random(1, 100) <= 50
            if isTool then
                local tool
                while tool == nil do
                    wait()
                    for _, descendant in ipairs(game:GetDescendants()) do
                        if descendant:IsA("Tool") and math.random(1, 100) <= 15 then
                            tool = descendant
                            break
                        end
                    end
                end
                if tool then
                    tool:Clone().Parent = game.Players.LocalPlayer.Backpack
                end
            end
        end
        block:Destroy()
    end)
end

setDecalsToAllFaces()

local function isPlayerInDoors(player)
    local gameData = game.ReplicatedStorage:FindFirstChild("GameData")
    return gameData and gameData:FindFirstChild("LatestRoom") ~= nil
end

if isPlayerInDoors(game.Players.LocalPlayer) then
    local doorNV = game.ReplicatedStorage.GameData.LatestRoom
    local door = doorNV.Value
    while wait() do
        if doorNV.Value > door then
            door = doorNV.Value
            local block = lucky:Clone()
            block.Parent = game.Players.LocalPlayer.Backpack
            activator(block)
        end
    end
else
    while wait(10) do
        local block = lucky:Clone()
        block.Parent = game.Players.LocalPlayer.Backpack
        activator(block)
    end
end
