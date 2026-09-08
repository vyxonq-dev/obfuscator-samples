-- ===================================================================
--                        YUKI HUB
--              Build A Blue Lock Squad - Auto-Farm Hub
--                     UI: Rayfield Gen2
-- ===================================================================

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local Window = Rayfield:CreateWindow({
    name = "Yuki Hub",
    subtitle = "Build A Blue Lock Squad",
    theme = "Default",
    loadingTitle = "Loading Yuki Hub...",
    loadingSubtitle = "Connecting to game services...",
})

-- -------------------------------------------------------------------
-- Core Services & Stores
-- -------------------------------------------------------------------
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local CodeRequest = ReplicatedStorage:WaitForChild("Communication"):WaitForChild("CodeRequest")
local BuilderStore, CoachStore, FreeRewardsStore, StateStore

pcall(function()
    local clientStores = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Client"):WaitForChild("Stores")
    BuilderStore = require(clientStores:WaitForChild("BuilderStore"))
    CoachStore = require(clientStores:WaitForChild("CoachStore"))
    FreeRewardsStore = require(clientStores:WaitForChild("FreeRewardsStore"))
    StateStore = require(clientStores:WaitForChild("StateStore"))
end)

-- -------------------------------------------------------------------
-- UI Tabs
-- -------------------------------------------------------------------
local GeneralTab   = Window:CreateTab({ name = "General", icon = "layout-grid" })
local AutoTab      = Window:CreateTab({ name = "Auto", icon = "bot" })
local CharacterTab = Window:CreateTab({ name = "Character", icon = "user" })

-- -------------------------------------------------------------------
-- State & Configuration Variables
-- -------------------------------------------------------------------
-- Auto Roll & Filter
local autoRollSquad      = false
local minOverallRating   = 90
local alwaysKeepSpecial  = true
local fallbackOnLowRolls = true
local lowRollLimit       = 3
local autoFinishSquad    = false
local autoRollCoach      = false
local rollDelay          = 0.6

-- General Settings
local autoClaimRewards   = false
local antiAfk            = true

-- Character Settings
local currentSpeed       = 16
local currentJump        = 50

-- Promo Codes List
local GameCodes = { "Hotfix", "Cup", "Penalty", "Awakened", "Trophies", "Reo" }

-- ===================================================================
-- Helper Functions
-- ===================================================================

-- 1. Smart 90+ Card Evaluator & Slot Matcher
local function findEligibleCard()
    if not (StateStore and BuilderStore) then return nil, nil end
    local choices = StateStore.Choices()
    if not choices or #choices == 0 then return nil, nil end
    
    local remainingRolls = StateStore.Rolls() or 0
    local isLowOnRolls = fallbackOnLowRolls and (remainingRolls <= lowRollLimit)
    
    local bestCard, bestSlot, bestScore = nil, nil, -1
    
    for _, card in ipairs(choices) do
        local slot = BuilderStore.FindAutoPlaceSlot(card)
        if slot then
            local ovr = tonumber(card.Overall) or 0
            local isShiny = card.Shiny == true
            local isAwakened = card.Awakened == true
            
            local isEligible = (ovr >= minOverallRating) 
                or (alwaysKeepSpecial and (isAwakened or isShiny))
                or isLowOnRolls
            
            if isEligible then
                local score = ovr + (isAwakened and 100 or 0) + (isShiny and 20 or 0)
                if score > bestScore then
                    bestScore = score
                    bestCard = card
                    bestSlot = slot
                end
            end
        end
    end
    
    return bestCard, bestSlot
end

-- 2. Promo Code Redeemer
local function redeemCode(code)
    local success, res = pcall(function()
        return CodeRequest:InvokeServer(code)
    end)
    
    if success and type(res) == "table" then
        local msg = res.Message or (res.Ok and "Claimed successfully!" or "Failed")
        Window:Notify({
            title = "Code: " .. code,
            content = msg,
            duration = 3.5,
        })
    else
        Window:Notify({
            title = "Code: " .. code,
            content = "Request timed out or failed.",
            duration = 3,
        })
    end
end

-- ===================================================================
-- Background Loops
-- ===================================================================

