-- >!strict
local Tekscripts = {}
Tekscripts.__index = Tekscripts

-- > imports service
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local IconLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/TekScripts/TekUix/refs/heads/main/src/IconLibrary.lua"))()

-- > local IconLibrary = loadstring(game:HttpGet("http://127.0.0.1:8200/main/IconLibrary.lua"))()

local FALLBACK_ICON_NAME = "grip" 

-- > variáveis de temas
local DESIGN = {
    MainBackground       = Color3.fromRGB(20, 21, 23),  -- Fundo base
    AccentColor          = Color3.fromRGB(90, 160, 255), -- Destaques e Interação
    PrimaryText          = Color3.fromRGB(240, 240, 245), -- Títulos e textos ativos
    SecondaryText        = Color3.fromRGB(150, 150, 155), -- Descrições e elementos desativados
    -- > Janela e Containers
    WindowSize           = UDim2.new(0, 450, 0, 300),
    MinWindowSize        = Vector2.new(320, 260),
    MaxWindowSize        = Vector2.new(720, 470),
    WindowTransparency   = 0.4,
    TabContainerTransp   = 0.15,
    TitleHeight          = 32,
    TitlePadding         = 10,
    ComponentHeight      = 32,
    ComponentPadding     = 3,
    ContainerPadding     = 5,
    CornerRadius         = 6,
    -- > Ícones e Botões
    ButtonIconSize       = 20,
    IconSize             = 24,
    FloatButtonSize      = UDim2.new(0, 130, 0, 42),
    -- > Abas (Tabs)
    TabButtonWidth       = 110,
    TabButtonHeight      = 36,

    DropdownWidth        = 140,
    DropdownItemHeight   = 32,
    SliderHeight         = 24,

    -- > Notificações e Tags
    NotifyWidth          = 250,
    NotifyHeight         = 65,
    TagWidth             = 100,
    TagHeight            = 28,

    HRHeight             = 1,
    ResizeHandleSize     = 14,
    
    -- > Feedback Visual
    AnimationSpeed       = 0.25,
}

local THEME_BINDINGS = {}


local function RegisterThemeItem(key, object, property, callback)
    if not THEME_BINDINGS[key] then THEME_BINDINGS[key] = {} end
    table.insert(THEME_BINDINGS[key], { object = object, property = property, callback = callback })
    
    -- Aplica o valor inicial
    if callback then
        callback(DESIGN[key])
    elseif DESIGN[key] ~= nil then
        object[property] = DESIGN[key]
    end
end

local function ApplyThemeChange(key, newValue)
    DESIGN[key] = newValue
    if THEME_BINDINGS[key] then
        for i = #THEME_BINDINGS[key], 1, -1 do
            local data = THEME_BINDINGS[key][i]
            if data.object and data.object.Parent then
                if data.callback then
                    data.callback(newValue)
                else
                    data.object[data.property] = newValue
                end
            else
                table.remove(THEME_BINDINGS[key], i)
            end
        end
    end
end

-- > Utilitário Visual
local function addRoundedCorners(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or DESIGN.CornerRadius)
    corner.Parent = instance
    return corner
end

-- > temas
local PRESETS = {
    ["Dark Clean"] = {
        MainBackground = Color3.fromRGB(20, 21, 23),
        AccentColor    = Color3.fromRGB(90, 160, 255),
        PrimaryText    = Color3.fromRGB(240, 240, 245),
        SecondaryText  = Color3.fromRGB(150, 150, 155),
    },

    ["Oceanic"] = {
        MainBackground = Color3.fromRGB(15, 20, 25),
        AccentColor    = Color3.fromRGB(42, 160, 200),
        PrimaryText    = Color3.fromRGB(220, 235, 245),
        SecondaryText  = Color3.fromRGB(130, 150, 165),
    },

    ["Midnight Purple"] = {
        MainBackground = Color3.fromRGB(18, 14, 28),
        AccentColor    = Color3.fromRGB(170, 110, 255),
        PrimaryText    = Color3.fromRGB(235, 225, 255),
        SecondaryText  = Color3.fromRGB(155, 145, 180),
    },

    ["Neon Cyber"] = {
        MainBackground = Color3.fromRGB(10, 10, 14),
        AccentColor    = Color3.fromRGB(0, 255, 180),
        PrimaryText    = Color3.fromRGB(220, 255, 245),
        SecondaryText  = Color3.fromRGB(120, 180, 165),
    },

    ["Crimson Dark"] = {
        MainBackground = Color3.fromRGB(22, 16, 16),
        AccentColor    = Color3.fromRGB(220, 70, 70),
        PrimaryText    = Color3.fromRGB(245, 230, 230),
        SecondaryText  = Color3.fromRGB(170, 130, 130),
    },

    ["Forest"] = {
        MainBackground = Color3.fromRGB(18, 22, 18),
        AccentColor    = Color3.fromRGB(90, 180, 120),
        PrimaryText    = Color3.fromRGB(230, 245, 235),
        SecondaryText  = Color3.fromRGB(140, 165, 145),
    },

    ["Slate Gray"] = {
        MainBackground = Color3.fromRGB(30, 32, 36),
        AccentColor    = Color3.fromRGB(140, 150, 170),
        PrimaryText    = Color3.fromRGB(235, 235, 240),
        SecondaryText  = Color3.fromRGB(160, 165, 175),
    },

    ["Amber Night"] = {
        MainBackground = Color3.fromRGB(24, 20, 14),
        AccentColor    = Color3.fromRGB(255, 180, 80),
        PrimaryText    = Color3.fromRGB(255, 240, 210),
        SecondaryText  = Color3.fromRGB(180, 160, 120),
    },

    ["White Clean"] = {
        MainBackground = Color3.fromRGB(245, 246, 248),
        AccentColor    = Color3.fromRGB(60, 100, 220),
        PrimaryText    = Color3.fromRGB(25, 25, 30),
        SecondaryText  = Color3.fromRGB(90, 95, 105),
    },

    ["AMOLED"] = {
        MainBackground = Color3.fromRGB(0, 0, 0),
        AccentColor    = Color3.fromRGB(0, 170, 255),
        PrimaryText    = Color3.fromRGB(240, 240, 240),
        SecondaryText  = Color3.fromRGB(140, 140, 140),
    },
    
    ["Retro Gold"] = {
        MainBackground = Color3.fromRGB(25, 22, 18),
        AccentColor    = Color3.fromRGB(212, 175, 55),
        PrimaryText    = Color3.fromRGB(245, 240, 220),
        SecondaryText  = Color3.fromRGB(160, 150, 130),
    },

    ["Rose Quartz"] = {
        MainBackground = Color3.fromRGB(250, 240, 245),
        AccentColor    = Color3.fromRGB(240, 128, 170),
        PrimaryText    = Color3.fromRGB(60, 40, 50),
        SecondaryText  = Color3.fromRGB(130, 100, 115),
    },

    ["Deep Emerald"] = {
        MainBackground = Color3.fromRGB(10, 25, 22),
        AccentColor    = Color3.fromRGB(45, 200, 150),
        PrimaryText    = Color3.fromRGB(210, 240, 230),
        SecondaryText  = Color3.fromRGB(120, 150, 140),
    },

    ["Dracula"] = {
        MainBackground = Color3.fromRGB(40, 42, 54),
        AccentColor    = Color3.fromRGB(189, 147, 249),
        PrimaryText    = Color3.fromRGB(248, 248, 242),
        SecondaryText  = Color3.fromRGB(139, 233, 253),
    },

    ["Solarized Light"] = {
        MainBackground = Color3.fromRGB(253, 246, 227),
        AccentColor    = Color3.fromRGB(38, 139, 210),
        PrimaryText    = Color3.fromRGB(7, 54, 66),
        SecondaryText  = Color3.fromRGB(101, 123, 131),
    },

    ["Blood Moon"] = {
        MainBackground = Color3.fromRGB(12, 10, 10),
        AccentColor    = Color3.fromRGB(255, 45, 45),
        PrimaryText    = Color3.fromRGB(255, 230, 230),
        SecondaryText  = Color3.fromRGB(150, 100, 100),
    },

    ["Vaporwave"] = {
        MainBackground = Color3.fromRGB(25, 15, 45),
        AccentColor    = Color3.fromRGB(255, 113, 206),
        PrimaryText    = Color3.fromRGB(5, 255, 161),
        SecondaryText  = Color3.fromRGB(185, 103, 255),
    },

    ["Nord"] = {
        MainBackground = Color3.fromRGB(46, 52, 64),
        AccentColor    = Color3.fromRGB(136, 192, 208),
        PrimaryText    = Color3.fromRGB(236, 239, 244),
        SecondaryText  = Color3.fromRGB(164, 172, 188),
    },

    ["Coffee Roast"] = {
        MainBackground = Color3.fromRGB(35, 28, 25),
        AccentColor    = Color3.fromRGB(195, 140, 100),
        PrimaryText    = Color3.fromRGB(245, 235, 225),
        SecondaryText  = Color3.fromRGB(150, 130, 120),
    },

    ["Cyberpunk 2077"] = {
        MainBackground = Color3.fromRGB(15, 15, 15),
        AccentColor    = Color3.fromRGB(243, 231, 0),
        PrimaryText    = Color3.fromRGB(255, 255, 255),
        SecondaryText  = Color3.fromRGB(100, 100, 100),
    },
    
    ["Midnight Sakura"] = {
        MainBackground = Color3.fromRGB(15, 12, 20),
        AccentColor    = Color3.fromRGB(255, 150, 190),
        PrimaryText    = Color3.fromRGB(245, 230, 240),
        SecondaryText  = Color3.fromRGB(160, 140, 155),
    },

    ["Ocean Deep"] = {
        MainBackground = Color3.fromRGB(8, 14, 24),
        AccentColor    = Color3.fromRGB(0, 210, 255),
        PrimaryText    = Color3.fromRGB(220, 245, 255),
        SecondaryText  = Color3.fromRGB(110, 140, 160),
    },

    ["Toxic Neon"] = {
        MainBackground = Color3.fromRGB(18, 18, 18),
        AccentColor    = Color3.fromRGB(170, 255, 0),
        PrimaryText    = Color3.fromRGB(230, 255, 210),
        SecondaryText  = Color3.fromRGB(140, 160, 130),
    },

    ["Frostbite"] = {
        MainBackground = Color3.fromRGB(28, 35, 45),
        AccentColor    = Color3.fromRGB(150, 220, 255),
        PrimaryText    = Color3.fromRGB(255, 255, 255),
        SecondaryText  = Color3.fromRGB(170, 185, 200),
    },

    ["Pumpkin Spice"] = {
        MainBackground = Color3.fromRGB(26, 18, 14),
        AccentColor    = Color3.fromRGB(255, 120, 60),
        PrimaryText    = Color3.fromRGB(255, 240, 220),
        SecondaryText  = Color3.fromRGB(180, 150, 130),
    },

    ["Synthwave 80s"] = {
        MainBackground = Color3.fromRGB(20, 10, 35),
        AccentColor    = Color3.fromRGB(255, 0, 255),
        PrimaryText    = Color3.fromRGB(0, 255, 255),
        SecondaryText  = Color3.fromRGB(180, 100, 255),
    },

    ["Material Dark"] = {
        MainBackground = Color3.fromRGB(33, 33, 33),
        AccentColor    = Color3.fromRGB(187, 134, 252),
        PrimaryText    = Color3.fromRGB(255, 255, 255),
        SecondaryText  = Color3.fromRGB(170, 170, 170),
    },

    ["Pastel Dream"] = {
        MainBackground = Color3.fromRGB(245, 245, 250),
        AccentColor    = Color3.fromRGB(160, 190, 255),
        PrimaryText    = Color3.fromRGB(80, 85, 110),
        SecondaryText  = Color3.fromRGB(160, 165, 180),
    },

    ["Abyssal"] = {
        MainBackground = Color3.fromRGB(5, 7, 10),
        AccentColor    = Color3.fromRGB(100, 130, 180),
        PrimaryText    = Color3.fromRGB(240, 245, 255),
        SecondaryText  = Color3.fromRGB(100, 110, 125),
    },

    ["Royal Velvet"] = {
        MainBackground = Color3.fromRGB(25, 10, 30),
        AccentColor    = Color3.fromRGB(255, 215, 0),
        PrimaryText    = Color3.fromRGB(255, 245, 220),
        SecondaryText  = Color3.fromRGB(180, 150, 190),
    }

}

function SetTheme(presetName)
    local theme = PRESETS[presetName]
    if not theme then return end

    local function run()
        for key, value in pairs(theme) do
            ApplyThemeChange(key, value)
        end
    end
    run()
    run()
end


function GetAvailableThemes()
    local list = {}
    for name in pairs(PRESETS) do
        table.insert(list, name)
    end
    table.sort(list)
    return list
end

-- Exemplo de uso inicial
SetTheme("Coffee Roast")

local Tab = {}
Tab.__index = Tab

-- > Construtor de uma aba individual
function Tab.new(name: string, parent: Instance)
    local self = setmetatable({}, Tab)

    self.Name = name
    self.Components = {}
    self._connections = {}

    -- > Cria o container principal (ScrollingFrame) da aba
    self:_CreateContainer(parent)

    -- > Configura o overlay e box de estado vazio
    self:_SetupEmptyState()

    -- > Configura reaplicação de cores do tema para elementos da aba
    self:_SetupThemeReapplication()

    -- > Controle automático de visibilidade do empty state e scrollbar
    self:_SetupVisibilityControl()

    return self
end

-- > Cria o ScrollingFrame principal da aba
function Tab:_CreateContainer(parent)
    local container = Instance.new("ScrollingFrame")
    self.Container = container

    container.Name = "TabContainer"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1 -- Mantido transparente conforme original
    container.BorderSizePixel = 0
    container.ScrollBarThickness = 4
    container.ScrollBarImageTransparency = 0.4
    container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    container.CanvasSize = UDim2.new(0, 0, 0, 0)
    container.ScrollingDirection = Enum.ScrollingDirection.Y
    container.ClipsDescendants = true -- Garante que itens não "vazem" pelas bordas arredondadas
    container.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius)
    corner.Parent = container

    -- Registro de tema para o ScrollBar (Consistência visual)
    RegisterThemeItem("AccentColor", container, "ScrollBarImageColor3")

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, DESIGN.ContainerPadding)
    padding.PaddingLeft = UDim.new(0, DESIGN.ContainerPadding)
    padding.PaddingRight = UDim.new(0, DESIGN.ContainerPadding)
    padding.PaddingBottom = UDim.new(0, DESIGN.ContainerPadding)
    padding.Parent = container

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, DESIGN.ComponentPadding)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = container
    self._listLayout = listLayout
end

function Tab:_SetupEmptyState()
    local overlay = Instance.new("Frame")
    overlay.Name = "EmptyStateOverlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundTransparency = 1
    overlay.ZIndex = 5
    overlay.Parent = self.Container
    self._overlay = overlay

    local emptyBox = Instance.new("Frame")
    self.EmptyBox = emptyBox
    emptyBox.Size = UDim2.new(0.7, 0, 0, 120)
    emptyBox.AnchorPoint = Vector2.new(0.5, 0.5)
    emptyBox.Position = UDim2.new(0.5, 0, 0.5, 0)
    emptyBox.BorderSizePixel = 0
    emptyBox.Visible = true
    emptyBox.ZIndex = 6
    emptyBox.Parent = overlay

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius)
    corner.Parent = emptyBox

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Parent = emptyBox
    self._emptyStroke = stroke

    RegisterThemeItem("MainBackground", emptyBox, "BackgroundColor3", function(newColor)
        local transparency = self.Container.BackgroundTransparency or 0

        if transparency >= 0.5 then
            emptyBox.BackgroundTransparency = 1
            stroke.Transparency = 1
        else
            emptyBox.BackgroundTransparency = 0.1
            stroke.Transparency = 0.2
            emptyBox.BackgroundColor3 = newColor:Lerp(Color3.new(1, 1, 1), 0.03)
            stroke.Color = newColor:Lerp(Color3.new(1, 1, 1), 0.1)
        end
    end)

    local layout = Instance.new("UIListLayout")
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Padding = UDim.new(0, 10)
    layout.Parent = emptyBox

    local emptyIcon = Instance.new("ImageLabel")
    emptyIcon.Name = "EmptyIcon"
    emptyIcon.Size = UDim2.new(0, 36, 0, 36)
    emptyIcon.BackgroundTransparency = 1
    emptyIcon.ZIndex = 7
    emptyIcon.Parent = emptyBox

    RegisterThemeItem("SecondaryText", emptyIcon, "ImageColor3")

    task.spawn(function()
        local iconAsset = IconLibrary:GetIcon({Icon = "circle-off", Expire = "1d"})
        if iconAsset then
            emptyIcon.Image = iconAsset
        end
    end)

    local emptyText = Instance.new("TextLabel")
    self.EmptyText = emptyText
    emptyText.Size = UDim2.new(1, -30, 0, 0)
    emptyText.AutomaticSize = Enum.AutomaticSize.Y
    emptyText.BackgroundTransparency = 1
    emptyText.Text = "Parece que ainda não há nada aqui."
    emptyText.Font = Enum.Font.GothamMedium
    emptyText.TextSize = 13
    emptyText.TextWrapped = true
    emptyText.ZIndex = 7
    emptyText.Parent = emptyBox

    RegisterThemeItem("SecondaryText", emptyText, "TextColor3")
end

-- > Configura reaplicação de cores específicas da aba
function Tab:_SetupThemeReapplication()
    function self:_reapplyScrollAndEmptyColors()
        self.Container.ScrollBarImageColor3 = DESIGN.ComponentHoverColor
        self.EmptyBox.BackgroundColor3 = DESIGN.EmptyStateBoxColor or Color3.fromRGB(30, 30, 30)
        if self._emptyStroke then
            self._emptyStroke.Color = DESIGN.EmptyStateBorderColor or Color3.fromRGB(80, 80, 80)
        end
    end

    RegisterThemeItem("ComponentHoverColor", self, "_reapplyScrollAndEmptyColors")
    RegisterThemeItem("EmptyStateBoxColor", self, "_reapplyScrollAndEmptyColors")
    RegisterThemeItem("EmptyStateBorderColor", self, "_reapplyScrollAndEmptyColors")
end

-- > Controla visibilidade do empty state e transparência da scrollbar
function Tab:_SetupVisibilityControl()
    self._listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local hasComponents = #self.Components > 0
        self._overlay.Visible = not hasComponents

        local totalContentHeight = self._listLayout.AbsoluteContentSize.Y + (DESIGN.ContainerPadding * 2)
        local containerHeight = self.Container.AbsoluteSize.Y
        self.Container.ScrollBarImageTransparency = totalContentHeight > containerHeight and 0 or 1
    end)
end

-- > Cria a Aba (Lógica de Inicialização)
function Tekscripts:CreateTab(options)
    local title = tostring(options.Title or "Tab")
    
    if self.Tabs[title] then 
        warn("Tekscripts: Aba '" .. title .. "' já existe. Retornando instância existente.")
        return self.Tabs[title] 
    end

    local iconPath = nil
    if options.Icon and type(options.Icon) == "string" then
        iconPath = IconLibrary:GetIcon({
            Icon = options.Icon,
            Expire = options.Expire or "7d" -- Aumentado para 7 dias para melhor consistência de cache
        })
    end

    -- Instanciação da Aba
    local tab = Tab.new(title, self.TabContentContainer)
    tab._parentRef = self
    tab.IconPath = iconPath
    
    self.Tabs[title] = tab

    -- Criação do elemento visual (Botão na Sidebar)
    tab:_CreateTabButton(self)

    if (self.startTab == title) or (not self.CurrentTab) then
        task.spawn(function() 
            self:SetActiveTab(tab) 
        end)
    end

    -- Atualiza visibilidade do aviso de "Sem abas"
    if self.NoTabsLabel then
        self.NoTabsLabel.Visible = false
    end

    local originalDestroy = tab.Destroy
    function tab:Destroy()
        if self._destroyed then return end
        self._destroyed = true
        
        -- Fecha a aba se ela estiver ativa antes de destruir
        if self._parentRef.CurrentTab == self then
            self._parentRef.CurrentTab = nil
        end

        -- Limpeza de elementos físicos
        if self.Button then self.Button:Destroy() end
        if self.Container then self.Container:Destroy() end
        
        -- Desconexão de eventos (Prevenção de Memory Leak)
        if self._connections then
            for _, conn in pairs(self._connections) do
                if typeof(conn) == "RBXScriptConnection" then conn:Disconnect() end
            end
        end
        
        -- Limpeza de referências no objeto pai
        if self._parentRef and self._parentRef.Tabs then
            self._parentRef.Tabs[title] = nil
            
            -- Se não restarem abas, mostra o NoTabsLabel
            if next(self._parentRef.Tabs) == nil and self._parentRef.NoTabsLabel then
                self._parentRef.NoTabsLabel.Visible = true
            end
        end

        -- Chama o destroy base se existir e limpa a tabela
        if originalDestroy then originalDestroy(self) end
        table.clear(self)
        setmetatable(self, nil)
    end

    return tab
end

-- > Cria o Botão da Aba com Registro de Tema
function Tab:_CreateTabButton(parentWindow)
    local hasIcon = self.IconPath ~= nil
    
    local button = Instance.new("TextButton")
    self.Button = button
    button.Name = self.Name
    button.Text = "" 
    button.Size = UDim2.new(1, 0, 0, DESIGN.TabButtonHeight or 36)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.ClipsDescendants = true 
    button.ZIndex = 3
    button.Parent = parentWindow.TabContainer

    addRoundedCorners(button, DESIGN.CornerRadius or 4)

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.Padding = UDim.new(0, 8)
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Parent = button

    Instance.new("UIPadding", button).PaddingLeft = UDim.new(0, 10)

    -- > Ícone com suporte a Tema
    if hasIcon then
        local iconImage = Instance.new("ImageLabel")
        iconImage.Name = "Icon"
        iconImage.BackgroundTransparency = 1
        iconImage.Size = UDim2.new(0, 16, 0, 16)
        iconImage.Image = self.IconPath 
        iconImage.ZIndex = 4
        iconImage.Parent = button
        self._iconLabel = iconImage
        
        -- Registro de Tema do Ícone (Respeita o estado Ativo/Inativo)
        RegisterThemeItem("SecondaryText", iconImage, "ImageColor3", function(newColor)
            if parentWindow.CurrentTab == self then
                iconImage.ImageColor3 = DESIGN.AccentColor
            else
                iconImage.ImageColor3 = newColor
            end
        end)
    end

    -- > Texto com suporte a Tema
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Title"
    textLabel.BackgroundTransparency = 1
    textLabel.Text = self.Name
    textLabel.Size = UDim2.new(1, hasIcon and -30 or -10, 1, 0) 
    textLabel.Font = Enum.Font.GothamMedium
    textLabel.TextSize = 13
    textLabel.TextScaled = true 
    textLabel.TextWrapped = true 
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.ZIndex = 4
    textLabel.Parent = button
    self._textLabel = textLabel

    local sizeConstraint = Instance.new("UITextSizeConstraint")
    sizeConstraint.MaxTextSize = 13
    sizeConstraint.MinTextSize = 9 
    sizeConstraint.Parent = textLabel

    -- Registro de Tema do Texto
    RegisterThemeItem("SecondaryText", textLabel, "TextColor3", function(newColor)
        if parentWindow.CurrentTab == self then
            textLabel.TextColor3 = DESIGN.PrimaryText
        else
            textLabel.TextColor3 = newColor
        end
    end)

    -- Registro de Tema do Background (Destaque da Aba Selecionada)
    RegisterThemeItem("AccentColor", button, "BackgroundColor3", function(newColor)
        if parentWindow.CurrentTab == self then
            button.BackgroundColor3 = newColor
            button.BackgroundTransparency = 0.88
        end
    end)

    button.MouseEnter:Connect(function()
        if parentWindow.CurrentTab ~= self then
            local hoverCol = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.15)
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.9,
                BackgroundColor3 = hoverCol
            }):Play()
        end
    end)

    button.MouseLeave:Connect(function()
        if parentWindow.CurrentTab ~= self then
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
        end
    end)

    table.insert(self._connections, button.MouseButton1Click:Connect(function()
        if not parentWindow.Blocked then
            parentWindow:SetActiveTab(self)
        end
    end))

    self.Container.Visible = false
end

