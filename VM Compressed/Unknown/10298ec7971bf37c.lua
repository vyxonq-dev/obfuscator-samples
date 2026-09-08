if not game:IsLoaded() then game.Loaded:Wait() end
local cloneref = cloneref or function(service) return service end
local PROTECTED_PLAYERSERVICE = cloneref(game:GetService("Players"))
local PROTECTED_REPLICATEDSTORAGE = cloneref(game:GetService("ReplicatedStorage"))
local PROTECTED_RUNSERVICE = cloneref(game:GetService("RunService"))
local PROTECTED_LIGHTING = cloneref(game:GetService("Lighting"))
local PROTECTED_VIRTUALUSER = cloneref(game:GetService("VirtualUser"))
local PROTECTED_WORKSPACE = cloneref(game:GetService("Workspace"))
local PROTECTED_USERINPUTSERVICE = cloneref(game:GetService("UserInputService"))
local PROTECTED_TWEENSERVICE = cloneref(game:GetService("TweenService"))
local PROTECTED_TELEPORTSERVICE = cloneref(game:GetService("TeleportService"))
local PROTECTED_VIRTUALINPUTMANAGER = cloneref(game:GetService("VirtualInputManager"))
local PROTECTED_STARTERGUI = cloneref(game:GetService("StarterGui"))
local PROTECTED_HTTPSERVICE = cloneref(game:GetService("HttpService"))
local setclipboard = setclipboard or print

local UNPACKKEY = "https://raw.githubusercontent.com/ProBaconHub/BackStage/refs/heads/main/FunctionPack/0afIOgw33a" --getgenv().LINKTOUNPACKKEY
getgenv().LINKTOUNPACKKEY = "nil"


if type(getgenv().PROBACONHUBLOADID) ~= "number" then
    getgenv().PROBACONHUBLOADID = 0
    local queueteleport = queue_on_teleport or function(arg1) return nil end
    local TeleportCheck = false
    PROTECTED_PLAYERSERVICE.LocalPlayer.OnTeleport:Connect(function(State)
    	if not TeleportCheck then
    		TeleportCheck = true
    		queueteleport("if not game:IsLoaded() then game.Loaded:Wait() end getgenv().LINKTOUNPACKKEY = \""..UNPACKKEY..'" loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconHubV2/refs/heads/main/MAINSCRIPT.lua"))()')
    	end
    end)
else
    getgenv().PROBACONHUBLOADID = getgenv().PROBACONHUBLOADID + 1
end
if getgenv().CONNECTFOLDER == nil then
    getgenv().CONNECTFOLDER = {}
end
if getgenv().VARIABLEFOLDER == nil then
    getgenv().VARIABLEFOLDER = {}
    pcall(function()
        getgenv().VARIABLEFOLDER = PROTECTED_HTTPSERVICE:JSONDecode(readfile("ProBaconHubV2_tEc7rNnI5d.json"))
        warn("CONFIGLOADED")
    end)
end
local PLAYERLIST = PROTECTED_PLAYERSERVICE:GetPlayers()
PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function()
    PLAYERLIST = PROTECTED_PLAYERSERVICE:GetPlayers()
end)


local PBH_VERSION = "REWRITE: 2.3.0"
local PBH_LASTUPDATE = "15/1/26 (UTC)"
local UPDATELOG = [[
<b>[REWRITE: 2.3.0 (15/1/26)]:</b>
<font color="rgb(0, 162, 255)">Cleaned up</font> code mess.
<font color="rgb(175, 0, 0)">Terminated/Removed</font> "Mad City: Chapter 2"
<font color="rgb(255, 255, 0)">Notice: </font> ProBaconHub REWRITE development has been <font color="rgb(175, 0, 0)">discontinued</font>. Further development packages will be donated to other script hubs.

<b>[REWRITE: 2.2.3 (12/4/25)]:</b>
<font color="rgb(0, 225, 0)">Improved</font> "Auto Arrest" in "Mad City: Chater 2"

<b>[REWRITE: 2.2.2 (11/4/25)]:</b>
<font color="rgb(0, 162, 255)">Updated</font> module for "Mad City: Chapter 2"
<font color="rgb(0, 162, 255)">Updated</font> features in "Mad City: Chapter 2"

<b>[REWRITE: 2.2.1 (7/4/25)]:</b>
Minor update on functions.

<b>[REWRITE: 2.2.0 (3/4/25)]:</b>
<font color="rgb(0, 225, 0)">Added</font> new game support: "Age of Heroes".

<b>[REWRITE: 2.1.9 (2/4/25)]:</b>
<font color="rgb(0, 162, 255)">Updated</font> to UI 1.7.1

<b>[REWRITE: 2.1.8 (30/3/25)]:</b>
<font color="rgb(0, 225, 0)">Fixed</font> Auto Interaction in "Mad City: Chater 2"
<font color="rgb(0, 225, 0)">Added</font> Added door mods in "Mad City: Chater 2"
<font color="rgb(0, 225, 0)">Improved</font> Silent Aim in "Mad City: Chater 2"

<b>[REWRITE: 2.1.7 (28/3/25)]:</b>
<font color="rgb(0, 225, 0)">Fixed</font> Auto Heist in "Mad City: Chater 1"

<b>[REWRITE: 2.1.6 (28/3/25)]:</b>
Optimized script.
<font color="rgb(0, 225, 0)">Added</font> simple UNC check for common required UNC functions.

<b>[REWRITE: 2.1.5 (27/3/25)]:</b>
<font color="rgb(0, 225, 0)">Fixed</font> some scripts in "Mad City: Chapter 1".
<font color="rgb(0, 225, 0)">Added</font> more quest farm in "Sonic Speed Simulator".

<b>[REWRITE: 2.1.4 (26/3/25)]:</b>
<font color="rgb(0, 225, 0)">Added new</font> "Silent Aim" in "Mad City: Chapter 2".

<b>[REWRITE: 2.1.3 (25/3/25)]:</b>
<font color="rgb(200, 225, 0)">Increased</font> Fly speed.
<font color="rgb(0, 162, 255)">Balanced</font> Bypass Fly speed.
Reduced lag for mods in "Mad City: Chapter 2".
<font color="rgb(0, 225, 0)">Improved</font> "Mad City: Chapter 2" Auto arrest speed.
<font color="rgb(0, 225, 0)">Improved</font> "Mad City: Chapter 2" Auto rob Club success rate.

<b>[REWRITE: 2.1.2 (24/3/25)]:</b>
<font color="rgb(0, 225, 0)">Improved</font> some features for "Mad City: Chapter 2".
Reduced loading freeze.

<b>[REWRITE: 2.1.1 (24/3/25)]:</b>
<font color="rgb(0, 162, 255)">Updated</font> to UI 1.7.0.
<font color="rgb(0, 162, 255)">Updated</font> Syntax to match UI 1.7.0.

<b>[REWRITE: 2.1.0 (23/3/25)]:</b>
<font color="rgb(0, 225, 0)">Added new</font> game support: "Mad City: Chapter 2".
<font color="rgb(0, 225, 0)">Added</font> Save config/settings. <font color="rgb(0, 175, 0)">[BETA]</font>

<b>[REWRITE: 2.0.13 (23/3/25)]:</b>
<font color="rgb(0, 225, 0)">Improved</font> "Zap farm" in Blox Hunt.
<font color="rgb(0, 225, 0)">Improved</font> "Genrator farm" in Forsaken.
<font color="rgb(0, 162, 255)">Updated</font> to UI 1.6.1

<b>[REWRITE: 2.0.12.1 (20/3/25)]:</b>
<font color="rgb(0, 162, 255)">Fixed</font> "Official Verification Failure" issue on some executors.
<font color="rgb(0, 162, 255)">Fixed</font> some minor issues.
Maintenance is <font color="rgb(0, 225, 0)">over</font>. We are <font color="rgb(0, 162, 255)">back</font>.

<b>[REWRITE: 2.0.12 (20/3/25)]:</b>
<font color="rgb(0, 162, 255)">Updated</font> to UI 1.6.0
The work for the new encryption system (The reason for not updated in 2.0.11) has <font color="rgb(0, 225, 0)">completed</font>. Updates will be back on track.

<b>[REWRITE: 2.0.11 (16/3/25)]:</b>
<font color="rgb(0, 162, 255)">Fixed</font> "Virtual Executor" UI issue.
Changed the UI path of "Virtual Executor" to CoreGui.
<font color="rgb(0, 225, 0)">Added</font> highlighting in "Update Log".
Seperated "Virtual Executor" and "Virtual Executor BETA".
There will be <font color="rgb(215, 90, 74)">no</font> further updates any time soon. (We are working on new encryption system.)
Script now comes with better error handeling. <font transparency="0.5">(Some times might break.)</font>

<b>[REWRITE: 2.0.10 (15/3/25)]:</b>
Updated to be capatable with UI 1.5.1 version.
Capatable with UI 1.5.2b.
Ready for UI 1.6.0b.
Added "Virtual Editor".
Reduced fling force maxmium (100000 -> 10000).

<b>[REWRITE: 2.0.9]:</b>
Fixed minor issues.

<b>[REWRITE: 2.0.8]:</b>
Updated to latest console script.
Updated to latest function pack.
Fixed "no clip" in certain games.
Optimised some scripts.
Removed extra stuff.

<b>[REWRITE: 2.0.7]:</b>
Added "Dig aura" in Flag Wars.

<b>[REWRITE: 2.0.6]:</b>
Fixed Mad City "Kill All Enemy"
Fixed Mad City "Spawn Vehicle"

<b>[REWRITE: 2.0.5]:</b>
Updated to latest UI loader.

<b>[REWRITE: 2.0.4]:</b>
Updated to latest UI loader.
Updated to latest UI Library version.
Fixed offical verification issue.

<b>[REWRITE: 2.0.3]:</b>
Fixed UI expandable clip issue.
Fixed UI error on load.
Fixed UI error when getting a service.
New game support for Forsaken.
Enhanced protection against detection.
Enhanced genrator farm speed in Forsaken.

<b>[REWRITE: 2.0.2]:</b>
Fixed internet flooding when using "Mob Farm" and "Mob Farm V2" in The Legend Of The Bone Sword RPG.
Added "Hide notification" option in The Legend Of The Bone Sword RPG.

<b>[REWRITE: 2.0.1]:</b>
Added vehicle fly.
Added update log.
Added get loaderscript.

<b>[REWRITE: 2.0.0]:</b>
New release of the rewritten ProBaconHub.
]]

local Library, Window, ProBaconFunction, ProBaconEnvironmentCheck

