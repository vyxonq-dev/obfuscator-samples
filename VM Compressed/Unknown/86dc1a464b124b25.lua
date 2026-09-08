local TeleportService = game:GetService("TeleportService")

local queue = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/PrestineScripts/Main/refs/heads/main/Loader"))()'

if typeof(syn) == "table" and type(syn.queue_on_teleport) == "function" then
    syn.queue_on_teleport(queue)
elseif type(queue_on_teleport) == "function" then
    queue_on_teleport(queue)
end

local function safe_load_from_url(url)
    local ok, body_or_err = pcall(function()
        return game:HttpGet(url)
    end)
    if not ok or not body_or_err then return false end

    local fn, compile_err = loadstring(body_or_err)
    if not fn then return false end

    local exec_ok, exec_err = pcall(fn)
    if not exec_ok then return false end

    return true
end

local placeId = tonumber(game.PlaceId) or 0
if placeId == 79546208627805 or placeId == 126509999114328 then
    safe_load_from_url("https://raw.githubusercontent.com/PrestineScripts/Loader/refs/heads/main/99NITF")
elseif placeId == 131623223084840 then
    safe_load_from_url("https://raw.githubusercontent.com/PrestineScripts/Loader/refs/heads/main/ETFB")
end
