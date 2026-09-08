loadstring(game:HttpGet("https://raw.githubusercontent.com/Bovanlaarhoven/Primordial/main/src/utils/bypass.lua"))()

local Players        = game:GetService('Players')
local RunService     = game:GetService('RunService')
local Workspace      = game:GetService('Workspace')
local Storage        = game:GetService('ReplicatedStorage')
local InputService   = game:GetService('UserInputService')
local ping           = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
local Remote         = Storage:FindFirstChild('MainEvent')
local Fov            = Drawing.new("Circle")
local Tracer         = Drawing.new("Line")
local Client         = Players.LocalPlayer
local Camera         = Workspace.CurrentCamera
local Shop           = workspace.Ignored.Shop
local backpack       = Client.Backpack
local Desync         = {OldPos = nil, newPos = nil}
local CurrentPing    = {ping = 0}
local HitBones       = {}

for _, v in pairs(Client.Character:GetChildren()) do if v:IsA("BasePart") then table.insert(HitBones, v.Name) end end
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Primordial',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Legit = Window:AddTab('Legit'),
    Rage = Window:AddTab('Rage'),
    Visual = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Silent = Tabs.Legit:AddLeftGroupbox('Aim')
local Predication = Tabs.Legit:AddRightGroupbox('Predication')
local AntiAim = Tabs.Rage:AddLeftGroupbox('AntiAim')
local VisualsTab = Tabs.Visual:AddLeftGroupbox('Visuals')
local AutoShop = Tabs.Misc:AddLeftGroupbox('AutoShop')

local Guns = {
    ["Glock"] = {
        Gun = "[Glock] - $318",
        Ammo = "30 [Glock Ammo] - $64"
    },
    ["Silencer"] = {
        Gun = "[Silencer] - $424",
        Ammo = "25 [Silencer Ammo] - $53"
    },
    ["Revolver"] = {
        Gun = "[Revolver] - $1379",
        Ammo = "12 [Revolver Ammo] - $80"
    },
    ["TacticalShotgun"] = {
        Gun = "[TacticalShotgun] - $1857",
        Ammo = "20 [TacticalShotgun Ammo] - $64"
    },
    ["Shotgun"] = {
        Gun = "[Shotgun] - $1326",
        Ammo = "20 [Shotgun Ammo] - $64"
    },
    ["Double-Barrel SG"] = {
        Gun = "[Double-Barrel SG] - $1432",
        Ammo = "18 [Double-Barrel SG Ammo] - $53"
    },
    ["SMG"] = {
        Gun = "[SMG] - $796",
        Ammo = "80 [SMG Ammo] - $64"
    },
    ["P90"] = {
        Gun = "[P90] - $1061",
        Ammo = "120 [P90 Ammo] - $64"
    },
    ["DrumGun"] = {
        Gun = "[DrumGun] - $3183",
        Ammo = "100 [DrumGun Ammo] - $212"
    },
    ["LMG"] = {
        Gun = "[LMG] - $3978",
        Ammo = "200 [LMG Ammo] - $318"
    },
    ["AUG"] = {
        Gun = "[AUG] - $2069",
        Ammo = "90 [AUG Ammo] - $85"
    },
    ["AR"] = {
        Gun = "[AR] - $1061",
        Ammo = "100 [AR Ammo] - $80"
    },
    ["AK47"] = {
        Gun = "[AK47] - $2387",
        Ammo = "90 [AK47 Ammo] - $85"
    },
    ["SilencerAR"] = {
        Gun = "[SilencerAR] - $1326",
        Ammo = "25 [Silencer Ammo] - $53"
    },
    ["Flamethrower"] = {
        Gun = "[Flamethrower] - $15914",
        Ammo = "140 [Flamethrower Ammo] - $1644"
    },
    ["GrenadeLauncher"] = {
        Gun = "[GrenadeLauncher] - $10609",
        Ammo = "12 [GrenadeLauncher Ammo] - $3183"
    },
    ["RPG"] = {
        Gun = "[RPG] - $6365",
        Ammo = "5 [RPG Ammo] - $1061"
    }
}

local Visuals = {
    Fov = {
        Enabled = false,
        Color = Color3.fromRGB(255, 255, 255),
    },
    Tracer = {
        Enabled = false,
        Color = Color3.fromRGB(255, 255, 255),
    },
}

