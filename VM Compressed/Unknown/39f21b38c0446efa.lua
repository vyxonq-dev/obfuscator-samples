local Enabled = true
local Players = game.Players
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService('Lighting')
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService('TweenService')
local Blur = Instance.new("BlurEffect")
Blur.Size = 1
local Camera = workspace.CurrentCamera
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shidemuri/scripts/main/ui_lib.lua"))()
if not game:IsLoaded() then game.Loaded:Wait() end
do -- Ui
	local zee = Library:New("Zee Hub")
	local PlTab = zee:NewTab("LocalPlayer")
	local ScriptsTab = zee:NewTab("Replicatesignal")
	local MoreTab = zee:NewTab("Reanimate")
	local kj = zee:NewTab("Character Animations")
	local OthersTab = zee:NewTab("Others")
	local AdminsTab = zee:NewTab("Admin commands")
	local ChatTab = zee:NewTab("Chat")
	local conTab = zee:NewTab("Console")
	local exeTab = zee:NewTab("Executors")
	local anim = zee:NewTab("Animation ID")
	local Credits = zee:NewTab("Credits,Supported")
	
	UserInputService.InputBegan:Connect(function(Input,Typing)
		if Input.KeyCode == Enum.KeyCode.B and not Typing and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			Enabled = not Enabled
			if Enabled then
				zee:Show()
			else
			    zee:Hide()
			end
		end
	end)
	
	function Notify(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 4;
    })
end

    do -- PlTab
        local ws = PlTab:NewTextBar('WalkSpeed', 'Put a number that you want and then set it')
		PlTab:NewButton('Set WalkSpeed','sets it', function()
			local numberr = ws:GetText()
			
			player.Character.Humanoid.WalkSpeed = numberr
    end)
    
        local jp = PlTab:NewTextBar('JumpPower', 'Put a number that you want and then set it')
		PlTab:NewButton('Set JumpPower','sets it', function()
			local numberrr = jp:GetText()
			
			player.Character.Humanoid.JumpPower = numberrr
    end)
    
        local hh = PlTab:NewTextBar('HipHeight', 'Put a number that you want and then set it')
		PlTab:NewButton('Set HipHeight','sets it', function()
			local numberrrr = hh:GetText()
			
			player.Character.Humanoid.HipHeight = numberrrr
    end)
    
        local gr = PlTab:NewTextBar('Gravity', 'Put a number that you want and then set it')
		PlTab:NewButton('Set Gravity','sets it', function()
			local numberrrrr = ws:GetText()
			
			game.Workspace.Gravity = numberrrrrr
    end)
    PlTab:NewSearchBar()
end
	
	do -- ScriptsTab
		ScriptsTab:NewButton("Permadeath", "Takes 5 seconds to do", function()
			if replicatesignal then
Notify("Info", "Please Wait 5 seconds")
replicatesignal(player.ConnectDiedSignalBackend)
else
    Notfy("Uh Oh!", "Your executor doesn't supports replicatesignal function,please check supported!")
end
task.wait(Players.RespawnTime + .1)
Notify("Permadeath", "You can reset and do permadeath")
		end)
		
		ScriptsTab:NewButton("UnPermadeath", "Takes 5 seconds to do", function()
			Notify("Info", "Please Wait 5 seconds")
replicatesignal(player.ConnectDiedSignalBackend)
		end)
		
		ScriptsTab:NewButton("InstantRespawn", "Takes 5 seconds to do", function()
		local old = player.Character.HumanoidRootPart.CFrame
local cam = workspace.CurrentCamera.CFrame
if replicatesignal then
Notify("Info", "Please Wait 5 seconds")
  replicatesignal(player.ConnectDiedSignalBackend)
else
    Notfy("Uh Oh!", "Your executor doesn't supports replicatesignal function,please check supported!")
end
task.wait(Players.RespawnTime - .165)
replicatesignal(player.Kill)
wait(0.7)
player.Character.HumanoidRootPart.CFrame = old
workspace.CurrentCamera.CFrame = cam
	end)
		
		ScriptsTab:NewButton("Bypass", "Bypasses some games anti reanimate scripts like brookhaven", function()
		Notify("Info", "Please Wait 5 seconds")
		replicatesignal(player.ConnectDiedSignalBackend)
		task.wait(game.Players.RespawnTime + .1)
	    	replicatesignal(player.Character.Humanoid.ServerBreakJoints)
	end)
	
		ScriptsTab:NewButton("Permadeath 2", "permadeath from gee cee hub owners press respawn to unpermadeath", function()
	    	local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
    end)
    
		ScriptsTab:NewButton("Dupe Tools", "works in some games that allows you to drop tools", function()
	    	loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/72eba32155128712a4426c995a7cada1/raw/e0f8417ff33994c4ddefa566d580cf9a7020efa2/DupeTools"))()
	end)
	
		ScriptsTab:NewButton("Kill", "i dont know why did i added this lol (useless)", function()
		    replicatesignal(player.Kill)
	end)
	
local he = ScriptsTab:NewTextBar('Health', 'Enter The Health Amount You Want To Get')
		ScriptsTab:NewButton('Set Health','it sets the health you just put above', function()
			local nm = he:GetText()
			
			player.Character.Humanoid:SetStateEnabled(15, false)
            replicatesignal(player.Kill)
            player.Character.Humanoid.Health = nm
    end)
    
local server = ScriptsTab:NewTextBar('ServerEquipTool', 'Put The Path Of The Tool And Get It(Patched Client-sided)')
		ScriptsTab:NewButton('Get The Tool','It ServerEquipTool The Tool Path You Just Put Above', function()
			local rep = server:GetText()
			
			replicatesignal(player.Character.Humanoid.ServerEquipTool, rep)
    end)
    
local time = ScriptsTab:NewTextBar('Chat TimeOut', 'Enter The Amount Of TimeOut And Then Press TimeOut')
		ScriptsTab:NewButton('TimeOut','it timeouts you', function()
			local op = time:GetText()
			
			replicatesignal(game:FindService("TextChatService").UpdateChatTimeout, game.Players.LocalPlayer.UserId, op, op, op)
    end)
    
local edit = ScriptsTab:NewTextBar('Edit Message (New Chat Sytem)', 'Enter a word and then press edit and then chat something')
		ScriptsTab:NewButton('Edit','it edits to message you just did put above', function()
			local ed = edit:GetText()
			
			game.TextChatService.OnIncomingMessage = function(a,b)
local randommsg = a.MessageId
if a.TextSource.Name == player.Name then
task.wait(2)
replicatesignal(game.TextChatService.ClientToServerMessageReplicateSignalV2, ed, a.Metadata, a.MessageId, a.TextSource, a.TextChannel)
end
end
    end)
	
	ScriptsTab:NewSearchBar()
