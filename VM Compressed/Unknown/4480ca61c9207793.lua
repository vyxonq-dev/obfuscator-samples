local Arqel = loadstring(game:HttpGet("https://pastefy.app/7AYq3CNO/raw"))()

Arqel.Appearance.Title = "4479 Hub"
Arqel.Appearance.Icon = "rbxassetid://73871256228019"
Arqel.Links.Discord = "discord.gg/4479"
Arqel.Storage.FileName = "4479_key"
-- Arqel.Options.KeylessUi = "true"

Arqel.Theme.Accent = Color3.fromRGB(200, 80, 220)
Arqel.Theme.AccentHover = Color3.fromRGB(230, 110, 240)
Arqel.Theme.Background = Color3.fromRGB(20, 10, 25)
Arqel.Theme.Header = Color3.fromRGB(30, 15, 40)
Arqel.Theme.Input = Color3.fromRGB(40, 20, 50)
Arqel.Theme.Text = Color3.fromRGB(255, 240, 250)
Arqel.Theme.TextDim = Color3.fromRGB(200, 160, 210)
Arqel.Theme.Success = Color3.fromRGB(255, 130, 200)
Arqel.Theme.Error = Color3.fromRGB(255, 70, 130)
Arqel.Theme.StatusIdle = Color3.fromRGB(180, 120, 220)

Arqel.Shop = {
    Enabled = false,
    Icon = "rbxassetid://73871256228019",
    Title = "Skip Key System",
    Subtitle = "Buy a lifetime key to skip the key system!",
    ButtonText = "Buy",
    Link = "https://4479exe.sellhub.cx/product/4479"
}

Arqel:LaunchJunkie({
    Service = "4479 Hub Key",
    Identifier = "11712",
    Provider = "4479 Key"
})

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/61f9e4e53e0d639db1122d02cc47aec30905c362808b723ee3bddbaad6721c9c?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end