local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Good Hub",
   Icon = nil,
   LoadingTitle = "Good Hub",
   LoadingSubtitle = "by David",
   Theme = "Default",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Good Hub"
   }
})

local ItemsTab = Window:CreateTab("Items", 4483362458)
local BuildTab = Window:CreateTab("Building", 4483362458)
local TeleportTab = Window:CreateTab("Teleports", 4483362458)
local AdminTab = Window:CreateTab("Admin", 4483362458)

-- Teleports
TeleportTab:CreateButton({
   Name = "Shop",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-425, 6, 77)
   end
})

TeleportTab:CreateButton({
   Name = "Main Area",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-394, 3, 423)
   end
})

-- Items functions
local function autoPickupItem(itemName)
   local player = game.Players.LocalPlayer
   local char = player.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end
   local root = char.HumanoidRootPart
   local originalPos = root.CFrame

   local assets = {}
   for _, v in ipairs(workspace:GetDescendants()) do
      if v:IsA("BasePart") and string.lower(v.Name):find(string.lower(itemName)) then
         table.insert(assets, v)
      end
   end
   if #assets == 0 then return end

   local choice = assets[math.random(1, #assets)]
   local prompt = choice:FindFirstChildOfClass("ProximityPrompt") or choice.Parent:FindFirstChildOfClass("ProximityPrompt")

   if not prompt then return end

   local loopConnection
   loopConnection = game:GetService("RunService").Heartbeat:Connect(function()
      root.CFrame = choice.CFrame + Vector3.new(0, 0.1, 0)
   end)

   wait(0.3)
   fireproximityprompt(prompt)
   wait(0.3)

   loopConnection:Disconnect()
   root.CFrame = originalPos
end

ItemsTab:CreateButton({ Name = "Hammer", Callback = function() autoPickupItem("hammer") end })
ItemsTab:CreateButton({ Name = "Food", Callback = function() autoPickupItem("food") end })
ItemsTab:CreateButton({ Name = "Money", Callback = function() autoPickupItem("money") end })
ItemsTab:CreateButton({ Name = "Crowbar", Callback = function() autoPickupItem("crowbar") end })
ItemsTab:CreateButton({ Name = "Bat", Callback = function() autoPickupItem("bat") end })
ItemsTab:CreateButton({ Name = "Lantern", Callback = function() autoPickupItem("lantern") end })
ItemsTab:CreateButton({ Name = "Soda", Callback = function() autoPickupItem("soda") end })
ItemsTab:CreateButton({ Name = "Medkit", Callback = function() autoPickupItem("medkit") end })
ItemsTab:CreateButton({ Name = "GPS", Callback = function() autoPickupItem("gps") end })
ItemsTab:CreateButton({ Name = "Handgun", Callback = function() autoPickupItem("handgun") end })
ItemsTab:CreateButton({ Name = "Shotgun", Callback = function() autoPickupItem("shotgun") end })
ItemsTab:CreateButton({ Name = "Shells", Callback = function() autoPickupItem("shells") end })

-- Build system
_G.selectedBuild = "hut"
_G.ladderHeight = 10
_G.offsetX = 0
_G.offsetY = 0
_G.offsetZ = 0

-- Persistent ignored Lanterns for lightpost
local ignoredLanterns = {}

-- Improved Draggable function
local function makeDraggable(frame)
   local dragging = false
   local dragInput
   local dragStart
   local startPos

   local function updateInput(input)
      local delta = input.Position - dragStart
      frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
   end

   frame.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
         dragging = true
         dragStart = input.Position
         startPos = frame.Position

         local connection
         connection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
               dragging = false
               connection:Disconnect()
            end
         end)
      end
   end)

   frame.InputChanged:Connect(function(input)
      if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
         updateInput(input)
      end
   end)
end

-- Toggle for entire Build GUI
local buildGUI
local mainFrame
local listFrame
local heightFrame
local lanternFrame
local selectedButton = nil

