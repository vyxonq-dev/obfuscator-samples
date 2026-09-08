local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local b = a:NewWindow("KAITO SCRIPT")
local c = b:NewSection("MAIN")

local d = {
    "Bee", "Black Bunny", "Blood Bunny", "Blood Cat", "Blood Deer", "Blood Headhog",
    "Blood Kiwi", "Blood Owl", "Blue Bee", "Blue Chicken", "Brown Dog", "Bunny", 
    "Cat", "Chicken", "Chicken Jockey", "Deer", "Dog", "Female Deer", "Honey Bear", 
    "Orange Cat", "Owl", "Pig", "Queen Bee", "Raccoon", "Red Bee", "Red Queen Bee", 
    "Small Bee", "Small Dog"
}

local e = {"1", "2", "3", "4"}
local f = d[1]
local g = e[1]

c:CreateDropdown("Select Unit", d, 1, function(h)
    f = h
end)

c:CreateButton("Spawn Unit", function()
    local i = {
        [1] = f,
        [2] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position),
        [3] = "8471169909_0"
    }
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1")
        .knit.Services.TowerService.RF.PlaceTower:InvokeServer(unpack(i))
end)

c:CreateDropdown("Select Speed", e, 1, function(j)
    g = j
end)

c:CreateButton("Apply Speed", function()
    local k = {
        [1] = tonumber(g)
    }
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1")
        .knit.Services.SpeedBoostService.RF.ChangeSpeed:InvokeServer(unpack(k))
end)

c:CreateButton("Redeem Codes", function()
    for _, l in ipairs({"Release", "BloodMoon"}) do
        local m = {
            [1] = l
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1")
            .knit.Services.CodeService.RF.SubmitCode:InvokeServer(unpack(m))
    end
end)
