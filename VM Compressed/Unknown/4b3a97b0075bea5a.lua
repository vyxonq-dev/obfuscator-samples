 --[[

Loading Variables

]]--
local config_save = "DOD_config.luau"
_G.dod_developer_key = "Nexer" -- my name yaa
_G.API_last_update = "29/11/2025" -- last time update (dd/mm/yyyy)
_G.dod_repository = "https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/DOD/Main.luau" -- input repository for savings



--[[

Table And Configuration Things

]]--
local SpecialCharacters = {['\a'] = '\\a', ['\b'] = '\\b', ['\f'] = '\\f', ['\n'] = '\\n', ['\r'] = '\\r', ['\t'] = '\\t', ['\v'] = '\\v', ['\0'] = '\\0'}
local Keywords = { ['and'] = true, ['break'] = true, ['do'] = true, ['else'] = true, ['elseif'] = true, ['end'] = true, ['false'] = true, ['for'] = true, ['function'] = true, ['if'] = true, ['in'] = true, ['local'] = true, ['nil'] = true, ['not'] = true, ['or'] = true, ['repeat'] = true, ['return'] = true, ['then'] = true, ['true'] = true, ['until'] = true, ['while'] = true, ['continue'] = true}
local Functions = {
    [pairs] = "pairs",
    [ipairs] = "ipairs", 
    [next] = "next",
    [type] = "type",
    [tostring] = "tostring",
    [tonumber] = "tonumber",
    [print] = "print",
    [error] = "error",
    [assert] = "assert",
    [pcall] = "pcall",
    [xpcall] = "xpcall",
    [select] = "select",
    [rawget] = "rawget",
    [rawset] = "rawset",
    [rawequal] = "rawequal",
    [getmetatable] = "getmetatable",
    [setmetatable] = "setmetatable",
    [require] = "require",
}
if loadstring then Functions[loadstring] = "loadstring" end
if load then Functions[load] = "load" end
local function safeTypeof(value)
    if typeof then
        return typeof(value)
    else
        return type(value)
    end
end
function GetHierarchy(Object)
    if not Object or (type(Object) ~= "table" and safeTypeof(Object) ~= "Instance") then
        return tostring(Object)
    end
    local Hierarchy = {}
    local current = Object
    while current do
        local name = tostring(current.Name or current.name or "Unknown")
        name = string.gsub(name, '[%c%z]', SpecialCharacters)
        if current == game or current == _G.game then
            table.insert(Hierarchy, 1, "game")
        elseif Keywords[name] or not string.match(name, '^[_%a][_%w]*$') then
            table.insert(Hierarchy, 1, '["' .. name .. '"]')
        else
            table.insert(Hierarchy, 1, name)
        end
        current = current.Parent
    end
    
    return table.concat(Hierarchy, ".")
end
local function SerializeType(Value, Class)
    if Class == 'string' then
        return string.format('"%s"', string.gsub(Value, '[%c%z]', SpecialCharacters))
    elseif Class == 'Instance' then
        return GetHierarchy(Value)
    elseif Class == 'function' then
        return Functions[Value] or "'[Function: " .. tostring(Value) .. "]'"
    elseif Class == 'userdata' then
        return "'[userdata: " .. tostring(Value) .. "]'"
    elseif Class == 'thread' then
        if coroutine and coroutine.status then
            local status = pcall(function() return coroutine.status(Value) end)
            return "'[thread: " .. tostring(Value) .. (status and ", status: " .. coroutine.status(Value) or "") .. "]'"
        else
            return "'[thread: " .. tostring(Value) .. "]'"
        end
    else
        return tostring(Value)
    end
end
function TableToLuauString(Table, IgnoredTables, DepthData, Path)
    if type(Table) ~= "table" then
        return SerializeType(Table, safeTypeof(Table))
    end
    IgnoredTables = IgnoredTables or {}
    Path = Path or "ROOT"
    if not DepthData then
        DepthData = {0, Path}
    end
    local CyclicData = IgnoredTables[Table]
    if CyclicData then
        local currentDepth = DepthData[1] or 0
        local cyclicDepth = CyclicData[1] or 0
        return ((cyclicDepth == currentDepth - 1 and "'[Cyclic Parent " or "'[Cyclic ") .. tostring(Table) .. ', path: ' .. (CyclicData[2] or "unknown") .. "]'")
    end
    DepthData[1] = (DepthData[1] or 0) + 1
    DepthData[2] = Path
    IgnoredTables[Table] = {DepthData[1], DepthData[2]}
    local currentDepth = DepthData[1] or 1
    local Tab = string.rep('    ', currentDepth)
    local TrailingTab = string.rep('    ', currentDepth - 1)
    local Result = '{'
    local LineTab = '\n' .. Tab
    local HasOrder = true
    local Index = 1
    local IsEmpty = true
    for Key, Value in pairs(Table) do
        IsEmpty = false
        if Index ~= Key then
            HasOrder = false
        else
            Index = Index + 1
        end
        local KeyClass = safeTypeof(Key)
        local ValueClass = safeTypeof(Value)
        local HasBrackets = false
        local KeyStr
        if KeyClass == 'string' then
            local cleanKey = string.gsub(Key, '[%c%z]', SpecialCharacters)
            if Keywords[cleanKey] or not string.match(cleanKey, '^[_%a][_%w]*$') then
                HasBrackets = true
                KeyStr = string.format('["%s"]', cleanKey)
            else
                KeyStr = cleanKey
            end
        else
            HasBrackets = true
            if KeyClass == 'table' then
                KeyStr = '[' .. TableToLuauString(Key, IgnoredTables, {currentDepth + 1, Path}) .. ']'
            else
                KeyStr = '[' .. SerializeType(Key, KeyClass) .. ']'
            end
        end
        local ValueStr
        if ValueClass == 'table' then
            local newPath = Path .. (HasBrackets and '' or '.') .. KeyStr
            ValueStr = TableToLuauString(Value, IgnoredTables, {currentDepth + 1, Path}, newPath)
        else
            ValueStr = SerializeType(Value, ValueClass)
        end
        Result = Result .. LineTab .. (HasOrder and ValueStr or KeyStr .. ' = ' .. ValueStr) .. ','
    end
    local donetable = IsEmpty and Result .. '}' or string.sub(Result, 1, -2) .. '\n' .. TrailingTab .. '}'
    IgnoredTables[Table] = nil
    return donetable
end



local asset_counter = 0
local temp_msg = Instance.new("Message",game.CoreGui)

local Execute = function(f, ...) return function(f, ...) return task.spawn(f, ...) end end
local HaveWorkspaceAccess = function() if isfile and writefile and readfile and isfolder and makefolder and (getcustomasset or get_custom_asset) then return true end return false end
local CreateFile = function(f,c) writefile(f,c) end
local IsFile = function(f) return isfile(f) end
local GetFile = function(f,m) local gca = (getcustomasset or get_custom_asset); return ((m=="gca" and (gca(f))) or readfile(f)) end
local InsertElement = function(tf, element) local temp_table = loadstring(tostring(GetFile(tf,"rf")))(); table.insert(temp_table,element); CreateFile(tf, TableToLuauString(temp_table)) end
local RemoveElement = function(tf, element) local temp_table = loadstring(tostring(GetFile(tf,"rf")))(); for i,v in pairs(temp_table) do if v == element then temp_table[i]=nil end end; CreateFile(tf, TableToLuauString(temp_table)) end
--local InsertElement_test = function(tf, element) local temp_table = loadstring(tostring(GetFile(tf,"rf")))(); temp_table[element] = value; CreateFile(tf, TableToLuauString(temp_table)) end

if not isfolder("NexerHub") then
makefolder("NexerHub")
repeat task.wait() until isfolder("NexerHub")
end
if not isfolder("NexerHub/Core") then
makefolder("NexerHub/Core")
repeat task.wait() until isfolder("NexerHub/Core")
end
--if not isfile("NexerHub/Core/"..config_save.."") then
writefile("NexerHub/Core/"..config_save.."", [[return {
    ["Tab_1"] = {
        ["AutoInjection"] = {
            ["MaxStamina"] = "Type Here!",
            ["WalkSpeed"] = "Type Here!",
            ["SprintSpeed"] = "Type Here!"
        },
        ["NoStaminaLossMethod"] = "require",
        ["NoStaminaLoss"] = false,
        ["NoFatigue"] = false
    },
    ["Tab_2"] = {},
    ["Tab_3"] = {
        ["Bind"] = "None",
        ["FastFunctions"] = {
            ["ChoosenAbility"] = "Cloak"
        },
        ["CloakConfig"] = {
            ["Bind"] = "None",
            ["InvisibilityTime"] = 5
        },
        ["PunchConfig"] = {
            ["Bind"] = "None"
        },
        ["TauntConfig"] = {
            ["Bind"] = "None"
        },
        ["BonusPadConfig"] = {
            ["Bind"] = "None",
            ["SpeedModifier"] = 7
        },
        ["BlockConfig"] = {
            ["Bind"] = "None"
        },
        ["CaretakerConfig"] = {
            ["Bind"] = "None"
        },
        ["DashConfig"] = {
            ["Bind"] = "None",
            ["Power"] = 1250,
            ["MaxForce"] = 30000,
            ["Duration"] = 0.3
        },
        ["HotdogConfig"] = {
            ["Bind"] = "None",
            ["StaminaLoss"] = 5
        },
        ["RevolverConfig"] = {
            ["Bind"] = "None"
        },
        ["AdrenalineConfig"] = {
            ["Bind"] = "None"
        },
        ["BananaConfig"] = {
            ["Bind"] = "None"
        },
        ["Cards"] = {
            ["FirstCard"] = {
                [1] = "Revolver",
                [2] = "Caretaker"
            },
            ["SecondCard"] = {
                [1] = "BonusPad",
                [2] = "Caretaker"
            },
            ["ThirdCard"] = {
                [1] = "Revolver",
                [2] = "Punch"
            }
        },
        ["IB"] = {
            ["InstaDestroyComputer"] = false,
            ["AntiWalls"] = false,
            ["AntiEvilScary"] = false,
            ["AntiFallRagdoll"] = false
        }
    },
    ["Tab_4"] = {
        ["ESP"] = {
            ["Enabled"] = false,
            ["Transparency"] = 0.3,
            ["ShowUsernames"] = true,
            ["ShowHealth"] = true
        },
        ["Money"] = {
            ["Amount"] = "10",
            ["Reason"] = "for surviving for atleast 60 seconds."
        }
    },
    ["Tab_5"] = {
        ["IB"] = {
            ["AntiEvilScary"] = false,
            ["AntiTaunt"] = false
        },
        ["PursuerConfig"] = {
            ["CleaveBoost"] = 6
        },
        ["BadwareConfig"] = {
            ["HipHeight"] = 5
        },
        ["ArtfulConfig"] = {
            ["HipHeight"] = 5
        },
        ["HarkenConfig"] = {},
        ["KilldroidConfig"] = {
            ["Power"] = 1250,
            ["MaxForce"] = 1000000,
            ["Don'tDescendDuringTheFlight"] = false
        }
    },
    ["Tab_6"] = {
        ["CustomAnimations"] = {
            ["Run"] = "Civilian Run",
            ["Walk"] = "Civilian Walk",
            ["Idle"] = "Civilian Idle"
        },
        ["Swap"] = {
            ["What"] = "Punch",
            ["WithWhat"] = "BlockStart"
        },
        ["Misc"] = {
            ["Desync"] = 1,
            ["DesyncEnabled"] = false
        },
        ["ToEdit"] = "Adrenaline",
        ["CustomID"] = "0"
    },
    ["Tab_7"] = {},
    ["Tab_8"] = {},
    ["Tab_9"] = {
        ["GuiTheme"] = "AmberGlow"
    },
    ["Tab_10"] = {},
    ["Tab_11"] = {},
    ["Tab_12"] = {}
}]])
repeat task.wait() until isfile("NexerHub/Core/"..config_save.."")
--end
if not isfile("NexerHub/Core/PreloadData.luau") then
writefile("NexerHub/Core/PreloadData.luau", [[return {
    ["LoadConfig"] = true,
    ["GUID"] = "]]..tostring(game:GetService("HttpService"):GenerateGUID())..[[",
    ["CoreVersion"] = 1,
    ["LoadAssets"] = true
}]])
repeat task.wait() until isfile("NexerHub/Core/PreloadData.luau")
end
--local SaveConfig = function(tab,value,element_1,element_2,element_3) local temp_table = loadstring(tostring(GetFile("NexerHub/Core/"..config_save.."","rf")))(); if not element_2 then pcall(function() temp_table[tab][element_1] = value end) elseif not element_3 then pcall(function() temp_table[tab][element_1][element_2] = value end) else pcall(function() temp_table[tab][element_1][element_2][element_3] = value end) end CreateFile("NexerHub/Core/"..config_save.."", 'return '..TableToLuauString(temp_table)..'') end
--local LoadConfig = function(tab,element_1,element_2,element_3) local temp_table = loadstring(tostring(GetFile("NexerHub/Core/"..config_save.."","rf")))(); local returnelement = nil; if not element_2 then pcall(function() returnelement = temp_table[tab][element_1] end) elseif not element_3 then pcall(function() returnelement = temp_table[tab][element_1][element_2] end) else pcall(function() returnelement = temp_table[tab][element_1][element_2][element_3] end) end return returnelement end
local LoadConfig = function(tab, element_1, element_2, element_3)
    local success, temp_table = pcall(function()
        return loadstring(GetFile("NexerHub/Core/"..config_save.."", "rf"))()
    end)
    if not success or not temp_table then
        warn("Failed to load config config table")
		pcall(error, "Failed to load config config table")
        return
    end
    local returnelement = nil
    if not element_2 then
        if temp_table[tab] and temp_table[tab][element_1] ~= nil then
            returnelement = temp_table[tab][element_1]
        end
    elseif not element_3 then
        if temp_table[tab] and temp_table[tab][element_1] and temp_table[tab][element_1][element_2] ~= nil then
            returnelement = temp_table[tab][element_1][element_2]
        end
    else
        if temp_table[tab] and temp_table[tab][element_1] and temp_table[tab][element_1][element_2] and temp_table[tab][element_1][element_2][element_3] ~= nil then
            returnelement = temp_table[tab][element_1][element_2][element_3]
        end
    end
    return returnelement
end
local SaveConfig = function(tab, value, element_1, element_2, element_3)
    local success, temp_table = pcall(function()
        return loadstring(GetFile("NexerHub/Core/"..config_save.."", "rf"))()
    end)
    if not success or not temp_table then
        warn("Failed to load config for saving")
		pcall(error, "Failed to load config for saving")
        return
    end
    if not temp_table[tab] then
        temp_table[tab] = {}
    end
    if not element_2 then
        temp_table[tab][element_1] = value
    elseif not element_3 then
        if not temp_table[tab][element_1] then
            temp_table[tab][element_1] = {}
        end
        temp_table[tab][element_1][element_2] = value
    else
        if not temp_table[tab][element_1] then
            temp_table[tab][element_1] = {}
        end
        if not temp_table[tab][element_1][element_2] then
            temp_table[tab][element_1][element_2] = {}
        end
        temp_table[tab][element_1][element_2][element_3] = value
    end
    CreateFile("NexerHub/Core/"..config_save.."", 'return '..TableToLuauString(temp_table)..'')
end

Instance.new("Folder",game:GetService("CoreGui")).Name = "DOD_Assets"
--[[function XenoClear()
local a = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Leaderstats
a:GetPropertyChangedSignal("Visible"):Connect(function()
a.Visible = true
end)
a.Visible = true
local b = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.KillerIntro
b:GetPropertyChangedSignal("Visible"):Connect(function()
b.Visible = false
end)
b.Visible = false
end
if (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "xeno") or string.find(identifyexecutor(), "XENO")) then
task.spawn(XenoClear)
end]]

local function ConvertDropdownValue(tbl)
if type(tbl) == "table" then
for _,element in ipairs(tbl) do
return tostring(element)
end
return ""
else
return tostring(tbl or "")
end
end

temp_msg.Text = "Loading API Module... (0/1)"; task.wait(.2)

loadmoduleattempt = 0
repeat task.wait()
--if not isfile("NexerHub/Core/APIMODULE.luau") or (isfile("NexerHub/Core/APIMODULE.luau") and loadstring(GetFile("NexerHub/Core/APIMODULE.luau","rf"))()["last_updated"]~=_G.API_last_update) then
local lodsuc, loderr = pcall(function()
MainModule = loadstring(game:HttpGet("https://pastebin.com/raw/G17DaBUh"))()
end)
if not lodsuc then
loadmoduleattempt += 1
temp_msg.Text = "Failed loading API Module, re-trying... ( Attempt "..tostring(loadmoduleattempt).." )"
task.wait(1)
elseif lodsuc and MainModule.IsWorking ~= nil then
temp_msg.Text = "Loading API Module... (1/1)"
task.wait(1)
else
loadmoduleattempt += 1
temp_msg.Text = "Failed loading API Module, re-trying... ( Attempt "..tostring(loadmoduleattempt).." )"
task.wait(1)
end
--elseif isfile("NexerHub/Core/APIMODULE.luau") then

--end
until temp_msg.Text == "Loading API Module... (1/1)"


function RequestModule(module)
if (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "xeno") or string.find(identifyexecutor(), "XENO")) or (string.find(identifyexecutor(), "Solara") or string.find(identifyexecutor(), "solara") or string.find(identifyexecutor(), "SOLARA")) then return nil end
local result = nil
local Success, Error = pcall(function()
result = require(module)
end)
if Success then
return result
elseif not Success then
return nil
end
end

local GetRequestMethod = function()
local iqnd = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (KRNL and KRNL.request) or (Xeno and Xeno.request) or (game and game.HttpPost)
if iqnd then
return iqnd
else
return nil
end
end
function CopyLink(link)
local url = tostring(link)
setclipboard(url)
Notify("Success!", "Copied Link!", 4, true)
end
function OpenLink(link)
local url = tostring(link)
if WebHandler then
local suc, err = pcall(function() game:GetService("GuiService"):BroadcastNotification(game:GetService("HttpService"):JSONEncode({["title"] = "Roblox", ["presentationStyle"] = 2, ["visible"] = true, ["url"] = tostring(url)}), 20) end) if not suc then CopyLink(url) end
else
CopyLink(url)
end
end

temp_msg.Text = "Loading Rayfield..."; task.wait(.2)
local Rayfield = nil
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = MainModule:GetWorkingRayfield()
end)
if not RAYFIELD_SUCCESS or Rayfield == nil then
task.delay(0, function() print(RAYFIELD_FAIL) end)
temp_msg.Text = "Failed to load Rayfield, please try again."
task.wait(5)
temp_msg:Destroy()
return
end


temp_msg.Text = "Loading Core Assets... ("..asset_counter.."/25)"
local temp_variable_a = false
--loadstring(GetFile("NexerHub/Core/PreloadData.luau","rf"))().LoadAssets == true
if HaveWorkspaceAccess() and temp_variable_a == true then
if not isfolder("NexerHub") then
makefolder("NexerHub")
repeat task.wait(.1) until isfolder("NexerHub")
makefolder("NexerHub/DieOfDeath")
repeat task.wait(.1) until isfolder("NexerHub/DieOfDeath")
makefolder("NexerHub/DieOfDeath/Assets")
repeat task.wait(.1) until isfolder("NexerHub/DieOfDeath/Assets")
makefolder("NexerHub/DieOfDeath/Assets/LMS")
makefolder("NexerHub/DieOfDeath/Assets/Chases")
elseif isfolder("NexerHub") and not isfolder("NexerHub/DieOfDeath") then
makefolder("NexerHub/DieOfDeath")
repeat task.wait(.1) until isfolder("NexerHub/DieOfDeath")
makefolder("NexerHub/DieOfDeath/Assets")
repeat task.wait(.1) until isfolder("NexerHub/DieOfDeath/Assets")
makefolder("NexerHub/DieOfDeath/Assets/LMS")
makefolder("NexerHub/DieOfDeath/Assets/Chases")
elseif isfolder("NexerHub") and isfolder("NexerHub/DieOfDeath") and not isfolder("NexerHub/DieOfDeath/Assets") then
makefolder("NexerHub/DieOfDeath/Assets")
repeat task.wait(.1) until isfolder("NexerHub/DieOfDeath/Assets")
makefolder("NexerHub/DieOfDeath/Assets/LMS")
makefolder("NexerHub/DieOfDeath/Assets/Chases")
elseif isfolder("NexerHub") and isfolder("NexerHub/DieOfDeath") and isfolder("NexerHub/DieOfDeath/Assets") and (not isfolder("NexerHub/DieOfDeath/Assets/LMS") or not isfolder("NexerHub/DieOfDeath/Assets/Chases")) then
if isfolder("NexerHub") and isfolder("NexerHub/DieOfDeath") and isfolder("NexerHub/DieOfDeath/Assets") and not isfolder("NexerHub/DieOfDeath/Assets/LMS") then
makefolder("NexerHub/DieOfDeath/Assets/LMS")
end
if isfolder("NexerHub") and isfolder("NexerHub/DieOfDeath") and isfolder("NexerHub/DieOfDeath/Assets") and not isfolder("NexerHub/DieOfDeath/Assets/Chases") then
makefolder("NexerHub/DieOfDeath/Assets/Chases")
end
end
asset_counter = 6
temp_msg.Text = "Loading Core Assets... ("..asset_counter.."/25)"
end

local music_assets = {
["HELLFIRE V2"] = "https://files.catbox.moe/2pehs1.mp3";
["Middle Big Brother"] = "https://files.catbox.moe/65l2f8.mp3";
["MISO"] = "https://files.catbox.moe/urog51.mp3";
["Orchestra"] = "https://files.catbox.moe/i9b6vl.mp3";
["Pretence"] = "https://files.catbox.moe/pkohdd.mp3";
["Screw Time"] = "https://files.catbox.moe/jhy3lr.mp3";
["Derptastic"] = "https://files.catbox.moe/r0rzbz.mp3";
["FAKEOUT"] = "https://files.catbox.moe/ul88my.mp3";
["A God with No Time"] = "https://files.catbox.moe/xruwh4.mp3";

["One Bounce"] = "https://files.catbox.moe/ruavt7.mp3";
["Showtime"] = "https://files.catbox.moe/fo5h65.mp3";
["Teapot Palace Tour"] = "https://files.catbox.moe/jvk4pn.mp3";
["Vigilante Shootdown"] = "https://files.catbox.moe/oepxa0.mp3";
["Eternity V2"] = "https://files.catbox.moe/uxtj1z.mp3";
["Hero"] = "https://files.catbox.moe/1jazm7.mp3";
["Omega's Final Stand"] = "https://files.catbox.moe/p435fz.mp3";
["Careless"] = "https://files.catbox.moe/9t45f8.mp3";
["A Retro Soul"] = "https://files.catbox.moe/u375iy.mp3";
}
local download_failed = false
local catboxstatus = "working"
if catboxstatus == "working" then
if HaveWorkspaceAccess() and not IsFile("NexerHub/DieOfDeath/Assets/LMS/data.luau") then CreateFile("NexerHub/DieOfDeath/Assets/LMS/data.luau", [[return {
    "One Bounce";
    "Showtime";
    "Omega's Final Stand";
    "A Retro Soul";
    "Teapot Palace Tour";
    "Careless";
    "Vigilante Shootdown";
    "Eternity V2";
    "Hero";
}]])
local temp_table = {
    "One Bounce";
    "Showtime";
    "Omega's Final Stand";
    "A Retro Soul";
    "Teapot Palace Tour";
    "Careless";
    "Vigilante Shootdown";
    "Eternity V2";
    "Hero";
}
for i,v in pairs(temp_table) do
local music_data = nil
pcall(function()
music_data = game:HttpGet(music_assets[v])
end)
if (not music_data or music_data == nil) or (music_data and music_data["errors"]) then
download_failed = true
end
if download_failed == true then
temp_msg.Text = "Failed Loading Core Assets. (Timeout)"
task.wait(3)
break
end
CreateFile("NexerHub/DieOfDeath/Assets/LMS/"..v..".mp3",music_data)
asset_counter += 1
temp_msg.Text = "Loading Core Assets... ("..asset_counter.."/25, will be cancelled if doesn't load )"
end
end
end
if catboxstatus == "working" then
if HaveWorkspaceAccess() and not IsFile("NexerHub/DieOfDeath/Assets/Chases/data.luau") then CreateFile("NexerHub/DieOfDeath/Assets/Chases/data.luau", [[return {
    "A God with No Time";
    "Derptastic";
    "FAKEOUT";
    "HELLFIRE V2";
    "MISO";
    "Orchestra";
    "Pretence";
    "Screw Time";
    "Middle Big Brother";
}]])
local temp_table = {
    "A God with No Time";
    "Derptastic";
    "FAKEOUT";
    "HELLFIRE V2";
    "MISO";
    "Orchestra";
    "Pretence";
    "Screw Time";
    "Middle Big Brother";
}
if download_failed ~= true then
for i,v in pairs(temp_table) do
local music_data = nil
pcall(function()
music_data = game:HttpGet(music_assets[v])
end)
if (not music_data or music_data == nil) or (music_data and music_data["errors"]) then
download_failed = true
end
if download_failed == true then
temp_msg.Text = "Failed Loading Core Assets."
break
end
CreateFile("NexerHub/DieOfDeath/Assets/Chases/"..v..".mp3",music_data)
asset_counter += 1
temp_msg.Text = "Loading Core Assets... ("..asset_counter.."/25, will be cancelled if doesn't load)"
end
end
end
end
temp_msg:Destroy()

