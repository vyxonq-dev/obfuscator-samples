-- Painel LuckyXiter
--Creditos Para: dono do esp, aim( o aim foi uma mistura de 2 diferentes )






game.StarterGui:SetCore("SendNotification", {
Title = "Lucky Xiter",
Text = "Welcome / Bem Vindo(a), " ..game.Players.LocalPlayer.Name.. " / ".. game.Players.LocalPlayer.DisplayName.. ".",
Duration = 2,
})

game.StarterGui:SetCore("SendNotification", {
Title = "Lucky Xiter",
Text = "Credits to The ESP Lib Creator (linemaster2) And the Aimbot Creator",
Duration = 2,
})
game.StarterGui:SetCore("SendNotification", {
Title = "Lucky Xiter",
Text = "Creditos Para o Criador do ESP (linemaster2) e do Aimbot",
Duration = 2,
})





local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

    

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();
ESP.Enabled = true;
ESP.ShowBox = false;
ESP.ShowName = false;
ESP.ShowHealth = false;
ESP.ShowTracer = false;
ESP.ShowDistance = false;
ESP.ShowSkeletons = false;


_G.EHBON = false
_G.Aiming = false
_G.aimspot = "Head"

local TweenOn = false
local TweenTime = 0.2
local valorhitbox = 30
local fovAmount = 100
local teamCheck = false
local fovVisivel = true

local WalkSpeedToggle = false
local JumpPowerToggle = false


local fovCircle = Drawing.new("Circle")
fovCircle.Radius = fovAmount
fovCircle.Visible = fovVisivel
fovCircle.Color = Color3.fromRGB(212, 34, 255)
fovCircle.Thickness = 3
fovCircle.NumSides = 11
fovCircle.Position = Vector2.new(Camera.ViewportSize.X /2, Camera.ViewportSize.Y /2 )
fovCircle.Filled = false



--Funcoes

-- Expansor de hitbox


local function expandhitbox(size)
    if _G.EHBON == true then
    for i,v in pairs(game.Players:GetPlayers()) do
       if v ~= game.Players.LocalPlayer then
        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
              local hrp = v.Character.HumanoidRootPart
              if hrp.Size ~= Vector3.new(size,size,size) then
              hrp.Size = Vector3.new(size,size,size)
              hrp.Transparency = 0.5 
              hrp.CanCollide = false
              hrp.Anchored = false
               end
            end
         end
      end
   end
end

local function rehitbox()
    for i,v in pairs(game.Players:GetPlayers()) do
       if v ~= game.Players.LocalPlayer then
        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
              local hrp_1 = v.Character.HumanoidRootPart
              if hrp_1.Size ~= Vector3.new(2,2,1) then
              hrp_1.Size = Vector3.new(2,2,1)
              hrp_1.Transparency = 1
              hrp_1.CanCollide = false
              hrp_1.Anchored = false
              end
           end
        end
    end
end



game["Run Service"].RenderStepped:Connect(function()
  if _G.EHBON == true then
    expandhitbox(valorhitbox)
    else
        
        rehitbox()
    end
end)


function NotObstructing(Destination, Ignore)
    local Origin = workspace.CurrentCamera.CFrame.Position
    local CheckRay = Ray.new(Origin, Destination - Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
    return Hit == nil
end

local function fovupdate()
fovCircle.Position = Vector2.new(Camera.ViewportSize.X /2, Camera.ViewportSize.Y /2 )
end



local function Closestplr()
    local closestDistance, closestPlayer = math.huge, nil
    local mousePos = Vector2.new(Camera.ViewportSize.X /2, Camera.ViewportSize.Y /2)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
                    if onScreen then
                        local distance = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if distance <= fovAmount and (not teamCheck or player.Team ~= LocalPlayer.Team) then
                            if distance < closestDistance and NotObstructing(character.Head.Position,{LocalPlayer.Character, character}) then
                                closestPlayer = player
                                closestDistance = distance
                            end
                        end
                    end
                end
            end
        end
    end

    return closestPlayer
end

local function look()
    plr = Closestplr()
    
    if TweenOn == true then
        local aimthing = CFrame.new(Camera.CFrame.Position, plr.Character[_G.aimspot].Position)
        local aimtween = TweenService:Create(Camera, TweenInfo.new(TweenTime), {CFrame = aimthing })
        aimtween:Play()
    else
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, plr.Character[_G.aimspot].Position)
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
local closest = Closestplr()
fovupdate()
if _G.Aiming == true then
if closest ~= nil and closest.Character.Humanoid.Health > 0 then
          look()
       end
    end
end)

-- Lib


local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true





