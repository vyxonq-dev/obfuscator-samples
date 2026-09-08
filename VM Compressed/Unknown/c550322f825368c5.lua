local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")
local VoiceChatService = game:GetService("VoiceChatService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

local localPlayer = Players.LocalPlayer
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request

--------------------------------------------------------------------------------
-- CONSTANTES & RECURSOS
--------------------------------------------------------------------------------
local ROBLOX_PLUS_BADGE_ID = "rbxassetid://97038140722625"
local VERIFIED_BADGE_ID = "rbxassetid://11478378840"

--------------------------------------------------------------------------------
-- AUTO EXECUTE AO ENTRAR / TELEPORTAR
--------------------------------------------------------------------------------
local AUTO_EXECUTE_URL = "https://raw.githubusercontent.com/sla35888/Better-Leaderboard/refs/heads/main/MainLeaderboard.Luau"

local function autoExecuteScript()
	pcall(function()
		if queue_on_teleport then
			queue_on_teleport(string.format('loadstring(game:HttpGet("%s"))()', AUTO_EXECUTE_URL))
		elseif syn and syn.queue_on_teleport then
			syn.queue_on_teleport(string.format('loadstring(game:HttpGet("%s"))()', AUTO_EXECUTE_URL))
		end
	end)
end

autoExecuteScript()

TeleportService.TeleportInitFailed:Connect(autoExecuteScript)
localPlayer.OnTeleport:Connect(function()
	autoExecuteScript()
end)

--------------------------------------------------------------------------------
-- SISTEMA DE FILA DE REQUISIÇÕES (HTTP QUEUE)
--------------------------------------------------------------------------------
local HttpQueue = {
	queue = {},
	isProcessing = false,
	delayBetweenRequests = 0.25
}

function HttpQueue:Add(taskFunc)
	table.insert(self.queue, taskFunc)
	if not self.isProcessing then
		task.spawn(function()
			self:Process()
		end)
	end
end

function HttpQueue:Process()
	self.isProcessing = true
	while #self.queue > 0 do
		local currentTask = table.remove(self.queue, 1)
		pcall(currentTask)
		task.wait(self.delayBetweenRequests)
	end
	self.isProcessing = false
end

function HttpQueue:Clear()
	table.clear(self.queue)
end

--------------------------------------------------------------------------------
-- CHECAGEM DE ROBLOX PLUS / PREMIUM / HasRobloxSubscription
--------------------------------------------------------------------------------
local robloxPlusCache = {}

local function checkRobloxPlus(plr, callback)
	if robloxPlusCache[plr.UserId] ~= nil then
		callback(robloxPlusCache[plr.UserId])
		return
	end

	local hasPlus = false
	pcall(function()
		-- Checagem direta da propriedade booleana do objeto Player
		local subProp = plr.HasRobloxSubscription
		if type(subProp) == "boolean" then
			hasPlus = subProp
		elseif type(subProp) == "userdata" and typeof(subProp) == "EnumItem" then
			hasPlus = (subProp.Name == "Active" or subProp.Name == "True")
		else
			-- Fallback para Atributo ou BoolValue/StringValue filho
			local attrSub = plr:GetAttribute("HasRobloxSubscription")
			if attrSub ~= nil then
				if type(attrSub) == "boolean" then
					hasPlus = attrSub
				elseif type(attrSub) == "string" then
					local val = string.lower(attrSub)
					hasPlus = (val == "active" or val == "ativo" or val == "true")
				end
			elseif plr:FindFirstChild("HasRobloxSubscription") then
				local subObj = plr.HasRobloxSubscription
				if subObj:IsA("BoolValue") then
					hasPlus = subObj.Value == true
				elseif subObj:IsA("StringValue") then
					local val = string.lower(subObj.Value)
					hasPlus = (val == "true" or val == "active" or val == "ativo" or val == "yes")
				end
			elseif plr.MembershipType == Enum.MembershipType.Premium then
				hasPlus = true
			end
		end
	end)

	robloxPlusCache[plr.UserId] = hasPlus
	callback(hasPlus)
end

--------------------------------------------------------------------------------
-- AUXILIARES: PAÍS E EMOJIS (Country_Code)
--------------------------------------------------------------------------------
local function getCountryEmoji(countryCode)
	if not countryCode or type(countryCode) ~= "string" or #countryCode ~= 2 then
		return "🌐"
	end
	countryCode = string.upper(countryCode)
	local firstLetter = string.byte(countryCode, 1) - 65 + 0x1F1E6
	local secondLetter = string.byte(countryCode, 2) - 65 + 0x1F1E6
	return utf8.char(firstLetter, secondLetter)
end

local function getPlayerCountry(plr)
	local code = nil
	pcall(function()
		if plr:GetAttribute("Country_Code") then
			code = tostring(plr:GetAttribute("Country_Code"))
		elseif plr:FindFirstChild("Country_Code") then
			local valObj = plr.Country_Code
			if valObj:IsA("StringValue") then
				code = valObj.Value
			end
		end
	end)
	return code
end

local function getPlayerAgeChecked(plr)
	local isChecked = false
	pcall(function()
		-- 1. Checagem da propriedade nativa no Player (Enum / String / Bool)
		local rawVal = plr.AgeChecked
		if rawVal ~= nil then
			if typeof(rawVal) == "EnumItem" then
				isChecked = (rawVal.Name == "Checked")
			elseif type(rawVal) == "string" then
				isChecked = (string.lower(rawVal) == "checked")
			elseif type(rawVal) == "boolean" then
				isChecked = rawVal
			end
		end

		-- 2. Fallback caso venha via Atributos
		if not isChecked then
			local ageAttr = plr:GetAttribute("AgeChecked")
			if ageAttr ~= nil then
				if typeof(ageAttr) == "EnumItem" then
					isChecked = (ageAttr.Name == "Checked")
				elseif type(ageAttr) == "string" then
					isChecked = (string.lower(ageAttr) == "checked")
				elseif type(ageAttr) == "boolean" then
					isChecked = ageAttr
				end
			end
		end

		-- 3. Fallback caso venha como Objeto filho (StringValue / BoolValue)
		if not isChecked and plr:FindFirstChild("AgeChecked") then
			local valObj = plr.AgeChecked
			if valObj:IsA("StringValue") then
				isChecked = (string.lower(valObj.Value) == "checked")
			elseif valObj:IsA("BoolValue") then
				isChecked = valObj.Value
			end
		end
	end)
	return isChecked and "Checked" or "Unchecked"
end

--------------------------------------------------------------------------------
-- APIS COM HTTP REQUEST
--------------------------------------------------------------------------------
local function fetchUserDescriptionThirdParty(userId, callback)
	HttpQueue:Add(function()
		if not httpRequest then
			callback("HTTP Request not supported")
			return
		end

		local url = string.format("https://users.roproxy.com/v1/users/%d", userId)
		local success, response = pcall(function()
			return httpRequest({ Url = url, Method = "GET" })
		end)

		if success and response and response.Body then
			local decodeSuccess, data = pcall(function()
				return HttpService:JSONDecode(response.Body)
			end)

			if decodeSuccess and data and data.description then
				if data.description == "" then
					callback("No description.")
				else
					callback(data.description)
				end
				return
			end
		end

		callback("Error loading description.")
	end)
end

local function fetchFriendsAndFollowers(userId, callback)
	HttpQueue:Add(function()
		local followersCount = 0
		local friendsCount = 0

		if httpRequest then
			pcall(function()
				local res = httpRequest({
					Url = string.format("https://friends.roproxy.com/v1/users/%d/followers/count", userId),
					Method = "GET"
				})
				if res and res.Body then
					local data = HttpService:JSONDecode(res.Body)
					if data and data.count then followersCount = data.count end
				end
			end)

			pcall(function()
				local res = httpRequest({
					Url = string.format("https://friends.roproxy.com/v1/users/%d/friends/count", userId),
					Method = "GET"
				})
				if res and res.Body then
					local data = HttpService:JSONDecode(res.Body)
					if data and data.count then friendsCount = data.count end
				end
			end)
		end

		callback(followersCount, friendsCount)
	end)
end

--------------------------------------------------------------------------------
-- SETUP INICIAL DA GUI
--------------------------------------------------------------------------------
task.spawn(function()
	repeat
		local success = pcall(function()
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		end)
		task.wait(0.2)
	until success
end)

if CoreGui:FindFirstChild("MinimalistLeaderboardGui") then
	CoreGui.MinimalistLeaderboardGui:Destroy()
end

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local MAX_STATS = isMobile and 3 or 5

local CONFIG_FILE = "LeaderboardSettings.json"
local defaultSettings = { Language = "en", Theme = "dark", DisrespectfulUsers = {} }

local function loadSettings()
	if readfile and isfile and isfile(CONFIG_FILE) then
		local success, result = pcall(function()
			return HttpService:JSONDecode(readfile(CONFIG_FILE))
		end)
		if success and type(result) == "table" then
			if not result.DisrespectfulUsers then result.DisrespectfulUsers = {} end
			return result
		end
	end
	return defaultSettings
end

local settingsData = loadSettings()
local function saveSettings()
	if writefile then pcall(function() writefile(CONFIG_FILE, HttpService:JSONEncode(settingsData)) end) end
end

local Themes = {
	dark = {BG = Color3.fromRGB(15, 16, 18), CARD = Color3.fromRGB(24, 25, 28), STROKE = Color3.fromRGB(35, 37, 42), LIGHT_ACCENT = Color3.fromRGB(45, 48, 55), TEXT = Color3.fromRGB(240, 240, 242), SUBTEXT = Color3.fromRGB(140, 143, 150), SPINNER = Color3.fromRGB(255, 255, 255)},
	dark_red = {BG = Color3.fromRGB(20, 10, 12), CARD = Color3.fromRGB(30, 15, 17), STROKE = Color3.fromRGB(45, 20, 23), LIGHT_ACCENT = Color3.fromRGB(70, 30, 35), TEXT = Color3.fromRGB(245, 240, 240), SUBTEXT = Color3.fromRGB(160, 125, 130), SPINNER = Color3.fromRGB(230, 60, 70)},
	dark_blue = {BG = Color3.fromRGB(10, 14, 22), CARD = Color3.fromRGB(15, 21, 32), STROKE = Color3.fromRGB(25, 36, 54), LIGHT_ACCENT = Color3.fromRGB(40, 60, 90), TEXT = Color3.fromRGB(240, 245, 250), SUBTEXT = Color3.fromRGB(130, 145, 165), SPINNER = Color3.fromRGB(0, 120, 230)},
	dark_green = {BG = Color3.fromRGB(10, 18, 12), CARD = Color3.fromRGB(15, 26, 18), STROKE = Color3.fromRGB(25, 42, 30), LIGHT_ACCENT = Color3.fromRGB(40, 75, 50), TEXT = Color3.fromRGB(240, 250, 242), SUBTEXT = Color3.fromRGB(130, 160, 140), SPINNER = Color3.fromRGB(40, 180, 90)},
	dark_purple = {BG = Color3.fromRGB(16, 10, 22), CARD = Color3.fromRGB(24, 15, 32), STROKE = Color3.fromRGB(40, 25, 54), LIGHT_ACCENT = Color3.fromRGB(65, 40, 90), TEXT = Color3.fromRGB(245, 240, 250), SUBTEXT = Color3.fromRGB(150, 130, 165), SPINNER = Color3.fromRGB(140, 60, 220)},
	light = {BG = Color3.fromRGB(245, 245, 247), CARD = Color3.fromRGB(255, 255, 255), STROKE = Color3.fromRGB(220, 222, 228), LIGHT_ACCENT = Color3.fromRGB(235, 237, 242), TEXT = Color3.fromRGB(25, 25, 28), SUBTEXT = Color3.fromRGB(110, 112, 120), SPINNER = Color3.fromRGB(30, 30, 30)}
}

local Translations = {
	en = {Title = "Players", SearchPlaceholder = "Search player...", AddFriend = "Add Friend", UnAddFriend = "UnAdd Friend", Block = "Block", ViewAvatar = "View Avatar", Close = "Close", Settings = "Settings", Created = "Created", Theme = "Theme", Lang = "Language", Confirm = "Confirm", VoiceActive = "Voice Active", VoiceInactive = "Last active: ", Disrespectful = "Flag User", RemoveDisrespectful = "Unflag User", BlockText = "Are you sure you want to block this user?", UnAddText = "Are you sure you want to remove this friend?", LessThanMin = "Just now", MinSecFormat = "%dm %ds ago", HourMinFormat = "%dh %dm ago", Followers = "Followers", Friends = "Friends", AgeChecked = "Age Checked", Country = "Country"},
	pt = {Title = "Jogadores", SearchPlaceholder = "Pesquisar jogador...", AddFriend = "Adicionar", UnAddFriend = "Remover", Block = "Bloquear", ViewAvatar = "Ver Avatar", Close = "Fechar", Settings = "Configurações", Created = "Criação", Theme = "Tema", Lang = "Idioma", Confirm = "Confirmar", VoiceActive = "Voz Ativa", VoiceInactive = "Última vez ativo: ", Disrespectful = "Marcar", RemoveDisrespectful = "Desmarcar", BlockText = "Tem certeza de que deseja bloquear este usuário?", UnAddText = "Tem certeza de que deseja remover este amigo?", LessThanMin = "Agora mesmo", MinSecFormat = "Há %dm e %ds", HourMinFormat = "Há %dh e %dm", Followers = "Seguidores", Friends = "Amigos", AgeChecked = "Idade Verificada", Country = "País"},
	es = {Title = "Jugadores", SearchPlaceholder = "Buscar jugador...", AddFriend = "Añadir", UnAddFriend = "Eliminar", Block = "Bloquear", ViewAvatar = "Ver Avatar", Close = "Cerrar", Settings = "Ajustes", Created = "Creación", Theme = "Tema", Lang = "Idioma", Confirm = "Confirmar", VoiceActive = "Voz Activa", VoiceInactive = "Última vez activo: ", Disrespectful = "Marcar", RemoveDisrespectful = "Desmarcar", BlockText = "¿Estás seguro de que quieres bloquear a este usuario?", UnAddText = "¿Estás seguro de que quieres eliminar a este amigo?", LessThanMin = "Ahora mismo", MinSecFormat = "Hace %dm y %ds", HourMinFormat = "Hace %dh y %dm", Followers = "Seguidores", Friends = "Amigos", AgeChecked = "Edad Verificada", Country = "País"}
}

local currentTheme = Themes[settingsData.Theme] or Themes.dark
local currentLang = Translations[settingsData.Language] or Translations.en

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MinimalistLeaderboardGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleArrowBtn"
toggleBtn.Size = isMobile and UDim2.new(0, 32, 0, 32) or UDim2.new(0, 28, 0, 28)
toggleBtn.Position = UDim2.new(1, -38, 0, 12)
toggleBtn.BackgroundColor3 = currentTheme.BG
toggleBtn.Text = "<"
toggleBtn.TextColor3 = currentTheme.TEXT
toggleBtn.TextSize = isMobile and 14 or 12
toggleBtn.Font = Enum.Font.BuilderSansBold
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = currentTheme.STROKE
toggleStroke.Thickness = 1
toggleStroke.Parent = toggleBtn

local leaderboardFrame = Instance.new("CanvasGroup")
leaderboardFrame.Name = "LeaderboardContainer"
leaderboardFrame.Size = isMobile and UDim2.new(0, 300, 0, 330) or UDim2.new(0, 380, 0, 360)
leaderboardFrame.Position = UDim2.new(1, 10, 0, 48)
leaderboardFrame.BackgroundColor3 = currentTheme.BG
leaderboardFrame.GroupTransparency = 1
leaderboardFrame.Visible = false
leaderboardFrame.Parent = screenGui

local lbCorner = Instance.new("UICorner")
lbCorner.CornerRadius = UDim.new(0, 8)
lbCorner.Parent = leaderboardFrame

local lbStroke = Instance.new("UIStroke")
lbStroke.Color = currentTheme.STROKE
lbStroke.Thickness = 1
lbStroke.Parent = leaderboardFrame

local lbTitle = Instance.new("TextLabel")
lbTitle.Size = UDim2.new(1, -40, 0, 26)
lbTitle.Position = UDim2.new(0, 10, 0, 2)
lbTitle.BackgroundTransparency = 1
lbTitle.Text = currentLang.Title
lbTitle.TextColor3 = currentTheme.TEXT
lbTitle.TextSize = isMobile and 12 or 11
lbTitle.Font = Enum.Font.BuilderSansBold
lbTitle.TextXAlignment = Enum.TextXAlignment.Left
lbTitle.Parent = leaderboardFrame

local settingsIconBtn = Instance.new("TextButton")
settingsIconBtn.Size = UDim2.new(0, 24, 0, 24)
settingsIconBtn.Position = UDim2.new(1, -28, 0, 3)
settingsIconBtn.BackgroundTransparency = 1
settingsIconBtn.Text = "⚙"
settingsIconBtn.TextColor3 = currentTheme.SUBTEXT
settingsIconBtn.TextSize = 13
settingsIconBtn.Parent = leaderboardFrame

--------------------------------------------------------------------------------
-- TEXTBOX DE PESQUISA NA LEADERBOARD
--------------------------------------------------------------------------------
local searchFrame = Instance.new("Frame")
searchFrame.Name = "SearchFrame"
searchFrame.Size = UDim2.new(1, -20, 0, 24)
searchFrame.Position = UDim2.new(0, 10, 0, 28)
searchFrame.BackgroundColor3 = currentTheme.CARD
searchFrame.Parent = leaderboardFrame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 5)
searchCorner.Parent = searchFrame

