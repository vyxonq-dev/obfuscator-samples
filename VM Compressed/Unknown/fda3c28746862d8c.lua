if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end


local LMG2L = {}

-- ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
LMG2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LMG2L["ScreenGui_1"].ResetOnSpawn = false
LMG2L["ScreenGui_1"].IgnoreGuiInset = true

-- Main Frame
LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"])
LMG2L["Frame_2"].BorderSizePixel = 0
LMG2L["Frame_2"].BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LMG2L["Frame_2"].AnchorPoint = Vector2.new(0.5, 0.5)
LMG2L["Frame_2"].Position = UDim2.new(0.5, 0, 0.5, 0)
LMG2L["Frame_2"].Size = UDim2.new(0.9, 0, 0.75, 0) -- mobile friendly

-- Corner
local corner = Instance.new("UICorner", LMG2L["Frame_2"])
corner.CornerRadius = UDim.new(0.03, 0)

-- Stroke
LMG2L["UIStroke_7"] = Instance.new("UIStroke", LMG2L["Frame_2"])
LMG2L["UIStroke_7"].Thickness = 1.5
LMG2L["UIStroke_7"].Color = Color3.fromRGB(70, 70, 70)

-- Drag (PC)
LMG2L["UIDragDetector_8"] = Instance.new("UIDragDetector", LMG2L["Frame_2"])

-- Top Bar
LMG2L["Frame_9"] = Instance.new("Frame", LMG2L["Frame_2"])
LMG2L["Frame_9"].BorderSizePixel = 0
LMG2L["Frame_9"].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LMG2L["Frame_9"].Size = UDim2.new(1, 0, 0.1, 0)

local topCorner = Instance.new("UICorner", LMG2L["Frame_9"])
topCorner.CornerRadius = UDim.new(0.03, 0)

-- Title
LMG2L["TextLabel_c"] = Instance.new("TextLabel", LMG2L["Frame_9"])
LMG2L["TextLabel_c"].BackgroundTransparency = 1
LMG2L["TextLabel_c"].Size = UDim2.new(0.7, 0, 1, 0)
LMG2L["TextLabel_c"].Position = UDim2.new(0.04, 0, 0, 0)
LMG2L["TextLabel_c"].Text = "holi hub"
LMG2L["TextLabel_c"].TextScaled = true
LMG2L["TextLabel_c"].TextXAlignment = Enum.TextXAlignment.Left
LMG2L["TextLabel_c"].TextColor3 = Color3.fromRGB(255, 255, 255)
LMG2L["TextLabel_c"].FontFace =
    Font.new("rbxasset://fonts/families/Ubuntu.json")

-- Close Button
LMG2L["TextButton_a"] = Instance.new("TextButton", LMG2L["Frame_9"])
LMG2L["TextButton_a"].Text = "✕"
LMG2L["TextButton_a"].TextScaled = true
LMG2L["TextButton_a"].TextColor3 = Color3.fromRGB(255, 255, 255)
LMG2L["TextButton_a"].BackgroundColor3 = Color3.fromRGB(170, 40, 40)
LMG2L["TextButton_a"].Size = UDim2.new(0.12, 0, 0.7, 0)
LMG2L["TextButton_a"].Position = UDim2.new(0.86, 0, 0.15, 0)
LMG2L["TextButton_a"].BorderSizePixel = 0

local closeCorner = Instance.new("UICorner", LMG2L["TextButton_a"])
closeCorner.CornerRadius = UDim.new(1, 0)

LMG2L["LocalScript_b"] = Instance.new("LocalScript", LMG2L["TextButton_a"])

-- Scrolling Content
LMG2L["ScrollingFrame_3"] = Instance.new("ScrollingFrame", LMG2L["Frame_2"])
LMG2L["ScrollingFrame_3"].BorderSizePixel = 0
LMG2L["ScrollingFrame_3"].BackgroundTransparency = 1
LMG2L["ScrollingFrame_3"].Position = UDim2.new(0.04, 0, 0.13, 0)
LMG2L["ScrollingFrame_3"].Size = UDim2.new(0.92, 0, 0.83, 0)
LMG2L["ScrollingFrame_3"].AutomaticCanvasSize = Enum.AutomaticSize.Y
LMG2L["ScrollingFrame_3"].ScrollBarImageTransparency = 0.4
LMG2L["ScrollingFrame_3"].ScrollBarThickness = 4

LMG2L["UIListLayout_4"] = Instance.new("UIListLayout", LMG2L["ScrollingFrame_3"])
LMG2L["UIListLayout_4"].Padding = UDim.new(0.02, 0)

-- Button Template
LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["ScrollingFrame_3"])
LMG2L["TextButton_6"].Visible = false
LMG2L["TextButton_6"].BorderSizePixel = 0
LMG2L["TextButton_6"].Size = UDim2.new(1, 0, 0.12, 0)
LMG2L["TextButton_6"].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LMG2L["TextButton_6"].TextColor3 = Color3.fromRGB(255, 255, 255)
LMG2L["TextButton_6"].TextScaled = true
LMG2L["TextButton_6"].TextWrapped = true

local btnCorner = Instance.new("UICorner", LMG2L["TextButton_6"])
btnCorner.CornerRadius = UDim.new(0.2, 0)

LMG2L["LocalScript_5"] = Instance.new("LocalScript", LMG2L["ScrollingFrame_3"])


local function C_5()
    local script = LMG2L["LocalScript_5"]
    local scr = script.Parent
    local btn = scr.TextButton

    function createbutton(name, call)
        local bt = btn:Clone()
        bt.Parent = scr
        bt.Text = name
        bt.Visible = true

        bt.MouseButton1Click:Connect(
            function()
                pcall(call)
            end
        )
    end

    createbutton(
    "car",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/car.luau"))()
    end
)

createbutton(
    "warden",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/warden.luau"))()
    end
)

createbutton(
    "little people",
    function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(
            "-gh 48474313 4246228452 62724852 451220849 3409612660 4094878701 4047554959 4489239608 63690008 62234425"
        )
        wait(2.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")

        loadstring(
            game:HttpGet(
                "https://raw.githubusercontent.com/thanhdat4461/1-Line-Scripts/refs/heads/main/Little%20People"
            )
        )()
    end
)

createbutton(
    "zero hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/zero.luau"))()
    end
)

createbutton(
    "krystal dance v3 modded",
    function()
        loadstring(game:HttpGet("https://pastefy.app/ozd6tpEW/raw"))()
    end
)

createbutton(
    "giant",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/giant.luau"))()
    end
)

createbutton(
    "pandora",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-jb-fe-pndor-14850"))()
    end
)

createbutton(
    "holliday feel",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/hdf.luau"))()
    end
)

createbutton(
    "xester",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Jb-xester-14221"))()
    end
)

createbutton(
    "human hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/human.luau"))()
    end
)

createbutton(
    "clovr",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-FE-Fake-VR-45999"))()
    end
)

end
task.spawn(C_5)
local function C_b()
    local script = LMG2L["LocalScript_b"]
    script.Parent.MouseButton1Click:Connect(
        function()
            script.Parent.Parent.Parent.Parent:Destroy()
        end
    )
end
task.spawn(C_b)

return LMG2L["ScreenGui_1"], require
