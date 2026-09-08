if not game:IsLoaded() then game.Loaded:Wait() end
local g = getgenv()
g.Game = cloneref and cloneref(game) or game
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Backup_Repo/refs/heads/main/Notify_Lib.lua"))()
wait(0.2)
g.Flames_Hub_Base_Loader_Currently_Shown = true
g.notify = g.notify or function(notif_type, msg, duration) NotifyLib:External_Notification(tostring(notif_type), tostring(msg), tonumber(duration)) end
local TeleportService = g.TeleportService or cloneref and cloneref(game:GetService("TeleportService")) or game:GetService("TeleportService")
local Players = g.Players or cloneref and cloneref(game:GetService("Players")) or game:GetService("Players")
local LocalPlayer = g.LocalPlayer or Players.LocalPlayer or game.Players.LocalPlayer
local UserInputService = g.UserInputService or cloneref and cloneref(game:GetService("UserInputService")) or game:GetService("UserInputService")
local MarketplaceService = g.MarketplaceService or cloneref and cloneref(game:GetService("MarketplaceService")) or game:GetService("MarketplaceService")
local CoreGui = g.CoreGui or cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
local base_url = "https://raw.githubusercontent.com/dudeididntliterally/Main/refs/heads/main/Experiences/"
local function get_game_name_by_place_id(place_id)
    if not place_id then return end
    local conv_str = MarketplaceService:GetProductInfo(place_id)
    if conv_str and typeof(conv_str) == "table" and conv_str.Name then
        return conv_str.Name
    elseif conv_str and typeof(conv_str) == "string" then
        return conv_str.Name
    else
        if g.notify then
            return g.notify("Error", "The game either does not exist anymore or did not return anything from Roblox's API!", 5)
        else
            return warn("Game Name is not a string or was returned as nil!")
        end
    end
end

local scriptstoload = {
    ["Tower Of Misery"] = {
        id = 4954752502,
        link = base_url .. "4954752502.lua"
    },
    ["Ultimate Driving"] = {
        id = 54865335,
        link = base_url .. "54865335.lua"
    },
    ["Life Together RP"] = {
        id = {13967668166, 99644611200703, 99154507657228},
        link = base_url .. "13967668166.lua"
    },
    ["Hide And Seek Extreme"] = {
        id = 205224386,
        link = base_url .. "205224386.lua"
    },
    -- [[ Before it got banned / shutdown / taken down, it was called 'Banned Apartments', so I imagine something got them shutdown, not sure though, but all I know is the game is gone. ]] --
    ["Apartment Hangout Spot"] = {
        id = 108873247414429,
        link = base_url .. "108873247414429.lua"
    },
    ["The Lanes"] = {
        id = 1333478699,
        link = base_url .. "1333478699.lua"
    },
    ["Player or AI"] = {
        id = 95217169945642,
        link = base_url .. "95217169945642.lua"
    },
    ["Main Street RP"] = {
        id = 18753889337,
        link = base_url .. "18753889337.lua"
    },
    ["Southwest Florida Beta"] = {
        id = 5104202731,
        link = base_url .. "5104202731.lua"
    },
    ["Driving Empire"] = {
        id = 3351674303,
        link = base_url .. "3351674303.lua"
    },
    ["Berry Avenue RP"] = {
        id = 8481844229,
        link = base_url .. "8481844229.lua"
    },
    ["Mega Fun Obby"] = {
        id = 12996397,
        link = base_url .. "12996397.lua"
    },
    ["Catalog Avatar Creator"] = {
        id = 7041939546,
        link = base_url .. "7041939546.lua"
    },
    ["Tower Of Hell"] = {
        id = 1962086868,
        link = base_url .. "1962086868.lua"
    },
    ["Car Driving Ultimate"] = {
        id = 11145865512,
        link = base_url .. "11145865512.lua"
    },
    ["Southern Mudding"] = {
        id = 79480724066456,
        link = base_url .. "79480724066456.lua"
    },
    ["Car Zone"] = {
        id = 80200604311136,
        link = base_url .. "80200604311136.lua"
    },
    ["Redcliff City RP"] = {
        id = 8369888266,
        link = base_url .. "8369888266.lua"
    },
    ["Dreamville RP"] = {
        id = 74395953411817,
        link = base_url .. "74395953411817.lua"
    },
    ["NewSmith RP"] = {
        id = 16625391970,
        link = base_url .. "16625391970.lua"
    },
    ["Bilberry CityRP"] = {
        id = 13972889842,
        link = base_url .. "13972889842.lua"
    }
}

