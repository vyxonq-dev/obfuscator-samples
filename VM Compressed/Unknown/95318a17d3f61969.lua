--// CHECKPOINTS v1.0
--// by 9c

if _G.CHECKPOINT_RUNNING then
    _G.CHECKPOINT_RUNNING = false
    task.wait(0.3)
end
_G.CHECKPOINT_RUNNING = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Checkpoints v1.0",
    LoadingTitle = "Checkpoints",
    LoadingSubtitle = "by 9c",
    ConfigurationSaving = { Enabled = false },
    Theme = "Default",
    KeySystem = true,
    KeySettings = {
        Title = "Checkpoints",
        Subtitle = "by 9c",
        Note = "Check the script description for the key",
        FileName = "CheckpointKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"9Ace"}
    }
})

--// SERVICES
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local P                = Players.LocalPlayer

--// WAYPOINTS
local waypoints = {}
local wpNames   = {}
for i = 1, 10 do
    waypoints[i] = nil
    wpNames[i]   = "Checkpoint " .. i  -- default name
end

--// HELPERS
local function root()
    local c = P.Character
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function notify(title, content)
    Rayfield:Notify({ Title = title, Content = content, Duration = 2 })
end

--// SAVE
local function save(slot)
    local r = root()
    if not r then notify("Checkpoint " .. slot, "No character found"); return end
    waypoints[slot] = r.Position
    local pos = r.Position
    notify(wpNames[slot] .. " Saved", math.floor(pos.X) .. ", " .. math.floor(pos.Y) .. ", " .. math.floor(pos.Z))
end

--// GOTO
local function goto(slot)
    if not waypoints[slot] then
        notify(wpNames[slot], "Not saved yet")
        return
    end
    local r = root()
    if not r then notify(wpNames[slot], "No character found"); return end
    r.CFrame = CFrame.new(waypoints[slot] + Vector3.new(0, 4, 0))
    local pos = waypoints[slot]
    notify("Teleported  —  " .. wpNames[slot], math.floor(pos.X) .. ", " .. math.floor(pos.Y) .. ", " .. math.floor(pos.Z))
end

--// CLICK TP
local clickTPEnabled  = false
local clickTPConn     = nil
local hoverConn       = nil
local clickHighlight  = nil

local function enableClickTP()
    clickHighlight = Instance.new("SelectionBox")
    clickHighlight.Color3         = Color3.fromRGB(180, 60, 255)
    clickHighlight.LineThickness  = 0.04
    clickHighlight.Parent         = workspace

    hoverConn = RunService.RenderStepped:Connect(function()
        if not clickTPEnabled then hoverConn:Disconnect(); return end
        local mouse = P:GetMouse()
        clickHighlight.Adornee = mouse.Target or nil
    end)

    clickTPConn = UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mouse = P:GetMouse()
            if mouse.Target and mouse.Hit then
                local r = root()
                if r then
                    r.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 4, 0))
                    notify("Click TP", "Teleported to " .. mouse.Target.Name)
                end
            end
        end
    end)
end

local function disableClickTP()
    if clickTPConn   then clickTPConn:Disconnect();   clickTPConn   = nil end
    if hoverConn     then hoverConn:Disconnect();     hoverConn     = nil end
    if clickHighlight then clickHighlight:Destroy();  clickHighlight = nil end
end

--// REMOTES
local marketR = nil
local Remotes = game.ReplicatedStorage:FindFirstChild("Remotes")
if Remotes then
    pcall(function() marketR = Remotes:WaitForChild("Market", 5) end)
end

--// SHOP FINDER
-- Searches workspace for the Glazier Photeinos market object
local shopName    = "Glazier Photeinos"  -- editable via input
local itemName    = "Tools"              -- editable via input
local buyCount    = 3                    -- editable via slider
local autoBuyLoop = false
local autoBuyNonce = 0

local function findShop(name)
    local lname = name:lower()
    -- First try Civilizations path (some servers use this)
    local civs = workspace:FindFirstChild("Civilizations")
    if civs then
        for _, civ in pairs(civs:GetChildren()) do
            local markets = civ:FindFirstChild("Markets")
            if markets then
                for _, market in pairs(markets:GetChildren()) do
                    if market.Name:lower():find(lname) then return market end
                end
            end
        end
    end
    -- Full deep search of workspace — handles Shopkeeper NPCs, shops anywhere
    local function search(parent, depth)
        if depth > 6 then return nil end
        for _, child in pairs(parent:GetChildren()) do
            if child.Name:lower():find(lname) then return child end
            local found = search(child, depth + 1)
            if found then return found end
        end
        return nil
    end
    return search(workspace, 0)
end

local function buyFromShop(shop, item)
    if not marketR then
        notify("Shop", "Market remote not found")
        return false
    end
    local ok = pcall(function()
        marketR:FireServer(shop, "BuyItem", item)
    end)
    return ok
end

