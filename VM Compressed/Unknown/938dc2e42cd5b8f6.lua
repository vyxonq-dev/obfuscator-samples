local _version = "1.6.66"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))()
local MENU_NAME = "Merge a nuke"
local SCRIPT_VERSION = "1.2.0"
local MAX_BOMB_TIER = 100

if getgenv().UI ~= nil then
    getgenv().UI:Destroy()
end

local Window = WindUI:CreateWindow({
    Title = MENU_NAME, -- window title
    Author = "by Anonymous50000", -- window subtitle. optional
    Folder = MENU_NAME, -- folder to save keys and images

    HideSearchBar = false,
    NewElements = true,

    Topbar = {
        Height = 52, -- Height of the topbar
        ButtonsType = "Mac" -- "Default" or "Mac" style
    },

    OpenButton = {
        Title = "Open Cheat",
        Icon = "monitor",
        CornerRadius = UDim.new(0,16),
        StrokeThickness = 2,
        Color = ColorSequence.new( -- only gradient 
            Color3.fromHex("FF0F7B"), 
            Color3.fromHex("F89B29")
        ),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    },
})

local config = Window.ConfigManager:Config("config")
config:SetAutoLoad(true)

local localPlayer = game.Players.LocalPlayer
local PROXIMITY_RADIUS = 10
local toggleToDisableOnDestroy = {}
local rbxConnections = {}
local threadToCancelOnDestroy = {}
local originalStateOfToggle = { DeleteHeldShittyBomb = nil, BlockGameFromGrabbingBetterNuke = nil, BlockGameFromGrabbingNuke = nil, BlockGameFromMergingNuke = nil }

local function setOriginalStateOfToggle(stateOfToggle: {DeleteHeldShittyBomb: boolean?, BlockGameFromGrabbingBetterNuke: boolean?, BlockGameFromGrabbingNuke: boolean?, BlockGameFromMergingNuke: boolean?})
    for key, value in stateOfToggle do
        if value ~= nil and originalStateOfToggle[key] == nil then
            originalStateOfToggle[key] = value
        end
    end
end

local function readOriginalStateOfToggle(property: "DeleteHeldShittyBomb" | "BlockGameFromGrabbingBetterNuke" | "BlockGameFromGrabbingNuke" | "BlockGameFromMergingNuke"): boolean?
    local value = originalStateOfToggle[property]
    originalStateOfToggle[property] = nil
    return value
end

local function stringToHex(str: string): string
    local hex = ""
    for i = 1, #str do
        local byte = string.byte(str, i)
        hex = hex .. string.format("%02X", byte)
    end
    return hex
end

local function getStringAfterWord(str: string, word: string): string?
    local startIndex, endIndex = string.find(str, word, 1, true) -- plain text search

    if not endIndex then
        return nil -- word not found
    end

    return string.sub(str, endIndex + 1)
end

local function extractNumberFromString(str: string): number?
    local tagIndex = string.find(str, "\6", 1, true) -- find the "number" type tag (0x06)

    if not tagIndex then
        return nil -- no number tag found
    end

    local doubleBytes = string.sub(str, tagIndex + 1, tagIndex + 8)

    if #doubleBytes < 8 then
        return nil -- not enough bytes left to form a double
    end

    local value = string.unpack("<d", doubleBytes)
    return value
end

local function teleportTo(object: CFrame)
    localPlayer.Character:PivotTo(object)
end

local shittyTier = 2

local hookedFireServerOri: () -> ()

local blockFireServer = {
    Pickup = {
        SuperiorToTier = false,
        InferiorToTier = false,
        EqualToTier = false,
        bypassedByExecutor = false,
    },
    Merge = {
        All = false,
        bypassedByExecutor = false
    }
}

