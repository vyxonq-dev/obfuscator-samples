local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "T-R Hub | DandyWorld",IntroText = "T-R Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local pl = game.Players.LocalPlayer
local char = pl.Character
local humanoid = char:WaitForChild("Humanoid")

local table = {
    speed = 0
}

local Section = tab:AddSection({
	Name = "Section 1: Player"
})

tab:AddSlider({
	Name = "Walk speed",
	Min = 0,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	ValueName = "Walk speed",
	Callback = function(Value)
            table.speed = Value
	end    
})


local on = false

tab:AddButton({
    Name = "Change walk speed",
    Callback = function(bool)
            while  Wait() do
                humanoid.WalkSpeed = table.speed
            end
    end

})

local Section = tab:AddSection({
	Name = "Section 2: Visuals"
})

local runservice = game:GetService("RunService")
local esp = Instance.new("Highlight")
local bbgui = Instance.new("BillboardGui")
local textzl = Instance.new("TextLabel")
bbgui.StudsOffsetWorldSpace = Vector3.new(0, 1, 0)
bbgui.Name = "ggui"
textzl.Name = "Textzzz"
textzl.Parent = bbgui
esp.Name = "hl"
esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
esp.OutlineTransparency = 1

tab:AddButton({
    Name = "Items, Monsters, And generators esp (OLD)",
    Callback = function()

       for _,k in pairs(game.Workspace.CurrentRoom:GetChildren()) do
        if k:IsA("Model") then
            local room = k
            for _,v in pairs(room:FindFirstChild("Items"):GetChildren()) do
                local folder = v
                runservice.Heartbeat:Connect(function()
                    for _, v in pairs(folder:GetChildren()) do
                        repeat Wait() until v
                        if not v:FindFirstChild("hl") then
                            local hlclone = esp:Clone()
                            hlclone.Adornee = v
                            hlclone.Parent = v
                        end
                    end
                end)
            end
        end
       end

	   for _,k in pairs(game.Workspace.CurrentRoom:GetChildren()) do
        if k:IsA("Model") then
            local room = k
            for _,v in pairs(room:FindFirstChild("Generators"):GetChildren()) do
                local folder = v
                runservice.Heartbeat:Connect(function()
                    for _, v in pairs(folder:GetChildren()) do
                        repeat Wait() until v
                        if not v:FindFirstChild("hl") then
                            local hlclone = esp:Clone()
                            hlclone.Adornee = v
                            hlclone.Parent = v
                        end
                    end
                end)
            end
        end
       end

	   for _,k in pairs(game.Workspace.CurrentRoom:GetChildren()) do
        if k:IsA("Model") then
            local room = k
            for _,v in pairs(room:FindFirstChild("Monsters"):GetChildren()) do
                local folder = v
                runservice.Heartbeat:Connect(function()
                    for _, v in pairs(folder:GetChildren()) do
                        repeat Wait() until v
                        if not v:FindFirstChild("hl") then
                            local hlclone = esp:Clone()
                            hlclone.Adornee = v
                            hlclone.Parent = v
                        end
                    end
                end)
            end
        end
       end
        
    end
})

local highlightN = Instance.new("Highlight")
highlightN.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlightN.OutlineColor = Color3.fromRGB(255, 255, 255)
highlightN.OutlineTransparency = 0
highlightN.FillTransparency = 0.5

tab:AddButton({
    Name = "Players esp",
    Callback = function()
        _G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

--------------------------------------------------------------------
local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(1, 2, 1)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = false
Box.Visible = false

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 15
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

if _G.Reantheajfdfjdgs then
    return
end

_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end
    end
end

    end
})

local Section = tab:AddSection({
	Name = "Section 3: Parts & stuff"
})

local alreadydone = false

tab:AddButton({
    Name = "Remove Monsters (DO NOT USE. unless if you want a challenge)",
    Callback = function()
		if alreadydone == false then
			OrionLib:MakeNotification({
				Name = "Section 3 Notification",
				Content = "Removed monsters and good luck!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		   for _,k in pairs(game.Workspace.CurrentRoom:GetChildren()) do
			if k:IsA("Model") then
				local room = k
				for _,v in pairs(room:FindFirstChild("Monsters"):GetChildren()) do
					repeat Wait() until v
					if v then
						v:Destroy()
					end
				end
			end
		   end
		   alreadydone = true
		else
			OrionLib:MakeNotification({
				Name = "Section 3 Notification",
				Content = "Monsters already removed!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
    end
})

local Tab2 = Window:MakeTab({
	Name = "Miscellaneous",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddButton({
	Name = "Fullbright",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DismissedTriang/Triangle/refs/heads/main/Fullbright%20for%20my%20scripts"))()
        OrionLib:MakeNotification({
            Name = "Wuh oh!",
            Content = "The fullbright with turn off if you press it again",
            Image = "rbxassetid://11745872952",
            Time = 5
        })
        
        --[[
        Title = <string> - The title of the notification.
        Content = <string> - The content of the notification.
        Image = <string> - The icon of the notification.
        Time = <number> - The duration of the notfication.
        ]]
  	end    
})

Tab2:AddLabel("I Dunno if FB is miscellaneous or not")

Tab2:AddButton({
	Name = "Infinite yield (I.Y)",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  	end    
})

local creds = Window:MakeTab({
	Name = "CREDITS",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

creds:AddLabel("Library made by         : ORION LIBARY")
creds:AddLabel("Original script made by : R4yhub")
creds:AddLabel("Modified and scripter by: DismissedTriang")
creds:AddLabel("I modified sections, buttons, esps, and tabs. Credits to who made the script and")
creds:AddLabel("the orion library developers/owners")


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

