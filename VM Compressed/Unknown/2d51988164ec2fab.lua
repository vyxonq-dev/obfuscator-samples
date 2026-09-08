local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
local Section = Window:NewSection("Credits: TGMANKASKE")

local copiedPosition = nil

Section:CreateButton("Copy Position", function()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        copiedPosition = character.HumanoidRootPart.Position
        -- Opcional: copiar para a área de transferência (clipboard) se for possível
        print("Posição copiada:", copiedPosition)
        -- Para Roblox, copiar para clipboard pode não ser permitido, então printar já ajuda.
    else
        warn("Personagem ou HumanoidRootPart não encontrado!")
    end
end)

Section:CreateButton("Goto Position", function()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if copiedPosition and character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(copiedPosition)
        print("Teleportado para a posição:", copiedPosition)
    else
        warn("Posição não copiada ainda ou personagem não encontrado!")
    end
end)




Section:CreateButton("Delet Laser Wall", function()

local function deleteWalls(lasersFolder)
    if lasersFolder then
        for _, obj in pairs(lasersFolder:GetChildren()) do
            if obj.Name == "Wall" then
                obj:Destroy()
            end
        end
        print("Todos os 'Wall' foram deletados em " .. lasersFolder:GetFullName())
    else
        warn("Pasta lasers não encontrada!")
    end
end

local function deleteWallDirectly(parentObj)
    if parentObj and parentObj:FindFirstChild("Wall") then
        parentObj.Wall:Destroy()
        print("Wall deletado em " .. parentObj:GetFullName())
    else
        warn("Wall não encontrado em " .. (parentObj and parentObj:GetFullName() or "nil"))
    end
end

local plotsChildren = workspace.Plots:GetChildren()

local plotPosLasers = workspace.Plots.plot_pos.plot_model.lasers
deleteWalls(plotPosLasers)

local indices = {1, 2, 3, 4, 5, 6, 7, 8}

for _, i in ipairs(indices) do
    local child = plotsChildren[i]
    if child and child:FindFirstChild("plot_model") and child.plot_model:FindFirstChild("lasers") then
        deleteWalls(child.plot_model.lasers)
    else
        warn("O filho de workspace.Plots na posição "..i.." não possui plot_model.lasers")
    end
end

local miscChildren = game:GetService("ReplicatedStorage").Misc:GetChildren()
local secondChild = miscChildren[2]
deleteWallDirectly(secondChild)



end)

Section:CreateButton("Boost Speed", function()


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local normalSpeed = 16
local boostSpeed = 70 -- change here

local function applySpeedBoost()
    if humanoid then
        humanoid.WalkSpeed = boostSpeed
        print("Speed boost aplicado!")
    end
end

humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if humanoid.WalkSpeed ~= boostSpeed then
        wait(0.1)
        applySpeedBoost()
    end
end)

player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
    wait(0.5)
    applySpeedBoost()
    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if humanoid.WalkSpeed ~= boostSpeed then
            wait(0.1)
            applySpeedBoost()
        end
    end)
end)

applySpeedBoost()

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("Boost speed com bypass e anti-kick ativado.")

end)

local Section = Window:NewSection("Links")
 
Section:CreateButton("Discord Group", function()
print("HI")
 
setclipboard("https://discord.gg/8A6k73JqCM")
toclipboard("https://discord.gg/8A6k73JqCM")
 
end)
 
Section:CreateButton("Youtube", function()
print("HI")
 
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
 
end)
