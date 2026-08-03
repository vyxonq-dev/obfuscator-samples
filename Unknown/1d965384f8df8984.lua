bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	local FlatIdent_95CAC = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_95CAC == 2) then
			r = 0;
			p = 1;
			FlatIdent_95CAC = 3;
		end
		if (FlatIdent_95CAC == 0) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_95CAC = 1;
		end
		if (FlatIdent_95CAC == 3) then
			for i = 1, N do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 2) then
					r = r + p;
				end
				p = 2 * p;
			end
			return r;
		end
		if (FlatIdent_95CAC == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % P, y % P;
			FlatIdent_95CAC = 2;
		end
	end
end;
bit32.bor = function(x, y)
	local FlatIdent_2953F = 0;
	local r;
	local p;
	while true do
		if (FlatIdent_2953F == 2) then
			r = 0;
			p = 1;
			FlatIdent_2953F = 3;
		end
		if (FlatIdent_2953F == 1) then
			if (y == 4294967295) then
				return 4294967295;
			end
			x, y = x % P, y % P;
			FlatIdent_2953F = 2;
		end
		if (FlatIdent_2953F == 3) then
			for i = 1, N do
				local FlatIdent_475BC = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_475BC == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_475BC = 1;
					end
					if (FlatIdent_475BC == 1) then
						if ((a + b) >= 1) then
							r = r + p;
						end
						p = 2 * p;
						break;
					end
				end
			end
			return r;
		end
		if (FlatIdent_2953F == 0) then
			if (y == 255) then
				return (x - (x % 256)) + 255;
			end
			if (y == 65535) then
				return (x - (x % 65536)) + 65535;
			end
			FlatIdent_2953F = 1;
		end
	end
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local FlatIdent_43862 = 0;
		local a;
		local b;
		while true do
			if (0 == FlatIdent_43862) then
				a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				FlatIdent_43862 = 1;
			end
			if (FlatIdent_43862 == 1) then
				if ((a + b) == 1) then
					r = r + p;
				end
				p = 2 * p;
				break;
			end
		end
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	local FlatIdent_781F8 = 0;
	while true do
		if (FlatIdent_781F8 == 0) then
			if (math.abs(s_amount) >= N) then
				return 0;
			end
			x = x % P;
			FlatIdent_781F8 = 1;
		end
		if (1 == FlatIdent_781F8) then
			if (s_amount < 0) then
				return math.floor(x * (2 ^ s_amount));
			else
				return (x * (2 ^ s_amount)) % P;
			end
			break;
		end
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local TABLE_TableIndirection = {};
bit32 = {};
TABLE_TableIndirection["N%0"] = 32;
TABLE_TableIndirection["P%0"] = 2 ^ TABLE_TableIndirection["N%0"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["P%0"];
	return (TABLE_TableIndirection["P%0"] - 1) - x;
end;
bit32.band = function(x, y)
	local FlatIdent_104D4 = 0;
	while true do
		if (FlatIdent_104D4 == 2) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			FlatIdent_104D4 = 3;
		end
		if (FlatIdent_104D4 == 0) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_104D4 = 1;
		end
		if (3 == FlatIdent_104D4) then
			for i = 1, TABLE_TableIndirection["N%0"] do
				local FlatIdent_77C29 = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_77C29 == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_77C29 = 1;
					end
					if (FlatIdent_77C29 == 1) then
						if ((a + b) == 2) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
				end
			end
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_104D4 == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
			FlatIdent_104D4 = 2;
		end
	end
end;
bit32.bor = function(x, y)
	local FlatIdent_2AC68 = 0;
	while true do
		if (FlatIdent_2AC68 == 3) then
			for i = 1, TABLE_TableIndirection["N%0"] do
				local FlatIdent_E0D0 = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_E0D0 == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_E0D0 = 1;
					end
					if (FlatIdent_E0D0 == 1) then
						if ((a + b) >= 1) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
				end
			end
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_2AC68 == 2) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			FlatIdent_2AC68 = 3;
		end
		if (FlatIdent_2AC68 == 0) then
			if (y == 255) then
				return (x - (x % 256)) + 255;
			end
			if (y == 65535) then
				return (x - (x % 65536)) + 65535;
			end
			FlatIdent_2AC68 = 1;
		end
		if (FlatIdent_2AC68 == 1) then
			if (y == 4294967295) then
				return 4294967295;
			end
			x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
			FlatIdent_2AC68 = 2;
		end
	end
end;
bit32.bxor = function(x, y)
	local FlatIdent_3EEE1 = 0;
	while true do
		if (FlatIdent_3EEE1 == 1) then
			TABLE_TableIndirection["p%0"] = 1;
			for i = 1, TABLE_TableIndirection["N%0"] do
				local FlatIdent_6B983 = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_6B983 == 1) then
						if ((a + b) == 1) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
					if (FlatIdent_6B983 == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_6B983 = 1;
					end
				end
			end
			FlatIdent_3EEE1 = 2;
		end
		if (FlatIdent_3EEE1 == 2) then
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_3EEE1 == 0) then
			x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
			TABLE_TableIndirection["r%0"] = 0;
			FlatIdent_3EEE1 = 1;
		end
	end
end;
bit32.lshift = function(x, s_amount)
	local FlatIdent_287B5 = 0;
	while true do
		if (FlatIdent_287B5 == 0) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%0"];
			FlatIdent_287B5 = 1;
		end
		if (FlatIdent_287B5 == 1) then
			if (s_amount < 0) then
				return math.floor(x * (2 ^ s_amount));
			else
				return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%0"];
			end
			break;
		end
	end