local searchStroke = Instance.new("UIStroke")
searchStroke.Color = currentTheme.STROKE
searchStroke.Thickness = 1
searchStroke.Parent = searchFrame

local searchInput = Instance.new("TextBox")
searchInput.Name = "SearchInput"
searchInput.Size = UDim2.new(1, -12, 1, 0)
searchInput.Position = UDim2.new(0, 6, 0, 0)
searchInput.BackgroundTransparency = 1
searchInput.Text = ""
searchInput.PlaceholderText = currentLang.SearchPlaceholder
searchInput.PlaceholderColor3 = currentTheme.SUBTEXT
searchInput.TextColor3 = currentTheme.TEXT
searchInput.TextSize = isMobile and 10 or 9
searchInput.Font = Enum.Font.BuilderSans
searchInput.TextXAlignment = Enum.TextXAlignment.Left
searchInput.ClearTextOnFocus = false
searchInput.Parent = searchFrame

local scrollingPlayers = Instance.new("ScrollingFrame")
scrollingPlayers.Size = UDim2.new(1, -12, 1, -62)
scrollingPlayers.Position = UDim2.new(0, 6, 0, 56)
scrollingPlayers.BackgroundTransparency = 1
scrollingPlayers.BorderSizePixel = 0
scrollingPlayers.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingPlayers.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingPlayers.ScrollBarThickness = 2
scrollingPlayers.ScrollBarImageColor3 = currentTheme.STROKE
scrollingPlayers.Parent = leaderboardFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = scrollingPlayers

local loadingContainer = Instance.new("Frame")
loadingContainer.Name = "LoadingContainer"
loadingContainer.Size = UDim2.new(1, 0, 1, 0)
loadingContainer.BackgroundTransparency = 1
loadingContainer.Visible = false
loadingContainer.Parent = leaderboardFrame

local spinnerOuter = Instance.new("Frame")
spinnerOuter.Size = UDim2.new(0, 28, 0, 28)
spinnerOuter.Position = UDim2.new(0.5, -14, 0.5, -14)
spinnerOuter.BackgroundColor3 = currentTheme.SPINNER
spinnerOuter.BackgroundTransparency = 0.3
spinnerOuter.Parent = loadingContainer

local spinnerCorner = Instance.new("UICorner")
spinnerCorner.CornerRadius = UDim.new(1, 0)
spinnerCorner.Parent = spinnerOuter

local spinnerInner = Instance.new("Frame")
spinnerInner.Size = UDim2.new(0, 20, 0, 20)
spinnerInner.Position = UDim2.new(0.5, -10, 0.5, -10)
spinnerInner.BackgroundColor3 = currentTheme.BG
spinnerInner.Parent = spinnerOuter

local spinnerInnerCorner = Instance.new("UICorner")
spinnerInnerCorner.CornerRadius = UDim.new(1, 0)
spinnerInnerCorner.Parent = spinnerInner

local spinnerNotch = Instance.new("Frame")
spinnerNotch.Size = UDim2.new(0, 8, 0, 8)
spinnerNotch.Position = UDim2.new(0.5, -4, 0, -2)
spinnerNotch.BackgroundColor3 = currentTheme.BG
spinnerNotch.BorderSizePixel = 0
spinnerNotch.Parent = spinnerOuter

local spinnerTween = nil

