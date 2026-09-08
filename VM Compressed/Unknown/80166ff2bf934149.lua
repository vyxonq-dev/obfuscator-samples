local suc, res = pcall(function ()
    local blocksutil = require(game:GetService("ReplicatedStorage").Modules.Utilities.BlocksUtil)
    local function setblock(block, key, value)
        blocksutil.BlockInfo[block][key] = 999
    end

    local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/twitch-stremaer/Neptuneeeeeee/refs/heads/main/funny.lua"))()
    local window = lib.Window()
    local blocktab = window.Tab("Blocks")
    local credits = window.Tab("Credits")

    local mainsection = blocktab.Section("Blocks")
    mainsection.Toggle("Infinite Fuel", function(call)
        if call == false then
            setblock("fuel_1", "Fuel", 5)
            setblock("fuel_2", "Fuel", 10)
            setblock("fuel_3", "Fuel", 15)
        else
            setblock("fuel_1", "Fuel", 9e9)
            setblock("fuel_2", "Fuel", 9e9)
            setblock("fuel_3", "Fuel", 9e9)
        end
    end, false)
    mainsection.Toggle("Ultra Wings", function(call)
        if call == false then
            setblock("wing_1", "Lift", 4)
            setblock("wing_2", "Lift", 8)
            setblock("wing_3", "Lift", 10)
        else
            setblock("wing_1", "Lift", 20)
            setblock("wing_2", "Lift", 20)
            setblock("wing_blood", "Lift", 20)
        end
    end, false)
    mainsection.Toggle("Better Propellors", function(call)
        if call == false then
            setblock("propeller_0", "Force", 4)
            setblock("propeller_1", "Force", 20)
            setblock("propeller_2", "Force", 35)
            setblock("propeller_3", "Force", 42)
            setblock("propeller_blood", "Force", 50)
        else
            setblock("propeller_0", "Force", 150)
            setblock("propeller_1", "Force", 150)
            setblock("propeller_2", "Force", 150)
            setblock("propeller_3", "Force", 150)
            setblock("propeller_blood", "Force", 150)
        end
    end, false)

    local credssection = credits.Section("Credits")
    credssection.Button("Made by NeptX (previously name hub)", function () end)
    credssection.Button("@namehubscript on rscripts", function () end)
end)

if not suc then
    game.StarterGui:SetCore("SendNotification", {Title = "your executors probably shit lol, check console", Text = ":3", Duration = 10})
    print("the error: ", res)
end
