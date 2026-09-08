local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local auto = 0
local Window = Rayfield:CreateWindow({
   Name = "Автофарм кейсов",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "не мой гуи",
   LoadingSubtitle = "by Sirius",
   ShowText = "Автофарм Trash кейсов", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab2 = Window:CreateTab("Info", "book-text") -- инфа
local Tab4 = Window:CreateTab("Halloween", "banknote") -- тыквы круто
local Tab = Window:CreateTab("Trash", "banknote") -- автофарм trash
local Tab3 = Window:CreateTab("Beggar", "banknote") -- автофарм beggar
local Tab5 = Window:CreateTab("Plodder", "banknote") -- автофарм plodder
local Tab6 = Window:CreateTab("Office Clerk", "banknote") -- автофарм Office Clerk
local Tab7 = Window:CreateTab("Manager", "banknote") -- автофарм Manager
local Tab1 = Window:CreateTab("Credits", "creative-commons") -- о нас
local Label = Tab1:CreateLabel("Кодер: Авед")
local Label = Tab1:CreateLabel("Тестер: Авед, Дэмэнтый")
local Label = Tab1:CreateLabel("Гуи: Sirius")
local Label = Tab1:CreateLabel("Мария: Зайцева")
local Label = Tab2:CreateLabel("Тестировал на: Delta(android)")
local Label = Tab2:CreateLabel("Тестировал на: Seliware(desktop)")
local Label = Tab2:CreateLabel("Это open source проект")
local Label = Tab2:CreateLabel("Донатов нету, разраб хороший прост")
local Label = Tab2:CreateLabel("Ксено и соляра юзеры пидорасы")
Rayfield:Notify({
   Title = "ВНИМАНИЕ",
   Content = "На телефонах возможны баги",
   Duration = 6.5,
   Image = "x",
})
local Button = Tab:CreateButton({
   Name = "Фарм 1МЛН кейсов",
   Callback = function()
   while true do
    local args = {
    "Trash",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Фарм 100К кейсов",
   Callback = function()
   while true do
    local args = {
    "Trash",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Фарм 10К кейсов",
   Callback = function()
   while true do
    local args = {
    "Trash",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Фарм 1К кейсов",
   Callback = function()
   while true do
    local args = {
    "Trash",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Фарм 100 кейсов",
   Callback = function()
   while true do
    local args = {
    "Trash",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Фарм 10 кейсов",
   Callback = function()
   while true do
    local args = {
    "Trash",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1 then
    auto = 0
    break
  end
end
   end,
})
local Label = Tab4:CreateLabel("Фарм")
local Button = Tab4:CreateButton({
   Name = "Фарм тыкв",
   Callback = function()
   while true do
    local args = {
    	"Claim"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Halloween"):InvokeServer(unpack(args))
    wait(5)
   end
   end,
})
local Button = Tab2:CreateButton({
   Name = "Полностью закрыть GUI",
   Callback = function()
   Rayfield:Destroy()
   end,
})
local Button = Tab3:CreateButton({
   Name = "Фарм 1МЛН кейсов",
   Callback = function()
   while true do
    local args = {
    "Beggar",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab3:CreateButton({
   Name = "Фарм 100K кейсов",
   Callback = function()
   while true do
    local args = {
    "Beggar",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab3:CreateButton({
   Name = "Фарм 10K кейсов",
   Callback = function()
   while true do
    local args = {
    "Beggar",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab3:CreateButton({
   Name = "Фарм 1K кейсов",
   Callback = function()
   while true do
    local args = {
    "Beggar",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab3:CreateButton({
   Name = "Фарм 100 кейсов",
   Callback = function()
   while true do
    local args = {
    "Beggar",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab3:CreateButton({
   Name = "Фарм 10 кейсов",
   Callback = function()
   while true do
    local args = {
    "Beggar",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1 then
    auto = 0
    break
  end
end
   end,
})
local Label = Tab4:CreateLabel("Кейсы")
local Button = Tab4:CreateButton({
   Name = "Открыть Witchy кейс",
   Callback = function()
   local args = {
	  "Witchy",
	  1
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))

   end,
})
local Button = Tab4:CreateButton({
   Name = "Открыть Hollow кейс",
   Callback = function()
   local args = {
	  "Hollow",
	  1
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))

   end,
})
local Button = Tab4:CreateButton({
   Name = "Открыть Underworld кейс",
   Callback = function()
   local args = {
	  "Underworld",
	  1
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))

   end,
})
local Button = Tab4:CreateButton({
   Name = "Открыть Nightmare кейс",
   Callback = function()
   local args = {
	  "Nightmare",
	  1
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))

   end,
})
local Button = Tab4:CreateButton({
   Name = "Открыть Exclusive кейс",
   Callback = function()
   local args = {
	  "Exclusive",
	  1
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))

   end,
})
local Button = Tab5:CreateButton({
   Name = "Фарм 1МЛН кейсов",
   Callback = function()
   while true do
    local args = {
    "Plodder",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab5:CreateButton({
   Name = "Фарм 100K кейсов",
   Callback = function()
   while true do
    local args = {
    "Plodder",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab5:CreateButton({
   Name = "Фарм 10K кейсов",
   Callback = function()
   while true do
    local args = {
    "Plodder",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab5:CreateButton({
   Name = "Фарм 1K кейсов",
   Callback = function()
   while true do
    local args = {
    "Plodder",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab5:CreateButton({
   Name = "Фарм 100 кейсов",
   Callback = function()
   while true do
    local args = {
    "Plodder",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab5:CreateButton({
   Name = "Фарм 10 кейсов",
   Callback = function()
   while true do
    local args = {
    "Plodder",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab6:CreateButton({
   Name = "Фарм 1МЛН кейсов",
   Callback = function()
      while true do
    local args = {
    "Office Clerk",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab6:CreateButton({
   Name = "Фарм 100K кейсов",
   Callback = function()
   while true do
    local args = {
    "Office Clerk",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab6:CreateButton({
   Name = "Фарм 10K кейсов",
   Callback = function()
   while true do
    local args = {
    "Office Clerk",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab6:CreateButton({
   Name = "Фарм 1K кейсов",
   Callback = function()
   while true do
    local args = {
    "Office Clerk",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab6:CreateButton({
   Name = "Фарм 100 кейсов",
   Callback = function()
   while true do
    local args = {
    "Office Clerk",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab6:CreateButton({
   Name = "Фарм 10 кейсов",
   Callback = function()
   while true do
    local args = {
    "Office Clerk",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab7:CreateButton({
   Name = "Фарм 1МЛН кейсов",
   Callback = function()
   while true do
    local args = {
    "Manager",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab7:CreateButton({
   Name = "Фарм 100K кейсов",
   Callback = function()
   while true do
    local args = {
    "Manager",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab7:CreateButton({
   Name = "Фарм 10K кейсов",
   Callback = function()
   while true do
    local args = {
    "Manager",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1000 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab7:CreateButton({
   Name = "Фарм 1K кейсов",
   Callback = function()
   while true do
    local args = {
    "Manager",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 100 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab7:CreateButton({
   Name = "Фарм 100 кейсов",
   Callback = function()
   while true do
    local args = {
    "Manager",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 10 then
    auto = 0
    break
  end
end
   end,
})
local Button = Tab7:CreateButton({
   Name = "Фарм 10 кейсов",
   Callback = function()
   while true do
    local args = {
    "Manager",
    10
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(args))
    local args = {
    "Sell",
    "ALL"
  }
  game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
  wait(1)
  auto += 1
  
  if auto == 1 then
    auto = 0
    break
  end
end
   end,
})