local function showLoadingCircle()
	loadingContainer.Visible = true
	scrollingPlayers.Visible = false
	if spinnerTween then spinnerTween:Cancel() end
	spinnerOuter.Rotation = 0
	spinnerTween = TweenService:Create(spinnerOuter, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
		Rotation = 360
	})
	spinnerTween:Play()
end

local function hideLoadingCircle()
	if spinnerTween then 
		spinnerTween:Cancel()
		spinnerTween = nil 
	end
	loadingContainer.Visible = false
	scrollingPlayers.Visible = true
end

local function createSpinner(parentFrame)
	local outer = Instance.new("Frame")
	outer.Size = UDim2.new(0, 22, 0, 22)
	outer.Position = UDim2.new(0.5, -11, 0.5, -11)
	outer.BackgroundColor3 = currentTheme.SPINNER
	outer.BackgroundTransparency = 0.3
	outer.ZIndex = 10
	outer.Parent = parentFrame

	local c1 = Instance.new("UICorner")
	c1.CornerRadius = UDim.new(1, 0)
	c1.Parent = outer

	local inner = Instance.new("Frame")
	inner.Size = UDim2.new(0, 14, 0, 14)
	inner.Position = UDim2.new(0.5, -7, 0.5, -7)
	inner.BackgroundColor3 = currentTheme.CARD
	inner.ZIndex = 11
	inner.Parent = outer

	local c2 = Instance.new("UICorner")
	c2.CornerRadius = UDim.new(1, 0)
	c2.Parent = inner

	local notch = Instance.new("Frame")
	notch.Size = UDim2.new(0, 5, 0, 5)
	notch.Position = UDim2.new(0.5, -2.5, 0, -2)
	notch.BackgroundColor3 = currentTheme.CARD
	notch.BorderSizePixel = 0
	notch.ZIndex = 12
	notch.Parent = outer

	local tween = TweenService:Create(outer, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
		Rotation = 360
	})
	
	return outer, tween
end

local profileModal = Instance.new("CanvasGroup")
profileModal.Name = "ProfileModal"
profileModal.Size = isMobile and UDim2.new(0.9, 0, 0.8, 0) or UDim2.new(0, 310, 0, 460)
profileModal.Position = UDim2.new(0.5, 0, 0.5, 0)
profileModal.AnchorPoint = Vector2.new(0.5, 0.5)
profileModal.BackgroundColor3 = currentTheme.BG
profileModal.GroupTransparency = 1
profileModal.Visible = false
profileModal.Parent = screenGui

local pmCorner = Instance.new("UICorner")
pmCorner.CornerRadius = UDim.new(0, 10)
pmCorner.Parent = profileModal

local pmStroke = Instance.new("UIStroke")
pmStroke.Color = currentTheme.STROKE
pmStroke.Thickness = 1
pmStroke.Parent = profileModal

local profileModalScroll = Instance.new("ScrollingFrame")
profileModalScroll.Name = "ProfileModalScroll"
profileModalScroll.Size = UDim2.new(1, 0, 1, -40)
profileModalScroll.Position = UDim2.new(0, 0, 0, 0)
profileModalScroll.BackgroundTransparency = 1
profileModalScroll.BorderSizePixel = 0
profileModalScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
profileModalScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
profileModalScroll.ScrollBarThickness = 2
profileModalScroll.ScrollBarImageColor3 = currentTheme.STROKE
profileModalScroll.Parent = profileModal

local profileContentGroup = Instance.new("CanvasGroup")
profileContentGroup.Name = "ProfileContentGroup"
profileContentGroup.Size = UDim2.new(1, 0, 0, isMobile and 350 or 400)
profileContentGroup.BackgroundTransparency = 1
profileContentGroup.Parent = profileModalScroll

local backgroundBanner = Instance.new("Frame")
backgroundBanner.Name = "BackgroundBanner"
backgroundBanner.Size = UDim2.new(1, 0, 0, isMobile and 100 or 120)
backgroundBanner.Position = UDim2.new(0, 0, 0, 0)
backgroundBanner.BackgroundColor3 = currentTheme.CARD
backgroundBanner.BorderSizePixel = 0
backgroundBanner.Parent = profileContentGroup

local bgCorner = Instance.new("UICorner")
bgCorner.Name = "BackgroundCorner"
bgCorner.CornerRadius = UDim.new(0, 8)
bgCorner.Parent = backgroundBanner

--------------------------------------------------------------------------------
-- EFEITO GRADIENTE (FADED PARA BAIXO QUE DESAPARECE NO CARD DE FUNDO)
--------------------------------------------------------------------------------
local bgGradient = Instance.new("UIGradient")
bgGradient.Name = "BackgroundFadeGradient"
bgGradient.Rotation = 90
bgGradient.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.6, 0.2),
	NumberSequenceKeypoint.new(1, 1)
})
bgGradient.Parent = backgroundBanner

--------------------------------------------------------------------------------
-- DEMAIS ELEMENTOS DO PERFIL
--------------------------------------------------------------------------------
local avatarContainer = Instance.new("Frame")
avatarContainer.Name = "AvatarContainer"
avatarContainer.Size = isMobile and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 105, 0, 105)
avatarContainer.Position = UDim2.new(0.5, isMobile and -45 or -52, 0, 10)
avatarContainer.BackgroundTransparency = 1
avatarContainer.ZIndex = 2
avatarContainer.Parent = profileContentGroup

local profileFullBody = Instance.new("ImageLabel")
profileFullBody.Name = "Avatar2D"
profileFullBody.Size = UDim2.new(1, 0, 1, 0)
profileFullBody.BackgroundTransparency = 1
profileFullBody.Parent = avatarContainer

local viewport3D = Instance.new("ViewportFrame")
viewport3D.Name = "Avatar3D"
viewport3D.Size = UDim2.new(1, 0, 1, 0)
viewport3D.BackgroundTransparency = 1
viewport3D.Visible = false
viewport3D.Parent = avatarContainer

local headshotContainer = Instance.new("Frame")
headshotContainer.Name = "HeadshotContainer"
headshotContainer.Size = UDim2.new(0, 44, 0, 44)
headshotContainer.Position = UDim2.new(0, 12, 0, isMobile and 95 or 115)
headshotContainer.BackgroundColor3 = currentTheme.BG
headshotContainer.ZIndex = 5
headshotContainer.Parent = profileContentGroup

local hsCorner = Instance.new("UICorner")
hsCorner.CornerRadius = UDim.new(1, 0)
hsCorner.Parent = headshotContainer

local hsStroke = Instance.new("UIStroke")
hsStroke.Name = "HeadshotStroke"
hsStroke.Color = currentTheme.STROKE
hsStroke.Thickness = 1
hsStroke.Parent = headshotContainer

local userHeadshotImage = Instance.new("ImageLabel")
userHeadshotImage.Name = "UserHeadshotImage"
userHeadshotImage.Size = UDim2.new(1, 0, 1, 0)
userHeadshotImage.BackgroundTransparency = 1
userHeadshotImage.ZIndex = 6
userHeadshotImage.Parent = headshotContainer

local hsImgCorner = Instance.new("UICorner")
hsImgCorner.CornerRadius = UDim.new(1, 0)
hsImgCorner.Parent = userHeadshotImage

local avatarSpinnerOuter, avatarSpinnerTween = createSpinner(avatarContainer)
avatarSpinnerOuter.Visible = false

local modalSpinnerOuter, modalSpinnerTween = createSpinner(profileModal)
modalSpinnerOuter.Visible = false

local toggleDimensionBtn = Instance.new("TextButton")
toggleDimensionBtn.Name = "ToggleDimensionBtn"
toggleDimensionBtn.Size = UDim2.new(0, 28, 0, 18)
toggleDimensionBtn.Position = UDim2.new(1, -34, 0, 8)
toggleDimensionBtn.BackgroundColor3 = currentTheme.CARD
toggleDimensionBtn.Text = "2D"
toggleDimensionBtn.TextColor3 = currentTheme.TEXT
toggleDimensionBtn.TextSize = 9
toggleDimensionBtn.Font = Enum.Font.BuilderSansBold
toggleDimensionBtn.ZIndex = 5
toggleDimensionBtn.Parent = profileContentGroup

local tdCorner = Instance.new("UICorner")
tdCorner.CornerRadius = UDim.new(0, 4)
tdCorner.Parent = toggleDimensionBtn

local tdStroke = Instance.new("UIStroke")
tdStroke.Color = currentTheme.STROKE
tdStroke.Thickness = 1
tdStroke.Parent = toggleDimensionBtn

local displayLabel = Instance.new("TextLabel")
displayLabel.Size = UDim2.new(1, -72, 0, 20)
displayLabel.Position = UDim2.new(0, 64, 0, isMobile and 98 or 118)
displayLabel.BackgroundTransparency = 1
displayLabel.TextColor3 = currentTheme.TEXT
displayLabel.TextSize = isMobile and 13 or 14
displayLabel.Font = Enum.Font.BuilderSansBold
displayLabel.TextXAlignment = Enum.TextXAlignment.Left
displayLabel.TextTruncate = Enum.TextTruncate.AtEnd
displayLabel.Parent = profileContentGroup

local profileVerifiedIcon = Instance.new("ImageLabel")
profileVerifiedIcon.Name = "ProfileVerifiedIcon"
profileVerifiedIcon.Size = UDim2.new(0, 12, 0, 12)
profileVerifiedIcon.BackgroundTransparency = 1
profileVerifiedIcon.Image = VERIFIED_BADGE_ID
profileVerifiedIcon.Visible = false
profileVerifiedIcon.Parent = profileContentGroup

local profilePlusIcon = Instance.new("ImageLabel")
profilePlusIcon.Name = "ProfilePlusIcon"
profilePlusIcon.Size = UDim2.new(0, 14, 0, 14)
profilePlusIcon.BackgroundTransparency = 1
profilePlusIcon.Image = ROBLOX_PLUS_BADGE_ID
profilePlusIcon.Visible = false
profilePlusIcon.Parent = profileContentGroup

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, -72, 0, 14)
usernameLabel.Position = UDim2.new(0, 64, 0, isMobile and 118 or 138)
usernameLabel.BackgroundTransparency = 1
usernameLabel.TextColor3 = currentTheme.SUBTEXT
usernameLabel.TextSize = 11
usernameLabel.Font = Enum.Font.BuilderSans
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
usernameLabel.TextTruncate = Enum.TextTruncate.AtEnd
usernameLabel.Parent = profileContentGroup