end
	
	do -- MoreTab
	    MoreTab:NewLabel("Patchma versions")
	
		MoreTab:NewButton("Patchma V46", "Patchma hub orginal v46", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/27bc28fcca00dfecb8fee3449a2f3dfe/raw/f72b10780d3a61503ce514624eeff24c5f4a4427/gistfile1.txt"))()
	end)
	
		MoreTab:NewButton("Patchma DX", "Patchma hub but DX Version", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrBwoken/PatchmaDX/refs/heads/main/PatchmaDX.lua"))()
	end)
	
	    MoreTab:NewLabel("Foileds hat reanimate hub")
	
		MoreTab:NewButton("Sync X", "Made By Foiled", function()
		    _G.hatshats = [[
_G.HatsLol = {
["Right Arm"] = {
{Texture = "18640914168", Mesh = "18640914129", Name = "Accessory (NoobRightArm)", Offset = CFrame.Angles(0, math.rad(90), 0)}
},

["Left Arm"] = {
{Texture = "18640914168", Mesh = "18640914129", Name = "Accessory (NoobLeftArm)", Offset = CFrame.Angles(0, math.rad(90), 0)}
},

["Right Leg"] = {
{Texture = "18640901676", Mesh = "18640901641", Name = "Accessory (NoobRightLeg)", Offset = CFrame.Angles(0, 0, 0)}
},

["Left Leg"] = {
{Texture = "18640901676", Mesh = "18640901641", Name = "Accessory (NoobLeftLeg)", Offset = CFrame.Angles(0, 0, 0)}
},

["Torso"] = {
{Texture = "18640899481", Mesh = "18640899369", Name = "Accessory (NoobTorso)", Offset = CFrame.identity}
},
}
]]

 loadstring(game:HttpGet("https://raw.githubusercontent.com/hellothere-lol/a/refs/heads/main/syncsuncx.lua"))()
	end)
	
	    MoreTab:NewLabel("Gee cee")
	
		MoreTab:NewButton("Gee cee Hub", "Not released Yet", function()
		    Notify("Info", "Please wait...")
		wait(5)
		Notify("Xd", "did you really think that will work?")
	end)
	
	   MoreTab:NewLabel("Melon Scripters hub")
	
	   MoreTab:NewButton("Disbelief Hub", "Made By Melon Scripter", function()
	        --[[
   Info:
   Name: FE Disbelief Hub

   Credits:
   Tescalus/Croaxer - Animation player
   MelonScripter - fixing this hub and creating it
   Emper - Reanimate
   MyWorld - Optimization
   
   Hats:
   Paid Rig 1 (Cheaper, VIable)
   https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless  
   https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body

   Paid Rig 2 (More Expensive, Better)
   https://www.roblox.com/catalog/14768701869/White-Extended-Left-Arm
   https://www.roblox.com/catalog/14255554762/Extra-Left-White-Arm
   https://www.roblox.com/catalog/14768693948/White-Extended-Right-Arm
   https://www.roblox.com/catalog/14255556501/Extra-Right-White-Arm
   https://www.roblox.com/catalog/14255528083/Torso-Extension

   Free Rig
   https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   https://www.roblox.com/catalog/9867481700/Le-Rouge-Cross-body-Bag-1-0
   https://www.roblox.com/catalog/9867487176/Le-Rouge-Cross-body-Bag-3-0
   https://www.roblox.com/catalog/4819740796/Robox

  Socials:
   https://twitter.com/MelonScripter
   https://www.youtube.com/@MelonScripter

  Open sourced fixed player cause of pendulum license

  function Dance(AnimID, AnimSpeed)
local NeededAssets = game:GetObjects("rbxassetid://"..AnimID)[1]
local TweenService = game:GetService'TweenService'
  	local Joints = {
		["Torso"] = workspace.non.HumanoidRootPart["RootJoint"],
		["Right Arm"] =  workspace.non.Torso["Right Shoulder"],
		["Left Arm"] =  workspace.non.Torso["Left Shoulder"],
		["Head"] =  workspace.non.Torso["Neck"],
		["Left Leg"] =  workspace.non.Torso["Left Hip"],
		["Right Leg"] =  workspace.non.Torso["Right Hip"]
	}
	local speed = AnimSpeed
    while true do
			local keyframes = NeededAssets:GetKeyframes() -- get keyframes, this is better then getchildren bc it gets the correct order 
				for ii,frame in pairs(keyframes) do -- for i,v on each keyframe to get each individual frame
					local duration = keyframes[ii+1] and keyframes[ii+1].Time - frame.Time or task.wait(1/120)
					if keyframes[ii-1] then
						task.wait((frame.Time - keyframes[ii-1].Time)*speed)
					end
					for i,v in pairs(frame:GetDescendants()) do -- get each part in the frame
						if Joints[v.Name] then -- see if the part exists in the joint table
							TweenService:Create(Joints[v.Name],TweenInfo.new(duration*speed),{Transform = v.CFrame}):Play()
						end
					end
				end
				task.wait(1/120)
        end
end

Dance(AnimId, SpeedVal)
-- CHANGE YOUR CLIENT RIG TO WORKSPACE.NON!!
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/75b93caa7fa2db08dbec1fdfe6771826/raw/7cc9bb79c766896a3c527be52a7be870a6c9e371/Disbelief.txt"))()
end)

        MoreTab:NewLabel("Genesis")
	
		MoreTab:NewButton("AK-47", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = false --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Ban Hammer", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Dearsister", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Dearsister"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Gale Fighter", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Goner", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Good Cop Bad Cop", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Good%20Cop%20Bad%20Cop"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Krystal dance", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = true --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()

--==========================================================================================================================--



	end)
	
		MoreTab:NewButton("Lightning Cannon", "Genesis", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
	end)
	
		MoreTab:NewButton("Linked Sword", "Genesis", function()
		    DisableFlingHealthBar = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Linked%20Sword"))()
	end)
	
		MoreTab:NewButton("Minigun", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Minigun"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Motorcycle", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Neko", "Genesis", function()
		    DisableFlingHealthBar = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neko"))()
	end)
	
		MoreTab:NewButton("Neptunian V", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()

--==========================================================================================================================--

	end)
	
		MoreTab:NewButton("Puppet Master", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--===================================--
--=         Script Options          =--
--===================================--

DisableRedAnimatedText = false --disables the animated text that keeps popping up on screen, does not disable Kills, Target or Script Title

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Puppet%20Master"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Sadist Genocider", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Sniper", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()

--==========================================================================================================================--

	end)
	
		MoreTab:NewButton("Star Glitcher", "Genesis", function()
		    -- SET THE VARIABLE BELOW TO TRUE TO DISABLE ALL EFFECTS, COULD HELP WITH PERFORMANCE ISSUES
DisableFX = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Star%20Glitcher"))()
	end)
	
		MoreTab:NewButton("Studio Dummy", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = true --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Studio%20Dummy"))()

--==========================================================================================================================--
	end)
	
		MoreTab:NewButton("Sin Dragon", "Genesis", function()
		    --[[
_________                       _____            ___________________
__  ____/__________________________(_)_______    ___  ____/__  ____/
_  / __ _  _ \_  __ \  _ \_  ___/_  /__  ___/    __  /_   __  __/   
/ /_/ / /  __/  / / /  __/(__  )_  / _(__  )     _  __/   _  /___   
\____/  \___//_/ /_/\___//____/ /_/  /____/      /_/      /_____/   							

by rqz					
https://discord.com/invite/aEZpBEHgMT
]]--

--===================================--
--=         Script Options          =--
--===================================--

transparent = true --toggle clientsided parts (dragon head, claws, etc)
effects = true --toggle clientsided effects (punch effect, laser effect, etc), set this to false if you use an emulator and you are lagging

--====================================--
--           FDless Options           --
--====================================--

permadeath = true --adds permanent death (no respawning), see #supported-executors channel for executors that work with this
fling = true --toggle fling
allowshiftlock = true --adds shiftlock to patchma rig
ctrltp = false --adds control click tp
placeholders = true --adds transparent parts showing your hats when you don't have real ones
clickfling = false --adds click flinging regardless of attacks
highlightflingtargets = true --highlight fling
discharscripts = true --disable character scripts
flingchangestate = true --fling with whole body
hidedeatheffect = true --hides the red damage border when you die (respawn)
respawntp = 3 --respawn tp mode
-- 0 - stay at spawn
-- 1 - randomtp close
-- 2 - behind fake character
-- 3 - hide body
breakjointsmethod = 1 --breakjoints mode
-- 1 - health+breakjoints (the most support)
-- 2 - health or breakjoints
-- 3 - breakjoints
simrad = true --sets simulation radius

--==========================================================================================================================--

loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()

--==========================================================================================================================--
	end)
	
	    MoreTab:NewLabel("Melon Scripters Converts")
	
		MoreTab:NewButton("Minigun", "Melon Scripters minigun script", function()
--[[
Credits:
MelonScripter - Converted and aligned
??? - Creator
Emper - Reanimate
MyWorld - Optimization

[PAID] Minigun: https://www.roblox.com/catalog/121693295536898/Pixel-Bit-Heavy-Duty-Machine-Gun

[FREE] Minigun: https://www.roblox.com/catalog/15254947445/24k-Gold-Plunger
https://www.roblox.com/catalog/5552252553/Kinetic-Staff

[FREE] Fedora Rig:
// https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
// https://www.roblox.com/catalog/3409612660/International-Fedora-USA
// https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
// https://www.roblox.com/catalog/3033908130/International-Fedora-France
// https://www.roblox.com/catalog/4819740796/Robox

[PAID] Soldier Rig:
// https://www.roblox.com/catalog/139102413583361/Metal-Arm
// https://www.roblox.com/catalog/121830551276315/Prosthetic
// https://www.roblox.com/catalog/99726531005445/Black-Prosthetic-Metal-Arm-RIGHT
// https://www.roblox.com/catalog/18989526470/Black-Prosthetic-Metal-Arm-LEFT
// https://www.roblox.com/catalog/74295684215899/Emo-Black-Armored-Vest
// https://www.roblox.com/catalog/17510626021/Black-Star-Praetorian-Helmet

[PAID] Spartan Rig:
// https://www.roblox.com/catalog/120903328751560/Prosthetic-Arm
// https://www.roblox.com/catalog/72858864947626/Prosthetic
// https://www.roblox.com/catalog/101118281111918/Metal-Arm
// https://www.roblox.com/catalog/98663604283708/Prosthetic-Arm
// https://www.roblox.com/catalog/17171230401/Black-Torso
// https://www.roblox.com/catalog/14898866310/Red-Alt-ODIN-Thor-Armor
// https://www.roblox.com/catalog/14898895385/Red-Alt-ODIN-Thor-Helmet

[PAID] Grey Rig:
// https://www.roblox.com/catalog/80479688830908/Gray-Torso-Extension
// https://www.roblox.com/catalog/80401121980206/GREY-Right-Leg
// https://www.roblox.com/catalog/74603792617282/GREY-Left-Leg
// https://www.roblox.com/catalog/111809732325428/clover-left-arm
// https://www.roblox.com/catalog/94138150908378/green-clover

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

Socials:
// https://x.com/MelonScripter
// https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/e7b408abcb813525d37e9b7a6bf301c9/raw/6421f9000e90e8a4c2ed57052208acbd6f9648dd/Minigun.txt"))()
	end)
	
		MoreTab:NewButton("Horizon lightning cannon", "Melon Scripters LC script", function()
if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
end
--[[
   Credits:
   MelonScripter - Converted and aligned
   JustSolidify - Creator
   Emper - Reanimate
   MyWorld - Optimization
      
   [PAID] Weapons: https://www.roblox.com/catalog/17386491617/Void-RPG
   https://www.roblox.com/catalog/17386482772/Void-Alligator-Jaw

   [FREE] Fedora Rig:
   // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
   // https://www.roblox.com/catalog/3033908130/International-Fedora-France
   // https://www.roblox.com/catalog/4819740796/Robox

   [PAID] Grey Rig:
   // https://www.roblox.com/catalog/80479688830908/Gray-Torso-Extension
   // https://www.roblox.com/catalog/80401121980206/GREY-Right-Leg
   // https://www.roblox.com/catalog/74603792617282/GREY-Left-Leg
   // https://www.roblox.com/catalog/111809732325428/clover-left-arm
   // https://www.roblox.com/catalog/94138150908378/green-clover
  
   [PAID] Classic Rig:
   // https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
   // https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   // https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless
   
   Socials:
   // https://x.com/MelonScripter
   // https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/34653df65434cbbbc36b3ec51d03e7a3/raw/8bd9ef0ad4495baa06f435629b562a103eaf2bf8/HorizonLC"))()
	end)
	
		MoreTab:NewButton("immortality lord", "Melon Scripters immortality lord script", function()
if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
end
--[[
   Credits:
   MelonScripter - Fixed and aligned
   ??? - Convert (I couldn't find the original person that converted this)
   Amourousity - Creator
   Emper - Reanimate
   MyWorld - Optimization
   
   [FREE] Weapons: https://www.roblox.com/catalog/7548993875/Slasher
   https://www.roblox.com/catalog/4324158403/International-Fedora-Japan
   https://www.roblox.com/catalog/3443038622/International-Fedora-Peru
   
   [PAID] Weapons: https://www.roblox.com/catalog/5268602207/Void-Lord-Sword
   https://www.roblox.com/catalog/5593848751/The-Right-Solo-Wing
   https://www.roblox.com/catalog/5505301521/The-Left-Solo-Wing

   [FREE] Fedora Rig:
   // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
   // https://www.roblox.com/catalog/3033908130/International-Fedora-France
   // https://www.roblox.com/catalog/4819740796/Robox

   [PAID] Grey Rig:
   // https://www.roblox.com/catalog/80479688830908/Gray-Torso-Extension
   // https://www.roblox.com/catalog/80401121980206/GREY-Right-Leg
   // https://www.roblox.com/catalog/74603792617282/GREY-Left-Leg
   // https://www.roblox.com/catalog/111809732325428/clover-left-arm
   // https://www.roblox.com/catalog/94138150908378/green-clover
  
   [PAID] Classic Rig:
   // https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
   // https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   // https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless
   
   Socials:
   // https://x.com/MelonScripter
   // https://www.youtube.com/@MelonScripter
]]


loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/342631416698bc733c93dbce1fc43371/raw/5b506412e72fbc1b9e9730ae7f096d33bf06e128/ImmortalityLord.lua"))()
	end)
	
		MoreTab:NewButton("Sledgehammer melee", "Melon scripters sledgehammer melee script", function()
if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
end
--[[
   Credits:
   MelonScripter - Converted and aligned
   Sadeecake - Creator
   Emper - Reanimate
   MyWorld - Optimization
   
   [FREE] Weapon: https://www.roblox.com/catalog/7168245078/Sledgehammer
   [PAID] Weapon: https://www.roblox.com/catalog/15254947445/24k-Gold-Plunger

   [FREE] Fedora Rig:
   // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
   // https://www.roblox.com/catalog/3033908130/International-Fedora-France
   // https://www.roblox.com/catalog/4819740796/Robox

   [PAID] Grey Rig:
   // https://www.roblox.com/catalog/80479688830908/Gray-Torso-Extension
   // https://www.roblox.com/catalog/80401121980206/GREY-Right-Leg
   // https://www.roblox.com/catalog/74603792617282/GREY-Left-Leg
   // https://www.roblox.com/catalog/111809732325428/clover-left-arm
   // https://www.roblox.com/catalog/94138150908378/green-clover
  
   [PAID] Classic Rig:
   // https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
   // https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   // https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless
   
   Socials:
   // https://x.com/MelonScripter
   // https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/bc7a020c542be0b7f528a5d8fda5ad52/raw/0db8993dc638613bd91b10fdbceb5c2d0754711e/SledgeHammer.lua"))()
	end)
	
		MoreTab:NewButton("Void Boss", "Melon Scripters Void Boss script", function()
if replicatesignal then
		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
end
		    --[[
   Credits:
   MelonScripter - Converted and Aligned 
   123jl123 - Creator of Void Boss
   Emper - Reanimate creator
   MyWorld - Optimization on reanimate

   Main Hats:
   [PAID] https://www.roblox.com/catalog/17270001635/Void-Backpack
   [PAID] https://www.roblox.com/catalog/17269998373/Middle-Void-Block
   [PAID] https://www.roblox.com/catalog/117186631495734/small-claw
   [PAID] https://www.roblox.com/catalog/132770514241770/small-claw-2

   Alternative hands:
   [PAID] https://www.roblox.com/catalog/17269952801/Right-Void-Wall
   [PAID] https://www.roblox.com/catalog/17269983359/Left-Void-Wall
   
   Optional torso:
   [PAID] https://www.roblox.com/catalog/17270178857/Huge-Void-Backpack

   Socials:
   // https://x.com/MelonScripter
   // https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/679dc6167ec854831759f495b970cc71/raw/9663b65e4df1fa491f1227aee8cbea43cbfe04d8/VoidBoss.lua"))()
	end)
	
		MoreTab:NewButton("Stand", "Melon Scripters Stand script", function()
if replicatesignal then
		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
end
		    --[[
   Credits:
   MelonScripter - Converted and Aligned 
   BeezelduD - Creator of Internal War
   Emper - Reanimate creator
   MyWorld - Optimization on reanimate

   Titan/Stand Hats:
   [PAID] https://www.roblox.com/catalog/17270178857/Huge-Void-Backpack
   [PAID] https://www.roblox.com/catalog/17270001635/Void-Backpack
   [PAID] https://www.roblox.com/catalog/17269998373/Middle-Void-Block
   [PAID] https://www.roblox.com/catalog/17269952801/Right-Void-Wall
   [PAID] https://www.roblox.com/catalog/17269983359/Left-Void-Wall

   Black Rig:
   // https://www.roblox.com/catalog/14255528083/Torso-Extension
   // https://www.roblox.com/catalog/17374846953/Extra-Right-Black-Arm
   // https://www.roblox.com/catalog/17374851733/Extra-Left-Black-Arm
   // https://www.roblox.com/catalog/17401151565/Extra-Right-Black-Leg
   // https://www.roblox.com/catalog/17387616772/Extra-Left-Black-Leg
   White Arms:
   // https://www.roblox.com/catalog/14255554762/Extra-Left-White-Arm
   // https://www.roblox.com/catalog/14255556501/Extra-Right-White-Arm

   Cheap Paid Rig:
   // https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
   // https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   // https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless
   
   Free Rig:
   // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
   // https://www.roblox.com/catalog/3033908130/International-Fedora-France
   // https://www.roblox.com/catalog/4819740796/Robox
   
   Socials:
   // https://x.com/MelonScripter
   // https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/20eeb7c97303b19d6079b35de1e71df4/raw/129bb5c45933671097386bcd9d944ab4e7ecc55b/InternalWar.lua"))()
	end)
	
		MoreTab:NewButton("Addict", "Melon scripters addict script", function()
if replicatesignal then
		local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)
end
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/7852526975c7ffba470e429301e67252/raw/6b72183f193945ceed40b9562c35e5a0b5b1dd65/Addict.lua"))()
	end)
	
		MoreTab:NewButton("Achromatic", "Melon Scripters Achromatic script", function()
if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
--[[
   Credits:
   MelonScripter - Converted and aligned
   Nebula_Zoroark - Creator
   Emper - Reanimate
   MyWorld - Optimization
   808scripty - Mobile UI

   Katana Wings:
   [PAID] https://www.roblox.com/catalog/16171905812/Big-Kindle-Katana-Silver
   [PAID] https://www.roblox.com/catalog/16171915973/Big-Kindle-Katana-Toxic-Pick
   [PAID] https://www.roblox.com/catalog/16294169158/Big-Kindle-Katana-Deep-Blue
   [PAID] https://www.roblox.com/catalog/16294165546/Big-Kindle-Katana-Deep-Red
   
   Greatsword Wings:
   [PAID] https://www.roblox.com/catalog/4506945409/Corrupt-Demonic-Greatsword
   [PAID] https://www.roblox.com/catalog/4458601937/Frozen-Demonic-Greatsword
   [PAID] https://www.roblox.com/catalog/4794315940/Golden-Demonic-Greatsword
   [PAID] https://www.roblox.com/catalog/4315489767/Demonic-Greatsword
    
   Fedora Wings:
   [FREE] https://www.roblox.com/catalog/4584029953/International-Fedora-Poland
   [FREE] https://www.roblox.com/catalog/3662265036/International-Fedora-Indonesia
   [FREE] https://www.roblox.com/catalog/4324158403/International-Fedora-Japan
   [FREE] https://www.roblox.com/catalog/3443038622/International-Fedora-Peru
  
   Black Rig:
   // https://www.roblox.com/catalog/14255528083/Torso-Extension
   // https://www.roblox.com/catalog/17374846953/Extra-Right-Black-Arm
   // https://www.roblox.com/catalog/17374851733/Extra-Left-Black-Arm
   // https://www.roblox.com/catalog/17401151565/Extra-Right-Black-Leg
   // https://www.roblox.com/catalog/17387616772/Extra-Left-Black-Leg
  
   White Arms:
   // https://www.roblox.com/catalog/14255554762/Extra-Left-White-Arm
   // https://www.roblox.com/catalog/14255556501/Extra-Right-White-Arm

   Cheap Paid Rig:
   // https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   // https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
   // https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   // https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless
   
   Free Rig:
   // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
   // https://www.roblox.com/catalog/3033908130/International-Fedora-France
   // https://www.roblox.com/catalog/4819740796/Robox
   

   Socials:
   // https://x.com/MelonScripter
   // https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/1e606bc885a3c12fd50bc8f29ae6ac49/raw/6f2e187cc59818d2a308bdd055ae2a93bf2fcb64/Achromatic.lua"))()
	end)
	
		MoreTab:NewButton("Dubstep cannon", "Melon Scripters Dubstep cannon", function()
if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/e8540373afe9e1af9fe8d8f38a399d2a/raw/d62543cedf9aa0a716b60fac89d7db82279ec277/DubstepGun.txt"))()
	end)
	
		MoreTab:NewButton("Blind Reaper", "Melon Scripters Blind Reaper script", function()
            if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/d39228415171bae981fd36f88dfea76e/raw/ba68ae85b118b4de303197a89eaa04b34888c4ca/BlindReaper.txt"))()
	end)
	
		MoreTab:NewButton("Vereus", "Melon Scripters Vereus script", function()
		    if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/e1eb0e07602351fdf206d3ddbd30b5b5/raw/cf13f35a001361307e2091ccfd45ea8d8397e80e/Vereus.txt"))()
	end)
	
	   MoreTab:NewButton("Exotic Sniper Cannon", "Melon Scripters Exotic Sniper Cannon", function()
	        if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
	        loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/da6cfad6ba846714e437f93b46131a22/raw/1d21d162924d8f0fd6c6f07e4d9cfd85d9b35d82/ExoticLightningCannon.lua"))()
	end)
	
	    MoreTab:NewButton("Master Chief", "Melon Scripters Master Chief Script", function()
	    if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
            loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/d19b921b5a4c4a481caf49a9669cdc48/raw/52eb84e1f2dc166f397c062cea4928b7c4ce9862/MasterChief.txt"))()
	end)
	
	    MoreTab:NewButton("Asriel Dreemurr", "Melon Scripters Asriel Dreemurr", function()
	    if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
            loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/c4ba9ac584aa6ede2c157f558ab01c66/raw/85952dcd52ebbd446067f39c71231a103604a2b8/AsrielDreemurr.lua"))()
	end)
	
	    MoreTab:NewButton("Swat Banisher", "Melon Scripters Swat Banisher script", function()
	    if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
            loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/758565b4d717fddf505810e2e1adcb26/raw/9967da3e77b32bc3f3cbcf2e97112a6981c1a1d3/SWATBanisher.txt"))()
	end)
	
	    MoreTab:NewButton("Turbolizer", "Melon Scripters Turbolizer Script", function()
	    if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
            loadstring(game:HttpGet("https://pastebin.com/raw/2NpjQ7Ra"))()
	end)
	
	 MoreTab:NewButton("Lightning Cannon", "Melon Scripters Lighting canonScript", function()
	    if replicatesignal then
		    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification",{Title = "Permadeath",Text = "Please wait "..Players.RespawnTime.." seconds"})
replicatesignal(player.ConnectDiedSignalBackend)
task.wait(Players.RespawnTime + 0.20)
replicatesignal(player.Kill)
local RespawnEvent = Instance.new("BindableEvent")
RespawnEvent.Event:Once(function()
    StarterGui:SetCore("SendNotification",{Title = "Respawning",Text = "Please wait "..Players.RespawnTime.." seconds"})
    StarterGui:SetCore("ResetButtonCallback", true)    
    replicatesignal(player.ConnectDiedSignalBackend)
end)
StarterGui:SetCore("ResetButtonCallback", RespawnEvent)		
end
            --[[
	Info:
	Name: FE Maddox LC
	Converted: ???
	Fixed: MelonScripter

   Credits:
   Emper - Reanimate
   MyWorld - Optimization
   
   Hats:
   Paid Rig 1 (Cheaper, VIable)
   https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
   https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless  
   https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
   https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
   https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body

   Paid Rig 2 (More Expensive, Better)
   https://www.roblox.com/catalog/14768701869/White-Extended-Left-Arm
   https://www.roblox.com/catalog/14255554762/Extra-Left-White-Arm
   https://www.roblox.com/catalog/14768693948/White-Extended-Right-Arm
   https://www.roblox.com/catalog/14255556501/Extra-Right-White-Arm
   https://www.roblox.com/catalog/14255528083/Torso-Extension

   Free Rig
   https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
   https://www.roblox.com/catalog/3409612660/International-Fedora-USA
   https://www.roblox.com/catalog/9867481700/Le-Rouge-Cross-body-Bag-1-0
   https://www.roblox.com/catalog/9867487176/Le-Rouge-Cross-body-Bag-3-0
   https://www.roblox.com/catalog/4819740796/Robox

  Socials:
   https://twitter.com/MelonScripter
   https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/d022e498559cc0568d71487241159531/raw/c4e3d0ba4c958b136693c31a73adabef9ac7858c/LightningCannon.txt"))()
	end)
	
	    MoreTab:NewButton("Kyus Ender", "MelonScripter's kyus ender script", function()
	       --[[
MelonScripter - Converted and aligned
Kyutatsuki13 - Creator
Emper - Reanimate

[FREE] Fedora Rig:
// https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
// https://www.roblox.com/catalog/3409612660/International-Fedora-USA
// https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
// https://www.roblox.com/catalog/3033908130/International-Fedora-France
// https://www.roblox.com/catalog/4819740796/Robox

[PAID] Snake Banisher Rig:
// https://www.roblox.com/catalog/79169258356641/Snakes-Vest-Torso
// https://www.roblox.com/catalog/102600355076384/Snakes-Reaching-Right-Arm
// https://www.roblox.com/catalog/90808514455706/Snakes-Reaching-Left-Arm
// https://www.roblox.com/catalog/120111604252410/Thin-Hammer-Head-Black
// https://www.roblox.com/catalog/88886554182275/Literal-Hammer-Head-Black

[PAID] Soldier Rig:
// https://www.roblox.com/catalog/139102413583361/Metal-Arm
// https://www.roblox.com/catalog/121830551276315/Prosthetic
// https://www.roblox.com/catalog/99726531005445/Black-Prosthetic-Metal-Arm-RIGHT
// https://www.roblox.com/catalog/18989526470/Black-Prosthetic-Metal-Arm-LEFT
// https://www.roblox.com/catalog/74295684215899/Emo-Black-Armored-Vest
 
[PAID] Grey Rig:
// https://www.roblox.com/catalog/80479688830908/Gray-Torso-Extension
// https://www.roblox.com/catalog/80401121980206/GREY-Right-Leg
// https://www.roblox.com/catalog/74603792617282/GREY-Left-Leg
// https://www.roblox.com/catalog/111809732325428/clover-left-arm
// https://www.roblox.com/catalog/94138150908378/green-clover

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

Socials:
// https://x.com/MelonScripter
// https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/e75f359fee8f18a171962df8c020ed95/raw/7106700d10ec2efc084b8879048dca72f86a10e7/KyusEnder.lua"))()
end)

        MoreTab:NewButton("Caduscus", "MelonScripter's Caduscus script", function()
             --[[
Credits:
MelonScripter - Converted and aligned
SezHu - Creator
Emper - Reanimate

[PAID] Wing:
// https://www.roblox.com/catalog/110807164391102/Fallen-Gods-Wing-Caduscus

[FREE] Fedora Rig:
// https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
// https://www.roblox.com/catalog/3409612660/International-Fedora-USA
// https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
// https://www.roblox.com/catalog/3033908130/International-Fedora-France
// https://www.roblox.com/catalog/4819740796/Robox

[PAID] Snake Banisher Rig:
// https://www.roblox.com/catalog/79169258356641/Snakes-Vest-Torso
// https://www.roblox.com/catalog/102600355076384/Snakes-Reaching-Right-Arm
// https://www.roblox.com/catalog/90808514455706/Snakes-Reaching-Left-Arm
// https://www.roblox.com/catalog/120111604252410/Thin-Hammer-Head-Black
// https://www.roblox.com/catalog/88886554182275/Literal-Hammer-Head-Black

[PAID] Soldier Rig:
// https://www.roblox.com/catalog/139102413583361/Metal-Arm
// https://www.roblox.com/catalog/121830551276315/Prosthetic
// https://www.roblox.com/catalog/99726531005445/Black-Prosthetic-Metal-Arm-RIGHT
// https://www.roblox.com/catalog/18989526470/Black-Prosthetic-Metal-Arm-LEFT
// https://www.roblox.com/catalog/74295684215899/Emo-Black-Armored-Vest
 
[PAID] Grey Rig:
// https://www.roblox.com/catalog/80479688830908/Gray-Torso-Extension
// https://www.roblox.com/catalog/80401121980206/GREY-Right-Leg
// https://www.roblox.com/catalog/74603792617282/GREY-Left-Leg
// https://www.roblox.com/catalog/111809732325428/clover-left-arm
// https://www.roblox.com/catalog/94138150908378/green-clover

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

[PAID] Classic Rig:
// https://www.roblox.com/catalog/12344545199/Extra-Left-hand-moving-Blocky-white
// https://www.roblox.com/catalog/12344591101/Extra-Right-hand-moving-Blocky-white
// https://www.roblox.com/catalog/13779879140/Black-Fluffy-Fur-Body
// https://www.roblox.com/catalog/11263254795/Dummy-Head-For-Headless
// https://www.roblox.com/catalog/11159410305/Rectangle-Head-For-Headless

Socials:
// https://x.com/MelonScripter
// https://www.youtube.com/@MelonScripter
]]

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/a1d2e5fb60f5fda0f985346f1c3392c4/raw/54c37ab3dfb72f066bc1e1cc04f4d4b3fa2d3efa/Caduscus.lua"))()
end)
	
	    MoreTab:NewLabel("Oxide Reanimations")
	
	    MoreTab:NewButton("Krystal dance v3", "A dance script", function()
	         _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = true
_G.HatCollide = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(1) -- we give it time to load properly
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/OxideReanim/refs/heads/main/KrystalDance3"))()
end)

        MoreTab:NewButton("Nitrous VR", "VR script", function()
            _G.HeadScale = 3
_G.HeadHat = "Accessory (BiggestHeadWhite)"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/NitrousVR/main/Loadstring"))()
    end)
    
        MoreTab:NewButton("CloVR", "VR script", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/clovr"))()
    end)
    
        MoreTab:NewLabel("My Converts (Used Oxide Reanim)")
        
        MoreTab:NewButton("Star Glitcher", "Converted by me", function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/b8ef7adaf772eceba6e1d395ef1a26be/raw/ecee26a35d8fdbb50b4c5886a7216d824702d2e1/ox"))()
    end)
    
        MoreTab:NewButton("Sutart", "Converted by me", function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/195ea0719c057732323d9d1be62986d6/raw/79b69ae6bac4d2f0b86222c74c15af6ddcae0f68/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Switcher Wing Master", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/de90054234f87c82e36ed2d594aaa8ee/raw/76e4b8a7a52a57af439956ca705aa75741b202a6/swm"))()
    end)
    
        MoreTab:NewButton("Ultimate Switcher", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/49eaca5e0db378f3e2ea05641836eef9/raw/459295ccc6cedbc02ea1df5b4045809563f2f5b7/us"))()
    end)
    
        MoreTab:NewButton("The Angel", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/4bc3287afb49aa68443ea7006246af8b/raw/46037b55d74f72c0765c2700837c8195418fa540/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Noob Switcher", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/6b6d0de79a245098df0a857ac8d81622/raw/33d51d7fc1c08dbb9f3d92916b651e901459a225/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Incension Reborn", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/f27b962587b03cc8f08d9b2b348a2a00/raw/c54b270e1936cf600f6abc7fdbe090bddcf0556b/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Chips", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/4df018a0c8f3b6c07bc4dc80540af6b8/raw/997c89a219bfde15f022c0cc33dddd6593e5df18/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Xester", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/2e5b211dae37c8d65f3f789dab84baf7/raw/2bfc7c696241ae16f4dd31ad5857cc173fd98070/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Meme Animation", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/525fc2842f729e75ba0782277ab70868/raw/0cecc9099cf3db65c36cc8a8c85f4091e324c578/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Memeus", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/4d699be2aadc50951560fc30485b7530/raw/77aeca054d57f7eac1629dd76227c55f0f934acb/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Chill", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/63428ce774ab7bfa4eaebb08498877bf/raw/f7cb56dfffe9dc84a707c40c5b5de5e698c1e436/gistfile1.txt"))()
    end)
    
        MoreTab:NewButton("Ender", "Converted by me", function()
            _G.HideCharacter = true
_G.FlingEnabled = false
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14768664565",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "LARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "RARM",
        TextureId = "14768683674", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "MeshPartAccessory",
        TextureId = "11263219250", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Unloaded head",
        TextureId = "11159284657", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/a725972a0f47dcb20eed01a2c4c391f4/raw/32b9fc2ab3f03662227e8b2cdc4d35b2a60e7c3f/gistfile1.txt"))()
    end)
	
	    MoreTab:NewLabel("All above is working with hats but down here are working without any hats(R6)")
	
	    MoreTab:NewLabel("Rejoin if it doesnt replicate animations")
	    
	   MoreTab:NewLabel("if it doesnt replicate again then the game patched it :(")
	
		MoreTab:NewButton("Goofy Reanimate from patchma", "Goofy Reanimate from patchma but without hats", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Silly-Booty-24305"))()
	end)
	
		MoreTab:NewButton("Krystal dance", "Krystal Dance Reanimate but without hats", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Krystal-Dance-14289"))()
	end)
	
		MoreTab:NewButton("Nameless Animation V4", "Myworld's old Nameless animation but without hats", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Silly-Fe-Nameless-Animation-V4-But-with-Less-Shake-24226"))()
	end)
	
		MoreTab:NewButton("Sad Boy", "Another Animation shit without hats", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Silly-Sadboy-15795"))()
	end)
	
		MoreTab:NewButton("Gale Fighter", "Gale Fighter but without hats", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gale-Fighter-FE-13628"))()
	end)
	
		MoreTab:NewButton("Cadacus", "Cadacus animation without hats", function()
		    loadstring(game:HttpGet("https://pastefy.app/awJrO3Q5/raw"))()
	end)
	
		MoreTab:NewButton("Ender", "Ender but without hats", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/MelonsStuff/hub/main/Nero.txt"))()
	end)
	
		MoreTab:NewButton("Sonic", "Sonic script very original", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/67e14688092ce33765170f9c20192737/raw/c7f55f3b6b6ea0fa640027101277bb0249b50d53/gistfile1.txt"))()
	end)
	
		MoreTab:NewButton("Griddy Animation", "Its Not In that Op btw", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/MelonsStuff/hub/main/Griddy.txt"))()
	end)
	
		MoreTab:NewButton("Animation Man", "Animation man script made by Im Patrick", function()
		    loadstring(game:HttpGet("https://pastefy.app/ZWgckZdU/raw"))()
	end)
	
		MoreTab:NewButton("Chill", "Chill script without hats", function()
		    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Honored.lua'),true))()
	end)
	
	    MoreTab:NewButton("Krystal dance v3", "Converted krystal dance v3", function()
	       loadstring(game:HttpGet("https://pastefy.app/uIFnuJjK/raw"))()
end)

       MoreTab:NewLabel("My Converts (Better)")
       
local ve = MoreTab:NewTextBar('MaxVelocity/Animation speed (if you want)', 'Enter the number that you want to set (if you want)')
		MoreTab:NewButton('Set MaxVelocity','it sets the speed you just put above yay', function()
			local vel = ve:GetText()
			local Torso = player.Character.Torso
			
			RightArm=Torso["Right Shoulder"]
LeftArm=Torso["Left Shoulder"]
Head=Torso["Neck"]
LeftLeg=Torso["Left Hip"]
RightLeg=Torso["Right Hip"]

RightArm.MaxVelocity = vel
LeftArm.MaxVelocity = vel
Head.MaxVelocity = vel
LeftLeg.MaxVelocity = vel
RightLeg.MaxVelocity = vel
    end)

       MoreTab:NewButton("Krystal Dance V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/8336f9661783e55cb600c52f342c5306/raw/33b8a78ce3300cfe6fbe3e030297a09061b416ef/Krystal%2520Dance%2520V2"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Ender V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/2161aa14da3ed1a635c279c0f5f81a4b/raw/14aa5da07e3afcb0d67dd15ae79e9dcbcff74dbf/Fe%2520ender%2520V2"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Xester V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/e3397f94dfc513acec484c26fc54ae02/raw/acbac1b3c862bebf43511420292fa8889af5424e/Xester%2520V2%2520Remake"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Switcher Wing Master V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/5a1473dc5b5823af736a1a3d941b6ece/raw/ba600150573cec2be46906f36483282db01826cb/Switcher%2520Wing%2520Master%2520V2%2520Remake"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("The Angel V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/f852640d9bd3205cdc44ce14078fba29/raw/e64171fe397d6164dd7c1adb6845afb533c94a36/The%2520Angel"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Spectrum Glitcher V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/83ae1c8af7b6878dbe6d63aaee5a3cc5/raw/2eb7e94cbee00c933c85fadea8713879027652b1/Spectrum%2520Glitcher%2520V2%2520Remake"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Incension Reborn V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/9cbd80fb41cf2cdf8a89f66539593d98/raw/8763d15d311338b0a88abddb712138f754e63a9a/Incension%2520Reborn%2520V2%2520Remake"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Star Glitcher V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/1cc4b9a330418f0a5b3629037b78749b/raw/90b59b34aa51059f28876a56a4eb311cb482056f/Star%2520Glitcher%2520V2%2520Remake"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Caduscus V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/6362aa46deb462ef91f49351727ea610/raw/b8f7293f3dfb9d1dd469410919a81319d806045c/Caduscus%2520V2%2520Remake"))()
           msg:Destroy()
   end)
  
       MoreTab:NewButton("Chill V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/eabc2a9f56f35d758debeaf5f72ec23f/raw/d533d63c83c055ec133fcc1bb152ac1cddc8c26b/Chill%2520V2%2520Remake"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Sutart V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/b4740302653509cf85292540177416da/raw/3c1525cf9476687df5ffedcfcc9531c8b6abe72e/Sutart"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Craze Runner V2", "Converted By me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/30e4a2b79f9d9e3aa4148c3904092355/raw/9c59ac0ec2b83a9dd99d6cb9902616d50bded7b6/Craze%2520runner"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Kyus Ender V2", "Converted By Me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/77b224b2a34a3bbf05e88f64176b304c/raw/b3852e4c083a14b747fe59fa723e434551200e57/Kyus%2520ender%2520v2"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Achromatic V2", "Converted By Me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/7a8559a153e506c2e092fef521448b25/raw/cefe064d08d869ca1afa27c8b8409d252dec2bda/Achromatic%2520v2"))()
           msg:Destroy()
   end)
   
       MoreTab:NewButton("Ruin EX V2(Not recommended bad)", "Converted By Me", function()
       local msg = Instance.new("Message", Workspace)
msg.Text = "Zee Animator loading please wait..."
           loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/d71178583554d1dd19974cc4862a5503/raw/f4d595601dd68649f7da547003fe9f7466ce2cfc/Ruin%2520EX%2520V2"))()
           msg:Destroy()
   end)
	
	   MoreTab:NewLabel("with animation ids (R6)")
	
		MoreTab:NewButton("Untitled Hub", "Made By Foiled", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/245283c9c1c89965837554a559079b63/raw/4d0685c17fc209bfa0f7d9e85ce7a8de41053bd5/gistfile1.txt"))()
	end)
	
		MoreTab:NewButton("Zombie", "Zombie", function()
		    loadstring(game:HttpGet(('https://pastefy.app/w7KnPY70/raw'),true))()
	end)
	
		MoreTab:NewButton("Goner Divine Edge", "Divine Edge animation script", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fe-ProjectR/FE-Files/refs/heads/main/Fe%20Divine%20Edge.lua"))();
	end)
	
		MoreTab:NewButton("Gman", "Idk just a gman script", function()
		    _G.clientsidedeffect = true --set it to false if you don't want the effect
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty18.lua"))()
	end)
	
		MoreTab:NewButton("Sin Dragon", "Sin Dragon Without hats", function()
		    loadstring(game:HttpGet('https://raw.githubusercontent.com/Fe-ProjectR/FE-Files/refs/heads/main/FE%20Void%20Dagon'))()
	end)
	
		MoreTab:NewButton("Honored One", "I am the Honored One! vibes", function()
		    loadstring(game:HttpGet("https://pastebin.com/raw/JjiYQghy"))("Alicescripts")
	end)
	
		MoreTab:NewButton("KJ", "KJ", function()
		    loadstring(game:HttpGet("https://pastebin.com/raw/5KnPXUEm"))("Alice scripts")
	end)
	
		MoreTab:NewButton("SCP 096", "Just a scp 096 script...", function()
		    loadstring(game:HttpGet("https://pastefy.app/YsJgITXR/raw"))()
	end)
	
		MoreTab:NewButton("Fighter Animation", "Fighting with bros in roblox", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Fighter-inspired-by-Gale-21557"))()
	end)
	
		MoreTab:NewButton("KJ 2", "KJ from Temu", function()
		    loadstring(game:HttpGet("https://pastefy.app/sdAujywd/raw"))()
	end)
	
		MoreTab:NewButton("Glios", "some animation shit without hats", function()
		    writefile(".nonecing", "white")
loadstring(game:HttpGet(('https://glot.io/snippets/gua2ntmbdm/raw/main.lua'),true))()
	end)
	
		MoreTab:NewButton("2006 animation", "Made By me :/", function()
		    player.Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://80979216"
		player.Character.Animate.jump.JumpAnim.AnimationId = "rbxassetid://187951261"
		player.Character.Animate.fall.FallAnim.AnimationId = "rbxassetid://187951261"
	end)
	
		MoreTab:NewButton("Sneaky", "Made by Foiled", function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/1c1d91fb2cf992a82d449cabd851b0a4/raw/2a160da48c6ee04b297d165df12e73c406daad59/sneaky"))()
	end)
	
		MoreTab:NewButton("Star Glitcher", "Made By Foiled", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/0469bbefe2103c5f7d30091c65c81070/raw/7a0d852944aa1b8d2368dc98c0a54a0cee257da4/star"))()
	end)
	
		MoreTab:NewButton("Studio Dummy", "Made By Foiled", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/eb4b36833983ca569845810a2375ed1b/raw/8b105fc13091ee23ed52271d7c16c15dffbb2ecf/studio"))()
	end)
	
		MoreTab:NewButton(":Joy:", "Made By Me (Kinda Trash)", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/8f7b23b1a331cd65c01e35c51509bf5a/raw/db830fe3f5207803b68b1bbaeef795814536290e/Joy%2520Remake"))()
	end)
	    
	    MoreTab:NewButton("JK", "JK..", function()
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/main/UFWboo.txt"))()
	end)
	
	   MoreTab:NewButton("Psycho", "Psycho", function()
	        loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/639cc8e77a39fcbe27d10221f861a288/raw/e0d1109eaa1cefffaef15161d4e868bbc95b7fde/Psycho"))()
	end)
	
	   MoreTab:NewButton("Dash r6 r15", "Dash", function()
	        loadstring(game:HttpGet("https://pastefy.app/ZhKVgCK3/raw"))()
	end)
	
	   MoreTab:NewButton("Jerk Off", "Jerk Off", function()
	        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
	end)
	
	   MoreTab:NewButton("Seraphic Blade", "Seraphic Blade", function()
	        loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
	end)
	
	    MoreTab:NewButton("Ohio", "Made By Me", function()
	        loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/6df60b6ee07ae975102497299b3bb5a8/raw/506521365192d069d9a3924d48ba0d6782458d8f/Helicopter"))()
	end)
	
	    MoreTab:NewButton("T Pose", "T Pose?", function()
	        loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/a3d4ae5c9c55e374c084c16077db37f0/raw/2514481490d22e1cfaf487b1cb40fb34d87ce418/T%2520Pose"))()
	end)
	
	    MoreTab:NewButton("Head Backpack", "Backpacks your head :/", function()
	        loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/13ec1799a1cf29e7025176ff2a5ce02a/raw/72f9fa7543a2a5fe5a3c89439afc7d5626525399/head%2520back%2520pack"))()
	end)
	
	   MoreTab:NewButton("Head Telekinesis", "Head Telekinesis", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/629cd8c18a99e8562f7e2e9d182cf1c5/raw/4d685654641b5c39d96e5aca2e80ae5389db413f/Head%2520Telekinesis"))()
	end)
	
	   MoreTab:NewButton("Floating Head", "Floating Head", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/3b94a333b1e65ff4d5bd799c2e1e1c66/raw/74e54c906bbd08f230fdfec6026c0b70d579b685/Floating%2520Head"))()
	end)
	
	   MoreTab:NewButton("Weird Arms", "Weird Arms", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/ca7df6339e6f2a755caa5c4c287f461f/raw/778fa6928d7ed78de644da3c48fe6da8ab7fb9f7/Weird%2520arms"))()
	end)
	
		MoreTab:NewButton("Backflip", "Myworld's backflip script", function()
            local hrp=player.Character.HumanoidRootPart
local cfr=hrp.CFrame
local t=os.clock()
while t+2>os.clock() do
    local i=(os.clock()-t)*180
    if i<180 then
hrp.CFrame=cfr*CFrame.Angles(math.rad(i),0,0)+Vector3.new(0,i/180,0)*15
else
hrp.CFrame=cfr*CFrame.Angles(math.rad(i),0,0)+Vector3.new(0,(i-180)/-180+1,0)*15
end
hrp.Velocity=Vector3.new(0,0,0)
hrp.RotVelocity=Vector3.new(0,0,0)
task.wait()
end
	end)
	
        MoreTab:NewLabel("R15 reanimations")
	
		MoreTab:NewButton("R15 gun", "Made By Foiled", function()
		    loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/ce403d0fbcc98468e0b45f5860bb52ed/raw/ae0b08a08d446e5690a57c4fb746b0db008d605e/gun"))()
	end)
	
	   MoreTab:NewButton("R15 Jerk Off", "Jerk Off", function()
	        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
	end)
	
       MoreTab:NewLabel("Tool Reanimations/scripts")
       
		MoreTab:NewButton("Gale Fighter Tool", "Made by Foiled respect to him", function()
		   loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/3d67bb5f690b573b6ccf2306fae8f2f7/raw/812c673d11161e3692ce7ddd2b37c1624b836f25/aaaaaaekfjfj"))()
	end)
	
	    MoreTab:NewButton("Tool Man", "Tool Man made by Catlover", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/e2e71bc9d6db4547745b2a66892292a6/raw/b72c955bd1ee46a2eee08b598454c4ab9feab6ac/Tool%2520Man"))()
   end)
	
	    MoreTab:NewButton("Krystal Dance V3 Tool", "Krystal Dance V3 With Tools Made by me", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/7d46610ddda668b08b50c9b12bb84342/raw/70120d805a00151d3887a2ff2df7965070963c08/Krystal%2520Dance%2520V3%2520Tool"))()
   end)
   
	    MoreTab:NewButton("Achromatic V2 Tool", "Achromatic V2 but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/989fee98e0ee2aaf6b1417929a280a21/raw/a7514ba81493c7c4cb1cc97cf1337ae2de290730/Achromatic%2520v2"))()
   end)
   
	    MoreTab:NewButton(":Joy: Tool", ":Joy: but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/15fdbe7bd61aeb1ef2884e09cf7f28c4/raw/c60cf227d8aca935c765ea38f296eeba8ff479af/:Joy:"))()
   end)
   
	    MoreTab:NewButton("Gale Fighter v2 Tool", "gale fighter v2 but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/9bc0f242de0f939faf278259efe91bc0/raw/d25c53a261e193772f39251c35e1e5232cd7b379/gale%2520fighter%2520v2"))()
   end)
   
	    MoreTab:NewButton("Caduscus Tool", "Caduscus but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/1ea23adb62daf48bc6ebfde8bc8bb0cd/raw/9868c2e17b83f1e319bf6f13dc9c343187795697/Caduscus"))()
   end)
   
	    MoreTab:NewButton("Star Glitcher Tool", "Star Glitcher but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/933cf35433fda3e423c981d5900aeb21/raw/f167a1e4e16cc727c80b45731bee5e076e43d8b3/star"))()
   end)
   
	    MoreTab:NewButton("VR (Red,Blue buttons)", "VR but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/792a9f11605568755eb1c8157a9a1084/raw/338be32edcfd56741e8b37f0e66750708a0f3144/vr"))()
   end)
   
	    MoreTab:NewButton("Krystal Dance Tool", "Krystal Dance but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/470e9b7b053b9c1bf5d2f7988ecc25c7/raw/c71c20377ffd9141087cbe6d3bafaab857655672/Krystal%2520tool"))()
   end)
   
	    MoreTab:NewButton("Ender Tool", "Ender but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/10b134d0a53fa41e4e78f300c1beeb24/raw/485c1881faada3d7e58b9a555f7f4d2f1b4efe67/Ender%2520tool"))()
   end)
   
	    MoreTab:NewButton("Chill Tool", "Chill but with Tools", function()
	      loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/11564aee28cc4d110a25187e01eec913/raw/3cbea669f11bef1505f875267b43d230e5796d1a/Chill%2520tool"))()
   end)
   
	   MoreTab:NewButton("Kyus Ender", "Kyus Ender but with Tools", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/d6081f32f1b3c1e5129b250dbb38a445/raw/ab44ced5f3338ae19a1d35cdccf0b1d63a8fce5e/Kyus%2520ender"))()
	end)
	
	   MoreTab:NewButton("PP (Small 17 Tools)", "PP real", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/c0e2c7a2dc42d1759eddecd085c47609/raw/1614cb0021fb5c00d9d389983438cc2b7a135557/gistfile1.txt"))()
	end)
	
	   MoreTab:NewButton("PP (Big 33 Tools)", "PP real", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/21fb9bb682b8581c8fb45ea7d6dcdb6c/raw/c9b81cccaec35a29bcd094a8ec6d74b98c5394ed/gistfile1.txt"))()
	end)
   
	   MoreTab:NewButton("Replication ui", "old script but still works (buggy)", function()
	       loadstring(game:HttpGet("https://raw.githubusercontent.com/EEND2SCRIPTS/Replication/main/replication"))();
	end)
	
	   MoreTab:NewButton("Tooldraw", "Made By My old friend affexter ;)", function()
	       loadstring(game:HttpGet("https://raw.githubusercontent.com/Affexter/Programs/refs/heads/main/scripts/tooldrawFE.lua"))()
	end)
	
	MoreTab:NewSearchBar()
