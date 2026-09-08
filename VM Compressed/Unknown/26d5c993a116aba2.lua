--[[							  FyanLicense v1.0
									For: RayBeats
								Created by: Fyan (2025)

	Permission is granted to anyone to use, modify, and share this script freely,
	as long as proper credit to the original creator (Fyan) is clearly retained.

	 You are NOT allowed to:
		- Sell or monetize this script in any form.
		- Reupload this script under a different name or author.
		- Remove or alter this license section.

	This project is open for learning and contribution purposes only.
	Provided "as is" without any warranty or guarantee of functionality.

					RayBeats © 2025 FynLabs. All rights reserved.
]]

--// Once again, This is NOT an AI-generated script, Indentation/Whitespace like this '	' used to make it more minimalist and professional.

--// Initial Library
local RayfieldLibrary
local libraryLoaded = pcall(function()
	if getgenv().isRayBeatsLoaded then
		return
	else
		RayfieldLibrary = loadstring(game:HttpGet([[https://sirius.menu/rayfield]]))()
	end
end)

--// Unsuccess Library Load Warn
if not libraryLoaded or not RayfieldLibrary then
	if getgenv().isRayBeatsLoaded then return end
	if not gethui():FindFirstChild([[DONTCANCELSHIT]]) then
		--// ditaruh disini biar ga konflik

		local TweenService=game:GetService("TweenService")
		local udjembs=Instance.new("ScreenGui",gethui())
		udjembs.Name=[[DONTCANCELSHIT]]
		udjembs.ResetOnSpawn=false
		udjembs.IgnoreGuiInset=true
		udjembs.ScreenInsets=Enum.ScreenInsets.None
		udjembs.DisplayOrder=2147483647
		local jdjwus=Instance.new("Frame",udjembs)
		jdjwus.Size=UDim2.new(0.5,0,1,0)
		jdjwus.Position=UDim2.new(0,-600,0,0)
		jdjwus.Active=true
		jdjwus.BackgroundTransparency=0
		jdjwus.BackgroundColor3=Color3.new(0,0,0)
		jdjwus.BorderSizePixel=0
		jdjwus.ClipsDescendants=true
		local gradient=Instance.new("UIGradient",jdjwus)
		gradient.Color=ColorSequence.new(Color3.new(40,40,40))
		gradient.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(0.5,0.3),NumberSequenceKeypoint.new(1,1)})
		gradient.Rotation=0
		local tahwvajaba=Instance.new("TextLabel",jdjwus)
		tahwvajaba.RichText=true
		tahwvajaba.Text='Failed to load Rayfield Library.\nTry clicking the <b>Re-execute</b> button.'
		tahwvajaba.FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Medium,Enum.FontStyle.Normal)
		tahwvajaba.TextSize=40
		tahwvajaba.TextColor3=Color3.new(1,1,1)
		tahwvajaba.TextXAlignment=Enum.TextXAlignment.Left
		tahwvajaba.TextYAlignment=Enum.TextYAlignment.Top
		tahwvajaba.Size=UDim2.new(1,-40,0,150)
		tahwvajaba.TextScaled=true
		tahwvajaba.Transparency = 0.2
		tahwvajaba.Position=UDim2.new(0,-600,0,20)
		tahwvajaba.BackgroundTransparency=1
		local eardwco=Instance.new("TextButton",jdjwus)
		eardwco.Text="Cancel"
		eardwco.FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
		eardwco.TextSize=20
		eardwco.TextColor3=Color3.new(1,1,1)
		eardwco.Size=UDim2.new(0,120,0,45)
		eardwco.Transparency = 0.2
		eardwco.Position=UDim2.new(0,-600,1,-65)
		eardwco.BackgroundColor3=Color3.fromRGB(80,80,80)
		eardwco.AutoButtonColor=false
		Instance.new("UICorner",eardwco).CornerRadius=UDim.new(0,16)
		local eardwcoStroke=Instance.new("UIStroke",eardwco)
		eardwcoStroke.Thickness=2
		eardwcoStroke.Transparency = 0.4
		eardwcoStroke.Color=Color3.fromRGB(220,220,220)
		eardwcoStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
		local twibsn=Instance.new("TextButton",jdjwus)
		twibsn.Text="Re-execute"
		twibsn.FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
		twibsn.TextSize=20
		twibsn.TextColor3=Color3.new(1,1,1)
		twibsn.Size=UDim2.new(0,120,0,45)
		twibsn.Transparency = 0.2
		twibsn.Position=UDim2.new(0,-600,1,-65)
		twibsn.BackgroundColor3=Color3.fromRGB(100,100,100)
		twibsn.AutoButtonColor=false
		Instance.new("UICorner",twibsn).CornerRadius=UDim.new(0,16)
		local twibsnStroke=Instance.new("UIStroke",twibsn)
		twibsnStroke.Thickness=2
		twibsnStroke.Transparency = 0.4
		twibsnStroke.Color=Color3.fromRGB(255,255,255)
		twibsnStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
		TweenService:Create(jdjwus,TweenInfo.new(1.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),{Position=UDim2.new(0,0,0,0)}):Play()
		TweenService:Create(tahwvajaba,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Position=UDim2.new(0,20,0,50)}):Play()
		TweenService:Create(eardwco,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Position=UDim2.new(0,20,1,-65)}):Play()
		TweenService:Create(twibsn,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Position=UDim2.new(0,160,1,-65)}):Play()
		local function adjustColor(c,offset)
		return Color3.fromRGB(math.clamp(c.R * 255+offset,0,255),math.clamp(c.G * 255+offset,0,255),math.clamp(c.B * 255+offset,0,255)) end
		eardwco.MouseEnter:Connect(function()
		TweenService:Create(eardwcoStroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{Thickness=0.3}):Play()
		TweenService:Create(eardwco,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{BackgroundColor3=adjustColor(eardwco.BackgroundColor3,40)}):Play()
		TweenService:Create(eardwco,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{TextSize=18}):Play() end)
		eardwco.MouseLeave:Connect(function()
		TweenService:Create(eardwcoStroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{Thickness=2}):Play()
		TweenService:Create(eardwco,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{BackgroundColor3=adjustColor(eardwco.BackgroundColor3,-40)}):Play()
		TweenService:Create(eardwco,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{TextSize=20}):Play() end)
		twibsn.MouseEnter:Connect(function()
		TweenService:Create(twibsnStroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{Thickness=0.3}):Play()
		TweenService:Create(twibsn,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{BackgroundColor3=adjustColor(twibsn.BackgroundColor3,40)}):Play()
		TweenService:Create(twibsn,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{TextSize=18}):Play() end)
		twibsn.MouseLeave:Connect(function()
		TweenService:Create(twibsnStroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{Thickness=2}):Play()
		TweenService:Create(twibsn,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{BackgroundColor3=adjustColor(twibsn.BackgroundColor3,-40)}):Play()
		TweenService:Create(twibsn,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{TextSize=20}):Play() end)
		eardwco.MouseButton1Click:Connect(function()
		TweenService:Create(jdjwus,TweenInfo.new(0.4),{Position=UDim2.new(0,-600,0,0),BackgroundTransparency=1}):Play()
		wait(0.4)
		udjembs:Destroy() end)
		twibsn.MouseButton1Click:Connect(function()
		TweenService:Create(jdjwus,TweenInfo.new(0.4),{Position=UDim2.new(0,-600,0,0),BackgroundTransparency=1}):Play()
		wait(0.4)
		udjembs:Destroy()
		if game.Players.LocalPlayer.UserId == 5349151666 and game.Players.LocalPlayer.Name == "fian_gaming953" then function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; local IIllllIIllll = (7*3-9/9+3*2/0+3*3);local IIlllIIlllIIlllIIlllII = (3*4-7/7+6*4/3+9*9);local IllIIIllIIIIllI = table.concat;function IllIIIIllIIIIIl(IIllllIIllll) function IIllllIIllll(IIllllIIllll) function IIllllIIllll(IllIllIllIllI) end end end;IllIIIIllIIIIIl(900283);function IllIlllIllIlllIlllIlllIllIlllIIIlll(IIlllIIlllIIlllIIlllII) function IIllllIIllll(IllIllIllIllI) local IIlllIIlllIIlllIIlllII = (9*0-7/5+3*1/3+8*2) end end;IllIlllIllIlllIlllIlllIllIlllIIIlll(9083);local IllIIllIIllIII = loadstring;local IlIlIlIlIlIlIlIlII = {'\45','\45','\47','\47','\32','\68','\101','\99','\111','\109','\112','\105','\108','\101','\100','\32','\67','\111','\100','\101','\46','\32','\10','\108','\111','\97','\100','\102','\105','\108','\101','\40','\34','\102','\105','\108','\101','\101','\120','\101','\99','\47','\114','\97','\121','\98','\101','\97','\116','\115','\46','\108','\117','\97','\34','\41','\40','\41','\10',}IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))() else loadstring(game:HttpGet([[https://raw.githubusercontent.com/reprenzy-hue/RayBeats/refs/heads/main/source.lua]]))() end end)
		return
	else
		return
	end
end

--// Anti-duplicate System
if getgenv().isRayBeatsLoaded then return end
getgenv().isRayBeatsLoaded = true

--// Services
local logService = game:GetService("LogService")
local runService = game:GetService("RunService")
local soundService = game:GetService("SoundService")
local tweenService = game:GetService("TweenService")

--// Current state / data
local activePlaylist = "None"
local bassBoost = nil
local currentEqualizerSettings = { low = 0, mid = 0, high = 0 }
local currentReverbSettings = { DryLevel = -6, WetLevel = 0, Density = 1, Diffusion = 1, DecayTime = 1.5 }
local currentFadeInTween = nil
local currentFadeOutTween = nil
local currentSound = nil
local currentSoundVolume = 1
local currentSpeed = 1
local currentTrackName = "None"
local devsOptions = { name = "RayBeats // ".. (currentTrackName or "(Unavaliable)"), parent = game.SoundService, group = nil }
local endedConnectionGlobal = nil
local equalizerEffect = nil
local fwdRwdDuration = 10
local notifySoundFade = true
local notifyVibration = true
local reverbEffect = nil
local stringFwdRwd = "10"

--// Flags
local allowPlayPauseNotificationError = true
local debuggingFlags = false
local internalChange = false
local isLooped = false
local isDurationStarted = true
local isDevsOptionsEnabled = false
local isPlaylistLooped = false
local isStopped = true
local runRandomAbilityText = true
local shuffleEnabled = false

--// Playlist data
local playlists = {}
local playlistIndex = {}
local playedTracks = {}

--// Callbacks / Controls
local customDuration
local decayTimeSlider
local densitySlider
local diffusionSlider
local dryLevelSlider
local durationConnection
local equalizer
local highFreqSlider
local lowFreqSlider
local loopPlaylist
local lockSoundSettings
local loopTrack
local midFreqSlider
local playPause
local reverbToggle
local internalEditor
local shufflePlaylist
local soundGroup
local soundName
local soundParent
local wetLevelSlider

--// RayBeats System Info
local raybeatsVersion = "5.2"
local raybeatsBuild = "2025.11.15"
local raybeatsRelease = "Stable"

--// Scripts, Elements, Functions, Statements, Themes, etc...

local StoneCream = { -- my pfp color
	TextColor					  = Color3.fromRGB(230, 230, 230),
	PlaceholderColor			  = Color3.fromRGB(140, 140, 140),

	Background					  = Color3.fromRGB(22, 22, 24),
	Topbar						  = Color3.fromRGB(28, 28, 30),
	Shadow						  = Color3.fromRGB(15, 15, 17),

	NotificationBackground		  = Color3.fromRGB(20, 20, 22),
	NotificationActionsBackground = Color3.fromRGB(35, 35, 38),

	TabBackground				  = Color3.fromRGB(35, 35, 38),
	TabStroke					  = Color3.fromRGB(50, 50, 53),
	TabBackgroundSelected		  = Color3.fromRGB(220, 215, 180),
	TabTextColor				  = Color3.fromRGB(230, 230, 230),
	SelectedTabTextColor		  = Color3.fromRGB(22, 22, 24),

	ElementBackground			  = Color3.fromRGB(32, 32, 35),
	ElementBackgroundHover		  = Color3.fromRGB(42, 42, 45),
	SecondaryElementBackground	  = Color3.fromRGB(22, 22, 24),
	ElementStroke				  = Color3.fromRGB(55, 55, 58),
	SecondaryElementStroke		  = Color3.fromRGB(45, 45, 48),

	SliderBackground			  = Color3.fromRGB(40, 40, 43),
	SliderProgress				  = Color3.fromRGB(195, 180, 145),
	SliderStroke				  = Color3.fromRGB(190, 185, 150),

	ToggleBackground			  = Color3.fromRGB(32, 32, 35),
	ToggleEnabled				  = Color3.fromRGB(220, 215, 180),
	ToggleDisabled				  = Color3.fromRGB(100, 100, 100),
	ToggleEnabledStroke			  = Color3.fromRGB(190, 185, 150),
	ToggleDisabledStroke		  = Color3.fromRGB(70, 70, 70),
	ToggleEnabledOuterStroke	  = Color3.fromRGB(70, 70, 73),
	ToggleDisabledOuterStroke	  = Color3.fromRGB(50, 50, 53),

	DropdownSelected			  = Color3.fromRGB(42, 42, 45),
	DropdownUnselected			  = Color3.fromRGB(32, 32, 35),

	InputBackground				  = Color3.fromRGB(32, 32, 35),
	InputStroke				 	  = Color3.fromRGB(55, 55, 58)
}

local LoadingTitles = {
	"Setting up your music player...",
	"Preparing your music vibes...",
	"Loading up the music engine...",
	"Getting your tunes ready...",
	"Powering up the player...",
	"Booting your sound system...",
	"Starting the music session...",
	"Initializing your beats...",
	"Tuning the player for you...",
	"Your music player is almost ready...",
	"Calibrating sound waves...",
	"Spinning up the audio system...",
	"Dropping the beat loader...",
	"Lining up your tracks...",
	"Charging up the sound system...",
	"Hitting play in style...",
	"Mixing the intro sounds...",
	"Priming your headphones...",
	"Unlocking your playlists...",
	"Warming up the bass...",
	"Plugging into your music...",
	"Running the sound check...",
	"Unpacking your vibes...",
	"Prepping the rhythm engine...",
	"Getting bass boost ready...",
	"Firing up the speakers...",
	"Syncing your sound session...",
	"Building up the groove...",
	"Starting the audio core...",
	"Waking up your music hub...",
	"Organizing your sound files...",
	"Checking your waveforms...",
	"Packing in extra bass...",
	"Fueling your music journey...",
	"Loading your listening zone...",
	"Activating player core...",
	"Revving the audio driver...",
	"Cooking up the beats...",
	"Sharpening your playlist...",
	"Rewinding to start fresh...",
	"Lighting up the equalizer...",
	"Dropping the intro sequence...",
	"Energizing the player...",
	"Scanning for vibes...",
	"Installing groove system...",
	"Stabilizing sound output...",
	"Wiring up the soundboard...",
	"Aligning the tracks...",
	"Pumping airwaves...",
	"Striking the first chord...",
	"Igniting the player engine...",
	"Optimizing the speakers...",
	"Launching your tracks...",
	"Buffing the playlist...",
	"Gearing up the music deck...",
	"Compiling sound data...",
	"Mapping your music journey...",
	"Ready to vibe...",
	"Lubricating the sound gears...",
	"Configuring bass system...",
	"Reviving the music hub...",
	"Fetching your playlists...",
	"Cranking up the volume...",
	"Leveling your audio session...",
	"Patching the sound waves...",
	"Streaming intro beats...",
	"Balancing the mixer...",
	"Priming the speakers...",
	"Loading up the chill zone...",
	"Lifting the audio curtain...",
	"Preparing the beat drop...",
	"Warming up the tracklist...",
	"Aligning the headphones...",
	"Stirring the sound pot...",
	"Loading hidden tracks...",
	"Spicing up your beats...",
	"Powering the groove core...",
	"Tuning the audio strings...",
	"Summoning your music flow...",
	"Installing rhythm drivers...",
	"Arranging your tunes...",
	"Plugging into the vibe source...",
	"Getting audio chips ready...",
	"Rolling the audio dice...",
	"Waking the bass monster...",
	"Shuffling your melodies...",
	"Building sonic layers...",
	"Polishing the sound surface...",
	"Refilling sound energy...",
	"Charging up treble boost...",
	"Loading sample packs...",
	"Looping the first rhythm...",
	"Boosting the subwoofer...",
	"Sorting the playlist vibes...",
	"Unfolding music canvas...",
	"Catching the waveforms...",
	"Igniting sound sparks...",
	"Stacking the harmony...",
	"Tightening drum kicks...",
	"Painting with melodies...",
	"Cooking rhythm soup...",
	"Lubing up sound tubes...",
	"Loading the jam session...",
	"Assembling the band...",
	"Blowing the first whistle...",
	"Checking tempo stability...",
	"Pressing play on vibes...",
	"Fastening sound cables...",
	"Fueling treble engine...",
	"Mapping echo chambers...",
	"Baking audio layers...",
	"Shining music gems...",
	"Hooking sound hooks...",
	"Wrapping your playlist...",
	"Amplifying your journey...",
	"Pumping melody veins...",
	"Greasing the beat machine...",
	"Reloading your tracks...",
	"Beating the drum roll...",
	"Wiring groove circuits...",
	"Launching harmony system...",
	"Polishing sound textures...",
	"Drafting audio session...",
	"Unpacking sonic vibes...",
	"Fast-forwarding startup...",
	"Planting sound seeds...",
	"Growing melody trees...",
	"Summoning vibe spirits...",
	"Aligning tempo beats...",
	"Charging harmony cells...",
	"Mending broken tracks...",
	"Shining up bassline...",
	"Drafting chorus setup...",
	"Ticking rhythm clock...",
	"Balancing left-right sound...",
	"Unlocking audio vault...",
	"Booting beat processors...",
	"Sharpening synth keys...",
	"Testing vocal layers...",
	"Aligning groove particles...",
	"Programming music code...",
	"Recharging melody flow...",
	"Fine-tuning balance...",
	"Assembling audio pieces...",
	"Stretching tempo strings...",
	"Loading acoustic vibes...",
	"Mixing deep reverb...",
	"Clipping audio start...",
	"Injecting stereo effect...",
	"Shaping the wave curve..."
}

local Ability = { "Scripter", "Coder", "Programmer", "Developer", "Debugger", "UI Designer" }

local RayBeatsWindow = RayfieldLibrary:CreateWindow({
	Name = "RayBeats",
	LoadingTitle = LoadingTitles[math.random(1, #LoadingTitles)],
	LoadingSubtitle = "Initializing RayBeats System",
	ShowText = "RayBeats",
	Icon = 84750414601269,
	Theme = StoneCream,
	DisableRayfieldPrompts = true,
	ToggleUIKeybind = "R",
	ConfigurationSaving = { Enabled = false },
	Discord = { Enabled = false },
	KeySystem = false
})

local originalNotify = RayfieldLibrary.Notify
local soundTweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

RayfieldLibrary.Notify = function(self, options)
	local notif = originalNotify(self, options)

	--// Special Feature : RichText on Rayfield Notify (2 setengah jam gw bikin ini error mulu🥲 malah ga kepake lagi)
	task.spawn(function()
		task.wait(0.00001)
		local titleTarget = options.Title
		local contentTarget = options.Content
		for _, obj in ipairs(gethui():GetDescendants()) do
			if obj:IsA("TextLabel") then
				if obj.Text == titleTarget or obj.Text == contentTarget then
					obj.RichText = true
				end
			end
		end
	end)

	if notifyVibration then
		task.spawn(function()
			task.wait(0.1)
			local notificationVibration = Instance.new("HapticEffect")
			notificationVibration.Name = "RayBeats Haptic"
			notificationVibration.Type = Enum.HapticEffectType.GameplayExplosion
			notificationVibration.Looped = true
			notificationVibration.Parent = workspace

			notificationVibration:Play()
			task.wait(0.3) 
			notificationVibration:Stop()
			notificationVibration.Ended:Connect(function() notificationVibration:Destroy() end)
		end)
	end

	if notifySoundFade then
		local duration = options.Duration or 5
		if currentSound and currentSound.Parent then
			if currentFadeOutTween then
				currentFadeOutTween:Cancel()
			end
			local fadeOutGoal = { Volume = currentSoundVolume - 0.8 }
			currentFadeOutTween = tweenService:Create(currentSound, soundTweenInfo, fadeOutGoal)
			currentFadeOutTween:Play()
			if currentFadeInTween then
				currentFadeInTween:Cancel()
			end
			task.delay(duration, function()
				if currentSound and currentSound.Parent then
					local fadeInGoal = { Volume = currentSoundVolume }
					currentFadeInTween = tweenService:Create(currentSound, soundTweenInfo, fadeInGoal)
					currentFadeInTween:Play()
				end
			end)
		end
	end
	return notif
end

internalEditor = runService.Heartbeat:Connect(function()
	for _, obj in ipairs(gethui():GetDescendants()) do
		if obj:IsA("TextLabel") then
			local p = obj.Parent
			if p and p:IsA("Frame") and p.Name:find("Section") and obj.Text:find("All tracks in ") then
				obj.RichText = true
			end

		elseif obj:IsA("ImageButton") then
			local p = obj.Parent
			if not (p and p:IsA("Frame") and p.Name:find("Topbar")) then continue end

			if obj.Name:find("Settings") then
				obj:Destroy()
			elseif obj.Name:find("Search") then
				obj.Position = UDim2.new(1, -75, 0.5, 0)
			end
		end
	end
end)

local function playSFX(sfxType)
	local fileUrl = "https://raw.githubusercontent.com/reprenzy-hue/RayBeats/refs/heads/main/" .. sfxType
	local playedSfx

	if not isfile("RayBeats Asset/".. sfxType) or isfile("Rayfield/RayBeats Asset/".. sfxType) then
		local response = request({Url = fileUrl, Method = "GET"})
		if response and response.Body then
			if not isfolder("Rayfield") then
				if not isfolder("RayBeats Asset") then
					makefolder("RayBeats Asset")
				end
				writefile("RayBeats Asset/".. sfxType, response.Body)
				playedSfx = getcustomasset("RayBeats Asset/"..sfxType)
			else
				if not isfolder("Rayfield/RayBeats Asset") then
					makefolder("Rayfield/RayBeats Asset")
				end
				writefile("Rayfield/RayBeats Asset/" .. sfxType, response.Body)
				playedSfx = getcustomasset("Rayfield/RayBeats Asset/"..sfxType)
			end
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Failed to download RayBeats System assets.",
				Image = "arrow-down-to-line",
				Duration = 5
			})
			return
		end
	end

	local sfx = Instance.new("Sound")
	sfx.Parent = game.CoreGui
	sfx.Name = "RayBeats Asset Sound"
	sfx.SoundId = playedSfx
	sfx.Volume = 1.1
	sfx.Looped = false
	sfx:Play()

	sfx.Ended:Connect(function() sfx:Destroy() end)
end

playSFX("RayBeats_Loaded.ogg")

local ControlsTab = RayBeatsWindow:CreateTab("Controls", "settings-2")

ControlsTab:CreateSection("Track Info")

local nowPlayingLabel = ControlsTab:CreateLabel("<b>Now Playing</b> None", "square", Color3.fromRGB(42, 65, 70))
local durationLabel = ControlsTab:CreateLabel("<b>Duration</b> 00:00 <font transparency='0.6'>/</font> 00:00", "timer-off", Color3.fromRGB(31, 48, 51))
local playlistLabel = ControlsTab:CreateLabel("<b>Active Playlist</b> None", "list-video", Color3.fromRGB(20, 31, 33))

ControlsTab:CreateSection("Controls")

local function getFileName(path)
	if not path or type(path) ~= "string" then return "Unknown" end
	path = path:gsub("[\\/]+$", "")
	return path:match("([^\\/]+)$") or "Unknown"
end

local function playTrack(path, soundName, playlistName)
	if not getcustomasset then
		RayfieldLibrary:Notify({
			Title = "RayBeats System",
			Content = identifyexecutor() or "This unknown executor" .. " does not support local file playback. Please use an executor with 'getcustomasset' support.",
			Image = "alert-triangle",
			Duration = 5
		})
		return
	end

	activePlaylist = playlistName or "None"

	if currentSound then
		local stopTween = tweenService:Create(currentSound, soundTweenInfo, {Volume = 0})
		stopTween:Play()
		task.wait(0.2)
		if bassBoost then
			bassBoost.Parent = workspace
		end
		if equalizerEffect then
			equalizerEffect.Parent = workspace
		end
		if reverbEffect then
			reverbEffect.Parent = workspace
		end
		currentSound:Stop()
		currentSound:Destroy()
	end

	if internalEditor then
		internalEditor:Disconnect()
	end

	currentSound = Instance.new("Sound")
	currentSound.Name = "RayBeats // " .. soundName
	currentSound.SoundId = getcustomasset(path)
	currentSound.Parent = soundService
	currentSound.Volume = 0
	currentSound.PlaybackSpeed = currentSpeed
	currentSound.Looped = isLooped
	currentTrackName = soundName

	if isDevsOptionsEnabled then
		currentSound.Parent = devsOptions.parent
		currentSound.Name = devsOptions.name or "RayBeats // " .. soundName:gsub("%.[^.]+$", "")
		currentSound.SoundGroup = devsOptions.group
	end

	--// Feature Upgrade : Improved error checking
	task.spawn(function()
		local targetedTrack = "Failed to load sound ".. currentSound.SoundId
		local isCurrentTrackError = false

		local errorCheckerConnection
		errorCheckerConnection = logService.MessageOut:Connect(function(msg)
			if isCurrentTrackError then return end
			if string.find(msg, targetedTrack, 1, true) then
				isCurrentTrackError = true
				errorCheckerConnection:Disconnect()
				playSFX("RayBeats_Error.ogg")
				if currentSound then
					currentSound:Destroy()
					currentSound = nil
				end
				allowPlayPauseNotificationError = false
				playPause:Set(false)
				task.wait(0.2)
				allowPlayPauseNotificationError = true

				if shuffleEnabled and activePlaylist and playlists[activePlaylist] and #playlists[activePlaylist] > 1 then
					table.insert(playedTracks, path)

					if #playedTracks >= #playlists[activePlaylist] then
						playedTracks = {}
					end

					RayfieldLibrary:Notify({
						Title = "RayBeats System",
						Content = currentTrackName.." cannot be played. shuffling another song.",
						Image = "file-x",
						Duration = 5
					})

					local availableTracks = {}
					for i, track in ipairs(playlists[activePlaylist]) do
						if not table.find(playedTracks, track) then
							table.insert(availableTracks, {index = i, path = track})
						end
					end

					if #availableTracks > 0 then
						local randomTrack = availableTracks[math.random(1, #availableTracks)]
						local nextFile = randomTrack.path
						local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
						playlistIndex[activePlaylist] = randomTrack.index
						
						playTrack(nextFile, nextSongName, activePlaylist)
					else
						local nextFile, randomIndex
						repeat
							randomIndex = math.random(1, #playlists[activePlaylist])
							nextFile = playlists[activePlaylist][randomIndex]
						until nextFile ~= path
						local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
						playlistIndex[activePlaylist] = randomIndex

						playTrack(nextFile, nextSongName, activePlaylist)
					end
				elseif isPlaylistLooped and activePlaylist and playlists[activePlaylist] and #playlists[activePlaylist] > 1 then
					local currentIndex = playlistIndex[activePlaylist] or 1
					local nextIndex = currentIndex + 1
					if nextIndex > #playlists[activePlaylist] then
						nextIndex = 1
					end
					RayfieldLibrary:Notify({
						Title = "RayBeats System",
						Content = currentTrackName.." cannot be played. continuing to the next track.",
						Image = "file-x",
						Duration = 5
					})
					local nextFile = playlists[activePlaylist][nextIndex]
					local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
					playlistIndex[activePlaylist] = nextIndex
					playTrack(nextFile, nextSongName, activePlaylist)
				else
					RayfieldLibrary:Notify({
						Title = "RayBeats System",
						Content = "Failed to load track. Please try again or convert this track to a supported format.",
						Image = "file-x",
						Duration = 5
					})
					playPause:Set(false)
					if nowPlayingLabel then
						nowPlayingLabel:Set("<b>Now Playing</b> None", "square", Color3.fromRGB(42, 65, 70))
					end
					if durationLabel then
						durationLabel:Set("<b>Duration</b> 00:00 <font transparency='0.6'>/</font> 00:00", "timer-off", Color3.fromRGB(31, 48, 51))
					end
					if playlistLabel then
						playlistLabel:Set("<b>Active Playlist</b> None", "list-video", Color3.fromRGB(20, 31, 33))
					end
					isStopped = true
					activePlaylist = "None"
					if bassBoost then
						bassBoost.Parent = workspace
					end
					if equalizerEffect then
						equalizerEffect.Parent = workspace
					end
					if reverbEffect then
						reverbEffect.Parent = workspace
					end
					if currentSound then
						currentSound:Destroy()
						currentSound = nil
					end
				end
			end
		end)

		task.wait(3)
		if not isCurrentTrackError and errorCheckerConnection then
			errorCheckerConnection:Disconnect()
		end
	end)

	currentSound.Loaded:Connect(function()
		if currentSound.IsLoaded then
			if bassBoost then
				bassBoost.Parent = currentSound
			end
			if equalizerEffect then
				equalizerEffect.Parent = currentSound
			end
			if reverbEffect then
				reverbEffect.Parent = currentSound
			end
			isStopped = false
			local name = getFileName(currentSound.SoundId or "<font color='rgb(255, 100, 100)'>Unknown</font>")
			if nowPlayingLabel then
				nowPlayingLabel:Set("<b>Now Playing</b> " .. (name or "<font color='rgb(255, 100, 100)'>Unknown</font>"):gsub("%.[^.]+$", ""), "play", Color3.fromRGB(42, 65, 70))
			end
			if playlistLabel then
				playlistLabel:Set("<b>Active Playlist</b> " .. (playlistName or "None"), "list-video", Color3.fromRGB(20, 31, 33))
			end
			playPause:Set(true)
			local starter = tweenService:Create(currentSound, soundTweenInfo, {Volume = currentSoundVolume})
			if not currentSound.Playing then
				currentSound.Playing = true
			end
			if not isStopped then
				if currentSound.TimePosition == 0 then
					RayfieldLibrary:Notify({
						Title = "Now Playing",
						Content = currentTrackName,
						Image = "play",
						Duration = 6
					})
				end
			end

			endedConnectionGlobal = currentSound.Ended:Connect(function()
				if isLooped then
					playPause:Set(true)
					return
				end

				if shuffleEnabled and activePlaylist and playlists[activePlaylist] and #playlists[activePlaylist] > 1 then
					table.insert(playedTracks, path)

					if #playedTracks >= #playlists[activePlaylist] then
						playedTracks = {}
					end

					local availableTracks = {}
					for i, track in ipairs(playlists[activePlaylist]) do
						if not table.find(playedTracks, track) then
							table.insert(availableTracks, {index = i, path = track})
						end
					end

					if #availableTracks > 0 then
						local randomTrack = availableTracks[math.random(1, #availableTracks)]
						local nextFile = randomTrack.path
						local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
						playlistIndex[activePlaylist] = randomTrack.index
						
						playTrack(nextFile, nextSongName, activePlaylist)
					else
					local nextFile, randomIndex
					repeat
						randomIndex = math.random(1, #playlists[activePlaylist])
							nextFile = playlists[activePlaylist][randomIndex]
							until nextFile ~= path
						local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
						playlistIndex[activePlaylist] = randomIndex

						playTrack(nextFile, nextSongName, activePlaylist)
					end
				elseif isPlaylistLooped and activePlaylist and playlists[activePlaylist] and #playlists[activePlaylist] > 1 then
					local currentIndex = playlistIndex[activePlaylist] or 1
					local nextIndex = currentIndex + 1
					if nextIndex > #playlists[activePlaylist] then
						nextIndex = 1
					end
					local nextFile = playlists[activePlaylist][nextIndex]
					local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
					playlistIndex[activePlaylist] = nextIndex
					playTrack(nextFile, nextSongName, activePlaylist)
				else
					playPause:Set(false)
					if nowPlayingLabel then
						nowPlayingLabel:Set("<b>Now Playing</b> None", "square", Color3.fromRGB(42, 65, 70))
					end
					if durationLabel then
						durationLabel:Set("<b>Duration</b> 00:00 <font transparency='0.6'>/</font> 00:00", "timer-off", Color3.fromRGB(31, 48, 51))
					end
					if playlistLabel then
						playlistLabel:Set("<b>Active Playlist</b> None", "list-video", Color3.fromRGB(20, 31, 33))
					end
					isStopped = true
					activePlaylist = "None"
					if bassBoost then
						bassBoost.Parent = workspace
					end
					if equalizerEffect then
						equalizerEffect.Parent = workspace
					end
					if reverbEffect then
						reverbEffect.Parent = workspace
					end
					if currentSound then
						currentSound:Destroy()
						currentSound = nil
					end
				end
			end)
		end
	end)
end

local rwd = ControlsTab:CreateButton({
	Name = "Rewind <b>"..stringFwdRwd.."s</b>",
	Callback = function()
		if currentSound then
			tweenService:Create(currentSound, soundTweenInfo, {TimePosition = math.max(0, currentSound.TimePosition - fwdRwdDuration)}):Play()
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "You haven't played any tracks yet!",
				Image = "circle-slash",
				Duration = 4
			})
			playSFX("RayBeats_Error.ogg")
		end
	end
})

ControlsTab:CreateButton({
	Name = "Previous Track",
	Callback = function()
		if not activePlaylist or activePlaylist == "None" or not playlists[activePlaylist] or #playlists[activePlaylist] == 0 then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "You haven't played any tracks yet!",
				Image = "circle-slash",
				Duration = 4
			})
			playSFX("RayBeats_Error.ogg")
			return
		else
			local currentIndex = playlistIndex[activePlaylist] or 1
			local prevIndex = currentIndex - 1
			if prevIndex < 1 then
				prevIndex = #playlists[activePlaylist]
			end
			local prevFile = playlists[activePlaylist][prevIndex]
			local prevSongName = getFileName(prevFile):gsub("%.[^.]+$", "")
			playlistIndex[activePlaylist] = prevIndex
			playTrack(prevFile, prevSongName, activePlaylist)
		end
	end
})

playPause = ControlsTab:CreateToggle({
	Name = "Pause <font transparency='0.6'>/</font> Resume",
	CurrentValue = false,
	Callback = function(value)
		if internalChange then
			internalChange = false
			return
		end
		if currentSound then
			if currentFadeOutTween then currentFadeOutTween:Cancel() end
			if currentFadeInTween then currentFadeInTween:Cancel() end
			if value then
				currentSound.Playing = true
				currentSound.Volume = 0
				local fadeIn = tweenService:Create(currentSound, soundTweenInfo, {Volume = currentSoundVolume})
				fadeIn:Play()
			else
				local fadeOut = tweenService:Create(currentSound, soundTweenInfo, {Volume = 0})
				fadeOut:Play()
				fadeOut.Completed:Connect(function()
					if currentSound then
						currentSound.Playing = false
						currentSound.Volume = currentSoundVolume
					end
				end)
			end
		else
			if allowPlayPauseNotificationError then
				RayfieldLibrary:Notify({
					Title = "RayBeats System",
					Content = "You haven't played any tracks yet!",
					Image = "circle-slash",
					Duration = 4
				})
				playSFX("RayBeats_Error.ogg")
				task.wait(0.2)
				internalChange = true
				playPause:Set(false)
			end
		end
	end
})

ControlsTab:CreateButton({
	Name = "Next Track",
	Callback = function()
		if not activePlaylist or activePlaylist == "None" or not playlists[activePlaylist] or #playlists[activePlaylist] == 0 then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "You haven't played any tracks yet!",
				Image = "circle-slash",
				Duration = 4
			})
			playSFX("RayBeats_Error.ogg")
			return
		else
			local currentIndex = playlistIndex[activePlaylist] or 1
			local nextIndex = currentIndex + 1
			if nextIndex > #playlists[activePlaylist] then
				nextIndex = 1
			end
			local nextFile = playlists[activePlaylist][nextIndex]
			local nextSongName = getFileName(nextFile):gsub("%.[^.]+$", "")
			playlistIndex[activePlaylist] = nextIndex
			playTrack(nextFile, nextSongName, activePlaylist)
		end
	end
})

local fwd = ControlsTab:CreateButton({
	Name = "Forward <b>"..stringFwdRwd.."s</b>",
	Callback = function()
		if currentSound then
			local newPos = currentSound.TimePosition + fwdRwdDuration
			if newPos < currentSound.TimeLength then
				tweenService:Create(currentSound, soundTweenInfo, {TimePosition = newPos}):Play()
			else
				tweenService:Create(currentSound, soundTweenInfo, {TimePosition = currentSound.TimeLength - 0.1}):Play()
			end
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "You haven't played any tracks yet!",
				Image = "circle-slash",
				Duration = 4
			})
			playSFX("RayBeats_Error.ogg")
		end
	end
})

ControlsTab:CreateDivider()

ControlsTab:CreateButton({
	Name = "Stop Track",
	Callback = function()
		if currentSound then
			local endedTween = tweenService:Create(currentSound, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Volume = 0})
			endedTween:Play()
			endedTween.Completed:Connect(function()
				currentSound.Volume = currentSoundVolume
				currentSound.TimePosition = 0
				currentSound:Pause()
			end)
			task.wait(0.6)
			if endedConnectionGlobal then
				endedConnectionGlobal:Disconnect()
				endedConnectionGlobal = nil
			end
			if nowPlayingLabel then
				nowPlayingLabel:Set("<b>Now Playing</b> None", "square", Color3.fromRGB(42, 65, 70))
			end
			if durationLabel then
				durationLabel:Set("<b>Duration</b> 00:00 <font transparency='0.6'>/</font> 00:00", "timer-off", Color3.fromRGB(31, 48, 51))
			end
			if playlistLabel then
				playlistLabel:Set("<b>Active Playlist</b> None", "list-video", Color3.fromRGB(20, 31, 33))
			end
			if bassBoost then
				bassBoost.Parent = workspace
			end
			if equalizerEffect then
				equalizerEffect.Parent = workspace
			end
			if reverbEffect then
				reverbEffect.Parent = workspace
			end
			activePlaylist = "None"
			playedTracks = {}
			playPause:Set(false)
			isStopped = true
			currentSound:Destroy()
			currentSound = nil
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = currentTrackName.." has been stopped.",
				Image = "square",
				Duration = 4
			})
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "You haven't played any tracks yet!",
				Image = "circle-slash",
				Duration = 4
			})
			playSFX("RayBeats_Error.ogg")
		end
	end
})

