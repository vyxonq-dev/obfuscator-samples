--[[ AVISO: Use por sua conta e risco ]]--

local PRIVATE_MODEL_ID = 84194316352503

-- SERVICOS
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

-- JOGADOR
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- VELOCIDADES
local WALK_SPEED = 7.5
local RUN_SPEED = 28

-- SUAVIZACAO
local SPEED_TRANSITION_TIME = 0.25
local MOVE_CONFIRM_DELAY = 0.12
local ANIM_COOLDOWN = 0.1

-- ESTADOS
local RunMode = false
local RagingMode = false
local UsingAbility = false
local currentAnim
local lastAnimTime = 0
local movingSince = 0
local speedTween
local originalWalkSpeed

-- NOTIFICACAO
StarterGui:SetCore("SendNotification",{
	Title = "Animator 6d not mine",
	Text = "Made by Mr eyes",
	Duration = 6
})

-- CARREGAR Animator6D
if not getgenv().Animator6DLoadedPro then
	loadstring(game:HttpGet(
		"https://raw.githubusercontent.com/gObl00x/Stuff/refs/heads/main/Animator6D.lua"
	))()
	repeat task.wait() until getgenv().Animator6DLoadedPro
end

-- CARREGAR MODELO
local model = game:GetObjects("rbxassetid://"..PRIVATE_MODEL_ID)[1]
assert(model,"Falha ao carregar modelo")

-- ESCANEAR ANIMACOES
local Animations = {}
local function scan(o)
	if o:IsA("KeyframeSequence") then
		table.insert(Animations,o)
	end
	for _,c in ipairs(o:GetChildren()) do
		scan(c)
	end
end
scan(model)

-- ATRIBUICOES BASICAS
local OriginalIdleKF = Animations[33]
local OriginalWalkKF = Animations[34]
local OriginalRunKF = Animations[35]

local IdleKF = OriginalIdleKF
local WalkKF = OriginalWalkKF
local RunKF = OriginalRunKF
local JumpKF
local SitKF

for _,a in ipairs(Animations) do
	local n = a.Name:lower()
	if n:find("jump") then JumpKF = a
	elseif n:find("sit") then SitKF = a
	end
end

-- ATUALIZAR KFS
local function UpdateKFs()
	if RagingMode then
		IdleKF = Animations[40]
		WalkKF = Animations[37]
		RunKF = nil
	else
		IdleKF = OriginalIdleKF
		WalkKF = OriginalWalkKF
		RunKF = OriginalRunKF
	end
end

-- FUNCAO PARA OBTER DURACAO DA KF
local function GetKFLength(kf)
	local maxTime = 0
	for _, keyframe in ipairs(kf:GetChildren()) do
		if keyframe.Time > maxTime then
			maxTime = keyframe.Time
		end
	end
	return maxTime
end

-- TOCAR ANIMACAO COM OPCOES
local function PlayAnim(num, looped, audioId, dash, lock)
	local kf = Animations[num]
	if not kf then return end
	
	if lock == nil then lock = true end
	
	if lock then
		UsingAbility = true
		originalWalkSpeed = Humanoid.WalkSpeed
		Humanoid.WalkSpeed = 0
		RootPart.Anchored = true
	else
		UsingAbility = false
	end
	
	getgenv().Animator6DStop()
	task.wait(0.03)
	getgenv().Animator6D(kf, 1, looped ~= false)
	currentAnim = kf
	lastAnimTime = tick()
	
	local sound
	if audioId then
		sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://" .. audioId
		sound.Parent = Character:FindFirstChild("Head") or Character.PrimaryPart
		sound:Play()
		if num ~= 36 then
			sound.Ended:Connect(function()
				sound:Destroy()
			end)
		end
	end
	
	if dash then
		local direction = RootPart.CFrame.LookVector
		RootPart.Anchored = false
		RootPart.AssemblyLinearVelocity = direction * 50
		task.wait(0.2)
		RootPart.AssemblyLinearVelocity = Vector3.new(0, RootPart.AssemblyLinearVelocity.Y, 0)
		if lock then
			RootPart.Anchored = true
		end
	end
	
	if not looped then
		task.wait(GetKFLength(kf))
		if sound and num ~= 36 then
			sound:Destroy()
		end
		if lock then
			UsingAbility = false
			Humanoid.WalkSpeed = originalWalkSpeed
			RootPart.Anchored = false
		end
		if num == 36 then
			RagingMode = true
		else
			RagingMode = false
		end
		UpdateKFs()
		Play(IdleKF, true)
	end