local statsScrollingFrame = Instance.new("ScrollingFrame")
statsScrollingFrame.Name = "StatsScrollingFrame"
statsScrollingFrame.Size = UDim2.new(1, -24, 0, isMobile and 38 or 40)
statsScrollingFrame.Position = UDim2.new(0, 12, 0, isMobile and 148 or 168)
statsScrollingFrame.BackgroundTransparency = 1
statsScrollingFrame.BorderSizePixel = 0
statsScrollingFrame.ScrollBarThickness = 0
statsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
statsScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
statsScrollingFrame.Parent = profileContentGroup

local statsLayout = Instance.new("UIListLayout")
statsLayout.FillDirection = Enum.FillDirection.Horizontal
statsLayout.SortOrder = Enum.SortOrder.LayoutOrder
statsLayout.Padding = UDim.new(0, isMobile and 10 or 14)
statsLayout.Parent = statsScrollingFrame

local function createHorizontalStatCol(layoutOrder, defaultTitle)
	local colFrame = Instance.new("Frame")
	colFrame.Name = "StatCol_" .. layoutOrder
	colFrame.LayoutOrder = layoutOrder
	colFrame.Size = UDim2.new(0, isMobile and 75 or 85, 1, 0)
	colFrame.BackgroundTransparency = 1

	local valLabel = Instance.new("TextLabel")
	valLabel.Name = "ValueLabel"
	valLabel.Size = UDim2.new(1, 0, 0, 16)
	valLabel.Position = UDim2.new(0, 0, 0, 0)
	valLabel.BackgroundTransparency = 1
	valLabel.TextColor3 = currentTheme.TEXT
	valLabel.TextSize = isMobile and 12 or 13
	valLabel.Font = Enum.Font.BuilderSansBold
	valLabel.TextXAlignment = Enum.TextXAlignment.Left
	valLabel.TextTruncate = Enum.TextTruncate.AtEnd
	valLabel.Text = "..."
	valLabel.Parent = colFrame

	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "TitleLabel"
	titleLabel.Size = UDim2.new(1, 0, 0, 12)
	titleLabel.Position = UDim2.new(0, 0, 0, 16)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = currentTheme.SUBTEXT
	titleLabel.TextSize = 9
	titleLabel.Font = Enum.Font.BuilderSans
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
	titleLabel.Text = defaultTitle
	titleLabel.Parent = colFrame

	colFrame.Parent = statsScrollingFrame
	return colFrame, valLabel, titleLabel
end

local friendsRow, friendsVal, friendsTitle = createHorizontalStatCol(1, currentLang.Friends)
local followersRow, followersVal, followersTitle = createHorizontalStatCol(2, currentLang.Followers)
local createdRow, createdVal, createdTitle = createHorizontalStatCol(3, currentLang.Created)
local ageCheckedRow, ageCheckedVal, ageCheckedTitle = createHorizontalStatCol(4, currentLang.AgeChecked)
local countryRow, countryVal, countryTitle = createHorizontalStatCol(5, currentLang.Country)

local userDescriptionLabel = Instance.new("TextLabel")
userDescriptionLabel.Name = "UserDescriptionLabel"
userDescriptionLabel.Size = UDim2.new(1, -24, 0, 26)
userDescriptionLabel.Position = UDim2.new(0, 12, 0, isMobile and 192 or 214)
userDescriptionLabel.BackgroundTransparency = 1
userDescriptionLabel.TextColor3 = currentTheme.SUBTEXT
userDescriptionLabel.TextSize = 10
userDescriptionLabel.Font = Enum.Font.BuilderSans
userDescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
userDescriptionLabel.TextYAlignment = Enum.TextYAlignment.Top
userDescriptionLabel.TextWrapped = true
userDescriptionLabel.TextTruncate = Enum.TextTruncate.AtEnd
userDescriptionLabel.Text = "..."
userDescriptionLabel.Parent = profileContentGroup

local voiceStatusLabel = Instance.new("TextLabel")
voiceStatusLabel.Size = UDim2.new(1, -24, 0, 12)
voiceStatusLabel.Position = UDim2.new(0, 12, 0, isMobile and 222 or 246)
voiceStatusLabel.BackgroundTransparency = 1
voiceStatusLabel.TextColor3 = currentTheme.SUBTEXT
voiceStatusLabel.TextSize = 9
voiceStatusLabel.Font = Enum.Font.BuilderSansMedium
voiceStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
voiceStatusLabel.Parent = profileContentGroup

local buttonsContainer = Instance.new("Frame")
buttonsContainer.Name = "ButtonsContainer"
buttonsContainer.Size = UDim2.new(1, -24, 0, 28)
buttonsContainer.Position = UDim2.new(0, 12, 0, isMobile and 240 or 266)
buttonsContainer.BackgroundTransparency = 1
buttonsContainer.Parent = profileContentGroup

local btnGrid = Instance.new("UIGridLayout")
btnGrid.CellSize = UDim2.new(0.235, 0, 1, 0)
btnGrid.CellPadding = UDim2.new(0.02, 0, 0, 0)
btnGrid.SortOrder = Enum.SortOrder.LayoutOrder
btnGrid.Parent = buttonsContainer

local function createInlineButton(text, isPrimary, isRed, layoutOrder)
	local btn = Instance.new("TextButton")
	btn.LayoutOrder = layoutOrder
	btn.BorderSizePixel = 0
	
	if isRed then
		btn.BackgroundColor3 = Color3.fromRGB(180, 40, 45)
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	elseif isPrimary then
		btn.BackgroundColor3 = currentTheme.TEXT
		btn.TextColor3 = currentTheme.BG
	else
		btn.BackgroundColor3 = currentTheme.CARD
		btn.TextColor3 = currentTheme.TEXT
	end

	btn.Text = text
	btn.TextSize = isMobile and 8 or 9
	btn.Font = Enum.Font.BuilderSansBold
	btn.TextWrapped = true

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 5)
	c.Parent = btn

	local s = Instance.new("UIStroke")
	s.Name = "BtnStroke"
	s.Color = isRed and Color3.fromRGB(200, 50, 55) or currentTheme.STROKE
	s.Thickness = 1
	s.Transparency = isPrimary and 1 or 0
	s.Parent = btn

	btn.Parent = buttonsContainer
	return btn
end

local friendBtn = createInlineButton(currentLang.AddFriend, true, false, 1)
local avatarBtn = createInlineButton(currentLang.ViewAvatar, false, false, 2)
local blockBtn = createInlineButton(currentLang.Block, false, true, 3)
local disrespectfulBtn = createInlineButton(currentLang.Disrespectful, false, false, 4)

local closeProfileBtn = Instance.new("TextButton")
closeProfileBtn.Name = "CloseProfileBtn"
closeProfileBtn.Size = UDim2.new(1, -24, 0, 28)
closeProfileBtn.Position = UDim2.new(0, 12, 1, -34)
closeProfileBtn.BackgroundColor3 = currentTheme.CARD
closeProfileBtn.Text = currentLang.Close
closeProfileBtn.TextColor3 = currentTheme.TEXT
closeProfileBtn.TextSize = 10
closeProfileBtn.Font = Enum.Font.BuilderSansBold
closeProfileBtn.Parent = profileModal

local cpCorner = Instance.new("UICorner")
cpCorner.CornerRadius = UDim.new(0, 6)
cpCorner.Parent = closeProfileBtn

local cpStroke = Instance.new("UIStroke")
cpStroke.Color = currentTheme.STROKE
cpStroke.Thickness = 1
cpStroke.Parent = closeProfileBtn

local confirmModal = Instance.new("CanvasGroup")
confirmModal.Name = "ConfirmModal"
confirmModal.Size = isMobile and UDim2.new(0, 250, 0, 140) or UDim2.new(0, 280, 0, 150)
confirmModal.Position = UDim2.new(0.5, 0, 0.5, 0)
confirmModal.AnchorPoint = Vector2.new(0.5, 0.5)
confirmModal.BackgroundColor3 = currentTheme.BG
confirmModal.GroupTransparency = 1
confirmModal.Visible = false
confirmModal.Parent = screenGui

local cmCorner = Instance.new("UICorner")
cmCorner.CornerRadius = UDim.new(0, 8)
cmCorner.Parent = confirmModal

local cmStroke = Instance.new("UIStroke")
cmStroke.Color = currentTheme.STROKE
cmStroke.Thickness = 1
cmStroke.Parent = confirmModal

local cmText = Instance.new("TextLabel")
cmText.Size = UDim2.new(1, -20, 0, 60)
cmText.Position = UDim2.new(0, 10, 0, 10)
cmText.BackgroundTransparency = 1
cmText.TextColor3 = currentTheme.TEXT
cmText.TextSize = 10
cmText.Font = Enum.Font.BuilderSans
cmText.TextWrapped = true
cmText.TextXAlignment = Enum.TextXAlignment.Left
cmText.TextYAlignment = Enum.TextYAlignment.Top
cmText.Parent = confirmModal

local cmBtnContainer = Instance.new("Frame")
cmBtnContainer.Size = UDim2.new(1, -20, 0, 28)
cmBtnContainer.Position = UDim2.new(0, 10, 1, -34)
cmBtnContainer.BackgroundTransparency = 1
cmBtnContainer.Parent = confirmModal

local cmLayout = Instance.new("UIListLayout")
cmLayout.FillDirection = Enum.FillDirection.Horizontal
cmLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
cmLayout.SortOrder = Enum.SortOrder.LayoutOrder
cmLayout.Padding = UDim.new(0, 6)
cmLayout.Parent = cmBtnContainer

local function createConfirmButton(text, isRed, width)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, width or 75, 1, 0)
	btn.BackgroundColor3 = isRed and Color3.fromRGB(180, 40, 45) or currentTheme.CARD
	btn.Text = text
	btn.TextColor3 = currentTheme.TEXT
	btn.TextSize = 10
	btn.Font = Enum.Font.BuilderSansBold
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 5)
	c.Parent = btn
	
	local s = Instance.new("UIStroke")
	s.Color = isRed and Color3.fromRGB(200, 50, 55) or currentTheme.STROKE
	s.Thickness = 1
	s.Parent = btn
	
	btn.Parent = cmBtnContainer
	return btn
end

local cmCancelBtn = createConfirmButton(currentLang.Close, false, 70)
local cmActionBtn = createConfirmButton(currentLang.Confirm, true, 80)

