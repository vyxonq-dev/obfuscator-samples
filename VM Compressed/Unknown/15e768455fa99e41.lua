--// Gaming Focused Rizz Chat (Demption Update)
--// Version 0.1 (Beta)
--// Rayfield UI | Clean | Structured

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local COOLDOWN = 2
local lastSent = 0

--// Window
local Window = Rayfield:CreateWindow({
   Name = "Gaming Focused Rizz Chat (Demption Update)",
   LoadingTitle = "Gaming Focused Rizz Chat",
   LoadingSubtitle = "Version 0.1 (Beta)",
   Icon = 86322991496818,
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

--// Info Notice
Rayfield:Notify({
   Title = "Chat Verification Required",
   Content = "Roblox requires account chat verification. Messages will not send if you're unverified.",
   Duration = 8
})

--// Chat Function
local function SendChat(msg)
   if os.clock() - lastSent < COOLDOWN then
      Rayfield:Notify({
         Title = "Cooldown",
         Content = "Please wait before sending another message.",
         Duration = 3
      })
      return
   end

   if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
      local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
      if channel then
         channel:SendAsync(msg)
         lastSent = os.clock()
      end
   end
end

--// ===================== RIZZ TAB =====================
local RizzTab = Window:CreateTab("Rizz Lines", 4483362458)
RizzTab:CreateSection("Auto Chat Rizz")

local RizzLines = {
   "Are you lag? Because you just froze my heart",
   "Is your avatar custom? Because it’s one of a kind",
   "Are we in the same server? Because I feel the connection",
   "You AFK? Cause time stopped when you joined",
   "Are you a rare item? Because everyone wants you",
   "Is your ping low? Cause that was a smooth entrance",
   "Are you a game pass? Worth every Robux",
   "I don’t need admin… I already noticed you",
   "Are you scripted? Because you run perfectly",
   "Even my FPS dropped when you walked in",
   "Is this obby hard or am I just distracted by you",
   "You spawn here often? Because you’re memorable",
   "Are you a VIP server? I want exclusive access",
   "I was grinding, then you showed up",
   "Are you a legendary drop? Cause the odds are crazy",
   "My inventory’s full… but I got room for you",
   "Are you the map creator? Cause this place feels better now",
   "Even Roblox physics can’t explain this pull",
   "Are you premium? Cause you stand out",
   "I joined for the game, stayed for you",
   "Is your username copyrighted? Too clean",
   "You play often? Cause I hope to see you again",
   "Are you the main quest? Cause you got my attention",
   "My avatar looks better standing next to yours",
   "Are you a checkpoint? I feel safe near you",
   "Is this a roleplay server? Cause you got main-character vibes",
   "Are you the update? Cause things just improved",
   "I lagged for a sec—worth it",
   "Are you the leaderboard? Cause you’re on top",
   "I don’t usually type first… but here I am",
   "Are you a rare skin? Cause that fit is fire",
   "Even my emotes can’t express this",
   "Is your mic on? Cause you loud without talking",
   "Are you the host? Cause you control the vibe",
   "I was about to leave… then you joined",
   "Are you scripted events? Always on time",
   "My Roblox crashed—but my interest didn’t",
   "Are you the spawn point? I keep coming back",
   "This server got lucky when you joined",
   "Not gonna lie… your avatar carried the lobby"
}

for _, line in ipairs(RizzLines) do
   RizzTab:CreateButton({
      Name = line,
      Callback = function()
         SendChat(line)
      end
   })
end

--// ===================== JOKE TAB =====================
local JokeTab = Window:CreateTab("Joke Lines", 4483362458)
JokeTab:CreateSection("Self-Aware / Funny Lines")

local JokeLines = {
   "I don’t lag, I just give everyone else a chance.",
   "My aim is so bad even the wall feels safe.",
   "I play like it’s my first day… every day.",
   "My FPS is lower than my IQ.",
   "I didn’t lose, I just tested the respawn button.",
   "If losing was XP, I’d be max level.",
   "My strategy is panic and hope.",
   "I press random buttons and pray.",
   "Even the tutorial boss beat me.",
   "I don’t camp, I live here.",
   "My ping is playing hide and seek.",
   "I main the respawn screen.",
   "I play for fun, not for wins (copium).",
   "My loadout is emotional damage.",
   "I don’t rage quit, I tactical exit.",
   "Skill issue? Nah, feature.",
   "I miss shots on stationary targets.",
   "I carry the team… emotionally.",
   "My brain goes AFK mid-fight.",
   "I blame lag even offline.",
   "I press W and bad things happen.",
   "My KD ratio fears me.",
   "I fight NPCs and still lose.",
   "I’m not bad, the game hates me.",
   "I warm up by losing.",
   "My crosshair avoids enemies.",
   "I thought that was friendly fire… oops.",
   "I’m built different (worse).",
   "Even my shadow outplays me.",
   "I dodge bullets by accident.",
   "I don’t throw games, I gift them.",
   "My hands lag behind my brain.",
   "I watch pro plays then do the opposite.",
   "I miss so hard it’s impressive.",
   "I carry snacks, not games.",
   "My gameplay is a comedy.",
   "I press reload at the worst time.",
   "I run first, think later.",
   "My skill left the chat.",
   "At least I look cool losing."
}

for _, line in ipairs(JokeLines) do
   JokeTab:CreateButton({
      Name = line,
      Callback = function()
         SendChat(line)
      end
   })
end

--// ===================== RAGEBAIT TAB =====================
local RageTab = Window:CreateTab("Ragebait Lines", 4483362458)
RageTab:CreateSection("Competitive / Provoking Lines")

local RageLines = {
   "You’re trash and lag can’t save you.",
   "Imagine trying this hard and still losing.",
   "Is that your best? Yikes.",
   "Bro plays like it’s his first hour.",
   "Even bots would do better.",
   "Skill issue detected.",
   "You pressed all the buttons wrong.",
   "You fight like an NPC.",
   "That loss was personal.",
   "I wasn’t even trying.",
   "You lost to THIS build?",
   "Go back to the tutorial.",
   "I could win with one hand.",
   "You make the game look hard.",
   "Free win, thanks.",
   "I’ve seen beginners do better.",
   "That was embarrassing to watch.",
   "You swung first and still lost.",
   "Was that lag or just you?",
   "You play scared for no reason.",
   "Even your teammate gave up.",
   "That aim needs therapy.",
   "I farmed you for XP.",
   "You’re just walking loot.",
   "I expected more… mistake.",
   "You rushed and paid for it.",
   "That strategy made zero sense.",
   "You folded instantly.",
   "I blinked and you were gone.",
   "That was a donation, right?",
   "You fight like you lag on purpose.",
   "I barely moved and you lost.",
   "You panic way too fast.",
   "That combo was weak.",
   "You chased and still died.",
   "You really thought that would work?",
   "I countered you without thinking.",
   "You play like you’re scared to win.",
   "That was free.",
   "Thanks for the easy match."
}

for _, line in ipairs(RageLines) do
   RageTab:CreateButton({
      Name = line,
      Callback = function()
         SendChat(line)
      end
   })
end

--// ===================== GAMING UI INFO TAB =====================
local InfoTab = Window:CreateTab("Gaming Focused UI", 4483362458)
InfoTab:CreateSection("Developer Information")

-- Thumbnail
local thumb, _ = Players:GetUserThumbnailAsync(
   3477862755,
   Enum.ThumbnailType.HeadShot,
   Enum.ThumbnailSize.Size420x420
)

InfoTab:CreateParagraph({
   Title = "Developer",
   Content = "Akiru (Verified)"
})

InfoTab:CreateParagraph({
   Title = "Project Overview",
   Content = [[
Thank you for taking the time to listen.

I’m currently working on my Gaming Focused UI — a project designed to improve the gaming experience by making tools, features, and controls more organized, efficient, and user-friendly.

My goal is to create something advanced, powerful, and unique — not just another simple interface, but a system that truly supports gamers and performance.

The project is still in development. I’m solving issues, testing new ideas, and refining each feature step-by-step instead of rushing.

Every challenge helps improve the UI further. When finished, it will be advanced, stable, and genuinely useful for gamers.

Thank you for your patience and support.
]]
})

--// Discord Tab
local DiscordTab = Window:CreateTab("Discord", 4483362458)
DiscordTab:CreateSection("Community")

DiscordTab:CreateButton({
   Name = "Copy Discord Invite",
   Callback = function()
      if setclipboard then
         setclipboard("https://discord.gg/9ym2VcXW5")
         Rayfield:Notify({
            Title = "Copied",
            Content = "Discord invite copied to clipboard.",
            Duration = 4
         })
      end
   end
})