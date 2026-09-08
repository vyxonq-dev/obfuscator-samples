repeat 
  wait() 
  until game:IsLoaded()
task.spawn(function()
setfpscap(999)
-- Library
_G.RayfieldTheme = "Red"
local rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Justaverageguym/Hub/main/Ea.lua"))()
-- Variables
local ws = game:GetService("Workspace")
local pls = game:GetService("Players")
local cl = pls.LocalPlayer
local rs = game:GetService("RunService")

task.spawn(function()
local Window = rayfield:CreateWindow({
   Name = "Ethical apples farm",
   LoadingTitle = "......",
   LoadingSubtitle = "by Sirius",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
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
      Note = "Nozz method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Tab 1", 4483362458) 
local Section = Tab:CreateSection("Main")

local cp,sp,spo,autohars,autoharsl,autoca,autocal,autos,autosl,autocfp,autocfpl,autorpa,autorpal,autorpall
task.spawn(function()
for _,v in next,ws.Plots:GetChildren() do 
  if v.Name:lower():match("plate") and v:FindFirstChild("PlayerOwned").Value == cl then
      cp = v
    end
end

task.spawn(function()
repeat 
  wait()
for _,v in next,ws.Map:GetChildren() do 
 if v.Name == "SellBox" and v:IsA("Model") and v:FindFirstChild("SellPart") then 
   local dist = (v:FindFirstChild("SellPart").Position - cp:FindFirstChild("GrassTile46").Position).magnitude
  if dist < 100 then 
    sp = v:FindFirstChild("SellPart")
    spo = sp.Position
  end
 end
end
until sp
end)

for _,v in next,cp.Structures:GetDescendants() do
  if v:IsA("ProximityPrompt") and v.Parent.Name == "TreePart" then  
      v.PromptShown:Connect(function()
       if autohars then 
       fireproximityprompt(v) 
       end
     end)
  end
end
cp.Structures.DescendantAdded:Connect(function(v)
spawn(function()
 if v:IsA("ProximityPrompt") and v.Parent.Name == "TreePart" then 
  v.PromptShown:Connect(function()
   if autohars then 
    fireproximityprompt(v)
    end
   end)
 end
end)
 end)
end)

 local Toggle = Tab:CreateToggle({
   Name = "Autoharvest tree",
   CurrentValue = false,
   Flag = "Autoharvest",
   Callback = function(Value)
   autohars = Value 
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Autocollects apples",
   CurrentValue = false,
   Flag = "Autocollect",
   Callback = function(Value)
   autoca = Value 
  if autoca then 
   autocal = rs.Stepped:Connect(function()
     task.spawn(function()
    if cl.Character then
      for _,v in next,ws.Apples:GetChildren() do 
       if v:IsA("BasePart") and not v.Name:lower():match("poison") and v:FindFirstChild("PlayerOwned") and  v:FindFirstChild("PlayerOwned").Value == cl then 
        firetouchinterest(v,cl.Character:FindFirstChild("HumanoidRootPart"),0)
        firetouchinterest(v,cl.Character:FindFirstChild("HumanoidRootPart"),1)
       end
      end
    end 
    end)
   end)
   else 
      if autocal then 
        autocal:Disconnect() 
        autocal = nil 
      end
    end
   end,
}) 
local Toggle = Tab:CreateToggle({
   Name = "Autosell",
   CurrentValue = false,
   Flag = "Autosell",
   Callback = function(Value)
   autos = Value 
  if autos then 
   autosl = rs.Stepped:Connect(function()
     task.spawn(function()
    if cl.Character then
     firetouchinterest(sp,cl.Character:FindFirstChild("HumanoidRootPart"),0)
     firetouchinterest(sp,cl.Character:FindFirstChild("HumanoidRootPart"),1)
    end 
    end)
     end)
  else 
    if autosl then
      autosl:Disconnect() 
      autosl = nil
    end
   end
   end,
})
local Section = Tab:CreateSection("Misc")
local Toggle = Tab:CreateToggle({
   Name = "Autocollect water apple from the pond",
   CurrentValue = false,
   Flag = "Autocolelctll",
   Callback = function(Value)
   autocfp = Value 
  if autocfp then 
   autocfpl = rs.Stepped:Connect(function()
     task.spawn(function()
    if cl.Character then
     firetouchinterest(ws.Map.Water,cl.Character:FindFirstChild("HumanoidRootPart"),0)
     firetouchinterest(ws.Map.Water,cl.Character:FindFirstChild("HumanoidRootPart"),1)
    end 
    end)
     end)
  else 
    if autocfpl then
      autocfpl:Disconnect() 
      autocfpl = nil
    end
   end
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Autoremove poisonous apple & pollutions",
   CurrentValue = false,
   Flag = "Autormeoe",
   Callback = function(Value)
   autorpa = Value 
  if autorpa then 
   for _,v in next,ws.Apples:GetChildren() do 
     if v.Name:lower():match("poison") then 
       v:Destroy()
     end 
   end
   autorpal = ws.Apples.ChildAdded:Connect(function(v)
    spawn(function()
     if v.Name:lower():match("poison") then 
       v:Destroy() 
       end
     end)
   end)
  for _,v in next,ws.Pollution:GetChildren() do 
   if v:IsA("BasePart") then
     v:Destroy()
    end 
  end
   autorpall = ws.Pollution.ChildAdded:Connect(function(v)
     spawn(function()
     v:Destroy()
     end)
    end)
  else 
    if autorpal then
      autorpal:Disconnect() 
      autorpal = nil
    end
    if autorpall then 
      autorpall:Disconnect() 
      autorpall = nil 
    end
   end
   end,
})
local Section = Tab:CreateSection("Shop & Items")
local st,ss = {"Garry's Shop","Jolly Mart","aMAZEing Deals Shop","Barry's Shop"},"Garry's Shop"
local Dropdown = Tab:CreateDropdown({
   Name = "Shops",
   Options = st,
   CurrentOption = st[1],
   MultipleOptions = false,
   Flag = "Yes", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
    ss = Option
   end,
})
local Button = Tab:CreateButton({
   Name = "Goto selected shop",
   Callback = function()
 task.spawn(function()
   local cc = cl.Character:FindFirstChild("HumanoidRootPart").CFrame
  if ss == st[1] then   
   cc = ws.Map.SapplingPad.CFrame
  elseif ss == st[2] then 
   cc = ws.Map.MarketPad.CFrame
  elseif ss == st[3] then 
   cc = ws.Maze.Shop.ShopPart.CFrame
  elseif ss == st[4] then 
   cc = ws.MeatMap.SapplingPad.CFrame
  end
 end)
 end,
})
local Button = Tab:CreateButton({
   Name = "Bring selected shop",
   Callback = function()
 task.spawn(function()
   local cc = cl.Character:FindFirstChild("HumanoidRootPart").Position
  if ss == st[1] then   
    ws.Map.SapplingPad.Position = cc
  elseif ss == st[2] then 
    ws.Map.MarketPad.Position = cc
  elseif ss == st[3] then 
    ws.Maze.Shop.ShopPart.Position = cc
  elseif ss == st[4] then 
   ws.MeatMap.SapplingPad.Position = cc
  end
 end)
 end,
})

local items = {"None","High Caliber Turret","Ultra Turret"}
local selecteditem = "None"
for _,v in next,game:GetService("ReplicatedStorage").Structs:GetChildren() do 
  if v:FindFirstChild("ItemName") and v:FindFirstChild("StructData") and not table.find(items,v:FindFirstChild("ItemName").Value) then 
   table.insert(items, v:FindFirstChild("ItemName").Value)
 end
end

local Dropdown = Tab:CreateDropdown({
    Name = "Items",
    Options = items,
    CurrentOption = items[1],
    Flag = "Yese", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        selecteditem = Option
    end,
})

local Button = Tab:CreateButton({
   Name = "Buy selected item",
   Callback = function()
 task.spawn(function()
local args = {
    [1] = selecteditem,
    [2] = true
}

game:GetService("ReplicatedStorage").Remote.BuyEvent:FireServer(unpack(args))
 end)
end,
})

 end)
end)

