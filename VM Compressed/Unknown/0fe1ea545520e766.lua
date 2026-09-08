local gui=Instance.new("ScreenGui")

gui.Name="Private Gui"

gui.Parent=game:GetService("CoreGui")

local Ui=Instance.new("Frame")

Ui.Size=UDim2.new(0,393,0,300)

Ui.Position=UDim2.new(0,180,0,0)

Ui.BackgroundColor3=Color3.fromRGB(128,128,128)

Ui.BorderColor3=Color3.new(0,0,0)

Ui.BorderSizePixel=3

Ui.Active=true

Ui.Draggable=true

Ui.Parent=gui

local TextLabel=Instance.new("TextLabel")

TextLabel.Size=UDim2.new(1,0,0,40)

TextLabel.Position=UDim2.new(0,0,0,0)

TextLabel.BackgroundColor3=Color3.fromRGB(128,128,128)

TextLabel.BorderColor3=Color3.new(0,0,0)

TextLabel.BorderSizePixel=3

TextLabel.Text="Poject leak v200"

TextLabel.TextColor3=Color3.new(0,0,0)

TextLabel.TextScaled=true

TextLabel.Font=Enum.Font.Legacy

TextLabel.Parent=Ui

local page=1

local perPage=12

local scripts={

    {"project x00lkidd", "https://pastefy.app/CphcsD2t/raw"},

    {"epikguy v2 (leak)","https://pastebin.com/raw/C4fGK6Wb"},

    {"Bombvest v1","https://raw.githubusercontent.com/LuaGunsX/LuasLegacyScripts/refs/heads/main/%5BRecharacter%5D%20Bomb%20Vest"},

    {"SSP Dex Explorer Version", "https://raw.githubusercontent.com/AbuRiffian/None-of-youre-buissness/refs/heads/main/idk"},

    {"SSP","https://pastebin.com/raw/Eu81WV9S"},

    {"SSP Made by Erased_Luah4x","https://raw.githubusercontent.com/ProBypasserHax1/Idkkk/refs/heads/main/SSP%20BY%20ME.lua"},

    {"project 0xNu51 gui v1","https://pastefy.app/bH19KGX8/raw"},

    {"Stummy Guns","https://pastebin.com/raw/3XPaYv08"},

    {"Obunga","https://pastefy.app/ORe0fQ07/raw"},

    {"Polaria By 00de0l","https://pastefy.app/agqEB2qs/raw"},

    {"MLG 2520 Gun","https://rawscripts.net/raw/Client-Replication-the-ss-loadstring-script-27393"},

    {"project broken Spawn","https://pastebin.com/raw/NyJfL0ey"},

    {"Elsyian Executor","https://pastebin.com/raw/CsFAQyXr"},

    {"Anonymous Particlez","particle"},

    {"Mario.exe","https://pastebin.com/raw/Ljz3fwU2"},

    {"project s3cr3t (real)","https://pastefy.app/dMdu0dKu/raw"},

    {"Project s3cr3t","https://rscripts.net/raw/project-s3cr3t-remake-by-the-secret_1759578609967_zDHt2Rspx6.txt"},    {"Project Duck Ultimate","https://pastefy.app/RX1PYZs1/raw"},

    {"FE Hax GUI V2.0.2.1","https://pastebin.com/raw/gr3XZwUY"},

    {"project 0xNu51 gui v2","https://pastefy.app/yfyLePYR/raw"},

    {"Super Uper Duper Private Gui by c00lkid","https://pastebin.com/raw/nTCk1iMw"},

    {"Superx and L00L Private Gui (No Trade!)","https://pastebin.com/raw/DmM6JmsH"},

    {"L00L X Superx Gui (No Trade and No Script!)","https://pastebin.com/raw/Q02wdXef"},

    {"Private Gui By Cle0n","https://pastebin.com/raw/dPMidMa3"},

    {"Private Gui by 005n5n77","https://pastebin.com/raw/MPNijDsd"},

    {"project robloxian","https://pastefy.app/oiKUHYmV/raw"},

    {"L00L Private Gui V1","https://pastebin.com/raw/9iQErXHG"},

    {"Sznkidd Private Gui","https://pastebin.com/raw/Ub6QVJXn"},

    {"Private Gui Super Private Gui by Anonymous","https://pastebin.com/raw/BDguUuUx"},

    {"Project Fire V1.1 By Polemenus","https://pastebin.com/raw/a79VQ4ex"},

    {"Private Gui 1.35","https://raw.githubusercontent.com/Hanif290/DigsaeyAiijjllnvv/refs/heads/main/Aiisisndndsn"},

    {"Super Private Gui by Sigmaz","https://raw.githubusercontent.com/Hanif290/SigmaHubV2/refs/heads/main/SigmaHubV2"},

    {"Private Gui by Hanif","https://raw.githubusercontent.com/Hanif290/SigmaHub/refs/heads/main/SigmaHub"},

    {"Sigma Gui (Private GUI)","https://pastes.io/raw/private-53"},

    {"Asder10065 Gui","https://pastebin.com/raw/56j42jkA"},

    {"Private Gui by 005n5n77 1.5","https://pastebin.com/raw/9XSYjVrm"},

    {"1x1x1x1x1 Super Private Gui v5.40","https://pastebin.com/raw/ERRk4rvM"},

    {"Testing Hub By QnDx aka Polpy_Kid","https://pastebin.com/raw/ERRk4rvM"},

    {"SUGMA_V1","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/Sugma%20V1.txt"},

    {"Project LuaCore Serverside","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/yesking"},

    {"R15 to R6","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/AOIWruw823rpo8n30"},

    {"Project LuaCore SS","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/Project%20LuaCore%20SS"},

    {"Prison Life Hub By Shedletsky","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/Shed%20Prison%20Hax"},

    {"Anonymous Gui Reborn","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/Anonymous%20Reborn%20By%2007n7z"},

    {"LuaMayGay V2 Made By 07n7z","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/LuaMayGayV2.txt"},

    {"LuaMayGay Made By LuaCore","https://raw.githubusercontent.com/sigmaballs4141/asd/refs/heads/main/LuaMayGay%204"},

    {"Erased_Luah4x Gui Private","https://pastebin.com/raw/yARPDt3k"},

    {"Thomas The Dank Engine","https://raw.githubusercontent.com/Sugm4Bullet1/LuaXXccL/refs/heads/main/Thomas"},

    {"John Doe SS","https://raw.githubusercontent.com/Sugm4Bullet1/LuaXXccL/refs/heads/main/johndoeSS.txt"},

    {"Nazz Gui","https://raw.githubusercontent.com/Sugm4Bullet1/LuaXXccL/refs/heads/main/nazz%20gui.txt"},

    {"Polaria By 00de0l [UPDATED]","https://raw.githubusercontent.com/Sugm4Bullet1/LuaXXccL/refs/heads/main/pol%20(2).txt"},

    {"Syntex Backdoor V1.2.0","https://raw.githubusercontent.com/etgaby33/sb1.2.0/refs/heads/main/sb1.2.0lua.txt"},

    {"Dominat v5.0.1","https://raw.githubusercontent.com/Sugm4Bullet1/LuaXXccL/refs/heads/main/dominatv5.0.1.txt"},

    {"C00LGUI","https://raw.githubusercontent.com/LuaGunsX/LuasLegacyScripts/refs/heads/main/%5BGUI%5D%20c00lgui"},

    {"Project Lua","https://rawscripts.net/raw/Universal-Script-Project-Lua-Inspired-by-Project-Ligma-26224"},

    {"Project Ligma", "https://rawscripts.net/raw/Universal-Script-Project-Ligma-REMADE-31235"},

    {"Grab Knife v1", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V1.lua"},

    {"Grab Knife v2", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V2.lua"},

    {"Grab Knife v3","https://rawscripts.net/raw/Universal-Script-grab-knife-v3-9232"},

    {"Grab Knife v4", "https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/Grab%20V4.txt"},

    {"Project Euphoria [Old]","https://raw.githubusercontent.com/TEST19983/Realrhejrj/refs/heads/main/Refjf"},

    {"Rc7 Cloud","https://pastebin.com/raw/DK9PK8Xu"},

    {"Bladed Lightning Dark Titan","https://raw.githubusercontent.com/gitezgitgit/Dark-Titan/refs/heads/main/DARK%20TITAN%20SCRIPT%20SUPER%20RARE.txt"},

    {"Hatai Gui","https://gist.githubusercontent.com/hataifnx/009dc18d58f8f7044fbc08c353f2f058/raw/9224a43566424ec2edd2f9286855acf004fc4c54/Hatai%2520Gui"},

    {"Dreambull Gui","https://rawscripts.net/raw/Universal-Script-FE-Bypass-idk-32121"},

    {"Jeff The Killer Jumpscare","https://rawscripts.net/raw/Universal-Script-Jeff-The-Killer-JumpScare-27384"},

    {"Shedletsky","https://pastebin.com/raw/QaGn1ekv"},

    {"Mr Bean Admin","https://raw.githubusercontent.com/Test4267/mrbean/refs/heads/main/hh"},

    {"Ro-xploit VH","https://gist.githubusercontent.com/hataifnx/0b72277731e6bc6a0f05ef90aa4ba9ab/raw/a5ebe0184ca9acbf8af79f3c0e943f3457b95247/Ro-xploit%2520vh"},

    {"External GU1! By Anonymous XR","https://pastefy.app/4GLMKcft/raw"},

    {"SG GUI RED EDITION","https://raw.githubusercontent.com/gitezgitgit/SG-GUI-RED-EDITION/refs/heads/main/FixedVersion"},

    {"SG GUI BLUE EDITION", "https://raw.githubusercontent.com/gitezgitgit/SG-GUI-COLOR-EDITIONS/refs/heads/main/Blue%20Edition"},

    {"Robot","https://pastefy.app/ur8n4dc6/raw"},

    {"Titan","https://raw.githubusercontent.com/TEST19983/Reslasjd/refs/heads/main/attac"},

    {"Big Smoke","https://raw.githubusercontent.com/LuaGunsX/LuasLegacyScripts/refs/heads/main/%5BRecharacter%5D%20Big%20Smoke"},

    {"Lua Hammer","https://pastefy.app/Nh7FVtvC/raw"},

    {"Dual Tentacle Railgun Demon Monster","https://raw.githubusercontent.com/TEST19983/Assigment/refs/heads/main/Assignment"},

    {"Nebula Star Glitcher","https://pastebin.com/raw/j09BnGB3"},

    {"John Doe","https://rawscripts.net/raw/Client-Replication-Join-doe-script-uploaded-by-gojohdkaisenkt-me-34101"},

    {"AK-47","https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ak47"},

    {"Minecraft Steve","https://raw.githubusercontent.com/Test4267/steve/refs/heads/main/rare"},

    {"Proximity Hub Max 15 [Proximity6H]","https://raw.githubusercontent.com/HyperionV8/Proximity-Private-Hub/refs/heads/main/obfuscated_script-1745069419608.lua.txt"},

    {"Private GUI By 00de0l","loadstring(game:HttpGet(\"https://ghostplayer352.github.io/Authorization/\"))()Ioad(\"0d730785a30393bb8bc13e9a8d72a0d3\")"},

    {"Private GUI By 00de0l [UPDATED]","https://pastefy.app/cVm0LBiJ/raw"},

    {"Scary Ronald McDonald", "https://raw.githubusercontent.com/HappyCow91/RobloxScripts/refs/heads/main/ClientSided/clown.lua"},

    {"3xen0kidd GUI [3xen0guibyl1000l]", "https://pastebin.com/raw/MMUX0irp"},

    {"MLG Particles", "https://pastebin.com/raw/ZPzjyL1M"},

    {"Spookyify", "https://pastefy.app/OvBb8y2T/raw"},

    {"1x1x1x1's FE GUI (Client-Sided)","https://raw.githubusercontent.com/MrWitzbold/1x1x1x1-Gui/refs/heads/main/main.lua"},

    {"Elysian 2.0 GUI (Client-Sided)","https://raw.githubusercontent.com/MrWitzbold/Elysian-2.0-GUI/refs/heads/main/main.lua"},

    {"Bill Cipher GUI (Client-Sided)","https://raw.githubusercontent.com/MrWitzbold/Bill-Cipher-GUI/refs/heads/main/Bill%20Cipher%20GUI%20(Client-Sided).lua"},

    {"RC7 Reawakened (Cilent-Sided)", "https://raw.githubusercontent.com/MrWitzbold/RC7_GUI/refs/heads/main/main.lua"},

    {"Sirhurt GUI (Cilent-Sided)", "https://raw.githubusercontent.com/MrWitzbold/sirhurt_GUI/refs/heads/main/main.lua"},

    {"Good Cop Bad Cop", "https://raw.githubusercontent.com/nicolasbarbosa323/good-cop-bad-coop/refs/heads/main/KwuminKa.txt"},

    {"Gaster Hands", "https://raw.githubusercontent.com/nicolasbarbosa323/good-cop-bad-coop/refs/heads/main/GasterHands.txt"},

    {"Ban Hammer", "https://raw.githubusercontent.com/nicolasbarbosa323/ban-hammer/refs/heads/main/ban"},

    {"Xester", "https://raw.githubusercontent.com/nicolasbarbosa323/xester/refs/heads/main/qC7MUFRJ.txt"},

    {"Grakkeda", "https://raw.githubusercontent.com/nicolasbarbosa323/grakkeda/refs/heads/main/Roblox%20Genkadda%20omega%20leaked.txt"},

    {"Spectrum Glitcher", "https://raw.githubusercontent.com/nicolasbarbosa323/SCPECTRUMGLITCHER/refs/heads/main/SpectrumG%20(1).txt"},

    {"Kirito Blades", "https://raw.githubusercontent.com/nicolasbarbosa323/the-angel/refs/heads/main/Kirito%20Blades.txt"},

    {"The Angel", "https://raw.githubusercontent.com/nicolasbarbosa323/the-angel/refs/heads/main/The%20Angel.txt"},

    {"Vereus", "https://raw.githubusercontent.com/nicolasbarbosa323/xester/refs/heads/main/fLrx77PM.txt"},

    {"SpiderBot", "https://pastebin.com/raw/XNVWznPH"},

    {"Ravanger Claws", "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/reevenge%20hands.txt"},

    {"Kitchen Gun", "https://raw.githubusercontent.com/nicolasbarbosa323/rare/refs/heads/main/kitcher%20gun.lua"},

    {"Suicide Gun", "https://pastebin.com/raw/TQGaAivj"},

    {"Touch Me For Boom", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Touch%20Me%20For%20Boom.txt"},

    {"Master Hand", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/MasterHand.txt"},

    {"Green Tank", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Green%20Tank.txt"},

    {"Bridge Tool", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Bridge%20Tool.txt"},

    {"PipeBomb Launcher", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/PipeBomb%20Launcher.txt"},

    {"Spawn KillBot", "https://raw.githubusercontent.com/GooberDoesStuff/RandomClientRep/refs/heads/main/Killbot.lua"},

    {"D!CK_Gun", "https://pastefy.app/Tq7G80Tr/raw"},

    {"S#s Neko", "https://raw.githubusercontent.com/GooberDoesStuff/RandomClientRep/refs/heads/main/Neko.lua"},

    {"Yellow Man", "https://pastebin.com/raw/funfBi9a"},

    {"True Hero ULTIMATE", "https://pastebin.com/raw/m7r4Qeu1"},

    {"Warhammer", "https://pastebin.com/raw/XcpT3qyM"},

    {"Neko Knuckles", "https://pastebin.com/raw/gYt5K4k5"},

    {"Sin Dragon", "https://raw.githubusercontent.com/gitezgitgit/Sin-Dragon/refs/heads/main/Sin%20Dragon.lua.txt"},

    {"Sin Unleashed", "https://raw.githubusercontent.com/gitezgitgit/Sin-Unleashed/refs/heads/main/Sin%20Unleashed.lua.txt"},

    {"Project 44033514", "https://raw.githubusercontent.com/gitezgitgit/Project-2044033514/refs/heads/main/Project%2044033514.lua.txt"},

    {"Goner", "https://raw.githubusercontent.com/nicolasbarbosa323/crytasl/refs/heads/main/goner.lua.txt"},

    {"Plasma Cutters", "https://rawscripts.net/raw/Prison-Life-Plasma-Cutters-18936"},

    {"DB Shotgun", "https://pastefy.app/1RhJtgDi/raw"},

    {"Lightsaber [Q to use]", "https://pastefy.app/bpIeO2df/raw"},

    {"Noob Bat", "https://pastefy.app/Dnifbxu1/raw"},

    {"White And Dark Titan", "https://pastebin.com/raw/Tf8zhZ4w"},

    {"Explosive Robot", "https://pastefy.app/ebiRyCkx/raw"},

    {"3D Maneuver Gear Script [Based off Attack on Titan]", "https://pastebin.com/raw/Hh1ghmb9"},

    {"Gay Face", "https://pastebin.com/raw/Maai0Pxu"},

    {"9/11 Plane [W to move forward]", "https://pastebin.com/raw/5saVhNKb"},

    {"One Punch Man", "https://pastebin.com/raw/QySEAhP5"},

    {"Pennywise The Dancing Clown [Q to be Invisible E to Laugh]", "https://pastebin.com/raw/A4f22qvS"},

    {"Psychopath", "https://pastebin.com/raw/UQU0BB95"},

    {"Bloody Knight", "https://pastebin.com/raw/QLYF1nbt"},

    {"Red Trail Scythe", "https://pastebin.com/raw/KPYbrH1C"},

    {"Dev-Uzi", "https://pastebin.com/raw/PCuUb3jm"},

    {"Goofy Sans", "https://pastebin.com/raw/PCeZC5MV"},

    {"Absalom [Armored]", "https://pastebin.com/raw/vQnEfN7K"},

    {"Bird Wings", "https://pastebin.com/raw/zm3e6eFT"},

    {"Shadow Ravanger Claws", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Shadow%20Ravager.lua"},

    {"Trap Gun", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Trap%20Gun.lua"},

    {"The Banisher", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Banisher.lua"},

    {"Death Note", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Death%20Note.lua"},

    {"Time Blast", "https://pastefy.app/ULKMFpKj/raw"},

    {"TF2 Spy", "https://pastefy.app/hhIgut1H/raw"},

    {"Book Of Wisdom", "https://pastefy.app/ozN3eBE6/raw"},

    {"Freddy Fazbear", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/FreddyFazBear.txt"},

    {"Dual Pistols", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Dual%20Pistols.txt"},

    {"Spawn Giant Cannoneer Nub", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Cannoneer%20Noob.txt"},

    {"Dominus Scythe", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Scythe.txt"},

    {"Lemonade Drink", "https://pastefy.app/NO77ODmW/raw"},

    {"Placeholder", "https://pastefy.app/CtVFoMMq/raw"},

    {"Project Ligma By goodRc7", "https://raw.githubusercontent.com/gitezgitgit/Project-Ligma-Remake/refs/heads/main/ProjectLigmaRemakeObfuscated.txt"},

    {"STIGMA DUD GUI", "https://pastebin.com/raw/fryTaDhZ"},

    {"YourMom By SethMilkman Gui", "https://pastebin.com/raw/cfxYDH0N"},

    {".x.n0 g.i.", "https://pastebin.com/raw/L9Tw2uBw"},

    {"1x1x1x1x1 Ultimate Private Gui v7.10", "https://pastefy.app/tsPrm5Ky/raw"},

    {"Proximity Hub [M16]", "https://raw.githubusercontent.com/16visionzXTA/proxipizza/refs/heads/main/proxihvc9928.txt"},

    {"16visionzX Scripts Tab", "https://raw.githubusercontent.com/16visionzXTA/proxiwaffle/refs/heads/main/obfuscated_script-1746577182464.lua.txt"},

    {"Rocky2u's Admin", "https://pastebin.com/raw/zzNfYtEh"},

    {"Project SonicElijahMania", "https://raw.githubusercontent.com/gitezgitgit/Project-SonicElijahMania/refs/heads/main/By%20SonicElijahMania%20On%20YouTube"},

}

local totalPages=math.ceil(#scripts/perPage)

local buttons={}

local backBtn,nextBtn

local function clearButtons()

    for _,b in ipairs(buttons)do b:Destroy()end

    buttons={}

end

local function loadPage()

    clearButtons()

    local startIdx=(page-1)*perPage+1

    local endIdx=math.min(page*perPage,#scripts)

    local btnY=50

    for i=startIdx,endIdx do

        local name,url=unpack(scripts[i])

        local idx=i-startIdx

        local col=math.floor(idx/6)

        local row=idx%6

        local btn=Instance.new("TextButton")

        btn.Size=UDim2.new(0,180,0,28)

        btn.Position=UDim2.new(0,10+col*190,0,btnY+row*32)

        btn.BackgroundColor3=Color3.fromRGB(128,128,128)

        btn.BorderColor3=Color3.new(0,0,0)

        btn.BorderSizePixel=1

        btn.Text=name

        btn.TextColor3=Color3.new(0,0,0)

        btn.TextScaled=true

        btn.Font=Enum.Font.Legacy

        btn.Parent=Ui

        btn.MouseButton1Click:Connect(function()

            if url=="particle"then

                for _,p in ipairs(game.Players:GetPlayers())do

                    local char=p.Character or p.CharacterAdded:Wait()

                    local torso=char:FindFirstChild("Torso")or char:FindFirstChild("UpperTorso")

                    if torso then

                        local pe=Instance.new("ParticleEmitter")

                        pe.Texture="http://www.roblox.com/asset/?id=127476787"

                        pe.VelocitySpread=60

                        pe.Parent=torso

                    end

                end

            else

                loadstring(game:HttpGet(url,true))()

            end

        end)

        table.insert(buttons,btn)

    end

    local yPosNav=btnY+6*32+10

    if not backBtn then

        backBtn=Instance.new("TextButton")

        backBtn.Size=UDim2.new(0,80,0,28)

        backBtn.Text="< Back"

        backBtn.TextColor3=Color3.new(0,0,0)

        backBtn.BackgroundColor3=Color3.fromRGB(128,128,128)

        backBtn.BorderColor3=Color3.new(0,0,0)

        backBtn.BorderSizePixel=1

        backBtn.Font=Enum.Font.Legacy

        backBtn.TextScaled=true

        backBtn.Parent=Ui

        backBtn.MouseButton1Click:Connect(function()

            if page>1 then

                page=page-1

                loadPage()

            end

        end)

    end

    backBtn.Position=UDim2.new(0,10,0,yPosNav)

    backBtn.Visible=page>1

    if not nextBtn then

        nextBtn=Instance.new("TextButton")

        nextBtn.Size=UDim2.new(0,80,0,28)

        nextBtn.Text="Next >"

        nextBtn.TextColor3=Color3.new(0,0,0)

        nextBtn.BackgroundColor3=Color3.fromRGB(128,128,128)

        nextBtn.BorderColor3=Color3.new(0,0,0)

        nextBtn.BorderSizePixel=1

        nextBtn.Font=Enum.Font.Legacy

        nextBtn.TextScaled=true

        nextBtn.Parent=Ui

        nextBtn.MouseButton1Click:Connect(function()

            if page<totalPages then

                page=page+1

                loadPage()

            end

        end)

    end

    nextBtn.Position=UDim2.new(1,-90,0,yPosNav)

    nextBtn.Visible=page<totalPages

end

loadPage() 