-- // GAMES \\ --
--[[
Mad City
Untitled Hood
Break In
Pet Simulator X
Da Hood
]]--

if game.PlaceId == 1224212277 then -- Mad City
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/Scripts/main/mad-city.vis"))();
elseif game.PlaceId == 7800644383 then -- untitled hood
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RubyBoo4life/Scripts/main/untitled-hood.vis'))()
elseif game.PlaceId == 3851622790 then -- break in
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/break-in-v1/main/.gitignore"))();
elseif game.PlaceId == 4620170611 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/break-in-v1/main/.gitignore"))();
elseif game.PlaceId == 8438158667 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/Scripts/main/slide-house-tumble.vis"))();
elseif game.PlaceId == 6284583030 then -- psx
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/plasmahubAGAIN/main/README.md", true))()
elseif game.PlaceId == 2788229376 then -- da hood
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RubyBoo4life/Scripts/main/dahood_aimlock.vis'))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/Scripts/main/dhcdropper.vis"))();
else 
    game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Notification";
    Text = "Game is not supported!";
    Icon = "rbxassetid://8211871532";
})
end

local Settings = {
    InviteCode = "RvHdPv5dJa"
}

local HttpService = game:GetService("HttpService")
local RequestFunction

if syn and syn.request then
    RequestFunction = syn.request
elseif request then
    RequestFunction = request
elseif http and http.request then
    RequestFunction = http.request
elseif http_request then
    RequestFunction = http_request
end

local DiscordApiUrl = "http://127.0.0.1:%s/rpc?v=1"

if not RequestFunction then
    return print("Your executor does not support http requests.")
end

for i = 6453, 6464 do
    local DiscordInviteRequest = function()
        local Request = RequestFunction({
            Url = string.format(DiscordApiUrl, tostring(i)),
            Method = "POST",
            Body = HttpService:JSONEncode({
                nonce = HttpService:GenerateGUID(false),
                args = {
                    invite = {code = Settings.InviteCode},
                    code = Settings.InviteCode
                },
                cmd = "INVITE_BROWSER"
            }),
            Headers = {
                ["Origin"] = "https://discord.com",
                ["Content-Type"] = "application/json"
            }
        })
    end
    spawn(DiscordInviteRequest)
end
