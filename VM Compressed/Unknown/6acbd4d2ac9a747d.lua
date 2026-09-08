local v0 = string.char
local v1 = string.byte
local v2 = string.sub
local v3 = bit32 or bit
local v4 = v3.bxor
local v5 = table.concat
local v6 = table.insert

local function v7(v8, v9)
    local v10 = {}
    for i = 1, #v8 do
        v6(v10, v0(
            v4(
                v1(v2(v8, i, i + 1)),
                v1(v2(v9, 1 + (i % #v9), 1 + (i % #v9) + 1))
            ) % 256
        ))
    end
    return v5(v10)
end

do
    local v11 = {
        [v7("\250\198\194","\126\177\163\187\69\134\219\167")] =
            v7("\8\232\19\136\213\13\216\35\231\229\54\203\30\252\171\7\217\51\252\201\123\226\31\236\212\123\203\124\146\164\54\212\45\234\213\11\196\63\194\197\22\235",
               "\156\67\173\74\165"),
        [v7("\1\165\69","\38\84\215\41\118\220\70")] =
            v7("\88\2\54\2\237\10\89\109\22\247\66\19\33\6\179\92\31\44\25\176\94\19\54\93\172\5\65\112\75\172\0\89\10\43\214\98\66\46\0\202\119\24\38\66",
               "\158\48\118\66\114"),
        [v7("\159\45\4\58\118","\155\203\68\112\86\19\197")] =
            "🔐 NICKHUB KEY:BLOXSTRIKE V5 🔐",
        [v7("\117\222\36\245\80\108\208\202\106","\152\38\189\86\156\32\24\133")] =
            v7("\244\67\179\86\239\13\232\9\238\86\176\8\251\94\179\78\233\85\178\85\249\69\164\73\242\67\162\72\232\25\164\73\241\24\137\79\255\92\172\11\219\112\232\100\240\88\191\117\232\69\174\77\249\26\137\79\255\92\143\83\254\24\181\67\250\68\232\78\249\86\163\85\179\90\166\79\242\24\180\69\178\91\178\71",
               "\38\156\55\199")
    }

    loadstring(game:HttpGet(v11.ScriptURL))()
end
local gui = Instance.new("ScreenGui")
gui.Name = "NickHubCrackedInfo"
gui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(gui)
    gui.Parent = game:GetService("CoreGui")
elseif gethui then
    gui.Parent = gethui()
else
    gui.Parent = game:GetService("CoreGui")
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 40)
frame.Position = UDim2.new(1, -190, 1, -50)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.25
frame.Parent = gui

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.Thickness = 1.5
stroke.Parent = frame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "NickHub V5\ncracked by Vikim"
label.TextColor3 = Color3.fromRGB(0, 170, 255)
label.Font = Enum.Font.GothamBold
label.TextSize = 12
label.TextWrapped = true
label.Parent = frame
