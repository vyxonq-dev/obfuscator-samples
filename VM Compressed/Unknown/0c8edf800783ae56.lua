local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Executor Tester | Credits: Gmiler_Lol",
   LoadingTitle = "Loading tests...",
   LoadingSubtitle = "by Gmiler_Lol",
   ConfigurationSaving = { Enabled = true, FolderName = "ExecTesterConfig", FileName = "MainConfig" },
   KeySystem = false 
})


local function CopyLink(url)
    if setclipboard then
        setclipboard(tostring(url))
        Rayfield:Notify({
            Title = "Gmiler_Lol",
            Content = "Link copied to clipboard!",
            Duration = 3,
        })
    end
end

-- Tab 1: UNC TEST
local TabUNC = Window:CreateTab("UNC TEST", "shield")
TabUNC:CreateButton({
   Name = "Run UNC TEST",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/rKikccQa/raw"))()
       Rayfield:Notify({Title = "Success", Content = "UNC TEST started", Duration = 3})
   end,
})

-- Tab 2: sUNC TEST
local TabsUNC = Window:CreateTab("sUNC TEST", "check-circle")
TabsUNC:CreateButton({
   Name = "Run sUNC TEST",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/Hx8W5ZID/raw"))()
       Rayfield:Notify({Title = "Success", Content = "sUNC TEST started", Duration = 3})
   end,
})
TabsUNC:CreateSection("Test Requirements")
TabsUNC:CreateButton({
   Name = "Copy link: Must join 'Roblox Be Like'",
   Callback = function() CopyLink("https://www.roblox.com/games/90441122676618") end,
})

-- Tab 3: Vulnerability Mitigation Test
local TabVuln = Window:CreateTab("Vulnerability Test", "lock")
TabVuln:CreateButton({
   Name = "Run Vulnerability Mitigation",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/DGl9dxqi/raw"))()
       Rayfield:Notify({Title = "Success", Content = "Vulnerability Test started", Duration = 3})
   end,
})

-- Tab 4: Myriad Validity Test
local TabMyriad = Window:CreateTab("Myriad Test", "fingerprint")
TabMyriad:CreateButton({
   Name = "Run Myriad Validity Test",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Proton-Utilities/Myriad/refs/heads/main/dist.luau"))()
       Rayfield:Notify({Title = "Success", Content = "Myriad started", Duration = 3})
   end,
})
TabMyriad:CreateSection("Test Requirements")
TabMyriad:CreateButton({
   Name = "Copy link: Join this game to test",
   Callback = function() CopyLink("https://www.roblox.com/games/80776325854596") end,
})

-- Tab 5: Server Hop
local TabHop = Window:CreateTab("Server Hop", "refresh-cw")
TabHop:CreateButton({
   Name = "Run Server Hop Test",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Cesare0328/my-scripts/refs/heads/main/CachedServerhop.lua'))()
   end,
})

-- Tab 6: Level Test
local TabLevel = Window:CreateTab("Level Test", "terminal")
TabLevel:CreateButton({
   Name = "Run Level Test (printidentity)",
   Callback = function()
       printidentity()
       Rayfield:Notify({Title = "Gmiler_Lol", Content = "Result is in the console (F9)", Duration = 3})
   end,
})

-- Tab 7: Settings
local TabSettings = Window:CreateTab("Settings", "settings")
TabSettings:CreateSection("GUI Management")
TabSettings:CreateButton({
   Name = "Destroy GUI (Close)",
   Callback = function() Rayfield:Destroy() end,
})

Rayfield:Notify({
   Title = "Ready",
   Content = "Executor Tester Loaded | Credits: Gmiler_Lol",
   Duration = 5,
})