function Notify(title, content, time, mode)
time = time or 4
mode = mode or false or warn
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
elseif mode == warn then
img = 9441432403
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

function DestroyRayfield()
task.spawn(function()
pcall(function()
Window:Destroy()
end)
pcall(function()
Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.RayField:Destroy()
end)
pcall(function()
game.CoreGui.OldRayfield:Destroy()
end)
pcall(function()
game.CoreGui.OldRayField:Destroy()
end)
end)
end

local RayfieldGuiTheme = LoadConfig("Tab_9", "GuiTheme")
local Window = Rayfield:CreateWindow({
   Name = ""..((_G.dod_developer_key ~= nil and _G.dod_developer_key) or "Unknown").." Hub : Die Of Death",
   Icon = 0,    
   LoadingTitle = "NH:DOD",
   LoadingSubtitle = "by nexer",
   Theme = RayfieldGuiTheme,
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})


pcall(function()
local Announcements = Window:CreateTab("Announce",0)
Announcements:CreateParagraph({Title = "W.I.P.", Content = "A lot of stuff haven't been added yet. Work is in progress. I have a lot of studies which is why it takes a lot of time."})
Announcements:CreateParagraph({Title = "Discord suggestions", Content = "They'll be added soon! I will be updating everyday i can."})
Announcements:CreateParagraph({Title = "Configuration", Content = "At this moment, configurations aren't being saving due to multiple bugs. The premium tab will be re-ordered soon."})
Announcements:CreateButton({Name = "Copy Discord Server Link"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Notify("Success!", "Copied Link!", 3, true)
end; })
end)



local LocalPlayer, LP = game.Players.LocalPlayer, game.Players.LocalPlayer
local Character, Char
local HumanoidRootPart, HRP
local Humanoid, Hum
pcall(function()
Character, Char = LocalPlayer.Character, LocalPlayer.Character
end)
pcall(function()
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
end)
pcall(function()
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)
LocalPlayer.CharacterAdded:Connect(function()
pcall(function()
Character, Char = nil, nil
HumanoidRootPart, HRP = nil, nil
Humanoid, Hum = nil, nil
task.wait()
repeat task.wait() until LocalPlayer.Character
Character, Char = LocalPlayer.Character, LocalPlayer.Character
task.wait()
repeat task.wait() until Character:FindFirstChild("HumanoidRootPart")
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
task.wait()
repeat task.wait() until Character:FindFirstChild("Humanoid")
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)
end)

pcall(function()
if (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "xeno") or string.find(identifyexecutor(), "XENO")) then
StaminaModule = {}
StaminaModule.Stamina = 100
else
StaminaModule = RequestModule(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Movement"))
end
end)

function SetStaminaProperty(property, value)
if property == "MaxStamina" then
Char:SetAttribute("MaxStamina", value)
elseif property == "Stamina" then
if StaminaModule then
StaminaModule.Stamina = value
end
elseif property == "Fatigue" then
Char:SetAttribute("Fatigue", value)
elseif property == "WalkSpeed" then
Hum.WalkSpeed = value
elseif property == "SprintSpeed" then
Char:SetAttribute("SprintSpeed", value)
elseif property == "WalkSpeed" then
Char:SetAttribute("WalkSpeed", value)
elseif property == "DisableSprint" then
Char:SetAttribute("DisableSprint", value)
elseif property == "PauseRegen" then
Char:SetAttribute("PauseRegen", value)
elseif property == "CanJump" then
if value == true then Hum.JumpPower = 50 else Hum.JumpPower = 0 end
end
end

local Tab_1 = Window:CreateTab("Stamina",0)

Tab_1:CreateParagraph({Title = "Stamina", Content = "You can change your stamina properties here."})

Tab_1:CreateSection("Fast Functions")

Tab_1:CreateButton({Name = "Infinite Stamina"; Callback = function()
SetStaminaProperty("MaxStamina", (1/0))
SetStaminaProperty("Stamina", (1/0))
end; })

Tab_1:CreateButton({Name = "Become Fast"; Callback = function()
Humanoid.WalkSpeed = 50
SetStaminaProperty("SprintSpeed", 70)
end; })

Tab_1:CreateButton({Name = "Enable/Disable Jump"; Callback = function()
if Hum.JumpPower == 0 then
SetStaminaProperty("CanJump", true)
else
SetStaminaProperty("CanJump", false)
end
end; })

local ChoosenNoStamLossMethod = LoadConfig("Tab_1", "NoStaminaLossMethod")
local lastusedmethod = ""
Tab_1:CreateDropdown({Name = "Choosen No Stamina Loss Method"; Options = {"require","scriptbreak (toggle while running)"}; CurrentOption = ChoosenNoStamLossMethod; MultiSelection = false; Callback = function(Value)
ChoosenNoStamLossMethod = ((ConvertDropdownValue(Value)=="scriptbreak (toggle while running)" and "scriptbreak") or "require")
SaveConfig("Tab_1", ChoosenNoStamLossMethod, "NoStaminaLossMethod")
end; })

local NoStaminaLoss = LoadConfig("Tab_1", "NoStaminaLoss")
local NoStaminaLossToggle = Tab_1:CreateToggle({Name = "No Stamina Loss"; CurrentValue = false; Callback = function(Value)
if lastusedmethod == "require" then
NoStaminaLoss = false
lastusedmethod = ""
return
elseif lastusedmethod == "scriptbreak" then
SetStaminaProperty("Fatigue", 0)
lastusedmethod = ""
return
end
SaveConfig("Tab_1", Value, "NoStaminaLoss")
if Value == true then
if ChoosenNoStamLossMethod == "require" then
NoStaminaLoss = true
lastusedmethod = "require"
task.spawn(function()
repeat task.wait(0.003)
if Character and Character:GetAttribute("MaxStamina") then
SetStaminaProperty("Stamina", Character:GetAttribute("MaxStamina"))
end
until NoStaminaLoss == false
end)
elseif ChoosenNoStamLossMethod == "scriptbreak" then
lastusedmethod = "scriptbreak"
SetStaminaProperty("Fatigue", true)
end
end
end; })
NoStaminaLossToggle:Set(NoStaminaLoss)

local NoFatigue = LoadConfig("Tab_1", "NoFatigue")
local NoFatigueToggle = Tab_1:CreateToggle({Name = "No Fatigue"; CurrentValue = false; Callback = function(Value)
NoFatigue = Value
SaveConfig("Tab_1", Value, "NoFatigue")
if NoFatigue ~= true then return end
repeat task.wait(0.003)
if Character and Character:GetAttribute("Fatigue") and Character:GetAttribute("Fatigue") == 1 then
SetStaminaProperty("Fatigue", 0)
end
until NoFatigue == false
end; })
--NoFatigueToggle:Set(NoFatigue)

Tab_1:CreateSection("Advanced")

Tab_1:CreateInput({Name = "Max Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("MaxStamina", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("Stamina", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "Walk Speed"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("WalkSpeed", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "Sprint Speed"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("SprintSpeed", tonumber(Value))
end; })

Tab_1:CreateToggle({Name = "Fatigue"; CurrentValue = false; Callback = function(Value)
SetStaminaProperty("Fatigue", ((Value==true and 1) or 0))
end; })

Tab_1:CreateToggle({Name = "Stamina Regen Paused"; CurrentValue = false; Callback = function(Value)
SetStaminaProperty("PauseRegen", ((Value==true and 1) or 0))
end; })

Tab_1:CreateToggle({Name = "Sprint Disabled"; CurrentValue = false; Callback = function(Value)
SetStaminaProperty("DisableSprint", Value)
end; })

--[[
Tab_1:CreateSection("Auto Injection")
local AI_MaxStamina, AI_WalkSpeed, AI_SprintSpeed

Tab_1:CreateLabel("Stamina settings will automatically be applied to your character 21.5 seconds after the round starts.")

Tab_1:CreateToggle({Name = "Auto Inject"; CurrentValue = false; Callback = function(Value)
AutoInjectStamina = Value
end; })

Tab_1:CreateInput({Name = "Max Stamina"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_MaxStamina = tonumber(Value)
end; })

Tab_1:CreateInput({Name = "Walk Speed"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_WalkSpeed = Value
end; })

Tab_1:CreateInput({Name = "Sprint Speed"; PlaceholderText = "Type Here!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_SprintSpeed = Value
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildAdded:Connect(function()
task.wait()
if AutoInjectStamina == true then
task.wait(21.5)
pcall(function()
SetStaminaProperty("MaxStamina", AI_MaxStamina)
end)
pcall(function()
SetStaminaProperty("Stamina", AI_MaxStamina)
end)
pcall(function()
SetStaminaProperty("WalkSpeed", AI_WalkSpeed)
end)
pcall(function()
SetStaminaProperty("SprintSpeed", AI_SprintSpeed)
end)
end
end)]]








----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------












local Tab_2 = Window:CreateTab("Emotes",0)
Tab_2:CreateParagraph({Title = "Emotes", Content = "Functions that are related to emotes."})

Tab_2:CreateButton({Name = "Sync Emotes"; Callback = function()
task.spawn(function()
local Songs = {
	["rbxassetid://95332984406426"] = "rbxassetid://73591689210949";
	["rbxassetid://91496313320059"] = "rbxassetid://117826199625726";
	["rbxassetid://72840218506214"] = "rbxassetid://87502844893473";
	["rbxassetid://76016409017292"] = "rbxassetid://125027188864914";
	["rbxassetid://33810432"] = "rbxassetid://81883187469620";
}
local function SyncEmoteWithClosestPlayer(e)
    local NewClosest = nil
    local ClosestDistance = math.huge
    local timeposem = 0
    local animtrackpos = nil
    local idklol = nil
    for i, v in pairs(game.Players:GetPlayers()) do
        if v and v.Name ~= game.Players.LocalPlayer.Name and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") then
            local emote = (v.Character.Head:FindFirstChild("EmoteSong") or v.Character.HumanoidRootPart:FindFirstChild("EmoteSong"))
            if not emote or tostring(emote.SoundId) ~= e then
                continue
            end
            local Distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if Distance < ClosestDistance then
                ClosestDistance = Distance
                NewClosest = (v.Character.Humanoid:FindFirstChild("Animator") ~= nil and v.Character.Humanoid.Animator) or v.Character.Humanoid
                timeposem = emote.TimePosition
                local hah = NewClosest:GetPlayingAnimationTracks()
                for _, track in pairs(hah) do
                    if track.Animation and Songs[e] == tostring(track.Animation.AnimationId) then
                        idklol = tostring(track.Animation.AnimationId)
                        animtrackpos = track.TimePosition
                        break
                    end
                end
            end
        end
    end
    if NewClosest == nil or ClosestDistance > 20 then
        return nil, nil, nil
    end
    return idklol, animtrackpos, timeposem
end
game.Players.LocalPlayer.Character.Head.ChildAdded:Connect(function(c)
if c.Name=="EmoteSong" then
local a,b,v = SyncEmoteWithClosestPlayer(tostring(c.SoundId))
print(a,b,v)
c.TimePosition = v
local hoh = (game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator")~=nil and game.Players.LocalPlayer.Character.Humanoid.Animator) or game.Players.LocalPlayer.Character.Humanoid
local hah = hoh:GetPlayingAnimationTracks()
for _,track in pairs(hah) do
if tostring(track.Animation.AnimationId) == a then
track.TimePosition = b
end
end
end
end)
game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name=="EmoteSong" then
local a,b,v = FindClosestPlayerWithEmote(tostring(c.SoundId))
print(a,b,v)
c.TimePosition = v
local hoh = (game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("Animator")~=nil and game.Players.LocalPlayer.Character.Humanoid.Animator) or game.Players.LocalPlayer.Character.Humanoid
local hah = hoh:GetPlayingAnimationTracks()
for _,track in pairs(hah) do
if tostring(track.Animation.AnimationId) == a then
track.TimePosition = b
end
end
end
end)
Notify("Success!", "Enabled sync!", 2, true)
end)
end; })

Tab_2:CreateButton({Name = "Open Emote Selection"; Callback = function()
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Visible = true
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Active = true
end; })

Tab_2:CreateButton({Name = "Use Dance"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Dance")
end; })

Tab_2:CreateButton({Name = "Use Squingle"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Squingle")
end; })

Tab_2:CreateButton({Name = "Use Gangnam Style"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Gangnam Style")
end; })

Tab_2:CreateButton({Name = "Use PBJ"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("PBJ")
end; })

Tab_2:CreateButton({Name = "Use Tornado"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Tornado")
end; })

Tab_2:CreateButton({Name = "Use Rainbow Waves (CLIENT VFX/SFX)"; Callback = function()
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75513960644342"
local planim = Humanoid:LoadAnimation(anim)
planim:Play()
local song = Instance.new("Sound")
song.Volume = 1.5
song.Looped = true
song.SoundId = "rbxassetid://137048834753046"
song.Parent = HumanoidRootPart
song:Play()
local PE1 = Instance.new("ParticleEmitter")
PE1.Texture = "rbxassetid://13425686092"
PE1.Rate = 50
PE1.Lifetime = NumberRange.new(1, 1)
PE1.Speed = NumberRange.new(5, 15)
PE1.Size = NumberSequence.new(0.4)
PE1.LightEmission = 1
PE1.LightInfluence = 1

PE1.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 128, 0)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(0.83, Color3.fromRGB(128, 0, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})

PE1.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0, 0.613),
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 0)
})

PE1.Shape = Enum.ParticleEmitterShape.Box
PE1.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
PE1.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
PE1.ShapePartial = 1

PE1.SpreadAngle = Vector2.new(360, 360)
PE1.EmissionDirection = Enum.NormalId.Top

PE1.Parent = HumanoidRootPart

PE1.Orientation = Enum.ParticleOrientation.VelocityParallel
PE1.Acceleration = Vector3.new(-15, -15, -15)

PE1.Squash = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 1),
	NumberSequenceKeypoint.new(1, 0)
})


local PE2 = Instance.new("ParticleEmitter")
PE2.Texture = "rbxassetid://1057939773"
PE2.Rate = 5
PE2.Lifetime = NumberRange.new(0.5, 0.5)
PE2.Speed = NumberRange.new(0.01, 0.01)
PE2.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0.5),
	NumberSequenceKeypoint.new(1, 10),
	NumberSequenceKeypoint.new(1, 1)
})
PE2.LightEmission = 1
PE2.LightInfluence = 1
PE2.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 128, 0)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(0.83, Color3.fromRGB(128, 0, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
PE2.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0.613),
	NumberSequenceKeypoint.new(1, 1)
})
PE2.Shape = Enum.ParticleEmitterShape.Box
PE2.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
PE2.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
PE2.ShapePartial = 1
PE2.SpreadAngle = Vector2.new(0, 0)
PE2.EmissionDirection = Enum.NormalId.Top
PE2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
PE2.Acceleration = Vector3.new(0, 0, 0)
PE2.Squash = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 0),
	NumberSequenceKeypoint.new(1, 0)
})
PE2.Parent = HumanoidRootPart
local TooLate = false
LocalPlayer.CharacterAdded:Once(function()
	if TooLate then return end
	TooLate = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
	PE1:Destroy()
	PE2:Destroy()
end)
Humanoid.Running:Once(function()
	if TooLate then return end
	TooLate = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
	PE1:Destroy()
	PE2:Destroy()
end)
end; })









----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------













local AbilityNames = {"Cloak","Punch","Taunt","BonusPad","Block","Caretaker","Dash","Hotdog","Revolver","Adrenaline","Banana"}

local AbilityDatas = {
    ["Adrenaline"] = {Name = "Adrenaline",InputShown = "",Tip = "Get a massive speed boost for 6 seconds, once the 6 seconds are over you will be given Exhaust and stunned briefly while also revealing your location to teammates for the duration.",Cooldown = 35,Icon = "rbxassetid://116399911657417",DisplayName = "Adrenaline",Noise = "Causes 3 noise upon the first use, and 2 noise once the ability ends."};
    ["Punch"] = {Name = "Punch",InputShown = "",Tip = "Take a moment to swing forward and stun the killer for 3 seconds if landed, dealing 25 damage. Missing will result with heavy end-lag.",Cooldown = 40,Icon = "rbxassetid://97428323453639",DisplayName = "Punch",Noise = "Causes 2 noise upon use, and 3 noise if landed."};
    ["Caretaker"] = {Name = "Caretaker",InputShown = "",Tip = "Splash a potion in front of you and heal anyone for 10 HP instantly, and another 10 overtime. This ability lowers Max HP by 25.",Cooldown = 30,Icon = "rbxassetid://90712805517714",DisplayName = "Caretaker",Noise = "Causes 1 noise upon use."};
    ["Cloak"] = {Name = "Cloak",InputShown = "",Tip = "Go invisible over the span of 1.5 seconds and stay invisible for 10 seconds, being given Exhaust for its duration. At the end of the invisibility, take another second to fully turn visible again. Being hit while invisible forces you to turn visible again.",Cooldown = 40,Icon = "rbxassetid://90476367580326",DisplayName = "Cloak",Noise = "Causes no noise upon use."};
    ["Block"] = {Name = "Block",InputShown = "",Tip = "Raise your arm up and get in a blocking stance for 2 seconds, getting hit by (mostly) anything will grant a speed boost and regen 10 HP, also locking killer abilities for a second.",Cooldown = 40,Icon = "rbxassetid://120929805037270",DisplayName = "Block",Noise = "Causes 1 noise upon use, and 5 noise if landed."};
    ["Dash"] = {Name = "Dash",InputShown = "",Tip = "Dash a great distance forward and drain 35 SP. Can be used even below 35 SP.",Cooldown = 20,Icon = "rbxassetid://73777691791017",DisplayName = "Dash",Noise = "Causes 1 noise upon use."};
    ["BonusPad"] = {Name = "BonusPad",InputShown = "",Tip = "Build a pad on the floor over the span of 5 seconds, stepping on the pad will grant a speed boost for 2 seconds. After 50 seconds, the pad will disappear. This ability lowers your Max HP by 10.",Cooldown = 60,Icon = "rbxassetid://86775625332300",DisplayName = "BonusPad",Noise = "Causes 6 noise upon use. Additionally causes 1 noise every time someone steps on a pad."};
    ["Hotdog"] = {Name = "Hotdog",InputShown = "",Tip = "Take out a delicious hotdog and eat it over the span of 3 seconds and be given an additional 5 max HP and 15 HP, at the cost of -5 SP. The max HP bonus caps at 125.",Cooldown = 25,Icon = "rbxassetid://134322360499381",DisplayName = "Hotdog",Noise = "Causes 5 noise upon use."};
    ["Revolver"] = {Name = "Revolver",InputShown = "",Tip = "Stand still and fire your revolver forwards, shoot out a projectile with an explosive AOE, stunning for 2 seconds and dealing 50 damage. After firing you need to reload your revolver in order to shoot it again. This ability lowers SP by 10.",Cooldown = 15,Icon = "rbxassetid://107624957891469",DisplayName = "Revolver",Noise = "Causes 4 noise upon use, 5 noise if landed. And 2 noise on reload."};
    ["Taunt"] = {Name = "Taunt",InputShown = "",Tip = "Taunt the killer at close range with a hitbox that slowly gets larger. Successfully taunting the killer will highlight them to everyone and cover their screen, and also give you damage immunity for a bit. Missing embarrasses you to everyone.",Cooldown = 25,Icon = "rbxassetid://85436299122876",DisplayName = "Taunt",Noise = "Causes 6 noise upon use, and 2 noise if landed. 2 noise is also done on miss."};
    ["Banana"] = {Name = "Banana",InputShown = "",Tip = "Shoot a banana peel onto the floor, if the civilian who placed it or the killer steps on it, they'll be ragdolled for 2 seconds. The banana will decay over the span of 25 seconds.",Cooldown = 20,Icon = "rbxassetid://96202444819611",DisplayName = "Banana Peel",Noise = "Causes 2 noise upon use, and 2 noise if someone slips on the banana peel."};
}

pcall(function()
local temp_module = [[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")

local Events = ReplicatedStorage:WaitForChild("Events")
local ClientModules = ReplicatedStorage:WaitForChild("ClientModules")

local LocalPlayer = Players.LocalPlayer
local script = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Ability")
local PlayerGui = LocalPlayer.PlayerGui

local RoundUI = PlayerGui.MainGui.RoundUI
local AbilitiesFolder = PlayerGui.MainGui.Abilities.Folder

local AbilitySystem = {
    Input1 = "Q",
    Input2 = "E", 
    Input3 = "R",
    Input4 = "T",
    Input5 = "M1",
    PreferredInput = UserInputService.PreferredInput
}

-- Store cooldown status per ability
local abilityCooldowns = {}

function AbilitySystem.CreateAbility(AbilityData)
    if AbilitiesFolder:FindFirstChild(AbilityData.Name) then AbilitiesFolder:FindFirstChild(AbilityData.Name):Destroy() task.wait() end
    
    local AbilityButton = script.AbilityTemplate:Clone()

    local InputKey = AbilitySystem[AbilityData.InputShown] or AbilityData.InputShown
    
    AbilityButton.Parent = AbilitiesFolder
    AbilityButton.Name = AbilityData.Name
    AbilityButton.Input.Text = InputKey
    AbilityButton.Title.Text = AbilityData.DisplayName
    
    AbilityButton.Cooldown.Visible = false
    AbilityButton.CooldownLabel.Visible = false
    PlayerGui.MainGui.Abilities.Tip.Visible = false
    
    AbilityButton.MouseEnter:Connect(function()
        PlayerGui.MainGui.Abilities.Tip.Label.Text = "<font color='rgb(137, 255, 26)'>Usage:</font> <font color='rgb(255, 255, 255)'>" .. (AbilityData.Tip or "No tips for this ability.") .. "</font>"
        PlayerGui.MainGui.Abilities.Tip.Visible = true
    end)
    
    AbilityButton.MouseLeave:Connect(function()
        PlayerGui.MainGui.Abilities.Tip.Visible = false
    end)
    
    if AbilityData.Icon then
        AbilityButton.Icon.Image = AbilityData.Icon
    end
    
    AbilityButton.Activated:Connect(function()
        AbilitySystem.UseAbility(AbilityData, AbilityButton)
    end)

	if not AbilityData.InputShown then return end
	task.spawn(function()
	AbilitySystem:Bind(AbilityData, AbilityButton)
	end)
	
end

function AbilitySystem:Bind(AbilityData, AbilityButton)
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        local triggerFound = false
        if AbilityData.InputShown == "M1" and input.UserInputType == Enum.UserInputType.MouseButton1 then
            triggerFound = true
        elseif input.KeyCode == Enum.KeyCode[AbilityData.InputShown] then
            triggerFound = true
        end
        if triggerFound and AbilityButton.Parent then
            task.spawn(function() AbilitySystem.UseAbility(AbilityData, AbilityButton) end)
        end
    end)
    AbilityButton.AncestryChanged:Connect(function()
        if not AbilityButton.Parent then
            connection:Disconnect()
        end
    end)
end

function AbilitySystem.AbilityTween(AbilityButton)
    TweenService:Create(AbilityButton, TweenInfo.new(0.2), {Size = UDim2.new(0.9, 0, 0.9, 0)}):Play()
    
    if AbilityButton:FindFirstChild("UseEffect") then
        AbilityButton.UseEffect.Visible = true
        AbilityButton.UseEffect.BackgroundTransparency = 0.5
        TweenService:Create(AbilityButton.UseEffect, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    end
    
    task.wait(0.2)
    TweenService:Create(AbilityButton, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 1, 0)}):Play()
end

function AbilitySystem.PutOnCooldown(AbilityButton, CooldownTime)
    if AbilityButton.Cooldown.Visible then return end
    
    AbilityButton.Input.Visible = false
    AbilityButton.InputImage.Visible = false
    AbilityButton.Cooldown.Visible = true
    AbilityButton.CooldownLabel.Visible = true
    AbilityButton.Icon.ImageColor3 = Color3.fromRGB(90, 90, 90)
    
    local TotalSteps = CooldownTime * 10
    
    for Step = math.round(TotalSteps), 0, -1 do
        if not AbilityButton.Parent then break end
        
        AbilityButton.Cooldown.Size = UDim2.new(1, 0, Step / math.round(TotalSteps), 0)
        AbilityButton.CooldownLabel.Text = math.round(CooldownTime) .. "s"
        
        task.wait(0.1)
        CooldownTime = string.format("%.1f", CooldownTime - 0.1)
    end
    
    if AbilityButton.Parent then
        AbilitySystem.AbilityTween(AbilityButton)
        AbilityButton.Input.Visible = true
        AbilityButton.InputImage.Visible = true
        AbilityButton.Cooldown.Visible = false
        AbilityButton.CooldownLabel.Visible = false
        AbilityButton.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end
end

function AbilitySystem.UseAbility(AbilityData, AbilityButton)
    if AbilityButton.Cooldown.Visible then return end
	task.spawn(AbilitySystem.AbilityTween, AbilityButton)
	if AbilityData.Client == true then
	task.spawn(function() AbilitySystem.PutOnCooldown(AbilityButton, Cooldown or AbilityData.Cooldown) end)
    end

    local Success, Cooldown = Events.RemoteFunctions.UseAbility:InvokeServer(AbilityData.Name)
    if Success or AbilityData.Client == true then
        if AbilityData.Client == true then
            Cooldown = AbilityData.Cooldown
        end
        if Success ~= "MultipleUse" then
            if AbilityData.Client == true then
                AbilityData.ClientFunction()
            end
        end
    end
    return Success
end

return AbilitySystem]]
AbilityModule = loadstring(temp_module)()
end)
pcall(function()
if (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "xeno") or string.find(identifyexecutor(), "XENO")) then
UIModule = {}
UIModule.AbilitySelection = function(v841) Notify("Error!", "Couldn't use function ''AbilitySelection'', missing function ''require'' or ''decompile''!", 5, false) return end
UIModule.OpenShop = function(v841) Notify("Error!", "Couldn't use function ''OpenShop'', missing function ''require'' or ''decompile''!", 5, false) return end
UIModule.TeamateDeathEffect = function(v841) Notify("Error!", "Couldn't use function ''TeamateDeathEffect'', missing function ''require'' or ''decompile''!", 5, false) return end
else
if LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):FindFirstChild("UI") then
UIModule = RequestModule(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"))
end
end
end)