-- > Ativa a Aba (Sincronizado com DESIGN)
function Tekscripts:SetActiveTab(tab)
    local TweenService = game:GetService("TweenService")
    local T_INFO = TweenInfo.new(DESIGN.AnimationSpeed)

    if self.CurrentTab and self.CurrentTab ~= tab then
        local old = self.CurrentTab
        old.Container.Visible = false
        TweenService:Create(old.Button, T_INFO, {BackgroundTransparency = 1}):Play()
        TweenService:Create(old._textLabel, T_INFO, {TextColor3 = DESIGN.SecondaryText}):Play()
        if old._iconLabel then
            TweenService:Create(old._iconLabel, T_INFO, {ImageColor3 = DESIGN.SecondaryText}):Play()
        end
    end

    self.CurrentTab = tab
    if tab then
        tab.Container.Visible = true
        
        -- Ativação visual usando as cores globais de DESIGN
        TweenService:Create(tab.Button, T_INFO, {
            BackgroundTransparency = 0.88,
            BackgroundColor3 = DESIGN.AccentColor
        }):Play()
        
        TweenService:Create(tab._textLabel, T_INFO, {TextColor3 = DESIGN.PrimaryText}):Play()
        
        if tab._iconLabel then
            TweenService:Create(tab._iconLabel, T_INFO, {ImageColor3 = DESIGN.AccentColor}):Play()
        end
    end
end

function Tekscripts.new(options: { 
    Name: string?, 
    SubTitle: string?,           -- > Adicionado: Texto secundário abaixo do título
    Parent: Instance?, 
    FloatText: string?, 
    startTab: string?, 
    iconId: string?, 
    Transparent: boolean?, 
    TabContainerTransp: number?, 
    WindowTransparency: number?,
    LoadScreen: boolean?,       
    Loading: table?             
})
    options = options or {}

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer

    local isTransparentEnabled = options.Transparent ~= false

    -- > Estrutura de Estado e Cache
    local self = setmetatable({
        ScreenGui = nil,
        Window = nil,
        TitleBar = nil,
        Title = nil,             -- > Cache da label principal
        SubTitleLabel = nil,     -- > Cache da label secundária
        TabContainer = nil,
        TabContentContainer = nil,
        ResizeHandle = nil,
        FloatButton = nil,
        EdgeButtons = {},
        Connections = {},
        BlockScreen = nil,
        Blocked = false,
        MinimizedState = nil,
        Tabs = {},
        CurrentTab = nil,
        IsDragging = false,
        IsResizing = false,

        -- > Persistência de Dados
        Config = {
            Name = options.Name or "Tekscripts",
            SubTitle = options.SubTitle or "",
            Parent = options.Parent,
            FloatText = options.FloatText or "abrir",
            startTab = options.startTab,
            iconId = options.iconId,
            Transparent = isTransparentEnabled,
            WindowTransparency = options.WindowTransparency or DESIGN.WindowTransparency or 0.1,
            TabContainerTransp = options.TabContainerTransp or DESIGN.TabContainerTransp or 0.1,
        },

        Actions = {},
    }, Tekscripts)

    -- > Sistema de Sincronização de Configurações
    function self:SetConfig(key, value)
        self.Config[key] = value
        local actionList = self.Actions[key]
        if actionList then
            for _, fn in ipairs(actionList) do
                fn(value, self)
            end
        end
    end

    function self:GetConfig(key)
        return self.Config[key]
    end

    function self:BindAction(key, fn)
        if not self.Actions[key] then
            self.Actions[key] = {}
        end
        table.insert(self.Actions[key], fn)
    end

    -- > Cálculos de Responsividade
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local responsiveScale = isMobile and 0.85 or 1.0

    self:_CreateScreenGui(options, localPlayer)

    local finalWindowSize = self:_GetWindowSize()
    local finalWindowPos = self:_GetWindowPosition()
    local finalAnchorPoint = self._isSmallScreen and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)

    local isLoading = options.LoadScreen == true and options.Loading ~= nil

    local finalWinTransp = self.Config.Transparent and self.Config.WindowTransparency or 0
    local finalTabTransp = self.Config.Transparent and self.Config.TabContainerTransp or 0

    -- > Inicialização da Interface
    self:_CreateMainWindow(isLoading, finalWindowSize, finalWindowPos, finalAnchorPoint, responsiveScale, finalWinTransp)
    self:_SetupTitleBar(isLoading, options, responsiveScale, finalWinTransp)
    self:_SetupCloseDropdown()
    self:_SetupTabContainers(finalTabTransp, finalWinTransp, isLoading)
    self:_SetupAdditionalComponents(self.Config.FloatText)
    self:_SetupThemeReapplication()

    self:BindAction("SubTitle", function(value)
        if self.SubTitleLabel then
            self.SubTitleLabel.Text = tostring(value)
            self.SubTitleLabel.Visible = (value ~= "" and value ~= nil)
        end
    end)

    self:BindAction("Name", function(value)
        if self.Title then
            self.Title.Text = tostring(value)
        end
    end)

    self:BindAction("WindowTransparency", function(value)
        if self.Window then
            self.Window.BackgroundTransparency = value
        end
    end)

    self:BindAction("TabContainerTransp", function(value)
        if self.TabContainer then
            self.TabContainer.BackgroundTransparency = value
        end
    end)

    self:BindAction("FloatText", function(value)
        if self.FloatButton and self.FloatButton:FindFirstChild("Text") then
            self.FloatButton.Text.Text = value
        end
    end)

    -- > Gerenciamento de Vida do Script
    self.Connections.PlayerRemoving = Players.PlayerRemoving:Connect(function(player)
        if player == localPlayer then
            self:Destroy()
        end
    end)

    if isLoading then
        self:_SetupLoadingScreen(options.Loading, finalWindowSize, finalWindowPos, finalAnchorPoint)
    end

    return self
end

-- > Cria o ScreenGui e define propriedades básicas
function Tekscripts:_CreateScreenGui(options, localPlayer)
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = options.Name or "TEKSCRIPTS"
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.Parent = options.Parent or localPlayer:WaitForChild("PlayerGui")
end

function Tekscripts:_CreateMainWindow(isLoading, finalSize, finalPos, finalAnchor, scale, transparency)
    local window = Instance.new("Frame")
    self.Window = window
    
    if isLoading then
        window.Size = UDim2.new(0, 280 * scale, 0, 120 * scale)
        window.Position = UDim2.new(0.5, 0, 0.5, 0)
        window.AnchorPoint = Vector2.new(0.5, 0.5)
    else
        window.Size = finalSize
        window.Position = finalPos
        window.AnchorPoint = finalAnchor
    end

    window.Name = "MainWindow"
    window.BackgroundTransparency = transparency or DESIGN.WindowTransparency
    window.BorderSizePixel = 0
    window.ClipsDescendants = true -- > Essencial para esconder o box do título que "sobra"
    window.Parent = self.ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius)
    corner.Parent = window

    local uiScale = Instance.new("UIScale")
    uiScale.Scale = scale
    uiScale.Parent = window

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Parent = window
    self._windowGradient = gradient  

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = window

    -- > Registro de Tema Dinâmico com profundidade
    RegisterThemeItem("MainBackground", window, "BackgroundColor3", function(newColor)
        window.BackgroundColor3 = newColor
        local colorBottom = newColor:Lerp(Color3.new(0, 0, 0), 0.15)
        gradient.Color = ColorSequence.new(newColor, colorBottom)
        stroke.Color = newColor:Lerp(Color3.new(1, 1, 1), 0.08)
    end)
end

function Tekscripts:_ApplyTitleText(text)
    if not self.Title then return end
    self.Title.Text = tostring(text or "")
end

function Tekscripts:_ApplySubTitleText(text)
    if not self.SubTitleLabel then return end
    self.SubTitleLabel.Text = tostring(text or "")
end

function Tekscripts:SetTitle(text)
    self:_ApplyTitleText(text)
end

function Tekscripts:SetSubTitle(text)
    self:_ApplySubTitleText(text)
end

function Tekscripts:_UpdateLayout()
    if not self.TabContainer or not self.TabContentContainer or not self.TitleBar then return end

    local titleH = self.TitleBar.Size.Y.Offset
    local tabSize = self:_GetTabContainerSize()
    local isExpanded = self.TabsExpanded

    if isExpanded == nil then
        self.TabsExpanded = true
        isExpanded = true
    end

    if isExpanded then
        self.TabContainer.Position = UDim2.new(0, 0, 0, titleH)
        self.TabContainer.Size = UDim2.new(tabSize.X.Scale, tabSize.X.Offset, 1, -titleH)

        self.TabContentContainer.Position = UDim2.new(tabSize.X.Scale, tabSize.X.Offset, 0, titleH)
        self.TabContentContainer.Size = UDim2.new(1 - tabSize.X.Scale, -tabSize.X.Offset, 1, -titleH)
    else
        self.TabContainer.Position = UDim2.new(-tabSize.X.Scale, -tabSize.X.Offset - 50, 0, titleH)

        self.TabContentContainer.Position = UDim2.new(0, 0, 0, titleH)
        self.TabContentContainer.Size = UDim2.new(1, 0, 1, -titleH)
    end

    if self.CloseButtonContainer and self.CloseButtonContainer.Visible and self._controlBtn then
        local absCtrl = self._controlBtn.AbsolutePosition
        local absWin = self.Window.AbsolutePosition

        local x = (absCtrl.X - absWin.X) - self.CloseButtonContainer.AbsoluteSize.X + 20
        self.CloseButtonContainer.Position = UDim2.new(0, x, 0, titleH + 5)
    end
end

function Tekscripts:_SetupTitleBar(isLoading, options)
    local hasSub = options.SubTitle ~= nil and options.SubTitle ~= ""
    local initialHeight = hasSub and (DESIGN.TitleHeight + 1) or DESIGN.TitleHeight

    -- > Janela principal da barra de título
    self.TitleBar = Instance.new("Frame")
    self.TitleBar.Name = "TitleBar"
    self.TitleBar.Size = UDim2.new(1, 0, 0, initialHeight)
    self.TitleBar.BackgroundTransparency = 1 
    self.TitleBar.BorderSizePixel = 0
    self.TitleBar.ClipsDescendants = false 
    self.TitleBar.Visible = not isLoading
    self.TitleBar.ZIndex = 20
    self.TitleBar.Parent = self.Window

    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 1, 0)
    header.BackgroundTransparency = 1
    header.ZIndex = 21
    header.Parent = self.TitleBar

    local globalPadding = Instance.new("UIPadding")
    globalPadding.PaddingTop = UDim.new(0, 4)
    globalPadding.PaddingLeft = UDim.new(0, 12)
    globalPadding.PaddingRight = UDim.new(0, 12)
    globalPadding.Parent = header

    local leftContent = Instance.new("Frame")
    leftContent.Size = UDim2.new(1, -110, 1, 0)
    leftContent.BackgroundTransparency = 1
    leftContent.ZIndex = 22
    leftContent.Parent = header

    local leftLayout = Instance.new("UIListLayout")
    leftLayout.FillDirection = Enum.FillDirection.Horizontal
    leftLayout.VerticalAlignment = Enum.VerticalAlignment.Top 
    leftLayout.Padding = UDim.new(0, 10)
    leftLayout.Parent = leftContent

    local iconSize = 0
    if options.iconId then
        iconSize = DESIGN.IconSize or 20
        local icon = Instance.new("ImageLabel")
        icon.Name = "MainIcon"
        icon.Image = options.iconId
        icon.Size = UDim2.new(0, iconSize, 0, iconSize)
        icon.BackgroundTransparency = 1
        icon.ZIndex = 23
        icon.Parent = leftContent
        
        -- Caso queira uma cor fixa, use: icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end

    local textContainer = Instance.new("Frame")
    textContainer.Name = "TextContainer"
    textContainer.Size = UDim2.new(1, -(iconSize + 5), 1, 0)
    textContainer.BackgroundTransparency = 1
    textContainer.ZIndex = 23
    textContainer.Parent = leftContent

    local textLayout = Instance.new("UIListLayout")
    textLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    textLayout.SortOrder = Enum.SortOrder.LayoutOrder
    textLayout.Padding = UDim.new(0, -3)
    textLayout.Parent = textContainer

    -- > Título Principal (Vinculado ao tema)
    local title = Instance.new("TextLabel")
    self.Title = title
    title.Text = options.Name or "Tekscripts"
    title.Size = UDim2.new(1, 0, 0, 15)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.LayoutOrder = 1
    title.ZIndex = 24
    title.Parent = textContainer
    RegisterThemeItem("PrimaryText", title, "TextColor3")

    -- > Subtítulo (Vinculado ao tema secundário)
    local subTitle = Instance.new("TextLabel")
    self.SubTitleLabel = subTitle
    subTitle.Text = options.SubTitle or ""
    subTitle.Size = UDim2.new(1, 0, 0, 10)
    subTitle.BackgroundTransparency = 1
    subTitle.Font = Enum.Font.Gotham
    subTitle.TextSize = 9
    subTitle.TextXAlignment = Enum.TextXAlignment.Left
    subTitle.LayoutOrder = 2
    subTitle.ZIndex = 24
    subTitle.Parent = textContainer
    RegisterThemeItem("SecondaryText", subTitle, "TextColor3")

    -- > Inicialização de sistemas dependentes
    self:_SetupTitleBarButtons(header)
    self:SetupDragSystem()
end

function Tekscripts:_SetupTitleBarButtons(parent)
    -- Container dos botões: Ajustado para ocupar toda a altura (1, 0) para facilitar o alinhamento central
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Name = "ButtonContainer"
    buttonFrame.Size = UDim2.new(0, 120, 1, 0) -- Largura aumentada para acomodar botões maiores
    buttonFrame.Position = UDim2.new(1, -10, 0, 0) -- Recuo de 10px da borda direita
    buttonFrame.AnchorPoint = Vector2.new(1, 0)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.ZIndex = 25
    buttonFrame.Parent = parent

    -- Layout: Centralização vertical e alinhamento à direita
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    layout.VerticalAlignment = Enum.VerticalAlignment.Center -- --> Garante centralização vertical
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 12) -- Espaçamento entre botões
    layout.Parent = buttonFrame

    local function createBtn(name, iconName, order, accent)
        local btn = Instance.new("ImageButton")
        btn.Name = name
        -- Tamanho aumentado de 14 para 22 para melhor experiência visual e de clique
        btn.Size = UDim2.new(0, 22, 0, 22) 
        btn.BackgroundTransparency = 1
        btn.LayoutOrder = order
        btn.ZIndex = 26
        
        -- Persistência visual: Mantém a proporção 1:1 do ícone
        local ratio = Instance.new("UIAspectRatioConstraint")
        ratio.Parent = btn

        -- Cache de ícones com expiração conforme solicitado
        btn.Image = IconLibrary:GetIcon({Icon = iconName, Expire = "7d"}) or ""
        btn.Parent = buttonFrame
        
        if accent then 
            RegisterThemeItem("AccentColor", btn, "ImageColor3") 
        else 
            RegisterThemeItem("SecondaryText", btn, "ImageColor3") 
        end
        
        return btn
    end

    -- Criação dos botões
    local toggleSidebarBtn = createBtn("ToggleSidebarBtn", "columns-2", 1, false)
    self._controlBtn = createBtn("ControlBtn", "ellipsis", 2, true)
    local minimizeBtn = createBtn("MinimizeButton", "minus", 3, false)

    -- Eventos com feedback visual (Tweens)
    self.Connections.ToggleSidebar = toggleSidebarBtn.MouseButton1Click:Connect(function()
        if not self.Blocked then
            -- Controle de estado da UI
            self.TabsExpanded = not self.TabsExpanded
            self:_UpdateLayout()
            
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            game:GetService("TweenService"):Create(toggleSidebarBtn, tweenInfo, {ImageTransparency = 0.5}):Play()
            task.delay(0.1, function()
                if toggleSidebarBtn then
                    game:GetService("TweenService"):Create(toggleSidebarBtn, tweenInfo, {ImageTransparency = 0}):Play()
                end
            end)
        end
    end)

    self.Connections.MinimizeClick = minimizeBtn.MouseButton1Click:Connect(function()
        -- Persistência de estado: Minimiza a interface tratando bugs de cliques repetitivos
        if not self.Blocked then self:Minimize() end
    end)
end

function Tekscripts:_SetupTabContainers(tabTransparency, winTransparency, isLoading)
    self.TabsExpanded = (self.TabsExpanded == nil) and true or self.TabsExpanded
    self._TabOrderCounter = 0

    self.TabContainer = Instance.new("ScrollingFrame")
    self.TabContainer.Name = "TabSideBar"
    self.TabContainer.BackgroundTransparency = tabTransparency
    self.TabContainer.BorderSizePixel = 0
    self.TabContainer.ScrollBarThickness = 2
    self.TabContainer.ScrollBarImageTransparency = 1
    self.TabContainer.ScrollingDirection = Enum.ScrollingDirection.Y
    self.TabContainer.ElasticBehavior = Enum.ElasticBehavior.Never
    self.TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    self.TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    self.TabContainer.Visible = not isLoading
    self.TabContainer.ClipsDescendants = true
    self.TabContainer.Parent = self.Window

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius)
    corner.Parent = self.TabContainer

    self.TabContentContainer = Instance.new("Frame")
    self.TabContentContainer.Name = "ContentArea"
    self.TabContentContainer.BackgroundTransparency = winTransparency
    self.TabContentContainer.BorderSizePixel = 0
    self.TabContentContainer.Visible = not isLoading
    self.TabContentContainer.Parent = self.Window

    local function syncLayoutState()
        local topOffset = self.TitleBar and self.TitleBar.Size.Y.Offset or 30
        local currentTabSize = self:_GetTabContainerSize()

        if self.TabsExpanded then
            self.TabContainer.Size = UDim2.new(currentTabSize.X.Scale, currentTabSize.X.Offset, 1, -topOffset)
            self.TabContainer.Position = UDim2.new(0, 0, 0, topOffset)

            self.TabContentContainer.Size = UDim2.new(1 - currentTabSize.X.Scale, -currentTabSize.X.Offset, 1, -topOffset)
            self.TabContentContainer.Position = UDim2.new(currentTabSize.X.Scale, currentTabSize.X.Offset, 0, topOffset)
        else
            self.TabContainer.Position = UDim2.new(-0.5, 0, 0, topOffset)

            self.TabContentContainer.Size = UDim2.new(1, 0, 1, -topOffset)
            self.TabContentContainer.Position = UDim2.new(0, 0, 0, topOffset)
        end
    end

    if self.TitleBar then
        self.TitleBar:GetPropertyChangedSignal("Size"):Connect(syncLayoutState)
    end
    self.Window:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncLayoutState)
    syncLayoutState()

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 4)
    padding.PaddingBottom = UDim.new(0, 4)
    padding.Parent = self.TabContainer

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = self.TabContainer

    local function applyLayoutOrder(instance)
        if instance:IsA("GuiObject") and instance ~= layout and instance ~= padding then
            self._TabOrderCounter += 1
            instance.LayoutOrder = self._TabOrderCounter
        end
    end

    for _, child in ipairs(self.TabContainer:GetChildren()) do
        applyLayoutOrder(child)
    end

    self.TabContainer.ChildAdded:Connect(applyLayoutOrder)

    local fadeTween
    local function setScrollVisible(state)
        if fadeTween then
            fadeTween:Cancel()
        end
        fadeTween = TweenService:Create(
            self.TabContainer,
            TweenInfo.new(0.15),
            { ScrollBarImageTransparency = state and 0.6 or 1 }
        )
        fadeTween:Play()
    end

    self.TabContainer:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        setScrollVisible(true)
        task.delay(0.5, function()
            setScrollVisible(false)
        end)
    end)

    RegisterThemeItem("MainBackground", self.TabContainer, "BackgroundColor3")
    RegisterThemeItem("MainBackground", self.TabContentContainer, "BackgroundColor3")
end

function Tekscripts:SetTabsVisible(visible)
    self.TabsExpanded = visible
    local tabSize = self:_GetTabContainerSize()
    local topOffset = self.TitleBar and self.TitleBar.Size.Y.Offset or DESIGN.TitleHeight
    local info = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    local targets = {
        -- Sidebar vai para 0 (visível) ou para fora da tela (escondida)
        TabPos = visible and UDim2.new(0, 0, 0, topOffset) 
                           or UDim2.new(-tabSize.X.Scale, -tabSize.X.Offset - 10, 0, topOffset),
        
        -- Conteúdo expande para ocupar o lugar da sidebar ou retrai
        ContentPos = visible and UDim2.new(tabSize.X.Scale, tabSize.X.Offset, 0, topOffset)
                              or UDim2.new(0, 0, 0, topOffset),
        
        ContentSize = visible and UDim2.new(1 - tabSize.X.Scale, -tabSize.X.Offset, 1, -topOffset)
                               or UDim2.new(1, 0, 1, -topOffset)
    }

    TweenService:Create(self.TabContainer, info, {Position = targets.TabPos}):Play()
    TweenService:Create(self.TabContentContainer, info, {
        Position = targets.ContentPos,
        Size = targets.ContentSize
    }):Play()
end

function Tekscripts:_SetupCloseDropdown()
    self.CloseButtonContainer = Instance.new("Frame")
    local width = DESIGN.DropdownWidth or 120
    local height = DESIGN.DropdownItemHeight or 30
    
    self.CloseButtonContainer.Name = "ControlDropdown"
    self.CloseButtonContainer.Size = UDim2.new(0, width, 0, height + 10)
    self.CloseButtonContainer.Visible = false
    self.CloseButtonContainer.ZIndex = 50
    self.CloseButtonContainer.Parent = self.Window
    
    addRoundedCorners(self.CloseButtonContainer, 4)
    
    local stroke = Instance.new("UIStroke")
    stroke.Transparency = 0.5
    stroke.Parent = self.CloseButtonContainer

    -- > Registro de Tema (Fundo e Contorno do Dropdown)
    RegisterThemeItem("MainBackground", self.CloseButtonContainer, "BackgroundColor3", function(newColor)
        -- Mantém o dropdown levemente mais claro que o fundo principal para contraste
        self.CloseButtonContainer.BackgroundColor3 = newColor:Lerp(Color3.new(1, 1, 1), 0.1)
    end)
    
    RegisterThemeItem("AccentColor", stroke, "Color")

    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "Fechar"
    closeBtn.Size = UDim2.new(1, -10, 1, -10)
    closeBtn.Position = UDim2.new(0, 5, 0, 5)
    -- Intenção: Cor de erro/fechar fixa para segurança visual e aviso crítico
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 100) 
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 12
    closeBtn.ZIndex = 51
    closeBtn.Parent = self.CloseButtonContainer
    addRoundedCorners(closeBtn, 4)

    -- > Conexões (Lógica preservada)
    self.Connections.CloseClick = closeBtn.MouseButton1Click:Connect(function()
        self:Destroy()
    end)

    self.Connections.ControlBtn = self._controlBtn.MouseButton1Click:Connect(function()
        local visible = not self.CloseButtonContainer.Visible
        self.CloseButtonContainer.Visible = visible
        if visible then
            local absCtrl = self._controlBtn.AbsolutePosition
            local absWin = self.Window.AbsolutePosition
            local size = self.CloseButtonContainer.AbsoluteSize
            self.CloseButtonContainer.Position = UDim2.new(0, (absCtrl.X - absWin.X) - size.X + 20, 0, DESIGN.TitleHeight + 5)
        end
    end)
end

function Tekscripts:_SetupAdditionalComponents(floatText)
    self:SetupResizeSystem()
    self:SetupFloatButton(floatText)

    self.BlockScreen = Instance.new("Frame")
    self.BlockScreen.Name = "BlockScreen"
    self.BlockScreen.Size = UDim2.new(1, 0, 1, 0)
    self.BlockScreen.BackgroundTransparency = 0.65 
    self.BlockScreen.ZIndex = 99 
    self.BlockScreen.Visible = false
    self.BlockScreen.Parent = self.ScreenGui

    RegisterThemeItem("MainBackground", self.BlockScreen, "BackgroundColor3", function(newColor)
        self.BlockScreen.BackgroundColor3 = newColor:Lerp(Color3.new(0, 0, 0), 0.5)
    end)

    local blur = Instance.new("BlurEffect")
    blur.Size = 0 
    blur.Enabled = true
    blur.Parent = game:GetService("Lighting")
    self.BlurEffect = blur
end