local function matcheswhat(tpplaces, togo)
    if typeof(tpplaces) == "number" then
        return tpplaces == togo
    elseif typeof(tpplaces) == "table" then
        for _, id in ipairs(tpplaces) do
            if id == togo then return true end
        end
    end
    return false
end

local function load_str(url) if not url or typeof(url) ~= "string" then return warn("That is not a string: "..tostring(url)) end loadstring(game:HttpGet(url))() end
local function get_place_name(place_id)
    if not place_id then return end
    local id = type(place_id) == "table" and place_id[1] or place_id
    local ok, info = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(id)
    end)
    if ok and info then return info.Name end
end

local function FormatCEFloatStr(value) -- not in use anymore, still cool.
    if value == 0 then
        return "0.0000000E+0"
    end
    local abs_val = math.abs(value)
    local exponent = math.floor(math.log10(abs_val))
    local mantissa = value / (10 ^ exponent)
    while math.abs(mantissa) >= 10 do
        mantissa = mantissa / 10
        exponent = exponent + 1
    end
    while math.abs(mantissa) < 1 do
        mantissa = mantissa * 10
        exponent = exponent - 1
    end
    local formatted = string.format("%.7f", mantissa)
    if tonumber(formatted) >= 10 then
        mantissa = mantissa / 10
        exponent = exponent + 1
        formatted = string.format("%.7f", mantissa)
    end
    local exp_sign = exponent >= 0 and "+" or "-"
    return formatted .. "E" .. exp_sign .. math.abs(exponent)
end

local function GenerateRandomCEFloat(min_exp, max_exp)
    local mantissa = 1 + math.random() * 8.9999999
    local exponent = math.random(min_exp, max_exp)
    local formatted = string.format("%.7f", mantissa)
    local exp_sign = exponent >= 0 and "+" or "-"
    return formatted .. "E" .. exp_sign .. math.abs(exponent)
end

local flames_ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Backup_Repo/refs/heads/main/Atlas_UI.lua"))()
local Window = flames_ui.new({
	Name = "Flames Hub | Script Loader",
	ConfigFolder = "Flames_Hub_Menu",
	Color = Color3.fromRGB(21, 103, 251),
	Bind = "RightShift",
})
g.Buttons = g.Buttons or {}
local Page1 = Window:CreatePage("Main")
local Section1 = Page1:CreateSection("Home")
local Section2 = Page1:CreateSection("Game TPs")
local Section3 = Page1:CreateSection("Extras")
local function destroy_current_ui()
    if not flames_ui then return end
    local atlas_main_ui = CoreGui:FindFirstChild("Atlas")
    if atlas_main_ui and atlas_main_ui:IsA("ScreenGui") then
        local Main = atlas_main_ui:FindFirstChild("Main")
        if Main and Main:IsA("Frame") then
            pcall(function() Main.Visible = false end)
        end
    end
    --pcall(function() flames_ui:Destroy() end)
    getgenv().Looping_Window_Name_On_Flames_Hubs_Loader = false
    getgenv().spawned_change_window_name_tasked_loop = false
    if getgenv().window_changing_main_automatic_loop_task then
        pcall(function() task.cancel(getgenv().window_changing_main_automatic_loop_task) end)
        getgenv().window_changing_main_automatic_loop_task = nil
    end
end
local function get_nameless_admin_loaded()
    local registry = getreg and getreg() or getgenv()
    local na_env = registry
        and registry["__nameless_admin_private"]
        and registry["__nameless_admin_private"]["testing"]

    if na_env and (na_env.ltseverydayyou_NA or na_env.NA_LOADED) then
        return true
    end

    return false
