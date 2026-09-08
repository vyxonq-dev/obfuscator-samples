-- the most advanced kfs v2 script that ever existed.
-- made with <3 by debrainers
-- if you run into issues you can dm me btw (debrainers on discord)
local floorPosition = Vector3.new(-30, 994, 1) -- X, Y, Z coordinates
local floorSize = Vector3.new(50, 1, 50) -- width, height, depth

-- this is so people cant really bypass originally. but i scrapped the whole idea
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    error("LocalPlayer not found. Ensure the script is executed properly.")
end

-- create the floor
local floor = Instance.new("Part")
floor.Size = floorSize
floor.Position = floorPosition
floor.Anchored = true
floor.BrickColor = BrickColor.new("Bright blue")
floor.Material = Enum.Material.SmoothPlastic
floor.Name = "Floor"
floor.Parent = workspace

print("Autofarm idle location setup!!")




-- booting the library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

-- create a Rayfield Window
local Window = Rayfield:CreateWindow({
   Name = "KFS - *debrainers* on discord", 
   Icon = 0, -- Optional icon or set 0 to remove
   LoadingTitle = "crazy ware",
   LoadingSubtitle = "by debrainers the best?!",
   Theme = "Ocean", -- set to "Ocean" theme cus its most sigma
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Optional custom folder for saving
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "4rHwVUAw",
      RememberJoins = true
   },
    KeySystem = false, -- Set to true if you want to use a key system
    KeySettings = {
       Title = "Debrainers kfs key system",
       Subtitle = "Open ticket or dm debrainers for whitelist",
       Note = "Open ticket in discord or dm *debrainers* for key + whitelist", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"key website. just set the uh key system to false or true whateva"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
}
})

-- NOW COMES MAIN SCRIPT!!!



 -- holy tabs. dont change any of this fr or itll look ugly :*

local Tab = Window:CreateTab("Autofarm", "banknote")
local Tab2 = Window:CreateTab("Logger", "bell-ring")

local Tab4 = Window:CreateTab("Jackpot", "dices")
local CrashTab = Window:CreateTab("Crash", "trending-up")


local Divider = Tab4:CreateDivider()
local Paragraph = Tab4:CreateParagraph({Title = "Jackpot explanation", Content = "put the amount you want to input into the jackpot on the slider. YOU NEED TO HAVE THAT AMOUNT WITHDRAWN FROM UR BANK! after that youll be set."})
local Divider = Tab4:CreateDivider()

local Divider = Tab2:CreateDivider()
local Paragraph = Tab2:CreateParagraph({Title = "Webhook explanation", Content = "paste your DISCORD webhook into the bar saying *Paste your webhook URL here* and enable it. after that the webhook will send a message every 2.5 minutes."})
local Divider = Tab2:CreateDivider()

local Divider = Tab:CreateDivider()
local Paragraph = Tab:CreateParagraph({Title = "Autofarm explanation", Content = "this autofarm currently bypasses every anti cheat measure. just enable it and you are set. DISCLAIMER. SCRIPT DOES NOT COLLECT ANY CORRUPTED FARMS ON THE BIG FLAT AREA."})
local Divider = Tab:CreateDivider()
local Tab5 = Window:CreateTab("Teleport", "bluetooth")
local Tab3 = Window:CreateTab("NOT DONE YET *rage*", "swords")
local Divider = Tab5:CreateDivider()
local Paragraph = Tab5:CreateParagraph({Title = "Teleport explanation", Content = "ts is literally called teleport thats all you need to know bro. i need to add a paragraph on here tho or ts will look ugly ong"})

local Divider = Tab3:CreateDivider()
local Paragraph = Tab3:CreateParagraph({Title = "Spin explanation", Content = "if ur changing spin speed toggle spin off and on to apply new speed."})
local Divider = Tab3:CreateDivider()

-- variables!!!!!!!!!!!!!!
local scriptActive = false
local autoAttack = false
local teleportPosition = Vector3.new(-30, 999, 1)
local defaultTeleportPosition = Vector3.new(-30, 60.5, -6)
local player = game.Players.LocalPlayer
local bankEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("bank")
local cashInAmount = 500 -- default value

-- teleport toggle
local Toggle = Tab:CreateToggle({
   Name = "Autofarm",
   CurrentValue = false,
   Flag = "TeleportToggle",
   Callback = function(Value)
      scriptActive = Value
      if not scriptActive then
         player.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
      end
   end,
})

