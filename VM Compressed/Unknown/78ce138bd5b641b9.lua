if not game:IsLoaded() then game.Loaded:Wait() end
task.wait()
local g = getgenv()
if not g.GlobalEnvironmentFramework_Initialized then
   loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Backup_Repo/refs/heads/main/Global_Environment.lua"))()
   wait(0.1)
   g.GlobalEnvironmentFramework_Initialized = true
end
task.wait(0.5)
local player = g.LocalPlayer or game.Players.LocalPlayer
local ps = player:FindFirstChildOfClass("PlayerScripts")
local sps = g.StarterPlayer:FindFirstChild("StarterPlayerScripts")
g.Tower_Of_Hell_WorkAround_Loaded = g.Tower_Of_Hell_WorkAround_Loaded or false
local FlamesLibrary = getgenv().FlamesLibrary

if not g.Tower_Of_Hell_WorkAround_Loaded then
    if hookfunction and hookmetamethod then
        hookfunction(player.Kick, function() end)
        hookfunction(player.kick, function() end)

        local oldnc
        oldnc = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if (method == "Kick" or method == "kick") and self == player then
                return
            end
            if self.Name == "kickUser" and method == "FireServer" then
                return
            end
            return oldnc(self, ...)
        end)

        local function destroy_anti(s)
            if s.Name == "LocalScript" or s.Name == "LocalScript2" then
                s.Disabled = true
                s:Destroy()
            end
        end

        for _, s in pairs(ps:GetChildren()) do destroy_anti(s) end
        for _, s in pairs(sps:GetChildren()) do destroy_anti(s) end
        FlamesLibrary.connect("anti_recreate_ps", ps.ChildAdded:Connect(destroy_anti))
        FlamesLibrary.connect("anti_recreate_sps", sps.ChildAdded:Connect(destroy_anti))
        local remote = game.ReplicatedStorage.Remotes.Moderation.kickUser
        hookfunction(remote.FireServer, function() end)
        g.Tower_Of_Hell_WorkAround_Loaded = true
        if g.notify then g.notify("Success", "Flames Hub has bypassed Tower Of Hell's anti-cheat for you!", 15) end
    else
        if g.notify then
            return g.notify("Error", "You cannot load this script | Unsupported Executor.", 15)
        else
            return warn("Error | Unsupported executor, you cannot run this script.")
        end
    end
end

local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Backup_Repo/refs/heads/main/Nebula.lua", true))()
local Window = Luna:CreateWindow({
    Name = "Flames Hub | Tower Of Hell",
    Subtitle = "Welcome to: Flames Hub | Tower Of Hell!",
    LogoID = "0",
    LoadingEnabled = true,
    LoadingTitle = "Flames Hub | Presents",
    LoadingSubtitle = "by Flames Hub.",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Big Hub"
    },

    KeySystem = false,
    KeySettings = {
        Title = "Flames Hub | Key System",
        Subtitle = "",
        Note = "Welcome to Flames Hub | Tower Of Hell!",
        SaveInRoot = false,
        SaveKey = true,
        Key = {"Example Key"},
        SecondAction = {
            Enabled = false,
            Type = "Link",
            Parameter = ""
        }
    }
})
wait(0.25)
local function find_value(cache_key, parent, class_name, search_terms)
    if not cache_key or not parent then return nil end
    local cache = getgenv()[cache_key]
    if cache and cache.Parent and cache:IsA(class_name) then return cache end

    for _, v in ipairs(parent:GetDescendants()) do
        if v:IsA(class_name) then
            local name_lower = v.Name:lower()
            local match = true

            for _, term in ipairs(search_terms) do
                if not name_lower:find(term:lower()) then
                    match = false
                    break
                end
            end

            if match then
                getgenv()[cache_key] = v
                return v
            end
        end
    end

    return nil
end

local function find_value_via_children(cache_key, parent, class_name, search_terms)
    if not cache_key or not parent then return nil end
    local cache = getgenv()[cache_key]
    if cache and cache.Parent and cache:IsA(class_name) then return cache end

    for _, v in ipairs(parent:GetChildren()) do
        if v:IsA(class_name) then
            local name_lower = v.Name:lower()
            local match = true

            for _, term in ipairs(search_terms) do
                if not name_lower:find(term:lower()) then
                    match = false
                    break
                end
            end

            if match then
                getgenv()[cache_key] = v
                return v
            end
        end
    end

    return nil
