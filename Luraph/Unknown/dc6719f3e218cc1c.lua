-- [version:ts]
-- [translation:trident survival]
-- [scriptid:tridentsurvival]
local _CFramenew = CFrame.new
local _Vector2new = Vector2.new
local _Vector3new = Vector3.new
local _IsDescendantOf = game.IsDescendantOf
local _FindFirstChild = game.FindFirstChild
local _FindFirstChildOfClass = game.FindFirstChildOfClass
local _Raycast = workspace.Raycast
local _IsKeyDown = UserInputService.IsKeyDown
local _WorldToViewportPoint = Camera.WorldToViewportPoint
local _Vector3zeromin = Vector3.zero.Min
local _Vector2zeromin = Vector2.zero.Min
local _Vector3zeromax = Vector3.zero.Max
local _Vector2zeromax = Vector2.zero.Max
local _IsA = game.IsA
local tablecreate = table.create
local mathfloor = math.floor
local mathround = math.round
local mathclamp = math.clamp
local tostring = tostring
local unpack = unpack
local getupvalues = debug.getupvalues
local getupvalue = debug.getupvalue
local setupvalue = debug.setupvalue
local getconstants = debug.getconstants
local getconstant = debug.getconstant
local setconstant = debug.setconstant
local getstack = debug.getstack
local setstack = debug.setstack
local getinfo = debug.getinfo
local rawget = rawget

local trident = {
    loaded = false,
    lastpos = nil,
    middlepart = nil,
    tcp = nil,
    original_model = nil
}
local garbage = {}
local classes = nil;
local runonactorused = false

if not (hookfunction and hookmetamethod and getgc and getupvalues and getupvalue) then return print('wtf dude...') end
LPH_JIT_MAX(function()
    for i,v in pairs(getgc(true)) do
        if type(v) == "table" then
            if type(rawget(v, "Camera")) == "table" and rawget(rawget(v, "Camera"), "type") == "Camera" then
                classes = v
            end
            if type(rawget(v, "updateCharacter")) == "function" then
                garbage.character = v
            end
            if rawget(v, "SetMaxRelativeLookExtentsY") then
                garbage.maxlooky = rawget(v, "SetMaxRelativeLookExtentsY")
            end
            if rawget(v, "GetEquippedItem") then
                --print('------------------------')
                --table.foreach(getinfo(v.GetEquippedItem), print)
                --table.foreach(v, print)
                --for _, v1 in v do if type(v) == "function" and getinfo(v1).short_src:find("FPS") then print(v1) end end
                --print(swimdump(getupvalues(v[5])[1]))
                garbage.equippeditem = rawget(v, "GetEquippedItem")
            end
            if rawget(v, "GetEntityFromPart") then
                --print(swimdump(getupvalues(v[5])[1]))
                garbage.entitylist = rawget(v, "GetEntityFromPart")
            end
            if rawget(v, "Recoil") and getinfo(rawget(v, "Recoil")).short_src:find("Camera") then
                --print(swimdump(getupvalues(v[5])[1]))
                --print('obayudno')
                garbage.recoil = rawget(v, "Recoil")
            end
        end
    end
    --[[for i,v in pairs(getgc(true)) do
        if type(v) == "table" then
            if type(rawget(v, "Camera")) == "table" and rawget(rawget(v, "Camera"), "type") == "Camera" then
                classes = v
            end
            if type(rawget(v, "updateCharacter")) == "function" then
                garbage.character = v
            end
            if table.find(v, "SetMaxRelativeLookExtentsY") then
                garbage.maxlooky = rawget(v, 5)
            end
            if table.find(v, "GetEquippedItem") then
                --print('------------------------')
                --table.foreach(getinfo(v.GetEquippedItem), print)
                --table.foreach(v, print)
                --for _, v1 in v do if type(v) == "function" and getinfo(v1).short_src:find("FPS") then print(v1) end end
                --print(swimdump(getupvalues(v[5])[1]))
                garbage.equippeditem = rawget(v, 5)
            end
            if table.find(v, "GetEntityFromPart") then
                --print(swimdump(getupvalues(v[5])[1]))
                garbage.entitylist = rawget(v, 5)
            end
            if table.find(v, "Recoil") and getinfo(rawget(v, 5)).short_src:find("Camera") then
                --print(swimdump(getupvalues(v[5])[1]))
                --print('obayudno')
                garbage.recoil = rawget(v, 5)
            end
        end
    end]]
end)()

if not (classes and garbage.character and garbage.maxlooky and garbage.equippeditem and garbage.entitylist and garbage.recoil) then
    return print("USE AN ACTOR BYPASS...")
end

repeat if not pcall(function()
    trident.middlepart = workspace.Const.Ignore.LocalCharacter.Middle
    trident.original_model = game:GetService("ReplicatedStorage").Shared.entities.Player.Model
    trident.tcp = LocalPlayer.TCP
    trident.udp = LocalPlayer.UDP
    trident.valid_types = {}
    trident.valid_types["Player"] = true
    for _, v in game:GetService("ReplicatedStorage").Shared.entities.NPC:GetChildren() do
        trident.valid_types[v.Name] = true
    end
end) then task.wait(0.5) end until trident.middlepart and trident.original_model and trident.tcp

cheat.Library, cheat.Toggles, cheat.Options = loadswimhubfile("library_main.lua")()
cheat.ThemeManager = loadswimhubfile("library_theme.lua")()
cheat.SaveManager = loadswimhubfile("library_save.lua")()
local ui = {
    window = cheat.Library:CreateWindow({
        Title=string.format(
            SWG_Title,
            SWG_Version,
            SWG_FullName
        ),
    Center=true,AutoShow=true,TabPadding=8})
}

ui.tabs = {
    combat = ui.window:AddTab('combat'),
    visuals = ui.window:AddTab('visuals'),
    misc = ui.window:AddTab('misc'),
    config = ui.window:AddTab('config'),
}
ui.box = {
    aimbot = ui.tabs.combat:AddLeftTabbox(),
    mods = ui.tabs.combat:AddRightTabbox(),
    antiaim = ui.tabs.combat:AddRightTabbox(),
    esp = ui.tabs.visuals:AddLeftTabbox(),
    cheatvis = ui.tabs.visuals:AddRightTabbox(),
    world = ui.tabs.visuals:AddRightTabbox(),
    move = ui.tabs.misc:AddLeftTabbox(),
    atvfly = ui.tabs.misc:AddLeftTabbox(),
    misc = ui.tabs.misc:AddRightTabbox(),
    themeconfig = ui.tabs.config:AddLeftGroupbox('theme config'),
}

local vectors = {
    Vector3.zero, -- none
    _Vector3new(1, 0, 0), -- big right
    _Vector3new(-1, 0, 0), -- big left
    _Vector3new(0, 0, 1), -- big forward
    _Vector3new(0, 0, -1), -- big backward
    _Vector3new(0, 1, 0), -- big up
    _Vector3new(0, -1, 0), -- big down
    
    _Vector3new(1 / 2, 0, 0), -- small right
    _Vector3new(-1 / 2, 0, 0), -- small left
    _Vector3new(0, 0, 1 / 2), -- small forward
    _Vector3new(0, 0, -1 / 2), -- small backward
    _Vector3new(0, 1 / 2, 0), -- small up
    _Vector3new(0, -1 / 2, 0), -- small down

    _Vector3new(1 / 2, 1 / 2, 0), -- small right up
    _Vector3new(1 / 2, -1 / 2, 0), -- small right down
    _Vector3new(-1 / 2, 1 / 2, 0), -- small left up
    _Vector3new(-1 / 2, -1 / 2, 0), -- small left down
    _Vector3new(0, 1 / 2, 1 / 2), -- small forward up
    _Vector3new(0, -1 / 2, 1 / 2), -- small forward down
    _Vector3new(0, 1 / 2, -1 / 2), -- small backward up
    _Vector3new(0, -1 / 2, -1 / 2), -- small backward down
}
--[[local multipoints = {
    {1, 1, -1},
    {1, -1, -1},
    {-1, -1, -1},
    {-1, 1, -1},
    {1, 1, 1},
    {1, -1, 1},
    {-1, -1, 1},
    {-1, 1, 1},
    {0, 0, 0}
}

local function GetCorners(cframe, size, idx)
    return cframe * _CFramenew(size.X/2 * (multipoints[idx][1]*0.7), size.Y/2 * (multipoints[idx][2]*0.7), size.Z/2 * (multipoints[idx][3]*0.7))
end]]

