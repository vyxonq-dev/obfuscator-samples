playerCount = 0

if game.CoreGui:FindFirstChild("woof") then
   game.CoreGui.woof:Destroy()
end

if game:GetService("CoreGui"):FindFirstChild("Notifaction") then
   game:GetService("CoreGui").Notifaction:Destroy();
end

-- hello Leadi
local Mainholder = {RainbowColorValue = 0, HueSelectionPosition = 0}


coroutine.wrap(
    function()
       while wait() do
         Mainholder.RainbowColorValue = Mainholder.RainbowColorValue + 1 / 255
         Mainholder.HueSelectionPosition = Mainholder.HueSelectionPosition + 1
   
          if Mainholder.RainbowColorValue >= 1 then
            Mainholder.RainbowColorValue = 0
          end
   
          if Mainholder.HueSelectionPosition == 80 then
            Mainholder.HueSelectionPosition = 0
          end
       end
    end
   )()

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
getgenv().checklists = {}

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
   
    local function Update(input)
       local Delta = input.Position - DragStart
       local pos =
          UDim2.new(
             StartPosition.X.Scale,
             StartPosition.X.Offset + Delta.X,
             StartPosition.Y.Scale,
             StartPosition.Y.Offset + Delta.Y
          )
       local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
       Tween:Play()
    end
   
    topbarobject.InputBegan:Connect(
       function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
             Dragging = true
             DragStart = input.Position
             StartPosition = object.Position
   
             input.Changed:Connect(
                function()
                   if input.UserInputState == Enum.UserInputState.End then
                      Dragging = false
                   end
                end
             )
          end
       end
    )
   
    topbarobject.InputChanged:Connect(
       function(input)
          if
             input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
          then
             DragInput = input
          end
       end
    )
   
    UserInputService.InputChanged:Connect(
       function(input)
          if input == DragInput and Dragging then
             Update(input)
          end
       end
    )
   end


local woof = Instance.new("ScreenGui")
woof.Name = "woof"
woof.Parent = game.CoreGui

function Mainholder:Window(hubname, gamename, discordlink, feedbackloadstring, halflink)
   local FirstTab = false

   local MainFrame = Instance.new("Frame")
   local MainCorner = Instance.new("UICorner")
   local LeftFrame = Instance.new("Frame")
   local LeftFrameCorner = Instance.new("UICorner")
   local TabHolder = Instance.new("Frame")
   local TabHoldLayout = Instance.new("UIListLayout")
   local DragFrame = Instance.new("Frame")
   local GameTitle = Instance.new("TextLabel")
   local MainTitle = Instance.new("TextLabel")
   local lineY = Instance.new("Frame")
   local MainFrameholder = Instance.new("Frame")
   local OpenClose = Instance.new("TextButton")
   local OpenCloseCorner = Instance.new("UICorner")
   local Discord = Instance.new("TextButton")
   local DiscordCorner = Instance.new("UICorner")
   local Feedback = Instance.new("TextButton")
   local FeedbackCorner = Instance.new("UICorner")
   local Keybind = Instance.new("TextButton")
   local TextKeybind = Instance.new("TextLabel")
   local BindText = Instance.new("TextLabel")
   local Glow = Instance.new("ImageLabel")
   local ContainerHold = Instance.new("Frame")
   local TaTitle = Instance.new("TextLabel")
   local DragFrame2 = Instance.new("Frame")
   local DragFrame2_2 = Instance.new("Frame")

   MainFrame.Name = "MainFrame"
   MainFrame.Parent = woof
   MainFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
   MainFrame.Position = UDim2.new(0.560168743, -325, 0.625403643, -250)
   MainFrame.Size = UDim2.new(0, 0, 0, 0)
   -- 0, 650, 0, 410 ^^
   
   MainCorner.CornerRadius = UDim.new(0, 5)
   MainCorner.Name = "MainCorner"
   MainCorner.Parent = MainFrame
   
   LeftFrame.Name = "LeftFrame"
   LeftFrame.Parent = MainFrame
   LeftFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
   LeftFrame.Position = UDim2.new(0, 0, 0, 0)
   -- UDim2.new(-0.354520649, 0, 0.00472821482, 0) ^^
   LeftFrame.Size = UDim2.new(0, 209, 0, 410)
   LeftFrame.Visible = false
   
   LeftFrameCorner.CornerRadius = UDim.new(0, 5)
   LeftFrameCorner.Name = "LeftFrameCorner"
   LeftFrameCorner.Parent = LeftFrame
   
   TabHolder.Name = "TabHolder"
   TabHolder.Parent = LeftFrame
   TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TabHolder.BackgroundTransparency = 1.000
   TabHolder.Position = UDim2.new(0.056721665, 0, 0.113540091, 0)
   TabHolder.Size = UDim2.new(0, 187, 0, 335)
   
   TabHoldLayout.Name = "TabHoldLayout"
   TabHoldLayout.Parent = TabHolder
   TabHoldLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
   TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
   TabHoldLayout.Padding = UDim.new(0, 5)


   Glow.Name = "Glow"
   Glow.Parent = LeftFrame
   Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Glow.BackgroundTransparency = 1.000
   Glow.BorderSizePixel = 0
   Glow.Position = UDim2.new(0, -15, 0, -15)
   Glow.Size = UDim2.new(1, 30, 1, 30)
   Glow.ZIndex = 0
   Glow.Image = "rbxassetid://4996891970"
   Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
   Glow.ScaleType = Enum.ScaleType.Slice
   Glow.SliceCenter = Rect.new(20, 20, 280, 280)


   DragFrame.Name = "DragFrame"
   DragFrame.Parent = MainFrame
   DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DragFrame.BackgroundTransparency = 1.000
   DragFrame.Position = UDim2.new(0.30130294, 0, 0.00253164559, 0)
   DragFrame.Size = UDim2.new(0, 428, 0, 21)

   MakeDraggable(DragFrame, MainFrame)
   
   GameTitle.Name = "GameTitle"
   GameTitle.Parent = MainFrame
   GameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   GameTitle.BackgroundTransparency = 1.000
   GameTitle.Position = UDim2.new(0.0297903754, 0, 0.0987561122, 6)
   GameTitle.Size = UDim2.new(0, 159, 0, 20)
   GameTitle.Font = Enum.Font.Gotham
   GameTitle.Text = gamename
   GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   GameTitle.TextSize = 17.000
   GameTitle.TextTransparency = 0.400
   GameTitle.Visible = false
   
   MainTitle.Name = "MainTitle"
   MainTitle.Parent = MainFrame
   MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MainTitle.BackgroundTransparency = 1.000
   MainTitle.Position = UDim2.new(0.0322690085, 0, 0.035682939, 0)
   MainTitle.Size = UDim2.new(0, 159, 0, 20)
   MainTitle.Font = Enum.Font.Gotham
   MainTitle.Text = hubname
   MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   MainTitle.TextSize = 25.000
   MainTitle.Visible = false

   
   lineY.Name = "lineY"
   lineY.Parent = MainFrame
   lineY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   lineY.Position = UDim2.new(0.304615378, 0, 0.00487804879, 0)
   lineY.Size = UDim2.new(0, 0, 0, 400)
   lineY.Visible = false
   
   MainFrameholder.Name = "MainFrameholder"
   MainFrameholder.Parent = MainFrame
   MainFrameholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MainFrameholder.BackgroundTransparency = 1.000
   MainFrameholder.Position = UDim2.new(0.0153846154, 0, 0.160975605, 0)
   MainFrameholder.Size = UDim2.new(0, 178, 0, 283)
   MainFrameholder.Visible = false

   ContainerHold.Name = "ContainerHold"
   ContainerHold.Parent = MainFrame
   ContainerHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ContainerHold.BackgroundTransparency = 1.000
   ContainerHold.Size = UDim2.new(0, 650, 0, 409)

   DragFrame2.Name = "DragFrame2"
   DragFrame2.Parent = MainFrame
   DragFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DragFrame2.BackgroundTransparency = 1.000
   DragFrame2.Position = UDim2.new(0, 0, 0.00253169355, 0)
   DragFrame2.Size = UDim2.new(0, 211, 0, 408)

   DragFrame2_2.Name = "DragFrame2"
   DragFrame2_2.Parent = MainFrame
   DragFrame2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DragFrame2_2.BackgroundTransparency = 1.000
   DragFrame2_2.Position = UDim2.new(-0.354520649, 0, 0.00253169355, 0)
   DragFrame2_2.Size = UDim2.new(0, 209, 0, 408)

   MakeDraggable(DragFrame2, MainFrame)
   MakeDraggable(DragFrame2_2, MainFrame)


   TaTitle.Name = "TaTitle"
   TaTitle.Parent = LeftFrame
   TaTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TaTitle.BackgroundTransparency = 1.000
   TaTitle.Position = UDim2.new(0.113608718, 0, 0.0210487917, 0)
   TaTitle.Size = UDim2.new(0, 159, 0, 20)
   TaTitle.Font = Enum.Font.Gotham
   TaTitle.Text = "Tabs"
   TaTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   TaTitle.TextSize = 25.000

   local MainFrameSearch = Instance.new("TextButton")
   local MainFrameSearchIcon = Instance.new("ImageLabel")
   local MainFrameSearchBox = Instance.new("TextBox")
   local MainFrameSearchBoxPadding = Instance.new("UIPadding")
   local MainFrameSearchBoxCorner = Instance.new("UICorner")

   MainFrameSearch.Name = "MainFrameSearch"
   MainFrameSearch.Parent = MainFrame
   MainFrameSearch.AnchorPoint = Vector2.new(1, 0.5)
   MainFrameSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MainFrameSearch.BackgroundTransparency = 1.000
   MainFrameSearch.LayoutOrder = 2
   MainFrameSearch.Position = UDim2.new(0.984615386, 0, 0.0487804934, 0)
   MainFrameSearch.Size = UDim2.new(0, 40, 0, 40)
   MainFrameSearch.Font = Enum.Font.SourceSans
   MainFrameSearch.Text = ""
   MainFrameSearch.TextColor3 = Color3.fromRGB(0, 0, 0)
   MainFrameSearch.TextSize = 14.000

   local SearchMainToggled = false
   MainFrameSearch.MouseButton1Click:Connect(function()
      if SearchMainToggled == false then
         MainFrameSearchBox.PlaceholderText = "Search"
         MainFrameSearchBox.Visible = true
         TweenService:Create(
            MainFrameSearchBox,
            TweenInfo.new(.3, Enum.EasingStyle.Quad),
            {BackgroundTransparency = 0}
         ):Play()
         repeat wait() until MainFrameSearchBox.BackgroundTransparency == 0
         SearchMainToggled = true
      else
         MainFrameSearchBox.PlaceholderText = ""
         TweenService:Create(
            MainFrameSearchBox,
            TweenInfo.new(.3, Enum.EasingStyle.Quad),
            {BackgroundTransparency = 1}
         ):Play()
         repeat wait() until MainFrameSearchBox.BackgroundTransparency == 1
         SearchMainToggled = false
         MainFrameSearchBox.Visible = false
      end
   end)
   
   MainFrameSearchIcon.Name = "MainFrameSearchIcon"
   MainFrameSearchIcon.Parent = MainFrameSearch
   MainFrameSearchIcon.AnchorPoint = Vector2.new(0.5, 0.5)
   MainFrameSearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MainFrameSearchIcon.BackgroundTransparency = 1.000
   MainFrameSearchIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
   MainFrameSearchIcon.Size = UDim2.new(0, 14, 0, 14)
   MainFrameSearchIcon.Image = "http://www.roblox.com/asset/?id=6521439400"
   MainFrameSearchIcon.ImageTransparency = 1
   MainFrameSearchIcon.Visible = false
   
   MainFrameSearchBox.Name = "MainFrameSearchBox"
   MainFrameSearchBox.Parent = MainFrame
   MainFrameSearchBox.AnchorPoint = Vector2.new(0, 0.5)
   MainFrameSearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
   MainFrameSearchBox.Position = UDim2.new(1.00730777, -365, 0.0563506782, 0)
   MainFrameSearchBox.Size = UDim2.new(0, 245, 0, 23)
   MainFrameSearchBox.Font = Enum.Font.Ubuntu
   MainFrameSearchBox.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
   MainFrameSearchBox.PlaceholderText = ""
   MainFrameSearchBox.Text = ""
   MainFrameSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
   MainFrameSearchBox.TextSize = 15.000
   MainFrameSearchBox.BackgroundTransparency = 1
   MainFrameSearchBox.Visible = false
   
   MainFrameSearchBoxPadding.Name = "MainFrameSearchBoxPadding"
   MainFrameSearchBoxPadding.Parent = MainFrameSearchBox
   MainFrameSearchBoxPadding.PaddingLeft = UDim.new(0, 7)
   MainFrameSearchBoxPadding.PaddingRight = UDim.new(0, 8)
   
   MainFrameSearchBoxCorner.Name = "MainFrameSearchBoxCorner"
   MainFrameSearchBoxCorner.Parent = MainFrameSearchBox
   
   OpenClose.Name = "OpenClose"
   OpenClose.Parent = MainFrameholder
   OpenClose.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   OpenClose.Position = UDim2.new(0.0321919285, 0, 0.0898051411, 0)
   OpenClose.Size = UDim2.new(0, 170, 0, 40)
   OpenClose.AutoButtonColor = false
   OpenClose.Font = Enum.Font.Gotham
   OpenClose.Text = "Hide Tabs"
   OpenClose.TextColor3 = Color3.fromRGB(255, 255, 255)
   OpenClose.TextSize = 20.000

   OpenClose.MouseEnter:Connect(function()
      TweenService:Create(
         OpenClose,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
      ):Play()
   end)

   OpenClose.MouseLeave:Connect(function()
      TweenService:Create(
         OpenClose,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
      ):Play()
   end)

   OpenClose.MouseButton1Click:Connect(function()
      OpenClose.TextSize = 0
      TweenService:Create(
         OpenClose,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 25.000}
      ):Play()
      TweenService:Create(
         OpenClose,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 20.000}
      ):Play()
   end)

   local TabHoToggled = false
   OpenClose.MouseButton1Click:Connect(function()
      if TabHoToggled == false then
         OpenClose.Text = "Show Tabs"
         TabHoToggled = true
      else
         OpenClose.Text = "Hide Tabs"
         TabHoToggled = false
      end
   end)

   OpenClose.MouseButton1Click:Connect(function()
      if TabHoToggled == false then
         TaTitle.Visible = false
         TabHolder.Visible = false
         Glow.Visible = false
         TweenService:Create(
            LeftFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {Position = UDim2.new(0, 0, 0, 0)}
         ):Play()
      repeat wait() until LeftFrame.Position == UDim2.new(0, 0, 0, 0)
      LeftFrame.Visible = false
      else
         LeftFrame.Visible = true
         TweenService:Create(
            LeftFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {Position = UDim2.new(-0.354520649, 0, 0.00472821482, 0)}
         ):Play()
         repeat wait() until LeftFrame.Position == UDim2.new(-0.354520649, 0, 0.00472821482, 0)
         
         TabHolder.Visible = true
         TaTitle.Visible = true
         Glow.Visible = true
      end
   end)
   
   OpenCloseCorner.CornerRadius = UDim.new(0, 6)
   OpenCloseCorner.Name = "OpenCloseCorner"
   OpenCloseCorner.Parent = OpenClose
   
   Discord.Name = "Discord"
   Discord.Parent = MainFrameholder
   Discord.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Discord.Position = UDim2.new(0.0321919285, 0, 0.312419981, 0)
   Discord.Size = UDim2.new(0, 170, 0, 40)
   Discord.AutoButtonColor = false
   Discord.Font = Enum.Font.Gotham
   Discord.Text = "Discord"
   Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
   Discord.TextSize = 20.000

   Discord.MouseEnter:Connect(function()
      TweenService:Create(
         Discord,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
      ):Play()
   end)

   Discord.MouseLeave:Connect(function()
      TweenService:Create(
         Discord,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
      ):Play()
   end)

   Discord.MouseButton1Click:Connect(function()
      Discord.TextSize = 0
      TweenService:Create(
         Discord,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 25.000}
      ):Play()
      TweenService:Create(
         Discord,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 20.000}
      ):Play()
   end)

	Discord.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/wVjn9m5Ac5")
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Celestial Hub", -- Required
			Text = "Discord has been copied to clipboard!", -- Required
		})
   end)
   
   DiscordCorner.CornerRadius = UDim.new(0, 6)
   DiscordCorner.Name = "DiscordCorner"
   DiscordCorner.Parent = Discord
   
   Feedback.Name = "Feedback"
   Feedback.Parent = MainFrameholder
   Feedback.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Feedback.Position = UDim2.new(0.0321919285, 0, .532419981, 0)
   Feedback.Size = UDim2.new(0, 170, 0, 40)
   Feedback.AutoButtonColor = false
   Feedback.Font = Enum.Font.Gotham
   Feedback.Text = "Feedback"
   Feedback.TextColor3 = Color3.fromRGB(255, 255, 255)
   Feedback.TextSize = 20.000

   Feedback.MouseEnter:Connect(function()
      TweenService:Create(
         Feedback,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
      ):Play()
   end)

   Feedback.MouseLeave:Connect(function()
      TweenService:Create(
         Feedback,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
      ):Play()
   end)

   Feedback.MouseButton1Click:Connect(function()
      Feedback.TextSize = 0
      TweenService:Create(
         Feedback,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 25.000}
      ):Play()
      TweenService:Create(
         Feedback,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 20.000}
      ):Play()
   end)

	Feedback.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JellyBagBeans/CelestialHub/main/Review", true))()
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Celestial Hub", -- Required
			Text = "Opening Reviews/Feedback", -- Required
		})
   end)
   
   FeedbackCorner.CornerRadius = UDim.new(0, 6)
   FeedbackCorner.Name = "FeedbackCorner"
   FeedbackCorner.Parent = Feedback
   
   
   Keybind.Name = "Keybind"
   Keybind.Parent = MainFrameholder
   Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
   Keybind.BackgroundTransparency = 1.000
   Keybind.Position = UDim2.new(0.124106236, 0, 1.05042291, 0)
   Keybind.Size = UDim2.new(0, 126, 0, 31)
   Keybind.Font = Enum.Font.SourceSans
   Keybind.Text = ""
   Keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
   Keybind.TextSize = 14.000
   Keybind.TextXAlignment = Enum.TextXAlignment.Left
   
   TextKeybind.Name = "TextKeybind"
   TextKeybind.Parent = Keybind
   TextKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TextKeybind.BackgroundTransparency = 1.000
   TextKeybind.Position = UDim2.new(0, 0, -0.0152253183, 0)
   TextKeybind.Size = UDim2.new(0, 126, 0, 31)
   TextKeybind.Font = Enum.Font.SourceSans
   TextKeybind.Text = "Bind:"
   TextKeybind.TextColor3 = Color3.fromRGB(255, 255, 255)
   TextKeybind.TextSize = 20.000
   TextKeybind.TextXAlignment = Enum.TextXAlignment.Left
   
   BindText.Name = "BindText"
   BindText.Parent = Keybind
   BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   BindText.BackgroundTransparency = 1.000
   BindText.Position = UDim2.new(0.46825397, 0, -0.0152253183, 0)
   BindText.Size = UDim2.new(0, 60, 0, 31)
   BindText.Font = Enum.Font.SourceSans
   BindText.Text = "Rightcontrol"
   BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
   BindText.TextSize = 18.000

   local keybind_data = {}

