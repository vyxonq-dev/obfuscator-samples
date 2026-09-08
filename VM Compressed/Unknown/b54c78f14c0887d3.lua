-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Set Parent
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
Title.Parent = MainFrame
ScrollingFrame.Parent = MainFrame
UICorner.Parent = MainFrame

-- Main Frame Properties
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -150)
MainFrame.Active = true
MainFrame.Draggable = true
UICorner.CornerRadius = UDim.new(0, 10)

-- Title Properties
Title.Text = "TSB Custom Moveset Hub"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

-- Scrolling Frame Properties
ScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)

-- List Layout for buttons in the scroll area
UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.Padding = UDim.new(0, 10)

-- Button Function for Custom Movesets
function CreateButton(text, url)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 18
    Button.Font = Enum.Font.GothamBold
    Button.Text = text
    Button.AutoButtonColor = true
    Button.Parent = ScrollingFrame

    Button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url, true))()
    end)
end

-- Add Custom Moveset Buttons
CreateButton("Goku Moveset", "https://raw.githubusercontent.com/your-repo/goku-moveset-script/main/goku.lua") -- Goku Moveset
CreateButton("Star Glitcher (A-Train moveset)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SG_DEMO.lua")
CreateButton("A-Train Moveset", "https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua")
CreateButton("Sung Jin Woo Moveset", "https://raw.githubusercontent.com/hamletirl/sunjingwoo/refs/heads/main/sunjingwoo")
CreateButton("Naruto Moveset", "https://raw.githubusercontent.com/LolnotaKid/NarutoBeatUpSasukeAss/refs/heads/main/NarutoCums")
CreateButton("JK Moveset", "https://raw.githubusercontent.com/NetlessMade/KJ-TO-JK/refs/heads/main/script.lua")
CreateButton("Dio Moveset", "https://raw.githubusercontent.com/ThanakritScript/StandUserCilent/refs/heads/main/DioBeta.lua")
CreateButton("Shinjuku Yuji Moveset", "https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Yuji%20early%20access")
CreateButton("Toji Moveset", "https://raw.githubusercontent.com/Wi-sp/Limitless-legacy/refs/heads/main/GUI")
CreateButton("Voltra Moveset", "https://paste.ee/r/rF9d3")
CreateButton("VHS Sans Moveset", "https://paste.ee/r/70OTE")
CreateButton("Geto Moveset", "https://paste.ee/r/AnZ5j")
CreateButton("JJS Gojo Moveset", "https://gist.githubusercontent.com/JcBoomin/a63e9ac3e90cef03ecf37e997fd21632/raw/98b567b81f61bb30042e0078b78f3fb24685fb8d/Gojo")
CreateButton("Mastery Deku Moveset", "https://pastebin.com/raw/xKextYP5")
CreateButton("Void Kills Moveset", "https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/main/VOID%20V2%20TSB.lua")
CreateButton("GT-Chara Moveset", "https://paste.ee/r/0yYkO")
CreateButton("Diddy Moveset", "https://paste.ee/r/gKC8V")
CreateButton("Hakari Moveset", "https://pastebin.com/raw/eEDYWj8p")
CreateButton("Boros Moveset", "https://paste.ee/r/XPIH5")
CreateButton("Star Glitcher Moveset", "https://paste.ee/r/mmQkO")
CreateButton("Okarun Moveset", "https://paste.ee/r/Pn4oj")
CreateButton("Minos Prime Moveset", "https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma")
CreateButton("Titan Moveset", "https://paste.ee/r/fxY03")
CreateButton("Sukuna Moveset", "https://pastebin.com/raw/rL3hyRQV")
CreateButton("Humbleds GF Moveset", "https://paste.ee/r/7FuWC")
CreateButton("Akaza Moveset", "https://paste.ee/r/zzvAH")
CreateButton("Jun Moveset", "https://gist.githubusercontent.com/GoldenHeads2/f66279000c58a020e894a6db44914838/raw/62e53e1acacec0b38b43cd0f594292c32e09c39b/gistfile1.txt")
CreateButton("Angel V 1.0 Moveset", "https://gist.githubusercontent.com/GoldenHeads2/93ddb1b1e2935bc76fbc37aae8985ad2/raw/47dfa45e1e8f1933a1c031b198d40c3cd1499fa2/gistfile1.txt")
CreateButton("Garou X KJ Moveset", "https://raw.githubusercontent.com/damir512/garoukjv1maybeidk/main/Protected_2460290213750059.txt")
CreateButton("Kira Moveset", "https://gist.githubusercontent.com/GoldenHeads2/35ca43410a2e96102f73dca904137973/raw/c4cb113194c35e0439151b06ea82dcc8053ff2c3/gistfile1.txt")
CreateButton("TS Toji Moveset", "https://raw.githubusercontent.com/S1gmaGuy/Toji_Sigma_Boy/refs/heads/main/100%%20Sigma%20Boy")
CreateButton("JJS Gojo Moveset", "https://raw.githubusercontent.com/damir512/jjsgojov3/main/SaitamaToGojoV3_SOURCE-obfuscated_2.txt")
CreateButton("Mahito Moveset", "https://raw.githubusercontent.com/GreatestLime4K/mahitotsb/refs/heads/main/Protected_6381580361331378.txt")
CreateButton("Okarun Moveset", "https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Hero%20hunter%20to%20okarun%20fr")
CreateButton("Vexor Moveset", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VEXOR.lua")
CreateButton("Kyra KJ Moveset", "https://gist.githubusercontent.com/GoldenHeads2/5fe3178dff916f988d319c3bd5e4fc01/raw/b250ee6f967c4e84195a76ab7915fb1d79b53326/gistfile1.txt")
CreateButton("Chainsaw-Man Moveset", "https://gist.githubusercontent.com/GoldenHeads2/0fd8d36993c850f3fac89e5adf793076/raw/ab4f5a42bd0b2e24a32a46301d533ea849ca771c/gistfile1.txt")
CreateButton("Luffy Moveset", "https://github.com/aggiealledge/obfuscated-scripts/raw/refs/heads/main/Protected_7732857839120517.txt")
CreateButton("Shinji Moveset", "https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit")
CreateButton("Deku X Suiryu Moveset", "https://github.com/aggiealledge/obfuscated-scripts/raw/refs/heads/main/deku%20suiryu%20thingy.txt")
CreateButton("Trashcan Man Moveset", "https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man")
CreateButton("JK Moveset", "https://raw.githubusercontent.com/NetlessMade/KJ-TO-JK/refs/heads/main/script.lua")
CreateButton("Naruto Moveset", "https://raw.githubusercontent.com/LolnotaKid/NarutoBeatUpSasukeAss/refs/heads/main/NarutoCums")
CreateButton("Choi Jong In Moveset", "https://raw.githubusercontent.com/nil071n/fireman/refs/heads/main/TSB")
CreateButton("Yuji X Sukuna Moveset", "https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Sigma%20v2%20vessel%20tp")
CreateButton("Jin Woo Moveset", "https://raw.githubusercontent.com/hamletirl/sunjingwoo/refs/heads/main/sunjingwoo")
CreateButton("1x1x1x1 Hacker Moveset", "https://gist.githubusercontent.com/GoldenHeads2/900e87ffc32f3c740930ccb106dd6abf/raw/358c5bf0f0a6aa25946718288dab006e3ae7e1d4/gistfile1.txt")
CreateButton("Manga Sukuna Moveset", "https://raw.githubusercontent.com/niki21233/undonethokunas/refs/heads/main/thokunasundone")
CreateButton("Star Glitcher Moveset", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SG_DEMO.lua")
CreateButton("Void Garou Moveset", "https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Void%20Reaper%20Obfuscated.txt")
CreateButton("Sans Paid Moveset", "https://raw.githubusercontent.com/RadioUwU/BANNN/refs/heads/main/SANSDANCE")
CreateButton("A-Train Moveset", "https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua")

-- Final Adjustment
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)