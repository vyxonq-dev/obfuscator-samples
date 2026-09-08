-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Kick Bypass
task.spawn(function()
local registry = getreg and getreg() or debug.getregistry()
for _, func in pairs(registry) do
if type(func) == "function" then
local info = debug.getinfo(func)
if info and info.name == "kick" then
hookfunction(func, function(...) return nil end)
warn("Kick function hooked and blocked")
end
end
end
end)

-- Services
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

-- Fluent UI Window
local Window = Fluent:CreateWindow({
Title = "Tower of Hell | Made by Viper Hub 👽",
SubTitle = "Not supported by mobile dont hide it",
TabWidth = 110,
Size = UDim2.fromOffset(500, 350),
Closable = true
})

-- Notification
Fluent:Notify({
Title = "Viper Bypasser",
Content = "Kick bypassed successfully!",
SubContent = "You're safe from kick now.",
Duration = 6
})

-- Home Tab
local Home = Window:AddTab({ Title = "🛸Home", Icon = "🏠" })
Home:AddParagraph({
Title = "Discord Server",
Content = "Join for updates:\ndiscord.gg/jvYPG4P6"
})
Home:AddButton({
Title = "Copy Discord Invite",
Description = "Copies the server invite to clipboard",
Callback = function()
setclipboard("https://discord.gg/jvYPG4P6")
Fluent:Notify({
Title = "Copied!",
Content = "Discord invite copied to clipboard.",
Duration = 4
})
end
})

-- Misc Tab
local Misc = Window:AddTab({ Title = "🛸Misc", Icon = "⚙️" })

Misc:AddButton({
Title = "Load Infinite Yield",
Description = "Executes Infinite Yield admin",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end
})

local walkspeed = 16
local jumpPower = 50
local wsOn, jpOn, infJump, noclip = false, false, false, false

Misc:AddToggle("WalkspeedToggle", {
Title = "Toggle WalkSpeed", Default = false,
Callback = function(v) wsOn = v end
})
Misc:AddSlider("WalkspeedSlider", {
Title = "WalkSpeed", Default = 16, Min = 10, Max = 200, Rounding = 1,
Callback = function(v) walkspeed = v end
})

Misc:AddToggle("JumpToggle", {
Title = "Toggle JumpPower", Default = false,
Callback = function(v) jpOn = v end
})
Misc:AddSlider("JumpSlider", {
Title = "JumpPower", Default = 50, Min = 10, Max = 200, Rounding = 1,
Callback = function(v) jumpPower = v end
})

Misc:AddToggle("InfiniteJumpToggle", {
Title = "Infinite Jump", Default = false,
Callback = function(v) infJump = v end
})
Misc:AddToggle("NoclipToggle", {
Title = "Noclip", Default = false,
Callback = function(v) noclip = v end
})

-- Jump / Noclip logic
UIS.JumpRequest:Connect(function()
if infJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
end
end)

RS.RenderStepped:Connect(function()
local char = LocalPlayer.Character
if char and char:FindFirstChild("Humanoid") then
if wsOn then char.Humanoid.WalkSpeed = walkspeed end
if jpOn then char.Humanoid.JumpPower = jumpPower end
if noclip then
for _, p in pairs(char:GetDescendants()) do
if p:IsA("BasePart") then
p.CanCollide = false
end
end
end
end
end)

-- TP Tab
local Tp = Window:AddTab({ Title = "🛸TP", Icon = "🚀" })

Tp:AddButton({
Title = "TP to Finish",
Description = "Teleport to the finish carpet (wait 1–2m if tower refreshed btw walk to. The checkpoint to get the 100)",
Callback = function()
task.spawn(function()
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
task.wait(0.5)
local part = workspace:FindFirstChild("tower")
if part and part:FindFirstChild("sections") then
local carpet = part.sections:FindFirstChild("finish") and part.sections.finish:FindFirstChild("exit") and part.sections.finish.exit:FindFirstChild("carpet")
if carpet then
char:PivotTo(carpet.CFrame + Vector3.new(0, 5, 0))
else
warn("Finish carpet not found")
end
end
end)
end
})

Tp:AddButton({
Title = "TP to Lobby",
Description = "Teleport to Lobby safely",
Callback = function()
task.spawn(function()
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
task.wait(0.5)
local spawn = workspace.tower.sections.lobby.floor:FindFirstChild("SpawnLocation")
if spawn then
char:PivotTo(spawn.CFrame + Vector3.new(0, 5, 0))
end
end)
end
})

-- Delete KillParts Tab
local DelTab = Window:AddTab({ Title = " 🛸Delete KillParts", Icon = "💀" })

DelTab:AddButton({
Title = "Delete All killParts",
Description = "Finds and deletes all 'killPart' in workspace",
Callback = function()
local count = 0
for _, v in pairs(workspace:GetDescendants()) do
if v.Name:lower():find("killpart") and v:IsA("BasePart") then
v:Destroy()
count += 1
end
end
Fluent:Notify({ Title = "Deleted", Content = "Removed "..count.." killParts", Duration = 5 })
end
})

-- Gears Tab
local Gears = Window:AddTab({ Title = "🛸Gears", Icon = "🎒" })

Gears:AddButton({
Title = "Get All Gears",
Description = "Gives banana, bomb, fishingrod, etc.",
Callback = function()
local gearNames = {
"banana", "bomb", "fishingrod", "cola", "fusion",
"speed", "trowel", "gravity", "yxterminator", "hourglass"
}
local gearFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Assets") and game.ReplicatedStorage.Assets:FindFirstChild("Gear")
if gearFolder then
for _, gear in ipairs(gearNames) do
local g = gearFolder:FindFirstChild(gear)
if g then
g:Clone().Parent = LocalPlayer.Backpack
end
end
end
end
})