BuildTab:CreateToggle({
    Name = "Toggle Build GUI",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            buildGUI = Instance.new("ScreenGui")
            buildGUI.Name = "BuildGUI"
            buildGUI.ResetOnSpawn = false
            buildGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            mainFrame = Instance.new("Frame")
            mainFrame.Size = UDim2.new(0, 180, 0, 320)
            mainFrame.Position = UDim2.new(0.5, -90, 0.7, -160)
            mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            mainFrame.BorderSizePixel = 0
            mainFrame.Parent = buildGUI
            makeDraggable(mainFrame)

            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, 0, 0, 30)
            title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            title.Text = "Build Controls"
            title.TextColor3 = Color3.new(1, 1, 1)
            title.Font = Enum.Font.SourceSansBold
            title.TextSize = 18
            title.Parent = mainFrame

            local buildButton = Instance.new("TextButton")
            buildButton.Size = UDim2.new(0, 170, 0, 60)
            buildButton.Position = UDim2.new(0.5, -85, 1, -70)
            buildButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            buildButton.Text = "Build"
            buildButton.TextColor3 = Color3.new(1, 1, 1)
            buildButton.Font = Enum.Font.SourceSansBold
            buildButton.TextSize = 28
            buildButton.Parent = mainFrame

            buildButton.MouseButton1Click:Connect(function()
                if _G.selectedBuild then
                    if _G.selectedBuild == "hut" then
                        BuildHut()
                    elseif _G.selectedBuild == "wall" then
                        BuildWall()
                    elseif _G.selectedBuild == "floor" then
                        BuildFloor()
                    elseif _G.selectedBuild == "bighouse" then
                        BuildBigHouse()
                    elseif _G.selectedBuild == "ladder" then
                        BuildLadder()
                    elseif _G.selectedBuild == "box" then
                        BuildBox()
                    elseif _G.selectedBuild == "lightpost" then
                        BuildLightPost()
                    end
                end
            end)

            local offsetLabel = Instance.new("TextLabel")
            offsetLabel.Size = UDim2.new(1, 0, 0, 25)
            offsetLabel.Position = UDim2.new(0, 0, 0, 30)
            offsetLabel.Text = "Offset (X Y Z)"
            offsetLabel.TextColor3 = Color3.new(1, 1, 1)
            offsetLabel.BackgroundTransparency = 1
            offsetLabel.Parent = mainFrame

            local xBox = Instance.new("TextBox")
            xBox.Size = UDim2.new(0.3, 0, 0, 40)
            xBox.Position = UDim2.new(0, 5, 0, 55)
            xBox.Text = "0"
            xBox.TextSize = 20
            xBox.Parent = mainFrame
            xBox.FocusLost:Connect(function() _G.offsetX = tonumber(xBox.Text) or 0 end)

            local yBox = Instance.new("TextBox")
            yBox.Size = UDim2.new(0.3, 0, 0, 40)
            yBox.Position = UDim2.new(0.33, 5, 0, 55)
            yBox.Text = "0"
            yBox.TextSize = 20
            yBox.Parent = mainFrame
            yBox.FocusLost:Connect(function() _G.offsetY = tonumber(yBox.Text) or 0 end)

            local zBox = Instance.new("TextBox")
            zBox.Size = UDim2.new(0.3, 0, 0, 40)
            zBox.Position = UDim2.new(0.66, 5, 0, 55)
            zBox.Text = "0"
            zBox.TextSize = 20
            zBox.Parent = mainFrame
            zBox.FocusLost:Connect(function() _G.offsetZ = tonumber(zBox.Text) or 0 end)

            listFrame = Instance.new("Frame")
            listFrame.Size = UDim2.new(0, 180, 0, 250)
            listFrame.Position = UDim2.new(0.5, -90, 0.2, 50)
            listFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            listFrame.BorderSizePixel = 0
            listFrame.Parent = buildGUI
            makeDraggable(listFrame)

            local listTitle = Instance.new("TextLabel")
            listTitle.Size = UDim2.new(1, 0, 0, 40)
            listTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            listTitle.Text = "Select Build"
            listTitle.TextColor3 = Color3.new(1, 1, 1)
            listTitle.Font = Enum.Font.SourceSansBold
            listTitle.TextSize = 22
            listTitle.Parent = listFrame

            local scrollingFrame = Instance.new("ScrollingFrame")
            scrollingFrame.Size = UDim2.new(1, 0, 1, -40)
            scrollingFrame.Position = UDim2.new(0, 0, 0, 40)
            scrollingFrame.BackgroundTransparency = 1
            scrollingFrame.ScrollBarThickness = 8
            scrollingFrame.Parent = listFrame

            local uiListLayout = Instance.new("UIListLayout")
            uiListLayout.Padding = UDim.new(0, 8)
            uiListLayout.FillDirection = Enum.FillDirection.Vertical
            uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            uiListLayout.Parent = scrollingFrame

            local builds = {
                {name = "Hut", key = "hut"},
                {name = "Wall", key = "wall"},
                {name = "Floor", key = "floor"},
                {name = "Big House", key = "bighouse"},
                {name = "Ladder", key = "ladder"},
                {name = "Box", key = "box"},
                {name = "Light Post", key = "lightpost"}
            }

            for _, build in ipairs(builds) do
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -20, 0, 50)
                btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                btn.Text = build.name
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 20
                btn.Parent = scrollingFrame

                btn.MouseButton1Click:Connect(function()
                    if selectedButton then
                        selectedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    end
                    btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                    selectedButton = btn
                    _G.selectedBuild = build.key

                    heightFrame.Visible = (build.key == "ladder")
                    lanternFrame.Visible = (build.key == "lightpost")
                end)
            end

            heightFrame = Instance.new("Frame")
            heightFrame.Size = UDim2.new(0, 180, 0, 80)
            heightFrame.Position = UDim2.new(0.5, -90, 0.4, -100)
            heightFrame.BackgroundTransparency = 1
            heightFrame.Parent = buildGUI
            heightFrame.Visible = false
            makeDraggable(heightFrame)

            local hLabel = Instance.new("TextLabel")
            hLabel.Size = UDim2.new(1, 0, 0.4, 0)
            hLabel.Text = "Ladder Height:"
            hLabel.TextColor3 = Color3.new(1, 1, 1)
            hLabel.BackgroundTransparency = 1
            hLabel.Font = Enum.Font.SourceSans
            hLabel.TextSize = 18
            hLabel.Parent = heightFrame

            local hBox = Instance.new("TextBox")
            hBox.Size = UDim2.new(1, 0, 0.6, 0)
            hBox.Position = UDim2.new(0, 0, 0.4, 0)
            hBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            hBox.Text = tostring(_G.ladderHeight)
            hBox.TextColor3 = Color3.new(1, 1, 1)
            hBox.TextSize = 20
            hBox.Parent = heightFrame

            hBox.FocusLost:Connect(function()
                local num = tonumber(hBox.Text)
                if num and num > 0 then
                    _G.ladderHeight = num
                else
                    hBox.Text = tostring(_G.ladderHeight)
                end
            end)

            lanternFrame = Instance.new("Frame")
            lanternFrame.Size = UDim2.new(0, 180, 0, 80)
            lanternFrame.Position = UDim2.new(0.5, -90, 0.4, -100)
            lanternFrame.BackgroundTransparency = 1
            lanternFrame.Parent = buildGUI
            lanternFrame.Visible = false
            makeDraggable(lanternFrame)

            local lLabel = Instance.new("TextLabel")
            lLabel.Size = UDim2.new(1, 0, 0.4, 0)
            lLabel.Text = "Lanterns Left:"
            lLabel.TextColor3 = Color3.new(1, 1, 1)
            lLabel.BackgroundTransparency = 1
            lLabel.Font = Enum.Font.SourceSans
            lLabel.TextSize = 18
            lLabel.Parent = lanternFrame

            local lCount = Instance.new("TextLabel")
            lCount.Size = UDim2.new(1, 0, 0.6, 0)
            lCount.Position = UDim2.new(0, 0, 0.4, 0)
            lCount.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            lCount.Text = "0"
            lCount.TextColor3 = Color3.new(1, 1, 1)
            lCount.Font = Enum.Font.SourceSansBold
            lCount.TextSize = 28
            lCount.Parent = lanternFrame

            -- Update lantern count
            spawn(function()
                while buildGUI and buildGUI.Parent do
                    local pickups = workspace:FindFirstChild("Pickups")
                    local count = 0
                    if pickups then
                        for _, v in ipairs(pickups:GetChildren()) do
                            if v.Name == "Lantern" and not table.find(ignoredLanterns, v) then
                                count = count + 1
                            end
                        end
                    end
                    lCount.Text = tostring(count)
                    if count == 0 then
                        lCount.TextColor3 = Color3.new(1, 0, 0)
                    else
                        lCount.TextColor3 = Color3.new(1, 1, 1)
                    end
                    wait(1)
                end
            end)

        else
            if buildGUI then
                buildGUI:Destroy()
                buildGUI = nil
            end
        end
    end
})

