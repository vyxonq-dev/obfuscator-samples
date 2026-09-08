

local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()
local placeid = game.PlaceId
print(placeid)
local sources = {
    [4566572536] = {
        "Vehicle Legends",
        "https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Vehicle%20Legends.lua"
    },
    [10704789056] = {
        "Drive World",
        "https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Drive%20World.lua"
    },
    [3351674303] = {
        "Driving Empire",
        "https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Driving%20Empire.lua"
    },
    [171391948] = {
        "Vehicle Simulator",
        "https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Vehicle%20Simulator.lua"
    },
    [1554960397] = {
        "Car Dealership Tycoon",
        "https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Car%20Dealership.lua"
    },
    [54865335] = {
        "Ultimate Driving",
        "https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Ultimate%20Driving.lua"
    }
}


function executesource()
    for i, v in pairs(sources) do 
        if i == placeid then 
            loadstring(game:HttpGet(v[2]))()
        end
    end
    
    if game:GetService("Workspace"):FindFirstChild("Waterfall") and game:GetService("Workspace"):FindFirstChild("Road") then 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/houjk2/Boosthub/main/boostexecutables/Ultimate%20Driving.lua"))()
    end
end

function getgamename()
    for i, v in pairs(sources) do 
        if i == placeid then 
            return v[1]
        end
    end
    
    if game:GetService("Workspace"):FindFirstChild("Waterfall") and game:GetService("Workspace"):FindFirstChild("Road") then 
        return "Ultimate Driving"
    end
    
    return "Universal"
end

local window = BlekLib:Create({
    Name = getgamename().." RoSploits Car Boost",
    StartupSound = {
        Toggle = true,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1
    }
})

local tabBoost = window:Tab("Boost")
local tabCredits = window:Tab("Credits")

if sources[placeid] then 
    tabBoost:Button("Boost!", function()
        local succ, err = pcall(function()
            executesource()
        end)
        
        if err then 
            print("Car Boost ERROR:", err)
        end
    end)
else 
    -- Ultimate Driving
    if game:GetService("Workspace"):FindFirstChild("Waterfall") and game:GetService("Workspace"):FindFirstChild("Road") then 
        tabBoost:Button("Boost!", function()
            local succ, err = pcall(function()
                executesource()
            end)
            
            if err then 
                print("Car Boost ERROR:", err)
            end
        end)
    
    else 
        tabBoost:Button("Universal Boost (Coming Soon)", function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Coming Soon",
                Text = "Universal Boost is not yet a function, work in progress",
                Duration = 3
            })
        end)
    end
end

tabCredits:Label("Made by RoSploits with the Bleklib library")

tabCredits:Button("Copy Channel Link", function() 
    pcall(function()
        setclipboard("https://www.youtube.com/channel/UCOe-TPSJcvGlutJ40fWvXlw")
            game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Copied Channel Link",
            Text = "https://www.youtube.com/channel/UCOe-TPSJcvGlutJ40fWvXlw",
            Duration = 3
        })
    end)
end)


