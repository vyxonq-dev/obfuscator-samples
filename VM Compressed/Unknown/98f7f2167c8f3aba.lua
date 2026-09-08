local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tool Giver Gui",
   Theme = "Dark",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by Mr Exploiter",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "tool giver Gui",
      Subtitle = "Key System",
      Note = "Key Is Hyper Scripter",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true,-- , -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hyper Scripter"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Tools")

local Button = Tab:CreateButton({
   Name = "Load Tools Giver V2",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/qpbQo0lr/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load Tools Giver V1",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/bfyJbBkd/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load Patrick Tools Giver",
   Callback = function()
    loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load admin Tools Giver (only works for prison life)",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/AZVi2tuK"))()
   end,
})

local Tab = Window:CreateTab("Doors Tools")

local Button = Tab:CreateButton({
   Name = "Magnet",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Golden Flashlight",
   Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/aadyian9000/the-thing/main/GoldenGummyFlashlight.lua"),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinite Vitamins",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/refs/heads/main/Inf_Vitamins.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Shears On Anything",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/z2EUuziF"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Pink Tablet",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/umRteEPy​"))()
   end,
})

local Tab = Window:CreateTab("Misc")

local Button = Tab:CreateButton({
   Name = "Click To See Key Status",
   Callback = function()
    -- Notification library
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
 local Notify = Notification.Notify;

 Notify({
		 Description = "Key Status in never";
		 Title = "Key";
		 Duration = 20;
		 
});
   end,
})

local Button = Tab:CreateButton({
   Name = "Unload Ui",
   Callback = function()
    Rayfield:Destroy()
   end,
})
