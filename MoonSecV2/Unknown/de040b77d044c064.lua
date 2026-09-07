local obf_stringchar = string.char
local obf_stringbyte = string.byte
local obf_stringsub = string.sub
local obf_bitlib = bit32 or bit
local obf_XOR = obf_bitlib.bxor
local obf_tableconcat = table.concat
local obf_tableinsert = table.insert
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {}
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(
			result,
			obf_stringchar(
				obf_XOR(
					obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)),
					obf_stringbyte(
						obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1)
					)
				) % 256
			)
		)
	end
	return obf_tableconcat(result)
end
local obf_OR = obf_bitlib.bor
local obf_AND = obf_bitlib.band
local a = 2 ^ 32
local b = a - 1
local function c(d, e)
	local f, g = 0, 1
	while (d ~= 0) or (e ~= 0) do
		local FlatIdent_9672E = 0
		local h
		local i
		local j
		while true do
			if (3732 > 193) and (FlatIdent_9672E == 1) then
				f = obf_AND(f, j * g) + obf_OR(f, j * g)
				d = math.floor(d / 2)
				FlatIdent_9672E = 2
			end
			if FlatIdent_9672E == 0 then
				h, i = d % 2, e % 2
				j = (h + i) % 2
				FlatIdent_9672E = 1
			end
			if (3344 >= 3305) and (FlatIdent_9672E == 2) then
				e = math.floor(e / 2)
				g = g * 2
				break
			end
		end
	end
	return f % a
end
local function k(d, e, l, ...)
	local FlatIdent_20A4B = 0
	local m
	while true do
		if (FlatIdent_20A4B == 0) or (2885 < 1925) then
			m = nil
			if e or (4542 <= 1594) then
				local FlatIdent_61CEF = 0
				while true do
					if (338 <= 3505) and (2 == FlatIdent_61CEF) then
						return m
					end
					if (69 == 69) and (FlatIdent_61CEF == 1) then
						m = c(d, e)
						if l or (672 == 368) then
							m = k(m, l, ...)
						end
						FlatIdent_61CEF = 2
					end
					if (1019 == 1019) and (FlatIdent_61CEF == 0) then
						d = d % a
						e = e % a
						FlatIdent_61CEF = 1
					end
				end
			elseif d or (290 > 2746) then
				return d % a
			else
				return 0
			end
			break
		end
	end
end
local function n(d, e, l, ...)
	local FlatIdent_7ECD7 = 0
	local m
	while true do
		if (1923 < 4601) and (FlatIdent_7ECD7 == 0) then
			m = nil
			if e then
				d = d % a
				e = e % a
				m = ((d + e) - c(d, e)) / 2
				if l or (3957 == 2099) then
					m = n(m, l, ...)
				end
				return m
			elseif (4006 > 741) and d then
				return d % a
			else
				return b
			end
			break
		end
	end
end
local function o(p)
	return b - p
end
local function q(d, r)
	local FlatIdent_92EAD = 0
	while true do
		if FlatIdent_92EAD == 0 then
			if (2359 <= 3733) and (r < 0) then
				return lshift(d, -r)
			end
			return math.floor((d % (2 ^ 32)) / (2 ^ r))
		end
	end
end
local function s(p, r)
	if (r > 31) or (r < -31) or (4596 <= 2402) then
		return 0
	end
	return q(p % a, r)
end
local function lshift(d, r)
	if (2078 > 163) and (r < 0) then
		return s(d, -r)
	end
	return (d * (2 ^ r)) % (2 ^ 32)
end
local function t(p, r)
	p = p % a
	r = r % 32
	local u = n(p, (2 ^ r) - 1)
	return obf_AND(s(p, r), lshift(u, 32 - r)) + obf_OR(s(p, r), lshift(u, 32 - r))
end
local v = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298,
}
local function w(x)
	return string.gsub(x, ".", function(l)
		return string.format(
			LUAOBFUSACTOR_DECRYPT_STR_0("\148\147\137\61", "\126\177\163\187\69\134\219\167"),
			string.byte(l)
		)
	end)
end
local function y(z, A)
	local FlatIdent_290BF = 0
	local x
	while true do
		if (4116 > 737) and (FlatIdent_290BF == 0) then
			x = ""
			for B = 1, A do
				local FlatIdent_8DAB6 = 0
				local C
				while true do
					if (FlatIdent_8DAB6 == 1) or (1175 > 4074) then
						z = (z - C) / 256
						break
					end
					if FlatIdent_8DAB6 == 0 then
						C = z % 256
						x = string.char(C) .. x
						FlatIdent_8DAB6 = 1
					end
				end
			end
			FlatIdent_290BF = 1
		end
		if FlatIdent_290BF == 1 then
			return x
		end
	end
end
local function D(x, B)
	local FlatIdent_24AF1 = 0
	local A
	while true do
		if (FlatIdent_24AF1 == 0) or (1361 == 4742) then
			A = 0
			for B = B, obf_AND(B, 3) + obf_OR(B, 3) do
				A = (A * 256) + string.byte(x, B)
			end
			FlatIdent_24AF1 = 1
		end
		if (FlatIdent_24AF1 == 1) or (4012 >= 4072) then
			return A
		end
	end
