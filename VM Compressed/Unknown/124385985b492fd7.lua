--[[

    Author: @iamvyxon
    Enchanted Hub maintainer: @iblameaabis | Discord: zziblameaabiszz

    NOTE: I do not maintain the Scripts, it is maintained by @iblameaabis.
    If you have any issues with the scripts, please contact him.
    This loader is for Enchanted Hub scripts only.
    If you want to use this loader for your own scripts, please Contact @iamvyxon on Discord.
      
-- ]]

local Loader = {}
Loader.__index = Loader

function Loader.new(cfg)
    local self = setmetatable({}, Loader)
    self.cfg = cfg
    local fluentOk, fluentLib = pcall(function()
        return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    end)
    if not fluentOk or not fluentLib then
        warn("[Script Loader] Failed to load Fluent UI library!")
        return self
    end
    self.libs = { Fluent = fluentLib }
    print("[Script Loader] Fluent UI loaded successfully.")
    self:_initUI()
    return self
end

function Loader:_initUI()
    if not self.libs.Fluent then
        warn("[Script Loader] Fluent UI not available, cannot create window.")
        return
    end
    local win = self.libs.Fluent:CreateWindow(self.cfg.Window)
    if not win then
        warn("[Script Loader] Failed to create Fluent window.")
        return
    end
    self.window = win
    self.tabs = {
        Scripts = win:AddTab({ Title = "Scripts", Icon = "list" }),
        Info = win:AddTab({ Title = "Info", Icon = "info" })
    }
    print("[Script Loader] Tabs created.")
    self:_addScriptButtons()
    self:_addInfo()
end

function Loader:_addScriptButtons()
    local scripts = self.cfg.Scripts
    for i = 1, #scripts do
        local script = scripts[i]
        self.tabs.Scripts:AddButton({
            Title = script.Name,
            Description = "Click to load " .. script.Name,
            Tooltip = script.Url,
            Callback = function()
                self:_loadScript(script.Url)
            end
        })
    end
end

function Loader:_loadScript(url)
    self.libs.Fluent:Notify({ Title = "Loading...", Content = url, Duration = 3 })
    if self.window and self.window.Destroy then
        self.window:Destroy()
    end
    if self.libs.Fluent and self.libs.Fluent.Unload then
        self.libs.Fluent:Unload()
    end
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not ok then
        warn("[Script Loader Error]", err)
    end
end

function Loader:_addInfo()
    self.tabs.Info:AddParagraph({
        Title = "About",
        Content = "Script Loader by @iamvyxon\nGitHub: https://github.com/iamvyxon\n\nSelect a script from the Scripts tab. Confirm before loading. Loader UI will close after loading."
    })
end

local Config = {
    Window = {
        Title        = "Enchanted Hub Loader",
        SubTitle     = "Loader by @iamvyxon | Scripts by @iblameaabis",
        TabWidth     = 160,
        Size         = UDim2.fromOffset(580, 460),
        Acrylic      = true,
        Theme        = "Dark",
        MinimizeKey  = Enum.KeyCode.LeftControl
    },
    Scripts = {
        {
            Name    = "Anti AFK",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Anti-AFK"
        },
        {
            Name    = "Muscle Legends",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Muscle%20Legends"
        },
        {
            Name    = "Muscle Legends (PC version)",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Muscle%20Legends%20(PC)"
        },
        {
            Name    = "Muscle Legends (Server Hop Kill)",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/ML%20Killing%20%5BServer%20Hop%5D"
        },
        {
            Name    = "Legends of Speed",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Legends%20Of%20Speed"
        },
        {
            Name    = "Ninja Legends",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Ninja%20Legends"
        },
        {
            Name    = "Grow a Garden",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Grow%20A%20Garden"
        },
        {
            Name    = "Steal A Brainrot (CRACKED)",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Steal%20A%20Brainrot"
        },
        {
            Name    = "Escape Tsunami For Brainrots",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Escape%20Tsunami%20For%20Brainrot"
        },
        {
            Name    = "Rivals",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Rivals"
        },
        {
            Name    = "TP To Players",
            Url     = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/TP%20Players"
        },
    },
}

Loader.new(Config)
