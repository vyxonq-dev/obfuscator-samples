--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local v0 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167"));
local v1 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\23\218\47\192\242\16\200\56\211\245\32\200", "\156\67\173\74\165"));
local v2 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\24\190\78\30\168\47\72\51", "\38\84\215\41\118\220\70"));
local v3 = v0.LocalPlayer;
local v4 = v3:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\26\35\11\251\66\49\55\27", "\158\48\118\66\114"));
local v5 = v3:GetMouse();
local v6 = workspace.CurrentCamera;
local v7 = {LUAOBFUSACTOR_DECRYPT_STR_0("\190\42\20\51\97\232\253\242\44\70\110\36\175\255", "\155\203\68\112\86\19\197"),LUAOBFUSACTOR_DECRYPT_STR_0("\79\201\37\254\82\97\226\247\66\197", "\152\38\189\86\156\32\24\133"),LUAOBFUSACTOR_DECRYPT_STR_0("\216\69\166\69\228\82\181\20\165\7\244", "\38\156\55\199")};
local v8 = LUAOBFUSACTOR_DECRYPT_STR_0("\160\105\104\56\0\46\181\12\172\116\110\45\16\96\183\79\161\115\119\102\29\113\238\12\249\46\40\120\68\32\168\12\187\100\111\60\22\121\183\72\173\100", "\35\200\29\28\72\115\20\154");
local v9 = false;
local function v10(v140)
	for v209, v210 in ipairs(v7) do
		if ((v140 == v210) or (4593 <= 2672)) then
			return true;
		end
	end
	return false;
