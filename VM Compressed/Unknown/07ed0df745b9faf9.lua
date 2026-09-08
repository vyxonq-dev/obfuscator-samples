local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken
G2L["AbilityForsaken_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["AbilityForsaken_1"]["Name"] = [[AbilityForsaken]];
G2L["AbilityForsaken_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Tags
CollectionService:AddTag(G2L["AbilityForsaken_1"], [[main]]);

-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability1
G2L["Ability1_2"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability1_2"]["BorderSizePixel"] = 0;
G2L["Ability1_2"]["BackgroundTransparency"] = 1;
-- G2L["Ability1_2"]["ImageContent"] = ;
G2L["Ability1_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability1_2"]["Image"] = [[rbxassetid://129077533212750]];
G2L["Ability1_2"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability1_2"]["Name"] = [[Ability1]];
G2L["Ability1_2"]["Position"] = UDim2.new(0.55004, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability2
G2L["Ability2_3"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability2_3"]["BorderSizePixel"] = 0;
G2L["Ability2_3"]["BackgroundTransparency"] = 1;
-- G2L["Ability2_3"]["ImageContent"] = ;
G2L["Ability2_3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability2_3"]["Image"] = [[rbxassetid://77707049887484]];
G2L["Ability2_3"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability2_3"]["Name"] = [[Ability2]];
G2L["Ability2_3"]["Position"] = UDim2.new(0.64039, 0, 0.59509, 0);

G2L["Sprint_5"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Sprint_5"]["BorderSizePixel"] = 0;
G2L["Sprint_5"]["BackgroundTransparency"] = 1;
-- G2L["Sprint_5"]["ImageContent"] = ;
G2L["Sprint_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Sprint_5"]["Image"] = [[rbxassetid://132640025048316]];
G2L["Sprint_5"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Sprint_5"]["Name"] = [[Ability4]];
G2L["Sprint_5"]["Position"] = UDim2.new(0.82108, 0, 0.25, 0);
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local aa =
loadstring(game:HttpGet("https://raw.githubusercontent.com/ProudNamed/SuperLightning/refs/heads/main/AnimModule/MainModule"))()
if not getgenv()["Animator"] then
loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end
local a
local id
local i = 101187934796631
local idle = true
local cidle = 78101760974946
local ccidle = false
local walk = 129809765506966
local walking = false
local run = 97917754365808
local run1 = false
local run2 = false
local sprint = false
local stab = 73186501998283
local stabby = false
local ability= false
local cstart = 115862477523101
local cwalk = 89719119049960
local cwalking = false
local cstop = 138562535765161
local togglecrouch = false
local crouchy = false
local crouchhy = false
local goddamncrouch = false
local goddamncrouch1 = false
local ws = 10
local cws = 5
local char = game.Players.LocalPlayer.Character
local hum = char:FindFirstChild("Humanoid")
local uis = game:GetService("UserInputService")
local anim = game:GetObjects("rbxassetid://" .. i)[1]
anim.Parent = char
id = i
a = aa.new(char, anim)
a.Looped = true 
a:Play()
hum.WalkSpeed = ws
local overchargevel = Instance.new("VectorForce")
overchargevel.Parent = char.HumanoidRootPart
overchargevel.Attachment0 = char.HumanoidRootPart.RootAttachment
overchargevel.Enabled = false
overchargevel.Force = Vector3.new(0, 0, -10000)
--hum.Animator:Destroy()
--char.Animate:Destroy()

G2L["Sprint_5"]["MouseButton1Click"]:Connect(function()
run1 = not run1
if run1 then
     run2 = true
     hum.WalkSpeed = 27.50
     else
     run2 = false
     hum.WalkSpeed = ws
     end
end)

G2L["Ability1_2"]["MouseButton1Click"]:Connect(function()
if stabby == false and ability== false then
     a:Stop()
     ability= true
     goddamncrouch = false
     crouchy =false
     togglecrouch= false
     G2L["Sprint_5"]["Visible"] = true;
     stabby = true
     hum.WalkSpeed = 0
     wait(.50)
     overchargevel.Enabled = true
     wait(.100)
      overchargevel.Enabled = false
     ability= false
     stabby = false
     if run2 == false then
     hum.WalkSpeed = ws
     end
     if run2 == true then
     hum.WalkSpeed = 27.5
         end
     end
end)

G2L["Ability2_3"]["MouseButton1Click"]:Connect(function()
if ability== false then
togglecrouch = not togglecrouch
    if togglecrouch then 
     run2 = false
     G2L["Sprint_5"]["Visible"] = false;
     goddamncrouch = true
     crouchhy = true
     hum.WalkSpeed = cws
     wait(.750)
     goddamncrouch= false
     crouchy = true
     else
     G2L["Sprint_5"]["Visible"] = true;
     a:Stop()
     crouchy= false
     hum.WalkSpeed = 0
     anim = game:GetObjects("rbxassetid://"..cstop)[1]
     a = aa.new(char, anim)
     a.Looped = false
     a:Play()
     id = cstop
     wait(1)
     hum.WalkSpeed = ws  
     end 
  end
end)

while wait() do
if idle == true and ability== false and sprint== false and walking == false then
     if id ~= i then 
          a:Stop()
          anim = game:GetObjects("rbxassetid://"..i)[1]
          a = aa.new(char,anim)
          a.Looped = true 
          a:Play()
          id = i
          end
end
if walking== true and idle == false and sprint == false and ability== false then
     if id ~= walk then 
          a:Stop()
          anim = game:GetObjects("rbxassetid://"..walk)[1]
          a = aa.new(char,anim)
          a.Lopped = true
          a:Play()
          id = walk
          end
end
if sprint == true and idle == false and ability== false and walking== false then
     if id ~= sprint then 
          a:Stop()
          anim = game:GetObjects("rbxassetid://"..run)[1]
          a = aa.new(char, anim)
          a.Looped = true
          a:Play()
          id = sprint
          end
     end 
if ccidle == true and cwalking == false and ability== false then
     if id ~= cidle then 
          a:Stop()
          anim = game:GetObjects("rbxassetid://"..cidle)[1]
          a = aa.new(char,anim)
          a.Looped = true
          a:Play()
          id = cidle
          end
end
if cwalking == true and ccidle == false and ability== false then 
     if id ~= cwalk then 
          a:Stop()
          anim = game:GetObjects("rbxassetid://"..cwalk)[1]
          a = aa.new(char,anim)
          a.Looped = true 
          a:Play()
          id = cwalk
          end 
     end
if hum.MoveDirection ~= Vector3.new(0,0,0) and run2 == true and ability == false then
     idle = false
     walking = false
     sprint = true
     end
if hum.MoveDirection ~= Vector3.new(0,0,0) and ability == false and run2 == false and crouchy == false then 
     idle= false 
     walking = true 
     sprint = false 
     end
if hum.MoveDirection ~= Vector3.new(0,0,0) and crouchy == true then 
     ccidle = false
     cwalking = true
     end 
if hum.MoveDirection == Vector3.new(0,0,0) and crouchy == true then
     ccidle = true
     cwalking = false
end
if hum.MoveDirection == Vector3.new(0,0,0) and crouchy == false then
     ccidle = false
     idle = true
     cwalking = false
     walking= false
     sprint = false
end
if stabby == true then
     if id ~= stab then
          a:Stop()
          anim = game:GetObjects("rbxassetid://"..stab)[1]
          a = aa.new(char, anim)
          a.Looped = false
          a:Play()
          id = stab
          end
     end 
if goddamncrouch== true then
    if id ~= cstart then
      a:Stop()
      hum.WalkSpeed = 0
      anim = game:GetObjects("rbxassetid://"..cstart)[1]
      a = aa.new(char,anim)
      a.Looped = false
      a:Play()
      id = cstart
      wait(.625)
      a:Stop()
      hum.WalkSpeed = cws
      end 
   end
end
return G2L["AbilityForsaken_1"], require;