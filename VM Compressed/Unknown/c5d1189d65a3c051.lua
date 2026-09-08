-- By @Games1799 or @Roblox_free_ugc_2025 in Telegram
-- https://t.me/Games1799
-- https://t.me/Roblox_free_ugc_2025

local players = game:GetService("Players")
local player = players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
getgenv().SignalDelay = 0
local cache = {}
local hi = false
local hi1 = false
local Id,productInfo

_G.TP7 = false
_G.HideAll = false
_G.SignalTrue7 = false

local mouse = player:GetMouse()
mouse.Button1Down:Connect(function()
if not _G.TP7 then return end
if not player then return end
if not player.Character then return end
if not mouse.Target then return end
player.Character:PivotTo(CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0)))
end)

local HidePlayers = {}

spawn(function()
while task.wait(0.1) do
for _, v in pairs(game.Players:GetPlayers()) do
if v ~= player and v.Character then
if _G.HideAll then
if not HidePlayers[v] then
HidePlayers[v] = v.Character.Parent
end
v.Character.Parent = nil
else
if HidePlayers[v] and v.Character.Parent == nil then
v.Character.Parent = HidePlayers[v]
end
end
end
end
end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Just script v2.1")

local Section = Window:NewSection("Scripts")

Section:CreateButton("Infinite Yield", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:CreateButton("Dex explorer", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

Section:CreateButton("Wywern", function()
loadstring(Game:HttpGet("https://raw.githubusercontent.com/Games1799/Scripts/refs/heads/main/Wevorn.lua"))()
end)

Section:CreateButton("Remote spy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

Section:CreateButton("RemoteBrowser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Games1799/Scripts/refs/heads/main/RemoteBrowser"))()
end)

Section:CreateButton("Dev Products Purchaser", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ckw69/Wyborn/refs/heads/main/Dev%20Product%20Purchase"))()
end)

Section:CreateButton("Adonis bypass", function()
for i, v in pairs(game:GetDescendants()) do
if v.Name == "__FUNCTION" then
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua'))()
hi = true
break
end
end

if not hi then
StarterGui:SetCore("SendNotification", {
Title = "Not found!",
Text = "Adonis anti cheat not found",
Duration = 5,
})
end
end)

Section:CreateButton("RemoteBrowser v3 (Beta)", function()
loadstring(Game:HttpGet("https://raw.githubusercontent.com/Games1799/Scripts/refs/heads/main/RemoteBrowserV3_Beta"))()
end)

Section:CreateButton("???", function()
return nil
end)

local Section = Window:NewSection("Moving")

Section:CreateToggle("Teleport By Tapping", function(state)
if state then
_G.TP7 = true
else
_G.TP7 = false
end
end)

Section:CreateButton("Copy position", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if hum then
pos = hum.position
local copy  = string.format("%f, %f, %f", pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy  = string.format("%f, %f, %f", pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

Section:CreateButton("Copy Teleport", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(%f, %f, %f)))", pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(%f, %f, %f)))", pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

Section:CreateButton("Copy TweenService", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format([[local tweenInfo = TweenInfo.new(2)
local goal = {CFrame = CFrame.new(%f, %f, %f)}
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
tween:Play()]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format([[local tweenInfo = TweenInfo.new(2)
local goal = {CFrame = CFrame.new(%f, %f, %f)}
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal)
tween:Play()]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

Section:CreateButton("Copy MoveTo", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local position = "%f, %f, %f"
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 16
humanoid.JumpPower = 19
humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
humanoid:MoveTo(position)]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local position = "%f, %f, %f"
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 16
humanoid.JumpPower = 19
humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
humanoid:MoveTo(position)]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

Section:CreateButton("Copy Lerp", function()
local pos
local char = player.Character
local hum = char and player.Character:FindFirstChild("HumanoidRootPart")
if char and hum then
pos = hum.position
local copy  = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local goal = CFrame.new(%f, %f, %f)
for i = 0, 1, 0.05 do
hrp.CFrame = hrp.CFrame:Lerp(goal, i)
task.wait()
end]], pos.X, pos.Y, pos.Z)
setclipboard(tostring(copy))
else
local camera = workspace.Camera
if not camera then return end
pos = camera.Focus.Position
local copy  = string.format([[local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local goal = CFrame.new(%f, %f, %f)
for i = 0, 1, 0.05 do
hrp.CFrame = hrp.CFrame:Lerp(goal, i)
task.wait()
end]], pos.X, pos.Y - 1.5, pos.Z)
setclipboard(tostring(copy))
end
end)

local Section = Window:NewSection("Tools")

Section:CreateToggle("Hide players", function(state)
if state then
_G.HideAll = true
else
_G.HideAll = false
end
end)

Section:CreateButton("FireProximityPrompt", function()
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
fireproximityprompt(v)
end
end
end)

Section:CreateButton("HoldDuration 0", function()
for _, v in next, workspace:GetDescendants() do
if v:IsA("ProximityPrompt") then
v.HoldDuration = 0
end
end
end)

Section:CreateButton("FireAllClickDetectors", function()
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end)

Section:CreateButton("KillAura", function()
local range = 9999999999999
local connection = game:GetService("RunService").RenderStepped:Connect(function()
local players1 = game.Players:GetPlayers()
for i = 2, #players1 do
local target = players1[i].Character
if target
and target:FindFirstChild("Humanoid")
and target.Humanoid.Health > 0
and target:FindFirstChild("HumanoidRootPart")
and player:DistanceFromCharacter(target.HumanoidRootPart.Position) <= range
then
local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
if tool and tool:FindFirstChild("Handle") then
tool:Activate()
for _, part in ipairs(target:GetChildren()) do
if part:IsA("BasePart") then
firetouchinterest(tool.Handle, part, 0)
firetouchinterest(tool.Handle, part, 1)
end
end
end
end
end
end)
end)

Section:CreateButton("FireAllTouchinterest", function()
local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
if not hum then return end
if hum then
for _, obj in ipairs(workspace:GetDescendants()) do
if obj:IsA("TouchTransmitter") then
local part = obj.Parent
if part then
firetouchinterest(part, hum, 1)
task.wait()
firetouchinterest(part, hum, 0)
part.CFrame = hum.CFrame
end
end
end
end
end)

local Section = Window:NewSection("Purchase signals")

Section:CreateToggle("Signal true", function(state7)
_G.SignalTrue7 = state7
end)

getgenv().hi2 = {toggle = false}

Section:CreateToggle("Spam the Signals", function(state)
hi2.toggle = state
task.spawn(function()
while hi2.toggle do
task.wait(getgenv().SignalDelay)
if Id then
pcall(function()
local signal = _G.SignalTrue7
local productInfo = cache[Id]
if productInfo then
if productInfo.type == "GamePass" then
MarketplaceService:SignalPromptGamePassPurchaseFinished(player, Id, signal)
elseif productInfo.type == "Product" then
MarketplaceService:SignalPromptProductPurchaseFinished(player.UserId, Id, signal)
elseif productInfo.type == "Bundle" then
MarketplaceService:SignalPromptBundlePurchaseFinished(player, Id, signal)
elseif productInfo.type == "Asset" then
MarketplaceService:SignalPromptPurchaseFinished(player, Id, signal)
end
end
end)
end
end
end)
end)

Section:CreateTextbox("Enter id", function(id)
Id = (id)
if not Id then return end
local productInfo = cache[Id]
if not productInfo then
local successPass, passInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, Id, Enum.InfoType.GamePass)
if successPass then
productInfo = {type = "GamePass", info = passInfo}
else
local successDev, devInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, Id, Enum.InfoType.Product)
if successDev then
productInfo = {type = "Product", info = devInfo}
else
local successBundle, bundleInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, Id, Enum.InfoType.Bundle)
if successBundle then
productInfo = {type = "Bundle", info = bundleInfo}
else
local successUGC, ugcInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, Id, Enum.InfoType.Asset)
if successUGC then
productInfo = {type = "Asset", info = ugcInfo}
end
end
end
end
if productInfo then
cache[Id] = productInfo
else
StarterGui:SetCore("SendNotification", {
Title = "Eror!",
Text = "Eror, this id is not found",
Button1 = "Ok",
Duration = 5,
})
return
end
_G.productInfo = productInfo
end
end)

