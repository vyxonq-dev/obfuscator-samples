local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local winvar = lib:NewWindow("LOL")

local Tab = winvar:NewSection("Ownership")

local Ex1 = "Part"

local EX2 = "Handle"

local c1 = 0

local c2 = 0

local c3 = 0

local c4 = 0

local c5 = 0

local c6 = 0

local e = 0.5

local txt = "Test"

local T1 = false

local T2 = false
local adm = "iFueekedEveryone"
Tab:CreateButton("Allow Edit(Require)",function()
                 require(game.ReplicatedStorage.raidRoleplay.Configuration).Admins = adm
                 end)
Tab:CreateButton("GetOwnerShip", function()

                 for _,v in ipairs(workspace:GetDescendants()) do

  local p ={[1]=game.ReplicatedStorage.raidRoleplay.Modules.PartOwnership,[2]={[1]=v}

}

game.ReplicatedStorage.raidRoleplay.Events.EscalateEvent:FireServer(unpack(p))

end

end)

Tab:CreateButton("Specific Class Ownership",function()

                 for _,v in ipairs(workspace:GetDescendants()) do

  if v:IsA(Ex1) then

  local p ={[1]=game.ReplicatedStorage.raidRoleplay.Modules.PartOwnership,[2]={[1]=v}

}

game.ReplicatedStorage.raidRoleplay.Events.EscalateEvent:FireServer(unpack(p))

end

end

end)

Tab:CreateButton("Specific Name Ownership",function()

                 for _,v in ipairs(workspace:GetDescendants()) do

  if table.find({Ex2}, v.Name) then

  local p ={[1]=game.ReplicatedStorage.raidRoleplay.Modules.PartOwnership,[2]={[1]=v}

}

game.ReplicatedStorage.raidRoleplay.Events.EscalateEvent:FireServer(unpack(p))

end

end

end)

local Tab2 = winvar:NewSection("Inputs")

Tab2:CreateTextbox("Specific Class", function(j)

                   Ex1 = tostring(j)

                   end)

Tab2:CreateTextbox("Specific Name",function(j)

                   Ex2 = tostring(j)

end)

Tab2:CreateTextbox("Title Name", function(j)

                   txt = tostring(j)

                   end)
local des = 0.05
Tab2:CreateTextbox("Rainbow Effect Speed", function(ap)
                   des = tonumber(ap/20)
                   end)
Tab2:CreateTextbox("Admin Prompt Player", function(vh)
                   adm = tostring(vh)
                   end)
                                  
local Tab3 = winvar:NewSection("Toggle")

Tab3:CreateToggle("Glitch",function(A)

                  T1 = A

                  while T1 do

                  task.wait()

c1 = math.random(0,1000)/1000

c2 = math.random(0,1000)/1000

c3 = math.random(0,1000)/1000

c4 = math.random(0,1000)/1000

c5 = math.random(0,1000)/1000

c6 = math.random(0,1000)/1000

e = math.random(0,1000)/1000

local args = {

	game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Modules"):WaitForChild("SetName"),	txt,	Color3.new(c1, c2, c3),

	Color3.new(c4, c5, c6),

	Enum.Font.Code,

[6]=e

}

game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Events"):WaitForChild("EscalateEvent"):FireServer(unpack(args))

task.wait()

local args = {

	game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Modules"):WaitForChild("SetName"),

	txt,

	Color3.new(c2, c1, c3),

	Color3.new(c5, c4, c6),

	Enum.Font.Antique,

      [6]=e }

game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Events"):WaitForChild("EscalateEvent"):FireServer(unpack(args))

task.wait()

local args = {

	game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Modules"):WaitForChild("SetName"),

	txt,

	Color3.new(x, z, x),

	Color3.new(c, a, d),

	Enum.Font.SciFi,

	e

}

game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Events"):WaitForChild("EscalateEvent"):FireServer(unpack(args))

task.wait()

local args = {

	game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Modules"):WaitForChild("SetName"),

	txt,

	Color3.new(c3, c1, c2),

	Color3.new(c4, c6, c5),

	Enum.Font.SourceSansItalic,

	e

}

game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Events"):WaitForChild("EscalateEvent"):FireServer(unpack(args))

task.wait()

local args = {

	game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Modules"):WaitForChild("SetName"),

	txt,

	Color3.new(c2, c3, c1),

	Color3.new(c6, c4, c5),

	Enum.Font.PermanentMarker,

	e

}

game:GetService("ReplicatedStorage"):WaitForChild("raidRoleplay"):WaitForChild("Events"):WaitForChild("EscalateEvent"):FireServer(unpack(args))

if T1 == false then break end

end

end)

