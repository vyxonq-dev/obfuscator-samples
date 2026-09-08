-- [[ The Battle Bricks Projectile Modifier by JKG ]] --
if game.PlaceId~=10834586502 then return end
getgenv().ProjectileAuraConfig=getgenv().ProjectileAuraConfig or {}
local Config=getgenv().ProjectileAuraConfig
Config.IHATEYOUSOMUCH=Config.IHATEYOUSOMUCH or {Enabled=true,Betty=true,Warhead=true}
Config.Theseshouldntbetargettedimo=Config.Theseshouldntbetargettedimo or {Enabled=true,Punishment=true,Bloodhorn=true}
Config.RandomizedProjectiles={Enabled=true,List={}}
Config.WCP=Config.WCP or {StrongesTarget={},WeakesTarget={},RandomisTarget={},UserDeletProj={}}
if getgenv().ProjectileAuraLoaded then return end
getgenv().ProjectileAuraLoaded=true

local Rayfield=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window=Rayfield:CreateWindow({Name="The Battle Bricks Latest Projectile Modifier",LoadingTitle="The Battle Bricks Projectile Modifier",LoadingSubtitle="by JKG",ConfigurationSaving={Enabled=false}})

local orN=Rayfield.Notify
Rayfield.Notify=function(o) orN(o) task.defer(function() local cg=game:GetService("CoreGui") local rg=cg:FindFirstChild("Rayfield") or cg:FindFirstChild("RayfieldUI") if rg then for _,d in ipairs(rg:GetDescendants()) do if (d:IsA("TextButton") or d:IsA("ImageButton") or d:IsA("Frame")) and (d.Name:lower():find("notify") or d.Name:lower():find("notification")) then d.Active=false end end end end) end

local AnnTab=Window:CreateTab("Announcements",4483362458)
AnnTab:CreateSection("Project Information")
AnnTab:CreateParagraph({Title="Thank You So Much!",Content="A massive thank you to everyone executing and using our scripts! Crossing thousands of executions means the absolute world to me, and seeing all of you enjoy the tools we build together makes all the tedious projectile hunting totally worth it. You guys are awesome!"})
AnnTab:CreateParagraph({Title="Announcement warning or stuff",Content="This project includes every single projectile in the TBB (The Battle Bricks) game. The UI has been streamlined to focus on performance and cleaner user preferences. Huge credit and regards to AbsolutelyNoldea for the inspiration, while the rest of the script and projectile remodeling work was proudly engineered by me and the team!"})
AnnTab:CreateSection("Changelog")
AnnTab:CreateParagraph({Title="Updates",Content="Sorting Updates 1.0\n\nThe Projectile toggles have been sorted out from A to Z for easy accessing. Have fun with your preferences my friends!"})
AnnTab:CreateParagraph({Title="Update 1.1",Content="Added a brand new Automation tab to streamline your gameplay, featuring global slot spamming, individual slot toggles, and auto bank upgrading for ultimate efficiency!"})
AnnTab:CreateParagraph({Title="Update 1.2",Content="- Renamed tabs to StrongesTarget and WeakesTarget with mutual-exclusive states\n- Fixed Strongest to continuous CFrame and Weakest/Random to single-teleport execution on spawn\n- Added CrossbowArrow and BloodCrystal variants to enemy deletion system\n- Consolidated StunPellet naming normalization"})
AnnTab:CreateParagraph({Title="Update 1.2.1",Content="- Patched minor remote execution stability issues during heavy slot spamming sequences\n- Resolved edge-case memory leaks linked to lingering rayfield UI notification instances"})
AnnTab:CreateParagraph({Title="Update 1.3.1",Content="- Restructured WCP architecture for UserDeletProj mode\n- Fixed UserDeletProj behavior so deleted projectiles are correctly set to no-collision, non-touch, and offset to -100Y instead of incorrectly spam-teleporting to enemies\n- Integrated dedicated tracking loops and strict variant normalization for cleaner execution"})
AnnTab:CreateParagraph({Title="Update 1.4",Content="- Added FrostBall to deletion system and FireTeapot to projectile selection tabs\n- Hardcoded collision logic to explicitly turn off CanCollide and CanTouch for all projectiles"})

