-- AdvancedConverter.lua
local AdvancedConverter = {}
local HTMLParser = loadstring(game:HttpGet("https://raw.githubusercontent.com/NolanTheScripter/Main/main/HTMLParser.lua"))()
local CSSParser = loadstring(game:HttpGet("https://raw.githubusercontent.com/NolanTheScripter/Main/main/CSSParser.lua"))()
local JSParser = loadstring(game:HttpGet("https://raw.githubusercontent.com/NolanTheScripter/Main/main/JSParser.lua"))()
local UISystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/NolanTheScripter/Main/main/UISystem.lua"))()

function AdvancedConverter.convert(html, css, js, options)
    options = options or {
        optimizeLayouts = true,
        generateComments = true,
        parentName = game:GetService("CoreGui") or "script.Parent"
    }
    
    -- Parse all components with enhanced features
    local document = HTMLParser.parse(html)
    local stylesheet = CSSParser.parse(css)
    local javascript = JSParser.parse(js)
    
    -- Apply CSS with specificity rules
    HTMLParser.applyStyles(document, stylesheet)
    
    -- Analyze and optimize UI layout system
    if options.optimizeLayouts then
        UISystem.analyzeLayouts(document)
    end
    
    -- Generate Lua code with all features
    local luaCode = HTMLParser.generateLua(document, options.parentName, options)
    
    -- Add JavaScript functionality with full ES6+ support
    luaCode = luaCode .. JSParser.generateLua(javascript, document, options)
    
    return luaCode
end

return AdvancedConverter