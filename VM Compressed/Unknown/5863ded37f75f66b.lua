local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- services
local plr = game:GetService("Players")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local rep = game:GetService("ReplicatedStorage")
local ws = game:GetService("Workspace")

-- vars
local lp = plr.LocalPlayer
local mouse = lp:GetMouse()
local cam = ws.CurrentCamera
local esp = {}
local active = true
local crouching = {}
local no_spread_active = false
local original_spread = {}
local aimbot_enabled = false
local is_aiming = false
local fly_enabled = false
local speed_enabled = false
local fly_speed = 50
local walk_speed = 50
local fly_connection = nil
local speed_connection = nil

-- config
local config = {
    skeleton_enabled = true,
    team_check = true,
    skeleton_color = Color3.fromRGB(0, 255, 0),
    crouch_color = Color3.fromRGB(255, 0, 0),
    skeleton_thickness = 2,
    skeleton_transparency = 1,
    crouch_detection = true,
    crouch_height_threshold = 2,
    box_enabled = true,
    box_color = Color3.fromRGB(255, 255, 255),
    box_thickness = 2,
    box_filled = false,
    box_fill_color = Color3.fromRGB(255, 255, 255),
    box_fill_transparency = 0.2,
    healthbar_enabled = true,
    healthbar_color_high = Color3.fromRGB(0, 255, 0),
    healthbar_color_low = Color3.fromRGB(255, 0, 0),
    name_enabled = true,
    name_color = Color3.fromRGB(255, 255, 255),
    name_size = 14,
    name_outline = true,
    distance_enabled = true,
    distance_color = Color3.fromRGB(200, 200, 200),
    distance_size = 12,
    tracer_enabled = false,
    tracer_color = Color3.fromRGB(255, 255, 255),
    tracer_thickness = 1,
    tracer_transparency = 1,
    tracer_from = "Bottom",
    aimbot_fov = 100,
    aimbot_smoothness = 5,
    aimbot_target_part = "Head",
    aimbot_visible_check = true,
    aimbot_fov_visible = true,
    aimbot_fov_color = Color3.fromRGB(255, 255, 255),
}

