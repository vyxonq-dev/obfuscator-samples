--[[
 █████   █████          ████                       ███             █████   █████            █████    
▒▒███   ▒▒███          ▒▒███                      ▒▒▒             ▒▒███   ▒▒███            ▒▒███     
 ▒███    ▒███   ██████  ▒███   ██████   ████████  ████   █████     ▒███    ▒███  █████ ████ ▒███████ 
 ▒███    ▒███  ███▒▒███ ▒███  ▒▒▒▒▒███ ▒▒███▒▒███▒▒███  ███▒▒      ▒███████████ ▒▒███ ▒███  ▒███▒▒███
 ▒▒███   ███  ▒███ ▒███ ▒███   ███████  ▒███ ▒▒▒  ▒███ ▒▒█████     ▒███▒▒▒▒▒███  ▒███ ▒███  ▒███ ▒███
  ▒▒▒█████▒   ▒███ ▒███ ▒███  ███▒▒███  ▒███      ▒███  ▒▒▒▒███    ▒███    ▒███  ▒███ ▒███  ▒███ ▒███
    ▒▒███     ▒▒██████  █████▒▒████████ █████     █████ ██████     █████   █████ ▒▒████████ ████████ 
     ▒▒▒       ▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒ ▒▒▒▒▒▒     ▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒  
                                                                                                     

Made by 			░▒▓████████▓▒░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
				      ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
				      ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ 
				      ░▒▓██████▓▒░ ░▒▓█▓▒░    ░▒▓██████▓▒░  
				      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
				      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░     
				      ░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░     
                                      
Credits to Nebula Softworks © for the UI Library.

loadstring(game:HttpGet("https://raw.githubusercontent.com/flyrbo/Volaris/refs/heads/main/Loader.lua"))()


                      !!WARNING!!
This script is created for educational and testing purposes only.
I do not encourage or promote exploiting in any Roblox game.

By using this script, you acknowledge that:
- You are responsible for your own actions.
- Using exploits may violate Roblox's Terms of Service.
- Your account may be permanently banned or restricted.

I am not responsible for any consequences resulting from its use.

If you do not agree with these terms, do not use this script.
--]]


--/ SUPPORTED FUNCTIONS CHECK
local function checkExecutor()
    local missing = {}

    local function check(name, func)
        if typeof(func) ~= "function" then
            table.insert(missing, name)
        end
    end

    check("loadstring", loadstring)
    check("HttpGet", game.HttpGet)
    check("getgenv", getgenv)
    check("firetouchinterest", firetouchinterest)
    check("fireproximityprompt", fireproximityprompt)

    if #missing > 0 then
        warn("Executor missing required functions:")

        for _, v in ipairs(missing) do
            warn("- " .. v)
        end

        return false
    end

    return true
end

--/ LOADER USED CHECK
if not checkExecutor() then
	--// My sloppy attempt at making a notification
	local notification = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIStroke = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")
	local Frame_2 = Instance.new("Frame")
	local TextLabel_2 = Instance.new("TextLabel")

	notification.Name = "notification"
	notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = notification
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 0.050
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.759053946, 0, 0.827715337, 0)
	Frame.Size = UDim2.new(0.218033999, 0, 0.124843948, 0)
	Frame.ZIndex = 90

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Frame

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 9, 9)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 3, 3))}
	UIGradient.Rotation = 40
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.32, 0.17), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = Frame

	UIStroke.Color = Color3.fromRGB(179, 58, 58)
	UIStroke.Parent = Frame

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.107011072, 0, 0, 0)
	TextLabel.Size = UDim2.new(0.78597784, 0, 0.409999996, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = "Unsupported Executor!"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true

	Frame_2.Parent = Frame
	Frame_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0.0516605154, 0, 0.389999986, 0)
	Frame_2.Size = UDim2.new(0.89298892, 0, 0.0199999996, 0)

	TextLabel_2.Parent = Frame
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0.033610303, 0, 0.474999994, 0)
	TextLabel_2.Size = UDim2.new(0.92798847, 0, 0.460000038, 0)
	TextLabel_2.Font = Enum.Font.SourceSans
	TextLabel_2.Text = "This script will lose key functionality using this executor. Please report the name of the executor on the GitHub page."
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextScaled = true
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextWrapped = true

	local function OROD_fake_script() -- Frame.LocalScript 
		local script = Instance.new('LocalScript', Frame)

		local TweenService = game:GetService("TweenService")
	
		local frame = script.Parent
	
		local originalPosition = frame.Position
		local originalTransparency = frame.BackgroundTransparency
	
		frame.Position = originalPosition + UDim2.new(0, 0, 0, 50)
		for _, i in ipairs(frame:GetDescendants()) do
			if i:IsA("TextLabel") then
				i.TextTransparency = 1
			elseif i:IsA("Frame") then
				i.BackgroundTransparency = 1
			elseif i:IsA("UIStroke") then
				i.Transparency = 1
			end
		end
		frame.BackgroundTransparency = 1
	
	
		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
	
		local goalIn = {
			Position = originalPosition,
			BackgroundTransparency = 0.05
		}
	
		local tweenIn = TweenService:Create(frame, tweenInfo, goalIn)
	
		tweenIn:Play()
	
		for _, v in pairs(frame:GetDescendants()) do
			if v:IsA("TextLabel") then
				TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
			elseif v:IsA("Frame") then
				TweenService:Create(v, tweenInfo, {BackgroundTransparency = 0}):Play()
			elseif v:IsA("UIStroke") then
				TweenService:Create(v, tweenInfo, {Transparency = 0}):Play()
			end
		
		end
	
		task.wait(10)
	
		local goalOut = {
			Position = originalPosition + UDim2.new(0, 0, 0, 50),
			BackgroundTransparency = 1
		}
	
		local tweenOut = TweenService:Create(frame, tweenInfo, goalOut)
	
		tweenOut:Play()
	
		for _, v in pairs(frame:GetDescendants()) do
			if v:IsA("TextLabel") then
				TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
			elseif v:IsA("Frame") then
				TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
			elseif v:IsA("UIStroke") then
				TweenService:Create(v, tweenInfo, {Transparency = 1}):Play()
			end
		end
	end
	coroutine.wrap(OROD_fake_script)()

    return
end

--/ UI Library import
local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()
local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

getgenv().funcCheck = true

if tostring(game.PlaceId) == "130818457717791" or tostring(game.PlaceId) == "80953732024525" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/flyrbo/Volaris/refs/heads/main/STI/script.lua"))() -- Survive The Island
else
    local Loaded = Starlight:Notification({
    	Title = "UNSUPPORTED GAME!",
    	Icon = NebulaIcons:GetIcon('shield-x', 'Lucide'),
    	Content = "Volaris could not find an appropriate script for this game!",
	}, "INVALID_PLACEID")
end