local settingsModal = Instance.new("CanvasGroup")
settingsModal.Name = "SettingsModal"
settingsModal.Size = isMobile and UDim2.new(0, 240, 0, 190) or UDim2.new(0, 260, 0, 210)
settingsModal.Position = UDim2.new(0.5, 0, 0.5, 0)
settingsModal.AnchorPoint = Vector2.new(0.5, 0.5)
settingsModal.BackgroundColor3 = currentTheme.BG
settingsModal.GroupTransparency = 1
settingsModal.Visible = false
settingsModal.Parent = screenGui

local setCorner = Instance.new("UICorner")
setCorner.CornerRadius = UDim.new(0, 8)
setCorner.Parent = settingsModal

local setStroke = Instance.new("UIStroke")
setStroke.Color = currentTheme.STROKE
setStroke.Thickness = 1
setStroke.Parent = settingsModal

local setLabel = Instance.new("TextLabel")
setLabel.Size = UDim2.new(1, -20, 0, 28)
setLabel.Position = UDim2.new(0, 10, 0, 6)
setLabel.BackgroundTransparency = 1
setLabel.Text = currentLang.Settings
setLabel.TextColor3 = currentTheme.TEXT
setLabel.TextSize = 11
setLabel.Font = Enum.Font.BuilderSansBold
setLabel.TextXAlignment = Enum.TextXAlignment.Left
setLabel.Parent = settingsModal

local themeSelectBtn = Instance.new("TextButton")
themeSelectBtn.Size = UDim2.new(1, -20, 0, 28)
themeSelectBtn.Position = UDim2.new(0, 10, 0, 42)
themeSelectBtn.BackgroundColor3 = currentTheme.CARD
themeSelectBtn.Text = currentLang.Theme .. ": " .. settingsData.Theme
themeSelectBtn.TextColor3 = currentTheme.TEXT
themeSelectBtn.TextSize = 10
themeSelectBtn.Font = Enum.Font.BuilderSansMedium
themeSelectBtn.Parent = settingsModal

local tCorner = Instance.new("UICorner")
tCorner.CornerRadius = UDim.new(0, 5)
tCorner.Parent = themeSelectBtn

local tStroke = Instance.new("UIStroke")
tStroke.Color = currentTheme.STROKE
tStroke.Thickness = 1
tStroke.Parent = themeSelectBtn

local langSelectBtn = Instance.new("TextButton")
langSelectBtn.Size = UDim2.new(1, -20, 0, 28)
langSelectBtn.Position = UDim2.new(0, 10, 0, 78)
langSelectBtn.BackgroundColor3 = currentTheme.CARD
langSelectBtn.Text = currentLang.Lang .. ": " .. string.upper(settingsData.Language)
langSelectBtn.TextColor3 = currentTheme.TEXT
langSelectBtn.TextSize = 10
langSelectBtn.Font = Enum.Font.BuilderSansMedium
langSelectBtn.Parent = settingsModal

local lCorner = Instance.new("UICorner")
lCorner.CornerRadius = UDim.new(0, 5)
lCorner.Parent = langSelectBtn

local closeSettingsBtn = Instance.new("TextButton")
closeSettingsBtn.Size = UDim2.new(1, -20, 0, 28)
closeSettingsBtn.Position = UDim2.new(0, 10, 1, -34)
closeSettingsBtn.BackgroundColor3 = currentTheme.CARD
closeSettingsBtn.Text = currentLang.Close
closeSettingsBtn.TextColor3 = currentTheme.TEXT
closeSettingsBtn.TextSize = 10
closeSettingsBtn.Font = Enum.Font.BuilderSansBold
closeSettingsBtn.Parent = settingsModal

local csCorner = Instance.new("UICorner")
csCorner.CornerRadius = UDim.new(0, 5)
csCorner.Parent = closeSettingsBtn

local csStroke = Instance.new("UIStroke")
csStroke.Color = currentTheme.STROKE
csStroke.Thickness = 1
csStroke.Parent = settingsModal

local themeKeys = {"dark", "dark_red", "dark_blue", "dark_green", "dark_purple", "light"}
local langKeys = {"en", "pt", "es"}

--------------------------------------------------------------------------------
-- ANIMAÇÕES
--------------------------------------------------------------------------------
local popInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function animateOpen(frame)
	frame.GroupTransparency = 1
	frame.Position = UDim2.new(0.5, 0, 0.5, 30)
	frame.Visible = true
	TweenService:Create(frame, popInfo, {
		GroupTransparency = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0)
	}):Play()
end

local function animateClose(frame, callback)
	local tw = TweenService:Create(frame, popInfo, {
		GroupTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 30)
	})
	tw:Play()
	tw.Completed:Connect(function()
		frame.Visible = false
		if callback then callback() end
	end)
end

local renderConnection = nil
local currentModel3D = nil
local is3DMode = false
local selectedTargetPlayer = nil

local function cleanup3D()
	if renderConnection then
		renderConnection:Disconnect()
		renderConnection = nil
	end
	viewport3D:ClearAllChildren()
	currentModel3D = nil
end

local function load3DAvatar(userId)
	cleanup3D()
	
	avatarSpinnerOuter.Visible = true
	avatarSpinnerTween:Play()
	
	task.spawn(function()
		local worldModel = Instance.new("WorldModel")
		worldModel.Parent = viewport3D
		
		local camera = Instance.new("Camera")
		camera.FieldOfView = 30
		viewport3D.CurrentCamera = camera
		camera.Parent = viewport3D

		local success, model = pcall(function()
			local description = Players:GetHumanoidDescriptionFromUserId(userId)
			return Players:CreateHumanoidModelFromDescription(description, Enum.HumanoidRigType.R15)
		end)

		avatarSpinnerTween:Cancel()
		avatarSpinnerOuter.Visible = false

		if success and model then
			model.Parent = worldModel
			currentModel3D = model

			for _, v in ipairs(model:GetDescendants()) do
				if v:IsA("Animator") or v:IsA("AnimationPlayer") or v:IsA("Script") or v:IsA("LocalScript") then
					v:Destroy()
				end
			end

			local primaryPart = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Torso") or model:FindFirstChild("UpperTorso")
			
			if primaryPart then
				local center, size = model:GetBoundingBox()
				primaryPart.CFrame = CFrame.new(0, 0, 0)
				
				local distance = math.max(size.X, size.Y, size.Z) * 1.3 + 5
				local cameraPos = Vector3.new(0, size.Y * 0.1, distance)
				camera.CFrame = CFrame.lookAt(cameraPos, Vector3.new(0, 0, 0))

				local angle = 0
				renderConnection = RunService.RenderStepped:Connect(function(dt)
					angle = angle + dt * 0.8
					if model and model.PrimaryPart then
						model:SetPrimaryPartCFrame(CFrame.new(0, 0, 0) * CFrame.Angles(0, angle, 0))
					end
				end)
			end

			if is3DMode then
				profileFullBody.Visible = false
				viewport3D.Visible = true
			end
		end
	end)
end

toggleDimensionBtn.MouseButton1Click:Connect(function()
	is3DMode = not is3DMode
	if is3DMode then
		toggleDimensionBtn.Text = "3D"
		if selectedTargetPlayer then
			if not currentModel3D then
				load3DAvatar(selectedTargetPlayer.UserId)
			else
				profileFullBody.Visible = false
				viewport3D.Visible = true
			end
		end
	else
		toggleDimensionBtn.Text = "2D"
		viewport3D.Visible = false
		profileFullBody.Visible = true
	end
end)

local updatePlayerList
local requestUpdate
local updatePlayerRowOnly

local function applyThemeAndLang()
	currentTheme = Themes[settingsData.Theme] or Themes.dark
	currentLang = Translations[settingsData.Language] or Translations.en
	
	toggleBtn.BackgroundColor3 = currentTheme.BG
	toggleBtn.TextColor3 = currentTheme.TEXT
	toggleStroke.Color = currentTheme.STROKE
	
	leaderboardFrame.BackgroundColor3 = currentTheme.BG
	lbStroke.Color = currentTheme.STROKE
	lbTitle.Text = currentLang.Title
	lbTitle.TextColor3 = currentTheme.TEXT
	settingsIconBtn.TextColor3 = currentTheme.SUBTEXT

	searchFrame.BackgroundColor3 = currentTheme.CARD
	searchStroke.Color = currentTheme.STROKE
	searchInput.TextColor3 = currentTheme.TEXT
	searchInput.PlaceholderColor3 = currentTheme.SUBTEXT
	searchInput.PlaceholderText = currentLang.SearchPlaceholder

	scrollingPlayers.ScrollBarImageColor3 = currentTheme.STROKE
	profileModalScroll.ScrollBarImageColor3 = currentTheme.STROKE
	
	backgroundBanner.BackgroundColor3 = currentTheme.CARD
	
	spinnerOuter.BackgroundColor3 = currentTheme.SPINNER
	spinnerInner.BackgroundColor3 = currentTheme.BG
	spinnerNotch.BackgroundColor3 = currentTheme.BG
	
	profileModal.BackgroundColor3 = currentTheme.BG
	pmStroke.Color = currentTheme.STROKE
	displayLabel.TextColor3 = currentTheme.TEXT
	usernameLabel.TextColor3 = currentTheme.SUBTEXT
	userDescriptionLabel.TextColor3 = currentTheme.SUBTEXT
	voiceStatusLabel.TextColor3 = currentTheme.SUBTEXT
	
	closeProfileBtn.BackgroundColor3 = currentTheme.CARD
	closeProfileBtn.TextColor3 = currentTheme.TEXT
	closeProfileBtn.Text = currentLang.Close
	cpStroke.Color = currentTheme.STROKE
	
	headshotContainer.BackgroundColor3 = currentTheme.BG
	hsStroke.Color = currentTheme.STROKE
	
	friendsVal.TextColor3 = currentTheme.TEXT
	friendsTitle.TextColor3 = currentTheme.SUBTEXT
	friendsTitle.Text = currentLang.Friends
	
	followersVal.TextColor3 = currentTheme.TEXT
	followersTitle.TextColor3 = currentTheme.SUBTEXT
	followersTitle.Text = currentLang.Followers
	
	createdVal.TextColor3 = currentTheme.TEXT
	createdTitle.TextColor3 = currentTheme.SUBTEXT
	createdTitle.Text = currentLang.Created

	ageCheckedVal.TextColor3 = currentTheme.TEXT
	ageCheckedTitle.TextColor3 = currentTheme.SUBTEXT
	ageCheckedTitle.Text = currentLang.AgeChecked

	countryVal.TextColor3 = currentTheme.TEXT
	countryTitle.TextColor3 = currentTheme.SUBTEXT
	countryTitle.Text = currentLang.Country

	avatarBtn.BackgroundColor3 = currentTheme.CARD
	avatarBtn.TextColor3 = currentTheme.TEXT
	if avatarBtn:FindFirstChild("BtnStroke") then avatarBtn.BtnStroke.Color = currentTheme.STROKE end

	disrespectfulBtn.BackgroundColor3 = currentTheme.CARD
	disrespectfulBtn.TextColor3 = currentTheme.TEXT
	if disrespectfulBtn:FindFirstChild("BtnStroke") then disrespectfulBtn.BtnStroke.Color = currentTheme.STROKE end

	friendBtn.BackgroundColor3 = currentTheme.TEXT
	friendBtn.TextColor3 = currentTheme.BG
	
	confirmModal.BackgroundColor3 = currentTheme.BG
	cmStroke.Color = currentTheme.STROKE
	cmText.TextColor3 = currentTheme.TEXT
	cmCancelBtn.BackgroundColor3 = currentTheme.CARD
	cmCancelBtn.TextColor3 = currentTheme.TEXT
	cmCancelBtn.Text = currentLang.Close
	
	settingsModal.BackgroundColor3 = currentTheme.BG
	setStroke.Color = currentTheme.STROKE
	setLabel.TextColor3 = currentTheme.TEXT
	themeSelectBtn.BackgroundColor3 = currentTheme.CARD
	themeSelectBtn.TextColor3 = currentTheme.TEXT
	themeSelectBtn.Text = currentLang.Theme .. ": " .. settingsData.Theme
	langSelectBtn.BackgroundColor3 = currentTheme.CARD
	langSelectBtn.TextColor3 = currentTheme.TEXT
	langSelectBtn.Text = currentLang.Lang .. ": " .. string.upper(settingsData.Language)
	closeSettingsBtn.BackgroundColor3 = currentTheme.CARD
	closeSettingsBtn.TextColor3 = currentTheme.TEXT
	closeSettingsBtn.Text = currentLang.Close
	
	blockBtn.Text = currentLang.Block
	avatarBtn.Text = currentLang.ViewAvatar
	friendBtn.Text = currentLang.AddFriend
	
	local isDisrespectful = selectedTargetPlayer and settingsData.DisrespectfulUsers[tostring(selectedTargetPlayer.UserId)]
	disrespectfulBtn.Text = isDisrespectful and currentLang.RemoveDisrespectful or currentLang.Disrespectful
	
	saveSettings()