end
wait(0.25)
local r_s = getgenv().ReplicatedStorage or cloneref and cloneref(game:GetService("ReplicatedStorage")) or game:GetService("ReplicatedStorage")
local global_speed_val = getgenv().global_speed_cached_value_obj or find_value("global_speed_cached_value_obj", r_s, "NumberValue", {"global", "speed"})
local killbricks_toggle_val = getgenv().cached_killbricks_disabled or find_value("cached_killbricks_disabled",r_s,"BoolValue",{"killbricks","disabled"})
local last_winner_obj_val = getgenv().cached_last_winner or find_value("cached_last_winner",r_s,"ObjectValue",{"last","winner"})
local global_jumps_int_val = getgenv().cached_global_jumps or find_value("cached_global_jumps",r_s,"IntValue",{"global","jumps"})
local plr_data_folder_all = getgenv().all_plrs_data_folder or find_value_via_children("all_plrs_data_folder",r_s,"Folder",{"data"})
local localplayers_data_folder = getgenv().found_localplayer_stats_data_folder  or find_value_via_children("found_localplayer_stats_data_folder", plr_data_folder_all, "Folder", {tostring(game.Players.LocalPlayer.UserId)})
local human = getgenv().Humanoid or getgenv().Character and getgenv().Character:FindFirstChildOfClass("Humanoid") or get_human(LocalPlayer, 5)
local Mutators_Tab = Window:CreateTab({Name = "🕷️ Mutators 🕷️", Icon = "view_in_ar", ImageSource = "Material", ShowTitle = true})
local Mutators_Section = Mutators_Tab:CreateSection("Section | Mutators Page")
local LocalPlayer_Tab = Window:CreateTab({Name = "👤 LocalPlayer 👤", Icon = "view_in_ar", ImageSource = "Material", ShowTitle = true})
local LocalPlayer_Section = LocalPlayer_Tab:CreateSection("Section | LocalPlayer Page")
local Player_Data_Tab = Window:CreateTab({Name = "💻 Information 💻", Icon = "view_in_ar", ImageSource = "Material", ShowTitle = true})
local Player_Data_Section = Player_Data_Tab:CreateSection("Section | Information Page")
local DEFAULT_FOG_END = 1200
local DEFAULT_FOG_COLOR = Color3.new(0.5, 0.5, 0.5)
local DEFAULT_NEGATIVE_ENABLED = false
local DEFAULT_NEGATIVE_SATURATION = 0
getgenv().fog_protection = getgenv().fog_protection ~= nil and getgenv().fog_protection or false
getgenv().anti_negative_mutator = getgenv().anti_negative_mutator ~= nil and getgenv().anti_negative_mutator or false
getgenv().un_invisible_mutator_self = function()
    local self_char = getgenv().Character or getgenv().LocalPlayer.Character

    for _, v in ipairs(self_char:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Name ~= "hitbox" then
            v.Transparency = 0
        end
    end

    local head = self_char:FindFirstChild("Head")
    if head then
        local face = head:FindFirstChild("face")
        if face then
            pcall(function() face.Transparency = 0 end)
        end
    end

    for _, v in ipairs(self_char:GetDescendants()) do
        if v:IsA("Accessory") then
            local part = v:FindFirstChildWhichIsA("BasePart")
            if part then
                pcall(function() part.Transparency = 0 end)
            end
        end
    end
end

-- [[ Anti Fog ]] --
FlamesLibrary.connect("fogend_changed", game.Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
    if getgenv().fog_protection then
        game.Lighting.FogEnd = DEFAULT_FOG_END
        game.Lighting.FogColor = DEFAULT_FOG_COLOR
    end
end))

FlamesLibrary.connect("fogcolor_changed", game.Lighting:GetPropertyChangedSignal("FogColor"):Connect(function()
    if getgenv().fog_protection then
        game.Lighting.FogEnd = DEFAULT_FOG_END
        game.Lighting.FogColor = DEFAULT_FOG_COLOR
    end
end))
-- [[ ]] --

-- [[ Anti Negative ]] --
FlamesLibrary.connect("negative_enabled_changed", game.Lighting.Negative:GetPropertyChangedSignal("Enabled"):Connect(function()
    if getgenv().anti_negative_mutator then
        game.Lighting.Negative.Enabled = DEFAULT_NEGATIVE_ENABLED
        game.Lighting.Negative.Saturation = DEFAULT_NEGATIVE_SATURATION
    end
end))

