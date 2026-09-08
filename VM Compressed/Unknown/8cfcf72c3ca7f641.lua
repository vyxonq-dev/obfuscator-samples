local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Comics Bear Rp",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by Yoricks",
   ShowText = "Comics Bear", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Bear"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System",
      Subtitle = "Get a Key",
      Note = "Key:BearFanGame", -- Use this to tell the user how to get a key
      FileName = "Comics", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"BearFanGame"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MTab = Window:CreateTab("🐻 Main 🐻", nil) -- Title, Image
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
   Name = "Walk Speed",
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
   Suffix = "ump",
   CurrentValue = 50,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})



local DTab = Window:CreateTab("☠️ Dev Skins ☠️", nil) -- Title, Image
local Section = DTab:CreateSection("Dev Skins")

local Button = DTab:CreateButton({
   Name = "DevMutwain",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("DevMutwain")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
            
   end,
})

local Button = DTab:CreateButton({
   Name = "Eyessssss",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Eyessssss")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))

        end,
})

local Button = DTab:CreateButton({
   Name = "Scary",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Scary")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "hahroon",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("hahroon")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "BIGMANTING",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("BIGMANTING")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "BIGMALBEAR",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("BIGMALBEAR")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Ghostpepper",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Ghostpepper")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Blobo",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Blobo")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Rubbermal",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Rubbermal")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Hot Air Balloon Bear",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Hot Air Balloon Bear")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "FARTBEAR",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("FARTBEAR")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Wallace",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Wallace")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "GOD",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("GOD")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Gubby",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Gubby")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "Orange",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("Orange")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})

local Button = DTab:CreateButton({
   Name = "FAKEBigManTing",
   Callback = function()
   local args = {
	game:GetService("ReplicatedStorage"):WaitForChild("FAKEBigManTing")
}
game:GetService("ReplicatedStorage"):WaitForChild("CharChange"):FireServer(unpack(args))
        end,
})


local ITab = Window:CreateTab("💰 Misc 💰", nil) -- Title, Image
local Section = ITab:CreateSection("Misc")

local Toggle = ITab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "TeleportToggle1",
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      
      if Value then
         -- Quando ativado, teleporta continuamente
         _G.TeleportLoop = true
         
         spawn(function()
            while _G.TeleportLoop do
               task.wait(0.1)
               
               if character and character:FindFirstChild("HumanoidRootPart") then
                  character.HumanoidRootPart.CFrame = CFrame.new(-935, 323, 677)
               end
            end
         end)
      else
         -- Quando desativado, para o loop
         _G.TeleportLoop = false
      end
   end,
})