end

themeSelectBtn.MouseButton1Click:Connect(function()
	local idx = table.find(themeKeys, settingsData.Theme) or 1
	idx = (idx % #themeKeys) + 1
	settingsData.Theme = themeKeys[idx]
	applyThemeAndLang()
end)

langSelectBtn.MouseButton1Click:Connect(function()
	local idx = table.find(langKeys, settingsData.Language) or 1
	idx = (idx % #langKeys) + 1
	settingsData.Language = langKeys[idx]
	applyThemeAndLang()
end)

settingsIconBtn.MouseButton1Click:Connect(function()
	if settingsModal.Visible then
		animateClose(settingsModal)
	else
		animateOpen(settingsModal)
	end
end)

closeSettingsBtn.MouseButton1Click:Connect(function()
	animateClose(settingsModal)
end)

local isOpen = false

local function closeLeaderboard()
	isOpen = false
	toggleBtn.Text = "<"
	TweenService:Create(toggleBtn, popInfo, {Position = UDim2.new(1, -38, 0, 12)}):Play()
	
	local targetLbPos = UDim2.new(1, 10, 0, 48)
	local tw = TweenService:Create(leaderboardFrame, popInfo, {Position = targetLbPos, GroupTransparency = 1})
	tw:Play()
	tw.Completed:Connect(function()
		if not isOpen then
			leaderboardFrame.Visible = false
		end
	end)
	
	if profileModal.Visible then
		animateClose(profileModal)
	end
	if confirmModal.Visible then
		animateClose(confirmModal)
	end
	if settingsModal.Visible then
		animateClose(settingsModal)
	end
end

toggleBtn.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	if isOpen then
		toggleBtn.Text = ">"
		leaderboardFrame.Visible = true
		local offsetLb = isMobile and -310 or -390
		local offsetBtn = isMobile and -350 or -430
		TweenService:Create(toggleBtn, popInfo, {Position = UDim2.new(1, offsetBtn, 0, 12)}):Play()
		TweenService:Create(leaderboardFrame, popInfo, {Position = UDim2.new(1, offsetLb, 0, 48), GroupTransparency = 0}):Play()
	else
		closeLeaderboard()
	end
end)

GuiService.MenuOpened:Connect(function() screenGui.Enabled = false end)
GuiService.MenuClosed:Connect(function() screenGui.Enabled = true end)

local pendingAction = nil
local voiceStates = {}

local function getVoiceStateData(plr)
	local uid = plr.UserId
	if not voiceStates[uid] then
		voiceStates[uid] = { wasActive = false, lastDeactivateTime = 0, lastActiveTick = nil }
	end
	
	local state = voiceStates[uid]
	local isActive = false

	pcall(function()
		if VoiceChatService:IsPlayerSpeaking(plr) or VoiceChatService:IsPlayerPublishing(plr) then
			isActive = true
		end
	end)

	if not isActive then
		local audioInput = plr:FindFirstChildOfClass("AudioDeviceInput") 
			or (plr.Character and plr.Character:FindFirstChildOfClass("AudioDeviceInput"))
		if audioInput and audioInput.IsReady and not audioInput.Muted then
			isActive = true
		end
	end
	
	if isActive then
		state.wasActive = true
		state.lastActiveTick = tick()
	else
		if state.wasActive then
			state.wasActive = false
			state.lastDeactivateTime = tick()
		end
	end
	
	return isActive, state
end

local function formatTimeAgo(pastTick)
	if not pastTick then return "" end
	local diff = math.max(0, tick() - pastTick)
	
	if diff < 60 then
		return currentLang.LessThanMin
	elseif diff < 3600 then
		local mins = math.floor(diff / 60)
		local secs = math.floor(diff % 60)
		return string.format(currentLang.MinSecFormat, mins, secs)
	else
		local hours = math.floor(diff / 3600)
		local mins = math.floor((diff % 3600) / 60)
		return string.format(currentLang.HourMinFormat, hours, mins)
	end
end

local function getLeaderboardVoiceEmoji(plr)
	local isActive, state = getVoiceStateData(plr)
	
	if isActive then
		return "🔊"
	elseif (tick() - state.lastDeactivateTime) < 3.0 then
		return "🔇"
	end
	return ""
end

local function getPlayerBadges(plr)
	local badges = ""
	if settingsData.DisrespectfulUsers[tostring(plr.UserId)] then
		badges = badges .. "🚩 "
	end
	if (game.CreatorType == Enum.CreatorType.User and game.CreatorId == plr.UserId) or
	   (game.CreatorType == Enum.CreatorType.Group and plr:GetRankInGroup(game.CreatorId) == 255) then
		badges = badges .. "🔨 "
	end
	if localPlayer:IsFriendsWith(plr.UserId) then
		badges = badges .. "👥 "
	end
	local vEmoji = getLeaderboardVoiceEmoji(plr)
	if vEmoji ~= "" then
		badges = badges .. vEmoji .. " "
	end
	return badges
end

local function getFormattedAccountAge(plr)
	local days = plr.AccountAge
	local createdTimestamp = os.time() - (days * 86400)
	local d = os.date("*t", createdTimestamp)
	local yearShort = string.sub(tostring(d.year), -2)
	
	if settingsData.Language == "en" then
		return string.format("%02d/%02d/%s", d.month, d.day, yearShort)
	else
		return string.format("%02d/%02d/%s", d.day, d.month, yearShort)
	end
end

local function formatTeamName(name)
	if #name > 10 then
		return string.sub(name, 1, 10) .. "..."
	end
	return name
end

local function formatNumber(n)
	n = tonumber(n) or 0
	if n >= 1e9 then return string.format("%.1fB", n / 1e9)
	elseif n >= 1e6 then return string.format("%.1fM", n / 1e6)
	elseif n >= 1e3 then return string.format("%.1fK", n / 1e3) end
	return tostring(n)
end

local function getGameStatsList()
	for _, plr in ipairs(Players:GetPlayers()) do
		local leaderstats = plr:FindFirstChild("leaderstats")
		if leaderstats then
			local stats = {}
			for _, stat in ipairs(leaderstats:GetChildren()) do
				if stat:IsA("IntValue") or stat:IsA("NumberValue") or stat:IsA("StringValue") then
					table.insert(stats, stat.Name)
					if #stats >= MAX_STATS then break end
				end
			end
			if #stats > 0 then return stats end
		end
	end
	return nil
end

local function getPlayerStatValue(plr, statName)
	local leaderstats = plr:FindFirstChild("leaderstats")
	if leaderstats then
		local s = leaderstats:FindFirstChild(statName)
		if s and (s:IsA("IntValue") or s:IsA("NumberValue") or s:IsA("StringValue")) then
			return s.Value
		end
	end
	return 0
end

local function getPlayerPrimaryStat(plr)
	local leaderstats = plr:FindFirstChild("leaderstats")
	if leaderstats then
		local coins = leaderstats:FindFirstChild("Coins") or leaderstats:FindFirstChild("Moedas")
		if coins and (coins:IsA("IntValue") or coins:IsA("NumberValue")) then return coins.Value end
		for _, stat in ipairs(leaderstats:GetChildren()) do
			if stat:IsA("IntValue") or stat:IsA("NumberValue") then return stat.Value end
		end
	end
	return 0
end

--------------------------------------------------------------------------------
-- LÓGICA DE AUTO-COMPLETE (APENAS QUANDO DAR ENTER) E FILTRAGEM
--------------------------------------------------------------------------------
local function filterPlayersOnly()
	local queryLower = string.lower(searchInput.Text)
	for _, child in ipairs(scrollingPlayers:GetChildren()) do
		if child:IsA("TextButton") and string.sub(child.Name, 1, 10) == "PlayerRow_" then
			local uid = tonumber(string.sub(child.Name, 11))
			local plr = uid and Players:GetPlayerByUserId(uid)
			if plr then
				if queryLower == "" then
					child.Visible = true
				else
					local uName = string.lower(plr.Name)
					local dName = string.lower(plr.DisplayName)
					if string.find(uName, queryLower, 1, true) or string.find(dName, queryLower, 1, true) then
						child.Visible = true
					else
						child.Visible = false
					end
				end
			end
		end
	end
end

searchInput:GetPropertyChangedSignal("Text"):Connect(function()
	filterPlayersOnly()
end)

searchInput.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local queryLower = string.lower(searchInput.Text)
		if queryLower ~= "" then
			local bestMatchUsername = nil
			for _, plr in ipairs(Players:GetPlayers()) do
				local uName = string.lower(plr.Name)
				local dName = string.lower(plr.DisplayName)
				if string.sub(uName, 1, #queryLower) == queryLower or string.sub(dName, 1, #queryLower) == queryLower then
					bestMatchUsername = plr.Name
					break
				end
			end
			if bestMatchUsername then
				searchInput.Text = bestMatchUsername
				filterPlayersOnly()
			end
		end
	end
end)

local isUpdatingList = false
local updatePending = false

updatePlayerRowOnly = function(plr)
	local row = scrollingPlayers:FindFirstChild("PlayerRow_" .. plr.UserId)
	if not row then return false end
	
	local activeStats = getGameStatsList()

	if activeStats then
		for i, statName in ipairs(activeStats) do
			local statTxt = row:FindFirstChild("Stat_" .. statName)
			if statTxt then
				local val = getPlayerStatValue(plr, statName)
				statTxt.Text = type(val) == "number" and formatNumber(val) or tostring(val)
			end
		end
	end

	local statusBadges = row:FindFirstChild("StatusBadges")
	if statusBadges then
		statusBadges.Text = getPlayerBadges(plr)
	end

	return true
end

updatePlayerList = function(showLoading)
	if isUpdatingList then 
		updatePending = true
		return 
	end
	isUpdatingList = true

	if showLoading then
		showLoadingCircle()
	end

	pcall(function()
		scrollingPlayers.AutomaticCanvasSize = Enum.AutomaticSize.None

		for _, child in ipairs(scrollingPlayers:GetChildren()) do
			if not child:IsA("UIListLayout") then 
				child:Destroy() 
			end
		end
		
		local allTeams = Teams:GetTeams()
		local playersByTeam = {}
		local neutralPlayers = {}
		local activeStats = getGameStatsList()
		local numStats = activeStats and #activeStats or 0
		
		local function sortPlayersByStats(list)
			table.sort(list, function(a, b)
				return getPlayerPrimaryStat(a) > getPlayerPrimaryStat(b)
			end)
		end

		if #allTeams > 0 then
			for _, team in ipairs(allTeams) do playersByTeam[team] = {} end
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr.Team and playersByTeam[plr.Team] then
					table.insert(playersByTeam[plr.Team], plr)
				else
					table.insert(neutralPlayers, plr)
				end
			end
		else
			neutralPlayers = Players:GetPlayers()
		end
		
		sortPlayersByStats(neutralPlayers)
		
		table.sort(allTeams, function(a, b)
			local countA = playersByTeam[a] and #playersByTeam[a] or 0
			local countB = playersByTeam[b] and #playersByTeam[b] or 0
			return countA > countB
		end)

		local tempRows = {}

		if #allTeams == 0 and activeStats then
			local headerFrame = Instance.new("Frame")
			headerFrame.Name = "HeaderFrame"
			headerFrame.Size = UDim2.new(1, 0, 0, 18)
			headerFrame.BackgroundTransparency = 1

			local statWidth = 38
			local badgesWidth = 40
			local nameWidthOffset = (numStats * statWidth) + badgesWidth + 35

			local nameHeader = Instance.new("TextLabel")
			nameHeader.Size = UDim2.new(1, -nameWidthOffset, 1, 0)
			nameHeader.Position = UDim2.new(0, 32, 0, 0)
			nameHeader.BackgroundTransparency = 1
			nameHeader.Text = "Name"
			nameHeader.TextColor3 = currentTheme.SUBTEXT
			nameHeader.TextSize = 9
			nameHeader.Font = Enum.Font.BuilderSansBold
			nameHeader.TextXAlignment = Enum.TextXAlignment.Left
			nameHeader.Parent = headerFrame

			for i, statName in ipairs(activeStats) do
				local statHeader = Instance.new("TextLabel")
				statHeader.Size = UDim2.new(0, statWidth, 1, 0)
				local rightOffset = -badgesWidth - ((numStats - i) * statWidth) - 4
				statHeader.Position = UDim2.new(1, rightOffset, 0, 0)
				statHeader.BackgroundTransparency = 1
				statHeader.Text = statName
				statHeader.TextColor3 = currentTheme.SUBTEXT
				statHeader.TextSize = 8
				statHeader.Font = Enum.Font.BuilderSansBold
				statHeader.TextXAlignment = Enum.TextXAlignment.Center
				statHeader.TextTruncate = Enum.TextTruncate.AtEnd
				statHeader.Parent = headerFrame
			end

			table.insert(tempRows, headerFrame)
		end

		local function createPlayerRow(plr)
			local row = Instance.new("TextButton")
			row.Name = "PlayerRow_" .. plr.UserId
			row.Size = UDim2.new(1, 0, 0, isMobile and 32 or 28)
			row.BackgroundColor3 = currentTheme.CARD
			row.BorderSizePixel = 0
			row.Text = ""
			
			local rc = Instance.new("UICorner")
			rc.CornerRadius = UDim.new(0, 5)
			rc.Parent = row

			local rStroke = Instance.new("UIStroke")
			rStroke.Color = currentTheme.STROKE
			rStroke.Thickness = 1
			rStroke.Parent = row
			
			local avatarThumb = Instance.new("ImageLabel")
			avatarThumb.Name = "AvatarThumb"
			avatarThumb.Size = UDim2.new(0, 20, 0, 20)
			avatarThumb.Position = UDim2.new(0, 5, 0.5, -10)
			avatarThumb.BackgroundColor3 = currentTheme.BG
			avatarThumb.Image = "rbxthumb://type=AvatarHeadShot&id=" .. plr.UserId .. "&w=150&h=150"
			avatarThumb.Parent = row
			
			local atc = Instance.new("UICorner")
			atc.CornerRadius = UDim.new(1, 0)
			atc.Parent = avatarThumb

			local statWidth = 38
			local badgesWidth = 40
			local nameWidthOffset = (numStats * statWidth) + badgesWidth + 35
			
			local nameTxt = Instance.new("TextLabel")
			nameTxt.Name = "NameTxt"
			nameTxt.Size = UDim2.new(1, -nameWidthOffset, 1, 0)
			nameTxt.Position = UDim2.new(0, 30, 0, 0)
			nameTxt.BackgroundTransparency = 1
			nameTxt.Text = plr.DisplayName
			nameTxt.TextColor3 = currentTheme.TEXT
			nameTxt.TextSize = isMobile and 10 or 9
			nameTxt.Font = Enum.Font.BuilderSansMedium
			nameTxt.TextXAlignment = Enum.TextXAlignment.Left
			nameTxt.TextTruncate = Enum.TextTruncate.AtEnd
			nameTxt.AutomaticSize = Enum.AutomaticSize.X
			nameTxt.Parent = row
			
			local badgeOffset = 3

			checkRobloxPlus(plr, function(hasPlus)
				if hasPlus then
					local plusBadge = Instance.new("ImageLabel")
					plusBadge.Name = "RobloxPlusBadge"
					plusBadge.Size = UDim2.new(0, 11, 0, 11)
					plusBadge.Position = UDim2.new(1, badgeOffset, 0.5, -5)
					plusBadge.BackgroundTransparency = 1
					plusBadge.Image = ROBLOX_PLUS_BADGE_ID
					plusBadge.Parent = nameTxt
					badgeOffset = badgeOffset + 14
				end
			end)

			if plr.HasVerifiedBadge then
				local vBadgeIcon = Instance.new("ImageLabel")
				vBadgeIcon.Name = "VerifiedBadge"
				vBadgeIcon.Size = UDim2.new(0, 11, 0, 11)
				vBadgeIcon.Position = UDim2.new(1, badgeOffset, 0.5, -5)
				vBadgeIcon.BackgroundTransparency = 1
				vBadgeIcon.Image = VERIFIED_BADGE_ID
				vBadgeIcon.Parent = nameTxt
			end

			if activeStats then
				for i, statName in ipairs(activeStats) do
					local statTxt = Instance.new("TextLabel")
					statTxt.Name = "Stat_" .. statName
					statTxt.Size = UDim2.new(0, statWidth, 1, 0)
					local rightOffset = -badgesWidth - ((numStats - i) * statWidth) - 4
					statTxt.Position = UDim2.new(1, rightOffset, 0, 0)
					statTxt.BackgroundTransparency = 1
					local val = getPlayerStatValue(plr, statName)
					statTxt.Text = type(val) == "number" and formatNumber(val) or tostring(val)
					statTxt.TextColor3 = currentTheme.TEXT
					statTxt.TextSize = 9
					statTxt.Font = Enum.Font.BuilderSansBold
					statTxt.TextXAlignment = Enum.TextXAlignment.Center
					statTxt.TextTruncate = Enum.TextTruncate.AtEnd
					statTxt.Parent = row
				end
			end

			local statusBadges = Instance.new("TextLabel")
			statusBadges.Name = "StatusBadges"
			statusBadges.Size = UDim2.new(0, badgesWidth, 1, 0)
			statusBadges.Position = UDim2.new(1, -badgesWidth - 2, 0, 0)
			statusBadges.BackgroundTransparency = 1
			statusBadges.Text = getPlayerBadges(plr)
			statusBadges.TextColor3 = currentTheme.TEXT
			statusBadges.TextSize = 9
			statusBadges.Font = Enum.Font.BuilderSans
			statusBadges.TextXAlignment = Enum.TextXAlignment.Right
			statusBadges.Parent = row
			
			row.MouseButton1Click:Connect(function()
				selectedTargetPlayer = plr
				
				profileContentGroup.GroupTransparency = 1
				modalSpinnerOuter.Visible = true
				modalSpinnerTween:Play()
				
				animateOpen(profileModal)
				
				task.spawn(function()
					cleanup3D()
					is3DMode = false
					toggleDimensionBtn.Text = "2D"
					viewport3D.Visible = false
					profileFullBody.Visible = true
					
					displayLabel.Text = plr.DisplayName
					displayLabel.AutomaticSize = Enum.AutomaticSize.X
					displayLabel.Size = UDim2.new(0, 0, 0, 20)
					
					local startX = 64
					profileVerifiedIcon.Visible = false
					profilePlusIcon.Visible = false

					checkRobloxPlus(plr, function(hasPlus)
						local currentOffset = displayLabel.AbsoluteSize.X + 4
						if hasPlus then
							profilePlusIcon.Position = UDim2.new(0, startX + currentOffset, 0, isMobile and 101 or 121)
							profilePlusIcon.Visible = true
							currentOffset = currentOffset + 18
						end

						if plr.HasVerifiedBadge then
							profileVerifiedIcon.Position = UDim2.new(0, startX + currentOffset, 0, isMobile and 102 or 122)
							profileVerifiedIcon.Visible = true
						end
					end)

					usernameLabel.Text = "@" .. plr.Name
					createdVal.Text = getFormattedAccountAge(plr)
					followersVal.Text = "..."
					friendsVal.Text = "..."
					userDescriptionLabel.Text = "..."

					local ageStatus = getPlayerAgeChecked(plr)
					ageCheckedVal.Text = ageStatus

					local countryCode = getPlayerCountry(plr)
					countryVal.Text = getCountryEmoji(countryCode)
					
					profileFullBody.Image = "rbxthumb://type=Avatar&id=" .. plr.UserId .. "&w=352&h=352"
					userHeadshotImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. plr.UserId .. "&w=150&h=150"

					backgroundBanner.BackgroundColor3 = currentTheme.CARD

					local isActive, state = getVoiceStateData(plr)
					if isActive then
						voiceStatusLabel.Visible = true
						voiceStatusLabel.Text = currentLang.VoiceActive
						voiceStatusLabel.TextColor3 = Color3.fromRGB(80, 200, 100)
					elseif state.lastActiveTick then
						voiceStatusLabel.Visible = true
						voiceStatusLabel.Text = currentLang.VoiceInactive .. formatTimeAgo(state.lastActiveTick)
						voiceStatusLabel.TextColor3 = currentTheme.SUBTEXT
					else
						voiceStatusLabel.Visible = false
					end
					
					if plr == localPlayer then
						friendBtn.Visible = false
						blockBtn.Visible = false
						disrespectfulBtn.Visible = false
					else
						friendBtn.Visible = true
						blockBtn.Visible = true
						disrespectfulBtn.Visible = true
						friendBtn.Text = localPlayer:IsFriendsWith(plr.UserId) and currentLang.UnAddFriend or currentLang.AddFriend
						
						local isDisrespectful = settingsData.DisrespectfulUsers[tostring(plr.UserId)]
						disrespectfulBtn.Text = isDisrespectful and currentLang.RemoveDisrespectful or currentLang.Disrespectful
					end

					modalSpinnerTween:Cancel()
					modalSpinnerOuter.Visible = false
					
					TweenService:Create(profileContentGroup, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						GroupTransparency = 0
					}):Play()

					HttpQueue:Clear()

					fetchUserDescriptionThirdParty(plr.UserId, function(descText)
						if selectedTargetPlayer == plr then
							userDescriptionLabel.Text = descText
						end
					end)

					fetchFriendsAndFollowers(plr.UserId, function(fers, fris)
						if selectedTargetPlayer == plr then
							followersVal.Text = formatNumber(fers)
							friendsVal.Text = formatNumber(fris)
						end
					end)
				end)
			end)

			return row
		end
		
		for _, team in ipairs(allTeams) do
			local teamPlayers = playersByTeam[team] or {}
			if #teamPlayers > 0 then
				sortPlayersByStats(teamPlayers)
				
				local teamFrame = Instance.new("Frame")
				teamFrame.Name = "TeamFrame_" .. team.Name
				teamFrame.Size = UDim2.new(1, 0, 0, 20)
				teamFrame.BackgroundColor3 = team.TeamColor.Color
				teamFrame.BorderSizePixel = 0
				
				local tfCorner = Instance.new("UICorner")
				tfCorner.CornerRadius = UDim.new(0, 4)
				tfCorner.Parent = teamFrame
				
				local bgCol = team.TeamColor.Color
				local luminance = (bgCol.R * 0.299 + bgCol.G * 0.587 + bgCol.B * 0.114)
				local dynamicTeamTextColor = luminance > 0.65 and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(255, 255, 255)

				local statWidth = 38
				local badgesWidth = 40
				local teamNameWidthOffset = (numStats * statWidth) + badgesWidth + 10

				local teamLabel = Instance.new("TextLabel")
				teamLabel.Size = UDim2.new(1, -teamNameWidthOffset, 1, 0)
				teamLabel.Position = UDim2.new(0, 8, 0, 0)
				teamLabel.BackgroundTransparency = 1
				teamLabel.Text = formatTeamName(team.Name) .. " (" .. #teamPlayers .. ")"
				teamLabel.TextColor3 = dynamicTeamTextColor
				teamLabel.TextSize = 10
				teamLabel.Font = Enum.Font.BuilderSansBold
				teamLabel.TextXAlignment = Enum.TextXAlignment.Left
				teamLabel.Parent = teamFrame

				if activeStats then
					for i, statName in ipairs(activeStats) do
						local teamStatHeader = Instance.new("TextLabel")
						teamStatHeader.Size = UDim2.new(0, statWidth, 1, 0)
						local rightOffset = -badgesWidth - ((numStats - i) * statWidth) - 4
						teamStatHeader.Position = UDim2.new(1, rightOffset, 0, 0)
						teamStatHeader.BackgroundTransparency = 1
						teamStatHeader.Text = statName
						teamStatHeader.TextColor3 = dynamicTeamTextColor
						teamStatHeader.TextSize = 8
						teamStatHeader.Font = Enum.Font.BuilderSansBold
						teamStatHeader.TextXAlignment = Enum.TextXAlignment.Center
						teamStatHeader.TextTruncate = Enum.TextTruncate.AtEnd
						teamStatHeader.Parent = teamFrame
					end
				end
				
				table.insert(tempRows, teamFrame)

				for _, plr in ipairs(teamPlayers) do
					table.insert(tempRows, createPlayerRow(plr))
				end
			end
		end
		
		for _, plr in ipairs(neutralPlayers) do
			table.insert(tempRows, createPlayerRow(plr))
		end

		for _, elem in ipairs(tempRows) do
			elem.Parent = scrollingPlayers
		end

		scrollingPlayers.AutomaticCanvasSize = Enum.AutomaticSize.Y
		filterPlayersOnly()
	end)

	hideLoadingCircle()
	isUpdatingList = false

	if updatePending then
		updatePending = false
		requestUpdate(false)
	end
