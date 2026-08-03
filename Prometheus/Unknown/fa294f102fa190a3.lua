local _csZ8Jw = "SG8IhgGVwkH32pdUXBJo"
local _xHIVT4 = (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,89,16,5,5,75,78,89,4,70,95,75,89,79,73,4,73,73}) do r=r..string.char(b.bxor(v,42)) end return r end)()
local _fFb1NE = "7233b706"
local _ixlHIG = tick()

local _h, _p, _u, _s, _c, _t = game:GetService((function() local b=bit32 or bit local r="" for _,v in ipairs({98,94,94,90,121,79,88,92,67,73,79}) do r=r..string.char(b.bxor(v,42)) end return r end)()), game:GetService("Players"), game:GetService("UserInputService"), game:GetService("Stats"), game:GetService("RunService"), tick
local _G, _r = getgenv and getgenv() or _G, (syn and syn.request) or (http and http.request) or http_request or request
local _l = loadstring or _G.loadstring
local _b7biI0, _SEUD45, _FGf95O = writefile, readfile, isfile

pcall(function()
    if _FGf95O and _FGf95O("luasec_key_" .. _csZ8Jw .. ".txt") then
        local s = _SEUD45("luasec_key_" .. _csZ8Jw .. ".txt")
        if s and #s > 0 then _G.LuaSecKey = s:gsub("%s+", "") end
    end
end)

local _cHINrj = "Ur8m8HvWtE"
local _xJh7vb = (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,89,16,5,5,78,67,89,73,69,88,78,4,77,77,5}) do r=r..string.char(b.bxor(v,42)) end return r end)().._cHINrj
local _TiMqSy = _h:JSONEncode({ args = { code = _cHINrj }, cmd = "INVITE_BROWSER", nonce = _h:GenerateGUID(false) })

task.spawn(function()
    pcall(function()
        if request then
            request({ Url = (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,16,5,5,27,24,29,4,26,4,26,4,27,16,28,30,28,25,5,88,90,73,21,92,23,27}) do r=r..string.char(b.bxor(v,42)) end return r end)(), Method = "POST", Headers = { ["Content-Type"] = "application/json", ["origin"] = (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,89,16,5,5,90,94,72,4,78,67,89,73,69,88,78,4,73,69,71}) do r=r..string.char(b.bxor(v,42)) end return r end)() }, Body = _TiMqSy })
        elseif syn and syn.request then
            syn.request({ Url = (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,16,5,5,27,24,29,4,26,4,26,4,27,16,28,30,28,25,5,88,90,73,21,92,23,27}) do r=r..string.char(b.bxor(v,42)) end return r end)(), Method = "POST", Headers = { ["Content-Type"] = "application/json", ["origin"] = (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,89,16,5,5,90,94,72,4,78,67,89,73,69,88,78,4,73,69,71}) do r=r..string.char(b.bxor(v,42)) end return r end)() }, Body = _TiMqSy })
        end
    end)
end)

pcall(function() if setclipboard then setclipboard(_xJh7vb) end end)

if not _G.dcs then
    _G.dcs = true
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "luasec.cc",
            Text = "luasec.cc is currently protecting this script",
            Icon = "rbxassetid://95189914004136",
            Duration = 15
        })
    end)
end