FlamesLibrary.connect("negative_saturation_changed", game.Lighting.Negative:GetPropertyChangedSignal("Saturation"):Connect(function()
    if getgenv().anti_negative_mutator then
        game.Lighting.Negative.Enabled = DEFAULT_NEGATIVE_ENABLED
        game.Lighting.Negative.Saturation = DEFAULT_NEGATIVE_SATURATION
    end
end))
-- [[ ]] --

-- [[ Anti Invisible ]] --
getgenv().anti_invisible_mutator = getgenv().anti_invisible_mutator ~= nil and getgenv().anti_invisible_mutator or false

local function setup_anti_invisible()
    local self_char = getgenv().Character or getgenv().LocalPlayer.Character
    if not self_char then return end

    for _, v in ipairs(self_char:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Name ~= "hitbox" then
            local part_name = v.Name
            FlamesLibrary.connect("anti_invis_" .. part_name, v:GetPropertyChangedSignal("Transparency"):Connect(function()
                if getgenv().anti_invisible_mutator and v.Transparency ~= 0 then
                    v.Transparency = 0
                    pcall(function() getgenv().Character:FindFirstChild("invisible").Value = false end)
                end
            end))
        end

        if v:IsA("Accessory") then
            local part = v:FindFirstChildWhichIsA("BasePart")
            if part then
                FlamesLibrary.connect("anti_invis_acc_" .. v.Name, part:GetPropertyChangedSignal("Transparency"):Connect(function()
                    if getgenv().anti_invisible_mutator and part.Transparency ~= 0 then
                        part.Transparency = 0
                        pcall(function() getgenv().Character:FindFirstChild("invisible").Value = false end)
                    end
                end))
            end
        end
    end

    local head = self_char:FindFirstChild("Head") or get_head(LocalPlayer, 5)
    if head then
        local face = head:FindFirstChild("face")
        if face then
            FlamesLibrary.connect("anti_invis_face", face:GetPropertyChangedSignal("Transparency"):Connect(function()
                if getgenv().anti_invisible_mutator and face.Transparency ~= 0 then
                    face.Transparency = 0
                    pcall(function() getgenv().Character:FindFirstChild("invisible").Value = false end)
                end
            end))
        end
    end

    pcall(function() getgenv().Character:FindFirstChild("invisible").Value = false end)
end

setup_anti_invisible()
FlamesLibrary.connect("anti_invis_char", getgenv().LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.35)
    setup_anti_invisible()
end))
-- [[ ]] --