-- > Configura o sistema de reaplicação de tema
function Tekscripts:_SetupThemeReapplication()
    function self:_reapplyThemeColors()
        -- > Definições de Transparência (Cache e Persistência)
        local winTransp = self._useThemeTransparency and (self._userWindowTransparency or DESIGN.WindowTransparency) or (DESIGN.WindowTransparency or 0.1)
        local tabTransp = self._useThemeTransparency and (self._userTabContainerTransparency or DESIGN.TabContainerTransp) or (DESIGN.TabContainerTransp or 0.1)

        -- > Recálculo de Cores Derivadas (O segredo das 4 variáveis)
        local colorMain = DESIGN.MainBackground
        local colorDark = colorMain:Lerp(Color3.new(0, 0, 0), 0.15) -- Para gradientes e títulos
        local colorLight = colorMain:Lerp(Color3.new(1, 1, 1), 0.05) -- Para áreas de conteúdo
        local colorStroke = colorMain:Lerp(Color3.new(1, 1, 1), 0.1)

        -- 1. Janela Principal e Gradiente
        if self.Window then
            self.Window.BackgroundColor3 = colorMain
            self.Window.BackgroundTransparency = winTransp
            if self._windowGradient then
                self._windowGradient.Color = ColorSequence.new(colorMain, colorDark)
            end
        end

        -- 2. Barra de Título
        if self.TitleBar then
            self.TitleBar.BackgroundColor3 = colorDark
            self.TitleBar.BackgroundTransparency = winTransp
            if self.Title then
                self.Title.TextColor3 = DESIGN.PrimaryText
            end
        end

        -- 3. Containers de Abas e Conteúdo
        if self.TabContainer then
            self.TabContainer.BackgroundColor3 = colorDark:Lerp(colorMain, 0.5)
            self.TabContainer.BackgroundTransparency = tabTransp
        end

        if self.TabContentContainer then
            self.TabContentContainer.BackgroundColor3 = colorMain
            self.TabContentContainer.BackgroundTransparency = winTransp
        end

        -- 4. Botões de Controle (Ellipsis/Minimize)
        if self._controlBtn then
            self._controlBtn.ImageColor3 = DESIGN.AccentColor
        end

        -- 5. Dropdown de Fechar (Close Button)
        if self.CloseButtonContainer then
            self.CloseButtonContainer.BackgroundColor3 = colorMain:Lerp(Color3.new(1, 1, 1), 0.1)
            if self.CloseButton then
                -- O botão de fechar mantém uma cor de alerta ou usa o AccentColor
                -- Intenção: Manter visibilidade crítica
                local stroke = self.CloseButtonContainer:FindFirstChildOfClass("UIStroke")
                if stroke then stroke.Color = DESIGN.AccentColor end
            end
        end

        -- 6. Estados Vazios e Bloqueio
        if self.NoTabsLabel then
            self.NoTabsLabel.TextColor3 = DESIGN.SecondaryText
        end

        if self.BlockScreen then
            self.BlockScreen.BackgroundColor3 = colorMain:Lerp(Color3.new(0, 0, 0), 0.5)
        end

        -- 7. Componentes Flutuantes e Extras
        if self.ResizeHandle and self.ResizeHandle._reapply then
            self.ResizeHandle:_reapply()
        end

        if self.FloatButton then
            -- Intenção: Atualizar o botão flutuante para o novo AccentColor
            local grad = self.FloatButton:FindFirstChildOfClass("UIGradient")
            if grad then
                grad.Color = ColorSequence.new(DESIGN.AccentColor, DESIGN.AccentColor:Lerp(Color3.new(0,0,0), 0.2))
            end
            local actionBtn = self.FloatButton:FindFirstChild("ActionButton")
            if actionBtn then actionBtn.TextColor3 = DESIGN.MainBackground end
        end

        -- 8. Atualizar Aba Ativa se existir
        if self.CurrentTab then
            self:SetActiveTab(self.CurrentTab)
        end
    end

    -- > Registro de Gatilhos (Apenas as 4 Variáveis Mestras + Transparências)
    -- Intenção: Reduzir o loop de monitoramento para apenas o que é essencial
    local coreKeys = {
        "MainBackground", 
        "AccentColor", 
        "PrimaryText", 
        "SecondaryText",
        "WindowTransparency", 
        "TabContainerTransp"
    }

    for _, key in ipairs(coreKeys) do
        RegisterThemeItem(key, self, "_reapplyThemeColors")
    end
end


-- > Configura e executa a animação do loading screen
function Tekscripts:_SetupLoadingScreen(config, finalSize, finalPos, finalAnchor)
    self.Blocked = true

    -- > Container de Conteúdo
    local content = Instance.new("Frame")
    content.Name = "LoadingContent"
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.Size = UDim2.new(1, -32, 0, 0)
    content.Position = UDim2.new(0, 16, 0, 16)
    content.BackgroundTransparency = 1
    content.Parent = self.Window

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    layout.Padding = UDim.new(0, 4)
    layout.Parent = content

    -- > Título (PrimaryText)
    local title = Instance.new("TextLabel")
    title.Text = config.Title or "Carregando"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = DESIGN.PrimaryText
    title.AutomaticSize = Enum.AutomaticSize.Y
    title.Size = UDim2.new(1, 0, 0, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1
    title.Parent = content

    -- > Descrição (SecondaryText)
    local desc = Instance.new("TextLabel")
    desc.Text = config.Desc or "Aguarde a inicialização..."
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 12
    desc.TextColor3 = DESIGN.SecondaryText
    desc.AutomaticSize = Enum.AutomaticSize.Y
    desc.Size = UDim2.new(1, 0, 0, 0)
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.BackgroundTransparency = 1
    desc.Parent = content

    -- > Spinner Minimalista (AccentColor)
    -- Intenção: Usar o AccentColor para guiar o olho do usuário para o progresso
    local spinner = Instance.new("Frame")
    spinner.Name = "MinimalSpinner"
    spinner.Size = UDim2.new(0, 16, 0, 16)
    spinner.Position = UDim2.new(1, -12, 1, -12)
    spinner.AnchorPoint = Vector2.new(1, 1)
    spinner.BackgroundColor3 = DESIGN.AccentColor
    spinner.Parent = self.Window
    
    local spinnerCorner = Instance.new("UICorner")
    spinnerCorner.CornerRadius = UDim.new(1, 0)
    spinnerCorner.Parent = spinner

    local grad = Instance.new("UIGradient")
    grad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    grad.Rotation = 90
    grad.Parent = spinner

    -- > Lógica de Transição e Persistência
    task.spawn(function()
        local TweenService = game:GetService("TweenService")
        
        -- Loop de Rotação do Spinner
        local spinTween = TweenService:Create(spinner, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
            Rotation = 360
        })
        spinTween:Play()

        -- Simulação/Aguardar carregamento real (Cache de segurança)
        task.wait(2.2)

        -- Intenção: Fade out suave dos elementos de carregamento
        local fadeInfo = TweenInfo.new(0.3)
        local fadeTweens = {
            TweenService:Create(title, fadeInfo, {TextTransparency = 1}),
            TweenService:Create(desc, fadeInfo, {TextTransparency = 1}),
            TweenService:Create(spinner, fadeInfo, {BackgroundTransparency = 1})
        }

        for _, t in ipairs(fadeTweens) do t:Play() end
        task.wait(0.3)
        
        content:Destroy()
        spinner:Destroy()

        local expandInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local expandTween = TweenService:Create(self.Window, expandInfo, {
            Size = finalSize,
            Position = finalPos,
            AnchorPoint = finalAnchor
        })
        
        expandTween:Play()
        expandTween.Completed:Wait()

        self.TitleBar.Visible = true
        self.TabContainer.Visible = true
        self.TabContentContainer.Visible = true
        self.Blocked = false
        
        -- Se houver um FloatButton, este é o momento de torná-lo disponível
        if self.FloatButton then
            self.FloatButton.Visible = true
        end
    end)
end

function Tekscripts:HideCloseButton()
    if self.CloseButtonContainer and self.CloseButtonContainer.Parent then
        self.CloseButtonContainer.Visible = false
    end
end

function Tekscripts:Destroy()
    self:HideCloseButton() 
    

    for _, conn in pairs(self.Connections) do
        conn:Disconnect()
    end
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

function Tekscripts:_GetWindowSize()
    return self._isSmallScreen and UDim2.new(0.95, 0, 0.95, 0) or DESIGN.WindowSize
end

function Tekscripts:_GetWindowPosition()
    if self._isSmallScreen then
        return UDim2.new(0.5, 0, 0.5, 0)
    else
        local size = DESIGN.WindowSize
        return UDim2.new(0.5, -size.X.Offset / 2, 0.5, -size.Y.Offset / 2)
    end
end

function Tekscripts:_GetTabContainerSize()
    return self._isSmallScreen and UDim2.new(0.3, 0, 1, -DESIGN.TitleHeight) or UDim2.new(0, DESIGN.TabButtonWidth, 1, -DESIGN.TitleHeight)
end

function Tekscripts:_GetContentContainerSize()
    local tabWidth = self._isSmallScreen and UDim.new(0.3, 0) or UDim.new(0, DESIGN.TabButtonWidth)
    local remainingScale = 1 - tabWidth.Scale
    local remainingOffset = -tabWidth.Offset
    
    return UDim2.new(remainingScale, remainingOffset, 1, -DESIGN.TitleHeight)
end

function Tekscripts:Destroy()
    if self.TitleScrollConnection then
        self.TitleScrollConnection:Disconnect()
        self.TitleScrollConnection = nil
    end
    if self.TitleScrollTween then
        self.TitleScrollTween:Cancel()
        self.TitleScrollTween = nil
    end
    if self._activeTween then
        self._activeTween:Cancel()
        self._activeTween = nil
    end
    for _, buttonData in pairs(self.EdgeButtons) do
        if buttonData.Frame then
            buttonData.Frame:Destroy()
        end
    end
    self.EdgeButtons = {}
    if self.ScreenGui then
        self.ScreenGui:Destroy()
        self.ScreenGui = nil
    end
    for _, connection in pairs(self.Connections) do
        if connection then
            connection:Disconnect()
        end
    end
    self.Connections = {}
    for _, tab in pairs(self.Tabs) do
        if tab.Destroy then
            tab:Destroy()
        end
    end
    self.Tabs = {}
    setmetatable(self, nil)
end

-- > Sistema de Arrastar (otimizado: atualização direta, sem tweens por input)
function Tekscripts:SetupDragSystem()
    local UIS = game:GetService("UserInputService")

    self.Connections.DragBegin = self.TitleBar.InputBegan:Connect(function(input)
        if self.Blocked or self.MinimizedState then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            
            self.IsDragging = true

            local pos = Vector2.new(input.Position.X, input.Position.Y)

            -- > Pega o offset correto (dedo - posição da janela)
            local absPos = self.Window.AbsolutePosition
            self._offset = Vector2.new(pos.X - absPos.X, pos.Y - absPos.Y)
        end
    end)

    self.Connections.DragChanged = UIS.InputChanged:Connect(function(input)
        if not self.IsDragging or self.Blocked or self.MinimizedState then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            
            local pos = Vector2.new(input.Position.X, input.Position.Y)

            -- > Nova posição = dedo - offset
            local newX = pos.X - self._offset.X
            local newY = pos.Y - self._offset.Y

            self.Window.Position = UDim2.fromOffset(newX, newY)
        end
    end)

    self.Connections.DragEnded = UIS.InputEnded:Connect(function(input)
        if not self.IsDragging then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            
            self.IsDragging = false

            if not self.MinimizedState then
            end
        end
    end)
end


-- > Sistema de Redimensionamento (atualização direta)
function Tekscripts:SetupResizeSystem()
    local GripVisualSize = 30  
    local ResizeGrip = Instance.new("Frame")
    ResizeGrip.Name = "ResizeGripVisual"
    ResizeGrip.Size = UDim2.new(0, GripVisualSize, 0, GripVisualSize)
    ResizeGrip.Position = UDim2.new(1, -12, 1, -12) 
    ResizeGrip.BackgroundTransparency = 1
    ResizeGrip.ClipsDescendants = false  
    ResizeGrip.ZIndex = 20 -- Acima do conteúdo
    ResizeGrip.Parent = self.Window
    self.ResizeHandle = ResizeGrip

    local function createLine(offset)
        local line = Instance.new("Frame")
        -- Usa AccentColor para indicar que é um ponto interativo
        line.BackgroundColor3 = DESIGN.AccentColor
        line.BorderSizePixel = 0
        line.Size = UDim2.new(0, 14, 0, 2)
        line.AnchorPoint = Vector2.new(1, 1)
        line.Position = UDim2.new(1, 2 + offset * -6, 1, 2 + offset * -6)
        line.Rotation = 45
        line.BackgroundTransparency = 0.6 -- Estado passivo semitransparente
        line.ZIndex = 21
        line.Parent = ResizeGrip
        return line
    end

    local lines = {createLine(0), createLine(1), createLine(2)}

    local function setHover(hovering)
        local targetTransparency = hovering and 0 or 0.6
        local targetSize = hovering and 16 or 14
        
        for _, line in ipairs(lines) do
            game:GetService("TweenService"):Create(line, TweenInfo.new(0.2), {
                BackgroundTransparency = targetTransparency,
                Size = UDim2.new(0, targetSize, 0, 2)
            }):Play()
        end
    end

    -- > HITBOX (Área invisível maior para facilitar o clique)
    local Hitbox = Instance.new("Frame")
    Hitbox.Name = "ResizeHitbox"
    Hitbox.Size = UDim2.new(0, 35, 0, 35)
    Hitbox.Position = UDim2.new(1, -35, 1, -35)
    Hitbox.BackgroundTransparency = 1
    Hitbox.ZIndex = 25
    Hitbox.Parent = self.Window

    -- Conexões de Mouse
    self.Connections.ResizeMouseEnter = Hitbox.MouseEnter:Connect(function()
        if not self.Blocked then
            setHover(true)
            game:GetService("UserInputService").MouseIcon = "rbxassetid://6258410714" -- Ícone de redimensionamento
        end
    end)

    self.Connections.ResizeMouseLeave = Hitbox.MouseLeave:Connect(function()
        setHover(false)
        if not self.IsResizing then
            game:GetService("UserInputService").MouseIcon = ""
        end
    end)

    -- > LÓGICA DE REDIMENSIONAMENTO (Persistência e Clamping)
    self.Connections.ResizeBegin = Hitbox.InputBegan:Connect(function(input)
        if self.Blocked then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            self.IsResizing = true
            self._resizeStart = input.Position
            self._startSize = self.Window.Size
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if not self.IsResizing or self.Blocked then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then

            local delta = input.Position - self._resizeStart
            local screen = workspace.CurrentCamera.ViewportSize
            
            -- Intenção: Impedir que a janela fique maior que a tela ou menor que o mínimo definido
            local maxW = math.min(DESIGN.MaxWindowSize.X, screen.X * 0.95)
            local maxH = math.min(DESIGN.MaxWindowSize.Y, screen.Y * 0.95)

            local newW = math.clamp(self._startSize.X.Offset + delta.X, DESIGN.MinWindowSize.X, maxW)
            local newH = math.clamp(self._startSize.Y.Offset + delta.Y, DESIGN.MinWindowSize.Y, maxH)

            self.Window.Size = UDim2.new(0, newW, 0, newH)
            self:UpdateContainersSize()
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if self.IsResizing then
                self.IsResizing = false
                game:GetService("UserInputService").MouseIcon = ""
                setHover(false)
            end
        end
    end)
end

function Tekscripts:UpdateContainersSize()
    if not self.TabContainer or not self.TabContentContainer then return end
    
    local tabSize = self:_GetTabContainerSize()
    local titleH = DESIGN.TitleHeight
    
    if self.TabsExpanded == nil then self.TabsExpanded = true end

    if self.TabsExpanded then
        self.TabContainer.Size = UDim2.new(tabSize.X.Scale, tabSize.X.Offset, 1, -titleH)
        self.TabContainer.Position = UDim2.new(0, 0, 0, titleH)

        self.TabContentContainer.Position = UDim2.new(tabSize.X.Scale, tabSize.X.Offset, 0, titleH)
        self.TabContentContainer.Size = UDim2.new(1 - tabSize.X.Scale, -tabSize.X.Offset, 1, -titleH)
    else
        self.TabContainer.Size = UDim2.new(tabSize.X.Scale, tabSize.X.Offset, 1, -titleH)
        self.TabContainer.Position = UDim2.new(-tabSize.X.Scale, -tabSize.X.Offset, 0, titleH)

        -- Conteúdo ocupa a tela inteira
        self.TabContentContainer.Position = UDim2.new(0, 0, 0, titleH)
        self.TabContentContainer.Size = UDim2.new(1, 0, 1, -titleH)
    end

    -- Sincroniza componentes flutuantes (Dropdown de fechar)
    if self.CloseButtonContainer and self.CloseButtonContainer.Visible then
        local absCtrl = self._controlBtn.AbsolutePosition
        local absWin = self.Window.AbsolutePosition
        local x = (absCtrl.X - absWin.X) - self.CloseButtonContainer.AbsoluteSize.X + 20
        self.CloseButtonContainer.Position = UDim2.new(0, x, 0, titleH + 5)
    end
end

-- > Float Button: Edição de conteúdo e ícone
function Tekscripts:FloatButtonEdit(options: {Text: string?, Icon: string?})  
    local float = self.FloatButton  
    if not float then return end  
  
    local actionBtn = float:FindFirstChild("ActionButton")  
    local dragBtn = float:FindFirstChild("DragButton")  
  
    if options.Text and actionBtn then  
        actionBtn.Text = options.Text  
    end  
      
    if options.Icon and dragBtn then  
        local iconPath = IconLibrary:GetIcon({ Icon = options.Icon, Expire = "1d" })  
        dragBtn.Image = iconPath or ""  
    end  
end  

-- > SETUP: CRIAÇÃO DO BOTÃO FLUTUANTE
function Tekscripts:SetupFloatButton(text: string, icon: string?)  
    local UIS = game:GetService("UserInputService")  
    local TweenService = game:GetService("TweenService")
    
    local BASE_SIZE = DESIGN.FloatButtonSize or UDim2.new(0, 140, 0, 35)
    local HOVER_SIZE = UDim2.new(
        BASE_SIZE.X.Scale, BASE_SIZE.X.Offset + 5, 
        BASE_SIZE.Y.Scale, BASE_SIZE.Y.Offset + 5
    )
      
    -- > CONTAINER PRINCIPAL
    local float = Instance.new("Frame")  
    float.Name = "FloatButton"  
    float.Size = BASE_SIZE
    float.AnchorPoint = Vector2.new(0.5, 0.5) 
    float.BorderSizePixel = 0  
    float.ZIndex = 100 
    float.Visible = false 
    float.Parent = self.ScreenGui  
    self.FloatButton = float   

    local screen = self.ScreenGui.AbsoluteSize
    float.Position = UDim2.new(0, screen.X - (BASE_SIZE.X.Offset), 0, screen.Y - (BASE_SIZE.Y.Offset + 40))

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)
    corner.Parent = float
  
    local grad = Instance.new("UIGradient")  
    grad.Rotation = 45  
    grad.Parent = float  

    local stroke = Instance.new("UIStroke")
    stroke.Transparency = 0.8
    stroke.Thickness = 1
    stroke.Parent = float
  
    -- > BOTÃO DE ARRASTAR (Ícone)
    local dragBtn = Instance.new("ImageButton")  
    dragBtn.Name = "DragButton"  
    dragBtn.Size = UDim2.new(0, 28, 0, 28)
    dragBtn.Position = UDim2.new(0, 6, 0.5, 0)
    dragBtn.AnchorPoint = Vector2.new(0, 0.5)
    dragBtn.BackgroundTransparency = 1 
    dragBtn.ZIndex = 101
    dragBtn.Parent = float  
    
    task.spawn(function()
        local iconAsset = IconLibrary:GetIcon({ Icon = icon or "mouse-pointer-2", Expire = "1d" })
        if iconAsset then dragBtn.Image = iconAsset end
    end)
  
    -- > BOTÃO DE AÇÃO (Texto)
    local actionBtn = Instance.new("TextButton")  
    actionBtn.Name = "ActionButton"   
    actionBtn.Size = UDim2.new(1, -45, 1, 0) 
    actionBtn.Position = UDim2.new(0, 40, 0, 0)  
    actionBtn.BackgroundTransparency = 1  
    actionBtn.AutoButtonColor = false 
    actionBtn.Text = text  
    actionBtn.Font = Enum.Font.GothamBold
    actionBtn.TextSize = 13
    actionBtn.TextXAlignment = Enum.TextXAlignment.Left
    actionBtn.ZIndex = 101
    actionBtn.Parent = float  

    -- Sincroniza a cor principal do botão e o gradiente derivado
    RegisterThemeItem("AccentColor", float, "BackgroundColor3", function(newColor)
        float.BackgroundColor3 = newColor
        local secondaryColor = newColor:Lerp(Color3.new(0, 0, 0), 0.2)
        grad.Color = ColorSequence.new(newColor, secondaryColor)
        
        -- Ajusta contraste do stroke baseado na cor
        local lum = (newColor.R * 0.299) + (newColor.G * 0.587) + (newColor.B * 0.114)
        stroke.Color = lum > 0.5 and Color3.new(0,0,0) or Color3.new(1,1,1)
    end)

    -- Sincroniza a cor do texto e do ícone baseada no background principal para contraste
    RegisterThemeItem("MainBackground", actionBtn, "TextColor3", function(newColor)
        -- Usamos a cor do fundo da UI para ser a cor do texto sobre o AccentColor (estética moderna)
        actionBtn.TextColor3 = newColor
        dragBtn.ImageColor3 = newColor
    end)
  
    -- > LÓGICA DE MOVIMENTAÇÃO (Consistência de Cache e Clamping)
    local dragging, dragInput, dragStart, startPos
  
    local function update(input)
        local delta = input.Position - dragStart
        local newX = startPos.X.Offset + delta.X
        local newY = startPos.Y.Offset + delta.Y
        
        local guiSize = self.ScreenGui.AbsoluteSize
        local margin = 10
        local halfWidth = float.AbsoluteSize.X / 2
        local halfHeight = float.AbsoluteSize.Y / 2
        
        local limitX = math.clamp(newX, halfWidth + margin, guiSize.X - halfWidth - margin)
        local limitY = math.clamp(newY, halfHeight + margin, guiSize.Y - halfHeight - margin)

        TweenService:Create(float, TweenInfo.new(0.08, Enum.EasingStyle.Linear), {
            Position = UDim2.new(0, limitX, 0, limitY)
        }):Play()
    end

    dragBtn.InputBegan:Connect(function(input)  
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then  
            dragging = true  
            dragStart = input.Position  
            startPos = float.Position 
            
            local connection; connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    connection:Disconnect()
                end
            end)

            TweenService:Create(float, TweenInfo.new(0.2), {Size = HOVER_SIZE}):Play()
        end  
    end)  
  
    UIS.InputChanged:Connect(function(input)  
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then  
            update(input)
        end  
    end)  
  
    UIS.InputEnded:Connect(function(input)  
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
            dragging = false
            TweenService:Create(float, TweenInfo.new(0.2), {Size = BASE_SIZE}):Play()
        end  
    end)

    -- Clique para abrir painel principal
    actionBtn.MouseButton1Click:Connect(function()
        if not self.Blocked then 
            self:ExpandFromFloat() 
        end
    end)
end


function Tekscripts:Open(state: boolean)
    if self.Blocked then return end

    if state then
        if self.MinimizedState == "float" then
            self:ExpandFromFloat()
        end
    else
        if not self.MinimizedState then
            self:Minimize()
        end
    end
end

-- > Funções de Estado (Minimizar/Expandir) otimizadas
function Tekscripts:Minimize()
if self.Blocked or self.MinimizedState then return end

self.MinimizedState = "float"
self.LastWindowPosition = self.Window.Position
self.LastWindowSize = self.Window.Size

if self._activeTween then self._activeTween:Cancel() end

local minimizeTween = TweenService:Create(self.Window, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0)
})

self._activeTween = minimizeTween

minimizeTween.Completed:Once(function()
    self.Window.Visible = false
    self.FloatButton.Visible = true
    self._activeTween = TweenService:Create(self.FloatButton, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = DESIGN.FloatButtonSize
    })
    self._activeTween:Play()
    self._activeTween.Completed:Once(function()
        self._activeTween = nil
    end)
end)

minimizeTween:Play()
end

function Tekscripts:ExpandFromFloat()
if self.MinimizedState ~= "float" or self.Blocked then return end

if self._activeTween then self._activeTween:Cancel() end

local floatTween = TweenService:Create(self.FloatButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
    Size = UDim2.new(0, 0, 0, 0)
})

self._activeTween = floatTween

