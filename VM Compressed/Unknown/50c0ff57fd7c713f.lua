local _G=getgenv and getgenv()or _G
local _0x1,_0x2,_0x3,_0x4=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("Players").LocalPlayer
local _0x5={_0xa=false,_0xb=false,_0xc=false,_0xd=true}

local function _0x6(_0xe)
    local _0xf=_0x4.Character
    if _0xf and _0xf:FindFirstChild("Humanoid")and _0xf.Humanoid:FindFirstChild("Gear")then
        local _0x10=_0xf.Humanoid.Gear
        if _0x10:FindFirstChild("Gas")then
            if(_0xe or _0x5._0xa)and _0x10.Gas.Value<2000 then
                _0x10.Gas.Value=2000
            end
        end
    end
end

local function _0x11()
    local _0xf=_0x4.Character
    if _0xf then
        local _0x12=_0xf:FindFirstChild("Humanoid")
        if _0x12 then
            local _0x10=_0x12:FindFirstChild("Gear")
            if _0x10 and _0x10:FindFirstChild("Skills")then
                for _,_0x13 in pairs(_0x10.Skills:GetChildren())do _0x13.Value=true end
                local _0x14=_0x4:FindFirstChild("PlayerGui")
                if _0x14 and _0x14:FindFirstChild("SkillsGui")then
                    _0x14.SkillsGui.Enabled=true
                    local _0x15={"BladeThrow","Counter","Dodge","Impulse","SuperJump","HandCut","HandCutMk2"}
                    for _,_0x16 in pairs(_0x15)do
                        if _0x14.SkillsGui:FindFirstChild(_0x16)then _0x14.SkillsGui[_0x16].Enabled=true end
                    end
                end
            end
        end
    end
end

local function _0x17()
    local _0xf=_0x4.Character
    if _0xf then
        local _0x12=_0xf:FindFirstChild("Humanoid")
        if _0x12 then
            local _0x18=_0x12:FindFirstChild("Stamina")
            if _0x18 and _0x18.Value<2400 then _0x18.Value=2400 end
        end
    end
end

local function _0x19()
    local _0x1a=workspace:FindFirstChild("OnGameHorses")
    if not _0x1a then return end
    for _,_0x1b in pairs(_0x1a:GetChildren())do
        local _0x12=_0x1b:FindFirstChild("Humanoid")
        local _0x1c=_0x1b:FindFirstChild("Carriage")
        if _0x1c then _0x12=_0x1c:FindFirstChild("Humanoid")end
        if _0x12 and _0x12.Health>0 then
            local _0x1d=_0x12:FindFirstChild("Owner")
            if _0x1d and _0x1d.Value==_0x4.Name then
                local _0x1e=_0x12.Parent:FindFirstChild("Configuration")
                if _0x1e then
                    local _0x18=_0x1e:FindFirstChild("Stamina")
                    if _0x18 and _0x18.Value<4000 then _0x18.Value=4000 end
                end
            end
        end
    end
end

local function _0x1f()
    if _0x5._0xd then
        if _0x5._0xa then _0x6()end
        if _0x5._0xb then _0x17()end
        if _0x5._0xc then _0x19()end
    end
end

local _0x20=_0x2.Heartbeat:Connect(_0x1f)

local _0x21,_0x22=pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not _0x21 then
    warn("[Error] Failed to load GUI library")
    return
end

local _0x23=_0x22:CreateWindow({
    Name="Essential Script",
    LoadingTitle="Loading...",
    LoadingSubtitle="Please wait",
    ConfigurationSaving={
        Enabled=true,
        FolderName="EssentialScript",
        FileName="Config"
    }
})

local _0x24=nil
local function _0x25()
    for _,_0x26 in pairs(_0x4.PlayerGui:GetChildren())do
        if _0x26:IsA("ScreenGui")and _0x26.Name:find("Rayfield")then return _0x26 end
    end
    return nil
end

local function _0x27()
    if not _0x24 then _0x24=_0x25()end
    if not _0x24 then return false end
    local _0x28=_0x3:GetMouseLocation()
    local _0x29=_0x4.PlayerGui:GetGuiObjectsAtPosition(_0x28.X,_0x28.Y)
    for _,_0x2a in pairs(_0x29)do
        local _0x2b=_0x2a
        while _0x2b do
            if _0x2b==_0x24 then return true end
            _0x2b=_0x2b.Parent
        end
    end
    return false
end

_0x2.RenderStepped:Connect(function()
    _0x3.MouseIconEnabled=_0x27()
end)

_0x4.PlayerGui.ChildAdded:Connect(function(_0x2c)
    if _0x2c:IsA("ScreenGui")and _0x2c.Name:find("Rayfield")then
        _0x24=_0x2c
    end
end)

local _0x2d=_0x23:CreateTab("Main Features",4483362458)

_0x2d:CreateToggle({
    Name="Infinite Gas",
    CurrentValue=_0x5._0xa,
    Flag="InfGas",
    Callback=function(_0x2e)
        _0x5._0xa=_0x2e
        if _0x2e then print("[Script] Infinite Gas enabled")end
    end
})

_0x2d:CreateToggle({
    Name="Infinite Player Stamina",
    CurrentValue=_0x5._0xb,
    Flag="InfPStam",
    Callback=function(_0x2e)
        _0x5._0xb=_0x2e
        if _0x2e then print("[Script] Infinite Player Stamina enabled")end
    end
})

_0x2d:CreateToggle({
    Name="Infinite Horse Stamina",
    CurrentValue=_0x5._0xc,
    Flag="InfHStam",
    Callback=function(_0x2e)
        _0x5._0xc=_0x2e
        if _0x2e then print("[Script] Infinite Horse Stamina enabled")end
    end
})

_0x2d:CreateKeybind({
    Name="Unlock All Skills",
    CurrentKeybind="U",
    HoldToInteract=false,
    Flag="UnlSkills",
    Callback=function()
        _0x11()
        print("[Script] All skills unlocked")
    end
})

_0x2d:CreateKeybind({
    Name="Manual Gas Refill",
    CurrentKeybind="Y",
    HoldToInteract=false,
    Flag="ManGas",
    Callback=function()
        _0x6(true)
        print("[Script] Gas refilled to 2000")
    end
})

_0x2d:CreateButton({
    Name="Disable Script",
    Callback=function()
        _0x5._0xd=false
        _0x20:Disconnect()
        _0x22:Destroy()
        print("[Script] Script disabled")
    end
})

print("[Script] Essential Script loaded successfully!")
print("[Script] All features ready")