function RGB(h,s,v)

local r,g,b = 0,0,0

local i = math.floor(h/60) % 6

local f = h / 60 - math.floor(h/60)

local p = v*(1-s)

local q = v*(1-f*s)

local t = v*(1-(1-f)*s)

if i == 0 then 

r,g,b = v,t,p

elseif i == 1 then 

r,g,b = q,v,p

elseif i == 2 then

r,g,b = p,v,t

elseif i == 3 then 

r,g,b = p,q,v

elseif i == 4 then

r,g,b = t,v,p

elseif i == 5 then 

r,g,b = v,p,q

return math.floor(r*255), math.floor(g*255), math.floor(b*255)

end

end

local T3 = false

local hue = 0

Tab3:CreateToggle("Rainbow",function(ap)
                  T2 = ap
                  while T2 do
task.wait()
local make = {[1]=game.ReplicatedStorage.raidRoleplay.Modules.SetName,
              [2]=txt,
              [3]=Color3.fromHSV(hue,1,1),
              [4]=Color3.new(0,0,0),
              [5]=Enum.Font.SourceSansItalic,
              [6]=0.85
}
game.ReplicatedStorage.raidRoleplay.Events.EscalateEvent:FireServer(unpack(make))
if T2 == false then break end end end)
local bruh = false 
Tab3:CreateToggle("Rainbow#2",function(io)
                  bruh = io
                  while bruh do
                  task.wait()
local make = {[1]=game.ReplicatedStorage.raidRoleplay.Modules.SetName,
              [2]=txt,
              [3]=Color3.new(0,0,0),
              [4]=Color3.fromHSV(hue,1,1),
              [5]=Enum.Font.SourceSansItalic,
              [6]=0.85
}
game.ReplicatedStorage.raidRoleplay.Events.EscalateEvent:FireServer(unpack(make))
if bruh == false then break end end end)
Tab3:CreateToggle("Rainbow effect",function(v)

T3 = v

while T3 do

local speed = 0.01 -- How fast the color changes

    hue = hue + speed

    if hue > 1 then

        hue = hue - 1

 end  

task.wait(des)

if T3 == false then break end

end

end)

                
local Tab4 = winvar:NewSection("reanim")

local rea = false

local char2 ="iFueekedEveryone"

Tab4:CreateButton("Setup",function()

local args = {

	"CreatePart",	"Normal",

	CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),

	workspace

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SetName",

	{

		workspace:WaitForChild("Part")

	},

	"lol1"

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"CreatePart",

	"Normal",

	CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),

	workspace

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SetName",

	{

		workspace:WaitForChild("Part")

	},

	"lol2"

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"CreatePart",

	"Normal",

	CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),

	workspace

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SetName",

	{

		workspace:WaitForChild("Part")

	},

	"lol3"

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"CreatePart",

	"Normal",

	CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),

	workspace

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SetName",

	{

		workspace:WaitForChild("Part")

	},

	"lol4"

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"CreatePart",

	"Normal",

	CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),

	workspace

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SetName",

	{

		workspace:WaitForChild("Part")

	},

	"lol5"

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"CreatePart",

	"Normal",

	CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),

	workspace

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SetName",

	{

		workspace:WaitForChild("Part")

	},

	"lol6"

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local args = {

	"SyncCollision",

	{

		{

			Part = workspace:WaitForChild("lol1"),

			CanCollide = false

		},

		{

			Part = workspace:WaitForChild("lol2"),

			CanCollide = false

		},

		{

			Part = workspace:WaitForChild("lol3"),

			CanCollide = false

		},

		{

			Part = workspace:WaitForChild("lol4"),

			CanCollide = false

		},

		{

			Part = workspace:WaitForChild("lol5"),

			CanCollide = false

		},

		{

			Part = workspace:WaitForChild("lol6"),

			CanCollide = false

		}

	}

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

end)

