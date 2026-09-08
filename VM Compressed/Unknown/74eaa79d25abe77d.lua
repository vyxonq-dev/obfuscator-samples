-- // Credit to C00l_Ch4os

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Genesis FE & 24 Hours FE Script - Hat - Rig | Just a baseplate | Made by C00l_Ch4os")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1

local bg = Instance.new("Frame", frame)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
bg.BackgroundTransparency = 1
bg.ZIndex = 0
TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()

local word = "Cha Co Gi Hub"
local letters = {}

local function tweenOutAndDestroy()
	for _, label in ipairs(letters) do
		TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1, TextSize = 20}):Play()
	end
	TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
	wait(0.6)
	screenGui:Destroy()
	blur:Destroy()
end

for i = 1, #word do
	local char = word:sub(i, i)

	local label = Instance.new("TextLabel")
	label.Text = char
	label.Font = Enum.Font.GothamBlack
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextStrokeTransparency = 1 
	label.TextTransparency = 1
	label.TextScaled = false
	label.TextSize = 30 
	label.Size = UDim2.new(0, 60, 0, 60)
	label.AnchorPoint = Vector2.new(0.5, 0.5)

	local spacing = 40
	label.Position = UDim2.new(0.5, (i - (#word / 2 + 0.5)) * spacing, 0.5, 0)

	label.BackgroundTransparency = 1
	label.Parent = frame

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 150)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 180, 90))
	})
	gradient.Rotation = 90
	gradient.Parent = label

	local tweenIn = TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0, TextSize = 60})
	tweenIn:Play()

	table.insert(letters, label)
	wait(0.15)
end

wait(3)

tweenOutAndDestroy()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetFont("rbxasset://fonts/families/FredokaOne.json")

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient("Cha Co Gi Hub | Just A Baseplate", Color3.fromHex("#A1FF99"), Color3.fromHex("#91FFEF")),
    Icon = "house",
    Author = "By: @cha_co_gi | Discord",
    Folder = "ChaCoGi_Hub",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = false
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

Window:EditOpenButton({
    Title = gradient("Cha Co Gi Hub", Color3.fromHex("#A1FF99"), Color3.fromHex("#91FFEF")),
    Icon = "app-window-mac",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("A1FF99"), 
        Color3.fromHex("91FFEF")
    ),
    Draggable = true,
})


local Tabs = {}

    Tabs.InfoSection = Window:Section({
        Title = "Info",
        Icon = "info",
        Opened = true,
    })
    
    Tabs.MainSection = Window:Section({
        Title = "Main",
        Icon = "move",
        Opened = true,
    })

    Tabs.ScriptInfo = Tabs.InfoSection:Tab({ Title = "Script Info", Icon = "info", Desc = "Info Of Script" })

    Tabs.Script = Tabs.MainSection:Tab({ Title = "Script", Icon = "sparkle", Desc = "Fe Script" })
    Tabs.Misc = Tabs.MainSection:Tab({ Title = "Misc", Icon = "user", Desc = "Something" })

Window:SelectTab(1)

Tabs.ScriptInfo:Section({ Title = "Version", Icon = "sparkle" })

Tabs.ScriptInfo:Paragraph({
    Title = "Version",
    Desc = "Verison: 1.0.0",
    Image = "hammer",
})

Tabs.ScriptInfo:Section({ Title = "Owner", Icon = "sparkle" })

Tabs.ScriptInfo:Paragraph({
    Title = "@cha_co_gi | Discord ",
    Desc = "Owner Of Script",
    Image = "user",
})

Tabs.Script:Section({ Title = "Fe Ban Hammer", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Ban Hammer [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 15427288323")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Ban Hammer")
    end
})

Tabs.Script:Button({
    Title = "Ban Hammer [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 15427288323")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Ban Hammer")
    end
})

Tabs.Script:Button({
    Title = "Ban Hammer [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 15427288323")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Ban Hammer")
    end
})

Tabs.Script:Button({
    Title = "Ban Hammer [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 15427288323")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Ban Hammer")
    end
})

