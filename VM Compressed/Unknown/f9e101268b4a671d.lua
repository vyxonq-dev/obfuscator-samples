-- [[ CLT HUB v2 - EDIÇÃO ESPECIAL ]] --
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LPlayer = Players.LocalPlayer

-- Estados do Script
local _G = {
    Fly = false,
    Troll = false,
    Rainbow = false,
    Esp = false,
    SelectedPlayer = nil,
    Viewing = false
}

-- Interface Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CLTHub_V2_Final"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- BOTÃO DE ABRIR/FECHAR (📘 REDONDO, AZUL E ARRASTÁVEL)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.Size = UDim2.new(0, 60, 0, 60)
OpenBtn.Position = UDim2.new(0.02, 0, 0.45, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
OpenBtn.Text = "📘"
OpenBtn.TextSize = 35
OpenBtn.TextColor3 = Color3.new(1, 1, 1)
OpenBtn.ZIndex = 10

local CornerBtn = Instance.new("UICorner", OpenBtn)
CornerBtn.CornerRadius = UDim.new(1, 0)

local StrokeBtn = Instance.new("UIStroke", OpenBtn)
StrokeBtn.Thickness = 2
StrokeBtn.Color = Color3.new(1, 1, 1)

-- Lógica para Arrastar o Botão 📘
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    OpenBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

OpenBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = OpenBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

OpenBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- JANELA PRINCIPAL
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 15, 45)
MainFrame.Size = UDim2.new(0, 500, 0, 420)
MainFrame.Position = UDim2.new(0.5, -250, 1.2, 0)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(0, 120, 255)

-- Sidebar
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 20, 55)
Instance.new("UICorner", Sidebar)
local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.Padding = UDim.new(0, 5)

-- Logo
local Logo = Instance.new("ImageLabel", Sidebar)
Logo.Size = UDim2.new(0, 110, 0, 110)
Logo.Image = "rbxassetid://1000104067" 
Logo.BackgroundTransparency = 1

-- Conteúdo
local Content = Instance.new("Frame", MainFrame)
Content.Position = UDim2.new(0, 140, 0, 10)
Content.Size = UDim2.new(1, -150, 1, -20)
Content.BackgroundTransparency = 1

local function CreateTab()
    local t = Instance.new("ScrollingFrame", Content)
    t.Size = UDim2.new(1, 0, 1, 0); t.BackgroundTransparency = 1; t.Visible = false
    t.CanvasSize = UDim2.new(0,0,2,0); t.ScrollBarThickness = 3
    Instance.new("UIListLayout", t).Padding = UDim.new(0, 8)
    return t
end

local TrollTab = CreateTab(); TrollTab.Visible = true
local ScriptsTab = CreateTab()
local DiscordTab = CreateTab()

-- Alternar Janela
local isOpen = false
OpenBtn.MouseButton1Click:Connect(function()
    if dragging then return end 
    if not isOpen then
        MainFrame:TweenPosition(UDim2.new(0.5, -250, 0.25, 0), "Out", "Back", 0.6)
    else
        MainFrame:TweenPosition(UDim2.new(0.5, -250, 1.2, 0), "In", "Quad", 0.5)
    end
    isOpen = not isOpen
end)

-- Helpers
local function CreateTabBtn(name, callback)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, -10, 0, 35); btn.BackgroundColor3 = Color3.fromRGB(0, 90, 230)
    btn.Text = name; btn.TextColor3 = Color3.new(1, 1, 1); btn.Font = "SourceSansBold"
    btn.MouseButton1Click:Connect(callback); Instance.new("UICorner", btn)
end

local function CreateActionBtn(name, parent, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -10, 0, 35); btn.BackgroundColor3 = Color3.fromRGB(25, 55, 130)
    btn.Text = name; btn.TextColor3 = Color3.new(1, 1, 1); btn.MouseButton1Click:Connect(callback)
    Instance.new("UICorner", btn)
    return btn
end

-- --- SELEÇÃO DE PLAYER ---
local ListFrame = Instance.new("ScrollingFrame", TrollTab)
ListFrame.Size = UDim2.new(1, -10, 0, 110); ListFrame.BackgroundColor3 = Color3.fromRGB(15, 25, 60); Instance.new("UIListLayout", ListFrame)
local TargetLabel = Instance.new("TextLabel", TrollTab)
TargetLabel.Size = UDim2.new(1,-10,0,25); TargetLabel.Text = "Alvo: Nenhum"; TargetLabel.TextColor3 = Color3.new(0,1,1); TargetLabel.BackgroundTransparency = 1

