local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "NO I'M NOT A HUMAN MENU",
   Icon = code, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by Semyon",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Null"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local PlayerTab = Window:CreateTab("UPDATE LOGS / INFO", "square-pen")
local PlyerParagraph = PlayerTab:CreateParagraph({Title = "LAST UPDATE 📃", Content = "12/31/2025"})
local PlyerParagraph = PlayerTab:CreateParagraph({Title = "WHAT'S NEW? ✨", Content = "ADDED GOLDEN MORPHS / ADDED HALLOWEEN MORPS / ADDED UNLISTED BABY MORPH"})
local Label = PlayerTab:CreateLabel("Semyon", "user-round-cog")
local Label = PlayerTab:CreateLabel("Rayfield UI", "paint-roller")


local PlayerTab = Window:CreateTab("Paid Morphs", "bolt")
local Button = PlayerTab:CreateButton({
   Name = "Equip FEMA Morph",
   Callback = function()
   game.ReplicatedStorage.EventsFolder.SetMorph:FireServer("FEMA")
   game.ReplicatedStorage.EventsFolder.SetFemaRole:FireServer()

   end,
})
local Button = PlayerTab:CreateButton({
   Name = "Equip Vigilante Morph",
   Callback = function()
   game.ReplicatedStorage.EventsFolder.SetMorph:FireServer("Striker")
game.ReplicatedStorage.EventsFolder.SetStrikerRole:FireServer()

   end,
})
local PlyerParagraph = PlayerTab:CreateParagraph({Title = "⚠️⚠️⚠️", Content = "MAKE SURE TO RESET IF YOU WANNA SET ONE OF THOSE MORPHS"})
local PlyerParagraph = PlayerTab:CreateParagraph({Title = "⚠️⚠️⚠️", Content = "MAKE SURE TO BE A -VISITOR/SURVIVOR- FOR THIS TO WORK"})

local Paragraph = PlayerTab:CreateParagraph({Title = "", Content = ""})
local Paragraph = PlayerTab:CreateParagraph({Title = "", Content = ""})
local Label = PlayerTab:CreateLabel("Golden Morphs", "star")

