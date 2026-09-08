--!strict
-- set shared.Branch = "branchname" for testing

-- Constants
local OnlyGetPlaceName: boolean? = ...
local PlaceInfo: {[string]: any} = {PlaceName = "Game", PlaceFileName = "Game"}
local GoldIcon = "rbxassetid://94208399417035"

-- Services
local AssetService = game:GetService("AssetService")
local MarketplaceService = game:GetService("MarketplaceService")
local GuiService = game:GetService("GuiService")

-- Executor Functions
local setthreadidentity = getfenv().setthreadidentity
local setclipboard = getfenv().setclipboard

-- Variables
local NotificationMessage

-- Script Compatibility
pcall(setthreadidentity, 8) -- hopefully fix "Lacking capability 'Plugin'" error

-- GetPlaceName
do
	local GamePlaces = AssetService:GetGamePlacesAsync()

	local Function

	local PlaceName
	local PlaceFileName

	local function SetPlace(Name: string)
		PlaceName = Name

		PlaceFileName = PlaceName:gsub("%b[]", "")
		PlaceFileName = PlaceFileName:gsub("[^%a]", "")
	end

	while true do
		for _, PlaceInfo: {Name: string, PlaceId: number} in GamePlaces:GetCurrentPage() do
			SetPlace(PlaceInfo.Name)

			local function GetFromLink(Link: string): (() -> ()?, string?)
				local Success, Result, HttpResult = pcall(function()
					local HttpResult = game:HttpGet(Link)
					return loadstring(HttpResult) :: any, HttpResult :: any
				end)

				if Success then
					return Result, HttpResult
				else
					return nil
				end
			end

			if not Function then
				Function = GetFromLink(`https://github.com/alyssagithub/gold/raw/{shared.Branch or "main"}/Scripts/{PlaceFileName}.luau`)
			end

			if Function then
				break
			end
		end

		if GamePlaces.IsFinished or Function then
			break
		end

		GamePlaces:AdvanceToNextPageAsync()
	end

	if not Function then
		SetPlace(MarketplaceService:GetProductInfo(game.PlaceId).Name)
	end

	shared.PlaceInfo = {PlaceName = PlaceName, PlaceFileName = PlaceFileName, Function = Function}
	PlaceInfo = shared.PlaceInfo

	if OnlyGetPlaceName then
		return PlaceInfo :: any
	end
end

local Function = PlaceInfo.Function

if not Function then
	Function = loadstring(game:HttpGet(`https://github.com/alyssagithub/gold/raw/{shared.Branch or "main"}/Scripts/Universal.luau`))
	NotificationMessage = "game not found, loading universal script..."
end

if not Function then
	NotificationMessage = "failed to load, try again"
end

GuiService:SendNotification({
	Title = "goldâ¢ (discord.gg/sS3tDP6FSB)",
	Text = NotificationMessage or "game found, loading script...",
	Icon = GoldIcon,
})

local Success, Result = pcall(Function)

if Success then
	return
end

GuiService:SendNotification({
	Title = "goldâ¢ errored (notify an admin)",
	Text = Result,
	Icon = GoldIcon,
	Buttons = {
		{
			Text = "OK",
			ButtonType = Enum.NotificationButtonType.Secondary,
			OnActivated = function()end,
		},
		{
			Text = "Copy Error",
			ButtonType = Enum.NotificationButtonType.Primary,
			OnActivated = function()
				if not setclipboard then
					return
				end

				setclipboard(Result)
			end,
		},
	},
})

task.spawn(error, Result)
