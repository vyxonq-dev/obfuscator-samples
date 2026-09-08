local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/bacon"))()
local version, changelog = lib:GetInfo()
local window = lib:CreateWindow("BaconLib v"..version)

local button = lib:CreateButton(window, "INSTANT WIN", function()
    local ts = game:GetService("TweenService")
local pl = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

local tween = ts:Create(pl, TweenInfo.new(1), {CFrame = CFrame.new(-185.713852, 771.638672, 56.7299309, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)})
tween:Play()
end)
