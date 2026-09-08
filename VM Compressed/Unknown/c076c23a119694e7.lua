local Universal = {}

function Universal.CreateUniversalTab(Window, Rayfield, Players, RunService)
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local mouse = player:GetMouse()
local TeleportService = game:GetService("TeleportService")

local MainTab = _G.MainTab or Window:CreateTab("Main", 4483362458)
local UniTab = _G.ToolsTab or Window:CreateTab("UniTab", 4483362458)
local SessionTab = _G.SessionTab or Window:CreateTab("Session", 4483362458)

--==UniTab==--
UniTab:CreateSection("Main Menu")
UniTab:CreateButton({
 Name = "Visual Tab",
 Callback = function()
  local visualTab = loadstring(game:HttpGet("https://pastebin.com/raw/jb37dqiW"))()
  visualTab.CreateVisualTab(Window, Rayfield, Players, RunService)
 end
})

UniTab:CreateButton({
 Name = "Tools Tab",
 Callback = function()
  local UtilityTools = loadstring(game:HttpGet("https://pastebin.com/raw/F2sM2itv"))()
  UtilityTools.CreateToolsTab(Window, Rayfield, Players)
 end
})

UniTab:CreateSection("Remote Tools")
UniTab:CreateButton({
 Name = "Remote Executor",
 Callback = function()
  local RemoteLogger = loadstring(game:HttpGet("https://pastebin.com/raw/3C5BF1cc"))()
  RemoteLogger.CreateFireTab(Window, Rayfield)
 end
})

UniTab:CreateButton({
 Name = "Remote Listener",
 Callback = function()
  local RemoteListen = loadstring(game:HttpGet("https://pastebin.com/raw/r8JTcWjx"))()
  RemoteListen.CreateListenerTab(Window, Rayfield)
 end
})

UniTab:CreateButton({
 Name = "Remote Interceptor",
 Callback = function()
  local RInterceptor = loadstring(game:HttpGet("https://pastebin.com/raw/VjgLhY6i"))()
  RInterceptor.CreateListenerTab(Window, Rayfield)
 end
})

UniTab:CreateButton({
 Name = "Dex/Explorer",
 Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
 end
})

--==SESSION TAB==--
SessionTab:CreateSection("Information")
SessionTab:CreateParagraph({
 Title = "Universal Script",
 Content = "This script includes a universal script framework. Some features in MainTab and UniTab may not be fully compatible with this game and could not work as intended."
})

SessionTab:CreateSection("Session Protection")
SessionTab:CreateToggle({
 Name = "Anti AFK",
 CurrentValue = false,
 Callback = function(v)
 if v then
 local VirtualUser = game:GetService("VirtualUser")
 antiAFKConn = player.Idled:Connect(function()
  VirtualUser:CaptureController()
  VirtualUser:ClickButton2(Vector2.new())
  end)
 else
  if antiAFKConn then antiAFKConn:Disconnect() antiAFKConn = nil end
 end
 end
})

SessionTab:CreateToggle({
 Name = "Anti Kick / Ban",
 CurrentValue = false,
 Callback = function(v)
 if v and not antiHooked then
 antiHooked = true
 oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
  local method = getnamecallmethod()
  if method == "Kick" then return end
  if method == "FireServer" or method == "InvokeServer" then
  local n = tostring(self):lower()
  if n:find("ban") or n:find("kick") then
  return
  end
  end
  return oldNamecall(self, ...)
  end)
 elseif not v and antiHooked then
 antiHooked = false
 end
 end
})

SessionTab:CreateSection("Session control")
SessionTab:CreateButton({
 Name = "Rejoin Server",
 Callback = function()
 TeleportService:Teleport(game.PlaceId, player)
 end
})

SessionTab:CreateButton({
 Name = "Force Respawn",
 Callback = function()
 local char = player.Character
 if char then
 char:BreakJoints()
 end
 end
})

SessionTab:CreateButton({
 Name = "Close & Destroy GUI",
 Callback = function()
 if Rayfield then Rayfield:Destroy() end
 end
})

local charTab = loadstring(game:HttpGet("https://pastebin.com/raw/QqHFC3xm"))()
charTab.CreateMainTab(Window, Rayfield, Players, RunService)
loadstring(game:HttpGet("https://pastebin.com/raw/cBX435uR"))()

return {
 MainTab = MainTab,
 UniTab = UniTab,
 SessionTab = SessionTab,
}
end

return Universal