local StrongesTargetTab=Window:CreateTab("StrongesTarget",4483362458) StrongesTargetTab:CreateSection("Strongest Target Projectile Auras")
local WeakesTargetTab=Window:CreateTab("WeakesTarget",4483362458) WeakesTargetTab:CreateSection("Weakest Target Projectile Auras")
local RandomisTargetTab=Window:CreateTab("RandomisTarget",4483362458) RandomisTargetTab:CreateSection("Random Target Projectile Auras")
local UserDeletProjTab=Window:CreateTab("UserDeletProj",4483362458) UserDeletProjTab:CreateSection("User Delet Projectiles (Unused Mode)")
local DeletEneProjTab=Window:CreateTab("DeletEneProj",4483362458) DeletEneProjTab:CreateSection("Delete Enemy Projectiles")
local AutomationTab=Window:CreateTab("Automation",4483362458) AutomationTab:CreateSection("Slot & Economy Automation")

local Workspace,RunService,ReplicatedStorage=game:GetService("Workspace"),game:GetService("RunService"),game:GetService("ReplicatedStorage")
local EnemyFolder=Workspace:WaitForChild("NPCFolders"):WaitForChild("EnemyFolder")
local ProjectileFolder=Workspace:WaitForChild("Projectile")

local trackedStrongest,trackedWeakest,trackedRandom,trackedUserDelet,deletionProjectiles={},{},{},{},{}
Config.WCP.StrongesTarget,Config.WCP.WeakesTarget,Config.WCP.RandomisTarget,Config.WCP.UserDeletProj=trackedStrongest,trackedWeakest,trackedRandom,trackedUserDelet

local block,timerRemaining,isActive=nil,0,false
local projectileModes={}
local toggleUpdateFuncs={Strongest={},Weakest={},Random={},UserDeletProj={}}
local spamSlotsEnabled,autoBankEnabled=false,false
local slotList={"Slot1","Slot2","Slot3","Slot4","Slot5","Slot6","Slot7","Slot8"}
local individualSlotStates={Slot1=false,Slot2=false,Slot3=false,Slot4=false,Slot5=false,Slot6=false,Slot7=false,Slot8=false}

AutomationTab:CreateToggle({Name="Spam All Slots",CurrentValue=false,Callback=function(s) spamSlotsEnabled=s Rayfield:Notify({Title=s and "Spam Enabled" or "Spam Disabled",Content="Slot spamming is now "..(s and "ON" or "OFF"),Duration=2,Image=4483362458}) end})
AutomationTab:CreateToggle({Name="Auto Bank",CurrentValue=false,Callback=function(s) autoBankEnabled=s Rayfield:Notify({Title=s and "Auto Bank Enabled" or "Auto Bank Disabled",Content="Auto bank upgrading is now "..(s and "ON" or "OFF"),Duration=2,Image=4483362458}) end})
AutomationTab:CreateSection("--slot choice--")
for i=1,8 do local sn="Slot"..i AutomationTab:CreateToggle({Name="spam slot "..i,CurrentValue=false,Callback=function(s) individualSlotStates[sn]=s Rayfield:Notify({Title=s and "Slot Enabled" or "Slot Disabled",Content=sn.." spam is now "..(s and "ON" or "OFF"),Duration=2,Image=4483362458}) end}) end