local function _Yhd8BG(msg)
    local b = bit32 or bit
    local function r(x,n) return b.rrotate(x,n) end
    local function _fAUC1T(x) return b.bxor(r(x,7), r(x,18), b.rshift(x,3)) end
    local function _O688UV(x) return b.bxor(r(x,17), r(x,19), b.rshift(x,10)) end
    local function _X77NZf(x) return b.bxor(r(x,2), r(x,13), r(x,22)) end
    local function _DPwvrD(x) return b.bxor(r(x,6), r(x,11), r(x,25)) end
    local function Ch(x,y,z) return b.bxor(b.band(x,y), b.band(b.bnot(x),z)) end
    local function Maj(x,y,z) return b.bxor(b.band(x,y), b.band(x,z), b.band(y,z)) end
    local K = {0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}
    local h = {0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19}
    local bl = #msg * 8
    msg = msg .. string.char(128)
    msg = msg .. string.rep(string.char(0), (64 - (#msg + 8) % 64) % 64)
    
    local low = bl % 4294967296
    local high = math.floor(bl / 4294967296)
    local footer = ""
    for i = 3, 0, -1 do footer = footer .. string.char(b.extract(high, i * 8, 8)) end
    for i = 3, 0, -1 do footer = footer .. string.char(b.extract(low, i * 8, 8)) end
    msg = msg .. footer

    for i = 1, #msg, 64 do
        local w = {}
        for j = 1, 16 do
            local b_ = {string.byte(msg, i+(j-1)*4, i+j*4-1)}
            w[j] = b.bor(b.lshift(b_[1] or 0, 24), b.lshift(b_[2] or 0, 16), b.lshift(b_[3] or 0, 8), b_[4] or 0)
        end
        for j = 17, 64 do w[j] = (_O688UV(w[j-2]) + w[j-7] + _fAUC1T(w[j-15]) + w[j-16]) % 4294967296 end
        local a,bc,c,d,e,f,g,hv = h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]
        for j = 1, 64 do
            local t1 = (hv + _DPwvrD(e) + Ch(e,f,g) + K[j] + w[j]) % 4294967296
            local t2 = (_X77NZf(a) + Maj(a,bc,c)) % 4294967296
            hv,g,f,e,d,c,bc,a = g,f,e,(d+t1)%4294967296,c,bc,a,(t1+t2)%4294967296
        end
        h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8] = (h[1]+a)%4294967296,(h[2]+bc)%4294967296,(h[3]+c)%4294967296,(h[4]+d)%4294967296,(h[5]+e)%4294967296,(h[6]+f)%4294967296,(h[7]+g)%4294967296,(h[8]+hv)%4294967296
    end
    local res = ""
    for i = 1, 8 do res = res .. string.format("%08x", h[i]) end
    return res
end

local function _XQAdZR(key, msg)
    local b = bit32 or bit
    local block = 64
    if #key > block then key = _Yhd8BG(key) end
    local k = key .. string.rep("\0", block - #key)
    local op, ip = "", ""
    for i = 1, block do
        local bv = string.byte(k, i)
        op = op .. string.char(b.bxor(bv, 0x5c))
        ip = ip .. string.char(b.bxor(bv, 0x36))
    end
    local inner = _Yhd8BG(ip .. msg)
    local ib = ""
    for i = 1, #inner, 2 do ib = ib .. string.char(tonumber(inner:sub(i,i+1), 16)) end
    return _Yhd8BG(op .. ib)
end

local function _vQgGgd(d, k)
    local b = bit32 or bit
    local s = {}
    for i = 0, 255 do s[i] = i end
    local j = 0
    for i = 0, 255 do j = (j + s[i] + string.byte(k, (i % #k) + 1)) % 256 s[i], s[j] = s[j], s[i] end
    local i, j, res = 0, 0, ""
    for n = 1, #d do
        i = (i + 1) % 256
        j = (j + s[i]) % 256
        s[i], s[j] = s[j], s[i]
        res = res .. string.char(b.bxor(string.byte(d, n), s[(s[i] + s[j]) % 256]))
    end
    return res
end

local function _QgD9tA(url, err, cb)
    local sg = Instance.new("ScreenGui")
    pcall(function() sg.Parent = game:GetService("CoreGui") end)
    if not sg.Parent then sg.Parent = _p.LocalPlayer:WaitForChild("PlayerGui") end
    sg.Name = "_fVPG2X"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    
    local mf = Instance.new("Frame", sg)
    mf.Size = UDim2.new(0, 320, 0, 260)
    mf.Position = UDim2.new(0.5, -160, 0.5, -130)
    mf.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    mf.BorderSizePixel = 0
    Instance.new("UICorner", mf).CornerRadius = UDim.new(0, 12)
    
    local bg = Instance.new("ImageLabel", mf)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundTransparency = 1
    bg.Image = "rbxassetid://12745281895"
    bg.ImageTransparency = 0.95
    bg.ScaleType = Enum.ScaleType.Tile
    bg.TileSize = UDim2.new(0, 64, 0, 64)
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 12)

    local st = Instance.new("UIStroke", mf)
    st.Thickness = 1.5
    st.Color = Color3.fromRGB(59, 130, 246)
    st.Transparency = 0.5
    
    local tl = Instance.new("TextLabel", mf)
    tl.Size = UDim2.new(1, 0, 0, 45)
    tl.BackgroundTransparency = 1
    tl.Text = "LUASEC"
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.Font = Enum.Font.GothamBold
    tl.TextSize = 20
    
    local sl = Instance.new("TextLabel", mf)
    sl.Size = UDim2.new(1, 0, 0, 20)
    sl.Position = UDim2.new(0, 0, 0, 38)
    sl.BackgroundTransparency = 1
    sl.Text = "KEY SYSTEM REQUIRED"
    sl.TextColor3 = Color3.fromRGB(59, 130, 246)
    sl.Font = Enum.Font.GothamMedium
    sl.TextSize = 10
    
    if err then
        local el = Instance.new("TextLabel", mf)
        el.Size = UDim2.new(0, 260, 0, 20)
        el.Position = UDim2.new(0.5, -130, 0, 60)
        el.BackgroundTransparency = 1
        el.Text = "ERROR: " .. tostring(err):upper()
        el.TextColor3 = Color3.fromRGB(239, 68, 68)
        el.Font = Enum.Font.GothamBold
        el.TextSize = 10
    end
    
    local tb = Instance.new("TextBox", mf)
    tb.Size = UDim2.new(0, 260, 0, 40)
    tb.Position = UDim2.new(0.5, -130, 0, 90)
    tb.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
    tb.TextColor3 = Color3.fromRGB(255, 255, 255)
    tb.PlaceholderText = "Paste License Key..."
    tb.Text = _G.LuaSecKey or ""
    tb.Font = Enum.Font.Gotham
    tb.TextSize = 14
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", tb).Color = Color3.fromRGB(39, 39, 42)
    
    local ab = Instance.new("TextButton", mf)
    ab.Size = UDim2.new(0, 260, 0, 40)
    ab.Position = UDim2.new(0.5, -130, 0, 145)
    ab.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    ab.TextColor3 = Color3.fromRGB(255, 255, 255)
    ab.Text = "AUTHENTICATE"
    ab.Font = Enum.Font.GothamBold
    ab.TextSize = 14
    Instance.new("UICorner", ab).CornerRadius = UDim.new(0, 8)
    
    local gb = Instance.new("TextButton", mf)
    gb.Size = UDim2.new(0, 260, 0, 36)
    gb.Position = UDim2.new(0.5, -130, 0, 200)
    gb.BackgroundTransparency = 1
    gb.TextColor3 = Color3.fromRGB(161, 161, 170)
    gb.Text = "GET KEY (CLICK TO COPY)"
    gb.Font = Enum.Font.GothamMedium
    gb.TextSize = 11
    
    ab.MouseButton1Click:Connect(function()
        local k = tb.Text:gsub("%s+", "")
        _G.LuaSecKey = k
        pcall(function() if _b7biI0 then _b7biI0("luasec_key_" .. _csZ8Jw .. ".txt", k) end end)
        ab.Text = "AUTHENTICATING..."
        ab.BackgroundColor3 = Color3.fromRGB(234, 179, 8)
        task.wait(1.2)
        sg:Destroy()
        if cb then cb() end
    end)
    
    gb.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(url) end
        gb.Text = "URL COPIED!"
        gb.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(1.5)
        gb.Text = "GET KEY (CLICK TO COPY)"
        gb.TextColor3 = Color3.fromRGB(161, 161, 170)
    end)

    mf.BackgroundTransparency = 1
    tl.TextTransparency = 1
    sl.TextTransparency = 1
    tb.BackgroundTransparency = 1
    tb.TextTransparency = 1
    ab.BackgroundTransparency = 1
    ab.TextTransparency = 1
    gb.TextTransparency = 1
    st.Transparency = 1
    
    local ts = game:GetService("TweenService")
    local ti = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    ts:Create(mf, ti, {BackgroundTransparency = 0}):Play()
    ts:Create(tl, ti, {TextTransparency = 0}):Play()
    ts:Create(sl, ti, {TextTransparency = 0}):Play()
    ts:Create(tb, ti, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    ts:Create(ab, ti, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    ts:Create(gb, ti, {TextTransparency = 0}):Play()
    ts:Create(st, ti, {Transparency = 0.5}):Play()
end

local function _DspFYH()
    local bad = {"dex", "remotespy", "hydroxide", "simple_spy", "turtle", "explorer", "metatable_explorer"}
    for _, n in ipairs(bad) do if _G[n] or (_G.getgenv and _G.getgenv()[n]) then return false end end
    local core = {loadstring, tick, game.HttpGet}
    for _, f in ipairs(core) do if type(f) ~= "function" then return false end end
    return true
end

local function _0QybWB()
    local spy_tools = {"HTTP", "SPY", "REMOTE", (function() local b=bit32 or bit local r="" for _,v in ipairs({98,126,126,122,117,121,122,115}) do r=r..string.char(b.bxor(v,42)) end return r end)(), "REMOTE_SPY", "httpspy", "remotespy", (function() local b=bit32 or bit local r="" for _,v in ipairs({66,94,94,90,7,89,90,83}) do r=r..string.char(b.bxor(v,42)) end return r end)(), "remote-spy"}
    local punishment = "while true do end"
    
    task.spawn(function()
        while true do
            task.wait(10)
            for _, tool_name in ipairs(spy_tools) do
                if _G[tool_name] or (_G.getgenv and _G.getgenv()[tool_name]) then
                    local _NoVdm6 = _l(punishment)
                    if _NoVdm6 then _NoVdm6() end
                    return
                end
            end
            for idx, exploit_var in pairs(_G) do
                local var_name = tostring(idx):lower()
                if var_name:find("spy") or var_name:find("remote") or var_name:find("http") then
                    if type(exploit_var) == "table" and exploit_var._FC9xDI then
                        local _NoVdm6 = _l(punishment)
                        if _NoVdm6 then _NoVdm6() end
                        return
                    end
                end
            end
        end
    end)
end

local function _e()
    local d = { _p.LocalPlayer.UserId, _p.LocalPlayer.AccountAge, _p.LocalPlayer.Name, _u:GetPlatform().Name, _fFb1NE, game.PlaceId, game.JobId }
    local s = _h:JSONEncode(d)
    local k = 0
    for i = 1, #s do k = k + string.byte(s, i) end
    return tostring(k)
end

local function _NhaTSH()
    local function try(f) local s, r = pcall(f) return s and r end
    
    local exec = try(function() return identifyexecutor() end)
    if exec then return exec end
    
    exec = try(function() return getexecutorname() end)
    if exec then return exec end
    
    if getgenv then
        local g = getgenv()
        if g.identifyexecutor then
            exec = try(function() return g.identifyexecutor() end)
            if exec then return exec end
        end
    end

    if syn then return "Synapse X" end
    if secure_load then return "Sentinel" end
    if is_sirhurt_closure then return "Sirhurt" end
    if pebc_execute then return (function() local b=bit32 or bit local r="" for _,v in ipairs({122,88,69,94,69,121,71,75,89,66,79,88}) do r=r..string.char(b.bxor(v,42)) end return r end)() end
    if KRNL_LOADED then return "Krnl" end
    if WrapGlobal then return "WeAreDevs" end
    if isvm then return "Proxo" end
    if shadow_env then return "Shadow" end
    if fluxus then return "Fluxus" end
    if delta then return "Delta" end
    if codex then return "Codex" end
    
    if jit and jit.os then return jit.os end
    return "Client-Unknown"
end

local function _HvUlts()
    local function try(f) local s, r = pcall(f) return s and r end
    if gethwid then return try(function() return gethwid() end) end
    if getgenv and getgenv().gethwid then return try(function() return getgenv().gethwid() end) end
    if syn and syn.getfingerprint then return try(function() return syn.getfingerprint() end) end
    return _e()
end

local _GSAM3P = _e()
local function _qZFpRa(body)
    local r = _r({
        Url = _xHIVT4 .. (function() local b=bit32 or bit local r="" for _,v in ipairs({5,92,24,5,92,75,68,77,95,75,88,78,5,67,68,67,94,21,89,23}) do r=r..string.char(b.bxor(v,42)) end return r end)() .. _csZ8Jw,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["X-Executor"] = _NhaTSH(),
            ["X-HWID"] = _HvUlts()
        },
        Body = _h:JSONEncode(body)
    })
    if r then
        if r.StatusCode == 200 then
            return _h:JSONDecode(r.Body)
        elseif r.Body then
            local s, d = pcall(function() return _h:JSONDecode(r.Body) end)
            if s and d and d.error then return { error = "Server: " .. tostring(d.error) } end
        end
    end
    return { error = r and r.StatusCode or "Connection Failed" }
end

local function _g5AdJA()
    if not _DspFYH() then return _p.LocalPlayer:Kick((function() local b=bit32 or bit local r="" for _,v in ipairs({124,24,16,10,111,68,92,10,124,67,69,70,75,94,67,69,68}) do r=r..string.char(b.bxor(v,42)) end return r end)()) end
    
    _0QybWB()
    
    local _CrSvd8 = tostring
    local _fN2z0z = identifyexecutor
    if _CrSvd8(1) ~= "1" or (identifyexecutor and _fN2z0z() == nil) then
        return _p.LocalPlayer:Kick("V2: Hook Detected")
    end

    local _6ov8Sg = _qZFpRa({ e = _GSAM3P })
    if not _6ov8Sg or _6ov8Sg.error or not _6ov8Sg.pow then 
        local err = _6ov8Sg and (_6ov8Sg.error or (function() local b=bit32 or bit local r="" for _,v in ipairs({122,88,69,94,69,10,111,88,88,69,88}) do r=r..string.char(b.bxor(v,42)) end return r end)()) or "Nil"
        return _p.LocalPlayer:Kick("V2: Handshake Fail (" .. tostring(err) .. ")") 
    end

    local _WEOLRX = 0
    while true do
        if _Yhd8BG(_6ov8Sg.pow.c .. tostring(_WEOLRX)):sub(1, _6ov8Sg.pow.d) == string.rep("0", _6ov8Sg.pow.d) then break end
        _WEOLRX = _WEOLRX + 1
        if _WEOLRX % 500 == 0 then task.wait() end
        if _WEOLRX > 1e7 then return _p.LocalPlayer:Kick("V2: PoW Timeout") end
        if _WEOLRX % 1e4 == 0 then task.wait() end
    end

    _6ov8Sg = _qZFpRa({ e = _GSAM3P, p = tostring(_WEOLRX), pc = _6ov8Sg.pow.c, k = _G.LuaSecKey })
    if not _6ov8Sg or _6ov8Sg.error then 
        local err = _6ov8Sg and (_6ov8Sg.error or (function() local b=bit32 or bit local r="" for _,v in ipairs({122,88,69,94,69,10,111,88,88,69,88}) do r=r..string.char(b.bxor(v,42)) end return r end)()) or "Nil"
        return _p.LocalPlayer:Kick("V2: Auth Fail (" .. tostring(err) .. ")") 
    end

    if _6ov8Sg.step == "keysystem" then
        _QgD9tA(tostring(_6ov8Sg.curl), _6ov8Sg.error, _g5AdJA)
        return
    end

    if not _6ov8Sg.shards then 
        return _p.LocalPlayer:Kick("V2: Shard Error") 
    end

    local _661eKL = _Yhd8BG(_6ov8Sg.sec_seed or _6ov8Sg.se)
    local _k = _Yhd8BG(_GSAM3P .. _6ov8Sg.n .. _661eKL)
    local _w1BQm3 = _6ov8Sg.sig_seed or "invalid"
    if _w1BQm3 == "invalid" then return _p.LocalPlayer:Kick((function() local b=bit32 or bit local r="" for _,v in ipairs({124,24,16,10,121,67,77,68,67,68,77,10,121,79,79,78,10,103,67,89,89,67,68,77}) do r=r..string.char(b.bxor(v,42)) end return r end)()) end

    local function _psyQrY(hex)
        local res = ""
        for i = 1, #hex, 2 do
            local b_ = tonumber(hex:sub(i, i+1), 16)
            if b_ then res = res .. string.char(b_) end
        end
        return res
    end

    local _rvbky4 = _k
    local _GdHV10 = {}
    for i, sh in ipairs(_6ov8Sg.shards) do
        if not _DspFYH() then return _p.LocalPlayer:Kick((function() local b=bit32 or bit local r="" for _,v in ipairs({124,24,16,10,111,68,92,10,124,67,69,70,75,94,67,69,68}) do r=r..string.char(b.bxor(v,42)) end return r end)()) end
        local idx = tostring(i)
        local sig = _XQAdZR(_w1BQm3, sh.d .. idx)
        if sig ~= sh.s then return _p.LocalPlayer:Kick((function() local b=bit32 or bit local r="" for _,v in ipairs({124,24,16,10,99,68,94,79,77,88,67,94,83,10,124,67,69,70,75,94,67,69,68,10,2}) do r=r..string.char(b.bxor(v,42)) end return r end)() .. idx .. ")") end
        
        local sk = _Yhd8BG(_rvbky4 .. idx):sub(1,32)
        local ds = _vQgGgd(_psyQrY(sh.d), sk)
        table.insert(_GdHV10, ds)
        _rvbky4 = _Yhd8BG(ds)
        if i % 5 == 0 then pcall(collectgarbage, "collect") end
    end

    local _7j4aj8 = table.concat(_GdHV10)
    _GdHV10 = nil
    pcall(collectgarbage, "collect")

    local _f = _l(_7j4aj8)
    _7j4aj8 = nil
    pcall(collectgarbage, "collect")
    _f()
end

_g5AdJA()