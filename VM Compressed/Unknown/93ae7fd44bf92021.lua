--[[
    Impossible Squid Game - Enhanced Utility Suite
    Refactored for Rayfield UI Library
--]]

local Services = setmetatable({}, {
    __index = function(self, serviceName)
        local service = game:GetService(serviceName)
        self[serviceName] = service
        return service
    end
})

local Players = Services.Players
local ReplicatedStorage = Services.ReplicatedStorage
local Workspace = Services.Workspace

local LocalPlayer = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("RemoteEvents", 10)
local CrateRemote = Remotes and Remotes:WaitForChild("crateRemote", 10)

-- // Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BULE HUB v2.0",
   LoadingTitle = "BULE HUB Loading...",
   LoadingSubtitle = "by peer & xcx",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image

-- // State Management
local State = {
    MoneyFarm = false,
    GlassESP = false,
}

local Cache = {
    Connections = {},
    ESPObjects = {},
}

-- // Helper Functions
local function SafeFire(...)
    if not CrateRemote then return end
    local args = {...}
    pcall(function()
        CrateRemote:FireServer(table.unpack(args))
    end)
end

local function GetCharacter()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
        if char:FindFirstChildOfClass("Humanoid").Health > 0 then
            return char
        end
    end
    return nil
end

-- // Feature: Infinite Money Farm
local function StartMoneyFarm()
    task.spawn(function()
        while State.MoneyFarm do
            SafeFire("processCrate", 3)
            task.wait(0.15)

            if not State.MoneyFarm then break end

            SafeFire("processReward", 3)
            task.wait(0.35)
        end
    end)
end

MainTab:CreateToggle({
   Name = "Inf Money",
   CurrentValue = false,
   Flag = "InfMoneyToggle",
   Callback = function(active)
       State.MoneyFarm = active
       if active then
           StartMoneyFarm()
       end
   end,
})

-- // Feature: Glass ESP
local function ClearGlassESP()
    for _, part in ipairs(Cache.ESPObjects) do
        if part and part.Parent then
            part.Transparency = 0
            part.Material = Enum.Material.Plastic

            local espHighlight = part:FindFirstChild("GlassESP")
            if espHighlight then
                espHighlight:Destroy()
            end
        end
    end
    table.clear(Cache.ESPObjects)

    for name, conn in pairs(Cache.Connections) do
        if name:sub(1, 4) == "ESP_" then
            conn:Disconnect()
            Cache.Connections[name] = nil
        end
    end
end

local function ApplyGlassESPToPart(part)
    if not part:IsA("BasePart") then return end
    
    table.insert(Cache.ESPObjects, part)

    local existing = part:FindFirstChild("GlassESP")
    if existing then existing:Destroy() end

    local isBreakable = part:FindFirstChild("breakable") ~= nil

    if not isBreakable then
        part.Color = Color3.fromRGB(0, 255, 120)
        part.Material = Enum.Material.Neon
        part.Transparency = 0

        local highlight = Instance.new("Highlight")
        highlight.Name = "GlassESP"
        highlight.FillColor = Color3.fromRGB(0, 255, 120)
        highlight.FillTransparency = 0.25
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.OutlineTransparency = 0
        highlight.Parent = part
    else
        part.Color = Color3.fromRGB(255, 50, 50)
        part.Material = Enum.Material.Neon
        part.Transparency = 0.75
    end
end

local function ScanAndApplyESP()
    local segmentSystem = Workspace:FindFirstChild("segmentSystem")
    if not segmentSystem then return end
    
    local segments = segmentSystem:FindFirstChild("Segments")
    if not segments then return end

    local function ProcessFolder(folder)
        for _, part in ipairs(folder:GetChildren()) do
            ApplyGlassESPToPart(part)
        end
        Cache.Connections["ESP_Folder_" .. folder:GetDebugId()] = folder.ChildAdded:Connect(ApplyGlassESPToPart)
    end

    for _, segment in ipairs(segments:GetChildren()) do
        local folder = segment:FindFirstChild("Folder")
        if folder then
            ProcessFolder(folder)
        end
    end

    Cache.Connections["ESP_SegmentsAdded"] = segments.ChildAdded:Connect(function(newSegment)
        task.wait(0.1)
        local folder = newSegment:WaitForChild("Folder", 2)
        if folder then
            ProcessFolder(folder)
        end
    end)
end

MainTab:CreateToggle({
   Name = "ESP Correct Glass",
   CurrentValue = false,
   Flag = "GlassESPToggle",
   Callback = function(active)
       State.GlassESP = active
       ClearGlassESP()

       if active then
           ScanAndApplyESP()
       end
   end,
})

-- // Feature: Instant Win Teleport
MainTab:CreateButton({
   Name = "Instant Win",
   Callback = function()
       local char = GetCharacter()
       if char then
           char.HumanoidRootPart.CFrame = CFrame.new(-747.048, -2.1, -524.388)
       end
   end,
})

-- // Credits Section
MainTab:CreateSection("Credits")
MainTab:CreateLabel("Refactored & Maintained by peer & xcx")
