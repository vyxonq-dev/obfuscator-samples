-- CreaciÃ³n del ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GetKeyLabel = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local CheckKeyBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- ConfiguraciÃ³n del ScreenGui
ScreenGui.Name = "KeySystem"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false  -- Evita que se reinicie al respawn

-- ConfiguraciÃ³n del Frame principal
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  -- Color oscuro como el de la derecha
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true  -- Permite mover el Frame

-- ConfiguraciÃ³n del tÃ­tulo
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansSemibold
Title.Text = "ShifeScripts - Key System"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)  -- Color claro como el de la derecha
Title.TextSize = 20
Title.TextStrokeTransparency = 0.9

-- ConfiguraciÃ³n del texto "Get Key For ShifeScripts"
GetKeyLabel.Name = "GetKeyLabel"
GetKeyLabel.Parent = MainFrame
GetKeyLabel.BackgroundTransparency = 1
GetKeyLabel.Position = UDim2.new(0.5, -100, 0.2, 0)
GetKeyLabel.Size = UDim2.new(0, 200, 0, 25)
GetKeyLabel.Font = Enum.Font.SourceSans
GetKeyLabel.Text = "Get Key For ShifeScripts"
GetKeyLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
GetKeyLabel.TextSize = 16

-- ConfiguraciÃ³n de la caja de texto para ingresar la llave
KeyBox.Name = "KeyBox"
KeyBox.Parent = MainFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Color oscuro de fondo
KeyBox.Position = UDim2.new(0.5, -125, 0.4, 0)
KeyBox.Size = UDim2.new(0, 250, 0, 30)
KeyBox.Font = Enum.Font.SourceSans
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
KeyBox.TextSize = 18
KeyBox.TextXAlignment = Enum.TextXAlignment.Center

-- ConfiguraciÃ³n del botÃ³n "Check Key"
CheckKeyBtn.Name = "CheckKeyBtn"
CheckKeyBtn.Parent = MainFrame
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Color oscuro del botÃ³n
CheckKeyBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
CheckKeyBtn.Size = UDim2.new(0, 120, 0, 30)
CheckKeyBtn.Font = Enum.Font.SourceSansBold
CheckKeyBtn.Text = "Check Key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
CheckKeyBtn.TextSize = 18

-- ConfiguraciÃ³n del botÃ³n "Get Key"
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Color oscuro del botÃ³n
GetKeyBtn.Position = UDim2.new(0.55, 0, 0.7, 0)
GetKeyBtn.Size = UDim2.new(0, 120, 0, 30)
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
GetKeyBtn.TextSize = 18

