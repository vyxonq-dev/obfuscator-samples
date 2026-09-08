local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "226w6 Moderator suite",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Be kind and take care of this word pr3ttyprinces --226w6",
   ShowText = "Loading mint tea...", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "nil"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Anti-Red guys verification",
      Subtitle = ">Say (No) to verifiate",
      Note = "Are you Red guy?", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"No"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Main = Window:CreateTab("Main Mod", 4483362458) -- Title, Image

local Useful = Main:CreateSection("Detecters")

-- 🧱 Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- 🧠 State
local lastPositions = {}
local lastCheckTimes = {}
local reported = {} -- avoid reporting same person repeatedly

-- 📢 Function: Say in chat
local function announceCheater(plr, reason)
    local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
    if chatEvent then
        chatEvent:FireServer("[AutoMod] "..plr.Name.." is cheating ("..reason..")", "All")
    end
end

-- 🚨 Function: Auto-report
local function reportPlayer(plr, reason)
    if reported[plr.UserId] then return end
    reported[plr.UserId] = true
    pcall(function()
        Players:ReportAbuse(plr, "Cheating/Exploiting", "[AutoReport] " .. reason)
    end)
end

-- 🪟 GUI Toggle
local toggles = { AntiCheat = false }

Main:CreateToggle({
    Name = "Anti-Cheat (Auto Report)",
    CurrentValue = false,
    Callback = function(state)
        toggles.AntiCheat = state
        if state then
            warn("✅ Anti-Cheat Enabled")
        else
            warn("🛑 Anti-Cheat Disabled")
        end
    end
})

-- 🎯 Anti-Cheat Logic
RunService.Heartbeat:Connect(function(dt)
    if not toggles.AntiCheat then return end

    for _, plr in ipairs(Players:GetPlayers()) do
        if not plr.Character then continue end
        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then continue end

        local now = os.clock()
        local lastPos = lastPositions[plr] or hrp.Position
        local lastTime = lastCheckTimes[plr] or now

        local deltaTime = now - lastTime
        local movedDist = (hrp.Position - lastPos).Magnitude
        local speed = movedDist / math.max(deltaTime, 0.01)

        -- 🚨 Teleport
        if movedDist > 60 then
            announceCheater(plr, "teleporting")
            reportPlayer(plr, "Teleport detected")
        end

        -- ⚡ Speed Hack
        if speed > 100 then
            announceCheater(plr, "speed hacking ("..math.floor(speed)..")")
            reportPlayer(plr, "Speed hack")
        end

        -- 🌀 Fling
        if hrp.AssemblyLinearVelocity.Magnitude > 220 then
            announceCheater(plr, "flinging")
            reportPlayer(plr, "Fling / physics abuse")
        end

        -- 🧱 Noclip
        if hrp.CanCollide == false then
            announceCheater(plr, "noclip")
            reportPlayer(plr, "Noclip detected")
        end

        -- 💉 Godmode
        if hum.Health > hum.MaxHealth then
            announceCheater(plr, "godmode")
            reportPlayer(plr, "Godmode exploit")
        end

        lastPositions[plr] = hrp.Position
        lastCheckTimes[plr] = now
    end
end)

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- State
local toggles = { AntiToxic = false }
local alreadyReported = {}

-- Say in chat (All)
local function say(msg)
	local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
	if chatEvent then
		chatEvent:FireServer("[AutoMod] " .. msg, "All")
	end
end

-- Toxic words (expand as needed)
local TOXIC_WORDS = {
	"idiot", "noob", "ez", "kys", "retard", "trash", "loser", "garbage",
	"faggot", "cancer", "get rekt", "kill yourself", "cry more", "skill issue", "stupid"
}

-- Detect toxic word
local function isToxic(msg)
	msg = msg:lower()
	for _, word in ipairs(TOXIC_WORDS) do
		if msg:find(word) then
			return word
		end
	end
	return nil
end

-- Auto report toxic player
local function reportPlayer(plr, reason)
	if alreadyReported[plr.UserId] then return end
	alreadyReported[plr.UserId] = true

	pcall(function()
		Players:ReportAbuse(plr, "Bullying", "Used toxic word: " .. reason)
	end)
end


Main:CreateToggle({
	Name = "Anti-Toxic Chat",
	CurrentValue = false,
	Callback = function(value)
		toggles.AntiToxic = value
		if value then
			warn("✅ Anti-Toxic Chat ON")
		else
			warn("🛑 Anti-Toxic Chat OFF")
		end
	end
})

