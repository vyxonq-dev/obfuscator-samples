local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
   Name = "#kman.rs🎭",
   Icon = 0,
   LoadingTitle = "98%",
   LoadingSubtitle = "by #kman.rs🎭",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "123"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/8A6k73JqCM",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "#kman.rs",
      Subtitle = "123",
      Note = "join for get key: discord.gg/8A6k73JqCM",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"discord.gg/8A6k73JqCM"}
   }
})
 
-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
local MainSection = MainTab:CreateSection("Main Functions")
 
local Button = MainTab:CreateButton({
   Name = "InfMoney",
   Callback = function()

-- MONEYinf
local args = {
    [1] = "200"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GiveCashEvent"):FireServer(unpack(args))

   end,
})

local Button = MainTab:CreateButton({
   Name = "InfGems",
   Callback = function()

-- INFgems

local args = {
    [1] = 16234234234
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GemEvent"):FireServer(unpack(args))
   end,
})

local Button = MainTab:CreateButton({
   Name = "Get ALL upgrades",
   Callback = function()

--UPGRAGESinf
local args = {
    [1] = "LuckyMergeLevel",
    [2] = 1000,
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))


local args = {
    [1] = "CashRateLevel",
    [2] = 1000,
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {
    [1] = "MaxPets",
    [2] = 2000
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MultiplierEvent"):FireServer(unpack(args))



local args = {
    [1] = "SpawnTierLevel",
    [2] = 1000,
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {
    [1] = "MaxBlocksLevel",
    [2] = 1000,
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {
    [1] = "SpawnRateLevel",
    [2] = 1000,
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {
    [1] = "AutoMergeLevel",
    [2] = 1000,
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))
   end,
})


local Button = MainTab:CreateButton({
   Name = "GET SPIN",
   Callback = function()

--GETFREESPIN
local rs = game:GetService("ReplicatedStorage").Remotes.FreeSpinEvent
game:GetService("ReplicatedStorage").Remotes.FreeSpinEvent:FireServer(999)
   end,
})

-- Main Tab
local MainTab = Window:CreateTab("Links", 4483362458)
local MainSection = MainTab:CreateSection("Main Functions")
 
local Button = MainTab:CreateButton({
   Name = "Discord link",
   Callback = function()
   setclipboard("https://discord.gg/8A6k73JqCM")
   toclipboard("https://discord.gg/8A6k73JqCM")
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Youtube",
   Callback = function()
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Tiktok Profile",
   Callback = function()
setclipboard("https://www.tiktok.com/@kman.rs")
toclipboard("https://www.tiktok.com/@kman.rs")
   end,
})
 
Rayfield:LoadConfiguration()