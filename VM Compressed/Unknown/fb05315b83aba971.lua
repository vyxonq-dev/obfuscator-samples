local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Bathroom Tower Defense X", "RJTheme1")
local Tab = Window:NewTab("Exclusive")
local Section = Tab:NewSection("Exclusive Units")


Section:NewButton("Upgraded Corrupted Titan Speaker Man", "Spawn function", function()
function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

local args = {
    [1] = "Upgraded Corrupted Supreme Speakerguy",
    [2] = CFrame.new(-19.314748764038086, 6.44541072845459, 76.91328430175781, -0.5343101024627686, 0, 0.8452884554862976, 0, 1, 0, -0.8452884554862976, 0, -0.5343101024627686),
    [3] = getNil("Upgraded Corrupted Supreme Speakerguy", "Model")
}

game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnTower"):InvokeServer(unpack(args))
end)

Section:NewButton("Corrupted Titan Speaker Man", "Spawn function", function()
function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

local args = {
    [1] = "Corrupted Supreme Speakerguy",
    [2] = CFrame.new(-19.314748764038086, 6.44541072845459, 76.91328430175781, -0.5343101024627686, 0, 0.8452884554862976, 0, 1, 0, -0.8452884554862976, 0, -0.5343101024627686),
    [3] = getNil("Corrupted Supreme Speakerguy", "Model")
}

game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnTower"):InvokeServer(unpack(args))
end)

Section:NewButton("Corrupted Big Speaker Man", "Spawn function", function()
function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

local args = {
    [1] = "Corrupted Big Speakerguy",
    [2] = CFrame.new(-19.314748764038086, 6.44541072845459, 76.91328430175781, -0.5343101024627686, 0, 0.8452884554862976, 0, 1, 0, -0.8452884554862976, 0, -0.5343101024627686),
    [3] = getNil("Corrupted Big Speakerguy", "Model")
}

game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnTower"):InvokeServer(unpack(args))
end)

Section:NewButton("Corrupted Speaker Man", "Spawn function", function()
function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

local args = {
    [1] = "Corrupted Speakerguy",
    [2] = CFrame.new(-19.314748764038086, 6.44541072845459, 76.91328430175781, -0.5343101024627686, 0, 0.8452884554862976, 0, 1, 0, -0.8452884554862976, 0, -0.5343101024627686),
    [3] = getNil("Corrupted Speakerguy", "Model")
}

game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnTower"):InvokeServer(unpack(args))
end)

local Tab = Window:NewTab("Read me")
local Section = Tab:NewSection("The script works only for Easy modes")
local Section = Tab:NewSection("It won't work: Hard, Medium, Nightmare.")

local Tab = Window:NewTab("Units Price")
local Section = Tab:NewSection("Upgraded Corrupted Titan Speaker Man = 1400")
local Section = Tab:NewSection("Corrupted Speaker Man = 160")
local Section = Tab:NewSection("Corrupted Titan Speaker Man = 780")
local Section = Tab:NewSection("Corrupted Big Speaker Man = 325")