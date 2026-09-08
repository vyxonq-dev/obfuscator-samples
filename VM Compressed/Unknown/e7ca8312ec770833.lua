-- Memuat Library Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Variabel Global
local Player = game.Players.LocalPlayer
local TrollMessage = "" 
local AntiKickEnabled = false
local NoclipActive = false
local FlyActive = false
local FlySpeed = 50

-- Tabel Terjemahan
local LangData = {
    ["EN"] = {
        MainTab = "Main",
        MoveTab = "Movement",
        CheckTab = "System Check",
        ExecIY = "Execute Infinity Yield",
        AntiK = "Anti-Kick Bypass",
        FlyTgl = "Fly Mode (Camera Based)",
        FlyS = "Fly Speed",
        Noc = "Noclip (Wall Hack)",
        InpM = "Input Ur Message",
        BtnT = "Troll Now!",
        Warn = "Action Denied: Turn off Anti-Kick first!",
        Empty = "Please input a message!"
    },
    ["ID"] = {
        MainTab = "Utama",
        MoveTab = "Pergerakan",
        CheckTab = "Cek Sistem Anti Kick",
        ExecIY = "Jalankan Infinity Yield",
        AntiK = "Bypass Anti-Kick",
        FlyTgl = "Mode Terbang (Ikut Kamera)",
        FlyS = "Kecepatan Terbang",
        Noc = "Noclip (Tembus Tembok)",
        InpM = "Masukan Pesan Anda",
        BtnT = "Troll Sekarang!",
        Warn = "Aksi Ditolak: Matikan Anti-Kick dulu!",
        Empty = "Mohon masukan pesan!"
    }
}

-- [ FUNGSI FLY BARU - BISA KE ATAS ]
local function ToggleFly()
    FlyActive = not FlyActive
    local Character = Player.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    local HRP = Character.HumanoidRootPart

    if FlyActive then
        local bg = Instance.new("BodyGyro", HRP)
        bg.Name = "XsatFlyGyro"
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = HRP.CFrame
        
        local bv = Instance.new("BodyVelocity", HRP)
        bv.Name = "XsatFlyVel"
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.velocity = Vector3.new(0, 0.1, 0)
        
        task.spawn(function()
            while FlyActive and task.wait() do
                local Hum = Character:FindFirstChildOfClass("Humanoid")
                if Hum and HRP then
                    -- BV mengikuti arah pandangan kamera (Bisa ke atas/bawah)
                    bv.velocity = workspace.CurrentCamera.CFrame.LookVector * (Hum.MoveDirection.Magnitude > 0 and FlySpeed or 0)
                    bg.cframe = workspace.CurrentCamera.CFrame
                end
            end
            if bg then bg:Destroy() end
            if bv then bv:Destroy() end
        end)
    end
end

-- [ HANDLER NOCLIP ]
game:GetService("RunService").Stepped:Connect(function()
    if NoclipActive and Player.Character then
        for _, v in pairs(Player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- [ FUNGSI MENU UTAMA ]
local function LaunchMainGui(SelectedLang)
    local L = LangData[SelectedLang]
    local Window = Rayfield:CreateWindow({
       Name = "Xsat-Bypass Hub",
       LoadingTitle = "Xsat Loading...",
       LoadingSubtitle = "Language: "..SelectedLang,
       ConfigurationSaving = {Enabled = false}
    })

    local MainTab = Window:CreateTab(L.MainTab, 4483362458)
    local MoveTab = Window:CreateTab(L.MoveTab, 4483362458)
    local TrollTab = Window:CreateTab(L.CheckTab, 4483362458)

    -- UTAMA
    MainTab:CreateButton({
       Name = L.ExecIY,
       Callback = function()
           loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
       end,
    })

    MainTab:CreateToggle({
       Name = L.AntiK,
       CurrentValue = false,
       Callback = function(V) 
           AntiKickEnabled = V 
           if V then
                local gmt = getrawmetatable(game)
                setreadonly(gmt, false)
                local old = gmt.__namecall
                gmt.__namecall = newcclosure(function(self, ...)
                    if AntiKickEnabled and (tostring(getnamecallmethod()):lower() == "kick") then return nil end
                    return old(self, ...)
                end)
                setreadonly(gmt, true)
           end
       end,
    })

    -- PERGERAKAN
    MoveTab:CreateToggle({
       Name = L.FlyTgl,
       CurrentValue = false,
       Callback = function(V) ToggleFly() end,
    })

    MoveTab:CreateSlider({
       Name = L.FlyS,
       Range = {10, 300},
       Increment = 10,
       CurrentValue = 50,
       Callback = function(V) FlySpeed = V end,
    })

    MoveTab:CreateToggle({
       Name = L.Noc,
       CurrentValue = false,
       Callback = function(V) NoclipActive = V end,
    })

    -- CEK SISTEM (TROLL)
    TrollTab:CreateInput({
       Name = L.InpM,
       PlaceholderText = "...",
       Callback = function(T) TrollMessage = T end,
    })

    TrollTab:CreateButton({
       Name = L.BtnT,
       Callback = function()
           if AntiKickEnabled then
               Rayfield:Notify({Title = "Error", Content = L.Warn, Duration = 3})
           elseif TrollMessage == "" then
               Rayfield:Notify({Title = "Error", Content = L.Empty, Duration = 3})
           else
               Player:Kick("\n[You]: " .. TrollMessage)
           end
       end,
    })
end

-- [ FUNGSI PEMILIH BAHASA DI AWAL ]
local function LanguageSelector()
    local SelectorWin = Rayfield:CreateWindow({
       Name = "Select Language / Pilih Bahasa",
       LoadingTitle = "Xsat Hub Startup",
       ConfigurationSaving = {Enabled = false}
    })

    local StartTab = SelectorWin:CreateTab("Start", 4483362458)

    StartTab:CreateButton({
       Name = "🇺🇸 English",
       Callback = function()
           Rayfield:Destroy()
           task.wait(0.5)
           Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
           LaunchMainGui("EN")
       end,
    })

    StartTab:CreateButton({
       Name = "🇮🇩 Indonesia",
       Callback = function()
           Rayfield:Destroy()
           task.wait(0.5)
           Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
           LaunchMainGui("ID")
       end,
    })
end

-- Jalankan Selector
LanguageSelector()