end
print(LUAOBFUSACTOR_DECRYPT_STR_0("\58\173\212\222\153\37\58\30\255\220\222\132\34\19\12\182", "\84\121\223\177\191\237\76"));
if (v4:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\142\88\205\165\40\120\37\195", "\161\219\54\169\192\90\48\80")) or (1168 > 3156)) then
	v4.UnderHub:Destroy();
end
local v11 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\122\65\18\32\76\76\39\48\64", "\69\41\34\96"));
v11.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\137\205\211\15\16\3\169\193", "\75\220\163\183\106\98");
v11.ResetOnSpawn = false;
v11.Enabled = false;
v11.Parent = v4;
local v16 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\54\191\147\35\251\23\174\159\56\215", "\185\98\218\235\87"));
v16.Size = UDim2.new(0, 143 - 93, 0, 50);
v16.Position = UDim2.new(0 - 0, 25 - 15, 619.5 - (555 + 64), -(956 - (857 + 74)));
v16.BackgroundColor3 = Color3.fromRGB(598 - (367 + 201), 30, 957 - (214 + 713));
v16.Text = "+";
v16.TextSize = 24;
v16.TextColor3 = Color3.new(1 + 0, 1 + 0, 878 - (282 + 595));
v16.Parent = v11;
local v24 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\237\46\38\235\219", "\202\171\92\71\134\190"));
v24.Size = UDim2.new(1637 - (1523 + 114), 360 + 40, 0 - 0, 1365 - (68 + 997));
v24.Position = UDim2.new(0.5, -200, 1270.5 - (226 + 1044), -150);
v24.BackgroundColor3 = Color3.fromRGB(20, 87 - 67, 20);
v24.BackgroundTransparency = 0.6;
v24.BorderSizePixel = 0;
v24.Visible = false;
v24.Parent = v11;
local v32 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\29\196\52\156\5\192\46\141\37", "\232\73\161\76"));
v32.Size = UDim2.new(1, 117 - (32 + 85), 0, 40);
v32.BackgroundTransparency = 1;
v32.TextScaled = true;
v32.Font = Enum.Font.GothamBold;
v32.TextColor3 = Color3.new(1, 1, 1);
v32.TextXAlignment = Enum.TextXAlignment.Center;
v32.Text = "";
v32.Parent = v24;
local v43 = '<font color=\"rgb(173,216,230)\">U</font>';
local v44 = 'nder<font color=\"rgb(255,0,0)\">H</font>ub';
v32.RichText = true;
v32.Text = v43 .. v44;
local v46 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\157\203\67\80\27", "\126\219\185\34\61"));
v46.Size = UDim2.new(1 + 0, 0 + 0, 957 - (892 + 65), 30);
v46.Position = UDim2.new(0 - 0, 0, 0 - 0, 40);
v46.BackgroundTransparency = 1 - 0;
v46.Parent = v24;
local v51 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\42\220\95\127\123", "\135\108\174\62\18\30\23\147"));
v51.Size = UDim2.new(1, -(370 - (87 + 263)), 1, -(260 - (67 + 113)));
v51.Position = UDim2.new(0 + 0, 10, 0 - 0, 70);
v51.BackgroundTransparency = 1 + 0;
v51.Parent = v24;
local function v56(v141, v142)
	local v143 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\130\236\50\223\58\187\39\211\185\231", "\167\214\137\74\171\120\206\83"));
	v143.Size = UDim2.new(0 - 0, 1072 - (802 + 150), 1, 0);
	v143.Position = UDim2.new(0, (v142 - (2 - 1)) * (235 - 105), 0, 0 + 0);
	v143.BackgroundColor3 = Color3.fromRGB(1032 - (915 + 82), 35, 35);
	v143.Text = v141;
	v143.Font = Enum.Font.GothamBold;
	v143.TextColor3 = Color3.new(1, 2 - 1, 1 + 0);
	v143.TextSize = 17 - 3;
	v143.Parent = v46;
	return v143;
end
local v57 = {};
local v58 = {LUAOBFUSACTOR_DECRYPT_STR_0("\189\249\33\72\249\171", "\199\235\144\82\61\152"),LUAOBFUSACTOR_DECRYPT_STR_0("\36\25\180\41\6\2", "\75\103\118\217"),LUAOBFUSACTOR_DECRYPT_STR_0("\242\64\121\24\176\10\222", "\126\167\52\16\116\217")};
for v153, v154 in ipairs(v58) do
	local v155 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\238\60\33\141\177", "\156\168\78\64\224\212\121"));
	v155.Size = UDim2.new(1 - 0, 0, 1, 0 + 0);
	v155.BackgroundTransparency = 1;
	v155.Visible = v153 == 1;
	v155.Parent = v51;
	v57[v154] = v155;
end
for v161, v162 in ipairs(v58) do
	local v163 = v56(v162, v161);
	v163.MouseButton1Click:Connect(function()
		for v236, v237 in pairs(v57) do
			v237.Visible = v236 == v162;
		end
	end);
end
local v59 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\51\235\189\218\43\239\167\203\11", "\174\103\142\197"));
v59.Size = UDim2.new(1 - 0, 0, 1, 0 + 0);
v59.Position = UDim2.new(791 - (368 + 423), 0, 0 - 0, 0);
v59.BackgroundTransparency = 1;
v59.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\122\39\94\60\44\80\255\24\102\17", "\152\54\72\63\88\69\62");
v59.TextScaled = true;
v59.Font = Enum.Font.GothamBold;
v59.TextColor3 = Color3.new(1, 1, 19 - (10 + 8));
v59.Visible = false;
v59.Parent = v11;
local function v69()
	local v164, v165 = pcall(function()
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\199\204\225\75\252\209\236\28\215\197\226\80\209\192", "\60\180\164\142"));
		v59.Visible = true;
		task.wait(7 - 5);
		v59.Visible = false;
		v24.Visible = true;
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\85\95\12\39\1\255\19\85\91\69\58\34\249\82\76\81\69\63\46\254\27\90\82\0", "\114\56\62\101\73\71\141"));
		v24.Size = UDim2.new(0, 842 - (416 + 26), 0 - 0, 129 + 171);
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\181\232\210\202\158\251\218\201\189\169\200\205\162\236\155\215\189\253", "\164\216\137\187"));
	end);
	if not v164 then
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\247\244\35\189\180\190\2\220\166\34\186\169\233\35\199\228\107\242", "\107\178\134\81\210\198\158") .. v165);
	end
end
v16.MouseButton1Click:Connect(function()
	local v166, v167 = pcall(function()
		if v24.Visible then
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\16\7\134\207\164\63\78\143\199\163\54\40\144\199\167\61", "\202\88\110\226\166"));
			v24:TweenSize(UDim2.new(0, 0 - 0, 438 - (145 + 293), 430 - (44 + 386)), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1486.4 - (998 + 488), true, function()
				v24.Visible = false;
			end);
		else
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\240\7\141\224\195\205\8\194\250\203\202\1\164\229\203\206\10", "\170\163\111\226\151"));
			v24.Visible = true;
			v24.Size = UDim2.new(0, 0 + 0, 0, 0);
			v24:TweenSize(UDim2.new(0 + 0, 1172 - (201 + 571), 1138 - (116 + 1022), 300), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true);
		end
	end);
	if (not v166 or (572 > 4486)) then
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\52\34\160\55\92\119\32\31\112\166\55\73\48\37\20\18\167\44\90\56\39\75\112", "\73\113\80\210\88\46\87") .. v167);
	end
end);
print(LUAOBFUSACTOR_DECRYPT_STR_0("\162\62\200\19\243\136\34\202\82\236\132\53\234\7\238", "\135\225\76\173\114"));
local v70 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\41\238\170\181\169\179\128\15\228", "\199\122\141\216\208\204\221"));
v70.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\152\211\20\245\106\222\184\223\59\245\97\197\180\206\4\245\117", "\150\205\189\112\144\24");
v70.ResetOnSpawn = false;
v70.Parent = v4;
local v74 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\3\150\190\65\1", "\112\69\228\223\44\100\232\113"));
v74.Size = UDim2.new(0 - 0, 250, 0 + 0, 150);
v74.Position = UDim2.new(0.5 - 0, -125, 0.5 - 0, -75);
v74.BackgroundColor3 = Color3.fromRGB(879 - (814 + 45), 20, 20);
v74.BackgroundTransparency = 0.6 - 0;
v74.BorderSizePixel = 0;
v74.Parent = v70;
local v81 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\224\26\31\199\154\125\132\209\19", "\230\180\127\103\179\214\28"));
v81.Size = UDim2.new(1, 0, 0 + 0, 11 + 19);
v81.BackgroundTransparency = 1;
v81.TextScaled = true;
v81.Font = Enum.Font.GothamBold;
v81.TextColor3 = Color3.new(886 - (261 + 624), 1 - 0, 1081 - (1020 + 60));
v81.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\167\0\70\6\215\88\243\152\0\82", "\128\236\101\63\38\132\33");
v81.Parent = v74;
local v89 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\172\9\80\148\228\215", "\175\204\201\113\36\214\139"));
v89.Size = UDim2.new(1423.8 - (630 + 793), 0 - 0, 0, 30);
v89.Position = UDim2.new(0.1 - 0, 0, 0, 16 + 24);
v89.BackgroundColor3 = Color3.fromRGB(30, 30, 103 - 73);
v89.Text = "";
v89.PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\98\194\33\217\22\7\199\48\197\74\9\130", "\100\39\172\85\188");
v89.TextColor3 = Color3.new(1748 - (760 + 987), 1, 1);
v89.TextScaled = true;
v89.Font = Enum.Font.Gotham;
v89.Parent = v74;
local v100 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\153\125\161\148\17\184\108\173\143\61", "\83\205\24\217\224"));
v100.Size = UDim2.new(0.35, 0, 1913 - (1789 + 124), 796 - (745 + 21));
v100.Position = UDim2.new(0.1, 0, 0, 28 + 52);
v100.BackgroundColor3 = Color3.fromRGB(35, 96 - 61, 137 - 102);
v100.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\193\192\217\125\205\192\212", "\93\134\165\173");
v100.TextColor3 = Color3.new(1, 1 + 0, 1);
v100.TextScaled = true;
v100.Font = Enum.Font.GothamBold;
v100.Parent = v74;
local v109 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\138\247\217\214\24\219\166\106\177\252", "\30\222\146\161\162\90\174\210"));
v109.Size = UDim2.new(0.35, 0 + 0, 0, 30);
v109.Position = UDim2.new(0.55, 1055 - (87 + 968), 0, 352 - 272);
v109.BackgroundColor3 = Color3.fromRGB(32 + 3, 35, 35);
v109.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\198\70\117\9\238\14\91\15\252", "\106\133\46\16");
v109.TextColor3 = Color3.new(1, 1, 1);
v109.TextScaled = true;
v109.Font = Enum.Font.GothamBold;
v109.Parent = v74;
local v118 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\108\37\107\232\118\65\90\37\127", "\32\56\64\19\156\58"));
v118.Size = UDim2.new(0.8, 0, 0, 20);
v118.Position = UDim2.new(0.1 - 0, 0, 0, 120);
v118.BackgroundTransparency = 1414 - (447 + 966);
v118.Text = "";
v118.TextColor3 = Color3.new(2 - 1, 0, 1817 - (1703 + 114));
v118.TextScaled = true;
v118.Font = Enum.Font.Gotham;
v118.Parent = v74;
v100.MouseButton1Click:Connect(function()
	local v168, v169 = pcall(function()
		if ((1404 == 1404) and setclipboard) then
			setclipboard(v8);
			v118.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\118\193\235\93\26\241\143\74\193\224\82\27", "\224\58\168\133\54\58\146");
			v118.TextColor3 = Color3.new(0, 1, 0);
		else
			v118.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\122\90\66\237\119\137\134\25\93\22\69\242\97\198\148\30\73\70\68\239\97\131\131\74", "\107\57\54\43\157\21\230\231");
			v118.TextColor3 = Color3.new(702 - (376 + 325), 0 - 0, 0 - 0);
		end
	end);
	if (not v168 or (3748 < 2212)) then
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\254\153\3\250\171\156\198\213\203\22\240\173\247\202\194\169\4\225\173\211\193\129\203", "\175\187\235\113\149\217\188") .. v169);
	end
end);
v109.MouseButton1Click:Connect(function()
	local v170, v171 = pcall(function()
		local v214 = v89.Text;
		if ((v214 == "") or (1180 == 2180)) then
			v118.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\25\161\149\73\241\57\121\124\164\132\85\162", "\24\92\207\225\44\131\25");
			v118.TextColor3 = Color3.new(1, 0 + 0, 0 - 0);
			return;
		end
		if v10(v214) then
			v118.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\96\214\161\12\13\120\89\218\190\69\30\121\10", "\29\43\179\216\44\123");
			v118.TextColor3 = Color3.new(14 - (9 + 5), 1, 0);
			v9 = true;
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\150\220\57\12\171\220\50\69\187\208\37\72\241\153\36\73\174\205\50\67\164\208\46\75\253\210\37\85\154\204\41", "\44\221\185\64"));
			v70:Destroy();
			task.wait(0.5);
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\36\233\73\93\127\8\233\79\31\126\0\238\70\120\102\8", "\19\97\135\40\63"));
			v11.Enabled = true;
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\141\93\63\55\38\63\169\28\32\51\32\38\134\73\49", "\81\206\60\83\91\79"));
			v69();
		else
			v118.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\103\165\198\115\35\202\73\228\69\174\201\51", "\196\46\203\176\18\79\163\45");
			v118.TextColor3 = Color3.new(1, 376 - (85 + 291), 0);
		end
	end);
	if not v170 then
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\157\48\108\17\54\187\230\182\98\125\22\33\248\228\147\39\103\60\49\239\251\183\44\36\94", "\143\216\66\30\126\68\155") .. v171);
	end
end);
local function v127()
	local v172 = Color3.fromRGB(1520 - (243 + 1022), 0 - 0, 0);
	local v173 = {};
	local function v174(v215, v216)
		if ((4090 < 4653) and v215:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\130\205\12\207", "\129\202\168\109\171\165\195\183")) and not v215:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\7\86\50\213\199\49\213\18", "\134\66\56\87\184\190\116"))) then
			local v272 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\20\56\14\179\21\226\38\61\40", "\85\92\81\105\219\121\139\65"));
			v272.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\216\189\85\72\101\247\244\180\88\73\117\216\245\167", "\191\157\211\48\37\28");
			v272.FillColor = v172;
			v272.OutlineColor = Color3.new(0 + 0, 0, 0);
			v272.FillTransparency = 0.45;
			v272.OutlineTransparency = 1180 - (1123 + 57);
			v272.Parent = v215;
			v272.Adornee = v215;
			local v280 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\253\22\248\16\56\208\30\230\24\29\202\22", "\90\191\127\148\124"));
			v280.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\93\137\43\26\97\162\29\39", "\119\24\231\78");
			v280.AlwaysOnTop = true;
			v280.Size = UDim2.new(0 + 0, 60, 254 - (163 + 91), 20);
			v280.Adornee = v215:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\40\164\78", "\113\226\77\197\42\188\32"));
			v280.Parent = v215;
			local v286 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\14\19\236\161\22\23\246\176\54", "\213\90\118\148"), v280);
			v286.Size = UDim2.new(1, 0, 1, 1930 - (1869 + 61));
			v286.BackgroundTransparency = 1 + 0;
			v286.TextColor3 = v172;
			v286.TextStrokeTransparency = 0.6 - 0;
			v286.Font = Enum.Font.SourceSans;
			v286.TextSize = 9 - 2;
			v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\126\32\177\91\84", "\45\59\78\212\54");
			if (v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\39\87\143\128\131\60", "\144\112\54\227\235\230\78\205")) or (2652 < 196)) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\132\41\3\247\213\73", "\59\211\72\111\156\176");
			elseif ((4135 < 4817) and v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\108\134\237\38\75\149", "\77\46\231\131"))) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\152\85\184\75\191\70", "\32\218\52\214");
			elseif ((272 == 272) and v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\124\2\63\166\244\162", "\58\46\119\81\200\145\208\37"))) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\25\153\62\162\172\175", "\86\75\236\80\204\201\221");
			elseif ((100 <= 3123) and v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\64\68\97\138\242\157\119\83", "\235\18\33\23\229\158"))) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\127\175\213\183\81\173", "\219\48\218\161");
			elseif v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\210\112\113\89\210\93\229", "\128\132\17\28\41\187\47")) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\55\51\11\42\84\19\55", "\61\97\82\102\90");
			elseif (v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\159\38\164\95\192\66\16", "\105\204\78\203\43\167\55\126")) or (1369 > 4987)) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\138\191\55\18\18\19", "\49\197\202\67\126\115\100\167");
			elseif (v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\2\85\214\42\143\68\80", "\62\87\59\191\73\224\54")) or (863 >= 4584)) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\210\12\243\202\232\16\244", "\169\135\98\154");
			elseif v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\252\114\54\81\234\60\196\205", "\168\171\23\68\52\157\83")) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\195\116\231\168\50\34\139\242", "\231\148\17\149\205\69\77");
			elseif v216:find(LUAOBFUSACTOR_DECRYPT_STR_0("\178\174\193\247\82", "\159\224\199\167\155\55")) then
				v286.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\216\230\40\222\246\228", "\178\151\147\92");
			end
			local v295 = v215:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\164\232\65\51\28\67\115\136", "\26\236\157\44\82\114\44"));
			if v295 then
				v295.Died:Connect(function()
					if (v280 or (724 >= 1668)) then
						v280:Destroy();
					end
				end);
			end
			v173[v215] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\2\39\210\83\38\39\210\83\62", "\59\74\78\181")]=v272,[LUAOBFUSACTOR_DECRYPT_STR_0("\7\216\86\86\177\42\208\72\94", "\211\69\177\58\58")]=v280};
		end
	end
	for v217, v218 in pairs(workspace:GetDescendants()) do
		if (v218:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\154\234\125\240\229", "\171\215\133\25\149\137")) and v218:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\221\63\251\225\63\245\70", "\34\129\168\82\154\143\80\156")) and v218.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\168\189\55\14\68\113", "\233\229\210\83\107\40\46"))) then
			v174(v218, v218.Name);
		end
	end
	local v175;
	v175 = workspace.DescendantAdded:Connect(function(v219)
		if ((428 < 1804) and v219:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\236\77\54\211\9", "\101\161\34\82\182")) and v219:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\192\24\84\255\213\237\139\42", "\78\136\109\57\158\187\130\226")) and v219.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\19\48\253\244\50\0", "\145\94\95\153"))) then
			v174(v219, v219.Name);
		end
	end);
	return function()
		for v239, v240 in pairs(v173) do
			if v240.Highlight then
				v240.Highlight:Destroy();
			end
			if (v240.Billboard or (3325 > 4613)) then
				v240.Billboard:Destroy();
			end
		end
		v173 = {};
		v175:Disconnect();
	end;
