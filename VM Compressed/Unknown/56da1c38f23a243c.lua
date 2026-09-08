local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v27, v28)
	local v29 = {};
	for v55 = 1, #v27 do
		v6(v29, v0(v4(v1(v2(v27, v55, v55 + 1)), v1(v2(v28, 1 + (v55 % #v28), 1 + (v55 % #v28) + 1))) % 256));
	end
	return v5(v29);
end
local v8 = loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\194\202\201\44\243\168\137\19\212\205\206\106\244\186\222\24\216\198\215\33", "\126\177\163\187\69\134\219\167")))();
local v9 = game:GetService(v7("\19\193\43\220\249\49\222", "\156\67\173\74\165"));
local v10 = game:GetService(v7("\6\178\89\26\181\37\71\32\178\77\37\168\41\84\53\176\76", "\38\84\215\41\118\220\70"));
local v11 = v10:WaitForChild(v7("\98\19\47\29\234\85\5", "\158\48\118\66\114")):WaitForChild(v7("\136\43\29\52\114\177", "\155\203\68\112\86\19\197"));
local v12 = v8:CreateWindow({[v7("\104\220\59\249", "\152\38\189\86\156\32\24\133")]=v7("\198\82\181\73\255\86\178\82\245\88\169\6\223\95\162\71\232\68", "\38\156\55\199"),[v7("\132\114\125\44\26\122\253\119\161\105\112\45", "\35\200\29\28\72\115\20\154")]=v7("\21\176\221\159\190\53\39\13\186\220", "\84\121\223\177\191\237\76"),[v7("\151\89\200\164\51\94\55\242\174\84\221\169\46\92\53", "\161\219\54\169\192\90\48\80")]=v7("\90\73\9\39\64\70\9", "\69\41\34\96"),[v7("\159\204\217\12\11\44\169\209\214\30\11\36\178\240\214\28\11\37\187", "\75\220\163\183\106\98")]={[v7("\39\180\138\53\213\7\190", "\185\98\218\235\87")]=false}});
local v13 = v12:CreateTab(v7("\232\51\42\228\223\190", "\202\171\92\71\134\190"), 4483362458 - 0);
local v14 = {};
local v15 = false;
local v16 = false;
local v17 = (0.5 + 0) - (1322 - (1249 + 73));
local v18 = false;
local function v19(v30)
	local v31 = 0 + 0;
	local v32;
	local v33;
	local v34;
	while true do
		if (v31 == (1145 - (466 + 679))) then
			v32 = 0;
			v33 = nil;
			v31 = 2 - 1;
		end
		if ((2 - 1) == v31) then
			v34 = nil;
			while true do
				if (v32 == (1900 - (106 + 1794))) then
					local v60 = 0 + 0;
					while true do
						if (v60 == (0 + 0)) then
							v33 = 0 - 0;
							v34 = nil;
							v60 = 2 - 1;
						end
						if (v60 == 1) then
							v32 = 115 - (4 + 110);
							break;
						end
					end
				end
				if (v32 == (585 - (57 + 527))) then
					while true do
						if (v33 == ((1457 - (41 + 1386)) - (5 + (128 - (17 + 86))))) then
							local v65 = 0 + 0;
							while true do
								if ((0 - 0) == v65) then
									v34 = v30 and v30:FindFirstChildOfClass(v7("\1\212\33\137\39\206\37\140", "\232\73\161\76"));
									return v34 and (v34.Health > ((3437 - 2250) - (1069 + (284 - (122 + 44)))));
								end
							end
						end
					end
					break;
				end
			end
			break;
		end
	end
end
local v14 = {};
local function v20()
	local v35 = 0 - 0;
	local v36;
	local v37;
	local v38;
	while true do
		if (v35 == (3 - 2)) then
			v38 = nil;
			while true do
				if (v36 == (1 + 0)) then
					while true do
						local v63 = 0 + 0;
						local v64;
						while true do
							if (v63 == (0 - 0)) then
								v64 = 65 - (30 + 35);
								while true do
									if (v64 == (0 + 0)) then
										if ((1 - (1257 - (1043 + 214))) == v37) then
											return v38;
										end
										if (v37 == (0 - 0)) then
											local v85 = 1212 - (323 + 889);
											local v86;
											while true do
												if (v85 == 0) then
													v86 = 0 - 0;
													while true do
														if (0 == v86) then
															v38 = {};
															for v94, v95 in ipairs(v9:GetPlayers()) do
																table.insert(v38, v95.Name);
															end
															v86 = 581 - (361 + 219);
														end
														if (v86 == (321 - (53 + 267))) then
															v37 = 1 + 0;
															break;
														end
													end
													break;
												end
											end
										end
										break;
									end
								end
								break;
							end
						end
					end
					break;
				end
				if (v36 == 0) then
					local v61 = 0;
					while true do
						if (v61 == 1) then
							v36 = 414 - (15 + 398);
							break;
						end
						if (v61 == (982 - (18 + 964))) then
							v37 = (0 - 0) - (0 + 0);
							v38 = nil;
							v61 = 1;
						end
					end
				end
			end
			break;
		end
		if (v35 == (0 + 0)) then
			local v59 = 850 - (20 + 830);
			while true do
				if (v59 == (1 + 0)) then
					v35 = 127 - (116 + 10);
					break;
				end
				if (0 == v59) then
					v36 = 0;
					v37 = nil;
					v59 = 1;
				end
			end
		end
	end
end
local v21 = v13:CreateDropdown({[v7("\149\216\79\88", "\126\219\185\34\61")]=v7("\63\203\82\119\125\99\179\211\13\220\89\119\106\100", "\135\108\174\62\18\30\23\147"),[v7("\153\249\62\194\23\160\32", "\167\214\137\74\171\120\206\83")]=v20(),[v7("\168\229\32\79\253\169\159\223\34\73\241\168\133", "\199\235\144\82\61\152")]={},[v7("\42\3\181\63\14\6\181\46\40\6\173\34\8\24\170", "\75\103\118\217")]=true,[v7("\228\85\124\24\187\31\196\95", "\126\167\52\16\116\217")]=function(v39)
	v14 = v39 or {};
end});
local function v22()
	if v21 then
		v21:Refresh(v20());
	end
end
v9.PlayerAdded:Connect(v22);
v9.PlayerRemoving:Connect(v22);
local function v23(v40)
	local v41 = 0;
	local v42;
	local v43;
	local v44;
	local v45;
	while true do
		if (v41 == 2) then
			while true do
				if (v42 == (1 + 0)) then
					v45 = nil;
					while true do
						if (((739 - (542 + 196)) + (6 - 3)) == v43) then
							v45.OutlineTransparency = (0 + 0) - 0;
							break;
						end
						if (v43 == (1 + 0 + 0 + 0)) then
							local v67 = 0 - 0;
							while true do
								if (v67 == 0) then
									if (not v44 or (v44.Health <= ((2027 - 1236) - (368 + (1974 - (1126 + 425)))))) then
										local v79 = (405 - (118 + 287)) - (0 - 0);
										local v80;
										while true do
											local v87 = 1121 - (118 + 1003);
											while true do
												if (v87 == (0 - 0)) then
													if ((19 - ((387 - (142 + 235)) + (36 - 28))) == v79) then
														return;
													end
													if (v79 == ((0 + 0) - (977 - (553 + 424)))) then
														local v92 = 0 - 0;
														local v93;
														while true do
															if (v92 == (0 + 0)) then
																v93 = 0;
																while true do
																	if (v93 == (0 + 0)) then
																		v80 = v40:FindFirstChild(v7("\252\47\50\135\177\13\212\193\41\40\140\189\30\244\220", "\156\168\78\64\224\212\121"));
																		if v80 then
																			v80:Destroy();
																		end
																		v93 = 1 + 0;
																	end
																	if (v93 == (1 + 0)) then
																		v79 = 1 + 0;
																		break;
																	end
																end
																break;
															end
														end
													end
													break;
												end
											end
										end
									end
									v45 = v40:FindFirstChild(v7("\51\239\183\201\2\250\141\199\0\230\169\199\0\230\177", "\174\103\142\197"));
									v67 = 1;
								end
								if (v67 == 1) then
									v43 = (962 - 518) - ((1158 - 742) + (58 - 32));
									break;
								end
							end
						end
						if (v43 == ((3 + 6) - 6)) then
							local v68 = 0;
							while true do
								if (v68 == 0) then
									v45.OutlineColor = Color3.fromRGB(0, (415 - 329) + 114, 753 - (239 + 514));
									v45.FillTransparency = 0.5 + 0;
									v68 = 1;
								end
								if (v68 == (1330 - (797 + 532))) then
									v43 = 4;
									break;
								end
							end
						end
						if (v43 == (0 + 0)) then
							local v69 = 0 + 0;
							local v70;
							while true do
								if (v69 == 0) then
									v70 = 0;
									while true do
										if (v70 == (0 - 0)) then
											if not v40 then
												return;
											end
											v44 = v40:FindFirstChildOfClass(v7("\126\61\82\57\43\81\241\82", "\152\54\72\63\88\69\62"));
											v70 = 1203 - (373 + 829);
										end
										if (v70 == (732 - (476 + 255))) then
											v43 = (1131 - (369 + 761)) - (0 + 0);
											break;
										end
									end
									break;
								end
							end
						end
						if (v43 == ((799 - 359) - ((274 - 129) + (531 - (64 + 174))))) then
							local v71 = 0;
							while true do
								if (v71 == (1 + 0)) then
									v43 = 12 - 9;
									break;
								end
								if (v71 == (0 - 0)) then
									if not v45 then
										local v81 = 336 - (144 + 192);
										local v82;
										local v83;
										local v84;
										while true do
											if (v81 == (217 - (42 + 174))) then
												v84 = nil;
												while true do
													if (v82 == (0 + 0)) then
														v83 = (357 + 73) - (19 + 25 + (1890 - (363 + 1141)));
														v84 = nil;
														v82 = 1581 - (1183 + 397);
													end
													if (v82 == (2 - 1)) then
														while true do
															if (v83 == ((1090 + 396) - (746 + 252 + (2463 - (1913 + 62))))) then
																v84 = 0 + 0 + (0 - 0);
																while true do
																	if (v84 == (1934 - (565 + 1368))) then
																		v45.Parent = v40;
																		break;
																	end
																	if (v84 == (0 + (0 - 0))) then
																		local v99 = 1661 - (1477 + 184);
																		while true do
																			if (1 == v99) then
																				v84 = 773 - (201 + (777 - 206));
																				break;
																			end
																			if (v99 == (0 + 0)) then
																				v45 = Instance.new(v7("\252\205\233\84\216\205\233\84\192", "\60\180\164\142"));
																				v45.Name = v7("\108\95\23\46\34\249\58\81\89\13\37\46\234\26\76", "\114\56\62\101\73\71\141");
																				v99 = 857 - (564 + 292);
																			end
																		end
																	end
																end
																break;
															end
														end
														break;
													end
												end
												break;
											end
											if (v81 == (0 - 0)) then
												v82 = 0;
												v83 = nil;
												v81 = 2 - 1;
											end
										end
									end
									v45.FillColor = Color3.fromRGB((1442 - (244 + 60)) - (90 + 26 + (1498 - (41 + 435))), 1256 - (938 + 63), 0 + 0);
									v71 = 1;
								end
							end
						end
					end
					break;
				end
				if (v42 == ((1125 - (936 + 189)) + 0 + 0)) then
					local v62 = 0;
					while true do
						if (v62 == 0) then
							v43 = (1613 - (1565 + 48)) - (0 + 0);
							v44 = nil;
							v62 = 1;
						end
						if (v62 == 1) then
							v42 = 3 - (1140 - (782 + 356));
							break;
						end
					end
				end
			end
			break;
		end
		if (v41 == (267 - (176 + 91))) then
			v42 = 0 - 0;
			v43 = nil;
			v41 = 1 - 0;
		end
		if (v41 == (1093 - (975 + 117))) then
			v44 = nil;
			v45 = nil;
			v41 = 1877 - (157 + 1718);
		end
	end
end
local function v24(v46)
	v11:FireServer(v7("\186\230\223\221", "\164\216\137\187"), v46);
end
local function v25(v47)
	v11:FireServer(v7("\193\234\48\191", "\107\178\134\81\210\198\158"), v47);
end
local function v26()
	if v18 then
		return;
	end
	v18 = true;
	while v15 or v16 do
		local v56 = 0;
		local v57;
		local v58;
		while true do
			if (v56 == (0 + 0)) then
				v57 = 859 - ((2889 - 2075) + (153 - 108));
				v58 = nil;
				v56 = 1019 - (697 + 321);
			end
			if (v56 == (2 - 1)) then
				while true do
					if (v57 == ((0 - 0) - (0 - 0))) then
						v58 = 0 + 0 + 0;
						while true do
							if (v58 == 0) then
								for v72, v73 in ipairs(v14) do
									local v74 = 0;
									local v75;
									while true do
										if (v74 == ((0 - 0) + (0 - 0))) then
											v75 = v9:FindFirstChild(v73);
											if (v75 and v75.Character) then
												local v88 = 1227 - (322 + 905);
												local v89;
												local v90;
												while true do
													if (v88 == (612 - (602 + 9))) then
														while true do
															if (v89 == (1189 - (449 + 740))) then
																v90 = v75.Character;
																if v19(v90) then
																	v23(v90);
																	if v15 then
																		v24(v90);
																	end
																	if v16 then
																		v25(v90);
																	end
																end
																break;
															end
														end
														break;
													end
													if (v88 == (872 - (826 + 46))) then
														local v91 = 947 - (245 + 702);
														while true do
															if (v91 == (0 - 0)) then
																local v97 = 0 + 0;
																while true do
																	if (v97 == 0) then
																		v89 = (2783 - (260 + 1638)) - ((701 - (382 + 58)) + 624);
																		v90 = nil;
																		v97 = 3 - 2;
																	end
																	if (v97 == (1 + 0)) then
																		v91 = 1 - 0;
																		break;
																	end
																end
															end
															if (v91 == 1) then
																v88 = 2 - 1;
																break;
															end
														end
													end
												end
											end
											break;
										end
									end
								end
								task.wait(v17);
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	end
	v18 = false;
end
v13:CreateButton({[v7("\22\15\143\195", "\202\88\110\226\166")]=v7("\240\27\131\229\222\131\44\141\250\200\194\27\194\219\197\204\31", "\170\163\111\226\151"),[v7("\50\49\190\52\76\54\42\26", "\73\113\80\210\88\46\87")]=function()
	task.spawn(v26);
end});
v13:CreateToggle({[v7("\175\45\192\23", "\135\225\76\173\114")]=v7("\59\248\172\191\236\156\179\14\236\187\187", "\199\122\141\216\208\204\221"),[v7("\142\200\2\226\125\248\185\235\17\252\109\243", "\150\205\189\112\144\24")]=false,[v7("\6\133\179\64\6\137\18\27", "\112\69\228\223\44\100\232\113")]=function(v48)
	local v49 = 1205 - (902 + 303);
	local v50;
	while true do
		if ((0 - 0) == v49) then
			v50 = 0;
			while true do
				if (v50 == ((0 - 0) - (0 + 0))) then
					v15 = v48;
					if v48 then
						task.spawn(v26);
					end
					break;
				end
			end
			break;
		end
	end
end});
v13:CreateToggle({[v7("\250\30\10\214", "\230\180\127\103\179\214\28")]=v7("\173\16\75\73\164\114\236\141\8", "\128\236\101\63\38\132\33"),[v7("\143\188\3\86\179\229\219\154\168\29\81\179", "\175\204\201\113\36\214\139")]=false,[v7("\100\205\57\208\6\70\207\62", "\100\39\172\85\188")]=function(v51)
	local v52 = 0;
	local v53;
	while true do
		if (0 == v52) then
			v53 = (2770 - (1121 + 569)) - (1020 + (274 - (22 + 192)));
			while true do
				if (v53 == (1423 - ((1313 - (483 + 200)) + 793))) then
					v16 = v51;
					if v51 then
						task.spawn(v26);
					end
					break;
				end
			end
			break;
		end
	end
end});
v13:CreateSlider({[v7("\131\121\180\133", "\83\205\24\217\224")]=v7("\199\209\217\60\229\206\141\14\246\192\200\57", "\93\134\165\173"),[v7("\140\243\207\197\63", "\30\222\146\161\162\90\174\210")]={((0.1 - 0) - (0 - 0)),((563 - (334 + 228)) + 1)},[v7("\204\64\115\24\224\67\117\4\241", "\106\133\46\16")]=((0.1 - 0) - (0 - 0)),[v7("\107\53\117\250\83\88", "\32\56\64\19\156\58")]=v7("\73\205\230", "\224\58\168\133\54\58\146"),[v7("\122\67\89\239\112\136\147\61\88\90\94\248", "\107\57\54\43\157\21\230\231")]=((3167.5 - 1420) - (216 + 544 + 987)),[v7("\248\138\29\249\187\221\204\208", "\175\187\235\113\149\217\188")]=function(v54)
	v17 = v54;
end});