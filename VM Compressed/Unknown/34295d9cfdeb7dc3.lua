__VERSION = '1.0'





-- Variables
local ESP = Instance.new(
    "Folder",
    workspace
) ESP.Name = "ESP"
local ESPPC = Instance.new(
    "Folder",
    workspace
) ESPPC.Name = "ESPComputer"
function GetSizeOfObject(Obj)
    if Obj:IsA("BasePart") then
        return Obj.Size
    elseif Obj:IsA("Model") then
        return Obj:GetExtentsSize()
    end
end
function CreateESPPart(BodyPart,r,g,b)
    local ESPPartparent = BodyPart
    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = GetSizeOfObject(ESPPartparent) + Vector3.new(0.1, 0.1, 0.1)
    Box.Name = "ESPPart"
    Box.Adornee = ESPPartparent
    Box.Color3 = Color3.fromRGB(r,g,b)
    Box.AlwaysOnTop = true
    Box.ZIndex = 5
    Box.Transparency = 0.4
    Box.Parent = ESP
    if BodyPart.Parent.Name == game.Players.LocalPlayer.Name then
        Box:remove()
        spawn (function()
            while true do
                wait(0.1)
                if BodyPart ~= nil then
                    Box:remove()
                end
            end
        end)
    end
end
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod() == "FireServer" and tostring(Self) == "RemoteEvent" and Args[1] == "ReportPhysicsFPS" then
        return wait(math.huge)
    end
    return OldNameCall(...)
end)
local function WalkSpeedBypass()
  local gmt = getrawmetatable(game)
  setreadonly(gmt, false)
  local oldIndex = gmt.__Index
  gmt.__Index = newcclosure(function(self, b)
    if b == 'WalkSpeed' then
      return 16
    end
    return oldIndex(self, b)
  end)
end
local BeastColor = Color3.new(255, 0, 0)
local InoccentColor = Color3.new(255, 255, 255)
local CreateEsp = function()
  for _, v in pairs(game:GetService('Players'):GetChildren()) do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
      local Esp = Instance.new('Highlight', v.Character)
      Esp.Name = 'EspPlayer'
      Esp.FillTransparency = 0.5
    end
  end
end
local UpdateEsp = function()
  for _, v in pairs(game:GetService('Players'):GetChildren()) do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
      if v.Character:findFirstChild('BeastPowers') then
        v.Character.EspPlayer.FillColor = BeastColor
      else
        v.Character.EspPlayer.FillColor = InoccentColor
      end
    end
  end
end
local Map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local plr = game:GetService("Players").LocalPlayer
local chr = plr.Character
local hum = chr.Humanoid
local hrp = chr.HumanoidRootPart



