--[[ 
    SCRYO HUB V3.5 - RAYFIELD EDITION
    - Fitur: Specific Path Reload (lee, web, cow, spring, flare)
    - Added: Direct Flare Path in SmartReload Logic
    - Added: Clean Dirt Button in Extra Tab & Screen UI
    - Fix: Precise Crosshair & Universal Fallback
    - Branding: by scryo
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- --- 1. SETUP WINDOW ---
local Window = Rayfield:CreateWindow({
   Name = "SCRYO HUB | by scryo",
   LoadingTitle = "Wait a second...",
   LoadingSubtitle = "Preparing your tactical advantage",
   ConfigurationSaving = {Enabled = false},
   KeySystem = false
})

-- --- 2. NOTIFICATION WARNING ---
Rayfield:Notify({
   Title = "WARNING",
   Content = "Warning: Use ESP only if your device is powerful enough. It may cause lag on lower-end devices.",
   Duration = 6.5,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "I Understand",
         Callback = function() print("User acknowledged lag warning.") end
      },
   },
})

-- --- 3. VARIABLES & LOGIC ---
_G.EspActive = false
local LP = game.Players.LocalPlayer
local RS = game:GetService("RunService")

-- FIXED NPC ESP
local function UpdateNPC_ESP()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("Head") and not game.Players:GetPlayerFromCharacter(obj) then
            if _G.EspActive then
                if not obj:FindFirstChild("ScryoHighlight") then
                    local h = Instance.new("Highlight")
                    h.Name = "ScryoHighlight"
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                    h.OutlineColor = Color3.fromRGB(255, 255, 255)
                    h.FillTransparency = 0.5
                    h.Parent = obj
                end
            else
                if obj:FindFirstChild("ScryoHighlight") then obj.ScryoHighlight:Destroy() end
            end
        end
    end
end

-- ACCURATE CROSSHAIR
local CrossGui = Instance.new("ScreenGui", LP.PlayerGui)
CrossGui.Name = "ScryoCrosshair"
CrossGui.ResetOnSpawn = false
CrossGui.IgnoreGuiInset = true 

local CrossLine1 = Instance.new("Frame", CrossGui)
local CrossLine2 = Instance.new("Frame", CrossGui)

local function ToggleCrosshair(state)
    CrossLine1.Visible = state; CrossLine2.Visible = state
    if state then
        CrossLine1.Size = UDim2.new(0, 2, 0, 16); CrossLine1.Position = UDim2.new(0.5, -1, 0.5, -8)
        CrossLine1.BackgroundColor3 = Color3.fromRGB(0, 255, 255); CrossLine1.BorderSizePixel = 0
        CrossLine2.Size = UDim2.new(0, 16, 0, 2); CrossLine2.Position = UDim2.new(0.5, -8, 0.5, -1)
        CrossLine2.BackgroundColor3 = Color3.fromRGB(0, 255, 255); CrossLine2.BorderSizePixel = 0
    end
end

-- SMART MULTI-RELOAD LOGIC (UPDATED WITH FLARE)
local function SmartReload()
    local char = LP.Character
    if not char then return end
    
    -- 1. KHUSUS FLARE (Direct Path)
    local flare = char:FindFirstChild("flare")
    if flare then
        pcall(function()
            flare.Handle.wood.promptload.prompt.RemoteEvent:FireServer()
        end)
    end

    -- 2. SENJATA STANDAR (lee, web, cow, spring)
    local weaponList = {"lee", "web", "cow", "spring"}
    for _, name in pairs(weaponList) do
        local weapon = char:FindFirstChild(name)
        if weapon then
            pcall(function()
                weapon.Handle.wood.promptload.prompt.RemoteEvent:FireServer()
            end)
        end
    end
    
    -- 3. UNIVERSAL FALLBACK
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            local autoRemote = tool:FindFirstChild("RemoteEvent", true)
            if autoRemote and (autoRemote.Parent.Name == "prompt") then
                autoRemote:FireServer()
            end
        end
    end
    return true
end

RS.RenderStepped:Connect(function() if _G.EspActive then UpdateNPC_ESP() end end)

-- --- 4. TABS ---
local VisualTab = Window:CreateTab("Visuals", 4483362458)
local ClassTab = Window:CreateTab("Classes", 4483362458)
local ExtraTab = Window:CreateTab("Extra", 4483362458)