Section:CreateTextbox("Spam interval", function(time)
getgenv().SignalDelay = tonumber((time)) or 0
end)

Section:CreateButton("Use Signal", function()
    pcall(function()
        local signal = _G.SignalTrue7
        local idUsed = tonumber(Id)
        if not idUsed then return end

        local info = cache[idUsed] or _G.productInfo
        if not info or not info.type then return end

        if info.type == "GamePass" then
            MarketplaceService:SignalPromptGamePassPurchaseFinished(player, idUsed, signal)
        elseif info.type == "Product" then
            MarketplaceService:SignalPromptProductPurchaseFinished(player.UserId, idUsed, signal)
        elseif info.type == "Bundle" then
            MarketplaceService:SignalPromptBundlePurchaseFinished(player, idUsed, signal)
        elseif info.type == "Asset" then
            MarketplaceService:SignalPromptPurchaseFinished(player, idUsed, signal)
        end
    end)
end)

for i, v in pairs(game:GetDescendants()) do
if v.Name == "__FUNCTION" then
StarterGui:SetCore("SendNotification", {
Title = "Adonis anti cheat found!",
Text = "Check !Buyitem and !Buyasset",
Button1 = "Ок",
Duration = 5,
})
hi1 = true
break
end
end

if not _G.Prompt_ICON1 then
_G.Prompt_ICON1 = true

while task.wait(1) do  
    local purchasePrompt = CoreGui:FindFirstChild("PurchasePromptApp")  
    if purchasePrompt then  
        local price, image, priceText, imageSrc  

        local productPurchase = purchasePrompt:FindFirstChild("ProductPurchaseContainer")  
        if productPurchase and productPurchase.Animator:FindFirstChild("ProductPurchaseModal") then  
            local alert = productPurchase.Animator.ProductPurchaseModal:FindFirstChild("AlertContents")  
            if alert then  
                price = alert.Footer.Buttons["1"].ButtonContent.ButtonMiddleContent.Text  
                image = alert.MiddleContent.Content.ItemIcon  
                priceText = price.Text  
                imageSrc = image.Image  
            end  
        end  

        if not priceText then  
            local robuxUpsell = purchasePrompt:FindFirstChild("RobuxUpsellContainer")  
            if robuxUpsell and robuxUpsell:FindFirstChild("Prompt") then  
                local children = robuxUpsell.Prompt.Children:GetChildren()  
                if children[8] and children[8]:FindFirstChild("1") then  
                    local upsell = children[8]["1"].RobuxUpsellModal.AlertContents.MiddleContent.Content.ProductDetails  
                    price = upsell.ItemDetailsFrame.ItemDetails.ItemCost  
                    image = upsell.ItemIcon  
                    priceText = price.Text  
                    imageSrc = image.Image  
                end  
            end  
        end  

        if priceText and imageSrc then  
            StarterGui:SetCore("SendNotification", {  
                Title = "New Prompt Window",  
                Text = "Cost — "..priceText, 
                Icon = imageSrc,  
                Duration = 5,  
            })  

            repeat task.wait(1)  
            until not (price and price.Parent and image and image.Parent)  
        end  
    end  
end
end
