--[[

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2022-2023 Alexandru Armando Davisca Petrescu
  Röntgengasse 94, 1170 Vienna, Austria
 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.

--]]

while true do
    task.wait(1)
    if game:IsLoaded() and game.PlaceId == 606849621 then
        break
    end
end

local IS_NOT_OBFUSCATED = false
if not LPH_OBFUSCATED then
    warn("ice tray debug")
    IS_NOT_OBFUSCATED = true
end

local player = game:GetService("Players").LocalPlayer
local httpservice = game:GetService("HttpService")
local runservice = game:GetService("RunService")
local repl = game:GetService("ReplicatedStorage")
local coregui = game:GetService("CoreGui")
local textService = game:GetService("TextChatService")

if coregui:FindFirstChild("icetray_key") then
    warn("ice tray key gui was already loaded")
    return false
end

local shouldContinue = false

local function getRequest(url)
    return request({
        Url = url;
        Method = "GET";
    })
end

local function newInstance(instance, data)
    local obj = Instance.new(instance)
    for i,v in next, data do
        if i ~= "Parent" then
            if typeof(v) == "Instance" then
                v.Parent = obj
            else
                obj[i] = v
            end
        end
    end
    obj.Parent = data.Parent
    return obj
end

local function notify(text, duration)
    return require(repl.Game.Notification).new({
        Text = text;
        Duration = duration;
    })
end

local function getKeyInfo(key)
    key = tostring(key)
    if key then
        local verify = getRequest(key)
        return verify
    end
    return false
end

local function validate(key)
    key = tostring(key)
    if not key then
        while true do end
    end
    local newKey = ""
    for i=1, key:len() do
        local byte = key:byte(i)
        if byte then
            local char = string.char(byte)
            if char ~= " " then
                newKey = newKey .. char
            end
        end
    end
    local info = getKeyInfo(newKey)
	if info.Success then
		local body = httpservice:JSONDecode(info.Body)
		if body.valid then
            local success, err = (function()
                shouldContinue = true
                return shouldContinue, x391amdfl
            end)()
            if err then
                return false
            end
            return true
		end
        return false
	end
    return false
end

local function onKeySubmit()
    local gui = coregui:FindFirstChild("icetray_key")
    local textbox = gui.puls.blackbackground.blackbackground2.Down.TextBox
    local validation = validate(textbox.Text)
    if validation then
        gui:Destroy()
    else
        return notify("Invalid key", 10)
    end
end

local link = "https://discord.gg/5Eqt6QBfYY"

local function onLinkRequest()
    setclipboard(link)
    notify("Discord link has been set to clipboard (discord.gg/5Eqt6QBfYY). Find key in #key channel.", 45)
end

local function startUI()
    local lib = newInstance("ScreenGui", {
        Name = "icetray_key";
        Parent = coregui;
        newInstance("Frame", {
            Name = "puls";
            Active = true;
            Draggable = true;
            BackgroundColor3 = Color3.fromRGB(35,35,35);
            BorderColor3 = Color3.fromRGB(25,25,25);
            Position = UDim2.new(0.403486937, 0, 0.281345576, 0);
            Size = UDim2.new(0, 335, 0, 341);
            newInstance("Frame", {
                Name = "blackbackground";
                BackgroundColor3 = Color3.fromRGB(25,25,25);
                BorderColor3 = Color3.fromRGB(40,40,40);
                BorderSizePixel = 0;
                Position = UDim2.new(0.00400062697, 0, 0.00399990566, 0);
                Size = UDim2.new(0, 333, 0, 339);
                newInstance("Frame", {
                    Name = "blackbackground2";
                    BackgroundColor3 = Color3.fromRGB(29,29,29);
                    BorderColor3 = Color3.fromRGB(0,0,0);
                    BorderSizePixel = 0;
                    Position = UDim2.new(0.00200004689, 0, 0.00200011674, 0);
                    Size = UDim2.new(0, 331, 0, 337);
                    newInstance("Frame", {
                        Name = "eboybar";
                        Parent = blackbackground2;
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                        BorderColor3 = Color3.fromRGB(0, 0, 0);
                        BorderSizePixel = 0;
                        Size = UDim2.new(0, 331, 0, 2);
                        newInstance("UIGradient", {
                            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(55, 177, 218)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(235, 93, 183)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(204, 227, 53))};
                        })
                    });
                    newInstance("Frame", {
                        Name = "Button";
                        Parent = blackbackground2;
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                        BackgroundTransparency = 1;
                        BorderColor3 = Color3.fromRGB(0, 0, 0);
                        BorderSizePixel = 0;
                        Position = UDim2.new(0.0725075528, 0, 0.314540058, 0);
                        Size = UDim2.new(0, 282, 0, 85);
                        newInstance("TextButton", {
                            Name = "getKeyButton";
                            Parent = Button;
                            BackgroundColor3 = Color3.fromRGB(31, 31, 31);
                            BorderColor3 = Color3.fromRGB(20, 20, 20);
                            Position = UDim2.new(0.131205678, 0, -0.14164716, 0);
                            Size = UDim2.new(0, 208, 0, 58);
                            Font = Enum.Font.SourceSans;
                            Text = "Join Discord";
                            TextColor3 = Color3.fromRGB(210, 210, 210);
                            TextSize = 17;
                            TextStrokeTransparency = 0.8;
                        })
                    });
                    newInstance("Frame", {
                        Name = "Down";
                        Parent = blackbackground2;
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                        BackgroundTransparency = 1.000;
                        BorderColor3 = Color3.fromRGB(0, 0, 0);
                        BorderSizePixel = 0;
                        Position = UDim2.new(0.0725075528, 0, 0.554896116, 0);
                        Size = UDim2.new(0, 282, 0, 83);
                        newInstance("TextLabel", {
                            Name = "gda";
                            Parent = Down;
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            BackgroundTransparency = 1;
                            BorderColor3 = Color3.fromRGB(0, 0, 0);
                            BorderSizePixel = 0;
                            Position = UDim2.new(0.145390064, 0, -0.337349385, 0);
                            Size = UDim2.new(0, 209, 0, 32);
                            Font = Enum.Font.SourceSans;
                            Text = "You can find the key in the #key channel";
                            TextColor3 = Color3.fromRGB(210, 210, 210);
                            TextSize = 17;
                            TextStrokeTransparency = 0.7;
                        });
                        newInstance("TextBox", {
                            Name = "TextBox";
                            Parent = Down;
                            BackgroundColor3 = Color3.fromRGB(31, 31, 31);
                            BorderColor3 = Color3.fromRGB(20, 20, 20);
                            Position = UDim2.new(0.0886524841, 0, 0.228795066, 0);
                            Size = UDim2.new(0, 233, 0, 40);
                            Font = Enum.Font.SourceSans;
                            PlaceholderText = "Insert Key Here";
                            Text = "";
                            TextColor3 = Color3.fromRGB(200, 200, 200);
                            TextSize = 14;
                        });
                        newInstance("TextButton", {
                            Name = "submit";
                            Parent = Down;
                            BackgroundColor3 = Color3.fromRGB(31, 31, 31);
                            BorderColor3 = Color3.fromRGB(20, 20, 20);
                            Position = UDim2.new(0.131205678, 0, 0.966219604, 0);
                            Size = UDim2.new(0, 208, 0, 50);
                            Font = Enum.Font.SourceSans;
                            Text = "Submit";
                            TextColor3 = Color3.fromRGB(210, 210, 210);
                            TextSize = 17;
                            TextStrokeTransparency = 0.8;
                        });
                    });
                    newInstance("Frame", {
                        Name = "Label";
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                        BackgroundTransparency = 1;
                        BorderColor3 = Color3.fromRGB(0, 0, 0);
                        BorderSizePixel = 0;
                        Position = UDim2.new(0.0725075528, 0, 0.0593471825, 0);
                        Size = UDim2.new(0, 282, 0, 83);
                        newInstance("TextLabel", {
                            Name = "gda";
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            BackgroundTransparency = 1;
                            BorderColor3 = Color3.fromRGB(0, 0, 0);
                            BorderSizePixel = 0;
                            Position = UDim2.new(0.0283687934, 0, 0.0240963846, 0);
                            Size = UDim2.new(0, 275, 0, 32);
                            Font = Enum.Font.SourceSans;
                            Text = "Please provide a key to run ice tray v3";
                            TextColor3 = Color3.fromRGB(210, 210, 210);
                            TextSize = 19;
                            TextStrokeTransparency = 0.7;
                        });
                        newInstance("TextLabel", {
                            Name = "ajdf";
                            Parent = Label;
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            BackgroundTransparency = 1;
                            BorderColor3 = Color3.fromRGB(0, 0, 0);
                            BorderSizePixel = 0;
                            Position = UDim2.new(0.145390064, 0, 0.409638554, 0);
                            Size = UDim2.new(0, 209, 0, 32);
                            Font = Enum.Font.SourceSans;
                            Text = "Press the button below to get the link to the key";
                            TextColor3 = Color3.fromRGB(210, 210, 210);
                            TextSize = 16;
                            TextStrokeTransparency = 0.7;
                        })
                    });
                });
            })
        });
    })
    lib.puls.blackbackground.blackbackground2.Down.submit.MouseButton1Down:connect(onKeySubmit)
    lib.puls.blackbackground.blackbackground2.Button.getKeyButton.MouseButton1Down:connect(onLinkRequest)
end

startUI()

while true do
    if shouldContinue then
        break
    end
    task.wait()
end

local player = game:GetService("Players").LocalPlayer
local runservice = game:GetService("RunService")
local repl = game:GetService("ReplicatedStorage")

local function http_request(url)
    local request = request or syn and syn.request
    return request({
        Url = url;
        Method = "GET";
    })
end

local uuid = tostring(require(repl.Module.Math).GUID())
script.Name = uuid

local function ON_LOADUP()
    local function ON_VERSION_REQUEST()
        getrenv()._version = "3.14.6"
        if IS_NOT_OBFUSCATED then
        getrenv().debug_version = true
        end
    end
    ON_VERSION_REQUEST()
    local function ON_SERVER_CONNECT()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/piglex9/icetray3/main/src/ui.lua"))()
    end
    ON_SERVER_CONNECT()
end
ON_LOADUP()

getrenv().env = getrenv()
env.icetray = global or {}
env.IS_WORKING = true
env.CONNECTIONS = 1
env.request = request or syn and syn.request
env.discord_code = "5Eqt6QBfYY" -- 5Eqt6QBfYY
env.coregui = game:GetService("CoreGui")

while true do
    if coregui:FindFirstChild("ice tray v3") then
        getrenv().uistatus = false
        break
    end
    getrenv().uistatus = true
    task.wait()
end

local function force_destroy_coregui(bool)
    assert(bool==true, "requires bool value to be true")
    local icetray = coregui:FindFirstChild("ice tray v3")
    if icetray then
        icetray:Destroy()
        return player:Kick("Lost connection to ice tray (Executor missing function, F9 for more info)")
    end
end

local client = {}
local meta = {
    __index = function(t, k)
        warn(("Could not find key `%s`"):format(k))
    end;
}
setmetatable(client, meta)

local function icetrayload()
    local function executionIdentifier()
        local executor = identifyexecutor()
        global.getExecutor = executor
        global.exploit = executor == "Synapse X" and "synx" or executor == "ScriptWare" and "sw" or "unsupported" 
        global.version = _version
    end
    executionIdentifier()
    local function createRegistry()
        client.modules = {
            math = require(repl.Module.Math);
            roact = require(repl.Roact);
            rayCast = require(repl.Module.RayCast);
            bulletEmitter = require(repl.Game.ItemSystem.BulletEmitter);
            notify = require(repl.Game.Notification).new;
            contextMsg = require(repl.Game.ContextMessage.ContextMessageUI);
            worldMarker = require(repl.Game.WorldMarker.WorldMarker);
            system = require(repl.Game.WorldMarker.WorldMarkerSystem);
            group = require(repl.Game.WorldMarker.WorldMarkerGroup);
            cmdr = require(repl.CmdrClient);
            equipConditions = require(repl.Inventory.InventoryItemSystem)._equipConditions;
            crawlButton = require(repl.Game.DefaultActions).crawlButton;
            fallingInit = require(repl.Game.Falling).Init;
            falling = require(repl.Game.Falling);
            playerMarkerSystem = require(repl.Game.PlayerMarkerSystem);
            vehicle = require(repl.Vehicle.VehicleUtils);
            settings = require(repl.Resource.Settings);
            itemSystem = require(repl.Game.ItemSystem.ItemSystem);
            inventoryItemSystem = require(repl.Inventory.InventoryItemSystem);
            gun = require(repl.Game.Item.Gun);
            taser = require(repl.Game.Item.Taser);
            robberyConsts = require(repl.Robbery.RobberyConsts);
            puzzleFlow = require(repl.Game.Robbery.PuzzleFlow);
            ui = require(repl.Module.UI);
            playerUtils = require(repl.Game.PlayerUtils);
            tagUtils = require(repl.Tag.TagUtils);
            smoke = require(repl.Game.SmokeGrenade.SmokeGrenade);
            localization = require(repl.Module.Localization);
            characterAnim = require(repl.Game.CharacterAnim);
            characterUtil = require(repl.Game.CharacterUtil);
            paraglide = require(repl.Game.Paraglide);
            region = require(repl.Std.Region);
            defaultActions = require(repl.Game.DefaultActions);
            actionButtonService = require(repl.ActionButton.ActionButtonService);
            inventoryItemUtils = require(repl.Inventory.InventoryItemUtils);
            jetpack = require(repl.Game.JetPack.JetPack);
            guardNPCshared = require(repl.GuardNPC.GuardNPCShared);
            worldUnloadConsts = require(repl.WorldUnload.WorldUnloadConsts);
            humanoidUnloadConsts = require(repl.HumanoidUnload.HumanoidUnloadConsts);
            gamepassSystem = require(repl.Game.Gamepass.GamepassSystem);
            piston = require(repl.Game.Robbery.PowerPlant.Piston);
            dartDispenser = require(repl.Game.DartDispenser.DartDispenser);
            itemCamera = require(repl.Game.ItemSystem.ItemCamera);
            sniper = require(repl.Game.Item.Sniper);
            militaryTurret = require(repl.Game.MilitaryTurret.MilitaryTurret);
            bossNpcBinder = require(repl.MansionRobbery.BossNPCBinder);
            cargoShipTurret = require(repl.Game.Robbery.CargoShip.Turret);
            lightningSystem = require(repl.Game.LightningSystem);
            confirmation = require(repl.Module.Confirmation);
            hotbarItemSystem = require(repl.Hotbar.HotbarItemSystem);
            hotbarItemUtils = require(repl.Hotbar.HotbarItemUtils);
            party = require(repl.Game.Party);
            geomUtils = require(repl.Std.GeomUtils);
            vehicleLinkUtils = require(repl.VehicleLink.VehicleLinkUtils);
            loadingBar = require(repl.Game.LoadingBar);
            mansionRobberyUtils = require(repl.MansionRobbery.MansionRobberyUtils);
            regionUtils = require(repl.Std.Region.RegionUtils);
            displayDamage = require(repl.Game.DisplayDamage);
            minimapService = require(repl.App.MinimapService);
            jet = require(repl.Game.Plane.Jet);
            stunt = require(repl.Game.Plane.Stunt);
            boat = require(repl.Game.Boat.Boat);
            seekingMissileUtils = require(repl.SeekingMissile.SeekingMissileUtils);
            volt = require(repl.Game.Vehicle.Volt);
            alexChassis2 = require(repl.Module.AlexChassis2);
            charBinder = require(repl.App.CharacterBinder);
            trainSystem = require(repl.Game.TrainSystem);
            store = require(repl.App.store);
            tooltipData = require(repl.Tooltip.TooltipData);
        }
        client.confirmation = {
            confirmed = {};
        }
        client.players = {}
        client.descendants = {
            givers = workspace.Givers:GetChildren();
            vehicles = workspace.Vehicles;
        }
        client.onWorkspaceSpawnRun = {};
        client.reg = {}
        client.state = {}
        client.waypoints = {
            bank = "Bank";
            jewelry = "Jewelry";
            museum = "Museum";
            tomb = "Tomb";
            casino = "Casino";
            powerplant = "Powerplant";
            mansion = "Mansion";
            bounty_bay_airport = "Bounty Bay Airport (Cargoplane)";
            donut_store = "Donut Store";
            gas_station = "Gas Station";
            criminal_base_city = "City Criminal Base";
            criminal_base_volcano = "Volcano Criminal Base";
            crater_city_airport = "Crater City Airport";
            cargo_port = "Cargoport";
            prison = "Prison";
            military_base = "Military Base";
            fire_station = "Fire Station";
            gun_store_city = "City Gun Store";
            gun_store_mountainside = "Mountainside Gun Store";
            gun_store_cratercity = "Crater City Gun Store";
        }
        client.gamelocations = {
            criminal_base_city = Vector3.new(-241.04759216308594, 18.26566505432129, 1603.2467041015625);
            cargo_port = Vector3.new(-346.10906982421875, 21.265666961669922, 2051.884521484375);
            powerplant = Vector3.new(73.05872344970703, 21.26565933227539, 2330.603271484375);
            bounty_bay_airport = Vector3.new(-1280.7972412109375, 41.57174301147461, 2862.231689453125);
            museum = Vector3.new(1039.164306640625, 101.80693054199219, 1220.47412109375);
            gun_store_city = Vector3.new(387.13153076171875, 18.565671920776367, 519.4755859375);
            bank = Vector3.new(-11.083830833435059, 18.56781768798828, 785.1068115234375);
            jewelry = Vector3.new(90.18016815185547, 18.265535354614258, 1360.61181640625);
            gas_station = Vector3.new(-1563.6400146484375, 18.398113250732422, 709.526123046875);
            prison = Vector3.new(-1178.06005859375, 18.359729766845703, -1408.713134765625);
            donut_store = Vector3.new(93.99942016601562, 19.21782684326172, -1520.624755859375);
            dog_store = Vector3.new(254.4175567626953, 19.61784553527832, -1625.93212890625);
            gun_store_mountainside = Vector3.new(-9.677970886230469, 19.21782684326172, -1771.1429443359375);
            tomb = Vector3.new(557.5381469726562, 25.799976348876953, -490.9645080566406);
            military_base = Vector3.new(673.5711669921875, 19.318540573120117, -3615.018310546875);
            casino = Vector3.new(-301.520751953125, 19.817184448242188, -4661.919921875);
            crater_city_airport = Vector3.new(-854.0402221679688, 19.67174530029297, -4898.408203125);
            gun_store_cratercity = Vector3.new(-482.135986328125, 19.853652954101562, -5663.77197265625);
            fire_station = Vector3.new(-317.110107421875, 19.904991149902344, -5394.2763671875);
            mansion = Vector3.new(3087.748779296875, 62.8889274597168, -4604.91748046875);
            criminal_base_volcano = Vector3.new(2204.335205078125, 19.55750274658203, -2654.022216796875);
        }
        local function addPlayersToTable()
            for i,v in next, players:GetPlayers() do
                if v ~= player then
                    table.insert(client.players, v)
                end
            end
        end
        addPlayersToTable()
        local function onPlayerAdded(player)
            table.insert(client.players, player)
        end
        players.PlayerAdded:connect(onPlayerAdded)
        local function onPlayerRemoving(player)
            for i=1, #client.players do
                local v = client.players[i]
                if v == player then
                    table.remove(client.players, i)
                    break
                end
            end
        end
        players.PlayerRemoving:connect(onPlayerRemoving)
        function client.confirmation.new(text)
            local confirmation = client.modules.confirmation.new(text)
            return confirmation
        end
        function client.confirmation.onYes(confirmation, onYes)
            confirmation.OnYes:Connect(onYes)
        end
        function client.confirmation.onNo(confirmation, onNo)
            confirmation.OnNo:Connect(onNo)
        end
        for i,v in next, client.gamelocations do
            player:RequestStreamAroundAsync(v)
        end
        global.registry = {
            client = client;
            doors = {};
            doors_garbageCollected = {};
            cellDoors = {};
            doorsOpener_garbageCollected = nil;
            sounds = {};
        }
        global.ignorelist = {}
        local function notify(text, duration)
            return client.modules.notify({
                Text = text;
                Duration = duration or 0;
            })
        end
        global.notify = notify
        local function ContextMessage()
            local contextMessageModule = client.modules.contextMsg
            client.contextModule = {
                open = contextMessageModule.open;
                close = contextMessageModule.close;
                setmsg = contextMessageModule.setMessage;
                status = contextMessageModule.isOpen;
            }
        end
        ContextMessage()
    end
    createRegistry()
    local function send_console_developer(text)
        local Cmdr = client.modules.cmdr
        if not Cmdr then
            force_destroy_coregui(true)
            return false
        end
        return Cmdr.Events.AddLine(("ICETRAY3 : %s"):format(tostring(text)))
    end
    send_console_developer("beginning icetrayload")
    local function synfunction()
        local function unsupported(func, isDebugLibrary)
            local msg = ("Tried to run %s but this function is not supported by your exploit")
            if isDebugLibrary then
                warn(msg:format("debug."..tostring(func)))
                return function() end
            end
            warn(msg:format(tostring(func)))
            return function() end
        end
        global.functions = {
            getreg = debug.getregistry or getreg or unsupported("getregistry", true);
            getupvalues = debug.getupvalues or unsupported("getupvalues", true);
            getconstants = debug.getconstants or unsupported("getconstants", true);
            setconstant = debug.setconstant or unsupported("setconstant", true);
            getupvalue = debug.getupvalue or unsupported("getupvalue", true);
            setupvalue = debug.setupvalue or unsupported("setupvalue", true);
            getrawmetatable = getrawmetatable or unsupported("getrawmetatable");
            setreadonly = setreadonly or make_writeable or unsupported("make_writeable");
            newcclosure = newcclosure or unsupported("newcclosure");
            setclipboard = setclipboard or unsupported("setclipboard");
            islclosure = islclosure or unsupported("islclosure");
            setscriptable = setscriptable or unsupported("setscriptable");
            isnetworkowner = isnetworkowner or unsupported("isnetworkowner");
            is_synapse_function = is_synapse_function or is_oxygen_function or iskrnlclosure or isexecutorclosure or checkclosure or unsupported("is_synapse_function");
            firetouchinterest = firetouchinterest or unsupported("firetouchinterest");
            fireclickdetector = fireclickdetector or unsupported("fireclickdetector");
            getconnections = getconnections or unsupported("getconnections");
            sethiddenproperty = sethiddenproperty or unsupported("sethiddenproperty");
            getsynasset = getsynasset or getcustomasset or unsupported("getsynasset");
            writefile = writefile or unsupported("writefile");
            readfile = readfile or unsupported("readfile");
            appendfile = appendfile or unsupported("appendfile");
            makefolder = makefolder or unsupported("makefolder");
            isfile = isfile or unsupported("isfile");
            isfolder = isfolder or unsupported("isfolder");
            decompile = decompile or function() return "nu exista decompiler pe acest executor" end;
        }
    end
    local function tagService()
        local function tagStorage()
            local inst = Instance.new("Folder")
            inst.Name = "tagService"
            if IS_NOT_OBFUSCATED then
                inst.Parent = repl
                warn("tagService folder is in ReplicatedStorage")
            end
            return inst
        end
        local tags = {}
        tags.storage = tagStorage()
        tags.tags = {
            BoolValue = 0;
            NumberValue = 1;
            StringValue = 2;
            BrickColorValue = 3;
            CFrameValue = 4;
            Color3Value = 5;
            IntValue = 6;
            ObjectValue = 7;
            RayValue = 8;
            Vector3Value = 9;
        }
        local tags_module = {}
        function tags_module.getTag(num)
            num = tonumber(num)
            for i,v in next, client.tags.tags do
                if v == num then
                    return i
                end
            end
            return false
        end
        tags.module = tags_module
        tags.cache = {}
        function tags.new(name, tip, defaultValue, callback)
            name = tostring(name)
            local getTag = client.tags.module.getTag(tip)
            if not getTag then
                error(("cannot make tag `%s`"):format(name))
            end
            local cache = {}
            local inst = Instance.new(getTag)
            inst.Name = name
            inst.Parent = client.tags.storage
            inst.Value = defaultValue
            inst.Changed:connect(function()
                cache.obj = inst
                cache.value = inst.Value
                return callback(inst.Value)
            end)
            cache.name = name
            cache.obj = inst
            cache.value = inst.Value
            table.insert(tags.cache, cache)
            return cache
        end
        function tags.getTagByName(self, name)
            local cache = self.cache
            for i,v in next, cache do
                if v and v.name == name then
                    return v
                end
            end
            return false
        end
        client.tags = tags
    end
    local function createfiles()
        local writefile = global.functions.writefile
        local appendfile = global.functions.appendfile
        local makefolder = global.functions.makefolder
        local isfile = global.functions.isfile
        local isfolder = global.functions.isfolder
        local isIcetrayFolder = isfolder("icetray3")
        if not isIcetrayFolder then
            makefolder("icetray3")
        end
        local isResourceFolder = isfolder("icetray3/resource")
        if not isResourceFolder then
            makefolder("icetray3/resource")
        end
        local isConfigurationFolder = isfolder("icetray3/config")    
        if not isConfigurationFolder then
            makefolder("icetray3/config")
        end
        local function files()
            send_console_developer("loading resource")
            local function makeResources()
                local function httpGet(url)
                    return game:HttpGet(url)
                end
                if not isfile("icetray3/resource/airdrop.png") then
                    writefile("icetray3/resource/airdrop.png", httpGet("https://img001.prntscr.com/file/img001/CxPl0JU6SyyrHhMyL5NEhw.png"))
                end
                if not isfile("icetray3/resource/football.png") then
                    writefile("icetray3/resource/football.png", httpGet("https://img001.prntscr.com/file/img001/RAhMFSwkRyCglvAtWrJbVQ.png"))
                end
                if not isfile("icetray3/resource/robot.png") then
                    writefile("icetray3/resource/robot.png", httpGet("https://img001.prntscr.com/file/img001/HDrYpapySqKS52X3BIMdHA.png"))
                end
            end
            makeResources()
            send_console_developer("resource loaded")
        end
        files()
        send_console_developer("files loaded")
    end
    local function serviceloop()
        function global.createloop(seconds, callback)
            return interval.every(tonumber(seconds)):connect(callback)
        end
    end
    synfunction()
    createfiles()
    tagService()
    serviceloop()
    local function GET_EXTERNALS()
        return "-xsd-1.>>->>>la"
    end
    GET_EXTERNALS()
    send_console_developer("ended icetrayload")
    global.registry.log = send_console_developer
end

if LPH_OBFUSCATED then
    local isLoaded, err = pcall(icetrayload)
    if not isLoaded then
        print("LOADER ERROR")
        task.delay(2, function()
            while true do end
        end)
        return player:Kick("Lost connection to ice tray. Loader Error.") 
    end
else
    icetrayload()
end

local createloop = global.createloop
local getreg = global.functions.getreg
local getupvalues = global.functions.getupvalues
local getconstants = global.functions.getconstants
local setconstant = global.functions.setconstant
local getupvalue = global.functions.getupvalue
local setupvalue = global.functions.setupvalue
local getrawmetatable = global.functions.getrawmetatable
local setreadonly = global.functions.setreadonly
local newcclosure = global.functions.newcclosure
local setclipboard = global.functions.setclipboard
local islclosure = global.functions.islclosure
local setscriptable = global.functions.setscriptable
local isnetworkowner = global.functions.isnetworkowner
local is_synapse_function = global.functions.is_synapse_function
local firetouchinterest = global.functions.firetouchinterest
local fireclickdetector = global.functions.fireclickdetector
local getconnections = global.functions.getconnections
local sethiddenproperty = global.functions.sethiddenproperty
local getsynasset = global.functions.getsynasset