-- Define teleport locations
local teleportLocations = {
    Vector3.new(-21.06, 61.95, 9.73),
    Vector3.new(14.94, 61.95, 9.73),
    Vector3.new(-14.96, 61.95, -9.67), -- main location just to be clear
    Vector3.new(20.94, 61.95, 9.73)
}

local mainTeleportPosition = Vector3.new(-14.96, 61.95, -9.67) -- main position to cash in and what not
local fallbackTeleportPosition = Vector3.new(-30, 999, 1)

-- get player
local player = game.Players.LocalPlayer

-- randomly select a teleport location
local function getRandomTeleportLocation()
    return teleportLocations[math.random(#teleportLocations)]
end

-- slider for spree cash in 4 autofarm
local CashInSlider = Tab:CreateSlider({
   Name = "Spree Cash-In Amount?",
   Range = {1, 10000},
   Increment = 1,
   Suffix = "Spree",
   CurrentValue = 500,
   Flag = "CashInSlider",
   Callback = function(Value)
      cashInAmount = Value
      print("Cash-In Amount dynamically updated to: " .. Value)
   end,
})
local Divider = Tab5:CreateDivider()
-- button to teleport to uh random spawn location but in a complicated way basically.
Tab5:CreateButton({
    Name = "Teleport to spawn location",
    Callback = function()
        local randomLocation = getRandomTeleportLocation()
        player.Character.HumanoidRootPart.CFrame = CFrame.new(randomLocation)
        print("Teleported to a random default position: " .. tostring(randomLocation))
    end,
})

-- teleport script logic
local targetPosition = Vector3.new(73.48, 76.45, 885.14) -- replace with them target coordinates
local returnPosition = Vector3.new(-14.96, 61.95, -9.67) -- replace with them return coordinates

local function teleportToPosition(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

local function faceNorth()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character.HumanoidRootPart
        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position) * CFrame.Angles(0, math.rad(90), 0)
    end
end

local function equipItem(itemName)
    local player = game.Players.LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        local item = backpack:FindFirstChild(itemName)
        if item then
            item.Parent = player.Character
            return item
        end
    end
    return nil
end

local Divider = Tab:CreateDivider()
local Paragraph = Tab:CreateParagraph({Title = "Tower farm explanation", Content = "buy any amount of the CORRUPTED plant and itll automatically build a tower upon pressing. *SPEED IS OPTIMIZED TO NOT BE DETECTED*"})
local Divider = Tab:CreateDivider()

local function clickToPlace()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, nil, 0)
    wait(0.1)
    VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, nil, 0)
end

local function performTask()
    teleportToPosition(targetPosition)
    faceNorth()

    local player = game.Players.LocalPlayer
    local backpack = player:FindFirstChild("Backpack")

    while backpack and backpack:FindFirstChild("Corrupted Plant") do
        local item = equipItem("Corrupted Plant")
        if item then
            wait(0.2)
            clickToPlace()
            wait(0.2)
        else
            break
        end
    end

    wait(1)
    teleportToPosition(returnPosition)
end



local Toggle = Tab:CreateButton({
   Name = "Tower farm builder",
   CurrentValue = false,
   Callback = function()
        performTask()
   end
})


-- the bounds for the restricted area
local minCoords = Vector3.new(-1478.92, -3, -442.57)
local maxCoords = Vector3.new(-592.81, 10.0, 443.32)

-- function to check if a position is within the restricted bounds so not on that big ass baseplate
local function isWithinBounds(position)
    return position.X >= minCoords.X and position.X <= maxCoords.X
       and position.Y >= minCoords.Y and position.Y <= maxCoords.Y
       and position.Z >= minCoords.Z and position.Z <= maxCoords.Z
end

-- teleport player to the freaky ass speedbox
local function teleportPlayer()
    if not scriptActive then return end
    local targetPart = nil

    -- search for parts named speedbox freaky as fuck fr
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Name == "speedbox" then
            -- Check if the part is in the correct group or named "Corrupted"
            if part.Parent and part.Parent:IsA("Model") and 
               (part.Parent:FindFirstChild("Group") and part.Parent.Group.Value == "Corrupted" or
                part.Parent.Name == "Corrupted") then
                -- Only target parts outside the restricted bounds
                if not isWithinBounds(part.Position) then
                    targetPart = part
                    break
                end
            end
        end
    end

    -- teleport to speedboxes
    if targetPart then
        player.Character:SetPrimaryPartCFrame(targetPart.CFrame)
    else
        player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
    end
