local KRT = {}

--

KRT.Main = Instance.new("ScreenGui")

KRT.Main.Name = "KRT Hub | Delta"

KRT.Main.ResetOnSpawn = false

--

KRT.Frame = Instance.new("Frame")

KRT.Frame.Parent = KRT.Main

KRT.Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

KRT.Frame.BorderColor3 = Color3.fromRGB(60, 60, 60)

KRT.Frame.Position = UDim2.new(0.5, -150, 0.5, -125) -- Adjusted for extra button

KRT.Frame.Size = UDim2.new(0, 300, 0, 250) -- Increased height for extra button

KRT.Frame.Active = true

KRT.Frame.Draggable = true

--

KRT.Title = Instance.new("TextLabel")

KRT.Title.Parent = KRT.Frame

KRT.Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

KRT.Title.BorderColor3 = Color3.fromRGB(40, 40, 40)

KRT.Title.Size = UDim2.new(1, 0, 0, 30)

KRT.Title.Font = Enum.Font.GothamBold

KRT.Title.Text = "KRT Hub | Delta"

KRT.Title.TextColor3 = Color3.fromRGB(255, 255, 255)

KRT.Title.TextSize = 16

--

KRT.Close = Instance.new("TextButton")

KRT.Close.Parent = KRT.Title

KRT.Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

KRT.Close.BorderColor3 = Color3.fromRGB(40, 40, 40)

KRT.Close.Position = UDim2.new(1, -30, 0, 0)

KRT.Close.Size = UDim2.new(0, 30, 1, 0)

KRT.Close.Font = Enum.Font.GothamBold

KRT.Close.Text = "X"

KRT.Close.TextColor3 = Color3.fromRGB(255, 255, 255)

KRT.Close.TextSize = 16

KRT.Close.MouseButton1Click:Connect(function()

    KRT.Main:Destroy()

end)

--

KRT.Button1 = Instance.new("TextButton")

KRT.Button1.Parent = KRT.Frame

KRT.Button1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

KRT.Button1.BorderColor3 = Color3.fromRGB(60, 60, 60)

KRT.Button1.Position = UDim2.new(0.5, -100, 0.2, 0) -- Adjusted position

KRT.Button1.Size = UDim2.new(0, 200, 0, 40)

KRT.Button1.Font = Enum.Font.Gotham

KRT.Button1.Text = "Murder mystery 2"

KRT.Button1.TextColor3 = Color3.fromRGB(255, 255, 255)

KRT.Button1.TextSize = 14

KRT.Button1.MouseButton1Click:Connect(function()

    loadstring(game:HttpGet("https://pastefy.app/byuOBliU/raw"))()

    KRT.Button1.Text = "MM2 запущен!"

    wait(2)

    KRT.Button1.Text = "Murder mystery 2"

end)

--

KRT.Button2 = Instance.new("TextButton")

KRT.Button2.Parent = KRT.Frame

KRT.Button2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

KRT.Button2.BorderColor3 = Color3.fromRGB(60, 60, 60)

KRT.Button2.Position = UDim2.new(0.5, -100, 0.4, 0) -- Adjusted position

KRT.Button2.Size = UDim2.new(0, 200, 0, 40)

KRT.Button2.Font = Enum.Font.Gotham

KRT.Button2.Text = "Auto Piano"

KRT.Button2.TextColor3 = Color3.fromRGB(255, 255, 255)

KRT.Button2.TextSize = 14

KRT.Button2.MouseButton1Click:Connect(function()

    loadstring(game:HttpGet("https://pastefy.app/Y8idlhuw/raw"))()

    KRT.Button2.Text = "Auto Piano запущен!"

    wait(2)

    KRT.Button2.Text = "Auto Piano"

end)

--

KRT.Button3 = Instance.new("TextButton")

KRT.Button3.Parent = KRT.Frame

KRT.Button3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

KRT.Button3.BorderColor3 = Color3.fromRGB(60, 60, 60)

KRT.Button3.Position = UDim2.new(0.5, -100, 0.6, 0) -- New button position

KRT.Button3.Size = UDim2.new(0, 200, 0, 40)

KRT.Button3.Font = Enum.Font.Gotham

KRT.Button3.Text = "Dead Rails"

KRT.Button3.TextColor3 = Color3.fromRGB(255, 255, 255)

KRT.Button3.TextSize = 14

KRT.Button3.MouseButton1Click:Connect(function()

    loadstring(game:HttpGet("https://pastefy.app/2iuEVhvB/raw"))()

    KRT.Button3.Text = "Dead Rails запущен!"

    wait(2)

    KRT.Button3.Text = "Dead Rails"

end)

--

KRT.Main.Parent = game:GetService("CoreGui")

-- Функция для скрытия/показа интерфейса

local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, processed)

    if input.KeyCode == Enum.KeyCode.RightControl and not processed then

        KRT.Frame.Visible = not KRT.Frame.Visible

    end

end)