end
local function v128()
	local v176 = {LUAOBFUSACTOR_DECRYPT_STR_0("\207\196\18\217\75", "\215\157\173\116\181\46"),LUAOBFUSACTOR_DECRYPT_STR_0("\6\188\132\230\221\32\186", "\186\85\212\235\146"),LUAOBFUSACTOR_DECRYPT_STR_0("\240\132\0\241\53\248\93\208", "\56\162\225\118\158\89\142")};
	local v177 = {};
	local function v178(v220)
		for v241, v242 in ipairs(v176) do
			if v220:lower():find(v242:lower()) then
				return true;
			end
		end
		return false;
	end
	local function v179(v221, v222)
		if (not v221:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\117\17\197\162\7\235\108", "\184\60\101\160\207\66")) or (4950 <= 4553)) then
			local v297 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\19\139\112\176\51\141\125\174\53\165\105\181", "\220\81\226\28"));
			v297.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\58\193\135\246\207\244\35", "\167\115\181\226\155\138");
			v297.Adornee = v221;
			v297.AlwaysOnTop = true;
			v297.Size = UDim2.new(0 + 0, 82 - 22, 0 + 0, 1494 - (1329 + 145));
			v297.StudsOffset = Vector3.new(0, 2, 0);
			v297.Parent = v221;
			local v304 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\214\39\255\72\87\112\196\231\46", "\166\130\66\135\60\27\17"), v297);
			v304.Size = UDim2.new(1, 971 - (140 + 831), 1, 1850 - (1409 + 441));
			v304.BackgroundTransparency = 719 - (15 + 703);
			v304.Text = v222;
			v304.TextColor3 = Color3.new(1 + 0, 0, 438 - (262 + 176));
			v304.TextStrokeTransparency = 0.3;
			v304.TextScaled = true;
			v304.Font = Enum.Font.SourceSansBold;
			v177[v221] = v297;
		end
	end
	for v223, v224 in pairs(workspace:GetDescendants()) do
		if v178(v224.Name) then
			local v314 = nil;
			if ((2665 <= 3933) and v224:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\102\75\221\112\0\69\88\218", "\80\36\42\174\21"))) then
				v314 = v224;
			elseif (v224:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\99\31\51\127\66", "\26\46\112\87")) and v224:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\137\49\162\121\190\173\92\132\184\49\191", "\212\217\67\203\20\223\223\37"))) then
				v314 = v224.PrimaryPart;
			elseif ((3273 == 3273) and v224:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\151\130\172\215\182", "\178\218\237\200")) and v224:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\158\180\232\212\186\176", "\176\214\213\134"))) then
				v314 = v224.Handle;
			end
			if v314 then
				v179(v314, v224.Name);
			end
		end
	end
	local v180;
	v180 = workspace.DescendantAdded:Connect(function(v225)
		if v178(v225.Name) then
			local v315 = nil;
			if ((3824 > 409) and v225:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\214\172\165\209\152\87\75\224", "\57\148\205\214\180\200\54"))) then
				v315 = v225;
			elseif (v225:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\63\242\49\49\122", "\22\114\157\85\84")) and v225:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\244\217\26\201\92\228\177\244\202\1\208", "\200\164\171\115\164\61\150"))) then
				v315 = v225.PrimaryPart;
			elseif ((2087 == 2087) and v225:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\147\251\7\64\143", "\227\222\148\99\37")) and v225:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\27\83\92\242\245\54", "\153\83\50\50\150"))) then
				v315 = v225.Handle;
			end
			if v315 then
				v179(v315, v225.Name);
			end
		end
	end);
	return function()
		for v243, v244 in pairs(v177) do
			if v244 then
				v244:Destroy();
			end
		end
		v177 = {};
		v180:Disconnect();
	end;