end

-- teleport and transfer! freaky isnt it. just a bit spammy cus many prints
local function teleportAndTransfer()
    if player.leaderstats and player.leaderstats.Spree and player.leaderstats.Spree.Value >= cashInAmount then
        -- teleport to the main pos
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mainTeleportPosition)
        wait(1)

        if player.Character.HumanoidRootPart.Position == mainTeleportPosition then
            bankEvent:FireServer(1, cashInAmount)
            print("Successfully transferred " .. cashInAmount .. " to the bank.")
        else
            warn("Teleportation unsuccessful. Trying again.")
            teleportAndTransfer()
        end
    else
        warn("Not enough Spree to transfer.")
    end
end



-- webhook logger
local webhookURL = "" -- Default webhook URL


-- toggle to enable/disable webhooks
local loggingEnabled = false
Tab2:CreateToggle({
    Name = "Enable Webhook Logging",
    CurrentValue = false,
    Flag = "WebhookToggle",
    Callback = function(Value)
        loggingEnabled = Value
        if Value then
            print("Webhook logging enabled.")
        else
            print("Webhook logging disabled.")
        end
    end,
})

-- input 4 webhook
Tab2:CreateInput({
    Name = "Set Webhook URL",
    CurrentValue = "",
    PlaceholderText = "Paste your webhook URL here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        webhookURL = Text
        print("Webhook URL updated: " .. Text)
    end,
})

-- count corrupted plants
local function countCorrupted()
    local count = 0
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Corrupted" then
            count = count + 1
        end
    end
    return count
end

-- function to send webhook yessir
local function sendWebhookLog()
    if not webhookURL or webhookURL == "" then
        warn("No webhook URL set.")
        return
    end

    if not loggingEnabled then
        warn("Webhook logging is disabled.")
        return
    end

    local playe2r = game:GetService("Players").LocalPlayer
    local spreeAmount = player:FindFirstChild("SavedSpree") and player.SavedSpree.Value or 0
    local corruptedCount = countCorrupted()
    local playerCount = #game:GetService("Players"):GetPlayers()

    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "**debrainers kfs script**",
            ["description"] = "extracted information:",
            ["color"] = tonumber(0x2B6BE4),
            ["fields"] = {
                {
                    ["name"] = "Username:",
                    ["value"] = playe2r.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "User ID:",
                    ["value"] = tostring(playe2r.UserId),
                    ["inline"] = true
                },
                {
                    ["name"] = "Spree (Bank):",
                    ["value"] = tostring(spreeAmount),
                    ["inline"] = true
                },
                {
                    ["name"] = "Corrupted Count:",
                    ["value"] = tostring(corruptedCount),
                    ["inline"] = true
                },
                {
                    ["name"] = "AUTOFARMING?:",
                    ["value"] = tostring(scriptActive),
                    ["inline"] = true
                },
                {
                    ["name"] = "Players in Server:",
                    ["value"] = tostring(playerCount),
                    ["inline"] = true
                },
            },
        }}
    }

    local success, error = pcall(function()
        local request = syn and syn.request or http_request
        if request then
            request({
                Url = webhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = game:GetService("HttpService"):JSONEncode(data)
            })
        else
            warn("No HTTP request function available.")
        end
    end)

    if not success then
        warn("Failed to send webhook log: " .. tostring(error))
    end
end

-- periodic webhook log sender??! i know this couldve been managed 10 times better but ugh im no pro fr
task.spawn(function()
    while wait(150) do -- 5 minutes interval
        if loggingEnabled then
            sendWebhookLog()
        end
    end
end)





-- CREATING BETTING SECTION HELL YEA
local BettingSection = Tab4:CreateSection("Jackpot Betting")

-- variables once again ughh
local betAmount = 1 -- Default bet amount
local snipingEnabled = false -- Toggle for sniping
local scriptActiv2 = false -- Prevents re-triggering during execution
local jackpotInfo = game:GetService("ReplicatedStorage"):WaitForChild("JackpotInfo")
local createBetEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("createBet")
local player = game.Players.LocalPlayer

-- function to place bet
local function placeBet(amount)
    if player.leaderstats and player.leaderstats.Spree and player.leaderstats.Spree.Value >= amount then
        createBetEvent:FireServer(amount)
        print("Bet placed: " .. amount)
    else
        warn("Not enough Spree to place the bet.")
    end
