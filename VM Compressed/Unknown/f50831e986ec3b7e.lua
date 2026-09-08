local PlaceService = Game

--Doors--
local PlaceIdDoorsLobby = 6516141723
local PlaceIdDoorsGame = 6839171747

--Hunted--
local PlaceIdFNAFHuntedGame =74161468227974

--Hunty Zombies--
local PlaceIDLobbyHZ = 103754275310547
local PlaceIdGameHZ = 86076978383613

--Forsaken--
local PlaceIdForsaken = 18687417158

--Rainbow Friend 2--
local PlaceIdRainbowFriend2Lobby = 7991339063
local PlaceIdRainbowFriend2Game = 13622981808

--Ink Game--
local PlaceIdInkGameLobby = 99567941238278
local PlaceIdInkGame = 125009265613167

--99 Nights In The Forest--
local PlaceId99NightsInTheForestLobby = 79546208627805
local PlaceId99NightsInTheForestGame = 126509999114328

--Antarctic Expedition--
local PlaceIdAntarcticExpedition = 2693023319

--Piggy--
local PlaceIdPiggyGame = 4623386862
local PlaceIdPiggyGame2 = 5661005779

--Evade--
local PlaceIdEvadeMainGame = 9872472334

--Fisch--
local PlaceIdFisch = 16732694052

local player = game.Players.LocalPlayer
local playerGui = game:GetService("CoreGui")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CenterTextGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui


local mainFrame = Instance.new("TextLabel")
mainFrame.Name = "MainLabel"
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0.6, 0, 0.12, 0)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.Font = Enum.Font.GothamBold
mainFrame.TextScaled = true
mainFrame.Text = "Loading Cheat (It takes only 1 second)"


local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame


local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Parent = mainFrame
loadingText.AnchorPoint = Vector2.new(0.5, 1)
loadingText.Position = UDim2.new(0.5, 0, 0, -5) 
loadingText.Size = UDim2.new(0.5, 0, 0.75, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading"
loadingText.TextColor3 = Color3.fromRGB(250, 250, 250)
loadingText.Font = Enum.Font.GothamSemibold
loadingText.TextScaled = true
loadingText.TextTransparency = 0

local credit = Instance.new("TextLabel")
credit.Name = "CreditText"
credit.Parent = mainFrame
credit.AnchorPoint = Vector2.new(1, 0)
credit.Position = UDim2.new(1, -10, 1, -5) 
credit.Size = UDim2.new(0.3, 0, 0.3, 0)
credit.BackgroundTransparency = 1
credit.Text = "by Iliankytb"
credit.TextColor3 = Color3.fromRGB(130, 130, 130)
credit.Font = Enum.Font.Gotham
credit.TextScaled = true
credit.TextTransparency = 0.2
credit.ZIndex = 3
game:GetService("Debris"):AddItem(screenGui,10)
local stop = false
task.spawn(function()
	local dots = 0
	while task.wait(0.4) do
        if stop then break end
		dots = (dots + 1) % 4
		loadingText.Text = "Loading" .. string.rep(".", dots)
	end
end)

task.wait(1)
if PlaceService.PlaceId == PlaceIdForsaken then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestForsakenScript"))()
elseif PlaceService.PlaceId == PlaceIdFNAFHuntedGame then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/CheatFiveNightHunted"))()
elseif PlaceService.PlaceId == PlaceIdDoorsGame then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/NewBestDoorsScriptIliankytb"))()
elseif PlaceService.PlaceId == PlaceIdDoorsLobby then
loadingText.Visible = false
mainFrame.Text = "Loading Universale Cheat Because you're not ingame(it take Some Times)"
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/IliankytbUniversalNew"))()   
elseif PlaceService.PlaceId == PlaceIdEvadeMainGame then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/NewbestEvadeCheat"))()
elseif PlaceService.PlaceId == PlaceIdGameHZ then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestFreeHuntyZombies"))()
elseif PlaceService.PlaceId == PlaceIdRainbowFriend2Game then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestRainbowFriendsTwo"))()
elseif PlaceService.PlaceId == PlaceIdRainbowFriend2Lobby then
loadingText.Visible = false
mainFrame.Text = "Loading Universale Cheat Because you're not ingame(it take Some Times)"
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/IliankytbUniversalNew"))()   
elseif PlaceService.PlaceId == PlaceId99NightsInTheForestLobby then
loadingText.Visible = false
mainFrame.Text = "Loading Universale Cheat Because you're not ingame(it take Some Times)"
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/IliankytbUniversalNew"))()   
elseif PlaceService.PlaceId == PlaceIdInkGameLobby then
loadingText.Visible = false
mainFrame.Text = "Loading Universale Cheat Because you're not ingame(it take Some Times)"
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/IliankytbUniversalNew"))()   
elseif PlaceService.PlaceId == PlaceIDLobbyHZ then
loadingText.Visible = false
mainFrame.Text = "Loading Universale Cheat Because you're not ingame(it take Some Times)"
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/IliankytbUniversalNew"))()   
elseif PlaceService.PlaceId == PlaceIdInkGame then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestInkGameCheat"))()
elseif PlaceService.PlaceId == PlaceId99NightsInTheForestGame then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/Best99NightsInTheForest"))()
elseif PlaceService.PlaceId == PlaceIdPiggyGame then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/CheatPiggy"))()
elseif PlaceService.PlaceId == PlaceIdPiggyGame2 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/CheatPiggy"))()
elseif PlaceService.PlaceId == PlaceIdAntarcticExpedition then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestAntarticaExpedition"))()
elseif PlaceService.PlaceId == PlaceIdFisch then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/NewBestFischScript"))()
else
loadingText.Visible = false
mainFrame.Text = "Loading Universale Cheat Because the script don't support this game(for the moment)"
task.wait(1)
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/IliankytbUniversalNew"))()   
end
stop = true
screenGui:Destroy()