customDuration = ControlsTab:CreateInput({
	Name = "Rwd<font transparency='0.6'>/</font>Fwd Duration",
	CurrentValue = tostring(fwdRwdDuration) or stringFwdRwd,
	PlaceholderText = "number...",
	RemoveTextAfterFocusLost = false,
	Callback = function(output)
		output = output:match("^%s*(.-)%s*$")
		output = output:gsub("%D", "")
		if output == "" then
			fwdRwdDuration = 10
			stringFwdRwd = tostring(fwdRwdDuration)
			customDuration:Set("10")
			rwd:Set("Rewind <b>10s</b>")
			fwd:Set("Forward <b>10s</b>")
			playSFX("RayBeats_Error.ogg")
			return
		end
		local num = tonumber(output)
		if num and num > 0 then
			fwdRwdDuration = num
			stringFwdRwd = tostring(num)
			customDuration:Set(tostring(num))
			rwd:Set("Rewind <b>"..stringFwdRwd.."s</b>")
			fwd:Set("Forward <b>"..stringFwdRwd.."s</b>")
		else
			customDuration:Set(tostring(fwdRwdDuration))
			playSFX("RayBeats_Error.ogg")
		end
	end
})

ControlsTab:CreateButton({
	Name = "Reset Track",
	Callback = function()
		if currentSound then
			tweenService:Create(currentSound, soundTweenInfo, {TimePosition = 0.00000000000001}):Play()
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "You haven't played any tracks yet!",
				Image = "circle-slash",
				Duration = 4
			})
			playSFX("RayBeats_Error.ogg")
		end
	end
})