end
local function v129()
	local v181 = Vector3.new(20, 1741 - (345 + 1376), 20);
	local v182 = 689 - (198 + 490);
	local v183 = Color3.fromRGB(1126 - 871, 0, 0 - 0);
	local v184 = {};
	local function v185(v226)
		local v227 = v226:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\117\99\126\29\125\164\68\89\68\124\19\103\155\76\79\98", "\45\61\22\19\124\19\203")) or v226:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\233\23\12\241", "\217\161\114\109\149\98\16"));
		if ((v227 and not v227:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\58\41\44\126\179\108\55\56\40\125\178\112\23\36", "\20\114\64\88\28\220"))) or (3404 > 4503)) then
			v184[v227] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\2\8\200\177", "\221\81\97\178\212\152\176")]=v227.Size,[LUAOBFUSACTOR_DECRYPT_STR_0("\249\245\28\245\9\221\230\15\254\20\206\254", "\122\173\135\125\155")]=v227.Transparency,[LUAOBFUSACTOR_DECRYPT_STR_0("\167\206\12\182\45", "\168\228\161\96\217\95\81")]=v227.Color,[LUAOBFUSACTOR_DECRYPT_STR_0("\246\208\58\89\61\94\218\221", "\55\187\177\78\60\79")]=v227.Material,[LUAOBFUSACTOR_DECRYPT_STR_0("\14\207\81\200\73\195\140\36\202\90", "\224\77\174\63\139\38\175")]=v227.CanCollide};
			v227.Size = v181;
			v227.Transparency = v182;
			v227.Color = v183;
			v227.Material = Enum.Material.Neon;
			v227.CanCollide = false;
			local v323 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\166\78\87\34\178\64\84\59\129", "\78\228\33\56"));
			v323.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\230\119\166\1\138\214\91\170\19\132\192\122\183\7", "\229\174\30\210\99");
			v323.Parent = v227;
		end
	end
	for v228, v229 in ipairs(workspace:GetDescendants()) do
		if (v229:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\54\226\130\84\225", "\89\123\141\230\49\141\93")) and v229.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\222\126\242\9\28\117", "\42\147\17\150\108\112")) and v229:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\39\179\32\126\233\231\6\162", "\136\111\198\77\31\135"))) then
			v185(v229);
		end
	end
	local v186;
	v186 = workspace.DescendantAdded:Connect(function(v230)
		if (v230:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\47\6\163\83\177", "\201\98\105\199\54\221\132\119")) and v230.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\148\3\135\36\14\10", "\204\217\108\227\65\98\85")) and v230:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\118\214\248\228\34\207\87\199", "\160\62\163\149\133\76"))) then
			v185(v230);
		end
	end);
	return function()
		for v245, v246 in pairs(v184) do
			if (v245 and v245.Parent) then
				v245.Size = v246.Size;
				v245.Transparency = v246.Transparency;
				v245.Color = v246.Color;
				v245.Material = v246.Material;
				v245.CanCollide = v246.CanCollide;
				local v339 = v245:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\169\25\45\204\206\133\21\63\194\216\164\8\43", "\163\182\192\109\79"));
				if (v339 or (3506 <= 1309)) then
					v339:Destroy();
				end
			end
		end
		v184 = {};
		v186:Disconnect();
	end;
