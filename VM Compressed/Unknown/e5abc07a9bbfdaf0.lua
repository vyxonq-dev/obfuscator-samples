local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Display = LP.DisplayName
local User = LP.Name
local saveFile = "GValuesSBTD_" .. LP.UserId .. ".json"
local Http = game:GetService("HttpService")

local function safeNotify(title, msg, time, color)
    pcall(function()
        Notify(title or "Save/Load", msg, time or 5, color or 4483362458)
    end)
    print("["..(title or "Save/Load").."] "..msg)
end

local function saveGValues()
    if not writefile then 
        safeNotify("Save Failed", "writefile not supported by executor!")
        return 
    end
    
    local success, data = pcall(function()
        local t = {}
        for k,v in pairs(_G) do
            if typeof(v) == "string" or typeof(v) == "number" or typeof(v) == "boolean" then
                t[k] = v
            end
        end
        return t
    end)
    
    if not success then 
        safeNotify("Save Failed", "Error collecting data!")
        return 
    end
    
    local jsonSuccess, jsonData = pcall(Http.JSONEncode, Http, data)
    if not jsonSuccess then 
        safeNotify("Save Failed", "JSONEncode error: "..tostring(jsonData))
        return 
    end
    
    local writeSuccess, writeErr = pcall(writefile, saveFile, jsonData)
    if writeSuccess then
        safeNotify("Saved", "G values saved ("..tostring(#data).." keys)")
    else
        safeNotify("Save Failed", "writefile error: "..tostring(writeErr))
    end
end

local function loadGValues()
    if not isfile or not readfile then 
        safeNotify("Load Failed", "isfile/readfile not supported!")
        return 
    end
    
    if not isfile(saveFile) then 
        safeNotify("Load", "No save file found (first run?)")
        return 
    end
    
    local readSuccess, jsonData = pcall(readfile, saveFile)
    if not readSuccess then 
        safeNotify("Load Failed", "readfile error: "..tostring(jsonData))
        return 
    end
    
    local decodeSuccess, data = pcall(Http.JSONDecode, Http, jsonData)
    if not decodeSuccess then 
        safeNotify("Load Failed", "JSONDecode error (corrupted file?): "..tostring(data))
        pcall(delfile, saveFile)
        return 
    end
    
    local count = 0
    for k,v in pairs(data) do
        _G[k] = v
        count = count + 1
    end
    
    safeNotify("Loaded", "G values loaded ("..count.." keys)")
end

loadGValues()

task.spawn(function()
    task.wait(5)
    saveGValues()
    while true do
        task.wait(10)
        saveGValues()
    end
end)

local function Notify(T, C, D, I)
    Rayfield:Notify({
       Title = T or "Notification Title",
       Content = C or "Notification Content",
       Duration = D or 0,
       Image = I or 4483362458,
    })
end

local function binaryToText(binary)
    local text = ""
    for byte in binary:gmatch("%d%d%d%d%d%d%d%d") do
        text = text .. string.char(tonumber(byte, 2))
    end
    return text
end

local light
local lastDisabledTime = nil
local receivedMorse = ""
local decodedNumbers = {}
local signalCount = 0
local numberCount = 0
local decodedResult = nil
local busy = false

local morseNumbers = {
    ["-----"] = "0", [".----"] = "1", ["..---"] = "2", ["...--"] = "3",
    ["....-"] = "4", ["....."] = "5", ["-...."] = "6", ["--..."] = "7",
    ["---.."] = "8", ["----."] = "9"
}

local function decodeMorse(morse)
    return morseNumbers[morse] or "?"
end

local function ensureObjectExists(parent, objectName, callback)
    local object = parent:FindFirstChild(objectName)
    if object then
        pcall(function()
            callback(object)
        end)
    else
        Notify("Warning", "Part or Model '" .. objectName .. "' doesn't exist. Make sure you're in the right place or opened the room.", 5, 4483362458)
    end
end

local function monitorLight()
    if busy then return end
    busy = true

    while true do
        if light.Enabled then
            lastDisabledTime = nil
            local startTime = os.clock()

            while light.Enabled do task.wait() end
            local duration = os.clock() - startTime

            receivedMorse = receivedMorse .. (duration >= 0.8 and "-" or ".")

            signalCount = signalCount + 1

            if signalCount >= 5 then
                table.insert(decodedNumbers, decodeMorse(receivedMorse))
                receivedMorse = ""
                signalCount = 0
                numberCount = numberCount + 1

                if numberCount >= 6 then
                    task.wait(3)
                    decodedResult = table.concat(decodedNumbers)
                    decodedNumbers = {}
                    numberCount = 0
                    busy = false
                    return decodedResult
                end
            end
        else
            if lastDisabledTime == nil then
                lastDisabledTime = os.clock()
            elseif os.clock() - lastDisabledTime >= 3 then
                receivedMorse = ""
                decodedNumbers = {}
                numberCount = 0
                signalCount = 0
            end
        end
        task.wait(0.1)
    end
end

local Window = Rayfield:CreateWindow({
   Name = "Slap Battles Tower Defense",
   Icon = 0,
   LoadingTitle = "Loading",
   LoadingSubtitle = "0-o",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "helloguyssbtd"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
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
      Key = {"sigma"}
   }
})

_G.stars = _G.stars or 0
_G.wins = _G.wins or 0
_G.candies = _G.candies or 0

if LP:FindFirstChild("leaderstats") then
    if LP.leaderstats:FindFirstChild("Stars") then
        _G.stars = LP.leaderstats.Stars.Value
    end
    if LP.leaderstats:FindFirstChild("Wins") then
        _G.wins = LP.leaderstats.Wins.Value
    end
end

if LP:FindFirstChild("Candy") then
    _G.candies = LP.Candy.Value
end

local H = Window:CreateTab("Home", "home")
local M = Window:CreateTab("Misc", "home")
local T = Window:CreateTab("Teleport", "home")
local G = Window:CreateTab("Gloves", "home")

-- Home
H:CreateParagraph({Title = "ello!", Content = "Welcome! " .. Display .. " (" .. User .. ") Thank you for using my script! :)"})
H:CreateLabel("Stars: " .. _G.stars, 4483362458, Color3.fromRGB(255, 255, 255), false)
H:CreateLabel("Candies: " .. _G.candies, 4483362458, Color3.fromRGB(255, 255, 255), false)
H:CreateLabel("Wins: " .. _G.wins, 4483362458, Color3.fromRGB(255, 255, 255), false)

-- Misc
M:CreateButton({
    Name = "Anti-Afk",
    Callback = function()
        local VirtualUser = game:GetService('VirtualUser')
 
        game:GetService('Players').LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
 
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Anti-AFK Loaded!",
            Text = "Cool!",
            Button1 = "Thanks",
            Duration = 5
        })
    end,
})

