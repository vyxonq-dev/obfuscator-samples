-- i got banned so i will leave this script for the next person who finds a way to bypass anti cheat lol
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


WindUI:Notify({
    Title = "Sorry",
    Content = "it doesn't have many functions the reason is i'm useless",
    Icon = "check",
    Duration = 15,
    Background = "rbxassetid://78131090774816"
})

WindUI:Notify({
    Title = "WARNING",
    Content = "NOW IF YOU USE THIS SCRIPT YOU WILL BE BAN",
    Icon = "check",
    Duration = 20,
    Background = "rbxassetid://78131090774816"
})

local Window = WindUI:CreateWindow({
    Title = "Foxname - DIG",
    Author = "Dev:Cáo Mod - Open source",
    Theme = "Dark",
    Size = UDim2.fromOffset(660, 430),
    Folder = "digfolder",
    SideBarWidth = 180,
    ScrollBarEnabled = true
})

Window:SetBackgroundImage("rbxassetid://76527064525832")
Window:SetBackgroundImageTransparency(0.6)

Window:EditOpenButton({
    Title = "Open skibidi",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Draggable = true,
    Color = ColorSequence.new(
        Color3.fromRGB(0, 191, 255), -- Blue
        Color3.fromRGB(255, 105, 180) -- Pink
    )
})

local DigTab = Window:Tab({ Title = "Dig", Icon = "shovel" })
local ShopTab = Window:Tab({ Title = "Shop", Icon = "dollar-sign" })
local TeleportTab = Window:Tab({ Title = "Teleport", Icon = "map-pin" })
local MicTab = Window:Tab({ Title = "Mic", Icon = "mic" })
local InfoTab = Window:Tab({ Title = "Info", Icon = "info" })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DigFinishedRemote = ReplicatedStorage.Remotes.Dig_Finished
local SellRemote = ReplicatedStorage.DialogueRemotes.SellAllItems

local function CreatePart(Name, Shape, Size)
    return {
        ["Color"] = nil,
        ["Transparency"] = 0,
        ["Name"] = Name,
        ["Position"] = Vector3.new(0, 0, 0),
        ["Orientation"] = Vector3.new(0, 0, 0),
        ["Material"] = Enum.Material.Pebble,
        ["Shape"] = Shape,
        ["Size"] = Size
    }
end

local digArgs = {
    [1] = 0,
    [2] = {
        {
            ["Color"] = nil,
            ["Transparency"] = 1,
            ["Name"] = "PositionPart",
            ["Position"] = Vector3.new(0, 0, 0),
            ["Orientation"] = Vector3.new(0, 0, 0),
            ["Material"] = Enum.Material.Plastic,
            ["Shape"] = Enum.PartType.Block,
            ["Size"] = Vector3.new(0.1, 0.1, 0.1)
        },
        CreatePart("CenterCylinder", Enum.PartType.Cylinder, Vector3.new(0.2, 5.3, 5.08))
    }
}

local sellArgs = {
    [1] = workspace.World.NPCs.Rocky
}

local instantDigConnection
local instantDigEnabled = false

DigTab:Toggle({
    Title = "Instant Dig",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        instantDigEnabled = state

        if state then
            if PlayerGui:FindFirstChild("Dig") then
                task.delay(1.6, function()
                    if instantDigEnabled and PlayerGui:FindFirstChild("Dig") then
                        DigFinishedRemote:FireServer(unpack(digArgs))
                    end
                end)
            end

            instantDigConnection = PlayerGui.ChildAdded:Connect(function(child)
                if child.Name == "Dig" and instantDigEnabled then
                    task.delay(1.6, function()
                        if instantDigEnabled and PlayerGui:FindFirstChild("Dig") then
                            DigFinishedRemote:FireServer(unpack(digArgs))
                        end
                    end)
                end
            end)
        else
            if instantDigConnection then
                instantDigConnection:Disconnect()
                instantDigConnection = nil
            end

            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
})

local autoFarm = false
local autoFarmClickLoop
local autoFarmInstantConnection