end;
bit32.rshift = function(x, s_amount)
	local FlatIdent_D79D = 0;
	while true do
		if (0 == FlatIdent_D79D) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%0"];
			FlatIdent_D79D = 1;
		end
		if (FlatIdent_D79D == 1) then
			if (s_amount > 0) then
				return math.floor(x * (2 ^ -s_amount));
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
			end
			break;
		end
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		local FlatIdent_28F1 = 0;
		while true do
			if (0 == FlatIdent_28F1) then
				TABLE_TableIndirection["add%0"] = 0;
				if (x >= (TABLE_TableIndirection["P%0"] / 2)) then
					TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%0"] - (2 ^ (TABLE_TableIndirection["N%0"] - s_amount));
				end
				FlatIdent_28F1 = 1;
			end
			if (1 == FlatIdent_28F1) then
				return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
			end
		end
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32 = {};
TABLE_TableIndirection["N%1"] = 32;
TABLE_TableIndirection["P%1"] = 2 ^ TABLE_TableIndirection["N%1"];
bit32.bnot = function(x)
	local FlatIdent_5477B = 0;
	while true do
		if (FlatIdent_5477B == 0) then
			x = x % TABLE_TableIndirection["P%1"];
			return (TABLE_TableIndirection["P%1"] - 1) - x;
		end
	end
end;
bit32.band = function(x, y)
	local FlatIdent_8435E = 0;
	while true do
		if (FlatIdent_8435E == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % TABLE_TableIndirection["P%1"], y % TABLE_TableIndirection["P%1"];
			FlatIdent_8435E = 2;
		end
		if (FlatIdent_8435E == 2) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			FlatIdent_8435E = 3;
		end
		if (FlatIdent_8435E == 3) then
			for i = 1, TABLE_TableIndirection["N%1"] do
				local FlatIdent_8BC55 = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_8BC55 == 1) then
						if ((a + b) == 2) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
					if (FlatIdent_8BC55 == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_8BC55 = 1;
					end
				end
			end
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_8435E == 0) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_8435E = 1;
		end
	end
end;
bit32.bor = function(x, y)
	local FlatIdent_8B336 = 0;
	while true do
		if (FlatIdent_8B336 == 1) then
			if (y == 4294967295) then
				return 4294967295;
			end
			x, y = x % TABLE_TableIndirection["P%1"], y % TABLE_TableIndirection["P%1"];
			FlatIdent_8B336 = 2;
		end
		if (FlatIdent_8B336 == 3) then
			for i = 1, TABLE_TableIndirection["N%1"] do
				local FlatIdent_7DFA5 = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_7DFA5 == 1) then
						if ((a + b) >= 1) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
					if (FlatIdent_7DFA5 == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_7DFA5 = 1;
					end
				end
			end
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_8B336 == 2) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			FlatIdent_8B336 = 3;
		end
		if (FlatIdent_8B336 == 0) then
			if (y == 255) then
				return (x - (x % 256)) + 255;
			end
			if (y == 65535) then
				return (x - (x % 65536)) + 65535;
			end
			FlatIdent_8B336 = 1;
		end
	end
end;
bit32.bxor = function(x, y)
	local FlatIdent_25A9F = 0;
	while true do
		if (FlatIdent_25A9F == 1) then
			TABLE_TableIndirection["p%0"] = 1;
			for i = 1, TABLE_TableIndirection["N%1"] do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 1) then
					TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
				end
				TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
			end
			FlatIdent_25A9F = 2;
		end
		if (FlatIdent_25A9F == 0) then
			x, y = x % TABLE_TableIndirection["P%1"], y % TABLE_TableIndirection["P%1"];
			TABLE_TableIndirection["r%0"] = 0;
			FlatIdent_25A9F = 1;
		end
		if (FlatIdent_25A9F == 2) then
			return TABLE_TableIndirection["r%0"];
		end
	end
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%1"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%1"];
	end
end;
bit32.rshift = function(x, s_amount)
	local FlatIdent_20FE3 = 0;
	while true do
		if (FlatIdent_20FE3 == 1) then
			if (s_amount > 0) then
				return math.floor(x * (2 ^ -s_amount));
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%1"];
			end
			break;
		end
		if (FlatIdent_20FE3 == 0) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%1"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%1"];
			FlatIdent_20FE3 = 1;
		end
	end
end;
bit32.arshift = function(x, s_amount)
	local FlatIdent_8ABD6 = 0;
	while true do
		if (FlatIdent_8ABD6 == 0) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%1"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%1"];
			FlatIdent_8ABD6 = 1;
		end
		if (FlatIdent_8ABD6 == 1) then
			if (s_amount > 0) then
				TABLE_TableIndirection["add%0"] = 0;
				if (x >= (TABLE_TableIndirection["P%1"] / 2)) then
					TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%1"] - (2 ^ (TABLE_TableIndirection["N%1"] - s_amount));
				end
				return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%1"];
			end
			break;
		end
	end
end;
bit32 = {};
TABLE_TableIndirection["N%2"] = 32;
TABLE_TableIndirection["P%2"] = 2 ^ TABLE_TableIndirection["N%2"];
bit32.bnot = function(x)
	local FlatIdent_2E34E = 0;
	while true do
		if (FlatIdent_2E34E == 0) then
			x = x % TABLE_TableIndirection["P%2"];
			return (TABLE_TableIndirection["P%2"] - 1) - x;
		end
	end
