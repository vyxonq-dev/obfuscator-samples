print("tá funcionando Github não tá fora do ar") 




--[[



























pq tá vendo minha source hein? 🤨

















]]










--[[ Roblox Loading Screen for Nytherune Title: "DOXXING IS ILLEGAL" 

local ScreenGui = Instance.new("ScreenGui") ScreenGui.IgnoreGuiInset = true ScreenGui.ResetOnSpawn = false ScreenGui.Name = "NytheruneLoadingScreen" ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame") Frame.Size = UDim2.new(1, 0, 1, 0) Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel") Title.Size = UDim2.new(1, 0, 0.15, 0) Title.Position = UDim2.new(0, 0, 0.05, 0) Title.BackgroundTransparency = 1 Title.Text = "DOXXING IS ILLEGAL" Title.TextColor3 = Color3.fromRGB(255, 70, 70) Title.TextScaled = true Title.Font = Enum.Font.GothamBold Title.Parent = Frame

local Message = Instance.new("TextLabel") Message.Size = UDim2.new(0.9, 0, 0.55, 0) Message.Position = UDim2.new(0.05, 0, 0.25, 0) Message.BackgroundTransparency = 1 Message.TextWrapped = true Message.TextScaled = true Message.Font = Enum.Font.Gotham Message.TextColor3 = Color3.fromRGB(255, 255, 255) Message.Text = "The owner of Nytherune Hub was doxxed and falsely accused of things he did not commit. He has chosen to step away from the project.\n\nThe script will continue to function normally, but won't receive updates.\n\nHe promises to resolve everything and asks that you RECORD VIDEOS demanding JUSTICE FOR NYTHERUNE.\n\nGod bless you." Message.Parent = Frame

local LoadingLabel = Instance.new("TextLabel") LoadingLabel.Size = UDim2.new(1, 0, 0.1, 0) LoadingLabel.Position = UDim2.new(0, 0, 0.85, 0) LoadingLabel.BackgroundTransparency = 1 LoadingLabel.TextColor3 = Color3.fromRGB(200, 200, 200) LoadingLabel.Font = Enum.Font.GothamSemibold LoadingLabel.TextScaled = true LoadingLabel.Text = " NYTHERUNE WILL CONTINUE FUNCTIONING WITHOUT AN ADMIN PANEL, BUT IT WILL RETURN ONE DAY..." LoadingLabel.Parent = Frame

-- Sound
local Sound = Instance.new("Sound") Sound.SoundId = "rbxassetid://6665010343" Sound.Volume = 1 Sound.Looped = false Sound.Parent = Frame Sound:Play()

-- Destroy screen after 20 seconds
delay(20, function() if ScreenGui then ScreenGui:Destroy() end end)

-- Simple loading animation
delay(20, function() if ScreenGui then ScreenGui:Destroy() end end)

spawn(function() local dots = 0 while true do LoadingLabel.Text = "NYTHERUNE WILL KEEP WORKING WITHOUT ADMIN." .. string.rep(".", dots) dots = (dots + 1) % 4 wait(0.5) end end)


]]




-- Executa as duas funções/processos simultaneamente
task.spawn(function()
	print("t")
end)

task.spawn(function()
	print("t")
end)
local MarketplaceService = game:GetService("MarketplaceService")




-- eu gosto da lolyta
-- kk la ele boy

local noites99 = 7326934954

-- sigma
local CoquetteHub_muito_bom = 4924922222

-- Checa se é o place do Brookhaven
if game.PlaceId == CoquetteHub_muito_bom then
    
loadstring(game:HttpGet("https://raw.githubusercontent.com/wx-sources/Nytherune/refs/heads/main/Nytherune%2016%20de%20Novembro%20ofuscado.txt"))()
-- brookhaven - Script

    
-- painel admin
loadstring(game:HttpGet("https://scriptsbinsauth.vercel.app/api/scripts/2770b86e-42b6-455d-8b8f-bc18acc9c515/raw"))()

else   
    if game.GameId == noites99 then
        print("tá Lgl - Nytherune Hub by WxDeveloper.")
loadstring(game:HttpGet("https://scriptsbinsauth.vercel.app/api/scripts/580a9d9f-0857-480d-9e3b-a1377c586cab/raw"))()
        else
        game.Players.LocalPlayer:Kick("This game is not supported.")
    end
end