end

requestUpdate = function(showLoading, specificPlayer)
	if specificPlayer and not showLoading then
		if updatePlayerRowOnly(specificPlayer) then
			return
		end
	end
	
	task.spawn(function()
		updatePlayerList(showLoading)
	end)
end

local function connectPlayerStats(plr)
	plr:GetPropertyChangedSignal("Team"):Connect(function() 
		requestUpdate(false, plr) 
	end)
	
	local leaderstats = plr:WaitForChild("leaderstats", 2)
	if leaderstats then
		for _, stat in ipairs(leaderstats:GetChildren()) do
			stat:GetPropertyChangedSignal("Value"):Connect(function() 
				requestUpdate(false, plr) 
			end)
		end
		leaderstats.ChildAdded:Connect(function(stat)
			if stat:IsA("IntValue") or stat:IsA("NumberValue") or stat:IsA("StringValue") then
				stat:GetPropertyChangedSignal("Value"):Connect(function() 
					requestUpdate(false, plr) 
				end)
			end
			requestUpdate(false)
		end)
	end
end

for _, plr in ipairs(Players:GetPlayers()) do
	connectPlayerStats(plr)
end

Players.PlayerAdded:Connect(function(plr)
	connectPlayerStats(plr)
	requestUpdate(false)
end)

