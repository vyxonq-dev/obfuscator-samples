
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Bote ried",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Bote ried script",
   LoadingSubtitle = "by afrendly_guest7",
   Theme = "Bloom", 

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = false,
   KeySystem = true,
   KeySettings = {
      Title = "Key System",
      Subtitle = "Culll",
      Note = "https://link-hub.net/3303697/iOqQZngiYTuQ", -- Use this to tell the user how to get a key
      FileName = "WEAREFORSAKENWEAREFORSAKENWEAREFORSAKENIMAMACOOLKIDDANDIAMCOOLNEACUSEIMCOOLKIDANDILIKETOBECOOLIAMNOOBANDIAMSCAREDBECAUSETHISPLACEISFORSAKENIAMGUEST1337IAMMOTSCAREDBECAUSEIMAWARGUYANDTHISISFORSAKENNOTWARIM007N7MYSONISCULWKID", 
      SaveKey = false, 
      GrabKeyFromSite = false, 
      Key = {"Beep beep clanker"} 
   }
})

local MainTab = Window:CreateTab("Main", nil) 

local Button = MainTab:CreateButton({
   Name = "bot",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/93FMwf9r"))()
   end,
})