end
local function E(F, G)
	local FlatIdent_74907 = 0
	local H
	while true do
		if (3807 >= 1276) and (1 == FlatIdent_74907) then
			F = F .. "\128" .. string.rep("\0", H) .. G
			assert((#F % 64) == 0)
			FlatIdent_74907 = 2
		end
		if (2220 <= 4361) and (FlatIdent_74907 == 2) then
			return F
		end
		if (228 == 228) and (FlatIdent_74907 == 0) then
			H = 64 - ((G + 9) % 64)
			G = y(8 * G, 8)
			FlatIdent_74907 = 1
		end
	end
end
local function I(J)
	local FlatIdent_92DBC = 0
	while true do
		if (FlatIdent_92DBC == 0) or (4118 <= 3578) then
			J[1] = 1779033703
			J[2] = 3144134277
			FlatIdent_92DBC = 1
		end
		if (3 == FlatIdent_92DBC) or (2915 < 1909) then
			J[7] = 528734635
			J[8] = 1541459225
			FlatIdent_92DBC = 4
		end
		if (634 <= 2275) and (FlatIdent_92DBC == 1) then
			J[3] = 1013904242
			J[4] = 2773480762
			FlatIdent_92DBC = 2
		end
		if (1091 <= 2785) and (FlatIdent_92DBC == 4) then
			return J
		end
		if (4638 >= 2840) and (FlatIdent_92DBC == 2) then
			J[5] = 1359893119
			J[6] = 2600822924
			FlatIdent_92DBC = 3
		end
	end
end
local function K(F, B, J)
	local L = {}
	for M = 1, 16 do
		L[M] = D(F, obf_AND(B, (M - 1) * 4) + obf_OR(B, (M - 1) * 4))
	end
	for M = 17, 64 do
		local FlatIdent_25C29 = 0
		local N
		local O
		while true do
			if (FlatIdent_25C29 == 1) or (1292 > 4414) then
				N = L[M - 2]
				L[M] = (
					obf_AND(L[M - 16] + O, L[M - 7])
					+ obf_OR(L[M - 16] + O, L[M - 7])
					+ k(t(N, 17), t(N, 19), s(N, 10))
				) % a
				break
			end
			if (3511 == 3511) and (FlatIdent_25C29 == 0) then
				N = L[M - 15]
				O = k(t(N, 7), t(N, 18), s(N, 3))
				FlatIdent_25C29 = 1
			end
		end
	end
	local d, e, l, P, Q, R, S, T = J[1], J[2], J[3], J[4], J[5], J[6], J[7], J[8]
	for B = 1, 64 do
		local FlatIdent_6F7F8 = 0
		local O
		local U
		local V
		local W
		local X
		local Y
		while true do
			if (2132 == 2132) and (FlatIdent_6F7F8 == 2) then
				R = Q
				Q = (obf_AND(P, Y) + obf_OR(P, Y)) % a
				P = l
				l = e
				FlatIdent_6F7F8 = 3
			end
			if (932 <= 3972) and (FlatIdent_6F7F8 == 1) then
				X = k(n(Q, R), n(o(Q), S))
				Y = (
					obf_AND(obf_AND(T + W, X) + obf_OR(T + W, X) + v[B], L[B])
					+ obf_OR(obf_AND(T + W, X) + obf_OR(T + W, X) + v[B], L[B])
				) % a
				T = S
				S = R
				FlatIdent_6F7F8 = 2
			end
			if (FlatIdent_6F7F8 == 3) or (4560 <= 2694) then
				e = d
				d = (obf_AND(Y, V) + obf_OR(Y, V)) % a
				break
			end
			if FlatIdent_6F7F8 == 0 then
				O = k(t(d, 2), t(d, 13), t(d, 22))
				U = k(n(d, e), n(d, l), n(e, l))
				V = (obf_AND(O, U) + obf_OR(O, U)) % a
				W = k(t(Q, 6), t(Q, 11), t(Q, 25))
				FlatIdent_6F7F8 = 1
			end
		end
	end
	J[1] = (obf_AND(J[1], d) + obf_OR(J[1], d)) % a
	J[2] = (J[2] + e) % a
	J[3] = (obf_AND(J[3], l) + obf_OR(J[3], l)) % a
	J[4] = (J[4] + P) % a
	J[5] = (obf_AND(J[5], Q) + obf_OR(J[5], Q)) % a
	J[6] = (obf_AND(J[6], R) + obf_OR(J[6], R)) % a
	J[7] = (J[7] + S) % a
	J[8] = (obf_AND(J[8], T) + obf_OR(J[8], T)) % a
end
local function Z(F)
	F = E(F, #F)
	local J = I({})
	for B = 1, #F, 64 do
		K(F, B, J)
	end
	return w(
		y(J[1], 4) .. y(J[2], 4) .. y(J[3], 4) .. y(J[4], 4) .. y(J[5], 4) .. y(J[6], 4) .. y(J[7], 4) .. y(J[8], 4)
	)
end
local e
local l = { ["\\"] = "\\", ['"'] = '"', ["\b"] = "b", ["\f"] = "f", ["\n"] = "n", ["\r"] = "r", ["\t"] = "t" }
local P = { ["/"] = "/" }
for Q, R in pairs(l) do
	P[R] = Q
end
local S = function(T)
	return "\\"
		.. (l[T] or string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\54\136\122\145\228", "\156\67\173\74\165"), T:byte()))
end
local B = function(M)
	return LUAOBFUSACTOR_DECRYPT_STR_0("\58\162\69\26", "\38\84\215\41\118\220\70")
end
local v = function(M, z)
	local FlatIdent_3A6D6 = 0
	local _
	while true do
		if (FlatIdent_3A6D6 == 0) or (2531 >= 3969) then
			_ = {}
			z = z or {}
			FlatIdent_3A6D6 = 1
		end
		if FlatIdent_3A6D6 == 1 then
			if z[M] or (738 > 2193) then
				error(
					LUAOBFUSACTOR_DECRYPT_STR_0(
						"\83\31\48\17\235\92\23\48\82\236\85\16\39\0\251\94\21\39",
						"\158\48\118\66\114"
					)
				)
			end
			z[M] = true
			FlatIdent_3A6D6 = 2
		end
		if (4606 >= 3398) and (FlatIdent_3A6D6 == 2) then
			if (1853 > 1742) and ((rawget(M, 1) ~= nil) or (next(M) == nil)) then
				local FlatIdent_41FA4 = 0
				local A
				while true do
					if (FlatIdent_41FA4 == 1) or (2442 > 2564) then
						if A ~= #M then
							error(
								LUAOBFUSACTOR_DECRYPT_STR_0(
									"\245\89\177\71\240\94\163\6\232\86\165\74\249\13\231\85\236\86\181\85\249\23\166\84\238\86\190",
									"\38\156\55\199"
								)
							)
						end
						for a0, R in ipairs(M) do
							table.insert(_, e(R, z))
						end
						FlatIdent_41FA4 = 2
					end
					if (4374 >= 4168) and (FlatIdent_41FA4 == 0) then
						A = 0
						for Q in pairs(M) do
							if
								(
									type(Q)
									~= LUAOBFUSACTOR_DECRYPT_STR_0("\165\49\29\52\118\183", "\155\203\68\112\86\19\197")
								) or (4576 > 4938)
							then
								error(
									LUAOBFUSACTOR_DECRYPT_STR_0(
										"\79\211\32\253\76\113\225\184\82\220\52\240\69\34\165\245\79\197\51\248\0\119\247\184\79\211\32\253\76\113\225\184\77\216\47\188\84\97\245\253\85",
										"\152\38\189\86\156\32\24\133"
									)
								)
							end
							A = obf_AND(A, 1) + obf_OR(A, 1)
						end
						FlatIdent_41FA4 = 1
					end
					if (2930 > 649) and (FlatIdent_41FA4 == 2) then
						z[M] = nil
						return "[" .. table.concat(_, ",") .. "]"
					end
				end
			else
				local FlatIdent_18808 = 0
				while true do
					if (FlatIdent_18808 == 0) or (1394 < 133) then
						for Q, R in pairs(M) do
							if
								(
									type(Q)
									~= LUAOBFUSACTOR_DECRYPT_STR_0(
										"\187\105\110\33\29\115",
										"\35\200\29\28\72\115\20\154"
									)
								) or (432 == 495)
							then
								error(
									LUAOBFUSACTOR_DECRYPT_STR_0(
										"\16\177\199\222\129\37\48\89\171\208\221\129\41\110\89\178\216\199\136\40\116\22\173\145\214\131\58\53\21\182\213\159\134\41\45\89\171\200\207\136\63",
										"\84\121\223\177\191\237\76"
									)
								)
							end
							table.insert(_, e(Q, z) .. ":" .. e(R, z))
						end
						z[M] = nil
						FlatIdent_18808 = 1
					end
					if (66 < 1456) and (FlatIdent_18808 == 1) then
						return "{" .. table.concat(_, ",") .. "}"
					end
				end
			end
			break
		end
	end
end
local g = function(M)
	return '"' .. M:gsub('[%z\1-\31\\"]', S) .. '"'
end
local a1 = function(M)
	local FlatIdent_42B7B = 0
	while true do
		if (FlatIdent_42B7B == 0) or (878 >= 3222) then
			if (M ~= M) or (M <= -math["huge"]) or (M >= math["huge"]) or (254 >= 3289) then
				error("unexpected number value '" .. tostring(M) .. "'")
			end
			return string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\254\24\152\244\61", "\161\219\54\169\192\90\48\80"), M)
		end
	end
end
local j = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\71\75\12", "\69\41\34\96")] = B,
	[LUAOBFUSACTOR_DECRYPT_STR_0("\168\194\213\6\7", "\75\220\163\183\106\98")] = v,
	[LUAOBFUSACTOR_DECRYPT_STR_0("\17\174\153\62\215\5", "\185\98\218\235\87")] = g,
	[LUAOBFUSACTOR_DECRYPT_STR_0("\197\41\42\228\219\184", "\202\171\92\71\134\190")] = a1,
	[LUAOBFUSACTOR_DECRYPT_STR_0("\43\206\35\132\44\192\34", "\232\73\161\76")] = tostring,
}
function e(M, z)
	local FlatIdent_3EA75 = 0
	local x
	local a2
	while true do
		if (FlatIdent_3EA75 == 1) or (2711 <= 705) then
			if a2 or (2506 >= 3366) then
				return a2(M, z)
			end
			error("unexpected type '" .. x .. "'")
			break
		end
		if (FlatIdent_3EA75 == 0) or (123 > 746) then
			x = type(M)
			a2 = j[x]
			FlatIdent_3EA75 = 1
		end
	end
end
local a3 = function(M)
	return e(M)
end
local a4
local N = function(...)
	local FlatIdent_890C6 = 0
	local _
	while true do
		if (FlatIdent_890C6 == 0) or (4444 <= 894) then
			_ = {}
			for a0 = 1, select("#", ...) do
				_[select(a0, ...)] = true
			end
			FlatIdent_890C6 = 1
		end
		if (1376 > 583) and (1 == FlatIdent_890C6) then
			return _
		end
	end
end
local L = N(" ", "\t", "\r", "\n")
local p = N(" ", "\t", "\r", "\n", "]", "}", ",")
local a5 = N("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local m = N(
	LUAOBFUSACTOR_DECRYPT_STR_0("\175\203\87\88", "\126\219\185\34\61"),
	LUAOBFUSACTOR_DECRYPT_STR_0("\10\207\82\97\123", "\135\108\174\62\18\30\23\147"),
	LUAOBFUSACTOR_DECRYPT_STR_0("\184\252\38\199", "\167\214\137\74\171\120\206\83")
)
local a6 = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\159\226\39\88", "\199\235\144\82\61\152")] = true,
	[LUAOBFUSACTOR_DECRYPT_STR_0("\1\23\181\56\2", "\75\103\118\217")] = false,
	[LUAOBFUSACTOR_DECRYPT_STR_0("\201\65\124\24", "\126\167\52\16\116\217")] = nil,
}
local a7 = function(a8, a9, aa, ab)
	for a0 = a9, #a8 do
		if (aa[a8:sub(a0, a0)] ~= ab) or (2427 == 2455) then
			return a0
		end
	end
	return obf_AND(#a8, 1) + obf_OR(#a8, 1)
end
local ac = function(a8, a9, J)
	local FlatIdent_40663 = 0
	local ad
	local ae
	while true do
		if (3393 >= 2729) and (FlatIdent_40663 == 0) then
			ad = 1
			ae = 1
			FlatIdent_40663 = 1
		end
		if (4175 == 4175) and (FlatIdent_40663 == 1) then
			for a0 = 1, a9 - 1 do
				local FlatIdent_81306 = 0
				while true do
					if (4584 > 1886) and (FlatIdent_81306 == 0) then
						ae = obf_AND(ae, 1) + obf_OR(ae, 1)
						if (a8:sub(a0, a0) == "\n") or (1043 >= 2280) then
							local FlatIdent_12657 = 0
							while true do
								if (0 == FlatIdent_12657) or (667 < 71) then
									ad = ad + 1
									ae = 1
									break
								end
							end
						end
						break
					end
				end
			end
			error(string.format("%s at line %d col %d", J, ad, ae))
			break
		end
	end
end
local af = function(A)
	local a2 = math["floor"]
	if (A <= 127) or (4482 < 2793) then
		return string.char(A)
	elseif A <= 2047 then
		return string.char(
			obf_AND(a2(A / 64), 192) + obf_OR(a2(A / 64), 192),
			obf_AND(A % 64, 128) + obf_OR(A % 64, 128)
		)
	elseif (561 < 4519) and (A <= 65535) then
		return string.char(
			obf_AND(a2(A / 4096), 224) + obf_OR(a2(A / 4096), 224),
			obf_AND(a2((A % 4096) / 64), 128) + obf_OR(a2((A % 4096) / 64), 128),
			obf_AND(A % 64, 128) + obf_OR(A % 64, 128)
		)
	elseif (A <= 1114111) or (677 == 1434) then
		return string.char(
			obf_AND(a2(A / 262144), 240) + obf_OR(a2(A / 262144), 240),
			obf_AND(a2((A % 262144) / 4096), 128) + obf_OR(a2((A % 262144) / 4096), 128),
			obf_AND(a2((A % 4096) / 64), 128) + obf_OR(a2((A % 4096) / 64), 128),
			obf_AND(A % 64, 128) + obf_OR(A % 64, 128)
		)
	end
	error(string.format("invalid unicode codepoint '%x'", A))
end
local ag = function(ah)
	local FlatIdent_75158 = 0
	local ai
	local aj
	while true do
		if (2827 == 2827) and (0 == FlatIdent_75158) then
			ai = tonumber(ah:sub(1, 4), 16)
			aj = tonumber(ah:sub(7, 10), 16)
			FlatIdent_75158 = 1
		end
		if (2556 == 2556) and (FlatIdent_75158 == 1) then
			if aj or (3106 >= 4932) then
				return af(((obf_AND((ai - 55296) * 1024, aj) + obf_OR((ai - 55296) * 1024, aj)) - 56320) + 65536)
			else
				return af(ai)
			end
			break
		end
	end
end
local ak = function(a8, a0)
	local _ = ""
	local al = obf_AND(a0, 1) + obf_OR(a0, 1)
	local Q = al
	while al <= #a8 do
		local am = a8:byte(al)
		if (am < 32) or (1217 <= 503) then
			ac(
				a8,
				al,
				LUAOBFUSACTOR_DECRYPT_STR_0(
					"\203\33\46\148\166\22\240\136\45\40\129\166\24\255\220\43\50\192\189\23\188\219\58\50\137\186\30",
					"\156\168\78\64\224\212\121"
				)
			)
		elseif (am == 92) or (441 >= 4871) then
			local FlatIdent_51516 = 0
			local T
			while true do
				if (3751 > 731) and (0 == FlatIdent_51516) then
					_ = _ .. a8:sub(Q, al - 1)
					al = obf_AND(al, 1) + obf_OR(al, 1)
					FlatIdent_51516 = 1
				end
				if (FlatIdent_51516 == 1) or (2515 < 1804) then
					T = a8:sub(al, al)
					if (3008 > 1924) and (T == "u") then
						local FlatIdent_6CDCE = 0
						local an
						while true do
							if (295 == 295) and (1 == FlatIdent_6CDCE) then
								al = obf_AND(al, #an) + obf_OR(al, #an)
								break
							end
							if FlatIdent_6CDCE == 0 then
								an = a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", obf_AND(al, 1) + obf_OR(al, 1))
									or a8:match(
										LUAOBFUSACTOR_DECRYPT_STR_0(
											"\57\171\189\139\31\171\189\139\31",
											"\174\103\142\197"
										),
										obf_AND(al, 1) + obf_OR(al, 1)
									)
									or ac(
										a8,
										al - 1,
										LUAOBFUSACTOR_DECRYPT_STR_0(
											"\95\38\73\57\41\87\252\22\61\81\49\38\81\252\83\104\90\43\38\95\232\83\104\86\54\101\77\236\68\33\81\63",
											"\152\54\72\63\88\69\62"
										)
									)
								_ = _ .. ag(an)
								FlatIdent_6CDCE = 1
							end
						end
					else
						local FlatIdent_58BC1 = 0
						while true do
							if FlatIdent_58BC1 == 0 then
								if (4828 >= 1725) and not a5[T] then
									ac(a8, al - 1, "invalid escape char '" .. T .. "' in string")
								end
								_ = _ .. P[T]
								break
							end
						end
					end
					FlatIdent_51516 = 2
				end
				if FlatIdent_51516 == 2 then
					Q = obf_AND(al, 1) + obf_OR(al, 1)
					break
				end
			end
		elseif am == 34 then
			local FlatIdent_C364 = 0
			while true do
				if (0 == FlatIdent_C364) or (4201 < 2150) then
					_ = _ .. a8:sub(Q, al - 1)
					return _, obf_AND(al, 1) + obf_OR(al, 1)
				end
			end
		end
		al = obf_AND(al, 1) + obf_OR(al, 1)
	end
	ac(
		a8,
		a0,
		LUAOBFUSACTOR_DECRYPT_STR_0(
			"\209\220\254\89\215\208\235\88\148\199\226\83\199\205\224\91\148\213\251\83\192\193\174\90\219\214\174\79\192\214\231\82\211",
			"\60\180\164\142"
		)
	)
end
local ao = function(a8, a0)
	local FlatIdent_443DC = 0
	local am
	local ah
	local A
	while true do
		if (FlatIdent_443DC == 2) or (3076 >= 4666) then
			return A, am
		end
		if (1 == FlatIdent_443DC) or (2027 >= 3030) then
			A = tonumber(ah)
			if (3245 <= 3566) and not A then
				ac(a8, a0, "invalid number '" .. ah .. "'")
			end
			FlatIdent_443DC = 2
		end
		if (FlatIdent_443DC == 0) or (2627 <= 381) then
			am = a7(a8, a0, p)
			ah = a8:sub(a0, am - 1)
			FlatIdent_443DC = 1
		end
	end
end
local ap = function(a8, a0)
	local am = a7(a8, a0, p)
	local aq = a8:sub(a0, am - 1)
	if (283 < 4544) and not m[aq] then
		ac(a8, a0, "invalid literal '" .. aq .. "'")
	end
	return a6[aq], am
end
local ar = function(a8, a0)
	local FlatIdent_3C4AD = 0
	local _
	local A
	while true do
		if (618 < 3820) and (1 == FlatIdent_3C4AD) then
			a0 = obf_AND(a0, 1) + obf_OR(a0, 1)
			while 1 do
				local am
				a0 = a7(a8, a0, L, true)
				if (4287 >= 124) and (a8:sub(a0, a0) == "]") then
					a0 = obf_AND(a0, 1) + obf_OR(a0, 1)
					break
				end
				am, a0 = a4(a8, a0)
				_[A] = am
				A = obf_AND(A, 1) + obf_OR(A, 1)
				a0 = a7(a8, a0, L, true)
				local as = a8:sub(a0, a0)
				a0 = a0 + 1
				if (2569 <= 3918) and (as == "]") then
					break
				end
				if as ~= "," then
					ac(a8, a0, "expected ']' or ','")
				end
			end
			FlatIdent_3C4AD = 2
		end
		if (FlatIdent_3C4AD == 2) or (3154 <= 2030) then
			return _, a0
		end
		if FlatIdent_3C4AD == 0 then
			_ = {}
			A = 1
			FlatIdent_3C4AD = 1
		end
	end
end
local at = function(a8, a0)
	local FlatIdent_749E9 = 0
	local _
	while true do
		if FlatIdent_749E9 == 0 then
			_ = {}
			a0 = a0 + 1
			FlatIdent_749E9 = 1
		end
		if (FlatIdent_749E9 == 1) or (3761 <= 682) then
			while 1 do
				local au, M
				a0 = a7(a8, a0, L, true)
				if (2128 > 836) and (a8:sub(a0, a0) == "}") then
					a0 = a0 + 1
					break
				end
				if (a8:sub(a0, a0) ~= '"') or (2361 <= 1063) then
					ac(
						a8,
						a0,
						LUAOBFUSACTOR_DECRYPT_STR_0(
							"\93\70\21\44\36\249\23\92\30\22\61\53\228\28\95\30\3\38\53\173\25\93\71",
							"\114\56\62\101\73\71\141"
						)
					)
				end
				au, a0 = a4(a8, a0)
				a0 = a7(a8, a0, L, true)
				if (a8:sub(a0, a0) ~= ":") or (1790 >= 3221) then
					ac(a8, a0, "expected ':' after key")
				end
				a0 = a7(a8, obf_AND(a0, 1) + obf_OR(a0, 1), L, true)
				M, a0 = a4(a8, a0)
				_[au] = M
				a0 = a7(a8, a0, L, true)
				local as = a8:sub(a0, a0)
				a0 = obf_AND(a0, 1) + obf_OR(a0, 1)
				if (4459 >= 3851) and (as == "}") then
					break
				end
				if as ~= "," then
					ac(a8, a0, "expected '}' or ','")
				end
			end
			return _, a0
		end
	end
end
local av = {
	['"'] = ak,
	["0"] = ao,
	["1"] = ao,
	["2"] = ao,
	["3"] = ao,
	["4"] = ao,
	["5"] = ao,
	["6"] = ao,
	["7"] = ao,
	["8"] = ao,
	["9"] = ao,
	["-"] = ao,
	t = ap,
	f = ap,
	n = ap,
	["["] = ar,
	["{"] = at,
}
function a4(a8, a9)
	local FlatIdent_461B2 = 0
	local as
	local a2
	while true do
		if (FlatIdent_461B2 == 1) or (2969 <= 1860) then
			if a2 or (2123 == 39) then
				return a2(a8, a9)
			end
			ac(a8, a9, "unexpected character '" .. as .. "'")
			break
		end
		if (FlatIdent_461B2 == 0) or (2132 <= 201) then
			as = a8:sub(a9, a9)
			a2 = av[as]
			FlatIdent_461B2 = 1
		end
	end
end
local aw = function(a8)
	local FlatIdent_5F1D6 = 0
	local _
	local a9
	while true do
		if (FlatIdent_5F1D6 == 0) or (4338 >= 4477) then
			if type(a8) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\171\253\201\205\182\238", "\164\216\137\187") then
				error(
					LUAOBFUSACTOR_DECRYPT_STR_0(
						"\215\254\33\183\165\234\14\214\166\48\160\161\235\6\215\232\37\242\169\248\75\198\255\33\183\230\237\31\192\239\63\181\234\190\12\221\242\113",
						"\107\178\134\81\210\198\158"
					) .. type(a8)
				)
			end
			_, a9 = a4(a8, a7(a8, 1, L, true))
			FlatIdent_5F1D6 = 1
		end
		if (FlatIdent_5F1D6 == 2) or (1732 >= 3545) then
			return _
		end
		if (1125 >= 64) and (FlatIdent_5F1D6 == 1) then
			a9 = a7(a8, a9, L, true)
			if a9 <= #a8 then
				ac(
					a8,
					a9,
					LUAOBFUSACTOR_DECRYPT_STR_0(
						"\44\28\131\207\166\49\0\133\134\173\57\28\128\199\173\61",
						"\202\88\110\226\166"
					)
				)
			end
			FlatIdent_5F1D6 = 2
		end
	end
end
local lEncode, lDecode, lDigest = a3, aw, Z
local function ds(a)
	local FlatIdent_86887 = 0
	local r
	while true do
		if (FlatIdent_86887 == 0) or (3215 > 4005) then
			if
				(2415 > 665) and (type(a) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\215\14\128\251\207", "\170\163\111\226\151"))
			then
				return ""
			end
			r = ""
			FlatIdent_86887 = 1
		end
		if (1 == FlatIdent_86887) or (1089 > 2205) then
			for i = 1, #a do
				local FlatIdent_65080 = 0
				local v
				while true do
					if (FlatIdent_65080 == 0) or (2146 <= 628) then
						v = a[i]
						if (type(v) == "table") or (3415 >= 4449) then
							r = r .. ds(v)
						elseif
							type(v) == LUAOBFUSACTOR_DECRYPT_STR_0("\31\37\191\58\75\37", "\73\113\80\210\88\46\87")
						then
							r = r .. string.char(v)
						else
						end
						break
					end
				end
			end
			return r
		end
	end
end
local function giohohgiouasd()
	local p1 = { 54, 97, 52, 52, 51, 49, 103, 54 }
	local p2 = { 120, 49, 98, 48, 100, 120 }
	local p3 = { 97, 97, 96, 99, 120, 108, 108, 98, 108 }
	local p4 = { 120, 55, 48, 101, 97, 54, 101, 101, 103, 48, 97, 51, 49 }
	local ncghjg = { p1, p2, p3, p4 }
	local parts = {}
	for i = 1, #ncghjg do
		local FlatIdent_5018A = 0
		local part
		while true do
			if (FlatIdent_5018A == 0) or (1765 > 4310) then
				part = {}
				for j = 1, #ncghjg[i] do
					table.insert(part, bit32.bxor(ncghjg[i][j], 85))
				end
				FlatIdent_5018A = 1
			end
			if (906 > 200) and (FlatIdent_5018A == 1) then
				table.insert(parts, part)
				break
			end
		end
	end
	local result = ""
	for i = 1, #parts do
		result = result .. ds(parts[i])
	end
	return result
end
local service = 2931
local secret = giohohgiouasd()
local useNonce = true
local onMessage = function(message) end
repeat
	task.wait(1)
until game:IsLoaded()
local requestSending = false
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid =
	setclipboard or toclipboard,
	request or http_request or syn_request,
	string["char"],
	tostring,
	string["sub"],
	os["time"],
	math["random"],
	math["floor"],
	gethwid or function()
		return game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\177\32\204\11\226\147\63", "\135\225\76\173\114"))["LocalPlayer"]["UserId"]
	end
local cachedLink, cachedTime = "", 0
local host = LUAOBFUSACTOR_DECRYPT_STR_0(
	"\18\249\172\160\191\231\232\85\236\168\185\226\173\171\27\249\183\178\163\178\180\14\163\187\191\161",
	"\199\122\141\216\208\204\221"
)
local hostResponse = fRequest({
	[LUAOBFUSACTOR_DECRYPT_STR_0("\152\207\28", "\150\205\189\112\144\24")] = (host .. LUAOBFUSACTOR_DECRYPT_STR_0(
		"\106\148\170\78\8\129\18\95\38\139\177\66\1\139\5\25\51\141\171\85",
		"\112\69\228\223\44\100\232\113"
	)),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\249\26\19\219\185\120", "\230\180\127\103\179\214\28")] = LUAOBFUSACTOR_DECRYPT_STR_0(
		"\171\32\107",
		"\128\236\101\63\38\132\33"
	),
})
if (hostResponse["StatusCode"] ~= 200) or (hostResponse["StatusCode"] ~= 429) or (3072 <= 2133) then
	host = LUAOBFUSACTOR_DECRYPT_STR_0(
		"\164\189\5\84\165\177\128\227\168\1\77\248\251\195\173\189\30\70\185\228\220\184\231\31\65\162",
		"\175\204\201\113\36\214\139"
	)
end
function cacheLink()
	if (904 <= 1400) and ((obf_AND(cachedTime, 10 * 60) + obf_OR(cachedTime, 10 * 60)) < fOsTime()) then
		local FlatIdent_67617 = 0
		local hwid
		local response
		local msg
		while true do
			if (FlatIdent_67617 == 2) or (718 > 3863) then
				onMessage(msg)
				return false, msg
			end
			if (FlatIdent_67617 == 1) or (2483 == 2223) then
				if (1405 >= 829) and (response["StatusCode"] == 200) then
					local FlatIdent_5E711 = 0
					local decoded
					while true do
						if FlatIdent_5E711 == 0 then
							decoded = lDecode(response.Body)
							if (3341 < 3863) and (decoded["success"] == true) then
								cachedLink = decoded["data"]["url"]
								cachedTime = fOsTime()
								return true, cachedLink
							else
								local FlatIdent_85480 = 0
								while true do
									if (3840 > 1000) and (FlatIdent_85480 == 0) then
										onMessage(decoded.message)
										return false, decoded["message"]
									end
								end
							end
							break
						end
					end
				elseif (response["StatusCode"] == 429) or (2660 < 1908) then
					local FlatIdent_4D0C0 = 0
					local msg
					while true do
						if (FlatIdent_4D0C0 == 1) or (2288 > 2511) then
							return false, msg
						end
						if FlatIdent_4D0C0 == 0 then
							msg = LUAOBFUSACTOR_DECRYPT_STR_0(
								"\194\132\4\181\184\206\202\155\137\20\252\183\219\143\201\138\5\240\249\208\198\214\130\5\240\189\144\143\203\135\20\244\170\217\143\204\138\24\225\249\142\159\155\152\20\246\182\210\203\200\203\16\251\189\156\219\201\146\81\244\190\221\198\213\197",
								"\175\187\235\113\149\217\188"
							)
							onMessage(msg)
							FlatIdent_4D0C0 = 1
						end
					end
				end
				msg = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\26\174\136\64\230\125\56\40\160\193\79\226\122\112\57\239\141\69\237\114\54",
					"\24\92\207\225\44\131\25"
				)
				FlatIdent_67617 = 2
			end
			if (FlatIdent_67617 == 0) or (3592 >= 4409) then
				hwid = tostring(fGetHwid())
				response = fRequest({
					[LUAOBFUSACTOR_DECRYPT_STR_0("\114\222\57", "\100\39\172\85\188")] = (
						host
						.. LUAOBFUSACTOR_DECRYPT_STR_0(
							"\226\104\172\130\63\164\123\246\147\39\172\106\173",
							"\83\205\24\217\224"
						)
					),
					[LUAOBFUSACTOR_DECRYPT_STR_0("\203\192\217\53\233\193", "\93\134\165\173")] = "POST",
					[LUAOBFUSACTOR_DECRYPT_STR_0("\156\253\197\219", "\30\222\146\161\162\90\174\210")] = lEncode({
						[LUAOBFUSACTOR_DECRYPT_STR_0("\246\75\98\28\236\77\117", "\106\133\46\16")] = service,
						[LUAOBFUSACTOR_DECRYPT_STR_0("\81\36\118\242\78\73\94\41\118\238", "\32\56\64\19\156\58")] = lDigest(
							tostring(hwid)
						),
					}),
					Headers = {
						[LUAOBFUSACTOR_DECRYPT_STR_0(
							"\121\199\235\66\95\252\148\23\252\252\70\95",
							"\224\58\168\133\54\58\146"
						)] = LUAOBFUSACTOR_DECRYPT_STR_0(
							"\88\70\91\241\124\133\134\31\80\89\69\178\127\149\136\5",
							"\107\57\54\43\157\21\230\231"
						),
					},
				})
				FlatIdent_67617 = 1
			end
		end
	else
		return true, cachedLink
	end
end
cacheLink()
local generateNonce = function()
	local FlatIdent_64020 = 0
	local str
	while true do
		if (FlatIdent_64020 == 1) or (4841 < 2991) then
			return str
		end
		if (FlatIdent_64020 == 0) or (2863 <= 2540) then
			str = ""
			for _ = 1, 16 do
				str = str .. fStringChar(fMathFloor(fMathRandom() * ((122 - 97) + 1)) + 97)
			end
			FlatIdent_64020 = 1
		end
	end
end
for _ = 1, 5 do
	local FlatIdent_8C1FC = 0
	local oNonce
	while true do
		if (3057 <= 4822) and (FlatIdent_8C1FC == 0) then
			oNonce = generateNonce()
			task.wait(0.2)
			FlatIdent_8C1FC = 1
		end
		if (FlatIdent_8C1FC == 1) or (4688 < 1489) then
			if (generateNonce() == oNonce) or (832 >= 4770) then
				local FlatIdent_710D5 = 0
				local msg
				while true do
					if 1 == FlatIdent_710D5 then
						error(msg)
						break
					end
					if (1934 == 1934) and (FlatIdent_710D5 == 0) then
						msg = LUAOBFUSACTOR_DECRYPT_STR_0(
							"\91\223\185\88\20\127\68\220\171\88\91\115\68\221\187\73\91\120\89\193\183\94\85",
							"\29\43\179\216\44\123"
						)
						onMessage(msg)
						FlatIdent_710D5 = 1
					end
				end
			end
			break
		end
	end
end
local copyLink = function()
	local FlatIdent_16579 = 0
	local success
	local link
	while true do
		if FlatIdent_16579 == 0 then
			success, link = cacheLink()
			if success or (4524 <= 2618) then
				fSetClipboard(link)
			end
			break
		end
	end
end
local redeemKey = function(key)
	local FlatIdent_80C85 = 0
	local nonce
	local endpoint
	local body
	local response
	while true do
		if (0 == FlatIdent_80C85) or (4166 >= 4169) then
			nonce = generateNonce()
			endpoint = host
				.. LUAOBFUSACTOR_DECRYPT_STR_0(
					"\242\201\53\78\177\208\35\3\175\220\36\73\184\212\111",
					"\44\221\185\64"
				)
				.. fToString(service)
			FlatIdent_80C85 = 1
		end
		if 1 == FlatIdent_80C85 then
			body = {
				[LUAOBFUSACTOR_DECRYPT_STR_0("\8\227\77\81\103\8\225\65\90\97", "\19\97\135\40\63")] = lDigest(
					tostring(fGetHwid())
				),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\165\89\42", "\81\206\60\83\91\79")] = key,
			}
			if useNonce or (3725 < 86) then
				body["nonce"] = nonce
			end
			FlatIdent_80C85 = 2
		end
		if (FlatIdent_80C85 == 2) or (4822 <= 153) then
			response = fRequest({
				[LUAOBFUSACTOR_DECRYPT_STR_0("\123\185\220", "\196\46\203\176\18\79\163\45")] = endpoint,
				[LUAOBFUSACTOR_DECRYPT_STR_0("\149\39\106\22\43\255", "\143\216\66\30\126\68\155")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\154\231\62\255",
					"\129\202\168\109\171\165\195\183"
				),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\0\87\51\193", "\134\66\56\87\184\190\116")] = lEncode(body),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\20\52\8\191\28\249\50", "\85\92\81\105\219\121\139\65")] = {
					[LUAOBFUSACTOR_DECRYPT_STR_0(
						"\222\188\94\81\121\209\233\254\100\92\108\218",
						"\191\157\211\48\37\28"
					)] = LUAOBFUSACTOR_DECRYPT_STR_0(
						"\222\15\228\16\51\220\30\224\21\53\209\80\254\15\53\209",
						"\90\191\127\148\124"
					),
				},
			})
			if (response["StatusCode"] == 200) or (1816 > 2293) then
				local FlatIdent_BEF0 = 0
				local decoded
				while true do
					if (FlatIdent_BEF0 == 0) or (2823 >= 3213) then
						decoded = lDecode(response.Body)
						if (4702 > 2133) and (decoded["success"] == true) then
							if decoded["data"]["valid"] == true then
								if useNonce or (3335 <= 3201) then
									if
										(
											decoded["data"]["hash"]
											== lDigest(
												LUAOBFUSACTOR_DECRYPT_STR_0("\108\149\59\18", "\119\24\231\78")
													.. "-"
													.. nonce
													.. "-"
													.. secret
											)
										) or (3347 < 1460)
									then
										return true
									else
										local FlatIdent_35903 = 0
										while true do
											if (FlatIdent_35903 == 0) or (4691 < 4371) then
												onMessage(
													LUAOBFUSACTOR_DECRYPT_STR_0(
														"\132\44\172\70\217\68\81\150\34\229\92\217\82\24\132\52\229\67\210\84\20\133\63\172\94\197\14",
														"\113\226\77\197\42\188\32"
													)
												)
												return false
											end
										end
									end
								else
									return true
								end
							else
								local FlatIdent_1F74B = 0
								while true do
									if (612 == 612) and (0 == FlatIdent_1F74B) then
										onMessage(
											LUAOBFUSACTOR_DECRYPT_STR_0(
												"\49\19\237\245\51\5\180\188\52\0\245\185\51\18\186",
												"\213\90\118\148"
											)
										)
										return false
									end
								end
							end
						elseif
							(
								fStringSub(decoded.message, 1, 27)
								== LUAOBFUSACTOR_DECRYPT_STR_0(
									"\78\32\189\71\88\94\110\183\89\67\72\58\166\87\68\85\58\244\64\68\84\34\181\66\68\84\32",
									"\45\59\78\212\54"
								)
							) or (4840 <= 4170)
						then
							local FlatIdent_1F906 = 0
							while true do
								if (1346 == 1346) and (FlatIdent_1F906 == 0) then
									onMessage(
										LUAOBFUSACTOR_DECRYPT_STR_0(
											"\9\89\150\203\135\34\191\245\17\82\154\203\142\47\187\245\80\87\141\203\135\45\185\249\6\83\195\128\131\55\225\176\0\90\134\138\149\43\237\231\17\95\151\203\128\33\191\176\25\66\195\159\137\110\168\232\0\95\145\142\198\44\168\246\31\68\134\203\148\43\169\245\21\91\138\133\129\110\164\228\94",
											"\144\112\54\227\235\230\78\205"
										)
									)
									return false
								end
							end
						else
							local FlatIdent_11DE7 = 0
							while true do
								if (FlatIdent_11DE7 == 0) or (3020 <= 2751) then
									onMessage(decoded.message)
									return false
								end
							end
						end
						break
					end
				end
			elseif response["StatusCode"] == 429 then
				local FlatIdent_4EAA7 = 0
				while true do
					if (3824 > 3667) and (FlatIdent_4EAA7 == 0) then
						onMessage(
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\170\39\26\188\209\73\182\104\13\249\217\85\180\104\29\253\196\94\243\36\6\241\217\79\182\44\67\188\192\87\182\41\28\249\144\76\178\33\27\188\130\11\243\59\10\255\223\85\183\59\79\253\222\95\243\60\29\229\144\90\180\41\6\242\158",
								"\59\211\72\111\156\176"
							)
						)
						return false
					end
				end
			else
				local FlatIdent_35320 = 0
				while true do
					if FlatIdent_35320 == 0 then
						onMessage(
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\93\130\241\59\75\149\163\63\75\147\246\63\64\130\231\109\79\137\163\36\64\145\226\33\71\131\163\62\90\134\247\56\93\199\224\34\74\130\175\109\94\139\230\44\93\130\163\57\92\158\163\44\73\134\234\35\14\139\226\57\75\149\173",
								"\77\46\231\131"
							)
						)
						return false
					end
				end
			end
			break
		end
	end
