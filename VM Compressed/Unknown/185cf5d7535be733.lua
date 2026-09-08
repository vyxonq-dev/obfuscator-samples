local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local function getCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

local Character = getCharacter()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Tải Rayfield từ nguồn trực tuyến
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local soundMenu = Instance.new("Sound", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
soundMenu.SoundId = "rbxassetid://8120936755"
soundMenu.Volume = 1

local sound = Instance.new("Sound", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
sound.SoundId = "rbxassetid://3779053277"
sound.Volume = 1

soundMenu:Play()
-- Tạo một chủ đề tùy chỉnh
-- Đây là nơi bạn định nghĩa màu sắc và giao diện cho menu của mình
local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 255), -- Màu chữ trắng
    Background = Color3.fromRGB(0, 0, 0), -- Màu nền đen
    Topbar = Color3.fromRGB(34, 34, 34), -- Màu thanh trên cùng
    Shadow = Color3.fromRGB(255, 255, 255), -- Hiệu ứng bóng
    NotificationBackground = Color3.fromRGB(20, 20, 20), -- Nền của thông báo
    NotificationActionsBackground = Color3.fromRGB(230, 230, 230), -- Nền của khu vực hành động thông báo
    TabBackground = Color3.fromRGB(0, 128, 0), -- Màu xanh lá cây cho tab
    TabStroke = Color3.fromRGB(255, 255, 255), -- Viền tab màu trắng
    TabBackgroundSelected = Color3.fromRGB(0, 128, 0), -- Màu xanh lá sáng hơn khi tab được chọn
    TabTextColor = Color3.fromRGB(255, 255, 255), -- Màu chữ trắng trong tab
    SelectedTabTextColor = Color3.fromRGB(255, 255, 255), -- Màu chữ đen khi tab được chọn
    ElementBackground = Color3.fromRGB(35, 35, 35), -- Nền của từng phần tử giao diện
    ElementBackgroundHover = Color3.fromRGB(40, 40, 40), -- Nền phần tử khi di chuột vào
    SecondaryElementBackground = Color3.fromRGB(25, 25, 25), -- Nền của phần tử phụ
    ElementStroke = Color3.fromRGB(255, 255, 255), -- Viền phần tử màu trắng
    SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- Viền phần tử phụ
    SliderBackground = Color3.fromRGB(255, 215, 0), -- Nền thanh trượt màu vàng
    SliderProgress = Color3.fromRGB(255, 215, 0), -- Màu tiến trình thanh trượt vàng
    SliderStroke = Color3.fromRGB(255, 255, 0), -- Viền thanh trượt màu vàng sáng hơn
    ToggleBackground = Color3.fromRGB(30, 30, 30), -- Nền nút bật/tắt
    ToggleEnabled = Color3.fromRGB(0, 146, 214), -- Màu khi bật
    ToggleDisabled = Color3.fromRGB(100, 100, 100), -- Màu khi tắt
    ToggleEnabledStroke = Color3.fromRGB(255, 255, 255), -- Viền khi bật
    ToggleDisabledStroke = Color3.fromRGB(255, 255, 255), -- Viền khi tắt
    ToggleEnabledOuterStroke = Color3.fromRGB(255, 255, 255), -- Viền ngoài khi bật
    ToggleDisabledOuterStroke = Color3.fromRGB(255, 255, 255), -- Viền ngoài khi tắt
    DropdownSelected = Color3.fromRGB(40, 40, 40), -- Màu khi mục dropdown được chọn
    DropdownUnselected = Color3.fromRGB(30, 30, 30), -- Màu khi mục dropdown chưa được chọn
    InputBackground = Color3.fromRGB(30, 30, 30), -- Nền của ô nhập liệu
    InputStroke = Color3.fromRGB(255, 255, 255), -- Viền của ô nhập liệu
    PlaceholderColor = Color3.fromRGB(178, 178, 178) -- Màu chữ gợi ý trong ô nhập liệu
}


-- Tạo cửa sổ giao diện chính với chủ đề tùy chỉnh
local Window = Rayfield:CreateWindow({
   Name = "Fe Universal Menu V1", -- Tên của cửa sổ giao diện
   Icon = 0, -- ID icon (có thể thay đổi)
   LoadingTitle = "Loading......", -- Tiêu đề khi đang tải
   LoadingSubtitle = "by NCXKayy", -- Dòng phụ khi tải
   Theme = CustomTheme, -- Áp dụng chủ đề tùy chỉnh
   ToggleUIKeybind = "K", -- Phím tắt để bật/tắt giao diện
   DisableRayfieldPrompts = false, -- Tắt thông báo mặc định của Rayfield nếu cần
   DisableBuildWarnings = false, -- Tắt cảnh báo biên dịch nếu muốn
   ConfigurationSaving = { -- Cấu hình lưu trữ
      Enabled = true, -- Bật lưu cấu hình
      FolderName = "ThaytuberVN_Hub", -- Tên thư mục lưu
      FileName = "ThaytuberVN Hub" -- Tên tệp cấu hình
   },

    KeySystem = false, -- Bật hệ thống key
    KeySettings = {
        Title = "Fe Universal Menu | Key",
        Subtitle = "Key có trong server Discord",
        Note = "Tham gia server để lấy key",
        FileName = "Key", -- Tên file lưu key
        SaveKey = true, -- Lưu key của người dùng
        GrabKeyFromSite = false, -- Lấy key từ trang web
        Key = {"thaytubervn"} -- Danh sách key hợp lệ
    }
})