floatTween.Completed:Once(function()
    self.FloatButton.Visible = false
    self.Window.Visible = true
    self._activeTween = nil

    local screenSize = workspace.CurrentCamera.ViewportSize
    local windowW = math.min(DESIGN.WindowSize.X.Offset, screenSize.X * 0.8)
    local windowH = math.min(DESIGN.WindowSize.Y.Offset, screenSize.Y * 0.8)
    
    local newPos = UDim2.new(0.5, -windowW/2, 0.5, -windowH/2)
    
    local expandTween = TweenService:Create(self.Window, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, windowW, 0, windowH),
        Position = newPos
    })
    
    self._activeTween = expandTween
    expandTween:Play()
    
    expandTween.Completed:Once(function()
        self.MinimizedState = nil
        self._activeTween = nil
    end)
end)

floatTween:Play()
end


function Tekscripts:Block(state: boolean)
    self.Blocked = state
    self.BlockScreen.Visible = state
    local targetSize = state and DESIGN.BlurEffectSize or 0
    TweenService:Create(self.BlurEffect, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Size = targetSize}):Play()
end

-- > Funções Públicas para criar componentes

Tekscripts.Localization = {
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    CurrentLanguage = "en",
    Translations = {},
    -- > Evento interno para disparar atualizações globais
    _Changed = Instance.new("BindableEvent"),

    -- > API de Inicialização
    Init = function(self, translations)
        if type(translations) == "table" then
            self.Translations = translations
        end
    end,

    -- > Função interna para componentes usarem
    -- > label: O Objeto TextLabel/TextButton
    -- > rawText: A string original (ex: "loc:play" ou "Olá")
    _ApplyDynamicLocalization = function(self, label: TextLabel | TextButton, rawText: string)
        if not label or type(rawText) ~= "string" then return end

        -- > Função que aplica a tradução no momento atual
        local function update()
            if label and label.Parent then
                label.Text = self:TranslateText(rawText)
            end
        end

        -- > Executa a primeira vez (Inicia o texto)
        update()

        -- > Conecta ao evento de mudança para manter consistência
        local connection
        connection = self._Changed.Event:Connect(function()
            -- > Verifica se o objeto ainda existe para evitar memory leak
            if label and label.Parent then
                update()
            else
                connection:Disconnect() -- > Limpa cache de conexão se o objeto sumiu
            end
        end)

        return connection
    end,

    SetLanguage = function(self, lang)
        if self.Translations[lang] then
            self.CurrentLanguage = lang
            -- > Notifica todos os componentes inscritos
            self._Changed:Fire(lang)
        else
            warn("Idioma não encontrado: "..tostring(lang))
        end
    end,

    GetLanguage = function(self)
        return self.CurrentLanguage
    end,

    SetTranslations = function(self, lang, translations)
        if type(translations) ~= "table" then return end
        self.Translations[lang] = self.Translations[lang] or {}
        for k,v in pairs(translations) do
            self.Translations[lang][k] = v
        end
    end,

    Get = function(self, key)
        if not self.Enabled then return key end
        if type(key) == "string" and key:sub(1,#self.Prefix) == self.Prefix then
            key = key:sub(#self.Prefix+1)
        end
        local lang = self.CurrentLanguage
        local t = self.Translations[lang] or self.Translations[self.DefaultLanguage]
        return (t and t[key]) or key
    end,

    TranslateText = function(self, text)
        if type(text) ~= "string" then return text end
        if text:sub(1, #self.Prefix) == self.Prefix then
            return self:Get(text)
        end
        return text
    end,

    SetEnabled = function(self, state)
        self.Enabled = state and true or false
        self._Changed:Fire(self.CurrentLanguage) -- > Atualiza visual ao ligar/desligar
    end
}

-- > 🟩 API COPY

-- > 🔹 Copiar texto universalmente
function Tekscripts:Copy(text: string)
	assert(type(text) == "string", "O texto precisa ser uma string")

	local success, msg = false, ""

	if typeof(setclipboard) == "function" then
		pcall(setclipboard, text)
		success, msg = true, "[Clipboard] Copiado com setclipboard."

	elseif typeof(toclipboard) == "function" then
		pcall(toclipboard, text)
		success, msg = true, "[Clipboard] Copiado com toclipboard."

	elseif plugin and typeof(plugin.SetClipboard) == "function" then
		pcall(function()
			plugin:SetClipboard(text)
			success = true
			msg = "[Clipboard] Copiado com plugin:SetClipboard."
		end)

	elseif rawget(getgenv and getgenv() or {}, "setclipboard") then
		pcall(getgenv().setclipboard, text)
		success, msg = true, "[Clipboard] Copiado via getgenv().setclipboard."

	else
		msg = "[Clipboard] Nenhuma API de cópia disponível neste ambiente."
	end

	if success then
		print(msg)
	else
		warn(msg .. " Texto: " .. text)
	end

	return success
end

-- > 🔹 Copiar path de instância automaticamente
function Tekscripts:CopyInstancePath(instance: Instance)
	assert(typeof(instance) == "Instance", "O argumento precisa ser uma instância válida")
	local path = instance:GetFullName()
	return self:Copy(path)
end
-- > 🟩 FIM API COPY

-- > 🟩 API DIRECTORY
function Tekscripts:WriteFile(path: string, content: string)
	assert(type(path) == "string", "Caminho inválido")
	assert(type(content) == "string", "Conteúdo inválido")

	local writeFunc =
		writefile
		or (fluxus and fluxus.writefile)
		or (trigon and trigon.writeFile)
		or (codex and codex.writefile)
		or (syn and syn.write_file)
		or (KRNL and KRNL.WriteFile)

	if not writeFunc then
		warn("[FS] Executor não suporta escrita de arquivos")
		return false
	end

	local ok, err = pcall(writeFunc, path, content)
	if not ok then warn("[FS] Erro ao escrever arquivo:", err) end
	return ok
end

function Tekscripts:ReadFile(path: string)
	assert(type(path) == "string", "Caminho inválido")

	local readFunc =
		readfile
		or (fluxus and fluxus.readFile)
		or (trigon and trigon.readFile)
		or (codex and codex.readFile)
		or (syn and syn.read_file)
		or (KRNL and KRNL.ReadFile)

	local existsFunc =
		isfile
		or (fluxus and fluxus.isfile)
		or (trigon and trigon.isfile)
		or (codex and codex.isfile)
		or (syn and syn.file_exists)
		or (KRNL and KRNL.IsFile)
		or function() return false end

	if not readFunc or not existsFunc(path) then
		warn("[FS] Arquivo não existe ou leitura não suportada")
		return nil
	end

	local ok, result = pcall(readFunc, path)
	if ok then
		return result
	else
		warn("[FS] Erro ao ler arquivo:", result)
		return nil
	end
end

function Tekscripts:IsFile(path: string)
	assert(type(path) == "string", "Caminho inválido")

	local existsFunc =
		isfile
		or (fluxus and fluxus.isfile)
		or (trigon and trigon.isfile)
		or (codex and codex.isfile)
		or (syn and syn.file_exists)
		or (KRNL and KRNL.IsFile)
		or function() return false end

	return existsFunc(path)
end

-- >  FIM API DIRECTORY

-- >  API REQUEST
function Tekscripts:Request(options)
    assert(type(options) == "table", "As opções precisam ser uma tabela.")
    local HttpService = game:GetService("HttpService")

    local requestFunc = (syn and syn.request) or 
                        (fluxus and fluxus.request) or 
                        (http and http.request) or 
                        (krnl and krnl.request) or 
                        (getgenv() and getgenv().request) or 
                        request

    if not requestFunc then
        warn("[Tekscripts] Executor sem suporte a HTTP.")
        return nil
    end

    if options.Body and type(options.Body) == "table" then
        options.Headers = options.Headers or {}
        options.Headers["Content-Type"] = "application/json"
        options.Body = HttpService:JSONEncode(options.Body)
    end

    local ok, response = pcall(requestFunc, options)
    
    if ok and type(response) == "table" then
        -- > Retorna SEMPRE o conteúdo bruto (Body) como string
        -- > Isso evita que o Lua retorne a tabela da memória
        return tostring(response.Body or "")
    end

    warn("[Tekscripts] Erro na requisição.")
    return nil
end

-- >  FIM DA API REQUEST
function Tekscripts:CreateTextBox(tab, options)
    assert(type(tab) == "table" and tab.Container, "Invalid Tab object provided to CreateTextBox")
    assert(type(options) == "table" and type(options.Text) == "string", "Invalid arguments for CreateTextBox")

    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization

    -- > Configuração de propriedades base e persistência de estado (ReadOnly/Log)
    local titleRaw = options.Text or "Log"
    local descRaw = options.Desc
    local defaultText = options.Default or ""
    local readonly = options.ReadOnly ~= false -- Default true para atuar como Log de saída

    -- > CORES INICIAIS (Baseadas nas 4 Variáveis Mestras para Cache Visual)
    local boxColor = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.03)
    local innerColor = DESIGN.MainBackground:Lerp(Color3.new(0, 0, 0), 0.1)
    local strokeColor = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.1)
    local accentColor = DESIGN.AccentColor

    -- > 1. CONTAINER BASE (BOX HOLDER)
    local boxHolder = Instance.new("Frame")
    boxHolder.Name = "TextBox_Component_" .. titleRaw
    boxHolder.BackgroundColor3 = boxColor
    boxHolder.Size = UDim2.new(1, 0, 0, descRaw and 145 or 125)
    boxHolder.Parent = tab.Container

    -- Registro de Tema: Fundo do componente
    RegisterThemeItem("MainBackground", boxHolder, "BackgroundColor3")

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)
    corner.Parent = boxHolder

    local stroke = Instance.new("UIStroke")
    stroke.Color = strokeColor
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = boxHolder
    
    -- Registro de Tema: Borda suavizada
    RegisterThemeItem("SecondaryText", stroke, "Color")

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = boxHolder

    -- > 2. TÍTULO E DESCRIÇÃO (Localização Dinâmica)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = DESIGN.PrimaryText
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Size = UDim2.new(1, 0, 0, 18)
    titleLabel.Parent = boxHolder
    
    -- Registro de Tema: Título
    RegisterThemeItem("PrimaryText", titleLabel, "TextColor3")
    local titleConn = Localization:_ApplyDynamicLocalization(titleLabel, titleRaw)

    local currentY = 20
    local descConn = nil
    if descRaw then
        local sub = Instance.new("TextLabel")
        sub.Name = "Description"
        sub.BackgroundTransparency = 1
        sub.Font = Enum.Font.Gotham
        sub.TextColor3 = DESIGN.SecondaryText
        sub.TextSize = 11
        sub.TextXAlignment = Enum.TextXAlignment.Left
        sub.Position = UDim2.new(0, 0, 0, currentY)
        sub.Size = UDim2.new(1, 0, 0, 14)
        sub.Parent = boxHolder
        
        -- Registro de Tema: Descrição
        RegisterThemeItem("SecondaryText", sub, "TextColor3")
        descConn = Localization:_ApplyDynamicLocalization(sub, descRaw)
        currentY = currentY + 18
    end

    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = "ScrollArea"
    scroll.BackgroundColor3 = innerColor
    scroll.BorderSizePixel = 0
    scroll.Position = UDim2.new(0, 0, 0, currentY + 8)
    scroll.Size = UDim2.new(1, 0, 1, -currentY - 10)
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = accentColor
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.Active = true
    scroll.Parent = boxHolder

    Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 4)
    
    local innerStroke = Instance.new("UIStroke")
    innerStroke.Color = accentColor
    innerStroke.Transparency = 0.8
    innerStroke.Parent = scroll
    
    -- Registro de Tema: Destaque do Accent na borda interna
    RegisterThemeItem("AccentColor", innerStroke, "Color")
    RegisterThemeItem("AccentColor", scroll, "ScrollBarImageColor3")

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Content"
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = DESIGN.SecondaryText:Lerp(Color3.new(1, 1, 1), 0.5)
    textLabel.Font = Enum.Font.Code -- Estilo monoespaçado para logs
    textLabel.TextSize = 12
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextYAlignment = Enum.TextYAlignment.Top
    textLabel.TextWrapped = true
    textLabel.Text = defaultText
    textLabel.Size = UDim2.new(1, -10, 0, 0)
    textLabel.AutomaticSize = Enum.AutomaticSize.Y
    textLabel.Parent = scroll

    Instance.new("UIPadding", scroll).PaddingLeft = UDim.new(0, 8)

    -- > 4. LÓGICA DE INTERAÇÃO E VISUAL
    local function updateVisualState()
        local isBlocked = self.Blocked or readonly
        local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

        TweenService:Create(scroll, tweenInfo, {
            BackgroundTransparency = isBlocked and 0.4 or 0,
        }):Play()

        TweenService:Create(textLabel, tweenInfo, {
            TextTransparency = isBlocked and 0.3 or 0
        }):Play()
    end

    -- > API PÚBLICA (Controle e Persistência)
    local publicApi = {
        _instance = boxHolder,
        _scroll = scroll,
        _label = textLabel,
        _readonly = readonly,
        _connections = {titleConn, descConn}
    }

    function publicApi:SetText(newText)
        textLabel.Text = tostring(newText)
        task.defer(function()
            scroll.CanvasPosition = Vector2.new(0, math.huge)
        end)
    end

    function publicApi:Append(line)
        local current = textLabel.Text
        local prefix = (current == "" and "" or "\n")
        textLabel.Text = current .. prefix .. "• " .. tostring(line)
        
        task.defer(function()
            -- Força o scroll para a última linha adicionada
            scroll.CanvasPosition = Vector2.new(0, math.huge)
        end)
    end

    function publicApi:Clear()
        textLabel.Text = ""
        scroll.CanvasPosition = Vector2.new(0, 0)
    end

    function publicApi:Destroy()
        for _, conn in ipairs(self._connections) do
            if conn and conn.Disconnect then conn:Disconnect() end
        end
        if boxHolder then boxHolder:Destroy() end
        table.clear(self._connections)
        table.clear(self)
    end

    -- Registro no Sistema de Escuta de Bloqueios (se existir)
    if self.BlockChanged then
        table.insert(publicApi._connections, self.BlockChanged:Connect(updateVisualState))
    end

    -- Inicia o estado visual imediato
    updateVisualState()

    table.insert(tab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateDialog(options) 
    assert(type(options) == "table", "Invalid options for CreateDialog")

    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    local Players = game:GetService("Players")

    local titleRaw = options.Title or "Título"
    local messageRaw = options.Message or "Mensagem"
    local buttons = options.Buttons or { {Text = "Ok", Callback = function() end} }
    
    -- Cores iniciais baseadas no Cache de Design
    local boxColor = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.02)
    local dividerColor = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.08)

    local screen = Instance.new("ScreenGui")
    screen.Name = "Tekscripts_Dialog_System"
    screen.IgnoreGuiInset = true
    screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screen.ResetOnSpawn = false
    screen.DisplayOrder = 9999 
    screen.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local overlay = Instance.new("TextButton") 
    overlay.Name = "Overlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.new(0, 0, 0)
    overlay.BackgroundTransparency = 1 
    overlay.Text = ""
    overlay.AutoButtonColor = false
    overlay.ZIndex = 1
    overlay.Parent = screen

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")

    -- > 2. CAIXA DE DIÁLOGO (CENTER BOX)
    local box = Instance.new("Frame")
    box.Name = "DialogBox"
    box.Size = UDim2.new(0, 320, 0, 0) 
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.Position = UDim2.new(0.5, 0, 0.45, 0) -- Posição inicial para animação "Back"
    box.BackgroundColor3 = boxColor
    box.AutomaticSize = Enum.AutomaticSize.Y
    box.ZIndex = 2
    box.ClipsDescendants = true
    box.Parent = screen

    -- Registro de Tema: Fundo da Caixa
    RegisterThemeItem("MainBackground", box, "BackgroundColor3")

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 12)
    corner.Parent = box

    local stroke = Instance.new("UIStroke")
    stroke.Color = dividerColor
    stroke.Thickness = 1.5
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = box
    
    -- Registro de Tema: Borda
    RegisterThemeItem("SecondaryText", stroke, "Color")

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 15)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Parent = box

    local padding = Instance.new("UIPadding")
    padding.PaddingTop, padding.PaddingBottom = UDim.new(0, 22), UDim.new(0, 22)
    padding.PaddingLeft, padding.PaddingRight = UDim.new(0, 22), UDim.new(0, 22)
    padding.Parent = box

    -- > 3. CONTEÚDO (TÍTULO E MENSAGEM)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 0)
    title.AutomaticSize = Enum.AutomaticSize.Y
    title.BackgroundTransparency = 1
    title.TextColor3 = DESIGN.PrimaryText
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextWrapped = true
    title.LayoutOrder = 1
    title.Parent = box

    RegisterThemeItem("PrimaryText", title, "TextColor3")
    local titleLoc = Localization:_ApplyDynamicLocalization(title, titleRaw)

    local message = Instance.new("TextLabel")
    message.Name = "Message"
    message.Size = UDim2.new(1, 0, 0, 0)
    message.AutomaticSize = Enum.AutomaticSize.Y
    message.BackgroundTransparency = 1
    message.TextColor3 = DESIGN.SecondaryText
    message.Font = Enum.Font.Gotham
    message.TextSize = 14
    message.TextWrapped = true
    message.LayoutOrder = 2
    message.Parent = box

    RegisterThemeItem("SecondaryText", message, "TextColor3")
    local messageLoc = Localization:_ApplyDynamicLocalization(message, messageRaw)

    -- > 4. CONTAINER DE BOTÕES
    local buttonHolder = Instance.new("Frame")
    buttonHolder.Name = "ButtonHolder"
    buttonHolder.Size = UDim2.new(1, 0, 0, 36)
    buttonHolder.BackgroundTransparency = 1
    buttonHolder.LayoutOrder = 3
    buttonHolder.Parent = box

    local btnLayout = Instance.new("UIListLayout")
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    btnLayout.Padding = UDim.new(0, 10)
    btnLayout.Parent = buttonHolder

    local connections = {}
    local localizationConns = {titleLoc, messageLoc}

    for i, btnInfo in ipairs(buttons) do
        local isMain = (i == #buttons)
        
        local btn = Instance.new("TextButton")
        btn.Name = "DialogBtn_" .. i
        btn.Size = UDim2.new(1/#buttons, -10, 1, 0)
        btn.BackgroundColor3 = isMain and DESIGN.AccentColor or dividerColor
        btn.TextColor3 = isMain and DESIGN.MainBackground or DESIGN.PrimaryText
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 13
        btn.AutoButtonColor = false
        btn.Parent = buttonHolder

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        -- Registros de Tema para Botões
        if isMain then
            RegisterThemeItem("AccentColor", btn, "BackgroundColor3")
            RegisterThemeItem("MainBackground", btn, "TextColor3")
        else
            RegisterThemeItem("SecondaryText", btn, "BackgroundColor3")
            RegisterThemeItem("PrimaryText", btn, "TextColor3")
        end

        local btnLoc = Localization:_ApplyDynamicLocalization(btn, btnInfo.Text or "Ok")
        table.insert(localizationConns, btnLoc)

        -- Hover Effects (Feedback Tátil)
        table.insert(connections, btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), { BackgroundTransparency = 0.2 }):Play()
        end))

        table.insert(connections, btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), { BackgroundTransparency = 0 }):Play()
        end))

        -- Click Callback e Encerramento do Diálogo
        table.insert(connections, btn.MouseButton1Click:Connect(function()
            if btnInfo.Callback then task.spawn(btnInfo.Callback) end
            
            -- Animação de Fechamento Suave
            TweenService:Create(box, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, 0, 0.4, 0),
                BackgroundTransparency = 1
            }):Play()
            TweenService:Create(overlay, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(blur, TweenInfo.new(0.3), { Size = 0 }):Play()
            
            task.delay(0.35, function()
                screen:Destroy()
                if blur then blur:Destroy() end
            end)
        end))
    end

    -- > 5. ANIMAÇÃO DE ENTRADA (Impacto Visual)
    TweenService:Create(overlay, TweenInfo.new(0.4), { BackgroundTransparency = 0.4 }):Play()
    TweenService:Create(blur, TweenInfo.new(0.5), { Size = 12 }):Play()
    TweenService:Create(box, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()

    -- > API PÚBLICA (Consistência de Cache)
    local api = {
        _screen = screen,
        _connections = connections,
        _locConns = localizationConns
    }

    function api:Destroy()
        for _, locConn in ipairs(self._locConns) do if locConn then locConn:Disconnect() end end
        for _, c in ipairs(self._connections) do if c and c.Connected then c:Disconnect() end end
        if blur then blur:Destroy() end
        if screen then screen:Destroy() end
        table.clear(self)
    end

    return api
end

function Tekscripts:CreateTabContainer(parentTab: any, options: { Title: string?, TabBarHeight: number? })
    assert(type(parentTab) == "table" and parentTab.Container, "Invalid parent Tab object provided to CreateTabContainer")

    -- > SETUP DE VARIÁVEIS (Persistência de Design e Localização)
    local tabHeight = options.TabBarHeight or 38
    local minTabWidth = 110
    local contentPadding = 12
    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization

    -- Cores iniciais (Cache de Design)
    local colorBg = DESIGN.MainBackground:Lerp(Color3.new(0, 0, 0), 0.1) 
    local colorInactive = DESIGN.SecondaryText
    local colorActive = DESIGN.AccentColor

    -- > Armazenamento de estado e cache
    local tabs = {}
    local activeTab = nil

    -- > 1. CONTAINER PRINCIPAL
    local container = Instance.new("Frame")
    container.Name = "TabContainer_Internal"
    container.BackgroundColor3 = colorBg
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BorderSizePixel = 0
    container.Parent = parentTab.Container

    -- Registro de Tema: Fundo levemente mais escuro para profundidade
    RegisterThemeItem("MainBackground", container, "BackgroundColor3")

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 8)
    uicorner.Parent = container

    -- > 2. LISTA DE ABAS (BARRA DE NAVEGAÇÃO)
    local tabListContainer = Instance.new("ScrollingFrame")
    tabListContainer.Name = "TabBar"
    tabListContainer.BackgroundTransparency = 1
    tabListContainer.Size = UDim2.new(1, 0, 0, tabHeight)
    tabListContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabListContainer.ScrollBarThickness = 0 -- Invisível para estética moderna
    tabListContainer.ClipsDescendants = true
    tabListContainer.Parent = container

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 4)
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.Parent = tabListContainer

    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabListContainer.CanvasSize = UDim2.new(0, tabLayout.AbsoluteContentSize.X, 0, 0)
    end)

    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentArea"
    contentContainer.BackgroundTransparency = 1
    contentContainer.Size = UDim2.new(1, 0, 1, -tabHeight - 5)
    contentContainer.Position = UDim2.new(0, 0, 0, tabHeight + 5)
    contentContainer.Parent = container

    -- > 3. LÓGICA DE TRANSIÇÃO (SMOOTH SWITCH)
    local function switchToTab(tabName)
        if activeTab == tabName then return end

        if activeTab and tabs[activeTab] then
            local prev = tabs[activeTab]
            prev.ContentFrame.Visible = false
            TweenService:Create(prev.Button, TweenInfo.new(0.2), {TextColor3 = DESIGN.SecondaryText}):Play()
            TweenService:Create(prev.Indicator, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 0, 0, 2), 
                BackgroundTransparency = 1
            }):Play()
        end

        local newTab = tabs[tabName]
        if newTab then
            newTab.ContentFrame.Visible = true
            TweenService:Create(newTab.Button, TweenInfo.new(0.2), {TextColor3 = DESIGN.PrimaryText}):Play()
            TweenService:Create(newTab.Indicator, TweenInfo.new(0.2), {
                Size = UDim2.new(0.7, 0, 0, 2), 
                BackgroundTransparency = 0
            }):Play()
            activeTab = tabName
        end
    end

    -- > 4. CRIAÇÃO DOS ELEMENTOS DA ABA
    local function createTabButton(tabName)
        local btnContainer = Instance.new("Frame")
        btnContainer.Size = UDim2.new(0, minTabWidth, 1, 0)
        btnContainer.BackgroundTransparency = 1
        btnContainer.Parent = tabListContainer

        local button = Instance.new("TextButton")
        button.Name = "Btn_" .. tabName
        button.Size = UDim2.new(1, 0, 1, -2)
        button.BackgroundTransparency = 1
        button.Font = Enum.Font.GothamBold
        button.TextSize = 12
        button.TextColor3 = colorInactive
        button.AutoButtonColor = false
        button.Parent = btnContainer

        -- Registro de Tema: Texto Inativo por padrão
        RegisterThemeItem("SecondaryText", button, "TextColor3")

        local indicator = Instance.new("Frame")
        indicator.Name = "Indicator"
        indicator.AnchorPoint = Vector2.new(0.5, 1)
        indicator.Position = UDim2.new(0.5, 0, 1, 0)
        indicator.Size = UDim2.new(0, 0, 0, 2)
        indicator.BackgroundColor3 = colorActive
        indicator.BackgroundTransparency = 1
        indicator.BorderSizePixel = 0
        indicator.Parent = btnContainer
        Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)

        -- Registro de Tema: Cor de destaque no indicador
        RegisterThemeItem("AccentColor", indicator, "BackgroundColor3")

        local locConn = Localization:_ApplyDynamicLocalization(button, tabName)

        -- Interação Visual
        button.MouseEnter:Connect(function()
            if activeTab ~= tabName then
                TweenService:Create(button, TweenInfo.new(0.2), {TextColor3 = DESIGN.PrimaryText}):Play()
            end
        end)

        button.MouseLeave:Connect(function()
            if activeTab ~= tabName then
                TweenService:Create(button, TweenInfo.new(0.2), {TextColor3 = DESIGN.SecondaryText}):Play()
            end
        end)

        button.MouseButton1Click:Connect(function()
            switchToTab(tabName)
        end)

        return btnContainer, button, indicator, locConn
    end
    
    local publicApi = {
        _instance = container,
        Tabs = {},
        _connections = {}
    }

    -- > 5. MÉTODO PÚBLICO: ADICIONAR ABA
    function publicApi:AddTab(tabName: string)
        if tabs[tabName] then return tabs[tabName].PublicAPI end

        local tabContentFrame = Instance.new("ScrollingFrame")
        tabContentFrame.Name = "SubContent_" .. tabName
        tabContentFrame.BackgroundTransparency = 1
        tabContentFrame.Size = UDim2.new(1, 0, 1, 0)
        tabContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContentFrame.ScrollBarThickness = 2
        tabContentFrame.ScrollBarImageColor3 = DESIGN.AccentColor
        tabContentFrame.Visible = false
        tabContentFrame.Parent = contentContainer
        
        RegisterThemeItem("AccentColor", tabContentFrame, "ScrollBarImageColor3")

        local tabContentLayout = Instance.new("UIListLayout")
        tabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tabContentLayout.Padding = UDim.new(0, 8)
        tabContentLayout.Parent = tabContentFrame

        local tabContentPadding = Instance.new("UIPadding")
        tabContentPadding.PaddingLeft = UDim.new(0, 8)
        tabContentPadding.PaddingRight = UDim.new(0, 8)
        tabContentPadding.PaddingTop = UDim.new(0, 8)
        tabContentPadding.Parent = tabContentFrame

        -- Auto-canvas Persistence
        tabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContentFrame.CanvasSize = UDim2.new(0, 0, 0, tabContentLayout.AbsoluteContentSize.Y + 20)
        end)

        local btnContainer, tabButton, indicator, locConn = createTabButton(tabName)

        -- API de cada Aba individual
        local tabApi = {
            _instance = tabContentFrame,
            Container = tabContentFrame, 
            Components = {},
            _locConn = locConn
        }

        function tabApi:Destroy()
            if self._locConn then self._locConn:Disconnect() end
            for _, comp in ipairs(self.Components) do
                if comp.Destroy then comp:Destroy() end
            end
            btnContainer:Destroy()
            tabContentFrame:Destroy()
            table.clear(self)
        end

        tabs[tabName] = {
            Button = tabButton,
            Indicator = indicator,
            ContentFrame = tabContentFrame,
            PublicAPI = tabApi
        }

        -- Ativa a primeira aba automaticamente
        if not activeTab then
            switchToTab(tabName)
        end

        table.insert(publicApi.Tabs, tabApi)
        return tabApi
    end

    -- > 6. API DE LIMPEZA E CONTROLE
    function publicApi:SwitchTo(tabName: string)
        if tabs[tabName] then switchToTab(tabName) end
    end

    function publicApi:Destroy()
        for _, tabData in pairs(tabs) do
            tabData.PublicAPI:Destroy()
        end
        if container then container:Destroy() end
        table.clear(tabs)
        table.clear(self)
    end

    table.insert(parentTab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateLabel(tab, options)
    assert(type(tab) == "table" and tab.Container, "Objeto de Aba inválido")
    assert(type(options) == "table" and type(options.Title) == "string", "Opções inválidas")

    -- > SETUP DE VARIÁVEIS (Persistência de Design e Localização)
    local HttpService = game:GetService("HttpService")
    local Localization = Tekscripts.Localization
    local mode = options.imageGround or "min" -- "min", "medium", ou "max"
    
    -- Configuração de tamanhos baseada no modo para manter a proporção visual
    local IMAGE_SIZE = (mode == "max" and 75) or (mode == "medium" and 55) or 40

    -- Cores iniciais (Derivadas do Cache Central)
    local colorBg = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.02)
    local colorDesc = DESIGN.SecondaryText

    local function loadExternalImage(url)
        local success, result = pcall(function()
            local filename = "tek_cache_" .. string.sub(HttpService:GenerateGUID(false), 1, 12) .. ".png"
            if not isfile(filename) then
                writefile(filename, game:HttpGet(url))
            end
            return (getsynasset or getcustomasset)(filename)
        end)
        return success and result or "rbxassetid://0"
    end

    -- > 1. ESTRUTURA PRINCIPAL (OUTER BOX)
    local outerBox = Instance.new("Frame")
    outerBox.Name = "Label_" .. options.Title
    outerBox.Size = UDim2.new(1, 0, 0, 0)
    outerBox.AutomaticSize = Enum.AutomaticSize.Y
    outerBox.BackgroundColor3 = colorBg
    outerBox.BorderSizePixel = 0
    outerBox.Parent = tab.Container

    -- Registro de Tema: Fundo do Label
    RegisterThemeItem("MainBackground", outerBox, "BackgroundColor3")

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)
    uicorner.Parent = outerBox

    local uiPadding = Instance.new("UIPadding")
    uiPadding.PaddingTop, uiPadding.PaddingBottom = UDim.new(0, 10), UDim.new(0, 10)
    uiPadding.PaddingLeft, uiPadding.PaddingRight = UDim.new(0, 12), UDim.new(0, 12)
    uiPadding.Parent = outerBox

    -- > 2. CONTAINER DE CONTEÚDO (HORIZONTAL)
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.AutomaticSize = Enum.AutomaticSize.Y
    contentFrame.Parent = outerBox

    local horizontalLayout = Instance.new("UIListLayout")
    horizontalLayout.FillDirection = Enum.FillDirection.Horizontal
    horizontalLayout.SortOrder = Enum.SortOrder.LayoutOrder
    horizontalLayout.Padding = UDim.new(0, 12)
    horizontalLayout.VerticalAlignment = (mode == "min" and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Center)
    horizontalLayout.Parent = contentFrame

    -- > 3. CONTAINER DE TEXTO (VERTICAL)
    local textContainer = Instance.new("Frame")
    textContainer.Name = "TextStack"
    textContainer.AutomaticSize = Enum.AutomaticSize.Y
    textContainer.BackgroundTransparency = 1
    textContainer.Size = UDim2.new(1, 0, 0, 0)
    textContainer.LayoutOrder = 2
    textContainer.Parent = contentFrame

    local verticalLayout = Instance.new("UIListLayout")
    verticalLayout.Padding = UDim.new(0, 2)
    verticalLayout.SortOrder = Enum.SortOrder.LayoutOrder
    verticalLayout.Parent = textContainer

    -- > 4. TÍTULO E DESCRIÇÃO
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = (mode == "max" and 16 or 14)
    titleLabel.TextColor3 = options.Color or DESIGN.PrimaryText
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Size = UDim2.new(1, 0, 0, 0)
    titleLabel.AutomaticSize = Enum.AutomaticSize.Y
    titleLabel.LayoutOrder = 1 
    titleLabel.Parent = textContainer

    -- Registro de Tema: Texto do Título
    if not options.Color then
        RegisterThemeItem("PrimaryText", titleLabel, "TextColor3")
    end

    -- > API E GERENCIAMENTO DE ESTADO
    local component = {
        _instance = outerBox,
        _titleConn = nil,
        _descConn = nil,
        _imageLabel = nil,
        _descLabel = nil
    }

    -- Inicializa Localização Dinâmica
    component._titleConn = Localization:_ApplyDynamicLocalization(titleLabel, options.Title)

    function component:SetText(val)
        if self._titleConn then self._titleConn:Disconnect() end
        self._titleConn = Localization:_ApplyDynamicLocalization(titleLabel, tostring(val or ""))
    end

    function component:SetDescription(val)
        local text = tostring(val or "")
        if self._descConn then self._descConn:Disconnect() self._descConn = nil end

        if text == "" then
            if self._descLabel then self._descLabel.Visible = false end
            return
        end

        if not self._descLabel then
            local dl = Instance.new("TextLabel")
            dl.Name = "Description"
            dl.BackgroundTransparency = 1
            dl.Font = Enum.Font.Gotham
            dl.TextSize = 13
            dl.TextColor3 = colorDesc
            dl.TextWrapped = true
            dl.TextXAlignment = Enum.TextXAlignment.Left
            dl.Size = UDim2.new(1, 0, 0, 0)
            dl.AutomaticSize = Enum.AutomaticSize.Y
            dl.LayoutOrder = 2 
            dl.Parent = textContainer
            
            RegisterThemeItem("SecondaryText", dl, "TextColor3")
            self._descLabel = dl
        end
        
        self._descLabel.Visible = true
        self._descConn = Localization:_ApplyDynamicLocalization(self._descLabel, text)
    end

    function component:SetImage(urlOrId)
        if not urlOrId or urlOrId == "" then
            if self._imageLabel then self._imageLabel.Visible = false end
            textContainer.Size = UDim2.new(1, 0, 0, 0)
            return
        end

        if not self._imageLabel then
            local il = Instance.new("ImageLabel")
            il.Name = "Icon"
            il.Size = UDim2.new(0, IMAGE_SIZE, 0, IMAGE_SIZE) 
            il.BackgroundTransparency = 1
            il.ScaleType = Enum.ScaleType.Fit
            il.LayoutOrder = 1 
            il.Parent = contentFrame
            
            Instance.new("UICorner", il).CornerRadius = UDim.new(0, (mode == "max" and 10 or 6))
            self._imageLabel = il
        end

        self._imageLabel.Visible = true
        
        -- Carregamento assíncrono para não travar a thread da UI
        task.spawn(function()
            if tostring(urlOrId):match("^https?://") then
                self._imageLabel.Image = loadExternalImage(urlOrId)
            else
                self._imageLabel.Image = urlOrId
            end
        end)
        
        -- Redimensiona o container de texto para não sobrepor a imagem
        textContainer.Size = UDim2.new(1, -(IMAGE_SIZE + 12), 0, 0)
    end

    function component:SetVisible(state)
        outerBox.Visible = state
    end

    function component:Destroy()
        if self._titleConn then self._titleConn:Disconnect() end
        if self._descConn then self._descConn:Disconnect() end
        if outerBox then outerBox:Destroy() end
        table.clear(self)
    end

    -- Inicialização baseada no cache de opções
    if options.Desc then component:SetDescription(options.Desc) end
    if options.Image then component:SetImage(options.Image) end

    table.insert(tab.Components, component)
    return component