local function GetValidEnemies() local l={} for _,e in ipairs(EnemyFolder:GetChildren()) do local h,r=e:FindFirstChild("Humanoid"),e:FindFirstChild("HumanoidRootPart") if h and h.Health>0 and r and not (Config.Theseshouldntbetargettedimo.Enabled and Config.Theseshouldntbetargettedimo[e.Name]) then table.insert(l,e) end end return l end
local function GetStrongestEnemy() local l=GetValidEnemies() if #l==0 then return nil end local se,mh=nil,-1 for _,e in ipairs(l) do local h=e:FindFirstChild("Humanoid") if h then local th=h.MaxHealth+h.Health if th>mh then mh,se=th,e end end end return se or l[1] end
local function GetWeakestEnemy() local l=GetValidEnemies() if #l==0 then return nil end local we,mh=nil,math.huge for _,e in ipairs(l) do local h=e:FindFirstChild("Humanoid") if h then local th=h.MaxHealth+h.Health if th<mh then mh,we=th,e end end end return we or l[1] end
local function GetRandomEnemy() local l=GetValidEnemies() if #l==0 then return nil end return l[math.random(1,#l)] end
local function GetMainTarget(m) if Config.IHATEYOUSOMUCH.Enabled then for _,e in ipairs(EnemyFolder:GetChildren()) do if Config.IHATEYOUSOMUCH[e.Name] and e:FindFirstChild("Humanoid") and e.Humanoid.Health>0 then return e end end end if m=="Weakest" then return GetWeakestEnemy() elseif m=="Random" then return GetRandomEnemy() else return GetStrongestEnemy() end end
local function NormalizeProjectileName(n) if n=="StunPellet" or n=="Stunpellet" then return (ProjectileFolder:FindFirstChild("StunPellet") and "StunPellet" or "Stunpellet") elseif n=="CoalFist" or n=="Coalfist" then return (ProjectileFolder:FindFirstChild("CoalFist") and "CoalFist" or "Coalfist") end return n end

local activeDeletionToggles={}
local function checkDeletion(p) local an=NormalizeProjectileName(p.Name) if activeDeletionToggles[an] or activeDeletionToggles[p.Name] then p.Anchored=true p.CanCollide=false p.CanTouch=false deletionProjectiles[p]=true return end end
local function Setup(p) p.CanCollide=false p.CanTouch=false p.Massless,p.Transparency=true,1 p.AssemblyLinearVelocity=Vector3.zero end

local singleTeleportedProjectiles={}
local function ProcessProjectileSpawn(c,am) 
    if am=="UserDeletProj" then 
        pcall(function() c.Anchored=true c.CanCollide=false c.CanTouch=false c.Transparency=1 c.CFrame=c.CFrame+Vector3.new(0,-100,0) end) 
        trackedUserDelet[c]=true trackedStrongest[c]=nil trackedWeakest[c]=nil trackedRandom[c]=nil singleTeleportedProjectiles[c]=nil 
    else 
        Setup(c) trackedUserDelet[c]=nil 
        if am=="Strongest" then trackedStrongest[c]=true trackedWeakest[c]=nil trackedRandom[c]=nil 
        elseif am=="Weakest" then trackedWeakest[c]=true trackedStrongest[c]=nil trackedRandom[c]=nil if not singleTeleportedProjectiles[c] then singleTeleportedProjectiles[c]=true task.defer(function() local t=GetMainTarget("Weakest") if t and t:FindFirstChild("HumanoidRootPart") and c and c.Parent then c.CFrame=t.HumanoidRootPart.CFrame end end) end 
        elseif am=="Random" then trackedRandom[c]=true trackedStrongest[c]=nil trackedWeakest[c]=nil if not singleTeleportedProjectiles[c] then singleTeleportedProjectiles[c]=true task.defer(function() local t=GetMainTarget("Random") if t and t:FindFirstChild("HumanoidRootPart") and c and c.Parent then c.CFrame=t.HumanoidRootPart.CFrame end end) end end 
    end
    Config.WCP.StrongesTarget,Config.WCP.WeakesTarget,Config.WCP.RandomisTarget,Config.WCP.UserDeletProj=trackedStrongest,trackedWeakest,trackedRandom,trackedUserDelet
end