-- Anti-AFK Worker
LocalPlayer.Idled:Connect(function()
    if antiAfk then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

-- Squad Auto-Roll & 90+ Auto-Picker Worker
task.spawn(function()
    while true do
        task.wait(rollDelay)
        
        if autoRollSquad and BuilderStore and StateStore then
            pcall(function()
                if BuilderStore.Drawing and BuilderStore.Drawing() then
                    if BuilderStore.RequestSkipSpin then
                        BuilderStore.RequestSkipSpin()
                    end
                    return
                end
                
                local choices = StateStore.Choices()
                
                -- Cards on screen: Check if any meet the 90+ threshold
                if choices and #choices > 0 then
                    local eligibleCard, slot = findEligibleCard()
                    
                    if eligibleCard and slot then
                        local slotId = type(slot) == "table" and slot.Id or slot
                        BuilderStore.Place(eligibleCard, slotId)
                        
                        Window:Notify({
                            title = "Player Equipped",
                            content = eligibleCard.Name .. " (" .. tostring(eligibleCard.Overall) .. " OVR) -> " .. tostring(slotId),
                            duration = 3,
                        })
                        task.wait(0.4)
                    else
                        -- No card met the threshold or no open slot -> Reroll
                        if BuilderStore.CanRoll and BuilderStore.CanRoll() then
                            BuilderStore.Roll("roll")
                        elseif BuilderStore.CanRefresh and BuilderStore.CanRefresh() then
                            BuilderStore.Roll("refresh")
                        end
                    end
                -- Squad is full: Check Auto-Finish
                elseif BuilderStore.TeamFull and BuilderStore.TeamFull() then
                    if autoFinishSquad and BuilderStore.CanFinish and BuilderStore.CanFinish() then
                        BuilderStore.Finish()
                        task.wait(1.5)
                        if BuilderStore.Restart then
                            BuilderStore.Restart()
                        end
                    end
                -- Ready to roll
                elseif BuilderStore.CanRoll and BuilderStore.CanRoll() then
                    BuilderStore.Roll("roll")
                end
            end)
        end
    end
end)

-- Coach Auto-Roll Worker
task.spawn(function()
    while true do
        task.wait(rollDelay)
        if autoRollCoach and CoachStore then
            pcall(function()
                CoachStore.Roll()
            end)
        end
    end
end)

-- Free Rewards Auto-Claimer Worker
task.spawn(function()
    while true do
        task.wait(5)
        if autoClaimRewards and FreeRewardsStore then
            pcall(function()
                FreeRewardsStore.Claim()
            end)
        end
    end
end)

-- ===================================================================
-- TAB 1: GENERAL
-- ===================================================================

GeneralTab:CreateDivider({ text = "Promo Codes" })

GeneralTab:CreateButton({
    name = "Redeem All Active Codes",
    description = "Claims all 6 promo codes sequentially",
    callback = function()
        for _, code in ipairs(GameCodes) do
            redeemCode(code)
            task.wait(0.6)
        end
    end,
})

for _, code in ipairs(GameCodes) do
    GeneralTab:CreateButton({
        name = "Redeem: " .. code,
        description = "Claim code '" .. code .. "'",
        callback = function()
            redeemCode(code)
        end,
    })
end

GeneralTab:CreateDivider({ text = "Playtime Gifts & Rewards" })

GeneralTab:CreateToggle({
    name = "Auto Claim Free Gifts",
    description = "Periodically claims timed playtime gifts automatically",
    value = false,
    callback = function(val)
        autoClaimRewards = val
    end,
})

GeneralTab:CreateButton({
    name = "Claim Free Gifts Now",
    description = "Manually trigger reward claim attempt",
    callback = function()
        if FreeRewardsStore then
            pcall(function() FreeRewardsStore.Claim() end)
            Window:Notify({
                title = "Rewards",
                content = "Claim request sent!",
                duration = 2.5,
            })
        end
    end,
})

GeneralTab:CreateDivider({ text = "Utilities" })

GeneralTab:CreateToggle({
    name = "Anti-AFK Protection",
    description = "Prevents Roblox 20-minute idle disconnect",
    value = true,
    callback = function(val)
        antiAfk = val
    end,
})

-- ===================================================================
-- TAB 2: AUTO
-- ===================================================================

AutoTab:CreateDivider({ text = "Squad Auto-Roll & Filter" })

AutoTab:CreateToggle({
    name = "Auto Roll (Squad)",
    description = "Enables automated spinning and card filtering",
    value = false,
    callback = function(val)
        autoRollSquad = val
    end,
})

AutoTab:CreateSlider({
    name = "Minimum Rating Filter",
    description = "Rerolls any player below this rating (Default: 90)",
    range = { 80, 98 },
    increment = 1,
    value = 90,
    suffix = " OVR",
    callback = function(val)
        minOverallRating = val
    end,
})

AutoTab:CreateToggle({
    name = "Always Keep Awakened / Shiny",
    description = "Always picks Awakened/Shiny cards regardless of rating",
    value = true,
    callback = function(val)
        alwaysKeepSpecial = val
    end,
})

AutoTab:CreateToggle({
    name = "Low Rolls Safety Net",
    description = "Picks highest available card if rolls drop <= 3",
    value = true,
    callback = function(val)
        fallbackOnLowRolls = val
    end,
})

AutoTab:CreateToggle({
    name = "Auto-Finish & Restart Squad",
    description = "Submits completed squad to collect coins and restarts",
    value = false,
    callback = function(val)
        autoFinishSquad = val
    end,
})

AutoTab:CreateButton({
    name = "Pick Best Player Now",
    description = "Manually selects and places highest rated card",
    callback = function()
        local card, slot = findEligibleCard()
        if card and slot and BuilderStore then
            local slotId = type(slot) == "table" and slot.Id or slot
            pcall(function() BuilderStore.Place(card, slotId) end)
            Window:Notify({
                title = "Smart Pick",
                content = "Placed: " .. card.Name .. " (" .. tostring(card.Overall) .. " OVR)",
                duration = 3,
            })
        else
            Window:Notify({
                title = "Smart Pick",
                content = "No cards available or no open position.",
                duration = 3,
            })
        end
    end,
})

AutoTab:CreateDivider({ text = "Coach Auto-Roll" })

AutoTab:CreateToggle({
    name = "Auto Roll (Coach)",
    description = "Automatically rolls for coaches with coins",
    value = false,
    callback = function(val)
        autoRollCoach = val
    end,
})

AutoTab:CreateDivider({ text = "Speed & Delay" })

AutoTab:CreateSlider({
    name = "Roll Speed / Delay",
    description = "Delay between consecutive spins (seconds)",
    range = { 0.2, 2.5 },
    increment = 0.1,
    value = 0.6,
    suffix = "s",
    callback = function(val)
        rollDelay = val
    end,
})

-- ===================================================================
-- TAB 3: CHARACTER
-- ===================================================================

local function applyMovement()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = currentSpeed
            if humanoid.UseJumpPower then
                humanoid.JumpPower = currentJump
            else
                humanoid.JumpHeight = currentJump * (7.2 / 50)
            end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    applyMovement()
end)

CharacterTab:CreateDivider({ text = "Movement Modifiers" })

local WalkSpeedSlider = CharacterTab:CreateSlider({
    name = "WalkSpeed",
    description = "Adjust character movement speed",
    range = { 16, 250 },
    increment = 1,
    value = 16,
    suffix = " studs/s",
    callback = function(val)
        currentSpeed = val
        applyMovement()
    end,
})

CharacterTab:CreateButton({
    name = "Reset WalkSpeed",
    description = "Restore walkspeed to default (16)",
    callback = function()
        WalkSpeedSlider:Set(16)
    end,
})

local JumpPowerSlider = CharacterTab:CreateSlider({
    name = "JumpPower",
    description = "Adjust character jump height/power",
    range = { 50, 250 },
    increment = 1,
    value = 50,
    suffix = " power",
    callback = function(val)
        currentJump = val
        applyMovement()
    end,
})

CharacterTab:CreateButton({
    name = "Reset JumpPower",
    description = "Restore jump power to default (50)",
    callback = function()
        JumpPowerSlider:Set(50)
    end,
})