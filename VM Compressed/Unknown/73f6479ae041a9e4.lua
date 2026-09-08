--[[

  ____  ______ _______ _______ ______ _____    _______ _    _          _   _   _   _ ______ _    _ _____   ____  _   _  __   __
 |  _ \|  ____|__   __|__   __|  ____|  __ \  |__   __| |  | |   /\   | \ | | | \ | |  ____| |  | |  __ \ / __ \| \ | | \ \ / /
 | |_) | |__     | |     | |  | |__  | |__) |    | |  | |__| |  /  \  |  \| | |  \| | |__  | |  | | |__) | |  | |  \| |  \ V / 
 |  _ <|  __|    | |     | |  |  __| |  _  /     | |  |  __  | / /\ \ | . ` | | . ` |  __| | |  | |  _  /| |  | | . ` |   > <  
 | |_) | |____   | |     | |  | |____| | \ \     | |  | |  | |/ ____ \| |\  | | |\  | |____| |__| | | \ \| |__| | |\  |  / . \ 
 |____/|______|  |_|     |_|  |______|_|  \_\    |_|  |_|  |_/_/    \_\_| \_| |_| \_|______|\____/|_|  \_\\____/|_| \_| /_/ \_\
                                                                                                                               
                                                                                                                               
]]

if script_key then return loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/84540224acb21db4b7ffadb76a63fefd.lua"))(); end;

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/lib/AuthLib.lua'))();

local win = lib.new('Key System');

win.AddButton('Get Key',function()
    (setclipboard or toclipboard)('https://ads.luarmor.net/get_key?for=KNClinkvertise-NyZRHgKYOfty');
end);

win.AddButton('Login',function(a)
    task.delay(1,function() a.Close(); end);
    
    script_key=a.Text;
    
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/84540224acb21db4b7ffadb76a63fefd.lua"))();
end);

win.AddButton('Discord',function()
    (setclipboard or toclipboard)('https://discord.gg/kncrypthub');

    if request then
			request({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = game:GetService('HttpService'):JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = game:GetService('HttpService'):GenerateGUID(false),
					args = {code = 'wPaQZwhMHy'}
				})
			})
	end
end);

if request then
			request({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = game:GetService('HttpService'):JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = game:GetService('HttpService'):GenerateGUID(false),
					args = {code = 'wPaQZwhMHy'}
				})
			})
	end