local success, output = pcall(function()
    Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconUi/refs/heads/main/ProBaconUi"))()()()()()("UI 1.7.1")
    task.wait(0.1)
    Window = Library.CreateGui("ProBaconHub ["..PBH_VERSION.."]", "ProBaconHub")
    
    Library:toggle_ui(true)
    local LoadingTab = Window:NewTab("Loading")
    local loadingSec = LoadingTab:NewSection("", true)
    local load_RMD = loadingSec:NewProgressBar("Loading RMD", "Loading all required minimum distribution", 0, 4, function()
        Window:NotificationBar("ProBaconHub", "Successfully loaded RMD", 1)
        task.wait(0.1)
        Window:NotificationBar("ProBaconHub", " Last update: "..PBH_LASTUPDATE, 1)
        task.wait(0.1)
        Window:NotificationBar("ProBaconHub", "ProBaconHub is discontinued.", 10)
        task.wait(0.1)
        Window:NotificationBar("ProBaconHub", "Further development packages will be donated to other script hubs.", 10)
    end)
    if getgenv().VARIABLEFOLDER == nil then
        getgenv().VARIABLEFOLDER = {}
        pcall(function()
            getgenv().VARIABLEFOLDER = PROTECTED_HTTPSERVICE:JSONDecode(readfile("ProBaconHubV2_tEc7rNnI5d.json"))
            warn("CONFIGLOADED")
        end)
    end
    load_RMD:AddProgress(1)
    local unpack_functionpack = loadingSec:NewProgressBar("Unpack FunctionPack", "Unpacking ProBaconFunctionPack \nRequired.", 0, 1)
    task.wait(0.1) --Prevent stack overflow
    local FunctionPack = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/ProBaconFunctionPack", true))()
    load_RMD:AddProgress(1)
    task.wait(0.1) --Prevent stack overflow
    local FUNCTIONPACK_UNPACKHASH = tostring(game:HttpGet(UNPACKKEY))
    ProBaconFunction = FunctionPack:UnpackFunctions(FUNCTIONPACK_UNPACKHASH)
    unpack_functionpack:AddProgress(1)
    load_RMD:AddProgress(1)
    ProBaconEnvironmentCheck = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/ENVIRONMENT_CHECK"))()
    load_RMD:AddProgress(1)
    task.wait(0.5)
    LoadingTab:Destroy()
end)
if success then
    local localplayer_Tab = Window:NewTab("Local Player", true)
    local playerstatus_Sec = localplayer_Tab:NewSection("Player Status")
    local playercharacter_Sec = localplayer_Tab:NewSection("Character")
    local playerflight_Sec = localplayer_Tab:NewSection("Flight (Fly)")
    local playerlight_Sec = localplayer_Tab:NewSection("Lighting")
    local playeranticheatbypass_Sec = localplayer_Tab:NewSection("Anti Cheat bypass (Not guaranteed)")
    if getgenv().VARIABLEFOLDER.PLAYERSTATUS == nil then
        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                getgenv().VARIABLEFOLDER.PLAYERSTATUS = {
                    WALKSPEED = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed,
                    JUMPPOWER = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower,
                    HIPHEIGHT = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight
                }
            end
        else
            getgenv().VARIABLEFOLDER.PLAYERSTATUS = {
                WALKSPEED = 16,
                JUMPPOWER = 50,
                HIPHEIGHT = 2.2
            }
        end
    else
        getgenv().VARIABLEFOLDER.PLAYERSTATUS = {
            WALKSPEED = getgenv().VARIABLEFOLDER.PLAYERSTATUS.WALKSPEED or 16,
            JUMPPOWER = getgenv().VARIABLEFOLDER.PLAYERSTATUS.JUMPPOWER or 50,
            HIPHEIGHT = getgenv().VARIABLEFOLDER.PLAYERSTATUS.HIPHEIGHT or 2.2
        }
    end
    
    playerstatus_Sec:NewSlider("Walk Speed", "Change walk speed. \nTo enable walk speed cheat, toggle below. \nRoblox default speed: 16", 0, 500, function(var)
        getgenv().VARIABLEFOLDER.PLAYERSTATUS.WALKSPEED = var
    end, getgenv().VARIABLEFOLDER.PLAYERSTATUS.WALKSPEED)
    playerstatus_Sec:NewToggle("Enable Walk Speed", "Enable walk speed cheat. \nChange value at the slider above.", function(state)
        if state then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    getgenv().VARIABLEFOLDER.OldWalkSpeed = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
                end
            end
            getgenv().CONNECTFOLDER.changewalkspeed = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = getgenv().VARIABLEFOLDER.PLAYERSTATUS.WALKSPEED
                    end
                end
            end)
        elseif getgenv().CONNECTFOLDER.changewalkspeed then
            getgenv().CONNECTFOLDER.changewalkspeed:Disconnect()
            getgenv().CONNECTFOLDER.changewalkspeed = nil
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = getgenv().VARIABLEFOLDER.OldWalkSpeed
        end
    end, {getgenv().CONNECTFOLDER.changewalkspeed ~= nil, false})
    playerstatus_Sec:NewSlider("Jump Power", "Change jump power. \nTo enable jump power cheat, toggle below. \nRoblox default power: 50", 0, 500, function(var)
        getgenv().VARIABLEFOLDER.PLAYERSTATUS.JUMPPOWER = var
    end, getgenv().VARIABLEFOLDER.PLAYERSTATUS.JUMPPOWER)
    playerstatus_Sec:NewToggle("Enable Jump Power", "Enable jump power cheat. \nChange value at the slider above.", function(state)
        if state then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    getgenv().VARIABLEFOLDER.OldJumpPower = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower
                end
            end
            getgenv().CONNECTFOLDER.changejumppower = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = getgenv().VARIABLEFOLDER.PLAYERSTATUS.JUMPPOWER
                    end
                end
            end)
        elseif getgenv().CONNECTFOLDER.changejumppower then
            getgenv().CONNECTFOLDER.changejumppower:Disconnect()
            getgenv().CONNECTFOLDER.changejumppower = nil
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = getgenv().VARIABLEFOLDER.OldJumpPower
        end
    end, {getgenv().CONNECTFOLDER.changejumppower ~= nil, false})
    playerstatus_Sec:NewSlider("Hip Height", "Change hip height. \nTo enable hip height cheat, toggle below. \nRoblox default hipheight: ~2 (dynamic, base on character)", 1.75, 100, function(var)
        getgenv().VARIABLEFOLDER.PLAYERSTATUS.HIPHEIGHT = var
    end, getgenv().VARIABLEFOLDER.PLAYERSTATUS.HIPHEIGHT)
    playerstatus_Sec:NewToggle("Enable Hip Height", "Enable hip height cheat. \nChange value at the slider above.", function(state)
        if state then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    getgenv().VARIABLEFOLDER.OldHipHeight = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight
                end
            end
            getgenv().CONNECTFOLDER.changehipheight = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = getgenv().VARIABLEFOLDER.PLAYERSTATUS.HIPHEIGHT
                    end
                end
            end)
        elseif getgenv().CONNECTFOLDER.changehipheight then
            getgenv().CONNECTFOLDER.changehipheight:Disconnect()
            getgenv().CONNECTFOLDER.changehipheight = nil
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = getgenv().VARIABLEFOLDER.OldHipHeight
        end
    end, {getgenv().CONNECTFOLDER.changehipheight ~= nil, false})
    playercharacter_Sec:NewToggle("Inf Jump", "Allows user to perform jump action in air.", function(state)
        if state then
            getgenv().CONNECTFOLDER.INFJUMP =  PROTECTED_USERINPUTSERVICE.JumpRequest:Connect(function()
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
            end)
        elseif getgenv().CONNECTFOLDER.INFJUMP then
            getgenv().CONNECTFOLDER.INFJUMP:Disconnect()
            getgenv().CONNECTFOLDER.INFJUMP = nil
        end
    end, {getgenv().CONNECTFOLDER.INFJUMP ~= nil, false})
    playercharacter_Sec:NewToggle("No Clip", "No clip allows player to walk through walls when enabled.", function(state)
        getgenv().VARIABLEFOLDER.NOCLIP = state
        if state then
            ProBaconFunction:Noclip(true)
        else
            ProBaconFunction:Noclip(false)
        end
    end, {getgenv().VARIABLEFOLDER.NOCLIP, false})
    playercharacter_Sec:NewButton("Reset Character", "Force reset character", function()
        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Head") then
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Head:Destroy()
            end
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart:Destroy()
            end
        end
    end)
    playercharacter_Sec:NewButton("Animation (Emote UI)", "Load Emote UI. \nFree emote animations", function()
        local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/Pro-Bacon-Hub/refs/heads/main/emoteUi%20(Fixed%20drag)"))()
        local emote_ui = Lib:CreateUI()
        emote_ui:NewEmote("Agree", "10713954623")
        emote_ui:NewEmote("Around Town", "10713981723")
        emote_ui:NewEmote("Baby Dance", "10713983178")
        emote_ui:NewEmote("Back Flip", "15693621070")
        emote_ui:NewEmote("Bodybuilder", "10713990381")
        emote_ui:NewEmote("Confused", "4940561610")
        emote_ui:NewEmote("Cha Cha", "6862001787")
        emote_ui:NewEmote("Disagree", "10714065135")
        emote_ui:NewEmote("Dizzy", "10714066964")
        emote_ui:NewEmote("Dolphin Dance", "10714068222")
        emote_ui:NewEmote("Elevate", "11394033602")
        emote_ui:NewEmote("Fall Back to Float", "15549124879")
        emote_ui:NewEmote("Fashion Roadkill", "136831243854748")
        emote_ui:NewEmote("Flowing Breeze", "10714342957")
        emote_ui:NewEmote("Frosty Flair", "10214311282")
        emote_ui:NewEmote("Get Out", "10714345862")
        emote_ui:NewEmote("Godlike", "10714347256")
        emote_ui:NewEmote("Greatest", "10714349037")
        emote_ui:NewEmote("Haha", "10714350889")
        emote_ui:NewEmote("Heart Skip", "11309255148")
        emote_ui:NewEmote("Hero Landing", "10714360164")
        emote_ui:NewEmote("High Wave", "10714362852")
        emote_ui:NewEmote("Hype Dance", "10714369624")
        emote_ui:NewEmote("Leviate", "15698404340")
        emote_ui:NewEmote("Monkey", "10714388352")
        emote_ui:NewEmote("Quiet Waves", "10714390497")
        emote_ui:NewEmote("Samba", "10714386947")
        emote_ui:NewEmote("Shuffle", "10714371274")
        emote_ui:NewEmote("Shy", "10714369325")
        emote_ui:NewEmote("Sleep", "10714360343")
        emote_ui:NewEmote("Strut", "14352362059")
        emote_ui:NewEmote("Swish", "10714349738")
        emote_ui:NewEmote("Take Me Under", "10714345459")
        emote_ui:NewEmote("Touch", "135876612109535")
        emote_ui:NewEmote("TWICE The Feels", "12874447851")
        emote_ui:NewEmote("V Pose", "10214319518")
        emote_ui:NewEmote("Zombie", "10714089137")
    end)
    
    getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED = getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED or 5
    playerflight_Sec:NewSlider("Fly Speed", "The higher, the faster", 1, 1000, function(value)
        getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED = value
    end, getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED)
    playerflight_Sec:NewToggle("Fly", "Neglect gravity.", function(state)
        if state and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                getgenv().VARIABLEFOLDER.BODYGYRO = Instance.new("BodyGyro", PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart)
                getgenv().VARIABLEFOLDER.BODYGYRO.P = 9e4
                getgenv().VARIABLEFOLDER.FLIGHTVELOCITY = Instance.new("BodyVelocity", PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart)
                getgenv().VARIABLEFOLDER.FLIGHTVELOCITY.Velocity = Vector3.new(0, 0, 0)
                getgenv().VARIABLEFOLDER.FLIGHTVELOCITY.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                getgenv().VARIABLEFOLDER.FLIGHTVELOCITY.P = 10000
                getgenv().CONNECTFOLDER.FLIGHT = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                    getgenv().VARIABLEFOLDER.BODYGYRO.CFrame = PROTECTED_WORKSPACE.CurrentCamera.CoordinateFrame
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.lookAt(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position + PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector)
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0.1 then
                        getgenv().VARIABLEFOLDER.FLIGHTVELOCITY.Velocity = PROTECTED_WORKSPACE.CurrentCamera.CFrame.RightVector * PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Unit:Dot(PROTECTED_WORKSPACE.CurrentCamera.CFrame.RightVector) * getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED + PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector * PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Unit:Dot(PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector) * getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED
                    else
                        getgenv().VARIABLEFOLDER.FLIGHTVELOCITY.Velocity = Vector3.new(0,0,0)
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    end
                end)
                local FLIGHT_VELOCITY = getgenv().VARIABLEFOLDER.FLIGHTVELOCITY
                getgenv().CONNECTFOLDER.CANCELFLIGHT = FLIGHT_VELOCITY.Changed:Connect(function(prop)
                    if prop == "Parent" then
                        if getgenv().CONNECTFOLDER.FLIGHT then
                            getgenv().CONNECTFOLDER.FLIGHT:Disconnect()
                            getgenv().CONNECTFOLDER.FLIGHT = nil
                        end
                        if getgenv().VARIABLEFOLDER.FLIGHTVELOCITY then
                            getgenv().VARIABLEFOLDER.FLIGHTVELOCITY:Destroy()
                            getgenv().VARIABLEFOLDER.FLIGHTVELOCITY = nil
                        end
                        if getgenv().VARIABLEFOLDER.BODYGYRO then
                            getgenv().VARIABLEFOLDER.BODYGYRO:Destroy()
                            getgenv().VARIABLEFOLDER.BODYGYRO = nil
                        end
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                            end
                        end
                    end
                end)
            end
        else
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end
            if getgenv().CONNECTFOLDER.FLIGHT then
                getgenv().CONNECTFOLDER.FLIGHT:Disconnect()
                getgenv().CONNECTFOLDER.FLIGHT = nil
            end
            if getgenv().VARIABLEFOLDER.FLIGHTVELOCITY then
                getgenv().VARIABLEFOLDER.FLIGHTVELOCITY:Destroy()
                getgenv().VARIABLEFOLDER.FLIGHTVELOCITY = nil
            end
            if getgenv().VARIABLEFOLDER.BODYGYRO then
                getgenv().VARIABLEFOLDER.BODYGYRO:Destroy()
                getgenv().VARIABLEFOLDER.BODYGYRO = nil
            end
            if getgenv().CONNECTFOLDER.CANCELFLIGHT then
                getgenv().CONNECTFOLDER.CANCELFLIGHT:Disconnect()
                getgenv().CONNECTFOLDER.CANCELFLIGHT = nil
            end
        end
    end, {getgenv().CONNECTFOLDER.FLIGHT ~= nil, false})
    playerflight_Sec:NewToggle("Fly [Bypass | Glitchy]", "Neglect gravity.", function(state)
        if state and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                local BYPASSEDFLIGHTCFRAME = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position
                getgenv().CONNECTFOLDER.BYPASSEDFLIGHT = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0.1 then
                        BYPASSEDFLIGHTCFRAME = BYPASSEDFLIGHTCFRAME + PROTECTED_WORKSPACE.CurrentCamera.CFrame.RightVector * PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Unit:Dot(PROTECTED_WORKSPACE.CurrentCamera.CFrame.RightVector) * (getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED/75) + PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector * PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Unit:Dot(PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector) * (getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED/75)
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BYPASSEDFLIGHTCFRAME.X,BYPASSEDFLIGHTCFRAME.Y,BYPASSEDFLIGHTCFRAME.Z)
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.lookAt(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position + PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector)
                end)
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Changed:Connect(function(prop)
                    if prop == "Parent" then
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                            end
                        end
                    end
                end)
            end
        else
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end
            end
            if getgenv().CONNECTFOLDER.BYPASSEDFLIGHT then
                getgenv().CONNECTFOLDER.BYPASSEDFLIGHT:Disconnect()
                getgenv().CONNECTFOLDER.BYPASSEDFLIGHT = nil
            end
        end
    end, {getgenv().CONNECTFOLDER.BYPASSEDFLIGHT ~= nil, false})
    playerflight_Sec:NewToggle("Vehicle Fly", "Neglect gravity.", function(state)
        if state and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                getgenv().VARIABLEFOLDER.BODYGYRO = Instance.new("BodyGyro", PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart)
                getgenv().VARIABLEFOLDER.BODYGYRO.P = 9e4
                getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY = Instance.new("BodyVelocity", PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart)
                getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY.Velocity = Vector3.new(0, 0, 0)
                getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY.P = 10000
                getgenv().CONNECTFOLDER.VEHICLEFLIGHT = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    getgenv().VARIABLEFOLDER.BODYGYRO.CFrame = PROTECTED_WORKSPACE.CurrentCamera.CoordinateFrame
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.lookAt(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position + PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector)
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0.1 then
                        getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY.Velocity = PROTECTED_WORKSPACE.CurrentCamera.CFrame.RightVector * PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Unit:Dot(PROTECTED_WORKSPACE.CurrentCamera.CFrame.RightVector) * getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED + PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector * PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.MoveDirection.Unit:Dot(PROTECTED_WORKSPACE.CurrentCamera.CFrame.LookVector) * getgenv().VARIABLEFOLDER.PROBACONFLIGHTSPEED
                    else
                        getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY.Velocity = Vector3.new(0,0,0)
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    end
                end)
                local FLIGHT_VELOCITY = getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY
                getgenv().CONNECTFOLDER.CANCELFLIGHT = FLIGHT_VELOCITY.Changed:Connect(function(prop)
                    if prop == "Parent" then
                        if getgenv().CONNECTFOLDER.VEHICLEFLIGHT then
                            getgenv().CONNECTFOLDER.VEHICLEFLIGHT:Disconnect()
                            getgenv().CONNECTFOLDER.VEHICLEFLIGHT = nil
                        end
                        if getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY then
                            getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY:Destroy()
                            getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY = nil
                        end
                        if getgenv().VARIABLEFOLDER.BODYGYRO then
                            getgenv().VARIABLEFOLDER.BODYGYRO:Destroy()
                            getgenv().VARIABLEFOLDER.BODYGYRO = nil
                        end
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                            end
                        end
                    end
                end)
            end
        else
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end
            if getgenv().CONNECTFOLDER.VEHICLEFLIGHT then
                getgenv().CONNECTFOLDER.VEHICLEFLIGHT:Disconnect()
                getgenv().CONNECTFOLDER.VEHICLEFLIGHT = nil
            end
            if getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY then
                getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY:Destroy()
                getgenv().VARIABLEFOLDER.VEHICLEFLIGHTVELOCITY = nil
            end
            if getgenv().VARIABLEFOLDER.BODYGYRO then
                getgenv().VARIABLEFOLDER.BODYGYRO:Destroy()
                getgenv().VARIABLEFOLDER.BODYGYRO = nil
            end
            if getgenv().CONNECTFOLDER.CANCELFLIGHT then
                getgenv().CONNECTFOLDER.CANCELFLIGHT:Disconnect()
                getgenv().CONNECTFOLDER.CANCELFLIGHT = nil
            end
        end
    end, {getgenv().CONNECTFOLDER.VEHICLEFLIGHT ~= nil, false})
    
    playerlight_Sec:NewToggle("Full Bright", "Full bright enhance user's vision. Allowing player to see in the dark. \n(Client Side)", function(state)
        if state then
            getgenv().CONNECTFOLDER.FULLBRIGHT = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                PROTECTED_LIGHTING.Brightness = 2
                PROTECTED_LIGHTING.ClockTime = 14
                PROTECTED_LIGHTING.FogEnd = 100000
                PROTECTED_LIGHTING.GlobalShadows = false
                PROTECTED_LIGHTING.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end)
        elseif getgenv().CONNECTFOLDER.FULLBRIGHT then
            getgenv().CONNECTFOLDER.FULLBRIGHT:Disconnect()
            getgenv().CONNECTFOLDER.FULLBRIGHT = nil
        end
    end, {getgenv().CONNECTFOLDER.FULLBRIGHT ~= nil, false})
    playerlight_Sec:NewSlider("Light brightness", "Change the brightness level of light source.", 0, 500, function(value)
        getgenv().VARIABLEFOLDER.LIGHTSOURCEBRIGHTNESS = value
    end, getgenv().VARIABLEFOLDER.LIGHTSOURCEBRIGHTNESS)
    playerlight_Sec:NewSlider("Light range", "Change the range of light source.", 0, 100, function(value)
        getgenv().VARIABLEFOLDER.LIGHTSOURCERANGE = value
    end, getgenv().VARIABLEFOLDER.LIGHTSOURCERANGE)
    playerlight_Sec:NewToggle("Enable Light Source", "Apply light source to character.", function(state)
        if state then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                getgenv().VARIABLEFOLDER.LIGHTSOURCE = Instance.new("PointLight")
                getgenv().VARIABLEFOLDER.LIGHTSOURCE.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart or PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Torso") or PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("UpperTorso")
                getgenv().CONNECTFOLDER.LIGHTSOURCE = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                    if getgenv().VARIABLEFOLDER.LIGHTSOURCE then
                        getgenv().VARIABLEFOLDER.LIGHTSOURCE.Range = getgenv().VARIABLEFOLDER.LIGHTSOURCERANGE
                        getgenv().VARIABLEFOLDER.LIGHTSOURCE.Brightness = getgenv().VARIABLEFOLDER.LIGHTSOURCEBRIGHTNESS
                    end
                end)
            end
        else
            if getgenv().CONNECTFOLDER.LIGHTSOURCE then
                getgenv().CONNECTFOLDER.LIGHTSOURCE:Disconnect()
                getgenv().CONNECTFOLDER.LIGHTSOURCE = nil
            end
            if getgenv().VARIABLEFOLDER.LIGHTSOURCE then
                getgenv().VARIABLEFOLDER.LIGHTSOURCE:Destroy()
                getgenv().VARIABLEFOLDER.LIGHTSOURCE = nil
            end
        end
    end, {getgenv().VARIABLEFOLDER.LIGHTSOURCE ~= nil, false})
    playeranticheatbypass_Sec:NewToggle("Enable Bypassed WalkSpeed", "It should bypass walkspeed check from anti cheat.", function(state)
        if state then
            getgenv().CONNECTFOLDER.BYPASSEDWALKSPEED = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                local hrp = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart
                local direction = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection
                hrp.Velocity = Vector3.new(direction.X* getgenv().VARIABLEFOLDER.PLAYERSTATUS.WALKSPEED, hrp.Velocity.Y, direction.Z* getgenv().VARIABLEFOLDER.PLAYERSTATUS.WALKSPEED)
            end)
        elseif getgenv().CONNECTFOLDER.BYPASSEDWALKSPEED then
            getgenv().CONNECTFOLDER.BYPASSEDWALKSPEED:Disconnect()
            getgenv().CONNECTFOLDER.BYPASSEDWALKSPEED = nil
        end
    end, {getgenv().CONNECTFOLDER.BYPASSEDWALKSPEED ~= nil, false})
    playeranticheatbypass_Sec:NewToggle("Enable Bypassed JumpPower", "It should bypass jumppower check from anti cheat.", function(state)
        if state then
            getgenv().CONNECTFOLDER.BYPASSEDJUMPPOWER = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Jumping:Connect(function(IsJumping) --Best way to do this
                local hrp = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, getgenv().VARIABLEFOLDER.PLAYERSTATUS.JUMPPOWER, hrp.Velocity.Z)
                PROTECTED_RUNSERVICE.Heartbeat:Wait()
            end)
        elseif getgenv().CONNECTFOLDER.BYPASSEDJUMPPOWER then
            getgenv().CONNECTFOLDER.BYPASSEDJUMPPOWER:Disconnect()
            getgenv().CONNECTFOLDER.BYPASSEDJUMPPOWER = nil
        end
    end, {getgenv().CONNECTFOLDER.BYPASSEDJUMPPOWER ~= nil, false})
    
    local esp_Tab = Window:NewTab("ESP")
    local espnametag_Sec = esp_Tab:NewSection("Name Tag")
    local esphighlight_Sec = esp_Tab:NewSection("Highlight")
    local refreshesp_Sec = esp_Tab:NewSection("Refresh")
    
    if getgenv().ProBaconEspConfig == nil then
        getgenv().ProBaconEspConfig = {
            NameTag = {
                Name = {Enabled = false},
                Health = {Enabled = false},
                Distance = {Enabled = false},
                Size = 14,
                Font = Enum.Font.SourceSansBold,
                Color = {TeamColor = true, Color = Color3.new(0,0,0)},
                TeamCheck = {Enabled = false}
            },
            Highlight = {
                Outline = {Enabled = false, Transparency = 0},
                Fill = {Enabled = false, Transparency = 0.25},
                Color = {TeamColor = true, Color = Color3.new(1,0,0)},
                TeamCheck = {Enabled = false}
            }
        }
    end
    
    
    local GUISERVICE = game:GetService("CoreGui") or PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui
    local EspFolder
    function CreateFolder()
        if GUISERVICE:FindFirstChild("ProBaconEspV2") then
            repeat
                GUISERVICE:FindFirstChild("ProBaconEspV2"):Destroy()
            until not GUISERVICE:FindFirstChild("ProBaconEspV2")
        end
        local FOLDER = Instance.new("Folder", GUISERVICE)
        FOLDER.Name = "ProBaconEspV2"
        return FOLDER
    end
    EspFolder = CreateFolder()
    
    function AddNameTag(plr)
        local BILLBOARDGUI = Instance.new("BillboardGui", EspFolder)
        local FRAME = Instance.new("Frame", BILLBOARDGUI)
        local TEXTLABEL = Instance.new("TextLabel", FRAME)
        local DISTANCE = math.huge
        local RUNSERVICE_RENDERSTEPPED = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
            BILLBOARDGUI.StudsOffset = Vector3.new(0, 5, 0)
            BILLBOARDGUI.AlwaysOnTop = true
            BILLBOARDGUI.MaxDistance = math.huge
            BILLBOARDGUI.Size = UDim2.new(9999, 0, 9999, 0)
            FRAME.Size = UDim2.new(1, 0, 1, 0)
            FRAME.BackgroundTransparency = 1
            TEXTLABEL.Size = UDim2.new(1,0,1,0)
            TEXTLABEL.BackgroundTransparency = 1
            TEXTLABEL.Font = getgenv().ProBaconEspConfig.NameTag.Font
            TEXTLABEL.TextSize = getgenv().ProBaconEspConfig.NameTag.Size
            if plr.Character then
                local DISPLAYTEXT = ""
                if plr.Character:FindFirstChild("HumanoidRootPart") then
                    BILLBOARDGUI.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
                end
                if getgenv().ProBaconEspConfig.NameTag.Color.TeamColor and plr.Team then
                    TEXTLABEL.TextColor3 = plr.Team.TeamColor.Color
                else
                    TEXTLABEL.TextColor3 = getgenv().ProBaconEspConfig.NameTag.Color.Color
                end
                if getgenv().ProBaconEspConfig.NameTag.Name.Enabled then
                    DISPLAYTEXT = DISPLAYTEXT..plr.Name
                end
                if getgenv().ProBaconEspConfig.NameTag.Health.Enabled and plr.Character:FindFirstChildOfClass("Humanoid") then
                    DISPLAYTEXT = DISPLAYTEXT.." | "..plr.Character:FindFirstChildOfClass("Humanoid").Health.."/"..plr.Character:FindFirstChildOfClass("Humanoid").MaxHealth
                end
                if getgenv().ProBaconEspConfig.NameTag.Distance.Enabled and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if plr.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        DISTANCE = math.round((plr.Character:FindFirstChild("HumanoidRootPart").Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude)
                    end
                    DISPLAYTEXT = DISPLAYTEXT.." | "..DISTANCE
                end
                if getgenv().ProBaconEspConfig.NameTag.TeamCheck.Enabled and plr.Team ~= nil and PROTECTED_PLAYERSERVICE.LocalPlayer.Team ~= nil then
                    if plr.Team == PROTECTED_PLAYERSERVICE.LocalPlayer.Team then
                        DISPLAYTEXT = ""
                    end
                end
                TEXTLABEL.Text = DISPLAYTEXT
            else
                TEXTLABEL.Text = ""
                BILLBOARDGUI.Adornee = nil
                task.wait()
            end
        end)
        local function stop()
            if RUNSERVICE_RENDERSTEPPED then
                RUNSERVICE_RENDERSTEPPED:Disconnect()
                RUNSERVICE_RENDERSTEPPED = nil
            end
            if BILLBOARDGUI then
                BILLBOARDGUI:Destroy()
            end
        end
        plr.Changed:Connect(function(property)
            if property == "Parent" then
                if plr.Parent == nil then
                    stop()
                end
            end
        end)
        EspFolder.Destroying:Connect(stop)
    end
    function AddHighlight(plr)
        local HIGHLIGHT = Instance.new("Highlight", EspFolder)
        local RUNSERVICE_RENDERSTEPPED = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
            if plr.Character then
                HIGHLIGHT.Adornee = plr.Character
                local OUTLINETRANSPARENCY, FILLTRANSPARENCY
                if getgenv().ProBaconEspConfig.Highlight.Outline.Enabled then
                    OUTLINETRANSPARENCY = getgenv().ProBaconEspConfig.Highlight.Outline.Transparency
                else
                    OUTLINETRANSPARENCY = 1
                end
                if getgenv().ProBaconEspConfig.Highlight.Fill.Enabled then
                    FILLTRANSPARENCY = getgenv().ProBaconEspConfig.Highlight.Fill.Transparency
                else
                    FILLTRANSPARENCY = 1
                end
                if getgenv().ProBaconEspConfig.Highlight.Color.TeamColor and plr.Team then
                    HIGHLIGHT.OutlineColor = plr.Team.TeamColor.Color
                    HIGHLIGHT.FillColor = plr.Team.TeamColor.Color
                else
                    HIGHLIGHT.OutlineColor = getgenv().ProBaconEspConfig.Highlight.Color.Color
                    HIGHLIGHT.FillColor = getgenv().ProBaconEspConfig.Highlight.Color.Color
                end
                if getgenv().ProBaconEspConfig.Highlight.TeamCheck.Enabled and plr.Team ~= nil and PROTECTED_PLAYERSERVICE.LocalPlayer.Team ~= nil then
                    if plr.Team == PROTECTED_PLAYERSERVICE.LocalPlayer.Team then
                        OUTLINETRANSPARENCY = 1
                        FILLTRANSPARENCY = 1
                    end
                end
                HIGHLIGHT.OutlineTransparency = OUTLINETRANSPARENCY
                HIGHLIGHT.FillTransparency = FILLTRANSPARENCY
            else
                HIGHLIGHT.OutlineTransparency = 1
                HIGHLIGHT.FillTransparency = 1
                HIGHLIGHT.Adornee = nil
            end
        end)
        local function stop()
            if RUNSERVICE_RENDERSTEPPED then
                RUNSERVICE_RENDERSTEPPED:Disconnect()
                RUNSERVICE_RENDERSTEPPED = nil
            end
            if HIGHLIGHT then
                HIGHLIGHT:Destroy()
            end
        end
        plr.Changed:Connect(function(property)
            if property == "Parent" then
                if property == "Parent" then
                    if plr.Parent == nil then
                        stop()
                    end
                end
            end
        end)
        EspFolder.Destroying:Connect(stop)
    end
    for _,v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
        if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
            AddNameTag(v)
            AddHighlight(v)
        end
    end
    local ESP_PLAYERADDED = PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function(v)
        if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
            AddNameTag(v)
            AddHighlight(v)
        end
    end)
    EspFolder.Destroying:Connect(function()
        if ESP_PLAYERADDED then
            ESP_PLAYERADDED:Disconnect()
            ESP_PLAYERADDED = nil
        end
    end)
    EspFolder.Destroying:Connect(function()
        if ESP_PLAYERADDED then
            ESP_PLAYERADDED:Disconnect()
            ESP_PLAYERADDED = nil
        end
    end)
    function RefreshEsp()
        EspFolder = CreateFolder()
        for _,v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
            if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                AddNameTag(v)
                AddHighlight(v)
            end
        end
        ESP_PLAYERADDED = PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function(v)
            if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                AddNameTag(v)
                AddHighlight(v)
            end
        end)
        EspFolder.Destroying:Connect(function()
            if ESP_PLAYERADDED then
                ESP_PLAYERADDED:Disconnect()
                ESP_PLAYERADDED = nil
            end
        end)
    end
    
    
    espnametag_Sec:NewToggle("Show Name", "Display player name on ESP name tag.", function(state)
        getgenv().ProBaconEspConfig.NameTag.Name.Enabled = state
    end, {getgenv().ProBaconEspConfig.NameTag.Name.Enabled, true})
    espnametag_Sec:NewToggle("Show Health", "Display player health on ESP name tag.", function(state)
        getgenv().ProBaconEspConfig.NameTag.Health.Enabled = state
    end, {getgenv().ProBaconEspConfig.NameTag.Health.Enabled, true})
    espnametag_Sec:NewToggle("Show Distance", "Display player distance to local player on ESP name tag.", function(state)
        getgenv().ProBaconEspConfig.NameTag.Distance.Enabled = state
    end, {getgenv().ProBaconEspConfig.NameTag.Distance.Enabled, true})
    espnametag_Sec:NewSlider("Size", "Size of the ESP name tag.", 0, 50, function(value)
        getgenv().ProBaconEspConfig.NameTag.Size = value
    end, getgenv().ProBaconEspConfig.NameTag.Size)
    local ESPNAMETAGCOLOR, ESPNAMETAGTEAMCHECK
    espnametag_Sec:NewToggle("Team Color", "ESP name tag color should follow the player's team color if enabled.", function(state)
        getgenv().ProBaconEspConfig.NameTag.Color.TeamColor = state
        if state then
            if ESPNAMETAGCOLOR ~= nil then
                ESPNAMETAGCOLOR:Destroy()
                ESPNAMETAGCOLOR = nil
            end
        else
            if ESPNAMETAGCOLOR == nil then
                ESPNAMETAGCOLOR = espnametag_Sec:NewColorPicker("Color", "Name tag color", function(clr)
                    getgenv().ProBaconEspConfig.NameTag.Color.Color = clr
                end, getgenv().ProBaconEspConfig.NameTag.Color.Color)
            end
            if ESPNAMETAGTEAMCHECK ~= nil then
                ESPNAMETAGTEAMCHECK:Destroy()
                ESPNAMETAGTEAMCHECK = nil
            end
        end
        if ESPNAMETAGTEAMCHECK == nil then
            ESPNAMETAGTEAMCHECK = espnametag_Sec:NewToggle("Team Check", "Players in your team will not show if in the same team as local player.", function(state_2)
                getgenv().ProBaconEspConfig.NameTag.TeamCheck.Enabled = state_2
            end, {getgenv().ProBaconEspConfig.NameTag.TeamCheck.Enabled, false})
        end
    end, {getgenv().ProBaconEspConfig.NameTag.Color.TeamColor, true})
    
    local ESPHIGHLIGHTCOLOR, ESPHIGHLIGHTTEAMCHECK
    esphighlight_Sec:NewToggle("Show Outline", "Let you see the outine of the player.", function(state)
        getgenv().ProBaconEspConfig.Highlight.Outline.Enabled = state
    end, {getgenv().ProBaconEspConfig.Highlight.Outline.Enabled, false})
    esphighlight_Sec:NewSlider("Outline Transparency", "100 = hidden \n0 = show", 0, 100, function(value)
        getgenv().ProBaconEspConfig.Highlight.Outline.Transparency = value/100
    end, getgenv().ProBaconEspConfig.Highlight.Outline.Transparency*100)
    esphighlight_Sec:NewToggle("Show Fill", "Let you see the character", function(state)
        getgenv().ProBaconEspConfig.Highlight.Fill.Enabled = state
    end, {getgenv().ProBaconEspConfig.Highlight.Fill.Enabled, false})
    esphighlight_Sec:NewSlider("Fill Transparency", "100 = hidden \n0 = show", 0, 100, function(value)
        getgenv().ProBaconEspConfig.Highlight.Fill.Transparency = value/100
    end, getgenv().ProBaconEspConfig.Highlight.Fill.Transparency*100)
    esphighlight_Sec:NewToggle("Team Color", "ESP outline color and fill color should follow the players team color if enabled.", function(state)
        getgenv().ProBaconEspConfig.Highlight.Color.TeamColor = state
        if state then
            if ESPHIGHLIGHTCOLOR ~= nil then
                ESPHIGHLIGHTCOLOR:Destroy()
                ESPHIGHLIGHTCOLOR = nil
            end
        else
            if ESPHIGHLIGHTCOLOR == nil then
                ESPHIGHLIGHTCOLOR = esphighlight_Sec:NewColorPicker("Color", "Highlight Color", function(clr)
                    getgenv().ProBaconEspConfig.Highlight.Color.Color = clr
                end, getgenv().ProBaconEspConfig.Highlight.Color.Color)
                if ESPHIGHLIGHTTEAMCHECK ~= nil then
                    ESPHIGHLIGHTTEAMCHECK:Destroy()
                    ESPHIGHLIGHTTEAMCHECK = nil
                end
            end
        end
        if ESPHIGHLIGHTTEAMCHECK == nil then
            ESPHIGHLIGHTTEAMCHECK = esphighlight_Sec:NewToggle("Team Check", "Players in your team will not show if in the same team as local player.", function(state_2)
                getgenv().ProBaconEspConfig.Highlight.TeamCheck.Enabled = state_2
            end, {getgenv().ProBaconEspConfig.Highlight.TeamCheck.Enabled, false})
        end
    end, {getgenv().ProBaconEspConfig.Highlight.Color.TeamColor, true})
    
    refreshesp_Sec:NewButton("Refresh ESP", "This button allows you to reload the ESP engine.", RefreshEsp)
    
    local combat_Tab = Window:NewTab("Combat")
    local hitbox_Sec = combat_Tab:NewSection("Hitbox")
    local fling_Sec = combat_Tab:NewSection("Fling (Beta)")
    local DEFAULTPART = getgenv().VARIABLEFOLDER.DEFAULTPART or "HumanoidRootPart"
    local function HITBOXFILTERTABLEMANAGER()
        local HITBOXFILTERTABLE = {}
        for _,v in ipairs(PLAYERLIST) do
            if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                if table.find(getgenv().VARIABLEFOLDER.HITBOXFILTER, v) ~= nil then
                    table.insert(HITBOXFILTERTABLE, {v, false})
                else
                    table.insert(HITBOXFILTERTABLE, {v, true})
                end
            end
        end
        return HITBOXFILTERTABLE
    end
    getgenv().VARIABLEFOLDER.HITBOXEXPANDPART = getgenv().VARIABLEFOLDER.HITBOXEXPANDPART or DEFAULTPART
    getgenv().VARIABLEFOLDER.HITBOXFILTER = getgenv().VARIABLEFOLDER.HITBOXFILTER or {}
    
    hitbox_Sec:NewDropdown("Hitbox expand part", "Select the part of other players that you would like to expand.", {"Head", "HumanoidRootPart"}, function(option)
        getgenv().VARIABLEFOLDER.HITBOXEXPANDPART = option
    end, {DEFAULTPART, false})
    getgenv().VARIABLEFOLDER.HITBOXEXPANDX = getgenv().VARIABLEFOLDER.HITBOXEXPANDX or 5
    getgenv().VARIABLEFOLDER.HITBOXEXPANDY = getgenv().VARIABLEFOLDER.HITBOXEXPANDY or 5
    getgenv().VARIABLEFOLDER.HITBOXEXPANDZ = getgenv().VARIABLEFOLDER.HITBOXEXPANDZ or 5
    getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED or 5
    local HITBOXEXPAND_SIZE_X = hitbox_Sec:NewSlider("Size X", "Size X of the player should be the width of the hitbox.", 2, 100, function(var)
        getgenv().VARIABLEFOLDER.HITBOXEXPANDX = var
    end, getgenv().VARIABLEFOLDER.HITBOXEXPANDX)
    local HITBOXEXPAND_SIZE_Y = hitbox_Sec:NewSlider("Size Y", "Size Y of the player should be the height of the hitbox.", 2, 100, function(var)
        getgenv().VARIABLEFOLDER.HITBOXEXPANDY = var
    end, getgenv().VARIABLEFOLDER.HITBOXEXPANDY)
    local HITBOXEXPAND_SIZE_Z = hitbox_Sec:NewSlider("Size Z", "Size Z of the player should be the deapth of the hitbox.", 2, 100, function(var)
        getgenv().VARIABLEFOLDER.HITBOXEXPANDZ = var
    end, getgenv().VARIABLEFOLDER.HITBOXEXPANDZ)
    local HITBOXEXPAND_SIZE_MIXED = hitbox_Sec:NewSlider("Size Mixed", "This slider will change X, Y and Z at the same time soon..", 2, 100, function(var)
        getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED = var
    end, getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED)
    hitbox_Sec:NewTextBox("Size", "This is an input box. User can input a 3 dimantional value.", function(var)
        local SIZE = ProBaconFunction:StringToVector3(var)
        getgenv().VARIABLEFOLDER.HITBOXEXPANDX = SIZE.X
        getgenv().VARIABLEFOLDER.HITBOXEXPANDY = SIZE.Y
        getgenv().VARIABLEFOLDER.HITBOXEXPANDZ = SIZE.Z
        getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[1] = getgenv().VARIABLEFOLDER.HITBOXEXPANDX
        getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[2] = getgenv().VARIABLEFOLDER.HITBOXEXPANDY
        getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[3] = getgenv().VARIABLEFOLDER.HITBOXEXPANDZ
        HITBOXEXPAND_SIZE_X:Update(nil, nil, nil, nil, SIZE.X)
        HITBOXEXPAND_SIZE_Y:Update(nil, nil, nil, nil, SIZE.Y)
        HITBOXEXPAND_SIZE_Z:Update(nil, nil, nil, nil, SIZE.Z)
    end)
    getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE = {getgenv().VARIABLEFOLDER.HITBOXEXPANDX, getgenv().VARIABLEFOLDER.HITBOXEXPANDY, getgenv().VARIABLEFOLDER.HITBOXEXPANDZ, getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED}
    if getgenv().CONNECTFOLDER.HITBOXSIZESLIDERSMANAGER then
        getgenv().CONNECTFOLDER.HITBOXSIZESLIDERSMANAGER:Disconnect()
        getgenv().CONNECTFOLDER.HITBOXSIZESLIDERSMANAGER = nil
    end
    getgenv().CONNECTFOLDER.HITBOXSIZESLIDERSMANAGER = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
        if getgenv().VARIABLEFOLDER.HITBOXEXPANDX ~= getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[1] or getgenv().VARIABLEFOLDER.HITBOXEXPANDY ~= getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[2] or getgenv().VARIABLEFOLDER.HITBOXEXPANDZ ~= getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[3] then
            if getgenv().VARIABLEFOLDER.HITBOXEXPANDX == getgenv().VARIABLEFOLDER.HITBOXEXPANDY and getgenv().VARIABLEFOLDER.HITBOXEXPANDX == getgenv().VARIABLEFOLDER.HITBOXEXPANDZ then
                HITBOXEXPAND_SIZE_MIXED:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.HITBOXEXPANDX)
            end
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[1] = getgenv().VARIABLEFOLDER.HITBOXEXPANDX
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[2] = getgenv().VARIABLEFOLDER.HITBOXEXPANDY
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[3] = getgenv().VARIABLEFOLDER.HITBOXEXPANDZ
        end
        if getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED ~= getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[4] then
            HITBOXEXPAND_SIZE_X:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED)
            HITBOXEXPAND_SIZE_Y:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED)
            HITBOXEXPAND_SIZE_Z:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED)
            getgenv().VARIABLEFOLDER.HITBOXEXPANDX = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
            getgenv().VARIABLEFOLDER.HITBOXEXPANDY = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
            getgenv().VARIABLEFOLDER.HITBOXEXPANDZ = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[1] = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[2] = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[3] = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
            getgenv().VARIABLEFOLDER.HITBOXMANAGERTABLE[4] = getgenv().VARIABLEFOLDER.HITBOXEXPANDMIXED
        end
    end)
    getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY = getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY or 0.5
    hitbox_Sec:NewSlider("Hitbox transparency", "The higher the value, the more transparent it is.", 0, 100, function(var)
        getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY = var/100
    end, getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY)
    hitbox_Sec:NewToggle("Hitbox expand", "Enabling this will expand other player's body part. This feature could significantly increase out user's chances to aim or reach to other players.", function(state)
        if state then
            getgenv().CONNECTFOLDER.HITBOXEXPAND = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                for _,v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                    if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer and v.Character then
                        if v.Character:FindFirstChild(getgenv().VARIABLEFOLDER.HITBOXEXPANDPART) then
                            local HITBOXEXPANDLEGIT = true
                            if getgenv().VARIABLEFOLDER.HITBOXTEAMCHECK then
                                if v.Team and PROTECTED_PLAYERSERVICE.LocalPlayer.Team then
                                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Team == v.Team then
                                        HITBOXEXPANDLEGIT = false
                                    end
                                end
                            end
                            if table.find(getgenv().VARIABLEFOLDER.HITBOXFILTER, v) ~= nil then
                                HITBOXEXPANDLEGIT = false
                            end
                            if v.Character:FindFirstChild("Head") then
                                if getgenv().VARIABLEFOLDER.HITBOXEXPANDPART == "Head" and HITBOXEXPANDLEGIT then
                                    v.Character:FindFirstChild("Head").Size = Vector3.new(getgenv().VARIABLEFOLDER.HITBOXEXPANDX, getgenv().VARIABLEFOLDER.HITBOXEXPANDY, getgenv().VARIABLEFOLDER.HITBOXEXPANDZ)
                                    v.Character:FindFirstChild("Head").Transparency = getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY or 0.5
                                    v.Character:FindFirstChild("Head").CanCollide = false
                                else
                                    if v.Character:FindFirstChild("Head"):FindFirstChild("OriginalSize") then
                                        v.Character:FindFirstChild("Head").Size = v.Character:FindFirstChild("Head").OriginalSize.Value
                                    else
                                        v.Character:FindFirstChild("Head").Size = Vector3.new(2, 1, 1)
                                    end
                                    v.Character:FindFirstChild("Head").Transparency = 0
                                    v.Character:FindFirstChild("Head").CanCollide = false
                                end
                            end
                            if v.Character:FindFirstChild("HumanoidRootPart") then
                                if getgenv().VARIABLEFOLDER.HITBOXEXPANDPART == "HumanoidRootPart" and HITBOXEXPANDLEGIT then
                                    v.Character:FindFirstChild("HumanoidRootPart").Size = Vector3.new(getgenv().VARIABLEFOLDER.HITBOXEXPANDX, getgenv().VARIABLEFOLDER.HITBOXEXPANDY, getgenv().VARIABLEFOLDER.HITBOXEXPANDZ)
                                    v.Character:FindFirstChild("HumanoidRootPart").Transparency = getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY or 0.5
                                    v.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
                                else
                                    if v.Character.HumanoidRootPart:FindFirstChild("OriginalSize") then
                                        v.Character:FindFirstChild("HumanoidRootPart").Size = v.Character:FindFirstChild("HumanoidRootPart").OriginalSize.Value
                                    else
                                        v.Character:FindFirstChild("HumanoidRootPart").Size = Vector3.new(2, 2, 1)
                                    end
                                    v.Character:FindFirstChild("HumanoidRootPart").Transparency = 1
                                    v.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
                                end
                            end
                        end
                    end
                end
            end)
        else
            if getgenv().CONNECTFOLDER.HITBOXEXPAND then
                getgenv().CONNECTFOLDER.HITBOXEXPAND:Disconnect()
                getgenv().CONNECTFOLDER.HITBOXEXPAND = nil
            end
            for _,v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                if v.Character then
                    if v.Character:FindFirstChild("Head") then
                        if v.Character:FindFirstChild("Head"):FindFirstChild("OriginalSize") then
                            v.Character:FindFirstChild("Head").Size = v.Character:FindFirstChild("Head").OriginalSize.Value
                        else
                            v.Character:FindFirstChild("Head").Size = Vector3.new(2, 1, 1)
                        end
                        v.Character:FindFirstChild("Head").Transparency = getgenv().VARIABLEFOLDER.HITBOXTRANSPARENCY or 1
                        v.Character:FindFirstChild("Head").CanCollide = false
                    end
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        if v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("OriginalSize") then
                            v.Character:FindFirstChild("HumanoidRootPart").Size = v.Character:FindFirstChild("HumanoidRootPart").OriginalSize.Value
                        else
                            v.Character:FindFirstChild("HumanoidRootPart").Size = Vector3.new(2, 2, 1)
                        end
                        v.Character:FindFirstChild("HumanoidRootPart").Transparency = 1
                        v.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
                    end
                end
            end
        end
    end, {getgenv().CONNECTFOLDER.HITBOXEXPAND ~= nil, false})
    hitbox_Sec:NewToggle("Team check", "Enabling this will disable hitbox expand from players in your team.", function(state)
        getgenv().VARIABLEFOLDER.HITBOXTEAMCHECK = state
    end, {getgenv().VARIABLEFOLDER.HITBOXTEAMCHECK, false})
    local HITBOXFILTERCHECKBOX = hitbox_Sec:NewCheckbox("Players filter", "Hitbox of player that has been unchecked will not be expanded", HITBOXFILTERTABLEMANAGER(), function(checkedOptions)
        local HITBOXFILTERNEW = {}
        for _,v in pairs(checkedOptions) do
            if not v[2] then
                table.insert(HITBOXFILTERNEW, v[1])
            end
        end
        getgenv().VARIABLEFOLDER.HITBOXFILTER = HITBOXFILTERNEW
    end)
    if getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERADDED then
        getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERADDED:Disconnect()
        getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERADDED = nil
    end
    if getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERREMOVING then
        getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERREMOVING:Disconnect()
        getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERREMOVING = nil
    end
    getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERADDED = PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function(plr)
        HITBOXFILTERCHECKBOX:AddOption({plr, true})
    end)
    getgenv().CONNECTFOLDER.HITBOXCONNECTION_PLAYERREMOVING = PROTECTED_PLAYERSERVICE.PlayerRemoving:Connect(function(plr)
        HITBOXFILTERCHECKBOX:RemoveOption({plr})
    end)
    
    fling_Sec:NewTextBox("Target player", "Input the player's name you would like to fling.", function(var)
        getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER = ProBaconFunction:GetPlayerWithClosestName(var, true) or ProBaconFunction:GetPlayerWithClosestName(var)
        if not getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER then
            Window:NotificationBar("Pro Bacon", "Player not found.")
        end
    end)
    fling_Sec:NewSlider("Fling Force", "The higher force, the further it goes", 0, 10000, function(var)
        getgenv().VARIABLEFOLDER.FLINGFORCE = var
    end, getgenv().VARIABLEFOLDER.FLINGFORCE or 2000)
    local LASTCFRAMEBEFOREFLING
    fling_Sec:NewToggle("Fling Player", "Enable to start fling. \nMotified from old ProBaconHub", function(state)
        if state then
            LASTCFRAMEBEFOREFLING = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            pcall(function()
                local TARGETPLAYERFORFLING = getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER or nil
                if TARGETPLAYERFORFLING then
                    getgenv().CONNECTFOLDER.FLINGPLAYER1 = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        if getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            TARGETPLAYERFORFLING = getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER.Character:FindFirstChild("HumanoidRootPart") or nil
                            local LOCALPLAYERFORGLING = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or nil
                            if TARGETPLAYERFORFLING and LOCALPLAYERFORGLING then
                                LOCALPLAYERFORGLING.CFrame = TARGETPLAYERFORFLING.CFrame
                                coroutine.wrap(function()
                                    for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:GetDescendants()) do
                                        if v:IsA("BasePart") then
                                            v.CanCollide = false
                                        end
                                    end
                                    LOCALPLAYERFORGLING.Parent:FindFirstChildOfClass("Humanoid").Sit = false
                                    LOCALPLAYERFORGLING.Parent:FindFirstChildOfClass("Humanoid").PlatformStand = true
                                    LOCALPLAYERFORGLING.Velocity = Vector3.new(0,8,0)
                                    LOCALPLAYERFORGLING.CFrame = TARGETPLAYERFORFLING.CFrame
                                    LOCALPLAYERFORGLING.AssemblyAngularVelocity = Vector3.new(getgenv().VARIABLEFOLDER.FLINGFORCE,getgenv().VARIABLEFOLDER.FLINGFORCE,getgenv().VARIABLEFOLDER.FLINGFORCE)
                                end)()
                            elseif LOCALPLAYERFORGLING then
                                LOCALPLAYERFORGLING.CFrame = LASTCFRAMEBEFOREFLING
                            end
                        elseif PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LASTCFRAMEBEFOREFLING
                            end
                        end
                    end)
                else
                    Window:NotificationBar("Pro Bacon", "Unable to fling player.", 2)
                end
            end)
        else
            if getgenv().CONNECTFOLDER.FLINGPLAYER1 then
                getgenv().CONNECTFOLDER.FLINGPLAYER1:Disconnect()
                getgenv().CONNECTFOLDER.FLINGPLAYER1 = nil
            end
            local LOCALPLAYERFORGLING = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or nil
            if LOCALPLAYERFORGLING then
                coroutine.wrap(function()
                    for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                        end
                    end
                end)()
                repeat
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.PlatformStand = false
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LASTCFRAMEBEFOREFLING
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    task.wait(0.5)
                until math.abs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity) < Vector3.new(10, 10, 10) and math.abs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity) < Vector3.new(10, 10, 10)
            end
        end
    end, {getgenv().CONNECTFOLDER.FLINGPLAYER1 ~= nil, false})
    local LASTCFRAMEBEFOREFLING2
    fling_Sec:NewToggle("Fling Player 2.0", "Fling player 2.0 will predict the player's movement, reducing the failure caused by network latency.", function(state)
        if state then
            LASTCFRAMEBEFOREFLING2 = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            pcall(function()
                local TARGETPLAYERFORFLING = getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER or nil
                if TARGETPLAYERFORFLING then
                    getgenv().CONNECTFOLDER.FLINGPLAYER2 = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        if getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            TARGETPLAYERFORFLING = getgenv().VARIABLEFOLDER.FLINGTARGETPLAYER.Character:FindFirstChild("HumanoidRootPart") or nil
                            local LOCALPLAYERFORGLING = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or nil
                            if TARGETPLAYERFORFLING and LOCALPLAYERFORGLING then
                                LOCALPLAYERFORGLING.CFrame = TARGETPLAYERFORFLING.CFrame
                                coroutine.wrap(function()
                                    for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:GetDescendants()) do
                                        if v:IsA("BasePart") then
                                            v.CanCollide = false
                                        end
                                    end
                                    LOCALPLAYERFORGLING.Parent:FindFirstChildOfClass("Humanoid").Sit = false
                                    LOCALPLAYERFORGLING.Parent:FindFirstChildOfClass("Humanoid").PlatformStand = true
                                    LOCALPLAYERFORGLING.Velocity = Vector3.new(0,8,0)
                                    LOCALPLAYERFORGLING.CFrame = CFrame.new(TARGETPLAYERFORFLING.CFrame.X+TARGETPLAYERFORFLING.Velocity.X,TARGETPLAYERFORFLING.CFrame.Y+TARGETPLAYERFORFLING.Velocity.Y,TARGETPLAYERFORFLING.CFrame.Z+TARGETPLAYERFORFLING.Velocity.Z)
                                    LOCALPLAYERFORGLING.AssemblyAngularVelocity = Vector3.new(getgenv().VARIABLEFOLDER.FLINGFORCE,getgenv().VARIABLEFOLDER.FLINGFORCE,getgenv().VARIABLEFOLDER.FLINGFORCE)
                                end)()
                            elseif LOCALPLAYERFORGLING then
                                LOCALPLAYERFORGLING.CFrame = LASTCFRAMEBEFOREFLING2
                            end
                        elseif PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LASTCFRAMEBEFOREFLING2
                            end
                        end
                    end)
                else
                    Window:NotificationBar("Pro Bacon", "Unable to fling player.", 2)
                end
            end)
        else
            if getgenv().CONNECTFOLDER.FLINGPLAYER2 then
                getgenv().CONNECTFOLDER.FLINGPLAYER2:Disconnect()
                getgenv().CONNECTFOLDER.FLINGPLAYER2 = nil
            end
            local LOCALPLAYERFORGLING = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart or nil
            if LOCALPLAYERFORGLING then
                coroutine.wrap(function()
                    for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                        end
                    end
                end)()
                repeat
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.PlatformStand = false
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LASTCFRAMEBEFOREFLING
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    task.wait(0.5)
                until math.abs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity) < Vector3.new(10, 10, 10) and math.abs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity) < Vector3.new(10, 10, 10)
            end
        end
    end, {getgenv().CONNECTFOLDER.FLINGPLAYER2 ~= nil, false})
    fling_Sec:NewToggle("Anti Fling", "This feature can prevent user from getting fling.", function(state)
        if state then
            getgenv().VARIABLEFOLDER.PROBACONANTIFLING = PROTECTED_RUNSERVICE.Stepped:Connect(function()
                for _, player in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                    if player ~= PROTECTED_PLAYERSERVICE.LocalPlayer and player.Character then
                        for _, v in pairs(player.Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            end)
        else
            if getgenv().VARIABLEFOLDER.PROBACONANTIFLING then
                getgenv().VARIABLEFOLDER.PROBACONANTIFLING:Disconnect()
                getgenv().VARIABLEFOLDER.PROBACONANTIFLING = nil
            end
        end
    end, {getgenv().VARIABLEFOLDER.PROBACONANTIFLING ~= nil, false})
    
    local teleport_Tab = Window:NewTab("Teleport")
    local teleport_Sec = teleport_Tab:NewSection("Teleport", true)
    local playerteleport_Sec = teleport_Tab:NewSection("Player Teleport")
    local position_Sec = teleport_Tab:NewSection("Position")
    getgenv().VARIABLEFOLDER.TELEPORT_FUN = function()
        if getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT == "PLAYER" then
            if getgenv().VARIABLEFOLDER.LASTTELEPORTVAR then
                if getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
        if getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT == "POSITION" then
            local TARGETLOCATION = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR
            if TARGETLOCATION then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TARGETLOCATION.X, TARGETLOCATION.Y, TARGETLOCATION.Z)
                    else
                        Window:NotificationBar("Pro Bacon", "Player has no primary part!", 2)
                    end
                else
                    Window:NotificationBar("Pro Bacon", "Character not found!", 2)
                end
            else
                Window:NotificationBar("Pro Bacon", "Invalid input!", 2)
            end
        end
        if getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT == "CFRAME" then
            local TARGETLOCATION = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR
            if TARGETLOCATION then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = TARGETLOCATION
                    else
                        Window:NotificationBar("Pro Bacon", "Player has no primary part!", 2)
                    end
                else
                    Window:NotificationBar("Pro Bacon", "Character not found!", 2)
                end
            else
                Window:NotificationBar("Pro Bacon", "Invalid input!", 2)
            end
        end
    end
    teleport_Sec:NewButton("Teleport", "This button allows user to teleport with last input given.", function()
        getgenv().VARIABLEFOLDER.TELEPORT_FUN()
    end)
    local PLAYERTELEPORT = playerteleport_Sec:NewDropdown("Players", "Select a player to teleport to.", PROTECTED_PLAYERSERVICE:GetPlayers(), function(selectedPlayer)
        if selectedPlayer.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if selectedPlayer.Character.HumanoidRootPart and PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT = "PLAYER"
                getgenv().VARIABLEFOLDER.LASTTELEPORTVAR = selectedPlayer
                getgenv().VARIABLEFOLDER.TELEPORT_FUN()
            else
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                    Window:NotificationBar("Pro Bacon", "Target player has no primary part!", 2)
                else
                    Window:NotificationBar("Pro Bacon", "Local player has no primary part!", 2)
                end
            end
        else
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                Window:NotificationBar("Pro Bacon", "Target player is out of render range.", 2)
            else
                Window:NotificationBar("Pro Bacon", "Character not found.", 2)
            end
        end
    end)
    PLAYERTELEPORT:SortBy("Name")
    PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function()
        PLAYERTELEPORT:Update(nil,nil,PROTECTED_PLAYERSERVICE:GetPlayers())
    end)
    PROTECTED_PLAYERSERVICE.PlayerRemoving:Connect(function()
        PLAYERTELEPORT:Update(nil,nil,PROTECTED_PLAYERSERVICE:GetPlayers())
    end)
    playerteleport_Sec:NewTextBox("Player", "Input a player name to teleport to.", function(txt)
        local selectedPlayer = ProBaconFunction:GetPlayerWithClosestName(txt, true) or ProBaconFunction:GetPlayerWithClosestName(txt)
        if selectedPlayer then
            if selectedPlayer.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if selectedPlayer.Character.HumanoidRootPart and PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                    getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT = "PLAYER"
                    getgenv().VARIABLEFOLDER.LASTTELEPORTVAR = selectedPlayer
                    getgenv().VARIABLEFOLDER.TELEPORT_FUN()
                else
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                        Window:NotificationBar("Pro Bacon", "Target player has no primary part!", 2)
                    else
                        Window:NotificationBar("Pro Bacon", "Local player has no primary part!", 2)
                    end
                end
            else
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    Window:NotificationBar("Pro Bacon", "Target player is out of render range.", 2)
                else
                    Window:NotificationBar("Pro Bacon", "Character not found.", 2)
                end
            end
        else
            Window:NotificationBar("Pro Bacon", "Invalid username/playername!")
        end
    end)
    
    position_Sec:NewTextBox("Position", "Input a Vector3 value to teleport to.", function(txt)
        local TARGETLOCATION = ProBaconFunction:StringToVector3(txt)
        if TARGETLOCATION then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                    getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT = "POSITION"
                    getgenv().VARIABLEFOLDER.LASTTELEPORTVAR = TARGETLOCATION
                    getgenv().VARIABLEFOLDER.TELEPORT_FUN()
                else
                    Window:NotificationBar("Pro Bacon", "Player has no primary part!", 2)
                end
            else
                Window:NotificationBar("Pro Bacon", "Character not found!", 2)
            end
        else
            Window:NotificationBar("Pro Bacon", "Invalid input!", 2)
        end
    end)
    
    position_Sec:NewTextBox("Position", "Input a Vector3 value to teleport to.", function(txt)
        local TARGETLOCATION = ProBaconFunction:StringToCFrame(txt)
        if TARGETLOCATION then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                    getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT = "CFRAME"
                    getgenv().VARIABLEFOLDER.LASTTELEPORTVAR = TARGETLOCATION
                    getgenv().VARIABLEFOLDER.TELEPORT_FUN()
                else
                    Window:NotificationBar("Pro Bacon", "Player has no primary part!", 2)
                end
            else
                Window:NotificationBar("Pro Bacon", "Character not found!", 2)
            end
        else
            Window:NotificationBar("Pro Bacon", "Invalid input!", 2)
        end
    end)
    
    local tool_Tab = Window:NewTab("Tools")
    local btool_Sec = tool_Tab:NewSection("BTools")
    local teleporttool_Sec = tool_Tab:NewSection("Click to teleport")
    local pathtool_Sec = tool_Tab:NewSection("Click to path")
    local backpack_Sec = tool_Tab:NewSection("Backpack")
    
    btool_Sec:NewButton("BTools", "Get build toos.", function()
        local hammer = Instance.new("HopperBin")
        hammer.Name = "Hammer"
        hammer.BinType = 4
        hammer.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack
        local cloneTool = Instance.new("HopperBin")
        cloneTool.Name = "Clone"
        cloneTool.BinType = 3
        cloneTool.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack
        local grabTool = Instance.new("HopperBin")
        grabTool.Name = "Grab"
        grabTool.BinType = 2
        grabTool.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack
    end)
    
    teleporttool_Sec:NewButton("Click to Teleport tool", "This tool allows you to teleport to your clicking position.", function()
        local Tool = Instance.new("Tool")
        Tool.RequiresHandle = false
        Tool.Name = "TPTool"
        Tool.Activated:Connect(function()
            local Root = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart
            local Pos = PROTECTED_PLAYERSERVICE.LocalPlayer:GetMouse().Hit.Position+Vector3.new(0,2.5,0)
            local Offset = Pos-Root.Position
            Root.CFrame = Root.CFrame+Offset
        end)
        Tool.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack
    end)
    teleporttool_Sec:NewToggle("Equip tp tool", "This allows you to equip the click to teleport tool incase the game as a costum inventory ui.", function(state)
        if state and PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("TPTool") then
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("TPTool"))
        else
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:UnequipTools()
        end
    end)
    
    pathtool_Sec:NewButton("Path Tool", "This tool can print the path of an object \r Info: Click to print path \r WOW finally a useful script by Pro Bacon!", function()
        local Tool = Instance.new("Tool")
        Tool.RequiresHandle = false
        Tool.Name = "PathTool"
        Tool.Activated:Connect(function()
            print(PROTECTED_PLAYERSERVICE.LocalPlayer:GetMouse().Target:GetFullName())
            setclipboard(PROTECTED_PLAYERSERVICE.LocalPlayer:GetMouse().Target:GetFullName())
        end)
        Tool.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack
    end)
    pathtool_Sec:NewToggle("Equip path tool", "This allows you to equip the click to path tool incase the game as a costum inventory ui.", function(state)
        if state and PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("PathTool") then
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("PathTool"))
        else
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:UnequipTools()
        end
    end)
    
    local SELECTBACKBACKTOOL = backpack_Sec:NewDropdown("Tool", "Select tool from backpack", PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren(), function(selectedTool)
        getgenv().VARIABLEFOLDER.SELECTEDTOOL = selectedTool
    end)
    if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack then
        PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.ChildAdded:Connect(function()
            SELECTBACKBACKTOOL:Update(nil,nil,PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren())
        end)
        PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.ChildRemoved:Connect(function()
            SELECTBACKBACKTOOL:Update(nil,nil,PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren())
        end)
    end
    PROTECTED_PLAYERSERVICE.LocalPlayer.ChildAdded:Connect(function(child)
        if child.Name == "Backpack" then
            PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.ChildAdded:Connect(function()
                SELECTBACKBACKTOOL:Update(nil,nil,PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren())
            end)
            PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.ChildRemoved:Connect(function()
                SELECTBACKBACKTOOL:Update(nil,nil,PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren())
            end)
        end
    end)
    backpack_Sec:NewButton("Delete selected tool", "This button allows user to remove a tool from their backpack.", function()
        if getgenv().VARIABLEFOLDER.SELECTEDTOOL then
            getgenv().VARIABLEFOLDER.SELECTEDTOOL:Destroy()
        else
            Window:NotificationBar("Pro Bacon", "Tool not found!", 1)
        end
    end)
    backpack_Sec:NewButton("Clone selected tool", "This button allows user to clone a tool from their backpack.", function()
        if getgenv().VARIABLEFOLDER.SELECTEDTOOL then
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(getgenv().VARIABLEFOLDER.SELECTEDTOOL)
        else
            Window:NotificationBar("Pro Bacon", "Tool not found!", 1)
        end
    end)
    backpack_Sec:NewButton("Delete holding tool", "Delete the yool you are holding.", function()
        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                repeat
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Destroy()
                until not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            end
        end
    end)
    
    local extra_Tab = Window:NewTab("Extra")
    local client_Sec = extra_Tab:NewSection("Client")
    local player_Sec = extra_Tab:NewSection("Player")
    local ui_Sec = extra_Tab:NewSection("UI")
    local uilib_Sec = extra_Tab:NewSection("Library")
    local extrascripts_Sec = extra_Tab:NewSection("Scripts")
    
    client_Sec:NewToggle("Anti Idle/AFK", "Enabling this allows user to be idle/away from keyboard(AFK) for more than 20 minutes.", function(state)
        if state then
            getgenv().CONNECTFOLDER.ANTIIDLE = PROTECTED_PLAYERSERVICE.LocalPlayer.Idled:Connect(function()
                PROTECTED_VIRTUALUSER:CaptureController()
                PROTECTED_VIRTUALUSER:ClickButton2(Vector2.new())
            end)
        elseif getgenv().CONNECTFOLDER.ANTIIDLE then
            getgenv().CONNECTFOLDER.ANTIIDLE:Disconnect()
            getgenv().CONNECTFOLDER.ANTIIDLE = nil
        end
    end, {getgenv().CONNECTFOLDER.ANTIIDLE ~= nil, false})
    client_Sec:NewButton("Anti kick (Client)", "This won't prevent kick from the server!", function()
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        local protect = newcclosure or protect_function
        if not protect then
        protect = function(f) return f end
        end
        setreadonly(mt, false)
        mt.__namecall = protect(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" then
        wait(9e9)
        return
        end
        return old(self, ...)
        end)
        hookfunction(PROTECTED_PLAYERSERVICE.LocalPlayer.Kick,protect(function() task.wait(9e9) end))
    end)
    player_Sec:NewButton("Copy Position", "This will copy your character's current position to your clipboard.", function()
        setclipboard(tostring(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position))
        Window:NotificationBar("Pro Bacon", "Copied to clipboard!")
    end)
    player_Sec:NewButton("Copy CFrame", "This will copy your character's current CFrame to your clipboard.", function()
        setclipboard(tostring(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame))
        Window:NotificationBar("Pro Bacon", "Copied to clipboard!")
    end)
    local LASTTOGGLEUIINPUTSTARTTIME = 0
    local UIHIDDEN = false
    ui_Sec:NewKeybind("Toggle UI", "Press key to hide or show this UI", Enum.KeyCode.Delete, function(state)
        if state then
            LASTTOGGLEUIINPUTSTARTTIME = os.clock()
        elseif (os.clock() - LASTTOGGLEUIINPUTSTARTTIME) < 0.3 then
            LASTTOGGLEUIINPUTSTARTTIME = 0
            if UIHIDDEN then
                UIHIDDEN = false
                Library:toggle_ui(true)
            else
                UIHIDDEN = true
                Library:toggle_ui(false)
            end
        end
    end)
    getgenv().VARIABLEFOLDER.UIWINDOWANIMATIONSPEED = getgenv().VARIABLEFOLDER.UIWINDOWANIMATIONSPEED or 100
    Library:setanimationspeed(getgenv().VARIABLEFOLDER.UIWINDOWANIMATIONSPEED/100)
    ui_Sec:NewSlider("Animation Speed (%)", "The higher the slower", 0, 200, function(value)
        getgenv().VARIABLEFOLDER.UIWINDOWANIMATIONSPEED = value
        Library:setanimationspeed(value/100)
    end, getgenv().VARIABLEFOLDER.UIWINDOWANIMATIONSPEED)
    ui_Sec:NewButton("Update Log", "This button allows user to view the update log", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/UpdateLog"))().UpdateLog("<font color =\"rgb(255, 218, 68)\">Please note that last update date does not mean realease date.</font>\n\n"..UPDATELOG)
    end)
    ui_Sec:NewButton("Get loader script", "This button allows user to get the offical loader script for ProBaconHub V2.", function()
        setclipboard("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ProBaconHub/ProBaconHubV2/refs/heads/main/LOADER.lua\"))()")
    end)
    uilib_Sec:NewLabel("Version: "..Window:GetVersion())
    uilib_Sec:NewButton("UI Change Log", "This allows user to view the change log of the UI library.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/UpdateLog"))().UpdateLog(Window:GetChangeLog())
    end)
    
    extrascripts_Sec:NewButton("Console", "Load customed console.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/Console"))()
    end)
    extrascripts_Sec:NewButton("Virtual Editor", "Load virtual executor/editor (UNC level is based on your injected executor).", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/VirtualExecutor"))()
    end)
    extrascripts_Sec:NewButton("Virtual Editor [BETA]", "Load the beta version of virtual executor/editor (UNC level is based on your injected executor).\nPlease keep in mind that beta version works the same. Only the syntax highlighting method has been changed.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/VirtualExecutorBeta"))()
    end)
    extrascripts_Sec:NewButton("Infinite Yeild", "Load Infinitey Yield.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source"))()
    end)
    extrascripts_Sec:NewButton("Remote Spy", "Load Remote spy.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
    end)
    extrascripts_Sec:NewButton("Dex", "Load Dex with decompiler.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end)
    extrascripts_Sec:NewButton("Dex [Moded by realredz]", "Load Dex with decompiler.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/DEX-Explorer/refs/heads/main/Mobile.lua"))()
    end)
    extrascripts_Sec:NewButton("Super Ring", "This script allows player to make all unanchored parts in game circle around the player, forming a ring. \nThis id done by applying velocity to the unanchored parts, making them float to the ring's position.", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/refs/heads/main/superringbackup"))()
    end)
    extrascripts_Sec:NewButton("Check most common UNC", "This UNC validation script reliably verifies the authenticity and non-spoofability of specified UNC functions of the user's executor.", function()
        ProBaconEnvironmentCheck()
    end)
    
    local NOTORIETY_HEIST_TABLE = {
        ["Shopping Spree"] = {
            ["PlaceID"] = 1234408990
        },
        ["Trick Or Treat"] = {
            ["PlaceID"] = 5891659534
        },
        ["Downtown Bank"] = {
            ["PlaceID"] = 3107097964
        },
        ["Art Gallery"] = {
            ["PlaceID"] = 1549086835
        },
        ["Black Friday"] = {
            ["PlaceID"] = 2591382751
        },
        ["Haunted Forest"] = {
            ["PlaceID"] = 2511620169
        },
        ["Transport"] = {
            ["PlaceID"] = 5431100846
        },
        ["Diamond Store"] = {
            ["PlaceID"] = 1448835396
        },
        ["R&B Bank"] = {
            ["PlaceID"] = 1213821265
        },
        ["Gift Factory"] = {
            ["PlaceID"] = 1269513822
        },
        ["Authority"] = {
            ["PlaceID"] = 1419274802
        },
        ["Nightclub"] = {
            ["PlaceID"] = 2840013718
        },
        ["The Depot"] = {
            ["PlaceID"] = 86300559848070
        },
        ["Brick Bank"] = {
            ["MappackID"] = 269515318
        },
        ["Rush Hour"] = {
            ["PlaceID"] = 10605039538
        },
        ["The Ozela Heist"] = {
            ["PlaceID"] = 6537140247
        },
        ["Shadow Raid"] = {
            ["PlaceID"] = 2088934656
        },
        ["Golden Mask Casino"] = {
            ["PlaceID"] = 1470780246
        },
        ["Jewelry Shop"] = {
            ["PlaceID"] = 2557847604
        },
        ["The Depot (Test Server)"] = {
            ["PlaceID"] = 102890428833660
        }
    }
    local function NOTORIETYHEIST_PLACEID()
        for i, place_id in pairs(NOTORIETY_HEIST_TABLE) do
            if game.PlaceId == place_id["PlaceID"] then
                return i
            end
        end
    end
    
    local SUPPORTED = true
    if game.PlaceId == 4866692557 then -- Age of heroes
        local ageofheroesautofarm_Tab = Window:NewTab("Auto Farm")
        local ageofheroesautofarm_Sec = ageofheroesautofarm_Tab:NewSection("Auto Farm")
        local AgeOfHeroesFunctionPack = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Game%20Functions/Age%20of%20Heroes"))()
        local AUTOFARM = false
        getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMTYPE = getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMTYPE or "Heroes"
        getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH = getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH or 200
        getgenv().VARIABLEFOLDER.AGEOFHEROESCOOLDOWNPERPUNCH = getgenv().VARIABLEFOLDER.AGEOFHEROESCOOLDOWNPERPUNCH or 200
        ageofheroesautofarm_Sec:NewDropdown("Farm as", "Which role are you farming towards?", {"Heroes", "Villains", "Both"}, function(opt)
            getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMTYPE = opt
            if AUTOFARM then
                AUTOFARM = false
                AgeOfHeroesFunctionPack.AUTOFARM(false, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMTYPE, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH/1000)
                task.wait(0.1)
                AUTOFARM = true
                AgeOfHeroesFunctionPack.AUTOFARM(true, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMTYPE, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH/1000)
            end
        end)
        ageofheroesautofarm_Sec:NewSlider("CD per punch (ms)", "The lower the faster.", 0, 1000, function(val)
            getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH = val
        end, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH)
        ageofheroesautofarm_Sec:NewToggle("Auto Farm", "This allows user to farm npcs.", function(state)
            AUTOFARM = state
            AgeOfHeroesFunctionPack.AUTOFARM(state, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMTYPE, getgenv().VARIABLEFOLDER.AGEOFHEROESAUTOFARMCOOLDOWNPERPUNCH/1000)
        end)
        ageofheroesautofarm_Sec:NewToggle("Auto Collect", "This allows user to collect orbs when they spawns.", function(state)
            AgeOfHeroesFunctionPack.AUTOCOLLECT(state)
        end)
        ageofheroesautofarm_Sec:NewSlider("Punch CD (ms)", "The lower the faster.", 0, 500, function(val)
            getgenv().VARIABLEFOLDER.AGEOFHEROESCOOLDOWNPERPUNCH = val
        end, getgenv().VARIABLEFOLDER.AGEOFHEROESCOOLDOWNPERPUNCH)
        ageofheroesautofarm_Sec:NewToggle("Auto Punch", "This allows user to punch rapidly.", function(state)
            AgeOfHeroesFunctionPack.AUTOPUNCH(state, getgenv().VARIABLEFOLDER.AGEOFHEROESCOOLDOWNPERPUNCH/1000)
        end)
        ageofheroesautofarm_Sec:NewToggle("Auto Punch when players near.", "This allows user to punch rapidly only when another player is near.", function(state)
            AgeOfHeroesFunctionPack.AUTOPUNCHWHENPLAYERNEAR(state)
        end)

    elseif game.PlaceId == 5326405001 or game.PlaceId == 9941625080 then -- Base Battles
        local basebattles_Tab = Window:NewTab("Base Battles!")
        local basebattles_Sec = basebattles_Tab:NewSection("Combat")
        basebattles_Sec:NewToggle("Hitbox", "hitbox \nMotified from old ProBaconHub", function(state)
            if state then
                getgenv().CONNECTFOLDER.BASEBATTLESHITBOX = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    coroutine.wrap(function()
                        for _,VehicleTargetForHitBoxExpand in pairs(PROTECTED_WORKSPACE.Vehicles:GetChildren()) do
                            coroutine.wrap(function()
                                pcall(function()
                                    if VehicleTargetForHitBoxExpand:FindFirstChild("Seats") then
                                        if VehicleTargetForHitBoxExpand.Seats.Driver.Occupant.Value ~= "" and VehicleTargetForHitBoxExpand.Seats.Driver.Occupant.Value ~= nil then
                                            if VehicleTargetForHitBoxExpand.Seats.Driver.Occupant.Value ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                                                if VehicleTargetForHitBoxExpand:FindFirstChild("Wheels") then
                                                    if (#VehicleTargetForHitBoxExpand.Wheels:GetChildren() >= 5 or VehicleTargetForHitBoxExpand.Name == "Strom Breaker" or VehicleTargetForHitBoxExpand.Name == "Fighter" or VehicleTargetForHitBoxExpand.Name == "Helicopter"or VehicleTargetForHitBoxExpand.Name == "Heart UFO") and VehicleTargetForHitBoxExpand.Name ~= "Light Bike" then
                                                        VehicleTargetForHitBoxExpand.Seats.Driver.Occupant.Value.Character.HumanoidRootPart.Size = Vector3.new(7.5, 10, 7.5)
                                                        VehicleTargetForHitBoxExpand.Hitbox.Size = Vector3.new(50, 50, 50)
                                                        VehicleTargetForHitBoxExpand.Hitbox.Transparency = 0.5
                                                    else
                                                        VehicleTargetForHitBoxExpand.Seats.Driver.Occupant.Value.Character.HumanoidRootPart.Size = Vector3.new(15, 20, 15)
                                                        VehicleTargetForHitBoxExpand.Hitbox.Size = Vector3.new(1, 1, 1)
                                                        VehicleTargetForHitBoxExpand.Hitbox.Transparency = 1
                                                    end
                                                end
                                            else
                                                VehicleTargetForHitBoxExpand.Hitbox.Size = Vector3.new(1, 1, 1)
                                                VehicleTargetForHitBoxExpand.Hitbox.Transparency = 1
                                            end
                                        else
                                            VehicleTargetForHitBoxExpand.Hitbox.Size = Vector3.new(1, 1, 1)
                                            VehicleTargetForHitBoxExpand.Hitbox.Transparency = 1
                                        end
                                    else
                                        VehicleTargetForHitBoxExpand.Hitbox.Size = Vector3.new(1, 1, 1)
                                        VehicleTargetForHitBoxExpand.Hitbox.Transparency = 1
                                    end
                                end)
                            end)()
                        end
                    end)()
                    coroutine.wrap(function()
                        for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                            if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                                pcall(function()
                                    v.Character.HumanoidRootPart.Size = Vector3.new(15, 20, 15)
                                    v.Character.HumanoidRootPart.Transparency = 0.9
                                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("White")
                                    v.Character.HumanoidRootPart.Material = "Neon"
                                    v.Character.HumanoidRootPart.CanCollide = false
                                end)
                            end
                        end
                    end)()
                end)
            elseif getgenv().CONNECTFOLDER.BASEBATTLESHITBOX then
                getgenv().CONNECTFOLDER.BASEBATTLESHITBOX:Disconnect()
                getgenv().CONNECTFOLDER.BASEBATTLESHITBOX = nil
            end
        end, {getgenv().CONNECTFOLDER.BASEBATTLESHITBOX ~= nil, false})
        basebattles_Sec:NewToggle("Bring players to front", "This will bring all players in the opposite team to the front of your character. You can use exploive weapons like RPG to kill all of them at once. \nMotified from old ProBaconHub", function(state)
            if state then
                --local plr_in_red_zone, plr_in_blue_zone = PROTECTED_WORKSPACE.Map.ZonePositions.Red:GetTouchingParts(), PROTECTED_WORKSPACE.Map.ZonePositions.Blue:GetTouchingParts()
                getgenv().CONNECTFOLDER.BASEBATTLESBRINGPLAYER = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                        if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                            if v.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                                if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Vehicle") then
                                    if v.Character:FindFirstChild("Humanoid").Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart").Nametag.Arrow.ImageColor3 == Color3.fromRGB(255, 0, 0) then
                                        local parts = v.HumanoidRootPart:GetTouchingParts()
                                        if table.find(parts, PROTECTED_WORKSPACE.Map.ZonePositions.Red) == nil and table.find(parts, PROTECTED_WORKSPACE.Map.ZonePositions.Blue) then
                                            for _, b in pairs(v.Character:GetDescendants()) do
                                                if b:IsA("BasePart") then
                                                    b.CanCollide = false
                                                end
                                            end
                                            v.Character:FindFirstChild("HumanoidRootPart").CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(3,0,math.random(-30, -25))
                                        end
                                        --[[
                                        if v.Character.Vehicle.Value == nil and table.find(plr_in_red_zone, v.Character.HumanoidRootPart) == nil and table.find(plr_in_blue_zone, v.Character.HumanoidRootPart) == nil then
                                            for _, b in pairs(v.Character:GetDescendants()) do
                                                if b:IsA("BasePart") then
                                                    b.CanCollide = false
                                                end
                                            end
                                            v.Character:FindFirstChild("HumanoidRootPart").CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(3,0,math.random(-30, -25))
                                        end
                                        ]]
                                    end
                                end
                            end
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.BASEBATTLESBRINGPLAYER ~= nil then
                getgenv().CONNECTFOLDER.BASEBATTLESBRINGPLAYER:Disconnect()
                getgenv().CONNECTFOLDER.BASEBATTLESBRINGPLAYER = nil
            end
        end, {getgenv().CONNECTFOLDER.BASEBATTLESBRINGPLAYER ~= nil, false})
        basebattles_Sec:NewButton("Good to use features", "Domination(J,K,L), return to last pos (H,P) \nMotified from old ProBaconHub", function()
            local LastPos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            local PauseFrameLog = false
            coroutine.wrap(function()
                while task.wait(0.1) do
                    repeat
                        task.wait(1)
                    until not PauseFrameLog
                    while task.wait(0.00001) do
                        if not PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            break
                        end
                        LastPos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                    PauseFrameLog = true
                end
            end)()
            coroutine.wrap(function()
                PROTECTED_PLAYERSERVICE.LocalPlayer.CharacterAdded:Connect(function()
                    PauseFrameLog = false
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.ChildAdded:Connect(function(child)
                        if child.Name == "HumanoidRootPart" then
                            PauseFrameLog = false
                        end
                    end)
                end)
                while task.wait(0.1) do
                    pcall(function()
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.HUD.Match.GameMode.Text == "Domination" then
                            if PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.J) then
                                repeat
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.Map.ObjectiveHitboxes.A.CFrame
                                    task.wait(0.001)
                                until not PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.J)
                            end
                            if PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.K) then
                                repeat
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.Map.ObjectiveHitboxes.B.CFrame
                                    task.wait(0.001)
                                until not PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.K)
                            end
                            if PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.L) then
                                repeat
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.Map.ObjectiveHitboxes.C.CFrame
                                    task.wait(0.001)
                                until not PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.L)
                            end
                        end
                        if PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.H) then
                            repeat
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LastPos*CFrame.new(0, 1, 0)
                                task.wait(0.001)
                            until not PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.H)
                            PauseFrameLog = false
                        end
                        if PROTECTED_USERINPUTSERVICE:IsKeyDown(Enum.KeyCode.P) then
                            PauseFrameLog = true
                        end
                    end)
                end
            end)()
        end)
    elseif game.PlaceId == 70005410 then -- Blox Hunt
        local bloxhunt_Tab = Window:NewTab("Blox Hunt")
        local bloxhuntlobby_Sec = bloxhunt_Tab:NewSection("Lobby")
        local bloxhunhider_Sec = bloxhunt_Tab:NewSection("Hider")
        local bloxhuntseeker_Sec = bloxhunt_Tab:NewSection("Seeker")
        bloxhuntlobby_Sec:NewButton("Token", "This allows user to get at most 60 tokens.", function()
            if PROTECTED_PLAYERSERVICE.LocalPlayer["Player Data"].ObbyCooldown.FloatingIslandObby.Value == 0 then
                firetouchinterest(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), PROTECTED_WORKSPACE.LobbyObbies.IslandObby.Token.Base, 1)
                firetouchinterest(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), PROTECTED_WORKSPACE.LobbyObbies.IslandObby.Token.Base, 0)
            end
            if PROTECTED_PLAYERSERVICE.LocalPlayer["Player Data"].ObbyCooldown.AdventureObby.Value == 0 then
                firetouchinterest(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), PROTECTED_WORKSPACE.LobbyObbies.AdventureObby.Token.Base, 1)
                firetouchinterest(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), PROTECTED_WORKSPACE.LobbyObbies.AdventureObby.Token.Base, 0)
            end
            if PROTECTED_PLAYERSERVICE.LocalPlayer["Player Data"].ObbyCooldown.LavaIslandObby.Value == 0 then
                firetouchinterest(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), PROTECTED_WORKSPACE.LobbyObbies.LavaObby.Token.Base, 1)
                firetouchinterest(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"), PROTECTED_WORKSPACE.LobbyObbies.LavaObby.Token.Base, 0)
            end
        end)
        bloxhuntlobby_Sec:NewButton("Token2", "This allows user to get rained tokens.", function()
            for _,v in pairs(PROTECTED_WORKSPACE:GetChildren()) do
                if v.Name == "Token" then
                    local pos = v.Base.Position+Vector3.new(0, 10, 0)
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
                    break
                end
            end
        end)
        local BLOXHUNTOBJECTS = {}
        for _,v in pairs(PROTECTED_REPLICATEDSTORAGE.Resources.Objects:GetChildren()) do
            table.insert(BLOXHUNTOBJECTS, v.Name)
        end
        local BLOXHUNTTRANSFORMDROPDOWN = bloxhunhider_Sec:NewDropdown("Transform", "This allows user to transform into any objects.", BLOXHUNTOBJECTS, function(obj)
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Interaction"):WaitForChild("Gameplay"):WaitForChild("Transform"):FireServer(obj)
        end)
        BLOXHUNTTRANSFORMDROPDOWN:SortBy("Name")
        bloxhunhider_Sec:NewToggle("Hide Random", "This allows user to hide in random object.", function(state)
            if state then
                getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM = true
                local OBJECTS = PROTECTED_WORKSPACE.LoadedMap:GetChildren()[1].Objects:GetChildren()
                getgenv().VARIABLEFOLDER.SELECTEDOBJECT = OBJECTS[math.random(1, #OBJECTS)]
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Interaction"):WaitForChild("Gameplay"):WaitForChild("Transform"):FireServer(getgenv().VARIABLEFOLDER.SELECTEDOBJECT.Name)
                task.wait(0.5)
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.SELECTEDOBJECT.WorldPivot * CFrame.new(0, 50, 0)
                getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    if getgenv().VARIABLEFOLDER.SELECTEDOBJECT then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.SELECTEDOBJECT.WorldPivot
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    elseif getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM ~= nil then
                        getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM:Disconnect()
                        getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM = nil
                    end
                end)
            else
                if getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM ~= nil then
                    getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM:Disconnect()
                    getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM = nil
                end
                if getgenv().VARIABLEFOLDER.SELECTEDOBJECT then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.SELECTEDOBJECT.WorldPivot * CFrame.new(0, getgenv().VARIABLEFOLDER.SELECTEDOBJECT:GetExtentsSize().Y, 0)
                end
            end
        end, {getgenv().CONNECTFOLDER.BLOXHUNTHIDERANDOM ~= nil, false})
        bloxhunhider_Sec:NewButton("Taunt", "This allows user to taunt (MAX: 4 times)", function()
            for _ = 1, 4 do
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Interaction"):WaitForChild("Gameplay"):WaitForChild("Taunt"):FireServer()
            end
        end)
        bloxhuntseeker_Sec:NewButton("Zap Farm", "This allows user to zap other players.", function()
            for _,v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                local LASTCFRAME = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                if getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM ~= nil then
                    getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM:Disconnect()
                    getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM = nil
                end
                repeat
                    task.wait(0.1)
                until PROTECTED_PLAYERSERVICE.LocalPlayer["Player Data"].GameData.Energy.Value == 100
                getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,-10,0)
                end)
                while v ~= PROTECTED_PLAYERSERVICE.LocalPlayer and v.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v["Player Data"].Role.Value == "Hider" do
                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("Interaction"):WaitForChild("Gameplay"):WaitForChild("Zap"):FireServer(unpack({
                        v.Character.HumanoidRootPart, --PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart,
                        v.Character
                    }))
                    task.wait(0.1)
                end
                task.wait(0.05)
                if getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM ~= nil then
                    getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM:Disconnect()
                    task.wait()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LASTCFRAME
                end
                getgenv().CONNECTFOLDER.BLOXHUNTZAPFARM = nil
            end
        end)
    elseif game.PlaceId == 3851622790 then --Break In Lobby
        local breakinlobby_Tab = Window:NewTab("Lobby")
        local breakinrole_Sec = breakinlobby_Tab:NewSection("Role")
        getgenv().VARIABLEFOLDER.BREAKINROLENAME = getgenv().VARIABLEFOLDER.BREAKINROLENAME or "Bat"
        getgenv().VARIABLEFOLDER.BREAKINROLEASAKID = getgenv().VARIABLEFOLDER.BREAKINROLEASAKID or false
        breakinrole_Sec:NewDropdown("Roles", "This allows you to become any role you like.", {"Bat", "MedKit", "TeddyBloxpin", "Chips", "Lollipop", "The Guest"}, function(option)
            getgenv().VARIABLEFOLDER.BREAKINROLENAME = option
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.MakeRole:FireServer(getgenv().VARIABLEFOLDER.BREAKINROLENAME, getgenv().VARIABLEFOLDER.BREAKINROLEASAKID, true)
        end)
        breakinrole_Sec:NewToggle("Role As a Kid", "Make your role a kid", function(state)
            getgenv().BreakInRoleKid = true
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.MakeRole:FireServer(getgenv().VARIABLEFOLDER.BREAKINROLENAME, getgenv().VARIABLEFOLDER.BREAKINROLEASAKID, true)
        end)
        breakinrole_Sec:NewButton("Remove roles", "This will remove all roles.", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.MakeRole:FireServer(nil, true, true)
        end)
        breakinrole_Sec:NewButton("Get off the vehicle", "This is useless", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Seater:FireServer()
        end)
    elseif game.PlaceId == 4620170611 then -- Break In ingame
        local breakinstory_Tab = Window:NewTab("Break In (Story)")
        local breakinitem_Sec  = breakinstory_Tab:NewSection("Items")
        local breakinunlock_Sec = breakinstory_Tab:NewSection("Unlock")
        local breakinauto_Sec = breakinstory_Tab:NewSection("Auto")
        local breakinending_Sec = breakinstory_Tab:NewSection("Endings (Shopping time soon.)")
    
        breakinitem_Sec:NewDropdown("Give item", "This dropdown allows user to get any items they want, in the list.", {"Apple", "Bat", "BloxyCola", "Cookie", "Cure", "Chips", "ExpiredBloxyCola", "MedKit", "Pizza", "TeddyBloxpin"},function(opt)
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("GiveTool"):FireServer(opt)
        end)
        breakinunlock_Sec:NewButton("Be friend with Cat", "This button allows user to be the friend of the cat.", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Cattery:FireServer()
        end)
        breakinunlock_Sec:NewButton("Unlock basement door", "This button allows user to unlock the basement door", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("GiveTool"):FireServer("Key")
            task.wait(0.1)
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("UnlockDoor"):FireServer()
        end)
        breakinunlock_Sec:NewButton("Discover broken window", "This button allows user to discover the broken windows without being there.", function()
            local oldCFrame = PROTECTED_WORKSPACE.Imported.Import16.Part.CFrame
            PROTECTED_WORKSPACE.Imported.Import16.Part.Transparency = 1
            PROTECTED_WORKSPACE.Imported.Import16.Part.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            task.wait(0.1)
            PROTECTED_WORKSPACE.Imported.Import16.Part.CFrame = oldCFrame
        end)
    
        breakinauto_Sec:NewButton("Get items", "This button allows player to get all items in the house \nRequirements code: ", function()
            for _,v in pairs(PROTECTED_WORKSPACE:GetChildren()) do
                if string.sub(v.Name, 1, 9) == "BloxyCola" or string.sub(v.Name, 1, 6) == "Cookie" or string.sub(v.Name, 1, 5) == "Money" then
                    if v:FindFirstChildWhichIsA("ClickDetector") then
                        fireclickdetector(v:FindFirstChildWhichIsA("ClickDetector"))
                    end
                end
            end
        end)
        breakinauto_Sec:NewButton("Open safe", "This button allows player to open the safe instantly", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("Safe"):FireServer(PROTECTED_WORKSPACE.CodeNote.SurfaceGui.TextLabel.Text)
        end)
        breakinauto_Sec:NewButton("Heal 15 HP", "This button allows user to gain 15 HP", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
        end)
        breakinauto_Sec:NewButton("Heal 20 HP", "This allows user to gain 20 HP", function()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = true
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.BedTime:FireServer("Carnation pink")
            task.wait()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end)
        breakinauto_Sec:NewButton("Heal all players", "This button allows user to heal all players in seconds.", function()
            if not PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Cure") then
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("GiveTool"):FireServer("Cure")
            end
            task.wait(0.25)
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("BackpackEvent"):FireServer("Equip", PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Cure"))
            task.wait(0.25)
            for _,v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("CurePlayer"):FireServer(v)
            end
        end)
        breakinauto_Sec:NewButton("Save players from drown.", "This button allows user to save other players drowning.", function()
            for _,v in pairs(PROTECTED_WORKSPACE.ToxicBlocks:GetChildren()) do
                if v:FindFirstChildWhichIsA("ClickDetector") then
                    for _ = 1, 2 do
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
                    end
                    fireclickdetector(v:FindFirstChildWhichIsA("ClickDetector"))
                end
            end
        end)
        breakinauto_Sec:NewToggle("Auto damage", "This toogle will automatically damage your enemy.", function(state)
            if state then
                getgenv().CONNECTFOLDER.BREAKINAUTODAMAGE =  PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.BadGuys:GetChildren()) do
                        if v.Name == " " then
                            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.HitBadguy:FireServer(v,10, true)
                            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.HitBadguy:FireServer(v,10, true)
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.BREAKINAUTODAMAGE ~= nil then
                getgenv().CONNECTFOLDER.BREAKINAUTODAMAGE:Disconnect()
                getgenv().CONNECTFOLDER.BREAKINAUTODAMAGE = nil
            end
        end, {getgenv().CONNECTFOLDER.BREAKINAUTODAMAGE ~= nil, false})
        breakinauto_Sec:NewToggle("Auto refill planks", "This will automatically refill planks for window fixing.", function(state)
            if state then
                getgenv().CONNECTFOLDER.BREAKINAUTOREFILLPLANKS = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_REPLICATEDSTORAGE.RemoteEvents.RefreshPlanks:FireServer()
                end)
            elseif getgenv().CONNECTFOLDER.BREAKINAUTOREFILLPLANKS ~= nil then
                getgenv().CONNECTFOLDER.BREAKINAUTOREFILLPLANKS:Disconnect()
                getgenv().CONNECTFOLDER.BREAKINAUTOREFILLPLANKS = nil
            end
        end, {getgenv().CONNECTFOLDER.BREAKINAUTOREFILLPLANKS ~= nil, false})
        breakinauto_Sec:NewButton("Block windows (With planks)", "This button allows user to block all windows using the plank (Equip plank tool).", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteEvents"):WaitForChild("GiveTool"):FireServer("Plank")
            for _,v in pairs(PROTECTED_WORKSPACE:WaitForChild("TheHouse"):GetChildren()) do
                if (v.Name == "ww1" or string.sub(v.Name, 1, 5) == "Windo") and v:IsA("Part") then
                    for _ = 1, 4 do
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.makePlank:FireServer(v.CFrame, v)
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.makePlank:FireServer(v.CFrame, v)
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.makePlank:FireServer(v.CFrame, v)
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.makePlank:FireServer(v.CFrame, v)
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.makePlank:FireServer(v.CFrame, v)
                        PROTECTED_REPLICATEDSTORAGE.RemoteEvents.makePlank:FireServer(v.CFrame, v)
                    end
                end
            end
        end)
    
        breakinending_Sec:NewButton("Final Ending (Read info)", "Require a dish for pie.", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.Energy:FireServer(15,"Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Apple")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Cookie")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("Cookie")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Cookie")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Cookie")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("BloxyCola")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.GiveTool:FireServer("BloxyCola")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("BloxyCola")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("BloxyCola")
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Pie","Apple Pie",5)
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Pie","Cookie Pie",5)
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.AddCrazy:FireServer("Pie","Glazed Apple Pie",5)
        end)
        breakinending_Sec:NewButton("Easter Ending", "This button allows user to unlock the easter ending.", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.EggHuntEvent:FireServer(2,"IcePart2")
            task.wait()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.EggHuntEvent:FireServer(2,"IcePart2")
            task.wait()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.EggHuntEvent:FireServer(2,"IcePart2")
        end)
        breakinending_Sec:NewButton("Buy pan for pie (Require $40)", "This button allows user to buy the pan for making pie.", function()
            PROTECTED_REPLICATEDSTORAGE.RemoteEvents.BuyItem:FireServer("Pan")
        end)
    
        local breakinkill_Tab = Window:NewTab("Kill")
        local breakinkill_Sec = breakinkill_Tab:NewSection("Kill")
        breakinkill_Sec:NewTextBox("Kill player", "This textbox allows user to kill any player.", function(var)
            local KILLPLR = ProBaconFunction:GetPlayerWithClosestName(var, true) or ProBaconFunction:GetPlayerWithClosestName(var)
            if KILLPLR then
                PROTECTED_REPLICATEDSTORAGE.RemoteEvents.ToxicDrown:FireServer(1, KILLPLR)
            end
        end)
        local BREAKINKILLDROPDOWN = breakinkill_Sec:NewDropdown("Kill player", "This dropdown allow user to kill any player.", PROTECTED_PLAYERSERVICE:GetPlayers(), function(var)
            if var then
                local var = var.Name or nil
                local KILLPLR = ProBaconFunction:GetPlayerWithClosestName(var, true) or ProBaconFunction:GetPlayerWithClosestName(var)
                if KILLPLR then
                    PROTECTED_REPLICATEDSTORAGE.RemoteEvents.ToxicDrown:FireServer(1, KILLPLR)
                else
                    Window:NotificationBar("Pro Bacon", "Player not found.")
                end
            end
        end)
        BREAKINKILLDROPDOWN:SortBy("Name")
        PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function()
            BREAKINKILLDROPDOWN:Update(nil, nil, PROTECTED_PLAYERSERVICE:GetPlayers())
        end)
        PROTECTED_PLAYERSERVICE.PlayerRemoving:Connect(function()
            BREAKINKILLDROPDOWN:Update(nil, nil, PROTECTED_PLAYERSERVICE:GetPlayers())
        end)
    
    elseif game.PlaceId == 537413528 then --BABFT
        local buildaboatfarm_Tab = Window:NewTab("Auto Farm")
        local buildaboatfarm_Sec = buildaboatfarm_Tab:NewSection("Farms")
        local buildaboatteleport_Tab = Window:NewTab("Plot")
        local buildaboatplotteleport_Sec = buildaboatteleport_Tab:NewSection("Teleport")
        
        buildaboatfarm_Sec:NewToggle("Gold farm", "This allows user to gain gold, which is an in game currency.", function(state)
            if state then
                local POSITIONS = {
                    CFrame.new(-42, 40, 1254),
                    CFrame.new(-45, 40, 1518),
                    CFrame.new(-58, 40, 2310),
                    CFrame.new(-60, 40, 3046),
                    CFrame.new(-52, 40, 3829),
                    CFrame.new(-37, 40, 4490),
                    CFrame.new(-64, 40, 5324),
                    CFrame.new(-53, 40, 6078),
                    CFrame.new(-54, 40, 6830),
                    CFrame.new(-45, 105, 7702)
                }
                local function LOOPTELEPORT(cframe)
                    return PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
                            end
                        end
                    end)
                end
                local function GOLDFARMCYCLE(first)
                    for i,v in pairs(POSITIONS) do
                        if getgenv().CONNECTFOLDER.BABFTGOLDFARMM ~= nil then
                            local tp = LOOPTELEPORT(v)
                            if not first and i == 1 then
                                task.wait(5)
                            end
                            task.wait(1.5)
                            PROTECTED_WORKSPACE.ClaimRiverResultsGold:FireServer()
                            tp:Disconnect()
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:BreakJoints()
                end
                getgenv().CONNECTFOLDER.BABFTGOLDFARMM = true
                coroutine.wrap(function()
                    GOLDFARMCYCLE(true)
                end)()
                task.wait(0.1)
                getgenv().CONNECTFOLDER.BABFTGOLDFARMM = PROTECTED_PLAYERSERVICE.LocalPlayer.CharacterAdded:Connect(GOLDFARMCYCLE)
            else
                if getgenv().CONNECTFOLDER.BABFTGOLDFARMM ~= nil then
                    getgenv().CONNECTFOLDER.BABFTGOLDFARMM:Disconnect()
                    getgenv().CONNECTFOLDER.BABFTGOLDFARMM = nil
                end
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:BreakJoints()
                end
            end
        end, {getgenv().CONNECTFOLDER.BABFTGOLDFARMM ~= nil, false})
        buildaboatfarm_Sec:NewButton("Gold Block farm", "This allows user to gain gold block, which is a very strong materal for building. \nMotified from old ProBaconHub", function()
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Head") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                Window:NotificationBar("Pro Bacon", "Claim will stop the farm process.")
                if getgenv().AutoTriggerTheChest ~= nil then
                    getgenv().AutoTriggerTheChest:Disconnect()
                end
                local GoldBlockutoFarm = true
                print("[ProBaconHub]: Gold Auto Farm | Triggering checkpoint...")
                PROTECTED_WORKSPACE.ClaimRiverResultsGold:FireServer()
                task.wait(0.1)
                local LastCFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                local PlayerRoot = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart
                PlayerRoot.Anchored = false
                PlayerRoot.CFrame = CFrame.new(-45, 75, 1450)
                local Plat = Instance.new("Part", PROTECTED_WORKSPACE)
                Plat.Anchored = true
                Plat.Transparency = 1
                Plat.Size = Vector3.new(10, 1, 10)
                Plat.CFrame = CFrame.new(PlayerRoot.CFrame.X, PlayerRoot.CFrame.Y-3, PlayerRoot.CFrame.Z)
                task.wait(5)
                Plat:Destroy()
                PlayerRoot.CFrame = LastCFrame
                task.wait(0.1)
                PROTECTED_WORKSPACE.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame = PlayerRoot.CFrame
                task.wait(1)
                PROTECTED_WORKSPACE.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame = CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                local WaitForChestRespond = 0
                repeat
                    task.wait(0.1)
                    WaitForChestRespond = WaitForChestRespond + 0.1
                until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:FindFirstChild("NoChestAnimation") or WaitForChestRespond > 15
                if WaitForChestRespond > 10 then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56, -339, 9486)
                end
                getgenv().AutoTriggerTheChest = PROTECTED_PLAYERSERVICE.LocalPlayer.CharacterAdded:Connect(function()
                    local SuccessfullyGottenGold = false
                    repeat
                        if not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait(0.000001)
                            until PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        end
                        print("[ProBaconHub]: Gold Auto Farm | Attempt to bypass...")
                        task.wait(1)
                        PROTECTED_WORKSPACE.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                        print("[ProBaconHub]: Gold Auto Farm | Spoofing interact state with chest...")
                        task.wait(0.5)
                        PROTECTED_WORKSPACE.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame = CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        print("[ProBaconHub]: Gold Auto Farm | Spoofing interact state with chest...")
                        local WaitForChestRespond = 0
                        repeat
                            task.wait(0.1)
                            WaitForChestRespond = WaitForChestRespond + 0.1
                        until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:FindFirstChild("NoChestAnimation") or WaitForChestRespond > 15
                        if WaitForChestRespond < 10 then
                            SuccessfullyGottenGold = true
                        else
                            task.wait(5)
                        end
                    until SuccessfullyGottenGold or not GoldBlockutoFarm
                end)
                repeat
                    task.wait(0.0001)
                until not PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:FindFirstChild("RiverResultsGui")
                repeat
                    task.wait(0.0001)
                until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:FindFirstChild("RiverResultsGui") and not PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.RiverResultsGui.Frame.Visible
                getgenv().AutoTriggerTheChest:Disconnect()
                GoldBlockutoFarm = false
                Window:NotificationBar("Pro Bacon", "Gold Block farm ended.")
            end
        end)
        buildaboatfarm_Sec:NewWarningLabel("Do not enable both \"Gold farm\" and \"Gold Block farm\" at the same time!")
        local BuildABoatPlot = {}
        for _,v in pairs(PROTECTED_WORKSPACE.Teams:GetChildren()) do
            if v:FindFirstChild("FlagPole") then
                table.insert(BuildABoatPlot, v)
            end
        end
        buildaboatplotteleport_Sec:NewDropdown("Plot", "This allows user to teleport to other plots.", BuildABoatPlot, function(opt)
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = opt.Baseplate.CFrame*CFrame.new(0,3,60)
        end)
    
    elseif game.PlaceId == 3056526277 then -- Build and Survive! Classic
        local buildandsurvive_Tab = Window:NewTab("Build and Survive")
        local buildandsurvive_Sec = buildandsurvive_Tab:NewSection("Build and Survive", true)
        buildandsurvive_Sec:NewButton("Kill All Bots", "This button allows user to kill all enemy.", function()
            for _, monsters in pairs(PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("Monsters"):GetChildren()) do
                if monsters:FindFirstChild("HumanoidRootPart") and monsters:FindFirstChild("Humanoid") then
                    if monsters.Humanoid.Health ~= 0 then
                        PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("mobdodamage"):FireServer({{{monsters, monsters.Humanoid.Health}}})
                    end
                end
            end
        end)
        buildandsurvive_Sec:NewToggle("Auto collect", "This allows user to collect drops from enemy on the map without touching them.", function(state)
            if state then
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOCOLLECT = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    local COLLECTABLES = {}
                    for _, v in pairs(PROTECTED_WORKSPACE.__DEBRIS.MonsterDrops:GetChildren()) do
                        table.insert(COLLECTABLES, v.UID.Value)
                    end
                    if COLLECTABLES ~= {} then
                        PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("redeemdrop"):FireServer({COLLECTABLES})
                    end
                end)
            elseif getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOCOLLECT ~= nil then
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOCOLLECT:Disconnect()
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOCOLLECT = nil
            end
        end, {getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOCOLLECT ~= nil, false})
        buildandsurvive_Sec:NewButton("Enhance Enemies to 99999HP", "This button allows user to set all bot's health to 99999 for trolling. \nMotified from old ProBaconHub", function()
            for _, v in pairs(PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("Monsters"):GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                    if v.Humanoid.Health ~= 0 then
                        PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("mobdodamage"):FireServer({{{v, (99999 - v.Humanoid.Health)*-1}}})
                    end
                end
            end
        end)
        buildandsurvive_Sec:NewButton("Imortal Enemies", "This button allows user to make all bots imortal. Bots can not be killed unless the game ends. \nMotified from old ProBaconHub", function()
            for _, v in pairs(PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("Monsters"):GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                    if v.Humanoid.Health ~= 0 then
                        PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("mobdodamage"):FireServer({{{v, math.huge*-1}}})
                    end
                end
            end
        end)
        buildandsurvive_Sec:NewButton("Equip all updrages [Bypass slot limit]", "This button allows user to equip all upgrades.", function()
            for _, v in pairs(PROTECTED_REPLICATEDSTORAGE.Assets.Upgrades:GetChildren()) do
                PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("equippower"):FireServer({v.Name})
            end
        end)
        buildandsurvive_Sec:NewToggle("Auto heal (yourself)", "This allows user to gain hearts, which is an ingame health system.", function(state)
            if state then
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOHEAL_SELF = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Humanoid").Health ~= 5 and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Humanoid") ~= 0 then
                                PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("upgradefxserver"):FireServer({"Heal", PROTECTED_PLAYERSERVICE.LocalPlayer.Character})
                            end
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOHEAL_SELF ~= nil then
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOHEAL_SELF:Disconnect()
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOHEAL_SELF = nil
            end
        end, {getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOHEAL_SELF ~= nil, false})
        buildandsurvive_Sec:NewToggle("Auto heal (other players)", "This allows other players to gain earts from user.", function(state)
            if state then
                getgenv().CONNECTFOLDER.BUILDANDSURVIVEAUTOHEAL_OTHERS = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                        if v.Character and v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                            if v.Character:FindFirstChild("Humanoid") then
                                if v.Character:FindFirstChild("Humanoid").Health ~= 5 and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                    PROTECTED_WORKSPACE:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("upgradefxserver"):FireServer({"Heal", v.Character})
                                end
                            end
                        end
                    end
                end)
            end
        end)
    
    elseif game.PlaceId == 4913581664 then -- Cart Ride Into Rdite
        local cartrideintordite_Tab = Window:NewTab("Cart Ride Into Rdite")
        local cartcontrol_Sec = cartrideintordite_Tab:NewSection("Cart Control")
    
        cartcontrol_Sec:NewSlider("Cart speed", "This will change the cart speed of all carts when input applied.", -200, 200, function(var)
            getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED = var
        end, getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED or 0)
        cartcontrol_Sec:NewToggle("Cart state", "This will change the cart state of all carts when input applied.", function(state)
            getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSTATE = state
        end, {getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSTATE, false})
        cartcontrol_Sec:NewButton("Apply input to all carts", "This will push the inputs settings to all carts.", function()
            if not getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_SAFTYLOCK then
                PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="Pro Bacon"; Text='Starting'; Duration=5;})
                getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_SAFTYLOCK = true
                for _,v in pairs(PROTECTED_WORKSPACE:GetDescendants()) do
                    if v.Name == "On" and v:FindFirstChild("Click") then
                        if getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED > v.Parent.Configuration.Speed.Value then
                            for _ = 1, (getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED - v.Parent.Configuration.Speed.Value)/5 do
                                fireclickdetector(v.Parent.Up.Click)
                            end
                        elseif getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED < v.Parent.Configuration.Speed.Value then
                            for _ = 1, (v.Parent.Configuration.Speed.Value - getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED)/5 do
                                fireclickdetector(v.Parent.Down.Click)
                            end
                        end
                        if v.Parent.Configuration.CarOn.Value ~= getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSTATE then
                            fireclickdetector(v.Click)
                        end
                    end
                end
                getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_SAFTYLOCK = false
                PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="Pro Bacon"; Text='Car speed set to: '..getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSPEED..'\n and state to: '..tostring(getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_CARTSTATE); Duration=5;})
            end
        end)
        cartcontrol_Sec:NewButton("Fix apply", "Use this button when apply input doesn't work anymore.", function()
            getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_SAFTYLOCK = false
        end)
        
        local cartrideintorditetroll_Tab = Window:NewTab("Cart Troll")
        local carttroll_Sec = cartrideintorditetroll_Tab:NewSection("Troll")
    
        carttroll_Sec:NewToggle("Spam buttons", "This allows user to spam all buttons in the game for trolling.", function(state)
            getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_BUTTONSPAM = state
            if state then
                coroutine.wrap(function()
                    repeat
                        for _,v in pairs(PROTECTED_WORKSPACE:GetDescendants()) do
                            if v.Name == "Click" then
                                if v.Parent.Name == "On" and v.Parent.Parent:FindFirstChild("Configuration") then
                                    if not v.Parent.Parent.Configuration.Speed.Value then
                                        fireclickdetector(v)
                                    end
                                end
                                fireclickdetector(v)
                            end
                        end
                        task.wait(0.3)
                    until not getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_BUTTONSPAM
                end)()
            end
        end, {getgenv().VARIABLEFOLDER.CARTRIDEINTORDITE_BUTTONSPAM, false})
        carttroll_Sec:NewButton("Clean up carts", "This button allows user to clean up all unused carts on the map.", function()
            local OLDCFRAME = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            for _, v in pairs(PROTECTED_WORKSPACE:GetDescendants()) do
                if v:IsA("Seat") and v then
                    if v.Occupant == nil and v.Parent and not v.Parent:FindFirstChild("CHECKED") then
                        repeat
                            v:Sit(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid)
                            task.wait(0.01)
                        until v.Occupant ~= nil or not v or not v.Parent
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
                        local check = Instance.new("IntValue", v.Parent)
                        check.Name = "CHECKED"
                        task.wait()
                    end
                end
            end
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = OLDCFRAME
        end)
    
    elseif game.PlaceId == 5802642341 then -- City Life
        local citylifegeneral_Tab = Window:NewTab("General")
        local citylifegeneral_Sec = citylifegeneral_Tab:NewSection("General", true)
    
        citylifegeneral_Sec:NewToggle("Speed", "This allows user to gain 15% speed", function(state)
            coroutine.wrap(function()
                while state do
                    PROTECTED_REPLICATEDSTORAGE.remoteInterface.roleplay.exercise:FireServer()
                    task.wait(120)
                end
            end)()
        end)
        citylifegeneral_Sec:NewButton("Get [Public Menace] Badage", "This button allows the user to get the [Public Menace] badge. This may take some time soon..", function()
            for i = 1, 100 do
                PROTECTED_REPLICATEDSTORAGE.remoteInterface.vehicles.objectsHitByCarCount:FireServer()
            end
        end)
        citylifegeneral_Sec:NewButton("Heal hunger", "This button allows user to decrease hunger.", function()
            for _,v in pairs(PROTECTED_WORKSPACE.RpObjects:GetChildren()) do
                if v.Name == "vendor" and v.CFrame == CFrame.new(-92.0135956, 6.91660261, -984.743347, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                    PROTECTED_REPLICATEDSTORAGE.remoteInterface.roleplay.buyFood:InvokeServer(v)
                    for _,a in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                        if a.name == "Pizza" then
                            a.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.roleplay.eat:FireServer(v)
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.roleplay.eat:FireServer(v)
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.roleplay.eat:FireServer(v)
                            break
                        end
                    end
                    break
                end
            end
        end)
    
        local citylifejob_Tab = Window:NewTab("Job")
        local citylifecriminal_Sec = citylifejob_Tab:NewSection("Criminal")
        local citylifepolice_Sec = citylifejob_Tab:NewSection("Police")
        local citylifeotherjob_Sec = citylifejob_Tab:NewSection("Other jobs")
        local NPCDAMAGE = PROTECTED_REPLICATEDSTORAGE.remoteInterface.character:FindFirstChild("damage") or PROTECTED_PLAYERSERVICE.LocalPlayer:FindFirstChild("damage")
        local NPCDAMAGE_PARENT = PROTECTED_REPLICATEDSTORAGE.remoteInterface.character
    
        citylifecriminal_Sec:NewToggle("Auto rob", "This allows user to rob all places while standing still.", function(state)
            getgenv().VARIABLEFOLDER.CITYLIFECRIMINALAUTOROB = state
            coroutine.wrap(function()
                while getgenv().VARIABLEFOLDER.CITYLIFECRIMINALAUTOROB and task.wait() do
                    for _,v in pairs(PROTECTED_WORKSPACE.jobInstances.criminal.heists:GetChildren()) do
                        if getgenv().VARIABLEFOLDER.CITYLIFECRIMINALAUTOROB then
                            for _,a in pairs(v:GetChildren()) do
                                if #a:GetChildren() ~= 0 and getgenv().VARIABLEFOLDER.CITYLIFECRIMINALAUTOROB then
                                    PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(a,1)
                                end
                            end
                        end
                    end
                end
            end)()
        end, {getgenv().VARIABLEFOLDER.CITYLIFECRIMINALAUTOROB, false})
        citylifepolice_Sec:NewToggle("Auto arrest NPC", "This allows user to aarrest NPC", function(state)
            getgenv().VARIABLEFOLDER.CITYLIFEPOLICEAUTOROB = state
            if state then
                local LastCFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                repeat
                    if not getgenv().VARIABLEFOLDER.CITYLIFEPOLICEAUTOROB then
                        break
                    end
                    for _, v in pairs(PROTECTED_WORKSPACE.jobInstances.police.ticketCarsNodes:GetChildren()) do
                        for i, a in pairs(v:GetChildren()) do
                            if a:FindFirstChildWhichIsA("Model") then
                                if a:FindFirstChildWhichIsA("Model").ticketPos:FindFirstChild("ProximityPrompt") then
                                    a:FindFirstChildWhichIsA("Model").ticketPos.ProximityPrompt.HoldDuration = 0
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = a:FindFirstChildWhichIsA("Model").ticketPos.CFrame
                                    task.wait(.1)
                                    PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(.1)
                                    PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                end
                            end
                        end
                    end
                    for _, a in pairs(PROTECTED_WORKSPACE.jobInstances.police.crimeScenes:GetChildren()) do
                        pcall(function()
                            for i, v in pairs(a:GetChildren()) do
                                if not getgenv().VARIABLEFOLDER.CITYLIFEPOLICEAUTOROB then
                                    break
                                end
                                if v:FindFirstChild("thug") then
                                    if v:FindFirstChild("thug"):FindFirstChild("HumanoidRootPart") then
                                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
                                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("thug"):FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0,0,-1)
                                        task.wait(.1)
                                        if v:FindFirstChild("thug"):FindFirstChild("HumanoidRootPart"):FindFirstChild("arrestPrompt") then
                                            v:FindFirstChild("thug"):FindFirstChild("HumanoidRootPart").arrestPrompt.HoldDuration = 0
                                            v:FindFirstChild("thug"):FindFirstChild("HumanoidRootPart").arrestPrompt.Enabled = true
                                            PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                            task.wait(.1)
                                            PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                        end
                                    end
                                elseif v.Name == "hostageNode" and #v:GetChildren() ~= 0 then
                                    PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(v,3)
                                end
                            end
                        end)
                    end
                    task.wait(0.01)
                until not getgenv().VARIABLEFOLDER.CITYLIFEPOLICEAUTOROB
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LastCFrame
            end
        end)
        citylifepolice_Sec:NewToggle("God mode from NPC", "This allows user to take no damage from NPC. \nMotified from old ProBaconHub", function(state)
            if state then
                NPCDAMAGE.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer
            else
                NPCDAMAGE.Parent = NPCDAMAGE_PARENT
            end
        end, {NPCDAMAGE.Parent == PROTECTED_PLAYERSERVICE.LocalPlayer, false})
        citylifepolice_Sec:NewButton("Arrest All Crime Player", "This allows user to arrest other players. \nMotified from old ProBaconHub", function()
            local LastCFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                    if v.Character and v.Character:FindFirstChild("PlayerBillboard") and v.Character.PlayerBillboard.main.splitter.bottom.Text ~= "Unemployed" then
                        if string.sub(v.Character.PlayerBillboard.main.splitter.bottom.Text, string.find(v.Character.PlayerBillboard.main.splitter.bottom.Text, " ", string.find(v.Character.PlayerBillboard.main.splitter.bottom.Text, " ")+1)+1, string.len(v.Character.PlayerBillboard.main.splitter.bottom.Text)) == "Criminal" and not v.Character:FindFirstChild("ForceField") then
                            local ArrestTarget = v
                            for i = 1, 75 do
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = ArrestTarget.Character.HumanoidRootPart.CFrame*CFrame.new(0,1,1.5)
                                task.wait(0.01)
                                coroutine.wrap(function()
                                    if i == 10 then
                                        PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.primeArrest:FireServer(702,v)
                                    end
                                    if i == 65 then
                                        PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.arrestPlayer:InvokeServer(232,v)
                                    end
                                end)()
                                if v.Character:FindFirstChild("ForceField") then
                                    break
                                end
                            end
                        end
                    end
                end
            end
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LastCFrame
        end)
        citylifeotherjob_Sec:NewToggle("Auto Farm", "Put out fire, save people, and save KITTENS \nMotified from old ProBaconHub", function()
            coroutine.wrap(function()
                for i = 1, #PROTECTED_WORKSPACE.jobInstances.firefighter.catNodes:GetChildren() do
                    PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.firefighter.catNodes:GetChildren()[i],1)
                    PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.firefighter.catNodes:GetChildren()[i],2)
                end
            end)()
            for i = 1, 35 do
                if PROTECTED_WORKSPACE.jobInstances.firefighter.houses:FindFirstChild(i) and PROTECTED_WORKSPACE.jobInstances.firefighter.houses[i].nodes:FindFirstChild("fireNode"):FindFirstChild("fireNodeHealth") then
                    local theHouse = i
                    coroutine.wrap(function()
                        for i = 1, #PROTECTED_WORKSPACE.jobInstances.firefighter.houses[theHouse].nodes:GetChildren()-1 do
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.firefighter.houses[theHouse].nodes:GetChildren()[i],1)
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.firefighter.houses[theHouse].nodes:GetChildren()[i],2)
                        end
                    end)()
                end
            end
        end)
        citylifeotherjob_Sec:NewToggle("Auto Cook", "Auto cook and send to costomer \nMotified from old ProBaconHub", function(state)
            getgenv().CityLifeAutoCook = state
            local FindHoldingItem = function(cooked)
                for _, v in pairs(PROTECTED_WORKSPACE:GetChildren()) do
                    if v:FindFirstChild("stages") and v:FindFirstChild("Plate") and v:FindFirstChild("height") and v:FindFirstChild("prim") then
                        if v.prim:FindFirstChild("LeftHand->prim") then
                            if v.prim["LeftHand->prim"].Part1 == PROTECTED_PLAYERSERVICE.LocalPlayer.Character.LeftHand then
                                if cooked then
                                    if #v.stages:GetChildren() ~= 0 then
                                        return v
                                    end
                                else
                                    if #v.stages:GetChildren() == 0 then
                                        return v
                                    end
                                end
                            end
                        end
                    end
                end
                return nil
            end
            local FindCookingSpotWithItem = function()
                for _, TargetCookSpot in pairs(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()) do
                    if TargetCookSpot:FindFirstChildWhichIsA("Model") then
                        return true
                    end
                end
                return false
            end
            local GetEmptyDish = function()
                for _, TargetOrderSpot in pairs(PROTECTED_WORKSPACE.jobInstances.cook.OrderSpots:GetChildren()) do
                    if not getgenv().CityLifeAutoCook then
                        break
                    end
                    if TargetOrderSpot:GetChildren() then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetOrderSpot.CFrame
                        task.wait(0.1)
                        PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        task.wait(0.01)
                        PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        break
                    end
                end
            end
            local PlaceEmptyDishOnCookingSpot = function()
                repeat
                    for _, TargetCookSpot in pairs(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()) do
                        if not TargetCookSpot:FindFirstChildWhichIsA("Model") and TargetCookSpot.prompt.Enabled then
                            repeat
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetCookSpot.CFrame
                                task.wait(0.1)
                                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                task.wait(0.01)
                                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                            until TargetCookSpot:FindFirstChildWhichIsA("Model") or not TargetCookSpot.prompt.Enabled or not getgenv().CityLifeAutoCook
                            break
                        end
                    end
                    task.wait(0.001)
                until not FindHoldingItem(true) or not getgenv().CityLifeAutoCook
            end
            local GetFoodCooked = function()
                while task.wait(0.00001) do
                    if not getgenv().CityLifeAutoCook then
                        break
                    end
                    if PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[1]:FindFirstChildWhichIsA("Model") then
                        if PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[1]:FindFirstChildWhichIsA("Model").prim:FindFirstChild("plate") then
                            break
                        end
                        coroutine.wrap(function()
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[1])
                        end)()
                        task.wait(0.25)
                    elseif PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[2]:FindFirstChildWhichIsA("Model") then
                        if PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[2]:FindFirstChildWhichIsA("Model").prim:FindFirstChild("plate") then
                            break
                        end
                        coroutine.wrap(function()
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[2])
                        end)()
                        task.wait(0.25)
                    elseif PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[3]:FindFirstChildWhichIsA("Model") then
                        if PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[3]:FindFirstChildWhichIsA("Model").prim:FindFirstChild("plate")then
                            break
                        end
                        coroutine.wrap(function()
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[3])
                        end)()
                        task.wait(0.25)
                    elseif PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[4]:FindFirstChildWhichIsA("Model") then
                        if PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[4]:FindFirstChildWhichIsA("Model").prim:FindFirstChild("plate") then
                            break
                        end
                        coroutine.wrap(function()
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[4])
                        end)()
                        task.wait(0.25)
                    elseif PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[5]:FindFirstChildWhichIsA("Model") then
                        if PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[5]:FindFirstChildWhichIsA("Model").prim:FindFirstChild("plate") then
                            break
                        end
                        coroutine.wrap(function()
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()[5])
                        end)()
                        task.wait(0.25)
                    else
                        break
                    end
                end
                for _,v in pairs(PROTECTED_WORKSPACE.jobInstances.cook.CookSpots:GetChildren()) do
                    if v:FindFirstChildWhichIsA("Model") then
                        if v:FindFirstChildWhichIsA("Model").prim:FindFirstChild("plate") then
                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            task.wait(0.1)
                        end
                    end
                end
                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(0.01)
                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end
            local FindCustomerForCookingJob = function()
                for i, v in pairs(PROTECTED_WORKSPACE.jobInstances.cook.CustomerSpots:GetChildren()) do
                    if v:FindFirstChild("customer") then
                        if v:FindFirstChild("customer").Enabled then
                            return v
                        end
                    end
                end
                for i, v in pairs(PROTECTED_WORKSPACE.jobInstances.cook.DeliverNodes:GetChildren()) do
                    if v:FindFirstChild("customer") then
                        if v:FindFirstChild("customer").Enabled then
                            return v
                        end
                    end
                end
                return nil
            end
    
            if getgenv().CityLifeAutoCook then
                local LastCFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                print(FindHoldingItem(true))
                repeat
                    if not FindHoldingItem(true) then --Not holding cooked item
                        if not FindCookingSpotWithItem() then
                            if not FindHoldingItem(false) then
                                for _,_ in pairs(PROTECTED_WORKSPACE.jobInstances.cook.OrderSpots:GetChildren()) do
                                    GetEmptyDish()
                                    PlaceEmptyDishOnCookingSpot()
                                end
                            else
                                PlaceEmptyDishOnCookingSpot()
                            end
                        end
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame =  CFrame.new(-77, 4, -807)
                        GetFoodCooked()
                    end
                    if not FindHoldingItem(false) and FindHoldingItem(true) then --Holding cooked dish, not holding empty dish
                        if FindCustomerForCookingJob() ~= nil then
                            repeat
                                local customer = FindCustomerForCookingJob()
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = customer.CFrame
                                task.wait(0.25)
                                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                task.wait(0.1)
                                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                task.wait(0.01)
                                customer:FindFirstChild("customer").Enabled = false
                            until FindCustomerForCookingJob() == nil or not getgenv().CityLifeAutoCook
                        end
                    end
                    task.wait(0.01)
                until not getgenv().CityLifeAutoCook
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LastCFrame
            end
        end)
        citylifeotherjob_Sec:NewButton("Auto Cut Hair", "Only cut hair \nMotified from old ProBaconHub", function()
            local LastCFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
            for i,v in pairs(PROTECTED_WORKSPACE.jobInstances.hairsalon:GetChildren())do
                if v.Name ~= "NPCNodes" and #v:GetChildren() == 2 then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    task.wait(0.001)
                    for _ = 1, 5 do
                        coroutine.wrap(function()
                            PROTECTED_REPLICATEDSTORAGE.remoteInterface.jobs.action:InvokeServer(v)
                        end)()
                        task.wait(0.5)
                    end
                end
            end
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = LastCFrame
        end)
    elseif game.PlaceId == 2248408710 then -- Destruction Simulator
        local destructionsimulator_Tab = Window:NewTab("Destruction Sim")
        local destructionnukearea_Sec = destructionsimulator_Tab:NewSection("Farm")
        local destructionnukeplr_Sec = destructionsimulator_Tab:NewSection("Troll")
        destructionnukearea_Sec:NewButton("Nuke Area (Hold Gun)", "This button allows user to nuke the whole area.", function()
            local findtool = function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Assets") then
                        return PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                    end
                end
                return nil
            end
            if findtool() ~= nil then
                local area = PROTECTED_PLAYERSERVICE.LocalPlayer.CurrentArea.Value
                if area ~= "NoZone" then
                    for i, obj in pairs(PROTECTED_WORKSPACE.Areas[area]:GetDescendants()) do
                        if obj:IsA("BasePart") then
                            local tool = findtool()
                            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Remotes"):WaitForChild("explodeRocket"):FireServer(1736620822.1502209, tool.Stats, obj.Position, tool.Assets:GetChildren()[1].Boom)
                            if string.sub(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, 1, string.find(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, "/")-1) == string.sub(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, string.find(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, "/")+1, string.len(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text)) then
                                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Remotes"):WaitForChild("sellBricks"):FireServer()
                                task.wait(0.5)
                            end
                        end
                    end
                end
            else
                error("no tool", 1)
            end
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Remotes"):WaitForChild("sellBricks"):FireServer()
        end)
        destructionnukearea_Sec:NewToggle("Auto Sell", "This toggle will automatically sell your backpack once full.", function(state)
            if state then
                getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORAUTOSELL = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StoragePopupFrame.Position == UDim2.new(0,0,0,0) then
                        PROTECTED_TWEENSERVICE:Create(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StoragePopupFrame, TweenInfo.new(0.1), {Position = UDim2.new(0,0,1,0)}):Play()
                    end
                    if string.sub(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, 1, string.find(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, "/")-1) == string.sub(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, string.find(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text, "/")+1, string.len(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainUI.StatsFrame.Stats.Bricks.amnt.Text)) then
                        PROTECTED_REPLICATEDSTORAGE:WaitForChild("Remotes"):WaitForChild("sellBricks"):FireServer()
                    end
                end)
            elseif getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORAUTOSELL ~= nil then
                getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORAUTOSELL:Disconnect()
                getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORAUTOSELL = nil
            end
        end, {getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORAUTOSELL ~= nil, true})
        destructionnukeplr_Sec:NewToggle("Nule Players", "This allows user to nuke other players as a troll.", function(state)
            if state then
                getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORNUKEPLAYERS = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _, plr in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                        if plr.Character and plr ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                            for _ = 1, 10 do
                                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Remotes"):WaitForChild("explodeRocket"):FireServer(1736620822.1502209, PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Stats, plr.Character:FindFirstChildWhichIsA("BasePart").Position, PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Assets:GetChildren()[1].Boom)
                            end
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORNUKEPLAYERS ~= nil then
                getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORNUKEPLAYERS:Disconnect()
                getgenv().CONNECTFOLDER.DESTRUCTIONSIMULATORNUKEPLAYERS = nil
            end
        end)
    elseif game.PlaceId == 17488028902 then -- Depthless RPG
        local depthlessrpg_Tab = Window:NewTab("Depthless RPG")
        local depthlessrpg_Sec = depthlessrpg_Tab:NewSection("Depthless RPG")
        local depthlessrpghitbox_Sec = depthlessrpg_Tab:NewSection("Hit box (Patched)")
    
        local deapthlesscheat = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Game%20Functions/DeapthlessRPG"))()
        deapthlesscheat = deapthlesscheat.Unpack("ProBaconHub")
        depthlessrpg_Sec:NewToggle("Auto Kill (Use long range weapon)", "This allows user to kill enemy. Use long range weapon due to new anti cheat.", function(state)
            getgenv().CONNECTFOLDER.DEPTHLESSRPGAUTOKILL = state
            deapthlesscheat.AUTOKILL(state)
        end, {getgenv().CONNECTFOLDER.DEPTHLESSRPGAUTOKILL, false})
        depthlessrpg_Sec:NewButton("Mod weapon", "This allows user to mod their weapon such as setting cooldown time soon. to 0.", function()
            deapthlesscheat.MODWEAPON()
        end)
        depthlessrpg_Sec:NewToggle("God Mode", "This allows user to gain health. Making user semi-god mode.", function(state)
            deapthlesscheat.GODMODE(state)
        end, {deapthlesscheat.GODMODEENABLED(), false})
        local deaphrpgx, deaphrpgy, deaphrpgz
        local function ChangeHitBoxDeaphrpg(x,y,z)
            for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("Hitbox") then
                    v.Hitbox.Size = Vector3.new(x, y, z)
                    v.Hitbox.Transparency = 0.9
                end
            end
            for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Hitbox") then
                    v.Hitbox.CanCollide = false
                    v.Hitbox.Size = Vector3.new(x, y, z)
                    v.Hitbox.Transparency = 0.9
                end
            end
        end
        depthlessrpghitbox_Sec:NewSlider("Hitbox.X", "Change the hitbox", 1, 1000, function(var)
            deaphrpgx = var
            ChangeHitBoxDeaphrpg(deaphrpgx, deaphrpgy, deaphrpgz)
        end)
        depthlessrpghitbox_Sec:NewSlider("Hitbox.Y", "Change the hitbox", 1, 1000, function(var)
            deaphrpgy = var
            ChangeHitBoxDeaphrpg(deaphrpgx, deaphrpgy, deaphrpgz)
        end)
        depthlessrpghitbox_Sec:NewSlider("Hitbox.Z", "Change the hitbox", 1, 1000, function(var)
            deaphrpgz = var
            ChangeHitBoxDeaphrpg(deaphrpgx, deaphrpgy, deaphrpgz)
        end)
        depthlessrpghitbox_Sec:NewTextBox("Size", "Input Vector3", function(txt)
            local vector3here = ProBaconFunction:StringToVector3(txt)
            if vector3here then
                deaphrpgx = vector3here.X
                deaphrpgy = vector3here.Y
                deaphrpgz = vector3here.Z
                ChangeHitBoxDeaphrpg(vector3here.X, vector3here.Y, vector3here.Z)
            end
        end)
    elseif game.PlaceId == 3214114884 then -- Flag Wars
        local flagwar_Tab = Window:NewTab("Flag Wars!")
        local flagwar_Sec = flagwar_Tab:NewSection("", true)
        local flagwarcheat = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Game%20Functions/FlagWars"))()
        flagwarcheat = flagwarcheat.Unpack("ProBaconHub")
        getgenv().flagwarbringenemies = nil
        getgenv().flagwarbringevent = nil
        flagwar_Sec:NewToggle("Bring enemies (Patched)", "", function(state)
            if state then
                getgenv().flagwarbringenemies = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                    for i, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                        if v.Team ~= PROTECTED_PLAYERSERVICE.LocalPlayer.Team and v.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if v.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for _, a in pairs(v.Character:GetDescendants()) do
                                    if a:IsA("BasePart") then
                                        a.CanCollide = false
                                    end
                                end
                                v.Character:FindFirstChild("HumanoidRootPart").CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(2,0,-7)
                            end
                        end
                    end
                end)
            else
                if getgenv().flagwarbringenemies then
                    getgenv().flagwarbringenemies:Disconnect()
                    getgenv().flagwarbringenemies = nil
                end
            end
        end)
    
        flagwar_Sec:NewToggle("Auto collect christmas event items", "", function(state)
            if state then
                getgenv().flagwarbringevent = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                    for _, v in pairs(PROTECTED_WORKSPACE.Core.Drops:GetChildren()) do
                        if v:FindFirstChild("Hitbox") then
                            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Events"):WaitForChild("DropRemotes"):WaitForChild("DropDamage"):FireServer(v:GetAttributes().Id, true)
                        end
                    end
                end)
            else
                if getgenv().flagwarbringevent then
                    getgenv().flagwarbringevent:Disconnect()
                    getgenv().flagwarbringevent = nil
                end
            end
        end)
        flagwar_Sec:NewToggle("Auto collect valentine's event items", "This allows user to set valentine's event token.", function(state)
            getgenv().VARIABLEFOLDER.FLAGWARVALENTINESEVENT = state
            flagwarcheat.VALENTINESFARM(state)
        end)
        flagwar_Sec:NewButton("Grab flag", "", function()
            flagwarcheat.GRABFLAG(ProBaconFunction)
        end)
        flagwar_Sec:NewButton("Dig aura", "This allows user to dig dirts within 20 studs.", function()
            for _,chunk in pairs(PROTECTED_WORKSPACE.Core.CurrentDirt:GetChildren()) do
                for _,v in pairs(chunk:GetChildren()) do
                    coroutine.wrap(function()
                        while true do
                            if v and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    if (v.Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).magnitude <= 20 then
                                        PROTECTED_REPLICATEDSTORAGE:WaitForChild("Events"):WaitForChild("Dig"):FireServer("Shovel",v)
                                    end
                                    task.wait(0.1)
                                else
                                    break
                                end
                            else
                                break
                            end
                        end
                    end)()
                end
            end
        end)
    
        local theMeleeId = nil
        local remotehook = nil
        remotehook = hookmetamethod(game, "__namecall", function(Self, ...)
            local Args = {...}
            local NamecallMethod = getnamecallmethod()
            if NamecallMethod == "FireServer" and Self then
                if Self.Name == "ClientCast-Replication" then
                    theMeleeId = tonumber(Args[1])
                    print(theMeleeId)
                end
            end
            return remotehook(Self, unpack(Args))
        end)
        flagwar_Sec:NewButton("Kill All Enemies (Patched)", "PATCHED\nPENDING FIX", function()
            if theMeleeId then
                pcall(function()
                    if not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                        for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                            if v:FindFirstChild("MeleeScript") then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(v)
                                break
                            end
                        end
                    end
                    for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                        if v.Team ~= PROTECTED_PLAYERSERVICE.LocalPlayer.Team and v.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if v.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                coroutine.wrap(function()
                                    for _ = 1, 4 do
                                        local args = {
                                            [1] = theMeleeId,
                                            [2] = "Humanoid",
                                            [3] = {
                                                ["Instance"] = v.Character.RightUpperArm,
                                                ["Material"] = Enum.Material.SmoothPlastic,
                                                ["Normal"] = Vector3.new(0.2894057035446167, 0.4134974479675293, -0.8632866144180298),
                                                ["Position"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position
                                            }
                                        }
                                        PROTECTED_REPLICATEDSTORAGE:WaitForChild("Events"):WaitForChild("ClientCast Network"):WaitForChild("ClientCast-Replication"):FireServer(unpack(args))
                                        task.wait(0.1)
                                    end
                                end)()
                            end
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:UnequipTools()
                end)
            else
                Window:NotificationBar("Pro Bacon", "Haven't calibrated melee yet. Please hit your melee against the wall.")
            end
        end)
    elseif game.PlaceId == 893973440 then -- Flee the Facility
        local fleethefacility_Tab = Window:NewTab("Flee the facility")
        local fleethefacility_Sec = fleethefacility_Tab:NewSection("Flee the facility")
    
        local function EspStuff()
            local Folder = nil
            local CreateFolder = function()
                if game:GetService("CoreGui"):FindFirstChild("ProBaconHubESP(fleethefacility_Tab)") then
                    game:GetService("CoreGui"):FindFirstChild("ProBaconHubESP(fleethefacility_Tab)"):Destroy()
                end
                Folder = Instance.new("Folder", game:GetService("CoreGui"))
                Folder.Name = "ProBaconHubESP(fleethefacility_Tab)"
            end
            CreateFolder()
            for _, mapmodel in pairs(PROTECTED_WORKSPACE:GetChildren()) do
                if string.find(mapmodel.Name, " by ") ~= nil then
                    print("FOUND MAP: ", mapmodel)
                    for _, v in pairs(mapmodel:GetChildren()) do
                        if v.Name == "ComputerTable" and v:FindFirstChild("Screen") then
                            local thecomputer = v
                            local Highlight = Instance.new("Highlight", Folder)
                            Highlight.Adornee = thecomputer
                            Highlight.FillColor = thecomputer.Screen.Color
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineColor = thecomputer.Screen.Color
                            coroutine.wrap(function()
                                while task.wait(0.1) do
                                    if not Folder or not thecomputer or not thecomputer:FindFirstChild("Screen") then
                                        if Highlight and Highlight.Parent then
                                            Highlight:Destroy()
                                        end
                                        break
                                    end
                                    Highlight.Adornee = thecomputer
                                    Highlight.OutlineTransparency = 0
                                    Highlight.FillColor = thecomputer.Screen.Color
                                    Highlight.FillTransparency = 0.5
                                    Highlight.OutlineColor = thecomputer.Screen.Color
                                end
                            end)()
                        end
                        if v.Name == "FreezePod" then
                            local thefreezepod = v
                            local Highlight = Instance.new("Highlight", Folder)
                            Highlight.Adornee = thefreezepod
                            Highlight.FillColor = Color3.new(44/255, 66/255, 120/255)
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineColor = Color3.new(44/255, 66/255, 120/255)
                            coroutine.wrap(function()
                                while task.wait(0.1) do
                                    if not Folder or not thefreezepod then
                                        break
                                    end
                                    Highlight.OutlineTransparency = 0
                                    Highlight.FillColor = Color3.new(44/255, 66/255, 120/255)
                                    Highlight.FillTransparency = 0.5
                                    Highlight.OutlineColor = Color3.new(44/255, 66/255, 120/255)
                                end
                            end)()
                        end
                    end
                    break
                end
            end
            if getgenv().espstuff then
                getgenv().espstuff:Disconnect()
            end
            if getgenv().addplresp then
                getgenv().addplresp:Disconnect()
            end
            getgenv().espstuff = PROTECTED_WORKSPACE.ChildAdded:Connect(function(child)
                if string.find(child.Name, " by ") ~= nil then
                    print("FOUND MAP: ", child)
                    local completeloadingcomputers = function()
                        local computersfound = 0
                        for _,b in ipairs(child:GetChildren()) do
                            if b.Name == "ComputerTable" and b:FindFirstChild("Screen") then
                                computersfound = computersfound+1
                                if computersfound == 6 then
                                    return true
                                end
                            end
                        end
                        return false
                    end
                    repeat
                        task.wait(2)
                    until completeloadingcomputers()
                    for _, v in ipairs(child:GetChildren()) do
                        if v.Name == "ComputerTable" and v:FindFirstChild("Screen") then
                            local thecomputer = v
                            local Highlight = Instance.new("Highlight", Folder)
                            Highlight.Adornee = thecomputer
                            Highlight.FillColor = thecomputer.Screen.Color
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineColor = thecomputer.Screen.Color
                            coroutine.wrap(function()
                                while task.wait(0.1) do
                                    if not Folder or not thecomputer or not thecomputer:FindFirstChild("Screen") then
                                        if Highlight and Highlight.Parent then
                                            Highlight:Destroy()
                                        end
                                        break
                                    end
                                    Highlight.Adornee = thecomputer
                                    Highlight.OutlineTransparency = 0
                                    Highlight.FillColor = thecomputer.Screen.Color
                                    Highlight.FillTransparency = 0.5
                                    Highlight.OutlineColor = thecomputer.Screen.Color
                                end
                            end)()
                        end
                        if v.Name == "FreezePod" then
                            local thefreezepod = v
                            local Highlight = Instance.new("Highlight", Folder)
                            Highlight.Adornee = thefreezepod
                            Highlight.FillColor = Color3.new(44/255, 66/255, 120/255)
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineColor = Color3.new(44/255, 66/255, 120/255)
                            coroutine.wrap(function()
                                while task.wait(0.1) do
                                    if not Folder or not thefreezepod then
                                        break
                                    end
                                    Highlight.OutlineTransparency = 0
                                    Highlight.FillColor = Color3.new(44/255, 66/255, 120/255)
                                    Highlight.FillTransparency = 0.5
                                    Highlight.OutlineColor = Color3.new(44/255, 66/255, 120/255)
                                end
                            end)()
                        end
                    end
                end
            end)
            for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                if v ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                    if not v.Character then
                        repeat
                            task.wait(0.001)
                        until v.Character
                    end
                    local Highlight = Instance.new("Highlight", Folder)
                    Highlight.Adornee = v.Character
                    coroutine.wrap(function()
                        while task.wait(0.1) do
                            if not Folder then
                                break
                            end
                            local dacolor
                            if v.Character then
                                if v.Character:FindFirstChild("Hammer") then
                                    dacolor = Color3.new(1,0,0)
                                else
                                    dacolor = Color3.new(0,0,1)
                                end
                                Highlight.OutlineTransparency = 0
                                Highlight.FillColor = dacolor
                                Highlight.FillTransparency = 0.5
                                Highlight.OutlineColor = dacolor
                            end
                        end
                    end)()
                    v.CharacterAdded:Connect(function(char)
                        coroutine.wrap(function()
                            while task.wait(0.1) do
                                if not Folder or not char then
                                    break
                                end
                                local dacolor
                                if char:FindFirstChild("Hammer") then
                                    dacolor = Color3.new(1,0,0)
                                else
                                    dacolor = Color3.new(0,0,1)
                                end
                                Highlight.OutlineTransparency = 0
                                Highlight.FillColor = dacolor
                                Highlight.FillTransparency = 0.5
                                Highlight.OutlineColor = dacolor
                            end
                        end)()
                    end)
                end
            end
            PROTECTED_PLAYERSERVICE.PlayerAdded:Connect(function(player)
                if player ~= PROTECTED_PLAYERSERVICE.LocalPlayer then
                    if not player.Character then
                        repeat
                            task.wait(0.001)
                        until player.Character
                    end
                    local Highlight = Instance.new("Highlight", Folder)
                    Highlight.Adornee = player.Character
                    coroutine.wrap(function()
                        while task.wait(0.1) do
                            if not Folder or not player.Character then
                                break
                            end
                            local dacolor
                            if player.Character:FindFirstChild("Hammer") then
                                dacolor = Color3.new(1,0,0)
                            else
                                dacolor = Color3.new(0,0,1)
                            end
                            Highlight.OutlineTransparency = 0
                            Highlight.FillColor = dacolor
                            Highlight.FillTransparency = 0.5
                            Highlight.OutlineColor = dacolor
                        end
                    end)()
                    player.CharacterAdded:Connect(function(char)
                        coroutine.wrap(function()
                            while task.wait(0.1) do
                                if not Folder or not char then
                                    break
                                end
                                local dacolor
                                if char:FindFirstChild("Hammer") then
                                    dacolor = Color3.new(1,0,0)
                                else
                                    dacolor = Color3.new(0,0,1)
                                end
                                Highlight.OutlineTransparency = 0
                                Highlight.FillColor = dacolor
                                Highlight.FillTransparency = 0.5
                                Highlight.OutlineColor = dacolor
                            end
                        end)()
                    end)
                end
            end)
        end
        local function LockSpeed(speed)
            getgenv().fleethefacility_Tabspeedlock = speed
            if getgenv().lockspeed then
                getgenv().lockspeed:Disconnect()
            end
            getgenv().lockspeed = PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and getgenv().fleedaspeed then
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().fleethefacility_Tabspeedlock
                    else
                        task.wait(.0001)
                    end
                else
                    task.wait(.0001)
                end
            end)
        end
        local function Brightsurrounding(brightness)
            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("PointLight") then
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("PointLight"):Destroy()
            end
            task.wait()
            local lightsource = Instance.new("PointLight", PROTECTED_PLAYERSERVICE.LocalPlayer.Character:WaitForChild("HumanoidRootPart"))
            lightsource.Brightness = brightness
            lightsource.Range = math.huge
        end
        local function noPcError(state)
            getgenv().fleethefacility_Tabnopcerror = state
        end
        if not getgenv().VARIABLEFOLDER.FLEETHEFACILITYREMOTEHOOK then
            getgenv().VARIABLEFOLDER.FLEETHEFACILITYREMOTEHOOK = true
            coroutine.wrap(function()
                local remotehook = nil
                remotehook = hookmetamethod(game, "__namecall", function(Self, ...)
                    local Args = {...}
                    local NamecallMethod = getnamecallmethod()
                    if NamecallMethod == "FireServer" and Args[1] == "SetPlayerMinigameResult" and getgenv().fleethefacility_Tabnopcerror then
                        Args[2] = true
                    end
                    return remotehook(Self, unpack(Args))
                end)
            end)()
        end
    
        fleethefacility_Sec:NewButton("ESP Stuff", "Am too lazy so no customizations", function()
            EspStuff()
        end)
        fleethefacility_Sec:NewTextBox("Lock Speed", "Set walkspeed", function(txt)
            getgenv().fleedaspeed = true
            LockSpeed(tonumber(txt))
        end)
        fleethefacility_Sec:NewButton("Reset Speed", "Reset to normal speed", function()
            LockSpeed(16)
            task.wait(.1)
            getgenv().fleedaspeed = false
        end)
        fleethefacility_Sec:NewToggle("No PC error", "This allows user to avoid any error given by invalid calibration.", function(state)
            noPcError(state)
        end)
    elseif game.PlaceId == 18687417158 then -- Forsaken
        local forsaken_Tab = Window:NewTab("Forsaken")
        local forsakenfarm_Sec = forsaken_Tab:NewSection("Farm")
        local forsakengenerator_Sec = forsaken_Tab:NewSection("Generator")
        local forsakenmod_Sec = forsaken_Tab:NewSection("Mod")
        for _,v in getgc(true) do
            if type(v) == "table" and rawget(v, "ReloadTime") then
                rawset(v, "ReloadTime", 0.01)
                rawset(v, "ReservedAmmo", 9999)
                rawset(v, "MagSize", 999)
            end
            if type(v) == "table" and rawget(v, "HealTime") then
                rawset(v, "HealTime", 0.01)
                rawset(v, "HealAmount", 100)
                rawset(v, "HealSpeedMultiplier", 1)
            end
            if type(v) == "table" and rawget(v, "CloneAmount") then
                rawset(v, "CloneAmount", 10)
                rawset(v, "InvisibilityTime", 20)
            end
            if type(v) == "table" and rawget(v, "ShootHitboxSize") then
                rawset(v, "ShootHitboxSize", 10)
                rawset(v, "ShootHitboxRange", 900)
            end
        end
        getgenv().VARIABLEFOLDER.FORSAKENCOOLDOWN = getgenv().VARIABLEFOLDER.FORSAKENCOOLDOWN or 2.75
        forsakenfarm_Sec:NewToggle("Basic Generator Farm", "This allows user to farm generators.", function(state)
            getgenv().VARIABLEFOLDER.FORSAKENGENERATORFARM = state
            if state then
                coroutine.wrap(function()
                    repeat
                        local start = os.clock()
                        if PROTECTED_WORKSPACE.Map:FindFirstChild("Ingame") then
                            if PROTECTED_WORKSPACE.Map.Ingame:FindFirstChild("Map") then
                                for _,v in pairs(PROTECTED_WORKSPACE.Map.Ingame.Map:GetChildren()) do
                                    if v.Name == "Generator" and getgenv().VARIABLEFOLDER.FORSAKENGENERATORFARM then
                                        if v.Progress.Value ~= 100 then
                                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Center.CFrame
                                            task.wait(.125)
                                            v.Remotes.RF:InvokeServer("enter")
                                            task.wait(.075)
                                            v.Remotes.RE:FireServer()
                                        end
                                    end
                                end
                                task.wait(1.1-(os.clock()-start))
                            end
                        end
                        task.wait(0.001)
                    until not getgenv().VARIABLEFOLDER.FORSAKENGENERATORFARM
                end)()
            end
        end, {getgenv().VARIABLEFOLDER.FORSAKENGENERATORFARM, false})
        forsakengenerator_Sec:NewSlider("Solve cooldown", "This allows user to set cooldown to avoid detection.", 0, 10, function(var)
            getgenv().VARIABLEFOLDER.FORSAKENCOOLDOWN = var
        end, getgenv().VARIABLEFOLDER.FORSAKENCOOLDOWN)
        forsakengenerator_Sec:NewToggle("Random cooldown", "Between 3s to 5s.", function(state)
            getgenv().VARIABLEFOLDER.FORSAKENRANDOM = state
        end, {getgenv().VARIABLEFOLDER.FORSAKENRANDOM, false})
        forsakengenerator_Sec:NewToggle("Auto solve puzzle", "This allows user to solve puzzle without solving.", function(state)
            if state then
                getgenv().CONNECTFOLDER.FORSAKENAUTOPUZZLESOLVING = PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
                    if child.Name == "PuzzleUI" and not getgenv().VARIABLEFOLDER.FORSAKENGENERATORFARM then
                        for _,v in pairs(PROTECTED_WORKSPACE.Map.Ingame.Map:GetChildren()) do
                            if v.Name == "Generator" then
                                if (v.Instances.Generator.Progress.Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    while v.Progress.Value ~= 100 and PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") and (v.Instances.Generator.Progress.Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 do
                                        v.Remotes.RE:FireServer()
                                        local starttime = os.clock()
                                        local cd = 2.75
                                        if getgenv().VARIABLEFOLDER.FORSAKENRANDOM then
                                            cd = math.random(12, 50)/10
                                        else
                                            cd = getgenv().VARIABLEFOLDER.FORSAKENCOOLDOWN
                                        end
                                        repeat
                                            PROTECTED_RUNSERVICE.Heartbeat:Wait()
                                        until os.clock()-starttime >= cd or v.Progress.Value == 100 or not PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") or (v.Instances.Generator.Progress.Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 10
                                    end
                                end
                            end
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.FORSAKENAUTOPUZZLESOLVING ~= nil then
                getgenv().CONNECTFOLDER.FORSAKENAUTOPUZZLESOLVING:Disconnect()
                getgenv().CONNECTFOLDER.FORSAKENAUTOPUZZLESOLVING = nil
            end
        end, {getgenv().CONNECTFOLDER.FORSAKENAUTOPUZZLESOLVING ~= nil, false})
        forsakengenerator_Sec:NewButton("Highlight Generators", "This allows user to see the location of generators.", function()
            for _,v in pairs(PROTECTED_WORKSPACE.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" and not v:FindFirstChild("GeneratorHighlight") then
                    local generatorshighlight = Instance.new("Highlight", v)
                    generatorshighlight.Name = "GeneratorHighlight"
                    coroutine.wrap(function()
                        while generatorshighlight and generatorshighlight.Parent and PROTECTED_RUNSERVICE.Heartbeat:Wait() do
                            if v.Progress.Value ~= 100 then
                                generatorshighlight.FillColor = Color3.new(1,0,0)
                            else
                                generatorshighlight.FillColor = Color3.new(1,1,0)
                            end
                        end
                    end)()
                end
            end
        end)
        local requiresuccess, _ = pcall(function()
            forsakenmod_Sec:NewSlider("Stamina", "This slider allows user to change the stamina for its character.", 0, 5000, function(var)
                require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).Stamina = var
            end, require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).Stamina)
            forsakenmod_Sec:NewSlider("Max Stamina", "This slider allows user to change the maximium stamina for its character.", 0, 2000, function(var)
                require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).MaxStamina = var
            end, require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).MaxStamina)
            forsakenmod_Sec:NewSlider("Stamina Gain", "This slider allows user to change the stamina gaining speed for its character.", 0, 2000, function(var)
                require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).StaminaGain = var
            end, require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).StaminaGain)
            forsakenmod_Sec:NewSlider("Stamina Loss", "This slider allows user to change the stamina lossing speed for its character.", 0, 100, function(var)
                require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).StaminaLoss = var
            end, require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).StaminaLoss)
            forsakenmod_Sec:NewSlider("Sprinting Speed", "This slider allows user to change the sprinting speed for its character.", 16, 200, function(var)
                require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).SprintSpeed = var
            end, require(PROTECTED_REPLICATEDSTORAGE.Systems.Character.Game.Sprinting).SprintSpeed)
        end)
        if not requiresuccess then
            forsakenmod_Sec:NewButton("Stamina", "This button allows user to have inf stamina.", function()
                for _,v in getgc(true) do
                    if type(v) == "table" and rawget(v, "MaxStamina") then
                        print("Found Stamina using GC method.")
                        rawset(v, "MaxStamina", 100)
                        rawset(v, "StaminaGain", 100)
                        rawset(v, "StaminaLoss", -100)
                    end
                end
            end)
        end
        forsakenmod_Sec:NewWarningLabel("You could also check out the bypassed speed boost in Local Player tab.")
    elseif game.PlaceId == 91282350711571 then -- Mad City Chapter: 1
        local function LOAD_MADCITY_CH1()
            local function isincrimbase(playername)
                local player = PROTECTED_PLAYERSERVICE[playername]
                local character = player.character
                local lp = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                local humanoidRootPart
                if character then
                    humanoidRootPart = character.HumanoidRootPart
                else
                    return true
                end
                local raycastParams = RaycastParams.new()
                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                raycastParams.FilterDescendantsInstances = {lp, character, PROTECTED_WORKSPACE.Ignore} -- Exclude the player's character from the raycast
                local raycastResult = PROTECTED_WORKSPACE:Raycast(
                    humanoidRootPart.Position,
                    Vector3.new(0, 1000, 0),
                    raycastParams
                )
                l = false
                if raycastResult then
                    local hitPart = raycastResult.Instance
                    for i, v in pairs(PROTECTED_WORKSPACE.CriminalBase1:GetDescendants()) do
                        if v.Name == hitPart.Name then
                            l = true
                            break
                        else
                            l = false
                        end
                    end
                end
                return l
            end
            local function CheckArrestable(Player)
                if Player.Team.Name == "Criminals" or Player.Team.Name == "Villains" and not isincrimbase(Player) then
                    return true
                else
                    return false
                end
            end
            getgenv().VARIABLEFOLDER.MADCITYBYPASSMETHOD = "Instant"
            local function BypassTP(x, y, z, tpmethod)
                if tpmethod == nil then
                    tpmethod = getgenv().VARIABLEFOLDER.MADCITYBYPASSMETHOD
                end
                if tpmethod == "Tween" then
                    ProBaconFunction:VelocityTeleport(x, y, z, 1500)
                end
                if tpmethod == "Instant" then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.CriminalMarker.Value = false
                    local tpbypass = PROTECTED_WORKSPACE.Pyramid.Tele.Core2
                    tpbypass.Transparency, tpbypass.CanCollide = 1, false
                    tpbypass.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                    task.wait()
                    PROTECTED_WORKSPACE.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.141845703125, 51051.234375, 381.09619140625)
                    tpbypass.Transparency, tpbypass.CanCollide = 0, true
                end
                for _ = 1, 100 do
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
                    task.wait()
                end
            end
            local function Touchy(path, t)
                pcall(function()
                    local pos = path.CFrame
                    local i, m = 0
                    if t == nil then
                        m = 1
                    else
                        m = t
                    end
                    repeat
                        path.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                        task.wait(0.1)
                        i = i + 0.1
                    until i >= m
                    path.CFrame = pos
                    --firetouchinterest(path,PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"),0)
                    --firetouchinterest(path,PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart"),1)
                end)
            end
            local function SpawnVehicle(name)
                local vehicletoget = PROTECTED_WORKSPACE.ObjectSelection[name]
                local _, boudingvector3 = vehicletoget:GetBoundingBox()
                vehicletoget:SetPrimaryPartCFrame(CFrame.new(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame.x, PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame.y+(boudingvector3.y/2), PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame.z))
                vehicletoget.PrimaryPart.Anchored = true
                task.wait(.05)
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = vehicletoget.DriveSeat.CFrame*CFrame.new(0,2,0)
                task.wait(.25)
                vehicletoget.DriveSeat:Sit(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid)
                vehicletoget.PrimaryPart.Anchored = false
            end
            local function isEnemyTeam(player)
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Police" and PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Heroes" then
                    if player.Team.Name == "Police" or player.Team.Name == "Heroes" then
                        return true
                    end
                else
                    if player.Team.Name ~= "Police" and player.Team.Name ~= "Heroes" then
                        return true
                    end
                end
                return false
            end
        
            local madcitych1autofarm_Tab = Window:NewTab("Auto Farm")
            local madcitych1items_Tab = Window:NewTab("Items")
            local madcitych1combat_Tab = Window:NewTab("Mad City Combat")
            local madcitych1teleport_Tab = Window:NewTab("Mad Teleport")
            local madcitych1autofarm_Sec = madcitych1autofarm_Tab:NewSection("Auto Farm")
            local madcitych1getitems_Sec = madcitych1items_Tab:NewSection("Get Items")
            local madcitych1combat_Sec = madcitych1combat_Tab:NewSection("Combat")
            local madcitych1bypassmethod_Sec = madcitych1teleport_Tab:NewSection("Bypass method")
            local madcitych1teleport_Sec = madcitych1teleport_Tab:NewSection("Teleport")
            madcitych1autofarm_Sec:NewButton("Auto Rob", "Mini heist", function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
                end
                if PROTECTED_PLAYERSERVICE.LocalPlayer:FindFirstChild("LowerTorso") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.LowerTorso:Destroy()
                end
                local function robit(path)
                    repeat
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = path.Parent.Parent.CFrame*CFrame.new(0,2,0)
                        task.wait()
                        path:FireServer()
                    until path.Parent.Parent.Name == "Nope"
                end
                for i, v in ipairs(PROTECTED_WORKSPACE.ObjectSelection:GetChildren()) do
                    if v.Name == "Cash" and v:FindFirstChild("Cash") and v.Cash.Cash and v.Cash.Cash.Event then
                        print("FoundCash")
                        robit(v.Cash.Cash.Event)
                    end
                    if v.Name == "Laptop" and v:FindFirstChild("Steal") and v.Steal.Steal and v.Steal.Steal.Event then
                        print("FoundLaptop")
                        robit(v.Steal.Steal.Event)
                    end
                    if v.Name == "Luggage" and v:FindFirstChild("SmashCash") and v.SmashCash.SmashCash and v.SmashCash.SmashCash.Event then
                        print("FoundLuggage")
                        robit(v.SmashCash.SmashCash.Event)
                    end
                    if v.Name == "Phone" and v:FindFirstChild("Steal") and v.Steal.Steal and v.Steal.Steal.Event then
                        print("FoundPhone")
                        robit(v.Steal.Steal.Event)
                    end
                    if v.Name == "DiamondBox" and v:FindFirstChild("SmashCash") and v.SmashCash.SmashCash and v.SmashCash.SmashCash.Event then
                        print("FoundDiamondBox")
                        robit(v.SmashCash.SmashCash.Event)
                    end
                    if v.Name == "CashRegister" and v:FindFirstChild("SmashCash") and v.SmashCash.SmashCash and v.SmashCash.SmashCash.Event then
                        print("FoundCashRegister")
                        robit(v.SmashCash.SmashCash.Event)
                    end
                    if v.Name == "Safe" and v:FindFirstChild("SmashCash") and v.SmashCash.SmashCash and v.SmashCash.SmashCash.Event then
                        print("FoundSafe")
                        robit(v.SmashCash.SmashCash.Event)
                    end
                    if v.Name == "ATM" and v:FindFirstChild("ATM") and v.ATM.ATM and v.ATM.ATM.Event then
                        print("FoundATM")
                        robit(v.ATM.ATM.Event)
                    end
                    if v.Name == "TV" and v:FindFirstChild("StealTV") and v.StealTV.StealTV and v.StealTV.StealTV.Event then
                        print("FoundTV")
                        robit(v.StealTV.StealTV.Event)
                    end
                    if v.Name == "TipJar" and v:FindFirstChild("SmashCash") and v.SmashCash.SmashCash and v.SmashCash.SmashCash.Event then
                        print("FoundTipJar")
                        robit(v.SmashCash.SmashCash.Event)
                    end
                end
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.UpperTorso:Destroy()
            end)
            madcitych1autofarm_Sec:NewButton("Auto Heist (Criminal)", "Do heists", function()
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Police" or PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Heros" then
                    if not PROTECTED_REPLICATEDSTORAGE.HeistStatus.Jewel.Locked.Value then
                        print("Jewl")
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text = "ProBaconHub"
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Criminals" then
                            while PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Prisoners" do
                                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteFunction"):InvokeServer("SetTeam", "Prisoners")
                                PROTECTED_RUNSERVICE.Heartbeat:Wait()
                            end
                        end
                        while PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Criminals" do
                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,50,0))
                            PROTECTED_RUNSERVICE.Heartbeat:Wait()
                        end
                        coroutine.wrap(function()
                            repeat
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.JewelryStore.JewelryVent.Vent.CFrame
                                task.wait(.0001)
                            until PROTECTED_REPLICATEDSTORAGE.HeistStatus.Jewel.Robbing.Value or PROTECTED_REPLICATEDSTORAGE.HeistStatus.Jewel.Locked.Value
                        end)()
                        repeat
                            for _,v in pairs(PROTECTED_WORKSPACE.JewelryStore.JewelryBoxes:GetChildren()) do
                                if v.Name == "JewelBox" then
                                    PROTECTED_WORKSPACE:WaitForChild("JewelryStore"):WaitForChild("JewelryBoxes"):WaitForChild("JewelryManager"):WaitForChild("Event"):FireServer(v)
                                    PROTECTED_WORKSPACE:WaitForChild("JewelryStore"):WaitForChild("JewelryBoxes"):WaitForChild("JewelryManager"):WaitForChild("Event"):FireServer(v)
                                    PROTECTED_WORKSPACE:WaitForChild("JewelryStore"):WaitForChild("JewelryBoxes"):WaitForChild("JewelryManager"):WaitForChild("Event"):FireServer(v)
                                    task.wait(0.001)
                                end
                            end
                            task.wait(.01)
                        until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text == "$5000" or PROTECTED_REPLICATEDSTORAGE.HeistStatus.Jewel.Locked.Value or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        Touchy(PROTECTED_WORKSPACE.CriminalBase1.TouchEnd)
                        task.wait(.5)
                        PROTECTED_REPLICATEDSTORAGE.HeistStatus.Jewel.Locked.Value = true
                    end
                    if not PROTECTED_REPLICATEDSTORAGE.HeistStatus.Bank.Locked.Value then
                        print("Bank")
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text = "ProBaconHub"
                        BypassTP(674, 85, 564)
                        task.wait(.5)
                        ProBaconFunction:VelocityTeleport(681, 84, 585, 50)
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(681, 84, 585)
                        repeat
                            task.wait(0.1)
                        until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text == "$3000" or PROTECTED_REPLICATEDSTORAGE.HeistStatus.Bank.Locked.Value or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        Touchy(PROTECTED_WORKSPACE.CriminalBase1.TouchEnd)
                        task.wait(.5)
                        PROTECTED_REPLICATEDSTORAGE.HeistStatus.Bank.Locked.Value = true
                    end
                    if not PROTECTED_REPLICATEDSTORAGE.HeistStatus.Casino.Locked.Value then
                        print("Casino")
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text = "ProBaconHub"
                        if PROTECTED_WORKSPACE.ObjectSelection.HackComputer:FindFirstChild("HackComputer") then
                            BypassTP(1697, 38, 746)
                            task.wait(.1)
                            PROTECTED_WORKSPACE.ObjectSelection.HackComputer.HackComputer.HackComputer.Event:FireServer()
                            task.wait(.01)
                        end
                        for i,v in pairs(PROTECTED_WORKSPACE.ObjectSelection:GetChildren()) do
                            if v.Name == "Lever1" or v.Name == "Lever2" or v.Name == "Lever3" or v.Name == "Lever4" then
                                if not v.Open.Value then
                                    BypassTP(v.Lever.Position.x, v.Lever.Position.y, v.Lever.Position.z)
                                    task.wait(.01)
                                    v.Lever.Lever.Event:FireServer()
                                    task.wait(.01)
                                end
                            end
                        end
                        BypassTP(1696, 41, 519)
                        repeat
                            task.wait(0.1)
                        until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text == "$4000" or PROTECTED_REPLICATEDSTORAGE.HeistStatus.Casino.Locked.Value or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        Touchy(PROTECTED_WORKSPACE.CriminalBase1.TouchEnd)
                        task.wait(.5)
                        PROTECTED_REPLICATEDSTORAGE.HeistStatus.Casino.Locked.Value = true
                    end
                    if not PROTECTED_REPLICATEDSTORAGE.HeistStatus.Pyramid.Locked.Value then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text = "ProBaconHub"
                        Touchy(PROTECTED_WORKSPACE.Pyramid.Tele.Core1)
                        task.wait(.5)
                        BypassTP(1000, 51080, 540)
                        repeat
                            task.wait(0.1)
                        until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text == "$7500" or PROTECTED_REPLICATEDSTORAGE.HeistStatus.Pyramid.Locked.Value or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        Touchy(PROTECTED_WORKSPACE.CriminalBase1.TouchEnd)
                        Touchy(PROTECTED_WORKSPACE.Pyramid.Tele.Core2)
                        task.wait(1)
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0, 50, 0)
                        PROTECTED_REPLICATEDSTORAGE.HeistStatus.Pyramid.Locked.Value = true
                    end
                    if not PROTECTED_REPLICATEDSTORAGE.HeistStatus.Club.Locked.Value then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text = "ProBaconHub"
                        Touchy(PROTECTED_WORKSPACE.Club.TouchStart)
                        BypassTP(1328, 145, -129)
                        repeat
                            task.wait(0.1)
                        until PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.StatsHUD.CashBagHUD.Cash.Amount.Text == "$6000" or PROTECTED_REPLICATEDSTORAGE.HeistStatus.Club.Locked.Value or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        Touchy(PROTECTED_WORKSPACE.CriminalBase1.TouchEnd)
                        task.wait(.5)
                        PROTECTED_REPLICATEDSTORAGE.HeistStatus.Club.Locked.Value = true
                    end
                end
                BypassTP(2131, 26, 418)
                task.wait(1)
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Health = 0
            end)
            madcitych1autofarm_Sec:NewButton("Auto Arrest (Police)", "Arrest Crimnal and Villans", function()
                function CheckArrestable(Player, prisoners)
                    if prisoners then
                        if Player.Team.Name == "Criminals" or Player.Team.Name == "Villains" then
                            return true
                        else
                            return false
                        end
                    else
                        if Player.Team.Name == "Criminals" or Player.Team.Name == "Villains" then
                            return true
                        else
                            return false
                        end
                    end
                end
                --[[
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteFunction"):InvokeServer("SetTeam", "Prisoners")
                repeat
                    task.wait(1)
                until PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")]]
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteFunction"):InvokeServer("SetTeam", "Police")
                repeat
                    task.wait(1)
                until PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("LowerTorso")
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("LowerTorso") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.LowerTorso:Destroy()
                end
                task.wait(0.5)
                for _, v in pairs(PROTECTED_PLAYERSERVICE:GetPlayers()) do
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
                    end
                    if CheckArrestable(v) then
                        for _ = 1, 200 do
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
                                local Handcuff = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.Handcuffs.Handle
                                Handcuff.Parent.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Equip", PROTECTED_PLAYERSERVICE.LocalPlayer.Character, Handcuff)
                            end
                            if v.Team.Name == "Prisoners" then
                                break
                            end
                            local tpbypass = PROTECTED_WORKSPACE.Pyramid.Tele.Core2
                            tpbypass.Transparency, tpbypass.CanCollide = 1, false
                            tpbypass.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                            task.wait()
                            PROTECTED_WORKSPACE.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.141845703125, 51051.234375, 381.09619140625)
                            tpbypass.Transparency, tpbypass.CanCollide = 0, true
                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = v.Character.HumanoidRootPart.Velocity
                            PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", v)
                            PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Arrest", v)
                            task.wait()
                        end
                    end
                end
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.UpperTorso:Destroy()
            end)
            madcitych1autofarm_Sec:NewButton("Xp Farm (Police, Laggy)", "Leave game to stop", function()
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteFunction"):InvokeServer("SetTeam", "Prisoners")
                repeat
                    task.wait(1)
                until PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
                PROTECTED_PLAYERSERVICE.LocalPlayer.CharacterAdded:Connect(function()
                    task.wait(1)
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI:FindFirstChild("TeleportEffect") then
                        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.MainGUI.TeleportEffect:Destroy()
                    end
                    local tpbypass = PROTECTED_WORKSPACE.Pyramid.Tele.Core2
                    tpbypass.Transparency, tpbypass.CanCollide = 1, false
                    tpbypass.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                    task.wait()
                    PROTECTED_WORKSPACE.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.141845703125, 51051.234375, 381.09619140625)
                    tpbypass.Transparency, tpbypass.CanCollide = 0, true
                    for i = 1, 150 do
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1848, 75, -1314)
                        task.wait()
                    end
                    local Handcuff = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.Handcuffs.Handle
                    Handcuff.Parent.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Equip", PROTECTED_PLAYERSERVICE.LocalPlayer.Character, Handcuff)
                    PROTECTED_RUNSERVICE.RenderStepped:Connect(function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/refs/heads/main/Mad%20City%3A%20Chapter%201%20Eject"))()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/refs/heads/main/Mad%20City%3A%20Chapter%201%20Eject"))()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/refs/heads/main/Mad%20City%3A%20Chapter%201%20Eject"))()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/refs/heads/main/Mad%20City%3A%20Chapter%201%20Eject"))()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconGUI/refs/heads/main/Mad%20City%3A%20Chapter%201%20Eject"))()
                    end)
                end)
        
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RemoteFunction"):InvokeServer("SetTeam", "Police")
            end)
            madcitych1autofarm_Sec:NewToggle("Xp Farm (Light)", "Leave game to stop", function(state)
                if state then
                    getgenv().CONNECTFOLDER.MADCITYXPFARMLIGHT = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
                            local Handcuff = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.Handcuffs.Handle
                            Handcuff.Parent.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                            PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Equip", PROTECTED_PLAYERSERVICE.LocalPlayer.Character, Handcuff)
                        end
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Handcuffs") then
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", PROTECTED_PLAYERSERVICE.LocalPlayer)
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", PROTECTED_PLAYERSERVICE.LocalPlayer)
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", PROTECTED_PLAYERSERVICE.LocalPlayer)
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", PROTECTED_PLAYERSERVICE.LocalPlayer)
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", PROTECTED_PLAYERSERVICE.LocalPlayer)
                            end
                        end
                    end)
                elseif getgenv().CONNECTFOLDER.MADCITYXPFARMLIGHT ~= nil then
                    getgenv().CONNECTFOLDER.MADCITYXPFARMLIGHT:Disconnect()
                    getgenv().CONNECTFOLDER.MADCITYXPFARMLIGHT = nil
                end
            end)
            madcitych1autofarm_Sec:NewToggle("Xp Farm (Super Light)", "This allows user to gain XP fast.", function(state)
                if state then
                    getgenv().CONNECTFOLDER.MADCITYXPFARMSUPERLIGHT = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
                            local Handcuff = PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack.Handcuffs.Handle
                            Handcuff.Parent.Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                            PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Equip", PROTECTED_PLAYERSERVICE.LocalPlayer.Character, Handcuff)
                        end
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Handcuffs") then
                                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Eject", PROTECTED_PLAYERSERVICE.LocalPlayer)
                            end
                        end
                    end)
                elseif getgenv().CONNECTFOLDER.MADCITYXPFARMSUPERLIGHT ~= nil then
                    getgenv().CONNECTFOLDER.MADCITYXPFARMSUPERLIGHT:Disconnect()
                    getgenv().CONNECTFOLDER.MADCITYXPFARMSUPERLIGHT = nil
                end
            end, {getgenv().CONNECTFOLDER.MADCITYXPFARMSUPERLIGHT ~= nil, false})
        
        
            madcitych1getitems_Sec:NewButton("Pickpocket (Keycard)", "Pickpocket a cop", function()
                PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Pickpocket", PROTECTED_PLAYERSERVICE.LocalPlayer)
            end)
            madcitych1getitems_Sec:NewButton("Get Lazerblade", "To the mystery light", function()
                local silverykey = PROTECTED_WORKSPACE.ObjectSelection.SilverKey
                if silverykey:FindFirstChild("Nope") then
                    silverykey.Nope.SilverKey.Event:FireServer()
                else
                    silverykey.SilverKey.SilverKey.Event:FireServer()
                end
                for _ = 1, 100 do
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Lazerblade") then
                        break
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1738, 28, 2136)
                    PROTECTED_WORKSPACE:WaitForChild("ObjectSelection"):WaitForChild("Lazerblade"):WaitForChild("Lazerblade"):WaitForChild("Lazerblade"):WaitForChild("Event"):FireServer()
                    task.wait()
                end
            end)
            madcitych1getitems_Sec:NewButton("Jetpack", "Get jetpack", function()
                local bosskey = PROTECTED_WORKSPACE.ObjectSelection.BossKey
                if bosskey:FindFirstChild("Nope") then
                    bosskey.Nope.BossKey.Event:FireServer()
                else
                    bosskey.BossKey.BossKey.Event:FireServer()
                end
                for _ = 1, 100 do
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Jetpack") then
                        break
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2183.76685, 32.7128277, -1554.86902)
                    PROTECTED_WORKSPACE:WaitForChild("ObjectSelection"):WaitForChild("TakeJetpack"):WaitForChild("TakeJetpack"):WaitForChild("TakeJetpack"):WaitForChild("Event"):FireServer()
                    task.wait()
                end
            end)
            madcitych1getitems_Sec:NewDropdown("GetPower", "Shift to use power", {"Hotrod", "Frostbite", "Voltron", "Proton", "Vanta", "Archer"}, function(powerOption)
                if powerOption == "Hotrod" then powerOption = "TheFlash"end
                if powerOption == "Frostbite" then powerOption = "Chill" end
                if powerOption == "Voltron" then powerOption = "Tesla" end
                if powerOption == "Proton" then powerOption = "LaserPower" end
                if powerOption == "Vanta" then powerOption = "Shadow" end
                local powerValue = Instance.new("StringValue", PROTECTED_PLAYERSERVICE.LocalPlayer.Character)
                powerValue.Name = "SuperPower"
                powerValue.Value = powerOption
            end)
            madcitych1getitems_Sec:NewButton("Unlock all vehicles (Not in spawn menu, info for more", "This unlock only unlocks vehicle on map and also the UFO \n Unfortunately, you cant spawn them.", function()
                for _, v in getgc(true) do
                    if type(v) == "table" and rawget(v, 1) == "Camaro" then
                        print('found')
                        for _, vehicle in pairs(PROTECTED_REPLICATEDSTORAGE.ItemDatabase.Vehicles:GetChildren()) do
                            table.insert(v, vehicle.Name)
                        end
                    end
                end
            end)
            local vehiclelist = {}
            for _, v in pairs(PROTECTED_WORKSPACE.ObjectSelection:GetChildren()) do
                if v:FindFirstChild("DriveSeat") and string.find(v.Name, "'s Vehicle") == nil and table.find(vehiclelist, v.Name) == nil then
                    print("Found Vehicle: ", v.Name)
                    table.insert(vehiclelist, v.Name)
                end
            end
            table.sort(vehiclelist)
            local lastvehicleinput
            madcitych1getitems_Sec:NewDropdown("Get Vehicle", "Free vehicle", vehiclelist, function(currentOption)
                lastvehicleinput = currentOption
                SpawnVehicle(currentOption)
            end)
            madcitych1getitems_Sec:NewTextBox("Vehicle", "Get vehicle by input", function(txt)
                if PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild(txt) then
                    if PROTECTED_WORKSPACE.ObjectSelection[txt]:FindFirstChild("DriveSeat") and string.find(PROTECTED_WORKSPACE.ObjectSelection[txt].Name, "'s Vehicle") == nil then
                        lastvehicleinput = txt
                        SpawnVehicle(txt)
                    end
                end
            end)
            madcitych1getitems_Sec:NewButton("Spawn Again", "Spawn vehicle without inputing again", function()
                SpawnVehicle(lastvehicleinput)
            end)
            madcitych1getitems_Sec:NewButton("Escape Stuck in Vehicle", "Remove your vehicle", function()
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
                task.wait()
                PROTECTED_WORKSPACE:WaitForChild("ObjectSelection"):WaitForChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle"):Destroy()
            end)
            PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.ChildRemoved:Connect(function(child)
                if child:IsA("LocalScript") then
                    for _,v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:GetChildren()) do
                        if v.Name == "ProBaconMissileMod" then
                            v:Destroy()
                        end
                    end
                end
            end)
        
            madcitych1combat_Sec:NewButton("Missile Mod", "Mod missles", function()
                for _,v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui:GetChildren()) do
                    if v:FindFirstChild("Car") and v.Name ~= "ProBaconMissileMod" then
                        local vehiclescript = v:Clone()
                        vehiclescript.Name = "ProBaconMissileMod"
                        vehiclescript.Parent = v.Parent
                    end
                end
            end)
            madcitych1combat_Sec:NewButton("Mod Air", "Mod air vehicles", function()
                for i,v in next, getgc(true) do
                    if type(v) == "table" and rawget(v, "Missiles") then
                        v.MissileCooldown = 0
                        --v.MissileTargetRange = 2000
                        v.MissileLock = 0.01
                    end
                end
            end)
            madcitych1combat_Sec:NewButton("Mod Ground Vehicles", "Mod cars", function()
                for i,v in next, getgc(true) do
                    if type(v) == "table" and rawget(v, "MaxSpeed") then
                        rawset(v, "TurretFireRate", 0.3)
                        rawset(v, "MaxSpeed", 500)
                        rawset(v, "HoverHitWater", true)
                        rawset(v, "CanTurnHoverMode", true)
                        rawset(v, "StartTime", 0)
                    end
                end
            end)
            madcitych1combat_Sec:NewButton("Mod Weapons", "Mod Weapons", function()
                for _,q in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                    if q.Name~= "Phone" and q:IsA("Tool") and q:FindFirstChildWhichIsA("LocalScript") then
                        local dupecount = 0
                        for _, v in pairs(q:GetChildren()) do
                            if v:IsA("LocalScript") then
                                dupecount = dupecount + 1
                            end
                        end
                        print(dupecount)
                        if dupecount == 1 then
                            for _ = 1, 9 do
                                local dupe = q:FindFirstChildWhichIsA("LocalScript"):Clone()
                                dupe.Parent = q
                            end
                        end
                    end
                end
            end)
            madcitych1combat_Sec:NewToggle("Kill Aura", "Kill enemy nearby", function(state)
                if state then
                    getgenv().CONNECTFOLDER.MADCITYCH1KILLAURA = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        for _, v in pairs(PROTECTED_PLAYERSERVICE:GetChildren()) do
                            if v.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                                if v.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 7 and isEnemyTeam(v) and v.Character.Humanoid.Health > 0 then
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                    PROTECTED_REPLICATEDSTORAGE.Event:FireServer("Punch", v.Character:FindFirstChild("Humanoid"))
                                end
                            end
                        end
                    end)
                elseif getgenv().CONNECTFOLDER.MADCITYCH1KILLAURA ~= nil then
                    getgenv().CONNECTFOLDER.MADCITYCH1KILLAURA:Disconnect()
                    getgenv().CONNECTFOLDER.MADCITYCH1KILLAURA = nil
                end
            end, {getgenv().CONNECTFOLDER.MADCITYCH1KILLAURA ~= nil, false})
            madcitych1combat_Sec:NewToggle("Loop Kill Enemy (On Vehicle)", "You must be on a vehice with missiles", function(state)
                getgenv().MadLoopKillEnemy = state
                function isEnemyTeam(player)
                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Police" and PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Heroes" then
                        if player.Team.Name == "Police" or player.Team.Name == "Heroes" then
                            return true
                        end
                    else
                        if player.Team.Name ~= "Police" and player.Team.Name ~= "Heroes" then
                            return true
                        end
                    end
                    return false
                end
                while getgenv().MadLoopKillEnemy and task.wait(.01) do
                    for _, v in pairs(PROTECTED_PLAYERSERVICE:GetChildren()) do
                        if v.Character then
                            if v.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildOfClass("Humanoid") and isEnemyTeam(v) then
                                if v.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                                    local args = {
                                        [1] = "BM",
                                        [2] = Vector3.new(v.Character.HumanoidRootPart.Position.x, v.Character.HumanoidRootPart.Position.y, v.Character.HumanoidRootPart.Position.z)
                                    }
                                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("Event"):FireServer(unpack(args))
                                    task.wait()
                                end
                            end
                        end
                    end
                end
            end, {getgenv().MadLoopKillEnemy, false})
            madcitych1combat_Sec:NewButton("Kill All Enemy", "Terminated All Enemy!", function()
                if PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild("Buzzard") then
                    local lastpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local buzzardweusehere = PROTECTED_WORKSPACE.ObjectSelection.Buzzard
                    local returnplace = buzzardweusehere.PrimaryPart.CFrame*CFrame.new(0 , 5, 20)
                    buzzardweusehere:SetPrimaryPartCFrame(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0, 5, 5))
                    task.wait()
                    buzzardweusehere.DriveSeat:Sit(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid)
                    task.wait()
                    function isEnemyTeam(player)
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Police" and PROTECTED_PLAYERSERVICE.LocalPlayer.Team.Name ~= "Heroes" then
                            if player.Team.Name == "Police" or player.Team.Name == "Heroes" then
                                return true
                            end
                        else
                            if player.Team.Name ~= "Police" and player.Team.Name ~= "Heroes" then
                                return true
                            end
                        end
                        return false
                    end
                    local tasks = 0
                    for i, v in pairs(PROTECTED_PLAYERSERVICE:GetChildren()) do
                        if v.Character then
                            if v.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and isEnemyTeam(v) and v.Character.Humanoid.Health > 0 then
                                print("Ttarget Found: ", v.Name)
                                coroutine.wrap(function()
                                    tasks = tasks + 1
                                    for _ = 1, 100 do
                                        if not v or not v.Character or not v.Character:FindFirstChild("Humanoid") or not (v.Character.Humanoid.Health > 0) or isEnemyTeam(v) == false then
                                            break
                                        end
                                        local args = {
                                            [1] = "BM",
                                            [2] = Vector3.new(v.Character.HumanoidRootPart.Position.x, v.Character.HumanoidRootPart.Position.y, v.Character.HumanoidRootPart.Position.z)
                                        }
                                        PROTECTED_REPLICATEDSTORAGE:WaitForChild("Event"):FireServer(unpack(args))
                                        task.wait()
                                    end
                                    tasks = tasks - 1
                                end)()
                            end
                        end
                    end
                    task.wait(.25)
                    repeat
                        task.wait()
                        PROTECTED_WORKSPACE.ObjectSelection:WaitForChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle").DriveSeat:Sit(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid)
                    until tasks == 0 or not PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle") or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character or not PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid.Sit = false
                    task.wait(.05)
                    PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle"):SetPrimaryPartCFrame(returnplace)
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = lastpos
                    task.wait(5)
                    if PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle") then
                        if PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle").Name == PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle" then
                            PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name.."'s Vehicle"):Destroy()
                        end
                    end
                else
                    Window:NotificationBar("Pro Bacon", "Vehicle not found. Please wait until it respawns. We will notify you when it does.", 5)
                    repeat
                        task.wait(0.01)
                    until PROTECTED_WORKSPACE.ObjectSelection:FindFirstChild("Buzzard")
                    Window:NotificationBar("Pro Bacon", 'Vehicle respawned. You can now use "Kill All Enemy".', 2)
                end
            end)
            madcitych1combat_Sec:NewButton("No Camera Shake", "No shaking by explosives", function()
                local CameraShaker = require(PROTECTED_REPLICATEDSTORAGE.Modules.CameraShaker)
                CameraShaker.StartShake = function() return nil end
                CameraShaker.ShakeOnce = function() return nil end
                CameraShaker.ShakeSustain = function() return nil end
                CameraShaker.CameraShakeInstance = function() return nil end
                CameraShaker.Shake = function() return nil end
                CameraShaker.Start = function() return nil end
            end)
            madcitych1bypassmethod_Sec:NewDropdown("Bypass Method", "Teleport bypassing method", {"Instant", "Tween"}, function(method)
                getgenv().VARIABLEFOLDER.MADCITYBYPASSMETHOD = method
            end)
            madcitych1teleport_Sec:NewButton("Escape Prison (Go to Car)", "Go to base using vehicle", function()
                ProBaconFunction:VelocityTeleport(-885, 60, -2652.24854, 1500)
                task.wait(.5)
                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(.05)
                PROTECTED_VIRTUALINPUTMANAGER:SendKeyEvent(true, Enum.KeyCode.E, true, game)
            end)
            madcitych1teleport_Sec:NewButton("[Gun Shop]", "Go to gun shop", function()
                BypassTP(-1647, 43, 684)
            end)
            madcitych1teleport_Sec:NewButton("Prison Cell", "Go to prison cell", function()
                BypassTP(-814, 53, -3260)
            end)
            madcitych1teleport_Sec:NewButton("Prison Yard", "Go to prison yard", function()
                BypassTP(-1055, 53, -3085)
            end)
            madcitych1teleport_Sec:NewButton("Prison Out", "Go to outside of prison", function()
                BypassTP(-890, 54, -2669)
            end)
            madcitych1teleport_Sec:NewButton("Police Station", "Go to police station", function()
                BypassTP(-972, 53, -2952)
            end)
            madcitych1teleport_Sec:NewButton("[Chiminal Base]", "Go to criminal base", function()
                BypassTP(2131, 26, 418)
            end)
            madcitych1teleport_Sec:NewButton("Casino", "Go to casino", function()
                BypassTP(-1647, 43, 684)
            end)
            madcitych1teleport_Sec:NewButton("Bank", "Go to bank", function()
                BypassTP(753, 25, 489)
            end)
            madcitych1teleport_Sec:NewButton("Jewelry Store", "Go to jewelry store", function()
                BypassTP(-76, 87, 820)
            end)
            madcitych1teleport_Sec:NewButton("Club", "Go to club", function()
                BypassTP(1310, 18, -20)
            end)
            madcitych1teleport_Sec:NewButton("Pyramid", "Go to pyramid", function()
                BypassTP(-1047, 18, -505)
            end)
            madcitych1teleport_Sec:NewButton("[Airport]", "Go to airport", function()
                BypassTP(-2140, 28, -1406)
            end)
            madcitych1teleport_Sec:NewButton("Air Vehicles", "Go to where you can purchase air vehicles", function()
                BypassTP(-2409, 25, -1470)
            end)
            getgenv().VARIABLEFOLDER.TELEPORT_FUN = function()
                if getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT == "PLAYER" then
                    if getgenv().VARIABLEFOLDER.LASTTELEPORTVAR then
                        if getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local cf = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character.HumanoidRootPart.CFrame
                                BypassTP(cf.X, cf.Y, cf.Z)
                                if getgenv().VARIABLEFOLDER.MADCITYBYPASSMETHOD ~= "Instant" then
                                    cf = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character.HumanoidRootPart.CFrame
                                    BypassTP(cf.X, cf.Y, cf.Z)
                                    cf = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character.HumanoidRootPart.CFrame
                                    BypassTP(cf.X, cf.Y, cf.Z)
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR.Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    end
                end
                if getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT == "POSITION" then
                    local TARGETLOCATION = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR
                    if TARGETLOCATION then
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                BypassTP(TARGETLOCATION.X, TARGETLOCATION.Y, TARGETLOCATION.Z)
                            else
                                Window:NotificationBar("Pro Bacon", "Player has no primary part!", 2)
                            end
                        else
                            Window:NotificationBar("Pro Bacon", "Character not found!", 2)
                        end
                    else
                        Window:NotificationBar("Pro Bacon", "Invalid input!", 2)
                    end
                end
                if getgenv().VARIABLEFOLDER.LASTTELEPORTINPUT == "CFRAME" then
                    local TARGETLOCATION = getgenv().VARIABLEFOLDER.LASTTELEPORTVAR
                    if TARGETLOCATION then
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                BypassTP(TARGETLOCATION.X, TARGETLOCATION.Y, TARGETLOCATION.Z)
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = TARGETLOCATION
                            else
                                Window:NotificationBar("Pro Bacon", "Player has no primary part!", 2)
                            end
                        else
                            Window:NotificationBar("Pro Bacon", "Character not found!", 2)
                        end
                    else
                        Window:NotificationBar("Pro Bacon", "Invalid input!", 2)
                    end
                end
            end
            Window:NotificationBar("Pro Bacon", "Teleport Tab has been overwritten.", 2)
        end
        if game.PlaceVersion == 84 then
            LOAD_MADCITY_CH1()
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Universal%20Functions/OptionChooser"))().OptionChooser({
                Title = "Game Update Detection",
                Content = "A game update has been detected, potentially resulting in script patching or detection.  Do you wish to proceed with loading the Mad City: Chapter 1 tabs?",
                Button1 = "No.",
                Button2 = "Proceed.",
                Callback2 = LOAD_MADCITY_CH1
            })
        end
    
    elseif game.PlaceId == 21532277 then -- Notoriety Lobby
        local notorietylobby_Tab = Window:NewTab("Notoriety")
        local notorietylobby_Sec = notorietylobby_Tab:NewSection("Lobby")
        notorietylobby_Sec:NewButton("Unlock all skill tier", "This allows user to break the tier system.", function()
            for _, v in getgc(true) do
                if type(v) == "table" and rawget(v, "M") then
                    print("Found Skill Info")
                    for _, a in pairs(v) do
                        if type(a) == "table" then
                            for _, b in pairs(a) do
                                if type(b) == "table" then
                                    rawset(b, "Tier", 1)
                                end
                            end
                        end
                    end
                end
            end
        end)
        notorietylobby_Sec:NewButton("Quick join (For testing)", "This allows user to join the Jewelry Shop heist in seconds as a quick testing feature.", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("ClickTracker"):FireServer("Play")
            local args = {
                [1] = "Jewelry Shop",
                [2] = "Normal",
                [3] = 1,
                [4] = "EVERYONE",
                [5] = "STEALTH",
                [6] = true,
                [7] = false,
                [8] = 1, --plrs
                [9] = false,
                [10] = false,
                [11] = {},
                [12] = true
            }
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("MakeLobby"):InvokeServer(unpack(args))
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("ClickTracker"):FireServer("CreateLobby")
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("StartGame"):FireServer(PROTECTED_REPLICATEDSTORAGE:WaitForChild("Lobbies"):WaitForChild(PROTECTED_PLAYERSERVICE.LocalPlayer.Name))
        end)
        local NOTORIETY_HEIST = {}
        for i,_ in pairs(NOTORIETY_HEIST_TABLE) do
            table.insert(NOTORIETY_HEIST, i)
        end
        notorietylobby_Sec:NewDropdown("Join Heist", "This allows user to join any heist map.", NOTORIETY_HEIST, function(opt)
            Window:NotificationBar("Pro Bacon", "Teleporting to heist: "..tostring(opt))
            Window:NotificationBar("Pro Bacon", "May take some time soon. to load heist after join.")
            PROTECTED_TELEPORTSERVICE:Teleport(NOTORIETY_HEIST_TABLE[tostring(opt)]["PlaceID"])
        end)
    elseif NOTORIETYHEIST_PLACEID() ~= nil then -- Notoriety Heist
        coroutine.wrap(function()
            Window:NotificationBar("Pro Bacon", "Notoriety Heist: "..NOTORIETYHEIST_PLACEID())
        end)()
        local notorietyheistcriminal_Tab = Window:NewTab("Criminal")
        local notorietyheistcriminal_Sec = notorietyheistcriminal_Tab:NewSection("Criminal")
        local notorietyheistothers_Tab = Window:NewTab("Others")
        local notorietyheistpolice_Sec = notorietyheistothers_Tab:NewSection("Police")
        local notorietyheistesp_Sec = notorietyheistothers_Tab:NewSection("ESP")
        local notorietyheistother_Sec = notorietyheistothers_Tab:NewSection("Others")
        notorietyheistcriminal_Sec:NewToggle("Enable interactions", "", function(state)
            getgenv().enableinteractions = state
            if state then
                for _, v in pairs(game:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        coroutine.wrap(function()
                            local hb = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                                v.Enabled = true
                            end)
                            repeat
                                task.wait(0.001)
                            until not getgenv().enableinteractions
                            hb:Disconnect()
                        end)()
                    end
                end
                notorinter = PROTECTED_WORKSPACE.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("ProximityPrompt") then
                        coroutine.wrap(function()
                            local hb = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                                descendant.Enabled = true
                            end)
                            repeat
                                task.wait(0.001)
                            until not getgenv().enableinteractions
                            hb:Disconnect()
                        end)()
                    end
                end)
            else
                if notorinter then
                    notorinter:Disconnect()
                    notorinter = nil
                    for _, v in pairs(game:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then
                            v.Enabled = false
                        end
                    end
                end
            end
        end)
        getgenv().CONNECTFOLDER.NOTORIETYAUTOINTERACTION = getgenv().CONNECTFOLDER.NOTORIETYAUTOINTERACTION or nil
        notorietyheistcriminal_Sec:NewToggle("Auto Interaction", "This will auto interact with things nearby.", function(state)
            getgenv().VARIABLEFOLDER.NOTORIETYAUTOINTERACTION = state
            if state then
                for _, v in pairs(PROTECTED_WORKSPACE:GetDescendants()) do
                    if v.Name == "ProximityPrompt" and v.Parent:IsA("Part") then
                        coroutine.wrap(function()
                            while getgenv().VARIABLEFOLDER.NOTORIETYAUTOINTERACTION and task.wait(0.001) do
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v and v.Parent then
                                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                        if (v.Parent.Position-PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).magnitude <= 4 then
                                            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("StartInteraction"):FireServer(v)
                                            if v.HoldDuration == 0 then
                                                task.wait(0.01)
                                            else
                                                task.wait(v.HoldDuration)
                                            end
                                            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("CompleteInteraction"):FireServer(v)
                                        end
                                    end
                                end
                            end
                        end)()
                    end
                end
            end
        end, {getgenv().CONNECTFOLDER.NOTORIETYAUTOINTERACTION ~= nil, false})
        notorietyheistcriminal_Sec:NewToggle("Auto make yell", "This will make citizens or police yell.", function(state)
            if state then
                coroutine.wrap(function()
                    for _, v in pairs(PROTECTED_WORKSPACE.Citizens:GetChildren()) do
                        PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("PlayerYell"):FireServer({v})
                    end
                    for _,v in pairs(PROTECTED_WORKSPACE.Police:GetChildren()) do
                        PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("PlayerYell"):FireServer({v})
                    end
                end)()
                getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_CITIZENS = PROTECTED_WORKSPACE.Citizens.ChildAdded:Connect(function(v)
                    repeat
                        task.wait(0.001)
                    until v:FindFirstChildOfClass("Humanoid")
                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("PlayerYell"):FireServer({v})
                end)
                getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_POLICE = PROTECTED_WORKSPACE.Police.ChildAdded:Connect(function(v)
                    repeat
                        task.wait(0.001)
                    until v:FindFirstChildOfClass("Humanoid")
                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("PlayerYell"):FireServer({v})
                end)
            else
                if getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_CITIZENS ~= nil then
                    getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_CITIZENS:Disconnect()
                    getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_CITIZENS = nil
                end
                if getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_POLICE ~= nil then
                    getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_POLICE:Disconnect()
                    getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_POLICE = nil
                end
            end
        end, {getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_CITIZENS ~= nil or getgenv().CONNECTFOLDER.NOTORIETYAUTOYELL_POLICE ~= nil, false})
        notorietyheistcriminal_Sec:NewButton("INF Stamina", "This allows user to have unlimited stamina for jumping and running.", function()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.MaxStamina.Value = math.huge
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Stamina.Value = math.huge
        end)
        notorietyheistcriminal_Sec:NewButton("Get Ammo Box", "This allows users to gain ammo by getting ammobox.", function()
            for _, v in pairs(PROTECTED_WORKSPACE.AmmoDrops:GetChildren()) do
                if v.Name == "AmmoBox" and v:FindFirstChild("AmmoPart") then
                    coroutine.wrap(function()
                        local lastboxframe = v.AmmoPart.CFrame
                        v.AmmoPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart").CFrame
                        task.wait(0.25)
                        if v and v:FindFirstChild("AmmoPart") then
                            v.AmmoPart.CFrame = lastboxframe
                        end
                    end)()
                end
            end
        end)
        notorietyheistcriminal_Sec:NewButton("Go to Keycard", "This allows user to teleport to keycard.", function()
            for i, v in pairs(PROTECTED_WORKSPACE.Map:GetChildren()) do
                if v.Name == "KeyCard" then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:MoveTo(v.KeyCard.Position)
                end
            end
        end)
        notorietyheistcriminal_Sec:NewButton("Mod weapons", "This allows user to make their weapond one shot enemy.", function()
            for _, v in getgc(true) do
                if type(v) == "table" and rawget(v, "AmmoMax") then
                    rawset(v, "AmmoMax", 9e15)
                    rawset(v, "MagazineSize", 9e9)
                    rawset(v, "Damage", 9e9)
                    rawset(v, "Accuracy", 100)
                    rawset(v, "ReloadTime", 0.001)
                    rawset(v, "LongerReloadTime", 0.001)
                    rawset(v, "Damage", 99999)
                    rawset(v, "ReloadSequence", {})
                    rawset(v, "LongerReloadSequence", {})
                end
            end
        end)
        notorietyheistcriminal_Sec:NewKeybind("Move Bags To Loot Vehicle", "This allows user to secure their bag quickly.", Enum.KeyCode.X, function(state)
            for _, v in pairs(PROTECTED_WORKSPACE.Bags:GetChildren()) do
                v:MoveTo(PROTECTED_WORKSPACE.BagSecuredArea.FloorPart.Position)
            end
        end)
        notorietyheistcriminal_Sec:NewKeybind("Bring Bags", "This allows user to bring bags to character location.", Enum.KeyCode.Z, function(state)
            for _, v in pairs(PROTECTED_WORKSPACE.Bags:GetChildren()) do
                v:MoveTo(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position)
            end
        end)
        notorietyheistcriminal_Sec:NewButton("Get Body Bag", "This allows user to get body bags to put dead bodies inside.", function()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.BodyBags.Value = 100
        end)
        notorietyheistcriminal_Sec:NewButton("Get Cable Ties", "This allows user to get cable ties to tie NPCs.", function()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.CableTies.Value = 100
        end)
    
        notorietyheistpolice_Sec:NewToggle("Kill police NPC", "This allows user to kill police bots.", function(state)
            if state then
                getgenv().CONNECTFOLDER.NOTORIETYKILLPOLICENPC = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Police:GetChildren()) do
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                                PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("Damage"):FireServer("Damage",PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"),v:FindFirstChildOfClass("Humanoid"),v:FindFirstChildOfClass("Humanoid").Health,v:FindFirstChild("Head"),PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name,v:FindFirstChild("Head").Position)
                            end
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.NOTORIETYKILLPOLICENPC ~= nil then
                getgenv().CONNECTFOLDER.NOTORIETYKILLPOLICENPC:Disconnect()
                getgenv().CONNECTFOLDER.NOTORIETYKILLPOLICENPC = nil
            end
        end, {getgenv().CONNECTFOLDER.NOTORIETYKILLPOLICENPC ~= nil, false})
    
        getgenv().NotorStuffEsp = {
            Keys = false,
            Loots = false,
            Cameras = false,
            Cops = false,
            Citizens = false
        }
        local function NotorEsp(path, color)
            for _, v in pairs(path:GetChildren()) do
                if not v:FindFirstChild("Esp") then
                    local outline = Instance.new("Highlight", v)
                    outline.Name = "Esp"
                    outline.Adornee = v
                    outline.OutlineColor = color
                    outline.OutlineTransparency = 0
                    outline.FillTransparency = 0.9
                    outline.FillColor = color
                end
            end
            local fromadd = path.ChildAdded:Connect(function(v)
                if not v:FindFirstChild("Esp") then
                    local outline = Instance.new("Highlight", v)
                    outline.Name = "Esp"
                    outline.Adornee = v
                    outline.OutlineColor = color
                    outline.OutlineTransparency = 0
                    outline.FillTransparency = 0.9
                    outline.FillColor = color
                end
            end)
            PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="Pro Bacon"; Text="Not all objects will be highlighted due to the limit of numbers of highlight."; Duration=5;})
            return fromadd
        end
        notorietyheistesp_Sec:NewToggle("Key ESP", "", function(state)
            getgenv().NotorStuffEsp.Keys = state
            if state then coroutine.wrap(function()
                local fromadd = NotorEsp(PROTECTED_WORKSPACE.Map.Keys, Color3.new(1,1,0))
                repeat
                    task.wait(0.1)
                until not getgenv().NotorStuffEsp.Key
                fromadd:Disconnect()
                fromadd = nil
                for _, v in pairs(PROTECTED_WORKSPACE.Map.Keys:GetChildren()) do
                    if v:FindFirstChild("Esp") then
                        v:FindFirstChild("Esp"):Destroy()
                    end
                end
            end)() end
        end, {getgenv().NotorStuffEsp.Keys, false})
        notorietyheistesp_Sec:NewToggle("Loot ESP", "", function(state)
            getgenv().NotorStuffEsp.Loots = state
            if state then coroutine.wrap(function()
                local fromadd = NotorEsp(PROTECTED_WORKSPACE.Lootables, Color3.new(0,1,0))
                repeat
                    task.wait(0.1)
                until not getgenv().NotorStuffEsp.Loots
                fromadd:Disconnect()
                fromadd = nil
                for _, v in pairs(PROTECTED_WORKSPACE.Lootables:GetChildren()) do
                    if v:FindFirstChild("Esp") then
                        v:FindFirstChild("Esp"):Destroy()
                    end
                end
            end)() end
        end, {getgenv().NotorStuffEsp.Loots, false})
        notorietyheistesp_Sec:NewToggle("Camera ESP", "", function(state)
            getgenv().NotorStuffEsp.Cameras = state
            if state then coroutine.wrap(function()
                local fromadd = NotorEsp(PROTECTED_WORKSPACE.Cameras, Color3.new(1,0,0))
                repeat
                    task.wait(0.1)
                until not getgenv().NotorStuffEsp.Cameras
                fromadd:Disconnect()
                fromadd = nil
                for _, v in pairs(PROTECTED_WORKSPACE.Cameras:GetChildren()) do
                    if v:FindFirstChild("Esp") then
                        v:FindFirstChild("Esp"):Destroy()
                    end
                end
            end)() end
        end, {getgenv().NotorStuffEsp.Cameras, false})
        notorietyheistesp_Sec:NewToggle("Polices ESP", "", function(state)
            getgenv().NotorStuffEsp.Cops = state
            if state then coroutine.wrap(function()
                local fromadd = NotorEsp(PROTECTED_WORKSPACE.Police, Color3.new(1,0,0))
                repeat
                    task.wait(0.1)
                until not getgenv().NotorStuffEsp.Cops
                fromadd:Disconnect()
                fromadd = nil
                for _, v in pairs(PROTECTED_WORKSPACE.Police:GetChildren()) do
                    if v:FindFirstChild("Esp") then
                        v:FindFirstChild("Esp"):Destroy()
                    end
                end
            end)() end
        end, {getgenv().NotorStuffEsp.Cops, false})
        notorietyheistesp_Sec:NewToggle("Citizens ESP", "", function(state)
            getgenv().NotorStuffEsp.Citizens = state
            if state then coroutine.wrap(function()
                local fromadd = NotorEsp(PROTECTED_WORKSPACE.Citizens, Color3.new(0,0,1))
                repeat
                    task.wait(0.1)
                until not getgenv().NotorStuffEsp.Citizens
                fromadd:Disconnect()
                fromadd = nil
                for _, v in pairs(PROTECTED_WORKSPACE.Citizens:GetChildren()) do
                    if v:FindFirstChild("Esp") then
                        v:FindFirstChild("Esp"):Destroy()
                    end
                end
            end)() end
        end, {getgenv().NotorStuffEsp.Citizens, false})
        notorietyheistesp_Sec:NewButton("Highlight Camera Mornitor", "", function()
            local path = PROTECTED_WORKSPACE.Map.SecurityAreas.CameraFeed or nil
            if path then
                if path:FindFirstChild("Esp") then
                    path:FindFirstChild("Esp"):Destroy()
                end
                local outline = Instance.new("Highlight", path)
                outline.Name = "Esp"
                outline.Adornee = path
                outline.OutlineColor = Color3.new(0,1,1)
                outline.OutlineTransparency = 0
                outline.FillTransparency = 0.9
                outline.FillColor = Color3.new(0,1,1)
                PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="Pro Bacon"; Text="Not all objects will be highlighted due to the limit of numbers of highlight."; Duration=5;})
            end
        end)
        notorietyheistother_Sec:NewButton("Quick ready", "", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("RS_Package"):WaitForChild("Remotes"):WaitForChild("PlayerReady"):FireServer("Class 1",true)
        end)
        notorietyheistother_Sec:NewButton("Vote Restart", "", function()
            PROTECTED_REPLICATEDSTORAGE.RS_Package.Remotes.VoteReset:FireServer()
        end)
    elseif game.PlaceId == 9049840490 then -- Sonic Speed Simulator
        local sonicspeedsimulatorfarm_Tab = Window:NewTab("Farm")
        local sonicspeedsimulatorboss_Tab = Window:NewTab("Boss")
        local sonicspeedsimulatorfarm_Sec = sonicspeedsimulatorfarm_Tab:NewSection("Auto Farm")
        local sonicspeedsimulatorcollect_Sec = sonicspeedsimulatorfarm_Tab:NewSection("Collect")
        local sonicspeedsimulatorquest_Sec = sonicspeedsimulatorfarm_Tab:NewSection("Quest")
        local sonicspeedsimulatorboss_Sec = sonicspeedsimulatorboss_Tab:NewSection("Boss")
        local ON_TRIAL_STAT_UPDATE
        for _,v in pairs(PROTECTED_REPLICATEDSTORAGE.Knit.Services:GetChildren()) do
            if v.Name == "TrialService" and v:FindFirstChild("RE") then
                if v.RE:FindFirstChild("OnTrialStatUpdate") then
                    ON_TRIAL_STAT_UPDATE = v.RE:FindFirstChild("OnTrialStatUpdate")
                end
            end
        end
        
        getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOFARMSPEED = getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOFARMSPEED or 1
        sonicspeedsimulatorfarm_Sec:NewSlider("Farm Speed", "This allows user to scale auto farm speed.", 0, 20, function(val)
            getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOFARMSPEED = val
        end, getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOFARMSPEED)
        sonicspeedsimulatorfarm_Sec:NewToggle("Auto farm", "This allows player to gain orb, which is converted into xp.", function(state)
            if state then
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOFARM = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.Main.LargeHUD.Notifications.RewardToaster.Visible = false
                    PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.Main.SmallHUD.Notifications.RewardToaster.Visible = false
                    for _ = 1, getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOFARMSPEED do
                        if ON_TRIAL_STAT_UPDATE then
                            ON_TRIAL_STAT_UPDATE:FireServer("Emerald Hill", "1st", "BestRank", 2, false)
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOFARM ~= nil then
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOFARM:Disconnect()
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOFARM = nil
            end
        end, {getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOFARM ~= nil, false})
        sonicspeedsimulatorfarm_Sec:NewToggle("Rebirth", "This allows user to rebirth once per 5 seconds.", function(state)
            getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOREBIRTH = state
            coroutine.wrap(function()
                while getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOREBIRTH and task.wait(5) do
                    PROTECTED_REPLICATEDSTORAGE.Knit.Services.SSLevelingService.RF.AttemptRebirth:InvokeServer(true)
                end
            end)()
        end, getgenv().VARIABLEFOLDER.SONICSPEEDSIMULATORAUTOREBIRTH)
    
        sonicspeedsimulatorcollect_Sec:NewButton("Collect Destructible Objects", "This button allows user to gain destructible objects from the rendered map distance.", function()
            for _, v in pairs(PROTECTED_WORKSPACE.Map.Objects.Destructibles:GetChildren()) do
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("DestructibleService"):WaitForChild("RE"):WaitForChild("ProcessDObject"):FireServer(v.Name)
            end
        end)
        sonicspeedsimulatorcollect_Sec:NewButton("Collect Red Star Rings", "This button allows user to gain red stars from the current world.", function()
            for _, map in pairs(PROTECTED_WORKSPACE:GetChildren()) do
                if map:FindFirstChild("Objects") and map:FindFirstChild("Paths") then
                    for _, v in pairs(map.Objects.Spawners:GetDescendants()) do
                        if v.Name == "UniqueCurrencySpawn" and #v:GetChildren() > 0 then
                            local args = {
                                [1] = "RedStarRings",
                                [2] = string.sub(v:FindFirstChildWhichIsA("Model").Name, 13, string.len(v:FindFirstChildWhichIsA("Model").Name)),
                                [3] = 10,
                                [4] = v:FindFirstChildWhichIsA("Model").base.CFrame
                            }
                            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("WorldCurrencyService"):WaitForChild("RE"):WaitForChild("PickupUniqueWorldCurrency"):FireServer(unpack(args))
                        end
                    end
                end
            end
        end)
        sonicspeedsimulatorcollect_Sec:NewButton("Collect world currencies", "This button allows user to gain world currencies from the rendered map distance.", function()
            for _,v in pairs(PROTECTED_WORKSPACE["World Currencies"]:GetChildren()) do
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("WorldCurrencyService"):WaitForChild("RE"):WaitForChild("PickupWorldCurrency"):FireServer(v.Name)
            end
        end)
    
        sonicspeedsimulatorquest_Sec:NewButton("Step quest", "This button allows user to gain steps to complete step quests.", function()
            for _ = 1, 100 do
                PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CharacterService"):WaitForChild("RE"):WaitForChild("UpdateCharacterState"):FireServer({["CFrame"] = CFrame.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)), ["IsRunning"] = true})
                task.wait(1)
            end
        end)
        sonicspeedsimulatorquest_Sec:NewButton("Speed boost quest", "This button allows user to gain boost time soon. to complete boost quest.", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressService"):WaitForChild("RE"):WaitForChild("ClientLogProgress"):FireServer("BoostTime", 10)
        end)
        sonicspeedsimulatorquest_Sec:NewButton("Hover board boost quest", "This button allows user to gain hover board boost time soon. to complete hover board boost time soon. quest.", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressService"):WaitForChild("RE"):WaitForChild("ClientLogProgress"):FireServer("HoverboardBoostAmount", 10000, {["ZoneName"] = PROTECTED_PLAYERSERVICE.LocalPlayer:GetAttribute("ZoneName")})
        end)
        sonicspeedsimulatorquest_Sec:NewButton("Hover board trick quest", "This button allows user to complete hover board trick quest.", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressService"):WaitForChild("RE"):WaitForChild("ClientLogProgress"):FireServer("HoverboardTrickAmount",10000,{["ZoneName"] = "VerifyOnServer"})
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressService"):WaitForChild("RE"):WaitForChild("ClientLogProgress"):FireServer("SpecificHoverboardTrickAmount",10000,{["Hoverboard"] = "VerifyOnServer"})
        end)
        sonicspeedsimulatorquest_Sec:NewButton("Complete RailGrindPoints quest", "This button allows user to gain rail-graind points to complete railgrindpoints quest.", function()
            PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressService"):WaitForChild("RE"):WaitForChild("ClientLogProgress"):FireServer("RailGrindPoints",  math.huge, {["ZoneName"] = PROTECTED_PLAYERSERVICE.LocalPlayer:GetAttribute("ZoneName")})
        end)
        sonicspeedsimulatorquest_Sec:NewButton("Pop bubbles", "This button allows user to complete the pop bubbles task.", function()
            local args = {
                [1] = "5d863e5e-c5fb-4c70-bc5e-ea029f8e5d47"
            }
            
            
            
        end)
    
        sonicspeedsimulatorboss_Sec:NewToggle("Boss auto farm", "This allows player to be away from keyboard while farming boss.", function(state)
            if state then
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORBOSSFARM = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RF.JoinQueue:InvokeServer(PROTECTED_PLAYERSERVICE.LocalPlayer:GetAttribute("ZoneName"))
                    coroutine.wrap(function()
                        for i = 1,12 do
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
                            task.wait(.01)
                        end
                    end)()
                    for _ = 1,3 do
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                        task.wait(0.01)
                    end
                end)
            else
                if getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORBOSSFARM ~= nil then
                    getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORBOSSFARM:Disconnect()
                    getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORBOSSFARM = nil
                end
                PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RF.LeaveQueue:InvokeServer(PROTECTED_PLAYERSERVICE.LocalPlayer:GetAttribute("ZoneName"))
            end
        end)
        sonicspeedsimulatorboss_Sec:NewButton("Damage Generator", "Instanse damage all generators \nMotified from old ProBaconHub", function()
            for i = 1,12 do
                PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("GeneratorDamaged",{["Generator"]=i})
            end
        end)
        sonicspeedsimulatorboss_Sec:NewButton("Damage Boss", "Must damage all generators first \nMotified from old ProBaconHub", function()
            for i = 1,3 do
                PROTECTED_REPLICATEDSTORAGE.Knit.Services.BossBattleService.RE.UpdateBattleState:FireServer("Damage",{})
                task.wait(0.01)
            end
        end)
        sonicspeedsimulatorboss_Sec:NewToggle("Auto spin", "This allows user to spin boss rewards.", function(state)
            if state then
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOSPIN = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("GridLootService"):WaitForChild("RF"):WaitForChild("AttemptSpin"):InvokeServer("EmeraldHillBossBattle")
                end)
            elseif getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOSPIN ~= nil then
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOSPIN:Disconnect()
                getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOSPIN = nil
            end
        end, {getgenv().CONNECTFOLDER.SONICSPEEDSIMULATORAUTOSPIN ~= nil, false})
    elseif game.PlaceId == 428375933 then -- The legend of the bone sword RPG
        local thelegendoftheboneswordrpgfarm_Tab = Window:NewTab("Farm")
        local thelegendoftheboneswordrpgfarm_Sec = thelegendoftheboneswordrpgfarm_Tab:NewSection("Auto Farm")
        local thelegendoftheboneswordrpgmob_Sec = thelegendoftheboneswordrpgfarm_Tab:NewSection("Mob farm")
        local thelegendoftheboneswordrpgmob2_Sec = thelegendoftheboneswordrpgfarm_Tab:NewSection("Mob farm V2")
        local thelegendoftheboneswordrpgweapon_Tab = Window:NewTab("Weapon")
        local thelegnedoftheboneswordrpgweaponhitbox_Sec = thelegendoftheboneswordrpgweapon_Tab:NewSection("Weapon Hitbox")
        local thelegendoftheboneswordrpgsnowflakekatana_Tab = Window:NewTab("Snowflake Katana")
        local thelegendoftheboneswordrpgsnowflakekatana_candycane_Sec = thelegendoftheboneswordrpgsnowflakekatana_Tab:NewSection("Candy Cane")
        local thelegendoftheboneswordrpgsnowflakekatana_lonequest_Sec = thelegendoftheboneswordrpgsnowflakekatana_Tab:NewSection("Lone's Quests")
        local thelegendoftheboneswordrpgpillar_Tab = Window:NewTab("Pillar")
        local thelegendoftheboneswordrpgpillar_Sec = thelegendoftheboneswordrpgpillar_Tab:NewSection("Pillar")
        local thelegendoftheboneswordrpgteleport_Tab = Window:NewTab("Area Teleport")
        local thelegendoftheboneswordrpgteleport_Sec = thelegendoftheboneswordrpgteleport_Tab:NewSection("Area Teleport", true)
        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.HUD.Teleportation.Visible = true
        PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.HUD.QuickTravel.Visible = true
    
    
        local function MOB_VALID_FOR_KILL(v)
            if not v.HumanoidRootPart:FindFirstChild("HealthBar") then
                return true
            elseif v:FindFirstChild("HumanoidRootPart").HealthBar:FindFirstChild("Bar") then
                if v:FindFirstChild("HumanoidRootPart").HealthBar.Bar:FindFirstChild("Fill") then
                    if v:FindFirstChild("HumanoidRootPart").HealthBar.Bar.Fill.Size ~= UDim2.new(0, 0, 1, 0) then
                        return true
                    end
                end
            end
        end
        local function ChangeHitBoxlotbs(x,y,z)
            x,y,z = x or 1, y or 1, z or 1
            for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("Handle") then
                    v.Handle.Size = Vector3.new(x, y, z)
                    v.Handle.Transparency = 0.9
                end
            end
            for _, v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    v.Handle.CanCollide = false
                    v.Handle.Size = Vector3.new(x, y, z)
                    v.Handle.Transparency = 0.9
                end
            end
        end
        local MOBLIST = {}
        for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
            if table.find(MOBLIST, v.Name) == nil then
                table.insert(MOBLIST, v.Name)
            end
        end
        table.sort(MOBLIST)
        if getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX == nil or type(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX) ~= "table" then
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX = {}
            for _,v in pairs(MOBLIST) do
                table.insert(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX, {v, false})
            end
        end
        thelegendoftheboneswordrpgfarm_Sec:NewToggle("Auto Swing", "This allows player to swing sword without using an auto clicker.", function(state)
            if state then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOSWING = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer()
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOSWING ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOSWING:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOSWING = nil
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOSWING ~= nil, false})
        thelegendoftheboneswordrpgfarm_Sec:NewToggle("Auto Heal", "This allows player to get healed.", function(state)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOHEAL = state
            if state then
                coroutine.wrap(function()
                    while getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGAUTOHEAL and PROTECTED_RUNSERVICE.Heartbeat:Wait() do
                        pcall(function()
                            PROTECTED_WORKSPACE.Parts.Decoration["Healing Pond"].Pad.Transparency = 1
                            PROTECTED_WORKSPACE.Parts.Decoration["Healing Pond"].Pad.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("BasePart").CFrame
                            PROTECTED_RUNSERVICE.Heartbeat:Wait()
                            PROTECTED_WORKSPACE.Parts.Decoration["Healing Pond"].Pad.CFrame = CFrame.new(169.469955, 3.51000667, -10.5200033, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                            PROTECTED_WORKSPACE.Parts.Decoration["Healing Pond"].Pad.Transparency = 0
                            PROTECTED_RUNSERVICE.Heartbeat:Wait()
                        end)
                    end
                end)()
            end
        end)
        thelegendoftheboneswordrpgfarm_Sec:NewToggle("Lvl 1 ~ 100 mobs", "This allows user to grind from lvl 1 to lvl 100 mobs.", function(state)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLVL_1_100_MOBS = state
            coroutine.wrap(function()
                while getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLVL_1_100_MOBS and PROTECTED_RUNSERVICE.Heartbeat:Wait() do
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v:FindFirstChild("SETTINGS") and v:FindFirstChild("HumanoidRootPart") then
                            if v.SETTINGS.Lvl.Value <= 125 and MOB_VALID_FOR_KILL(v) and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                if math.random(1, 10) == 10 then
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                end
                            end
                        end
                    end
                end
            end)()
        end, {getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLVL_1_100_MOBS, false})
        thelegendoftheboneswordrpgfarm_Sec:NewToggle("All mobs", "This allows user to grind from all mobs.", function(state)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLVL_ALL_MOBS = state
            coroutine.wrap(function()
                while getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLVL_ALL_MOBS and PROTECTED_RUNSERVICE.Heartbeat:Wait() do
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v:FindFirstChild("SETTINGS") and v:FindFirstChild("HumanoidRootPart") then
                            if MOB_VALID_FOR_KILL(v) and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                if math.random(1, 10) == 10 then
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                end
                            end
                        end
                    end
                end
            end)()
        end, {getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLVL_ALL_MOBS, false})
        thelegendoftheboneswordrpgmob_Sec:NewDropdown("Weapon type", "This allows user to choose their weapon type.", {"Sword", "Staff/Bow"}, function(opt)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONTYPE = opt
        end)
        thelegendoftheboneswordrpgmob_Sec:NewTextBox("Mob", "This allows user to input the name of the mob.", function(txt)
            local FOUNDMOB = false
            for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                if string.find(v.Name, txt) ~= nil then
                    getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARMINPUT = v.Name
                    FOUNDMOB = true
                    break
                end
            end
            if not FOUNDMOB then
                Window:NotificationBar("Pro Bacon", "Mob not found.")
            end
        end)
        thelegendoftheboneswordrpgmob_Sec:NewDropdown("Mob", "This allows user to input the name of the mob.", MOBLIST, function(opt)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARMINPUT = opt
        end)
        thelegendoftheboneswordrpgmob_Sec:NewToggle("Mob farm", "This allows user to grind from a mob.", function(state)
            if state then
                while not PROTECTED_PLAYERSERVICE.LocalPlayer.Character do
                    PROTECTED_RUNSERVICE.Heartbeat:Wait()
                end
                while not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
                    PROTECTED_RUNSERVICE.Heartbeat:Wait()
                end
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARMINPUT and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if v:FindFirstChild("HumanoidRootPart") and MOB_VALID_FOR_KILL(v) and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                if getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONTYPE == "Staff/Bow" then
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                else
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                                    v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                end
                            end
                        end
                    end
                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position)
                end)
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM ~= nil then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM = nil
                end
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM ~= nil, false})
        thelegendoftheboneswordrpgmob_Sec:NewButton("Print all mob", "This allows user to see all mob's name.", function()
            for _,v in pairs(MOBLIST) do
                print(v)
            end
        end)
        local mobfarmv2checkbox = thelegendoftheboneswordrpgmob2_Sec:NewCheckbox("Mob", "This allows user to input the name of the mob.", getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX, function(result)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2_FILTER = {}
            for _,v in pairs(result) do
                if v[2] then
                    table.insert(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2_FILTER, v[1])
                end
            end
        end)
        PROTECTED_WORKSPACE.Enemies.ChildAdded:Connect(function(child)
            if not table.find(MOBLIST, child.Name) then
                table.insert(MOBLIST, child.Name)
                table.insert(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX, {child.Name, false})
                mobfarmv2checkbox:Update(nil, nil, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGCHECKBOX)
            end
        end)
        thelegendoftheboneswordrpgmob2_Sec:NewToggle("Mob farm V2", "This allows user to grind from a mob.", function(state)
            if state then
                while not PROTECTED_PLAYERSERVICE.LocalPlayer.Character do
                    PROTECTED_RUNSERVICE.Heartbeat:Wait()
                end
                while not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
                    PROTECTED_RUNSERVICE.Heartbeat:Wait()
                end
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2 = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if table.find(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2_FILTER, v.Name) and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if v:FindFirstChild("HumanoidRootPart") and MOB_VALID_FOR_KILL(v) and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                if getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONTYPE == "Staff/Bow" then
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                else
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                                    v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                end
                            end
                        end
                    end
                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Position)
                end)
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2 ~= nil then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2 = nil
                end
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOBFARM_V2 ~= nil, false})
        thelegendoftheboneswordrpgmob2_Sec:NewToggle("Hide notifications", "This allows user to hide notifications.", function(state)
            PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.Notifications.Notifications.Visible = not state
        end, {not PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.Notifications.Notifications.Visible, false})
    
        thelegnedoftheboneswordrpgweaponhitbox_Sec:NewToggle("Hit all mobs", "This allows user to hit all mobs on swing.", function(state)
            if state then
                local function HIT_ALL_MOBS()
                    if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED then
                        getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED:Disconnect()
                        getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED = nil
                    end
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.ChildAdded:Connect(function(v)
                        if v:IsA("Tool") then
                            getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TRANSMITTERADDED = v:WaitForChild("Handle").ChildAdded:Connect(function(child)
                                if child:IsA("TouchTransmitter") then
                                    for _,a in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                                        if a.HumanoidRootPart then
                                            local lastPos = a.HumanoidRootPart.CFrame
                                            coroutine.wrap(function()
                                                while MOB_VALID_FOR_KILL(a) and child and a.HumanoidRootPart and PROTECTED_RUNSERVICE.Heartbeat:Wait() do
                                                    PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.Notifications.MakeNotification.Enabled = false
                                                    a.HumanoidRootPart.CFrame = child.Parent.CFrame
                                                    task.wait(0.00001)
                                                    a.HumanoidRootPart.CFrame = lastPos
                                                    task.wait(0.00001)
                                                end
                                                PROTECTED_PLAYERSERVICE.LocalPlayer.PlayerGui.Notifications.MakeNotification.Enabled = true
                                            end)()
                                        end
                                    end
                                end
                            end)
                        end
                    end)
                end
                HIT_ALL_MOBS()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_CHILDADDED = PROTECTED_PLAYERSERVICE.LocalPlayer.CharacterAdded:Connect(HIT_ALL_MOBS)
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_TOOLADDED = nil
                end
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_CHILDADDED then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_CHILDADDED:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGHITALLMOBS_CHILDADDED = nil
                end
            end
        end)
        local THELEGENDOFTHEBONESWORDRPG_HITBOX_X = thelegnedoftheboneswordrpgweaponhitbox_Sec:NewSlider("Hitbox X", "This allows user to change their weapon's hitbox size (X)", 1, 1000, function(var)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X = var
            ChangeHitBoxlotbs(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z)
        end, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X)
        local THELEGENDOFTHEBONESWORDRPG_HITBOX_Y = thelegnedoftheboneswordrpgweaponhitbox_Sec:NewSlider("Hitbox Y", "This allows user to change their weapon's hitbox size (Y)", 1, 1000, function(var)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y = var
            ChangeHitBoxlotbs(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z)
        end, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y)
        local THELEGENDOFTHEBONESWORDRPG_HITBOX_Z = thelegnedoftheboneswordrpgweaponhitbox_Sec:NewSlider("Hitbox Z", "This allows user to change their weapon's hitbox size (Z)", 1, 1000, function(var)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z = var
            ChangeHitBoxlotbs(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z)
        end, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z)
        thelegnedoftheboneswordrpgweaponhitbox_Sec:NewTextBox("Size (type: Vector3)", "This allows user to change their weapon's hitbox.", function(txt)
            local WEAPONHITBOX = ProBaconFunction:StringToVector3(txt)
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X = WEAPONHITBOX.X
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y = WEAPONHITBOX.Y
            getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z = WEAPONHITBOX.Z
            THELEGENDOFTHEBONESWORDRPG_HITBOX_X:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X)
            THELEGENDOFTHEBONESWORDRPG_HITBOX_Y:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y)
            THELEGENDOFTHEBONESWORDRPG_HITBOX_Z:Update(nil, nil, nil, nil, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z)
            ChangeHitBoxlotbs(getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_X, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Y, getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGWEAPONHITBOX_Z)
        end)
    
        thelegendoftheboneswordrpgsnowflakekatana_candycane_Sec:NewToggle("Notify when Candy Cane spawns", "This allows user to get notified if a new candy cane has spawned.", function(state)
            if state then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSNOWFLAKEKATANA_NOTIFYCANDYCANE = PROTECTED_WORKSPACE.Parts.Decoration.ChosenToUse.Model.ChildAdded:Connect(function(child)
                    task.wait(1)
                    if child:IsA("MeshPart") and child:FindFirstChildWhichIsA("ProximityPrompt") then
                        for _ = 1, 10 do
                            Window:NotificationBar("Pro Bacon", "A new candy cane spawned!")
                            task.wait(0.5)
                        end
                    end
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSNOWFLAKEKATANA_NOTIFYCANDYCANE ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSNOWFLAKEKATANA_NOTIFYCANDYCANE:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSNOWFLAKEKATANA_NOTIFYCANDYCANE = false
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSNOWFLAKEKATANA_NOTIFYCANDYCANE ~= nil, false})
        thelegendoftheboneswordrpgsnowflakekatana_candycane_Sec:NewButton("Teleport to Candy Cane", "This allows user to teleport ot candy cane.", function()
            for _, v in pairs(PROTECTED_WORKSPACE.Parts.Decoration.ChosenToUse.Model:GetChildren()) do
                if v:IsA("MeshPart") and v:FindFirstChildWhichIsA("ProximityPrompt") then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
            end
        end)
        thelegendoftheboneswordrpgsnowflakekatana_candycane_Sec:NewButton("Bring Candy Cane", "This allows user to teleport ot candy cane.", function()
            for _, v in pairs(PROTECTED_WORKSPACE.Parts.Decoration.ChosenToUse.Model:GetChildren()) do
                if v:IsA("MeshPart") and v:FindFirstChildWhichIsA("ProximityPrompt") then
                    v.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    
        thelegendoftheboneswordrpgsnowflakekatana_lonequest_Sec:NewButton("Skip Lone prox holding duration", "This allows user to skip the process of holding the prox.", function()
            PROTECTED_WORKSPACE.Secrets.Wha_MAGICTWIG.lonewolfclasher.HumanoidRootPart.ProximityPrompt.HoldDuration = 0
            PROTECTED_WORKSPACE.Secrets.LonesVans.lonewolfclasher.HumanoidRootPart.Prox.HoldDuration = 0
            Window:NotificationBar("Pro Bacon", "Hey Lone, how about picking up the pace a bit when you yap?", 2)
        end)
        thelegendoftheboneswordrpgsnowflakekatana_lonequest_Sec:NewButton("Billy", "This allows user to teleport to Billy, for one of the lone's quest.", function()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.Secrets.LonesVans.Billy.WorldPivot
        end)
        thelegendoftheboneswordrpgsnowflakekatana_lonequest_Sec:NewButton("Get Lone's UserId", "This allows user to get the secret code for one of the lone's quest.", function()
            setclipboard("360470140")
            Window:NotificationBar("Pro Bacon", "The yapping dude's userId is \"360470140\". Also copied to clipboard!", 2)
        end)
        thelegendoftheboneswordrpgsnowflakekatana_lonequest_Sec:NewToggle("Vienyx", "This allows user to loop kill Vienyx for one of the lone's quest. (Soul)", function(state)
            if state then
                while not PROTECTED_PLAYERSERVICE.LocalPlayer.Character do
                    PROTECTED_RUNSERVICE.Heartbeat:Wait()
                end
                while not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
                    PROTECTED_RUNSERVICE.Heartbeat:Wait()
                end
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPG_SNOWFlAKE_VIENYX = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for i,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "Vienyx" and PROTECTED_PLAYERSERVICE.LocalPlayer.Character then
                            if v:FindFirstChild("HumanoidRootPart") and MOB_VALID_FOR_KILL(v) and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                            end
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPG_SNOWFlAKE_VIENYX ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPG_SNOWFlAKE_VIENYX:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPG_SNOWFlAKE_VIENYX = nil
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPG_SNOWFlAKE_VIENYX ~= nil, false})
        thelegendoftheboneswordrpgsnowflakekatana_lonequest_Sec:NewButton("Find his long lost item", "This button allows user to find lone's long lost item, for one of line's quest.", function()
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.Secrets.LonesVans.Scythe.WorldPivot
            Window:NotificationBar("BRUH", "Yeah this is it...")
        end)
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Fulmen Titan [Lightning Pillar]", "This allows user to complete lighting pillar.", function(state)
            if state then
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Jetstream") or PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Jetstream") then
                    getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR_LASTPLRPOS = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                            if v.Name == "Titan Fulmen" then
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Jetstream") then
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Jetstream").Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                                end
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Jetstream") then
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                end
                            end
                        end
                    end)
                else
                    Window:NotificationBar("Pro Bacon", "You don't own Jetstream!")
                end
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR ~= nil then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR = nil
                end
                if getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR_LASTPLRPOS ~= nil then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR_LASTPLRPOS
                end
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGLIGHTNINGPILLAR ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Ice Titan [Ice Pillar]", "This allows user to complete ice pillar.", function(state)
            if state then
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGICEPILLAR = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "Titan Glacies" then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                            end
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGICEPILLAR ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGICEPILLAR:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGICEPILLAR = nil
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGICEPILLAR ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Trials and Bone Lord's [Fire Pillar]", "This allows user to complete fire pillar.", function(state)
            if state then
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFIREPILLAR = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "Giancarlo" or v.Name == "Ajax" or v.Name == "Hazarmaveth" or v.Name == "The Bone Lord's Son" or v.Name == "The Bone Lord" or v.Name == "The Currupted  Bone Lord [FINAL BOSS]" or v.Name == "I Bone Lord" then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                            end
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFIREPILLAR ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFIREPILLAR:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFIREPILLAR = nil
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFIREPILLAR ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewButton("Collect Water Orb [Water Pillar]", "This allows user to complete water pillar.", function()
            for _, v in pairs(PROTECTED_WORKSPACE.WaterOrbs:GetChildren()) do
                local lastpos = v.CFrame
                while v and v.Parent do
                    v.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                    task.wait(.1)
                    if v then
                        v.CFrame = lastpos
                    end
                    task.wait(.1)
                end
            end
        end)
        thelegendoftheboneswordrpgpillar_Sec:NewButton("Collect 1 Water Orb [Water Pillar]", "This allows user to collect one water orb only to avoid suspicion", function()
            PROTECTED_WORKSPACE.WaterOrbs:FindFirstChild("Orb").CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
        end)
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Solis [Solar Pillar]", "This allows user to complete solar pillar.", function(state)
            if state then
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Wrath of the Sea") or PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Wrath of the Sea") then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                        for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                            if v.Name == "Titan Solis" then
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Wrath of the Sea") then
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:FindFirstChild("Wrath of the Sea").Parent = PROTECTED_PLAYERSERVICE.LocalPlayer.Character
                                end
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("Wrath of the Sea") then
                                    v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                end
                            end
                        end
                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                    end)
                else
                    Window:NotificationBar("Pro Bacon", "You don't own Wrath of the Sea!")
                end
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR ~= nil then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR = nil
                end
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("The Sun and Flares [Solar Pillar]", "This allows user to complete solar pillar.", function(state)
            if state then
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR_2 = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "The Sun" or v.Name == "Flare" then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                            end
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR_2 ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR_2:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR_2 = nil
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGSOLARPILLAR_2 ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Titans [Void Pillar]", "This allows user to complete void pillar.", function(state)
            if state then
                local plrpos = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGVOIDPILLAR = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "Titan Volcanus" or v.Name == "Titan Fulmen" or v.Name == "Titan Glacies" or v.Name == "Titan Terra" or v.Name == "Titan Venenum" or v.Name == "Titan Inani" or v.Name == "Titan Vortex" or v.Name == "Titan Aureus" or v.Name == "Titan Vitreus" or v.Name == "Titan Solis" or v.Name == "Titan Duplex" or v.Name == "Titan Subtus" or v.Name == "Titan Mars" or v.Name == "Titan Vita" then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                v.HumanoidRootPart.CFrame = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Handle.CFrame
                                PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                            end
                        end
                    end
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = plrpos
                end)
            elseif getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGVOIDPILLAR ~= nil then
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGVOIDPILLAR:Disconnect()
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGVOIDPILLAR = nil
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGVOIDPILLAR ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Mother of Chaos [Void Pillar]", "This allows user to complete void pillar.", function(state)
            if state then
                getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS_LASTPLRPOS = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "Mother of Chaos" then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and MOB_VALID_FOR_KILL(v) then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v["Right Arm"].CFrame
                                PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v["Right Arm"].Position)
                            elseif getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS_LASTPLRPOS ~= nil then
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS_LASTPLRPOS
                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 5, 0)
                            end
                            
                        end
                    end
                end)
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS ~= nil then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS = nil
                end
                if getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS_LASTPLRPOS ~= nil then
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS_LASTPLRPOS
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 5, 0)
                end
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGMOTHEROFCHAOS ~= nil, false})
        thelegendoftheboneswordrpgpillar_Sec:NewButton("Go To Portal", "This allows user to teleport to the portal.", function ()
            if PROTECTED_WORKSPACE.GrandPortal then
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.GrandPortal.TeleporterPart.CFrame
            end
        end)
        thelegendoftheboneswordrpgpillar_Sec:NewToggle("Aureum Statera [Final Pillar Boss]", "This allows user to complete the final pillar boss.", function(state)
            if state then
                getgenv().VARIABLEFOLDER.THELEGENDOFTHEBONESWORDRPGFINALPILLARBOSS_LASTPLRPOS = PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame
                getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFINALPILLARBOSS = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    local isthereelementpillar = false
                    for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                        if v.Name == "ElementalPillar" then
                            if v:FindFirstChild("HumanoidRootPart") and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                if not v.HumanoidRootPart:FindFirstChild("HealthBar") then
                                    isthereelementpillar = true
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                elseif v:FindFirstChild("HumanoidRootPart").HealthBar.Bar.Fill.Size ~= UDim2.new(0, 0, 1, 0) then
                                    isthereelementpillar = true
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                end
                            end
                        end
                    end
                    if not isthereelementpillar then 
                        for _,v in pairs(PROTECTED_WORKSPACE.Enemies:GetChildren()) do
                            if v.Name == "Aureum Statera" then
                                if v:FindFirstChild("HumanoidRootPart")  and PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                    if not v.HumanoidRootPart:FindFirstChild("HealthBar") then
                                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                    elseif v:FindFirstChild("HumanoidRootPart").HealthBar.Bar.Fill.Size ~= UDim2.new(0, 0, 1, 0) then
                                        isthereelementpillar = true
                                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        PROTECTED_REPLICATEDSTORAGE.Remotes.UseItem:FireServer(v.HumanoidRootPart.Position)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFINALPILLARBOSS ~= nil then
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFINALPILLARBOSS:Disconnect()
                    getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFINALPILLARBOSS = nil
                end
                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 5, 0)
            end
        end, {getgenv().CONNECTFOLDER.THELEGENDOFTHEBONESWORDRPGFINALPILLARBOSS ~= nil, false})
    
        local THELEGENDOFTHEBONESWORDRPGAREA = {}
        for _,v in pairs(PROTECTED_WORKSPACE.Areas:GetChildren()) do
            table.insert(THELEGENDOFTHEBONESWORDRPGAREA, v.Name)
        end
        local THELEGENDOFTHEBONESWORDRPG_AREATELEPORT = thelegendoftheboneswordrpgteleport_Sec:NewDropdown("Area Teleport", "This allows user to teleport to areas in the game.", THELEGENDOFTHEBONESWORDRPGAREA, function(opt)
            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.HumanoidRootPart.CFrame = PROTECTED_WORKSPACE.Areas:FindFirstChild(opt).WorldPivot
        end)
        THELEGENDOFTHEBONESWORDRPG_AREATELEPORT:SortBy("Name")
    elseif game.PlaceId == 17262338236 then -- Wordle
        local wordle_Tab = Window:NewTab("Wordle")
        local wordle_Sec = wordle_Tab:NewSection("Wordle")
        local wordlecheat = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/ProBaconFunctions/refs/heads/main/Game%20Functions/Wordle"))()
        wordlecheat = wordlecheat.Unpack("ProBaconHub")
        wordle_Sec:NewToggle("Auto Farm", "This allows user to farm correct answer.", function(state)
            getgenv().VARIABLEFOLDER.WORDLEAUTOFARM = state
            wordlecheat.AUTOANSWER(state)
        end)
        wordle_Sec:NewButton("Auto Answer", "This allows user to answer the correct word.", function()
            wordlecheat.ANSWER()
        end)
        wordle_Sec:NewButton("Get Answer", "This allows user to get the correct word.", function()
            wordlecheat.GETANSWER()
        end)
        wordle_Sec:NewButton("Get 500 Diamonds", "This allows user to get 500 diamons.\nCan be repeated.", function()
            wordlecheat.GET500DIAMONDS()
        end)
        wordle_Sec:NewTextBox("Set diamonds", "This allows user to set the diamonds.", function(txt)
            wordlecheat.SETDIAMONDS(txt)
        end)
    elseif game.PlaceId == 1240123653 or game.PlaceId == 1632210982 then -- Zombie Attack
        local zombieattack_Tab = Window:NewTab("Zombie Attack")
        local zombieattackfarm_Sec = zombieattack_Tab:NewSection("Auto Farm")
        local zombieattackfarmv2_Sec = zombieattack_Tab:NewSection("Auto Farm V2")
        local zombieattackweapon_Sec = zombieattack_Tab:NewSection("Weapon")
    
        zombieattackfarm_Sec:NewToggle("Auto Kill", "This allows user to kill enemy mobs.", function(state)
            if state then
                getgenv().CONNECTFOLDER.ZOMBIEATTACKAUTOKILL = PROTECTED_RUNSERVICE.Heartbeat:Connect(function()
                    coroutine.wrap(function()
                        for _,v in pairs(PROTECTED_WORKSPACE.enemies:GetChildren()) do
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                                    local killmob = {
                                        [1] = {
                                            ["Normal"] = Vector3.new(-0.7673799991607666, 0.0004944514366798103, -0.6411924362182617),
                                            ["Direction"] = (PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Origin.Position-v:FindFirstChild("Head").Position).Unit,
                                            ["Name"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name,
                                            ["Hit"] = v:FindFirstChild("Head"),
                                            ["Origin"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Origin.Position,
                                            ["Pos"] = v:FindFirstChild("Head").Position
                                        }
                                    }
                                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("Gun"):FireServer(unpack(killmob))
                                end
                            end
                        end
                    end)()
                    coroutine.wrap(function()
                        for _,v in pairs(PROTECTED_WORKSPACE.BossFolder:GetChildren()) do
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                                    local killmob = {
                                        [1] = {
                                            ["Normal"] = Vector3.new(-0.7673799991607666, 0.0004944514366798103, -0.6411924362182617),
                                            ["Direction"] = (PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Origin.Position-v:FindFirstChild("Head").Position).Unit,
                                            ["Name"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name,
                                            ["Hit"] = v:FindFirstChild("Head"),
                                            ["Origin"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Origin.Position,
                                            ["Pos"] = v:FindFirstChild("Head").Position
                                        }
                                    }
                                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("Gun"):FireServer(unpack(killmob))
                                end
                            end
                        end
                    end)()
                end)
            elseif getgenv().CONNECTFOLDER.ZOMBIEATTACKAUTOKILL ~= nil then
                getgenv().CONNECTFOLDER.ZOMBIEATTACKAUTOKILL:Disconnect()
                getgenv().CONNECTFOLDER.ZOMBIEATTACKAUTOKILL = nil
            end
        end, {getgenv().CONNECTFOLDER.ZOMBIEATTACKAUTOKILL ~= nil, false})
        zombieattackfarmv2_Sec:NewSlider("CD per shot (ms)", "This allows user to set the cooldown time soon. for auto kill v2", 1, 1000, function(var)
            getgenv().VARIABLEFOLDER.ZOMBIEATTACKAUTOKILLV2_COOLDOWN = var/1000
        end, 100)
        zombieattackfarmv2_Sec:NewToggle("Auto Kill V2", "This allows user to kill enemy mobs.", function(state)
            getgenv().VARIABLEFOLDER.ZOMBIEATTACKMOBFARMV2 = state
            if state then
                local TARGETZOMBIE
                coroutine.wrap(function()
                    while getgenv().VARIABLEFOLDER.ZOMBIEATTACKMOBFARMV2 and task.wait(getgenv().VARIABLEFOLDER.ZOMBIEATTACKAUTOKILLV2_COOLDOWN or 0.1) do
                        if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and TARGETZOMBIE then
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and TARGETZOMBIE:FindFirstChild("Head") then
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunController") then
                                    local killmob = {
                                        [1] = {
                                            ["Normal"] = Vector3.new(-0.7673799991607666, 0.0004944514366798103, -0.6411924362182617),
                                            ["Direction"] = (PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Origin.Position-TARGETZOMBIE:FindFirstChild("Head").Position).Unit,
                                            ["Name"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name,
                                            ["Hit"] = TARGETZOMBIE:FindFirstChild("Head"),
                                            ["Origin"] = PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Origin.Position,
                                            ["Pos"] = TARGETZOMBIE:FindFirstChild("Head").Position
                                        }
                                    }
                                    PROTECTED_REPLICATEDSTORAGE:WaitForChild("Gun"):FireServer(unpack(killmob))
                                end
                            end
                        else
                            PROTECTED_RUNSERVICE.Heartbeat:Wait()
                        end
                    end
                end)()
                coroutine.wrap(function()
                    while getgenv().VARIABLEFOLDER.ZOMBIEATTACKMOBFARMV2 and PROTECTED_RUNSERVICE.Heartbeat:Wait() do
                        for _,v in pairs(PROTECTED_WORKSPACE.BossFolder:GetChildren()) do
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                                while getgenv().VARIABLEFOLDER.ZOMBIEATTACKMOBFARMV2 and PROTECTED_RUNSERVICE.Heartbeat:Wait() and v.PrimaryPart and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health > 0.01 and PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") and v and v.Parent do
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 10, 10)
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(0, 1, 0)
                                    TARGETZOMBIE = v --.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10)
                                    if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and TARGETZOMBIE:FindFirstChild("Head") then
                                        if not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunController") then
                                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:UnequipTools()
                                            for _,v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                                                if v:IsA("Tool") and v:FindFirstChild("GunController") then
                                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(v)
                                                    break
                                                end
                                            end
                                        end
                                    else
                                        for _,v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                                            if v:IsA("Tool") and v:FindFirstChild("GunController") then
                                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(v)
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        for _,v in pairs(PROTECTED_WORKSPACE.enemies:GetChildren()) do
                            if PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") then
                                while getgenv().VARIABLEFOLDER.ZOMBIEATTACKMOBFARMV2 and PROTECTED_RUNSERVICE.Heartbeat:Wait() and v.PrimaryPart and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health > 0.01 and PROTECTED_PLAYERSERVICE.LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") and v and v.Parent do
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame*CFrame.new(0, 10, 10)
                                    PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(0, 1, 0)
                                    TARGETZOMBIE = v --.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10)
                                end
                                if PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and TARGETZOMBIE:FindFirstChild("Head") then
                                    if not PROTECTED_PLAYERSERVICE.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunController") then
                                        PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:UnequipTools()
                                        for _,v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                                            if v:IsA("Tool") and v:FindFirstChild("GunController") then
                                                PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(v)
                                                break
                                            end
                                        end
                                    end
                                else
                                    for _,v in pairs(PROTECTED_PLAYERSERVICE.LocalPlayer.Backpack:GetChildren()) do
                                        if v:IsA("Tool") and v:FindFirstChild("GunController") then
                                            PROTECTED_PLAYERSERVICE.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                        PROTECTED_RUNSERVICE.Heartbeat:Wait()
                    end
                end)()
            end
        end, {getgenv().VARIABLEFOLDER.ZOMBIEATTACKMOBFARMV2, false})
        zombieattackweapon_Sec:NewTextBox("FireRate", "This allows user to change their weapon's firerate.", function(txt)
            getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_FIRERATE = tonumber(txt)
        end)
        zombieattackweapon_Sec:NewTextBox("BulletsPerShot", "This allows user to change their weapon's bullets per shot.", function(txt)
            getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_BULLETSPERSHOT = tonumber(txt)
        end)
        zombieattackweapon_Sec:NewTextBox("Spread", "This allows user to change their weapon's spread value.", 0, 100, function(var)
            getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_SPREAD = var
        end, getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_SPREAD)
        zombieattackweapon_Sec:NewButton("Apply to weapon", "This allows user to push their settings in their weapon.", function()
            for _,v in getgc(true) do
                if type(v) == "table" and rawget(v, "M16") and rawget(v, "Golden Rifle") then
                    print('e')
                    for _,a in pairs(v) do
                        a.Firerate = getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_FIRERATE
                        a.BulletsPerShot = getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_BULLETSPERSHOT
                        if a.Spread ~= nil then
                            a.Spread.Min = 0
                            a.Spread.Max = getgenv().VARIABLEFOLDER.ZOMBIEATTACKWEAPONMOD_SPREAD
                        end
                    end
                end
            end            
        end)
    else
        SUPPORTED = false
    end
    if SUPPORTED then
        Window:NotificationBar("Pro Bacon", "Supported game detected", 2)
    end

    coroutine.wrap(function()
        local CURRENTID = getgenv().PROBACONHUBLOADID
        while getgenv().PROBACONHUBLOADID == CURRENTID do
            writefile("ProBaconHubV2_tEc7rNnI5d.json", PROTECTED_HTTPSERVICE:JSONEncode(getgenv().VARIABLEFOLDER))
            task.wait(5)
        end
    end)()
elseif string.find(tostring(output), "stack overflow") ~= nil then
    if Window then
        Window:NotificationBar("ERROR", "Stack overflow. Please close this window and execute again.")
    else
        PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="ERROR"; Text="Stack overflow. Please close this window and execute again."; Duration=5;})
    end
elseif string.find(tostring(output), "error in error handling") ~= nil then
    if Window then
        Window:NotificationBar("ERROR", "Load error. Please rejoin the game and execute again.")
    else
        PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="ERROR"; Text="Load error. Please rejoin the game and execute again."; Duration=5;})
    end
elseif string.find(tostring(output), "HttpGet is not a valid") ~= nil then
    PROTECTED_STARTERGUI:SetCore("SendNotification", {Title="ERROR"; Text="HttpGet missing. Please rejoin the game and execute again."; Duration=5;})
else
    print("ERROR OCCURED: \n"..tostring(output))
end
