local places = {
    [12004594806] = {message = "Sword Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/main/SwordPiece.txt"},
    [18271034370] = {message = "Sakura Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/main/SakuraPiece.lua"},
    [18688206652] = {message = "Ijul Piece 2", url = "https://raw.githubusercontent.com/RimuraHub/MAP/main/ijul.lua"},
    [16448761503] = {message = "Rung Sea", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Rung%20Sea.lua%20(3)%20(1).txt"},
    [18968803452] = {message = "Muyong-Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Muyo.lua"},
    [137664479590005] = {message = "Muyong-Piece W2", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Muyosea2.lua"},
    [105557873963854] = {message = "CeeTo Fruit", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/CeeTo%20Piece.lua"},
    [6925849909] = {message = "City Banna", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/City%20Banna.lua"},
    [116291960732071] = {message = "Obito Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/ObitoPiece.lua"},
    [86639052909924] = {message = "Verse Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Verse%20piece.lua"},
    [87081024978735] = {message = "Soy Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Soy%20Piece.lua"},
    [18874085388] = {message = "Exotic Sea", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Exotic%20sea.lua"},
    [112000728351623] = {message = "Maze Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Maze%20piece.lua"},
    [100811961417979] = {message = "Monkey Legacy", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Monkey%20lega.lua"},
    [16732694052] = {message = "Fisch", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Fisch.lua"},
    [95295765150201] = {message = "RockFruit", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Rock%20fruit%20New.lua"},
    [100340127867802] = {message = "ZaroSea", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Zaroseam.lua"},
    [111347281646457] = {message = "Moodeng Fruit", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Muden.lua"},
    [76091669089883] = {message = "Moodeng Fruit Dungeon", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Muden.lua"},
    [17545130379] = {message = "Royal Sea", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/RoyalSeaFullFunction.lua"},
    [74193535211122] = {message = "Speed Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/SpeedPiece.lua"},
    [7716726054068] = {message = "Speed Piece Dungeon 1", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/SpeedPiece.lua"},
    [77167260540689] = {message = "Speed Piece Dungeon 2", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/SpeedPiece.lua"},
    [130992896367999] = {message = "Dawn Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Dawn%20piece.lua"},
    [17263800225] = {message = "Zeno Piece", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/zeno%20piece%2094%25.lua"},
    [108256266368095] = {message = "TRAMADEX PIECE", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/TarmadexPiece.lua.txt"},
    [130745629665129] = {message = "Godvers PIECE", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Godevser.lua"},
    [88448392840247] = {message = "Honey PIECE", url = "https://raw.githubusercontent.com/RimuraHub/MAP/refs/heads/main/Honey%20piece.lua"}
}

local function loadScript(url)
    local httpService = game:GetService("HttpService")

    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if not success then
        warn("Error loading script: " .. err)

        local screenGui = Instance.new("ScreenGui")
        local textLabel = Instance.new("TextLabel")
        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        textLabel.Parent = screenGui
        textLabel.Size = UDim2.new(0, 300, 0, 150)
        textLabel.Position = UDim2.new(0.5, -150, 0.5, -75)
        textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextSize = 24
        textLabel.Text = "RimuruHub\n------------------\nPlease wait for the fix.\n-----------------\nError\nError: " .. err
        textLabel.TextWrapped = true
    end
end

local place = places[game.PlaceId]
if place then
    print(place.message)
    loadScript(place.url)
else
    game.Players.LocalPlayer:Kick("Not Supported Map")
end
