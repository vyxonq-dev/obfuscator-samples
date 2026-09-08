-- https://github.com/Cobruhehe/expert-octo-doodle

local Arqel = loadstring(game:HttpGet("https://cdn.jnkie.com/arquelui.lua"))()

Arqel.Appearance.Title = "ProBest"
Arqel.Appearance.Icon = ""
Arqel.Links.Discord = "Discord.gg/ddQuGjrgX7"
Arqel.Storage.FileName = "Jnkie_key"
-- Arqel.Options.KeylessUi = "true"

Arqel.Theme.Accent = Color3.fromRGB(110, 60, 255)
Arqel.Theme.AccentHover = Color3.fromRGB(130, 90, 255)
Arqel.Theme.Background = Color3.fromRGB(10, 10, 20)
Arqel.Theme.Header = Color3.fromRGB(15, 15, 30)
Arqel.Theme.Input = Color3.fromRGB(20, 20, 40)
Arqel.Theme.Text = Color3.fromRGB(255, 255, 255)
Arqel.Theme.TextDim = Color3.fromRGB(160, 160, 200)
Arqel.Theme.Success = Color3.fromRGB(0, 220, 180)
Arqel.Theme.Error = Color3.fromRGB(255, 70, 90)
Arqel.Theme.StatusIdle = Color3.fromRGB(120, 100, 200)


Arqel.Shop = {
    Enabled = true,
    Icon = "",
    Title = "Get Premium",
    Subtitle = "Instant delivery • 24/7 support",
    ButtonText = "Buy",
    Link = "https://probest.mysellauth.com/"
}


Arqel:LaunchJunkie({
    Service = "All-Access",
    Identifier = "1185061",
    Provider = "Cheating During Tests"
})

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/cd05acfa38e7b269cdf4a5b5d5bec986ac18796673162c5a65bca07cfc5bc7f1?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end