cheat.EspLibrary = {};
LPH_NO_VIRTUALIZE(function()
    local esp_table = {}
    local workspace = cloneref(game:GetService("Workspace"))
    local rservice = cloneref(game:GetService("RunService"))
    local plrs = cloneref(game:GetService("Players"))
    local lplr = plrs.LocalPlayer
    local container = Instance.new("Folder", game:GetService("CoreGui").RobloxGui)
    esp_table = {
        __loaded = false,
        main_settings = {
            textSize = 15,
            textFont = Drawing.Fonts.Monospace,
            distancelimit = false,
            maxdistance = 200,
            useteamcolor = false,
            teamcheck = false,
            sleepcheck = false,
            simplecalc = false
        },
        main_object_settings = {
            textSize = 15,
            textFont = Drawing.Fonts.Monospace,
            distancelimit = false,
            maxdistance = 200,
            useteamcolor = false,
            teamcheck = false,
            sleepcheck = false,
            allowed = {}
        },
        settings = {
            enemy = {
                enabled = false,
    
                box = false,
                box_fill = false,
                realname = false,
                dist = false,
                weapon = false,
                skeleton = false,
    
                box_outline = false,
                realname_outline = false,
                dist_outline = false,
                weapon_outline = false,
    
                box_color = { Color3.new(1, 1, 1), 1 },
                box_fill_color = { Color3.new(1, 0, 0), 0.3 },
                realname_color = { Color3.new(1, 1, 1), 1 },
                dist_color = { Color3.new(1, 1, 1), 1 },
                weapon_color = { Color3.new(1, 1, 1), 1 },
                skeleton_color = { Color3.new(1, 1, 1), 1 },
    
                box_outline_color = { Color3.new(), 1 },
                realname_outline_color = Color3.new(),
                dist_outline_color = Color3.new(),
                weapon_outline_color = Color3.new(),
    
                chams = false,
                chams_visible_only = false,
                chams_fill_color = { Color3.new(1, 1, 1), 0.5 },
                chamsoutline_color = { Color3.new(1, 1, 1), 0 }
            },
            object = {
                enabled = false,
                allenabled = false,

                realname = false,
                realname_outline = false,

                realname_color = { Color3.new(1, 1, 1), 1 },
                realname_outline_color = Color3.new(),

                chams = false,
                chams_visible_only = false,
                chams_fill_color = { Color3.new(1, 1, 1), 0.5 },
                chamsoutline_color = { Color3.new(1, 1, 1), 0 }
            }
        }
    }
    local loaded_plrs = {}
    -- (please update me) vars
    local camera = workspace.CurrentCamera

    -- constants
    local VERTICES = {
        _Vector3new(-1, -1, -1),
        _Vector3new(-1, 1, -1),
        _Vector3new(-1, 1, 1),
        _Vector3new(-1, -1, 1),
        _Vector3new(1, -1, -1),
        _Vector3new(1, 1, -1),
        _Vector3new(1, 1, 1),
        _Vector3new(1, -1, 1)
    }
    local skeleton_order = {
        ["LeftFoot"] = "LeftLowerLeg",
        ["LeftLowerLeg"] = "LeftUpperLeg",
        ["LeftUpperLeg"] = "LowerTorso",
    
        ["RightFoot"] = "RightLowerLeg",
        ["RightLowerLeg"] = "RightUpperLeg",
        ["RightUpperLeg"] = "LowerTorso",
    
        ["LeftHand"] = "LeftLowerArm",
        ["LeftLowerArm"] = "LeftUpperArm",
        ["LeftUpperArm"] = "Torso",
    
        ["RightHand"] = "RightLowerArm",
        ["RightLowerArm"] = "RightUpperArm",
        ["RightUpperArm"] = "Torso",
    
        ["LowerTorso"] = "Torso",
        ["Torso"] = "Head"
    }
    -- upvalues
    local player_memory = {}
    -- game specific function
    local function getcurrentweapon(entity)
        --return "None"
        local gun = "None"
        if type(entity) == "table" and type(rawget(entity, "equippedItem")) == "table" then
            return rawget(rawget(entity, "equippedItem"), "type")
        end
        return gun
    end
    -- functions
    local esp = {}
    esp.create_obj = function(type, args)
        local obj = Drawing.new(type)
        for i, v in args do
            obj[i] = v
        end
        return obj
    end
    local function isBodyPart(name)
        return name == "Head" or name:find("Torso") or name:find("Leg") or name:find("Arm")
    end
    local function getBoundingBox(parts)
        local min, max
        for i = 1, #parts do
            local part = parts[i]
            local cframe, size = part.CFrame, part.Size
    
            min = _Vector3zeromin(min or cframe.Position, (cframe - size * 0.5).Position)
            max = _Vector3zeromax(max or cframe.Position, (cframe + size * 0.5).Position)
        end
    
        local center = (min + max) * 0.5
        local front = _Vector3new(center.X, center.Y, max.Z)
        return _CFramenew(center, front), max - min
    end
    local function worldToScreen(world)
        local screen, inBounds = _WorldToViewportPoint(camera, world)
        return _Vector2new(screen.X, screen.Y), inBounds, screen.Z
    end
    
    local function calculateCorners(cframe, size)
        local corners = tablecreate(#VERTICES)
        for i = 1, #VERTICES do
            corners[i] = worldToScreen((cframe + size * 0.5 * VERTICES[i]).Position)
        end
    
        local min = _Vector2zeromin(camera.ViewportSize, unpack(corners))
        local max = _Vector2zeromax(Vector2.zero, unpack(corners))
        return {
            corners = corners,
            topLeft = _Vector2new(mathfloor(min.X), mathfloor(min.Y)),
            topRight = _Vector2new(mathfloor(max.X), mathfloor(min.Y)),
            bottomLeft = _Vector2new(mathfloor(min.X), mathfloor(max.Y)),
            bottomRight = _Vector2new(mathfloor(max.X), mathfloor(max.Y))
        }
    end

    local function calculateCornersSimple(head, hrp)
        --[[
            auto head_position = roblox::WorldToScreen(vector3_sub(head.GetPartPosition(), { 0, -0.5, 0 }), dimensions, viewmatrix);
			auto leg_position = roblox::WorldToScreen(vector3_sub(rootpart.GetPartPosition(), { 0, 3.5, 0 }), dimensions, viewmatrix);
            float height = leg_position.y - head_position.y;
			float width = height / 3.6f;
            corners = {
			    {
			        static_cast<int>(round(head_position.x - width)),
			        static_cast<int>(round(head_position.y))
			    }, // up left corner
				{
			        static_cast<int>(round(head_position.x - width)),
			        static_cast<int>(round(leg_position.y))
			    }, // down left corner
				{
			        static_cast<int>(round(head_position.x + width)),
			        static_cast<int>(round(head_position.y))
			    }, // up right corner
			    {
			        static_cast<int>(round(head_position.x + width)),
			        static_cast<int>(round(leg_position.y))
			    } // down right corner
			};
        ]]
        local head_position = worldToScreen(head.Position - Vector3.yAxis * 0.5)
        local leg_position = worldToScreen(hrp.Position - Vector3.yAxis * 3.5)
        local headx, heady = head_position.X, head_position.Y
        local legx, legy = leg_position.X, leg_position.Y
        local height = legy - heady;
        local width = height / 3.6
        return {
            topLeft = _Vector2new(headx - width, heady),
            topRight = _Vector2new(headx - width, legy),
            bottomLeft = _Vector2new(headx + width, heady),
            bottomRight =_Vector2new(headx + width, legy)
        }
    end

    local enttiyidentification = {}
    for i, v in game:GetService("ReplicatedStorage").Shared.entities:GetChildren() do
        local model = _FindFirstChild(v, "Model")
        if model and model.PrimaryPart then
            enttiyidentification[v.Name] = {
                CollisionGroup = model.PrimaryPart.CollisionGroup,
                Material = model.PrimaryPart.Material,
                Color = model.PrimaryPart.Color
            }
        end
    end
    local function identify_model(model)
        if model.ClassName ~= "Model" then return false, false end
        if _FindFirstChildOfClass(model, "MeshPart") and _FindFirstChildOfClass(model, "MeshPart").MeshId == "rbxassetid://12939036056" then
            if #model:GetChildren() == 1 then
                return "Stone", model:GetChildren()[1]
            else
                for _, part in model:GetChildren() do
                    if part.Color == Color3.fromRGB(248, 248, 248) then
                        return "Nitrate", part
                    elseif part.Color == Color3.fromRGB(199, 172, 120) then
                        return "Iron", part
                    end
                end
            end
        end
        if not model.PrimaryPart then return end
        local primpart = model.PrimaryPart
        for name, entity in enttiyidentification do
            if entity.Color == primpart.Color and entity.Material == primpart.Material and entity.CollisionGroup == primpart.CollisionGroup then
                return name, primpart
            end
        end
        return false, false
    end

    -- MAINN
    local function create_esp(model)
        if model and _FindFirstChild(model, "Head") and _FindFirstChild(model, "LowerTorso") then
            local entity;
            repeat
                for _, ent in getupvalue(garbage.entitylist, 1) do
                    if rawget(ent, "model") == model then
                        entity = ent
                        break
                    end
                end
                if not entity then task.wait(.1) end
            until entity
            
            local entity_type = rawget(entity, "type")
            local entity_id = rawget(entity, "id")

            local settings = esp_table.settings.enemy
            loaded_plrs[model] = {
                obj = {
                    box_fill = esp.create_obj("Square", { Filled = true, Visible = false }),
                    box_outline = esp.create_obj("Square", { Filled = false, Thickness = 3, Visible = false, ZIndex = -1}),
                    box = esp.create_obj("Square", { Filled = false, Thickness = 1, Visible = false }),
                    realname = esp.create_obj("Text", { Center = true, Visible = false }),
                    dist = esp.create_obj("Text", { Center = true, Visible = false }),
                    weapon = esp.create_obj("Text", { Center = true, Visible = false }),
                },
                esp = {
                    current_gun = "",
                    corners = nil,
                    head = nil,
                    character = nil
                },
                chams_object = Instance.new("Highlight", container),
            }
            for required, _ in next, skeleton_order do
                loaded_plrs[model].obj["skeleton_" .. required] = esp.create_obj("Line", { Visible = false })
            end

            local character = model
            local head = _FindFirstChild(character, "Head")
            local lowertorso = _FindFirstChild(character, "LowerTorso")


            local plr = loaded_plrs[model]
            local obj = plr.obj

            local cham = plr.chams_object
            local box = obj.box
            local box_outline = obj.box_outline
            local box_fill = obj.box_fill
            local realname = obj.realname
            local dist = obj.dist
            local weapon = obj.weapon

            local main_settings = esp_table.main_settings
            local settings = esp_table.settings.enemy

            local setvis_cache = false

            function plr:forceupdate()
                cham.DepthMode = settings.chams_visible_only and Enum.HighlightDepthMode.Occluded or not settings.chams_visible_only and Enum.HighlightDepthMode.AlwaysOnTop 
                cham.FillColor = settings.chams_fill_color[1]
                cham.FillTransparency = settings.chams_fill_color[2]
                cham.OutlineColor = settings.chamsoutline_color[1]
                cham.OutlineTransparency = settings.chamsoutline_color[2]

                box.Transparency = settings.box_color[2]
                box.Color = settings.box_color[1]
                box_outline.Transparency = settings.box_outline_color[2]
                box_outline.Color = settings.box_outline_color[1]
                box_fill.Color = settings.box_fill_color[1]
                box_fill.Transparency = settings.box_fill_color[2]

                realname.Size = main_settings.textSize
                realname.Font = main_settings.textFont
                realname.Color = settings.realname_color[1]
                realname.Outline = settings.realname_outline
                realname.OutlineColor = settings.realname_outline_color
                realname.Transparency = settings.realname_color[2]

                dist.Size = main_settings.textSize
                dist.Font = main_settings.textFont
                dist.Color = settings.dist_color[1]
                dist.Outline = settings.dist_outline
                dist.OutlineColor = settings.dist_outline_color
                dist.Transparency = settings.dist_color[2]

                weapon.Size = main_settings.textSize
                weapon.Font = main_settings.textFont
                weapon.Color = settings.weapon_color[1]
                weapon.Outline = settings.weapon_outline
                weapon.OutlineColor = settings.weapon_outline_color
                weapon.Transparency = settings.weapon_color[2]

                for required, _ in next, skeleton_order do
                    local skeletonobj = obj["skeleton_" .. required]
                    if (skeletonobj) then
                        skeletonobj.Color = settings.skeleton_color[1]
                        skeletonobj.Transparency = settings.skeleton_color[2]
                    end
                end

                if setvis_cache then
                    cham.Enabled = settings.chams
                    box.Visible = settings.box
                    box_outline.Visible = settings.box_outline
                    box_fill.Visible = settings.box_fill
                    realname.Visible = settings.realname
                    dist.Visible = settings.dist
                    weapon.Visible = settings.weapon
                    for required, _ in next, skeleton_order do
                        local skeletonobj = obj["skeleton_" .. required]
                        if (skeletonobj) then
                            skeletonobj.Visible = settings.skeleton
                        end
                    end
                end
            end

            function plr:togglevis(bool)
                if setvis_cache ~= bool then
                    setvis_cache = bool
                    if not bool then
                        for _, v in obj do v.Visible = false end
                        cham.Enabled = false
                    else
                        cham.Enabled = settings.chams
                        box.Visible = settings.box
                        box_outline.Visible = settings.box_outline
                        box_fill.Visible = settings.box_fill
                        realname.Visible = settings.realname
                        dist.Visible = settings.dist
                        weapon.Visible = settings.weapon
                        for required, _ in next, skeleton_order do
                            local skeletonobj = obj["skeleton_" .. required]
                            if (skeletonobj) then
                                skeletonobj.Visible = settings.skeleton
                            end
                        end
                    end
                end
            end

            plr.connection = cheat.utility.new_renderstepped(function(delta)
                if not (
                    settings.enabled and
                    head and
                    character and
                    (
                        main_settings.sleepcheck and
                        not rawget(entity, "sleeping") or
                        not main_settings.sleepcheck
                    )
                ) then
                    return plr:togglevis(false)
                end
                local _, onScreen = worldToScreen(head.Position)
                if not onScreen then
                    return plr:togglevis(false)
                end

                local distance = (camera.CFrame.p - head.Position).Magnitude

                local corners if main_settings.simplecalc then
                    corners = calculateCornersSimple(head, lowertorso)
                else
                    local cache = {}
                    local children = character:GetChildren()
                    for i = 1, #children do
                        local part = children[i]
                        if _IsA(part, "BasePart") and isBodyPart(part.Name) then
                            cache[#cache + 1] = part
                        end
                    end
                    corners = calculateCorners(getBoundingBox(cache))
                end

                if not corners then
                    return plr:togglevis(false)
                end

                plr:togglevis(true)

                cham.Adornee = character
                do
                    local pos = corners.topLeft
                    local size = corners.bottomRight - corners.topLeft
                    box.Position = pos
                    box.Size = size
                    if getgenv().DrawingFix then
                        box_outline.Position = pos - _Vector2new(1, 1)
                        box_outline.Size = size + _Vector2new(2, 2)
                    else
                        box_outline.Position = pos
                        box_outline.Size = size
                    end
                    box_fill.Position = pos
                    box_fill.Size = size
                end

                do
                    local entity_name = rawget(entity, "Name")
                    realname.Text = player_memory[entity_id] or entity_name or entity_type
                    if entity_type == "Player" and entity_name then
                        player_memory[entity_id] = entity_name
                    end
                    realname.Position = (corners.topLeft + corners.topRight) * 0.5 -
                        Vector2.yAxis * realname.TextBounds.Y - _Vector2new(0, 2)
                end

                do
                    local bottom = (corners.bottomLeft + corners.bottomRight) * 0.5
                    dist.Text = tostring(mathround(distance)) .. " studs"
                    dist.Position = bottom
                    weapon.Text = getcurrentweapon(entity)
                    weapon.Position = bottom + (dist.Visible and Vector2.yAxis * dist.TextBounds.Y - _Vector2new(0, 2) or Vector2.zero)
                end

                if settings.skeleton then
                    for _, part in next, character:GetChildren() do
                        local part_name = part.Name
                        local skeletonobj = obj["skeleton_" .. part_name]
                        local parent_part = skeleton_order[part_name] and _FindFirstChild(character, skeleton_order[part_name])
                        if skeletonobj and parent_part then
                            local part_position, _ = _WorldToViewportPoint(camera, part.Position)
                            local parent_part_position, _ = _WorldToViewportPoint(
                                camera, parent_part.CFrame.p
                            )
                            skeletonobj.From = _Vector2new(part_position.X, part_position.Y)
                            skeletonobj.To = _Vector2new(parent_part_position.X, parent_part_position.Y)
                        end
                    end
                end
            end)

            plr:forceupdate()
        else
            local espname, mainpart = identify_model(model)
            if not (espname and mainpart) then return end
            loaded_plrs[model] = {
                obj = {
                    name = esp.create_obj("Text", { Center = true, Visible = false, Text = espname }),
                }
            }
            local plr = loaded_plrs[model]
            local obj = plr.obj

            local realname = obj.name

            local main_settings = esp_table.main_object_settings
            local settings = esp_table.settings.object
            local allowedobjs = main_settings.allowed

            local setvis_cache = false

            function plr:forceupdate()
                realname.Size = main_settings.textSize
                realname.Font = main_settings.textFont
                realname.Color = settings.realname_color[1]
                realname.Outline = settings.realname_outline
                realname.OutlineColor = settings.realname_outline_color
                realname.Transparency = settings.realname_color[2]
            end

            function plr:togglevis(bool)
                if setvis_cache ~= bool then
                    for _, v in obj do v.Visible = bool end
                    setvis_cache = bool
                end
            end

            plr.connection = cheat.utility.new_heartbeat(function(delta)
                local plr = loaded_plrs[model]
                if not (settings.enabled and mainpart and (settings.allenabled or allowedobjs[espname])) then
                    return plr:togglevis(false)
                end
                local position, onscreen = worldToScreen(mainpart.Position)
                if not onscreen then
                    return plr:togglevis(false)
                end
                plr:togglevis(true)
                realname.Position = position
            end)

            plr:forceupdate()
        end
    end
    local function destroy_esp(model)
        local plr_object = loaded_plrs[model]
        if not plr_object then return end
        plr_object.connection:Disconnect()
        for i, v in plr_object.obj do
            v:Remove()
        end
        if plr_object.chams_object then
            plr_object.chams_object:Destroy()
        end
        loaded_plrs[model] = nil
    end
    
    function esp_table.load()
        assert(not esp_table.__loaded, "[ESP] already loaded");
    
        for i, v in next, workspace:GetChildren() do
           create_esp(v)
        end
    
        esp_table.playerAdded = workspace.ChildAdded:Connect(create_esp);
        esp_table.playerRemoving = workspace.ChildRemoved:Connect(destroy_esp);
        esp_table.__loaded = true;
    end
    
    function esp_table.unload()
        assert(esp_table.__loaded, "[ESP] not loaded yet");
    
        for i, v in next, workspace:GetChildren() do
            destroy_esp(v)
        end
    
        esp_table.playerAdded:Disconnect();
        esp_table.playerRemoving:Disconnect();
        esp_table.__loaded = false;
    end
    
    function esp_table.icaca()
        for _, v in loaded_plrs do
            task.spawn(function() v:forceupdate() end)
        end
    end

    cheat.EspLibrary = esp_table
end)();

local vischeck_params = RaycastParams.new()
vischeck_params.FilterDescendantsInstances = { workspace.Const.Ignore }
vischeck_params.FilterType = Enum.RaycastFilterType.Exclude
vischeck_params.CollisionGroup = "WeaponRaycast"
vischeck_params.IgnoreWater = true

local function is_visible(position, target, target_part)
    if not (target and target_part and position) then return false end
    local castresults = _Raycast(workspace, position, target_part.CFrame.p - position, vischeck_params)
    return castresults and castresults.Instance and castresults.Instance.Parent == target
end

local function is_position_visible(pos_from, pos_to)
    if not (pos_to and pos_from) then return false end
    local castresults = _Raycast(workspace, pos_from, pos_to - pos_from, vischeck_params)
    return not castresults
end


local function predict_entity(part, entity, projectile_speed, projectile_drop, origin)
    local part_cframe = part.CFrame
    local velocity = (rawget(entity, "goalPosition") - rawget(entity, "startPosition")) / 0.15 * _Vector3new(1, 0, 1)
    local distance = (origin - part_cframe.Position).Magnitude
    local time_to_hit = (distance / projectile_speed)
    local predicted_position = part_cframe.Position + (velocity * time_to_hit)
    local delta = (predicted_position - part_cframe.Position).Magnitude
    time_to_hit = time_to_hit + (delta / projectile_speed)
    return predicted_position + Vector3.yAxis * (projectile_drop ^ (time_to_hit * projectile_drop) - 1)
end
local function get_actual_hitpos(projectile_speed, projectile_drop, origin, position)
    local distance = (origin - position).Magnitude
    local time_to_hit = (distance / projectile_speed)
    local drop_distance = projectile_drop ^ (time_to_hit * projectile_drop) - 1
    local look_vector = CFrame.lookAt(origin, position + Vector3.yAxis * drop_distance)
    return look_vector, (look_vector * _CFramenew(0, -projectile_drop ^ (time_to_hit * projectile_drop) + 1, -time_to_hit * projectile_speed)).Position
end
local function predict_drop_position(position, projectile_speed, projectile_drop, origin)
    local origin = origin or Camera.CFrame.p
    local distance = (origin - position).Magnitude
    local time_to_hit = (distance / projectile_speed)
    local drop_timing = projectile_drop ^ (time_to_hit * projectile_drop) - 1
    if not (drop_timing ~= drop_timing) then
        return drop_timing, time_to_hit
    end
    return 0
end

local function get_manipulation_pos(origin_pos, target, target_part, range, enabled)
    if not origin_pos then origin_pos = Camera.CFrame.p end
    if not enabled then
        local visible = is_visible(origin_pos, target, target_part)
        if visible then
            return origin_pos
        end
    end
    local final, maxmag = nil, math.huge;
    for _, vector in vectors do
        local curvector = (vector * range)
        local modified = origin_pos + curvector
        local posvisible, visible = is_position_visible(origin_pos, modified), is_visible(modified, target, target_part)
        if curvector.Magnitude <= maxmag and posvisible and visible then
            final = modified
            maxmag = curvector.Magnitude
        end
    end
    return final
end

local function get_simulation_pos(origin_pos, target, target_part, simtable, projectile_speed, projectile_drop)
    local final, maxmag = nil, math.huge;
    local targetpos = target_part.Position
    for _, vector in simtable do
        local modified = targetpos + vector
        local distance = (origin_pos - modified).Magnitude
        local visible = is_visible(modified, target, target_part)
        if visible then
            local posvisible = is_position_visible(origin_pos, modified)
            if posvisible and distance <= maxmag then
                final = modified
                maxmag = distance
            end
        end
    end
    return final
end

local function get_closest_target(usefov, fov_size, aimpart, sleep, team)
    local part, entity = nil, nil
    local maximum_distance = usefov and fov_size or math.huge
    local mousepos = _Vector2new(Mouse.X, Mouse.Y)
    local valid_types = trident.valid_types
    LPH_JIT_MAX(function()
        for _, tbl in getupvalue(garbage.entitylist, 1) do
            local model = rawget(tbl, "model")
            local enttype = rawget(tbl, "type")
            local sleeping = rawget(tbl, "sleeping")
            local hitpart = model and _FindFirstChild(model, aimpart)
            if (hitpart and valid_types[enttype]) and (sleep and not sleeping or not sleep) then
                local position, onscreen = _WorldToViewportPoint(Camera, hitpart.Position)
                local distance = (_Vector2new(position.X, position.Y - GuiInset.Y) - mousepos).Magnitude
                if (usefov and onscreen or not usefov) and distance < maximum_distance then
                    part = hitpart
                    entity = tbl
                    maximum_distance = distance
                end
            end
        end
    end)()
    return part, entity
end
local function make_beam(Origin, Position, Color)
    local part1, part2 = Instance.new("Part", workspace.Const.Ignore), Instance.new("Part", workspace.Const.Ignore)
    part1.Position = Origin; part2.Position = Position;
    part1.Transparency = 1; part2.Transparency = 1;
    part1.CanCollide = false; part2.CanCollide = false;
    part1.Size = Vector3.zero; part2.Size = Vector3.zero;
    part1.Anchored = true; part2.Anchored = true;
    local OriginAttachment = Instance.new("Attachment", part1)
    local PositionAttachment = Instance.new("Attachment", part2)
    local Beam = Instance.new("Beam", workspace.Const.Ignore)
    Beam.Name = "Beam"
    Beam.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0,Color),
        ColorSequenceKeypoint.new(1,Color)
    };
    Beam.LightEmission = 1
    Beam.LightInfluence = 1
    Beam.TextureMode = Enum.TextureMode.Static
    Beam.TextureSpeed = 0
    Beam.Transparency = NumberSequence.new(0)
    Beam.Attachment0 = OriginAttachment
    Beam.Attachment1 = PositionAttachment
    Beam.FaceCamera = true
    Beam.Segments = 1
    Beam.Width0 = 0.1
    Beam.Width1 = 0.1
    return Beam, part1, part2