-- Preview system with offsets
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local previewFolder = Instance.new("Folder", workspace)
previewFolder.Name = "PreviewParts"

local function clearPreview()
   for _, v in ipairs(previewFolder:GetChildren()) do
      v:Destroy()
   end
end

local function createPreviewPart(size, cframe)
   local preview = Instance.new("Part")
   preview.Anchored = true
   preview.CanCollide = false
   preview.Transparency = 0.6
   preview.Color = Color3.fromRGB(0, 255, 0)
   preview.Material = Enum.Material.ForceField
   preview.Size = size
   preview.CFrame = cframe
   preview.Parent = previewFolder
end

RunService.RenderStepped:Connect(function()
   if not _G.selectedBuild then return end
   local char = player.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   clearPreview()

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local up = root.CFrame.UpVector
   local origin = root.Position + Vector3.new(0, -3, 0) + forward * _G.offsetX + up * _G.offsetY + right * _G.offsetZ

   if _G.selectedBuild == "hut" then
      local center = origin + forward * 6 + Vector3.new(0, 3.75, 0)
      createPreviewPart(Vector3.new(12, 7.5, 12), CFrame.new(center, center + forward))

   elseif _G.selectedBuild == "wall" then
      local center = origin + forward * 2 + Vector3.new(0, 3, 0)
      createPreviewPart(Vector3.new(12, 6, 0.5), CFrame.new(center, center + forward))

   elseif _G.selectedBuild == "floor" then
      local center = origin + forward * 6 + Vector3.new(0, -0.25, 0)
      createPreviewPart(Vector3.new(12, 0.5, 12), CFrame.new(center, center + forward))

   elseif _G.selectedBuild == "bighouse" then
      local center = origin + forward * 30 + Vector3.new(0, 8, 0)
      createPreviewPart(Vector3.new(60, 16, 60), CFrame.new(center, center + forward))

   elseif _G.selectedBuild == "ladder" then
      local height = math.max(1, _G.ladderHeight or 10)
      local centerX = origin + forward * 3
      for i = 1, height do
         local yOffset = (i - 0.5) * 1
         local center = centerX + Vector3.new(0, yOffset, 0)
         createPreviewPart(Vector3.new(5, 0.5, 0.5), CFrame.new(center, center + forward))
      end
   elseif _G.selectedBuild == "box" then
      local center = origin + forward * 6 + Vector3.new(0, 2, 0)
      createPreviewPart(Vector3.new(10, 4, 10), CFrame.new(center, center + forward))
   elseif _G.selectedBuild == "lightpost" then
      local center = origin + forward * 5 + Vector3.new(0, 6.5, 0)
      createPreviewPart(Vector3.new(2, 13, 2), CFrame.new(center, center + forward))
   end
end)