function hookFireServer()
    if hookedFireServerOri then return end

    local Event = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Pickup/PickUp"]
    local MergeEvent = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Merge/MergeRequest"]
    hookedFireServerOri = hookmetamethod(game, "__namecall", function(...)
        local self = ...

        if rawequal(self, Event) and getnamecallmethod() == "FireServer" then
            local Args = table.pack(...)

            local nuke: Model = Args[2]

            local tier = 90
            local foundText = getStringAfterWord(gethiddenproperty(nuke, "Attributes"), "Tier")
            if foundText then
                local number = extractNumberFromString(foundText)
                if number then
                    tier = number
                end
            end

            local Result = {}
            local block = blockFireServer.Pickup
            local shouldBlock = (block.InferiorToTier and tier < shittyTier) or (block.EqualToTier and tier == shittyTier) or (block.SuperiorToTier and tier > shittyTier)
            local executorHasPerm = block.bypassedByExecutor and checkcaller()
            if not shouldBlock or executorHasPerm then
                Result = table.pack(
                    hookedFireServerOri(self, table.unpack(Args, 2, Args.n))
                )
            end

            return table.unpack(Result, 1, Result.n)
        end
        if rawequal(self, MergeEvent) and getnamecallmethod() == "FireServer" then
            local Args = table.pack(...)

            local Result = {}
            local block = blockFireServer.Merge
            local shouldBlock = block.All
            local executorHasPerm = block.bypassedByExecutor and checkcaller()
            if not shouldBlock or executorHasPerm then
                Result = table.pack(hookedFireServerOri(self, table.unpack(Args, 2, Args.n)))
            end

            return table.unpack(Result, 1, Result.n)
        end

        return hookedFireServerOri(...)
    end)
end

function restoreHookedFireServer()
    if hookedFireServerOri then
        hookmetamethod(game, "__namecall", hookedFireServerOri)
        hookedFireServerOri = nil
    end
end

hookFireServer()

