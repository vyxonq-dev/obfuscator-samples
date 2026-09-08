--!strict
-- // Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")

-- // Imports
local CameraShaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/AllAssetsForRecent/refs/heads/main/CameraShaker.lua"))()
local SharedFramework = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/AllAssetsForRecent/refs/heads/main/SharedFramework.lua"))()

-- // Variables
local Effects = game:GetService("ReplicatedStorage").WR.RS.Effects

local Logger = SharedFramework.CreateLogger()

local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local Live = workspace.Live

local GuiInset: Vector2 = select(2, GuiService:GetGuiInset())

local CamShaker = CameraShaker.new(Enum.RenderPriority.Camera.Value + 1, function(ShakeCFrame: CFrame)
	CurrentCamera.CFrame *= ShakeCFrame
end)
CamShaker:Start()

-- // Exports
local ClientFramework = setmetatable({}, {
	__index = SharedFramework
})

function ClientFramework.GetHitbox(HitboxCFrame: CFrame, HitboxSize: Vector3): {Model}
	local FilterList: {Instance} = {}
	for _, Child in Live:GetChildren() do
		if not Child:IsA("Model") or not Child:FindFirstChildOfClass("Humanoid") or Child == LocalPlayer.Character then
			continue
		end

		local HumanoidRootPart = Child:FindFirstChild("HumanoidRootPart"):: Part
		if not HumanoidRootPart then
			continue
		end

		table.insert(FilterList, HumanoidRootPart)
	end

	--Framework.Effect("Hitbox", HitboxCFrame, HitboxSize)

	local OverlapParameters = OverlapParams.new()
	OverlapParameters.FilterDescendantsInstances = FilterList
	OverlapParameters.FilterType = Enum.RaycastFilterType.Include

	local HitParts = workspace:GetPartBoundsInBox(HitboxCFrame, HitboxSize, OverlapParameters)
	local HitCharacters = {}
	for _, Part in HitParts do
		table.insert(HitCharacters, Part.Parent)
	end

	return HitCharacters
end

function ClientFramework.Shake(Preset: string, Position: Vector3?, Distance: number?)
	local PlayerData = LocalPlayer:FindFirstChild("PlayerData")
	local CameraShakeValue = PlayerData and PlayerData:FindFirstChild("CameraShake"):: BoolValue
	if CameraShakeValue and not CameraShakeValue.Value then
		return
	end
	
	if Position and Distance then
		local Character = LocalPlayer.Character
		if not Character then
			return
		end
		
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart"):: Part
		if not HumanoidRootPart or (HumanoidRootPart.Position - Position).Magnitude >= Distance then
			return
		end
	end
	
	CamShaker:Shake(CameraShaker.Presets[Preset])
end

function ClientFramework.GetMouseData(): (BasePart?, Vector3)
	local filterOut = {workspace.Effects, workspace.ServerEffects, workspace.Projectiles, LocalPlayer.Character}
	for _, obj in pairs(workspace.Live:GetDescendants()) do
		if obj.Name == "SUBubble" then
			table.insert(filterOut, obj)
		end
	end
	local RaycastParameters = RaycastParams.new()
	RaycastParameters.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParameters.FilterDescendantsInstances = filterOut
	
	local MouseLocation = UserInputService:GetMouseLocation()
	local RayObject = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y + GuiInset.Y)
	local RaycastResult = workspace:Raycast(RayObject.Origin, RayObject.Direction * 1000, RaycastParameters)
	if RaycastResult then
		return RaycastResult.Instance, RaycastResult.Position
	end

	return nil, RayObject.Origin + RayObject.Direction * 1000
end

local EffectCache: {[string]: (...any) -> ...any} = {}
function ClientFramework.Effect(Path: string, ...: any)
	local CachedEffect = EffectCache[Path]
	if CachedEffect then
		task.spawn(ClientFramework.SafeCall, CachedEffect, ...)
		return
	end

	local Module = ClientFramework.GetObjectFromPath(Path, Effects)
	if not Module then
		Logger(2, "Effect %q does not exist", Path)
		return
	end

	if not Module:IsA("ModuleScript") then
		Logger(3, "Effect %q is not a ModuleScript", Path)
		return
	end

	local Success, Content = ClientFramework.SafeCall(require, Module)
	if not Success then
		return
	end

	if typeof(Content) ~= "function" then
		Logger(3, "Effect %q does not return a function", Path)
		return
	end

	EffectCache[Path] = Content
	task.spawn(ClientFramework.SafeCall, Content, ...)
end

function ClientFramework.GetMousePosition(): Vector3
	local Target: Model? = shared.Target
	local TargetRootPart: Part? = Target and Target:FindFirstChild("HumanoidRootPart"):: Part
	if Target and Target.Parent and TargetRootPart then
		return TargetRootPart.Position
	end

	return select(2, ClientFramework.GetMouseData())
end

function ClientFramework.RemoveBodyPhysics(RootPart:BasePart)
	
	for _,v in RootPart:GetChildren() do

		if v:IsA("BodyPosition") or v:IsA("BodyGyro") then
			if v.Name == "Client" then
				v:Destroy()
			end
		end

	end
end

do
	local function CreateSound(Template: Sound, Parent: Instance, Properties: {[string]: any}?)
		local Sound = Template:Clone()
		if Properties then
			for Key, Value in Properties do
				(Sound:: any)[Key] = Value
			end
		end

		Sound.Parent = Parent
		Sound:Play()

		Sound.Ended:Once(function()
			local Parent = Sound.Parent
			Sound:Destroy()

			if Parent and Parent:GetAttribute("SoundPart") and #Parent:GetChildren() == 0 then
				Parent:Destroy()
			end
		end)

		return Sound
	end

	function ClientFramework.Sound(Template: Sound | {Sound}, Parent: Instance, Properties: {[string]: any}?)
		if typeof(Template) == "table" then
			for _, Sound in Template do
				CreateSound(Sound, Parent, Properties)
			end

			return
		end

		CreateSound(Template, Parent, Properties)
	end

	function ClientFramework.SoundPart(Template: Sound | {Sound}, Position: Vector3, Properties: {[string]: any}?)
		local Attachment = Instance.new("Attachment")
		Attachment.Position = Position
		Attachment.Parent = workspace.Terrain

		Attachment:SetAttribute("SoundPart", true)

		ClientFramework.Sound(Template, Attachment, Properties)
	end
end

return ClientFramework