-- Build functions with offsets
local function applyOffset(pos)
   local root = game.Players.LocalPlayer.Character.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local up = root.CFrame.UpVector
   return pos + forward * _G.offsetX + up * _G.offsetY + right * _G.offsetZ
end

function BuildHut()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   local hammer = char:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
   if hammer then hammer.Parent = char end
   wait(0.1)

   local part = workspace.Road:GetChildren()[33]
   if not hammer or not hammer:FindFirstChild("BuildPlank") or not part then return end
   local fire = function(p1, p2)
      hammer.BuildPlank:FireServer(applyOffset(p1), applyOffset(p2), part, part, Vector3.new(0, 1, 0))
   end

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local origin = root.Position + Vector3.new(0, -3, 0)

   for y = 0.5, 7, 0.5 do
      if y < 1 or y > 5.5 then
         fire(origin + right * -6 + Vector3.new(0, y, 0), origin + right * 6 + Vector3.new(0, y, 0))
      else
         fire(origin + right * -6 + Vector3.new(0, y, 0), origin + right * -2 + Vector3.new(0, y, 0))
         fire(origin + right * 2 + Vector3.new(0, y, 0), origin + right * 6 + Vector3.new(0, y, 0))
      end
   end
   for y = 0.5, 7, 0.5 do fire(origin + right * 6 + Vector3.new(0, y, 0), origin + right * 6 + forward * 12 + Vector3.new(0, y, 0)) end
   for y = 0.5, 7, 0.5 do fire(origin + right * -6 + forward * 12 + Vector3.new(0, y, 0), origin + right * 6 + forward * 12 + Vector3.new(0, y, 0)) end
   for y = 0.5, 7, 0.5 do fire(origin + right * -6 + Vector3.new(0, y, 0), origin + right * -6 + forward * 12 + Vector3.new(0, y, 0)) end
   for z = 0, 12, 2 do fire(origin + right * -6 + Vector3.new(0, 7.5, 0) + forward * z, origin + right * 6 + Vector3.new(0, 7.5, 0) + forward * z) end
