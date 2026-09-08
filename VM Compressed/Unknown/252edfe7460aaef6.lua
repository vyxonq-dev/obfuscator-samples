pcall(function()
    local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    local DiscordInvite = "UsSvP4EpDj"
    HttpService = game:GetService("HttpService")
    if requestFunc then
            requestFunc({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = HttpService:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = HttpService:GenerateGUID(false),
                    args = {code = DiscordInvite}
                })
            })
    end
    end)
    function checkexecutor()
        local executor = identifyexecutor()
        if executor == "Xeno" then
            game.Players.LocalPlayer:Kick("Unsupported executor | Your executor doesn't support luraph.")
        end
    end
    checkexecutor()

debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Zynix Instant Poop",
   Icon = 0,
   LoadingTitle = "Zynix Instant Poop",
   LoadingSubtitle = "by 087f",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/kh39AFNThN",
      RememberJoins = true
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "We actually have no keysys",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("Instant Poop")

local Button = Tab:CreateButton({
   Name = "Instant Poop",
   Callback = function()
       local args = {buffer.fromstring("\000\000\000\000")}
       game:GetService("ReplicatedStorage"):WaitForChild("Packets"):WaitForChild("Packet"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
   end,
})

Rayfield:LoadConfiguration()