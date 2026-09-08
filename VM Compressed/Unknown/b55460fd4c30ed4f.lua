local GH_REPO_OWNER = `pubmain`
local GH_REPO = `sniper-bin`
local DISCORD_INVITE = `discord.gg/tH42ChWwCp`
local SCRIPT_TIMEOUT = 5

local user_input_service = game:GetService(`UserInputService`)
local http_service = game:GetService(`HttpService`)
local players = game:GetService(`Players`)
local local_player = players.LocalPlayer
local library: AnkaUi = nil

do
	local callback, err =
		loadstring(game:HttpGet(`https://raw.githubusercontent.com/nfpw/XXSCRIPT/main/Library/Module.lua`), `=Anka`)
	if not callback then
		return local_player:Kick(`failed to load AnkaUi\n{err}`)
	end
	library = callback()
end

local executor_name = identifyexecutor()
if executor_name == `Solara` or executor_name == `Xeno` then
	library:Notify(`Sniper Hub`, `{executor_name} is not supported`)
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
		if f.type == `file` then
			local name = f.name
			if not name:find(`Loader`) and name ~= `README.md` and name:find(`%.lua`) then
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
	Color = Color3.fromRGB(128, 128, 128),
	Keybind = Enum.KeyCode.End,
	WindowName = `Sniper Hub | Loader`,
}, gethui())

local main = window:CreateTab(`Sniper Hub`)
local loader = main:CreateSection(`Loader`)
local script_info: Section?
local load_script: Button?

loader:CreateLabel(`Join Sniper Hub Discord Server!`)
loader:CreateButton(DISCORD_INVITE, function()
	setclipboard(DISCORD_INVITE)
	library:Notify(`Sniper Hub`, `Copied discord invite link`)
end)

loader:CreateButton(`Exit Loader`, function()
	local success, error = pcall(function(...)
		window:Destroy()
	end)
	if not success then
		library:Notify(`Sniper Hub`, `Failed to unload loader. {error}`)
	end
end)

local success, files = pcall(get_files)
if not success then
	loader:CreateLabel(`Failed to fetch scripts`)
	return
end

local file_map = {}
local new_files = {}

for _, file in ipairs(files) do
	local clean = file.name:gsub(`%.luau`, ``):gsub(`%.lua`, ``)
	if clean ~= file.name then
		file_map[clean] = file
		file.name = clean
		table.insert(new_files, clean)
	end
end

files = new_files

if #files == 0 then
	loader:CreateLabel(`No scripts found`)
else
	loader:CreateDropdown(`Scripts`, files, function(selected_file: string)
		local file = file_map[selected_file]
		if load_script then
			load_script:Destroy()
		end

		load_script = loader:CreateButton(`Load Script`, function()
			library:Notify(`Sniper Hub`, `Loading {file.name}`)
			local success, data = pcall(function()
				return game:HttpGet(file.download_url)
			end)
			if not success then
				return library:Notify(`Sniper Hub`, `Failed to download script. {data}`)
			end

			local ib_obfuscated = data:find(`ironbrew1`) ~= nil

			local callback, err = loadstring(data, `=Sniper`)
			if not callback then
				return library:Notify(`Sniper Hub`, `Failed to load script. {err}`)
			end

			-- bit lib fix
			if ib_obfuscated then
				if user_input_service:GetPlatform() == Enum.Platform.OSX then
					local fenv = getfenv(callback)
					fenv.bit = nil
					fenv.bit32 = nil
				end
			end

			local timeout_thread = task.delay(SCRIPT_TIMEOUT, function()
				library:Notify(
					`Sniper Hub`,
					`Failed to load script after {SCRIPT_TIMEOUT} seconds.\nAre you in the right place?`
				)
			end)

			success, err = pcall(callback)
			if not success then
				return library:Notify(`Sniper Hub`, `Failed to execute script. {err}`)
			end
			pcall(task.cancel, timeout_thread)

			library:Notify(`Sniper Hub`, `Succesfully loaded {file.name}`)
			window:Toggle(false)
			task.wait(5)

			success, err = pcall(function(...)
				window:Destroy()
			end)
			if not success then
				library:Notify(`Sniper Hub`, `Failed to unload loader`)
			end
			return
		end)

		local update = get_update(file.path)
		if not update then
			return library:Notify(`Sniper Hub`, `Failed to fetch script info`)
		end

		if script_info then
			script_info:Destroy()
		end

		script_info = main:CreateSection(`Script info`)
		-- lsp tuff!
		if not script_info then
			return
		end

		local last_updated_at = script_info:CreateTextBox(
			`Updated at`,
			update.commit.author.date,
			false,
			function() end,
			true
		)
		last_updated_at:SetValue(update.commit.author.date)
		last_updated_at:ToggleInput()

		local updated_by = script_info:CreateTextBox(
			`Updated by`,
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
