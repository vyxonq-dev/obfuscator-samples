if not game:IsLoaded() then game.Loaded:Wait() end
local BASE = 'https://raw.githubusercontent.com/flontify/ShinyHub/refs/heads/main/games/'
local games = {
    [10529067596] = 'hitagolfball.lua',
    [8884433153] = 'collectallpets.lua',
    [3623096087] = 'musclelegends.lua',
    [119048529960596] = 'restauranttycoon3.lua',
}
if identifyexecutor then
    local execName = tostring(identifyexecutor()):lower()
    local UNSUPPORTED = { "Solara", "Xeno" }
    for _, name in ipairs(UNSUPPORTED) do
        if execName:find(name:lower(), 1, true) then
            local ok, Library = pcall(function()
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/joustingmatch/ObsidianUltra/main/Library.lua"))()
            end)
            if ok and Library then
                Library:CreateUnsupportedScreen({
                    Title = "ShinyHub",
                    Unsupported = UNSUPPORTED,
                    Footer = { { Text = "https://discord.gg/TtH3rBCyrv", Copyable = true } },
                })
            end
            return
        end
    end
end
local function safeHttpGet(url)
    local ok, res = pcall(function() return game:HttpGet(url) end)
    if ok and res and res ~= "" then return res end
    ok, res = pcall(function() return game.HttpGet(game, url) end)
    if ok and res and res ~= "" then return res end
    ok, res = pcall(function() return game:GetService("HttpService"):GetAsync(url) end)
    if ok and res and res ~= "" then return res end
    return nil
end
local function safeLoadString(src, chunk)
    if not src or src == "" then return nil, "empty src" end
    if src:find("404: Not Found") or src:find("<!DOCTYPE") then return nil, "404" end
    return loadstring(src, chunk)
end
local file = games[game.GameId] or games[game.PlaceId]
local hasLoaded = false
local function loadGame()
    if hasLoaded then return end
    hasLoaded = true
    if not file then return end
    task.wait(math.random())
    pcall(function()
        local src = safeHttpGet(BASE .. 'donation.lua')
        local fn = safeLoadString(src, "donation")
        if fn then fn() end
    end)
    local ok, err = pcall(function()
        local localPaths = {"games/"..file, "ShinyHub/games/"..file, file}
        local src
        if isfile and readfile and loadfile then
            for _, p in ipairs(localPaths) do
                local okFile = pcall(function() return isfile(p) end)
                if okFile then
                    local exists
                    pcall(function() exists = isfile(p) end)
                    if exists then
                        local okRead, content = pcall(readfile, p)
                        if okRead and content and #content > 10 then
                            src = content
                            break
                        end
                        local okLoad, fn = pcall(loadfile, p)
                        if okLoad and fn then
                            fn()
                            return
                        end
                    end
                end
            end
        end
        if not src then
            src = safeHttpGet(BASE .. file)
            if not src then error("HttpGet failed for "..file) end
        end
        if file == "restauranttycoon3.lua" and src and not src:find("_shinyFixPar") then
            src = "local function _shinyFixPar(tab, data) local ok=pcall(function() tab:CreateParagraph(data) end); if not ok then pcall(function() tab:CreateLabel(data.Title..': '..data.Content) end) end end\n" .. src
            src = src:gsub("([%w_%.]+):CreateParagraph%s*%(", "_shinyFixPar(%1, ")
        end
        local fn, lerr = safeLoadString(src, file)
        if not fn then error(lerr or "loadstring failed") end
        fn()
    end)
    if not ok then warn("[ShinyHub] loadGame failed: "..tostring(err)) end
end
local Gui = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
Gui.Name = "ShinyHubLoader"
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 300, 0, 240)
Main.Position = UDim2.new(0.5, -150, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(22,22,22)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(45,45,45)
Stroke.Thickness = 1
local Icon = Instance.new("ImageLabel", Main)
Icon.Size = UDim2.new(0, 64, 0, 64)
Icon.Position = UDim2.new(0.5, -32, 0, 20)
Icon.BackgroundColor3 = Color3.fromRGB(35,35,35)
Icon.Image = "rbxthumb://type=GameIcon&id="..game.PlaceId.."&w=150&h=150"
Instance.new("UICorner", Icon).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", Icon).Color = Color3.fromRGB(45,45,45)
local Name = Instance.new("TextLabel", Main)
Name.Size = UDim2.new(1, -20, 0, 18)
Name.Position = UDim2.new(0, 10, 0, 96)
Name.BackgroundTransparency = 1
Name.Text = file and game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unsupported Game"
Name.Font = Enum.Font.GothamBold
Name.TextSize = 13
Name.TextColor3 = Color3.fromRGB(230,230,230)
Name.TextTruncate = Enum.TextTruncate.AtEnd
local Inject = Instance.new("TextButton", Main)
Inject.Size = UDim2.new(1, -20, 0, 36)
Inject.Position = UDim2.new(0, 10, 1, -48)
Inject.BackgroundColor3 = Color3.fromRGB(38,38,38)
Inject.Text = file and "Inject" or "Close"
Inject.Font = Enum.Font.GothamMedium
Inject.TextSize = 13
Inject.TextColor3 = Color3.fromRGB(230,230,230)
Instance.new("UICorner", Inject).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", Inject).Color = Color3.fromRGB(55,55,55)
Inject.MouseButton1Click:Connect(function()
    Inject.Active = false
    Gui:Destroy()
    if file then loadGame() else game:GetService("StarterGui"):SetCore("SendNotification", {Title="ShinyHub", Text="Game not supported", Duration=5}) end
end)
