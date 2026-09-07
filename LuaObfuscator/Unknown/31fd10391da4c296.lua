--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

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
			local v82 = 0;
			local v83;
			while true do
				if (v82 == 0) then
					v83 = v2(v0(v30, 16));
					if v19 then
						local v106 = v5(v83, v19);
						v19 = nil;
						return v106;
					else
						return v83;
					end
					break;
				end
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v84 = (v31 / (2 ^ (v32 - 1))) % ((5 - 3) ^ (((v33 - (2 - 1)) - (v32 - (1 - 0))) + ((879 - (282 + 595)) - 1)));
			return v84 - (v84 % (620 - (555 + 64)));
		else
			local v85 = 931 - (857 + 74);
			local v86;
			while true do
				if (v85 == (568 - (367 + 201))) then
					v86 = (929 - (214 + (2350 - (1523 + 114)))) ^ (v32 - (1 + 0));
					return (((v31 % (v86 + v86)) >= v86) and (1 + 0)) or 0;
				end
			end
		end
	end
	local function v21()
		local v34 = 0 + 0;
		local v35;
		while true do
			if (v34 == ((118 - (32 + 85)) - 0)) then
				return v35;
			end
			if (v34 == (1065 - (68 + 978 + 19))) then
				v35 = v1(v16, v18, v18);
				v18 = v18 + (1271 - (226 + 232 + 812));
				v34 = 4 - 3;
			end
		end
	end
	local function v22()
		local v36, v37 = v1(v16, v18, v18 + (959 - (892 + 65)));
		v18 = v18 + (4 - 2);
		return (v37 * (472 - 216)) + v36;
	end
	local function v23()
		local v38 = 0 - 0;
		local v39;
		local v40;
		local v41;
		local v42;
		while true do
			if (v38 == (350 - (87 + 263))) then
				v39, v40, v41, v42 = v1(v16, v18, v18 + (183 - (67 + 113)));
				v18 = v18 + 3 + 1;
				v38 = 1;
			end
			if (v38 == (2 - 1)) then
				return (v42 * (12338840 + (11949609 - 7511233))) + (v41 * (260471 - 194935)) + (v40 * (1208 - (802 + (272 - 122)))) + v39;
			end
		end
	end
	local function v24()
		local v43 = 0 + 0;
		local v44;
		local v45;
		local v46;
		local v47;
		local v48;
		local v49;
		while true do
			if (v43 == (1000 - (915 + (1495 - (447 + 966))))) then
				if (v48 == (0 + 0 + 0)) then
					if (v47 == (0 - (1817 - (1703 + 114)))) then
						return v49 * (0 + 0);
					else
						v48 = (1056 - (87 + 968)) - 0;
						v46 = 1187 - (1069 + 118);
					end
				elseif (v48 == ((20438 - 15795) - 2596)) then
					return ((v47 == (0 - 0)) and (v49 * ((1 + 0) / (0 - 0)))) or (v49 * NaN);
				end
				return v8(v49, v48 - (1882 - (814 + 45))) * (v46 + (v47 / ((4 - 2) ^ (52 + 0 + 0))));
			end
			if (v43 == (792 - (368 + 423))) then
				v46 = 3 - (703 - (376 + 325));
				v47 = (v20(v45, 19 - (10 + 8), 76 - (91 - 35)) * (((1366 - 922) - (416 + 26)) ^ (108 - 76))) + v44;
				v43 = 6 - 4;
			end
			if (v43 == (1 + 1)) then
				v48 = v20(v45, (162 - 90) - 51, 54 - 23);
				v49 = ((v20(v45, 470 - (145 + 293)) == (767 - (745 + (46 - 25)))) and -(1 + 0)) or (431 - (44 + 386));
				v43 = 11 - 8;
			end
			if (v43 == (0 + 0)) then
				v44 = v23();
				v45 = v23();
				v43 = 1487 - (998 + 488);
			end
		end
	end
	local function v25(v50)
		local v51 = 14 - (9 + 5);
		local v52;
		local v53;
		while true do
			if (v51 == (379 - (85 + 291))) then
				return v6(v53);
			end
			if ((1266 - (243 + 1022)) == v51) then
				v52 = v3(v16, v18, (v18 + v50) - (3 - 2));
				v18 = v18 + v50;
				v51 = 2 + 0 + 0;
			end
			if (v51 == (1180 - (1123 + 57))) then
				v52 = nil;
				if not v50 then
					v50 = v23();
					if (v50 == 0) then
						return "";
					end
				end
				v51 = 1 + 0;
			end
			if (v51 == (256 - (163 + 91))) then
				v53 = {};
				for v94 = 1931 - ((6582 - 4713) + 61), #v52 do
					v53[v94] = v2(v1(v3(v52, v94, v94)));
				end
				v51 = 3;
			end
		end
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v54 = (function()
			return 0;
		end)();
		local v55 = (function()
			return;
		end)();
		local v56 = (function()
			return;
		end)();
		local v57 = (function()
			return;
		end)();
		local v58 = (function()
			return;
		end)();
		local v59 = (function()
			return;
		end)();
		local v60 = (function()
			return;
		end)();
		local v61 = (function()
			return;
		end)();
		while true do
			if (v54 ~= 1) then
			else
				local v90 = (function()
					return 0;
				end)();
				while true do
					if (1 == v90) then
						v60 = (function()
							return v23();
						end)();
						v54 = (function()
							return 2;
						end)();
						break;
					end
					if (v90 ~= 0) then
					else
						v58 = (function()
							return {};
						end)();
						v59 = (function()
							return {v56,v57,nil,v58};
						end)();
						v90 = (function()
							return 1;
						end)();
					end
				end
			end
			if (v54 == 2) then
				local v91 = (function()
					return 0;
				end)();
				while true do
					if (v91 == 1) then
						v59[#"gha"] = (function()
							return v21();
						end)();
						v54 = (function()
							return 783 - (162 + 618);
						end)();
						break;
					end
					if (v91 == (0 + 0)) then
						local v105 = (function()
							return 0;
						end)();
						while true do
							if (v105 ~= (0 + 0)) then
							else
								v61 = (function()
									return {};
								end)();
								for v111 = #" ", v60 do
									local v112 = (function()
										return 0 - 0;
									end)();
									local v113 = (function()
										return;
									end)();
									local v114 = (function()
										return;
									end)();
									local v115 = (function()
										return;
									end)();
									while true do
										if (v112 ~= (0 - 0)) then
										else
											local v248 = (function()
												return 0 + 0;
											end)();
											while true do
												if (v248 == 1) then
													v112 = (function()
														return 1;
													end)();
													break;
												end
												if (0 == v248) then
													v113 = (function()
														return 1636 - (1373 + 263);
													end)();
													v114 = (function()
														return nil;
													end)();
													v248 = (function()
														return 1001 - (451 + 549);
													end)();
												end
											end
										end
										if (v112 == 1) then
											v115 = (function()
												return nil;
											end)();
											while true do
												if (v113 == 0) then
													local v515 = (function()
														return 0 + 0;
													end)();
													while true do
														if (v515 ~= 1) then
														else
															v113 = (function()
																return 1 - 0;
															end)();
															break;
														end
														if (0 == v515) then
															v114 = (function()
																return v21();
															end)();
															v115 = (function()
																return nil;
															end)();
															v515 = (function()
																return 1 - 0;
															end)();
														end
													end
												end
												if (v113 ~= (1385 - (746 + 638))) then
												else
													if (v114 == #"{") then
														v115 = (function()
															return v21() ~= (0 + 0);
														end)();
													elseif (v114 == (2 - 0)) then
														v115 = (function()
															return v24();
														end)();
													elseif (v114 == #"-19") then
														v115 = (function()
															return v25();
														end)();
													end
													v61[v111] = (function()
														return v115;
													end)();
													break;
												end
											end
											break;
										end
									end
								end
								v105 = (function()
									return 1;
								end)();
							end
							if (v105 ~= 1) then
							else
								v91 = (function()
									return 342 - (218 + 123);
								end)();
								break;
							end
						end
					end
				end
			end
			if (v54 ~= 0) then
			else
				local v92 = (function()
					return 1581 - (1535 + 46);
				end)();
				local v93 = (function()
					return;
				end)();
				while true do
					if ((0 + 0) ~= v92) then
					else
						v93 = (function()
							return 0;
						end)();
						while true do
							if (v93 == 0) then
								v55 = (function()
									return function(v116, v117, v118)
										local v119 = (function()
											return 0 + 0;
										end)();
										local v120 = (function()
											return;
										end)();
										while true do
											if (0 == v119) then
												v120 = (function()
													return 0;
												end)();
												while true do
													if ((560 - (306 + 254)) == v120) then
														v116[v117 - #"}"] = (function()
															return v118();
														end)();
														return v116, v117, v118;
													end
												end
												break;
											end
										end
									end;
								end)();
								v56 = (function()
									return {};
								end)();
								v93 = (function()
									return 1 + 0;
								end)();
							end
							if (v93 ~= 1) then
							else
								v57 = (function()
									return {};
								end)();
								v54 = (function()
									return 1;
								end)();
								break;
							end
						end
						break;
					end
				end
			end
			if (v54 == 3) then
				for v96 = #"<", v23() do
					local v97 = (function()
						return 0;
					end)();
					local v98 = (function()
						return;
					end)();
					while true do
						if (v97 ~= (0 - 0)) then
						else
							v98 = (function()
								return v21();
							end)();
							if (v20(v98, #"/", #"<") == 0) then
								local v107 = (function()
									return 1467 - (899 + 568);
								end)();
								local v108 = (function()
									return;
								end)();
								local v109 = (function()
									return;
								end)();
								local v110 = (function()
									return;
								end)();
								while true do
									if (v107 ~= (0 + 0)) then
									else
										v108 = (function()
											return v20(v98, 4 - 2, #"nil");
										end)();
										v109 = (function()
											return v20(v98, #"http", 6);
										end)();
										v107 = (function()
											return 604 - (268 + 335);
										end)();
									end
									if (v107 ~= 2) then
									else
										if (v20(v109, #" ", #">") == #":") then
											v110[2] = (function()
												return v61[v110[2]];
											end)();
										end
										if (v20(v109, 292 - (60 + 230), 574 - (426 + 146)) ~= #"!") then
										else
											v110[#"xnx"] = (function()
												return v61[v110[#"asd"]];
											end)();
										end
										v107 = (function()
											return 3;
										end)();
									end
									if (v107 == (1 + 0)) then
										v110 = (function()
											return {v22(),v22(),nil,nil};
										end)();
										if (v108 == 0) then
											local v257 = (function()
												return 0;
											end)();
											local v258 = (function()
												return;
											end)();
											while true do
												if (v257 ~= 0) then
												else
													v258 = (function()
														return 0;
													end)();
													while true do
														if (v258 ~= (1456 - (282 + 1174))) then
														else
															v110[#"xxx"] = (function()
																return v22();
															end)();
															v110[#".com"] = (function()
																return v22();
															end)();
															break;
														end
													end
													break;
												end
											end
										elseif (v108 == #":") then
											v110[#"-19"] = (function()
												return v23();
											end)();
										elseif (v108 == (813 - (569 + 242))) then
											v110[#"19("] = (function()
												return v23() - (2 ^ 16);
											end)();
										elseif (v108 == #"gha") then
											local v612 = (function()
												return 0 - 0;
											end)();
											local v613 = (function()
												return;
											end)();
											while true do
												if (v612 == (0 + 0)) then
													v613 = (function()
														return 1024 - (706 + 318);
													end)();
													while true do
														if (0 == v613) then
															v110[#"asd"] = (function()
																return v23() - ((1253 - (721 + 530)) ^ (1287 - (945 + 326)));
															end)();
															v110[#"http"] = (function()
																return v22();
															end)();
															break;
														end
													end
													break;
												end
											end
										end
										v107 = (function()
											return 2;
										end)();
									end
									if (v107 == (7 - 4)) then
										if (v20(v109, #"19(", #"gha") ~= #"~") then
										else
											v110[#".dev"] = (function()
												return v61[v110[#".dev"]];
											end)();
										end
										v56[v96] = (function()
											return v110;
										end)();
										break;
									end
								end
							end
							break;
						end
					end
				end
				for v99 = #"}", v23() do
					v57, v99, v28 = (function()
						return v55(v57, v99, v28);
					end)();
				end
				return v59;
			end
		end
	end
	local function v29(v62, v63, v64)
		local v65 = v62[1 + 0];
		local v66 = v62[702 - (271 + 429)];
		local v67 = v62[3 + 0];
		return function(...)
			local v68 = v65;
			local v69 = v66;
			local v70 = v67;
			local v71 = v27;
			local v72 = 1;
			local v73 = -(1501 - (1408 + 92));
			local v74 = {};
			local v75 = {...};
			local v76 = v12("#", ...) - 1;
			local v77 = {};
			local v78 = {};
			for v87 = 1288 - (993 + 295), v76 do
				if ((233 < 487) and (3196 > 2550) and (v87 >= v70)) then
					v74[v87 - v70] = v75[v87 + 1 + 0];
				else
					v78[v87] = v75[v87 + (1172 - (214 + 204 + 753))];
				end
			end
			local v79 = (v76 - v70) + 1 + 0 + 0;
			local v80;
			local v81;
			while true do
				v80 = v68[v72];
				v81 = v80[1 + 0 + 0];
				if (v81 <= 20) then
					if (v81 <= 9) then
						if (v81 <= 4) then
							if ((2473 >= 201) and (v81 <= (1 + 0))) then
								if (v81 == (0 + 0 + 0)) then
									local v122;
									v78[v80[531 - (406 + 123)]] = v64[v80[1772 - ((1970 - (55 + 166)) + 20)]];
									v72 = v72 + 1 + 0;
									v80 = v68[v72];
									v78[v80[1324 - (1249 + 73)]] = v78[v80[1 + 1 + 1]][v80[1149 - (466 + 69 + 610)]];
									v72 = v72 + 1;
									v80 = v68[v72];
									v78[v80[4 - 2]] = v80[8 - 5];
									v72 = v72 + (1901 - (106 + 1794));
									v80 = v68[v72];
									v122 = v80[1 + 1];
									v78[v122] = v78[v122](v78[v122 + 1 + 0]);
									v72 = v72 + (2 - 1);
									v80 = v68[v72];
									v78[v80[2]] = v78[v80[7 - 4]];
									v72 = v72 + (115 - (4 + 110));
									v80 = v68[v72];
									v78[v80[586 - (57 + 527)]][v80[1430 - (41 + (5292 - 3906))]] = v78[v80[4]];
									v72 = v72 + 1;
									v80 = v68[v72];
									v78[v80[105 - ((314 - (36 + 261)) + 86)]] = v64[v80[3 + 0]];
									v72 = v72 + 1;
									v80 = v68[v72];
									v78[v80[3 - 1]] = v78[v80[8 - 5]][v80[170 - (122 + 44)]];
									v72 = v72 + (1 - 0);
									v80 = v68[v72];
									v78[v80[2]] = v80[3];
									v72 = v72 + (3 - 2);
									v80 = v68[v72];
									v78[v80[2 + 0]] = v80[1 + 2];
								elseif (v78[v80[3 - 1]] ~= v80[4]) then
									v72 = v72 + (66 - (30 + (60 - 25)));
								else
									v72 = v80[3 + 0];
								end
							elseif (v81 <= (1259 - (1043 + 214))) then
								local v143 = v80[2];
								local v144 = v78[v143];
								for v249 = v143 + 1, v80[11 - 8] do
									v7(v144, v78[v249]);
								end
							elseif (v81 > (1215 - ((1691 - (34 + 1334)) + 889))) then
								local v261;
								v78[v80[2]] = v78[v80[7 - 4]][v80[584 - (361 + 219)]];
								v72 = v72 + (321 - (53 + 103 + 164));
								v80 = v68[v72];
								v78[v80[1 + 1]] = v80[416 - (15 + 398)];
								v72 = v72 + (983 - (18 + 964));
								v80 = v68[v72];
								v78[v80[7 - 5]] = v80[2 + 1];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[852 - (20 + 830)]] = v80[3];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[128 - (116 + 10)]] = v80[1 + 2];
								v72 = v72 + (739 - (542 + 196));
								v80 = v68[v72];
								v261 = v80[3 - 1];
								v78[v261] = v78[v261](v13(v78, v261 + 1 + 0, v80[2 + 1]));
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[4 - 2]][v80[3]] = v78[v80[9 - 5]];
								v72 = v72 + (1552 - (1126 + 425));
								v80 = v68[v72];
								v78[v80[2]][v80[3]] = v80[409 - (118 + 223 + 64)];
								v72 = v72 + (3 - 2);
								v80 = v68[v72];
								v78[v80[1123 - (118 + 1003)]] = v64[v80[8 - 5]];
								v72 = v72 + ((1661 - (1035 + 248)) - (142 + (256 - (20 + 1))));
								v80 = v68[v72];
								v78[v80[2 + 0]] = v78[v80[13 - (329 - (134 + 185))]][v80[(1134 - (549 + 584)) + 3]];
							else
								local v283 = 0;
								local v284;
								local v285;
								while true do
									if (v283 == (982 - (553 + 424))) then
										v284 = v78[v80[5 - 2]];
										v78[v285 + 1 + 0] = v284;
										v78[v285] = v284[v80[4 + (685 - (314 + 371))]];
										v72 = v72 + 1;
										v80 = v68[v72];
										v283 = 6;
									end
									if (v283 == (2 + 0)) then
										v80 = v68[v72];
										v78[v80[1 + 1]] = v78[v80[3]][v80[3 + 1]];
										v72 = v72 + (2 - 1);
										v80 = v68[v72];
										v78[v80[5 - 3]] = v80[6 - 3];
										v283 = 3;
									end
									if (v283 == (1 + 2)) then
										v72 = v72 + (4 - 3);
										v80 = v68[v72];
										v285 = v80[2];
										v78[v285] = v78[v285](v78[v285 + 1]);
										v72 = v72 + (754 - (239 + (1764 - 1250)));
										v283 = 2 + 2;
									end
									if ((4120 >= 133) and (v283 == (1329 - ((1765 - (478 + 490)) + 532)))) then
										v284 = nil;
										v285 = nil;
										v78[v80[2 + 0]] = v78[v80[2 + 1]][v80[4]];
										v72 = v72 + (2 - 1);
										v80 = v68[v72];
										v283 = 1;
									end
									if (v283 == 1) then
										v78[v80[2]] = v78[v80[3]][v80[4]];
										v72 = v72 + 1;
										v80 = v68[v72];
										v78[v80[1204 - (373 + 829)]] = v64[v80[734 - (476 + 255)]];
										v72 = v72 + ((600 + 531) - (369 + (1933 - (786 + 386))));
										v283 = 2;
									end
									if (v283 == (4 + 2)) then
										v78[v80[(6 - 4) - 0]] = v80[5 - 2];
										v72 = v72 + (239 - (64 + 174));
										v80 = v68[v72];
										v285 = v80[1 + 1];
										v78[v285] = v78[v285](v13(v78, v285 + (1 - 0), v80[1382 - (1055 + 324)]));
										break;
									end
									if ((3080 >= 1986) and (v283 == (1344 - (1093 + 247)))) then
										v80 = v68[v72];
										v78[v80[2]] = v78[v80[339 - (144 + 192)]];
										v72 = v72 + 1;
										v80 = v68[v72];
										v285 = v80[218 - (38 + 4 + 174)];
										v283 = 4 + 1;
									end
								end
							end
						elseif (v81 <= (5 + 1)) then
							if (v81 > 5) then
								local v145 = 0;
								local v146;
								local v147;
								local v148;
								while true do
									if (v145 == (1 + 0)) then
										v148 = {};
										v147 = v10({}, {__index=function(v518, v519)
											local v520 = 1504 - (363 + 1141);
											local v521;
											while true do
												if ((v520 == (1580 - (1183 + 397))) or (1439 > 3538)) then
													v521 = v148[v519];
													return v521[2 - 1][v521[2 + 0]];
												end
											end
										end,__newindex=function(v522, v523, v524)
											local v525 = v148[v523];
											v525[1 + 0][v525[1977 - (1913 + 62)]] = v524;
										end});
										v145 = 2;
									end
									if ((2456 < 4176) and (v145 == (0 + 0))) then
										v146 = v69[v80[7 - 4]];
										v147 = nil;
										v145 = 1;
									end
									if ((v145 == 2) or (1150 == 3452) or (419 < 7)) then
										for v527 = 1, v80[(204 + 1733) - (565 + 1368)] do
											v72 = v72 + 1;
											local v528 = v68[v72];
											if (v528[3 - 2] == (1692 - ((5863 - 4386) + 184))) then
												v148[v527 - 1] = {v78,v528[859 - (564 + 292)]};
											else
												v148[v527 - 1] = {v63,v528[8 - 5]};
											end
											v77[#v77 + (305 - ((693 - 449) + 60))] = v148;
										end
										v78[v80[2 + 0]] = v29(v146, v147, v64);
										break;
									end
								end
							else
								v78[v80[478 - (41 + 435)]] = v80[7 - 4];
							end
						elseif (v81 <= (1008 - (938 + 63))) then
							v78[v80[2 + 0]] = v80[1128 - (936 + 189)];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[1615 - (1565 + 48)]] = v80[2 + 1];
							v72 = v72 + (1139 - (782 + 356));
							v80 = v68[v72];
							v78[v80[269 - (176 + 91)]] = v80[7 - 4];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[2 - 0]] = v80[1095 - (975 + 117)];
							v72 = v72 + (1876 - (157 + 612 + 1106));
							v80 = v68[v72];
							v78[v80[2 + 0]] = v80[10 - 7];
							v72 = v72 + (3 - 2);
							v80 = v68[v72];
							v78[v80[1020 - (697 + (1236 - 915))]] = v80[3];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[5 - 3]] = v80[5 - (6 - 4)];
							v72 = v72 + (2 - 1);
							v80 = v68[v72];
							v78[v80[1 + 1]] = v80[3 + 0];
							v72 = v72 + (1 - 0);
							v80 = v68[v72];
							v78[v80[(12 - 7) - 3]] = v80[1230 - (322 + 905)];
							v72 = v72 + (612 - (602 + 9));
							v80 = v68[v72];
							v78[v80[1191 - (449 + 740)]] = v80[875 - (826 + (734 - (364 + 324)))];
						elseif ((1875 < 2258) and (v81 == 8)) then
							local v286;
							v78[v80[(2601 - 1652) - (245 + 702)]] = v80[9 - 6];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[2]] = v80[1901 - (260 + 1638)];
							v72 = v72 + (441 - (382 + 58));
							v80 = v68[v72];
							v286 = v80[2];
							v78[v286] = v78[v286](v13(v78, v286 + (3 - 2), v80[3 + (0 - 0)]));
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[3 - (1 + 0)]][v80[8 - 5]] = v78[v80[1209 - (902 + 303)]];
							v72 = v72 + (1 - (0 - 0));
							v80 = v68[v72];
							v78[v80[2]][v80[6 - 3]] = v80[1 + 3];
							v72 = v72 + (1691 - (1121 + 569));
							v80 = v68[v72];
							v78[v80[216 - (22 + 192)]] = v80[686 - (483 + 200)];
						else
							local v300 = 1463 - ((2248 - 844) + 59);
							local v301;
							while true do
								if (v300 == ((0 - 0) - 0)) then
									v301 = v80[(1270 - (1249 + 19)) - 0];
									v78[v301](v13(v78, v301 + (766 - (468 + 297)), v80[565 - (302 + 32 + 228)]));
									break;
								end
							end
						end
					elseif ((2820 == 2820) and (1173 > 41) and (v81 <= (47 - 33))) then
						if ((v81 <= (25 - 14)) or (56 >= 3208) or (4362 <= 3527)) then
							if (v81 == (18 - 8)) then
								v78[v80[(3 - 2) + 1]] = v63[v80[3]];
							else
								local v173;
								v78[v80[238 - (141 + 95)]] = v78[v80[3 + 0]][v80[9 - 5]];
								v72 = v72 + (2 - 1);
								v80 = v68[v72];
								v78[v80[1 + 1]] = v80[3];
								v72 = v72 + (2 - 1);
								v80 = v68[v72];
								v78[v80[2 + 0]] = v80[1089 - (686 + 400)];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[2]] = v80[3];
								v72 = v72 + 1;
								v80 = v68[v72];
								v78[v80[2 - 0]] = v80[3];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v173 = v80[165 - (92 + 56 + 15)];
								v78[v173] = v78[v173](v13(v78, v173 + 1 + 0, v80[4 - (230 - (73 + 156))]));
								v72 = v72 + (766 - (574 + 191));
								v80 = v68[v72];
								v78[v80[2]][v80[3]] = v78[v80[4]];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[4 - 2]] = v64[v80[3]];
								v72 = v72 + 1;
								v80 = v68[v72];
								v78[v80[2 + 0]] = v78[v80[852 - (254 + 595)]][v80[130 - (55 + 71)]];
								v72 = v72 + ((1 + 0) - 0);
								v80 = v68[v72];
								v78[v80[2]] = v80[1793 - (573 + 1217)];
							end
						elseif ((2613 <= 2680) and (4313 > 3373) and (v81 <= (33 - 21))) then
							local v191 = v80[1 + 1];
							v78[v191] = v78[v191](v78[v191 + (1 - 0)]);
						elseif (v81 == (952 - (714 + 225))) then
							v78[v80[5 - 3]] = v78[v80[3 - 0]][v80[4]];
						else
							local v304;
							v78[v80[1 + (812 - (721 + 90))]] = v64[v80[3]];
							v72 = v72 + (1 - 0);
							v80 = v68[v72];
							v78[v80[2]] = v78[v80[809 - (118 + 688)]][v80[4]];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[(1 + 49) - (25 + 23)]] = v80[1 + 2];
							v72 = v72 + (1887 - (927 + 959));
							v80 = v68[v72];
							v304 = v80[6 - 4];
							v78[v304] = v78[v304](v78[v304 + 1]);
							v72 = v72 + (733 - (16 + 716));
							v80 = v68[v72];
							v78[v80[3 - 1]] = v78[v80[9 - 6]];
							v72 = v72 + (98 - (11 + 86));
							v80 = v68[v72];
							v78[v80[(474 - (224 + 246)) - 2]] = v64[v80[3]];
							v72 = v72 + (286 - (175 + 110));
							v80 = v68[v72];
							v78[v80[4 - 2]] = v78[v80[3]][v80[19 - 15]];
							v72 = v72 + ((2910 - 1113) - (503 + 1293));
							v80 = v68[v72];
							v78[v80[2]] = v80[8 - (9 - 4)];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[2 + 0]] = v80[1064 - (810 + 251)];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[1 + 1]] = v80[3 + 0];
						end
					elseif ((v81 <= (550 - (43 + 490))) or (1482 >= 4288)) then
						if ((v81 <= 15) or (2462 > 4426)) then
							local v193;
							v78[v80[735 - (711 + 22)]] = v78[v80[3]][v80[15 - 11]];
							v72 = v72 + (860 - (240 + 619));
							v80 = v68[v72];
							v78[v80[1 + 1]] = v80[4 - 1];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v193 = v80[1746 - (32 + 1312 + 400)];
							v78[v193] = v78[v193](v78[v193 + ((299 + 107) - (255 + (298 - 148)))]);
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[6 - 4]] = v78[v80[3 + 0]];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[8 - 6]][v80[9 - 6]] = v78[v80[1743 - (404 + 1335)]];
							v72 = v72 + (407 - (183 + (736 - (203 + 310))));
							v80 = v68[v72];
							v78[v80[2 - (1993 - (1238 + 755))]] = v64[v80[2 + 1]];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[339 - (10 + 327)]] = v78[v80[3 + 0]][v80[(24 + 318) - (118 + (1754 - (709 + 825)))]];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[451 - (108 + (628 - 287))]] = v80[2 + 1];
							v72 = v72 + (4 - (3 - 0));
							v80 = v68[v72];
							v78[v80[2]] = v80[1496 - (711 + 782)];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[3 - 1]] = v80[472 - (270 + 199)];
						elseif (v81 == (6 + 10)) then
							v78[v80[2]] = v78[v80[1822 - (580 + 1239)]][v80[(875 - (196 + 668)) - 7]];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[1 + 1]] = v78[v80[2 + (3 - 2)]][v80[7 - 3]];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[4 - 2]][v80[2 + 1]] = v78[v80[837 - (171 + 662)]];
							v72 = v72 + (1168 - (645 + 522));
							v80 = v68[v72];
							v78[v80[1792 - ((1103 - (4 + 89)) + 780)]] = v64[v80[3]];
							v72 = v72 + 1 + (0 - 0);
							v80 = v68[v72];
							v78[v80[9 - 7]] = v78[v80[8 - 5]][v80[4]];
							v72 = v72 + (1837 - (1045 + 791));
							v80 = v68[v72];
							v78[v80[4 - 2]] = v78[v80[4 - 1]][v80[2 + 2]];
							v72 = v72 + (506 - ((1541 - 1190) + 154));
							v80 = v68[v72];
							v78[v80[2]][v80[1577 - (1281 + 293)]] = v78[v80[270 - (28 + 94 + 144)]];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[4 - 2]] = v64[v80[1562 - ((2867 - (35 + 1451)) + 178)]];
							v72 = v72 + 1 + 0;
							v80 = v68[v72];
							v78[v80[2 + 0]] = v78[v80[2 + 1]][v80[13 - 9]];
							v72 = v72 + (1454 - (28 + 1425)) + 0;
							v80 = v68[v72];
							v78[v80[2]] = v78[v80[473 - (381 + 89)]][v80[4 + 0]];
						else
							do
								return;
							end
						end
					elseif (v81 <= (13 + 5)) then
						v78[v80[(1995 - (941 + 1052)) - 0]][v80[3]] = v78[v80[4]];
					elseif ((4774 == 4774) and (v81 > (1175 - (1074 + 82)))) then
						local v343;
						v78[v80[3 - 1]][v80[3 + 0]] = v80[4];
						v72 = v72 + (1785 - (214 + 1570));
						v80 = v68[v72];
						v78[v80[1457 - (990 + (1979 - (822 + 692)))]] = v64[v80[3]];
						v72 = v72 + (1 - 0) + 0;
						v80 = v68[v72];
						v78[v80[1 + 1 + 0]] = v80[3 + 0];
						v72 = v72 + ((300 - (45 + 252)) - 2);
						v80 = v68[v72];
						v343 = v80[1728 - (1668 + 58 + 0)];
						v78[v343](v78[v343 + (627 - (512 + 114))]);
						v72 = v72 + 1;
						v80 = v68[v72];
						v78[v80[5 - 3]] = v80[5 - 2];
					else
						local v354;
						v78[v80[2]] = v64[v80[10 - 7]];
						v72 = v72 + 1 + 0;
						v80 = v68[v72];
						v78[v80[2]] = v78[v80[3]][v80[1 + 2 + 1]];
						v72 = v72 + 1 + (0 - 0);
						v80 = v68[v72];
						v78[v80[2]] = v80[10 - 7];
						v72 = v72 + (1995 - (109 + 1885));
						v80 = v68[v72];
						v78[v80[1471 - (1269 + 200)]] = v80[5 - (435 - (114 + 319))];
						v72 = v72 + 1;
						v80 = v68[v72];
						v78[v80[(1172 - 355) - (98 + 717)]] = v80[3];
						v72 = v72 + ((1059 - 232) - (802 + 24));
						v80 = v68[v72];
						v78[v80[(2 + 0) - 0]] = v80[3 - 0];
						v72 = v72 + 1 + 0;
						v80 = v68[v72];
						v354 = v80[2 + 0];
						v78[v354] = v78[v354](v13(v78, v354 + 1 + (0 - 0), v80[1 + (3 - 1)]));
						v72 = v72 + (2 - (1964 - (556 + 1407)));
						v80 = v68[v72];
						v78[v80[6 - 4]][v80[2 + 1]] = v78[v80[2 + 2]];
						v72 = v72 + 1 + 0;
						v80 = v68[v72];
						v78[v80[2 + 0]] = v64[v80[2 + 1]];
						v72 = v72 + (1434 - (797 + (1842 - (741 + 465))));
						v80 = v68[v72];
						v78[v80[2]] = v78[v80[14 - 11]][v80[1623 - (1427 + (657 - (170 + 295)))]];
					end
				elseif (v81 <= (11 + 20)) then
					if ((v81 <= (58 - 33)) or (4493 == 2225)) then
						if ((3104 >= 3092) and (v81 <= (20 + 2))) then
							if (v81 == (6 + 4 + 11)) then
								local v217 = v80[328 - (192 + 134)];
								local v218 = {};
								for v250 = 1277 - (316 + 882 + 78), #v77 do
									local v251 = 0;
									local v252;
									while true do
										if (v251 == (0 + 0)) then
											v252 = v77[v250];
											for v565 = 0, #v252 do
												local v566 = v252[v565];
												local v567 = v566[1 + 0];
												local v568 = v566[2 + 0];
												if ((3548 > 3098) and (v567 == v78) and (v568 >= v217)) then
													v218[v568] = v567[v568];
													v566[3 - 2] = v218;
												end
											end
											break;
										end
									end
								end
							else
								local v219 = 551 - (83 + (1152 - 684));
								local v220;
								while true do
									if (v219 == (1812 - (997 + 205 + 604))) then
										v78[v220] = v78[v220](v78[v220 + (4 - 3)]);
										v72 = v72 + ((1 + 0) - 0);
										v80 = v68[v72];
										v78[v80[5 - 3]] = v78[v80[328 - (45 + 280)]];
										v219 = 7 + 0;
									end
									if ((566 <= 960) and (v219 == (1 + 0 + 0))) then
										v78[v80[1 + 1]] = v80[3];
										v72 = v72 + 1 + 0;
										v80 = v68[v72];
										v220 = v80[2];
										v219 = 1232 - (957 + 273);
									end
									if ((v219 == (1 + 2 + 2)) or (3252 == 503) or (2910 <= 1930)) then
										v78[v80[3 - 1]] = v80[(767 + 1147) - (340 + 1571)];
										v72 = v72 + (3 - 2) + 0;
										v80 = v68[v72];
										v220 = v80[2];
										v219 = 1778 - (1733 + 39);
									end
									if ((4733 > 2066) and (v219 == 2)) then
										v78[v220] = v78[v220](v13(v78, v220 + 1, v80[8 - 5]));
										v72 = v72 + (1035 - ((329 - 204) + 909));
										v80 = v68[v72];
										v78[v80[1950 - (1096 + 852)]][v80[2 + 1]] = v78[v80[5 - 1]];
										v219 = 3 + 0;
									end
									if ((v219 == ((1575 - 1059) - (409 + 103))) or (19 > 452)) then
										v80 = v68[v72];
										v78[v80[238 - (46 + 190)]] = v78[v80[98 - (51 + 44)]][v80[2 + 2]];
										v72 = v72 + (1318 - (1114 + 203));
										v80 = v68[v72];
										v219 = 731 - (228 + 498);
									end
									if (v219 == (1 + 2)) then
										v72 = v72 + 1;
										v80 = v68[v72];
										v78[v80[2]] = v64[v80[2 + 1]];
										v72 = v72 + (664 - (174 + 489));
										v219 = 10 - 6;
									end
									if ((3549 >= 916) and ((1912 - (830 + 1075)) == v219)) then
										v72 = v72 + (525 - (303 + (1094 - 873)));
										v80 = v68[v72];
										v78[v80[1271 - (231 + 1038)]] = v80[3 + 0];
										break;
									end
									if (v219 == 0) then
										v220 = nil;
										v78[v80[1164 - (171 + 991)]] = v80[12 - 9];
										v72 = v72 + ((1782 - (389 + 1391)) - 1);
										v80 = v68[v72];
										v219 = 2 - 1;
									end
								end
							end
						elseif (v81 <= 23) then
							for v253 = v80[2], v80[2 + 1 + 0] do
								v78[v253] = nil;
							end
						elseif ((v81 == (83 - 59)) or (2189 <= 245)) then
							local v373;
							v78[v80[2]] = v64[v80[8 - 5]];
							v72 = v72 + (1 - (0 + 0));
							v80 = v68[v72];
							v78[v80[2]] = v78[v80[3]][v80[12 - 8]];
							v72 = v72 + ((2843 - 1594) - (111 + 1137));
							v80 = v68[v72];
							v78[v80[(1111 - (783 + 168)) - (91 + 67)]] = v80[8 - 5];
							v72 = v72 + 1;
							v80 = v68[v72];
							v373 = v80[(3 - 2) + 1];
							v78[v373] = v78[v373](v78[v373 + 1]);
							v72 = v72 + (524 - (423 + 100));
							v80 = v68[v72];
							v78[v80[1 + 1]] = v78[v80[3]];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[5 - 3]][v80[2 + 0 + 1]] = v78[v80[775 - (326 + 445)]];
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[8 - 6]] = v64[v80[3]];
							v72 = v72 + (2 - 1);
							v80 = v68[v72];
							v78[v80[4 - 2]] = v78[v80[714 - (530 + 181)]][v80[885 - (614 + 267)]];
							v72 = v72 + (33 - (19 + 13));
							v80 = v68[v72];
							v78[v80[2 - 0]] = v80[6 - 3];
							v72 = v72 + (2 - 1);
							v80 = v68[v72];
							v78[v80[1 + (312 - (309 + 2))]] = v80[4 - 1];
						elseif ((v80[3 - 1] == v78[v80[1816 - ((3970 - 2677) + 519)]]) or (907 > 3152)) then
							v72 = v72 + (1 - 0);
						else
							v72 = v80[7 - 4];
						end
					elseif (v81 <= 28) then
						if (v81 <= 26) then
							v78[v80[3 - 1]] = v64[v80[12 - 9]];
						elseif ((v81 > 27) or (1389 > 3925)) then
							local v394 = (1212 - (1090 + 122)) - 0;
							local v395;
							local v396;
							while true do
								if (((4169 >= 3081) and ((0 + 0) == v394)) or (2505 > 4470)) then
									v395 = v80[1 + 1];
									v396 = v78[v80[6 - 3]];
									v394 = 1 + 0 + 0;
								end
								if ((349 <= 894) and (v394 == (1 + 0))) then
									v78[v395 + 1] = v396;
									v78[v395] = v396[v80[3 + 1]];
									break;
								end
							end
						else
							local v397;
							v78[v80[1098 - (709 + (1299 - 912))]] = v80[1861 - (461 + 212 + 1185)];
							v72 = v72 + (2 - 1);
							v80 = v68[v72];
							v397 = v80[6 - 4];
							v78[v397] = v78[v397](v13(v78, v397 + 1, v80[3]));
							v72 = v72 + 1;
							v80 = v68[v72];
							v78[v80[2 - 0]][v80[(1121 - (628 + 490)) + 0 + 0]] = v78[v80[3 + 1]];
							v72 = v72 + (1 - 0);
							v80 = v68[v72];
							v78[v80[1 + 1]] = v64[v80[5 - 2]];
							v72 = v72 + (1 - 0);
							v80 = v68[v72];
							v78[v80[2]] = v78[v80[1883 - (446 + 1434)]][v80[1287 - (1040 + 243)]];
							v72 = v72 + (2 - 1);
							v80 = v68[v72];
							v78[v80[1849 - (559 + 1288)]] = v80[3];
							v72 = v72 + ((4782 - 2850) - (609 + 1322));
							v80 = v68[v72];
							v78[v80[456 - (13 + 441)]] = v80[3];
							v72 = v72 + (3 - 2);
							v80 = v68[v72];
							v78[v80[2]] = v80[3];
							v72 = v72 + (2 - 1);
							v80 = v68[v72];
							v397 = v80[9 - 7];
							v78[v397] = v78[v397](v13(v78, v397 + 1 + 0, v80[10 - 7]));
							v72 = v72 + (4 - 3) + 0;
							v80 = v68[v72];
							v78[v80[1 + 1]][v80[8 - 5]] = v78[v80[3 + (775 - (431 + 343))]];
						end
					elseif ((v81 <= (52 - 23)) or (3711 > 4062)) then
						v72 = v80[3];
					elseif ((420 == 420) and (v81 == (20 + (20 - 10)))) then
						local v415 = 0;
						local v416;
						local v417;
						while true do
							if ((v415 == (3 + 1)) or (33 >= 3494)) then
								v78[v80[2 + 0]][v80[3]] = v78[v80[4]];
								v72 = v72 + 1;
								v80 = v68[v72];
								v415 = 5 + 0;
							end
							if ((v415 == (3 + 0)) or (1267 == 4744)) then
								v78[v417] = v78[v417](v78[v417 + ((1255 - 821) - (153 + 280))]);
								v72 = v72 + (2 - 1);
								v80 = v68[v72];
								v415 = 4 + 0;
							end
							if ((2428 < 3778) and (731 <= 2978) and (v415 == 8)) then
								v78[v417] = v416[v80[2 + 2 + 0]];
								break;
							end
							if ((3 + 2) == v415) then
								v78[v80[2 + 0]][v80[3 + 0]] = v78[v80[4]];
								v72 = v72 + (1 - 0);
								v80 = v68[v72];
								v415 = 4 + 2;
							end
							if (v415 == (667 - (12 + 77 + 578))) then
								v416 = nil;
								v417 = nil;
								v78[v80[2 + 0]] = v78[v80[5 - 2]][v80[1053 - (572 + 477)]];
								v415 = 1 + 0;
							end
							if (v415 == (2 + 0)) then
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v417 = v80[2];
								v415 = 3;
							end
							if (((1787 - (556 + 1139)) - (84 + 2)) == v415) then
								v78[v80[2 - 0]] = v78[v80[3 + 0]][v80[846 - (497 + 345)]];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v415 = 2 + 5;
							end
							if (v415 == 7) then
								v417 = v80[1335 - (605 + 728)];
								v416 = v78[v80[3 + 0]];
								v78[v417 + (1 - 0)] = v416;
								v415 = 1 + 7;
							end
							if ((v415 == ((18 - (6 + 9)) - 2)) or (892 > 3892)) then
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[(1 + 4) - 3]] = v80[3];
								v415 = 2 + 0;
							end
						end
					else
						v78[v80[491 - (235 + 222 + 32)]] = v78[v80[2 + 1]];
					end
				elseif (v81 <= (1438 - (832 + 570))) then
					if ((v81 <= (32 + 1)) or (2946 <= 1596)) then
						if (v81 > (9 + 23)) then
							v78[v80[6 - 4]]();
						else
							local v224 = v80[1 + 1];
							v78[v224] = v78[v224](v13(v78, v224 + 1, v80[799 - (588 + 208)]));
						end
					elseif ((4433 > 3127) and (v81 <= (203 - (28 + 141)))) then
						local v226 = 0 - 0;
						local v227;
						while true do
							if ((v226 == (1805 - (884 + 916))) or (4466 == 900)) then
								v80 = v68[v72];
								v227 = v80[3 - (1 + 0)];
								v78[v227] = v78[v227](v13(v78, v227 + 1 + 0, v80[656 - (232 + 421)]));
								v72 = v72 + 1;
								v80 = v68[v72];
								v226 = 1895 - (1569 + 320);
							end
							if ((v226 == 0) or (2084 >= 2888)) then
								v227 = nil;
								v227 = v80[2];
								v78[v227] = v78[v227](v13(v78, v227 + 1 + 0, v80[(1 - 0) + 2]));
								v72 = v72 + (3 - 2);
								v80 = v68[v72];
								v226 = 606 - (224 + 92 + 289);
							end
							if ((4300 >= 2733) and (v226 == 3)) then
								v72 = v72 + (2 - 1);
								v80 = v68[v72];
								v78[v80[1319 - (486 + 831)]] = v80[1 + 2];
								v72 = v72 + (2 - 1);
								v80 = v68[v72];
								v226 = 1457 - ((2344 - 1678) + 787);
							end
							if ((4829 == 4829) and (v226 == (1 + 3))) then
								v78[v80[427 - (360 + 65)]] = v80[3];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[256 - (79 + 175)]] = v80[3];
								v72 = v72 + (1 - 0);
								v226 = 4 + 1;
							end
							if ((1683 <= 4726) and (479 < 1863) and (v226 == (17 - 11))) then
								v78[v80[3 - 1]][v80[902 - (503 + 396)]] = v78[v80[4]];
								break;
							end
							if (v226 == (183 - (92 + 89))) then
								v80 = v68[v72];
								v78[v80[3 - (3 - 2)]] = v78[v80[2 + 1]][v80[3 + (1264 - (668 + 595))]];
								v72 = v72 + (3 - 2);
								v80 = v68[v72];
								v78[v80[2]] = v80[1 + 2 + 0];
								v226 = 6 - 3;
							end
							if ((v226 == (1 + 0)) or (2428 >= 4038)) then
								v78[v80[1 + 0 + 1]][v80[8 - 5]] = v78[v80[4]];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v78[v80[2 - 0]] = v64[v80[(3400 - 2153) - (485 + 759)]];
								v72 = v72 + 1;
								v226 = 2;
							end
						end
					elseif (v81 > (80 - 45)) then
						v78[v80[1191 - (442 + (1037 - (23 + 267)))]] = {};
					elseif (v78[v80[2]] == v80[1139 - (832 + 303)]) then
						v72 = v72 + 1;
					else
						v72 = v80[949 - (88 + 858)];
					end
				elseif ((v81 <= (12 + 27)) or (2878 > 2897)) then
					if (v81 <= (31 + 6)) then
						local v228 = 0;
						local v229;
						while true do
							if (v228 == ((1945 - (1129 + 815)) + 2)) then
								v72 = v72 + 1;
								v80 = v68[v72];
								v78[v80[2]] = v63[v80[792 - ((1153 - (371 + 16)) + 23)]];
								v72 = v72 + (4 - 3);
								v228 = 5 - 1;
							end
							if (v228 == (2 - 1)) then
								v78[v80[6 - 4]] = v78[v80[1076 - ((2786 - (1326 + 424)) + 37)]][v80[4]];
								v72 = v72 + 1 + 0;
								v80 = v68[v72];
								v229 = v80[3 - 1];
								v228 = 3 - 1;
							end
							if (v228 == (0 + 0)) then
								v229 = nil;
								v78[v80[1482 - (641 + 839)]] = v63[v80[916 - (910 + 3)]];
								v72 = v72 + (2 - 1);
								v80 = v68[v72];
								v228 = 1685 - (1466 + 218);
							end
							if (v228 == (3 + 2)) then
								v78[v80[(4202 - 3052) - (556 + 592)]] = v80[2 + 1];
								break;
							end
							if ((4835 >= 3669) and (v228 == (812 - (329 + 479)))) then
								v80 = v68[v72];
								v78[v80[856 - (174 + 680)]] = v78[v80[3]][v80[4]];
								v72 = v72 + 1;
								v80 = v68[v72];
								v228 = 17 - 12;
							end
							if (v228 == (3 - (119 - (88 + 30)))) then
								v78[v229] = v78[v229](v78[v229 + 1 + 0]);
								v72 = v72 + (740 - (396 + (1114 - (720 + 51))));
								v80 = v68[v72];
								v78[v80[1 + 1]]();
								v228 = 3;
							end
						end
					elseif (v81 == (1515 - (29 + 1448))) then
						local v421 = v80[1391 - (135 + 1254)];
						v78[v421](v78[v421 + (3 - 2)]);
					else
						v78[v80[9 - 7]][v80[2 + 1]] = v80[(3405 - 1874) - (389 + 1138)];
					end
				elseif ((v81 <= (614 - (102 + 472))) or (2469 > 3676)) then
					local v230;
					v78[v80[2 + 0]] = v78[v80[3]][v80[3 + 1]];
					v72 = v72 + 1 + 0;
					v80 = v68[v72];
					v78[v80[2]] = v80[3];
					v72 = v72 + (1546 - (320 + 1225));
					v80 = v68[v72];
					v78[v80[2 - 0]] = v80[3];
					v72 = v72 + 1 + 0;
					v80 = v68[v72];
					v78[v80[(3242 - (421 + 1355)) - (157 + 1307)]] = v80[3];
					v72 = v72 + (1860 - (821 + 1038));
					v80 = v68[v72];
					v230 = v80[2];
					v78[v230] = v78[v230](v13(v78, v230 + 1, v80[7 - 4]));
					v72 = v72 + 1 + (0 - 0);
					v80 = v68[v72];
					v78[v80[3 - 1]][v80[1 + 1 + 1]] = v78[v80[9 - 5]];
					v72 = v72 + (1027 - (834 + 192));
					v80 = v68[v72];
					v78[v80[1 + 1]] = v64[v80[1 + 2]];
					v72 = v72 + (1084 - (286 + 797)) + 0;
					v80 = v68[v72];
					v78[v80[2 - 0]] = v78[v80[3]][v80[(1125 - 817) - (300 + 4)]];
					v72 = v72 + 1 + 0;
					v80 = v68[v72];
					v78[v80[5 - 3]] = v80[365 - (112 + (414 - 164))];
					v72 = v72 + 1;
					v80 = v68[v72];
					v230 = v80[1 + 1];
					v78[v230] = v78[v230](v78[v230 + (2 - 1)]);
				elseif (v81 == (24 + 17)) then
					local v424 = 0 + 0;
					local v425;
					local v426;
					local v427;
					while true do
						if ((2851 > 1859) and (v424 == (1 + 0))) then
							v427 = v80[2 + 1];
							for v603 = 1, v427 do
								v426[v603] = v78[v425 + v603];
							end
							break;
						end
						if ((3848 > 2323) and (v424 == (0 + 0))) then
							v425 = v80[1416 - (1001 + 413)];
							v426 = v78[v425];
							v424 = 1;
						end
					end
				else
					local v428;
					v78[v80[4 - (441 - (397 + 42))]] = v78[v80[885 - (244 + 638)]][v80[4]];
					v72 = v72 + (694 - (627 + 21 + 45));
					v80 = v68[v72];
					v78[v80[2]] = v80[8 - 5];
					v72 = v72 + ((1403 - (24 + 776)) - (512 + 90));
					v80 = v68[v72];
					v78[v80[2]] = v80[1909 - (1665 + 241)];
					v72 = v72 + (718 - (373 + 344));
					v80 = v68[v72];
					v78[v80[1 + 1]] = v80[1 + 2];
					v72 = v72 + (2 - (1 - 0));
					v80 = v68[v72];
					v428 = v80[2 - 0];
					v78[v428] = v78[v428](v13(v78, v428 + 1, v80[1102 - (35 + 1064)]));
					v72 = v72 + 1 + 0;
					v80 = v68[v72];
					v78[v80[4 - 2]][v80[1 + 2]] = v78[v80[4]];
					v72 = v72 + (1237 - (298 + 938));
					v80 = v68[v72];
					v78[v80[1261 - (233 + 1026)]] = v80[3];
				end
				v72 = v72 + (1667 - (636 + 1030));
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!5A3Q00028Q00026Q00F03F03083Q00496E7374616E63652Q033Q006E657703053Q004672616D6503063Q00506172656E7403083Q00506F736974696F6E03053Q005544696D32026Q33D33F03043Q0053697A65026Q00E03F029A5Q99D93F027Q0040026Q00204003093Q004D756C74694C696E652Q01030B3Q00546578745772612Q706564010003043Q0054657874034Q0003083Q005465787453697A65026Q003040026Q00224003103Q004261636B67726F756E64436F6C6F723303063Q00436F6C6F72330232AB77B81D1ABA3F0200C077B81D1ABA3F0200A077B81D1ABA3F030E3Q005549447261674465746563746F7203093Q004472612Q6761626C65026Q000840026Q001440034D012Q003C666F6E7420636F6C6F723D27234Q302Q46273E413C2F666F6E743E3C666F6E7420636F6C6F723D272331412Q302Q46273E6C3C2F666F6E743E3C666F6E7420636F6C6F723D272333342Q302Q46273E703C2F666F6E743E3C666F6E7420636F6C6F723D272334442Q302Q46273E683C2F666F6E743E3C666F6E7420636F6C6F723D272336372Q302Q46273E613C2F666F6E743E203C666F6E7420636F6C6F723D2723383Q302Q46273E453C2F666F6E743E3C666F6E7420636F6C6F723D272339412Q302Q46273E783C2F666F6E743E3C666F6E7420636F6C6F723D272342342Q302Q46273E653C2F666F6E743E3C666F6E7420636F6C6F723D272343462Q302Q46273E633C2F666F6E743E3C666F6E7420636F6C6F723D272345362Q302Q46273E753C2F666F6E743E3C666F6E7420636F6C6F723D27232Q462Q302Q46273E746F723C2F666F6E743E03073Q0054657874426F78029A5Q99B93F026Q00184002CD5QCCEC3F03073Q0066726F6D524742026Q003E40030C3Q00426F72646572436F6C6F7233026Q004940030A3Q0054657874436F6C6F7233026Q006940026Q001C4003073Q00234Q302Q4603073Q002331412Q302Q4603073Q002333342Q302Q4603073Q002334442Q302Q4603073Q002336372Q302Q4603073Q0023383Q302Q4603073Q002339412Q302Q4603073Q002342342Q302Q4603073Q002343462Q302Q4603073Q002345362Q302Q4603073Q00232Q462Q302Q4603093Q00546578744C6162656C026Q001040026Q002640030C3Q00436F726E657252616469757303043Q005544696D0200304Q33D33F03113Q004D6F75736542752Q746F6E31436C69636B03073Q00436F2Q6E65637403103Q00436C69707344657363656E64616E7473030A3Q005465787442752Q746F6E02009A4Q99B93F0200A04Q99B93F026Q002440030A3Q00546578745363616C6564029A5Q99C93F03083Q0052696368546578742Q033Q00E296B6025D514A085655E53F03083Q005549436F726E657203043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C6179657203093Q005363722Q656E477569030C3Q0057616974466F724368696C6403093Q00506C6179657247756903043Q004E616D65030E3Q00416C7068615F4578656375746F7203043Q00466F6E7403043Q00456E756D03043Q00436F6465030E3Q005465787458416C69676E6D656E7403043Q004C656674030E3Q005465787459416C69676E6D656E742Q033Q00546F7003103Q00436C656172546578744F6E466F63757300F23Q0012053Q00014Q0017000100093Q0026233Q001B0001000200041D3Q001B000100121A000A00033Q00200F000A000A000400122Q000B00056Q000A000200024Q0003000A3Q00102Q00030006000200122Q000A00083Q00202Q000A000A000400122Q000B00013Q00122Q000C00013Q00122Q000D00093Q001205000E00014Q0022000A000E000200102Q00030007000A00122Q000A00083Q00202Q000A000A000400122Q000B000B3Q00122Q000C00013Q00122Q000D000C3Q00122Q000E00016Q000A000E000200102Q0003000A000A0012053Q000D3Q000E19000E002200013Q00041D3Q002200010030270007000F00100030270007001100120030270007001300140030270007001500160012053Q00173Q0026233Q00330001000D00041D3Q0033000100121A000A00193Q002028000A000A000400122Q000B001A3Q00122Q000C001B3Q00122Q000D001C6Q000A000D000200102Q00030018000A00122Q000A00033Q00202Q000A000A000400122Q000B001D6Q000A000200022Q001F0004000A3Q0010120004000600030030270003001E00100012053Q001F3Q0026233Q00450001002000041D3Q0045000100302700060013002100122Q000A00033Q00202Q000A000A000400122Q000B00226Q000A000200024Q0007000A3Q00102Q00070006000300122Q000A00083Q00202Q000A000A000400122Q000B00233Q00122Q000C00013Q001205000D00233Q001205000E00014Q0020000A000E000200101200070007000A0012053Q00243Q000E190024006500013Q00041D3Q0065000100121A000A00083Q00200B000A000A000400122Q000B00253Q00122Q000C00013Q00122Q000D00253Q00122Q000E00016Q000A000E000200102Q0007000A000A00122Q000A00193Q00202Q000A000A002600122Q000B00273Q001205000C00273Q00121B000D00276Q000A000D000200102Q00070018000A00122Q000A00193Q00202Q000A000A002600122Q000B00293Q00122Q000C00293Q00122Q000D00296Q000A000D000200102Q00070028000A00121A000A00193Q00202A000A000A002600122Q000B002B3Q00122Q000C002B3Q00122Q000D002B6Q000A000D000200102Q0007002A000A00124Q002C3Q0026233Q00830001001F00041D3Q008300012Q0024000A000B3Q001207000B002D3Q00122Q000C002E3Q00122Q000D002F3Q00122Q000E00303Q00122Q000F00313Q00122Q001000323Q00122Q001100333Q00122Q001200343Q00122Q001300353Q00122Q001400363Q001205001500374Q0029000A000B00012Q001F0005000A3Q00120E000A00033Q00202Q000A000A000400122Q000B00386Q000A000200024Q0006000A3Q00122Q000A00193Q00202Q000A000A000400122Q000B00023Q00122Q000C00023Q00122Q000D00024Q0020000A000D00020010120006002A000A0010120006000600030012053Q00393Q0026233Q00910001003A00041D3Q0091000100121A000A003C3Q00201E000A000A000400122Q000B003D6Q000A0002000200102Q0009003B000A00102Q00090006000800202Q000A0008003E00202Q000A000A003F002Q06000C3Q000100012Q001F3Q00074Q0009000A000C000100041D3Q00F000010026233Q00A30001001700041D3Q00A3000100302700070040001000122Q000A00033Q00202Q000A000A000400122Q000B00416Q000A000200024Q0008000A3Q00102Q00080006000700122Q000A00083Q00202Q000A000A000400122Q000B00423Q00122Q000C00013Q001205000D00433Q001205000E00014Q0020000A000E00020010120008000A000A0012053Q00443Q0026233Q00B70001003900041D3Q00B70001003027000600450010001213000A00083Q00202Q000A000A000400122Q000B00023Q00122Q000C00013Q00122Q000D00233Q00122Q000E00016Q000A000E000200102Q0006000A000A00122Q000A00193Q00202Q000A000A0004001205000B00463Q001208000C00463Q00122Q000D00466Q000A000D000200102Q00060018000A00302Q00060047001000124Q00203Q0026233Q00CF0001004400041D3Q00CF000100121A000A00083Q002004000A000A000400122Q000B00253Q00122Q000C00013Q00122Q000D00013Q00122Q000E00016Q000A000E000200102Q00080007000A00302Q00080013004800122Q000A00193Q00202Q000A000A0004001205000B00013Q001216000C00493Q00122Q000D00016Q000A000D000200102Q00080018000A00122Q000A00033Q00202Q000A000A000400122Q000B004A6Q000A000200024Q0009000A3Q00124Q003A3Q0026233Q00DF0001000100041D3Q00DF000100121A000A004B3Q002003000A000A004C00202Q0001000A004D00122Q000A00033Q00202Q000A000A000400122Q000B004E6Q000A000200024Q0002000A3Q00202Q000A0001004F00122Q000C00506Q000A000C000200101200020006000A0030270002005100520012053Q00023Q0026233Q00020001002C00041D3Q0002000100121A000A00543Q002010000A000A005300202Q000A000A005500102Q00070053000A00122Q000A00543Q00202Q000A000A005600202Q000A000A005700102Q00070056000A00122Q000A00543Q00202Q000A000A005800202Q000A000A005900101200070058000A0030270007005A00120012053Q000E3Q00041D3Q000200012Q00158Q00113Q00013Q00013Q00093Q0003043Q0054657874034Q00028Q00027Q0040026Q00F03F030E3Q00536372697074204C61756368656403043Q0077616974026Q66E63F030A3Q006C6F6164737472696E6700434Q000A7Q00200D5Q00010026013Q00420001000200041D3Q004200010012053Q00034Q0017000100013Q0026233Q000B0001000400041D3Q000B00012Q000A00025Q00101200020001000100041D3Q004200010026233Q00210001000500041D3Q00210001001205000200034Q0017000300033Q000E190003000F0001000200041D3Q000F0001001205000300033Q0026230003001A0001000300041D3Q001A00012Q000A00045Q00301400040001000600122Q000400073Q00122Q000500086Q00040002000100122Q000300053Q002623000300120001000500041D3Q001200010012053Q00043Q00041D3Q0021000100041D3Q0012000100041D3Q0021000100041D3Q000F00010026233Q00060001000300041D3Q00060001001205000200034Q0017000300033Q002623000200250001000300041D3Q00250001001205000300033Q0026230003003A0001000300041D3Q003A0001001205000400033Q002623000400350001000300041D3Q0035000100121A000500094Q002500065Q00202Q0006000600014Q0005000200024Q0005000100014Q00055Q00202Q00010005000100122Q000400053Q0026230004002B0001000500041D3Q002B0001001205000300053Q00041D3Q003A000100041D3Q002B0001002623000300280001000500041D3Q002800010012053Q00053Q00041D3Q0006000100041D3Q0028000100041D3Q0006000100041D3Q0025000100041D3Q000600012Q00113Q00017Q00", v9(), ...);