local keybind_options

local keybind_name

local UIS = game:GetService('UserInputService')
  
  
         keybind_name = tostring(keybind_name or "New Keybind")
         callback = typeof(callback) == "function" and callback or function()end
         keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
         keybind_options = {
            ["standard"] = keybind_options.standard or Enum.KeyCode.RightControl,
         }
  
  
  
         callback = typeof(callback) == "function" and callback or function()end
         keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
         keybind_options = {
            ["standard"] = keybind_options.standard or Enum.KeyCode.RightControl,
         }
  
         local shortkeys = {
            RightControl = 'RightControl',
            LeftControl = 'LeftControl',
            LeftShift = 'LeftShift',
            RightShift = 'RightShift',
            MouseButton1 = "MouseButton1",
            MouseButton2 = "MouseButton2"
         }
         local checks = {
            binding = false,
         }

         function keybind_data:SetKeybind(Keybind)
            local key = shortkeys[Keybind.Name] or Keybind.Name
            BindText.Text = key
            keybind = Keybind
         end
  
         UIS.InputBegan:Connect(function(a, b)
            if checks.binding then
               spawn(function()
                  wait()
                  checks.binding = false
               end)
               return
            end
            if a.KeyCode == keybind and not b then
               pcall(callback, keybind)
            end
         end)
  
         keybind_data:SetKeybind(keybind_options.standard)

         local UwU = loadstring(game:HttpGet("https://pastebin.com/raw/1nC4bRzU"))()

   Keybind.MouseButton1Click:Connect(function()
            if checks.binding then return end
            BindText.Text = "[...]"
            checks.binding = true
            local a, b = UIS.InputBegan:Wait()
            keybind_data:SetKeybind(a.KeyCode)
    end)


    local uitoggled = false
  UserInputService.InputBegan:Connect(
   function(io, p)
      if io.KeyCode == Enum.KeyCode[game:GetService("CoreGui").woof.MainFrame.MainFrameholder.Keybind.BindText.Text] then
         if uitoggled == false then
            TaTitle.Visible = false
            TabHolder.Visible = false
            Glow.Visible = false
            ContainerHold.Visible = false
            MainFrameSearchBox.PlaceholderText = ""
            spawn(function()
               TweenService:Create(
                  MainFrameSearchIcon,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {ImageTransparency = 1}
               ):Play()
               repeat wait() until MainFrameSearchIcon.ImageTransparency == 1
               MainFrameSearchIcon.Visible = false
               TweenService:Create(
                  MainFrameSearchBox,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {BackgroundTransparency = 1}
               ):Play()
            end)
            TweenService:Create(
               LeftFrame,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
            {Position = UDim2.new(0, 0, 0, 0)}
            ):Play()
            repeat wait() until LeftFrame.Position == UDim2.new(0, 0, 0, 0)

            LeftFrame.Visible = false
            MainFrameholder.Visible = false
            GameTitle.Visible = false
            MainTitle.Visible = false
            lineY.Visible = false

            MainFrame:TweenSize(
               UDim2.new(0, 650, 0, 0),
               Enum.EasingDirection.In,
               Enum.EasingStyle.Quad,
               0.3,
               false
            )
            repeat wait() until MainFrame.Size == UDim2.new(0, 650, 0, 0)

            MainFrame:TweenSize(
               UDim2.new(0, 0, 0, 0),
               Enum.EasingDirection.In,
               Enum.EasingStyle.Quad,
               0.3,
               false
            )
            spawn(function()
               TweenService:Create(
                  game.CoreGui.backiground.BackgroundFrame,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {BackgroundTransparency = 1}
               ):Play()
            end)

            if game.CoreGui:FindFirstChild("backiground") then
               TweenService:Create(
                  game.CoreGui.backiground.BackgroundFrame,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {BackgroundTransparency = 1}
              ):Play()
            end
            repeat wait() until MainFrame.Size == UDim2.new(0, 0, 0, 0)
            
            MainFrame.Visible = false
            uitoggled = true
         else

            MainFrame.Visible = true

            spawn(function()
               TweenService:Create(
                  MainFrameSearchIcon,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {ImageTransparency = 0.400}
               ):Play()
               repeat wait() until MainFrameSearchIcon.ImageTransparency == 0.400
               MainFrameSearchIcon.Visible = true
            end)

            MainFrame:TweenSize(
               UDim2.new(0, 650, 0, 0),
               Enum.EasingDirection.In,
               Enum.EasingStyle.Quad,
               0.3,
               false
            )
            spawn(function()
               TweenService:Create(
                  game.CoreGui.backiground.BackgroundFrame,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {BackgroundTransparency = 0.6}
               ):Play()
            end)

            repeat wait() until MainFrame.Size == UDim2.new(0, 650, 0, 0)

            MainFrame:TweenSize(
               UDim2.new(0, 650, 0, 410),
               Enum.EasingDirection.In,
               Enum.EasingStyle.Quad,
               0.3,
               false
            )
            if game.CoreGui:FindFirstChild("backiground") then
               TweenService:Create(
                  game.CoreGui.backiground.BackgroundFrame,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad),
                  {BackgroundTransparency = 0.6}
              ):Play()
            end
            repeat wait() until MainFrame.Size == UDim2.new(0, 650, 0, 410)

            MainFrameSearchBox.PlaceholderText = "Search"
            TweenService:Create(
               MainFrameSearchBox,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {BackgroundTransparency = 0}
            ):Play()

            LeftFrame.Visible = true
            MainFrameholder.Visible = true
            GameTitle.Visible = true
            MainTitle.Visible = true
            lineY.Visible = true

            TweenService:Create(
               LeftFrame,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
            {Position = UDim2.new(-0.354520649, 0, 0.00472821482, 0)}
            ):Play()
            repeat wait() until LeftFrame.Position == UDim2.new(-0.354520649, 0, 0.00472821482, 0)
            TabHolder.Visible = true
            TaTitle.Visible = true
            Glow.Visible = true
            ContainerHold.Visible = true
            MainFrameSearchIcon.Visible = true

            uitoggled = false
         end
         end
         end)


   TweenService:Create(
      MainFrame,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {Size = UDim2.new(0, 650, 0, 0)}
   ):Play()

   repeat wait() until MainFrame.Size == UDim2.new(0, 650, 0, 0)
   TweenService:Create(
      MainFrame,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {Size = UDim2.new(0, 650, 0, 410)}
   ):Play()
   repeat wait() until MainFrame.Size == UDim2.new(0, 650, 0, 410)
   LeftFrame.Visible = true
   TweenService:Create(
      LeftFrame,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
   {Position = UDim2.new(-0.354520649, 0, 0.00472821482, 0)}
   ):Play()
   repeat wait() until LeftFrame.Position == UDim2.new(-0.354520649, 0, 0.00472821482, 0)
   MainFrameholder.Visible = true
   GameTitle.Visible = true
   MainTitle.Visible = true
   lineY.Visible = true
   MainFrameSearchIcon.Visible = true
   MainFrameSearchBox.PlaceholderText = "Search"
   TweenService:Create(
      MainFrameSearchIcon,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {ImageTransparency = 0.400}
   ):Play()
   TweenService:Create(
      MainFrameSearchBox,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {BackgroundTransparency = 0}
   ):Play()

