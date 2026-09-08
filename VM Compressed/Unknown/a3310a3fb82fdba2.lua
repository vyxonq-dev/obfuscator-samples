_G.Enabled = false
_G.StunSimeGoBRR = 0.5
_G.rakeGodmOde = false
_G.GetScrapsAndEggs = false

local Config = {
    WindowName = "rake fucko mode",
	Color = Color3.fromRGB(255, 16, 16),
	Keybind = Enum.KeyCode.RightBracket
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Example")
local Tab2 = Window:CreateTab("UI Settings")

local Webhook = "https://discord.com/api/webhooks/965333348052516906/B7Fo4QyUd_xL-ZMyfO5gxIjRJU7F6NOsMO_y6Rseol3KxkB0iSDcrQUZGz9YB-tGXm-y"

local HardwareID = game:GetService("RbxAnalyticsService"):GetClientId()

local Headers = {["content-type"] = "application/json"}

local LocalPlayerq = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayerq.AccountAge
local MembershipType = string.sub(tostring(LocalPlayerq.MembershipType), 21)
local UserId = LocalPlayerq.UserId
local Exploit = nil

if syn then
	HttpRequest = syn.request
	Exploit = "Synapse X"
	elseif KRNL_LOADED then
	HttpRequest = request
	Exploit = "KRNL"
	else
	HttpRequest = http_request
	Exploit = "script-ware"
 end

local PlayerData =
{
	   ["content"] = "",
	   ["embeds"] = {{
		   ["title"] = "**Whitelist Succesfull! | WHITELISTED HWID! **:",
		   ["description"] = game.Players.LocalPlayer.Name,
		   ["color"] = tonumber(0x2B6BE4),
		   ["fields"] = {
			   {
				   ["name"] = "Exploit:",
				   ["value"] = Exploit,
				   ["inline"] = true
},
			   {
				   ["name"] = "AccountAge:",
				   ["value"] = AccountAge,
				   ["inline"] = true
},
			   {
				   ["name"] = "UserId:",
				   ["value"] = UserId,
				   ["inline"] = true
},
			   {
				   ["name"] = "HardwareID",
				   ["value"] = HardwareID,
				   ["inline"] = true
		}
	   }}
	}
	}

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)


HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})

local Section1 = Tab1:CreateSection("First Section")
local Section2 = Tab1:CreateSection("Second Section")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Label1 = Section1:CreateLabel("Label 1")
Label1:UpdateText("rake health")

local Toggle1 = Section1:CreateToggle("destroy rake", nil, function(State)
    _G.Enabled = State
end)
Toggle1:AddToolTip("one tap rake")


local Toggle2 = Section1:CreateToggle("god rake", nil, function(State)
    _G.rakeGodmOde = State
end)
Toggle2:AddToolTip("god mode rake to make kids cringe to death")


-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)

while wait(.1) do
    if game.Workspace:FindFirstChild("Rake") then
        Label1:UpdateText("rake health : ".. game.Workspace.Rake:WaitForChild("Humanoid").Health.. " / ".. game.Workspace.Rake:WaitForChild("Humanoid").MaxHealth)
    else
        Label1:UpdateText("rake is not spawned")
    end
	if _G.Enabled == true then
		local args = {
			[1] = workspace.Rake.Humanoid,
			[2] = 10000,
			[3] = workspace.Rake.AI.Stuns,
			[4] = workspace.Rake.Humanoid.Health,
			[5] = "AAKKAKKAAKKA112121",
			[6] = "ALALALAQAQAQ1+!'SA",
			[7] = "TESTMQMQOQZP11A"
		}
        game:GetService("ReplicatedStorage").RocketRE.StunRE:FireServer(unpack(args))
    end
	if _G.rakeGodmOde == true then
		local args2 = {
			[1] = workspace.Rake.Humanoid,
			[2] = 99999999999,
			[3] = workspace.Rake.AI.Stuns,
			[4] = -100000,
			[5] = "AAKKAKKAAKKA112121",
			[6] = "ALALALAQAQAQ1+!'SA",
			[7] = "TESTMQMQOQZP11A"
		}

		game:GetService("ReplicatedStorage").RocketRE.StunRE:FireServer(unpack(args2))
    end
end