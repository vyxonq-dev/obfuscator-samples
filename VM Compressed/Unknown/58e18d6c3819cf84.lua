local function findfunc(scriptname, scriptClass, Option, cb)
if cb == true then
if scriptClass == "LocalScript" then
for i,v in pairs(getinstances()) do
if v:IsA("LocalScript") then
if v.Name == scriptname then
local senv = getsenv(v)
if Option == "Address" then
for i,v in next, senv do
if type(v) == "function" then
setclipboard(v)
end
end
end
if Option == "Hash" then
for i,v in next, senv do
if type(v) == "function" then
local n = getfunctionhash(v)
setclipboard(n)
end
end
end
if Option == "Name" then
for i,v in next, senv do
if type(v) == "function" then
local n = debug.info(v, "n")
setclipboard(n)
end
end
end
end
end
end
end
end

if scriptClass == "ModuleScript" then
for i,v in pairs(getinstances()) do
if v:IsA("ModuleScript") then
if v.Name == scriptname then
local req = require(v)
if Option == "Address" then
for i,v in next, req do
if type(v) == "function" then
print(v)
end
end
end
if Option == "Hash" then
for i,v in next, req do
if type(v) == "function" then
local n = getfunctionhash(v)
print(n)
end
end
end
if Option == "Name" then
for i,v in next, req do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
end
end
end
end
end

if cb == false then
if scriptClass == "LocalScript" then
for i,v in pairs(getinstances()) do
if v:IsA("LocalScript") then
if v.Name == scriptname then
local senv = getsenv(v)
if Option == "Address" then
for i,v in next, senv do
if type(v) == "function" then
print(v)
end
end
end
if Option == "Hash" then
for i,v in next, senv do
if type(v) == "function" then
local n = getfunctionhash(v)
print(n)
end
end
end
if Option == "Name" then
for i,v in next, senv do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
end
end
end
end
end
if scriptClass == "ModuleScript" then
for i,v in pairs(getinstances()) do
if v:IsA("ModuleScript") then
if v.Name == scriptname then
local req = require(v)
if Option == "Address" then
for i,v in next, req do
if type(v) == "function" then
print(v)
end
end
end
if Option == "Hash" then
for i,v in next, req do
if type(v) == "function" then
local n = getfunctionhash(v)
print(n)
end
end
end
if Option == "Name" then
for i,v in next, req do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
end
end
end
end
end
end
end
--DONT TOUCH ABOVE
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()

 -- register the library so ThemeManager can manipulate controls
ThemeManager:SetLibrary(Library)
 
-- optional: keep themes inside a custom folder
ThemeManager:SetFolder("DebugConfig")

local Labels = Library.Labels
local Buttons = Library.Buttons
local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "Debugger",
    Footer = "Version: 1",
    Icon = 0,
    NotifySide = "Right",
})
local Tab0 = Window:AddTab("Function Debug")
local Tab1 = Window:AddTab("Coming Soon")

local LeftGroupBox = Tab0:AddLeftGroupbox("Functions Left Group")
local RightGroupBox = Tab0:AddRightGroupbox("Functions Right Group")

