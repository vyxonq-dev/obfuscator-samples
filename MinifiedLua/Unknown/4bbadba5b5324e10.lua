if not getgenv().AutoDribbleSettings then getgenv().AutoDribbleSettings={
    Enabled = true,
    range = 22
}
    end
local S,R,P,U=getgenv().AutoDribbleSettings,game:GetService"ReplicatedStorage",game:GetService"Players",game:GetService"RunService"
local L=P.LocalPlayer or P.PlayerAdded:Wait() 
local function initCharacter()
    local C=L.Character or L.CharacterAdded:Wait()
    local H=C:WaitForChild"HumanoidRootPart"
    local M=C:WaitForChild"Humanoid"
    return C,H,M
end
local C,H,M=initCharacter()
L.CharacterAdded:Connect(function(newChar)
    C,H,M=initCharacter() 
end)
local B=R.Packages.Knit.Services.BallService.RE.Dribble
local A=require(R.Assets.Animations)
local G=function(s)if not A.Dribbles[s]then return nil end local I=Instance.new"Animation";I.AnimationId=A.Dribbles[s];return M and M:LoadAnimation(I)end
local T=function(p)if p==L then return false end local c=p.Character;if not c then return false end local V=c.Values and c.Values.Sliding;if V and V.Value==true then return true end local h=c:FindFirstChildOfClass"Humanoid";if h and h.MoveDirection.Magnitude>0 and h.WalkSpeed==0 then return true end return false end
local O=function(p)if not L.Team or not p.Team then return false end return L.Team~=p.Team end
local D=function(d)if not S.Enabled or not C.Values.HasBall.Value then return end B:FireServer()local s=L.PlayerStats.Style.Value;local t=G(s);if t then t:Play();t:AdjustSpeed(math.clamp(1+(10-d)/10,1,2))end local F=workspace:FindFirstChild"Football";if F then F.AssemblyLinearVelocity=Vector3.new();F.CFrame=C.HumanoidRootPart.CFrame*CFrame.new(0,-2.5,0)end end
U.Heartbeat:Connect(function()if not S.Enabled or not C or not H then return end for _,p in pairs(P:GetPlayers())do if O(p)and T(p)then local r=p.Character and p.Character:FindFirstChild"HumanoidRootPart";if r then local d=(r.Position-H.Position).Magnitude;if d<S.range then D(d);break end end end end end)
-- GUI Code (Added at the End)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local RangeLabel = Instance.new("TextLabel")
local RangeInput = Instance.new("TextBox")
local OnLabel = Instance.new("TextLabel") -- Green "ON" Label

-- Parent GUI to PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame Properties
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Size = UDim2.new(0, 200, 0, 120) -- Increased height for "ON" label
Frame.Position = UDim2.new(0, 50, 0, 100)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)

-- Title
Title.Parent = Frame
Title.Text = "Legit Auto Dribble"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

-- Range Label
RangeLabel.Parent = Frame
RangeLabel.Position = UDim2.new(0, 10, 0, 40)
RangeLabel.Size = UDim2.new(0, 180, 0, 20)
RangeLabel.Text = "Range: " .. tostring(S.range)
RangeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
RangeLabel.BackgroundTransparency = 1
RangeLabel.Font = Enum.Font.SourceSansBold
RangeLabel.TextSize = 16

-- Range Input
RangeInput.Parent = Frame
RangeInput.Position = UDim2.new(0, 10, 0, 60)
RangeInput.Size = UDim2.new(0, 180, 0, 30)
RangeInput.Text = tostring(S.range)
RangeInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
RangeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
RangeInput.Font = Enum.Font.SourceSansBold
RangeInput.TextSize = 18
RangeInput.ClearTextOnFocus = false

-- Green "ON" Label
OnLabel.Parent = Frame
OnLabel.Position = UDim2.new(0, 10, 0, 95) -- Positioned below input
OnLabel.Size = UDim2.new(0, 180, 0, 20)
OnLabel.Text = "ON"
OnLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green color
OnLabel.BackgroundTransparency = 1
OnLabel.Font = Enum.Font.SourceSansBold
OnLabel.TextSize = 18

-- Update Range on Input Change
RangeInput.FocusLost:Connect(function()
    local newRange = tonumber(RangeInput.Text)
    if newRange and newRange > 0 then
        S.range = newRange
        RangeLabel.Text = "Range: " .. tostring(newRange)
    else
        RangeInput.Text = tostring(S.range) -- Reset if invalid input
    end
end)