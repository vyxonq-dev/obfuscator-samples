
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local ClientBuildings = workspace:WaitForChild("ClientBuildings")
local Ore = workspace:WaitForChild("Ore")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local states = {
    autoTP = false,
    autoOpen = false,
    autoBring = false,
    autoRebirth = false,
    autoUpgrade = false,
    autoSell = false,
    autoLoadLayout = false,
    autoPlotUpgrade = false
}

local crates = {}
local hrp = Character:WaitForChild("HumanoidRootPart")

local fastWait = 0.0001
local midWait = 0.5

local folderName = "D1ehub🌴"

function SaveMyPlot(PlotName)
    if not PlotName or PlotName == "" then return end
    if not isfolder(folderName) then makefolder(folderName) end
    local tbl = {}
    local plot = ClientBuildings:FindFirstChild(LocalPlayer.Name)
    if not plot then return end
    for _, building in pairs(plot:GetChildren()) do
        if building:IsA("Model") and building:GetAttribute("itemId") then
            table.insert(tbl, {
                Id = building:GetAttribute("itemId"),
                CellData = building:GetAttribute("frontLeftCell"),
                Rotation = building:GetAttribute("rotation")
            })
        end
    end
    local encoded = HttpService:JSONEncode(tbl)
    writefile(folderName.."/"..PlotName..".json", encoded)
end

function LoadMyPlot(PlotName)
    if not PlotName or PlotName == "" then return end
    if not isfile(folderName.."/"..PlotName..".json") then return end
    local decoded = HttpService:JSONDecode(readfile(folderName.."/"..PlotName..".json"))
    for _, v in pairs(decoded) do
        ReplicatedStorage.Plot.Remote.RequestPlace:InvokeServer(1, {
            id = v.Id,
            frontLeftCell = v.CellData,
            rotation = v.Rotation
        })
        task.wait(0.1)
    end
end

function GetSavedPlots()
    local list = {}
    if not isfolder(folderName) then return list end
    for _, v in pairs(listfiles(folderName)) do
        if isfile(v) then
            local old = string.split(v, folderName)[2]
            table.insert(list, string.sub(old, 2, string.len(old) - 5))
        end
    end
    return list
end

local function updateCrates()
    crates = {}
    local crateFolder = workspace:FindFirstChild("Crates")
    if crateFolder then
        for _, c in ipairs(crateFolder:GetChildren()) do
            if c:IsA("Model") and c:FindFirstChild("Hitbox") then
                table.insert(crates, c)
            end
        end
    end
end

local function bringAllCrates()
    updateCrates()
    if hrp then
        for _, c in ipairs(crates) do
            if c:FindFirstChild("Hitbox") then
                c.Hitbox.CFrame = hrp.CFrame
            end
        end
    end
end

local function openAllCrates()
    for i = 0, 3 do
        ReplicatedStorage.Remote.UnboxBox:InvokeServer(i)
    end
end

local function sellAllOres()
    local function GetMyPlot() return ClientBuildings:FindFirstChild(LocalPlayer.Name) end
    local function GetMyOres()
        local myOres = Ore:FindFirstChild(LocalPlayer.Name)
        return myOres and myOres:GetChildren() or {}
    end
    for _, ore in pairs(GetMyOres()) do
        for _, building in pairs(GetMyPlot():GetChildren()) do
            if building:FindFirstChild("FurnacePart") then
                firetouchinterest(building.FurnacePart, ore, 0)
                firetouchinterest(building.FurnacePart, ore, 1)
            end
        end
    end
end

local function upgradeAllOres()
    local function GetMyPlot() return ClientBuildings:FindFirstChild(LocalPlayer.Name) end
    local function GetMyOres()
        local myOres = Ore:FindFirstChild(LocalPlayer.Name)
        return myOres and myOres:GetChildren() or {}
    end
    for _, ore in pairs(GetMyOres()) do
        for _, building in pairs(GetMyPlot():GetChildren()) do
            if building:FindFirstChild("UpgradePart") then
                firetouchinterest(building.UpgradePart, ore, 0)
                firetouchinterest(building.UpgradePart, ore, 1)
            end
        end
    end
end

local function upgradeAllPlot()
    local plot = ClientBuildings:FindFirstChild(LocalPlayer.Name)
    if not plot then return end
    for _, building in pairs(plot:GetChildren()) do
        if building:FindFirstChild("UpgradePart") then
            firetouchinterest(building.UpgradePart, hrp, 0)
            firetouchinterest(building.UpgradePart, hrp, 1)
        end
    end
