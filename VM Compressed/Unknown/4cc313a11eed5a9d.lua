local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Kill anyone", "DarkTheme")

local Tab = Window:NewTab("Kill")
local Section = Tab:NewSection("Kill")
local uniform = workspace:WaitForChild("Uniform")
local uniformgiver = nil



Section:NewButton("Get shotgun", "Gives you shotgun so the script works", function()
    for _, obj in uniform:GetChildren() do
    if not obj then continue end
    if obj.Name ~= "Uniform Giver" then continue end

    local coathanger = obj:FindFirstChild("Coathanger")
    if not coathanger then continue end

    local shirt = coathanger:FindFirstChildOfClass("Shirt")
    if not shirt then continue end
    if shirt.ShirtTemplate ~= "http://www.roblox.com/asset/?id=316069182" then continue end

    uniformgiver = obj
    end
    local clickpart = uniformgiver:WaitForChild("ClickPart")
    local prompt = clickpart:WaitForChild("ProximityPrompt")

    local function triggerProximityPrompt()
        prompt:InputHoldBegin()
        task.wait()
        prompt:InputHoldEnd()
    end
    local humanoidrootpart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    humanoidrootpart.CFrame = clickpart.CFrame
    task.wait(0.1)
    triggerProximityPrompt(prompt)
end)

local selectedPlayerName = nil

local function getPlayerList()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local playerDropdown = Section:NewDropdown("Select Player", "Choose a player to target", getPlayerList(), function(selected)
    selectedPlayerName = selected
end)

local function updateDropdown()
    task.wait(0.1)
    local updatedList = getPlayerList()
    playerDropdown:Refresh(updatedList)
    
    if selectedPlayerName and not Players:FindFirstChild(selectedPlayerName) then
        selectedPlayerName = nil
    end
end

Players.PlayerAdded:Connect(updateDropdown)
Players.PlayerRemoving:Connect(updateDropdown)

local function Kill(victimName)
    if not victimName then return end
    
    local targetPlayer = Players:FindFirstChild(victimName)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    local shotgun = LocalPlayer.Backpack:FindFirstChild("Shotgun") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Shotgun"))
    
    if shotgun and shotgun:FindFirstChild("Receiver") and targetHumanoid then
        shotgun.Receiver:FireServer("Damage", targetHumanoid, math.huge)
    end
end

Section:NewButton("Kill player", "Kills the selected player", function()
    Kill(selectedPlayerName)
end)

Section:NewButton("Kill all players", "kills every player", function()
    for i, v in Players:GetChildren() do
        if v.Name == Players.LocalPlayer.Name then continue end
        Kill(v.Name)
    end
end)

Section:NewButton("God mode", "makes you invincible", function()
    local shotgun = LocalPlayer.Backpack:FindFirstChild("Shotgun") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Shotgun"))
    if shotgun and shotgun:FindFirstChild("Receiver") then
        shotgun.Receiver:FireServer("Damage", LocalPlayer.Character:FindFirstChildOfClass("Humanoid"), 0/0)
    end
end)