Tabs.Script:Section({ Title = "Fe AK-47", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Ak-47 [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 14847744375 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: AK-47")
    end
})

Tabs.Script:Button({
    Title = "AK-47 [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 14847744375 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: AK-47")
    end
})

Tabs.Script:Button({
    Title = "AK-47 [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 14847744375 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: AK-47")
    end
})

Tabs.Script:Button({
    Title = "AK-47 [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 14847744375 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: AK-47")
    end
})

Tabs.Script:Section({ Title = "Fe Neptunian V", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Neptunian V [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 4506945409")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Neptunian V")
    end
})

Tabs.Script:Button({
    Title = "Neptunian V [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 4506945409")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Neptunian V")
    end
})

Tabs.Script:Button({
    Title = "Neptunian V [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 4506945409")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Neptunian V")
    end
})

Tabs.Script:Button({
    Title = "Neptunian V [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 4506945409")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Neptunian V")
    end
})

Tabs.Script:Section({ Title = "Fe Lightning Cannon [White]", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Lightning Cannon [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 111672581230926 126145101810389 136055191177936 4504231783 150381051")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Button({
    Title = "Lightning Cannon [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 111672581230926 126145101810389 136055191177936 4504231783 150381051")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Button({
    Title = "Lightning Cannon [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 111672581230926 126145101810389 136055191177936 4504231783 150381051")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Button({
    Title = "Lightning Cannon [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 111672581230926 126145101810389 136055191177936 4504231783 150381051")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Section({ Title = "Fe Lightning Cannon [Black]", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Lightning Cannon [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 135845211993815 116940095199813 117311153426168 4504231783 150381051 16630147")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Button({
    Title = "Lightning Cannon [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 135845211993815 116940095199813 117311153426168 4504231783 150381051 16630147")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Button({
    Title = "Lightning Cannon [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 135845211993815 116940095199813 117311153426168 4504231783 150381051 16630147")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Button({
    Title = "Lightning Cannon [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 135845211993815 116940095199813 117311153426168 4504231783 150381051 16630147")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Lightning Cannon")
    end
})

Tabs.Script:Section({ Title = "Fe Sin Dragon", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Sin Dragon [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 113048125789248 111793953309477 132770514241770 117186631495734 4504231783 3756389957 150381051 16755111087 17323578884")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sin Dragon")
    end
})

Tabs.Script:Button({
    Title = "Sin Dragon [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 113048125789248 111793953309477 132770514241770 117186631495734 4504231783 3756389957 150381051 16755111087 17323578884")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sin Dragon")
    end
})

Tabs.Script:Button({
    Title = "Sin Dragon [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 113048125789248 111793953309477 132770514241770 117186631495734 4504231783 3756389957 150381051 16755111087 17323578884")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sin Dragon")
    end
})

Tabs.Script:Button({
    Title = "Sin Dragon [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 113048125789248 111793953309477 132770514241770 117186631495734 4504231783 3756389957 150381051 16755111087 17323578884")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sin Dragon")
    end
})

Tabs.Script:Section({ Title = "Fe Motorcycle", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Motorcycle [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 5063566353 14556020572 14556054644 4504231783 191101707")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Motorcycle")
    end
})

Tabs.Script:Button({
    Title = "Motorcycle [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 5063566353 14556020572 14556054644 4504231783 191101707")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Motorcycle")
    end
})

Tabs.Script:Button({
    Title = "Motorcycle [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 5063566353 14556020572 14556054644 4504231783 191101707")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Motorcycle")
    end
})

Tabs.Script:Button({
    Title = "Motorcycle [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 5063566353 14556020572 14556054644 4504231783 191101707")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Motorcycle")
    end
})

Tabs.Script:Section({ Title = "Fe Sniper", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Sniper [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 4504231783 14776099541")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sniper")
    end
})

Tabs.Script:Button({
    Title = "Sniper [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 4504231783 14776099541")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sniper")
    end
})