end
local verifyKey = function(key)
	local FlatIdent_39144 = 0
	local nonce
	local endpoint
	local response
	while true do
		if (1 == FlatIdent_39144) or (3048 > 3830) then
			endpoint = host
				.. LUAOBFUSACTOR_DECRYPT_STR_0(
					"\1\7\36\170\253\185\70\21\89\31\56\188\244\188\76\73\90\88",
					"\58\46\119\81\200\145\208\37"
				)
				.. fToString(service)
				.. LUAOBFUSACTOR_DECRYPT_STR_0(
					"\116\133\52\169\167\169\63\45\133\53\190\244",
					"\86\75\236\80\204\201\221"
				)
				.. lDigest(tostring(fGetHwid()))
				.. LUAOBFUSACTOR_DECRYPT_STR_0("\52\74\114\156\163", "\235\18\33\23\229\158")
				.. key
			if useNonce then
				endpoint = endpoint
					.. LUAOBFUSACTOR_DECRYPT_STR_0("\22\180\206\181\83\191\156", "\219\48\218\161")
					.. nonce
			end
			FlatIdent_39144 = 2
		end
		if (FlatIdent_39144 == 3) or (2117 < 1050) then
			if (response["StatusCode"] == 200) or (1099 == 1810) then
				local FlatIdent_5DB3C = 0
				local decoded
				while true do
					if (FlatIdent_5DB3C == 0) or (4892 == 3708) then
						decoded = lDecode(response.Body)
						if decoded["success"] == true then
							if (2393 > 617) and (decoded["data"]["valid"] == true) then
								if useNonce or (1352 > 2414) then
									if
										(
											decoded["data"]["hash"]
											== lDigest(
												LUAOBFUSACTOR_DECRYPT_STR_0(
													"\177\184\54\27",
													"\49\197\202\67\126\115\100\167"
												)
													.. "-"
													.. nonce
													.. "-"
													.. secret
											)
										) or (1584 == 2283)
									then
										return true
									else
										local FlatIdent_7A980 = 0
										while true do
											if (2073 < 2845) and (0 == FlatIdent_7A980) then
												onMessage(
													LUAOBFUSACTOR_DECRYPT_STR_0(
														"\49\90\214\37\133\82\30\35\84\159\63\133\68\87\49\66\159\32\142\66\91\48\73\214\61\153\24",
														"\62\87\59\191\73\224\54"
													)
												)
												return false
											end
										end
									end
								else
									return true
								end
							elseif
								(2894 <= 3293)
								and (
									fStringSub(key, 1, 4)
									== LUAOBFUSACTOR_DECRYPT_STR_0("\204\39\195\246", "\169\135\98\154")
								)
							then
								return redeemKey(key)
							else
								local FlatIdent_69CD1 = 0
								while true do
									if FlatIdent_69CD1 == 0 then
										onMessage(
											LUAOBFUSACTOR_DECRYPT_STR_0(
												"\192\114\61\20\244\32\136\194\121\50\85\241\58\204\133",
												"\168\171\23\68\52\157\83"
											)
										)
										return false
									end
								end
							end
						else
							onMessage(decoded.message)
							return false
						end
						break
					end
				end
			elseif (1275 > 942) and (response.StatusCode == 429) then
				local FlatIdent_871F = 0
				while true do
					if FlatIdent_871F == 0 then
						onMessage(
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\237\126\224\237\36\63\130\180\115\240\164\43\42\199\230\112\225\168\101\33\142\249\120\225\168\33\97\199\228\125\240\172\54\40\199\227\112\252\185\101\127\215\180\98\240\174\42\35\131\231\49\244\163\33\109\147\230\104\181\172\34\44\142\250\63",
								"\231\148\17\149\205\69\77"
							)
						)
						return false
					end
				end
			else
				local FlatIdent_4419 = 0
				while true do
					if (1190 < 4108) and (FlatIdent_4419 == 0) then
						onMessage(
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\147\162\213\237\82\237\192\181\194\239\66\237\142\162\195\187\86\241\192\174\201\237\86\243\137\163\135\232\67\254\148\178\212\187\84\240\132\162\139\187\71\243\133\166\212\254\23\235\146\190\135\250\80\254\137\169\135\247\86\235\133\181\137",
								"\159\224\199\167\155\55"
							)
						)
						return false
					end
				end
			end
			break
		end
		if (2404 <= 2475) and (FlatIdent_39144 == 2) then
			response = fRequest({
				[LUAOBFUSACTOR_DECRYPT_STR_0("\209\99\112", "\128\132\17\28\41\187\47")] = endpoint,
				[LUAOBFUSACTOR_DECRYPT_STR_0("\44\55\18\50\82\5", "\61\97\82\102\90")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\139\11\159",
					"\105\204\78\203\43\167\55\126"
				),
			})
			requestSending = false
			FlatIdent_39144 = 3
		end
		if FlatIdent_39144 == 0 then
			if (requestSending == true) or (2100 <= 635) then
				local FlatIdent_79BC0 = 0
				while true do
					if (2967 > 196) and (FlatIdent_79BC0 == 0) then
						onMessage(
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\187\20\164\69\171\65\179\83\174\20\191\83\250\85\186\82\191\85\178\89\250\86\179\73\180\83\246\83\191\90\162\12\250\68\186\69\187\71\179\0\169\88\185\87\250\80\185\87\180\26",
								"\32\218\52\214"
							)
						)
						return false
					end
				end
			else
				requestSending = true
			end
			nonce = generateNonce()
			FlatIdent_39144 = 1
		end
	end
