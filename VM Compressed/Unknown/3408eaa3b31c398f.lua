--[[
A script for agspureiam's game Kohls Admin House. Also supported for Tech's KAH X (sort of).
Created by ScriptingProgrammer (Roblox) / ts2021 (Discord) / S-PScripts (GitHub)
View the source here: https://kohlslite.pages.dev/source.lua
]]

-- Prefix
getgenv().theprefix = "."

-- Autorun commands
getgenv().autoruncmds = {".cmdbar", ".tnok", ".antikill me"} --".antimsg me"

-- Run these commands when the user joins
getgenv().run_on_sight = {
		["ScriptingProgrammer"] = {".lua print('da owner joined so coolz')"}
}

-- KL Starter GUI
getgenv().kohlsgui = false -- Simple GUI with instructions telling you how to use the script.

-- Loadstring
loadstring(game:HttpGet("https://kohlslite.pages.dev/source.lua"))()

-- More settings can be found in the script's source itself.