-- Tạo các tab trong giao diện
local Tab1 = Window:CreateTab("Players", 4483362458) -- Tab quản lý người chơi
local Tab2 = Window:CreateTab("Aimbot", 4483362458) -- Tab dành cho các tùy chỉnh ESP
local Tab3 = Window:CreateTab("ESP", 4483362458) -- Tab để chạy script tùy chỉnh
-----------------------
local flying = false
local invisible_enabled = false
local invis_on = false
local Noclip = false
local TeleportEnabled = false
local InfiniteJumpEnabled = false
local following = false -- Biến kiểm soát trạng thái theo dõi
local FullBrightEnabled = false
local viewingPlayer = false
local FlySpeed = 100 -- Giá trị tốc độ mặc định

local UserInputService = game:GetService("UserInputService")
local originalAmbient = game:GetService("Lighting").Ambient
local originalBrightness = game:GetService("Lighting").Brightness
local originalFogEnd = game:GetService("Lighting").FogEnd
local originalCameraSubject = game.Workspace.CurrentCamera.CameraSubject
local nega = true
local SelectedPlayer = nil
--! Nút chọn ngẫu nhiên người chơi
local lastSelectedPlayers = {} -- Danh sách lưu trữ hai người chơi gần nhất


local function fly()
    sound:Play()
    local character = game.Players.LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    if not humanoid then return end

    flying = true
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    local bv = Instance.new("BodyVelocity")
    local bg = Instance.new("BodyGyro")
    bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
    bg.CFrame = hrp.CFrame
    bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
    bg.P = 9e4
    bv.Parent = hrp
    bg.Parent = hrp

    local flycontrol = {F = 0, B = 0, L = 0, R = 0, U = 0, D = 0}

    local uis = game:GetService("UserInputService")
    uis.InputBegan:Connect(function(key, processed)
        if processed then return end
        local keyName = key.KeyCode.Name:lower()
        if keyName == "w" then flycontrol.F = 1
        elseif keyName == "s" then flycontrol.B = 1
        elseif keyName == "a" then flycontrol.L = 1
        elseif keyName == "d" then flycontrol.R = 1
        elseif keyName == "space" then flycontrol.U = 1
        elseif keyName == "leftcontrol" then flycontrol.D = 1
        end
    end)

    uis.InputEnded:Connect(function(key, processed)
        if processed then return end
        local keyName = key.KeyCode.Name:lower()
        if keyName == "w" then flycontrol.F = 0
        elseif keyName == "s" then flycontrol.B = 0
        elseif keyName == "a" then flycontrol.L = 0
        elseif keyName == "d" then flycontrol.R = 0
        elseif keyName == "space" then flycontrol.U = 0
        elseif keyName == "leftcontrol" then flycontrol.D = 0
        end
    end)

    local con = game:GetService("RunService").Stepped:Connect(function()
        if not flying then
            con:Disconnect()
            bv:Destroy()
            bg:Destroy()
        end
        humanoid.PlatformStand = true
        bv.Velocity =
            (workspace.CurrentCamera.CFrame.LookVector * (flycontrol.F - flycontrol.B) * FlySpeed) + 
            (workspace.CurrentCamera.CFrame.RightVector * (flycontrol.R - flycontrol.L) * FlySpeed) + 
            (workspace.CurrentCamera.CFrame.UpVector * (flycontrol.U - flycontrol.D) * FlySpeed)
        bg.CFrame = workspace.CurrentCamera.CFrame
    end)
    game.StarterGui:SetCore("SendNotification", {
        Title = "FLy (ON)",
        Duration = 3,
        Text = "FLy Turn On!"
    })
end

local function stopFlying()
    sound:Play()
    flying = false
    local character = game.Players.LocalPlayer.Character
    if character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if hrp and humanoid then
            for _, obj in pairs(hrp:GetChildren()) do
                if obj:IsA("BodyVelocity") or obj:IsA("BodyGyro") then
                    obj:Destroy()
                end
            end
            humanoid.PlatformStand = false
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        end
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "FLy (OFF)",
        Duration = 3,
        Text = "FLy Turn OFF!"
    })
end

local function setTransparency(character, transparency)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = transparency
        end
    end
end

local function toggleInvisibility()
    invis_on = not invis_on
    sound:Play()
    local player = game.Players.LocalPlayer
    local character = player.Character

    if invis_on then
        local savedpos = character.HumanoidRootPart.CFrame
        wait()
        character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
        wait(.15)
        
        local Seat = Instance.new("Seat", game.Workspace)
        Seat.Anchored = false
        Seat.CanCollide = false
        Seat.Name = "invischair"
        Seat.Transparency = 1
        Seat.Position = Vector3.new(-25.95, 84, 3537.55)

        local Weld = Instance.new("Weld", Seat)
        Weld.Part0 = Seat
        Weld.Part1 = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

        wait()
        Seat.CFrame = savedpos
        setTransparency(character, 0.5)

        game.StarterGui:SetCore("SendNotification", {
            Title = "Invisibility (ON)",
            Duration = 3,
            Text = "You have hidden!"
        })
    else
        local invisChair = workspace:FindFirstChild("invischair")
        if invisChair then
            invisChair:Destroy()
        end
        
        setTransparency(character, 0)
        character.HumanoidRootPart.Transparency = 1

        game.StarterGui:SetCore("SendNotification", {
            Title = "Invisibility (OFF)",
            Duration = 3,
            Text = "You are back to normal!"
        })
    end