local r15_bones = {
    {"Head", "UpperTorso"},
    {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"}
}

local r6_bones = {
    {"Head", "Torso"},
    {"Torso", "Left Arm"},
    {"Torso", "Right Arm"},
    {"Torso", "Left Leg"},
    {"Torso", "Right Leg"}
}

local custom_bones = {
    {"Head", "Torso"},
    {"Torso", "Left Upper Arm"},
    {"Left Upper Arm", "Left Lower Arm"},
    {"Left Lower Arm", "Left Hand"},
    {"Torso", "Right Upper Arm"},
    {"Right Upper Arm", "Right Lower Arm"},
    {"Right Lower Arm", "Right Hand"},
    {"Torso", "Left Upper Leg"},
    {"Left Upper Leg", "Left Lower Leg"},
    {"Left Lower Leg", "Left Foot"},
    {"Torso", "Right Upper Leg"},
    {"Right Upper Leg", "Right Lower Leg"},
    {"Right Lower Leg", "Right Foot"}
}

local Window = Library:CreateWindow({
    Title = 'counterblox :p',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

Library:SetWatermarkVisibility(false)

local Tabs = {
    ESP = Window:AddTab('esp'),
    Visuals = Window:AddTab('visuals'),
    Aimbot = Window:AddTab('aimbot'),
    Weapon = Window:AddTab('weapon'),
    CFrame = Window:AddTab('cframe'),
    Keybinds = Window:AddTab('keybinds'),
    Settings = Window:AddTab('settings'),
}

-- fov circle
local fov_circle = Drawing.new("Circle")
fov_circle.Visible = false
fov_circle.Thickness = 2
fov_circle.NumSides = 64
fov_circle.Filled = false

local function w2s(pos)
    local vec, onscreen = cam:WorldToViewportPoint(pos)
    return Vector2.new(vec.X, vec.Y), onscreen
end

local function create_line()
    local line = Drawing.new("Line")
    line.Visible = false
    line.Thickness = config.skeleton_thickness
    line.Color = config.skeleton_color
    line.Transparency = config.skeleton_transparency
    return line
end

local function create_text()
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    return text
end

local function create_square()
    local square = Drawing.new("Square")
    square.Visible = false
    square.Filled = false
    return square
end

local function cl(p)
    if esp[p] then
        if esp[p].lines then
            for _, bone_data in pairs(esp[p].lines) do
                if bone_data.line then bone_data.line:Remove() end
            end
        end
        if esp[p].box then esp[p].box:Remove() end
        if esp[p].box_outline then esp[p].box_outline:Remove() end
        if esp[p].box_fill then esp[p].box_fill:Remove() end
        if esp[p].healthbar_bg then esp[p].healthbar_bg:Remove() end
        if esp[p].healthbar then esp[p].healthbar:Remove() end
        if esp[p].name then esp[p].name:Remove() end
        if esp[p].distance then esp[p].distance:Remove() end
        if esp[p].tracer then esp[p].tracer:Remove() end
        if esp[p].tracer_outline then esp[p].tracer_outline:Remove() end
        esp[p] = nil
    end
    crouching[p] = nil
end

local function rig(c)
    local h = c:FindFirstChildOfClass("Humanoid")
    if h and h.RigType == Enum.HumanoidRigType.R15 then return r15_bones end
    if c:FindFirstChild("Left Upper Arm") then return custom_bones end
    return r6_bones
end

local function make(p)
    if not p:IsA("Player") or not active then return end
    
    if config.team_check then
        if p.Team == lp.Team and p.Team ~= nil then
            cl(p)
            return
        end
    end
    
    cl(p)
    
    local c = p.Character
    if not c then return end
    
    local h = c:FindFirstChildOfClass("Humanoid")
    if not h or h.Health <= 0 then return end
    
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if config.crouch_detection then
        crouching[p] = h.HipHeight < config.crouch_height_threshold
    end
    
    local bones = rig(c)
    local lines = {}
    
    if config.skeleton_enabled then
        for _, bone in pairs(bones) do
            local part1 = c:FindFirstChild(bone[1])
            local part2 = c:FindFirstChild(bone[2])
            
            if part1 and part2 then
                local line = create_line()
                table.insert(lines, {line = line, p1 = part1, p2 = part2})
            end
        end
    end
    
    local box = config.box_enabled and create_square() or nil
    local box_outline = (config.box_enabled and config.box_thickness > 0) and create_square() or nil
    local box_fill = (config.box_enabled and config.box_filled) and create_square() or nil
    
    if box_outline then
        box_outline.Thickness = config.box_thickness + 1
        box_outline.Color = Color3.new(0, 0, 0)
    end
    
    if box_fill then
        box_fill.Filled = true
        box_fill.Color = config.box_fill_color
        box_fill.Transparency = config.box_fill_transparency
    end
    
    local healthbar_bg = config.healthbar_enabled and create_square() or nil
    local healthbar = config.healthbar_enabled and create_square() or nil
    
    if healthbar_bg then
        healthbar_bg.Filled = true
        healthbar_bg.Color = Color3.new(0, 0, 0)
        healthbar_bg.Transparency = 0.5
    end
    
    if healthbar then
        healthbar.Filled = true
    end
    
    local name_text = config.name_enabled and create_text() or nil
    if name_text then
        name_text.Size = config.name_size
        name_text.Color = config.name_color
        name_text.Outline = config.name_outline
    end
    
    local distance_text = config.distance_enabled and create_text() or nil
    if distance_text then
        distance_text.Size = config.distance_size
        distance_text.Color = config.distance_color
        distance_text.Outline = true
    end
    
    local tracer = config.tracer_enabled and create_line() or nil
    local tracer_outline = (config.tracer_enabled and config.tracer_thickness > 1) and create_line() or nil
    
    if tracer then
        tracer.Thickness = config.tracer_thickness
        tracer.Color = config.tracer_color
        tracer.Transparency = config.tracer_transparency
    end
    
    if tracer_outline then
        tracer_outline.Thickness = config.tracer_thickness + 2
        tracer_outline.Color = Color3.new(0, 0, 0)
        tracer_outline.Transparency = config.tracer_transparency * 0.5
    end
    
    esp[p] = {
        lines = lines,
        character = c,
        humanoid = h,
        box = box,
        box_outline = box_outline,
        box_fill = box_fill,
        healthbar_bg = healthbar_bg,
        healthbar = healthbar,
        name = name_text,
        distance = distance_text,
        tracer = tracer,
        tracer_outline = tracer_outline
    }
end

local function get_character_bounds(c)
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local corners = {}
    local size = hrp.Size
    local cf = hrp.CFrame
    
    local offsets = {
        Vector3.new(size.X/2, size.Y/2, size.Z/2),
        Vector3.new(-size.X/2, size.Y/2, size.Z/2),
        Vector3.new(size.X/2, -size.Y/2, size.Z/2),
        Vector3.new(-size.X/2, -size.Y/2, size.Z/2),
        Vector3.new(size.X/2, size.Y/2, -size.Z/2),
        Vector3.new(-size.X/2, size.Y/2, -size.Z/2),
        Vector3.new(size.X/2, -size.Y/2, -size.Z/2),
        Vector3.new(-size.X/2, -size.Y/2, -size.Z/2)
    }
    
    for _, offset in pairs(offsets) do
        local worldPos = cf:PointToWorldSpace(offset)
        local screenPos, onScreen = w2s(worldPos)
        if onScreen then
            table.insert(corners, screenPos)
        end
    end
    
    if #corners == 0 then return nil end
    
    local minX = math.huge
    local maxX = -math.huge
    local minY = math.huge
    local maxY = -math.huge
    
    for _, corner in pairs(corners) do
        minX = math.min(minX, corner.X)
        maxX = math.max(maxX, corner.X)
        minY = math.min(minY, corner.Y)
        maxY = math.max(maxY, corner.Y)
    end
    
    return {
        topLeft = Vector2.new(minX, minY),
        size = Vector2.new(maxX - minX, maxY - minY),
        center = Vector2.new((minX + maxX) / 2, (minY + maxY) / 2)
    }
end

local function update_esp()
    for p, data in pairs(esp) do
        local c = data.character
        local h = data.humanoid
        
        if not c or not c.Parent or not h or h.Health <= 0 then
            cl(p)
            continue
        end
        
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then 
            cl(p)
            continue 
        end
        
        if config.crouch_detection and h then
            crouching[p] = h.HipHeight < config.crouch_height_threshold
        end
        
        local is_crouching = crouching[p]
        local skeleton_color = is_crouching and config.crouch_color or config.skeleton_color
        
        if config.skeleton_enabled and data.lines then
            for _, bone_data in pairs(data.lines) do
                local line = bone_data.line
                local p1 = bone_data.p1
                local p2 = bone_data.p2
                
                if p1 and p1.Parent and p2 and p2.Parent then
                    local pos1, onscreen1 = w2s(p1.Position)
                    local pos2, onscreen2 = w2s(p2.Position)
                    
                    if onscreen1 and onscreen2 then
                        line.From = pos1
                        line.To = pos2
                        line.Color = skeleton_color
                        line.Thickness = config.skeleton_thickness
                        line.Transparency = config.skeleton_transparency
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                else
                    line.Visible = false
                end
            end
        else
            if data.lines then
                for _, bone_data in pairs(data.lines) do
                    bone_data.line.Visible = false
                end
            end
        end
        
        local bounds = get_character_bounds(c)
        if bounds then
            if config.box_enabled and data.box then
                if data.box_outline then
                    data.box_outline.Position = bounds.topLeft - Vector2.new(1, 1)
                    data.box_outline.Size = bounds.size + Vector2.new(2, 2)
                    data.box_outline.Visible = true
                end
                
                if data.box_fill then
                    data.box_fill.Position = bounds.topLeft
                    data.box_fill.Size = bounds.size
                    data.box_fill.Visible = true
                end
                
                data.box.Position = bounds.topLeft
                data.box.Size = bounds.size
                data.box.Color = config.box_color
                data.box.Thickness = config.box_thickness
                data.box.Visible = true
            else
                if data.box then data.box.Visible = false end
                if data.box_outline then data.box_outline.Visible = false end
                if data.box_fill then data.box_fill.Visible = false end
            end
            
            if config.healthbar_enabled and data.healthbar and data.healthbar_bg then
                local barWidth = 3
                local barHeight = bounds.size.Y
                local healthPercent = h.Health / h.MaxHealth
                
                data.healthbar_bg.Position = Vector2.new(bounds.topLeft.X - barWidth - 3, bounds.topLeft.Y)
                data.healthbar_bg.Size = Vector2.new(barWidth, barHeight)
                data.healthbar_bg.Visible = true
                
                local currentHeight = barHeight * healthPercent
                data.healthbar.Position = Vector2.new(bounds.topLeft.X - barWidth - 3, bounds.topLeft.Y + barHeight - currentHeight)
                data.healthbar.Size = Vector2.new(barWidth, currentHeight)
                data.healthbar.Color = config.healthbar_color_high:Lerp(config.healthbar_color_low, 1 - healthPercent)
                data.healthbar.Visible = true
            else
                if data.healthbar then data.healthbar.Visible = false end
                if data.healthbar_bg then data.healthbar_bg.Visible = false end
            end
            
            if config.name_enabled and data.name then
                data.name.Text = p.DisplayName
                data.name.Position = Vector2.new(bounds.center.X, bounds.topLeft.Y - 15)
                data.name.Color = config.name_color
                data.name.Size = config.name_size
                data.name.Visible = true
            else
                if data.name then data.name.Visible = false end
            end
            
            if config.distance_enabled and data.distance then
                local distance = (hrp.Position - cam.CFrame.Position).Magnitude
                data.distance.Text = string.format("%d studs", math.floor(distance))
                data.distance.Position = Vector2.new(bounds.center.X, bounds.topLeft.Y + bounds.size.Y + 2)
                data.distance.Color = config.distance_color
                data.distance.Size = config.distance_size
                data.distance.Visible = true
            else
                if data.distance then data.distance.Visible = false end
            end
        else
            if data.box then data.box.Visible = false end
            if data.box_outline then data.box_outline.Visible = false end
            if data.box_fill then data.box_fill.Visible = false end
            if data.healthbar then data.healthbar.Visible = false end
            if data.healthbar_bg then data.healthbar_bg.Visible = false end
            if data.name then data.name.Visible = false end
            if data.distance then data.distance.Visible = false end
        end
        
        if config.tracer_enabled and data.tracer then
            local pos, onscreen = w2s(hrp.Position)
            if onscreen then
                local fromPos
                if config.tracer_from == "Bottom" then
                    fromPos = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y)
                elseif config.tracer_from == "Middle" then
                    fromPos = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
                elseif config.tracer_from == "Top" then
                    fromPos = Vector2.new(cam.ViewportSize.X / 2, 0)
                elseif config.tracer_from == "Mouse" then
                    fromPos = Vector2.new(mouse.X, mouse.Y)
                end
                
                if data.tracer_outline then
                    data.tracer_outline.From = fromPos
                    data.tracer_outline.To = pos
                    data.tracer_outline.Visible = true
                end
                
                data.tracer.From = fromPos
                data.tracer.To = pos
                data.tracer.Color = config.tracer_color
                data.tracer.Visible = true
            else
                data.tracer.Visible = false
                if data.tracer_outline then data.tracer_outline.Visible = false end
            end
        else
            if data.tracer then data.tracer.Visible = false end
            if data.tracer_outline then data.tracer_outline.Visible = false end
        end
    end
end

local function upd()
    if not active then
        for _, p in pairs(plr:GetPlayers()) do cl(p) end
        return
    end
    for _, p in pairs(plr:GetPlayers()) do
        if p ~= lp then make(p) end
    end
end

local function get_closest_player()
    local closest = nil
    local closest_dist = config.aimbot_fov
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    
    for _, p in pairs(plr:GetPlayers()) do
        if p == lp then continue end
        if config.team_check and p.Team == lp.Team and p.Team ~= nil then continue end
        
        local c = p.Character
        if not c then continue end
        
        local h = c:FindFirstChildOfClass("Humanoid")
        if not h or h.Health <= 0 then continue end
        
        local target_part = c:FindFirstChild(config.aimbot_target_part)
        if not target_part then continue end
        
        if config.aimbot_visible_check then
            local ray = Ray.new(cam.CFrame.Position, (target_part.Position - cam.CFrame.Position).Unit * (target_part.Position - cam.CFrame.Position).Magnitude)
            local hit = ws:FindPartOnRayWithIgnoreList(ray, {lp.Character, cam})
            if hit and not hit:IsDescendantOf(c) then continue end
        end
        
        local pos, onscreen = w2s(target_part.Position)
        if not onscreen then continue end
        
        local dist = (pos - center).Magnitude
        if dist < closest_dist then
            closest_dist = dist
            closest = p
        end
    end
    
    return closest
end

local function aim_at_player(target)
    if not target or not target.Character then return end
    
    local target_part = target.Character:FindFirstChild(config.aimbot_target_part)
    if not target_part then return end
    
    local target_pos = target_part.Position
    local cam_pos = cam.CFrame.Position
    
    local direction = (target_pos - cam_pos).Unit
    local target_cf = CFrame.new(cam_pos, cam_pos + direction)
    
    local smoothness = config.aimbot_smoothness
    cam.CFrame = cam.CFrame:Lerp(target_cf, 1 / smoothness)
end

local function find_spread_values(obj)
    for _, v in ipairs(obj:GetDescendants()) do
        if v:IsA("NumberValue") then
            local name = v.Name:lower()
            if name:find("spread") or name:find("recoil") or name:find("accuracy") then
                if not original_spread[v] then
                    original_spread[v] = v.Value
                end
            end
        end
    end
end

local function apply_no_spread_all()
    for v, _ in pairs(original_spread) do
        if v and v.Parent then
            v.Value = 0
        end
    end
end

local function restore_spread_all()
    for v, original_val in pairs(original_spread) do
        if v and v.Parent then
            v.Value = original_val
        end
    end
end

local function scan_for_weapons()
    if rep then find_spread_values(rep) end
    if lp.Character then find_spread_values(lp.Character) end
    if lp.Backpack then find_spread_values(lp.Backpack) end
    
    local weapons_folder = ws:FindFirstChild("Weapons")
    if weapons_folder then find_spread_values(weapons_folder) end
end

-- CFrame Fly Function
local function toggle_fly(enabled)
    fly_enabled = enabled
    
    if fly_connection then
        fly_connection:Disconnect()
        fly_connection = nil
    end
    
    if not enabled then return end
    
    fly_connection = rs.Heartbeat:Connect(function()
        if not fly_enabled then return end
        
        local c = lp.Character
        if not c then return end
        
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local cam_cf = cam.CFrame
        local move_direction = Vector3.new(0, 0, 0)
        
        if uis:IsKeyDown(Enum.KeyCode.W) then
            move_direction = move_direction + cam_cf.LookVector
        end
        if uis:IsKeyDown(Enum.KeyCode.S) then
            move_direction = move_direction - cam_cf.LookVector
        end
        if uis:IsKeyDown(Enum.KeyCode.A) then
            move_direction = move_direction - cam_cf.RightVector
        end
        if uis:IsKeyDown(Enum.KeyCode.D) then
            move_direction = move_direction + cam_cf.RightVector
        end
        if uis:IsKeyDown(Enum.KeyCode.Space) then
            move_direction = move_direction + Vector3.new(0, 1, 0)
        end
        if uis:IsKeyDown(Enum.KeyCode.LeftShift) then
            move_direction = move_direction - Vector3.new(0, 1, 0)
        end
        
        if move_direction.Magnitude > 0 then
            move_direction = move_direction.Unit
            hrp.CFrame = hrp.CFrame + (move_direction * (fly_speed / 50))
        end
    end)
end

-- CFrame Speed Function
local function toggle_speed(enabled)
    speed_enabled = enabled
    
    if speed_connection then
        speed_connection:Disconnect()
        speed_connection = nil
    end
    
    if not enabled then return end
    
    speed_connection = rs.Heartbeat:Connect(function()
        if not speed_enabled then return end
        
        local c = lp.Character
        if not c then return end
        
        local hrp = c:FindFirstChild("HumanoidRootPart")
        local h = c:FindFirstChildOfClass("Humanoid")
        if not hrp or not h then return end
        
        if h.MoveDirection.Magnitude > 0 then
            local move_direction = h.MoveDirection
            hrp.CFrame = hrp.CFrame + (move_direction * (walk_speed / 50))
        end
    end)
end

-- ESP Tab
local ESPGroup = Tabs.ESP:AddLeftGroupbox('skeleton esp')

ESPGroup:AddToggle('ESPEnabled', {
    Text = 'enable esp',
    Default = true,
    Callback = function(Value)
        active = Value
        upd()
    end
})

ESPGroup:AddToggle('SkeletonEnabled', {
    Text = 'skeleton',
    Default = true,
    Callback = function(Value)
        config.skeleton_enabled = Value
    end
})

ESPGroup:AddToggle('TeamCheck', {
    Text = 'team check',
    Default = true,
    Callback = function(Value)
        config.team_check = Value
        upd()
    end
})

ESPGroup:AddDivider()

ESPGroup:AddSlider('SkeletonThickness', {
    Text = 'thickness',
    Default = 2,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        config.skeleton_thickness = Value
    end
})

ESPGroup:AddSlider('SkeletonTransparency', {
    Text = 'transparency',
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = true,
    Callback = function(Value)
        config.skeleton_transparency = Value
    end
})

ESPGroup:AddDivider()

ESPGroup:AddToggle('CrouchDetection', {
    Text = 'crouch detection',
    Default = true,
    Callback = function(Value)
        config.crouch_detection = Value
    end
})

ESPGroup:AddSlider('CrouchThreshold', {
    Text = 'crouch threshold',
    Default = 2,
    Min = 0.5,
    Max = 5,
    Rounding = 1,
    Compact = true,
    Callback = function(Value)
        config.crouch_height_threshold = Value
    end
})

local ESPColors = Tabs.ESP:AddRightGroupbox('colors')

ESPColors:AddLabel('skeleton color'):AddColorPicker('SkeletonColor', {
    Default = Color3.fromRGB(0, 255, 0),
    Title = 'skeleton',
    Callback = function(Value)
        config.skeleton_color = Value
    end
})

ESPColors:AddLabel('crouch color'):AddColorPicker('CrouchColor', {
    Default = Color3.fromRGB(255, 0, 0),
    Title = 'crouch',
    Callback = function(Value)
        config.crouch_color = Value
    end
})

-- Visuals Tab
local BoxGroup = Tabs.Visuals:AddLeftGroupbox('box esp')

BoxGroup:AddToggle('BoxEnabled', {
    Text = 'enable boxes',
    Default = true,
    Callback = function(Value)
        config.box_enabled = Value
    end
})

BoxGroup:AddSlider('BoxThickness', {
    Text = 'thickness',
    Default = 2,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        config.box_thickness = Value
    end
})

BoxGroup:AddToggle('BoxFilled', {
    Text = 'filled boxes',
    Default = false,
    Callback = function(Value)
        config.box_filled = Value
    end
})

BoxGroup:AddSlider('BoxFillTransparency', {
    Text = 'fill transparency',
    Default = 0.2,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = true,
    Callback = function(Value)
        config.box_fill_transparency = Value
    end
})

BoxGroup:AddLabel('box color'):AddColorPicker('BoxColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'box',
    Callback = function(Value)
        config.box_color = Value
    end
})

BoxGroup:AddLabel('fill color'):AddColorPicker('BoxFillColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'fill',
    Callback = function(Value)
        config.box_fill_color = Value
    end
})