-- Teleport
T:CreateButton({
    Name = "Sub-Place Teleporter",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universe-viewer-10546"))()
    end,
})

T:CreateButton({
    Name = "Teleport to Main Game",
    Callback = function()
        game:GetService("TeleportService"):Teleport(93249115521759, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to 'its raining potatoes' or Potato Place",
    Callback = function()
        game:GetService("TeleportService"):Teleport(75011717332634, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to '...' or Elude Maze",
    Callback = function()
        game:GetService("TeleportService"):Teleport(121263942043585, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to :moyai:",
    Callback = function()
        game:GetService("TeleportService"):Teleport(91235618441570, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Desert",
    Callback = function()
        game:GetService("TeleportService"):Teleport(76471028557198, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Slapple Island",
    Callback = function()
        game:GetService("TeleportService"):Teleport(132021850593446, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Garden",
    Callback = function()
        game:GetService("TeleportService"):Teleport(127407189772481, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Rocky Island",
    Callback = function()
        game:GetService("TeleportService"):Teleport(88016360501988, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Void",
    Callback = function()
        game:GetService("TeleportService"):Teleport(95720502858485, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Future",
    Callback = function()
        game:GetService("TeleportService"):Teleport(125995205473418, game.Players.LocalPlayer)
    end,
})

T:CreateButton({
    Name = "Teleport to Limbo",
    Callback = function()
        game:GetService("TeleportService"):Teleport(91569927171575, game.Players.LocalPlayer)
    end,
})

T:CreateSection("Event")

T:CreateButton({
    Name = "No events right now",
    Callback = function()
        -- do nothing absolutely ;33
    end,
})

-- Gloves
G:CreateSection("Moai")

G:CreateButton({
    Name = "Teleport to '...' or Elude Maze",
    Callback = function()
        game:GetService("TeleportService"):Teleport(121263942043585, game.Players.LocalPlayer)
    end,
})

G:CreateButton({
    Name = "Teleport to :moyai:",
    Callback = function()
        game:GetService("TeleportService"):Teleport(91235618441570, game.Players.LocalPlayer)
    end,
})

_G.Sign = _G.Sign

G:CreateButton({
    Name = "Get Code Room 1 (Go on Elude Maze)",
    Callback = function()
        ensureObjectExists(workspace, "OtherCode", function(OtherCode)
            local Sign = workspace.OtherCode.Text.SurfaceGui.TextLabel.Text
            Notify("Notification!", "Code: ".. Sign .. "!", 30, 4483362458)
            _G.Sign = Sign
        end)
    end,
})

G:CreateButton({
    Name = "Room 1",
    Callback = function()
        Notify("Notification!", "Code: ".. _G.Sign .. "!", 30, 4483362458)
    end,
})

G:CreateButton({
    Name = "Room 2",
    Callback = function()
        ensureObjectExists(workspace, "USign", function(USign)
            local USignText = workspace.USign.Text.SurfaceGui.TextLabel.Text
            Notify("Notification!", "Answer: ".. USignText .. "!", 30, 4483362458)
        end)
    end,
})

G:CreateButton({
    Name = "Room 3 (May not up-to-date)",
    Callback = function()
        Notify("Notification!", "Answer: 209543!", 30, 4483362458)
    end,
})

G:CreateButton({
    Name = "Room 4",
    Callback = function()
        ensureObjectExists(workspace, "Sign4", function(Sign4)
            local R4 = workspace.Sign4.Text.SurfaceGui.TextLabel.Text
            local R4D = binaryToText(R4)
            Notify("Notification!", "Answer: " .. R4D .. "!", 30, 4483362458)
        end)
    end,
})

local R5V = false
local R5 = 0

G:CreateButton({
    Name = "Room 5 (Can make a mistake)",
    Callback = function()
        Notify("Notification!", "Please be patient.", 5, 4483362458)
        light = workspace:FindFirstChild("MLight").SpotLight
        local result = monitorLight()
        if result then
            Notify("Notification!", "Answer: " .. result .. "!", 10, 4483362458)
            R5V = true
            R5 = result
        end
    end,
})

G:CreateButton({
    Name = "Show Room 5 Answer Again",
    Callback = function()
        if R5V then
            Notify("Notification!", "Answer: " .. R5 .. "!", 10, 4483362458)
        else
            Notify("Notification!", "Answer not found yet", 10, 4483362458)
        end
    end,
})

G:CreateButton({
    Name = "Go-to Room 6",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(229, 377, -207))
        Notify("Notification!", "Teleported!", 5, 4483362458)
    end,
})

G:CreateButton({
    Name = "Room 6",
    Callback = function()
        local sign6 = workspace:FindFirstChild("Sign6")
        if not sign6 then
            Notify("Error", "Sign6 not found! Make sure you're in Room 6.", 5, 4483362458)
            return
        end

        local textbox = sign6:FindFirstChild("SurfaceGui").TextBox
        if not textbox then
            Notify("Error", "TextBox not found on Sign6!", 5, 4483362458)
            return
        end
        
        local morse_to_char = {
            ["-..-"]  = "x",
            ["-.."]   = "d",
            ["....-"] = "4",
            ["....."] = "5",
            ["--..."] = "7",
            ["---.."] = "8",
            [".----"] = "1",
            ["..---"] = "2",
            ["...--"] = "3",
            [".-----"] = "0", ["-....-"] = "9", ["....-."] = "6",
            [".-"] = "a", ["-..."] = "b", ["-.-."] = "c", ["-.."] = "d",
        }

        local original_morse_raw = textbox.Text

        local original_morse = original_morse_raw:gsub("\\", "")

        local xhex_str = ""
        local unknown = {}
        for code in original_morse:gmatch("%S+") do
            local clean_code = code:gsub("\\", "")
            local ch = morse_to_char[clean_code]
            if ch then
                xhex_str = xhex_str .. ch
            else
                table.insert(unknown, clean_code)
            end
        end

        if #unknown > 0 then
            warn("⚠️ Unknown codes:", table.concat(unknown, ", "))
        end

        local hex_str = xhex_str:gsub("x", "")

        local b64_str = ""
        for i = 1, #hex_str, 2 do
            local hex_pair = hex_str:sub(i, i + 1)
            local byte_val = tonumber(hex_pair, 16)
            if byte_val then
                b64_str = b64_str .. string.char(byte_val)
            else
                warn("Invalid hex:", hex_pair)
            end
        end

        local b64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        local b64_to_idx = {}
        for i = 1, #b64_chars do
            b64_to_idx[b64_chars:sub(i, i)] = i - 1
        end

        local function base64_decode(input)
            input = input:gsub("[^A-Za-z0-9+/=]", ""):gsub("=*$", "")
            local output = ""
            for i = 1, #input, 4 do
                local a = b64_to_idx[input:sub(i, i)] or 0
                local b = b64_to_idx[input:sub(i + 1, i + 1)] or 0
                local c = b64_to_idx[input:sub(i + 2, i + 2)] or 0
                local d = b64_to_idx[input:sub(i + 3, i + 3)] or 0
                local triple = bit32.lshift(a, 18) + bit32.lshift(b, 12) + bit32.lshift(c, 6) + d
                output = output .. string.char(bit32.rshift(triple, 16))
                output = output .. string.char(bit32.band(bit32.rshift(triple, 8), 0xFF))
                output = output .. string.char(bit32.band(triple, 0xFF))
            end
            return output
        end

        local raw_binary = base64_decode(b64_str)
        local binary_str = raw_binary:gsub("[^01]", "")
        
        local final_code = tonumber(binary_str, 2)
        Notify("Room 6 Code", "Answer: " .. final_code, 30, 4483362458)
    end,
})

G:CreateSection("Potato")

G:CreateButton({
    Name = "Teleport to 'its raining potatoes' or Potato Place",
    Callback = function()
        game:GetService("TeleportService"):Teleport(75011717332634, game.Players.LocalPlayer)
    end,
})

G:CreateButton({
    Name = "Get Potato",
    Callback = function()
        local part = workspace:FindFirstChild("Winner")
        if part and part:IsA("BasePart") then
            for _, ti in ipairs(part:GetChildren()) do
                if ti:IsA("TouchTransmitter") or ti:IsA("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 0)
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 1)
                end
            end
        end
    end,
})

G:CreateSection("Knockoff")

G:CreateButton({
    Name = "Teleport to '...' or Elude Maze",
    Callback = function()
        game:GetService("TeleportService"):Teleport(121263942043585, game.Players.LocalPlayer)
    end,
})

_G.fullCode = _G.fullCode

G:CreateButton({
    Name = "Get Code (Lobby)",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local data = ReplicatedStorage.GetData:InvokeServer()
        local codeBreaker = data.CodeBreaker
        _G.fullCode = codeBreaker
        Notify("Notification!", "Code: ".. _G.fullCode .."!", 30, 4483362458)
    end,
})

G:CreateButton({
    Name = "Show Code",
    Callback = function()
        Notify("Notification!", "Code: ".. _G.fullCode .."!", 30, 4483362458)
    end,
})

G:CreateButton({
    Name = "TP to Code Input",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-169, 3, 115))
    end,
})

G:CreateSection("Orbit")

G:CreateButton({
    Name = "Teleport to '...' or Elude Maze",
    Callback = function()
        game:GetService("TeleportService"):Teleport(121263942043585, game.Players.LocalPlayer)
    end,
})

G:CreateButton({
    Name = "Notify Code",
    Callback = function()
        local text = workspace.CodeSign.Text.Gui.CodeLabel.Text
        Notify("Notification!", "Code: " .. text .. "!", 5, 4483362458)
    end,
})

G:CreateButton({
    Name = "TP Code Door",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-217, 3, 128))
    end,
})

G:CreateSection("[REDACTED]")

G:CreateButton({
    Name = "Teleport to '...' or Elude Maze",
    Callback = function()
        game:GetService("TeleportService"):Teleport(121263942043585, game.Players.LocalPlayer)
    end,
})

G:CreateButton({
    Name = "Notify Code",
    Callback = function()
        local text = workspace.CodeSign.Text.Gui.CodeLabel.Text
        Notify("Notification!", "Code: " .. text .. "!", 5, 4483362458)
    end,
})

G:CreateButton({
    Name = "TP Code Door",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-217, 3, 128))
    end,
})

G:CreateButton({
    Name = "Get Redacted (Need Door Opened)",
    Callback = function()
        local part = workspace:FindFirstChild("Winner3")
        if part and part:IsA("BasePart") then
            for _, ti in ipairs(part:GetChildren()) do
                if ti:IsA("TouchTransmitter") or ti:IsA("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 0)
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 1)
                end
            end
        end
    end,
})

G:CreateSection("Candies")

G:CreateButton({
    Name = "Auto Farm Candies",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/N0ne-ExIStenc3/boblus-scriptz/refs/heads/main/sbtd-candy"))()
    end,
})

G:CreateSection("Wins")

G:CreateButton({
    Name = "Auto Farm Wins",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/N0ne-ExIStenc3/boblus-scriptz/refs/heads/main/sbtd-win"))()
    end,
})

Notify("Notification!", "Script Loaded!", 5, 4483362458)
return monitorLight