end

local modifiedParts = {} -- Danh sách lưu các khối đã bị chỉnh sửa

local function onTouch(part)
    if Noclip and part.CanCollide == true then
        part.CanCollide = false -- Biến đối tượng thành có thể đi xuyên qua
        table.insert(modifiedParts, part) -- Lưu lại khối đã bị chỉnh
    end
end

local function toggleNoClip()
    Noclip = not Noclip -- Đảo trạng thái Noclip
    sound:Play()
    for _, v in pairs(player.Character:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
            v.CanCollide = not Noclip -- Khi bật, tắt va chạm; Khi tắt, bật lại va chạm

            if Noclip then
                v.Touched:Connect(onTouch) -- Kết nối sự kiện khi bật
            end
        end
    end

    -- Khi tắt Noclip, khôi phục các khối đã bị chỉnh
    if not Noclip then
        for _, part in pairs(modifiedParts) do
            if part then
                part.CanCollide = true -- Đặt lại va chạm cho các khối đã bị chỉnh sửa
            end
        end
        modifiedParts = {} -- Xóa danh sách sau khi khôi phục
    end

    game.StarterGui:SetCore("SendNotification", {
        Title = "Noclip",
        Duration = 3,
        Text = "Noclip is now - " .. tostring(Noclip)
    })
end

local function infJump()
    sound:Play()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    game.StarterGui:SetCore("SendNotification", {
        Title = "InfJump",
        Duration = 3,
        Text = "InfJump is now - " .. tostring(InfiniteJumpEnabled)
    })
end

-- Hàm kiểm tra input và đặt lại giá trị nếu trống
local function handleKeybindInput(input, defaultValue)
    return (input and input ~= "") and input:upper() or defaultValue
end

local function toggleFullBright()
    local lighting = game:GetService("Lighting")
    FullBrightEnabled = not FullBrightEnabled

    if FullBrightEnabled then
        sound:Play()
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.Brightness = 1
        lighting.FogEnd = 1e10

        -- Tắt các hiệu ứng làm mờ
        for _, v in pairs(lighting:GetDescendants()) do
            if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = false
            end
        end

        -- Thêm ánh sáng vào nhân vật
        spawn(function()
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character
            repeat wait() until character ~= nil

            if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                local headlight = Instance.new("PointLight", character.HumanoidRootPart)
                headlight.Brightness = 1
                headlight.Range = 60
                headlight.Name = "CustomLight"
            end
        end)
    else
        sound:Play()
        -- Khôi phục ánh sáng mặc định
        lighting.Ambient = originalAmbient
        lighting.Brightness = originalBrightness
        lighting.FogEnd = originalFogEnd

        for _, v in pairs(lighting:GetDescendants()) do
            if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = true
            end
        end

        -- Xóa ánh sáng nhân vật khi tắt
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        if character and character.HumanoidRootPart then
            local headlight = character.HumanoidRootPart:FindFirstChild("CustomLight")
            if headlight then
                headlight:Destroy()
            end
        end
    end
end

local function toggleKillbrick()
    nega = not nega

    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local parts = workspace:GetPartBoundsInRadius(humanoidRootPart.Position, 10)
    for _, part in ipairs(parts) do
        part.CanTouch = nega
    end
end

---------------------
local FlyKeybind = "F" -- Phím mặc định
local InvisKeybind = "G" -- Phím mặc định
local NoclipKey = "X" -- Bạn có thể thay đổi phím tắt tại đây
local InfJumpKey = "Z" -- Bạn có thể thay đổi phím tắt tại đây

local Tile1 = Tab1:CreateSection("Movement")

-- Tốc độ chạy
local WalkSpeedSlider = Tab1:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 300},
    Increment = 5,
    CurrentValue = Humanoid.WalkSpeed,
    Callback = function(Value)
        Humanoid.WalkSpeed = Value
    end
})

-- **Chỉnh độ cao khi nhảy**
local JumpSlider = Tab1:CreateSlider({
    Name = "Jump height",
    Range = {7.2, 1000},
    Increment = 20,
    CurrentValue = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = false
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
    end
})

-- **Chỉnh tốc độ bay**
local FlySpeedSlider = Tab1:CreateSlider({
    Name = "Flight speed",
    Range = {50, 1000},
    Default = FlySpeed, -- Giá trị mặc định
    Increment = 10,
    CurrentValue = FlySpeed,
    Callback = function(Value)
        FlySpeed = Value
    end
})

local FlyButton = Tab1:CreateButton({
    Name = "Fly",
    Callback = function()
        if flying then
            stopFlying()
        else
            fly()
        end
    end
})

-- Nút bật/tắt teleport
local TeleportButton = Tab1:CreateButton({
    Name = "CLick Teleport",
    Callback = function()
        TeleportEnabled = not TeleportEnabled
        sound:Play()
        Rayfield:Notify({
            Title = "Notification",
            Content = TeleportEnabled and "Teleport is on!" or "Teleport is off!",
            Duration = 2.5
        })
    end
})

local InfJumpButton = Tab1:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        InfiniteJumpEnabled = not InfiniteJumpEnabled
        if InfiniteJumpEnabled then
            infJump()
        end
    end
})


local Tile2 = Tab1:CreateSection("Players")
-- Thêm nút bật/tắt ẩn thân vào menu Rayfield
local InvisButton = Tab1:CreateButton({
    Name = "Invisible",
    Callback = function()
        toggleInvisibility()
    end,
})