Tabs.Script:Button({
    Title = "Sniper [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 4504231783 14776099541")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sniper")
    end
})

Tabs.Script:Button({
    Title = "Sniper [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 4504231783 14776099541")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sniper")
    end
})

Tabs.Script:Section({ Title = "Fe Goner", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Goner [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 17770317484 17772174303 17835236579 17822749561 17822722698 17771175724")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Goner")
    end
})

Tabs.Script:Button({
    Title = "Goner [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 17770317484 17772174303 17835236579 17822749561 17822722698 17771175724")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Goner")
    end
})

Tabs.Script:Button({
    Title = "Goner [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 17770317484 17772174303 17835236579 17822749561 17822722698 17771175724")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Goner")
    end
})

Tabs.Script:Button({
    Title = "Goner [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 17770317484 17772174303 17835236579 17822749561 17822722698 17771175724")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Goner")
    end
})

Tabs.Script:Section({ Title = "Fe Star Glitcher", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Star Glitcher [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 5316479641 5316539421 5699795428 5316549755")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/StarGlitcherV1.luau"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | 24 Hours FE - Script: Star Glitcher")
    end
})

Tabs.Script:Button({
    Title = "Star Glitcher [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 5316479641 5316539421 5699795428 5316549755")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/StarGlitcherV1.luau"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | 24 Hours FE - Script: Star Glitcher")
    end
})

Tabs.Script:Button({
    Title = "Star Glitcher [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 5316479641 5316539421 5699795428 5316549755")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/StarGlitcherV1.luau"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | 24 Hours FE - Script: Star Glitcher")
    end
})

Tabs.Script:Button({
    Title = "Star Glitcher [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 5316479641 5316539421 5699795428 5316549755")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/StarGlitcherV1.luau"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | 24 Hours FE - Script: Star Glitcher")
    end
})

Tabs.Script:Section({ Title = "Fe Krystal Dance", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Krystal Dance [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 85992127666950 132094735956936")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Krystal Dance")
    end
})

Tabs.Script:Button({
    Title = "Krystal Dance [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 85992127666950 132094735956936")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Krystal Dance")
    end
})

Tabs.Script:Button({
    Title = "Krystal Dance [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 85992127666950 132094735956936")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Krystal Dance")
    end
})

Tabs.Script:Button({
    Title = "Krystal Dance [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 85992127666950 132094735956936")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Krystal Dance")
    end
})

Tabs.Script:Section({ Title = "Fe Good Cop Bad Cop", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Good Cop Bad Cop [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 14561260228 8590591043 12980424553 4504231783 15752686682")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Good%20Cop%20Bad%20Cop"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Good Cop Bad Cop")
    end
})

Tabs.Script:Button({
    Title = "Good Cop Bad Cop [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 14561260228 8590591043 12980424553 4504231783 15752686682")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Good%20Cop%20Bad%20Cop"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Good Cop Bad Cop")
    end
})

Tabs.Script:Button({
    Title = "Good Cop Bad Cop [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 14561260228 8590591043 12980424553 4504231783 15752686682")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Good%20Cop%20Bad%20Cop"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Good Cop Bad Cop")
    end
})

Tabs.Script:Button({
    Title = "Good Cop Bad Cop [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 14561260228 8590591043 12980424553 4504231783 15752686682")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Good%20Cop%20Bad%20Cop"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Good Cop Bad Cop")
    end
})

Tabs.Script:Section({ Title = "Fe Gale Fighter", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Gale Fighter [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 124051269860534")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Gale Fighter")
    end
})

Tabs.Script:Button({
    Title = "Gale Fighter [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 124051269860534")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Gale Fighter")
    end
})

Tabs.Script:Button({
    Title = "Gale Fighter [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 124051269860534")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Gale Fighter")
    end
})

Tabs.Script:Button({
    Title = "Gale Fighter [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 124051269860534")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Gale%20Fighter"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Gale Fighter")
    end
})

Tabs.Script:Section({ Title = "Fe Dearsister", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Dearsister [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 12215844639 16501751591 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Dearsister"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Dearsister")
    end
})