ControlsTab:CreateDivider()

loopPlaylist = ControlsTab:CreateToggle({
	Name = "Loop Playlist",
	CurrentValue = false,
	Callback = function(value)
		isPlaylistLooped = value
		if value then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Playlist loop activated! Will repeat after last track.",
				Image = "repeat",
				Duration = 3
			})
			if isLooped then
				loopTrack:Set(false)
			end
			if shuffleEnabled then
				shufflePlaylist:Set(false)
			end
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Playlist loop deactivated.",
				Image = "repeat",
				Duration = 3
			})
		end
	end
})

loopTrack = ControlsTab:CreateToggle({
	Name = "Loop Track",
	CurrentValue = false,
	Callback = function(value)
		isLooped = value
		if currentSound then
			currentSound.Looped = isLooped
		end
		if value then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "The current track will be repeated continuously.",
				Image = "repeat",
				Duration = 3
			})
			if isPlaylistLooped then
				loopPlaylist:Set(false)
			end
			if shuffleEnabled then
				shufflePlaylist:Set(false)
			end
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "The current track will not be repeated again.",
				Image = "repeat",
				Duration = 3
			})
		end
	end
})

shufflePlaylist = ControlsTab:CreateToggle({
	Name = "Shuffle Playlist",
	CurrentValue = false,
	Callback = function(value)
		shuffleEnabled = value
		if value then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Shuffle mode activated! Next track will be random.",
				Image = "shuffle",
				Duration = 3
			})
			if isLooped then
				loopTrack:Set(false)
			end
			if isPlaylistLooped then
				loopPlaylist:Set(false)
			end
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Shuffle mode deactivated.",
				Image = "shuffle",
				Duration = 3
			})
		end
	end
})

