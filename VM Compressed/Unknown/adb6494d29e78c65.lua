local windUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local lPlayer = game.Players.LocalPlayer
local players = game:GetService("Players")

local rs = game:GetService("ReplicatedStorage")
local events = rs.Events
local hdlead = lPlayer:FindFirstChild("hiddenleaderstats")

local remotes = {
    ["Push"] = events:FindFirstChild("PushEvent"),
    ["Rebirth"] = events:FindFirstChild("ascendEvent"),
    ["Badges"] = events:FindFirstChild("givePlayerBadge")
}

local badges = {}
local playersList = {}

local cfg = {
    autoRebirth = false,
    player2Push = ""
}

function updatePlayerList(list, dd)
    players.PlayerAdded:Connect(function(plr)
        if plr.Name ~= lPlayer.Name then
            table.insert(list, plr.Name)
            dd:Refresh(list)
        end
    end)

    players.PlayerRemoving:Connect(function(plr)
        local i = table.find(list, plr.Name)
        if i then
            table.remove(list, i)
            dd:Refresh(list)
        end
    end)
end

for _, plr in pairs(players:GetPlayers()) do
    if plr.Name ~= lPlayer.Name then
        table.insert(playersList, plr.Name)
    end
end

for _, badge in pairs(hdlead:GetChildren()) do
    if not badge:IsA("BoolValue") then continue end
    table.insert(badges, badge.Name)
end

local window = windUI:CreateWindow({
    Title = "the pay 2 win obby | script",
    Icon = "cat",
    Author = "by k1llm3sixy",
    Folder = "tp2wo"
})

window:OnDestroy(function()
    cfg.autoRebirth = false
    cfg.player2Push = ""
end)

window:EditOpenButton({
    Title = "Open",
    Icon = "chevrons-left-right-ellipsis",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local mainTab = window:Tab({ Title = "Main" })
local trollTab = window:Tab({ Title = "Troll" })

mainTab:Button({
    Title = "Get all badges",
    Callback = function() getBadges() end
})

mainTab:Toggle({
    Title = "Auto Rebirth",
    Icon = "check",
    Default = false,
    Callback = function(state)
        cfg.autoRebirth = state
        toggleAutoRebirth()
    end
})

local pushDropdown = trollTab:Dropdown({
    Title = "Select player",
    Desc = "Player to push",
    Values = playersList,
    Value = playersList[1],
    Callback = function(plr) cfg.player2Push = plr end
})

trollTab:Button({
    Title = "Push player!",
    Callback = function() pushPlayer() end
})

updatePlayerList(playersList, pushDropdown)

function getBadges()
    for _, badge in pairs(badges) do
        remotes["Badges"]:FireServer(badge)
    end
end

function toggleAutoRebirth()
    while cfg.autoRebirth do
        remotes["Rebirth"]:FireServer(lPlayer)
        task.wait(0.7)
    end
end

function pushPlayer()
    remotes["Push"]:FireServer(players:FindFirstChild(cfg.player2Push), Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
end