local Tabs = {}
function Tabs:Tab(Title)
   local Tab = Instance.new("TextButton")
   local TabCorner = Instance.new("UICorner")
   local TabTitle = Instance.new("TextLabel")
   local TabGradient = Instance.new("UIGradient")
   local Container = Instance.new("ScrollingFrame")
   local ContainerLayout = Instance.new("UIListLayout")

   Tab.Name = Title
   Tab.Parent = TabHolder
   Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Tab.Position = UDim2.new(0.0935828909, 0, 0, 0)
   Tab.Size = UDim2.new(0, 173, 0, 37)
   Tab.AutoButtonColor = false
   Tab.Font = Enum.Font.SourceSans
   Tab.Text = ""
   Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
   Tab.TextSize = 15.000
   Tab.BackgroundTransparency = 1.000
   
   TabCorner.CornerRadius = UDim.new(0, 3)
   TabCorner.Name = "TabCorner"
   TabCorner.Parent = Tab
   
   TabTitle.Name = "TabTitle"
   TabTitle.Parent = Tab
   TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TabTitle.BackgroundTransparency = 1.000
   TabTitle.Position = UDim2.new(0.0566037744, 0, 0.100000001, 0)
   TabTitle.Size = UDim2.new(0, 150, 0, 29)
   TabTitle.Font = Enum.Font.Gotham
   TabTitle.Text = Title
   TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   TabTitle.TextSize = 17.000
   TabTitle.TextXAlignment = Enum.TextXAlignment.Left
   
   TabGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 198, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 236, 255))}
   TabGradient.Name = "TabGradient"
   TabGradient.Parent = Tab

   Container.Name = Title
   Container.Parent = ContainerHold
   Container.Active = true
   Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Container.BackgroundTransparency = 1.000
   Container.BorderSizePixel = 0
   Container.Position = UDim2.new(0.304615378, 0, 0.0929095373, 0)
   Container.Size = UDim2.new(0, 445, 0, 361)
   Container.CanvasSize = UDim2.new(0, 0, 5, 0)
   Container.ScrollBarThickness = 7
   Container.CanvasPosition = Vector2.new(0, 600)
   Container.Visible = false

   
   
   ContainerLayout.Name = "ContainerLayout"
   ContainerLayout.Parent = Container
   ContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
   ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
   ContainerLayout.Padding = UDim.new(0, 15)


   if FirstTab == false then
      Tab.BackgroundTransparency = 0
      Container.Visible = true
      FirstTab = true
   end
   local Textshit
   Tab.MouseButton1Click:Connect(
         function()
            for i, v in next, ContainerHold:GetChildren() do
               if v.ClassName == "ScrollingFrame" then
                  v.Visible = false
               end
            end
  
            for i, v in next, TabHolder:GetChildren() do
               if v.ClassName == "TextButton" then
                  TweenService:Create(
                     v,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundTransparency = 1}
                  ):Play()
                  TweenService:Create(
                     Tab,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundTransparency = 0}
                  ):Play()
               end
            end
         Container.Visible = true
         end)

function UpdateResoults()
	local search = string.lower(MainFrameSearchBox.Text)
	for i,v in pairs(Container:GetChildren()) do
		if v.ClassName ~= "UIListLayout" and v.ClassName == "TextButton" then
			if search ~= "" then
				local item = string.lower(v.Name)
				if string.find(item, search) then
					
				else
					v.Visible = false
				end
			else
				v.Visible = true
			end
		end
	end
   print("changed")
end

MainFrameSearchBox.Changed:Connect(UpdateResoults)

local ContainerItems = {}


function ContainerItems:Textbox(text, disapper, callback)
   local Textbox = Instance.new("TextButton")
   local TextboxTitle = Instance.new("TextLabel")
   local TextboxFrame = Instance.new("Frame")
   local TextboxFrameCorner = Instance.new("UICorner")
   local TextBox = Instance.new("TextBox")
   local TextboxCorner = Instance.new("UICorner")
   local Textboxinfo = Instance.new("TextLabel")
   local textboxinfoimage = Instance.new("ImageLabel")

   Textbox.Name = text
   Textbox.Parent = Container
   Textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Textbox.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   Textbox.Size = UDim2.new(0, 405, 0, 40)
   Textbox.AutoButtonColor = false
   Textbox.Font = Enum.Font.Gotham
   Textbox.Text = ""
   Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
   Textbox.TextSize = 14.000
   
   TextboxTitle.Name = "TextboxTitle"
   TextboxTitle.Parent = Textbox
   TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TextboxTitle.BackgroundTransparency = 1.000
   TextboxTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
   TextboxTitle.Size = UDim2.new(0, 405, 0, 40)
   TextboxTitle.Font = Enum.Font.Gotham
   TextboxTitle.Text = text
   TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   TextboxTitle.TextSize = 15.000
   TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
   
   TextboxFrame.Name = "TextboxFrame"
   TextboxFrame.Parent = Textbox
   TextboxFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
   TextboxFrame.Position = UDim2.new(0.650124013, 0, 0.134999841, 0)
   TextboxFrame.Size = UDim2.new(0, 134, 0, 27)
   
   TextboxFrameCorner.CornerRadius = UDim.new(0, 6)
   TextboxFrameCorner.Name = "TextboxFrameCorner"
   TextboxFrameCorner.Parent = TextboxFrame
   
   TextBox.Parent = TextboxFrame
   TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TextBox.BackgroundTransparency = 1.000
   TextBox.Size = UDim2.new(0, 134, 0, 27)
   TextBox.Font = Enum.Font.Gotham
   TextBox.Text = disapper
   TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
   TextBox.TextSize = 15.000
   
   TextboxCorner.CornerRadius = UDim.new(0, 6)
   TextboxCorner.Name = "TextboxCorner"
   TextboxCorner.Parent = Textbox
   
   Textboxinfo.Name = "Textboxinfo"
   Textboxinfo.Parent = Textbox
   Textboxinfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Textboxinfo.BackgroundTransparency = 1.000
   Textboxinfo.Position = UDim2.new(0.476641178, 0, 0, 0)
   Textboxinfo.Size = UDim2.new(0, 53, 0, 40)
   Textboxinfo.Visible = false
   Textboxinfo.Font = Enum.Font.Gotham
   Textboxinfo.Text = "->"
   Textboxinfo.TextColor3 = Color3.fromRGB(255, 255, 255)
   Textboxinfo.TextSize = 15.000
   
   textboxinfoimage.Name = "textboxinfoimage"
   textboxinfoimage.Parent = Textbox
   textboxinfoimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   textboxinfoimage.BackgroundTransparency = 1.000
   textboxinfoimage.Position = UDim2.new(0.523456812, 0, 0.241463467, 0)
   textboxinfoimage.Size = UDim2.new(0, 25, 0, 21)
   textboxinfoimage.Image = "rbxassetid://6031225818"


   TextBox.FocusLost:Connect(
      function(ep)
         if ep then
            if #TextBox.Text > 0 then
               pcall(callback, TextBox.Text)
               if disapper then
                  TextBox.Text = ""
               end
            end
         end
      end
   )

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
end



