--by SadExility, Full Open source (chat gpt helps lol)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if LocalPlayer.PlayerGui:FindFirstChild("LMG2L") then
return
end

local Buttons = {}

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LMG2L"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0,170,0,220)
Frame.Position = UDim2.new(0,382,0,64)
Frame.BackgroundColor3 = Color3.fromRGB(38,38,38)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,15)

local frameStroke = Instance.new("UIStroke", Frame)
frameStroke.Thickness = 1.8
frameStroke.Color = Color3.fromRGB(255,255,255)

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,24)
Title.Position = UDim2.new(0,0,0,-26)
Title.BackgroundTransparency = 1
Title.Text = "RoClothes avatar loader"
Title.TextSize = 13
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")

Instance.new("UIDragDetector", Frame)

-- Scroll
local Scroll = Instance.new("ScrollingFrame", Frame)
Scroll.Size = UDim2.new(1,0,1,-44)
Scroll.Position = UDim2.new(0,0,0,6)
Scroll.CanvasSize = UDim2.new(0,0,0,0)
Scroll.ScrollBarThickness = 4
Scroll.BorderSizePixel = 0
Scroll.BackgroundTransparency = 1

-- Layout do Scroll
local layout = Instance.new("UIListLayout", Scroll)
layout.Padding = UDim.new(0,6)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder -- importante: respeitar ordem de inserção

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
Scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 6)
end)

-- Modifica a função makeButton pra setar LayoutOrder
local layoutIndex = 0 -- contador global pra manter ordem
local function makeButton(name, url, color)
layoutIndex = layoutIndex + 1
local btn = Instance.new("TextButton", Scroll)
btn.Size = UDim2.new(0,152,0,18)
btn.BackgroundColor3 = color or Color3.fromRGB(129,0,0)
btn.BorderSizePixel = 0
btn.AutoButtonColor = false
btn.Text = name
btn.Name = name:lower()
btn.TextSize = 13
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")
btn.LayoutOrder = layoutIndex -- mantém a ordem correta

Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)  

local stroke = Instance.new("UIStroke", btn)  
stroke.Thickness = 2  
stroke.Color = Color3.fromRGB(255,255,255)  
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border  
stroke.LineJoinMode = Enum.LineJoinMode.Round  

btn.MouseButton1Click:Connect(function()  
	ScreenGui:Destroy()  
	loadstring(game:HttpGet(url))()  
end)  

table.insert(Buttons, btn)

end

-- Cores
local girlColor = Color3.fromRGB(129,0,0)
local femboyColor = Color3.fromRGB(20,40,120)
local cosplayColor = Color3.fromRGB(120,0,200)

-- Tabelas por categoria
local girls = {
{"RoClothes Police Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesPolice.txt"},
{"RoClothes Maid Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesMaid.txt"},
{"RoClothes Dark Demon Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesBlackDemon.txt"},
{"Kitty Outfit Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesKittyOutfit.txt"},
{"Meow Outfit Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesMeowOutfit.txt"},
{"Sexy Guest Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesSexyGuest.txt"},
{"Monster Energy Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesMonsterGirl.txt"},
{"Pink Monster Energy Girl","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothesPinkMonster.txt"}
}

local femboys = {
{"Cute Kitty Emo Femboy","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothes-CuteKittyEmo%20Femboy.txt"},
{"Cute Black Emo Femboy","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothes_Cute%20Black%20Emo%20Femboy.txt"},
{"Cute White Femboy","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/RoClothes%3DCute%20White%20Femboy.txt"}
}

local cosplays = {
{"Brazilian Miku Cosplay","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Brazilian%20Vocaloid.txt"},
{"Chara Cosplay (UNDERTALE)","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Chara%20UNDERTALE.txt"},
{"Nezuko Cosplay (DEMON SLAYER)","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/DemonSlayerNezu.txt"},
{"Frisk Cosplay (UNDERTALE)","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Frisk%20UNDERTALE.txt"},
{"Hatsune Miku Cosplay","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Hatsune%20Girl.txt"},
{"Mimukauwa Miku","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Mimukauwa%20Girl.txt"},
{"Mitsuri Cosplay (DEMON SLAYER)","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Mitsuri%20Cosplay%20DEMON%20SLAYER.txt"},
{"Pomni Cosplay","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Pomni%20Outfit.txt"},
{"Sky Cosplay (FNF)","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Sky%20Cosplay%20FNF.txt"},
{"Susie Cosplay (UNDERTALE)","https://raw.githubusercontent.com/SadExility/SadR63Mods/refs/heads/main/Susie%20UNDERTALE.txt"}
}

-- Função pra criar os botões a partir de uma tabela
local function createButtons(list, color)
for _, data in ipairs(list) do
local name, url = data[1], data[2]
makeButton(name, url, color)
end
end

-- Cria os botões na ordem certa
createButtons(girls, girlColor)
createButtons(femboys, femboyColor)
createButtons(cosplays, cosplayColor)

-- 🔍 Search Box
local SearchBox = Instance.new("TextBox", Frame)
SearchBox.Size = UDim2.new(0,152,0,20)
SearchBox.Position = UDim2.new(0.5,-76,1,-26)
SearchBox.BackgroundColor3 = Color3.fromRGB(38,38,38)
SearchBox.BorderSizePixel = 0
SearchBox.PlaceholderText = "Search outfit..."
SearchBox.Text = ""
SearchBox.TextSize = 12
SearchBox.TextColor3 = Color3.fromRGB(255,255,255)
SearchBox.PlaceholderColor3 = Color3.fromRGB(170,170,170)
SearchBox.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")
SearchBox.ClearTextOnFocus = false

Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0,4)

local sbStroke = Instance.new("UIStroke", SearchBox)
sbStroke.Thickness = 1.5
sbStroke.Color = Color3.fromRGB(255,255,255)
sbStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
local text = SearchBox.Text:lower()
for _, btn in ipairs(Buttons) do
btn.Visible = (text == "" or btn.Name:find(text, 1, true))
end
end)

-- 🔔 Aviso
task.spawn(function()
task.wait(0.2)
pcall(function()
if setclipboard then
setclipboard("@SadExility")
end
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Loader By SadExility",
Text = "Youtube Copied To Clipboard",
Duration = 5
})
end)
end)