ProjectileFolder.ChildAdded:Connect(function(c) if not c:IsA("BasePart") then return end checkDeletion(c) local pn=NormalizeProjectileName(c.Name) if c.Name=="StoneFist" or c.Name=="Teapot" or c.Name=="FireTeapot" then if not block then block=Instance.new("Part",Workspace) block.Anchored,block.Transparency,block.Size,block.CFrame=true,1,Vector3.new(6,6,6),CFrame.new(0,-0.25,1.23) end timerRemaining,isActive=0.8,true elseif projectileModes[pn] or projectileModes[c.Name] then ProcessProjectileSpawn(c,projectileModes[pn] or projectileModes[c.Name]) end end)
for _,v in ipairs(ProjectileFolder:GetChildren()) do if v:IsA("BasePart") then checkDeletion(v) local pn=NormalizeProjectileName(v.Name) if projectileModes[pn] or projectileModes[v.Name] then ProcessProjectileSpawn(v,projectileModes[pn] or projectileModes[v.Name]) end end end

RunService.Heartbeat:Connect(function(dt)
    if spamSlotsEnabled then pcall(function() local pse=ReplicatedStorage.Events.RemoteFunction.PlayerSpawn for _,sn in ipairs(slotList) do task.spawn(function() pse:InvokeServer(sn) end) end end) else pcall(function() local pse=ReplicatedStorage.Events.RemoteFunction.PlayerSpawn for sn,en in pairs(individualSlotStates) do if en then task.spawn(function() pse:InvokeServer(sn) end) end end end) end
    if autoBankEnabled then pcall(function() local pse=ReplicatedStorage.Events.RemoteFunction.PlayerSpawn task.spawn(function() pse:InvokeServer("Bank") end) end) end
    for p,_ in pairs(deletionProjectiles) do if p and p.Parent then local an=NormalizeProjectileName(p.Name) if activeDeletionToggles[an] or activeDeletionToggles[p.Name] then pcall(function() p.CanCollide=false p.CanTouch=false p.CFrame=p.CFrame+Vector3.new(0,-100,0) end) else deletionProjectiles[p]=nil end else deletionProjectiles[p]=nil end end
    if isActive then timerRemaining=timerRemaining-dt isActive=timerRemaining>0 end
end)

RunService.Heartbeat:Connect(function() for p,_ in pairs(trackedStrongest) do if not p or not p.Parent then trackedStrongest[p]=nil else local t=GetMainTarget("Strongest") if t and t:FindFirstChild("HumanoidRootPart") then p.CFrame=t.HumanoidRootPart.CFrame; p.CanCollide=false; p.CanTouch=false end end end end)
RunService.Heartbeat:Connect(function() for p,_ in pairs(trackedWeakest) do if not p or not p.Parent then trackedWeakest[p]=nil else pcall(function() p.CanCollide=false; p.CanTouch=false end) end end end)
RunService.Heartbeat:Connect(function() for p,_ in pairs(trackedRandom) do if not p or not p.Parent then trackedRandom[p]=nil else pcall(function() p.CanCollide=false; p.CanTouch=false end) end end end)
RunService.Heartbeat:Connect(function() for p,_ in pairs(trackedUserDelet) do if not p or not p.Parent then trackedUserDelet[p]=nil else pcall(function() p.Anchored=true p.CanCollide=false p.CanTouch=false p.CFrame=p.CFrame+Vector3.new(0,-100,0) end) end end end)

local projectileNamesList={"Bacon","Basketball","Bigfireball","BigFireball","BigIceball","BigRocket","BigStunpellet","Brew","CesusBomb","Cesuspot","Cola","CrimsonBall","Duck","ElectricFist","EvilDuck","FireTeapot","Fireball","Goala","Goobab","Grenade","Iceball","Kunai","LabTable","LilCesuspot","MagicBall","Molotov","NeonEvilDuck","Noir","NoirBiograft","Paintball","Pellet","Puck","Rocket","Shuriken","Soccerball","SorcusBlade","SorcusEgg","StunPellet","Superball","SuperSorcusBlade","TumorePellet","Volleyball","WoodArrow"}
table.sort(projectileNamesList)