end;
bit32.band = function(x, y)
	local FlatIdent_2A9F7 = 0;
	while true do
		if (FlatIdent_2A9F7 == 0) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_2A9F7 = 1;
		end
		if (FlatIdent_2A9F7 == 3) then
			for i = 1, TABLE_TableIndirection["N%2"] do
				local FlatIdent_28855 = 0;
				local a;
				local b;
				while true do
					if (FlatIdent_28855 == 1) then
						if ((a + b) == 2) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
					if (FlatIdent_28855 == 0) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_28855 = 1;
					end
				end
			end
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_2A9F7 == 2) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			FlatIdent_2A9F7 = 3;
		end
		if (FlatIdent_2A9F7 == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % TABLE_TableIndirection["P%2"], y % TABLE_TableIndirection["P%2"];
			FlatIdent_2A9F7 = 2;
		end
	end
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["P%2"], y % TABLE_TableIndirection["P%2"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%2"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bxor = function(x, y)
	local FlatIdent_276C2 = 0;
	while true do
		if (FlatIdent_276C2 == 1) then
			TABLE_TableIndirection["p%0"] = 1;
			for i = 1, TABLE_TableIndirection["N%2"] do
				local FlatIdent_8B272 = 0;
				local a;
				local b;
				while true do
					if (0 == FlatIdent_8B272) then
						a, b = x % 2, y % 2;
						x, y = math.floor(x / 2), math.floor(y / 2);
						FlatIdent_8B272 = 1;
					end
					if (FlatIdent_8B272 == 1) then
						if ((a + b) == 1) then
							TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
						end
						TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
						break;
					end
				end
			end
			FlatIdent_276C2 = 2;
		end
		if (FlatIdent_276C2 == 0) then
			x, y = x % TABLE_TableIndirection["P%2"], y % TABLE_TableIndirection["P%2"];
			TABLE_TableIndirection["r%0"] = 0;
			FlatIdent_276C2 = 1;
		end
		if (FlatIdent_276C2 == 2) then
			return TABLE_TableIndirection["r%0"];
		end
	end
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%2"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%2"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%2"];
	end
end;
bit32.rshift = function(x, s_amount)
	local FlatIdent_7873D = 0;
	while true do
		if (1 == FlatIdent_7873D) then
			if (s_amount > 0) then
				return math.floor(x * (2 ^ -s_amount));
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%2"];
			end
			break;
		end
		if (FlatIdent_7873D == 0) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%2"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%2"];
			FlatIdent_7873D = 1;
		end
	end
end;
bit32.arshift = function(x, s_amount)
	local FlatIdent_92F66 = 0;
	while true do
		if (FlatIdent_92F66 == 1) then
			if (s_amount > 0) then
				TABLE_TableIndirection["add%0"] = 0;
				if (x >= (TABLE_TableIndirection["P%2"] / 2)) then
					TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%2"] - (2 ^ (TABLE_TableIndirection["N%2"] - s_amount));
				end
				return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%2"];
			end
			break;
		end
		if (FlatIdent_92F66 == 0) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%2"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%2"];
			FlatIdent_92F66 = 1;
		end
	end
end;
bit32 = {};
TABLE_TableIndirection["N%3"] = 32;
TABLE_TableIndirection["P%3"] = 2 ^ TABLE_TableIndirection["N%3"];
bit32.bnot = function(x)
	local FlatIdent_94AF7 = 0;
	while true do
		if (FlatIdent_94AF7 == 0) then
			x = x % TABLE_TableIndirection["P%3"];
			return (TABLE_TableIndirection["P%3"] - 1) - x;
		end
	end
end;
bit32.band = function(x, y)
	local FlatIdent_7126B = 0;
	while true do
		if (FlatIdent_7126B == 3) then
			for i = 1, TABLE_TableIndirection["N%3"] do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 2) then
					TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
				end
				TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
			end
			return TABLE_TableIndirection["r%0"];
		end
		if (FlatIdent_7126B == 1) then
			if (y == 4294967295) then
				return x % 4294967296;
			end
			x, y = x % TABLE_TableIndirection["P%3"], y % TABLE_TableIndirection["P%3"];
			FlatIdent_7126B = 2;
		end
		if (0 == FlatIdent_7126B) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			FlatIdent_7126B = 1;
		end
		if (FlatIdent_7126B == 2) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			FlatIdent_7126B = 3;
		end
	end
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["P%3"], y % TABLE_TableIndirection["P%3"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%3"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["P%3"], y % TABLE_TableIndirection["P%3"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%3"] do
		local FlatIdent_829F9 = 0;
		local a;
		local b;
		while true do
			if (FlatIdent_829F9 == 0) then
				a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				FlatIdent_829F9 = 1;
			end
			if (1 == FlatIdent_829F9) then
				if ((a + b) == 1) then
					TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
				end
				TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
				break;
			end
		end
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.lshift = function(x, s_amount)
	local FlatIdent_3ACCC = 0;
	while true do
		if (FlatIdent_3ACCC == 1) then
			if (s_amount < 0) then
				return math.floor(x * (2 ^ s_amount));
			else
				return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%3"];
			end
			break;
		end
		if (FlatIdent_3ACCC == 0) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%3"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%3"];
			FlatIdent_3ACCC = 1;
		end
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%3"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%3"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%3"];
	end