local Window = Library:CreateWindow({
	Title = "Lucky Xiter",
	Footer = "Versão 1.1",
	Icon = 112774205316776,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
Main = Window:AddTab("Mira", "crosshair"),
ESPTab = Window:AddTab("ESP", "user"),
HBXTab = Window:AddTab("Hitbox", "sword"),
LPTab = Window:AddTab("Local Player", "person-standing"),
OTRTab = Window:AddTab("Outro", "blocks"),
}



local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Mira", "crosshair")
local lb2 = Tabs.ESPTab:AddLeftGroupbox("ESP", "line-squiggle")
local lb3 = Tabs.HBXTab:AddLeftGroupbox("Groupbox", "sword")
local lpgb = Tabs.LPTab:AddLeftGroupbox("Velocidade", "User")
local lprgb = Tabs.LPTab:AddRightGroupbox("Pulo")
local gboxSn = Tabs.OTRTab:AddLeftGroupbox("Left Groupbox", "sword")



local ativarab = LeftGroupBox:AddToggle("MyToggle", {
	Text = "Ativar Aimbot",
	Tooltip = "Ativar o Aimbot", -- Information shown when you hover over the toggle
	DisabledTooltip = "Desativado", -- Information shown when you hover over the toggle while it's disabled

	Default = _G.Aiming, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
        _G.Aiming = Value
	end,
})


LeftGroupBox:AddToggle("MyToggle", {
	Text = "Aim Time",
	Tooltip = "Mirar no seu time", -- Information shown when you hover over the toggle
	DisabledTooltip = "Desativado", -- Information shown when you hover over the toggle while it's disabled

	Default = teamCheck, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
        teamCheck = Value
	end,
})

local ativarab = LeftGroupBox:AddToggle("MyToggle", {
	Text = "Aim Tween",
	Tooltip = "Te faz parecer limpo", -- Information shown when you hover over the toggle
	DisabledTooltip = "Desativado", -- Information shown when you hover over the toggle while it's disabled

	Default = TweenOn, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
        TweenOn = Value
	end,
})
LeftGroupBox:AddToggle("MyToggle", {
	Text = "Fov Visivel",
	Tooltip = "Altera a visibilidade do fov", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = fovVisivel, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		fovCircle.Visible = Value
	end,
})



lb2:AddToggle("MySlider", {
	Text = "Ativar ESP",
	Default = ESP.Enabled,
	Min = 0,
	Max = 360,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.Enabled = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})



LeftGroupBox:AddSlider("MySlider", {
	Text = "Tempo do Tween",
	Default = TweenTime,
	Min = 0,
	Max = 1,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
       TweenTime = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

LeftGroupBox:AddSlider("MySlider", {
	Text = "Tamanho Fov",
	Default = fovAmount,
	Min = 0,
	Max = 360,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
       fovAmount = Value
       fovCircle.Radius = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

LeftGroupBox:AddDropdown("Dropdown", {
	Values = {
	"HumanoidRootPart";
	"Head";
	};
	Default = aimspot, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected

	MaxVisibleDropdownItems = 2, -- Default: 8, allows you to change the size of the dropdown list

	Text = "Aimspot",
	Tooltip = "", -- Information shown when you hover over the dropdown
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the dropdown while it's disabled

	Searchable = false, -- true / false, makes the dropdown searchable (great for a long list of values)

	Callback = function(Value)
		_G.aimspot = Value
	end,

	Disabled = false, -- Will disable the dropdown (true / false)
	Visible = true, -- Will make the dropdown invisible (true / false)
})





lb2:AddToggle("MySlider", {
	Text = "ESP Linhas",
	Default = ESP.ShowTracer,
	Min = 0,
	Max = 360,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.ShowTracer = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb2:AddToggle("MySlider", {
	Text = "ESP Caixa",
	Default = ESP.ShowBox,
	Min = 0,
	Max = 360,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.ShowBox = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb2:AddToggle("MySlider", {
	Text = "ESP Vida",
	Default = ESP.ShowHealth,
	Min = 0,
	Max = 360,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.ShowHealth = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb2:AddToggle("MySlider", {
	Text = "ESP Distancia",
	Default = ESP.ShowDistance,
	
	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.ShowDistance = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb2:AddToggle("MySlider", {
	Text = "ESP Esqueleto",
	Default = ESP.ShowSkeletons,
	
	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.ShowSkeletons = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb2:AddToggle("MySlider", {
	Text = "ESP Nome",
	Default = ESP.ShowName,
	
	Callback = function(Value)
	    
	    --[[
        ESP.Enabled = true;
        ESP.ShowBox = false;
        ESP.ShowName = false;
        ESP.ShowHealth = false;
        ESP.ShowTracer = false;
        ESP.ShowDistance = false;
        ESP.ShowSkeletons = false;

	    ]]
		ESP.ShowName = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb3:AddToggle("MySlider", {
	Text = "Expandir Hitbox",
	Default = _G.EHBON,
	
	Callback = function(Value)
		_G.EHBON = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lb3:AddSlider("MySlider", {
	Text = "Tamanho Hitbox",
	Default = valorhitbox,
	Min = 0,
	Max = 30,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
	   
       valorhitbox = Value
       
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

local MyButton = lb3:AddButton({
	Text = "Anti Kick",
	Func = function()
	    pcall(function()
	    local old; old = hookmetamethod(game, "__namecall", function(self,...)
   local namecallmethod = getnamecallmethod():lower()
    
    if namecallmethod == "kick" then 
       return print("ac tried to fuck ur ahh")
    end
    return old(self, ...)
	    end)
    Library:Notify({
		Title = "Injetado",
		Description = "Bypass Injetado com sucesso, nao sera expulso do jogo (nem sempre) " .. ReceivedKey .. "\nSuccess: " .. tostring(Success),
		Time = 4,
	})
end)

    end,
	DoubleClick = false,

	Tooltip = "mata kicks (localscripts apenas)",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

local MyButton = lb3:AddButton({
	Text = "HitboxAntiKick",
	Func = function()
	    
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__index
    mt.__index = function(self,key)
    if tostring(self) == "HumanoidRootPart" and tostring(key) == "Size" then
                  return Vector3.new(2,2,1)
         end
        return old(self,key)
    end 
    setreadonly(mt, true)
end)

	    Library:Notify({
		Title = "Injetado",
		Description = "Bypass Injetado com sucesso, Não sera expulso do jogo (nem sempre) " .. ReceivedKey .. "\nSuccess: " .. tostring(Success),
		Time = 4,
	})

    end,
	DoubleClick = false,

	Tooltip = "Faz sua hitbox aparecer normal pro servidor,assim, não te expulsando",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})


lpgb:AddToggle("SpeedToggle", {
	Text = "Alterar Velocidade",
	Default = WalkSpeedToggle,
	Min = 16,
	Max = 130, -- why would you need more than that
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
		WalkSpeedToggle = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lpgb:AddSlider("MySlider", {
	Text = "Velocidade",
	Default = 16,
	Min = 16,
	Max = 300,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
         while WalkSpeedToggle == true do
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
            task.wait()
         end
    end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})


lprgb:AddToggle("JPSlider", {
	Text = "Alterar Poder de Pulo",
	Default = WalkSpeedToggle,
	Min = 50,
	Max = 130, -- why would you need more than that
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
		JumpPowerToggle = Value
	end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

lprgb:AddSlider("MySlider", {
	Text = "Pulo",
	Default = 50,
	Min = 50,
	Max = 300,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
         while JumpPowerToggle == true do
            LocalPlayer.Character.Humanoid.JumpPower = Value
            task.wait()
         end
    end,

	Tooltip = "", -- Information shown when you hover over the slider
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the slider while it's disabled

	Disabled = false, -- Will disable the slider (true / false)
	Visible = true, -- Will make the slider invisible (true / false)
})

local MyButtonlp = lpgb:AddButton({
	Text = "Bypass Velocidade",
	Func = function()
	    
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__index
    mt.__index = function(self,key)
    if tostring(self) == "Humanoid" and tostring(key) == "WalkSpeed" then
                  return 16
         end
        return old(self,key)
    end 
    setreadonly(mt, true)
end)

	    Library:Notify({
		Title = "Injetado",
		Description = "Bypass Injetado com sucesso, Não sera expulso do jogo (nem sempre) " .. ReceivedKey .. "\nSuccess: " .. tostring(Success),
		Time = 4,
	})

    end,
	DoubleClick = false,

	Tooltip = "Faz sua velocidade aparecer normal pro servidor,assim, não te expulsando",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

local MyButtonlpr = lprgb:AddButton({
	Text = "Jump Bypass",
	Func = function()
	    
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__index
    mt.__index = function(self,key)
    if tostring(self) == "Humanoid" and tostring(key) == "JumpPower" then
                  return 50
         end
        return old(self,key)
    end 
    setreadonly(mt, true)
end)

	    Library:Notify({
		Title = "Injetado",
		Description = "Bypass Injetado com sucesso, Não sera expulso do jogo (nem sempre) " .. ReceivedKey .. "\nSuccess: " .. tostring(Success),
		Time = 4,
	})

    end,
	DoubleClick = false,

	Tooltip = "Faz seu pulo aparecer normal pro servidor,assim, não te expulsando",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

