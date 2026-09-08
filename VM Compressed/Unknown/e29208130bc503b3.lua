print("VERSION: 0.0.1 Test 02-02") --version!!!
print("Creator: Aedaniss7 on scriptblox")
local Moveset="T"
local ms=loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Utilities/refs/heads/main/TSB/MovesetsV3.lua"))()
ms:ReqChr("Saitama" --[[Cyborg]])
ms:ChrSel("SHAPELESS PRIME", 6005761509, "Inspired by the edit of SHAPELESS PRIME on yt", function()
  spawn(function()
            local folder="AeSGR/" --start :D
local songP="PRIME.mp3" 
local rbxlP="PRIME V2.rbxl"
local songURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.mp3"
local rbxlURL="https://raw.githubusercontent.com/softbf395/SGPrime-Moveset/refs/heads/main/PRIME.rbxm"
function runScript(source, origin)
  local Run=source:gsub("script", origin:GetFullName())
    spawn(function()
      loadstring(Run)()
    end)
end
function TypewriterText2(Text, TL, ttf)
  spawn(function()
      TL.Text=Text
      TL.MaxVisibleGraphemes=0
      local tss=game:GetService("TweenService")
      tss:Create(TL, TweenInfo.new(ttf, Enum.EasingStyle.Linear), {MaxVisibleGraphemes=string.len(Text)}):Play()
    end)
end
function saveFilee(path, content, useURLV)
  local useURL = useURLV or false
  if not isfile(path) then
    local savingUI=Instance.new("ScreenGui")
    savingUI.Parent=game.Players.LocalPlayer.PlayerGui
    local savingText=Instance.new("TextLabel")
    savingText.Text=""
    savingText.BackgroundColor3=Color3.new(0,0,0)
    savingText.BorderColor3=Color3.new(1,1,1)
    savingText.BorderSizePixel=5
    savingText.Font=Enum.Font.Jura
    savingText.Size=UDim2.new(1,0,0.3,0)
    savingText.TextXAlignment=Enum.TextXAlignment.Left
    TypewriterText2("Downloading " ..folder..path.."...", savingText, 1)
    if useURL == true then
      writefile(folder..path, game:HttpGet(content))
    else
      writefile(folder..path, content)
    end
    savingUI:Destroy()
  end
end
function spawnRBXL(path)
  local ins=getcustomasset(folder..path)
  return game:GetObjects(ins)[1]
end
saveFilee(songP, songURL, true)
saveFilee(rbxlP, rbxlURL, true)
local PRIME=spawnRBXL(rbxlP)
PRIME.Torso.BottomPiece.WeldConstraint.Part1=PRIME.Torso.BottomPiece
PRIME.PrimaryPart=PRIME.HumanoidRootPart
PRIME.PrimaryPart.Anchored=true
PRIME.Parent=workspace
local inv=PRIME.inv
PRIME.Head.title.TextLabel.Visible=true
PRIME:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
PRIME.Head.title.TextLabel.GUI.Enabled=false
PRIME.Head.title.TextLabel.LocalScript.Enabled=false
local chr = game.Players.LocalPlayer.Character
inv.Parent=game.Players.LocalPlayer.PlayerGui
game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled=false
local VIM = game:GetService("VirtualInputManager")
for i, v in ipairs(inv.Keybinds:GetChildren()) do
    local keyName = string.upper(v.Name)
    v.MouseButton1Click:Connect(function() VIM:SendKeyEvent(true, keyName, false, nil)
    wait(0.1)
    VIM:SendKeyEvent(false, keyName, false, nil) end)
end
if game:GetService("UserInputService").TouchEnabled==false then
  inv.Keybinds:Destroy()
end
PRIME.Head.Particles.Parent=chr.Head
PRIME.Head.title.Parent=chr.Head
PRIME.Torso.BottomPiece.Parent=chr.Torso
PRIME.WingsPRIME.Parent=chr
chr.Torso.BottomPiece.WeldConstraint.Part0=chr.Torso
chr.Torso.BottomPiece.WeldConstraint.Part1=chr.Torso.BottomPiece
PRIME:Destroy()
local humanoid = chr:FindFirstChildOfClass("Humanoid")

--local SFXM1=ms:SFX(false, "url", "path")
--local SFXM2=ms:SFX(false, "url", "path")
--local SFXM3=ms:SFX(false, "url", "path")
--local SFXM4=ms:SFX(false, "url", "path")
local music=Instance.new("Sound", workspace)
music.SoundId=getcustomasset(folder..songP)
music.Looped=true
music.Volume = 5
music:Play()
local ts = game:GetService("TweenService")

-- R6 Body Parts
local torso = chr:FindFirstChild("Torso")
local rightArm = chr:FindFirstChild("Right Arm")
local leftArm = chr:FindFirstChild("Left Arm")
local rightLeg = chr:FindFirstChild("Right Leg")
local leftLeg = chr:FindFirstChild("Left Leg")

-- R6 Motor6Ds
local rootJoint = torso:FindFirstChild("RootJoint") -- Connects Torso to HRP
local rightShoulder = torso:FindFirstChild("Right Shoulder")
local leftShoulder = torso:FindFirstChild("Left Shoulder")
local rightHip = torso:FindFirstChild("Right Hip")
local leftHip = torso:FindFirstChild("Left Hip")

-- Tween Function
local function tweenC0(motor, targetC0, duration)
    if motor then
        local tween = ts:Create(motor, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {C0 = targetC0})
        tween:Play()
    end
end

local isIdle = false
local animation=Instance.new("Animation")
animation.AnimationId="rbxassetid://73949048256257"
animation = humanoid:LoadAnimation(animation)
animation.Looped=true
game:GetService("RunService").RenderStepped:Connect(function()
    if humanoid.MoveDirection.Magnitude < 0.1 then
        if not isIdle then
            isIdle = true
            
            -- Floating 3 studs above ground
           animation:Play()
        end
    else
        if isIdle then
            isIdle = false
            -- Reset Position
            animation:Stop()
        end
    end
end) -- fixed



ms:Ult("Turn Normal", Color3.fromRGB(255,255,255), function() print("Ult Activated!") end)
ms:Create("1", --[[move ID, 1 to 15]] function()
  wait(0.2)
    local colors = {Color3.fromRGB(255, 255, 0), Color3.fromRGB(128, 0, 128)} -- Yellow, Purple
local color = colors[math.random(1, #colors)]

  local blast = Instance.new("Part")
    blast.Color=color
    blast.Shape=Enum.PartType.Ball
    blast = blast:UnionAsync({blast})
    blast.CanCollide=false
    blast.Material="Neon"
    blast.Anchored=true
    blast.CFrame=torso.CFrame
    blast.Parent=workspace
    local ts=game:GetService("TweenService")
    ts:Create(blast, TweenInfo.new(1), {Size=Vector3.new(5,5,10), CFrame=torso.CFrame + torso.CFrame.LookVector*5}):Play()
    wait(1)
    ts:Create(blast, TweenInfo.new(0.5), {Size=Vector3.new(0,0,10)}):Play()
    wait(0.5)
    blast:Destroy()
end, --[[Callback for when used]] 2, --[[Cooldown for custom moves]] "Blast.")
chr.Head.title.TextLabel.LocalScript.Enabled=true
chr.Head.title.TextLabel.GUI.Enabled=true
for _, v in ipairs(chr:GetDescendants()) do
  if v:IsA("LocalScript") and v.Parent~=chr then
    runScript(v.Source, v)
  end
end
for _, v in ipairs(chr.WingsPRIME:GetChildren()) do
  if v:IsA("BasePart") then v.CanCollide=false end
end
chr.Torso.BottomPiece.WeldConstraint:Destroy()
chr.Torso.BottomPiece.Anchored=true
runScript([[
  local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
  local ts = game:GetService("TweenService")
  while wait() do
    -- Get the current CFrame of the parent
    local currentCFrame = script.Parent.Parent.CFrame
    -- Create a new CFrame with the same position but offset by -3 on the Y axis
    local newCFrame = currentCFrame * CFrame.new(0, -2.9, 0)
    -- Apply the new CFrame using Tween
    ts:Create(script.Parent, ti, {CFrame = newCFrame}):Play()
  end
]], chr.Torso.BottomPiece.p1)
spawn(function() --the wing animations--
    wait(3)
    chr.WingsPRIME:SetAttribute("SpeedZ", 12)
    wait(50)
    local maxGlitches=10
    while maxGlitches>0 do
      chr.WingsPRIME:SetAttribute("SpeedZ", 12)
      wait(1.8)
      chr.WingsPRIME:SetAttribute("SpeedZ", -5)
      maxGlitches-=1
      wait(0.2)
    end
    chr.WingsPRIME:SetAttribute("SpeedZ", 12)
end)
local CD={
  Z=20,
  X=15,
  C=10,
  F=50
}
local uis=game:GetService("UserInputService")
local isFlying=false
local FlyTime=20
local MaxFlyTime=20
local XP=0
local maxXP=1
local XPGain=10
local Stats=inv.Stats
local MaxSpeed=Stats.SPEED
local XPBar=Stats.XP
local FlyTimeBar=Stats.FT
local LEVEL=1
local LVL=Stats.LEVEL
if not isfile("SGP/XPLVL.txt") then
  writefile("SGP/XPLVL.txt", "0|1")
  else
    local split=readfile("SGP/XPLVL.txt"):split("|")
    XP=tonumber(split[1])
     LEVEL=tonumber(split[2])
end
FlyTime=20+(20*(LEVEL-1))
XPBar.TextLabel.Text="XP: 0/10"
spawn(function()
    while task.wait() do
      humanoid.WalkSpeed=16*LEVEL
    end
end)
spawn(function()
    while wait() do
      LVL.TextLabel.Text="LEVEL "..LEVEL.."/100"
      XPBar.TextLabel.Text="XP: "..XP.."/"..maxXP
      maxXP=10+(XPGain*LEVEL)
      FlyTimeBar.TextLabel.Text="FLY TIME: "..FlyTime.."/"..MaxFlyTime
      MaxFlyTime=20+(20*(LEVEL-1))
      if isFlying==false and FlyTime<MaxFlyTime then FlyTime+=0.1 end
      LVL.Current.Size=UDim2.new(LEVEL/100,0,1,0)
      FlyTimeBar.Current.Size=UDim2.new(FlyTime/MaxFlyTime,0,1,0)
      XPBar.Current.Size=UDim2.new(XP/maxXP,0,1,0)
      MaxSpeed.TextLabel.Text="MAX SPEED: "..humanoid.WalkSpeed.."/"..16*100
      MaxSpeed.Current.Size=UDim2.new(humanoid.WalkSpeed/16*100,0,1,0)
      if XP>=maxXP then
        XP-=maxXP
        LEVEL+=1
         delfile("SGP/XPLVL.txt")
                writefile("SGP/XPLVL.txt", XP.."|"..LEVEL)
      end
   end
  end)
local humanoids={[humanoid]=true}
spawn(function()
    while wait() do
      for _, plr in ipairs(workspace.Live:GetChildren()) do
          if plr:FindFirstChild("Humanoid") then
          if plr.Humanoid.Health<=0 then
            if not humanoids[plr.Humanoid] then
              humanoids[plr.Humanoid]=true
              if (humanoid.Parent.Head.Position - plr.Head.Position).Magnitude<=15 then
                XP+=XPGain
                delfile("SGP/XPLVL.txt")
                writefile("SGP/XPLVL.txt", XP.."|"..LEVEL)
              end
            end
          end
        end
      end
    end
  end)
local cam=workspace.CurrentCamera
humanoid.Died:Connect(function()
    music:Destroy()
end)
uis.InputBegan:Connect(function(input, typing)
    local ismobile = uis.TouchEnabled
    if typing then return end
    if ismobile then
      if inv.Keybinds[input.KeyCode.Name] then
        inv.Keybinds[input.KeyCode.Name].Active=false
        inv.Keybinds[input.KeyCode.Name].CD.Size=UDim2.new(1,0,-1,0)
        game:GetService("TweenService"):Create(inv.Keybinds[input.KeyCode.Name].CD, TweenInfo.new(CD[input.KeyCode.Name]), {Size=UDim2.new(1,0,0,0)}):Play()
        spawn(function() wait(CD[input.KeyCode.Name]) inv.Keybinds[input.KeyCode.Name].Active=false end)
      end
    end
        
    if input.KeyCode==Enum.KeyCode.Z then
      VIM:SendKeyEvent(true, "One", false, nil)
      wait(0.1)
      VIM:SendKeyEvent(false, "One", false, nil)
    elseif input.KeyCode==Enum.KeyCode.X then
      VIM:SendKeyEvent(true, "Two", false, nil)
      wait(0.1)
      VIM:SendKeyEvent(false, "Two", false, nil)
      elseif input.KeyCode==Enum.KeyCode.C then
      VIM:SendKeyEvent(true, "Three", false, nil)
      wait(0.1)
      VIM:SendKeyEvent(false, "Three", false, nil)
    elseif input.KeyCode==Enum.KeyCode.F then
      isFlying=not isFlying
      local dirFly = cam.CFrame.LookVector
      local speed = 0
      if isFlying and FlyTime>2 then
        while isFlying==true do
          if speed < 100 then
            speed += 5
          end
          humanoid.Parent.HumanoidRootPart.Velocity = cam.CFrame.LookVector * speed
          wait(0.1)
          if FlyTime>0 then
            FlyTime-=0.1
          else
            isFlying=false
          end
        end
      else
        isFlying=false
      end
    end
 end)
wait(51)
local cam = workspace.CurrentCamera
local CC=Instance.new("ColorCorrectionEffect", game.Lighting)
ts:Create(cam, TweenInfo.new(1), {FieldOfView=30}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=1}):Play()
wait(1)
CC.Saturation=-1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=50}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
wait(1)
wait(20)
CC.Brightness=1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=70}):Play()
ts:Create(CC, TweenInfo.new(0), {Saturation=0}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
wait(10)
CC.Brightness=1
CC.Saturation=-1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=50}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
wait(10)
CC.Brightness=1
ts:Create(cam, TweenInfo.new(1), {FieldOfView=70}):Play()
ts:Create(CC, TweenInfo.new(0), {Saturation=0}):Play()
ts:Create(CC, TweenInfo.new(1), {Brightness=0}):Play()
      end)

  end)
