local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Создаем кнопку 1
local button1 = Instance.new("TextButton")
button1.Parent = screenGui
button1.Position = UDim2.new(0, 50, 0, 50)
button1.Size = UDim2.new(0, 190, 0, 50)
button1.Text = "телепортнутся к флагу"
button1.MouseButton1Click:Connect(function()




local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local originalPosition = hrp.CFrame
local firstPosition = Vector3.new(1.89, 37.78, 2066.99)
local secondPosition = Vector3.new(-68.61, 78.52, 2351.62)

-- Телепортируем в первую точку
hrp.CFrame = CFrame.new(firstPosition)

-- Ждём 1 секунду
wait(1)

local repeatTimes = 10 -- число повторов
for i=1, repeatTimes do
    -- Телепортируем в вторую точку
    hrp.CFrame = CFrame.new(secondPosition)
    wait(0.2)
    -- Возвращаем обратно в первую
    hrp.CFrame = CFrame.new(secondPosition)
    wait(0.2)
end

-- Возвращаемся в исходную позицию
hrp.CFrame = originalPosition

end)

-- Создаем кнопку 2
local button2 = Instance.new("TextButton")
button2.Parent = screenGui
button2.Position = UDim2.new(0, 50, 0, 120)
button2.Size = UDim2.new(0, 50, 0, 50)
button2.Text = "UGC SHOP"
button2.MouseButton1Click:Connect(function()

loadstring(game:HttpGet("https://pastebin.com/raw/SVP7Kwpx"))()

end)

-- Создаем кнопку 3
local button3 = Instance.new("TextButton")
button3.Parent = screenGui
button3.Position = UDim2.new(0, 50, 0, 190)
button3.Size = UDim2.new(0, 50, 0, 50)
button3.Text = "wait"
button3.MouseButton1Click:Connect(function()
    print("oq")
end)