if getgenv then
  local t = tick()
  if getgenv().vLnware_loaderT and (t - getgenv().vLnware_loaderT) < 6 then return end
  getgenv().vLnware_loaderT = t
end
local HttpService = game:GetService("HttpService")
local ORIGIN = "https://vilanxware.vilanoufc.workers.dev"
local INVITE = "https://discord.gg/s3wc8JPzc7"
local OPEN = false
local ADGATE = true
local HWIDFILE = "vilanxware/hwid.txt"
local function rawHwid()
  if type(gethwid) == "function" then local ok,r = pcall(gethwid); if ok and r then return tostring(r) end end
  local ok,r = pcall(function() return game:GetService("RbxAnalyticsService"):GetClientId() end)
  return ok and tostring(r) or "unknown"
end
local _hwid
local function hwid()
  if _hwid then return _hwid end
  if type(readfile)=="function" and type(isfile)=="function" then
    local ok,r = pcall(function() if isfile(HWIDFILE) then return readfile(HWIDFILE) end end)
    if ok and type(r)=="string" then r=r:gsub("%s+",""); if r~="" then _hwid=r; return _hwid end end
  end
  _hwid = rawHwid()
  if _hwid~="" and _hwid~="unknown" then
    pcall(function()
      if type(makefolder)=="function" and type(isfolder)=="function" and not isfolder("vilanxware") then makefolder("vilanxware") end
      if type(writefile)=="function" then writefile(HWIDFILE, _hwid) end
    end)
  end
  return _hwid
end
local function execName()
  if type(identifyexecutor) == "function" then local ok,n = pcall(identifyexecutor); if ok and n then return tostring(n) end end
  return "unknown"
end
local function fetchHub(k)
  local u = ORIGIN.."/script?key="..HttpService:UrlEncode(k).."&hwid="..HttpService:UrlEncode(hwid()).."&exec="..HttpService:UrlEncode(execName()).."&place="..tostring(game.PlaceId).."&gid="..tostring(game.GameId).."&cb="..tostring(tick())
  local ok,body = pcall(function() return game:HttpGet(u) end)
  if ok and type(body)=="string" and body~="" then return body end
  local req = (syn and syn.request) or (http and http.request) or http_request or request
  if req then local ok2,res = pcall(req,{Url=u,Method="GET"}); if ok2 and type(res)=="table" and type(res.Body)=="string" then return res.Body end end
  return nil
end
local function isHub(body) return type(body)=="string" and #body > 2000 end
local KEYFILE = "vilanxware/key.txt"
local function readKey()
  if type(readfile)=="function" and type(isfile)=="function" then
    local ok,r = pcall(function() if isfile(KEYFILE) then return readfile(KEYFILE) end end)
    if ok and type(r)=="string" and r~="" then return r end
  end
  return nil
end
local function saveKey(k)
  pcall(function()
    if type(makefolder)=="function" and type(isfolder)=="function" and not isfolder("vilanxware") then makefolder("vilanxware") end
    if type(writefile)=="function" then writefile(KEYFILE, k) end
  end)
end
local function clearKey() pcall(function() if type(delfile)=="function" and type(isfile)=="function" and isfile(KEYFILE) then delfile(KEYFILE) end end) end

local function cleanKey(s) return (tostring(s or ""):gsub("%s+",""):gsub("[\1-\31\127-\255]","")) end
local key = cleanKey((script_key or (getgenv and getgenv().script_key)) or readKey() or "")
if key ~= "" then
  if getgenv then getgenv().script_key = key end
  local body = fetchHub(key)
  if isHub(body) then saveKey(key); local fn=loadstring(body); if fn then fn() end; return
  elseif type(body)=="string" and #body>0 then pcall(function() local f=loadstring(body); if f then f() end end); clearKey() end
end

if OPEN then
  local body = fetchHub(key ~= "" and key or "open")
  if type(body)=="string" and body~="" then local fn=loadstring(body); if fn then fn() end end
  return
end

local okLib, Library = pcall(function() return loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))() end)
if not okLib or not Library then
  pcall(function() game:GetService("StarterGui"):SetCore("SendNotification",{Title="vilanxware",Text="No connection to the server. Check your internet and run the script again.",Duration=10}) end)
  return
