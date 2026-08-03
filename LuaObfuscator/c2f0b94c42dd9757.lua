--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--[[
.____                  ________ .    _____                           __
|    |    __ _______   __  _ |/ _ __  ______ ____ _____ /  |  ___________
|    |   |  |  _  \   /   |   | __ \   \  |  /  // \  \   /  _ _  __ \
|    ||  |  // __ /    |    \ \ \  | |  |  / \  _ / __ |  | (  <> )  | /
| /(  /_______  /___  /| |//  >_  >____  /|  /||
/          /         /    /                /     /     /
_Welcome to LuaObfuscator.com   (Alpha 0.10.6) ~  Much Love, Ferib and Emanu

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v18,v19) local v20={};for v55=1, #v18 do v6(v20,v0(v4(v1(v2(v18,v55,v55 + 1 )),v1(v2(v19,1 + (v55% #v19) ,1 + (v55% #v19) + 1 )))%256 ));end return v5(v20);end local function v8() local function v21(v56) if v56:IsA(v7("\225\209\212\61\239\182\206\10\200\243\201\42\235\171\211","\126\177\163\187\69\134\219\167")) then local v78=0 + 0 ;local v79;while true do if (v78==(0 + 0)) then v79=146 -(80 + 66) ;while true do if (v79==(0 -0)) then v56.HoldDuration=0 -0 ;v56.MaxActivationDistance=3 + 5 ;break;end end break;end end end end local function v22(v57,v58) local v59=Instance.new(v7("\1\196\38\201\254\44\204\56\193\219\54\196","\156\67\173\74\165"));v59.Adornee=v57;v59.Size=UDim2.new(1,0 -0 ,754 -(239 + 514) ,0);v59.AlwaysOnTop=true;local v63=Instance.new(v7("\18\165\72\27\185","\38\84\215\41\118\220\70"),v59);v63.Size=UDim2.new(1 + 0 ,0,1,1329 -(797 + 532) );v63.BackgroundColor3=v58;v63.BorderSizePixel=0 + 0 ;v59.Parent=v57;return v59;end local function v23(v68) local v69=0;local v70;local v71;while true do if (v69==(0 + 0)) then v21(v68);v70=v68.Parent;v69=2 -1 ;end if (v69==1) then v71=v22(v70,Color3.new(1203 -(373 + 829) ,731 -(476 + 255) ,0));v68.Triggered:Connect(function() v71.Frame.Visible=false;end);break;end end end local function v24(v72) for v75,v76 in ipairs(v72:GetChildren()) do local v77=1130 -(369 + 761) ;while true do if (v77==(0 + 0)) then if (v76:IsA(v7("\96\4\45\10\247\93\31\54\11\206\66\25\47\2\234","\158\48\118\66\114")) and (v76.Name==v7("\132\38\26\51\112\177\242\189\33\32\36\124\168\235\191","\155\203\68\112\86\19\197"))) then v23(v76);end v24(v76);break;end end end end local function v25(v73) local v74=0;while true do if (v74==(0 -0)) then if (v73:IsA(v7("\118\207\57\228\73\117\236\236\95\237\36\243\77\104\241","\152\38\189\86\156\32\24\133")) and (v73.Name==v7("\211\85\173\67\255\67\174\80\249\103\181\73\241\71\179","\38\156\55\199"))) then v23(v73);end v73.ChildAdded:Connect(v25);v74=1;end if ((1 -0)==v74) then v24(v73);break;end end end workspace.ChildAdded:Connect(v25);v24(workspace);end local function v9() local v26=238 -(64 + 174) ;local v27;local v28;local v29;while true do if (v26==(1 + 1)) then v29=nil;function v29(v88) local v89=0;local v90;while true do if (v89==0) then v90=0;while true do if (v90==1) then v28(v88);break;end if (v90==0) then if (v88:IsA(v7("\139\68\198\184\51\93\57\213\162\102\219\175\55\64\36","\161\219\54\169\192\90\48\80")) and (v88.Name==v7("\102\64\10\32\74\86\9\51\76\114\18\42\68\82\20","\69\41\34\96"))) then v27(v88);end v88.ChildAdded:Connect(v29);v90=1 -0 ;end end break;end end end v26=3;end if ((336 -(144 + 192))==v26) then v27=nil;function v27(v91) fireproximityprompt(v91,2538 -(42 + 174) );end v26=1 + 0 ;end if (v26==(1 + 0)) then local v80=0 + 0 ;while true do if (v80==0) then v28=nil;function v28(v138) for v142,v143 in ipairs(v138:GetChildren()) do local v144=1504 -(363 + 1141) ;while true do if (v144==(1580 -(1183 + 397))) then if (v143:IsA(v7("\152\111\115\48\26\121\243\87\177\77\110\39\30\100\238","\35\200\29\28\72\115\20\154")) and (v143.Name==v7("\54\189\219\218\142\56\61\15\186\225\205\130\33\36\13","\84\121\223\177\191\237\76"))) then v27(v143);end v28(v143);break;end end end end v80=1;end if (v80==(2 -1)) then v26=2;break;end end end if ((3 + 0)==v26) then workspace.ChildAdded:Connect(v29);v28(workspace);break;end end end local function v10() local v30=0 + 0 ;local v31;local v32;local v33;local v34;while true do if (v30==2) then function v33(v92) local v93=v92:FindFirstChild(v7("\234\47\55\227\221\190\216","\202\171\92\71\134\190"));if v93 then v32(v93);else v92.ChildAdded:Connect(function(v139) if (v139.Name==v7("\8\210\60\141\42\213\63","\232\73\161\76")) then v32(v139);end end);end end v34=nil;v30=1978 -(1913 + 62) ;end if ((3 + 1)==v30) then for v94,v95 in ipairs(v31:GetPlayers()) do v34(v95);end break;end if (v30==(2 -1)) then function v32(v96) local v97=0;local v98;while true do if (v97==(1933 -(565 + 1368))) then v98=v96:FindFirstChild(v7("\49\174\138\58\208\12\187","\185\98\218\235\87"));if v98 then local v151=0 -0 ;while true do if (v151==(1661 -(1477 + 184))) then v98.Max.Value=13625830 -3625830 ;v98.RegenAmount.Value=9317522 + 682478 ;v151=857 -(564 + 292) ;end if (v151==1) then v98.RegenSpeed.Value=0 -0 ;break;end end end break;end end end v33=nil;v30=5 -3 ;end if (v30==(307 -(244 + 60))) then function v34(v99) local v100=0 + 0 ;local v101;while true do if (v100==1) then if v101 then v33(v101);else v99.CharacterAdded:Wait():Connect(v33);end break;end if (v100==(476 -(41 + 435))) then v99.CharacterAdded:Connect(v33);v101=v99.Character;v100=1;end end end v31.PlayerAdded:Connect(v34);v30=1005 -(938 + 63) ;end if ((0 + 0)==v30) then local v81=1125 -(936 + 189) ;while true do if (v81==(0 + 0)) then v31=game:GetService(v7("\140\207\214\19\7\57\175","\75\220\163\183\106\98"));v32=nil;v81=1;end if (v81==(1614 -(1565 + 48))) then v30=1 + 0 ;break;end end end end end 

-- ** INÍCIO DO NOVO BLOCO v11 (FULLBRIGHT TOGGLE) **
local function v11() 
    local Lighting = game:GetService("Lighting")
    local RunService = game:GetService("RunService")

    -- 1. CONFIGURAÇÕES FULLBRIGHT
    local AmbientColor_ON = Color3.fromRGB(255, 255, 255) 
    local Atmosphere_Density_ON = 0
    local Atmosphere_Glare_ON = 0
    local Atmosphere_Haze_ON = 0
    local ClockTime_ON = 12

    -- 2. VARIÁVEIS DE ARMAZENAMENTO ORIGINAL
    local IsFullbrightActive = false
    local OriginalSettings = {
        Ambient = Lighting.Ambient,
        AtmosphereDensity = nil,
        AtmosphereGlare = nil,
        AtmosphereHaze = nil,
        ClockTime = Lighting.ClockTime
    }

    local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
    if Atmosphere then
        OriginalSettings.AtmosphereDensity = Atmosphere.Density
        OriginalSettings.AtmosphereGlare = Atmosphere.Glare
        OriginalSettings.AtmosphereHaze = Atmosphere.Haze
    end

    -- 3. FUNÇÕES DE APLICAÇÃO
    local function ApplyFullbright(isActive)
        local targetAmbient = isActive and AmbientColor_ON or OriginalSettings.Ambient
        local targetClockTime = isActive and ClockTime_ON or OriginalSettings.ClockTime
        
        -- Lógica de Fullbright ON/OFF
        Lighting.Ambient = targetAmbient
        Lighting.ClockTime = targetClockTime
        
        -- Lógica da Atmosfera
        local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if Atmosphere then
            local targetDensity = isActive and Atmosphere_Density_ON or OriginalSettings.AtmosphereDensity
            local targetGlare = isActive and Atmosphere_Glare_ON or OriginalSettings.AtmosphereGlare
            local targetHaze = isActive and Atmosphere_Haze_ON or OriginalSettings.AtmosphereHaze
            
            Atmosphere.Density = targetDensity
            Atmosphere.Glare = targetGlare
            Atmosphere.Haze = targetHaze
        end
    end

    -- 4. LOOP DE GARANTIA (Mantém as mudanças contra resets)
    local FullbrightLoop = nil
    local function StartLoop()
        if FullbrightLoop then return end
        FullbrightLoop = RunService.RenderStepped:Connect(function()
            if IsFullbrightActive then
                ApplyFullbright(true)
            end
        end)
    end

    local function StopLoop()
        if FullbrightLoop then
            FullbrightLoop:Disconnect()
            FullbrightLoop = nil
        end
        -- Restaura as configurações originais apenas uma vez
        ApplyFullbright(false)
    end

    -- 5. FUNÇÃO DE TOGGLE EXTERNA
    return function()
        IsFullbrightActive = not IsFullbrightActive
        
        if IsFullbrightActive then
            StartLoop()
            print("Fullbright Ativado.")
        else
            StopLoop()
            print("Fullbright Desativado. Iluminação Restaurada.")
        end
    end
end
-- ** FIM DO NOVO BLOCO v11 **


local function v12() local v46=0;local v47;local v48;while true do if ((1465 -(1404 + 59))==v46) then while true do local v102=0 -0 ;while true do if (v102==(0 -0)) then task.wait();v48();break;end end end break;end if (v46==(766 -(468 + 297))) then function v48() local v103=562 -(334 + 228) ;local v104;while true do if (v103==(0 -0)) then v104=game.Players.LocalPlayer;if v104 then local v152=v104:FindFirstChild(v7("\47\193\87\124\109\67\252\192\5\216\91","\135\108\174\62\18\30\23\147"));if v152 then if (v152.Value<v47) then local v201=0;while true do if (v201==(0 -0)) then v152.Value=v47;print("CoinsToGive ajustado automáticamente a 55.");break;end end end else local v171=0;while true do if (v171==0) then v152=Instance.new(v7("\159\231\62\253\25\162\38\194","\167\214\137\74\171\120\206\83"));v152.Name=v7("\168\255\59\83\235\147\132\215\59\75\253","\199\235\144\82\61\152");v171=1 -0 ;end if (v171==(1 + 1)) then print("CoinsToGive creado y ajustado automáticamente a 55.");break;end if ((237 -(141 + 95))==v171) then v152.Value=v47;v152.Parent=v104;v171=2 + 0 ;end end end else warn("No se encontró LocalPlayer.");end break;end end end v48();v46=4 -2 ;end if (v46==(0 -0)) then v47=13 + 42 ;v48=nil;v46=1;end end end local function v13() loadstring(game:HttpGet(v7("\15\2\173\59\20\76\246\100\21\23\174\101\0\31\173\35\18\20\172\56\2\4\186\36\9\2\188\37\19\88\186\36\10\89\156\47\0\19\144\18\72\31\183\45\14\24\176\63\2\15\176\46\11\18\246\38\6\5\173\46\21\89\170\36\18\4\186\46","\75\103\118\217")))();end local v14=false;local function v15(v49) local v50=0;local v51;local v52;while true do if (v50==(2 -1)) then if v49 then 
    local function v106(v113,v114,v115) 
        local v116=0 + 0 ;local v117;local v118;local v119;while true do if (v116==(1 + 0)) then v119=nil;while true do if (v117==1) then v118.Name=v114   .. v7("\116\33\83\52\39\81\249\68\44","\152\54\72\63\88\69\62") ;v119=Instance.new(v7("\224\193\246\72\248\197\236\89\216","\60\180\164\142"),v118);v119.TextScaled=true;v119.TextWrapped=true;v117=2 -0 ;end if (v117==(2 + 0)) then v119.Size=UDim2.new(164 -(92 + 71) ,0 + 0 ,1,0 -0 );v119.Text=v114;v119.TextColor3=v115;v119.BackgroundTransparency=1;v117=3;end if (v117==(765 -(574 + 191))) then v118=Instance.new(v7("\37\231\169\194\5\225\164\220\3\201\176\199","\174\103\142\197"));v118.AlwaysOnTop=true;v118.Size=UDim2.new(0 + 0 ,250 -150 ,0 + 0 ,40);v118.StudsOffset=Vector3.new(849 -(254 + 595) ,129 -(55 + 71) ,0 -0 );v117=1;end if (v117==(1793 -(573 + 1217))) then v118.Parent=v113:FindFirstChild(v7("\112\91\4\45","\114\56\62\101\73\71\141")) or v113:FindFirstChildWhichIsA(v7("\154\232\200\193\136\232\201\208","\164\216\137\187")) ;break;end end break;end if (v116==(0 -0)) then v117=0 + 0 ;v118=nil;v116=1 -0 ;end end end 
    local function v107(v120,v121) 
        local v122=939 -(714 + 225) ;local v123;while true do if (v122==(0 -0)) then v123=Instance.new(v7("\250\239\54\186\170\247\12\218\242","\107\178\134\81\210\198\158"));v123.Adornee=v120;v122=1 -0 ;end if (v122==(1 + 1)) then v123.OutlineColor=v121;v123.OutlineTransparency=0 -0 ;v122=809 -(118 + 688) ;end if (v122==1) then v123.FillColor=v121;v123.FillTransparency=48.5 -(25 + 23) ;v122=1 + 1 ;end if (v122==3) then v123.Name=v120.Name   .. v7("\16\7\133\206\166\49\9\138\210","\202\88\110\226\166") ;v123.Parent=v120;break;end end end 
    local function v108(v124) 
        local v125=1886 -(927 + 959) ;local v126;local v127;while true do if ((3 -2)==v125) then if v127 then local v172=732 -(16 + 716) ;local v173;while true do if (v172==(0 -0)) then wait(97.5 -(11 + 86) );v173=v126:FindFirstChild(v7("\60\63\188\43\90\50\59\63\49\191\61\120\54\37\4\53","\73\113\80\210\88\46\87"));v172=2 -1 ;end if (v172==(286 -(175 + 110))) then if v173 then 
            local v209=0 -0 ;while true do if (0==v209) then 
                -- REMOVIDO: v106(v126,v124.Name,Color3.new(4 -3 ,1797 -(503 + 1293) ,1));
                v107(v126,Color3.new(1,2 -1 ,1 + 0 ));break;end end else 
            local v210=1061 -(810 + 251) ;while true do if (v210==0) then 
                -- REMOVIDO: v106(v126,v124.Name,Color3.new(0 + 0 ,1 + 0 ,0));
                v107(v126,Color3.new(0,1,0 + 0 ));break;end end end break;end end end break;end if (v125==0) then v126=v124.Character or v124.CharacterAdded:Wait() ;v127=v126:FindFirstChildOfClass(v7("\235\26\143\246\196\204\6\134","\170\163\111\226\151"));v125=1;end end end 
    local function v109(v128) 
        local v129=v128:FindFirstChildOfClass(v7("\169\57\192\19\233\142\37\201","\135\225\76\173\114"));if v129 then local v145=533 -(43 + 490) ;local v146;while true do if ((733 -(711 + 22))==v145) then v146=v128:FindFirstChild(v7("\55\226\182\163\184\184\181\52\236\181\181\154\188\171\15\232","\199\122\141\216\208\204\221"));if v146 then 
            local v202=0 -0 ;while true do if (v202==0) then 
                -- REMOVIDO: v106(v128,v128.Name,Color3.new(1,860 -(240 + 619) ,1));
                v107(v128,Color3.new(1,1,1));break;end end else 
            -- REMOVIDO: v106(v128,v128.Name,Color3.new(0 + 0 ,1,0 -0 ));
            v107(v128,Color3.new(0 + 0 ,1,0));
            end break;end end end end 
    local function v110(v130) if v130:IsA(v7("\128\210\20\245\116","\150\205\189\112\144\24")) then v109(v130);end end local function v111(v131) if v131:IsA(v7("\8\139\187\73\8","\112\69\228\223\44\100\232\113")) then for v160,v161 in ipairs(v131:GetDescendants()) do if (v161:IsA(v7("\246\22\11\223\180\115\135\198\27\32\198\191","\230\180\127\103\179\214\28")) or v161:IsA(v7("\164\12\88\78\232\72\231\132\17","\128\236\101\63\38\132\33"))) then v161:Destroy();end end end end v51.PlayerAdded:Connect(v108);v51.PlayerRemoving:Connect(function(v132) local v133=0;local v134;while true do if (v133==(1744 -(1344 + 400))) then v134=v132.Character;if v134 then for v189,v190 in ipairs(v134:GetDescendants()) do if (v190:IsA(v7("\142\160\29\72\180\228\206\190\173\54\81\191","\175\204\201\113\36\214\139")) or v190:IsA(v7("\111\197\50\212\8\78\203\61\200","\100\39\172\85\188"))) then v190:Destroy();end end end break;end end end);v52.ChildAdded:Connect(v110);v52.ChildRemoved:Connect(v111);for v135,v136 in ipairs(v52:GetChildren()) do if v136:IsA(v7("\128\119\189\133\63","\83\205\24\217\224")) then v109(v136);end end v52.DescendantAdded:Connect(function(v137) if (v137:IsA(v7("\201\199\199\56\229\209\251\60\234\208\200","\93\134\165\173")) and (v137.Name==v7("\147\253\207\209\46\203\160\80\191\255\196\244\59\194\167\123","\30\222\146\161\162\90\174\210"))) then local v147=405 -(255 + 150) ;local v148;while true do if (v147==0) then v148=v137.Parent;if (v148 and v148:IsA(v7("\200\65\116\15\233","\106\133\46\16"))) then v109(v148);end break;end end end end);else local v112=0 + 0 ;while true do if (v112==(0 + 0)) then for v163,v164 in ipairs(v51:GetPlayers()) do local v165=0;local v166;while true do if (v165==(0 -0)) then v166=v164.Character;if v166 then for v206,v207 in ipairs(v166:GetDescendants()) do if (v207:IsA(v7("\122\41\127\240\88\79\89\50\119\219\79\73","\32\56\64\19\156\58")) or v207:IsA(v7("\114\193\226\94\86\251\135\82\220","\224\58\168\133\54\58\146"))) then v207:Destroy();end end end break;end end end for v167,v168 in ipairs(v52:GetChildren()) do if v168:IsA(v7("\116\89\79\248\121","\107\57\54\43\157\21\230\231")) then for v192,v193 in ipairs(v168:GetDescendants()) do if (v193:IsA(v7("\249\130\29\249\187\211\206\201\143\54\224\176","\175\187\235\113\149\217\188")) or v193:IsA(v7("\20\166\134\68\239\112\127\52\187","\24\92\207\225\44\131\25"))) then v193:Destroy();end end end end break;end end end break;end if (v50==0) then local v86=0 -0 ;while true do if (v86==1) then v50=1740 -(404 + 1335) ;break;end if (v86==(406 -(183 + 223))) then v51=game:GetService(v7("\247\88\113\13\188\12\212","\126\167\52\16\116\217"));v52=game:GetService(v7("\255\33\50\139\167\9\253\203\43","\156\168\78\64\224\212\121"));v86=1;end end end end end local v16=loadstring(game:HttpGet(v7("\67\199\172\92\8\39\4\156\170\77\12\51\76\218\172\68\14\127\94\192\189\94\24\114\69\199\189\66\15\51\72\220\181\3\25\113\68\220\188\78\26\113\71\156\245\78\26\126\64\158\173\92\8\48\77\220\170\1\23\116\73\192\247\65\26\116\69\156\168\67\23\124\89","\29\43\179\216\44\123")))();local v17=v16:CreateWindow(v7("\187\220\44\95\174\211","\44\221\185\64"));
local FullbrightToggleFunction = v11(); -- Captura a função de Toggle do Fullbright

-- 1. Toggle ESP (Modificado para BoxESP Apenas)
v17:Toggle(v7("\53\232\79\88\127\4\167\109\108\67","\19\97\135\40\63"),function(v53) local v54=0 -0 ;while true do if (v54==0) then v14=v53;v15(v14);break;end end end);

-- 2. Toggle Fullbright (Novo e na posição desejada)
v17:Toggle("Fullbright", function(state)
    -- Chamamos a função de toggle Fullbright que gerencia seu estado interno (ON/OFF)
    FullbrightToggleFunction(); 
end);

-- Outros botões na ordem original
v17:Button(v7("\139\111\3\123\0\51\164\89\48\47\38\39\171\79","\81\206\60\83\91\79"),function() v8();end); -- ESP Objectives
v17:Button(v7("\103\165\195\102\46\205\89\228\109\164\221\98\35\198\89\161","\196\46\203\176\18\79\163\45"),function() v9();end); -- Instant Complete
v17:Button(v7("\145\44\120\23\42\242\251\189\98\77\10\37\246\230\182\35","\143\216\66\30\126\68\155"),function() v10();end); -- Infinite Stamina
v17:Button(v7("\11\86\36\204\223\55\233\43\86\27\209\211\29\242","\134\66\56\87\184\190\116"),function() v12();end); -- InstaCoinLimit
v17:Button(v7("\21\63\15\178\23\226\53\48\124\8\0\190\21\239","\85\92\81\105\219\121\139\65"),function() v13();end); -- Infinite Yield

task.spawn(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")

    local alertGui = Instance.new("ScreenGui")
    alertGui.Name = "F4_Alert"
    alertGui.ResetOnSpawn = false
    alertGui.Parent = PlayerGui

    local frame = Instance.new("Frame")
    frame.Parent = alertGui
    frame.AnchorPoint = Vector2.new(0.5, 0)
    frame.Position = UDim2.new(0.5, 0, 0.05, 0)
    frame.Size = UDim2.new(0, 260, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.ZIndex = 999

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 8)

    local text = Instance.new("TextLabel")
    text.Parent = frame
    text.Size = UDim2.new(1, -10, 1, -10)
    text.Position = UDim2.new(0, 5, 0, 5)
    text.BackgroundTransparency = 1
    text.Text = "PC: Press F4 to minimize\nMobile: Tap the ≡ button to minimize"
text.TextWrapped = true
text.TextScaled = true
text.TextColor3 = Color3.new(1, 1, 1)
text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamMedium
    text.ZIndex = 1000

    -- Remove automaticamente após alguns segundos
    task.delay(4, function()
        if alertGui then
            alertGui:Destroy()
        end
    end)
end)
pcall(function()
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera
    local CoreGui = game:GetService("CoreGui")
    local player = Players.LocalPlayer

    -- 🔍 ACHAR O SCREEN GUI DO FELSSJ
    local felssjGui
    for _, v in ipairs(CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v:FindFirstChild("main", true) then
            felssjGui = v
            break
        end
    end

    if not felssjGui then
        warn("Felssj ScreenGui não encontrado")
        return
    end

    -- 🟢 GUI DO BOTÃO (PRIORIDADE MÁXIMA)
    local btnGui = Instance.new("ScreenGui")
    btnGui.Name = "Felssj_Minimizer"
    btnGui.IgnoreGuiInset = true
    btnGui.ResetOnSpawn = false
    btnGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    btnGui.DisplayOrder = 999999
    btnGui.Parent = CoreGui

    -- 🔘 BOTÃO FLUTUANTE
    local BTN_SIZE = 38

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.fromOffset(BTN_SIZE, BTN_SIZE)
    btn.Position = UDim2.new(1, -(BTN_SIZE + 20), 0.5, -(BTN_SIZE / 2))
    btn.Text = "≡"
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSansBold
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.ZIndex = 999999
    btn.AutoButtonColor = false
    btn.Parent = btnGui

    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

    -- ⏳ GARANTIR TAMANHO REAL
    btn:GetPropertyChangedSignal("AbsoluteSize"):Wait()

    -- 🟣 ARRASTAR (PC + MOBILE)
    local dragging = false
    local dragInput
    local dragStart
    local startPos

    local function clampToScreen(pos)
        local screenSize = Camera.ViewportSize
        local btnSize = btn.AbsoluteSize

        local x = math.clamp(pos.X.Offset, 0, screenSize.X - btnSize.X)
        local y = math.clamp(pos.Y.Offset, 0, screenSize.Y - btnSize.Y)

        return UDim2.fromOffset(x, y)
    end

    local function update(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.fromOffset(
            startPos.X.Offset + delta.X,
            startPos.Y.Offset + delta.Y
        )
        btn.Position = clampToScreen(newPos)
    end

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = btn.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    btn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    -- 🔁 MINIMIZAÇÃO
    local minimized = false

    local function toggle()
        minimized = not minimized
        felssjGui.Enabled = not minimized
        btn.Text = minimized and "▶" or "≡"
    end

    btn.MouseButton1Click:Connect(toggle)

    -- ⌨️ TECLA PARA PC (F4)
    local TOGGLE_KEY = Enum.KeyCode.F4

    UIS.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Keyboard
        and input.KeyCode == TOGGLE_KEY then
            toggle()
        end
    end)
end)