end
wait(0.2)
Section3:CreateButton({
Name = "Flames Hub (Universal)",
Description = "Loads the universal version of Flames Hub.",
Callback = function()
    destroy_current_ui()
    task.wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Main/refs/heads/main/Scripts/Universal.lua"))()
end,})

Section3:CreateButton({
Name = "Free Emotes GUI",
Description = "Loads the Flames Hub | Free Emotes GUI script.",
Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Backup_Repo/refs/heads/main/Emotes_Backup.lua"))()
	if not UserInputService.TouchEnabled then
		if getgenv().notify then getgenv().notify("Success", "Press F to toggle.", 1) end
	else
		if getgenv().notify then getgenv().notify("Success", "Toggle with the 'F' button on the left side of your screen.", 3) end
	end
end})

Section3:CreateButton({
Name = "Condo Games Destroyer",
Description = "Loads the Condo Games Destroyer script.",
Callback = function()
    destroy_current_ui()
    task.wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Main/refs/heads/main/Scripts/GOAT_Games_GUI.lua"))()
end,})

Section3:CreateButton({
Name = "Infinite Yield FE",
Description = "Loads Infinite Yield FE (normal version).",
Callback = function()
    if getgenv().IY_LOADED then return end
    if getgenv().GET_LOADED_IY then return end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end,})

Section3:CreateButton({
Name = "Infinite Premium FE",
Description = "Loads Infinite Premium FE (my version).",
Callback = function()
    if getgenv().IY_LOADED then return end
    if getgenv().GET_LOADED_IY then return end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dudeididntliterally/Backup_Repo/refs/heads/main/Infinite_Premium.lua"))()
end,})

Section3:CreateButton({
Name = "Nameless Admin FE",
Description = "Loads Nameless Admin FE.",
Callback = function()
    local get_loaded = get_nameless_admin_loaded()
    if get_loaded then return end
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua'))()
end})

local Excluded_IDs = {99644611200703, 99154507657228}
local function is_excluded(id)
    local check = type(id) == "table" and id[1] or id
    for _, v in ipairs(Excluded_IDs) do
        if check == v then return true end
    end
    return false
end

for name, dude in pairs(scriptstoload) do
    if is_excluded(dude.id) then continue end
    local strname = name:gsub("%W", "_")
    local id_display = typeof(dude.id) == "table" and tostring(dude.id[1]) or tostring(dude.id)
    local id_for_name = typeof(dude.id) == "table" and dude.id[1] or dude.id
    local name_of_game_proper = get_place_name(id_for_name)

    g.Buttons[strname] = Section1:CreateButton({
    Name = name,
    Description = "Runs the " .. name .. " script. Place ID: " .. id_display,
    Callback = function()
        if not dude.id or not dude.link then return end
        if not matcheswhat(dude.id, game.PlaceId) then
            local name_of_game_proper = get_place_name(id_for_name)
            g.notify("Error", "You are not in: "..tostring(name_of_game_proper).."!", 10)
            return
        end

        destroy_current_ui()
        task.wait(0.5)
        load_str(dude.link)
    end,})
end

for name, schnawg in pairs(scriptstoload) do
    if is_excluded(schnawg.id) then continue end
    local id_for_lookup = typeof(schnawg.id) == "table" and schnawg.id[1] or schnawg.id
    local id_display = typeof(schnawg.id) == "table" and tostring(schnawg.id[1]) or tostring(schnawg.id)
    local lookup_ok, real_name = pcall(get_game_name_by_place_id, id_for_lookup)
    if not lookup_ok or not real_name or typeof(real_name) ~= "string" then real_name = name end
    g.Buttons[name] = Section2:CreateButton({
    Name = "Teleport To Game: "..tostring(real_name),
    Description = "Teleports you to "..tostring(real_name)..". Place ID: "..tostring(id_display),
    Callback = function()
        local idkok = type(schnawg.id) == "table" and schnawg.id[1] or schnawg.id
        if not idkok then return end
        if matcheswhat(schnawg.id, game.PlaceId) then
            g.notify("Info", "You are already in: "..tostring(real_name).. "!", 5)
            return
        end

        TeleportService:Teleport(idkok, LocalPlayer)
    end,})
end