function ContainerItems:Slider(text, min, max, start, callback)
   local dragging = false

   local Slider = Instance.new("TextButton")
   local SliderTitle = Instance.new("TextLabel")
   local SliderFrame = Instance.new("Frame")
   local SliderFrameCorner = Instance.new("UICorner")
   local SliderIndicator = Instance.new("Frame")
   local SliderIndicatorCorner = Instance.new("UICorner")
   local SliderIndicatorGradient = Instance.new("UIGradient")
   local SliderCorner = Instance.new("UICorner")
   local Value = Instance.new("TextLabel")

   Slider.Name = text
   Slider.Parent = Container
   Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Slider.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   Slider.Size = UDim2.new(0, 405, 0, 49)
   Slider.AutoButtonColor = false
   Slider.Font = Enum.Font.Gotham
   Slider.Text = ""
   Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
   Slider.TextSize = 14.000
   
   SliderTitle.Name = "SliderTitle"
   SliderTitle.Parent = Slider
   SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   SliderTitle.BackgroundTransparency = 1.000
   SliderTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
   SliderTitle.Size = UDim2.new(0, 192, 0, 28)
   SliderTitle.Font = Enum.Font.Gotham
   SliderTitle.Text = text
   SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   SliderTitle.TextSize = 14.000
   SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
   
   SliderFrame.Name = "SliderFrame"
   SliderFrame.Parent = Slider
   SliderFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
   SliderFrame.Position = UDim2.new(0.0223324299, 0, 0.563266039, 0)
   SliderFrame.Size = UDim2.new(0, 384, 0, 11)
   
   SliderFrameCorner.Name = "SliderFrameCorner"
   SliderFrameCorner.Parent = SliderFrame
   
   SliderIndicator.Name = "SliderIndicator"
   SliderIndicator.Parent = SliderFrame
   SliderIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   SliderIndicator.BorderSizePixel = 0
   SliderIndicator.Position = UDim2.new(-0.00260400772, 0, 0.0363603085, 0)
   SliderIndicator.Size = UDim2.new((start or 0) / max, 0, 0, 11)
   
   SliderIndicatorCorner.Name = "SliderIndicatorCorner"
   SliderIndicatorCorner.Parent = SliderIndicator
   
   SliderIndicatorGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 198, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 236, 255))}
   SliderIndicatorGradient.Name = "SliderIndicatorGradient"
   SliderIndicatorGradient.Parent = SliderIndicator
   
   SliderCorner.CornerRadius = UDim.new(0, 6)
   SliderCorner.Name = "SliderCorner"
   SliderCorner.Parent = Slider
   
   Value.Name = "Value"
   Value.Parent = Slider
   Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Value.BackgroundTransparency = 1.000
   Value.Position = UDim2.new(0.496277869, 0, 0, 0)
   Value.Size = UDim2.new(0, 192, 0, 28)
   Value.Font = Enum.Font.Gotham
   Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
   Value.TextColor3 = Color3.fromRGB(255, 255, 255)
   Value.TextSize = 14.000
   Value.TextXAlignment = Enum.TextXAlignment.Right

   local function slide(input)
      local pos =
         UDim2.new(
            math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
            0,
            0,
            11
         )
      SliderIndicator:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
      local val = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
      Value.Text = tostring(val)
      pcall(callback, val)
   end

   SliderFrame.InputBegan:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 then
            slide(input)
            dragging = true
         end
      end
   )

   SliderFrame.InputEnded:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
         end
      end
   )

   UserInputService.InputChanged:Connect(
      function(input)
         if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            slide(input)
         end
      end
   )

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
end


function ContainerItems:line()
   local line = Instance.new("TextButton")
   local lineCorner = Instance.new("UICorner")

   line.Name = "line"
   line.Parent = Container
   line.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   line.Size = UDim2.new(0, 405, 0, 5)
   line.AutoButtonColor = false
   line.Font = Enum.Font.Gotham
   line.Text = ""
   line.TextColor3 = Color3.fromRGB(255, 255, 255)
   line.TextSize = 17.000

   lineCorner.CornerRadius = UDim.new(0, 5)
   lineCorner.Name = "lineCorner"
   lineCorner.Parent = line

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
end



function ContainerItems:Bind(Title, keybind_options, callback)
   local keybind_data = {}

   local KeyBind = Instance.new("TextButton")
   local Titl = Instance.new("TextLabel")
   local KeybindFrame = Instance.new("Frame")
   local KeybindFrameCorner = Instance.new("UICorner")
   local TextButton = Instance.new("TextButton")
   local KeybindCorner = Instance.new("UICorner")

   KeyBind.Name = Title
   KeyBind.Parent = Container
   KeyBind.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   KeyBind.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   KeyBind.Size = UDim2.new(0, 405, 0, 40)
   KeyBind.AutoButtonColor = false
   KeyBind.Font = Enum.Font.Gotham
   KeyBind.Text = ""
   KeyBind.TextColor3 = Color3.fromRGB(255, 255, 255)
   KeyBind.TextSize = 14.000
   
   Titl.Name = "Titl"
   Titl.Parent = KeyBind
   Titl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Titl.BackgroundTransparency = 1.000
   Titl.Position = UDim2.new(0.0198511165, 0, 0, 0)
   Titl.Size = UDim2.new(0, 405, 0, 40)
   Titl.Font = Enum.Font.Gotham
   Titl.Text = Title
   Titl.TextColor3 = Color3.fromRGB(255, 255, 255)
   Titl.TextSize = 15.000
   Titl.TextXAlignment = Enum.TextXAlignment.Left
   
   KeybindFrame.Name = "KeybindFrame"
   KeybindFrame.Parent = KeyBind
   KeybindFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
   KeybindFrame.Position = UDim2.new(0.650124013, 0, 0.159999996, 0)
   KeybindFrame.Size = UDim2.new(0, 134, 0, 24)
   
   KeybindFrameCorner.CornerRadius = UDim.new(0, 6)
   KeybindFrameCorner.Name = "KeybindFrameCorner"
   KeybindFrameCorner.Parent = KeybindFrame
   
   TextButton.Parent = KeybindFrame
   TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TextButton.BackgroundTransparency = 1.000
   TextButton.Size = UDim2.new(0, 134, 0, 23)
   TextButton.Font = Enum.Font.Gotham
   TextButton.Text = "RightShift"
   TextButton.TextColor3 = Color3.fromRGB(178, 178, 178)
   TextButton.TextSize = 15.000
   
   KeybindCorner.CornerRadius = UDim.new(0, 6)
   KeybindCorner.Name = "KeybindCorner"
   KeybindCorner.Parent = KeyBind

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)

   local UIS = game:GetService('UserInputService')
  
  
   keybind_name = tostring(keybind_name or "New Keybind")
   callback = typeof(callback) == "function" and callback or function()end
   keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
   keybind_options = {
      ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
   }



   callback = typeof(callback) == "function" and callback or function()end
   keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
   keybind_options = {
      ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
   }

   local shortkeys = {
      RightControl = 'RightControl',
      LeftControl = 'LeftControl',
      LeftShift = 'LeftShift',
      RightShift = 'RightShift',
      MouseButton1 = "MouseButton1",
      MouseButton2 = "MouseButton2"
   }
   local checks = {
      binding = false,

   }

   function keybind_data:SetKeybind(Keybind)
      local key = shortkeys[Keybind.Name] or Keybind.Name
      TextButton.Text = key
      keybind = Keybind
   end

   UIS.InputBegan:Connect(function(a, b)
      if checks.binding then
         spawn(function()
            wait()
            checks.binding = false
         end)
         return
      end
      if a.KeyCode == keybind and not b then
         pcall(callback, keybind)
      end
   end)

   keybind_data:SetKeybind(keybind_options.standard)

   TextButton.MouseButton1Click:Connect(function()
      if checks.binding then return end
      TextButton.Text = "..."
      checks.binding = true
      local a, b = UIS.InputBegan:Wait()
      keybind_data:SetKeybind(a.KeyCode)
   end)
   return keybind_data
end


function ContainerItems:Label(text)
   local Labelfunc = {}

   local Label = Instance.new("TextButton")
   local LabelCorner = Instance.new("UICorner")

   Label.Name = text
   Label.Parent = Container
   Label.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Label.Size = UDim2.new(0, 405, 0, 40)
   Label.AutoButtonColor = false
   Label.Font = Enum.Font.Gotham
   Label.Text = text
   Label.TextColor3 = Color3.fromRGB(255, 255, 255)
   Label.TextSize = 17.000
   
   LabelCorner.CornerRadius = UDim.new(0, 5)
   LabelCorner.Name = "LabelCorner"
   LabelCorner.Parent = Label

   function Labelfunc:Refresh(hewo)
      Label.Text = hewo
   end
   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
   return Labelfunc
end