end
local function make_beam_drawing(Origin, Position, Color)
    local part1, part2 = Instance.new("Part", workspace.Const.Ignore), Instance.new("Part", workspace.Const.Ignore)
    part1.Position = Origin; part2.Position = Position;
    part1.Transparency = 1; part2.Transparency = 1;
    part1.CanCollide = false; part2.CanCollide = false;
    part1.Size = Vector3.zero; part2.Size = Vector3.zero;
    part1.Anchored = true; part2.Anchored = true;
    local OriginAttachment = Instance.new("Attachment", part1)
    local PositionAttachment = Instance.new("Attachment", part2)
    local Beam = Instance.new("Beam", workspace.Const.Ignore)
    Beam.Name = "Beam"
    Beam.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0,Color),
        ColorSequenceKeypoint.new(1,Color)
    };
    Beam.LightEmission = 1
    Beam.LightInfluence = 1
    Beam.TextureMode = Enum.TextureMode.Static
    Beam.TextureSpeed = 0
    Beam.Transparency = NumberSequence.new(0)
    Beam.Attachment0 = OriginAttachment
    Beam.Attachment1 = PositionAttachment
    Beam.FaceCamera = true
    Beam.Segments = 1
    Beam.Width0 = 0.1
    Beam.Width1 = 0.1
    return Beam, part1, part2
end
local function create_cool_beam(pos1, pos2, color, rainbow)
    LPH_JIT_MAX(function()
        local drawing, deleteme, deleteme1;
        local real_sigma, fakeerror = pcall(function()
            drawing, deleteme, deleteme1 = make_beam(pos1, pos2, color)
        end)
        if not real_sigma then
            return print(fakeerror)
        end
        local wtf = -1
        local conn; conn = cheat.utility.new_renderstepped(function(delta)
            wtf = wtf + delta
            drawing.Transparency = NumberSequence.new(math.clamp(wtf, 0, 1))
            if rainbow then
                drawing.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(wtf % 1, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV(wtf % 1, 1, 1))
                }
            end
            if wtf >= 1 then
                drawing:Destroy()
                deleteme:Destroy()
                deleteme1:Destroy()
                conn:Disconnect()
            end
        end)
    end)()
end
local function visualize_bullet_path(cframedir, position, projectile_speed, projectile_drop, color, rainbow)
    local distance = (cframedir.p - position).Magnitude
    local time_to_hit = (distance / projectile_speed)
    LPH_JIT_MAX(function()
        local newpos = cframedir.p
        local predictions = math.ceil(distance/10)
        if predictions == 0 then return end
        for i=1,predictions do
            local new_time = (i/predictions)*time_to_hit
            local oldpos = newpos
            local newpos1 = (cframedir * _CFramenew(0, -projectile_drop ^ (new_time * projectile_drop) + 1, -new_time * projectile_speed)).Position
            newpos = newpos1
            --print(oldpos, newpos1)
            local drawing, deleteme, deleteme1;
            local real_sigma, fakeerror = pcall(function()
                drawing, deleteme, deleteme1 = make_beam(oldpos, newpos1, color)
            end)
            if not real_sigma then
                return print(fakeerror)
            end
            local wtf = -1
            local conn; conn = cheat.utility.new_renderstepped(function(delta)
                wtf = wtf + delta
                new_time = new_time + delta
                drawing.Transparency = NumberSequence.new(math.clamp(wtf, 0, 1))
                if rainbow then
                    drawing.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromHSV(new_time / 2 % 1, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.fromHSV(new_time / 2 % 1, 1, 1))
                    }
                end
                if wtf >= 1 then
                    drawing:Destroy()
                    deleteme:Destroy()
                    deleteme1:Destroy()
                    conn:Disconnect()
                end
            end)
        end
    end)()
end