LeftGroupBox:AddInput("Input0", {
	Default = "",
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = false, -- true / false, if false the text will not clear when textbox focused
 
	Text = "Available Options: Hash, Name and address",
	Tooltip = "Press Print All Function Name Slow (Recommended) For Spectating/Viewing every function or print the hash or set it to clipboard by doing it on modulescript or local script or use cobalt for getting the address of function on a remote", -- Information shown when you hover over the textbox
 
	Placeholder = "Function Type", -- placeholder text when the box is empty
	-- MaxLength is also an option which is the max length of the text
})
LeftGroupBox:AddInput("Input1", {
	Default = "",
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = false, -- true / false, if false the text will not clear when textbox focused
 
	Text = "Put Function Arguments",
	Tooltip = "Put Function Arguments If The Function Has Arguments i Recommend using cobalt spy", -- Information shown when you hover over the textbox
 
	Placeholder = "Function Arguments", -- placeholder text when the box is empty
	-- MaxLength is also an option which is the max length of the text
})
LeftGroupBox:AddInput("Input2", {
	Default = "",
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = false, -- true / false, if false the text will not clear when textbox focused
 
	Text = "Name Of Script",
	Tooltip = "Put Script Name Using Dex Explorer (Recommended)", -- Information shown when you hover over the textbox
 
	Placeholder = "Script Name", -- placeholder text when the box is empty
	-- MaxLength is also an option which is the max length of the text
})
LeftGroupBox:AddInput("Input3", {
	Default = "",
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = false, -- true / false, if false the text will not clear when textbox focused
 
	Text = "Available Options: LocalScript And ModuleScript",
	Tooltip = "Put Class Name Needed For Script ClassName Check ClassName in dex explorer or put it in the available options", -- Information shown when you hover over the textbox
 
	Placeholder = "Script Class", -- placeholder text when the box is empty
	-- MaxLength is also an option which is the max length of the text
})
LeftGroupBox:AddInput("Input4", {
	Default = "",
	Numeric = false, -- true / false, only allows numbers
	Finished = false, -- true / false, only calls callback when you press enter
	ClearTextOnFocus = false, -- true / false, if false the text will not clear when textbox focused
 
	Text = "Available Options: Hash, Name and Address",
	Tooltip = "Put Function Type Useful for Printing or setting it to the clipboard", -- Information shown when you hover over the textbox
 
	Placeholder = "Function Type", -- placeholder text when the box is empty
	-- MaxLength is also an option which is the max length of the text
})
local CBToggle = LeftGroupBox:AddToggle("CBToggle", {
    Text = "Enable Clipboard Option",
    Default = false,
})
local lclosureToggle = LeftGroupBox:AddToggle("lclosureToggle", {
    Text = "Enable lclosure Method",
    Default = false,
})
local cclosureToggle = LeftGroupBox:AddToggle("cclosureToggle", {
    Text = "Enable cclosure Method",
    Default = false,
})
LeftGroupBox:AddButton({
    Text = "Print All Function Name (Slow)",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
wait(0.2)
end
end
    end
})
LeftGroupBox:AddButton({
    Text = "Print All Function Name (Fast)",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
    end
})
LeftGroupBox:AddButton({
    Text = "Print Function Type",
    Func = function()
findfunc(tostring(Options.Input2.Value), tostring(Options.Input3.Value), tostring(Options.Input4.Value), Toggles.CBToggle.Value)
    end
})

RightGroupBox:AddButton({
    Text = "Hook Function To Nil",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == Options.Input0.Value or hash == Options.Input0.Value or v == Options.Input0.Value then
if islclosure(v) == Toggles.lclosureToggle.Value or iscclosure(v) == Toggles.cclosureToggle.Value then
hookfunction(v, function()
return nil
end)
end
end
end
end
    end
})
RightGroupBox:AddButton({
    Text = "Hook Function To True (Sometimes No Cooldown)",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == Options.Input0.Value or hash == Options.Input0.Value or v == Options.Input0.Value then
if islclosure(v) == Toggles.lclosureToggle.Value or iscclosure(v) == Toggles.cclosureToggle.Value then
hookfunction(v, function()
return true
end)
end
end
end
end
    end
})
RightGroupBox:AddButton({
    Text = "Restore Function",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == Options.Input0.Value or hash == Options.Input0.Value or v == Options.Input0.Value then
if islclosure(v) == Toggles.lclosureToggle.Value or iscclosure(v) == Toggles.cclosureToggle.Value then
restorefunction(v)
end
end
end
end
    end
})

RightGroupBox:AddButton({
    Text = "Get Constant From Function",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == Options.Input0.Value or hash == Options.Input0.Value or v == Options.Input0.Value then
local con = debug.getconstants(v, "n")
print(unpack(con))
end
end
end
    end
})

RightGroupBox:AddButton({
    Text = "Call Function (Might Crash)",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == Options.Input0.Value or hash == Options.Input0.Value or v == Options.Input0.Value then
if islclosure(v) == Toggles.lclosureToggle.Value or iscclosure(v) == Toggles.cclosureToggle.Value then
v()
end
end
end
end
    end
})
RightGroupBox:AddButton({
    Text = "Call Function With Arguments (Might Crash)",
    Func = function()
for i,v in next, getgc(true) do
if type(v) == "function" then
local n = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == Options.Input0.Value or hash == Options.Input0.Value or v == Options.Input0.Value then
if islclosure(v) == Toggles.lclosureToggle.Value or iscclosure(v) == Toggles.cclosureToggle.Value then
v(Options.Input1.Value)
end
end
end
end
    end
})