end

function Tekscripts:CreateDivider(tab, options)
    assert(type(tab) == "table" and tab.Container, "Invalid Tab object provided to CreateDivider")

    -- > SETUP DE VARIÁVEIS (Intenção: Persistência de Design e Localização)
    local textRaw = options and options.Text or "Seção"
    local height = options and options.Height or 24
    local Localization = Tekscripts.Localization
    local TweenService = game:GetService("TweenService")

    -- Cores iniciais baseadas no Cache de Design
    local colorLine = DESIGN.AccentColor
    local colorText = DESIGN.SecondaryText

    -- > 1. CONTAINER PRINCIPAL
    local container = Instance.new("Frame")
    container.Name = "Divider_" .. textRaw
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 0, height + 15)
    container.Parent = tab.Container

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Padding = UDim.new(0, 10)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = container

    -- > 2. LINHA ESQUERDA (ACENTO VERTICAL)
    local lineLeft = Instance.new("Frame")
    lineLeft.Name = "AccentLine"
    lineLeft.Size = UDim2.new(0, 4, 0, 14)
    lineLeft.BackgroundColor3 = colorLine
    lineLeft.BorderSizePixel = 0
    lineLeft.LayoutOrder = 1
    lineLeft.Parent = container
    
    -- Registro de Tema: Cor de destaque
    RegisterThemeItem("AccentColor", lineLeft, "BackgroundColor3")
    Instance.new("UICorner", lineLeft).CornerRadius = UDim.new(1, 0)

    -- > 3. TEXTO DA SEÇÃO
    local label = Instance.new("TextLabel")
    label.Name = "Title"
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 12
    label.TextColor3 = colorText
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.AutomaticSize = Enum.AutomaticSize.XY
    label.LayoutOrder = 2
    label.Parent = container

    -- Registro de Tema: Cor do texto secundário
    RegisterThemeItem("SecondaryText", label, "TextColor3")

    -- Aplicação de Localização Dinâmica (Cache de Tradução)
    local locConnection = Localization:_ApplyDynamicLocalization(label, textRaw)

    -- > 4. LINHA DE PREENCHIMENTO (HORIZONTAL)
    local fillLine = Instance.new("Frame")
    fillLine.Name = "FillLine"
    fillLine.Size = UDim2.new(1, 0, 0, 1)
    fillLine.BackgroundColor3 = colorLine
    fillLine.BackgroundTransparency = 0.7 -- Suavizado para não poluir
    fillLine.BorderSizePixel = 0
    fillLine.LayoutOrder = 3
    fillLine.Parent = container
    
    -- Registro de Tema: Linha horizontal suavizada
    RegisterThemeItem("AccentColor", fillLine, "BackgroundColor3")

    -- Lógica de Redimensionamento Dinâmico
    local function updateFillSize()
        local textWidth = label.AbsoluteSize.X
        local containerWidth = container.AbsoluteSize.X
        local remaining = containerWidth - textWidth - 24
        fillLine.Size = UDim2.new(0, math.max(2, remaining), 0, 1)
    end
    
    local sizeConn1 = label:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateFillSize)
    local sizeConn2 = container:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateFillSize)

    -- > API PÚBLICA (Consistência de Manipulação)
    local api = {
        _instance = container,
        _label = label,
        _locConn = locConnection,
        _connections = {sizeConn1, sizeConn2}
    }

    function api:SetText(newText)
        if self._locConn then self._locConn:Disconnect() end
        self._locConn = Localization:_ApplyDynamicLocalization(label, newText)
    end

    function api:SetVisible(state)
        container.Visible = state
    end

    function api:Destroy()
        if self._locConn then self._locConn:Disconnect() end
        for _, conn in ipairs(self._connections) do
            if conn then conn:Disconnect() end
        end
        if container then container:Destroy() end
        table.clear(self._connections)
        table.clear(self)
    end

    -- Registro automático na estrutura da aba para destruição em cascata
    table.insert(tab.Components, api)

    return api
end

function Tekscripts:CreateSlider(tab: any, options: {
    Text: string?,
    Min: number?,
    Max: number?,
    Step: number?,
    Value: number?,
    Callback: ((number) -> ())?
})
    assert(tab and tab.Container, "Invalid Tab object provided to CreateSlider")

    -- > SETUP DE VARIÁVEIS E ESTADO (Intenção: Persistência de Dados)
    options = options or {}
    local titleRaw = options.Text or "Slider"
    local minv = tonumber(options.Min) or 0
    local maxv = tonumber(options.Max) or 100
    local step = tonumber(options.Step) or 1
    local value = tonumber(options.Value) or minv
    local callback = options.Callback

    -- Cores iniciais baseadas nas 4 variáveis mestras
    local boxColor = DESIGN.MainBackground:Lerp(Color3.new(1,1,1), 0.05)
    local trackColor = DESIGN.MainBackground:Lerp(Color3.new(1,1,1), 0.12)
    local thumbColor = DESIGN.PrimaryText
    local accent = DESIGN.AccentColor

    local function clamp(n) return math.max(minv, math.min(maxv, n)) end
    local function roundToStep(n)
        if step <= 0 then return n end
        return math.floor(n / step + 0.5) * step
    end

    value = clamp(roundToStep(value))

    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    
    -- > CACHE DE ANIMAÇÃO
    local ANIM = {
        ThumbHover = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        FillChange = TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
    }

    -- > 1. CONTAINER PRINCIPAL
    local box = Instance.new("Frame")
    box.Name = "Slider_" .. titleRaw
    box.Size = UDim2.new(1, 0, 0, 0)
    box.AutomaticSize = Enum.AutomaticSize.Y 
    box.BackgroundColor3 = boxColor
    box.BorderSizePixel = 0
    box.Parent = tab.Container

    -- Registro de Tema: Fundo do Componente
    RegisterThemeItem("MainBackground", box, "BackgroundColor3")

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)
    corner.Parent = box
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10) 
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = box

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1
    container.Parent = box

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 8) 
    listLayout.Parent = container

    -- > 2. HEADER (Título)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, 0, 0, 0)
    titleLabel.AutomaticSize = Enum.AutomaticSize.Y 
    titleLabel.Font = Enum.Font.GothamMedium
    titleLabel.TextSize = 14
    titleLabel.TextColor3 = DESIGN.PrimaryText
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = container

    -- Registro de Tema: Texto Principal
    RegisterThemeItem("PrimaryText", titleLabel, "TextColor3")
    local localeConn = Localization:_ApplyDynamicLocalization(titleLabel, titleRaw)

    -- > 3. TRACK E CONTROLES
    local trackContainer = Instance.new("Frame")
    trackContainer.Name = "TrackContainer"
    trackContainer.Size = UDim2.new(1, 0, 0, 24)
    trackContainer.BackgroundTransparency = 1
    trackContainer.Parent = container
    
    local listLayoutTrack = Instance.new("UIListLayout")
    listLayoutTrack.FillDirection = Enum.FillDirection.Horizontal
    listLayoutTrack.VerticalAlignment = Enum.VerticalAlignment.Center
    listLayoutTrack.Padding = UDim.new(0, 10)
    listLayoutTrack.Parent = trackContainer

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -75, 1, 0)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Parent = trackContainer

    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, 0, 0, 6)
    track.AnchorPoint = Vector2.new(0, 0.5)
    track.Position = UDim2.new(0, 0, 0.5, 0)
    track.BackgroundColor3 = trackColor
    track.BorderSizePixel = 0
    track.Parent = sliderFrame
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = accent
    fill.ZIndex = 2
    fill.Parent = track
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    
    -- Registro de Tema: Cor de Destaque no Fill
    RegisterThemeItem("AccentColor", fill, "BackgroundColor3")

    local thumb = Instance.new("Frame")
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(0, 16, 0, 16)
    thumb.AnchorPoint = Vector2.new(0.5, 0.5)
    thumb.BackgroundColor3 = thumbColor
    thumb.ZIndex = 3
    thumb.Parent = sliderFrame
    Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)
    
    -- Registro de Tema: Thumb do Slider
    RegisterThemeItem("PrimaryText", thumb, "BackgroundColor3")

    local thumbRing = Instance.new("Frame")
    thumbRing.Size = UDim2.new(0.5, 0, 0.5, 0)
    thumbRing.AnchorPoint = Vector2.new(0.5, 0.5)
    thumbRing.Position = UDim2.new(0.5, 0, 0.5, 0)
    thumbRing.BackgroundColor3 = accent
    thumbRing.BorderSizePixel = 0
    thumbRing.ZIndex = 4
    thumbRing.Parent = thumb
    Instance.new("UICorner", thumbRing).CornerRadius = UDim.new(1, 0)
    
    -- Registro de Tema: Detalhe do Accent no Thumb
    RegisterThemeItem("AccentColor", thumbRing, "BackgroundColor3")

    -- > 4. BADGE DE VALOR
    local valueBadge = Instance.new("Frame")
    valueBadge.Name = "ValueBadge"
    valueBadge.Size = UDim2.new(0, 65, 0, 24)
    valueBadge.BackgroundColor3 = accent
    valueBadge.Parent = trackContainer
    Instance.new("UICorner", valueBadge).CornerRadius = UDim.new(0, 6)
    
    -- Registro de Tema: Fundo da Badge
    RegisterThemeItem("AccentColor", valueBadge, "BackgroundColor3")

    local valueLabel = Instance.new("TextBox")
    valueLabel.BackgroundTransparency = 1
    valueLabel.Size = UDim2.new(1, 0, 1, 0)
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextSize = 12
    valueLabel.TextColor3 = DESIGN.MainBackground
    valueLabel.Text = tostring(value)
    valueLabel.ClearTextOnFocus = false
    valueLabel.Parent = valueBadge
    
    -- Registro de Tema: Texto dentro da badge (usa fundo como contraste)
    RegisterThemeItem("MainBackground", valueLabel, "TextColor3")

    -- > LÓGICA DE FUNCIONAMENTO
    local connections = {}
    local dragging = false

    local publicApi = {
        _instance = box,
        _connections = connections,
        _localeConn = localeConn,
        _locked = false,
    }
    
    local function updateVisuals(animate)
        local frac = math.clamp((value - minv) / math.max(1, (maxv - minv)), 0, 1)
        local targetSize = UDim2.new(frac, 0, 1, 0)
        local targetPos = UDim2.new(frac, 0, 0.5, 0)
        
        if animate then
            TweenService:Create(fill, ANIM.FillChange, {Size = targetSize}):Play()
            TweenService:Create(thumb, ANIM.FillChange, {Position = targetPos}):Play()
        else
            fill.Size = targetSize
            thumb.Position = targetPos
        end
        
        valueLabel.Text = tostring(math.floor(value * 100) / 100)
    end

    local function handleDrag(inputPos)
        local absPos = track.AbsolutePosition
        local absSize = track.AbsoluteSize
        local relX = math.clamp(inputPos.X - absPos.X, 0, absSize.X)
        local newVal = clamp(roundToStep(minv + (relX / absSize.X) * (maxv - minv)))
        
        if newVal ~= value then
            value = newVal
            updateVisuals(false)
            if callback then task.spawn(callback, value) end
        end
    end
    
    -- > INTERAÇÃO DE INPUT (Touch e Mouse)
    table.insert(connections, track.InputBegan:Connect(function(input)
        if publicApi._locked then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            TweenService:Create(thumb, ANIM.ThumbHover, {Size = UDim2.new(0, 20, 0, 20)}):Play()
            handleDrag(input.Position)
        end
    end))

    table.insert(connections, UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            handleDrag(input.Position)
        end
    end))

    table.insert(connections, UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            TweenService:Create(thumb, ANIM.ThumbHover, {Size = UDim2.new(0, 16, 0, 16)}):Play()
        end
    end))

    -- > VALIDAÇÃO MANUAL NO TEXTBOX
    table.insert(connections, valueLabel.FocusLost:Connect(function()
        local newVal = tonumber(valueLabel.Text:match("-?%d+%.?%d*"))
        if newVal then
            value = clamp(roundToStep(newVal))
            updateVisuals(true)
            if callback then task.spawn(callback, value) end
        else
            updateVisuals(false)
        end
    end))

    -- > APIS PÚBLICAS
    function publicApi:Set(v)
        value = clamp(roundToStep(tonumber(v) or value))
        updateVisuals(true)
    end

    function publicApi:Get() return value end

    function publicApi:Destroy()
        if self._localeConn then self._localeConn:Disconnect() end
        for _, c in ipairs(self._connections) do c:Disconnect() end
        if box then box:Destroy() end
    end

    -- Inicialização
    updateVisuals(false)
    table.insert(tab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateBind(tab, options)
	assert(type(tab) == "table" and tab.Container, "Invalid Tab object provided to CreateBind")
	assert(type(options) == "table" and type(options.Text) == "string", "Invalid arguments for CreateBind")

	-- > Definições de Configuração e Persistência
	local titleRaw = options.Text or "Keybind"
	local descRaw = options.Desc
	local flag = options.Flag
	
	-- > Recuperação de Cache (Persistência e Consistência)
	local savedKeyName = flag and self.Settings and self.Settings[flag]
	local defaultKey = (savedKeyName and Enum.KeyCode[savedKeyName]) or options.Default or Enum.KeyCode.F
	local callback = typeof(options.Callback) == "function" and options.Callback or function() end

	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local Localization = Tekscripts.Localization

	-- > ESTADO INTERNO
	local destroyed = false
	local listening = false
	local currentKey = defaultKey
	local connections = {}
	local tempListenConn = nil

	-- > CORES INICIAIS
	local boxColor = DESIGN.MainBackground:Lerp(Color3.new(1,1,1), 0.05)
	local btnColor = DESIGN.MainBackground:Lerp(Color3.new(1,1,1), 0.12)
	local borderColor = DESIGN.MainBackground:Lerp(Color3.new(1,1,1), 0.15)
	local hoverColor = DESIGN.MainBackground:Lerp(DESIGN.AccentColor, 0.1)

	-- > 1. CONTAINER PRINCIPAL
	local box = Instance.new("Frame")
	box.Name = "BindBox_" .. titleRaw
	box.BackgroundColor3 = boxColor
	box.Size = UDim2.new(1, 0, 0, 0) -- AutomaticSize cuida da altura
	box.AutomaticSize = Enum.AutomaticSize.Y 
	box.ClipsDescendants = true
	box.Parent = tab.Container

	RegisterThemeItem("MainBackground", box, "BackgroundColor3")

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)
	corner.Parent = box

	local stroke = Instance.new("UIStroke")
	stroke.Color = borderColor
	stroke.Thickness = 1
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Parent = box
	RegisterThemeItem("SecondaryText", stroke, "Color")

	local padding = Instance.new("UIPadding")
	local padVal = DESIGN.ComponentPadding or 10
	padding.PaddingTop, padding.PaddingBottom = UDim.new(0, padVal/1.2), UDim.new(0, padVal/1.2)
	padding.PaddingLeft, padding.PaddingRight = UDim.new(0, padVal), UDim.new(0, padVal)
	padding.Parent = box

	-- > 2. HOLDER DOS TEXTOS (Esquerda)
	local textContent = Instance.new("Frame")
	textContent.Name = "TextContent"
	textContent.BackgroundTransparency = 1
	textContent.Size = UDim2.new(1, -95, 0, 0)
	textContent.AutomaticSize = Enum.AutomaticSize.Y
	textContent.Parent = box

	local list = Instance.new("UIListLayout")
	list.SortOrder = Enum.SortOrder.LayoutOrder
	list.Padding = UDim.new(0, 1)
	list.Parent = textContent

	-- > TÍTULO COM AUTO-SCALE
	local label = Instance.new("TextLabel")
	label.Name = "Title"
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamMedium
	label.TextColor3 = DESIGN.PrimaryText
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Size = UDim2.new(1, 0, 0, 0)
	label.AutomaticSize = Enum.AutomaticSize.Y
	label.TextWrapped = true
	label.TextScaled = true -- Prevenção contra estouro de texto
	label.Parent = textContent
	
	local titleConstraint = Instance.new("UITextSizeConstraint")
	titleConstraint.MaxTextSize = 14
	titleConstraint.MinTextSize = 11
	titleConstraint.Parent = label

	RegisterThemeItem("PrimaryText", label, "TextColor3")
	local titleConn = Localization:_ApplyDynamicLocalization(label, titleRaw)

	-- > DESCRIÇÃO COM AUTO-SCALE
	local descConn = nil
	if descRaw then
		local sub = Instance.new("TextLabel")
		sub.Name = "Description"
		sub.BackgroundTransparency = 1
		sub.Font = Enum.Font.Gotham
		sub.TextColor3 = DESIGN.SecondaryText
		sub.TextSize = 12
		sub.TextXAlignment = Enum.TextXAlignment.Left
		sub.Size = UDim2.new(1, 0, 0, 0)
		sub.AutomaticSize = Enum.AutomaticSize.Y
		sub.TextWrapped = true
		sub.TextScaled = true -- Prevenção contra estouro de texto
		sub.Parent = textContent
		
		local descConstraint = Instance.new("UITextSizeConstraint")
		descConstraint.MaxTextSize = 12
		descConstraint.MinTextSize = 10
		descConstraint.Parent = sub

		RegisterThemeItem("SecondaryText", sub, "TextColor3")
		descConn = Localization:_ApplyDynamicLocalization(sub, descRaw)
	end

	-- > 3. BOTÃO DE BIND (Direita)
	local button = Instance.new("TextButton")
	button.Name = "BindButton"
	button.AnchorPoint = Vector2.new(1, 0.5)
	button.Position = UDim2.new(1, 0, 0.5, 0)
	button.Size = UDim2.new(0, 85, 0, 24)
	button.BackgroundColor3 = btnColor
	button.TextColor3 = DESIGN.PrimaryText
	button.Text = currentKey.Name
	button.Font = Enum.Font.GothamBold
	button.TextSize = 11
	button.AutoButtonColor = false
	button.Parent = box

	RegisterThemeItem("SecondaryText", button, "BackgroundColor3")
	RegisterThemeItem("PrimaryText", button, "TextColor3")

	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = borderColor
	btnStroke.Parent = button
	RegisterThemeItem("SecondaryText", btnStroke, "Color")

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = button

	-- > LÓGICA DE FUNCIONAMENTO
	local function safeConnect(signal, func)
		local conn = signal:Connect(function(...)
			if not destroyed then
				local ok, err = pcall(func, ...)
				if not ok then warn("[Bind:Error]:", err) end
			end
		end)
		table.insert(connections, conn)
		return conn
	end

	local function stopListening()
		listening = false
		if tempListenConn then tempListenConn:Disconnect() tempListenConn = nil end
		if not destroyed then
			button.Text = currentKey.Name
			TweenService:Create(button, TweenInfo.new(0.2), { 
				BackgroundColor3 = btnColor,
				TextColor3 = DESIGN.PrimaryText 
			}):Play()
		end
	end

	local function listenForKey()
		if listening or destroyed then return end
		listening = true
		button.Text = "..."
		
		TweenService:Create(button, TweenInfo.new(0.2), { 
			BackgroundColor3 = DESIGN.AccentColor,
			TextColor3 = DESIGN.MainBackground 
		}):Play()

		tempListenConn = UserInputService.InputBegan:Connect(function(input, processed)
			if processed then return end
			if input.KeyCode == Enum.KeyCode.Escape then stopListening() return end

			local allowedTypes = { Enum.UserInputType.Keyboard, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3 }
			if table.find(allowedTypes, input.UserInputType) then
				currentKey = (input.KeyCode ~= Enum.KeyCode.Unknown) and input.KeyCode or input.UserInputType
				if flag and self.SaveSetting then self:SaveSetting(flag, currentKey.Name) end
				stopListening()
			end
		end)
	end

	-- > INTERAÇÕES
	safeConnect(button.MouseButton1Click, listenForKey)
	
	safeConnect(button.MouseEnter, function() 
		if not listening then 
			TweenService:Create(button, TweenInfo.new(0.25), { BackgroundColor3 = hoverColor }):Play() 
		end 
	end)
	
	safeConnect(button.MouseLeave, function() 
		if not listening then 
			TweenService:Create(button, TweenInfo.new(0.25), { BackgroundColor3 = btnColor }):Play() 
		end 
	end)

	safeConnect(UserInputService.InputBegan, function(input, processed)
		if destroyed or processed or listening or self.Blocked then return end
		if input.KeyCode == currentKey or input.UserInputType == currentKey then
			task.spawn(callback, currentKey)
		end
	end)

	-- > API PÚBLICA
	local publicApi = {
		_instance = box,
		_connections = connections,
		_titleConn = titleConn,
		_descConn = descConn
	}

	function publicApi:SetKey(newKey)
		if destroyed then return end
		if typeof(newKey) == "EnumItem" then
			currentKey = newKey
			button.Text = newKey.Name
			if flag and Tekscripts.SaveSetting then Tekscripts:SaveSetting(flag, newKey.Name) end
		end
	end

	function publicApi:Destroy()
		if destroyed then return end
		destroyed = true
		stopListening()
		if self._titleConn then self._titleConn:Disconnect() end
		if self._descConn then self._descConn:Disconnect() end
		for _, conn in ipairs(self._connections) do 
			if conn.Connected then conn:Disconnect() end 
		end
		if box then box:Destroy() end
		table.clear(self._connections)
		table.clear(self)
	end

	table.insert(tab.Components, publicApi)
	return publicApi
