local MarketplaceService = game:GetService("MarketplaceService")

local success, placeInfo = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
	end)

	local gameName = (success and placeInfo and placeInfo.Name) and placeInfo.Name:lower() or ""
	local placeId = game.PlaceId
	local gameId = game.GameId

	-- 1. Dungeon Quest Reborn / Level / Dungeon Matches
	if string.find(gameName, "level")
	   or string.find(gameName, "dungeon")
	      or string.find(gameName, "reborn")
		     or string.find(gameName, "quest")
			    or placeId == 77649408247578
				   or gameId == 77649408247578
				      or placeId == 85776757589518
					     or gameId == 85776757589518 then

						     loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/929008c414da18b3243d912b2c99b19f69463d724b0655fe46db6d2a4694a2f7/download"))()

							 -- 2. Knife Duels / Quick Play Matches
							 elseif string.find(gameName, "knife")
							    or string.find(gameName, "duel")
								   or string.find(gameName, "quick play")
								      or placeId == 112731528776884
									     or gameId == 112731528776884
										    or placeId == 85024203742894
											   or gameId == 85024203742894 then

											       loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/fa9aae23e7ecc66fbcca336fa925b93cd3fdd94f5ac7dbb0e9f4881f810ec4be/download"))()

												   -- 3. Other Games
												   elseif placeId == 118418618261207 or gameId == 118418618261207 then

												       loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/473038d1a5466c7617e0dd61c7dd4350d56cd256b18e82bae837383f9350b4f8/download"))()

													   -- 4. Updated loader for 107778070777162
													   elseif placeId == 107778070777162 or gameId == 107778070777162 then

													       loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/ca908b5f9202086e5d08d208acc5f0cbaa4980c63e2777b156897f1c53d8598f/download"))()

														   -- 5. Other mapped game
														   elseif placeId == 11729688377 or gameId == 11729688377 then

														       loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/5ba6d919b8c2a45d1c479b2764f7f13ab39590c96f2866f43c76ac34450e61f5/download"))()

															   else
															       warn("No script mapped! Place: " .. gameName .. " (" .. placeId .. ")")
																   end

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Could not load the script. Check your internet connection and try again later.";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("No key provided. Get a key from the script provider, enter it, then try again.");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/a62237c6a75399adc9add4151ebeeb91c1f965fab665a650dcbc699a5622b37f?v=2&errors=text",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h then local c,n=h:match("^([^\r\n]+)\n([^\r\n]+)$");c=c or h;if#c<=75 and(c=="LDR-DENIED"or c:match("^LDR%-DENIED:[A-Z_]+$"))then if not n or#n>512 then n=m;if k==""or k:match("^%s*$")then n="No key provided. Get a key from the script provider, enter it, then try again." end end;v(n.." ("..c..")");return end end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end