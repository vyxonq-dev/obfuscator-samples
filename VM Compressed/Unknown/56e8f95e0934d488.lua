if
  ({
    [17625359962] = true,
    [117398147513099] = true
  })[game.PlaceId]
 then
  local str = "https://pastebin.com/raw/hU3mvsaM"
  local temp_2 = nil
  if getgenv then
    getgenv().MoonHookSavedCode = getgenv().MoonHookSavedCode or nil
    temp_2 = getgenv().MoonHookSavedCode
  elseif _G then
    _G.MoonHookSavedCode = _G.MoonHookSavedCode or nil
    temp_2 = _G.MoonHookSavedCode
  end
  local function arg()
    local var = os.date("!*t")
    return string.format("%04d-%02d-%02d", var.year, var.month, var.day)
  end
  local function arg2()
    local var2 = {}
    local temp_7, temp_8 =
      pcall(
      function()
        return game:HttpGet(str)
      end
    )
    if temp_7 and temp_8 then
      for temp_9 in temp_8:gmatch("[^\r\n]+") do
        local temp_10, temp_11 = temp_9:match("([^|]+)|([^|]+)")
        if temp_10 and temp_11 then
          table.insert(
            var2,
            {
              code = temp_10:lower():gsub("^%s*(.-)%s*$", "%1"),
              expiry = temp_11
            }
          )
        end
      end
    end
    return var2
  end
  local function arg3(arg4)
    local var3 = arg()
    for temp_15, temp_16 in pairs(arg2()) do
      if arg4 == temp_16.code and var3 <= temp_16.expiry then
        return true
      end
    end
    return false
  end
  local function arg5()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MoonHookRBX/Moonhook1/refs/heads/main/orion.lua"))()
  end
  local function arg6()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ezkeredzonn/keymoonhook/refs/heads/main/moonhook"))()
  end
  local tweenService = game:GetService("TweenService")
  local blurEffect = Instance.new("BlurEffect")
  blurEffect.Size = 0
  blurEffect.Parent = game.Lighting
  local screenGui = Instance.new("ScreenGui")
  screenGui.Name = "MoonHookUI"
  screenGui.ResetOnSpawn = false
  screenGui.Parent = game:GetService("CoreGui")
  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 0, 0, 0)
  frame.Position = UDim2.new(0.5, 0, 0.5, 0)
  frame.AnchorPoint = Vector2.new(0.5, 0.5)
  frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.ClipsDescendants = true
  frame.Parent = screenGui
  local uIGradient = Instance.new("UIGradient")
  uIGradient.Color =
    ColorSequence.new(
    {
      ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
      ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 170))
    }
  )
  uIGradient.Rotation = 45
  uIGradient.Parent = frame
  local uIStroke = Instance.new("UIStroke")
  uIStroke.Thickness = 3
  uIStroke.Color = Color3.fromRGB(255, 255, 255)
  uIStroke.Transparency = 0.4
  uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  uIStroke.Parent = frame
  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)
  tweenService:Create(
    frame,
    TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {
      Size = UDim2.new(0, 450, 0, 350)
    }
  ):Play()
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 0, 60)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "MoonHook  Access "
  textLabel.Font = Enum.Font.GothamBlack
  textLabel.TextSize = 28
  textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel.Parent = frame
  local textBox = Instance.new("TextBox")
  textBox.PlaceholderText = "Enter your key..."
  textBox.Size = UDim2.new(0.8, 0, 0, 40)
  textBox.Position = UDim2.new(0.1, 0, 0, 80)
  textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
  textBox.Font = Enum.Font.Gotham
  textBox.TextSize = 20
  textBox.ClearTextOnFocus = true
  textBox.Parent = frame
  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 10)
  if temp_2 then
    textBox.Text = temp_2
  end
  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0.8, 0, 0, 40)
  textButton.Position = UDim2.new(0.1, 0, 0, 135)
  textButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
  textButton.Text = "Submite code"
  textButton.Font = Enum.Font.GothamBold
  textButton.TextSize = 22
  textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton.Parent = frame
  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 10)
  local textButton2 = Instance.new("TextButton")
  textButton2.Size = UDim2.new(0.8, 0, 0, 35)
  textButton2.Position = UDim2.new(0.1, 0, 0, 190)
  textButton2.BackgroundColor3 = Color3.fromRGB(114, 137, 218)
  textButton2.Text = "Join Discord Server"
  textButton2.Font = Enum.Font.Gotham
  textButton2.TextSize = 18
  textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton2.Parent = frame
  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 10)
  local textButton3 = Instance.new("TextButton")
  textButton3.Size = UDim2.new(0.8, 0, 0, 40)
  textButton3.Position = UDim2.new(0.1, 0, 0, 90)
  textButton3.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
  textButton3.Text = "Option 1 (OrionLib)"
  textButton3.Font = Enum.Font.GothamBold
  textButton3.TextSize = 20
  textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton3.Visible = false
  textButton3.Parent = frame
  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 10)
  local textButton4 = Instance.new("TextButton")
  textButton4.Size = UDim2.new(0.8, 0, 0, 40)
  textButton4.Position = UDim2.new(0.1, 0, 0, 150)
  textButton4.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
  textButton4.Text = "Option 2 (Rayfield)"
  textButton4.Font = Enum.Font.GothamBold
  textButton4.TextSize = 20
  textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton4.Visible = false
  textButton4.Parent = frame
  Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 10)
  local function arg7()
    for temp_32, temp_33 in ipairs(
      {
        textBox,
        textButton,
        textButton2
      }
    ) do
      tweenService:Create(
        temp_33,
        TweenInfo.new(0.4),
        {
          BackgroundTransparency = 1,
          TextTransparency = 1
        }
      ):Play()
    end
    wait(0.5)
    textButton3.Visible = true
    textButton4.Visible = true
    textButton3.BackgroundTransparency = 1
    textButton4.BackgroundTransparency = 1
    textButton3.TextTransparency = 1
    textButton4.TextTransparency = 1
    tweenService:Create(
      textButton3,
      TweenInfo.new(0.4),
      {
        BackgroundTransparency = 0,
        TextTransparency = 0
      }
    ):Play()
    wait(0.3)
    tweenService:Create(
      textButton4,
      TweenInfo.new(0.4),
      {
        BackgroundTransparency = 0,
        TextTransparency = 0
      }
    ):Play()
  end
  textButton.MouseEnter:Connect(
    function()
      tweenService:Create(
        textButton,
        TweenInfo.new(0.2),
        {
          BackgroundColor3 = Color3.fromRGB(0, 220, 0)
        }
      ):Play()
    end
  )
  textButton.MouseLeave:Connect(
    function()
      tweenService:Create(
        textButton,
        TweenInfo.new(0.2),
        {
          BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        }
      ):Play()
    end
  )
  textButton.MouseButton1Click:Connect(
    function()
      local var4 = textBox.Text:lower():gsub("^%s*(.-)%s*$", "%1")
      if arg3(var4) then
        if getgenv then
          getgenv().MoonHookSavedCode = var4
        end
        if _G then
          _G.MoonHookSavedCode = var4
        end
        textButton.Text = "   Access Granted!"
        tweenService:Create(
          textButton,
          TweenInfo.new(0.3),
          {
            BackgroundColor3 = Color3.fromRGB(0, 200, 0)
          }
        ):Play()
        wait(0.5)
        arg7()
      else
        textButton.Text = "   Invalid Code!"
        tweenService:Create(
          textButton,
          TweenInfo.new(0.3),
          {
            BackgroundColor3 = Color3.fromRGB(200, 0, 0)
          }
        ):Play()
        wait(1)
        textButton.Text = "Validate Code"
        tweenService:Create(
          textButton,
          TweenInfo.new(0.3),
          {
            BackgroundColor3 = Color3.fromRGB(0, 200, 0)
          }
        ):Play()
      end
    end
  )
  textButton3.MouseButton1Click:Connect(
    function()
      blurEffect:Destroy()
      screenGui:Destroy()
      arg5()
    end
  )
  textButton4.MouseButton1Click:Connect(
    function()
      blurEffect:Destroy()
      screenGui:Destroy()
      arg6()
    end
  )
  textButton2.MouseButton1Click:Connect(
    function()
      local str2 = "https://discord.gg/WvuMPPSM7E"
      if setclipboard then
        setclipboard(str2)
        textButton2.Text = "Invite Copied!"
      else
        textButton2.Text = "Cannot Copy"
      end
      wait(1.5)
      textButton2.Text = "Join Discord Server"
    end
  )
end