end

function SetTheme(presetName)
    local theme = PRESETS[presetName]
    if not theme then return end
    
    local function apply()
        for key, value in pairs(theme) do
            ApplyThemeChange(key, value)
        end
    end

    apply() -- Define bases
    apply() -- Estabiliza Lerps e contrastes
end

function Tekscripts:CreateDropdown(tab, options)
    assert(type(tab) == "table" and tab.Container, "Objeto 'tab' inválido")
    assert(type(options) == "table" and type(options.Title) == "string" and type(options.Values) == "table", "Argumentos inválidos")

    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local GuiService = game:GetService("GuiService")
    local Localization = Tekscripts.Localization
    
    local multiSelect = options.MultiSelect or false
    local maxVisibleItems = math.min(options.MaxVisibleItems or 5, 8)
    local itemHeight = 36 
    local library = self
    
    -- > 1. CONTAINER BASE
    local box = Instance.new("Frame")
    box.Name = "Dropdown_" .. options.Title
    box.Size = UDim2.new(1, 0, 0, 50)
    box.BackgroundTransparency = 1
    box.Parent = tab.Container

    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Parent = box
    addRoundedCorners(background, DESIGN.CornerRadius or 8)
    
    RegisterThemeItem("MainBackground", background, "BackgroundColor3", function(newColor)
        local isDark = (newColor.R + newColor.G + newColor.B) / 3 < 0.5
        background.BackgroundColor3 = isDark and newColor:Lerp(Color3.new(1, 1, 1), 0.03) or newColor:Lerp(Color3.new(0, 0, 0), 0.03)
    end)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -135, 1, 0)
    title.Position = UDim2.new(0, 12, 0, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextTruncate = Enum.TextTruncate.AtEnd
    title.Parent = background
    RegisterThemeItem("PrimaryText", title, "TextColor3")
    Localization:_ApplyDynamicLocalization(title, options.Title)

    local botaoText = Instance.new("TextButton")
    botaoText.Size = UDim2.new(0, 115, 0, 32)
    botaoText.Position = UDim2.new(1, -127, 0.5, -16)
    botaoText.AutoButtonColor = false
    botaoText.Font = Enum.Font.GothamBold
    botaoText.TextSize = 11
    botaoText.ClipsDescendants = true 
    botaoText.Parent = background
    addRoundedCorners(botaoText, 6)

    RegisterThemeItem("AccentColor", botaoText, "BackgroundColor3", function(newColor)
        botaoText.BackgroundColor3 = newColor
        local lum = (newColor.R * 0.299) + (newColor.G * 0.587) + (newColor.B * 0.114)
        botaoText.TextColor3 = lum > 0.6 and Color3.new(0.1, 0.1, 0.1) or Color3.new(1, 1, 1)
    end)

    -- > 2. LISTA FLUTUANTE (Overlay)
    local overlay = tab.MainGui or box:FindFirstAncestorOfClass("ScreenGui")
    
    local lister = Instance.new("ScrollingFrame")
    lister.Name = "DropdownOverlay_" .. options.Title
    lister.Size = UDim2.new(0, 115, 0, 0)
    lister.BorderSizePixel = 0
    lister.ClipsDescendants = true
    lister.ScrollBarThickness = 2
    lister.Visible = false
    lister.ZIndex = 1000 
    lister.ScrollBarImageTransparency = 0.2
    lister.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    lister.Parent = overlay

    RegisterThemeItem("MainBackground", lister, "BackgroundColor3", function(newColor)
        local isDark = (newColor.R + newColor.G + newColor.B) / 3 < 0.5
        lister.BackgroundColor3 = isDark and newColor:Lerp(Color3.new(0, 0, 0), 0.15) or Color3.new(1, 1, 1)
        lister.ScrollBarImageColor3 = isDark and Color3.new(1,1,1) or Color3.new(0,0,0)
    end)
    addRoundedCorners(lister, 6)

    local listerLayout = Instance.new("UIListLayout")
    listerLayout.Padding = UDim.new(0, 2)
    listerLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listerLayout.Parent = lister
    
    local listerPadding = Instance.new("UIPadding")
    listerPadding.PaddingTop = UDim.new(0, 4)
    listerPadding.PaddingBottom = UDim.new(0, 4)
    listerPadding.PaddingLeft = UDim.new(0, 4)
    listerPadding.PaddingRight = UDim.new(0, 4)
    listerPadding.Parent = lister

    -- > ESTADOS E CACHE
    local isOpen = false
    local selectedValues = {} 
    local connections = {}
    local itemElements = {}

    local function updateButtonText()
        local arrow = isOpen and " ▲" or " ▼"
        if #selectedValues == 0 then
            botaoText.Text = (Localization:Get("loc:select_none") or "Selecionar") .. arrow
        elseif #selectedValues == 1 then
            local displayText = Localization:TranslateText(selectedValues[1])
            if #displayText > 12 then displayText = string.sub(displayText, 1, 10) .. ".." end
            botaoText.Text = displayText .. arrow
        else
            botaoText.Text = #selectedValues .. " " .. (Localization:Get("loc:items") or "itens") .. arrow
        end
    end

    local function updateListerPosition()
        if not isOpen or not botaoText:IsDescendantOf(game) then return end
        
        local targetPos = botaoText.AbsolutePosition
        local targetSize = botaoText.AbsoluteSize
        local screenSize = overlay.AbsoluteSize
        local inset = GuiService:GetGuiInset()
        
        -- Cálculo de altura necessária
        local itemCount = #options.Values
        local totalContentHeight = (itemCount * itemHeight) + ((itemCount-1) * 2) + 8
        local desiredHeight = math.min(totalContentHeight, (maxVisibleItems * itemHeight) + 10)
        
        -- Verificar se cabe abaixo, senão joga para cima
        local spaceBelow = screenSize.Y - (targetPos.Y + targetSize.Y + inset.Y)
        local yPos = targetPos.Y + targetSize.Y + 4
        
        if spaceBelow < desiredHeight and targetPos.Y > desiredHeight then
            yPos = targetPos.Y - desiredHeight - 4
        end

        lister.Position = UDim2.fromOffset(targetPos.X, yPos)
        lister.Size = UDim2.fromOffset(targetSize.X, lister.Size.Y.Offset)
        lister.CanvasSize = UDim2.new(0, 0, 0, listerLayout.AbsoluteContentSize.Y + 8)
    end

    local function toggleDropdown()
        if library.Blocked then return end
        isOpen = not isOpen
        
        if isOpen then
            lister.Visible = true
            updateListerPosition()
            connections.Follow = RunService.RenderStepped:Connect(updateListerPosition)
            
            local itemCount = #options.Values
            local totalHeight = (itemCount * itemHeight) + ((itemCount-1) * 2) + 8
            local targetSizeHeight = math.min(totalHeight, (maxVisibleItems * itemHeight) + 10)
            
            TweenService:Create(lister, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { 
                Size = UDim2.new(0, botaoText.AbsoluteSize.X, 0, targetSizeHeight)
            }):Play()
        else
            if connections.Follow then connections.Follow:Disconnect() end
            local tween = TweenService:Create(lister, TweenInfo.new(0.15, Enum.EasingStyle.Quart), { 
                Size = UDim2.new(0, botaoText.AbsoluteSize.X, 0, 0)
            })
            tween:Play()
            local c; c = tween.Completed:Connect(function() 
                if not isOpen then lister.Visible = false end 
                c:Disconnect() 
            end)
        end
        updateButtonText()
    end

    connections.OutsideClick = UserInputService.InputBegan:Connect(function(input)
        if isOpen and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            task.wait() 
            if not isOpen then return end
            local mPos = UserInputService:GetMouseLocation() - GuiService:GetGuiInset()
            local lPos, lSize = lister.AbsolutePosition, lister.AbsoluteSize
            local bPos, bSize = botaoText.AbsolutePosition, botaoText.AbsoluteSize
            
            local inLister = mPos.X >= lPos.X and mPos.X <= lPos.X + lSize.X and mPos.Y >= lPos.Y and mPos.Y <= lPos.Y + lSize.Y
            local inButton = mPos.X >= bPos.X and mPos.X <= bPos.X + bSize.X and mPos.Y >= bPos.Y and mPos.Y <= bPos.Y + bSize.Y
            
            if not inLister and not inButton then toggleDropdown() end
        end
    end)

    local function setItemSelected(valueName, isSelected)
        local elements = itemElements[valueName]
        if not elements then return end
        if isSelected then
            local accCol = DESIGN.AccentColor
            elements.container.BackgroundColor3 = accCol
            elements.container.BackgroundTransparency = 0.2
            local lum = (accCol.R * 0.299) + (accCol.G * 0.587) + (accCol.B * 0.114)
            elements.textLabel.TextColor3 = lum > 0.6 and Color3.new(0.1, 0.1, 0.1) or Color3.new(1, 1, 1)
        else
            elements.container.BackgroundTransparency = 1
            elements.textLabel.TextColor3 = DESIGN.SecondaryText
        end
    end

    local function createItem(valueInfo, index)
        local itemBtn = Instance.new("TextButton")
        itemBtn.Name = valueInfo.Name
        itemBtn.Size = UDim2.new(1, 0, 0, itemHeight)
        itemBtn.BackgroundTransparency = 1
        itemBtn.Text = ""
        itemBtn.AutoButtonColor = false
        itemBtn.LayoutOrder = index
        itemBtn.ZIndex = 1001 
        itemBtn.Parent = lister
        addRoundedCorners(itemBtn, 4)

        local itemText = Instance.new("TextLabel")
        itemText.Size = UDim2.new(1, -12, 1, 0) 
        itemText.Position = UDim2.new(0, 6, 0, 0)
        itemText.BackgroundTransparency = 1
        itemText.Font = Enum.Font.Gotham
        itemText.TextSize = 12
        itemText.TextXAlignment = Enum.TextXAlignment.Left
        itemText.ZIndex = 1002
        itemText.TextTruncate = Enum.TextTruncate.AtEnd 
        itemText.Parent = itemBtn

        itemElements[valueInfo.Name] = { container = itemBtn, textLabel = itemText, _conns = {} }

        RegisterThemeItem("SecondaryText", itemText, "TextColor3", function(newColor)
            if table.find(selectedValues, valueInfo.Name) then setItemSelected(valueInfo.Name, true)
            else itemText.TextColor3 = newColor end
        end)

        table.insert(itemElements[valueInfo.Name]._conns, itemBtn.MouseButton1Click:Connect(function()
            local idx = table.find(selectedValues, valueInfo.Name)
            if multiSelect then
                if idx then table.remove(selectedValues, idx) else table.insert(selectedValues, valueInfo.Name) end
            else
                for name, _ in pairs(itemElements) do setItemSelected(name, false) end
                selectedValues = idx and {} or { valueInfo.Name }
                if not idx then task.delay(0.05, toggleDropdown) end
            end
            setItemSelected(valueInfo.Name, not idx)
            updateButtonText()
            if options.Callback then task.spawn(options.Callback, multiSelect and selectedValues or selectedValues[1]) end
        end))

        Localization:_ApplyDynamicLocalization(itemText, valueInfo.Name)
    end

    for index, val in ipairs(options.Values) do createItem(val, index) end
    
    if options.InitialValues then
        for _, v in ipairs(options.InitialValues) do
            if itemElements[v] then table.insert(selectedValues, v) setItemSelected(v, true) end
        end
    end

    connections.Toggle = botaoText.MouseButton1Click:Connect(toggleDropdown)
    updateButtonText()

    local publicApi = { _instance = box, _connections = connections }
    function publicApi:Destroy()
        if connections.Follow then connections.Follow:Disconnect() end
        for _, c in pairs(connections) do c:Disconnect() end
        for _, el in pairs(itemElements) do for _, c in ipairs(el._conns) do c:Disconnect() end end
        lister:Destroy()
        box:Destroy()
    end

    table.insert(tab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateButton(tab, options)
    assert(typeof(tab) == "table" and tab.Container, "CreateButton: 'tab' inválido ou container inexistente.")
    assert(typeof(options) == "table", "CreateButton: 'options' inválido.")

    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    
    -- > Inicialização de variáveis e persistência de estado do componente
    local callback = typeof(options.Callback) == "function" and options.Callback or function() end
    local debounceTime = tonumber(options.Debounce or 0.25)
    local lastClick = 0
    local isInteractive = true
    local isLoading = false
    local rawText = options.Text or "Button"
    local rawDesc = options.Desc or ""
    
    local currentBaseColor = Color3.new(0,0,0)
    local currentHoverColor = Color3.new(0,0,0)

    -- > Lógica de Ícone com Fallback e Persistência de Cache de Assets
    local function resolveIcon(name)
        local targetIcon = (name and name ~= "") and name or "mouse-pointer-click"
        local asset = IconLibrary:GetIcon({Icon = targetIcon, Expire = "1d"})
        
        if not asset then
            asset = IconLibrary:GetIcon({Icon = "mouse-pointer-click", Expire = "1d"})
        end
        return asset
    end

    local iconAsset = resolveIcon(options.Icon)

    -- > 1. CONFIGURAÇÃO DO CONTAINER (BOTÃO)
    local btn = Instance.new("TextButton")
    btn.Name = "Button_Component_" .. rawText
    btn.Size = UDim2.new(1, 0, 0, 0)
    btn.AutomaticSize = Enum.AutomaticSize.Y
    btn.BackgroundTransparency = DESIGN.TabContainerTransp or 0
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true 
    btn.Text = "" 
    btn.Parent = tab.Container

    RegisterThemeItem("MainBackground", btn, "BackgroundColor3", function(newColor)
        currentBaseColor = newColor:Lerp(Color3.new(1,1,1), 0.05)
        currentHoverColor = newColor:Lerp(DESIGN.AccentColor or Color3.new(1,1,1), 0.08)
        btn.BackgroundColor3 = currentBaseColor
    end)

    local padding = Instance.new("UIPadding")
    local pSide = DESIGN.ComponentPadding or 12
    padding.PaddingLeft = UDim.new(0, pSide)
    padding.PaddingRight = UDim.new(0, pSide)
    padding.PaddingTop = UDim.new(0, pSide) -- Aumentado para igualar ao lado
    padding.PaddingBottom = UDim.new(0, pSide) -- Aumentado para igualar ao lado
    padding.Parent = btn

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8) 
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Name = "Border"
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Transparency = 0.85
    stroke.Thickness = 1
    stroke.Parent = btn
    
    RegisterThemeItem("PrimaryText", stroke, "Color") -- Vinculado ao texto para sutileza

    -- > 2. CONTAINER DE TEXTO
    local textContainer = Instance.new("Frame")
    textContainer.Name = "TextContainer"
    textContainer.Size = UDim2.new(1, -35, 0, 0)
    textContainer.AutomaticSize = Enum.AutomaticSize.Y
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = btn

    local textList = Instance.new("UIListLayout")
    textList.SortOrder = Enum.SortOrder.LayoutOrder
    textList.Padding = UDim.new(0, 3) -- Espaçamento interno entre título e desc levemente aumentado
    textList.Parent = textContainer

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.LayoutOrder = 1
    titleLabel.Size = UDim2.new(1, 0, 0, 0)
    titleLabel.AutomaticSize = Enum.AutomaticSize.Y
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextWrapped = true
    titleLabel.Parent = textContainer

    RegisterThemeItem("PrimaryText", titleLabel, "TextColor3")

    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.LayoutOrder = 2
    descLabel.Size = UDim2.new(1, 0, 0, 0)
    descLabel.AutomaticSize = Enum.AutomaticSize.Y
    descLabel.BackgroundTransparency = 1
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = 11
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextWrapped = true
    descLabel.Visible = (rawDesc ~= "")
    descLabel.Parent = textContainer

    RegisterThemeItem("SecondaryText", descLabel, "TextColor3")

    -- > 3. ÍCONE DE STATUS
    local iconImg = Instance.new("ImageLabel")
    iconImg.Name = "Icon"
    iconImg.Size = UDim2.new(0, 18, 0, 18)
    iconImg.AnchorPoint = Vector2.new(1, 0.5)
    iconImg.Position = UDim2.new(1, 0, 0.5, 0)
    iconImg.BackgroundTransparency = 1
    iconImg.Image = iconAsset or ""
    iconImg.Visible = (iconAsset ~= nil)
    iconImg.ZIndex = 5
    iconImg.Parent = btn

    RegisterThemeItem("PrimaryText", iconImg, "ImageColor3")

    -- > 4. LOCALIZAÇÃO DINÂMICA
    local locTitle = Localization:_ApplyDynamicLocalization(titleLabel, rawText)
    local locDesc = rawDesc ~= "" and Localization:_ApplyDynamicLocalization(descLabel, rawDesc) or nil

    -- > LÓGICA DE INTERAÇÃO E CONEXÕES
    local connections = {}

    local function onInteract()
        if not isInteractive or isLoading then return end
        if tick() - lastClick < debounceTime then return end
        lastClick = tick()

        local flash = TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {BackgroundTransparency = 0.5})
        flash:Play()

        task.spawn(function()
            local ok, err = pcall(callback)
            if not ok then warn("[Tekscripts Button Error]:", err) end
        end)
    end

    table.insert(connections, btn.MouseEnter:Connect(function()
        if not isInteractive or isLoading then return end
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = currentHoverColor}):Play()
    end))

    table.insert(connections, btn.MouseLeave:Connect(function()
        if not isInteractive or isLoading then return end
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = currentBaseColor}):Play()
    end))

    table.insert(connections, btn.MouseButton1Click:Connect(onInteract))

    -- > API PÚBLICA
    local publicApi = {
        _instance = btn,
        _connections = connections,
        _locConns = {locTitle, locDesc},
        _loadingTween = nil
    }

    function publicApi:SetLoading(state)
        isLoading = state
        if state then
            iconImg.Image = resolveIcon("refresh-cw")
            self._loadingTween = TweenService:Create(iconImg, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
            self._loadingTween:Play()
            TweenService:Create(titleLabel, TweenInfo.new(0.2), {TextTransparency = 0.5}):Play()
        else
            if self._loadingTween then self._loadingTween:Cancel() end
            iconImg.Rotation = 0
            iconImg.Image = resolveIcon(options.Icon)
            TweenService:Create(titleLabel, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
        end
    end

    function publicApi:SetInteractive(state)
        isInteractive = state
        local targetTrans = state and 0 or 0.6
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = targetTrans}):Play()
        TweenService:Create(titleLabel, TweenInfo.new(0.2), {TextTransparency = targetTrans}):Play()
        iconImg.ImageTransparency = targetTrans
    end

    function publicApi:Fire() onInteract() end
    function publicApi:SetVisible(state) btn.Visible = state end

    function publicApi:Update(newOptions)
        if newOptions.Text then
            rawText = newOptions.Text
            if self._locConns[1] then self._locConns[1]:Disconnect() end
            self._locConns[1] = Localization:_ApplyDynamicLocalization(titleLabel, rawText)
        end
        if newOptions.Desc then
            rawDesc = newOptions.Desc
            descLabel.Visible = (rawDesc ~= "")
            if self._locConns[2] then self._locConns[2]:Disconnect() end
            self._locConns[2] = Localization:_ApplyDynamicLocalization(descLabel, rawDesc)
        end
        if newOptions.Icon ~= nil then
            options.Icon = newOptions.Icon
            iconImg.Image = resolveIcon(newOptions.Icon)
            iconImg.Visible = (iconImg.Image ~= "")
        end
        if newOptions.Callback then callback = newOptions.Callback end
    end

    function publicApi:Destroy()
        if self._loadingTween then self._loadingTween:Cancel() end
        for _, c in ipairs(self._connections) do if c then c:Disconnect() end end
        for _, c in ipairs(self._locConns) do if c and c.Disconnect then c:Disconnect() end end
        if btn then btn:Destroy() end
        table.clear(self)
    end

    table.insert(tab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateFloatButton(options)
    assert(typeof(options) == "table" and type(options.Text) == "string", "Invalid arguments for CreateFloatButton")

    -- > SETUP DE VARIÁVEIS (Persistência de Design e Localização)
    local textRaw = options.Text or "Button"
    local titleRaw = options.Title or "Arraste aqui"
    local Drag = options.Drag ~= false
    local Visible = options.Visible ~= false
    local Pos = options.Pos or UDim2.new(0.5, 0, 0.5, 0)
    local initialTransparency = options.Transparency or 0
    local Callback = typeof(options.Callback) == "function" and options.Callback or function() end

    local UserInputService = game:GetService("UserInputService")
    local Localization = Tekscripts.Localization
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")

    -- > CORES INICIAIS
    local colorHeader = DESIGN.AccentColor
    local colorButton = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.05)
    local colorStroke = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.15)
    local textOnAccent = DESIGN.MainBackground

    -- > 1. GESTÃO DO SCREEN GUI (CACHE GLOBAL)
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = playerGui:FindFirstChild("TekscriptsFloatGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "TekscriptsFloatGui"
        screenGui.ResetOnSpawn = false
        screenGui.DisplayOrder = 1000
        screenGui.Parent = playerGui
    end

    -- > 2. CONTAINER DO BOTÃO
    local container = Instance.new("Frame")
    container.Name = "FloatContainer_" .. textRaw
    container.Size = UDim2.new(0, 130, 0, Drag and 65 or 45)
    container.Position = Pos
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundTransparency = 1
    container.Visible = Visible
    container.Parent = screenGui

    -- > 3. CABEÇOTE (HEADER)
    local header
    local headerLocaleConn = nil
    if Drag then
        header = Instance.new("TextLabel")
        header.Name = "DragHeader"
        header.Size = UDim2.new(1, 0, 0, 22)
        header.BackgroundColor3 = colorHeader
        header.BackgroundTransparency = initialTransparency
        header.TextColor3 = textOnAccent
        header.Font = Enum.Font.GothamBold
        header.TextSize = 10
        header.TextScaled = true 
        header.ZIndex = 2
        header.Parent = container

        local cornerHeader = Instance.new("UICorner")
        cornerHeader.CornerRadius = UDim.new(0, 6)
        cornerHeader.Parent = header
        
        RegisterThemeItem("AccentColor", header, "BackgroundColor3")
        RegisterThemeItem("MainBackground", header, "TextColor3")
        
        headerLocaleConn = Localization:_ApplyDynamicLocalization(header, titleRaw)
    end

    -- > 4. BOTÃO PRINCIPAL
    local button = Instance.new("TextButton")
    button.Name = "MainButton"
    button.Size = UDim2.new(1, 0, 0, 45)
    button.Position = Drag and UDim2.new(0, 0, 0, 20) or UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = colorButton
    button.BackgroundTransparency = initialTransparency
    button.TextColor3 = DESIGN.PrimaryText
    button.Font = Enum.Font.GothamBold
    button.TextSize = 13
    button.TextScaled = true 
    button.AutoButtonColor = false
    button.ZIndex = 1
    button.Parent = container

    -- > Padding Interno para o Texto
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = button

    RegisterThemeItem("MainBackground", button, "BackgroundColor3")
    RegisterThemeItem("PrimaryText", button, "TextColor3")

    local cornerButton = Instance.new("UICorner")
    cornerButton.CornerRadius = UDim.new(0, 8)
    cornerButton.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = colorStroke
    stroke.Thickness = 1
    stroke.Transparency = initialTransparency
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = button
    
    RegisterThemeItem("SecondaryText", stroke, "Color")
    
    local buttonLocaleConn = Localization:_ApplyDynamicLocalization(button, textRaw)

    -- > 5. OVERLAY DE BLOQUEIO
    local overlay = Instance.new("Frame")
    overlay.BackgroundColor3 = DESIGN.MainBackground
    overlay.BackgroundTransparency = 0.5
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.Visible = false
    overlay.ZIndex = 5
    overlay.Parent = button
    Instance.new("UICorner", overlay).CornerRadius = UDim.new(0, 8)
    RegisterThemeItem("MainBackground", overlay, "BackgroundColor3")

    -- > 6. LÓGICA DE MOVIMENTAÇÃO (DRAG SYSTEM)
    local dragConnection = nil
    local dragStartOffset = Vector2.new(0, 0)
    
    local function clampPosition(position)
        local screenLimit = screenGui.AbsoluteSize
        local size = container.AbsoluteSize
        local maxX = screenLimit.X - (size.X * 0.5)
        local minX = size.X * 0.5
        local maxY = screenLimit.Y - (size.Y * 0.5)
        local minY = size.Y * 0.5
        return UDim2.new(0, math.clamp(position.X, minX, maxX), 0, math.clamp(position.Y, minY, maxY))
    end
    
    if Drag and header then
        header.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                local mousePos = Vector2.new(input.Position.X, input.Position.Y)
                local centerPos = container.AbsolutePosition + (container.AbsoluteSize * 0.5)
                dragStartOffset = mousePos - centerPos

                if dragConnection then dragConnection:Disconnect() end
                dragConnection = UserInputService.InputChanged:Connect(function(moveInput)
                    if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                        local currentMouse = Vector2.new(moveInput.Position.X, moveInput.Position.Y)
                        container.Position = clampPosition(currentMouse - dragStartOffset)
                    end
                end)
                
                local endConn
                endConn = UserInputService.InputEnded:Connect(function(endInput)
                    if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                        if dragConnection then dragConnection:Disconnect() dragConnection = nil end
                        if endConn then endConn:Disconnect() end
                    end
                end)
            end
        end)
    end

    -- > INTERAÇÕES
    button.MouseEnter:Connect(function()
        if not overlay.Visible then
            TweenService:Create(stroke, TweenInfo.new(0.2), { Color = DESIGN.AccentColor }):Play()
        end
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.2), { Color = colorStroke }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        if not overlay.Visible then
            task.spawn(Callback)
        end
    end)

    -- > API PÚBLICA
    local api = {
        _instance = container,
        _locConns = { buttonLocaleConn, headerLocaleConn }
    }

    function api:SetBlock(state)
        overlay.Visible = state
    end

    function api:SetTransparency(value)
        local val = math.clamp(value, 0, 1)
        button.BackgroundTransparency = val
        stroke.Transparency = val
        if header then
            header.BackgroundTransparency = val
        end
    end

    function api:SetText(newText)
        if self._locConns[1] then self._locConns[1]:Disconnect() end
        self._locConns[1] = Localization:_ApplyDynamicLocalization(button, newText)
    end

    function api:SetVisible(state)
        container.Visible = state
    end

    function api:Destroy()
        if dragConnection then dragConnection:Disconnect() end
        for _, conn in ipairs(self._locConns) do
            if conn and conn.Disconnect then conn:Disconnect() end
        end
        if container then container:Destroy() end
        table.clear(self)
    end

    return api
