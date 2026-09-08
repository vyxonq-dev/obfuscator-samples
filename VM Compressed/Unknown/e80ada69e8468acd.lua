-- Anomicrazy v1.41







local player = game.Players.LocalPlayer
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Loading...",
        Text = "Anomicrazy is loading, please wait."
--# just incase if the player executed the script too early
    })
task.wait(5)

loadstring(game:HttpGet("https://raw.githubusercontent.com/BlackfireSoon/Ignation-Hub/refs/heads/main/Anomicrazy/ogscript.lua"))()

task.wait(30)
print("moggers")
local request = (syn and syn.request) or (http and http.request) or http_request	
local HttpService = game:GetService("HttpService")
local TextInFile = "black monkey"
local Discord_Invite = "W3xdcfp2P9"
local FolderName = "Enhanced Software"
local Folder2 = "/Discord Invites"
local FileName = "/Enhanced Software.gg" 
if not isfolder(FolderName..Folder2) then
	makefolder(FolderName..Folder2)
end
if not isfile(FolderName..Folder2..FileName) then
	if request then
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
			args = {code = Discord_Invite}
			})
		})
	end
	writefile(FolderName..Folder2..FileName, TextInFile)
end