end

-- function to monitor da jackpot and whateva
local function monitorJackpot()
    if scriptActiv2 then
        warn("Script is already running.")
        return
    end

    scriptActiv2 = true
    while snipingEnabled do
        local timeLeft = jackpotInfo:WaitForChild("timeLeft").Value
        if timeLeft == 1 then
            placeBet(betAmount)
            break
        end
        wait(0.1) -- btw ts is needed to not snipe to early and not to late
    end
    scriptActiv2 = false
end

-- slider for bet amount
Tab4:CreateSlider({
    Name = "Bet Amount",
    Range = {1, 100000}, -- Min and max bet
    Increment = 100, -- Step size
    Suffix = "Spree",
    CurrentValue = betAmount,
    Flag = "BetSlider",
    Callback = function(Value)
        betAmount = Value
        print("Updated bet amount to: " .. Value)
    end
})


-- toggle for sniping
Tab4:CreateToggle({
    Name = "Enable Jackpot Sniping",
    CurrentValue = snipingEnabled,
    Flag = "SnipingToggle",
    Callback = function(Value)
        snipingEnabled = Value
        if snipingEnabled then
            print("Sniping enabled. Monitoring timeLeft...")
            monitorJackpot()
        else
            print("Sniping disabled.")
        end
    end
})

Tab4:CreateButton({
    Name = "Place One-Time Bet",
    Callback = function()
        placeBet(betAmount)
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    if scriptActive then
        teleportPlayer()
        teleportAndTransfer()
    end
    if autoAttack then
        autoAttackFunction()
    end
end)




-- creating da tab


local Divider = CrashTab:CreateDivider()
local Paragraph = CrashTab:CreateParagraph({Title = "Crash explanation", Content = "put the amount you want to bet into the Crash on the slider. YOU NEED TO HAVE THAT AMOUNT WITHDRAWN FROM UR BANK! after that youll be set. *you can auto bet from anywhere on the map*"})
local Divider = CrashTab:CreateDivider()

local BettingSection = CrashTab:CreateSection("Status display")

-- labels for bet info
local MultiplierLabel = CrashTab:CreateLabel("Current Multiplier: Loading...")
local StatusLabel = CrashTab:CreateLabel("Status: Loading...")
local TimeLeftLabel = CrashTab:CreateLabel("Time Left: Loading...")

local Divider = CrashTab:CreateDivider()

local BettingSection = CrashTab:CreateSection("Actual crash controls")
-- creating a slider for da cashout
local CashoutMultiplier = 2.0
local CashoutSlider = CrashTab:CreateSlider({
   Name = "Cashout Multiplier",
   Range = {0.5, 6},
   Increment = 0.01,
   Suffix = "x",
   CurrentValue = 2.0,
   Flag = "CashoutMultiplier",
   Callback = function(Value)
      CashoutMultiplier = Value
   end,
})

-- creating a slider for da bet amount
local BetAmount = 10
local BetAmountSlider = CrashTab:CreateSlider({
   Name = "Bet Amount",
   Range = {1, 1000},
   Increment = 1,
   Suffix = "Spree",
   CurrentValue = 10,
   Flag = "BetAmount",
   Callback = function(Value)
      BetAmount = Value
   end,
})

-- toggle for auto betting
local AutoBet = false
local AutoBetToggle = CrashTab:CreateToggle({
   Name = "Auto Bet",
   CurrentValue = false,
   Flag = "AutoBet",
   Callback = function(Value)
      AutoBet = Value
   end,
})

-- button for manual bet
CrashTab:CreateButton({
   Name = "Place Bet",
   Callback = function()
      placeBet(BetAmount)
   end,
})

-- function to place a bet btw i forgot to mention ts is for jackpot it was mistake adding it here and also adding it twice? freaky?? idk???
local function placeBet(amount)
   local player = game.Players.LocalPlayer
   local crashBet_upvr = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("crashBet")

   if player.leaderstats and player.leaderstats.Spree and player.leaderstats.Spree.Value >= amount then
      crashBet_upvr:FireServer(1, amount)
      print("Bet placed: " .. amount .. " Spree")
   else
      warn("Not enough Spree to place the bet.")
   end
end

-- flag to track if a bet has been placed in the current round
local betPlaced = false

-- monitoring game info cutely
spawn(function()
   local CrashFolder = game:GetService("ReplicatedStorage"):WaitForChild("Crash")
   while task.wait(0.1) do
      MultiplierLabel:Set("Current Multiplier: " .. string.format("%.2f", CrashFolder.currentMultiplier.Value) .. "x")
      StatusLabel:Set("Status: " .. CrashFolder.status.Value)
      if CrashFolder:FindFirstChild("timeLeft") then
         local timeLeft = CrashFolder.timeLeft.Value
         TimeLeftLabel:Set("Time Left: " .. timeLeft .. "s")
         
         -- place a bet only once when Time Left is 10 seconds ion wanna manage it in any other way
         if AutoBet and timeLeft == 10 and not betPlaced then
            placeBet(BetAmount)
            betPlaced = true -- Set flag to true to prevent further bets
         end

         -- auto withdraw when multiplier reaches whateva
         if CrashFolder.currentMultiplier.Value >= CashoutMultiplier and not betPlaced then
            local crashBet_upvr = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("crashBet")
            crashBet_upvr:FireServer(2) -- This triggers the withdrawal
            betPlaced = true -- Prevent multiple withdrawals in one round
         end

         -- reset the bet flag at the start of a new round
         if timeLeft == 0 then
            betPlaced = false
         end
      end
   end
end)


Tab5:CreateButton({
    Name = "Teleport to Castle",
    Callback = function()
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(5.44, 3.00, 925.41))
    end
})
Tab5:CreateButton({
    Name = "Teleport to Top Edge 1",
    Callback = function()
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-120.96, 76.45, 1017.29))
    end
})
Tab5:CreateButton({
    Name = "Teleport to Top Edge 2",
    Callback = function()
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(126.71, 76.45, 1013.43))
    end
})

