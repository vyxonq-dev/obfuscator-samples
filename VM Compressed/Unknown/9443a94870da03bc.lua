if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().__ASCEND_LOADED then
    return
end
getgenv().__ASCEND_LOADED = true

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local AscendUI = loadstring(game:HttpGet("https://cdn.jnkie.com/arquelui.lua"))()

local Appearance = AscendUI.Appearance
Appearance.Title = "Ascend"
Appearance.Icon = "rbxassetid://75580196742273"
local Links = AscendUI.Links
Links.Discord = "https://discord.gg/cMtbe5T3K4"

AscendUI.Options = {
    Keyless = nil,
    KeylessUI = false,
    Blur = false,
    Draggable = true
}

AscendUI.Shop = {
    Enabled = true,
    Icon = "rbxassetid://75580196742273",
    Title = "Get Lifetime-Key NOW!!",
    Subtitle = "Fast Delivery｜24/7 Support",
    ButtonText = "BUY",
    Link = "Buy From Discord! .gg/cMtbe5T3K4"
}

AscendUI.Storage = {
    AutoLoad = true,
    FileName = "AscendSilent_Key",
    Remember = true,
}

AscendUI.Theme = {
    Accent = Color3.fromRGB(180, 180, 180),
    AccentHover = Color3.fromRGB(210, 210, 210),
    Background = Color3.fromRGB(7, 7, 9),
    Header = Color3.fromRGB(12, 12, 14),
    Input = Color3.fromRGB(18, 18, 21),
    Text = Color3.fromRGB(235, 235, 235),
    TextDim = Color3.fromRGB(140, 140, 145),
    Success = Color3.fromRGB(90, 200, 160),
    Error = Color3.fromRGB(220, 80, 90),
    Warning = Color3.fromRGB(255, 170, 70),
    StatusIdle = Color3.fromRGB(120, 120, 125),
    Discord = Color3.fromRGB(88, 101, 242),
    DiscordHover = Color3.fromRGB(114, 137, 218),
    Divider = Color3.fromRGB(28, 28, 32),
    Pending = Color3.fromRGB(35, 35, 40)
}

AscendUI.Changelog = {
    {
        Version = "v1",
        Date = "Jan 28, 2026",
        Changes = { "Keyless Finished. Get Your Key..", "Also Keyless Every Friday Based on UTC", "Any Suggestions? Join Our Discord!" }
    }
}

AscendUI.Callbacks = AscendUI.Callbacks or {}
AscendUI.Callbacks.OnClose = function()
    getgenv().__ASCEND_LOADED = nil
end

PlayerGui.ChildRemoved:Connect(function(child)
    if child.Name == "Ascend" then
        getgenv().__ASCEND_LOADED = nil
    end
end)

AscendUI:LaunchJunkie({
    Provider = "ascend-silentaim",
    Service = "ascend-silentaim",
    Identifier = "12925",
})

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/f4eeead188757af2ecb448b170d639d5b0241b47f4e4c3104ccfc3c4e9463079?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end