-- Monitor players
local function monitorPlayer(plr)
	plr.Chatted:Connect(function(msg)
		if not toggles.AntiToxic then return end
		local toxic = isToxic(msg)
		if toxic then
			say(plr.Name .. " used toxic word: '" .. toxic .. "'")
			reportPlayer(plr, toxic)
		end
	end)
end

-- Attach to all current and future players
for _, p in ipairs(Players:GetPlayers()) do
	monitorPlayer(p)
end

Players.PlayerAdded:Connect(monitorPlayer)

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- State
local toggles = { AntiSpam = false }
local spamState = {}

-- Utility
local function reportPlayer(plr, reason)
	pcall(function()
		Players:ReportAbuse(plr, "Scamming", "Spam - " .. reason)
	end)
end


Main:CreateToggle({
	Name = "Anti-Spam",
	CurrentValue = false,
	Callback = function(state)
		toggles.AntiSpam = state
		if state then
			warn("✅ Anti-Spam Enabled")
		else
			warn("🛑 Anti-Spam Disabled")
		end
	end
})

-- Detect Repeated Spam
local function handleChat(plr, msg)
	if not toggles.AntiSpam then return end
	msg = msg:lower()

	local state = spamState[plr.UserId]
	if not state then
		state = {
			repeatCache = {},
			strikes = {},
		}
		spamState[plr.UserId] = state
	end

	state.repeatCache[msg] = (state.repeatCache[msg] or 0) + 1

	-- If message repeated 3+ times
	if state.repeatCache[msg] >= 3 then
		state.strikes[msg] = (state.strikes[msg] or 0) + 1

		if state.strikes[msg] == 3 then
			reportPlayer(plr, msg)
		end
	end
end

-- Monitor all players
local function monitorPlayer(plr)
	plr.Chatted:Connect(function(msg)
		handleChat(plr, msg)
	end)
end

-- Attach to existing and new players
for _, p in ipairs(Players:GetPlayers()) do
	monitorPlayer(p)
end
Players.PlayerAdded:Connect(monitorPlayer)

-- Add to your toggles table if not already:
toggles.AntiNSFW = false

-- Create the toggle in your GUI (inside the tab setup)
Main:CreateToggle({
    Name = "Anti NSFW",
    CurrentValue = false,
    Callback = function(state)
        toggles.AntiNSFW = state
        notify("Moderator", "Anti NSFW = " .. tostring(state), 3)

        -- If toggled ON, start scanning for NSFW avatars
        if state then
            startNSFWScan()
        end
    end,
})

-- NSFW detection keywords
local NSFW_PATTERNS = {
    "r63", "18+", "nsfw", "nude", "naked", "sex", "boob", "thigh", "s%xy", "lewd"
}

-- Utility function to match any pattern
local function matchAny(msg, list)
    msg = msg:lower()
    for _, pattern in ipairs(list) do
        if msg:find(pattern) then
            return true
        end
    end
    return false
end

-- Report abuse safely
local function tryReport(plr, reason)
    pcall(function()
        Players:ReportAbuse(plr, "InappropriateContent", reason or "NSFW avatar detected.")
    end)
end

-- Send chat announcement (make sure 'say' is defined or replace with your method)
local function say(msg)
    local ok, chat = pcall(function()
        return ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    end)
    if ok and chat then
        chat:FireServer(msg, "All")
    end
end

-- Scan player's avatar for NSFW keywords in accessories/clothing
local function scanAvatar(plr)
    if not toggles.AntiNSFW then return end
    if not plr.Character then return end

    local flagged = false
    for _, item in ipairs(plr.Character:GetDescendants()) do
        if item:IsA("Accessory") or item:IsA("Shirt") or item:IsA("Pants") or item:IsA("ShirtGraphic") then
            local name = (item.Name or ""):lower()
            if matchAny(name, NSFW_PATTERNS) then
                flagged = true
                break
            end
        end
    end

    if flagged then
        say(("[NSFW] %s has an inappropriate avatar. Reporting..."):format(plr.Name))
        tryReport(plr, "Inappropriate avatar + +18 avatar")
    end
end

-- Start scanning existing and new players when toggle is enabled
function startNSFWScan()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            task.spawn(function()
                task.wait(2) -- Wait for avatar to fully load
                scanAvatar(plr)
            end)
        end

        plr.CharacterAdded:Connect(function(char)
            task.wait(2)
            scanAvatar(plr)
        end)
    end

    Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function(char)
            task.wait(2)
            scanAvatar(plr)
        end)
    end)
end
