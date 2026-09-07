local HttpService=game:GetService("HttpService")local Players=game:GetService("Players")local TweenService=game:GetService("TweenService")local UserInputService=game:GetService("UserInputService")local RunService=game:GetService("RunService")local Lighting=game:GetService("Lighting")local LocalPlayer=Players.LocalPlayer
local PlayerGui=LocalPlayer:WaitForChild("PlayerGui")local DOMAIN="jinhub.my.id"
local KEY_API_BASE="https://jinhub.my.id/api/getkey"
local KEY_WEBSITE="https://jinhub.my.id/getkey"
local DISCORD_URL="https://discord.gg/XPdhVZTaNv"
local STORAGE_FILE="JinHub/ggwhj96.json"
local PROVIDERS={"lootlabs","linkvertise","workink","boostellar"}local SAVED_KEY_NAME="savedKey"
local gameId=tostring(game.GameId)local function loadData()local success,data=pcall(function()if readfile and isfile and isfile(STORAGE_FILE)then
local raw=readfile(STORAGE_FILE)if raw and raw~="" then
return HttpService:JSONDecode(raw)end
end
return nil
end)if success and data then
return data
end
return{jhId=HttpService:GenerateGUID(false),savedKey=nil}end
local function saveData(data)pcall(function()if writefile and makefolder then
if not isfolder then
makefolder("JinHub")elseif not isfolder("JinHub")then
makefolder("JinHub")end
writefile(STORAGE_FILE,HttpService:JSONEncode(data))end
end)end
local function getHWID(data)if gethwid then
return gethwid()end
if syn and syn.crypt and syn.crypt.hash then
local hash=syn.crypt.hash("JinHub-"..game:GetService("RbxAnalyticsService"):GetClientId())return hash
end
return data.jhId
end
local function httpRequest(url)local methods={function()local body=game:HttpGet(url)if type(body)=="string" and body~="" then return body end
return nil
end,function()local body=HttpService:GetAsync(url)if type(body)=="string" and body~="" then return body end
return nil
end,function()if syn and syn.request then
local response=syn.request({Url=url,Method="GET"})if response.Success then return response.Body end
end
return nil
end,function()if http_request then
local response=http_request({Url=url,Method="GET"})if response.Success or response.StatusCode==200 then return response.Body end
end
return nil
end,function()if request then
local response=request({Url=url,Method="GET"})if response.Success or response.StatusCode==200 then return response.Body end
end
return nil
end,function()if http and http.request then
local response=http.request({Url=url,Method="GET"})if response.Success or response.StatusCode==200 then return response.Body end
end
return nil
end,function()local response=HttpService:RequestAsync({Url=url,Method="GET"})if response.Success then return response.Body end
return nil
end}for i,method in ipairs(methods)do
local success,result=pcall(method)if success and result then
return result
end
end
error("All HTTP methods failed. Executor may not support HTTP requests.")end
local function getExecutorName()if identifyexecutor then
return identifyexecutor()elseif syn then
return "Synapse X"
elseif KRNL_LOADED then
return "KRNL"
elseif getexecutorname then
return getexecutorname()else
return "Unknown"
end
end
local function checkSkipKey()local skipUrl=string.format("https://%s/api/skipkey?gameId=%s",DOMAIN,gameId)local success,response=pcall(function()return httpRequest(skipUrl)end)if success and response then
local ok,data=pcall(function()return HttpService:JSONDecode(response)end)if ok and data then
if data.success==true and data.skipKey==true then
return true
end
end
end
return false
end
local function loadScriptDirect()local scriptUrl=string.format("https://%s/token=/%s",DOMAIN,gameId)local success,scriptCode=pcall(function()return httpRequest(scriptUrl)end)if success and scriptCode and type(scriptCode)=="string" and #scriptCode>50 then
local loadSuccess,loadErr=pcall(function()local fn=loadstring(scriptCode)if fn then fn()end
end)return loadSuccess
end
return false
end
if checkSkipKey()then
if loadScriptDirect()then
return
end
end
local function verifyKey(data,keyString)local hwid=getHWID(data)local robloxUserId=tostring(LocalPlayer.UserId)local robloxUsername=LocalPlayer.Name
local executor=getExecutorName()local unifiedUrl=string.format("https://jinhub.my.id/api/verify?key=%s&hwid=%s&gameId=%s&robloxUserId=%s&robloxUsername=%s&executor=%s",HttpService:UrlEncode(keyString),HttpService:UrlEncode(hwid),gameId,HttpService:UrlEncode(robloxUserId),HttpService:UrlEncode(robloxUsername),HttpService:UrlEncode(executor))local success,response=pcall(function()return httpRequest(unifiedUrl)end)if success then
local ok,data2=pcall(function()return HttpService:JSONDecode(response)end)if ok then
if data2.success and data2.valid then
data2.provider="Unified API"
return data2
elseif data2.valid then
data2.success=true
data2.provider="Unified API"
return data2
end
end
end
for _,provider in ipairs(PROVIDERS)do
local url=string.format("%s/%s/verify?key=%s&hwid=%s&gameId=%s&robloxUserId=%s&robloxUsername=%s&executor=%s",KEY_API_BASE,provider,HttpService:UrlEncode(keyString),HttpService:UrlEncode(hwid),gameId,HttpService:UrlEncode(robloxUserId),HttpService:UrlEncode(robloxUsername),HttpService:UrlEncode(executor))local success2,response2=pcall(function()return httpRequest(url)end)if success2 then
local ok2,data3=pcall(function()return HttpService:JSONDecode(response2)end)if ok2 then
if data3.success and data3.valid then
data3.provider=provider
return data3
elseif not(data3.error and data3.error:match("Key not found"))then
data3.provider=provider
return data3
end
end
end
end
return{success=false,error="Invalid key: Key not found. Please get a valid key from website."}end
local function loadScript(isPremium)local tier=isPremium and "premium" or "free"
local scriptUrl=string.format("https://%s/token=/%s?tier=%s",DOMAIN,gameId,tier)local success,scriptCode=pcall(function()return httpRequest(scriptUrl)end)if not success then
return false,"Failed to connect to server: "..tostring(scriptCode)end
if scriptCode:match("<!doctype")or scriptCode:match("<html")then
return false,"Server error: Route collision (got HTML instead of script)"
end
if scriptCode=="Game not supported" or scriptCode=="NOT_FOUND" or scriptCode=="Not Found" then
return false,"This game is not supported yet (ID: "..gameId..")"
end
if #scriptCode<50 then
return false,"Server error: "..scriptCode
end
local execSuccess,execError=pcall(function()local compiledFn,compileErr=loadstring(scriptCode)if not compiledFn then
error("Compile failed: "..tostring(compileErr),0)end
compiledFn()end)if not execSuccess then
return false,"Script error: "..tostring(execError)end
return true
end
local function Notify(title,text,color)local existing=PlayerGui:FindFirstChild("JinHubNotify")if existing then existing:Destroy()end
local gui=Instance.new("ScreenGui")gui.Name="JinHubNotify";gui.ResetOnSpawn=false;gui.Parent=PlayerGui
local frame=Instance.new("Frame")frame.Size=UDim2.new(0,260,0,72)frame.Position=UDim2.new(1,360,1,-94)frame.AnchorPoint=Vector2.new(1,1)frame.BackgroundColor3=Color3.fromRGB(8,9,18)frame.BorderSizePixel=0;frame.Parent=gui
Instance.new("UICorner",frame).CornerRadius=UDim.new(0,4)local s=Instance.new("UIStroke");s.Color=Color3.fromRGB(50,55,90);s.Thickness=1;s.Parent=frame
local ico=Instance.new("ImageLabel")ico.Size=UDim2.new(0,40,0,40);ico.Position=UDim2.new(0,16,0.5,-20)ico.BackgroundTransparency=1;ico.ImageColor3=color
ico.Image=(color==Color3.fromRGB(0,255,100))and "rbxassetid://119783053916823" or "rbxassetid://130226573962640"
ico.Parent=frame
local l1=Instance.new("TextLabel")l1.Size=UDim2.new(1,-72,0,26);l1.Position=UDim2.new(0,68,0,12)l1.BackgroundTransparency=1;l1.Text=title;l1.TextColor3=Color3.fromRGB(255,255,255)l1.TextSize=19;l1.Font=Enum.Font.GothamBold;l1.TextXAlignment=Enum.TextXAlignment.Left;l1.Parent=frame
local l2=Instance.new("TextLabel")l2.Size=UDim2.new(1,-72,0,18);l2.Position=UDim2.new(0,68,0,40)l2.BackgroundTransparency=1;l2.Text=text;l2.TextColor3=Color3.fromRGB(155,160,185)l2.TextSize=14;l2.Font=Enum.Font.Gotham;l2.TextXAlignment=Enum.TextXAlignment.Left;l2.Parent=frame
local bar=Instance.new("Frame")bar.Size=UDim2.new(1,0,0,2);bar.Position=UDim2.new(0,0,1,-2)bar.BackgroundColor3=color;bar.BorderSizePixel=0;bar.Parent=frame
TweenService:Create(frame,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Position=UDim2.new(1,-18,1,-94)}):Play()TweenService:Create(bar,TweenInfo.new(5,Enum.EasingStyle.Linear),{Size=UDim2.new(0,0,0,2)}):Play()task.wait(5)local o=TweenService:Create(frame,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Position=UDim2.new(1,360,1,-94)})o:Play();o.Completed:Wait();gui:Destroy()end
local U={}U.tween=function(o,p,t,sty,dir)local tw=TweenService:Create(o,TweenInfo.new(t or 0.3,sty or Enum.EasingStyle.Quint,dir or Enum.EasingDirection.Out),p)tw:Play();return tw
end
U.round=function(o,r)local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 12);c.Parent=o;return c end
U.stroke=function(o,col,th,tr)local s=Instance.new("UIStroke");s.Color=col or Color3.new(1,1,1)s.Thickness=th or 1;s.Transparency=tr or 0.9
s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border;s.Parent=o;return s
end
U.tweenBack=function(o,p,t)return U.tween(o,p,t,Enum.EasingStyle.Back,Enum.EasingDirection.Out)end
U.gradient=function(o,rotation,colorSeq)local g=Instance.new("UIGradient")g.Rotation=rotation or 0
if colorSeq then g.Color=colorSeq end
g.Parent=o
return g
end
local function SetBlur(on)local b=Lighting:FindFirstChild("JinhubBlur")if on then
if not b then b=Instance.new("BlurEffect");b.Name="JinhubBlur";b.Size=0;b.Parent=Lighting end
U.tween(b,{Size=20},0.6)elseif b then
U.tween(b,{Size=0},0.2)task.delay(0.4,function()if b and b.Parent then b:Destroy()end end)end
end
local Cfg={Colors={Primary=Color3.fromRGB(167,139,250),PrimaryHi=Color3.fromRGB(196,178,253),Success=Color3.fromRGB(66,214,171),Error=Color3.fromRGB(255,74,105),Warning=Color3.fromRGB(255,176,59),Bg=Color3.fromRGB(15,15,17),BgPanel=Color3.fromRGB(20,20,23),BgCard=Color3.fromRGB(26,26,29),Sidebar=Color3.fromRGB(12,12,14),TextMain=Color3.fromRGB(255,255,255),TextDim=Color3.fromRGB(140,140,148),},}local Toast={list={},max=3,gap=10}local Icons={CheckCircle="rbxassetid://10709790644",XCircle="rbxassetid://10747384394",Warning="rbxassetid://130226573962640",Info="rbxassetid://70599877053930",ErrorFolder="rbxassetid://113312905787220",Spinner="rbxassetid://116535712789945",ErrorCircle="rbxassetid://91561087885096",Minus="rbxassetid://136726958755914",Close="rbxassetid://125391905229986",Key="rbxassetid://93569468678423",Doc="rbxassetid://94529541997278",Controller="rbxassetid://113312905787220",Settings="rbxassetid://130226573962640",ArrowRight="rbxassetid://128072643970434",Shield="rbxassetid://118836584735830",Zap="rbxassetid://118385405247425",Plus="rbxassetid://125295031804516",Logo="rbxassetid://75269568091825",Pricing="rbxassetid://119769815665736",UserShield="rbxassetid://89349253531302",Gear="rbxassetid://77474773671083",CheckPremium="rbxassetid://103921394781029",Sparkles="rbxassetid://84661182853327",}Toast.show=function(parent,msg,kind,dur)local cols={success=Cfg.Colors.Success,error=Cfg.Colors.Error,warning=Cfg.Colors.Warning,info=Cfg.Colors.Primary}local icos={success=Icons.CheckCircle,error=Icons.ErrorFolder,warning=Icons.Warning,info=Icons.Info}local col=cols[kind]or cols.info
local ico=icos[kind]or Icons.Info
if #Toast.list>=Toast.max then local old=table.remove(Toast.list,1);if old and old.Parent then old:Destroy()end end
local h=58
local f=Instance.new("Frame")f.Name=tostring(tick());f.Size=UDim2.new(0,0,0,h)f.Position=UDim2.new(0.5,0,0,20);f.AnchorPoint=Vector2.new(0.5,0)f.BackgroundColor3=Cfg.Colors.BgPanel;f.BackgroundTransparency=0.04
f.BorderSizePixel=0;f.ZIndex=300;f.ClipsDescendants=true;f.Parent=parent
U.round(f,14);U.stroke(f,col,1,0.35)local ib=Instance.new("Frame");ib.Size=UDim2.fromOffset(38,38)ib.Position=UDim2.new(0,12,0.5,0);ib.AnchorPoint=Vector2.new(0,0.5)ib.BackgroundColor3=col;ib.BackgroundTransparency=0.82;ib.BorderSizePixel=0;ib.ZIndex=301;ib.Parent=f
U.round(ib,13)local il=Instance.new("ImageLabel");il.Size=UDim2.fromOffset(20,20)il.Position=UDim2.fromScale(0.5,0.5);il.AnchorPoint=Vector2.new(0.5,0.5)il.BackgroundTransparency=1;il.Image=ico;il.ImageColor3=col;il.ZIndex=302;il.Parent=ib
local tc=Instance.new("Frame");tc.Size=UDim2.new(1,-62,1,0)tc.Position=UDim2.fromOffset(58,0);tc.BackgroundTransparency=1;tc.ZIndex=301;tc.Parent=f
local tl=Instance.new("TextLabel");tl.Size=UDim2.fromScale(1,1)tl.BackgroundTransparency=1;tl.Text=msg or "";tl.TextColor3=Cfg.Colors.TextMain
tl.TextSize=13;tl.Font=Enum.Font.GothamMedium
tl.TextXAlignment=Enum.TextXAlignment.Left;tl.TextYAlignment=Enum.TextYAlignment.Center
tl.TextWrapped=true;tl.ZIndex=301;tl.Parent=tc
table.insert(Toast.list,f)Toast.reflow()U.tweenBack(f,{Size=UDim2.new(0,320,0,h)},0.25)task.delay(dur or 3.5,function()if not f.Parent then return end
U.tween(f,{Position=UDim2.new(0.5,0,0,-80),BackgroundTransparency=1},0.2)for i,t in ipairs(Toast.list)do if t==f then table.remove(Toast.list,i);break end end
task.wait(0.2);if f.Parent then f:Destroy()end
Toast.reflow()end)end
Toast.reflow=function()for i,t in ipairs(Toast.list)do
U.tween(t,{Position=UDim2.new(0.5,0,0,20+((i-1)*(62+Toast.gap)))},0.2)end
end
local function Build()local data=loadData()local parent=game:GetService("CoreGui")local old=parent:FindFirstChild("JinhubKeySystem")if old then old:Destroy()end
local screen=Instance.new("ScreenGui")screen.Name="JinhubKeySystem";screen.ResetOnSpawn=false;screen.Parent=parent
SetBlur(true)local shadow=Instance.new("ImageLabel")shadow.Name="Shadow";shadow.BackgroundTransparency=1
shadow.Image="rbxassetid://6014261993";shadow.ImageColor3=Color3.new(0,0,0)shadow.ImageTransparency=0.4
shadow.ScaleType=Enum.ScaleType.Slice
shadow.SliceCenter=Rect.new(49,49,450,450)shadow.Size=UDim2.new(0,730,0,520)shadow.Position=UDim2.new(0.5,0,0.5,20)shadow.AnchorPoint=Vector2.new(0.5,0.5)shadow.ZIndex=0
shadow.Parent=screen
local main=Instance.new("Frame")main.Size=UDim2.new(0,710,0,500);main.Position=UDim2.new(0.5,0,0.5,20)main.AnchorPoint=Vector2.new(0.5,0.5);main.BackgroundColor3=Cfg.Colors.Bg
main.BackgroundTransparency=0;main.ClipsDescendants=true;main.Parent=screen
U.round(main,14)U.stroke(main,Color3.new(1,1,1),1,0.92)local topBar=Instance.new("Frame")topBar.Size=UDim2.new(1,0,0,52);topBar.BackgroundTransparency=1
topBar.BorderSizePixel=0;topBar.ZIndex=2;topBar.Parent=main
local logoContainer=Instance.new("Frame")logoContainer.Size=UDim2.new(0,250,1,0);logoContainer.Position=UDim2.new(0,16,0,0)logoContainer.BackgroundTransparency=1;logoContainer.Parent=topBar
local logoIcon=Instance.new("ImageLabel")logoIcon.Size=UDim2.fromOffset(32,32);logoIcon.Position=UDim2.new(0,0,0.5,0)logoIcon.AnchorPoint=Vector2.new(0,0.5);logoIcon.BackgroundTransparency=1
logoIcon.Image=Icons.Logo;logoIcon.Parent=logoContainer
local titleContainer=Instance.new("Frame")titleContainer.Size=UDim2.new(1,-40,1,0);titleContainer.Position=UDim2.new(0,40,0,0)titleContainer.BackgroundTransparency=1;titleContainer.Parent=logoContainer
local titleLbl=Instance.new("TextLabel")titleLbl.Size=UDim2.new(1,0,0,14);titleLbl.Position=UDim2.new(0,0,0.5,-14)titleLbl.Text="JinHub";titleLbl.TextColor3=Color3.new(1,1,1)titleLbl.TextSize=20;titleLbl.Font=Enum.Font.GothamBold
titleLbl.TextXAlignment=Enum.TextXAlignment.Left;titleLbl.TextYAlignment=Enum.TextYAlignment.Top
titleLbl.BackgroundTransparency=1;titleLbl.Parent=titleContainer
local subtitleLbl=Instance.new("TextLabel")subtitleLbl.Size=UDim2.new(1,0,0,12);subtitleLbl.Position=UDim2.new(0,0,0.5,10)subtitleLbl.Text="https://jinhub.my.id/topscript";subtitleLbl.TextColor3=Cfg.Colors.TextDim
subtitleLbl.TextSize=12;subtitleLbl.Font=Enum.Font.Gotham
subtitleLbl.TextXAlignment=Enum.TextXAlignment.Left;subtitleLbl.TextYAlignment=Enum.TextYAlignment.Top
subtitleLbl.BackgroundTransparency=1;subtitleLbl.Parent=titleContainer
local versionBadge=Instance.new("Frame")versionBadge.Size=UDim2.fromOffset(48,16);versionBadge.Position=UDim2.new(0,70,0.5,-14)versionBadge.BackgroundColor3=Color3.fromRGB(30,30,35);versionBadge.Parent=titleContainer
U.round(versionBadge,6)local versionTxt=Instance.new("TextLabel")versionTxt.Size=UDim2.fromScale(1,1);versionTxt.Text="v0.1.0"
versionTxt.TextColor3=Cfg.Colors.TextDim;versionTxt.TextSize=10
versionTxt.Font=Enum.Font.GothamMedium;versionTxt.BackgroundTransparency=1
versionTxt.Parent=versionBadge
local ctrlRow=Instance.new("Frame");ctrlRow.Size=UDim2.new(0,80,0,32)ctrlRow.Position=UDim2.new(1,-16,0.5,0);ctrlRow.AnchorPoint=Vector2.new(1,0.5)ctrlRow.BackgroundTransparency=1;ctrlRow.Parent=topBar
local ctrlList=Instance.new("UIListLayout");ctrlList.FillDirection=Enum.FillDirection.Horizontal
ctrlList.SortOrder=Enum.SortOrder.LayoutOrder
ctrlList.HorizontalAlignment=Enum.HorizontalAlignment.Right;ctrlList.VerticalAlignment=Enum.VerticalAlignment.Center
ctrlList.Padding=UDim.new(0,6);ctrlList.Parent=ctrlRow
local function ctrlBtn(icon,sz)local b=Instance.new("ImageButton");b.Size=UDim2.fromOffset(30,30)b.BackgroundColor3=Color3.new(1,1,1);b.BackgroundTransparency=1;b.Parent=ctrlRow
U.round(b,8)local i=Instance.new("ImageLabel");i.Size=UDim2.fromOffset(sz or 14,sz or 14)i.Position=UDim2.fromScale(0.5,0.5);i.AnchorPoint=Vector2.new(0.5,0.5)i.BackgroundTransparency=1;i.Image=icon;i.ImageTransparency=0
i.ImageColor3=Color3.fromRGB(255,255,255);i.Parent=b
b.MouseEnter:Connect(function()U.tween(b,{BackgroundTransparency=0.9},0.15);U.tween(i,{ImageColor3=Color3.fromRGB(200,200,200)},0.15)end)b.MouseLeave:Connect(function()U.tween(b,{BackgroundTransparency=1},0.15);U.tween(i,{ImageColor3=Color3.fromRGB(255,255,255)},0.15)end)return b
end
ctrlBtn(Icons.Minus,18)local closeBtn=ctrlBtn(Icons.Close,18)closeBtn.MouseButton1Click:Connect(function()SetBlur(false)U.tween(main,{Position=UDim2.new(0.5,0,0.5,120),BackgroundTransparency=1},0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.In)U.tween(shadow,{ImageTransparency=1},0.5)task.delay(0.5,function()screen:Destroy()end)end)local topDivider=Instance.new("Frame")topDivider.Size=UDim2.new(1,0,0,1);topDivider.Position=UDim2.new(0,0,0,52)topDivider.BackgroundColor3=Color3.new(1,1,1);topDivider.BackgroundTransparency=0.92
topDivider.BorderSizePixel=0;topDivider.ZIndex=2;topDivider.Parent=main
local body=Instance.new("Frame")body.Size=UDim2.new(1,0,1,-52-32);body.Position=UDim2.new(0,0,0,53)body.BackgroundTransparency=1;body.Parent=main
local sidebar=Instance.new("Frame");sidebar.Size=UDim2.new(0,54,1,0)sidebar.BackgroundTransparency=1;sidebar.BorderSizePixel=0;sidebar.Parent=body
local sideList=Instance.new("UIListLayout");sideList.Padding=UDim.new(0,10)sideList.SortOrder=Enum.SortOrder.LayoutOrder
sideList.HorizontalAlignment=Enum.HorizontalAlignment.Center;sideList.Parent=sidebar
local sidePad=Instance.new("UIPadding");sidePad.PaddingTop=UDim.new(0,18);sidePad.Parent=sidebar
local function sideIcon(icon,active,tabName)local b=Instance.new("TextButton")b.Size=UDim2.fromOffset(34,34)b.BackgroundColor3=active and Cfg.Colors.Primary or Color3.new(1,1,1)b.BackgroundTransparency=active and 0.85 or 1
b.AutoButtonColor=false;b.Text="";b.Parent=sidebar
U.round(b,10)local i=Instance.new("ImageLabel");i.Size=UDim2.fromOffset(20,20)i.Position=UDim2.fromScale(0.5,0.5);i.AnchorPoint=Vector2.new(0.5,0.5)i.BackgroundTransparency=1;i.Image=icon
i.ImageColor3=active and Cfg.Colors.Primary or Cfg.Colors.TextDim
i.Parent=b
b.MouseEnter:Connect(function()if not active then
U.tween(b,{BackgroundTransparency=0.92},0.2)end
end)b.MouseLeave:Connect(function()if not active then
U.tween(b,{BackgroundTransparency=1},0.2)end
end)return b,i
end
local keyBtn,keyIcon=sideIcon(Icons.Key,true,"key")local pricingBtn,pricingIcon=sideIcon(Icons.Pricing,false,"pricing")local shieldBtn,shieldIcon=sideIcon(Icons.UserShield,false,"shield")local gearBtn,gearIcon=sideIcon(Icons.Gear,false,"gear")local verticalDivider=Instance.new("Frame")verticalDivider.Size=UDim2.new(0,1,1,-52);verticalDivider.Position=UDim2.new(0,54,0,52)verticalDivider.BackgroundColor3=Color3.new(1,1,1);verticalDivider.BackgroundTransparency=0.92
verticalDivider.BorderSizePixel=0;verticalDivider.ZIndex=2;verticalDivider.Parent=main
local content=Instance.new("Frame")content.Size=UDim2.new(1,-54,1,0);content.Position=UDim2.new(0,54,0,0)content.BackgroundTransparency=1;content.ClipsDescendants=false;content.Parent=body
local keyPage=Instance.new("Frame")keyPage.Size=UDim2.fromScale(1,1);keyPage.BackgroundTransparency=1
keyPage.Visible=true;keyPage.Parent=content
local keyPad=Instance.new("UIPadding")keyPad.PaddingLeft=UDim.new(0,24);keyPad.PaddingRight=UDim.new(0,24)keyPad.PaddingTop=UDim.new(0,12);keyPad.PaddingBottom=UDim.new(0,0)keyPad.Parent=keyPage
local keyList=Instance.new("UIListLayout")keyList.SortOrder=Enum.SortOrder.LayoutOrder
keyList.Padding=UDim.new(0,12);keyList.Parent=keyPage
local pricingPage=Instance.new("ScrollingFrame")pricingPage.Size=UDim2.fromScale(1,1);pricingPage.BackgroundTransparency=1
pricingPage.BorderSizePixel=0;pricingPage.ScrollBarThickness=6
pricingPage.ScrollBarImageColor3=Cfg.Colors.Primary
pricingPage.CanvasSize=UDim2.fromOffset(0,0);pricingPage.AutomaticCanvasSize=Enum.AutomaticSize.Y
pricingPage.Visible=false;pricingPage.Parent=content
local pricingPad=Instance.new("UIPadding")pricingPad.PaddingLeft=UDim.new(0,24);pricingPad.PaddingRight=UDim.new(0,24)pricingPad.PaddingTop=UDim.new(0,20);pricingPad.PaddingBottom=UDim.new(0,20)pricingPad.Parent=pricingPage
local pricingList=Instance.new("UIListLayout")pricingList.SortOrder=Enum.SortOrder.LayoutOrder
pricingList.Padding=UDim.new(0,20);pricingList.Parent=pricingPage
local shieldPage=Instance.new("ScrollingFrame")shieldPage.Size=UDim2.fromScale(1,1);shieldPage.BackgroundTransparency=1
shieldPage.BorderSizePixel=0;shieldPage.ScrollBarThickness=6
shieldPage.ScrollBarImageColor3=Cfg.Colors.Primary
shieldPage.CanvasSize=UDim2.fromOffset(0,0);shieldPage.AutomaticCanvasSize=Enum.AutomaticSize.Y
shieldPage.Visible=false;shieldPage.Parent=content
local shieldPad=Instance.new("UIPadding")shieldPad.PaddingLeft=UDim.new(0,24);shieldPad.PaddingRight=UDim.new(0,24)shieldPad.PaddingTop=UDim.new(0,20);shieldPad.PaddingBottom=UDim.new(0,20)shieldPad.Parent=shieldPage
local shieldList=Instance.new("UIListLayout")shieldList.SortOrder=Enum.SortOrder.LayoutOrder
shieldList.Padding=UDim.new(0,16);shieldList.Parent=shieldPage
local verifHead=Instance.new("Frame");verifHead.Size=UDim2.new(1,0,0,16)verifHead.LayoutOrder=1
verifHead.BackgroundTransparency=1;verifHead.Parent=keyPage
local verifLbl=Instance.new("TextLabel");verifLbl.Size=UDim2.new(1,-24,1,0)verifLbl.Text="LICENSE KEY";verifLbl.TextColor3=Cfg.Colors.TextDim
verifLbl.TextSize=11;verifLbl.Font=Enum.Font.GothamMedium
verifLbl.TextXAlignment=Enum.TextXAlignment.Left;verifLbl.BackgroundTransparency=1;verifLbl.Parent=verifHead
local chevron=Instance.new("ImageLabel");chevron.Size=UDim2.fromOffset(12,12)chevron.Position=UDim2.new(1,0,0.5,0);chevron.AnchorPoint=Vector2.new(1,0.5)chevron.Image="rbxassetid://10709791135";chevron.ImageColor3=Cfg.Colors.TextDim
chevron.BackgroundTransparency=1;chevron.Rotation=180;chevron.Parent=verifHead
local card=Instance.new("Frame");card.Size=UDim2.new(1,0,0,0)card.AutomaticSize=Enum.AutomaticSize.Y
card.LayoutOrder=2
card.BackgroundColor3=Cfg.Colors.BgCard;card.BackgroundTransparency=0.7;card.Parent=keyPage
U.round(card,14);U.stroke(card,Color3.new(1,1,1),1,0.93)local cardPad=Instance.new("UIPadding")cardPad.PaddingLeft=UDim.new(0,20);cardPad.PaddingRight=UDim.new(0,20)cardPad.PaddingTop=UDim.new(0,16);cardPad.PaddingBottom=UDim.new(0,16)cardPad.Parent=card
local cardList=Instance.new("UIListLayout")cardList.SortOrder=Enum.SortOrder.LayoutOrder
cardList.Padding=UDim.new(0,8);cardList.Parent=card
local ksTitle=Instance.new("TextLabel");ksTitle.Size=UDim2.new(1,0,0,22)ksTitle.LayoutOrder=1
ksTitle.Text="Got a Key?";ksTitle.TextColor3=Color3.new(1,1,1)ksTitle.TextSize=20;ksTitle.Font=Enum.Font.GothamBold
ksTitle.TextXAlignment=Enum.TextXAlignment.Left;ksTitle.BackgroundTransparency=1;ksTitle.Parent=card
local ksDesc=Instance.new("TextLabel");ksDesc.Size=UDim2.new(1,0,0,14)ksDesc.LayoutOrder=2
ksDesc.Text="Sign in with your license key to continue"
ksDesc.TextColor3=Cfg.Colors.TextDim;ksDesc.TextSize=12;ksDesc.Font=Enum.Font.Gotham
ksDesc.TextXAlignment=Enum.TextXAlignment.Left;ksDesc.BackgroundTransparency=1;ksDesc.Parent=card
local inp=Instance.new("Frame");inp.Size=UDim2.new(1,0,0,44)inp.LayoutOrder=3
inp.BackgroundColor3=Cfg.Colors.Bg;inp.Parent=card
U.round(inp,10)local iStroke=U.stroke(inp,Color3.new(1,1,1),1,0.9)local box=Instance.new("TextBox");box.Size=UDim2.new(1,-32,1,0)box.Position=UDim2.fromOffset(16,0);box.Text=""
box.PlaceholderText="XXXXXX-XXXXXX-XXXXXX-XXXXXX"
box.PlaceholderColor3=Color3.fromRGB(100,100,108)box.TextColor3=Color3.new(1,1,1);box.TextSize=14;box.Font=Enum.Font.Gotham
box.ClearTextOnFocus=false
box.BackgroundTransparency=1;box.TextXAlignment=Enum.TextXAlignment.Left;box.Parent=inp
box.Focused:Connect(function()U.tween(iStroke,{Transparency=0.4,Color=Cfg.Colors.Primary},0.2)end)box.FocusLost:Connect(function()U.tween(iStroke,{Transparency=0.9,Color=Color3.new(1,1,1)},0.2)end)local statusIndicator=Instance.new("Frame");statusIndicator.Size=UDim2.new(1,0,0,36)statusIndicator.LayoutOrder=4
statusIndicator.BackgroundColor3=Color3.fromRGB(239,68,68);statusIndicator.BackgroundTransparency=0.85
statusIndicator.Parent=card
U.round(statusIndicator,10)local statusStroke=U.stroke(statusIndicator,Color3.fromRGB(239,68,68),1,0.5)local statusContent=Instance.new("Frame");statusContent.Size=UDim2.new(1,0,1,0)statusContent.BackgroundTransparency=1;statusContent.Parent=statusIndicator
local statusPadding=Instance.new("UIPadding")statusPadding.PaddingLeft=UDim.new(0,14);statusPadding.PaddingRight=UDim.new(0,14)statusPadding.Parent=statusContent
local statusLayout=Instance.new("UIListLayout");statusLayout.FillDirection=Enum.FillDirection.Horizontal
statusLayout.SortOrder=Enum.SortOrder.LayoutOrder
statusLayout.HorizontalAlignment=Enum.HorizontalAlignment.Left;statusLayout.VerticalAlignment=Enum.VerticalAlignment.Center
statusLayout.Padding=UDim.new(0,8);statusLayout.Parent=statusContent
local sIconBg=Instance.new("Frame");sIconBg.Size=UDim2.fromOffset(20,20)sIconBg.BackgroundTransparency=1;sIconBg.Parent=statusContent
U.round(sIconBg,10)local sImg=Instance.new("ImageLabel");sImg.Size=UDim2.fromOffset(16,16)sImg.Position=UDim2.fromScale(0.5,0.5);sImg.AnchorPoint=Vector2.new(0.5,0.5)sImg.Image=Icons.Info;sImg.ImageColor3=Color3.fromRGB(239,68,68)sImg.BackgroundTransparency=1;sImg.Parent=sIconBg
local sVal=Instance.new("TextLabel");sVal.Size=UDim2.new(1,-40,0,20)sVal.Text="No active subscription(s) found";sVal.TextColor3=Color3.fromRGB(239,68,68)sVal.TextSize=12;sVal.Font=Enum.Font.GothamMedium
sVal.TextXAlignment=Enum.TextXAlignment.Left;sVal.BackgroundTransparency=1;sVal.Parent=statusContent
local ttlLbl=Instance.new("TextLabel")ttlLbl.Size=UDim2.fromOffset(0,20);ttlLbl.AutomaticSize=Enum.AutomaticSize.X
ttlLbl.Position=UDim2.new(1,-14,0.5,0);ttlLbl.AnchorPoint=Vector2.new(1,0.5)ttlLbl.Text="";ttlLbl.TextColor3=Cfg.Colors.TextDim
ttlLbl.TextSize=10;ttlLbl.Font=Enum.Font.Gotham
ttlLbl.TextXAlignment=Enum.TextXAlignment.Right
ttlLbl.BackgroundTransparency=1;ttlLbl.Visible=false
ttlLbl.Parent=statusIndicator
local btnRow=Instance.new("Frame");btnRow.Size=UDim2.new(1,0,0,42)btnRow.LayoutOrder=5
btnRow.BackgroundTransparency=1;btnRow.Parent=card
local btnList=Instance.new("UIListLayout");btnList.FillDirection=Enum.FillDirection.Horizontal
btnList.SortOrder=Enum.SortOrder.LayoutOrder
btnList.Padding=UDim.new(0,8);btnList.Parent=btnRow
local redeem=Instance.new("TextButton");redeem.Size=UDim2.new(0.62,-5,1,0)redeem.BackgroundColor3=Cfg.Colors.Primary
redeem.AutoButtonColor=false;redeem.Text="";redeem.Parent=btnRow
U.round(redeem,10)U.gradient(redeem,90,ColorSequence.new{ColorSequenceKeypoint.new(0,Cfg.Colors.PrimaryHi),ColorSequenceKeypoint.new(1,Cfg.Colors.Primary),})local redeemTxt=Instance.new("TextLabel");redeemTxt.Size=UDim2.new(1,-30,1,0)redeemTxt.Position=UDim2.new(0,0,0,0)redeemTxt.Text="Verify Key";redeemTxt.TextColor3=Color3.new(1,1,1)redeemTxt.TextSize=14;redeemTxt.Font=Enum.Font.GothamBold
redeemTxt.BackgroundTransparency=1;redeemTxt.Parent=redeem
local redeemArrow=Instance.new("ImageLabel");redeemArrow.Size=UDim2.fromOffset(14,14)redeemArrow.Position=UDim2.new(1,-16,0.5,0);redeemArrow.AnchorPoint=Vector2.new(1,0.5)redeemArrow.BackgroundTransparency=1;redeemArrow.Image=Icons.ArrowRight
redeemArrow.ImageColor3=Color3.new(1,1,1);redeemArrow.Parent=redeem
local getKey=Instance.new("TextButton");getKey.Size=UDim2.new(0.38,-5,1,0)getKey.BackgroundColor3=Color3.fromRGB(34,34,34);getKey.AutoButtonColor=false
getKey.Text="Copy key link";getKey.TextColor3=Color3.new(1,1,1)getKey.TextSize=14;getKey.Font=Enum.Font.GothamBold;getKey.Parent=btnRow
U.round(getKey,10);U.stroke(getKey,Color3.new(1,1,1),1,0.9)local function hover(btn,base)btn.MouseEnter:Connect(function()U.tween(btn,{BackgroundColor3=base:Lerp(Color3.new(1,1,1),0.1)},0.2)end)btn.MouseLeave:Connect(function()U.tween(btn,{BackgroundColor3=base},0.2)end)end
hover(redeem,Cfg.Colors.Primary);hover(getKey,Color3.fromRGB(34,34,34))local whyDiv=Instance.new("Frame");whyDiv.Size=UDim2.new(1,0,0,1)whyDiv.LayoutOrder=6
whyDiv.BackgroundColor3=Color3.new(1,1,1);whyDiv.BackgroundTransparency=0.92
whyDiv.BorderSizePixel=0;whyDiv.Parent=card
local whyTitle=Instance.new("TextLabel");whyTitle.Size=UDim2.new(1,0,0,18)whyTitle.LayoutOrder=7
whyTitle.Text="Why a key?";whyTitle.TextColor3=Color3.new(1,1,1)whyTitle.TextSize=14;whyTitle.Font=Enum.Font.GothamBold
whyTitle.TextXAlignment=Enum.TextXAlignment.Left;whyTitle.BackgroundTransparency=1;whyTitle.Parent=card
local whyDesc=Instance.new("TextLabel");whyDesc.Size=UDim2.new(1,0,0,16)whyDesc.LayoutOrder=8
whyDesc.Text="Keys help us keep JinHub secure, stable and always up to date."
whyDesc.TextColor3=Cfg.Colors.TextDim;whyDesc.TextSize=12;whyDesc.Font=Enum.Font.Gotham
whyDesc.TextXAlignment=Enum.TextXAlignment.Left;whyDesc.BackgroundTransparency=1;whyDesc.Parent=card
local featRow=Instance.new("Frame");featRow.Size=UDim2.new(1,0,0,70)featRow.LayoutOrder=9
featRow.BackgroundTransparency=1;featRow.Parent=card
local featList=Instance.new("UIListLayout");featList.FillDirection=Enum.FillDirection.Horizontal
featList.SortOrder=Enum.SortOrder.LayoutOrder
featList.Padding=UDim.new(0,8);featList.Parent=featRow
local function featCard(icon,title,desc,col)local f=Instance.new("Frame");f.Size=UDim2.new(0.333,-6,1,0)f.BackgroundColor3=Cfg.Colors.Bg;f.Parent=featRow
U.round(f,10);U.stroke(f,Color3.new(1,1,1),1,0.92)local fp=Instance.new("UIPadding");fp.PaddingLeft=UDim.new(0,12);fp.PaddingTop=UDim.new(0,12);fp.Parent=f
local fi=Instance.new("ImageLabel");fi.Size=UDim2.fromOffset(16,16)fi.BackgroundTransparency=1;fi.Image=icon;fi.ImageColor3=col;fi.Parent=f
local ft=Instance.new("TextLabel");ft.Size=UDim2.new(1,-16,0,16)ft.Position=UDim2.fromOffset(22,0)ft.Text=title;ft.TextColor3=Color3.new(1,1,1);ft.TextSize=12
ft.Font=Enum.Font.GothamBold;ft.TextXAlignment=Enum.TextXAlignment.Left
ft.BackgroundTransparency=1;ft.Parent=f
local fd=Instance.new("TextLabel");fd.Size=UDim2.new(1,-4,0,28)fd.Position=UDim2.fromOffset(0,22)fd.Text=desc;fd.TextColor3=Cfg.Colors.TextDim;fd.TextSize=11
fd.Font=Enum.Font.Gotham;fd.TextXAlignment=Enum.TextXAlignment.Left
fd.TextWrapped=true;fd.BackgroundTransparency=1;fd.Parent=f
return f
end
featCard(Icons.Shield,"Easily Obtainable","Only 1 checkpoint",Cfg.Colors.Primary)featCard(Icons.Zap,"Security Protection","HWID & account protection",Cfg.Colors.Primary)featCard(Icons.Plus,"Fast Update","Always the latest version",Cfg.Colors.Primary)local expanded=true
local headBtn=Instance.new("TextButton");headBtn.Size=UDim2.fromScale(1,1)headBtn.BackgroundTransparency=1;headBtn.Text="";headBtn.Parent=verifHead
headBtn.MouseButton1Click:Connect(function()expanded=not expanded
U.tween(chevron,{Rotation=expanded and 180 or 0},0.2)U.tween(card,{Size=expanded and UDim2.new(1,0,0,card.AbsoluteSize.Y)or UDim2.new(1,0,0,0)},0.25)card.ClipsDescendants=not expanded
end)local sessionStartTime=tick()local function getDeviceType()local UserInputService=game:GetService("UserInputService")if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
return "Mobile • Touch"
elseif UserInputService.GamepadEnabled then
return "Console • Gamepad"
elseif UserInputService.KeyboardEnabled then
return "PC • Keyboard"
else
return "Unknown"
end
end
local function getServerType()if game.PrivateServerId~="" and game.PrivateServerOwnerId~=0 then
return "Private"
else
return "Public"
end
end
local function getSessionTime()local elapsed=tick()-sessionStartTime
local minutes=math.floor(elapsed/60)local seconds=math.floor(elapsed%60)return string.format("%d:%02d",minutes,seconds)end
local playerHeader=Instance.new("TextLabel")playerHeader.Size=UDim2.new(1,0,0,18);playerHeader.LayoutOrder=1
playerHeader.Text="PLAYER CARD";playerHeader.TextColor3=Cfg.Colors.TextDim
playerHeader.TextSize=11;playerHeader.Font=Enum.Font.Gotham
playerHeader.TextXAlignment=Enum.TextXAlignment.Left;playerHeader.BackgroundTransparency=1
playerHeader.Parent=shieldPage
local playerCard=Instance.new("Frame")playerCard.Size=UDim2.new(1,0,0,0);playerCard.AutomaticSize=Enum.AutomaticSize.Y
playerCard.LayoutOrder=2;playerCard.BackgroundColor3=Cfg.Colors.BgCard
playerCard.BackgroundTransparency=0.7;playerCard.Parent=shieldPage
U.round(playerCard,12);U.stroke(playerCard,Color3.new(1,1,1),1,0.93)local cardPadding=Instance.new("UIPadding")cardPadding.PaddingLeft=UDim.new(0,20);cardPadding.PaddingRight=UDim.new(0,20)cardPadding.PaddingTop=UDim.new(0,20);cardPadding.PaddingBottom=UDim.new(0,20)cardPadding.Parent=playerCard
local cardLayout=Instance.new("UIListLayout")cardLayout.SortOrder=Enum.SortOrder.LayoutOrder;cardLayout.Padding=UDim.new(0,16)cardLayout.Parent=playerCard
local playerRow=Instance.new("Frame")playerRow.Size=UDim2.new(1,0,0,80);playerRow.LayoutOrder=1
playerRow.BackgroundTransparency=1;playerRow.Parent=playerCard
local avatarBorder=Instance.new("Frame")avatarBorder.Size=UDim2.fromOffset(80,80);avatarBorder.Position=UDim2.fromOffset(0,0)avatarBorder.BackgroundColor3=Cfg.Colors.Primary;avatarBorder.BackgroundTransparency=0.8
avatarBorder.Parent=playerRow
U.round(avatarBorder,40)local avatarInner=Instance.new("Frame")avatarInner.Size=UDim2.fromOffset(72,72);avatarInner.Position=UDim2.fromScale(0.5,0.5)avatarInner.AnchorPoint=Vector2.new(0.5,0.5);avatarInner.BackgroundColor3=Cfg.Colors.Bg
avatarInner.Parent=avatarBorder
U.round(avatarInner,36)local avatar=Instance.new("ImageLabel")avatar.Size=UDim2.fromOffset(64,64);avatar.Position=UDim2.fromScale(0.5,0.5)avatar.AnchorPoint=Vector2.new(0.5,0.5);avatar.BackgroundTransparency=1
avatar.Image="https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=150&height=150&format=png"
avatar.Parent=avatarInner
U.round(avatar,32)local playerInfo=Instance.new("Frame")playerInfo.Size=UDim2.new(1,-90,1,0);playerInfo.Position=UDim2.fromOffset(90,0)playerInfo.BackgroundTransparency=1;playerInfo.Parent=playerRow
local playerName=Instance.new("TextLabel")playerName.Size=UDim2.new(1,0,0,24);playerName.Position=UDim2.fromOffset(0,8)playerName.Text=LocalPlayer.Name;playerName.TextColor3=Color3.new(1,1,1)playerName.TextSize=20;playerName.Font=Enum.Font.GothamBold
playerName.TextXAlignment=Enum.TextXAlignment.Left;playerName.BackgroundTransparency=1
playerName.Parent=playerInfo
local playerTag=Instance.new("TextLabel")playerTag.Size=UDim2.new(1,0,0,16);playerTag.Position=UDim2.fromOffset(0,32)playerTag.Text="@"..LocalPlayer.DisplayName;playerTag.TextColor3=Cfg.Colors.TextDim
playerTag.TextSize=12;playerTag.Font=Enum.Font.Gotham
playerTag.TextXAlignment=Enum.TextXAlignment.Left;playerTag.BackgroundTransparency=1
playerTag.Parent=playerInfo
local currentGameName="Loading..."
task.spawn(function()local success,result=pcall(function()return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)if success and currentGame and currentGame.Parent then
currentGame.Text=result
end
end)local currentGame=Instance.new("TextLabel")currentGame.Size=UDim2.new(1,0,0,14);currentGame.Position=UDim2.fromOffset(0,52)currentGame.Text=currentGameName;currentGame.TextColor3=Cfg.Colors.Primary
currentGame.TextSize=10;currentGame.Font=Enum.Font.GothamBold
currentGame.TextXAlignment=Enum.TextXAlignment.Left;currentGame.BackgroundTransparency=1
currentGame.Parent=playerInfo
local divider1=Instance.new("Frame")divider1.Size=UDim2.new(1,0,0,1);divider1.LayoutOrder=2
divider1.BackgroundColor3=Color3.new(1,1,1);divider1.BackgroundTransparency=0.92
divider1.BorderSizePixel=0;divider1.Parent=playerCard
local statsRow=Instance.new("Frame")statsRow.Size=UDim2.new(1,0,0,80);statsRow.LayoutOrder=3
statsRow.BackgroundTransparency=1;statsRow.Parent=playerCard
local statsLayout=Instance.new("UIListLayout")statsLayout.FillDirection=Enum.FillDirection.Horizontal
statsLayout.Padding=UDim.new(0,12);statsLayout.Parent=statsRow
local function statBox(title,value,icon)local box=Instance.new("Frame")box.Size=UDim2.new(0.5,-6,1,0);box.BackgroundColor3=Color3.fromRGB(25,25,30)box.BackgroundTransparency=0.5;box.Parent=statsRow
U.round(box,10)local boxPad=Instance.new("UIPadding")boxPad.PaddingLeft=UDim.new(0,14);boxPad.PaddingTop=UDim.new(0,12)boxPad.Parent=box
local boxIcon=Instance.new("ImageLabel")boxIcon.Size=UDim2.fromOffset(20,20);boxIcon.Image=icon
boxIcon.ImageColor3=Cfg.Colors.TextDim;boxIcon.BackgroundTransparency=1
boxIcon.Parent=box
local boxTitle=Instance.new("TextLabel")boxTitle.Size=UDim2.new(1,0,0,14);boxTitle.Position=UDim2.fromOffset(28,2)boxTitle.Text=title;boxTitle.TextColor3=Cfg.Colors.TextDim
boxTitle.TextSize=10;boxTitle.Font=Enum.Font.GothamBold
boxTitle.TextXAlignment=Enum.TextXAlignment.Left;boxTitle.BackgroundTransparency=1
boxTitle.Parent=box
local boxValue=Instance.new("TextLabel")boxValue.Size=UDim2.new(1,0,0,20);boxValue.Position=UDim2.fromOffset(0,36)boxValue.Text=value;boxValue.TextColor3=Color3.new(1,1,1)boxValue.TextSize=15;boxValue.Font=Enum.Font.GothamBold
boxValue.TextXAlignment=Enum.TextXAlignment.Left;boxValue.BackgroundTransparency=1
boxValue.Parent=box
end
statBox("DEVICE",getDeviceType(),"rbxassetid://10723407389")statBox("EXECUTOR",getExecutorName(),"rbxassetid://10723434711")local divider2=Instance.new("Frame")divider2.Size=UDim2.new(1,0,0,1);divider2.LayoutOrder=4
divider2.BackgroundColor3=Color3.new(1,1,1);divider2.BackgroundTransparency=0.92
divider2.BorderSizePixel=0;divider2.Parent=playerCard
local infoRow=Instance.new("Frame")infoRow.Size=UDim2.new(1,0,0,70);infoRow.LayoutOrder=5
infoRow.BackgroundTransparency=1;infoRow.Parent=playerCard
local infoLayout=Instance.new("UIListLayout")infoLayout.FillDirection=Enum.FillDirection.Horizontal
infoLayout.Padding=UDim.new(0,12);infoLayout.Parent=infoRow
local function infoBox(title,value)local box=Instance.new("Frame")box.Size=UDim2.new(0.333,-8,1,0);box.BackgroundColor3=Color3.fromRGB(25,25,30)box.BackgroundTransparency=0.5;box.Parent=infoRow
U.round(box,10)local boxLayout=Instance.new("UIListLayout")boxLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
boxLayout.VerticalAlignment=Enum.VerticalAlignment.Center
boxLayout.Padding=UDim.new(0,4);boxLayout.Parent=box
local boxTitle=Instance.new("TextLabel")boxTitle.Size=UDim2.new(1,0,0,14);boxTitle.Text=title
boxTitle.TextColor3=Cfg.Colors.TextDim;boxTitle.TextSize=10
boxTitle.Font=Enum.Font.GothamBold;boxTitle.BackgroundTransparency=1
boxTitle.Parent=box
local boxValue=Instance.new("TextLabel")boxValue.Size=UDim2.new(1,0,0,20);boxValue.Text=value
boxValue.TextColor3=Color3.new(1,1,1);boxValue.TextSize=16
boxValue.Font=Enum.Font.GothamBold;boxValue.BackgroundTransparency=1
boxValue.Parent=box
return boxValue
end
local maxPlayers=Players.MaxPlayers or 0
local currentPlayers=#Players:GetPlayers()local playersValue=infoBox("PLAYERS",currentPlayers.."/"..maxPlayers)local serverValue=infoBox("SERVER",getServerType())local sessionValue=infoBox("SESSION",getSessionTime())task.spawn(function()while sessionValue and sessionValue.Parent do
task.wait(1)if sessionValue and sessionValue.Parent then
sessionValue.Text=getSessionTime()end
end
end)Players.PlayerAdded:Connect(function()if playersValue and playersValue.Parent then
playersValue.Text=#Players:GetPlayers().."/"..maxPlayers
end
end)Players.PlayerRemoving:Connect(function()task.wait(0.1)if playersValue and playersValue.Parent then
playersValue.Text=#Players:GetPlayers().."/"..maxPlayers
end
end)local divider3=Instance.new("Frame")divider3.Size=UDim2.new(1,0,0,1);divider3.LayoutOrder=6
divider3.BackgroundColor3=Color3.new(1,1,1);divider3.BackgroundTransparency=0.92
divider3.BorderSizePixel=0;divider3.Parent=playerCard
local hwidRow=Instance.new("Frame")hwidRow.Size=UDim2.new(1,0,0,60);hwidRow.LayoutOrder=7
hwidRow.BackgroundTransparency=1;hwidRow.Parent=playerCard
local hwidTitle=Instance.new("TextLabel")hwidTitle.Size=UDim2.new(1,-40,0,14);hwidTitle.Text="HWID"
hwidTitle.TextColor3=Cfg.Colors.TextDim;hwidTitle.TextSize=10
hwidTitle.Font=Enum.Font.GothamBold;hwidTitle.TextXAlignment=Enum.TextXAlignment.Left
hwidTitle.BackgroundTransparency=1;hwidTitle.Parent=hwidRow
local realHwid=getHWID(data)local function maskHwid(hwid)return "**** **** **** ****"
end
local hwidValue=Instance.new("TextLabel")hwidValue.Size=UDim2.new(1,-40,0,20);hwidValue.Position=UDim2.fromOffset(0,20)hwidValue.Text=maskHwid(realHwid);hwidValue.TextColor3=Color3.new(1,1,1)hwidValue.TextSize=15;hwidValue.Font=Enum.Font.GothamBold
hwidValue.TextXAlignment=Enum.TextXAlignment.Left;hwidValue.BackgroundTransparency=1
hwidValue.Parent=hwidRow
local hwidCopy=Instance.new("TextButton")hwidCopy.Size=UDim2.fromOffset(32,32);hwidCopy.Position=UDim2.new(1,-32,0,14)hwidCopy.BackgroundColor3=Color3.fromRGB(35,35,40);hwidCopy.Text=""
hwidCopy.AutoButtonColor=false;hwidCopy.Parent=hwidRow
U.round(hwidCopy,8)local copyIcon=Instance.new("ImageLabel")copyIcon.Size=UDim2.fromOffset(16,16);copyIcon.Position=UDim2.fromScale(0.5,0.5)copyIcon.AnchorPoint=Vector2.new(0.5,0.5);copyIcon.Image="rbxassetid://116940172762649"
copyIcon.ImageColor3=Cfg.Colors.TextDim;copyIcon.BackgroundTransparency=1
copyIcon.Parent=hwidCopy
hwidCopy.MouseButton1Click:Connect(function()pcall(function()setclipboard(realHwid)end)Toast.show(screen,"HWID copied to clipboard!","success")end)local pricingHeader=Instance.new("TextLabel")pricingHeader.Size=UDim2.new(1,0,0,32);pricingHeader.LayoutOrder=1
pricingHeader.Text="Choose Your Plan";pricingHeader.TextColor3=Color3.new(1,1,1)pricingHeader.TextSize=24;pricingHeader.Font=Enum.Font.GothamBold
pricingHeader.TextXAlignment=Enum.TextXAlignment.Left;pricingHeader.BackgroundTransparency=1
pricingHeader.Parent=pricingPage
local pricingDesc=Instance.new("TextLabel")pricingDesc.Size=UDim2.new(1,0,0,18);pricingDesc.LayoutOrder=2
pricingDesc.Text="Select the perfect plan for your needs"
pricingDesc.TextColor3=Cfg.Colors.TextDim;pricingDesc.TextSize=13
pricingDesc.Font=Enum.Font.Gotham;pricingDesc.TextXAlignment=Enum.TextXAlignment.Left
pricingDesc.BackgroundTransparency=1;pricingDesc.Parent=pricingPage
local pricingCards=Instance.new("Frame")pricingCards.Size=UDim2.new(1,0,0,280);pricingCards.LayoutOrder=3
pricingCards.BackgroundTransparency=1;pricingCards.Parent=pricingPage
local cardsLayout=Instance.new("UIListLayout")cardsLayout.FillDirection=Enum.FillDirection.Horizontal
cardsLayout.SortOrder=Enum.SortOrder.LayoutOrder
cardsLayout.Padding=UDim.new(0,12);cardsLayout.Parent=pricingCards
local function pricingCard(order,title,subtitle,price,period,badge,features,btnText,highlighted)local cardFrame=Instance.new("Frame")cardFrame.Size=UDim2.new(0.25,-9,1,0);cardFrame.LayoutOrder=order
cardFrame.BackgroundColor3=highlighted and Color3.fromRGB(30,30,35)or Cfg.Colors.BgCard
cardFrame.BackgroundTransparency=highlighted and 0.3 or 0.7
cardFrame.Parent=pricingCards
if highlighted then
U.stroke(cardFrame,Cfg.Colors.Primary,1.5,0.7)else
U.stroke(cardFrame,Color3.new(1,1,1),1,0.93)end
local cardPad=Instance.new("UIPadding")cardPad.PaddingLeft=UDim.new(0,16);cardPad.PaddingRight=UDim.new(0,16)cardPad.PaddingTop=UDim.new(0,18);cardPad.PaddingBottom=UDim.new(0,18)cardPad.Parent=cardFrame
local cardList=Instance.new("UIListLayout")cardList.SortOrder=Enum.SortOrder.LayoutOrder;cardList.Padding=UDim.new(0,10)cardList.Parent=cardFrame
local titleRow=Instance.new("Frame")titleRow.Size=UDim2.new(1,0,0,20);titleRow.LayoutOrder=1
titleRow.BackgroundTransparency=1;titleRow.Parent=cardFrame
local titleLbl=Instance.new("TextLabel")titleLbl.Size=UDim2.new(1,-110,1,0);titleLbl.Text=title
titleLbl.TextColor3=Color3.new(1,1,1);titleLbl.TextSize=16
titleLbl.Font=Enum.Font.GothamBold;titleLbl.TextXAlignment=Enum.TextXAlignment.Left
titleLbl.BackgroundTransparency=1;titleLbl.Parent=titleRow
if badge then
local badgeFrame=Instance.new("Frame")badgeFrame.Size=UDim2.fromOffset(100,20);badgeFrame.Position=UDim2.new(1,0,0,0)badgeFrame.AnchorPoint=Vector2.new(1,0);badgeFrame.BackgroundColor3=Cfg.Colors.Primary
badgeFrame.BackgroundTransparency=0.85;badgeFrame.Parent=titleRow
U.round(badgeFrame,6)local badgeLayout=Instance.new("UIListLayout")badgeLayout.FillDirection=Enum.FillDirection.Horizontal
badgeLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
badgeLayout.VerticalAlignment=Enum.VerticalAlignment.Center
badgeLayout.Padding=UDim.new(0,5);badgeLayout.Parent=badgeFrame
local sparklesIcon=Instance.new("ImageLabel")sparklesIcon.Size=UDim2.fromOffset(12,12);sparklesIcon.Image=Icons.Sparkles
sparklesIcon.ImageColor3=Cfg.Colors.Primary;sparklesIcon.BackgroundTransparency=1
sparklesIcon.Parent=badgeFrame
local badgeTxt=Instance.new("TextLabel")badgeTxt.Size=UDim2.fromOffset(0,20);badgeTxt.AutomaticSize=Enum.AutomaticSize.X
badgeTxt.Text=badge;badgeTxt.TextColor3=Cfg.Colors.Primary
badgeTxt.TextSize=9;badgeTxt.Font=Enum.Font.GothamBold
badgeTxt.BackgroundTransparency=1;badgeTxt.Parent=badgeFrame
end
local subtitleLbl=Instance.new("TextLabel")subtitleLbl.Size=UDim2.new(1,0,0,14);subtitleLbl.LayoutOrder=2
subtitleLbl.Text=subtitle;subtitleLbl.TextColor3=Cfg.Colors.TextDim
subtitleLbl.TextSize=11;subtitleLbl.Font=Enum.Font.Gotham
subtitleLbl.TextXAlignment=Enum.TextXAlignment.Left;subtitleLbl.BackgroundTransparency=1
subtitleLbl.Parent=cardFrame
local priceRow=Instance.new("Frame")priceRow.Size=UDim2.new(1,0,0,32);priceRow.LayoutOrder=3
priceRow.BackgroundTransparency=1;priceRow.Parent=cardFrame
local priceLayout=Instance.new("UIListLayout")priceLayout.FillDirection=Enum.FillDirection.Horizontal
priceLayout.SortOrder=Enum.SortOrder.LayoutOrder
priceLayout.VerticalAlignment=Enum.VerticalAlignment.Bottom
priceLayout.Padding=UDim.new(0,4);priceLayout.Parent=priceRow
local priceLbl=Instance.new("TextLabel")priceLbl.Size=UDim2.fromOffset(0,32);priceLbl.AutomaticSize=Enum.AutomaticSize.X
priceLbl.Text=price;priceLbl.TextColor3=Color3.new(1,1,1)priceLbl.TextSize=28;priceLbl.Font=Enum.Font.GothamBold
priceLbl.TextXAlignment=Enum.TextXAlignment.Left;priceLbl.BackgroundTransparency=1
priceLbl.Parent=priceRow
local periodLbl=Instance.new("TextLabel")periodLbl.Size=UDim2.fromOffset(0,20);periodLbl.AutomaticSize=Enum.AutomaticSize.X
periodLbl.Text=period;periodLbl.TextColor3=Cfg.Colors.TextDim
periodLbl.TextSize=12;periodLbl.Font=Enum.Font.Gotham
periodLbl.TextXAlignment=Enum.TextXAlignment.Left;periodLbl.BackgroundTransparency=1
periodLbl.Parent=priceRow
local btnRow=Instance.new("Frame")btnRow.Size=UDim2.new(1,0,0,36);btnRow.LayoutOrder=4
btnRow.BackgroundTransparency=1;btnRow.Parent=cardFrame
local startBtn=Instance.new("TextButton")startBtn.Size=UDim2.fromScale(1,1)startBtn.BackgroundColor3=Cfg.Colors.Primary
startBtn.BackgroundTransparency=1
startBtn.Text="";startBtn.AutoButtonColor=false;startBtn.Parent=btnRow
U.round(startBtn,8)local gradientBg=Instance.new("Frame")gradientBg.Size=UDim2.fromScale(1,1);gradientBg.BackgroundColor3=Cfg.Colors.Primary
gradientBg.BorderSizePixel=0;gradientBg.ZIndex=1;gradientBg.Parent=startBtn
U.round(gradientBg,8)U.gradient(gradientBg,90,ColorSequence.new{ColorSequenceKeypoint.new(0,Cfg.Colors.PrimaryHi),ColorSequenceKeypoint.new(1,Cfg.Colors.Primary),})local btnContent=Instance.new("Frame")btnContent.Size=UDim2.fromScale(1,1);btnContent.BackgroundTransparency=1
btnContent.ZIndex=2;btnContent.Parent=startBtn
local btnLayout=Instance.new("UIListLayout")btnLayout.FillDirection=Enum.FillDirection.Horizontal
btnLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
btnLayout.VerticalAlignment=Enum.VerticalAlignment.Center
btnLayout.Padding=UDim.new(0,6);btnLayout.Parent=btnContent
local btnIcon=Instance.new("ImageLabel")btnIcon.Size=UDim2.fromOffset(16,16);btnIcon.Image="rbxassetid://116757051177690"
btnIcon.ImageColor3=Color3.new(1,1,1);btnIcon.BackgroundTransparency=1
btnIcon.ZIndex=2;btnIcon.Parent=btnContent
local btnTextLbl=Instance.new("TextLabel")btnTextLbl.Size=UDim2.fromOffset(0,16);btnTextLbl.AutomaticSize=Enum.AutomaticSize.X
btnTextLbl.Text=btnText;btnTextLbl.TextColor3=Color3.new(1,1,1)btnTextLbl.TextSize=12;btnTextLbl.Font=Enum.Font.GothamBold
btnTextLbl.BackgroundTransparency=1;btnTextLbl.ZIndex=2;btnTextLbl.Parent=btnContent
for i,feature in ipairs(features)do
local featRow=Instance.new("Frame")featRow.Size=UDim2.new(1,0,0,20);featRow.LayoutOrder=4+i
featRow.BackgroundTransparency=1;featRow.Parent=cardFrame
local checkIcon=Instance.new("ImageLabel")checkIcon.Size=UDim2.fromOffset(14,14);checkIcon.Position=UDim2.new(0,0,0,3)checkIcon.Image=Icons.CheckPremium
checkIcon.ImageColor3=Cfg.Colors.Primary
checkIcon.BackgroundTransparency=1;checkIcon.Parent=featRow
local featTxt=Instance.new("TextLabel")featTxt.Size=UDim2.new(1,-20,1,0);featTxt.Position=UDim2.fromOffset(20,0)featTxt.Text=feature;featTxt.TextColor3=Cfg.Colors.TextDim
featTxt.TextSize=11;featTxt.Font=Enum.Font.Gotham
featTxt.TextXAlignment=Enum.TextXAlignment.Left;featTxt.TextWrapped=true
featTxt.BackgroundTransparency=1;featTxt.Parent=featRow
end
startBtn.MouseButton1Click:Connect(function()pcall(function()setclipboard(KEY_WEBSITE)end)Toast.show(screen,"Opening pricing page...","info")end)end
pricingCard(1,"Starter","Perfect for Testing","$0.50","/ day",nil,{"Full script execution","Instant HWID resets","Automatic updates","No long term commitment"},"Start now")pricingCard(2,"Farmer","High Volume Operations","$1.99","/ weekly",nil,{"Full script execution","Priority execution allocation","Dedicated Farmer account","Automatic updates"},"Start now")pricingCard(3,"Pro","Most Popular Choice","$2.99","/ monthly","BEST VALUE",{"Everything in Weekly","Priority crash report handling","Extended HWID Resets","Early access to new features"},"Start now",true)pricingCard(4,"Lifetime","Maximum Savings","$6.99","/ lifetime",nil,{"Everything in Monthly","Full Loaded","VIP support & treatment","Beta access to experimental features"},"Start now")local currentTab="key"
local sideButtons={{btn=keyBtn,icon=keyIcon,page=keyPage,name="key"},{btn=pricingBtn,icon=pricingIcon,page=pricingPage,name="pricing"},{btn=shieldBtn,icon=shieldIcon,page=shieldPage,name="shield"},}local function switchTab(targetName)if currentTab==targetName then return end
for _,tab in ipairs(sideButtons)do
if tab.name==currentTab then
tab.page.Visible=false
end
end
currentTab=targetName
for _,tab in ipairs(sideButtons)do
local isActive=tab.name==targetName
U.tween(tab.btn,{BackgroundTransparency=isActive and 0.85 or 1},0.2)U.tween(tab.icon,{ImageColor3=isActive and Cfg.Colors.Primary or Cfg.Colors.TextDim},0.2)if isActive then
tab.page.Visible=true
if tab.page:IsA("ScrollingFrame")then
tab.page.CanvasPosition=Vector2.new(0,0)end
local originalPos=tab.page.Position
tab.page.Position=UDim2.new(originalPos.X.Scale,originalPos.X.Offset,originalPos.Y.Scale,originalPos.Y.Offset+30)tab.page.BackgroundTransparency=1
U.tween(tab.page,{Position=originalPos,BackgroundTransparency=1},0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)for _,child in ipairs(tab.page:GetChildren())do
if child:IsA("GuiObject")then
local origTrans=child.BackgroundTransparency
child.BackgroundTransparency=1
task.delay(0.1,function()U.tween(child,{BackgroundTransparency=origTrans},0.3)end)end
end
end
end
end
keyBtn.MouseButton1Click:Connect(function()switchTab("key")end)pricingBtn.MouseButton1Click:Connect(function()switchTab("pricing")end)shieldBtn.MouseButton1Click:Connect(function()switchTab("shield")end)local bottomDivider=Instance.new("Frame")bottomDivider.Size=UDim2.new(1,-55,0,1);bottomDivider.Position=UDim2.new(0,55,1,-32)bottomDivider.BackgroundColor3=Color3.new(1,1,1);bottomDivider.BackgroundTransparency=0.92
bottomDivider.BorderSizePixel=0;bottomDivider.ZIndex=2;bottomDivider.Parent=main
local footerBar=Instance.new("Frame");footerBar.Size=UDim2.new(1,-55,0,32)footerBar.Position=UDim2.new(0,55,1,-32);footerBar.BackgroundTransparency=1
footerBar.BorderSizePixel=0;footerBar.Parent=main
local footerPad=Instance.new("UIPadding")footerPad.PaddingLeft=UDim.new(0,18);footerPad.PaddingRight=UDim.new(0,18)footerPad.PaddingTop=UDim.new(0,0);footerPad.PaddingBottom=UDim.new(0,0)footerPad.Parent=footerBar
local timeLbl=Instance.new("TextLabel");timeLbl.Size=UDim2.new(0,80,1,0)timeLbl.Position=UDim2.new(0,0,0,0)timeLbl.Text=os.date("%I:%M %p")timeLbl.TextColor3=Cfg.Colors.TextDim;timeLbl.TextSize=10.5;timeLbl.Font=Enum.Font.Gotham
timeLbl.TextXAlignment=Enum.TextXAlignment.Left;timeLbl.BackgroundTransparency=1;timeLbl.Parent=footerBar
task.spawn(function()while timeLbl and timeLbl.Parent do
timeLbl.Text=os.date("%I:%M %p")task.wait(30)end
end)local gameName=game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local gameLbl=Instance.new("TextLabel");gameLbl.Size=UDim2.new(1,-160,1,0)gameLbl.Position=UDim2.new(0,80,0,0)gameLbl.Text=gameName
gameLbl.TextColor3=Cfg.Colors.TextDim;gameLbl.TextSize=11;gameLbl.Font=Enum.Font.GothamMedium
gameLbl.TextXAlignment=Enum.TextXAlignment.Center;gameLbl.BackgroundTransparency=1;gameLbl.Parent=footerBar
local spinConn
local function SetStatus(state,customText)if spinConn then spinConn:Disconnect();spinConn=nil;sImg.Rotation=0 end
local col=Cfg.Colors.Primary;local ico=Icons.Info;local txt="No key detected"
local bgTrans=0.85;local strokeTrans=0.5
if state=="verifying" then
col=Color3.fromRGB(59,130,246);ico=Icons.Spinner;txt=customText or "Verifying access"
bgTrans=0.85;strokeTrans=0.5
spinConn=RunService.Heartbeat:Connect(function(dt)if not sImg or not sImg.Parent then if spinConn then spinConn:Disconnect()end;return end
sImg.Rotation=(sImg.Rotation+dt*360)%360
end)elseif state=="success" then
col=Color3.fromRGB(34,197,94);ico=Icons.CheckCircle;txt=customText or "Access Granted"
bgTrans=0.85;strokeTrans=0.5
elseif state=="error" then
col=Color3.fromRGB(239,68,68);ico=Icons.ErrorCircle;txt=customText or "Invalid Key"
bgTrans=0.85;strokeTrans=0.5
elseif state=="warning" then
col=Color3.fromRGB(234,179,8);ico=Icons.Warning;txt=customText or "Key expired"
bgTrans=0.85;strokeTrans=0.5
end
U.tween(sVal,{TextColor3=col},0.35)U.tween(sImg,{ImageColor3=col},0.35)U.tween(statusIndicator,{BackgroundColor3=col,BackgroundTransparency=bgTrans},0.35)U.tween(statusStroke,{Color=col,Transparency=strokeTrans},0.35)sVal.Text=txt;sImg.Image=ico
end
local function hideAndRun(isPremium)SetBlur(false)U.tween(main,{Position=UDim2.new(0.5,0,0.5,120),BackgroundTransparency=1},0.7,Enum.EasingStyle.Exponential,Enum.EasingDirection.In)U.tween(shadow,{ImageTransparency=1},0.7)task.delay(0.7,function()screen:Destroy()local ok,errMsg=loadScript(isPremium)if ok then
Notify("Success","Script loaded successfully",Color3.fromRGB(0,255,100))else
Notify("Error",errMsg or "Execution failed",Color3.fromRGB(255,170,0))end
end)end
task.spawn(function()local savedKey=data.savedKey
if savedKey and savedKey~="" then
box.Text=savedKey
SetStatus("verifying","Verifying saved key...")redeemTxt.Text="...";redeem.Active=false
local result=verifyKey(data,savedKey)redeem.Active=true;redeemTxt.Text="Verify Key"
if result.success and result.valid then
local isPremium=(savedKey:sub(1,2)=="JH")local statusText
if isPremium then
statusText="Valid • PREMIUM"
else
statusText=string.format("Valid • %s",(result.provider or "FREE"):upper())end
SetStatus("success",statusText)if result.timeLeft then
ttlLbl.Text="Time left: "..tostring(result.timeLeft);ttlLbl.Visible=true
end
local tierText=isPremium and "PREMIUM" or "FREE"
Toast.show(screen,"Auto-login successful! ("..tierText..")","success")task.wait(0.8);hideAndRun(isPremium)else
if result.expired or result.hwidMismatch or not result.success then
data.savedKey=nil
saveData(data)box.Text=""
end
if result.expired then
SetStatus("warning","Key expired")Toast.show(screen,"Key expired! Get a new one from website","warning")elseif result.hwidMismatch then
SetStatus("error","Key bound to another device")Toast.show(screen,"Key bound to another device! Contact support","error")else
SetStatus("warning","Saved key invalid")Toast.show(screen,"Saved key invalid, please re-enter","warning")end
end
end
end)redeem.MouseButton1Click:Connect(function()local keyString=box.Text:gsub("%s+","")if keyString=="" then Toast.show(screen,"Please enter a key first","warning");return end
SetStatus("verifying");redeemTxt.Text="...";redeem.Active=false
local result=verifyKey(data,keyString)redeem.Active=true;redeemTxt.Text="Verify Key"
if result.success and result.valid then
data.savedKey=keyString
saveData(data)local isPremium=(keyString:sub(1,2)=="JH")local statusText
if isPremium then
statusText="Valid • PREMIUM"
else
local detectedProvider=result.provider or "FREE"
statusText=string.format("Valid • %s",detectedProvider:upper())end
if result.bound then statusText=statusText.."" end
SetStatus("success",statusText)if result.timeLeft then
ttlLbl.Text="Time left: "..tostring(result.timeLeft);ttlLbl.Visible=true
end
local tierText=isPremium and "PREMIUM" or "FREE"
Toast.show(screen,"Access granted! ("..tierText..")","success")task.wait(0.8);hideAndRun(isPremium)elseif result.hwidMismatch then
SetStatus("error","Key bound to another device")Toast.show(screen,"Key bound to another device! Contact support.","error")elseif result.expired then
SetStatus("warning","Key expired")Toast.show(screen,"Key expired! Please renew from website.","warning")else
SetStatus("error","Invalid Key")Toast.show(screen,result.error or result.message or "Invalid key","error")end
end)getKey.MouseButton1Click:Connect(function()pcall(function()setclipboard(KEY_WEBSITE)end)pcall(function()if syn then syn.request({Url=KEY_WEBSITE,Method="GET"})end
end)Toast.show(screen,"Link Get-Key copied to clipboard!","success")end)main.Position=UDim2.new(0.5,0,0.5,120);main.BackgroundTransparency=1
shadow.ImageTransparency=1
U.tween(main,{Position=UDim2.new(0.5,0,0.5,20),BackgroundTransparency=0},0.9,Enum.EasingStyle.Exponential)U.tween(shadow,{Position=UDim2.new(0.5,0,0.5,20),ImageTransparency=0.4},0.9,Enum.EasingStyle.Exponential)local dragging,dragStart,startPos
topBar.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true;dragStart=i.Position;startPos=main.Position end
end)UserInputService.InputChanged:Connect(function(i)if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
local d=i.Position-dragStart
local newPos=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)main.Position=newPos
shadow.Position=newPos
end
end)UserInputService.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end
end)return screen
end
Build()