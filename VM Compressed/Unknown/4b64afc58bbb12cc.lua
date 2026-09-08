local Settings = {
            InviteCode = "R5t7ubNUHe"
        }
        
        local HttpService = game:GetService("HttpService")
        local RequestFunction
        
        if syn and syn.request then
            RequestFunction = syn.request
        elseif request then
            RequestFunction = request
        elseif http and http.request then
            RequestFunction = http.request
        elseif http_request then
            RequestFunction = http_request
        end
        
        local DiscordApiUrl = "http://127.0.0.1:%s/rpc?v=1"
        
        if not RequestFunction then
            return print("Your executor does not support http requests.")
        end
        
        for i = 6453, 6464 do
            local DiscordInviteRequest = function()
                local Request = RequestFunction({
                    Url = string.format(DiscordApiUrl, tostring(i)),
                    Method = "POST",
                    Body = HttpService:JSONEncode({
                        nonce = HttpService:GenerateGUID(false),
                        args = {
                            invite = {code = Settings.InviteCode},
                            code = Settings.InviteCode
                        },
                        cmd = "INVITE_BROWSER"
                    }),
                    Headers = {
                        ["Origin"] = "https://discord.com",
                        ["Content-Type"] = "application/json"
                    }
                })
            end
            spawn(DiscordInviteRequest)
        end
	
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Apple X",
	Text = "Welcome",
})

wait(7)

local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt"))()

local win = DiscordLib:Window("Apple X")
local serv = win:Server("Apple X", "http://www.roblox.com/asset/?id=81374106542961")

-- =========================
-- 📍 CHANNEL LOCATIONS
-- =========================

local drops = serv:Channel("Locations")

local spawnedItemsFolder = workspace:WaitForChild("SpawnedItems")
local addedItems = {}
local uniqueNames = {}

for _, model in ipairs(spawnedItemsFolder:GetChildren()) do
    if model:IsA("Model") and not addedItems[model.Name] then
        addedItems[model.Name] = true
        table.insert(uniqueNames, model.Name)
    end
end

table.sort(uniqueNames)

local selectedItem = nil
local drop = drops:Dropdown("Select item to teleport", uniqueNames, function(name)
    selectedItem = name
end)

drops:Button("Teleport to selected item", function()
    if not selectedItem then
        DiscordLib:Notification("Error", "Please select an item first.", "OK")
        return
    end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local model = spawnedItemsFolder:FindFirstChild(selectedItem)
    if model and model:IsA("Model") then
        local targetPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        if targetPart then
            humanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)
        else
            DiscordLib:Notification("Error", "No valid part found in " .. selectedItem, "OK")
        end
    else
        DiscordLib:Notification("Error", "Model '" .. selectedItem .. "' not found!", "OK")
    end
end)

-- =========================
-- 🔬 CHANNEL SCANNERS
-- =========================

local scanners = serv:Channel("Scanners")

local scannerList = {"Scanner1", "Scanner2", "Scanner3", "Scanner4", "Scanner5"}
local selectedScanner = nil

local scannerDrop = scanners:Dropdown("Select a Scanner", scannerList, function(name)
    selectedScanner = name
end)

scanners:Button("Teleport to Scanner", function()
    if not selectedScanner then
        DiscordLib:Notification("Error", "Please select a scanner first.", "OK")
        return
    end

    local scannerPath = workspace:FindFirstChild(selectedScanner)
    if scannerPath and scannerPath:FindFirstChild("Scanner") then
        local scanner = scannerPath.Scanner
        if scanner:IsA("BasePart") then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            humanoidRootPart.CFrame = scanner.CFrame + Vector3.new(0, 3, 0)
        else
            DiscordLib:Notification("Error", "Scanner part not valid in " .. selectedScanner, "OK")
        end
    else
        DiscordLib:Notification("Error", selectedScanner .. " not found in workspace!", "OK")
    end
end)
