local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local MainF = ReplicatedStorage.MainF
local MainR = ReplicatedStorage.Main

local Optionss = {"Cobalt", "Diamond", "Gold", "Herostone", "Platinum", "Pyroium", "Voidium", "Uranium"}
local AMOUNT_TO_GIVE = 10
local MAX_REMOTES = 500

local GivingMoney = false
local GivingTickets = false
local SpinningWheel = false
local GivingChests = false
local OpeningChests = false
local AutoPlotting = false
local GivingOres = {Cobalt = false, Diamond = false, Gold = false, Herostone = false, Platinum = false, Pyroium = false, Voidium = false, Uranium = false}

local RemoteFunctionsAtOnce = 0

-- Helper function to handle throttling. If limit is hit, the call is discarded to prevent weird laggy stuff.
local function SafeInvoke(...)
    print(RemoteFunctionsAtOnce)
    if RemoteFunctionsAtOnce >= MAX_REMOTES then 
        return 
    end
    
    RemoteFunctionsAtOnce += 1
    local result = MainF:InvokeServer(...)
    RemoteFunctionsAtOnce -= 1
    
    return result
end

local function ToggleTickets(value)
    GivingTickets = value
    if not value then return end
    task.spawn(function()
        while GivingTickets do
            for i = 1, AMOUNT_TO_GIVE do
                if not GivingTickets then break end
                task.spawn(function()
                    if GivingTickets then SafeInvoke("gainChest", "Ticket", 1) end
                end)
            end
            task.wait(0.005)
        end
    end)
end

local function ToggleMoney(value)
    GivingMoney = value
    if not value then return end
    task.spawn(function()
        while GivingMoney do
            local MaxEarn = 50000
            local mainGui = LocalPlayer.PlayerGui:FindFirstChild("Main")
            local va = mainGui and mainGui:FindFirstChild("Frame") and mainGui.Frame:FindFirstChild("Percent") and mainGui.Frame.Percent:FindFirstChild("VA")
            
            if va then
                local splitText = string.split(va.Text, "/")
                MaxEarn = tonumber(splitText[2]) or 50000
            end

            task.spawn(function()
                if GivingMoney then SafeInvoke("earned", MaxEarn) end
            end)
            task.wait(0.05)
        end
    end)
end

local function ToggleOreLoop()
    while true do
        local activeList = {}
        for oreName, isEnabled in GivingOres do
            if isEnabled then table.insert(activeList, oreName) end
        end
        if #activeList == 0 then break end

        for i = 1, AMOUNT_TO_GIVE do
            local currentActive = {}
            for oreName, isEnabled in GivingOres do
                if isEnabled then table.insert(currentActive, oreName) end
            end
            if #currentActive == 0 then break end

            local randomOre = currentActive[math.random(1, #currentActive)]
            task.spawn(function() MainR:FireServer("gainedOre", randomOre) end)
        end
        task.wait(0.01)
    end
end

local function ToggleAllOres(selectedTable)
    local wasAnyActive = false
    for _, isEnabled in GivingOres do if isEnabled then wasAnyActive = true break end end
    for _, oreName in Optionss do GivingOres[oreName] = table.find(selectedTable, oreName) ~= nil end
    if #selectedTable > 0 and not wasAnyActive then task.spawn(ToggleOreLoop) end
end

local function ToggleWheelSpin(value)
    SpinningWheel = value
    if not value then return end
    task.spawn(function()
        while SpinningWheel do
            for i = 1, math.floor(AMOUNT_TO_GIVE/2) do
                if not SpinningWheel then break end
                task.spawn(function()
                    if SpinningWheel then
                        SafeInvoke("attemptSpin")
                        task.wait(0.1)
                        SafeInvoke("claimSpinReward")
                    end
                end)
            end
            task.wait(0.005)
        end
    end)
end

local function ToggleChests(value)
    GivingChests = value
    if not value then return end
    task.spawn(function()
        while GivingChests do
            for i = 1, AMOUNT_TO_GIVE do
                if not GivingChests then break end
                task.spawn(function()
                    if GivingChests then SafeInvoke("gainChest", "Golden", 1) end
                end)
            end
            task.wait(0.005)
        end
    end)
end

local function ToggleOpenChests(value)
    OpeningChests = value
    if not value then return end
    task.spawn(function()
        while OpeningChests do
            for i = 1, AMOUNT_TO_GIVE do
                if not OpeningChests then break end
                task.spawn(function()
                    if OpeningChests then SafeInvoke("openChest") end
                end)
            end
            task.wait(0.005)
        end
    end)
end

local function ToggleAutoPlot(Value)
    AutoPlotting = Value
    if not Value then return end
    task.spawn(function()
        while AutoPlotting do
            MainR:FireServer("plotdone")
            task.wait(0.05)
        end
    end)
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Build a Stone Miner! ⚒️",
   Icon = 0, 
   LoadingTitle = "Loading miner",
   LoadingSubtitle = "by System",
   ShowText = "Rayfield", 
   Theme = "Default", 

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, 

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, 
      Invite = "2xwvmHSjAJ", 
      RememberJoins = true 
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
   }
})