end
local ACC = Color3.fromRGB(178,77,255)
pcall(function()
  local S = Library.Scheme
  S.AccentColor = ACC
  S.BackgroundColor = Color3.fromRGB(10,6,15)
  S.MainColor = Color3.fromRGB(21,13,30)
  S.OutlineColor = Color3.fromRGB(58,38,88)
  S.FontColor = Color3.fromRGB(240,234,248)
end)
local Window = Library:CreateWindow({ Title="vilanxware", Footer="vilanxware / key required â¢ L6", Font=Font.fromEnum(Enum.Font.GothamMedium), DisableSearch=true, CornerRadius=8, ShowCustomCursor=false, NotifySide="Right" })
local Tab = Window:AddTab("Key","key")
local Box = Tab:AddLeftGroupbox("License")
pcall(function()
  local roots={}
  if Library.ScreenGui then roots[#roots+1]=Library.ScreenGui end
  pcall(function() if gethui then roots[#roots+1]=gethui() end end)
  pcall(function() roots[#roots+1]=game:GetService("CoreGui") end)
  for _,r in ipairs(roots) do
    for _,d in ipairs(r:GetDescendants()) do
      if d:IsA("TextLabel") and tostring(d.Text)=="vilanxware" and d.TextSize==20 then
        local img=Instance.new("ImageLabel")
        img.BackgroundTransparency=1
        img.Image="rbxassetid://120940964471592"
        img.ScaleType=Enum.ScaleType.Fit
        img.Size=UDim2.fromOffset(52,44)
        img.LayoutOrder=-10
        img.Parent=d.Parent
        d.TextColor3=Color3.fromRGB(255,255,255)
        d.RichText=true
        d.Text=[[vilan<font color="#c47bff">x</font>ware]]
        d.TextSize=24
        d.AutomaticSize=Enum.AutomaticSize.X
      end
    end
  end
end)
pcall(function()
  local h = Box and Box.Holder
  if not h then return end
  for _,d in ipairs(h:GetChildren()) do
    if d:IsA("TextLabel") then
      d.FontFace=Font.fromEnum(Enum.Font.Oswald)
      d.Text=string.upper(d.Text)
      d.TextSize=17
      d.TextColor3=Color3.fromRGB(240,233,250)
      for _,p in ipairs(d:GetChildren()) do if p:IsA("UIPadding") then p.PaddingLeft=UDim.new(0,18) end end
      local t=Instance.new("Frame")
      t.AnchorPoint=Vector2.new(0,0.5)
      t.Position=UDim2.new(0,7,0,17)
      t.Size=UDim2.fromOffset(5,5)
      t.BackgroundColor3=ACC
      t.BorderSizePixel=0
      local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,1); c.Parent=t
      t.Parent=h
      break
    end
  end
end)
local done=false
local function submit(v)
  if done then return end
  v = cleanKey(v)
  if v == "" then Library:Notify({Title="vilanxware",Description="Enter a key.",Time=3}); return end
  local body = fetchHub(v)
  if isHub(body) then done=true; saveKey(v); if getgenv then getgenv().script_key = v end; pcall(function() Library:Unload() end); local fn=loadstring(body); if fn then fn() end
  elseif type(body)=="string" and #body>0 then pcall(function() local f=loadstring(body); if f then f() end end)
  else Library:Notify({Title="vilanxware",Description="Could not reach the server. Check your connection or try another executor.",Time=8}) end
end
Box:AddInput("LK",{Default="",Text="License Key",Placeholder="Enter your key...",Finished=true,Callback=function(v) submit(v) end})
local function boxText()
  local roots={}
  pcall(function() if gethui then roots[#roots+1]=gethui() end end)
  pcall(function() roots[#roots+1]=game:GetService("CoreGui") end)
  pcall(function() local pg=game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"); if pg then roots[#roots+1]=pg end end)
  local byKey,byAny,seen=nil,nil,0
  for _,r in ipairs(roots) do
    local list={}; pcall(function() list=r:GetDescendants() end)
    for _,d in ipairs(list) do
      pcall(function()
        if d:IsA("TextBox") then
          seen=seen+1
          local ph=tostring(d.PlaceholderText):lower()
          local tx=tostring(d.Text or "")
          if ph:find("key") and tx~="" then byKey=tx
          elseif (not ph:find("search")) and tx~="" and not byAny then byAny=tx end
        end
      end)
    end
  end
  return byKey or byAny, seen
end
Box:AddButton({Text="Unlock",Func=function()
  pcall(function() local tb=game:GetService("UserInputService"):GetFocusedTextBox(); if tb then tb:ReleaseFocus(true) end end)
  local t,seen=boxText()
  if (not t) or t=="" then t=(Library.Options.LK and Library.Options.LK.Value) or "" end
  if (not t) or t=="" then pcall(function() local gc=getclipboard or (clipboard and clipboard.get); if gc then local c=gc(); if type(c)=="string" then t=c end end end) end
  t=cleanKey(t)
  if t=="" then Library:Notify({Title="vilanxware â¢ L5",Description="Could not read the key field (textboxes seen: "..tostring(seen).."). Press ENTER in the box instead, or report this to vilan.",Time=9}); return end
  submit(t)
end})
Box:AddButton({Text="Get a key (Copy Discord)",Func=function()
  local cb = setclipboard or toclipboard or (syn and syn.write_clipboard)
  if cb then pcall(cb, INVITE) end
  Library:Notify({Title="vilanxware",Description="Discord copied: "..INVITE..". Join and run /getkey to get your key.",Time=9})
end})
Box:AddLabel("Get your key in our Discord: run /getkey (free with a quick ad, or instant with Lifetime), then paste it above.", true)
Box:AddButton({Text="Close",Func=function() pcall(function() Library:Unload() end) end})
pcall(function() if Library.UpdateColorsUsingRegistry then Library:UpdateColorsUsingRegistry() end end)