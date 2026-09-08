local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))()


local venyx = library.new("Pirate Hub", 5013109572)

-- VALUES
_G.GrabAllShit = true

--MAIN
local page = venyx:addPage("Main", 5012540623)
local section1 = page:addSection("Main Section")
venyx:SelectPage(venyx.pages[1], true) -- no default for more freedom

section1:addButton("nothing here xd (go to misc)", function()
    print("Work In Progress")
end)

--LOCAL PLAYER
local page = venyx:addPage("Local Player", 5012544693)
local section2 = page:addSection("Player Section")

section2:addSlider("SpeedWalk", 16, 16, 1000, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

section2:addSlider("JumpPower", 50, 50, 1000, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

--MISC
local page = venyx:addPage("Misc", 5012544944)
local section3 = page:addSection("Misc Section")

section3:addButton("Grab All The Shit In The Server (ITEMS)", function()
    local p = game:GetService("Players").LocalPlayer
local c = p.Character
if c and c:FindFirstChild("Humanoid") then
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Tool") then
            c:FindFirstChild("Humanoid"):EquipTool(v)
        end
    end
end
end)

section3:addToggle("Auto Grab All Shit In Server (ITEMS)", nil, function(value)
    spawn(function()
        while _G.GrabAllShit == true do
            loadstring(Game:HttpGet("https://pastebin.com/raw/yFBn4SBc"))()
        wait(10)
        end
    end)
end)



--TELEPORT
local page = venyx:addPage("Teleport", 5012543481)
local section4 = page:addSection("Teleport Section")

section4:addButton("Desert Island", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(-1854.37805, 2788.26489, -6930.97559, 0.0140551552, -0.0661377907, -0.99771148, -9.41692146e-09, 0.997810066, -0.0661443248, 0.999901235, 0.00092967815, 0.0140243741)}):Play()
end)

section4:addButton("Spawn", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(199.455292, 2807.58252, -7305.43652, -0.013660836, -0.0446578264, -0.998908937, 8.03408984e-09, 0.999002159, -0.044661995, 0.999906659, -0.00061012822, -0.0136472043)}):Play()
end)

section4:addButton("Snow Island (MAKE SURE TO HAVE JACKET)", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(1822.05273, 2937.854, -7156.68799, 0.0428675599, 0.603829503, -0.795960009, 2.49823873e-09, 0.796692312, 0.604385078, 0.999080777, -0.0259085149, 0.0341522545)}):Play()
end)

section4:addButton("Sky Island", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(-680.167786, 3004.17993, -9904.68359, 0.999630392, 0.00844513439, -0.0258418657, 8.84680063e-09, 0.950529635, 0.310633898, 0.0271868035, -0.310519069, 0.950178266)}):Play()
end)

section4:addButton("Rainbow Ring", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(-730.067017, 3912.59424, -10197.999, 0.968758166, 0.112673894, -0.220934838, -1.52687007e-09, 0.890840173, 0.454316884, 0.248007268, -0.4401232, 0.863008678)}):Play()
end)

section4:addButton("Old Map", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(1475.78381, 2807.00342, -9773.93262, 0.139925256, 0.307444125, -0.941222072, 1.0035869e-08, 0.950573802, 0.310498774, 0.990162075, -0.043446634, 0.133009285)}):Play()
end)

section4:addButton("Portal", function()
    local TweenService = game:GetService("TweenService")

local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
{CFrame = CFrame.new(-143.337479, 2782.93506, -10635.7363, 0.999970078, -0.00255854777, 0.00729903253, 5.74865533e-09, 0.943701804, 0.330797344, -0.007734471, -0.33078745, 0.943673611)}):Play()
end)

--SETTINGS
local page = venyx:addPage("Settings", 5012544372)
local section7 = page:addSection("Settings Section")

section7:addKeybind("UI Toggle Keybind", Enum.KeyCode.RightControl, function()
    print("Activated Keybind")
    venyx:toggle()
    end, function()
    print("Changed Keybind")
end)

section7:addButton("Copy Discord Invite [DISCORD WILL RELEASED SOON]", function()
    setclipboard("https://discord.gg/DISCORD WILL RELEASED SOON")
end)