local Tab_3 = Window:CreateTab("Civilian",0)
Tab_3:CreateParagraph({Title = "Abilities", Content = "You can give yourself abilities or cards with abilities. If you gave yourself an ability you already had, the old ability will be replaced with new settings."})

Tab_3:CreateSection("Fast Functions")
local InputBind = LoadConfig("Tab_3", "Bind")
Tab_3:CreateInput({Name = "Ability Keybind"; PlaceholderText = InputBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
InputBind = tostring(Value)
SaveConfig("Tab_3", InputBind, "Bind")
end; })
local ChoosenAbility = LoadConfig("Tab_3", "FastFunctions", "ChoosenAbility")
Tab_3:CreateDropdown({Name = "Choose Ability"; Options = AbilityNames; CurrentOption = ChoosenAbility; MultiSelection = false; Callback = function(Value)
ChoosenAbility = ConvertDropdownValue(Value)
SaveConfig("Tab_3", ChoosenAbility, "FastFunctions", "ChoosenAbility")
end; })
Tab_3:CreateButton({Name = "Get Choosen Ability"; Callback = function()
local temp_table = table.clone(AbilityDatas[ChoosenAbility])
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })
Tab_3:CreateButton({Name = "Get All Abilities"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AbilityNames[math.random(1, 11)]);tostring(AbilityNames[math.random(1, 11)]);}}))
for _,ability in pairs(AbilityNames) do
local temp_table = table.clone(AbilityDatas[ability])
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (InputBind ~= "None" and InputBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end
end; })

Tab_3:CreateSection("Abilities")

