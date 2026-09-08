local cloneref = cloneref or function(i: Instance) return i; end;
local executor = identifyexecutor and identifyexecutor() or "Your executor";
local _ = cloneref(game:GetService("CoreGui"));
local hui = _:FindFirstChild("RobloxGui") or _;
if gethui then local s, r = pcall(gethui); if s then hui = cloneref(r); end; end;

local GS: GuiService = cloneref(game:GetService("GuiService"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));
local LS: LocalizationService = cloneref(game:GetService("LocalizationService"));

local plr = Players.LocalPlayer;
local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local code = function(n: string): string
    if crypt and crypt.base64encode then
        return crypt.base64encode(n);
    end;
    return n;
end;

local get_id = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/FOV_LIBRARY/get_id.luau"))();

local SG = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/NOTIFICATION_LIBRARY/unrestricted_main.luau"))();
local GL = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/GLOBAL_LISTENER_LIBRARY/main.luau"))();
local Drawlib = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/FOV_LIBRARY/main.luau"))();
local info = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/FOV_LIBRARY/info.luau"))();
local discord_link = "https://discord.gg/" .. info.discord_link;
local key = code(info.ggKey);

if executor:match("Xeno", 1) or executor:match("Solara", 1) then
    SG["error"](executor .. " is not compatible with the silent aim!\nSwitch executors!");
    coroutine.yield();
    return function() return; end;
end;

