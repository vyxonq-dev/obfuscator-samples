loadstring(game:HttpGet("https://raw.githubusercontent.com/HEnVELINC/G2GUI/refs/heads/main/G2B%20MDL"))()
local G2GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/HEnVELINC/G2GUI/refs/heads/main/G2L%20LOADER"))()

local seedWindow = G2GUI:CreateWindow("🌱 Buy Seeds")
local toolWindow = G2GUI:CreateWindow("🪓 Buy Tools & Gear") 
local sellWindow = G2GUI:CreateWindow("💰 Sell Logs")

local autoBuySeeds = false
local autoSellLogs = false

seedWindow:Button("🌱 Buy Maple Seeds", function()
    local args = {"Maple", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌳 Buy Poplar Seeds", function()
    local args = {"Poplar", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🍂 Buy Red Maple Seeds", function()
    local args = {"Red Maple", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌿 Buy Birch Seeds", function()
    local args = {"Birch", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🍈 Buy Melon Seeds", function()
    local args = {"Melon", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌺 Buy Magnolia Seeds", function()
    local args = {"Magnolia", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌴 Buy Palm Seeds", function()
    local args = {"Palm", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌳 Buy Oak Seeds", function()
    local args = {"Oak", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌲 Buy Spruce Seeds", function()
    local args = {"Spruce", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌸 Buy Cherry Blossom", function()
    local args = {"Cherry Blossom", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🍃 Buy Ash Seeds", function()
    local args = {"Ash", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌲 Buy Red Wood Seeds", function()
    local args = {"Red Wood", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌳 Buy Baobab Seeds", function()
    local args = {"Baobab", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Button("🌸 Buy Weeping Cherry", function()
    local args = {"Weeping Cherry", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
end)

seedWindow:Toggle("🔄 Auto Buy Maple", false, function(state)
    autoBuySeeds = state
    spawn(function()
        while autoBuySeeds do
            local args = {"Maple", 1}
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args))
            wait(3)
        end
    end)
end)


toolWindow:Button("🪓 Buy Wooden Axe", function()
    local args = {"Wooden Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Stone Axe", function()
    local args = {"Stone Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Bronze Axe", function()
    local args = {"Bronze Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Iron Axe", function()
    local args = {"Iron Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Golden Axe", function()
    local args = {"Golden Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Diamond Axe", function()
    local args = {"Diamond Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Obsidian Axe", function()
    local args = {"Obsidian Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)

toolWindow:Button("🪓 Buy Magma Axe", function()
    local args = {"Magma Axe", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args))
end)


toolWindow:Button(" Buy Watering Can", function()
    local args = {"Watering Can", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args))
end)

toolWindow:Button("Buy Sprinkler", function()
    local args = {"Sprinkler", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args))
end)

toolWindow:Button("Buy Advance Sprinkler", function()
    local args = {"Advance Sprinkler", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args))
end)

toolWindow:Button("💦Buy Pro Sprinkler", function()
    local args = {"Pro Sprinkler", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args))
end)

toolWindow:Button(" Buy Lightning Rod", function()  
    local args = {"Lighting Rod", 1}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args))
end)


sellWindow:Button("Sell All Logs", function()
    local args = {"Everything"}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("SellAllLogs"):InvokeServer(unpack(args))
end)

sellWindow:Toggle("🔄 Auto Sell Logs", false, function(state)
    autoSellLogs = state
    spawn(function()
        while autoSellLogs do
            local args = {"Everything"}
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("SellAllLogs"):InvokeServer(unpack(args))
            wait(5)
        end
    end)
end)


sellWindow:Button("🛒 Buy Basic Setup", function()
    spawn(function()
        
        local args1 = {"Maple", 5}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args1))
        wait(0.5)
        
        local args2 = {"Stone Axe", 1}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args2))
        wait(0.5)
        
        local args3 = {"Watering Can", 1}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args3))
    end)
end)

sellWindow:Button(" Buy best Setup", function()
    spawn(function()
        
        local args1 = {"Red Wood", 2}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuySeed"):InvokeServer(unpack(args1))
        wait(0.5)
        
        local args2 = {"Diamond Axe", 1}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyAxe"):InvokeServer(unpack(args2))
        wait(0.5)
        
        local args3 = {"Pro Sprinkler", 1}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("BuyGear"):InvokeServer(unpack(args3))
    end)
end)

print("S")
print("K")
print("I")
print("D")
print("D")
print("E")
print("R")