local TextGroup = Tabs.Visuals:AddRightGroupbox('text esp')

TextGroup:AddToggle('NameEnabled', {
    Text = 'show names',
    Default = true,
    Callback = function(Value)
        config.name_enabled = Value
    end
})

TextGroup:AddSlider('NameSize', {
    Text = 'name size',
    Default = 14,
    Min = 10,
    Max = 24,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        config.name_size = Value
    end
})

TextGroup:AddLabel('name color'):AddColorPicker('NameColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'name',
    Callback = function(Value)
        config.name_color = Value
    end
})

TextGroup:AddDivider()

TextGroup:AddToggle('DistanceEnabled', {
    Text = 'show distance',
    Default = true,
    Callback = function(Value)
        config.distance_enabled = Value
    end
})

TextGroup:AddSlider('DistanceSize', {
    Text = 'distance size',
    Default = 12,
    Min = 8,
    Max = 20,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        config.distance_size = Value
    end
})

TextGroup:AddLabel('distance color'):AddColorPicker('DistanceColor', {
    Default = Color3.fromRGB(200, 200, 200),
    Title = 'distance',
    Callback = function(Value)
        config.distance_color = Value
    end
})

local HealthGroup = Tabs.Visuals:AddLeftGroupbox('health bar')

HealthGroup:AddToggle('HealthbarEnabled', {
    Text = 'show health bar',
    Default = true,
    Callback = function(Value)
        config.healthbar_enabled = Value
    end
})