local NoclipButton = Tab1:CreateButton({
    Name = "Noclip",
    Callback = function()
        toggleNoClip()
    end,
})
-- Tạo nút bật/tắt Full Bright
local FullBrightButton = Tab1:CreateButton({
    Name = "Full Bright",
    Callback = function()
        toggleFullBright()
    end,
})

Tab1:CreateButton({
    Name = "Killbrick Toggle",
    Callback = function()
        toggleKillbrick()
        if nega then
            sound:Play()
            Rayfield:Notify({
                Title = "Killbrick",
                Content = "Killbrick is now OFF",
                Duration = 2
            })
        else
            sound:Play()
            Rayfield:Notify({
                Title = "Killbrick",
                Content = "Killbrick is now ON",
                Duration = 2
            })
        end
    end
})


local Tile3 = Tab1:CreateSection("OtherPlayers")
--! Tạo textbox nhập tên người chơi
local PlayerTextbox = Tab1:CreateInput({
    Name = "Enter player name or nickname",
    PlaceholderText = "Enter a partial player name",
    Callback = function(input)
        SelectedPlayer = nil
        for _, p in ipairs(game.Players:GetPlayers()) do
            if string.find(string.lower(p.Name), string.lower(input)) then
                SelectedPlayer = p
                print("You have entered: " .. input .. " - Find: " .. p.Name)
                break
            end
        end
    end
})


local RandomPlayerButton = Tab1:CreateButton({
    Name = "Randomly Select Players",
    Callback = function()
        local players = game.Players:GetPlayers()
        local localPlayer = game.Players.LocalPlayer

        -- Loại bỏ người chơi chính mình khỏi danh sách
        for i = #players, 1, -1 do
            if players[i] == localPlayer then
                table.remove(players, i)
                break
            end
        end

        -- Loại bỏ hai người chơi gần nhất từ danh sách
        for _, lastPlayer in ipairs(lastSelectedPlayers) do
            for i = #players, 1, -1 do
                if players[i] == lastPlayer then
                    table.remove(players, i)
                    break
                end
            end
        end

        if #players > 0 then
            sound:Play()
            SelectedPlayer = players[math.random(1, #players)]
            PlayerTextbox.Text = SelectedPlayer.Name -- Cập nhật tên vào textbox
            
            -- Lấy URL ảnh đại diện của người chơi
            local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. SelectedPlayer.UserId .. "&width=150&height=150&format=png"

            -- Hiển thị thông báo với avatar
            game.StarterGui:SetCore("SendNotification", {
                Title = "The player is chosen",
                Text = SelectedPlayer.Name,
                Duration = 4,
                Icon = avatarUrl -- Hiển thị avatar
            })

            print("Randomly selected player: " .. SelectedPlayer.Name)

            -- Cập nhật danh sách người chơi đã chọn gần nhất
            table.insert(lastSelectedPlayers, SelectedPlayer)
            if #lastSelectedPlayers > 2 then
                table.remove(lastSelectedPlayers, 1) -- Đảm bảo danh sách chỉ chứa hai người chơi gần nhất
            end
        else
            sound:Play()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Server",
                Text = "No One Found",
                Duration = 4,
            })
            print("No players found in server!")
        end
    end
})


--! Nút teleport đến người chơi đã nhập
local TeleportToPlayer = Tab1:CreateButton({
    Name = "Teleport to player",
    Callback = function()
        if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            sound:Play()
            player.Character.HumanoidRootPart.CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame
            print("Teleported to player: " .. SelectedPlayer.Name)
        else
            sound:Play()
            print("Cannot teleport! Check player name.")
        end
    end
})

--! Nút bật/tắt theo dõi
local FollowPlayer = Tab1:CreateButton({
    Name = "Enable/Disable Tracking",
    Callback = function()
        following = not following -- Đảo trạng thái theo dõi

        if following then
            sound:Play()
            if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
                spawn(function()
                    while following do
                        if not SelectedPlayer or not SelectedPlayer.Character or not SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            following = false
                            break
                        end

                        -- Lấy vị trí của người chơi mục tiêu
                        local targetPosition = SelectedPlayer.Character.HumanoidRootPart.Position

                        -- Điều chỉnh vị trí gần hơn phía sau lưng và lơ lửng
                        local offset = Vector3.new(0, 5, -1) -- Giữ khoảng cách phía sau chỉ 1 đơn vị
                        local newPosition = targetPosition + SelectedPlayer.Character.HumanoidRootPart.CFrame.LookVector * offset.Z + Vector3.new(0, offset.Y, 0)

                        -- Dịch chuyển người chơi theo vị trí mới
                        player.Character:SetPrimaryPartCFrame(CFrame.new(newPosition))

                        task.wait()
                    end
                end)
            else
            end
        else
            sound:Play()
        end
    end
})

--! Nút chuyển góc nhìn
local ViewPlayerButton = Tab1:CreateButton({
    Name = "Change Perspective",
    Callback = function()
        local camera = game.Workspace.CurrentCamera
        if viewingPlayer then
            sound:Play()
            -- Trở về góc nhìn ban đầu
            camera.CameraSubject = originalCameraSubject
            viewingPlayer = false
        else
            sound:Play()
            -- Chuyển góc nhìn sang người chơi đã nhập
            if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
                camera.CameraSubject = SelectedPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                viewingPlayer = true
            else
            end
        end
    end
})


