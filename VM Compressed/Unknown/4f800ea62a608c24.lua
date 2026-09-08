local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Auto Scripts",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AutoScriptsConfig",
    Draggable = true
})

local toggle = false
local waitTime = 0.01

local potionsToEquip = {"Super Luck Potion", "Luck Potion"}

local function equipPotions()
    for _, potion in ipairs(potionsToEquip) do
        local args = {"Equip", potion, "Usable"}
        game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(unpack(args))
    end
end

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AutoINFLuckToggle = MainTab:AddToggle({
    Name = "Auto INF Luck",
    Default = false,
    Flag = "AutoINFLuckToggle",
    Save = true,
    Callback = function(Value)
        toggle = Value
        if toggle then
            spawn(function()
                while toggle do
                    equipPotions()
                    wait(waitTime)
                end
            end)
        end
    end
})

local DestroyTempBoostsButton = MainTab:AddButton({
    Name = "Destroy TempBoosts",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.PlayerGui and player.PlayerGui.Main and player.PlayerGui.Main:FindFirstChild("TempBoosts") then
            player.PlayerGui.Main.TempBoosts:Destroy()
        end
    end
})

local DisableStarEffectsButton = MainTab:AddButton({
    Name = "Disable Star Effects",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.PlayerGui and player.PlayerGui.Main then
            local specialEffect = player.PlayerGui.Main:FindFirstChild("SpecialEffect")
            if specialEffect then
                local function onVisibleChanged()
                    if specialEffect.ViewportFrame.Visible then
                        specialEffect.ViewportFrame.Visible = false
                    end
                end

                specialEffect.ViewportFrame:GetPropertyChangedSignal("Visible"):Connect(onVisibleChanged)

                local childrenToDestroy = {"Piece1", "Piece2", "White", "Star", "UIAspectRatioConstraint", "UIGradient"}
                for _, childName in ipairs(childrenToDestroy) do
                    local child = specialEffect:FindFirstChild(childName)
                    if child then
                        child:Destroy()
                    end
                end
            end
        end
    end
})

OrionLib:Init()