--[[

--]]
local modulecomm = {
    enabled = false,
    resolver = false,
    camera = false,
    silent = false,
    sleep_check = false,
    team_check = false,
    part = "Head",
    manipulation = false,
    manipulation_range = 5,
    fov = false,
    fov_show = false,
    fov_color = Color3.new(1, 1, 1),
    fov_outline = false,
    fov_outline_color = Color3.new(0, 0, 0),
    fov_size = 100,
    indicator = false,
    indicator_text = "",
    jumpshoot = false,
    noslowdown = false,
    nospread = false,
    forcehead = false,
    invis = false,
    mathhuge = false,
    hitboxes = false,
    hbbypass = false,
    instant = false,
    fly = false,
    silentwalk = false,
    downhill = false,
    velobreak = false,
    velobreakstrenght = 6,
    infiniteregister = false,
    simulation = false,
    simulation_time = "simple",
    simulation_table = {},
    target = {},
    antiaim = {
        antiaim = false,
        antiaimyaw = "none", -- none, spin, static, jitter, invisible
        antiaimpitch = "none", -- none, down, up, jitter, custom
        spinspeed = 0.1,
        backwards = false,
        yawoffset = 0,
        yawjittersize = 0,
        pitchjittersize = 0,
        pitchcustom = 0,

        car = false,
        cartripmode = "side", -- none, left side, right side, front, back, zero
        caryaw = "none", -- none, god, spin, jitter, invisible
        carspinspeed = 0.1,
    },
}
do
    local norecoil = false
    local target_part, target_entity, manipulation_pos;
    local extremeresolver, resolver = false, false
    local salobox = ui.box.aimbot:AddTab('aimbotzz')
    local gunmodbox = ui.box.mods:AddTab('gun mods')
    local aabox = ui.box.antiaim:AddTab('antiaim')
    do
        local aaset = modulecomm.antiaim
        aabox:AddToggle('antiaim_enabled', {Text = 'antiaim',Default = false,Callback = function(first)
            aaset.antiaim = first
        end})
        aabox:AddDropdown('antiaim_yaw', {Values={"none", "spin", "static", "jitter", "invisible"},Default = 1,Multi = false,Text = 'yaw modifier',Callback=function(Value)
            aaset.antiaimyaw = Value
        end})
        aabox:AddDropdown('antiaim_pitch', {Values={"none", "down", "up", "jitter", "custom"},Default = 1,Multi = false,Text = 'pitch modifier',Callback=function(Value)
            aaset.antiaimpitch = Value
        end})
        -------------->>> yaw
        --> spin
        do
            local aadepbox = aabox:AddDependencyBox();
            aadepbox:AddSlider('antiaim_spinspeed',{Text = 'spin speed (rpm)',Default = 60,Min = 60,Max = 360,Rounding = 0,Compact = true,Callback = function(State)
                aaset.spinspeed = State
            end})
            aadepbox:SetupDependencies({
                { cheat.Options.antiaim_yaw, "spin" }
            });
        end
        --> jitter
        do
            local aadepbox = aabox:AddDependencyBox();
            aadepbox:AddSlider('antiaim_jittersize',{Text = 'yaw jitter (d)',Default = 45,Min = 0,Max = 180,Rounding = 0,Compact = true,Callback = function(State)
                aaset.yawjittersize = State
            end})
            aadepbox:SetupDependencies({
                { cheat.Options.antiaim_yaw, "jitter" }
            });
        end
        --> static, jitter
        do
            local aadepbox = aabox:AddDependencyBox();
            aadepbox:AddToggle('antiaim_backwards', {Text = 'backwards',Default = false,Callback = function(Value)
                aaset.backwards = Value
            end})
            aadepbox:AddSlider('antiaim_yawoffset',{Text = 'yaw offset',Default = 0,Min = -90,Max = 90,Rounding = 0,Compact = true,Callback = function(State)
                aaset.yawoffset = State
            end})
            aadepbox:SetupDependencies({
                { cheat.Options.antiaim_yaw, "static" },
                { cheat.Options.antiaim_yaw, "jitter" }
            });
        end
        -------------->>> pitch
        --> pitch jitter size
        do
            local aadepbox = aabox:AddDependencyBox();
            aadepbox:AddSlider('antiaim_pitchjittersize',{Text = 'pitch jitter',Default = 90,Min = 0,Max = 90,Rounding = 0,Compact = true,Callback = function(State)
                aaset.pitchjittersize = State
            end})
            aadepbox:SetupDependencies({
                { cheat.Options.antiaim_pitch, "jitter" }
            });
        end
        --> custom pitch
        do
            local aadepbox = aabox:AddDependencyBox();
            aadepbox:AddSlider('antiaim_custompitch',{Text = 'pitch (-90=down, 90=up)',Default = 0,Min = -90,Max = 90,Rounding = 0,Compact = true,Callback = function(State)
                aaset.pitchcustom = State
            end})
            aadepbox:SetupDependencies({
                { cheat.Options.antiaim_pitch, "custom" }
            });
        end
    end
    gunmodbox:AddToggle('gunmods_norecoil', {Text = 'no recoil',Default = false,Callback = function(first)
        setconstant(debug.getproto(garbage.recoil, 1), 2, first and rawget(rawget(classes, "InputManager"), "InputDevice") or "Mobile")
    end})
    --gunmodbox:AddToggle('gunmods_jumpshoot', {Text = 'jump shoot',Default = false,Callback = function(first)
    --    modulecomm.jumpshoot = first
    --end})
    gunmodbox:AddToggle('gunmods_nospread', {Text = 'no spread',Default = false,Callback = function(first)
        modulecomm.nospread = first
    end})
    gunmodbox:AddToggle('gunmods_noslowdown', {Text = 'no slowdown',Default = false,Callback = function(first)
        modulecomm.noslowdown = first
    end})
    gunmodbox:AddToggle('gunmods_forcehead', {Text = 'force head',Default = false,Callback = function(first)
        modulecomm.forcehead = first
    end})

    salobox:AddToggle('aimbot_enabled', {Text = 'aimbot',Default = false,Callback = function(first)
        modulecomm.enabled = first
    end})
    salobox:AddToggle('aimbot_resolver', {Text = 'resolver',Default = false,Callback = function(first)
        resolver = first
    end})

    --[[salobox:AddToggle('aimbot_instant', {Text = 'instant hit (TEST)',Default = false,Callback = function(first)
        modulecomm.instant = first
    end})]]

    salobox:AddToggle('aimbot_camera', {Text = 'camera (mb2)',Default = false,Callback = function(first)
        modulecomm.camera = first
    end})
    salobox:AddToggle('aimbot_silent', {Text = 'silent',Default = false,Callback = function(first)
        modulecomm.silent = first
    end})

    salobox:AddToggle('aimbot_indicator', {Text = 'indicator (crosshair needed)',Default = false,Callback = function(first)
        modulecomm.indicator = first
    end})

    salobox:AddToggle('aimbot_sleep_check', {Text = 'sleeper check',Default = false,Callback = function(first)
        modulecomm.sleep_check = first
    end})

    salobox:AddToggle('aimbot_team_check', {Text = 'team check',Default = false,Callback = function(first)
        modulecomm.team_check = first
    end})

    salobox:AddToggle('aimbot_fov', {Text = 'use fov',Default = false,Callback = function(Value)
        modulecomm.fov = Value
    end})

    local Depbox1 = salobox:AddDependencyBox();

    Depbox1:AddToggle('aimbot_fov_show', {Text = 'show fov',Default = false,Callback = function(Value)
        modulecomm.fov_show = Value
    end}):AddColorPicker('aimbot_fov_color',{Default = Color3.new(1, 1, 1),Title = 'fov color',Transparency = 0,Callback = function(Value)
        modulecomm.fov_color = Value
    end})

    Depbox1:AddToggle('aimbot_fov_outline', {Text = 'fov outline',Default = false,Callback = function(Value)
        modulecomm.fov_outline = Value
    end})

    Depbox1:AddSlider('aimbot_fov_size',{Text = 'target fov',Default = 100,Min = 10,Max = 1000,Rounding = 0,Compact = true,Callback = function(State)
        modulecomm.fov_size = State
    end})

    Depbox1:SetupDependencies({
        { cheat.Toggles.aimbot_fov, true }
    });
    salobox:AddToggle('silentaim_manipulation', {Text = 'silent manipulation',Default = false,Callback = function(Value)
        modulecomm.manipulation = Value
    end})

    local Depbox2 = salobox:AddDependencyBox();
    
    Depbox2:AddSlider('silentaim_manipulation_range',{Text = 'manipulation range',Default = 5,Min = 1,Max = 5,Rounding = 1,Compact = true,Callback = function(State)
        modulecomm.manipulation_range = State
    end})

    Depbox2:SetupDependencies({
        { cheat.Toggles.silentaim_manipulation, true }
    });
    local simulation_table = {} do
        local enabled, range, yrange, slices, refresh_time = false, 10, 5, 5, 0.1

        local function generate_simulation_table() LPH_JIT_MAX(function()
            simulation_table = {}
            if not modulecomm.simulation then return end
            for x = -range, range, range/slices do
                for z = -range, range, range/slices do
                    if yrange > 0 then
                        for y = -yrange, yrange, yrange/slices do
                            simulation_table[#simulation_table + 1] = _Vector3new(x, y, z)
                        end
                    else
                        simulation_table[#simulation_table + 1] = _Vector3new(x, 0, z)
                    end
                end
            end
        end)() end
        salobox:AddToggle('silentaim_simulation', {Text = 'player simulation',Default = false,Callback = function(Value)
            modulecomm.simulation = Value
            generate_simulation_table()
        end})
        salobox:AddSlider('silentaim_simulation_range',{Text = 'simulation range',Default = 10,Min = 10,Max = 5000,Rounding = 0,Compact = true,Callback = function(State)
            range = State
            generate_simulation_table()
        end})
        salobox:AddSlider('silentaim_simulation_yrange',{Text = 'simulation y range',Default = 0,Min = 0,Max = 10,Rounding = 0,Compact = true,Callback = function(State)
            yrange = State
            generate_simulation_table()
        end})
        salobox:AddSlider('silentaim_simulation_slices',{Text = 'simulation slices',Default = 5,Min = 1,Max = 20,Rounding = 0,Compact = true,Callback = function(State)
            slices = State
            generate_simulation_table()
        end})
        salobox:AddSlider('silentaim_simulation_refresh',{Text = 'refresh time',Default = 0.1,Min = 0.1,Max = 1,Rounding = 1,Compact = true,Callback = function(State)
            refresh_time = State
            generate_simulation_table()
        end})
        salobox:AddDropdown('silentaim_simulation_time', {Values = {'simple','complex-simple','complex'},Default = 1,Multi = false,Text = 'simulation time type',Callback = function(Value)
            modulecomm.simulation_time = Value
        end})
        generate_simulation_table()
        task.spawn(function()
            while task.wait(refresh_time) do
                if modulecomm.target[1] then
                    modulecomm.simulation_pos = modulecomm.simulation and get_simulation_pos(Camera.CFrame.p, modulecomm.target[1].Parent, modulecomm.target[1], simulation_table)
                end
            end
        end)
    end
    local CircleOutline = Drawing.new("Circle")
    local CircleInline = Drawing.new("Circle")
    CircleInline.Transparency = 1
    CircleInline.Thickness = 1
    CircleInline.ZIndex = 2
    CircleOutline.Thickness = 3
    CircleOutline.Color = Color3.new()
    CircleOutline.ZIndex = 1
    --local classes = garbage.classes

    cheat.utility.new_renderstepped(LPH_JIT_MAX(function()
        CircleOutline.Position = (_Vector2new(Mouse.X, Mouse.Y + GuiInset.Y))
        CircleInline.Position = (_Vector2new(Mouse.X, Mouse.Y + GuiInset.Y))
        CircleInline.Radius = modulecomm.fov_size
        CircleInline.Color = modulecomm.fov_color
        CircleInline.Visible = modulecomm.fov and modulecomm.fov_show
        CircleOutline.Radius = modulecomm.fov_size
        CircleOutline.Visible = (modulecomm.fov and modulecomm.fov_show and modulecomm.fov_outline)
        if modulecomm.noslowdown then
            rawset(garbage.character, "sprintBlocked", false)
        end
    end))
    cheat.utility.new_heartbeat(LPH_JIT_MAX(function()
        local indtxt = ""
        target_part, target_entity = get_closest_target(modulecomm.fov, modulecomm.fov_size, modulecomm.part, modulecomm.sleep_check, modulecomm.team_check);
        modulecomm.target = {target_part, target_entity}
        if target_part and target_entity then
            manipulation_pos = target_part and target_entity and get_manipulation_pos(modulecomm.extended_manipulation and trident.lastpos or Camera.CFrame.p, target_part.Parent, target_part, modulecomm.manipulation_range + (modulecomm.extended_manipulation and 5 or 0), modulecomm.manipulation) or nil;
            indtxt = indtxt..(rawget(target_entity, "name") or rawget(target_entity, "type"))
            if modulecomm.manipulation and manipulation_pos then
                indtxt = indtxt.." (visible)"
            end
            if modulecomm.simulation_pos then
                indtxt = indtxt.." (simulated)"
            end
        else
            indtxt = ""
        end
        modulecomm.indicator_text = indtxt
    end))
    --[[
    for _, v in getgc(true) do
        if type(v) == "table" and rawget(v, "type") == "MiningDrill" then
            v.AttackCooldown = 0
        end
    end
    ]]
    --[[RunService:BindToRenderStep(tostring(math.random()), Enum.RenderPriority.Character.Value + 1, LPH_NO_VIRTUALIZE(function()
        if modulecomm.jumpshoot then
            setupvalue(garbage.isgrounded, 1, true)
            setupvalue(garbage.isgrounded, 4, true)
        end
    end))]]
    do
        local entlist = getupvalue(garbage.entitylist, 1)
        RunService:BindToRenderStep(tostring(math.random()), 0, LPH_NO_VIRTUALIZE(function()
            if resolver then
                for id, entity in entlist do if rawget(entity, "startAngleY") and rawget(entity, "startAngleX") then
                    rawset(entity, "startAngleY", 0)
                    rawset(entity, "goalAngleY", 0)
                    rawset(entity, "startAngleX", 0)
                    rawset(entity, "goalAngleX", 0)
                    rawset(entity, "rot", Vector3.zero)
                end end
            end
            
            local equippeditem = getupvalue(garbage.equippeditem, 1)
            trident.guninfo = classes and equippeditem and rawget(classes, rawget(equippeditem, "type"))
    
            if modulecomm.enabled and modulecomm.camera and target_part and target_entity and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local guninfo    = trident.guninfo
                local proj_speed = guninfo and rawget(guninfo, "ProjectileSpeed")
                local proj_drop  = guninfo and rawget(guninfo, "ProjectileDrop") or 0
                local campos     = Camera.CFrame.p
                local pitch, yaw = CFrame.lookAt(campos, 
                    (guninfo and proj_speed and proj_drop)
                and
                    predict_entity(target_part, target_entity, proj_speed, proj_drop, campos)
                or
                    target_part.CFrame.p
                ):ToOrientation()
                setupvalue(garbage.recoil, 13, _Vector3new(pitch, yaw, 0))
            end
        end))
    end
    local __randomnamecall; __randomnamecall = hookmetamethod(Random.new(), "__namecall", newcclosure(LPH_JIT_MAX(function(self, ...)
        local args = {...}
        if args[1] == -100 and args[2] == 100 then
            --print(debug.traceback())
            
            if typeof(getstack(3, 4)) ~= "CFrame" then
                print("pasting has failed...", typeof(getstack(3, 4)))
                return __randomnamecall(self, ...)
            end
            if modulecomm.enabled and modulecomm.silent and target_part and target_entity then
                local guninfo    = trident.guninfo
                local proj_speed = guninfo and rawget(guninfo, "ProjectileSpeed")
                local proj_drop  = guninfo and rawget(guninfo, "ProjectileDrop") or 0

                if guninfo and proj_speed and proj_drop then
                    if modulecomm.simulation_pos then
                        local lookto = (
                            modulecomm.simulation_pos +
                            _Vector3new(0, predict_drop_position(modulecomm.simulation_pos, proj_speed, proj_drop, Camera.CFrame.p), 0)
                        )
                        --create_cool_beam(Camera.CFrame.p, lookto, Color3.new(1,0,0), false)
                        --visualize_bullet_path(CFrame.lookAt(Camera.CFrame.p, lookto), modulecomm.simulation_pos, proj_speed, proj_drop, Color3.new(1,1,1), true)
                        setstack(3, 4, CFrame.lookAt(Camera.CFrame.p, lookto))
                        return __randomnamecall(self, ...)
                    end
                    local origin = manipulation_pos and manipulation_pos or Camera.CFrame.p
                    setstack(3, 4, CFrame.lookAt(origin,
                        predict_entity(target_part, target_entity, proj_speed, proj_drop, origin)
                    ))
                end
            end
            if modulecomm.nospread then
                local guninfo = trident.guninfo
                local pellets = guninfo and rawget(guninfo, "Pellets")
                if guninfo and pellets then
                    return __randomnamecall(self, -pellets / 10000, pellets / 10000)
                end
                return __randomnamecall(self, -1 / 10000, 1 / 10000)
            end

        end
        return __randomnamecall(self, ...)
    end)))
    --[[local game_RunService = game:GetService("RunService");
    local __runserviceindex; __runserviceindex = hookmetamethod(game_RunService, "__index", newcclosure(function(self, key)
        if key == "RenderStepped" and modulecomm.instant and (debug.isvalidlevel(7) and debug.getinfo(7).name == "createProjectile") then
            return {
                Connect = function(selfconnect, funcconnect)
                    local guninfo, instant_time = trident.guninfo, nil
                    if target_part and target_entity and guninfo and guninfo.ProjectileSpeed then
                        instant_time = predict_time(target_part, target_entity, guninfo.ProjectileSpeed)
                        print('wow', instant_time)
                    else
                        print('fail...', not not (target_part and target_entity and guninfo and guninfo.ProjectileSpeed))
                    end
                    
                    local connection; connection = game_RunService.RenderStepped:Connect(function(delta)
                        funcconnect(instant_time or delta)
                    end)
                    return {Disconnect = function()if connection then connection:Disconnect() end end}
                end
            }
        end
        return __runserviceindex(self, key)
    end))]]
end

do
    local validcharacters = {}
    local hbc, original_size, hbsize = nil, trident.original_model.Torso.Size, _Vector3new(0.5, 1, 0.5)
    local dynamic, alwayshead = false, false
    local hitboxheadsizex, hitboxheadsizey, hitboxheadtransparency, cancollide = 10, 10, 0.5, false
    local function addtovc(obj)
        if not obj then return end
        if not obj:FindFirstChild("Head") and not obj:FindFirstChild("LowerTorso") then return end
        validcharacters[obj] = obj
    end

    local function removefromvc(obj)
        if not validcharacters[obj] then return end
        validcharacters[obj] = nil
    end

    for i, v in next, workspace:GetChildren() do addtovc(v) end
    workspace.ChildAdded:Connect(addtovc);
    workspace.ChildRemoved:Connect(removefromvc);

    local hbb = ui.box.aimbot:AddTab("hitbox")
    hbb:AddToggle('hitbox_enabled', {
        Text = 'hitbox expander',
        Default = false,
        Callback = function(value)
            modulecomm.hitboxes = value
            if hbc then hbc:Disconnect() end
            if value then
                hbc = cheat.utility.new_heartbeat(function()
                    local trans = hitboxheadtransparency
                    for i, v in validcharacters do
                        local primpart = v and _FindFirstChild(v, 'Torso')
                        if primpart then
                            primpart.Size = hbsize
                            primpart.Transparency = trans
                            primpart.CanCollide = cancollide
                        end
                    end
                end)
            else
                if hbc then hbc:Disconnect() end
                for i, v in validcharacters do
                    local primpart = v and _FindFirstChild(v, 'Torso')
                    if primpart then
                        primpart.Size = original_size
                        primpart.Transparency = 0
                        primpart.CanCollide = true
                    end
                end
            end
        end
    })
    hbb:AddToggle('hitbox_cancollide',{Text = 'can collide',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddSlider('hitbox_head_transparency', { Text = 'transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(State)
        hitboxheadtransparency = State
    end)
    hbb:AddSlider('hitbox_head_size_x', { Text = 'size x', Default = 10, Min = 1, Max = 1000, Rounding = 1, Compact = false }):OnChanged(function(State)
        hitboxheadsizex = State
        hbsize = _Vector3new(hitboxheadsizex, hitboxheadsizey, hitboxheadsizex)
    end)
    hbb:AddSlider('hitbox_head_size_y', { Text = 'size y', Default = 10, Min = 1, Max = 25, Rounding = 1, Compact = false }):OnChanged(function(State)
        hitboxheadsizey = State
        hbsize = _Vector3new(hitboxheadsizex, hitboxheadsizey, hitboxheadsizex)
    end)
end
do
    local espb = ui.box.esp:AddTab("player esp")
    local es = cheat.EspLibrary.settings.enemy
    espb:AddDropdown('espfont', {Values = { 'UI', 'System', 'Plex', 'Monospace' },Default = 1,Multi = false,Text = 'esp font',Tooltip = 'select font',Callback = function(Value)
        cheat.EspLibrary.main_settings.textFont = Drawing.Fonts[Value]
        cheat.EspLibrary.icaca()
    end})
    espb:AddSlider('espfontsize', { Text = 'esp font size', Default = 13, Min = 1, Max = 30, Rounding = 0, Compact = true }):OnChanged(function(State)
        cheat.EspLibrary.main_settings.textSize = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddToggle('espsimplecalc', {
        Text = 'simpler corner calc (fps)',
        Default = false,
        Callback = function(first)
            cheat.EspLibrary.main_settings.simplecalc = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espswitch', {
        Text = 'enable esp',
        Default = false,
        Callback = function(first)
            es.enabled = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espteamswitch', {
        Text = 'team/ai check',
        Default = false,
        Callback = function(first)
            cheat.EspLibrary.main_settings.teamcheck = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espsleeperswitch', {
        Text = 'sleeper check',
        Default = false,
        Callback = function(first)
            cheat.EspLibrary.main_settings.sleepcheck = first
            cheat.EspLibrary.icaca()
        end
    })
    ----------------------------------------------------------
    espb:AddToggle('espbox', {
        Text = 'box esp',
        Default = false,
        Callback = function(first)
            es.box = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espboxcolor', {
        Default = Color3.new(1, 1, 1),
        Title = 'box color',
        Transparency = 0,
        Callback = function(Value)
            es.box_color[1] = Value
            cheat.EspLibrary.icaca()
        end
    })
    ---
    espb:AddToggle('espboxfill', {
        Text = 'box fill',
        Default = false,
        Callback = function(first)
            es.box_fill = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espboxfillcolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'box fill color',
            Transparency = 0,
            Callback = function(Value)
                es.box_fill_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    ---
    espb:AddToggle('espoutlinebox', {
        Text = 'box outline',
        Default = false,
        Callback = function(first)
            es.box_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espboxoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'box outline color',
            Transparency = 0,
            Callback = function(Value)
                es.box_outline_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    ---
    espb:AddSlider('espboxtransparency',
        { Text = 'box transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.box_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    espb:AddSlider('espoutlineboxtransparency',
        { Text = 'box outline transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.box_outline_color[2] = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddSlider('espboxfilltransparency',
        { Text = 'box fill transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.box_fill_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ----------------------------------------------------------
    espb:AddToggle('esprealname', {
        Text = 'name esp',
        Default = false,
        Callback = function(first)
            es.realname = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('esprealnamecolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'name color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('esprealnametransparency',
        { Text = 'name transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.realname_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ---
    espb:AddToggle('esprealnameoutline', {
        Text = 'name outline',
        Default = false,
        Callback = function(first)
            es.realname_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('esprealnameoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'name outline color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })

    ----------------------------------------------------------
    espb:AddToggle('espdistance', {
        Text = 'distance esp',
        Default = false,
        Callback = function(first)
            es.dist = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espdistancecolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'distance color',
            Transparency = 0,
            Callback = function(Value)
                es.dist_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('espdistancetransparency',
        { Text = 'distance transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.dist_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ---
    espb:AddToggle('espdistanceoutline', {
        Text = 'distance outline',
        Default = false,
        Callback = function(first)
            es.dist_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espdistanceoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'distance outline color',
            Transparency = 0,
            Callback = function(Value)
                es.dist_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })
    ----------------------------------------------------------
    espb:AddToggle('espweapon', {
        Text = 'weapon esp',
        Default = false,
        Callback = function(first)
            es.weapon = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espweaponcolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'weapon color',
            Transparency = 0,
            Callback = function(Value)
                es.weapon_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('espweapontransparency',
        { Text = 'weapon transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.weapon_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ---
    espb:AddToggle('espweaponoutline', {
        Text = 'weapon outline',
        Default = false,
        Callback = function(first)
            es.weapon_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espweaponoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'weapon outline color',
            Transparency = 0,
            Callback = function(Value)
                es.weapon_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })
    ----------------------------------------------------------
    espb:AddToggle('espskeleton', {Text = 'skeleton esp',Default = false,Callback = function(first)
        es.skeleton = first
        cheat.EspLibrary.icaca()
    end}):AddColorPicker('espskeletoncolor', {Default = Color3.new(1, 1, 1),Title = 'skeleton color',Transparency = 0,Callback = function(Value)
        es.skeleton_color[1] = Value
        cheat.EspLibrary.icaca()
    end})
    espb:AddSlider('espskeletontransparency', { Text = 'skeleton transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(State)
        es.skeleton_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ----------------------------------------------------------
    espb:AddToggle('espchams', {
        Text = 'chams',
        Default = false,
        Callback = function(first)
            es.chams = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espchamsvisibleonly', {
        Text = 'chams visible only',
        Default = false,
        Callback = function(first)
            es.chams_visible_only = first
            cheat.EspLibrary.icaca()
        end
    })
    ---
    espb:AddLabel("chams fill color"):AddColorPicker('espchamsfillcolor',
        {
            Default = Color3.new(),
            Title = 'chams fill color',
            Transparency = 0,
            Callback = function(Value)
                es.chams_fill_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddLabel("chams outline color"):AddColorPicker('espchamsoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'chams outline color',
            Transparency = 0,
            Callback = function(Value)
                es.chamsoutline_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    ---
    espb:AddSlider('espchamsfilltransparency',
        { Text = 'fill transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.chams_fill_color[2] = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddSlider('espchamsoutlinetransparency',
        { Text = 'outline transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.chamsoutline_color[2] = State
        cheat.EspLibrary.icaca()
    end)
    ----------------------------------------------------------
end
do
    local espb = ui.box.esp:AddTab("object esp")
    local es = cheat.EspLibrary.settings.object
    espb:AddDropdown('objectespfont', {Values = { 'UI', 'System', 'Plex', 'Monospace' },Default = 1,Multi = false,Text = 'esp font',Tooltip = 'select font',Callback = function(Value)
        cheat.EspLibrary.main_object_settings.textFont = Drawing.Fonts[Value]
        cheat.EspLibrary.icaca()
    end})
    espb:AddSlider('objectespfontsize', { Text = 'esp font size', Default = 13, Min = 1, Max = 30, Rounding = 0, Compact = true }):OnChanged(function(State)
        cheat.EspLibrary.main_object_settings.textSize = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddDropdown('objectespallowed', {Values = {
        'ATV', 'Stone', 'Nitrate', 'Iron', 'Backpack',
        'Tree1', 'Tree2', 'Tree3', 'Tree4',
        'TeslaPylon', 'GasTrap', 'ClaimTotem'
    },Default = 0,Multi = true,Text = 'objects',Tooltip = 'select objects thats gonna show up',Callback = function(Value)
        cheat.EspLibrary.main_object_settings.allowed = Value
        cheat.EspLibrary.icaca()
    end})
    espb:AddToggle('objectespswitch', {
        Text = 'enable esp',
        Default = false,
        Callback = function(first)
            es.enabled = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('objectespallswitch', {
        Text = 'esp on fucking everything apparently????',
        Default = false,
        Callback = function(first)
            es.allenabled = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('objectesprealname', {
        Text = 'name esp',
        Default = false,
        Callback = function(first)
            es.realname = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('objectesprealnamecolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'name color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('objectesprealnametransparency',
        { Text = 'name transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.realname_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    espb:AddToggle('objectesprealnameoutline', {
        Text = 'name outline',
        Default = false,
        Callback = function(first)
            es.realname_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('objectesprealnameoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'name outline color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })
end
local canuseimages = pcall(function()
    cheat.utility.new_drawing("Image", {}):Remove()
end) and pcall(function()
    local a = cheat.utility.new_drawing("Image", {})
    rawget(a, "_frame").Image = ""
    a:Remove()
end)
do
    local enabled, dynamic = false, false;
    local color1, color2 = Color3.new(1,1,1), Color3.new();
    local watermarktab = ui.box.cheatvis:AddTab("watermark")
    local watermarktoggle = watermarktab:AddToggle('watermark_enabled', {Text = 'enabled',Default = false,Callback = function(first)
        enabled = first
    end})
    watermarktoggle:AddColorPicker('watermark_color1',{Default = Color3.new(),Title = canuseimages and 'color left' or 'color',Transparency = 0,Callback = function(Value)
        color1 = Value
        if not canuseimages then color2 = Value end
    end})
    if canuseimages then watermarktoggle:AddColorPicker('watermark_color2',{Default = Color3.new(),Title = 'color right',Transparency = 0,Callback = function(Value)
        color2 = Value
    end}); end
    watermarktab:AddToggle('watermark_rainbowcolor', {Text = 'rainbow',Default = false,Callback = function(first)
        dynamic = first
    end})
    local leftcolor, rightcolor, watertext = 
    Color3.new(0.000000, 0.666667, 0.333333), 
    Color3.new(0.349020, 0.000000, 1.000000),
    "swimhub.xyz canary | Jul 28 2024 | fps: 63 ";
    local waterpos = Vector2.new(10, 10);
    local text = cheat.utility.new_drawing("Text", {
        ZIndex = 4,
        Visible = true,
        Transparency = 1,
        Position = waterpos + Vector2.new(6, 5),
        Color = Color3.new(1, 1, 1),
        Outline = true,
        OutlineColor = Color3.new(),
        Font = 0,
        Size = 14,
        Text = watertext
    });
    local gradr, gradl = cheat.utility.new_drawing(canuseimages and "Image" or "Square", {
        ZIndex = 2,
        Visible = true,
        Transparency = 1,
        Position = waterpos,
        Size = Vector2.new(text.TextBounds.X + 10, text.TextBounds.Y + 10),
        Color = rightcolor
    }), cheat.utility.new_drawing(canuseimages and "Image" or "Square", {
        ZIndex = 2,
        Visible = true,
        Transparency = 1,
        Position = waterpos,
        Size = Vector2.new(text.TextBounds.X + 10, text.TextBounds.Y + 10),
        Color = leftcolor
    });
    local gradbackground = cheat.utility.new_drawing("Square", {
        ZIndex = 1,
        Visible = true,
        Transparency = 1,
        Position = waterpos,
        Size = Vector2.new(text.TextBounds.X + 10, text.TextBounds.Y + 10),
        Color = leftcolor:Lerp(rightcolor, 0.5),
        Filled = true
    });
    local textbackground = cheat.utility.new_drawing("Square", {
        ZIndex = 3,
        Visible = true,
        Transparency = 0.337,
        Position = waterpos + Vector2.new(2, 2),
        Size = Vector2.new(text.TextBounds.X + 6, text.TextBounds.Y + 6),
        Color = Color3.new(0,0,0),
        Filled = true,
        Thickness = 0,
    });
    if canuseimages then rawget(gradr, "_frame").Image = getcustomasset("swimhub/new/files/grad90r.png"); end
    if canuseimages then rawget(gradl, "_frame").Image = getcustomasset("swimhub/new/files/grad90l.png"); end
    local hue1, hue2, fpstimer, fps, finalfps = 0, 0.15, tick(), 0, 60;
    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        fps = fps + 1;
        if fpstimer + 1 <= tick() then
            fpstimer = tick();
            finalfps = fps;
            fps = 0;
        end;
        hue1, hue2 = tick() % 1, tick() % 1 + 0.15;
        if hue1 >= 1 then hue1 = 0 end if hue2 >= 1 then hue2 = 0 end
        rightcolor = dynamic and Color3.fromHSV(hue1, 1, 1) or color2;
        leftcolor = dynamic and Color3.fromHSV(hue2, 1, 1) or color1;
        watertext = ("swimhub %s | %s | %s | %s fps"):format(SWG_Version, SWG_ShortName, os.date("%b %d %Y"), tostring(finalfps));
        gradr.Color = rightcolor;
        gradl.Color = leftcolor;
        gradbackground.Color = gradr.Color:Lerp(gradl.Color, 0.5);
        textbackground.Size = Vector2.new(text.TextBounds.X + 7, text.TextBounds.Y + 6);
        textbackground.Position = waterpos + Vector2.new(2, 2);
        gradbackground.Size = Vector2.new(text.TextBounds.X + 11, text.TextBounds.Y + 10);
        gradbackground.Position = waterpos;
        gradl.Position = waterpos;
        gradl.Size = Vector2.new(text.TextBounds.X + 11, text.TextBounds.Y + 10);
        gradr.Position = waterpos;
        gradr.Size = Vector2.new(text.TextBounds.X + 11, text.TextBounds.Y + 10);
        text.Position = waterpos + Vector2.new(6, 5);
        text.Text = watertext;

        text.Visible = enabled;
        gradl.Visible = enabled;
        gradr.Visible = enabled;
        gradbackground.Visible = enabled;
        textbackground.Visible = enabled;
    end))
end
do

    local WorldTab = ui.box.world:AddTab("world visuals")
    local gradientenabled = false
    local gradientcolor1 = Color3.fromRGB(90, 90, 90)
    local gradientcolor2 = Color3.fromRGB(150, 150, 150)
    local time = 12
    local timechanger = false
    local nofog = false
    local noshadows = false
    WorldTab:AddToggle('enabletimechanger', {Text = 'enable time changer',Default = false,Callback = function(first)
        timechanger = first
    end})
    WorldTab:AddSlider('timechanger',{ Text = 'time changer', Default = mathround(Lighting.ClockTime), Min = 0, Max = 24, Rounding = 1, Compact = false }):OnChanged(function(State)
        time = State
    end)
    WorldTab:AddToggle('ambientswitch', {Text = 'enable ambient',Default = false,Callback = function(first)
        gradientenabled = first
    end}):AddColorPicker('ambientcolor', {Default = Color3.new(1, 1, 1),Title = 'ambient color1',Transparency = 0,Callback = function(Value)
        gradientcolor1 = Value
    end}):AddColorPicker('ambientcolor1',{Default = Color3.new(1, 1, 1),Title = 'ambient color2',Transparency = 0,Callback = function(Value)
        gradientcolor2 = Value
    end})
    WorldTab:AddToggle('grassswitch', {
        Text = 'no grass',
        Default = false,
        Callback = function(first)
            sethiddenproperty(_FindFirstChildOfClass(workspace, "Terrain"), "Decoration", not first)
        end
    })
    WorldTab:AddToggle('fogswitch', {
        Text = 'no fog',
        Default = false,
        Callback = function(first)
            nofog = first
        end
    })
    WorldTab:AddToggle('shadowswitch', {
        Text = 'no shadows',
        Default = false,
        Callback = function(first)
            noshadows = first
        end
    })
    cheat.utility.new_heartbeat(function()
        Lighting.GlobalShadows = not noshadows
        if gradientenabled then
            Lighting.Ambient = gradientcolor1
            Lighting.OutdoorAmbient = gradientcolor2
        end
        if timechanger then
            Lighting.ClockTime = time
        end
        Lighting.FogEnd = nofog and math.huge or 900
        Lighting.FogStart = nofog and math.huge or 0
    end)
end

do
    local cursor = {
        Enabled = false,
        CustomPos = false,
        Position = _Vector2new(0, 0),
        Speed = 5,
        Radius = 25,
        Color = Color3.fromRGB(180, 50, 255),
        Thickness = 1.7,
        Outline = false,
        Resize = false,
        Dot = false,
        Gap = 10,
        TheGap = false,
        Font = Drawing.Fonts.Monospace,
        Text = {
            Logo = false,
            LogoColor = Color3.new(1, 1, 1),
            Name = false,
            NameColor = Color3.new(1, 1, 1),
            LogoFadingOffset = 0,
        }
    }
    local CrosshairTab = ui.box.world:AddTab("crosshair")
    cursor.rainbow = false
    cursor.sussy = false
    CrosshairTab:AddDropdown('espfont', {Values = { 'UI', 'System', 'Plex', 'Monospace' },Default = 1,Multi = false,Text = 'esp font',Tooltip = 'select font',Callback = function(Value)
        cursor.Font = Drawing.Fonts[Value]
    end})
    CrosshairTab:AddToggle('crosshairenable', {Text = 'enable crosshair',Default = false,Callback = function(first)
        cursor.Enabled = first
    end}):AddColorPicker('crosshaircolor', {Default = Color3.new(1, 1, 1),Title = 'crosshair color',Transparency = 0,Callback = function(Value)
        cursor.Color = Value
    end})
    CrosshairTab:AddSlider('crosshairspeed', {Text = 'speed',Default = 3,Min = 0.1,Max = 15,Rounding = 1,Compact = true}):OnChanged(function(State)
        cursor.Speed = State / 10
    end)
    CrosshairTab:AddSlider('crosshairradius', {Text = 'radius',Default = 25,Min = 0.1,Max = 100,Rounding = 1,Compact = true,}):OnChanged(function(State)
        cursor.Radius = State
    end)
    CrosshairTab:AddSlider('crosshairthickness', {Text = 'thickness',Default = 1.5,Min = 0.1,Max = 10,Rounding = 1,Compact = true,}):OnChanged(function(State)
        cursor.Thickness = State
    end)
    CrosshairTab:AddSlider('crosshairgapsize', {Text = 'gap',Default = 5,Min = 0,Max = 50,Rounding = 1,Compact = true,}):OnChanged(function(State)
        cursor.Gap = State
    end)
    CrosshairTab:AddToggle('crosshairenablegap', {Text = 'math divide gap',Default = false,Callback = function(first)
        cursor.TheGap = first
    end})
    CrosshairTab:AddToggle('crosshairenableoutline', {Text = 'outline',Default = false,Callback = function(first)
        cursor.Outline = first
    end})
    CrosshairTab:AddToggle('crosshairenableresize', {Text = 'resize animation',Default = false,Callback = function(first)
        cursor.Resize = first
    end})
    CrosshairTab:AddToggle('crosshairenabledot', {Text = 'dot',Default = false,Callback = function(first)
        cursor.Dot = first
    end})
    CrosshairTab:AddToggle('crosshairenablenazi', {Text = 'sussy',Default = false,Callback = function(first)
        cursor.sussy = first
        end})
        CrosshairTab:AddToggle('crosshairenablefaggot', {Text = 'rainbow',Default = false,Callback = function(first)
        cursor.rainbow = first
    end})
    CrosshairTab:AddToggle('crosshairtextLogo', {Text = 'text logo',Default = false,Callback = function(first)
        cursor.Text.Logo = first
    end}):AddColorPicker('crosshairlogocolor', {Default = Color3.new(1, 1, 1),Title = 'logo color',Transparency = 0,Callback = function(Value)
        cursor.Text.LogoColor = Value
    end})
    CrosshairTab:AddToggle('crosshairtextName', {Text = 'text name',Default = false,Callback = function(first)
        cursor.Text.Name = first
    end}):AddColorPicker('crosshairtextcolor', {Default = Color3.new(1, 1, 1),Title = 'text color',Transparency = 0,Callback = function(Value)
        cursor.Text.NameColor = Value
    end})
    CrosshairTab:AddSlider('crosshairlogooffset', {Text = 'logo fade offset',Default = 0,Min = 0,Max = 5,Rounding = 1,Compact = true}):OnChanged(function(State)
        cursor.Text.LogoFadingOffset = State
    end)

    -- // Initilisation
    local lines = {}
    -- // Drawings
    local outline = cheat.utility.new_drawing("Square", {
        Visible = true,
        Size = _Vector2new(4, 4),
        Color = Color3.fromRGB(0, 0, 0),
        Filled = true,
        ZIndex = 1,
        Transparency = 1
    })
    --
    local dot = cheat.utility.new_drawing("Square", {
        Visible = true,
        Size = _Vector2new(2, 2),
        Color = cursor.Color,
        Filled = true,
        ZIndex = 2,
        Transparency = 1
    })
    --
    local logotext = cheat.utility.new_drawing("Text", {
        Visible = false,
        Font = cursor.Font,
        Size = 13,
        Color = Color3.fromRGB(138, 128, 255),
        ZIndex = 3,
        Transparency = 1,
        Text = "swimhub.xyz",
        Center = true,
        Outline = true,
    })
    local indicatortext = cheat.utility.new_drawing("Text", {
        Visible = false,
        Font = cursor.Font,
        Size = 13,
        Color = Color3.new(1, 1, 1),
        ZIndex = 3,
        Transparency = 1,
        Text = "",
        Center = true,
        Outline = true,
    })
    --
    for i = 1, 4 do
        local line_outline = cheat.utility.new_drawing("Line", {
            Visible = true,
            From = _Vector2new(200, 500),
            To = _Vector2new(200, 500),
            Color = Color3.fromRGB(0, 0, 0),
            Thickness = cursor.Thickness + 2.5,
            ZIndex = 1,
            Transparency = 1
        })
        local line = cheat.utility.new_drawing("Line", {
            Visible = true,
            From = _Vector2new(200, 500),
            To = _Vector2new(200, 500),
            Color = cursor.Color,
            Thickness = cursor.Thickness,
            ZIndex = 2,
            Transparency = 1
        })
        local naziline = cheat.utility.new_drawing("Line", {
            Visible = true,
            From = _Vector2new(200, 500),
            To = _Vector2new(200, 500),
            Color = cursor.Color,
            Thickness = cursor.Thickness,
            ZIndex = 2,
            Transparency = 1
        })
        lines[i] = { line, line_outline, naziline }
    end
    local angle = 0
    local transp = 0
    local reverse = false
    local function setreverse(value)
        if reverse ~= value then
            reverse = value
        end
    end
    --
    local pos, rainbow, rotationdegree, color = Vector2.zero, 0, 0, Color3.new()
    local math_cos, math_atan, math_pi, math_sin = math.cos, math.atan, math.pi, math.sin
    local function DEG2RAD(x) return x * math_pi / 180 end
    local function RAD2DEG(x) return x * 180 / math_pi end
    cheat.utility.new_renderstepped(LPH_NO_VIRTUALIZE(function(delta)
        if cursor.Enabled then
            rainbow = rainbow + (delta * 0.5)
            if rainbow > 1.0 then rainbow = 0.0 end
            color = Color3.fromHSV(rainbow, 1, 1)
            if cursor.CustomPos then pos = cursor.Position else pos = _Vector2new(
                Mouse.X,
                Mouse.Y + GuiInset.Y) end
            if cursor.rainbow then color = Color3.fromHSV(rainbow, 1, 1) else color = cursor.Color end
            if transp <= 1.5 + cursor.Text.LogoFadingOffset and not reverse then
                transp = transp + (((cursor.Speed == 0 and 1 or cursor.Speed) * 10) * delta)
                if transp >= 1.5 + cursor.Text.LogoFadingOffset then setreverse(true) end
            elseif reverse then
                transp = transp - (((cursor.Speed == 0 and 1 or cursor.Speed) * 10) * delta)
                if transp <= 0 - cursor.Text.LogoFadingOffset then setreverse(false) end
            end
            logotext.Position = _Vector2new(pos.X, (pos + _Vector2new(0, cursor.Radius + 5)).Y)
            logotext.Transparency = transp
            logotext.Visible = cursor.Text.Logo
            logotext.Color = cursor.Text.LogoColor
            logotext.Font = cursor.Font
            --
            indicatortext.Position = _Vector2new(pos.X, (pos + _Vector2new(0, cursor.Radius + (cursor.Text.Logo and 19 or 5))).Y)
            indicatortext.Visible = modulecomm.indicator
            indicatortext.Color = cursor.Text.NameColor
            indicatortext.Font = cursor.Font
            indicatortext.Text = modulecomm.indicator_text

            if cursor.sussy then
                local frametime = delta
                local a = cursor.Radius - 10
                local gamma = math_atan(a / a)

                if rotationdegree >= 90 then rotationdegree = 0 end

                for i = 1, 4 do
                    local p_0 = (a * math_sin(DEG2RAD(rotationdegree + (i * 90))))
                    local p_1 = (a * math_cos(DEG2RAD(rotationdegree + (i * 90))))
                    local p_2 = ((a / math_cos(gamma)) * math_sin(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
                    local p_3 = ((a / math_cos(gamma)) * math_cos(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))


                    lines[i][1].From = _Vector2new(pos.X, pos.Y)
                    lines[i][1].To = _Vector2new(pos.X + p_0, pos.Y - p_1)
                    lines[i][1].Color = color
                    lines[i][1].Thickness = cursor.Thickness
                    lines[i][1].Visible = true
                    lines[i][3].From = _Vector2new(pos.X + p_0, pos.Y - p_1)
                    lines[i][3].To = _Vector2new(pos.X + p_2, pos.Y - p_3)
                    lines[i][3].Color = color
                    lines[i][3].Thickness = cursor.Thickness
                    lines[i][3].Visible = true
                end
                rotationdegree = rotationdegree + ((cursor.Speed * frametime) * 1000)
            else
                angle = (cursor.Speed == 0 and 0 or angle + ((cursor.Speed * 10) * delta))

                if angle >= 90 then
                    angle = 0
                end

                --
                dot.Visible = cursor.Dot
                dot.Color = color
                dot.Position = _Vector2new(pos.X - 1, pos.Y - 1)
                --
                outline.Visible = cursor.Outline and cursor.Dot
                outline.Position = _Vector2new(pos.X - 2, pos.Y - 2)
                --

                --
                for index, line in pairs(lines) do
                    index = index
                    local x, y = {}, {}
                    local x1, y1 = {}, {}
                    if cursor.Resize then
                        x = { pos.X +
                        (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius + ((cursor.Radius * math.sin(angle)) / 9))),
                            pos.X +
                            (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and (((cursor.Radius - 20) * math.cos(angle)) / 4) or (((cursor.Radius - 20) * math.cos(angle)) - 4)))) }
                        y = { pos.Y +
                        (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius + ((cursor.Radius * math.sin(angle)) / 9))),
                            pos.Y +
                            (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and (((cursor.Radius - 20) * math.cos(angle)) / 4) or (((cursor.Radius - 20) * math.cos(angle)) - 4)))) }
                        x1 = { pos.X + (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .X +
                        (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                        y1 = { pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .Y +
                        (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                    else
                        x = { pos.X + (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius)), pos.X +
                        (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and ((cursor.Radius - 20) / cursor.Gap) or ((cursor.Radius - 20) - cursor.Gap)))) }
                        y = { pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius)), pos.Y +
                        (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and ((cursor.Radius - 20) / cursor.Gap) or ((cursor.Radius - 20) - cursor.Gap)))) }
                        x1 = { pos.X + (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .X +
                        (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                        y1 = { pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .Y +
                        (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                    end
                    --
                    line[1].Visible = true
                    line[1].Color = color
                    line[1].From = _Vector2new(x[2], y[2])
                    line[1].To = _Vector2new(x[1], y[1])
                    line[1].Thickness = cursor.Thickness
                    --
                    line[2].Visible = cursor.Outline
                    line[2].From = _Vector2new(x1[2], y1[2])
                    line[2].To = _Vector2new(x1[1], y1[1])
                    line[2].Thickness = cursor.Thickness + 2.5

                    line[3].Visible = false
                end
            end
        else
            dot.Visible = false
            outline.Visible = false
            logotext.Visible = false
            indicatortext.Visible = false
            --
            for index, line in pairs(lines) do
                line[1].Visible = false
                line[2].Visible = false
                line[3].Visible = false
            end
        end
    end))
end

do
    local mvb = ui.box.move:AddTab('speedhack')
    local bhop_enabled, bhop_silent, bhop_silent_enabled, speed = false, false, false, 55
    local downcliff_mode, downcliff_start, downcliff_speed, downcliff_accel, downcliff_fall, downcliff_up = false, 50, 150, 50, 50, 50
    local jetpackabuse, abuseupspeed, abusedownspeed = false, 55, 0
    local forcesprint = false
    local slidin = false
    mvb:AddToggle('speedhack_forcesprint', {Text = 'forcesprint',Default = false,Callback = function(first)
        forcesprint = first
    end})
    if SWG_Private then
        mvb:AddToggle('jetpackabuse', {Text = 'jetpack abuse',Default = false,Callback = function(first)
            jetpackabuse = first
        end}):AddKeyPicker('jetpackabuse_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'jetpack abuse',NoUI = false})
        mvb:AddSlider('jetpackabuse_upspeed',{ Text = 'up speed', Default = 55, Min = 10, Max = 500, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
            abuseupspeed = State
        end)
        mvb:AddSlider('jetpackabuse_downspeed',{ Text = 'down speed', Default = 55, Min = 10, Max = 500, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
            abusedownspeed = State
        end)
        mvb:AddLabel("hold space to go up")
        mvb:AddLabel("hold shift to go down")
    else
        mvb:AddLabel("jetpack abuse: private only")
    end
    mvb:AddToggle('speedhack_enabled', {Text = 'speedhack enabled',Default = false,Callback = function(first)
        bhop_enabled = first
    end})
    mvb:AddSlider('speedhack_speed',{ Text = 'speed', Default = 55, Min = 55, Max = 70, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddLabel("hold shift and C to speed")
    mvb:AddToggle('downcliff_mode',{ Text = 'downcliff mode',Default = false,Callback = function(first)
        downcliff_mode = first
    end})
    mvb:AddSlider('downcliff_accel',{ Text = 'acceleration', Default = 55, Min = 1, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        downcliff_accel = State
    end)
    mvb:AddSlider('downcliff_fall',{ Text = 'fall speed', Default = 55, Min = 10, Max = 200, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        downcliff_fall = State
    end)
    mvb:AddSlider('downcliff_up',{ Text = 'up speed', Default = 55, Min = 10, Max = 200, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        downcliff_up = State
    end)
    mvb:AddLabel("hold space to go up")
    
    local middle = workspace.Const.Ignore.LocalCharacter.Middle
    local bottom = workspace.Const.Ignore.LocalCharacter.Bottom
    local top = workspace.Const.Ignore.LocalCharacter.Top
    local characterparams = RaycastParams.new()
    characterparams.IgnoreWater = true
    characterparams.FilterDescendantsInstances = { workspace.Const.Ignore }
    characterparams.FilterType = Enum.RaycastFilterType.Exclude
    characterparams.RespectCanCollide = true

    local niga, wtf = speed, 0
    local dc_buildup, dc_oldpos = downcliff_speed, middle.Position

    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        local shiftpressed = _IsKeyDown(UserInputService, Enum.KeyCode.LeftShift)
        local cpressed = _IsKeyDown(UserInputService, Enum.KeyCode.C)
        local spacedown = _IsKeyDown(UserInputService, Enum.KeyCode.Space)
        local cameralook = Camera.CFrame.LookVector
        local direction if middle and (cpressed or spacedown or shiftpressed or forcesprint or jetpackabuse) then
            local neutralized_look = _Vector3new(cameralook.X, 0, cameralook.Z).Unit
            direction = Vector3.zero
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + neutralized_look or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - neutralized_look or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- neutralized_look.Z, 0, neutralized_look.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(neutralized_look.Z, 0, - neutralized_look.X) or direction;
        end
        if bhop_silent then return end
        if bhop_enabled and not downcliff_mode and middle and cpressed and shiftpressed then
            if not (direction == Vector3.zero) then
                direction = direction.Unit
            end
            niga = math.clamp(niga-delta*20, 17, speed)
            if wtf == 0 then
                local tpcf, mdcf, bmcf = top.CFrame, middle.CFrame, bottom.CFrame
                middle.CFrame = mdcf + _Vector3new(0, 6, 0)
                bottom.CFrame = bmcf + _Vector3new(0, 6, 0)
                top.CFrame = tpcf + _Vector3new(0, 6, 0)
            end
            middle.AssemblyLinearVelocity = (direction * niga) + (Vector3.yAxis * (wtf < 0.85 and 0 or -7))
            bottom.AssemblyLinearVelocity = (direction * niga) + (Vector3.yAxis * (wtf < 0.85 and 0 or -7))
            top.AssemblyLinearVelocity = (direction * niga) + (Vector3.yAxis * (wtf < 0.85 and 0 or -7))
            wtf = wtf + delta
        elseif bhop_enabled and downcliff_mode and middle and cpressed and shiftpressed then
            if not (direction == Vector3.zero) then
                direction = direction.Unit
            end

            --[[
            middle.AssemblyLinearVelocity = (direction * dc_buildup) + (Vector3.yAxis * -(spacedown and 7 or downcliff_fall))
            bottom.AssemblyLinearVelocity = (direction * dc_buildup) + (Vector3.yAxis * -(spacedown and 7 or downcliff_fall))
            top.AssemblyLinearVelocity = (direction * dc_buildup) + (Vector3.yAxis * -(spacedown and 7 or downcliff_fall))

            dc_buildup = math.clamp(dc_buildup + (downcliff_accel * (math.abs(dc_oldpos.Y - middle.Position.Y) / 0.15) - 50 - (spacedown and 7 or 0)) * delta, 17, 300)
            dc_oldpos = middle.Position
            ]]

            local wattasigma = middle.Position
            local speed_dir = direction * dc_buildup * delta
            local verticalrc = _Raycast(workspace, wattasigma, -Vector3.yAxis * 20, characterparams)
            local horizontalrc = _Raycast(workspace, verticalrc and verticalrc.Position or wattasigma, speed_dir, characterparams)

            print(horizontalrc, vecrticalrc)
            print(horizontalrc and horizontalrc.Position, vecrticalrc and vecrticalrc.Position)

            dc_buildup = math.clamp(vecrticalrc and dc_buildup + downcliff_accel * math.abs(wattasigma.Y - verticalrc.Position.Y) or dc_buildup - delta * 30 , 17, 250)
            
            if horizontalrc or verticalrc then
                local middle_pos = (horizontalrc or verticalrc).Position + Vector3.yAxis * 1.5
                local bottom_offset = bottom.Position - middle_pos
                local top_offset = top.Position  - middle_pos
                middle.CFrame = _CFramenew(middle_pos)
                bottom.CFrame = _CFramenew(middle_pos + bottom_offset)
                top.CFrame = _CFramenew(middle_pos + top_offset)
                middle.AssemblyLinearVelocity = Vector3.zero --(direction * dc_buildup)
                bottom.AssemblyLinearVelocity = Vector3.zero --(direction * dc_buildup)
                top.AssemblyLinearVelocity = Vector3.zero --(direction * dc_buildup)
            else
                middle.AssemblyLinearVelocity = (direction * dc_buildup) + (Vector3.yAxis * -7)
                bottom.AssemblyLinearVelocity = (direction * dc_buildup) + (Vector3.yAxis * -7)
                top.AssemblyLinearVelocity = (direction * dc_buildup) + (Vector3.yAxis * -7)
            end

            --[[
            if spacedown and wtf == 0 then
                local tpcf, mdcf, bmcf = top.CFrame, middle.CFrame, bottom.CFrame
                middle.CFrame = mdcf + _Vector3new(0, 6, 0)
                bottom.CFrame = bmcf + _Vector3new(0, 6, 0)
                top.CFrame = tpcf + _Vector3new(0, 6, 0)
                wtf = wtf + delta
            end
            dc_buildup = math.clamp(spacedown and dc_buildup-delta*25 or dc_buildup+delta*downcliff_accel, 17, 250)
            middle.AssemblyLinearVelocity = _Vector3new(
                direction.X * dc_buildup,
                spacedown and -7 or -downcliff_fall,
                direction.Z * dc_buildup
            )
            bottom.AssemblyLinearVelocity = _Vector3new(
                direction.X * dc_buildup,
                spacedown and -7 or -downcliff_fall,
                direction.Z * dc_buildup
            )
            top.AssemblyLinearVelocity = _Vector3new(
                direction.X * dc_buildup,
                spacedown and -7 or -downcliff_fall,
                direction.Z * dc_buildup
            )]]
        elseif jetpackabuse and middle then
            if not (direction == Vector3.zero) then
                direction = direction.Unit
            end
            local yvelo = spacedown and abuseupspeed or shiftpressed and -abusedownspeed or (not shiftpressed and not spacedown) and 0
            middle.AssemblyLinearVelocity = _Vector3new(
                direction.X * 18,
                yvelo,
                direction.Z * 18
            )
            top.AssemblyLinearVelocity = _Vector3new(
                direction.X * 18,
                yvelo,
                direction.Z * 18
            )
            bottom.AssemblyLinearVelocity = _Vector3new(
                direction.X * 18,
                yvelo,
                direction.Z * 18
            )
        else
            if forcesprint and middle then
                if not (direction == Vector3.zero) then
                    direction = direction.Unit
                end
                middle.AssemblyLinearVelocity = _Vector3new(
                    direction.X * 18,
                    middle.AssemblyLinearVelocity.Y,
                    direction.Z * 18
                )
            end
            niga = speed
            dc_buildup = 55
            dc_oldpos = middle.Position
            wtf = 0
        end
    end))
end

do
    local mvb = ui.box.move:AddTab('exploits')
    local enabled, speed, part = false, 55, "bottom"
    mvb:AddToggle('desync_enabled', {Text = 'desync enabled',Default = false,Callback = function(first)
        modulecomm.invis = first
    end}):AddKeyPicker('desyncbind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'desync',NoUI = false})
    mvb:AddToggle('velocitybreaker', {Text = 'velocity breaker',Default = false,Callback = function(first)
        modulecomm.velobreak = first
    end}):AddKeyPicker('velocitybreakerbind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'velocity breaker',NoUI = false})
    mvb:AddSlider('velocitybreaker_strenght',{ Text = 'strenght', Default = 6, Min = 0, Max = 20, Rounding = 1, Suffix = "s", Compact = false }):OnChanged(function(State)
        modulecomm.velobreakstrenght = State
    end)
    mvb:AddToggle('silentwalk_enabled', {Text = 'silent walking',Default = false,Callback = function(first)
        modulecomm.silentwalk = first
        if first then trident.tcp:FireServer(2, true) end
    end}):AddKeyPicker('silentwalk_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'silent walk',NoUI = false})
    local freecamoffset = Vector3.zero
    local middle = workspace.Const.Ignore.LocalCharacter.Middle
    local bottom = workspace.Const.Ignore.LocalCharacter.Bottom
    local top = workspace.Const.Ignore.LocalCharacter.Top
    local mdpos, bmpos, tppos = middle.CFrame, bottom.CFrame, top.CFrame
    mvb:AddToggle('freecam_enabled', {Text = 'freecam enabled',Default = false,Callback = function(first)
        enabled = first
        middle.CanCollide = not first
        bottom.CanCollide = not first
        top.CanCollide = not first
    end}):AddKeyPicker('freecam_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'freecam',NoUI = false})
    mvb:AddSlider('freecam_speed',{ Text = 'speed', Default = 10, Min = 1, Max = 150, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddDropdown('freecam_part', {Values={"middle", "bottom", "top"},Default = 1,Multi = false,Text = 'freecam part',Callback=function(Value)
        part = Value
    end})
    mvb:AddToggle('silentaim_extended', {Text = 'fakelag',Default = false,Callback = function(Value)
        modulecomm.extended_manipulation = Value
    end}):AddKeyPicker('fakelag_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'fakelag',NoUI = false})
    mvb:AddToggle('infiniteunregtechnique', {Text = 'infinite register technique',Default = false,Callback = function(first)
        modulecomm.infiniteregister = first
    end})
    cheat.utility.new_heartbeat(LPH_JIT_MAX(function(delta)
        if enabled and middle then
            if part == "middle" then middle.CFrame = mdpos end
            if part == "bottom" then bottom.CFrame = bmpos end
            if part == "top" then top.CFrame = tppos end
            RunService.RenderStepped:Wait()
            if middle then
                local cameralook = Camera.CFrame.LookVector
                local direction = Vector3.zero
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
                if not direction == Vector3.zero then
                    direction = direction.Unit
                end
                freecamoffset = freecamoffset + (direction * delta * speed)
                if part == "middle" then middle.CFrame = mdpos + freecamoffset end
                if part == "bottom" then bottom.CFrame = bmpos + freecamoffset end
                if part == "top" then top.CFrame = tppos + freecamoffset end
                middle.AssemblyLinearVelocity = Vector3.zero
                bottom.AssemblyLinearVelocity = Vector3.zero
                top.AssemblyLinearVelocity = Vector3.zero
            end
        elseif middle then
            freecamoffset = Vector3.zero
            mdpos, bmpos, tppos = middle.CFrame, bottom.CFrame, top.CFrame
        end
    end))
end

do
    local mvb = ui.box.atvfly:AddTab('atv fly')
    local carfly_enabled, speed, accel, upspeed = false, 55, 100, 200
    mvb:AddToggle('carfly_enabled', {Text = 'car fly enabled',Default = false,Callback = function(first)
        carfly_enabled = first
    end}):AddKeyPicker('carfly_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'car fly bind',NoUI = false})
    mvb:AddSlider('carfly_speed',{ Text = 'speed', Default = 150, Min = 50, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddSlider('carfly_upspeed',{ Text = 'up speed', Default = 15, Min = 5, Max = 30, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        upspeed = State
    end)
    mvb:AddSlider('carfly_accel',{ Text = 'acceleration', Default = 100, Min = 10, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        accel = State
    end)
    mvb:AddLabel("hold V to go up")
    mvb:AddLabel("hold B to go down")
    local car, dist = nil, 50
    local findcar = function()
        car, dist = nil, 50
        for i,v in pairs(workspace:GetChildren()) do
            if _FindFirstChild(v, "Seat") and _FindFirstChild(v, "Frame") then
                if (v.Frame.Position - trident.middlepart.Position).Magnitude < dist then
                    car = v
                    dist = (v.Frame.Position - trident.middlepart.Position).Magnitude
                end
            end
        end
    end
    findcar()
    local buildup = 0
    local lastdir = _Vector3new(1,0,0)
    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        if carfly_enabled and car and _FindFirstChild(car, "Frame") and (car.Frame.CFrame.p - Camera.CFrame.p).Magnitude <= 50 then
            local cameralook = Camera.CFrame.LookVector
            cameralook = _Vector3new(cameralook.X, 0, cameralook.Z)
            local direction = Vector3.zero
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.V) and direction + Vector3.yAxis or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.B) and direction - Vector3.yAxis or direction;
            if direction ~= Vector3.zero then
                direction = direction.Unit
                if direction ~= _Vector3new(0, 1, 0) then
                    buildup = math.clamp(buildup + delta * accel, 0, speed)
                    lastdir = direction
                end
            else
                direction = lastdir
                buildup = math.clamp(buildup - delta * 100, 0, speed)
            end
            for i,v in pairs(car:GetChildren()) do
                v.AssemblyLinearVelocity = _Vector3new(direction.X * buildup, direction.Y * upspeed, direction.Z * buildup)
                --v.AssemblyLinearVelocity = direction * SPEED + _Vector3new(0, 0.05, 0)
                --v.CFrame = _CFramenew(v.CFrame.Position) * CFrame.Angles(0, y+(math.pi/2), 0)
            end
        elseif not car or car and car:FindFirstChild("Frame") and (car.Frame.CFrame.p - Camera.CFrame.p).Magnitude > 50 then
            findcar()
            buildup = 0
        else
            buildup = 0
        end
    end))
    --[=[
    local mvb = ui.box.atvfly:AddTab('vehicle fly')
    local carfly_enabled, speed, accel, upspeed = false, 55, 100, 15
    mvb:AddToggle('carfly_enabled', {Text = 'vehicle fly enabled',Default = false,Callback = function(first)
        carfly_enabled = first
    end}):AddKeyPicker('carfly_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'vehicle fly',NoUI = false})
    mvb:AddSlider('carfly_speed',{ Text = 'speed', Default = 150, Min = 50, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddSlider('carfly_upspeed',{ Text = 'up speed', Default = 15, Min = 5, Max = 100, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        upspeed = State
    end)
    mvb:AddSlider('carfly_accel',{ Text = 'acceleration', Default = 100, Min = 10, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        accel = State
    end)
    mvb:AddLabel("hold V to go up")
    mvb:AddLabel("hold B to go down")
    local car, carpart, dist = nil, nil, 50
    local findcar = function()
        car, dist = nil, 50
        for i,v in pairs(workspace:GetChildren()) do
            local temp_part = (_FindFirstChild(v, "Seat") and _FindFirstChild(v, "Frame")) or (_FindFirstChild(v, "Seats") and _FindFirstChild(v, "Hull"))
            if temp_part and (temp_part.Position - trident.middlepart.Position).Magnitude < dist then
                car = v
                carpart = temp_part
                dist = (carpart.Position - trident.middlepart.Position).Magnitude
            end
        end
    end
    findcar()
    local buildup = 0
    local lastdir = _Vector3new(1,0,0)
    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        if carfly_enabled and car and carpart and (carpart.CFrame.p - Camera.CFrame.p).Magnitude <= 50 then
            local cameralook = Camera.CFrame.LookVector
            cameralook = _Vector3new(cameralook.X, 0, cameralook.Z)
            local direction = Vector3.zero
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.V) and direction + Vector3.yAxis or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.B) and direction - Vector3.yAxis or direction;
            if direction ~= Vector3.zero then
                direction = direction.Unit
                if direction ~= Vector3.yAxis and -direction ~= Vector3.yAxis then
                    buildup = math.clamp(buildup + delta * accel, 0, speed)
                    lastdir = direction
                end
            else
                direction = lastdir
                buildup = math.clamp(buildup - delta * 150, 0, speed)
            end
            carpart.AssemblyLinearVelocity = _Vector3new(direction.X * buildup, direction.Y * upspeed, direction.Z * buildup)
            --v.AssemblyLinearVelocity = direction * SPEED + _Vector3new(0, 0.05, 0)
            --v.CFrame = _CFramenew(v.CFrame.Position) * CFrame.Angles(0, y+(math.pi/2), 0)
        elseif not carpart or car and carpart and (carpart.CFrame.p - Camera.CFrame.p).Magnitude > 50 then
            findcar()
            buildup = 0
        else
            buildup = 0
        end
    end))
    ]=]
end
loadswimhubfile("chat_spam.lua")(cheat.Library, ui.box.misc:AddTab("chat spam"), function(word)
    trident.tcp:FireServer(23, word, "Global")
end, 35, 150)
do
    local noatvrestriction = false
    local charactermod = ui.box.misc:AddTab("atv mods")
    charactermod:AddToggle('noatvrestriction', {Text = 'no atv restriction',Default = false,Callback = function(first)
        noatvrestriction = first
    end})
    do
        --cartripmode = "side", -- "none", "left", "right", "front", "back", "zero"
        --caryaw = "none" -- none, spin, custom
        local aaset = modulecomm.antiaim
        charactermod:AddToggle('antiaim_carenabled', {Text = 'car antiaim',Default = false,Callback = function(first)
            aaset.car = first
        end})
        charactermod:AddDropdown('antiaim_cartrip', {Values={"none", "zero"},Default = 1,Multi = false,Text = 'trip mode',Callback=function(Value)
            aaset.cartripmode = Value
        end})
        charactermod:AddDropdown('antiaim_caryaw', {Values={"none", "spin", "invisible1", "invisible2", "invisible3"},Default = 1,Multi = false,Text = 'car yaw',Callback=function(Value)
            aaset.caryaw = Value
        end})
        do
            local aadepbox = charactermod:AddDependencyBox();
            aadepbox:AddSlider('antiaim_carspinspeed',{Text = 'spin speed (rpm)',Default = 60,Min = 60,Max = 360,Rounding = 0,Compact = true,Callback = function(State)
                aaset.carspinspeed = State
            end})
            aadepbox:SetupDependencies({
                { cheat.Options.antiaim_caryaw, "spin" }
            });
        end
    end
    task.spawn(function()
        while wait() do if noatvrestriction then
            setupvalue(garbage.maxlooky, 1, 10000)
        end end
    end)
end
do
    local real_extended = 0
    local game_Lighting = game:GetService("Lighting")
    local torso_spoofed_index = {
        ["Transparency"] = trident.original_model["Torso"]["Transparency"],
        ["CanCollide"] = trident.original_model["Torso"]["CanCollide"],
        ["Size"] = trident.original_model["Torso"]["Size"]
    }
    local lighting_oldvalues = {
        ["Ambient"] = game_Lighting.Ambient,
        ["OutdoorAmbient"] = game_Lighting.OutdoorAmbient,
        ["FogStart"] = game_Lighting.FogStart,
        ["FogEnd"] = game_Lighting.FogEnd,
        ["GlobalShadows"] = game_Lighting.GlobalShadows,
        ["ClockTime"] = game_Lighting.ClockTime,
        ["TimeOfDay"] = game_Lighting.TimeOfDay
    }
    local __gameindex; __gameindex = hookmetamethod(game, "__index", newcclosure(LPH_NO_VIRTUALIZE(function(self, idx)
        --if checkcaller() then return __gameindex(self, idx) end
        if typeof(self) ~= "Instance" then return __gameindex(self, idx) end
        if (idx == "CanCollide" or idx == "Size" or idx == "Transparency") and self.Name == "Torso" and torso_spoofed_index[idx] then
            return torso_spoofed_index[idx]
        end
        if self == game_Lighting and lighting_oldvalues[idx] then
            return lighting_oldvalues[idx]
        end
        return __gameindex(self, idx)
    end)))
    local __gamenewindex; __gamenewindex = hookmetamethod(game, "__newindex", newcclosure(LPH_NO_VIRTUALIZE(function(self, idx, val)
        --if checkcaller() then return __gamenewindex(self, idx, val) end
        if typeof(self) ~= "Instance" then return __gamenewindex(self, idx, val) end
        if self == game_Lighting then
            lighting_oldvalues[idx] = val
            --return __gamenewindex(self, idx, val)
        end
        return __gamenewindex(self, idx, val)
    end)))
    local __gamenamecall; __gamenamecall = hookmetamethod(game, "__namecall", newcclosure(LPH_NO_VIRTUALIZE(function(self, ...)
        --if checkcaller() then return __gamenamecall(self, ...) end
        if typeof(self) ~= "Instance" then return __gamenamecall(self, ...) end

        local method = getnamecallmethod()
        local args = {...}
        --if method == "Raycast" and modulecomm.simulation_pos and args[3].CollisionGroup == "WeaponRaycast" then
        --    local target = modulecomm.target
        --    if target[1] and target[2] then
        --        local guninfo = trident.guninfo
        --        local proj_speed = guninfo and rawget(guninfo, "ProjectileSpeed")
        --        if guninfo and proj_speed then
        --            return {
        --                Instance = target[1],
        --                Position = target[1].Position,
        --                Normal = Vector3.new(1, 0, 0),
        --                Material = target[1].Material,
        --                Distance = (target[1].Position - args[1]).Magnitude
        --            }
        --        end
        --        return __gamenamecall(self, unpack(args))
        --    end
        --end
        if method == "FireServer" and (self == trident.tcp or self == trident.udp) then
            if args[1] == 46 then
                if typeof(args[3]) == "Vector3" and modulecomm.antiaim.car then
                    local aaset = modulecomm.antiaim
                    local pitch, roll do -- cartripmode = side, -- none, left, right, front, back, zero
                        local tripmode = aaset.cartripmode
                        pitch = (
                            tripmode == "none" and args[4].X or
                            --tripmode == "left" and -1 or
                            --tripmode == "right" and 1 or
                            tripmode == "zero" and 0 or
                            args[4].Y or 0
                        )
                        roll = (
                            tripmode == "none" and args[4].Z or
                            --tripmode == "front" and -1 or
                            --tripmode == "back" and 1 or
                            tripmode == "zero" and 0 or
                            args[4].Z or 0
                        )
                    end
                    local yaw do -- caryaw = "none" -- none, spin
                        local yawset = aaset.caryaw
                        yaw = (
                            yawset == "none" and args[4].Y or
                            yawset == "spin" and (tick() % 1) * ((aaset.carspinspeed / 360) * math.pi) or
                            yaw or 0 -- womp womp
                        )
                    end
                    args[4] = _Vector3new(pitch, yaw, roll)
                end
            end
            if args[1] == 1 then

                real_extended = real_extended + 1

                if real_extended % 2 >= 1 and modulecomm.extended_manipulation then
                    args[5] = nil
                    return __gamenamecall(self, unpack(args))
                end

                if modulecomm.velobreak then
                    if real_extended % 4 == 0 or real_extended % 4 == 2 then
                        args[5] = nil
                    end
                    args[2] = args[2] + (real_extended % 4 == 1 and Vector3.zero or Vector3.yAxis * modulecomm.velobreakstrenght)
                    return __gamenamecall(self, unpack(args))
                end

                if modulecomm.invis then
                    args[5] = nil
                    return __gamenamecall(self, unpack(args))
                end

                ---if modulecomm.jumpshoot or modulecomm.downhill then
                ---    args[5] = 1
                ---end

                trident.lastpos = args[2] + _Vector3new(0, 3, 0)

                if typeof(args[3]) == "Vector3" and modulecomm.antiaim.antiaim then
                    local aaset = modulecomm.antiaim
                    if aaset.antiaimyaw == "invisible" then
                        args[3] = Vector3int16.new(0, math.huge, 0)
                        return __gamenamecall(self, unpack(args))
                    end
                    local pitch do -- antiaimpitch = "none", -- none, down, up, jitter, custom
                        local pitchset = aaset.antiaimpitch
                        pitch = (
                            pitchset == "none" and args[3].Y or
                            pitchset == "down" and -1.5 or
                            pitchset == "up" and 1.5 or
                            pitchset == "jitter" and (real_extended % 2 == 0 and -1.5 or 1.5) * (aaset.pitchjittersize / 90) or
                            pitchset == "custom" and 1.5 * (aaset.pitchcustom / 90) or
                            args[3].Y or 0
                        )
                    end
                    local yaw do -- antiaimyaw = "none", -- none, spin, static, jitter, invisible
                        local yawset = aaset.antiaimyaw
                        yaw = (
                            (yawset == "static" or yawset == "jitter") and 
                            (args[3].X + (math.rad(aaset.yawoffset) - (aaset.backwards and math.pi or 0)))
                        ) or 0
                        yaw = (
                            yawset == "none" and args[3].Y or
                            yawset == "spin" and (tick() % 1) * ((aaset.spinspeed / 360) * math.pi) or
                            --yawset == "invisible" and math.huge or
                            yawset == "jitter" and math.rad((real_extended % 2 == 0 and 1 or -1) * (aaset.yawjittersize / 2)) or
                            yaw or 0 -- womp womp
                            -- for every skid out here, im 14 and i did this math all by myself
                            -- don't ask me the reasons of whys
                            -- except spin
                        )
                    end
                    args[3] = _Vector3new(pitch, yaw, 0)
                end
            end
            if args[1] == 2 and modulecomm.silentwalk then
                return __gamenamecall(self, 2, true)
            end
            if args[1] == 10 then
                if args[2] == "Fire" and typeof(args[4]) == "CFrame" and modulecomm.simulation and modulecomm.simulation_pos then


                    --[[
                        l_NetClient_0.SendTCP(
                            l_SendCodes_0.INV_USE_ITEM,
                            "Fire",
                            projid,
                            cf_origin
                        );
                    ]]
                    --[[
                        l_NetClient_0.SendTCP(
                            l_SendCodes_0.INV_USE_ITEM,
                            "Hit",
                            projid,
                            time,
                            entity.id,
                            raycastres.Instance.Name,
                            raycastres.Position - entity.model.PrimaryPart.Position,
                            raycastres.Position
                        );
                    ]]

                    local target = modulecomm.target
                    local guninfo    = trident.guninfo
                    local proj_speed = guninfo and rawget(guninfo, "ProjectileSpeed")
                    local proj_drop  = guninfo and rawget(guninfo, "ProjectileDrop") or 0
                    if target[1] and target[2] and guninfo and proj_speed then
                        --create_cool_beam(args[4].p, modulecomm.simulation_pos, Color3.new(0,1,0), true)
                        create_cool_beam(args[4].p, target[1].Position, Color3.new(0,1,0), true)
                        args[4] = CFrame.lookAt(
                            args[4].p,
                            modulecomm.simulation_pos +
                            _Vector3new(0, predict_drop_position(modulecomm.simulation_pos, proj_speed, proj_drop, args[4].p), 0)
                        )
                        return __gamenamecall(self, unpack(args))
                    end
                end
                if args[2] == "Hit" and type(args[5]) == "number" and type(args[6]) == "string" and typeof(args[7]) == "Vector3" then
                    local entity = rawget(getupvalue(garbage.entitylist, 1), args[5])
                    local entitymodel = entity and rawget(entity, "model")
                    local entityhead = entitymodel and _FindFirstChild(entitymodel, "Head")
                    if entityhead then

                        if modulecomm.forcehead then args[6] = "Head" end

                        local part = _FindFirstChild(entitymodel, args[6])
                        local originalpart = _FindFirstChild(trident.original_model, args[6])
                        if not (part and originalpart) then return __gamenamecall(self, unpack(args)) end

                        local simpos = modulecomm.simulation_pos

                        if modulecomm.hitboxes or simpos then
                            local primarypart = entitymodel.PrimaryPart
                            local partoffset = part.Position - primarypart.Position
                            args[7] = _Vector3new(
                                math.random(-originalpart.Size.X, originalpart.Size.X),
                                math.random(-originalpart.Size.Y, originalpart.Size.Y),
                                math.random(-originalpart.Size.Z, originalpart.Size.Z)
                            ) + partoffset
                        end
                        if simpos then
                            local target = modulecomm.target
                            local guninfo = trident.guninfo
                            local proj_speed = guninfo and rawget(guninfo, "ProjectileSpeed")
                            local proj_drop  = guninfo and rawget(guninfo, "ProjectileDrop") or 0
                            if not (target[1] and target[2]) then return __gamenamecall(self, unpack(args)) end
                            local drop, time = predict_drop_position(simpos, proj_speed, proj_drop, Camera.CFrame.p)
                            args[4] = (simpos - Camera.CFrame.p).Magnitude / proj_speed
                            args[8] = simpos
                            --create_cool_beam(Camera.CFrame.p, args[8], Color3.new(1,1,1), true)
                            task.spawn(function()
                                task.wait(args[4])
                                self.FireServer(self, unpack(args))
                            end)
                            return
                        end
                    end
                end
            end
            return __gamenamecall(self, unpack(args))
        end
        return __gamenamecall(self, ...)
    end)))
end

ui.box.themeconfig:AddToggle('keybindshoww', {Text = 'show keybinds',Default = false,Callback = function(first)cheat.Library.KeybindFrame.Visible = first end})
cheat.ThemeManager:SetOptionsTEMP(cheat.Options, cheat.Toggles)
cheat.SaveManager:SetOptionsTEMP(cheat.Options, cheat.Toggles)
cheat.ThemeManager:SetLibrary(cheat.Library)
cheat.SaveManager:SetLibrary(cheat.Library)
cheat.SaveManager:IgnoreThemeSettings()
cheat.ThemeManager:SetFolder('swimhub')
cheat.SaveManager:SetFolder('swimhub')
cheat.SaveManager:BuildConfigSection(ui.tabs.config)
cheat.ThemeManager:ApplyToGroupbox(ui.box.themeconfig)

cheat.EspLibrary.load()

--run_on_actor(getactors()[1], source)