local Tile4 = Tab1:CreateSection("SettingKey")
-- Fly --
local KeybindInput = Tab1:CreateInput({
    Name = "Fly On/Off Key",
    PlaceholderText = FlyKeybind,
    RemoveTextAfterFocusLost = false,
    Flag = "Fly_Key",
    Callback = function(input)
        FlyKeybind = handleKeybindInput(input, "F") -- Sử dụng giá trị mặc định nếu input rỗng
    end
})

-- Invisible --
local KeybindInput2 = Tab1:CreateInput({
    Name = "Invisible on/off key",
    PlaceholderText = InvisKeybind,
    RemoveTextAfterFocusLost = false,
    Flag = "Invisible_Key",
    Callback = function(input)
        InvisKeybind = handleKeybindInput(input, "G")
    end
})

-- Noclip --
local KeybindInput3 = Tab1:CreateInput({
    Name = "Noclip on/off key",
    PlaceholderText = NoclipKey,
    RemoveTextAfterFocusLost = false,
    Flag = "Noclip_Key",
    Callback = function(input)
        NoclipKey = handleKeybindInput(input, "X")
    end
})

-- InfJump --
local KeybindInput4 = Tab1:CreateInput({
    Name = "InfJump on/off key",
    PlaceholderText = InfJumpKey,
    RemoveTextAfterFocusLost = false,
    Flag = "InfJump_Key",
    Callback = function(input)
        InfJumpKey = handleKeybindInput(input, "Z")
    end
})

----------------------------
game:GetService("UserInputService").InputBegan:Connect(function(key, processed)
    if processed then return end
    local keyName = key.KeyCode.Name:upper()

    if keyName == FlyKeybind then
        if flying then stopFlying() else fly() end
    elseif keyName == InvisKeybind then
        toggleInvisibility()
    elseif keyName == NoclipKey then
        toggleNoClip()
    elseif keyName == InfJumpKey then
        infJump()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)

    if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed and TeleportEnabled then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character.PrimaryPart then
            local mouse = player:GetMouse()
            player.Character:SetPrimaryPartCFrame(CFrame.new(mouse.Hit.p))
        end
    end
end)



------------------------------------------------------
----------TAB 2 _____________________________________-

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local players = game:GetService("Players")
local wrk = game:GetService("Workspace")
local plr = players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local humanoid = plr.Character:FindFirstChild("Humanoid")

local function onCharacterAdded(character)
    hrp = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
end

plr.CharacterAdded:Connect(onCharacterAdded)

if plr.Character then
    onCharacterAdded(plr.Character)
end

local camera = wrk.CurrentCamera
local mouse = plr:GetMouse()

local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local hue = 0
local rainbowFov = true
local rainbowSpeed = 0.005

local aimFov = 100
local aimParts = {"Head"}
local aiming = false
local predictionStrength = 0
local smoothing = 0

local aimbotEnabled = false
local wallCheck = false
local stickyAimEnabled = false
local teamCheck = false
local healthCheck = false
local minHealth = 0

local antiAim = false

local antiAimAmountX = 0
local antiAimAmountY = -100
local antiAimAmountZ = 0

local antiAimMethod = "Reset Velo"

local randomVeloRange = 100

local spinBot = false
local spinBotSpeed = 20

local circleColor = Color3.fromRGB(255, 0, 0)
local targetedCircleColor = Color3.fromRGB(0, 255, 0)

local aimViewerEnabled = false
local ignoreSelf = true

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.Radius = aimFov
fovCircle.Filled = false
fovCircle.Color = circleColor
fovCircle.Visible = false

local currentTarget = nil

local function checkTeam(player)
    if teamCheck and player.Team == plr.Team then
        return true
    end
    return false
end

local function checkWall(targetCharacter)
    local targetHead = targetCharacter:FindFirstChild("Head")
    if not targetHead then return true end

    local origin = camera.CFrame.Position
    local direction = (targetHead.Position - origin).unit * (targetHead.Position - origin).magnitude
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {plr.Character, targetCharacter}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = wrk:Raycast(origin, direction, raycastParams)
    return raycastResult and raycastResult.Instance ~= nil
end

local function getClosestPart(character)
    local closestPart = nil
    local shortestCursorDistance = aimFov * 0.8 -- Giảm phạm vi ngắm để tăng độ chính xác
    local cameraPos = camera.CFrame.Position

    for _, partName in ipairs(aimParts) do
        local part = character:FindFirstChild(partName)
        if part then
            local partPos = camera:WorldToViewportPoint(part.Position)
            local screenPos = Vector2.new(partPos.X, partPos.Y)
            local cursorDistance = (screenPos - Vector2.new(mouse.X, mouse.Y)).Magnitude

            if cursorDistance < shortestCursorDistance and partPos.Z > 0 then
                shortestCursorDistance = cursorDistance
                closestPart = part
            end
        end
    end

    return closestPart
end

local function getTarget()
    local nearestPlayer = nil
    local closestPart = nil
    local shortestCursorDistance = aimFov * 0.75 -- Tăng độ chính xác bằng cách giảm phạm vi tìm kiếm

    for _, player in ipairs(players:GetPlayers()) do
        if player ~= plr and player.Character and not checkTeam(player) then
            if player.Character.Humanoid.Health >= minHealth or not healthCheck then
                local targetPart = getClosestPart(player.Character)
                if targetPart then
                    local screenPos = camera:WorldToViewportPoint(targetPart.Position)
                    local cursorDistance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

                    if cursorDistance < shortestCursorDistance then
                        if not wallCheck or not checkWall(player.Character) then
                            shortestCursorDistance = cursorDistance
                            nearestPlayer = player
                            closestPart = targetPart
                        end
                    end
                end
            end
        end
    end

    return nearestPlayer, closestPart
