local v0 = tonumber;
local v1 = string.byte;
local v2 = string.char;
local v3 = string.sub;
local v4 = string.gsub;
local v5 = string.rep;
local v6 = table.concat;
local v7 = table.insert;
local v8 = math.ldexp;
local v9 = getfenv or function()
	return _ENV;
end;
local v10 = setmetatable;
local v11 = pcall;
local v12 = select;
local v13 = unpack or table.unpack;
local v14 = tonumber;
local function v15(v16, v17, ...)
	local v18 = 1;
	local v19;
	v16 = v4(v3(v16, 5), "..", function(v30)
		if (v1(v30, 2) == 81) then
			v19 = v0(v3(v30, 1, 1));
			return "";
		else
			local v88 = v2(v0(v30, 16));
			if v19 then
				local v107 = v5(v88, v19);
				v19 = nil;
				return v107;
			else
				return v88;
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v89 = 0 - 0;
			local v90;
			while true do
				if (v89 == 0) then
					v90 = (v31 / ((5 - (1 + 2)) ^ (v32 - (878 - (282 + 595))))) % (2 ^ (((v33 - (1 - 0)) - (v32 - (1638 - (1523 + 114)))) + ((2 + 0) - 1)));
					return v90 - (v90 % (620 - ((790 - 235) + 64)));
				end
			end
		else
			local v91 = (933 - (857 + 74)) ^ (v32 - (569 - (367 + 201)));
			return (((v31 % (v91 + v91)) >= v91) and (928 - (214 + 713))) or (0 + 0);
		end
	end
	local function v21()
		local v34 = 1065 - (16 + 52 + 997);
		local v35;
		while true do
			if (v34 == (1271 - ((1183 - (892 + 65)) + 1044))) then
				return v35;
			end
			if (v34 == (0 - (0 - 0))) then
				v35 = v1(v16, v18, v18);
				v18 = v18 + (118 - (32 + 85));
				v34 = (1 - 0) + 0;
			end
		end
	end
	local function v22()
		local v36 = 0 - 0;
		local v37;
		local v38;
		while true do
			if (v36 == 1) then
				return (v38 * (469 - 213)) + v37;
			end
			if (v36 == (350 - ((234 - 147) + 263))) then
				v37, v38 = v1(v16, v18, v18 + 2);
				v18 = v18 + (182 - (67 + 113));
				v36 = (1 - 0) + 0;
			end
		end
	end
	local function v23()
		local v39, v40, v41, v42 = v1(v16, v18, v18 + 3 + 0);
		v18 = v18 + (1001 - ((1203 - 288) + 82));
		return (v42 * (47505959 - 30728743)) + (v41 * 65536) + (v40 * (150 + 106)) + v39;
	end
	local function v24()
		local v43 = v23();
		local v44 = v23();
		local v45 = 1188 - (1069 + 118);
		local v46 = (v20(v44, 439 - (145 + 293), 45 - 25) * ((3 - 1) ^ ((182 + 280) - (44 + 386)))) + v43;
		local v47 = v20(v44, (5188 - 3681) - (998 + 488), 6 + (1772 - (760 + 987)));
		local v48 = ((v20(v44, 27 + 5) == ((2686 - (1789 + 124)) - ((967 - (745 + 21)) + 571))) and -(1 - (0 + 0))) or (1 + 0);
		if (v47 == (0 + (0 - 0))) then
			if (v46 == (0 - 0)) then
				return v48 * (791 - (368 + 423));
			else
				local v108 = 0 - 0;
				while true do
					if (v108 == (0 - 0)) then
						v47 = 2 - 1;
						v45 = 0 + 0;
						break;
					end
				end
			end
		elseif (v47 == (2065 - (10 + 8))) then
			return ((v46 == (0 - 0)) and (v48 * ((443 - (416 + 26)) / (1080 - (1020 + 60))))) or (v48 * NaN);
		end
		return v8(v48, v47 - (3266 - 2243)) * (v45 + (v46 / ((1 + 1) ^ (91 - 39))));
	end
	local function v25(v49)
		local v50;
		if not v49 then
			v49 = v23();
			if (v49 == (0 + 0)) then
				return "";
			end
		end
		v50 = v3(v16, v18, (v18 + v49) - 1);
		v18 = v18 + v49;
		local v51 = {};
		for v67 = 1 + 0, #v50 do
			v51[v67] = v2(v1(v3(v50, v67, v67)));
		end
		return v6(v51);
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v52 = (function()
			return function(v92, v93, v94, v95, v96, v97, v98, v99)
				local v92 = (function()
					return 285 - (134 + 151);
				end)();
				local v93 = (function()
					return;
				end)();
				local v94 = (function()
					return;
				end)();
				while true do
					if (v92 == #"]") then
						if (v93 == #"[") then
							v94 = (function()
								return v95() ~= (1665 - (970 + 695));
							end)();
						elseif (v93 == 2) then
							v94 = (function()
								return v96();
							end)();
						elseif (v93 == #"19(") then
							v94 = (function()
								return v97();
							end)();
						end
						v98[v99] = (function()
							return v94;
						end)();
						break;
					end
					if (v92 ~= 0) then
					else
						local v114 = (function()
							return 0 - 0;
						end)();
						local v115 = (function()
							return;
						end)();
						while true do
							if (v114 ~= 0) then
							else
								v115 = (function()
									return 0;
								end)();
								while true do
									if (v115 ~= 1) then
									else
										v92 = (function()
											return #"{";
										end)();
										break;
									end
									if (v115 ~= (1990 - (582 + 1408))) then
									else
										v93 = (function()
											return v95();
										end)();
										v94 = (function()
											return nil;
										end)();
										v115 = (function()
											return 3 - 2;
										end)();
									end
								end
								break;
							end
						end
					end
				end
				return v92, v93, v94, v95, v96, v97, v98, v99;
			end;
		end)();
		local v53 = (function()
			return function(v100, v101, v102)
				local v103 = (function()
					return 0;
				end)();
				while true do
					if (0 == v103) then
						v100[v101 - #","] = (function()
							return v102();
						end)();
						return v100, v101, v102;
					end
				end
			end;
		end)();
		local v54 = (function()
			return {};
		end)();
		local v55 = (function()
			return {};
		end)();
		local v56 = (function()
			return {};
		end)();
		local v57 = (function()
			return {v54,v55,nil,v56};
		end)();
		local v58 = (function()
			return v23();
		end)();
		local v59 = (function()
			return {};
		end)();
		for v69 = #"~", v58 do
			FlatIdent_2661B, Type, Cons, v21, v24, v25, v59, v69 = (function()
				return v52(FlatIdent_2661B, Type, Cons, v21, v24, v25, v59, v69);
			end)();
		end
		v57[#"xxx"] = (function()
			return v21();
		end)();
		for v70 = #":", v23() do
			local v71 = (function()
				return 0;
			end)();
			local v72 = (function()
				return;
			end)();
			while true do
				if (v71 == (0 - 0)) then
					v72 = (function()
						return v21();
					end)();
					if (v20(v72, #"[", #"~") ~= (0 - 0)) then
					else
						local v117 = (function()
							return 0;
						end)();
						local v118 = (function()
							return;
						end)();
						local v119 = (function()
							return;
						end)();
						local v120 = (function()
							return;
						end)();
						while true do
							if (2 ~= v117) then
							else
								if (v20(v119, #"/", #"}") ~= #">") then
								else
									v120[2] = (function()
										return v59[v120[2]];
									end)();
								end
								if (v20(v119, 1826 - (1195 + 629), 2 - 0) ~= #"\\") then
								else
									v120[#"91("] = (function()
										return v59[v120[#"asd"]];
									end)();
								end
								v117 = (function()
									return 244 - (187 + 54);
								end)();
							end
							if (v117 ~= (781 - (162 + 618))) then
							else
								local v121 = (function()
									return 0 + 0;
								end)();
								local v122 = (function()
									return;
								end)();
								while true do
									if (v121 == 0) then
										v122 = (function()
											return 0;
										end)();
										while true do
											if (v122 == (0 + 0)) then
												v120 = (function()
													return {v22(),v22(),nil,nil};
												end)();
												if (v118 == 0) then
													local v302 = (function()
														return 0 - 0;
													end)();
													local v303 = (function()
														return;
													end)();
													while true do
														if (v302 == (0 + 0)) then
															v303 = (function()
																return 1636 - (1373 + 263);
															end)();
															while true do
																if (v303 ~= 0) then
																else
																	v120[#"-19"] = (function()
																		return v22();
																	end)();
																	v120[#"0313"] = (function()
																		return v22();
																	end)();
																	break;
																end
															end
															break;
														end
													end
												elseif (v118 == #":") then
													v120[#"asd"] = (function()
														return v23();
													end)();
												elseif (v118 == (1002 - (451 + 549))) then
													v120[#"xnx"] = (function()
														return v23() - ((1 + 1) ^ (24 - 8));
													end)();
												elseif (v118 == #"91(") then
													local v308 = (function()
														return 0 - 0;
													end)();
													local v309 = (function()
														return;
													end)();
													while true do
														if (0 == v308) then
															v309 = (function()
																return 1384 - (746 + 638);
															end)();
															while true do
																if (v309 == (0 + 0)) then
																	v120[#"91("] = (function()
																		return v23() - ((2 - 0) ^ (357 - (218 + 123)));
																	end)();
																	v120[#"0836"] = (function()
																		return v22();
																	end)();
																	break;
																end
															end
															break;
														end
													end
												end
												v122 = (function()
													return 1;
												end)();
											end
											if (v122 ~= (1582 - (1535 + 46))) then
											else
												v117 = (function()
													return 2;
												end)();
												break;
											end
										end
										break;
									end
								end
							end
							if (v117 ~= 0) then
							else
								local v123 = (function()
									return 0 + 0;
								end)();
								while true do
									if (v123 ~= 0) then
									else
										v118 = (function()
											return v20(v72, 1 + 1, #"19(");
										end)();
										v119 = (function()
											return v20(v72, #".dev", 566 - (306 + 254));
										end)();
										v123 = (function()
											return 1 + 0;
										end)();
									end
									if (1 == v123) then
										v117 = (function()
											return 1 - 0;
										end)();
										break;
									end
								end
							end
							if (3 == v117) then
								if (v20(v119, #"91(", #"-19") ~= #".") then
								else
									v120[#"?id="] = (function()
										return v59[v120[#"xnxx"]];
									end)();
								end
								v54[v70] = (function()
									return v120;
								end)();
								break;
							end
						end
					end
					break;
				end
			end
		end
		for v73 = #".", v23() do
			v55, v73, v28 = (function()
				return v53(v55, v73, v28);
			end)();
		end
		return v57;
	end
	local function v29(v61, v62, v63)
		local v64 = v61[1468 - (899 + (747 - 179))];
		local v65 = v61[2 + 0];
		local v66 = v61[3];
		return function(...)
			local v74 = v64;
			local v75 = v65;
			local v76 = v66;
			local v77 = v27;
			local v78 = 2 - 1;
			local v79 = -((2394 - (573 + 1217)) - (268 + 335));
			local v80 = {};
			local v81 = {...};
			local v82 = v12("#", ...) - (291 - (60 + 230));
			local v83 = {};
			local v84 = {};
			for v104 = 572 - (426 + (404 - 258)), v82 do
				if ((2822 == 2822) and (v104 >= v76)) then
					v80[v104 - v76] = v81[v104 + 1 + 0 + 0];
				else
					v84[v104] = v81[v104 + (1457 - (282 + 1174))];
				end
			end
			local v85 = (v82 - v76) + 1;
			local v86;
			local v87;
			while true do
				v86 = v74[v78];
				v87 = v86[812 - (569 + 242)];
				if ((v87 <= (37 - 24)) or (1061 == 1857)) then
					if ((2760 > 1364) and (v87 <= 6)) then
						if ((v87 <= 2) or (4902 <= 3595)) then
							if ((v87 <= (0 + 0)) or (3852 == 293)) then
								v84[v86[2]] = v63[v86[1027 - (706 + 318)]];
							elseif (v87 > (1252 - (721 + 530))) then
								v84[v86[2]] = v84[v86[1274 - (945 + 326)]];
							else
								for v250 = v86[2], v86[(10 - 3) - 4] do
									v84[v250] = nil;
								end
							end
						elseif (v87 <= (4 + 0)) then
							if ((v87 == 3) or (1559 == 4588)) then
								local v139 = 700 - ((1210 - (714 + 225)) + (1253 - 824));
								local v140;
								while true do
									if (((0 + 0) == v139) or (4484 == 788)) then
										v140 = v86[1502 - (1408 + 92)];
										v84[v140] = v84[v140](v13(v84, v140 + (1087 - (461 + 625)), v79));
										break;
									end
								end
							else
								local v141 = v86[1290 - (993 + 295)];
								v84[v141] = v84[v141]();
							end
						elseif ((4568 >= 3907) and (v87 == (1 + 4))) then
							if (v86[1173 - (418 + (1048 - 295))] == v84[v86[4]]) then
								v78 = v78 + 1 + 0;
							else
								v78 = v86[1 + 2];
							end
						else
							local v143 = v86[2];
							local v144 = v84[v86[3]];
							v84[v143 + 1 + 0] = v144;
							v84[v143] = v144[v86[2 + 2]];
						end
					elseif (v87 <= (538 - (406 + 123))) then
						if (v87 <= (1776 - (1749 + 20))) then
							local v127 = 0 + 0;
							local v128;
							local v129;
							local v130;
							while true do
								if ((1322 - (1249 + 73)) == v127) then
									v128 = v86[1 + 1];
									v129 = v84[v128];
									v127 = (125 + 1021) - (466 + 679);
								end
								if ((1246 < 3470) and (v127 == 1)) then
									v130 = v86[3 - 0];
									for v265 = 1, v130 do
										v129[v265] = v84[v128 + v265];
									end
									break;
								end
							end
						elseif (v87 > 8) then
							local v148 = v86[4 - (808 - (118 + 688))];
							local v149, v150 = v77(v84[v148](v13(v84, v148 + (2 - 1), v86[1903 - ((154 - (25 + 23)) + 1794)])));
							v79 = (v150 + v148) - 1;
							local v151 = 0 + 0;
							for v255 = v148, v79 do
								local v256 = 0 + 0;
								while true do
									if ((4068 >= 972) and (v256 == (0 - 0))) then
										v151 = v151 + ((1 + 1) - 1);
										v84[v255] = v149[v151];
										break;
									end
								end
							end
						else
							local v152;
							local v153;
							v84[v86[2]] = v84[v86[117 - (4 + 110)]][v86[4]];
							v78 = v78 + 1;
							v86 = v74[v78];
							v84[v86[586 - (57 + 527)]] = v84[v86[1430 - (41 + 1386)]][v86[107 - (17 + 86)]];
							v78 = v78 + 1 + (1886 - (927 + 959));
							v86 = v74[v78];
							v153 = v86[3 - 1];
							v152 = v84[v86[3]];
							v84[v153 + (2 - 1)] = v152;
							v84[v153] = v152[v86[170 - (122 + (148 - 104))]];
							v78 = v78 + 1;
							v86 = v74[v78];
							v84[v86[2 - 0]] = v86[9 - 6];
							v78 = v78 + 1 + 0;
							v86 = v74[v78];
							v153 = v86[1 + 1];
							v84[v153](v13(v84, v153 + ((733 - (16 + 716)) - 0), v86[3]));
							v78 = v78 + (66 - (30 + 35));
							v86 = v74[v78];
							v78 = v86[(5 - 2) + 0];
						end
					elseif ((493 < 3893) and (v87 <= (1268 - (1043 + 214)))) then
						if (v87 > (37 - 27)) then
							local v168 = v86[1214 - (323 + 889)];
							v84[v168](v84[v168 + (2 - 1)]);
						else
							do
								return;
							end
						end
					elseif ((v87 == 12) or (1473 >= 3332)) then
						local v169;
						local v170;
						local v171;
						v171 = v86[582 - ((458 - (11 + 86)) + 219)];
						v170 = v84[v86[3]];
						v84[v171 + 1] = v170;
						v84[v171] = v170[v86[324 - (53 + 267)]];
						v78 = v78 + 1;
						v86 = v74[v78];
						v84[v86[2]] = v86[1 + 2];
						v78 = v78 + (414 - (15 + 398));
						v86 = v74[v78];
						v171 = v86[(2399 - 1415) - (18 + 964)];
						v84[v171] = v84[v171](v13(v84, v171 + (3 - 2), v86[2 + 1]));
						v78 = v78 + 1 + 0;
						v86 = v74[v78];
						v84[v86[852 - (20 + 830)]] = v84[v86[3 + 0]][v86[130 - (116 + 10)]];
						v78 = v78 + 1 + 0;
						v86 = v74[v78];
						v84[v86[740 - (542 + 196)]] = v84[v86[6 - 3]][v86[4]];
						v78 = v78 + 1 + 0;
						v86 = v74[v78];
						v84[v86[2 + 0]] = v84[v86[2 + 1]][v86[4]];
						v78 = v78 + (2 - 1);
						v86 = v74[v78];
						v171 = v86[4 - 2];
						v170 = v84[v86[1554 - (1126 + 425)]];
						v84[v171 + (406 - (118 + 287))] = v170;
						v84[v171] = v170[v86[15 - 11]];
						v78 = v78 + (1122 - (118 + 1003));
						v86 = v74[v78];
						v84[v86[5 - 3]] = v86[380 - (142 + 235)];
						v78 = v78 + (4 - 3);
						v86 = v74[v78];
						v84[v86[1 + 1]] = {};
						v78 = v78 + (978 - ((838 - (175 + 110)) + 424));
						v86 = v74[v78];
						v84[v86[(6 - 3) - 1]] = v86[3 + 0];
						v78 = v78 + 1 + 0;
						v86 = v74[v78];
						v84[v86[2]] = v86[2 + 1];
						v78 = v78 + 1 + (0 - 0);
						v86 = v74[v78];
						v84[v86[2]] = v86[2 + 1];
						v78 = v78 + ((1798 - (503 + 1293)) - 1);
						v86 = v74[v78];
						v171 = v86[5 - 3];
						v169 = v84[v171];
						v170 = v86[6 - 3];
						for v257 = (2 - 1) + 0, v170 do
							v169[v257] = v84[v171 + v257];
						end
					else
						v84[v86[9 - 7]][v86[756 - (239 + 514)]] = v86[4];
					end
				elseif (v87 <= (6 + 2 + 12)) then
					if (v87 <= 16) then
						if ((v87 <= (1343 - (797 + (1593 - (810 + 251))))) or (4051 <= 1157)) then
							v84[v86[2 + 0]] = v29(v75[v86[2 + 1]], nil, v63);
						elseif ((604 < 2881) and (v87 == (34 - (14 + 5)))) then
							local v201 = v86[2];
							v84[v201](v13(v84, v201 + (1203 - (373 + 829)), v86[734 - (476 + 255)]));
						else
							v84[v86[1132 - (369 + 761)]] = v86[3];
						end
					elseif (v87 <= (11 + 7)) then
						if (v87 == (30 - 13)) then
							v78 = v86[5 - (1 + 1)];
						else
							local v205 = 238 - (64 + 174);
							local v206;
							local v207;
							while true do
								if (v205 == (1 + 0 + (534 - (43 + 490)))) then
									v86 = v74[v78];
									v207 = v86[2 - 0];
									v84[v207] = v84[v207](v13(v84, v207 + 1, v86[339 - (144 + 192)]));
									v78 = v78 + 1;
									v86 = v74[v78];
									v205 = 219 - (42 + 174);
								end
								if ((v205 == 1) or (900 == 3377)) then
									v84[v207] = v206[v86[4 + 0]];
									v78 = v78 + 1 + (733 - (711 + 22));
									v86 = v74[v78];
									v84[v86[1 + (3 - 2)]] = v86[3];
									v78 = v78 + (1505 - (363 + 1141));
									v205 = 1582 - (1183 + (1256 - (240 + 619)));
								end
								if (v205 == 0) then
									v206 = nil;
									v207 = nil;
									v207 = v86[5 - 3];
									v206 = v84[v86[3]];
									v84[v207 + 1 + 0] = v206;
									v205 = 1 + 0 + 0;
								end
								if (v205 == (1980 - (1913 + 62))) then
									v84[v86[2 + 0]] = v63[v86[7 - 4]];
									v78 = v78 + (1934 - (565 + 1368));
									v86 = v74[v78];
									v84[v86[7 - (7 - 2)]] = v86[1664 - (1477 + 184)];
									v78 = v78 + (1 - 0);
									v205 = 6 + 0;
								end
								if (v205 == (863 - (38 + 526 + 292))) then
									v78 = v86[4 - 1];
									break;
								end
								if ((11 - 7) == v205) then
									v86 = v74[v78];
									v207 = v86[306 - (244 + 60)];
									v84[v207](v84[v207 + 1 + 0]);
									v78 = v78 + (477 - (41 + (2179 - (1344 + 400))));
									v86 = v74[v78];
									v205 = 5;
								end
								if (v205 == (1007 - (938 + 63))) then
									v86 = v74[v78];
									v207 = v86[2 + 0];
									v84[v207](v84[v207 + 1]);
									v78 = v78 + (1126 - (936 + 189));
									v86 = v74[v78];
									v205 = 3 + 4;
								end
								if (v205 == (1616 - (1565 + (453 - (255 + 150))))) then
									v207 = v86[2 + 0 + 0 + 0];
									v206 = v84[v86[1141 - (782 + 356)]];
									v84[v207 + 1] = v206;
									v84[v207] = v206[v86[271 - (176 + 91)]];
									v78 = v78 + ((8 - 6) - 1);
									v205 = 4;
								end
							end
						end
					elseif ((4459 > 591) and (v87 == ((87 - 60) - 8))) then
						local v208;
						local v209, v210;
						local v211;
						local v212;
						v84[v86[1094 - (975 + 117)]] = v63[v86[1878 - (157 + 1718)]];
						v78 = v78 + 1 + 0;
						v86 = v74[v78];
						v212 = v86[6 - 4];
						v211 = v84[v86[10 - (1746 - (404 + 1335))]];
						v84[v212 + 1] = v211;
						v84[v212] = v211[v86[1022 - (697 + 321)]];
						v78 = v78 + (2 - 1);
						v86 = v74[v78];
						v84[v86[2]] = v86[409 - (183 + 223)];
						v78 = v78 + 1;
						v86 = v74[v78];
						v212 = v86[3 - (1 - 0)];
						v209, v210 = v77(v84[v212](v13(v84, v212 + (2 - 1), v86[2 + 1])));
						v79 = (v210 + v212) - 1;
						v208 = (0 + 0) - 0;
						for v260 = v212, v79 do
							v208 = v208 + 1;
							v84[v260] = v209[v208];
						end
						v78 = v78 + ((1 + 1) - 1);
						v86 = v74[v78];
						v212 = v86[1229 - (322 + (1242 - (10 + 327)))];
						v84[v212] = v84[v212](v13(v84, v212 + (612 - (602 + 9)), v79));
						v78 = v78 + (1190 - (449 + 740));
						v86 = v74[v78];
						v212 = v86[874 - (826 + 46)];
						v84[v212] = v84[v212]();
						v78 = v78 + (948 - (171 + 74 + 702));
						v86 = v74[v78];
						v84[v86[6 - 4]] = v84[v86[1 + 2]];
						v78 = v78 + 1;
						v86 = v74[v78];
						v84[v86[1900 - (260 + 1638)]] = v84[v86[443 - (382 + 58)]];
						v78 = v78 + (3 - 2);
						v86 = v74[v78];
						v84[v86[2 + 0]] = v86[5 - 2];
						v78 = v78 + (2 - 1);
						v86 = v74[v78];
						v84[v86[1207 - ((1240 - (118 + 220)) + 303)]] = v86[5 - 2];
					elseif (v84[v86[2]] == v86[9 - 5]) then
						v78 = v78 + 1 + 0;
					else
						v78 = v86[1 + 2];
					end
				elseif (v87 <= (472 - (108 + 341))) then
					if ((3398 >= 2395) and (v87 <= (1711 - (1121 + 569)))) then
						v84[v86[216 - (22 + 192)]] = v84[v86[3]][v86[(309 + 378) - (483 + (845 - 645))]];
					elseif (v87 == (1485 - (1404 + 59))) then
						v84[v86[5 - 3]] = {};
					else
						local v234 = 0 - 0;
						local v235;
						while true do
							if ((v234 == (765 - (468 + 297))) or (2183 >= 2824)) then
								v235 = v86[2];
								v84[v235] = v84[v235](v13(v84, v235 + 1, v86[565 - (334 + (1721 - (711 + 782)))]));
								break;
							end
						end
					end
				elseif ((1936 == 1936) and (v87 <= (84 - 59))) then
					if (v87 > ((105 - 50) - 31)) then
						local v236 = v86[2 - 0];
						local v237 = v84[v236];
						for v263 = v236 + (470 - (270 + 199)) + 0, v86[239 - (141 + 95)] do
							v7(v237, v84[v263]);
						end
					else
						v84[v86[2 + 0 + 0]][v86[7 - 4]] = v84[v86[9 - 5]];
						v78 = v78 + 1;
						v86 = v74[v78];
						v84[v86[1 + 1]] = {};
						v78 = v78 + (2 - 1);
						v86 = v74[v78];
						v84[v86[2 + 0]][v86[2 + 1]] = v86[5 - 1];
						v78 = v78 + (1820 - (580 + 1239)) + 0;
						v86 = v74[v78];
						v84[v86[2]][v86[3]] = v86[167 - (92 + 71)];
						v78 = v78 + 1;
						v86 = v74[v78];
						v84[v86[1 + 1]][v86[3]] = v86[4];
					end
				elseif (v87 == (43 - 17)) then
					if v84[v86[767 - (574 + 191)]] then
						v78 = v78 + (2 - 1) + 0;
					else
						v78 = v86[7 - 4];
					end
				else
					v84[v86[2 + 0 + 0]][v86[852 - (254 + 595)]] = v84[v86[4]];
				end
				v78 = v78 + (127 - (55 + 71));
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!113Q00028Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403663Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F49736E6F74616C77692F55492D6C69626172792D416C77696875622F726566732F68656164732F6D61696E2F50726F6D70742532305549253230526F626C6F782E6C756103163Q00416C776920487562204E6F746963652053797374656D03213Q00446F20796F752077616E7420746F2065786563757465206D79207363726970743F03043Q005465787403133Q0045786563757465205468697320536372697074030B3Q004C61796F75744F72646572026Q00F03F03073Q005072696D6172792Q0103083Q0043612Q6C6261636B03023Q004E6F027Q0040012Q00213Q0012103Q00014Q0001000100013Q0026143Q0002000100010004113Q0002000100122Q000200023Q001213000300033Q00202Q00030003000400122Q000500056Q000300056Q00023Q00024Q0002000100024Q000100026Q000200013Q00122Q000300063Q00122Q000400074Q0016000500024Q001600063Q000400300D00060008000900300D0006000A000B00300D0006000C000D00020E00075Q0010180006000E00074Q00073Q000400302Q00070008000F00302Q0007000A001000302Q0007000C001100020E000800013Q00101B0007000E00082Q00070005000200012Q000F0002000500010004113Q002000010004113Q000200012Q000A3Q00013Q00023Q00013Q0003053Q007063612Q6C00043Q00124Q00013Q00020E00016Q000B3Q000200012Q000A3Q00013Q00013Q00153Q00028Q00026Q00F03F03043Q0067616D65030A3Q0047657453657276696365030A3Q0047756953657276696365030A3Q00436C656172452Q726F7203053Q007072696E74031D3Q005363726970742065786563757465642073752Q63652Q7366752Q6C792103073Q0067657467656E762Q033Q004C6F6C2Q0103043Q007461736B03043Q007761697403113Q005265706C69636174656453746F7261676503073Q0050726F6A656374030B3Q0052656D6F74654576656E7403133Q00436F6E74726F6C4D652Q736167654576656E74030A3Q0046697265536572766572027Q0040025Q00407F40026Q002640003B3Q0012103Q00014Q0001000100013Q0026143Q0002000100010004113Q00020001001210000100013Q00261400010011000100020004113Q0011000100122Q000200033Q00201200020002000400122Q000400056Q00020004000200202Q0002000200064Q00020002000100122Q000200073Q00122Q000300086Q00020002000100044Q003A000100261400010005000100010004113Q00050001001210000200013Q000E0500010032000100020004113Q0032000100122Q000300094Q000400030001000200300D0003000A000B00122Q0003000A3Q00061A0003003100013Q0004113Q0031000100122Q0003000C3Q00201500030003000D2Q000400030001000200061A0003003100013Q0004113Q0031000100122Q000300033Q00200C00030003000400122Q0005000E6Q00030005000200202Q00030003000F00202Q00030003001000202Q00030003001100202Q00030003001200122Q000500136Q000600033Q00122Q000700023Q00122Q000800143Q00122Q000900156Q0006000300012Q000F0003000600010004113Q00190001001210000200023Q00261400020014000100020004113Q00140001001210000100023Q0004113Q000500010004113Q001400010004113Q000500010004113Q003A00010004113Q000200012Q000A3Q00017Q00013Q0003053Q007063612Q6C00043Q00124Q00013Q00020E00016Q000B3Q000200012Q000A3Q00013Q00013Q00063Q0003043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203043Q004B69636B03243Q00596F752063686F7365206E6F7420746F206578656375746520746865207363726970742103083Q0053687574646F776E00103Q00124Q00013Q0020155Q00020020155Q000300061A3Q000C00013Q0004113Q000C000100124Q00013Q0020085Q000200206Q000300206Q000400122Q000200058Q0002000100044Q000F000100124Q00013Q0020065Q00062Q000B3Q000200012Q000A3Q00017Q00", v9(), ...);