end

    do -- kj
	   kj:NewLabel("THIS WORKS WITH TOOLS,WE CAN'T DO SOMETHING ABOUT LAG")
	   kj:NewLabel("Do Character first or it wouldn't be visible for others")

	   kj:NewButton("Character", "For the animations to be visible", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/e2e71bc9d6db4547745b2a66892292a6/raw/b72c955bd1ee46a2eee08b598454c4ab9feab6ac/Tool%2520Man"))()
	end)
	
	  kj:NewLabel("KJ (tsb.NOT RECOMMENDED)")
	
	   kj:NewButton("Ravage", "Ravage", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/18bca58c809873aba538a4f1778ab96d/raw/62247b56f2916ce60b89982c9036409a1407be7a/ravg"))()
	end)
	
	   kj:NewButton("Swift Sweep", "Swift Sweep", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/6f4f2478894fab9c70c73ebd38ef9917/raw/f201507b90408cec8ab32d260efa50886eafbb98/swiftt"))()
	end)
	
	   kj:NewButton("Swift Sweep 2", "Swift Sweep 2", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/3a7dcbbd182a897cddf91bda73bad30e/raw/d660149945f335b4bb658bebf573408383e681ab/swift%25202"))()
	end)
	
	   kj:NewButton("Collateral Ruin", "Collateral Ruin", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/b22b78bfe4f2064cc3e8a7dddceed0fb/raw/ad05fb634e800167e3491cd95d65a834ead9311e/Collateral%2520Ruin"))()
	end)
	
	   kj:NewButton("Ultimate", "Ultimate", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/1daa84ad2345c65de513ecb968c01388/raw/7e7394d6566b07d6a691e464fb65bcaebb4d149a/ult"))()
	end)
	
	   kj:NewButton("Ultimate 2", "Ultimate 2", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/2bd14a4d5b4b525d3961c0dfebcc7af9/raw/ae590e54d1fe4d069119bf5a9282f441fd89d8f4/ult%25202"))()
	end)
	
	   kj:NewButton("Stoic Bomb", "Stoic Bomb", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/78c6cb3ba75dbb52adc2e0e1f1fd474c/raw/1d5ffa99026823f32f1a3abbb5a9d17fbd34c6af/Stoic%2520Bomb"))()
	end)
	
	   kj:NewButton("Unlimited Flex Works", "UNLIMITED FLEX WORKS REAL", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/4d2bf5320663a8e94d141918362630f1/raw/f25c6006a6e4125313ee94fdd182d60e6a6d842c/unlimited"))()
	end)
	
	kj:NewLabel("JK (The Chosen Battlegrounds)")
	
	   kj:NewButton("Unlimited Flex Works", "UNLIMITED FLEX WORKS REAL", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/9d9d92ec0d50db06e0caeb6267f3cef5/raw/59d45d1cc90c3252409474787a68cda3e82a39be/jk"))()
	end)
	
	kj:NewLabel("Jun, ToolBox Lmao")
	
	   kj:NewButton("No More Games", "Jun.", function()
	       loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/498f20b3b75c1be03d464dbf43fdc2ca/raw/22f1b573a4538333d6d335f05633cc3795d64deb/nmg"))()
	end)
	
	kj:NewSearchBar()