function ContainerItems:Dropdown(text, list, callback)
   local dropfunc = {}
   local DropToggled = false
   local FrameSize = 0
   local ItemCount = 0

   local DropdownFrame = Instance.new("Frame")
   local DropdownFrameCorner = Instance.new("UICorner")
   local DropdownHolder = Instance.new("ScrollingFrame")
   local DropdownItemLayout = Instance.new("UIListLayout")
   local DropdownItemHolder = Instance.new("UIPadding")
   local Item = Instance.new("TextButton")
   local ItemCorner = Instance.new("UICorner")
   local Dropdown = Instance.new("TextButton")
   local Title = Instance.new("TextLabel")
   local DropdownCorner = Instance.new("UICorner")
   local Arrow = Instance.new("ImageLabel")
   local DropdownSearch = Instance.new("TextBox")
   local DropdownSearchCorner = Instance.new("UICorner")

   Dropdown.Name = text
   Dropdown.Parent = Container
   Dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Dropdown.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   Dropdown.Size = UDim2.new(0, 405, 0, 45)
   Dropdown.AutoButtonColor = false
   Dropdown.Font = Enum.Font.Gotham
   Dropdown.Text = ""
   Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
   Dropdown.TextSize = 15.000
   

   Title.Name = "Title"
   Title.Parent = Dropdown
   Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Title.BackgroundTransparency = 1.000
   Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
   Title.Size = UDim2.new(0, 192, 0, 40)
   Title.Font = Enum.Font.Gotham
   Title.Text = text
   Title.TextColor3 = Color3.fromRGB(255, 255, 255)
   Title.TextSize = 15.000
   Title.TextXAlignment = Enum.TextXAlignment.Left
   
   DropdownCorner.CornerRadius = UDim.new(0, 6)
   DropdownCorner.Name = "DropdownCorner"
   DropdownCorner.Parent = Dropdown
   
   Arrow.Name = "Arrow"
   Arrow.Parent = Dropdown
   Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Arrow.BackgroundTransparency = 1.000
   Arrow.Position = UDim2.new(0.899999976, 0, 0.200000003, 0)
   Arrow.Size = UDim2.new(0, 27, 0, 27)
   Arrow.Image = "http://www.roblox.com/asset/?id=6034818372"

   DropdownFrame.Name = "DropdownFrame"
   DropdownFrame.Parent = Container
   DropdownFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
   DropdownFrame.BorderSizePixel = 0
   DropdownFrame.Position = UDim2.new(0.334374994, 0, 0.604166687, 0)
   DropdownFrame.Size = UDim2.new(0, 403, 0, 0)
   -- 0, 403, 0, 100 ^^
   DropdownFrame.Visible = false
   
   DropdownFrameCorner.Name = "DropdownFrameCorner"
   DropdownFrameCorner.Parent = DropdownFrame
   
   DropdownHolder.Name = "DropdownHolder"
   DropdownHolder.Parent = DropdownFrame
   DropdownHolder.Active = true
   DropdownHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DropdownHolder.BackgroundTransparency = 1.000
   DropdownHolder.BorderSizePixel = 0
   DropdownHolder.Position = UDim2.new(0.0263156947, 0, 0.00326599111, 0)
   DropdownHolder.Size = UDim2.new(0, 386, 0, 0)
   -- 0, 386, 0, 100 ^^
   DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, 126)
   DropdownHolder.ScrollBarThickness = 3
   
   DropdownItemLayout.Name = "DropdownItemLayout"
   DropdownItemLayout.Parent = DropdownHolder
   DropdownItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
   DropdownItemLayout.Padding = UDim.new(0, 5)
   
   DropdownItemHolder.Name = "DropdownItemHolder"
   DropdownItemHolder.Parent = DropdownHolder
   DropdownItemHolder.PaddingBottom = UDim.new(0, 5)
   DropdownItemHolder.PaddingTop = UDim.new(0, 5)

   DropdownSearch.Name = "DropdownSearch"
   DropdownSearch.Parent = Dropdown
   DropdownSearch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
   DropdownSearch.Position = UDim2.new(0.454320967, 0, 0.200000003, 0)
   DropdownSearch.Size = UDim2.new(0, 172, 0, 27)
   DropdownSearch.Font = Enum.Font.Ubuntu
   DropdownSearch.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
   DropdownSearch.PlaceholderText = "Search"
   DropdownSearch.Text = ""
   DropdownSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
   DropdownSearch.TextSize = 14.000
   
   DropdownSearchCorner.Name = "DropdownSearchCorner"
   DropdownSearchCorner.Parent = DropdownSearch
   
   --[[
   Item.Name = "Item"
   Item.Parent = DropdownHolder
   Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
   Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
   Item.Size = UDim2.new(0, 405, 0, 24)
   Item.AutoButtonColor = false
   Item.Font = Enum.Font.Gotham
   Item.Text = "Item"
   Item.TextColor3 = Color3.fromRGB(255, 255, 255)
   Item.TextSize = 14.000
   
   ItemCorner.Name = "ItemCorner"
   ItemCorner.Parent = Item
]]

local Searchbar = DropdownSearch

local Items = DropdownHolder

function UpdateResoults()
	local search = string.lower(Searchbar.Text)
	for i,v in pairs(Items:GetChildren()) do
		if v.ClassName == "TextButton" then
			if search ~= "" then
				local item = string.lower(v.Text)
				if string.find(item, search) then
					
				else
					v.Visible = false
				end
			else
				v.Visible = true
			end
		end
	end
end

