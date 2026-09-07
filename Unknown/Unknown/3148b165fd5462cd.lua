-- hi, follow me in instagram: @litlledracula

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
local a = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167"));
local b = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\17\216\36\246\249\49\219\35\198\249", "\156\67\173\74\165"));
local c = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\164\76\4\149\40\86\33\163\122\19\174\48\79\55\178", "\38\84\215\41\118\220\70"));
local d = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\100\1\39\23\240\99\19\48\4\247\83\19", "\158\48\118\66\114"));
local e = a.LocalPlayer;
local f = e.Character or e.CharacterAdded:Wait();
local g = {[LUAOBFUSACTOR_DECRYPT_STR_0("\130\48\21\59\93\164\246\174", "\155\203\68\112\86\19\197")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\207\37\249\78\121\233\203\86\220\33\242\112\119\236\246\82", "\152\38\189\86\156\32\24\133"),[LUAOBFUSACTOR_DECRYPT_STR_0("\217\100\151\101\243\91\168\84", "\38\156\55\199")]=Color3.fromRGB(255, 70, 70),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\78\76\26\22\114\232\70\187\117\78\41\7\113", "\35\200\29\28\72\115\20\154")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\52\190\201\235\157\8\61\10\171\208\209\142\41", "\84\121\223\177\191\237\76")]=2000,[LUAOBFUSACTOR_DECRYPT_STR_0("\149\89\202\172\51\64\27\196\162", "\161\219\54\169\192\90\48\80")]=Enum.KeyCode.N,[LUAOBFUSACTOR_DECRYPT_STR_0("\125\77\7\34\69\71\53\12\98\71\25", "\69\41\34\96")]=Enum.KeyCode.RightControl,[LUAOBFUSACTOR_DECRYPT_STR_0("\159\204\216\6\6\36\171\205\227\3\15\46", "\75\220\163\183\106\98")]=3,[LUAOBFUSACTOR_DECRYPT_STR_0("\46\187\133\48\204\3\189\142\36", "\185\98\218\235\87")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\238\50\32\234\215\185\195", "\202\171\92\71\134\190")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\29\200\56\132\44", "\232\73\161\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\154\203\81\88\16\186\213\2\108\11\190\202\86\29\54\190\213\82\88\12\251\233\80\82", "\126\219\185\34\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\32\207\80\117\107\118\244\226", "\135\108\174\62\18\30\23\147")]=LUAOBFUSACTOR_DECRYPT_STR_0("\154\232\36\204\13\175\52\194\236", "\167\214\137\74\171\120\206\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\165\255\49\81\241\183", "\199\235\144\82\61\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\41\25\186\39\14\6\227", "\75\103\118\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\243\81\124\17\169\17\213\64", "\126\167\52\16\116\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\252\43\44\133\164\22\238\220\110\52\143\244\48\232\205\35", "\156\168\78\64\224\212\121"),[LUAOBFUSACTOR_DECRYPT_STR_0("\35\231\182\218\6\224\166\203", "\174\103\142\197")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\33\76\44\36\80\251\83\114\31\22\106\127", "\152\54\72\63\88\69\62"),[LUAOBFUSACTOR_DECRYPT_STR_0("\251\194\232", "\60\180\164\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\119\120\35", "\114\56\62\101\73\71\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\151\231", "\164\216\137\187")]=LUAOBFUSACTOR_DECRYPT_STR_0("\253\200", "\107\178\134\81\210\198\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\27\1\141\202\174\55\25\140", "\202\88\110\226\166")]=LUAOBFUSACTOR_DECRYPT_STR_0("\224\0\141\251\206\204\24\140", "\170\163\111\226\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\48\34\161\61\64\54\37\56\36\183\53", "\73\113\80\210\88\46\87")]=LUAOBFUSACTOR_DECRYPT_STR_0("\160\62\222\23\233\128\32\141\59\243\132\33", "\135\225\76\173\114"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\226\187\188\165\173\136\28\235\149\181\191\174\166\29\232", "\199\122\141\216\208\204\221")]=LUAOBFUSACTOR_DECRYPT_STR_0("\135\200\29\224\56\226\162\157\2\245\108\227\191\211\80\228\119\182\163\210\2\253\121\250\236", "\150\205\189\112\144\24")},[LUAOBFUSACTOR_DECRYPT_STR_0("\21\139\173\88\17\143\4\21\54\129", "\112\69\228\223\44\100\232\113")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\224\22\19\223\179", "\230\180\127\103\179\214\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("\173\16\71\79\232\72\225\158\69\91\67\164\96\242\159\0\81\71\232\1\208\158\10", "\128\236\101\63\38\132\33"),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\168\31\67\163\234\200\169", "\175\204\201\113\36\214\139")]=LUAOBFUSACTOR_DECRYPT_STR_0("\110\200\60\211\9\70\150", "\100\39\172\85\188"),[LUAOBFUSACTOR_DECRYPT_STR_0("\131\119\186\140\58\189", "\83\205\24\217\224")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\202\206\49\239\213\151", "\93\134\165\173"),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\247\205\199\42\193\160\106", "\30\222\146\161\162\90\174\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\75\124\15\245\65\98\30\228\92\48\26\228\92\113\74\204\90\117\7", "\106\133\46\16"),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\41\96\232\91\78\91\37", "\32\56\64\19\156\58")]="Distância: N/A",[LUAOBFUSACTOR_DECRYPT_STR_0("\117\206\227", "\224\58\168\133\54\58\146")]=LUAOBFUSACTOR_DECRYPT_STR_0("\125\115\120\209\92\161\166\47\118", "\107\57\54\43\157\21\230\231"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\133", "\175\187\235\113\149\217\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\16\134\166\109\199\86", "\24\92\207\225\44\131\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\220\183\64\31\114\92\221", "\29\43\179\216\44\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\143\220\35\77\175\203\37\75\188\215\36\67", "\44\221\185\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\32\245\91\90\125\0\235\97\75\118\12", "\19\97\135\40\63")]=LUAOBFUSACTOR_DECRYPT_STR_0("\135\72\54\54\111\16\188\79\54\53\46\61", "\81\206\60\83\91\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\96\164\211\126\38\211\98\162\72\134\213\97\60\194\74\161", "\196\46\203\176\18\79\163\45")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\55\114\27\100\235\238\170\35\62\8\43\247\251\185\48\62\31\43\187\225\183\48\115\31\40\186", "\143\216\66\30\126\68\155")}}};
local h = {[LUAOBFUSACTOR_DECRYPT_STR_0("\134\201\3\204\208\162\208\228", "\129\202\168\109\171\165\195\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\7\86\48\212\215\7\238", "\134\66\56\87\184\190\116"),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\62\10\183\16\251", "\85\92\81\105\219\121\139\65")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\200\154", "\191\157\211\48\37\28")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\250\44\196", "\90\191\127\148\124")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\76\130\34\18\104\136\60\3\91\163", "\119\24\231\78")]=false};
local i = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\177\46\183\79\217\78\54\151\36", "\113\226\77\197\42\188\32"));
i.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\27\4\231\176\52\23\248\157\63\26\228\176\40\38\230\186\5", "\213\90\118\148") .. tostring(math.random(1000, 9999));
i.ResetOnSpawn = false;
i.Parent = e.PlayerGui;
local j = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\125\60\181\91\72", "\45\59\78\212\54"));
j.Size = UDim2.new(0, 320, 0, 200);
j.Position = UDim2.new(0.5, -160, 0.1, 0);
j.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
j.BackgroundTransparency = 0.15;
j.BorderSizePixel = 0;
j.Parent = i;
local k = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\37\127\160\132\148\32\168\226", "\144\112\54\227\235\230\78\205"));
k.CornerRadius = UDim.new(0, 8);
k.Parent = j;
local l = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\134\1\60\232\194\84\184\45", "\59\211\72\111\156\176"));
l.Color = Color3.fromRGB(60, 60, 60);
l.Thickness = 2;
l.Parent = j;
local m = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\104\149\226\32\75", "\77\46\231\131"));
m.Size = UDim2.new(1, 0, 0, 35);
m.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
m.Parent = j;
local n = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\142\81\174\84\150\85\180\69\182", "\32\218\52\214"));
n.Size = UDim2.new(1, -40, 1, 0);
n.Position = UDim2.new(0, 10, 0, 0);
n.BackgroundTransparency = 1;
n.TextColor3 = Color3.fromRGB(220, 220, 220);
n.Font = Enum.Font.GothamBold;
n.TextSize = 16;
n.TextXAlignment = Enum.TextXAlignment.Left;
n.Text = g.Languages[h.Language].Title;
n.Parent = m;
local o = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\122\18\41\188\211\165\81\78\65\25", "\58\46\119\81\200\145\208\37"));
o.Size = UDim2.new(0, 35, 0, 35);
o.Position = UDim2.new(1, -35, 0, 0);
o.BackgroundTransparency = 1;
o.TextColor3 = Color3.fromRGB(220, 220, 220);
o.Text = "X";
o.Font = Enum.Font.GothamBold;
o.TextSize = 18;
o.Parent = m;
local p = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\13\158\49\161\172", "\86\75\236\80\204\201\221"));
p.Size = UDim2.new(1, -20, 1, -45);
p.Position = UDim2.new(0, 10, 0, 40);
p.BackgroundTransparency = 1;
p.Parent = j;
local q = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\84\83\118\136\251", "\235\18\33\23\229\158"));
q.Size = UDim2.new(1, 0, 0, 30);
q.BackgroundTransparency = 1;
q.Parent = p;
local r = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\100\191\217\175\124\187\195\190\92", "\219\48\218\161"));
r.Size = UDim2.new(0.4, 0, 1, 0);
r.BackgroundTransparency = 1;
r.TextColor3 = Color3.fromRGB(180, 180, 180);
r.Font = Enum.Font.Gotham;
r.TextSize = 14;
r.TextXAlignment = Enum.TextXAlignment.Left;
r.Text = g.Languages[h.Language].Language;
r.Parent = q;
local s = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\208\116\100\93\249\90\244\240\126\114", "\128\132\17\28\41\187\47"));
s.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\36\60\1\54\84\18\58\36\47\73\21\61\8", "\61\97\82\102\90");
s.Size = UDim2.new(0.25, -5, 0.8, 0);
s.Position = UDim2.new(0.4, 0, 0.1, 0);
s.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\137\32\172\71\206\68\22", "\105\204\78\203\43\167\55\126");
s.Font = Enum.Font.Gotham;
s.TextSize = 14;
s.Parent = q;
local t = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\145\175\59\10\49\17\211\69\170\164", "\49\197\202\67\126\115\100\167"));
t.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\7\84\205\61\149\81\75\50\72\218\11\149\66\74\56\85", "\62\87\59\191\73\224\54");
t.Size = UDim2.new(0.25, -5, 0.8, 0);
t.Position = UDim2.new(0.65, 5, 0.1, 0);
t.Text = "Português";
t.Font = Enum.Font.Gotham;
t.TextSize = 14;
t.Parent = q;
local u = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\193\16\251\196\226", "\169\135\98\154"));
u.Size = UDim2.new(1, 0, 0, 30);
u.Position = UDim2.new(0, 0, 0, 35);
u.BackgroundTransparency = 1;
u.Parent = p;
local v = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\255\114\60\64\209\50\202\206\123", "\168\171\23\68\52\157\83"));
v.Size = UDim2.new(0.4, 0, 1, 0);
v.BackgroundTransparency = 1;
v.TextColor3 = Color3.fromRGB(180, 180, 180);
v.Font = Enum.Font.Gotham;
v.TextSize = 14;
v.TextXAlignment = Enum.TextXAlignment.Left;
v.Text = g.Languages[h.Language].Noclip;
v.Parent = u;
local w = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\192\116\237\185\7\56\147\224\126\251", "\231\148\17\149\205\69\77"));
w.Size = UDim2.new(0.25, 0, 0.8, 0);
w.Position = UDim2.new(0.4, 0, 0.1, 0);
w.Font = Enum.Font.GothamBold;
w.TextSize = 14;
w.Text = g.Languages[h.Language].Off;
w.Parent = u;
local x = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\180\162\223\239\117\234\148\179\200\245", "\159\224\199\167\155\55"));
x.Size = UDim2.new(1, 0, 0, 35);
x.Position = UDim2.new(0, 0, 0, 70);
x.Font = Enum.Font.GothamBold;
x.TextSize = 16;
x.Text = g.Languages[h.Language].Teleport;
x.Parent = p;
local y = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\195\246\36\198\219\242\62\215\251", "\178\151\147\92"));
y.Size = UDim2.new(1, 0, 0, 25);
y.Position = UDim2.new(0, 0, 0, 110);
y.BackgroundTransparency = 1;
y.TextColor3 = Color3.fromRGB(180, 180, 180);
y.Font = Enum.Font.Gotham;
y.TextSize = 14;
y.TextXAlignment = Enum.TextXAlignment.Left;
y.Text = g.Languages[h.Language].Distance;
y.Parent = p;
local function z(A)
	local B = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\184\248\84\38\62\77\120\137\241", "\26\236\157\44\82\114\44"));
	B.Text = A;
	B.Size = UDim2.new(0, 300, 0, 40);
	B.Position = UDim2.new(0.5, -150, 0.8, 0);
	B.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
	B.TextColor3 = Color3.fromRGB(255, 255, 255);
	B.Font = Enum.Font.GothamBold;
	B.TextSize = 14;
	B.TextWrapped = true;
	B.Parent = i;
	local C = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\31\7\246\84\56\32\208\73", "\59\74\78\181"));
	C.CornerRadius = UDim.new(0, 8);
	C.Parent = B;
	local D = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\16\248\105\78\161\42\218\95", "\211\69\177\58\58"));
	D.Color = Color3.fromRGB(100, 100, 100);
	D.Thickness = 2;
	D.Parent = B;
	local E = TweenInfo.new(3, Enum.EasingStyle.Linear);
	local F = d:Create(B, E, {[LUAOBFUSACTOR_DECRYPT_STR_0("\131\224\97\225\221\217\182\235\106\229\232\217\178\235\122\236", "\171\215\133\25\149\137")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\195\201\49\241\232\34\243\87\239\204\6\232\238\62\239\82\224\218\55\244\236\41", "\34\129\168\82\154\143\80\156")]=1});
	F:Play();
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\161\183\49\25\65\93", "\233\229\210\83\107\40\46")):AddItem(B, 3.1);
end
local function G()
	local H = g.Languages[h.Language];
	n.Text = H.Title;
	r.Text = H.Language;
	v.Text = H.Noclip;
	x.Text = (h.TeleportCD and (H.Teleport .. LUAOBFUSACTOR_DECRYPT_STR_0("\129\10", "\101\161\34\82\182") .. H.Cooldown .. ")")) or H.Teleport;
	y.Text = H.Distance;
	if h.Noclip then
		w.Text = H.On;
		w.BackgroundColor3 = Color3.fromRGB(50, 150, 50);
	else
		w.Text = H.Off;
		w.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
	end
	s.BackgroundColor3 = ((h.Language == LUAOBFUSACTOR_DECRYPT_STR_0("\205\3\94\242\210\241\138", "\78\136\109\57\158\187\130\226")) and Color3.fromRGB(70, 130, 200)) or Color3.fromRGB(50, 50, 50);
	t.BackgroundColor3 = ((h.Language == LUAOBFUSACTOR_DECRYPT_STR_0("\14\48\235\229\43\56\236\244\45\58", "\145\94\95\153")) and Color3.fromRGB(70, 130, 200)) or Color3.fromRGB(50, 50, 50);
	x.BackgroundColor3 = (h.TeleportCD and Color3.fromRGB(80, 80, 80)) or Color3.fromRGB(50, 50, 50);
end
for I, J in pairs({s,t,w,x}) do
	local C = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\200\228\55\218\92\185\248\223", "\215\157\173\116\181\46"));
	C.CornerRadius = UDim.new(0, 4);
	C.Parent = J;
end
local K;
local L = {};
local function M()
	local N = e.Character;
	if not N then
		return;
	end
	for I, O in pairs(N:GetDescendants()) do
		if O:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\23\181\152\247\234\52\166\159", "\186\85\212\235\146")) then
			L[O] = O.CanCollide;
			O.CanCollide = false;
		end
	end
	local P = N:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\234\148\27\255\55\225\81\198", "\56\162\225\118\158\89\142"));
	if P then
		P:ChangeState(Enum.HumanoidStateType.Freefall);
	end
end
local function Q()
	local N = e.Character;
	if not N then
		return;
	end
	for O, R in pairs(L) do
		if (O and O.Parent) then
			O.CanCollide = R;
		end
	end
	L = {};
	local H = g.Languages[h.Language];
	z(H.NoclipOffMessage);
	local P = N:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\116\16\205\174\44\215\85\1", "\184\60\101\160\207\66"));
	if P then
		P:ChangeState(Enum.HumanoidStateType.Running);
	end
end
local function S()
	if (h.Noclip and e.Character) then
		for I, O in pairs(e.Character:GetDescendants()) do
			if O:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\19\131\111\185\1\131\110\168", "\220\81\226\28")) then
				O.CanCollide = false;
			end
		end
	end
end
K = b.Stepped:Connect(S);
local function T()
	h.Noclip = not h.Noclip;
	if h.Noclip then
		M();
	else
		Q();
	end
	G();
end
w.MouseButton1Click:Connect(T);
local U = {};
local function V(W)
	if U[W] then
		return;
	end
	local X = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\49\218\154\211\235\201\23\217\135\218\238\200\1\219\143\254\228\211", "\167\115\181\226\155\138"));
	X.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\195\48\244\89\117\112\202\199\17\215", "\166\130\66\135\60\27\17");
	X.Adornee = W;
	X.AlwaysOnTop = true;
	X.ZIndex = 10;
	X.Size = W.Size * 1.2;
	X.Color3 = g.ESPColor;
	X.Transparency = 0.4;
	X.Parent = W;
	local Y = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\102\67\194\121\50\75\75\220\113\23\81\67", "\80\36\42\174\21"));
	Y.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\111\2\36\127\64\17\59\95\125\32\27\123\76\21\59", "\26\46\112\87");
	Y.Adornee = W;
	Y.Size = UDim2.new(4, 0, 4, 0);
	Y.AlwaysOnTop = true;
	Y.ExtentsOffset = Vector3.new(0, 3, 0);
	local Z = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\141\38\179\96\147\190\71\177\181", "\212\217\67\203\20\223\223\37"));
	Z.Size = UDim2.new(1, 0, 1, 0);
	Z.Text = g.Languages[h.Language].ArsenalItem;
	Z.TextColor3 = Color3.new(1, 1, 1);
	Z.BackgroundTransparency = 1;
	Z.Font = Enum.Font.SourceSansBold;
	Z.TextSize = 14;
	Z.Parent = Y;
	Y.Parent = W;
	U[W] = true;
end
local function _()
	for W, I in pairs(U) do
		if not W.Parent then
			U[W] = nil;
		end
	end
	for I, W in pairs(workspace:GetDescendants()) do
		if ((W.Name == g.ItemName) and W:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\152\140\187\215\138\140\186\198", "\178\218\237\200"))) then
			V(W);
		end
	end
end
local function a0()
	local N = e.Character;
	if (not N or not N:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\158\160\235\209\184\186\239\212\132\186\233\196\134\180\244\196", "\176\214\213\134"))) then
		return nil, nil;
	end
	local a1 = nil;
	local a2 = math.huge;
	local a3 = N.HumanoidRootPart;
	for I, W in pairs(workspace:GetDescendants()) do
		if ((W.Name == g.ItemName) and W:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\214\172\165\209\152\87\75\224", "\57\148\205\214\180\200\54"))) then
			local a4 = (a3.Position - W.Position).Magnitude;
			if (a4 < a2) then
				a2 = a4;
				a1 = W;
			end
		end
	end
	return a1, a2;
end
x.MouseButton1Click:Connect(function()
	if h.TeleportCD then
		return;
	end
	local W, a4 = a0();
	if (W and (a4 <= g.MaxTpDistance)) then
		local N = e.Character;
		if (N and N:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\58\232\56\53\120\29\244\49\6\121\29\233\5\53\100\6", "\22\114\157\85\84"))) then
			local a5 = h.Noclip;
			if a5 then
				T();
			end
			N.HumanoidRootPart.CFrame = W.CFrame + Vector3.new(0, 3, 0);
			if a5 then
				task.wait(0.2);
				T();
			end
			h.TeleportCD = true;
			G();
			task.wait(g.CooldownTime);
			h.TeleportCD = false;
			G();
		end
	end
end);
s.MouseButton1Click:Connect(function()
	h.Language = LUAOBFUSACTOR_DECRYPT_STR_0("\225\197\20\200\84\229\160", "\200\164\171\115\164\61\150");
	G();
	_();
end);
t.MouseButton1Click:Connect(function()
	h.Language = LUAOBFUSACTOR_DECRYPT_STR_0("\142\251\17\81\150\185\225\6\86\134", "\227\222\148\99\37");
	G();
	_();
end);
c.InputBegan:Connect(function(a6, a7)
	if a7 then
		return;
	end
	if (a6.KeyCode == g.ToggleUIKey) then
		h.UI = not h.UI;
		j.Visible = h.UI;
	elseif (a6.KeyCode == g.NoclipKey) then
		T();
	end
end);
o.MouseButton1Click:Connect(function()
	h.UI = not h.UI;
	j.Visible = h.UI;
end);
local a8, a9, aa, ab;
m.InputBegan:Connect(function(a6)
	if (a6.UserInputType == Enum.UserInputType.MouseButton1) then
		a8 = true;
		aa = a6.Position;
		ab = j.Position;
		a6.Changed:Connect(function()
			if (a6.UserInputState == Enum.UserInputState.End) then
				a8 = false;
			end
		end);
	end
end);
m.InputChanged:Connect(function(a6)
	if (a6.UserInputType == Enum.UserInputType.MouseMovement) then
		a9 = a6;
	end
end);
c.InputChanged:Connect(function(a6)
	if ((a6 == a9) and a8) then
		local ac = a6.Position - aa;
		j.Position = UDim2.new(ab.X.Scale, ab.X.Offset + ac.X, ab.Y.Scale, ab.Y.Offset + ac.Y);
	end
end);
local function ad()
	local W, a4 = a0();
	local H = g.Languages[h.Language];
	if (W and a4) then
		y.Text = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\118\65\8\182\188\125\3\84\182\234\39\71\86\229", "\153\83\50\50\150"), H.Distance:gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\7\54\93\83\82", "\45\61\22\19\124\19\203"), ""), a4);
	else
		y.Text = H.Distance;
	end
end
coroutine.wrap(function()
	while true do
		_();
		ad();
		task.wait(g.ESPRefreshRate);
	end
end)();
G();
j.Visible = h.UI;
print(LUAOBFUSACTOR_DECRYPT_STR_0("\224\0\30\240\12\113\181\129\35\24\240\17\100\249\233\23\1\229\7\98\249\241\0\2\181\1\113\171\211\23\10\244\6\127\249\194\29\0\181\17\101\186\196\1\30\250\67", "\217\161\114\109\149\98\16"));
print(LUAOBFUSACTOR_DECRYPT_STR_0("\49\47\53\125\178\112\29\51\98", "\20\114\64\88\28\220"));
print(LUAOBFUSACTOR_DECRYPT_STR_0("\3\8\213\188\236\243\178\63\21\192\187\244\144\240\113\44\221\167\236\194\188\35\78\247\167\251\223\179\53\4\192\244\205\249", "\221\81\97\178\212\152\176"));
print(LUAOBFUSACTOR_DECRYPT_STR_0("\227\167\80\187\59\217\238\11\250\8\130\195\24\232\27\217\238\11\250\8\141\201\18\248\22\196\247", "\122\173\135\125\155"));