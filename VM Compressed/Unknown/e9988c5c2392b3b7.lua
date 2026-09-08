debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TheRedLakeHub",
   Icon = 4483345998,
   LoadingTitle = "TheRedLakeHub",
   LoadingSubtitle = "Welcome to TheRedLakeHub",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "TheRedLakeHub",
      FileName = "TheRedLakeHub"
   },

   Discord = {
      Enabled = false,
      Invite = "Qe6juMkXpR",
      RememberJoins = true
   },

   KeySystem = false
})

-- TAB
local Tab = Window:CreateTab("Auras", 4483345998)

-- SECTION
local Section = Tab:CreateSection("Auras")

-- TOGGLE: TANZANITE AXE INF CHARGE
Tab:CreateToggle({
   Name = "TANZANITE AXE INF CHARGE",
   CurrentValue = false,
   Flag = "InfCharge",
   Callback = function(Value)
      if Value then
         print("InfCharge activado")
         local scriptFunc = loadstring(game:HttpGet(
            'https://raw.githubusercontent.com/IdkbroAnonymous/TheRedLakeHub/refs/heads/main/TAxeInfCharge'
         ))
         if scriptFunc then
            scriptFunc()
         end
      else
         print("InfCharge desactivado")
      end
   end,
})

-- TOGGLE: TANGO KILL AURA
Tab:CreateToggle({
   Name = "Tango Kill Aura",
   CurrentValue = false,
   Flag = "TangoAura",
   Callback = function(Value)
      if Value then
         print("Tango Kill Aura activado")
         local scriptFunc = loadstring(game:HttpGet(
            'https://raw.githubusercontent.com/IdkbroAnonymous/TheRedLakeHub/refs/heads/main/KillAuraTango'
         ))
         if scriptFunc then
            scriptFunc()
         end
      else
         print("Tango Kill Aura desactivado")
      end
   end,
})

-- TOGGLE: MONSTERS KILL AURA
Tab:CreateToggle({
   Name = "Monsters Kill Aura",
   CurrentValue = false,
   Flag = "MonstersAura",
   Callback = function(Value)
      if Value then
         print("Monsters Kill Aura activado")
         local scriptFunc = loadstring(game:HttpGet(
            'https://raw.githubusercontent.com/IdkbroAnonymous/TheRedLakeHub/refs/heads/main/KillAuraMonsters'
         ))
         if scriptFunc then
            scriptFunc()
         end
      else
         print("Monsters Kill Aura desactivado")
      end
   end,
})

-- BUTTON: DISCORD
Tab:CreateButton({
   Name = "Unirse al Discord",
   Callback = function()
      setclipboard("https://discord.gg/Qe6juMkXpR")
      Rayfield:Notify({
         Title = "¡Copiado!",
         Content = "Invitación al Discord copiada al portapapeles.",
         Duration = 5
      })
   end,
})

Rayfield:LoadConfiguration()