end

	do -- OthersTab
	   OthersTab:NewButton("Mobile Keyboard", "mobile keyboard", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
	end)

		OthersTab:NewButton("unban voicechat", "join voice chat while banned", function()
		   game:GetService("VoiceChatService"):joinVoice()
	end)
	
		OthersTab:NewButton("Godmode", "Works in some games", function()
            function GodMode()
    player.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        if player.Character.Humanoid.Health < 100 then
            player.Character.Humanoid.Health = 100
        end
    end)
end


GodMode()
	end)
	
		OthersTab:NewButton("Stop reanimate(hatless reanimates)", "stops reanimate by breakjointing your character", function()
		    player.Character:BreakJoints()
	end)
	
	OthersTab:NewButton("Stop animations(animation ids)", "stops animations by disabling all animations playing on humanoid", function()
	        for _, v in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do v:Stop() end
	end)
	
		OthersTab:NewButton("Godmode 2", "Godmode 2 only for fencing game", function()
		    button = workspace.Button
button.CanCollide   = false
button.Transparency = 1
 
game:GetService("RunService").Heartbeat:connect(function(step)
button.CFrame = CFrame.new(player.Character.Head.Position)
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(1,5))
wait()
button.CFrame=CFrame.new(player.Character["Right Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(player.Character.Torso.Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(player.Character["Left Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame=CFrame.new(player.Character["Left Leg"].Position)
wait()
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame = CFrame.new(player.Character["Right Leg"].Position)
end)
	end)
	
		OthersTab:NewButton("Rochips Panel", "Rochips Panel", function()
		    if "you wanna use rochips universal" then
	local z_x,z_z="gzrux646yj/raw/main.ts","https://glot.io/snippets/"
	local im,lonely,z_c=task.wait,game,loadstring
	z_c(lonely:HttpGet(z_z..""..z_x))()
	return ("This will load in about 2 - 30 seconds" or "according to your device and executor")
end


	end)
	
		OthersTab:NewButton("Dex Explorer", "loads keyless dex", function()
		    loadstring(game:HttpGet("https://pastebin.com/raw/KUTCEy7b", true))()
	end)
	
		OthersTab:NewButton("Animation gui", "animation gui", function()
		    loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/r6-aqua/refs/heads/main/source%20open"))()
	end)
	
		OthersTab:NewButton("Animation Logger", "animation logger", function()
		    loadstring(game:HttpGet("https://pastebin.com/raw/kBui7A0r"))()
	end)
	
		OthersTab:NewButton("Remote spy", "Mobile Remote spy", function()
		    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Simple-Spy-Mobile-Script-Restored-22732"))()
	end)
	
	    OthersTab:NewButton("Control Npc", "Made By ImPatrick", function()
	        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty38.lua"))()
--made by Im_Patrick, subscribe on youtube now!
    end)
    
    OthersTab:NewSearchBar()
end

    do -- Admins
		AdminsTab:NewButton("Infinite Yield", "A roblox universal admin commands script", function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
	
		AdminsTab:NewButton("Nameless Admin", "A roblox universal admin commands script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source"))();
	end)
	
		AdminsTab:NewButton("Reviz Admin", "A roblox universal admin commands script", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/A2R7TdJV"))()
	end)
	
		AdminsTab:NewButton("Prizzlife", "Prison Life Admin commands script", function()
            loadstring(game:HttpGet('https://gist.githubusercontent.com/Onlyscripts1/82eaeb4cf33bf7d1943d026561f036a3/raw/6d103ec10ee0e1d2f3ffd2fddc2025ced4be8802/prizz'))()
	end)
	
	AdminsTab:NewSearchBar()