HealthGroup:AddLabel('high health color'):AddColorPicker('HealthHigh', {
    Default = Color3.fromRGB(0, 255, 0),
    Title = 'high',
    Callback = function(Value)
        config.healthbar_color_high = Value
    end
})

HealthGroup:AddLabel('low health color'):AddColorPicker('HealthLow', {
    Default = Color3.fromRGB(255, 0, 0),
    Title = 'low',
    Callback = function(Value)
        config.healthbar_color_low = Value
    end
})

local TracerGroup = Tabs.Visuals:AddRightGroupbox('tracers')

TracerGroup:AddToggle('TracerEnabled', {
    Text = 'show tracers',
    Default = false,
    Callback = function(Value)
        config.tracer_enabled = Value
    end
})

TracerGroup:AddDropdown('TracerFrom', {
    Values = {'Bottom', 'Middle', 'Top', 'Mouse'},
    Default = 1,
    Multi = false,
    Text = 'tracer origin',
    Callback = function(Value)
        config.tracer_from = Value
    end
})

TracerGroup:AddSlider('TracerThickness', {
    Text = 'thickness',
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
        config.tracer_thickness = Value
    end
})

TracerGroup:AddSlider('TracerTransparency', {
    Text = 'transparency',
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = true,
    Callback = function(Value)
        config.tracer_transparency = Value
    end
})