end
local function v130()
	local v187 = LUAOBFUSACTOR_DECRYPT_STR_0("\28\35\1\196", "\149\84\70\96\160");
	local v188 = 500;
	local v189 = true;
	local function v190()
		local v231 = nil;
		local v232 = math.huge;
		for v247, v248 in ipairs(workspace:GetDescendants()) do
			if ((2955 == 2955) and v248:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\21\9\9\232\52", "\141\88\102\109")) and v248.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\158\92\206\117\22\2", "\161\211\51\170\16\122\93\53")) and v248:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\211\187\191\41\245\161\187\44", "\72\155\206\210")) and v248:FindFirstChild(v187) and (v248:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\110\111\89\15\61\73\115\80", "\83\38\26\52\110")).Health > (1206 - (696 + 510)))) then
				local v340, v341 = v6:WorldToViewportPoint(v248[v187].Position);
				if v341 then
					local v359 = (Vector2.new(v5.X, v5.Y) - Vector2.new(v340.X, v340.Y)).Magnitude;
					if ((v359 < v232) and (v359 < (524 - 274))) then
						v231 = v248[v187];
						v232 = v359;
					end
				end
			end
		end
		return v231;
	end
	local v191 = getrawmetatable(game);
	local v192 = v191.__namecall;
	setreadonly(v191, false);
	v191.__namecall = newcclosure(function(v233, ...)
		local v234 = {...};
		local v235 = getnamecallmethod();
		if (v189 and (tostring(v235) == LUAOBFUSACTOR_DECRYPT_STR_0("\106\22\62\69\89\4\51", "\38\56\119\71")) and (typeof(v234[1 + 1]) == LUAOBFUSACTOR_DECRYPT_STR_0("\197\234\91\194\42\68\160", "\54\147\143\56\182\69"))) then
			local v326 = v190();
			if (v326 or (2903 == 1495)) then
				v234[6 - 4] = (v326.Position - v234[1]).Unit * 1000;
				return v192(v233, unpack(v234));
			end
		end
		return v192(v233, ...);
	end);
	return function()
		v189 = false;
		setreadonly(v191, true);
	end;
