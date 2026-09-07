--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/";
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))();
local Toggles = Library.Toggles;
local Window = Library:CreateWindow({Title="SolyNot Hub",Footer="by solynot",Icon=96112338375785,AutoShow=true,Center=true});
local HttpService = game:GetService("HttpService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local lplr = Players.LocalPlayer;
local requestFn = request or http_request or (syn and syn.request) or (http and http.request) or function(tbl)
	error("no request available");
end;
local function askStockfish(fen, depth)
	depth = depth or 15;
	local url = ("https://stockfish.online/api/s/v2.php?fen=%s&depth=%d"):format(HttpService:UrlEncode(fen), depth);
	local ok, res = pcall(function()
		return requestFn({Url=url,Method="GET"});
	end);
	if (not ok or not res) then
		return;
	end
	local body = res.Body or res.body;
	if (not body or (body == "")) then
		return;
	end
	local ok2, data = pcall(HttpService.JSONDecode, HttpService, body);
	if not ok2 then
		return;
	end
	return data;
end
local function submitMove(move)
	local FlatIdent_2BD95 = 0;
	local chess;
	while true do
		if (FlatIdent_2BD95 == 1) then
			if (chess and chess:FindFirstChild("SubmitMove")) then
				pcall(function()
					chess.SubmitMove:InvokeServer(move);
				end);
			end
			break;
		end
		if (FlatIdent_2BD95 == 0) then
			if (not move or (move == "")) then
				return;
			end
			chess = ReplicatedStorage:FindFirstChild("Chess");
			FlatIdent_2BD95 = 1;
		end
	end
end
local function getActive()
	local ok, active = pcall(function()
		if (ReplicatedStorage:FindFirstChild("InternalClientEvents") and ReplicatedStorage.InternalClientEvents:FindFirstChild("GetActiveTableset")) then
			return ReplicatedStorage.InternalClientEvents.GetActiveTableset:Invoke();
		end
	end);
	if not ok then
		return nil;
	end
	return active;
end
local function sideToPlayFromFen(fen)
	return fen and fen:match("%S+%s+([wb])");
end
local function playerSideForActive(active)
	local FlatIdent_60EA1 = 0;
	local black;
	local white;
	while true do
		if (FlatIdent_60EA1 == 0) then
			black = ((typeof(active.BlackPlayer) == "Instance") and active.BlackPlayer.Value) or active.BlackPlayer;
			white = ((typeof(active.WhitePlayer) == "Instance") and active.WhitePlayer.Value) or active.WhitePlayer;
			FlatIdent_60EA1 = 1;
		end
		if (FlatIdent_60EA1 == 1) then
			if (black == lplr.Name) then
				return "b";
			end
			if (white == lplr.Name) then
				return "w";
			end
			FlatIdent_60EA1 = 2;
		end
		if (FlatIdent_60EA1 == 2) then
			return nil;
		end
	end
end
local AutoPlayEnabled = false;
local LegitAutoPlayEnabled = false;
local Delay = 200;
local Randomization = true;
local BehaviorProfile = "balanced";
local DepthVariation = 2;
local MaxSessionMoves = 100;
local AntiAFK = true;
local SessionMoves = 0;
local CurrentDepth = 15;
local AutoPlayThread;
local LegitAutoPlayThread;
local ChessTab = nil;
local MoveConfidenceThreshold = 0;
local RandomFactor = 1;
local ActionIntensity = 1;
local KeyPressDuration = 50;
local AutoPauseOnSuspicion = false;
local SuspicionFailureLimit = 5;
local DebugLogging = false;
local LegitLogs = {};
local AutoResumeOnError = true;
local MaxRetries = 3;
local HumanHesitation = false;
local RetryCount = 0;
local lastActionTime = os.clock();
local function log(msg)
	local FlatIdent_781F8 = 0;
	local entry;
	while true do
		if (FlatIdent_781F8 == 0) then
			entry = string.format("[%s] %s", os.date("%Y-%m-%d %H:%M:%S"), tostring(msg));
			table.insert(LegitLogs, entry);
			FlatIdent_781F8 = 1;
		end
		if (1 == FlatIdent_781F8) then
			if (#LegitLogs > 200) then
				table.remove(LegitLogs, 1);
			end
			if DebugLogging then
				print("[Legit Auto Play Debug] " .. entry);
			end
			break;
		end
	end
end
local function autoPlayLoop()
	local FlatIdent_104D4 = 0;
	local lastFen;
	local lastMove;
	while true do
		if (FlatIdent_104D4 == 0) then
			lastFen, lastMove = nil, nil;
			while AutoPlayEnabled do
				task.wait();
				local active = getActive();
				if active then
					local fen = ((typeof(active.FEN) == "Instance") and active.FEN.Value) or active.FEN;
					if (fen and (fen ~= "") and (fen ~= lastFen)) then
						local side = sideToPlayFromFen(fen);
						local mySide = playerSideForActive(active);
						if (mySide and (mySide == side)) then
							local FlatIdent_940A0 = 0;
							local data;
							while true do
								if (1 == FlatIdent_940A0) then
									if (data and data.bestmove) then
										local FlatIdent_40CF = 0;
										local move;
										while true do
											if (FlatIdent_40CF == 0) then
												move = data.bestmove:match("[a-h][1-8][a-h][1-8][qrbn]?");
												if (move and (move ~= lastMove)) then
													local FlatIdent_49AED = 0;
													while true do
														if (FlatIdent_49AED == 1) then
															lastActionTime = os.clock();
															break;
														end
														if (FlatIdent_49AED == 0) then
															submitMove(move);
															lastMove = move;
															FlatIdent_49AED = 1;
														end
													end
												end
												break;
											end
										end
									end
									break;
								end
								if (FlatIdent_940A0 == 0) then
									lastFen = fen;
									data = askStockfish(fen, 15);
									FlatIdent_940A0 = 1;
								end
							end
						else
							local FlatIdent_65290 = 0;
							while true do
								if (FlatIdent_65290 == 1) then
									lastActionTime = os.clock();
									break;
								end
								if (FlatIdent_65290 == 0) then
									lastFen = fen;
									lastMove = nil;
									FlatIdent_65290 = 1;
								end
							end
						end
					end
				end
			end
			break;
		end
	end
end
local function legitAutoPlayLoop()
	local FlatIdent_2D2B8 = 0;
	local lastFen;
	local lastEngineMove;
	local consecutiveFailures;
	while true do
		if (FlatIdent_2D2B8 == 1) then
			while LegitAutoPlayEnabled do
				local actualDelay = Delay;
				if Randomization then
					local FlatIdent_8DCA9 = 0;
					local jitter;
					while true do
						if (FlatIdent_8DCA9 == 0) then
							jitter = (math.random() - 0.5) * 100 * RandomFactor;
							actualDelay = actualDelay + jitter;
							break;
						end
					end
				end
				actualDelay = actualDelay * (1 / math.clamp(ActionIntensity, 0.2, 2));
				if (actualDelay < 50) then
					actualDelay = 50;
				end
				task.wait(actualDelay / 1000);
				local active = getActive();
				if not active then
					local FlatIdent_39EBF = 0;
					while true do
						if (FlatIdent_39EBF == 0) then
							log("No active table detected, idling");
							if (AntiAFK and ((os.clock() - lastActionTime) > 30) and (math.random(1, 300) == 1)) then
								local FlatIdent_8BF78 = 0;
								while true do
									if (FlatIdent_8BF78 == 0) then
										task.wait(math.random(1, 5));
										lastActionTime = os.clock();
										FlatIdent_8BF78 = 1;
									end
									if (1 == FlatIdent_8BF78) then
										log("Performed anti-AFK idle action");
										break;
									end
								end
							end
							break;
						end
					end
				else
					if (SessionMoves >= MaxSessionMoves) then
						log("Session limit reached (" .. tostring(MaxSessionMoves) .. ") - pausing");
						LegitAutoPlayEnabled = false;
						if Toggles.LegitAutoPlay then
							Toggles.LegitAutoPlay.Value = false;
						end
						SessionMoves = 0;
						Library:Notify({Title="Legit Auto Play",Description="Session limit reached, paused.",Time=5});
						break;
					end
					local fen = ((typeof(active.FEN) == "Instance") and active.FEN.Value) or active.FEN;
					if (fen and (fen ~= "") and (fen ~= lastFen)) then
						local side = sideToPlayFromFen(fen);
						local mySide = playerSideForActive(active);
						if (mySide and (mySide == side)) then
							lastFen = fen;
							local depth = CurrentDepth or 15;
							if (BehaviorProfile == "aggressive") then
								depth = depth + 5;
							elseif (BehaviorProfile == "passive") then
								depth = math.max(1, depth - 5);
							end
							if (Randomization and (DepthVariation > 0)) then
								depth = depth + math.random(-DepthVariation, DepthVariation);
							end
							depth = math.max(1, depth);
							log("Analyzing with depth " .. tostring(depth) .. ", delay " .. tostring(actualDelay) .. "ms");
							local data = askStockfish(fen, depth);
							if not data then
								consecutiveFailures = consecutiveFailures + 1;
								log("Stockfish request failed (count=" .. tostring(consecutiveFailures) .. ")");
								if (consecutiveFailures >= SuspicionFailureLimit) then
									log("Consecutive Stockfish failures reached limit");
									if not AutoResumeOnError then
										LegitAutoPlayEnabled = false;
										if Toggles.LegitAutoPlay then
											Toggles.LegitAutoPlay.Value = false;
										end
										Library:Notify({Title="Legit Auto Play",Description="Paused: engine failures detected.",Time=5});
										break;
									else
										consecutiveFailures = 0;
									end
								end
							else
								local FlatIdent_64E40 = 0;
								local move;
								local confidence;
								while true do
									if (2 == FlatIdent_64E40) then
										if confidence then
											confidence = math.clamp((confidence / 300) * 100, 0, 100);
										end
										if (move and (move ~= lastEngineMove)) then
											if (confidence and (MoveConfidenceThreshold > 0) and (confidence < MoveConfidenceThreshold)) then
												log("Move skipped due low confidence (" .. tostring(confidence) .. " < " .. tostring(MoveConfidenceThreshold) .. ")");
											else
												task.wait((KeyPressDuration / 1000) * (1 / math.clamp(ActionIntensity, 0.2, 2)));
												log("Submitting move: " .. tostring(move));
												submitMove(move);
												lastEngineMove = move;
												SessionMoves = SessionMoves + 1;
												lastActionTime = os.clock();
											end
										else
											log("No move returned or same as last move");
										end
										break;
									end
									if (FlatIdent_64E40 == 1) then
										confidence = nil;
										if data.score then
											if (type(data.score) == "number") then
												confidence = math.abs(data.score);
											elseif ((type(data.score) == "table") and data.score.cp) then
												confidence = math.abs(data.score.cp);
											end
										elseif data.eval then
											confidence = tonumber(data.eval) or nil;
										end
										FlatIdent_64E40 = 2;
									end
									if (FlatIdent_64E40 == 0) then
										consecutiveFailures = 0;
										move = data.bestmove and data.bestmove:match("[a-h][1-8][a-h][1-8][qrbn]?");
										FlatIdent_64E40 = 1;
									end
								end
							end
						else
							local FlatIdent_40B41 = 0;
							while true do
								if (1 == FlatIdent_40B41) then
									lastActionTime = os.clock();
									break;
								end
								if (FlatIdent_40B41 == 0) then
									lastFen = fen;
									lastEngineMove = nil;
									FlatIdent_40B41 = 1;
								end
							end
						end
					end
				end
				if (AntiAFK and ((os.clock() - lastActionTime) > 30) and (math.random(1, 300) == 1)) then
					local FlatIdent_8A742 = 0;
					while true do
						if (0 == FlatIdent_8A742) then
							task.wait(math.random(1, 5));
							lastActionTime = os.clock();
							FlatIdent_8A742 = 1;
						end
						if (FlatIdent_8A742 == 1) then
							log("Performed anti-AFK idle action");
							break;
						end
					end
				end
			end
			log("Stopped legit auto play");
			break;
		end
		if (FlatIdent_2D2B8 == 0) then
			lastFen, lastEngineMove = nil, nil;
			consecutiveFailures = 0;
			FlatIdent_2D2B8 = 1;
		end
	end
end
local function startLegitThread()
	local FlatIdent_8435E = 0;
	while true do
		if (FlatIdent_8435E == 0) then
			if (LegitAutoPlayThread and (coroutine.status(LegitAutoPlayThread) ~= "dead")) then
				return;
			end
			RetryCount = 0;
			FlatIdent_8435E = 1;
		end
		if (FlatIdent_8435E == 1) then
			LegitAutoPlayThread = task.spawn(function()
				while LegitAutoPlayEnabled do
					local ok, err = pcall(legitAutoPlayLoop);
					if not ok then
						log("legitAutoPlayLoop crashed: " .. tostring(err));
						RetryCount = RetryCount + 1;
						if (AutoResumeOnError and ((MaxRetries == 0) or (RetryCount <= MaxRetries))) then
							local FlatIdent_2388 = 0;
							while true do
								if (FlatIdent_2388 == 0) then
									if HumanHesitation then
										task.wait(math.random(1, 3));
									end
									task.wait(1);
									break;
								end
							end
						else
							LegitAutoPlayEnabled = false;
							if Toggles.LegitAutoPlay then
								Toggles.LegitAutoPlay.Value = false;
							end
							Library:Notify({Title="Legit Auto Play",Description="Paused: repeated errors.",Time=5});
							break;
						end
					else
						RetryCount = 0;
					end
					if LegitAutoPlayEnabled then
						task.wait(0.1);
					end
				end
			end);
			break;
		end
	end
end
local key = (function()
	local FlatIdent_466B2 = 0;
	local r;
	while true do
		if (FlatIdent_466B2 == 0) then
			r = request({Url="https://raw.githubusercontent.com/67HubLua/discordbot/refs/heads/main/keys.json",Method="GET"});
			if (r and (r.StatusCode == 200)) then
				return game:GetService("HttpService"):JSONDecode(r.Body).current_key;
			end
			break;
		end
	end
end)();
local KeyTab = Window:AddKeyTab("Key System");
KeyTab:AddLabel({Text="Join discord server to get key! (discord.gg/TmEypssp3A)",DoesWrap=true});
KeyTab:AddKeyBox(function(ReceivedKey)
	local Success = ReceivedKey == key;
	if Success then
		Library:Notify({Title="Key System",Description="Correct Key!",Time=4});
		if not ChessTab then
			KeyTab.Visible = false;
			ChessTab = Window:AddTab("Chess Club", "user");
			local MainGroup = ChessTab:AddLeftGroupbox("Controls");
			MainGroup:AddToggle("AutoPlay", {Text="Auto Play (Simple)",Default=false});
			Toggles.AutoPlay:OnChanged(function()
				local FlatIdent_8B336 = 0;
				while true do
					if (FlatIdent_8B336 == 1) then
						if (AutoPlayEnabled and (not AutoPlayThread or (coroutine.status(AutoPlayThread) == "dead"))) then
							AutoPlayThread = task.spawn(autoPlayLoop);
						end
						break;
					end
					if (FlatIdent_8B336 == 0) then
						if LegitAutoPlayEnabled then
							local FlatIdent_882F4 = 0;
							while true do
								if (FlatIdent_882F4 == 0) then
									Toggles.AutoPlay.Value = false;
									Library:Notify({Title="Auto Play",Description="Disabled: Legit Auto Play is active",Time=3});
									FlatIdent_882F4 = 1;
								end
								if (FlatIdent_882F4 == 1) then
									return;
								end
							end
						end
						AutoPlayEnabled = Toggles.AutoPlay.Value;
						FlatIdent_8B336 = 1;
					end
				end
			end);
			MainGroup:AddToggle("LegitAutoPlay", {Text="Legit Auto Play(IN BETA!!!)",Default=false});
			Toggles.LegitAutoPlay:OnChanged(function()
				if Toggles.AutoPlay.Value then
					local FlatIdent_6225E = 0;
					while true do
						if (FlatIdent_6225E == 1) then
							Library:Notify({Title="Auto Play",Description="Disabled simple mode for Legit",Time=3});
							break;
						end
						if (FlatIdent_6225E == 0) then
							Toggles.AutoPlay.Value = false;
							AutoPlayEnabled = false;
							FlatIdent_6225E = 1;
						end
					end
				end
				LegitAutoPlayEnabled = Toggles.LegitAutoPlay.Value;
				if LegitAutoPlayEnabled then
					if (BehaviorProfile == "balanced") then
						local FlatIdent_21449 = 0;
						while true do
							if (FlatIdent_21449 == 0) then
								Delay = 200;
								CurrentDepth = 15;
								FlatIdent_21449 = 1;
							end
							if (FlatIdent_21449 == 1) then
								Randomization = true;
								ActionIntensity = 1;
								break;
							end
						end
					elseif (BehaviorProfile == "aggressive") then
						Delay = 50;
						CurrentDepth = 20;
						Randomization = true;
						ActionIntensity = 1.2;
					else
						local FlatIdent_4508F = 0;
						while true do
							if (FlatIdent_4508F == 1) then
								Randomization = true;
								ActionIntensity = 0.8;
								break;
							end
							if (FlatIdent_4508F == 0) then
								Delay = 800;
								CurrentDepth = 10;
								FlatIdent_4508F = 1;
							end
						end
					end
					startLegitThread();
				else
					SessionMoves = 0;
				end
			end);
			local SettingsGroup = ChessTab:AddRightGroupbox("Legit Auto Play Settings");
			SettingsGroup:AddLabel({Text="Delay between actions (ms)",DoesWrap=true});
			SettingsGroup:AddSlider("DelaySlider", {Text="Delay",Default=200,Min=50,Max=5000,Rounding=50,Callback=function(v)
				Delay = v;
			end});
			SettingsGroup:AddDropdown("DelayPreset", {Text="Delay Preset",Default="natural",Values={"fast (50ms)","natural (200ms)","slow (1000ms)","custom"},Callback=function(v)
				local FlatIdent_1013A = 0;
				while true do
					if (0 == FlatIdent_1013A) then
						if v:find("fast") then
							Delay = 50;
						elseif v:find("natural") then
							Delay = 200;
						elseif v:find("slow") then
							Delay = 1000;
						end
						Toggles.DelaySlider.Value = Delay;
						break;
					end
				end
			end});
			SettingsGroup:AddLabel({Text="Behavior Profile",DoesWrap=true});
			SettingsGroup:AddDropdown("ProfileDropdown", {Text="Profile",Default="balanced",Values={"aggressive","balanced","passive"},Callback=function(v)
				local FlatIdent_77172 = 0;
				while true do
					if (FlatIdent_77172 == 1) then
						Toggles.DelaySlider.Value = Delay;
						if Toggles.DepthSlider then
							Toggles.DepthSlider.Value = CurrentDepth;
						end
						break;
					end
					if (FlatIdent_77172 == 0) then
						BehaviorProfile = v;
						if (v == "aggressive") then
							local FlatIdent_7E707 = 0;
							while true do
								if (FlatIdent_7E707 == 0) then
									Delay = 50;
									CurrentDepth = 20;
									break;
								end
							end
						elseif (v == "passive") then
							local FlatIdent_32BB2 = 0;
							while true do
								if (FlatIdent_32BB2 == 0) then
									Delay = 1000;
									CurrentDepth = 10;
									break;
								end
							end
						else
							local FlatIdent_21297 = 0;
							while true do
								if (FlatIdent_21297 == 0) then
									Delay = 200;
									CurrentDepth = 15;
									break;
								end
							end
						end
						FlatIdent_77172 = 1;
					end
				end
			end});
			SettingsGroup:AddToggle("RandomizationToggle", {Text="Randomization",Default=true,Callback=function(v)
				Randomization = v;
			end});
			SettingsGroup:AddLabel({Text="Random Factor",DoesWrap=true});
			SettingsGroup:AddSlider("RandomFactorSlider", {Text="Random Factor",Default=1,Min=0,Max=3,Rounding=0.1,Callback=function(v)
				RandomFactor = v;
			end});
			SettingsGroup:AddLabel({Text="Action Intensity",DoesWrap=true});
			SettingsGroup:AddSlider("ActionIntensitySlider", {Text="Action Intensity",Default=1,Min=0.2,Max=2,Rounding=0.1,Callback=function(v)
				ActionIntensity = v;
			end});
			SettingsGroup:AddLabel({Text="Key Press Duration (ms)",DoesWrap=true});
			SettingsGroup:AddSlider("KeyPressDurationSlider", {Text="Key Press Duration",Default=50,Min=10,Max=500,Rounding=10,Callback=function(v)
				KeyPressDuration = v;
			end});
			SettingsGroup:AddLabel({Text="Depth Variation (+/-)",DoesWrap=true});
			SettingsGroup:AddSlider("DepthVariationSlider", {Text="Depth Var",Default=2,Min=0,Max=10,Rounding=1,Callback=function(v)
				DepthVariation = v;
			end});
			SettingsGroup:AddToggle("AntiAFKTogle", {Text="Anti-AFK",Default=true,Callback=function(v)
				AntiAFK = v;
			end});
			SettingsGroup:AddLabel({Text="Max Moves",DoesWrap=true});
			SettingsGroup:AddSlider("SessionLimitSlider", {Text="Max Moves",Default=100,Min=10,Max=500,Rounding=10,Callback=function(v)
				MaxSessionMoves = v;
			end});
			SettingsGroup:AddToggle("AutoPauseOnSuspicionToggle", {Text="Auto-Pause on Suspicious Activity",Default=false,Callback=function(v)
				AutoPauseOnSuspicion = v;
			end});
			SettingsGroup:AddLabel({Text="Failure Limit",DoesWrap=true});
			SettingsGroup:AddSlider("SuspicionLimitSlider", {Text="Failure Limit",Default=5,Min=1,Max=20,Rounding=1,Callback=function(v)
				SuspicionFailureLimit = v;
			end});
			SettingsGroup:AddLabel({Text="Depth",DoesWrap=true});
			CurrentDepth = 15;
			SettingsGroup:AddSlider("DepthSlider", {Text="Depth",Default=CurrentDepth,Min=5,Max=25,Rounding=1,Callback=function(v)
				CurrentDepth = v;
			end});
			SettingsGroup:AddLabel({Text="Confidence",DoesWrap=true});
			SettingsGroup:AddSlider("ConfidenceSlider", {Text="Confidence",Default=0,Min=0,Max=100,Rounding=1,Callback=function(v)
				MoveConfidenceThreshold = v;
			end});
			SettingsGroup:AddToggle("DebugLoggingToggle", {Text="Debug Logging",Default=false,Callback=function(v)
				DebugLogging = v;
			end});
			SettingsGroup:AddButton({Text="Show Recent Logs",Func=function()
				local FlatIdent_91608 = 0;
				local n;
				while true do
					if (FlatIdent_91608 == 1) then
						Library:Notify({Title="Legit Auto Play",Description="Recent logs added to debug log buffer.",Time=4});
						break;
					end
					if (FlatIdent_91608 == 0) then
						n = math.min(10, #LegitLogs);
						for i = (#LegitLogs - n) + 1, #LegitLogs do
							if LegitLogs[i] then
								log("LOG_ENTRY: " .. LegitLogs[i]);
							end
						end
						FlatIdent_91608 = 1;
					end
				end
			end});
			SettingsGroup:AddToggle("AutoResumeToggle", {Text="Auto-Resume on Error",Default=true,Callback=function(v)
				AutoResumeOnError = v;
			end});
			SettingsGroup:AddSlider("MaxRetrySlider", {Text="Max Retries (0 = infinite)",Default=3,Min=0,Max=20,Rounding=1,Callback=function(v)
				MaxRetries = v;
			end});
			SettingsGroup:AddToggle("HumanHesitationToggle", {Text="Human-like Hesitation",Default=false,Callback=function(v)
				HumanHesitation = v;
			end});
			MainGroup:AddButton({Text="Manual Next Move",Func=function()
				local active = getActive();
				if not active then
					return;
				end
				local fen = ((typeof(active.FEN) == "Instance") and active.FEN.Value) or active.FEN;
				if (not fen or (fen == "")) then
					return;
				end
				local side = sideToPlayFromFen(fen);
				local mySide = playerSideForActive(active);
				if (not mySide or (mySide ~= side)) then
					return;
				end
				local data = askStockfish(fen);
				if (data and data.bestmove) then
					local FlatIdent_331F0 = 0;
					local move;
					while true do
						if (FlatIdent_331F0 == 0) then
							move = data.bestmove:match("[a-h][1-8][a-h][1-8][qrbn]?");
							submitMove(move);
							FlatIdent_331F0 = 1;
						end
						if (FlatIdent_331F0 == 1) then
							lastActionTime = os.clock();
							break;
						end
					end
				end
			end});
			MainGroup:AddButton({Text="Play Best Move",Func=function()
				local FlatIdent_6D68E = 0;
				local active;
				local fen;
				local side;
				local mySide;
				local data;
				while true do
					if (FlatIdent_6D68E == 1) then
						fen = ((typeof(active.FEN) == "Instance") and active.FEN.Value) or active.FEN;
						if (not fen or (fen == "")) then
							return;
						end
						FlatIdent_6D68E = 2;
					end
					if (FlatIdent_6D68E == 0) then
						active = getActive();
						if not active then
							return;
						end
						FlatIdent_6D68E = 1;
					end
					if (2 == FlatIdent_6D68E) then
						side = sideToPlayFromFen(fen);
						mySide = playerSideForActive(active);
						FlatIdent_6D68E = 3;
					end
					if (FlatIdent_6D68E == 4) then
						if (data and data.bestmove) then
							local FlatIdent_7063 = 0;
							local move;
							while true do
								if (FlatIdent_7063 == 0) then
									move = data.bestmove:match("[a-h][1-8][a-h][1-8][qrbn]?");
									submitMove(move);
									FlatIdent_7063 = 1;
								end
								if (FlatIdent_7063 == 1) then
									lastActionTime = os.clock();
									break;
								end
							end
						end
						break;
					end
					if (3 == FlatIdent_6D68E) then
						if (not mySide or (mySide ~= side)) then
							return;
						end
						data = askStockfish(fen);
						FlatIdent_6D68E = 4;
					end
				end
			end});
		end
	else
		Library:Notify({Title="Key System",Description=("Incorrect Key: " .. ReceivedKey),Time=4});
	end
end);