-- /* Game Tab */ --
do
    local GameTab = Window:Tab({
        Title = MENU_NAME,
        Icon = "gamepad-2",
        IconColor = Color3.fromRGB(93, 93, 93), -- custom icon color. optional
        IconShape = "Square",
    })

    GameTab:Select()

    function findCurrentPlot(): Model?
        for _, base in pairs(workspace.Bases:GetDescendants()) do
            if base:GetAttribute("OwnerUserId") == localPlayer.UserId then
                return base
            end
        end
        return nil
    end

    local base = findCurrentPlot()

    function playerIsNearObject(object: Model, radius: number)
        if (localPlayer.Character:GetPivot().Position - object:GetPivot().Position).Magnitude <= radius then
            return true
        end
        return false
    end

    function isNuke(nuke: Model)
        return nuke.Name == "Nuke" or nuke.Name == "HeldNukeVisual"
    end

    function isShittyNuke(nuke: Model)
        if not isNuke(nuke) then return false end;
        local tier = tonumber(nuke:GetAttribute("Tier"))
        if tier <= shittyTier then
            return true
        else
            return false
        end
    end

    function getNukes()
        local nukes = {}
        for _, possibleNuke in pairs(base:FindFirstChild("Nukes"):GetDescendants()) do
            if isNuke(possibleNuke) then
                table.insert(nukes, possibleNuke)
            end
        end
        return nukes
    end

    function scanShittyNukes()
        for _, nuke in pairs(getNukes()) do
            if isShittyNuke(nuke) then
                grabAndDeleteNuke(nuke)
            end
        end
    end

    function grabNuke(nuke)
        local Event = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Pickup/PickUp"]
        Event:FireServer(
            nuke
        )
    end

    function deleteNuke(nuke)
        local Event: RemoteEvent = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Pickup/SelfDestructNuke"]
        Event:FireServer(
            "Begin"
        )

        task.wait(0.5)

        Event = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Pickup/SelfDestructNuke"]
        Event:FireServer(
            "Complete"
        )
    end

    function getNukeInHand(): Model?
        for _, children in pairs(workspace.Camera:GetChildren()) do
            if children.Name == "HeldNukeVisual" and playerIsNearObject(children, PROXIMITY_RADIUS) then
                return children
            end
        end
        return nil
    end

    function hasANukeInHand()
        return getNukeInHand() ~= nil
    end

    function isWhatsInHandShittyNuke()
        local nuke = getNukeInHand()
        if nuke and isShittyNuke(nuke) then
            return true
        end
        return false
    end

    function safeDeleteNuke(nuke: Model)
        if isWhatsInHandShittyNuke() then
            deleteNuke(nuke)
        end
    end

    function dropNuke()
        local Event = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Pickup/Drop"]
        Event:FireServer(
            localPlayer.Character:GetPivot()
        )
    end

    function requestMerge(nuke: Model)
        local Event = game:GetService("ReplicatedStorage").Packages.Remotes.Networking["RE/Merge/MergeRequest"]
        Event:FireServer(
            nuke
        )
    end

    function grabAndDeleteNuke(nuke: Model)
        if hasANukeInHand() then return end;
        teleportTo(nuke:GetPivot())
        task.wait(0.2)
        grabNuke(nuke)
        task.wait(0.2)
        safeDeleteNuke(nuke)
        task.wait(1)
        if hasANukeInHand() then
            dropNuke()
            task.wait(0.5)
        end
    end

    function mergeNuke(nuke: Model, otherNuke: Model)
        if hasANukeInHand() then
            dropNuke()
            task.wait(0.2)
        end
        teleportTo(nuke:GetPivot())
        task.wait(0.2)
        grabNuke(nuke)
        task.wait(0.2)
        teleportTo(otherNuke:GetPivot())
        task.wait(0.2)
        requestMerge(otherNuke)
        task.wait(0.2)
    end

    function deleteNukeInHandIfShitty()
        local nukeInHand = getNukeInHand()
        if nukeInHand then
            safeDeleteNuke(nukeInHand)
        end
    end

    local deleteHeldShittyBombThread: thread? = nil;
    local DeleteHeldShittyBombToggle = GameTab:Toggle({
        Title = "Delete Held Shitty Bomb",
        Callback = function(state)
            if state then
                deleteNukeInHandIfShitty()
                deleteHeldShittyBombThread = task.spawn(function()
                    while true do
                        deleteNukeInHandIfShitty()
                        task.wait(0.2)
                    end
                end)
            elseif deleteHeldShittyBombThread ~= nil then
                task.cancel(deleteHeldShittyBombThread)
                deleteHeldShittyBombThread = nil
            end
        end
    })

    table.insert(toggleToDisableOnDestroy, DeleteHeldShittyBombToggle)

    GameTab:Slider({
        Title = "Consider Shitty <= (tier)",
        Value = {
            Min = 0,
            Max = MAX_BOMB_TIER,
            Default = shittyTier
        },
        Step = 1,
        Flag = "tier_slider",
        Callback = function(value)
            shittyTier = value
            config:Save()
        end
    })

    local BlockGameFromGrabbingNukeToggle

    local BlockGameFromGrabbingBetterNukeToggle = GameTab:Toggle({
        Title = "Block game from grabbing better nuke",
        Callback = function(state)
            if state then
                BlockGameFromGrabbingNukeToggle:Lock()
                blockFireServer.Pickup.SuperiorToTier = true
            else
                BlockGameFromGrabbingNukeToggle:Unlock()
                blockFireServer.Pickup.SuperiorToTier = false
            end
        end
    })

    BlockGameFromGrabbingNukeToggle = GameTab:Toggle({
        Title = "Block game from grabbing nuke",
        Callback = function(state)
            if state then
                BlockGameFromGrabbingBetterNukeToggle:Lock()
                blockFireServer.Pickup.SuperiorToTier = true
                blockFireServer.Pickup.InferiorToTier = true
                blockFireServer.Pickup.EqualToTier = true
                blockFireServer.Pickup.bypassedByExecutor = true
            else
                BlockGameFromGrabbingBetterNukeToggle:Unlock()
                blockFireServer.Pickup.SuperiorToTier = false
                blockFireServer.Pickup.InferiorToTier = false
                blockFireServer.Pickup.EqualToTier = false
                blockFireServer.Pickup.bypassedByExecutor = false
            end
        end
    })

    local BlockGameFromMergingNukeToggle = GameTab:Toggle({
        Title = "Block game from merging nuke",
        Callback = function(state)
            if state then
                blockFireServer.Merge.All = true
                blockFireServer.Merge.bypassedByExecutor = true
            else
                blockFireServer.Merge.All = false
                blockFireServer.Merge.bypassedByExecutor = false
            end
        end
    })

    function autoMerge()
        local nukes = getNukes()
        local hasMerged = false
        for i=1,#nukes,1 do
            local nuke = nukes[i]
            local currentTier = tonumber(nuke:GetAttribute("Tier"))
            if currentTier ~= MAX_BOMB_TIER and currentTier > shittyTier then
                for j=i+1,#nukes,1 do
                    local otherNuke = nukes[j]
                    if tonumber(otherNuke:GetAttribute("Tier")) == currentTier then
                        mergeNuke(nuke, otherNuke)
                        hasMerged = true
                        break
                    end
                end
            end
            if hasMerged then
                break
            end
        end
    end

    function autoDelete()
        local currentNuke = getNukeInHand()
        if currentNuke then
            if isShittyNuke(currentNuke) then
                deleteNuke(currentNuke)
            else
                dropNuke()
            end
        end

        scanShittyNukes()
    end

    function automaticAll(param: {autoDelete: boolean?, autoMerge: boolean?})
        return function()
            while true do
                if param.autoDelete then
                    autoDelete()
                    task.wait(0.2)
                end
                if param.autoMerge then
                    autoMerge()
                    task.wait(0.2)
                end
            end
        end
    end

    local AutoMergeNukeToggle

    local autoThread: thread? = nil
    local AutoDeleteShittyNukeToggle = GameTab:Toggle({
        Title = "Auto Delete Shitty Nuke",
        Callback = function (state)
            if state then
                setOriginalStateOfToggle({
                    DeleteHeldShittyBomb = DeleteHeldShittyBombToggle.Value,
                    BlockGameFromGrabbingNuke = BlockGameFromGrabbingNukeToggle.Value,
                    BlockGameFromGrabbingBetterNuke = BlockGameFromGrabbingBetterNukeToggle.Value,
                    BlockGameFromMergingNuke = BlockGameFromMergingNukeToggle.Value
                })
                DeleteHeldShittyBombToggle:Set(false)
                DeleteHeldShittyBombToggle:Lock()
                BlockGameFromGrabbingBetterNukeToggle:Unlock()
                BlockGameFromMergingNukeToggle:Set(true)
                BlockGameFromMergingNukeToggle:Lock()
                if BlockGameFromGrabbingBetterNukeToggle.Value then BlockGameFromGrabbingBetterNukeToggle:Set(false) end
                BlockGameFromGrabbingBetterNukeToggle:Lock()
                if not BlockGameFromGrabbingNukeToggle.Value then BlockGameFromGrabbingNukeToggle:Set(true) end
                BlockGameFromGrabbingNukeToggle:Lock()

                if (autoThread) then task.cancel(autoThread) end
                autoThread = task.spawn(automaticAll({autoMerge = AutoMergeNukeToggle.Value, autoDelete = true}))
            elseif autoThread ~= nil then
                task.cancel(autoThread)
                autoThread = nil
                if AutoMergeNukeToggle.Value then
                    autoThread = task.spawn(automaticAll({autoMerge = true}))
                    return
                end
                if not AutoMergeNukeToggle.Value then
                    DeleteHeldShittyBombToggle:Unlock()
                    BlockGameFromGrabbingBetterNukeToggle:Unlock()
                    BlockGameFromGrabbingNukeToggle:Unlock()
                    BlockGameFromGrabbingNukeToggle:Set(false)
                    BlockGameFromMergingNukeToggle:Unlock()
                    BlockGameFromMergingNukeToggle:Set(false)
                    if readOriginalStateOfToggle("DeleteHeldShittyBomb") then
                        DeleteHeldShittyBombToggle:Set(true)
                    end
                    if readOriginalStateOfToggle("BlockGameFromGrabbingBetterNuke") then
                        BlockGameFromGrabbingBetterNukeToggle:Set(true)
                    end
                    if readOriginalStateOfToggle("BlockGameFromGrabbingNuke") then
                        BlockGameFromGrabbingNukeToggle:Set(true)
                    end
                    if readOriginalStateOfToggle("BlockGameFromMergingNuke") then
                        BlockGameFromMergingNukeToggle:Set(true)
                    end
                end
            end
        end
    })
    
    table.insert(toggleToDisableOnDestroy, AutoDeleteShittyNukeToggle)

    AutoMergeNukeToggle = GameTab:Toggle({
        Title = "Auto Merge Nuke Above Tier > (tier)",
        Callback = function (state)
            if state then
                setOriginalStateOfToggle({
                    DeleteHeldShittyBomb = DeleteHeldShittyBombToggle.Value,
                    BlockGameFromGrabbingBetterNuke = BlockGameFromGrabbingBetterNukeToggle.Value,
                    BlockGameFromGrabbingNuke = BlockGameFromGrabbingNukeToggle.Value,
                    BlockGameFromMergingNuke = BlockGameFromMergingNukeToggle.Value
                })
                BlockGameFromGrabbingBetterNukeToggle:Unlock()
                if BlockGameFromGrabbingBetterNukeToggle.Value then BlockGameFromGrabbingBetterNukeToggle:Set(false) end
                BlockGameFromGrabbingBetterNukeToggle:Lock()
                DeleteHeldShittyBombToggle:Set(false)
                DeleteHeldShittyBombToggle:Lock()
                BlockGameFromMergingNukeToggle:Set(true)
                BlockGameFromMergingNukeToggle:Lock()
                if not BlockGameFromGrabbingNukeToggle.Value then BlockGameFromGrabbingNukeToggle:Set(true) end
                BlockGameFromGrabbingNukeToggle:Lock()
                if autoThread ~= nil then task.cancel(autoThread) end
                autoThread = task.spawn(automaticAll({autoMerge = true, autoDelete = AutoDeleteShittyNukeToggle.Value}))
            elseif autoThread ~= nil then
                task.cancel(autoThread)
                autoThread = nil
                if AutoDeleteShittyNukeToggle.Value then
                    autoThread = task.spawn(automaticAll({autoDelete = true}))
                end
                if not AutoDeleteShittyNukeToggle.Value then
                    BlockGameFromGrabbingNukeToggle:Unlock()
                    BlockGameFromGrabbingBetterNukeToggle:Unlock()
                    DeleteHeldShittyBombToggle:Unlock()
                    BlockGameFromMergingNukeToggle:Unlock()
                    BlockGameFromGrabbingNukeToggle:Set(false)
                    BlockGameFromMergingNukeToggle:Set(false)
                    if readOriginalStateOfToggle("DeleteHeldShittyBomb") then
                        DeleteHeldShittyBombToggle:Set(true)
                    end
                    if readOriginalStateOfToggle("BlockGameFromGrabbingBetterNuke") then
                        BlockGameFromGrabbingBetterNukeToggle:Set(true)
                    end
                    if readOriginalStateOfToggle("BlockGameFromGrabbingNuke") then
                        BlockGameFromGrabbingNukeToggle:Set(true)
                    end
                    if readOriginalStateOfToggle("BlockGameFromMergingNuke") then
                        BlockGameFromMergingNukeToggle:Set(true)
                    end
                end
            end
        end
    })
    
    table.insert(toggleToDisableOnDestroy, AutoMergeNukeToggle)
