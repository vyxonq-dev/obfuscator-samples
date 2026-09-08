local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ CONFIGURAÇÃO DE IDENTIDADE ]]
local LocalPlayer = game:GetService("Players").LocalPlayer
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")

-- [[ CONFIGURAÇÃO DE KEYS ]]
local MASTER_KEY = "RyomemGuDevscriptfunnygoatsbros" 
local PASTEBIN_URL = "https://pastebin.com/raw/vipTQijb"
local DynamicKey = ""
local UserInput = ""

local function UpdateKey()
    local success, result = pcall(function()
        return game:HttpGet(PASTEBIN_URL)
    end)
    if success and result then
        DynamicKey = result:gsub("%s+", "")
    end
end
UpdateKey()

-- [[ BOTÃO FLUTUANTE ]]
local ScreenGui = Instance.new("ScreenGui")
local GetKeyBtn = Instance.new("TextButton")
local UICornerBtn = Instance.new("UICorner")
ScreenGui.Name = "KeyHelper"
ScreenGui.Parent = game:GetService("CoreGui")
GetKeyBtn.Parent = ScreenGui
GetKeyBtn.Size = UDim2.new(0, 100, 0, 35)
GetKeyBtn.Position = UDim2.new(0.5, -50, 0.05, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GetKeyBtn.Text = "COPIAR LINK"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.Font = Enum.Font.SourceSansBold
UICornerBtn.Parent = GetKeyBtn
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://direct-link.net/2523612/6lT6fLM93FvC")
    Rayfield:Notify({Title = "Copiado", Content = "Link da Key copiado!", Duration = 2})
end)

-- [[ VARIÁVEIS DE CONTROLE ]]
local AimbotEnabled = false
local FOVRadius = 150
local XRayEnabled = false
local Autenticado = false 
local AbasCriadas = false
local Camera = workspace.CurrentCamera

-- [[ FUNÇÃO WALL CHECK (VERIFICAR PAREDE) ]]
local function IsVisible(targetPart)
    local character = LocalPlayer.Character
    if not character then return false end
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character, Camera}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local origin = Camera.CFrame.Position
    local direction = targetPart.Position - origin
    local raycastResult = workspace:Raycast(origin, direction, raycastParams)
    
    -- Se o raio não bater em nada ou bater no próprio personagem alvo, ele está visível
    return raycastResult == nil or raycastResult.Instance:IsDescendantOf(targetPart.Parent)
end

-- [[ JANELA PRINCIPAL ]]
local Window = Rayfield:CreateWindow({
   Name = "RyomemGu Aimbot | Mobile Fix",
   LoadingTitle = "RyomemGu System...",
   ConfigurationSaving = { Enabled = false }
})

local LoginTab = Window:CreateTab("Verificação", 4483362458)

LoginTab:CreateInput({
   Name = "Insira a Key",
   PlaceholderText = "Cole a chave aqui...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text) UserInput = Text:gsub("%s+", "") end,
})

LoginTab:CreateButton({
   Name = "Verificar Key",
   Callback = function()
       if Autenticado then return end
       UpdateKey()
       if UserInput == MASTER_KEY or UserInput == DynamicKey then
           Autenticado = true
           ScreenGui:Destroy()
           Rayfield:Notify({Title = "Sucesso", Content = "Acesso Liberado!", Duration = 3})
           
           if not AbasCriadas then
               AbasCriadas = true
               local AimTab = Window:CreateTab("Aimbot", 4483362458)
               local VisualsTab = Window:CreateTab("Visuals", 4483362458)

               AimTab:CreateToggle({Name = "Ativar Aimbot", CurrentValue = false, Callback = function(v) AimbotEnabled = v end})
               AimTab:CreateSlider({Name = "Raio FOV", Range = {30, 500}, Increment = 1, CurrentValue = 150, Callback = function(v) FOVRadius = v end})
               
               VisualsTab:CreateToggle({
                   Name = "X-Ray (Highlights)", 
                   CurrentValue = false, 
                   Callback = function(v) 
                       XRayEnabled = v 
                       if not v then
                           for _, p in pairs(game:GetService("Players"):GetPlayers()) do
                               if p.Character and p.Character:FindFirstChild("RyHighlight") then
                                   p.Character.RyHighlight:Destroy()
                               end
                           end
                       end
                   end
               })
           end
       else
           Rayfield:Notify({Title = "Erro", Content = "Key incorreta!", Duration = 3})
       end
   end,
})

LoginTab:CreateButton({
   Name = "Pegar Link da Key",
   Callback = function()
       setclipboard("https://direct-link.net/2523612/6lT6fLM93FvC")
       Rayfield:Notify({Title = "Copiado", Content = "Link copiado!", Duration = 2})
   end,
})

-- [[ FOV UI ]]
local ScreenGuiFOV = Instance.new("ScreenGui")
local FOVFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
ScreenGuiFOV.Name = "MobileFOVSystem"
ScreenGuiFOV.Parent = game:GetService("CoreGui")
FOVFrame.Parent = ScreenGuiFOV
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.BackgroundTransparency = 1
FOVFrame.Visible = false
UIStroke.Parent = FOVFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FOVFrame

-- [[ LOOP PRINCIPAL ]]
RunService.RenderStepped:Connect(function()
    if not Autenticado then FOVFrame.Visible = false return end
    
    FOVFrame.Visible = AimbotEnabled
    FOVFrame.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2)
    local inset = GuiService:GetGuiInset()
    FOVFrame.Position = UDim2.new(0.5, 0, 0.5, -(inset.Y / 2))

    if AimbotEnabled then
        local target = nil
        local shortestDist = math.huge
        local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, (Camera.ViewportSize.Y / 2) + (inset.Y / 2))

        for _, p in pairs(game:GetService("Players"):GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local hum = p.Character:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    local pos, onScreen = Camera:WorldToViewportPoint(p.Character.Head.Position)
                    if onScreen then
                        local magnitude = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                        if magnitude < shortestDist and magnitude < FOVRadius then
                            -- AQUI ESTÁ A CORREÇÃO: VERIFICA SE ESTÁ ATRÁS DA PAREDE
                            if IsVisible(p.Character.Head) then
                                shortestDist = magnitude
                                target = p.Character.Head
                            end
                        end
                    end
                end
            end
        end
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Position), 0.3)
        end
    end

    -- CORREÇÃO DO X-RAY (ATUALIZAÇÃO CONSTANTE)
    if XRayEnabled then
        for _, p in pairs(game:GetService("Players"):GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                if not p.Character:FindFirstChild("RyHighlight") then
                    local h = Instance.new("Highlight")
                    h.Name = "RyHighlight"
                    h.Parent = p.Character
                    h.FillColor = Color3.fromRGB(255, 0, 0) -- Vermelho
                    h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Contorno branco
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            end
        end
    end
end)