local function runShopBuy()
    local shop = findShop(shopName)
    if not shop then
        notify("Shop", "Could not find: " .. shopName)
        -- print workspace top level to help debug
        print("=== Workspace children ===")
        for _, c in pairs(workspace:GetChildren()) do
            print(c.Name, c.ClassName)
        end
        return
    end
    notify("Shop Found", shop.Name .. " — buying " .. buyCount .. "x " .. itemName)
    local bought = 0
    for i = 1, buyCount do
        local ok = pcall(function()
            marketR:FireServer(shop, "BuyItem", itemName)
        end)
        if ok then bought += 1 end
        task.wait(0.35)
    end
    notify("Shop Done", "Bought " .. bought .. "x " .. itemName)
end

local function startAutoBuy()
    autoBuyNonce += 1
    local myNonce = autoBuyNonce
    task.spawn(function()
        while autoBuyLoop and myNonce == autoBuyNonce do
            runShopBuy()
            task.wait(2) -- wait before buying again
        end
    end)
end

--// TAB
local Tab = Window:CreateTab("Checkpoints", 6031070990)

Tab:CreateSection("Waypoints")
Tab:CreateLabel("Save your position then teleport back anytime")

for i = 1, 10 do
    Tab:CreateSection("Checkpoint " .. i)

    Tab:CreateInput({
        Name = "Name",
        PlaceholderText = "Checkpoint " .. i,
        RemoveTextAfterFocusLost = false,
        Callback = function(text)
            if text and text ~= "" then
                wpNames[i] = text
            else
                wpNames[i] = "Checkpoint " .. i
            end
        end
    })

    Tab:CreateButton({
        Name = "Save",
        Callback = function() save(i) end
    })
    Tab:CreateButton({
        Name = "Go To",
        Callback = function() goto(i) end
    })
end

--// CLICK TP TAB
local ClickTab = Window:CreateTab("Click TP", 6031071053)

ClickTab:CreateSection("Click to Teleport")
ClickTab:CreateLabel("Enable then left click anywhere to teleport there")

ClickTab:CreateToggle({
    Name = "Click TP",
    CurrentValue = false,
    Callback = function(v)
        clickTPEnabled = v
        if v then
            enableClickTP()
            notify("Click TP", "On  —  left click to teleport")
        else
            disableClickTP()
            notify("Click TP", "Off")
        end
    end
})

ClickTab:CreateSection("Info")
ClickTab:CreateLabel("Hover over any surface to preview")
ClickTab:CreateLabel("Purple outline shows where you will land")

--// SHOP TAB
local ShopTab = Window:CreateTab("Shop", 6031075938)

ShopTab:CreateSection("Glazier Photeinos")
ShopTab:CreateLabel("Auto buys items from a specific shop")

ShopTab:CreateSection("Settings")

ShopTab:CreateInput({
    Name = "Shop Name",
    PlaceholderText = "Glazier Photeinos",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        if text and text ~= "" then shopName = text end
    end
})

ShopTab:CreateInput({
    Name = "Item to Buy",
    PlaceholderText = "Tools",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        if text and text ~= "" then itemName = text end
    end
})

ShopTab:CreateSlider({
    Name = "Buy Count (per run)",
    Range = {1, 20},
    Increment = 1,
    CurrentValue = 3,
    Callback = function(v) buyCount = v end
})

ShopTab:CreateSection("Buy")

ShopTab:CreateButton({
    Name = "Buy Now  (" .. buyCount .. "x)",
    Callback = function()
        notify("Shop", "Buying " .. buyCount .. "x " .. itemName .. "...")
        task.spawn(runShopBuy)
    end
})

ShopTab:CreateToggle({
    Name = "Auto Buy Loop",
    CurrentValue = false,
    Callback = function(v)
        autoBuyLoop = v
        if v then
            startAutoBuy()
            notify("Auto Buy", "On  —  buying " .. buyCount .. "x " .. itemName .. " on loop")
        else
            autoBuyNonce += 1
            notify("Auto Buy", "Off")
        end
    end
})

ShopTab:CreateSection("Remote Buy")
ShopTab:CreateLabel("Fires market remote directly  —  no TP needed")

ShopTab:CreateButton({
    Name = "Find Shop in Workspace",
    Callback = function()
        local shop = findShop(shopName)
        if shop then
            -- build full path
            local path = shop.Name
            local cur = shop.Parent
            while cur and cur ~= workspace do
                path = cur.Name .. " > " .. path
                cur = cur.Parent
            end
            print("Shop found: workspace > " .. path)
            notify("Shop Found", shop.Name)
        else
            -- print all workspace children to console to help find it
            print("=== Could not find: " .. shopName .. " ===")
            print("Workspace children:")
            for _, c in pairs(workspace:GetChildren()) do
                print("  " .. c.Name .. " [" .. c.ClassName .. "]")
            end
            notify("Not Found", "Check F9 console for workspace list")
        end
    end
})

Rayfield:Notify({ Title = "Checkpoints v1.0", Content = "Loaded  —  by 9c", Duration = 3 })
