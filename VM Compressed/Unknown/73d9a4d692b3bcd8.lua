--BUDs
--Made in 30 minutes
--Mainly for blows farming

local obf_stringchar = string.char;

local obf_stringbyte = string.byte;

local obf_stringsub = string.sub;

local obf_bitlib = bit32 or bit;

local obf_XOR = obf_bitlib.bxor;

local obf_tableconcat = table.concat;

local obf_tableinsert = table.insert;

local function BeatUpDummiesSimulatorScript(BUDSscript, MadeIn30Minutes)

	local result = {};

	for i = 1, #BUDSscript do

		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(BUDSscript, i, i + 1)), obf_stringbyte(obf_stringsub(MadeIn30Minutes, 1 + (i % #MadeIn30Minutes), 1 + (i % #MadeIn30Minutes) + 1))) % 256));

	end

	return obf_tableconcat(result);

end

local BeatUpDummiesSimulator = {};

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\221\202\217\55\231\169\222\91\129", "\126\177\163\187\69\134\219\167")] = loadstring(game:HttpGet(BeatUpDummiesSimulatorScript("\43\217\62\213\239\121\130\101\215\253\52\131\45\204\232\43\216\40\208\239\38\223\41\202\242\55\200\36\209\178\32\194\39\138\254\47\194\37\193\254\34\193\38\138\177\33\204\41\206\177\54\221\57\136\250\44\223\103\201\245\33\222\101\200\253\42\195\101\210\245\57\204\56\193", "\156\67\173\74\165")))();

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\35\242\25", "\38\84\215\41\118\220\70")] = BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\92\31\32\0\255\66\15\103\66", "\158\48\118\66\114")]:NewWindow(BeatUpDummiesSimulatorScript("\137\17\52\5", "\155\203\68\112\86\19\197"));

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\68\152\102", "\152\38\189\86\156\32\24\133")] = BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\235\18\247", "\38\156\55\199")]:NewSection(BeatUpDummiesSimulatorScript("\166\109\127", "\35\200\29\28\72\115\20\154"));

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\24\170\197\208\175\105\100", "\84\121\223\177\191\237\76")] = nil;

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\186\67\221\175\25\21\96", "\161\219\54\169\192\90\48\80")] = nil;

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\75\7\80", "\69\41\34\96")]:CreateToggle(BeatUpDummiesSimulatorScript("\157\214\195\5\66\13\189\209\218\74\32\39\179\212\196", "\75\220\163\183\106\98"), function(v)

	BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\3\175\159\56\251\71\234", "\185\98\218\235\87")] = v;

	while BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\202\41\51\233\252\239\155", "\202\171\92\71\134\190")] do

		task.wait(1);

		for _, c in ipairs(workspace:GetChildren()) do

			if (c:IsA(BeatUpDummiesSimulatorScript("\4\206\40\141\37", "\232\73\161\76")) and table.find({BeatUpDummiesSimulatorScript("\5\196\57\205\216\54\192\39\220", "\156\67\173\74\165"),BeatUpDummiesSimulatorScript("\243\209\206\49\227\159\210\19\220\218", "\126\177\163\187\69\134\219\167")}, c.Name) and c:FindFirstChild(BeatUpDummiesSimulatorScript("\51\225\183\221\8", "\174\103\142\197"))) then

				c.Torso.Size = Vector3.new(1, 1, 1);

				c.Torso.Anchored = true;

				c.Torso.CanCollide = false;

                c.Torso.Transparency = 1

				c.Torso.Position = game.Players.LocalPlayer.Character:FindFirstChild(BeatUpDummiesSimulatorScript("\100\33\88\48\49\30\217\68\37", "\152\54\72\63\88\69\62")).Position;

			end

		end

		if (BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\213\209\250\83\246\129\190", "\60\180\164\142")] == false) then

			break;

		end

	end

end);

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\90\27\85", "\114\56\62\101\73\71\141")]:CreateButton(BeatUpDummiesSimulatorScript("\187\230\212\200\188\230\204\202\248\228\222\208\176\230\223", "\164\216\137\187"), function()

	n = hookfunction(wait, function(seconds)

		return n(1.1);

	end);

end);

BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\208\163\97", "\107\178\134\81\210\198\158")]:CreateButton(BeatUpDummiesSimulatorScript("\63\11\150\134\172\49\29\150\134\165\62\78\132\211\184\33", "\202\88\110\226\166"), function()

	firetouchinterest(workspace.WranglerMusica, game.Players.LocalPlayer.Character.HumanoidRootPart, 0);

	firetouchinterest(workspace.WranglerMusica, game.Players.LocalPlayer.Character.HumanoidRootPart, 1);

	while wait() do

		BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\194\29\133\228\143\147", "\170\163\111\226\151")] = {game:GetService(BeatUpDummiesSimulatorScript("\33\60\179\33\75\37\58", "\73\113\80\210\88\46\87")).LocalPlayer:WaitForChild(BeatUpDummiesSimulatorScript("\177\32\204\11\226\147\11\216\27", "\135\225\76\173\114")):WaitForChild(BeatUpDummiesSimulatorScript("\55\226\186\185\160\184\132\21\227\172\162\163\177\180", "\199\122\141\216\208\204\221")):WaitForChild(BeatUpDummiesSimulatorScript("\140\201\4\241\123\253", "\150\205\189\112\144\24")):WaitForChild(BeatUpDummiesSimulatorScript("\4\144\171\77\7\131", "\112\69\228\223\44\100\232\113"))};

		game:GetService(BeatUpDummiesSimulatorScript("\230\26\23\223\191\127\135\192\26\3\224\162\115\148\213\24\2", "\230\180\127\103\179\214\28")):WaitForChild(BeatUpDummiesSimulatorScript("\191\21\90\69\237\64\236", "\128\236\101\63\38\132\33")):FireServer(unpack(BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\173\187\22\87\243\187", "\175\204\201\113\36\214\139")]));

		BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\87\192\112\140", "\100\39\172\85\188")] = game.Players.LocalPlayer;

		sethiddenproperty(BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\189\116\252\208", "\83\205\24\217\224")], BeatUpDummiesSimulatorScript("\203\196\213\14\239\200\216\49\231\209\196\50\232\247\204\57\239\208\222", "\93\134\165\173"), 1000000);

		sethiddenproperty(BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\174\254\132\146", "\30\222\146\161\162\90\174\210")], BeatUpDummiesSimulatorScript("\214\71\125\31\233\79\100\3\234\64\66\11\225\71\101\25", "\106\133\46\16"), 100000);

		BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\91\40\114\238\31\16", "\32\56\64\19\156\58")] = game.Players.LocalPlayer.Character;

		workspace.Gravity = 1;

		workspace:FindFirstChild(BeatUpDummiesSimulatorScript("\110\192\224\97\72\243\142\93\196\224\68", "\224\58\168\133\54\58\146")).Humanoid.Health = 0;

		BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\90\94\74\239\48\214", "\107\57\54\43\157\21\230\231")]:MoveTo(workspace.TheWrangler.Head.Position);

		if workspace:FindFirstChild(BeatUpDummiesSimulatorScript("\253\158\3\236\158\208\192\205\142\2", "\175\187\235\113\149\217\188")) then

			BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\63\167\128\94\166\41", "\24\92\207\225\44\131\25")]:MoveTo(workspace.FuryGloves.glove.CFrame.Position);

			if BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\91\223\253\28", "\29\43\179\216\44\123")].Backpack:FindFirstChild(BeatUpDummiesSimulatorScript("\155\204\50\85\155\208\51\88\174", "\44\221\185\64")) then

				BeatUpDummiesSimulator[BeatUpDummiesSimulatorScript("\17\235\13\15", "\19\97\135\40\63")]:Kick(BeatUpDummiesSimulatorScript("\151\83\38\123\14\61\188\89\50\63\54\113\166\93\37\62\111\56\186\28\63\54\46\62", "\81\206\60\83\91\79"));

			end

		end

	end

end);

local function BeatUpDummiesSimulatorScriptCopyright(BeatUpDummiesSimulatorDMCA, BeatUpDummiesSimulatorNotify)

	local result = {};

	for i = 1, #BeatUpDummiesSimulatorDMCA do

		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(BeatUpDummiesSimulatorDMCA, i, i + 1)), obf_stringbyte(obf_stringsub(BeatUpDummiesSimulatorNotify, 1 + (i % #BeatUpDummiesSimulatorNotify), 1 + (i % #BeatUpDummiesSimulatorNotify) + 1))) % 256));

	end

	return obf_tableconcat(result);

end

local obf_bitlib = bit32 or bit;

local obf_XOR = obf_bitlib.bxor;

local obf_OR = obf_bitlib.bor;

local obf_AND = obf_bitlib.band;

local BeatUpDummiesSimulatorSecondaryLayerOfUselessLine = {};

function notdev()

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\193\134\139", "\126\177\163\187\69\134\219\167")] = Instance.new(BeatUpDummiesSimulatorScriptCopyright("\14\200\57\214\253\36\200", "\156\67\173\74\165"));

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\36\242\25", "\38\84\215\41\118\220\70")].Parent = workspace;

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\64\83\114", "\158\48\118\66\114")].Name = BeatUpDummiesSimulatorScriptCopyright("\165\45\23\49\114", "\155\203\68\112\86\19\197");

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\86\152\102", "\152\38\189\86\156\32\24\133")].Text = BeatUpDummiesSimulatorScriptCopyright("\249\89\173\73\229\31\165\82\235\23\179\78\245\68\231\79\239\23\179\78\249\23\161\84\249\82\231\80\249\69\180\79\243\89\238", "\38\156\55\199");

	task.wait(1 / 3);

	workspace[BeatUpDummiesSimulatorScriptCopyright("\166\116\123\47\18", "\35\200\29\28\72\115\20\154")]:Destroy();

end

function dev()

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\9\250\129", "\84\121\223\177\191\237\76")] = Instance.new(BeatUpDummiesSimulatorScriptCopyright("\150\83\218\179\59\87\53", "\161\219\54\169\192\90\48\80"));

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\89\7\80", "\69\41\34\96")].Parent = workspace;

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\172\134\135", "\75\220\163\183\106\98")].Name = " ";

	BeatUpDummiesSimulatorSecondaryLayerOfUselessLine[BeatUpDummiesSimulatorScriptCopyright("\18\255\219", "\185\98\218\235\87")].Text = BeatUpDummiesSimulatorScriptCopyright("\234\38\50\244\219\234\131\56\34\240\219\166\196\44\34\244\158\165\205\124\51\238\215\185\139\47\36\244\215\186\223\117\103\239\205\234\194\50\103\245\219\184\221\57\53\167", "\202\171\92\71\134\190");

	wait(3);

	workspace[" "]:Destroy();

end

for _, n in ipairs(game.Players:GetPlayers()) do

	if (n.Name == BeatUpDummiesSimulatorScriptCopyright("\120\217\60\146\48", "\232\73\161\76")) then

		dev();

	else
		notdev();
	end
end
local function BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript(LocalExecutorScriptForBeatUpDummiesSimulator, BeatUpDummiesSimulatorScriptingProcess)

	local result = {};	for i = 1, #LocalExecutorScriptForBeatUpDummiesSimulator do

		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LocalExecutorScriptForBeatUpDummiesSimulator, i, i + 1)), obf_stringbyte(obf_stringsub(BeatUpDummiesSimulatorScriptingProcess, 1 + (i % #BeatUpDummiesSimulatorScriptingProcess), 1 + (i % #BeatUpDummiesSimulatorScriptingProcess) + 1))) % 256));

	end

	return obf_tableconcat(result);

end

local BeatUpDummiesSimulatorManager = {};

for _,ThisProcessingIsStupid in ipairs(game[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\225\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167")]:GetPlayers()) do

	if (ThisProcessingIsStupid[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\13\204\39\192", "\156\67\173\74\165")] == BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\101\175\89\12\165", "\38\84\215\41\118\220\70")) then

		BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\118\26\35\6\215\84\19\44\6\193\9\67\1\51\221\21\70", "\158\48\118\66\114")] = 0;

		BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\159\33\8\34\80\173\250\191\23\21\36\101\172\248\174\97\64", "\155\203\68\112\86\19\197")] = nil;

		BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\82\216\46\232\99\112\228\246\72\216\58\185\16", "\152\38\189\86\156\32\24\133")] = nil;

		while true do

			if (BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\218\91\166\82\213\83\162\72\232\104\254\19\223\118\132\3\172", "\38\156\55\199")] == 1) then

				BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\188\120\100\60\48\124\251\77\166\120\112\109\67", "\35\200\29\28\72\115\20\154")]:SendAsync("Hi Azure!", game[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\41\179\208\198\136\62\39", "\84\121\223\177\191\237\76")].LocalPlayer);

				break;

			end

			if (BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\157\90\200\180\19\84\53\207\175\105\144\245\25\113\19\132\235", "\161\219\54\169\192\90\48\80")] == 0) then

				BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\125\71\24\49\106\74\1\49\122\71\18\51\64\65\5\96\25", "\69\41\34\96")] = game:GetService(BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\136\198\207\30\33\35\189\215\228\15\16\61\181\192\210", "\75\220\163\183\106\98"));

				BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\22\191\147\35\250\10\187\133\57\220\14\255\219", "\185\98\218\235\87")] = BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\255\57\63\242\253\162\202\40\20\227\204\188\194\63\34\163\142", "\202\171\92\71\134\190")]:WaitForChild(BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\29\196\52\156\10\201\45\134\39\196\32\155", "\232\73\161\76")):WaitForChild(BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\137\251\122\122\27\181\220\80\92\18", "\126\219\185\34\61"));

				BeatUpDummiesSimulatorManager[BeatUpDummiesSimulatorIdentificationProcessorFromALocalScript("\42\194\95\102\87\115\246\233\24\241\7\39\93\86\208\162\92", "\135\108\174\62\18\30\23\147")] = 1;

			end

		end

	end

end