end

-- SUAVIZAR VELOCIDADE
local function SmoothSpeed(target)
	if speedTween then speedTween:Cancel() end
	speedTween = TweenService:Create(
		Humanoid,
		TweenInfo.new(SPEED_TRANSITION_TIME,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
		{WalkSpeed = target}
	)
	speedTween:Play()
end

local function ApplySpeed()
	local target = RagingMode and WALK_SPEED or (RunMode and RUN_SPEED or WALK_SPEED)
	SmoothSpeed(target)
end

-- TOCAR ANIMACAO BASICA
local function Play(kf,looped)
	if currentAnim == kf then return end
	if tick()-lastAnimTime < ANIM_COOLDOWN then return end
	lastAnimTime = tick()
	getgenv().Animator6DStop()
	task.wait(0.03)
	getgenv().Animator6D(kf,1,looped~=false)
	currentAnim = kf
end

-- MODO CORRIDA
local function SetRunMode(v)
	RunMode = v
	ApplySpeed()
end

-- MANIPULADOR DE INPUT
UserInputService.InputBegan:Connect(function(i, gp)
	if gp then return end
	
	if i.KeyCode == Enum.KeyCode.LeftShift or i.KeyCode == Enum.KeyCode.RightShift then
		SetRunMode(not RunMode)
		return
	end
	
	if UsingAbility then return end
	
	if i.KeyCode == Enum.KeyCode.T or i.UserInputType == Enum.UserInputType.MouseButton1 then
		PlayAnim(46, false)
	elseif i.KeyCode == Enum.KeyCode.Q then
		PlayAnim(47, false, 127781343273877, true)
	elseif i.KeyCode == Enum.KeyCode.E then
		PlayAnim(49, false, 85365894642945)
	elseif i.KeyCode == Enum.KeyCode.R then
		PlayAnim(36, false, 127781343273877)
	elseif i.KeyCode == Enum.KeyCode.Z then
		PlayAnim(39, false)
	elseif i.KeyCode == Enum.KeyCode.One then
		PlayAnim(42, false, 134476689658544)
	elseif i.KeyCode == Enum.KeyCode.Two then
		PlayAnim(44, false)
	end
end)

-- VELOCIDADE INICIAL
Humanoid.WalkSpeed = WALK_SPEED

-- SISTEMA DE MOVIMENTO
RunService.RenderStepped:Connect(function()
	if UsingAbility then
		return
	end

	local moving = Humanoid.MoveDirection.Magnitude > 0

	if Humanoid.Sit and SitKF then
		Play(SitKF,true)
		return
	end

	if Humanoid.FloorMaterial==Enum.Material.Air and JumpKF then
		Play(JumpKF,false)
		return
	end

	if moving then
		if movingSince==0 then movingSince=tick() end
		if tick()-movingSince>=MOVE_CONFIRM_DELAY then
			if RunMode and RunKF then
				Play(RunKF,true)
			else
				Play(WalkKF,true)
			end
		end
	else
		movingSince=0
		Play(IdleKF,true)
	end
end)

-- RESPAWN
Player.CharacterAdded:Connect(function(c)
	Character=c
	Humanoid=c:WaitForChild("Humanoid")
	RootPart = c:WaitForChild("HumanoidRootPart")
	Humanoid.WalkSpeed=WALK_SPEED
	RagingMode = false
	UpdateKFs()
end)