--[[
Taunt
]]--
local TauntConfig = LoadConfig("Tab_3", "TauntConfig")
Tab_3:CreateLabel("Taunt Ability")
local TauntBind = TauntConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = TauntBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
TauntBind = tostring(Value)
SaveConfig("Tab_3", TauntBind, "TauntConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Taunt"; Callback = function()
local temp_table = table.clone(AbilityDatas["Taunt"])
pcall(function()
temp_table.InputShown = (TauntBind ~= "None" and TauntBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (TauntBind ~= "None" and TauntBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
Punch
]]--
local PunchConfig = LoadConfig("Tab_3", "PunchConfig")
Tab_3:CreateLabel("Punch Ability")
local PunchBind = PunchConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = PunchBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
PunchBind = tostring(Value)
SaveConfig("Tab_3", PunchBind, "PunchConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Punch"; Callback = function()
local temp_table = table.clone(AbilityDatas["Punch"])
pcall(function()
temp_table.InputShown = (PunchBind ~= "None" and PunchBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (PunchBind ~= "None" and PunchBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
Revolver
]]--
local RevolverConfig = LoadConfig("Tab_3", "RevolverConfig")
Tab_3:CreateLabel("Revolver Ability")
local RevolverBind = RevolverConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = RevolverBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
RevolverBind = tostring(Value)
SaveConfig("Tab_3", RevolverBind, "RevolverConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Revolver"; Callback = function()
local temp_table = table.clone(AbilityDatas["Revolver"])
pcall(function()
temp_table.InputShown = (RevolverBind ~= "None" and RevolverBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (RevolverBind ~= "None" and RevolverBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
Caretaker
]]--
local CaretakerConfig = LoadConfig("Tab_3", "CaretakerConfig")
Tab_3:CreateLabel("Caretaker Ability")
local CaretakerBind = CaretakerConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = CaretakerBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
CaretakerBind = tostring(Value)
SaveConfig("Tab_3", CaretakerBind, "CaretakerConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Caretaker"; Callback = function()
local temp_table = table.clone(AbilityDatas["Caretaker"])
pcall(function()
temp_table.InputShown = (CaretakerBind ~= "None" and CaretakerBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (CaretakerBind ~= "None" and CaretakerBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
Banana
]]--
local BananaConfig = LoadConfig("Tab_3", "BananaConfig")
Tab_3:CreateLabel("Banana Ability")
local BananaBind = BananaConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = BananaBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BananaBind = tostring(Value)
SaveConfig("Tab_3", BananaBind, "BananaConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Banana"; Callback = function()
local temp_table = table.clone(AbilityDatas["Banana"])
pcall(function()
temp_table.InputShown = (BananaBind ~= "None" and BananaBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (BananaBind ~= "None" and BananaBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
Dash
]]--
local DashConfig = LoadConfig("Tab_3", "DashConfig")
Tab_3:CreateLabel("Dash Ability")
local DashBind = DashConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = DashBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashBind = tostring(Value)
SaveConfig("Tab_3", DashBind, "DashConfig", "Bind")
end; })
local DashPower = DashConfig.Power
Tab_3:CreateInput({Name = "Power"; PlaceholderText = DashPower; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashPower = tonumber(Value)
SaveConfig("Tab_3", DashPower, "DashConfig", "Power")
end; })
local DashMaxForce = DashConfig.MaxForce
Tab_3:CreateInput({Name = "Max Force"; PlaceholderText = DashMaxForce; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashMaxForce = tonumber(Value)
SaveConfig("Tab_3", DashMaxForce, "DashConfig", "MaxForce")
end; })
local DashDuration = DashConfig.Duration
Tab_3:CreateInput({Name = "Duration"; PlaceholderText = DashDuration; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
DashDuration = tonumber(Value)
SaveConfig("Tab_3", DashDuration, "DashConfig", "Duration")
end; })
--------------------------------------------------------------------------------------
local DashConfigEffects = nil
function ApplyDashConfigurations()
if DashConfigEffects then
DashConfigEffects:Disconnect()
DashConfigEffects = nil
end
if not HumanoidRootPart then return end
if not (DashDuration > 0.3) then
DashConfigEffects = HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name == "BodyVelocity" then
c.MaxForce = Vector3.new(DashMaxForce,(DashMaxForce*0.1),DashMaxForce)
c.P = DashPower
game.Debris:AddItem(c, DashDuration)
end
end)
elseif DashDuration > 0.3 then
DashConfigEffects = HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name == "BodyVelocity" then
c:Destroy()
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(DashMaxForce,(DashMaxForce*0.1),DashMaxForce)
BodyVelocity.P = DashPower
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, DashDuration)
end
end)
end
end
--------------------------------------------------------------------------------------
Tab_3:CreateButton({Name = "Get Dash"; Callback = function()
local temp_table = table.clone(AbilityDatas["Dash"])
pcall(function()
temp_table.InputShown = (DashBind ~= "None" and DashBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (DashBind ~= "None" and DashBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
ApplyDashConfigurations()
end; })

--[[
Hotdog
]]--
local HotdogConfig = LoadConfig("Tab_3", "HotdogConfig")
Tab_3:CreateLabel("Hotdog Ability")
local HotdogBind = HotdogConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = HotdogBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
HotdogBind = tostring(Value)
SaveConfig("Tab_3", HotdogBind, "HotdogConfig", "Bind")
end; })
local HotdogStaminaLoss = HotdogConfig.StaminaLoss
Tab_3:CreateInput({Name = "Stamina Loss per Hotdog"; PlaceholderText = HotdogStaminaLoss; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
HotdogStaminaLoss = tonumber(Value)
SaveConfig("Tab_3", HotdogStaminaLoss, "HotdogConfig", "StaminaLoss")
end; })
--------------------------------------------------------------------------------------
local HotdogConfigEffects = nil
function ApplyHotdogConfigurations()
if HotdogConfigEffects then
HotdogConfigEffects:Disconnect()
HotdogConfigEffects = nil
end
if not HumanoidRootPart then return end
if HotdogStaminaLoss == 5 then return end
HotdogConfigEffects = HumanoidRootPart.Hotdog:GetPropertyChangedSignal("Playing"):Connect(function(c)
if HumanoidRootPart.Hotdog.Playing == true then
local OldMaxStamina = tonumber(Character:GetAttribute("MaxStamina"))
if not OldMaxStamina then return end
Character:GetAttributeChangedSignal("MaxStamina"):Once(function()
Character:SetAttribute("MaxStamina", tonumber(OldMaxStamina-HotdogStaminaLoss))
end)
end
end)
end
--------------------------------------------------------------------------------------
Tab_3:CreateButton({Name = "Get Hotdog"; Callback = function()
local temp_table = table.clone(AbilityDatas["Hotdog"])
pcall(function()
temp_table.InputShown = (HotdogBind ~= "None" and HotdogBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (HotdogBind ~= "None" and HotdogBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
ApplyHotdogConfigurations()
end; })

--[[
Block
]]--
local BlockConfig = LoadConfig("Tab_3", "BlockConfig")
Tab_3:CreateLabel("Block Ability")
local BlockBind = BlockConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = BlockBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BlockBind = tostring(Value)
SaveConfig("Tab_3", BlockBind, "BlockConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Block"; Callback = function()
local temp_table = table.clone(AbilityDatas["Block"])
pcall(function()
temp_table.InputShown = (BlockBind ~= "None" and BlockBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (BlockBind ~= "None" and BlockBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
Adrenaline
]]--
local AdrenalineConfig = LoadConfig("Tab_3", "AdrenalineConfig")
Tab_3:CreateLabel("Adrenaline Ability")
local AdrenalineBind = AdrenalineConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = AdrenalineBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AdrenalineBind = tostring(Value)
SaveConfig("Tab_3", AdrenalineBind, "AdrenalineConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Adrenaline"; Callback = function()
local temp_table = table.clone(AbilityDatas["Adrenaline"])
pcall(function()
temp_table.InputShown = (AdrenalineBind ~= "None" and AdrenalineBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (AdrenalineBind ~= "None" and AdrenalineBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })

--[[
BonusPad
]]--
local BonusPadConfig = LoadConfig("Tab_3", "BonusPadConfig")
Tab_3:CreateLabel("BonusPad Ability")
local BonusPadBind = BonusPadConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = BonusPadBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BonusPadBind = tostring(Value)
SaveConfig("Tab_3", BonusPadBind, "BonusPadConfig", "Bind")
end; })
local BonusPadSpeedModifier = BonusPadConfig.SpeedModifier
Tab_3:CreateInput({Name = "Speed Modifier"; PlaceholderText = BonusPadSpeedModifier; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BonusPadSpeedModifier = tonumber(Value)
SaveConfig("Tab_3", BonusPadSpeedModifier, "BonusPadConfig", "SpeedModifier")
end; })
--------------------------------------------------------------------------------------
local BonusPadConfigEffects = nil
function ApplyBonusPadConfigurations()
if BonusPadConfigEffects then
BonusPadConfigEffects:Disconnect()
BonusPadConfigEffects = nil
end
if not HumanoidRootPart then return end
if BonusPadSpeedModifier == 7 then return end
BonusPadConfigEffects = Character.ChildAdded:Connect(function(c)
if c:IsA("Highlight") and c.Name == "CoolHighlight" then
task.wait()
local OldWalkSpeedModifier = tonumber(Character:GetAttribute("WalkSpeedModifier"))
if not OldWalkSpeedModifier then return end
if OldWalkSpeedModifier > 6 then
Character:SetAttribute("WalkSpeedModifier", tonumber((OldWalkSpeedModifier-7)+BonusPadSpeedModifier))
end
end
end)
end
--------------------------------------------------------------------------------------
Tab_3:CreateButton({Name = "Get BonusPad"; Callback = function()
local temp_table = table.clone(AbilityDatas["BonusPad"])
pcall(function()
temp_table.InputShown = (BonusPadBind ~= "None" and BonusPadBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (BonusPadBind ~= "None" and BonusPadBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
ApplyBonusPadConfigurations()
end; })



--[[
Cloak
]]--
local CloakConfig = LoadConfig("Tab_3", "CloakConfig")
Tab_3:CreateLabel("Cloak Ability")
local CloakBind = CloakConfig.Bind
Tab_3:CreateInput({Name = "Keybind"; PlaceholderText = CloakBind; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
CloakBind = tostring(Value)
SaveConfig("Tab_3", CloakBind, "CloakConfig", "Bind")
end; })
Tab_3:CreateButton({Name = "Get Cloak"; Callback = function()
local temp_table = table.clone(AbilityDatas["Cloak"])
pcall(function()
temp_table.InputShown = (CloakBind ~= "None" and CloakBind.Name) or ""
end)
pcall(function()
temp_table.InputShown = (CloakBind ~= "None" and CloakBind) or ""
end)
AbilityModule.CreateAbility(temp_table)
end; })



Tab_3:CreateSection("Get Cards")

local CardSettings = {
    [1] = LoadConfig("Tab_3", "Cards", "FirstCard"),
    [2] = LoadConfig("Tab_3", "Cards", "SecondCard"),
    [3] = LoadConfig("Tab_3", "Cards", "ThirdCard")
}
Tab_3:CreateLabel("First Card Settings")
Tab_3:CreateDropdown({Name = "First Ability"; Options = AbilityNames; CurrentOption = CardSettings[1][1]; MultiSelection = false; Callback = function(Value)
CardSettings[1][1] = ConvertDropdownValue(Value)
SaveConfig("Tab_3", CardSettings[1][1], "Cards", "FirstCard", 1)
end; })
Tab_3:CreateDropdown({Name = "Second Ability"; Options = AbilityNames; CurrentOption = CardSettings[1][2]; MultiSelection = false; Callback = function(Value)
CardSettings[1][2] = ConvertDropdownValue(Value)
SaveConfig("Tab_3", CardSettings[1][2], "Cards", "FirstCard", 2)
end; })

Tab_3:CreateLabel("Second Card Settings")
Tab_3:CreateDropdown({Name = "First Ability"; Options = AbilityNames; CurrentOption = CardSettings[2][1]; MultiSelection = false; Callback = function(Value)
CardSettings[2][1] = ConvertDropdownValue(Value)
SaveConfig("Tab_3", CardSettings[2][1], "Cards", "SecondCard", 1)
end; })
Tab_3:CreateDropdown({Name = "Second Ability"; Options = AbilityNames; CurrentOption = CardSettings[2][2]; MultiSelection = false; Callback = function(Value)
CardSettings[2][2] = ConvertDropdownValue(Value)
SaveConfig("Tab_3", CardSettings[2][2], "Cards", "SecondCard", 2)
end; })

Tab_3:CreateLabel("Third Card Settings")
Tab_3:CreateDropdown({Name = "First Ability"; Options = AbilityNames; CurrentOption = CardSettings[3][1]; MultiSelection = false; Callback = function(Value)
CardSettings[3][1] = ConvertDropdownValue(Value)
SaveConfig("Tab_3", CardSettings[3][1], "Cards", "ThirdCard", 1)
end; })
Tab_3:CreateDropdown({Name = "Second Ability"; Options = AbilityNames; CurrentOption = CardSettings[3][2]; MultiSelection = false; Callback = function(Value)
CardSettings[3][2] = ConvertDropdownValue(Value)
SaveConfig("Tab_3", CardSettings[3][2], "Cards", "ThirdCard", 2)
end; })

Tab_3:CreateButton({Name = "Summon Chosen Cards"; Callback = function()
UIModule.AbilitySelection(unpack(CardSettings))
end; })

Tab_3:CreateSection("")
Tab_3:CreateSection("")

Tab_3:CreateParagraph({Title = "Immunities / Buffs", Content = "Immunities and buffs for workspace side"})

Tab_3:CreateSection("Workspace Side")

local InstaDestroyComputer = LoadConfig("Tab_3", "IB", "InstaDestroyComputer")
local InstaDestroyComputerToggle = Tab_3:CreateToggle({Name = "Insta-Destroy Badware Computer"; CurrentValue = false; Callback = function(Value)
InstaDestroyComputer = Value
SaveConfig("Tab_3", InstaDestroyComputer, "IB", "InstaDestroyComputer")
end; })
game:GetService("ProximityPromptService").PromptShown:Connect(function(a,b)
task.wait()
if InstaDestroyComputer ~= true then return end
a.HoldDuration = 0
for i = 1,40 do
pcall(fireproximityprompt, a)
task.wait()
end
end)
InstaDestroyComputerToggle:Set(InstaDestroyComputer)

local AntiWalls = LoadConfig("Tab_3", "IB", "AntiWalls")
local AntiWallsToggle = Tab_3:CreateToggle({Name = "Anti-Artful Walls"; CurrentValue = false; Callback = function(Value)
AntiWalls = Value
task.spawn(ClearWalls)
SaveConfig("Tab_3", AntiWalls, "IB", "AntiWalls")
end; })
function ClearWalls()
for _,d in next, game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other"):GetDescendants() do
if AntiWalls ~= true then return end
if d and d.Name == "HumanoidRootPart" and d.Anchored == true then
d.CanCollide = false
d.CanTouch = false
d.Transparency = 0.5
end
end
end
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other").DescendantAdded:Connect(function(d)
if AntiWalls ~= true then return end
if d and d.Name == "HumanoidRootPart" and d.Anchored == true then
d.CanCollide = false
d.CanTouch = false
d.Transparency = 0.5
end
end)
AntiWallsToggle:Set(AntiWalls)

local AntiEvilScary1 = LoadConfig("Tab_3", "IB", "AntiEvilScary")
local AntiEvilScary1Toggle = Tab_3:CreateToggle({Name = "Anti Evil Scary"; CurrentValue = false; Callback = function(Value)
AntiEvilScary1 = Value
if AntiEvilScary1 == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
if v and v.Name == "EvilScary" then
for _,trans in pairs(v:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(v:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
end
end
v.CanCollide = false
v.CanTouch = false
pcall(function()
v.CanQuery = false
end)
end
end
end
SaveConfig("Tab_3", AntiEvilScary1, "IB", "AntiEvilScary")
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
if child and child.Name == "EvilScary" and AntiEvilScary1 == true then
for _,trans in pairs(child:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(child:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
end
end
child.CanCollide = false
child.CanTouch = false
pcall(function()
child.CanQuery = false
end)
end
end)
AntiEvilScary1Toggle:Set(AntiEvilScary1)


local AntiBarriers1 = false
local AntiBarriers1_con = nil
local AntiBarriers1_toggle = nil
AntiBarriers1_toggle = Tab_3:CreateToggle({Name = "Anti Barriers"; CurrentValue = AntiBarriers1; Callback = function(Value)
AntiBarriers1 = Value
pcall(function()
if AntiBarriers1 == true then
if workspace.GameAssets:FindFirstChild("Map") == nil then
AntiBarriers1_toggle:Set(false)
return
end
workspace.GameAssets.Map.Config.Barriers.Parent = game:GetService("LogService")
AntiBarriers1_con = workspace.GameAssets.ChildRemoved:Once(function(c)
if c.Name == "Map" and AntiBarriers == true then
game:GetService("LogService").Barriers:Destroy()
end
end)
else
if AntiBarriers1_con then
AntiBarriers1_con:Disconnect()
AntiBarriers1_con = nil
end
game:GetService("LogService").Barriers.Parent = workspace.GameAssets.Map.Config
end
end)
end; })
workspace.GameAssets.ChildRemoved:Connect(function(c)
if c.Name == "Map" and AntiBarriers1 == true then
AntiBarriers_toggle:Set(false)
end
end)


local AntiFallRagdoll = LoadConfig("Tab_3", "IB", "AntiFallRagdoll")
local AntiFallRagdollToggle = Tab_3:CreateToggle({Name = "Anti Fall Ragdoll"; CurrentValue = false; Callback = function(Value)
AntiFallRagdoll = Value
for i,v in next, workspace.GameAssets:GetDescendants() do
if v.Name == "FallDamage" and v:IsA("BasePart") then
child.CanCollide = not AntiFallRagdoll
child.CanTouch = not AntiFallRagdoll
pcall(function()
child.CanQuery = not AntiFallRagdoll
end)
end
end
SaveConfig("Tab_3", AntiFallRagdoll, "IB", "AntiFallRagdoll")
end; })
workspace.GameAssets.DescendantAdded:Connect(function(child)
if AntiFallRagdoll ~= true then return end
if child.Name == "FallDamage" and child:IsA("BasePart") then
child.CanCollide = false
child.CanTouch = false
pcall(function()
child.CanQuery = false
end)
end
end)
AntiFallRagdollToggle:Set(AntiFallRagdoll)






----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------












local Tab_5 = Window:CreateTab("Killer",0)
Tab_5:CreateParagraph({Title = "Abilities Editor", Content = "Ability Editor and giver"})

Tab_5:CreateSection("Universal ( except for killdroid ☹ )")
Tab_5:CreateButton({Name = "Get Faster Swing"; Callback = function(Value)
AbilityModule.CreateAbility({Client = true,ClientFunction = function() game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Swing") end,Name = "Whack_NH",InputShown = "M2",Tip = "Swing but faster.",Cooldown = 0.01, Icon = "rbxassetid://13771861804",DisplayName = "Whack"})
end; })
Tab_5:CreateButton({Name = "Get Lunge Attack"; Callback = function(Value)
local function Ability()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
task.spawn(function()
local a = nil
for i = 1,10 do
if a == true then return end
a = game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Swing")
end
end)
local function onswing()
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = .6
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(1000000,1000,1000000)
BodyVelocity.P = 1250
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .25)
task.wait(.15)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")*2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")*2))
end
local c = nil
local d = nil
c = Humanoid.AnimationPlayed:Connect(function(track)
if track.Animation.AnimationId == "rbxassetid://80787680522855" then
c:Disconnect()
track:Stop()
task.spawn(onswing)
end
end)
end
local lunge_abil = function()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = 0.6
a:AdjustSpeed(0)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")/2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")/2))
task.spawn(Ability)
repeat task.wait() until Character:GetAttribute("SprintSpeed") > 13
a:Stop()
end
AbilityModule.CreateAbility({Client = true,ClientFunction = lunge_abil,Name = "Lunge_NH",InputShown = "F",Tip = "Lunge forwards to deal damage.",Cooldown = 3,Icon = "rbxassetid://105910997361738",DisplayName = "Lunge"})
end; })

Tab_5:CreateSection("Pursuer")
local PursuerConfig = LoadConfig("Tab_5", "PursuerConfig")
local PursuerCleaveBoost = PursuerConfig.CleaveBoost
Tab_5:CreateInput({Name = "Cleave Boost"; PlaceholderText = PursuerCleaveBoost; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
PursuerCleaveBoost = Value
SaveConfig("Tab_5", PursuerCleaveBoost, "PursuerConfig", "CleaveBoost")
end; })
--------------------------------------------------------------------------------------
local PursuerConfigEffects = nil
function ApplyPursuerConfigurations()
if PursuerConfigEffects then
PursuerConfigEffects:Disconnect()
PursuerConfigEffects = nil
end
if not Character then return end
if PursuerCleaveBoost == 6 then return end
PursuerConfigEffects = Character:GetAttributeChangedSignal("WalkSpeedModifier"):Connect(function()
local OldWalkSpeedModifier = Character:GetAttribute("WalkSpeedModifier")
if not OldWalkSpeedModifier then return end
if OldWalkSpeedModifier == 6 then
Character:SetAttribute("WalkSpeedModifier", PursuerCleaveBoost)
end
end)
end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Pursuer Configurations"; Callback = function()
ApplyPursuerConfigurations()
Notify("Success!", "Applied configurations.", 3, true)
end; })

Tab_5:CreateSection("Badware")
local BadwareConfig = LoadConfig("Tab_5", "BadwareConfig")
local BadwareHipHeight = BadwareConfig.HipHeight
Tab_5:CreateInput({Name = "Hip Height when placing computers"; PlaceholderText = BadwareHipHeight; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
BadwareHipHeight = Value
SaveConfig("Tab_5", BadwareHipHeight, "BadwareConfig", "HipHeight")
end; })
--------------------------------------------------------------------------------------
local BadwareConfigEffects = nil
function ApplyBadwareConfigurations()
if BadwareConfigEffects then
BadwareConfigEffects:Disconnect()
BadwareConfigEffects = nil
end
if not HumanoidRootPart then return end
if not Humanoid then return end
if BadwareHipHeight == 0 then return end
BadwareConfigEffects = HumanoidRootPart.FirewallBypass:GetPropertyChangedSignal("Playing"):Connect(function(c)
if HumanoidRootPart.FirewallBypass.Playing ~= true then return end
Humanoid.HipHeight = tonumber(BadwareHipHeight)
task.wait(2)
Humanoid.HipHeight = 0
end)
end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Badware Configurations"; Callback = function()
ApplyBadwareConfigurations()
Notify("Success!", "Applied configurations.", 3, true)
end; })

Tab_5:CreateSection("Artful")
local ArtfulConfig = LoadConfig("Tab_5", "ArtfulConfig")
local ArtfulHipHeight = ArtfulConfig.HipHeight
Tab_5:CreateInput({Name = "Hip Height when placing walls/music box"; PlaceholderText = ArtfulHipHeight; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ArtfulHipHeight = Value
SaveConfig("Tab_5", ArtfulHipHeight, "ArtfulConfig", "HipHeight")
end; })
--------------------------------------------------------------------------------------
local ArtfulConfigEffects = nil
function ApplyArtfulConfigurations()
if ArtfulConfigEffects then
ArtfulConfigEffects:Disconnect()
ArtfulConfigEffects = nil
end
if not HumanoidRootPart then return end
if not Humanoid then return end
if ArtfulHipHeight == 0 then return end
ArtfulConfigEffects = HumanoidRootPart["CopyThrice2"]:GetPropertyChangedSignal("Playing"):Connect(function(c)
if HumanoidRootPart["CopyThrice2"].Playing ~= true then return end
Humanoid.HipHeight = tonumber(ArtfulHipHeight)
task.wait(2)
Humanoid.HipHeight = 0
end)
end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Artful Configurations"; Callback = function()
ApplyArtfulConfigurations()
Notify("Success!", "Applied configurations.", 3, true)
end; })

Tab_5:CreateSection("Harken")
Tab_5:CreateLabel("Nothing Yet...")

Tab_5:CreateSection("Killdroid")
local KilldroidConfig = LoadConfig("Tab_5", "KilldroidConfig")
local KilldroidPower = KilldroidConfig.Power
Tab_5:CreateInput({Name = "Power"; PlaceholderText = KilldroidPower; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
KilldroidPower = tonumber(Value)
SaveConfig("Tab_5", KilldroidPower, "KilldroidConfig", "Power")
end; })
local KilldroidMaxForce = KilldroidConfig.MaxForce
Tab_5:CreateInput({Name = "Max Force"; PlaceholderText = KilldroidMaxForce; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
KilldroidMaxForce = tonumber(Value)
SaveConfig("Tab_5", KilldroidMaxForce, "KilldroidConfig", "MaxForce")
end; })
local KilldroidDD = KilldroidConfig["Don'tDescendDuringTheFlight"]
Tab_5:CreateToggle({Name = "Dont Descend During the Flight"; CurrentValue = KilldroidDD; Callback = function(Value)
KilldroidDD = Value
SaveConfig("Tab_5", KilldroidDD, "KilldroidConfig", "Don'tDescendDuringTheFlight")
end; })
--------------------------------------------------------------------------------------
local KilldroidConfigEffects = nil
local KilldroidFlightConfig = nil
function ApplyKilldroidConfigurations()
if KilldroidConfigEffects then
KilldroidConfigEffects:Disconnect()
KilldroidConfigEffects = nil
end
if KilldroidFlightConfig then
KilldroidFlightConfig:Disconnect()
KilldroidFlightConfig = nil
end
if not HumanoidRootPart then return end
KilldroidConfigEffects = HumanoidRootPart.ChildAdded:Connect(function(c)
if c.Name == "BodyVelocity" then
c.MaxForce = Vector3.new(KilldroidMaxForce,KilldroidMaxForce,KilldroidMaxForce)
c.P = KilldroidPower
if KilldroidDD ~= true then return end
task.spawn(function()
pcall(function()
KilldroidFlightConfig = game:GetService("RunService").RenderStepped:Connect(function()
if c.Velocity.Y < 0 then
c.Velocity = Vector3.new(c.Velocity.X,0,c.Velocity.Z)
end
end)
end)
end)
end
end)
for _,c in next, HumanoidRootPart:GetChildren() do
if c.Name == "BodyVelocity" then
c.MaxForce = Vector3.new(KilldroidMaxForce,KilldroidMaxForce,KilldroidMaxForce)
c.P = KilldroidPower
if KilldroidDD ~= true then return end
task.spawn(function()
pcall(function()
KilldroidFlightConfig = game:GetService("RunService").RenderStepped:Connect(function()
if c.Velocity.Y < 0 then
c.Velocity = Vector3.new(c.Velocity.X,0,c.Velocity.Z)
end
end)
end)
end)
end
end

end
--------------------------------------------------------------------------------------
Tab_5:CreateButton({Name = "Apply Killdroid Configurations"; Callback = function(Value)
ApplyKilldroidConfigurations()
Notify("Success!", "Applied configurations.", 3, true)
end; })


Tab_5:CreateSection("")
Tab_5:CreateSection("")

Tab_5:CreateParagraph({Title = "Immunities / Buffs", Content = "Immunities and buffs for workspace side"})

Tab_5:CreateSection("Workspace Side")

local BackupEffect = game:GetService("ReplicatedStorage").Events.RemoteEvents.TauntEffect:Clone()
BackupEffect.Parent = game.LogService
local AntiTaunt = LoadConfig("Tab_5", "IB", "AntiTaunt")
local AntiTauntToggle = Tab_5:CreateToggle({Name = "Anti Taunt"; CurrentValue = false; Callback = function(Value)
AntiTaunt = Value
if AntiTaunt == true then
LocalPlayer.PlayerGui.MainGui.RoundUI.TauntTemplate:Destroy()
else
if LocalPlayer.PlayerGui.MainGui.RoundUI:FindFirstChild("TauntTemplate") == nil then
local a = BackupEffect:Clone()
a.Parent = LocalPlayer.PlayerGui.MainGui.RoundUI
end
end
SaveConfig("Tab_5", AntiTaunt, "IB", "AntiTaunt")
end; })
LocalPlayer.PlayerGui.MainGui.RoundUI.ChildAdded:Connect(function(child)
if child.Name == "TauntTemplate" and AntiTaunt == true then
child:Destroy()
if Character:GetAttribute("WalkSpeedModifier") ~= nil and Character:GetAttribute("WalkSpeedModifier") < 0 then
Character:SetAttribute("WalkSpeedModifier", 0)
else
task.wait(.05)
Character:SetAttribute("WalkSpeedModifier", 0)
end
end
end)
AntiTauntToggle:Set(AntiTaunt)

Tab_5:CreateButton({Name = "Remove Destroyable Objects"; Callback = function(Value)
pcall(function()
workspace.GameAssets.Map.Build.Destroyable:Destroy()
end)
end; })

local AntiEvilScary2 = LoadConfig("Tab_5", "IB", "AntiEvilScary")
local AntiEvilScary2Toggle = Tab_5:CreateToggle({Name = "Anti Evil Scary"; CurrentValue = false; Callback = function(Value)
AntiEvilScary2 = Value
if AntiEvilScary2 == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
if v and v.Name == "EvilScary" then
for _,trans in pairs(v:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(v:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
end
end
v.CanCollide = false
v.CanTouch = false
pcall(function()
v.CanQuery = false
end)
end
end
end
SaveConfig("Tab_5", AntiEvilScary2, "IB", "AntiEvilScary")
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
if child and child.Name == "EvilScary" and AntiEvilScary2 == true then
for _,trans in pairs(child:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(child:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
end
end
child.CanCollide = false
child.CanTouch = false
pcall(function()
child.CanQuery = false
end)
end
end)
AntiEvilScary2Toggle:Set(AntiEvilScary2)


local AntiBarriers2 = false
local AntiBarriers2_con = nil
local AntiBarriers2_toggle = nil
AntiBarriers2_toggle = Tab_5:CreateToggle({Name = "Anti Barriers"; CurrentValue = AntiBarriers2; Callback = function(Value)
AntiBarriers2 = Value
pcall(function()
if AntiBarriers2 == true then
if workspace.GameAssets:FindFirstChild("Map") == nil then
AntiBarriers2_toggle:Set(false)
return
end
workspace.GameAssets.Map.Config.Barriers.Parent = game:GetService("LogService")
AntiBarriers2_con = workspace.GameAssets.ChildRemoved:Once(function(c)
if c.Name == "Map" and AntiBarriers == true then
game:GetService("LogService").Barriers:Destroy()
end
end)
else
if AntiBarriers2_con then
AntiBarriers2_con:Disconnect()
AntiBarriers2_con = nil
end
game:GetService("LogService").Barriers.Parent = workspace.GameAssets.Map.Config
end
end)
end; })
workspace.GameAssets.ChildRemoved:Connect(function(c)
if c.Name == "Map" and AntiBarriers2 == true then
AntiBarriers2_toggle:Set(false)
end
end)




----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------











if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
task.wait()
end

_G.ESPenabledHandler = LoadConfig("Tab_4", "ESP", "Enabled")
_G.ESPtransHandler = LoadConfig("Tab_4", "ESP", "Transparency")
_G.ESPshowusers = LoadConfig("Tab_4", "ESP", "ShowUsernames")
_G.ESPshowhealth = LoadConfig("Tab_4", "ESP", "ShowHealth")


function CreateHighlight(plr)
task.spawn(function()
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetChildren()) do
if v and v.Name == ("sillyfolder_"..plr.Name) then
v:Destroy()
end
end
repeat task.wait() until game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) == nil
local esp_folder = Instance.new("Folder")
esp_folder.Name = "sillyfolder_"..plr.Name
esp_folder.Parent = game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER")
      
repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
local plr_char = plr.Character or plr.CharacterAdded:Wait()
for i,v in pairs(plr_char:GetChildren()) do
if v and v:IsA("BasePart") and (v.Name == "Left Leg" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "Head") then
local esp = Instance.new("BoxHandleAdornment")
esp.Name = "sillygirl_"..plr.Name
esp.Adornee = v
esp.AlwaysOnTop = true
esp.ZIndex = 10 or 1
esp.Size = v.Size
esp.Transparency = (plr_char.Parent.Name == "Workspace" and 1) or tonumber(_G.ESPtransHandler)
esp.Color = (plr_char.Parent.Name == "Killer" and BrickColor.new("Bright red")) or (plr_char.Parent.Name == "Ghost" and BrickColor.new("White")) or BrickColor.new("Bright green")
esp.Parent = game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name)
if v.Name == "Head" then
local esp_stat = Instance.new("BillboardGui")
local stat_text = Instance.new("TextLabel")
esp_stat.Adornee = v
esp_stat.AlwaysOnTop = true
esp_stat.Parent = esp
esp_stat.Size = UDim2.new(0, 80, 0, 50)
esp_stat.StudsOffset = Vector3.new(0, .2, 0)
stat_text.ZIndex = 10
stat_text.BackgroundTransparency = 1
stat_text.Position = UDim2.new(0, 0, 0, -50)
stat_text.Size = UDim2.new(0, 80, 0, 80)
stat_text.Font = Enum.Font.SourceSansSemibold
stat_text.TextSize = 15
stat_text.TextColor3 = Color3.new(1, 1, 1)
stat_text.TextStrokeTransparency = 0
stat_text.TextYAlignment = Enum.TextYAlignment.Bottom
stat_text.Parent = esp_stat
task.spawn(function()
pcall(function()
while task.wait(.05) do
stat_text.Text = ((_G.ESPshowusers == true and "Name: "..plr.Name.."") or "")..""..((_G.ESPshowusers == true and _G.ESPshowhealth == true and "\n") or "")..""..((_G.ESPshowhealth == true and "Health: "..plr_char.Humanoid.Health.."") or "")
end
end)
end)
end

end
end
      
local char_connection, team_connection, dstr_connection
char_connection = plr.CharacterAdded:Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
team_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
char_connection:Disconnect()
end)

team_connection = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
char_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
team_connection:Disconnect()
end)

dstr_connection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
if child.Name == "DOD_ESP_HANDLER" then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
team_connection:Disconnect()
char_connection:Disconnect()
dstr_connection:Disconnect()
end      
end)

end)
end

function ChangeTransparency(trans)
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetDescendants()) do
if v and v:IsA("BoxHandleAdornment") then
v.Transparency = trans
end
end
end

local Tab_4 = Window:CreateTab("Visual",0)

Tab_4:CreateParagraph({Title = "Visual", Content = "You can change some of the visual parts of the game here."})
Tab_4:CreateSection("ESP")

Tab_4:CreateSlider({Name = "ESP Transparency (in %)"; Range = {0, 100}; Increment = 5; Suffix = "%"; CurrentValue = (_G.ESPtransHandler*100); Callback = function(Value)
_G.ESPtransHandler = (tonumber(Value) / 100)
ChangeTransparency(tonumber(_G.ESPtransHandler))
SaveConfig("Tab_4", _G.ESPtransHandler, "ESP", "Transparency")
end; })

Tab_4:CreateToggle({Name = "Show Username"; CurrentValue = _G.ESPshowusers; Callback = function(Value)
_G.ESPshowusers = Value
SaveConfig("Tab_4", _G.ESPshowusers, "ESP", "ShowUsernames")
end; })

Tab_4:CreateToggle({Name = "Show Health"; CurrentValue = _G.ESPshowhealth; Callback = function(Value)
_G.ESPshowhealth = Value
SaveConfig("Tab_4", _G.ESPshowhealth, "ESP", "ShowHealth")
end; })

plradded_esp = nil
plrremoved_esp = nil
local ESPenabledToggle = Tab_4:CreateToggle({Name = "Turn On/Off ESP"; CurrentValue = false; Callback = function(Value)
_G.ESPenabledHandler = Value
if _G.ESPenabledHandler == true then
if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
task.wait()
end
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v and v ~= game:GetService("Players").LocalPlayer then
CreateHighlight(v)
end
end
plradded_esp = game:GetService("Players").PlayerAdded:Connect(function(plr)
CreateHighlight(plr)
end)
plrremoved_esp = game:GetService("Players").PlayerRemoving:Connect(function(plr)
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
end)
elseif _G.ESPenabledHandler == false then
game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):Destroy()
if plradded_esp ~= nil then
plradded_esp:Disconnect()
plradded_esp = nil
end
if plrremoved_esp ~= nil then
plrremoved_esp:Disconnect()
plrremoved_esp = nil
end
end
SaveConfig("Tab_4", _G.ESPenabledHandler, "ESP", "Enabled")
end; })
ESPenabledToggle:Set(_G.ESPenabledHandler)

Tab_4:CreateSection("Gui Management ε=( o｀ω′)ノ")

Tab_4:CreateButton({Name = "Open Shop"; Callback = function()
UIModule.OpenShop()
end; })
Tab_4:CreateToggle({Name = "Teammate Death Effect Enabled"; CurrentValue = true; Callback = function(Value)
if TestRequire() ~= true then
ErrorRequire()
return nil
end
DeathEffectEnabled = Value
if DeathEffectEnabled == true then
UIModule["TeamateDeathEffect"] = function()
	game:GetService("Lighting").TeamateDeathEffect.Enabled = true
	game:GetService("Lighting").TeamateDeathEffect.Contrast = 0
	game:GetService("Lighting").TeamateDeathEffect.TintColor = Color3.fromRGB(255, 255, 255)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["Contrast"] = 1
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["TintColor"] = Color3.fromRGB(255, 52, 52)
	}):Play()
	task.wait(0.5)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["Contrast"] = 0
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
end
Notify("Success!", "Enabled!", 3, true)
elseif DeathEffectEnabled == false then
UIModule["TeamateDeathEffect"] = function() return nil end
Notify("Success!", "Disabled!", 3, true)
end
end; })

function AwardPoints(points, reason)
	local Template = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"):WaitForChild("PlayerPoints"):Clone()
	Template.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui").PlayerPoints
	Template.Frame.Title.Text = "<font color=\'rgb(255, 64, 67)\'>"..tostring(points).." Points</font> Awarded "..tostring(reason)
	Template.Frame.Title.TextTransparency = 1
	Template.Frame.Title.UIStroke.Transparency = 1
	Template.Frame.Cash.ImageTransparency = 1
	game:GetService("Debris"):AddItem(Template, 10)
	game:GetService("TweenService"):Create(Template.Frame.Cash, TweenInfo.new(10, Enum.EasingStyle.Linear), {
		["Rotation"] = 360
	}):Play()
	pcall(function()
		for _ = 0,5 do
			task.wait(0.2)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency - 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency - 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency - 0.2
		end
		task.wait(6)
		for _ = 0,5 do
			task.wait(0.5)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency + 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency + 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency + 0.2
		end
	end)
end
MoneyToGet = LoadConfig("Tab_4", "Money", "Amount")
ReasonForMoney = LoadConfig("Tab_4", "Money", "Reason")

Tab_4:CreateSection("Money Giver ( Visual )")

Tab_4:CreateInput({Name = "Money amount"; PlaceholderText = MoneyToGet; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
MoneyToGet = Value
SaveConfig("Tab_4", MoneyToGet, "Money", "Amount")
end; })

Tab_4:CreateInput({Name = "Reason for getting money"; PlaceholderText = ReasonForMoney; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ReasonForMoney = tostring(Value)
SaveConfig("Tab_4", ReasonForMoney, "Money", "Reason")
end; })

Tab_4:CreateButton({Name = "Give money"; Callback = function()
AwardPoints(MoneyToGet, ReasonForMoney)
end; })

Tab_4:CreateSection("Custom Skins")

-- i am sorry this was made by ai because i dont know accessory things
function weldAttachments(attach1, attach2)
  local weld = Instance.new("Weld")
  weld.Part0 = attach1.Parent
  weld.Part1 = attach2.Parent
  weld.C0 = attach1.CFrame
  weld.C1 = attach2.CFrame
  weld.Parent = attach1.Parent
  return weld
end
local function buildWeld(weldName, parent, part0, part1, c0, c1)
  local weld = Instance.new("Weld")
  weld.Name = weldName
  weld.Part0 = part0
  weld.Part1 = part1
  weld.C0 = c0
  weld.C1 = c1
  weld.Parent = parent
  return weld
end
local function findFirstMatchingAttachment(model, name)
  for _, child in pairs(model:GetChildren()) do
    if child:IsA("Attachment") and child.Name == name then
      return child
    elseif not child:IsA("Accoutrement") and not child:IsA("Tool") then
      local foundAttachment = findFirstMatchingAttachment(child, name)
      if foundAttachment then
        return foundAttachment
      end
    end
  end
end
function AddAccessory(character, accoutrement, bodyPartName)
  accoutrement.Parent = character
  local handle = accoutrement:FindFirstChild("Handle")
  if not handle then
    return
  end
  local bodyPart = character:FindFirstChild(bodyPartName or "Head")
  if not bodyPart then
    return
  end
  local accAttachment = handle:FindFirstChildOfClass("Attachment")
  if accAttachment then
    local bodyAttachment = bodyPart:FindFirstChild(accAttachment.Name)
    if not bodyAttachment then
      bodyAttachment = Instance.new("Attachment")
      bodyAttachment.Name = accAttachment.Name
      bodyAttachment.Parent = bodyPart
      if bodyPartName == "Head" then
        bodyAttachment.Position = Vector3.new(0, 0.5, 0)
      elseif bodyPartName == "Torso" then
        bodyAttachment.Position = Vector3.new(0, 1, 0)
      elseif bodyPartName == "Right Arm" then
        bodyAttachment.Position = Vector3.new(1, 0.5, 0)
      elseif bodyPartName == "Left Arm" then
        bodyAttachment.Position = Vector3.new(-1, 0.5, 0)
      elseif bodyPartName == "Right Leg" then
        bodyAttachment.Position = Vector3.new(0.5, 1, 0)
      elseif bodyPartName == "Left Leg" then
        bodyAttachment.Position = Vector3.new(-0.5, 1, 0)
      else
        bodyAttachment.Position = Vector3.new(0, 0, 0)
      end
    end
    weldAttachments(bodyAttachment, accAttachment)
  else
    local weld = Instance.new("Weld")
    weld.Name = bodyPartName .. "Weld"
    weld.Part0 = bodyPart
    weld.Part1 = handle
    weld.Parent = bodyPart
    if bodyPartName == "Head" then
      weld.C0 = CFrame.new(0, 0.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Torso" then
      weld.C0 = CFrame.new(0, 1.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Right Arm" then
      weld.C0 = CFrame.new(1.5, 0.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Left Arm" then
      weld.C0 = CFrame.new(-1.5, 0.5, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Right Leg" then
      weld.C0 = CFrame.new(0.5, 2, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    elseif bodyPartName == "Left Leg" then
      weld.C0 = CFrame.new(-0.5, 2, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    else
      weld.C0 = CFrame.new(0, 0, 0)
      weld.C1 = CFrame.new(0, 0, 0)
    end
  end
  return accoutrement
end
function EditHumanoidChild(char, part, value)
if part == "Pants" then
char:FindFirstChildOfClass("Pants").PantsTemplate = value
elseif part == "Shirt" then
char:FindFirstChildOfClass("Shirt").ShirtTemplate = value
elseif part == "TShirt" then
char:FindFirstChildOfClass("ShirtGraphic").Graphic = value
else
char:FindFirstChild(part).Value = value
end
end

local function ArtfulForsakenSetUp(c)
--head
local head_asset = game:GetObjects("rbxassetid://"..tostring(114257201579610))[1]
repeat task.wait(.05) until head_asset ~= nil and head_asset:FindFirstChild("Handle") and head_asset.Handle:FindFirstChild("SpecialMesh")
local head = AddAccessory(c, head_asset, "Head")
task.wait(.05)
head:WaitForChild("Handle").CanCollide = false
-- right sleeve
local rs_asset = game:GetObjects("rbxassetid://"..tostring(83730135593176))[1]
repeat task.wait(.05) until rs_asset ~= nil and rs_asset:FindFirstChild("Handle") and rs_asset.Handle:FindFirstChild("SpecialMesh")
local rs = AddAccessory(c, rs_asset, "Right Arm")
task.wait(.05)
rs:WaitForChild("Handle").CanCollide = false
rs:WaitForChild("Handle"):WaitForChild("SpecialMesh").Offset = Vector3.new(-1,0.5,0)
-- left sleeve
local ls_asset = game:GetObjects("rbxassetid://"..tostring(82696867944296))[1]
repeat task.wait(.05) until ls_asset ~= nil and ls_asset:FindFirstChild("Handle") and ls_asset.Handle:FindFirstChild("SpecialMesh")
local ls = AddAccessory(c, ls_asset, "Left Arm")
task.wait(.05)
ls:WaitForChild("Handle").CanCollide = false
ls:WaitForChild("Handle"):WaitForChild("SpecialMesh").Offset = Vector3.new(1,0.5,0)
-- torso
local torso_asset = game:GetObjects("rbxassetid://"..tostring(127089746240385))[1]
repeat task.wait(.05) until torso_asset ~= nil and torso_asset:FindFirstChild("Handle") and torso_asset.Handle:FindFirstChild("SpecialMesh")
local torso = AddAccessory(c, torso_asset, "Torso")
task.wait(.05)
torso:WaitForChild("Handle").CanCollide = false
torso:WaitForChild("Handle"):WaitForChild("SpecialMesh").Offset = Vector3.new(0,-1,-0.5)
-- making body parts visible
repeat task.wait(.05) until c:FindFirstChild("Left Leg") and c:FindFirstChild("Left Arm")
c["Left Arm"].Transparency = 0
c["Left Leg"].Transparency = 0
end

local function ArtfulLORSetUp(c)

local function Ability()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
task.spawn(function()
local a = nil
for i = 1,10 do
if a == true then return end
a = game:GetService("ReplicatedStorage").Events.RemoteFunctions.UseAbility:InvokeServer("Swing")
end
end)
local function onswing()
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = .6
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(1000000,1000,1000000)
BodyVelocity.P = 1250
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .25)
task.wait(.15)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")*2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")*2))
end
local c = nil
local d = nil
c = Humanoid.AnimationPlayed:Connect(function(track)
if track.Animation.AnimationId == "rbxassetid://80787680522855" then
c:Disconnect()
track:Stop()
task.spawn(onswing)
end
end)
end
local lunge_abil = function()
local a = Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Characters.Killer.Harken.Default.Animations.Throw)
repeat task.wait() until a.Length > 0
a:Play()
repeat task.wait() until a.IsPlaying
a.TimePosition = 0.6
a:AdjustSpeed(0)
Character:SetAttribute("SprintSpeed", (Character:GetAttribute("SprintSpeed")/2))
Character:SetAttribute("WalkSpeed", (Character:GetAttribute("WalkSpeed")/2))
task.spawn(Ability)
repeat task.wait() until Character:GetAttribute("SprintSpeed") > 13
a:Stop()
end


if c:FindFirstChild("CloneTool") then
c:FindFirstChild("CloneTool"):Destroy()
end
if c:FindFirstChild("Pants") and c:FindFirstChild("Shirt") then
c:FindFirstChild("Pants").PantsTemplate = "http://www.roblox.com/asset/?id=12803009530"
c:FindFirstChild("Shirt").ShirtTemplate = "http://www.roblox.com/asset/?id=12803009530"
end
for i,v in next, c:GetChildren() do
if v and v:IsA("BasePart") and v.Name ~= "Face" and v.Name ~= "MusicBox" then
v.Color = Color3.fromRGB(255,254,226)
end
if v and v:IsA("CharacterMesh") then
if v.BodyPart == Enum.BodyPart.LeftArm then
v.MeshId = 83001137
elseif v.BodyPart == Enum.BodyPart.RightArm then
v.MeshId = 83001181
elseif v.BodyPart == Enum.BodyPart.LeftLeg then
v.MeshId = 746826007
elseif v.BodyPart == Enum.BodyPart.RightLeg then
v.MeshId = 746825633
elseif v.BodyPart == Enum.BodyPart.Torso then
v.MeshId = 82987757
end
end
end
if c:FindFirstChild("Face") and c:WaitForChild("Face"):FindFirstChild("Face") then
c:FindFirstChild("Face"):WaitForChild("Face"):Destroy()
end
--head
local head_asset = game:GetObjects("rbxassetid://"..tostring(15395102950))[1]
repeat task.wait(.05) until head_asset ~= nil and head_asset:FindFirstChild("Handle") and head_asset.Handle:FindFirstChild("SpecialMesh")
local head = AddAccessory(c, head_asset, "Head")
task.wait(.05)
head:WaitForChild("Handle").CanCollide = false
--anims
c.Animations.Idle.AnimationId = "rbxassetid://96089657207073"
c.Animations.Sprint.AnimationId = "rbxassetid://84734698021418"
c.Animations.Walk.AnimationId = "rbxassetid://86166363798441"
if game.Players:GetPlayerFromCharacter(c) ~= game.Players.LocalPlayer then return end
-- effect
if not game:GetService("Lighting"):FindFirstChild("String Theocracy") then
local cce = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
cce.Name = "String Theocracy"
cce.Brightness = 0.175
cce.TintColor = Color3.fromRGB(120,80,15)
cce.Enabled = true
elseif game:GetService("Lighting"):FindFirstChild("String Theocracy") then
game:GetService("Lighting"):FindFirstChild("String Theocracy").Enabled = true
end
game.Players.LocalPlayer.CharacterAdded:Once(function()
game:GetService("Lighting"):FindFirstChild("String Theocracy").Enabled = false
end)
--applying anims
ApplyNewAnimations()
repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Repurpose")
AbilityModule.CreateAbility({Client = true,ClientFunction = lunge_abil,Name = "Lunge_NH",InputShown = "E",Tip = "Lunge forwards to deal damage.",Cooldown = 5,Icon = "rbxassetid://105910997361738",DisplayName = "Lunge"})
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Implement"):Destroy()
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Copywrite"):Destroy()
local a = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Repurpose")
a.Parent = game:GetService("LogService")
task.wait()
a.Parent = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Abilities.Folder
end


Tab_4:CreateButton({Name = "Forsaken Artful ( Noliful Variant )"; Callback = function()
Notify("Success!", "Loading new skin... Please wait!", 5, true)
if not _G.mp3_conversion_module then
_G.mp3_conversion_module = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/Encryption-Center/refs/heads/main/mp3_conversion.luau"))()
end
if not isfile("NexerHub/Core/Artful.mp3") then
writefile("NexerHub/Core/Artful.mp3", _G.mp3_conversion_module:ConvertMP3Data(_G.mp3_conversion_module["Artful?"]))
repeat task.wait(.1) until isfile("NexerHub/Core/Artful.mp3")
end
local temp_table = {
	["Name"] = "Artful?";
	["Bio"] = "''I sure do wonder why am i here.''";
	["Icon"] = "rbxassetid://134690353237803";
	["ClearMainAccessories"] = true;
	["ChaseTheme"] = ((getcustomasset and GetFile("NexerHub/Core/Artful.mp3","gca")) or tostring(game.ReplicatedStorage.Characters.Killer.Artful.Cementful.Animations.ChaseTheme.SoundId));
	["CharacterAdded"] = function(c) task.spawn(ArtfulForsakenSetUp, c) end
}
pcall(function()
MainModule:ModifySkin("Cementful", temp_table)
Notify("Success!", "Loaded new skin!", 5, true)
end)
end; })

Tab_4:CreateButton({Name = "String Theocracy ( Artful Skin )"; Callback = function()
Notify("Success!", "Loading new skin... Please wait!", 5, true)
if not _G.mp3_conversion_module then
_G.mp3_conversion_module = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/Encryption-Center/refs/heads/main/mp3_conversion.luau"))()
end
if not isfile("NexerHub/Core/LOR.mp3") then
writefile("NexerHub/Core/LOR.mp3", _G.mp3_conversion_module:ConvertMP3Data(_G.mp3_conversion_module["String Theocracy"]))
repeat task.wait(.1) until isfile("NexerHub/Core/LOR.mp3")
end
local temp_table = {
	["Name"] = "String Theocracy";
	["Bio"] = "''...''";
	["Icon"] = "rbxassetid://18662155";
	["ClearMainAccessories"] = true;
	["ChaseTheme"] = ((getcustomasset and GetFile("NexerHub/Core/LOR.mp3","gca")) or tostring(game.ReplicatedStorage.Characters.Killer.Artful.Builder.Animations.ChaseTheme.SoundId));
	["CharacterAdded"] = function(c) task.spawn(ArtfulLORSetUp, c) end
}
pcall(function()
MainModule:ModifySkin("Builder", temp_table)
Notify("Success!", "Loaded new skin!", 5, true)
end)
end; })



Tab_4:CreateSection("Intro / Special Round Starter")

killerintro = "Pursuer"
Tab_4:CreateDropdown({Name = "Killer Intro"; Options = {"Pursuer","Artful","Badware","Killdroid","Harken"}; CurrentOption = "Pursuer"; MultiSelection = false; Callback = function(Value)
killerintro = ConvertDropdownValue(Value)
end; })

Tab_4:CreateButton({Name = "Start Intro"; Callback = function()
if not firesignal then return end
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("KillerIntro").OnClientEvent, game:GetService("Players").LocalPlayer,killerintro,killerintro,"Default",1)
end; })


specialroundevent = "Double Trouble"
Tab_4:CreateDropdown({Name = "Special Round Event"; Options = {"Double Trouble","Evil Scary","One Bounce","Gunslinger","Dienation"}; CurrentOption = "Double Trouble"; MultiSelection = false; Callback = function(Value)
specialroundevent = ConvertDropdownValue(Value)
end; })

Tab_4:CreateButton({Name = "Start Special Round Event"; Callback = function()
if not firesignal then return end
firesignal(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("GamemodeUI").OnClientEvent, specialroundevent)
end; })












----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------







local AnimationsModule = [[task.spawn(function()
pcall(function()
local stopper = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local RunService = game:GetService("RunService")

-- Animation control system
local AnimationController = {}
AnimationController.Enabled = true
AnimationController.ActiveAnimations = {}
AnimationController.CharacterConnections = {}
AnimationController.CharacterAnimators = {}
AnimationController.LoadedTracks = {}

-- Initialize workspace attribute if not exists
if workspace:GetAttribute("AnimationsEnabled") == nil then
	workspace:SetAttribute("AnimationsEnabled", true)
end
-- and also init this anim desync lolz
if workspace:GetAttribute("AnimDesyncEnabled") == nil then
	workspace:SetAttribute("AnimDesyncEnabled", false)
end
if workspace:GetAttribute("AnimDesync") == nil then
	workspace:SetAttribute("AnimDesync", 1)
end


-- Listen for attribute changes
workspace:GetAttributeChangedSignal("AnimationsEnabled"):Connect(function()
	AnimationController.Enabled = workspace:GetAttribute("AnimationsEnabled")
	if not AnimationController.Enabled then
		AnimationController:UnloadAllAnimations()
	else
		-- Reload animations for all valid characters
		for character, _ in pairs(AnimationController.CharacterAnimators) do
			if character and character.Parent and character:IsDescendantOf(workspace) then
				if character:FindFirstChild("Humanoid") and character:FindFirstChild("Animations") then
					task.spawn(function()
						AnimationController:LoadCharacterAnimations(character)
					end)
				end
			else
				-- Clean up invalid characters
				AnimationController.CharacterAnimators[character] = nil
			end
		end
	end
end)

function AnimationController:UnloadAllAnimations()
	-- Stop and remove all animation tracks
	for character, tracks in pairs(self.LoadedTracks) do
		for trackName, track in pairs(tracks) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
	end
	self.LoadedTracks = {}
	
	-- Stop active animations
	self:StopAllAnimations()
end

function AnimationController:StopAllAnimations()
	for character, animations in pairs(self.ActiveAnimations) do
		for animName, track in pairs(animations) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
	end
	self.ActiveAnimations = {}
end

function AnimationController:CleanupCharacter(character)
	-- Clean up loaded tracks
	if self.LoadedTracks[character] then
		for trackName, track in pairs(self.LoadedTracks[character]) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
		self.LoadedTracks[character] = nil
	end
	
	-- Clean up active animations
	if self.ActiveAnimations[character] then
		for animName, track in pairs(self.ActiveAnimations[character]) do
			if track and track.IsPlaying then
				track:Stop()
			end
		end
		self.ActiveAnimations[character] = nil
	end

	-- Clean up connections
	if self.CharacterConnections[character] then
		for _, connection in ipairs(self.CharacterConnections[character]) do
			connection:Disconnect()
		end
		self.CharacterConnections[character] = nil
	end

	self.CharacterAnimators[character] = nil
end

function AnimationController:LoadAnimationTrack(character, animationName, animationId)
	if not self.Enabled then return nil end
	if not character or not character.Parent then return nil end
	
	local humanoid, renderHumanoid = self:GetHumanoid(character)
	local actualHumanoid = renderHumanoid or humanoid
	if not actualHumanoid then return nil end

	local animator = actualHumanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = actualHumanoid
	end

	-- Create animation instance
	local animation = Instance.new("Animation")
	animation.AnimationId = animationId
	
	-- Load animation track
	local track = animator:LoadAnimation(animation)
	
	-- Store in loaded tracks
	if not self.LoadedTracks[character] then
		self.LoadedTracks[character] = {}
	end
	self.LoadedTracks[character][animationName] = track
	
	return track
end

function AnimationController:GetHumanoid(character)
	if not self.Enabled then return nil end

	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	local renderHumanoid = nil
	if character:GetAttribute("MROB") and RunService:IsClient() then
		pcall(function()
			local renderUI = character:FindFirstChild("RenderUIPath")
			if renderUI and renderUI.Value then
				local viewport = renderUI.Value
				if viewport then
					renderHumanoid = viewport.ViewportFrame.WorldModel.RenderModel:FindFirstChildWhichIsA("Humanoid")
				end
			end
		end)
	end
	return humanoid, renderHumanoid
end

function AnimationController:LoadCharacterAnimations(character)
	if not self.Enabled then return end
	if not character or not character.Parent then return end
	if not character:FindFirstChild("Humanoid") then return end
	if not character:FindFirstChild("Animations") then return end

	local animationsFolder = character:FindFirstChild("Animations")
	if not animationsFolder then return end

	-- Clean up existing animations for this character
	self:CleanupCharacter(character)

	-- Load all animations from the folder
	local loadedTracks = {}
	
	for _, animationObject in ipairs(animationsFolder:GetChildren()) do
		if animationObject:IsA("Animation") then
			local track = self:LoadAnimationTrack(character, animationObject.Name, animationObject.AnimationId)
			if track then
				loadedTracks[animationObject.Name] = track
			end
		end
	end

	-- Store animator reference
	local humanoid, renderHumanoid = self:GetHumanoid(character)
	local actualHumanoid = renderHumanoid or humanoid
	if actualHumanoid then
		local animator = actualHumanoid:FindFirstChildOfClass("Animator")
		if animator then
			self.CharacterAnimators[character] = animator
		end
	end

	-- Start animation system if we have the required animations
	if loadedTracks["Idle"] then
		self:StartCharacterAnimationSystem(character, loadedTracks)
	end
end

function AnimationController:StartCharacterAnimationSystem(character, loadedTracks)
	if not self.Enabled then return end
	if not character or not character.Parent then return end
	if not character:FindFirstChild("HumanoidRootPart") then return end

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid, renderHumanoid = self:GetHumanoid(character)
	local actualHumanoid = renderHumanoid or humanoid
	if not actualHumanoid then return end

	local animations = character:FindFirstChild("Animations")
	if not animations then return end

	local player = Players:GetPlayerFromCharacter(character)
	if player and player ~= Players.LocalPlayer then return end

	local transitionSpeed = animations:GetAttribute("TransitionSpeed") or 0.25

	-- Start with idle animation
	if loadedTracks["Idle"] then
		loadedTracks["Idle"]:Play()
		self:AddActiveAnimation(character, "Idle", loadedTracks["Idle"])
	end

	-- Play passive animation if exists
	if loadedTracks["PassiveAnimation"] then
		loadedTracks["PassiveAnimation"]:Play()
		self:AddActiveAnimation(character, "PassiveAnimation", loadedTracks["PassiveAnimation"])
	end

	-- Jump animation handling
	if loadedTracks["Jump"] then
		local stateConnection = actualHumanoid.StateChanged:Connect(function(oldState, newState)
			if not self.Enabled then return end
			if not character or not character.Parent then return end
			
			-- Jump and fall handling
			if newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Freefall then
				loadedTracks["Jump"]:Play(0)
				self:AddActiveAnimation(character, "Jump", loadedTracks["Jump"])
				if ReplicatedStorage:FindFirstChild("Sounds") and ReplicatedStorage.Sounds:FindFirstChild("SFX") then if character.PrimaryPart:FindFirstChild("Jump") then return end local jumpSound = ReplicatedStorage.Sounds.SFX.Jump:Clone() jumpSound.Parent = character.PrimaryPart jumpSound:Play() jumpSound.Ended:Once(function() jumpSound:Destroy() end) end
			else
				loadedTracks["Jump"]:Stop(0.2)
				self:RemoveActiveAnimation(character, "Jump")
			end
		end)
		
		-- Store connection for cleanup
		if not self.CharacterConnections[character] then
			self.CharacterConnections[character] = {}
		end
		table.insert(self.CharacterConnections[character], stateConnection)
	end

	-- Movement animations with speed attributes (from original script)
	if loadedTracks["Walk"] then
		local walkAnim = loadedTracks["Walk"]
		local sprintAnim = loadedTracks["Sprint"]
		
		if loadedTracks["Idle"] then
			loadedTracks["Idle"].Priority = Enum.AnimationPriority.Core
		end
		walkAnim.Priority = Enum.AnimationPriority.Idle
		if sprintAnim then
			sprintAnim.Priority = Enum.AnimationPriority.Movement
		end

		-- Get speed attributes from character (like original script)
		local baseWalkSpeed = (character:GetAttribute("WalkSpeed") or 6) + (character:GetAttribute("WalkSpeedModifier") or 0)
		local baseSprintSpeed = (character:GetAttribute("SprintSpeed") or 23) + (character:GetAttribute("WalkSpeedModifier") or 0)
		
		-- Adjust animation speeds based on current walk speed (like original script)
		local function adjustAnimationSpeeds()
			if not self.Enabled then return end
			if not character or not character.Parent then return end
			
			local currentWalkSpeed = actualHumanoid.WalkSpeed
			local walkSpeedRatio = currentWalkSpeed / (character:GetAttribute("WalkSpeed") or 6)
			local sprintSpeedRatio = currentWalkSpeed / (character:GetAttribute("SprintSpeed") or 23)
			
			walkAnim:AdjustSpeed(walkSpeedRatio < 0 and 0.1 or walkSpeedRatio)
			if sprintAnim then
				sprintAnim:AdjustSpeed(sprintSpeedRatio < 0 and 0.1 or sprintSpeedRatio)
			end
		end

		-- Connect to WalkSpeed changes (like original script)
		local speedConnection = actualHumanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(adjustAnimationSpeeds)
		if not self.CharacterConnections[character] then
			self.CharacterConnections[character] = {}
		end
		table.insert(self.CharacterConnections[character], speedConnection)

		-- Initial speed adjustment
		adjustAnimationSpeeds()

		local function updateMovement(speed)
			if not self.Enabled then return end
			if not character or not character.Parent then return end
			if not humanoidRootPart or not actualHumanoid then return end

			if speed >= 0.25 and not humanoidRootPart.Anchored then
				-- Use speed thresholds from attributes (like original script)
				if sprintAnim and speed >= (baseSprintSpeed - baseWalkSpeed) then
					if not sprintAnim.IsPlaying then 
						sprintAnim:Play(transitionSpeed) 
						self:AddActiveAnimation(character, "Sprint", sprintAnim)
					end
					walkAnim:Stop(transitionSpeed)
					self:RemoveActiveAnimation(character, "Walk")
					if loadedTracks["Idle"] then
						loadedTracks["Idle"]:Stop(transitionSpeed)
					end
				else
					if not walkAnim.IsPlaying then 
						walkAnim:Play(transitionSpeed) 
						self:AddActiveAnimation(character, "Walk", walkAnim)
					end
					if sprintAnim then 
						sprintAnim:Stop(transitionSpeed) 
						self:RemoveActiveAnimation(character, "Sprint")
					end
					if loadedTracks["Idle"] then
						loadedTracks["Idle"]:Stop(transitionSpeed)
					end
				end
			else
				if loadedTracks["Idle"] and not loadedTracks["Idle"].IsPlaying then 
					loadedTracks["Idle"]:Play(transitionSpeed) 
					self:AddActiveAnimation(character, "Idle", loadedTracks["Idle"])
				end
				walkAnim:Stop(transitionSpeed)
				self:RemoveActiveAnimation(character, "Walk")
				if sprintAnim then 
					sprintAnim:Stop(transitionSpeed) 
					self:RemoveActiveAnimation(character, "Sprint")
				end
			end
		end

		local runningConnection = actualHumanoid.Running:Connect(updateMovement)
		
		-- Store connection for cleanup
		if not self.CharacterConnections[character] then
			self.CharacterConnections[character] = {}
		end
		table.insert(self.CharacterConnections[character], runningConnection)
	end
end

function AnimationController:AddActiveAnimation(character, animationName, track)
	if not self.ActiveAnimations[character] then
		self.ActiveAnimations[character] = {}
	end
	self.ActiveAnimations[character][animationName] = track
end

function AnimationController:RemoveActiveAnimation(character, animationName)
	if self.ActiveAnimations[character] then
		self.ActiveAnimations[character][animationName] = nil
	end
end

-- Remote event handlers
Events.RemoteEvents.PlayAnimation.OnClientEvent:Connect(function(animation, character, delay)
	if not AnimationController.Enabled then return end
	if not character or not character.Parent then return end
	if workspace:GetAttribute("AnimDesyncEnabled") == true then task.wait(workspace:GetAttribute("AnimDesync")) end

	if character and (not Players:GetPlayerFromCharacter(character) or Players:GetPlayerFromCharacter(character) == Players.LocalPlayer) then
		local humanoid = AnimationController:GetHumanoid(character)
		if not humanoid then return end

		local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
		for _, track in animator:GetPlayingAnimationTracks() do
			if track.Name == animation.Name then
				track:Play()
				return
			end
		end
		animator:LoadAnimation(animation):Play(delay or 0.1)
	end
end)

Events.RemoteEvents.StopAnimation.OnClientEvent:Connect(function(animation, character)
	if not character or not character.Parent then return end
	if workspace:GetAttribute("AnimDesyncEnabled") == true then task.wait(workspace:GetAttribute("AnimDesync")) end

	local humanoid = AnimationController:GetHumanoid(character)
	if not humanoid then return end

	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
	for _, track in animator:GetPlayingAnimationTracks() do
		if track.Name == animation.Name then
			track:Stop()
			return
		end
	end
end)

function AnimationController:SetupDefaultCharacter(character)
	if not self.Enabled then return end
	if not character or not character.Parent then return end
	if not character:FindFirstChild("Humanoid") then return end

	local civilian = ReplicatedStorage:FindFirstChild("Characters") and 
					ReplicatedStorage.Characters.Survivor:FindFirstChild("Civilian")
	local defaultAnimations = civilian and civilian:FindFirstChild("Animations")

	if defaultAnimations then
		-- Remove existing animations folder
		local existingAnimations = character:FindFirstChild("Animations")
		if existingAnimations then
			existingAnimations:Destroy()
		end

		-- Clone new animations
		local newAnimations = defaultAnimations:Clone()
		newAnimations.Parent = character

		if character:FindFirstChild("HumanoidRootPart") then
			character.PrimaryPart = character:WaitForChild("HumanoidRootPart")
		end

		-- Load animations from the new folder
		self:LoadCharacterAnimations(character)
		character:SetAttribute("WalkSpeed", 10)
		character:SetAttribute("SprintSpeed", 26)
	end
end

-- Update initial state
AnimationController.Enabled = workspace:GetAttribute("AnimationsEnabled")

-- Player character handling
local localPlayer = Players.LocalPlayer

localPlayer.CharacterAdded:Connect(function(character)
	task.wait(1)
	if AnimationController.Enabled then
		if character:FindFirstChild("Animations") then
			AnimationController:LoadCharacterAnimations(character)
		else
			AnimationController:SetupDefaultCharacter(character)
		end
	end
end)

localPlayer.CharacterRemoving:Connect(function(character)
	AnimationController:CleanupCharacter(character)
end)

task.spawn(function()
	if AnimationController.Enabled and localPlayer.Character then
		AnimationController:SetupDefaultCharacter(localPlayer.Character)
	end
end)

-- NPC handling
local teamsFolder = workspace:WaitForChild("GameAssets"):WaitForChild("Teams")
local otherTeam = teamsFolder:WaitForChild("Other")

otherTeam.ChildAdded:Connect(function(npc)
	if not AnimationController.Enabled then return end
	if not npc:FindFirstChild("Humanoid") then return end
	if not npc:FindFirstChild("Animations") then return end

	local humanoid = npc:FindFirstChild("Humanoid")
	if humanoid then
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
		AnimationController:LoadCharacterAnimations(npc)
	end
end)

-- Clean up when NPCs are removed
otherTeam.ChildRemoved:Connect(function(npc)
	AnimationController:CleanupCharacter(npc)
end)


-- Periodic cleanup of invalid characters
game:GetService("RunService").Heartbeat:Connect(function()
	for character, _ in pairs(AnimationController.CharacterAnimators) do
		if not character or not character.Parent or not character:IsDescendantOf(workspace) then
			AnimationController:CleanupCharacter(character)
		end
	end
end)]]
if workspace:GetAttribute("AnimationsEnabled") == nil and game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("ClientAnimations") then
game:GetService("Players").LocalPlayer.PlayerScripts.ClientAnimations:Destroy()
task.wait()
loadstring(AnimationsModule)()
end




local function ReturnAnimFolder()
if Character:FindFirstChild("Animations") then
return Character:WaitForChild("Animations")
end
return nil
end

local Tab_6 = Window:CreateTab("Animations",0)

function SetRunAnim(run)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("HurtSprint") then
AnimationFolder:FindFirstChild("HurtSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("NormalSprint") then
AnimationFolder:FindFirstChild("NormalSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldSprint") then
AnimationFolder:FindFirstChild("OldSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("Sprint") then
AnimationFolder:FindFirstChild("Sprint").AnimationId = run
end
end)
end

function SetWalkAnim(walk)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Walk") then
AnimationFolder:FindFirstChild("Walk").AnimationId = walk
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldWalk") then
AnimationFolder:FindFirstChild("OldWalk").AnimationId = walk
end
end)
end

function SetIdleAnim(idle)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Idle") then
AnimationFolder:FindFirstChild("Idle").AnimationId = idle
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldIdle") then
AnimationFolder:FindFirstChild("OldIdle").AnimationId = idle
end
end)
end

function ApplyNewAnimations()
pcall(function()
workspace:SetAttribute("AnimationsEnabled", false)
task.wait()
workspace:SetAttribute("AnimationsEnabled", true)
end)
end



task.wait()
if workspace:GetAttribute("AnimationsEnabled") == nil then
Tab_6:CreateParagraph({Title = "Not Supported", Content = "clientscript not found"})
end
if workspace:GetAttribute("AnimationsEnabled") ~= nil then
Tab_6:CreateParagraph({Title = "Animations", Content = "You can change your anims here."})
Tab_6:CreateSection("Pre-loaded animations")
Tab_6:CreateLabel("Civilian animations")
Tab_6:CreateButton({Name = "Apply New Civilian Animations"; Callback = function()
local RunAnim = "rbxassetid://137375023685630"
local WalkAnim = "rbxassetid://84388941697203"
local IdleAnim = "rbxassetid://100930402371608"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })
Tab_6:CreateButton({Name = "Apply Old Civilian animations"; Callback = function()
local RunAnim = "rbxassetid://79488319304371"
local WalkAnim = "rbxassetid://138161225743614"
local IdleAnim = "rbxassetid://74309548749074"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })

Tab_6:CreateLabel("Ghost Animations")
Tab_6:CreateButton({Name = "Apply Ghost animations"; Callback = function()
local RunAnim = "rbxassetid://124260679864309"
local WalkAnim = "rbxassetid://124260679864309"
local IdleAnim = "rbxassetid://110395159339100"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })

pcall(function()
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
Tab_6:CreateLabel(v.Name.." Animations")
local temp_table = {}
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
table.insert(temp_table, e.Name)
end; end
local Hi = v:WaitForChild("Default")
Tab_6:CreateDropdown({Name = "Choose "..v.Name.." animations"; Options = temp_table; CurrentOption = "Default"; MultiSelection = false; Callback = function(Value)
Hi = v:WaitForChild(ConvertDropdownValue(Value))
end; })

Tab_6:CreateButton({Name = "Apply "..v.Name.." animations"; Callback = function()
local RunAnim = Hi:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local WalkAnim = Hi:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local IdleAnim = Hi:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })

end; end
end)


Tab_6:CreateSection("Advanced")


function GetAllRunAnims()
local temp_table = {}
temp_table["Civilian Run"] = "rbxassetid://137375023685630"
temp_table["Old Civilian Run"] = "rbxassetid://79488319304371"
temp_table["Ghost Run"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local RunAnim = e:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Run"
temp_table[AnimName] = RunAnim
end; end
end; end
return temp_table
end

function GetAllWalkAnims()
local temp_table = {}
temp_table["Civilian Walk"] = "rbxassetid://84388941697203"
temp_table["Old Civilian Walk"] = "rbxassetid://138161225743614"
temp_table["Ghost Walk"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local WalkAnim = e:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Walk"
temp_table[AnimName] = WalkAnim
end; end
end; end
return temp_table
end

function GetAllIdleAnims()
local temp_table = {}
temp_table["Civilian Idle"] = "rbxassetid://100930402371608"
temp_table["Old Civilian Idle"] = "rbxassetid://74309548749074"
temp_table["Ghost Idle"] = "rbxassetid://110395159339100"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local IdleAnim = e:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Idle"
temp_table[AnimName] = IdleAnim
end; end
end; end
return temp_table
end

function GetAllRunNames()
local temp_table = {}
table.insert(temp_table, "Civilian Run")
table.insert(temp_table, "Old Civilian Run")
table.insert(temp_table, "Ghost Run")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Run"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

function GetAllWalkNames()
local temp_table = {}
table.insert(temp_table, "Civilian Walk")
table.insert(temp_table, "Old Civilian Walk")
table.insert(temp_table, "Ghost Walk")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Walk"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

function GetAllIdleNames()
local temp_table = {}
table.insert(temp_table, "Civilian Idle")
table.insert(temp_table, "Old Civilian Idle")
table.insert(temp_table, "Ghost Idle")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Idle"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

local ChoosenRunAnim = LoadConfig("Tab_6", "CustomAnimations", "Run")
Tab_6:CreateDropdown({Name = "Run Animation"; Options = GetAllRunNames(); CurrentOption = ChoosenRunAnim; MultiSelection = false; Callback = function(Value)
ChoosenRunAnim = tostring(ConvertDropdownValue(Value))
SaveConfig("Tab_6", ChoosenRunAnim, "CustomAnimations", "Run")
end; })

local ChoosenWalkAnim = LoadConfig("Tab_6", "CustomAnimations", "Walk")
Tab_6:CreateDropdown({Name = "Walk Animation"; Options = GetAllWalkNames(); CurrentOption = ChoosenWalkAnim; MultiSelection = false; Callback = function(Value)
ChoosenWalkAnim = tostring(ConvertDropdownValue(Value))
SaveConfig("Tab_6", ChoosenWalkAnim, "CustomAnimations", "Walk")
end; })

local ChoosenIdleAnim = LoadConfig("Tab_6", "CustomAnimations", "Idle")
Tab_6:CreateDropdown({Name = "Idle Animation"; Options = GetAllIdleNames(); CurrentOption = ChoosenIdleAnim; MultiSelection = false; Callback = function(Value)
ChoosenIdleAnim = tostring(ConvertDropdownValue(Value))
SaveConfig("Tab_6", ChoosenIdleAnim, "CustomAnimations", "Idle")
end; })

Tab_6:CreateButton({Name = "Apply Animations"; Callback = function()
task.spawn(function()
SetRunAnim(GetAllRunAnims()[ChoosenRunAnim])
SetWalkAnim(GetAllWalkAnims()[ChoosenWalkAnim])
SetIdleAnim(GetAllIdleAnims()[ChoosenIdleAnim])
task.wait()
ApplyNewAnimations()
end)
Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
end; })

Tab_6:CreateSection("Ability Changer")

local AbilityAnimData = {
["Punch"] = "rbxassetid://124781750889573", -- Civilian Animations Punch
["Adrenaline"] = "rbxassetid://77399794134778", -- Civilian Animations Adrenaline
["AdrenalineEnd"] = "rbxassetid://92333601998082", -- Civilian Animations AdrenalineEnd
["Caretaker"] = "rbxassetid://128767098320893", -- Civilian Animations Caretaker
["CloakStart"] = "rbxassetid://133960698072483", -- Civilian Animations CloakStart
["BlockStart"] = "rbxassetid://134233326423882", -- Civilian Animations BlockStart
["Dash"] = "rbxassetid://78278813483757", -- Civilian Animations Dash
["PadBuild"] = "rbxassetid://79104831518074", -- Civilian Animations PadBuild
["Hotdog"] = "rbxassetid://78595119178919", -- Civilian Animations Hotdog
["Revolver"] = "rbxassetid://74108653904830", -- Civilian Animations Revolver
["Taunt"] = "rbxassetid://113732291990231", -- Civilian Animations Taunt
["RevolverReload"] = "rbxassetid://79026181033717", -- Civilian Animations RevolverReload
["CloakEnd"] = "rbxassetid://120142279051418", -- Civilian Animations CloakEnd
["DynamiteWindup"] = "rbxassetid://133960279206605", -- Civilian Animations DynamiteWindup
["DynamiteThrow"] = "rbxassetid://99551865645121", -- Civilian Animations DynamiteThrow
["DynamiteHold"] = "rbxassetid://137091713941325", -- Civilian Animations DynamiteHold
["Banana"] = "rbxassetid://95775571866935", -- Civilian Animations Banana
["BlockLand"] = "rbxassetid://94027412516651" -- Civilian Animations BlockLand
}

local AbilityAnimNames = {"Punch","Adrenaline","AdrenalineEnd","Caretaker","CloakStart","BlockStart","Dash","PadBuild","Hotdog","Revolver","Taunt","RevolverReload","CloakEnd","DynamiteWindup","DynamiteThrow","DynamiteHold","Banana","BlockLand"}

local ReplaceWhatAbil = LoadConfig("Tab_6", "Swap", "What")
Tab_6:CreateDropdown({Name = "Replace what"; Options = AbilityAnimNames; CurrentOption = ReplaceWhatAbil; MultiSelection = false; Callback = function(Value)
ReplaceWhatAbil = ConvertDropdownValue(Value)
SaveConfig("Tab_6", ReplaceWhatAbil, "Swap", "What")
end; })

local ReplaceWithWhatAbil = LoadConfig("Tab_6", "Swap", "WithWhat")
Tab_6:CreateDropdown({Name = "Replace with what"; Options = AbilityAnimNames; CurrentOption = ReplaceWithWhatAbil; MultiSelection = false; Callback = function(Value)
ReplaceWithWhatAbil = ConvertDropdownValue(Value)
SaveConfig("Tab_6", ReplaceWithWhatAbil, "Swap", "What")
end; })

Tab_6:CreateButton({Name = "Replace animation"; Callback = function()
task.spawn(function()
Character.Animations.Abilities[ReplaceWhatAbil].AnimationId = tostring(AbilityAnimData[ReplaceWithWhatAbil])
task.wait()
ApplyNewAnimations()
end)
Notify("Success!", "Applying replacion, it may take up to 10 seconds.", 3, true)
end; })


Tab_6:CreateSection("Custom Ability Animation Changer")

local abilityList = {}
for name,_ in pairs(AbilityAnimData) do
	table.insert(abilityList,name)
end

local SelectedAbility = LoadConfig("Tab_6","ToEdit")
Tab_6:CreateDropdown({Name = "Select Ability"; Options = abilityList; CurrentOption = SelectedAbility; MultiSelection = false; Callback = function(v)
SelectedAbility = ConvertDropdownValue(v)
SaveConfig("Tab_6",SelectedAbility,"ToEdit")
end
});

local CustomAnimID = LoadConfig("Tab_6","CustomID")
Tab_6:CreateInput({Name = "Animation ID"; PlaceholderText = tostring(CustomAnimID); NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(v)
CustomAnimID = tostring(v)
SaveConfig("Tab_6",CustomAnimID,"CustomID")
end});

Tab_6:CreateButton({Name = "Apply Animation"; Callback = function()
local idexists = not pcall(function() game:GetService("ContentProvider"):PreloadAsync({tonumber(id)}) end)
AbilityAnimData[SelectedAbility] = ((idexists == true and "rbxassetid://"..CustomAnimID) or CustomAnimID)
Character.Animations.Abilities[SelectedAbility].AnimationId = AbilityAnimData[SelectedAbility]
ApplyNewAnimations()
Notify("Success!", "Changed Ability Animation.", 3, true)
end});


Tab_6:CreateSection("Miscellaneous")

local DesyncInSeconds = LoadConfig("Tab_6", "Misc", "Desync")
Tab_6:CreateInput({Name = "Desync in seconds"; PlaceholderText = tostring(DesyncInSeconds); NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
workspace:SetAttribute("AnimDesync", tonumber(Value))
SaveConfig("Tab_6", tonumber(Value), "Misc", "Desync")
end; })
workspace:SetAttribute("AnimDesync", DesyncInSeconds)

local DesyncEnabled = LoadConfig("Tab_6", "Misc", "DesyncEnabled")
local DesyncEnabledToggle = Tab_6:CreateToggle({Name = "Animations Desync"; CurrentValue = false; Callback = function(Value)
workspace:SetAttribute("AnimDesyncEnabled", Value)
SaveConfig("Tab_6", Value, "Misc", "DesyncEnabled")
end; })
DesyncEnabledToggle:Set(DesyncEnabled)

Tab_6:CreateButton({Name = "No animations [ Apply any animation to revert! ]"; Callback = function()
pcall(function()
workspace:SetAttribute("AnimationsEnabled", false)
end)
end; })

Tab_6:CreateButton({Name = "Fast animations [ THIS CANNOT BE REVERTED! ]"; Callback = function()
pcall(function()
while task.wait() do
local a = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, a:GetPlayingAnimationTracks() do
v:AdjustSpeed(10)
end
end
end)
end; })
end


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------






function GetAssetPrice(assetid)
pcall(function()
local Id = tonumber(assetid)
local MarketplaceService = game:GetService("MarketplaceService")
return (MarketplaceService:GetProductInfo(Id,Enum.InfoType.Asset).PriceInRobux)
end)
end
local PremiumPrice = GetAssetPrice(1613177391) or 258
-- YOU CAN GET PREMIUM FOR FREE BY ENTERING A KEY
-- KEY IS IN MY DISCORD SERVER!!
local HavePremium = true
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 9720038627) then
HavePremium = true
end

local Tab_7 = Window:CreateTab("Premium",0)
Tab_7:CreateParagraph({Title = "Premium", Content = "Premium content here! Very exploitable features."})

Tab_7:CreateSection("")
Tab_7:CreateLabel("There are currently 2 ways to unlock premium features.")
Tab_7:CreateSection("")
Tab_7:CreateLabel("Buy the gamepass to unlock premium features! [ Cost "..tostring(PremiumPrice).." robux! ]")

Tab_7:CreateButton({Name = "Open Gamepass Link"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 9720038627) then
    HavePremium = true
    Notify("Error!", "Already have gamepass!", 3, warn)
else
    OpenLink("https://www.roblox.com/game-pass/1264479709")
end
end; })

Tab_7:CreateButton({Name = "Copy Gamepass Link"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 9720038627) then
    HavePremium = true
    Notify("Error!", "Already have gamepass!", 3, warn)
else
    setclipboard(tostring("https://www.roblox.com/game-pass/1264479709"))
    Notify("Success!", "Copied Link!", 3, true)
end
end; })

Tab_7:CreateLabel("or join our discord server to unlock premium features! ( key from premium is in my discord server )")

Tab_7:CreateButton({Name = "Copy Discord Server Link"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Notify("Success!", "Copied Link!", 3, true)
end; })

Tab_7:CreateInput({Name = "Input Key"; PlaceholderText = "Type Here!"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
local key = MainModule:GetKey()
if string.lower(string.gsub(tostring(Value), "^%s*(.-)%s*$", "%1")) == tostring(key) then
HavePremium = true
Notify("Success!", "Redeemed key, enjoy your premium!", 5, true)
end
end; })

Tab_7:CreateSection("")

Tab_7:CreateSection("Advanced Anti / Immunities")

local antiStun = false
local AntiSlowDown = nil
local character = nil

local function antinegativewalkspeedmodifier()
if not antiStun then return end
if not character then return end
local value = character:GetAttribute("WalkSpeedModifier")
if typeof(value) == "number" and value < 0 then
character:SetAttribute("WalkSpeedModifier", 0)
end
end

local function setupCharacter(char)
if not char then return end
character = char
if character:GetAttribute("WalkSpeedModifier") == nil then
character:SetAttribute("WalkSpeedModifier", 0)
end
if AntiSlowDown then
AntiSlowDown:Disconnect()
AntiSlowDown = nil
end
AntiSlowDown = character:GetAttributeChangedSignal("WalkSpeedModifier"):Connect(function()
antinegativewalkspeedmodifier()
end)
task.spawn(antinegativewalkspeedmodifier)
end

local currentChar = LP.Character or LP.CharacterAdded:Wait()
setupCharacter(currentChar)

LP.CharacterAdded:Connect(function(newChar)
wait(0.1)
setupCharacter(newChar)
end)

Tab_7:CreateToggle({
Name = "Anti-Stun",
CurrentValue = false,
Callback = function(Value)
antiStun = Value
if antiStun then
local char = LP.Character or LP.CharacterAdded:Wait()
setupCharacter(char)
Notify("Success!", "Anti-Stun is now enabled!", 2, true)
else
if AntiSlowDown then
AntiSlowDown:Disconnect()
AntiSlowDown = nil
end
end
end; })


----------------------------






local noclip_connection = nil
local camera_connection = nil
function ApplyInvisibility(bool)
if bool == false then
task.spawn(function()
for i,v in next, Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end)
if noclip_connection then
noclip_connection:Disconnect()
noclip_connection = nil
end
if camera_connection then
camera_connection:Disconnect()
camera_connection = nil
pcall(function()
workspace.CurrentCamera.CameraSubject = Humanoid
end)
end
elseif bool == true then
local function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://90444351114401" -- If you will use my invis, please credit me.
local loadedanim = Humanoid:LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 2.2
end
end

Tab_7:CreateSection("Invisibility")
Tab_7:CreateToggle({Name = "Turn On/Off Invisibility"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4,warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if Value == false then
ApplyInvisibility(Value)
Notify("Success!", "Disabled invisibility!", 2, true)
elseif Value == true then
ApplyInvisibility(Value)
Notify("Success!", "Applied invisibility!", 2, true)
end
end; })

Tab_7:CreateToggle({Name = "Infinity Cloak"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4,warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
InfinityCloak = Value
end; })

workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildAdded:Connect(function(d)
if d.Name == ""..LP.Name.."" and InfinityCloak == true then
local temp_humanoid = d:WaitForChild("Humanoid")
local oldhealth = temp_humanoid.Health
local temp_connection = nil
local temp_con = nil

temp_connection = temp_humanoid.AnimationPlayed:Connect(function(track)
if not track then return end
local loggedanim = track.Animation
if loggedanim then
local loggedanimid = loggedanim.AnimationId
if loggedanimid ~= nil and loggedanimid == "rbxassetid://133960698072483" then
task.wait(3)
if d.Torso.Transparency == 1 then
ApplyInvisibility(true)
d.HumanoidRootPart.CloakEnd.Played:Once(function()
d.HumanoidRootPart.CloakEnd:Stop()
end)

task.spawn(function()
pcall(function()
repeat task.wait() until not d:IsDescendantOf(workspace) or temp_humanoid.Health ~= oldhealth or InfinityCloak == false
ApplyInvisibility(false)
temp_connection:Disconnect()
temp_con:Disconnect()
end)
end)

end
end
end
end)

temp_con = workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildRemoved:Connect(function(c)
if c == d then
temp_connection:Disconnect()
temp_con:Disconnect()
end
end)

end
end)



local HitboxAutoTracer, ClosestHRP = false, nil
local AimRange, AutoAim, AimTarget, Freeze_XAxis, Freeze_YAxis, Freeze_ZAxis = 9e9, false, false, true, false, false

function EnableAutoTracer()
local suc, err = pcall(function()
while game:GetService("RunService").Heartbeat:Wait() do 
if HitboxAutoTracer == true then
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
task.wait(.5)
end
local mag = (ClosestHRP.Position - HumanoidRootPart.Position).Magnitude
local vel = HumanoidRootPart.Velocity
if mag < 32 then
HumanoidRootPart.Velocity = (((ClosestHRP.Position - HumanoidRootPart.Position).Unit) * (mag * 10))
else
--if mag < 140 then
HumanoidRootPart.Velocity = (((ClosestHRP.Position - HumanoidRootPart.Position).Unit) * (mag * 13))
end
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
HumanoidRootPart.Velocity = vel
end
end
end
end)
if not suc then
task.spawn(function() EnableAutoTracer() end)
end
end
task.spawn(EnableAutoTracer)

function IsNormalC(v)
if v and v:FindFirstChild("Head") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
return true
end
return false
end

game:GetService("RunService").Heartbeat:Connect(function()
pcall(function()
local ClosestDistance = math.huge
local NewClosest = nil
if not IsNormalC(Character) then
ClosestHRP = nil
return
end
for i,v in pairs(game.Players:GetPlayers()) do
if not IsNormalC(v.Character) then continue end
if AimTarget == "Killers" and v.Character.Parent.Name ~= "Killer" then continue end
if AimTarget == "Civilians" and v.Character.Parent.Name ~= "Survivor" then continue end
if v and v.Name ~= game:GetService("Players").LocalPlayer.Name then
local Distance = (HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
if Distance < ClosestDistance then
ClosestDistance = Distance
NewClosest = v.Character.HumanoidRootPart
end
end
end
if AutoAim == true and ClosestDistance < tonumber(AimRange) then
local LookingPosition = CFrame.lookAt(HumanoidRootPart.Position, NewClosest.Position)
if Freeze_XAxis or Freeze_YAxis or Freeze_ZAxis then
local x_1, y_1, z_1 = LookingPosition:ToOrientation()
local x_2, y_2, z_2 = HumanoidRootPart.CFrame:ToOrientation()
HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position) * CFrame.Angles(((Freeze_XAxis and x_2) or x_1), ((Freeze_YAxis and y_2) or y_1), ((Freeze_ZAxis and z_2) or z_1))
else
HumanoidRootPart.CFrame = LookingPosition
end
end
ClosestHRP = NewClosest
end)
end)

Tab_7:CreateSection("Hitbox Manipulation ( ONLY FOR KILLERS! )")

Tab_7:CreateLabel("Basically Extender but with auto-tracer and without fling")

Tab_7:CreateToggle({Name = "Auto-Trace Hitbox"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
HitboxAutoTracer = Value
end; })

Tab_7:CreateLabel("Default Extender, might fling when touching people")
Tab_7:CreateToggle({Name = "Extend Hitbox"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
ExtendHitbox = Value
if ExtendHitbox == true then
local distance = 10
repeat game:GetService("RunService").Heartbeat:Wait()
local vel, movel = nil, 0.1
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
game:GetService("RunService").Heartbeat:Wait()
end
vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel * distance + (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * distance)
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
until ExtendHitbox == false
end
end; })


Tab_7:CreateSection("Aimbot")

Tab_7:CreateInput({Name = "Aim Range"; PlaceholderText = "9000000000"; NumbersOnly = true; OnEnter = false; RemoveTextAfterFocusLost = false; Callback = function(Value)
AimRange = Value
end; })

Tab_7:CreateDropdown({Name = "Aim Target"; Options = {"Everyone","Civilians","Killers"}; CurrentOption = "Everyone"; MultiSelection = false; Callback = function(Value)
AimTarget = ConvertDropdownValue(Value)
end; })

Tab_7:CreateLabel("Aims Character to a closest player")
Tab_7:CreateToggle({Name = "Humanoid Auto Aim"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AutoAim = Value
end; })

Tab_7:CreateLabel("Don't edit if you don't know what is this")
Tab_7:CreateToggle({Name = "Freeze X Axis"; CurrentValue = true; Callback = function(Value)
Freeze_XAxis = Value
end; })

Tab_7:CreateToggle({Name = "Freeze Y Axis"; CurrentValue = false; Callback = function(Value)
Freeze_YAxis = Value
end; })

Tab_7:CreateToggle({Name = "Freeze Z Axis"; CurrentValue = false; Callback = function(Value)
Freeze_ZAxis = Value
end; })

Tab_7:CreateSection("FE Game Manipulation")

Tab_7:CreateLabel("You can end round only if you are last survivor ( LMS ) or you are the only killer!")
Tab_7:CreateButton({Name = "FE End Round"; Callback = function()
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
MainModule:InitiateRoundEnd()
end; })

Tab_7:CreateLabel("You can start LMS only if there are two survivors! ( You and someone else )")
Tab_7:CreateButton({Name = "FE Two Players LMS"; Callback = function()
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
MainModule:InitiateTwoPlayersLMS()
end; })

Tab_7:CreateLabel("No evilness limit will make you earn evilness but never make you killer, must enable in lobby! ( After turning on, don't change anything in DOD settings )")
Tab_7:CreateToggle({Name = "No Evilness Limit"; CurrentValue = false; Callback = function(Value)
MainModule:SetNoEvilnessLimit(Value)
end; })
MainModule:InitiateNoEvilnessLimit()

Tab_7:CreateLabel("Respawns your character, but makes game think that you are still alive as killer/survivor. ( replicatesignal required )")
Tab_7:CreateButton({Name = "Respawn"; Callback = function()
if not replicatesignal then Notify("Error!", "Couldn't use function ''Respawn'', missing function ''replicatesignal''!", 5, false) return end
MainModule:Respawn()
end; })


Tab_7:CreateSection("FE Game Breaks")


-- Code is obfuscated to prevent those methods to get patched


Tab_7:CreateLabel("Invincibility / God Mode only can be applied only during dienation gamemode!")
Tab_7:CreateButton({Name = "FE Invincibility / God Mode"; Callback = function()
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(LocalPlayer.Name) then Notify("Error!", "You must be killer!", 4, false) return end
Notify("Applying Invincibility...", "Please wait!", 7, true)
MainModule:StartGodMode()
Notify("Applied Invincibility!", "Now no one can damage you.", 3, true)
end; })

function MorphIntoGhost()
    local a = game:GetService("ReplicatedStorage").Characters.Other.Ghost:Clone()
    a.Name = LocalPlayer.Name
    a.Parent = game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")
    pcall(function()
    a:WaitForChild("Humanoid").DisplayDistanceType = "None"
    end)
    a:WaitForChild("HumanoidRootPart").CFrame = (game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model") and game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model"):WaitForChild("HumanoidRootPart").CFrame) or CFrame.new(0,0,0)
    pcall(function()
    for i,v in pairs(a:GetDescendants()) do
    if (v:IsA("BasePart") or v:IsA("Decal")) and (v.Name ~= "HumanoidRootPart" and (not v:FindFirstChild("Face") and v.Name ~= "Hurtbox")) then
	v.Transparency = 0.5
	end
    end
    end)
    LocalPlayer.Character = a
    task.wait(.5)
    LocalPlayer.CharacterAdded:Once(function()
    a:Destroy()
    end)
end

Tab_7:CreateLabel("Only Harken, Badware and Killdroid can be softlocked. Harken will softlock if she uses Immolate or Tangle. Badware will softlock if he uses Rift. All Killdroid Deploys will get softlocked.")
Tab_7:CreateLabel("WARNING! You will play as ghost after activating this feature.")
Tab_7:CreateButton({Name = "FE Softlock Killers"; Callback = function()
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildWhichIsA("Model") then Notify("Error!", "No Killers!", 3, warn) return end
Notify("Enabling Auto-Softlock...", "Please wait!", 7, true)
MainModule:StartSoftlock()
MorphIntoGhost()
Notify("Auto-Softlock Enabled!", "Check the label above to see when will specific killers get softlocked.", 5, true)
end; })

--[[Tab_7:CreateLabel("To use model breaker, you must play as badware during round! You'll have to inject first, and only then destroy models. You can search models using explorer scripts. DO NOT SPAM CLICK OR IT'LL BREAK!")

local modeldservice, modeldname = "Workspace", "Type Here!"
Tab_7:CreateDropdown({Name = "Model Service"; Options = {"Workspace","ReplicatedStorage"}; CurrentOption = "Workspace"; MultiSelection = false; Callback = function(Value)
modeldservice = ConvertDropdownValue(Value)
end; })

Tab_7:CreateInput({Name = "Model Name"; PlaceholderText = "Type Here!"; NumbersOnly = false; OnEnter = false; RemoveTextAfterFocusLost = false; Callback = function(Value)
modeldname = Value
end; })

Tab_7:CreateButton({Name = "Inject Model Destroyer"; Callback = function()
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
MainModule:InjectDestroyer()
end; })

--credits to infinite yield i guess
function getstring(begin)
local start = begin-1
local AA = '' for i,v in pairs(cargs) do
if i > start then
if AA ~= '' then
AA = AA .. ' ' .. v
else
AA = AA .. v
end
end
end
return AA
end
Tab_7:CreateButton({Name = "Destroy Model"; Callback = function()
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
for i,v in pairs(game:GetService(tostring(modeldservice)):GetDescendants()) do
if v.Name:lower() == getstring(1):lower() and v:IsA("BasePart") then
MainModule:DestroyDataModel(v)
return
end
end
Notify("Error!", "Model not found.", 2, false)
end; })]]--

Tab_7:CreateSection("Auto Block")
Tab_7:CreateLabel("{ VERY W.I.P. !!!! } Uses block ability when the killer is attacking you. Your ping must be less than 60 for it to work.")
Tab_7:CreateLabel("ONLY BLOCKS SWING!!! CAN'T BLOCK BADWARE AND KILLDROID!!! please wait until i update it 😔")
local AutoBlockRange = 20
Tab_7:CreateInput({Name = "Auto Block detection range ( Magnitude )"; PlaceholderText = "20"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AutoBlockRange = tonumber(Value)
end; })
local AutoRangeSet = false
Tab_7:CreateToggle({Name = "Auto Range Set"; CurrentValue = false; Callback = function(Value)
AutoRangeSet = Value
end; })
local AutoBlock = false
local UnHookAttributes = nil
Tab_7:CreateToggle({Name = "Auto Block"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, warn) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AutoBlock = Value
task.wait()
if Value == true then
for i,v in pairs(workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):GetChildren()) do
if v then
HookAttributes(v)
end
end
elseif Value == false then
if UnHookAttributes ~= nil then
pcall(function()
UnHookAttributes()
end)
end
end
end; })