return function(sFOV: number, tFunc: (origin: Vector3?) -> (Model | BasePart)?, mCenter: boolean?)
    SG["info"]("Loading UI...");
    getgenv().sneeky_fov_toggle = true;

    if getgenv()[key] then
        if getgenv()[key]["draw_instance"] and getgenv()[key]["connections"] and getgenv()[key]["p_instance"] then
            getgenv()[key]["draw_instance"]:terminate();
            for _, v in next, getgenv()[key]["connections"] do v:Disconnect(); end;
            table.clear(getgenv()[key]["connections"]);
            getgenv()[key]["p_instance"]:Destroy();
            table.clear(getgenv()[key]);
            getgenv()[key] = nil;
        else
            plr:Kick("Don't tamper with that getgenv key. If you believe this kick a mistake please join the Discord server and report it!\nDiscord Server Link: " .. discord_link);
        end;
    end;

    local draw = Drawlib.new(getgenv().sneeky_fov_size or sFOV, tFunc, mCenter);

    local p = Instance.new("ScreenGui", hui);
    p.Name = code(p:GetDebugId());

    local menu = Instance.new("CanvasGroup", p)
    menu.Name = code(menu:GetDebugId());
    menu.AnchorPoint = Vector2.new(0.5, 0.5);
    menu.Position = UDim2.new(0.5, 0, 0.5, 0);
    menu.Size = UDim2.new(0.3, 0, getgenv().sneeky_fov_size and 0.5 or 0.3, 0);
    menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    menu.BorderMode = Enum.BorderMode.Outline;
    menu.BorderColor3 = Color3.fromRGB(50, 25, 25);
    menu.BorderSizePixel = 3;
    menu.Active = true;
    menu.Draggable = true;
    menu.ClipsDescendants = true;

    --[[local _ = Instance.new("UICorner", menu);
    _.Name = code(_:GetDebugId());
    _.CornerRadius = UDim.new(0.03, 0);

    local __ = Instance.new("UIStroke", menu);
    __.Name = code(__:GetDebugId());
    __.Color = Color3.fromRGB(50, 25, 25);
    __.Thickness = 3;
    __.LineJoinMode = Enum.LineJoinMode.Round;
    __.Transparency = 0;]]

    local external_close = Instance.new("ImageButton", p)
    external_close.Name = code(external_close:GetDebugId());
    external_close.AnchorPoint = Vector2.new(0, 0.5);
    external_close.Position = UDim2.new(0, 0, 0.5, 0);
    external_close.Size = UDim2.new(0, 64, 0, 64);
    external_close.BackgroundTransparency = 1;
    external_close.Image = get_id("close");
    external_close.Visible = GS.MenuIsOpen;

    local top = Instance.new("Frame", menu)
    top.Name = code(top:GetDebugId());
    top.AnchorPoint = Vector2.new(0.5, 0);
    top.Position = UDim2.new(0.5, 0, 0, 0);
    top.Size = UDim2.new(1, 0, 0.5, 0);
    top.BackgroundTransparency = 1;

    local drag = Instance.new("TextLabel", top);
    drag.Name = code(drag:GetDebugId());
    drag.AnchorPoint = Vector2.new(0.5, 0.5);
    drag.Position = UDim2.new(0.5, 0, 0.5, 0);
    drag.Size = UDim2.new(0.3, 0, 0.3, 0);
    drag.BackgroundTransparency = 1;
    drag.TextScaled = true;
    drag.TextColor3 = Color3.new(1, 1, 1);
    drag.Text = info.countryCodes[LS:GetCountryRegionForPlayerAsync(plr)] or "HOLD TO DRAG";

    local logo = Instance.new("ImageButton", top)
    logo.Name = code(logo:GetDebugId());
    logo.Size = UDim2.new(0, 64, 0, 64);
    logo.BackgroundTransparency = 1;
    logo.Image = get_id("logo");

    local internal_close = Instance.new("ImageButton", top)
    internal_close.Name = code(internal_close:GetDebugId());
    internal_close.AnchorPoint = Vector2.new(1, 0);
    internal_close.Position = UDim2.new(1, 0);
    internal_close.Size = UDim2.new(0, 64, 0, 64);
    internal_close.BackgroundTransparency = 1;
    internal_close.Image = get_id("close");

    local bottom = Instance.new("Frame", menu)
    bottom.Name = code(bottom:GetDebugId());
    bottom.AnchorPoint = Vector2.new(0.5, 1);
    bottom.Position = UDim2.new(0.5, 0, 1, 0);
    bottom.Size = UDim2.new(1, 0, 0.5, 0);
    bottom.BackgroundTransparency = 1;

    local link = function()
        if setclipboard then
            setclipboard(discord_link);
            SG["info"]("Discord server link copied to clipboard!");
        else
            SG["info"]("Discord server link: " .. discord_link);
        end;
        loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/NOTIFICATION_LIBRARY/request.luau"))();
    end;

    local e_close = function()
        if GS.MenuIsOpen then
            if not menu.Visible then
                external_close.Visible = true;
            else
                external_close.Visible = false;
            end;
        else
            external_close.Visible = false;
        end;
    end;

    local i_close = function()
        menu.Visible = not menu.Visible;

        if not menu.Visible then
            SG["info"]("UI Menu closed, enter the escape menu and press the X button on the left to reopen the UI Menu.");

            if GS.MenuIsOpen then
                external_close.Visible = true;
            end;
        else
            external_close.Visible = false;
        end;
    end;

    getgenv()[key] = {
        ["draw_instance"] = draw,
        ["connections"] = {
            GS.MenuOpened:Connect(e_close),
            GS.MenuClosed:Connect(e_close),
            external_close.MouseButton1Up:Connect(i_close),
            logo.MouseButton1Up:Connect(link),
            internal_close.MouseButton1Up:Connect(i_close),
            external_close.TouchTap:Connect(i_close),
            logo.TouchTap:Connect(link),
            internal_close.TouchTap:Connect(i_close)
        },
        ["p_instance"] = p
    };

    local configs = {};
    for k: string, v: any in next, getgenv() do
        if k:find("sneeky_", 1, true) then
            local t = type(v);
            -- #"sneeky_" == 7
            local trimmed = k:sub(8):gsub("_", " "):upper();
            if t == "boolean" then
                local toggle = Instance.new("TextButton");
                toggle.Name = code(toggle:GetDebugId());
                toggle.AnchorPoint = Vector2.new(0.5, 0.5);
                toggle.BackgroundColor3 = v and Color3.new(0, 1, 0) or Color3.new(1, 0, 0);
                toggle.TextScaled = true;
                toggle.Text = v and (trimmed .. " Enabled") or (trimmed .. " Disabled");
                do
                    local signal = GL.new(k);
                    getgenv()[key]["connections"][#getgenv()[key]["connections"]+1] = signal:Connect(function(nv)
                        toggle.BackgroundColor3 = nv and Color3.new(0, 1, 0) or Color3.new(1, 0, 0);
                        toggle.Text = nv and (trimmed .. " Enabled") or (trimmed .. " Disabled");
                        if k == "sneeky_fov_toggle" and typeof(nv) == "boolean" then
                            if nv then
                                draw:start();
                            else
                                draw:stop();
                            end;
                        end;
                    end);
                    local _toggle = function()
                        getgenv()[k] = not getgenv()[k];
                    end;
                    getgenv()[key]["connections"][#getgenv()[key]["connections"]+1] = toggle.TouchTap:Connect(_toggle);
                    getgenv()[key]["connections"][#getgenv()[key]["connections"]+1] = toggle.MouseButton1Up:Connect(_toggle);
                end;
                configs[#configs+1] = toggle;
            elseif t == "number" or t == "string" then
                local adjuster = Instance.new("TextBox");
                adjuster.Name = code(adjuster:GetDebugId());
                adjuster.AnchorPoint = Vector2.new(0.5, 0.5);
                adjuster.BorderMode = Enum.BorderMode.Outline;
                adjuster.BorderColor3 = Color3.new(1, 1, 1);
                adjuster.BorderSizePixel = 5;
                adjuster.BackgroundTransparency = 1;
                adjuster.TextScaled = true;
                adjuster.TextColor3 = Color3.new(1, 1, 1);
                adjuster.PlaceholderText = "Enter " .. trimmed .. "...";
                adjuster.Text = trimmed .. ": " .. tostring(v);
                do
                    local signal = GL.new(k);
                    getgenv()[key]["connections"][#getgenv()[key]["connections"]+1] = signal:Connect(function(nv)
                        if k == "sneeky_fov_size" and typeof(nv) == "number" then draw:set(nv); end;
                        adjuster.Text = trimmed .. ": " .. tostring(nv);
                    end);
                    getgenv()[key]["connections"][#getgenv()[key]["connections"]+1] = adjuster.FocusLost:Connect(function(ep)
                        if isMobile or ep then
                            local adjustment = (t == "number" and tonumber or function(_)return _;end--[[tostring]])(adjuster.Text);
                            if adjustment then
                                getgenv()[k] = adjustment;
                            else
                                adjuster.Text = trimmed .. ": " .. tostring(getgenv()[k]);
                            end;
                        end;
                    end);
                end;
                configs[#configs+1] = adjuster;
            end;
        end;
    end;

    local size = 1/#configs;
    local pos = size/2;
    for _, v in next, configs do
        v.Size = UDim2.new(1, 0, size, 0);
        v.Position = UDim2.new(0.5, 0, pos, 0);
        pos+=size;
        v.Parent = bottom;
    end;

    draw:start();
end;
