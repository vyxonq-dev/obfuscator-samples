local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local win = ui:CreateWindow({

 Title = "Zreepy | Baldi Frenzy",

 Icon = "menu",

 Size = UDim2.fromOffset(420,300),

 MinimizeText = "hai"

})

local scriptsTab = win:Tab({Title="Scripts",Icon="scroll"})

local visualTab = win:Tab({Title="Visual",Icon="eye"})

scriptsTab:Paragraph({

 Title = "Warning On INF Stamina",

 Desc = "dont left it on when round gonna start\nturn it ON only after round started\nor game will crash"

})

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Players = game:GetService("Players")

local footEvent = ReplicatedStorage:FindFirstChild("Client"):FindFirstChild("Remotes"):FindFirstChild("playCharacterSfx")

local stamEvent = ReplicatedStorage:FindFirstChild("Client"):FindFirstChild("Remotes"):FindFirstChild("refillStamina")

local spamFoot = false

local infStam = false

local espOn = false

local highlights = {}

scriptsTab:Toggle({

 Title = "(fe troll) spam footsteps",

 Value = false,

 Callback = function(v)

  spamFoot = v

  spawn(function()

   while spamFoot do

    if footEvent then footEvent:FireServer("footstep",0,0.5) end

    task.wait(0.1)

   end

  end)

 end

})

scriptsTab:Toggle({

 Title = "Infinite Stamina",

 Value = false,

 Callback = function(v)

  infStam = v

  spawn(function()

   while infStam do

    if stamEvent then firesignal(stamEvent.OnClientEvent,100) end

    task.wait(0.1)

   end

  end)

 end

})

scriptsTab:Button({

 Title = "Reset (troll)",

 Callback = function()

  local plr = Players.LocalPlayer

  if plr.Character and plr.Character:FindFirstChild("Humanoid") then

   plr.Character.Humanoid.Health = 0

  end

 end

})

local function addESP(char)

 if not char or char:FindFirstChild("Highlight") then return end

 local hl = Instance.new("Highlight")

 hl.FillColor = Color3.new(0,1,0)

 hl.OutlineColor = Color3.new(0,1,0)

 hl.FillTransparency = 0.5

 hl.Parent = char

 highlights[char] = hl

end

local function removeAllESP()

 for _,hl in pairs(highlights) do hl:Destroy() end

 highlights = {}

end

visualTab:Toggle({

 Title = "ESP Baldi (enemies only)",

 Value = false,

 Callback = function(v)

  espOn = v

  if not v then removeAllESP() return end

  for _,p in pairs(Players:GetPlayers()) do

   if p ~= Players.LocalPlayer and p.Character and p.Team ~= Players.LocalPlayer.Team then

    addESP(p.Character)

   end

  end

 end

})

Players.PlayerAdded:Connect(function(p)

 p.CharacterAdded:Connect(function(c)

  if espOn and p.Team ~= Players.LocalPlayer.Team then

   task.wait(1)

   addESP(c)

  end

 end)

end)

for _,p in pairs(Players:GetPlayers()) do

 if p.Character and espOn and p.Team ~= Players.LocalPlayer.Team then addESP(p.Character) end

 p.CharacterAdded:Connect(function(c)

  if espOn and p.Team ~= Players.LocalPlayer.Team then

   task.wait(1)

   addESP(c)

  end

 end)

end