DigTab:Toggle({
    Title = "Auto Farm",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        autoFarm = state

        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

        if state then
            if not LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.lower(tool.Name):find("shovel") then
                        tool.Parent = LocalPlayer.Character
                        break
                    end
                end
            end

            autoFarmClickLoop = RunService.RenderStepped:Connect(function()
                if not PlayerGui:FindFirstChild("Dig") then
                    local screenX = workspace.CurrentCamera.ViewportSize.X / 2
                    local screenY = workspace.CurrentCamera.ViewportSize.Y / 2
                    VirtualInputManager:SendMouseButtonEvent(screenX, screenY, 0, true, game, 0)
                    VirtualInputManager:SendMouseButtonEvent(screenX, screenY, 0, false, game, 0)
                end
            end)

            if PlayerGui:FindFirstChild("Dig") then
                task.delay(1.6, function()
                    if autoFarm and PlayerGui:FindFirstChild("Dig") then
                        DigFinishedRemote:FireServer(unpack(digArgs))
                    end
                end)
            end

            autoFarmInstantConnection = PlayerGui.ChildAdded:Connect(function(child)
                if child.Name == "Dig" and autoFarm then
                    task.delay(1.6, function()
                        if autoFarm and PlayerGui:FindFirstChild("Dig") then
                            DigFinishedRemote:FireServer(unpack(digArgs))
                        end
                    end)
                end
            end)
        else
            if autoFarmClickLoop then
                autoFarmClickLoop:Disconnect()
                autoFarmClickLoop = nil
            end
            if autoFarmInstantConnection then
                autoFarmInstantConnection:Disconnect()
                autoFarmInstantConnection = nil
            end
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
})

ShopTab:Button({
    Title = "Sell All",
    Callback = function()
        SellRemote:FireServer(unpack(sellArgs))
    end
})

local autoSell = false
ShopTab:Toggle({
    Title = "Auto Sell all",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        autoSell = state
        if autoSell then
            task.spawn(function()
                while autoSell do
                    SellRemote:FireServer(unpack(sellArgs))
                    task.wait(0.5)
                end
            end)
        end
    end
})

local InviteCode = "ApbHXtAwU2"
local DiscordAPI = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true&with_expiration=true"

local function LoadDiscordInfo()
    local success, result = pcall(function()
        return HttpService:JSONDecode(WindUI.Creator.Request({
            Url = DiscordAPI,
            Method = "GET",
            Headers = {
                ["User-Agent"] = "RobloxBot/1.0",
                ["Accept"] = "application/json"
            }
        }).Body)
    end)

    if success and result and result.guild then
        local DiscordInfo = InfoTab:Paragraph({
            Title = result.guild.name,
            Desc =
                ' <font color="#52525b">•</font> Member Count : ' .. tostring(result.approximate_member_count) ..
                '\n <font color="#16a34a">•</font> Online Count : ' .. tostring(result.approximate_presence_count),
            Image = "https://cdn.discordapp.com/icons/" .. result.guild.id .. "/" .. result.guild.icon .. ".png?size=1024",
            ImageSize = 42,
        })

        InfoTab:Button({
            Title = "Update Info",
            Callback = function()
                local updated, updatedResult = pcall(function()
                    return HttpService:JSONDecode(WindUI.Creator.Request({
                        Url = DiscordAPI,
                        Method = "GET",
                    }).Body)
                end)

                if updated and updatedResult and updatedResult.guild then
                    DiscordInfo:SetDesc(
                        ' <font color="#52525b">•</font> Member Count : ' .. tostring(updatedResult.approximate_member_count) ..
                        '\n <font color="#16a34a">•</font> Online Count : ' .. tostring(updatedResult.approximate_presence_count)
                    )
                end
            end
        })

        InfoTab:Button({
            Title = "Copy Discord Invite",
            Callback = function()
                setclipboard("https://discord.gg/" .. InviteCode)
            end
        })
    else
        InfoTab:Paragraph({
            Title = "Error fetching Discord Info",
            Desc = HttpService:JSONEncode(result),
            Image = "triangle-alert",
            ImageSize = 26,
            Color = "Red",
        })
    end
end

LoadDiscordInfo()