end

-- /* Universal Tabl */ --
do
    local UniversalTab = Window:Tab({
        Title = "Universal",
        Icon = "sparkles",
        IconColor = Color3.fromRGB(0, 150, 135), -- custom icon color. optional
        IconShape = "Square",
    })

    local savedWaypoints: {CFrame} = {}
    local teleportSpeed = 1.5

    local function beautifyPosition(position)
        return `{math.round(position.X)}, {math.round(position.Y)}, {math.round(position.Z)}`
    end

    local positionParagraph = UniversalTab:Paragraph({
        Title = "Current Position",
        Desc = "Unknown"
    })

    local updateCurrentPositionThread = task.spawn(function()
        while true do
            local position = localPlayer.Character:GetPivot().Position
            positionParagraph:SetDesc(beautifyPosition(position))
            task.wait(0.5)
        end
    end)

    table.insert(threadToCancelOnDestroy, updateCurrentPositionThread)

    local updateWaypointSection: () -> ()

    UniversalTab:Button({
        Title = "Save Waypoint",
        Icon = "save",
        Callback = function()
            local cFrame = localPlayer.Character:GetPivot()
            if cFrame then
                table.insert(savedWaypoints, cFrame)
                updateWaypointSection()
                WindUI:Notify({
                    Title = "Waypoint Saved",
                    Content = tostring(cFrame.Position),
                    Duration = 3
                })
            end
        end
    })

    local teleportThread = nil

    local TeleportToggle = UniversalTab:Toggle({
        Title = "TP Through Waypoint",
        Callback = function(state)
            if state then
                teleportThread = task.spawn(function()
                    while true do
                        for i, waypoint in ipairs(savedWaypoints) do
                            teleportTo(waypoint)
                            task.wait(teleportSpeed)
                        end
                    end
                end)
            elseif teleportThread ~= nil then
                task.cancel(teleportThread)
                teleportThread = nil
            end
        end
    })

    table.insert(toggleToDisableOnDestroy, TeleportToggle)

    UniversalTab:Slider({
        Title = "TP Speed in seconds",
        Value = {
            Min = 0, -- minimum value
            Max = 5, -- maximum value
            Default = teleportSpeed -- initial value
        },
        Step = 0.25,
        Flag = "tp_speed_slider",
        Callback = function(speed)
            teleportSpeed = speed
            config:Save()
        end
    })

    local WaypointSection = UniversalTab:Section({
        Title = "Saved Waypoints",
        Box = true,
        BoxBorder = true,
    })

    local ClearButton = WaypointSection:Button({
        Title = "Clear All Waypoints",
        Icon = "trash-2",
        Callback = function()
            Window:Dialog({
                Icon = "alert-circle", -- lucide icon or "rbxassetid://". optional
                Title = "Confirm Delete",
                IconThemed = true, -- use theme colors for icon. optional
                Content = "This action cannot be undone.",
                Buttons = {
                    {
                        Title = "Delete",
                        Icon = "trash-2", -- button icon. optional
                        Variant = "Destructive", -- "Primary", "Secondary", "Destructive", "Tertiary". optional
                        Callback = function()
                            table.clear(savedWaypoints)
                            updateWaypointSection()
                        end
                    },
                    {
                        Title = "Cancel",
                        Icon = "x", -- optional
                        Variant = "Secondary", -- optional
                    }
                }
            })
        end
    })

    local sectionButtons = {}

    updateWaypointSection = function()
        for i, sectionButton in ipairs(sectionButtons) do
            sectionButton:Destroy()
        end
        sectionButtons = {}

        for i, root in ipairs(savedWaypoints) do
            table.insert(sectionButtons, WaypointSection:Button({
                Title = `Delete waypoint {i}`,
                Desc = beautifyPosition(root.Position),
                Icon = "trash-2",
                Callback = function()
                    table.remove(savedWaypoints, i)
                    updateWaypointSection()
                end
            }))
        end

        if #savedWaypoints == 0 then
            TeleportToggle:Set(false)
            TeleportToggle:Lock()
            ClearButton:Lock()
        else
            TeleportToggle:Unlock()
            ClearButton:Unlock()
        end
    end

    updateWaypointSection()
end

Window:Tag({
    Title = SCRIPT_VERSION,
    Color = Color3.fromRGB(0, 167, 42),
})

Window:OnDestroy(function()
    restoreHookedFireServer()
    originalStateOfToggle.BlockGameFromGrabbingBetterNukeToggle = false
    originalStateOfToggle.DeleteHeldShittyBombToggle = false
    originalStateOfToggle.BlockGameFromGrabbingNuke = false
    for _, thread in ipairs(threadToCancelOnDestroy) do
        if not thread then continue end
        task.cancel(thread)
    end
    for _, toggle in ipairs(toggleToDisableOnDestroy) do
        toggle:Set(false)
    end

    for _, rbxConnection in ipairs(rbxConnections) do
        rbxConnection:Disconnect()
    end

    getgenv().UI = nil
end)

getgenv().UI = Window