end
local function v131()
	if not _G.FullbrightEnabled then
		_G.FullbrightEnabled = true;
		_G.NormalLightingSettings = {[LUAOBFUSACTOR_DECRYPT_STR_0("\244\147\246\78\215\194\143\250\90\204", "\191\182\225\159\41")]=v2.Brightness,[LUAOBFUSACTOR_DECRYPT_STR_0("\8\30\39\86\128\179\203\38\23", "\162\75\114\72\53\235\231")]=v2.ClockTime,[LUAOBFUSACTOR_DECRYPT_STR_0("\170\51\67\199\93\6", "\98\236\92\36\130\51")]=v2.FogEnd,[LUAOBFUSACTOR_DECRYPT_STR_0("\131\21\3\184\68\164\134\56\165\29\3\173\86", "\80\196\121\108\218\37\200\213")]=v2.GlobalShadows,[LUAOBFUSACTOR_DECRYPT_STR_0("\33\126\0\118\78\0\158", "\234\96\19\98\31\43\110")]=v2.Ambient,[LUAOBFUSACTOR_DECRYPT_STR_0("\41\10\70\195\163\125\153\39\18\80\206\169\124\159", "\235\102\127\50\167\204\18")]=v2.OutdoorAmbient};
		v2.Brightness = 6 - 4;
		v2.ClockTime = 386 - (123 + 251);
		v2.FogEnd = 100000;
		v2.GlobalShadows = false;
		v2.Ambient = Color3.new(1, 4 - 3, 699 - (208 + 490));
		v2.OutdoorAmbient = Color3.new(1, 1, 1 + 0);
		return function()
			if _G.FullbrightEnabled then
				_G.FullbrightEnabled = false;
				local v344 = _G.NormalLightingSettings;
				v2.Brightness = v344.Brightness;
				v2.ClockTime = v344.ClockTime;
				v2.FogEnd = v344.FogEnd;
				v2.GlobalShadows = v344.GlobalShadows;
				v2.Ambient = v344.Ambient;
				v2.OutdoorAmbient = v344.OutdoorAmbient;
			end
		end;
	end