local Settings = {
    Version = '1.2.0 | public',
    SilentAim = {
        Enabled = false,
        HitBone = 'Head',
        AimMethod = {'ClosestToMouse', 'ClosestToPlayer'},
        Fov = 100,
        Check = {'Visible', 'ForceField', 'Grabbed', "Knocked"}
    },
    Camlock = {
        Enabled = false,
        smoothing = 1,
    },
    Prediction = {
        Enabled = false,
        AutoPrediction = false,
        Prediction = 13.4,
        Resolver = false,
        ResolveMethod = {"Custom Prediction", "Velocity", "HumanoidMoveDirection"}
    },
    Desync = {
        Enabled = false,
        DesyncMode = {"Static", "Dynamic", "Jitter", "Spin"},
        Range = 1,
        X = {Min = -180, Max = 180},
        Y = {Min = -180, Max = 180},
        Z = {Min = -180, Max = 180}
    },
    AutoBuy = {
        Enabled = false,
        Weapons = { "Glock","SMG","Silencer","TacticalShotgun","P90","AUG","Shotgun","RPG","AR","Double-Barrel SG","Flamethrower","Revolver","LMG","AK47","DrumGun","Silencer","GrenadeLauncher", "SilencerAR"},
        Ammo = 1
    }
}

Silent:AddToggle('SilentAim', {
    Text = 'SilentAim',
    Default = false,
    Tooltip = 'Checkington',
    Callback = function(Value)
        Settings.SilentAim.Enabled = Value
    end
}):AddKeyPicker('KeyPicker', {
    Default = 'C',
    SyncToggleState = true,
    Mode = 'Toggle',

    Text = 'Silent Aim',
    NoUI = false
})

Silent:AddToggle('Camlock', {
    Text = 'Camlock',
    Default = false,
    Tooltip = 'Checkington',
    Callback = function(Value)
        Settings.Camlock.Enabled = Value
    end
}):AddKeyPicker('KeyPicker', {
    Default = 'Z',
    SyncToggleState = true,
    Mode = 'Toggle',

    Text = 'Camlock',
    NoUI = false
})

Silent:AddSlider('Smoothing', {
    Text = 'Camlock Smoothing',
    Default = 10,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Settings.Camlock.smoothing = Value
    end
})

Silent:AddDropdown('AimMethods', {
    Values = Settings.SilentAim.AimMethod,
    Default = 0,
    Multi = false, 
    Text = 'AimMethods',
    Tooltip = 'AimMethods',
    Callback = function(Value)
        Settings.SilentAim.AimMethods = Value
    end
})

Silent:AddDropdown('Checks', {
    Values = Settings.SilentAim.Check,
    Default = 0,
    Multi = true, 
    Text = 'Checks',
    Tooltip = 'Checks',
    Callback = function(Value)
        Settings.SilentAim.Check = Value
    end
})

Silent:AddDropdown('HitBone', {
    Values = HitBones,
    Default = 0,
    Multi = false, 
    Text = 'HitBone',
    Tooltip = 'HitBone',
    Callback = function(Value)
        Settings.SilentAim.HitBone = Value
    end
})

AntiAim:AddToggle('Desync', {
    Text = 'Desync',
    Default = false,
    Tooltip = 'Desync',
    Callback = function(Value)
        Settings.Desync.Enabled = Value
    end
}):AddKeyPicker('KeyPicker', {
    Default = 'X',
    SyncToggleState = true,
    Mode = 'Toggle',

    Text = 'Desync',
    NoUI = false
})

AntiAim:AddDropdown('AntiAim', {
    Values = Settings.Desync.DesyncMode,
    Default = 0,
    Multi = false, 
    Text = 'Desync Mode',
    Tooltip = 'Desync',
    Callback = function(Value)
        Settings.Desync.DesyncMode = Value
    end
})

AntiAim:AddSlider('AntiAimRange', {
    Text = 'Desync Range',
    Default = 1,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Settings.Desync.Range = Value
    end
})

VisualsTab:AddToggle('Fov', {
    Text = 'Fov',
    Default = false,
    Tooltip = 'Fov',
    Callback = function(Value)
        Visuals.Fov.Enabled = Value
    end
})

VisualsTab:AddToggle('Tracer', {
    Text = 'Tracer',
    Default = false,
    Tooltip = 'Tracer',
    Callback = function(Value)
        Visuals.Tracer.Enabled = Value
    end
})

VisualsTab:AddSlider('Fov', {
    Text = 'Fov Radius',
    Default = 100,
    Min = 1,
    Max = 1000,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Settings.SilentAim.Fov = Value
    end
})

