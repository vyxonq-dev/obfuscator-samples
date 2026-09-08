local PabloLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/BatuKvi123/PabloLibV3/main/PabloLibV3"))()
local window = PabloLib:Create(
"Chesx Hub", -- Name here.
"Enabled", -- If you want draggable set here to "Enabled" if you dont want set to "Disabled".
"p" -- You can put any keybind here to open close.
)

---Tabs---

local tab1 = window:CreateTab("Hubs")
local tab2 = window:CreateTab("All Games")
local tab3 = window:CreateTab("KAT")
local tab4 = window:CreateTab("Prison Life")
local tab5 = window:CreateTab("Legends Of Speed")
local tab6 = window:CreateTab("FNF")
local tab7 = window:CreateTab("MMM")
local tab8 = window:CreateTab("TRD")
---buttons---

tab1:CreateButton("Ghost Hub", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Xx-ghost-hub-xX-16503"))()
end)

tab1:CreateButton("Hoho Hub", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-HoHo-Hub-+15-Games-2392"))()
end)

tab1:CreateButton("T-Rex Hub (TSB ONLY)", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-T-Rex-Hub-17035"))()
end)

tab2:CreateTextbox("Walkspeed", function(a)
game.Players.LocalPlayer.Character.Humannoid.WalkSpeed = s
end)

tab3:CreateButton("Kat Hitbox", function()
local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local label = Instance.new("TextLabel")
local Hitbox = 
Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
main.Position = UDim2.new(0.40427351, 0, 0.34591195, 0)
main.Size = UDim2.new(0, 100, 0, 100)
main.Active = true
main.Draggable = true

label.Name = "label"
label.Parent = main
label.BackgroundColor3 = Color3.fromRGB(139,0,0)
label.Size = UDim2.new(0, 100, 0, 20)
label.Font = Enum.Font.SourceSans
label.Text = "Hitbox Gui"
label.TextColor3 = Color3.fromRGB(0, 0, 0)
label.TextScaled = true
label.TextSize = 5.000
label.TextWrapped = true

Hitbox.Name = "Hitbox"
Hitbox.Parent = main
Hitbox.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Hitbox.Position = UDim2.new(0.114285722, 0, 0.372448981, 0)
Hitbox.Size = UDim2.new(0, 90, 0, 40)
Hitbox.Font = Enum.Font.SourceSans
Hitbox.Text = "Hitbox"
Hitbox.TextColor3 = Color3.fromRGB(0, 0, 0)
Hitbox.TextSize = 40.000
Hitbox.MouseButton1Down:connect(function()
 _G.HeadSize = 20

 _G.Disabled = true


game:GetService('RunService').RenderStepped:connect(function()
  if _G.Disabled then
   for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
     pcall(function()
      v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
      v.Character.HumanoidRootPart.Transparency = 0.7
      v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
      v.Character.HumanoidRootPart.Material = "Neon"
      v.Character.HumanoidRootPart.CanCollide = false
     end)
    end
   end
  end
 end)
end)
end)

tab3:CreateButton("KAT Aimbot", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingDrey/KAT-SCRIPT-/main/Kat%20Script%20Roblox"))()
end)

tab4:CreateButton("g00nkid (i think)", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
end)

tab5:CreateButton("Legends Of Speed", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/od1ri/Legends-Of-Speed/main/loadstring.lua"))()
end)

tab6:CreateButton("FNF", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/RandomScript/main/FunkyFridayMobile"))()
end)

tab7:CreateButton("Monday Morning Misery", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/Vezt/main/MMM-AutoPlayer.lua"))()
end)

tab8:CreateButton("TRD 1", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kureu/Roblox-T.R.D-Camp-Script/main/Roblox%20T.R.D%20Camp%20Script"))();
end)

tab8:CreateButton("TRD 2", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Total-Roblox-Drama-R3TH-PRIV-15302"))()
end)