-- BotÃ³n de cierre (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundTransparency = 1  -- Transparente como el de la derecha
CloseButton.Position = UDim2.new(0.92, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
CloseButton.TextSize = 16

-- FunciÃ³n para cerrar la GUI
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- FunciÃ³n del botÃ³n "Check Key"
CheckKeyBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    if enteredKey == "UCrvd63k" then
        print("Key Correct")
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "BlueRed Hub | Universal V18", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--Tabs

local Tab1 = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://10723415903",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Muder Mystery",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Natural Disaster",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab4 = Window:MakeTab({
	Name = "Legends Of Speed",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab5 = Window:MakeTab({
	Name = "Blade Ball",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab6 = Window:MakeTab({
	Name = "Da Hood",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab7 = Window:MakeTab({
	Name = "Pet Simulator 99",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab8 = Window:MakeTab({
	Name = "Jailbreak",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab9 = Window:MakeTab({
	Name = "Arsenal",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab10 = Window:MakeTab({
	Name = "Doors",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

local Tab11 = Window:MakeTab({
	Name = "Brookhaven",
	Icon = "rbxassetid://10734934585",
	PremiumOnly = false
})

--Sections

local Section = Tab1:AddSection({
	Name = "Created By Shife"
})

local Section = Tab1:AddSection({
	Name = "@ShifeScripter In Youtube!"
})

local Section = Tab1:AddSection({
	Name = "V18 Uploaded 2 December, 2024"
})

local Section = Tab2:AddSection({
	Name = "Muder Mystery Scripts"
})

local Section = Tab3:AddSection({
	Name = "Natural Disaster Scripts"
})

local Section = Tab4:AddSection({
	Name = "Legends Of Speed Scripts"
})

local Section = Tab5:AddSection({
	Name = "Blade Ball Scripts"
})

local Section = Tab6:AddSection({
	Name = "Da Hood Scripts"
})

local Section = Tab7:AddSection({
	Name = "Pet Simulator Scripts"
})

local Section = Tab8:AddSection({
	Name = "Jailbreak Scripts"
})

local Section = Tab9:AddSection({
	Name = "Arsenal Scripts"
})

local Section = Tab10:AddSection({
	Name = "Doors Scripts"
})

local Section = Tab11:AddSection({
	Name = "Brookhaven Scripts"
})

--Buttons Tab 1 main

Tab1:AddButton({
	Name = "Copy Telegram Channel",
	Callback = function()
	setclipboard("https://t.me/ShifeScripter")
      		print("Copy Discord Server")
  	end    
})

--Buttons Tab 2 mm2

Tab2:AddButton({
	Name = "Muder Mystery Script 1",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0Murder'))()
      		print("MM2 Script 1")
  	end    
})

Tab2:AddButton({
	Name = "Muder Mystery Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/xqzqxUYq"))()
      		print("MM2 Script 2")
  	end    
})

Tab2:AddButton({
	Name = "Muder Mystery Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gregory909/FolderGui-FolderHub/main/loader.lua", true))()
      		print("MM2 Script 3")
  	end    
})

Tab2:AddButton({
	Name = "Muder Mystery Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
      		print("MM2 Script 4")
  	end    
})

Tab2:AddButton({
	Name = "Muder Mystery Script 5",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Dekos-lgbty/imp/main/mm2"))()
      		print("MM2 Script 5")
  	end    
})

Tab2:AddButton({
	Name = "Muder Mystery Script 6",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Dekos-lgbty/r3th/main/script'))()
      		print("MM2 Script 6")
  	end    
})

--Buttons Tab 3 Natural

Tab3:AddButton({
	Name = "Natural Disaster Script 1",
	Callback = function()
	loadstring(game:HttpGet"https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE")()
      		print("Script 1")
  	end    
})

Tab3:AddButton({
	Name = "Natural Disaster Script 2",
	Callback = function()
	loadstring(game:HttpGet('https://weinzspace.com/cata/hub.lua'))()
      		print("Script 2")
  	end    
})

Tab3:AddButton({
	Name = "Natural Disaster Script 3",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/StupidProAArsenal/UniqueHub/main/UniqueHubv2Intro', true))()
      		print("Script 3")
  	end    
})

Tab3:AddButton({
	Name = "Natural Disaster Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/stuffman0001/CanHub/main/Code"))()
      		print("Script 4")
  	end    
})

--Buttons Tab4 Legends Speed

Tab4:AddButton({
	Name = "Legends Of Speed Script 1",
	Callback = function()
	game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(petname))
      		print("Script 1")
  	end    
})

Tab4:AddButton({
	Name = "Legends Of Speed Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
      		print("Script 2")
  	end    
})

Tab4:AddButton({
	Name = "Legends Of Speed Script 3 (ByShife)",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/xa2vDTCc"))()
      		print("Script 3")
  	end    
})

Tab4:AddButton({
	Name = "Legends Of Speed Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
      		print("Script 4")
  	end    
})

Tab4:AddButton({
	Name = "Legends Of Speed Script 5 (PC Only)",
	Callback = function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"),true))()
      		print("Script 4")
  	end    
})

Tab4:AddButton({
	Name = "Legends Of Speed Script 6",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/PhoenixxxTS/Scripts/main/LegendsOfSpeed'))()
      		print("Script 4")
  	end    
})

Tab4:AddButton({
	Name = "Legends Of Speed Script 7",
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Legends-Of-Speed-Speeeeed-Farm-Open-Source-old-code-lel-1785"))()
      		print("Script 7")
  	end    
})

--Buttons Blade Ball

Tab5:AddButton({
	Name = "Blade Ball Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/refs/heads/main/PitbullHubX.lua", true))()
      		print("Script 1")
  	end    
})

Tab5:AddButton({
	Name = "Blade Ball Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/dBGjm0Lv"))()
      		print("Script 2")
  	end    
})

Tab5:AddButton({
	Name = "Blade Ball Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/FL71vYPT"))()
      		print("Script 3")
  	end    
})

Tab5:AddButton({
	Name = "Blade Ball Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/E07Wyg7L"))()
      		print("Script 4")
  	end    
})

Tab5:AddButton({
	Name = "Blade Ball Script 5",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/5iREx/script/main/Blade%20Ball'))()
      		print("Script 5")
  	end    
})

Tab5:AddButton({
	Name = "Blade Ball Script 6",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ZzzScript/SpectacularHubScript/main/BladeBall"))()
      		print("Script 6")
  	end    
})

Tab5:AddButton({
	Name = "Blade Ball Script 7",
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Blade-ball-Lunax-UPDATED-FIX-19222"))("t.me/safescripts")
      		print("Script 7")
  	end    
})

--buttons hold