Predication:AddToggle('Prediction', {
    Text = 'Prediction',
    Default = false,
    Tooltip = 'Prediction',
    Callback = function(Value)
        Settings.Prediction.Enabled = Value
    end
})

Predication:AddToggle('AutoPrediction', {
    Text = 'Auto Prediction',
    Default = false,
    Tooltip = 'Auto Prediction',
    Callback = function(Value)
        Settings.Prediction.AutoPrediction = Value
    end
})

Predication:AddSlider('PredictionAmound', {
    Text = 'Prediction Amound',
    Default = 13,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Settings.Prediction.Prediction = Value
    end
})

Predication:AddToggle('Resolver', {
    Text = 'Resolver',
    Default = false,
    Tooltip = 'Resolver',
    Callback = function(Value)
        Settings.Prediction.Resolver = Value
    end
})

Predication:AddDropdown('ResolverMethod', {
    Values = Settings.Prediction.ResolveMethod,
    Default = 0,
    Multi = false, 
    Text = 'Resolve Method',
    Tooltip = 'Resolve Method',
    Callback = function(Value)
        Settings.Prediction.ResolveMethod = Value
    end
})

AutoShop:AddToggle('AutoBuy', {
    Text = 'Enable',
    Default = false,
    Tooltip = 'Enable',
    Callback = function(Value)
        Settings.AutoBuy.Enabled = Value
    end
})

AutoShop:AddDropdown('AutoBuyWeapon', {
    Values = Settings.AutoBuy.Weapons,
    Default = 0,
    Multi = true, 
    Text = 'Auto Buy',
    Tooltip = 'Auto Buy Weapon',
    Callback = function(Value)
        Settings.AutoBuy.Weapons = Value
    end
})

AutoShop:AddSlider('AmmoAmound', {
    Text = 'AmmoAmound',
    Default = 1,
    Min = 0,
    Max = 10,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        Settings.AutoBuy.Ammo = Value
    end
})

local IsAlive = function(Target)
    return Target and Target.Character and Target.Character:FindFirstChild('Humanoid') and Target.Character.Humanoid.Health > 0
end

local IsVisible = function(Target)
    if not IsAlive(Target) or not IsAlive(Client) then return false end
    return #Camera:GetPartsObscuringTarget({Target.Character[Settings.SilentAim.HitBone].Position, Client.Character[Settings.SilentAim.HitBone].Position}, {Camera, Client.Character, Target.Character}) == 0
end

local IsGrabbed = function(Target)
    if not IsAlive(Target) then return false end
    return Target.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
end

local IsForceField = function(Target)
    if not IsAlive(Target) then return false end
    return Target.Character:FindFirstChildOfClass('ForceField') ~= nil
end

local IsKnocked = function(Target)
    if not IsAlive(Target) then return false end
    return Target.Character.BodyEffects["K.O"].Value == true
end

local Fov = function()
    Fov.Visible = Visuals.Fov.Enabled
    Fov.Radius = Settings.SilentAim.Fov
    Fov.Color = Visuals.Fov.Color
    Fov.Position = InputService:GetMouseLocation() - Vector2.new(0, 35 * 3)
end

local Tracer = function(Target)
    Tracer.Visible = Visuals.Tracer.Enabled
    Tracer.Color = Visuals.Tracer.Color
    Tracer.From = InputService:GetMouseLocation() - Vector2.new(0, 35 * 3)
    if Target then
        Tracer.To = Vector2.new(Camera:WorldToViewportPoint(Target.Character.HumanoidRootPart.Position).X, Camera:WorldToViewportPoint(Target.Character.HumanoidRootPart.Position).Y) - Vector2.new(0, 35 * 3)
    else
        Tracer.Visible = false
    end
end 

local AutoBuy = function(selectedWeapon)
    if IsForceField(Client) then return end
    if Settings.AutoBuy.Enabled then
        for name, value in next, selectedWeapon do
            local GunName = Guns[name].Gun
            local AmmoName = Guns[name].Ammo
            if GunName then
                if not (backpack:FindFirstChild(GunName) or workspace.Players:WaitForChild(Client.Name):FindFirstChild(GunName)) then
                    Client.Character.HumanoidRootPart.CFrame = Shop[GunName].Head.CFrame
                    wait(1)
                    fireclickdetector(Shop[GunName].ClickDetector)
                end
            end
            if Settings.AutoBuy.Ammo > 0 then
                for i = 1, Settings.AutoBuy.Ammo + 1 do
                    Client.Character.HumanoidRootPart.CFrame = Shop[AmmoName].Head.CFrame
                    wait(1)
                    fireclickdetector(Shop[AmmoName].ClickDetector)
                end
            end
        end
    end
