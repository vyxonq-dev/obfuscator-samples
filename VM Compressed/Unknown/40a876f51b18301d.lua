local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub", HidePremium = false, SaveConfig = falss, ConfigFolder = "OrionTest"})
local workspace = game:GetService("Workspace")
local event = game:GetService("ReplicatedStorage")["Events"]

local args = {
    [1] = "{edcd8178-23dd-4621-94b4-8ade0f639ac1}",
    [2] = workspace.Bombs.Normal,
    [3] = Vector3.new(50.048213958740234, -44.50149917602539, -174.61976623535156)
}

--game:GetService("ReplicatedStorage").Events.ProjectileHit:FireServer(unpack(args))

local args = {
    [1] = "Sword",
    [2] = {
        ["name"] = "Wooden",
        ["hit"] = workspace.Bombs.Normal
    }
}

--game:GetService("ReplicatedStorage").Events.WeaponAction:FireServer(unpack(args))

local T1 = Window:MakeTab({
   Name = "Main",
   Icon = "rbxassetid://",
   PremiumOnly = false
})

local T2 = Window:MakeTab({
   Name = "Chest",
   Icon = "rbxassetid://",
   PremiumOnly = false
})

T1:AddToggle({
  Name = "Instant kill ( use wooden sword )",
  Default = false,
  Callback = function(Value)
     _G.bomb = Value
      while wait() do
        if _G.bomb == false then break end
        for i,v in pairs(workspace["Bombs"]:GetChildren()) do
          event["WeaponAction"]:FireServer("Sword",{["name"] = "Wooden",["hit"] = v})
        end
      end
  end    
})

T1:AddToggle({
  Name = "Spin",
  Default = false,
  Callback = function(Value)
     _G.spin = Value
      while wait() do
        if _G.spin == false then break end 
        event["Spin"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Claim daily gifts",
  Default = false,
  Callback = function(Value)
     _G.dg = Value
      while wait() do
        if _G.dg == false then break end 
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("1")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("2")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("3")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("4")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("5")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("6")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("7")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("8")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("9")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("10")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("11")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("12")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("13")
        game:GetService("ReplicatedStorage").Events.ClaimGift:InvokeServer("14")
      end
  end    
})

T2:AddTextbox({
  Name = "Enter box name",
  Default = "?",
  TextDisappear = true,
  Callback = function(Value)
     _G.shit = Value or "Golden Crate"
  end  
})

T2:AddToggle({
  Name = "Open",
  Default = false,
  Callback = function(Value)
     _G.oc = Value
      while wait() do
        if _G.oc == false then break end 
        event["CratePurchase"]:InvokeServer(_G.shit)
      end
  end    
})
