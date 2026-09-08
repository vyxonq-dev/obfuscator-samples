local a = game:GetService("Players")
local b = game:GetService("TweenService")
local c = a.LocalPlayer
local d = Instance.new("ScreenGui")
d.Name = "LightHubKeySystem"
d.IgnoreGuiInset = true
d.ResetOnSpawn = false
d.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
d.Parent = c:WaitForChild("PlayerGui")
local function e(f, g, h, i, j)
    return b:Create(f, TweenInfo.new(g, h, i), j)
end
local function k(l, m, n)
    local o = Instance.new("Frame")
    o.Parent = d
    o.AnchorPoint = Vector2.new(1, 1)
    o.Position = UDim2.new(1, -20, 1, -20)
    o.Size = UDim2.fromOffset(280, 70)
    o.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    o.BackgroundTransparency = 0.25
    o.BorderSizePixel = 0
    local p = Instance.new("UICorner", o)
    p.CornerRadius = UDim.new(0, 10)
    local q = Instance.new("UIStroke", o)
    q.Color = Color3.fromRGB(255, 60, 60)
    q.Thickness = 1.3
    q.Transparency = 0.6
    local g = Instance.new("TextLabel", o)
    g.BackgroundTransparency = 1
    g.Position = UDim2.new(0, 10, 0, 6)
    g.Size = UDim2.new(1, -20, 0, 22)
    g.Font = Enum.Font.GothamBold
    g.TextColor3 = Color3.new(1, 1, 1)
    g.TextXAlignment = Enum.TextXAlignment.Left
    g.TextSize = 16
    g.Text = l
    local r = Instance.new("TextLabel", o)
    r.BackgroundTransparency = 1
    r.Position = UDim2.new(0, 10, 0, 30)
    r.Size = UDim2.new(1, -20, 0, 30)
    r.Font = Enum.Font.Gotham
    r.TextColor3 = Color3.fromRGB(220, 220, 220)
    r.TextXAlignment = Enum.TextXAlignment.Left
    r.TextWrapped = true
    r.TextSize = 14
    r.Text = m
    for s, f in ipairs(d:GetChildren()) do
        if f:IsA("Frame") and f ~= o and f.Name == "" then
            e(
                f,
                0.3,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out,
                {Position = f.Position - UDim2.fromOffset(0, 80)}
            ):Play()
        end
    end
    o.Name = ""
    e(o, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, {BackgroundTransparency = 0.25}):Play()
    task.delay(
        n or 3,
        function()
            e(o, 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, {BackgroundTransparency = 1}):Play()
            e(q, 0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, {Transparency = 1}):Play()
            task.wait(0.4)
            o:Destroy()
        end
    )
end
local r = Instance.new("ScreenGui", c.PlayerGui)
r.Name = "lighthubkeysys"
r.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
r.ResetOnSpawn = false
local t = Instance.new("Frame", r)
t.AnchorPoint = Vector2.new(0.5, 0.5)
t.Position = UDim2.fromScale(0.5, 0.5)
t.Size = UDim2.fromScale(0.85, 0.9)
t.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
t.BackgroundTransparency = 0.25
local u = Instance.new("UICorner", t)
u.CornerRadius = UDim.new(0, 15)
local v = Instance.new("UIStroke", t)
v.Color = Color3.fromRGB(255, 60, 60)
v.Thickness = 1.5
v.Transparency = 0.7
local l = Instance.new("TextLabel", t)
l.Text = "[Light Hub] Key System"
l.Font = Enum.Font.GothamBold
l.TextColor3 = Color3.new(1, 1, 1)
l.TextSize = 18
l.BackgroundTransparency = 1
l.Position = UDim2.fromOffset(10, 85)
l.Size = UDim2.new(1, -20, 0, 20)
local w = Instance.new("TextBox", t)
w.AnchorPoint = Vector2.new(0, 1)
w.Position = UDim2.new(0, 25, 1, -137)
w.Size = UDim2.new(1, -50, 0, 50)
w.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
w.TextColor3 = Color3.fromRGB(230, 230, 230)
w.Font = Enum.Font.Code
w.TextSize = 16
w.PlaceholderText = "Insert the Key Here!"
w.Text = ""
Instance.new("UICorner", w).CornerRadius = UDim.new(0, 5)
local function x(y, z, A)
    local B = Instance.new("TextButton", t)
    B.AnchorPoint = Vector2.new(0.5, 1)
    B.Position = z
    B.Size = UDim2.fromOffset(120, 40)
    B.BackgroundColor3 = y
    B.BorderSizePixel = 0
    B.Font = Enum.Font.GothamBold
    B.Text = A
    B.TextColor3 = Color3.new(1, 1, 1)
    B.TextSize = 16
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 6)
    local q = Instance.new("UIStroke", B)
    q.Color = Color3.fromRGB(255, 255, 255)
    q.Thickness = 1.2
    q.Transparency = 0.85
    return B