TracerGroup:AddLabel('tracer color'):AddColorPicker('TracerColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'tracer',
    Callback = function(Value)
        config.tracer_color = Value
    end
})

-- Aimbot Tab
local AimbotGroup = Tabs.Aimbot:AddLeftGroupbox('aimbot settings')

AimbotGroup:AddToggle('AimbotEnabled', {
    Text = 'enable aimbot',
    Default = false,
    Callback = function(Value)
        aimbot_enabled = Value
    end
})

AimbotGroup:AddDivider()

AimbotGroup:AddDropdown('AimbotPart', {
    Values = {'Head', 'UpperTorso', 'HumanoidRootPart', 'LowerTorso'},
    Default = 1,
    Multi = false,
    Text = 'target part',
    Callback = function(Value)
        config.aimbot_target_part = Value
    end
})

AimbotGroup:AddSlider('AimbotFOV', {
    Text = 'fov',
    Default = 100,
    Min = 20,
    Max = 500,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        config.aimbot_fov = Value
    end
})

AimbotGroup:AddSlider('AimbotSmooth', {
    Text = 'smoothness',
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        config.aimbot_smoothness = Value
    end
})

AimbotGroup:AddToggle('AimbotVisible', {
    Text = 'visible check',
    Default = true,
    Callback = function(Value)
        config.aimbot_visible_check = Value
    end
})