end

    do -- ChatTab
		ChatTab:NewButton("Break Chat Filter", "Breaks Chat Filter", function()
            local function sendMessage(message)
    message = tostring(message)

    -- Check if TextChatService is available and if its version matches
    if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
        -- Send the message using the new chat system
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
    else
        -- Send the message using the old chat system
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end

sendMessage(" ")
sendMessage(" ")
sendMessage(" ")
sendMessage(" ")
sendMessage(" ")
sendMessage(" ")
	end)
	
		ChatTab:NewButton("Anti Chat Logger", "Anti Chat Logger", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()
    end)
    
    ChatTab:NewSearchBar()
end

    do -- con/Console
local cons = conTab:NewTextBar('Print', 'Enter a text and then press done and then it will output in console')
		conTab:NewButton('done','it outputs the text in console (client-sided)', function()
			local text = cons:GetText()
			
			print("You Just Printed:" .. text)
    end)
    
local cs = conTab:NewTextBar('Warn', 'Enter a text and then press done and then it will output in console')
		conTab:NewButton('done','it outputs the text in console (client-sided)', function()
			local tet = cs:GetText()
			
			warn("You Just Warned:" .. tet)
    end)
    
local yt = conTab:NewTextBar('Error', 'Enter a text and then press done and then it will output in console')
		conTab:NewButton('done','it outputs the text in console (client-sided)', function()
			local tt = yt:GetText()
			
			error("You Just Errored:" .. tt)
    end)
    