end


local function predict(player, part)
    if player and part then
        local velocity = player.Character.HumanoidRootPart.Velocity
        local predictedPosition = part.Position + (velocity * predictionStrength) * 0.5 -- Giảm sức mạnh dự đoán
        return predictedPosition
    end
    return nil
end

local function smooth(from, to)
    return from:Lerp(to, smoothing * 0.8) -- Tăng độ bám sát mục tiêu
end

local function aimAt(player, part)
    local predictedPosition = predict(player, part)
    if predictedPosition then
        if player.Character.Humanoid.Health >= minHealth or not healthCheck then
            camera.CFrame = CFrame.new(camera.CFrame.Position, predictedPosition)
        end
    end
end




RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local offset = 50
        fovCircle.Position = Vector2.new(mouse.X, mouse.Y + offset)

        if rainbowFov then
            hue = hue + rainbowSpeed
            if hue > 1 then hue = 0 end
            fovCircle.Color = Color3.fromHSV(hue, 1, 1)
        else
            if aiming and currentTarget then
                fovCircle.Color = targetedCircleColor
            else
                fovCircle.Color = circleColor
            end
        end

        if aiming then
            if stickyAimEnabled and currentTarget then
                local headPos = camera:WorldToViewportPoint(currentTarget.Character.Head.Position)
                local screenPos = Vector2.new(headPos.X, headPos.Y)
                local cursorDistance = (screenPos - Vector2.new(mouse.X, mouse.Y)).Magnitude

                if cursorDistance > aimFov or (wallCheck and checkWall(currentTarget.Character)) or checkTeam(currentTarget) then
                    currentTarget = nil
                end
            end

            if not stickyAimEnabled or not currentTarget then
                local target, targetPart = getTarget()
                currentTarget = target
                currentTargetPart = targetPart
            end

            if currentTarget and currentTargetPart then
                aimAt(currentTarget, currentTargetPart)
            end
        else
            currentTarget = nil
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if antiAim then
        if antiAimMethod == "Reset Velo" then
            local vel = hrp.Velocity
            hrp.Velocity = Vector3.new(antiAimAmountX, antiAimAmountY, antiAimAmountZ)
            RunService.RenderStepped:Wait()
            hrp.Velocity = vel
        elseif antiAimMethod == "Reset Pos [BROKEN]" then
            local pos = hrp.CFrame
            hrp.Velocity = Vector3.new(antiAimAmountX, antiAimAmountY, antiAimAmountZ)
            RunService.RenderStepped:Wait()
            hrp.CFrame = pos
        elseif antiAimMethod == "Random Velo" then
            local vel = hrp.Velocity
            local a = math.random(-randomVeloRange,randomVeloRange)
            local s = math.random(-randomVeloRange,randomVeloRange)
            local d = math.random(-randomVeloRange,randomVeloRange)
            hrp.Velocity = Vector3.new(a,s,d)
            RunService.RenderStepped:Wait()
            hrp.Velocity = vel
        end
    end
end)

mouse.Button2Down:Connect(function()
    if aimbotEnabled then
        aiming = true
    end
end)

mouse.Button2Up:Connect(function()
    if aimbotEnabled then
        aiming = false
    end
end)

local Tile1 = Tab2:CreateSection("Aimbot")

local aimbot = Tab2:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(Value)
        sound:Play()
        aimbotEnabled = Value
        fovCircle.Visible = Value
    end
})

local aimpart = Tab2:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head","HumanoidRootPart","Left Arm","Right Arm","Torso","Left Leg","Right Leg"},
    CurrentOption = {"Head"},
    MultipleOptions = true,
    Flag = "AimPart",
    Callback = function(Options)
        aimParts = Options
    end,
 })

 
local fovvisibility = Tab2:CreateToggle({
    Name = "Fov Visibility",
    CurrentValue = true,
    Flag = "FovVisibility",
    Callback = function(Value)
        sound:Play()
        fovCircle.Visible = Value
    end
})

local aimbotfov = Tab2:CreateSlider({
    Name = "Aimbot Fov",
    Range = {0, 1000},
    Increment = 1,
    CurrentValue = 100,
    Flag = "AimbotFov",
    Callback = function(Value)
        aimFov = Value
        fovCircle.Radius = aimFov
    end,
})

local Tile2 = Tab2:CreateSection("Setting")

local wallcheck = Tab2:CreateToggle({
    Name = "Wall Check",
    CurrentValue = false,
    Flag = "WallCheck",
    Callback = function(Value)
        sound:Play()
        wallCheck = Value
    end
})

local stickyaim = Tab2:CreateToggle({
    Name = "Sticky Aim",
    CurrentValue = false,
    Flag = "StickyAim",
    Callback = function(Value)
        sound:Play()
        stickyAimEnabled = Value
    end
})

local teamchecktoggle = Tab2:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Flag = "TeamCheck",
    Callback = function(Value)
        sound:Play()
        teamCheck = Value
    end
})

local healthchecktoggle = Tab2:CreateToggle({
    Name = "Health Check",
    CurrentValue = false,
    Flag = "HealthCheck",
    Callback = function(Value)
        sound:Play()
        healthCheck = Value
    end
})

local minhealth = Tab2:CreateSlider({
    Name = "Min Health",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 0,
    Flag = "MinHealth",
    Callback = function(Value)
        minHealth = Value
    end,
})