Tabs.Script:Button({
    Title = "Dearsister [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 12215844639 16501751591 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Dearsister"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Dearsister")
    end
})

Tabs.Script:Button({
    Title = "Dearsister [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 12215844639 16501751591 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Dearsister"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Dearsister")
    end
})

Tabs.Script:Button({
    Title = "Dearsister [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 12215844639 16501751591 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Dearsister"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Dearsister")
    end
})

Tabs.Script:Section({ Title = "Fe Sadist Genocider", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Sadist Genocider [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 15227778222 15230484218 14992239496 122652875220864 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sadist Genocider")
    end
})

Tabs.Script:Button({
    Title = "Sadist Genocider [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 15227778222 15230484218 14992239496 122652875220864 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sadist Genocider")
    end
})

Tabs.Script:Button({
    Title = "Sadist Genocider [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 15227778222 15230484218 14992239496 122652875220864 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sadist Genocider")
    end
})

Tabs.Script:Button({
    Title = "Sadist Genocider [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 15227778222 15230484218 14992239496 122652875220864 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Sadist Genocider")
    end
})

Tabs.Script:Section({ Title = "Fe Minigun", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Minigun [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 6775268462 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Minigun"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Minigun")
    end
})

Tabs.Script:Button({
    Title = "Minigun [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 6775268462 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Minigun"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Minigun")
    end
})

Tabs.Script:Button({
    Title = "Minigun [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 6775268462 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Minigun"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Minigun")
    end
})

Tabs.Script:Button({
    Title = "Minigun [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 6775268462 4504231783")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Minigun"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Minigun")
    end
})

Tabs.Script:Section({ Title = "Fe Puppet Master", Icon = "sparkle" })

Tabs.Script:Button({
    Title = "Puppet Master [Noob Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 72292903231768 84451219120140 95290698984301 108186273151388 139904067056008 119927239686827 7250579896 18592706466 13724337704 16348789712 191101707 14992239496")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Puppet%20Master"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Puppet Master")
    end
})

Tabs.Script:Button({
    Title = "Puppet Master [Default Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 140395948277978 82942681251131 90960046381276 102599402682100 7250579896 18592706466 13724337704 16348789712 191101707 14992239496")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Puppet%20Master"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Puppet Master")
    end
})

Tabs.Script:Button({
    Title = "Puppet Master [Black Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 106249329428811 129462518582032 131385506535381 85392395166623 138364679836274 12740758463 7250579896 18592706466 13724337704 16348789712 191101707 14992239496")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Puppet%20Master"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Puppet Master")
    end
})

Tabs.Script:Button({
    Title = "Puppet Master [White Rig]",
    Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Running Script...")
        wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 128948172708607 140395948277978 82942681251131 90960046381276 102599402682100 7250579896 18592706466 13724337704 16348789712 191101707 14992239496")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
        wait(3)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
        wait(3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Puppet%20Master"))()
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Script Ran | Genesis FE - Script: Puppet Master")
    end
})

Tabs.Misc:Section({ Title = "Misc", Icon = "sparkle" })

Tabs.Misc:Button({
    Title = "Credit",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("Script Credit: C00l_Ch4os | Genesis FE & 24 Hours FE Script - Hat - Rig | Just a baseplate")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Permdeath",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-pd")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Clear Hat",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-ch")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Save Hat",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-sh")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Net",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-net")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Respawn",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-rs")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Re",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-re")
        end)
    end
})

Tabs.Misc:Button({
    Title = "Rejoin",
    Callback = function()
        task.defer(function()
            local TextChatService = game:GetService("TextChatService")
            local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")
            channel:SendAsync("-rj")
        end)
    end
})

Tabs.Misc:Section({ Title = "Keyboard", Icon = "sparkle" })

Tabs.Misc:Button({
    Title = "Delta Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/its-starflow/Scripts/main/Keyboards/Delta.luau"))()
    end
})

Window:OnClose(function()
    print("Cha Co Gi Hub")

end)
