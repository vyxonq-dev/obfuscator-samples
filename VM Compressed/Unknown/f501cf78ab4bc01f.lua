-- 独立自动交互功能（10米距离限制版）
local AutoInteract = {}
AutoInteract.Enabled = false
local autoInteract = false
local INTERACT_RANGE = 10

local UILibrary = loadstring(game:HttpGet([[https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/%E7%9A%AE%E8%84%9A%E6%9C%ACUI%E6%BA%90%E7%A0%81.lua]]))():new("自动交互功能")
local MainTab = UILibrary:Tab("自动交互", "18930406865")
local InteractSection = MainTab:section("功能控制", true)

local function getDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function startAutoInteract()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    while autoInteract do
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            task.wait(0.25)
            continue
        end
        local playerPos = LocalPlayer.Character.HumanoidRootPart.Position
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("ProximityPrompt") and descendant.Parent:IsA("BasePart") then
                local targetPos = descendant.Parent.Position
                if getDistance(playerPos, targetPos) <= INTERACT_RANGE then
                    pcall(function()
                        fireproximityprompt(descendant)
                    end)
                end
            end
        end
        task.wait(0.25)
    end
end

InteractSection:Toggle("开启/关闭自动交互", "AutoInteract", false, function(enabled)
    autoInteract = enabled
    AutoInteract.Enabled = enabled
    if enabled then
        task.spawn(startAutoInteract)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "自动交互",
            Text = "已开启10米内自动交互",
            Icon = "rbxassetid://18941716391",
            Duration = 2,
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "自动交互",
            Text = "已关闭自动交互功能",
            Icon = "rbxassetid://18941716391",
            Duration = 2,
        })
    end
end)

InteractSection:Slider("调整交互距离（米）", "RangeSlider", INTERACT_RANGE, 1, 50, false, function(range)
    INTERACT_RANGE = range
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "距离调整",
        Text = "交互有效距离已设为：" .. range .. "米",
        Icon = "rbxassetid://18941716391",
        Duration = 1.5,
    })
end)

InteractSection:Button("青鬼传送（手机）", function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/009xDTmJ"))()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "青鬼传送",
            Text = "已执行青鬼传送（手机）功能",
            Icon = "rbxassetid://18941716391",
            Duration = 2,
        })
    end, function(err)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "青鬼传送",
            Text = "手机版功能执行失败：" .. tostring(err),
            Icon = "rbxassetid://18941716391",
            Duration = 3,
        })
    end)
end)

InteractSection:Button("青鬼传送（平板）", function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/eJVHcj4P"))()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "青鬼传送",
            Text = "已执行青鬼传送（平板）功能",
            Icon = "rbxassetid://18941716391",
            Duration = 2,
        })
    end, function(err)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "青鬼传送",
            Text = "平板版功能执行失败：" .. tostring(err),
            Icon = "rbxassetid://18941716391",
            Duration = 3,
        })
    end)
end)

-- 新增青鬼透视功能按钮
InteractSection:Button("青鬼透视", function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/wXAdK9ui"))()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "青鬼透视",
            Text = "已执行青鬼透视功能",
            Icon = "rbxassetid://18941716391",
            Duration = 2,
        })
    end, function(err)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "青鬼透视",
            Text = "功能执行失败：" .. tostring(err),
            Icon = "rbxassetid://18941716391",
            Duration = 3,
        })
    end)
end)

-- 新增删除安全柜功能按钮
InteractSection:Button("删除安全柜", function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/w4U5vqjB"))()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "删除安全柜",
            Text = "已执行删除安全柜功能",
            Icon = "rbxassetid://18941716391",
            Duration = 2,
        })
    end, function(err)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "删除安全柜",
            Text = "功能执行失败：" .. tostring(err),
            Icon = "rbxassetid://18941716391",
            Duration = 3,
        })
    end)
end)

return AutoInteract
