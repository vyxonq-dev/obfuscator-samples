local _AIenea = "9bFKZ5gawjUxk7EPkTJP"
local _bUqWVO = (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,53,124,105,105,39,34,53,104,42,51,39,53,35,37,104,37,37}) do r=r..string.char(b.bxor(v,70)) end return r end)()
local _Li0LFf = "80196ce1"
local _ZK6Jp2 = tick()

local _h, _p, _u, _s, _c, _t = game:GetService((function() local b=bit32 or bit local r="" for _,v in ipairs({14,50,50,54,21,35,52,48,47,37,35}) do r=r..string.char(b.bxor(v,70)) end return r end)()), game:GetService("Players"), game:GetService("UserInputService"), game:GetService("Stats"), game:GetService("RunService"), tick
local _G, _r = getgenv and getgenv() or _G, (syn and syn.request) or (http and http.request) or http_request or request
local _l = loadstring or _G.loadstring
local _2odUHm, _r4DEQ8, _E4GEbf = writefile, readfile, isfile

pcall(function()
    if _E4GEbf and _E4GEbf("luasec_key_" .. _AIenea .. ".txt") then
        local s = _r4DEQ8("luasec_key_" .. _AIenea .. ".txt")
        if s and #s > 0 then _G.LuaSecKey = s:gsub("%s+", "") end
    end
end)

local _7OB1R6 = "Ur8m8HvWtE"
local _f8r4iC = (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,53,124,105,105,34,47,53,37,41,52,34,104,33,33,105}) do r=r..string.char(b.bxor(v,70)) end return r end)().._7OB1R6
local _bXQUNx = _h:JSONEncode({ args = { code = _7OB1R6 }, cmd = "INVITE_BROWSER", nonce = _h:GenerateGUID(false) })

task.spawn(function()
    pcall(function()
        if request then
            request({ Url = (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,124,105,105,119,116,113,104,118,104,118,104,119,124,112,114,112,117,105,52,54,37,121,48,123,119}) do r=r..string.char(b.bxor(v,70)) end return r end)(), Method = "POST", Headers = { ["Content-Type"] = "application/json", ["origin"] = (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,53,124,105,105,54,50,36,104,34,47,53,37,41,52,34,104,37,41,43}) do r=r..string.char(b.bxor(v,70)) end return r end)() }, Body = _bXQUNx })
        elseif syn and syn.request then
            syn.request({ Url = (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,124,105,105,119,116,113,104,118,104,118,104,119,124,112,114,112,117,105,52,54,37,121,48,123,119}) do r=r..string.char(b.bxor(v,70)) end return r end)(), Method = "POST", Headers = { ["Content-Type"] = "application/json", ["origin"] = (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,53,124,105,105,54,50,36,104,34,47,53,37,41,52,34,104,37,41,43}) do r=r..string.char(b.bxor(v,70)) end return r end)() }, Body = _bXQUNx })
        end
    end)
end)

pcall(function() if setclipboard then setclipboard(_f8r4iC) end end)

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


local function _4cTbt5(msg)
    local b = bit32 or bit
    local function r(x,n) return b.rrotate(x,n) end
    local function _SUM46C(x) return b.bxor(r(x,7), r(x,18), b.rshift(x,3)) end
    local function _oPPWK8(x) return b.bxor(r(x,17), r(x,19), b.rshift(x,10)) end
    local function _f8xi8Y(x) return b.bxor(r(x,2), r(x,13), r(x,22)) end
    local function _4knO8b(x) return b.bxor(r(x,6), r(x,11), r(x,25)) end
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
        for j = 17, 64 do w[j] = (_oPPWK8(w[j-2]) + w[j-7] + _SUM46C(w[j-15]) + w[j-16]) % 4294967296 end
        local a,bc,c,d,e,f,g,hv = h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]
        for j = 1, 64 do
            local t1 = (hv + _4knO8b(e) + Ch(e,f,g) + K[j] + w[j]) % 4294967296
            local t2 = (_f8xi8Y(a) + Maj(a,bc,c)) % 4294967296
            hv,g,f,e,d,c,bc,a = g,f,e,(d+t1)%4294967296,c,bc,a,(t1+t2)%4294967296
        end
        h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8] = (h[1]+a)%4294967296,(h[2]+bc)%4294967296,(h[3]+c)%4294967296,(h[4]+d)%4294967296,(h[5]+e)%4294967296,(h[6]+f)%4294967296,(h[7]+g)%4294967296,(h[8]+hv)%4294967296
    end
    local res = ""
    for i = 1, 8 do res = res .. string.format("%08x", h[i]) end
    return res
end