-- [[ Fly Functionality ]] --
getgenv().flying = getgenv().flying or false
getgenv().qe_fly = getgenv().qe_fly or true
getgenv().ify_fly_speed = getgenv().ify_fly_speed or 1
getgenv().vehicle_fly_speed = getgenv().vehicle_fly_speed or 1
local fl = getgenv().FlamesLibrary
local players = getgenv().Players
local run_service = getgenv().RunService
local user_input_service = getgenv().UserInputService
local lp = players.LocalPlayer
local function get_lp_char() return getgenv().Character or lp.Character end
local function get_root() local char = get_lp_char() return char and char:FindFirstChild("HumanoidRootPart") end
local function get_humanoid() local char = get_lp_char() return char and char:FindFirstChildOfClass("Humanoid") end
local is_mobile = user_input_service.TouchEnabled and not user_input_service.KeyboardEnabled
local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
local SPEED = 0
local control_module = nil
pcall(function() control_module = require(lp.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")) end)
local fly_bv_name = "FlamesFlyBV"
local fly_bg_name = "FlamesFlyBG"
getgenv().enable_fly = function(vfly)
    local root = get_root()
    local hum = get_humanoid()
    if not root or not hum then return end
    local cam = workspace.CurrentCamera
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)
    local bg = Instance.new("BodyGyro")
    bg.Name = fly_bg_name
    bg.P = 9e4
    bg.MaxTorque = v3inf
    bg.CFrame = root.CFrame
    bg.Parent = root

    local bv = Instance.new("BodyVelocity")
    bv.Name = fly_bv_name
    bv.Velocity = v3zero
    bv.MaxForce = v3inf
    bv.Parent = root
    getgenv().flying = true
    fl.connect("fly_noclip", run_service.Stepped:Connect(function()
        local char = get_lp_char()
        if not char then return end
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end))

    if is_mobile then
        fl.connect("fly_render", run_service.RenderStepped:Connect(function()
            local root2 = get_root()
            local hum2 = get_humanoid()
            if not root2 or not hum2 then return end
            local bv2 = root2:FindFirstChild(fly_bv_name)
            local bg2 = root2:FindFirstChild(fly_bg_name)
            if not bv2 or not bg2 then return end
            local speed = vfly and getgenv().vehicle_fly_speed or getgenv().ify_fly_speed
            bv2.MaxForce = v3inf
            bg2.MaxTorque = v3inf
            if not vfly then hum2.PlatformStand = true end
            bg2.CFrame = cam.CoordinateFrame
            bv2.Velocity = v3zero

            if control_module then
                local direction = control_module:GetMoveVector()
                if direction.X > 0 then
                    bv2.Velocity = bv2.Velocity + cam.CFrame.RightVector * (direction.X * (speed * 50))
                end
                if direction.X < 0 then
                    bv2.Velocity = bv2.Velocity + cam.CFrame.RightVector * (direction.X * (speed * 50))
                end
                if direction.Z > 0 then
                    bv2.Velocity = bv2.Velocity - cam.CFrame.LookVector * (direction.Z * (speed * 50))
                end
                if direction.Z < 0 then
                    bv2.Velocity = bv2.Velocity - cam.CFrame.LookVector * (direction.Z * (speed * 50))
                end
            end
        end))
    else
        fl.connect("fly_input_began", user_input_service.InputBegan:Connect(function(input, processed)
            if processed then return end
            local speed = vfly and getgenv().vehicle_fly_speed or getgenv().ify_fly_speed
            if input.KeyCode == Enum.KeyCode.W then CONTROL.F = speed
            elseif input.KeyCode == Enum.KeyCode.S then CONTROL.B = -speed
            elseif input.KeyCode == Enum.KeyCode.A then CONTROL.L = -speed
            elseif input.KeyCode == Enum.KeyCode.D then CONTROL.R = speed
            elseif input.KeyCode == Enum.KeyCode.E and getgenv().qe_fly then CONTROL.Q = speed * 2
            elseif input.KeyCode == Enum.KeyCode.Q and getgenv().qe_fly then CONTROL.E = -(speed * 2)
            end
            pcall(function() cam.CameraType = Enum.CameraType.Track end)
        end))

        fl.connect("fly_input_ended", user_input_service.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 0
            elseif input.KeyCode == Enum.KeyCode.S then CONTROL.B = 0
            elseif input.KeyCode == Enum.KeyCode.A then CONTROL.L = 0
            elseif input.KeyCode == Enum.KeyCode.D then CONTROL.R = 0
            elseif input.KeyCode == Enum.KeyCode.E then CONTROL.Q = 0
            elseif input.KeyCode == Enum.KeyCode.Q then CONTROL.E = 0
            end
        end))

        fl.connect("fly_render", run_service.RenderStepped:Connect(function()
            local root2 = get_root()
            local hum2 = get_humanoid()
            if not root2 or not hum2 then return end
            local bv2 = root2:FindFirstChild(fly_bv_name)
            local bg2 = root2:FindFirstChild(fly_bg_name)
            if not bv2 or not bg2 then return end
            local moving = (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0

            if moving then
                SPEED = 50
            elseif not moving and SPEED ~= 0 then
                SPEED = 0
            end

            if not vfly then hum2.PlatformStand = true end
            if moving then
                bv2.Velocity = ((cam.CFrame.LookVector * (CONTROL.F + CONTROL.B))
                    + ((cam.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).Position) - cam.CFrame.Position)) * SPEED
                lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R, Q = CONTROL.Q, E = CONTROL.E}
            elseif not moving and SPEED ~= 0 then
                bv2.Velocity = ((cam.CFrame.LookVector * (lCONTROL.F + lCONTROL.B))
                    + ((cam.CFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).Position) - cam.CFrame.Position)) * SPEED
            else
                bv2.Velocity = v3zero
            end

            bg2.CFrame = cam.CFrame
        end))
    end
end

getgenv().disable_fly = function()
    fl.disconnect("fly_render")
    fl.disconnect("fly_input_began")
    fl.disconnect("fly_input_ended")
    fl.disconnect("fly_noclip")
    getgenv().flying = false
    CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    SPEED = 0

    local root = get_root()
    if root then
        local bg = root:FindFirstChild(fly_bg_name)
        local bv = root:FindFirstChild(fly_bv_name)
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
    end
    local hum = get_humanoid()
    if hum then hum.PlatformStand = false end

    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