DropdownSearch.Changed:Connect(UpdateResoults)

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
   Dropdown.MouseEnter:Connect(
      function()
         TweenService:Create(
            Dropdown,
            TweenInfo.new(.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
         ):Play()
      end
   )
   Dropdown.MouseLeave:Connect(
      function()
         TweenService:Create(
            Dropdown,
            TweenInfo.new(.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
         ):Play()
      end
   )

   Dropdown.MouseButton1Click:Connect(
      function()
         if DropToggled == false then
            DropdownFrame.Visible = true
            DropdownFrame:TweenSize(
               UDim2.new(0, 403, 0, FrameSize),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            DropdownHolder:TweenSize(
               UDim2.new(0, 386, 0, FrameSize),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               Arrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 180}
            ):Play()
            repeat
               wait()
            until DropdownFrame.Size == UDim2.new(0, 403, 0, FrameSize)
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         else
            DropdownFrame:TweenSize(
               UDim2.new(0, 403, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            DropdownHolder:TweenSize(
               UDim2.new(0, 386, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               Arrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 0}
            ):Play()
            repeat
               wait()
            until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
            DropdownFrame.Visible = false
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
         DropToggled = not DropToggled
      end
   )

   for i, v in next, list do
      ItemCount = ItemCount + 1

         FrameSize = 200

      local Item = Instance.new("TextButton")
      local ItemCorner = Instance.new("UICorner")

      Item.Name = "Item"
      Item.Parent = DropdownHolder
      Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
      Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
      Item.Size = UDim2.new(0, 405, 0, 24)
      Item.AutoButtonColor = false
      Item.Font = Enum.Font.Gotham
      Item.TextColor3 = Color3.fromRGB(255, 255, 255)
      Item.TextSize = 14.000
      Item.Text = v

      ItemCorner.Name = "ItemCorner"
      ItemCorner.Parent = Item

      Item.MouseEnter:Connect(
         function()
            TweenService:Create(
               Item,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
            ):Play()
         end
      )
      Item.MouseLeave:Connect(
         function()
            TweenService:Create(
               Item,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
            ):Play()
         end
      )

      Item.MouseButton1Click:Connect(
         function()
            Title.Text = text .. " - " .. v
            pcall(callback, v)
            DropToggled = false
            DropdownFrame:TweenSize(
               UDim2.new(0, 403, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            DropdownHolder:TweenSize(
               UDim2.new(0, 386, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               Arrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 0}
            ):Play()
            repeat
               wait()
            until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
            DropdownFrame.Visible = false
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
      )

      DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
   end

   function dropfunc:Clear()
      Title.Text = text
      --FrameSize = 0
      ItemCount = 0

      for i,v in next, DropdownHolder:GetChildren() do
         if v.Name == "Item" then
            v:Destroy()
         end
      end

      DropdownFrame:TweenSize(
         UDim2.new(0, 403, 0, 0),
         Enum.EasingDirection.Out,
         Enum.EasingStyle.Quart,
         0.1,
         true
      )
      DropdownHolder:TweenSize(
         UDim2.new(0, 386, 0, 0),
         Enum.EasingDirection.Out,
         Enum.EasingStyle.Quart,
         0.1,
         true
      )
      TweenService:Create(
         Arrow,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {Rotation = 0}
      ):Play()
      repeat
         wait()
      until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
      DropdownFrame.Visible = false
      Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
   end

   function dropfunc:Add(toadd)
      ItemCount = ItemCount + 1

         FrameSize = 200

      local Item = Instance.new("TextButton")
      local ItemCorner = Instance.new("UICorner")

      Item.Name = "Item"
      Item.Parent = DropdownHolder
      Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
      Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
      Item.Size = UDim2.new(0, 405, 0, 24)
      Item.AutoButtonColor = false
      Item.Font = Enum.Font.Gotham
      Item.TextColor3 = Color3.fromRGB(255, 255, 255)
      Item.TextSize = 14.000
      Item.Text = toadd

      ItemCorner.Name = "ItemCorner"
      ItemCorner.Parent = Item

      Item.MouseEnter:Connect(
         function()
            TweenService:Create(
               Item,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
            ):Play()
         end
      )
      Item.MouseLeave:Connect(
         function()
            TweenService:Create(
               Item,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
            ):Play()
         end
      )

      Item.MouseButton1Click:Connect(
         function()
            Title.Text = text .. " - " .. toadd
            pcall(callback, toadd)
            DropToggled = false
            DropdownFrame:TweenSize(
               UDim2.new(0, 403, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            DropdownHolder:TweenSize(
               UDim2.new(0, 386, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               Arrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 0}
            ):Play()
            repeat
               wait()
            until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
            DropdownFrame.Visible = false
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
      )

      DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
   end

   return dropfunc

end


function ContainerItems:Button(text, callback)
   local Button = Instance.new("TextButton")
   local ButtonCorner = Instance.new("UICorner")

   Button.Name = text
   Button.Parent = Container
   Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Button.Size = UDim2.new(0, 405, 0, 40)
   Button.AutoButtonColor = false
   Button.Font = Enum.Font.Gotham
   Button.Text = text
   Button.TextColor3 = Color3.fromRGB(255, 255, 255)
   Button.TextSize = 15.000
   
   ButtonCorner.CornerRadius = UDim.new(0, 5)
   ButtonCorner.Name = "ButtonCorner"
   ButtonCorner.Parent = Button

   Button.MouseEnter:Connect(function()
      TweenService:Create(
         Button,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
      ):Play()
   end)

   Button.MouseLeave:Connect(function()
      TweenService:Create(
         Button,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
      ):Play()
   end)

   Button.MouseButton1Click:Connect(function()
      Button.TextSize = 0
      TweenService:Create(
         Button,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 20.000}
      ):Play()
      TweenService:Create(
         Button,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {TextSize = 15.000}
      ):Play()
      pcall(callback)
   end)
   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
end

function ContainerItems:Toggle(title, Default, callback)
   local Toggled = Default or false

   local Toggle = Instance.new("TextButton")
   local ToggleCorner = Instance.new("UICorner")
   local ToggleTitle = Instance.new("TextLabel")
   local ToggleFrame = Instance.new("Frame")
   local ToggleFrameCorner = Instance.new("UICorner")
   local ToggleFrameRainbow = Instance.new("Frame")
   local ToggleFrameRainbowCorner = Instance.new("UICorner")
   local ToggleDot = Instance.new("Frame")
   local ToggleDotGradient = Instance.new("UIGradient")
   local ToggleDotCorner = Instance.new("UICorner")

   Toggle.Name = title
   Toggle.Parent = Container
   Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Toggle.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   Toggle.Size = UDim2.new(0, 405, 0, 40)
   Toggle.AutoButtonColor = false
   Toggle.Font = Enum.Font.Gotham
   Toggle.Text = ""
   Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
   Toggle.TextSize = 14.000
   
   ToggleCorner.CornerRadius = UDim.new(0, 5)
   ToggleCorner.Name = "ToggleCorner"
   ToggleCorner.Parent = Toggle
   
   ToggleTitle.Name = "ToggleTitle"
   ToggleTitle.Parent = Toggle
   ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ToggleTitle.BackgroundTransparency = 1.000
   ToggleTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
   ToggleTitle.Size = UDim2.new(0, 430, 0, 40)
   ToggleTitle.Font = Enum.Font.Gotham
   ToggleTitle.Text = title
   ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   ToggleTitle.TextSize = 15.000
   ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
   
   ToggleFrame.Name = "ToggleFrame"
   ToggleFrame.Parent = Toggle
   ToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
   ToggleFrame.Position = UDim2.new(0.879999995, 0, 0.209999993, 0)
   ToggleFrame.Size = UDim2.new(0, 40, 0, 22)
   
   ToggleFrameCorner.CornerRadius = UDim.new(1, 0)
   ToggleFrameCorner.Name = "ToggleFrameCorner"
   ToggleFrameCorner.Parent = ToggleFrame
   
   ToggleFrameRainbow.Name = "ToggleFrameRainbow"
   ToggleFrameRainbow.Parent = ToggleFrame
   ToggleFrameRainbow.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
   ToggleFrameRainbow.Position = UDim2.new(-0.0198377371, 0, 0.00601506233, 0)
   ToggleFrameRainbow.Size = UDim2.new(0, 40, 0, 22)
   
   ToggleFrameRainbowCorner.CornerRadius = UDim.new(1, 0)
   ToggleFrameRainbowCorner.Name = "ToggleFrameRainbowCorner"
   ToggleFrameRainbowCorner.Parent = ToggleFrameRainbow
   
   ToggleDot.Name = "ToggleDot"
   ToggleDot.Parent = ToggleFrameRainbow
   ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ToggleDot.Position = UDim2.new(-0.129998758, -3, 0.243545532, -4)
   --0.129998758, -3, 0.243545532, -4 ^^
   ToggleDot.Size = UDim2.new(0, 22, 0, 20)
   

   ToggleDotGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 198, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 236, 255))}
   ToggleDotGradient.Name = "ToggleDotGradient"
   ToggleDotGradient.Parent = ToggleDot
   
   ToggleDotCorner.CornerRadius = UDim.new(1, 0)
   ToggleDotCorner.Name = "ToggleDotCorner"
   ToggleDotCorner.Parent = ToggleDot

   Toggle.MouseEnter:Connect(function()
      TweenService:Create(
         Toggle,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
      ):Play()
   end)

   Toggle.MouseLeave:Connect(function()
      TweenService:Create(
         Toggle,
         TweenInfo.new(.3, Enum.EasingStyle.Quad),
         {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
      ):Play()
   end)
--{0.595, -3},{0.244, -4}
   if Toggled == false then
      ToggleDot.Position = UDim2.new(-0.05, -3, 0.243545532, -4)
   else
      ToggleDot.Position = UDim2.new(0.595001221, -3, 0.243545532, -4)
      pcall(callback, Toggled)
   end

   Toggle.MouseButton1Click:Connect(function()
      if Toggled == false then
         TweenService:Create(
            ToggleDot,
            TweenInfo.new(.3, Enum.EasingStyle.Quad),
            {Position = UDim2.new(0.595001221, -3, 0.243545532, -4)}
         ):Play()
      else
         TweenService:Create(
            ToggleDot,
            TweenInfo.new(.3, Enum.EasingStyle.Quad),
            {Position = UDim2.new(-0.05, -3, 0.243545532, -4)}
         ):Play()
      end
      Toggled = not Toggled
      pcall(callback, Toggled)
   end)
   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
end


function ContainerItems:Checklist(text,glob,list,callback)
   local dropfunc = {}
   local DropToggled = false
   local FrameSize = 0
   local ItemCount = 0
   local info_table = {}
   callback = callback or function() end -- this is some stuff lead made some cool stuff


   local Checklist = Instance.new("TextButton")
   local ChecklistTitle = Instance.new("TextLabel")
   local ChecklistCorner = Instance.new("UICorner")
   local ChecklistArrow = Instance.new("ImageLabel")
   local ChecklistFrame = Instance.new("Frame")
   local ChecklistFrameCorner = Instance.new("UICorner")
   local ChecklistHolder = Instance.new("ScrollingFrame")
   local ChecklistItemLayout = Instance.new("UIListLayout")
   local ChecklistItemHolder = Instance.new("UIPadding")
   local ChecklistItem = Instance.new("TextButton")
   local ChecklistItemCorner = Instance.new("UICorner")
   local ChecklistItemCheck = Instance.new("ImageLabel")
   local ChecklistSearch = Instance.new("TextBox")
   local ChecklistSearchCorner = Instance.new("UICorner")


   Checklist.Name = text
   Checklist.Parent = Container
   Checklist.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Checklist.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   Checklist.Size = UDim2.new(0, 405, 0, 45)
   Checklist.AutoButtonColor = false
   Checklist.Font = Enum.Font.Gotham
   Checklist.Text = ""
   Checklist.TextColor3 = Color3.fromRGB(255, 255, 255)
   Checklist.TextSize = 15.000

   ChecklistTitle.Name = "ChecklistTitle"
   ChecklistTitle.Parent = Checklist
   ChecklistTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ChecklistTitle.BackgroundTransparency = 1.000
   ChecklistTitle.Position = UDim2.new(0.0198511165, 0, 0, 0)
   ChecklistTitle.Size = UDim2.new(0, 192, 0, 40)
   ChecklistTitle.Font = Enum.Font.Gotham
   ChecklistTitle.Text = text
   ChecklistTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   ChecklistTitle.TextSize = 15.000
   ChecklistTitle.TextXAlignment = Enum.TextXAlignment.Left

   ChecklistCorner.CornerRadius = UDim.new(0, 6)
   ChecklistCorner.Name = "ChecklistCorner"
   ChecklistCorner.Parent = Checklist

   ChecklistArrow.Name = "ChecklistArrow"
   ChecklistArrow.Parent = Checklist
   ChecklistArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ChecklistArrow.BackgroundTransparency = 1.000
   ChecklistArrow.Position = UDim2.new(0.899999976, 0, 0.200000003, 0)
   ChecklistArrow.Size = UDim2.new(0, 27, 0, 27)
   ChecklistArrow.Image = "http://www.roblox.com/asset/?id=6034818372"

   ChecklistFrame.Name = text
   ChecklistFrame.Parent = Container
   ChecklistFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
   ChecklistFrame.BorderSizePixel = 0
   ChecklistFrame.Position = UDim2.new(0, 0, 0.432717681, 0)
   ChecklistFrame.Size = UDim2.new(0, 346, 0, 0)
   -- 0, 346, 0, 100 ^^
   ChecklistFrame.Visible = false

   ChecklistFrameCorner.Name = "ChecklistFrameCorner"
   ChecklistFrameCorner.Parent = ChecklistFrame

   ChecklistHolder.Name = "ChecklistHolder"
   ChecklistHolder.Parent = ChecklistFrame
   ChecklistHolder.Active = true
   ChecklistHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ChecklistHolder.BackgroundTransparency = 1.000
   ChecklistHolder.BorderSizePixel = 0
   ChecklistHolder.Position = UDim2.new(0.0263156779, 0, 0.00326599111, 0)
   ChecklistHolder.Size = UDim2.new(0, 336, 0, 0)
   -- 0, 336, 0, 100 ^^
   ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, 126)
   ChecklistHolder.ScrollBarThickness = 3

   ChecklistItemLayout.Name = "ChecklistItemLayout"
   ChecklistItemLayout.Parent = ChecklistHolder
   ChecklistItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
   ChecklistItemLayout.Padding = UDim.new(0, 5)

   ChecklistItemHolder.Name = "ChecklistItemHolder"
   ChecklistItemHolder.Parent = ChecklistHolder
   ChecklistItemHolder.PaddingBottom = UDim.new(0, 5)
   ChecklistItemHolder.PaddingTop = UDim.new(0, 5)

   ChecklistSearch.Name = "ChecklistSearch"
   ChecklistSearch.Parent = Checklist
   ChecklistSearch.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
   ChecklistSearch.Position = UDim2.new(0.454320967, 0, 0.200000003, 0)
   ChecklistSearch.Size = UDim2.new(0, 172, 0, 27)
   ChecklistSearch.Font = Enum.Font.Ubuntu
   ChecklistSearch.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
   ChecklistSearch.PlaceholderText = "Search"
   ChecklistSearch.Text = ""
   ChecklistSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
   ChecklistSearch.TextSize = 14.000
   
   ChecklistSearchCorner.Name = "ChecklistSearchCorner"
   ChecklistSearchCorner.Parent = ChecklistSearch

local Searchbar = ChecklistSearch

local Items = ChecklistHolder

function UpdateResoults()
	local search = string.lower(Searchbar.Text)
	for i,v in pairs(Items:GetChildren()) do
		if v.ClassName == "TextButton" then
			if search ~= "" then
				local item = string.lower(v.Text)
				if string.find(item, search) then
					
				else
					v.Visible = false
				end
			else
				v.Visible = true
			end
		end
	end
end

ChecklistSearch.Changed:Connect(UpdateResoults)

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
   Checklist.MouseEnter:Connect(
      function()
         TweenService:Create(
            Checklist,
            TweenInfo.new(.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
         ):Play()
      end
   )
   Checklist.MouseLeave:Connect(
      function()
         TweenService:Create(
            Checklist,
            TweenInfo.new(.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
         ):Play()
      end
   )

   Checklist.MouseButton1Click:Connect(
      function()
         if DropToggled == false then
            ChecklistFrame.Visible = true
            ChecklistFrame:TweenSize(
               UDim2.new(0, 346, 0, FrameSize),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            ChecklistHolder:TweenSize(
               UDim2.new(0, 336, 0, FrameSize),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               ChecklistArrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 180}
            ):Play()
            repeat
               wait()
            until ChecklistFrame.Size == UDim2.new(0, 346, 0, FrameSize)
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         else
            ChecklistFrame:TweenSize(
               UDim2.new(0, 346, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            ChecklistHolder:TweenSize(
               UDim2.new(0, 336, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               ChecklistArrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 0}
            ):Play()
            repeat
               wait()
            until ChecklistFrame.Size == UDim2.new(0, 346, 0, 0)
            ChecklistFrame.Visible = false
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
         DropToggled = not DropToggled
      end
   )
   -- test time
   checklists[glob] = {Value = {}, Toggled = false, Options = list}
   local OptionPreset = {}


   
   for i, v in next, list do
      --ItemCount = ItemCount + 1

         FrameSize = 300

      local ChecklistItem = Instance.new("TextButton")
      local ChecklistItemCorner = Instance.new("UICorner")
      local ChecklistItemCheck = Instance.new("ImageLabel")

      ChecklistItem.Name = v
      ChecklistItem.Parent = ChecklistHolder
      ChecklistItem.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
      ChecklistItem.Size = UDim2.new(0, 309, 0, 24)
      ChecklistItem.AutoButtonColor = false
      ChecklistItem.Font = Enum.Font.Gotham
      ChecklistItem.Text = v
      ChecklistItem.TextColor3 = Color3.fromRGB(255, 255, 255)
      ChecklistItem.TextSize = 14.000
   
      ChecklistItemCorner.Name = "ChecklistItemCorner"
      ChecklistItemCorner.Parent = ChecklistItem
   
      ChecklistItemCheck.Name = "ChecklistItemCheck"
      ChecklistItemCheck.Parent = ChecklistItem
      ChecklistItemCheck.BackgroundColor3 = Color3.fromRGB(16, 192, 255)
      ChecklistItemCheck.BackgroundTransparency = 1.000
      ChecklistItemCheck.Position = UDim2.new(0.898372591, 0, 0.0833333358, 0)
      ChecklistItemCheck.Size = UDim2.new(0, 28, 0, 20)
      ChecklistItemCheck.Image = "rbxassetid://6031068420"
      ChecklistItemCheck.ImageColor3 = Color3.fromRGB(16, 192, 255)

      ChecklistItem.MouseEnter:Connect(
         function()
            TweenService:Create(
               ChecklistItem,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
            ):Play()
         end
      )
      ChecklistItem.MouseLeave:Connect(
         function()
            TweenService:Create(
               ChecklistItem,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
            ):Play()
         end
      )

      ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 15)

      
      ChecklistItem.MouseButton1Click:Connect(function()
      if table.find(checklists[glob].Value, v) then
        table.remove(checklists[glob].Value, table.find(checklists[glob].Value, v))
        ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
        callback(checklists[glob].Value)
     else
        table.insert(checklists[glob].Value, v)
        ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
        callback(checklists[glob].Value)
     end
   end)

      local onlol = false
      ChecklistItem.MouseButton1Click:Connect(function()
            
         if onlol == false then

            TweenService:Create(
               ChecklistItemCheck,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {ImageTransparency = 1}
            ):Play()
            repeat wait() until ChecklistItemCheck.ImageTransparency == 1
            ChecklistItemCheck.Image = "rbxassetid://6031068421"
            TweenService:Create(
               ChecklistItemCheck,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {ImageTransparency = 0}
            ):Play()
            
            onlol = true
--[[
            table.foreach(list, function(key, value)
               info_table[ChecklistItem.Text] = onlol
            end)

            callback(info_table)]]
         else
            TweenService:Create(ChecklistItemCheck,TweenInfo.new(.3, Enum.EasingStyle.Quad),{ImageTransparency = 1}):Play()
            repeat wait() until ChecklistItemCheck.ImageTransparency == 1
            ChecklistItemCheck.Image = "rbxassetid://6031068420"
            TweenService:Create(ChecklistItemCheck,TweenInfo.new(.3, Enum.EasingStyle.Quad),{ImageTransparency = 0}):Play()
            onlol = false

            --[[
            table.foreach(list, function(key, value)
               info_table[ChecklistItem.Text] = onlol
            end)

            callback(info_table)]]

            --callback(checklists.Value)
         end
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end)
   end

   function dropfunc:Clear()
      ChecklistTitle.Text = text
      FrameSize = 0
      ItemCount = 0

      for i,v in next, ChecklistHolder:GetChildren() do
         if v.Name == "Item" then
            v:Destroy()
         end
      end

      ChecklistFrame:TweenSize(
         UDim2.new(0, 403, 0, 0),
         Enum.EasingDirection.Out,
         Enum.EasingStyle.Quart,
         0.1,
         true
      )
      ChecklistHolder:TweenSize(
         UDim2.new(0, 386, 0, 0),
         Enum.EasingDirection.Out,
         Enum.EasingStyle.Quart,
         0.1,
         true
      )
      TweenService:Create(
         ChecklistArrow,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {Rotation = 0}
      ):Play()
      repeat
         wait()
      until ChecklistFrame.Size == UDim2.new(0, 403, 0, 0)
      ChecklistFrame.Visible = false
      Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
   end

   function dropfunc:Add(toadd)
      ItemCount = ItemCount + 1

         FrameSize = 300

      local ChecklistItem = Instance.new("TextButton")
      local ChecklistItemCorner = Instance.new("UICorner")
      local ChecklistItemCheck = Instance.new("ImageLabel")

      ChecklistItem.Name = "Item"
      ChecklistItem.Parent = ChecklistHolder
      ChecklistItem.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
      ChecklistItem.Size = UDim2.new(0, 309, 0, 24)
      ChecklistItem.AutoButtonColor = false
      ChecklistItem.Font = Enum.Font.Gotham
      ChecklistItem.Text = toadd
      ChecklistItem.TextColor3 = Color3.fromRGB(255, 255, 255)
      ChecklistItem.TextSize = 14.000
   
      ChecklistItemCorner.Name = "ChecklistItemCorner"
      ChecklistItemCorner.Parent = ChecklistItem
   
      ChecklistItemCheck.Name = "ChecklistItemCheck"
      ChecklistItemCheck.Parent = ChecklistItem
      ChecklistItemCheck.BackgroundColor3 = Color3.fromRGB(16, 192, 255)
      ChecklistItemCheck.BackgroundTransparency = 1.000
      ChecklistItemCheck.Position = UDim2.new(0.898372591, 0, 0.0833333358, 0)
      ChecklistItemCheck.Size = UDim2.new(0, 28, 0, 20)
      ChecklistItemCheck.Image = "rbxassetid://6031068420"
      ChecklistItemCheck.ImageColor3 = Color3.fromRGB(16, 192, 255)

      ChecklistItem.MouseEnter:Connect(
         function()
            TweenService:Create(
               ChecklistItem,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
            ):Play()
         end
      )
      ChecklistItem.MouseLeave:Connect(
         function()
            TweenService:Create(
               ChecklistItem,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
            ):Play()
         end
      )

      ChecklistItem.MouseButton1Click:Connect(function()
         if table.find(checklists[glob].Value, v) then
           table.remove(checklists[glob].Value, table.find(checklists[glob].Value, v))
           ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
           callback(checklists[glob].Value)
        else
           table.insert(checklists[glob].Value, v)
           ChecklistTitle.Text = text .. " - " .. table.concat(checklists[glob].Value, ", ")
           callback(checklists[glob].Value)
        end
      end)

      local onlol = false
      ChecklistItem.MouseButton1Click:Connect(
         function()
            if onlol == false then
            TweenService:Create(
               ChecklistItemCheck,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {ImageTransparency = 1}
            ):Play()
            repeat wait() until ChecklistItemCheck.ImageTransparency == 1
            ChecklistItemCheck.Image = "rbxassetid://6031068421"
            TweenService:Create(
               ChecklistItemCheck,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {ImageTransparency = 0}
            ):Play()
            --pcall(callback, ChecklistItem.Text)
            onlol = true
         else
            TweenService:Create(
               ChecklistItemCheck,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {ImageTransparency = 1}
            ):Play()
            repeat wait() until ChecklistItemCheck.ImageTransparency == 1
            ChecklistItemCheck.Image = "rbxassetid://6031068420"
            TweenService:Create(
               ChecklistItemCheck,
               TweenInfo.new(.3, Enum.EasingStyle.Quad),
               {ImageTransparency = 0}
            ):Play()
            --pcall(callback, "notohojkfhdjklfhdsjhvjchgvjdfdjhbsjhfdbjhd")
            onlol = false
         end
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
      )

      ChecklistHolder.CanvasSize = UDim2.new(0, 0, 0, ChecklistItemLayout.AbsoluteContentSize.Y + 15)
      return checklists[glob]
   end
   return dropfunc
end





function ContainerItems:Colorpicker(text, preset, callback)
   local ColorPickerToggled = false
   local OldToggleColor = Color3.fromRGB(0, 0, 0)
   local OldColor = Color3.fromRGB(0, 0, 0)
   local OldColorSelectionPosition = nil
   local OldHueSelectionPosition = nil
   local ColorH, ColorS, ColorV = 1, 1, 1
   local RainbowColorPicker = false
   local ColorPickerInput = nil
   local ColorInput = nil
   local HueInput = nil

   local Colorpicker = Instance.new("TextButton")
   local Title = Instance.new("TextLabel")
   local BoxColor = Instance.new("Frame")
   local BoxcolorCorner = Instance.new("UICorner")
   local ColorpickerCorner = Instance.new("UICorner")

   Colorpicker.Name = text
   Colorpicker.Parent = Container
   Colorpicker.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Colorpicker.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
   Colorpicker.Size = UDim2.new(0, 405, 0, 40)
   Colorpicker.AutoButtonColor = false
   Colorpicker.Font = Enum.Font.Gotham
   Colorpicker.Text = ""
   Colorpicker.TextColor3 = Color3.fromRGB(255, 255, 255)
   Colorpicker.TextSize = 14.000

   Title.Name = "Title"
   Title.Parent = Colorpicker
   Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Title.BackgroundTransparency = 1.000
   Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
   Title.Size = UDim2.new(0, 405, 0, 40)
   Title.Font = Enum.Font.Gotham
   Title.Text = text
   Title.TextColor3 = Color3.fromRGB(255, 255, 255)
   Title.TextSize = 15.000
   Title.TextXAlignment = Enum.TextXAlignment.Left

   BoxColor.Name = "Boxcolor"
   BoxColor.Parent = Colorpicker
   BoxColor.BackgroundColor3 = preset
   BoxColor.Position = UDim2.new(0.88, 0, 0.3, 0)
   BoxColor.Size = UDim2.new(0, 36, 0, 19)

   BoxcolorCorner.CornerRadius = UDim.new(0, 6)
   BoxcolorCorner.Name = "BoxcolorCorner"
   BoxcolorCorner.Parent = BoxColor

   ColorpickerCorner.CornerRadius = UDim.new(0, 4)
   ColorpickerCorner.Name = "ColorpickerCorner"
   ColorpickerCorner.Parent = Colorpicker

   local ColorpickerFrame = Instance.new("Frame")
   local DropdownFrameCorner = Instance.new("UICorner")
   local Hue = Instance.new("ImageLabel")
   local HueCorner = Instance.new("UICorner")
   local HueGradient = Instance.new("UIGradient")
   local HueSelection = Instance.new("ImageLabel")
   local Color = Instance.new("ImageLabel")
   local ColorCorner = Instance.new("UICorner")
   local ColorSelection = Instance.new("ImageLabel")
   local Confirm = Instance.new("TextButton")
   local ButtonCorner = Instance.new("UICorner")
   local RainbowToggle = Instance.new("TextButton")
   local RainbowToggleCorner = Instance.new("UICorner")
   local RainbowTitle = Instance.new("TextLabel")
   local RainbowToggleFrame = Instance.new("Frame")
   local RainbowToggleFrameCorner = Instance.new("UICorner")
   local RainbowToggleFrameRainbow = Instance.new("Frame")
   local RainbowToggleFrameRainbowCorner = Instance.new("UICorner")
   local RainbowToggleDot = Instance.new("Frame")
   local RainbowToggleDotCorner = Instance.new("UICorner")
   local RainbowToggleDotGradient = Instance.new("UIGradient")

   ColorpickerFrame.Name = "ColorpickerFrame"
   ColorpickerFrame.Parent = Container
   ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
   ColorpickerFrame.BorderSizePixel = 0
   ColorpickerFrame.Position = UDim2.new(0.165624991, 0, 0.671052635, 0)
   ColorpickerFrame.Size = UDim2.new(0, 403, 0, 0)
   ColorpickerFrame.Visible = false
   ColorpickerFrame.ClipsDescendants = true

   DropdownFrameCorner.Name = "DropdownFrameCorner"
   DropdownFrameCorner.Parent = ColorpickerFrame

   Hue.Name = "Hue"
   Hue.Parent = ColorpickerFrame
   Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Hue.Position = UDim2.new(0, 209, 0, 9)
   Hue.Size = UDim2.new(0, 25, 0, 80)

   HueCorner.CornerRadius = UDim.new(0, 3)
   HueCorner.Name = "HueCorner"
   HueCorner.Parent = Hue

   HueGradient.Color =
      ColorSequence.new {
         ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
         ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
         ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
         ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
         ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
         ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
         ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
      }
   HueGradient.Rotation = 270
   HueGradient.Name = "HueGradient"
   HueGradient.Parent = Hue

   HueSelection.Name = "HueSelection"
   HueSelection.Parent = Hue
   HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
   HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   HueSelection.BackgroundTransparency = 1.000
   HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
   HueSelection.Size = UDim2.new(0, 18, 0, 18)
   HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

   Color.Name = "Color"
   Color.Parent = ColorpickerFrame
   Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
   Color.Position = UDim2.new(0, 9, 0, 9)
   Color.Size = UDim2.new(0, 194, 0, 80)
   Color.ZIndex = 10
   Color.Image = "rbxassetid://4155801252"

   ColorCorner.CornerRadius = UDim.new(0, 3)
   ColorCorner.Name = "ColorCorner"
   ColorCorner.Parent = Color

   ColorSelection.Name = "ColorSelection"
   ColorSelection.Parent = Color
   ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
   ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ColorSelection.BackgroundTransparency = 1.000
   ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
   ColorSelection.Size = UDim2.new(0, 18, 0, 18)
   ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
   ColorSelection.ScaleType = Enum.ScaleType.Fit

   Confirm.Name = "Confirm"
   Confirm.Parent = ColorpickerFrame
   Confirm.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   Confirm.BackgroundTransparency = 0.010
   Confirm.Position = UDim2.new(0.612244904, 0, 0.0900000036, 0)
   Confirm.Size = UDim2.new(0, 145, 0, 27)
   Confirm.AutoButtonColor = false
   Confirm.Font = Enum.Font.Gotham
   Confirm.Text = "Confirm"
   Confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
   Confirm.TextSize = 14.000

   ButtonCorner.Name = "ButtonCorner"
   ButtonCorner.Parent = Confirm

   RainbowToggle.Name = "RainbowToggle"
   RainbowToggle.Parent = ColorpickerFrame
   RainbowToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   RainbowToggle.Position = UDim2.new(0.610732794, 0, 0.431324542, 0)
   RainbowToggle.Size = UDim2.new(0, 145, 0, 27)
   RainbowToggle.AutoButtonColor = false
   RainbowToggle.Font = Enum.Font.Gotham
   RainbowToggle.Text = ""
   RainbowToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
   RainbowToggle.TextSize = 14.000

   RainbowToggleCorner.Name = "RainbowToggleCorner"
   RainbowToggleCorner.Parent = RainbowToggle

   RainbowTitle.Name = "RainbowTitle"
   RainbowTitle.Parent = RainbowToggle
   RainbowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   RainbowTitle.BackgroundTransparency = 1.000
   RainbowTitle.Position = UDim2.new(0.0204080511, 0, 0, 0)
   RainbowTitle.Size = UDim2.new(0, 29, 0, 27)
   RainbowTitle.Font = Enum.Font.Gotham
   RainbowTitle.Text = "Rainbow"
   RainbowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   RainbowTitle.TextSize = 14.000
   RainbowTitle.TextXAlignment = Enum.TextXAlignment.Left

   RainbowToggleFrame.Name = "RainbowToggleFrame"
   RainbowToggleFrame.Parent = RainbowToggle
   RainbowToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
   RainbowToggleFrame.Position = UDim2.new(0.693, 0, 0.142857149, 0)
   RainbowToggleFrame.Size = UDim2.new(0, 36, 0, 19)

   RainbowToggleFrameCorner.CornerRadius = UDim.new(1, 0)
   RainbowToggleFrameCorner.Name = "RainbowToggleFrameCorner"
   RainbowToggleFrameCorner.Parent = RainbowToggleFrame

   RainbowToggleFrameRainbow.Name = "RainbowToggleFrameRainbow"
   RainbowToggleFrameRainbow.Parent = RainbowToggleFrame
   RainbowToggleFrameRainbow.BackgroundColor3 = Color3.fromRGB(67,136,246)
   RainbowToggleFrameRainbow.BackgroundTransparency = 1.000
   RainbowToggleFrameRainbow.Position = UDim2.new(-0.0198377371, 0, 0.00601506233, 0)
   RainbowToggleFrameRainbow.Size = UDim2.new(0, 36, 0, 19)

   RainbowToggleFrameRainbowCorner.CornerRadius = UDim.new(1, 0)
   RainbowToggleFrameRainbowCorner.Name = "RainbowToggleFrameRainbowCorner"
   RainbowToggleFrameRainbowCorner.Parent = RainbowToggleFrameRainbow

   RainbowToggleDot.Name = "RainbowToggleDot"
   RainbowToggleDot.Parent = RainbowToggleFrameRainbow
   RainbowToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   RainbowToggleDot.Position = UDim2.new(0.104999997, -3, 0.289000005, -4)
   RainbowToggleDot.Size = UDim2.new(0, 18, 0, 16)

   RainbowToggleDotCorner.CornerRadius = UDim.new(1, 0)
   RainbowToggleDotCorner.Name = "RainbowToggleDotCorner"
   RainbowToggleDotCorner.Parent = RainbowToggleDot

   RainbowToggleDotGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 198, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 236, 255))}
   RainbowToggleDotGradient.Name = "RainbowToggleDotGradient"
   RainbowToggleDotGradient.Parent = RainbowToggleDot

   Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)

   Colorpicker.MouseEnter:Connect(
      function()
         TweenService:Create(
            Colorpicker,
            TweenInfo.new(.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
         ):Play()
      end
   )
   Colorpicker.MouseLeave:Connect(
      function()
         TweenService:Create(
            Colorpicker,
            TweenInfo.new(.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
         ):Play()
      end
   )

   local function UpdateColorPicker(nope)
      BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
      Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

      pcall(callback, BoxColor.BackgroundColor3)
   end

   ColorH =
      1 -
      (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
         Hue.AbsoluteSize.Y)
   ColorS =
      (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
         Color.AbsoluteSize.X)
   ColorV =
      1 -
      (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
         Color.AbsoluteSize.Y)

   BoxColor.BackgroundColor3 = preset
   Color.BackgroundColor3 = preset
   pcall(callback, BoxColor.BackgroundColor3)

   Color.InputBegan:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if RainbowColorPicker then
               return
            end

            if ColorInput then
               ColorInput:Disconnect()
            end

            ColorInput =
               RunService.RenderStepped:Connect(
                  function()
                  local ColorX =
                     (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                        Color.AbsoluteSize.X)
                  local ColorY =
                     (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                        Color.AbsoluteSize.Y)

                  ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                  ColorS = ColorX
                  ColorV = 1 - ColorY

                  UpdateColorPicker(true)
               end
               )
         end
      end
   )

   Color.InputEnded:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if ColorInput then
               ColorInput:Disconnect()
            end
         end
      end
   )

   Hue.InputBegan:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if RainbowColorPicker then
               return
            end

            if HueInput then
               HueInput:Disconnect()
            end

            HueInput =
               RunService.RenderStepped:Connect(
                  function()
                  local HueY =
                     (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                        Hue.AbsoluteSize.Y)

                  HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                  ColorH = 1 - HueY

                  UpdateColorPicker(true)
               end
               )
         end
      end
   )

   Hue.InputEnded:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if HueInput then
               HueInput:Disconnect()
            end
         end
      end
   )

   RainbowToggle.MouseButton1Down:Connect(
      function()
         RainbowColorPicker = not RainbowColorPicker

         if ColorInput then
            ColorInput:Disconnect()
         end

         if HueInput then
            HueInput:Disconnect()
         end

         if RainbowColorPicker then
            TweenService:Create(
               RainbowToggleFrameRainbow,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundTransparency = 1}
            ):Play()
            TweenService:Create(
               RainbowToggleDot,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {Position = UDim2.new(0.595, -3, 0.289000005, -4)}
            ):Play()

            OldToggleColor = BoxColor.BackgroundColor3
            OldColor = Color.BackgroundColor3
            OldColorSelectionPosition = ColorSelection.Position
            OldHueSelectionPosition = HueSelection.Position

            while RainbowColorPicker do
               BoxColor.BackgroundColor3 = Color3.fromHSV(Mainholder.RainbowColorValue, 1, 1)
               Color.BackgroundColor3 = Color3.fromHSV(Mainholder.RainbowColorValue, 1, 1)

               ColorSelection.Position = UDim2.new(1, 0, 0, 0)
               HueSelection.Position = UDim2.new(0.48, 0, 0, Mainholder.HueSelectionPosition)

               pcall(callback, BoxColor.BackgroundColor3)
               wait()
            end
         elseif not RainbowColorPicker then
            TweenService:Create(
               RainbowToggleFrameRainbow,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {BackgroundTransparency = 1}
            ):Play()
            TweenService:Create(
               RainbowToggleDot,
               TweenInfo.new(.2, Enum.EasingStyle.Quad),
               {Position = UDim2.new(0.104999997, -3, 0.289000005, -4)}
            ):Play()

            BoxColor.BackgroundColor3 = OldToggleColor
            Color.BackgroundColor3 = OldColor

            ColorSelection.Position = OldColorSelectionPosition
            HueSelection.Position = OldHueSelectionPosition

            pcall(callback, BoxColor.BackgroundColor3)
         end
      end
   )

   Colorpicker.MouseButton1Click:Connect(
      function()
         if ColorPickerToggled == false then
            ColorPickerToggled = not ColorPickerToggled
            ColorpickerFrame.Visible = true
            ColorpickerFrame:TweenSize(
               UDim2.new(0, 403, 0, 100),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            repeat
               wait()
            until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 100)
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         else
            ColorPickerToggled = not ColorPickerToggled
            ColorpickerFrame:TweenSize(
               UDim2.new(0, 403, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            repeat
               wait()
            until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 0)
            ColorpickerFrame.Visible = false
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
      end
   )

   Confirm.MouseButton1Click:Connect(
      function()
       Confirm.TextSize = 0
       TweenService:Create(
           Confirm,
           TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
           {TextSize = 14.000}
       ):Play()
       wait(.1)
         ColorPickerToggled = not ColorPickerToggled
         ColorpickerFrame:TweenSize(
            UDim2.new(0, 403, 0, 0),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart,
            0.1,
            true
         )
         repeat
            wait()
         until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 0)
         ColorpickerFrame.Visible = false
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
      end)

   coroutine.wrap(
      function()
         while wait() do

         end
      end
   )()
end



return ContainerItems
end
return Tabs
end
return Mainholder