end

function Tekscripts:CreateToggle(tab: any, options: { 
    Text: string, 
    Desc: string?, 
    InitialValue: boolean?, 
    Callback: (state: boolean) -> (), 
    Type: "Toggle" | "CheckBox" | nil, 
    FeedbackDebug: boolean? 
})
    -- > Validação robusta
    assert(type(tab) == "table" and tab.Container, "Erro: Objeto Tab inválido")
    assert(type(options.Text) == "string", "Erro: Texto do Toggle é obrigatório")
    
    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    local componentType = options.Type and string.lower(options.Type) == "checkbox" and "CheckBox" or "Toggle"
    local useFeedback = (options.FeedbackDebug == nil) and true or options.FeedbackDebug
    local isCheckBox = (componentType == "CheckBox")

    -- > 1. ESTRUTURA PRINCIPAL (CONTÊINER)
    local outerBox = Instance.new("Frame")
    outerBox.Name = "Toggle_" .. options.Text
    outerBox.Size = UDim2.new(1, 0, 0, 0)
    outerBox.AutomaticSize = Enum.AutomaticSize.Y 
    outerBox.BorderSizePixel = 0
    outerBox.Parent = tab.Container
    
    RegisterThemeItem("MainBackground", outerBox, "BackgroundColor3", function(newColor)
        -- Cria um leve contraste em relação ao fundo principal (5% mais claro)
        outerBox.BackgroundColor3 = newColor:Lerp(Color3.new(1,1,1), 0.05)
    end)
    
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, DESIGN.CornerRadius or 6)
    uicorner.Parent = outerBox
    
    -- > Sistema de Feedback de Erro
    local errorRed = Color3.fromRGB(255, 60, 60)
    local borderStroke = Instance.new("UIStroke")
    borderStroke.Thickness = 1.6
    borderStroke.Color = errorRed
    borderStroke.Transparency = 1 
    borderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    borderStroke.Parent = outerBox

    local errorDot = Instance.new("Frame")
    errorDot.Size = UDim2.new(0, 6, 0, 6)
    errorDot.Position = UDim2.new(0, 4, 0, 4)
    errorDot.BackgroundColor3 = errorRed
    errorDot.BackgroundTransparency = 1 
    errorDot.Parent = outerBox
    Instance.new("UICorner", errorDot).CornerRadius = UDim.new(1, 0)

    local mainPadding = Instance.new("UIPadding")
    mainPadding.PaddingTop = UDim.new(0, 10)
    mainPadding.PaddingBottom = UDim.new(0, 10)
    mainPadding.PaddingLeft = UDim.new(0, DESIGN.ComponentPadding or 12)
    mainPadding.PaddingRight = UDim.new(0, DESIGN.ComponentPadding or 12)
    mainPadding.Parent = outerBox

    -- > 2. ELEMENTOS DE TEXTO
    local textContainer = Instance.new("Frame")
    textContainer.Size = UDim2.new(1, -55, 0, 0) 
    textContainer.AutomaticSize = Enum.AutomaticSize.Y
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = outerBox
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 1)
    listLayout.Parent = textContainer

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 0)
    label.AutomaticSize = Enum.AutomaticSize.Y
    label.BackgroundTransparency = 1
    label.TextColor3 = DESIGN.PrimaryText
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextWrapped = true 
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = 1
    label.Parent = textContainer

    RegisterThemeItem("PrimaryText", label, "TextColor3")
    local titleConn = Localization and Localization:_ApplyDynamicLocalization(label, options.Text)

    local descLabel, descConn
    if options.Desc and options.Desc ~= "" then
        descLabel = Instance.new("TextLabel")
        descLabel.Size = UDim2.new(1, 0, 0, 0)
        descLabel.AutomaticSize = Enum.AutomaticSize.Y
        descLabel.BackgroundTransparency = 1
        descLabel.TextColor3 = DESIGN.SecondaryText
        descLabel.Font = Enum.Font.Gotham
        descLabel.TextSize = 12
        descLabel.TextWrapped = true
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.LayoutOrder = 2
        descLabel.Parent = textContainer
        
        RegisterThemeItem("SecondaryText", descLabel, "TextColor3")
        descConn = Localization and Localization:_ApplyDynamicLocalization(descLabel, options.Desc)
    end

    -- > 3. CONTROLE VISUAL (BOTÃO)
    local controlSize = isCheckBox and Vector2.new(22, 22) or Vector2.new(38, 18)
    
    local control = Instance.new("TextButton")
    control.Name = "Control"
    control.Size = UDim2.new(0, controlSize.X, 0, controlSize.Y)
    control.Position = UDim2.new(1, 0, 0.5, 0)
    control.AnchorPoint = Vector2.new(1, 0.5)
    control.Text = ""
    control.AutoButtonColor = false
    control.Parent = outerBox
    
    local controlCorner = Instance.new("UICorner")
    controlCorner.CornerRadius = UDim.new(0, isCheckBox and 4 or 100)
    controlCorner.Parent = control

    local knob
    if not isCheckBox then
        knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 14, 0, 14)
        knob.Position = UDim2.new(0, 2, 0.5, -7)
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.Parent = control
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    else
        knob = Instance.new("ImageLabel")
        knob.Name = "CheckIcon"
        knob.Size = UDim2.new(0, 16, 0, 16)
        knob.AnchorPoint = Vector2.new(0.5, 0.5)
        knob.Position = UDim2.new(0.5, 0, 0.5, 0)
        knob.BackgroundTransparency = 1
        knob.ImageColor3 = Color3.new(1, 1, 1)
        knob.Visible = false
        knob.Parent = control
        
        task.spawn(function()
            local iconAsset = IconLibrary:GetIcon({Icon = "check", Expire = "1d"})
            if iconAsset then knob.Image = iconAsset end
        end)
    end

    -- > 4. LÓGICA DE ESTADO E REATIVIDADE DE TEMA
    local state = options.InitialValue or false
    local isLocked = false
    local isBlockedByError = false
    local connections = {}

    local function updateControlVisual(instant)
        local tDuration = instant and 0 or (DESIGN.AnimationSpeed or 0.2)
        local tInfo = TweenInfo.new(tDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        
        -- Se estiver Ativo -> AccentColor. Se Inativo -> SecondaryText (ou derivado)
        local targetColor = state and DESIGN.AccentColor or DESIGN.MainBackground:Lerp(Color3.new(1,1,1), 0.15)
        
        TweenService:Create(control, tInfo, { BackgroundColor3 = targetColor }):Play()

        if not isCheckBox and knob then
            local targetPos = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
            TweenService:Create(knob, tInfo, { Position = targetPos }):Play()
        elseif isCheckBox and knob then
            knob.Visible = state
        end
    end

    -- Registra para que o controle mude de cor instantaneamente se o tema mudar enquanto estiver ATIVO ou INATIVO
    RegisterThemeItem("AccentColor", control, nil, function() updateControlVisual(false) end)
    RegisterThemeItem("MainBackground", control, nil, function() updateControlVisual(false) end)

    local function pulseError()
        if not useFeedback or isBlockedByError then return end 
        isBlockedByError = true
        borderStroke.Transparency = 0
        errorDot.BackgroundTransparency = 0
        
        local originalPos = outerBox.Position
        task.spawn(function()
            for i = 1, 6 do
                if not outerBox.Parent then break end
                outerBox.Position = originalPos + UDim2.new(0, (i % 2 == 0 and 2 or -2), 0, 0)
                task.wait(0.05)
            end
            if outerBox.Parent then outerBox.Position = originalPos end
        end)

        task.delay(0.7, function()
            isBlockedByError = false
            if outerBox.Parent then
                TweenService:Create(borderStroke, TweenInfo.new(0.3), { Transparency = 1 }):Play()
                TweenService:Create(errorDot, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
            end
        end)
    end

    local function toggle(newState, skipCallback)
        if isLocked or isBlockedByError then return end
        state = newState
        updateControlVisual(false)
        
        if not skipCallback and options.Callback then
            task.spawn(function()
                local success, err = pcall(function() options.Callback(state) end)
                if not success then
                    warn("[Toggle Error]:", err)
                    pulseError()
                    state = not newState
                    task.wait(0.1)
                    updateControlVisual(false)
                end
            end)
        end
    end

    -- Inicialização
    updateControlVisual(true)
    connections.Click = control.MouseButton1Click:Connect(function() toggle(not state) end)
    
    -- > 5. API PÚBLICA (Persistência e Cache)
    local publicApi = {
        _instance = outerBox,
        _connections = connections,
        _titleConn = titleConn,
        _descConn = descConn,
        Type = "Toggle"
    }

    function publicApi:SetState(s) 
        state = s 
        updateControlVisual(true) 
    end
    
    function publicApi:GetState() return state end
    function publicApi:SetLocked(l) isLocked = l end
    function publicApi:PulseError() pulseError() end

    function publicApi:Destroy()
        -- Desconecta localizações e eventos
        if self._titleConn then self._titleConn:Disconnect() end
        if self._descConn then self._descConn:Disconnect() end
        for _, c in pairs(self._connections) do c:Disconnect() end
        
        -- Remove do cache da aba para evitar memory leaks
        if tab.Components then
            for i, comp in ipairs(tab.Components) do
                if comp == publicApi then 
                    table.remove(tab.Components, i) 
                    break 
                end
            end
        end
        
        if outerBox then outerBox:Destroy() end
        table.clear(self)
    end

    table.insert(tab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateSection(tab, options)
    assert(type(tab) == "table" and tab.Container, "Tab inválida")

    options = options or {}
    local TweenService = game:GetService("TweenService")
    local Localization = self.Localization

    -- > Configurações de Design
    local TITLE_HEIGHT = DESIGN.TitleHeight or 32
    local PADDING = DESIGN.ComponentPadding or 6
    local RADIUS = DESIGN.CornerRadius or 8
    local TWEEN_INFO = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    local fixed = options.Fixed == true
    local open = fixed or options.Open ~= false
    local baseBg = DESIGN.MainBackground

    -- > Estrutura Principal
    local section = Instance.new("Frame")
    section.Name = "Section"
    section.BackgroundColor3 = baseBg
    section.BorderSizePixel = 0
    section.ClipsDescendants = true
    section.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
    section.LayoutOrder = 10000 
    section.Parent = tab.Container

    -- > Persistência de Tema
    RegisterThemeItem("MainBackground", section, "BackgroundColor3")

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, RADIUS)
    corner.Parent = section

    -- > Header (Botão de Interação)
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Text = ""
    header.AutoButtonColor = false
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
    header.ZIndex = 5
    header.Parent = section

    -- > Ícone e Título
    local hasIcon = options.Icon and options.Icon ~= ""
    if hasIcon then
        local icon = Instance.new("ImageLabel")
        icon.BackgroundTransparency = 1
        icon.Size = UDim2.new(0, 18, 0, 18)
        icon.Position = UDim2.new(0, 12, 0.5, 0)
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.ZIndex = 6
        icon.Parent = header
        RegisterThemeItem("PrimaryText", icon, "ImageColor3")
        task.spawn(function()
            local img = IconLibrary:GetIcon({Icon = options.Icon, Expire = "7d"})
            if img then icon.Image = img end
        end)
    end

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Center
    title.Size = UDim2.new(1, hasIcon and -70 or -45, 1, 0)
    title.Position = UDim2.new(0, hasIcon and 38 or 12, 0, 0)
    title.ZIndex = 6
    title.Parent = header
    RegisterThemeItem("PrimaryText", title, "TextColor3")
    local localeConn = Localization:_ApplyDynamicLocalization(title, options.Title or "Section")

    -- > Container de Conteúdo Interno
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.BackgroundTransparency = 1
    content.Position = UDim2.new(0, 0, 0, TITLE_HEIGHT)
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.Parent = section

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, PADDING)
    layout.SortOrder = Enum.SortOrder.LayoutOrder 
    layout.Parent = content

    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 8) 
    padding.PaddingRight = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 8)
    padding.PaddingTop = UDim.new(0, 5)
    padding.Parent = content

    -- > Seta Indicadora
    local arrow = Instance.new("ImageLabel")
    arrow.BackgroundTransparency = 1
    arrow.Size = UDim2.new(0, 12, 0, 12)
    arrow.Position = UDim2.new(1, -15, 0.5, 0)
    arrow.AnchorPoint = Vector2.new(0.5, 0.5)
    arrow.Visible = not fixed
    arrow.Rotation = open and 90 or 0
    arrow.ZIndex = 6
    arrow.Parent = header
    RegisterThemeItem("SecondaryText", arrow, "ImageColor3")
    task.spawn(function()
        local img = IconLibrary:GetIcon({Icon = "chevron-right", Expire = "30d"})
        if img then arrow.Image = img end
    end)

    -- > Função de Atualização de Estado (Tamanho e Animação)
    local function updateState(animate)
        local contentHeight = layout.AbsoluteContentSize.Y + padding.PaddingTop.Offset + padding.PaddingBottom.Offset
        local targetHeight = open and (TITLE_HEIGHT + contentHeight) or TITLE_HEIGHT
        
        if animate then
            TweenService:Create(arrow, TWEEN_INFO, {Rotation = open and 90 or 0}):Play()
            TweenService:Create(section, TWEEN_INFO, {Size = UDim2.new(1, 0, 0, targetHeight)}):Play()
            
            task.delay(TWEEN_INFO.Time, function()
                if open then section.AutomaticSize = Enum.AutomaticSize.Y end
            end)
        else
            arrow.Rotation = open and 90 or 0
            section.Size = UDim2.new(1, 0, 0, targetHeight)
            if open then section.AutomaticSize = Enum.AutomaticSize.Y end
        end
    end

    -- > Lógica de Clique e Ciclo de Vida
    header.MouseButton1Click:Connect(function()
        if fixed then return end
        open = not open
        section.AutomaticSize = Enum.AutomaticSize.None -- Trava o tamanho para a animação fluir
        updateState(true)
    end)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        updateState(true)
    end)

    task.defer(function() updateState(false) end)

    -- > API de Retorno
    local api = {
        Container = content,
        Components = {},
        _instance = section,
        _lastOrder = 0 
    }

    -- > Injetar componentes mantendo a ordem sequencial
    function api:AddComponent(...)
        for _, comp in ipairs({...}) do
            if comp and comp._instance then
                self._lastOrder = self._lastOrder + 1
                
                comp._instance.Parent = content
                if comp._instance:IsA("GuiObject") then
                    comp._instance.LayoutOrder = self._lastOrder
                    
                    comp._instance.Size = UDim2.new(1, 0, comp._instance.Size.Y.Scale, comp._instance.Size.Y.Offset)
                end
                table.insert(self.Components, comp)
            end
        end
        updateState(true)
        return self
    end

    function api:Open() if not open then open = true; updateState(true) end end
    function api:Close() if not fixed and open then open = false; section.AutomaticSize = Enum.AutomaticSize.None; updateState(true) end end
    
    function api:Destroy()
        if localeConn then localeConn:Disconnect() end
        section:Destroy()
        table.clear(self)
    end

    table.insert(tab.Components, api)
    return api