end

function BuildWall()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   local hammer = char:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
   if hammer then hammer.Parent = char end
   wait(0.1)

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local start = root.Position + forward * 2 + Vector3.new(0, -3, 0)

   local hammer = char:FindFirstChild("Hammer")
   local part = workspace.Road:GetChildren()[33]
   if not hammer or not hammer:FindFirstChild("BuildPlank") or not part then return end
   local fire = function(p1, p2)
      hammer.BuildPlank:FireServer(applyOffset(p1), applyOffset(p2), part, part, Vector3.new(0, 1, 0))
   end

   for y = 0.5, 6, 0.5 do
      fire(start + right * -6 + Vector3.new(0, y, 0), start + right * 6 + Vector3.new(0, y, 0))
   end
end

function BuildFloor()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   local hammer = char:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
   if hammer then hammer.Parent = char end
   wait(0.1)

   local hammer = char:FindFirstChild("Hammer")
   local part = workspace.Road:GetChildren()[33]
   if not hammer or not hammer:FindFirstChild("BuildPlank") or not part then return end
   local fire = function(p1, p2)
      hammer.BuildPlank:FireServer(applyOffset(p1), applyOffset(p2), part, part, Vector3.new(0, 1, 0))
   end

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local center = root.Position + forward * 6 + Vector3.new(0, -3.25, 0)
   local cframe = CFrame.new(center, center + forward)

   for x = -6, 5.5, 0.5 do
      local p1 = cframe * Vector3.new(x, 0, -6)
      local p2 = cframe * Vector3.new(x, 0, 6)
      fire(p1, p2)
   end
end

function BuildBigHouse()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   local hammer = char:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
   if hammer then hammer.Parent = char end
   wait(0.1)

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local origin = root.Position + Vector3.new(0, -3, 0)

   local hammer = char:FindFirstChild("Hammer")
   local part = workspace.Road:GetChildren()[33]
   if not hammer or not hammer:FindFirstChild("BuildPlank") or not part then return end

   local fire = function(p1, p2)
      local dist = (p1 - p2).Magnitude
      local p1o = applyOffset(p1)
      local p2o = applyOffset(p2)
      if dist <= 11 then
         hammer.BuildPlank:FireServer(p1o, p2o, part, part, Vector3.new(0, 1, 0))
      else
         local dir = (p2 - p1).Unit
         local steps = math.ceil(dist / 11)
         local stepLength = dist / steps
         for i = 0, steps - 1 do
            local segStart = p1 + dir * (i * stepLength)
            local segEnd = p1 + dir * ((i + 1) * stepLength)
            local segStartO = applyOffset(segStart)
            local segEndO = applyOffset(segEnd)
            hammer.BuildPlank:FireServer(segStartO, segEndO, part, part, Vector3.new(0, 1, 0))
         end
      end
   end

   local function wall(p1, p2, height, hasDoor)
      for y = 0.5, height, 0.5 do
         if hasDoor and y <= 8 then
            local mid = (p1 + p2) / 2
            local dir = (p2 - p1).Unit
            local halfDoor = 2.5
            local left = mid - dir * halfDoor
            local right = mid + dir * halfDoor
            fire(p1 + Vector3.new(0, y, 0), left + Vector3.new(0, y, 0))
            fire(right + Vector3.new(0, y, 0), p2 + Vector3.new(0, y, 0))
         else
            fire(p1 + Vector3.new(0, y, 0), p2 + Vector3.new(0, y, 0))
         end
      end
   end

   local size = 60
   local height = 16
   local corners = {
      origin + right * -size/2,
      origin + right * size/2,
      origin + right * size/2 + forward * size,
      origin + right * -size/2 + forward * size
   }

   wall(corners[1], corners[2], height, true)
   wall(corners[2], corners[3], height, false)
   wall(corners[3], corners[4], height, false)
   wall(corners[4], corners[1], height, false)

   for z = 0, size - 2, 2 do
      for x = -size/2, size/2 - 11, 11 do
         local p1 = origin + right * x + forward * z + Vector3.new(0, height + 0.5, 0)
         local p2 = p1 + right * 11
         fire(p1, p2)
      end
   end

   for z = 0, size - 2, 2 do
      for x = -size/2, size/2 - 11, 11 do
         local p1 = origin + right * x + forward * z + Vector3.new(0, 0.25, 0)
         local p2 = p1 + right * 11
         fire(p1, p2)
      end
   end
