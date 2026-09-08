--[[
    Low Hub — Free Loader (disajikan oleh backend lewat /freeloader.lua).
    SERVER_URL diisi otomatis oleh server dari host request.

    Script Free juga butuh key — key Free diperoleh lewat tombol
    "Get Script Free" / command !getfree di Discord (klaim link monetisasi,
    1 HWID; fallback: trial 1 jam yang bisa diulang). Key Free tidak
    pernah permanen — habis masa aktif, klaim lagi.

    Cara pakai di executor:
        getgenv().FREE_KEY = "LUA-XXXX-XXXX-XXXX"
        loadstring(game:HttpGet("http://HOST:PORT/freeloader.lua"))()
]]

-- ====== KONFIG ======
local SERVER_URL = "http://nano-1.nura.host:5070"  -- diisi otomatis oleh backend
local KEY = getgenv and getgenv().FREE_KEY or ""
-- =====================

local HttpService = game:GetService("HttpService")

-- request function: dukung beberapa executor
local httpRequest = (syn and syn.request)
    or (http and http.request)
    or http_request
    or request

-- HWID mesin: key Free terikat ke 1 device.
local function getHWID()
    local id
    pcall(function()
        if type(gethwid) == "function" then id = gethwid() end
    end)
    if not id or id == "" then
        pcall(function()
            id = game:GetService("RbxAnalyticsService"):GetClientId()
        end)
    end
    return tostring(id or "")
end

local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 6,
        })
    end)
    warn(("[%s] %s"):format(title, text))
end

local function checkFreeKey()
    local body = HttpService:JSONEncode({
        key = KEY,
        place_id = tostring(game.PlaceId),
        hwid = getHWID(),
    })

    -- pakai request bawaan executor kalau ada (bisa POST + body),
    -- fallback ke PostAsync.
    if httpRequest then
        local res = httpRequest({
            Url = SERVER_URL .. "/freecheck",
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = body,
        })
        return res.StatusCode, res.Body
    else
        local ok, resp = pcall(function()
            return HttpService:PostAsync(
                SERVER_URL .. "/freecheck",
                body,
                Enum.HttpContentType.ApplicationJson
            )
        end)
        if ok then
            return 200, resp
        else
            return 0, tostring(resp)
        end
    end
end

local status, raw = checkFreeKey()

if status == 0 then
    notify("Low Hub Free", "Gagal menghubungi server. Cek HttpEnabled / URL.")
    return
end

local ok, data = pcall(function()
    return HttpService:JSONDecode(raw)
end)

if not ok or type(data) ~= "table" then
    notify("Low Hub Free", "Respons server tidak valid.")
    return
end

if data.ok and data.source then
    notify("Low Hub Free", "Key Free valid. Memuat script...")
    local fn, err = loadstring(data.source)
    if not fn then
        notify("Low Hub Free", "Gagal compile script: " .. tostring(err))
        return
    end
    fn()
else
    local reasonMap = {
        not_found = "Key Free tidak ditemukan. Ambil key lewat tombol Get Script Free di Discord.",
        revoked = "Key Free sudah dinonaktifkan.",
        expired = "Key Free sudah expired. Klaim key baru lewat tombol Get Script Free di Discord (gratis).",
        missing_key = "Key kosong. Ambil key lewat tombol Get Script Free di Discord.",
        not_free_key = "Key ini bukan key Free. Gunakan loader Premium.",
        place_not_allowed = "Script tidak diizinkan di game ini.",
        script_not_configured = "Server belum dikonfigurasi.",
        hwid_mismatch = "Key Free terkunci permanen ke device lain. Klaim key Free baru di Discord (gratis).",
        hwid_limit = "Key Free terkunci permanen ke 1 device. Klaim key Free baru di Discord (gratis).",
        rate_limited = "Terlalu banyak percobaan. Tunggu sebentar.",
    }
    local reason = reasonMap[data.error] or ("Ditolak: " .. tostring(data.error))
    notify("Low Hub Free", reason)
end