VisualTab:CreateToggle({
   Name = "NPC Enemy ESP",
   CurrentValue = false,
   Callback = function(Value) _G.EspActive = Value end,
})

VisualTab:CreateToggle({
   Name = "Center Crosshair (Accurate)",
   CurrentValue = false,
   Callback = function(Value) ToggleCrosshair(Value) end,
})

-- CLASSES
local function FireClass(c1, c2)
    local args = {[1] = c1, [2] = c2}
    game:GetService("ReplicatedStorage").RemoteEvents.Player.ChooseClass:FireServer(unpack(args))
    Rayfield:Notify({Title = "Class Changed", Content = "Check your backpack!", Duration = 3})
end

ClassTab:CreateButton({Name = "Sharpshooter", Callback = function() FireClass("sharpshooter", "sharpshooter") end})
ClassTab:CreateButton({Name = "Engineer", Callback = function() FireClass("engi", "engineer") end})
ClassTab:CreateButton({Name = "Automatic", Callback = function() FireClass("auto", "automatic") end})
ClassTab:CreateButton({Name = "Medic", Callback = function() FireClass("medic", "medic") end})
ClassTab:CreateButton({Name = "Officer", Callback = function() FireClass("officer", "officer") end})
ClassTab:CreateButton({Name = "Artillery", Callback = function() FireClass("arty", "artillery") end})
ClassTab:CreateButton({Name = "Rifleman", Callback = function() FireClass("rifle", "rifleman") end})

-- EXTRA
ExtraTab:CreateButton({
   Name = "instant reload",
   Callback = function()
       if LP.PlayerGui:FindFirstChild("ScryoReloadGui") then return end
       local ReloadGui = Instance.new("ScreenGui", LP.PlayerGui); ReloadGui.Name = "ScryoReloadGui"; ReloadGui.ResetOnSpawn = false
       local ReloadBtn = Instance.new("TextButton", ReloadGui)
       ReloadBtn.Size = UDim2.new(0, 70, 0, 70); ReloadBtn.Position = UDim2.new(0.02, 0, 0.15, 0)
       ReloadBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); ReloadBtn.Text = "RELOAD"
       ReloadBtn.TextColor3 = Color3.new(1, 1, 1); ReloadBtn.Font = "SourceSansBold"; ReloadBtn.TextSize = 12
       Instance.new("UICorner", ReloadBtn).CornerRadius = UDim.new(1, 0)
       local Stroke = Instance.new("UIStroke", ReloadBtn); Stroke.Thickness = 2
       task.spawn(function() while task.wait() do Stroke.Color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1) end end)

       ReloadBtn.MouseButton1Click:Connect(function()
           SmartReload()
           ReloadBtn.Text = "OK!"; task.wait(0.3); ReloadBtn.Text = "RELOAD"
       end)
   end,
})

ExtraTab:CreateButton({
   Name = "clean dirt",
   Callback = function()
       if LP.PlayerGui:FindFirstChild("ScryoCleanGui") then return end
       local CleanGui = Instance.new("ScreenGui", LP.PlayerGui); CleanGui.Name = "ScryoCleanGui"; CleanGui.ResetOnSpawn = false
       local CleanBtn = Instance.new("TextButton", CleanGui)
       CleanBtn.Size = UDim2.new(0, 70, 0, 70)
       CleanBtn.Position = UDim2.new(0.02, 0, 0.3, 0) 
       CleanBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10); CleanBtn.Text = "CLEAN"
       CleanBtn.TextColor3 = Color3.new(1, 1, 1); CleanBtn.Font = "SourceSansBold"; CleanBtn.TextSize = 12
       Instance.new("UICorner", CleanBtn).CornerRadius = UDim.new(1, 0)
       local Stroke = Instance.new("UIStroke", CleanBtn); Stroke.Thickness = 2
       task.spawn(function() while task.wait() do Stroke.Color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1) end end)

       CleanBtn.MouseButton1Click:Connect(function()
           game:GetService("ReplicatedStorage").wipedirt:FireServer()
           CleanBtn.Text = "CLEANED"; task.wait(0.3); CleanBtn.Text = "CLEAN"
       end)
   end,
})

ExtraTab:CreateButton({
   Name = "Inf chees (Duplication)",
   Callback = function()
       loadstring(game:HttpGet("https://rawscripts.net/raw/whizzbang-money-s*er-duplication-92680"))()
   end,
})

Rayfield:LoadConfiguration()
