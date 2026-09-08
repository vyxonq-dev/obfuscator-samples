-- Check Game
if game.PlaceId == 13936502350 then
    local CurrentVersion = "V1 - Plane Simulator"

    -- Call The Library
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

    -- Main Frame
    local GUI = Mercury:Create{
        Name = CurrentVersion,
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Dark,
        Link = "https://github.com/deeeity/mercury-lib"
    }

    -- Local Variables
    local isInfCoins = false
    local isOnLeaderboard = false

    -- Coins Tab
    local CoinsTab = GUI:Tab{
        Name = "Auto Coins"
    }

    CoinsTab:Toggle{
        Name = "Inf Coins",
        StartingState = false,
        Description = "Grants infinite coins continuously",
        Callback = function(state) 
            isInfCoins = state
            if isInfCoins then
                task.spawn(function()
                    while isInfCoins do
                        local args = {88999999999999999999999999999999999999999999999999999.0721435546875}
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClientToServer"):WaitForChild("addCloudCoinEvent"):FireServer(unpack(args))
                        task.wait(0.5)
                    end
                end)
            end
        end
    }

    -- Leaderboard Tab
    local LeaderboardTab = GUI:Tab{
        Name = "Leaderboard"
    }

    LeaderboardTab:Toggle{
        Name = "Get On Leaderboard",
        StartingState = false,
        Description = "Tries to put you #1 on the distance leaderboard",
        Callback = function(state)
            isOnLeaderboard = state
            if isOnLeaderboard then
                task.spawn(function()
                    while isOnLeaderboard do
                        local args = {8000000000000000000000}
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClientToServer"):WaitForChild("updateTopDistanceEvent"):FireServer(unpack(args))
                        task.wait(0.5)
                    end
                end)
            end
        end
    }
end