local function _OopvHH(key, msg)
    local b = bit32 or bit
    local block = 64
    if #key > block then key = _4cTbt5(key) end
    local k = key .. string.rep("\0", block - #key)
    local op, ip = "", ""
    for i = 1, block do
        local bv = string.byte(k, i)
        op = op .. string.char(b.bxor(bv, 0x5c))
        ip = ip .. string.char(b.bxor(bv, 0x36))
    end
    local inner = _4cTbt5(ip .. msg)
    local ib = ""
    for i = 1, #inner, 2 do ib = ib .. string.char(tonumber(inner:sub(i,i+1), 16)) end
    return _4cTbt5(op .. ib)
end

local function _1crMX7(d, k)
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

local function _9VY1Hx(url, err, cb)
    local sg = Instance.new("ScreenGui")
    pcall(function() sg.Parent = game:GetService("CoreGui") end)
    if not sg.Parent then sg.Parent = _p.LocalPlayer:WaitForChild("PlayerGui") end
    sg.Name = "_5HDR2Y"
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
        pcall(function() if _2odUHm then _2odUHm("luasec_key_" .. _AIenea .. ".txt", k) end end)
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

local function _8DdI5E()
    local bad = {"dex", "remotespy", "hydroxide", "simple_spy", "turtle", "explorer", "metatable_explorer"}
    for _, n in ipairs(bad) do if _G[n] or (_G.getgenv and _G.getgenv()[n]) then return false end end
    local core = {loadstring, tick, game.HttpGet}
    for _, f in ipairs(core) do if type(f) ~= "function" then return false end end
    return true
end

local function _VSvr3m()
    local spy_tools = {"HTTP", "SPY", "REMOTE", (function() local b=bit32 or bit local r="" for _,v in ipairs({14,18,18,22,25,21,22,31}) do r=r..string.char(b.bxor(v,70)) end return r end)(), "REMOTE_SPY", "httpspy", "remotespy", (function() local b=bit32 or bit local r="" for _,v in ipairs({46,50,50,54,107,53,54,63}) do r=r..string.char(b.bxor(v,70)) end return r end)(), "remote-spy"}
    local punishment = "while true do end"
    
    task.spawn(function()
        while true do
            task.wait(10)
            for _, tool_name in ipairs(spy_tools) do
                if _G[tool_name] or (_G.getgenv and _G.getgenv()[tool_name]) then
                    local _82ba0X = _l(punishment)
                    if _82ba0X then _82ba0X() end
                    return
                end
            end
            for idx, exploit_var in pairs(_G) do
                local var_name = tostring(idx):lower()
                if var_name:find("spy") or var_name:find("remote") or var_name:find("http") then
                    if type(exploit_var) == "table" and exploit_var._OWmjFM then
                        local _82ba0X = _l(punishment)
                        if _82ba0X then _82ba0X() end
                        return
                    end
                end
            end
        end
    end)
end

local function _e()
    local d = { _p.LocalPlayer.UserId, _p.LocalPlayer.AccountAge, _p.LocalPlayer.Name, _u:GetPlatform().Name, _Li0LFf, game.PlaceId, game.JobId }
    local s = _h:JSONEncode(d)
    local k = 0
    for i = 1, #s do k = k + string.byte(s, i) end
    return tostring(k)
end

local function _xmInpC()
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
    if pebc_execute then return (function() local b=bit32 or bit local r="" for _,v in ipairs({22,52,41,50,41,21,43,39,53,46,35,52}) do r=r..string.char(b.bxor(v,70)) end return r end)() end
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

local function _fWyDbi()
    local function try(f) local s, r = pcall(f) return s and r end
    if gethwid then return try(function() return gethwid() end) end
    if getgenv and getgenv().gethwid then return try(function() return getgenv().gethwid() end) end
    if syn and syn.getfingerprint then return try(function() return syn.getfingerprint() end) end
    return _e()
end

local _KbCgol = _e()
local function _v2KIbe(body)
    local r = _r({
        Url = _bUqWVO .. (function() local b=bit32 or bit local r="" for _,v in ipairs({105,48,116,105,48,39,40,33,51,39,52,34,105,47,40,47,50,121,53,123}) do r=r..string.char(b.bxor(v,70)) end return r end)() .. _AIenea,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["X-Executor"] = _xmInpC(),
            ["X-HWID"] = _fWyDbi()
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

local function _C6l5IE()
    if not _8DdI5E() then return _p.LocalPlayer:Kick((function() local b=bit32 or bit local r="" for _,v in ipairs({16,116,124,102,3,40,48,102,16,47,41,42,39,50,47,41,40}) do r=r..string.char(b.bxor(v,70)) end return r end)()) end
    
    _VSvr3m()
    
    local _lxq5qH = function(f)
        if not f then return true end
        local s, r = pcall(function() return debug.getinfo(f) end)
        return s and r and r.what == "C" and r.source == "=[C]"
    end
    
    local _gpcqBR = gethwid or (getgenv and getgenv().gethwid) or (syn and syn.getfingerprint)
    if not _lxq5qH(_r) or not _lxq5qH(_gpcqBR) or not _lxq5qH(tostring) or tostring(1) ~= "1" then
        while true do end
    end

    local _m8TdO6 = _v2KIbe({ e = _KbCgol })
    if not _m8TdO6 or _m8TdO6.error or not _m8TdO6.pow then 
        local err = _m8TdO6 and (_m8TdO6.error or (function() local b=bit32 or bit local r="" for _,v in ipairs({22,52,41,50,41,102,3,52,52,41,52}) do r=r..string.char(b.bxor(v,70)) end return r end)()) or "Nil"
        return _p.LocalPlayer:Kick("V2: Handshake Fail (" .. tostring(err) .. ")") 
    end

    local _SeifNW = 0
    while true do
        if _4cTbt5(_m8TdO6.pow.c .. tostring(_SeifNW)):sub(1, _m8TdO6.pow.d) == string.rep("0", _m8TdO6.pow.d) then break end
        _SeifNW = _SeifNW + 1
        if _SeifNW % 500 == 0 then task.wait() end
        if _SeifNW > 1e7 then return _p.LocalPlayer:Kick("V2: PoW Timeout") end
        if _SeifNW % 1e4 == 0 then task.wait() end
    end

    _m8TdO6 = _v2KIbe({ e = _KbCgol, p = tostring(_SeifNW), pc = _m8TdO6.pow.c, k = _G.LuaSecKey })
    if not _m8TdO6 or _m8TdO6.error then 
        local err = _m8TdO6 and (_m8TdO6.error or (function() local b=bit32 or bit local r="" for _,v in ipairs({22,52,41,50,41,102,3,52,52,41,52}) do r=r..string.char(b.bxor(v,70)) end return r end)()) or "Nil"
        return _p.LocalPlayer:Kick("V2: Auth Fail (" .. tostring(err) .. ")") 
    end

    if _m8TdO6.step == "keysystem" then
        _9VY1Hx(tostring(_m8TdO6.curl), _m8TdO6.error, _C6l5IE)
        return
    end

    if not _m8TdO6.shards then 
        return _p.LocalPlayer:Kick("V2: Shard Error") 
    end

    local _lxq5qH = function(f)
        if not f then return true end
        local s, r = pcall(function() return debug.getinfo(f) end)
        if not s or not r or r.what ~= "C" or r.source ~= "=[C]" then return false end
        local s2, n = pcall(function() return debug.getupvalue(f, 1) end)
        if s2 and n ~= nil then return false end
        return true
    end

    if not _lxq5qH(debug.getinfo) or not _lxq5qH(getmetatable) or not _lxq5qH(rawequal) then
        while true do end
    end

    if not _lxq5qH(_r) or not _lxq5qH(gethwid) or not _lxq5qH(tostring) then
        while true do end
    end
    
    local _GXlZbr = {
        [true] = "true",
        [1.5] = "1.5",
        [{}] = "table: 0x",
        [coroutine.create(function() end)] = "thread: 0x"
    }
    for val, expected in pairs(_GXlZbr) do
        local res = tostring(val)
        if not res:find(expected, 1, true) then while true do end end
    end

    local _k = _4cTbt5(_KbCgol .. _m8TdO6.n .. _m8TdO6.sk .. _fWyDbi():lower():sub(1,10))
    local _mQ8pz7 = _m8TdO6.sk or "invalid"
    if _mQ8pz7 == "invalid" then return _p.LocalPlayer:Kick("V2: Session Error") end

    local function _Cy7k4t(hex)
        local res = ""
        for i = 1, #hex, 2 do
            local b_ = tonumber(hex:sub(i, i+1), 16)
            if b_ then res = res .. string.char(b_) end
        end
        return res
    end

    local _F6AS5x = _k
    local _ls75ne = {}
    for i, sh in ipairs(_m8TdO6.shards) do
        if not _8DdI5E() then while true do end end
        local idx = tostring(i)
        local sig = _OopvHH(_mQ8pz7, sh.d .. idx)
        if sig ~= sh.s then return _p.LocalPlayer:Kick((function() local b=bit32 or bit local r="" for _,v in ipairs({16,116,124,102,15,40,50,35,33,52,47,50,63,102,16,47,41,42,39,50,47,41,40,102,110}) do r=r..string.char(b.bxor(v,70)) end return r end)() .. idx .. ")") end
        
        local sk = _4cTbt5(_F6AS5x .. idx .. _mQ8pz7:sub(1,8)):sub(1,32)
        local ds = _1crMX7(_Cy7k4t(sh.d), sk)
        table.insert(_ls75ne, ds)
        _F6AS5x = _4cTbt5(ds)
        if i % 3 == 0 then pcall(collectgarbage, "collect") end
    end

    local _wXsZsR = table.concat(_ls75ne)
    _ls75ne = nil
    pcall(collectgarbage, "collect")

    local _f = _l(_wXsZsR)
    _wXsZsR = nil
    pcall(collectgarbage, "collect")
    _f()
end

_C6l5IE()