getgenv().watch_death_fly = function(char)
    local hum = char:WaitForChild("Humanoid")
    fl.connect("fly_death", hum.Died:Connect(function()
        getgenv().disable_fly()
        getgenv().flying = false
    end))
end

fl.connect("fly_char", lp.CharacterAdded:Connect(function(char)
    if getgenv().flying then
        getgenv().disable_fly()
    end
    getgenv().watch_death_fly(char)
    wait(0.1)
    if getgenv().Smooth_Fly_Toggle then getgenv().Smooth_Fly_Toggle:Set({CurrentValue = false}) end
end))

if lp.Character then getgenv().watch_death_fly(lp.Character) end

getgenv().toggle_fly = function(state, vfly)
    if state ~= nil then
        getgenv().flying = state
    else
        getgenv().flying = not getgenv().flying
    end

    if getgenv().flying then
        getgenv().enable_fly(vfly)
    else
        getgenv().disable_fly()
    end
end

getgenv().set_fly_speed = function(speed, vehicle)
    if type(speed) ~= "number" or speed <= 0 then return end
    if vehicle then
        getgenv().vehicle_fly_speed = speed
    else
        getgenv().ify_fly_speed = speed
    end
end

getgenv().god_mode_actual_toggle_func = function(switched)
    if switched == true then
        killbricks_toggle_val.Value = true
        task.spawn(function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name:lower():find("kill") then
                    pcall(function() v:Destroy() end)
                end
            end
        end)
    elseif switched == false then
        killbricks_toggle_val.Value = false
    else
        return 
    end
end

getgenv().Speed_Toggle = getgenv().Speed_Toggle or false
getgenv().Set_Player_Speed = LocalPlayer_Tab:CreateSlider({
Name = "Set Speed (WS)",
Range = {16, 250},
Increment = 1,
CurrentValue = getgenv().Set_Player_Speed and getgenv().Set_Player_Speed.CurrentValue or tonumber(global_speed_val.Value) or 16,
Callback = function(new_walkspeed)
    if getgenv().Speed_Toggle then
        global_speed_val.Value = new_walkspeed
    end
end}, "Global_WalkSpeed_Slider_Value")
wait(0.1)
getgenv().Custom_WalkSpeed_Toggle = LocalPlayer_Tab:CreateToggle({
Name = "Toggle Custom Speed",
Description = "Enables custom walkspeed.",
CurrentValue = getgenv().Speed_Toggle or false,
Callback = function(enabled)
    getgenv().Speed_Toggle = enabled
    if enabled then
        global_speed_val.Value = getgenv().Set_Player_Speed.CurrentValue
    else
        global_speed_val.Value = 16
    end
end}, "Speed_Toggled_Value")

if getgenv().Speed_Toggle then
    global_speed_val.Value = getgenv().Set_Player_Speed.CurrentValue
else
    global_speed_val.Value = 16
end

getgenv().God_Mode_Main_Toggle = LocalPlayer_Tab:CreateToggle({
Name = "God Mode",
Description = "Basically Godmode",
CurrentValue = killbricks_toggle_val.Value or false,
Callback = function(new_bool_flag)
    getgenv().god_mode_actual_toggle_func(new_bool_flag)
end}, "KillBricks_Toggled_Value")

getgenv().Infinite_Jumps_Toggle = LocalPlayer_Tab:CreateToggle({
Name = "Infinite Jump",
Description = "Sets infinite jump, letting you jump infinitely.",
CurrentValue = getgenv().infinite_jump_bypass_enabled or false,
Callback = function(inf_jump_main_toggled)
    if inf_jump_main_toggled then
        getgenv().infinite_jump_bypass_enabled = true
        global_jumps_int_val.Value = 9999999999
    else
        getgenv().infinite_jump_bypass_enabled = false
        global_jumps_int_val.Value = 0
    end
end}, "Infinite_Jumps_Toggle")

getgenv().Anti_Fog_Mutator_Toggle = Mutators_Tab:CreateToggle({
Name = "Anti Fog (mutator)",
Description = "Sets Anti Fog, making you immune from the Fog mutator.",
CurrentValue = getgenv().fog_protection or false,
Callback = function(anti_fog_enabled)
    if anti_fog_enabled then
        getgenv().fog_protection = true
        getgenv().notify("Success", "Anti Fog is now enabled.", 1)
    else
        getgenv().fog_protection = false
        getgenv().notify("Success", "Anti Fog is now disabled.", 1)
    end
end}, "Anti_Fog_Mutator_Toggle")