local Button = PlayerTab:CreateButton({
   Name = "GoldenAmogus",
   Callback = function()
   local args = {
	"GoldenAmogus"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "GoldenRastaman",
   Callback = function()
   local args = {
	"GoldenRastaman"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "GoldenSkely",
   Callback = function()
   local args = {
	"GoldenSkely"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "GoldenGeniy",
   Callback = function()
   local args = {
	"GoldenGeniy"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "GoldenWireFace",
   Callback = function()
   local args = {
	"GoldenWireFace"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "GoldenHalat",
   Callback = function()
   local args = {
	"GoldenHalat"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Paragraph = PlayerTab:CreateParagraph({Title = "", Content = ""})
local Label = PlayerTab:CreateLabel("Halloween Morphs", "candy")

local Button = PlayerTab:CreateButton({
   Name = "TonkiHelloween",
   Callback = function()
   local args = {
	"TonkiHelloween"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "SkelyHelloween",
   Callback = function()
   local args = {
	"SkelyHelloween"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})
local Button = PlayerTab:CreateButton({
   Name = "RastamanHelloween",
   Callback = function()
   local args = {
	"RastamanHelloween"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})
local Button = PlayerTab:CreateButton({
   Name = "FortuneWomanHelloween",
   Callback = function()
   local args = {
	"FortuneWomanHelloween"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})
local Button = PlayerTab:CreateButton({
   Name = "JacketHelloween",
   Callback = function()
   local args = {
	"JacketHelloween"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})
local Button = PlayerTab:CreateButton({
   Name = "WireFaceHelloween",
   Callback = function()
   
local args = {
	"WireFaceHelloween"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local Paragraph = PlayerTab:CreateParagraph({Title = "", Content = "Unlisted Baby Morph"})
local Button = PlayerTab:CreateButton({
   Name = "Baby Morph",
   Callback = function()
   
local args = {
	"Baby"
}
game:GetService("ReplicatedStorage"):WaitForChild("EventsFolder"):WaitForChild("SetMorph"):FireServer(unpack(args))

   end,
})

local PlayerTab = Window:CreateTab("Force Roles", "square-stack")
local Button = PlayerTab:CreateButton({
   Name = "Force Character Role",
   Callback = function()
   game.Players.LocalPlayer.Character:BreakJoints()
for i = 1, 12 do
local player = game.Players.LocalPlayer


    player.ChoosingRole.Value = "Character"
    player.PlayerRole.Value = "Character"
    game:GetService("ReplicatedStorage").EventsFolder.SetRoleByChoosingPass:FireServer("Character")
    wait(0.1) 
end
   end,
})
local Button = PlayerTab:CreateButton({
   Name = "Force Visitor Role",
   Callback = function()
   game.Players.LocalPlayer.Character:BreakJoints()
for i = 1, 12 do
local player = game.Players.LocalPlayer


    player.ChoosingRole.Value = "Visitor"
    player.PlayerRole.Value = "Visitor"
    game:GetService("ReplicatedStorage").EventsFolder.SetRoleByChoosingPass:FireServer("Visitor")
    wait(0.1) 
end
   end,
})
local Button = PlayerTab:CreateButton({
   Name = "Force Survivor Role",
   Callback = function()
    game.Players.LocalPlayer.Character:BreakJoints()
for i = 1, 12 do
local player = game.Players.LocalPlayer


    player.ChoosingRole.Value = "Survivor"
    player.PlayerRole.Value = "Survivor"
    game:GetService("ReplicatedStorage").EventsFolder.SetRoleByChoosingPass:FireServer("Survivor")
    wait(0.1) 
end
   end,
})

local PlayerTab = Window:CreateTab("Show Players Roles", "eye")
local Button = PlayerTab:CreateButton({
 Name = "Show Roles",
   Callback = function()
  local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local LABEL_SETTINGS = {
    Size = UDim2.new(4.2, 0, 1.3, 0),
    StudsOffset = Vector3.new(0, 3.3, 0),
    AlwaysOnTop = true,
    MaxDistance = 90,
    LightInfluence = 0,
    TextSize = 26,
    Font = Enum.Font.GothamBold,
    TextStrokeTransparency = 0.6,
    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 1
}

local roleColors = {
    ["Character"] = Color3.fromRGB(60, 160, 255),
    ["Survivor"]  = Color3.fromRGB(40, 255, 100),
    ["Visitor"]   = Color3.fromRGB(255, 70, 70),
    ["VIP"]       = Color3.fromRGB(255, 215, 0)
}

local function createRoleLabel(player)
    if player == LocalPlayer then return end
    
    local character = player.Character
    if not character then return end
    
    local head = character:FindFirstChild("Head")
    if not head then return end
    
    for _, child in head:GetChildren() do
        if child.Name == "RoleLabel" and child:IsA("BillboardGui") then
            child:Destroy()
        end
    end
    
    local playerRole = player:FindFirstChild("PlayerRole")
    local roleName = playerRole and playerRole.Value or "Unknown"
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "RoleLabel"
    billboard.Adornee = head
    billboard.Size = LABEL_SETTINGS.Size
    billboard.StudsOffset = LABEL_SETTINGS.StudsOffset
    billboard.AlwaysOnTop = LABEL_SETTINGS.AlwaysOnTop
    billboard.MaxDistance = LABEL_SETTINGS.MaxDistance
    billboard.LightInfluence = LABEL_SETTINGS.LightInfluence
    billboard.ResetOnSpawn = false
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = LABEL_SETTINGS.BackgroundTransparency
    label.Text = roleName
    label.TextColor3 = roleColors[roleName] or Color3.fromRGB(200, 200, 200)
    label.TextSize = LABEL_SETTINGS.TextSize
    label.Font = LABEL_SETTINGS.Font
    label.TextStrokeTransparency = LABEL_SETTINGS.TextStrokeTransparency
    label.TextStrokeColor3 = LABEL_SETTINGS.TextStrokeColor3
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Parent = billboard
    
    billboard.Parent = head
end

local function refreshPlayerLabel(player)
    if player.Character then
        createRoleLabel(player)
    end
end

local function setupPlayer(player)
    if player == LocalPlayer then return end
    
    local roleValue = player:WaitForChild("PlayerRole", 10)
    
    if roleValue then
        roleValue.Changed:Connect(function()
            task.delay(0.1, function()
                refreshPlayerLabel(player)
            end)
        end)
    end
    
    player.CharacterAdded:Connect(function()
        task.delay(1.2, function()
            refreshPlayerLabel(player)
        end)
    end)
    
    task.delay(1.5, function()
        refreshPlayerLabel(player)
    end)
end

local function refreshAll()
    for _, player in Players:GetPlayers() do
        task.spawn(function()
            refreshPlayerLabel(player)
        end)
    end
end

for _, player in Players:GetPlayers() do
    task.spawn(function()
        setupPlayer(player)
    end)
end

Players.PlayerAdded:Connect(setupPlayer)

task.spawn(function()
    while true do
        task.wait(8)
        refreshAll()
    end
end)

task.delay(20, refreshAll)

 end,
})

local PlayerTab = Window:CreateTab("Cash", "circle-dollar-sign")
local Button = PlayerTab:CreateButton({
 Name = "Get Some Cash!",
   Callback = function()

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    for i = 1, 100 do
    ReplicatedStorage.EventsFolder.GetCashRewards:FireServer(90, 100) 
    wait(0.1)
end

 end,
})

local PlayerTab = Window:CreateTab("Unlock All Morphs", "lock-keyhole-open")
local Button = PlayerTab:CreateButton({
   Name = "Unlock All Morphs",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer

local function patchMorphFrame(frame)
    if not frame or not frame:IsDescendantOf(game) then return end
    
    for _, btn in ipairs(frame:GetChildren()) do
        if btn:IsA("ImageButton") and btn.Name ~= "Close" then
            btn.ImageColor3 = Color3.new(1, 1, 1)
            
            for _, connection in pairs(getconnections(btn.MouseButton1Click)) do
                connection:Disable()
            end
            
            btn.MouseButton1Click:Connect(function()
                frame.Visible = false
                game.ReplicatedStorage.EventsFolder.SetMorph:FireServer(btn.Name)
            end)
            
            local label = btn:FindFirstChild("NeedLabel")
            if label then
                label.Visible = false
            end
        end
    end

    frame.ChildAdded:Connect(function(child)
        if child:IsA("ImageButton") and child.Name ~= "Close" then
            child.ImageColor3 = Color3.new(1, 1, 1)
            
            for _, connection in pairs(getconnections(child.MouseButton1Click)) do
                connection:Disable()
            end
            
            child.MouseButton1Click:Connect(function()
                frame.Visible = false
                game.ReplicatedStorage.EventsFolder.SetMorph:FireServer(child.Name)
            end)
            
            local label = child:FindFirstChild("NeedLabel")
            if label then label.Visible = false end
        end
    end)
end

local function watchMainGui(mainGui)
    if mainGui:FindFirstChild("MorphFrame") then
        patchMorphFrame(mainGui.MorphFrame)
    end

    mainGui.ChildAdded:Connect(function(child)
        if child.Name == "MorphFrame" then
            patchMorphFrame(child)
        end
    end)
end

local function initWatcher()
    local playerGui = player:WaitForChild("PlayerGui")

    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui.Name == "MainGui" then
            watchMainGui(gui)
        elseif gui.Name == "MorphFrame" then
            patchMorphFrame(gui)
        end
    end

    playerGui.ChildAdded:Connect(function(gui)
        if gui.Name == "MainGui" then
            watchMainGui(gui)
        elseif gui.Name == "MorphFrame" then
            patchMorphFrame(gui)
        end
    end)
end

task.spawn(initWatcher)

task.spawn(function()
    while task.wait(1) do
        local mainGui = player.PlayerGui:FindFirstChild("MainGui")
        if mainGui then
            local morphFrame = mainGui:FindFirstChild("MorphFrame")
            if morphFrame then
                for _, btn in ipairs(morphFrame:GetChildren()) do
                    if btn:IsA("ImageButton") and btn.Name ~= "Close" then
                        btn.ImageColor3 = Color3.new(1, 1, 1)
                    end
                end
            end
        end
    end
end)

   end,
})


-- Made By Semyon