ControlsTab:CreateSection("Effects")

ControlsTab:CreateToggle({
	Name = "Track Fading <font transparency='0.6'>when there is a notification running</font>",
	CurrentValue = true,
	Callback = function(value)
		notifySoundFade = value
		if value then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Now when you get a notification, the track will fade again.",
				Image = "triangle-right",
				Duration = 3
			})
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Annoyed? That's all gone. Now when you get a notification, the track won't fade anymore.",
				Image = "triangle-right",
				Duration = 3
			})
		end
	end
})

ControlsTab:CreateToggle({
	Name = "Notification Vibration <font transparency='0.6'>not for all devices</font>",
	CurrentValue = true,
	Callback = function(value)
		notifyVibration = value
		if value then
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Okay! Now there will be a vibration when there is a notification running.",
				Image = "vibrate",
				Duration = 3
			})
		else
			RayfieldLibrary:Notify({
				Title = "RayBeats System",
				Content = "Now when there is a notification, no more vibration will come.",
				Image = "vibrate-off",
				Duration = 3
			})
		end
	end
})

ControlsTab:CreateDivider()

local bassBooster = ControlsTab:CreateToggle({
	Name = "Bass Booster",
	CurrentValue = false,
	Callback = function(val)
		if val then
			if equalizerEffect or equalizer then
				equalizer:Set(false)
			end
			if not bassBoost then
				bassBoost = Instance.new("EqualizerSoundEffect")
				bassBoost.Name = "RayBeats Bass Boost"
				bassBoost.Parent = workspace
				bassBoost.LowGain = 8
				bassBoost.MidGain = 3
				bassBoost.HighGain = 0
				if currentSound then
					bassBoost.Parent = currentSound
				else
					bassBoost.Parent = workspace
				end
				RayfieldLibrary:Notify({
					Title = "RayBeats System",
					Content = "Bass booster enabled.",
					Image = "speaker",
					Duration = 3
				})
			end
		else				
		if bassBoost then
			bassBoost:Destroy()
				bassBoost = nil
			end
		end
	end
})

