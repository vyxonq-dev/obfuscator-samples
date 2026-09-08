local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Basic Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Basic Script",
   LoadingSubtitle = "by NO IT'S FREE",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Basic Script", 4483362458) -- Title, Image

local UIS = game:GetService("UserInputService")

local Toggle = Tab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle1",
    Callback = function(Value)
        local LP = game:GetService("Players").LocalPlayer
        local Char = LP.Character or LP.CharacterAdded:Wait()
        local Camera = game:GetService("Workspace").CurrentCamera
        
        -- ตั้งค่าความเร็ว
        local speed = 50 

        if Value then
            local root = Char:WaitForChild("HumanoidRootPart")
            
            -- สร้างแรงผลักและแรงหมุน
            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlyVelocity"
            bv.Parent = root
            bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bv.Velocity = Vector3.new(0, 0, 0)

            local bg = Instance.new("BodyGyro")
            bg.Name = "FlyGyro"
            bg.Parent = root
            bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            bg.P = 9000
            
            -- ปิด Gravity ชั่วคราวเพื่อให้ตัวไม่ตก
            Char.Humanoid.PlatformStand = true

            task.spawn(function()
                while Value and task.wait() do
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    -- ตรวจสอบการกดปุ่มเดิน
                    if UIS:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + Camera.CFrame.LookVector
                    end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - Camera.CFrame.LookVector
                    end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - Camera.CFrame.RightVector
                    end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + Camera.CFrame.RightVector
                    end

                    -- ถ้ามีการกดปุ่ม ให้เคลื่อนที่ตามความเร็ว แต่ถ้าไม่กด ให้หยุดนิ่ง (0,0,0)
                    if moveDirection.Magnitude > 0 then
                        bv.Velocity = moveDirection.Unit * speed
                    else
                        bv.Velocity = Vector3.new(0, 0, 0)
                    end
                    
                    -- ให้ตัวละครหันตามกล้องตลอดเวลา
                    bg.CFrame = Camera.CFrame
                end
            end)
        else
            -- ลบ Object และคืนค่าตัวละครเมื่อปิดใช้งาน
            Char.Humanoid.PlatformStand = false
            if Char:FindFirstChild("HumanoidRootPart") then
                local root = Char.HumanoidRootPart
                if root:FindFirstChild("FlyVelocity") then root.FlyVelocity:Destroy() end
                if root:FindFirstChild("FlyGyro") then root.FlyGyro:Destroy() end
            end
        end
    end,
})

local Slider = Tab:CreateSlider({
   Name = "Speed Set",
   Range = {0, 9999},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local RunService = game:GetService("RunService")
local noclipConnection -- ตัวแปรสำหรับเก็บการเชื่อมต่อลูป

local Toggle = Tab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip1",
    Callback = function(Value)
        local LP = game:GetService("Players").LocalPlayer
        
        if Value then
            -- เริ่มทำงาน Noclip
            noclipConnection = RunService.Stepped:Connect(function()
                if LP.Character then
                    for _, part in pairs(LP.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide == true then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            -- หยุดทำงาน Noclip
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end,
})

local Input = Tab:CreateInput({
    Name = "TP to Player",
    CurrentValue = "",
    PlaceholderText = "name",
    RemoveTextAfterFocusLost = false,
    Flag = "TPInput1",
    Callback = function(Text)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        
        local function findTarget(name)
            for _, player in pairs(Players:GetPlayers()) do
                
                if string.sub(string.lower(player.Name), 1, #name) == string.lower(name) or 
                   string.sub(string.lower(player.DisplayName), 1, #name) == string.lower(name) then
                    return player
                end
            end
            return nil
        end

        local targetPlayer = findTarget(Text)

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
               
                character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
                print("Teleported to: " .. targetPlayer.Name)
            end
        else
            warn("Not found")
        end
    end,
})

local RunService = game:GetService("RunService")
local wallWalkConnection

local RunService = game:GetService("RunService")
local wallWalkConnection

local RunService = game:GetService("RunService")
local wallConnection

local RunService = game:GetService("RunService")
local wallConnection

local Toggle = Tab:CreateToggle({
    Name = "Spider Stick Wall",
    CurrentValue = false,
    Flag = "SpiderStick1",
    Callback = function(Value)
        local LP = game:GetService("Players").LocalPlayer
        
        if Value then
            wallConnection = RunService.Heartbeat:Connect(function()
                local Char = LP.Character
                if Char and Char:FindFirstChild("HumanoidRootPart") then
                    local Root = Char.HumanoidRootPart
                    local Hum = Char.Humanoid
                    
                    local params = RaycastParams.new()
                    params.FilterDescendantsInstances = {Char}
                    params.FilterType = Enum.RaycastFilterType.Exclude
                    
                    -- ยิงเลเซอร์เช็กกำแพง
                    local result = workspace:Raycast(Root.Position, Root.CFrame.LookVector * 3.5, params)
                    
                    if result and result.Instance then
                        Hum:ChangeState(Enum.HumanoidStateType.Climbing)
                        
                        -- ปรับองศาตัวละครให้ขนานกำแพง
                        local look = Root.CFrame.LookVector
                        local wallNormal = result.Normal
                        local newUp = wallNormal
                        local newRight = look:Cross(newUp)
                        local newLook = newUp:Cross(newRight)
                        
                        Root.CFrame = Root.CFrame:Lerp(CFrame.fromMatrix(Root.Position, newRight, newUp, -newLook), 0.15)
                        
                        -- ระบบเกาะนิ่ง (Stick System)
                        if Hum.MoveDirection.Magnitude > 0 then
                            -- ถ้ากำลังกดเดิน ให้เคลื่อนที่ตามปกติ
                            Root.Velocity = Root.Velocity + (wallNormal * -5) + Vector3.new(0, 15, 0)
                        else
                            -- ถ้าหยุดเดิน ให้ล็อคตัวไว้นิ่งๆ (แรงต้านแรงโน้มถ่วง)
                            Root.Velocity = Vector3.new(0, 0.1, 0) -- 0.1 เพื่อกันไม่ให้ฟิสิกส์หลับ
                        end
                    end
                end
            end)
        else
            if wallConnection then
                wallConnection:Disconnect()
                wallConnection = nil
            end
        end
    end,
})

local Tab = Window:CreateTab("Fe Script", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dex",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/memeenjoyer43/darkdex/refs/heads/main/script"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "SimpleSpy",
   Callback = function()
   loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()

   end,
})