end

function BuildLadder()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   local hammer = char:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
   if hammer then hammer.Parent = char end
   wait(0.1)

   local hammer = char:FindFirstChild("Hammer")
   local part = workspace.Road:GetChildren()[33]
   if not hammer or not hammer:FindFirstChild("BuildPlank") or not part then return end

   local fire = function(p1, p2)
      hammer.BuildPlank:FireServer(applyOffset(p1), applyOffset(p2), part, part, Vector3.new(0, 1, 0))
   end

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local centerPos = root.Position + forward * 3 + Vector3.new(0, -3, 0)

   local height = math.max(1, _G.ladderHeight or 10)
   local rungLength = 5

   for i = 1, height do
      local yOffset = (i - 0.5) * 1
      local rungPos = centerPos + Vector3.new(0, yOffset, 0)
      local p1 = rungPos - right * (rungLength / 2)
      local p2 = rungPos + right * (rungLength / 2)
      fire(p1, p2)
   end
end

function BuildBox()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end

   local hammer = char:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
   if hammer then hammer.Parent = char end
   wait(0.1)

   local hammer = char:FindFirstChild("Hammer")
   local part = workspace.Road:GetChildren()[33]
   if not hammer or not hammer:FindFirstChild("BuildPlank") or not part then return end

   local fire = function(p1, p2)
      hammer.BuildPlank:FireServer(applyOffset(p1), applyOffset(p2), part, part, Vector3.yAxis)
   end

   local root = char.HumanoidRootPart
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local origin = root.Position + forward * 6 + Vector3.new(0, -3, 0)

   local side_length = 10
   local box_height = 4
   local plank_height = 0.5
   local num_layers = box_height / plank_height

   local bottom_left = origin - right * (side_length / 2) - forward * (side_length / 2)

   -- Floor direction 1
   for dx = -side_length/2, side_length/2 - 0.5, 0.5 do
      local p1 = bottom_left + right * dx + right * 5 + forward * 0
      local p2 = p1 + forward * side_length
      fire(p1, p2)
   end

   -- Floor direction 2
   for dz = -side_length/2, side_length/2 - 0.5, 0.5 do
      local p1 = bottom_left + forward * dz + right * 0 + forward * 5
      local p2 = p1 + right * side_length
      fire(p1, p2)
   end

   -- Walls
   for layer = 1, num_layers do
      local y = (layer - 0.5) * plank_height
      fire(bottom_left + Vector3.new(0, y, 0), bottom_left + right * side_length + Vector3.new(0, y, 0))
      fire(bottom_left + forward * side_length + Vector3.new(0, y, 0), bottom_left + forward * side_length + right * side_length + Vector3.new(0, y, 0))
      fire(bottom_left + Vector3.new(0, y, 0), bottom_left + forward * side_length + Vector3.new(0, y, 0))
      fire(bottom_left + right * side_length + Vector3.new(0, y, 0), bottom_left + right * side_length + forward * side_length + Vector3.new(0, y, 0))
   end
end

