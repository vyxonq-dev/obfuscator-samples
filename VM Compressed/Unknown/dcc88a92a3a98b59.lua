 --[[
Loading Variables
]]--



--[[ File Checks ]]--
function CreateFolder(f)
if not isfolder(f) then makefolder(f) repeat task.wait() until isfolder(f) end
end
function CreateFile(f,d)
if not isfile(f) then writefile(f,d) repeat task.wait() until isfile(f) end
end
CreateFolder("NexerHub")
CreateFolder("NexerHub/Core")
CreateFolder("NexerHub/DieOfDeath")
CreateFolder("NexerHub/DieOfDeath/Assets")
CreateFolder("NexerHub/DieOfDeath/Assets/LMS")
CreateFolder("NexerHub/DieOfDeath/Assets/Chases")
CreateFile("NexerHub/DieOfDeath/Assets/LMS/data.luau", "return {}")
CreateFile("NexerHub/DieOfDeath/Assets/Chases/data.luau", "return {}")
local GUID = tostring(game:GetService("HttpService"):GenerateGUID())
CreateFile("NexerHub/Core/PreloadData.luau", [[return {
    ["LoadConfig"] = true,
    ["GUID"] = "]]..GUID..[[",
    ["CoreVersion"] = 1,
    ["LoadAssets"] = true
}]])
pcall(function()
local a = loadstring(readfile("NexerHub/Core/PreloadData.luau"))()
if a and a.GUID~=nil then
GUID = a.GUID
end
end)
local WhitelistedGUIDS = {
    "{4c50eba2-d2ed-4d79-bec1-02a967f49c58}",
    "{00000000-0000-0000-0000-000000000000}"
}



--[[ Global Variables ]]--
_G.dod_developer_key = "Nexer" -- my name yaa
_G.dod_name = "Die Of Death" -- name of the game that we will surely need
_G.API_last_update = "1/1/2026" -- last time update (dd/mm/yyyy)
_G.dod_repository = "https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/DOD/Main.luau" -- input repository for savings
_G.global_module_main = "https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/Global-Module.luau"
_G.global_module_backup = "https://pastebin.com/raw/0yUmgPTd"
_G.HasPremium = false -- don't change
_G.HasGameBreakingFeaturesAccess = false -- don't change
_G.GlobalStartupFunctions = {} -- don't change
_G.PremiumKeyAccess = "cheeseburger" -- key
--[[ premium gamepasses:
https://www.roblox.com/game-pass/1597133271 - game breaking exploits
https://www.roblox.com/game-pass/1264479709 - premium ]]--
task.spawn(function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId,1264479709) then
_G.HasPremium = true
end
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId,1597133271) then
_G.HasGameBreakingFeaturesAccess = true
end
for i,v in next, WhitelistedGUIDS do
if v == GUID then
_G.HasPremium = true
_G.HasGameBreakingFeaturesAccess = true
end
end
end)



--[[ Local Variables ]]--
local Module = nil
local LocalPlayer, LP = game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer
local Character, Char = nil, nil
local HumanoidRootPart, HRP = nil, nil
local Humanoid, Hum = nil, nil
pcall(function()
Character, Char = LocalPlayer.Character, LocalPlayer.Character
end)
pcall(function()
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
end)
pcall(function()
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)
LocalPlayer.CharacterAdded:Connect(function(char)
pcall(function()
Character, Char = nil, nil
HumanoidRootPart, HRP = nil, nil
Humanoid, Hum = nil, nil
task.wait()
Character, Char = char, char
repeat task.wait() until char:FindFirstChild("HumanoidRootPart")
HumanoidRootPart, HRP = char.HumanoidRootPart, char.HumanoidRootPart
repeat task.wait() until Character:FindFirstChild("Humanoid")
Humanoid, Hum = char.Humanoid, char.Humanoid
end)
end)
Instance.new("Folder",game:GetService("CoreGui")).Name = "DOD_Assets"



--[[ Startup Functions ]]--
local CreateMessage = function(a) local instancename = (a=="Message" and a) or "Hint"; local msg = Instance.new(instancename,game:GetService("CoreGui")); msg.Text = ""; return msg end
local Execute = function(f, ...) return function(f, ...) return task.spawn(f, ...) end end
local HaveWorkspaceAccess = function() if isfile and writefile and readfile and isfolder and makefolder and (getcustomasset or get_custom_asset) then return true end return false end
local CreateFile = function(f,c) writefile(f,c) end
local IsFile = function(f) return isfile(f) end
local GetFile = function(f,m) local gca = (getcustomasset or get_custom_asset); return ((m=="gca" and (gca(f))) or readfile(f)) end
local InsertElement = function(tf, element) local temp_table = loadstring(tostring(GetFile(tf,"rf")))(); table.insert(temp_table,element); CreateFile(tf, Module:ConvertToTable(temp_table)) end
local RemoveElement = function(tf, element) local temp_table = loadstring(tostring(GetFile(tf,"rf")))(); for i,v in pairs(temp_table) do if v == element then temp_table[i]=nil end end; CreateFile(tf, Module:ConvertToTable(temp_table)) end
--local InsertElement_test = function(tf, element) local temp_table = loadstring(tostring(GetFile(tf,"rf")))(); temp_table[element] = value; CreateFile(tf, Module:ConvertToTable(temp_table)) end



--[[ Additional Connections Handler ]]--
local rs = game:GetService("RunService")
local Heartbeat = {}
rs.Heartbeat:Connect(function()
for i,v in next, Heartbeat do
if v~=nil then
task.spawn(v)
end
end
end)
local RenderStepped = {}
rs.RenderStepped:Connect(function()
for i,v in next, RenderStepped do
if v~=nil then
task.spawn(v)
end
end
end)
local PostSimulation = {}
rs.PostSimulation:Connect(function()
for i,v in next, PostSimulation do
if v~=nil then
task.spawn(v)
end
end
end)
local TaskTick = {}
task.spawn(function()
while task.wait() do
for i,v in next, TaskTick do
if v~=nil then
task.spawn(v)
end
end
end
end)
--upconnections: stepped, renderstepped, postsimulation, while task


