local oob
local auto
local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer
local a = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:wait()


local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false -- Forces AddToggle to AddCheckbox
Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)


Library:Notify("Loading Ui...", 3)

local Window = Library:CreateWindow({


	Title = "Nico's Nextboobs",
	Footer = "version: 0.0.9 made by [ANON] aka Kelx and Bulletproof",
	Icon = 1,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	-- Creates a new tab titled Main
	Main = Window:AddTab("OpenWorld", "user"),
	Loader = Window:AddTab("Loaders", "user"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}



local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Remote Events", "boxes")
local Left2GroupBox = Tabs.Loader:AddLeftGroupbox("Loaders", "boxes")
local RightGroupBox = Tabs.Main:AddRightGroupbox("Teleports", "boxes")
local Right2GroupBox = Tabs.Main:AddRightGroupbox("Bonus Score", "boxes")

Library:Notify("Loaded.", 5)

local MyButton = Left2GroupBox:AddButton({
	Text = "Anti AFK",
	Func = function()
	Library:Notify("Anti AFK has been loaded.", 5)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/AntiAfk2.lua"))()
	end,
	DoubleClick = false,

	Tooltip = "Loads Anti AFK",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

local MyButton = Left2GroupBox:AddButton({
	Text = "DEX",
	Func = function()
	Library:Notify("DEX has been loaded.", 5)
		 loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dex-Explorer-24220"))()
	end,
	DoubleClick = false,

	Tooltip = "Loads DEX",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

local MyButton = Left2GroupBox:AddButton({
	Text = "IY",
	Func = function()
	Library:Notify("Infinity Yield has been loaded.", 5)
		  loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end,
	DoubleClick = false,

	Tooltip = "Loads IY",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

local MyButton = Left2GroupBox:AddButton({
	Text = "Auto BHOP by murillo",
	Func = function()
	Library:Notify("Auto Bhop has been loaded.", 5)
		    local player = game.Players.LocalPlayer
  local character = player.Character or player.CharacterAdded:Wait()
  local humanoid = character:WaitForChild("Humanoid")

  local bunnyhopEnabled = false -- Estado inicial do Bunnyhop (desativado)

  -- Funￃﾧￃﾣo para criar a GUI de Bunnyhop
  local function createGUI()
   local screenGui = Instance.new("ScreenGui")
   local toggleButton = Instance.new("TextButton")

   -- Adicionando o ScreenGui ao PlayerGui
   screenGui.Parent = player:WaitForChild("PlayerGui")

   -- Configurando o Botￃﾣo de Alternￃﾢncia
   toggleButton.Parent = screenGui
   toggleButton.Size = UDim2.new(0, 100, 0, 50)
   toggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
   toggleButton.Text = "Bunnyhop: OFF"
   toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho (desativado)

   -- Funￃﾧￃﾣo para alternar o Bunnyhop
   toggleButton.MouseButton1Click:Connect(function()
    bunnyhopEnabled = not bunnyhopEnabled
    if bunnyhopEnabled then
     toggleButton.Text = "Bunnyhop: ON"
     toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde (ativado)
    else
     toggleButton.Text = "Bunnyhop: OFF"
     toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho (desativado)
    end
   end)
  end

  -- Funￃﾧￃﾣo para configurar o Bunnyhop rￃﾭtmico
  local function setupBunnyhop()
   humanoid.StateChanged:Connect(function(_, newState)
    if bunnyhopEnabled and newState == Enum.HumanoidStateType.Landed then
     wait(0.05) -- Intervalo curto para Bunnyhop rￃﾡpido e preciso
     humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
   end)
  end

  -- Inicializa o GUI e Bunnyhop
  createGUI()
  setupBunnyhop()

  -- Reconecta o GUI e o Bunnyhop ao renascer
  player.CharacterAdded:Connect(function(newCharacter)
   character = newCharacter
   humanoid = character:WaitForChild("Humanoid")
   createGUI()  -- Garante que o GUI seja recriado apￃﾳs renascer
   setupBunnyhop() -- Configura o Bunnyhop novamente para o novo personagem
  end)
 end,
	DoubleClick = false,

	Tooltip = "Loads Auto Bhop",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})


local MyButton = RightGroupBox:AddButton({
	Text = "Grind Spot",
	Func = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-427, 84, -1021)
		Library:Notify("Teleported to the grind spot.", 5)
	end,
	DoubleClick = false,

	Tooltip = "Teleport to the grind spot",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})
local MyButton = RightGroupBox:AddButton({
	Text = "OOB Grind Spot",
	Func = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-78, 245, -954)
  workspace.nn_russia.bounds:GetChildren()[1].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[2].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[3].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[4].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[5].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[6].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[7].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[8].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[9].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[10].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[11].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[12].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[13].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[14].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[15].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[16].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[17].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[18].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[19].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[20].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[21].Transparency = 0.7
  workspace.nn_russia.bounds:GetChildren()[22].Transparency = 0.7
  Library:Notify("Teleported to the OOB Grind Spot.", 5)
	end,
	DoubleClick = false,

	Tooltip = "Teleport to the OOB grind spot",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})
local MyButton = RightGroupBox:AddButton({
	Text = "Safe Spot",
	Func = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-470, 20, -1116)
		Library:Notify("Teleported to the SafeZone Secret Shop", 5)
	end,
	DoubleClick = false,

	Tooltip = "Teleport to the safe spot",
	DisabledTooltip = "I am disabled!",

	Disabled = false, -- Will disable the button (true / false)
	Visible = true, -- Will make the button invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)
})

RightGroupBox:AddToggle("MyToggle", {
	Text = "[TEST](Semi)Auto Farm]",
	Tooltip = "mrow!", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
if not auto then
	Library:Notify("Semi Auto Farm has been enabled", 5)
    auto = true
else
	Library:Notify("Semi Auto Farm has been disabled", 5)
    auto = false
end

  end,
})
Right2GroupBox:AddLabel("Close Call bind"):AddKeyPicker("KeyPicker", {
	-- SyncToggleState only works with toggles.
	-- It allows you to make a keybind which has its state synced with its parent toggle

	-- Example: Keybind which you use to toggle flyhack, etc.
	-- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

	Default = "X", -- String as the name of the keybind (MB1, MB2 for mouse buttons)
	SyncToggleState = true,

	-- You can define custom Modes but I have never had a use for it.
	Mode = "Toggle", -- Modes: Always, Toggle, Hold

	Text = "Close Call attempt", -- Text to display in the keybind menu
	NoUI = false, -- Set to true if you want to hide from the Keybind menu,

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)
	Library:Notify("Tried to do a close call.", 5)
		local botsFolder = workspace.bots.nn_russia
        local bots = botsFolder:GetChildren()
        if #bots == 0 then return end

        local randomBot = bots[math.random(1, #bots)]
        local targetPart = randomBot:FindFirstChild("HumanoidRootPart")
        if not targetPart then return end

        local player = game.Players.LocalPlayer
        local oldpos = player.Character.HumanoidRootPart.CFrame
        game:GetService("ReplicatedStorage").events.player.char.respawnchar:FireServer()
        task.wait(0.5)

        for i = 1, 70 do
            player.Character.HumanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 0, 0)
            task.wait(0)
        end
        player.Character.HumanoidRootPart.CFrame = oldpos * CFrame.new(0, 8, 0)

    end,
	-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
	ChangedCallback = function(New)
		print("[cb] Keybind changed!", New)
	end,
})


Right2GroupBox:AddToggle("MyToggle", {
	Text = "Bash Door",
	Tooltip = "Bashing door for points", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
  if not doorRussia then
	Library:Notify("Started a bash door farm.", 5)
   doorRussia = true
  else
  Library:Notify("Disabled a bash door farm.", 5)
   doorRussia = false
  end
  
  end,
})

LeftGroupBox:AddToggle("MyToggle", {
	Text = "Punches Stat Farm",
	Tooltip = "20 punches per second", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
  if not punch then
	Library:Notify("Punch Farm has been enabled", 5)
   punch = true
  else
    Library:Notify("Punch Farm has been disabled", 5)
   punch = false
  end
  end,
})



LeftGroupBox:AddToggle("MyToggle", {
	Text = "Event Spam [Bloodmoon]",
	Tooltip = "Attempts to buy in-game event", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
  if not blood then
	Library:Notify("Enabled", 5)
   blood = true
  else
  Library:Notify("Disabled", 5)
   blood = false
  end
  end,
})

LeftGroupBox:AddToggle("MyToggle", {
	Text = "Event Spam [Blackout]",
	Tooltip = "Attempts to buy in-game event", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
  if not blout then
	Library:Notify("Enabled", 5)
   blout = true
  else
  Library:Notify("Disabled", 5)
  blout = false
  end
  end,
})

LeftGroupBox:AddToggle("MyToggle", {
	Text = "Event Spam [Outbreak]",
	Tooltip = "Attempts to buy in-game event", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
  if not outbreak then
	Library:Notify("Enabled", 5)
   outbreak = true
  else
  Library:Notify("Disabled", 5)
   outbreak = false
  end
  end,
})

Toggles.MyToggle:OnChanged(function()
	-- here we get our toggle object & then get its value
	print("Toggle changed to:", Toggles.MyToggle.Value)
end)


-- Long text label to demonstrate UI scrolling behaviour.
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox("Blah Blah")
LeftGroupBox2:AddLabel(
	"Made by [ANON] & Bulletproof\nwith love \n\n\nMost features are made for Open World gamemode. I'm not supporting Arcade gamemode, sorry!",
	true
)

local TabBox = Tabs.Main:AddRightTabbox() -- Add Tabbox on right side



Library:OnUnload(function()
	print("Unloaded!")
end)



-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu


ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)


SaveManager:IgnoreThemeSettings()


SaveManager:SetIgnoreIndexes({ "MenuKeybind" })


ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place") -- if the game has multiple places inside of it (for example: DOORS)

SaveManager:BuildConfigSection(Tabs["UI Settings"])


ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 0;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark((' %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);
SaveManager:LoadAutoloadConfig()

RunService.RenderStepped:Connect(function()
 if punch then
 local punch
  game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("player"):WaitForChild("local"):WaitForChild("punch"):FireServer()
 else
  --no
 end
 if blood then
 local blood
  local args = {[1] = "bloodmoon"}
  game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("game"):WaitForChild("global"):WaitForChild("purchase"):FireServer(unpack(args))
 else
  --no
 end
 if blout then
 local blout
  local args = {[1] = "blackout"}
  game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("game"):WaitForChild("global"):WaitForChild("purchase"):FireServer(unpack(args))
 else
  --no
 end
 if outbreak then
 local outbreak
  local args = {[1] = "outbreak"}
  game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("game"):WaitForChild("global"):WaitForChild("purchase"):FireServer(unpack(args))
 else
  --no
 end

 if doorRussia then
 local doorRussia
  local ohInstance1 = workspace.nn_russia.doors.interactable_door
  game:GetService("ReplicatedStorage").events.player.char.bashdoor:InvokeServer(ohInstance1, true)
  game.Players.LocalPlayer.Character.HumanoidRootPart.breakdoor.Volume = 0
 else
  --no
 end
 if doorMall then
 local doorMall
  local ohInstance1 = workspace.nn_mall.doors.interactable_door
  game:GetService("ReplicatedStorage").events.player.char.bashdoor:InvokeServer(ohInstance1, true)
  game.Players.LocalPlayer.Character.HumanoidRootPart.breakdoor.Volume = 0
 else
  --no
 end
if auto then
	local auto
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-470, 240, -1116)
    task.wait(0.01)
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-470, 240, -1116)
    task.wait(0.01)
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-270, 240, -1116)
    task.wait(0.01)
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-370, 240, -916)
    task.wait(0.01)
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-70, 240, -1116)
else
end
 punchesyay.Text = "punches:".. game:GetService("Players").LocalPlayer.stats.punches.Value
 TimerEvent.Text = "Event Cooldown:".. game:GetService("ReplicatedStorage").values.events.eventCoolDown.Value
 task.wait(0)
end)