-- spin bot controlling
local SectionSpin = Tab3:CreateSection("Spin Control")
local spinSpeed = 20
local spinning = false

Tab3:CreateSlider({
    Name = "Spin Speed",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = spinSpeed,
    Callback = function(Value)
        spinSpeed = Value
        local character = game.Players.LocalPlayer.Character
        if spinning and character then
            local spin = character:FindFirstChild("Spinning")
            if spin then
                spin.AngularVelocity = Vector3.new(0, spinSpeed, 0)
            end
        end
    end
})

Tab3:CreateToggle({
    Name = "Spin bot",
    CurrentValue = false,
    Flag = "SpinToggle",
    Callback = function(Value)
        spinning = Value
        local character = game.Players.LocalPlayer.Character

        if spinning then
            if character and character.PrimaryPart then
                local spin = Instance.new("BodyAngularVelocity")
                spin.Name = "Spinning"
                spin.Parent = character.PrimaryPart
                spin.MaxTorque = Vector3.new(0, math.huge, 0)
                spin.AngularVelocity = Vector3.new(0, spinSpeed, 0)
            end
        else
            if character then
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BodyAngularVelocity") and v.Name == "Spinning" then
                        v:Destroy()
                    end
                end
            end
        end
    end
})
local Divider = Tab3:CreateDivider()
local Paragraph = Tab3:CreateParagraph({Title = "Telekineses explanation", Content = "PC ONLY controls: *Q & E - bring closer and further* *R - rotates block* *T - Tilts Block* *Y - Throws Block* *if ur on a qwertz layout its Z not Y for tilting the block*"})
local Divider = Tab3:CreateDivider()
Tab3:CreateButton({
   Name = "TELEKINESES *pc only*",
   Callback = function()
-- create sections for different controls
loadstring(game:HttpGet('https://raw.githubusercontent.com/essyyyyy/kfs/refs/heads/script/telekines'))()
end
})

local Divider = Tab3:CreateDivider()
local Paragraph = Tab3:CreateParagraph({Title = "Reach explanation", Content = "this can be set to any range but might fling you if youve set this to far. only reach method working right now. would recommend sphere instead of line"})
local Divider = Tab3:CreateDivider()

-- variables
local active = true
local trueActive = true
local reachType = "Sphere"
local dmgEnabled = true
local visualizerEnabled = false
local reach = 3.5

local ReachSection = Tab3:CreateSection("Reach Settings")
-- gui controls is needed btw and lowkey skidded cus i aint scripting ts myself. it works was just changed a bit so be happy
Tab3:CreateInput({
   Name = "Reach Distance",
   PlaceholderText = tostring(reach),
   RemoveTextAfterFocusLost = false,
   Callback = function(value)
      reach = tonumber(value) or 3.5
   end,
})

