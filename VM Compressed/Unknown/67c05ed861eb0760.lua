local K="https://discord.gg/yeSdcttDF8" local V="skylimit365"
local P,S,L,G=game:GetService("Players"),game:GetService("TweenService"),game:GetService("Lighting"),game:GetService("Players").LocalPlayer
local GUI=G:WaitForChild("PlayerGui")
local BLUR=Instance.new("BlurEffect") BLUR.Size=0 BLUR.Name="SkyScriptsBlur" BLUR.Parent=L
S:Create(BLUR,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=20}):Play()

local SG=Instance.new("ScreenGui") SG.Name="SkyScriptsKeySystem" SG.IgnoreGuiInset=true SG.ResetOnSpawn=false SG.Parent=GUI
local BG=Instance.new("Frame") BG.Size=UDim2.new(1,0,1,0) BG.BackgroundColor3=Color3.fromRGB(10,0,15) BG.BackgroundTransparency=1 BG.Parent=SG
local BGGrad=Instance.new("UIGradient") BGGrad.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,0,50)),ColorSequenceKeypoint.new(1,Color3.fromRGB(10,0,20))} BGGrad.Rotation=45 BGGrad.Parent=BG

local FR=Instance.new("Frame") FR.Size=UDim2.new(0,420,0,280) FR.Position=UDim2.new(0.5,-210,0.5,-140) FR.BackgroundColor3=Color3.fromRGB(25,0,45) FR.BackgroundTransparency=0.6 FR.BorderSizePixel=0 FR.ClipsDescendants=true FR.Visible=false FR.Parent=BG
local CR,ST,GR=Instance.new("UICorner"),Instance.new("UIStroke"),Instance.new("UIGradient")
CR.CornerRadius=UDim.new(0,20) CR.Parent=FR
ST.Thickness=2 ST.Color=Color3.fromRGB(120,80,200) ST.Transparency=0.3 ST.Parent=FR
GR.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(90,50,160)),ColorSequenceKeypoint.new(1,Color3.fromRGB(130,80,210))} GR.Rotation=45 GR.Parent=FR

local TL=Instance.new("TextLabel") TL.Text="SkyScripts 🌃" TL.Font=Enum.Font.GothamBold TL.TextSize=32 TL.TextColor3=Color3.fromRGB(255,255,255) TL.Position=UDim2.new(0,0,0,25) TL.Size=UDim2.new(1,0,0,35) TL.BackgroundTransparency=1 TL.Parent=FR
local SUB=Instance.new("TextLabel") SUB.Text="Enter your access key to continue" SUB.Font=Enum.Font.Gotham SUB.TextSize=15 SUB.TextColor3=Color3.fromRGB(180,180,220) SUB.Position=UDim2.new(0,0,0,60) SUB.Size=UDim2.new(1,0,0,20) SUB.BackgroundTransparency=1 SUB.Parent=FR

local TB=Instance.new("TextBox") TB.PlaceholderText="Enter Key Here" TB.Text="" TB.Size=UDim2.new(0,300,0,40) TB.Position=UDim2.new(0.5,-150,0,100) TB.BackgroundColor3=Color3.fromRGB(45,0,70) TB.BackgroundTransparency=0.25 TB.TextColor3=Color3.fromRGB(255,255,255) TB.Font=Enum.Font.Gotham TB.TextSize=17 TB.ClearTextOnFocus=false TB.PlaceholderColor3=Color3.fromRGB(180,150,220) TB.Parent=FR
local TBC=Instance.new("UICorner") TBC.CornerRadius=UDim.new(0,10) TBC.Parent=TB
local TBS=Instance.new("UIStroke") TBS.Thickness=1.5 TBS.Color=Color3.fromRGB(130,90,210) TBS.Transparency=0.4 TBS.Parent=TB

local function BTN(TXT,XOFF,COLOR)local B=Instance.new("TextButton") B.Text=TXT B.Size=UDim2.new(0,135,0,40) B.Position=UDim2.new(0.5,XOFF,0,165) B.BackgroundColor3=COLOR B.TextColor3=Color3.fromRGB(255,255,255) B.Font=Enum.Font.GothamBold B.TextSize=17 B.AutoButtonColor=false B.Parent=FR local C=Instance.new("UICorner") C.CornerRadius=UDim.new(0,10) C.Parent=B local D=Instance.new("UIStroke") D.Thickness=1.3 D.Color=Color3.fromRGB(255,255,255) D.Transparency=0.9 D.Parent=B return B end
local SUBM=BTN("Unlock",-155,Color3.fromRGB(80,40,150))
local DIS=BTN("Join Discord",20,Color3.fromRGB(60,20,120))