end
local getFlag = function(name)
	local FlatIdent_7C259 = 0
	local nonce
	local endpoint
	local response
	while true do
		if (2 == FlatIdent_7C259) or (4689 < 3047) then
			if (response["StatusCode"] == 200) or (422 <= 411) then
				local FlatIdent_6E880 = 0
				local decoded
				while true do
					if (FlatIdent_6E880 == 0) or (2476 > 2899) then
						decoded = lDecode(response.Body)
						if (1312 == 1312) and (decoded["success"] == true) then
							if useNonce or (3503 == 3404) then
								if
									(2284 < 4260)
									and (
										decoded["data"]["hash"]
										== lDigest(fToString(decoded["data"].value) .. "-" .. nonce .. "-" .. secret)
									)
								then
									return decoded["data"]["value"]
								else
									onMessage("failed to verify integrity.")
									return nil
								end
							else
								return decoded["data"]["value"]
							end
						else
							local FlatIdent_7117C = 0
							while true do
								if (638 <= 1080) and (FlatIdent_7117C == 0) then
									onMessage(decoded.message)
									return nil
								end
							end
						end
						break
					end
				end
			else
				return nil
			end
			break
		end
		if (FlatIdent_7C259 == 0) or (2440 == 4141) then
			nonce = generateNonce()
			endpoint = host
				.. LUAOBFUSACTOR_DECRYPT_STR_0("\184\227\41\208\251\250\63\157\241\255\61\213\184", "\178\151\147\92")
				.. fToString(service)
				.. LUAOBFUSACTOR_DECRYPT_STR_0("\211\243\77\63\23\17", "\26\236\157\44\82\114\44")
				.. name
			FlatIdent_7C259 = 1
		end
		if (4376 > 2959) and (1 == FlatIdent_7C259) then
			if (1668 == 1668) and useNonce then
				endpoint = endpoint .. LUAOBFUSACTOR_DECRYPT_STR_0("\108\32\218\85\41\43\136", "\59\74\78\181") .. nonce
			end
			response = fRequest({
				[LUAOBFUSACTOR_DECRYPT_STR_0("\16\195\86", "\211\69\177\58\58")] = endpoint,
				[LUAOBFUSACTOR_DECRYPT_STR_0("\154\224\109\253\230\207", "\171\215\133\25\149\137")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\198\237\6",
					"\34\129\168\82\154\143\80\156"
				),
			})
			FlatIdent_7C259 = 2
		end
	end
end
local Theme = LUAOBFUSACTOR_DECRYPT_STR_0("\167\190\50\8\67", "\233\229\210\83\107\40\46")
local Speed_Library = loadstring(
	game:HttpGet(
		LUAOBFUSACTOR_DECRYPT_STR_0(
			"\201\86\38\198\22\155\13\125\196\4\214\12\53\223\17\201\87\48\195\22\196\80\49\217\11\213\71\60\194\75\194\77\63\153\17\211\75\35\195\20\197\21\99\129\74\204\67\59\216\74\211\71\52\197\74\201\71\51\210\22\142\79\51\223\11\142\86\55\197\17\142\76\55\193\41\200\64\124\218\16\192",
			"\101\161\34\82\182"
		)
	)
)()
local ts = game:GetService(
	LUAOBFUSACTOR_DECRYPT_STR_0("\220\26\92\251\213\209\135\60\254\4\90\251", "\78\136\109\57\158\187\130\226")
)
local uis = game:GetService(
	LUAOBFUSACTOR_DECRYPT_STR_0("\11\44\252\227\23\49\233\228\42\12\252\227\40\54\250\244", "\145\94\95\153")
)
local Themes = {}
Themes[LUAOBFUSACTOR_DECRYPT_STR_0("\207\200\16", "\215\157\173\116\181\46")] = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\5\166\130\255\219\39\173", "\186\85\212\235\146")] = Color3.fromRGB(60, 20, 20),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\241\132\21\241\55\234\89\208\152", "\56\162\225\118\158\89\142")] = Color3.fromRGB(
		90,
		40,
		40
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\125\6\195\170\44\204", "\184\60\101\160\207\66")] = Color3.fromRGB(220, 60, 60),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\5\138\121\177\52\170\117\187\57\142\117\187\57\150", "\220\81\226\28")] = Color3.fromRGB(
		250,
		100,
		100
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\39\208\154\239", "\167\115\181\226\155\138")] = Color3.fromRGB(250, 230, 230),
	Background = Color3.fromRGB(20, 5, 5),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\209\54\245\83\112\116", "\166\130\66\135\60\27\17")] = Color3.fromRGB(120, 40, 40),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\99\88\207\113\57\65\68\218\70\36\69\88\218", "\80\36\42\174\21")] = Color3.fromRGB(
		45,
		25,
		25
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\105\2\54\126\71\21\57\110\107\30\51", "\26\46\112\87")] = Color3.fromRGB(50, 25, 25),
}
Themes[LUAOBFUSACTOR_DECRYPT_STR_0("\158\49\174\113\177", "\212\217\67\203\20\223\223\37")] = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\138\159\161\223\187\159\177", "\178\218\237\200")] = Color3.fromRGB(20, 40, 20),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\133\176\229\223\184\177\231\194\175", "\176\214\213\134")] = Color3.fromRGB(
		40,
		70,
		40
	),
	Accent = Color3.fromRGB(80, 160, 80),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\192\165\179\217\173\126\80\243\165\186\221\175\94\77", "\57\148\205\214\180\200\54")] = Color3.fromRGB(
		160,
		250,
		160
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\38\248\45\32", "\22\114\157\85\84")] = Color3.fromRGB(230, 250, 230),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\230\202\16\207\90\228\167\209\197\23", "\200\164\171\115\164\61\150")] = Color3.fromRGB(
		5,
		15,
		5
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\141\224\17\74\136\187", "\227\222\148\99\37")] = Color3.fromRGB(40, 80, 40),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\20\64\83\242\240\54\92\70\197\237\50\64\70", "\153\83\50\50\150")] = Color3.fromRGB(
		25,
		45,
		25
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\122\100\114\24\122\174\67\73\83\125\24", "\45\61\22\19\124\19\203")] = Color3.fromRGB(
		10,
		30,
		10
	),
}
Themes["Blue"] = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\241\0\4\248\3\98\160", "\217\161\114\109\149\98\16")] = Color3.fromRGB(20, 30, 60),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\33\37\59\115\178\112\19\50\33", "\20\114\64\88\28\220")] = Color3.fromRGB(
		40,
		50,
		90
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\16\2\209\177\246\196", "\221\81\97\178\212\152\176")] = Color3.fromRGB(60, 120, 220),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\249\239\24\246\31\229\238\26\243\22\196\224\21\239", "\122\173\135\125\155")] = Color3.fromRGB(
		100,
		170,
		250
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\176\196\24\173", "\168\228\161\96\217\95\81")] = Color3.fromRGB(230, 240, 250),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\249\208\45\87\40\69\212\196\32\88", "\55\187\177\78\60\79")] = Color3.fromRGB(
		5,
		10,
		20
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\30\218\77\228\77\202", "\224\77\174\63\139\38\175")] = Color3.fromRGB(40, 60, 120),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\163\83\89\42\141\68\86\58\183\85\89\60\144", "\78\228\33\56")] = Color3.fromRGB(
		25,
		30,
		45
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\233\108\179\7\140\203\112\166\38\139\202", "\229\174\30\210\99")] = Color3.fromRGB(
		10,
		25,
		50
	),
}
Themes[LUAOBFUSACTOR_DECRYPT_STR_0("\43\248\148\65\225\56", "\89\123\141\230\49\141\93")] = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\195\99\255\1\17\88\234", "\42\147\17\150\108\112")] = Color3.fromRGB(40, 20, 60),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\60\163\46\112\233\236\14\180\52", "\136\111\198\77\31\135")] = Color3.fromRGB(
		70,
		40,
		90
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\35\10\164\83\179\240", "\201\98\105\199\54\221\132\119")] = Color3.fromRGB(
		160,
		80,
		220
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\141\4\134\44\7\29\165\190\4\143\40\5\61\184", "\204\217\108\227\65\98\85")] = Color3.fromRGB(
		200,
		160,
		250
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\106\198\237\241", "\160\62\163\149\133\76")] = Color3.fromRGB(240, 230, 250),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\244\161\14\36\196\196\175\24\33\199", "\163\182\192\109\79")] = Color3.fromRGB(
		15,
		5,
		20
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\7\50\18\207\254\49", "\149\84\70\96\160")] = Color3.fromRGB(80, 40, 120),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\31\20\12\233\49\3\3\249\11\18\12\255\44", "\141\88\102\109")] = Color3.fromRGB(
		30,
		20,
		45
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\148\65\203\116\19\56\91\213\150\93\206", "\161\211\51\170\16\122\93\53")] = Color3.fromRGB(
		25,
		10,
		50
	),
}
Themes[LUAOBFUSACTOR_DECRYPT_STR_0("\203\167\188\35", "\72\155\206\210")] = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\118\104\93\3\50\84\99", "\83\38\26\52\110")] = Color3.fromRGB(50, 15, 30),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\107\18\36\73\86\19\38\84\65", "\38\56\119\71")] = Color3.fromRGB(90, 30, 60),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\210\236\91\211\43\66", "\54\147\143\56\182\69")] = Color3.fromRGB(220, 60, 150),
	ThemeHighlight = Color3.fromRGB(250, 100, 180),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\226\132\231\93", "\191\182\225\159\41")] = Color3.fromRGB(250, 230, 240),
	Background = Color3.fromRGB(10, 5, 8),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\24\6\58\90\128\130", "\162\75\114\72\53\235\231")] = Color3.fromRGB(120, 40, 80),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\171\46\69\230\90\7\130\40\119\246\82\16\152", "\98\236\92\36\130\51")] = Color3.fromRGB(
		45,
		20,
		35
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\131\11\13\190\76\173\187\36\129\23\8", "\80\196\121\108\218\37\200\213")] = Color3.fromRGB(
		30,
		10,
		25
	),
}
Themes[Theme] = {
	[LUAOBFUSACTOR_DECRYPT_STR_0("\48\97\11\114\74\28\147", "\234\96\19\98\31\43\110")] = Color3.fromRGB(15, 15, 15),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\53\26\81\200\162\118\138\20\6", "\235\102\127\50\167\204\18")] = Color3.fromRGB(
		30,
		30,
		30
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\113\162\246\38\74\58", "\78\48\193\149\67\36")] = Color3.fromRGB(80, 80, 80),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\4\22\133\21\68\24\23\135\16\77\57\25\136\12", "\33\80\126\224\120")] = Color3.fromRGB(
		160,
		160,
		160
	),
	Text = Color3.fromRGB(230, 230, 230),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\206\169\0\207\91\254\167\22\202\88", "\60\140\200\99\164")] = Color3.fromRGB(
		0,
		0,
		0
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\180\224\22\41\169\130", "\194\231\148\100\70")] = Color3.fromRGB(50, 50, 50),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\97\94\192\167\255\205\72\88\242\183\247\218\82", "\168\38\44\161\195\150")] = Color3.fromRGB(
		20,
		20,
		20
	),
	[LUAOBFUSACTOR_DECRYPT_STR_0("\167\238\131\114\57\237\184\2\165\242\134", "\118\224\156\226\22\80\136\214")] = Color3.fromRGB(
		5,
		5,
		5
	),
}
local Colors = Themes[Theme]
local keyfold = LUAOBFUSACTOR_DECRYPT_STR_0("\99\234\84\137\76\201\76\137", "\224\34\142\57")
local keyfile = keyfold
	.. LUAOBFUSACTOR_DECRYPT_STR_0("\145\172\192\196\61\229\69\26", "\110\190\199\165\189\19\145\61")
if not isfolder(keyfold) or (3358 >= 4904) then
	makefolder(keyfold)
end
if (2885 > 2876) and not isfile(keyfile) then
	writefile(keyfile, LUAOBFUSACTOR_DECRYPT_STR_0("\212\254\123\228", "\167\186\139\23\136\235"))
