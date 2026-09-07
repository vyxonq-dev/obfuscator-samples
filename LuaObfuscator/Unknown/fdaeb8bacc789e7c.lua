--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/vvhoy884ugvv/hgcdghcvjh/refs/heads/main/sfvd.txt"))(); -- 
-- Bogus Performance Evaluation: x1.000
local v1 = v0:CreateWindow({Name="🐉Hydra.VIP🐉",LoadingTitle="Made By HydraX",LoadingSubtitle="By HydraX",ConfigurationSaving={Enabled=true,FolderName=nil,FileName="HydraVIP"},Discord={Enabled=true,Invite="dvdge._",RememberJoins=true},BackgroundColor=Color3.fromRGB(255, 1916 - (108 + 1553), 768 - (232 + 281)),TextColor=Color3.fromRGB(1138 - (116 + 1022), 1253 - (976 + 277), 957 - (892 + 65))});
v0:Notify({Title="🐉Hydra.VIP🐉 INJECTED",Content="Thank you so much for using my script!",Duration=6.5,Image=(1069582394 - 621219936),Actions={Ignore={Name="Close",Callback=function()
	print("Notification closed");
end}}});
local v2 = v1:CreateTab("🐉Aimbot", 828769388 - 380406930);
local v3 = v2:CreateSection("Aimbot");
v2:CreateToggle({Name="Silent Aim",Callback=function(v20)
	_G.silentAim = v20;
	print("Silent Aim: " .. tostring(v20));
end});
v2:CreateToggle({Name="Infinite Ammo",Callback=function(v21)
	_G.infiniteAmmo = v21;
	print("Infinite Ammo: " .. tostring(v21));
end});
v2:CreateToggle({Name="No Recoil",Callback=function(v22)
	local v23 = 0 - 0;
	while true do
		if (v23 == (0 - 0)) then
			_G.noRecoil = v22;
			print("No Recoil: " .. tostring(v22));
			break;
		end
	end
end});
v2:CreateToggle({Name="No Spread",Callback=function(v24)
	_G.noSpread = v24;
	print("No Spread: " .. tostring(v24));
end});
v2:CreateToggle({Name="Fast Guns",Callback=function(v25)
	_G.fastFire = v25;
	print("Fast Guns: " .. tostring(v25));
end});
v2:CreateToggle({Name="Automatic Guns",Callback=function(v26)
	local v27 = 859 - (814 + 45);
	while true do
		if (v27 == (350 - (87 + 263))) then
			_G.autoGuns = v26;
			print("Automatic Guns: " .. tostring(v26));
			break;
		end
	end
end});
local v4 = v1:CreateTab("🐉Killall", 448362638 - (67 + 113));
local v5 = v4:CreateSection("Killall");
v4:CreateButton({Name="Killall V1",Callback=function()
	print("WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!");
	getgenv().Settings = {gun="Sniper"};
	if not game.Players.LocalPlayer.Character:FindFirstChild(Settings.gun) then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[Settings.gun]);
	end
	for v44, v45 in next, game.Players:GetPlayers() do
		if (v45.Name ~= game.Players.LocalPlayer.Name) then
			game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(game.Players.LocalPlayer.Character[Settings.gun], {p=v45.Character.Head.Position,pid=(1 + 0),part=v45.Character.Head,d=(177 + 323),maxDist=(1385 - (261 + 624)),h=v45.Character.Humanoid,m=Enum.Material.Plastic,n=Vector3.new(-(0.9637810587882996 - 0), -(1080.046888358891 - (1020 + 60)), -(1423.2625408172607 - (630 + 793))),t=(0.15185665205004445 + 0),sid=(127 - 95)});
		end
	end
end});
local v6 = v1:CreateTab("🐉ESP", 448363410 - (802 + 150));
local v7 = v6:CreateSection("ESP");
v6:CreateButton({Name="ESP V1",Callback=function()
	local v29 = 0 + 0;
	while true do
		if (v29 == 0) then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))();
			print("ESP V1 activated!");
			break;
		end
	end
