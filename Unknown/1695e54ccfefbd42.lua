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
									if (Enum == 0) then
										if not Stk[Inst[2]] then
											VIP = VIP + 1;
										else
											VIP = Inst[3];
										end
									else
										Stk[Inst[2]] = Wrap(Proto[Inst[3]], nil, Env);
									end
								elseif (Enum <= 2) then
									local A = Inst[2];
									do
										return Stk[A](Unpack(Stk, A + 1, Top));
									end
								elseif (Enum > 3) then
									local B = Inst[3];
									local K = Stk[B];
									for Idx = B + 1, Inst[4] do
										K = K .. Stk[Idx];
									end
									Stk[Inst[2]] = K;
								else
									Stk[Inst[2]][Inst[3]] = Inst[4];
								end
							elseif (Enum <= 7) then
								if (Enum <= 5) then
									local A = Inst[2];
									Stk[A] = Stk[A](Unpack(Stk, A + 1, Top));
								elseif (Enum > 6) then
									Stk[Inst[2]] = Inst[3];
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
										if (Mvm[1] == 27) then
											Indexes[Idx - 1] = {Stk,Mvm[3]};
										else
											Indexes[Idx - 1] = {Upvalues,Mvm[3]};
										end
										Lupvals[#Lupvals + 1] = Indexes;
									end
									Stk[Inst[2]] = Wrap(NewProto, NewUvals, Env);
								end
							elseif (Enum <= 8) then
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
							elseif (Enum == 9) then
								local A = Inst[2];
								Stk[A](Unpack(Stk, A + 1, Inst[3]));
							else
								Stk[Inst[2]] = Inst[3] ~= 0;
							end
						elseif (Enum <= 16) then
							if (Enum <= 13) then
								if (Enum <= 11) then
									if (Inst[2] < Stk[Inst[4]]) then
										VIP = VIP + 1;
									else
										VIP = Inst[3];
									end
								elseif (Enum > 12) then
									if (Inst[2] < Stk[Inst[4]]) then
										VIP = VIP + 1;
									else
										VIP = Inst[3];
									end
								else
									local A = Inst[2];
									Top = (A + Varargsz) - 1;
									for Idx = A, Top do
										local VA = Vararg[Idx - A];
										Stk[Idx] = VA;
									end
								end
							elseif (Enum <= 14) then
								if not Stk[Inst[2]] then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum > 15) then
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
							else
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
							end
						elseif (Enum <= 19) then
							if (Enum <= 17) then
								do
									return;
								end
							elseif (Enum == 18) then
								do
									return Stk[Inst[2]];
								end
							else
								local A = Inst[2];
								Stk[A](Unpack(Stk, A + 1, Inst[3]));
							end
						elseif (Enum <= 20) then
							local A = Inst[2];
							do
								return Stk[A](Unpack(Stk, A + 1, Top));
							end
						elseif (Enum == 21) then
							local A = Inst[2];
							Stk[A] = Stk[A](Unpack(Stk, A + 1, Inst[3]));
						elseif Stk[Inst[2]] then
							VIP = VIP + 1;
						else
							VIP = Inst[3];
						end
					elseif (Enum <= 33) then
						if (Enum <= 27) then
							if (Enum <= 24) then
								if (Enum > 23) then
									Stk[Inst[2]] = Upvalues[Inst[3]];
								else
									Stk[Inst[2]] = Stk[Inst[3]][Stk[Inst[4]]];
								end
							elseif (Enum <= 25) then
								local A = Inst[2];
								local T = Stk[A];
								for Idx = A + 1, Inst[3] do
									Insert(T, Stk[Idx]);
								end
							elseif (Enum > 26) then
								Stk[Inst[2]] = Stk[Inst[3]];
							else
								Stk[Inst[2]][Inst[3]] = Inst[4];
							end
						elseif (Enum <= 30) then
							if (Enum <= 28) then
								local A = Inst[2];
								do
									return Stk[A](Unpack(Stk, A + 1, Inst[3]));
								end
							elseif (Enum == 29) then
								local A = Inst[2];
								Stk[A] = Stk[A](Unpack(Stk, A + 1, Inst[3]));
							else
								local A = Inst[2];
								local T = Stk[A];
								local B = Inst[3];
								for Idx = 1, B do
									T[Idx] = Stk[A + Idx];
								end
							end
						elseif (Enum <= 31) then
							Stk[Inst[2]] = Stk[Inst[3]][Inst[4]];
						elseif (Enum == 32) then
							if (Stk[Inst[2]] == Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						else
							VIP = Inst[3];
						end
					elseif (Enum <= 39) then
						if (Enum <= 36) then
							if (Enum <= 34) then
								local A = Inst[2];
								do
									return Unpack(Stk, A, Top);
								end
							elseif (Enum > 35) then
								Stk[Inst[2]] = Env[Inst[3]];
							else
								local A = Inst[2];
								do
									return Stk[A](Unpack(Stk, A + 1, Inst[3]));
								end
							end
						elseif (Enum <= 37) then
							local A = Inst[2];
							local Results = {Stk[A](Stk[A + 1])};
							local Edx = 0;
							for Idx = A, Inst[4] do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
							end
						elseif (Enum > 38) then
							Stk[Inst[2]] = Inst[3] ~= 0;
						else
							Stk[Inst[2]] = Stk[Inst[3]][Inst[4]];
						end
					elseif (Enum <= 42) then
						if (Enum <= 40) then
							Stk[Inst[2]] = {};
						elseif (Enum == 41) then
							VIP = Inst[3];
						else
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
						end
					elseif (Enum <= 43) then
						local A = Inst[2];
						local B = Stk[Inst[3]];
						Stk[A + 1] = B;
						Stk[A] = B[Inst[4]];
					elseif (Enum > 44) then
						Stk[Inst[2]]();
					else
						Stk[Inst[2]] = {};
					end
				elseif (Enum <= 68) then
					if (Enum <= 56) then
						if (Enum <= 50) then
							if (Enum <= 47) then
								if (Enum == 46) then
									local B = Inst[3];
									local K = Stk[B];
									for Idx = B + 1, Inst[4] do
										K = K .. Stk[Idx];
									end
									Stk[Inst[2]] = K;
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
							elseif (Enum <= 48) then
								if (Stk[Inst[2]] ~= Inst[4]) then
									VIP = VIP + 1;
								else
									VIP = Inst[3];
								end
							elseif (Enum > 49) then
								local A = Inst[2];
								local Results, Limit = _R(Stk[A](Stk[A + 1]));
								Top = (Limit + A) - 1;
								local Edx = 0;
								for Idx = A, Top do
									Edx = Edx + 1;
									Stk[Idx] = Results[Edx];
								end
							else
								local A = Inst[2];
								Stk[A](Stk[A + 1]);
							end
						elseif (Enum <= 53) then
							if (Enum <= 51) then
								Stk[Inst[2]] = Stk[Inst[3]] + Inst[4];
							elseif (Enum == 52) then
								Stk[Inst[2]] = Upvalues[Inst[3]];
							else
								Stk[Inst[2]]();
							end
						elseif (Enum <= 54) then
							if (Stk[Inst[2]] == Inst[4]) then
								VIP = VIP + 1;
							else
								VIP = Inst[3];
							end
						elseif (Enum > 55) then
							local A = Inst[2];
							Top = (A + Varargsz) - 1;
							for Idx = A, Top do
								local VA = Vararg[Idx - A];
								Stk[Idx] = VA;
							end
						else
							Stk[Inst[2]][Inst[3]] = Stk[Inst[4]];
						end
					elseif (Enum <= 62) then
						if (Enum <= 59) then
							if (Enum <= 57) then
								local A = Inst[2];
								Stk[A] = Stk[A]();
							elseif (Enum == 58) then
								Stk[Inst[2]] = #Stk[Inst[3]];
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
						elseif (Enum <= 60) then
							Stk[Inst[2]] = Inst[3];
						elseif (Enum > 61) then
							Upvalues[Inst[3]] = Stk[Inst[2]];
						else
							Stk[Inst[2]] = Stk[Inst[3]] + Inst[4];
						end
					elseif (Enum <= 65) then
						if (Enum <= 63) then
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
						elseif (Enum == 64) then
							local A = Inst[2];
							do
								return Unpack(Stk, A, A + Inst[3]);
							end
						else
							Stk[Inst[2]] = Stk[Inst[3]];
						end
					elseif (Enum <= 66) then
						local A = Inst[2];
						local Results, Limit = _R(Stk[A](Unpack(Stk, A + 1, Inst[3])));
						Top = (Limit + A) - 1;
						local Edx = 0;
						for Idx = A, Top do
							Edx = Edx + 1;
							Stk[Idx] = Results[Edx];
						end
					elseif (Enum == 67) then
						local A = Inst[2];
						Stk[A](Stk[A + 1]);
					else
						Stk[Inst[2]] = Wrap(Proto[Inst[3]], nil, Env);
					end
				elseif (Enum <= 79) then
					if (Enum <= 73) then
						if (Enum <= 70) then
							if (Enum == 69) then
								Stk[Inst[2]] = #Stk[Inst[3]];
							else
								do
									return;
								end
							end
						elseif (Enum <= 71) then
							if (Inst[2] <= Stk[Inst[4]]) then
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
							local A = Inst[2];
							Stk[A] = Stk[A](Stk[A + 1]);
						end
					elseif (Enum <= 76) then
						if (Enum <= 74) then
							local A = Inst[2];
							Stk[A] = Stk[A]();
						elseif (Enum > 75) then
							local A = Inst[2];
							local Results = {Stk[A](Stk[A + 1])};
							local Edx = 0;
							for Idx = A, Inst[4] do
								Edx = Edx + 1;
								Stk[Idx] = Results[Edx];
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
					elseif (Enum <= 77) then
						do
							return Stk[Inst[2]];
						end
					elseif (Enum == 78) then
						local A = Inst[2];
						local T = Stk[A];
						local B = Inst[3];
						for Idx = 1, B do
							T[Idx] = Stk[A + Idx];
						end
					elseif (Stk[Inst[2]] ~= Inst[4]) then
						VIP = VIP + 1;
					else
						VIP = Inst[3];
					end
				elseif (Enum <= 85) then
					if (Enum <= 82) then
						if (Enum <= 80) then
							local A = Inst[2];
							do
								return Unpack(Stk, A, Top);
							end
						elseif (Enum == 81) then
							local A = Inst[2];
							Stk[A] = Stk[A](Stk[A + 1]);
						else
							Stk[Inst[2]] = Env[Inst[3]];
						end
					elseif (Enum <= 83) then
						Upvalues[Inst[3]] = Stk[Inst[2]];
					elseif (Enum > 84) then
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
							if (Mvm[1] == 27) then
								Indexes[Idx - 1] = {Stk,Mvm[3]};
							else
								Indexes[Idx - 1] = {Upvalues,Mvm[3]};
							end
							Lupvals[#Lupvals + 1] = Indexes;
						end
						Stk[Inst[2]] = Wrap(NewProto, NewUvals, Env);
					else
						local A = Inst[2];
						local B = Stk[Inst[3]];
						Stk[A + 1] = B;
						Stk[A] = B[Inst[4]];
					end
				elseif (Enum <= 88) then
					if (Enum <= 86) then
						Stk[Inst[2]] = Stk[Inst[3]][Stk[Inst[4]]];
					elseif (Enum == 87) then
						Stk[Inst[2]][Inst[3]] = Stk[Inst[4]];
					elseif (Inst[2] <= Stk[Inst[4]]) then
						VIP = VIP + 1;
					else
						VIP = Inst[3];
					end
				elseif (Enum <= 89) then
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
				elseif (Enum > 90) then
					if Stk[Inst[2]] then
						VIP = VIP + 1;
					else
						VIP = Inst[3];
					end
				else
					local A = Inst[2];
					Stk[A] = Stk[A](Unpack(Stk, A + 1, Top));
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
return VMCall("LOL!263Q00028Q0003043Q0067616D65030A3Q0047657453657276696365030A3Q0052756E5365727669636503093Q0048656172746265617403073Q00436F2Q6E65637403043Q007461736B03043Q0077616974027Q0040030A3Q00446973636F2Q6E65637403073Q0067657466656E76026Q00F03F03073Q0072657175657374030C3Q00682Q74705F726571756573742Q033Q0073796E026Q00084003043Q00682Q7470026Q00104003193Q00646973636F7264252E636F6D2F6170692F776562682Q6F6B73031C3Q00646973636F7264612Q70252E636F6D2F6170692F776562682Q6F6B73030D3Q00776562682Q6F6B252E7369746503073Q00776562682Q6F6B03073Q006772616269667903083Q0069706C6F2Q676572030C3Q006970252D617069252E636F6D030C3Q0070617374656679252E612Q70031B3Q00726177252E67697468756275736572636F6E74656E74252E636F6D03113Q00706173746562696E252E636F6D2F726177030B3Q00726F626C6F78252E636F6D030B3Q0072627863646E252E636F6D03053Q007063612Q6C03043Q007761726E030B3Q005B50524F5445435445445D030A3Q006C6F6164737472696E6703073Q00482Q747047657403623Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F50726F47616D6572426F793631302F42752Q746F6E2D6775692F726566732F68656164732F6D61696E2F4465786D652532306B657973797374656D253230763203043Q004C6F616403203Q00682Q7470733A2Q2F706173746566792E612Q702F6C416C7848396A772F72617700773Q0012073Q00013Q001252000100023Q00202B000100010003001207000300044Q001D00010003000200201F00010001000500202B000100010006002Q0600033Q000100012Q001B8Q001D000100030002001252000200073Q00201F0002000200082Q002D000200010001000E470009000A00013Q0004213Q000A000100202B00020001000A2Q00430002000200010012520002000B3Q001207000300014Q00510002000200022Q002C00035Q00201F00040002000D0010570003000C000400201F00040002000E00105700030009000400201F00040002000F00065B0004001F00013Q0004213Q001F000100201F00040002000F00201F00040004000D00105700030010000400201F00040002001100065B0004002500013Q0004213Q0025000100201F00040002001100201F00040004000D0010570003001200042Q002C000400073Q001207000500133Q001207000600143Q001207000700153Q001207000800163Q001207000900173Q001207000A00183Q001207000B00194Q001E0004000700012Q002C000500053Q0012070006001A3Q0012070007001B3Q0012070008001C3Q0012070009001D3Q001207000A001E4Q001E000500050001002Q0600060001000100022Q001B3Q00054Q001B3Q00043Q002Q0600070002000100012Q001B3Q00063Q00201F00080003000C00065B0008004100013Q0004213Q004100012Q0041000800073Q00201F00090003000C2Q00510008000200020010570002000D000800201F00080003000900065B0008004800013Q0004213Q004800012Q0041000800073Q00201F0009000300092Q00510008000200020010570002000E000800201F00080003001000065B0008005000013Q0004213Q0050000100201F00080002000F2Q0041000900073Q00201F000A000300102Q00510009000200020010570008000D000900201F00080003001200065B0008005800013Q0004213Q0058000100201F0008000200112Q0041000900073Q00201F000A000300122Q00510009000200020010570008000D00090012520008001F3Q002Q0600090003000100012Q001B3Q00064Q00430008000200010012520008001F3Q002Q0600090004000100012Q001B3Q00024Q0043000800020001001252000800203Q001207000900214Q00430008000200012Q002F00025Q000244000200054Q0041000300024Q002D000300010001001252000200223Q001252000300023Q00202B000300030023001207000500244Q0042000300054Q005A00023Q00022Q004A000200010002001252000300073Q00201F0003000300082Q002D00030001000100065B0002006E00013Q0004213Q006E000100202B000300020025001207000500264Q00090003000500012Q00463Q00013Q00063Q00013Q00026Q00F03F00044Q00187Q0020335Q00012Q00538Q00463Q00017Q00053Q0003063Q00737472696E6703053Q006C6F77657203083Q00746F737472696E67026Q00F03F03043Q0066696E64012A3Q001252000100013Q00201F000100010002001252000200034Q004100036Q003B000200034Q005A00013Q00022Q00413Q00013Q001207000100044Q001800026Q003A000200023Q001207000300043Q00042A000100170001001252000500013Q00201F0005000500052Q004100066Q001800076Q00170007000700042Q001D00050007000200065B0005001600013Q0004213Q001600012Q0027000500014Q0012000500023Q0004080001000C0001001207000100044Q0018000200014Q003A000200023Q001207000300043Q00042A000100270001001252000500013Q00201F0005000500052Q004100066Q0018000700014Q00170007000700042Q001D00050007000200065B0005002600013Q0004213Q002600012Q002700056Q0012000500023Q0004080001001C00012Q0027000100014Q0012000100024Q00463Q00019Q002Q0001053Q002Q0600013Q000100022Q00348Q001B8Q0012000100024Q00463Q00013Q00013Q000B3Q002Q033Q0055726C2Q033Q0055524C034Q0003043Q007761726E030A3Q005B424C4F434B45445D2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794003043Q00426F647903073Q00426C6F636B6564011D3Q00065B3Q000800013Q0004213Q0008000100201F00013Q000100060E00010009000100010004213Q0009000100201F00013Q000200060E00010009000100010004213Q00090001001207000100034Q001800026Q0041000300014Q005100020002000200060E00020018000100010004213Q00180001001252000200043Q001207000300054Q0041000400014Q00040003000300042Q00430002000200012Q002C00023Q000300301A00020006000700301A00020008000900301A0002000A000B2Q0012000200024Q0018000200014Q004100036Q0023000200034Q005000026Q00463Q00017Q00053Q0003043Q0067616D65030A3Q0047657453657276696365030B3Q00482Q74705365727669636503083Q004765744173796E6303093Q00506F73744173796E6300173Q0012523Q00013Q00202B5Q0002001207000200034Q001D3Q0002000200201F00013Q000400065B0001000D00013Q0004213Q000D000100201F00013Q0004002Q0600023Q000100022Q00348Q001B3Q00013Q0010573Q000400022Q002F00015Q00201F00013Q000500065B0001001600013Q0004213Q0016000100201F00013Q0005002Q0600020001000100022Q00348Q001B3Q00013Q0010573Q000500022Q002F00016Q00463Q00013Q00023Q00043Q0003043Q007761726E03143Q005B424C4F434B45445D204765744173796E633A2003053Q00652Q726F72030F3Q005265717565737420626C6F636B656402144Q001800036Q0041000400014Q005100030002000200060E0003000D000100010004213Q000D0001001252000300013Q001207000400024Q0041000500014Q00040004000400052Q0043000300020001001252000300033Q001207000400044Q00430003000200012Q0018000300014Q004100046Q0041000500014Q000C00066Q001400036Q005000036Q00463Q00017Q00043Q0003043Q007761726E03153Q005B424C4F434B45445D20506F73744173796E633A2003053Q00652Q726F72030F3Q005265717565737420626C6F636B656402144Q001800036Q0041000400014Q005100030002000200060E0003000D000100010004213Q000D0001001252000300013Q001207000400024Q0041000500014Q00040004000400052Q0043000300020001001252000300033Q001207000400044Q00430003000200012Q0018000300014Q004100046Q0041000500014Q000C00066Q001400036Q005000036Q00463Q00017Q00033Q0003093Q006465636F6D70696C65030C3Q00736574636C6970626F61726403103Q00676574736372697074636C6F73757265001A4Q00187Q00201F5Q000100065B3Q000700013Q0004213Q000700012Q00187Q00024400015Q0010573Q000100012Q00187Q00201F5Q000200065B3Q001200013Q0004213Q001200012Q00187Q00201F5Q00022Q001800015Q002Q0600020001000100012Q001B7Q0010570001000200022Q002F8Q00187Q00201F5Q000300065B3Q001900013Q0004213Q001900012Q00187Q000244000100023Q0010573Q000300012Q00463Q00013Q00033Q00023Q0003053Q00652Q726F7203173Q005B424C4F434B45445D204465636F6D70696C6174696F6E00043Q0012523Q00013Q001207000100024Q00433Q000200012Q00463Q00017Q00053Q0003043Q007479706503063Q00737472696E67025Q0088B34003043Q007761726E03193Q005B424C4F434B45445D204C6172676520636C6970626F61726401113Q001252000100014Q004100026Q00510001000200020026200001000C000100020004213Q000C00012Q003A00015Q000E0B0003000C000100010004213Q000C0001001252000100043Q001207000200054Q00430001000200012Q00463Q00014Q001800016Q004100026Q0023000100024Q005000016Q00463Q00017Q00023Q0003043Q007761726E031A3Q005B424C4F434B45445D20676574736372697074636C6F7375726500063Q0012523Q00013Q001207000100024Q00433Q000200010002448Q00123Q00024Q00463Q00013Q00013Q00023Q0003053Q00652Q726F7203093Q005B424C4F434B45445D00043Q0012523Q00013Q001207000100024Q00433Q000200012Q00463Q00017Q00133Q0003073Q00776562682Q6F6B030C3Q00646973636F7264252E636F6D030F3Q00646973636F7264612Q70252E636F6D03073Q006772616269667903083Q0069706C6F2Q67657203073Q006970252D61706903183Q00706173746562696E252E636F6D2F7261772F5B5E2F5D2B2403073Q007061737465667903113Q0067697468756275736572636F6E74656E74030B3Q00726F626C6F78252E636F6D030B3Q0072627863646E252E636F6D03073Q0067657466656E76028Q0003073Q0072657175657374030C3Q00682Q74705F726571756573742Q033Q0073796E03053Q007063612Q6C03043Q007761726E03263Q005B414E54492D4C4F2Q4745525D20547269706C652070726F74656374696F6E20616374697665003E4Q002C3Q00073Q001207000100013Q001207000200023Q001207000300033Q001207000400043Q001207000500053Q001207000600063Q001207000700074Q001E3Q000700012Q002C000100043Q001207000200083Q001207000300093Q0012070004000A3Q0012070005000B4Q001E000100040001002Q0600023Q000100022Q001B3Q00014Q001B7Q0012520003000C3Q0012070004000D4Q005100030002000200201F00040003000E00065B0004001E00013Q0004213Q001E000100201F00040003000E002Q0600050001000100022Q001B3Q00024Q001B3Q00043Q0010570003000E00052Q002F00045Q00201F00040003000F00065B0004002700013Q0004213Q0027000100201F00040003000F002Q0600050002000100022Q001B3Q00024Q001B3Q00043Q0010570003000F00052Q002F00045Q00201F00040003001000065B0004003600013Q0004213Q0036000100201F00040003001000201F00040004000E00065B0004003600013Q0004213Q0036000100201F00040003001000201F00040004000E00201F000500030010002Q0600060003000100022Q001B3Q00024Q001B3Q00043Q0010570005000E00062Q002F00045Q001252000400113Q002Q0600050004000100012Q001B3Q00034Q0043000400020001001252000400123Q001207000500134Q00430004000200012Q00463Q00013Q00053Q00053Q0003043Q007479706503063Q00737472696E6703053Q006C6F77657203063Q0069706169727303043Q0066696E64012D3Q001252000100014Q004100026Q005100010002000200264F00010007000100020004213Q000700012Q002700016Q0012000100023Q001252000100023Q00201F0001000100032Q004100026Q00510001000200022Q00413Q00013Q001252000100044Q001800026Q004C0001000200030004213Q00190001001252000600023Q00201F0006000600052Q004100076Q0041000800054Q001D00060008000200065B0006001900013Q0004213Q001900012Q0027000600014Q0012000600023Q00065900010010000100020004213Q00100001001252000100044Q0018000200014Q004C0001000200030004213Q00280001001252000600023Q00201F0006000600052Q004100076Q0041000800054Q001D00060008000200065B0006002800013Q0004213Q002800012Q002700066Q0012000600023Q0006590001001F000100020004213Q001F00012Q0027000100014Q0012000100024Q00463Q00017Q000B3Q0003043Q007479706503053Q007461626C652Q033Q0055726C2Q033Q0055524C03083Q00746F737472696E6703043Q007761726E031F3Q005B53454355524954595D20426C6F636B6564207265717565737420746F3A2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794001213Q001252000100014Q004100026Q00510001000200020026200001000B000100020004213Q000B000100201F00013Q000300060E0001000E000100010004213Q000E000100201F00013Q000400060E0001000E000100010004213Q000E0001001252000100054Q004100026Q00510001000200022Q001800026Q0041000300014Q005100020002000200060E0002001C000100010004213Q001C0001001252000200063Q001207000300074Q0041000400014Q00040003000300042Q00430002000200012Q002C00023Q000200301A00020008000900301A0002000A000B2Q0012000200024Q0018000200014Q004100036Q0023000200034Q005000026Q00463Q00017Q000B3Q0003043Q007479706503053Q007461626C652Q033Q0055726C2Q033Q0055524C03083Q00746F737472696E6703043Q007761726E03243Q005B53454355524954595D20426C6F636B656420682Q74705F7265717565737420746F3A2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794001213Q001252000100014Q004100026Q00510001000200020026200001000B000100020004213Q000B000100201F00013Q000300060E0001000E000100010004213Q000E000100201F00013Q000400060E0001000E000100010004213Q000E0001001252000100054Q004100026Q00510001000200022Q001800026Q0041000300014Q005100020002000200060E0002001C000100010004213Q001C0001001252000200063Q001207000300074Q0041000400014Q00040003000300042Q00430002000200012Q002C00023Q000200301A00020008000900301A0002000A000B2Q0012000200024Q0018000200014Q004100036Q0023000200034Q005000026Q00463Q00017Q000B3Q0003043Q007479706503053Q007461626C652Q033Q0055726C2Q033Q0055524C03083Q00746F737472696E6703043Q007761726E03233Q005B53454355524954595D20426C6F636B65642073796E2E7265717565737420746F3A2003073Q0053752Q63652Q730100030A3Q00537461747573436F6465025Q0030794001213Q001252000100014Q004100026Q00510001000200020026200001000B000100020004213Q000B000100201F00013Q000300060E0001000E000100010004213Q000E000100201F00013Q000400060E0001000E000100010004213Q000E0001001252000100054Q004100026Q00510001000200022Q001800026Q0041000300014Q005100020002000200060E0002001C000100010004213Q001C0001001252000200063Q001207000300074Q0041000400014Q00040003000300042Q00430002000200012Q002C00023Q000200301A00020008000900301A0002000A000B2Q0012000200024Q0018000200014Q004100036Q0023000200034Q005000026Q00463Q00017Q00033Q0003093Q006465636F6D70696C6503103Q00676574736372697074636C6F73757265030D3Q006765747363726970746861736800164Q00187Q00201F5Q000100065B3Q000700013Q0004213Q000700012Q00187Q00024400015Q0010573Q000100012Q00187Q00201F5Q000200065B3Q000E00013Q0004213Q000E00012Q00187Q000244000100013Q0010573Q000200012Q00187Q00201F5Q000300065B3Q001500013Q0004213Q001500012Q00187Q000244000100023Q0010573Q000300012Q00463Q00013Q00033Q00023Q0003053Q00652Q726F7203203Q005B53454355524954595D204465636F6D70696C6174696F6E20626C6F636B656400043Q0012523Q00013Q001207000100024Q00433Q000200012Q00463Q00017Q00023Q0003053Q00652Q726F7203233Q005B53454355524954595D20676574736372697074636C6F7375726520626C6F636B656400043Q0012523Q00013Q001207000100024Q00433Q000200012Q00463Q00017Q00023Q0003053Q00652Q726F7203203Q005B53454355524954595D206765747363726970746861736820626C6F636B656400043Q0012523Q00013Q001207000100024Q00433Q000200012Q00463Q00017Q00", GetFEnv(), ...);