end

local GetClosestPlayer = function(Radius)
    local Distance, ClosestPlayer = Radius, nil
    for _,v in pairs(Players:GetPlayers()) do
        if (v == Client) then continue end
        local Character = v.Character
        local RootPart = Character and Character:FindFirstChild('HumanoidRootPart')

        if not (RootPart) then continue end

        local Position, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
        local Magnitude = (Vector2.new(Position.X, Position.Y) - InputService:GetMouseLocation()).Magnitude

        if Magnitude > Distance then continue end
        if OnScreen then
            if Settings.SilentAim.AimMethods == "ClosestToMouse" then
                Distance = Magnitude
                ClosestPlayer = v
            elseif Settings.SilentAim.AimMethods == "ClosestToPlayer" then
                local PlayerPosition = Camera:WorldToViewportPoint(Client.Character.HumanoidRootPart.Position)
                local TargetPosition = Camera:WorldToViewportPoint(RootPart.Position)
                local PlayerDistance = (Vector2.new(PlayerPosition.X, PlayerPosition.Y) - InputService:GetMouseLocation()).Magnitude
                local TargetDistance = (Vector2.new(TargetPosition.X, TargetPosition.Y) - InputService:GetMouseLocation()).Magnitude
                if TargetDistance < PlayerDistance then
                    Distance = Magnitude
                    ClosestPlayer = v
                end
            end
        end
    end 
    
    if ClosestPlayer then
        for name, value in next, Options.Checks.Value do
            if name == "Visible" and not IsVisible(ClosestPlayer) then return end
            if name == "ForceField" and IsForceField(ClosestPlayer) then return end
            if name == "Grabbed" and IsGrabbed(ClosestPlayer) then return end
            if name == "Knocked" and IsKnocked(ClosestPlayer) then return end
        end
    end

    return ClosestPlayer
end


local Camlock = function()
    if not IsAlive(Client or Target) then return end
    if Settings.Camlock.Enabled then
        local Target = GetClosestPlayer(Settings.SilentAim.Fov)
        if Target then
            local CFrameMain = CFrame.new(Camera.CFrame.Position, Target.Character[Settings.SilentAim.HitBone].Position)
            Camera.CFrame = Camera.CFrame:Lerp(CFrameMain, (Settings.Camlock.smoothing / 100))
        end
    end
end

local Update = function()
    Camlock()
    Fov()
    Target = GetClosestPlayer(Settings.SilentAim.Fov)
    Tracer(Target)
end

local OnCharacterAdded = function()
    AutoBuy(Settings.AutoBuy.Weapons)
end

Client.CharacterAdded:Connect(OnCharacterAdded)

RunService.RenderStepped:connect(Update)
RunService.Heartbeat:Connect(function()
    CurrentPing = tonumber(string.format("%.3f", ping:GetValue()))
    if Settings.Desync.Enabled then 
        local Desyncmodes = {
            Static = {math.random(Settings.Desync.X.Min, Settings.Desync.X.Max),math.random(Settings.Desync.Y.Min, Settings.Desync.Y.Max),math.random(Settings.Desync.Z.Min, Settings.Desync.Z.Max)},
            Dynamic = {math.sin(tick()) * Settings.Desync.Range, math.sin(tick()) * Settings.Desync.Range, math.cos(tick()) * Settings.Desync.Range},
            Jitter = {math.random(-Settings.Desync.Range, Settings.Desync.Range),math.random(-Settings.Desync.Range, Settings.Desync.Range),math.random(-Settings.Desync.Range, Settings.Desync.Range)},
            Spin = {math.sin(tick()) * Settings.Desync.Range, 0, math.cos(tick()) * Settings.Desync.Range}
        }

        local DesyncMode = Desyncmodes[Settings.Desync.DesyncMode]
        if DesyncMode then
            local OldPos = Client.Character.HumanoidRootPart.CFrame
            local NewPos = CFrame.new(Client.Character.HumanoidRootPart.Position + Vector3.new(unpack(DesyncMode)))
            Client.Character.HumanoidRootPart.CFrame = NewPos
            RunService.RenderStepped:Wait()
            Client.Character.HumanoidRootPart.CFrame = OldPos
        end
    end

    if Settings.Prediction.AutoPrediction then
        local pingThresholds = {
            {ping = 20, prediction = 15.7},
            {ping = 30, prediction = 15.5},
            {ping = 40, prediction = 14.5},
            {ping = 50, prediction = 14.3},
            {ping = 60, prediction = 14},
            {ping = 70, prediction = 13.6},
            {ping = 80, prediction = 13.3},
            {ping = 90, prediction = 13},
            {ping = 105, prediction = 12.7},
            {ping = 110, prediction = 12.4},
            {ping = math.huge, prediction = 12}
        }
        for _, threshold in ipairs(pingThresholds) do
            if CurrentPing < threshold.ping then
                if Settings.Prediction.Prediction > threshold.prediction then
                    Options.PredictionAmound:SetValue(Options.PredictionAmound.Value - 0.1)
                elseif Settings.Prediction.Prediction < threshold.prediction then
                    Options.PredictionAmound:SetValue(Options.PredictionAmound.Value + 0.1)
                end
                break
            end
        end
        wait(0.2)
    end

end)

