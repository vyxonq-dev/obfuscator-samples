-- [[ JORDAN'S MENU | V26 MASTER ]]
-- [[ RAGE AIMBOT | WASD FLY | 5-MIN EXPIRE ]]

getgenv().SecureMode = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

-- [[ FOV CIRCLE INITIALIZATION ]]
if getgenv().JordanFOV then getgenv().JordanFOV:Remove() end -- Cleanup old circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 60
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Color = Color3.fromRGB(255, 0, 0) -- Red
FOVCircle.Visible = false
getgenv().JordanFOV = FOVCircle

-- [[ AUTH CONFIG ]]
local MyWebsite = "https://yourdad69bihj.github.io/sdfsdfsdfsdfsdfsdfsdf/" 
local ConfigName = "JordanAuth_Session.txt"
local CurrentSessionKey = ""
local ExpirationTime = 300 

local MenuSettings = {
    Aimbot = false, FOV = 150, ShowFOV = false, Smoothing = 1,
    ESP = false, Fly = false, FlySpeed = 50, WalkSpeed = 16, Noclip = false
}

local Window = Rayfield:CreateWindow({
   Name = "JORDAN'S MENU | V26 MASTER",
   LoadingTitle = "Checking Session Status...",
   LoadingSubtitle = "Key System: Active",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false 
})

-- [[ 1. THE LOCK / LOGOUT ENGINE ]]
local function LockMenu(reason)
    if isfile(ConfigName) then delfile(ConfigName) end
    if getgenv().JordanFOV then getgenv().JordanFOV:Remove() end
    Rayfield:Notify({Title = "Menu Locked", Content = reason or "Session expired.", Duration = 10})
    task.wait(1)
    Rayfield:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourdad69bihj/sdfsdfsdfsdfsdfsdfsdf/main/Main.lua"))()
end

-- [[ 2. THE MODS (UNLOCKED AFTER KEY) ]]
local function UnlockMods()
    pcall(function() Window:GetTab("Key System"):Destroy() end)

    local CombatTab = Window:CreateTab("Combat", 4483362458)
    local VisualsTab = Window:CreateTab("Visuals", 4483362458)
    local PlayerTab = Window:CreateTab("Movement", 4483362458)
    local SettingsTab = Window:CreateTab("Settings", 4483362458)

    CombatTab:CreateSection("Rage Aimbot")
    CombatTab:CreateToggle({ Name = "Sticky Aimbot (Right Click)", CurrentValue = false, Callback = function(v) MenuSettings.Aimbot = v end })
    CombatTab:CreateToggle({ Name = "Show FOV Circle", CurrentValue = false, Callback = function(v) MenuSettings.ShowFOV = v end })
    CombatTab:CreateSlider({ Name = "FOV Size", Range = {50, 800}, Increment = 10, CurrentValue = 150, Callback = function(v) MenuSettings.FOV = v end })

    VisualsTab:CreateToggle({ Name = "Player Highlights", CurrentValue = false, Callback = function(v) MenuSettings.ESP = v end })

    PlayerTab:CreateToggle({ Name = "WASD Fly", CurrentValue = false, Callback = function(v) MenuSettings.Fly = v end })
    PlayerTab:CreateSlider({ Name = "Fly Speed", Range = {10, 500}, Increment = 5, CurrentValue = 50, Callback = function(v) MenuSettings.FlySpeed = v end })
    PlayerTab:CreateSlider({ Name = "WalkSpeed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v) MenuSettings.WalkSpeed = v end })
    PlayerTab:CreateToggle({ Name = "Noclip", CurrentValue = false, Callback = function(v) MenuSettings.Noclip = v end })

    SettingsTab:CreateSection("Session Control")
    SettingsTab:CreateButton({ Name = "LOGOUT", Callback = function() LockMenu("Logged out manually.") end })

    task.spawn(function()
        while task.wait(5) do
            if isfile(ConfigName) then
                local savedTime = tonumber(readfile(ConfigName))
                if os.time() - savedTime >= ExpirationTime then
                    LockMenu("Your 5-minute session has ended.")
                    break
                end
            end
        end
    end)
    
    Rayfield:Notify({Title = "Authenticated", Content = "Key verified! Session active for 5 minutes.", Duration = 5})
end

-- [[ 3. THE KEY SYSTEM TAB ]]
local function ShowKeySystem()
    local KeyTab = Window:CreateTab("Key System", 4483362458)
    KeyTab:CreateSection("Authentication Required")
    KeyTab:CreateButton({ 
        Name = "Get New Unique Key", 
        Callback = function() 
            local seed = math.random(1000, 9999)
            CurrentSessionKey = "JM-" .. string.reverse(tostring(Player.UserId + seed + 67))
            setclipboard(MyWebsite .. "?id=" .. Player.UserId .. "&seed=" .. seed)
            Rayfield:Notify({Title = "Link Copied!", Content = "Paste link in browser for your unique key.", Duration = 5})
        end 
    })

    KeyTab:CreateInput({
       Name = "Enter Session Key",
       PlaceholderText = "JM-XXXXXX",
       Callback = function(Text)
          if Text == CurrentSessionKey and CurrentSessionKey ~= "" then
             writefile(ConfigName, tostring(os.time()))
             UnlockMods()
          else
             Rayfield:Notify({Title = "Error", Content = "Key incorrect or expired!", Duration = 3})
          end
       end,
    })
end

-- [[ 4. BOOT CHECK ]]
if isfile(ConfigName) then
    local savedTime = tonumber(readfile(ConfigName))
    if os.time() - savedTime < ExpirationTime then
        UnlockMods()
    else
        ShowKeySystem()
    end
else
    ShowKeySystem()
end

-- [[ 5. ENGINE LOOPS ]]
RunService.RenderStepped:Connect(function()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    local cam = workspace.CurrentCamera

    -- FIXED FOV CIRCLE LOGIC
    if FOVCircle then
        FOVCircle.Visible = MenuSettings.ShowFOV
        FOVCircle.Radius = MenuSettings.FOV
        -- Corrects the circle position to match the mouse tip perfectly
        local mousePos = UserInputService:GetMouseLocation()
        FOVCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
    end

    -- Aimbot Logic
    if MenuSettings.Aimbot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target, maxDist = nil, MenuSettings.FOV
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= Player and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health > 0 then
                local pos, onScreen = cam:WorldToViewportPoint(v.Character.Head.Position)
                local dist = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                if onScreen and dist < maxDist then 
                    maxDist = dist 
                    target = v.Character.Head 
                end
            end
        end
        if target then 
            cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, target.Position), MenuSettings.Smoothing) 
        end
    end

    -- Movement (Fly, Speed, Noclip)
    if hum then hum.WalkSpeed = MenuSettings.WalkSpeed end
    if hrp and hum and MenuSettings.Fly then
        local bv = hrp:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity", hrp)
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1,1,1) * 9e9
        hum.PlatformStand = true
        local dir = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end
        bv.Velocity = dir * MenuSettings.FlySpeed
    elseif hrp and hrp:FindFirstChild("FlyVelocity") then
        hrp.FlyVelocity:Destroy()
        hum.PlatformStand = false
    end
    
    -- Visuals (ESP)
    if MenuSettings.ESP then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= Player and p.Character then
                local h = p.Character:FindFirstChild("JordanESP") or Instance.new("Highlight", p.Character)
                h.Name = "JordanESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
                h.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end
end)