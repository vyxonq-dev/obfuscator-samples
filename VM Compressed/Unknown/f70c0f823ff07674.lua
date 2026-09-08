-- Project Shiba Executor - Versão Final (Sem Baseplate)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local ScrollingScripts = Instance.new("ScrollingFrame")
local EditorFrame = Instance.new("ScrollingFrame")
local EditorInput = Instance.new("TextBox")
local ExeBtn = Instance.new("TextButton")
local ClearBtn = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")

-- Segurança Oculta
local HIDDEN_KEY = "11/7/2011"
local PRIVATE_SCRIPT = 'loadstring(game:HttpGet("https://pastefy.app/Ih9xevvS/raw",true))()'

-- Setup GUI
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "ProjectShiba_vFinal"

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -180)
MainFrame.Size = UDim2.new(0, 600, 0, 360)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)

-- Barra Superior
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
Instance.new("UICorner", TopBar)

Icon.Parent = TopBar
Icon.Size = UDim2.new(0, 25, 0, 25)
Icon.Position = UDim2.new(0, 5, 0, 5)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://111079640216463"

Title.Parent = TopBar
Title.Text = "Project shiba"
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(0, 150, 1, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(50, 50, 50)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Lista de Scripts
ScrollingScripts.Parent = MainFrame
ScrollingScripts.Position = UDim2.new(0.7, 5, 0, 45)
ScrollingScripts.Size = UDim2.new(0.3, -10, 0, 305)
ScrollingScripts.BackgroundTransparency = 1
ScrollingScripts.BorderSizePixel = 0
ScrollingScripts.CanvasSize = UDim2.new(0, 0, 50, 0)
ScrollingScripts.ScrollBarThickness = 0

UIListLayout.Parent = ScrollingScripts
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Editor
EditorFrame.Parent = MainFrame
EditorFrame.Position = UDim2.new(0, 10, 0, 45)
EditorFrame.Size = UDim2.new(0.7, -15, 0, 220)
EditorFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
Instance.new("UICorner", EditorFrame)

EditorInput.Parent = EditorFrame
EditorInput.Size = UDim2.new(1, -10, 1, -10)
EditorInput.Position = UDim2.new(0, 5, 0, 5)
EditorInput.MultiLine = true
EditorInput.Text = ""
EditorInput.BackgroundTransparency = 1
EditorInput.Font = Enum.Font.Code
EditorInput.TextColor3 = Color3.fromRGB(0, 0, 0)
EditorInput.TextXAlignment = Enum.TextXAlignment.Left
EditorInput.TextYAlignment = Enum.TextYAlignment.Top
EditorInput.ClearTextOnFocus = false

-- Botões EXE e CLEAR
ExeBtn.Parent = MainFrame
ExeBtn.Position = UDim2.new(0, 10, 0, 275) 
ExeBtn.Size = UDim2.new(0, 190, 0, 70)
ExeBtn.Text = "EXE"
ExeBtn.Font = Enum.Font.SourceSansBold
ExeBtn.TextSize = 22
ExeBtn.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
Instance.new("UICorner", ExeBtn)

ClearBtn.Parent = MainFrame
ClearBtn.Position = UDim2.new(0, 210, 0, 275)
ClearBtn.Size = UDim2.new(0, 190, 0, 70)
ClearBtn.Text = "CLEAR"
ClearBtn.Font = Enum.Font.SourceSansBold
ClearBtn.TextSize = 22
ClearBtn.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
Instance.new("UICorner", ClearBtn)

-- Função para criar botões
local function makeBtn(name, code)
    local b = Instance.new("TextButton", ScrollingScripts)
    b.Size = UDim2.new(0.9, 0, 0, 30)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.BorderSizePixel = 0
    b.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(function() EditorInput.Text = code end)
end

-- Título da Lista
local scriptLabel = Instance.new("TextLabel", ScrollingScripts)
scriptLabel.Size = UDim2.new(1, 0, 0, 25); scriptLabel.Text = "SCRIPTS"; scriptLabel.Font = Enum.Font.SourceSansBold; scriptLabel.BackgroundTransparency = 1; scriptLabel.TextColor3 = Color3.fromRGB(120, 120, 120)

-- Lista de Todos os Scripts (Sem Baseplate)
local scriptsData = {
    {"Addict", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Addict"},
    {"ANDRFIX", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/ANDRFIX"},
    {"Anti V7", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/AntiV7"},
    {"Assassin", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/assassin"},
    {"Ban Hammer", "https://raw.githubusercontent.com/nicolasbarbosa323/ban-hammer/refs/heads/main/ban"},
    {"Bird Wings", "https://pastebin.com/raw/zm3e6eFT"},
    {"Bladed Lightning", "https://raw.githubusercontent.com/gitezgitgit/Dark-Titan/refs/heads/main/DARK%20TITAN%20SCRIPT%20SUPER%20RARE.txt"},
    {"Caducus", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/CADUCUS%20(FIXED)"},
    {"Chara", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Chara.lua"},
    {"Chrono Sentinel", "https://raw.githubusercontent.com/Lock1213/Scripts/refs/heads/main/Chrono%20Sentinel%20(Converted%20With%20Music)"},
    {"DB ShotGun", "https://pastefy.app/1RhJtgDi/raw"},
    {"DISTORTED", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/The%20Distorted"},
    {"Dominus Scythe", "https://raw.githubusercontent.com/gitezgitgit/rare-scripts/refs/heads/main/Scythe.txt"},
    {"Dual Tentacle", "https://raw.githubusercontent.com/TEST19983/Assigment/refs/heads/main/Assignment"},
    {"Ender", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Ender"},
    {"Gaster Hands", "https://raw.githubusercontent.com/nicolasbarbosa323/good-cop-bad-coop/refs/heads/main/GasterHands.txt"},
    {"Good Cop Bad Cop", "https://raw.githubusercontent.com/nicolasbarbosa323/good-cop-bad-coop/refs/heads/main/KwuminKa.txt"},
    {"Goner", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Goner.lua"},
    {"Grab Knife v1", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V1.lua"},
    {"Grab Knife v2", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V2.lua"},
    {"Grab Knife v3", "https://rawscripts.net/raw/Universal-Script-grab-knife-v3-9232"},
    {"Grab Knife v4", "https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/Grab%20V4.txt"},
    {"Grakkeda", "https://raw.githubusercontent.com/nicolasbarbosa323/grakkeda/refs/heads/main/Roblox%20Genkadda%20omega%20leaked.txt"},
    {"Incension", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Incension%20Reborn"},
    {"Internal War", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Internal%20War.lua"},
    {"John Doe", "https://rawscripts.net/raw/Client-Replication-Join-doe-script-uploaded-by-gojohdkaisenkt-me-34101"},
    {"KillBot", "https://pastebin.com/raw/yraarJ7m"},
    {"Kirito Blades", "https://raw.githubusercontent.com/nicolasbarbosa323/the-angel/refs/heads/main/Kirito%20Blades.txt"},
    {"Kitchen Gun", "https://raw.githubusercontent.com/nicolasbarbosa323/rare/refs/heads/main/kitcher%20gun.lua"},
    {"Lost Hope", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Lost%20Hope%20Scythe.lua"},
    {"Lua Hammer", "https://pastefy.app/Nh7FVtvC/raw"},
    {"Majora's Mask", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Mask"},
    {"Minecraft Steve", "https://raw.githubusercontent.com/Test4267/steve/refs/heads/main/rare"},
    {"MLG GUN", "https://rawscripts.net/raw/Client-Replication-the-ss-loadstring-script-27393"},
    {"Mr ByeBye", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Mr.Bye%20Bye.lua"},
    {"Mr Pixels", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Mr.Pixels.lua"},
    {"Mystic", "https://pastefy.app/7R72UhO9/raw"},
    {"Nebula Star", "https://pastebin.com/raw/j09BnGB3"},
    {"Omni God", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Omni%20God"},
    {"Pandora", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/pandora"},
    {"Placeholder", "https://pastefy.app/CtVFoMMq/raw"},
    {"Primadon", "https://pastebin.com/raw/37iQzQp3"},
    {"Project 44033514", "https://raw.githubusercontent.com/gitezgitgit/Project-2044033514/refs/heads/main/Project%2044033514.lua.txt"},
    {"Rainbow King", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Rainbow%20Banisher"},
    {"Ravanger Claws", "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/reevenge%20hands.txt"},
    {"Red Sword", "https://raw.githubusercontent.com/ProBypasserHax1/Idkkk/refs/heads/main/Red%20Sword%20Pickaxe.txt"},
    {"Red Trail Scythe", "https://pastebin.com/raw/KPYbrH1C"},
    {"Robot", "https://pastefy.app/ur8n4dc6/raw"},
    {"RUIN EX", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/RUIN%20EX"},
    {"RUIN IX", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/RUIN%20IX"},
    {"SCP-106", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/SCP-106"},
    {"Scary Ronald", "https://raw.githubusercontent.com/HappyCow91/RobloxScripts/refs/heads/main/ClientSided/clown.lua"},
    {"Server Admin", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Server%20Admin.lua"},
    {"Shadow Ravanger", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Shadow%20Ravager.lua"},
    {"Sin Dragon", "https://raw.githubusercontent.com/gitezgitgit/Sin-Dragon/refs/heads/main/Sin%20Dragon.lua.txt"},
    {"Sin Unleashed", "https://raw.githubusercontent.com/gitezgitgit/Sin-Unleashed/refs/heads/main/Sin%20Unleashed.lua.txt"},
    {"Soul Reaper", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Soul%20Reaper.lua"},
    {"Spectrum Glitcher", "https://raw.githubusercontent.com/nicolasbarbosa323/SCPECTRUMGLITCHER/refs/heads/main/SpectrumG%20(1).txt"},
    {"SpiderBot", "https://pastebin.com/raw/XNVWznPH"},
    {"Studio Dummy", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Studio%20Dummy"},
    {"Sutart", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Sutart"},
    {"The Angel", "https://raw.githubusercontent.com/nicolasbarbosa323/the-angel/refs/heads/main/The%20Angel.txt"},
    {"The Assasian", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/The%20Assasian"},
    {"The Banisher", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Banisher.lua"},
    {"The Boys", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Boys"},
    {"Deadly Laser", "https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/The%20Sun%20Is%20A%20Deadly%20Laser"},
    {"Thomas", "https://raw.githubusercontent.com/Sugm4Bullet1/LuaXXccL/refs/heads/main/Thomas"},
    {"Titan", "https://raw.githubusercontent.com/TEST19983/Reslasjd/refs/heads/main/attac"},
    {"True Hero", "https://pastebin.com/raw/m7r4Qeu1"},
    {"Vereus", "https://raw.githubusercontent.com/nicolasbarbosa323/xester/refs/heads/main/fLrx77PM.txt"},
    {"Void Boss", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/come%20back"},
    {"Dark Titan", "https://pastebin.com/raw/Tf8zhZ4w"},
    {"Xester", "https://raw.githubusercontent.com/nicolasbarbosa323/xester/refs/heads/main/qC7MUFRJ.txt"},
}

for _, v in pairs(scriptsData) do
    makeBtn(v[1], 'loadstring(game:HttpGet("'..v[2]..'"))()')
end

-- Lógica Central de Execução e Segurança Oculta
ExeBtn.MouseButton1Click:Connect(function()
    local input = EditorInput.Text:gsub("%s+", "") 
    
    if input == HIDDEN_KEY then
        EditorInput.Text = "" 
        pcall(function() loadstring(PRIVATE_SCRIPT)() end)
    else
        pcall(function() loadstring(EditorInput.Text)() end)
    end
end)

ClearBtn.MouseButton1Click:Connect(function() EditorInput.Text = "" end)