local function RefreshList()
    for _, v in pairs(ListFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton", ListFrame)
        pBtn.Size = UDim2.new(1, 0, 0, 25); pBtn.Text = p.DisplayName; pBtn.BackgroundColor3 = Color3.fromRGB(35, 75, 160); pBtn.TextColor3 = Color3.new(1, 1, 1)
        pBtn.MouseButton1Click:Connect(function() _G.SelectedPlayer = p; TargetLabel.Text = "Alvo: " .. p.DisplayName end)
    end
end
CreateActionBtn("🔄 Atualizar Lista", TrollTab, RefreshList)

-- --- FUNÇÕES TROLL ---
CreateTabBtn("Troll", function() TrollTab.Visible = true; ScriptsTab.Visible = false; DiscordTab.Visible = false end)

CreateActionBtn("Fling Player", TrollTab, function()
    if _G.SelectedPlayer and _G.SelectedPlayer.Character then
        local hrp = LPlayer.Character.HumanoidRootPart
        hrp.CFrame = _G.SelectedPlayer.Character.HumanoidRootPart.CFrame
        local av = Instance.new("BodyAngularVelocity", hrp)
        av.AngularVelocity = Vector3.new(0, 99999, 0); av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        task.wait(0.2); av:Destroy()
    end
end)

CreateActionBtn("View (Espiar/Parar)", TrollTab, function()
    _G.Viewing = not _G.Viewing
    workspace.CurrentCamera.CameraSubject = (_G.Viewing and _G.SelectedPlayer) and _G.SelectedPlayer.Character.Humanoid or LPlayer.Character.Humanoid
end)

CreateActionBtn("RPG Rainbow Name", TrollTab, function()
    _G.Rainbow = not _G.Rainbow
    spawn(function() while _G.Rainbow do LPlayer.Character.Humanoid.DisplayName = "🌈 CLT HUB"; task.wait(0.5) end end)
end)

CreateActionBtn("ESP CLT All", TrollTab, function()
    _G.Esp = not _G.Esp
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LPlayer and p.Character then
            local b = Instance.new("BillboardGui", p.Character.Head)
            b.Name = "CLT_Tag"; b.Size = UDim2.new(0, 200, 0, 50); b.AlwaysOnTop = true
            local t = Instance.new("TextLabel", b)
            t.Size = UDim2.new(1, 0, 1, 0); t.BackgroundTransparency = 1; t.Text = "📘 CLT DESPREGADO"; t.TextScaled = true; t.Font = "SourceSansBold"
            spawn(function()
                while _G.Esp and b.Parent do
                    t.TextColor3 = Color3.fromRGB(0, 120, 255); task.wait(0.4)
                    t.TextColor3 = Color3.fromRGB(0, 0, 0); task.wait(0.4)
                end
                b:Destroy()
            end)
        end
    end
end)

-- FLY CLT COM SISTEMA DE SEGURAR A CARTEIRA
CreateActionBtn("Fly CLT (On/Off)", TrollTab, function()
    _G.Fly = not _G.Fly
    if _G.Fly then
        local clt = Instance.new("Part", LPlayer.Character)
        clt.Name = "CLT_HandItem"
        clt.Size = Vector3.new(0.4, 0.6, 0.1)
        clt.Color = Color3.fromRGB(0, 0, 180)
        clt.CanCollide = false
        local w = Instance.new("Weld", clt)
        w.Part0 = clt
        w.Part1 = LPlayer.Character:FindFirstChild("Right Arm") or LPlayer.Character:FindFirstChild("RightHand")
        w.C0 = CFrame.new(0, 1, 0.5)
        
        local bv = Instance.new("BodyVelocity", LPlayer.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        
        spawn(function()
            while _G.Fly do
                -- Voa enquanto a CLT estiver no braço
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
                task.wait()
            end
            bv:Destroy()
            clt:Destroy()
        end)
    end
end)

CreateActionBtn("Versão do CLT HUB", TrollTab, function()
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CLT HUB", Text = "Versão v2", Duration = 5})
end)

-- --- TABS EXTRAS ---
CreateTabBtn("Scripts", function() TrollTab.Visible = false; ScriptsTab.Visible = true; DiscordTab.Visible = false end)
CreateActionBtn("Cartola Hub", ScriptsTab, function() setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()') end)
CreateActionBtn("Lyra Hub", ScriptsTab, function() setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/kayrus999/Lyrapainel/refs/heads/main/Lyrabrookhaven"))()') end)

CreateTabBtn("Discord", function() TrollTab.Visible = false; ScriptsTab.Visible = false; DiscordTab.Visible = true end)
CreateActionBtn("Copiar Link Discord", DiscordTab, function() setclipboard("https://discord.gg/gUJjJfD9f3") end)

RefreshList()
