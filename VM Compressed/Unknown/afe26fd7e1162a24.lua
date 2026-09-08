




















local BACKEND = "https://gateway.404hub.lol"



local function alert(msg)
  warn("[404] " .. msg)
  pcall(function()
    game
      :GetService("StarterGui")
      :SetCore("SendNotification", { Title = "404hub", Text = tostring(msg), Duration = 10 })
  end)
end


local cfg = type(_G.H404_CONFIG) == "table" and _G.H404_CONFIG or {}


local inherited = cfg.loader_managed == true
cfg.loader_managed = nil
do
  
  
  
  
  
  
  
  if inherited then
    cfg.backend_url = nil
  end
  local args = (...)
  if type(args) == "table" then
    for k, v in pairs(args) do
      cfg[k] = v
    end
  end
end





if type(cfg.backend_url) ~= "string" or not cfg.backend_url:match("^https?://") then
  cfg.backend_url = BACKEND
end
if cfg.autoreload == nil then
  cfg.autoreload = true
end
if cfg.ws == nil then
  cfg.ws = true
end



if cfg.channel == "dev" then
  cfg.dev = true
end




cfg.loader_managed = true
_G.H404_CONFIG = cfg




if not cfg.backend_url:match("^https?://") then
  return alert(
    'Unsubstituted loader template — fetch it from the gateway: loadstring(game:HttpGet("https://gateway.404hub.lol/script"))()'
  )
end




local function httpGet(url)
  local req = (syn and syn.request)
    or http_request
    or request
    or (http and http.request)
    or (fluxus and fluxus.request)
  if req then
    local ok, res = pcall(req, { Url = url, Method = "GET" })
    if not ok then
      return nil, tostring(res)
    end
    
    
    
    
    
    if type(res) ~= "table" then
      return nil, tostring(res)
    end
    local code = tonumber(res.StatusCode or res.Status)
    if not code then
      return nil, "no status in response"
    end
    if code < 200 or code >= 300 then
      return nil, "HTTP " .. code
    end
    local body = res.Body or res.body
    if type(body) ~= "string" or #body == 0 then
      return nil, "HTTP " .. code .. " with empty body"
    end
    return body
  end
  
  
  local ok, body = pcall(game.HttpGet, game, url)
  if not ok then
    return nil, tostring(body)
  end
  if type(body) ~= "string" or #body == 0 then
    return nil, "empty response body"
  end
  return body
end



local function fetchBootstrap()
  local HttpService = game:GetService("HttpService")
  local err
  for attempt = 1, 3 do
    local body, herr = httpGet(cfg.backend_url .. "/api/v1/scripts/bootstrap")
    if body then
      local ok, d = pcall(HttpService.JSONDecode, HttpService, body)
      if ok and type(d) == "table" and type(d.code) == "string" and #d.code > 0 then
        return d.code
      end
      err = "bad response shape"
    else
      err = herr
    end
    if attempt < 3 then
      task.wait(attempt * 0.5)
    end
  end
  return nil, err
end

local code, ferr = fetchBootstrap()
if not code then
  return alert("Couldn't reach the backend (" .. tostring(ferr) .. "). Try again shortly.")
end

local fn, perr = loadstring(code, "=bootstrap")
if not fn then
  return alert("Bootstrap parse error: " .. tostring(perr))
end

local ok, rerr = xpcall(fn, function(e)
  return debug.traceback(tostring(e), 2)
end)
if not ok then
  alert("Bootstrap crashed on launch — re-execute to retry.")
  warn("[404] " .. tostring(rerr))
end
