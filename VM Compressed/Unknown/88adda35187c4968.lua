local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Cola menu v5.3 [FINISHED]",
   Icon = 0,
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ShowText = "Cola menu v5.3 [FINISHED]",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "Big Hub" },
   Discord = { Enabled = false, Invite = "noinvitelink", RememberJoins = true },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Cola's Tab
local ColaTab = Window:CreateTab("Cola's", 0)
local ColaSection = ColaTab:CreateSection("Cola Parts")

local function scanColaParts()
    local parts = {}
    for _, obj in ipairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:sub(-4) == "Cola" then
            table.insert(parts, obj)
        end
    end
    return parts
end

local colaParts = scanColaParts()
for _, part in ipairs(colaParts) do
    ColaTab:CreateButton({
        Name = "Teleport to " .. part.Name,
        Callback = function()
            if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                localPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)
            end
        end,
        SectionParent = ColaSection
    })
end

ColaTab:CreateButton({
    Name = "Spawn All Cola Parts To Me",
    Callback = function()
        if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = localPlayer.Character.HumanoidRootPart
            for _, cola in ipairs(scanColaParts()) do
                cola.CFrame = rootPart.CFrame + Vector3.new(0, 1, 0)
            end
        end
    end,
    SectionParent = ColaSection
})

-- menu's Tab
local MenuTab = Window:CreateTab("menu's", 0)
local MenuSection = MenuTab:CreateSection("Script Utilities")

MenuTab:CreateButton({
    Name = "Infinite Yield [Admin]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    end,
    SectionParent = MenuSection
})

-- Door unlocker [server sided] Tab (shows keypad code)
local DoorUnlockTab = Window:CreateTab("Door unlocker [server sided]", 0)
DoorUnlockTab:CreateSection("Keypad code: 2 -> 5 -> 9 -> 9 -> Enter")

-- Door Menu Tab - List and teleport to all 'Open' doors/parts
local DoorMenuTab = Window:CreateTab("Door Menu", 0)
-- Big white text (section) at the top
DoorMenuTab:CreateSection("Really glitchy but still work's 👍")
local DoorMenuSection = DoorMenuTab:CreateSection("Doors")

local function listOpenDoors()
    local doors = {}
    for _, obj in ipairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Open" then
            table.insert(doors, obj)
        end
    end
    return doors
end

DoorMenuTab:CreateButton({
    Name = "List All Open Doors",
    Callback = function()
        local doors = listOpenDoors()
        if #doors == 0 then
            Rayfield:Notify({Title = "Door Finder", Content = "No 'Open' doors found.", Duration = 4})
            return
        end
        for _, door in ipairs(doors) do
            DoorMenuTab:CreateButton({
                Name = "Teleport to: " .. door:GetFullName(),
                Callback = function()
                    if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        localPlayer.Character.HumanoidRootPart.CFrame = door.CFrame + Vector3.new(0, 3, 0)
                        Rayfield:Notify({Title = "Teleported", Content = "You teleported to: " .. door:GetFullName(), Duration = 4})
                    end
                end,
                SectionParent = DoorMenuSection
            })
        end
        Rayfield:Notify({Title = "Doors Listed", Content = "Found " .. tostring(#doors) .. " 'Open' doors.", Duration = 4})
    end,
    SectionParent = DoorMenuSection
})