local circlecolor = Tab2:CreateColorPicker({
    Name = "Fov Color",
    Color = circleColor,
    Callback = function(Color)
        circleColor = Color
        fovCircle.Color = Color
    end
})

local targetedcirclecolor = Tab2:CreateColorPicker({
    Name = "Targeted Fov Color",
    Color = targetedCircleColor,
    Callback = function(Color)
        targetedCircleColor = Color
    end
})

local circlerainbow = Tab2:CreateToggle({
    Name = "Rainbow Fov",
    CurrentValue = true,
    Flag = "RainbowFov",
    Callback = function(Value)
        sound:Play()
        rainbowFov = Value
    end
})

------------------------------------------------------
--------ESP------------------------------------------

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local camera = workspace.CurrentCamera
local lplr = Players.LocalPlayer

-- Biến toàn cục về ESP
local nameEspEnabled = false
_G.TeamCheck = false
_G.ESPEnabled = false
_G.TeamCheckTracer = false
_G.TracerColor = Color3.new(1, 1, 1)
_G.RainbowEnabled = false
_G.BoxESPEnabled = false
_G.NameESPEnabled = false
_G.NameESPFont = 12

-- Biến Box ESP
local BoxEnabled = false
local RainbowEnabled = false
local BoxStroke = 2
local BoxObjects = {}
local BoxConfig = { BoxTransparency = 0.5, MaxDistance = 5000 }

-- Biến Tracer & Name ESP
local tracers = {}
local nameTags = {}



local function createTracer(player)
    if tracers[player] or player == lplr then return end -- Không liên kết chính mình
    local tracer = Drawing.new("Line")
    tracer.Thickness = 1
    tracer.Color = _G.TracerColor or Color3.fromRGB(255, 0, 0)
    tracer.Visible = false
    tracers[player] = tracer
end

local function getRainbowColor()
    local hue = (tick() % 5) / 5
    return Color3.fromHSV(hue, 1, 1)
end


local function updateTracers()
    for player, tracer in pairs(tracers) do
        if _G.ESPEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Humanoid.Health > 0 then
            -- Kiểm tra nếu team check bật và người chơi cùng đội
            if _G.TeamCheckTracer and player.Team == lplr.Team then
                tracer.Visible = false -- Ẩn tracer nếu cùng đội
            else
                local screenPos, onScreen = camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                if onScreen then
                    tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 50)
                    tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                    tracer.Visible = true
                    
                    -- Kiểm tra nếu chế độ Rainbow đang bật
                    if _G.RainbowEnabled then
                        tracer.Color = getRainbowColor()
                    else
                        tracer.Color = _G.TracerColor
                    end
                else
                    tracer.Visible = false
                end
            end
        else
            tracer.Visible = false
        end
    end
end



local function createNameTag(player)
    if nameTags[player] or player == lplr then return end -- Không hiển thị tên chính mình
    local nameTag = Drawing.new("Text")
    nameTag.Text = player.Name
    nameTag.Size = _G.NameESPFont or 12
    nameTag.Color = Color3.fromRGB(255, 255, 255) -- Màu mặc định là trắng
    nameTag.Center = true
    nameTag.Visible = false
    nameTags[player] = nameTag
end

local function updateNameTags()
    for player, nameTag in pairs(nameTags) do
        if nameEspEnabled and player.Character and player.Character:FindFirstChild("Head") then
            local screenPos, onScreen = camera:WorldToViewportPoint(player.Character.Head.Position)
            if onScreen then
                nameTag.Position = Vector2.new(screenPos.X, screenPos.Y - 20) -- Để tên ở trên đầu
                nameTag.Visible = true
                nameTag.Color = _G.RainbowEnabled and getRainbowColor() or Color3.fromRGB(255, 255, 255) -- Rainbow màu nếu bật
            else
                nameTag.Visible = false
            end
        else
            nameTag.Visible = false
        end
    end
end


local function toggleNameESP(state)
    nameEspEnabled = state
    if state then
        sound:Play()
        for _, player in pairs(Players:GetPlayers()) do
            createNameTag(player)
        end
    else
        sound:Play()
        for _, nameTag in pairs(nameTags) do
            nameTag.Visible = false
        end
    end
end

--Hàm bật/tắt Box
local function ToggleBox(state)
    sound:Play()
    BoxEnabled = state

    if not BoxEnabled then
        for _, boxObject in pairs(BoxObjects) do
            boxObject.Box.Visible = false
        end
    end
end

-- Hàm cập nhật độ dày viền
local function UpdateStroke(value)
    BoxStroke = tonumber(value) or 2 -- Đảm bảo giá trị hợp lệ
    for _, boxObject in pairs(BoxObjects) do
        boxObject.Box.Thickness = BoxStroke
    end
end

-- Hàm tạo Box cho người chơi
local function CreateBoxForPlayer(player)
    if player == LocalPlayer then return end

    local boxObject = {
        Box = Drawing.new("Square"),
    }

    -- Thiết lập Box
    boxObject.Box.Visible = false
    boxObject.Box.Thickness = BoxStroke
    boxObject.Box.Transparency = BoxConfig.BoxTransparency
    boxObject.Box.Filled = false
    boxObject.Box.Color = Color3.fromRGB(255, 255, 255) -- Mặc định là màu trắng

    BoxObjects[player] = boxObject

    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(game) then
            boxObject.Box:Remove()
            BoxObjects[player] = nil
        end
    end)
end