end});
local v8 = v1:CreateTab("🐉Contributors", 1207143410 - 758780952);
local v9 = v8:CreateSection("Contributors");
v8:CreateButton({Name="1. GAMES_M.D",Callback=function()
	local v30 = 0;
	while true do
		if (v30 == (0 - 0)) then
			setclipboard("https://youtube.com/@games.gaming_30?si=TcdIMr2CB16TZugf");
			print("Link copied to clipboard!");
			break;
		end
	end
end});
local v10 = require(game:service("ReplicatedStorage").WeaponsSystem.Libraries.BaseWeapon);
local v11 = v10.fire;
local v12 = v10.getConfigValue;
local v13 = v10.useAmmo;
local v14 = v10.getAmmoInWeapon;
local function v15()
	local v31 = nil;
	local v32 = math.huge;
	for v46, v47 in next, game:GetService("Players"):GetPlayers() do
		if (v47 == game.Players.LocalPlayer) then
			continue;
		end
		if not v47.Character then
			continue;
		end
		local v48 = v47.Character:FindFirstChild("Humanoid");
		local v49 = v47.Character:FindFirstChild("Head");
		if (not v49 or not v48) then
			continue;
		end
		if (v48.Health <= (0 + 0)) then
			continue;
		end
		local v50, v51 = workspace.CurrentCamera:WorldToViewportPoint(v49.Position);
		if not v51 then
			continue;
		end
		local v52 = game:GetService("UserInputService"):GetMouseLocation();
		local v53 = Vector2.new(v50.X, v50.Y);
		local v54 = math.floor((v53 - v52).magnitude);
		if (v54 < v32) then
			local v55 = 997 - (915 + 82);
			while true do
				if (v55 == (0 - 0)) then
					v32 = v54;
					v31 = v49;
					break;
				end
			end
		end
	end
	return v31;
end
v10.getAmmoInWeapon = function(v33, ...)
	local v34 = {...};
	if _G.infiniteAmmo then
		return 8999999488 - 0;
	end
	return v14(v33, unpack(v34));
end;
v10.fire = function(v35, ...)
	local v36 = 1187 - (1069 + 118);
	local v37;
	while true do
		if (v36 == (2 - 1)) then
			return v11(v35, unpack(v37));
		end
		if (v36 == (0 - 0)) then
			v37 = {...};
			if _G.silentAim then
				local v56 = 0 + 0;
				local v57;
				while true do
					if (v56 == (0 - 0)) then
						v57 = v15();
						if v57 then
							local v58 = 0 + 0;
							while true do
								if (v58 == (0 - 0)) then
									v37[2 + 0] = (v57.Position - v37[4 - 3]).unit;
									v37[794 - (368 + 423)] = 3 - 2;
									break;
								end
							end
						end
						break;
					end
				end
			end
			v36 = 19 - (10 + 8);
		end
	end
end;
v10.getConfigValue = function(v38, ...)
	local v39 = 0 - 0;
	local v40;
	while true do
		if (v39 == (1414 - (447 + 966))) then
			return v12(v38, unpack(v40));
		end
		if (v39 == (442 - (416 + 26))) then
			v40 = {...};
			if (_G.fastFire and (v40[1] == "ShotCooldown")) then
				return 0.01 - 0;
			elseif (_G.autoGuns and (v40[1 + 0] == "FireMode")) then
				return "Automatic";
			elseif (_G.noRecoil and ((v40[1 - 0] == "RecoilMin") or (v40[439 - (145 + 293)] == "RecoilMax"))) then
				return 0 - 0;
			elseif (_G.noSpread and ((v40[431 - (44 + 386)] == "MinSpread") or (v40[2 - 1] == "MaxSpread"))) then
				return 1486 - (998 + 488);
			end
			v39 = 1 + 0;
		end
	end
end;
v10.useAmmo = function(v41, ...)
	local v42 = 376 - (85 + 291);
	local v43;
	while true do
		if (v42 == (1265 - (243 + 1022))) then
			v43 = {...};
			if _G.infiniteAmmo then
				if v41.ammoInWeaponValue then
					return 1 + 0;
				end
			end
			v42 = 1;
		end
		if (v42 == (1181 - (1123 + 57))) then
			return v13(v41, unpack(v43));
		end
	end
end;
