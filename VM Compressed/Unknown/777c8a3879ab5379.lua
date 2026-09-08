-- [[ PROJECT: ELITE PROXIMITY HUB V3 ]] --
-- [[ AUTHOR: ExoticBunBoy (Owner) ]] --
-- [[ LIBRARY: WindUI ]] --

local lI1lIl1ll1I = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local p_0x41 = game:GetService("Players").LocalPlayer
local _CORRECT_ = "Hex-V123"
local _LINK_ = "https://discord.gg/hmZ7g7YYJ"

-- // CRITICAL FIX: Persistent Transparency Logic
local _VOID_ = false
game:GetService("RunService").Stepped:Connect(function()
    if _VOID_ and p_0x41.Character then
        for _, v in pairs(p_0x41.Character:GetDescendants()) do
            if (v:IsA("BasePart") or v:IsA("Decal")) and v.Name ~= "HumanoidRootPart" then
                v.Transparency = 1
            end
        end
    end
end)

local function _INIT_MAIN_()
    local _MAIN_ = lI1lIl1ll1I:CreateWindow({
        Title = "Elite Proximity Hub V3",
        Icon = "rbxassetid://10723343321",
        Author = "ExoticBunBoy",
        Folder = "GeminiScripts"
    })

    local _MOV_ = _MAIN_:Tab("Movement", "person-walking")
    
    _MOV_:Section("Stealth")
    _MOV_:Toggle({
        Title = "Invisible Mode",
        Callback = function(v_0x1) 
            _VOID_ = v_0x1 
            if not v_0x1 and p_0x41.Character then
                for _, v in pairs(p_0x41.Character:GetDescendants()) do
                    if (v:IsA("BasePart") or v:IsA("Decal")) and v.Name ~= "HumanoidRootPart" then
                        v.Transparency = 0
                    end
                end
            end
        end
    })

    _MOV_:Section("Movement Mods")
    _MOV_:Slider({
        Title = "Walkspeed",
        Step = 1,
        Value = {Min = 16, Max = 200, Default = 16},
        Callback = function(v_0x2)
            local h = (p_0x41.Character or p_0x41.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = v_0x2 end
        end
    })

    local _ADM_ = _MAIN_:Tab("Admin", "shield-check")
    _ADM_:Button({
        Title = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end
    })
    
    lI1lIl1ll1I:Notify({Title = "System", Content = "Hub Loaded by ExoticBunBoy", Duration = 3})
end

-- // KEY SYSTEM WINDOW
local _KEY_WIN_ = lI1lIl1ll1I:CreateWindow({
    Title = "Key System | Elite Proximity",
    Icon = "rbxassetid://10723343321",
    Author = "ExoticBunBoy"
})

local _K_TAB_ = _KEY_WIN_:Tab("Verification", "key")

_K_TAB_:Input({
    Title = "Enter Credentials",
    Placeholder = "Hex-V123",
    Callback = function(_INPUT_VAL_)
        if _INPUT_VAL_ == _CORRECT_ then
            lI1lIl1ll1I:Notify({Title = "Success", Content = "Access Granted!"})
            task.wait(0.5)
            _KEY_WIN_:Close()
            _INIT_MAIN_()
        else
            lI1lIl1ll1I:Notify({Title = "Error", Content = "Invalid Key!"})
        end
    end
})

_K_TAB_:Button({
    Title = "Copy Discord Link",
    Callback = function()
        setclipboard(_LINK_)
        lI1lIl1ll1I:Notify({Title = "Copied", Content = "Link saved to clipboard"})
    end
})
