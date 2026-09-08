repeat task.wait(0.1) until game:IsLoaded() and game:GetService("Players").LocalPlayer

local ca = Instance.new("ScreenGui", game:GetService("CoreGui"))
ca.Name = "ca"
ca.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
frame.Position = UDim2.fromScale(0.161, 0.422)
frame.Size = UDim2.fromOffset(211, 100)
frame.Active = true
frame.Draggable = true
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
textLabel.Text = "cashauara"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 14
textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.fromScale(0.0237, 0)
textLabel.Size = UDim2.fromOffset(200, 31)
textLabel.Parent = frame
local textButton = Instance.new("TextButton")
textButton.Name = "TextButton"
textButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
textButton.Text = "enable"
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.TextSize = 14
textButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
textButton.BorderSizePixel = 0
textButton.Position = UDim2.fromScale(0.232, 0.41)
textButton.Size = UDim2.fromOffset(112, 44)
textButton.Parent = frame
frame.Parent = ca

task.wait()

local Player = game:GetService("Players").LocalPlayer
local Drops = workspace.Ignored.Drop
local E, A = false, false

if (not Player.Character) or (not Player.Character:FindFirstChild("FULLY_LOADED_CHAR")) then 
	repeat task.wait(0.5) until Player.Character and Player.Character:FindFirstChild("FULLY_LOADED_CHAR")
	task.wait(1)
end

local a=game:GetService("ReplicatedStorage").MainEvent;local b={"CHECKER_1","TeleportDetect","OneMoreTime"}local c;c=hookmetamethod(game,"__namecall",function(...)local d={...}local self=d[1]local e=getnamecallmethod()local f=getcallingscript()if e=="FireServer"and self==a and table.find(b,d[2])then return end return c(...)end)


textButton.MouseButton1Click:Connect(function()
	if (textButton.Text == "enable") then 
		textButton.Text = "disable"
		E = true
	elseif (textButton.Text == "disable") then 
		textButton.Text = "enable"
		E = false
	end
end)

spawn(function()
	while true and task.wait(0.15) do 
		if (E == true) then 
			for i,v in pairs(Drops:GetChildren()) do 
				if (v.Name == "MoneyDrop") and (v.Position - Player.Character.HumanoidRootPart.Position).magnitude <= 12 then 
					if (A == false) then 
						A = true
						repeat task.wait()
							for i,z in pairs(Player.Character:GetChildren()) do 
								if z:IsA("Tool") then 
									z.Parent = Player.Backpack
								end
							end
							workspace.Camera.CameraType = Enum.CameraType.Scriptable
							workspace.Camera.CFrame = CFrame.lookAt( (v.Position+Vector3.new(math.random(-0.3, 0.3), 2, math.random(-0.3, 0.3))), v.Position)
							game:GetService("VirtualInputManager"):SendMouseButtonEvent((workspace.Camera.ViewportSize.X/2), (workspace.Camera.ViewportSize.Y/2), 0, true, game, 1)
							task.wait(0.15)
							game:GetService("VirtualInputManager"):SendMouseButtonEvent((workspace.Camera.ViewportSize.X/2), (workspace.Camera.ViewportSize.Y/2), 0, false, game, 1)
						until (not v) or (v.Parent == nil) or (v.Position - Player.Character.HumanoidRootPart.Position).magnitude > 12
						A = false
						workspace.Camera.CameraType = Enum.CameraType.Custom
						workspace.Camera.CameraSubject = Player.Character.Humanoid
					end
				end
			end
		end
	end
end)