local function loadup()
    local log = global.registry.log
    if not log then
        error("Configuration failure")
    end
    log("starting engine")
    local function ui()
        local window = global.ui.window.tab
        local plr = global.ui.player.tab
        local vehicle = global.ui.vehicle.tab
        local misc = global.ui.misc.tab
        local combat = global.ui.combat.tab
        local markers = global.ui.markers.tab
        local robbery = global.ui.robbery.tab
        local info = global.ui.info.tab
        global.ui_status = {}
        local uiMarker = markers:Section("Marker")
        local uiTeams, teamsSection = markers:Section("Teams")
        local uiObj, objSection = markers:Section("Objects")
        local uiSettings, settingsSection = markers:Section("Settings")
        global.ui.markerSection = {
            teamsSection = teamsSection;
            objSection = objSection;
            settingsSection = settingsSection;
        }
        local sections = {
            WalkSpeed = plr:Section("Walk Speed");
            JumpPower = plr:Section("Jump Power");
            PlayerUtils = plr:Section("Utils");
            PlayerMisc = plr:Section("Misc");
            Marker = uiMarker;
            Teams = uiTeams;
            Objects = uiObj;
            Settings = uiSettings;
            Gunmods = combat:Section("Gun Mods");
            Gunstore = combat:Section("Gun Store");
            Silentaim = combat:Section("Silent Aim");
            Arrestaura = combat:Section("Arrest Aura");
            Waypoints = misc:Section("Waypoints");
            Misc = misc:Section("Misc");
            Prison = misc:Section("Prison");
            BreakVehicles = misc:Section("Break Nearby Vehicles");
            Pickpocket = misc:Section("Pickpocket Aura");
            Eject = misc:Section("Eject Aura");
            Breakout = misc:Section("Breakout Aura");
            Pit = misc:Section("Pit Aura");
            DroppedCash = misc:Section("Dropped Cash Aura");
            PlaySounds = misc:Section("Play Sounds");
            Dance = misc:Section("Fortnite Mode");
            Disablers = misc:Section("Disablers");
            CarModify = vehicle:Section("Car Modifications");
            HeliModify = vehicle:Section("Heli Modifications");
            PlaneModify = vehicle:Section("Plane Modifications");
            BikeModify = vehicle:Section("Bike Modifications");
            BoatModify = vehicle:Section("Boat Modifications");
            VehicleMisc = vehicle:Section("Misc");
            Bank = robbery:Section("Bank");
            BankTruck = robbery:Section("Bank Truck");
            Jewelry = robbery:Section("Jewelry");
            Museum = robbery:Section("Museum");
            Casino = robbery:Section("Casino");
            Airdrop = robbery:Section("Airdrop");
            Cargoplane = robbery:Section("Cargo Plane");
            Mansion = robbery:Section("Mansion");
            Trains = robbery:Section("Trains");
            Powerplant = robbery:Section("Powerplant");
            Tomb = robbery:Section("Tomb");
            Cargoship = robbery:Section("Cargoship");
            SmallStores = robbery:Section("Small Stores");
            Info = info:Section("Info");
            LightingTechnology = info:Section("Lighting Technology");
        }
        global.ui.sections = sections
        global.ui.statusRobberies = {}
        global.ui.colorForcing = {}
        global.config = {}
        local function slider(section, name, min, max, callback)
            local section = sections[section]
            return section:Slider(name, min, max, callback)
        end
        local function toggle(section, name, callback, isMasterSwitch)
            if not isMasterSwitch then
                isMasterSwitch = false
            end
            local section = sections[section]
            return section:Toggle(name, callback, isMasterSwitch)
        end
        local function label(section, text, forceColor, forceLeft)
            local section = sections[section]
            global.ui.statusRobberies[text] = text
            global.ui.colorForcing[text] = forceColor
            return section:Label(text, forceColor, forceLeft)
        end
        local function button(section, name, callback)
            local section = sections[section]
            return section:Button(name, callback)
        end
        local function dropdown(section, name, list, callback)
            local section = sections[section]
            return section:DropDown(name, list, callback)
        end
        local function keybind(section, name, default_key, callback)
            local section = sections[section]
            return section:KeyBind(name, default_key, callback)
        end
        local function credit(section, name)
            local section = sections[section]
            return section:Credit(name)
        end
        local callback = {}
        local function sections()
            local config = global.config
            local function player()
                function callback.master_switch_walkspeed(bool)
                    global.ui_status.master_switch_walkspeed = bool
                end
                function callback.master_switch_jumppower(bool)
                    global.ui_status.master_switch_jumppower = bool
                end
                function callback.walkspeed(num)
                    global.ui_status.walkspeed = num
                end
                function callback.ws_disable_if_handcuffed(bool)
                    global.ui_status.ws_disable_if_handcuffed = bool
                end
                function callback.jp_disable_if_handcuffed(bool)
                    global.ui_status.jp_disable_if_handcuffed = bool
                end
                function callback.jumppower(num)
                    global.ui_status.jumppower = num
                end
                function callback.antiragdoll(bool)
                    global.ui_status.antiragdoll = bool
                end
                function callback.antifalldamage(bool)
                    global.ui_status.antifalldamage = bool
                end
                function callback.antiskydive(bool)
                    global.ui_status.antiskydive = bool
                end
                function callback.antitaze(bool)
                    global.ui_status.antitaze = bool
                end
                function callback.allow_equip_on_duck(bool)
                    global.ui_status.allow_equip_on_duck = bool
                end
                function callback.infduck(bool)
                    global.ui_status.infduck = bool
                end
                function callback.infpunch(bool)
                    global.ui_status.infpunch = bool
                end
                function callback.alwaysjump(bool)
                    global.ui_status.alwaysjump = bool
                end
                function callback.allow_equip_with_items(bool)
                    global.ui_status.allow_equip_with_items = bool
                end
                function callback.allow_equip_while_flying(bool)
                    global.ui_status.allow_equip_while_flying = bool
                end
                function callback.automatic_respawn_on_taze(bool)
                    global.ui_status.automatic_respawn_on_taze = bool
                end
                function callback.alwayssprint(bool)
                    global.ui_status.alwayssprint = bool
                end
                function callback.jesus(bool)
                    global.ui_status.jesus = bool
                end
                function callback.automatic_punch(bool)
                    global.ui_status.automatic_punch = bool
                end
                function callback.always_duck(bool)
                    global.ui_status.always_duck = bool
                end
                function callback.respawn()
                    local dieOfFalldamage = global.registry.dieOfFalldamage
                    if dieOfFalldamage then
                        dieOfFalldamage()
                    end
                end
                function callback.parachute_boost(bool)
                    global.ui_status.parachute_boost = bool
                end
                function callback.antiparachute(bool)
                    global.ui_status.antiparachute = bool
                end
                function callback.fov(num)
                    global.ui_status.fov = num or 70
                end
                function callback.give_glider()
                    if global._loaded then
                        for i,v in next, client.descendants.givers do
                            if v.Item.Value == "Glider" then
                                fireclickdetector(v.ClickDetector, math.huge)
                            end
                        end
                    end
                end
                function callback.parachute_key(key)
                    global.ui_status.parachute_key = key.Name
                end
                function callback.parachute_on_key(bool)
                    global.ui_status.parachute_on_key = bool
                end
                function callback.glider_key(key)
                    global.ui_status.glider_key = key.Name
                end
                function callback.glider_on_key(bool)
                    global.ui_status.glider_on_key = bool
                end
                function callback.noclip_attempt_key(key)
                    global.ui_status.noclip_attempt_key = key.Name
                end
                local master_switch_walkspeed = toggle("WalkSpeed", "Master Switch", callback.master_switch_walkspeed, true)
                local ws = slider("WalkSpeed", "Value", 16, 100, callback.walkspeed)
                master_switch_walkspeed.setChild(ws)
                local ws_disable_if_handcuffed = toggle("WalkSpeed", "Disable If Handcuffed", callback.ws_disable_if_handcuffed)
                master_switch_walkspeed.setChild(ws_disable_if_handcuffed)
                local master_switch_jumppower = toggle("JumpPower", "Master Switch", callback.master_switch_jumppower, true)
                local jp = slider("JumpPower", "Value", 50, 300, callback.jumppower)
                master_switch_jumppower.setChild(jp)
                local jp_disable_if_handcuffed = toggle("JumpPower", "Disable If Handcuffed", callback.jp_disable_if_handcuffed)
                master_switch_jumppower.setChild(jp_disable_if_handcuffed)
                local antiragdoll = toggle("PlayerUtils", "Anti Ragdoll", callback.antiragdoll)
                local antiskydive = toggle("PlayerUtils", "Anti Skydive", callback.antiskydive)
                local antiparachute = toggle("PlayerUtils", "Anti Parachute", callback.antiparachute)
                local antifalldamage = toggle("PlayerUtils", "Anti Falldamage", callback.antifalldamage)
                local antitaze = toggle("PlayerUtils", "Anti Taze", callback.antitaze)
                local jesus = toggle("PlayerUtils", "Jesus", callback.jesus)
                local respawn = button("PlayerUtils", "Choose Respawn", callback.respawn)
                local fov = slider("PlayerMisc", "FOV", 70, 150, callback.fov)
                local give_glider = button("PlayerMisc", "Give Glider", callback.give_glider)
                local glider_on_key = toggle("PlayerMisc", "Glider On Key", callback.glider_on_key, true)
                local glider_key = keybind("PlayerMisc", "Glider Key", Enum.KeyCode.J, callback.glider_key)
                glider_on_key.setChild(glider_key)
                local parachute_on_key = toggle("PlayerMisc", "Parachute On Key", callback.parachute_on_key, true)
                local parachute_key = keybind("PlayerMisc", "Parachute Key", Enum.KeyCode.Z, callback.parachute_key)
                parachute_on_key.setChild(parachute_key)
                local parachute_boost = toggle("PlayerMisc", "Parachute Boost", callback.parachute_boost)
                local infduck = toggle("PlayerMisc", "Infinite Duck", callback.infduck)
                local infpunch = toggle("PlayerMisc", "Infinite Punch", callback.infpunch)
                local alwaysjump = toggle("PlayerMisc", "Infinite Jump", callback.alwaysjump)
                local alwayssprint = toggle("PlayerMisc", "Always Sprint", callback.alwayssprint)
                local automatic_punch = toggle("PlayerMisc", "Always Punch", callback.automatic_punch)
                local always_duck = toggle("PlayerMisc", "Always Duck", callback.always_duck)
                local automatic_respawn_on_taze = toggle("PlayerMisc", "Automatic Respawn On Stunned", callback.automatic_respawn_on_taze)
                local allow_equip_on_duck = toggle("PlayerMisc", "Allow Equip On Duck", callback.allow_equip_on_duck)
                local allow_equip_while_flying = toggle("PlayerMisc", "Allow Equip While Flying", callback.allow_equip_while_flying)
                local allow_equip_with_items = toggle("PlayerMisc", "Allow Equip With Items", callback.allow_equip_with_items)
                config.master_switch_walkspeed = master_switch_walkspeed
                config.walkspeed = ws
                config.ws_disable_if_handcuffed = ws_disable_if_handcuffed
                config.master_switch_jumppower = master_switch_jumppower
                config.jumppower = jp
                config.jp_disable_if_handcuffed = jp_disable_if_handcuffed
                config.antiragdoll = antiragdoll
                config.noclip_attempt_key = noclip_attempt_key
                config.antiskydive = antiskydive
                config.antiparachute = antiparachute
                config.antifalldamage = antifalldamage
                config.parachute_on_key = parachute_on_key
                config.parachute_key = parachute_key
                config.glider_on_key = glider_on_key
                config.glider_key = glider_key
                config.fov = fov
                config.parachute_boost = parachute_boost
                config.antitaze = antitaze
                config.jesus = jesus
                config.automatic_punch = automatic_punch
                config.automatic_respawn_on_taze = automatic_respawn_on_taze
                config.infduck = infduck
                config.infpunch = infpunch
                config.alwaysjump = alwaysjump
                config.always_duck = always_duck
                config.alwayssprint = alwayssprint
                config.allow_equip_on_duck = allow_equip_on_duck
                config.allow_equip_while_flying = allow_equip_while_flying
                config.allow_equip_with_items = allow_equip_with_items
            end
            local function vehicle()
                function callback.master_switch_carmodify(bool)
                    global.ui_status.master_switch_carmodify = bool
                end
                function callback.car_speed(num)
                    global.ui_status.car_speed = num
                end
                function callback.car_brakes(num)
                    global.ui_status.car_brakes = num
                end
                function callback.car_turnspeed(num)
                    global.ui_status.car_turnspeed = num
                end
                function callback.car_height(num)
                    global.ui_status.car_height = num
                end
                function callback.master_switch_heli_speed(bool)
                    global.ui_status.master_switch_heli_speed = bool
                end
                function callback.heli_speed(num)
                    global.ui_status.heli_speed = num
                end
                function callback.infinite_heli_height(bool)
                    global.ui_status.infinite_heli_height = bool
                end
                function callback.infinite_drone_height(bool)
                    global.ui_status.infinite_drone_height = bool
                end
                function callback.infinite_nitro(bool)
                    global.ui_status.infinite_nitro = bool
                end
                function callback.antitirepop(bool)
                    global.ui_status.antitirepop = bool
                end
                function callback.allow_equip_in_vehicle(bool)
                    global.ui_status.allow_equip_in_vehicle = bool
                end
                function callback.hide_name_in_vehicle(bool)
                    global.ui_status.hide_name_in_vehicle = bool
                end
                function callback.show_hotbar_in_vehicle(bool)
                    global.ui_status.show_hotbar_in_vehicle = bool
                end
                function callback.destroy_all_destructibles(bool)
                    global.ui_status.destroy_all_destructibles = bool
                end
                function callback.automatic_flip_vehicle(bool)
                    global.ui_status.automatic_flip_vehicle = bool
                end
                function callback.spam_headlights(bool)
                    global.ui_status.spam_headlights = bool
                end
                function callback.spam_jeep_roof(bool)
                    global.ui_status.spam_jeep_roof = bool
                end
                function callback.always_drift(bool)
                    global.ui_status.always_drift = bool
                end
                function callback.automatic_hijack_vehicles(bool)
                    global.ui_status.automatic_hijack_vehicles = bool
                end
                function callback.instant_rope(bool)
                    global.ui_status.instant_rope = bool
                end
                function callback.rope_aura(bool)
                    global.ui_status.rope_aura = bool
                end
                function callback.automatic_eject_vehicle_player(bool)
                    global.ui_status.automatic_eject_vehicle_player = bool
                end
                function callback.automatic_lock_vehicle(bool)
                    global.ui_status.automatic_lock_vehicle = bool
                end
                function callback.master_switch_carmodify(bool)
                    global.ui_status.master_switch_carmodify = bool
                end
                function callback.anchor_vehicle_on_high_speed(bool)
                    global.ui_status.anchor_vehicle_on_high_speed = bool
                end
                function callback.destruct_delay(num)
                    global.ui_status.destruct_delay = num
                end
                function callback.no_trailer(bool)
                    global.ui_status.no_trailer = bool
                end
                function callback.high_speed_value(num)
                    global.ui_status.high_speed_value = num
                end
                function callback.vehicle_jump(bool)
                    global.ui_status.vehicle_jump = bool
                end
                function callback.vehicle_jump_key(key)
                    global.ui_status.vehicle_jump_key = key.Name 
                end
                function callback.master_switch_plane(bool)
                    global.ui_status.master_switch_plane = bool
                end
                function callback.anti_max_height(bool)
                    global.ui_status.anti_max_height = bool
                end
                function callback.plane_speed(num)
                    global.ui_status.plane_speed = num
                end
                function callback.automatic_jet_heat_seek(bool)
                    global.ui_status.automatic_jet_heat_seek = bool
                end
                function callback.master_switch_boat(bool)
                    global.ui_status.master_switch_boat = bool
                end
                function callback.boat_speed(num)
                    global.ui_status.boat_speed = num
                end
                function callback.boat_on_land(bool)
                    global.ui_status.boat_on_land = bool
                end
                function callback.master_switch_bike(bool)
                    global.ui_status.master_switch_bike = bool
                end
                function callback.bike_speed(num)
                    global.ui_status.bike_speed = num
                end
                function callback.dirt_bike_height(bool)
                    global.ui_status.dirt_bike_height = bool
                end
                function callback.bike_height_value(num)
                    global.ui_status.bike_height_value = num
                end
                local master_switch_carmodify = toggle("CarModify", "Master Switch", callback.master_switch_carmodify, true)
                local car_speed = slider("CarModify", "Speed", 1, 50, callback.car_speed)
                local car_brakes = slider("CarModify", "Brakes", 1, 50, callback.car_brakes)
                local car_turnspeed = slider("CarModify", "Turn Speed", 1, 5, callback.car_turnspeed)
                local car_height = slider("CarModify", "Height", 3, 125, callback.car_height)
                master_switch_carmodify.setChild(car_speed)
                master_switch_carmodify.setChild(car_brakes)
                master_switch_carmodify.setChild(car_turnspeed)
                master_switch_carmodify.setChild(car_height)
                local infinite_nitro = toggle("CarModify", "Infinite Nitro", callback.infinite_nitro)
                local automatic_flip_vehicle = toggle("CarModify", "Automatic Flip Vehicle", callback.automatic_flip_vehicle)
                local spam_headlights = toggle("CarModify", "Spam Headlights", callback.spam_headlights)
                local spam_jeep_roof = toggle("CarModify", "Spam Jeep Roof", callback.spam_jeep_roof)
                local always_drift = toggle("CarModify", "Always Drift", callback.always_drift)
                master_switch_carmodify.setChild(infinite_nitro)
                master_switch_carmodify.setChild(automatic_flip_vehicle)
                master_switch_carmodify.setChild(spam_headlights)
                master_switch_carmodify.setChild(spam_jeep_roof)
                master_switch_carmodify.setChild(always_drift)
                local master_switch_heli_speed = toggle("HeliModify", "Master Switch", callback.master_switch_heli_speed, true)
                local heli_speed = slider("HeliModify", "Speed", 1, 5, callback.heli_speed)
                local infinite_heli_height = toggle("HeliModify", "Infinite Heli Height", callback.infinite_heli_height)
                local infinite_drone_height = toggle("HeliModify", "Infinite Drone Height", callback.infinite_drone_height)
                local instant_rope = toggle("HeliModify", "Instant Rope", callback.instant_rope, true)
                local rope_aura = toggle("HeliModify", "Extended Rope", callback.rope_aura)
                master_switch_heli_speed.setChild(heli_speed)
                master_switch_heli_speed.setChild(infinite_heli_height)
                master_switch_heli_speed.setChild(infinite_drone_height)
                master_switch_heli_speed.setChild(instant_rope)
                master_switch_heli_speed.setChild(rope_aura)
                instant_rope.setChild(rope_aura)
                local master_switch_plane = toggle("PlaneModify", "Master Switch", callback.master_switch_plane, true)
                local plane_speed = slider("PlaneModify", "Speed", 1, 5, callback.plane_speed)
                local anti_max_height = toggle("PlaneModify", "Anti Max Height", callback.anti_max_height)
                local automatic_jet_heat_seek = toggle("PlaneModify", "Automatic Jet Heat Seak", callback.automatic_jet_heat_seek)
                master_switch_plane.setChild(plane_speed)
                master_switch_plane.setChild(anti_max_height)
                master_switch_plane.setChild(automatic_jet_heat_seek)
                local master_switch_bike = toggle("BikeModify", "Master Switch", callback.master_switch_bike, true)
                local bike_speed = slider("BikeModify", "Speed", 1, 5, callback.bike_speed)
                local dirt_bike_height = toggle("BikeModify", "Dirt Bike Height", callback.dirt_bike_height, true)
                local bike_height_value = slider("BikeModify", "Value", 1, 15, callback.bike_height_value)
                dirt_bike_height.setChild(bike_height_value)
                master_switch_bike.setChild(bike_speed)
                master_switch_bike.setChild(dirt_bike_height)
                local master_switch_boat = toggle("BoatModify", "Master Switch", callback.master_switch_boat, true)
                local boat_speed = slider("BoatModify", "Speed", 1, 5, callback.boat_speed)
                local boat_on_land = toggle("BoatModify", "Boat On Land", callback.boat_on_land)
                master_switch_boat.setChild(boat_speed)
                master_switch_boat.setChild(boat_on_land)
                local antitirepop = toggle("VehicleMisc", "Anti Break Vehicle", callback.antitirepop)
                local anchor_vehicle_on_high_speed = toggle("VehicleMisc", "Anchor Vehicle On High Speed", callback.anchor_vehicle_on_high_speed, true)
                local high_speed_value = slider("VehicleMisc", "High Speed Value", 200, 600, callback.high_speed_value)
                anchor_vehicle_on_high_speed.setChild(high_speed_value)
                local no_trailer = toggle("VehicleMisc", "No Semitruck Trailer", callback.no_trailer)
                local vehicle_jump = toggle("VehicleMisc", "Vehicle Jump", callback.vehicle_jump, true)
                local vehicle_jump_key = keybind("VehicleMisc", "Vehicle Jump Key", Enum.KeyCode.X, callback.vehicle_jump_key)
                vehicle_jump.setChild(vehicle_jump_key)
                local automatic_hijack_vehicles = toggle("VehicleMisc", "Automatic Hijack Vehicles", callback.automatic_hijack_vehicles)
                local automatic_lock_vehicle = toggle("VehicleMisc", "Automatic Lock Vehicle", callback.automatic_lock_vehicle)
                local automatic_eject_vehicle_player = toggle("VehicleMisc", "Automatic Eject Passengers", callback.automatic_eject_vehicle_player)
                local destroy_all_destructibles = toggle("VehicleMisc", "Destroy All Destructibles", callback.destroy_all_destructibles, true)
                local destruct_delay = slider("VehicleMisc", "Destruct Delay", 0, 10, callback.destruct_delay)
                destroy_all_destructibles.setChild(destruct_delay)
                local allow_equip_in_vehicle = toggle("VehicleMisc", "Allow Equip In Vehicle", callback.allow_equip_in_vehicle)
                local hide_name_in_vehicle = toggle("VehicleMisc", "Hide Name In Vehicle", callback.hide_name_in_vehicle)
                local show_hotbar_in_vehicle = toggle("VehicleMisc", "Show Hotbar In Vehicle", callback.show_hotbar_in_vehicle)
                config.master_switch_boat = master_switch_boat
                config.boat_speed = boat_speed
                config.boat_on_land = boat_on_land
                config.master_switch_plane = master_switch_plane
                config.plane_speed = plane_speed
                config.anti_max_height = anti_max_height
                config.automatic_jet_heat_seek = automatic_jet_heat_seek
                config.master_switch_bike = master_switch_bike
                config.bike_speed = bike_speed
                config.dirt_bike_height = dirt_bike_height
                config.bike_height_value = bike_height_value
                config.master_switch_carmodify = master_switch_carmodify
                config.car_speed = car_speed
                config.vehicle_jump = vehicle_jump
                config.car_brakes = car_brakes
                config.no_trailer = no_trailer
                config.car_turnspeed = car_turnspeed
                config.car_height = car_height
                config.master_switch_heli_speed = master_switch_heli_speed
                config.destruct_delay = destruct_delay
                config.high_speed_value = high_speed_value
                config.heli_speed = heli_speed
                config.anchor_vehicle_on_high_speed = anchor_vehicle_on_high_speed
                config.automatic_flip_vehicle = automatic_flip_vehicle
                config.spam_headlights = spam_headlights
                config.spam_jeep_roof = spam_jeep_roof
                config.always_drift = always_drift
                config.automatic_lock_vehicle = automatic_lock_vehicle
                config.vehicle_jump_key = vehicle_jump_key
                config.automatic_eject_vehicle_player = automatic_eject_vehicle_player
                config.infinite_heli_height = infinite_heli_height
                config.instant_rope = instant_rope
                config.rope_aura = rope_aura
                config.infinite_drone_height = infinite_drone_height
                config.infinite_nitro = infinite_nitro
                config.destroy_all_destructibles = destroy_all_destructibles
                config.automatic_hijack_vehicles = automatic_hijack_vehicles
                config.antitirepop = antitirepop
                config.allow_equip_in_vehicle = allow_equip_in_vehicle
                config.hide_name_in_vehicle = hide_name_in_vehicle
                config.show_hotbar_in_vehicle = show_hotbar_in_vehicle
            end
            local function misc()
                function callback.always_keycard(bool)
                    global.ui_status.always_keycard = bool
                end
                function callback.never_unload_world(bool)
                    global.ui_status.never_unload_world = bool
                end
                function callback.remove_clothing()
                    if global._loaded then
                        local hitbox = workspace.ClothingRacks.ClothingRack.Hitbox
                        fireclickdetector(hitbox.ClickDetector, math.huge)
                    end
                end
                function callback.give_police_clothing()
                    if global._loaded then
                        for i,v in next, client.descendants.givers do
                            if v.Name == "Station" then
                                if v.Item.Value == "ShirtPolice" then
                                    fireclickdetector(v.ClickDetector, math.huge)
                                end
                                if v.Item.Value == "PantsPolice" then
                                    fireclickdetector(v.ClickDetector, math.huge)
                                end
                            end
                            task.wait()
                        end
                    end
                end
                function callback.give_police_hat()
                    if global._loaded then
                        for i,v in next, client.descendants.givers do
                            if v.Name == "Station" then
                                if v.Item.Value == "HatPolice" then
                                    fireclickdetector(v.ClickDetector, math.huge)
                                end
                            end
                        end
                    end
                end
                function callback.pickpocketaura(bool)
                    global.ui_status.pickpocketaura = bool
                end
                function callback.range_pickpocketaura(num)
                    global.ui_status.range_pickpocketaura = num
                end
                function callback.droppedcashaura(bool)
                    global.ui_status.droppedcashaura = bool
                end
                function callback.droppedcashrange(num)
                    global.ui_status.droppedcashrange = num
                end
                function callback.range_pickpocketaura(num)
                    global.ui_status.range_pickpocketaura = num
                end
                function callback.disable_lasers(bool)
                    global.ui_status.disable_lasers = bool
                end
                function callback.disable_cameras(bool)
                    global.ui_status.disable_cameras = bool
                end
                function callback.master_switch_no_circle_delay(bool)
                    global.ui_status.master_switch_no_circle_delay = bool
                end
                function callback.master_switch_open_doors(bool)
                    global.ui_status.master_switch_open_doors = bool
                end
                function callback.disable_military_turrets(bool)
                    global.ui_status.disable_military_turrets = bool
                end
                function callback.disable_smoke_grenade_effect(bool)
                    global.ui_status.disable_smoke_grenade_effect = bool
                end
                function callback.open_security_cameras()
                    if global._loaded then        
                        for i,v in next, client.modules.ui.CircleAction.Specs do
                            if v.Name == "Open Security Cameras" then
                                v:Callback(true)
                            end
                        end 
                    end
                end
                function callback.rainbowbullets(bool)
                    global.ui_status.rainbowbullets = bool
                end
                function callback.disable_anti_flight_zones(bool)
                    global.ui_status.disable_anti_flight_zones = bool
                end
                function callback.infinite_jetpack_fuel(bool)
                    global.ui_status.infinite_jetpack_fuel = bool
                end
                function callback.break_vehicles(bool)
                    global.ui_status.break_vehicles = bool
                end
                function callback.master_switch_eject_aura(bool)
                    global.ui_status.master_switch_eject_aura = bool
                end
                function callback.range_ejectaura(num)
                    global.ui_status.range_ejectaura = num
                end
                function callback.master_switch_tase_aura(bool)
                    global.ui_status.master_switch_tase_aura = bool
                end
                function callback.automatic_open_prison_gate(bool)
                    global.ui_status.automatic_open_prison_gate = bool
                end
                function callback.automatic_explode_wall(bool)
                    global.ui_status.automatic_explode_wall = bool
                end
                function callback.automatic_liftgate(bool)
                    global.ui_status.automatic_liftgate = bool
                end
                function callback.automatic_punch_electric_gate(bool)
                    global.ui_status.automatic_punch_electric_gate = bool
                end
                function callback.automatic_open_cells(bool)
                    global.ui_status.automatic_open_cells = bool
                end
                function callback.master_switch_breakout_aura(bool)
                    global.ui_status.master_switch_breakout_aura = bool
                end
                function callback.range_breakoutaura(num)
                    global.ui_status.range_breakoutaura = num
                end
                function callback.disable_home_turrets(bool)
                    global.ui_status.disable_home_turrets = bool
                end
                function callback.teleport_football_to_goal()
                    local teleport_football_to_goal = global.registry.tpFootball
                    if teleport_football_to_goal then
                        teleport_football_to_goal()
                    end
                end
                function callback.open_secretbases(bool)
                    global.ui_status.open_secretbases = bool
                end
                function callback.playsounds(tip)
                    local playsounds = global.registry.playSounds
                    playsounds(tip, {
                        Source = client.playerCharacter;
                        MaxTime = 7;
                        Volume = math.huge;
                    })
                end
                function callback.annoyserver(bool)
                    global.ui_status.annoyserver = bool
                end
                function callback.clicklightning(bool)
                    global.ui_status.clicklightning = bool
                end
                function callback.only_on_weapon_equipped(bool)
                    global.ui_status.only_on_weapon_equipped = bool
                end
                function callback.instant_break(bool)
                    global.ui_status.instant_break = bool
                end
                function callback.target_enemy_team_only(bool)
                    global.ui_status.target_enemy_team_only = bool
                end
                function callback.disable_automatic_unparachute(bool)
                    global.ui_status.disable_automatic_unparachute = bool
                end
                function callback.dance(bool)
                    global.ui_status.dance = bool
                end
                function callback.dance_speed(num)
                    global.ui_status.dance_speed = num
                end
                function callback.clicknuke(bool)
                    global.ui_status.clicknuke = bool
                end
                function callback.disable_minimap_flash(bool)
                    global.ui_status.disable_minimap_flash = bool
                end
                function callback.pit_aura(bool)
                    global.ui_status.pit_aura = bool
                end
                function callback.pit_aura_range(num)
                    global.ui_status.pit_aura_range = num
                end
                function callback.auto_accept_battle(bool)
                    global.ui_status.auto_accept_battle = bool
                end
                function callback.auto_start_matchmaking(bool)
                    global.ui_status.auto_start_matchmaking = bool
                end
                function callback.place_waypoint(key)
                    if global._loaded then
                        local setWaypoint = global.registry.setWaypoint
                        if setWaypoint then
                            setWaypoint(key)
                        end
                    end
                end
                local place_waypoint = dropdown("Waypoints", "Place Waypoint", {}, callback.place_waypoint)
                local always_keycard = toggle("Misc", "Always Keycard", callback.always_keycard)
                local master_switch_open_doors = toggle("Misc", "Open All Doors", callback.master_switch_open_doors)
                local master_switch_no_circle_delay = toggle("Misc", "No Circle Delay", callback.master_switch_no_circle_delay)
                local rainbowbullets = toggle("Misc", "Colorful Bullets", callback.rainbowbullets)
                local infinite_jetpack_fuel = toggle("Misc", "Infinite Jetpack Fuel", callback.infinite_jetpack_fuel)
                local never_unload_world = toggle("Misc", "Never Unload World", callback.never_unload_world)
                local open_secretbases = toggle("Misc", "Open Secretbases", callback.open_secretbases)
                local auto_accept_battle = toggle("Misc", "Automatic Accept Battle", callback.auto_accept_battle)
                local auto_start_matchmaking = toggle("Misc", "Automatic Start Matchmaking", callback.auto_start_matchmaking)
                local clicklightning = toggle("Misc", "Click Lightning", callback.clicklightning)
                local clicknuke = toggle("Misc", "Click Nuke", callback.clicknuke)
                local teleport_football_to_goal = button("Misc", "Teleport Football To Goal", callback.teleport_football_to_goal)
                local open_security_cameras = button("Misc", "Open Security Cameras", callback.open_security_cameras)
                local remove_clothing = button("Misc", "Remove Clothing", callback.remove_clothing)
                local give_police_clothing = button("Misc", "Give Police Clothing", callback.give_police_clothing)
                local give_police_hat = button("Misc", "Give Police Hat", callback.give_police_hat)
                local automatic_punch_electric_gate = toggle("Prison", "Automatic Punch Electric Gate", callback.automatic_punch_electric_gate)
                local automatic_open_prison_gate = toggle("Prison", "Automatic Open Prison Gate", callback.automatic_open_prison_gate)
                local automatic_explode_wall = toggle("Prison", "Automatic Explode Wall", callback.automatic_explode_wall)
                local automatic_liftgate = toggle("Prison", "Automatic Lift Gate", callback.automatic_liftgate)
                local automatic_open_cells = toggle("Prison", "Automatic Open Cells", callback.automatic_open_cells)
                local break_vehicles = toggle("BreakVehicles", "Master Switch", callback.break_vehicles, true)
                local only_on_weapon_equipped = toggle("BreakVehicles", "Only On Weapon Equipped", callback.only_on_weapon_equipped)
                local instant_break = toggle("BreakVehicles", "Instant Break", callback.instant_break)
                local target_enemy_team_only = toggle("BreakVehicles", "Target Enemy Team Only", callback.target_enemy_team_only)
                break_vehicles.setChild(only_on_weapon_equipped)
                break_vehicles.setChild(instant_break)
                break_vehicles.setChild(target_enemy_team_only)
                local pickpocketaura = toggle("Pickpocket", "Master Switch", callback.pickpocketaura, true)
                local range_pickpocketaura = slider("Pickpocket", "Range", 1, 50, callback.range_pickpocketaura)
                pickpocketaura.setChild(range_pickpocketaura)
                local master_switch_eject_aura = toggle("Eject", "Master Switch", callback.master_switch_eject_aura, true)
                local range_ejectaura = slider("Eject", "Range", 1, 80, callback.range_ejectaura)
                master_switch_eject_aura.setChild(range_ejectaura)
                local master_switch_breakout_aura = toggle("Breakout", "Master Switch", callback.master_switch_breakout_aura, true)
                local range_breakoutaura = slider("Breakout", "Range", 1, 20, callback.range_breakoutaura)
                master_switch_breakout_aura.setChild(range_breakoutaura)
                local pit_aura = toggle("Pit", "Master Switch", callback.pit_aura, true)
                local pit_aura_range = slider("Pit", "Range", 10, 100, callback.pit_aura_range)
                pit_aura.setChild(pit_aura_range)
                local droppedcashaura = toggle("DroppedCash", "Master Switch", callback.droppedcashaura, true)
                local droppedcashrange = slider("DroppedCash", "Range", 1, 25, callback.droppedcashrange)
                droppedcashaura.setChild(droppedcashrange)
                local playsounds = dropdown("PlaySounds", "Sounds", {}, callback.playsounds)
                local annoyserver = toggle("PlaySounds", "Annoy Server", callback.annoyserver)
                local dance = toggle("Dance", "Master Switch", callback.dance, true)
                local dance_speed = slider("Dance", "Speed", 0, 10, callback.dance_speed)
                dance.setChild(dance_speed)
                local disable_lasers = toggle("Disablers", "Disable Lasers", callback.disable_lasers)
                local disable_cameras = toggle("Disablers", "Disable Cameras", callback.disable_cameras)
                local disable_minimap_flash = toggle("Disablers", "Disable Minimap Flash", callback.disable_minimap_flash)
                local disable_automatic_unparachute = toggle("Disablers", "Disable Automatic Unparachute", callback.disable_automatic_unparachute)
                local disable_military_turrets = toggle("Disablers", "Disable Military Turrets", callback.disable_military_turrets)
                local disable_home_turrets = toggle("Disablers", "Disable Home Turrets", callback.disable_home_turrets)
                --local disable_anti_flight_zones = toggle("Disablers", "Disable Anti Jetpack Zones", callback.disable_anti_flight_zones)
                local disable_smoke_grenade_effect = toggle("Disablers", "Disable Smoke Grenade Effect", callback.disable_smoke_grenade_effect)
                config.dance = dance
                config.dance_speed = dance_speed
                config.place_waypoint = place_waypoint
                config.clicklightning = clicklightning
                config.pit_aura = pit_aura
                config.pit_aura_range = pit_aura_range
                config.disable_minimap_flash = disable_minimap_flash
                config.clicknuke = clicknuke
                config.auto_accept_battle = auto_accept_battle
                config.auto_start_matchmaking = auto_start_matchmaking
                config.only_on_weapon_equipped = only_on_weapon_equipped
                config.instant_break = instant_break
                config.target_enemy_team_only = target_enemy_team_only
                config.playsounds = playsounds
                config.always_keycard = always_keycard
                config.annoyserver = annoyserver
                config.master_switch_open_doors = master_switch_open_doors
                config.disable_automatic_unparachute = disable_automatic_unparachute
                config.break_vehicles = break_vehicles
                config.master_switch_no_circle_delay = master_switch_no_circle_delay
                config.never_unload_world = never_unload_world
                config.rainbowbullets = rainbowbullets
                config.infinite_jetpack_fuel = infinite_jetpack_fuel
                config.pickpocketaura = pickpocketaura
                config.master_switch_breakout_aura = master_switch_breakout_aura
                config.range_breakoutaura = range_breakoutaura
                config.automatic_open_prison_gate = automatic_open_prison_gate
                config.automatic_explode_wall = automatic_explode_wall
                config.automatic_liftgate = automatic_liftgate
                config.open_secretbases = open_secretbases
                config.automatic_open_cells = automatic_open_cells
                config.range_pickpocketaura = range_pickpocketaura
                config.automatic_punch_electric_gate = automatic_punch_electric_gate
                config.master_switch_eject_aura = master_switch_eject_aura
                config.range_ejectaura = range_ejectaura
                config.droppedcashaura = droppedcashaura
                config.droppedcashrange = droppedcashrange
                config.disable_lasers = disable_lasers
                config.disable_cameras = disable_cameras
                config.disable_home_turrets = disable_home_turrets
                config.disable_military_turrets = disable_military_turrets
                config.disable_anti_flight_zones = disable_anti_flight_zones
                config.disable_smoke_grenade_effect = disable_smoke_grenade_effect
            end
            local function combat()
                function callback.open_gunstore_ui(bool)
                    global.ui_status.ui_gunstore = bool
                    global.ui_status.open_gunstore_ui = bool
                end
                function callback.equip_owned_guns()
                    global.hideshopui = true
                    local equip_owned_guns = global.registry.equip_owned_guns
                    if equip_owned_guns then
                        equip_owned_guns()
                    end 
                end
                function callback.always_equip_owned_guns(bool)
                    global.ui_status.always_equip_owned_guns = bool
                end
                function callback.spam_drop_guns(bool)
                    global.ui_status.spam_drop_guns = bool
                end
                function callback.automatic_fire(bool)
                    global.ui_status.automatic_fire = bool
                end
                function callback.no_recoil(bool)
                    global.ui_status.no_recoil = bool
                end
                function callback.automatic_reload(bool)
                    global.ui_status.automatic_reload = bool
                end
                function callback.master_switch_silentaim(bool)
                    global.ui_status.master_switch_silentaim = bool
                end
                function callback.target_closest_crosshair(bool)
                    global.ui_status.target_closest_crosshair = bool
                end
                function callback.always_predict(bool)
                    global.ui_status.always_predict = bool
                end
                function callback.master_switch_arrestaura(bool)
                    global.ui_status.master_switch_arrestaura = bool
                end
                function callback.range_arrestaura(num)
                    global.ui_status.range_arrestaura = num
                end
                function callback.allow_target_prisoner(bool)
                    global.ui_status.allow_target_prisoner = bool
                end
                function callback.fov_silentaim(num)
                    global.ui_status.fov_silentaim = num
                end
                function callback.fov_circle(bool)
                    global.ui_status.fov_circle = bool
                end
                function callback.automatic_equip_handcuffs(bool)
                    global.ui_status.automatic_equip_handcuffs = bool
                end
                function callback.automatic_eject_player(bool)
                    global.ui_status.automatic_eject_player = bool
                end
                function callback.talk_on_arrest(bool)
                    global.ui_status.talk_on_arrest = bool
                end
                function callback.no_wall_penetration(bool)
                    global.ui_status.no_wall_penetration = bool
                end
                function callback.allow_target_npcs(bool)
                    global.ui_status.allow_target_npcs = bool
                end
                function callback.allow_tase_target(bool)
                    global.ui_status.allow_tase_target = bool
                end
                function callback.through_walls(bool)
                    global.ui_status.through_walls = bool
                end
                function callback.anti_flintlock_knockback(bool)
                    global.ui_status.anti_flintlock_knockback = bool
                end
                function callback.allow_target_boss(bool)
                    global.ui_status.allow_target_boss = bool
                end
                function callback.always_target_boss_head(bool)
                    global.ui_status.always_target_boss_head = bool
                end
                function callback.prediction_value(num)
                    global.ui_status.prediction_value = num
                end
                function callback.anti_scope_ui(bool)
                    global.ui_status.anti_scope_ui = bool
                end
                function callback.allow_taser_aimbot(bool)
                    global.ui_status.allow_taser_aimbot = bool
                end
                function callback.ignore_while_driving(bool)
                    global.ui_status.ignore_while_driving = bool
                end
                function callback.equip_guns(value)
                    local equipOwnedItem = global.registry.equipOwnedItem
                    if equipOwnedItem then
                        if not table.find(client.reg.resolveEquippedItems, value) then
                            equipOwnedItem(value)
                        end
                    end
                end
                function callback.extended_aimbot_range(bool)
                    global.ui_status.extended_aimbot_range = bool
                end
                function callback.range_taseaura(num)
                    global.ui_status.range_taseaura = num
                end
                function callback.fov_target_select(bool)
                    global.ui_status.fov_target_select = bool
                end
                local automatic_fire = toggle("Gunmods", "Automatic Fire", callback.automatic_fire)
                local no_recoil = toggle("Gunmods", "No Recoil", callback.no_recoil)
                local anti_flintlock_knockback = toggle("Gunmods", "Anti Knockback", callback.anti_flintlock_knockback)
                local anti_scope_ui = toggle("Gunmods", "Anti Scope UI", callback.anti_scope_ui)
                local open_gunstore_ui = toggle("Gunstore", "Open Gunstore UI", callback.open_gunstore_ui)
                local equip_owned_guns = button("Gunstore", "Equip Owned Guns", callback.equip_owned_guns)
                local equip_guns = dropdown("Gunstore", "Equip Guns", {}, callback.equip_guns)
                local always_equip_owned_guns = toggle("Gunstore", "Always Equip Owned Guns", callback.always_equip_owned_guns)
                local spam_drop_guns = toggle("Gunstore", "Spam Drop Items", callback.spam_drop_guns)
                local master_switch_silentaim = toggle("Silentaim", "Master Switch", callback.master_switch_silentaim, true)
                local fov_target_select = toggle("Silentaim", "FOV Target Select", callback.fov_target_select, true)
                local fov_silentaim = slider("Silentaim", "FOV", 1, 600, callback.fov_silentaim)
                local fov_circle = toggle("Silentaim", "FOV Circle", callback.fov_circle)
                local always_predict = toggle("Silentaim", "Movement Prediction", callback.always_predict, true)
                local prediction_value = slider("Silentaim", "Prediction Value", 0, 99, callback.prediction_value)
                local extended_aimbot_range = toggle("Silentaim", "Extended Aimbot Range", callback.extended_aimbot_range)
                local allow_taser_aimbot = toggle("Silentaim", "Allow Taser Aimbot", callback.allow_taser_aimbot)
                local allow_target_prisoner = toggle("Silentaim", "Allow Target Prisoner", callback.allow_target_prisoner)
                local allow_target_npcs = toggle("Silentaim", "Allow Target NPCs", callback.allow_target_npcs)
                local allow_target_boss = toggle("Silentaim", "Allow Target Boss", callback.allow_target_boss, true)
                local always_target_boss_head = toggle("Silentaim", "Head Only", callback.always_target_boss_head)
                local no_wall_penetration = toggle("Silentaim", "No Wall Penetration", callback.no_wall_penetration)
                master_switch_silentaim.setChild(fov_target_select)
                fov_target_select.setChild(fov_silentaim)
                fov_target_select.setChild(fov_circle)
                master_switch_silentaim.setChild(always_predict)
                master_switch_silentaim.setChild(extended_aimbot_range)
                always_predict.setChild(prediction_value)
                master_switch_silentaim.setChild(allow_taser_aimbot)
                master_switch_silentaim.setChild(allow_target_prisoner)
                master_switch_silentaim.setChild(allow_target_npcs)
                master_switch_silentaim.setChild(allow_target_boss)
                allow_target_boss.setChild(always_target_boss_head)
                master_switch_silentaim.setChild(no_wall_penetration)
                local master_switch_arrestaura = toggle("Arrestaura", "Master Switch", callback.master_switch_arrestaura, true)
                local range_arrestaura = slider("Arrestaura", "Range", 1, 20, callback.range_arrestaura)
                local ignore_while_driving = toggle("Arrestaura", "Ignore while driving", callback.ignore_while_driving)
                local automatic_equip_handcuffs = toggle("Arrestaura", "Automatic Equip Handcuffs", callback.automatic_equip_handcuffs)
                local automatic_eject_player = toggle("Arrestaura", "Automatic Eject Player", callback.automatic_eject_player)
                local allow_tase_target = toggle("Arrestaura", "Allow Tase Target", callback.allow_tase_target, true)
                local through_walls = toggle("Arrestaura", "Allow Through Walls", callback.through_walls)
                local talk_on_arrest = toggle("Arrestaura", "Talk on Arrest", callback.talk_on_arrest)
                master_switch_arrestaura.setChild(range_arrestaura)
                master_switch_arrestaura.setChild(automatic_equip_handcuffs)
                master_switch_arrestaura.setChild(automatic_eject_player)
                master_switch_arrestaura.setChild(allow_tase_target)
                master_switch_arrestaura.setChild(ignore_while_driving)
                master_switch_arrestaura.setChild(through_walls)
                master_switch_arrestaura.setChild(talk_on_arrest)
                config.anti_scope_ui = anti_scope_ui
                config.allow_target_boss = allow_target_boss
                config.always_target_boss_head = always_target_boss_head
                config.automatic_fire = automatic_fire
                config.no_recoil = no_recoil
                config.equip_guns = equip_guns
                config.master_switch_silentaim = master_switch_silentaim
                config.fov_silentaim = fov_silentaim
                config.fov_circle = fov_circle
                config.always_predict = always_predict
                config.prediction_value = prediction_value
                config.extended_aimbot_range = extended_aimbot_range
                config.always_equip_owned_guns = always_equip_owned_guns
                config.spam_drop_guns = spam_drop_guns
                config.allow_target_npcs = allow_target_npcs
                config.no_wall_penetration = no_wall_penetration
                config.allow_target_prisoner = allow_target_prisoner
                config.anti_flintlock_knockback = anti_flintlock_knockback
                config.master_switch_arrestaura = master_switch_arrestaura
                config.fov_target_select = fov_target_select
                config.allow_taser_aimbot = allow_taser_aimbot
                config.range_arrestaura = range_arrestaura
                config.automatic_equip_handcuffs = automatic_equip_handcuffs
                config.allow_tase_target = allow_tase_target
                config.through_walls = through_walls
                config.automatic_eject_player = automatic_eject_player
                config.talk_on_arrest = talk_on_arrest
                config.ignore_while_driving = ignore_while_driving
            end
            local function markers()
                function callback.master_switch_marker(bool)
                    global.ui_status.master_switch_marker = bool
                end
                function callback.police_marker(bool)
                    global.ui_status.allow_police_marker = bool
                end
                function callback.criminal_marker(bool)
                    global.ui_status.allow_criminal_marker = bool
                end
                function callback.prisoner_marker(bool)
                    global.ui_status.allow_prisoner_marker = bool
                end
                function callback.airdrop_marker(bool)
                    global.ui_status.allow_airdrop_marker = bool
                end
                function callback.allow_football_marker(bool)
                    global.ui_status.allow_football_marker = bool
                end
                function callback.allow_hackable_computer_marker(bool)
                    global.ui_status.allow_hackable_computer_marker = bool
                end
                function callback.no_robberymarker_delay(bool)
                    global.ui_status.no_robberymarker_delay = bool
                end
                function callback.allow_npcs_marker(bool)
                    global.ui_status.allow_npcs_marker = bool
                end
                function callback.mark_bounty_criminals(bool)
                    global.ui_status.mark_bounty_criminals = bool
                end
                local master_switch_marker = toggle("Marker", "Master Switch", callback.master_switch_marker)
                local allow_criminal_marker = toggle("Teams", "Allow Criminal Marker", callback.criminal_marker)
                local allow_prisoner_marker = toggle("Teams", "Allow Prisoner Marker", callback.prisoner_marker)
                local allow_police_marker = toggle("Teams", "Allow Police Marker", callback.police_marker)
                local allow_airdrop_marker = toggle("Objects", "Allow Airdrop Marker", callback.airdrop_marker)
                local allow_football_marker = toggle("Objects", "Allow Football Marker", callback.allow_football_marker)
                local allow_npcs_marker = toggle("Objects", "Allow NPCs Marker", callback.allow_npcs_marker)
                local no_robberymarker_delay = toggle("Settings", "No Robbery Marker Delay", callback.no_robberymarker_delay)
                local mark_bounty_criminals = toggle("Settings", "Mark Bounty Criminals", callback.mark_bounty_criminals)
                config.master_switch_marker = master_switch_marker
                config.allow_criminal_marker = allow_criminal_marker
                config.allow_prisoner_marker = allow_prisoner_marker
                config.allow_police_marker = allow_police_marker
                config.allow_airdrop_marker = allow_airdrop_marker
                config.allow_football_marker = allow_football_marker
                config.allow_npcs_marker = allow_npcs_marker
                config.no_robberymarker_delay = no_robberymarker_delay
                config.mark_bounty_criminals = mark_bounty_criminals
            end
            local function robbery()
                local function bank()
                    function callback.auto_touch_vault(bool)
                        global.ui_status.auto_touch_vault = bool
                    end
                    function callback.auto_place_dynamite(bool)
                        global.ui_status.auto_place_dynamite = bool
                    end
                    local status = label("Bank", "Bank Status", Color3.fromRGB(0, 0, 0))
                    local auto_touch_vault = toggle("Bank", "Automatic Touch Vault", callback.auto_touch_vault)
                    local auto_place_dynamite = toggle("Bank", "Automatic Place Dynamite", callback.auto_place_dynamite)
                    config.auto_touch_vault = auto_touch_vault
                    config.auto_place_dynamite = auto_place_dynamite
                end
                bank()
                local function banktruck()
                    local status = label("BankTruck", "Banktruck Status", Color3.fromRGB(0, 0, 0))
                end
                banktruck()
                local function smallstores()
                    local donut = label("SmallStores", "Donut Shop", Color3.fromRGB(0, 0, 0))
                    local gas = label("SmallStores", "Gas Station", Color3.fromRGB(0, 0, 0))
                end
                smallstores()
                local function jewelry()
                    function callback.automatic_grab_nearby_jewels(bool)
                        global.ui_status.automatic_grab_nearby_jewels = bool
                    end
                    local status = label("Jewelry", "Jewelry Status", Color3.fromRGB(0, 0, 0))
                    local automatic_grab_nearby_jewels = toggle("Jewelry", "Automatic Grab Nearby Jewels", callback.automatic_grab_nearby_jewels)
                    config.automatic_grab_nearby_jewels = automatic_grab_nearby_jewels
                end
                jewelry()
                local function museum()
                    function callback.automatic_place_dynamite(bool)
                        global.ui_status.automatic_place_dynamite = bool
                    end
                    function callback.auto_fill_bag(bool)
                        global.ui_status.auto_fill_bag = bool
                    end
                    function callback.break_museum_puzzle(bool)
                        global.ui_status.break_museum_puzzle = bool
                    end
                    function callback.automatic_resolve_museum_puzzle(bool)
                        global.ui_status.automatic_resolve_museum_puzzle = bool
                    end
                    local status = label("Museum", "Museum Status", Color3.fromRGB(0, 0, 0))
                    local automatic_resolve_museum_puzzle = toggle("Museum", "Automatic Resolve Puzzle", callback.automatic_resolve_museum_puzzle)
                    local automatic_place_dynamite = toggle("Museum", "Automatic Place Dynamite", callback.automatic_place_dynamite)
                    local auto_fill_bag = toggle("Museum", "Automatic Fill Bag", callback.auto_fill_bag)
                    local break_museum_puzzle = toggle("Museum", "Break Museum Puzzle", callback.break_museum_puzzle)
                    config.auto_fill_bag = auto_fill_bag
                    config.automatic_resolve_museum_puzzle = automatic_resolve_museum_puzzle
                    config.break_museum_puzzle = break_museum_puzzle
                    config.automatic_place_dynamite = automatic_place_dynamite
                end
                museum()
                local function casino()
                    function callback.auto_crack_vault(bool)
                        global.ui_status.auto_crack_vault = bool
                    end
                    function callback.auto_collect_cash(bool)
                        global.ui_status.auto_collect_cash = bool
                    end
                    function callback.auto_open_door(bool)
                        global.ui_status.auto_open_door = bool
                    end
                    function callback.auto_open_keycode_door(bool)
                        global.ui_status.auto_open_keycode_door = bool
                    end
                    function callback.break_elevator(bool)
                        global.ui_status.break_elevator = bool
                    end
                    function callback.hack_nearby_computers(bool)
                        global.ui_status.hack_nearby_computers = bool
                    end
                    function callback.reveal_casino_keycode()
                        local getKeycode = global.registry.getKeycode
                        if getKeycode then
                            local keycode = getKeycode()
                            if keycode ~= "" then
                                global.notify(keycode, 10)
                            end
                        end
                    end
                    function callback.call_elevator_to_floor(cb)
                        local call_elevator_to_floor = global.registry.call_elevator_to_floor
                        if call_elevator_to_floor then
                            call_elevator_to_floor(cb)
                        end
                    end
                    local status = label("Casino", "Casino Status", Color3.fromRGB(0, 0, 0))
                    local auto_crack_vault = toggle("Casino", "Automatic Crack Vault", callback.auto_crack_vault)
                    local auto_collect_cash = toggle("Casino", "Automatic Collect Loot", callback.auto_collect_cash)
                    local auto_open_door = toggle("Casino", "Automatic Open Door", callback.auto_open_door)
                    local break_elevator = toggle("Casino", "Break Elevator", callback.break_elevator)
                    local hack_nearby_computers = toggle("Casino", "Hack Nearby Computers", callback.hack_nearby_computers)
                    local reveal_casino_keycode = button("Casino", "Reveal Keycode", callback.reveal_casino_keycode)
                    local call_elevator_to_floor = dropdown("Casino", "Call Elevator To Floor", {"The Roof", "Security", "Ground", "Vaults"}, callback.call_elevator_to_floor)
                    config.auto_crack_vault = auto_crack_vault
                    config.auto_collect_cash = auto_collect_cash
                    config.auto_open_door = auto_open_door
                    config.break_elevator = break_elevator
                    config.hack_nearby_computers = hack_nearby_computers
                    config.reveal_casino_keycode = reveal_casino_keycode
                end
                casino()
                local function mansion()
                    function callback.disable_traps(bool)
                        global.ui_status.disable_traps = bool
                    end
                    function callback.anti_boss_attack(bool)
                        global.ui_status.anti_boss_attack = bool
                    end
                    function callback.anti_boss_ragdoll(bool)
                        global.ui_status.anti_boss_ragdoll = bool
                    end
                    function callback.break_mansion_npcs(bool)
                        global.ui_status.break_mansion_npcs = bool
                    end
                    function callback.automatic_elevator_entry(bool)
                        global.ui_status.automatic_elevator_entry = bool
                    end
                    function callback.allow_on_police_team(bool)
                        global.ui_status.allow_on_police_team = bool
                    end
                    function callback.entry_only_near_elevator(bool)
                        global.ui_status.entry_only_near_elevator = bool
                    end
                    local status = label("Mansion", "Mansion Status", Color3.fromRGB(0, 0, 0))
                    local automatic_elevator_entry = toggle("Mansion", "Automatic Elevator Entry", callback.automatic_elevator_entry, true)
                    local allow_on_police_team = toggle("Mansion", "Allow On Police Team", callback.allow_on_police_team)
                    automatic_elevator_entry.setChild(allow_on_police_team)
                    local anti_boss_attack = toggle("Mansion", "Anti Boss Attack", callback.anti_boss_attack)
                    local anti_boss_ragdoll = toggle("Mansion", "Anti Boss Ragdoll", callback.anti_boss_ragdoll)
                    local break_mansion_npcs = toggle("Mansion", "Break NPCs", callback.break_mansion_npcs)
                    local disable_traps = toggle("Mansion", "Disable Traps", callback.disable_traps)
                    config.break_mansion_npcs = break_mansion_npcs
                    config.disable_traps = disable_traps
                    config.anti_boss_attack = anti_boss_attack
                    config.allow_on_police_team = allow_on_police_team
                    config.anti_boss_ragdoll = anti_boss_ragdoll
                    config.automatic_elevator_entry = automatic_elevator_entry
                end
                mansion()
                local function powerplant()
                    function callback.puzzle_resolver(bool)
                        global.ui_status.puzzle_resolver = bool
                    end
                    function callback.disable_piston_damage(bool)
                        global.ui_status.disable_piston_damage = bool
                    end
                    function callback.disable_powerwire_damage(bool)
                        global.ui_status.disable_powerwire_damage = bool
                    end
                    local status = label("Powerplant", "Powerplant Status", Color3.fromRGB(0, 0, 0))
                    local puzzle_resolver = toggle("Powerplant", "Automatic Resolve Puzzle", callback.puzzle_resolver)
                    local disable_piston_damage = toggle("Powerplant", "Disable Piston Damage", callback.disable_piston_damage)
                    local disable_powerwire_damage = toggle("Powerplant", "Disable Powerwire Damage", callback.disable_powerwire_damage)
                    config.puzzle_resolver = puzzle_resolver
                    config.disable_piston_damage = disable_piston_damage
                    config.disable_powerwire_damage = disable_powerwire_damage
                end
                powerplant()
                local function airdrop()
                    function callback.break_npcs(bool)
                        global.ui_status.break_npcs = bool
                    end
                    local status = label("Airdrop", "Airdrop Status", Color3.fromRGB(0, 0, 0))
                    local break_npcs = toggle("Airdrop", "Break NPCs", callback.break_npcs)
                    config.break_npcs = break_npcs
                end
                airdrop()
                local function cargoplane()
                    function callback.automatic_inspect_crate(bool)
                        global.ui_status.automatic_inspect_crate = bool
                    end
                    function callback.automatic_open_cargoplane_door(bool)
                        global.ui_status.automatic_open_cargoplane_door = bool
                    end
                    function callback.call_cargoplane()
                        local callplane = global.registry.callplane
                        if callplane then
                            callplane()
                        end
                    end
                    local status = label("Cargoplane", "Cargoplane Status", Color3.fromRGB(0, 0, 0))
                    local automatic_inspect_crate = toggle("Cargoplane", "Automatic Inspect Crate", callback.automatic_inspect_crate)
                    local automatic_open_cargoplane_door = toggle("Cargoplane", "Automatic Open Door", callback.automatic_open_cargoplane_door)
                    local call_cargoplane = button("Cargoplane", "Call Cargoplane", callback.call_cargoplane)
                    config.automatic_inspect_crate = automatic_inspect_crate
                    config.automatic_open_cargoplane_door = automatic_open_cargoplane_door
                end
                cargoplane()
                local function trains()
                    function callback.automatic_train_fillbag(bool)
                        global.ui_status.automatic_train_fillbag = bool
                    end
                    function callback.automatic_breach_vault(bool)
                        global.ui_status.automatic_breach_vault = bool
                    end
                    function callback.automatic_delivery(bool)
                        global.ui_status.automatic_delivery = bool
                    end
                    function callback.anti_station_stop(bool)
                        global.ui_status.anti_station_stop = bool
                    end
                    local status = label("Trains", "Trains Status", Color3.fromRGB(0, 0, 0))
                    local automatic_train_fillbag = toggle("Trains", "Automatic Fill Bag", callback.automatic_train_fillbag)
                    local automatic_delivery = toggle("Trains", "Automatic Delivery", callback.automatic_delivery)
                    local automatic_breach_vault = toggle("Trains", "Automatic Breach Vault", callback.automatic_breach_vault)
                    local anti_station_stop = toggle("Trains", "Anti Station Stop", callback.anti_station_stop)
                    config.automatic_train_fillbag = automatic_train_fillbag
                    config.automatic_delivery = automatic_delivery
                    config.automatic_breach_vault = automatic_breach_vault
                    config.anti_station_stop = anti_station_stop
                end
                trains()
                local function tomb()
                    function callback.disable_darts(bool)
                        global.ui_status.disable_darts = bool
                    end
                    function callback.disable_spikes(bool)
                        global.ui_status.disable_spikes = bool
                    end
                    function callback.disable_lava(bool)
                        global.ui_status.disable_lava = bool
                    end
                    function callback.disable_wood(bool)
                        global.ui_status.disable_wood = bool
                    end
                    function callback.automatic_resolve_dart_room(bool)
                        global.ui_status.automatic_resolve_dart_room = bool
                    end
                    local status = label("Tomb", "Tomb Status", Color3.fromRGB(0, 0, 0))
                    local automatic_resolve_dart_room = toggle("Tomb", "Automatic Resolve Dart Room", callback.automatic_resolve_dart_room)
                    local disable_darts = toggle("Tomb", "Disable Darts", callback.disable_darts)
                    local disable_wood = toggle("Tomb", "Disable Wood Damage", callback.disable_wood)
                    local disable_spikes = toggle("Tomb", "Disable Spike Damage", callback.disable_spikes)
                    local disable_lava = toggle("Tomb", "Disable Lava Damage", callback.disable_lava)
                    config.automatic_resolve_dart_room = automatic_resolve_dart_room
                    config.disable_darts = disable_darts
                    config.disable_wood = disable_wood
                    config.disable_spikes = disable_spikes
                    config.disable_lava = disable_lava
                end
                tomb()
                local function cargoship()
                    function callback.disable_cargoship_turrets(bool)
                        global.ui_status.disable_cargoship_turrets = bool
                    end
                    local status = label("Cargoship", "Cargoship Status", Color3.fromRGB(0, 0, 0))
                    local disable_cargoship_turrets = toggle("Cargoship", "Disable Turrets", callback.disable_cargoship_turrets)
                    config.disable_cargoship_turrets = disable_cargoship_turrets
                end
                cargoship()
            end
            local function info()
                function callback.discord()
                    log("autojoin discord")
                    setclipboard("https://discord.gg/"..discord_code)
                end
                function callback.discord2()
                    setclipboard("https://discord.gg/"..discord_code)
                end
                function callback.hideusername(bool)
                    global.ui_status.hideusername = bool
                end
                function callback.keybindUI(key)
                    global.ui_status.keybindUI = key.Name
                end
                function callback.goto_trade_world()
                    local generateJobId = global.registry.generateJobId
                    local jobId = generateJobId(true)
                    if jobId then
                        teleportservice:TeleportToPlaceInstance("9780994092", jobId, players.LocalPlayer)
                    end
                end
                function callback.join_random_server()
                    local generateJobId = global.registry.generateJobId
                    local jobId = generateJobId()
                    if jobId then
                        teleportservice:TeleportToPlaceInstance("606849621", jobId, players.LocalPlayer)
                    end
                end
                function callback.rejoin()
                    local jobId = game.JobId
                    if jobId then
                        teleportservice:TeleportToPlaceInstance("606849621", jobId, players.LocalPlayer)
                    end
                end
                function callback.saveuistatus(bool)
                    global.ui_status.saveuistatus = bool
                end
                function callback.lighting_technology(val)
                    local lighting_technology = global.registry.lighting_technology
                    if lighting_technology then
                        lighting_technology(val)
                    end
                end
                local infolabel = credit("Info", "Credits: alex9#0001 (870050524857258055)")
                local infoversion = label("Info", ("Version: v%s-%s"):format(global.version, global.exploit))
                local infoclipboard = button("Info", "Set Discord Link To Clipboard", callback.discord2)
                local infoforcejoin = button("Info", "Force Join Discord", callback.discord)
                local goto_trade_world = button("Info", "Teleport To Trade World", callback.goto_trade_world)
                local join_random_server = button("Info", "Join Random Server", callback.join_random_server)
                local rejoin = button("Info", "Rejoin", callback.rejoin)
                local hideusername = toggle("Info", "Hide UI Username", callback.hideusername)
                local saveuistatus = toggle("Info", "Save UI Status", callback.saveuistatus)
                local keybindUI = keybind("Info", "UI Toggle Keybind", Enum.KeyCode.RightShift, callback.keybindUI)
                local lighting_technology = dropdown("LightingTechnology", "Technology", {"Compatibility", "Future", "ShadowMap", "Voxel"}, callback.lighting_technology)
                config.hideusername = hideusername
                config.saveuistatus = saveuistatus
                config.keybindUI = keybindUI
            end
            player()
            vehicle()
            misc()
            combat()
            markers()
            robbery()
            info()
            global.ui_callbacks = callback
        end
        sections()
        log("16TSnfSNUSV1SPEeBM5APD9UEVGCHHN1WB")
        log("0,50 BTC ^ send? 🥺 >.<")
        log("MemPro II by 02hacks loaded")
    end
    ui()
    local function playerCharacter()
        local function onCharacterAdded(char)
            client.playerCharacter = player.Character
        end
        player.CharacterAdded:connect(onCharacterAdded)
        if player.Character then
            client.playerCharacter = player.Character
        else
            log("COULD NOT FIND CHARACTER")
        end
    end
    playerCharacter()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/piglex9/icetray3/main/utils/noVirtualization.lua"))()()
    local function registry()
        local function funcs()
            local _equipConditions = client.modules.equipConditions
            for i,v in next, _equipConditions do
                local con = getconstants(v)
                if #con == 4 then
                    global.registry.max4 = v
                end
                if table.find(con, "GetLocalVehiclePacket") then
                    global.registry._equipconditions = v
                end
                if table.find(con, "IsCrawling") then
                    global.registry.iscrawling = v
                end
                if table.find(con, "GetLastInputType") then
                    global.registry.getlastequip = v
                end
            end
            local onPressed = getupvalue(client.modules.crawlButton.onPressed, 3)
            if onPressed then
                global.registry.buttons = onPressed
                local lastDuckTick = getupvalue(onPressed.attemptToggleCrawling, 9)
                if lastDuckTick then
                    global.registry.lastDuckTick = lastDuckTick
                else
                    log("Wrong upvalue for lastDuckTick")
                end
            else
                log("Wrong upvalue for onPressed")
            end
            local falling = getupvalue(client.modules.falling.Init, 15)
            if falling then
                global.registry.falling = falling
            else
                log("Wrong upvalue for falling")
            end
            local trainSystem = client.modules.trainSystem
            local em = getupvalue(trainSystem.Init, 2)
            if em then
                for i,v in next, em do
                    if type(v) == "function" then
                        if islclosure(v) then
                            local con = getconstants(v)
                            if table.find(con, "Stunned") then
                                global.registry.stunnedFunc = v
                            end
                            if table.find(con, "Nuke") and table.find(con, "Shockwave") then
                                global.registry.nukecontrol = v
                            end
                        end
                        for i2,v2 in next, getupvalues(v) do
                            if type(v2) == "function" and islclosure(v2) then
                                local con = getconstants(v2)
                                if table.find(con, "spawn") then
                                    global.registry.isInMuseumRobbery = v2
                                end
                            end
                        end
                    end
                end
            else
                log("Wrong upvalue for em")
            end
            local registry = getreg()
            for i,v in next, registry do
                if type(v) == "function" then
                    for i2,v2 in next, getupvalues(v) do
                        if type(v2) == "table" then
                            if rawget(v2, "Nitro") and rawget(v2, "NitroLastMax") then
                                global.registry.nitro = v2
                            end
                            for i3,v3 in next, v2 do
                                if type(v3) == "table" and rawget(v3, "Tag") and rawget(v3, "Part") and type(rawget(v3, "Fun")) == "function" then
                                    table.insert(global.registry.doors, v3.Fun)
                                end
                            end
                        end
                        if type(v2) == "function" then
                            if islclosure(v2) then
                                local con = getconstants(v2)
                                if table.find(con, "ShouldEject") then
                                    global.registry.shouldEject = v2
                                end
                            end
                            for i3,v3 in next, getupvalues(v2) do
                                if type(v3) == "function" and islclosure(v3) then
                                    local con = getconstants(v3)
                                    if table.find(con, "Source") and table.find(con, "Play") then
                                        global.registry.playSounds = v3
                                    end
                                end
                            end
                        end
                    end
                    if islclosure(v) then
                        if not is_synapse_function(v) then
                            for i2,v2 in next, getupvalues(v) do
                                if type(v2) == "table" and type(rawget(v2, "Fireworks")) == "function" then
                                    global.registry.fireworks = v2.Fireworks
                                end
                            end
                        end
                        local con = getconstants(v)
                        if table.find(con, "t") and table.find(con, "i") and table.find(con, "c") then
                            for i2,v2 in next, getupvalues(v) do
                                if type(v2) == "table" then
                                    for i3,v3 in next, v2 do
                                        if type(v3) == "table" then
                                            if v3.i == 1 and type(v3.c) == "function" then
                                                v3.t = 0
                                                v3.i = math.huge
                                                v3.c = function()
                                                    return task.wait(9e9)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            return true
        end
        local funcs = funcs()
        while true do
            if funcs then
                break
            end
            task.wait()
            log("bad pc detection")
        end
        local function shouldFuncs()
            local charBinder = client.modules.charBinder
            local _fn = getupvalue(getupvalue(charBinder:GetClassAddedSignal()._handlerListHead._fn,1),2)
            global.registry.shouldArrest = getupvalue(_fn, 1)
            global.registry.shouldPickpocket = _fn
            global.registry.shouldBreakout = _fn
        end
        shouldFuncs()
        local function generateJobId(isTradeWorld) -- @dont remember who created this function, but thanks :D
            local placeId
            if isTradeWorld then
                placeId = "9780994092"
            else
                placeId = "606849621"
            end
            local jobids = {}
            local api = httpservice:JSONDecode(game:HttpGetAsync(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(placeId)))
            for i,v in next, api.data do
                if v.playing ~= nil then
                    if v.playing < 29 then
                        table.insert(jobids, v.id)
                    end
                end
            end
            if #jobids < 1 then
                log("No JobId could be found. Try generating again! Generator issue from whoever created this function or roblox(?)")
                return {}
            end
            return jobids[math.random(1, #jobids)]
        end
        local markerColors = {
            Prisoner = Color3.fromRGB(253, 148, 81);
            Police = Color3.fromRGB(84, 215, 253);
            Criminal = Color3.fromRGB(253, 100, 30);
            Airdrop = Color3.fromRGB(148, 0, 211);
            Football = Color3.fromRGB(255, 255, 0);
            NPCs = Color3.fromRGB(140, 182, 210);
            Bounty = Color3.fromRGB(255, 255, 50);
        }
        local markerSystem = client.modules.playerMarkerSystem
        local function constructMarker(player)
            return markerSystem._constructMarker(player)
        end
        local function setColor(player, color)
            return markerSystem._setColor(player, color)
        end
        local function destructMarker(player)
            return markerSystem._destructMarker(player)
        end
        local function doesMarkerExist(player)
            return markerSystem._doesMarkerExist(player)
        end
        local function getLocalVehicle()
            local module = client.modules.vehicle.GetLocalVehiclePacket()
            if module and module.IsPassenger then
                return false
            end
            return module
        end
        local function getHeliRope(getLocalVehicle)
            if getLocalVehicle then
                if getLocalVehicle.Model:FindFirstChild("Preset") and getLocalVehicle.Model.Preset:FindFirstChild("RopePull") then
                    return getLocalVehicle.Model.Preset.RopePull
                end
            end
            return false
        end
        local function canLockVehicle()
            return client.modules.vehicle.canLocalLock()
        end
        local function toggleLock()
            return client.modules.vehicle.toggleLocalLocked()
        end
        local function passengerKick(player)
            client.modules.vehicle.attemptPassengerEject(player)
        end
        local function getPlayerVehicle(player, isArresting)
            for i,v in next, client.descendants.vehicles:GetChildren() do
                local seat = v:FindFirstChild("Seat")
                local passenger = v:FindFirstChild("Passenger")
                local sname = seat and seat:FindFirstChild("PlayerName")
                if sname and sname.Value == player.Name then
                    if isArresting then
                        return v.Seat
                    end
                    return v
                end
                local pname = passenger and passenger:FindFirstChild("PlayerName")
                if pname and pname.Value == player.Name then
                    if isArresting then
                        return v.Passenger
                    end
                    return v
                end
            end
        end
        local function getPartsInRegion(posX, posY, posZ, minX, minY, minZ, maxX, maxY, maxZ)
            if posX < maxX and posX > minX then
                if posZ < maxZ and posZ > minZ then
                    if posY < maxY and posY > minY then
                        return true 
                    end
                end
            end
            return false
        end
        local function isVulnerable(p1, p2, settings)
            p1 = tostring(p1)
            p2 = tostring(p2)
            if p1 and p2 then
                if p1 == "Police" then
                    if p2 == "Criminal" then
                        return true
                    end
                    if p2 == "Prisoner" then
                        if settings and settings.prisonerTarget then
                            return global.ui_status.allow_target_prisoner
                        end
                        return true
                    end
                end
                if p1 == "Prisoner" then
                    if p2 == "Criminal" then
                        return false
                    end
                    if p2 == "Police" then
                        return true
                    end
                end
                if p1 == "Criminal" then
                    if p2 == "Prisoner" then
                        return false
                    end
                    if p2 == "Police" then
                        return true
                    end
                end
            end
        end
        local function sounds()
            for i,v in next, client.modules.settings.Sounds do
                table.insert(global.registry.sounds, i)
            end
        end
        sounds()
        local function hasItemEquipped(item)
            local isItemEquipped = client.modules.itemSystem.GetLocalEquipped()
            return isItemEquipped and isItemEquipped.inventoryItemValue.name == item
        end
        local function addWaypoint(tbl)
            local minimapService = client.modules.minimapService
            return minimapService.addWaypoint({
                name = "USER";
                position = tbl.position;
                priority = tbl.priority or 100;
            }) -- returneaza minimapService.removeWaypoint
        end
        local function setWaypoint(key)
            local addWaypoint = global.registry.addWaypoint
            if addWaypoint then
                local waypoints = client.waypoints
                local gamelocations = client.gamelocations
                for keyName, label in next, waypoints do
                    if label == key then
                        addWaypoint({
                            position = gamelocations[keyName];
                            priority = 100;
                        })
                        break
                    end
                end
            end
        end
        local function getEquippedItem()
            return client.modules.itemSystem.GetLocalEquipped()
        end
        local function unequipAll()
            return client.modules.inventoryItemSystem.unequipAll()
        end
        local function getInventoryItemsFor(player)
            if not player then
                return false
            end
            return client.modules.inventoryItemSystem.getInventoryItemsFor(player)
        end
        local function equip(item)
            local hasItemEquipped = global.registry.hasItemEquipped
            for i,v in next, client.reg.getInventoryItemsFor do
                if v.obj.name == item and not hasItemEquipped(item) and v.AttemptSetEquipped then
                    v:AttemptSetEquipped(true)
                end
            end
        end
        local function dropGun()
            local hasItemEquipped = global.registry.hasItemEquipped
            local neverdrop = {"Taser", "Handcuffs", "RoadSpike", "Bag", "Crate", "Gem"}
            for i,v in next, client.reg.getInventoryItemsFor do
                if not table.find(neverdrop, v.obj.name) then
                    if hasItemEquipped(v.obj.name) then
                        v:AttemptDrop()
                    end
                end
            end
        end
        local function call_elevator_to_floor(floor)
            local casino = workspace:FindFirstChild("Casino")
            if not casino then
                return false
            end
            local elevatorCar = casino.Elevator.Car:GetDescendants()
            if not elevatorCar then
                return false
            end
            local elevatorFloors = casino.Elevator.Floors:GetDescendants()
            if not elevatorFloors then
                return false
            end
            floor = tostring(floor)
            local function clickDetector(floor)
                if floor == 4 then
                    for i,v in next, elevatorCar do
                        if v.Name == "4" and v:FindFirstChild("ClickDetector") then
                            fireclickdetector(v.ClickDetector, math.huge)
                        end
                    end
                    return true
                end
                for i,v in next, elevatorFloors do
                    if v.Name == "Call" and v.Parent.Name == tostring(floor) then
                        fireclickdetector(v.ClickDetector, math.huge)
                    end
                end
            end
            if floor == "The Roof" then
                clickDetector(4)
            end
            if floor == "Security" then
                clickDetector(3)
            end
            if floor == "Ground" then
                clickDetector(2)
            end
            if floor == "Vaults" then
                clickDetector(1)
            end
        end
        local function checkWallBeforePenetration(target) 
            if not target then
                return false
            end
            if workspace:FindFirstChild("Drop") then
                if target:IsDescendantOf(workspace.Drop) then
                    return true
                end
            end
            if workspace:FindFirstChild("MansionRobbery") then
                if target:IsDescendantOf(workspace.MansionRobbery) then
                    return true
                end
            end
            local localChar = client.playerCharacter
            local ignorelist = global.ignorelist
            local camera = workspace.CurrentCamera
            local char = target.Character
            if not char or not localChar then
                return false
            end
            local function rayCheck(target)
                local result = true
                local dist = (camera.CFrame.Position - target.Head.Position).magnitude
                local unit = (target.Head.Position - camera.CFrame.Position).unit
                local list = {camera, client.playerCharacter, player:GetMouse().TargetFilter}
                for i,v in next, ignorelist do
                    table.insert(list, v)
                end
                local ray = Ray.new(camera.CFrame.Position, unit * dist)
                local hit = workspace:FindPartOnRayWithIgnoreList(ray, list)
                if hit and not hit:IsDescendantOf(target) then
                    result = false
                    if not hit.CanCollide and hit.ClassName ~= Terrain or hit:IsDescendantOf(client.descendants.vehicles) then
                        ignorelist[#ignorelist + 1] = hit
                    end
                end
                return result
            end
            local rayCheck = rayCheck(char)
            return rayCheck
        end
        local isAnchored = false
        local function shootGun(target)
            local function attemptShoot(gun)
                if not gun.ShootCheckConditions then
                    return function() end
                end
                pcall(function()
                    client.modules.gun._attemptShoot(gun)
                end)
            end
            local getEquippedItem = client.reg.getEquippedItem
            if not getEquippedItem then
                return false
            end
            attemptShoot(getEquippedItem)
        end
        local function canUseTaser(taser)
            local utils = client.modules.inventoryItemUtils
            return utils.getAttr(taser.inventoryItemValue, "NextUse") > 0
        end
        local function useTaser()
            local function tase(taser)
                global.AI_TASER_USE = true
                task.delay(0.5, function()
                    global.AI_TASER_USE = false
                end)
                return client.modules.taser.Tase(taser, taser)--@nu inteleg de ce trebuie `taser` pus de 2 ori.
            end
            local getEquippedItem = client.reg.getEquippedItem
            if not getEquippedItem then
                return false
            end
            tase(getEquippedItem)
        end
        local function getRobberyStatus(robbery)
            local enums = {
                "OPENED";
                "STARTED";
                "CLOSED";
            }
            local consts = client.modules.robberyConsts
            local robberystate = repl:FindFirstChild("RobberyState")
            for i,v in next, consts.LIST_ROBBERY do
                local enum = consts.ENUM_ROBBERY[v]
                local state = robberystate:FindFirstChild(enum)
                if state then
                    local data = consts.DATA_ROBBERY[enum]
                    if data.key == tostring(robbery) then
                        return enums[state.Value]
                    end
                end
            end
        end
        local function getClosestCrate()
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local plane = workspace:FindFirstChild("Plane")
            if not plane then
                return false
            end
            local crates = plane:FindFirstChild("Crates")
            if not crates then
                return false
            end
            for i,v in next, crates:GetDescendants() do
                if v:IsA("BasePart") then
                    if (v.Position - root.Position).magnitude < 50 then
                        return v
                    end
                end
            end
        end
        local function hasMansioninvite()
            for i,v in next, client.reg.getInventoryItemsFor do
                if v.obj.name == "MansionInvite" then
                    return true
                end
            end
            return false
        end
        local function getKeycode()
            local casino = workspace:FindFirstChild("Casino")
            if not casino then
                return false
            end
            local codes = casino.RobberyDoor.Codes
            local code = ""
            for i,v in next, codes:GetDescendants() do
                if v:IsA("TextLabel") and #v.Text ~= 0 then
                    code = code .. v.Text
                end
            end
            return code
        end
        local function getCasinoDoor()
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local casino = workspace:FindFirstChild("Casino")
            if not casino then
                return false
            end
            local robberyDoor = casino.RobberyDoor:GetDescendants()
            for i,v in next, robberyDoor do
                if v.Name == "Region" then
                    if (v.Position - root.Position).magnitude < 15 then
                        return true
                    end
                end
            end
            return false
        end
        local mostWanted = workspace.MostWanted
        local function getPlayersWithBounty()
            local plrs = {}
            for i,v in next, mostWanted:FindFirstChild("MostWanted"):GetDescendants() do
                if v:IsA("TextLabel") and v.Name == "PlayerName" and v.Name ~= "badcc" then
                    for i2,v2 in next, client.players do
                        if v.Text == v2.DisplayName and not table.find(plrs, v2) then
                            table.insert(plrs, v2)
                        end
                    end
                end
            end
            return plrs
        end
        local function hasInVehicleTag(char)
            if char and char:FindFirstChild("InVehicle") then
                return true
            end
            return false
        end
        local function getClosestPlayer(range, settings)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local rootplr = char:FindFirstChild("HumanoidRootPart")
            if not rootplr then
                return false
            end 
            local isVulnerable = global.registry.isVulnerable
            local target
            local dist = 0
            for i,v in next, client.players do
                if v ~= player then
                    local isVul = isVulnerable(player.Team, v.Team)
                    if isVul then
                        local char = v.Character
                        if char then
                            local hum = char:FindFirstChild("Humanoid")
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if hum and root and hum.Health > 0 then
                                local mag = (root.Position - rootplr.Position).magnitude
                                if not target and mag < range then
                                    target = v
                                    dist = mag
                                end
                                if target and mag < range and mag < dist then
                                    target = v
                                    dist = mag
                                end
                            end
                        end
                    end 
                end
            end
            return target
        end
        local function getClosestPlayerWithVehicleTag(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local rootplr = char:FindFirstChild("HumanoidRootPart")
            if not rootplr then
                return false
            end
            local target = {}
            for i,v in next, client.players do
                if v ~= player then
                    local char = v.Character
                    if char and hasInVehicleTag(char) then
                        local hum = char:FindFirstChild("Humanoid")
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if hum and root and hum.Health > 0 then
                            if (root.Position - rootplr.Position).magnitude < range then
                                table.insert(target, v)
                            end
                        end
                    end
                end
            end
            return target
        end
        local function getClosestPlayerForBreakouts(range)
            if tostring(player.Team) == "Police" then
                return false
            end
            local char = client.playerCharacter
            if not char then
                return false
            end
            local rootplr = char:FindFirstChild("HumanoidRootPart")
            if not rootplr then
                return false
            end
            local target, dist = nil, 0
            for i,v in next, client.players do
                if v ~= player then
                    if tostring(v.Team) ~= "Police" then
                        local char = v.Character
                        if char and v.Folder:FindFirstChild("Cuffed") then
                            local hum = char:FindFirstChild("Humanoid")
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if hum and root and hum.Health > 0 then
                                local distance = player:DistanceFromCharacter(root.Position)
                                if distance < range then
                                    target = v
                                end
                            end
                        end
                    end 
                end
            end
            return target
        end
        local function getClosestPlayerByFov(range, isJetSearch)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local rootplr = char:FindFirstChild("HumanoidRootPart")
            if not rootplr then
                return false
            end
            local camera = workspace.CurrentCamera
            local mouse = player:GetMouse()
            local mousepos = Vector2.new(mouse.X, mouse.Y)
            local target, dist = nil, 1281
            local allow_target_boss = global.ui_status.allow_target_boss
            local allow_target_npcs = global.ui_status.allow_target_npcs
            local allow_target_prisoner = global.ui_status.allow_target_prisoner
            local mansionRobbery = workspace:FindFirstChild("MansionRobbery")
            if allow_target_boss then
                if mansionRobbery then
                    local boss = mansionRobbery:FindFirstChild("ActiveBoss")
                    if boss then
                        local hum = boss:FindFirstChild("Humanoid")
                        local root = boss:FindFirstChild("HumanoidRootPart")
                        if hum and root and hum.Health > 0 then
                            local _, onscreen = camera:WorldToScreenPoint(root.Position)
                            if onscreen then
                                local dis = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(_.X, _.Y)).magnitude
                                if dis < dist and dis < range*1.5 and (root.Position - rootplr.Position).magnitude < 300 then
                                    dist = dis
                                    target = boss
                                end
                            end
                        end
                        if target then
                            return target
                        end
                    end
                end
            end
            if allow_target_npcs then
                local drop = workspace:FindFirstChild("Drop")
                if drop then
                    if #workspace.GuardNPCPlayers:GetChildren() > 0 then
                        for i,v in next, workspace.GuardNPCPlayers:GetChildren() do
                            if v and v.Value then
                                local hum = v.Value:FindFirstChild("Humanoid")
                                local root = v.Value:FindFirstChild("HumanoidRootPart")
                                if hum and root and hum.Health > 0 then
                                    local _, onscreen = camera:WorldToScreenPoint(root.Position)
                                    if onscreen then
                                        local dis = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(_.X, _.Y)).magnitude
                                        if dis < dist and dis < range*1.5 and (root.Position - rootplr.Position).magnitude < 300 then
                                            dist = dis
                                            target = v.Value
                                        end
                                    end
                                end
                            end
                        end
                        if target then
                            return target
                        end
                    end
                end
                if mansionRobbery then
                    local guardsFolder = mansionRobbery.GuardsFolder
                    if #guardsFolder:GetChildren() > 0 then
                        for i,v in next, guardsFolder:GetChildren() do
                            local hum = v:FindFirstChild("Humanoid")
                            local root = v:FindFirstChild("HumanoidRootPart")
                            if hum and root and hum.Health > 0 then
                                local _, onscreen = camera:WorldToScreenPoint(root.Position)
                                if onscreen then
                                    local dis = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(_.X, _.Y)).magnitude
                                    if dis < dist and dis < range*1.5 and (root.Position - rootplr.Position).magnitude < 300 then
                                        dist = dis
                                        target = v
                                    end
                                end
                            end
                        end
                        if target then
                            return target
                        end
                    end
                end
            end
            for i,v in next, client.players do
                if v ~= player then
                    if not isJetSearch and isVulnerable(player.Team, v.Team, {
                        prisonerTarget = global.ui_status.allow_target_prisoner
                    }) or isJetSearch then
                        local char = v.Character
                        if char and char:IsDescendantOf(workspace) then
                            local hum = char:FindFirstChild("Humanoid")
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if hum and root and hum.Health > 0 then
                                local _, onscreen = camera:WorldToScreenPoint(root.Position)
                                if onscreen then
                                    local dis = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(_.X, _.Y)).magnitude
                                    if dis < dist and dis < range*1.5 and (root.Position - rootplr.Position).magnitude < 12000 then
                                        dist = dis
                                        target = v
                                    end
                                end
                            end
                        end
                    end
                end
            end
            return target
        end
        local function getClosestHeliPickup(part, range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local getLocalVehicle = client.reg.getLocalVehicle
            if not getLocalVehicle then
                return false
            end
            local getHeliRope = global.registry.getHeliRope(getLocalVehicle) 
            if not getHeliRope then
                return false
            end
            local target
            local vehicleLinkUtils = client.modules.vehicleLinkUtils
            local geomUtils = client.modules.geomUtils
            for i,v in next, collectionservice:GetTagged("HeliPickup") do
                if v ~= getLocalVehicle.Model then
                    local getPrimaryPart = vehicleLinkUtils.getPrimaryPart(v)
                    if getPrimaryPart then
                        local mag = (part.Position - geomUtils.closestPointInPart(getPrimaryPart, part.Position)).magnitude
                        if mag < range then
                            range = mag
                            target = v
                        end
                    end
                end
            end
            return target
        end
        local function getClosestPlayerWithNoHandcuffs(range, bool)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local rootplr = char:FindFirstChild("HumanoidRootPart")
            if not rootplr then
                return false
            end
            local target
            for i,v in next, client.players do
                if v ~= player then
                    if tostring(v.Team) ~= tostring(player.Team) and tostring(v.Team) ~= "Prisoner" then
                        local char = v.Character
                        if char then
                            local hum = char:FindFirstChild("Humanoid")
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if hum and root and hum.Health > 0 then
                                if (root.Position - rootplr.Position).magnitude < range then
                                    if bool and v.Folder:FindFirstChild("Cuffed") then
                                        return v
                                    end
                                    if not v.Folder:FindFirstChild("Cuffed") then
                                        target = v
                                    end
                                end
                            end
                        end
                    end
                end
            end
            return target
        end
        local function getClosestPlayerWithTagPolice(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local rootplr = char:FindFirstChild("HumanoidRootPart")
            if not rootplr then
                return false
            end
            for i,v in next, client.players do
                if v ~= player then
                    if tostring(v.Team) == "Police" and tostring(player.Team) ~= tostring(v.Team) then
                        local char = v.Character
                        if char then
                            local hum = char:FindFirstChild("Humanoid")
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if hum and root and hum.Health > 0 then
                                if (root.Position - rootplr.Position).magnitude < range then
                                    return v
                                end
                            end
                        end
                    end
                end
            end
        end
        local function getClosestDroppedCash(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            if #workspace.DroppedCash:GetChildren() > 0 then
                for i,v in next, workspace.DroppedCash:GetChildren() do
                    local part = v.Part
                    if part then
                        if (part.Position - root.Position).magnitude < range then
                            return v
                        end
                    end
                end
            end
            return false
        end
        local function getBattleInvites()
            local invites = {}
            for i,v in next, player.CrewBattleInvitesFolder:GetChildren() do
                table.insert(invites, v.Name)
            end
            return invites
        end
        local function getBattleResponseRemote()
            return repl.BattleResponseRemote
        end
        local function getBattleReadyUpRemote()
            return repl.ReadyUpRemote
        end
        local function getClanId(self)
            return player:GetAttribute("CurrentClanId")
        end
        local function isClanAdmin()
            return player:GetAttribute("IsPlayerClanAdminCached")
        end
        local function getClanPlayersOnlineId(self)
            local getClanId = self:getClanId()
            if getClanId then
                local numClanPlayersOnline = repl:FindFirstChild("ClanPlayersOnline")
                if numClanPlayersOnline then
                    local key = numClanPlayersOnline:FindFirstChild(getClanId)
                    if key then
                        return key
                    end
                end
            end
        end
        local function getClanPlayersOnline(self)
            local getClanPlayersOnlineId = self:getClanPlayersOnlineId()
            if getClanPlayersOnlineId then
                return #getClanPlayersOnlineId:GetChildren()
            end
            return false
        end
        local function getNextShotPossible()
            return player:GetAttribute("NextShotPossibleTime") or os.time()
        end
        local function getClosestCasinoLoot(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local casino = workspace:FindFirstChild("Casino")
            if not casino then
                return false
            end
            for i,v in next, casino.Loots:GetChildren() do
                if (v.Position - root.Position).magnitude < range then
                    return v
                end
            end
            return false
        end
        local function getClosestComputer(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local casino = workspace:FindFirstChild("Casino")
            if not casino then
                return false
            end
            for i,v in next, casino.Computers:GetDescendants() do
                if v.Name == "Computer" then
                    local display = v:FindFirstChild("Display")
                    if tostring(display.BrickColor) == "Really black" or tostring(display.BrickColor) == "Really red" then
                        if (display.Position - root.Position).magnitude < range then
                            return v
                        end
                    end
                end
            end
            return false
        end
        local function getClosestBankDoor(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local banks = workspace:FindFirstChild("Banks")
            if not banks then
                return false
            end
            for i,v in next, banks:GetDescendants() do
                if v:IsA("Part") and v.Name == "BankDoor" then
                    if (v.Position - root.Position).magnitude < range then
                        return v
                    end
                end
            end
        end
        local function getClosestTriggerDoor(range)
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            local banks = workspace:FindFirstChild("Banks")
            if not banks then
                return false
            end
            for i,v in next, banks:GetDescendants() do
                if v.Name == "TriggerDoor" then
                    if (v.Position - root.Position).magnitude < range then
                        return v
                    end
                end
            end
            return false
        end
        local function resolvePowerplant()
            local flow = getupvalue(client.modules.puzzleFlow.Init,3)
            local function add1()
                for _=1, #flow.Grid do
                    local grid = flow.Grid[_]
                    for n=1, #grid do
                        local num = grid[n]
                        num = num + 1
                        grid[n] = num
                    end
                end
            end
            local function remove1()
                for _=1, #flow.Grid do
                    local grid = flow.Grid[_]
                    for n=1, #grid do
                        local num = grid[n]
                        num = num - 1
                        grid[n] = num
                    end
                end
            end
            local function resolveRequest()
                return "-s-1-->>.s-xa5";
            end
            local function resolver()
                add1()
                local resolveRequest = resolveRequest()
                if not resolveRequest then
                    remove1()
                    return false
                end
                if not resolveRequest.Body then
                    remove1()
                    return false
                end
                pcall(function()
                    local body = httpservice:JSONDecode(resolveRequest.Body)
                    if body.status then
                        flow.Grid = body.resolved
                    end
                end)
                remove1()
                flow.OnConnection()
            end
            resolver()
            return true
        end
        local function resolveOwnedItems()
            local tbl = {}
            for i,v in next, player.Items:GetChildren() do
                if v.Name ~= "SmokeGrenade" and v.Name ~= "C4" and v.Name ~= "RocketLauncher" then
                    table.insert(tbl, v.Name)
                end
            end
            return tbl
        end
        local function resolveEquippedItems()
            local tbl = {}
            for i,v in next, player.Folder:GetChildren() do
                if v.Name ~= "SmokeGrenade" and v.Name ~= "C4" and v.Name ~= "RocketLauncher" then
                    table.insert(tbl, v.Name)
                end
            end
            return tbl
        end
        local function isInMuseum()
            local upv = getupvalue(global.registry.isInMuseumRobbery, 1)
            if upv then
                return true
            end
            return false
        end
        local function callplane()
            for i,v in next, client.modules.ui.CircleAction.Specs do
                if v.Name == "Call Cargo Plane" then
                    v:Callback(true)
                end
            end
        end
        local function dieOfFalldamage()
            if global.isRespawning then
                return false
            end
            global.isRespawning = true
            setupvalue(global.registry.falling,1,true)
            setupvalue(global.registry.falling,5,999999)
            global.registry.falling(1)
            task.delay(1, function()
                global.isRespawning = false
            end)
        end
        local function tpFootball()
            local ball = workspace:FindFirstChild("SoccerBall")
            if not ball then
                log("ball dont exist")
                return false
            end
            local isnetworkowner = global.functions.isnetworkowner
            if isnetworkowner(ball) then
                local coords = CFrame.new(1139, 108, 1106)
                ball.CFrame = coords
            end
        end
        local function lighting_technology(val)
            pcall(function()
                val = tostring(val)
                global.ui_status.technology = val
                sethiddenproperty(lighting, "Technology", global.ui_status.technology)
            end)
        end
        local function getSpeedometer()
            return player.PlayerGui.AppUI:FindFirstChild("Speedometer") or nil
        end
        global.registry.addWaypoint = addWaypoint
        global.registry.setWaypoint = setWaypoint
        global.registry.hasInVehicleTag = hasInVehicleTag
        global.registry.getSpeedometer = getSpeedometer
        global.registry.getClanId = getClanId
        global.registry.isClanAdmin = isClanAdmin
        global.registry.getBattleReadyUpRemote = getBattleReadyUpRemote
        global.registry.getClanPlayersOnlineId = getClanPlayersOnlineId
        global.registry.getClanPlayersOnline = getClanPlayersOnline
        global.registry.getNextShotPossible = getNextShotPossible
        global.registry.getBattleResponseRemote = getBattleResponseRemote
        global.registry.getBattleInvites = getBattleInvites
        global.registry.hasMansioninvite = hasMansioninvite
        global.registry.lighting_technology = lighting_technology
        global.registry.generateJobId = generateJobId
        global.registry.getLocalVehicle = getLocalVehicle
        global.registry.getClosestHeliPickup = getClosestHeliPickup
        global.registry.getPlayerVehicle = getPlayerVehicle
        global.registry.getCasinoDoor = getCasinoDoor
        global.registry.getClosestPlayer = getClosestPlayer
        global.registry.getClosestPlayerByFov = getClosestPlayerByFov
        global.registry.getClosestPlayerWithNoHandcuffs = getClosestPlayerWithNoHandcuffs
        global.registry.getClosestPlayerWithTagPolice = getClosestPlayerWithTagPolice
        global.registry.getClosestDroppedCash = getClosestDroppedCash
        global.registry.isVulnerable = isVulnerable
        global.registry.getClosestBankDoor = getClosestBankDoor
        global.registry.getClosestCasinoLoot = getClosestCasinoLoot
        global.registry.getClosestPlayerForBreakouts = getClosestPlayerForBreakouts
        global.registry.getClosestComputer = getClosestComputer
        global.registry.tpFootball = tpFootball
        global.registry.getClosestTriggerDoor = getClosestTriggerDoor
        global.registry.constructMarker = constructMarker
        global.registry.getPartsInRegion = getPartsInRegion
        global.registry.setColor = setColor
        global.registry.getPlayersWithBounty = getPlayersWithBounty
        global.registry.getClosestPlayerWithVehicleTag = getClosestPlayerWithVehicleTag
        global.registry.getInventoryItemsFor = getInventoryItemsFor
        global.registry.dropGun = dropGun
        global.registry.canUseTaser = canUseTaser
        global.registry.getClosestCrate = getClosestCrate
        global.registry.destructMarker = destructMarker
        global.registry.doesMarkerExist = doesMarkerExist
        global.registry.checkWallBeforePenetration = checkWallBeforePenetration
        global.registry.hasItemEquipped = hasItemEquipped
        global.registry.unequipAll = unequipAll
        global.registry.markerColors = markerColors
        global.registry.call_elevator_to_floor = call_elevator_to_floor
        global.registry.getEquippedItem = getEquippedItem
        global.registry.getKeycode = getKeycode
        global.registry.shootGun = shootGun
        global.registry.useTaser = useTaser
        global.registry.equip = equip
        global.registry.getHeliRope = getHeliRope
        global.registry.isInMuseum = isInMuseum
        global.registry.resolveOwnedItems = resolveOwnedItems
        global.registry.resolveEquippedItems = resolveEquippedItems
        global.registry.resolvePowerplant = resolvePowerplant
        global.registry.callplane = callplane
        global.registry.getRobberyStatus = getRobberyStatus
        global.registry.dieOfFalldamage = dieOfFalldamage
    end
    registry()
    local function client_reg()
        local function loop()
            if global.registry.getEquippedItem then
                client.reg.getEquippedItem = global.registry.getEquippedItem()
            end
            if global.registry.getLocalVehicle then
                client.reg.getLocalVehicle = global.registry.getLocalVehicle()
                if client.reg.getLocalVehicle then
                    client.state.isLocalInVehicle = true
                else
                    client.state.isLocalInVehicle = false
                end
            end
            if global.registry.resolveOwnedItems then
                client.reg.resolveOwnedItems = global.registry.resolveOwnedItems()
            end
            if global.registry.resolveEquippedItems then
                client.reg.resolveEquippedItems = global.registry.resolveEquippedItems()
            end
            if global.registry.getInventoryItemsFor then
                client.reg.getInventoryItemsFor = global.registry.getInventoryItemsFor(player)
            end
            if global.registry.getClosestPlayerByFov then
                local getClosestPlayerByFov = global.registry.getClosestPlayerByFov
                local getEquippedItem = client.reg.getEquippedItem
                if getEquippedItem then
                    if getEquippedItem.__ClassName == "Taser" then
                        if global.ui_status.master_switch_silentaim or global.ui_status.allow_tase_target then
                            client.reg.getClosestPlayerByFov = getClosestPlayerByFov(5000)
                        end
                    else
                        if global.ui_status.master_switch_silentaim then
                            if global.ui_status.fov_target_select then
                                local fov = global.ui_status.fov_silentaim or 0
                                client.reg.getClosestPlayerByFov = getClosestPlayerByFov(fov)
                            else
                                client.reg.getClosestPlayerByFov = getClosestPlayerByFov(1200)
                            end
                        end
                    end
                end
                local getLocalVehicle = client.reg.getLocalVehicle
                if getLocalVehicle then
                    if tostring(getLocalVehicle.Make) == "Jet" then
                        if global.ui_status.master_switch_plane then
                            if global.ui_status.automatic_jet_heat_seek then
                                if not getEquippedItem then
                                    client.reg.getClosestPlayerByFov = getClosestPlayerByFov(2000, true)
                                end
                            end
                        end
                    end
                end
            end
        end
        createloop(0.2, loop)
    end
    client_reg()
    while true do
        if client.reg.resolveOwnedItems then
            break
        end
        task.wait()
    end
    local function hideSectionsOnMarkersOff()
        local markerSection = global.ui.markerSection
        local function getTeamsSection()
            local teamsSection = markerSection.teamsSection
            return teamsSection
        end
        local function getObjSection()
            local objSection = markerSection.objSection
            return objSection
        end
        local function getSettingsSection()
            local settingsSection = markerSection.settingsSection
            return settingsSection
        end
        local getTeamsSection = getTeamsSection()
        local getObjSection = getObjSection()
        local getSettingsSection = getSettingsSection()
        local function loop()
            local master_switch_marker = global.ui_status.master_switch_marker
            if getTeamsSection then
                getTeamsSection.frame.Visible = master_switch_marker
            end
            if getObjSection then
                getObjSection.frame.Visible = master_switch_marker
            end
            if getSettingsSection then
                getSettingsSection.frame.Visible = master_switch_marker
            end
        end
        createloop(0, loop)
    end
    hideSectionsOnMarkersOff()
    local function removeSettings()
        local settings = player.PlayerGui.AppUI.DevPanel.Container.SETTINGS.SETTINGS
        local playerMarkers = settings:FindFirstChild("playerMarkers")
        if playerMarkers then
            playerMarkers.Visible = false
        end
    end
    removeSettings()
    local workspaceChildren = {}
    local function workspaceChildAdded(obj)
        table.insert(workspaceChildren, obj)
    end
    for i,v in next, workspace:GetChildren() do
        table.insert(workspaceChildren, v)
    end
    table.insert(client.onWorkspaceSpawnRun, {
        _fn = workspaceChildAdded
    })
    local function findEmptyFolder()
        for i,v in next, workspaceChildren do
            if v.Name == "Folder" and v:IsA("Folder") and #v:GetChildren() == 0 then
                log(("Destroyed `%s`"):format(v.Name))
                v:Destroy()
            end
        end
    end
    findEmptyFolder()
    local function Corrections()
        local function networkOwnership()
            local setscriptable = global.functions.setscriptable
            local isnetworkowner = global.functions.isnetworkowner
            local function loop()
                setscriptable(player, "SimulationRadius", true)
                player.SimulationRadius = math.huge, math.huge
            end
            local function onSimulationRadiusChanged(r)
                r = 9e9
                return r
            end
            player.SimulationRadiusChanged:connect(onSimulationRadiusChanged)
            createloop(0, loop)
        end
        networkOwnership()
        local function battleInvitesAccept()
            local battleInvitesFolder = player:FindFirstChild("CrewBattleInvitesFolder")
            if not battleInvitesFolder then
                log("LocalPlayer is in battle.. Automatic Accept is not available.")
                return false
            end
            local battleInvites
            local function tagService()
                battleInvites = client.tags.new("battleInvites", 0, false, function(val)
                    if val then
                        local getBattleInvites = global.registry.getBattleInvites()
                        if getBattleInvites and #getBattleInvites ~= 0 then
                            for i,v in next, getBattleInvites do
                                local getBattleResponseRemote = global.registry.getBattleResponseRemote()
                                getBattleResponseRemote:FireServer(v, true)
                            end
                        end
                    end
                end)
            end
            tagService()
            local function onBattleInvitesFolderChildAdded(obj)
                local bool = global.ui_status.auto_accept_battle
                if bool then
                    local getBattleResponseRemote = global.registry.getBattleResponseRemote()
                    getBattleResponseRemote:FireServer(obj.Name, true)
                end
            end
            player.CrewBattleInvitesFolder.ChildAdded:connect(onBattleInvitesFolderChildAdded)
            local function loop()
                local bool = global.ui_status.auto_accept_battle
                if battleInvites then
                    battleInvites.obj.Value = bool
                end
            end
            createloop(0, loop)
        end
        battleInvitesAccept()
        local function battleStart()
            local battleInvitesFolder = player:FindFirstChild("CrewBattleInvitesFolder")
            if not battleInvitesFolder then
                log("LocalPlayer is in battle.. Automatic Battle Start is not available.")
                return false
            end
            local battleStartObj
            local function tagService()
                battleStartObj = client.tags.new("battleStart", 0, false, function(val)
                    if val then
                        local getClanPlayersOnline = global.registry:getClanPlayersOnline()
                        if getClanPlayersOnline and getClanPlayersOnline >= 3 then
                            local isClanAdmin = global.registry.isClanAdmin()
                            if isClanAdmin then
                                local getBattleReadyUpRemote = global.registry.getBattleReadyUpRemote()
                                if getBattleReadyUpRemote then
                                    getBattleReadyUpRemote:FireServer()
                                end
                            end
                        end
                    end
                end)
            end
            tagService()
            local function onOnlineValueChanged(num)
                local bool = global.ui_status.auto_start_matchmaking
                if bool then
                    local getClanPlayersOnline = global.registry:getClanPlayersOnline()
                    if getClanPlayersOnline and getClanPlayersOnline >= 3 then
                        local isClanAdmin = global.registry.isClanAdmin()
                        if isClanAdmin then
                            local getBattleReadyUpRemote = global.registry.getBattleReadyUpRemote()
                            if getBattleReadyUpRemote then
                                getBattleReadyUpRemote:FireServer()
                            end
                        end
                    end
                end
            end
            local getClanPlayersOnlineId = global.registry:getClanPlayersOnlineId()
            if getClanPlayersOnlineId then
                getClanPlayersOnlineId.Changed:connect(onOnlineValueChanged)
            else
                log("LocalPlayer is not in a clan. Adding cache to get the changed status of Clan.")
                local cache
                cache = createloop(1, function()
                    local getClanPlayersOnlineId = global.registry:getClanPlayersOnlineId()
                    if getClanPlayersOnlineId then
                        getClanPlayersOnlineId.Changed:connect(onOnlineValueChanged)
                        cache:disconnect()
                        cache = nil
                    end
                end)
            end
            local function loop()
                local bool = global.ui_status.auto_start_matchmaking
                if battleStartObj then
                    battleStartObj.obj.Value = bool
                end
            end
            createloop(0, loop)
        end
        battleStart()
        local function waypoints()
            local waypointsTbl = client.waypoints
            local list = {}
            for keyName, label in next, waypointsTbl do
                table.insert(list, label)
            end
            local function assignLocations()
                local config = global.config
                local cfg = config.place_waypoint
                cfg.list = list
                task.delay(0.2, function()
                    cfg.reload(cfg.list)
                end)
            end
            assignLocations()
        end
        waypoints()
        local function onWorkspaceSpawnRun()
            local function onSpawnRun(obj)
                for i,v in next, client.onWorkspaceSpawnRun do
                    v._fn(obj)
                end
            end
            workspace.ChildAdded:connect(onSpawnRun)
        end
        onWorkspaceSpawnRun()
        local function playerStateCorrection()
            local function requestJump()
                local hum = client.playerCharacter and client.playerCharacter:FindFirstChild("Humanoid")
                if global.ui_status and global.ui_status.alwaysjump and hum then
                    hum:ChangeState("Jumping")
                end
            end
            uis.JumpRequest:connect(requestJump)
        end
        playerStateCorrection()
        local function fortnitedance()
            local is_dancing = false
            local party = client.modules.party.Init
            local model
            local function discoModel()
                local m = Instance.new("Model")
                m.Name = "samibagpulanunguri"
                m.Parent = workspace
                model = m
            end
            discoModel()
            local stopDancing = getupvalue(party,6)
            local startDancing = getupvalue(party,5)
            local danceAnim = getupvalue(getupvalue(party, 4), 8)
            local function onCharacterRemoving()
                if is_dancing then
                    stopDancing()
                    task.wait(0.1)
                    if is_dancing and global.ui_status.dance then
                        startDancing(model)
                    else
                        is_dancing = false
                    end
                end
            end
            player.CharacterAdded:connect(onCharacterRemoving)
            local cache_switch
            local cache_speed
            local function tagService()
                cache_switch = client.tags.new("fortnite", 0, false, function(val)
                    if val then
                        is_dancing = true
                        startDancing(model)
                    else
                        is_dancing = false
                        stopDancing()
                    end
                    if is_dancing and cache_speed.obj.Value then
                        danceAnim:AdjustSpeed(tonumber(cache_speed.obj.Value))
                    end
                end)
                cache_speed = client.tags.new("fortniteSpeed", 1, 0, function(val)
                    if not is_dancing then
                        return false
                    end
                    danceAnim:AdjustSpeed(tonumber(val))
                end)
            end
            tagService()
            local function loop()
                local bool = global.ui_status.dance
                local speed = global.ui_status.dance_speed
                if cache_switch then
                    cache_switch.obj.Value = bool
                    if bool then
                        cache_speed.obj.Value = speed
                    end
                end
            end
            createloop(0, loop)
        end
        fortnitedance()
        local function duckCorrection()
            local function automatic()
                local function loop()
                    local bool = global.ui_status.always_duck
                    if not bool then
                        return false
                    end
                    local buttons = global.registry.buttons
                    if not buttons then
                        return false
                    end
                    pcall(function()
                        buttons.attemptToggleCrawling()
                    end)
                end
                createloop(0.3, loop)
            end
            automatic()
            local function loop()
                local bool = global.ui_status.infduck
                if bool then
                    local lastDuckTick = global.registry.lastDuckTick
                    table.clear(lastDuckTick)
                    table.insert(lastDuckTick, 1, 0)
                end
            end
            createloop(0, loop)
        end
        duckCorrection()
        local function ispointintagCorrection()
            local module = client.modules.tagUtils.isPointInTag
            local function hook(plr, str)
                if global.isRespawning then
                    return module(plr, str)
                end
                local falldmg_bool = global.ui_status.antifalldamage
                local ragdoll_bool = global.ui_status.antiragdoll
                if str == "NoFallDamage" then
                    if falldmg_bool then
                        return true
                    end
                end
                if str == "NoRagdoll" then
                    if ragdoll_bool then
                        return true
                    end
                end
                return module(plr, str)
            end
            client.modules.tagUtils.isPointInTag = hook
        end
        ispointintagCorrection()
        local function humanoidCorrection()
            local function loop()
                local char = client.playerCharacter
                if char then
                    local hum = char:FindFirstChild("Humanoid")
                    if hum then
                        if client.confirmation.confirmed.ws then
                            if global.ui_status.master_switch_walkspeed then
                                hum.WalkSpeed = global.ui_status.walkspeed
                            else
                                hum.WalkSpeed = hum.WalkSpeed
                            end
                        end
                        if client.confirmation.confirmed.jp then
                            if global.ui_status.master_switch_jumppower then
                                if global.ui_status.jp_disable_if_handcuffed and player.Folder:FindFirstChild("Cuffed") then
                                    hum.JumpPower = 50
                                    return true
                                end
                                hum.JumpPower = global.ui_status.jumppower
                            else
                                hum.JumpPower = 50
                            end
                        end
                    end
                end
            end
            createloop(0, loop)
        end
        humanoidCorrection()
        local function confirmation()
            local ws = {
                msg = "WalkSpeed may be detected. Use at your own risk?";
                confirmationLoaded = false;
            };
            local jp = {
                msg = "JumpPower may be detected. Use at your own risk?";
                confirmationLoaded = false;
            }
            local pb = {
                msg = "Parachute Boost may be detected. Use at your own risk?";
                confirmationLoaded = false;
            }
            local function loop()
                if global.ui_status.master_switch_walkspeed then
                    if not client.confirmation.confirmed.ws and not ws.confirmationLoaded then
                        ws.confirmationLoaded = true
                        local new = client.confirmation.new(ws.msg)
                        client.confirmation.onYes(new, function()
                            new = nil
                            client.confirmation.confirmed.ws = true
                        end)
                        client.confirmation.onNo(new, function()
                            new = nil
                            client.confirmation.confirmed.ws = false
                        end)
                    end
                end
                if global.ui_status.master_switch_jumppower then
                    if not client.confirmation.confirmed.jp and not jp.confirmationLoaded then
                        jp.confirmationLoaded = true
                        local new = client.confirmation.new(jp.msg)
                        client.confirmation.onYes(new, function()
                            new = nil
                            client.confirmation.confirmed.jp = true
                        end)
                        client.confirmation.onNo(new, function()
                            new = nil
                            client.confirmation.confirmed.jp = false
                        end)
                    end
                end
                if global.ui_status.parachute_boost then
                    if not client.confirmation.confirmed.parachute_boost and not pb.confirmationLoaded then
                        pb.confirmationLoaded = true
                        local new = client.confirmation.new(pb.msg)
                        client.confirmation.onYes(new, function()
                            new = nil
                            client.confirmation.confirmed.parachute_boost = true
                        end)
                        client.confirmation.onNo(new, function()
                            new = nil
                            client.confirmation.confirmed.parachute_boost = false
                        end)
                    end
                end
            end
            createloop(0, loop)
        end
        confirmation()
        local function playExplosionFxCorrection()
            local _playExplosionFx = client.modules.smoke._playExplosionFx
            local function hook(...)
                local bool = global.ui_status.disable_smoke_grenade_effect
                if bool then
                    return task.wait(9e9)
                end
                return _playExplosionFx(...)
            end
            client.modules.smoke._playExplosionFx = hook
        end
        playExplosionFxCorrection()
        local function playerUtilsCorrection()
            local function KeycardCorrection()
                local sys = client.modules.inventoryItemSystem
                local function hook()
                    local bool = global.ui_status.always_keycard
                    if tostring(player.Team) == "Police" then
                        return true
                    end
                    if sys.playerHasItem(player, "Key") then
                        return true
                    end
                    if bool then
                        return true
                    end
                    return false
                end
                client.modules.playerUtils.hasKey = hook
            end
            KeycardCorrection()
            local function billboardCorrection()
                local function loop()
                    local bool = global.ui_status.hide_name_in_vehicle
                    if bool then
                        local char = client.playerCharacter
                        if char then
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if root then
                                local PlayerBillboard = root:FindFirstChild("PlayerBillboard")
                                if PlayerBillboard then
                                    PlayerBillboard:Destroy()
                                end
                            end
                        end
                    end
                end
                createloop(0, loop)
            end
            billboardCorrection()
            log("hi wassup dude!!! (◣_◢)")
        end
        playerUtilsCorrection()
        local function waterPartsCorrection()
            local function instance()
                local function makePart()
                    local part = Instance.new("Part")
                    part.Name = "JESUS"
                    part.Parent = workspace
                    part.Anchored = true
                    part.Transparency = 1
                    part.Size = Vector3.new(200, 3, 200)
                end
                makePart()
                local function loop()
                    local bool = global.ui_status.jesus
                    if bool then
                        if not workspace:FindFirstChild("JESUS") then
                            makePart()
                        end
                    else
                        if workspace:FindFirstChild("JESUS") then
                            workspace.JESUS.Position = Vector3.new(0, -5, 0)
                        end
                    end
                end
                createloop(0, loop)
            end
            instance()
            local function isInWater()
                local char = client.playerCharacter
                if char then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        local params = RaycastParams.new()
                        local ray = workspace:Raycast(root.Position, Vector3.new(0, -5, 0) + root.CFrame.LookVector * 5, params)
                        if ray then
                            if ray.Material == Enum.Material.Water then
                                return ray
                            end
                            if ray.Instance.Name == "JESUS" then
                                return ray
                            end
                        end
                    end
                end
                return false
            end
            local function isPartInWater(part)
                if not part then
                    return false
                end
                local params = RaycastParams.new()
                local ray = workspace:Raycast(part.Position, Vector3.new(0, -5, 0) + part.CFrame.LookVector * 5, params)
                if ray then
                    if ray.Material == Enum.Material.Water then
                        return ray
                    end
                end
                return false
            end
            local hasInVehicleTag = global.registry.hasInVehicleTag
            local function loop()
                if not client.playerCharacter then
                    return false
                end
                local bool = global.ui_status.jesus
                if bool then
                    local inst = workspace:FindFirstChild("JESUS")
                    if inst then
                        local char = client.playerCharacter
                        if char then
                            local jesusPart
                            if hasInVehicleTag(char) then
                                local regVehicle = client.reg.getLocalVehicle
                                if regVehicle and regVehicle.Model:FindFirstChild("Engine") then
                                    jesusPart = regVehicle.Model.Engine
                                end
                            else
                                jesusPart = char:FindFirstChild("HumanoidRootPart")
                            end
                            if jesusPart then
                                local isPartInWater = isPartInWater(jesusPart)
                                if isPartInWater then
                                    inst.Position = isPartInWater.Position - Vector3.new(0, 3, 0)
                                    inst.Anchored = true
                                    inst.Transparency = 1
                                    inst.Size = Vector3.new(200, 4, 200)
                                end
                            end
                        end
                    end
                end
            end
            createloop(0, loop)
        end
        waterPartsCorrection()
        local function circleActions()
            local cache
            local function tagService()
                cache = client.tags.new("no_circle_delay", 0, false, function(val)
                    local specs = client.modules.ui.CircleAction.Specs
                    for i,v in next, specs do
                        if v and v.Name ~= "Rob" and v.Name ~= "Hack" and v.Name ~= "Open Crate" and v.Name ~= "Break In" then
                            if v.Duration then
                                if not v.oldVal then
                                    v.oldVal = v.Duration
                                    if val then
                                        v.Duration = 0
                                    end
                                else
                                    v.Duration = val and 0 or v.oldVal
                                end
                            end
                        end
                    end
                end)
            end
            tagService()
            local add = client.modules.ui.CircleAction.Add
            local function hook(v, ...)
                if v and v.Name and v.Name ~= "Rob" and v.Name ~= "Hack" and v.Name ~= "Open Crate" and v.Name ~= "Break In" then
                    if v.Duration then
                        v.oldVal = v.Duration
                        if global.ui_status.master_switch_no_circle_delay then
                            v.Duration = 0
                        else
                            v.Duration = v.oldVal
                        end
                    end
                end
                return add(v, ...)
            end
            client.modules.ui.CircleAction.Add = hook
            local localization = client.modules.localization
            local function arrestCircleUpdate()
                for i,v in next, getconnections(runservice.Heartbeat) do
                    if v.Function and not is_synapse_function(v.Function) then
                        local con = getconstants(v.Function)
                        if table.find(con, "Team") and table.find(con, "Police") and table.find(con, "OnTeamChanged") then
                            local old = getupvalue(v.Function, 1)
                            setupvalue(v.Function, 1, function()
                                local bool = global.ui_status.master_switch_no_circle_delay
                                if bool then
                                    for i,v in next, client.modules.ui.CircleAction.Specs do
                                        if v.Name == localization:FormatByKey("Action.Arrest") then
                                            v.Duration = 0
                                        end
                                    end
                                end
                                return old()
                            end)
                        end
                    end
                end
            end
            arrestCircleUpdate()
            local function loop()
                local bool = global.ui_status.master_switch_no_circle_delay
                if cache then
                    cache.obj.Value = bool
                end
            end
            createloop(0, loop)
        end
        circleActions()
        local function punchCorrection()
            local function automatic()
                local lastPunch = tick()
                local function loop()
                    local bool = global.ui_status.automatic_punch
                    if not bool then
                        return false
                    end
                    local buttons = global.registry.buttons
                    if not buttons then
                        return false
                    end
                    local punchFreq = getconstant(buttons.attemptPunch, 3)
                    if tick() - lastPunch < punchFreq then
                        return false
                    end
                    buttons.attemptPunch()
                end
                createloop(0, loop)
            end
            automatic()
            local function loop()
                local bool = global.ui_status.infpunch
                local buttons = global.registry.buttons
                if buttons then
                    local c = bool and 0 or 0.5
                    setconstant(buttons.attemptPunch, 3, c)
                end
            end
            createloop(0, loop)
        end
        punchCorrection()
        local function gliderCorrection()
            local function onKey()
                local function onInputBegan(key)
                    if global.ui_status.glider_on_key then
                        if key.KeyCode.Name == global.ui_status.glider_key then
                            if client.modules.paraglide.IsFlying() then
                                client.modules.paraglide.GliderStop()
                            else
                                client.modules.paraglide.Glider()
                            end
                        end
                    end
                end
                uis.InputBegan:connect(onInputBegan)
            end
            onKey()
        end
        gliderCorrection()
        local function parachuteCorrection()
            local function onKey()
                local function onInputBegan(key)
                    if global.ui_status.parachute_on_key then
                        if key.KeyCode.Name == global.ui_status.parachute_key then
                            if client.modules.paraglide.IsFlying() then
                                client.modules.paraglide.ParachuteStop()
                            else
                                client.modules.paraglide.Parachute()
                            end
                        end
                    end
                end
                uis.InputBegan:connect(onInputBegan)
            end
            onKey()
            local parachute = client.modules.paraglide.Parachute
            local upv = getupvalue(getupvalue(parachute,1),6)
            local const5 = getconstant(upv,5)
            local const23 = getconstant(upv,23)
            local const26 = getconstant(upv,26)
            local const29 = getconstant(upv,29)
            local const31 = getconstant(upv,31)
            local function hook_parachute()
                local bool = global.ui_status.antiparachute
                if bool then
                    return task.wait(9e9)
                end
                local parachute_boost = global.ui_status.parachute_boost
                if client.confirmation.confirmed.parachute_boost then
                    if parachute_boost then
                        setconstant(upv,5,0)
                        setconstant(upv,23,2)
                        setconstant(upv,26,1)
                        setconstant(upv,29,0)
                        setconstant(upv,31,-100)
                    else
                        setconstant(upv,5,const5)
                        setconstant(upv,23,const23)
                        setconstant(upv,26,const26)
                        setconstant(upv,29,const29)
                        setconstant(upv,31,const31)
                    end
                end
                return parachute()
            end
            client.modules.paraglide.Parachute = hook_parachute
            local function antizones()
                local upv3 = getupvalue(upv, 3)
                local function hook(...)
                    local bool = global.ui_status.disable_automatic_unparachute
                    if bool then
                        return false
                    end
                    return upv3(...)
                end
                setupvalue(upv, 3, hook)
            end
            antizones()
        end
        parachuteCorrection()
        local function skydivingCorrection()
            local getSkydiveTrack = client.modules.characterAnim.getSkydiveTrack
            local function hook()
                local bool = global.ui_status.antiskydive
                if bool then
                    return task.wait(9e9)
                end 
                return getSkydiveTrack()
            end
            client.modules.characterAnim.getSkydiveTrack = hook
            local upv = getupvalue(client.modules.fallingInit, 19)
            local function loop()
                local bool = global.ui_status.antiskydive
                if bool then
                    if getupvalue(upv, 14) ~= false then
                        setupvalue(upv, 14, false)
                    end
                end
            end
            createloop(0, loop)
        end
        skydivingCorrection()
        local function gunStoreCorrection()
            local region = client.modules.region.Update
            local vals = {
                Condition = nil;
            }
            local function hook(tbl, ...)
                if not string.find(debug.traceback(), "GunShopSystem") then
                    return region(tbl, ...)
                end
                if global.hideshopui then
                    player.PlayerGui.GunShopGui.Enabled = false
                    player.PlayerGui.GunShopGui.Container.Visible = false
                else
                    player.PlayerGui.GunShopGui.Container.Visible = true
                end
                local bool = global.ui_status.open_gunstore_ui
                local function condition_hook(...)
                    if bool then
                        player.PlayerGui.GunShopGui.Container.Close.Visible = not bool
                        return bool
                    end
                    return vals.Condition ~= nil and vals.Condition(...)
                end
                if not vals.Condition then
                    vals.Condition = tbl.Condition
                end
                tbl.Condition = condition_hook
                return region(tbl, ...)
            end
            client.modules.region.Update = hook
        end
        gunStoreCorrection()
        local function stunnedCorrection()
            local function respawnOnTazed()
                local module = client.modules.falling.StartRagdolling
                local function fireTeamSwitch()
                    local teamSwitch = player.PlayerGui.AppUI.Buttons.Sidebar.TeamSwitch.TeamSwitch
                    if not teamSwitch then
                        log("ERROR occured while trying to respawn (TeamSwitch)")
                        return false
                    end
                    for i,v in next, getconnections(teamSwitch.MouseButton1Down) do
                        v.Function()
                    end
                end
                local function pressYes()
                    local confirm = player.PlayerGui.ConfirmationGui.Confirmation.Background.ContainerButtons.ContainerYes
                    if not confirm then
                        log("ERROR occured while trying to respawn (yes pressing)")
                        return false
                    end
                    for i,v in next, getconnections(confirm.Button.MouseButton1Down) do
                        v.Function()
                    end
                end
                local function goPrisoner()
                    local prisonerButton = player.PlayerGui.TeamGui.Container.ContainerTeam:FindFirstChild("Prisoner")
                    if not prisonerButton then
                        log("ERROR occured while trying to respawn (prisoner)")
                        return false
                    end
                    for i,v in next, getconnections(prisonerButton.MouseButton1Down) do
                        v.Function()
                    end
                end
                local function goPolice()
                    local policeButton = player.PlayerGui.TeamGui.Container.ContainerTeam:FindFirstChild("Police")
                    if not policeButton then
                        log("ERROR occured while trying to respawn (police)")
                        return false
                    end
                    for i,v in next, getconnections(policeButton.MouseButton1Down) do
                        v.Function()
                    end
                end
                local function goPlay()
                    local playgui = player.PlayerGui.TeamGui.Container.ContainerPlay.Play
                    if not playgui then
                        log("ERROR occured while trying to respawn (play pressing)")
                        return false
                    end
                    for i,v in next, getconnections(playgui.MouseButton1Down) do
                        v.Function()
                    end
                end
                local function hook(num)
                    if string.find(debug.traceback(), "OnClientEvent") then
                        local notaze = global.ui_status.antitaze
                        if notaze then
                            setupvalue(global.registry.stunnedFunc,1,false)
                            num = -1
                        end
                        local team = tostring(player.Team)
                        local bool = global.ui_status.automatic_respawn_on_taze
                        if bool then
                            task.delay(0.1, fireTeamSwitch)
                            task.delay(0.3, pressYes)
                            if team == "Prisoner" or team == "Criminal" then
                                task.delay(0.5, goPrisoner)
                            elseif team == "Police" then
                                task.delay(0.5, goPolice)
                            end
                            task.delay(0.7, goPlay)
                        end
                    end
                    return module(num)
                end
                client.modules.falling.StartRagdolling = hook
            end
            respawnOnTazed()
            local function removeTazeRagdoll()
                local stunned = client.modules.settings.Time.Stunned
                local function loop()
                    local bool = global.ui_status.antitaze
                    if bool then
                        client.modules.settings.Time.Stunned = 0
                    else
                        client.modules.settings.Time.Stunned = stunned
                    end
                end
                createloop(0, loop)
            end
            removeTazeRagdoll()
        end
        stunnedCorrection()
        local function jetpackCorrection()
            local function antiFlightZones()
                local function loop()
                    local bool = global.ui_status.disable_anti_flight_zones
                    if bool then
                        for i,v in next, collectionservice:GetTagged("JetPackNoFly") do
                            v:Destroy()
                        end
                    end
                end
                createloop(0, loop)
            end
            --antiFlightZones()
            local function fuel()
                local init = getupvalue(client.modules.jetpack.Init, 9)
                local cache
                local function tagService()
                    cache = client.tags.new("fuel", 0, false, function(val)
                        if val then
                            init.LocalFuelType = "Rocket"
                            init.LocalMaxFuel = math.huge
                            init.LocalFuel = math.huge
                        else
                            init.LocalFuelType = "Standard"
                            init.LocalMaxFuel = 10
                            init.LocalFuel = 2.5
                        end
                    end)
                end
                tagService()
                local function loop()
                    local bool = global.ui_status.infinite_jetpack_fuel
                    if cache then
                        cache.obj.Value = bool
                    end
                end
                createloop(0, loop)
            end
            fuel()
        end
        jetpackCorrection()
        local function sprintCorrection()
            local module = client.modules.defaultActions
            local function isSprinting()
                return module.sprintButton._pressed
            end
            local function pressSprint()
                if not isSprinting() and module.sprintButton._pressState then
                    module.sprintButton._pressState()
                end
            end
            local function loop()
                local bool = global.ui_status.alwayssprint
                if bool then
                    pressSprint()
                end
            end
            createloop(0, loop)
        end
        sprintCorrection()
        local function vehicleCorrection()
            local function jump()
                local function onInputBegan(key)
                    if global.ui_status.vehicle_jump then
                        if client.state.isLocalInVehicle then
                            if key.KeyCode.Name == global.ui_status.vehicle_jump_key then
                                local char = client.playerCharacter
                                if char then
                                    local hum = char:FindFirstChild("Humanoid")
                                    if hum then
                                        hum:ChangeState("Jumping")
                                    end
                                end
                            end
                        end
                    end
                end
                uis.InputBegan:connect(onInputBegan)
            end
            jump()
            local function anchorOnSpeed()
                local isAnchored = false
                local stopAnchor = false
                local function onInputBegan(key)
                    if isAnchored then
                        if key.KeyCode == Enum.KeyCode.S then
                            isAnchored = false
                            stopAnchor = true
                            task.delay(0.2, function()
                                stopAnchor = false
                            end)
                        end
                    end
                end
                uis.InputBegan:connect(onInputBegan)
                local function anchorLoop()
                    local getLocalVehicle = client.reg.getLocalVehicle
                    if getLocalVehicle then
                        local primaryPart = getLocalVehicle.Model.PrimaryPart
                        if primaryPart then
                            local shouldAnchor = false
                            if global.ui_status.anchor_vehicle_on_high_speed then
                                if isAnchored then
                                    shouldAnchor = true
                                else
                                    shouldAnchor = false
                                end
                                if stopAnchor then
                                    shouldAnchor = false
                                end
                            else
                                shouldAnchor = false
                            end
                            if isAnchored and not shouldAnchor then
                                primaryPart.Velocity = Vector3.new()
                            end
                            if primaryPart.Anchored ~= shouldAnchor then
                                primaryPart.Anchored = shouldAnchor
                            end
                        end
                    end
                end
                createloop(0, anchorLoop)
                local function loop()
                    local bool = global.ui_status.anchor_vehicle_on_high_speed
                    if bool then
                        local getSpeedometer = global.registry.getSpeedometer()
                        if getSpeedometer then
                            local high_speed_value = global.ui_status.high_speed_value or 200
                            local speed = tonumber(getSpeedometer.Top.Speed.Text)
                            if speed > high_speed_value and not isAnchored and not stopAnchor then
                                isAnchored = true
                            end
                        else
                            isAnchored = false
                        end
                    else
                        isAnchored = false
                    end
                end
                createloop(0, loop)
            end
            anchorOnSpeed()
            local function headlights()
                local function headlights()
                    for i,v in next, client.modules.actionButtonService.active do
                        if type(v) == "table" and v.keyCodes then
                            if table.find(v.keyCodes, Enum.KeyCode.L) then
                                v.onPressed(true)
                            end
                        end
                    end
                end
                local function loop()
                    local master_switch_carmodify = global.ui_status.master_switch_carmodify
                    if master_switch_carmodify then
                        local bool = global.ui_status.spam_headlights
                        if bool then
                            local getLocalVehicle = client.reg.getLocalVehicle
                            if getLocalVehicle and getLocalVehicle.Type ~= "Heli" then
                                headlights()
                            end
                        end
                    end
                end
                createloop(0.2, loop)
            end
            headlights()
            local function lock()
                local function getVehicle()
                    local getLocalVehicle = client.reg.getLocalVehicle
                    if getLocalVehicle then
                        return getLocalVehicle
                    end
                    return false
                end
                local function getLocked()
                    local getVehicle = getVehicle()
                    if getVehicle then
                        return getVehicle.Model:GetAttribute("Locked")
                    end
                    return false
                end
                local function canLock()
                    return client.modules.vehicle.canLocalLock()
                end
                local function callLock()
                    return client.modules.vehicle.toggleLocalLocked()
                end
                local function loop()
                    local bool = global.ui_status.automatic_lock_vehicle
                    if bool then
                        local getVehicle = getVehicle()
                        if getVehicle then
                            local getLocked = getLocked()
                            if not getLocked then
                                local canLock = canLock()
                                if canLock then
                                    callLock()
                                end
                            end
                        end
                    end
                end
                createloop(1, loop)
            end
            lock()
            local function eject()
                local vehicle = client.modules.vehicle
                local function getVehicle()
                    local getLocalVehicle = client.reg.getLocalVehicle
                    return getLocalVehicle
                end
                local function canEject()
                    return vehicle.canLocalEject()
                end
                local function ejectPlayer(player)
                    if canEject() then
                        vehicle.attemptPassengerEject(player.Name)
                    end
                end
                local function getSeats()
                    local plrs = {}
                    local getVehicle = getVehicle()
                    if getVehicle then
                        local getSeats = vehicle.getSeats(getVehicle.Model)
                        for i,v in next, getSeats do
                            if v.Player ~= player then
                                table.insert(plrs, v)
                            end
                        end
                    end
                    return plrs
                end
                local function loop()
                    local bool = global.ui_status.automatic_eject_vehicle_player
                    if bool then
                        local canEject = canEject()
                        if canEject then
                            local getSeats = getSeats()
                            if getSeats then
                                for i,v in next, getSeats do
                                    ejectPlayer(v.Player)
                                end
                            end
                        end
                    end
                end
                createloop(1, loop)
            end
            eject()
            local function jeeproof()
                local function roof()
                    for i,v in next, client.modules.actionButtonService.active do
                        if type(v) == "table" and v.keyCodes then
                            if table.find(v.keyCodes, Enum.KeyCode.G) then
                                v.onPressed(true)
                            end
                        end
                    end
                end
                local function loop()
                    local master_switch_carmodify = global.ui_status.master_switch_carmodify
                    if master_switch_carmodify then
                        local bool = global.ui_status.spam_jeep_roof
                        if bool then
                            local getLocalVehicle = client.reg.getLocalVehicle
                            if getLocalVehicle and tostring(getLocalVehicle.Make) == "Jeep" then
                                roof()
                            end
                        end
                    end
                end
                createloop(0.1, loop)
            end
            jeeproof()
            local function drifts()
                local function drift()
                    for i,v in next, client.modules.actionButtonService.active do
                        if type(v) == "table" and v.keyCodes then
                            if table.find(v.keyCodes, Enum.KeyCode.RightShift) then
                                v.onPressed(true)
                            end
                        end
                    end
                end
                local function loop()
                    local master_switch_carmodify = global.ui_status.master_switch_carmodify
                    if master_switch_carmodify then
                        local bool = global.ui_status.always_drift
                        if bool then
                            local getLocalVehicle = client.reg.getLocalVehicle
                            if getLocalVehicle then
                                drift()
                            end
                        end
                    end
                end
                createloop(0, loop)
            end
            drifts()
            local function hijack()
                local function hijack()
                    local localization = client.modules.localization
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == localization:FormatByKey("Action.Hijack") then
                            if v.Enabled then
                                v:Callback(true)
                            end
                        end
                    end
                end
                local function loop()
                    local bool = global.ui_status.automatic_hijack_vehicles
                    if bool then
                        hijack()
                    end
                end
                createloop(0.5, loop)
            end
            hijack()
            local function automaticflip()
                local function flip()
                    for i,v in next, client.modules.actionButtonService.active do
                        if type(v) == "table" and v.keyCodes then
                            if table.find(v.keyCodes, Enum.KeyCode.V) then
                                v.onPressed(true)
                            end
                        end
                    end
                end
                local function loop()
                    local master_switch_carmodify = global.ui_status.master_switch_carmodify
                    if master_switch_carmodify then
                        local bool = global.ui_status.automatic_flip_vehicle
                        if bool then
                            local getLocalVehicle = client.reg.getLocalVehicle
                            if getLocalVehicle then
                                flip()    
                            end
                        end
                    end
                end
                createloop(0.5, loop)
            end
            automaticflip()
            local function breakVehicles()
                local oldItem
                local itemName
                local function onCharacterAdded()
                    if oldItem then
                        oldItem = nil
                        itemName = nil
                        warn("oldItem reset")
                    end
                end
                player.CharacterAdded:connect(onCharacterAdded)
                local function registerEquippedItem()
                    local function loop()
                        if oldItem then
                            return false
                        end
                        local bool = global.ui_status.break_vehicles
                        local instant_break = global.ui_status.instant_break
                        local getEquippedItem = client.reg.getEquippedItem
                        local unequipAfter = false
                        if bool and not oldItem then
                            local equip = global.registry.equip
                            for i,v in next, client.reg.getInventoryItemsFor do
                                if i ~= 0 then
                                    if not getEquippedItem then
                                        local equip_only = {"Rifle", "Pistol", "Shotgun", "Revolver", "Flintlock", "AK47", "Uzi", "Sniper"}
                                        if table.find(equip_only, v.obj.name) then
                                            equip(tostring(v.obj.name))
                                            unequipAfter = true
                                        end
                                    end
                                end
                                task.wait()
                            end
                            getEquippedItem = client.reg.getEquippedItem
                            if getEquippedItem and getEquippedItem.BulletEmitter ~= nil then
                                local className = getEquippedItem.__ClassName
                                if className then
                                    local equip = global.registry.equip
                                    local unequipAll = global.registry.unequipAll
                                    oldItem = getEquippedItem.BulletEmitter.OnHitSurface._handlerListHead._signal._handlerListHead._fn
                                    task.delay(0.1, function()
                                        className = getEquippedItem.__ClassName
                                        itemName = className
                                        unequipAll()
                                        if instant_break then
                                            getEquippedItem.__ClassName = "Sniper"
                                            itemName = "Sniper"
                                        else
                                            getEquippedItem.__ClassName = className
                                            itemName = className
                                        end
                                        task.delay(0.1, function()
                                            if not client.reg.getEquippedItem and not unequipAfter then
                                                equip(tostring(className))
                                            end
                                        end)
                                    end)
                                end
                            end
                        end
                    end
                    createloop(0.6, loop)
                end
                registerEquippedItem()
                local function popTire(v)
                    if global.ui_status.instant_break and itemName ~= "Sniper" then
                        oldItem = nil
                    elseif not global.ui_status.instant_break and itemName == "Sniper" then
                        if not table.find(client.reg.resolveOwnedItems, "Sniper") then
                            oldItem = nil
                        end
                    end
                    if not oldItem then
                        return false
                    end
                    local getPlayerVehicle = global.registry.getPlayerVehicle(v)
                    if getPlayerVehicle then
                        local engine = getPlayerVehicle:FindFirstChild("Engine") or getPlayerVehicle:FindFirstChild("BoundingBox")
                        if engine then
                            for i=1, 8 do
                                local break_vehicles = global.ui_status.break_vehicles
                                if not break_vehicles then
                                    break
                                end
                                pcall(function()
                                    oldItem(engine, engine.Position, Vector3.new(), Enum.Material.SmoothPlastic)
                                end)
                                task.wait()
                            end
                        end
                    end
                end
                local function loop()
                    local bool = global.ui_status.break_vehicles 
                    if not bool then
                        return false
                    end
                    if oldItem then
                        local only_on_weapon_equipped = global.ui_status.only_on_weapon_equipped
                        if only_on_weapon_equipped then
                            local getEquippedItem = client.reg.getEquippedItem
                            if not getEquippedItem then
                                return false
                            end
                        end 
                        local getClosestPlayerWithVehicleTag = global.registry.getClosestPlayerWithVehicleTag(1280)
                        if not getClosestPlayerWithVehicleTag then
                            return false
                        end
                        local isVulnerable = global.registry.isVulnerable
                        local target_enemy_team_only = global.ui_status.target_enemy_team_only  
                        for i,v in next, getClosestPlayerWithVehicleTag do
                            local randomizer = math.random(10, 30)
                            if randomizer >= 21 or randomizer <= 25 then
                                break
                            end
                            if target_enemy_team_only then
                                if isVulnerable(player.Team, v.Team) then
                                    popTire(v)
                                end
                            else
                                popTire(v)
                            end
                        end
                    end
                end
                createloop(1, loop)
            end
            breakVehicles()
            local function heliModify()
                local function rope()
                    local module = client.modules.loadingBar.new
                    local geomUtils = client.modules.geomUtils
                    local function hook(...)
                        if string.find(debug.traceback(), "_hookNearest") then
                            local master_switch = global.ui_status.master_switch_heli_speed
                            if master_switch then
                                local bool = global.ui_status.instant_rope
                                if bool and not global.ui_status.rope_aura then
                                    local getLocalVehicle = client.reg.getLocalVehicle
                                    if getLocalVehicle then
                                        local getHeliRope = global.registry.getHeliRope(getLocalVehicle)
                                        if getHeliRope then
                                            local getClosestHeliPickup = global.registry.getClosestHeliPickup(getHeliRope, 50)
                                            if getClosestHeliPickup then
                                                local cf = getClosestHeliPickup.PrimaryPart.CFrame:PointToObjectSpace(geomUtils.closestPointInPart(getClosestHeliPickup.PrimaryPart, getHeliRope.Position))
                                                getHeliRope.ReqLink:FireServer(getClosestHeliPickup, cf)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        return module(...)
                    end
                    client.modules.loadingBar.new = hook
                    local function loop()
                        local master_switch = global.ui_status.master_switch_heli_speed
                        if master_switch then
                            local bool = global.ui_status.rope_aura
                            if bool and global.ui_status.instant_rope then
                                local getLocalVehicle = client.reg.getLocalVehicle
                                if getLocalVehicle then
                                    local getHeliRope = global.registry.getHeliRope(getLocalVehicle)
                                    if getHeliRope and getHeliRope.AttachedTo.Value == nil then
                                        local getClosestHeliPickup = global.registry.getClosestHeliPickup(getHeliRope, 150)
                                        if getClosestHeliPickup then
                                            local cf = getClosestHeliPickup.PrimaryPart.CFrame:PointToObjectSpace(geomUtils.closestPointInPart(getClosestHeliPickup.PrimaryPart, getHeliRope.Position))
                                            getHeliRope.ReqLink:FireServer(getClosestHeliPickup, cf)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    createloop(0.2, loop)
                end
                rope()
                local function speed()
                    local function loop()
                        local bool = global.ui_status.master_switch_heli_speed
                        local speed = global.ui_status.heli_speed
                        if not bool then
                            return false
                        end
                        if not client.state.isLocalInVehicle then
                            return false
                        end
                        local vehicle = client.reg.getLocalVehicle
                        if not vehicle then
                            return false
                        end
                        if vehicle.Type == "Heli" then
                            if not vehicle.Velocity then
                                return false
                            end
                            if not vehicle.Velocity.Velocity then
                                return false
                            end
                            local calc = vehicle.Velocity.Velocity * speed
                            vehicle.Velocity.Velocity = calc
                        end
                    end
                    createloop(0, loop)
                end
                speed()
                local function height()
                    local function loop()
                        local bool = global.ui_status.infinite_heli_height
                        if not client.state.isLocalInVehicle then
                            return false
                        end
                        local vehicle = client.reg.getLocalVehicle
                        if not vehicle then
                            return false
                        end
                        if not bool then
                            if vehicle.Type == "Heli" then
                                vehicle.MaxHeight = 400
                            end
                            return false
                        end
                        if vehicle.Type == "Heli" then
                            vehicle.MaxHeight = math.huge
                        end
                    end
                    createloop(0, loop)
                end
                height()
                local function droneHeight()
                    local module = client.modules.rayCast.RayIgnoreNonCollideWithIgnoreList
                    local function hook(...)
                        if string.find(debug.traceback(), "Heli") then
                            local bool = global.ui_status.infinite_drone_height
                            local args = {...}
                            if bool then
                                for i,v in next, args[4] do
                                    if v == client.descendants.vehicles then
                                        return Vector3.new(0, math.huge, 0), ...
                                    end
                                end
                            end
                        end
                        return module(...)
                    end
                    client.modules.rayCast.RayIgnoreNonCollideWithIgnoreList = hook
                end
                droneHeight()
            end
            heliModify()
            local function bikeModify()
                local bikes = {}
                local volts = {}
                local chassis2 = client.modules.alexChassis2
                local vehicleBikeEnter = chassis2.VehicleEnter
                local vehicleBikeLeave = chassis2.VehicleLeave
                local volt = client.modules.volt
                local vehicleEnter = volt.VehicleEnter
                local vehicleLeave = volt.VehicleLeave
                local function onVoltVehicleEnter(...)
                    if #volts > 0 then
                        table.clear(volts)
                    end
                    local onVehicleEnteredTick = tick()
                    volts[#volts + 1] = createloop(0, function()
                        local vehicle = client.reg.getLocalVehicle
                        if vehicle then
                            local master_switch_bike = global.ui_status.master_switch_bike
                            if master_switch_bike then
                                local bike_speed = global.ui_status.bike_speed or 1
                                vehicle.Force.Force = vehicle.Force.Force * tonumber(bike_speed)
                            end
                        else
                            if tick() - onVehicleEnteredTick > 5 then
                                volts[#volts]:disconnect()
                                table.clear(volts)
                            end
                        end
                    end)
                    return vehicleEnter(...)
                end
                local function onVoltVehicleLeave(...)
                    if #volts > 0 then
                        volts[#volts]:disconnect()
                        table.clear(volts)
                    end
                    return vehicleLeave(...)
                end
                volt.VehicleEnter = onVoltVehicleEnter
                volt.VehicleLeave = onVoltVehicleLeave
                local function onBikeVehicleEnter(bike)
                    if tostring(bike.Make) == "Dirtbike" then
                        if #bikes > 0 then
                            bikes[#bikes]:disconnect()
                            table.clear(bikes)
                        end
                        global.BIKE_MEMORY = {
                            WHEELS_HEIGHT = bike.Wheels[1].Height;
                        }
                        bikes[#bikes + 1] = createloop(0, function()
                            local BIKE_MEMORY = global.BIKE_MEMORY
                            local master_switch_bike = global.ui_status.master_switch_bike
                            local dirt_bike_height = global.ui_status.dirt_bike_height
                            if master_switch_bike then
                                local bike_speed = global.ui_status.bike_speed or 1
                                bike.GarageEngineSpeed = 1 * tonumber(bike_speed) * 10
                            else
                                bike.GarageEngineSpeed = 0
                                if dirt_bike_height then
                                    if bike.Wheels[1].Height ~= BIKE_MEMORY.WHEELS_HEIGHT then
                                        for i,v in next, bike.Wheels do
                                            v.Height = BIKE_MEMORY.WHEELS_HEIGHT
                                        end
                                    end
                                end
                            end
                            if dirt_bike_height then
                                if master_switch_bike then
                                    local bike_height_value = global.ui_status.bike_height_value
                                    for i,v in next, bike.Wheels do
                                        v.Height = BIKE_MEMORY.WHEELS_HEIGHT * tonumber(bike_height_value)
                                    end
                                end
                            else
                                if bike.Wheels[1].Height ~= BIKE_MEMORY.WHEELS_HEIGHT then
                                    for i,v in next, bike.Wheels do
                                        v.Height = BIKE_MEMORY.WHEELS_HEIGHT
                                    end
                                end
                            end
                        end)
                    end
                    return vehicleBikeEnter(bike)
                end
                local function onBikeVehicleLeave(bike)
                    if tostring(bike.Make) == "Dirtbike" then
                        if #bikes > 0 then
                            bikes[#bikes]:disconnect()
                            table.clear(bikes)
                        else
                            log("#bikes < 0")
                        end
                    end
                    return vehicleBikeLeave(bike)
                end
                chassis2.VehicleEnter = onBikeVehicleEnter
                chassis2.VehicleLeave = onBikeVehicleLeave
            end
            bikeModify()
            local function boatModify()
                local boat = client.modules.boat
                local mountPlayer = boat.MountPlayer
                local unmountSeat = boat.UnmountSeat
                local destroy = boat.Destroy
                local boats = {}
                local function onBoatMountPlayer(x, y, ...)
                    if y == player and not boats[x.Meta.Id] then
                        global.BOAT_MEMORY = {
                            SPEED_FORWARD = x.Config.SpeedForward;
                        }
                        boats[x.Meta.Id] = {
                            LIFE = createloop(0, function()
                                local master_switch_boat = global.ui_status.master_switch_boat
                                local boat_speed = global.ui_status.boat_speed or 1
                                local boat_on_land = global.ui_status.boat_on_land
                                local BOAT_MEMORY = global.BOAT_MEMORY
                                if master_switch_boat then
                                    if boat_on_land then
                                        x.WaterHeight = 20
                                    end
                                    x.Config.SpeedForward = BOAT_MEMORY.SPEED_FORWARD * tonumber(boat_speed)
                                else
                                    x.Config.SpeedForward = BOAT_MEMORY.SPEED_FORWARD
                                end
                            end);
                        }
                    end
                    return mountPlayer(x, y, ...)
                end
                local function onBoatUnmountSeat(x, y)
                    if boats[x.Meta.Id] and y.Player == player then
                        global.BOAT_MEMORY = nil
                        boats[x.Meta.Id].LIFE:disconnect()
                        table.clear(boats)
                    end
                    return unmountSeat(x, y)
                end
                local function onBoatDestroy(x)
                    if boats[x.Meta.Id] then
                        global.BOAT_MEMORY = nil
                        boats[x.Meta.Id]:disconnect()
                        table.clear(boats)
                    end
                    return destroy(x)
                end
                boat.MountPlayer = onBoatMountPlayer
                boat.UnmountSeat = unmountSeat
                boat.Destroy = onBoatDestroy
            end
            boatModify()
            local function planeModify()
                local plane = {}
                local function jet()
                    local jet = client.modules.jet
                    local jetMountPlayer = jet.MountPlayer
                    local jetUnmountSeat = jet.UnmountSeat
                    local jetDestroy = jet.Destroy
                    local seekingMissileUtils = client.modules.seekingMissileUtils
                    local setTargetPos = seekingMissileUtils.setTargetPos
                    local function onSetTargetPos(obj, x)
                        local getClosestPlayer = client.reg.getClosestPlayerByFov
                        if getClosestPlayer then
                            local char = getClosestPlayer.Character
                            if char then
                                local primaryPart = char.PrimaryPart
                                if primaryPart then
                                    x = primaryPart.Position
                                end
                            end
                        end
                        return setTargetPos(obj, x)
                    end
                    local function onJetMountPlayer(x, y, ...)
                        if y == player and not plane[x.Plane.Id] then
                            global.PLANE_MEMORY = {
                                HEIGHT_MAX = x.Plane.CONST.HEIGHT_MAX;
                                MAX_THRUST = x.Plane.CONST.MAX_THRUST;
                            }
                            plane[x.Plane.Id] = {
                                LIFE = createloop(0, function()
                                    local master_switch_plane = global.ui_status.master_switch_plane
                                    local plane_speed = global.ui_status.plane_speed or 1
                                    local anti_max_height = global.ui_status.anti_max_height
                                    local automatic_jet_heat_seek = global.ui_status.automatic_jet_heat_seek
                                    local PLANE_MEMORY = global.PLANE_MEMORY
                                    if anti_max_height then
                                        if master_switch_plane then
                                            x.Plane.CONST.HEIGHT_MAX = math.huge
                                        else
                                            x.Plane.CONST.HEIGHT_MAX = PLANE_MEMORY.HEIGHT_MAX 
                                        end
                                    else
                                        x.Plane.CONST.HEIGHT_MAX = PLANE_MEMORY.HEIGHT_MAX
                                    end
                                    if master_switch_plane then
                                        if automatic_jet_heat_seek then
                                            local getClosestPlayer = client.reg.getClosestPlayerByFov
                                            if getClosestPlayer then
                                                local char = getClosestPlayer.Character
                                                if char then
                                                    local primaryPart = char.PrimaryPart
                                                    if primaryPart then
                                                        if x.targetPart ~= primaryPart then
                                                            x.targetPart = primaryPart
                                                            x.targetPartFoundAt = os.clock()
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        x.Plane.CONST.MAX_THRUST = PLANE_MEMORY.MAX_THRUST * tonumber(plane_speed)
                                    else
                                        x.Plane.CONST.MAX_THRUST = PLANE_MEMORY.MAX_THRUST
                                    end
                                end)
                            }
                        end
                        return jetMountPlayer(x, y, ...)
                    end
                    local function onJetUnmountSeat(x, y)
                        if plane[x.Plane.Id] and y.Player == player then
                            global.PLANE_MEMORY = nil
                            plane[x.Plane.Id].LIFE:disconnect()
                            table.clear(plane)
                        end
                        return jetUnmountSeat(x, y)
                    end
                    local function onJetDestroy(x)
                        if plane[x.Plane.Id] then
                            global.PLANE_MEMORY = nil
                            plane[x.Plane.Id].LIFE:disconnect()
                            table.clear(plane)
                        end
                        return jetDestroy(x)
                    end
                    seekingMissileUtils.setTargetPos = onSetTargetPos
                    jet.MountPlayer = onJetMountPlayer
                    jet.UnmountSeat = onJetUnmountSeat
                    jet.Destroy = onJetDestroy
                end
                jet()
                local function stunt()
                    local stunt = client.modules.stunt
                    local stuntMountPlayer = stunt.MountPlayer
                    local stuntUnmountSeat = stunt.UnmountSeat
                    local stuntDestroy = stunt.Destroy
                    local function onStuntMountPlayer(x, y, ...)
                        if y == player and not plane[x.Plane.Id] then
                            global.PLANE_MEMORY = {
                                HEIGHT_MAX = x.Plane.CONST.HEIGHT_MAX;
                                MAX_THRUST = x.Plane.CONST.MAX_THRUST;
                            }
                            plane[x.Plane.Id] = {
                                PLANE = global.PLANE_MEMORY;
                                CREATION_TIME = tick();
                                LIFE = createloop(0, function()
                                    local master_switch_plane = global.ui_status.master_switch_plane
                                    local plane_speed = global.ui_status.plane_speed or 1
                                    local anti_max_height = global.ui_status.anti_max_height
                                    local PLANE_MEMORY = global.PLANE_MEMORY
                                    if anti_max_height then
                                        if master_switch_plane then
                                            x.Plane.CONST.HEIGHT_MAX = math.huge
                                        else
                                            x.Plane.CONST.HEIGHT_MAX = PLANE_MEMORY.HEIGHT_MAX 
                                        end
                                    else
                                        x.Plane.CONST.HEIGHT_MAX = PLANE_MEMORY.HEIGHT_MAX
                                    end
                                    if master_switch_plane then
                                        x.Plane.CONST.MAX_THRUST = PLANE_MEMORY.MAX_THRUST * tonumber(plane_speed)
                                    else
                                        x.Plane.CONST.MAX_THRUST = PLANE_MEMORY.MAX_THRUST
                                    end
                                end)
                            }
                        end
                        return stuntMountPlayer(x, y, ...)
                    end
                    local function onStuntUnmountSeat(x, y)
                        if plane[x.Plane.Id] and y.Player == player then
                            global.PLANE_MEMORY = nil
                            plane[x.Plane.Id].LIFE:disconnect()
                            table.clear(plane)
                        end
                        return stuntUnmountSeat(x, y)
                    end
                    local function onStuntDestroy(x)
                        if plane[x.Plane.Id] then
                            global.PLANE_MEMORY = nil
                            plane[x.Plane.Id].LIFE:disconnect()
                            table.clear(plane)
                        end
                        return stuntDestroy(x)
                    end
                    stunt.MountPlayer = onStuntMountPlayer
                    stunt.UnmountSeat = onStuntUnmountSeat
                    stunt.Destroy = onStuntDestroy
                end
                stunt()
            end
            planeModify()
            local function carModify()
                local function on_loadup()
                    local function onVehicleEntered(obj)
                        if obj.Name == "InVehicle" then
                            local car
                            while true do
                                task.wait()
                                if car then
                                    break
                                end
                                car = client.reg.getLocalVehicle
                            end
                            if car.GarageEngineSpeed ~= nil and tostring(car.Make) ~= "Dirtbike" then
                                local memory = {
                                    speed = car.GarageEngineSpeed;
                                    brakes = car.GarageBrakes;
                                    turnspeed = car.TurnSpeed;
                                    height = car.Height;
                                }
                                global.registry.vehicle_memory = memory
                                local bool = global.ui_status.master_switch_carmodify
                                if not bool then
                                    local memory = global.registry.vehicle_memory
                                    if memory and car.GarageEngineSpeed ~= nil then
                                        car.GarageEngineSpeed = memory.speed
                                        car.GarageBrakes = memory.brakes
                                        car.TurnSpeed = memory.turnspeed
                                        car.Height = memory.height
                                    end
                                    return false
                                end
                                task.delay(0.1, function()
                                    local modifytbl = {
                                        speed = global.ui_status.car_speed;
                                        brakes = global.ui_status.car_brakes;
                                        turnspeed = global.ui_status.car_turnspeed;
                                        height = global.ui_status.car_height;
                                    }
                                    if car then
                                        car.GarageEngineSpeed = modifytbl.speed
                                        car.GarageBrakes = modifytbl.brakes
                                        car.TurnSpeed = modifytbl.turnspeed
                                        car.Height = modifytbl.height
                                    end
                                end)
                            end
                            return true
                        end
                    end
                    local function onVehicleExit(obj)
                        local bool = global.ui_status.master_switch_carmodify
                        if obj.Name == "InVehicle" then
                            if not bool and global.registry.vehicle_memory ~= nil then
                                global.registry.vehicle_memory = nil
                            end
                        end
                    end
                    local function onCharacterAdded()
                        player.Character.ChildAdded:connect(onVehicleEntered)
                    end
                    local function onCharacterRemoving()
                        player.Character.ChildRemoved:connect(onVehicleExit)
                    end
                    player.CharacterAdded:connect(onCharacterAdded)
                    player.CharacterRemoving:connect(onCharacterAdded)
                end
                on_loadup()
                local function loop()
                    local car = client.reg.getLocalVehicle
                    if not car then
                        return false
                    end
                    local memory = global.registry.vehicle_memory
                    local bool = global.ui_status.master_switch_carmodify
                    if not bool then
                        if memory then
                            if car and car.GarageEngineSpeed ~= nil and tostring(car.Make) ~= "Dirtbike" then
                                car.GarageEngineSpeed = memory.speed
                                car.GarageBrakes = memory.brakes
                                car.TurnSpeed = memory.turnspeed
                                car.Height = memory.height
                            end
                        end
                        return false
                    end
                    if car and not memory then
                        memory = {}
                        memory.speed = car.GarageEngineSpeed
                        memory.brakes = car.GarageBrakes
                        memory.turnspeed = car.TurnSpeed
                        memory.height = car.Height
                        global.registry.vehicle_memory = memory
                    end
                    if memory then
                        local car_speed = global.ui_status.car_speed
                        local car_brakes = global.ui_status.car_brakes
                        local car_turnspeed = global.ui_status.car_turnspeed
                        local car_height = global.ui_status.car_height
                        if car and car.GarageEngineSpeed ~= nil and tostring(car.Make) ~= "Dirtbike" then
                            car.GarageEngineSpeed = car_speed
                            car.GarageBrakes = car_brakes
                            car.TurnSpeed = car_turnspeed
                            car.Height = car_height
                        end
                    end
                end
                createloop(0, loop)
            end
            carModify()
            local function nitroCorrection()
                local function loop()
                    local master_switch_carmodify = global.ui_status.master_switch_carmodify
                    if not master_switch_carmodify then
                        return false
                    end
                    local bool = global.ui_status.infinite_nitro
                    if not bool then
                        return false
                    end
                    local nitro = global.registry.nitro
                    nitro.Nitro = 249
                    nitro.NitroLastMax = 250
                end
                createloop(0, loop)
            end
            nitroCorrection()
            local function hotbarCorrection()
                local hasInVehicleTag = global.registry.hasInVehicleTag
                local function loop()
                    local bool = global.ui_status.show_hotbar_in_vehicle
                    local hotbargui = player.PlayerGui:FindFirstChild("HotbarGui")
                    if client.playerCharacter and hasInVehicleTag(client.playerCharacter) then
                        hotbargui.Enabled = bool
                    else
                        hotbargui.Enabled = true
                    end
                end
                createloop(0, loop)
            end
            hotbarCorrection()
            local function tirePopCorrection()
                local cache
                local function tagService()
                    cache = client.tags.new("antibreakvehicle", 0, false, function(val)
                        local vehicle = client.reg.getLocalVehicle
                        if val then
                            if vehicle and vehicle.Type == "Heli" then
                                vehicle.FallOutOfSkyDuration = 0
                            elseif vehicle and vehicle.Type == "Chassis" then
                                vehicle.TirePopDuration = 0
                                vehicle.TirePopProportion = 0
                            end
                        else
                            if vehicle and vehicle.Type == "Heli" then
                                vehicle.FallOutOfSkyDuration = 10
                            elseif vehicle and vehicle.Type == "Chassis" then
                                vehicle.TirePopDuration = 7.5
                                vehicle.TirePopProportion = 0.5
                            end
                        end
                    end)
                end
                tagService()
                local function onVehicleEntered(obj)
                    if obj.Name == "InVehicle" then
                        if global.ui_status.antitirepop then
                            local vehicle
                            while true do
                                if vehicle then
                                    break
                                end
                                vehicle = client.reg.getLocalVehicle
                                task.wait()
                            end
                            if vehicle.Type == "Heli" then
                                vehicle.FallOutOfSkyDuration = 0
                            end
                            if vehicle.Type == "Chassis" then
                                vehicle.TirePopDuration = 0
                                vehicle.TirePopProportion = 0
                            end
                        end
                    end
                end
                local function onCharacterAdded()
                    player.Character.ChildAdded:connect(onVehicleEntered)
                end
                onCharacterAdded()
                player.CharacterAdded:connect(onCharacterAdded)
                local function loop()
                    local bool = global.ui_status.antitirepop
                    if cache then
                        cache.obj.Value = bool
                    end
                end
                createloop(0, loop)
            end
            tirePopCorrection()
        end
        vehicleCorrection()
        local function equipCorrection()
            local function onDuck()
                local upv = getupvalue(global.registry._equipconditions, 1)
                local hook = {
                    GetLocalVehiclePacket = function()
                        local bool = global.ui_status.allow_equip_in_vehicle
                        if bool then
                            return false
                        end
                        return upv.GetLocalVehiclePacket()
                    end;
                }
                setupvalue(global.registry._equipconditions,1,hook)
                local function loop()
                    local bool = global.ui_status.allow_equip_on_duck
                    if bool then
                        if getupvalue(global.registry.iscrawling,1).IsCrawling then
                            getupvalue(global.registry.iscrawling,1).IsCrawling = false
                        end
                    end
                end
                createloop(0, loop)
            end
            onDuck()
            local function isFlying()
                local module = client.modules.jetpack.IsFlying
                local function hook(...)
                    local bool = global.ui_status.allow_equip_while_flying
                    if bool then
                        return false
                    end
                    return module(...)
                end
                client.modules.jetpack.IsFlying = hook
            end
            isFlying()
        end
        equipCorrection()
        local function soundCorrection()
            local function assignsounds()
                local config = global.config
                local cfg = config.playsounds
                local sounds = global.registry.sounds
                cfg.list = sounds
                task.delay(0.2, function()
                    cfg.reload(cfg.list)
                end)
            end
            assignsounds()
            local function playsounds()
                local callback = global.callback
                local playsounds = global.registry.playSounds
                local function loop()
                    local bool = global.ui_status.annoyserver
                    if not bool then
                        return false
                    end
                    playsounds("Horn", {
                        Source = client.playerCharacter;
                        MaxTime = 1;
                        Volume = math.huge;
                    })
                end
                createloop(1, loop)
            end
            playsounds()
        end
        soundCorrection()
        local function gunCorrection()
            local function scopegui()
                local function loop()
                    local bool = global.ui_status.anti_scope_ui
                    if bool then
                        local getEquippedItem = client.reg.getEquippedItem
                        if not getEquippedItem then
                            return false
                        end
                        local scopegui = getEquippedItem.ScopeGui
                        if not scopegui then
                            return false
                        end
                        scopegui.Enabled = false
                    end
                end
                createloop(0, loop)
            end
            scopegui()
            local function weaponHooks()
                local rocketAccelerate
                local flintlockAccelerate
                local function rocketHook(...)
                    local bool = global.ui_status.no_recoil
                    if bool then
                        return true
                    end
                    return rocketAccelerate(...)
                end
                local function knockbackHook(...)
                    local bool = global.ui_status.anti_flintlock_knockback
                    if bool then
                        return task.wait(9e9)
                    end
                    return flintlockAccelerate(...)
                end
                local function loop()
                    local no_recoil = global.ui_status.no_recoil
                    local anti_flintlock_knockback = global.ui_status.anti_flintlock_knockback
                    if no_recoil or anti_flintlock_knockback then
                        local getEquippedItem = client.reg.getEquippedItem
                        if getEquippedItem then
                            if no_recoil then
                                if getEquippedItem.__ClassName == "RocketLauncher" then
                                    if not rocketAccelerate then
                                        rocketAccelerate = getEquippedItem.SpringCamera.Accelerate
                                        getEquippedItem.SpringCamera.Accelerate = rocketHook
                                    end
                                else
                                    rocketAccelerate = nil
                                end
                            end
                            if anti_flintlock_knockback then
                                if getEquippedItem.__ClassName == "Flintlock" then
                                    if not flintlockAccelerate then
                                        flintlockAccelerate = getEquippedItem.SpringKnockback.Accelerate
                                        getEquippedItem.SpringKnockback.Accelerate = knockbackHook
                                    end
                                else
                                    flintlockAccelerate = nil
                                end
                            end
                        end
                    end
                end
                createloop(0, loop)
            end
            weaponHooks()
            local function automatic_fire()
                local automaticweapons = {
                    Flintlock = true;
                    NerfPistol = true;
                    NerfResolver = true;
                    Pistol = true;
                    PlasmaPistol = true;
                    Revolver = true;
                    Shotgun = true;
                    Sniper = true;
                }
                local function loop()
                    local bool = global.ui_status.automatic_fire
                    local getEquippedItem = client.reg.getEquippedItem
                    if getEquippedItem then
                        if automaticweapons[getEquippedItem.inventoryItemValue.name] then
                            getEquippedItem.Config.FireAuto = bool
                        end
                    end
                end
                createloop(0, loop)
            end
            automatic_fire()
            local function no_recoil()
                local camShake = {
                    AK47 = 10;
                    Flintlock = 150;
                    NerfPistol = 10;
                    NerfResolver = 100;
                    Pistol = 10;
                    PlasmaPistol = 15;
                    Revolver = 100;
                    Rifle = 10;
                    Shotgun = 80;
                    Sniper = 80;
                    Uzi = 15;
                }
                local function loop()
                    local bool = global.ui_status.no_recoil
                    local getEquippedItem = client.reg.getEquippedItem
                    if getEquippedItem then
                        if not bool then
                            if camShake[getEquippedItem.inventoryItemValue.name] then
                                getEquippedItem.Config.CamShakeMagnitude = camShake[getEquippedItem.inventoryItemValue.name]
                            end
                        else
                            if getEquippedItem.Config.CamShakeMagnitude ~= nil then
                                getEquippedItem.Config.CamShakeMagnitude = 0
                            end
                        end
                    end
                end
                createloop(0, loop)
            end
            no_recoil()
        end
        gunCorrection()
        local function npcCorrection()
            local function isAirdrop()
                local module = client.modules.guardNPCshared.canSeeTarget
                local function hook(x, y)
                    local bool = global.ui_status.break_npcs
                    if bool or global.ui_status.break_mansion_npcs then
                        return false
                    end
                    return module(x, y)
                end
                client.modules.guardNPCshared.canSeeTarget = hook
            end
            isAirdrop()
        end
        npcCorrection()
        local function museumCorrection()
            local function getMuseumStatus()
                local getRobberyStatus = global.registry.getRobberyStatus
                local getMuseumStatus = getRobberyStatus("MUSEUM")
                if getMuseumStatus == "OPENED" then
                    return true
                end
                if getMuseumStatus == "STARTED" then
                    return 0
                end 
                return false
            end
            local function status()
                local function loop()
                    if global.ui.statusRobberies["Museum Status"] then
                        local getMuseumStatus = getMuseumStatus()
                        if getMuseumStatus == 0 then
                            global.ui.statusRobberies["Museum Status"] = ("Status: %s"):format("Started")
                            global.ui.colorForcing["Museum Status"] = Color3.fromRGB(255, 178, 102)
                            return true
                        end
                        if getMuseumStatus then
                            global.ui.statusRobberies["Museum Status"] = ("Status: %s"):format("Open")
                            global.ui.colorForcing["Museum Status"] = Color3.fromRGB(178, 255, 104)
                            return true
                        end
                        global.ui.statusRobberies["Museum Status"] = ("Status: %s"):format("Closed")
                        global.ui.colorForcing["Museum Status"] = Color3.fromRGB(255, 102, 102)
                    end
                end
                createloop(0, loop)
            end
            status()
            local function puzzleCorrection()
                local function loop()
                    local bool = global.ui_status.break_museum_puzzle
                    if bool then
                        local museum = workspace:FindFirstChild("Museum")
                        if not museum then
                            return false
                        end
                        local puzzle1 = museum.Puzzle1:GetDescendants()
                        local puzzle2 = museum.Puzzle2:GetDescendants()
                        for i,v in next, puzzle1 do
                            if v:FindFirstChild("ClickDetector") then
                                for i=1, math.random(1, 5) do
                                    task.wait()
                                    fireclickdetector(v.ClickDetector, math.huge)
                                end
                            end
                        end
                        for i,v in next, puzzle2 do
                            if v:FindFirstChild("ClickDetector") then
                                for i=1, math.random(1, 5) do
                                    task.wait()
                                    fireclickdetector(v.ClickDetector, math.huge)
                                end
                            end
                        end
                        return true
                    end
                    return false
                end
                createloop(1, loop)
            end
            puzzleCorrection()
            local function mouseClickCorrection()
                local mouse = player:GetMouse()
                local settings = {
                    Nuke = {
                        Speed = 650;
                        Duration = 10;
                        TimeDilation = 1.5;
                    };
                    Shockwave = {
                        MaxRadius = 10000;
                        Duration = 10;
                    };
                }
                local function onPressedMouse()
                    if global.ui_status.clicklightning then
                        local lightningSystem = client.modules.lightningSystem
                        lightningSystem.StrikePosition(mouse.Hit.p + Vector3.new(0, 100, 0), mouse.Hit.p)
                    end
                    if global.ui_status.clicknuke then
                        local nukecontrol = global.registry.nukecontrol
                        settings.Nuke.Target = mouse.Hit.p
                        settings.Nuke.Origin = mouse.Hit.p
                        nukecontrol(settings)
                    end
                end
                mouse.Button1Down:connect(onPressedMouse)
            end
            mouseClickCorrection()
            local function museumResolverCorrection()
                local function puzzle1()
                    local museum = workspace:FindFirstChild("Museum")
                    if not museum then
                        return false
                    end
                    if museum.Puzzle2Door.Closed.CanCollide then
                        return false
                    end
                    local spinners = museum.Puzzle1.Spinners
                    local connections = museum.Puzzle1.Connections
                    for i,v in next, spinners:GetChildren() do
                        local name = connections:FindFirstChild(v.Name)
                        if name and name.Color == Color3.fromRGB(89, 144, 255) then
                            fireclickdetector(v.ClickDetector, math.huge)
                        end
                    end
                end
                local function puzzle2()
                    local museum = workspace:FindFirstChild("Museum")
                    if not museum then
                        return false
                    end
                    if museum.Puzzle1Door.Closed.CanCollide then
                        return false
                    end
                    local pieces = museum.Puzzle2.Pieces
                    local targetOnlyPieces = {2, 3, 10, 11, 12, 19, 20, 13, 14}
                    for i,v in next, pieces:GetChildren() do
                        if table.find(targetOnlyPieces, tonumber(v.Name)) then
                            if tonumber(v.Name) == 2 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 0) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 3 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 0) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 10 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 180) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 11 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 180) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 12 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 0) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 19 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 180) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 20 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, -90) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 13 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 90) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                            if tonumber(v.Name) == 14 then
                                while true do
                                    if v.Orientation == Vector3.new(0, -38, 0) then
                                        break
                                    end
                                    fireclickdetector(v.ClickDetector, math.huge)
                                    task.wait(0.3)
                                end
                            end
                        end
                    end
                end
                local function loop()
                    local break_museum_puzzle = global.ui_status.break_museum_puzzle
                    if break_museum_puzzle then
                        return false
                    end
                    local bool = global.ui_status.automatic_resolve_museum_puzzle
                    if bool then
                        local isInMuseum = global.registry.isInMuseum()
                        if isInMuseum then
                            puzzle1()
                            puzzle2()
                        end
                    end
                end
                createloop(0.3, loop)
            end
            museumResolverCorrection()
            local function dynamiteCorrection()
                local function isDetonatorDown()
                    for i,v in next, workspace.Museum.Roof:GetDescendants() do
                        if v.Name == "Arm" then
                            if v.Transparency == 1 then
                                if v.Parent.Name == "Detonator0" then
                                    for i2,v2 in next, client.modules.ui.CircleAction.Specs do
                                        if v2.Name == "Place Dynamite" and v2.Part:IsDescendantOf(workspace.Museum) then
                                            v2:Callback(true)
                                        end
                                    end
                                end
                                if v.Parent.Name == "Detonator1" then
                                    for i2,v2 in next, client.modules.ui.CircleAction.Specs do
                                        if v2.Name == "Place Dynamite" and v2.Part:IsDescendantOf(workspace.Museum) then
                                            v2:Callback(true)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                local function loop()
                    if tostring(player.Team) ~= "Criminal" then
                        return false
                    end
                    local bool = global.ui_status.automatic_place_dynamite
                    if bool then
                        if getMuseumStatus() == true then
                            isDetonatorDown()
                        end
                    end
                end
                createloop(1, loop)
            end
            dynamiteCorrection()
        end
        museumCorrection()
        local function robberyMarkerDelayCorrection()
            local doesPlayerOwn = client.modules.gamepassSystem.DoesPlayerOwn
            local function hook(num)
                if num == 5 then
                    local bool = global.ui_status.no_robberymarker_delay
                    if not bool then
                        return doesPlayerOwn(num)
                    end
                    return true
                end
                return doesPlayerOwn(num)
            end
            client.modules.gamepassSystem.DoesPlayerOwn = hook
        end
        robberyMarkerDelayCorrection()
        local function placeDynamite()
            local function place_dynamite()
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if v.Name == "Place Dynamite" and v.Part.Name == "BankDoor" then
                        if v.Enabled then
                            v:Callback(true)
                        end
                    end
                end
            end
            local function loop()
                local bool = global.ui_status.auto_place_dynamite
                if bool then
                    local getClosestBankDoor = global.registry.getClosestBankDoor
                    if getClosestBankDoor(300) then
                        place_dynamite()
                    end
                end
            end
            createloop(3, loop)
        end
        --placeDynamite()
        local function touchClosestVault()
            local function touchVault(part)
                local char = client.playerCharacter
                if not char then
                    return false
                end
                local PrimaryPart = char.PrimaryPart
                if not PrimaryPart then
                    return false
                end
                if char and PrimaryPart then
                    firetouchinterest(PrimaryPart, part, 0)
                    task.wait(0.5)
                    firetouchinterest(PrimaryPart, part, 1)
                end
            end
            local door
            local function loop()
                local bool = global.ui_status.auto_touch_vault
                if not bool then
                    return false
                end
                local getClosestTriggerDoor = global.registry.getClosestTriggerDoor(400)
                if not getClosestTriggerDoor then
                    door = nil
                    return false
                end
                if door ~= getClosestTriggerDoor then
                    door = getClosestTriggerDoor
                end
                if not door then
                    return false
                end
                touchVault(door)
            end
            createloop(0, loop)
        end
        --touchClosestVault()
        local function resolvePuzzle()
            local function loop()
                local bool = global.ui_status.puzzle_resolver
                if not bool then
                    return false
                end
                local flow = getupvalue(client.modules.puzzleFlow.Init,3)
                if not flow.IsOpen then
                    return false
                end
                local resolvePowerplant = global.registry.resolvePowerplant
                if not resolvePowerplant then
                    return false
                end
                return resolvePowerplant()
            end
            createloop(0.5, loop)
        end
        resolvePuzzle()
        local function museumFillBag()
            local function grab(player)
                local char = client.playerCharacter
                if not char then
                    return false
                end
                local primarypart = char.PrimaryPart
                if not primarypart then
                    return false
                end
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if string.find(v.Name, "Grab") then
                        if v.Part:IsDescendantOf(workspace.Museum) and (v.Part.Position - primarypart.Position).magnitude < 10 then
                            v:Callback(true)
                        end
                    end
                end
            end
            local function loop()
                if tostring(player.Team) == "Police" then
                    return false
                end
                local bool = global.ui_status.auto_fill_bag
                if not bool then
                    return false
                end
                local isInMuseum = global.registry.isInMuseum()
                if isInMuseum then
                    grab(player)
                    return true
                end
                return false
            end
            createloop(1, loop)
        end
        museumFillBag()
        local function hackClosestComputer()
            local function hackComputer()
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if v.Name == "Hack" or v.Name == "Disable Vault Security" then
                        v:Callback(true)
                    end
                end
            end
            local function loop()
                local bool = global.ui_status.hack_nearby_computers
                if bool then
                    local getClosestComputer = global.registry.getClosestComputer
                    if getClosestComputer(20) then
                        hackComputer()
                    end
                end
            end
            createloop(0.5, loop)
        end
        hackClosestComputer()
        local function airdropCorrection()
            local function getAirdropStatus()
                return workspace:FindFirstChild("Drop") ~= nil
            end
            local function status()
                local function loop()
                    if global.ui.statusRobberies["Airdrop Status"] then
                        local getAirdropStatus = getAirdropStatus()
                        if getAirdropStatus then
                            global.ui.statusRobberies["Airdrop Status"] = ("Status: %s"):format("Open")
                            global.ui.colorForcing["Airdrop Status"] = Color3.fromRGB(178, 255, 104)
                        elseif not getAirdropStatus then
                            global.ui.statusRobberies["Airdrop Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Airdrop Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                end
                createloop(0, loop)
            end
            status()
        end
        airdropCorrection()
        local function cargoPlaneCorrection()
            local function getCargoplaneStatus()
                local getRobberyStatus = global.registry.getRobberyStatus
                local status = getRobberyStatus("CARGO_PLANE")
                if status == "OPENED" then
                    return true
                end
                if status == "STARTED" then
                    return 0
                end 
                return false
            end
            local function status()
                local function loop()
                    if global.ui.statusRobberies["Cargoplane Status"] then
                        local getCargoplaneStatus = getCargoplaneStatus()
                        if getCargoplaneStatus == 0 then
                            global.ui.statusRobberies["Cargoplane Status"] = ("Status: %s"):format("Started")
                            global.ui.colorForcing["Cargoplane Status"] = Color3.fromRGB(255, 178, 102)
                            return true
                        end
                        if getCargoplaneStatus then
                            global.ui.statusRobberies["Cargoplane Status"] = ("Status: %s"):format("Open")
                            global.ui.colorForcing["Cargoplane Status"] = Color3.fromRGB(178, 255, 104)
                            return true
                        end
                        global.ui.statusRobberies["Cargoplane Status"] = ("Status: %s"):format("Closed")
                        global.ui.colorForcing["Cargoplane Status"] = Color3.fromRGB(255, 102, 102)
                    end
                end
                createloop(0, loop)
            end
            status()
            local function autoCollectPlaneCrate()
                local function collectCrate(crate)
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == "Inspect Crate" and v.Part == crate then
                            v:Callback(true)
                        end
                    end
                end
                local function loop()
                    local bool = global.ui_status.automatic_inspect_crate
                    if bool then
                        local getClosestCrate = global.registry.getClosestCrate()
                        if getClosestCrate then
                            collectCrate(getClosestCrate)
                        end
                    end
                end
                createloop(1, loop)
            end
            autoCollectPlaneCrate()
            local function automaticOpenPlaneDoor()
                local function openDoor()
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == "Open Door" then
                            if v.Part.Name == "Lever" then
                                if v.Enabled then
                                    v:Callback(true)
                                end
                            end
                        end
                    end
                end
                local function doorLogic()
                    local getEquippedItem = client.reg.getEquippedItem
                    if getEquippedItem then
                        if getEquippedItem.__ClassName == "Crate" then
                            openDoor()
                        end
                    end
                end
                local function loop()
                    local bool = global.ui_status.automatic_open_cargoplane_door
                    if bool then
                        doorLogic()
                    end
                end
                createloop(1, loop)
            end
            automaticOpenPlaneDoor()
        end
        cargoPlaneCorrection()
        local function autoCollectCasinoLoot()
            local function collectCash()
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if string.find(v.Name, "Collect") then
                        v:Callback(true)
                    end
                end
            end
            local function loop()
                local bool = global.ui_status.auto_collect_cash
                if bool then
                    local getClosestCasinoLoot = global.registry.getClosestCasinoLoot
                    if getClosestCasinoLoot(20) then
                        collectCash()
                    end
                end
            end
            createloop(1, loop)
        end
        autoCollectCasinoLoot()
        local function collectClosestCash()
            --[[
            local char = client.playerCharacter
            if not char then
                return false
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then
                return false
            end
            if #workspace.DroppedCash:GetChildren() > 0 then
                for i,v in next, workspace.DroppedCash:GetChildren() do
                    local part = v.Part
                    if part then
                        if (part.Position - root.Position).magnitude < range then
                            return v
                        end
                    end
                end
            end
            ]]
            local function onChildAdded(obj)
                local bool = global.ui_status.droppedcashaura
                if bool then
                    local cache
                    cache = createloop(0.2, function()
                        local range = global.ui_status.droppedcashrange
                        bool = global.ui_status.droppedcashaura
                        if not bool then
                            cache:disconnect()
                        end
                        if obj:IsDescendantOf(workspace) then
                            local char = client.playerCharacter
                            if char then
                                local root = char:FindFirstChild("HumanoidRootPart")
                                if root then
                                    if (obj.PrimaryPart - root.Position).magnitude < range then

                                    end
                                end
                            end
                        else
                            cache:disconnect()
                        end    
                    end)
                end
            end
            --workspace.DroppedCash.ChildAdded:connect(onChildAdded)
            local function collectCash(droppedcash)
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if string.find(v.Name, "Collect") and v.Part == droppedcash.PrimaryPart then -- prevent lag
                        v:Callback(droppedcash, true)
                    end
                end
            end
            local function loop()
                local bool = global.ui_status.droppedcashaura
                if bool then
                    local range = global.ui_status.droppedcashrange
                    local getClosestDroppedCash = global.registry.getClosestDroppedCash
                    if getClosestDroppedCash then
                        local droppedCash = getClosestDroppedCash(range)
                        if droppedCash then
                            collectCash(droppedCash)
                        end
                    end
                end
            end
            createloop(0.2, loop)
        end
        collectClosestCash()
        local function damageDealersCorrection()
            local function lasers()
                local function hookForBank(bool)
                    for i,v in next, collectionservice:GetAllTags() do
                        for i2,v2 in next, collectionservice:GetTagged(v) do
                            if workspace:FindFirstChild("Banks") and v2:IsDescendantOf(workspace.Banks) and v2:FindFirstChild("TouchInterest") then
                                v2.CanTouch = not bool
                            end
                        end
                    end
                end
                local function hookForTrain(bool)
                    for i,v in next, collectionservice:GetAllTags() do
                        for i2,v2 in next, collectionservice:GetTagged(v) do
                            if v2:IsDescendantOf(workspace.Trains) and v2:FindFirstChild("TouchInterest") then
                                v2.CanTouch = not bool
                            end
                        end
                    end
                end
                local function hookForJewelry(bool)
                    for i,v in next, collectionservice:GetAllTags() do
                        for i2,v2 in next, collectionservice:GetTagged(v) do
                            if workspace:FindFirstChild("Jewelrys") and v2:IsDescendantOf(workspace.Jewelrys) and v2:FindFirstChild("TouchInterest") and v2.Name ~= "LaserTouch" then
                                v2.CanTouch = not bool
                            end
                        end
                    end
                end
                local function hookForMansion(bool)
                    for i,v in next, workspace.MansionRobbery.Lasers:GetDescendants() do
                        if v.Name == "Laser" then
                            v.CanTouch = not bool
                        end
                    end
                end
                local function breakCasinoLasers(bool)
                    local casino = workspace:FindFirstChild("Casino")
                    if not casino then
                        return false
                    end
                    local vaultLaserControl = casino:FindFirstChild("VaultLaserControl")
                    if vaultLaserControl then
                        for i,v in next, vaultLaserControl:GetDescendants() do
                            if v:FindFirstChild("TouchInterest") then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local lasersMoving = casino:FindFirstChild("LasersMoving")
                    if lasersMoving then
                        for i,v in next, lasersMoving:GetDescendants() do
                            if v:FindFirstChild("TouchInterest") then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local laserCarousel = casino:FindFirstChild("LaserCarousel")
                    if laserCarousel then
                        for i,v in next, laserCarousel:GetDescendants() do
                            if v:FindFirstChild("TouchInterest") then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local lasers = casino:FindFirstChild("Lasers")
                    if lasers then
                        for i,v in next, lasers:GetDescendants() do
                            if v:FindFirstChild("TouchInterest") then
                                v.CanTouch = not bool
                            end
                        end
                    end
                end
                local function breakLasers(bool)
                    for i,v in next, workspace:GetDescendants() do
                        if v.Name == "BarbedWire" then
                            v.CanTouch = not bool
                        end
                    end
                end
                local cache
                local function bank()
                    print("bank")
                    hookForBank(not cache.obj.Value)
                    task.wait(1)
                    hookForBank(cache.obj.Value)
                end
                local function jewelry()
                    print("jewelry")
                    hookForJewelry(not cache.obj.Value)
                    task.wait(1)
                    hookForJewelry(cache.obj.Value)
                end
                local function mansion()
                    print("mansion")
                    hookForMansion(not cache.obj.Value)
                    task.wait(1)
                    hookForMansion(cache.obj.Value)
                end
                local function train(child)
                    for i,v in next, child:GetDescendants() do
                        if v:FindFirstChild("TouchInterest") then
                            print("train")
                            hookForTrain(not cache.obj.Value)
                            task.wait(1)
                            hookForTrain(cache.obj.Value)
                        end
                    end
                end
                local function onCasinoSpawned()
                    print("barbed wire")
                    breakLasers(not cache.obj.Value)
                    task.wait(1)
                    breakLasers(cache.obj.Value)
                end
                local function tagService()
                    cache = client.tags.new("lasers", 0, false, function(val)
                        breakLasers(val)
                        hookForBank(val)
                        hookForJewelry(val)
                        hookForTrain(val)
                        hookForMansion(val)
                    end)
                end
                tagService()
                local function loop()
                    local bool = global.ui_status.disable_lasers
                    if cache then
                        cache.obj.Value = bool
                    end
                end
                createloop(0, loop)
                local function workspaceChildAdded(obj)
                    local Model = obj:FindFirstChild("Model", true)
                    if Model then
                        local barbedWire = Model:FindFirstChild("BarbedWire", true)
                        if barbedWire then
                            for i2,v2 in next, Model:GetChildren() do
                                v2.CanTouch = not cache.obj.Value
                                print(i2,v2)
                            end
                        end
                    end
                    if obj:FindFirstChild("BarbedWire", true) then
                        for i,v in next, obj:GetDescendants() do
                            if v.Name == "BarbedWire" then
                                v.CanTouch = not cache.obj.Value
                            end
                        end
                    end
                    if obj.Name == "BarbedWire" then
                        obj.CanTouch = not cache.obj.Value
                    end
                    if obj.Name == "Banks" then
                        workspace.Banks.ChildAdded:connect(function(obj)
                            workspace.Banks:GetChildren()[1]:FindFirstChild("Layout").ChildAdded:connect(bank)
                        end)
                    end
                    if obj.Name == "Jewelrys" then
                        workspace.Jewelrys.ChildAdded:connect(function(obj)
                            workspace.Jewelrys:GetChildren()[1]:FindFirstChild("Floors").ChildAdded:connect(jewelry)
                        end)
                    end
                    if obj.Name == "Casino" then
                        breakCasinoLasers(cache.obj.Value)
                        --onCasinoSpawned()
                    end
                    if obj.Name == "MansionRobbery" then
                        mansion()
                        workspace.MansionRobbery.Lasers.Changed:connect(mansion)
                    end
                end
                if workspace:FindFirstChild("Banks") then
                    local getFirstChild = workspace.Banks:GetChildren()[1]
                    if getFirstChild then
                        getFirstChild:FindFirstChild("Layout").ChildAdded:connect(bank)
                    end
                end
                if workspace:FindFirstChild("Jewelrys") then
                    local getFirstChild = workspace.Jewelrys:GetChildren()[1]
                    if getFirstChild then
                        getFirstChild:FindFirstChild("Floors").ChildAdded:connect(jewelry)
                    end
                end
                if workspace:FindFirstChild("Casino") then
                    onCasinoSpawned()
                end
                if workspace:FindFirstChild("MansionRobbery") then
                    workspace.MansionRobbery.Lasers.Changed:connect(mansion)
                end
                table.insert(client.onWorkspaceSpawnRun, {
                    _fn = workspaceChildAdded
                })
                workspace.Trains.ChildAdded:connect(train)
            end
            lasers()
            local function powerplant()
                local function getPowerplantStatus()
                    local getRobberyStatus = global.registry.getRobberyStatus
                    local status = getRobberyStatus("POWER_PLANT")
                    if status == "OPENED" then
                        return true
                    end
                    if status == "STARTED" then
                        return 0
                    end 
                    return false
                end
                local function status()
                    local function loop()
                        if global.ui.statusRobberies["Powerplant Status"] then
                            local getPowerplantStatus = getPowerplantStatus()
                            if getPowerplantStatus == 0 then
                                global.ui.statusRobberies["Powerplant Status"] = ("Status: %s"):format("Started")
                                global.ui.colorForcing["Powerplant Status"] = Color3.fromRGB(255, 178, 102)
                                return true
                            end
                            if getPowerplantStatus then
                                global.ui.statusRobberies["Powerplant Status"] = ("Status: %s"):format("Open")
                                global.ui.colorForcing["Powerplant Status"] = Color3.fromRGB(178, 255, 104)
                                return true
                            end
                            global.ui.statusRobberies["Powerplant Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Powerplant Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                    createloop(0, loop)
                end
                status()
                local function powerplant_piston()
                    local piston = client.modules.piston.SlamPlayer
                    local function hook(...)
                        local bool = global.ui_status.disable_piston_damage
                        if bool then
                            return task.wait(9e9)
                        end
                        return piston(...)
                    end
                    client.modules.piston.SlamPlayer = hook
                end
                powerplant_piston()
                local function powerplant_powerwire()
                    local function breakPowerwire(bool)
                        for i,v in next, workspace.PowerPlant:GetDescendants() do
                            if v.Name == "PowerWire" then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local cache
                    local function tagService()
                        cache = client.tags.new("powerwire", 0, false, function(val)
                            breakPowerwire(val)
                        end)
                    end
                    tagService()
                    local function forceChange()
                        breakPowerwire(not cache.obj.Value)
                        task.wait(0.1)
                        breakPowerwire(cache.obj.Value)
                    end
                    local function onConnection()
                        local flow = getupvalue(client.modules.puzzleFlow.Init,3)
                        local onConnection = flow.OnConnection
                        local isFirstTime = true
                        local function hook(...)
                            if isFirstTime then
                                local getTagByName = client.tags:getTagByName("lasers")
                                for i,v in next, workspaceChildren do
                                    local Model = v:FindFirstChild("Model", true)
                                    if Model then
                                        local barbedWire = Model:FindFirstChild("BarbedWire", true)
                                        if barbedWire then
                                            for i2,v2 in next, Model:GetChildren() do
                                                v2.CanTouch = not getTagByName.obj.Value
                                            end
                                            isFirstTime = false
                                            break
                                        end
                                    end
                                end
                            end
                            return onConnection(...)
                        end
                        flow.OnConnection = hook
                    end
                    onConnection()
                    local function onPowerPlantAdded(obj)
                        if obj.Name == "PowerPlant" then
                            forceChange()
                        end
                    end
                    table.insert(client.onWorkspaceSpawnRun, {
                        _fn = onPowerPlantAdded
                    })
                    local function loop()
                        local bool = global.ui_status.disable_powerwire_damage
                        if cache then
                            cache.obj.Value = bool
                        end
                    end
                    createloop(0, loop)
                end
                powerplant_powerwire()
            end
            powerplant()
            local function tomb()
                local function getTombStatus()
                    local getRobberyStatus = global.registry.getRobberyStatus
                    local status = getRobberyStatus("TOMB")
                    if status == "OPENED" then
                        return true
                    end
                    if status == "STARTED" then
                        return 0
                    end 
                    return false
                end
                local function status()
                    local function loop()
                        if global.ui.statusRobberies["Tomb Status"] then
                            local getTombStatus = getTombStatus()
                            if getTombStatus == 0 then
                                global.ui.statusRobberies["Tomb Status"] = ("Status: %s"):format("Started")
                                global.ui.colorForcing["Tomb Status"] = Color3.fromRGB(255, 178, 102)
                                return true
                            end
                            if getTombStatus then
                                global.ui.statusRobberies["Tomb Status"] = ("Status: %s"):format("Open")
                                global.ui.colorForcing["Tomb Status"] = Color3.fromRGB(178, 255, 104)
                                return true
                            end 
                            global.ui.statusRobberies["Tomb Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Tomb Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                    createloop(0, loop)
                end
                status()
                local function resolver()
                    local function isLocalNearbyTeleporter()
                        local robberyTomb = workspace:FindFirstChild("RobberyTomb")
                        if not robberyTomb then
                            return false
                        end
                        local Top = robberyTomb.DartRoom.Teleporter:FindFirstChild("Top")
                        if Top then
                            local char = client.playerCharacter
                            if char then
                                local root = char:FindFirstChild("HumanoidRootPart")
                                if root then
                                    if (Top.Position - root.Position).magnitude < 10 then
                                        root.CFrame = Top.CFrame
                                        return true
                                    elseif (Top.Position - root.Position).magnitude < 30 then
                                        global.notify("Automatically resolving Dart Room... Do not move!", 5)
                                    end
                                end 
                            end
                        end
                        return false
                    end
                    local isTeleporting = false
                    local function teleportToEveryPillar()
                        if isTeleporting then
                            return false
                        end
                        if not isLocalNearbyTeleporter() then
                            return false
                        end
                        local char = client.playerCharacter
                        if char then
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if root then
                                isTeleporting = true
                                for i=1, 27 do
                                    task.wait(0.2)
                                    if i == 27 then
                                        isTeleporting = false
                                        break
                                    end
                                    local pos = workspace.RobberyTomb.DartRoom.Pillars:FindFirstChild(tostring(i)).InnerModel.Platform.CFrame
                                    root.CFrame = pos + Vector3.new(0, 1, 0)
                                end
                            end
                        end
                    end
                    local function loop()
                        local bool = global.ui_status.automatic_resolve_dart_room
                        if bool then
                            if not isTeleporting and isLocalNearbyTeleporter() then
                                teleportToEveryPillar()
                            end
                        end
                    end
                    createloop(0.1, loop)
                end
                resolver()
                local function darts()
                    local dartFire = client.modules.dartDispenser._fire
                    local function hook(...)
                        local bool = global.ui_status.disable_darts
                        if bool then
                            return task.wait(9e9)
                        end
                        return dartFire(...)
                    end
                    client.modules.dartDispenser._fire = hook
                end
                darts()
                local function wood()
                    local function breakWoods(bool)
                        local robberyTomb = workspace:FindFirstChild("RobberyTomb")
                        if not robberyTomb then
                            return false
                        end
                        for i,v in next, robberyTomb.Cart.Planks:GetDescendants() do
                            if v.Name == "Wood" then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local cache
                    local function tagService()
                        cache = client.tags.new("wood", 0, false, function(val)
                            breakWoods(val)
                        end)
                    end
                    tagService()
                    local function forceChange()
                        breakWoods(not cache.obj.Value)
                        task.wait()
                        breakWoods(cache.obj.Value)
                    end
                    local function robberyTombAdded(obj)
                        if obj.Name == "RobberyTomb" then
                            workspace.RobberyTomb.ChildAdded:connect(forceChange)
                            workspace.RobberyTomb.Changed:connect(forceChange)
                        end
                    end
                    table.insert(client.onWorkspaceSpawnRun, {
                        _fn = robberyTombAdded
                    })
                    local function loop()
                        local bool = global.ui_status.disable_wood
                        if cache then
                            cache.obj.Value = bool
                        end
                    end
                    createloop(0, loop)
                end
                wood()
                local function spikes()
                    local function breakSpikes(bool)
                        for i,v in next, workspace.RobberyTomb.SpikeRoom:GetDescendants() do
                            if v.Name == "Door" then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local cache
                    local function tagService()
                        cache = client.tags.new("spikes", 0, false, function(val)
                            breakSpikes(val)
                        end)
                    end
                    tagService()
                    local function forceChange()
                        breakSpikes(not cache.obj.Value)
                        task.wait(0.1)
                        breakSpikes(cache.obj.Value)
                    end
                    local function robberyTombAdded(obj)
                        if obj.Name == "RobberyTomb" then
                            forceChange()
                        end
                    end
                    table.insert(client.onWorkspaceSpawnRun, {
                        _fn = robberyTombAdded
                    })
                    local function loop()
                        local bool = global.ui_status.disable_spikes
                        if cache then
                            cache.obj.Value = bool
                        end
                    end
                    createloop(0, loop)
                end
                spikes()
                local function lava()
                    local function breakLava(bool)
                        for i,v in next, workspace.RobberyTomb.Kill:GetDescendants() do
                            if v.Name == "LavaKill" then
                                v.CanTouch = not bool
                            end
                        end
                    end
                    local cache
                    local function tagService()
                        cache = client.tags.new("lava", 0, false, function(val)
                            breakLava(val)
                        end)
                    end
                    tagService()
                    local function forceChange()
                        breakLava(not cache.obj.Value)
                        task.wait(0.1)
                        breakLava(cache.obj.Value)
                    end
                    local function robberyTombAdded(obj)
                        if obj.Name == "RobberyTomb" then
                            forceChange()
                        end
                    end
                    table.insert(client.onWorkspaceSpawnRun, {
                        _fn = robberyTombAdded
                    })
                    local function loop()
                        local bool = global.ui_status.disable_lava
                        if cache then
                            cache.obj.Value = bool
                        end
                    end
                    createloop(0, loop)
                end
                lava()
            end
            tomb()
            local function cameras()
                local function breakLights(bool)
                    local museum = workspace:FindFirstChild("Museum")
                    if museum then
                        local lights = museum.Lights
                        if lights then
                            for i,v in next, lights:GetDescendants() do
                                if v.Name == "Light" then
                                    v.CanTouch = not bool
                                end
                            end
                        end
                    end
                    local casino = workspace:FindFirstChild("Casino")
                    if casino then
                        local camerasMoving = casino.CamerasMoving
                        if camerasMoving then
                            for i,v in next, camerasMoving:GetDescendants() do
                                if v.Name == "Part" then
                                    v.CanTouch = not bool
                                end
                            end
                        end
                    end
                    local jewelrys = workspace:FindFirstChild("Jewelrys")
                    if jewelrys then
                        if #jewelrys:GetChildren() > 0 then 
                            local floors = jewelrys:GetChildren()[1].Floors
                            if floors then
                                for i,v in next, floors:GetDescendants() do
                                    if v.Name == "Part" then
                                        v.CanTouch = not bool
                                    end
                                end
                            end
                        end
                    end
                end
                local cache
                local function tagService()
                    cache = client.tags.new("cameras", 0, false, function(val)
                        breakLights(val)
                    end)
                end
                tagService()
                local function changeOnChildAdded()
                    print("cameras")
                    task.wait(0.1)
                    breakLights(not cache.obj.Value)
                    task.wait(0.1)
                    breakLights(cache.obj.Value)
                end
                local function onAddedWorkspace(obj)
                    if obj.Name == "Jewelrys" then
                        changeOnChildAdded()
                        workspace.Jewelrys:GetChildren()[1]:FindFirstChild("Floors").ChildAdded:connect(changeOnChildAdded)
                    end
                    if obj.Name == "Museum" then
                        changeOnChildAdded()
                    end
                    if obj.Name == "Casino" then
                        changeOnChildAdded()
                    end
                end
                table.insert(client.onWorkspaceSpawnRun, {
                    _fn = onAddedWorkspace
                })
                if workspace:FindFirstChild("Jewelrys") then
                    local findFirstChild = workspace.Jewelrys:GetChildren()[1]
                    if findFirstChild then
                        findFirstChild:FindFirstChild("Floors").ChildAdded:connect(changeOnChildAdded)
                    end
                end
                local function loop()
                    local bool = global.ui_status.disable_cameras
                    if cache then
                        cache.obj.Value = bool
                    end
                end
                createloop(0, loop)
            end
            cameras()
        end
        damageDealersCorrection()
        local function robberyStatusCorrection()
            local function bank()
                local function getBankStatus()
                    local getRobberyStatus = global.registry.getRobberyStatus
                    local status = getRobberyStatus("BANK")
                    if status == "OPENED" then
                        return true
                    end
                    if status == "STARTED" then
                        return 0
                    end 
                    return false
                end
                local function status()
                    local function loop()
                        if global.ui.statusRobberies["Bank Status"] then
                            local getBankStatus = getBankStatus()
                            if not getBankStatus then
                                global.ui.statusRobberies["Bank Status"] = ("Status: %s"):format("Open")
                                global.ui.colorForcing["Bank Status"] = Color3.fromRGB(178, 255, 104)
                                return true
                            end
                            if getBankStatus == 0 then
                                global.ui.statusRobberies["Bank Status"] = ("Status: %s"):format("Started")
                                global.ui.colorForcing["Bank Status"] = Color3.fromRGB(255, 178, 102)
                                return true
                            end
                            global.ui.statusRobberies["Bank Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Bank Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                    createloop(0, loop)
                end
                status()
            end
            bank()
        end
        robberyStatusCorrection()
        local function givingCorrection()
            local function equip_owned_guns()
                if global.ui_status.ui_gunstore then
                    return false
                end
                if global.is_special_equip then
                    return false
                end
                global.special_equip2 = true
                global.hideshopui = true
                local gunshopgui = player.PlayerGui.GunShopGui
                global.ui_status.open_gunstore_ui = true
                local container = gunshopgui.Container.Container.Main.Container
                while true do
                    if container:FindFirstChild("Slider") then
                        break
                    end
                    task.wait()
                end
                local slider = container:FindFirstChild("Slider")
                local resolveOwnedItems = client.reg.resolveOwnedItems
                if not resolveOwnedItems then
                    global.special_equip2 = false
                    global.hideshopui = false
                    global.ui_status.open_gunstore_ui = false
                    return false
                end
                local resolveEquippedItems = client.reg.resolveEquippedItems
                if not resolveEquippedItems then
                    global.special_equip2 = false
                    global.hideshopui = false
                    global.ui_status.open_gunstore_ui = false
                    return false
                end
                if #resolveOwnedItems == #resolveEquippedItems then
                    global.special_equip2 = false
                    global.hideshopui = false
                    global.ui_status.open_gunstore_ui = false
                    return false
                end
                if #resolveOwnedItems == 0 then
                    local button = slider:FindFirstChild("Pistol")
                    if not button then
                        log("Couldnt find Pistol")
                        global.special_equip2 = false
                        global.hideshopui = false
                        global.ui_status.open_gunstore_ui = false
                        return false
                    end
                    local action = button.Bottom.Action
                    if not action then
                        log("Couldnt find Action")
                        global.special_equip2 = false
                        global.hideshopui = false
                        global.ui_status.open_gunstore_ui = false
                        return false
                    end
                    for _, connection in next, getconnections(action.MouseButton1Down) do
                        if action.Text == "FREE" then
                            connection.Function()
                        end
                    end
                    task.wait(1)
                end
                for i,v in next, resolveOwnedItems do
                    if v ~= "Grenade" and v ~= "Flashlight" and v ~= "Binoculars" and not table.find(resolveEquippedItems, v) then
                        local slider = container:FindFirstChild("Slider")
                        if not slider then
                            log("Couldnt find Slider")
                            global.special_equip2 = false
                            global.hideshopui = false
                            global.ui_status.open_gunstore_ui = false
                            return false
                        end
                        local button = slider:FindFirstChild(v)
                        if not button then
                            log(("Couldnt find %s"):format(v))
                            global.special_equip2 = false
                            global.hideshopui = false
                            global.ui_status.open_gunstore_ui = false
                            return false
                        end
                        local action = button.Bottom.Action
                        if not action then
                            log("Couldnt find Action")
                            global.special_equip2 = false
                            global.hideshopui = false
                            global.ui_status.open_gunstore_ui = false
                            return false
                        end
                        for _, connection in next, getconnections(action.MouseButton1Down) do
                            connection.Function()
                        end
                    end
                end
                global.special_equip2 = false
                global.hideshopui = false
                global.ui_status.open_gunstore_ui = false
            end
            global.registry.equip_owned_guns = equip_owned_guns
            local lastUsed = tick()
            local function equipOwnedItem(item, unequip)
                global.hideshopui = true
                global.ui_status.open_gunstore_ui = true
                local gunshopgui = player.PlayerGui.GunShopGui
                local container = gunshopgui.Container.Container.Main.Container
                while true do
                    if container:FindFirstChild("Slider") then
                        break
                    end
                    task.wait()
                end
                local resolveOwnedItems = client.reg.resolveOwnedItems
                local slider = container:FindFirstChild("Slider")
                if not slider then
                    log("Couldnt find Slider")
                    global.hideshopui = false
                    global.ui_status.open_gunstore_ui = false
                    return false
                end
                if #resolveOwnedItems == 0 then
                    local button = slider:FindFirstChild("Pistol")
                    if not button then
                        log("Couldnt find Pistol")
                        global.hideshopui = false
                        global.ui_status.open_gunstore_ui = false
                        return false
                    end
                    local action = button.Bottom.Action
                    if not action then
                        log("Couldnt find Action")
                        global.hideshopui = false
                        global.ui_status.open_gunstore_ui = false
                        return false
                    end
                    for _, connection in next, getconnections(action.MouseButton1Down) do
                        if action.Text == "FREE" then
                            connection.Function()
                        end
                    end
                    return false
                end
                for i,v in next, resolveOwnedItems do
                    if v == tostring(item) then
                        local button = slider:FindFirstChild(v)
                        if not button then
                            log(("Couldnt find %s"):format(v))
                            global.hideshopui = false
                            global.ui_status.open_gunstore_ui = false
                            return false
                        end
                        local action = button.Bottom.Action
                        if not action then
                            log("Couldnt find Action")
                            global.hideshopui = false
                            global.ui_status.open_gunstore_ui = false
                            return false
                        end
                        for _, connection in next, getconnections(action.MouseButton1Down) do
                            connection.Function()
                        end
                    end
                end
                global.hideshopui = false
                global.ui_status.open_gunstore_ui = false
            end
            global.registry.equipOwnedItem = equipOwnedItem
            local function always_equip()
                local function loop()
                    local bool = global.ui_status.always_equip_owned_guns
                    if bool then
                        if global.is_special_equip then
                            return false
                        end
                        local resolveOwnedItems = client.reg.resolveOwnedItems
                        local resolveEquippedItems = client.reg.resolveEquippedItems
                        for i,v in next, resolveOwnedItems do
                            if not table.find(resolveEquippedItems, v) then
                                equipOwnedItem(v)
                            end
                        end
                    end
                end
                createloop(0.5, loop)
            end
            always_equip()
            local function dropdown()
                local function assignGuns()
                    local config = global.config
                    local cfg = config.equip_guns
                    cfg.list = client.reg.resolveOwnedItems
                    task.delay(0.2, function()
                        cfg.reload(cfg.list)
                    end)
                end
                assignGuns()
                local function onNewItem(obj)
                    local config = global.config
                    local cfg = config.equip_guns
                    cfg.list = {obj.Name}
                    task.delay(0.2, function()
                        cfg.reload(cfg.list)
                    end)
                end
                local items = player.Items or player:WaitForChild("Items")
                items.ChildAdded:connect(onNewItem)
            end
            dropdown()
        end
        givingCorrection()
        local function jewelryCorrection()
            local function getJewelryStatus()
                local getRobberyStatus = global.registry.getRobberyStatus
                local status = getRobberyStatus("JEWELRY")
                if status == "OPENED" then
                    return true
                end
                if status == "STARTED" then
                    return 0
                end
                return false
            end
            local function status()
                local function loop()
                    if global.ui.statusRobberies["Jewelry Status"] then
                        local getJewelryStatus = getJewelryStatus()
                        if not getJewelryStatus then
                            global.ui.statusRobberies["Jewelry Status"] = ("Status: %s"):format("Open")
                            global.ui.colorForcing["Jewelry Status"] = Color3.fromRGB(178, 255, 104)
                            return true
                        end
                        if getJewelryStatus == 0 then
                            global.ui.statusRobberies["Jewelry Status"] = ("Status: %s"):format("Started")
                            global.ui.colorForcing["Jewelry Status"] = Color3.fromRGB(255, 178, 102)
                            return true
                        end
                        global.ui.statusRobberies["Jewelry Status"] = ("Status: %s"):format("Closed")
                        global.ui.colorForcing["Jewelry Status"] = Color3.fromRGB(255, 102, 102)
                    end
                end
                createloop(0, loop)
            end
            status()
        end
        jewelryCorrection()
        local function casinoCorrection()
            local function getCasinoStatus()
                local getRobberyStatus = global.registry.getRobberyStatus
                local status = getRobberyStatus("CASINO")
                if status == "OPENED" then
                    return true
                end
                if status == "STARTED" then
                    return 0
                end 
                return false
            end
            local function status()
                local function loop()
                    if global.ui.statusRobberies["Casino Status"] then
                        local getCasinoStatus = getCasinoStatus()
                        if not getCasinoStatus then
                            global.ui.statusRobberies["Casino Status"] = ("Status: %s"):format("Open")
                            global.ui.colorForcing["Casino Status"] = Color3.fromRGB(178, 255, 104)
                            return true
                        end
                        if getCasinoStatus == 0 then
                            global.ui.statusRobberies["Casino Status"] = ("Status: %s"):format("Started")
                            global.ui.colorForcing["Casino Status"] = Color3.fromRGB(255, 178, 102)
                            return true
                        end
                        global.ui.statusRobberies["Casino Status"] = ("Status: %s"):format("Closed")
                        global.ui.colorForcing["Casino Status"] = Color3.fromRGB(255, 102, 102)
                    end
                end
                createloop(0, loop)
            end
            status()
            local function elevator()
                local call_elevator_to_floor = global.registry.call_elevator_to_floor
                local function loop()
                    local bool = global.ui_status.break_elevator
                    if bool then
                        call_elevator_to_floor("Vaults")
                        return true
                    end
                    return false
                end
                createloop(1, loop)
            end
            elevator()
            local function vault()
                local function crack()
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == "Crack" then
                            v:Callback(true)
                        end
                    end
                end
                local function changeDirection()
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == "Change Direction" then
                            v:Callback(true)
                        end
                    end
                end
                local function getVault()
                    local casino = workspace:FindFirstChild("Casino")
                    if casino then
                        return casino.HackableVaults.VaultDoorMain
                    end
                    return false
                end
                local function getLED()
                    local getVault = getVault()
                    if not getVault then
                        return false
                    end
                    return getVault.InnerModel.Model:FindFirstChild("UnlockedLED")
                end
                local function doCrackVault()
                    local vault = getVault()
                    if vault then
                        crack()
                    end
                end
                local function doSwitchDirection()
                    local vault = getVault()
                    if vault then
                        changeDirection()
                    end
                end
                local function getHacker()
                    local getVault = getVault()
                    if not getVault then
                        return false
                    end
                    for i,v in next, getVault:GetDescendants() do
                        if v:GetAttribute("VaultHackerId") == player.UserId then
                            return player.UserId
                        end
                    end
                    return false
                end
                local function onObjChanged(obj)
                    if tonumber(getHacker()) ~= player.UserId then
                        return false
                    end
                    if string.find(obj, "BrickColor") then
                        local getLED = getLED()
                        if getLED.BrickColor == BrickColor.new("Lime green") then
                            doSwitchDirection()
                        end
                    end
                end
                local function onAddedCasino(obj)
                    if obj.Name == "Casino" then
                        local getLED = getLED()
                        getLED.Changed:connect(onObjChanged)
                    end
                end
                table.insert(client.onWorkspaceSpawnRun, {
                    _fn = onAddedCasino
                })
                local function loop()
                    if not client.playerCharacter then
                        return false
                    end
                    local primarypart = client.playerCharacter.PrimaryPart
                    if not primarypart then
                        return false
                    end
                    local bool = global.ui_status.auto_crack_vault
                    if bool then
                        local vault = getVault()
                        if vault then
                            if (vault.InnerModel.Puzzle.InnerModel.Root.Position - primarypart.Position).magnitude < 25 then
                                local getHacker = getHacker()
                                if not getHacker or tostring(getHacker) == tostring(player.UserId) then
                                    return doCrackVault()
                                end
                            end
                        end
                    end
                end
                createloop(0.1, loop)
            end
            vault()
        end
        casinoCorrection()
        local function trainCorrection()
            local function getTrainStatus()
                local getRobberyStatus = global.registry.getRobberyStatus
                local status = getRobberyStatus("TRAIN_PASSENGER") or getRobberyStatus("TRAIN_CARGO")
                if status == "OPENED" then
                    return true
                end
                if status == "STARTED" then
                    return 0
                end 
                return false
            end
            local function status()
                local function loop()
                    if global.ui.statusRobberies["Trains Status"] then
                        local getTrainStatus = getTrainStatus()
                        if getTrainStatus == 0 then
                            global.ui.statusRobberies["Trains Status"] = ("Status: %s"):format("Started")
                            global.ui.colorForcing["Trains Status"] = Color3.fromRGB(255, 178, 102)
                            return true
                        end
                        if getTrainStatus then
                            global.ui.statusRobberies["Trains Status"] = ("Status: %s"):format("Open")
                            global.ui.colorForcing["Trains Status"] = Color3.fromRGB(178, 255, 104)
                            return true
                        end
                        global.ui.statusRobberies["Trains Status"] = ("Status: %s"):format("Closed")
                        global.ui.colorForcing["Trains Status"] = Color3.fromRGB(255, 102, 102)
                    end
                end
                createloop(0, loop)
            end
            status()
            local function passenger()
                local function grab()
                    local grabber = {"computer", "documents", "briefcase", "phone", "Cash", "spyglasses"}
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        for i2,v2 in next, grabber do
                            if string.find(v.Name, ("Grab %s"):format(v2)) then
                                if v.Part:IsDescendantOf(workspace.Trains) then
                                    if v.Enabled then
                                        v:Callback(true)
                                        task.wait(2)
                                    end
                                end
                            end
                        end
                    end
                end
                local function isTrainClose()
                    if #workspace.Trains:GetChildren() == 0 then
                        return false
                    end
                    
                    local char = client.playerCharacter
                    if not char then
                        return false
                    end
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if not root then
                        return false
                    end
                    for i,v in next, workspace.Trains:GetDescendants() do
                        if v:IsA("Part") or v:IsA("BasePart") then
                            if (v.Position - root.Position).magnitude < 25 then
                                return true
                            end
                        end
                    end
                end
                local function loop()
                    local bool = global.ui_status.automatic_train_fillbag
                    local automatic_delivery = global.ui_status.automatic_delivery
                    if tostring(player.Team) == "Police" then
                        if automatic_delivery then
                            if #workspace.Trains:GetChildren() > 0 then
                                local isTrainClose = isTrainClose()
                                if isTrainClose then
                                    grab()
                                end
                            end
                        end
                        return true
                    end
                    if bool then
                        if #workspace.Trains:GetChildren() > 0 then
                            local isTrainClose = isTrainClose()
                            if isTrainClose then
                                grab()
                            end
                        end
                    end
                end
                createloop(3, loop)
            end
            passenger()
            local function cargo()
                local function openDoor()
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == "Open Door" and v.Part:IsDescendantOf(workspace.Trains) then
                            if v.Enabled then
                                v:Callback(true)
                            end
                        end
                    end  
                end
                local function breachVault()
                    for i,v in next, client.modules.ui.CircleAction.Specs do
                        if v.Name == "Breach Vault" and v.Part:IsDescendantOf(workspace.Trains) then
                            if v.Enabled then
                                v:Callback(true)
                            end
                        end
                    end
                end
                local function isTrainClose()
                    if #workspace.Trains:GetChildren() == 0 then
                        return false
                    end
                    local char = client.playerCharacter
                    if not char then
                        return false
                    end
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if not root then
                        return false
                    end
                    for i,v in next, workspace.Trains:GetDescendants() do
                        if v:IsA("Part") or v:IsA("BasePart") then
                            if (v.Position - root.Position).magnitude < 25 then
                                return true
                            end
                        end
                    end
                end
                local function loop()
                    local bool = global.ui_status.automatic_breach_vault
                    if bool then
                        if #workspace.Trains:GetChildren() > 0 then
                            local isTrainClose = isTrainClose()
                            if isTrainClose then
                                openDoor()
                                breachVault()
                            end
                        end
                    end
                end
                createloop(1, loop)
            end
            cargo()
        end
        trainCorrection()
        local function prisonCorrection()
            local function automatic_punch_electric_gate()
                local doors_garbageCollected = global.registry.doors_garbageCollected
                local doorsOpener_garbageCollected = global.registry.doorsOpener_garbageCollected
                if doors_garbageCollected and doorsOpener_garbageCollected then
                    for i,v in next, doors_garbageCollected do
                        doorsOpener_garbageCollected(v)
                    end
                end
            end
            local function automatic_open_cells()
                local cellDoors = global.registry.cellDoors
                local doorsOpener_garbageCollected = global.registry.doorsOpener_garbageCollected
                if cellDoors and doorsOpener_garbageCollected then
                    for i,v in next, cellDoors do
                        doorsOpener_garbageCollected(v)
                    end
                end
            end
            local function open_prison_gates()
                local prisonGate = global.registry.prisonGate
                if prisonGate then
                    for i,v in next, prisonGate do
                        for i2,v2 in next, getconnections(v) do
                            v2.Function(player)
                        end
                    end
                else
                    log("No prisonGate")
                end
            end
            local function explodeWall()
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if v.Name == "Explode Wall" then
                        if v.Enabled then
                            v:Callback(true)
                        end
                    end
                end
            end
            local function liftGate()
                for i,v in next, client.modules.ui.CircleAction.Specs do
                    if v.Name == "Lift Gate" then
                        if v.Enabled then
                            v:Callback(true) 
                        end
                    end
                end
            end
            local punch_gate
            local prison_gate
            local lift_gate
            local explode_wall
            local open_cells
            local function tagService()
                local function punchGateFn()
                    local cache
                    punch_gate = client.tags.new("punchgate", 0, false, function(val)
                        if not val then
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                            return false
                        else
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                        end
                        automatic_punch_electric_gate()
                        cache = createloop(2, function()
                            if not punch_gate.obj.Value then
                                if cache then
                                    cache:disconnect()
                                    cache = nil
                                end
                                return false
                            end
                            automatic_punch_electric_gate()
                        end)
                    end)
                end
                punchGateFn()
                local function prisonGateFn()
                    local cache
                    prison_gate = client.tags.new("prisongate", 0, false, function(val)
                        if not val then
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                            return false
                        else
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                        end
                        open_prison_gates()
                        cache = createloop(2, function()
                            if not prison_gate.obj.Value then
                                if cache then
                                    cache:disconnect()
                                    cache = nil
                                end
                                return false
                            end
                            open_prison_gates()
                        end)
                    end)
                end
                prisonGateFn()
                local function liftGateFn()
                    local cache
                    lift_gate = client.tags.new("liftgate", 0, false, function(val)
                        if not val then
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                            return false
                        else
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                        end
                        liftGate()
                        cache = createloop(2, function()
                            if not lift_gate.obj.Value then
                                if cache then
                                    cache:disconnect()
                                    cache = nil
                                end
                                return false
                            end
                            liftGate()
                        end)
                    end)
                end
                liftGateFn()
                local function explodeWallFn()
                    local cache
                    explode_wall = client.tags.new("explodewall", 0, false, function(val)
                        if not val then
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                            return false
                        else
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                        end
                        explodeWall()
                        cache = createloop(2, function()
                            if not explode_wall.obj.Value then
                                if cache then
                                    cache:disconnect()
                                    cache = nil
                                end
                                return false
                            end
                            explodeWall()
                        end)
                    end)
                end
                explodeWallFn()
                local function openCellsFn()
                    local cache
                    open_cells = client.tags.new("opencells", 0, false, function(val)
                        if not val then
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                            return false
                        else
                            if cache then
                                cache:disconnect()
                                cache = nil
                            end
                        end
                        automatic_open_cells()
                        cache = createloop(2, function()
                            if not open_cells.obj.Value then
                                if cache then
                                    cache:disconnect()
                                    cache = nil
                                end
                                return false
                            end
                            automatic_open_cells()
                        end)
                    end)
                end
                openCellsFn()
            end
            tagService()
            local function loop()
                local automatic_punch_electric_gate = global.ui_status.automatic_punch_electric_gate
                local automatic_open_prison_gate = global.ui_status.automatic_open_prison_gate
                local automatic_liftgate = global.ui_status.automatic_liftgate
                local automatic_explode_wall = global.ui_status.automatic_explode_wall
                local automatic_open_prison_gate = global.ui_status.automatic_open_prison_gate
                if punch_gate then
                    punch_gate.obj.Value = automatic_punch_electric_gate
                end
                if prison_gate then
                    prison_gate.obj.Value = automatic_open_prison_gate
                end
                if lift_gate then
                    lift_gate.obj.Value = automatic_liftgate
                end
                if explode_wall then
                    explode_wall.obj.Value = automatic_explode_wall
                end
                if open_cells then
                    open_cells.obj.Value = automatic_open_prison_gate
                end
            end
            createloop(0, loop)
        end
        prisonCorrection()
        local function bulletCorrection()
            local num = global.ui_status.prediction_value or 13
            if num < 10 then
                num = 13
            end
            local decimals = tonumber(("0.%s"):format(tostring(num)))
            num = decimals
            local function prediction(target)
                local function predict(part)
                    return part.Position + part.Velocity * num
                end
                local predict = predict(target)
                if predict then
                    return predict
                end
                return false
            end
            local a = 0
            local hsv --@Color3.fromHSV(1, 0.921569, 0.552941)
            local function createColorfulTable()
                while true do
                    for i=0, 1, 1/300 do
                        hsv = Color3.fromHSV(i, 1, 1)
                        task.wait()
                    end
                end
            end
            spawn(createColorfulTable)
            local function colorBullet()
                local update = client.modules.bulletEmitter.Update
                local function hook(...)
                    local bool = global.ui_status.rainbowbullets
                    if bool then
                        unpack({...}).Color = hsv
                    end
                    return update(...)
                end
                client.modules.bulletEmitter.Update = hook
            end
            colorBullet()
            local function silentaim()
                local update = client.modules.bulletEmitter.Update
                local function loop()
                    local bool = global.ui_status.master_switch_silentaim
                    if bool then
                        local no_wall_penetration = global.ui_status.no_wall_penetration
                        if no_wall_penetration then
                            local getEquippedItem = client.reg.getEquippedItem
                            if getEquippedItem then
                                local always_predict = global.ui_status.always_predict
                                local checkWallBeforePenetration = global.registry.checkWallBeforePenetration
                                local target = client.reg.getClosestPlayerByFov
                                if target then
                                    local bulletEmitter = getEquippedItem.BulletEmitter
                                    if bulletEmitter then
                                        local bullets = bulletEmitter.Bullets
                                        if bullets then
                                            local char = client.playerCharacter
                                            if char then
                                                for i=1, #bullets do
                                                    local v = bullets[i]
                                                    if target:FindFirstChild("Head") then
                                                        local Head = target.Head
                                                        if always_predict then
                                                            local prediction = prediction(Head)
                                                            if prediction then
                                                                v[2] = (prediction - char.Head.Position).unit
                                                            else
                                                                v[2] = (Head.Position - char.Head.Position).unit
                                                            end
                                                        else
                                                            v[2] = (Head.Position - char.Head.Position).unit
                                                        end
                                                    elseif players[target.Name] then
                                                        if checkWallBeforePenetration(target) then
                                                            if always_predict then
                                                                local prediction = prediction(target.Character.Head)
                                                                if prediction then
                                                                    v[2] = (prediction - char.Head.Position).unit
                                                                else
                                                                    v[2] = (target.Character.Head.Position - char.Head.Position).unit
                                                                end
                                                            else
                                                                v[2] = (target.Character.Head.Position - char.Head.Position).unit
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                createloop(0, loop)
            end
            silentaim()
            local function rayIgnoreNonCollideHooks()
                local module = client.modules.rayCast.RayIgnoreNonCollideWithIgnoreList
                local function selectTaserTarget()
                    local function target(...)
                        local resolver = client.reg.getClosestPlayerByFov
                        if resolver == nil then
                            return nil
                        end
                        return resolver
                    end
                    if target() == nil then
                        return nil
                    end
                    return target() and target().Character and target().Character.PrimaryPart
                end
                local function selectTarget(...)
                    local function target(...)
                        local resolver = client.reg.getClosestPlayerByFov
                        if resolver == nil then
                            return nil
                        end
                        return resolver
                    end
                    if target() == nil then
                        return nil
                    end
                    if target() and target():FindFirstChild("DefenseObjValueName") then
                        return target() and target().HumanoidRootPart and target().HumanoidRootPart
                    end
                    if target() and target():IsDescendantOf(workspace.MansionRobbery) then
                        local bool = global.ui_status.always_target_boss_head
                        if bool then
                            if target() and target().Name == "ActiveBoss" then
                                return target() and target().Head and target().Head
                            end
                            return target() and target().HumanoidRootPart and target().HumanoidRootPart
                        end
                        return target() and target().HumanoidRootPart and target().HumanoidRootPart
                    end
                    return target() and target().Character and target().Character.PrimaryPart
                end
                local function hook(...)
                    if not client.playerCharacter then
                        return module(...)
                    end
                    local getEquippedItem = client.reg.getEquippedItem
                    if not getEquippedItem then
                        return module(...)
                    end
                    if global.ui_status.master_switch_silentaim then
                        if string.find(debug.traceback(), "BulletEmitter") then
                            if getEquippedItem and not getEquippedItem.BulletEmitter then
                                return module(...)
                            end
                            local no_wall_penetration = global.ui_status.no_wall_penetration
                            if no_wall_penetration then
                                return module(...)
                            end
                            local target, position = selectTarget(), selectTarget() and selectTarget().Position
                            if target == nil then
                                return module(...)
                            end
                            local always_predict = global.ui_status.always_predict
                            if not always_predict then
                                return target, position, ...
                            end
                            local prediction = prediction(target)
                            if prediction then
                                return target, prediction, ...
                            end
                            return target, position, ...
                        end
                    end
                    return module(...)
                end
                client.modules.rayCast.RayIgnoreNonCollideWithIgnoreList = hook
            end
            rayIgnoreNonCollideHooks()
        end
        bulletCorrection()
        local function itemCameraCorrection()
            local onItemEquipped = client.modules.itemCamera.OnItemEquipped
            local onItemUnequipped = client.modules.itemCamera.OnItemUnequipped
            local scopebegin = client.modules.sniper.ScopeBegin
            local scopeend = client.modules.sniper.ScopeEnd
            local function hook(...)
                if global.ui_status.spam_drop_guns then
                    return onItemUnequipped()
                end
                return onItemEquipped(...)
            end
            client.modules.itemCamera.OnItemEquipped = hook
            local function hook2(...)
                if global.ui_status.spam_drop_guns then
                    return scopeend(...)
                end
                return scopebegin(...)
            end
            client.modules.sniper.ScopeBegin = hook2
        end
        itemCameraCorrection()
        local function fovCorrection()
            local function loop()
                local num = global.ui_status.fov or 70
                workspace.CurrentCamera.FieldOfView = num
            end
            createloop(0, loop)
        end
        fovCorrection()
        local function arrestCorrection()
            local function ejectPlayer(vehicle)
                if not vehicle then
                    return false
                end
                local shouldEject = global.registry.shouldEject
                shouldEject({
                    ShouldEject = true;
                    Part = vehicle;
                }, true)
            end
            local function arrestPlayer(target)
                if not target or not target.Name then
                    return false
                end
                local shouldArrest = global.registry.shouldArrest
                shouldArrest({
                    PlayerName = target.Name
                })
            end
            local function tasePlayer()
                local hasItemEquipped = global.registry.hasItemEquipped
                if hasItemEquipped("Taser") then
                    local useTaser = global.registry.useTaser
                    if useTaser then
                        useTaser()
                    end
                end
            end
            local function equipTaser()
                local equip = global.registry.equip
                equip("Taser")
            end
            local function equipHandcuffs()
                local equip = global.registry.equip
                equip("Handcuffs")
            end
            local function taserLogic()
                local unequipAll = global.registry.unequipAll
                local bool = global.ui_status.allow_tase_target
                if bool then
                    local getEquippedItem = client.reg.getEquippedItem
                    local hasItemEquipped = global.registry.hasItemEquipped
                    if getEquippedItem and hasItemEquipped("Taser") then
                        equipTaser()
                        local canUseTaser = global.registry.canUseTaser(getEquippedItem)
                        if canUseTaser then
                            tasePlayer()
                        else
                            unequipAll()
                        end
                    elseif getEquippedItem and not hasItemEquipped("Taser") then
                        local unequipAll = global.registry.unequipAll
                        unequipAll()
                        if not client.reg.getEquippedItem then
                            local equip = global.registry.equip
                            equipTaser()
                            if hasItemEquipped("Taser") then
                                getEquippedItem = client.reg.getEquippedItem
                                if getEquippedItem then
                                    local canUseTaser = global.registry.canUseTaser(getEquippedItem)
                                    if canUseTaser then
                                        tasePlayer()
                                    else
                                        unequipAll()
                                    end
                                end
                            end
                        end
                    elseif not getEquippedItem then
                        equipTaser()
                        local unequipAll = global.registry.unequipAll
                        local getEquippedItem = client.reg.getEquippedItem
                        local hasItemEquipped = global.registry.hasItemEquipped
                        if getEquippedItem and hasItemEquipped("Taser") then
                            local canUseTaser = global.registry.canUseTaser(getEquippedItem)
                            if canUseTaser then
                                tasePlayer()
                            else
                                unequipAll()
                            end
                        end
                    end
                end
                local a = true
                task.delay(0.1, function()
                    a = false
                end)
                while true do
                    if not a then
                        break
                    end
                    task.wait()
                end
                unequipAll()
                task.delay(0.1, function()
                    a = true
                end)
                while true do
                    if a then
                        break
                    end
                    task.wait()
                end
                equipHandcuffs()
            end
            local function getVehicle(target)
                local getPlayerVehicle = global.registry.getPlayerVehicle
                local vehicle = getPlayerVehicle(target, true)
                if vehicle then
                    return getPlayerVehicle(target, true)
                end
                return false
            end
            local function hasHandcuffs()
                local hasItemEquipped = global.registry.hasItemEquipped
                if hasItemEquipped("Handcuffs") then
                    return true
                end
                return false
            end
            local last_time_trashtalked = tick()
            local isTrashtalking = false
            local function trashtalk()
                if not global.ui_status.talk_on_arrest then
                    return false
                end
                if tick() - last_time_trashtalked < 1.5 then
                    return false
                end
                last_time_trashtalked = tick()
                local phrase2 = {
                    [1] = {
                        "prietene n-ai bani de ice tray v4?";
                        "disgord.gg/icetray";
                        "5Eqt6QBfYY";
                    };
                    [2] = {
                        "I got ice tray v3 for FREE";
                        "Get it too on disgord.gg/icetray";
                    };
                    [3] = {
                        "too ez with ice tray v3";
                        "Purchase ice tray v4 now and it will be even easier! disgord.gg/icetray";
                    };
                    [4] = {
                        "ez noob";
                        "get better with ice tray";
                        "disgord.gg/icetray";
                    };
                    [5] = {
                        "cioc cioc";
                        "de la gaze";
                        "buy ice tray v4";
                    };
                }
                local event = textService.TextChannels.RBXGeneral
                if not isTrashtalking then
                    isTrashtalking = true
                    for i,v in next, phrase2[math.random(1, #phrase2)] do
                        event:SendAsync(v)
                        task.wait(1.5)
                    end
                    isTrashtalking = false
                end
            end
            local lastEquippedCuffs = tick()
            local lastUsedTaser = tick()
            local function aura()
                local getClosestPlayerWithNoHandcuffs = global.registry.getClosestPlayerWithNoHandcuffs
                local equip = global.registry.equip
                local unequipAll = global.registry.unequipAll
                local checkWallBeforePenetration = global.registry.checkWallBeforePenetration
                local hasInVehicleTag = global.registry.hasInVehicleTag
                local function loop()
                    local master_switch_arrestaura = global.ui_status.master_switch_arrestaura
                    if not master_switch_arrestaura then
                        return false
                    end
                    if global.ui_status.ignore_while_driving and client.reg.getLocalVehicle then
                        return false
                    end
                    local automatic_equip_handcuffs = global.ui_status.automatic_equip_handcuffs
                    local automatic_eject_player = global.ui_status.automatic_eject_player
                    local allow_tase_target = global.ui_status.allow_tase_target
                    local through_walls = global.ui_status.through_walls
                    local range = global.ui_status.range_arrestaura
                    if player.Team ~= teams.Police then
                        return false
                    end
                    local target = getClosestPlayerWithNoHandcuffs(range)
                    if target then
                        if tostring(target.Team) == "Prisoner" then
                            return false
                        end
                        if target.Character and target.Folder:FindFirstChild("Cuffed") then
                            return false
                        end
                        if not through_walls then
                            if not checkWallBeforePenetration(target) then
                                return false
                            end
                        end
                        if not hasHandcuffs() and not automatic_equip_handcuffs then
                            return false
                        end
                        local hasItemEquipped = global.registry.hasItemEquipped
                        if allow_tase_target then
                            if tick() - lastUsedTaser > 10 then
                                taserLogic()
                                lastUsedTaser = tick()
                            end
                        end
                        if hasHandcuffs() and automatic_equip_handcuffs then
                            if tick() - lastEquippedCuffs > 5 then
                                unequipAll()
                            end
                        end
                        while true do
                            if hasHandcuffs() then
                                break
                            end
                            if target and target.Folder:FindFirstChild("Cuffed") then
                                break
                            end
                            if automatic_equip_handcuffs then
                                equipHandcuffs()
                            end
                            task.wait()
                        end
                        local succees = false
                        if not succees then
                            if not target.Character then
                                return false
                            end
                            local targetVehicle = getVehicle(target)
                            if targetVehicle and automatic_eject_player then
                                ejectPlayer(targetVehicle)
                                task.delay(0.1, function()
                                    arrestPlayer(target)
                                end)
                            end
                            if target and target.Folder:FindFirstChild("Cuffed") then
                                succees = true
                            end
                            if not succees then
                                if hasInVehicleTag(target.Character) then
                                    if targetVehicle and automatic_eject_player then
                                        ejectPlayer(targetVehicle)
                                    end
                                end
                                if hasHandcuffs() and automatic_equip_handcuffs then
                                    if tick() - lastEquippedCuffs > 3 then
                                        lastEquippedCuffs = tick()
                                        unequipAll()
                                        task.delay(0.1, function()
                                            equipHandcuffs()
                                        end)
                                        while true do
                                            if hasHandcuffs() then
                                                break
                                            end
                                            task.wait()
                                        end
                                    end
                                end
                                local attempts = 0
                                while true do
                                    if not master_switch_arrestaura then
                                        break
                                    end
                                    if not target then
                                        break
                                    end
                                    if target and not target.Character then
                                        break
                                    end
                                    if not hasHandcuffs() then
                                        break
                                    end
                                    if target and target.Folder:FindFirstChild("Cuffed") then
                                        succees = true
                                        break
                                    end
                                    if attempts == 3 then
                                        if target and target.Folder:FindFirstChild("Cuffed") then
                                            succees = true 
                                        end
                                        attempts = 0
                                        break
                                    end
                                    arrestPlayer(target)
                                    attempts = attempts + 1
                                    task.wait(0.8)
                                end
                            end
                        end
                        if succees and global.ui_status.talk_on_arrest then
                            if target and target.Folder:FindFirstChild("Cuffed") then
                                trashtalk()
                            end
                        end
                    end
                end
                createloop(0.3, loop)
            end
            aura()
        end
        arrestCorrection()
        local function ejectCorrection()
            local function ejectPlayer(vehicle)
                if not vehicle then
                    return false
                end
                local shouldEject = global.registry.shouldEject
                shouldEject({
                    ShouldEject = true;
                    Part = vehicle;
                }, true)
            end
            local hasInVehicleTag = global.registry.hasInVehicleTag
            local function loop()
                if tostring(player.Team) ~= "Police" then
                    return false
                end
                local bool = global.ui_status.master_switch_eject_aura
                if bool then
                    local range = global.ui_status.range_ejectaura
                    local target = global.registry.getClosestPlayerWithNoHandcuffs(range)
                    if target then
                        local char = target.Character
                        if char then
                            local inVehicle = hasInVehicleTag(char)
                            if inVehicle then
                                local getPlayerVehicle = global.registry.getPlayerVehicle(target, true)
                                if getPlayerVehicle then
                                    ejectPlayer(getPlayerVehicle)
                                end
                            end
                        end
                    end
                end
            end
            createloop(0, loop)
        end
        ejectCorrection()
        local function breakoutCorrection()
            local function breakoutPlayer(player)
                local shouldBreakout = global.registry.shouldBreakout
                shouldBreakout({
                    ShouldBreakout = true;
                    PlayerName = player.Name;
                }, true)
            end
            local getClosestPlayerForBreakouts = global.registry.getClosestPlayerForBreakouts
            local lastTimeBreakout = tick()
            local function loop()
                local bool = global.ui_status.master_switch_breakout_aura
                if bool then
                    local range = global.ui_status.range_breakoutaura
                    local target = getClosestPlayerForBreakouts(range)
                    if target and target.Folder:FindFirstChild("Cuffed") then
                        if tick() - lastTimeBreakout < 20 then
                            return false
                        end
                        lastTimeBreakout = tick()
                        breakoutPlayer(target)
                    end
                end
            end
            createloop(0, loop)
        end
        breakoutCorrection()
        local function pickpocketCorrection()
            local function pickpocketPlayer(player)
                local shouldPickpocket = global.registry.shouldPickpocket
                shouldPickpocket({
                    ShouldPickpocket = true;
                    PlayerName = player.Name;
                }, true)
            end
            local getClosestPlayerWithTagPolice = global.registry.getClosestPlayerWithTagPolice
            local function loop()
                local bool = global.ui_status.pickpocketaura
                if tostring(player.Team) == "Police" then
                    return false
                end
                if not bool then
                    return false
                end
                local range = global.ui_status.range_pickpocketaura
                local target = getClosestPlayerWithTagPolice(range)
                if target then
                    pickpocketPlayer(target)
                end
            end
            createloop(1, loop)
        end
        pickpocketCorrection()
        local function dropCorrection()
            local function spam_drop_guns()
                local isSpamming = false
                local function loop()
                    local bool = global.ui_status.spam_drop_guns
                    if bool then
                        if isSpamming then
                            return false
                        end
                        isSpamming = true
                        local equip_owned_guns = global.registry.equip_owned_guns
                        local equip = global.registry.equip
                        local dropGun = global.registry.dropGun
                        equip_owned_guns()
                        task.delay(0.1, function()
                            local neverdrop = {"Taser", "Handcuffs", "RoadSpike", "Gem", "Bag", "Crate", "MansionInvite"}
                            for i,v in next, client.reg.getInventoryItemsFor do
                                if bool then
                                    if not table.find(neverdrop, v.obj.name) then
                                        equip(tostring(v.obj.name))
                                        while true do
                                            if not client.reg.getEquippedItem then
                                                break
                                            end
                                            dropGun()
                                            task.wait(0.1)
                                        end
                                    end
                                end
                            end
                            isSpamming = false
                        end)
                    end
                end
                createloop(0.4, loop)
            end
            spam_drop_guns()
        end
        dropCorrection()
        local function turretCorrection()
            local function home()
                local module = client.modules.playerUtils.getRootPart
                local function hook(...)
                    local bool = global.ui_status.disable_home_turrets
                    if bool then
                        if string.find(debug.traceback(), "Fabricate.Turret") then
                            return task.wait(9e9)
                        end
                    end
                    return module(...)
                end
                client.modules.playerUtils.getRootPart = hook
            end
            home()
            local function military()
                local militaryTurret = client.modules.militaryTurret._fire
                local function hook(x, y)
                    local bool = global.ui_status.disable_military_turrets
                    local turretmilitary = global.registry.turretmilitary
                    if bool then
                        return task.wait(9e9)
                    end
                    return militaryTurret(x, y)
                end
                client.modules.militaryTurret._fire = hook
            end
            military()
            local function banktruck()
                local function getBankTruckStatus()
                    local getRobberyStatus = global.registry.getRobberyStatus
                    local status = getRobberyStatus("MONEY_TRUCK")
                    if status == "OPENED" then
                        return true
                    end
                    if status == "STARTED" then
                        return 0
                    end 
                    return false
                end
                local function status()
                    local function loop()
                        if global.ui.statusRobberies["Banktruck Status"] then
                            local getBankTruckStatus = getBankTruckStatus()
                            if getBankTruckStatus == 0 then
                                global.ui.statusRobberies["Banktruck Status"] = ("Status: %s"):format("Started")
                                global.ui.colorForcing["Banktruck Status"] = Color3.fromRGB(255, 178, 102)
                                return true
                            end
                            if getBankTruckStatus then
                                global.ui.statusRobberies["Banktruck Status"] = ("Status: %s"):format("Open")
                                global.ui.colorForcing["Banktruck Status"] = Color3.fromRGB(178, 255, 104)
                                return true
                            end
                            global.ui.statusRobberies["Banktruck Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Banktruck Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                    createloop(0, loop)
                end
                status()
            end
            banktruck()
            local function smallstores()
                local function donutshop()
                    local function getDonutShopStatus()
                        local getRobberyStatus = global.registry.getRobberyStatus
                        local status = getRobberyStatus("STORE_DONUT")
                        if status == "OPENED" then
                            return true
                        end
                        if status == "STARTED" then
                            return 0
                        end 
                        return false
                    end
                    local function status()
                        local function loop()
                            if global.ui.statusRobberies["Donut Shop"] then
                                local getDonutShopStatus = getDonutShopStatus()
                                if getDonutShopStatus == 0 then
                                    global.ui.statusRobberies["Donut Shop"] = ("Donut Shop Status: %s"):format("Started")
                                    global.ui.colorForcing["Donut Shop"] = Color3.fromRGB(255, 178, 102)
                                    return true
                                end
                                if getDonutShopStatus then
                                    global.ui.statusRobberies["Donut Shop"] = ("Donut Shop Status: %s"):format("Open")
                                    global.ui.colorForcing["Donut Shop"] = Color3.fromRGB(178, 255, 104)
                                    return true
                                end
                                global.ui.statusRobberies["Donut Shop"] = ("Donut Shop Status: %s"):format("Closed")
                                global.ui.colorForcing["Donut Shop"] = Color3.fromRGB(255, 102, 102)
                            end
                        end
                        createloop(0, loop)
                    end
                    status()
                end
                donutshop()
                local function gasstation()
                    local function getGasStationStatus()
                        local getRobberyStatus = global.registry.getRobberyStatus
                        local status = getRobberyStatus("STORE_GAS")
                        if status == "OPENED" then
                            return true
                        end
                        if status == "STARTED" then
                            return 0
                        end 
                        return false
                    end
                    local function status()
                        local function loop()
                            if global.ui.statusRobberies["Gas Station"] then
                                local getGasStationStatus = getGasStationStatus()
                                if getGasStationStatus == 0 then
                                    global.ui.statusRobberies["Gas Station"] = ("Gas Station Status: %s"):format("Started")
                                    global.ui.colorForcing["Gas Station"] = Color3.fromRGB(255, 178, 102)
                                    return true
                                end
                                if getGasStationStatus then
                                    global.ui.statusRobberies["Gas Station"] = ("Gas Station Status: %s"):format("Open")
                                    global.ui.colorForcing["Gas Station"] = Color3.fromRGB(178, 255, 104)
                                    return true
                                end
                                global.ui.statusRobberies["Gas Station"] = ("Gas Station Status: %s"):format("Closed")
                                global.ui.colorForcing["Gas Station"] = Color3.fromRGB(255, 102, 102)
                            end
                        end
                        createloop(0, loop)
                    end
                    status()
                end
                gasstation()
            end
            smallstores()
            local function mansionCorrection()
                local function getMansionStatus()
                    local getRobberyStatus = global.registry.getRobberyStatus
                    local status = getRobberyStatus("MANSION")
                    if status == "OPENED" then
                        return true
                    end
                    if status == "STARTED" then
                        return 0
                    end
                    return false
                end
                local function autoentry()
                    local mansionRobbery = workspace.MansionRobbery
                    local function hasMansioninvite()
                        return global.registry.hasMansioninvite()
                    end
                    local getPartsInRegion = global.registry.getPartsInRegion
                    local function isInMansion()
                        local char = client.playerCharacter
                        if char then
                            local primarypart = char.PrimaryPart
                            if primarypart then
                                local tbl = {
                                    x = {
                                        max = 3225;
                                        min = 3103;
                                    };
                                    y = {
                                        max = 104;
                                        min = 56;
                                    };
                                    z = {
                                        max = -4520;
                                        min = -4691;
                                    };
                                }
                                local pos = {
                                    x = primarypart.Position.x;
                                    y = primarypart.Position.y;
                                    z = primarypart.Position.z;
                                }
                                local getPartsInRegion = getPartsInRegion(pos.x, pos.y, pos.z, tbl.x.min, tbl.y.min, tbl.z.min, tbl.x.max, tbl.y.max, tbl.z.max)
                                if getPartsInRegion then
                                    return true
                                end
                            end
                        end
                        return false
                    end
                    local utils = client.modules.mansionRobberyUtils
                    local function getNumPlayersInElevator()
                        return utils.getNumPlayersInElevator(mansionRobbery)
                    end
                    local function isPlayerInElevator(player)
                        return utils.isPlayerInElevator(mansionRobbery, player)
                    end
                    local function loop()
                        local bool = global.ui_status.automatic_elevator_entry
                        if bool then
                            if not global.ui_status.allow_on_police_team and tostring(player.Team) == "Police" then
                                return false
                            end
                            if not hasMansioninvite() then
                                return false
                            end
                            local char = client.playerCharacter
                            if not char then
                                return false
                            end
                            local primarypart = char.PrimaryPart
                            if not primarypart then
                                return false
                            end
                            if not isInMansion() then
                                return false
                            end
                            local status = getMansionStatus()
                            if status then
                                local getNumPlayersInElevator = getNumPlayersInElevator()
                                if getNumPlayersInElevator < 3 then
                                    local isPlayerInElevator = isPlayerInElevator(player)
                                    if not isPlayerInElevator then
                                        firetouchinterest(mansionRobbery.Lobby.EntranceElevator.TouchToEnter, primarypart, 0)
                                        firetouchinterest(mansionRobbery.Lobby.EntranceElevator.TouchToEnter, primarypart, 1)
                                    end
                                end
                            end
                        end
                    end
                    createloop(0, loop)
                end
                autoentry()
                local function status()
                    local function loop()
                        if global.ui.statusRobberies["Mansion Status"] then
                            local getMansionStatus = getMansionStatus()
                            if getMansionStatus == 0 then
                                global.ui.statusRobberies["Mansion Status"] = ("Status: %s"):format("Started")
                                global.ui.colorForcing["Mansion Status"] = Color3.fromRGB(255, 178, 102)
                                return true
                            end
                            if getMansionStatus then
                                global.ui.statusRobberies["Mansion Status"] = ("Status: %s"):format("Open")
                                global.ui.colorForcing["Mansion Status"] = Color3.fromRGB(178, 255, 104)
                                return true
                            end
                            global.ui.statusRobberies["Mansion Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Mansion Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                    createloop(0, loop)
                end
                status()
                local function noTraps(bool)
                    local function laserTraps(bool)
                        if workspace.MansionRobbery.InRobberyFolder:FindFirstChild(player.UserId) then
                            for i,v in next, workspace.MansionRobbery.LaserTraps:GetDescendants() do
                                if v:IsA("BasePart") and v.CanTouch ~= not bool then
                                    v.CanTouch = not bool
                                end
                            end
                        end
                    end
                    local function loop()
                        local bool = global.ui_status.disable_traps
                        laserTraps(bool)
                    end
                    createloop(0, loop)
                end
                noTraps()
                local function noRagdoll()
                    local module = client.modules.falling.StartRagdolling
                    local function hook(...)
                        local bool = global.ui_status.anti_boss_ragdoll
                        if string.find(debug.traceback(), "BossNPCBinder") then
                            return not bool
                        end
                        return module(...)
                    end
                    client.modules.falling.StartRagdolling = hook
                end
                noRagdoll()
                local function noDamage()
                    local playLaserSweepVisual = client.modules.bossNpcBinder._constructor.PlayLaserSweepVisual
                    local playArmGrab = client.modules.bossNpcBinder._constructor.PlayArmGrab
                    local function hookLaserSweep(...)
                        local bool = global.ui_status.anti_boss_attack
                        if bool then
                            return false
                        end
                        return playLaserSweepVisual(...)
                    end
                    local function hookArmGrab(...)
                        local bool = global.ui_status.anti_boss_attack
                        if bool then
                            return false
                        end
                        return playArmGrab(...)
                    end
                    client.modules.bossNpcBinder._constructor.PlayLaserSweepVisual = hookLaserSweep
                    client.modules.bossNpcBinder._constructor.PlayArmGrab = hookArmGrab
                end
                noDamage()
                local function lasers()
                    local function loop()
                        if workspace.MansionRobbery.InRobberyFolder:FindFirstChild(player.UserId) then
                            for i,v in next, workspace.MansionRobbery.Lasers:GetDescendants() do
                                if v:IsA("BasePart") then
                                    v.CanTouch = not global.ui_status.disable_lasers
                                end
                            end
                        end
                    end
                    createloop(0, loop)
                end
                lasers()
            end
            mansionCorrection()
            local function cargoship()
                local function getCargoshipStatus()
                    local getRobberyStatus = global.registry.getRobberyStatus
                    local status = getRobberyStatus("CARGO_SHIP")
                    if status == "OPENED" then
                        return true
                    end
                    if status == "STARTED" then
                        return 0
                    end 
                    return false
                end
                local function status()
                    local function loop()
                        if global.ui.statusRobberies["Cargoship Status"] then
                            local getCargoshipStatus = getCargoshipStatus()
                            if getCargoshipStatus == 0 then
                                global.ui.statusRobberies["Cargoship Status"] = ("Status: %s"):format("Started")
                                global.ui.colorForcing["Cargoship Status"] = Color3.fromRGB(255, 178, 102)
                                return true
                            end
                            if getCargoshipStatus then
                                global.ui.statusRobberies["Cargoship Status"] = ("Status: %s"):format("Open")
                                global.ui.colorForcing["Cargoship Status"] = Color3.fromRGB(178, 255, 104)
                                return true
                            end
                            global.ui.statusRobberies["Cargoship Status"] = ("Status: %s"):format("Closed")
                            global.ui.colorForcing["Cargoship Status"] = Color3.fromRGB(255, 102, 102)
                        end
                    end
                    createloop(0, loop)
                end
                status()
                local cargoShipTurret = client.modules.cargoShipTurret.Shoot
                local function hook(x, y)
                    local bool = global.ui_status.disable_cargoship_turrets
                    if bool then
                        return task.wait(9e9)
                    end
                    return cargoShipTurret(x, y)
                end
                client.modules.cargoShipTurret.Shoot = hook
            end
            cargoship()
        end
        turretCorrection()
        local function doorCorrection()
            local function secretBases()
                local function getDoors(bool)
                    local secretBasePolice = workspace.SecretBasePolice:GetDescendants()
                    local secretBaseCriminal = workspace.SecretBaseCriminal:GetDescendants()
                    local policeSecretBase2 = workspace.PoliceSecretBase2:GetDescendants()
                    for i,v in next, secretBasePolice do
                        if v:IsA("Part") then
                            v.CanCollide = not bool
                            if bool then
                                v.Transparency = 1
                            else
                                v.Transparency = 0
                            end
                        end
                    end
                    for i,v in next, secretBaseCriminal do
                        if v:IsA("Part") and v.Name ~= "Region" then
                            v.CanCollide = not bool
                            if bool then
                                v.Transparency = 1
                            else
                                v.Transparency = 0
                            end
                        end
                    end
                    for i,v in next, policeSecretBase2 do
                        if v:IsA("MeshPart") then
                            v.CanCollide = not bool
                            if bool then
                                v.Transparency = 1
                            else
                                v.Transparency = 0
                            end
                        end
                    end
                end
                local cache
                local function tagService()
                    cache = client.tags.new("secretbases", 0, false, function(val)
                        getDoors(val)
                    end)
                end
                tagService()
                local function onWorkspaceSpawnRun(obj)
                    if obj.Name == "SecretBasePolice" then
                        getDoors(cache.obj.Value)
                    end
                    if obj.Name == "SecretBaseCriminal" then
                        getDoors(cache.obj.Value)
                    end
                    if obj.Name == "PoliceSecretBase2" then
                        getDoors(cache.obj.Value)
                    end
                end
                table.insert(client.onWorkspaceSpawnRun, {
                    _fn = onWorkspaceSpawnRun
                })
                local function loop()
                    local bool = global.ui_status.open_secretbases
                    if cache then
                        cache.obj.Value = bool
                    end
                end
                createloop(0, loop)
            end
            secretBases()
            local function casino()
                local pad = collectionservice:GetTagged("CasinoKeypadPrompt")[1]
                local function loop()
                    local bool = global.ui_status.auto_open_door
                    if bool then
                        local getCasinoDoor = global.registry.getCasinoDoor()
                        if getCasinoDoor then
                            local getKeycode = global.registry.getKeycode()
                            if getKeycode ~= "" then
                                local casinoKeypadSubmit = pad:FindFirstChild("CasinoKeypadSubmit")
                                if casinoKeypadSubmit then
                                    casinoKeypadSubmit:FireServer(getKeycode)
                                end
                            end
                        end
                    end
                end
                createloop(1, loop)
            end
            casino()
            local function loop()
                local bool = global.ui_status.master_switch_open_doors
                if not bool then
                    return false
                end
                local success, err = pcall(function()
                    local open = global.registry.doors
                    for i,v in next, open do
                        v()
                    end
                end)
            end
            createloop(2.5, loop)
        end
        doorCorrection()
        local function markerCorrection()
            local function playerMarkers()
                local teams = {}
                local function addTeam(team)
                    table.insert(teams, tostring(team))
                end
                local function removeTeam(team)
                    for num, name in next, teams do
                        if name == team then
                            table.remove(teams, num)
                        end
                    end
                end
                local function isTeamAllowed(team)
                    if table.find(teams, tostring(team)) then
                        return true
                    end
                    return false
                end
                local function teamCheck()
                    local function loop()
                        local allow_police_marker = global.ui_status.allow_police_marker
                        local allow_criminal_marker = global.ui_status.allow_criminal_marker
                        local allow_prisoner_marker = global.ui_status.allow_prisoner_marker
                        local function getTeams()
                            local findPrisoner = table.find(teams, "Prisoner")
                            local findPolice = table.find(teams, "Police")
                            local findCriminal = table.find(teams, "Criminal")
                            if allow_prisoner_marker and not findPrisoner then
                                addTeam("Prisoner")
                            elseif not allow_prisoner_marker and findPrisoner then
                                removeTeam("Prisoner")
                            end
                            if allow_criminal_marker and not findCriminal then
                                addTeam("Criminal")
                            elseif not allow_criminal_marker and findCriminal then
                                removeTeam("Criminal")
                            end
                            if allow_police_marker and not findPolice then
                                addTeam("Police")
                            elseif not allow_police_marker and findPolice then
                                removeTeam("Police")
                            end
                        end
                        getTeams()
                    end
                    createloop(0, loop)
                end
                teamCheck()
                local function playerMarkerLogic()
                    local doesMarkerExist = global.registry.doesMarkerExist
                    local constructMarker = global.registry.constructMarker
                    local destructMarker = global.registry.destructMarker
                    local setColor = global.registry.setColor
                    local markerColors = global.registry.markerColors
                    local function destructMarkers()
                        for i,v in next, client.players do
                            if doesMarkerExist(v) then
                                destructMarker(v)
                            end
                        end
                        return true
                    end
                    local bounties = {}
                    local function loop()
                        local master_switch = global.ui_status.master_switch_marker
                        if not master_switch then
                            return destructMarkers()
                        end
                        local mark_bounty_criminals = global.ui_status.mark_bounty_criminals
                        local getPlayersWithBounty = global.registry.getPlayersWithBounty()
                        for i,v in next, client.players do
                            if not table.find(getPlayersWithBounty, v) or not mark_bounty_criminals then
                                if table.find(bounties, v) then
                                    if doesMarkerExist(v) then
                                        destructMarker(v)
                                    end
                                    for _, bounty in next, bounties do
                                        if bounty == v then
                                            table.remove(bounties, _)
                                        end
                                    end
                                    return true
                                end
                                if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                                    local team, teamString = v.Team, tostring(v.Team)
                                    local isTeamAllowed = isTeamAllowed(team)
                                    local color
                                    if isTeamAllowed then
                                        if markerColors[teamString] then
                                            color = markerColors[teamString]
                                        end
                                        if not doesMarkerExist(v) then
                                            if not color then
                                                return false
                                            end
                                            constructMarker(v)
                                            setColor(v, color)
                                        end
                                    else
                                        local doesMarkerExist = doesMarkerExist(v)
                                        if master_switch and not doesMarkerExist then
                                            if teamString == tostring(player.Team) then
                                                color = markerColors[teamString]
                                                if color then
                                                    constructMarker(v)
                                                    setColor(v, color)
                                                    return true
                                                end
                                                return false
                                            end
                                        end
                                        if doesMarkerExist then
                                            if teamString ~= tostring(player.Team) then
                                                destructMarker(v)
                                            end
                                        end
                                    end
                                end
                                if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0 and doesMarkerExist(v) then
                                    destructMarker(v)
                                end
                                if v.Character and v.Folder:FindFirstChild("Cuffed") and doesMarkerExist(v) then
                                    destructMarker(v)
                                end
                            elseif table.find(getPlayersWithBounty, v) then
                                if mark_bounty_criminals then
                                    if not table.find(bounties, v)then
                                        table.insert(bounties, v)
                                        if doesMarkerExist(v) then
                                            destructMarker(v)
                                        end
                                        return true
                                    end
                                    if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                                        local team, teamString = v.Team, tostring(v.Team)
                                        local isTeamAllowed = isTeamAllowed(team)
                                        local color
                                        if isTeamAllowed then
                                            if markerColors.Bounty then
                                                color = markerColors.Bounty
                                            end
                                            if not doesMarkerExist(v) then
                                                if not color then
                                                    return false
                                                end
                                                constructMarker(v)
                                                setColor(v, color)
                                            end
                                        else
                                            local doesMarkerExist = doesMarkerExist(v)
                                            if master_switch and not doesMarkerExist then
                                                if teamString == tostring(player.Team) then
                                                    color = markerColors.Bounty
                                                    if color then
                                                        constructMarker(v)
                                                        setColor(v, color)
                                                        return true
                                                    end
                                                    return false
                                                end
                                            end
                                            if doesMarkerExist then
                                                if teamString ~= tostring(player.Team) then
                                                    destructMarker(v)
                                                end
                                            end
                                        end
                                    end
                                    if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0 and doesMarkerExist(v) then
                                        destructMarker(v)
                                    end
                                    if v.Character and v.Folder:FindFirstChild("Cuffed") then
                                        destructMarker(v)
                                    end
                                end
                            end
                        end
                    end
                    createloop(0, loop)
                end
                playerMarkerLogic()
            end
            playerMarkers()
            local function airdropMarkers()
                local image = getsynasset("icetray3/resource/airdrop.png")
                if not image then
                    error("error while trying to get synapse asset `airdrop.png`")
                end
                local markerColors = global.registry.markerColors
                local worldmarker = client.modules.worldMarker
                local system = client.modules.system
                local group = client.modules.group
                local airdrop = {}
                local function markerCreate(part)
                    local function makeAirdropGroups(drop, group)
                        table.insert(airdrop, {
                            part = part;
                            drop = drop;
                            group = group;
                        })
                    end
                    local function makeMarker()
                        local group = group.new()
                        system.addGroup(group)
                        group:SetEnabled(true)
                        local new = worldmarker.new()
                        new:SetAdornee(part)
                        new:SetScreenGui(system.gui)
                        new:SetSizes({8, {24, 0}, {math.huge, 8}})
                        local function createImageLabel()
                            local imagelabel = Instance.new("ImageLabel")
                            imagelabel.BorderSizePixel = 0
                            imagelabel.BackgroundTransparency = 1
                            imagelabel.Size = UDim2.new(1, 0, 1, 0)
                            imagelabel.Position = UDim2.new(0.5, 0, 0.5, 0)
                            imagelabel.AnchorPoint = Vector2.new(0.5, 0.5)
                            imagelabel.ZIndex = 3
                            imagelabel.Parent = new.FrameInner
                            imagelabel.Image = image
                        end
                        createImageLabel()
                        local function walls()
                            local walls = part.Parent:FindFirstChild("Walls")
                            if not walls then
                                print("no walls")
                                new.FrameInner.ImageColor3 = markerColors.Airdrop
                                return
                            end
                            local wall = walls:FindFirstChild("Wall")
                            if not wall then
                                print("couldnt get wall")
                                new.FrameInner.ImageColor3 = markerColors.Airdrop
                                return
                            end
                            new.FrameInner.ImageColor3 = wall.Color
                        end
                        walls()
                        group:Add(new)
                        makeAirdropGroups(new, group)
                    end
                    makeMarker()
                end
                local function markerRemove(root)
                    if not root then
                        for i,v in next, airdrop do
                            if not v.part:IsDescendantOf(workspace) then
                                v.group:Remove(v.drop)
                                v.drop:Destroy()
                                v.drop = nil
                                table.remove(airdrop, i)
                                return true
                            end
                            if v.part ~= nil then
                                if v.drop and v.group then
                                    v.group:Remove(v.drop)
                                    v.drop:Destroy()
                                    v.drop = nil
                                end
                                table.remove(airdrop, i)
                            end
                        end
                        return false
                    end
                    for i,v in next, airdrop do
                        if not v.part:IsDescendantOf(workspace) then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(airdrop, i)
                            return true
                        end
                        if v.part == root then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(airdrop, i)
                        end
                    end
                end
                local function doesMarkerExist(root)
                    local result = false
                    if not root then
                        for i,v in next, airdrop do
                            result = v.drop ~= nil
                        end
                        return result
                    end
                    for i,v in next, airdrop do
                        if v.part == root then
                            result = v.drop ~= nil
                        end
                    end
                    return result
                end
                local function onChildAdded(part)
                    local bool = global.ui_status.master_switch_marker
                    if not bool then
                        return false
                    end
                    local allow_airdrop_marker = global.ui_status.allow_airdrop_marker
                    if not allow_airdrop_marker then
                        return false
                    end
                    if part.Name == "Drop" then
                        local root = part:FindFirstChild("Root")
                        if root then
                            if not doesMarkerExist(root) then
                                markerCreate(root)
                            end
                        end
                    end
                end
                local function onChildRemoved(part)
                    if part.Name == "Drop" then
                        local root = part:FindFirstChild("Root")
                        if root then
                            if doesMarkerExist(root) then
                                markerRemove(root)    
                            end
                        end
                    end
                end
                table.insert(client.onWorkspaceSpawnRun, {
                    _fn = onChildAdded
                })
                workspace.ChildRemoved:connect(onChildRemoved)
                local function loop()
                    local master_switch = global.ui_status.master_switch_marker
                    if not master_switch then
                        if doesMarkerExist() then
                            markerRemove()
                        end
                        return false
                    end
                    local bool = global.ui_status.allow_airdrop_marker
                    if bool then
                        for i,v in next, workspaceChildren do
                            if v.Name == "Drop" then
                                if v:FindFirstChild("Root") then
                                    if not doesMarkerExist(v.Root) then
                                        markerCreate(v.Root)
                                    end
                                else
                                    if doesMarkerExist() then
                                        markerRemove()
                                    end
                                end
                            end
                        end
                    else
                        if doesMarkerExist() then
                            markerRemove()
                        end
                    end
                end
                createloop(0.5, loop)
            end
            airdropMarkers()
            local function footballMarker()
                local image = getsynasset("icetray3/resource/football.png")
                if not image then
                    error("error while trying to get synapse asset `football.png`")
                end
                local markerColors = global.registry.markerColors
                local worldmarker = client.modules.worldMarker
                local system = client.modules.system
                local group = client.modules.group
                local football = {}
                local function markerCreate(part)
                    local function makeFootballGroups(drop, group)
                        table.insert(football, {
                            part = part;
                            drop = drop;
                            group = group;
                        })
                    end
                    local function makeMarker()
                        local group = group.new()
                        system.addGroup(group)
                        group:SetEnabled(true)
                        local new = worldmarker.new()
                        new:SetAdornee(part)
                        new:SetScreenGui(system.gui)
                        new:SetSizes({8, {24, 0}, {math.huge, 8}})
                        local function createImageLabel()
                            local imagelabel = Instance.new("ImageLabel")
                            imagelabel.BorderSizePixel = 0
                            imagelabel.BackgroundTransparency = 1
                            imagelabel.Size = UDim2.new(0.8, 0, 0.8, 0)
                            imagelabel.Position = UDim2.new(0.5, 0, 0.5, 0)
                            imagelabel.AnchorPoint = Vector2.new(0.5, 0.5)
                            imagelabel.ZIndex = 3
                            imagelabel.Parent = new.FrameInner
                            imagelabel.Image = image
                        end
                        createImageLabel()
                        new.FrameInner.ImageColor3 = markerColors.Football
                        group:Add(new)
                        makeFootballGroups(new, group)
                    end
                    makeMarker()
                end
                local function markerRemove(root)
                    if not root then
                        for i,v in next, football do
                            if not v.part:IsDescendantOf(workspace) then
                                v.group:Remove(v.drop)
                                v.drop:Destroy()
                                v.drop = nil
                                table.remove(football, i)
                                return true
                            end
                            if v.part ~= nil then
                                if v.drop and v.group then
                                    v.group:Remove(v.drop)
                                    v.drop:Destroy()
                                    v.drop = nil
                                end
                                table.remove(football, i)
                            end
                        end
                        return false
                    end
                    for i,v in next, football do
                        if not v.part:IsDescendantOf(workspace) then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(football, i)
                            return true
                        end
                        if v.part == root then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(football, i)
                        end
                    end
                end
                local function doesMarkerExist(root)
                    local result = false
                    if not root then
                        for i,v in next, football do
                            result = v.drop ~= nil
                        end
                        return result
                    end
                    for i,v in next, football do
                        if v.part == root then
                            result = v.drop ~= nil
                        end
                    end
                    return result
                end
                local function onChildAdded(part)
                    local bool = global.ui_status.master_switch_marker
                    if not bool then
                        return false
                    end
                    local allow_football_marker = global.ui_status.allow_football_marker
                    if not allow_football_marker then
                        return false
                    end
                    if part.Name == "SoccerBall" then
                        if not doesMarkerExist(part) then
                            markerCreate(part)
                        end
                    end
                end
                local function onChildRemoved(part)
                    if part.Name == "SoccerBall" then
                        if doesMarkerExist(part) then
                            markerRemove(part)
                        end
                    end
                end
                table.insert(client.onWorkspaceSpawnRun, {
                    _fn = onChildAdded
                })
                workspace.ChildRemoved:connect(onChildRemoved)
                local function loop()
                    local master_switch = global.ui_status.master_switch_marker
                    if not master_switch then
                        if doesMarkerExist() then
                            markerRemove()
                        end
                        return false
                    end
                    local bool = global.ui_status.allow_football_marker
                    if bool then
                        local soccerBall = workspace:FindFirstChild("SoccerBall")
                        if soccerBall then
                            if not doesMarkerExist(soccerBall) then
                                markerCreate(soccerBall)
                            end
                        end
                    else
                        if doesMarkerExist() then
                            markerRemove()
                        end
                    end
                end
                createloop(0.5, loop)
            end
            footballMarker()
            local function npcsMarker()
                local image = getsynasset("icetray3/resource/robot.png")
                if not image then
                    error("error while trying to get synapse asset `robot.png`")
                end
                local markerColors = global.registry.markerColors
                local worldmarker = client.modules.worldMarker
                local system = client.modules.system
                local group = client.modules.group
                local npcs = {}
                local function markerCreate(part)
                    local function makeNPCsGroups(drop, group)
                        table.insert(npcs, {
                            part = part;
                            drop = drop;
                            group = group;
                        })
                    end
                    local function makeMarker()
                        local group = group.new()
                        system.addGroup(group)
                        group:SetEnabled(true)
                        local new = worldmarker.new()
                        new:SetAdornee(part)
                        new:SetScreenGui(system.gui)
                        new:SetSizes({8, {24, 0}, {math.huge, 8}})
                        local function createImageLabel()
                            local imagelabel = Instance.new("ImageLabel")
                            imagelabel.BorderSizePixel = 0
                            imagelabel.BackgroundTransparency = 1
                            imagelabel.Size = UDim2.new(0.8, 0, 0.8, 0)
                            imagelabel.Position = UDim2.new(0.5, 0, 0.5, 0)
                            imagelabel.AnchorPoint = Vector2.new(0.5, 0.5)
                            imagelabel.ZIndex = 3
                            imagelabel.Parent = new.FrameInner
                            imagelabel.Image = image
                        end
                        createImageLabel()
                        new.FrameInner.ImageColor3 = markerColors.NPCs
                        group:Add(new)
                        makeNPCsGroups(new, group)
                    end
                    makeMarker()
                end
                local function markerRemove(root)
                    if not root then
                        for i,v in next, npcs do
                            if not v.part:IsDescendantOf(workspace) then
                                v.group:Remove(v.drop)
                                v.drop:Destroy()
                                v.drop = nil
                                table.remove(npcs, i)
                                return true
                            end
                            if v.part ~= nil then
                                if v.drop and v.group then
                                    v.group:Remove(v.drop)
                                    v.drop:Destroy()
                                    v.drop = nil
                                end
                                table.remove(npcs, i)
                            end
                        end
                        return false
                    end
                    for i,v in next, npcs do
                        if not v.part:IsDescendantOf(workspace) then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(npcs, i)
                            return true
                        end
                        if v.part == root then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(npcs, i)
                        end
                    end
                end
                local function doesMarkerExist(root)
                    local result = false
                    if not root then
                        for i,v in next, npcs do
                            result = v.drop ~= nil
                        end
                        return result
                    end
                    for i,v in next, npcs do
                        if v.part == root then
                            result = v.drop ~= nil
                        end
                    end
                    return result
                end
                local function onChildAdded(part)
                    local bool = global.ui_status.master_switch_marker
                    if not bool then
                        return false
                    end
                    local allow_npcs_marker = global.ui_status.allow_npcs_marker
                    if not allow_npcs_marker then
                        return false
                    end
                    if part and part.Value and part.Value.HumanoidRootPart then
                        if not doesMarkerExist(part.Value.HumanoidRootPart) then
                            markerCreate(part.Value.HumanoidRootPart)
                        end
                    end
                end
                local function onChildRemoved(part)
                    if part and part.Value and part.Value.HumanoidRootPart then
                        if doesMarkerExist(part.Value.HumanoidRootPart) then
                            markerRemove(part.Value.HumanoidRootPart)
                        end
                    end
                end
                workspace.GuardNPCPlayers.ChildAdded:connect(onChildAdded)
                workspace.GuardNPCPlayers.ChildRemoved:connect(onChildRemoved)
                local function onChildAdded2(part)
                    local bool = global.ui_status.master_switch_marker
                    if not bool then
                        return false
                    end
                    local allow_npcs_marker = global.ui_status.allow_npcs_marker
                    if not allow_npcs_marker then
                        return false
                    end
                    if not doesMarkerExist(part.HumanoidRootPart) then
                        markerCreate(part.HumanoidRootPart)
                    end
                end
                local function onChildRemoved2(part)
                    if doesMarkerExist(part.HumanoidRootPart) then
                        markerRemove(part.HumanoidRootPart)
                    end
                end
                workspace.MansionRobbery.GuardsFolder.ChildAdded:connect(onChildAdded2)
                workspace.MansionRobbery.GuardsFolder.ChildRemoved:connect(onChildRemoved2)
                local function destroyOnNoNDescendant()
                    for i,v in next, npcs do
                        if not v.part:IsDescendantOf(workspace) then
                            v.group:Remove(v.drop)
                            v.drop:Destroy()
                            v.drop = nil
                            table.remove(npcs, i)
                        end
                        task.wait(1)
                    end
                end
                local function loop()
                    local master_switch = global.ui_status.master_switch_marker
                    if not master_switch then
                        if doesMarkerExist() then
                            destroyOnNoNDescendant()
                        end
                        return false
                    end
                    local bool = global.ui_status.allow_npcs_marker
                    if bool then
                        if #workspace.MansionRobbery.GuardsFolder:GetChildren() > 0 then
                            for i,v in next, workspace.MansionRobbery.GuardsFolder:GetChildren() do
                                local root = v:FindFirstChild("HumanoidRootPart")
                                if root then
                                    if not doesMarkerExist(root) then
                                        markerCreate(root)
                                    end
                                end
                            end
                        end
                        if #workspace.GuardNPCPlayers:GetChildren() > 0 then
                            for i,v in next, workspace.GuardNPCPlayers:GetChildren() do
                                if v and v.Value then
                                    local root = v.Value:FindFirstChild("HumanoidRootPart")
                                    if root then
                                        if not doesMarkerExist(root) then
                                            markerCreate(root)
                                        end
                                    end
                                end
                            end
                        end
                    else
                        if doesMarkerExist() then
                            markerRemove()
                        end
                    end
                end
                createloop(0, loop)
            end
            npcsMarker()
        end
        markerCorrection()
    end
    Corrections()
    local function icetraygui()
        local function force_show_player_tab()
            local icetray = coregui:FindFirstChild("ice tray v3")
            if icetray then
                local newPagePlayer = icetray.shadow.MainFrame.framesAll.pageFolder.newPagePlayer
                newPagePlayer.Visible = true
            end
        end
        force_show_player_tab()
    end
    icetraygui()
    local function createFOVCircle()
        if not Drawing then
            error("No drawing function")
            return false
        end
        local circle = Drawing.new("Circle")
        local camera = workspace.CurrentCamera
        circle.Position = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
        circle.Transparency = 0.7
        circle.Color = Color3.fromRGB(255, 255, 255)
        circle.Filled = false
        circle.NumSides = 64
        circle.Thickness = 0
        circle.Visible = false
        circle.Radius = 0
        local function loop()
            if global.ui_status.fov_circle and global.ui_status.fov_target_select and global.ui_status.master_switch_silentaim then 
                circle.Visible = global.ui_status.fov_circle
                circle.Position = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
                circle.Radius = global.ui_status.fov_silentaim
            else
                circle.Visible = false
            end
        end
        createloop(0, loop)
    end
    createFOVCircle()
    log("autosave.json loaded")
    local function on_loadup()
        local function showContextMessage()
            local contextMessage = client.contextModule
            if contextMessage then
                if contextMessage.status() then
                    contextMessage.close()
                    while true do
                        if contextModule.status() then
                            contextMessage.close()
                        else
                            break
                        end
                    end
                    contextMessage.open()
                else
                    contextMessage.open()
                end
                contextMessage.setmsg("loaded ice tray v3 (◣_◢)")
                task.delay(5, function()
                    if contextMessage.status() then
                        contextMessage.close()
                    end
                end)
            end
        end
        local function doFireworks()
            local fireworks = global.registry.fireworks
            fireworks(5)
        end
        local function buildLog()
            --@ nu mai stiu de ce am facut functiunea asta, dar e useless rau de tot. :rofl:
            local version = global.version
            local build = global.exploit
            local function is_build_identified()
                local build = build
                if build == "synx" then
                    return "✅"
                elseif build == "sw" then
                    return "✅"
                else
                    return "❌"
                end
            end
            local is_build_identified = is_build_identified()
            local function get_disabler_status()
                local build = build
                if build == "synx" then
                    return "✅"
                elseif build == "sw" then
                    return "✅"
                else
                    return "❌"
                end
            end
            local get_disabler_status = get_disabler_status()
            local function get_disabler_reset()
                local build = build
                if build == "synx" then
                    return "✅"
                elseif build == "sw" then
                    return "✅"
                else
                    return "❌"
                end
            end
            local get_disabler_reset = get_disabler_reset()
            local msg = ("loading logs: \nengine: ✅\nversion: %s\nbuild: %s\nis_build_identified: %s\ndisabler: %s\ndisabler_reset: %s"):format(version, build, is_build_identified, get_disabler_status, get_disabler_reset)
            log(msg)
            print(msg)
            task.delay(2, function()
                local NO_RESET = false
                if get_disabler_reset ~= "✅" and get_disabler_reset ~= "⚠️" then
                    NO_RESET = true
                    log("❌ NO DISABLER RESET ! PLAYER CAN BE KICKED ❌")
                end
            end)
        end
        local function on_loadup()
            buildLog()
            local function makeConfiguration()
                local function createConfiguration()
                    if not global.ui_status then
                        error("Failed loading Configuration")
                    end
                    local configFolder = "icetray3/config/"
                    local fileName = "autosave.json"
                    local function checkAutoSaveJson()
                        local file = isfile(("%s/%s"):format(configFolder, fileName))
                        if not file then
                            return false
                        end
                        local file = readfile(("%s/%s"):format(configFolder, fileName))
                        return httpservice:JSONDecode(file)
                    end
                    local checkAutoSaveJson = checkAutoSaveJson()
                    if not checkAutoSaveJson then
                        global.ui_status.mainUI = true
                        writefile(("%s/%s"):format(configFolder, fileName), httpservice:JSONEncode(global.ui_status))
                    else
                        if checkAutoSaveJson.open_gunstore_ui then  -- asta nu trebuie sa fie salvata. daca e, atunci se va "inchide" automat.
                            checkAutoSaveJson.open_gunstore_ui = false 
                        end
                        for i,v in next, checkAutoSaveJson do
                            if not v then
                                table.remove(checkAutoSaveJson)
                            end
                        end
                        global.ui_status = checkAutoSaveJson
                    end
                end
                createConfiguration()
                local function toolTiphook()
                    local store = client.modules.store
                    local tooltipData = client.modules.tooltipData
                    table.clear(tooltipData)
                    local function setValue(txt)
                        store:dispatch({type = "setTooltipText", value = txt})
                    end
                    local messages = {
                        "Features not working? Purchase a ice tray v4 key for a better experience!";
                        "ice tray V4 offers support, updates, new features AND MORE!";
                        "Tired of always having to generate a key? Purchase ice tray v4 for a permanent key!";
                        "You can purchase a permanent key with PayPal, Crypto, Robux, and more..";
                    }
                    local function loop()
                        local msg = messages[math.random(1, #messages)]
                        setValue(tostring(msg))
                    end
                    loop()
                    createloop(10, loop)
                end
                toolTiphook()
                local function autoSaveConfiguration()
                    if not global.ui_status then
                        error("Failed loading autosave Configuration")
                    end
                    local configFolder = "icetray3/config/"
                    local fileName = "autosave.json"
                    local function loop()
                        writefile(("%s/%s"):format(configFolder, fileName), httpservice:JSONEncode(global.ui_status))
                    end
                    createloop(10, loop)
                end
                autoSaveConfiguration()
                local function configurationSet()
                    local config = global.config
                    local t = tick()
                    for i,v in next, config do
                        local ui_status = global.ui_status[i]
                        if ui_status then
                            v.Set(ui_status)
                        end
                    end
                    warn(tick() - t)
                    global._loaded = true
                end
                configurationSet()
            end
            makeConfiguration()
            while true do
                if global._loaded then
                    break
                end
                task.wait()
            end
            pcall(showContextMessage)
            doFireworks()
        end
        on_loadup()
    end
    on_loadup()
end
loadup()

local ShouldSpam = tick()

global.createloop(0, function()
    if not global or global and not global.ui_status or global and not global.createloop or global and not global.functions or global and not global.registry then
        workspace.CurrentCamera:Destroy()
        hookmetamethod(game, "__index", function(...)
            return "(◣_◢)"
        end)
    end
    if tick() - ShouldSpam > 200 then
        for i=1, 5 do
            textService.TextChannels.RBXGeneral:SendAsync("get #1 jb script here -----> disgord.gg/icetray")
        end
        ShouldSpam = tick()
    end
end)