local AimbotVisuals = Tabs.Aimbot:AddRightGroupbox('fov circle')

AimbotVisuals:AddToggle('FOVVisible', {
    Text = 'show fov circle',
    Default = true,
    Callback = function(Value)
        config.aimbot_fov_visible = Value
    end
})

AimbotVisuals:AddLabel('fov color'):AddColorPicker('FOVColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'fov',
    Callback = function(Value)
        config.aimbot_fov_color = Value
    end
})

-- Weapon Tab
local WeaponGroup = Tabs.Weapon:AddLeftGroupbox('no spread')

WeaponGroup:AddToggle('NoSpreadEnabled', {
    Text = 'enable no-spread',
    Default = false,
    Callback = function(Value)
        no_spread_active = Value
        if Value then
            scan_for_weapons()
            apply_no_spread_all()
        else
            restore_spread_all()
        end
    end
})

WeaponGroup:AddDivider()

WeaponGroup:AddButton({
    Text = 'reset spread values',
    Func = function()
        restore_spread_all()
    end
})

local WeaponInfo = Tabs.Weapon:AddRightGroupbox('info')
WeaponInfo:AddLabel('@scrolling on discord')

-- CFrame Tab
local FlyGroup = Tabs.CFrame:AddLeftGroupbox('cframe fly')