local function handleToggleChange(pn,tm,s) 
    local apn=NormalizeProjectileName(pn) 
    if s then 
        projectileModes[apn]=tm projectileModes[pn]=tm 
        for mn,f in pairs(toggleUpdateFuncs) do if mn~=tm then if f[pn] then f[pn](false,true) end if f[apn] then f[apn](false,true) end end end 
        for _,v in ipairs(ProjectileFolder:GetChildren()) do if v:IsA("BasePart") and (v.Name==pn or NormalizeProjectileName(v.Name)==apn) then ProcessProjectileSpawn(v,tm) end end 
    else 
        if projectileModes[pn]==tm or projectileModes[apn]==tm then 
            projectileModes[pn]=nil projectileModes[apn]=nil 
            for _,v in ipairs(ProjectileFolder:GetChildren()) do if v:IsA("BasePart") and (v.Name==pn or NormalizeProjectileName(v.Name)==apn) then trackedStrongest[v]=nil trackedWeakest[v]=nil trackedRandom[v]=nil trackedUserDelet[v]=nil singleTeleportedProjectiles[v]=nil end end 
        end 
    end 
end

for _,pn in ipairs(projectileNamesList) do
    projectileModes[pn]=projectileModes[pn] or "Strongest"
    local toStrong=StrongesTargetTab:CreateToggle({Name=pn,CurrentValue=(projectileModes[pn]=="Strongest"),Callback=function(s) handleToggleChange(pn,"Strongest",s) end})
    toggleUpdateFuncs.Strongest[pn]=function(s,i) if i and toStrong.Set then pcall(function() toStrong:Set(s) end) end end
    local toWeak=WeakesTargetTab:CreateToggle({Name=pn,CurrentValue=(projectileModes[pn]=="Weakest"),Callback=function(s) handleToggleChange(pn,"Weakest",s) end})
    toggleUpdateFuncs.Weakest[pn]=function(s,i) if i and toWeak.Set then pcall(function() toWeak:Set(s) end) end end
    local toRand=RandomisTargetTab:CreateToggle({Name=pn,CurrentValue=(projectileModes[pn]=="Random"),Callback=function(s) handleToggleChange(pn,"Random",s) end})
    toggleUpdateFuncs.Random[pn]=function(s,i) if i and toRand.Set then pcall(function() toRand:Set(s) end) end end
    local toUserDel=UserDeletProjTab:CreateToggle({Name=pn,CurrentValue=(projectileModes[pn]=="UserDeletProj"),Callback=function(s) handleToggleChange(pn,"UserDeletProj",s) end})
    toggleUpdateFuncs.UserDeletProj[pn]=function(s,i) if i and toUserDel.Set then pcall(function() toUserDel:Set(s) end) end end
end

local deletionProjectilesList={"Arrow","BigGhostwalker","BigHellBall","BigHellball","Biggerrocket","BiggerRocket","BloodCrystal","Coal","CoalFist","CrossbowArrow","ElectricRock","EpicKatana","EpicKunai","Execnade","ExplodeCannonBall","Flashbang","FreedomRocket","FrostBall","Ghostwalker","GlowBoxingGlove","GrandPiano","Hand","HellHand","Hellhand","HellRocket","Hellball","Hellrocket","HyperBomb","Hyperlaser","Ipecac","LabTable","Landmine","LightBomb","MisterSkull","Paintnade","Piano","PirateJuice","Rock","RottenEgg","SmallStar","SuperExplodeCannonBall","SuperStar","ThrowingAxe","TinyBomb","TNT","TrollPie","ZetaRocket","ZombieBomb"}
table.sort(deletionProjectilesList)
activeDeletionToggles={}
for _,dn in ipairs(deletionProjectilesList) do
    activeDeletionToggles[dn]=true
    DeletEneProjTab:CreateToggle({Name=dn,CurrentValue=true,Callback=function(s)
        activeDeletionToggles[dn]=s
        for _,v in ipairs(ProjectileFolder:GetChildren()) do if v:IsA("BasePart") and (v.Name==dn or NormalizeProjectileName(v.Name)==dn) then if s then v.Anchored=true v.CanCollide=false v.CanTouch=false deletionProjectiles[v]=true else deletionProjectiles[v]=nil end end end
        Rayfield:Notify({Title=s and "Deletion Enabled" or "Deletion Disabled",Content=dn.." auto-delete is now "..(s and "ON" or "OFF"),Duration=2,Image=4483362458})
    end})
end