local AB_UA = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility")

function IsFacingTowards(killer)
local unit = ((HumanoidRootPart.Position - killer.HumanoidRootPart.Position) * Vector3.new(1,0,1)).Unit
local lookvector = killer.HumanoidRootPart.CFrame.LookVector * Vector3.new(1,0,1)
return (lookvector:Dot(unit) > 0.85)
end

function GetMagnitudeDifference(killer)
return (killer.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude or (1/0)
end

function CheckPlayingAnims(killer, killername)
local attacks = MainModule:GetAnimationTriggers(killername)
for _,q in pairs(killer:FindFirstChild("Humanoid"):GetPlayingAnimationTracks()) do
for i,v in pairs(attacks) do
if v == tostring(q.Animation.AnimationId) then
return i
end
end
end
return nil
end

function GetPartSpeed(part)
local speed = 0
pcall(function()
local velocity = part.Velocity
local horizontalvelocity = Vector3.new(velocity.X,0,velocity.Z)
speed = horizontalvelocity.Magnitude
end)
return speed
end

function CheckRequirements(killer, killername)
local as = GetPartSpeed(killer:FindFirstChild("HumanoidRootPart"))
if as == 0 then
as = 11
elseif as < 10 then
as = as * 2
elseif as < 30 then
as = as
end
local b
if AutoRangeSet == true then
b = (GetMagnitudeDifference(killer) < tonumber(as))
else
b = (GetMagnitudeDifference(killer) < tonumber(AutoBlockRange))
end
local c = IsFacingTowards(killer)
if b == true and c == true then
return true
end
return false
end

function GetKillerName(killer)
local a = game.Players:GetPlayerFromCharacter(killer)
if not a then return nil end
if a.Stats:FindFirstChild("IsKiller") and a.Stats:FindFirstChild("IsKiller").Value == true then
return tostring(a.Stats:FindFirstChild("EquippedKiller").Value)
end
return nil
end

function HookAttributes(killer)
if AutoBlock ~= true then return end
if not killer or not killer:FindFirstChild("HumanoidRootPart") or not killer:FindFirstChild("Humanoid") then warn("not found") return end
local ab_connection_1, ab_connection_2 = nil, nil
ab_connection_1 = killer.AttributeChanged:Connect(function(trigger)
if trigger == "WalkSpeedModifier" and AutoBlock == true then
if not killer then return end
local kn = GetKillerName(killer)
if not kn then warn("no name") return end
if CheckRequirements(killer, kn) and table.find(MainModule:GetWalkSpeedModData(kn), tonumber(killer:GetAttribute("WalkSpeedModifier"))) then
AB_UA:InvokeServer("Block")
end
end
end)
ab_connection_2 = workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer").ChildRemoved:Connect(function(abcd)
if abcd == killer then
UnHookAttributes = nil
ab_connection_1:Disconnect()
ab_connection_2:Disconnect()
end
end)
UnHookAttributes = function() ab_connection_1:Disconnect() ab_connection_2:Disconnect() UnHookAttributes = nil end
end

workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer").ChildAdded:Connect(HookAttributes)
for i,v in pairs(workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):GetChildren()) do
if v then
HookAttributes(v)
end
end

local ff_connection = nil
local ff_enabled = false
local ff_cd = false

-- Credits to whoever created this, appreciate this.
function Flip()
	if ff_cd then
		return
	end
	ff_cd = true
	local character = Character
	local hrp = HumanoidRootPart
	local animator = Humanoid:FindFirstChildOfClass("Animator")
	if not hrp or not Humanoid then
		ff_cd = false
		return
	end
	local savedTracks = {}
	if animator then
		for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
			savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
			track:Stop(0)
		end
	end
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
	local duration = 0.45
	local steps = 120
	local startCFrame = hrp.CFrame
	local forwardVector = startCFrame.LookVector
	local upVector = Vector3.new(0, 1, 0)
	task.spawn(function()
		local startTime = tick()
		for i = 1, steps do
			local t = i / steps
			local height = 4 * (t - t ^ 2) * 10
			local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height	
            local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

			hrp.CFrame = CFrame.new(nextPos) * rotation
			local elapsedTime = tick() - startTime
			local expectedTime = (duration / steps) * i
			local waitTime = expectedTime - elapsedTime
			if waitTime > 0 then
				task.wait(waitTime)
			end
		end

		hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
		Humanoid:ChangeState(Enum.HumanoidStateType.Running)

		if animator then
			for _, data in ipairs(savedTracks) do
				local track = data.track
				track:Play()
				track.TimePosition = data.time
			end
		end
		task.wait(0.25)
		ff_cd = false
	end)