local namecall; namecall = hookmetamethod(game, '__namecall', function(self, ...)
    local Arguments, Method = {...}, getnamecallmethod()
    
    if (not checkcaller() and Settings.SilentAim.Enabled and Target and Method == 'FireServer' and self == Remote and Arguments[1] == 'UpdateMousePos') then 
        if Settings.Prediction.Enabled then
            Arguments[2] = Target.Character[Settings.SilentAim.HitBone].Position
        elseif Settings.Prediction.Enabled or (Settings.Prediction.AutoPrediction and Settings.Prediction.Resolver) then
            if Settings.Prediction.ResolveMethod == "Custom Prediction" then
                Arguments[2] = Target.Character[Settings.SilentAim.HitBone].Position + (Target.Character.HumanoidRootPart.Velocity * Settings.Prediction.Prediction)
            elseif Settings.Prediction.ResolveMethod == "Velocity" then
                Arguments[2] = Target.Character[Settings.SilentAim.HitBone].Position + (Target.Character.HumanoidRootPart.Velocity * (Settings.Prediction.Prediction / 100))
            elseif Settings.Prediction.ResolveMethod == "HumanoidMoveDirection" then
                Arguments[2] = Target.Character[Settings.SilentAim.HitBone].Position + Target.Character.Humanoid.MoveDirection * (Settings.Prediction.Prediction / 10)
            end
        end
        return namecall(self, unpack(Arguments))
    end
    return namecall(self, ...)
end)

--thanks lunar.vip :money_mouth:
local old; old = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() and key == "CFrame" and Client.Character and self == Client.Character:FindFirstChild("HumanoidRootPart") and Settings.Desync.Enabled and Desync["OldPos"] ~= nil and Client.Character:FindFirstChild("Humanoid") and Client.Character.Humanoid.Health > 0 then
        return Desync["OldPos"]
    end
    return old(self, key)
end)

Library:OnUnload(function()Library.Unloaded=true end)Library:SetWatermark(('Primordial v%s'):format(Settings.Version))local a=Tabs['UI Settings']:AddLeftGroupbox('Menu')local b=a:AddButton({Text='Unload',Func=function()Library:Unload()end,DoubleClick=true,Tooltip='Unload Script'})a:AddButton({Text='Rejoin',Func=function()game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,game.JobId,Client)end,DoubleClick=true,Tooltip='Rejoin game'})a:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',{Default='End',NoUI=true,Text='Menu keybind'})Library.ToggleKeybind=Options.MenuKeybind;a:AddToggle('keybindframe',{Text='Keybind Frame',Default=false,Tooltip='Toggles KeybindFrame'})Toggles.keybindframe:OnChanged(function()Library.KeybindFrame.Visible=Toggles.keybindframe.Value end)a:AddToggle('Watermark',{Text='Watermark',Default=false,Tooltip='Toggles Watermark'})Toggles.Watermark:OnChanged(function()Library:SetWatermarkVisibility(Toggles.Watermark.Value)end)Library.ToggleKeybind=Options.MenuKeybind;ThemeManager:SetLibrary(Library)SaveManager:SetLibrary(Library)SaveManager:IgnoreThemeSettings()SaveManager:SetIgnoreIndexes({'MenuKeybind'})ThemeManager:SetFolder('Primordial')SaveManager:SetFolder('Primordial/Games')SaveManager:BuildConfigSection(Tabs['UI Settings'])ThemeManager:ApplyToTab(Tabs['UI Settings'])