--[[ Loading All Modules ]]--
-- upvalues: StaminaModule, AbilityModule, UIModule, AnimationsModule
pcall(function()
if (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "xeno") or string.find(identifyexecutor(), "XENO")) or (string.find(identifyexecutor(), "Solara") or string.find(identifyexecutor(), "solara") or string.find(identifyexecutor(), "SOLARA")) or not Module.RequestModule then
StaminaModule = {}
StaminaModule.Stamina = 100
else
StaminaModule = Module:RequestModule(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Movement"))
end
end)
pcall(function()
local temp_module = [[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")

local Events = ReplicatedStorage:WaitForChild("Events")
local ClientModules = ReplicatedStorage:WaitForChild("ClientModules")

local LocalPlayer = Players.LocalPlayer
local script = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Ability")
local PlayerGui = LocalPlayer.PlayerGui

local RoundUI = PlayerGui.MainGui.RoundUI
local AbilitiesFolder = PlayerGui.MainGui.Abilities.Folder

local AbilitySystem = {
    Input1 = "Q",
    Input2 = "E", 
    Input3 = "R",
    Input4 = "T",
    Input5 = "M1",
    PreferredInput = UserInputService.PreferredInput
}

-- Store cooldown status per ability
local abilityCooldowns = {}

function AbilitySystem.CreateAbility(AbilityData)
    if AbilitiesFolder:FindFirstChild(AbilityData.Name) then AbilitiesFolder:FindFirstChild(AbilityData.Name):Destroy() task.wait() end
    
    local AbilityButton = script.AbilityTemplate:Clone()

    local InputKey = AbilitySystem[AbilityData.InputShown] or AbilityData.InputShown
    
    AbilityButton.Parent = AbilitiesFolder
    AbilityButton.Name = AbilityData.Name
    AbilityButton.Input.Text = InputKey
    AbilityButton.Title.Text = AbilityData.DisplayName
    
    AbilityButton.Cooldown.Visible = false
    AbilityButton.CooldownLabel.Visible = false
    PlayerGui.MainGui.Abilities.Tip.Visible = false
    
    AbilityButton.MouseEnter:Connect(function()
        PlayerGui.MainGui.Abilities.Tip.Label.Text = "<font color='rgb(137, 255, 26)'>Usage:</font> <font color='rgb(255, 255, 255)'>" .. (AbilityData.Tip or "No tips for this ability.") .. "</font>"
        PlayerGui.MainGui.Abilities.Tip.Visible = true
    end)
    
    AbilityButton.MouseLeave:Connect(function()
        PlayerGui.MainGui.Abilities.Tip.Visible = false
    end)
    
    if AbilityData.Icon then
        AbilityButton.Icon.Image = AbilityData.Icon
    end
    
    AbilityButton.Activated:Connect(function()
        AbilitySystem.UseAbility(AbilityData, AbilityButton)
    end)

	if not AbilityData.InputShown then return end
	task.spawn(function()
	AbilitySystem:Bind(AbilityData, AbilityButton)
	end)
	
end

function AbilitySystem:Bind(AbilityData, AbilityButton)
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        local triggerFound = false
        if AbilityData.InputShown == "M1" and input.UserInputType == Enum.UserInputType.MouseButton1 then
            triggerFound = true
        elseif input.KeyCode == Enum.KeyCode[AbilityData.InputShown] then
            triggerFound = true
        end
        if triggerFound and AbilityButton.Parent then
            task.spawn(function() AbilitySystem.UseAbility(AbilityData, AbilityButton) end)
        end
    end)
    AbilityButton.AncestryChanged:Connect(function()
        if not AbilityButton.Parent then
            connection:Disconnect()
        end
    end)
end

function AbilitySystem.AbilityTween(AbilityButton)
    TweenService:Create(AbilityButton, TweenInfo.new(0.2), {Size = UDim2.new(0.9, 0, 0.9, 0)}):Play()
    
    if AbilityButton:FindFirstChild("UseEffect") then
        AbilityButton.UseEffect.Visible = true
        AbilityButton.UseEffect.BackgroundTransparency = 0.5
        TweenService:Create(AbilityButton.UseEffect, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    end
    
    task.wait(0.2)
    TweenService:Create(AbilityButton, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 1, 0)}):Play()
end

function AbilitySystem.PutOnCooldown(AbilityButton, CooldownTime)
    task.spawn(function()
    if AbilityButton.Cooldown.Visible then return end
    
    AbilityButton.Input.Visible = false
    AbilityButton.InputImage.Visible = false
    AbilityButton.Cooldown.Visible = true
    AbilityButton.CooldownLabel.Visible = true
    AbilityButton.Icon.ImageColor3 = Color3.fromRGB(90, 90, 90)
    
    local TotalSteps = CooldownTime * 10
    
    for Step = math.round(TotalSteps), 0, -1 do
        if not AbilityButton.Parent then break end
        
        AbilityButton.Cooldown.Size = UDim2.new(1, 0, Step / math.round(TotalSteps), 0)
        AbilityButton.CooldownLabel.Text = math.round(CooldownTime) .. "s"
        
        task.wait(0.1)
        CooldownTime = string.format("%.1f", CooldownTime - 0.1)
    end
    
    if AbilityButton.Parent then
        AbilitySystem.AbilityTween(AbilityButton)
        AbilityButton.Input.Visible = true
        AbilityButton.InputImage.Visible = true
        AbilityButton.Cooldown.Visible = false
        AbilityButton.CooldownLabel.Visible = false
        AbilityButton.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end
    end)
end

function AbilitySystem.UseAbility(AbilityData, AbilityButton)
    if AbilityButton.Cooldown.Visible then return end
	task.spawn(AbilitySystem.AbilityTween, AbilityButton)
	AbilitySystem.PutOnCooldown(AbilityButton, Cooldown or AbilityData.Cooldown)
    local Success, Cooldown = Events.RemoteFunctions.UseAbility:InvokeServer(AbilityData.Name)
    if Success or AbilityData.Client == true then
        if AbilityData.Client == true then
            Cooldown = AbilityData.Cooldown
        end
        if Success ~= "MultipleUse" then
            if AbilityData.Client == true then
                AbilityData.ClientFunction()
            end
        end
    end
    return Success
end
return AbilitySystem]]
AbilityModule = loadstring(temp_module)()
end)
pcall(function()
if (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "xeno") or string.find(identifyexecutor(), "XENO")) or (string.find(identifyexecutor(), "Solara") or string.find(identifyexecutor(), "solara") or string.find(identifyexecutor(), "SOLARA")) or not Module.RequestModule then
UIModule = {}
UIModule.AbilitySelection = function(...) Rayfield:Notification("Error!", "Couldn't use function ''AbilitySelection'', missing function ''require'' or ''decompile''!", 5, false) return end
UIModule.OpenShop = function(...) Rayfield:Notification("Error!", "Couldn't use function ''OpenShop'', missing function ''require'' or ''decompile''!", 5, false) return end
UIModule.TeamateDeathEffect = function(...) Rayfield:Notification("Error!", "Couldn't use function ''TeamateDeathEffect'', missing function ''require'' or ''decompile''!", 5, false) return end
else
UIModule = Module:RequestModule(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"))
end
end)
pcall(function()
AnimationsModule = [[task.spawn(function()
pcall(function()
local stopper = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local RunService = game:GetService("RunService")

-- Animation control system
local AnimationController = {}
AnimationController.Enabled = true
AnimationController.ActiveAnimations = {}
AnimationController.CharacterConnections = {}
AnimationController.CharacterAnimators = {}
AnimationController.LoadedTracks = {}

-- Initialize workspace attribute if not exists
if workspace:GetAttribute("AnimationsEnabled") == nil then
	workspace:SetAttribute("AnimationsEnabled", true)
end
-- and also init this anim desync lolz
if workspace:GetAttribute("AnimDesyncEnabled") == nil then
	workspace:SetAttribute("AnimDesyncEnabled", false)
end
if workspace:GetAttribute("AnimDesync") == nil then
	workspace:SetAttribute("AnimDesync", 1)
end


-- Listen for attribute changes
workspace:GetAttributeChangedSignal("AnimationsEnabled"):Connect(function()
	AnimationController.Enabled = workspace:GetAttribute("AnimationsEnabled")
	if not AnimationController.Enabled then
		AnimationController:UnloadAllAnimations()
	else
		-- Reload animations for all valid characters
		for character, _ in pairs(AnimationController.CharacterAnimators) do
			if character and character.Parent and character:IsDescendantOf(workspace) then
				if character:FindFirstChild("Humanoid") and character:FindFirstChild("Animations") then
					task.spawn(function()
						AnimationController:LoadCharacterAnimations(character)
					end)
				end
			else
				-- Clean up invalid characters
				AnimationController.CharacterAnimators[character] = nil
			end
		end
	end
end)

function AnimationController:UnloadAllAnimations()
	-- Stop and remove all animation tracks
	for character, tracks in pairs(self.LoadedTracks) do
		for trackName, track in pairs(tracks) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
	end
	self.LoadedTracks = {}
	
	-- Stop active animations
	self:StopAllAnimations()
end

function AnimationController:StopAllAnimations()
	for character, animations in pairs(self.ActiveAnimations) do
		for animName, track in pairs(animations) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
	end
	self.ActiveAnimations = {}
end

function AnimationController:CleanupCharacter(character)
	-- Clean up loaded tracks
	if self.LoadedTracks[character] then
		for trackName, track in pairs(self.LoadedTracks[character]) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
		self.LoadedTracks[character] = nil
	end
	
	-- Clean up active animations
	if self.ActiveAnimations[character] then
		for animName, track in pairs(self.ActiveAnimations[character]) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
		self.ActiveAnimations[character] = nil
	end

	-- Clean up connections
	if self.CharacterConnections[character] then
		for _, connection in ipairs(self.CharacterConnections[character]) do
			connection:Disconnect()
		end
		self.CharacterConnections[character] = nil
	end

	self.CharacterAnimators[character] = nil
end

function AnimationController:LoadAnimationTrack(character, animationName, animationId)
	if not self.Enabled then return nil end
	if not character or not character.Parent then return nil end
	
	local humanoid, renderHumanoid = self:GetHumanoid(character)
	local actualHumanoid = renderHumanoid or humanoid
	if not actualHumanoid then return nil end

	local animator = actualHumanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = actualHumanoid
	end

	-- Create animation instance
	local animation = Instance.new("Animation")
	animation.AnimationId = animationId
	
	-- Load animation track
	local track = animator:LoadAnimation(animation)
	
	-- Store in loaded tracks
	if not self.LoadedTracks[character] then
		self.LoadedTracks[character] = {}
	end
	self.LoadedTracks[character][animationName] = track
	
	return track
end

function AnimationController:GetHumanoid(character)
	if not self.Enabled then return nil end

	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	local renderHumanoid = nil
	if character:GetAttribute("MROB") and RunService:IsClient() then
		pcall(function()
			local renderUI = character:FindFirstChild("RenderUIPath")
			if renderUI and renderUI.Value then
				local viewport = renderUI.Value
				if viewport then
					renderHumanoid = viewport.ViewportFrame.WorldModel.RenderModel:FindFirstChildWhichIsA("Humanoid")
				end
			end
		end)
	end
	return humanoid, renderHumanoid
end

function AnimationController:LoadCharacterAnimations(character)
	if not self.Enabled then return end
	if not character or not character.Parent then return end
	if not character:FindFirstChild("Humanoid") then return end
	if not character:FindFirstChild("Animations") then return end

	local animationsFolder = character:FindFirstChild("Animations")
	if not animationsFolder then return end

	-- Clean up existing animations for this character
	self:CleanupCharacter(character)

	-- Load all animations from the folder
	local loadedTracks = {}
	
	for _, animationObject in ipairs(animationsFolder:GetChildren()) do
		if animationObject:IsA("Animation") then
			local track = self:LoadAnimationTrack(character, animationObject.Name, animationObject.AnimationId)
			if track then
				loadedTracks[animationObject.Name] = track
			end
		end
	end

	-- Store animator reference
	local humanoid, renderHumanoid = self:GetHumanoid(character)
	local actualHumanoid = renderHumanoid or humanoid
	if actualHumanoid then
		local animator = actualHumanoid:FindFirstChildOfClass("Animator")
		if animator then
			self.CharacterAnimators[character] = animator
		end
	end

	-- Start animation system if we have the required animations
	if loadedTracks["Idle"] then
		self:StartCharacterAnimationSystem(character, loadedTracks)
	end
end

function AnimationController:StartCharacterAnimationSystem(character, loadedTracks)
	if not self.Enabled then return end
	if not character or not character.Parent then return end
	if not character:FindFirstChild("HumanoidRootPart") then return end

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid, renderHumanoid = self:GetHumanoid(character)
	local actualHumanoid = renderHumanoid or humanoid
	if not actualHumanoid then return end

	local animations = character:FindFirstChild("Animations")
	if not animations then return end

	local player = Players:GetPlayerFromCharacter(character)
	if player and player ~= Players.LocalPlayer then return end

	local transitionSpeed = animations:GetAttribute("TransitionSpeed") or 0.25

	-- Start with idle animation
	if loadedTracks["Idle"] then
		loadedTracks["Idle"]:Play()
		self:AddActiveAnimation(character, "Idle", loadedTracks["Idle"])
	end

	-- Play passive animation if exists
	if loadedTracks["PassiveAnimation"] then
		loadedTracks["PassiveAnimation"]:Play()
		self:AddActiveAnimation(character, "PassiveAnimation", loadedTracks["PassiveAnimation"])
	end

	-- Jump animation handling
	if loadedTracks["Jump"] then
		local stateConnection = actualHumanoid.StateChanged:Connect(function(oldState, newState)
			if not self.Enabled then return end
			if not character or not character.Parent then return end
			
			-- Jump and fall handling
			if newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Freefall then
				loadedTracks["Jump"]:Play(0)
				self:AddActiveAnimation(character, "Jump", loadedTracks["Jump"])
				if ReplicatedStorage:FindFirstChild("Sounds") and ReplicatedStorage.Sounds:FindFirstChild("SFX") then if character.PrimaryPart:FindFirstChild("Jump") then return end local jumpSound = ReplicatedStorage.Sounds.SFX.Jump:Clone() jumpSound.Parent = character.PrimaryPart jumpSound:Play() jumpSound.Ended:Once(function() jumpSound:Destroy() end) end
			else
				loadedTracks["Jump"]:Stop(0.2)
				self:RemoveActiveAnimation(character, "Jump")
			end
		end)
		
		-- Store connection for cleanup
		if not self.CharacterConnections[character] then
			self.CharacterConnections[character] = {}
		end
		table.insert(self.CharacterConnections[character], stateConnection)
	end

	-- Movement animations with speed attributes (from original script)
	if loadedTracks["Walk"] then
		local walkAnim = loadedTracks["Walk"]
		local sprintAnim = loadedTracks["Sprint"]
		
		if loadedTracks["Idle"] then
			loadedTracks["Idle"].Priority = Enum.AnimationPriority.Core
		end
		walkAnim.Priority = Enum.AnimationPriority.Idle
		if sprintAnim then
			sprintAnim.Priority = Enum.AnimationPriority.Movement
		end

		-- Get speed attributes from character (like original script)
		local baseWalkSpeed = (character:GetAttribute("WalkSpeed") or 6) + (character:GetAttribute("WalkSpeedModifier") or 0)
		local baseSprintSpeed = (character:GetAttribute("SprintSpeed") or 23) + (character:GetAttribute("WalkSpeedModifier") or 0)
		
		-- Adjust animation speeds based on current walk speed (like original script)
		local function adjustAnimationSpeeds()
			if not self.Enabled then return end
			if not character or not character.Parent then return end
			
			local currentWalkSpeed = actualHumanoid.WalkSpeed
			local walkSpeedRatio = currentWalkSpeed / (character:GetAttribute("WalkSpeed") or 6)
			local sprintSpeedRatio = currentWalkSpeed / (character:GetAttribute("SprintSpeed") or 23)
			
			walkAnim:AdjustSpeed(walkSpeedRatio < 0 and 0.1 or walkSpeedRatio)
			if sprintAnim then
				sprintAnim:AdjustSpeed(sprintSpeedRatio < 0 and 0.1 or sprintSpeedRatio)
			end
		end

		-- Connect to WalkSpeed changes (like original script)
		local speedConnection = actualHumanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(adjustAnimationSpeeds)
		if not self.CharacterConnections[character] then
			self.CharacterConnections[character] = {}
		end
		table.insert(self.CharacterConnections[character], speedConnection)

		-- Initial speed adjustment
		adjustAnimationSpeeds()

		local function updateMovement(speed)
			if not self.Enabled then return end
			if not character or not character.Parent then return end
			if not humanoidRootPart or not actualHumanoid then return end

			if speed >= 0.25 and not humanoidRootPart.Anchored then
				-- Use speed thresholds from attributes (like original script)
				if sprintAnim and speed >= (baseSprintSpeed - baseWalkSpeed) then
					if not sprintAnim.IsPlaying then 
						sprintAnim:Play(transitionSpeed) 
						self:AddActiveAnimation(character, "Sprint", sprintAnim)
					end
					walkAnim:Stop(transitionSpeed)
					self:RemoveActiveAnimation(character, "Walk")
					if loadedTracks["Idle"] then
						loadedTracks["Idle"]:Stop(transitionSpeed)
					end
				else
					if not walkAnim.IsPlaying then 
						walkAnim:Play(transitionSpeed) 
						self:AddActiveAnimation(character, "Walk", walkAnim)
					end
					if sprintAnim then 
						sprintAnim:Stop(transitionSpeed) 
						self:RemoveActiveAnimation(character, "Sprint")
					end
					if loadedTracks["Idle"] then
						loadedTracks["Idle"]:Stop(transitionSpeed)
					end
				end
			else
				if loadedTracks["Idle"] and not loadedTracks["Idle"].IsPlaying then 
					loadedTracks["Idle"]:Play(transitionSpeed) 
					self:AddActiveAnimation(character, "Idle", loadedTracks["Idle"])
				end
				walkAnim:Stop(transitionSpeed)
				self:RemoveActiveAnimation(character, "Walk")
				if sprintAnim then 
					sprintAnim:Stop(transitionSpeed) 
					self:RemoveActiveAnimation(character, "Sprint")
				end
			end
		end

		local runningConnection = actualHumanoid.Running:Connect(updateMovement)
		
		-- Store connection for cleanup
		if not self.CharacterConnections[character] then
			self.CharacterConnections[character] = {}
		end
		table.insert(self.CharacterConnections[character], runningConnection)
	end
end

function AnimationController:AddActiveAnimation(character, animationName, track)
	if not self.ActiveAnimations[character] then
		self.ActiveAnimations[character] = {}
	end
	self.ActiveAnimations[character][animationName] = track
end

function AnimationController:RemoveActiveAnimation(character, animationName)
	if self.ActiveAnimations[character] then
		self.ActiveAnimations[character][animationName] = nil
	end
end

-- Remote event handlers
Events.RemoteEvents.PlayAnimation.OnClientEvent:Connect(function(animation, character, delay)
	if not AnimationController.Enabled then return end
	if not character or not character.Parent then return end
	if workspace:GetAttribute("AnimDesyncEnabled") == true then task.wait(workspace:GetAttribute("AnimDesync")) end

	if character and (not Players:GetPlayerFromCharacter(character) or Players:GetPlayerFromCharacter(character) == Players.LocalPlayer) then
		local humanoid = AnimationController:GetHumanoid(character)
		if not humanoid then return end

		local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
		for _, track in animator:GetPlayingAnimationTracks() do
			if track.Name == animation.Name then
				track:Play()
				return
			end
		end
		animator:LoadAnimation(animation):Play(delay or 0.1)
	end
end)

Events.RemoteEvents.StopAnimation.OnClientEvent:Connect(function(animation, character)
	if not character or not character.Parent then return end
	if workspace:GetAttribute("AnimDesyncEnabled") == true then task.wait(workspace:GetAttribute("AnimDesync")) end

	local humanoid = AnimationController:GetHumanoid(character)
	if not humanoid then return end

	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
	for _, track in animator:GetPlayingAnimationTracks() do
		if track.Name == animation.Name then
			track:Stop()
			return
		end
	end
end)

function AnimationController:SetupDefaultCharacter(character)
	if not self.Enabled then return end
	if not character or not character.Parent then return end
	if not character:FindFirstChild("Humanoid") then return end

	local civilian = ReplicatedStorage:FindFirstChild("Characters") and 
					ReplicatedStorage.Characters.Survivor:FindFirstChild("Civilian")
	local defaultAnimations = civilian and civilian:FindFirstChild("Animations")

	if defaultAnimations then
		-- Remove existing animations folder
		local existingAnimations = character:FindFirstChild("Animations")
		if existingAnimations then
			existingAnimations:Destroy()
		end

		-- Clone new animations
		local newAnimations = defaultAnimations:Clone()
		newAnimations.Parent = character

		if character:FindFirstChild("HumanoidRootPart") then
			character.PrimaryPart = character:WaitForChild("HumanoidRootPart")
		end

		-- Load animations from the new folder
		self:LoadCharacterAnimations(character)
		character:SetAttribute("WalkSpeed", 10)
		character:SetAttribute("SprintSpeed", 26)
	end
end

-- Update initial state
AnimationController.Enabled = workspace:GetAttribute("AnimationsEnabled")

-- Player character handling
local localPlayer = Players.LocalPlayer

localPlayer.CharacterAdded:Connect(function(character)
	task.wait(1)
	if AnimationController.Enabled then
		if character:FindFirstChild("Animations") then
			AnimationController:LoadCharacterAnimations(character)
		else
			AnimationController:SetupDefaultCharacter(character)
		end
	end
end)

localPlayer.CharacterRemoving:Connect(function(character)
	AnimationController:CleanupCharacter(character)
end)

task.spawn(function()
	if AnimationController.Enabled and localPlayer.Character then
		AnimationController:SetupDefaultCharacter(localPlayer.Character)
	end
end)

-- NPC handling
local teamsFolder = workspace:WaitForChild("GameAssets"):WaitForChild("Teams")
local otherTeam = teamsFolder:WaitForChild("Other")

otherTeam.ChildAdded:Connect(function(npc)
	if not AnimationController.Enabled then return end
	if not npc:FindFirstChild("Humanoid") then return end
	if not npc:FindFirstChild("Animations") then return end

	local humanoid = npc:FindFirstChild("Humanoid")
	if humanoid then
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
		AnimationController:LoadCharacterAnimations(npc)
	end
end)

-- Clean up when NPCs are removed
otherTeam.ChildRemoved:Connect(function(npc)
	AnimationController:CleanupCharacter(npc)
end)


-- Periodic cleanup of invalid characters
game:GetService("RunService").Heartbeat:Connect(function()
	for character, _ in pairs(AnimationController.CharacterAnimators) do
		if not character or not character.Parent or not character:IsDescendantOf(workspace) then
			AnimationController:CleanupCharacter(character)
		end
	end
end)]]
if workspace:GetAttribute("AnimationsEnabled") == nil and LocalPlayer.PlayerScripts:FindFirstChild("ClientAnimations") then
LocalPlayer.PlayerScripts.ClientAnimations:Destroy()
task.wait()
loadstring(AnimationsModule)()
end
end)


--[[ Loading my module ]]--
local msg = CreateMessage()
msg.Text = "Loading API Module... (0/1)"
local loadmoduleattempt = 0
local tryingmodule = 0
repeat task.wait()
local lodsuc, loderr = pcall(function()
if tryingmodule == 0 then
Module = loadstring(game:HttpGet(_G.global_module_main))()
else
Module = loadstring(game:HttpGet(_G.global_module_backup))()
end
end)
if not lodsuc then
if tryingmodule == 0 then tryingmodule = 1 else tryingmodule = 0 end
loadmoduleattempt += 1
warn(loderr)
msg.Text = "Failed loading API Module, re-trying... ( Attempt "..tostring(loadmoduleattempt).." )"
task.wait(1)
elseif lodsuc and Module.IsWorking ~= nil then
msg.Text = "Loading API Module... (1/1)"
task.wait(1)
else
if tryingmodule == 0 then tryingmodule = 1 else tryingmodule = 0 end
loadmoduleattempt += 1
warn("error not defined")
msg.Text = "Failed loading API Module, re-trying... ( Attempt "..tostring(loadmoduleattempt).." )"
task.wait(1)
end
until msg.Text == "Loading API Module... (1/1)"
task.wait(1)
msg.Text = "Launching Rayfield..."
--[[ Loading rayfield here ]] --
local Rayfield = Module:GetWorkingRayfield()
task.delay(2,function()
msg:Destroy()
end)



--[[ Re-writing global variables ( btw i am writing this to myself, don't mind those comments i do ) ]]--
_G.dod_developer_key = ""..((_G.dod_developer_key ~= nil and _G.dod_developer_key) or "Unknown")..""
_G.dod_name = ""..((_G.dod_name ~= nil and _G.dod_name) or "Unknown")..""



--[[ Creating Window ]]--
local Window = Rayfield:CreateWindow({
   Name = "".._G.dod_developer_key.." Hub : ".._G.dod_name.."",
   Icon = 0,    
   LoadingTitle = ""..string.sub(_G.dod_developer_key,1,1).."H:".._G.dod_name:gsub("(%S)%S+","%1"):gsub("%s+","").."",
   LoadingSubtitle = "By ".._G.dod_developer_key.."",
   ShowText = "".._G.dod_developer_key.." Hub",
   Theme = "Amethyst",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})



--[[ Announcements ]] --
pcall(function()
local Announcements = Window:CreateTab("Announce",0)
Announcements:CreateParagraph({Title = "W.I.P.", Content = "A lot of stuff haven't been added yet. Work is in progress. I have a lot of studies which is why it takes a lot of time."})
Announcements:CreateParagraph({Title = "Discord suggestions", Content = "They'll be added soon! I will be updating everyday i can."})
Announcements:CreateButton({Name = "Copy Discord Server Link"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Rayfield:Notification("Success!", "Copied Link!", 3, true)
end; })
end)









local Tab_1 = Window:CreateTab("Stamina",0)
Tab_1:CreateParagraph({Title = "Stamina", Content = "You can change your stamina properties here."})
Tab_1:CreateSection("Fast Functions")

Tab_1:CreateButton({Name = "Infinite Stamina"; Callback = function()
Character:SetAttribute("MaxStamina", math.huge)
StaminaModule.Stamina = math.huge
end; })

Tab_1:CreateButton({Name = "Become Fast"; Callback = function()
Char:SetAttribute("WalkSpeed", 40)
Char:SetAttribute("SprintSpeed", 60)
end; })

Tab_1:CreateButton({Name = "Enable/Disable Jump"; Callback = function()
if Hum.JumpPower == 0 then
Hum.JumpPower = 50
else
Hum.JumpPower = 0
end
end; })

local lastusedmethod = ""
local ChoosenNoStamLossMethod = "require"
Tab_1:CreateDropdown({Name = "Choosen No Stamina Loss Method"; Options = {"require","scriptbreak (toggle while running)"}; CurrentOption = ChoosenNoStamLossMethod; MultiSelection = false; Callback = function(Value)
ChoosenNoStamLossMethod = ((Rayfield:GetDropdownValue(Value)=="scriptbreak (toggle while running)" and "scriptbreak") or "require")
end; })

local NoStaminaLoss = false
Tab_1:CreateToggle({Name = "No Stamina Loss"; CurrentValue = false; Callback = function(Value)
if lastusedmethod == "require" then
NoStaminaLoss = false
lastusedmethod = ""
return
elseif lastusedmethod == "scriptbreak" then
Char:SetAttribute("Fatigue", 0)
lastusedmethod = ""
return
end
if Value == true then
if ChoosenNoStamLossMethod == "require" then
NoStaminaLoss = true
lastusedmethod = "require"
task.spawn(function()
TaskTick.LoopNoStaminaLoss = function() if Char~=nil and Char:GetAttribute("MaxStamina")~=nil then StaminaModule.Stamina = tonumber(Char:GetAttribute("MaxStamina")) end end
repeat task.wait(0.003) until NoStaminaLoss == false
if TaskTick.LoopNoStaminaLoss~=nil then
TaskTick.LoopNoStaminaLoss = nil
end
end)
elseif ChoosenNoStamLossMethod == "scriptbreak" then
lastusedmethod = "scriptbreak"
Char:SetAttribute("Fatigue", true)
end
end
end; })

local NoFatigue = false
Tab_1:CreateToggle({Name = "No Fatigue"; CurrentValue = NoFatigue; Callback = function(Value)
NoFatigue = Value
if Value == true then
task.spawn(function()
Heartbeat.LoopNoFatigue = function() if Char~=nil and Char:GetAttribute("Fatigue")~=nil and Char:GetAttribute("Fatigue") == 1 then Char:SetAttribute("Fatigue", 0) end end
repeat task.wait(0.003) until NoFatigue == false
if Heartbeat.LoopNoFatigue~=nil then
Heartbeat.LoopNoFatigue = nil
end
end)
end
end; })



Tab_1:CreateSection("Advanced")
Tab_1:CreateInput({Name = "Max Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
Char:SetAttribute("MaxStamina", tonumber(Value))
end; })
Tab_1:CreateInput({Name = "Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
StaminaModule.Stamina = tonumber(Value)
end; })
Tab_1:CreateInput({Name = "Walk Speed"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
Char:SetAttribute("WalkSpeed", tonumber(Value))
end; })
Tab_1:CreateInput({Name = "Sprint Speed"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
Char:SetAttribute("SprintSpeed", tonumber(Value))
end; })
Tab_1:CreateToggle({Name = "Fatigue"; CurrentValue = false; Callback = function(Value)
Char:SetAttribute("Fatigue", ((Value==true and 1) or 0))
end; })
Tab_1:CreateToggle({Name = "Stamina Regen Paused"; CurrentValue = false; Callback = function(Value)
Char:SetAttribute("PauseRegen", ((Value==true and 1) or 0))
end; })
Tab_1:CreateToggle({Name = "Sprint Disabled"; CurrentValue = false; Callback = function(Value)
Char:SetAttribute("DisableSprint", Value)
end; })










local Tab_2 = Window:CreateTab("Emotes",0)
Tab_2:CreateParagraph({Title = "Emotes", Content = "Functions that are related to emotes."})
Tab_2:CreateButton({Name = "Sync Emotes"; Callback = function()
Module:SyncEmotes()
Rayfield:Notification("Success!", "Enabled sync!", 2, true)
end; })
Tab_2:CreateButton({Name = "Open/Close Emote Selection"; Callback = function()
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Visible = not LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Visible
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Active = not LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Active
end; })
Tab_2:CreateButton({Name = "Use Dance"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Dance")
end; })
Tab_2:CreateButton({Name = "Use Squingle"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Squingle")
end; })
Tab_2:CreateButton({Name = "Use Gangnam Style"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Gangnam Style")
end; })
Tab_2:CreateButton({Name = "Use PBJ"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("PBJ")
end; })
Tab_2:CreateButton({Name = "Use Tornado"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Tornado")
end; })
Tab_2:CreateButton({Name = "Use Rainbow Waves (CLIENT VFX/SFX)"; Callback = function()
Module:RainbowWaves()
end; })

Tab_2:CreateLabel("Custom Emote")

local ANIM = "75513960644342"
Tab_2:CreateInput({Name = "Animation"; PlaceholderText = ANIM; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ANIM = Value
end; })

local VOL = "1.5"
Tab_2:CreateInput({Name = "Sound/Music Volume"; PlaceholderText = VOL; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
VOL = Value
end; })

local LOOP = true
Tab_2:CreateToggle({Name = "Loop Sound/Music"; CurrentValue = LOOP; Callback = function(Value)
LOOP = Value
end; })

local SOUND = "137048834753046"
Tab_2:CreateInput({Name = "Sound/Music"; PlaceholderText = SOUND; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
SOUND = Value
end; })

Tab_2:CreateButton({Name = "Start"; Callback = function()
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://" .. ANIM
local planim = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
planim:Play()
local song = Instance.new("Sound")
song.Volume = VOL
song.Looped = LOOP
song.SoundId = "rbxassetid://" .. SOUND
song.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
song:Play()
local TooLate2 = false
game.Players.LocalPlayer.CharacterAdded:Once(function()
	if TooLate2 then return end
	TooLate2 = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
end)
game.Players.LocalPlayer.Character.Humanoid.Running:Once(function()
	if TooLate2 then return end
	TooLate2 = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
end)
end; })




local Tab_14 = Window:CreateTab("Untitled",0)
Tab_14:CreateParagraph({Title = "Untitled", Content = "Stuff that may or may not be useful. This tab will be deleted soon and everything that is here will get moved to other tabs or removed if too useless"})

function GetAwardFromAbility(abilitynaem)
local rootpart = HumanoidRootPart
local oldcf = rootpart.CFrame
local killermodl = workspace.GameAssets.Teams.Killer:FindFirstChildOfClass("Model")
if not killermodl then return end
local killerrootpart = killermodl.HumanoidRootPart
local anoclip_connection = nil
local acamera_connection = nil
function invisappwithnoclip(bool)
if bool == false then
task.spawn(function()
for i,v in next, rootpart.Parent.Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end)
if anoclip_connection then
anoclip_connection:Disconnect()
anoclip_connection = nil
end
if rootpart then
rootpart.CanCollide = true
end
if acamera_connection then
acamera_connection:Disconnect()
acamera_connection = nil
pcall(function()
workspace.CurrentCamera.CameraSubject = rootpart.Parent.Humanoid
end)
end
elseif bool == true then
local function nocollision()
for i,v in pairs(rootpart.Parent:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if rootpart then
rootpart.CanCollide = false
end
end
anoclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
acamera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = killerrootpart
end)
workspace.CurrentCamera.CameraSubject = killerrootpart
game.Players.LocalPlayer.CharacterAdded:Once(function()
if acamera_connection then
acamera_connection:Disconnect()
acamera_connection = nil
end
if anoclip_connection then
anoclip_connection:Disconnect()
anoclip_connection = nil
end
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://90444351114401"
local loadedanim = rootpart.Parent.Humanoid:LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 2.2
end
end
local function looptpto(part, cframemod, time)
local start = tick()
while tick() - start < time and task.wait() do
rootpart.CFrame = part.CFrame * cframemod
for i,v in pairs(rootpart.Parent:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
end
end
local function looptpto2(cframe, mod, time)
local start = tick()
while tick() - start < time and task.wait() do
rootpart.CFrame = cframe
for i,v in pairs(rootpart.Parent:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
end
end
if (Character:GetAttribute(""..abilitynaem.."Cooldown") and Character:GetAttribute(""..abilitynaem.."Cooldown")~=nil) and Character:GetAttribute(""..abilitynaem.."Cooldown")==true then Rayfield:Notification("Error!", "Your choosen ability is on cooldown!", 3, false) return end
if abilitynaem=="Adrenaline" then
invisappwithnoclip(true)
task.delay(1, function() game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Adrenaline") end)
looptpto(killerrootpart, CFrame.new(0,-8,0), 3)
looptpto2(CFrame.new(0,-490,0), true, 5)
task.delay(0.5, function() invisappwithnoclip(false) end)
looptpto2(oldcf, CFrame.new(0,0,0), 2)
elseif abilitynaem=="Cloak" then
invisappwithnoclip(true)
task.delay(1.5, function() game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Cloak") end)
looptpto(killerrootpart, CFrame.new(0,0,8), 3)
looptpto2(CFrame.new(0,-490,0), true, 7)
task.delay(0.5, function() invisappwithnoclip(false) end)
looptpto2(oldcf, CFrame.new(0,0,0), 2)
elseif abilitynaem=="Taunt" then
invisappwithnoclip(true)
game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Taunt")
task.wait(1)
looptpto(killerrootpart, CFrame.new(0,0,-2), 0.2)
looptpto(killerrootpart, CFrame.new(0,0,-1), 0.2)
looptpto(killerrootpart, CFrame.new(0,0,0), 0.2)
looptpto(killerrootpart, CFrame.new(0,0,1), 0.2)
looptpto(killerrootpart, CFrame.new(0,0,2), 0.2)
task.delay(0.5, function() invisappwithnoclip(false) end)
looptpto2(oldcf, CFrame.new(0,0,0), 2)
elseif abilitynaem=="Punch" then
invisappwithnoclip(true)
game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Punch")
looptpto(killerrootpart, CFrame.new(0,0,-2), 0.22)
looptpto(killerrootpart, CFrame.new(0,0,-1), 0.22)
looptpto(killerrootpart, CFrame.new(0,0,0), 0.22)
looptpto(killerrootpart, CFrame.new(0,0,1), 0.22)
looptpto(killerrootpart, CFrame.new(0,0,2), 0.22)
task.delay(0.5, function() invisappwithnoclip(false) end)
looptpto2(oldcf, CFrame.new(0,0,0), 2)
elseif abilitynaem=="Revolver" then
invisappwithnoclip(true)
task.delay(1, function() game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Revolver") end)
looptpto(killerrootpart, CFrame.new(0,-2,-1), 3)
task.delay(0.5, function() invisappwithnoclip(false) end)
looptpto2(oldcf, CFrame.new(0,0,0), 2)
elseif abilitynaem=="Banana" then
invisappwithnoclip(true)
task.delay(1, function() game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Banana") end)
looptpto(killerrootpart, CFrame.new(0,0,2), 3)
task.delay(0.5, function() invisappwithnoclip(false) end)
looptpto2(oldcf, CFrame.new(0,0,0), 2)
elseif abilitynaem=="WinRound" then
invisappwithnoclip(true)
looptpto2(CFrame.new(500,-490,500), true, 2)
Rayfield:Notification("Success!", "Now you have to wait until round ends.", 10, true)
end
end
function GetCurrentStaminaValues()
local stamvalues = tostring(game.Players.LocalPlayer.PlayerGui.MainGui.RoundUI.PlayerUI.StaminaBar.Label.Text)
local stam, maxstam = stamvalues:match("([%d%.inf]+)/([%d%.inf]+)")
stam = stam == "inf" and math.huge or tonumber(stam)
maxstam = maxstam == "inf" and math.huge or tonumber(maxstam)
return stam, maxstam
end
Tab_14:CreateSection("Point & malice farm")
Tab_14:CreateLabel("Stunning/ragdolling abilities have risks of causing your death ( killer may kill you, but you will still be invisible )")
local ChoosenAbilityAW = "Adrenaline"
Tab_14:CreateDropdown({Name = "Ability"; Options = {"Adrenaline","Cloak","Taunt","Revolver","Punch","Banana"}; CurrentOption = "Adrenaline"; MultiSelection = false; Callback = function(Value)
ChoosenAbilityAW = Rayfield:GetDropdownValue(Value)
end; })
Tab_14:CreateButton({Name = "Get Award for choosen ability"; Callback = function()
GetAwardFromAbility(ChoosenAbilityAW)
end; })
Tab_14:CreateButton({Name = "Win Round ( as Survivor )"; Callback = function()
GetAwardFromAbility("WinRound")
end; })
Tab_14:CreateSection("Bot")
function GetTargetByCategory(cat)
local targets = {
	[1] = 0;
	[2] = 0;
	[3] = 0;
}
local lowesthealth = 155
local lowestdistance = math.huge
for i,v in next, workspace.GameAssets.Teams.Survivor:GetChildren() do
if v and (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head")) then
if v.Humanoid.Health<lowesthealth then
lowesthealth = v.Humanoid.Health
targets[1] = v
end
local Distance = (HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
if Distance<lowestdistance then
lowestdistance = Distance
targets[2] = v
end
if (v:GetAttribute("Ability1") and v:GetAttribute("Ability1")=="Caretaker") or (v:GetAttribute("Ability2") and v:GetAttribute("Ability2")=="Caretaker") then
targets[3] = v
end
end
end
return ((cat=="Most Damaged Player" and targets[1]) or (cat=="Closest Player" and targets[2]) or (cat=="Caretakers" and targets[3]))
end
Tab_14:CreateLabel("This works only for killers")
local ChosenTargetCat = "Most Damaged Player"
Tab_14:CreateDropdown({Name = "Target"; Options = {"Most Damaged Player","Closest Player","Caretakers"}; CurrentOption = "Most Damaged Player"; MultiSelection = false; Callback = function(Value)
ChosenTargetCat = Rayfield:GetDropdownValue(Value)
end; })
local DistanceTrigger = 15
Tab_14:CreateInput({Name = "M1 Distance Trigger"; PlaceholderText = "15"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DistanceTrigger = tonumber(Value)
end; })
local BotToggle = false
local TrueBotToggle = nil
TrueBotToggle = Tab_14:CreateToggle({Name = "Bot Toggle"; CurrentValue = BotToggle; Callback = function(Value)
BotToggle = Value
if workspace.GameAssets.Teams.Killer:FindFirstChild(LocalPlayer.Name)==nil then return end
if BotToggle==true then
local controlremote = game.ReplicatedStorage.Events.RemoteFunctions.UseAbility
local PathService = game:GetService("PathfindingService")
repeat task.wait()
local a,b = pcall(function()
local target = GetTargetByCategory(ChosenTargetCat)
if target==0 then TrueBotToggle:Set(false) Rayfield:Notification("Error!", "No targets with such requirement found.", 3, false) return end
local newpath = PathService:CreatePath({
	AgentRadius = 3,
	AgentHeight = 6,
	AgentCanJump = true,
	AgentCanClimb = true,
	WaypointSpacing = 8,
})
newpath:ComputeAsync(HumanoidRootPart.Position, target.HumanoidRootPart.Position)
local waypoints, distance = newpath:GetWaypoints(), 9e9
if waypoints ~= nil and waypoints[2] ~= nil then
Humanoid:MoveTo(waypoints[2].Position)
elseif waypoints ~= nil and waypoints[1] ~= nil then
Humanoid:MoveTo(waypoints[1].Position)
end
local cstamina, cmaxstamina = GetCurrentStaminaValues()
if cstamina<5 then
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
end
distance = (HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude
if distance<DistanceTrigger then
local hitremote = LocalPlayer.Stats.EquippedKiller=="Killdroid" and "Eject" or "Swing"
controlremote:InvokeServer(hitremote)
end

end)
if b~=nil then print(b) wait(10) end
until workspace.GameAssets.Teams.Killer:FindFirstChild(LocalPlayer.Name)==nil or Humanoid.Health==0 or BotToggle==false
if Humanoid~=nil and HumanoidRootPart~=nil then
Humanoid:MoveTo(HumanoidRootPart.Position)
end
end
end; })



local AbilityNames = Module:GetData("AbilityNames")
local AbilityDatas = Module:GetData("AbilityData")
local Tab_3 = Window:CreateTab("Civilian",0)
Tab_3:CreateParagraph({Title = "Abilities", Content = "You can give yourself abilities or cards with abilities. If you gave yourself an ability you already had, the old ability will be replaced with new settings."})

Tab_3:CreateSection("Fast Functions")
local InputBind = "None"
Tab_3:CreateInput({Name = "Ability Keybind"; PlaceholderText = "None"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
InputBind = string.upper(tostring(Value))
end; })
local ChoosenAbility = "Block"
Tab_3:CreateDropdown({Name = "Choose Ability"; Options = AbilityNames; CurrentOption = ChoosenAbility; MultiSelection = false; Callback = function(Value)
ChoosenAbility = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateButton({Name = "Get Choosen Ability"; Callback = function()
local temp_table = table.clone(AbilityDatas[ChoosenAbility])
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
Tab_3:CreateButton({Name = "Get All Abilities"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AbilityNames[math.random(1, 11)]);tostring(AbilityNames[math.random(1, 11)]);}}))
for _,ability in pairs(AbilityNames) do
local temp_table = table.clone(AbilityDatas[ability])
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end
end; })

Tab_3:CreateSection("Abilities")
--[[
Taunt
]]--
Tab_3:CreateLabel("Taunt Ability")
local TauntBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = TauntBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
TauntBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Taunt"; Callback = function()
local temp_table = table.clone(AbilityDatas["Taunt"])
pcall(function()
temp_table.InputShown = (TauntBind ~= "None" and TauntBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (TauntBind ~= "None" and TauntBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
Punch
]]--
Tab_3:CreateLabel("Punch Ability")
local PunchBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = PunchBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
PunchBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Punch"; Callback = function()
local temp_table = table.clone(AbilityDatas["Punch"])
pcall(function()
temp_table.InputShown = (PunchBind ~= "None" and PunchBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (PunchBind ~= "None" and PunchBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
Revolver
]]--
Tab_3:CreateLabel("Revolver Ability")
local RevolverBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = RevolverBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
RevolverBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Revolver"; Callback = function()
local temp_table = table.clone(AbilityDatas["Revolver"])
pcall(function()
temp_table.InputShown = (RevolverBind ~= "None" and RevolverBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (RevolverBind ~= "None" and RevolverBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
Caretaker
]]--
Tab_3:CreateLabel("Caretaker Ability")
local CaretakerBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = CaretakerBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
CaretakerBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Caretaker"; Callback = function()
local temp_table = table.clone(AbilityDatas["Caretaker"])
pcall(function()
temp_table.InputShown = (CaretakerBind ~= "None" and CaretakerBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (CaretakerBind ~= "None" and CaretakerBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
Banana
]]--
Tab_3:CreateLabel("Banana Ability")
local BananaBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = BananaBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BananaBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Banana"; Callback = function()
local temp_table = table.clone(AbilityDatas["Banana"])
pcall(function()
temp_table.InputShown = (BananaBind ~= "None" and BananaBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (BananaBind ~= "None" and BananaBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
Dash
]]--
Tab_3:CreateLabel("Dash Ability")
local DashBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = DashBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashBind = string.upper(tostring(Value))
end; })
local DashPower = 1250
Tab_3:CreateInput({Name = "Power"; PlaceholderText = DashPower; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashPower = tonumber(Value)
end; })
local DashMaxForce = 30000
Tab_3:CreateInput({Name = "Max Force"; PlaceholderText = DashMaxForce; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashMaxForce = tonumber(Value)
end; })
local DashDuration = 0.3
Tab_3:CreateInput({Name = "Duration"; PlaceholderText = DashDuration; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashDuration = tonumber(Value)
end; })
--------------------------------------------------------------------------------------
local DashConfigEffects = nil
function ApplyDashConfigurations()
if DashConfigEffects then
DashConfigEffects:Disconnect()
DashConfigEffects = nil
end
if not HumanoidRootPart then return end
if not (DashDuration > 0.3) then
DashConfigEffects = HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name == "BodyVelocity" then
c.MaxForce = Vector3.new(DashMaxForce,(DashMaxForce*0.1),DashMaxForce)
c.P = DashPower
game.Debris:AddItem(c, DashDuration)
end
end)
elseif DashDuration > 0.3 then
DashConfigEffects = HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name == "BodyVelocity" then
c:Destroy()
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(DashMaxForce,(DashMaxForce*0.1),DashMaxForce)
BodyVelocity.P = DashPower
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, DashDuration)
end
end)
end
end
--------------------------------------------------------------------------------------
Tab_3:CreateButton({Name = "Get Dash"; Callback = function()
local temp_table = table.clone(AbilityDatas["Dash"])
pcall(function()
temp_table.InputShown = (DashBind ~= "None" and DashBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (DashBind ~= "None" and DashBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
ApplyDashConfigurations()
end; })
--[[
Hotdog
]]--
Tab_3:CreateLabel("Hotdog Ability")
local HotdogBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = HotdogBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
HotdogBind = string.upper(tostring(Value))
end; })
local HotdogStaminaLoss = 5
Tab_3:CreateInput({Name = "Stamina Loss per Hotdog"; PlaceholderText = HotdogStaminaLoss; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
HotdogStaminaLoss = tonumber(Value)
end; })
--------------------------------------------------------------------------------------
local HotdogConfigEffects = nil
function ApplyHotdogConfigurations()
if HotdogConfigEffects then
HotdogConfigEffects:Disconnect()
HotdogConfigEffects = nil
end
if not HumanoidRootPart then return end
if HotdogStaminaLoss == 5 then return end
HotdogConfigEffects = HumanoidRootPart.Hotdog:GetPropertyChangedSignal("Playing"):Connect(function(c)
if HumanoidRootPart.Hotdog.Playing == true then
local OldMaxStamina = tonumber(Character:GetAttribute("MaxStamina"))
if not OldMaxStamina then return end
Character:GetAttributeChangedSignal("MaxStamina"):Once(function()
Character:SetAttribute("MaxStamina", tonumber(OldMaxStamina-HotdogStaminaLoss))
end)
end
end)
end
--------------------------------------------------------------------------------------
Tab_3:CreateButton({Name = "Get Hotdog"; Callback = function()
local temp_table = table.clone(AbilityDatas["Hotdog"])
pcall(function()
temp_table.InputShown = (HotdogBind ~= "None" and HotdogBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (HotdogBind ~= "None" and HotdogBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
ApplyHotdogConfigurations()
end; })
--[[
Block
]]--
Tab_3:CreateLabel("Block Ability")
local BlockBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = BlockBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BlockBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Block"; Callback = function()
local temp_table = table.clone(AbilityDatas["Block"])
pcall(function()
temp_table.InputShown = (BlockBind ~= "None" and BlockBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (BlockBind ~= "None" and BlockBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
Adrenaline
]]--
Tab_3:CreateLabel("Adrenaline Ability")
local AdrenalineBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = AdrenalineBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AdrenalineBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Adrenaline"; Callback = function()
local temp_table = table.clone(AbilityDatas["Adrenaline"])
pcall(function()
temp_table.InputShown = (AdrenalineBind ~= "None" and AdrenalineBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (AdrenalineBind ~= "None" and AdrenalineBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
--[[
BonusPad
]]--
Tab_3:CreateLabel("BonusPad Ability")
local BonusPadBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = BonusPadBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BonusPadBind = string.upper(tostring(Value))
end; })
local BonusPadSpeedModifier = 7
Tab_3:CreateInput({Name = "Speed Modifier"; PlaceholderText = BonusPadSpeedModifier; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BonusPadSpeedModifier = tonumber(Value)
end; })
--------------------------------------------------------------------------------------
local BonusPadConfigEffects = nil
function ApplyBonusPadConfigurations()
if BonusPadConfigEffects then
BonusPadConfigEffects:Disconnect()
BonusPadConfigEffects = nil
end
if not HumanoidRootPart then return end
if BonusPadSpeedModifier == 7 then return end
BonusPadConfigEffects = Character.ChildAdded:Connect(function(c)
if c:IsA("Highlight") and c.Name == "CoolHighlight" then
task.wait()
local OldWalkSpeedModifier = tonumber(Character:GetAttribute("WalkSpeedModifier"))
if not OldWalkSpeedModifier then return end
if OldWalkSpeedModifier > 6 then
Character:SetAttribute("WalkSpeedModifier", tonumber((OldWalkSpeedModifier-7)+BonusPadSpeedModifier))
end
end
end)
end
--------------------------------------------------------------------------------------
Tab_3:CreateButton({Name = "Get BonusPad"; Callback = function()
local temp_table = table.clone(AbilityDatas["BonusPad"])
pcall(function()
temp_table.InputShown = (BonusPadBind ~= "None" and BonusPadBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (BonusPadBind ~= "None" and BonusPadBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
ApplyBonusPadConfigurations()
end; })
--[[
Cloak
]]--
Tab_3:CreateLabel("Cloak Ability")
local CloakBind = "None"
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = CloakBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
CloakBind = string.upper(tostring(Value))
end; })
Tab_3:CreateButton({Name = "Get Cloak"; Callback = function()
local temp_table = table.clone(AbilityDatas["Cloak"])
pcall(function()
temp_table.InputShown = (CloakBind ~= "None" and CloakBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (CloakBind ~= "None" and CloakBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

Tab_3:CreateSection("Get Cards")
local CardSettings = {
    [1] = {[1] = "Revolver",[2] = "Caretaker"},
    [2] = {[1] = "BonusPad",[2] = "Caretaker"},
    [3] = {[1] = "Revolver",[2] = "Punch"}
}
Tab_3:CreateLabel("First Card Settings")
Tab_3:CreateDropdown({Name = "First Ability"; Options = AbilityNames; CurrentOption = CardSettings[1][1]; MultiSelection = false; Callback = function(Value)
CardSettings[1][1] = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Second Ability"; Options = AbilityNames; CurrentOption = CardSettings[1][2]; MultiSelection = false; Callback = function(Value)
CardSettings[1][2] = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateLabel("Second Card Settings")
Tab_3:CreateDropdown({Name = "First Ability"; Options = AbilityNames; CurrentOption = CardSettings[2][1]; MultiSelection = false; Callback = function(Value)
CardSettings[2][1] = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Second Ability"; Options = AbilityNames; CurrentOption = CardSettings[2][2]; MultiSelection = false; Callback = function(Value)
CardSettings[2][2] = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateLabel("Third Card Settings")
Tab_3:CreateDropdown({Name = "First Ability"; Options = AbilityNames; CurrentOption = CardSettings[3][1]; MultiSelection = false; Callback = function(Value)
CardSettings[3][1] = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Second Ability"; Options = AbilityNames; CurrentOption = CardSettings[3][2]; MultiSelection = false; Callback = function(Value)
CardSettings[3][2] = Rayfield:GetDropdownValue(Value)
end; })
Tab_3:CreateButton({Name = "Summon Chosen Cards"; Callback = function()
UIModule.AbilitySelection(CardSettings[1], CardSettings[2], CardSettings[3])
end; })

Tab_3:CreateSection("")
Tab_3:CreateSection("")
Tab_3:CreateParagraph({Title = "Immunities / Buffs", Content = "Immunities and buffs for workspace side"})
Tab_3:CreateSection("Workspace Side")
local InstaDestroyComputer = false
Tab_3:CreateToggle({Name = "Insta-Destroy Badware Computer"; CurrentValue = InstaDestroyComputer; Callback = function(Value)
InstaDestroyComputer = Value
end; })
game:GetService("ProximityPromptService").PromptShown:Connect(function(a,b)
task.wait()
if InstaDestroyComputer ~= true then return end
a.HoldDuration = 0
for i = 1,40 do
pcall(fireproximityprompt, a)
task.wait()
end
end)
local AntiWalls = false
Tab_3:CreateToggle({Name = "Anti-Artful Walls"; CurrentValue = AntiWalls; Callback = function(Value)
AntiWalls = Value
task.spawn(ClearWalls)
end; })
function ClearWalls()
for _,d in next, game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other"):GetDescendants() do
if AntiWalls ~= true then return end
if d and d.Name == "HumanoidRootPart" and d.Anchored == true then
d.CanCollide = false
d.CanTouch = false
d.Transparency = 0.5
end
end
end
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other").DescendantAdded:Connect(function(d)
if AntiWalls ~= true then return end
if d and d.Name == "HumanoidRootPart" and d.Anchored == true then
d.CanCollide = false
d.CanTouch = false
d.Transparency = 0.5
end
end)
local AntiEvilScary1 = false
Tab_3:CreateToggle({Name = "Anti Evil Scary"; CurrentValue = AntiEvilScary1; Callback = function(Value)
AntiEvilScary1 = Value
if AntiEvilScary1 == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
if v and v.Name == "EvilScary" then
Module:ClearTouchable(v)
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
if child and child.Name == "EvilScary" and AntiEvilScary1 == true then
Module:ClearTouchable(child)
end
end)
Tab_3:CreateButton({Name = "Remove EvilScary Jumpscare"; Callback = function()
if game.Players.LocalPlayer.PlayerGui.MainGui.EvilScary then
game.Players.LocalPlayer.PlayerGui.MainGui.EvilScary:Destroy()
else
Rayfield:Notification("Error!", "Already Removed!", 3, false)
end
end; })
local AntiBarriers1 = false
local AntiBarriers1_con = nil
local AntiBarriers1_toggle = nil
AntiBarriers1_toggle = Tab_3:CreateToggle({Name = "Anti Barriers"; CurrentValue = AntiBarriers1; Callback = function(Value)
AntiBarriers1 = Value
pcall(function()
if AntiBarriers1 == true then
if workspace.GameAssets:FindFirstChild("Map") == nil then
AntiBarriers1_toggle:Set(false)
return
end
workspace.GameAssets.Map.Config.Barriers.Parent = game:GetService("LogService")
AntiBarriers1_con = workspace.GameAssets.ChildRemoved:Once(function(c)
if c.Name == "Map" and AntiBarriers == true then
game:GetService("LogService").Barriers:Destroy()
end
end)
else
if AntiBarriers1_con then
AntiBarriers1_con:Disconnect()
AntiBarriers1_con = nil
end
game:GetService("LogService").Barriers.Parent = workspace.GameAssets.Map.Config
end
end)
end; })
workspace.GameAssets.ChildRemoved:Connect(function(c)
if c.Name == "Map" and AntiBarriers1 == true then
AntiBarriers_toggle:Set(false)
end
end)
local AntiFallRagdoll = false
Tab_3:CreateToggle({Name = "Anti Fall Ragdoll"; CurrentValue = AntiFallRagdoll; Callback = function(Value)
AntiFallRagdoll = Value
for i,v in next, workspace.GameAssets:GetDescendants() do
if v.Name == "FallDamage" and v:IsA("BasePart") then
child.CanCollide = not AntiFallRagdoll
child.CanTouch = not AntiFallRagdoll
end
end
end; })
workspace.GameAssets.DescendantAdded:Connect(function(child)
if AntiFallRagdoll ~= true then return end
if child.Name == "FallDamage" and child:IsA("BasePart") then
child.CanCollide = false
child.CanTouch = false
end
end)

local path = {"GameAssets", "Map", "Config", "KillerOnly"}

local function getFolder()
local f = workspace
for _, v in ipairs(path) do
	if not f then return nil end
	f = f:FindFirstChild(v)
	if not f then return nil end
end
return f
end

local ogState = {}
local conns = {}

local function setNoCollide(v, state)
if not v or not v:IsA("BasePart") then return end
if state then
if ogState[v] == nil then
ogState[v] = v.CanCollide
end
v.CanCollide = false
else
if ogState[v] ~= nil then
if v.Parent then
v.CanCollide = ogState[v]
end
ogState[v] = nil
end
end
end

local function enable()
local gameAssets = workspace:FindFirstChild("GameAssets")
local map = gameAssets and gameAssets:FindFirstChild("Map")

if not map then
	Rayfield:Notification("Error!", "Round Haven't Started Yet!", 3, false)
	return
end

local f = getFolder()
if not f then
	Rayfield:Notification("Error!", "Map Doesn't Support Killer Door!", 3, warn)
	return
end

local hasPart = false
for _, v in ipairs(f:GetDescendants()) do
	if v:IsA("BasePart") then
		hasPart = true
		setNoCollide(v, true)
	end
end

if not hasPart then
	Rayfield:Notification("Error!", "Map Doesn't Have Any Killer Door!", 3, warn)
	return
end

local c = f.DescendantAdded:Connect(function(v)
setNoCollide(v, true)
end)
table.insert(conns, c)

Rayfield:Notification("Success!", "You can now enter through Killer Door!", 3, true)
end

local function disable()
for v in pairs(ogState) do
	setNoCollide(v, false)
end
table.clear(ogState)

for _, c in ipairs(conns) do
if c.Connected then
c:Disconnect()
end
end
table.clear(conns)
end

Tab_3:CreateToggle({Name = "Enter Killer Door"; CurrentValue = false; Callback = function(Value)
if Value then
enable()
else
disable()
end
end; })









local Tab_5 = Window:CreateTab("Killer",0)
Tab_5:CreateParagraph({Title = "Abilities Editor", Content = "Ability Editor and giver"})
Tab_5:CreateSection("Universal ( except for killdroid ☹ )")
Tab_5:CreateButton({Name = "Get Faster Swing"; Callback = function(Value)
AbilityModule.CreateAbility({Client = true,ClientFunction = function() game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Swing") end,Name = "Whack_NH",InputShown = "M2",Tip = "Swing but faster.",Cooldown = 0.01, Icon = "rbxassetid://13771861804",DisplayName = "Whack"})
end; })
Tab_5:CreateButton({Name = "Get Lunge Attack"; Callback = function(Value)
local function Ability()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
task.spawn(function()
local a = nil
for i = 1,10 do
if a == true then return end
a = game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Swing")
end
end)
local function onswing()
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = .6
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(1000000,1000,1000000)
BodyVelocity.P = 1250
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .25)
task.wait(.15)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")*2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")*2))
end
local c = nil
local d = nil
c = Humanoid.AnimationPlayed:Connect(function(track)
if track.Animation.AnimationId == "rbxassetid://80787680522855" then
c:Disconnect()
track:Stop()
task.spawn(onswing)
end
end)
end
local lunge_abil = function()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = 0.6
a:AdjustSpeed(0)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")/2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")/2))
task.spawn(Ability)
repeat task.wait() until Character:GetAttribute("SprintSpeed") > 13
a:Stop()
end
AbilityModule.CreateAbility({Client = true,ClientFunction = lunge_abil,Name = "Lunge_NH",InputShown = "F",Tip = "Lunge forwards to deal damage.",Cooldown = 3,Icon = "rbxassetid://105910997361738",DisplayName = "Lunge"})
end; })

Tab_5:CreateSection("Pursuer")
local PursuerCleaveBoost = 6
Tab_5:CreateInput({Name = "Cleave Boost"; PlaceholderText = PursuerCleaveBoost; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
PursuerCleaveBoost = Value
end; })
--------------------------------------------------------------------------------------
local PursuerConfigEffects = nil
function ApplyPursuerConfigurations()
if PursuerConfigEffects then
PursuerConfigEffects:Disconnect()
PursuerConfigEffects = nil
end
if not Character then return end
if PursuerCleaveBoost == 6 then return end
PursuerConfigEffects = Character:GetAttributeChangedSignal("WalkSpeedModifier"):Connect(function()
local OldWalkSpeedModifier = Character:GetAttribute("WalkSpeedModifier")
if not OldWalkSpeedModifier then return end
if OldWalkSpeedModifier == 6 then
Character:SetAttribute("WalkSpeedModifier", PursuerCleaveBoost)
end
end)
end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Pursuer Configurations"; Callback = function()
ApplyPursuerConfigurations()
Rayfield:Notification("Success!", "Applied configurations.", 3, true)
end; })

Tab_5:CreateSection("Badware")
local BadwareHipHeight = 5
Tab_5:CreateInput({Name = "Hip Height when placing computers"; PlaceholderText = BadwareHipHeight; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BadwareHipHeight = Value
end; })
--------------------------------------------------------------------------------------
local BadwareConfigEffects = nil
function ApplyBadwareConfigurations()
if BadwareConfigEffects then
BadwareConfigEffects:Disconnect()
BadwareConfigEffects = nil
end
if not HumanoidRootPart then return end
if not Humanoid then return end
if BadwareHipHeight == 0 then return end
BadwareConfigEffects = HumanoidRootPart.FirewallBypass:GetPropertyChangedSignal("Playing"):Connect(function(c)
if HumanoidRootPart.FirewallBypass.Playing ~= true then return end
Humanoid.HipHeight = tonumber(BadwareHipHeight)
task.wait(2)
Humanoid.HipHeight = 0
end)
end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Badware Configurations"; Callback = function()
ApplyBadwareConfigurations()
Rayfield:Notification("Success!", "Applied configurations.", 3, true)
end; })

Tab_5:CreateSection("Artful")
local ArtfulHipHeight = 5
Tab_5:CreateInput({Name = "Hip Height when placing walls/music box"; PlaceholderText = ArtfulHipHeight; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ArtfulHipHeight = Value
end; })
--------------------------------------------------------------------------------------
local ArtfulConfigEffects = nil
function ApplyArtfulConfigurations()
if ArtfulConfigEffects then
ArtfulConfigEffects:Disconnect()
ArtfulConfigEffects = nil
end
if not HumanoidRootPart then return end
if not Humanoid then return end
if ArtfulHipHeight == 0 then return end
ArtfulConfigEffects = HumanoidRootPart["CopyThrice2"]:GetPropertyChangedSignal("Playing"):Connect(function(c)
if HumanoidRootPart["CopyThrice2"].Playing ~= true then return end
Humanoid.HipHeight = tonumber(ArtfulHipHeight)
task.wait(2)
Humanoid.HipHeight = 0
end)
end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Artful Configurations"; Callback = function()
ApplyArtfulConfigurations()
Rayfield:Notification("Success!", "Applied configurations.", 3, true)
end; })

Tab_5:CreateSection("Harken")
Tab_5:CreateLabel("Nothing Yet...")

Tab_5:CreateSection("Killdroid")
local KilldroidPower = 1250
Tab_5:CreateInput({Name = "Power"; PlaceholderText = KilldroidPower; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
KilldroidPower = tonumber(Value)
end; })
local KilldroidMaxForce = 1000000
Tab_5:CreateInput({Name = "Max Force"; PlaceholderText = KilldroidMaxForce; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
KilldroidMaxForce = tonumber(Value)
end; })
local KilldroidDD = false
Tab_5:CreateToggle({Name = "Infinite Flight"; CurrentValue = KilldroidDD; Callback = function(Value)
KilldroidDD = Value
end; })
--------------------------------------------------------------------------------------
local KilldroidConfigEffects = nil
local KilldroidFlightConfig = nil
function ApplyKilldroidConfigurations()
if KilldroidConfigEffects then
KilldroidConfigEffects:Disconnect()
KilldroidConfigEffects = nil
end
if KilldroidFlightConfig then
KilldroidFlightConfig:Disconnect()
KilldroidFlightConfig = nil
end
if not HumanoidRootPart then return end
KilldroidConfigEffects = HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name == "BodyVelocity" then
c.MaxForce = Vector3.new(KilldroidMaxForce,KilldroidMaxForce,KilldroidMaxForce)
c.P = KilldroidPower
if KilldroidDD ~= true then return end
task.spawn(function()
pcall(function()
KilldroidFlightConfig = game:GetService("RunService").RenderStepped:Connect(function()
if c.Velocity.Y < 0 then
c.Velocity = Vector3.new(c.Velocity.X,0,c.Velocity.Z)
end
end)
end)
end)
end
end)
for _,c in next, HumanoidRootPart:GetChildren() do
if c.Name == "BodyVelocity" then
c.MaxForce = Vector3.new(KilldroidMaxForce,KilldroidMaxForce,KilldroidMaxForce)
c.P = KilldroidPower
if KilldroidDD ~= true then return end
task.spawn(function()
pcall(function()
KilldroidFlightConfig = game:GetService("RunService").RenderStepped:Connect(function()
if c.Velocity.Y < 0 then
c.Velocity = Vector3.new(c.Velocity.X,0,c.Velocity.Z)
end
end)
end)
end)
end
end

end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Killdroid Configurations"; Callback = function(Value)
ApplyKilldroidConfigurations()
Rayfield:Notification("Success!", "Applied configurations.", 3, true)
end; })
Tab_5:CreateSection("")
Tab_5:CreateSection("")
Tab_5:CreateParagraph({Title = "Immunities / Buffs", Content = "Immunities and buffs for workspace side"})
Tab_5:CreateSection("Workspace Side")

local BackupEffect = game:GetService("ReplicatedStorage").Events.RemoteEvents.TauntEffect:Clone()
BackupEffect.Parent = game.LogService
local AntiTaunt = false
Tab_5:CreateToggle({Name = "Anti Taunt"; CurrentValue = AntiTaunt; Callback = function(Value)
AntiTaunt = Value
if AntiTaunt == true then
LocalPlayer.PlayerGui.MainGui.RoundUI.TauntTemplate:Destroy()
else
if LocalPlayer.PlayerGui.MainGui.RoundUI:FindFirstChild("TauntTemplate") == nil then
local a = BackupEffect:Clone()
a.Parent = LocalPlayer.PlayerGui.MainGui.RoundUI
end
end
end; })
LocalPlayer.PlayerGui.MainGui.RoundUI.ChildAdded:Connect(function(child)
if child.Name == "TauntTemplate" and AntiTaunt == true then
child:Destroy()
if Character:GetAttribute("WalkSpeedModifier") ~= nil and Character:GetAttribute("WalkSpeedModifier") < 0 then
Character:SetAttribute("WalkSpeedModifier", 0)
else
task.wait(.05)
Character:SetAttribute("WalkSpeedModifier", 0)
end
end
end)
Tab_5:CreateButton({Name = "Remove Destroyable Objects"; Callback = function(Value)
pcall(function()
workspace.GameAssets.Map.Build.Destroyable:Destroy()
end)
end; })


local AntiEvilScary2 = false
Tab_5:CreateToggle({Name = "Anti Evil Scary"; CurrentValue = AntiEvilScary2; Callback = function(Value)
AntiEvilScary2 = Value
if AntiEvilScary2 == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
if v and v.Name == "EvilScary" then
Module:ClearTouchable(v)
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
if child and child.Name == "EvilScary" and AntiEvilScary2 == true then
Module:ClearTouchable(child)
end
end)



local AntiBarriers2 = false
local AntiBarriers2_con = nil
local AntiBarriers2_toggle = nil
AntiBarriers2_toggle = Tab_5:CreateToggle({Name = "Anti Barriers"; CurrentValue = AntiBarriers2; Callback = function(Value)
AntiBarriers2 = Value
pcall(function()
if AntiBarriers2 == true then
if workspace.GameAssets:FindFirstChild("Map") == nil then
AntiBarriers2_toggle:Set(false)
return
end
workspace.GameAssets.Map.Config.Barriers.Parent = game:GetService("LogService")
AntiBarriers2_con = workspace.GameAssets.ChildRemoved:Once(function(c)
if c.Name == "Map" and AntiBarriers == true then
game:GetService("LogService").Barriers:Destroy()
end
end)
else
if AntiBarriers2_con then
AntiBarriers2_con:Disconnect()
AntiBarriers2_con = nil
end
game:GetService("LogService").Barriers.Parent = workspace.GameAssets.Map.Config
end
end)
end; })
workspace.GameAssets.ChildRemoved:Connect(function(c)
if c.Name == "Map" and AntiBarriers2 == true then
AntiBarriers2_toggle:Set(false)
end
end)










if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
task.wait()
end
_G.ESPenabledHandler = false
_G.ESPtransHandler = 0.3
_G.ESPshowusers = true
_G.ESPshowhealth = true
function CreateHighlight(plr)
task.spawn(function()
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetChildren()) do
if v and v.Name == ("sillyfolder_"..plr.Name) then
v:Destroy()
end
end
repeat task.wait() until game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) == nil
local esp_folder = Instance.new("Folder")
esp_folder.Name = "sillyfolder_"..plr.Name
esp_folder.Parent = game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER")    
repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
local plr_char = plr.Character or plr.CharacterAdded:Wait()
for i,v in pairs(plr_char:GetChildren()) do
if v and v:IsA("BasePart") and (v.Name == "Left Leg" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "Head") then
local esp = Instance.new("BoxHandleAdornment")
esp.Name = "sillygirl_"..plr.Name
esp.Adornee = v
esp.AlwaysOnTop = true
esp.ZIndex = 10 or 1
esp.Size = v.Size
esp.Transparency = (plr_char.Parent.Name == "Workspace" and 1) or tonumber(_G.ESPtransHandler)
esp.Color = (plr_char.Parent.Name == "Killer" and BrickColor.new("Bright red")) or (plr_char.Parent.Name == "Ghost" and BrickColor.new("White")) or BrickColor.new("Bright green")
esp.Parent = game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name)
if v.Name == "Head" then
local esp_stat = Instance.new("BillboardGui")
local stat_text = Instance.new("TextLabel")
esp_stat.Adornee = v
esp_stat.AlwaysOnTop = true
esp_stat.Parent = esp
esp_stat.Size = UDim2.new(0, 80, 0, 50)
esp_stat.StudsOffset = Vector3.new(0, .2, 0)
stat_text.ZIndex = 10
stat_text.BackgroundTransparency = 1
stat_text.Position = UDim2.new(0, 0, 0, -50)
stat_text.Size = UDim2.new(0, 80, 0, 80)
stat_text.Font = Enum.Font.SourceSansSemibold
stat_text.TextSize = 15
stat_text.TextColor3 = Color3.new(1, 1, 1)
stat_text.TextStrokeTransparency = 0
stat_text.TextYAlignment = Enum.TextYAlignment.Bottom
stat_text.Parent = esp_stat
task.spawn(function()
pcall(function()
while task.wait(.05) do
stat_text.Text = ((_G.ESPshowusers == true and "Name: "..plr.Name.."") or "")..""..((_G.ESPshowusers == true and _G.ESPshowhealth == true and "\n") or "")..""..((_G.ESPshowhealth == true and "Health: "..plr_char.Humanoid.Health.."") or "")
end
end)
end)
end
end
end    
local char_connection, team_connection, dstr_connection
char_connection = plr.CharacterAdded:Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
team_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
char_connection:Disconnect()
end)
team_connection = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
char_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
team_connection:Disconnect()
end)
dstr_connection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
if child.Name == "DOD_ESP_HANDLER" then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
team_connection:Disconnect()
char_connection:Disconnect()
dstr_connection:Disconnect()
end      
end)
end)
end
function ChangeTransparency(trans)
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetDescendants()) do
if v and v:IsA("BoxHandleAdornment") then
v.Transparency = trans
end
end
end
local Tab_4 = Window:CreateTab("Visual",0)
Tab_4:CreateParagraph({Title = "Visual", Content = "You can change some of the visual parts of the game here."})
Tab_4:CreateSection("ESP")
Tab_4:CreateSlider({Name = "ESP Transparency (in %)"; Range = {0, 100}; Increment = 5; Suffix = "%"; CurrentValue = (_G.ESPtransHandler*100); Callback = function(Value)
_G.ESPtransHandler = (tonumber(Value) / 100)
ChangeTransparency(tonumber(_G.ESPtransHandler))
end; })
Tab_4:CreateToggle({Name = "Show Username"; CurrentValue = _G.ESPshowusers; Callback = function(Value)
_G.ESPshowusers = Value
end; })
Tab_4:CreateToggle({Name = "Show Health"; CurrentValue = _G.ESPshowhealth; Callback = function(Value)
_G.ESPshowhealth = Value
end; })
plradded_esp = nil
plrremoved_esp = nil
Tab_4:CreateToggle({Name = "Turn On/Off Player ESP"; CurrentValue = false; Callback = function(Value)
_G.ESPenabledHandler = Value
if _G.ESPenabledHandler == true then
if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
task.wait()
end
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v and v ~= game:GetService("Players").LocalPlayer then
CreateHighlight(v)
end
end
plradded_esp = game:GetService("Players").PlayerAdded:Connect(function(plr)
CreateHighlight(plr)
end)
plrremoved_esp = game:GetService("Players").PlayerRemoving:Connect(function(plr)
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
end)
elseif _G.ESPenabledHandler == false then
game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):Destroy()
if plradded_esp ~= nil then
plradded_esp:Disconnect()
plradded_esp = nil
end
if plrremoved_esp ~= nil then
plrremoved_esp:Disconnect()
plrremoved_esp = nil
end
end
end; })


-- Path bla bla
local CoreGui = game:GetService("CoreGui") -- i know CoreGui is already exist but it gonna get bug again if this not exist
local CLEAN = workspace.GameAssets.Debris.Cleanable

-- gLobAL of course.
_G.ESPenabledHandler = false
_G.ESPtransHandler = 0.3 -- DONT REMOVE THAT BECAUSE IT GONNA BROKE THE SCRIPT

local CAREPAD_COLOR = Color3.fromRGB(100, 255, 57)
local PADCONNECT = nil

-- if folder dont exist then create folder if folder exist then it wont create multiple folder
local function ISFOLDERNOTEXIST()
if not CoreGui:FindFirstChild("DOD_PADESP_HANDLER") then
	Instance.new("Folder", CoreGui).Name = "DOD_PADESP_HANDLER"
end
end

-- create esp for other pad
local function CreatePadESP(model)
ISFOLDERNOTEXIST()

-- if folder is already exist then duplicates wont be happend
if CoreGui.DOD_PADESP_HANDLER:FindFirstChild(model:GetDebugId()) then
	return
end

local pad = model:FindFirstChild("Pad", true)
if not (pad and pad:IsA("BasePart")) then return end

local espFolder = Instance.new("Folder")
espFolder.Name = model:GetDebugId()
espFolder.Parent = CoreGui.DOD_PADESP_HANDLER

-- BOX HIGHLIGHT
local box = Instance.new("BoxHandleAdornment")
box.Adornee = pad
box.AlwaysOnTop = true
box.Size = pad.Size
box.Transparency = _G.ESPtransHandler
box.ZIndex = 10
box.Color = (pad.Color == CAREPAD_COLOR)
and BrickColor.new("Bright green") -- lazy to put Number 😔 
or BrickColor.new("Bright blue")
box.Parent = espFolder

-- BILLBOARD
local bb = Instance.new("BillboardGui")
bb.Adornee = pad
bb.Size = UDim2.new(0, 120, 0, 30)
bb.StudsOffset = Vector3.new(0, 2.5, 0)
bb.AlwaysOnTop = true
bb.Parent = espFolder

local tl = Instance.new("TextLabel")
tl.Size = UDim2.fromScale(1, 1)
tl.BackgroundTransparency = 1
tl.TextColor3 = Color3.new(1, 1, 1)
tl.TextStrokeTransparency = 0
tl.Font = Enum.Font.SourceSansSemibold
tl.TextScaled = true
tl.Parent = bb

-- updating Alway updating
task.spawn(function()
while _G.ESPenabledHandler
and pad.Parent
and pad:FindFirstChild("GuiAttachment")
and pad.GuiAttachment:FindFirstChild("Gui")
and pad.GuiAttachment.Gui:FindFirstChild("Label") do

local timer = pad.GuiAttachment.Gui.Label.Text
local CarePadDETECTION = (pad.Color == CAREPAD_COLOR)

tl.Text = timer
box.Color = CarePadDETECTION
and BrickColor.new("Bright green")
or BrickColor.new("Bright blue")

task.wait(0.05)
end

if espFolder.Parent then
		espFolder:Destroy()
	end
end)
end

local function UpdatePadESP()
if not _G.ESPenabledHandler then return end
ISFOLDERNOTEXIST()

for _, model in ipairs(CLEAN:GetChildren()) do
if model:IsA("Model") and model.Name == "BonusPad" then
CreatePadESP(model)
end
end
end




Tab_4:CreateToggle({Name = "Turn On/Off Pad Esp"; CurrentValue = false; Callback = function(Value)
_G.ESPenabledHandler = Value

if Value then
UpdatePadESP()

if not PADCONNECT then
PADCONNECT = CLEAN.ChildAdded:Connect(function(child)
if _G.ESPenabledHandler
		and child:IsA("Model")
		and child.Name == "BonusPad" then
		CreatePadESP(child)
	end
end)
end
else
if PADCONNECT then
	PADCONNECT:Disconnect()
	PADCONNECT = nil
end

if CoreGui:FindFirstChild("DOD_PADESP_HANDLER") then
	CoreGui.DOD_PADESP_HANDLER:Destroy()
end
end
end; })



Tab_4:CreateSection("Gui Management ε=( o｀ω′)ノ")
Tab_4:CreateButton({Name = "Open Shop"; Callback = function()
LocalPlayer.PlayerGui.MainGui.Shop.Visible = true
end; })
Tab_4:CreateButton({Name = "Open Side Tab"; Callback = function()
LocalPlayer.PlayerGui.MainGui.SideTab.Visible = true
end; })
Tab_4:CreateToggle({Name = "Teammate Death Effect Enabled"; CurrentValue = true; Callback = function(Value)
DeathEffectEnabled = Value
if DeathEffectEnabled == true then
UIModule["TeamateDeathEffect"] = function()
	game:GetService("Lighting").TeamateDeathEffect.Enabled = true
	game:GetService("Lighting").TeamateDeathEffect.Contrast = 0
	game:GetService("Lighting").TeamateDeathEffect.TintColor = Color3.fromRGB(255, 255, 255)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["Contrast"] = 1
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["TintColor"] = Color3.fromRGB(255, 52, 52)
	}):Play()
	task.wait(0.5)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["Contrast"] = 0
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
end
Rayfield:Notification("Success!", "Enabled!", 3, true)
elseif DeathEffectEnabled == false then
UIModule["TeamateDeathEffect"] = function() return nil end
Rayfield:Notification("Success!", "Disabled!", 3, true)
end
end; })
function AwardPoints(points, reason)
	local Template = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"):WaitForChild("PlayerPoints"):Clone()
	Template.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui").PlayerPoints
	Template.Frame.Title.Text = "<font color=\'rgb(255, 64, 67)\'>"..tostring(points).." Points</font> Awarded "..tostring(reason)
	Template.Frame.Title.TextTransparency = 1
	Template.Frame.Title.UIStroke.Transparency = 1
	Template.Frame.Cash.ImageTransparency = 1
	game:GetService("Debris"):AddItem(Template, 10)
	game:GetService("TweenService"):Create(Template.Frame.Cash, TweenInfo.new(10, Enum.EasingStyle.Linear), {
		["Rotation"] = 360
	}):Play()
	pcall(function()
		for _ = 0,5 do
			task.wait(0.2)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency - 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency - 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency - 0.2
		end
		task.wait(6)
		for _ = 0,5 do
			task.wait(0.5)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency + 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency + 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency + 0.2
		end
	end)
end
local MoneyToGet = "10"
local ReasonForMoney = "for surviving for atleast 60 seconds."
Tab_4:CreateSection("Money Giver ( Visual )")
Tab_4:CreateInput({Name = "Money amount"; PlaceholderText = MoneyToGet; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
MoneyToGet = Value
end; })
Tab_4:CreateInput({Name = "Reason for getting money"; PlaceholderText = ReasonForMoney; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ReasonForMoney = tostring(Value)
end; })
Tab_4:CreateButton({Name = "Give money"; Callback = function()
AwardPoints(MoneyToGet, ReasonForMoney)
end; })
Tab_4:CreateSection("Custom Skins")
-- i am sorry this was made by ai because i dont know accessory things
function weldAttachments(attach1, attach2)
  local weld = Instance.new("Weld")
  weld.Part0 = attach1.Parent
  weld.Part1 = attach2.Parent
  weld.C0 = attach1.CFrame
  weld.C1 = attach2.CFrame
  weld.Parent = attach1.Parent
  return weld
end
local function buildWeld(weldName, parent, part0, part1, c0, c1)
  local weld = Instance.new("Weld")
  weld.Name = weldName
  weld.Part0 = part0
  weld.Part1 = part1
  weld.C0 = c0
  weld.C1 = c1
  weld.Parent = parent
  return weld
end
local function findFirstMatchingAttachment(model, name)
  for _, child in pairs(model:GetChildren()) do
    if child:IsA("Attachment") and child.Name == name then
      return child
    elseif not child:IsA("Accoutrement") and not child:IsA("Tool") then
      local foundAttachment = findFirstMatchingAttachment(child, name)
      if foundAttachment then
        return foundAttachment
      end
    end
  end
end
function AddAccessory(character, accoutrement, bodyPartName)
  accoutrement.Parent = character
  local handle = accoutrement:FindFirstChild("Handle")
  if not handle then
    return
  end
  local bodyPart = character:FindFirstChild(bodyPartName or "Head")
  if not bodyPart then
    return
  end
  local accAttachment = handle:FindFirstChildOfClass("Attachment")
  if accAttachment then
    local bodyAttachment = bodyPart:FindFirstChild(accAttachment.Name)
    if not bodyAttachment then
      bodyAttachment = Instance.new("Attachment")
      bodyAttachment.Name = accAttachment.Name
      bodyAttachment.Parent = bodyPart
      if bodyPartName == "Head" then
        bodyAttachment.Position = Vector3.new(0, 0.5, 0)
      elseif bodyPartName == "Torso" then
        bodyAttachment.Position = Vector3.new(0, 1, 0)
      elseif bodyPartName == "Right Arm" then
        bodyAttachment.Position = Vector3.new(1, 0.5, 0)
      elseif bodyPartName == "Left Arm" then
        bodyAttachment.Position = Vector3.new(-1, 0.5, 0)
      elseif bodyPartName == "Right Leg" then
        bodyAttachment.Position = Vector3.new(0.5, 1, 0)
      elseif bodyPartName == "Left Leg" then
        bodyAttachment.Position = Vector3.new(-0.5, 1, 0)
      else
        bodyAttachment.Position = Vector3.new(0, 0, 0)
      end
    end
    weldAttachments(bodyAttachment, accAttachment)
  else
    local weld = Instance.new("Weld")
    weld.Name = bodyPartName .. "Weld"
    weld.Part0 = bodyPart
    weld.Part1 = handle
    weld.Parent = bodyPart
    if bodyPartName == "Head" then
      weld.C0 = CFrame.new(0, 0.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Torso" then
      weld.C0 = CFrame.new(0, 1.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Right Arm" then
      weld.C0 = CFrame.new(1.5, 0.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Left Arm" then
      weld.C0 = CFrame.new(-1.5, 0.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Right Leg" then
      weld.C0 = CFrame.new(0.5, 2, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Left Leg" then
      weld.C0 = CFrame.new(-0.5, 2, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    else
      weld.C0 = CFrame.new(0, 0, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    end
  end
  return accoutrement
end
function EditHumanoidChild(char, part, value)
if part == "Pants" then
char:FindFirstChildOfClass("Pants").PantsTemplate = value
elseif part == "Shirt" then
char:FindFirstChildOfClass("Shirt").ShirtTemplate = value
elseif part == "TShirt" then
char:FindFirstChildOfClass("ShirtGraphic").Graphic = value
else
char:FindFirstChild(part).Value = value
end
end
local function ArtfulForsakenSetUp(c)
--head
local head_asset = game:GetObjects("rbxassetid://"..tostring(114257201579610))[1]
repeat task.wait(.05) until head_asset ~= nil and head_asset:FindFirstChild("Handle") and head_asset.Handle:FindFirstChild("SpecialMesh")
local head = AddAccessory(c, head_asset, "Head")
task.wait(.05)
head:WaitForChild("Handle").CanCollide = false
-- right sleeve
local rs_asset = game:GetObjects("rbxassetid://"..tostring(83730135593176))[1]
repeat task.wait(.05) until rs_asset ~= nil and rs_asset:FindFirstChild("Handle") and rs_asset.Handle:FindFirstChild("SpecialMesh")
local rs = AddAccessory(c, rs_asset, "Right Arm")
task.wait(.05)
rs:WaitForChild("Handle").CanCollide = false
rs:WaitForChild("Handle"):WaitForChild("SpecialMesh").Offset = Vector3.new(-1,0.5,0)
-- left sleeve
local ls_asset = game:GetObjects("rbxassetid://"..tostring(82696867944296))[1]
repeat task.wait(.05) until ls_asset ~= nil and ls_asset:FindFirstChild("Handle") and ls_asset.Handle:FindFirstChild("SpecialMesh")
local ls = AddAccessory(c, ls_asset, "Left Arm")
task.wait(.05)
ls:WaitForChild("Handle").CanCollide = false
ls:WaitForChild("Handle"):WaitForChild("SpecialMesh").Offset = Vector3.new(1,0.5,0)
-- torso
local torso_asset = game:GetObjects("rbxassetid://"..tostring(127089746240385))[1]
repeat task.wait(.05) until torso_asset ~= nil and torso_asset:FindFirstChild("Handle") and torso_asset.Handle:FindFirstChild("SpecialMesh")
local torso = AddAccessory(c, torso_asset, "Torso")
task.wait(.05)
torso:WaitForChild("Handle").CanCollide = false
torso:WaitForChild("Handle"):WaitForChild("SpecialMesh").Offset = Vector3.new(0,-1,-0.5)
-- making body parts visible
repeat task.wait(.05) until c:FindFirstChild("Left Leg") and c:FindFirstChild("Left Arm")
c["Left Arm"].Transparency = 0
c["Left Leg"].Transparency = 0
end
local function ArtfulLORSetUp(c)
local function Ability()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
task.spawn(function()
local a = nil
for i = 1,10 do
if a == true then return end
a = game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Swing")
end
end)
local function onswing()
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = .6
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(1000000,1000,1000000)
BodyVelocity.P = 1250
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .25)
task.wait(.15)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")*2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")*2))
end
local c = nil
local d = nil
c = Humanoid.AnimationPlayed:Connect(function(track)
if track.Animation.AnimationId == "rbxassetid://80787680522855" then
c:Disconnect()
track:Stop()
task.spawn(onswing)
end
end)
end
local lunge_abil = function()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = 0.6
a:AdjustSpeed(0)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")/2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")/2))
task.spawn(Ability)
repeat task.wait() until Character:GetAttribute("SprintSpeed") > 13
a:Stop()
end
if c:FindFirstChild("CloneTool") then
c:FindFirstChild("CloneTool"):Destroy()
end
if c:FindFirstChild("Pants") and c:FindFirstChild("Shirt") then
c:FindFirstChild("Pants").PantsTemplate = "http://www.roblox.com/asset/?id=12803009530"
c:FindFirstChild("Shirt").ShirtTemplate = "http://www.roblox.com/asset/?id=12803009530"
end
for i,v in next, c:GetChildren() do
if v and v:IsA("BasePart") and v.Name ~= "Face" and v.Name ~= "MusicBox" then
v.Color = Color3.fromRGB(255,254,226)
end
if v and v:IsA("CharacterMesh") then
if v.BodyPart == Enum.BodyPart.LeftArm then
v.MeshId = 83001137
elseif v.BodyPart == Enum.BodyPart.RightArm then
v.MeshId = 83001181
elseif v.BodyPart == Enum.BodyPart.LeftLeg then
v.MeshId = 746826007
elseif v.BodyPart == Enum.BodyPart.RightLeg then
v.MeshId = 746825633
elseif v.BodyPart == Enum.BodyPart.Torso then
v.MeshId = 82987757
end
end
end
if c:FindFirstChild("Face") and c:WaitForChild("Face"):FindFirstChild("Face") then
c:FindFirstChild("Face"):WaitForChild("Face"):Destroy()
end
--head
local head_asset = game:GetObjects("rbxassetid://"..tostring(15395102950))[1]
repeat task.wait(.05) until head_asset ~= nil and head_asset:FindFirstChild("Handle") and head_asset.Handle:FindFirstChild("SpecialMesh")
local head = AddAccessory(c, head_asset, "Head")
task.wait(.05)
head:WaitForChild("Handle").CanCollide = false
--anims
c.Animations.Idle.AnimationId = "rbxassetid://96089657207073"
c.Animations.Sprint.AnimationId = "rbxassetid://84734698021418"
c.Animations.Walk.AnimationId = "rbxassetid://86166363798441"
if game.Players:GetPlayerFromCharacter(c) ~= game.Players.LocalPlayer then return end
-- effect
if not game:GetService("Lighting"):FindFirstChild("String Theocracy") then
local cce = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
cce.Name = "String Theocracy"
cce.Brightness = 0.175
cce.TintColor = Color3.fromRGB(120,80,15)
cce.Enabled = true
elseif game:GetService("Lighting"):FindFirstChild("String Theocracy") then
game:GetService("Lighting"):FindFirstChild("String Theocracy").Enabled = true
end
game.Players.LocalPlayer.CharacterAdded:Once(function()
game:GetService("Lighting"):FindFirstChild("String Theocracy").Enabled = false
end)
--applying anims
ApplyNewAnimations()
repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Repurpose")
AbilityModule.CreateAbility({Client = true,ClientFunction = lunge_abil,Name = "Lunge_NH",InputShown = "E",Tip = "Lunge forwards to deal damage.",Cooldown = 5,Icon = "rbxassetid://105910997361738",DisplayName = "Lunge"})
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Implement"):Destroy()
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Copywrite"):Destroy()
local a = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Repurpose")
a.Parent = game:GetService("LogService")
task.wait()
a.Parent = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder
end
Tab_4:CreateButton({Name = "Forsaken Artful ( Noliful Variant )"; Callback = function()
Rayfield:Notification("Success!", "Loading new skin... Please wait!", 5, true)
if not _G.mp3_conversion_module then
_G.mp3_conversion_module = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/Encryption-Center/refs/heads/main/mp3_conversion.luau"))()
end
if not isfile("NexerHub/Core/Artful.mp3") then
writefile("NexerHub/Core/Artful.mp3", _G.mp3_conversion_module:ConvertMP3Data(_G.mp3_conversion_module["Artful?"]))
repeat task.wait(.1) until isfile("NexerHub/Core/Artful.mp3")
end
local temp_table = {
	["Name"] = "Artful?";
	["Bio"] = "''I sure do wonder why am i here.''";
	["Icon"] = "rbxassetid://134690353237803";
	["ClearMainAccessories"] = true;
	["ChaseTheme"] = ((getcustomasset and GetFile("NexerHub/Core/Artful.mp3","gca")) or tostring(game.ReplicatedStorage.Characters.Killer.Artful.Cementful.Animations.ChaseTheme.SoundId));
	["CharacterAdded"] = function(c) task.spawn(ArtfulForsakenSetUp, c) end
}
pcall(function()
MainModule:ModifySkin("Cementful", temp_table)
Rayfield:Notification("Success!", "Loaded new skin!", 5, true)
end)
end; })
Tab_4:CreateButton({Name = "String Theocracy ( Artful Skin )"; Callback = function()
Rayfield:Notification("Success!", "Loading new skin... Please wait!", 5, true)
if not _G.mp3_conversion_module then
_G.mp3_conversion_module = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/Encryption-Center/refs/heads/main/mp3_conversion.luau"))()
end
if not isfile("NexerHub/Core/LOR.mp3") then
writefile("NexerHub/Core/LOR.mp3", _G.mp3_conversion_module:ConvertMP3Data(_G.mp3_conversion_module["String Theocracy"]))
repeat task.wait(.1) until isfile("NexerHub/Core/LOR.mp3")
end
local temp_table = {
	["Name"] = "String Theocracy";
	["Bio"] = "''...''";
	["Icon"] = "rbxassetid://18662155";
	["ClearMainAccessories"] = true;
	["ChaseTheme"] = ((getcustomasset and GetFile("NexerHub/Core/LOR.mp3","gca")) or tostring(game.ReplicatedStorage.Characters.Killer.Artful.Builder.Animations.ChaseTheme.SoundId));
	["CharacterAdded"] = function(c) task.spawn(ArtfulLORSetUp, c) end
}
pcall(function()
MainModule:ModifySkin("Builder", temp_table)
Rayfield:Notification("Success!", "Loaded new skin!", 5, true)
end)
end; })
Tab_4:CreateSection("Intro / Special Round Starter")
killerintro = "Pursuer"
Tab_4:CreateDropdown({Name = "Killer Intro"; Options = {"Pursuer","Artful","Badware","Killdroid","Harken","Paranoy","MR.O.B."}; CurrentOption = "Pursuer"; MultiSelection = false; Callback = function(Value)
killerintro = Rayfield:GetDropdownValue(Value)
end; })
KillerUsername = LocalPlayer.Name
Tab_4:CreateInput({Name = "Type Any Username (or type anything)"; PlaceholderText = LocalPlayer.Name; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
if typeof(Value) == "string" and Value ~= "" then
KillerUsername = Value
else
KillerUsername = LocalPlayer.Name
end
end; })
Tab_4:CreateButton({Name = "Start Intro"; Callback = function()
if not firesignal then return end
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, KillerUsername,killerintro,killerintro,"Default",1)
end; })

Tab_4:CreateSection("")

specialroundevent = "Double Trouble"
Tab_4:CreateDropdown({Name = "Special Round Event"; Options = {"Double Trouble","Evil Scary","One Bounce","Gunslinger","Dienation","Mini Brawl"}; CurrentOption = "Double Trouble"; MultiSelection = false; Callback = function(Value)
specialroundevent = Rayfield:GetDropdownValue(Value)
end; })
Tab_4:CreateButton({Name = "Start Special Round Event"; Callback = function()
if not firesignal then return end
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("GamemodeUI").OnClientEvent, specialroundevent)
end; })

Tab_4:CreateSection("Killer Skin Intro Starter")


-- this is almost familiar to your BIAST script (killer abilities tab)
local SkinSelect = "Devesto"
local Skin = {
    "Devesto",
    "Noliful",
    "Cesus",
    "MeQuot",
    "Thec",
    "Aeroware",
    "Jetdroid"
}
function GETSKINSELECTED()
task.spawn(function()
if not firesignal then return end
if SkinSelect == "Noliful" then
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Artful","Artful","Noliful",1)
elseif SkinSelect == "Cesus" then
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Harken","Harken","Cesus",1)
elseif SkinSelect == "MeQuot" then
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Pursuer","Pursuer","MeQuot",1)
elseif SkinSelect == "Thec" then
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Pursuer","Pursuer","Thec",1)
elseif SkinSelect == "Aeroware" then
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Badware","Badware","Aeroware",1)
elseif SkinSelect == "Jetdroid" then
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Killdroid","Killdroid","Jetdroid",1)
else
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, SkinUsername,"Artful","Artful","Devesto",1)
end
end)
end



Tab_4:CreateDropdown({Name = "Killer Skin Intro"; Options = Skin; CurrentOption = SkinSelect; MultiSelection = false; Callback = function(Value)
SkinSelect = Rayfield:GetDropdownValue(Value)
end; })
SkinUsername = LocalPlayer.Name
Tab_4:CreateInput({Name = "Type Any Username (or type anything)"; PlaceholderText = LocalPlayer.Name; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
if typeof(Value) == "string" and Value ~= "" then
SkinUsername = Value
else
SkinUsername = LocalPlayer.Name
end
end; })
Tab_4:CreateButton({Name = "Start Intro"; Callback = function()
GETSKINSELECTED()
end; })











local function ReturnAnimFolder()
if Character:FindFirstChild("Animations") then
return Character:WaitForChild("Animations")
end
return nil
end
local Tab_6 = Window:CreateTab("Animations",0)
function SetRunAnim(run)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("HurtSprint") then
AnimationFolder:FindFirstChild("HurtSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("NormalSprint") then
AnimationFolder:FindFirstChild("NormalSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldSprint") then
AnimationFolder:FindFirstChild("OldSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("Sprint") then
AnimationFolder:FindFirstChild("Sprint").AnimationId = run
end
end)
end
function SetWalkAnim(walk)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Walk") then
AnimationFolder:FindFirstChild("Walk").AnimationId = walk
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldWalk") then
AnimationFolder:FindFirstChild("OldWalk").AnimationId = walk
end
end)
end
function SetIdleAnim(idle)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Idle") then
AnimationFolder:FindFirstChild("Idle").AnimationId = idle
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldIdle") then
AnimationFolder:FindFirstChild("OldIdle").AnimationId = idle
end
end)
end
function ApplyNewAnimations()
pcall(function()
workspace:SetAttribute("AnimationsEnabled", false)
task.wait()
workspace:SetAttribute("AnimationsEnabled", true)
end)
end
task.wait()
if workspace:GetAttribute("AnimationsEnabled") == nil then
Tab_6:CreateParagraph({Title = "Not Supported", Content = "clientscript not found"})
end
if workspace:GetAttribute("AnimationsEnabled") ~= nil then
Tab_6:CreateParagraph({Title = "Animations", Content = "You can change your anims here."})
Tab_6:CreateSection("Pre-loaded animations")
Tab_6:CreateLabel("Civilian animations")
Tab_6:CreateButton({Name = "Apply New Civilian Animations"; Callback = function()
local RunAnim = "rbxassetid://137375023685630"
local WalkAnim = "rbxassetid://84388941697203"
local IdleAnim = "rbxassetid://100930402371608"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Rayfield:Notification("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })
Tab_6:CreateButton({Name = "Apply Old Civilian animations"; Callback = function()
local RunAnim = "rbxassetid://79488319304371"
local WalkAnim = "rbxassetid://138161225743614"
local IdleAnim = "rbxassetid://74309548749074"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Rayfield:Notification("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })
Tab_6:CreateLabel("Ghost Animations")
Tab_6:CreateButton({Name = "Apply Ghost animations"; Callback = function()
local RunAnim = "rbxassetid://124260679864309"
local WalkAnim = "rbxassetid://124260679864309"
local IdleAnim = "rbxassetid://110395159339100"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Rayfield:Notification("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })
pcall(function()
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
Tab_6:CreateLabel(v.Name.." Animations")
local temp_table = {}
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
table.insert(temp_table, e.Name)
end; end
local Hi = v:WaitForChild("Default")
Tab_6:CreateDropdown({Name = "Choose "..v.Name.." animations"; Options = temp_table; CurrentOption = "Default"; MultiSelection = false; Callback = function(Value)
Hi = v:WaitForChild(Rayfield:GetDropdownValue(Value))
end; })
Tab_6:CreateButton({Name = "Apply "..v.Name.." animations"; Callback = function()
local RunAnim = Hi:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local WalkAnim = Hi:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local IdleAnim = Hi:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Rayfield:Notification("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })
end; end
end)
Tab_6:CreateSection("Advanced")
function GetAllRunAnims()
local temp_table = {}
temp_table["Civilian Run"] = "rbxassetid://137375023685630"
temp_table["Old Civilian Run"] = "rbxassetid://79488319304371"
temp_table["Ghost Run"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local RunAnim = e:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Run"
temp_table[AnimName] = RunAnim
end; end
end; end
return temp_table
end
function GetAllWalkAnims()
local temp_table = {}
temp_table["Civilian Walk"] = "rbxassetid://84388941697203"
temp_table["Old Civilian Walk"] = "rbxassetid://138161225743614"
temp_table["Ghost Walk"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local WalkAnim = e:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Walk"
temp_table[AnimName] = WalkAnim
end; end
end; end
return temp_table
end
function GetAllIdleAnims()
local temp_table = {}
temp_table["Civilian Idle"] = "rbxassetid://100930402371608"
temp_table["Old Civilian Idle"] = "rbxassetid://74309548749074"
temp_table["Ghost Idle"] = "rbxassetid://110395159339100"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local IdleAnim = e:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Idle"
temp_table[AnimName] = IdleAnim
end; end
end; end
return temp_table
end
function GetAllRunNames()
local temp_table = {}
table.insert(temp_table, "Civilian Run")
table.insert(temp_table, "Old Civilian Run")
table.insert(temp_table, "Ghost Run")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Run"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end
function GetAllWalkNames()
local temp_table = {}
table.insert(temp_table, "Civilian Walk")
table.insert(temp_table, "Old Civilian Walk")
table.insert(temp_table, "Ghost Walk")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Walk"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end
function GetAllIdleNames()
local temp_table = {}
table.insert(temp_table, "Civilian Idle")
table.insert(temp_table, "Old Civilian Idle")
table.insert(temp_table, "Ghost Idle")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Idle"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end
local ChoosenRunAnim = "Civilian Run"
Tab_6:CreateDropdown({Name = "Run Animation"; Options = GetAllRunNames(); CurrentOption = ChoosenRunAnim; MultiSelection = false; Callback = function(Value)
ChoosenRunAnim = tostring(Rayfield:GetDropdownValue(Value))
end; })
local ChoosenWalkAnim = "Civilian Walk"
Tab_6:CreateDropdown({Name = "Walk Animation"; Options = GetAllWalkNames(); CurrentOption = ChoosenWalkAnim; MultiSelection = false; Callback = function(Value)
ChoosenWalkAnim = tostring(Rayfield:GetDropdownValue(Value))
end; })
local ChoosenIdleAnim = "Civilian Idle"
Tab_6:CreateDropdown({Name = "Idle Animation"; Options = GetAllIdleNames(); CurrentOption = ChoosenIdleAnim; MultiSelection = false; Callback = function(Value)
ChoosenIdleAnim = tostring(Rayfield:GetDropdownValue(Value))
end; })
Tab_6:CreateButton({Name = "Apply Animations"; Callback = function()
task.spawn(function()
SetRunAnim(GetAllRunAnims()[ChoosenRunAnim])
SetWalkAnim(GetAllWalkAnims()[ChoosenWalkAnim])
SetIdleAnim(GetAllIdleAnims()[ChoosenIdleAnim])
task.wait()
ApplyNewAnimations()
end)
Rayfield:Notification("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })
Tab_6:CreateSection("Ability Changer")
local AbilityAnimData = Module:GetData("AbilityAnimations")
local AbilityAnimNames = {"Punch","Adrenaline","AdrenalineEnd","Caretaker","CloakStart","BlockStart","Dash","PadBuild","Hotdog","Revolver","Taunt","RevolverReload","CloakEnd","DynamiteWindup","DynamiteThrow","DynamiteHold","Banana","BlockLand"}
local ReplaceWhatAbil = "Punch"
Tab_6:CreateDropdown({Name = "Replace what"; Options = AbilityAnimNames; CurrentOption = ReplaceWhatAbil; MultiSelection = false; Callback = function(Value)
ReplaceWhatAbil = Rayfield:GetDropdownValue(Value)
end; })
local ReplaceWithWhatAbil = "BlockStart"
Tab_6:CreateDropdown({Name = "Replace with what"; Options = AbilityAnimNames; CurrentOption = ReplaceWithWhatAbil; MultiSelection = false; Callback = function(Value)
ReplaceWithWhatAbil = Rayfield:GetDropdownValue(Value)
end; })
Tab_6:CreateButton({Name = "Replace animation"; Callback = function()
task.spawn(function()
Character.Animations.Abilities[ReplaceWhatAbil].AnimationId = tostring(AbilityAnimData[ReplaceWithWhatAbil])
task.wait()
ApplyNewAnimations()
end)
Rayfield:Notification("Success!", "Applying replacion, it may take up to 10 seconds.", 3, true)
end; })
Tab_6:CreateSection("Custom Ability Animation Changer")
local abilityList = {}
for name,_ in pairs(AbilityAnimData) do
	table.insert(abilityList,name)
end
local SelectedAbility = "Adrenaline"
Tab_6:CreateDropdown({Name = "Select Ability"; Options = abilityList; CurrentOption = SelectedAbility; MultiSelection = false; Callback = function(v)
SelectedAbility = Rayfield:GetDropdownValue(v)
end});
local CustomAnimID = "0"
Tab_6:CreateInput({Name = "Animation ID"; PlaceholderText = tostring(CustomAnimID); NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(v)
CustomAnimID = tostring(v)
end});
Tab_6:CreateButton({Name = "Apply Animation"; Callback = function()
local idexists = not pcall(function() game:GetService("ContentProvider"):PreloadAsync({tonumber(id)}) end)
AbilityAnimData[SelectedAbility] = ((idexists == true and "rbxassetid://"..CustomAnimID) or CustomAnimID)
Character.Animations.Abilities[SelectedAbility].AnimationId = AbilityAnimData[SelectedAbility]
ApplyNewAnimations()
Rayfield:Notification("Success!", "Changed Ability Animation.", 3, true)
end});
Tab_6:CreateSection("Miscellaneous")
local DesyncInSeconds = 1
Tab_6:CreateInput({Name = "Desync in seconds"; PlaceholderText = tostring(DesyncInSeconds); NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
workspace:SetAttribute("AnimDesync", tonumber(Value))
end; })
local DesyncEnabled = false
Tab_6:CreateToggle({Name = "Animations Desync"; CurrentValue = false; Callback = function(Value)
workspace:SetAttribute("AnimDesyncEnabled", Value)
end; })
Tab_6:CreateButton({Name = "No animations [ Apply any animation to revert! ]"; Callback = function()
pcall(function()
workspace:SetAttribute("AnimationsEnabled", false)
end)
end; })
Tab_6:CreateButton({Name = "Fast animations [ THIS CANNOT BE REVERTED! ]"; Callback = function()
pcall(function()
while task.wait() do
local a = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, a:GetPlayingAnimationTracks() do
v:AdjustSpeed(10)
end
end
end)
end; })
end




local Tab_13 = Window:CreateTab("Game Breaking Exploits",0)
Tab_13:CreateParagraph({Title = "Game Breaking Exploits", Content = "Game Breaking features. Currently free, but may get paid starting from 21th december. Every feature that is here is server-sided. (FE)"})
--[[Tab_13:CreateButton({Name = "Gamepass Link [ Costs "..tostring((Module:GetAssetPrice(1597133271) or 99)).." robux ]"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId,1597133271) then
    _G.HasGameBreakingFeaturesAccess = true
    Rayfield:Notification("Error!", "Already have gamepass!", 3, warn)
else
    Module:Browse("https://www.roblox.com/game-pass/1597133271")
end
end; })]]
Tab_13:CreateSection("God-Mode")
Tab_13:CreateLabel("WARNING! This only works if you are killer. After activating god mode you will not be able to take damage/get stunned.")
Tab_13:CreateButton({Name = "Enable God-Mode"; Callback = function()
Module.GameBreakingFeatures:GodMode()
end; })
Tab_13:CreateSection("Softlock")
Tab_13:CreateLabel("WARNING! This only works if you are civilian. After activating softlock you will start spectating current killer. You won't be able to respawn until the end of the round.")
Tab_13:CreateLabel("This feature will only softlock those abilities: Immolate, Tangle, Rift, Deploy")
Tab_13:CreateButton({Name = "Enable Softlock"; Callback = function()
Module.GameBreakingFeatures:Softlock()
end; })
Tab_13:CreateSection("No Evilness Limit")
Tab_13:CreateLabel("After activating this feature, you will never become killer but will still gain evilness. Revertable by just turning this feature off.")
Tab_13:CreateToggle({Name = "No Evilness Limit"; CurrentValue = false; Callback = function(Value)
Module.GameBreakingFeatures:NoEvilnessLimit(Value)
end; })
Module.GameBreakingFeatures:InitiateNoEvilnessLimit()
Tab_13:CreateSection("Two Man LMS")
Tab_13:CreateLabel("WARNING! This only works if you are civilian. Use when there is someone else and you left.")
Tab_13:CreateButton({Name = "Enable Two Man LMS"; Callback = function()
if game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChild(game.Players.LocalPlayer.Name) and #game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):GetChildren() == 2 then
Module.GameBreakingFeatures:InitiateLMS()
end
end; })
Tab_13:CreateSection("End Round")
Tab_13:CreateLabel("WARNING! This only works if you are either civilian or killer. If you are killer, activate this feature if there are no others killers. If you are civilian, activate this feature if you are in LMS.")
Tab_13:CreateButton({Name = "End Round"; Callback = function()
if game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(game.Players.LocalPlayer.Name) and #game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):GetChildren() == 1 then
Module.GameBreakingFeatures:InitiateLMS()
end
if game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChild(game.Players.LocalPlayer.Name) and #game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):GetChildren() == 1 then
Module.GameBreakingFeatures:InitiateLMS()
end
end; })
Tab_13:CreateSection("Respawn")
Tab_13:CreateLabel("After activating this, you will respawn in the lobby, but the game will still think that you are alive and will count you as an alive civilian/killer in current round.")
Tab_13:CreateButton({Name = "Respawn"; Callback = function()
Module.GameBreakingFeatures:Respawn()
end; })
Tab_13:CreateSection("Break Game")
Tab_13:CreateLabel("WARNING! This only works if you are killer and you are playing on badware. After activating this feature, all new rounds will get bugged. (basically breaking the game)")
Tab_13:CreateButton({Name = "Break Game"; Callback = function()
Module.GameBreakingFeatures:BreakGame()
end; })
Tab_13:CreateSection("OVERRIDE Equipment")
Tab_13:CreateLabel("By using this feature, you can, for example, wear MeQuot skin as Artful. Or you can also wear Angelware skin as Killdroid. You get it, right?")
local EquippingData = {
	["Killer"] = "",
	["Skin"] = "",
	["Method"] = "Equipping Skin"
}
Tab_13:CreateDropdown({Name = "Killer"; Options = {"Pursuer","Badware","Artful","Harken","Killdroid","Pretence","Paranoy","MR.O.B."}; CurrentOption = EquippingData.Killer; MultiSelection = false; Callback = function(Value)
EquippingData.Killer = Rayfield:GetDropdownValue(Value)
end; })
Tab_13:CreateInput({Name = "Skin"; PlaceholderText = EquippingData.Skin; NumbersOnly = false; OnEnter = false; RemoveTextAfterFocusLost = false; Callback = function(Value)
EquippingData.Skin = tostring(Value)
end; })
Tab_13:CreateDropdown({Name = "Method"; Options = {"Equipping Skin","Equipping Killer"}; CurrentOption = EquippingData.Method; MultiSelection = false; Callback = function(Value)
EquippingData.Method = Rayfield:GetDropdownValue(Value)
end; })
Tab_13:CreateButton({Name = "OVERRIDE Equip"; Callback = function()
Module.GameBreakingFeatures:OverrideEquip(EquippingData.Killer,EquippingData.Skin,EquippingData.Method)
end; })


local Tab_7 = Window:CreateTab("Premium",0)
Tab_7:CreateParagraph({Title = "Premium", Content = "Premium content here! Very exploitable features."})
Tab_7:CreateLabel("First way to unlock premium features [ Gamepass ]")
Tab_7:CreateButton({Name = "Gamepass Link [ Costs "..tostring((Module:GetAssetPrice(1264479709) or 39)).." robux ]"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
    _G.HasPremium = true
    Rayfield:Notification("Error!", "Already have gamepass!", 3, warn)
else
    Module:Browse("https://www.roblox.com/game-pass/1264479709")
end
end; })
Tab_7:CreateLabel("Second way to unlock premium features [ Key from discord server ]")
Tab_7:CreateButton({Name = "Copy Discord Server Link"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Rayfield:Notification("Success!", "Copied Link!", 3, true)
end; })
Tab_7:CreateInput({Name = "Input Key"; PlaceholderText = "Type Here!"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
if string.lower(string.gsub(tostring(Value), "^%s*(.-)%s*$", "%1")) == tostring(_G.PremiumKeyAccess) then
_G.HasPremium = true
Rayfield:Notification("Success!", "Redeemed key, enjoy your premium!", 5, true)
end
end; })
Tab_7:CreateSection("")
Tab_7:CreateSection("Advanced Anti / Immunities")
local antiStun = false
Tab_7:CreateToggle({Name = "Anti-Stun",CurrentValue = false,Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
antiStun = Value
if antiStun then
if Character:GetAttribute("WalkSpeedModifier") == nil then
Character:SetAttribute("WalkSpeedModifier", 0)
end
Heartbeat.AntiStun = function() if Character and Character:GetAttribute("WalkSpeedModifier")~=nil and tonumber(Character:GetAttribute("WalkSpeedModifier")) < 0 then Character:SetAttribute("WalkSpeedModifier", 0) end end
Rayfield:Notification("Success!", "Anti-Stun is now enabled!", 2, true)
else
if Heartbeat.AntiStun~=nil then
Heartbeat.AntiStun = nil
end
end
end; })
local noclip_connection = nil
local camera_connection = nil
function ApplyInvisibility(bool)
if bool == false then
task.spawn(function()
for i,v in next, Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end)
if noclip_connection then
noclip_connection:Disconnect()
noclip_connection = nil
end
if camera_connection then
camera_connection:Disconnect()
camera_connection = nil
pcall(function()
workspace.CurrentCamera.CameraSubject = Humanoid
end)
end
elseif bool == true then
local function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://90444351114401" -- If you will use my invis, please credit me.
local loadedanim = Humanoid:LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 2.2
end
end
Tab_7:CreateSection("Invisibility")
Tab_7:CreateToggle({Name = "Turn On/Off Invisibility"; CurrentValue = false; Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if Value == false then
ApplyInvisibility(Value)
Rayfield:Notification("Success!", "Disabled invisibility!", 2, true)
elseif Value == true then
ApplyInvisibility(Value)
Rayfield:Notification("Success!", "Applied invisibility!", 2, true)
end
end; })
function InitInfCloak(d)
        local temp_humanoid = d:WaitForChild("Humanoid")
        local oldhealth = temp_humanoid.Health
        local temp_connection = nil
        local temp_con = nil
        local torso = d:FindFirstChild("Torso")
        if torso then
            temp_connection = torso:GetPropertyChangedSignal("Transparency"):Connect(function()
                if torso.Transparency == 1 then
                    ApplyInvisibility(true)
                    if d:FindFirstChild("HumanoidRootPart") and d.HumanoidRootPart:FindFirstChild("CloakEnd") then
                        d.HumanoidRootPart.CloakEnd.Played:Once(function()
                            d.HumanoidRootPart.CloakEnd:Stop()
                        end)
                    end
                    task.spawn(function()
                        pcall(function()
                            repeat task.wait() until not d:IsDescendantOf(workspace) or temp_humanoid.Health ~= oldhealth or InfinityCloak == false
                            ApplyInvisibility(false)
                            if temp_connection then temp_connection:Disconnect() end
                            if temp_con then temp_con:Disconnect() end
                        end)
                    end)
                end
            end)
            temp_con = workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildRemoved:Connect(function(c)
                if c == d then
                    if temp_connection then temp_connection:Disconnect() end
                    if temp_con then temp_con:Disconnect() end
                end
            end)
        end
end
Tab_7:CreateToggle({Name = "Infinity Cloak"; CurrentValue = false; Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
InfinityCloak = Value
if Value == true then
InitInfCloak(Character)
end
end; })
workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildAdded:Connect(function(d)
    if d.Name == LP.Name and InfinityCloak == true then
InitInfCloak(d)
    end
end)
local HitboxAutoTracer, ClosestHRP = false, nil
local AimRange, AutoAim, AimTarget, Freeze_XAxis, Freeze_YAxis, Freeze_ZAxis, Prediction, PredictionInSeconds = 9e9, false, false, true, false, false, false, 1
function EnableAutoTracer()
local suc, err = pcall(function()
while game:GetService("RunService").Heartbeat:Wait() do 
if HitboxAutoTracer == true then
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
task.wait(.5)
end
local mag = (ClosestHRP.Position - HumanoidRootPart.Position).Magnitude
local vel = HumanoidRootPart.Velocity
if mag < 32 then
HumanoidRootPart.Velocity = (((ClosestHRP.Position - HumanoidRootPart.Position).Unit) * (mag * 10))
else
--if mag < 140 then
HumanoidRootPart.Velocity = (((ClosestHRP.Position - HumanoidRootPart.Position).Unit) * (mag * 13))
end
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
HumanoidRootPart.Velocity = vel
end
end
end
end)
if not suc then
task.spawn(function() EnableAutoTracer() end)
end
end
task.spawn(EnableAutoTracer)
function IsNormalC(v)
if v and v:FindFirstChild("Head") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
return true
end
return false
end
game:GetService("RunService").Heartbeat:Connect(function()
pcall(function()
local ClosestDistance = math.huge
local NewClosest = nil
if not IsNormalC(Character) then
ClosestHRP = nil
return
end
for i,v in pairs(game.Players:GetPlayers()) do
if not IsNormalC(v.Character) then continue end
if AimTarget == "Killers" and v.Character.Parent.Name ~= "Killer" then continue end
if AimTarget == "Civilians" and v.Character.Parent.Name ~= "Survivor" then continue end
if v and v.Name ~= game:GetService("Players").LocalPlayer.Name then
local Distance = (HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
if Distance < ClosestDistance then
ClosestDistance = Distance
NewClosest = v.Character.HumanoidRootPart
end
end
end
if AutoAim == true and ClosestDistance < tonumber(AimRange) then
local LookingPosition = CFrame.new()
if Prediction == true then
LookingPosition = CFrame.lookAt(HumanoidRootPart.Position, (NewClosest.Position + ((NewClosest.Velocity or Vector3.new(0,0,0)) * PredictionInSeconds)))
else
LookingPosition = CFrame.lookAt(HumanoidRootPart.Position, NewClosest.Position)
end
if Freeze_XAxis or Freeze_YAxis or Freeze_ZAxis then
local x_1, y_1, z_1 = LookingPosition:ToOrientation()
local x_2, y_2, z_2 = HumanoidRootPart.CFrame:ToOrientation()
HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position) * CFrame.Angles(((Freeze_XAxis and x_2) or x_1), ((Freeze_YAxis and y_2) or y_1), ((Freeze_ZAxis and z_2) or z_1))
else
HumanoidRootPart.CFrame = LookingPosition
end
end
ClosestHRP = NewClosest
end)
end)
Tab_7:CreateSection("Hitbox Manipulation ( ONLY FOR KILLERS! )")
Tab_7:CreateLabel("Basically Extender but with auto-tracer and without fling")
Tab_7:CreateToggle({Name = "Auto-Trace Hitbox"; CurrentValue = false; Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
HitboxAutoTracer = Value
end; })
Tab_7:CreateLabel("Default Extender, might fling when touching people")
Tab_7:CreateToggle({Name = "Extend Hitbox"; CurrentValue = false; Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
ExtendHitbox = Value
if ExtendHitbox == true then
local distance = 10
repeat game:GetService("RunService").Heartbeat:Wait()
local vel, movel = nil, 0.1
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
game:GetService("RunService").Heartbeat:Wait()
end
vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel * distance + (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * distance)
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
until ExtendHitbox == false
end
end; })
Tab_7:CreateSection("Aimbot")
Tab_7:CreateLabel("WARNING! Don't use shiftlock")
Tab_7:CreateLabel("Settings")
Tab_7:CreateInput({Name = "Aim Range"; PlaceholderText = "9000000000"; NumbersOnly = true; OnEnter = false; RemoveTextAfterFocusLost = false; Callback = function(Value)
AimRange = tonumber(Value)
end; })
Tab_7:CreateDropdown({Name = "Aim Target"; Options = {"Everyone","Civilians","Killers"}; CurrentOption = "Everyone"; MultiSelection = false; Callback = function(Value)
AimTarget = Rayfield:GetDropdownValue(Value)
end; })
Tab_7:CreateToggle({Name = "Prediction"; CurrentValue = false; Callback = function(Value)
Prediction = Value
end; })
Tab_7:CreateInput({Name = "Prediction In Seconds"; PlaceholderText = "1"; NumbersOnly = true; OnEnter = false; RemoveTextAfterFocusLost = false; Callback = function(Value)
PredictionInSeconds = tonumber(Value)
end; })
Tab_7:CreateLabel("Aims Character to a closest player")
Tab_7:CreateToggle({Name = "Humanoid Auto Aim"; CurrentValue = false; Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AutoAim = Value
end; })
Tab_7:CreateLabel("Don't edit if you don't know what is this")
Tab_7:CreateToggle({Name = "Freeze X Axis"; CurrentValue = true; Callback = function(Value)
Freeze_XAxis = Value
end; })
Tab_7:CreateToggle({Name = "Freeze Y Axis"; CurrentValue = false; Callback = function(Value)
Freeze_YAxis = Value
end; })
Tab_7:CreateToggle({Name = "Freeze Z Axis"; CurrentValue = false; Callback = function(Value)
Freeze_ZAxis = Value
end; })
Tab_7:CreateSection("Auto Block")
Tab_7:CreateLabel("[ W.I.P. ] Uses block ability when the killer is attacking you. Also your ping must be good.")
Tab_7:CreateLabel("ONLY BLOCKS SWING!!! CAN'T BLOCK KILLDROID!!!")
local AutoBlockRange = 20
Tab_7:CreateInput({Name = "Auto Block Detection Range ( Studs )"; PlaceholderText = "20"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AutoBlockRange = tonumber(Value)
end; })
local AutoBlock = false
Tab_7:CreateToggle({Name = "Auto Block"; CurrentValue = false; Callback = function(Value)
if not _G.HasPremium then Rayfield:Notification("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AutoBlock = Value
if Value == true then
Module:AutoBlockSettings("AutoBlockEnabled",true)
elseif Value == false then
Module:AutoBlockSettings("AutoBlockEnabled",false)
Module:AutoBlockUnhookAll()
end
end; })
Module:AutoBlockSettings("AutoBlockRange",AutoBlockRange)
Module:AutoBlockSettings("CheckIfFacesTowardsPlayer",true)
Module:InitiateAutoBlock()

local ff_connection = nil
local ff_enabled = false
local ff_cd = false
-- Credits to whoever created this, appreciate this.
function Flip()
	if ff_cd then
		return
	end
	ff_cd = true
	local character = Character
	local hrp = HumanoidRootPart
	local animator = Humanoid:FindFirstChildOfClass("Animator")
	if not hrp or not Humanoid then
		ff_cd = false
		return
	end
	local savedTracks = {}
	if animator then
		for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
			savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
			track:Stop(0)
		end
	end
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
	local duration = 0.45
	local steps = 120
	local startCFrame = hrp.CFrame
	local forwardVector = startCFrame.LookVector
	local upVector = Vector3.new(0, 1, 0)
	task.spawn(function()
		local startTime = tick()
		for i = 1, steps do
			local t = i / steps
			local height = 4 * (t - t ^ 2) * 10
			local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height	
            local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

			hrp.CFrame = CFrame.new(nextPos) * rotation
			local elapsedTime = tick() - startTime
			local expectedTime = (duration / steps) * i
			local waitTime = expectedTime - elapsedTime
			if waitTime > 0 then
				task.wait(waitTime)
			end
		end
		hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
		Humanoid:ChangeState(Enum.HumanoidStateType.Running)
		if animator then
			for _, data in ipairs(savedTracks) do
				local track = data.track
				track:Play()
				track.TimePosition = data.time
			end
		end
		task.wait(0.25)
		ff_cd = false
	end)
end
local TopBar = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
local OrigSize = TopBar.Size.X.Offset
local ff_button = nil
function SetFrontFlip(bool)
ff_enabled = bool
if ff_enabled == true then
TopBar = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
OrigSize = TopBar.Size.X.Offset
ff_button = Instance.new("Frame", TopBar)
		ff_button.Size = UDim2.new(0, 48, 0, 44)
		ff_button.BackgroundTransparency = 1
		ff_button.BorderSizePixel = 0
		ff_button.Position = UDim2.new(0, TopBar.Size.X.Offset - 48, 0, 0)
local imageButton = Instance.new("ImageButton", ff_button)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Size = UDim2.new(0, 36, 0, 36)
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
ff_connection = imageButton.Activated:Connect(Flip)
TopBar.Size = UDim2.new(0, OrigSize + 48, 0, TopBar.Size.Y.Offset)
task.wait()
ff_button.Position = UDim2.new(0, TopBar.Size.X.Offset - 48, 0, 0)
task.spawn(function()
pcall(function()
repeat
TopBar.Size = UDim2.new(0, OrigSize + 48, 0, TopBar.Size.Y.Offset)
task.wait()
ff_button.Position = UDim2.new(0, TopBar.Size.X.Offset - 48, 0, 0)
until ff_enabled == false
end)
end)
elseif ff_enabled == false then
if ff_connection then
ff_connection:Disconnect()
ff_connection = nil
end
if ff_button then
ff_button:Destroy()
ff_button = nil
end
TopBar.Size = UDim2.new(0, OrigSize, 0, TopBar.Size.Y.Offset)
end
end










local Tab_12 = Window:CreateTab("Teleport",0)
Tab_12:CreateParagraph({Title = "Teleports", Content = "Teleport to killer / survivors and others."})
function SafeTeleport(model)
pcall(function()
local time = tick()
while tick() - time < 1 do
for i,v in pairs(Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
HumanoidRootPart.CFrame = model.CFrame
task.wait()
end
end)
end
function GetChildNames(model)
local coolbalt = {}
for i,v in pairs(model:GetChildren()) do
if v then
table.insert(coolbalt, tostring(v.Name))
end
end
return coolbalt
end
Tab_12:CreateSection("Team Teleport")
ChoosenKillerTarget = nil
ChoosenSurvivorTarget = nil
ChoosenGhostTarget = nil
local TeleportToKillerDropdown = Tab_12:CreateDropdown({Name = "Target Killer"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenKillerTarget = Rayfield:GetDropdownValue(Value)
end; })
Tab_12:CreateButton({Name = "Teleport to Killer"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model") then
Rayfield:Notification("Error!", "There are no killers!", 3, warn)
return nil
end
if ChoosenKillerTarget == nil or ChoosenKillerTarget == "" or not ChoosenKillerTarget then
Rayfield:Notification("Error!", "Choose your target!", 3, false)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(ChoosenKillerTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer").ChildAdded:Connect(function(child)
pcall(function()
TeleportToKillerDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")))
end)
end)
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToKillerDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")))
end)
end)
local TeleportToSurvivorDropdown = Tab_12:CreateDropdown({Name = "Target Survivor"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenSurvivorTarget = Rayfield:GetDropdownValue(Value)
end; })
Tab_12:CreateButton({Name = "Teleport to Survivor"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChildOfClass("Model") then
Rayfield:Notification("Error!", "There are no survivors!", 3, false)
return nil
end
if ChoosenSurvivorTarget == nil or ChoosenSurvivorTarget == "" or not ChoosenSurvivorTarget then
Rayfield:Notification("Error!", "Choose your target!", 3, warn)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChild(ChoosenSurvivorTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildAdded:Connect(function(child)
pcall(function()
TeleportToSurvivorDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor")))
end)
end)
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToSurvivorDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor")))
end)
end)
local TeleportToGhostDropdown = Tab_12:CreateDropdown({Name = "Target Ghost"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenGhostTarget = Rayfield:GetDropdownValue(Value)
end; })
Tab_12:CreateButton({Name = "Teleport to Ghost"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost"):FindFirstChildOfClass("Model") then
Rayfield:Notification("Error!", "There are no ghosts!", 3, warn)
return nil
end
if ChoosenGhostTarget == nil or ChoosenGhostTarget == "" or not ChoosenGhostTarget then
Rayfield:Notification("Error!", "Choose your target!", 3, false)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost"):FindFirstChild(ChoosenGhostTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost").ChildAdded:Connect(function(child)
pcall(function()
TeleportToGhostDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")))
end)
end)
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToGhostDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")))
end)
end)
Tab_12:CreateSection("Specific Teleports")
Tab_12:CreateButton({Name = "Teleport to Survivor with caretaker"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChildOfClass("Model") then
Rayfield:Notification("Error!", "There are no caretakers!", 3, warn)
return nil
end
local plrwithcaretaker = nil
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):GetChildren()) do
if v and v.Parent and (v:WaitForChild("Vanities"):WaitForChild("Caretaker").Transparency ~= 1 or v:WaitForChild("Vanities"):WaitForChild("Aussie Slouch"):WaitForChild("Mesh").TextureId == "rbxassetid://130388665159057") then
plrwithcaretaker = v
end
end
if plrwithcaretaker then
SafeTeleport(plrwithcaretaker:WaitForChild("HumanoidRootPart"))
else
Rayfield:Notification("Error!", "There are no caretakers!", 3, warn)
end
end; })
Tab_12:CreateButton({Name = "Teleport to Injured survivor"; Callback = function()
local injuredplr = nil
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):GetChildren()) do
if v and v.Parent and (v:WaitForChild("Humanoid").Health < tonumber(v:WaitForChild("Humanoid").MaxHealth)) then
injuredplr = v
end
end
if injuredplr then
SafeTeleport(injuredplr:WaitForChild("HumanoidRootPart"))
else
Rayfield:Notification("Error!", "There are no injured players!", 3, warn)
end
end; })
Tab_12:CreateButton({Name = "Teleport to Bonus Pad"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):FindFirstChild("BonusPad") then
Rayfield:Notification("Error!", "There are no bonus pads!", 3, warn)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):WaitForChild("BonusPad"):WaitForChild("Pad"))
end; })

-- short model/part name
-- m > model
-- p > Part

local PADCOLOR = Color3.fromRGB(100, 255, 57)
Tab_12:CreateButton({Name = "Teleport to CarePad"; Callback = function()
for _, m in ipairs(workspace.GameAssets.Debris.Cleanable:GetChildren()) do
		if m.Name == "BonusPad" then
			local p = m:FindFirstChild("Pad", true)
			if p and p.Color == PADCOLOR then
				SafeTeleport(m:GetBoundingBox()) -- ignore why i use (m:GetBoundingBox()) instead of (m) because i think it gonna get error.
				return
			end
		end
	end
Rayfield:Notification("Error!", "There are no CarePad!", 3)
end; })


Tab_12:CreateButton({Name = "Teleport to CarePad Survivor"; Callback = function()
for _, v in pairs(workspace.GameAssets.Teams:FindFirstChild("Survivor"):GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
	local a1 = v:GetAttribute("Ability1")
	local a2 = v:GetAttribute("Ability2")
	if (a1 == "Caretaker" and a2 == "BonusPad") or (a1 == "BonusPad" and a2 == "Caretaker") then
		if v == Character then return end -- this ignore if you have CarePad so yeah -- Okay red 👌
		SafeTeleport(v.HumanoidRootPart)
		return
	end
end
end
end; })










local Tab_10 = Window:CreateTab("Audio",0)
if HaveWorkspaceAccess() ~= true then
Tab_10:CreateParagraph({Title = "Not Supported", Content = "Your executor doesn't support those functions: workspace access or getcustomasset"})
end
if HaveWorkspaceAccess() then
local LMSes_Backup = game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:Clone()
LMSes_Backup.Name = "LMSSongs"
LMSes_Backup.Parent = game.CoreGui.DOD_Assets
for i,v in next, LMSes_Backup:GetDescendants() do
if v and v:IsA("Sound") and v.Playing == true then
v.Playing = false
end
end
Tab_10:CreateParagraph({Title = "Audio", Content = "Audio Management ( Mostly LMS and chases )"})
Tab_10:CreateSection("Custom LMS")
local suclaoding, errloading = pcall(function()
loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))()
end)
if not suclaoding then
delfile("NexerHub/DieOfDeath/Assets/LMS/data.luau")
task.wait(1)
writefile("NexerHub/DieOfDeath/Assets/LMS/data.luau", "return {}")
end
local getlmsdata = function() return loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))() end
local choosen_lms = ""
local LMS_Audios = Tab_10:CreateDropdown({Name = "LMS Audios"; Options = getlmsdata(); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
choosen_lms = Rayfield:GetDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Reload LMS Audios"; Callback = function()
LMS_Audios:Refresh(getlmsdata())
Rayfield:Notification("Success!","Reloading LMS Audios...",3,true)
end; })
Tab_10:CreateButton({Name = "Set Custom LMS"; Callback = function()
if (choosen_lms == nil or choosen_lms == "") then
Rayfield:Notification("Error!","Choose Audio!",3,warn)
return
end
local temp_table = getlmsdata()
if not table.find(temp_table, choosen_lms) then
Rayfield:Notification("Error!","File isn't added! ( Please reload lms audios and choose again. )",3,false)
return
end
if not IsFile("NexerHub/DieOfDeath/Assets/LMS/"..choosen_lms..".mp3") then
Rayfield:Notification("Error!","File not found! ( Please check ''LMS'' folder and make sure it is here. )",3,false)
return
end
for i,v in next, game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:GetChildren() do
if v and v:IsA("Sound") then
v.SoundId = GetFile("NexerHub/DieOfDeath/Assets/LMS/"..choosen_lms..".mp3","gca")
end
end
Rayfield:Notification("Success!","Set ''"..choosen_lms.."'' as new custom LMS!",4,true)
end; })
Tab_10:CreateButton({Name = "Restore Normal LMS"; Callback = function()
if game:GetService("ReplicatedStorage").Sounds.Songs:FindFirstChild("LMSSongs") then
game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:Destroy()
end
game.CoreGui.DOD_Assets.LMSSongs:Clone().Parent = game:GetService("ReplicatedStorage").Sounds.Songs
Rayfield:Notification("Success!","Restored!",3,true)
end; })
--[[Tab_10:CreateSlider({Name = "LMS Volume ( Restore Normal LMS to Reset )"; Range = {0, 10}; Increment = .5; Suffix = ""; CurrentValue = 1; Callback = function(Value)
for i,v in next, game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:GetChildren() do
if v and v:IsA("Sound") then
local temp_volume = tonumber(Value)
v:GetPropertyChangedSignal("Volume"):Connect(function()
v.Volume = temp_volume
end)
v.Volume = temp_volume
end
end
end; })]]
Tab_10:CreateSection("Custom LMS ( settings )")
local lms_file_name = "Type Here!"
Tab_10:CreateParagraph({Title = "How to add your own music?", Content = "Find your executor's folder in your phone's explorer, then find the ''workspace'' folder, and inside it you must find ''NexerHub'' folder, now go inside it, then click ''DieOfDeath'', ''Assets'' and ''LMS''. And now, in this folder, input your mp3 music."})
Tab_10:CreateInput({Name = "File Name"; PlaceholderText = "Type Here! ( WRITE ONLY NAME, WITHOUT ''.mp3'' )"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
lms_file_name = Rayfield:GetDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Add File"; Callback = function()
if not IsFile("NexerHub/DieOfDeath/Assets/LMS/"..lms_file_name..".mp3") then
Rayfield:Notification("Error!","File not found! ( Did you entered name correctly? Make sure it is mp3. Don't write ''.mp3'' at the end, only the name of the file. )",5,false)
return
end
local temp_table = getlmsdata()
if table.find(temp_table, lms_file_name) then
Rayfield:Notification("Error!","This file is already added!", 3, warn)
return
end
InsertElement("NexerHub/DieOfDeath/Assets/LMS/data.luau", lms_file_name)
Rayfield:Notification("Success!","Added File!",3,true)
end; })
Tab_10:CreateButton({Name = "Remove File"; Callback = function()
local temp_table = getlmsdata()
if not table.find(temp_table, lms_file_name) then
Rayfield:Notification("Error!","File isn't added! ( Did you entered name correctly? )",3,false)
return
end
RemoveElement("NexerHub/DieOfDeath/Assets/LMS/data.luau", lms_file_name)
Rayfield:Notification("Success!","Removed File!",3,true)
end; })
Tab_10:CreateSection("")
Tab_10:CreateSection("")
Tab_10:CreateSection("Custom Chase Themes")
local suclaoding, errloading = pcall(function()
loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))()
end)
if not suclaoding then
delfile("NexerHub/DieOfDeath/Assets/Chases/data.luau")
task.wait(1)
writefile("NexerHub/DieOfDeath/Assets/Chases/data.luau", "return {}")
end
local getchasesdata = function() return loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))() end
local choosen_chase = ""
local Chases_Audios = Tab_10:CreateDropdown({Name = "Chase Themes"; Options = getchasesdata(); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
choosen_chase = Rayfield:GetDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Reload Chase Themes"; Callback = function()
Chases_Audios:Refresh(getchasesdata())
Rayfield:Notification("Success!","Reloading Chase Themes...",3,true)
end; })
Tab_10:CreateButton({Name = "Set Custom Chase Theme"; Callback = function()
if (choosen_chase == nil or choosen_chase == "") then
Rayfield:Notification("Error!","Choose Audio!",3,warn)
return
end
local temp_table = getchasesdata()
if not table.find(temp_table, choosen_chase) then
Rayfield:Notification("Error!","File isn't added! ( Please reload chase themes and choose again. )",3,false)
return
end
if not IsFile("NexerHub/DieOfDeath/Assets/Chases/"..choosen_chase..".mp3") then
Rayfield:Notification("Error!","File not found! ( Please check ''Chases'' folder and make sure it is here. )",3,false)
return
end
for i,v in next, workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):GetDescendants() do
if v and v:IsA("Sound") and v.Name == "ChaseTheme" then
v.SoundId = GetFile("NexerHub/DieOfDeath/Assets/Chases/"..choosen_chase..".mp3","gca")
end
end
Rayfield:Notification("Success!","Set ''"..choosen_chase.."'' as new custom chase!",4,true)
end; })
Tab_10:CreateSection("Custom Chase Themes ( settings )")
local chase_file_name = "Type Here!"
Tab_10:CreateParagraph({Title = "How to add your own music?", Content = "Find your executor's folder in your phone's explorer, then find the ''workspace'' folder, and inside it you must find ''NexerHub'' folder, now go inside it, then click ''DieOfDeath'', ''Assets'' and ''Chases''. And now, in this folder, input your mp3 music."})
Tab_10:CreateInput({Name = "File Name"; PlaceholderText = "Type Here! ( WRITE ONLY NAME, WITHOUT ''.mp3'' )"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
chase_file_name = Rayfield:GetDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Add File"; Callback = function()
if not IsFile("NexerHub/DieOfDeath/Assets/Chases/"..chase_file_name..".mp3") then
Rayfield:Notification("Error!","File not found! ( Did you entered name correctly? Make sure it is mp3. Don't write ''.mp3'' at the end, only the name of the file. )",5,false)
return
end
local temp_table = getchasesdata()
if table.find(temp_table, chase_file_name) then
Rayfield:Notification("Error!","This file is already added!",3,warn)
return
end
InsertElement("NexerHub/DieOfDeath/Assets/Chases/data.luau", chase_file_name)
Rayfield:Notification("Success!","Added File!",3,true)
end; })
Tab_10:CreateButton({Name = "Remove File"; Callback = function()
local temp_table = getchasesdata()
if not table.find(temp_table, chase_file_name) then
Rayfield:Notification("Error!","File isn't added! ( Did you entered name correctly? )",3,false)
return
end
RemoveElement("NexerHub/DieOfDeath/Assets/Chases/data.luau", chase_file_name)
Rayfield:Notification("Success!","Removed File!",3,true)
end; })
end










local Tab_8 = Window:CreateTab("Fun",0)
Tab_8:CreateParagraph({Title = "Fun", Content = "Funny things will be here here soon muehehehe"})
Tab_8:CreateSection("Movement")
Tab_8:CreateToggle({Name = "Frontflip"; CurrentValue = true; Callback = function(Value)
SetFrontFlip(Value)
end; })
SetFrontFlip(true)
Tab_8:CreateButton({Name = "Give yourself stalk"; Callback = function()
local function Stalk()
local function TempAnim(id)
local temp_anim = Instance.new("Animation")
temp_anim.AnimationId = id
return temp_anim
end
local stalk_start = Humanoid:LoadAnimation(TempAnim("rbxassetid://130725432915474"))
local stalk_loop =  Humanoid:LoadAnimation(TempAnim("rbxassetid://102302720518230"))
for i = 1,4 do
if i == 1 then
if not HumanoidRootPart:FindFirstChild("Stalk") then
game:GetService("ReplicatedStorage").Characters.Killer.Pursuer.Avoider.HumanoidRootPart.Stalk:Clone().Parent = HumanoidRootPart
end
else
if not HumanoidRootPart:FindFirstChild("Stalk"..tostring(i)) then
game:GetService("ReplicatedStorage").Characters.Killer.Pursuer.Avoider.HumanoidRootPart["Stalk"..tostring(i)]:Clone().Parent = HumanoidRootPart
end
end
end
local old_ws = 10
local old_ss = 26
Humanoid.Parent:SetAttribute("WalkSpeed",0)
Humanoid.Parent:SetAttribute("SprintSpeed",0)
stalk_start:Play()
for i = 1,2 do
if i == 2 then
task.wait(1.5)
end
local temp_rndm = math.random(1,4)
if temp_rndm == 1 then
HumanoidRootPart["Stalk"]:Play()
else
HumanoidRootPart["Stalk"..tostring(temp_rndm)]:Play()
end
end
task.wait(2)
task.delay(.6, function()
Humanoid.Parent:SetAttribute("WalkSpeed",(old_ws/1.5))
Humanoid.Parent:SetAttribute("SprintSpeed",(old_ss/1.5))
task.wait(1.2)
Humanoid.Parent:SetAttribute("WalkSpeed",27)
Humanoid.Parent:SetAttribute("SprintSpeed",55)
end)
stalk_loop:Play()
for i = 1,10 do
for i,v in next, Humanoid.Parent:GetDescendants() do
if v and v:IsA("BasePart") or v:IsA("SpecialMesh") and v.Name ~= "HumanoidRootPart" then
pcall(function()
v.Transparency += 0.1
end)
end
end
task.wait(.13)
end
stalk_loop:Stop()
ApplyInvisibility(true)
task.wait(10)
ApplyInvisibility(false)
stalk_loop:Play()
Humanoid.Parent:SetAttribute("WalkSpeed",(old_ws/2))
Humanoid.Parent:SetAttribute("SprintSpeed",(old_ss/2))
for i = 1,10 do
for i,v in next, Humanoid.Parent:GetDescendants() do
if v and v:IsA("BasePart") or v:IsA("SpecialMesh") and v.Name ~= "HumanoidRootPart" then
pcall(function()
v.Transparency -= 0.1
end)
end
end
task.wait(.13)
end
task.wait(.5)
stalk_loop:Stop()
Humanoid.Parent:SetAttribute("WalkSpeed",old_ws)
Humanoid.Parent:SetAttribute("SprintSpeed",old_ss)
end
AbilityModule.CreateAbility({Client = true, ClientFunction = Stalk, Name = "Stalk_NH",InputShown = "",Tip = "Turn invisible and gain speed, cant use abilities and a long endlag after.",Cooldown = 15, Icon = "rbxassetid://92577246919936", DisplayName = "Stalk"})
end; })
Tab_8:CreateButton({Name = "Give yourself dash without cooldown"; Callback = function()
local function Dash()
local function TempAnim(id)
local temp_anim = Instance.new("Animation")
temp_anim.AnimationId = id
return temp_anim
end
task.spawn(function()
local dashanim = Humanoid:LoadAnimation(TempAnim("rbxassetid://78278813483757"))
dashanim:Play()
task.delay(.42, function()
dashanim:Stop()
end)
end)
if not HumanoidRootPart:FindFirstChild("DashPE") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Particles.DashPE:Clone().Parent = HumanoidRootPart
end
if not HumanoidRootPart:FindFirstChild("DashPE3") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Particles["DashPE3"]:Clone().Parent = HumanoidRootPart
end
if not HumanoidRootPart:FindFirstChild("DashSmokePE") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Particles.DashSmokePE:Clone().Parent = HumanoidRootPart
end
if not HumanoidRootPart:FindFirstChild("Dash") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Sounds.Dash:Clone().Parent = HumanoidRootPart
end
repeat task.wait() until HumanoidRootPart:FindFirstChild("DashPE")
local function EmitDash()
for i,v in next, HumanoidRootPart:FindFirstChild("DashPE"):GetChildren() do
if v then
v:Emit(2)
end
end
for i,v in next, HumanoidRootPart:FindFirstChild("DashSmokePE"):GetChildren() do
if v then
v:Emit(25)
end
end
HumanoidRootPart:FindFirstChild("DashPE3"):Emit(2)
HumanoidRootPart:FindFirstChild("Dash"):Play()
end
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(1000000,1000,1000000)
BodyVelocity.P = 1250
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .3)
EmitDash()
end
AbilityModule.CreateAbility({Client = true, ClientFunction = Dash, Name = "Dash_NH",InputShown = "",Tip = "Dash foward, and gain no cooldown.",Cooldown = 0, Icon = "rbxassetid://73777691791017",DisplayName = "Dash without cooldown"})
end; })
-- Dont skid baka
function ReplaceModel(Model1, Model2)
if not game.Players:GetPlayerFromCharacter(Model1) then return end
for i,v in pairs(Model1:GetChildren()) do
	if v and game:GetService("ReplicatedStorage").Characters.Killer:FindFirstChild(v.Name, true) then
		if game:GetService("ReplicatedStorage").Characters.Killer:FindFirstChild(v.Name, true):IsA("Model") then
			v:Destroy()
		end
	end
end
local function setnewchanges()
pcall(function()
workspace:SetAttribute("AnimationsEnabled", false)
task.wait()
workspace:SetAttribute("AnimationsEnabled", true)
end)
pcall(function()
for i,v in next, game.Players:GetPlayerFromCharacter(Model1).Character.Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(0)
v:Stop()
end
end)
end
local suit = Model2:Clone()
--[[if suit:FindFirstChild("Humanoid") then
	suit:FindFirstChild("Humanoid").EvaluateStateMachine = false
	if suit.Humanoid:FindFirstChild("Animate") then
		suit.Humanoid:FindFirstChild("Animate"):Destroy()
	end
	if suit.Humanoid:FindFirstChild("Animator") then
		suit.Humanoid:FindFirstChild("Animator"):Destroy()
	end
end
]]
suit.Parent = Model1
for _,item in pairs({"Humanoid", "HumanoidRootPart", "Animate", "Animations"}) do
    local object = suit:FindFirstChild(item)
    if object then
        object:Destroy()
    end
end
for _,item in pairs({"Spear", "CloneTool", "MusicBox", "Speaker", "BackDagger", "Dagger", "Face", "Accessories", "Hands"}) do
    local object = Model1:FindFirstChild(item)
    if object then
        object:Destroy()
    end
end
pcall(function()
	if Model1:FindFirstChild("Torso") and Model1.Torso:FindFirstChild("Decal") then
		Model1.Torso:FindFirstChild("Decal"):Destroy()
	end
end)
local humanoid = Model1:FindFirstChildOfClass("Humanoid")
if not humanoid then return nil end
local partstohide = {}
local suitparts = {}
local function scan(o)
    for _,child in pairs(o:GetChildren()) do
        if child:IsA("BasePart") then
            table.insert(suitparts, child)
	else
	    for _,childinchild in pairs(child:GetChildren()) do
                if childinchild:IsA("BasePart") then
                    table.insert(suitparts, childinchild)    
                end
            end
        end
    end
end
scan(suit)
for _,part in pairs(suitparts) do
local charpart = Model1:FindFirstChild(part.Name)
if charpart and (humanoid.RigType.Name == "R6" or charpart:IsA("BasePart")) then
        local motor = Instance.new("Motor6D")
        motor.Name = "SuitAttachment_"..part.Name
        motor.Part0 = charpart
        motor.Part1 = part
        motor.C0 = CFrame.new()
        motor.C1 = CFrame.new()
        motor.Parent = charpart
        partstohide[charpart] = true
else
        part:Destroy()
end
end
for part in pairs(partstohide) do
part.Transparency = 1
if part:IsA("MeshPart") then
        part.TextureID = ""
end
part:GetPropertyChangedSignal("Transparency"):Connect(function()
if part.Transparency ~= 1 then
part.Transparency = 1
end
if part:IsA("MeshPart") then
part.TextureID = ""
end
end)
end
local checkedchildren = {}
for i,v in pairs(Model1.HumanoidRootPart:GetChildren()) do
	if v.Name ~= "RootJoint" then
		table.insert(checkedchildren, v.Name)
	end
end
for i,v in pairs(Model2.HumanoidRootPart:GetChildren()) do
	if v.Name ~= "RootJoint" and table.find(checkedchildren, v.Name) and v:IsA("Sound") then
		Model1.HumanoidRootPart[v.Name].SoundId = v.SoundId
	end
end

if Model2:FindFirstChild("Animations") then
checkedchildren = {}
for i,v in pairs(Model1.Animations:GetChildren()) do
	table.insert(checkedchildren, v.Name)
end
for i,v in pairs(Model2.Animations:GetChildren()) do
	if table.find(checkedchildren, v.Name) and v:IsA("Sound") then
		Model1.Animations[v.Name].SoundId = v.SoundId
	elseif table.find(checkedchildren, v.Name) and v:IsA("Animation") then
		Model1.Animations[v.Name].AnimationId = v.AnimationId
	end
end
end
setnewchanges()
end
function GetKillerModelByName(name)
for i,v in next, game:GetService("ReplicatedStorage").Characters.Killer:GetChildren() do
if v and v:IsA("Folder") and v:FindFirstChild(name) and v:FindFirstChild(name):IsA("Model") then
return v:FindFirstChild(name)
end
end
return nil
end
Tab_8:CreateLabel("Experimental Features")
local KillerAppearance = "MISO"
Tab_8:CreateInput({Name = "Custom Appearance ( put any killer skin name here )"; PlaceholderText = "MISO"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
KillerAppearance = Rayfield:GetDropdownValue(Value)
end; })
Tab_8:CreateButton({Name = "Change your appearance"; Callback = function()
if GetKillerModelByName(KillerAppearance) == nil then
Rayfield:Notification("Error!","Incorrect killer name.",3,warn)
return
end
ReplaceModel(workspace.GameAssets.Teams:FindFirstChild(game.Players.LocalPlayer.Name, true), GetKillerModelByName(KillerAppearance))
end; })
Tab_8:CreateButton({Name = "Change current killer(s) appearance"; Callback = function()
if GetKillerModelByName(KillerAppearance) == nil then
Rayfield:Notification("Error!","Incorrect killer name.",3,warn)
return
end
for i,v in next, workspace.GameAssets.Teams.Killer:GetChildren() do
if v then
ReplaceModel(v, GetKillerModelByName(KillerAppearance))
end
end
end; })










local Tab_9 = Window:CreateTab("Other",0)
Tab_9:CreateParagraph({Title = "Other", Content = "Other random thingiez"})
local RayfieldGuiTheme = "Amethyst"
Tab_9:CreateDropdown({Name = "Gui Theme"; Options = {"Amethyst","Default","AmberGlow","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}; CurrentOption = RayfieldGuiTheme; MultiSelection = false; Callback = function(Value)
RayfieldGuiTheme = Rayfield:GetDropdownValue(Value)
Window.ModifyTheme(RayfieldGuiTheme)
end; })
Tab_9:CreateButton({Name = "Show Ping"; Callback = function()
local function PowerDebug()
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.ID.Visible = true
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.PlaceVersion.Visible = true
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.Ping.Visible = true
while task.wait(1) do
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.ID.Text = "Information Powered by "..((_G.dod_developer_key ~= nil and _G.dod_developer_key) or "Unknown").." Hub"
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.PlaceVersion.Text = "Place Version: "..game.PlaceVersion..""
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.Ping.Text = "Ping: "..tonumber(math.round(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), "(")[1])).."ms (round-trip)"
end
end
task.spawn(PowerDebug)
end; })
Tab_9:CreateButton({Name = "Close Hub"; Callback = function()
DestroyRayfield()
end; })
