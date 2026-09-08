

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
   Name = "Residence Massacre 🔪",
   LoadingTitle = "Residence Massacre 🔪 GUI",
   LoadingSubtitle = "By 12slash25 ",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Ressidence Massacre"
   },
   Discord = {
      Enabled = true,
      Invite = "cJvggmYrTD", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Residence Massacre", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

local Button = MainTab:CreateButton({
   Name = "Autoclick",
   Callback = function()
   while true do
	local args ={
		[1]= "Click"
	}

	game:GetService("ReplicatedStorage").ClickEvent:FireServer(unpack(args))
	wait(0.0001)
end
   end,
})

local Button = MainTab:CreateButton({
   Name = "This was easy to make, if you want any other feature, tell me on scriptblox (12slash25)",
   Callback = function()
   
   end,
})

-- 12slash25