Tab3:CreateButton({
   Name = "Toggle Reach Shape *CLICK MULTIPLE TIMES*",
   Callback = function()
      reachType = reachType == "Sphere" and "Line" or "Sphere"
      Rayfield:Notify({
         Title = "Reach Shape Changed",
         Content = "Current Shape: " .. reachType,
         Duration = 3,
      })
   end,
})

local DamageSection = Tab3:CreateSection("Damage Settings")

Tab3:CreateToggle({
   Name = "Enable Damage",
   CurrentValue = dmgEnabled,
   Flag = "DamageToggle",
   Callback = function(value)
      dmgEnabled = value
   end,
})


local VisualizerSection = Tab3:CreateSection("Visualizer Settings")
Tab3:CreateToggle({
   Name = "Enable Visualizer",
   CurrentValue = visualizerEnabled,
   Flag = "VisualizerToggle",
   Callback = function(value)
      visualizerEnabled = value
   end,
})

Tab3:CreateButton({
   Name = "Kill Script",
   Callback = function()
      trueActive = false
      Rayfield:Destroy()
   end,
})

-- visualizer setup so u can see where da reach at
local visualizer = Instance.new("Part")
visualizer.BrickColor = BrickColor.Blue()
visualizer.Transparency = 0.6
visualizer.Anchored = true
visualizer.CanCollide = false
visualizer.Size = Vector3.new(0.5, 0.5, 0.5)
visualizer.BottomSurface = Enum.SurfaceType.Smooth
visualizer.TopSurface = Enum.SurfaceType.Smooth

-- freaky functionality!!
local function onHit(hit, handle)
   local victim = hit.Parent:FindFirstChildOfClass("Humanoid")
   if victim and victim.Parent.Name ~= game.Players.LocalPlayer.Name then
      if dmgEnabled then
         for _, v in pairs(hit.Parent:GetChildren()) do
            if v:IsA("Part") then
               firetouchinterest(v, handle, 0)
               firetouchinterest(v, handle, 1)
            end
         end
      else
         firetouchinterest(hit, handle, 0)
         firetouchinterest(hit, handle, 1)
      end
   end
end

local function getWhiteList()
   local wl = {}
   for _, v in pairs(game.Players:GetPlayers()) do
      if v ~= game.Players.LocalPlayer then
         local char = v.Character
         if char then
            for _, q in pairs(char:GetChildren()) do
               if q:IsA("Part") then
                  table.insert(wl, q)
               end
            end
         end
      end
   end
   return wl
end

-- renderStepped logic IS NEEDED CHAT
game:GetService("RunService").RenderStepped:connect(function()
   if not active or not trueActive then return end
   local plr = game.Players.LocalPlayer
   local s = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
   if not s then visualizer.Parent = nil end
   if s then
      local handle = s:FindFirstChild("Handle") or s:FindFirstChildOfClass("Part")
      if handle then
         if visualizerEnabled then
            visualizer.Parent = workspace
         else
            visualizer.Parent = nil
         end
         if reach then
            if reachType == "Sphere" then
               visualizer.Shape = Enum.PartType.Ball
               visualizer.Size = Vector3.new(reach, reach, reach)
               visualizer.CFrame = handle.CFrame
               for _, v in pairs(game.Players:GetPlayers()) do
                  local hrp = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
                  if hrp and handle then
                     local mag = (hrp.Position - handle.Position).magnitude
                     if mag <= reach then
                        onHit(hrp, handle)
                     end
                  end
               end
            elseif reachType == "Line" then
               local origin = (handle.CFrame * CFrame.new(0, 0, -2)).p
               local ray = Ray.new(origin, handle.CFrame.lookVector * -reach)
               local p, pos = workspace:FindPartOnRayWithWhitelist(ray, getWhiteList())
               visualizer.Shape = Enum.PartType.Block
               visualizer.Size = Vector3.new(4, 4, reach)
               visualizer.CFrame = handle.CFrame * CFrame.new(0, 0, (reach / 2) + 2)
               if p then
                  onHit(p, handle)
               else
                  for _, v in pairs(handle:GetTouchingParts()) do
                     onHit(v, handle)
                  end
               end
            end
         end
      end
   end
end)



-- basically maintain gui and humanoid. keep ts
player.CharacterAdded:Connect(function()
    player.Character:WaitForChild("HumanoidRootPart")
end)