-- Thêm Box cho tất cả người chơi hiện tại
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateBoxForPlayer(player)
    end
end


RunService.RenderStepped:Connect(function()
    if not BoxEnabled then return end

    for player, boxObject in pairs(BoxObjects) do
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            boxObject.Box.Visible = false
            continue
        end

        -- 🔥 Kiểm tra Team Check (Nếu bật thì Box không hiển thị trên đồng đội)
        if _G.TeamCheck then
            if player.Team == lplr.Team then
                boxObject.Box.Visible = false
                continue
            end
        end

        -- 🔥 Kiểm tra nếu người chơi là chính bạn
        if player == lplr then
            boxObject.Box.Visible = false
            continue
        end

        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local vector, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)
        local distance = (humanoidRootPart.Position - camera.CFrame.Position).Magnitude

        if onScreen and distance <= BoxConfig.MaxDistance then
            local topPosition = humanoidRootPart.Position + Vector3.new(0, 3, 0)
            local bottomPosition = humanoidRootPart.Position - Vector3.new(0, 3, 0)

            local topVector = camera:WorldToViewportPoint(topPosition)
            local bottomVector = camera:WorldToViewportPoint(bottomPosition)

            local height = math.abs(topVector.Y - bottomVector.Y)
            local width = height * 0.6

            local boxPosition = Vector2.new(vector.X - width / 2, vector.Y - height / 2)
            local boxSize = Vector2.new(width, height)

            -- Cập nhật Box
            boxObject.Box.Position = boxPosition
            boxObject.Box.Size = boxSize
            boxObject.Box.Visible = true
            boxObject.Box.Thickness = BoxStroke

            -- Cập nhật màu Rainbow nếu bật
            boxObject.Box.Color = RainbowEnabled and getRainbowColor() or Color3.fromRGB(255, 255, 255)
        else
            boxObject.Box.Visible = false
        end
    end
end)



local function toggleESPTracer(state)
    _G.ESPEnabled = state
    if state then
         sound:Play()
        for _, player in pairs(Players:GetPlayers()) do
            createTracer(player)
        end
    else
        sound:Play()
        for _, tracer in pairs(tracers) do
            tracer.Visible = false
        end
    end
end


Players.PlayerAdded:Connect(createTracer)
Players.PlayerAdded:Connect(CreateBoxForPlayer)
Players.PlayerAdded:Connect(createNameTag)
Players.PlayerRemoving:Connect(function(player)
    if tracers[player] then
        tracers[player]:Remove()
        tracers[player] = nil
    end
    if nameTags[player] then
        nameTags[player]:Remove()
        nameTags[player] = nil
    end
end)
RunService.RenderStepped:Connect(updateTracers)
RunService.RenderStepped:Connect(updateNameTags)

local Tile1 = Tab3:CreateSection("ESP")
-- Nút bật/tắt ESP Tracer
local espToggle = Tab3:CreateToggle({
    Name = "ESP Tracer",
    Default = false,
    Flag = "Tracer",
    Callback = function(Value)
        toggleESPTracer(Value)
    end
})

-- Tạo tab UI cho Box
Tab3:CreateToggle({
    Name = "Turn Box On/Off",
    Default = false,
    Flag = "Box",
    Callback = function(Value)
        ToggleBox(Value)
    end
})

-- Thêm nút bật/tắt ESP Name
local nameEspToggle = Tab3:CreateToggle({
    Name = "ESP Name",
    Default = false,
    Flag = "Name",
    Callback = function(Value)
        toggleNameESP(Value)
    end
})

-- Thêm Toggle bật/tắt chế độ Rainbow
local RainbowEsp = Tab3:CreateToggle({
    Name = "Turn Rainbow mode on/off",
    Default = false,
    Flag = "RainbowESP",
    Callback = function(Value)
        sound:Play()
        _G.RainbowEnabled = Value
        RainbowEnabled = Value
    end
})

local Tile2 = Tab3:CreateSection("Setting")

-- Nút bật/tắt Team Check cho Tracer
local teamCheckToggle = Tab3:CreateToggle({
    Name = "Team Check ESP",
    Default = false,
    Flag = "TeamcheckESP",
    Callback = function(Value)
        sound:Play()
        _G.TeamCheckTracer = Value
        _G.TeamCheck = Value
    end
})

-- Slider chỉnh kích thước chữ ESP Name
local nameSizeSlider = Tab3:CreateSlider({
    Name = "ESP Name font size",
    Range = {10, 30},
    Increment = 1,
    CurrentValue = 12,
    Flag = "SizeESPName",
    Callback = function(Value)
        _G.NameESPFontSize = Value
        for _, nameTag in pairs(nameTags) do
            nameTag.Size = Value
        end
    end
})

-- Slider chỉnh độ dày của tracer
local tracerThicknessSlider = Tab3:CreateSlider({
    Name = "Tracer Thickness",
    Range = {1, 5},
    Increment = 1,
    CurrentValue = 1,
    Flag = "TracerThickness",
    Callback = function(Value)
        for _, tracer in pairs(tracers) do
            tracer.Thickness = Value
        end
    end
})

Tab3:CreateSlider({
    Name = "Box Border Thickness",
    Range = {1, 5}, -- Giá trị từ 1 đến 5
    Increment = 1, -- Tăng từng đơn vị
    CurrentValue = BoxStroke, -- Giá trị mặc định
    Flag = "Box Stroke",
    Callback = function(Value)
        UpdateStroke(Value)
    end
})

Rayfield:LoadConfiguration()