end

local TopBar = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
local OrigSize = TopBar.Size.X.Offset
local ff_button = nil
function SetFrontFlip(bool)
ff_enabled = bool
if ff_enabled == true then
TopBar = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
OrigSize = TopBar.Size.X.Offset
ff_button = Instance.new("Frame", TopBar)
		ff_button.Size = UDim2.new(0, 48, 0, 44)
		ff_button.BackgroundTransparency = 1
		ff_button.BorderSizePixel = 0
		ff_button.Position = UDim2.new(0, TopBar.Size.X.Offset - 48, 0, 0)
local imageButton = Instance.new("ImageButton", ff_button)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Size = UDim2.new(0, 36, 0, 36)
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
ff_connection = imageButton.Activated:Connect(Flip)
TopBar.Size = UDim2.new(0, OrigSize + 48, 0, TopBar.Size.Y.Offset)
task.wait()
ff_button.Position = UDim2.new(0, TopBar.Size.X.Offset - 48, 0, 0)
task.spawn(function()
pcall(function()
repeat
TopBar.Size = UDim2.new(0, OrigSize + 48, 0, TopBar.Size.Y.Offset)
task.wait()
ff_button.Position = UDim2.new(0, TopBar.Size.X.Offset - 48, 0, 0)
until ff_enabled == false
end)
end)
elseif ff_enabled == false then
if ff_connection then
ff_connection:Disconnect()
ff_connection = nil
end
if ff_button then
ff_button:Destroy()
ff_button = nil
end
TopBar.Size = UDim2.new(0, OrigSize, 0, TopBar.Size.Y.Offset)
end
end








local Tab_12 = Window:CreateTab("Teleport",0)

Tab_12:CreateParagraph({Title = "Teleports", Content = "Teleport to killer / survivors and others."})

function SafeTeleport(model)
pcall(function()
local time = tick()
while tick() - time < 1 do
for i,v in pairs(Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
HumanoidRootPart.CFrame = model.CFrame
task.wait()
end
end)
end

function GetChildNames(model)
local coolbalt = {}
for i,v in pairs(model:GetChildren()) do
if v then
table.insert(coolbalt, tostring(v.Name))
end
end
return coolbalt
end

Tab_12:CreateSection("Team Teleport")

ChoosenKillerTarget = nil
ChoosenSurvivorTarget = nil
ChoosenGhostTarget = nil
local TeleportToKillerDropdown = Tab_12:CreateDropdown({Name = "Target Killer"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenKillerTarget = ConvertDropdownValue(Value)
end; })
Tab_12:CreateButton({Name = "Teleport to Killer"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no killers!", 3, warn)
return nil
end
if ChoosenKillerTarget == nil or ChoosenKillerTarget == "" or not ChoosenKillerTarget then
Notify("Error!", "Choose your target!", 3, false)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(ChoosenKillerTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer").ChildAdded:Connect(function(child)
pcall(function()
TeleportToKillerDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")))
end)
end)
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToKillerDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")))
end)
end)

local TeleportToSurvivorDropdown = Tab_12:CreateDropdown({Name = "Target Survivor"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenSurvivorTarget = ConvertDropdownValue(Value)
end; })
Tab_12:CreateButton({Name = "Teleport to Survivor"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no survivors!", 3, false)
return nil
end
if ChoosenSurvivorTarget == nil or ChoosenSurvivorTarget == "" or not ChoosenSurvivorTarget then
Notify("Error!", "Choose your target!", 3, warn)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChild(ChoosenSurvivorTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildAdded:Connect(function(child)
pcall(function()
TeleportToSurvivorDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor")))
end)
end)
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToSurvivorDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor")))
end)
end)

local TeleportToGhostDropdown = Tab_12:CreateDropdown({Name = "Target Ghost"; Options = GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
ChoosenGhostTarget = ConvertDropdownValue(Value)
end; })
Tab_12:CreateButton({Name = "Teleport to Ghost"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no ghosts!", 3, warn)
return nil
end
if ChoosenGhostTarget == nil or ChoosenGhostTarget == "" or not ChoosenGhostTarget then
Notify("Error!", "Choose your target!", 3, false)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost"):FindFirstChild(ChoosenGhostTarget):WaitForChild("HumanoidRootPart"))
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost").ChildAdded:Connect(function(child)
pcall(function()
TeleportToGhostDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")))
end)
end)
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost").ChildRemoved:Connect(function(child)
pcall(function()
TeleportToGhostDropdown:Refresh(GetChildNames(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")))
end)
end)

Tab_12:CreateSection("Specific Teleports")

Tab_12:CreateButton({Name = "Teleport to Survivor with caretaker"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):FindFirstChildOfClass("Model") then
Notify("Error!", "There are no caretakers!", 3, warn)
return nil
end
local plrwithcaretaker = nil
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):GetChildren()) do
if v and v.Parent and (v:WaitForChild("Vanities"):WaitForChild("Caretaker").Transparency ~= 1 or v:WaitForChild("Vanities"):WaitForChild("Aussie Slouch"):WaitForChild("Mesh").TextureId == "rbxassetid://130388665159057") then
plrwithcaretaker = v
end
end
if plrwithcaretaker then
SafeTeleport(plrwithcaretaker:WaitForChild("HumanoidRootPart"))
else
Notify("Error!", "There are no caretakers!", 3, warn)
end
end; })

Tab_12:CreateButton({Name = "Teleport to Injured survivor"; Callback = function()
local injuredplr = nil
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Survivor"):GetChildren()) do
if v and v.Parent and (v:WaitForChild("Humanoid").Health < tonumber(v:WaitForChild("Humanoid").MaxHealth)) then
injuredplr = v
end
end
if injuredplr then
SafeTeleport(injuredplr:WaitForChild("HumanoidRootPart"))
else
Notify("Error!", "There are no injured players!", 3, warn)
end
end; })

Tab_12:CreateButton({Name = "Teleport to Bonus Pad"; Callback = function()
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):FindFirstChild("BonusPad") then
Notify("Error!", "There are no bonus pads!", 3, warn)
return nil
end
SafeTeleport(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):WaitForChild("BonusPad"):WaitForChild("Pad"))
end; })


local survivorFolder = workspace:FindFirstChild("GameAssets") and workspace.GameAssets.Teams:FindFirstChild("Survivor")

local function tpCarePad()
if not hrp then return end
for _, v in pairs(survivorFolder:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
	local a1 = v:GetAttribute("Ability1")
	local a2 = v:GetAttribute("Ability2")
	if (a1 == "Caretaker" and a2 == "BonusPad") or (a1 == "BonusPad" and a2 == "Caretaker") then
		if v == Character then return end -- this ignore if you have CarePad so yeah
		SafeTeleport(v.HumanoidRootPart)
		return
	end
end
end
end

Tab_12:CreateButton({Name = "Teleport to CarePad Survivor"; Callback = function()
tpCarePad()
end; })

local Tab_10 = Window:CreateTab("Audio",0)
if HaveWorkspaceAccess() ~= true then
Tab_10:CreateParagraph({Title = "Not Supported", Content = "Your executor doesn't support those functions: workspace access or getcustomasset"})
end

if HaveWorkspaceAccess() then
local LMSes_Backup = game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:Clone()
LMSes_Backup.Name = "LMSSongs"
LMSes_Backup.Parent = game.CoreGui.DOD_Assets
for i,v in next, LMSes_Backup:GetDescendants() do
if v and v:IsA("Sound") and v.Playing == true then
v.Playing = false
end
end

Tab_10:CreateParagraph({Title = "Audio", Content = "Audio Management ( Mostly LMS and chases )"})
Tab_10:CreateSection("Custom LMS")
local choosen_lms = ""
local LMS_Audios = Tab_10:CreateDropdown({Name = "LMS Audios"; Options = loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))(); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
choosen_lms = ConvertDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Reload LMS Audios"; Callback = function()
LMS_Audios:Refresh(loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))())
Notify("Success!","Reloading LMS Audios...",3,true)
end; })
Tab_10:CreateButton({Name = "Set Custom LMS"; Callback = function()
if (choosen_lms == nil or choosen_lms == "") then
Notify("Error!","Choose Audio!",3,warn)
return
end
local temp_table = loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))()
if not table.find(temp_table, choosen_lms) then
Notify("Error!","File isn't added! ( Please reload lms audios and choose again. )",3,false)
return
end
if not IsFile("NexerHub/DieOfDeath/Assets/LMS/"..choosen_lms..".mp3") then
Notify("Error!","File not found! ( Please check ''LMS'' folder and make sure it is here. )",3,false)
return
end
for i,v in next, game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:GetChildren() do
if v and v:IsA("Sound") then
v.SoundId = GetFile("NexerHub/DieOfDeath/Assets/LMS/"..choosen_lms..".mp3","gca")
end
end
Notify("Success!","Set ''"..choosen_lms.."'' as new custom LMS!",4,true)
end; })
Tab_10:CreateButton({Name = "Restore Normal LMS"; Callback = function()
if game:GetService("ReplicatedStorage").Sounds.Songs:FindFirstChild("LMSSongs") then
game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:Destroy()
end
game.CoreGui.DOD_Assets.LMSSongs:Clone().Parent = game:GetService("ReplicatedStorage").Sounds.Songs
Notify("Success!","Restored!",3,true)
end; })
Tab_10:CreateSlider({Name = "LMS Volume ( Restore Normal LMS to Reset )"; Range = {0, 10}; Increment = .5; Suffix = ""; CurrentValue = 1; Callback = function(Value)
for i,v in next, game:GetService("ReplicatedStorage").Sounds.Songs.LMSSongs:GetChildren() do
if v and v:IsA("Sound") then
local temp_volume = tonumber(Value)
v:GetPropertyChangedSignal("Volume"):Connect(function()
v.Volume = temp_volume
end)
v.Volume = temp_volume
end
end
end; })



Tab_10:CreateSection("Custom LMS ( settings )")
local lms_file_name = "Type Here!"
Tab_10:CreateParagraph({Title = "How to add your own music?", Content = "Find your executor's folder in your phone's explorer, then find the ''workspace'' folder, and inside it you must find ''NexerHub'' folder, now go inside it, then click ''Assets'' and ''LMS''. And now, in this folder, input your mp3 music."})
Tab_10:CreateInput({Name = "File Name"; PlaceholderText = "Type Here! ( WRITE ONLY NAME, WITHOUT ''.mp3'' )"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
lms_file_name = ConvertDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Add File"; Callback = function()
if not IsFile("NexerHub/DieOfDeath/Assets/LMS/"..lms_file_name..".mp3") then
Notify("Error!","File not found! ( Did you entered name correctly? Make sure it is mp3. Don't write ''.mp3'' at the end, only the name of the file. )",5,false)
return
end
local temp_table = loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))()
if table.find(temp_table, lms_file_name) then
Notify("Error!","This file is already added!", 3, warn)
return
end
InsertElement("NexerHub/DieOfDeath/Assets/LMS/data.luau", lms_file_name)
Notify("Success!","Added File!",3,true)
end; })
Tab_10:CreateButton({Name = "Remove File"; Callback = function()
local temp_table = loadstring(GetFile("NexerHub/DieOfDeath/Assets/LMS/data.luau","rf"))()
if not table.find(temp_table, lms_file_name) then
Notify("Error!","File isn't added! ( Did you entered name correctly? )",3,false)
return
end
RemoveElement("NexerHub/DieOfDeath/Assets/LMS/data.luau", lms_file_name)
Notify("Success!","Removed File!",3,true)
end; })


Tab_10:CreateSection("")
Tab_10:CreateSection("")

Tab_10:CreateSection("Custom Chase Themes")
local choosen_chase = ""
local Chases_Audios = Tab_10:CreateDropdown({Name = "Chase Themes"; Options = loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))(); CurrentOption = ""; MultiSelection = false; Callback = function(Value)
choosen_chase = ConvertDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Reload Chase Themes"; Callback = function()
Chases_Audios:Refresh(loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))())
Notify("Success!","Reloading Chase Themes...",3,true)
end; })
Tab_10:CreateButton({Name = "Set Custom Chase Theme"; Callback = function()
if (choosen_chase == nil or choosen_chase == "") then
Notify("Error!","Choose Audio!",3,warn)
return
end
local temp_table = loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))()
if not table.find(temp_table, choosen_chase) then
Notify("Error!","File isn't added! ( Please reload chase themes and choose again. )",3,false)
return
end
if not IsFile("NexerHub/DieOfDeath/Assets/Chases/"..choosen_chase..".mp3") then
Notify("Error!","File not found! ( Please check ''Chases'' folder and make sure it is here. )",3,false)
return
end
for i,v in next, workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):GetDescendants() do
if v and v:IsA("Sound") and v.Name == "ChaseTheme" then
v.SoundId = GetFile("NexerHub/DieOfDeath/Assets/Chases/"..choosen_chase..".mp3","gca")
end
end
Notify("Success!","Set ''"..choosen_chase.."'' as new custom chase!",4,true)
end; })
Tab_10:CreateSlider({Name = "Chase Themes Volume"; Range = {0, 10}; Increment = .5; Suffix = ""; CurrentValue = 1; Callback = function(Value)
for i,v in next, workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):GetDescendants() do
if v and v:IsA("Sound") and v.Name == "ChaseTheme" then
local temp_volume = tonumber(Value)
v:GetPropertyChangedSignal("Volume"):Connect(function()
v.Volume = temp_volume
end)
v.Volume = temp_volume
end
end
end; })


