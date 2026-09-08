

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "PYJAH5"
getgenv().scriptidentifier = "Fullbright"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/PYJAH5/ws-loader"))()

local function setFullbright()
    local lighting = game:GetService("Lighting")

    originalBrightness = lighting.Brightness
    originalGlobalShadows = lighting.GlobalShadows
    originalAmbient = lighting.Ambient
    originalOutdoorAmbient = lighting.OutdoorAmbient

    lighting.Brightness = 2  
    lighting.GlobalShadows = false  
    lighting.Ambient = Color3.fromRGB(255, 255, 255)  
    lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    
    
    for _, light in ipairs(workspace:GetDescendants()) do
        if light:IsA("Light") then
            light.Enabled = true
            light.Brightness = 10  
        end
    end
end

local function resetLighting()
    local lighting = game:GetService("Lighting")
    
    lighting.Brightness = originalBrightness
    lighting.GlobalShadows = originalGlobalShadows
    lighting.Ambient = originalAmbient
    lighting.OutdoorAmbient = originalOutdoorAmbient
    
    for _, light in ipairs(workspace:GetDescendants()) do
        if light:IsA("Light") then
            light.Brightness = 1  
        end
    end
end

setFullbright()