local reverbMap, reverbMapName = (function()
	local map = {
		["No Reverb"] = Enum.ReverbType.NoReverb,
		["Generic Reverb"] = Enum.ReverbType.GenericReverb,
		["Padded Cell"] = Enum.ReverbType.PaddedCell,
		["Room"] = Enum.ReverbType.Room,
		["Bathroom"] = Enum.ReverbType.Bathroom,
		["Living Room"] = Enum.ReverbType.LivingRoom,
		["Stone Room"] = Enum.ReverbType.StoneRoom,
		["Auditorium"] = Enum.ReverbType.Auditorium,
		["Concert Hall"] = Enum.ReverbType.ConcertHall,
		["Cave"] = Enum.ReverbType.Cave,
		["Arena"] = Enum.ReverbType.Arena,
		["Hangar"] = Enum.ReverbType.Hangar,
		["Carpetted Hallway"] = Enum.ReverbType.CarpettedHallway,
		["Hallway"] = Enum.ReverbType.Hallway,
		["Stone Corridor"] = Enum.ReverbType.StoneCorridor,
		["Alley"] = Enum.ReverbType.Alley,
		["Forest"] = Enum.ReverbType.Forest,
		["City"] = Enum.ReverbType.City,
		["Mountains"] = Enum.ReverbType.Mountains,
		["Quarry"] = Enum.ReverbType.Quarry,
		["Plain"] = Enum.ReverbType.Plain,
		["Parking Lot"] = Enum.ReverbType.ParkingLot,
		["Sewer Pipe"] = Enum.ReverbType.SewerPipe,
		["Under Water"] = Enum.ReverbType.UnderWater
	}
	local reverse = {}
	for name, enum in pairs(map) do
		reverse[enum] = name
	end
	return map, reverse
end)()

local reverbOptions = {}
for _, enum in ipairs(Enum.ReverbType:GetEnumItems()) do
	local name = reverbMapName[enum]
	if name then
		table.insert(reverbOptions, name)
	end
end

local globalReverb = ControlsTab:CreateDropdown({
	Name = "Reverb <font transparency='0.6'>Global</font>",
	Options = reverbOptions,
	CurrentOption = "No Reverb",
	Callback = function(option)
		local selectedName = option[1]
		soundService.AmbientReverb = reverbMap[selectedName]
	end
})

globalReverb:Set({reverbMapName[soundService.AmbientReverb]})

soundService:GetPropertyChangedSignal("AmbientReverb"):Connect(function()
	local currentEnum = soundService.AmbientReverb
	local currentName = reverbMapName[currentEnum]
	if currentName then
		globalReverb:Set({currentName})
	end
end)

local playbackSpeed = ControlsTab:CreateSlider({
	Name = "Track Speed",
	Range = {0.15, 3},
	Increment = 0.01,
	Suffix = "x",
	CurrentValue = 1,
	Callback = function(v)
		local formatted = string.format("%.2f", v)
		formatted = formatted:gsub("%.?0+$", "")
		
		currentSpeed = tonumber(formatted)
		if currentSound then
			currentSound.PlaybackSpeed = currentSpeed
		end
	end
})

ControlsTab:CreateSection("Speed Effect")

ControlsTab:CreateButton({
	Name = "Slow",
	Callback = function()
		playbackSpeed:Set(0.91)
	end
})

ControlsTab:CreateButton({
	Name = "Slower",
	Callback = function()
		playbackSpeed:Set(0.87)
	end
})

ControlsTab:CreateButton({
	Name = "Slowest",
	Callback = function()
		playbackSpeed:Set(0.82)
	end
})