Tab_10:CreateSection("Custom Chase Themes ( settings )")
local chase_file_name = "Type Here!"
Tab_10:CreateParagraph({Title = "How to add your own music?", Content = "Find your executor's folder in your phone's explorer, then find the ''workspace'' folder, and inside it you must find ''NexerHub'' folder, now go inside it, then click ''Assets'' and ''Chases''. And now, in this folder, input your mp3 music."})
Tab_10:CreateInput({Name = "File Name"; PlaceholderText = "Type Here! ( WRITE ONLY NAME, WITHOUT ''.mp3'' )"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
chase_file_name = ConvertDropdownValue(Value)
end; })
Tab_10:CreateButton({Name = "Add File"; Callback = function()
if not IsFile("NexerHub/DieOfDeath/Assets/Chases/"..chase_file_name..".mp3") then
Notify("Error!","File not found! ( Did you entered name correctly? Make sure it is mp3. Don't write ''.mp3'' at the end, only the name of the file. )",5,false)
return
end
local temp_table = loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))()
if table.find(temp_table, chase_file_name) then
Notify("Error!","This file is already added!",3,warn)
return
end
InsertElement("NexerHub/DieOfDeath/Assets/Chases/data.luau", chase_file_name)
Notify("Success!","Added File!",3,true)
end; })
Tab_10:CreateButton({Name = "Remove File"; Callback = function()
local temp_table = loadstring(GetFile("NexerHub/DieOfDeath/Assets/Chases/data.luau","rf"))()
if not table.find(temp_table, chase_file_name) then
Notify("Error!","File isn't added! ( Did you entered name correctly? )",3,false)
return
end
RemoveElement("NexerHub/DieOfDeath/Assets/Chases/data.luau", chase_file_name)
Notify("Success!","Removed File!",3,true)
end; })

end

local Tab_8 = Window:CreateTab("Fun",0)
Tab_8:CreateParagraph({Title = "Fun", Content = "Funny things will be here here soon muehehehe"})
Tab_8:CreateSection("Movement")
Tab_8:CreateToggle({Name = "Frontflip"; CurrentValue = true; Callback = function(Value)
SetFrontFlip(Value)
end; })
SetFrontFlip(true)



Tab_8:CreateButton({Name = "Give yourself stalk"; Callback = function()
local function Stalk()
local function TempAnim(id)
local temp_anim = Instance.new("Animation")
temp_anim.AnimationId = id
return temp_anim
end
local stalk_start = Humanoid:LoadAnimation(TempAnim("rbxassetid://130725432915474"))
local stalk_loop =  Humanoid:LoadAnimation(TempAnim("rbxassetid://102302720518230"))
for i = 1,4 do
if i == 1 then
if not HumanoidRootPart:FindFirstChild("Stalk") then
game:GetService("ReplicatedStorage").Characters.Killer.Pursuer.Avoider.HumanoidRootPart.Stalk:Clone().Parent = HumanoidRootPart
end
else
if not HumanoidRootPart:FindFirstChild("Stalk"..tostring(i)) then
game:GetService("ReplicatedStorage").Characters.Killer.Pursuer.Avoider.HumanoidRootPart["Stalk"..tostring(i)]:Clone().Parent = HumanoidRootPart
end
end
end
local old_ws = 10
local old_ss = 26
Humanoid.Parent:SetAttribute("WalkSpeed",0)
Humanoid.Parent:SetAttribute("SprintSpeed",0)
stalk_start:Play()
for i = 1,2 do
if i == 2 then
task.wait(1.5)
end
local temp_rndm = math.random(1,4)
if temp_rndm == 1 then
HumanoidRootPart["Stalk"]:Play()
else
HumanoidRootPart["Stalk"..tostring(temp_rndm)]:Play()
end
end
task.wait(2)
task.delay(.6, function()
Humanoid.Parent:SetAttribute("WalkSpeed",(old_ws/1.5))
Humanoid.Parent:SetAttribute("SprintSpeed",(old_ss/1.5))
task.wait(1.2)
Humanoid.Parent:SetAttribute("WalkSpeed",27)
Humanoid.Parent:SetAttribute("SprintSpeed",55)
end)
stalk_loop:Play()
for i = 1,10 do
for i,v in next, Humanoid.Parent:GetDescendants() do
if v and v:IsA("BasePart") or v:IsA("SpecialMesh") and v.Name ~= "HumanoidRootPart" then
pcall(function()
v.Transparency += 0.1
end)
end
end
task.wait(.13)
end
stalk_loop:Stop()
ApplyInvisibility(true)
task.wait(10)
ApplyInvisibility(false)
stalk_loop:Play()
Humanoid.Parent:SetAttribute("WalkSpeed",(old_ws/2))
Humanoid.Parent:SetAttribute("SprintSpeed",(old_ss/2))
for i = 1,10 do
for i,v in next, Humanoid.Parent:GetDescendants() do
if v and v:IsA("BasePart") or v:IsA("SpecialMesh") and v.Name ~= "HumanoidRootPart" then
pcall(function()
v.Transparency -= 0.1
end)
end
end
task.wait(.13)
end
task.wait(.5)
stalk_loop:Stop()
Humanoid.Parent:SetAttribute("WalkSpeed",old_ws)
Humanoid.Parent:SetAttribute("SprintSpeed",old_ss)
end
AbilityModule.CreateAbility({Client = true, ClientFunction = Stalk, Name = "Stalk_NH",InputShown = "",Tip = "Turn invisible and gain speed, cant use abilities and a long endlag after.",Cooldown = 15, Icon = "rbxassetid://92577246919936", DisplayName = "Stalk"})
end; })



Tab_8:CreateButton({Name = "Give yourself dash without cooldown"; Callback = function()
local function Dash()
local function TempAnim(id)
local temp_anim = Instance.new("Animation")
temp_anim.AnimationId = id
return temp_anim
end
task.spawn(function()
local dashanim = Humanoid:LoadAnimation(TempAnim("rbxassetid://78278813483757"))
dashanim:Play()
task.delay(.42, function()
dashanim:Stop()
end)
end)
if not HumanoidRootPart:FindFirstChild("DashPE") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Particles.DashPE:Clone().Parent = HumanoidRootPart
end
if not HumanoidRootPart:FindFirstChild("DashPE3") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Particles["DashPE3"]:Clone().Parent = HumanoidRootPart
end
if not HumanoidRootPart:FindFirstChild("DashSmokePE") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Particles.DashSmokePE:Clone().Parent = HumanoidRootPart
end
if not HumanoidRootPart:FindFirstChild("Dash") then
game:GetService("ReplicatedStorage").Characters.Survivor.Civilian.HumanoidRootPart.Sounds.Dash:Clone().Parent = HumanoidRootPart
end
repeat task.wait() until HumanoidRootPart:FindFirstChild("DashPE")
local function EmitDash()
for i,v in next, HumanoidRootPart:FindFirstChild("DashPE"):GetChildren() do
if v then
v:Emit(2)
end
end
for i,v in next, HumanoidRootPart:FindFirstChild("DashSmokePE"):GetChildren() do
if v then
v:Emit(25)
end
end
HumanoidRootPart:FindFirstChild("DashPE3"):Emit(2)
HumanoidRootPart:FindFirstChild("Dash"):Play()
end
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(1000000,1000,1000000)
BodyVelocity.P = 1250
BodyVelocity.Velocity = HumanoidRootPart.CFrame.LookVector * 80
BodyVelocity.Parent = HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .3)
EmitDash()
end
AbilityModule.CreateAbility({Client = true, ClientFunction = Dash, Name = "Dash_NH",InputShown = "",Tip = "Dash foward, and gain no cooldown.",Cooldown = .2, Icon = "rbxassetid://73777691791017",DisplayName = "Dash without cooldown"})
end; })


-- Dont skid baka
function ReplaceModel(Model1, Model2)
if not game.Players:GetPlayerFromCharacter(Model1) then return end
for i,v in pairs(Model1:GetChildren()) do
	if v and game:GetService("ReplicatedStorage").Characters.Killer:FindFirstChild(v.Name, true) then
		if game:GetService("ReplicatedStorage").Characters.Killer:FindFirstChild(v.Name, true):IsA("Model") then
			v:Destroy()
		end
	end
end
local function setnewchanges()
pcall(function()
workspace:SetAttribute("AnimationsEnabled", false)
task.wait()
workspace:SetAttribute("AnimationsEnabled", true)
end)
pcall(function()
for i,v in next, game.Players:GetPlayerFromCharacter(Model1).Character.Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(0)
v:Stop()
end
end)
end
local suit = Model2:Clone()
--[[if suit:FindFirstChild("Humanoid") then
	suit:FindFirstChild("Humanoid").EvaluateStateMachine = false
	if suit.Humanoid:FindFirstChild("Animate") then
		suit.Humanoid:FindFirstChild("Animate"):Destroy()
	end
	if suit.Humanoid:FindFirstChild("Animator") then
		suit.Humanoid:FindFirstChild("Animator"):Destroy()
	end
end
]]
suit.Parent = Model1
for _,item in pairs({"Humanoid", "HumanoidRootPart", "Animate", "Animations"}) do
    local object = suit:FindFirstChild(item)
    if object then
        object:Destroy()
    end
end
for _,item in pairs({"Spear", "CloneTool", "MusicBox", "Speaker", "BackDagger", "Dagger", "Face", "Accessories", "Hands"}) do
    local object = Model1:FindFirstChild(item)
    if object then
        object:Destroy()
    end
end
pcall(function()
	if Model1:FindFirstChild("Torso") and Model1.Torso:FindFirstChild("Decal") then
		Model1.Torso:FindFirstChild("Decal"):Destroy()
	end
end)
local humanoid = Model1:FindFirstChildOfClass("Humanoid")
if not humanoid then return nil end
local partstohide = {}
local suitparts = {}
local function scan(o)
    for _,child in pairs(o:GetChildren()) do
        if child:IsA("BasePart") then
            table.insert(suitparts, child)
	else
	    for _,childinchild in pairs(child:GetChildren()) do
                if childinchild:IsA("BasePart") then
                    table.insert(suitparts, childinchild)    
                end
            end
        end
    end
end
scan(suit)
for _,part in pairs(suitparts) do
local charpart = Model1:FindFirstChild(part.Name)
if charpart and (humanoid.RigType.Name == "R6" or charpart:IsA("BasePart")) then
        local motor = Instance.new("Motor6D")
        motor.Name = "SuitAttachment_"..part.Name
        motor.Part0 = charpart
        motor.Part1 = part
        motor.C0 = CFrame.new()
        motor.C1 = CFrame.new()
        motor.Parent = charpart
        partstohide[charpart] = true
else
        part:Destroy()
end
end
for part in pairs(partstohide) do
part.Transparency = 1
if part:IsA("MeshPart") then
        part.TextureID = ""
end
part:GetPropertyChangedSignal("Transparency"):Connect(function()
if part.Transparency ~= 1 then
part.Transparency = 1
end
if part:IsA("MeshPart") then
part.TextureID = ""
end
end)
end
local checkedchildren = {}
for i,v in pairs(Model1.HumanoidRootPart:GetChildren()) do
	if v.Name ~= "RootJoint" then
		table.insert(checkedchildren, v.Name)
	end
end
for i,v in pairs(Model2.HumanoidRootPart:GetChildren()) do
	if v.Name ~= "RootJoint" and table.find(checkedchildren, v.Name) and v:IsA("Sound") then
		Model1.HumanoidRootPart[v.Name].SoundId = v.SoundId
	end
end

if Model2:FindFirstChild("Animations") then
checkedchildren = {}
for i,v in pairs(Model1.Animations:GetChildren()) do
	table.insert(checkedchildren, v.Name)
end
for i,v in pairs(Model2.Animations:GetChildren()) do
	if table.find(checkedchildren, v.Name) and v:IsA("Sound") then
		Model1.Animations[v.Name].SoundId = v.SoundId
	elseif table.find(checkedchildren, v.Name) and v:IsA("Animation") then
		Model1.Animations[v.Name].AnimationId = v.AnimationId
	end
end
end
setnewchanges()
end

function GetKillerModelByName(name)
for i,v in next, game:GetService("ReplicatedStorage").Characters.Killer:GetChildren() do
if v and v:IsA("Folder") and v:FindFirstChild(name) and v:FindFirstChild(name):IsA("Model") then
return v:FindFirstChild(name)
end
end
return nil
end

Tab_8:CreateLabel("Experimental Features")

local KillerAppearance = "MISO"
Tab_8:CreateInput({Name = "Custom Appearance ( put any killer skin name here )"; PlaceholderText = "MISO"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
KillerAppearance = ConvertDropdownValue(Value)
end; })
Tab_8:CreateButton({Name = "Change your appearance"; Callback = function()
if GetKillerModelByName(KillerAppearance) == nil then
Notify("Error!","Incorrect killer name.",3,warn)
return
end
ReplaceModel(workspace.GameAssets.Teams:FindFirstChild(game.Players.LocalPlayer.Name, true), GetKillerModelByName(KillerAppearance))
end; })
Tab_8:CreateButton({Name = "Change current killer(s) appearance"; Callback = function()
if GetKillerModelByName(KillerAppearance) == nil then
Notify("Error!","Incorrect killer name.",3,warn)
return
end
for i,v in next, workspace.GameAssets.Teams.Killer:GetChildren() do
if v then
ReplaceModel(v, GetKillerModelByName(KillerAppearance))
end
end
end; })




local Tab_11 = Window:CreateTab("Config Settings",0)
Tab_11:CreateParagraph({Title = "Config Settings", Content = "Save and load config files. You can share your config to other people."})
local temp_module = [[local SpecialCharacters = {['\a'] = '\\a', ['\b'] = '\\b', ['\f'] = '\\f', ['\n'] = '\\n', ['\r'] = '\\r', ['\t'] = '\\t', ['\v'] = '\\v', ['\0'] = '\\0'}
local Keywords = { ['and'] = true, ['break'] = true, ['do'] = true, ['else'] = true, ['elseif'] = true, ['end'] = true, ['false'] = true, ['for'] = true, ['function'] = true, ['if'] = true, ['in'] = true, ['local'] = true, ['nil'] = true, ['not'] = true, ['or'] = true, ['repeat'] = true, ['return'] = true, ['then'] = true, ['true'] = true, ['until'] = true, ['while'] = true, ['continue'] = true}
local Functions = {
    [pairs] = "pairs",
    [ipairs] = "ipairs", 
    [next] = "next",
    [type] = "type",
    [tostring] = "tostring",
    [tonumber] = "tonumber",
    [print] = "print",
    [error] = "error",
    [assert] = "assert",
    [pcall] = "pcall",
    [xpcall] = "xpcall",
    [select] = "select",
    [rawget] = "rawget",
    [rawset] = "rawset",
    [rawequal] = "rawequal",
    [getmetatable] = "getmetatable",
    [setmetatable] = "setmetatable",
    [require] = "require",
}
if loadstring then Functions[loadstring] = "loadstring" end
if load then Functions[load] = "load" end
local function safeTypeof(value)
    if typeof then
        return typeof(value)
    else
        return type(value)
    end
end
function GetHierarchy(Object)
    if not Object or (type(Object) ~= "table" and safeTypeof(Object) ~= "Instance") then
        return tostring(Object)
    end
    local Hierarchy = {}
    local current = Object
    while current do
        local name = tostring(current.Name or current.name or "Unknown")
        name = string.gsub(name, '[%c%z]', SpecialCharacters)
        if current == game or current == _G.game then
            table.insert(Hierarchy, 1, "game")
        elseif Keywords[name] or not string.match(name, '^[_%a][_%w]*$') then
            table.insert(Hierarchy, 1, '["' .. name .. '"]')
        else
            table.insert(Hierarchy, 1, name)
        end
        current = current.Parent
    end
    
    return table.concat(Hierarchy, ".")
end
local function SerializeType(Value, Class)
    if Class == 'string' then
        return string.format('"%s"', string.gsub(Value, '[%c%z]', SpecialCharacters))
    elseif Class == 'Instance' then
        return GetHierarchy(Value)
    elseif Class == 'function' then
        return Functions[Value] or "'[Function: " .. tostring(Value) .. "]'"
    elseif Class == 'userdata' then
        return "'[userdata: " .. tostring(Value) .. "]'"
    elseif Class == 'thread' then
        if coroutine and coroutine.status then
            local status = pcall(function() return coroutine.status(Value) end)
            return "'[thread: " .. tostring(Value) .. (status and ", status: " .. coroutine.status(Value) or "") .. "]'"
        else
            return "'[thread: " .. tostring(Value) .. "]'"
        end
    else
        return tostring(Value)
    end
end
function TableToLuauString(Table, IgnoredTables, DepthData, Path)
    if type(Table) ~= "table" then
        return SerializeType(Table, safeTypeof(Table))
    end
    IgnoredTables = IgnoredTables or {}
    Path = Path or "ROOT"
    if not DepthData then
        DepthData = {0, Path}
    end
    local CyclicData = IgnoredTables[Table]
    if CyclicData then
        local currentDepth = DepthData[1] or 0
        local cyclicDepth = CyclicData[1] or 0
        return ((cyclicDepth == currentDepth - 1 and "'[Cyclic Parent " or "'[Cyclic ") .. tostring(Table) .. ', path: ' .. (CyclicData[2] or "unknown") .. "]'")
    end
    DepthData[1] = (DepthData[1] or 0) + 1
    DepthData[2] = Path
    IgnoredTables[Table] = {DepthData[1], DepthData[2]}
    local currentDepth = DepthData[1] or 1
    local Tab = string.rep('    ', currentDepth)
    local TrailingTab = string.rep('    ', currentDepth - 1)
    local Result = '{'
    local LineTab = '\n' .. Tab
    local HasOrder = true
    local Index = 1
    local IsEmpty = true
    for Key, Value in pairs(Table) do
        IsEmpty = false
        if Index ~= Key then
            HasOrder = false
        else
            Index = Index + 1
        end
        local KeyClass = safeTypeof(Key)
        local ValueClass = safeTypeof(Value)
        local HasBrackets = false
        local KeyStr
        if KeyClass == 'string' then
            local cleanKey = string.gsub(Key, '[%c%z]', SpecialCharacters)
            if Keywords[cleanKey] or not string.match(cleanKey, '^[_%a][_%w]*$') then
                HasBrackets = true
                KeyStr = string.format('["%s"]', cleanKey)
            else
                KeyStr = cleanKey
            end
        else
            HasBrackets = true
            if KeyClass == 'table' then
                KeyStr = '[' .. TableToLuauString(Key, IgnoredTables, {currentDepth + 1, Path}) .. ']'
            else
                KeyStr = '[' .. SerializeType(Key, KeyClass) .. ']'
            end
        end
        local ValueStr
        if ValueClass == 'table' then
            local newPath = Path .. (HasBrackets and '' or '.') .. KeyStr
            ValueStr = TableToLuauString(Value, IgnoredTables, {currentDepth + 1, Path}, newPath)
        else
            ValueStr = SerializeType(Value, ValueClass)
        end
        Result = Result .. LineTab .. (HasOrder and ValueStr or KeyStr .. ' = ' .. ValueStr) .. ','
    end
    local donetable = IsEmpty and Result .. '}' or string.sub(Result, 1, -2) .. '\n' .. TrailingTab .. '}'
    IgnoredTables[Table] = nil
    return donetable
end

function minify_config(tblz)
    if not tblz then return end
    local tblz_loader = loadstring or load
    local tbl = tblz_loader(tblz)()
    local seen = {}
    local function serialize(value)
        local t = type(value)
        if t == "string" then 
            return string.format("%q", value)
        elseif t == "number" then 
            return tostring(value)
        elseif t == "boolean" then 
            return value and "true" or "false"
        elseif t == "table" then
            if seen[value] then return "\"<circular>\"" end
            seen[value] = true
            local parts = {}
            for i = 1,#value do
                parts[i] = serialize(value[i])
            end
            for k,v in pairs(value) do
                if not (type(k) == "number" and k >= 1 and k <= #value and math.floor(k) == k) then
                    local key = type(k) == "string" and k:match("^[%a_][%w_]*$") and k or "["..serialize(k).."]"
                    parts[#parts + 1] = key.."="..serialize(v)
                end
            end
            seen[value] = nil
            return "{"..table.concat(parts, ",").."}"
        else
            return "nil"
        end
    end
    return serialize(tbl)
end
function compile_config(txt)
    if not txt then return "" end
    local text = minify_config(txt)
    local shifted = text:gsub(".", function(char)
        local byte = string.byte(char)
        return string.char(byte + 5)
    end)
    local hexed = shifted:gsub(".", function(char)
        return string.format("%02X", string.byte(char))
    end)
    local separators = {"-", ":", "|", ".", "_", "~", "#", "!"}
    local withSeparators = hexed:gsub("(%x%x)", function(hexPair)
        return hexPair .. "-"
    end)
    return "[" .. withSeparators:sub(1,-2) .. "]"
end
function decompile_config(obfuscatedText)
    if not obfuscatedText then return "" end
    local content = obfuscatedText:sub(2, -2)
    local hexOnly = content:gsub("[%-%:|%.%_%~%#%!]", "")
    local shifted = hexOnly:gsub("(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end)
    local original = shifted:gsub(".", function(char)
        local byte = string.byte(char)
        return string.char(byte - 5)
    end)
    local tblz_loader = loadstring or load
    return ('return '..TableToLuauString(tblz_loader('return '..original..'')()))
end

return {["decompile_config"]=decompile_config;["compile_config"]=compile_config;}]]
local ConfigurationModule = loadstring(temp_module)()

Tab_11:CreateButton({Name = "Re-Execute Script"; Callback = function()
loadstring(game:HttpGet(_G.dod_repository))()
Notify("Success!", "Re-Executing script...", 5, true)
end; })

Tab_11:CreateSection("Config Save")
Tab_11:CreateLabel("Configurations are being auto-saved.")
Tab_11:CreateButton({Name = "Copy Config Values"; Callback = function()
setclipboard(tostring(ConfigurationModule.compile_config(GetFile("NexerHub/Core/"..config_save.."", "rf"))))
Notify("Success!", "Copied Config Values!", 4, true)
end; })

Tab_11:CreateSection("Config Load")
Tab_11:CreateLabel("You will have to re-execute script for new configurations to apply!")
local ConfigValue = "Enter Here!"
Tab_11:CreateInput({Name = "Enter Config Values"; PlaceholderText = ConfigValue; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ConfigValue = Value
end; })
Tab_11:CreateButton({Name = "Load Config Values"; Callback = function()
writefile("NexerHub/Core/"..config_save.."", ConfigurationModule.decompile_config(ConfigValue))
Notify("Success!", "Applied New Config Values! You will have to re-execute script for new configurations to apply.", 10, true)
end; })


local Tab_9 = Window:CreateTab("Other",0)
Tab_9:CreateParagraph({Title = "Other", Content = "Other random thingiez"})
Tab_9:CreateDropdown({Name = "Gui Theme"; Options = {"Amethyst","Default","AmberGlow","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}; CurrentOption = RayfieldGuiTheme; MultiSelection = false; Callback = function(Value)
RayfieldGuiTheme = ConvertDropdownValue(Value)
Window.ModifyTheme(RayfieldGuiTheme)
SaveConfig("Tab_9", RayfieldGuiTheme, "GuiTheme")
end; })
Tab_9:CreateButton({Name = "Show Ping"; Callback = function()
local function PowerDebug()
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.ID.Visible = true
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.PlaceVersion.Visible = true
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.Ping.Visible = true
while task.wait(1) do
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.ID.Text = "Information Powered by "..((_G.dod_developer_key ~= nil and _G.dod_developer_key) or "Unknown").." Hub"
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.PlaceVersion.Text = "Place Version: "..game.PlaceVersion..""
game:GetService("Players").LocalPlayer.PlayerGui.MainGui.DebugInfo.Ping.Text = "Ping: "..tonumber(math.round(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), "(")[1])).."ms (round-trip)"
end
end
task.spawn(PowerDebug)
end; })
Tab_9:CreateButton({Name = "Close Hub"; Callback = function()
DestroyRayfield()
end; })