end

function Tekscripts:Notify(options)
    local TitleRaw = options.Title or options.Text or "Notificação"
    local DescRaw = options.Desc or "Sem descrição."
    local Duration = options.Duration or 5 
    local PosMode = options.Position or "Below"
    
    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    local Camera = workspace.CurrentCamera
    
    local screenWidth = Camera.ViewportSize.X
    local isSmallScreen = screenWidth < 600
    local maxWidth = isSmallScreen and (screenWidth * 0.7) or 260
    local textSizeTitle = isSmallScreen and 12 or 13
    local textSizeDesc = isSmallScreen and 10 or 11

    -- > 2. HOLDER DINÂMICO (Intenção: Consistência de Cache e Reutilização)
    local NotificationsHolder = (function()
        local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local containerName = "TekScriptsNotify_" .. PosMode
        local container = PlayerGui:FindFirstChild(containerName)
        
        if not container then
            container = Instance.new("ScreenGui")
            container.Name = containerName
            container.IgnoreGuiInset = true
            container.DisplayOrder = 1000
            container.Parent = PlayerGui
            
            local holder = Instance.new("Frame")
            holder.Name = "Holder"
            holder.BackgroundTransparency = 1
            holder.Size = UDim2.new(0, maxWidth, 0.9, 0)
            
            if PosMode == "Above" then
                holder.AnchorPoint = Vector2.new(1, 0)
                holder.Position = UDim2.new(1, -15, 0, 15) 
            else
                holder.AnchorPoint = Vector2.new(1, 1)
                holder.Position = UDim2.new(1, -15, 1, -15) 
            end
            holder.Parent = container
            
            local layout = Instance.new("UIListLayout")
            layout.VerticalAlignment = (PosMode == "Above") and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Bottom
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            layout.Padding = UDim.new(0, 8)
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Parent = holder
        end
        return container.Holder
    end)()

    -- > 3. CONSTRUÇÃO DO CARD (CanvasGroup para transparência unificada)
    local box = Instance.new("CanvasGroup")
    box.Name = "Notify_" .. tostring(tick())
    box.Size = UDim2.new(1, 0, 0, 0)
    box.AutomaticSize = Enum.AutomaticSize.Y
    box.Position = UDim2.new(1.2, 0, 0, 0) 
    box.GroupTransparency = 1 
    box.BackgroundColor3 = DESIGN.MainBackground
    box.BorderSizePixel = 0
    box.Parent = NotificationsHolder
    
    RegisterThemeItem("MainBackground", box, "BackgroundColor3")
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", box)
    stroke.Thickness = 1
    stroke.Transparency = 0.8
    RegisterThemeItem("AccentColor", stroke, "Color")

    local contentFrame = Instance.new("Frame", box)
    contentFrame.Size = UDim2.new(1, 0, 0, 0)
    contentFrame.AutomaticSize = Enum.AutomaticSize.Y
    contentFrame.BackgroundTransparency = 1
    
    local padding = Instance.new("UIPadding", contentFrame)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)

    -- > TÍTULO COM SCROLL LATERAL (Arretar texto lateralmente)
    local titleScroll = Instance.new("ScrollingFrame")
    titleScroll.Name = "TitleScroll"
    titleScroll.Size = UDim2.new(1, 0, 0, 18)
    titleScroll.BackgroundTransparency = 1
    titleScroll.BorderSizePixel = 0
    titleScroll.CanvasSize = UDim2.new(0, 0, 0, 0) -- Ajustado dinamicamente
    titleScroll.ScrollBarThickness = 0 -- Scroll invisível para look limpo
    titleScroll.ScrollingDirection = Enum.ScrollingDirection.X
    titleScroll.Parent = contentFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(0, 0, 1, 0)
    titleLabel.AutomaticSize = Enum.AutomaticSize.X -- Cresce para o lado
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = textSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = titleScroll
    RegisterThemeItem("PrimaryText", titleLabel, "TextColor3")
    
    -- Atualiza o CanvasSize baseado no tamanho do texto
    titleLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        titleScroll.CanvasSize = UDim2.new(0, titleLabel.AbsoluteSize.X, 0, 0)
    end)

    local tConn = Localization:_ApplyDynamicLocalization(titleLabel, TitleRaw)

    -- > DESCRIÇÃO
    local descLabel = Instance.new("TextLabel", contentFrame)
    descLabel.Position = UDim2.new(0, 0, 0, 22) -- Espaço maior para não colar no scroll
    descLabel.Size = UDim2.new(1, 0, 0, 0)
    descLabel.AutomaticSize = Enum.AutomaticSize.Y
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = textSizeDesc
    descLabel.TextWrapped = true
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.BackgroundTransparency = 1
    RegisterThemeItem("SecondaryText", descLabel, "TextColor3")
    local dConn = Localization:_ApplyDynamicLocalization(descLabel, DescRaw)

    -- > BARRA DE PROGRESSO (Base)
    local barBackground = Instance.new("Frame", box)
    barBackground.Size = UDim2.new(1, 0, 0, 2)
    barBackground.Position = UDim2.new(0, 0, 1, -2)
    barBackground.BackgroundTransparency = 0.8
    barBackground.BackgroundColor3 = Color3.new(0,0,0)
    barBackground.BorderSizePixel = 0

    local progressBar = Instance.new("Frame", barBackground)
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.BorderSizePixel = 0
    RegisterThemeItem("AccentColor", progressBar, "BackgroundColor3")

    -- > 4. ANIMAÇÕES E LIMPEZA
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    TweenService:Create(box, tweenInfo, { 
        Position = UDim2.new(0, 0, 0, 0), 
        GroupTransparency = 0 
    }):Play()
    
    local timerTween = TweenService:Create(progressBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear), { 
        Size = UDim2.new(0, 0, 1, 0) 
    })
    timerTween:Play()

    task.delay(Duration, function()
        if box and box.Parent then
            if tConn then tConn:Disconnect() end
            if dConn then dConn:Disconnect() end

            local fadeOut = TweenService:Create(box, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { 
                Position = UDim2.new(1.2, 0, 0, 0),
                GroupTransparency = 1 
            })
            fadeOut:Play()
            fadeOut.Completed:Connect(function() 
                box:Destroy() 
            end)
        end
    end)
end

function Tekscripts:CreateInput(tab, options)
    assert(type(tab) == "table" and tab.Container, "Invalid Tab object provided to CreateInput")
    assert(type(options) == "table" and type(options.Text) == "string", "Invalid arguments for CreateInput")

    -- > SETUP DE VARIÁVEIS E DEPEDÊNCIAS
    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    
    local rawTitle = options.Text
    local rawPlaceholder = options.Placeholder or "Digite aqui..."
    local rawDesc = options.Desc
    local rawBlockText = options.BlockText or "🔒"

    -- > CORES E TEMAS
    local colorBox = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.03)
    local colorInput = DESIGN.MainBackground:Lerp(Color3.new(0, 0, 0), 0.1)
    local colorStroke = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.08)
    local TWEEN_FAST = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    -- > 1. CONTAINER PRINCIPAL (BOX)
    local box = Instance.new("Frame")
    box.Name = "Input_" .. rawTitle
    box.Size = UDim2.new(1, -10, 0, 0)
    box.AutomaticSize = Enum.AutomaticSize.Y
    box.BackgroundColor3 = colorBox
    box.Parent = tab.Container
    
    RegisterThemeItem("MainBackground", box, "BackgroundColor3")
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)

    local padding = Instance.new("UIPadding", box)
    padding.PaddingTop, padding.PaddingBottom = UDim.new(0, 10), UDim.new(0, 10)
    padding.PaddingLeft, padding.PaddingRight = UDim.new(0, 12), UDim.new(0, 12)

    local layout = Instance.new("UIListLayout", box)
    layout.Padding, layout.SortOrder = UDim.new(0, 6), Enum.SortOrder.LayoutOrder

    -- > 2. LINHA SUPERIOR (TÍTULO + ÁREA DINÂMICA)
    local topRow = Instance.new("Frame")
    topRow.Size = UDim2.new(1, 0, 0, 32)
    topRow.BackgroundTransparency = 1
    topRow.LayoutOrder, topRow.Parent = 1, box

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -40, 1, 0) -- Espaço base para a bolinha
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = DESIGN.PrimaryText
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextTruncate = Enum.TextTruncate.AtEnd
    title.ZIndex = 1
    title.Parent = topRow
    
    RegisterThemeItem("PrimaryText", title, "TextColor3")
    local titleLoc = Localization:_ApplyDynamicLocalization(title, rawTitle)

    -- > 3. O CAMPO DE TEXTO (TEXTBOX EXPANSÍVEL)
    local textbox = Instance.new("TextBox")
    textbox.Name = "Field"
    textbox.AnchorPoint = Vector2.new(1, 0.5) -- Fixa o ponto na direita central
    textbox.Size = UDim2.new(0, 32, 1, 0)
    textbox.Position = UDim2.new(1, 0, 0.5, 0) -- Alinhado na extrema direita
    textbox.BackgroundColor3 = colorInput
    textbox.PlaceholderText = ""
    textbox.TextColor3 = DESIGN.PrimaryText
    textbox.Font = Enum.Font.Gotham
    textbox.TextSize = 13
    textbox.ClipsDescendants = true
    textbox.ClearTextOnFocus = false
    textbox.ZIndex = 2
    textbox.Text = options.Default or ""
    textbox.Parent = topRow

    Instance.new("UIPadding", textbox).PaddingLeft = UDim.new(0, 10)
    local boxCorner = Instance.new("UICorner", textbox)
    boxCorner.CornerRadius = UDim.new(0, 16)
    
    local boxStroke = Instance.new("UIStroke", textbox)
    boxStroke.Color, boxStroke.Thickness = colorStroke, 1
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    RegisterThemeItem("SecondaryText", boxStroke, "Color")

    -- > 4. CONTROLE DE ESTADOS VISUAIS (CACHE E ANIMAÇÃO)
    local function updateVisualState(isHovering)
        local isFocused = textbox:IsFocused()
        local hasText = #textbox.Text > 0
        
        -- Definição de metas de animação
        local targetWidth = 32
        local targetRadius = 16
        local strokeColor = colorStroke

        if isFocused then
            targetWidth = topRow.AbsoluteSize.X * 0.65 -- 65% da largura total
            targetRadius = 6
            strokeColor = DESIGN.AccentColor
            textbox.PlaceholderText = Localization:TranslateText(rawPlaceholder)
        elseif isHovering or hasText then
            targetWidth = hasText and 120 or 80 -- Fica maior se tiver texto para o usuário ler
            targetRadius = 8
            textbox.PlaceholderText = ""
        else
            targetWidth = 32
            targetRadius = 16
            textbox.PlaceholderText = ""
        end

        TweenService:Create(textbox, TWEEN_FAST, {
            Size = UDim2.new(0, targetWidth, 1, 0),
            BackgroundColor3 = isFocused and colorInput:Lerp(DESIGN.AccentColor, 0.05) or colorInput
        }):Play()

        TweenService:Create(boxCorner, TWEEN_FAST, { CornerRadius = UDim.new(0, targetRadius) }):Play()
        TweenService:Create(boxStroke, TWEEN_FAST, { 
            Color = strokeColor,
            Thickness = isFocused and 1.5 or 1 
        }):Play()
    end

    -- Conexões de Interação
    local focusConn = textbox.Focused:Connect(function() updateVisualState(false) end)
    local focusLostConn = textbox.FocusLost:Connect(function() updateVisualState(false) end)
    local enterConn = textbox.MouseEnter:Connect(function() updateVisualState(true) end)
    local leaveConn = textbox.MouseLeave:Connect(function() updateVisualState(false) end)
    local textChangeConn = textbox:GetPropertyChangedSignal("Text"):Connect(function() 
        if not textbox:IsFocused() then updateVisualState(false) end 
    end)

    -- > 5. SISTEMA DE BLOQUEIO E DESCRIÇÃO
    local blockOverlay = Instance.new("Frame")
    blockOverlay.Size, blockOverlay.Visible = UDim2.new(1, 0, 1, 0), false
    blockOverlay.BackgroundColor3, blockOverlay.BackgroundTransparency = DESIGN.MainBackground, 0.2
    blockOverlay.ZIndex = 5
    blockOverlay.Parent = textbox
    Instance.new("UICorner", blockOverlay).CornerRadius = UDim.new(0, 16)

    local blockTextLabel = Instance.new("TextLabel")
    blockTextLabel.Size, blockTextLabel.BackgroundTransparency = UDim2.new(1, 0, 1, 0), 1
    blockTextLabel.Font, blockTextLabel.TextSize = Enum.Font.GothamBold, 10
    blockTextLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    blockTextLabel.Parent = blockOverlay
    local blockLoc = Localization:_ApplyDynamicLocalization(blockTextLabel, rawBlockText)

    if rawDesc then
        local descLabel = Instance.new("TextLabel")
        descLabel.Size, descLabel.AutomaticSize = UDim2.new(1, 0, 0, 0), Enum.AutomaticSize.Y
        descLabel.BackgroundTransparency, descLabel.Font = 1, Enum.Font.Gotham
        descLabel.TextColor3, descLabel.TextSize = DESIGN.SecondaryText, 11
        descLabel.TextXAlignment, descLabel.TextWrapped = Enum.TextXAlignment.Left, true
        descLabel.LayoutOrder, descLabel.Parent = 2, box
        RegisterThemeItem("SecondaryText", descLabel, "TextColor3")
        Localization:_ApplyDynamicLocalization(descLabel, rawDesc)
    end

    -- > 6. API PÚBLICA
    local publicApi = {
        _instance = box,
        _connections = { focusConn, focusLostConn, enterConn, leaveConn, textChangeConn },
        _locConns = { titleLoc, blockLoc }
    }

    local function safeCallback(val)
        if not options.Callback then return end
        pcall(function() options.Callback(val) end)
    end

    table.insert(publicApi._connections, textbox.FocusLost:Connect(function(enter)
        local content = textbox.Text
        if options.Type and options.Type:lower() == "number" then
            content = tonumber(content:match("-?%d*%.?%d*")) or 0
        end
        safeCallback(content)
    end))

    function publicApi:SetBlocked(state, text)
        textbox.Active, textbox.TextEditable, blockOverlay.Visible = not state, not state, state
        if text then blockTextLabel.Text = Localization:TranslateText(text) end
    end

    function publicApi:SetValue(val)
        textbox.Text = tostring(val)
        updateVisualState(false)
    end

    function publicApi:Destroy()
        for _, c in ipairs(self._connections) do if c.Connected then c:Disconnect() end end
        for _, l in ipairs(self._locConns) do if l and l.Disconnect then l:Disconnect() end end
        if box then box:Destroy() end
        table.clear(self)
    end

    updateVisualState(false)
    table.insert(tab.Components, publicApi)
    return publicApi
end

function Tekscripts:CreateInput(tab, options)
    -- > VALIDAÇÕES INICIAIS
    assert(type(tab) == "table" and tab.Container, "Invalid Tab object provided to CreateInput")
    assert(type(options) == "table" and type(options.Text) == "string", "Invalid arguments for CreateInput")

    -- > DEPENDÊNCIAS E CONFIGURAÇÃO
    local TweenService = game:GetService("TweenService")
    local Localization = Tekscripts.Localization
    
    local rawTitle = options.Text
    local rawPlaceholder = options.Placeholder or "Digite aqui..."
    local rawDesc = options.Desc
    local rawBlockText = options.BlockText or "🔒"
    local defaultValue = options.Default or ""

    -- > DESIGN SYSTEM
    local colorBox = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.03)
    local colorInput = DESIGN.MainBackground:Lerp(Color3.new(0, 0, 0), 0.1)
    local colorStroke = DESIGN.MainBackground:Lerp(Color3.new(1, 1, 1), 0.08)
    local TWEEN_FAST = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    -- > 1. CONTAINER PRINCIPAL
    local box = Instance.new("Frame")
    box.Name = "Input_" .. rawTitle
    box.Size = UDim2.new(1, -10, 0, 0)
    box.AutomaticSize = Enum.AutomaticSize.Y
    box.BackgroundColor3 = colorBox
    box.Parent = tab.Container
    
    RegisterThemeItem("MainBackground", box, "BackgroundColor3")
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, DESIGN.CornerRadius or 8)

    local padding = Instance.new("UIPadding", box)
    padding.PaddingTop, padding.PaddingBottom = UDim.new(0, 10), UDim.new(0, 10)
    padding.PaddingLeft, padding.PaddingRight = UDim.new(0, 12), UDim.new(0, 12)

    local mainLayout = Instance.new("UIListLayout", box)
    mainLayout.Padding, mainLayout.SortOrder = UDim.new(0, 6), Enum.SortOrder.LayoutOrder

    -- > 2. LINHA SUPERIOR
    local topRow = Instance.new("Frame")
    topRow.Name = "Header"
    topRow.Size = UDim2.new(1, 0, 0, 32)
    topRow.BackgroundTransparency = 1
    topRow.LayoutOrder = 1
    topRow.Parent = box

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -42, 1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = DESIGN.PrimaryText
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextTruncate = Enum.TextTruncate.AtEnd
    title.Parent = topRow
    
    RegisterThemeItem("PrimaryText", title, "TextColor3")
    local titleLoc = Localization:_ApplyDynamicLocalization(title, rawTitle)

    -- > 3. TEXTBOX
    local textbox = Instance.new("TextBox")
    textbox.Name = "Field"
    textbox.Size = UDim2.new(0, 32, 1, 0)
    textbox.Position = UDim2.new(1, 0, 0, 0)
    textbox.AnchorPoint = Vector2.new(1, 0)
    textbox.BackgroundColor3 = colorInput
    textbox.PlaceholderText = ""
    textbox.TextColor3 = DESIGN.PrimaryText
    textbox.Font = Enum.Font.Gotham
    textbox.TextSize = 13
    textbox.ClipsDescendants = true
    textbox.ClearTextOnFocus = false
    textbox.Text = defaultValue
    textbox.ZIndex = 2
    textbox.Parent = topRow

    local textPadding = Instance.new("UIPadding", textbox)
    textPadding.PaddingLeft = UDim.new(0, 0)
    
    local boxCorner = Instance.new("UICorner", textbox)
    boxCorner.CornerRadius = UDim.new(0, 16)
    
    local boxStroke = Instance.new("UIStroke", textbox)
    boxStroke.Color, boxStroke.Thickness = colorStroke, 1
    boxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    RegisterThemeItem("SecondaryText", boxStroke, "Color")

    -- > 4. OVERLAY DE BLOQUEIO (FIX DA MENSAGEM)
    local blockOverlay = Instance.new("Frame")
    blockOverlay.Name = "Blocker"
    blockOverlay.Size = textbox.Size
    blockOverlay.Position = textbox.Position
    blockOverlay.AnchorPoint = textbox.AnchorPoint
    blockOverlay.Visible = false
    blockOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
    blockOverlay.BackgroundTransparency = 0.5
    blockOverlay.ZIndex = 5
    blockOverlay.Parent = topRow
    
    local blockCorner = Instance.new("UICorner", blockOverlay)
    blockCorner.CornerRadius = boxCorner.CornerRadius

    -- Container interno para a mensagem não colar nas bordas
    local blockTextLabel = Instance.new("TextLabel")
    blockTextLabel.Size = UDim2.new(1, -8, 1, -8) -- Padding interno de segurança
    blockTextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    blockTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    blockTextLabel.BackgroundTransparency = 1
    blockTextLabel.Font = Enum.Font.GothamBold
    blockTextLabel.TextSize = 10
    blockTextLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    blockTextLabel.TextScaled = true -- Faz o texto caber sem bugar
    blockTextLabel.Text = rawBlockText
    blockTextLabel.Parent = blockOverlay
    
    -- Limita o tamanho do texto scaled para não ficar gigante
    local textConstraint = Instance.new("UITextSizeConstraint", blockTextLabel)
    textConstraint.MaxTextSize = 12
    textConstraint.MinTextSize = 8

    local blockLoc = Localization:_ApplyDynamicLocalization(blockTextLabel, rawBlockText)

    -- > 5. ESTADOS VISUAIS (MEMÓRIA E ANIMAÇÃO)
    local function updateVisualState(isHovering)
        local isFocused = textbox:IsFocused()
        local hasText = #textbox.Text > 0
        local isBlocked = blockOverlay.Visible
        local maxWidth = topRow.AbsoluteSize.X * 0.65
        
        local targetWidth = 32
        local targetRadius = 16
        local padValue = 0

        -- Se estiver bloqueado, ele expande um pouco para a mensagem aparecer
        if isBlocked then
            targetWidth = 100
            targetRadius = 8
            padValue = 0
        elseif isFocused then
            targetWidth = maxWidth
            targetRadius = 8
            padValue = 10
            textbox.PlaceholderText = Localization:TranslateText(rawPlaceholder)
        elseif isHovering or hasText then
            targetWidth = math.clamp(hasText and 140 or 100, 32, maxWidth)
            targetRadius = 8
            padValue = 10
            textbox.PlaceholderText = ""
        else
            targetWidth = 32
            targetRadius = 16
            padValue = 0
            textbox.PlaceholderText = ""
        end

        local sizeTween = UDim2.new(0, targetWidth, 1, 0)
        title.Size = UDim2.new(1, -(targetWidth + 12), 1, 0)

        TweenService:Create(textbox, TWEEN_FAST, {Size = sizeTween, BackgroundColor3 = isFocused and colorInput:Lerp(DESIGN.AccentColor, 0.05) or colorInput}):Play()
        TweenService:Create(blockOverlay, TWEEN_FAST, {Size = sizeTween}):Play()
        TweenService:Create(boxCorner, TWEEN_FAST, {CornerRadius = UDim.new(0, targetRadius)}):Play()
        TweenService:Create(blockCorner, TWEEN_FAST, {CornerRadius = UDim.new(0, targetRadius)}):Play()
        TweenService:Create(textPadding, TWEEN_FAST, {PaddingLeft = UDim.new(0, padValue), PaddingRight = UDim.new(0, padValue)}):Play()
        
        TweenService:Create(boxStroke, TWEEN_FAST, { 
            Color = isFocused and DESIGN.AccentColor or colorStroke,
            Thickness = isFocused and 1.5 or 1 
        }):Play()
    end

    -- > 6. API E CONEXÕES
    local publicApi = {
        _instance = box,
        _connections = {},
        _locConns = { titleLoc, blockLoc }
    }

    local function safeCallback(val)
        if options.Callback then task.spawn(pcall, options.Callback, val) end
    end

    table.insert(publicApi._connections, textbox.Focused:Connect(function() updateVisualState(false) end))
    table.insert(publicApi._connections, textbox.FocusLost:Connect(function() 
        local content = textbox.Text
        if options.Type and options.Type:lower() == "number" then
            content = tonumber(content:match("-?%d*%.?%d*")) or 0
        end
        updateVisualState(false)
        safeCallback(content)
    end))
    table.insert(publicApi._connections, textbox.MouseEnter:Connect(function() updateVisualState(true) end))
    table.insert(publicApi._connections, textbox.MouseLeave:Connect(function() updateVisualState(false) end))

    if rawDesc then
        local descLabel = Instance.new("TextLabel")
        descLabel.Size, descLabel.AutomaticSize = UDim2.new(1, 0, 0, 0), Enum.AutomaticSize.Y
        descLabel.BackgroundTransparency, descLabel.Font = 1, Enum.Font.Gotham
        descLabel.TextColor3, descLabel.TextSize = DESIGN.SecondaryText, 11
        descLabel.TextXAlignment, descLabel.TextWrapped = Enum.TextXAlignment.Left, true
        descLabel.LayoutOrder = 2
        descLabel.Parent = box
        RegisterThemeItem("SecondaryText", descLabel, "TextColor3")
        Localization:_ApplyDynamicLocalization(descLabel, rawDesc)
    end

    function publicApi:SetBlocked(state, text)
        blockOverlay.Visible = state
        textbox.Active, textbox.TextEditable = not state, not state
        if text then blockTextLabel.Text = Localization:TranslateText(text) end
        updateVisualState(false) -- Atualiza o tamanho para caber o texto de bloqueio
    end

    function publicApi:SetValue(val)
        textbox.Text = tostring(val)
        updateVisualState(false)
    end

    function publicApi:Destroy()
        for _, c in ipairs(self._connections) do if c.Connected then c:Disconnect() end end
        for _, l in ipairs(self._locConns) do if l and l.Disconnect then l:Disconnect() end end
        box:Destroy()
        table.clear(self)
    end

    updateVisualState(false)
    table.insert(tab.Components, publicApi)
    return publicApi
end


return Tekscripts