function BuildLightPost()
   local char = game.Players.LocalPlayer.Character
   if not char or not char:FindFirstChild("HumanoidRootPart") then return end
   local root = char:WaitForChild("HumanoidRootPart")
   local originalPos = root.CFrame

   -- Equip Hammer
   local hammer = player.Backpack:FindFirstChild("Hammer") or char:FindFirstChild("Hammer")
   if hammer then
      hammer.Parent = char
   end
   wait(0.1)

   local BuildPlank = hammer:WaitForChild("BuildPlank")
   local plankPart = workspace.Road:WaitForChild("Curb")

   -- Position in front
   local forward = root.CFrame.LookVector
   local right = root.CFrame.RightVector
   local poleCenter = root.Position + forward * 5 + Vector3.new(0, -3, 0)

   -- Build pole
   for layer = 1, 26 do
      local y = (layer - 0.5) * 0.5
      local basePos = poleCenter + Vector3.new(0, y, 0)

      local args1 = {
         basePos - right * 1,
         basePos + right * 1,
         plankPart,
         plankPart,
         Vector3.yAxis
      }
      BuildPlank:FireServer(unpack(args1))

      local args2 = {
         basePos - forward * 1,
         basePos + forward * 1,
         plankPart,
         plankPart,
         Vector3.yAxis
      }
      BuildPlank:FireServer(unpack(args2))

      wait(0.05)
   end

   wait(0.3)

   -- Pick random non-ignored Lantern from workspace.Pickups
   local pickups = workspace:FindFirstChild("Pickups")
   local available = {}
   if pickups then
      for _, v in ipairs(pickups:GetChildren()) do
         if v.Name == "Lantern" and not table.find(ignoredLanterns, v) then
            table.insert(available, v)
         end
      end
   end

   local choice = nil
   if #available > 0 then
      choice = available[math.random(1, #available)]
   end

   if choice then
      local prompt = choice:FindFirstChildOfClass("ProximityPrompt")

      if prompt then
         local loopConn
         loopConn = game:GetService("RunService").Heartbeat:Connect(function()
            root.CFrame = choice.CFrame + Vector3.new(0, 3, 0)
         end)

         wait(0.3)
         fireproximityprompt(prompt)
         wait(0.3)

         loopConn:Disconnect()
      end
   end

   -- TP to top
   root.CFrame = CFrame.new(poleCenter + Vector3.new(0, 14, 0))

   -- Equip Lantern
   local lanternTool = player.Backpack:FindFirstChild("Lantern") or char:FindFirstChild("Lantern")
   if lanternTool then
      lanternTool.Parent = char
   end
   wait(0.2)

   -- Place Lantern
   local placePos = poleCenter + Vector3.new(0, 13.2, 0)
   local buildLanternRemote = lanternTool:FindFirstChild("BuildLantern")
   if buildLanternRemote then
      buildLanternRemote:FireServer(placePos)
   end

   wait(0.8)

   -- Ignore the nearest Lantern in Pickups within 40 studs
   local nearest = nil
   local minDist = 40

   if pickups then
      for _, v in ipairs(pickups:GetChildren()) do
         if v.Name == "Lantern" then
            local dist = (v.Position - root.Position).Magnitude
            if dist < minDist then
               minDist = dist
               nearest = v
            end
         end
      end
   end

   if nearest and not table.find(ignoredLanterns, nearest) then
      table.insert(ignoredLanterns, nearest)
   end

   wait(0.3)

   -- TP back
   root.CFrame = originalPos
end

-- Admin tab text (updated)
local adminText = AdminTab:CreateParagraph({
   Title = "Admin System",
   Content = "How to use this admin tab, to start off you can use the commands on chat to build, get items, give items, etc. How to add people as admins:\nSay /admin {player name} to add the player as an admin! To know if you made that player an admin a popup will appear notifying the player is an admin. To remove players as admin say /removeadmin {player name}\nOn chat.\nCommands: /giveitem {player name} {item name}\n/build {hut,wall,floor,bighouse,ladder,box,lightpost} /admin {player name} /unadmin {player name}\nCommands admins can use:\n/giveitem {player name} {item name} /build {hut,wall,floor,bighouse,ladder,box,lightpost} /cmds\n\nThats all! Have fun!"
})

-- Chat listener and command processor
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

local admins = {game.Players.LocalPlayer.UserId}

local function sendMessage(msg)
    if TextChatService and TextChatService.TextChannels:FindFirstChild("RBXGeneral") then
        TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
    else
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    end
end

local function isAdmin(plr)
    return table.find(admins, plr.UserId) ~= nil
end

local function notify(msg)
    Rayfield:Notify({
        Title = "Admin Notification",
        Content = msg,
        Duration = 5
    })
end

local function findPlayerByPartialName(partial)
    partial = partial:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(partial) or plr.DisplayName:lower():find(partial) then
            return plr
        end
    end
    return nil
end

local function capitalizeFirst(str)
    return str:sub(1,1):upper() .. str:sub(2):lower()
end

local function onChatted(plr, msg)
    if msg:sub(1,1) ~= "/" then return end
    local args = msg:sub(2):split(" ")
    local cmd = args[1]:lower()

    if cmd == "admin" then
        if not isAdmin(plr) then return end
        local targetName = table.concat(args, " ", 2)
        local target = findPlayerByPartialName(targetName)
        if target and not isAdmin(target) then
            table.insert(admins, target.UserId)
            notify(target.Name .. " is now an admin!")
            sendMessage(target.Name .. " has been added as admin!")
        end
    elseif cmd == "removeadmin" or cmd == "unadmin" then
        if not isAdmin(plr) then return end
        local targetName = table.concat(args, " ", 2)
        local target = findPlayerByPartialName(targetName)
        if target then
            local index = table.find(admins, target.UserId)
            if index then
                table.remove(admins, index)
                notify(target.Name .. " is no longer an admin.")
                sendMessage(target.Name .. " has been removed from admin!")
            end
        end
    elseif cmd == "build" then
        if not isAdmin(plr) then return end
        local buildName = args[2]:lower()
        if not buildName then return end
        local height = tonumber(args[3]) or 10
        if buildName == "ladder" then
            height = math.clamp(height, 1, 300)
            _G.ladderHeight = height
        end
        local selected = buildName:gsub(" ", "")
        if selected:find("lightpost") then
            selected = "lightpost"
        end
        _G.selectedBuild = selected
        local originalPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local localChar = game.Players.LocalPlayer.Character
        local hammer = localChar:FindFirstChild("Hammer") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer")
        if hammer then hammer.Parent = localChar end
        wait(0.1)
        local targetRoot = plr.Character.HumanoidRootPart
        local buildPos = targetRoot.CFrame * CFrame.new(0, 0, -5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = buildPos
        wait(0.1)
        if _G.selectedBuild == "hut" then BuildHut() elseif _G.selectedBuild == "wall" then BuildWall() elseif _G.selectedBuild == "floor" then BuildFloor() elseif _G.selectedBuild == "bighouse" then BuildBigHouse() elseif _G.selectedBuild == "ladder" then BuildLadder() elseif _G.selectedBuild == "box" then BuildBox() elseif _G.selectedBuild == "lightpost" then BuildLightPost() end
        wait(0.3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPos
    elseif cmd == "giveitem" then
        if not isAdmin(plr) then return end
        local targetName = args[2]
        local rawItem = args[3]
        if not targetName or not rawItem then return end
        local target = (targetName:lower() == "me" and plr) or findPlayerByPartialName(targetName)
        if target then
            local itemName = capitalizeFirst(rawItem)
            local originalPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            autoPickupItem(itemName)
            wait(0.3)
            local localChar = game.Players.LocalPlayer.Character
            local item = localChar:FindFirstChild(itemName) or game.Players.LocalPlayer.Backpack:FindFirstChild(itemName)
            if item then
                if target == game.Players.LocalPlayer then
                    local args = {item}
                    ReplicatedStorage.Events.DropItem:FireServer(unpack(args))
                else
                    local targetRoot = target.Character.HumanoidRootPart
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetRoot.CFrame + Vector3.new(0, 0.1, 0)
                    wait(0.3)
                    local args = {item}
                    ReplicatedStorage.Events.DropItem:FireServer(unpack(args))
                end
            end
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPos
            sendMessage("Gave " .. itemName .. " to " .. target.Name)
        end
    elseif cmd == "cmds" then
        sendMessage("/build {hut,wall,floor,bighouse,ladder,box,light.post} /giveitem {player/me} {item} /cmds (please do NOT spam)")
    end
end

for _, plr in ipairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        onChatted(plr, msg)
    end)
end

Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        onChatted(plr, msg)
    end)
end)

Rayfield:LoadConfiguration()