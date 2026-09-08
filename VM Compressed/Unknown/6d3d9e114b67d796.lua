local BASE = "https://raw.githubusercontent.com/FEN-N3C/StructraHub/main/"

local function Load(file)
	return loadstring(game:HttpGet(BASE .. file))()
end

local Config = Load("config.lua")
local UI = Load("ui.lua")
local Aimbot = Load("aimbot.lua")

UI.Init(Config)
Aimbot.Start(Config, Fluent.Options)

print("Successfully loaded StructraHub (V1.1.0)!")
