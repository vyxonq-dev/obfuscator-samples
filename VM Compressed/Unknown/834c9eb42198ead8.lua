local players = game:GetService("Players")
local player = players.LocalPlayer
local teams = game:GetService("Teams")
local replicatedStorage = game:GetService("ReplicatedStorage")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/hzhzhzsjjs/Zhzh/refs/heads/main/The%20ssi"))()

MakeWindow({
  Hub = {
    Title = "🔥👀 - GET NEL BACHIRA - 🔥👀",
    Animation = "NEL BACHIRA!!!"
  },
  Key = {
    KeySystem = true,
    Title = "✅🐶 - GET NEL RIN - ✅🐶",
    Description = "^ 🐶 - BEST SCRIPT - 🐶 ^",
    KeyLink = "https://discord.gg/awUuv6Ek",
    Keys = {"zbjssiisjdhd", "isopods", "huausushsj", "sshshhsshu", "sususu37"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Correct Key 🥰",
      Incorrectkey = "False😡‼️",
      CopyKeyLink = "Paste Copied Link To Browser"
    }
  }
})

MinimizeButton({
  Image = "rbxassetid://84442594910404",
  Size = {50, 50},
  Color = Color3.fromRGB(255, 255, 255),
  Corner = true,
  Stroke = true,
  StrokeColor = Color3.fromHSV(0.5, 1, 1)  -- Hue: 180° for cyan
})

MakeNotifi({
  Title = "Nice Work👏!",
  Text = "Boom!🤤✅",
  Time = 5
})

local Main = MakeTab({Name = "INFO"})

local Image = AddImageLabel(Main, {
  Name = "PresidentZuyi",
  Image = "rbxassetid://84442594910404"
})
local Paragraph1 = AddParagraph(Main, {"W Zuyi", "CREDIT"})
local Paragraph2 = AddParagraph(Main, {"W Zuyi", "INFO"})
local Paragraph3 = AddParagraph(Main, {"W Zuyi"})
local Paragraph4 = AddParagraph(Main, {"W Zuyi"})

-- Auto
local Main = MakeTab({Name = "NEL BACHIRA"})

AddButton(Main, { 
  Name = "Click This To Get NEL Bachira!", 
  Description = "Why’d u click it ts pmo☠️!", 
  Callback = function()
      local player = game.Players.LocalPlayer
local playerStats = player:WaitForChild("PlayerStats", 5) -- wait up to 5 seconds for PlayerStats

if playerStats then
    local style = playerStats:FindFirstChild("Style")
    if style and style:IsA("StringValue") then
        style.Value = "NEL Bachira"
    else
        warn("Style not found or not a StringValue.")
    end
else
    warn("PlayerStats not found.")
end
  end
}) 

AddButton(Main, { 
  Name = "Made By PresidentZuyi", 
  Description = "Why’d u click it ts pmo☠️!", 
  Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/oaaioakakaka/Script/refs/heads/main/Hccc'))()
  end
})

AddButton(Main, { 
  Name = "Will Work With Any Style :)", 
  Description = "Why’d u click it ts pmo☠️!", 
  Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/oaaioakakaka/Script/refs/heads/main/Hccc'))()
  end
})
