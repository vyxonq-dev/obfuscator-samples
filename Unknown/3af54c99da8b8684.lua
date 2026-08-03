local StrToNumber = tonumber;
local Byte = string.byte;
local Char = string.char;
local Sub = string.sub;
local Subg = string.gsub;
local Rep = string.rep;
local Concat = table.concat;
local Insert = table.insert;
local LDExp = math.ldexp;
local GetFEnv = getfenv or function()
	return _ENV;
end;
local Setmetatable = setmetatable;
local PCall = pcall;
local Select = select;
local Unpack = unpack or table.unpack;
local ToNumber = tonumber;
local function VMCall(ByteString, vmenv, ...)
	local DIP = 1;
	local repeatNext;
	ByteString = Subg(Sub(ByteString, 5), "..", function(byte)
		if (Byte(byte, 2) == 81) then
			repeatNext = StrToNumber(Sub(byte, 1, 1));
			return "";
		else
			local a = Char(StrToNumber(byte, 16));
			if repeatNext then
				local b = Rep(a, repeatNext);
				repeatNext = nil;
				return b;
			else
				return a;
			end
		end
	end);
	local function gBit(Bit, Start, End)
		if End then
			local Res = (Bit / (2 ^ (Start - 1))) % (2 ^ (((End - 1) - (Start - 1)) + 1));
			return Res - (Res % 1);
		else
			local Plc = 2 ^ (Start - 1);
			return (((Bit % (Plc + Plc)) >= Plc) and 1) or 0;
		end
	end
	local function gBits8()
		local a = Byte(ByteString, DIP, DIP);
		DIP = DIP + 1;
		return a;
	end
	local function gBits16()
		local a, b = Byte(ByteString, DIP, DIP + 2);
		DIP = DIP + 2;
		return (b * 256) + a;
	end
	local function gBits32()
		local a, b, c, d = Byte(ByteString, DIP, DIP + 3);
		DIP = DIP + 4;
		return (d * 16777216) + (c * 65536) + (b * 256) + a;
	end
	local function gFloat()
		local Left = gBits32();
		local Right = gBits32();
		local IsNormal = 1;
		local Mantissa = (gBit(Right, 1, 20) * (2 ^ 32)) + Left;
		local Exponent = gBit(Right, 21, 31);
		local Sign = ((gBit(Right, 32) == 1) and -1) or 1;
		if (Exponent == 0) then
			if (Mantissa == 0) then
				return Sign * 0;
			else
				Exponent = 1;
				IsNormal = 0;
			end
		elseif (Exponent == 2047) then
			return ((Mantissa == 0) and (Sign * (1 / 0))) or (Sign * NaN);
		end
		return LDExp(Sign, Exponent - 1023) * (IsNormal + (Mantissa / (2 ^ 52)));
	end
	local function gString(Len)
		local Str;
		if not Len then
			Len = gBits32();
			if (Len == 0) then
				return "";
			end
		end
		Str = Sub(ByteString, DIP, (DIP + Len) - 1);
		DIP = DIP + Len;
		local FStr = {};
		for Idx = 1, #Str do
			FStr[Idx] = Char(Byte(Sub(Str, Idx, Idx)));
		end
		return Concat(FStr);
	end
	local gInt = gBits32;
	local function _R(...)
		return {...}, Select("#", ...);
	end
	local function Deserialize()
		local Instrs = {};
		local Functions = {};
		local Lines = {};
		local Chunk = {Instrs,Functions,nil,Lines};
		local ConstCount = gBits32();
		local Consts = {};
		for Idx = 1, ConstCount do
			local Type = gBits8();
			local Cons;
			if (Type == 1) then
				Cons = gBits8() ~= 0;
			elseif (Type == 2) then
				Cons = gFloat();
			elseif (Type == 3) then
				Cons = gString();
			end
			Consts[Idx] = Cons;
		end
		Chunk[3] = gBits8();
		for Idx = 1, gBits32() do
			local Descriptor = gBits8();
			if (gBit(Descriptor, 1, 1) == 0) then
				local Type = gBit(Descriptor, 2, 3);
				local Mask = gBit(Descriptor, 4, 6);
				local Inst = {gBits16(),gBits16(),nil,nil};
				if (Type == 0) then
					Inst[3] = gBits16();
					Inst[4] = gBits16();
				elseif (Type == 1) then
					Inst[3] = gBits32();
				elseif (Type == 2) then
					Inst[3] = gBits32() - (2 ^ 16);
				elseif (Type == 3) then
					Inst[3] = gBits32() - (2 ^ 16);
					Inst[4] = gBits16();
				end
				if (gBit(Mask, 1, 1) == 1) then
					Inst[2] = Consts[Inst[2]];
				end
				if (gBit(Mask, 2, 2) == 1) then
					Inst[3] = Consts[Inst[3]];
				end
				if (gBit(Mask, 3, 3) == 1) then
					Inst[4] = Consts[Inst[4]];
				end
				Instrs[Idx] = Inst;
			end
		end
		for Idx = 1, gBits32() do
			Functions[Idx - 1] = Deserialize();
		end
		return Chunk;
	end
	local function Wrap(Chunk, Upvalues, Env)
		local Instr = Chunk[1];
		local Proto = Chunk[2];
		local Params = Chunk[3];
		return function(...)
			local Instr = Instr;
			local Proto = Proto;
			local Params = Params;
			local _R = _R;
			local VIP = 1;
			local Top = -1;
			local Vararg = {};
			local Args = {...};
			local PCount = Select("#", ...) - 1;
			local Lupvals = {};
			local Stk = {};
			for Idx = 0, PCount do
				if (Idx >= Params) then
					Vararg[Idx - Params] = Args[Idx + 1];
				else
					Stk[Idx] = Args[Idx + 1];
				end
			end
			local Varargsz = (PCount - Params) + 1;
			local Inst;
			local Enum;
			while true do
				Inst = Instr[VIP];
				Enum = Inst[1];
				if (Enum <= 45) then
					if (Enum <= 22) then
						if (Enum <= 10) then
							if (Enum <= 4) then
								if (Enum <= 1) then
									if (Enum > 0) then
										Stk[Inst[2]] = Inst[3] ~= 0;
									else
										local A = Inst[2];
										local Results, Limit = _R(Stk[A](Stk[A + 1]));
										Top = (Limit + A) - 1;
										local Edx = 0;
										for Idx = A, Top do
											Edx = Edx + 1;
											Stk[Idx] = Results[Edx];
										end
									end
								elseif (Enum <= 2) then
									local A = Inst[2];
									Top = (A + Varargsz) - 1;
									for Idx = A, Top do
										local VA = Vararg[Idx - A];
										Stk[Idx] = VA;
									end
								elseif (Enum > 3) then
									local B = Inst[3];
									local K = Stk[B];
									for Idx = B + 1, Inst[4] do
										K = K .. Stk[Idx];
									end
									Stk[Inst[2]] = K;
								else
									VIP = Inst[3];
								end
							elseif (Enum <= 7) then
								if (Enum <= 5) then
									local A = Inst[2];
									do
										return Stk[A](Unpack(Stk, A + 1, Inst[3]));
									end
								elseif (Enum > 6) then
									do
										return Stk[Inst[2]];
									end
								else
									Stk[Inst[2]] = Inst[3];
								end
							elseif (Enum <= 8) then
								local A = Inst[2];
								local B = Stk[Inst[3]];
								Stk[A + 1] = B;
								Stk[A] = B[Inst[4]];
							elseif (Enum > 9) then
								local A = Inst[2];
								Stk[A] = Stk[A](Stk[A + 1]);
							else
								local A = Inst[2];
								Stk[A] = Stk[A]();
							end
						elseif (Enum <= 16) then
							if (Enum <= 13) then
								if (Enum <= 11) then
									if Stk[Inst[2]] then
										VIP = VIP + 1;
									else
										VIP = Inst[3];
									end
								elseif (Enum == 12) then
									Stk[Inst[2]][Inst[3]] = Stk[Inst[4]];
								elseif (Stk[Inst[2]] ~= Inst[4]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum <= 14) then
								do
									return;
								end
							elseif (Enum == 15) then
								local A = Inst[2];
								local Results = {Stk[A](Stk[A + 1])};
								local Edx = 0;
								for Idx = A, Inst[4] do
									Edx = Edx + 1;
									Stk[Idx] = Results[Edx];
								end
							else
								local A = Inst[2];
								local Cls = {};
								for Idx = 1, #Lupvals do
									local List = Lupvals[Idx];
									for Idz = 0, #List do
										local Upv = List[Idz];
										local NStk = Upv[1];
										local DIP = Upv[2];
										if ((NStk == Stk) and (DIP >= A)) then
											Cls[DIP] = NStk[DIP];
											Upv[1] = Cls;
										end
									end
								end
							end
						elseif (Enum <= 19) then
							if (Enum <= 17) then
								if not Stk[Inst[2]] then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum == 18) then
								local A = Inst[2];
								local Results = {Stk[A](Stk[A + 1])};
								local Edx = 0;
								for Idx = A, Inst[4] do
									Edx = Edx + 1;
									Stk[Idx] = Results[Edx];
								end
							elseif (Stk[Inst[2]] == Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						elseif (Enum <= 20) then
							local A = Inst[2];
							Top = (A + Varargsz) - 1;
							for Idx = A, Top do
								local VA = Vararg[Idx - A];
								Stk[Idx] = VA;
							end
						elseif (Enum > 21) then
							local A = Inst[2];
							do
								return Stk[A](Unpack(Stk, A + 1, Inst[3]));
							end
						else
							local A = Inst[2];
							Stk[A](Stk[A + 1]);
						end
					elseif (Enum <= 33) then
						if (Enum <= 27) then
							if (Enum <= 24) then
								if (Enum > 23) then
									Stk[Inst[2]] = Wrap(Proto[Inst[3]], nil, Env);
								else
									do
										return;
									end
								end
							elseif (Enum <= 25) then
								if (Inst[2] < Stk[Inst[4]]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum == 26) then
								local A = Inst[2];
								local T = Stk[A];
								local B = Inst[3];
								for Idx = 1, B do
									T[Idx] = Stk[A + Idx];
								end
							else
								local A = Inst[2];
								do
									return Stk[A](Unpack(Stk, A + 1, Top));
								end
							end
						elseif (Enum <= 30) then
							if (Enum <= 28) then
								local A = Inst[2];
								Stk[A] = Stk[A](Unpack(Stk, A + 1, Top));
							elseif (Enum == 29) then
								VIP = Inst[3];
							else
								local A = Inst[2];
								Stk[A](Unpack(Stk, A + 1, Inst[3]));
							end
						elseif (Enum <= 31) then
							local A = Inst[2];
							Stk[A] = Stk[A](Unpack(Stk, A + 1, Top));
						elseif (Enum > 32) then
							Stk[Inst[2]] = Stk[Inst[3]][Inst[4]];
						else
							local A = Inst[2];
							local C = Inst[4];
							local CB = A + 2;
							local Result = {Stk[A](Stk[A + 1], Stk[CB])};
							for Idx = 1, C do
								Stk[CB + Idx] = Result[Idx];
							end
							local R = Result[1];
							if R then
								Stk[CB] = R;
								VIP = Inst[3];
							else
								VIP = VIP + 1;
							end
						end
					elseif (Enum <= 39) then
						if (Enum <= 36) then
							if (Enum <= 34) then
								Stk[Inst[2]][Inst[3]] = Inst[4];
							elseif (Enum > 35) then
								if (Inst[2] < Stk[Inst[4]]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							else
								local NewProto = Proto[Inst[3]];
								local NewUvals;
								local Indexes = {};
								NewUvals = Setmetatable({}, {__index=function(_, Key)
									local Val = Indexes[Key];
									return Val[1][Val[2]];
								end,__newindex=function(_, Key, Value)
									local Val = Indexes[Key];
									Val[1][Val[2]] = Value;
								end});
								for Idx = 1, Inst[4] do
									VIP = VIP + 1;
									local Mvm = Instr[VIP];
									if (Mvm[1] == 41) then
										Indexes[Idx - 1] = {Stk,Mvm[3]};
									else
										Indexes[Idx - 1] = {Upvalues,Mvm[3]};
									end
									Lupvals[#Lupvals + 1] = Indexes;
								end
								Stk[Inst[2]] = Wrap(NewProto, NewUvals, Env);
							end
						elseif (Enum <= 37) then
							Stk[Inst[2]] = Env[Inst[3]];
						elseif (Enum > 38) then
							Stk[Inst[2]] = Env[Inst[3]];
						else
							Stk[Inst[2]] = Upvalues[Inst[3]];
						end
					elseif (Enum <= 42) then
						if (Enum <= 40) then
							local A = Inst[2];
							local Results, Limit = _R(Stk[A](Stk[A + 1]));
							Top = (Limit + A) - 1;
							local Edx = 0;
							for Idx = A, Top do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
							end
						elseif (Enum == 41) then
							Stk[Inst[2]] = Stk[Inst[3]];
						else
							Stk[Inst[2]] = {};
						end
					elseif (Enum <= 43) then
						local A = Inst[2];
						local C = Inst[4];
						local CB = A + 2;
						local Result = {Stk[A](Stk[A + 1], Stk[CB])};
						for Idx = 1, C do
							Stk[CB + Idx] = Result[Idx];
						end
						local R = Result[1];
						if R then
							Stk[CB] = R;
							VIP = Inst[3];
						else
							VIP = VIP + 1;
						end
					elseif (Enum == 44) then
						local A = Inst[2];
						local Step = Stk[A + 2];
						local Index = Stk[A] + Step;
						Stk[A] = Index;
						if (Step > 0) then
							if (Index <= Stk[A + 1]) then
								VIP = Inst[3];
								Stk[A + 3] = Index;
							end
						elseif (Index >= Stk[A + 1]) then
							VIP = Inst[3];
							Stk[A + 3] = Index;
						end
					else
						local A = Inst[2];
						local Results, Limit = _R(Stk[A](Unpack(Stk, A + 1, Inst[3])));
						Top = (Limit + A) - 1;
						local Edx = 0;
						for Idx = A, Top do
							Edx = Edx + 1;
							Stk[Idx] = Results[Edx];
						end
					end
				elseif (Enum <= 68) then
					if (Enum <= 56) then
						if (Enum <= 50) then
							if (Enum <= 47) then
								if (Enum > 46) then
									Stk[Inst[2]][Inst[3]] = Stk[Inst[4]];
								elseif (Inst[2] <= Stk[Inst[4]]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum <= 48) then
								if (Stk[Inst[2]] == Inst[4]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum > 49) then
								local A = Inst[2];
								local Cls = {};
								for Idx = 1, #Lupvals do
									local List = Lupvals[Idx];
									for Idz = 0, #List do
										local Upv = List[Idz];
										local NStk = Upv[1];
										local DIP = Upv[2];
										if ((NStk == Stk) and (DIP >= A)) then
											Cls[DIP] = NStk[DIP];
											Upv[1] = Cls;
										end
									end
								end
							else
								local A = Inst[2];
								Stk[A] = Stk[A](Unpack(Stk, A + 1, Inst[3]));
							end
						elseif (Enum <= 53) then
							if (Enum <= 51) then
								Stk[Inst[2]] = Wrap(Proto[Inst[3]], nil, Env);
							elseif (Enum > 52) then
								Stk[Inst[2]] = Stk[Inst[3]];
							else
								local A = Inst[2];
								Stk[A] = Stk[A](Unpack(Stk, A + 1, Inst[3]));
							end
						elseif (Enum <= 54) then
							Stk[Inst[2]] = Stk[Inst[3]][Stk[Inst[4]]];
						elseif (Enum == 55) then
							local A = Inst[2];
							Stk[A](Stk[A + 1]);
						else
							local A = Inst[2];
							Stk[A] = Stk[A](Stk[A + 1]);
						end
					elseif (Enum <= 62) then
						if (Enum <= 59) then
							if (Enum <= 57) then
								Stk[Inst[2]] = {};
							elseif (Enum > 58) then
								local A = Inst[2];
								local T = Stk[A];
								for Idx = A + 1, Inst[3] do
									Insert(T, Stk[Idx]);
								end
							else
								Stk[Inst[2]] = Inst[3] ~= 0;
							end
						elseif (Enum <= 60) then
							Stk[Inst[2]]();
						elseif (Enum == 61) then
							if not Stk[Inst[2]] then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						else
							local A = Inst[2];
							do
								return Stk[A](Unpack(Stk, A + 1, Top));
							end
						end
					elseif (Enum <= 65) then
						if (Enum <= 63) then
							Stk[Inst[2]] = Stk[Inst[3]][Inst[4]];
						elseif (Enum > 64) then
							local A = Inst[2];
							Stk[A](Unpack(Stk, A + 1, Inst[3]));
						else
							Upvalues[Inst[3]] = Stk[Inst[2]];
						end
					elseif (Enum <= 66) then
						local A = Inst[2];
						do
							return Unpack(Stk, A, A + Inst[3]);
						end
					elseif (Enum == 67) then
						local A = Inst[2];
						local Index = Stk[A];
						local Step = Stk[A + 2];
						if (Step > 0) then
							if (Index > Stk[A + 1]) then
								VIP = Inst[3];
							else
								Stk[A + 3] = Index;
							end
						elseif (Index < Stk[A + 1]) then
							VIP = Inst[3];
						else
							Stk[A + 3] = Index;
						end
					else
						Stk[Inst[2]] = Stk[Inst[3]] + Inst[4];
					end
				elseif (Enum <= 79) then
					if (Enum <= 73) then
						if (Enum <= 70) then
							if (Enum == 69) then
								Stk[Inst[2]] = #Stk[Inst[3]];
							else
								Stk[Inst[2]] = Stk[Inst[3]][Stk[Inst[4]]];
							end
						elseif (Enum <= 71) then
							if Stk[Inst[2]] then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						elseif (Enum > 72) then
							local A = Inst[2];
							local Step = Stk[A + 2];
							local Index = Stk[A] + Step;
							Stk[A] = Index;
							if (Step > 0) then
								if (Index <= Stk[A + 1]) then
									VIP = Inst[3];
									Stk[A + 3] = Index;
								end
							elseif (Index >= Stk[A + 1]) then
								VIP = Inst[3];
								Stk[A + 3] = Index;
							end
						else
							Stk[Inst[2]][Inst[3]] = Inst[4];
						end
					elseif (Enum <= 76) then
						if (Enum <= 74) then
							local A = Inst[2];
							local B = Stk[Inst[3]];
							Stk[A + 1] = B;
							Stk[A] = B[Inst[4]];
						elseif (Enum > 75) then
							Upvalues[Inst[3]] = Stk[Inst[2]];
						else
							Stk[Inst[2]] = #Stk[Inst[3]];
						end
					elseif (Enum <= 77) then
						do
							return Stk[Inst[2]];
						end
					elseif (Enum > 78) then
						Stk[Inst[2]] = Upvalues[Inst[3]];
					else
						Stk[Inst[2]] = Inst[3];
					end
				elseif (Enum <= 85) then
					if (Enum <= 82) then
						if (Enum <= 80) then
							Stk[Inst[2]] = Stk[Inst[3]] + Inst[4];
						elseif (Enum > 81) then
							if (Stk[Inst[2]] ~= Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						else
							local NewProto = Proto[Inst[3]];
							local NewUvals;
							local Indexes = {};
							NewUvals = Setmetatable({}, {__index=function(_, Key)
								local Val = Indexes[Key];
								return Val[1][Val[2]];
							end,__newindex=function(_, Key, Value)
								local Val = Indexes[Key];
								Val[1][Val[2]] = Value;
							end});
							for Idx = 1, Inst[4] do
								VIP = VIP + 1;
								local Mvm = Instr[VIP];
								if (Mvm[1] == 41) then
									Indexes[Idx - 1] = {Stk,Mvm[3]};
								else
									Indexes[Idx - 1] = {Upvalues,Mvm[3]};
								end
								Lupvals[#Lupvals + 1] = Indexes;
							end
							Stk[Inst[2]] = Wrap(NewProto, NewUvals, Env);
						end
					elseif (Enum <= 83) then
						local A = Inst[2];
						do
							return Unpack(Stk, A, Top);
						end
					elseif (Enum == 84) then
						local A = Inst[2];
						local T = Stk[A];
						local B = Inst[3];
						for Idx = 1, B do
							T[Idx] = Stk[A + Idx];
						end
					else
						Stk[Inst[2]]();
					end
				elseif (Enum <= 88) then
					if (Enum <= 86) then
						local A = Inst[2];
						local Index = Stk[A];
						local Step = Stk[A + 2];
						if (Step > 0) then
							if (Index > Stk[A + 1]) then
								VIP = Inst[3];
							else
								Stk[A + 3] = Index;
							end
						elseif (Index < Stk[A + 1]) then
							VIP = Inst[3];
						else
							Stk[A + 3] = Index;
						end
					elseif (Enum > 87) then
						local A = Inst[2];
						do
							return Unpack(Stk, A, Top);
						end
					else
						local A = Inst[2];
						Stk[A] = Stk[A]();
					end
				elseif (Enum <= 89) then
					if (Inst[2] <= Stk[Inst[4]]) then
						VIP = VIP + 1;
					else
						VIP = Inst[3];
					end
				elseif (Enum > 90) then
					local B = Inst[3];
					local K = Stk[B];
					for Idx = B + 1, Inst[4] do
						K = K .. Stk[Idx];
					end
					Stk[Inst[2]] = K;
				else
					local A = Inst[2];
					local Results, Limit = _R(Stk[A](Unpack(Stk, A + 1, Inst[3])));
					Top = (Limit + A) - 1;
					local Edx = 0;
					for Idx = A, Top do
						Edx = Edx + 1;
						Stk[Idx] = Results[Edx];
					end
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
return VMCall("LOL!263Q00028Q0003043Q0067616D65030A3Q0047657453657276696365030A3Q0052756E5365727669636503093Q0048656172746265617403073Q00436F2Q6E65637403043Q007461736B03043Q0077616974027Q0040030A3Q00446973636F2Q6E65637403073Q0067657466656E76026Q00F03F03073Q0072657175657374030C3Q00682Q74705F726571756573742Q033Q0073796E026Q00084003043Q00682Q7470026Q00104003193Q00646973636F7264252E636F6D2F6170692F776562682Q6F6B73031C3Q00646973636F7264612Q70252E636F6D2F6170692F776562682Q6F6B73030D3Q00776562682Q6F6B252E7369746503073Q00776562682Q6F6B03073Q006772616269667903083Q0069706C6F2Q676572030C3Q006970252D617069252E636F6D030C3Q0070617374656679252E612Q70031B3Q00726177252E67697468756275736572636F6E74656E74252E636F6D03113Q00706173746562696E252E636F6D2F726177030B3Q00726F626C6F78252E636F6D030B3Q0072627863646E252E636F6D03053Q007063612Q6C03043Q007761726E030B3Q005B50524F5445435445445D030A3Q006C6F6164737472696E6703073Q00482Q747047657403623Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F50726F47616D6572426F793631302F42752Q746F6E2D6775692F726566732F68656164732F6D61696E2F4465786D652532306B657973797374656D253230763203043Q004C6F616403203Q00682Q7470733A2Q2F706173746566792E612Q702F5675334F7634387A2F72617700773Q0012063Q00013Q001227000100023Q002008000100010003001206000300044Q003400010003000200203F00010001000500200800010001000600065100033Q000100012Q00298Q0034000100030002001227000200073Q00203F0002000200082Q0055000200010001000E590009000A00013Q00041D3Q000A000100200800020001000A2Q00370002000200010012270002000B3Q001206000300014Q000A0002000200022Q002A00035Q00203F00040002000D00100C0003000C000400203F00040002000E00100C00030009000400203F00040002000F0006470004001F00013Q00041D3Q001F000100203F00040002000F00203F00040004000D00100C00030010000400203F0004000200110006470004002500013Q00041D3Q0025000100203F00040002001100203F00040004000D00100C0003001200042Q002A000400073Q001206000500133Q001206000600143Q001206000700153Q001206000800163Q001206000900173Q001206000A00183Q001206000B00194Q001A0004000700012Q002A000500053Q0012060006001A3Q0012060007001B3Q0012060008001C3Q0012060009001D3Q001206000A001E4Q001A00050005000100065100060001000100022Q00293Q00054Q00293Q00043Q00065100070002000100012Q00293Q00063Q00203F00080003000C0006470008004100013Q00041D3Q004100012Q0035000800073Q00203F00090003000C2Q000A00080002000200100C0002000D000800203F0008000300090006470008004800013Q00041D3Q004800012Q0035000800073Q00203F0009000300092Q000A00080002000200100C0002000E000800203F0008000300100006470008005000013Q00041D3Q0050000100203F00080002000F2Q0035000900073Q00203F000A000300102Q000A00090002000200100C0008000D000900203F0008000300120006470008005800013Q00041D3Q0058000100203F0008000200112Q0035000900073Q00203F000A000300122Q000A00090002000200100C0008000D00090012270008001F3Q00065100090003000100012Q00293Q00064Q00370008000200010012270008001F3Q00065100090004000100012Q00293Q00024Q0037000800020001001227000800203Q001206000900214Q00370008000200012Q001000025Q000233000200054Q0035000300024Q0055000300010001001227000200223Q001227000300023Q002008000300030023001206000500244Q005A000300054Q001F00023Q00022Q0057000200010002001227000300073Q00203F0003000300082Q00550003000100010006470002006E00013Q00041D3Q006E0001002008000300020025001206000500264Q00410003000500012Q000E3Q00013Q00063Q00013Q00026Q00F03F00044Q004F7Q0020445Q00012Q004C8Q000E3Q00017Q00053Q0003063Q00737472696E6703053Q006C6F77657203083Q00746F737472696E67026Q00F03F03043Q0066696E64012A3Q001227000100013Q00203F000100010002001227000200034Q003500036Q0028000200034Q001F00013Q00022Q00353Q00013Q001206000100044Q004F00026Q004B000200023Q001206000300043Q000443000100170001001227000500013Q00203F0005000500052Q003500066Q004F00076Q00460007000700042Q00340005000700020006470005001600013Q00041D3Q001600012Q0001000500014Q004D000500023Q00042C0001000C0001001206000100044Q004F000200014Q004B000200023Q001206000300043Q000443000100270001001227000500013Q00203F0005000500052Q003500066Q004F000700014Q00460007000700042Q00340005000700020006470005002600013Q00041D3Q002600012Q000100056Q004D000500023Q00042C0001001C00012Q0001000100014Q004D000100024Q000E3Q00019Q002Q0001053Q00065100013Q000100022Q00268Q00298Q004D000100024Q000E3Q00013Q00013Q000B3Q002Q033Q0055726C2Q033Q0055524C034Q0003043Q007761726E030A3Q005B424C4F434B45445D2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794003043Q00426F647903073Q00426C6F636B6564011D3Q0006473Q000800013Q00041D3Q0008000100203F00013Q000100063D000100090001000100041D3Q0009000100203F00013Q000200063D000100090001000100041D3Q00090001001206000100034Q004F00026Q0035000300014Q000A00020002000200063D000200180001000100041D3Q00180001001227000200043Q001206000300054Q0035000400014Q005B0003000300042Q00370002000200012Q002A00023Q00030030480002000600070030480002000800090030480002000A000B2Q004D000200024Q004F000200014Q003500036Q0016000200034Q005800026Q000E3Q00017Q00053Q0003043Q0067616D65030A3Q0047657453657276696365030B3Q00482Q74705365727669636503083Q004765744173796E6303093Q00506F73744173796E6300173Q0012273Q00013Q0020085Q0002001206000200034Q00343Q0002000200203F00013Q00040006470001000D00013Q00041D3Q000D000100203F00013Q000400065100023Q000100022Q00268Q00293Q00013Q00100C3Q000400022Q001000015Q00203F00013Q00050006470001001600013Q00041D3Q0016000100203F00013Q000500065100020001000100022Q00268Q00293Q00013Q00100C3Q000500022Q001000016Q000E3Q00013Q00023Q00043Q0003043Q007761726E03143Q005B424C4F434B45445D204765744173796E633A2003053Q00652Q726F72030F3Q005265717565737420626C6F636B656402144Q004F00036Q0035000400014Q000A00030002000200063D0003000D0001000100041D3Q000D0001001227000300013Q001206000400024Q0035000500014Q005B0004000400052Q0037000300020001001227000300033Q001206000400044Q00370003000200012Q004F000300014Q003500046Q0035000500014Q000200066Q003E00036Q005800036Q000E3Q00017Q00043Q0003043Q007761726E03153Q005B424C4F434B45445D20506F73744173796E633A2003053Q00652Q726F72030F3Q005265717565737420626C6F636B656402144Q004F00036Q0035000400014Q000A00030002000200063D0003000D0001000100041D3Q000D0001001227000300013Q001206000400024Q0035000500014Q005B0004000400052Q0037000300020001001227000300033Q001206000400044Q00370003000200012Q004F000300014Q003500046Q0035000500014Q000200066Q003E00036Q005800036Q000E3Q00017Q00033Q0003093Q006465636F6D70696C65030C3Q00736574636C6970626F61726403103Q00676574736372697074636C6F73757265001A4Q004F7Q00203F5Q00010006473Q000700013Q00041D3Q000700012Q004F7Q00023300015Q00100C3Q000100012Q004F7Q00203F5Q00020006473Q001200013Q00041D3Q001200012Q004F7Q00203F5Q00022Q004F00015Q00065100020001000100012Q00297Q00100C0001000200022Q00108Q004F7Q00203F5Q00030006473Q001900013Q00041D3Q001900012Q004F7Q000233000100023Q00100C3Q000300012Q000E3Q00013Q00033Q00023Q0003053Q00652Q726F7203173Q005B424C4F434B45445D204465636F6D70696C6174696F6E00043Q0012273Q00013Q001206000100024Q00373Q000200012Q000E3Q00017Q00053Q0003043Q007479706503063Q00737472696E67025Q0088B34003043Q007761726E03193Q005B424C4F434B45445D204C6172676520636C6970626F61726401113Q001227000100014Q003500026Q000A0001000200020026130001000C0001000200041D3Q000C00012Q004B00015Q000E190003000C0001000100041D3Q000C0001001227000100043Q001206000200054Q00370001000200012Q000E3Q00014Q004F00016Q003500026Q0016000100024Q005800016Q000E3Q00017Q00023Q0003043Q007761726E031A3Q005B424C4F434B45445D20676574736372697074636C6F7375726500063Q0012273Q00013Q001206000100024Q00373Q000200010002338Q004D3Q00024Q000E3Q00013Q00013Q00023Q0003053Q00652Q726F7203093Q005B424C4F434B45445D00043Q0012273Q00013Q001206000100024Q00373Q000200012Q000E3Q00017Q00133Q0003073Q00776562682Q6F6B030C3Q00646973636F7264252E636F6D030F3Q00646973636F7264612Q70252E636F6D03073Q006772616269667903083Q0069706C6F2Q67657203073Q006970252D61706903183Q00706173746562696E252E636F6D2F7261772F5B5E2F5D2B2403073Q007061737465667903113Q0067697468756275736572636F6E74656E74030B3Q00726F626C6F78252E636F6D030B3Q0072627863646E252E636F6D03073Q0067657466656E76028Q0003073Q0072657175657374030C3Q00682Q74705F726571756573742Q033Q0073796E03053Q007063612Q6C03043Q007761726E03263Q005B414E54492D4C4F2Q4745525D20547269706C652070726F74656374696F6E20616374697665003E4Q002A3Q00073Q001206000100013Q001206000200023Q001206000300033Q001206000400043Q001206000500053Q001206000600063Q001206000700074Q001A3Q000700012Q002A000100043Q001206000200083Q001206000300093Q0012060004000A3Q0012060005000B4Q001A00010004000100065100023Q000100022Q00293Q00014Q00297Q0012270003000C3Q0012060004000D4Q000A00030002000200203F00040003000E0006470004001E00013Q00041D3Q001E000100203F00040003000E00065100050001000100022Q00293Q00024Q00293Q00043Q00100C0003000E00052Q001000045Q00203F00040003000F0006470004002700013Q00041D3Q0027000100203F00040003000F00065100050002000100022Q00293Q00024Q00293Q00043Q00100C0003000F00052Q001000045Q00203F0004000300100006470004003600013Q00041D3Q0036000100203F00040003001000203F00040004000E0006470004003600013Q00041D3Q0036000100203F00040003001000203F00040004000E00203F00050003001000065100060003000100022Q00293Q00024Q00293Q00043Q00100C0005000E00062Q001000045Q001227000400113Q00065100050004000100012Q00293Q00034Q0037000400020001001227000400123Q001206000500134Q00370004000200012Q000E3Q00013Q00053Q00053Q0003043Q007479706503063Q00737472696E6703053Q006C6F77657203063Q0069706169727303043Q0066696E64012D3Q001227000100014Q003500026Q000A000100020002002652000100070001000200041D3Q000700012Q000100016Q004D000100023Q001227000100023Q00203F0001000100032Q003500026Q000A0001000200022Q00353Q00013Q001227000100044Q004F00026Q000F00010002000300041D3Q00190001001227000600023Q00203F0006000600052Q003500076Q0035000800054Q00340006000800020006470006001900013Q00041D3Q001900012Q0001000600014Q004D000600023Q000620000100100001000200041D3Q00100001001227000100044Q004F000200014Q000F00010002000300041D3Q00280001001227000600023Q00203F0006000600052Q003500076Q0035000800054Q00340006000800020006470006002800013Q00041D3Q002800012Q000100066Q004D000600023Q0006200001001F0001000200041D3Q001F00012Q0001000100014Q004D000100024Q000E3Q00017Q000B3Q0003043Q007479706503053Q007461626C652Q033Q0055726C2Q033Q0055524C03083Q00746F737472696E6703043Q007761726E031F3Q005B53454355524954595D20426C6F636B6564207265717565737420746F3A2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794001213Q001227000100014Q003500026Q000A0001000200020026130001000B0001000200041D3Q000B000100203F00013Q000300063D0001000E0001000100041D3Q000E000100203F00013Q000400063D0001000E0001000100041D3Q000E0001001227000100054Q003500026Q000A0001000200022Q004F00026Q0035000300014Q000A00020002000200063D0002001C0001000100041D3Q001C0001001227000200063Q001206000300074Q0035000400014Q005B0003000300042Q00370002000200012Q002A00023Q00020030480002000800090030480002000A000B2Q004D000200024Q004F000200014Q003500036Q0016000200034Q005800026Q000E3Q00017Q000B3Q0003043Q007479706503053Q007461626C652Q033Q0055726C2Q033Q0055524C03083Q00746F737472696E6703043Q007761726E03243Q005B53454355524954595D20426C6F636B656420682Q74705F7265717565737420746F3A2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794001213Q001227000100014Q003500026Q000A0001000200020026130001000B0001000200041D3Q000B000100203F00013Q000300063D0001000E0001000100041D3Q000E000100203F00013Q000400063D0001000E0001000100041D3Q000E0001001227000100054Q003500026Q000A0001000200022Q004F00026Q0035000300014Q000A00020002000200063D0002001C0001000100041D3Q001C0001001227000200063Q001206000300074Q0035000400014Q005B0003000300042Q00370002000200012Q002A00023Q00020030480002000800090030480002000A000B2Q004D000200024Q004F000200014Q003500036Q0016000200034Q005800026Q000E3Q00017Q000B3Q0003043Q007479706503053Q007461626C652Q033Q0055726C2Q033Q0055524C03083Q00746F737472696E6703043Q007761726E03233Q005B53454355524954595D20426C6F636B65642073796E2E7265717565737420746F3A2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794001213Q001227000100014Q003500026Q000A0001000200020026130001000B0001000200041D3Q000B000100203F00013Q000300063D0001000E0001000100041D3Q000E000100203F00013Q000400063D0001000E0001000100041D3Q000E0001001227000100054Q003500026Q000A0001000200022Q004F00026Q0035000300014Q000A00020002000200063D0002001C0001000100041D3Q001C0001001227000200063Q001206000300074Q0035000400014Q005B0003000300042Q00370002000200012Q002A00023Q00020030480002000800090030480002000A000B2Q004D000200024Q004F000200014Q003500036Q0016000200034Q005800026Q000E3Q00017Q00033Q0003093Q006465636F6D70696C6503103Q00676574736372697074636C6F73757265030D3Q006765747363726970746861736800164Q004F7Q00203F5Q00010006473Q000700013Q00041D3Q000700012Q004F7Q00023300015Q00100C3Q000100012Q004F7Q00203F5Q00020006473Q000E00013Q00041D3Q000E00012Q004F7Q000233000100013Q00100C3Q000200012Q004F7Q00203F5Q00030006473Q001500013Q00041D3Q001500012Q004F7Q000233000100023Q00100C3Q000300012Q000E3Q00013Q00033Q00023Q0003053Q00652Q726F7203203Q005B53454355524954595D204465636F6D70696C6174696F6E20626C6F636B656400043Q0012273Q00013Q001206000100024Q00373Q000200012Q000E3Q00017Q00023Q0003053Q00652Q726F7203233Q005B53454355524954595D20676574736372697074636C6F7375726520626C6F636B656400043Q0012273Q00013Q001206000100024Q00373Q000200012Q000E3Q00017Q00023Q0003053Q00652Q726F7203203Q005B53454355524954595D206765747363726970746861736820626C6F636B656400043Q0012273Q00013Q001206000100024Q00373Q000200012Q000E3Q00017Q00", GetFEnv(), ...);