getgenv().Anti_Negative_Mutator_Toggle = Mutators_Tab:CreateToggle({
Name = "Anti Negative (mutator)",
Description = "Sets Anti Negative, which makes you immune from the Negative mutator.",
CurrentValue = getgenv().anti_negative_mutator or false,
Callback = function(anti_negative_enabled)
    if anti_negative_enabled then
        getgenv().anti_negative_mutator = true
        getgenv().notify("Success", "Anti Negative is now enabled.", 1)
    else
        getgenv().anti_negative_mutator = false
        getgenv().notify("Success", "Anti Negative is now disabled.", 1)
    end
end}, "AntiNegativeMutator_Toggle_Flag")

getgenv().Anti_Invisible_Mutator_Toggle = Mutators_Tab:CreateToggle({
Name = "Anti Invisible (yourself, mutator)",
Description = "Makes you immune from Invisible, but only makes yourself visible.",
CurrentValue = getgenv().anti_invisible_mutator or false,
Callback = function(anti_self_invisible_enabled)
    if anti_self_invisible_enabled then
        getgenv().anti_invisible_mutator = true
        getgenv().notify("Success", "Anti Invisible is now enabled.", 1.5)
    else
        getgenv().anti_invisible_mutator = false
        getgenv().notify("Success", "Anti Invisible is now disabled.", 1.5)
    end
end}, "AntiInvisibleMutator_Toggle")

getgenv().Smooth_Fly_Toggle = LocalPlayer_Tab:CreateToggle({
Name = "Fly",
Description = "Enables Fly, which is a smooth CFrame fly.",
CurrentValue = getgenv().flying or false,
Callback = function(fly_enabled)
    getgenv().toggle_fly(fly_enabled)
end}, "Fly_Toggled_Flag")

getgenv().Set_Fly_Speed = LocalPlayer_Tab:CreateSlider({
Name = "Set Fly Speed",
Range = {1, 100},
Increment = 1,
CurrentValue = getgenv().ify_fly_speed or 1,
Callback = function(new_fly_speed)
    getgenv().set_fly_speed(new_fly_speed)
end}, "Fly_Speed_Slider_Value")

local function create_label_ui(name, tab, text)
    tab = tab or Player_Data_Tab
    if not tab or not name then return end
    getgenv()[name] = tab:CreateLabel({
        Text = tostring(text),
        Style = 1
    })
end

local function init_player_data_labels()
    local data = localplayers_data_folder or getgenv().found_localplayer_stats_data_folder
    if not data then return false end
    create_label_ui("coins_label", Player_Data_Tab, "Coins: " .. tostring(data:FindFirstChild("coins") and data:FindFirstChild("coins").Value or "N/A"))
    create_label_ui("coinmultiplier_label", Player_Data_Tab, "Coin Multiplier: " .. tostring(data:FindFirstChild("coinMultiplier") and data:FindFirstChild("coinMultiplier").Value or "N/A"))
    create_label_ui("xp_label", Player_Data_Tab, "XP: " .. tostring(data:FindFirstChild("xp") and data:FindFirstChild("xp").Value or "N/A"))

    FlamesLibrary.connect("coins_changed", data:FindFirstChild("coins").Changed:Connect(function()
        local v = data:FindFirstChild("coins")
        if v and getgenv().coins_label then
            getgenv().coins_label:Set("Coins: " .. tostring(v.Value))
        end
    end))

    FlamesLibrary.connect("coinmultiplier_changed", data:FindFirstChild("coinMultiplier").Changed:Connect(function()
        local v = data:FindFirstChild("coinMultiplier")
        if v and getgenv().coinmultiplier_label then
            getgenv().coinmultiplier_label:Set("Coin Multiplier: " .. tostring(v.Value))
        end
    end))

    FlamesLibrary.connect("xp_changed", data:FindFirstChild("xp").Changed:Connect(function()
        local v = data:FindFirstChild("xp")
        if v and getgenv().xp_label then
            getgenv().xp_label:Set("XP: " .. tostring(v.Value))
        end
    end))

    return true
end

FlamesLibrary.spawn("init_labels_retry", "spawn", function()
    local attempts = 0
    repeat
        attempts += 1
        task.wait(0.5)
    until init_player_data_labels() or attempts >= 20
end)