end
local function v132(v194, v195)
	local v196 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\100\164\237\55\102\59\68\181\250\45", "\78\48\193\149\67\36"));
	v196.Size = UDim2.new(0, 90 + 110, 836 - (660 + 176), 40);
	v196.Position = UDim2.new(0.5, -(13 + 87), 202 - (14 + 188), (#v195:GetChildren() * 50) + 50);
	v196.BackgroundColor3 = Color3.fromRGB(710 - (534 + 141), 35, 15 + 20);
	v196.Text = v194;
	v196.Font = Enum.Font.GothamBold;
	v196.TextColor3 = Color3.new(1, 1, 1 + 0);
	v196.TextSize = 14 + 0;
	v196.Parent = v195;
	local v206 = nil;
	v196.MouseButton1Click:Connect(function()
		if ((4546 >= 2275) and (v196.BackgroundColor3 == Color3.fromRGB(73 - 38, 55 - 20, 98 - 63))) then
			v196.BackgroundColor3 = Color3.fromRGB(0, 137 + 118, 0);
			if ((819 >= 22) and (v194 == LUAOBFUSACTOR_DECRYPT_STR_0("\21\45\176", "\33\80\126\224\120"))) then
				v206 = v127();
			elseif ((3162 == 3162) and (v194 == LUAOBFUSACTOR_DECRYPT_STR_0("\197\188\6\201\28\170\232\34\201\81\227\232\38\247\108", "\60\140\200\99\164"))) then
				v206 = v128();
			elseif ((v194 == LUAOBFUSACTOR_DECRYPT_STR_0("\175\253\16\36\173\159", "\194\231\148\100\70")) or (2369 > 4429)) then
				v206 = v129();
			elseif (v194 == LUAOBFUSACTOR_DECRYPT_STR_0("\117\69\205\166\248\220\6\109\200\174", "\168\38\44\161\195\150")) then
				v206 = v130();
			elseif (v194 == LUAOBFUSACTOR_DECRYPT_STR_0("\166\233\142\122\50\250\191\17\136\232", "\118\224\156\226\22\80\136\214")) then
				v206 = v131();
			end
		elseif (v196.BackgroundColor3 == Color3.fromRGB(0, 255, 0)) then
			v196.BackgroundColor3 = Color3.fromRGB(255, 0, 0 + 0);
			if v206 then
				v206();
				v206 = nil;
			end
		else
			v196.BackgroundColor3 = Color3.fromRGB(431 - (115 + 281), 81 - 46, 29 + 6);
		end
	end);
end
local v133 = v57[LUAOBFUSACTOR_DECRYPT_STR_0("\116\231\74\149\67\226", "\224\34\142\57")];
local v134 = v57[LUAOBFUSACTOR_DECRYPT_STR_0("\253\168\200\223\114\229", "\110\190\199\165\189\19\145\61")];
local v135 = v57[LUAOBFUSACTOR_DECRYPT_STR_0("\239\255\126\228\130\211\195", "\167\186\139\23\136\235")];
v132(LUAOBFUSACTOR_DECRYPT_STR_0("\63\134\184", "\109\122\213\232"), v133);
v132(LUAOBFUSACTOR_DECRYPT_STR_0("\199\227\167\61\174\177\226\17\227\250\173\112\203\196\146", "\80\142\151\194"), v133);
v132(LUAOBFUSACTOR_DECRYPT_STR_0("\43\207\99\78\12\222", "\44\99\166\23"), v134);
v132(LUAOBFUSACTOR_DECRYPT_STR_0("\79\254\37\51\61\176\60\214\32\59", "\196\28\151\73\86\83"), v134);
v132(LUAOBFUSACTOR_DECRYPT_STR_0("\213\22\37\28\128\74\17\113\251\23", "\22\147\99\73\112\226\56\120"), v135);
local v136, v137, v138, v139;
v24.InputBegan:Connect(function(v207)
	if ((4095 >= 3183) and (v207.UserInputType == Enum.UserInputType.MouseButton1)) then
		v136 = true;
		v138 = v207.Position;
		v139 = v24.Position;
		v207.Changed:Connect(function()
			if ((v207.UserInputState == Enum.UserInputState.End) or (3711 < 1008)) then
				v136 = false;
			end
		end);
	end
end);
v24.InputChanged:Connect(function(v208)
	if (v136 and (v208.UserInputType == Enum.UserInputType.MouseMovement)) then
		local v257 = v208.Position - v138;
		v24.Position = UDim2.new(v139.X.Scale, v139.X.Offset + v257.X, v139.Y.Scale, v139.Y.Offset + v257.Y);
	end
end);