end;
bit32.arshift = function(x, s_amount)
	local FlatIdent_835BC = 0;
	while true do
		if (FlatIdent_835BC == 1) then
			if (s_amount > 0) then
				local FlatIdent_67F21 = 0;
				while true do
					if (FlatIdent_67F21 == 0) then
						TABLE_TableIndirection["add%0"] = 0;
						if (x >= (TABLE_TableIndirection["P%3"] / 2)) then
							TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%3"] - (2 ^ (TABLE_TableIndirection["N%3"] - s_amount));
						end
						FlatIdent_67F21 = 1;
					end
					if (FlatIdent_67F21 == 1) then
						return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
					end
				end
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%3"];
			end
			break;
		end
		if (0 == FlatIdent_835BC) then
			if (math.abs(s_amount) >= TABLE_TableIndirection["N%3"]) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%3"];
			FlatIdent_835BC = 1;
		end
	end
end;
TABLE_TableIndirection["TABLE_TableIndirection%0"] = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"] = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"] = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"] = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringchar%0"] = string.char;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringbyte%0"] = string.byte;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringsub%0"] = string.sub;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_XOR%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_bitlib%0"].bxor;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_tableconcat%0"] = table.concat;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_tableinsert%0"] = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_tableinsert%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["result%0"], TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringchar%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_XOR%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringbyte%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, i + 1)), TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringbyte%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_tableconcat%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["result%0"]);
end
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_bitlib%1"] = bit32 or bit;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_XOR%1"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_bitlib%1"][LUAOBFUSACTOR_DECRYPT_STR_0("\211\219\212\55", "\126\177\163\187\69\134\219\167")];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_bitlib%1"][LUAOBFUSACTOR_DECRYPT_STR_0("\33\194\56", "\156\67\173\74\165")];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_bitlib%1"][LUAOBFUSACTOR_DECRYPT_STR_0("\54\182\71\18", "\38\84\215\41\118\220\70")];
while true do
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["args%0"] = {[((((143 - 97) - 31) - (28 - ((160 - 104) - 38))) - ((15 - 7) - (((65 - 31) - 22) - 7))) - (((7 - 4) - 1) - ((((2216 - (555 + 64)) - (1908 - (857 + 74))) - (((1742 - (367 + 201)) - (555 + 64)) + 64)) - (931 - ((1784 - (214 + 713)) + 74))))]=LUAOBFUSACTOR_DECRYPT_STR_0("\117\24\38\7\236\89\23\44", "\158\48\118\66\114"),[((2 + 5) - 4) - 1]=CFrame.new((1671.5 - 1022) - (((262 + 1398) - (((2000 - (282 + 595)) - ((2004 - (1523 + 114)) + 181 + 20)) + 64)) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((2117 - 631) - ((1788 - (857 + 74)) + (1139 - (68 + 997))), ((2470 - (226 + 1044)) - (((5634 - 4340) - ((331 - (32 + 85)) + 713)) + 51 + 148 + 2)) - (((46 + 158 + (2047 - (892 + 65))) - ((510 - 296) + (1590 - ((520 - 238) + (1091 - 496))))) + ((2188 - (87 + 263)) - (1523 + 114)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((551 - (67 + 113)) + 815 + 296) - (214 + 113 + 600), (2310 - 1369) - (187 + 67 + (111 - 83) + ((1799 - (802 + 150)) - (678 - 426)))))), (((1305.13800001 - (68 + (1807 - 810))) + (1985 - (226 + 1044))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](2439 - (((4827 + 1804) - 5108) + (1111 - (915 + 82))), (252 - ((90 - 58) + 85)) + 15) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](786 + 10 + 6, (279 - 66) - ((1201 - (1069 + 118)) + (110 - 61))))) - ((1889 - (892 + (142 - 77))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((2862 - 1662) - (12 + 56 + ((3272 - 1430) - (839 + 6)))) + ((2115 - (368 + 423)) - 602), ((4088 - 2787) - ((105 - (10 + 8)) + 263)) - ((((6662 - 4930) - ((509 - (416 + 26)) + (360 - 247))) - (226 + 449 + 595)) + (((3361 - 1461) + (1128 - (145 + 293))) - (4898 - (3333 - (44 + 386)))))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((1835 + 659) - (((7539 - (998 + 488)) - 4530) + (((376 + 807) - (657 + 145 + (922 - (201 + 571)))) - (32 + (1223 - (116 + 1022))))), (274 - 208) + ((2 + 0) - 1) + (25 - 18)))), -((((738.5 - 530) - (952 - (814 + 45))) - ((39 - 23) + 3 + 38 + 6 + 9)) - (1023 - (915 + (967 - (261 + 624))))), ((2862 - 1251) - (2122 - (1020 + 60))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](523 - (91 + (1488 - (630 + 793))), (1664 - 398) - ((230 - 162) + (((14871 - 11730) - (422 + 647 + (406 - 288))) - ((2023 - (2878 - (760 + 987))) + ((2055 - (1789 + 124)) - 77))))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((1445 - (745 + 21)) + 3225) - ((1386 + 2641) - 1760)) - (226 + (2872 - 1828)), 200 + (3 - 2))), (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](1242 - (4 + 364 + 423), ((1060 + 290) - ((3000 - (87 + 968)) - (5836 - 4510))) - (((953 + 97) - (10 + (17 - 9))) - ((3216 - (447 + 966)) - 1334))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((1360 - (416 + 26)) - ((238 - 151) + 263)) - ((212 - ((213 - (1963 - (1703 + 114))) + (814 - (376 + 325)))) + (59 - 22) + (147 - 99)), ((61 + 152) - 92) + 44 + ((15 - 8) - (442 - (145 + 293))))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((536 - (9 + 5)) - (44 + 386)) + (408 - (85 + 291)) + 431, (4057 - (4301 - (243 + 1022))) - (((9048 - 6670) - (998 + 403 + 85)) + 65)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((723 + 1552) - ((1982 - (1123 + 57)) + 123 + 22 + 5)) - (((3093 - (163 + 91)) - (201 + (2501 - (1869 + 61)))) - (363 + 936)), (211 - (1232 - ((408 - 292) + 1022))) - (39 + (58 - 44)))), (((4536 - (915 + (125 - 43))) - ((625 + 3936) - ((2379 - 647) + 1218))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((737 + 496 + 32) - (((416 - (1776 - (1329 + 145))) - 27) + ((2421 - (140 + 831)) - ((2919 - (1409 + 441)) + ((1136 - (15 + 703)) - (139 + 161))))), (1121 - (814 + 45)) - (((589 - (262 + 176)) - ((1927 - (345 + 1376)) - 122)) + ((935 - (198 + 490)) - (8 + 126)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](238 + (1912 - 1479) + 43 + ((2604 - 1518) - (261 + 624)), ((630 - 275) - (1361 - (696 + 510))) - 118))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((5047 - 2640) + (1281 - (1091 + 171))) - (((3025 - (165 + 855 + 60)) - ((1158 - 790) + ((6121 - 4275) - ((1004 - (123 + 251)) + 793)))) + ((4418 - (15473 - 12359)) - ((4907 - (208 + 490)) - 3320))), (25 + 269) - (39 + 48 + 133)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](2426 - (((3375 - (660 + 176)) - (10 + ((4 + 23) - (221 - (14 + 188))))) - (((3759 - (534 + 141)) - (4029 - (306 + 454 + 874 + 113))) + (592 - (416 + ((1865 + 74) - (1789 + (260 - 136))))))), ((1002 - 370) - ((3366 - 2166) - (745 + 12 + 9))) - (79 + 45))), (((751 - (115 + 281)) + 675) - 462) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((((2591 - 1649) + (596 - 444) + (4 - 2) + 198) - ((1211 - (596 + 123 + 196 + ((347 - 203) - 62))) + (2614 - 1901))) + (144 - (531 - (((2067 - (550 + 317)) - ((125 - 38) + 968)) + 293))), 88 + ((381 - 109) - (586 - 376))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((((2219 - (134 + 151)) + 197) - (44 + (872 - 486))) - (1893 - (998 + 488))) - ((((1859 - ((2112 - (970 + 695)) + (1843 - 877))) + 955) - (1069 + ((2312 - (582 + 1408)) - (707 - 503)))) + (896 - 183))) + (((357 - 262) + (1837 - ((3527 - (1195 + 629)) + (150 - 36)))) - (765 - (376 + 325))), 391 - (187 + 54))), (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](918 - (201 + 571), 1710 - (1520 - (1372 - (162 + 618)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](19 + 7 + ((3870 - (1740 + 872)) - (34 + (174 - 92) + 1022)), 1389 - (1336 - 729))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((1165 - ((1510 - 611) - (9 + 1 + 4))) - (39 + 27), ((7440 - (1373 + 263)) - 4214) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((1656 - (451 + 549)) - (27 + 58 + 291)) + (((1979 - 707) - ((408 - 165) + 1022)) - 5), (2770 - (746 + 638)) - (((527 + 873) - (1566 - 534)) + (764 - (218 + 123)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((731 + (1736 - (1535 + 46))) - ((2643 - (1116 + 7 + 57)) - (663 + 22 + 129 + (299 - (163 + (651 - (306 + 254)))))), (38 + 575) - (((46 - 22) - (1944 - (1869 + 61))) + 1 + (1469 - (899 + 568)) + 5)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((348 - (164 + 85)) + (277 - (232 - 136))) - (951 - ((864 - (268 + 335)) + 624)), ((837 + 5279) - 4526) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](386 - (394 - (60 + 230)), (((2303 - (426 + 146)) + 14 + 97) - ((3735 - (282 + 1174)) - (1329 + (956 - (569 + 242))))) - (((2467 - (140 + (2393 - 1562))) - (59 + 961 + (1084 - (706 + 318)))) + (1876 - ((2660 - (721 + 530)) + 441)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](900 - (1336 - ((1286 - (945 + 326)) + (1756 - 1053))), 228 + 28 + 157 + (882 - (271 + 429)))))), TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((2538 - (262 + 162 + 14)) - 913) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](2790 - (345 + (2876 - (1408 + 92))), (2627 - (461 + 625)) - (((2606 - (993 + 295)) - (198 + 26 + 464)) + (1964 - (418 + 753)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((16001 - (4715 + 7664)) - ((632 + 5491) - (1045 + 2525)), (((970 + 2868) - ((1225 - (406 + 123)) + (2279 - (1749 + 20)))) - ((1034 + 3319) - 2277)) - (((2729 - (1249 + 73)) - (390 + 701 + (1316 - (466 + 679)))) + 19 + (233 - 136) + ((1590 - 1034) - 379)))), (0 - (1900 - (106 + 1794))) - (0 + 0)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((3738 - (123 + 251)) - (((955 + 2821) - (8904 - 5888)) + (1685 - (208 + (1326 - 836))))) - ((158 - (4 + 110)) + ((2883 - (57 + 527)) - (1789 + (1438 - (41 + 1386)) + 113)))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((818 + (1120 - (17 + 86))) - ((1581 - (448 + 212 + (392 - 216))) + (60 - 39)), 284 - (122 + 44)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((222 - 93) + (3118 - 2178), ((198 + 45) - (14 + 188)) + 77)), ((98 + 577) - ((1081 - 547) + (206 - (30 + 35)))) - (0 + 0)), 1257 - (1043 + 214), TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((5828 - ((6600 - 4854) + (3808 - (323 + 889)))) - (998 + 4 + (0 - 0) + 466 + 18), (0 + (580 - (361 + 219))) - ((320 - (53 + 267)) + (0 - 0))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((379 + 1295) - 619) - (87 + ((3128 - (15 + 398)) - (2729 - (18 + 964))))) + (0 - 0), (((1825 + 1573) - (1521 + 1105)) - (127 + 74 + (1369 - (20 + 830)) + 52)) - ((2572 - (914 + 520)) - (116 + ((1901 + 534) - (((969 - (116 + 10)) - (9 + 106 + 281)) + (2246 - 1280)))))), ((((23732 + 4931) - ((44705 - (542 + 196)) - (55251 - 29477))) - (2323 + 5632)) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((((5051 + 4889) - 7229) - (614 + 1089 + 114)) + ((3504 - 2174) - (((3186 - 1943) - (550 + (1868 - (1126 + 425)))) + (730 - (118 + 287)))), ((983 - (1183 - 881)) - ((1493 - (118 + 1003)) - (313 - 206))) - ((2595 - 1666) - (1004 - (142 + 235)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((8201 - 6393) - (134 + 151), ((451 + 1618) - ((1947 - (553 + 424)) + (1313 - 618))) - 290))) - ((28 - 13) + ((1784 + 241) - (582 + 1408)) + (((1754 + 14) - (733 + 525)) - ((149 + 200) - 71)) + ((5479 - (2299 + 1726)) - ((1764 - 950) + ((163 - 104) - (((4104 - 2271) - (348 + 847 + 629)) + ((28 - 22) - 1)))))))};
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\153\33\0\58\122\166\250\191\33\20\5\103\170\233\170\35\21", "\155\203\68\112\86\19\197")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\200\56\255\84\113\234\246\85", "\152\38\189\86\156\32\24\133"), ((9442381051 - (187 + (807 - (239 + 514)))) - (780 - (57 + 105 + 618))) - ((((16704512 - (797 + 532)) + 7134762) - (57 + 21 + 7 + 99 + 192)) + (418545018 - ((518 - 275) + 1022)))):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\207\71\166\81\242\104\151\74\253\89\179", "\38\156\55\199"), (((9000001936 - (0 - 0)) - ((1202 - (373 + 829)) + 0)) - ((1852 - (1373 + 263)) + 45 + (1355 - (476 + 255)))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((2630 - (369 + 761)) - (451 + 318 + 231), 336 + (1319 - 592)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((2068 - (1123 + (88 - 31))) - (316 + (136 - 64)), (1555 - (64 + 174)) - (((39 + 234) - (162 - 52)) + (427 - (144 + 192)))))):InvokeServer(unpack(TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["args%0"]));
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["args%1"] = {[(TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((3663 - (42 + 174)) - (1869 + 46 + 15), 29 + 5 + 87) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((4474 + 6056) - ((2250 - (363 + 1141)) + 638)) - 6549) - ((1964 - (1183 + 397)) + (1936 - 1300) + (92 - 32)), 1544 - (((701 + 255) - 326) + 82 + 27 + 684))) - (((3556 - (2943 - (1913 + 62))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](43 + 25, ((8399 - 5226) + (546 - ((2151 - (565 + 1368)) + (462 - 339)))) - (3855 - (((4571 - (1477 + 184)) - (1535 + (61 - 15))) + 136 + 9))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((1292 - ((996 - (564 + 292)) + 0 + 831)) - (37 + (372 - 156)), 2847 - ((1969 - ((922 - 616) + (558 - (244 + 60)))) + 441)))) + (((1264 - (1 + 11 + 3 + ((1854 - (41 + 435)) - 675))) + 838) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((360 + (1418 - (938 + 63))) - (2018 - (692 + 207 + (1693 - (936 + 189)))), (604 + 1231 + 956) - (((2811 - (1565 + 48)) - ((633 - 371) + ((482 + 297) - (268 + 335)))) + ((2415 - (782 + 356)) - ((327 - (176 + 91)) + (599 - 369))))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](2139 - ((((6015 - 1933) - ((1518 - (975 + 117)) + (2021 - (157 + 1718)))) - (345 + 134 + 31 + 1211)) + (1580 - ((1000 - 718) + (4013 - 2839)))), 1855 - (569 + 242)))))]=LUAOBFUSACTOR_DECRYPT_STR_0("\141\115\120\61\1\125\251\77", "\35\200\29\28\72\115\20\154"),[TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((((5229 - (697 + 321)) - 2749) - ((32 - 20) + 186 + ((3207 - 1693) - ((1627 - 921) + 124 + 194)))) - ((3291 - ((7114 - 3317) - (721 + (1420 - 890)))) + (1248 - (322 + 905)))) - ((6 - ((1885 - (602 + 9)) - (945 + (1515 - (449 + 740))))) + (875 - (826 + 46))), ((3305 - (2929 - (245 + 702))) - ((2199 - 1503) + 146 + 308 + 56)) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((182 - (795 - ((2169 - (260 + 1638)) + 429))) - (495 - (382 + 58)), ((981 - 675) + 23 + 4) - ((3120 - 1610) - ((3242 - 2151) + 171))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((1501 - ((2613 - (902 + 303)) + (201 - 109))) + ((2615 - 1529) - (461 + 625)) + ((9 + 88) - ((3044 - (1121 + 569)) - ((1207 - (22 + 192)) + 295))), 281 - (11 + 185)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((381 - ((1294 - (418 + (1436 - (483 + 200)))) + (1714 - (1404 + 59)))) + ((10 - 6) - (3 - 0))) - ((1469 - (468 + 297)) - ((770 - (334 + 228)) + (1652 - 1162))), (270 - 153) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](13 + 19, ((175 - 78) + 297 + 746) - ((241 - (141 + 95)) + 34 + 0 + 15 + (84 - 51) + 245 + (1737 - 1014))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](868 - (155 + 505 + (705 - (406 + 123))), ((5871 - 3728) - (1230 + 519 + 20)) - (69 + 220))))]=CFrame.new(15.5 + 12 + ((2137 - 619) - (737 + 512 + (236 - (92 + 71)))) + (206 - (5 + 5 + 4 + ((2241 - 908) - (466 + 679)))), ((4.13800001 - (767 - (574 + 191))) + 0) - (((1930 - (1036 + 219)) - ((1337 - 803) + (2041 - (55 + 51 + 1794)))) - ((849 - (254 + 595)) + 0)), -((363 + (1197 - (55 + 71))) - (447 + (1271 - 305))), ((((5766 - (573 + 1217)) - 2629) + 2002) - (6249 - (((26312 - 16811) - 5992) + 35 + 422))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((((1877 - ((5 - 1) + 110)) + 70) - ((((5101 - (714 + 225)) - ((166 - 109) + 527)) - 1875) + (((2240 - 633) - (5 + 36 + 1386)) - ((244 - 75) - ((823 - (118 + 688)) + 86))))) + ((193 - (25 + 23)) - (64 + 6 + 23)), ((2341 - (3177 - (927 + 959))) + 904) - (((5369 - 3776) - (((1427 - (16 + 716)) - 455) + (302 - (122 + 44)) + (((2403 - 1158) - (621 - (11 + 86))) - ((280 - 165) + ((1217 - (175 + 110)) - 651))))) + (((309 - 186) + 28) - (424 - 338)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((1800 - (503 + 1293)) + 17 + (11 - 7)) - (((31 + 11) - (1082 - (810 + 251))) - 12)) + (((404 + 178) - ((150 + 338) - (30 + 32 + 3))) - ((1507 - (43 + 490)) - ((1112 - (711 + 22)) + 171 + ((6088 - 4514) - (1043 + (1073 - (240 + 619))))))), (((3046 - (541 + 1699)) - ((2320 - 861) - (323 + 889))) + ((5275 - 3315) - ((76 + 1069) - (361 + (1963 - (1344 + 400)))))) - (892 + (181 - 116)))), ((((7395 - (255 + 150)) - (53 + 211 + 56)) - (441 + 382 + (12040 - 9222))) - ((2058 - ((547 - ((48 - 33) + (2137 - (404 + 1335)))) + (1133 - ((424 - (183 + 223)) + (1172 - 208))))) - (((6300 - (3066 + 1560)) - (203 + 359 + 408 + (775 - (10 + 327)) + 257)) + ((596 + 259) - (20 + (1168 - (118 + 220))))))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](602 - (67 + 18 + ((681 - (116 + 4 + 6)) - ((469 - (108 + 341)) + 244))), ((1761 + 2158) - (((5580 - 4260) - (542 + 196)) + ((4511 - (711 + 782)) - (3086 - 1476)))) - ((628 + 1522) - (((1311 - (270 + 199)) - (99 + 206 + 294)) + (2187 - (580 + 1239)) + 654))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((2223 - 1475) - 464) - (148 - 90), ((8890 - (1077 + 49 + 425)) - (5815 - (118 + 287))) - 885)), ((0 + 0) - (0 + 0)) - ((2926 - 1805) - (74 + 44 + 1003)), (((6631 - 4365) - ((1572 - (142 + (1402 - (645 + 522)))) + (2853 - (4014 - (1010 + 780))))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](75 + 0 + 269 + 72, 26) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((7603 - 6007) - (((6153 - 4053) - ((2389 - (1045 + 791)) + 424)) + ((270 - 163) - (76 - 26))), 23 + 3))) - ((((505 - (351 + 154)) + 0) - (1574 - (1281 + 293))) - (((407 - (28 + 238)) + 100) - (80 + (239 - 132) + (1613 - (1381 + 178))))), ((482 + 31 + 385) - (131 + 31 + (1339 - (308 + 413)))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((165 - 117) + 5 + 3 + ((475 - (381 + 89)) - 3)) - ((40 - (20 + 2)) + 6 + 2), (((2515 - 1046) - 780) - ((1319 - (1074 + 82)) + (152 - 61))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((346 - 188) + (3643 - (214 + 1570))) - ((1999 - (990 + 465)) + 547 + 778 + ((128 + 166) - (227 + 6))), ((3254 - 2427) - (239 + (2240 - (1668 + 58)))) + ((2451 - (512 + 114)) - ((1259 - 776) + 890 + ((3290 - 1698) - ((2773 - 1976) + 532))))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](64 + 23, (146 + 167 + 612) - (((732 + 3175) - 2245) - (((1438 + 215) - (373 + 829)) + (1851 - 1302)))))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((759 - (476 + (2249 - (109 + 1885)))) + 60) - (1160 - ((1838 - (1269 + 200)) + 761))) - ((((5 - 2) + 2) - 1) + ((851 - (98 + 717)) - ((850 - (802 + 24)) - (17 - 7)))), ((1039 - 215) - (58 + 331)) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](1471 - ((984 - (50 + 14 + 174)) + 638), (23 + 113 + 224) - ((32 + 114) - (136 - 87))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](82 + (3 - 2) + 4, 1737 - (1329 + 52 + 93))))), 0, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](0 + ((396 + 575) - (((712 - (191 + 40)) - (159 + 59 + ((215 + 244) - ((1577 - (797 + 636)) + (932 - 740))))) + (2412 - ((1751 - (42 + 174)) + (1665 - (1427 + 192)))))), 0 + 0 + 0 + 0) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](0 + 0 + (0 - 0) + 0 + 0 + 0, (2410 - (((821 + 989) - (363 + 1141)) + ((2160 - (192 + 134)) - (1183 + (1673 - (316 + 960)))))) - (1409 + (85 - (32 + 25)) + 234 + 69 + 102 + 8)), TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](((0 - 0) + 0) - 0, 551 - (83 + 468)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((3383 - ((3719 - (1202 + 604)) + (289 - 227))) - 690) - (15 + 443 + (432 - 172))) - ((0 - 0) + ((325 - (45 + 280)) - (0 + 0))), ((2971 + 429) - (565 + 500 + 868)) - ((3380 - (1373 + 1108)) + (2229 - (1477 + 184)))), (289 + ((36 + 168) - (99 - 45))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((544 + (1950 - (340 + 1571))) - (262 + (((506 + 775) - ((2336 - (1733 + 39)) + (802 - 510))) - (1283 - (125 + 909)))), ((4515 - 1898) - (((2755 - (1096 + 852)) - (242 + 297)) + (639 - (244 + 60)))) - (266 + 79 + (1666 - ((85 - 25) + 224 + 6)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](((1821 - (409 + 103)) - (41 + 435)) - ((434 - (46 + 190)) + ((1586 - (51 + 44)) - (938 + 18 + 45))), 865 - ((1743 - (1114 + 203)) + 113 + 33))))};
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\43\186\193\211\132\47\53\13\186\213\236\153\35\38\24\184\212", "\84\121\223\177\191\237\76")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\157\67\199\163\46\89\63\207\168", "\161\219\54\169\192\90\48\80"), ((9000000625 - (1125 - (936 + (915 - (228 + 498))))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"](878 - (188 + 83 + 298 + 242), ((1071 + 867) - ((2228 - (174 + 489)) + 48)) - 212) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](67, (29 + (1224 - 754)) - (239 + (2052 - (830 + 1075)))))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((((3233 - (303 + 221)) - ((2051 - (231 + 1038)) + 356)) - (1183 - (176 + 91))) + (1261 - (589 + 117 + (1480 - (171 + 991)))), ((5312 - 4023) - 794) - ((64 - 20) + ((4395 - 2758) - (721 + (1622 - (975 + 117)))))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"]((((9485 - 5684) - (157 + 1718)) - (757 + 188 + 265 + 61)) + ((2947 - 2106) - 604), (((14526 - (29646 - 19369)) - 2548) - ((1638 - ((1122 - 425) + (992 - 671))) + ((1454 - (111 + 1137)) - (288 - (91 + 67))) + (1080 - (1696 - 1126)))) - ((((1823 - 1032) - (27 + 79 + (688 - (423 + 100)) + (803 - 374))) - ((1 + 124) - (215 - 137))) + ((2875 - (168 + 154 + 905)) - (1091 + (782 - (602 + (780 - (326 + 445)))))))))):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\122\82\1\50\71\125\48\41\72\76\20", "\69\41\34\96"), (((8935292677 - 0) - ((1643 - (449 + 740)) + (338 - 186))) - -(((304932344 - 174297100) - (826 + 46)) - (65926416 - ((956 - (530 + 181)) + (1583 - (614 + 267)))))) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((((16773 - (19 + 13)) - (18623 - 7180)) - ((745 - 425) + 673 + ((6264 - 4071) - (68 + 192 + 1638)))) - (157 + ((5794 - 2499) - (382 + (120 - 62)))), ((4965 - (5229 - (1293 + 519))) - (348 + 70 + (1555 - 802))) + (127 - 84) + (1273 - (902 + (618 - 315)))) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](2190 - 1192, ((284 - 166) + (2665 - 1644)) - (145 + 349 + (26 - 12) + 143)))):InvokeServer(unpack(TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["args%1"]));
	wait(((0 - 0) + (0 - 0) + 0 + 0) - (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_AND%0"]((0 + 0) - (1690 - (1121 + (1321 - 752))), ((50 + 164) - (22 + 192)) + 0) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["obf_OR%0"](683 - (483 + 67 + 133), (331 + 198) - ((1502 - (709 + 387)) + 123))));
end