end

local function startAutoRebirth()
    while states.autoRebirth do
        ReplicatedStorage.Remote.Rebirth:InvokeServer()
        task.wait(1)
    end
end

local validKey = "INFERNO-LPzR9hnk"
local savedKey
pcall(function()
    if isfile("D1ehub key🍋/savedKey.txt") then
        savedKey = readfile("D1ehub key🍋/savedKey.txt")
    end
end)

local function checkKey(key)
    if key == validKey then
        if not isfolder("D1ehub key🍋") then makefolder("D1ehub key🍋") end
        writefile("D1ehub key🍋/savedKey.txt", key)
        return true
    else
        WindUI:Notify({
            Title = "❌ Invalid Key",
            Content = "Please get your key at: https://go.linkify.ru/26Cc",
            Duration = 6
        })
        return false
    end
end

if checkKey(savedKey or validKey) then
    local Window = WindUI:CreateWindow({
        Title = "D1ehub🌴",
        Icon = "door-open",
        Author = "Dev: thD1ezx | Co-Dev: KPAKEH | Telegram: https://t.me/+yipDNC2ndrE3NTgy",
        Folder = "D1ehub🌴",
        Size = UDim2.fromOffset(580, 460),
        Transparent = true,
        Theme = "Dark",
        Resizable = true,
        SideBarWidth = 200,
        BackgroundImageTransparency = 0.42,
        HideSearchBar = true,
        ScrollBarEnabled = false,
        KeySystem = { 
            Key = { validKey },
            Note = "Get your key at link below",
            Thumbnail = { Image = "rbxassetid://", Title = "D1ehub Key" },
            URL = "https://go.linkify.ru/26Cc",
            SaveKey = true,
        },
    })

    local mainSection = Window:Section({ Title = "Main" })
    local mainControlTab = mainSection:Tab({ Title = "⚙️ Main" })
    local cratesControlTab = mainSection:Tab({ Title = "📦 Crates" })
    local layoutControlTab = mainSection:Tab({ Title = "🏗️ Layout" })
    local fileTab = mainSection:Tab({ Title = "📁 File" })

mainControlTab:Toggle({
    Title = "💎 Auto Upgrade Ores",
    Value = false,
    Callback = function(v)
        states.autoUpgrade = v
        if v then
            task.spawn(function()
                while states.autoUpgrade do
                    upgradeAllOres()
                    task.wait(midWait)
                end
            end)
        end
    end
})

mainControlTab:Toggle({
    Title = "💰 Auto Sell Ores",
    Value = false,
    Callback = function(v)
        states.autoSell = v
        if v then
            task.spawn(function()
                while states.autoSell do
                    sellAllOres()
                    task.wait(midWait)
                end
            end)
        end
    end
})

mainControlTab:Toggle({
    Title = "♻️ Auto Rebirth",
    Value = false,
    Callback = function(v)
        states.autoRebirth = v
        if v then
            task.spawn(startAutoRebirth)
        end
    end
})

mainControlTab:Toggle({
    Title = "🏗️ Auto Plot Upgrade",
    Value = false,
    Callback = function(v)
        states.autoPlotUpgrade = v
        if v then
            task.spawn(function()
                while states.autoPlotUpgrade do
                    upgradeAllPlot()
                    task.wait(midWait)
                end
            end)
        end
    end
})

cratesControlTab:Toggle({
    Title = "📥 Auto-Bring Crates",
    Value = false,
    Callback = function(v)
        states.autoBring = v
        if v then
            task.spawn(function()
                while states.autoBring do
                    bringAllCrates()
                    task.wait(fastWait)
                end
            end)
        end
    end
})

cratesControlTab:Toggle({
    Title = "🎁 Auto-Open Crates",
    Value = false,
    Callback = function(v)
        states.autoOpen = v
        if v then
            task.spawn(function()
                while states.autoOpen do
                    openAllCrates()
                    task.wait(midWait)
                end
            end)
        end
    end
})

layoutControlTab:Button({
    Title = "💾 Save Layout",
    Callback = function()
        if LayoutSystem.Save() then
            WindUI:Notify({ Title="✅ Saved", Content="Layout saved!", Duration=2 })
        else
            WindUI:Notify({ Title="❌ Error", Content="Nothing to save", Duration=2 })
        end
    end
})