local yu = conTab:NewTextBar('FE Error', 'Enter a text and then press done and then it will output in console')
		conTab:NewButton('done','it outputs the text in console (Server-Sided)', function()
			local tyu = yu:GetText()
			
			-- MADE BY PIO2
			
			local local_player = game:GetService("Players").LocalPlayer
local animate = local_player.Character.Animate
local idle_anim = animate.idle.Animation1
local old_animid = idle_anim.AnimationId
animate.Enabled = true
idle_anim.AnimationId = "active://" .. tyu
task.wait()
animate.Enabled = false
animate.Enabled = true
idle_anim.AnimationId = old_animid
task.wait()
animate.Enabled = false
animate.Enabled = true
    end)
    
    conTab:NewSearchBar()
end
    
    do -- Executor
        exeTab:NewButton("Synapse x", "Synapse x ui", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
    end)
    
        exeTab:NewButton("Krnl", "Krnl ui", function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Krnl-Executor-8368"))()
    end)
    
        exeTab:NewButton("FrostWare", "FrostWare ui cracked by me", function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/62d5639e63f33d2fa16b8cdc74e5de36/raw/a51a81fa6fb4f7b9928acaa8a8d07d2cb8d16de5/Frostware"))()
    end)
    
        exeTab:NewButton("Codex", "Codex", function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/CodexScripts/CodexUI/refs/heads/main/CodexMain"))()
    end)
    
        exeTab:NewButton("Delta X", "Delta X", function()
             loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Delta-X-Executor-10319"))()
    end)
    
    exeTab:NewSearchBar()
