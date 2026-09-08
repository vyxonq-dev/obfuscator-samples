-- CalvicHub - Atualizado 2025
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/UI-Library/refs/heads/main/Ghost%20Gui'))()
game.CoreGui.GhostGui.MainFrame.Title.Text = "CalvicHub"

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if not _G.CalvicHub then _G.CalvicHub = {} end

-- Verificar ilegalidade
local function isPlayerIlegal(char)
    if char and char:GetAttribute("Illegal") ~= nil then
        return char:GetAttribute("Illegal") == true
    end
    return false
end

-- Scanner: Mostra atributos em tempo real
task.spawn(function()
    while true do
        task.wait(0.5)
        if LocalPlayer.Character then
            local char = LocalPlayer.Character
            local status = isPlayerIlegal(char) and "ILEGAL" or "LIMPO"
            local edu = tostring(char:GetAttribute("Educated"))
            local cop = tostring(char:GetAttribute("CopJob"))
            local med = tostring(char:GetAttribute("HospitalJob"))
            game.CoreGui.GhostGui.MainFrame.SubTitle.Text = "Status: "..status.." | Educated: "..edu.." | CopJob: "..cop.." | HospitalJob: "..med
        end
    end
end)

--------------------------------------------------
-- AutoPolice
AddContent("Toogle", "AutoPolice", [[
if not _G.CalvicHub then _G.CalvicHub = {} end

if _G.CalvicHub.AutoPoliceRunning then
    _G.CalvicHub.AutoPoliceRunning = false
    return
end

_G.CalvicHub.AutoPoliceRunning = true

task.spawn(function()
    local player = game.Players.LocalPlayer
    local posEscola = Vector3.new(-115, 4, -2)
    local posEmpregoPolicial = Vector3.new(-117, 3, 55)

    local function FirePromptNearby()
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if not _G.CalvicHub.AutoPoliceRunning then return false end
            if v:IsA("ProximityPrompt") and v.Parent:IsA("BasePart") and (v.Parent.Position - player.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                fireproximityprompt(v)
                return true
            end
        end
        return false
    end

    local function Teleport(pos)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0,2,0))
    end

    while _G.CalvicHub.AutoPoliceRunning do
        if player.Character == nil or player.Character:FindFirstChild("Humanoid") == nil then
            task.wait(0.5)
        else
            local char = player.Character

            if char:GetAttribute("Educated") == true and char:GetAttribute("CopJob") == true then
                _G.CalvicHub.AutoPoliceRunning = false
                break
            end

            if char:GetAttribute("Educated") ~= true then
                Teleport(posEscola)
                task.wait(0.5)
                FirePromptNearby()
            elseif char:GetAttribute("CopJob") ~= true then
                Teleport(posEmpregoPolicial)
                task.wait(0.5)
                FirePromptNearby()
            end

            task.wait(0.5)
        end
    end
end)
]])

--------------------------------------------------
-- AutoDoctor
AddContent("Toogle", "AutoDoctor", [[
if not _G.CalvicHub then _G.CalvicHub = {} end

if _G.CalvicHub.AutoFarmRunning then
    _G.CalvicHub.AutoFarmRunning = false
    return
end

_G.CalvicHub.AutoFarmRunning = true

task.spawn(function()
    local player = game.Players.LocalPlayer
    local HumanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

    local posEscola = Vector3.new(-115, 4, -2)
    local posPegarEmprego = Vector3.new(-13, 4, -12)
    local posTrabalhar = Vector3.new(-5, 3, -13)

    local function SafeTeleport(pos)
        if not _G.CalvicHub.AutoFarmRunning then return false end
        HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0,2,0))
        return true
    end    

    local function SafeFirePrompt()
        if not _G.CalvicHub.AutoFarmRunning then return false end
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do    
            if v:IsA("ProximityPrompt") and v.Parent:IsA("BasePart") and (v.Parent.Position - HumanoidRootPart.Position).Magnitude <= 5 then    
                fireproximityprompt(v)    
                return true    
            end    
        end    
        return false    
    end    

    while _G.CalvicHub.AutoFarmRunning do    
        local char = player.Character

        if char:GetAttribute("Educated") == true and char:GetAttribute("HospitalJob") == true then
            if not SafeTeleport(posTrabalhar) then break end
            task.wait(0.3)
            if not SafeFirePrompt() then break end
            task.wait(1)
        elseif char:GetAttribute("Educated") ~= true then
            if not SafeTeleport(posEscola) then break end
            task.wait(0.3)
            if not SafeFirePrompt() then break end
            task.wait(0.3)
        else
            if not SafeTeleport(posPegarEmprego) then break end
            task.wait(0.3)
            if not SafeFirePrompt() then break end
            task.wait(0.3)
        end
    end
end)
]])

--------------------------------------------------
-- AutoArrested
AddContent("Toogle", "AutoArrested", [[
if not _G.CalvicHub then _G.CalvicHub = {} end

if _G.CalvicHub.AutoJailRunning then
    _G.CalvicHub.AutoJailRunning = false
    return
end

_G.CalvicHub.AutoJailRunning = true

task.spawn(function()
    local player = game.Players.LocalPlayer

    while _G.CalvicHub.AutoJailRunning do
        local char = player.Character
        local HumanoidRootPart = char and char:FindFirstChild("HumanoidRootPart")

        if char and char:GetAttribute("CopJob") == true and HumanoidRootPart then
            for _, v in ipairs(game.Players:GetPlayers()) do
                if not _G.CalvicHub.AutoJailRunning then break end

                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
                    if v.Character.Humanoid.Health > 0 and v.Character:GetAttribute("Illegal") == true then
                        HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + Vector3.new(0, 1, 0)

                        local prompt = v.Character:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then
                            fireproximityprompt(prompt)
                        end

                        task.wait(0.5)

                        if not _G.CalvicHub.AutoJailRunning then break end
                    end
                end
            end
        end

        task.wait(0.3)
    end
end)
]])
