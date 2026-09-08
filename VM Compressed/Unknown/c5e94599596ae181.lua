local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Rock Finder by bloxyKing",
    Icon = nil,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ShowText = "Rayfield",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RockFinder",
        FileName = "RockHub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {}
})

local MainTab = Window:CreateTab("Main Tab", nil)
local ScanSection = MainTab:CreateSection("Scan & Teleport")

local rockButtons = {}
local scannedRocks = {}  -- Save the last scan's results

local function clearRockButtons()
    for _, btn in ipairs(rockButtons) do
        btn:Destroy()
    end
    rockButtons = {}
end

local function scanRocks()
    clearRockButtons()
    scannedRocks = {}
    local rocksFolder = workspace:FindFirstChild("Rocks")
    if not rocksFolder then
        Rayfield:Notify({
            Title = "Error",
            Content = "No 'Rocks' folder found in workspace.",
            Duration = 4
        })
        return
    end
    for _, obj in ipairs(rocksFolder:GetDescendants()) do
        local nameLower = obj.Name:lower()
        if obj:IsA("BasePart") and
            (nameLower:find("rock") or nameLower:sub(-4) == "rock") and
            not (nameLower:find("label") or nameLower:find("description") or nameLower:find("name")) then
            table.insert(scannedRocks, obj)
        end
    end

    if #scannedRocks == 0 then
        Rayfield:Notify({
            Title = "Result",
            Content = "No Rock parts found in 'Rocks' folder!",
            Duration = 4
        })
    else
        Rayfield:Notify({
            Title = "Scan Complete",
            Content = "Found " .. #scannedRocks .. " Rock parts in 'Rocks' folder.",
            Duration = 4
        })
        -- Insert the rock buttons at the TOP (before scan button)
        for _, part in ipairs(scannedRocks) do
            local btn = MainTab:CreateButton({
                Name = "Teleport to: " .. part.Name,
                Callback = function()
                    local player = game.Players.LocalPlayer
                    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 4, 0)
                    end
                end
            })
            table.insert(rockButtons, btn)
        end
    end
end

-- Teleport all rocks to ONE spot (no offset, so they overlap)
MainTab:CreateButton({
    Name = "Teleport all Rocks to me",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local torsoPos = player.Character.HumanoidRootPart.Position
            if #scannedRocks > 0 then
                for _, part in ipairs(scannedRocks) do
                    part.Position = torsoPos
                end
                Rayfield:Notify({
                    Title = "Done",
                    Content = "Teleported all Rocks to your torso!",
                    Duration = 4
                })
            else
                Rayfield:Notify({
                    Title = "Scan needed",
                    Content = "Please scan for Rocks first!",
                    Duration = 4
                })
            end
        end
    end
})

-- Scan button created LAST (so it's at the bottom)
MainTab:CreateButton({
    Name = "Scan for all Rock in Rocks folder",
    Callback = scanRocks
})