Players.PlayerRemoving:Connect(function() requestUpdate(false) end)
Teams.ChildAdded:Connect(function() requestUpdate(false) end)
Teams.ChildRemoved:Connect(function() requestUpdate(false) end)

requestUpdate(true)

task.spawn(function()
	while task.wait(3) do
		if isOpen then
			for _, plr in ipairs(Players:GetPlayers()) do
				updatePlayerRowOnly(plr)
			end
		end
	end
end)

closeProfileBtn.MouseButton1Click:Connect(function()
	animateClose(profileModal, function()
		cleanup3D()
		HttpQueue:Clear()
	end)
end)

blockBtn.MouseButton1Click:Connect(function()
	if selectedTargetPlayer and selectedTargetPlayer ~= localPlayer then
		animateClose(profileModal, function()
			cleanup3D()
			cmText.Text = currentLang.BlockText
			cmActionBtn.Text = currentLang.Block
			pendingAction = "Block"
			animateOpen(confirmModal)
		end)
	end
end)

avatarBtn.MouseButton1Click:Connect(function()
	if selectedTargetPlayer then
		pcall(function() GuiService:InspectPlayerFromUserId(selectedTargetPlayer.UserId) end)
	end
end)

friendBtn.MouseButton1Click:Connect(function()
	if not selectedTargetPlayer or selectedTargetPlayer == localPlayer then return end
	if localPlayer:IsFriendsWith(selectedTargetPlayer.UserId) then
		animateClose(profileModal, function()
			cleanup3D()
			cmText.Text = currentLang.UnAddText
			cmActionBtn.Text = currentLang.UnAddFriend
			pendingAction = "UnAdd"
			animateOpen(confirmModal)
		end)
	else
		pcall(function() StarterGui:SetCore("PromptSendFriendRequest", selectedTargetPlayer) end)
		closeLeaderboard()
	end
end)

disrespectfulBtn.MouseButton1Click:Connect(function()
	if not selectedTargetPlayer or selectedTargetPlayer == localPlayer then return end
	local uidStr = tostring(selectedTargetPlayer.UserId)
	if settingsData.DisrespectfulUsers[uidStr] then
		settingsData.DisrespectfulUsers[uidStr] = nil
		disrespectfulBtn.Text = currentLang.Disrespectful
	else
		settingsData.DisrespectfulUsers[uidStr] = true
		disrespectfulBtn.Text = currentLang.RemoveDisrespectful
	end
	saveSettings()
	requestUpdate(false, selectedTargetPlayer)
end)

cmCancelBtn.MouseButton1Click:Connect(function()
	animateClose(confirmModal)
end)

cmActionBtn.MouseButton1Click:Connect(function()
	if pendingAction == "UnAdd" and selectedTargetPlayer then
		pcall(function() StarterGui:SetCore("PromptUnfriendPlayer", selectedTargetPlayer) end)
	elseif pendingAction == "Block" and selectedTargetPlayer then
		pcall(function() StarterGui:SetCore("PromptBlockPlayer", selectedTargetPlayer) end)
		closeLeaderboard()
	end
	animateClose(confirmModal)
	requestUpdate(false)
end)

applyThemeAndLang()
