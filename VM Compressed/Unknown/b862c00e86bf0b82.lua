--[[
      This File has been automatically renamed by @vyxonq for better readability.
      (Always verify before using)
]]

local GH_REPO_OWNER = "pubmain"
local GH_REPO = "sniper-bin"
local DISCORD_INVITE = "discord.gg/tH42ChWwCp"

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ankaUi: AnkaUi = nil
do
	local callback, err =
		loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/main/Library/Module.lua"), "AnkaUi")
	if not callback then
		return LocalPlayer:Kick(`failed to load AnkaUi\n{err}`)
	end
	ankaUi = callback()
end

local executor = identifyexecutor()
if executor == "Solara" or executor == "Xeno" then
	return ankaUi:Notify("Sniper Hub", `Executor not supported, join our discord server [{DISCORD_INVITE}] to get supported executor list`, 15)
end

type File = {
	name: string,
	path: string,
	download_url: string,
}

local function getFiles(): { File }
	local URL = `https://api.github.com/repos/{GH_REPO_OWNER}/{GH_REPO}/contents/`
	local json = game:HttpGet(URL)
	local files = HttpService:JSONDecode(json) :: { File }
	local outputFiles = {}
	for _, file in ipairs(files) do
		if file.type == "file" then
			local fileName = file.name
			if not fileName:find("Loader") and fileName ~= "README.md" and fileName:find("%.lua") then
				table.insert(outputFiles, file)
			end
		end
	end
	return outputFiles
end

local function getUpdate(filePath: string): { [string]: any }
	local URL =
		`https://api.github.com/repos/{GH_REPO_OWNER}/{GH_REPO}/commits?path={HttpService:UrlEncode(filePath)}&per_page=1`
	local json = game:HttpGet(URL)
	return HttpService:JSONDecode(json)[1]
end

local window = ankaUi:CreateWindow({
	WindowName = "Sniper Hub",
}, gethui())

local mainTab = window:CreateTab("main")
local loaderSection = mainTab:CreateSection("loader")
local scriptInfoSection: Section?
local loadScriptButton: Button?

loaderSection:CreateButton("join discord server", function()
	if setclipboard then
		setclipboard(DISCORD_INVITE)
		window:Notify("Sniper", "copied discord server link")
	else
		window:Notify("Sniper", `executor doesnt support setclipboard, join our discord server at {DISCORD_INVITE}`)
	end
end)

loaderSection:CreateButton("unload", function()
	local success, error = pcall(function(...)
		ankaUi:Destroy()
	end)
	if not success then
		ankaUi:Notify("Sniper", "failed to unload loader")
		warn("failed to unload loader", error)
	end
end)

local success, files = pcall(getFiles)
if not success then
	window:Notify("Sniper", `failed to fetch scripts\n{files}`)
	return
end

local fileMap = {}
local cleanedFileNames = {}

for _, file in ipairs(files) do
	local cleanName = file.name:gsub("%.luau", ""):gsub("%.lua", "")
	if cleanName ~= file.name then
		fileMap[cleanName] = file
		file.name = cleanName
		table.insert(cleanedFileNames, cleanName)
	end
end

files = cleanedFileNames

if #files == 0 then
	loaderSection:CreateLabel("no scripts found")
else
	loaderSection:CreateDropdown("games", files, function(selectedFileName: string)
		local file = fileMap[selectedFileName]
		if loadScriptButton then
			loadScriptButton:Destroy()
		end

		loadScriptButton = loaderSection:CreateButton("load", function()
			window:Notify("Sniper", `loading {file.name}`)
			local success, data = pcall(function()
				return game:HttpGet(file.download_url)
			end)
			if not success then
				return window:Notify("Sniper", `failed to get file\n{data}`)
			end

			local callback, err = loadstring(data, `Sniper`)
			if not callback then
				return window:Notify("Sniper", `failed to load script\n{err}`)
			end

			success, err = pcall(callback)
			if not success then
				return window:Notify("Sniper", `failed to run script\n{err}`)
			end

			window:Notify("Sniper", `succesfully loaded {file.name}`)
			window:Toggle(false)
			task.wait(5)

			success, err = pcall(function(...)
				window:Destroy()
			end)
			if not success then
				ankaUi:Notify("Sniper", "failed to unload loader")
				warn("failed to unload loader", err)
			end
			return
		end)

		local update = getUpdate(file.path)
		if not update then
			return window:Notify("Sniper", "failed to fetch commit information")
		end

		if scriptInfoSection then
			scriptInfoSection:Destroy()
		end

		scriptInfoSection = mainTab:CreateSection("info")

		local lastUpdatedAtTextBox = scriptInfoSection:CreateTextBox(
			"last updated at",
			update.commit.author.date,
			false,
			function() end,
			true
		)
		lastUpdatedAtTextBox:SetValue(update.commit.author.date)
		lastUpdatedAtTextBox:ToggleInput()

		local updatedByTextBox = scriptInfoSection:CreateTextBox(
			"updated by",
			update.commit.author.name,
			false,
			function() end,
			true
		)
		updatedByTextBox:ToggleInput()
		updatedByTextBox:SetValue(update.commit.author.name)
		return
	end)
end