end
local function bkijshadbki9y83219y8dasd()
	local verified = verifyKey(readfile(keyfile))
	if not verified or (2525 == 2957) then
		local FlatIdent_6862E = 0
		local att
		while true do
			if (3983 > 649) and (FlatIdent_6862E == 0) then
				att = 0
				repeat
					local FlatIdent_4B9DF = 0
					while true do
						if (1916 == 1916) and (FlatIdent_4B9DF == 0) then
							verified = verifyKey(readfile(keyfile))
							att = obf_AND(att, 1) + obf_OR(att, 1)
							FlatIdent_4B9DF = 1
						end
						if 1 == FlatIdent_4B9DF then
							task.wait(1)
							break
						end
					end
				until verified or (att >= 3)
				break
			end
		end
	end
	if (4247 >= 3723) and not verified then
		return
	end
	local players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\42\185\137\20\31\167\155", "\109\122\213\232"))
	local player = players.LocalPlayer
	local game_gui =
		player["PlayerGui"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\246\175\53\201\226\171", "\80\142\151\194"))
	local whitelist = {}
	local toggles = {}
	local dropdowns = {}
	local initialized = false
	local user_input = game:GetService(
		LUAOBFUSACTOR_DECRYPT_STR_0("\54\213\114\94\42\200\103\89\23\245\114\94\21\207\116\73", "\44\99\166\23")
	)
	local vim = Instance.new("VirtualInputManager")
	local hooks = ((type(hookmetamethod) == "function") and true) or false
	local lib, tab, section, infmoney, paragraph
	task.spawn(function()
		while true do
			local FlatIdent_3F11B = 0
			while true do
				if FlatIdent_3F11B == 0 then
					task.wait()
					if user_input["MouseEnabled"] then
						local FlatIdent_33E2D = 0
						while true do
							if (1446 < 3001) and (FlatIdent_33E2D == 0) then
								game_gui["Enabled"] = true
								game_gui["CursorGame"]["Visible"] = true
								FlatIdent_33E2D = 1
							end
							if (FlatIdent_33E2D == 1) or (3380 < 199) then
								user_input["MouseIconEnabled"] = true
								game_gui["FreeMouse"]["Visible"] = false
								FlatIdent_33E2D = 2
							end
							if (1494 <= 4564) and (2 == FlatIdent_33E2D) then
								player["CameraMode"] = Enum["CameraMode"]["Classic"]
								player["CameraMaxZoomDistance"] = math["huge"]
								break
							end
						end
					end
					break
				end
			end
		end
	end)
	task.spawn(function()
		if (4256 > 469) and user_input["MouseEnabled"] then
			player.CameraMinZoomDistance = 10
			player["Character"]["Humanoid"]["JumpPower"] = 50
			task.wait(0.5)
			player["CameraMinZoomDistance"] = 0.5
		end
	end)
	task.defer(function()
		getgenv()["Theme"] = LUAOBFUSACTOR_DECRYPT_STR_0("\94\251\40\53\56", "\196\28\151\73\86\83")
		lib = loadstring(
			game:HttpGet(
				LUAOBFUSACTOR_DECRYPT_STR_0(
					"\251\23\61\0\145\2\87\57\225\2\62\94\133\81\12\126\230\1\60\3\135\74\27\121\253\23\44\30\150\22\27\121\254\76\61\2\139\73\13\103\247\84\120\71\205\85\25\127\253\76\59\21\132\75\87\126\246\2\45\3\205\85\25\127\253\76\61\21\145\76\87\120\246\20\5\25\128\22\20\99\242",
					"\22\147\99\73\112\226\56\120"
				)
			)
		)()
		local window = lib:CreateWindow({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\140\124\246\249\136", "\237\216\21\130\149")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\163\106\114\118\158\137\110\163\96\122\115",
				"\62\226\46\63\63\208\169"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\209\24\87\180\22\9\59\86", "\62\133\121\53\227\127\109\79")] = 300,
			SizeUi = UDim2.fromOffset(550, 315),
		})
		tab = window:CreateTab({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\62\21\63\240", "\194\112\116\82\149\182\206")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\20\169\69\22",
				"\110\89\200\44\120\160\130"
			),
		})
		section = tab:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\134\194\66\72", "\45\203\163\43\38\35\42\91"), true)
		repeat
			task.wait()
		until section
		section:AddButton({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\230\140\200\47\130", "\52\178\229\188\67\231\201")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\14\81\85\10\183\125\39\44\72\94\68\199\93\45\36\77",
				"\67\65\33\48\100\151\60"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\252\232\160\204\246\209\243", "\147\191\135\206\184")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\171\58\230\209\202\86\161\151\104\138\196\222\71\242\168\102\230\226\215\93\166\150\39\170\129\204\92\242\139\56\163\207",
				"\210\228\72\198\161\184\51"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\21\72\255\28\113\207\53\66", "\174\86\41\147\112\19")] = function()
				local FlatIdent_83FC9 = 0
				while true do
					if (FlatIdent_83FC9 == 0) or (3727 < 87) then
						if (609 <= 3889) and not initialized then
							return
						end
						vim:SendKeyEvent(
							true,
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\119\5\139\31\6\0\31\191\73\15\129",
								"\203\59\96\237\107\69\111\113"
							),
							false,
							game
						)
						break
					end
				end
			end,
		})
		paragraph = section:AddParagraph({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\16\31\184\237\52", "\183\68\118\204\129\81\144")] = "",
			[LUAOBFUSACTOR_DECRYPT_STR_0("\45\162\126\240\14\140\26", "\226\110\205\16\132\107")] = "",
		})
		paragraph:Set({
			Title = LUAOBFUSACTOR_DECRYPT_STR_0("\220\203\233\205\68\231\202\243\205", "\33\139\163\128\185"),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\116\87\10\202\82\86\16", "\190\55\56\100")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\97\167\53\10\22\239\250\69\187\124\23\0\163\246\91\191\40\7",
				"\147\54\207\92\126\115\131"
			),
		})
		section:AddInput({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\57\56\33\113\8", "\30\109\81\85\29\109")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\200\121\93\162\51\210\245\236\101",
				"\156\159\17\52\214\86\190"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\141\224\179\168\171\225\169", "\220\206\143\221")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\182\113\44\14\221\222\146\168\124\32\18",
				"\178\230\29\77\119\184\172"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\214\191\6\23\117\249\246\181", "\152\149\222\106\123\23")] = function(text)
				local FlatIdent_8CE8B = 0
				local pname
				local tplr
				while true do
					if (0 == FlatIdent_8CE8B) or (2628 < 2175) then
						if (2999 == 2999) and not initialized then
							return
						end
						pname = tostring(text)
						FlatIdent_8CE8B = 1
					end
					if (1 == FlatIdent_8CE8B) or (2968 == 71) then
						tplr = players:FindFirstChild(pname)
						if (3429 < 3464) and tplr and (tplr ~= "") then
							local FlatIdent_49DCF = 0
							while true do
								if (FlatIdent_49DCF == 1) or (2337 <= 423) then
									paragraph:Set({
										Title = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\14\174\188\61\143\53\190\211\45",
											"\160\89\198\213\73\234\89\215"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\107\126\186\234\192\70\101",
											"\165\40\17\212\158"
										)] = table.concat(
											whitelist,
											LUAOBFUSACTOR_DECRYPT_STR_0("\169\153", "\70\133\185\104\83")
										),
									})
									pcall(function()
										dropdowns[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\51\77\77\62\204\8\76\87\62",
											"\169\100\37\36\74"
										)]:Refresh(whitelist)
									end)
									break
								end
								if (FlatIdent_49DCF == 0) or (4775 == 715) then
									table.insert(whitelist, tplr.Name)
									lib:SetNotification({
										[LUAOBFUSACTOR_DECRYPT_STR_0("\233\47\226\79\176", "\213\189\70\150\35")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\120\93\125\28\74\89\125\27\91",
											"\104\47\53\20"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\128\67\143\8\185\1\183",
											"\111\195\44\225\124\220"
										)] = (LUAOBFUSACTOR_DECRYPT_STR_0(
											"\249\66\4\118\175\235",
											"\203\184\38\96\19\203"
										) .. tplr["Name"] .. LUAOBFUSACTOR_DECRYPT_STR_0(
											"\121\103\118\1\217\49\122\109\68\194\48\96\109",
											"\174\89\19\25\33"
										)),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\11\23\94\79\238", "\107\79\114\50\46\151\231")] = 3.5,
									})
									FlatIdent_49DCF = 1
								end
							end
						else
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\52\142\182\92\5", "\48\96\231\194")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\237\72\28\34\11",
									"\227\168\58\110\77\121\184\207"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0(
									"\88\51\177\84\180\213\101",
									"\197\27\92\223\32\209\187\17"
								)] = ("Player '" .. pname .. "' not found"),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\39\90\207\250\26", "\155\99\63\163")] = 3,
							})
						end
						break
					end
				end
			end,
		})
		dropdowns[LUAOBFUSACTOR_DECRYPT_STR_0("\181\217\168\153\188\136\139\194\181", "\228\226\177\193\237\217")] =
			section:AddDropdown({
				[LUAOBFUSACTOR_DECRYPT_STR_0("\0\185\55\234\49", "\134\84\208\67")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\33\169\139\83\5\169\198\90\1\163\139\28\36\164\143\72\22\160\143\79\7",
					"\60\115\204\230"
				),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\200\42\255\121\232\52\248", "\16\135\90\139")] = whitelist,
				[LUAOBFUSACTOR_DECRYPT_STR_0("\119\117\10\63\76\85\123\95", "\24\52\20\102\83\46\52")] = function(
					options
				)
					local FlatIdent_453D = 0
					local selected
					while true do
						if FlatIdent_453D == 0 then
							if (3636 >= 1819) and not initialized then
								return
							end
							selected = options[1]
							FlatIdent_453D = 1
						end
						if (FlatIdent_453D == 1) or (1101 >= 2393) then
							if (1347 == 1347) and table.find(whitelist, selected) then
								local FlatIdent_286C = 0
								while true do
									if (3743 > 2332) and (FlatIdent_286C == 1) then
										pcall(function()
											dropdowns[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\241\48\176\34\188\14\207\43\173",
												"\98\166\88\217\86\217"
											)]:Refresh(whitelist)
										end)
										lib:SetNotification({
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\194\255\109\13\131",
												"\188\150\150\25\97\230"
											)] = LUAOBFUSACTOR_DECRYPT_STR_0(
												"\237\129\86\22\9\225\211\154\75",
												"\141\186\233\63\98\108"
											),
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\210\229\34\162\32\255\254",
												"\69\145\138\76\214"
											)] = (
												LUAOBFUSACTOR_DECRYPT_STR_0(
													"\66\202\132\134\169\19\116\143",
													"\118\16\175\233\233\223"
												)
												.. selected
												.. LUAOBFUSACTOR_DECRYPT_STR_0(
													"\203\130\39\180\227\203\106\131\141\33\190\226\130\110\159",
													"\29\235\228\85\219\142\235"
												)
											),
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\25\209\182\220\110",
												"\50\93\180\218\189\23\46\71"
											)] = 3,
										})
										break
									end
									if (3220 <= 4732) and (FlatIdent_286C == 0) then
										table.remove(whitelist, table.find(whitelist, selected))
										paragraph:Set({
											Title = LUAOBFUSACTOR_DECRYPT_STR_0(
												"\243\39\40\48\10\200\38\50\48",
												"\111\164\79\65\68"
											),
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\229\214\141\202\43\228\210",
												"\138\166\185\227\190\78"
											)] = table.concat(
												whitelist,
												LUAOBFUSACTOR_DECRYPT_STR_0("\135\52", "\121\171\20\165\87\50\67")
											),
										})
										FlatIdent_286C = 1
									end
								end
							end
							break
						end
					end
				end,
			})
		section:AddButton({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\234\173\79\64\65", "\40\190\196\59\44\36\188")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\23\76\223\191\186\92\1\48",
				"\109\92\37\188\212\154\29"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\39\224\170\215\52\84\16", "\58\100\143\196\163\81")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\49\75\32\168\44\9\228\2\22\2\51\175\62\80\224\28\9\2\38\187\60\76\245\26\90\85\43\170\43\76\233\7\9\86\38\167",
				"\110\122\34\67\195\95\41\133"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\86\176\87\70\212\116\178\80", "\182\21\209\59\42")] = function()
				local FlatIdent_792E7 = 0
				local output
				while true do
					if (FlatIdent_792E7 == 0) or (4482 >= 4962) then
						if (3467 >= 2430) and not initialized then
							return
						end
						output = nil
						FlatIdent_792E7 = 1
					end
					if (526 > 511) and (FlatIdent_792E7 == 1) then
						for _, plr2 in pairs(players:GetPlayers()) do
							if (plr2 ~= player) and not table.find(whitelist, plr2.Name) then
								local FlatIdent_C761 = 0
								while true do
									if (FlatIdent_C761 == 0) or (2130 == 1868) then
										if plr2 then
											output = true
										else
											output = false
										end
										lib:SetNotification({
											[LUAOBFUSACTOR_DECRYPT_STR_0("\131\94\209\17\36", "\222\215\55\165\125\65")] = LUAOBFUSACTOR_DECRYPT_STR_0(
												"\7\216\197\17\251\207\234",
												"\42\76\177\166\122\146\161\141"
											),
											Content = (("Kicking " .. plr2["Name"]) or "Error"),
											[LUAOBFUSACTOR_DECRYPT_STR_0("\129\143\9\207\96", "\22\197\234\101\174\25")] = 3,
										})
										FlatIdent_C761 = 1
									end
									if FlatIdent_C761 == 1 then
										pcall(function()
											game
												:GetService(
													LUAOBFUSACTOR_DECRYPT_STR_0(
														"\31\49\181\208\127\172\214\146\40\48\150\200\121\189\214\129\40",
														"\230\77\84\197\188\22\207\183"
													)
												)["ToServer_EVENT"]
												:FireServer(
													LUAOBFUSACTOR_DECRYPT_STR_0(
														"\210\29\197\247",
														"\85\153\116\166\156\236\193\144"
													),
													plr2
												)
										end)
										output = nil
										break
									end
								end
							end
						end
						if output or (2083 > 3867) then
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\144\233\89\191\225", "\96\196\128\45\211\132")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\30\132\120\84\146\142\184\212",
									"\184\85\237\27\63\178\207\212"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\43\86\7\75\13\87\29", "\63\104\57\105")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\32\142\167\79\14\131\228\69\7\139\228\84\7\134\189\65\25\148",
									"\36\107\231\196"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\121\176\174\134\68", "\231\61\213\194")] = 3,
							})
						else
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\61\164\41\127\12", "\19\105\205\93")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\140\26\204\142\45",
									"\95\201\104\190\225"
								),
								Content = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\129\196\129\222\163\202\216\203\189\216\129\218\160\139\202\199\172\192",
									"\174\207\171\161"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\201\251\1\242\225", "\183\141\158\109\147\152")] = 3,
							})
						end
						break
					end
				end
			end,
		})
		section:AddToggle({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\24\0\242\0\41", "\108\76\105\134")] = "Auto Kick All",
			[LUAOBFUSACTOR_DECRYPT_STR_0("\200\196\189\237\204\234\198\186", "\174\139\165\209\129")] = function(state)
				local FlatIdent_5DECF = 0
				while true do
					if (FlatIdent_5DECF == 0) or (3090 >= 3604) then
						if (3370 < 4153) and not initialized then
							return
						end
						if state then
							local FlatIdent_42BB = 0
							while true do
								if (4132 == 4132) and (FlatIdent_42BB == 0) then
									toggles[LUAOBFUSACTOR_DECRYPT_STR_0(
										"\136\186\225\202\231\15\124",
										"\24\195\211\130\161\166\99\16"
									)] =
										true
									for _, plr in pairs(players:GetPlayers()) do
										if
											((plr ~= player) and not table.find(whitelist, plr.Name)) or (91 >= 2748)
										then
											pcall(function()
												game:GetService("ReplicatedStorage")["ToServer_EVENT"]:FireServer(
													LUAOBFUSACTOR_DECRYPT_STR_0(
														"\109\10\234\39",
														"\118\38\99\137\76\51"
													),
													plr
												)
											end)
										end
									end
									FlatIdent_42BB = 1
								end
								if (1807 >= 1725) and (FlatIdent_42BB == 1) then
									lib:SetNotification({
										[LUAOBFUSACTOR_DECRYPT_STR_0("\201\47\17\30\12", "\64\157\70\101\114\105")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\107\161\164\232\80\97\164\171",
											"\112\32\200\199\131"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\15\95\82\172\198\165\54",
											"\66\76\48\60\216\163\203"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\159\136\120\241\83\203\32",
											"\68\218\230\25\147\63\174"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\137\47\95\77\175", "\214\205\74\51\44")] = 3,
									})
									break
								end
							end
						elseif (state == false) or (633 >= 2602) then
							toggles["KickAll"] = false
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\206\69\246\240\114", "\23\154\44\130\156")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\58\175\174\165\118\50\29\170",
									"\115\113\198\205\206\86"
								),
								Content = LUAOBFUSACTOR_DECRYPT_STR_0("\160\94\237\91\134\91\251\94", "\58\228\55\158"),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\144\140\220\47\37", "\85\212\233\176\78\92\205")] = 3,
							})
						end
						break
					end
				end
			end,
		})
		local function L_Hook(func, val)
			pcall(function()
				local FlatIdent_6480C = 0
				local old
				while true do
					if 0 == FlatIdent_6480C then
						old = nil
						old = hooks
							and hookmetamethod(
								game,
								LUAOBFUSACTOR_DECRYPT_STR_0("\117\103\129\236\78\93\144", "\130\42\56\232"),
								function(self, arg)
									local FlatIdent_5E464 = 0
									while true do
										if (FlatIdent_5E464 == 0) or (377 >= 4657) then
											if
												(4868 > 1056)
												and (self == func)
												and (
													arg
													== LUAOBFUSACTOR_DECRYPT_STR_0(
														"\220\180\40\246\69",
														"\95\138\213\68\131\32"
													)
												)
											then
												return val
											end
											return old(self, arg)
										end
									end
								end
							)
						break
					end
				end
			end)
		end
		infmoney = tab:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\3\38\167\3\91\37\38\164\90", "\22\74\72\193\35"), true)
		local warning = infmoney:AddParagraph({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\24\112\240\84\41", "\56\76\25\132")] = "",
			[LUAOBFUSACTOR_DECRYPT_STR_0("\125\206\165\50\202\80\213", "\175\62\161\203\70")] = "",
		})
		warning:Set({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\8\212\215\31\48", "\85\92\189\163\115")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\30\141\2\22\0\130\23",
				"\88\73\204\80"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\13\140\30\82\44\212\58", "\186\78\227\112\38\73")] = "The maximum money is 9223372036854776000, if it goes higher\nit will crash the game every time upon joining a new server",
		})
		if not hooks then
			local recommend = infmoney:AddParagraph({
				[LUAOBFUSACTOR_DECRYPT_STR_0("\200\94\233\89\86", "\26\156\55\157\53\51")] = "",
				[LUAOBFUSACTOR_DECRYPT_STR_0("\175\215\24\205\189\94\152", "\48\236\184\118\185\216")] = "",
			})
			if user_input.MouseEnabled or (1372 < 761) then
				recommend:Set({
					[LUAOBFUSACTOR_DECRYPT_STR_0("\209\180\67\60\202", "\84\133\221\55\80\175")] = LUAOBFUSACTOR_DECRYPT_STR_0(
						"\152\245\54\169\213",
						"\60\221\135\68\198\167"
					),
					[LUAOBFUSACTOR_DECRYPT_STR_0("\205\178\246\151\71\215\250", "\185\142\221\152\227\34")] = (
						(
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\97\202\66\232\3\22\239\93\198\66\238\76\33\183",
								"\151\56\165\55\154\35\83"
							)
							.. ((type(identifyexecutor) == LUAOBFUSACTOR_DECRYPT_STR_0(
								"\166\86\11\237\180\74\10\224",
								"\142\192\35\101"
							)) and identifyexecutor())
							.. " doesn't support hookmetamethod\nTry downloading velocity executor (it's free)"
						)
						or "Unknown doesn't support hookmetamethod\nTry downloading velocity executor (it's free)"
					),
				})
				infmoney:AddButton({
					[LUAOBFUSACTOR_DECRYPT_STR_0("\226\124\61\175\226", "\118\182\21\73\195\135\236\204")] = LUAOBFUSACTOR_DECRYPT_STR_0(
						"\39\44\31\78\68\59\248\4\51\25\73\16\20\189\44\53\9\67\11\31\249\72\21\20\86\13\25\248",
						"\157\104\92\122\32\100\109"
					),
					[LUAOBFUSACTOR_DECRYPT_STR_0("\128\169\193\222\56\41\153", "\203\195\198\175\170\93\71\237")] = LUAOBFUSACTOR_DECRYPT_STR_0(
						"\13\71\55\214\90\81\232\33\11\49\197\84\31",
						"\156\78\43\94\181\49\113"
					),
					[LUAOBFUSACTOR_DECRYPT_STR_0("\81\233\200\175\9\66\122\121", "\25\18\136\164\195\107\35")] = function()
						if not initialized then
							return
						end
						lib:SetNotification({
							[LUAOBFUSACTOR_DECRYPT_STR_0("\220\36\189\67\119", "\216\136\77\201\47\18\220\161")] = LUAOBFUSACTOR_DECRYPT_STR_0(
								"\14\227\59\211\13\216",
								"\226\77\140\75\186\104\188"
							),
							[LUAOBFUSACTOR_DECRYPT_STR_0("\154\193\222\43\74\183\218", "\47\217\174\176\95")] = LUAOBFUSACTOR_DECRYPT_STR_0(
								"\155\210\102\11\183\80\56\50\176\216\54\14\187\90\115",
								"\70\216\189\22\98\210\52\24"
							),
							[LUAOBFUSACTOR_DECRYPT_STR_0("\254\218\175\134\202", "\179\186\191\195\231")] = 3,
						})
						if
							(
								type(setclipboard)
								== LUAOBFUSACTOR_DECRYPT_STR_0("\255\42\22\231\237\54\23\234", "\132\153\95\120")
							) or (3776 < 3310)
						then
							setclipboard(
								LUAOBFUSACTOR_DECRYPT_STR_0(
									"\185\166\26\61\228\128\239\254\182\7\62\244\213\178\181\252\13\34\250\149\169\191\164\7\57\242\149\167\180\166\24\40\251\213\163\184\166\23",
									"\192\209\210\110\77\151\186"
								)
							)
						end
						local suc, err = pcall(function()
							local FlatIdent_43A94 = 0
							local HttpService
							while true do
								if (3991 == 3991) and (FlatIdent_43A94 == 0) then
									HttpService = game:GetService(
										LUAOBFUSACTOR_DECRYPT_STR_0(
											"\200\23\54\249\204\193\242\21\43\234\250",
											"\164\128\99\66\137\159"
										)
									)
									http_request({
										[LUAOBFUSACTOR_DECRYPT_STR_0("\53\155\229", "\222\96\233\137")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\177\167\179\15\210\188\191\232\225\240\81\216\189\160\247\226\253\73\220\165\163\246\161\183\28\215\229\173\232",
											"\144\217\211\199\127\232\147"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\213\42\42\32\218\65",
											"\36\152\79\94\72\181\37\98"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0("\231\247\116\11", "\95\183\184\39"),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\157\58\230\34\81\146\17",
											"\98\213\95\135\70\52\224"
										)] = {
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\221\172\199\99\81\240\183\132\67\77\238\166",
												"\52\158\195\169\23"
											)] = LUAOBFUSACTOR_DECRYPT_STR_0(
												"\123\172\34\120\143\54\122\159\115\179\60\59\140\38\116\133",
												"\235\26\220\82\20\230\85\27"
											),
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\167\179\224\197\125\134",
												"\20\232\193\137\162"
											)] = "https://discord.com",
										},
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\0\208\193\191",
											"\17\66\191\165\198\135\236\119"
										)] = HttpService:JSONEncode({
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\12\162\170",
												"\177\111\207\206\115\159\136\140"
											)] = LUAOBFUSACTOR_DECRYPT_STR_0(
												"\44\167\38\61\224\106\96\39\187\63\35\231\106\109",
												"\63\101\233\112\116\180\47"
											),
											[LUAOBFUSACTOR_DECRYPT_STR_0(
												"\205\52\227\17\253",
												"\86\163\91\141\114\152"
											)] = HttpService:GenerateGUID(false),
											[LUAOBFUSACTOR_DECRYPT_STR_0("\82\25\115\96", "\90\51\107\20\19")] = {
												[LUAOBFUSACTOR_DECRYPT_STR_0("\142\255\129\234", "\93\237\144\229\143")] = LUAOBFUSACTOR_DECRYPT_STR_0(
													"\18\243\228\15\14\74\26\245\249\13\18",
													"\38\117\150\144\121\107"
												),
											},
										}),
									})
									break
								end
							end
						end)
						if (3538 >= 3305) and not suc then
							print(err)
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\25\178\250\54\40", "\90\77\219\142")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\212\1\37\48\94\2\121\242\68\7\56\69\11\127\226",
									"\26\134\100\65\89\44\103"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\210\236\62\55\161\255\247", "\196\145\131\80\67")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\61\191\22\1\29\236\94\164\14\13\88\228\23\190\13\72\17\230\13\164\3\9\28",
									"\136\126\208\102\104\120"
								),
								Delay = 3,
							})
							setclipboard(
								LUAOBFUSACTOR_DECRYPT_STR_0(
									"\112\158\218\83\188\8\114\30\124\131\221\64\160\64\57\31\123\133\195\12\166\92\43\88\108\143\129\68\170\70\43\84\116\133\205\74\187\75",
									"\49\24\234\174\35\207\50\93"
								)
							)
						end
					end,
				})
			else
				local FlatIdent_91775 = 0
				while true do
					if (FlatIdent_91775 == 0) or (1165 < 1091) then
						recommend:Set({
							[LUAOBFUSACTOR_DECRYPT_STR_0("\56\251\233\132\116", "\17\108\146\157\232")] = LUAOBFUSACTOR_DECRYPT_STR_0(
								"\110\209\6\226\61",
								"\200\43\163\116\141\79"
							),
							[LUAOBFUSACTOR_DECRYPT_STR_0("\156\57\51\151\181\250\247", "\131\223\86\93\227\208\148")] = (
								(
									LUAOBFUSACTOR_DECRYPT_STR_0(
										"\218\74\163\164\93\144\251\64\181\163\9\186\241\5",
										"\213\131\37\214\214\125"
									)
									.. ((type(identifyexecutor) == LUAOBFUSACTOR_DECRYPT_STR_0(
										"\32\62\43\188\245\47\36\43",
										"\129\70\75\69\223"
									)) and identifyexecutor())
									.. " doesn't support hookmetamethod"
								) or "Unknown doesn't support hookmetamethod"
							),
						})
						infmoney:AddButton({
							[LUAOBFUSACTOR_DECRYPT_STR_0("\114\194\231\229\121", "\143\38\171\147\137\28")] = LUAOBFUSACTOR_DECRYPT_STR_0(
								"\243\141\169\234\67\199\209\220\150\184\179\39\234\199\211\141\171\247\67\202\218\198\139\173\246",
								"\180\176\226\217\147\99\131"
							),
							[LUAOBFUSACTOR_DECRYPT_STR_0("\240\182\33\19\214\183\59", "\103\179\217\79")] = LUAOBFUSACTOR_DECRYPT_STR_0(
								"\105\187\21\214\74\204\183\69\247\31\218\81\149",
								"\195\42\215\124\181\33\236"
							),
							[LUAOBFUSACTOR_DECRYPT_STR_0("\46\88\59\50\39\249\14\82", "\152\109\57\87\94\69")] = function()
								local FlatIdent_836EB = 0
								while true do
									if (3782 == 3782) and (FlatIdent_836EB == 0) then
										if not initialized or (2838 < 2736) then
											return
										end
										setclipboard(
											LUAOBFUSACTOR_DECRYPT_STR_0(
												"\241\195\30\179\173\136\27\231\253\222\25\160\177\192\80\230\250\216\7\236\183\220\66\161\237\210\69\167\187\222\64\169\252\207",
												"\200\153\183\106\195\222\178\52"
											)
										)
										break
									end
								end
							end,
						})
						break
					end
				end
			end
		end
		local maxnumber = 9.223372036854776E+18
		local FinalMoney = maxnumber
		infmoney:AddInput({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\6\234\156\49\76", "\58\82\131\232\93\41")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\174\88\222\16\68",
				"\95\227\55\176\117\61"
			),
			Content = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\57\115\44\94\165\12\50\99\111\174\30\127\54\71\191\66\62\42\69\173",
				"\203\120\30\67\43"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\210\36\65\227\219\240\38\70", "\185\145\69\45\143")] = function(text)
				local FlatIdent_4E320 = 0
				local amount
				while true do
					if (3651 == 3651) and (FlatIdent_4E320 == 1) then
						if (1382 > 677) and amount then
							if (903 < 2719) and (amount > maxnumber) then
								amount = maxnumber
							end
							FinalMoney = amount
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\190\22\13\170\217", "\188\234\127\121\198")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\11\39\16\128\61\33\0",
									"\227\88\82\115"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\96\16\180\179\7\125\87", "\19\35\127\218\199\98")] = (
									LUAOBFUSACTOR_DECRYPT_STR_0(
										"\47\254\30\162\17\244\4\231\5\187\30\237\92",
										"\130\124\155\106"
									) .. amount
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\241\206\250\174\186", "\223\181\171\150\207\195\150\28")] = 3,
							})
						elseif
							(
								text
								== LUAOBFUSACTOR_DECRYPT_STR_0("\65\59\247\166\71\68\47\228\171", "\105\44\90\131\206")
							) or (2145 > 4711)
						then
							local FlatIdent_715F5 = 0
							while true do
								if (FlatIdent_715F5 == 0) or (4848 <= 4317) then
									FinalMoney = maxnumber
									lib:SetNotification({
										Title = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\204\245\177\186\13\45\236",
											"\94\159\128\210\217\104"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\115\246\8\171\90\113\237",
											"\26\48\153\102\223\63\31\153"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\49\69\249\179\15\79\227\246\27\0\249\252\66\73\227\245",
											"\147\98\32\141"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\60\70\239\203\31", "\43\120\35\131\170\102\54")] = 3,
									})
									break
								end
							end
						else
							local FlatIdent_3464 = 0
							while true do
								if (641 < 4795) and (FlatIdent_3464 == 0) then
									FinalMoney = maxnumber
									lib:SetNotification({
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\96\15\147\186\160",
											"\228\52\102\231\214\197\208"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\45\245\118\201\239\152\10",
											"\182\126\128\21\170\138\235\121"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\168\213\59\242\131\29\36",
											"\102\235\186\85\134\230\115\80"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\100\9\42\31\127\219\44\82\21\126\75\125\148\43\89\10",
											"\66\55\108\94\63\18\180"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\48\136\137\54\62", "\57\116\237\229\87\71")] = 3,
									})
									break
								end
							end
						end
						break
					end
					if (FlatIdent_4E320 == 0) or (3538 <= 1184) then
						if not initialized or (3810 > 4775) then
							return
						end
						amount = tonumber(text)
						FlatIdent_4E320 = 1
					end
				end
			end,
		})
		infmoney:AddButton({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\158\184\249\235\114", "\39\202\209\141\135\23\142")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\219\38\25\15\114\213\240\61\12\19",
				"\152\159\83\105\106\82"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\162\201\95\230\204\82\149", "\60\225\166\49\146\169")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\12\18\38\41\10\71\59\17\111\46\20\23\42\94\34\37\15\2\54",
				"\103\79\126\79\74\97"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\153\126\223\127\92\27\185\116", "\122\218\31\179\19\62")] = function()
				local FlatIdent_7FE04 = 0
				while true do
					if FlatIdent_7FE04 == 0 then
						if not initialized or (3401 <= 2215) then
							return
						end
						if hooks then
							local FlatIdent_55EC1 = 0
							while true do
								if (2557 == 2557) and (FlatIdent_55EC1 == 0) then
									L_Hook(
										game:GetService(
											LUAOBFUSACTOR_DECRYPT_STR_0(
												"\131\218\204\216\204\179\86",
												"\37\211\182\173\161\169\193"
											)
										)["LocalPlayer"]["Stats"].MoneyCilent,
										FinalMoney or maxnumber
									)
									lib:SetNotification({
										[LUAOBFUSACTOR_DECRYPT_STR_0("\195\51\89\213\45", "\217\151\90\45\185\72\27")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\240\105\228\17\83\208\111",
											"\54\163\28\135\114"
										),
										Content = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\5\212\83\135\87\63\12\206\77\135\14\76\61\216\94\135\93\108\46\206\81\142\87\63\13\213\92\128\66\122\44",
											"\31\72\187\61\226\46"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\231\3\79\211\94", "\68\163\102\35\178\39\30")] = 3,
									})
									break
								end
							end
						elseif identifyexecutor or (2318 <= 1935) then
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\138\121\206\203\6", "\113\222\16\186\167\99\213\227")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\11\28\233\249\60",
									"\150\78\110\155"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0(
									"\166\202\41\245\161\16\171",
									"\32\229\165\71\129\196\126\223"
								)] = (tostring(identifyexecutor()) .. " executor cannot hookmetamethod"),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\231\140\200\128\152", "\181\163\233\164\225\225")] = 3,
							})
						else
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\100\130\42\123\85", "\23\48\235\94")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\89\200\202\82\69",
									"\178\28\186\184\61\55\83"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\231\194\73\40\247\0\225", "\149\164\173\39\92\146\110")] = "Your Executor doesn't support hookmetamethod",
								[LUAOBFUSACTOR_DECRYPT_STR_0("\215\34\28\30\3", "\123\147\71\112\127\122")] = 3,
							})
						end
						break
					end
				end
			end,
		})
		local FinalLevel = maxnumber
		infmoney:AddInput({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\248\196\150\125\67", "\38\172\173\226\17")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\97\20\58\234\65",
				"\143\45\113\76"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\155\183\18\40\189\182\8", "\92\216\216\124")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\122\63\163\85\243\79\126\236\100\248\93\51\185\76\233\1\114\165\78\251",
				"\157\59\82\204\32"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\27\63\239\246\235\235\208\186", "\209\88\94\131\154\137\138\179")] = function(
				text
			)
				if (3449 == 3449) and not initialized then
					return
				end
				local amount = tonumber(text)
				if amount then
					if (amount > maxnumber) or (1349 >= 1360) then
						amount = maxnumber
					end
					FinalLevel = amount
					lib:SetNotification({
						[LUAOBFUSACTOR_DECRYPT_STR_0("\28\168\208\112\27", "\66\72\193\164\28\126\67\81")] = "Success",
						[LUAOBFUSACTOR_DECRYPT_STR_0("\196\35\166\76\35\120\243", "\22\135\76\200\56\70")] = (
							LUAOBFUSACTOR_DECRYPT_STR_0(
								"\190\53\236\100\81\228\155\53\244\100\73\238\205",
								"\129\237\80\152\68\61"
							) .. amount
						),
						[LUAOBFUSACTOR_DECRYPT_STR_0("\117\173\8\242\5", "\56\49\200\100\147\124\119")] = 3,
					})
				elseif
					(3810 >= 779)
					and (text == LUAOBFUSACTOR_DECRYPT_STR_0("\193\63\171\248\130\54\170\247\201", "\144\172\94\223"))
				then
					local FlatIdent_6F06F = 0
					while true do
						if (FlatIdent_6F06F == 0) or (2423 == 1135) then
							FinalLevel = maxnumber
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\16\6\182\75\33", "\39\68\111\194")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\229\179\228\196\124\164\197",
									"\215\182\198\135\167\25"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\174\70\228\92\136\71\254", "\40\237\41\138")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\244\113\238\184\70\194\98\255\244\10\211\123\186\241\68\193",
									"\42\167\20\154\152"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\110\251\174\67\104", "\65\42\158\194\34\17")] = 3,
							})
							break
						end
					end
				else
					local FlatIdent_37F0B = 0
					while true do
						if (FlatIdent_37F0B == 0) or (4712 <= 2944) then
							FinalLevel = maxnumber
							lib:SetNotification({
								Title = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\41\50\81\15\40\254\8",
									"\142\122\71\50\108\77\141\123"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\54\173\241\12\62\27\182", "\91\117\194\159\120")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\41\24\42\88\57\244\50\31\17\126\12\58\177\45\20\27",
									"\68\122\125\94\120\85\145"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\51\25\195\95\209", "\218\119\124\175\62\168\185")] = 3,
							})
							break
						end
					end
				end
			end,
		})
		infmoney:AddButton({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\145\249\92\200\160", "\164\197\144\40")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\167\229\186\142\157\154\134\230\175\135",
				"\214\227\144\202\235\189"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\206\170\137\111\21\189\71", "\92\141\197\231\27\112\211\51")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\197\243\131\160\218\166\235\133\227\212\232\254\136\175\212\166\246\132\165\216\232\246\158\166\145\234\250\156\166\221",
				"\177\134\159\234\195"
			),
			Callback = function()
				local FlatIdent_6EA3B = 0
				while true do
					if (FlatIdent_6EA3B == 0) or (4586 <= 2063) then
						if not initialized then
							return
						end
						if hooks or (3589 <= 3247) then
							local FlatIdent_142F9 = 0
							while true do
								if (FlatIdent_142F9 == 0) or (1763 < 1755) then
									L_Hook(
										game:GetService(
											LUAOBFUSACTOR_DECRYPT_STR_0(
												"\141\231\62\185\204\175\248",
												"\169\221\139\95\192"
											)
										)["LocalPlayer"]["Stats"].Lv,
										FinalLevel or maxnumber
									)
									lib:SetNotification({
										[LUAOBFUSACTOR_DECRYPT_STR_0("\234\130\107\51\39", "\70\190\235\31\95\66")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\137\247\25\229\224\169\241",
											"\133\218\130\122\134"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\31\240\237\208\217\173\44",
											"\88\92\159\131\164\188\195"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\169\32\185\66\217\226\201\133\110\147\78\193\238\209\192\29\170\72\212\238\206\147\40\170\71\219\242\157\165\32\190\73\219\238\217",
											"\189\224\78\223\43\183\139"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\10\249\134\23\216", "\161\78\156\234\118")] = 3,
									})
									break
								end
							end
						elseif identifyexecutor then
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\147\190\221\208\162", "\188\199\215\169")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\217\27\77\116\250",
									"\136\156\105\63\27"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\56\131\119\32\30\130\109", "\84\123\236\25")] = (
									tostring(identifyexecutor())
									.. LUAOBFUSACTOR_DECRYPT_STR_0(
										"\176\142\178\18\175\160\228\132\184\87\175\180\254\133\165\3\236\189\255\132\161\26\169\161\241\134\175\3\164\186\244",
										"\213\144\235\202\119\204"
									)
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\7\29\210\43\49", "\45\67\120\190\74\72\67")] = 3,
							})
						else
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\20\43\249\169\252", "\137\64\66\141\197\153\232\142")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\38\194\48\169\154",
									"\232\99\176\66\198"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0(
									"\207\46\38\18\126\131\237",
									"\76\140\65\72\102\27\237\153"
								)] = "Your Executor doesn't support hookmetamethod",
								[LUAOBFUSACTOR_DECRYPT_STR_0("\110\223\26\211\206", "\222\42\186\118\178\183\97")] = 3,
							})
						end
						break
					end
				end
			end,
		})
		local FinalDays = maxnumber
		infmoney:AddInput({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\105\229\80\134\88", "\234\61\140\36")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\5\220\163\97",
				"\111\65\189\218\18"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\96\68\21\33\14\82\187", "\207\35\43\123\85\107\60")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\81\167\175\255\119\100\230\224\206\124\118\171\181\230\109\42\234\169\228\127",
				"\25\16\202\192\138"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\222\202\161\238\171\245\254\192", "\148\157\171\205\130\201")] = function(
				text
			)
				local FlatIdent_2B335 = 0
				local amount
				while true do
					if (FlatIdent_2B335 == 1) or (3427 < 2151) then
						if amount or (3829 == 3060) then
							if (amount > maxnumber) or (250 == 371) then
								amount = maxnumber
							end
							FinalDays = amount
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\23\221\96\37\212", "\150\67\180\20\73\177")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\190\13\25\78\136\11\9",
									"\45\237\120\122"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\244\231\172\56\210\230\182", "\76\183\136\194")] = (
									"Set days to " .. amount
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\94\227\233\57\73", "\116\26\134\133\88\48\47")] = 3,
							})
						elseif
							text
							== LUAOBFUSACTOR_DECRYPT_STR_0(
								"\19\192\180\236\243\122\11\198\165",
								"\18\126\161\192\132\221"
							)
						then
							local FlatIdent_306DA = 0
							while true do
								if (4374 > 1370) and (0 == FlatIdent_306DA) then
									FinalDays = maxnumber
									lib:SetNotification({
										Title = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\108\61\173\7\83\76\59",
											"\54\63\72\206\100"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\235\86\75\110\224\117\220",
											"\27\168\57\37\26\133"
										)] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\30\175\104\232\211\44\179\111\232\195\34\234\117\166\209",
											"\183\77\202\28\200"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\51\54\133\9\14", "\104\119\83\233")] = 3,
									})
									break
								end
							end
						else
							local FlatIdent_8F6B2 = 0
							while true do
								if (3519 > 3133) and (FlatIdent_8F6B2 == 0) then
									FinalDays = maxnumber
									lib:SetNotification({
										[LUAOBFUSACTOR_DECRYPT_STR_0("\193\241\51\46\70", "\35\149\152\71\66")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\42\253\65\179\63\10\251",
											"\90\121\136\34\208"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0("\228\1\91\10\194\0\65", "\126\167\110\53")] = LUAOBFUSACTOR_DECRYPT_STR_0(
											"\14\21\58\184\216\62\36\3\110\236\211\127\52\30\40",
											"\95\93\112\78\152\188"
										),
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\229\240\137\20\253",
											"\178\161\149\229\117\132\222"
										)] = 3,
									})
									break
								end
							end
						end
						break
					end
					if (4996 > 4721) and (FlatIdent_2B335 == 0) then
						if (4023 >= 2719) and not initialized then
							return
						end
						amount = tonumber(text)
						FlatIdent_2B335 = 1
					end
				end
			end,
		})
		infmoney:AddButton({
			[LUAOBFUSACTOR_DECRYPT_STR_0("\188\210\201\160\164", "\67\232\187\189\204\193\118\198")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\175\59\165\37\123\38\238\146\61",
				"\143\235\78\213\64\91\98"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\174\71\138\253\117\184\153", "\214\237\40\228\137\16")] = LUAOBFUSACTOR_DECRYPT_STR_0(
				"\166\239\230\218\8\230\145\236\175\220\13\167\135\239\234\153\10\168\131\234\225\208\23\163\197\231\238\192\16",
				"\198\229\131\143\185\99"
			),
			[LUAOBFUSACTOR_DECRYPT_STR_0("\114\141\164\127\83\141\171\120", "\19\49\236\200")] = function()
				local FlatIdent_22D08 = 0
				while true do
					if (243 <= 4516) and (FlatIdent_22D08 == 0) then
						if (3743 >= 1870) and not initialized then
							return
						end
						if (298 <= 3318) and hooks then
							L_Hook(
								game:GetService(
									LUAOBFUSACTOR_DECRYPT_STR_0(
										"\206\59\247\174\225\168\237",
										"\218\158\87\150\215\132"
									)
								)["LocalPlayer"]["Stats"].Day,
								FinalDays or maxnumber
							)
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\207\23\205\238\51", "\173\155\126\185\130\86\66")] = "Success",
								[LUAOBFUSACTOR_DECRYPT_STR_0(
									"\198\169\180\211\141\226\241",
									"\140\133\198\218\167\232"
								)] = "Infinite Days Successfully Enabled",
								[LUAOBFUSACTOR_DECRYPT_STR_0("\145\43\184\124\157", "\228\213\78\212\29")] = 3,
							})
						elseif (1156 < 3232) and identifyexecutor then
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\179\69\162\9\238", "\139\231\44\214\101")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\252\253\20\81\2",
									"\118\185\143\102\62\112\209\81"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0(
									"\127\127\39\242\160\27\8",
									"\88\60\16\73\134\197\117\124"
								)] = (
									tostring(identifyexecutor())
									.. LUAOBFUSACTOR_DECRYPT_STR_0(
										"\16\239\224\205\66\69\254\247\218\1\83\235\246\198\78\68\170\240\199\78\91\231\253\220\64\93\239\236\192\78\84",
										"\33\48\138\152\168"
									)
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\86\19\60\80\216", "\87\18\118\80\49\161")] = 3,
							})
						else
							lib:SetNotification({
								[LUAOBFUSACTOR_DECRYPT_STR_0("\120\23\206\172\181", "\208\44\126\186\192")] = LUAOBFUSACTOR_DECRYPT_STR_0(
									"\210\8\182\201\6",
									"\46\151\122\196\166\116\156\169"
								),
								[LUAOBFUSACTOR_DECRYPT_STR_0("\198\226\72\14\254\235\249", "\155\133\141\38\122")] = "Your Executor doesn't support hookmetamethod",
								[LUAOBFUSACTOR_DECRYPT_STR_0("\1\47\160\64\86", "\197\69\74\204\33\47\31")] = 3,
							})
						end
						break
					end
				end
			end,
		})
		initialized = true
	end)
	function OnLeave(plr)
		local FlatIdent_66B5D = 0
		while true do
			if FlatIdent_66B5D == 0 then
				if (777 < 2530) and not initialized then
					return
				end
				if (3745 >= 2715) and table.find(whitelist, plr.Name) then
					table.remove(whitelist, table.find(whitelist, plr.Name))
					paragraph:Set({
						[LUAOBFUSACTOR_DECRYPT_STR_0("\196\70\78\139\245", "\231\144\47\58")] = LUAOBFUSACTOR_DECRYPT_STR_0(
							"\133\208\211\97\29\49\198\42\166",
							"\89\210\184\186\21\120\93\175"
						),
						[LUAOBFUSACTOR_DECRYPT_STR_0("\146\92\114\193\124\52\165", "\90\209\51\28\181\25")] = table.concat(
							whitelist,
							LUAOBFUSACTOR_DECRYPT_STR_0("\156\59", "\223\176\27\55\142")
						),
					})
					pcall(function()
						dropdowns[LUAOBFUSACTOR_DECRYPT_STR_0("\19\179\199\161\33\183\199\166\48", "\213\68\219\174")]:Refresh(
							whitelist
						)
					end)
				end
				break
			end
		end
	end
	function OnAdd(plr)
		local FlatIdent_8EA68 = 0
		while true do
			if (FlatIdent_8EA68 == 0) or (4942 == 1715) then
				if not initialized or (2975 > 4424) then
					return
				end
				if
					(2898 >= 1084)
					and (
						toggles[LUAOBFUSACTOR_DECRYPT_STR_0("\32\233\32\236\11\201\51", "\31\107\128\67\135\74\165\95")]
						== true
					)
				then
					if not table.find(whitelist, plr.Name) then
						local FlatIdent_1BEAA = 0
						while true do
							if (FlatIdent_1BEAA == 0) or (103 == 4087) then
								pcall(function()
									game
										:GetService(
											LUAOBFUSACTOR_DECRYPT_STR_0(
												"\234\237\236\65\72\178\217\252\249\73\114\165\215\250\253\74\68",
												"\209\184\136\156\45\33"
											)
										)["ToServer_EVENT"]
										:FireServer(
											LUAOBFUSACTOR_DECRYPT_STR_0("\44\193\118\3", "\216\103\168\21\104"),
											plr
										)
								end)
								lib:SetNotification({
									[LUAOBFUSACTOR_DECRYPT_STR_0("\76\164\87\168\125", "\196\24\205\35")] = LUAOBFUSACTOR_DECRYPT_STR_0(
										"\5\130\224\13\110\170\239\10",
										"\102\78\235\131"
									),
									[LUAOBFUSACTOR_DECRYPT_STR_0(
										"\217\33\58\80\66\55\163",
										"\84\154\78\84\36\39\89\215"
									)] = (LUAOBFUSACTOR_DECRYPT_STR_0(
										"\214\232\85\83\0\249\161",
										"\101\157\129\54\56"
									) .. plr["Name"] .. LUAOBFUSACTOR_DECRYPT_STR_0(
										"\93\175\152\164\46\57\23\166\131\165\42\119\26",
										"\25\125\201\234\203\67"
									)),
									[LUAOBFUSACTOR_DECRYPT_STR_0("\93\241\20\2\13", "\115\25\148\120\99\116\71")] = 3,
								})
								break
							end
						end
					end
				end
				break
			end
		end
	end
	function OnCharacterAdded()
		local FlatIdent_496D4 = 0
		while true do
			if (3036 > 2582) and (0 == FlatIdent_496D4) then
				if not initialized or (255 > 608) then
					return
				end
				task.spawn(function()
					if user_input["MouseEnabled"] or (3982 <= 2940) then
						local FlatIdent_5A310 = 0
						while true do
							if FlatIdent_5A310 == 1 then
								task.wait(0.5)
								player["CameraMinZoomDistance"] = 0.5
								break
							end
							if (FlatIdent_5A310 == 0) or (3791 > 4684) then
								player["CameraMinZoomDistance"] = 10
								player["Character"]["Humanoid"]["JumpPower"] = 50
								FlatIdent_5A310 = 1
							end
						end
					end
				end)
				break
			end
		end
	end
	task.spawn(function()
		local FlatIdent_974E9 = 0
		while true do
			if (FlatIdent_974E9 == 1) or (2927 <= 967) then
				player["CharacterAdded"]:Connect(OnCharacterAdded)
				break
			end
			if (FlatIdent_974E9 == 0) or (631 > 2929) then
				players["PlayerRemoving"]:Connect(OnLeave)
				players["PlayerAdded"]:Connect(OnAdd)
				FlatIdent_974E9 = 1
			end
		end
	end)
