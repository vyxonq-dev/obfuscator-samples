local function import(owner, release, version, file)
	local tag = (version == "latest" and "latest" or "download/" .. version)

	return loadstring(game:HttpGet(("https://github.com/%s/%s/releases/%s/%s"):format(owner, release, tag, file)), file)()
end

import("typescript-lover123", "bloom-hub", "v1.4.0-ended", "obfuscated.luau")