FlyGroup:AddToggle('FlyEnabled', {
    Text = 'enable fly',
    Default = false,
    Callback = function(Value)
        toggle_fly(Value)
    end
})

FlyGroup:AddSlider('FlySpeed', {
    Text = 'fly speed',
    Default = 50,
    Min = 10,
    Max = 200,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        fly_speed = Value
    end
})

local SpeedGroup = Tabs.CFrame:AddRightGroupbox('cframe speed')

SpeedGroup:AddToggle('SpeedEnabled', {
    Text = 'enable speed',
    Default = false,
    Callback = function(Value)
        toggle_speed(Value)
    end
})

SpeedGroup:AddSlider('WalkSpeed', {
    Text = 'walk speed',
    Default = 50,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        walk_speed = Value
    end
})

-- Keybinds Tab
local ESPKeybinds = Tabs.Keybinds:AddLeftGroupbox('esp keybinds')

ESPKeybinds:AddLabel('esp toggle'):AddKeyPicker('ESPToggleKey', {
    Default = 'None',
    Text = 'toggle esp',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.ESPEnabled:SetValue(Value)
    end
})

ESPKeybinds:AddLabel('skeleton toggle'):AddKeyPicker('SkeletonToggleKey', {
    Default = 'None',
    Text = 'toggle skeleton',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.SkeletonEnabled:SetValue(Value)
    end
})

ESPKeybinds:AddLabel('box toggle'):AddKeyPicker('BoxToggleKey', {
    Default = 'None',
    Text = 'toggle boxes',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.BoxEnabled:SetValue(Value)
    end
})

ESPKeybinds:AddLabel('tracer toggle'):AddKeyPicker('TracerToggleKey', {
    Default = 'None',
    Text = 'toggle tracers',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.TracerEnabled:SetValue(Value)
    end
})

ESPKeybinds:AddLabel('names toggle'):AddKeyPicker('NameToggleKey', {
    Default = 'None',
    Text = 'toggle names',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.NameEnabled:SetValue(Value)
    end
})

ESPKeybinds:AddLabel('distance toggle'):AddKeyPicker('DistanceToggleKey', {
    Default = 'None',
    Text = 'toggle distance',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.DistanceEnabled:SetValue(Value)
    end
})