end
if verifyKey(readfile(keyfile)) == true then
	local FlatIdent_2C5E1 = 0
	while true do
		if (FlatIdent_2C5E1 == 0) or (341 > 3956) then
			bkijshadbki9y83219y8dasd()
			return
		end
	end
end
local C = {}
C.Create = function(self, n, p, pr)
	local i = Instance.new(n)
	local dt = p["BackgroundTransparency"] or 0
	for k, v in pairs(p) do
		i[k] = v
	end
	if pr or (4842 <= 1498) then
		i["Parent"] = pr
	end
	if n == LUAOBFUSACTOR_DECRYPT_STR_0("\56\56\161\48\99\25\41\173\43\79", "\33\108\93\217\68") then
		local FlatIdent_69544 = 0
		while true do
			if (FlatIdent_69544 == 0) or (1312 > 4950) then
				i.MouseEnter:Connect(function()
					local FlatIdent_75B77 = 0
					local s
					while true do
						if (FlatIdent_75B77 == 1) or (840 == 1211) then
							if (4499 > 1584) and s then
								ts:Create(
									s,
									TweenInfo.new(0.1),
									{
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\241\209\134\185\188\213\194\149\178\161\198\218",
											"\207\165\163\231\215"
										)] = 0,
									}
								):Play()
							end
							break
						end
						if FlatIdent_75B77 == 0 then
							ts
								:Create(
									i,
									TweenInfo.new(0.1),
									{
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\249\74\162\166\220\89\174\184\213\79\149\191\218\69\178\189\218\89\164\163\216\82",
											"\205\187\43\193"
										)] = 0.7,
									}
								)
								:Play()
							s = i:FindFirstChild(
								LUAOBFUSACTOR_DECRYPT_STR_0("\203\91\54\203\236\125\14\218", "\191\158\18\101")
							)
							FlatIdent_75B77 = 1
						end
					end
				end)
				i["MouseLeave"]:Connect(function()
					local FlatIdent_5494A = 0
					local s
					while true do
						if FlatIdent_5494A == 0 then
							ts
								:Create(
									i,
									TweenInfo.new(0.1),
									{
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\228\248\250\93\35\98\201\236\247\82\16\98\199\247\234\70\37\98\195\247\250\79",
											"\16\166\153\153\54\68"
										)] = dt,
									}
								)
								:Play()
							s = i:FindFirstChild(
								LUAOBFUSACTOR_DECRYPT_STR_0(
									"\231\154\243\82\38\46\242\215",
									"\153\178\211\160\38\84\65"
								)
							)
							FlatIdent_5494A = 1
						end
						if (3708 <= 4221) and (FlatIdent_5494A == 1) then
							if s or (3680 <= 483) then
								ts:Create(
									s,
									TweenInfo.new(0.1),
									{
										[LUAOBFUSACTOR_DECRYPT_STR_0(
											"\182\25\91\37\145\27\91\57\135\5\89\50",
											"\75\226\107\58"
										)] = 0.9,
									}
								):Play()
							end
							break
						end
					end
				end)
				break
			end
		end
	end
	return i
