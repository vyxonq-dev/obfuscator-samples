
--[[

You can upload this file on your github, pastebin, anywhere you want and generate a loadstring.
    
Add 'lp_key' variable if your user has a key on top of this loader.

You can remove this message block as you like.


 _                ____            _   
| |   _   _  __ _|  _ \ _ __ ___ | |_ 
| |  | | | |/ _` | |_) | '__/ _ \| __|
| |__| |_| | (_| |  __/| | | (_) | |_ 
|_____\__,_|\__,_|_|   |_|  \___/ \__|
                                    

]]--
("LuaProt V2 Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and will result in a global blacklist from all LuaProt protected scripts."):sub(1,1);local f=("93232147347178186081");if(not lp_key)then lp_key="x"; end;local c=(http and http.request) or request;local v=function(h) while(task.wait())do pcall(function() game:GetService("Players").LocalPlayer:Kick(h);local v=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;v.TitleFrame.ErrorTitle.Text="LuaProt";v.MessageArea.ErrorFrame.ErrorMessage.Text=h; end); end; end;if(not f)then return v("Missing script id."); end;local b;local o={"eu-1","eu-2","us-1"};local h,k=pcall(function() return c({Url="https://eu-1.luaprot.net/api/v1/nodes/get"}); end);if(h and k and k.StatusCode==200)then local b;pcall(function() b=game:GetService("HttpService"):JSONDecode(k.Body); end);if(b and b.success and b.node)then for i,n in o do if(n==b.node)then table.remove(o,i);table.insert(o,1,b.node);break; end; end; end; end;for _,p in o do local r=os.clock();local y;task.spawn(pcall,function() y=c({Url="https://"..p..".luaprot.net/api/v2/loader/get?key="..lp_key.."&scriptId="..f}); end);repeat task.wait(); until(os.clock()-r>15 or y);if(y and ({[200]=true,[201]=true})[y.StatusCode])then LP_NODE=p;b=loadstring(y.Body);if(b)then break; end; end; end;if(b and LP_NODE)then b(LP_NODE); else v("V2 loader failed to load script. Report this and try again later!"); end;