Tab4:CreateButton("Kill upon touch",function()

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local partToListenTo = player.Character:WaitForChild("HumanoidRootPart")

local function onTouch(otherPart)

    local touchingPlayer = Players:GetPlayerFromCharacter(otherPart.Parent)

    if touchingPlayer and touchingPlayer ~= player then

        local args = {

	"Remove",

	{

		touchingPlayer.Character.Head

	}

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

    end

end

partToListenTo.Touched:Connect(onTouch)

end)

Tab4:CreateTextbox("Player",function(txt)

char2 = tostring(txt)

end)

Tab4:CreateToggle("Reanimate", function(v1)

t1= v1

local args = {

	[1]="SyncMaterial",

	[2]={

		[1]={

			Part = game.Players:FindFirstChild(char2).Character.Head,

			Transparency = 1

		},

[2]={

			Part = game.Players:FindFirstChild(char2).Character.Torso,

			Transparency = 1

		},

[3]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Left Arm"),

			Transparency = 1

		},

[4]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Right Arm"),

			Transparency = 1

		},

[5]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Left Leg"),

			Transparency = 1

		},

[6]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Right Leg"),

			Transparency = 1

		}

	}

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

local l1 = "HumanoidRootPart"

local l2 = "Left Arm"

local l3 = "Right Arm"

local l4 = "Left Leg"

local l5 = "Right Leg"

local l6 = "Head"

while t1 do task.wait() 

local args = {

	"SyncResize",

	{

		[1]={

			Part = workspace:WaitForChild("lol1"),

			CFrame = game.Players:FindFirstChild(char2).Character:WaitForChild(l1).CFrame,

			Size = vector.create(2.01, 2.01, 1.01)

		},

[2]={

			Part = workspace:WaitForChild("lol2"),

			CFrame = game.Players:FindFirstChild(char2).Character:WaitForChild(l2).CFrame,

			Size = vector.create(1.01, 2.01, 1.01)

		},

[3]={

			Part = workspace:WaitForChild("lol3"),

			CFrame = game.Players:FindFirstChild(char2).Character:WaitForChild(l3).CFrame,

			Size = vector.create(1.01, 2.01, 1.01)

		},

[4]={

			Part = workspace:WaitForChild("lol4"),

			CFrame = game.Players:FindFirstChild(char2).Character:WaitForChild(l4).CFrame,

			Size = vector.create(1.01, 2.01, 1.01)

		},

[5]={

			Part = workspace:WaitForChild("lol5"),

			CFrame = game.Players:FindFirstChild(char2).Character:WaitForChild(l5).CFrame,

			Size = vector.create(1.01, 2.01, 1.01)

		},

[6]={

			Part = workspace:WaitForChild("lol6"),

			CFrame = game.Players:FindFirstChild(char2).Character:WaitForChild(l6).CFrame,

			Size = vector.create(1.25, 1.25, 1.25)

		}

	}

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

if rea == false then 

local args = {

	[1]="SyncMaterial",

	[2]={

		[1]={

			Part = game.Players:FindFirstChild(char2).Character.Head,

			Transparency = 0

		},

[2]={

			Part = game.Players:FindFirstChild(char2).Character.Torso,

			Transparency = 0

		},

[3]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Left Arm"),

			Transparency = 0

		},

[4]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Right Arm"),

			Transparency = 0

		},

[5]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Left Leg"),

			Transparency = 0

		},

[6]={

			Part = game.Players:FindFirstChild(char2).Character:WaitForChild("Right Leg"),

			Transparency = 0

		}

	}

}

game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Building Tools"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))

break 

end

end

end)
               

  