local Tab1 = Window:CreateTab("Credits", 4483362458)
Tab1:CreateParagraph({Title = "By System", Content = "The code is open source, join the discord for more."})

local Tab2 = Window:CreateTab("Main", 4483362458)

Tab2:CreateParagraph({Title = "How to get more money", Content = "Every second or so you get money as if you completed the whole plot. Mine the whole plot area to unlock the next one and ger more money."})

Tab2:CreateToggle({ Name = "Give Money", CurrentValue = false, Flag = "M", Callback = ToggleMoney })
Tab2:CreateToggle({ Name = "Give Tickets", CurrentValue = false, Flag = "T", Callback = ToggleTickets })
Tab2:CreateToggle({ Name = "Wheel Spin", CurrentValue = false, Flag = "W", Callback = ToggleWheelSpin })
Tab2:CreateToggle({ Name = "Give Chests", CurrentValue = false, Flag = "C", Callback = ToggleChests })
Tab2:CreateToggle({ Name = "Open Chests", CurrentValue = false, Flag = "O", Callback = ToggleOpenChests })

Tab2:CreateParagraph({Title = "How does this work", Content = "Does the same as clearing the plot. Keep this on a bit then you can use the money generator to get tons more money."})
Tab2:CreateToggle({ Name = "Autoplot", CurrentValue = false, Flag = "AP", Callback = ToggleAutoPlot })
Tab2:CreateDropdown({ Name = "Give Ores", Options = Optionss, CurrentOption = {}, MultipleOptions = true, Flag = "OD", Callback = ToggleAllOres })
Tab2:CreateButton({ Name = "Infinite Yield Admin", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end })

local Tab3 = Window:CreateTab("Settings", 4483362458)

Tab3:CreateParagraph({Title = "Performance Control", Content = "Bigger number = you get more stuff but more lag. Default = 25"})
Tab3:CreateSlider({
    Name = "Actions Per Frame",
    Range = {1, 50},
    Increment = 1,
    Suffix = "Actions",
    CurrentValue = 25,
    Flag = "Amount",
    Callback = function(Value) AMOUNT_TO_GIVE = Value end,
})

Tab2:CreateParagraph({Title = "How does this work", Content = "A cap to how many remote functions can be running at once. Should not be too big of a number to avoid issues but also not too low or your farming will be very slow. Default = 500"})
Tab3:CreateSlider({
    Name = "Max Remote Queue",
    Range = {10, 2500},
    Increment = 10,
    Suffix = "Remotes",
    CurrentValue = 500,
    Flag = "MaxR",
    Callback = function(Value) MAX_REMOTES = Value end,
})