local INF=Instance.new("TextLabel") INF.Text="🗝️ JOIN DISCORD TO GET KEY" INF.Font=Enum.Font.GothamMedium INF.TextSize=14 INF.TextColor3=Color3.fromRGB(180,160,220) INF.Position=UDim2.new(0.5,-100,0,215) INF.Size=UDim2.new(0,200,0,25) INF.BackgroundTransparency=1 INF.TextTransparency=0.05 INF.Parent=FR

local function HVR(BTN,COLOR) BTN.MouseEnter:Connect(function() S:Create(BTN,TweenInfo.new(0.25),{BackgroundColor3=COLOR:Lerp(Color3.fromRGB(130,80,210),0.3)}):Play() end) BTN.MouseLeave:Connect(function() S:Create(BTN,TweenInfo.new(0.25),{BackgroundColor3=COLOR}):Play() end) end
HVR(SUBM,Color3.fromRGB(80,40,150))
HVR(DIS,Color3.fromRGB(60,20,120))

local function NOTIFY(TXT)local N=Instance.new("TextLabel") N.Text=TXT N.Font=Enum.Font.GothamBold N.TextSize=16 N.TextColor3=Color3.fromRGB(255,255,255) N.BackgroundColor3=Color3.fromRGB(45,0,75) N.BackgroundTransparency=0.15 N.Size=UDim2.new(0,260,0,35) N.Position=UDim2.new(0.5,-130,0.3,0) N.Parent=SG N.TextTransparency=1 N.BackgroundTransparency=1 local C=Instance.new("UICorner") C.CornerRadius=UDim.new(0,10) C.Parent=N S:Create(N,TweenInfo.new(0.3),{TextTransparency=0,BackgroundTransparency=0.15}):Play() task.wait(1.8) S:Create(N,TweenInfo.new(0.5),{TextTransparency=1,BackgroundTransparency=1}):Play() task.wait(0.6) N:Destroy() end

FR.Visible=true FR.BackgroundTransparency=1 TL.TextTransparency=1 SUB.TextTransparency=1 TB.TextTransparency=1 SUBM.TextTransparency=1 DIS.TextTransparency=1 INF.TextTransparency=1
local FDT=0.8 S:Create(FR,TweenInfo.new(FDT),{BackgroundTransparency=0.6}):Play() S:Create(TL,TweenInfo.new(FDT),{TextTransparency=0}):Play() S:Create(SUB,TweenInfo.new(FDT+0.2),{TextTransparency=0}):Play() S:Create(TB,TweenInfo.new(FDT+0.2),{TextTransparency=0}):Play() S:Create(SUBM,TweenInfo.new(FDT+0.3),{TextTransparency=0}):Play() S:Create(DIS,TweenInfo.new(FDT+0.3),{TextTransparency=0}):Play() S:Create(INF,TweenInfo.new(FDT+0.4),{TextTransparency=0.05}):Play()

local function VALID() NOTIFY("✅ Key accepted!") S:Create(BLUR,TweenInfo.new(0.5),{Size=0}):Play() task.wait(0.5) BLUR:Destroy() SG:Destroy() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5eb08ffffc36b5fc8b948351cbe7b0ad.lua"))() end

SUBM.MouseButton1Click:Connect(function()
    local TXT=TB.Text or ""
    local TRIM=TXT:match("^%s*(.-)%s*$") or ""
    if TRIM:lower()==V:lower() then VALID() else TB.Text="" TB.PlaceholderText="❌ Invalid Key!" TB.PlaceholderColor3=Color3.fromRGB(255,100,100) NOTIFY("❌ Invalid Key! Try again.") end
end)

DIS.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(K) elseif toclipboard then toclipboard(K) else warn("Clipboard not supported") end
    NOTIFY("📋 Discord link copied to clipboard!")
end)
