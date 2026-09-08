--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║          TopbarPlus v3.4.0  —  Executor Port                ║
    ║          Multi-file version • Full API mirror               ║
    ╠══════════════════════════════════════════════════════════════╣
    ║  USAGE                                                       ║
    ║  1. Host all files in this zip on GitHub Raw (or similar)   ║
    ║  2. Set BASE_URL below to point at your hosting root         ║
    ║  3. Run this script in your executor:                        ║
    ║       local Icon = loadstring(game:HttpGet(BASE_URL ..       ║
    ║           "init.lua"))()                                     ║
    ║                                                             ║
    ║  Then use Icon exactly like the Studio version:             ║
    ║       local btn = Icon.new()                                ║
    ║       btn:setLabel("Shop"):setImage("rbxassetid://...")     ║
    ╚══════════════════════════════════════════════════════════════╝
--]]

-- ── CONFIG — set this to your raw hosting URL root ─────────────────────
local BASE_URL = "https://raw.githubusercontent.com/Therealtobu/Topbar-Plus-For-Executor/main/"
-- BASE_URL must end with "/"
-- ───────────────────────────────────────────────────────────────────────

local _M = {}   -- Module registry (replaces require(script.X) hierarchy)

-- Loads a module file from BASE_URL, calls it with _M, returns the result
local function load(path)
    local ok, result = pcall(function()
        local fn = loadstring(game:HttpGet(BASE_URL .. path))
        assert(fn, "Failed to compile: " .. path)
        return fn()(_M)
    end)
    if not ok then
        error("[TopbarPlus] Failed to load module '" .. path .. "': " .. tostring(result), 2)
    end
    return result
end

-- ── Load order: dependencies first ─────────────────────────────────────

-- Core packages (no inter-dependencies)
_M.Signal        = load("Packages/GoodSignal.lua")
_M.Janitor       = load("Packages/Janitor.lua")
_M.VERSION       = load("VERSION.lua")

-- Reference system (uses ReplicatedStorage)
_M.Reference     = load("Reference.lua")

-- Utility (depends on Janitor)
_M.Utility       = load("Utility.lua")

-- Themes (Default/Classic are plain data tables; init depends on Utility + Default)
_M.ThemesDefault = load("Features/Theme/Default.lua")
_M.ThemesClassic = load("Features/Theme/Classic.lua")
_M.Themes        = load("Features/Theme/init.lua")

-- Elements with no cross-element deps
_M.Selection     = load("Elements/Selection.lua")

-- Features (Gamepad depends on Selection lazily; Overflow depends on Utility)
_M.Gamepad       = load("Features/Gamepad.lua")
_M.Overflow      = load("Features/Overflow.lua")

-- Elements (Container depends on Signal + ThemesClassic lazily)
_M.Container     = load("Elements/Container.lua")

-- Elements that depend on Menu or each other lazily
_M.Menu          = load("Elements/Menu.lua")
_M.Widget        = load("Elements/Widget.lua")   -- lazy: Menu, Gamepad, Utility
_M.Notice        = load("Elements/Notice.lua")   -- lazy: Janitor, Signal, Utility
_M.Caption       = load("Elements/Caption.lua")  -- lazy: Icon
_M.Dropdown      = load("Elements/Dropdown.lua") -- top-level: Themes; lazy: Icon
_M.Indicator     = load("Elements/Indicator.lua")

-- Attribute printer (deferred; called from Icon.lua setup via _M._runAttribute)
_M._runAttribute = function(Icon)
    load("Attribute.lua")  -- prints version banner
end

-- ── Main Icon class ─────────────────────────────────────────────────────
_M.Icon = load("Icon.lua")

-- ── Return the Icon class (same as require(TopbarPlus) in Studio) ───────
return _M.Icon
