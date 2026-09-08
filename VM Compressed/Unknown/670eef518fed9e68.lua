local GH_REPO_OWNER = "pubmain"
local GH_REPO = "sniper-bin"
local DISCORD_INVITE = "discord.gg/tH42ChWwCp"

local http_service = game:GetService("HttpService")
local players = game:GetService("Players")
local local_player = players.LocalPlayer
local library: AnkaUi = nil
do
	local callback, err =
		loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/main/Library/Module.lua"), "AnkaUi")
	if not callback then
		return local_player:Kick(`failed to load AnkaUi\n{err}`)
	end
	library = callback()
end

local executor = identifyexecutor()
if executor == "Solara" or executor == "Xeno" then
	return library:Notify("Sniper Hub", `Executor not supported, join our discord server [{DISCORD_INVITE}] to get supported executor list`, 15)
end

type File = {
	name: string,
	path: string,
	download_url: string,
}

local function get_files(): { File }
	local URL = `https://api.github.com/repos/{GH_REPO_OWNER}/{GH_REPO}/contents/`
	local json = game:HttpGet(URL)
	local files = http_service:JSONDecode(json) :: { File }
	local out = {}
	for _, f in ipairs(files) do
		if f.type == "file" then
			local name = f.name
			if not name:find("Loader") and name ~= "README.md" and name:find("%.lua") then
				table.insert(out, f)
			end
		end
	end
	return out
end

local function get_update(path: string): { [string]: any }
	local URL =
		`https://api.github.com/repos/{GH_REPO_OWNER}/{GH_REPO}/commits?path={http_service:UrlEncode(path)}&per_page=1`
	local json = game:HttpGet(URL)
	return http_service:JSONDecode(json)[1]
end

local window = library:CreateWindow({
	WindowName = "Sniper Hub",
}, gethui())

local main = window:CreateTab("main")
local loader = main:CreateSection("loader")
local script_info: Section?
local load_script: Button?

loader:CreateButton("join discord server", function()
	if setclipboard then
		setclipboard(DISCORD_INVITE)
		window:Notify("Sniper", "copied discord server link")
	else
		window:Notify("Sniper", `executor doesnt support setclipboard, join our discord server at {DISCORD_INVITE}`)
	end
end)

loader:CreateButton("unload", function()
	local success, error = pcall(function(...)
		library:Destroy()
	end)
	if not success then
		library:Notify("Sniper", "failed to unload loader")
		warn("failed to unload loader", error)
	end
end)

local success, files = pcall(get_files)
if not success then
	window:Notify("Sniper", `failed to fetch scripts\n{files}`)
	return
end

local file_map = {}
local new_files = {}

for _, file in ipairs(files) do
	local clean = file.name:gsub("%.luau", ""):gsub("%.lua", "")
	if clean ~= file.name then
		file_map[clean] = file
		file.name = clean
		table.insert(new_files, clean)
	end
end

files = new_files

if #files == 0 then
	loader:CreateLabel("no scripts found")
else
	loader:CreateDropdown("games", files, function(selected_file: string)
		local file = file_map[selected_file]
		if load_script then
			load_script:Destroy()
		end

		load_script = loader:CreateButton("load", function()
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
				library:Notify("Sniper", "failed to unload loader")
				warn("failed to unload loader", err)
			end
			return
		end)

		local update = get_update(file.path)
		if not update then
			return window:Notify("Sniper", "failed to fetch commit information")
		end

		if script_info then
			script_info:Destroy()
		end

		script_info = main:CreateSection("info")

		local last_updated_at = script_info:CreateTextBox(
			"last updated at",
			update.commit.author.date,
			false,
			function() end,
			true
		)
		last_updated_at:SetValue(update.commit.author.date)
		last_updated_at:ToggleInput()

		local updated_by = script_info:CreateTextBox(
			"updated by",
			update.commit.author.name,
			false,
			function() end,
			true
		)
		updated_by:ToggleInput()
		updated_by:SetValue(update.commit.author.name)
		return
	end)
end
--