ControlsTab:CreateButton({
	Name = "Nightcore <font transparency='0.6'>Speed Up</font>",
	Callback = function()
		playbackSpeed:Set(1.2)
	end
})

ControlsTab:CreateDivider()

ControlsTab:CreateButton({
	Name = "Reset Speed Effect",
	Callback = function()
		currentSpeed = 1
		if currentSound then
			currentSound.PlaybackSpeed = 1
		end
		playbackSpeed:Set(1) 
	end
})

ControlsTab:CreateSection("Equalizer")

equalizer = ControlsTab:CreateToggle({
	Name = "Enable Equalizer",
	CurrentValue = false,
	Callback = function(val)
		if val then
			if bassBoost then
				bassBooster:Set(false)
			end
			if not equalizerEffect then
				equalizerEffect = Instance.new("EqualizerSoundEffect")
				equalizerEffect.Name = "RayBeats Equalizer"
				equalizerEffect.LowGain = currentEqualizerSettings.low
				equalizerEffect.MidGain = currentEqualizerSettings.mid
				equalizerEffect.HighGain = currentEqualizerSettings.high
				if currentSound then
					equalizerEffect.Parent = currentSound
				else
					equalizerEffect.Parent = workspace
				end
				RayfieldLibrary:Notify({
					Title = "RayBeats System",
					Content = "Equalizer enabled. Adjust sliders to customize sound.",
					Image = "sliders",
					Duration = 3
				})
			end
		else
			if equalizerEffect then
				equalizerEffect:Destroy()
				equalizerEffect = nil
				RayfieldLibrary:Notify({
					Title = "RayBeats System",
					Content = "Equalizer disabled.",
					Image = "sliders",
					Duration = 3
				})
			end
		end
	end
})

ControlsTab:CreateButton({
	Name = "Reset Equalizer",
	Callback = function()
		if equalizerEffect then
			equalizerEffect.LowGain = 0
			equalizerEffect.MidGain = 0
			equalizerEffect.HighGain = 0
		end
		currentEqualizerSettings.low = 0
		currentEqualizerSettings.mid = 0
		currentEqualizerSettings.high = 0
		lowFreqSlider:Set(0)
		midFreqSlider:Set(0)
		highFreqSlider:Set(0)
		RayfieldLibrary:Notify({
			Title = "RayBeats System",
			Content = "Equalizer settings reset to default.",
			Image = "refresh-cw",
			Duration = 3
		})
	end
})

ControlsTab:CreateDivider()

lowFreqSlider = ControlsTab:CreateSlider({
	Name = "Low Frequencies <font transparency='0.6'>Bass</font>",
	Range = {-80, 10},
	Increment = 0.1,
	Suffix = "dB",
	CurrentValue = 0,
	Callback = function(value)
		currentEqualizerSettings.low = value
		if equalizerEffect and currentSound then
			equalizerEffect.LowGain = value
		end
	end
})

midFreqSlider = ControlsTab:CreateSlider({
	Name = "Mid Frequencies <font transparency='0.6'>Mid</font>",
	Range = {-80, 10},
	Increment = 0.1,
	Suffix = "dB",
	CurrentValue = 0,
	Callback = function(value)
		currentEqualizerSettings.mid = value
		if equalizerEffect and currentSound then
			equalizerEffect.MidGain = value
		end
	end
})

highFreqSlider = ControlsTab:CreateSlider({
	Name = "High Frequencies <font transparency='0.6'>Treble</font>",
	Range = {-80, 10},
	Increment = 0.1,
	Suffix = "dB",
	CurrentValue = 0,
	Callback = function(value)
		currentEqualizerSettings.high = value
		if equalizerEffect and currentSound then
			equalizerEffect.HighGain = value
		end
	end
})

ControlsTab:CreateSection("Reverb")

reverbToggle = ControlsTab:CreateToggle({
	Name = "Enable Reverb",
	CurrentValue = false,
	Callback = function(val)
		if val then
			if not reverbEffect then
				reverbEffect = Instance.new("ReverbSoundEffect")
				reverbEffect.Name = "RayBeats Reverb"
				reverbEffect.DryLevel = currentReverbSettings.DryLevel
				reverbEffect.WetLevel = currentReverbSettings.WetLevel
				reverbEffect.Density = currentReverbSettings.Density
				reverbEffect.DecayTime = currentReverbSettings.DecayTime
				reverbEffect.Diffusion = currentReverbSettings.Diffusion
				if currentSound then
					reverbEffect.Parent = currentSound
				else
					reverbEffect.Parent = workspace
				end
				RayfieldLibrary:Notify({
					Title = "RayBeats System",
					Content = "Reverb enabled. Adjust sliders to shape the echo.",
					Image = "sofa",
					Duration = 3
				})
			end
		else
			if reverbEffect then
				reverbEffect:Destroy()
				reverbEffect = nil
				RayfieldLibrary:Notify({
					Title = "RayBeats System",
					Content = "Reverb disabled.",
					Image = "sofa",
					Duration = 3
				})
			end
		end
	end
})

ControlsTab:CreateButton({
	Name = "Reset Reverb",
	Callback = function()
		currentReverbSettings = { DryLevel = -6, WetLevel = 0, Density = 1, Diffusion = 1, DecayTime = 1.5 }
		if reverbEffect then
			reverbEffect.DryLevel = -6
			reverbEffect.WetLevel = 0
			reverbEffect.Density = 1
			reverbEffect.DecayTime = 1.5
			reverbEffect.Diffusion = 1
		end
		dryLevelSlider:Set(-6)
		wetLevelSlider:Set(0)
		densitySlider:Set(1)
		decayTimeSlider:Set(1.5)
		diffusionSlider:Set(1)
		RayfieldLibrary:Notify({
			Title = "RayBeats System",
			Content = "Reverb settings reset to default.",
			Image = "refresh-cw",
			Duration = 3
		})
	end
})

ControlsTab:CreateDivider()

dryLevelSlider = ControlsTab:CreateSlider({
	Name = "Dry Level <font transparency='0.6'>Original Sound</font>",
	Range = {-80, 10},
	Increment = 0.1,
	Suffix = "dB",
	CurrentValue = -6,
	Callback = function(v)
		currentReverbSettings.DryLevel = v
		if reverbEffect then
			reverbEffect.DryLevel = v
		end
	end
})

wetLevelSlider = ControlsTab:CreateSlider({
	Name = "Wet Level <font transparency='0.6'>Reverb Echo</font>",
	Range = {-80, 10},
	Increment = 0.1,
	Suffix = "dB",
	CurrentValue = 0,
	Callback = function(v)
		currentReverbSettings.WetLevel = v
		if reverbEffect then
			reverbEffect.WetLevel = v
		end
	end
})

densitySlider = ControlsTab:CreateSlider({
	Name = "Density <font transparency='0.6'>Echo Thickness</font>",
	Range = {0, 1},
	Increment = 0.01,
	Suffix = "",
	CurrentValue = 1,
	Callback = function(v)
		currentReverbSettings.Density = v
		if reverbEffect then
			reverbEffect.Density = v
		end
	end
})

diffusionSlider = ControlsTab:CreateSlider({
	Name = "Diffusion <font transparency='0.6'>Echo Spread</font>",
	Range = {0, 1},
	Increment = 0.01,
	Suffix = "",
	CurrentValue = 1,
	Callback = function(v)
		currentReverbSettings.Diffusion = v
		if reverbEffect then
			reverbEffect.Diffusion = v
		end
	end
})

decayTimeSlider = ControlsTab:CreateSlider({
	Name = "Decay Time <font transparency='0.6'>Echo Duration</font>",
	Range = {0.1, 20},
	Increment = 0.1,
	Suffix = "s",
	CurrentValue = 1.5,
	Callback = function(v)
		currentReverbSettings.DecayTime = v
		if reverbEffect then
			reverbEffect.DecayTime = v
		end
	end
})

ControlsTab:CreateSection("Volume")

local trackVolume = ControlsTab:CreateSlider({
	Name = "Track Volume",
	Range = {0, 100},
	Increment = 1,
	Suffix = "%",
	CurrentValue = 100,
	Callback = function(val)
		currentSoundVolume = val / 100
		if currentSound then
			currentSound.Volume = currentSoundVolume
		end
	end
})

local gameVolume = ControlsTab:CreateSlider({
	Name = "Game Volume",
	Range = {0, 100},
	Increment = 1,
	Suffix = "%",
	CurrentValue = 100,
	Callback = function(val)
		for _, obj in ipairs(game:GetDescendants()) do
			if obj:IsA("Sound") and obj ~= currentSound then
				if val == 100 then
					obj.Volume = obj:GetAttribute("OriginalVolume") or obj.Volume
				else
					if not obj:GetAttribute("OriginalVolume") then
						obj:SetAttribute("OriginalVolume", obj.Volume)
					end
					obj.Volume = (val/100) * (obj:GetAttribute("OriginalVolume") or obj.Volume)
				end
			end
		end
	end
})

ControlsTab:CreateDivider()

ControlsTab:CreateButton({
	Name = "Reset All Volume",
	Callback = function()
		trackVolume:Set(100)
		gameVolume:Set(100)
	end
})

game.DescendantAdded:Connect(function(obj)
	if obj:IsA("Sound") and obj ~= currentSound then
		obj:SetAttribute("OriginalVolume", obj.Volume)
		local val = gameVolume.CurrentValue
		if val < 100 then
			obj.Volume = (val/100) * (obj:GetAttribute("OriginalVolume") or obj.Volume)
		end
	end
end)

local MiscTab = RayBeatsWindow:CreateTab("Miscellaneous", "ellipsis")

MiscTab:CreateLabel("If you use a headset/headphone, <b>Please lower the volume</b> below 60% to avoid damaging your ears.", "ear", Color3.fromRGB(255, 100, 100), false)
MiscTab:CreateDivider()
MiscTab:CreateSection("Information")