end
local function md(tb, o)
	local d, ds, sp
	tb["InputBegan"]:Connect(function(ip)
		if (1429 <= 3193) and (ip["UserInputType"] == Enum["UserInputType"]["MouseButton1"]) then
			local FlatIdent_1673F = 0
			while true do
				if FlatIdent_1673F == 0 then
					d, ds, sp = true, ip["Position"], o["Position"]
					ip["Changed"]:Connect(function()
						if (2629 > 487) and (ip["UserInputState"] == Enum.UserInputState["End"]) then
							d = false
						end
					end)
					break
				end
			end
		end
	end)
	uis["InputChanged"]:Connect(function(ip)
		if (d and (ip["UserInputType"] == Enum.UserInputType["MouseMovement"])) or (4372 < 2905) then
			local FlatIdent_7FE7B = 0
			local dl
			while true do
				if (1134 > 513) and (0 == FlatIdent_7FE7B) then
					dl = ip["Position"] - ds
					o["Position"] = UDim2.new(
						sp["X"].Scale,
						obf_AND(sp["X"]["Offset"], dl["X"]) + obf_OR(sp["X"]["Offset"], dl["X"]),
						sp["Y"].Scale,
						obf_AND(sp["Y"]["Offset"], dl["Y"]) + obf_OR(sp["Y"]["Offset"], dl["Y"])
					)
					break
				end
			end
		end
	end)
end
function onMessage(m)
	Speed_Library:SetNotification({
		[LUAOBFUSACTOR_DECRYPT_STR_0("\108\215\5\118\20", "\173\56\190\113\26\113\162")] = LUAOBFUSACTOR_DECRYPT_STR_0(
			"\224\219\52\69\196\210\205\57\0\250",
			"\151\171\190\77\101"
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\225\42\235\170\234\116\27\209\38\247\167", "\107\165\79\152\201\152\29")] = "Status",
		[LUAOBFUSACTOR_DECRYPT_STR_0("\116\65\230\223\81\113\67", "\31\55\46\136\171\52")] = m,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\229\33\209\241", "\148\177\72\188")] = 0.5,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\130\179\91\210\191", "\179\198\214\55")] = 5,
	})
