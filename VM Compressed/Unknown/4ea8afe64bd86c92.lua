-- ==============================================================================
-- 🌸 DUELING GROUNDS - SAKURA UI KEY SYSTEM (JNKIE POWERED)
-- Target: Jnkie Dashboard -> Edit Script -> Checkpoints -> UI-Source
-- Docs: https://github.com/sarahsophiesee-bot/SakuraUI/blob/main/README.md
-- ==============================================================================

getgenv().SCRIPT_KEY = nil
getgenv().UI_CLOSED = false

local Sakura = loadstring(game:HttpGet("https://cdn.jnkie.com/SakuraUI.lua"))()

Sakura.Appearance = {
    Title = "Sakura",
    Subtitle = "Enter your key to bloom",
    Tagline = "where petals fall, magic follows",
    Icon = "rbxassetid://116255434488074",
    IconSize = UDim2.fromOffset(30, 30),
}

-- 🚫 เอา Discord link ออก
Sakura.Links = {
    GetKey = "",
    Discord = "",
}

Sakura.Storage = {
    FileName = "dg_key_session",
    Remember = true,
    AutoLoad = true,
}

-- 🚫 เอา Shop (Get Premium / Buy) ออก
Sakura.Shop = {
    Enabled = false,
}

Sakura.Callbacks = Sakura.Callbacks or {}

Sakura.Callbacks.OnSuccess = function(key)
    local resolvedKey = key or getgenv().SCRIPT_KEY
    if resolvedKey and resolvedKey ~= "" then
        getgenv().SCRIPT_KEY = resolvedKey
        pcall(function()
            if type(writefile) == "function" then
                local HttpService = game:GetService("HttpService")
                writefile("dg_key_session.json", HttpService:JSONEncode({
                    key = resolvedKey,
                    verified_at = os.time()
                }))
            end
        end)
    end
    getgenv().UI_CLOSED = true
end

Sakura.Callbacks.OnClose = function()
    getgenv().UI_CLOSED = true
end

Sakura.Callbacks.OnFail = function(message)
    warn("[SakuraUI] Key rejected:", message)
end

Sakura:LaunchJunkie({
    Service = "Dueling Grounds",
    Identifier = "1060030",
    Provider = "Work.ink"
})

-- รอจนกว่าจะตรวจ Key เสร็จสิ้น (สำหรับ Jnkie Loader และ All-In-One Runner)
while not getgenv().UI_CLOSED do
    task.wait(0.1)
end

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/bd4baeecb6a85a59b25f5a372bab2bb11ea4c776e8115bef7440c5612cebd4b1?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end