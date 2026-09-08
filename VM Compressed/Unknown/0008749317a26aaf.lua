local var = game:GetService("HttpService")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemUI"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, 30, 0, 30)
textButton.Position = UDim2.new(1, -35, 0, 5)
textButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
textButton.Text = "X"
textButton.TextColor3 = Color3.new(1, 1, 1)
textButton.Font = Enum.Font.GothamBold
textButton.TextSize = 18
textButton.Parent = frame
Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 260, 0, 40)
textBox.Position = UDim2.new(0, 20, 0, 50)
textBox.PlaceholderText = "Enter your key..."
textBox.Text = ""
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 16
textBox.Parent = frame
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
local textButton2 = Instance.new("TextButton")
textButton2.Size = UDim2.new(0, 120, 0, 35)
textButton2.Position = UDim2.new(0, 20, 0, 110)
textButton2.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
textButton2.Text = "Get Key"
textButton2.TextColor3 = Color3.new(1, 1, 1)
textButton2.Font = Enum.Font.GothamBold
textButton2.TextSize = 16
textButton2.Parent = frame
Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)
local textButton3 = Instance.new("TextButton")
textButton3.Size = UDim2.new(0, 120, 0, 35)
textButton3.Position = UDim2.new(1, -140, 0, 110)
textButton3.BackgroundColor3 = Color3.fromRGB(60, 179, 113)
textButton3.Text = "Enter"
textButton3.TextColor3 = Color3.new(1, 1, 1)
textButton3.Font = Enum.Font.GothamBold
textButton3.TextSize = 16
textButton3.Parent = frame
Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 6)
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 180, 0, 30)
textLabel.Position = UDim2.new(0.5, -90, 1, 10)
textLabel.BackgroundColor3 = Color3.fromRGB(20, 180, 90)
textLabel.Text = "Copied to clipboard!"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.Gotham
textLabel.TextSize = 14
textLabel.Visible = false
textLabel.Parent = frame
Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 6)
textButton.MouseButton1Click:Connect(
  function()
    screenGui:Destroy()
  end
)
textButton2.MouseButton1Click:Connect(
  function()
    setclipboard("https://lockr.so/40Jt4ZLAS")
    textLabel.Text = "Copied to clipboard!"
    textLabel.BackgroundColor3 = Color3.fromRGB(20, 180, 90)
    textLabel.Visible = true
    task.delay(
      2,
      function()
        textLabel.Visible = false
      end
    )
  end
)
textButton3.MouseButton1Click:Connect(
  function()
    local var2 = textBox.Text
    if var2 == "" then
      return
    end
    local temp_10 = syn
    if temp_10 then
      temp_10 = syn.request
      if not temp_10 then
        temp_10 = http
        if temp_10 then
          temp_10 = http.request or request or http_request
        else
        end
      end
    else
    end
    if not temp_10 then
      warn("Your executor does not support HTTP requests.")
      textLabel.Text = "Unsupported executor"
      textLabel.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
      textLabel.Visible = true
      task.delay(
        2,
        function()
          textLabel.Visible = false
        end
      )
      return
    end
    local temp_11, temp_12 =
      pcall(
      function()
        return temp_10(
          {
            Url = "https://bstlar.com/keys/validate/" .. var2,
            Method = "GET",
            Headers = {
              bstk = "vLEJWtzNGc7b895pz4J2ye3M5BdOdZlhrF3F"
            }
          }
        )
      end
    )
    if not temp_11 or not temp_12 or not temp_12.Body then
      textLabel.Text = "HTTP Request failed"
      textLabel.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
      textLabel.Visible = true
      task.delay(
        2,
        function()
          textLabel.Visible = false
        end
      )
      return
    end
    local func = temp_12.Body
    local temp_14 = nil
    pcall(
      function()
        temp_14 = var:JSONDecode(func)
      end
    )
    if temp_14 and temp_14.valid == true then
      screenGui:Destroy()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/showsix/deadrails/refs/heads/main/script"))()
    else
      textLabel.Text = "Invalid key"
      textLabel.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
      textLabel.Visible = true
      task.delay(
        2,
        function()
          textLabel.Visible = false
          textLabel.Text = "Copied to clipboard!"
          textLabel.BackgroundColor3 = Color3.fromRGB(20, 180, 90)
        end
      )
    end
  end
)