ESPKeybinds:AddLabel('healthbar toggle'):AddKeyPicker('HealthbarToggleKey', {
    Default = 'None',
    Text = 'toggle healthbar',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.HealthbarEnabled:SetValue(Value)
    end
})

local AimbotKeybinds = Tabs.Keybinds:AddLeftGroupbox('aimbot keybinds')

AimbotKeybinds:AddLabel('aimbot toggle'):AddKeyPicker('AimbotToggleKey', {
    Default = 'None',
    Text = 'toggle aimbot',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.AimbotEnabled:SetValue(Value)
    end
})

AimbotKeybinds:AddLabel('fov circle toggle'):AddKeyPicker('FOVToggleKey', {
    Default = 'None',
    Text = 'toggle fov',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.FOVVisible:SetValue(Value)
    end
})

local WeaponKeybinds = Tabs.Keybinds:AddRightGroupbox('weapon keybinds')

WeaponKeybinds:AddLabel('no-spread toggle'):AddKeyPicker('NoSpreadToggleKey', {
    Default = 'None',
    Text = 'toggle no-spread',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.NoSpreadEnabled:SetValue(Value)
    end
})

local MovementKeybinds = Tabs.Keybinds:AddRightGroupbox('movement keybinds')

MovementKeybinds:AddLabel('fly toggle'):AddKeyPicker('FlyToggleKey', {
    Default = 'None',
    Text = 'toggle fly',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.FlyEnabled:SetValue(Value)
    end
})

MovementKeybinds:AddLabel('speed toggle'):AddKeyPicker('SpeedToggleKey', {
    Default = 'None',
    Text = 'toggle speed',
    Mode = 'Toggle',
    Callback = function(Value)
        Toggles.SpeedEnabled:SetValue(Value)
    end
})

-- Settings Tab
local SettingsGroup = Tabs.Settings:AddLeftGroupbox('general')

SettingsGroup:AddButton({
    Text = 'reload all players',
    Func = function()
        upd()
    end
})

SettingsGroup:AddButton({
    Text = 'clear all esp',
    Func = function()
        for _, p in pairs(plr:GetPlayers()) do
            cl(p)
        end
    end,
    DoubleClick = true
})

local MenuGroup = Tabs.Settings:AddRightGroupbox('menu')

MenuGroup:AddLabel('menu keybind'):AddKeyPicker('MenuKeybind', {
    Default = 'RightShift',
    NoUI = true,
    Text = 'menu keybind'
})

MenuGroup:AddDivider()

MenuGroup:AddButton({
    Text = 'unload',
    Func = function()
        for _, p in pairs(plr:GetPlayers()) do
            cl(p)
        end
        if fov_circle then fov_circle:Remove() end
        if fly_connection then fly_connection:Disconnect() end
        if speed_connection then speed_connection:Disconnect() end
        Library:Unload()
    end,
    DoubleClick = true
})

MenuGroup:AddDivider()

MenuGroup:AddLabel('@scrolling on discord')

-- Initialize
for _, p in pairs(plr:GetPlayers()) do
    if p ~= lp and p.Character then
        make(p)
    end
end

plr.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        task.wait(1)
        if p ~= lp then make(p) end
    end)
end)

plr.PlayerRemoving:Connect(function(p) cl(p) end)

lp.CharacterAdded:Connect(function()
    task.wait(1)
    upd()
end)

uis.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        if aimbot_enabled then
            is_aiming = true
        end
    end
end)

uis.InputEnded:Connect(function(input, gpe)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        is_aiming = false
    end
end)

task.spawn(function()
    while task.wait(30) do
        if active then upd() end
    end
end)

rs.Heartbeat:Connect(function()
    if active then
        update_esp()
    end
    
    if config.aimbot_fov_visible and aimbot_enabled then
        fov_circle.Visible = true
        local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
        fov_circle.Position = center
        fov_circle.Radius = config.aimbot_fov
        fov_circle.Color = config.aimbot_fov_color
    else
        fov_circle.Visible = false
    end
    
    if is_aiming and aimbot_enabled then
        local target = get_closest_player()
        if target then
            aim_at_player(target)
        end
    end
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:SetIgnoreIndexes({'MenuKeybind'})

ThemeManager:SetFolder('counterblox')
SaveManager:SetFolder('counterblox/configs')

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

ThemeManager:SetTheme('Jester')

SaveManager:LoadAutoloadConfig()

task.spawn(function()
    task.wait(1)
    scan_for_weapons()
    if no_spread_active then apply_no_spread_all() end
    upd()
end)