-- Libray settings
getgenv().SecureMode = true
local ArrayField = loadstring(game:HttpGet('https://pastebin.com/raw/z3Z3ea99'))()
local Window = ArrayField:CreateWindow({
   Name = "H-Hub | "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
   LoadingTitle = "H-Hub",
   LoadingSubtitle = "by H-Man",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "__H-Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "no invite link",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "H-Hub",
      Subtitle = "Key System",
      Note = "Subscribe to H-Man",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = true,
      Actions = {
            [1] = {
                Text = 'Click here to copy key',
                OnPress = function()
                    setclipboard([[https://link-target.net/953678/get-key]])
                end,
                }
            },
      Key = {"https://pastebin.com/raw/Z7XhfMYW"}
   }
})
wait(.5)
for _, v in pairs(game:GetService('CoreGui'):GetDescendants()) do
	if v:IsA('ScreenGui') and v.Name == 'H-Hub' then
		v.Main.Topbar.Type.ImageTransparency = 1 wait(.1)
        v.Main.Topbar.BackgroundColor3 = Color3.new(0.058823, 0.007843, 0.494117) wait(.1) v.Main.Topbar.CornerRepair.BackgroundColor3 = Color3.new(0.058823, 0.007843, 0.494117) wait(.1) v.Main.Topbar.Divider.BackgroundColor3 = Color3.new(0.007843, 0.333333, 0.6) wait(.25) 
        v.Main.Topbar.Type.Image = 'http://www.roblox.com/asset/?id=7733993211'
        v.Main.Topbar.Type.ImageTransparency = 0
	end
end


-- code
local WelcomeTab = Window:CreateTab("// Welcome //", 14203785111)
local WelcomeSection = WelcomeTab:CreateSection("// Welcome To H-Hub //", false)
local Label = WelcomeTab:CreateLabel("Welcome to H-Hub, "..game.Players.LocalPlayer.Name)
local Label = WelcomeTab:CreateLabel("Hub version: ".. __VERSION)
local Label = WelcomeTab:CreateLabel("Made by H-Man")





local FarmingTab = Window:CreateTab("// Main //", 13501204139)
local PlayerSection = FarmingTab:CreateSection("// Player //", false)
local Toggle = FarmingTab:CreateToggle({
   Name = "Never Fail Hacking",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(state)
       NeverFallHack = state
       if NeverFallHack then
           while wait() and NeverFallHack do
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(
                    "SetPlayerMinigameResult",
                    true
                )
           end
       end
   end,
})


-- Noclip toggle variable
local noclipEnabled = false

-- Function to enable noclip
local function noclip()
    Clip = false
    local function Nocl()
        if Clip == false and game.Players.LocalPlayer.Character then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA('BasePart') and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
        wait(0.21) -- Basic optimization
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

-- Function to disable noclip
local function clip()
    if Noclip then
        Noclip:Disconnect()
    end
    Clip = true
end

-- Create a toggle for Noclip
local NoclipToggle = FarmingTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        noclipEnabled = Value
        if noclipEnabled then
            noclip()
            game.StarterGui:SetCore("SendNotification", {Title="Player", Text="Noclip enabled", Duration=5})
        else
            clip()
            game.StarterGui:SetCore("SendNotification", {Title="Player", Text="Noclip disabled", Duration=5})
        end
    end,
})

local Toggle = FarmingTab:CreateToggle({
   Name = "No Slow",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(state)
       NoSlow = state
       if NoSlow then
           WalkSpeedBypass()
           while wait(.5) and NoSlow do
               if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 16 then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
               end
           end
       end
   end,
})

local Toggle = FarmingTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump
 
if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
 
	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Slider = FarmingTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local PlayerSection = FarmingTab:CreateSection("// Esp //", false)
local Toggle = FarmingTab:CreateToggle({
   Name = "Player Esp",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(state)
       PlayerEsp = state
       if PlayerEsp then
          CreateEsp()
          while wait() and PlayerEsp do
            UpdateEsp()
          end
       else
         for _, x in pairs(workspace:GetDescendants()) do
           if x:IsA('Highlight') and x.Name == 'EspPlayer' then
             x:Destroy()
           end
         end
       end
   end,
})

local Toggle = FarmingTab:CreateToggle({
   Name = "Computer Esp",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(state)
       ComputerEsp = state
       if ComputerEsp then
            local map = workspace:findFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
            local children = map:GetChildren()
                for i =1, #children do
                if children[i].Name == "ComputerTable" then
                    local Box = Instance.new("BoxHandleAdornment")
                    Box.Size = GetSizeOfObject(children[i].Screen) + Vector3.new(-0.5, -0.5, -0.5)
                    Box.Name = "ESPPart"
                    Box.Adornee = children[i].Screen
                    spawn (function()
                        while true do
                            wait(0.1)
                            Box.Color3 = children[i].Screen.Color
                        end
                    end)
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = 0.4
                    Box.Parent = ESPPC
                end
            end
        else
            for _, v in pairs(workspace.ESPComputer:GetChildren()) do
                if v:IsA('BoxHandleAdornment') then
                    v:Destroy()
                end
            end
       end
   end,
})