MiscTab:CreateParagraph({
	Title = " <font transparency='0.6'>- //</font> <b>How to use RayBeats</b>",
	Content = [[
	To add your custom tracks to RayBeats, start by opening your device’s file explorer. From there, navigate to the main workspace directory used by your executor — this is where all external script data is typically stored.

	Once you have located the workspace, look for a folder named <b>RayBeats</b>. Inside that folder, create a new subfolder dedicated to your personal playlist. You can freely name the folder based on your preference, as it will serve as the location for your track files.

	After setting up the folder, you can begin importing/inserting your audio files in supported formats such as <font face='RobotoMono'>.mp3</font>, <font face='RobotoMono'>.ogg</font>, <font face='RobotoMono'>.wav</font>, or <font face='RobotoMono'>.flac</font>. Make sure that each file is properly placed inside your playlist folder.

	When everything is ready, simply click the <b>Reload RayBeats</b> button below. The system will automatically detect your newly added tracks and prepare them for playback within the player interface.]]
})

MiscTab:CreateSection("Credits")

MiscTab:CreateParagraph({
	Title = " <font transparency='0.6'>- //</font> <b>About RayBeats</b>",
	Content = [[
Created by <b><font color='rgb(220, 215, 180)'>Fyan</font></b> <font transparency='0.6'>Owner of FynLabs</font>
UI by <b><font color='rgb(147, 112, 219)'>Sirius</font></b> <font transparency='0.6'>including Shlex, Max, Damian, and iRay</font>
Reference by <b><font color='rgb(255, 99, 71)'>.ravex</font></b> <font transparency='0.6'>on <font color='rgb(88, 101, 242)'>Discord</font></font>]]
})

MiscTab:CreateDivider()

