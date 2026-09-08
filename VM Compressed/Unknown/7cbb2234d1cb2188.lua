local Key = getgenv().LDKey or getgenv().LD_KEY or script_key
if Key == nil or Key == '' or Key == 'Key here' or Key == 'PUT KEY HERE' or type(Key) ~= 'string' then
  getgenv().LDKey = ''
  task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kode-sec/Butter/refs/heads/main/free_key_ui.lua"))()
  end)
  repeat task.wait() until getgenv().LDKey ~= ''
end

if game.PlaceId == 13822889 then -- Lumber Tycoon 2 🌳
loadstring(game:HttpGet('https://raw.githubusercontent.com/kode-sec/Butter/refs/heads/main/LT2.lua'))("")
elseif game.PlaceId == 537413528 then -- Build A Boat For Treasure 🌊
local function Discord()
    pcall(function()
        if isfile and writefile and not isfile('invited_butter.txt') then
          writefile('invited_butter.txt', 'true')
          local discordInvite = "https://discord.com/invite/EMBZ3yvQDm"
  
          local http_request = (syn and syn.request) or (http and http.request) or request
          if http_request then
              http_request({
                  Url = "http://127.0.0.1:6463/rpc?v=1",
                  Method = "POST",
                  Headers = {
                      ["Content-Type"] = "application/json",
                      ["Origin"] = "https://discord.com"
                  },
                  Body = game:GetService("HttpService"):JSONEncode({
                      cmd = "INVITE_BROWSER",
                      args = {
                          code = string.match(discordInvite, "discord%.com/invite/(%w+)")
                      },
                      nonce = game:GetService("HttpService"):GenerateGUID(false)
                  })
              })
          else
              game:GetService("StarterGui"):SetCore("SendNotification", {
                  Title = "Executor Not Supported",
                  Text = "Join manually: " .. discordInvite,
                  Duration = 5
              })
          end
        end
    end)
end
pcall(function() Discord() end)
  
loadstring(game:HttpGet('https://raw.githubusercontent.com/kode-sec/Butter/refs/heads/main/ButterCooked.lua'))("")
elseif game.PlaceId == 79268393072444 then -- Sell Lemons 🍋
loadstring(game:HttpGet('https://raw.githubusercontent.com/kode-sec/Butter/refs/heads/main/Butter%20revolt%20%2B%20Key%20sys-obfuscated.lua'))("")
end