layoutControlTab:Button({
    Title = "📥 Load Layout",
    Callback = function()
        if LayoutSystem.Load() then
            WindUI:Notify({ Title="✅ Loaded", Content="Layout loading...", Duration=2 })
        else
            WindUI:Notify({ Title="❌ Error", Content="No layout to load", Duration=2 })
        end
    end
})

layoutControlTab:Toggle({
    Title = "🔄 Auto Load Layout",
    Value = false,
    Callback = function(v)
        states.autoLoadLayout = v
        if v then
            task.spawn(function()
                while states.autoLoadLayout do
                    LayoutSystem.Load()
                    WindUI:Notify({ Title="🔄 Auto", Content="Layout loaded automatically", Duration=2 })
                    task.wait(5)
                end
            end)
        end
    end
})

fileTab:Section({ Title = "🗂️ File Manager" })

local function GetCleanPlots()
    local list = {}
    if not isfolder(folderName) then return list end
    for _, v in pairs(listfiles(folderName)) do
        if v:match("%.json$") then
            local name = v:match("([^/\\]+)%.json$")
            table.insert(list, name)
        end
    end
    return list
end

local PlotList = GetCleanPlots()
local selectedPlot = PlotList[1] or ""
local loadBtn

local function setLoadState()
    if not selectedPlot or selectedPlot == "" then
        if loadBtn then loadBtn:Lock() end
    else
        if loadBtn then loadBtn:Unlock() end
    end
end

local plotDropdown = fileTab:Dropdown({
    Title = "📂 Select Plot",
    Values = PlotList,
    Value = selectedPlot ~= "" and selectedPlot or nil,
    Multi = false,
    Callback = function(option)
        selectedPlot = option or ""
        setLoadState()
    end
})

fileTab:Input({
    Title = "📝 Plot Name",
    Desc  = "Enter a name for save/load",
    Value = "",
    Type  = "Input",
    Placeholder = "Enter file name...",
    Callback = function(text)
        selectedPlot = text
        setLoadState()
    end
})

fileTab:Button({
    Title = "💾 Save Plot",
    Callback = function()
        if not selectedPlot or selectedPlot == "" then
            return WindUI:Notify({ Title="❌ Error", Content="Enter a file name", Duration=3 })
        end
        SaveMyPlot(selectedPlot)
        WindUI:Notify({ Title="✅ Success", Content="Plot saved: "..selectedPlot, Duration=3 })
        PlotList = GetCleanPlots()
        plotDropdown:Refresh(PlotList)
    end
})

loadBtn = fileTab:Button({
    Title = "📥 Load Plot",
    Locked = (selectedPlot == nil or selectedPlot == ""),
    Callback = function()
        if not selectedPlot or selectedPlot == "" then
            return WindUI:Notify({ Title="❌ Error", Content="Select a file first", Duration=3 })
        end
        LoadMyPlot(selectedPlot)
        WindUI:Notify({ Title="✅ Success", Content="Plot loaded: "..selectedPlot, Duration=3 })
    end
})

fileTab:Button({
    Title = "🗑️ Delete Plot",
    Callback = function()
        if not selectedPlot or selectedPlot == "" then
            return WindUI:Notify({ Title="❌ Error", Content="No file selected", Duration=3 })
        end
        local filePath = folderName.."/"..selectedPlot..".json"
        if isfile(filePath) then
            delfile(filePath)
            WindUI:Notify({ Title="🗑️ Deleted", Content="File deleted: "..selectedPlot, Duration=3 })
        else
            WindUI:Notify({ Title="❌ Error", Content="File not found", Duration=3 })
        end
        PlotList = GetCleanPlots()
        plotDropdown:Refresh(PlotList)
        selectedPlot = (#PlotList > 0) and PlotList[1] or ""
        setLoadState()
    end
})

fileTab:Button({
    Title = "🔄 Refresh List",
    Callback = function()
        PlotList = GetCleanPlots()
        plotDropdown:Refresh(PlotList)
        WindUI:Notify({ Title="🔄 Refreshed", Content="Plot list updated", Duration=2 })
    end
})

setLoadState()

    WindUI:Notify({
        Title = "✨ D1ehub🥀",
        Content = "All features are ready to use!",
        Duration = 5
    })
end