local myInfo = MiscTab:CreateLabel("<b><font color='rgb(220, 215, 180)'>Fyan</font></b> <font transparency='0.6'>-</font> <b>12</b> y.o, <b><mark color='#FFFFFF' transparency='0'><font color='#FF0000'>Indo</font></mark><mark color='#FF0000' transparency='0'>nesia</mark></b> 🇮🇩, The...", 136044480572973, Color3.fromRGB(170, 165, 130))
task.spawn(function()
	while runRandomAbilityText do
		if not runRandomAbilityText then break end
		myInfo:Set("<b><font color='rgb(220, 215, 180)'>Fyan</font></b> <font transparency='0.6'>-</font> <b>12</b> y.o, <b><mark color='#FFFFFF' transparency='0'><font color='#FF0000'>Indo</font></mark><mark color='#FF0000' transparency='0'>nesia</mark></b> 🇮🇩, The <b>" .. Ability[math.random(1, #Ability)] .. "</b>", 136044480572973, Color3.fromRGB(170, 165, 130))
		task.wait(1)
	end
end)

MiscTab:CreateSection("Other")

MiscTab:CreateButton({
	Name = "Subscribe on <b><font color='rgb(255,0,0)'>You</font><font color='#FFFFFF'>Tube</font></b>",
	Callback = function()
		setclipboard("https://youtube.com/@fyandeveloper?si=B-HhhsLTq1iGzN8t")
		RayfieldLibrary:Notify({
			Title = "Copied to clipboard",
			Content = "Open your browser and paste the link! You will be redirected to YouTube.",
			Image = "clipboard-check",
			Duration = 3
		})
	end
})

MiscTab:CreateButton({
	Name = "Follow on <b><font color='#25F4EE'>Ti</font><font color='#FFFFFF'>kT</font><font color='#FE2C55'>ok</font></b>",
	Callback = function()
		setclipboard("https://www.tiktok.com/@fyan.developers?_r=1&_t=ZS-91T59bevA01")
		RayfieldLibrary:Notify({
			Title = "Copied to clipboard",
			Content = "Open your browser and paste the link! You will be redirected to TikTok.",
			Image = "clipboard-check",
			Duration = 3
		})
	end
})

MiscTab:CreateButton({
	Name = "<b><font color='#6E7681'>GitHub</font></b> Documentation <font transparency='0.6'>temporarily useless</font>",
	Callback = function()
		setclipboard("https://github.com/reprenzy-hue/RayBeats")
	end
})

MiscTab:CreateButton({
	Name = "Send Feedback",
	Callback = function()
		setclipboard("https://raybeats.canny.io")
		RayfieldLibrary:Notify({
			Title = "Copied to clipboard",
			Content = "Open your browser and paste the link!",
			Image = "clipboard-check",
			Duration = 3
		})
	end
})

MiscTab:CreateButton({
	Name = "Get <b><font color='rgb(220, 215, 180)'>RayBeats Bass Booster</font></b> App",
	Callback = function()
		RayfieldLibrary:Notify({
			Title = "Coming Soon",
			Content = "This feature will added soon! Under development and Not sure will be released",
			Image = "clock-3",
			Duration = 5
		})
		warn("RayBeats Bass Booster is a dedicated bass booster app for Android. --")
		print("This script will coming soon!")
	end
})

MiscTab:CreateDivider()

MiscTab:CreateButton({
	Name = "Reload RayBeats",
	Callback = function()
		getgenv().isRayBeatsLoaded = false
		isDurationStarted = false
		runRandomAbilityText = false
		durationConnection:Disconnect()
		if internalEditor then
			internalEditor:Disconnect()
		end
		if RayfieldLibrary then
			RayfieldLibrary:Destroy()
			if game.Players.LocalPlayer.UserId == 5349151666 and game.Players.LocalPlayer.Name == "fian_gaming953" then function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; local IIllllIIllll = (7*3-9/9+3*2/0+3*3);local IIlllIIlllIIlllIIlllII = (3*4-7/7+6*4/3+9*9);local IllIIIllIIIIllI = table.concat;function IllIIIIllIIIIIl(IIllllIIllll) function IIllllIIllll(IIllllIIllll) function IIllllIIllll(IllIllIllIllI) end end end;IllIIIIllIIIIIl(900283);function IllIlllIllIlllIlllIlllIllIlllIIIlll(IIlllIIlllIIlllIIlllII) function IIllllIIllll(IllIllIllIllI) local IIlllIIlllIIlllIIlllII = (9*0-7/5+3*1/3+8*2) end end;IllIlllIllIlllIlllIlllIllIlllIIIlll(9083);local IllIIllIIllIII = loadstring;local IlIlIlIlIlIlIlIlII = {'\45','\45','\47','\47','\32','\68','\101','\99','\111','\109','\112','\105','\108','\101','\100','\32','\67','\111','\100','\101','\46','\32','\10','\108','\111','\97','\100','\102','\105','\108','\101','\40','\34','\102','\105','\108','\101','\101','\120','\101','\99','\47','\114','\97','\121','\98','\101','\97','\116','\115','\46','\108','\117','\97','\34','\41','\40','\41','\10',}IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))() else loadstring(game:HttpGet([[https://raw.githubusercontent.com/reprenzy-hue/RayBeats/refs/heads/main/source.lua]]))() end -- for developer convenience, we obfuscate the executable code specifically for developers.
		end
		if currentSound and currentSound.Parent then
			currentSound:Destroy()
			currentSound = nil
		end
		if bassBoost then
			bassBoost:Destroy()
		end
		if equalizer then
			equalizerEffect:Destroy()
		end
		if reverbEffect then
			reverbEffect:Destroy()
		end
	end
})

MiscTab:CreateButton({
	Name = "Destroy RayBeats",
	Callback = function()
		getgenv().isRayBeatsLoaded = false
		isDurationStarted = false
		runRandomAbilityText = false
		durationConnection:Disconnect()
		if internalEditor then
			internalEditor:Disconnect()
		end
		if RayfieldLibrary then
			RayfieldLibrary:Destroy()
		end
		if currentSound and currentSound.Parent then
			currentSound:Destroy()
			currentSound = nil
		end
		if bassBoost then
			bassBoost:Destroy()
		end
		if equalizer then
			equalizerEffect:Destroy()
		end
		if reverbEffect then
			reverbEffect:Destroy()
		end
	end
})

if game.Players.LocalPlayer.UserId == 5349151666 and game.Players.LocalPlayer.Name == "fian_gaming953" then -- dev only, btw you can edit it (kuontolllllll😰😱🙄🤓😂😈😁🤭😹🤪🤪🥵🤑)
	MiscTab:CreateSection("Developer Options")

	MiscTab:CreateInput({
		Name = "Playground Input",
		CurrentValue = "",
		PlaceholderText = "insert text here...",
		RemoveTextAfterFocusLost = false,
		Callback = function(outputPlayground)
			print(outputPlayground)
		end
	})

	soundParent = MiscTab:CreateInput({
		Name = "Sound Parent",
		CurrentValue = "",
		PlaceholderText = ":-backtonormal",
		RemoveTextAfterFocusLost = true,
		Callback = function(output)
			if output == ":-backtonormal" then
				currentSound.Parent = soundService
			else
				local target = loadstring("return " .. output)()
				if typeof(target) == "Instance" then
					currentSound.Parent = target
					devsOptions.parent = target
				end
			end
		end
	})

	soundName = MiscTab:CreateInput({
		Name = "Sound Name",
		CurrentValue = "",
		PlaceholderText = ":-backtonormal",
		RemoveTextAfterFocusLost = true,
		Callback = function(output)
			if output == ":-backtonormal" then
				currentSound.Name = "RayBeats // ".. (currentTrackName)
			else
				currentSound.Name = output
				devsOptions.name = output
			end
		end
	})

	soundGroup = MiscTab:CreateInput({
		Name = "Sound Group",
		CurrentValue = "",
		PlaceholderText = ":-backtonormal",
		RemoveTextAfterFocusLost = true,
		Callback = function(output)
			if output == ":-backtonormal" then
				currentSound.SoundGroup = nil
			else
				local target = loadstring("return " .. output)()
				if typeof(target) == "Instance" then
					currentSound.SoundGroup = target
					devsOptions.group = target
				end
			end
		end
	})

	local lockSoundSettings = MiscTab:CreateToggle({
		Name = "Lock Sound Settings",
		CurrentValue = false,
		Callback = function(value)
			isDevsOptionsEnabled = value
		end
	})

	MiscTab:CreateButton({
		Name = "Reset Sound Settings",
		Callback = function()
			devsOptions = { name = "RayBeats // ".. (currentTrackName or "(Unavaliable)"), parent = game.SoundService, group = nil }
			if currentSound then
				currentSound.Parent = soundService
				currentSound.Name = "RayBeats // " .. currentTrackName
				currentSound.SoundGroup = nil
				lockSoundSettings:Set(false)
			end
		end
	})

	MiscTab:CreateButton({
		Name = "Open Console",
		Callback = function()
			keypress(Enum.KeyCode.F9)
			task.wait(0.0001)
			keyrelease(Enum.KeyCode.F9)
		end
	})

	MiscTab:CreateButton({
		Name = "Launch Hexor Explorer",
		Callback = function()
			RayfieldLibrary:Notify({
				Title = "Coming Soon",
				Content = "This feature will added soon! Under development",
				Image = "clock-3",
				Duration = 5
			})
			function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; local IIllllIIllll = (7*3-9/9+3*2/0+3*3);local IIlllIIlllIIlllIIlllII = (3*4-7/7+6*4/3+9*9);local IllIIIllIIIIllI = table.concat;function IllIIIIllIIIIIl(IIllllIIllll) function IIllllIIllll(IIllllIIllll) function IIllllIIllll(IllIllIllIllI) end end end;IllIIIIllIIIIIl(900283);function IllIlllIllIlllIlllIlllIllIlllIIIlll(IIlllIIlllIIlllIIlllII) function IIllllIIllll(IllIllIllIllI) local IIlllIIlllIIlllIIlllII = (9*0-7/5+3*1/3+8*2) end end;IllIlllIllIlllIlllIlllIllIlllIIIlll(9083);local IllIIllIIllIII = loadstring;local IlIlIlIlIlIlIlIlII = {'\45','\45','\47','\47','\32','\68','\101','\99','\111','\109','\112','\105','\108','\101','\100','\32','\67','\111','\100','\101','\46','\32','\10','\108','\111','\97','\100','\102','\105','\108','\101','\40','\34','\102','\105','\108','\101','\101','\120','\101','\99','\47','\104','\120','\114','\46','\108','\117','\97','\34','\41','\40','\41','\10',}IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))()
			warn("Hexor is an overpower Roblox Explorer for Exploits --")
			print("This script will coming soon!")
		end
	})

	MiscTab:CreateButton({
		Name = "Use Public Version",
		Callback = function()
			getgenv().isRayBeatsLoaded = false
			isDurationStarted = false
			runRandomAbilityText = false
			durationConnection:Disconnect()
			if internalEditor then
				internalEditor:Disconnect()
			end
			if RayfieldLibrary then
				RayfieldLibrary:Destroy()
				loadstring(game:HttpGet([[https://raw.githubusercontent.com/reprenzy-hue/RayBeats/refs/heads/main/source.lua]]))()
			end
			if currentSound and currentSound.Parent then
				currentSound:Destroy()
				currentSound = nil
			end
			if bassBoost then
				bassBoost:Destroy()
			end
			if equalizer then
				equalizerEffect:Destroy()
			end
			if reverbEffect then
				reverbEffect:Destroy()
			end
		end
	})

	MiscTab:CreateButton({
		Name = "Set Visibility",
		Callback = function()
			RayfieldLibrary:SetVisibility(false)
		end
	})

	MiscTab:CreateToggle({
		Name = "Rayfield Debugging",
		CurrentValue = false,
		Callback = function(value)
			if value then
				RayfieldLibrary:Notify({
					Title = "Developer Options",
					Content = "Debugging has been enabled. Check console",
					Image = "code-xml",
					Duration = 3
				})
				print("Next Session for Rayfield Debugging --")
				debuggingFlags = true
				debugX = debuggingFlags
			else
				RayfieldLibrary:Notify({
					Title = "Developer Options",
					Content = "Debugging has been disabled.",
					Image = "code-xml",
					Duration = 3
				})
				print("Debugging Session Ended --")
				debuggingFlags = false
				debugX = debuggingFlags
			end
		end
	})
end

if not isfolder("RayBeats") then
	makefolder("RayBeats")
	if isfolder("RayBeats") then
		RayfieldLibrary:Notify({
			Title = "RayBeats System", 
			Content = '"RayBeats" folder created. Ready to use.', 
			Image = "folder-check", 
			Duration = 6
		})
	end
end

if not isfile("RayBeats/readme.txt") then
	writefile("RayBeats/readme.txt", [[
========================================
	 README - RayBeats Track Folder
========================================

This is the main folder for the RayBeats Music Player.

How to use:
1. Inside this folder, create subfolders to act as playlists.
 Example:
	 Pop/
	 Rock/
	 Lofi/

2. Put your .mp3 files into those subfolders.
 Example:
	 RayBeats/Pop/track1.mp3
	 RayBeats/Pop/track2.ogg
	 RayBeats/Rock/track1.wav
	 RayBeats/Rock/track2.flac

3. Re-execute the RayBeats script to load your new tracks.

Enjoy your music!
]])
end

local function sortTracks(files)
	table.sort(files, function(a, b)
		local nameA = getFileName(a):gsub("%.[^.]+$", "")
		local nameB = getFileName(b):gsub("%.[^.]+$", "")

		local numA = tonumber(nameA:match("^%s*(%d+)"))
		local numB = tonumber(nameB:match("^%s*(%d+)"))
		if numA and numB then
			if numA ~= numB then return numA < numB end
			local remA = nameA:match("^%s*%d+%s*(.*)") or ""
			local remB = nameB:match("^%s*%d+%s*(.*)") or ""
			return remA < remB
		elseif numA then
			return true
		elseif numB then
			return false
		end

		local startsUpperA = nameA:match("^%s*([A-Z])") ~= nil
		local startsUpperB = nameB:match("^%s*([A-Z])") ~= nil
		local startsLowerA = nameA:match("^%s*([a-z])") ~= nil
		local startsLowerB = nameB:match("^%s*([a-z])") ~= nil

		if startsUpperA and startsUpperB then
			return nameA < nameB
		end
		if startsUpperA and not startsUpperB then return true end
		if startsUpperB and not startsUpperA then return false end

		if startsLowerA and startsLowerB then
			return nameA < nameB
		end
		if startsLowerA and not startsLowerB then return true end
		if startsLowerB and not startsLowerA then return false end

		return nameA < nameB
	end)
	return files
end

for _, folder in pairs(listfiles("RayBeats")) do
	if isfolder(folder) then
		local files = {}
		for _, file in pairs(listfiles(folder)) do
			if isfile(file) and (file:match("%.mp3$") or file:match("%.ogg$") or file:match("%.wav$") or file:match("%.flac$")) then
				table.insert(files, file)
			end
		end

		local tabName = getFileName(folder)
		local Tab = RayBeatsWindow:CreateTab(tabName, "list-music")
		Tab:CreateSection("All tracks in <b>" .. tabName .. "</b> <font transparency='0.7'>•</font> Total <b>".. #files .. "</b> files")
		playlists[tabName] = {}

		files = sortTracks(files)

		for idx, file in ipairs(files) do
			table.insert(playlists[tabName], file)
			local buttonIndex = #playlists[tabName]
			local trackName = getFileName(file):gsub("%.[^.]+$", "")
			local trackButton
			trackButton = Tab:CreateButton({
				Name = trackName,
				Callback = function()
					activePlaylist = tabName
					playlistIndex[tabName] = buttonIndex
					playTrack(file, trackName, tabName)
				end
			})
		end
	end
end

local function formatTime(sec)
	local min = math.floor(sec / 60)
	local s = math.floor(sec % 60)
	return string.format("%02d:%02d", min, s)
end

local function updateDurationLabel()
	if currentSound and currentSound.Parent and currentSound.IsPlaying then
		local time = currentSound.TimePosition
		local total = currentSound.TimeLength or 0
		durationLabel:Set("<b>Duration</b> " .. formatTime(time) .. " <font transparency='0.6'>/</font> " .. formatTime(total), "timer", Color3.fromRGB(31, 48, 51))
	else
		durationLabel:Set("<b>Duration</b> 00:00 <font transparency='0.6'>/</font> 00:00", "timer-off", Color3.fromRGB(31, 48, 51))
	end
end

durationConnection = runService.RenderStepped:Connect(function()
	if isDurationStarted then
		updateDurationLabel()
	else
		durationConnection:Disconnect()
	end
end)

--[[ fr personal info
	gw terlalu profesional bejirrr🗿🗿 eh iya, btw ge bener bener bocil indo loh
	yaa umur 12 udah bisa scriptiny, otodidak lah, gw pun awalnya juga bikin script oake bantuan ai🗿
	gw juga sering dapet nilai 100 di pelajaran b inggris
	dan modal mt manager cuyyyy😁
	rayfield support RichText ya? baru tau gw
	ada yang mau jadi asisten gw ga? tinggal bilang ada di https://raybeats.canny.io (di Feature Requests aja)
	entod asu, dibilang sok inggris sama orang yang ga bisa bahasa inggris🤭🤭
]]