end

    do -- anim
        anim:NewLabel("Animation ID")
        
local id = anim:NewTextBar('Animation ID', 'Enter the animation ID you want to play')
		anim:NewButton('Play','it plays the id you just put above yay', function()
			local number = id:GetText()
			
			e=Instance.new('Animation')
            e.AnimationId = number
            player.Character.Humanoid:LoadAnimation(e):Play()
    end)

		anim:NewButton('Stop','Stops the animation', function()
			for _, v in pairs(player.Character.Humanoid:GetPlayingAnimationTracks()) do v:Stop() end
		end)
		
		anim:NewSearchBar()
end

    do -- Credits,Supported
	    Credits:NewLabel("This script is made by Onlyscripts in Youtube/feariosz0 in discord")
	    Credits:NewLabel("This Script is also made by akundiscoalt in discord")
	    Credits:NewLabel("(Replicatesignal) Paid Supported: Wave (Monday Free), SirHurt,AWP.GG,")
	    Credits:NewLabel("And Synapse Z")
	    Credits:NewLabel("(Replicatesignal) Free supported: Dynamic,Cryptic,Atlantis,Argon,Velocity")
	    Credits:NewLabel("Ronix,Wave (only on mondays free)")
        Credits:NewLabel("For Mobile (Replicatesignal) Nebula,Frostware,Delta android or ios")
        Credits:NewLabel("Credits to Genesis,MelonScripter and owners who make hat,hatless reanimates")
end

	do -- zee
		zee:SetMainTab(PlTab)
		zee:SetFooter('Current version: V5')
	end
	
	CoreGui:WaitForChild("ScreenGui").Name = "Zee Hub"
	
	Blur.Parent = Lighting
	task.spawn(function()
	    FOV = workspace.CurrentCamera.FieldOfView
		TweenService:Create(Blur,TweenInfo.new(1.3),{Size=40}):Play()
		TweenService:Create(Camera,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{FieldOfView=FOV-15}):Play()
		task.wait(2)
		TweenService:Create(Blur,TweenInfo.new(0.65),{Size=0}):Play()
		task.wait(1.5)
		TweenService:Create(Camera,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{FieldOfView=FOV}):Play()
	end)
end