Tab6:AddButton({
	Name = "Da Hood Script 1",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/SpaceYes/Lua/Main/DaHood.Lua'))()
      		print("Script 1")
  	end    
})

Tab6:AddButton({
	Name = "Da Hood Script 2",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/patrickhackplus/oxhub/main/kidsinmybasement'))()
      		print("Script 1")
  	end    
})

--buttons extra scripts

Tab7:AddButton({
	Name = "PS99 Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()
      		print("Script 1")
  	end    
})

Tab7:AddButton({
	Name = "PS99 Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/HydroStreamzOfficial/OfficialHub-/main/HydroStreamz"))()
      		print("Script 1")
  	end    
})

Tab7:AddButton({
	Name = "Fly Gui V3",
	Callback = function()
	loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
      		print("Script 1")
  	end    
})

--Jailbreak Scripts

Tab8:AddButton({
	Name = "Jailbreak Script 1",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/paid2'))()
      		print("Script 1")
  	end    
})

Tab8:AddButton({
	Name = "Jailbreak Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeyScripts/main/JailMonkey.lua"))()
      		print("Script 2")
  	end    
})

Tab8:AddButton({
	Name = "Jailbreak Script 3",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular'))(ScriptRobloxMK)
      		print("Script 2")
  	end    
})


--Arsenal Scripts

Tab9:AddButton({
	Name = "Arsenal Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
      		print("Script 1")
  	end    
})

Tab9:AddButton({
	Name = "Arsenal Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
      		print("Script 2")
  	end    
})


Tab9:AddButton({
	Name = "Arsenal Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
      		print("Script 3")
  	end    
})

Tab9:AddButton({
	Name = "Arsenal Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Arsenal%20Scripts/Hubs-Extras/Melee%20Hub%20V1.lua",true))()
      		print("Script 4")
  	end    
})

Tab9:AddButton({
	Name = "Arsenal Script 5",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/G6Ubkkuv"))()
      		print("Script 5")
  	end    
})

Tab9:AddButton({
	Name = "Arsenal Script 6",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/ArsenalTbaoHubNew"))()
      		print("Script 6")
  	end    
})

--Doors Scripts

Tab10:AddButton({
	Name = "Doors Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://pst.innomi.net/paste/dw8uteaxwdb4ga9kyuf9hcga/raw"))()
      		print("Script 1")
  	end    
})

Tab10:AddButton({
	Name = "Doors Script 2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))()
      		print("Script 2")
  	end    
})

Tab10:AddButton({
	Name = "Doors Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/endless-doors/main/endless%20madness%20buster", true))()
      		print("Script 3")
  	end    
})

Tab10:AddButton({
	Name = "Doors Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))()
      		print("Script 4")
  	end    
})

--Brookhaven Scripts

Tab11:AddButton({
	Name = "Brookhaven Script 1",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/JulHubz/JulHub/main/JulHub"))()
      		print("Script 1")
  	end    
})

Tab11:AddButton({
	Name = "Brookhaven Script 2",
	Callback = function()
	loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Script-Brookhaven-15483'))()
      		print("Script 2")
  	end    
})

Tab11:AddButton({
	Name = "Brookhaven Script 3",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/main/AntaresHubWorking.lua"))()
      		print("Script 3")
  	end    
})

Tab11:AddButton({
	Name = "Brookhaven Script 4",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader"))()
      		print("Script 4")
  	end    
})

Tab11:AddButton({
	Name = "Brookhaven Script 5",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/kigredns/SanderXV4.2.2/refs/heads/main/New.lua'))()
      		print("Script 5")
  	end    
})

Tab11:AddButton({
	Name = "Brookhaven Script 6",
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Brookhave-lraq-20207"))()
  	end    
})

Tab11:AddButton({
	Name = "Brookhaven Script 7",
	Callback = function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/sXPiterXs1111/SanderXV2.5/main/SanderXV2.5.lua')))()
  	end    
})
        ScreenGui:Destroy()  -- Elimina la GUI despuÃ©s de ejecutar el script
    else
        KeyBox.Text = "Incorrect Key!"
        wait(2)  -- Esperar 2 segundos para que el usuario vea el mensaje
        KeyBox.Text = ""  -- Limpiar el texto
    end
end)

-- FunciÃ³n del botÃ³n "Get Key" para copiar el enlace
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://rekonise.com/get-key-mz2tn")
    print("Link copied to clipboard!")

    -- Mostrar el mensaje en la caja de texto
    KeyBox.Text = "Copied! Paste in your Browser."
    
    -- Esperar 5 segundos antes de limpiar el texto
    wait(5)
    KeyBox.Text = ""  -- Limpia el texto de la caja
end)
