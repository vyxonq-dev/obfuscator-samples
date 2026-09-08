--[[ nick7 hub ]]

local id = game.PlaceId
function outdated_warn()
    warn("(nick7 hub) Script is outdated for this game!")
end

function load(str)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nick7-hub/roblox/main/scripts/"..str))()
end

local n7w = nil

function n7w()
    n7w = {}

    local function randomString()
        local length = math.random(10,20)
        local array = {}
        for i = 1, length do
            array[i] = string.char(math.random(32, 126))
        end
        return table.concat(array)
    end

    n7w["1"] = Instance.new("ScreenGui")
    n7w["1"]["Name"] = randomString()
    n7w["1"]["Parent"] = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    n7w["1"]["DisplayOrder"] = 99

    n7w["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

    n7w["2"] = Instance.new("CanvasGroup", n7w["1"])
    n7w["2"]["BorderSizePixel"] = 0
    n7w["2"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30)
    n7w["2"]["Size"] = UDim2.new(0.28974, 0, 0.41975, 0)
    n7w["2"]["Position"] = UDim2.new(0.35513, 0, 0.29012, 0)
    n7w["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

    n7w["3"] = Instance.new("UICorner", n7w["2"])
    n7w["3"]["CornerRadius"] = UDim.new(0.1, 0)

    n7w["4"] = Instance.new("CanvasGroup", n7w["2"])
    n7w["4"]["BorderSizePixel"] = 0
    n7w["4"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37)
    n7w["4"]["Size"] = UDim2.new(1, 0, 0.17132, 0)
    n7w["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    n7w["4"]["Name"] = randomString()

    n7w["5"] = Instance.new("TextLabel", n7w["4"])
    n7w["5"]["TextWrapped"] = true
    n7w["5"]["BorderSizePixel"] = 0
    n7w["5"]["TextScaled"] = true
    n7w["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    n7w["5"]["TextSize"] = 14
    n7w["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    n7w["5"]["TextColor3"] = Color3.fromRGB(90, 183, 73)
    n7w["5"]["BackgroundTransparency"] = 1
    n7w["5"]["RichText"] = true
    n7w["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    n7w["5"]["Size"] = UDim2.new(0.9, 0, 1, 0)
    n7w["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    n7w["5"]["Text"] = [[nick7 hub]]
    n7w["5"]["Name"] = randomString()
    n7w["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

    n7w["6"] = Instance.new("TextLabel", n7w["2"])
    n7w["6"]["TextWrapped"] = true
    n7w["6"]["BorderSizePixel"] = 0
    n7w["6"]["TextScaled"] = true
    n7w["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    n7w["6"]["TextSize"] = 14
    n7w["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    n7w["6"]["TextColor3"] = Color3.fromRGB(255, 0, 0)
    n7w["6"]["BackgroundTransparency"] = 1
    n7w["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    n7w["6"]["Size"] = UDim2.new(0.9, 0, 0.15588, 0)
    n7w["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    n7w["6"]["Text"] = [[! WARNING !]]
    n7w["6"]["Name"] = randomString()
    n7w["6"]["Position"] = UDim2.new(0.5, 0, 0.24926, 0)

    n7w["7"] = Instance.new("TextLabel", n7w["2"])
    n7w["7"]["TextWrapped"] = true
    n7w["7"]["BorderSizePixel"] = 0
    n7w["7"]["TextXAlignment"] = Enum.TextXAlignment.Left
    n7w["7"]["TextYAlignment"] = Enum.TextYAlignment.Top
    n7w["7"]["TextScaled"] = true
    n7w["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    n7w["7"]["TextSize"] = 35
    n7w["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    n7w["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
    n7w["7"]["BackgroundTransparency"] = 1
    n7w["7"]["RichText"] = true
    n7w["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    n7w["7"]["Size"] = UDim2.new(0.9, 0, 0.58603, 0)
    n7w["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    n7w["7"]["Text"] = [[Script is obfuscated using pixsec. Roblox might freeze up to 30 seconds. Please wait for script to load]]
    n7w["7"]["Name"] = randomString()
    n7w["7"]["Position"] = UDim2.new(0.5, 0, 0.65184, 0)
end

function load_obf(text) -- load() wrapper
    n7w()
    local gui:ScreenGui = n7w['1']
    task.wait(0.1)
    game:GetService("RunService").RenderStepped:Wait()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nick7-hub/obfuscated/main/scripts/"..text))()
    gui:Destroy()
end

local games = {
    [205224386] = 'load("hidenseek_extreme.lua")',
    [2693739238] = 'load("thief_life.lua")',
    [9647190122] = 'load("max_obby.lua")',
    [32331218] = 'load("mmrp-autofarm.lua")',
    [2882332175] = 'load("bdfs.lua")',
    [6999691637] = 'load("rbds.lua")',
    [10660791703] = 'load("cran.lua")',
    [230362888] = 'load("normal_elevator.lua")',
    [15410077867] = 'load("superhero_obby.lua")',
    [2537430692] = 'load("bnp.lua")',
    [537413528] = 'load("babft.lua")',
    [3411100258] = 'load("bordr_autofarm.lua")',
    [394773622] = 'workspace.DoShopPurchase:InvokeServer(game.Players.LocalPlayer.leaderstats.Coins, -945986745698454679,"skill3")',
    [18725604807] = 'load_obf("UltimateTownSandbox.lua")',
    [17295191183] = 'load_obf("utm.lua")',
    [72842684855320] = 'load("sonic-stay-alive.lua")',
    [4598019433] = 'load("grg.lua")',
}

local broken = {}
local supported = false
for k, _ in games do
    if k == id then
        supported = true
        break
    end
end

if supported then
    if not table.find(broken, id) then
        loadstring(games[id])()
    else
        outdated_warn()
    end
else
    print("--=(nick7 hub)=--")
    warn(`Place ({id}) is not supported by nick7 hub!`)
    print("If game IS supported, create a ticket in our discord: discord.gg/NGAaby4y4b")
    print("--=(nick7 hub)=--")
    local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/dxhooknotify/src.lua", true))()
    notif:Notify("nick7 hub","Place is not supported! Check \"/console\"",20)
end