end
local C = x(Color3.fromRGB(195, 57, 57), UDim2.new(0.5, -125, 1, -76), "Get Key")
C.BackgroundTransparency = 0.5
local D = x(Color3.fromRGB(195, 57, 57), UDim2.new(0.5, 0, 1, -76), "Check Key")
local E = x(Color3.fromRGB(38, 38, 38), UDim2.new(0.5, 125, 1, -76), "Join Discord")
local F = Instance.new("Frame", r)
F.AnchorPoint = Vector2.new(0.5, 0.5)
F.Position = UDim2.fromScale(0.5, 0.5)
F.Size = UDim2.fromOffset(280, 160)
F.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
F.BackgroundTransparency = 0.3
F.Visible = false
Instance.new("UICorner", F).CornerRadius = UDim.new(0, 12)
local G = Instance.new("UIStroke", F)
G.Color = Color3.fromRGB(255, 60, 60)
G.Transparency = 0.6
local H = Instance.new("TextLabel", F)
H.BackgroundTransparency = 1
H.Text = "Select Key Provider"
H.Font = Enum.Font.GothamBold
H.TextColor3 = Color3.new(1, 1, 1)
H.TextSize = 18
H.Size = UDim2.new(1, 0, 0, 40)
H.Position = UDim2.fromOffset(0, 10)
local I = x(Color3.fromRGB(195, 57, 57), UDim2.new(0.5, -70, 1, -60), "LootLabs")
I.Parent = F
local J = x(Color3.fromRGB(195, 57, 57), UDim2.new(0.5, 70, 1, -60), "Linkvertise")
J.Parent = F
local function K(L, M)
    local N = L.Text
    L.Text = M
    task.wait(3)
    L.Text = N
end
C.MouseButton1Click:Connect(
    function()
        F.Visible = true
        e(F, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, {BackgroundTransparency = 0.25}):Play()
    end
)
I.MouseButton1Click:Connect(
    function()
        setclipboard("https://ads.luarmor.net/get_key?for=-lhNoDVMxVBZB")
        F.Visible = false
        K(C, "Copied!")
    end
)
J.MouseButton1Click:Connect(
    function()
        setclipboard("https://ads.luarmor.net/get_key?for=Light_Hub-hjhJoieYQkOu")
        F.Visible = false
        K(C, "Copied!")
    end
)
E.MouseButton1Click:Connect(
    function()
        setclipboard("https://discord.gg/Z5TBEsec5W")
        K(E, "Copied!")
    end
)
makefolder("Light Hub")
local O = "Light Hub/Key.txt"
local P = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()
P.script_id = "53bfeeeca30266553e39e7e2a522336c"
local Q = {
    [8795154789] = "https://api.luarmor.net/files/v3/loaders/89f9ee23e08f679c342cdae120d5338b.lua", -- flick
    [7326934954] = "https://api.luarmor.net/files/v3/loaders/53bfeeeca30266553e39e7e2a522336c.lua", -- 99 nights
    [994732206] = "https://api.luarmor.net/files/v3/loaders/e4fff66beaee1c5d6c7b75d5df327cc6.lua", -- blox fruits
    [8316902627] = "https://api.luarmor.net/files/v3/loaders/f020a6c36f648cab3f8cee0eebdd3930.lua", -- plants vs brainrots
    [6331902150] = "https://api.luarmor.net/files/v3/loaders/986f8c7d1a33f1040d7a3cdc02d5504b.lua", -- forsaken
    [6701277882] = "https://api.luarmor.net/files/v3/loaders/327c631d3c9431275e836232deae5c95.lua", -- fish it
    [7709344486] = "https://api.luarmor.net/files/v3/loaders/152436098dce50a55092dc524c4d485a.lua", -- steal a brainrot
    [66654135] = "https://api.luarmor.net/files/v3/loaders/0cb08504db4379defa3e11f598619b2b.lua", -- murder mystery 2
    [7671049560] = "https://api.luarmor.net/files/v3/loaders/355de71eff2440ed6fb18ca24f7919bd.lua" -- forge
}
local function R(S)
    local T = P.check_key(S)
    if T.code == "KEY_VALID" then
        script_key = S
        writefile(O, S)
        k("Success", "Key verified successfully!", 3)
        task.wait(0.5)
        r:Destroy()
        if Q[game.GameId] then
            loadstring(game:HttpGet(Q[game.GameId]))()
        elseif game.PlaceId == 96342491571673 or game.PlaceId == 109983668079237 then
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/152436098dce50a55092dc524c4d485a.lua"))()
        else
            c:Kick("Game not supported.")
        end
    elseif T.code:find("KEY_") then
        k("Invalid Key", "The saved/provided key is invalid or expired.", 3)
    else
        k("Key Check Failed", T.message or "Unknown error.", 3)
    end
end
D.MouseButton1Click:Connect(
    function()
        local U = w.Text
        if U == "" then
            k("Missing Key", "Please enter a key before verifying.", 3)
        else
            k("Verifying Key", "Checking key validity...", 2)
            task.spawn(
                function()
                    R(U)
                end
            )
        end
    end
)
if isfile(O) then
    local V = readfile(O)
    if V and V ~= "" then
        task.spawn(
            function()
                R(V)
            end
        )
    end
end
