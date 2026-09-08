local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Pushup Simulator by PJex",
   LoadingTitle = "PJex Exploits",
   LoadingSubtitle = "Made By PJex",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "PJexExploitsGamesHubSUPERNOTGAYPUSHUP"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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

local MainTab = Window:CreateTab("Main", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Execution",
   Content = "Thank You For Using PJexExploits",
   Duration = 4.2,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "PJex Is So Cool",
         Callback = function()
         print("PJex Is So Cool")
      end
   },
},
})

local Toggle = MainTab:CreateToggle({
   Name = "Pushups [⚠️Must Have your pushup equipped for  to work!!⚠️]",
   CurrentValue = false,
   Flag = "Toggle1123345342",
   Callback = function(Value)
       _G.TogglePushups = Value -- Store the toggle value in a global variable
       
       local args = {
           [1] = {
               [1] = "Train_Request"
           }
       }
       
       while _G.TogglePushups do
           game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
           wait() -- Wait for a certain period before sending the request again
       end
   end,
})
