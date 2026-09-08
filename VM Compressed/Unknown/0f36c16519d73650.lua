local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
   Name = "YvsH WallHop Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "LoadingScript",
   LoadingSubtitle = "by Yoricks",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "KeySystem",
      Subtitle = "Get A Key",
      Note = "Key: Homer vs Bart", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Homer vs Bart"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MTab = Window:CreateTab("🏠 Main 🏠", nil) -- Title, Image
local Section = MTab:CreateSection("Main")

local Button = MTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
     local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local hum

UIS.JumpRequest:Connect(function()
	if not hum then
		local char = plr.Character
		if char then
			hum = char:FindFirstChildOfClass("Humanoid")
		end
	end
	
	if hum then
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
  
end,
})

local Slider = MTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)  
    end,
})

 local Slider = MTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 20,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local CTab = Window:CreateTab("🔓 LockCharacter 🔓", nil) -- Title, Image
local Section = CTab:CreateSection("LockCharacter")

local Button = CTab:CreateButton({
   Name = "MLG Bart",
   Callback = function()
    local args = {
	"MLG Bart",
	"Badge"
}
game:GetService("ReplicatedStorage"):WaitForChild("MorphEvent"):FireServer(unpack(args))
                
    end,
})

    local Button = CTab:CreateButton({
   Name = "Hotdog Bart",
   Callback = function()
    local args = {
	"Hotdog Bart",
	"Badge"
}
game:GetService("ReplicatedStorage"):WaitForChild("MorphEvent"):FireServer(unpack(args))
                
    end,
})

    local Button = CTab:CreateButton({
   Name = "Starstruck",
   Callback = function()
    local args = {
	"Starstruck",
	"Badge"
}
game:GetService("ReplicatedStorage"):WaitForChild("MorphEvent"):FireServer(unpack(args))
                
    end,
})

local Button = CTab:CreateButton({
   Name = "ROBOT3000",
   Callback = function()
 local args = {
	"ROBOT3000",
	"Badge"
}
game:GetService("ReplicatedStorage"):WaitForChild("MorphEvent"):FireServer(unpack(args))
        end,
})

local Button = CTab:CreateButton({
   Name = "Fisk",
   Callback = function()
   -- Script de Teleporte com Retorno
-- Teleporta para 135, 17, 106 e depois volta para a posição original

-- Salva a posição original do jogador
local posicaoOriginal = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

-- Posição de destino
local destinoX = 135
local destinoY = 17
local destinoZ = 106

print("Posição original salva!")
print("Teleportando para: " .. destinoX .. ", " .. destinoY .. ", " .. destinoZ)

-- Teleporta para a posição de destino
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(destinoX, destinoY, destinoZ)

-- Aguarda 5 segundos antes de voltar
wait(5)

print("Retornando para a posição original...")

-- Retorna para a posição original
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = posicaoOriginal

print("Teleporte concluído!")
   end,
})

local Button = CTab:CreateButton({
   Name = "Mafia Bart",
   Callback = function()
 local args = {
	"Mafia Bart",
	"Badge"
}
game:GetService("ReplicatedStorage"):WaitForChild("MorphEvent"):FireServer(unpack(args))
        end,
})


local ComTab = Window:CreateTab("💯 Combo50Streak 💯", nil) -- Title, Image
local Section = ComTab:CreateSection("Combo50Streak")

local Button = ComTab:CreateButton({
   Name = "AtivadeCombo50Streak",
   Callback = function()
   local args = {
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Combo50Event"):FireServer(unpack(args))
            
   end,
})

local Button = ComTab:CreateButton({
   Name = "DisableCombo50Streak",
   Callback = function()
   local args = {
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("Combo50Event"):FireServer(unpack(args))
            
   end,
})