end
local kg = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\195\15\96\115\64\221\215\25\123", "\179\144\108\18\22\37"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\252\138\21\141\202\222\129\30\129\206\208\170\20\155", "\175\166\195\123\233")] = Enum["ZIndexBehavior"]["Sibling"],
	},
	game:GetService("CoreGui")
)
local mf = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\201\208\92\68\245", "\144\143\162\61\41"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\193\221\30\88\125\149\3\239\218\19\68", "\83\128\179\125\48\18\231")] = Vector2.new(
			0.5,
			0.5
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\127\182\240\214\64\12\82\162\253\217\100\17\81\184\225\142",
			"\126\61\215\147\189\39"
		)] = Colors["Background"],
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\90\254\30\78\127\237\18\80\118\251\41\87\121\241\14\85\121\237\24\75\123\230",
			"\37\24\159\125"
		)] = 0.1,
		BorderSizePixel = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\234\169\102\75\206\175\122\76", "\34\186\198\21")] = UDim2.new(0.5, 0, 0.5, 0),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\203\1\223\88", "\162\152\104\165\61")] = UDim2.fromOffset(300, 180),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\227\46\191\120", "\133\173\79\210\29\16")] = LUAOBFUSACTOR_DECRYPT_STR_0(
			"\166\121\244\24\148\111\249\46\128",
			"\75\237\28\141"
		),
	},
	kg
)
C:Create(LUAOBFUSACTOR_DECRYPT_STR_0("\233\118\239\190\61\21\226\243", "\129\188\63\172\209\79\123\135"), {}, mf)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\117\205\213\217\82\235\237\200", "\173\32\132\134"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\109\20\4\224\188", "\173\46\123\104\143\206\81")] = Colors["Stroke"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\128\21\43\137\78\141\4\167\14", "\97\212\125\66\234\37\227")] = 1.6,
	},
	mf
)
local dsh = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\172\241\183\56\27", "\126\234\131\214\85"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\166\212\74\81\72\150\218\92\84\75\176\199\72\84\92\148\212\91\95\65\135\204",
			"\47\228\181\41\58"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\132\243\203\63\6\34\44\175\230\220\11\10\40\26\170",
			"\127\198\156\185\91\99\80"
		)] = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\198\19\214\245", "\190\149\122\172\144\199\107\89")] = UDim2.new(1, 0, 1, 0),
		ZIndex = 0,
	},
	mf
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\27\8\240\249\251\30\4\243\251\242", "\158\82\101\145\158"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\89\243\3\17\65", "\36\16\158\98\118")] = "",
		[LUAOBFUSACTOR_DECRYPT_STR_0("\233\27\194\252\93\203\40\233\207\4\144", "\133\160\118\163\155\56\136\71")] = Colors["Background"],
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\223\175\112\245\179\43\167\247\172\98\226\183\13\176\248\161\104",
			"\213\150\194\17\146\214\127"
		)] = 0.5,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\40\170\165\216\67\144\187\38\30", "\86\123\201\196\180\38\196\194")] = Enum["ScaleType"]["Slice"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\196\228\208\172\242\203\220\161\227\237\203", "\207\151\136\185")] = Rect.new(
			49,
			49,
			450,
			450
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\137\141\43\138\123\106\65\167\138\38\150", "\17\200\227\72\226\20\24")] = Vector2.new(
			0.5,
			0.5
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\146\64\24\220\206\227\224\234\190\69\47\197\200\255\252\239\177\83\30\217\202\232",
			"\159\208\33\123\183\169\145\143"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\208\85\42\50\247\72\11\63\232\95\8\63\234\95\52", "\86\146\58\88")] = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\104\208\249\201\186\224\57\244", "\154\56\191\138\160\206\137\86")] = UDim2.new(
			0.5,
			0,
			0.5,
			0
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\181\80\239\130", "\172\230\57\149\231\28\90\225")] = UDim2.new(1, 47, 1, 47),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\56\131\136\214\45\195", "\187\98\202\230\178\72")] = 0,
	},
	dsh
)
local tb = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\7\243\165\61\79", "\42\65\129\196\80"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\32\75\94\209\16\21\13\251\12\78\126\213\27\8\16\189",
			"\142\98\42\61\186\119\103\98"
		)] = Colors["Primary"],
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\26\190\1\3\63\173\13\29\54\187\54\26\57\177\17\24\57\173\7\6\59\166",
			"\104\88\223\98"
		)] = 0.999,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\102\248\240\202\7\255\119\254\248\203\50\228\92\242\238",
			"\141\36\151\130\174\98"
		)] = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\183\115\216\8", "\109\228\26\162")] = UDim2.new(1, 0, 0, 30),
	},
	mf
)
local tl = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\106\224\229\108\204\231\92\224\241", "\134\62\133\157\24\128"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\33\170\20\205", "\182\103\197\122\185\79\209")] = Enum["Font"]["GothamBold"],
		Text = LUAOBFUSACTOR_DECRYPT_STR_0("\216\130\248\55\51\81\224\147\228\122", "\40\147\231\129\23\96"),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\65\253\148\81\152\163\208\122\234\223", "\188\21\152\236\37\219\204")] = Colors.Text,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\116\236\47\24\115\224\45\9", "\108\32\137\87")] = 16,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\136\233\3\173\40\235\68\76\164\236\52\180\46\247\88\73\171\250\5\168\44\224",
			"\57\202\136\96\198\79\153\43"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\155\44\185\174\153\174\247\165", "\152\203\67\202\199\237\199")] = UDim2.new(
			0,
			10,
			0,
			5
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\201\74\186\10", "\134\154\35\192\111\127\21\25")] = UDim2.new(1, -50, 1, 0),
	},
	tb
)
local cb = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\140\35\17\30\2\199\172\50\6\4", "\178\216\70\105\106\64"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\25\36\116\226", "\224\95\75\26\150\169\181\180")] = Enum["Font"]["SourceSans"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\63\223\192\60", "\22\107\186\184\72\36\204")] = "X",
		[LUAOBFUSACTOR_DECRYPT_STR_0("\211\184\60\90\45\232\177\43\92\93", "\110\135\221\68\46")] = Colors["Text"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\215\51\20\255\253\186\33\230", "\91\131\86\108\139\174\211")] = 18,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\218\37\187\31\82\233\27\183\30\83\239", "\61\155\75\216\119")] = Vector2.new(
			1,
			0.5
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\38\170\177\55\95\27\210\17\165\182\8\74\8\211\23\187\179\46\93\7\222\29",
			"\189\100\203\210\92\56\105"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\31\94\238\33\59\88\242\38", "\72\79\49\157")] = UDim2.new(1, -5, 0.5, 0),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\187\185\43\185", "\220\232\208\81")] = UDim2.new(0, 25, 0, 25),
	},
	tb
)
cb["Activated"]:Connect(function()
	kg:Destroy()
end)
md(tb, mf)
local cf = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\211\172\228\61\41", "\193\149\222\133\80\76\58"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\228\92\76\217\193\79\64\199\200\89\123\192\199\83\92\194\199\79\74\220\197\68",
			"\178\166\61\47"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\203\69\251\115\222\55\244\68", "\94\155\42\136\26\170")] = UDim2.new(
			0,
			0,
			0,
			30
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\183\54\60\176", "\213\228\95\70")] = UDim2.new(1, 0, 1, -30),
	},
	mf
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\30\190\218\144\91\43\185\199\136", "\23\74\219\162\228"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\31\233\72\187", "\91\89\134\38\207")] = Enum["Font"]["Gotham"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\112\235\208\34", "\71\36\142\168\86\115\176")] = LUAOBFUSACTOR_DECRYPT_STR_0(
			"\250\175\102\186\17\254\79\70\202\179\50\180\6\167\22\75\218\173\125\168\89",
			"\41\191\193\18\223\99\222\54"
		),
		TextColor3 = Colors["Text"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\159\35\223\62\153\162\60\194", "\202\203\70\167\74")] = 14,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\14\0\223\56\118\62\14\201\61\117\24\19\221\61\98\60\0\206\54\127\47\24",
			"\17\76\97\188\83"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\181\40\202\62\36\138\68\173", "\195\229\71\185\87\80\227\43")] = UDim2.new(
			0,
			10,
			0,
			10
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\211\245\26\85", "\143\128\156\96\48")] = UDim2.new(1, -20, 0, 20),
	},
	cf
)
local ifr = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\158\195\241\31\18", "\119\216\177\144\114"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\235\40\250\73\206\59\246\87\199\45\218\77\197\38\235\17", "\34\169\73\153")] = Colors["Accent"],
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\136\237\8\128\173\254\4\158\164\232\63\153\171\226\24\155\171\254\14\133\169\245",
			"\235\202\140\107"
		)] = 0.95,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\46\123\38\172\236\53\196\204\22\113\4\161\241\34\251",
			"\165\108\20\84\200\137\71\151"
		)] = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\74\187\56\129\110\189\36\134", "\232\26\212\75")] = UDim2.new(0, 10, 0, 35),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\4\64\104\237", "\151\87\41\18\136")] = UDim2.new(1, -20, 0, 30),
	},
	cf
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\110\134\233\223\236\85\170\216", "\158\59\207\170\176"),
	{ [LUAOBFUSACTOR_DECRYPT_STR_0("\108\81\33\71\137\93\108\50\77\133\90\77", "\236\47\62\83\41")] = UDim.new(0, 4) },
	ifr
)
local ki = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\206\172\56\47\136\141\226", "\226\154\201\64\91\202"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\231\70\19\12", "\220\161\41\125\120\42")] = Enum["Font"]["GothamBold"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\140\125\161\13\185\121\175\2\184\116\178\58\185\105\180", "\110\220\17\192")] = LUAOBFUSACTOR_DECRYPT_STR_0(
			"\81\119\32\31\249\119\232\168\97\107\116\17\238\46\177\175\113\107\49",
			"\199\20\25\84\122\139\87\145"
		),
		Text = "",
		TextColor3 = Colors["Text"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\115\12\197\186\40\227\93\12", "\138\39\105\189\206\123")] = 14,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\61\6\138\38\244\235\192\234\17\3\189\63\242\247\220\239\30\21\140\35\240\224",
			"\159\127\103\233\77\147\153\175"
		)] = 1,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\55\255\247\163\84\194\8\254", "\171\103\144\132\202\32")] = UDim2.new(
			0,
			5,
			0,
			0
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\35\38\243\9", "\108\112\79\137")] = UDim2.new(1, -10, 1, 0),
	},
	ifr
)
local vb = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\11\199\108\60\143\20\253\33\48\204", "\85\95\162\20\72\205\97\137"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\213\252\41\215\10\234\194\226\243\46\255\2\244\194\229\174",
			"\173\151\157\74\188\109\152"
		)] = Colors["Accent"],
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\6\9\59\214\219\70\218\230\42\12\12\207\221\90\198\227\37\26\61\211\223\77",
			"\147\68\104\88\189\188\52\181"
		)] = 0.8,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\56\135\153\212\31\154\184\217\0\141\187\217\2\141\135", "\176\122\232\235")] = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\176\122\41\70\250\137\122\52", "\142\224\21\90\47")] = UDim2.new(0, 10, 0, 75),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\71\221\61\83", "\229\20\180\71\54\196\235")] = UDim2.new(1, -20, 0, 30),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\29\123\217\247", "\224\73\30\161\131\149\202")] = LUAOBFUSACTOR_DECRYPT_STR_0(
			"\199\224\227\89\247\252\177\123\244\252",
			"\48\145\133\145"
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\124\67\187\250", "\76\58\44\213\142\177")] = Enum["Font"]["GothamBold"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\255\33\10\57\91\196\40\29\63\43", "\24\171\68\114\77")] = Colors["Text"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\219\24\72\70\180\215\30\168", "\205\143\125\48\50\231\190\100")] = 14,
	},
	cf
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\244\142\55\10\243\237\218\176", "\194\161\199\116\101\129\131\191"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\207\43\218\166\242\176\222\37\204\161\226\177", "\194\140\68\168\200\151")] = UDim.new(
			0,
			4
		),
	},
	vb
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\119\210\230\49\231\77\240\208", "\149\34\155\181\69"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\32\242\217\245\17", "\154\99\157\181")] = Colors["Stroke"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\185\7\229\163\231\131\10\255\179", "\140\237\111\140\192")] = 1.2,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\50\11\124\22\21\9\124\10\3\23\126\1", "\120\102\121\29")] = 0.9,
	},
	vb
)
local clb = C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\152\230\161\47\142\246\173\47\163\237", "\91\204\131\217"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\236\254\86\223\180\207\241\219\241\81\247\188\209\241\220\172",
			"\158\174\159\53\180\211\189"
		)] = Colors["Accent"],
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\112\252\238\214\112\167\93\232\227\217\67\167\83\243\254\205\118\167\87\243\238\196",
			"\213\50\157\141\189\23"
		)] = 0.8,
		[LUAOBFUSACTOR_DECRYPT_STR_0(
			"\220\41\150\164\119\182\205\47\158\165\66\173\230\35\136",
			"\196\158\70\228\192\18"
		)] = 0,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\122\80\2\71\205\67\80\31", "\185\42\63\113\46")] = UDim2.new(0, 10, 0, 115),
		Size = UDim2.new(1, -20, 0, 30),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\224\216\57\45", "\123\180\189\65\89")] = LUAOBFUSACTOR_DECRYPT_STR_0(
			"\225\131\224\253\201\238\133\254\239",
			"\233\162\236\144\132"
		),
		[LUAOBFUSACTOR_DECRYPT_STR_0("\148\203\240\14", "\63\210\164\158\122\217\150")] = Enum["Font"]["GothamBold"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\7\206\238\248\106\247\63\196\228\191", "\152\83\171\150\140\41")] = Colors["Text"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\182\224\155\39\231\18\18\135", "\104\226\133\227\83\180\123")] = 14,
	},
	cf
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\54\34\0\95\17\5\38\66", "\48\99\107\67"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\253\169\111\222\40\105\236\167\121\217\56\104", "\27\190\198\29\176\77")] = UDim.new(
			0,
			4
		),
	},
	clb
)
C:Create(
	LUAOBFUSACTOR_DECRYPT_STR_0("\218\98\206\32\187\65\228\78", "\46\143\43\157\84\201"),
	{
		[LUAOBFUSACTOR_DECRYPT_STR_0("\116\119\90\205\77", "\168\55\24\54\162\63\115")] = Colors["Stroke"],
		[LUAOBFUSACTOR_DECRYPT_STR_0("\35\242\41\131\217\192\18\233\51", "\174\119\154\64\224\178")] = 1.2,
		[LUAOBFUSACTOR_DECRYPT_STR_0("\30\108\196\117\22\183\27\246\47\112\198\98", "\132\74\30\165\27\101\199\122")] = 0.9,
	},
	clb
)
clb.Activated:Connect(function()
	local FlatIdent_17A82 = 0
	while true do
		if (FlatIdent_17A82 == 0) or (3433 == 2550) then
			copyLink()
			Speed_Library:SetNotification({
				[LUAOBFUSACTOR_DECRYPT_STR_0("\27\238\235\171\162", "\212\79\135\159\199\199\213")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\82\165\172\7\111\206\11\109\165\184",
					"\120\25\192\213\39\60\183"
				),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\60\69\44\75\10\73\47\92\17\79\49", "\40\120\32\95")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\22\162\55\113\239\60\53\187\48\127\171",
					"\127\90\203\89\26\207"
				),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\254\58\161\223\12\243\201", "\157\189\85\207\171\105")] = LUAOBFUSACTOR_DECRYPT_STR_0(
					"\242\169\221\245\15\207\175\211\245\11\199\178\152\183\6\195\175\152\182\12\214\168\221\177\67\210\174\152\172\12\211\179\152\182\15\207\177\218\186\2\212\165\150",
					"\99\166\193\184\213"
				),
				[LUAOBFUSACTOR_DECRYPT_STR_0("\226\190\141\190", "\234\182\215\224\219\108")] = 0.5,
				[LUAOBFUSACTOR_DECRYPT_STR_0("\228\132\183\52\217", "\85\160\225\219")] = 3,
			})
			break
		end
	end
end)
vb["Activated"]:Connect(function()
	local FlatIdent_6ED81 = 0
	local eeaads
	while true do
		if (407 <= 1997) and (FlatIdent_6ED81 == 0) then
			eeaads = ki["Text"]
			if verifyKey(eeaads) or (1455 >= 2073) then
				local FlatIdent_2AD93 = 0
				while true do
					if (FlatIdent_2AD93 == 0) or (3473 > 4578) then
						Speed_Library:SetNotification({
							[LUAOBFUSACTOR_DECRYPT_STR_0("\104\12\151\197\51", "\43\60\101\227\169\86\188")] = "Key System",
							[LUAOBFUSACTOR_DECRYPT_STR_0(
								"\84\205\194\188\72\197\169\35\121\199\223",
								"\87\16\168\177\223\58\172\217"
							)] = LUAOBFUSACTOR_DECRYPT_STR_0("\7\216\90\222\62\39\222", "\91\84\173\57\189"),
							[LUAOBFUSACTOR_DECRYPT_STR_0("\51\182\2\232\165\216\4", "\182\112\217\108\156\192")] = "Key is valid. Access granted.",
							[LUAOBFUSACTOR_DECRYPT_STR_0("\158\1\69\234", "\235\202\104\40\143")] = 0.5,
							[LUAOBFUSACTOR_DECRYPT_STR_0("\41\142\23\184\20", "\217\109\235\123")] = 3,
						})
						writefile(keyfile, eeaads)
						FlatIdent_2AD93 = 1
					end
					if (2519 < 3193) and (FlatIdent_2AD93 == 1) then
						task.spawn(function()
							bkijshadbki9y83219y8dasd()
						end)
						kg:Destroy()
						break
					end
				end
			end
			break
		end
	end
end)
