print("cracked script(enter any crap into the key and click check key)")
print("join me discord if you want more cracks: https://discord.gg/URkdsN7xdy")
setclipboard("https://discord.gg/URkdsN7xdy")
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "cracked by thewiiufan",
	Text = "@riplagardoz on dc"
})
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "discord invite",
	Text = "join the server for more cracks"
})
local v1, v2 = pcall(function()
    return identifyexecutor()
end)
local vu3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
if vu3 then
    vu3 = vu3.Notify
end
local function v9(pu4, pu5, pu6)
	-- upvalues: (ref) vu3
    local v7, v8 = pcall(function()
		-- upvalues: (ref) vu3, (ref) pu5, (ref) pu4, (ref) pu6
        if vu3 then
            vu3({
                ["Description"] = pu5,
                ["Title"] = pu4,
                ["Duration"] = pu6
            })
        else
            warn("Notify function is not available.")
        end
    end)
    if not v7 then
        warn("Failed to send notification: " .. tostring(v8))
    end
end
if v1 and v2 then
    print("========================================")
    print("      Venox Hub detected: " .. v2)
    print("========================================\n")
    print("If nothing loads up, your executor is either not supported or there is an error!")
    print("Join discord.gg/venoxhub to report it or use a different executor.\n")
    v9("Venox Hub", "Detected " .. v2, 5)
else
    warn("========================================")
    warn("    Venox Hub: No executor identified.")
    warn("========================================\n")
    warn("Your executor might not be supported. Consider changing your executor if needed. or your executor just simply doesn\'t support identifyexecutor()\n")
    v9("Venox Hub", "No Executor identified. might not be supported", 5)
end
local vu10 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))().Notify
local v11 = print
local v12 = warn
function print()
end
function warn()
end
local vu13 = game:GetService("HttpService")
local vu14 = {}
local function vu17(p15)
    local v16
    if type(p15) ~= "string" then
        v16 = false
    else
        v16 = p15:match("^VENOXHUB_[0-9a-fA-F]+$")
    end
    return v16
end
local function vu18()
	-- upvalues: (ref) vu13
    return "pandadev_" .. vu13:GenerateGUID(false):gsub("-", "")
end
local vu19 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/refs/heads/main/library/LuaLib/ROBLOX/PandaSVALLib.lua"))()
function vu14.Initialize(_, p20)
	-- upvalues: (ref) vu19
    if not p20 or type(p20) ~= "table" then
        error("Invalid configuration")
    end
    if not p20.Service or type(p20.Service) ~= "string" then
        error("Invalid Service identifier")
    end
    if not p20.API_Key or type(p20.API_Key) ~= "string" then
        error("Invalid API Key")
    end
    return vu19:Initialize(p20)
end
function vu14.ValidateKey(_, p21)
	-- upvalues: (ref) vu17, (ref) vu19, (ref) vu18
    if not p21 or type(p21) ~= "string" then
        return false
    end
    if not vu17(p21) then
        warn("cracked ez by @riplagardoz on dc")
        return false
    end
    if not vu19:ValidateKey(vu18()) then
        return vu19:ValidateKey(p21)
    end
    warn("Potential tampering detected: Random key match")
    return false
end
function vu14.GetKey(_)
	-- upvalues: (ref) vu19
    print(vu19:GetKey())
    return vu19:GetKey()
end
local v22 = vu14
vu14.Initialize(v22, {
    ["Service"] = "venoxhub",
    ["API_Key"] = "vitZQ7LbnGOxcfXQ",
    ["DisplayName"] = "My Panda Service",
    ["HardwareID"] = "ClientID",
    ["IsDebug"] = true,
    ["Discord_InvServer"] = "venoxhub",
    ["Allow_BlacklistUsers"] = false,
    ["Save_Key"] = true,
    ["DiagnosticLogs"] = true,
    ["GUIVersion"] = false,
    ["EnableWebhook"] = false,
    ["Webhook_URL"] = "https://yourwebhook.url",
    ["Authenticated"] = function()
        print("[VENOX HUB] Key authenticated successfully! Access granted.")
    end,
    ["NotAuthenticated"] = function()
        print("[VENOX HUB] Authentication failed. Access denied.")
    end
})
local function vu26(p23, p24, p25)
	-- upvalues: (ref) vu10
    vu10({
        ["Description"] = p24,
        ["Title"] = p23,
        ["Duration"] = p25
    })
end
function f1M6Z3W()
    return string.gsub(game:GetService("RbxAnalyticsService"):GetClientId(), "-", "")
end
print = v11
warn = v12
local vu27 = {
    ["venoxLoader"] = Instance.new("ScreenGui"),
    ["MainFrame"] = Instance.new("Frame"),
    ["UICorner"] = Instance.new("UICorner"),
    ["CloseButton"] = Instance.new("TextButton"),
    ["TitleLabel"] = Instance.new("TextLabel"),
    ["SubtitleLabel"] = Instance.new("TextLabel"),
    ["input_field"] = Instance.new("TextBox"),
    ["info_label"] = Instance.new("TextLabel"),
    ["check_key"] = Instance.new("TextButton"),
    ["discord_button"] = Instance.new("TextButton"),
    ["get_key"] = Instance.new("TextButton"),
    ["credits_label"] = Instance.new("TextLabel")
}
vu27.venoxLoader.Name = "venoxhub_loader"
vu27.venoxLoader.Parent = gethui()
vu27.MainFrame.Size = UDim2.new(0, 500, 0, 360)
vu27.MainFrame.Position = UDim2.new(0.5, - 250, 0.5, - 180)
vu27.MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
vu27.MainFrame.BorderSizePixel = 0
vu27.MainFrame.Parent = vu27.venoxLoader
vu27.UICorner.CornerRadius = UDim.new(0, 8)
vu27.UICorner.Parent = vu27.MainFrame
vu27.CloseButton.Text = "x"
vu27.CloseButton.Size = UDim2.new(0, 30, 0, 30)
vu27.CloseButton.Position = UDim2.new(1, - 40, 0, 10)
vu27.CloseButton.BackgroundTransparency = 1
vu27.CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
vu27.CloseButton.TextSize = 20
vu27.CloseButton.Font = Enum.Font.GothamSemibold
vu27.CloseButton.Parent = vu27.MainFrame
vu27.TitleLabel.Text = "Venox Hub | Keysystem FIXED!!!"
vu27.TitleLabel.Font = Enum.Font.GothamBold
vu27.TitleLabel.TextSize = 24
vu27.TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
vu27.TitleLabel.Size = UDim2.new(1, 0, 0, 30)
vu27.TitleLabel.Position = UDim2.new(0, 0, 0.15, 0)
vu27.TitleLabel.BackgroundTransparency = 1
vu27.TitleLabel.Parent = vu27.MainFrame
vu27.SubtitleLabel.Text = "Enter your key to access Venox Hub."
vu27.SubtitleLabel.Font = Enum.Font.Gotham
vu27.SubtitleLabel.TextSize = 14
vu27.SubtitleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
vu27.SubtitleLabel.Size = UDim2.new(1, 0, 0, 20)
vu27.SubtitleLabel.Position = UDim2.new(0, 0, 0.25, 0)
vu27.SubtitleLabel.BackgroundTransparency = 1
vu27.SubtitleLabel.Parent = vu27.MainFrame
vu27.input_field.Text = ""
vu27.input_field.PlaceholderText = "Enter your key"
vu27.input_field.Size = UDim2.new(0.8, 0, 0, 40)
vu27.input_field.Position = UDim2.new(0.1, 0, 0.35, 0)
vu27.input_field.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
vu27.input_field.TextColor3 = Color3.fromRGB(230, 230, 230)
vu27.input_field.Font = Enum.Font.Gotham
vu27.input_field.TextSize = 14
vu27.input_field.BorderSizePixel = 0
vu27.input_field.Parent = vu27.MainFrame
local v28 = Instance.new("UICorner")
v28.CornerRadius = UDim.new(0, 6)
v28.Parent = vu27.input_field
vu27.info_label.Text = "Tired of Keysystem? You can also buy Premium on Discord!\n You had premium? dm me to get it back bc of new keysystem!"
vu27.info_label.Font = Enum.Font.Gotham
vu27.info_label.TextSize = 12
vu27.info_label.TextColor3 = Color3.fromRGB(180, 180, 180)
vu27.info_label.Size = UDim2.new(0.8, 0, 0, 30)
vu27.info_label.Position = UDim2.new(0.1, 0, 0.47, 0)
vu27.info_label.BackgroundTransparency = 1
vu27.info_label.TextWrapped = true
vu27.info_label.Parent = vu27.MainFrame
vu27.check_key.Text = "Check Key"
vu27.check_key.Size = UDim2.new(0.38, 0, 0, 40)
vu27.check_key.Position = UDim2.new(0.1, 0, 0.6, 0)
vu27.check_key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu27.check_key.TextColor3 = Color3.fromRGB(12, 12, 12)
vu27.check_key.Font = Enum.Font.Gotham
vu27.check_key.TextSize = 14
vu27.check_key.Parent = vu27.MainFrame
local v29 = Instance.new("UICorner")
v29.CornerRadius = UDim.new(0, 6)
v29.Parent = vu27.check_key
vu27.discord_button.Text = "Join Discord"
vu27.discord_button.Size = UDim2.new(0.38, 0, 0, 40)
vu27.discord_button.Position = UDim2.new(0.52, 0, 0.6, 0)
vu27.discord_button.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
vu27.discord_button.TextColor3 = Color3.fromRGB(230, 230, 230)
vu27.discord_button.Font = Enum.Font.Gotham
vu27.discord_button.TextSize = 14
vu27.discord_button.BorderSizePixel = 0
vu27.discord_button.Parent = vu27.MainFrame
local v30 = Instance.new("UICorner")
v30.CornerRadius = UDim.new(0, 6)
v30.Parent = vu27.discord_button
vu27.get_key.Text = "Get Key"
vu27.get_key.Size = UDim2.new(0.8, 0, 0, 40)
vu27.get_key.Position = UDim2.new(0.1, 0, 0.75, 0)
vu27.get_key.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
vu27.get_key.TextColor3 = Color3.fromRGB(230, 230, 230)
vu27.get_key.Font = Enum.Font.Gotham
vu27.get_key.TextSize = 14
vu27.get_key.BorderSizePixel = 0
vu27.get_key.Parent = vu27.MainFrame
local v31 = Instance.new("UICorner")
v31.CornerRadius = UDim.new(0, 6)
v31.Parent = vu27.get_key
vu27.credits_label = Instance.new("TextLabel")
vu27.credits_label.Text = "by <b>venox.w</b>"
vu27.credits_label.Font = Enum.Font.Gotham
vu27.credits_label.TextSize = 12
vu27.credits_label.TextColor3 = Color3.fromRGB(180, 180, 180)
vu27.credits_label.Size = UDim2.new(0.8, 0, 0, 20)
vu27.credits_label.Position = UDim2.new(0.1, 0, 0.9, 0)
vu27.credits_label.BackgroundTransparency = 1
vu27.credits_label.TextWrapped = true
vu27.credits_label.RichText = true
vu27.credits_label.Parent = vu27.MainFrame
local v32 = game:GetService("UserInputService")
local vu33 = nil
local vu34 = nil
local vu35 = nil
local vu36 = nil
local function vu39(p37)
	-- upvalues: (ref) vu35, (ref) vu27, (ref) vu36
    local v38 = p37.Position - vu35
    vu27.MainFrame.Position = UDim2.new(vu36.X.Scale, vu36.X.Offset + v38.X, vu36.Y.Scale, vu36.Y.Offset + v38.Y)
end
vu27.MainFrame.InputBegan:Connect(function(pu40)
	-- upvalues: (ref) vu33, (ref) vu35, (ref) vu36, (ref) vu27
    if pu40.UserInputType == Enum.UserInputType.MouseButton1 or pu40.UserInputType == Enum.UserInputType.Touch then
        vu33 = true
        vu35 = pu40.Position
        vu36 = vu27.MainFrame.Position
        pu40.Changed:Connect(function()
			-- upvalues: (ref) pu40, (ref) vu33
            if pu40.UserInputState == Enum.UserInputState.End then
                vu33 = false
            end
        end)
    end
end)
vu27.MainFrame.InputChanged:Connect(function(p41)
	-- upvalues: (ref) vu34
    if p41.UserInputType == Enum.UserInputType.MouseMovement or p41.UserInputType == Enum.UserInputType.Touch then
        vu34 = p41
    end
end)
v32.InputChanged:Connect(function(p42)
	-- upvalues: (ref) vu34, (ref) vu33, (ref) vu39
    if p42 == vu34 and vu33 then
        vu39(p42)
    end
end)
vu27.CloseButton.MouseButton1Click:Connect(function()
	-- upvalues: (ref) vu27
    vu27.venoxLoader:Destroy()
end)
local vu43 = "X4Rhrzemyq"
vu27.discord_button.MouseButton1Click:Connect(function()
	-- upvalues: (ref) vu26, (ref) vu43
    local v44 = not (setclipboard or toclipboard) and (not set_clipboard and Clipboard)
    if v44 then
        v44 = Clipboard.set
    end
    if v44 then
        vu26("venox Hub", "discord link copied", 4)
        v44("https://discord.gg/" .. vu43)
    end
    local v45 = game:GetService("HttpService")
    local v46 = not http_request and (not (request or syn and syn.request) and (not (fluxus and fluxus.request) and http))
    if v46 then
        v46 = http.request
    end
    request2 = v46
    if request2 then
        request2({
            ["Url"] = "http://127.0.0.1:6463/rpc?v=1",
            ["Method"] = "POST",
            ["Headers"] = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            ["Body"] = v45:JSONEncode({
                ["cmd"] = "INVITE_BROWSER",
                ["nonce"] = v45:GenerateGUID(false),
                ["args"] = {
                    ["code"] = vu43
                }
            })
        })
    end
end)
vu27.get_key.MouseButton1Click:Connect(function()
	-- upvalues: (ref) vu14, (ref) vu26
    local v47 = vu14.GetKey()
    setclipboard(v47)
    vu26("Venox Hub", "Key Link Copied!", 4)
end)
local function vu48()
	-- upvalues: (ref) vu26
    warn("========== Venox Hub ==========\n            ERROR: KEY IS INVALID!\n            ===============================\n")
    vu26("Venox Hub", "Key Invalid!   \n(make sure to remove spaces at the end!)", 4)
end
local function vu50(p49)
	-- upvalues: (ref) vu26
    warn("========== Venox Hub ============" .. "\n" .. (p49 and "            SUCCESS: Detected Premium User!\n                 loading script....!" or "            SUCCESS: Detected Free User!\n                 loading script....!") .. "\n            =================================\n")
    vu26("Venox Hub", "Key Valid!", 4)
end
function x1Y9P4R(p51)
	-- upvalues: (ref) vu14
    function print()
    end
    wait(1)
    local v52 = vu14:ValidateKey(p51)
    print(v52)
    getgenv().s6Cuu6sES = v52
    getgenv().pe75UjfuKY = false
    if getgenv().s6Cuu6sES then
        return getgenv().s6Cuu6sES and true or false
    else
        return true --always return true (crack lol)
    end
end
function v4C6S9U(p53, p54, p55)
	-- upvalues: (ref) vu26, (ref) vu43
    local function v57(p56)
        return type(p56) == "boolean"
    end
    if readfile("Venox Hub/savedkey.txt") ~= "25msWasHere" then
        if not p55 ~= "0xZ8Y7X6W5V4U3T2S1R0Q9P8O7N6M5L4K3J2I1H0G9F8E7D6C5B4A3B2C1" then
            if v57(p55) or type(p55) == "number" then
                return
            elseif p53 == nil or (p54 == nil or (p55 == nil or not (v57(p53) and v57(p54)))) then
                print("Don\'t bypass keysystem! Mistake? Report on Discord")
                return
            else
                print("All checks passed. Proceeding with loading Venox Hub!.")
                vu26("Venox Hub", "Welcome to Venox Hub!", 4)
                if loadstring(game:HttpGet("https://pastebin.com/raw/7d9VTLGQ"))()("v1.2") then
                    print("You are using the latest version of Venox Hub!")
                    local vu58 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
                    local v59 = vu58
                    local vu60 = vu58.CreateWindow(v59, {
                        ["Title"] = "Venox Hub ",
                        ["SubTitle"] = "by venox",
                        ["TabWidth"] = 160,
                        ["Size"] = UDim2.fromOffset(700, 350),
                        ["Acrylic"] = false,
                        ["Theme"] = "Darker",
                        ["Transparency"] = false,
                        ["MinimizeKey"] = Enum.KeyCode.LeftControl
                    })
                    local v61 = {}
                    local v62 = vu60
                    v61.Main = vu60.AddTab(v62, {
                        ["Title"] = "Choose Scripts Displaying",
                        ["Icon"] = ""
                    })
                    v61.Main:AddParagraph({
                        ["Title"] = "Here you can Decide to Show all scripts or only those for your current game.",
                        ["Content"] = ""
                    })
                    v61.Main:AddButton({
                        ["Title"] = "Choose!",
                        ["Description"] = "Either display all script or just the scripts for you current game!",
                        ["Callback"] = function()
							-- upvalues: (ref) vu60, (ref) vu58
                            vu60:Dialog({
                                ["Title"] = "Choose one!",
                                ["Content"] = "It will still show the Universal Tabs etc. just not every single Game Tab! ",
                                ["Buttons"] = {
                                    {
                                        ["Title"] = "Show All Scripts",
                                        ["Callback"] = function()
											-- upvalues: (ref) vu58
                                            spawn(function()
                                                loadvenoxhub_a6Hv5s()
                                            end)
                                            wait(0.1)
                                            vu58:Destroy()
                                            getgenv().showAllGameTabs = true
                                        end
                                    },
                                    {
                                        ["Title"] = "Display Scripts for current Game ",
                                        ["Callback"] = function()
											-- upvalues: (ref) vu58
                                            spawn(function()
                                                loadvenoxhub_a6Hv5s()
                                            end)
                                            wait(0.1)
                                            vu58:Destroy()
                                            getgenv().showAllGameTabs = false
                                        end
                                    }
                                }
                            })
                        end
                    })
                    local v63 = vu58
                    vu58.Notify(v63, {
                        ["Title"] = "Choose Script Displaying!",
                        ["Content"] = "Venox Hub",
                        ["SubContent"] = "SubContent",
                        ["Duration"] = 5
                    })
                    function loadvenoxhub_a6Hv5s()
						-- upvalues: (ref) vu43, (ref) vu26
                        if not loadstring(game:HttpGet("https://sirius.menu/rayfield"))() then
                            print("Failed to load Rayfield library")
                        end
                        setclipboard("https://discord.com/invite/" .. vu43)
                        local vu64 = nil
                        local vu65 = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
                        local vu66 = vu65:CreateWindow({
                            ["Name"] = "Venox Hub | v2.1.3b | " .. identifyexecutor(),
                            ["LoadingTitle"] = "Venox Hub",
                            ["LoadingSubtitle"] = "by venox.w",
                            ["ConfigurationSaving"] = {
                                ["Enabled"] = false,
                                ["FolderName"] = "Venox Hub",
                                ["FileName"] = "venoxcfg"
                            },
                            ["Discord"] = {
                                ["Enabled"] = true,
                                ["Invite"] = vu43,
                                ["RememberJoins"] = false
                            },
                            ["KeySystem"] = false,
                            ["KeySettings"] = {
                                ["Title"] = "Keylink has been copied!",
                                ["Subtitle"] = "U will need to use my bot on my server to get the key!",
                                ["Note"] = "get key on my dc server~!",
                                ["FileName"] = "venoxkey2",
                                ["SaveKey"] = false,
                                ["GrabKeyFromSite"] = false,
                                ["Key"] = {
                                    "VenoxKeyW23"
                                }
                            }
                        })
                        if getgenv().showAllGameTabs == false then
                            vu65:Notify({
                                ["Title"] = "Game wont show? Try \'Show all scripts\'!",
                                ["Content"] = "Venox Hub | by venox",
                                ["Duration"] = 6.5,
                                ["Image"] = 4483362458,
                                ["Actions"] = {
                                    ["Ignore"] = {
                                        ["Name"] = "OK!",
                                        ["Callback"] = function()
                                        end
                                    }
                                }
                            })
                        end
                        vu65:Notify({
                            ["Title"] = "Venox Hub",
                            ["Content"] = "YO! New Cheap Premium Keys out!",
                            ["Duration"] = 6.5,
                            ["Image"] = 4483362458,
                            ["Actions"] = {
                                ["Ignore"] = {
                                    ["Name"] = "OK Where?!",
                                    ["Callback"] = function()
										-- upvalues: (ref) vu65
                                        local v67 = vu65
                                        local v68 = v67.Notify
                                        local v69 = {
                                            ["Title"] = "Venox Hub",
                                            ["Content"] = "copy link here!",
                                            ["Duration"] = 6.5,
                                            ["Image"] = 4483362458
                                        }
                                        local v70 = {
                                            ["Ignore"] = {
                                                ["Name"] = "Copy Store Link!",
                                                ["Callback"] = function()
                                                    setclipboard("https://venox.mysellauth.com")
                                                end
                                            }
                                        }
                                        v69.Actions = v70
                                        v68(v67, v69)
                                    end
                                }
                            }
                        })
                        print("successfully authenticated")
                        print("Loading Venox Hub.....")
                        local v71 = os.clock()
                        local v243, v244 = pcall(function()
							-- upvalues: (ref) vu66, (ref) vu64, (ref) vu65, (ref) vu43, (ref) vu26
                            getgenv().gameTabsOrder = {15338697306,6678877691,6708206173,4580204640,17218259625,18667984660,8286149869,15610971848,14259168147,13379208636,621129760,11729688377,17017769292,8689257920,15705682243,17802321647,16436007861,12411473842,17797153512,6737970321,2474168535,11145865512,13621938427,2248408710,147848991,18269063971,11158043705,137885680,3527629287,335760407,5993942214,15885874861,13822889,11912525919,13997018456,11630038968,6897167394,15092647980,17534163435,4855457388,1537690962,4972091010,6961824067,4620170611,6243699076,9224601490,16524008257,16560655288,698448212,1137431029,11454403177,17390083917,15002061926,8908228901,3623096087,9791603388,4623386862,2768379856,6884319169,13864661000,15532962292,12828227139,17625359962,14363263080,6847090259,14067600077,606849621,15535115259,10449761463,4566572536,654732683,17698425045,155615604,277751860,13253735473,2377868063,11400511154,16389395869,9872472334,17524285289,14181236474,8204899140,2788229376,14044547200,4924922222,2753915549,9772878203,13775256536,17387475546,14518422161,2866967438,286090429,16426795556,13127800756,4520749081,3351674303,8260276694,13083893317,7305309231,6516141723,1554960397,3233893879,6229116934,17461365630,1240123653,10919241870,5950733731,17601705136,12355337193,5171347293,8737899170,142823291,16819979927,3101667897,16658453804,228181322,4490140733,13772394625,292439477,920587237,6403373529,9391468976,5938036553,537413528,17450551531,3956818381,9285238704,15535115259,13698105873,8396586868,16480898254,6447798030,4588604953,3214114884,281489669,1962086868,2210085102,301549746,185655149,893973440,14202073004,6872265039}
                            local v72 = {[15338697306] = {
                                    ["tabName"] = "GKRS",
                                    ["tabTitle"] = "Go Kart Race Simulator"
                                },[6678877691] = {
                                    ["tabName"] = "zosamurai",
                                    ["tabTitle"] = "ZO SAMURAI SF"
                                },[6708206173] = {
                                    ["tabName"] = "RateMyAvatar",
                                    ["tabTitle"] = "Rate My Avatar"
                                },[4580204640] = {
                                    ["tabName"] = "SurviveTheKiller",
                                    ["tabTitle"] = "Survive the Killer!"
                                },[17218259625] = {
                                    ["tabName"] = "whosthespy",
                                    ["tabTitle"] = "Who\'s the Spy?"
                                },[18667984660] = {
                                    ["tabName"] = "FlexYourFPS",
                                    ["tabTitle"] = "Flex Your FPS!"
                                },[8286149869] = {
                                    ["tabName"] = "therapy",
                                    ["tabTitle"] = "therapy"
                                },[15610971848] = {
                                    ["tabName"] = "STSim",
                                    ["tabTitle"] = "Sword Training Simulator"
                                },[14259168147] = {
                                    ["tabName"] = "BasketballLegends",
                                    ["tabTitle"] = "Basketball-Legends"
                                },[13379208636] = {
                                    ["tabName"] = "AOTRevo",
                                    ["tabTitle"] = "Attack on Titan Revolution"
                                },[621129760] = {
                                    ["tabName"] = "kat",
                                    ["tabTitle"] = "KAT"
                                },[11729688377] = {
                                    ["tabName"] = "BoogaBoogaREBORN",
                                    ["tabTitle"] = "Booga Booga [REBORN]"
                                },[17017769292] = {
                                    ["tabName"] = "AnimeDefenders",
                                    ["tabTitle"] = "Anime Defenders"
                                },[8689257920] = {
                                    ["tabName"] = "LifeinPrison",
                                    ["tabTitle"] = "Life in Prison"
                                },[15705682243] = {
                                    ["tabName"] = "TappingLegendsFinal",
                                    ["tabTitle"] = "Tapping Legends Final"
                                },[17802321647] = {
                                    ["tabName"] = "CloseYourEyes",
                                    ["tabTitle"] = "Close Your Eyes"
                                },[16436007861] = {
                                    ["tabName"] = "WarriorSimulator",
                                    ["tabTitle"] = "Warrior Simulator"
                                },[12411473842] = {
                                    ["tabName"] = "Pressure",
                                    ["tabTitle"] = "Pressure"
                                },[17797153512] = {
                                    ["tabName"] = "BRQUIZFreaky",
                                    ["tabTitle"] = "BRAINROT Quiz Freaky"
                                },[6737970321] = {
                                    ["tabName"] = "LivetopiaTownHall",
                                    ["tabTitle"] = "Livetopia Town Hall"
                                },[2474168535] = {
                                    ["tabName"] = "westbound",
                                    ["tabTitle"] = "Westbound"
                                },[11145865512] = {
                                    ["tabName"] = "CarDrivingUltimate",
                                    ["tabTitle"] = "Car Driving Ultimate"
                                },[13621938427] = {
                                    ["tabName"] = "untitledboxinggame",
                                    ["tabTitle"] = "Untitled Boxing Game"
                                },[2248408710] = {
                                    ["tabName"] = "DestructionSimulator",
                                    ["tabTitle"] = "Destruction-Simulator"
                                },[147848991] = {
                                    ["tabName"] = "beaparkourninja",
                                    ["tabTitle"] = "Be A Parkour Ninja"
                                },[18269063971] = {
                                    ["tabName"] = "FTNLC",
                                    ["tabTitle"] = "Feed The Noob Like Crazy"
                                },[11158043705] = {
                                    ["tabName"] = "Baddies",
                                    ["tabTitle"] = "Baddies"
                                },[137885680] = {
                                    ["tabName"] = "ZombieRush",
                                    ["tabTitle"] = "Zombie-Rush"
                                },[3527629287] = {
                                    ["tabName"] = "BIGPaintball1",
                                    ["tabTitle"] = "BIG Paintball Classic"
                                },[335760407] = {
                                    ["tabName"] = "TPS_StreetSoccer",
                                    ["tabTitle"] = "TPS: Street Soccer",
                                    ["GameId"] = 124283622
                                },[5993942214] = {
                                    ["tabName"] = "RushPoint",
                                    ["tabTitle"] = "Rush Point",
                                    ["GameId"] = 2162282815
                                },[15885874861] = {
                                    ["tabName"] = "eatslimetogethuge",
                                    ["tabTitle"] = "eat slime to get huge",
                                    ["GameId"] = 5493012775
                                },[13822889] = {
                                    ["tabName"] = "LumberTycoon2",
                                    ["tabTitle"] = "Lumber-Tycoon-2"
                                },[11912525919] = {
                                    ["tabName"] = "ESYG1SBYOaBike",
                                    ["tabTitle"] = "+1 Speed But On a Bike",
                                    ["GameId"] = 5663142217
                                },[13997018456] = {
                                    ["tabName"] = "OperationsSiege",
                                    ["tabTitle"] = "Operations-Siege"
                                },[11630038968] = {
                                    ["tabName"] = "BridgeDuels",
                                    ["tabTitle"] = "Bridge Duels",
                                    ["GameId"] = 4124008017
                                },[6897167394] = {
                                    ["tabName"] = "DemonPiece",
                                    ["tabTitle"] = "Demon Piece",
                                    ["GameId"] = 2633076999
                                },[15092647980] = {
                                    ["tabName"] = "ProjectSmash",
                                    ["tabTitle"] = "Project Smash",
                                    ["GameId"] = 5200655965
                                },[17534163435] = {
                                    ["tabName"] = "DungeonRNG",
                                    ["tabTitle"] = "Dungeon RNG",
                                    ["GameId"] = 6002149925
                                },[4855457388] = {
                                    ["tabName"] = "DemonFall",
                                    ["tabTitle"] = "Demon Fall",
                                    ["GameId"] = 1650291138
                                },[1537690962] = {
                                    ["tabName"] = "BeeSwarmSim",
                                    ["tabTitle"] = "Bee Swarm Simulator"
                                },[4972091010] = {
                                    ["tabName"] = "ZombieUprising",
                                    ["tabTitle"] = "Zombie Uprising",
                                    ["GameId"] = 1709832923
                                },[17698425045] = {
                                    ["tabName"] = "fightinaschool",
                                    ["tabTitle"] = "fight in a school",
                                    ["GameId"] = 6061766680
                                },[16819979927] = {
                                    ["tabName"] = "JimsRNG",
                                    ["tabTitle"] = "Jim\'s RNG",
                                    ["GameId"] = 5780359296
                                },[228181322] = {
                                    ["tabName"] = "DinosaurSimulator",
                                    ["tabTitle"] = "Dinosaur Simulator",
                                    ["GameId"] = 98839997
                                },[281489669] = {
                                    ["tabName"] = "WizardTycoon2Player",
                                    ["tabTitle"] = "Wizard Tycoon - 2 Player",
                                    ["GameId"] = 110988953
                                },[4620170611] = {
                                    ["tabName"] = "BreakIn1",
                                    ["tabTitle"] = "Break In 1",
                                    ["GameId"] = 1318971886
                                },[9772878203] = {
                                    ["tabName"] = "raiseafloppa2",
                                    ["tabTitle"] = "raise a floppa 2",
                                    ["GameId"] = 3620011279
                                },[11400511154] = {
                                    ["tabName"] = "MonkeyTycoon",
                                    ["tabTitle"] = "Monkey Tycoon",
                                    ["GameId"] = 4055984814
                                },[1554960397] = {
                                    ["tabName"] = "CarDealershipTycoon",
                                    ["tabTitle"] = "Car Dealership Tycoon",
                                    ["GameId"] = 605887098
                                },[9391468976] = {
                                    ["tabName"] = "JujutsuShenanigans",
                                    ["tabTitle"] = "Jujutsu Shenanigans",
                                    ["GameId"] = 3508322461
                                },[6961824067] = {
                                    ["tabName"] = "FlingThingsandPeople",
                                    ["tabTitle"] = "Fling Things and People",
                                    ["GameId"] = 2668101271
                                },[17387475546] = {
                                    ["tabName"] = "ProjectSlayer",
                                    ["tabTitle"] = "Project Slayer",
                                    ["GameId"] = 2142948266
                                },[7305309231] = {
                                    ["tabName"] = "TaxiBoss",
                                    ["tabTitle"] = "Taxi Boss"
                                },[11454403177] = {
                                    ["tabName"] = "CRDS",
                                    ["tabTitle"] = "Cart Ride Delivery Service"
                                },[9285238704] = {
                                    ["tabName"] = "RaceClicker",
                                    ["tabTitle"] = "Race Clicker"
                                },[14067600077] = {
                                    ["tabName"] = "Typesoul",
                                    ["tabTitle"] = "Type soul"
                                },[16560655288] = {
                                    ["tabName"] = "PillarChase2",
                                    ["tabTitle"] = "Pillar Chase 2"
                                },[8260276694] = {
                                    ["tabName"] = "AbilityWars",
                                    ["tabTitle"] = "Ability Wars"
                                },[8396586868] = {
                                    ["tabName"] = "AOPG",
                                    ["tabTitle"] = "A One Piece game"
                                },[14363263080] = {
                                    ["tabName"] = "Dungeonquest",
                                    ["tabTitle"] = "Dungeon quest"
                                },[3233893879] = {
                                    ["tabName"] = "BadBusiness",
                                    ["tabTitle"] = "Bad Business"
                                },[6447798030] = {
                                    ["tabName"] = "funkyfriday",
                                    ["tabTitle"] = "funky friday"
                                },[698448212] = {
                                    ["tabName"] = "RoBeats",
                                    ["tabTitle"] = "RoBeats"
                                },[2210085102] = {
                                    ["tabName"] = "NavalWarfare",
                                    ["tabTitle"] = "Naval Warfare"
                                },[9791603388] = {
                                    ["tabName"] = "undergroundwar2",
                                    ["tabTitle"] = "underground war 2.0"
                                },[893973440] = {
                                    ["tabName"] = "fleethefacility",
                                    ["tabTitle"] = "flee the facility"
                                },[5171347293] = {
                                    ["tabName"] = "CabinCrewSimulator",
                                    ["tabTitle"] = "Cabin Crew Simulator"
                                },[1137431029] = {
                                    ["tabName"] = "CarDrivingSimulator",
                                    ["tabTitle"] = "Car Driving Simulator"
                                },[10919241870] = {
                                    ["tabName"] = "RarityFactoryTycoon",
                                    ["tabTitle"] = "Rarity Factory Tycoon"
                                },[17625359962] = {
                                    ["tabName"] = "Rivals",
                                    ["tabTitle"] = "Rivals"
                                },[14202073004] = {
                                    ["tabName"] = "UnnamedShooter",
                                    ["tabTitle"] = "Unnamed-Shooter"
                                },[17524285289] = {
                                    ["tabName"] = "ScytheSim",
                                    ["tabTitle"] = "ScytheSim"
                                },[277751860] = {
                                    ["tabName"] = "EpicMinigames",
                                    ["tabTitle"] = "EpicMinigames"
                                },[6229116934] = {
                                    ["tabName"] = "Hoopz",
                                    ["tabTitle"] = "Hoopz"
                                },[16426795556] = {
                                    ["tabName"] = "TrackFieldInfinite",
                                    ["tabTitle"] = "Track-Field-Infinite"
                                },[8204899140] = {
                                    ["tabName"] = "FootballFusion2",
                                    ["tabTitle"] = "Football Fusion 2"
                                },[4588604953] = {
                                    ["tabName"] = "criminality",
                                    ["tabTitle"] = "Criminality"
                                },[16480898254] = {
                                    ["tabName"] = "eattheworld",
                                    ["tabTitle"] = "Eat The World"
                                },[3214114884] = {
                                    ["tabName"] = "flagwars",
                                    ["tabTitle"] = "Flag Wars"
                                },[14518422161] = {
                                    ["tabName"] = "gunfightarena",
                                    ["tabTitle"] = "Gun Fight Arena "
                                },[6884319169] = {
                                    ["tabName"] = "micup",
                                    ["tabTitle"] = "Mic Up"
                                },[14044547200] = {
                                    ["tabName"] = "recodeuntitledtaggame",
                                    ["tabTitle"] = "Recode Untitled Tag Game"
                                },[13253735473] = {
                                    ["tabName"] = "tridentsurvival",
                                    ["tabTitle"] = "Trident Survival"
                                },[4490140733] = {
                                    ["tabName"] = "myrestaurant",
                                    ["tabTitle"] = "My Restaurant"
                                },[12828227139] = {
                                    ["tabName"] = "warmachines",
                                    ["tabTitle"] = "War Machines"
                                },[292439477] = {
                                    ["tabName"] = "phantomforce",
                                    ["tabTitle"] = "Phantom Force"
                                },[17601705136] = {
                                    ["tabName"] = "tycoonrng",
                                    ["tabTitle"] = "Tycoon RNG"
                                },[3623096087] = {
                                    ["tabName"] = "musclelegends",
                                    ["tabTitle"] = "Muscle Legends"
                                },[17450551531] = {
                                    ["tabName"] = "gymleague",
                                    ["tabTitle"] = "Gym League"
                                },[6403373529] = {
                                    ["tabName"] = "slapbattle",
                                    ["tabTitle"] = "Slap Battle"
                                },[14181236474] = {
                                    ["tabName"] = "monsterbattlesim",
                                    ["tabTitle"] = "Monster Battle Sim"
                                },[920587237] = {
                                    ["tabName"] = "adoptme",
                                    ["tabTitle"] = "Adopt Me"
                                },[13083893317] = {
                                    ["tabName"] = "lifesentence",
                                    ["tabTitle"] = "ESCAPING Life Sentence"
                                },[15535115259] = {
                                    ["tabName"] = "launchintospace",
                                    ["tabTitle"] = "Launch Into Space Sim"
                                },[654732683] = {
                                    ["tabName"] = "carcrusher2",
                                    ["tabTitle"] = "Car Crusher 2"
                                },[3956818381] = {
                                    ["tabName"] = "ninjalegends",
                                    ["tabTitle"] = "Ninja Legends"
                                },[5938036553] = {
                                    ["tabName"] = "frontlines",
                                    ["tabTitle"] = "Frontlines"
                                },[9224601490] = {
                                    ["tabName"] = "fruitbg",
                                    ["tabTitle"] = "Fruit Battleground"
                                },[3101667897] = {
                                    ["tabName"] = "legendofspeed",
                                    ["tabTitle"] = "Legend of Speed"
                                },[17390083917] = {
                                    ["tabName"] = "bettermusic",
                                    ["tabTitle"] = "Better Music"
                                },[17461365630] = {
                                    ["tabName"] = "adminrng",
                                    ["tabTitle"] = "Admin RNG"
                                },[1240123653] = {
                                    ["tabName"] = "zombieattack",
                                    ["tabTitle"] = "Zombie Attack"
                                },[6847090259] = {
                                    ["tabName"] = "bulkup",
                                    ["tabTitle"] = "Bulked Up"
                                },[4623386862] = {
                                    ["tabName"] = "piggy",
                                    ["tabTitle"] = "Piggy"
                                },[6243699076] = {
                                    ["tabName"] = "mimic",
                                    ["tabTitle"] = "Mimic"
                                },[12355337193] = {
                                    ["tabName"] = "mVs",
                                    ["tabTitle"] = "Murder Vs Sheriff"
                                },[15532962292] = {
                                    ["tabName"] = "solsrng",
                                    ["tabTitle"] = "Sol\'s RNG"
                                },[16524008257] = {
                                    ["tabName"] = "animerng",
                                    ["tabTitle"] = "Anime RNG"
                                },[5950733731] = {
                                    ["tabName"] = "ragdollengine",
                                    ["tabTitle"] = "Ragdoll Engine "
                                },[4566572536] = {
                                    ["tabName"] = "vehiclelegend",
                                    ["tabTitle"] = "Vehicle Legends"
                                },[13698105873] = {
                                    ["tabName"] = "bathroomattack",
                                    ["tabTitle"] = "Bathroom Attack"
                                },[1962086868] = {
                                    ["tabName"] = "towerofhell",
                                    ["tabTitle"] = "Tower of Hell"
                                },[13775256536] = {
                                    ["tabName"] = "ttd",
                                    ["tabTitle"] = "Toilet Tower Defense"
                                },[8908228901] = {
                                    ["tabName"] = "sharkbite2",
                                    ["tabTitle"] = "SharkBite 2"
                                },[185655149] = {
                                    ["tabName"] = "bloxburg",
                                    ["tabTitle"] = "Bloxburg"
                                },[155615604] = {
                                    ["tabName"] = "prisonlife",
                                    ["tabTitle"] = "Prison Life"
                                },[4520749081] = {
                                    ["tabName"] = "kinglegacy",
                                    ["tabTitle"] = "King Legacy"
                                },[3351674303] = {
                                    ["tabName"] = "drivingempire",
                                    ["tabTitle"] = "Driving Empire"
                                },[8737899170] = {
                                    ["tabName"] = "petsimulator99",
                                    ["tabTitle"] = "Pet Simulator 99"
                                },[13772394625] = {
                                    ["tabName"] = "bladeball",
                                    ["tabTitle"] = "Blade Ball"
                                },[13864661000] = {
                                    ["tabName"] = "breakin2",
                                    ["tabTitle"] = "Break in 2"
                                },[2753915549] = {
                                    ["tabName"] = "bloxfruit",
                                    ["tabTitle"] = "Blox Fruit"
                                },[4924922222] = {
                                    ["tabName"] = "brookhaven",
                                    ["tabTitle"] = "Brookhaven"
                                },[9872472334] = {
                                    ["tabName"] = "evade",
                                    ["tabTitle"] = "Evade"
                                },[6516141723] = {
                                    ["tabName"] = "doors",
                                    ["tabTitle"] = "Doors",
                                    ["GameId"] = 2440500124
                                },[142823291] = {
                                    ["tabName"] = "murdermystery2",
                                    ["tabTitle"] = "Murder Mystery 2"
                                },[2866967438] = {
                                    ["tabName"] = "fishingsim",
                                    ["tabTitle"] = "Fishing Sim"
                                },[286090429] = {
                                    ["tabName"] = "arsenal",
                                    ["tabTitle"] = "Arsenal"
                                },[2768379856] = {
                                    ["tabName"] = "three008",
                                    ["tabTitle"] = "3008"
                                },[2788229376] = {
                                    ["tabName"] = "dahood",
                                    ["tabTitle"] = "Da Hood"
                                },[13127800756] = {
                                    ["tabName"] = "armwrestlesim",
                                    ["tabTitle"] = "Arm Wrestle Sim"
                                },[537413528] = {
                                    ["tabName"] = "babft",
                                    ["tabTitle"] = "BABFT"
                                },[15002061926] = {
                                    ["tabName"] = "deathball",
                                    ["tabTitle"] = "Death Ball"
                                },[16389395869] = {
                                    ["tabName"] = "dustytrip",
                                    ["tabTitle"] = "Dusty Trip"
                                },[2377868063] = {
                                    ["tabName"] = "strucid",
                                    ["tabTitle"] = "Strucid"
                                },[301549746] = {
                                    ["tabName"] = "counterblox",
                                    ["tabTitle"] = "Counter Blox"
                                },[606849621] = {
                                    ["tabName"] = "jailbreak",
                                    ["tabTitle"] = "Jailbreak"
                                },[6872265039] = {
                                    ["tabName"] = "bedwars",
                                    ["tabTitle"] = "Bedwars"
                                },[10449761463] = {
                                    ["tabName"] = "tsbg",
                                    ["tabTitle"] = "The Strongest Battle Ground"
                                }}
                            getgenv().gameTabs = v72
                            local v73, v74, v75 = ipairs({
                                {
                                    ["name"] = "info",
                                    ["title"] = "Info",
                                    ["icon"] = "6026568198"
                                },
                                {
                                    ["name"] = "main",
                                    ["title"] = "Main",
                                    ["icon"] = "6026568198"
                                },
                                {
                                    ["name"] = "scriptsearch",
                                    ["title"] = "Script Search",
                                    ["icon"] = "4335477481"
                                },
                                {
                                    ["name"] = "local2",
                                    ["title"] = "Local",
                                    ["icon"] = "6034503364"
                                },
                                {
                                    ["name"] = "universal",
                                    ["title"] = "Universal",
                                    ["icon"] = "6026568213"
                                },
                                {
                                    ["name"] = "scripttools",
                                    ["title"] = "Scripting Tools",
                                    ["icon"] = "6023565902"
                                },
                                {
                                    ["name"] = "solara",
                                    ["title"] = "Solara Scripts",
                                    ["icon"] = "6034996699"
                                },
                                {
                                    ["name"] = "hubs",
                                    ["title"] = "Hubs",
                                    ["icon"] = "6034418507"
                                },
                                {
                                    ["name"] = "execUI",
                                    ["title"] = "Executor UIS",
                                    ["icon"] = "6034837803"
                                },
                                {
                                    ["name"] = "admins",
                                    ["title"] = "Admins",
                                    ["icon"] = "6034837802"
                                }
                            })
                            local vu76 = {}
                            while true do
                                local v77
                                v75, v77 = v73(v74, v75)
                                if v75 == nil then
                                    break
                                end
                                local v78 = vu66
                                vu76[v77.name] = v78:CreateTab(v77.title, nil)
                            end
                            local vu79 = true
                            local vu80 = game:GetService("Players")
                            local vu81 = vu80.LocalPlayer
                            local vu82 = 0
                            local vu83 = vu80.MaxPlayers
                            local vu84 = vu76.info:CreateParagraph({
                                ["Title"] = "Welcome back, " .. vu81.Name .. "!",
                                ["Content"] = "Status: No Server Booster\n\nTime [ " .. os.date("%X") .. " ]\nPlayer In Server [ " .. vu82 .. " / " .. vu83 .. " ]\nPlace ID: " .. game.PlaceId .. "\nAccount Age: " .. vu81.AccountAge .. " Days\nAccount ID: " .. vu81.UserId
                            })
                            game:GetService("RunService").Heartbeat:Connect(function()
								-- upvalues: (ref) vu82, (ref) vu80, (ref) vu83, (ref) vu79, (ref) vu64, (ref) vu84, (ref) vu81
                                vu82 = # vu80:GetPlayers()
                                vu83 = vu80.MaxPlayers
                                local v85
                                if vu79 then
                                    v85 = nil
                                else
                                    vu79 = true
                                    v85 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
                                end
                                if vu64 ~= "Server Booster" then
                                    vu84:Set({
                                        ["Title"] = "Welcome back, " .. vu81.Name .. "!  Thanks for using my script!",
                                        ["Content"] = "\n\nTime [ " .. os.date("%X") .. " ]\nPlayer In Server [ " .. vu82 .. " / " .. vu83 .. " ]\nPlace ID: " .. game.PlaceId .. "\nAccount Age: " .. vu81.AccountAge .. " Days\nAccount ID: " .. vu81.UserId
                                    })
                                else
                                    vu84:Set({
                                        ["Title"] = "Welcome " .. vu64 .. ", " .. vu81.Name .. "!  Thanks for using my script!",
                                        ["Content"] = "Currently playing: " .. v85 .. "\n\nTime [ " .. os.date("%X") .. " ]\nPlayer In Server [ " .. vu82 .. " / " .. vu83 .. " ]\nPlace ID: " .. game.PlaceId .. "\nAccount Age: " .. vu81.AccountAge .. " Days\nAccount ID: " .. vu81.UserId
                                    })
                                end
                            end)
                            loadstring(game:HttpGet("https://pastefy.app/ZnOk2j1g/raw"))()
                            vu76.info:CreateLabel("Universal Hub made by venox.")
                            vu76.info:CreateLabel("Please Report broken scripts on Discord!")
                            vu76.info:CreateButton({
                                ["Name"] = "Join Discord",
                                ["Callback"] = function()
									-- upvalues: (ref) vu65, (ref) vu43
                                    vu65:Notify({
                                        ["Title"] = "link copied to clipboard!",
                                        ["Content"] = "Venox Hub",
                                        ["Duration"] = 6.5,
                                        ["Image"] = 6026568227
                                    })
                                    setclipboard("https://discord.com/invite/" .. vu43)
                                end
                            })
                            vu76.info:CreateSection("Small Update LOL")
                            vu76.info:CreateParagraph({
                                ["Title"] = "UPDATE HEHE! v2.2",
                                ["Content"] = "New Scripts Added:\n   + Fixed Script Search Finally lol! \n   + Infinite Hub (dynamic script hub)\n"
                            })
                            loadstring(game:HttpGet("https://pastefy.app/h5yOv8D4/raw"))()
                            local vu86 = game:GetService("TweenService");
                            (function()
								-- upvalues: (ref) vu86
                                local v87 = Instance.new("ScreenGui")
                                v87.Name = "NotificationGui"
                                v87.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                                local vu88 = Instance.new("Frame")
                                vu88.Name = "NotificationFrame"
                                vu88.Size = UDim2.new(0.5, 0, 0, 50)
                                vu88.Position = UDim2.new(0.25, 0, 0, 10)
                                vu88.BackgroundTransparency = 1
                                vu88.BorderSizePixel = 0
                                vu88.Visible = false
                                vu88.Parent = v87
                                local vu89 = Instance.new("TextLabel")
                                vu89.Name = "NotificationText"
                                vu89.Size = UDim2.new(1, 0, 1, 0)
                                vu89.Position = UDim2.new(0, 0, 0, 0)
                                vu89.BackgroundTransparency = 1
                                vu89.Text = "Report broken scripts on .gg/venoxhub! @venox.w"
                                vu89.TextColor3 = Color3.fromRGB(255, 215, 0)
                                vu89.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                vu89.TextStrokeTransparency = 0.5
                                vu89.TextSize = 24
                                vu89.Font = Enum.Font.SourceSansBold
                                vu89.TextWrapped = true
                                vu89.TextXAlignment = Enum.TextXAlignment.Center
                                vu89.Parent = vu88
                                local v90 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                                local vu91 = vu86:Create(vu89, v90, {
                                    ["TextTransparency"] = 0,
                                    ["TextStrokeTransparency"] = 0
                                })
                                local vu92 = vu86:Create(vu89, v90, {
                                    ["TextTransparency"] = 1,
                                    ["TextStrokeTransparency"] = 1
                                })
                                local function v93()
									-- upvalues: (ref) vu88, (ref) vu89, (ref) vu91, (ref) vu92
                                    vu88.Visible = true
                                    vu89.TextTransparency = 1
                                    vu89.TextStrokeTransparency = 1
                                    vu91:Play()
                                    wait(1)
                                    wait(60)
                                    vu92:Play()
                                    wait(1)
                                    vu88.Visible = false
                                end
                                coroutine.wrap(v93)()
                            end)()
                            vu76.main:CreateSection("Server (doesn\'t work on solara!)")
                            vu76.main:CreateButton({
                                ["Name"] = "Rejoin Server",
                                ["Callback"] = function()
                                    local v94 = game:GetService("Players").LocalPlayer
                                    local v95 = game.PlaceId
                                    game:GetService("TeleportService"):Teleport(v95, v94)
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "join small Server",
                                ["Callback"] = function()
                                    local vu96 = game:GetService("HttpService")
                                    local v97 = game:GetService("TeleportService")
                                    local v98 = game.PlaceId
                                    local vu99 = "https://games.roblox.com/v1/games/" .. v98 .. "/servers/Public?sortOrder=Asc&limit=100"
                                    function ListServers(p100)
										-- upvalues: (ref) vu99, (ref) vu96
                                        return vu96:JSONDecode((game:HttpGet(vu99 .. (p100 and "&cursor=" .. p100 or ""))))
                                    end
                                    local v101 = nil
                                    repeat
                                        local v102 = ListServers(v101)
                                        local v103 = v102.data[1]
                                        v101 = v102.nextPageCursor
                                    until v103
                                    v97:TeleportToPlaceInstance(v98, v103.id, game:GetService("Players").LocalPlayer)
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Anti AFK",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/anti-afk/main/anti%20afk"))()
                                end
                            })
                            vu76.main:CreateSection("some misc")
                            vu76.main:CreateButton({
                                ["Name"] = "UNC TEST \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UNC-Test-13114"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "fake ip grabber \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://zxfolix.github.io/trollgrabber.lua"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Auto Clicker \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://gist.githubusercontent.com/Exploiter64/35113ef8e9ed8b57c12133f52fc74824/raw/c442663561cd06edd9e970ab6f6f9dc3a327c6fc/gistfile1.txt", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "STREAM SNIPE ANYONE (SCRIPTHUBV3) \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "More UNC \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-MoreUNC-13110"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Freecam ( P or left shift )\226\173\144",
                                ["Callback"] = function()
                                    _G.FREECAM_MACRO_KB = {
                                        Enum.KeyCode.LeftShift,
                                        Enum.KeyCode.P
                                    }
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Melishy/melishy-scripts/main/freecam/freecam.lua", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "SimpleBypass ( Chat Bypass )\226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/Ouxie/main/Projects/simplebypass.lua"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Chat Bypasser (best?)\226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/chat-bypasser-by-me/main/bypasser"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Chat \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Chat Bypasser (key copies)\226\173\144",
                                ["Callback"] = function()
                                    setclipboard("P1d#uT")
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Bypass/8e92f1a31635629214ab4ac38217b97c2642d113/vadrifts"))()
                                end
                            })
                            loadstring(game:HttpGet("https://pastefy.app/ZdCcQdY1/raw"))()
                            vu76.main:CreateButton({
                                ["Name"] = "Chat Bypasser \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonymous12131/MenaceV2.1.-Best-bypasser/main/obf_i7iAAH834YFQno0FLyuLPcNR5ouJrmvEFdtmXtF1C6u935ghB9DAFK5L3zgsPs6X.lua.txt"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Chat Spammer (not working in all games)\226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/chatspammer/main/chatspammer", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Rape Script(not working in all games) \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChainOnToo/Unknown/main/Sus%20Missile%20Script"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Print Executor Level \226\173\144",
                                ["Callback"] = function()
                                    printidentity()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "OMEN HUB PREMIUM (key: premium) \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/QuvTAzLw/raw"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Anti Lag \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/t2391h1A"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Mobile Keyboard \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Anti Afk \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/AntiAFK.lua", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Fly Script \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/YSL3xKYU"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Better Roblox V3 \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://astroswrld.club/BetterRoblox/Loader"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Animation pack \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Animation-pack-13882"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "Dance GUI \226\173\144NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/0MLPL32f"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "FE Emotes\226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/eCpipCTH"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "FE Sadist Genocider \226\173\144(need hat)",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "FE AK47 (need hat)\226\173\144NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/AK-47"))()
                                end
                            })
                            vu76.main:CreateSection("RTX")
                            vu76.main:CreateButton({
                                ["Name"] = "RTX ( Low ) \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/beJhkj3m", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "RTX ( Medium ) \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/bEL98kZE", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "RTX ( High ) \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/BIr8OzrR/raw", true))()
                                end
                            })
                            vu76.main:CreateButton({
                                ["Name"] = "RTX ( Ultra )",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU", true))()
                                end
                            })
                            loadstring(game:HttpGet("https://pastefy.app/z9PGbIVr/raw"))()
                            local v188, v189 = pcall(function()
								-- upvalues: (ref) vu65, (ref) vu76
                                getgenv().FilterSelected12 = "free"
                                local function vu105(p104)
                                    return string.gsub(p104, " ", "%%20")
                                end
                                function clearPage12()
                                    local vu106 = {
                                        "Paragraph",
                                        "Clear Page",
                                        "Search",
                                        "Select Filter"
                                    }
                                    local function v112(p107)
										-- upvalues: (ref) vu106
                                        local v108, v109, v110 = ipairs(vu106)
                                        while true do
                                            local v111
                                            v110, v111 = v108(v109, v110)
                                            if v110 == nil then
                                                break
                                            end
                                            if p107.Name == v111 then
                                                return true
                                            end
                                        end
                                        return false
                                    end
                                    local v113 = {}
                                    local v114 = game.CoreGui:FindFirstChild("Rayfield")
                                    if v114 then
                                        v114 = game.CoreGui.Rayfield.Main.Elements["Script Search"]
                                    end
                                    local v115 = game.CoreGui:FindFirstChild("HiddenUI")
                                    if v115 then
                                        v115 = game.CoreGui.HiddenUI.Rayfield.Main.Elements["Script Search"]
                                    end
                                    __set_list(v113, 1, {
                                        v114,
                                        v115
                                    })
                                    local v116, v117, v118 = pairs(v113)
                                    while true do
                                        local v119
                                        v118, v119 = v116(v117, v118)
                                        if v118 == nil then
                                            break
                                        end
                                        if v119 then
                                            local v120, v121, v122 = pairs(v119:GetChildren())
                                            while true do
                                                local v123
                                                v122, v123 = v120(v121, v122)
                                                if v122 == nil then
                                                    break
                                                end
                                                if v123:IsA("GuiObject") and not v112(v123) then
                                                    v123:Destroy()
                                                end
                                            end
                                        end
                                    end
                                end
                                local function vu131(p124, pu125)
									-- upvalues: (ref) vu105
                                    local vu126 = vu105(p124)
                                    local vu127 = nil
                                    local vu128 = nil
                                    local v129, v130 = pcall(function()
										-- upvalues: (ref) vu127, (ref) vu126, (ref) pu125, (ref) vu128
                                        vu127 = game:HttpGet("https://scriptblox.com/api/script/search?q=" .. vu126 .. "&mode=free&filters=" .. getgenv().FilterSelected12 .. "&page=" .. pu125)
                                        vu128 = game:GetService("HttpService"):JSONDecode(vu127)
                                    end)
                                    if v129 then
                                        return vu128.result.scripts
                                    end
                                    print("Failed to fetch script search results:", v130)
                                    return {}
                                end
                                local function vu139(p132, pu133)
									-- upvalues: (ref) vu105
                                    local vu134 = vu105(p132)
                                    local vu135 = nil
                                    local vu136 = nil
                                    local v137, v138 = pcall(function()
										-- upvalues: (ref) vu135, (ref) pu133, (ref) vu134, (ref) vu136
                                        vu135 = game:HttpGet("https://rscripts.net/api/scripts?page=" .. pu133 .. "&orderBy=date&sort=desc&q=" .. vu134)
                                        vu136 = game:GetService("HttpService"):JSONDecode(vu135)
                                    end)
                                    if v137 then
                                        return vu136.scripts
                                    end
                                    print("Failed to fetch RScripts script search results:", v138)
                                    return {}
                                end
                                local function vu168(pu140, pu141)
									-- upvalues: (ref) vu65, (ref) vu131, (ref) vu139, (ref) vu76, (ref) vu168
                                    local v142 = pu140
                                    vu65:Notify({
                                        ["Title"] = "Venox Hub",
                                        ["Content"] = "Started Fetching Scripts...",
                                        ["Duration"] = 6.5,
                                        ["Image"] = 4483362458
                                    })
                                    local v143 = vu131(v142, pu141)
                                    local v144 = vu139(v142, pu141)
                                    local v145, v146, v147 = ipairs(v143)
                                    local v148 = {}
                                    while true do
                                        local v149
                                        v147, v149 = v145(v146, v147)
                                        if v147 == nil then
                                            break
                                        end
                                        table.insert(v148, {
                                            ["title"] = v149.title,
                                            ["gameName"] = v149.game.name,
                                            ["source"] = "https://scriptblox.com/api/script/raw/" .. v149._id
                                        })
                                    end
                                    local v150, v151, v152 = ipairs(v144)
                                    while true do
                                        local v153
                                        v152, v153 = v150(v151, v152)
                                        if v152 == nil then
                                            break
                                        end
                                        local v154 = v153.keySystem ~= true and "" or game:HttpGet("https://pastefy.app/ZDOXDsYy/raw")
                                        local v155 = ""
                                        if v153.download then
                                            v155 = "https://rscripts.net/raw/" .. v153.download
                                        else
                                            print("Warning: script.download is nil for script:", v153.title)
                                        end
                                        if v155 == "" then
                                            print("Skipping script due to invalid download link:", v153.title)
                                        else
                                            table.insert(v148, {
                                                ["title"] = v154 .. " " .. v153.title,
                                                ["gameName"] = v153.views .. " Views [Rscript]",
                                                ["source"] = v155
                                            })
                                        end
                                    end
                                    vu65:Notify({
                                        ["Title"] = "Venox Hub",
                                        ["Content"] = "Done Fetching! All Scripts Added",
                                        ["Duration"] = 6.5,
                                        ["Image"] = 4483362458
                                    })
                                    table.sort(v148, function(p156, p157)
                                        return p156.title < p157.title
                                    end)
                                    if pu141 == 1 then
                                        vu76.scriptsearch:CreateLabel("Results for \"" .. pu140 .. "\"")
                                    else
                                        vu76.scriptsearch:CreateLabel("Page " .. pu141 .. ":")
                                    end
                                    local v158, v159, v160 = ipairs(v148)
                                    while true do
                                        local vu161
                                        v160, vu161 = v158(v159, v160)
                                        if v160 == nil then
                                            break
                                        end
                                        vu76.scriptsearch:CreateButton({
                                            ["Name"] = string.format("%s%-30s%s", vu161.title, "", vu161.gameName),
                                            ["Callback"] = function()
												-- upvalues: (ref) vu161
                                                local v162, v163 = pcall(function()
													-- upvalues: (ref) vu161
                                                    loadstring(game:HttpGet(vu161.source))()
                                                end)
                                                if not v162 then
                                                    print("Failed to load script:", v163)
                                                    print(vu161.source)
                                                end
                                            end
                                        })
                                    end
                                    vu76.scriptsearch:CreateButton({
                                        ["Name"] = "Load Page " .. pu141 + 1,
                                        ["Callback"] = function()
											-- upvalues: (ref) vu168, (ref) pu140, (ref) pu141
                                            local v164, v165, v166 = pairs(game.CoreGui.Rayfield.Main.Elements["Script Search"]:GetChildren())
                                            while true do
                                                local v167
                                                v166, v167 = v164(v165, v166)
                                                if v166 == nil then
                                                    break
                                                end
                                                if v167:IsA("GuiObject") and v167.Name:match("Load Page %d+") then
                                                    v167:Destroy()
                                                end
                                            end
                                            vu168(pu140, pu141 + 1)
                                        end
                                    })
                                end
                                local function vu184(pu169)
									-- upvalues: (ref) vu65, (ref) vu76, (ref) vu184
                                    local vu170 = nil
                                    local vu171 = nil
                                    local v172, v173 = pcall(function()
										-- upvalues: (ref) vu171, (ref) pu169, (ref) vu170
                                        vu171 = game:HttpGet("https://scriptblox.com/api/script/fetch?page=" .. pu169)
                                        vu170 = game:GetService("HttpService"):JSONDecode(vu171)
                                    end)
                                    if v172 then
                                        if pu169 == 1 then
                                            vu76.scriptsearch:CreateLabel("Newest Scripts:")
                                        else
                                            vu76.scriptsearch:CreateLabel("Page " .. pu169 .. ":")
                                        end
                                        local v174, v175, v176 = ipairs(vu170.result.scripts)
                                        while true do
                                            local vu177
                                            v176, vu177 = v174(v175, v176)
                                            if v176 == nil then
                                                break
                                            end
                                            vu76.scriptsearch:CreateButton({
                                                ["Name"] = string.format("%s%-30s%s", vu177.title, "", vu177.game.name),
                                                ["Callback"] = function()
													-- upvalues: (ref) vu177, (ref) vu65
                                                    local v178, v179 = pcall(function()
														-- upvalues: (ref) vu177
                                                        loadstring(game:HttpGet("https://scriptblox.com/api/script/raw/" .. vu177._id))()
                                                    end)
                                                    if not v178 then
                                                        vu65:Notify({
                                                            ["Title"] = "Venox Hub",
                                                            ["Content"] = "Failed to load script!",
                                                            ["Duration"] = 6.5,
                                                            ["Image"] = 4483362458
                                                        })
                                                        print("Failed to load script:", v179)
                                                    end
                                                end
                                            })
                                        end
                                        vu76.scriptsearch:CreateButton({
                                            ["Name"] = "Load Page " .. pu169 + 1,
                                            ["Callback"] = function()
												-- upvalues: (ref) vu184, (ref) pu169
                                                local v180, v181, v182 = pairs(game.CoreGui.Rayfield.Main.Elements["Script Search"]:GetChildren())
                                                while true do
                                                    local v183
                                                    v182, v183 = v180(v181, v182)
                                                    if v182 == nil then
                                                        break
                                                    end
                                                    if v183:IsA("GuiObject") and v183.Name:match("Load Page %d+") then
                                                        v183:Destroy()
                                                    end
                                                end
                                                vu184(pu169 + 1)
                                            end
                                        })
                                    else
                                        vu65:Notify({
                                            ["Title"] = "Venox Hub",
                                            ["Content"] = "Failed to fetch newest scripts!",
                                            ["Duration"] = 6.5,
                                            ["Image"] = 4483362458
                                        })
                                        print("Failed to fetch newest scripts:", v173)
                                    end
                                end
                                vu76.scriptsearch:CreateParagraph({
                                    ["Title"] = "Script Search",
                                    ["Content"] = "We\'ll show you the latest scripts published on Scriptblox until u search.\nBe aware of MALICIOUS Content on the latest scripts bc they are mostly unchecked!!\nPowered by ScriptBlox and Powered by Rscripts.net!"
                                })
                                vu76.scriptsearch:CreateButton({
                                    ["Name"] = "Clear Page",
                                    ["Callback"] = function()
                                        clearPage12()
                                    end
                                })
                                vu76.scriptsearch:CreateDropdown({
                                    ["Name"] = "Select Filter",
                                    ["Options"] = {
                                        "free",
                                        "hot",
                                        "verified",
                                        "mostviewed",
                                        "paid"
                                    },
                                    ["CurrentOption"] = {
                                        "free"
                                    },
                                    ["MultipleOptions"] = false,
                                    ["Flag"] = "FilterDropdown",
                                    ["Callback"] = function(p185)
                                        local v186 = table.concat(p185, ", ")
                                        print("Selected Filter:", v186)
                                        getgenv().FilterSelected12 = v186
                                    end
                                })
                                vu76.scriptsearch:CreateInput({
                                    ["Name"] = "Search",
                                    ["PlaceholderText"] = "Blox Fruit",
                                    ["RemoveTextAfterFocusLost"] = false,
                                    ["Callback"] = function(p187)
										-- upvalues: (ref) vu168
                                        clearPage12()
                                        vu168(p187, 1)
                                    end
                                })
                                vu184(1)
                            end)
                            if not v188 then
                                vu65:Notify({
                                    ["Title"] = "Venox Hub",
                                    ["Content"] = "Failed loading Script Searcher!",
                                    ["Duration"] = 6.5,
                                    ["Image"] = 4483362458
                                })
                                print("Error loading Script Searcher:", v189)
                            end
                            vu76.local2:CreateSection("Local")
                            vu76.local2:CreateSlider({
                                ["Name"] = "WalkSpeed",
                                ["Range"] = {
                                    0,
                                    500
                                },
                                ["Increment"] = 1,
                                ["Suffix"] = "Speed",
                                ["CurrentValue"] = 16,
                                ["Flag"] = "Slider1",
                                ["Callback"] = function(p190)
									-- upvalues: (ref) vu80
                                    vu80.LocalPlayer.Character.Humanoid.WalkSpeed = p190
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Reset WalkSpeed",
                                ["Callback"] = function()
									-- upvalues: (ref) vu80
                                    vu80.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                                end
                            })
                            vu76.local2:CreateSlider({
                                ["Name"] = "JumpPowerSpeed",
                                ["Range"] = {
                                    0,
                                    350
                                },
                                ["Increment"] = 1,
                                ["Suffix"] = "Power",
                                ["CurrentValue"] = 50,
                                ["Flag"] = "Slider2",
                                ["Callback"] = function(p191)
									-- upvalues: (ref) vu80
                                    vu80.LocalPlayer.Character.Humanoid.JumpPower = p191
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Reset JumpPower",
                                ["Callback"] = function()
									-- upvalues: (ref) vu80
                                    vu80.LocalPlayer.Character.Humanoid.JumpPower = 50
                                end
                            })
                            vu76.local2:CreateSlider({
                                ["Name"] = "Gravity",
                                ["Range"] = {
                                    1,
                                    500
                                },
                                ["Increment"] = 10,
                                ["Suffix"] = "Gravity",
                                ["CurrentValue"] = 192.5,
                                ["Flag"] = "Slider2",
                                ["Callback"] = function(p192)
                                    game.workspace.Gravity = p192
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Reset Gravity",
                                ["Callback"] = function()
                                    game.workspace.Gravity = 192.5
                                end
                            })
                            vu76.local2:CreateSlider({
                                ["Name"] = "Hipheight",
                                ["Range"] = {
                                    2,
                                    250
                                },
                                ["Increment"] = 1,
                                ["Suffix"] = "Hipheight",
                                ["CurrentValue"] = 2,
                                ["Flag"] = "Slider2",
                                ["Callback"] = function(p193)
									-- upvalues: (ref) vu80
                                    vu80.LocalPlayer.Character.Humanoid.HipHeight = p193
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Reset Hipheight",
                                ["Callback"] = function()
									-- upvalues: (ref) vu80
                                    vu80.LocalPlayer.Character.Humanoid.HipHeight = 2
                                end
                            })
                            vu76.local2:CreateSlider({
                                ["Name"] = "FOV",
                                ["Range"] = {
                                    1,
                                    120
                                },
                                ["Increment"] = 1,
                                ["Suffix"] = "FOV",
                                ["CurrentValue"] = 80,
                                ["Flag"] = "Slider2",
                                ["Callback"] = function(p194)
                                    workspace.CurrentCamera.FieldOfView = p194
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Reset FOV",
                                ["Callback"] = function()
                                    workspace.CurrentCamera.FieldOfView = 80
                                end
                            })
                            vu76.local2:CreateSection("Player Scripts")
                            vu76.local2:CreateButton({
                                ["Name"] = "Full Bright",
                                ["Callback"] = function()
                                    game.Lighting.FogEnd = 9000000000
                                    game.Lighting.Brightness = 3
                                    game.Lighting.Atomosphere:Destroy()
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Unanchored Parts to you",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "No Clip and Fly",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://weinzspace.com/revamp.lua"))()
                                end
                            })
                            vu76.local2:CreateButton({
                                ["Name"] = "Ragdoll Engine",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwarle/Main_Scripts/main/QUI.lua"))()
                                end
                            })
                            vu76.universal:CreateSection("scripts by venox \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
                            vu76.universal:CreateButton({
                                ["Name"] = "Position Lock Loop Teleport \226\156\168 (for autofarming etc.)",
                                ["Callback"] = function()
									-- upvalues: (ref) vu65
                                    local v195 = vu65
                                    local v196 = v195.Notify
                                    local v197 = {
                                        ["Title"] = "see console (chat /console) to turn off!",
                                        ["Content"] = "Venox Hub",
                                        ["Duration"] = 6.5,
                                        ["Image"] = 6026568227
                                    }
                                    local v198 = {
                                        ["Ignore"] = {
                                            ["Name"] = "OK",
                                            ["Callback"] = function()
                                            end
                                        }
                                    }
                                    v197.Actions = v198
                                    v196(v195, v197)
                                    print("Position Lock turn off: getgenv().teleport = false")
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Position-Lock-Loop-Teleport-13623", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Webhook Tools \226\156\168",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/webhook_tools", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Webhook Message Sender \226\156\168",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/webhook_spam", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "rivals script \226\156\168",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivals", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Infinite Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/Infinite_Hub", true))()
                                end
                            })
                            vu76.universal:CreateSection("more universal scripts \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
                            vu76.universal:CreateButton({
                                ["Name"] = "pov changer  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:GetObjects("rbxassetid://15046298025")[1].Source)()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "fling script  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.ai/raw/ku3dipdojr"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "TP Walk  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox-Scripts/main/Tpwalk%20V4%20%5B%20BETA%20%5D.lua", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "R15 Animations \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/eCpipCTH"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Btool ( by F3X ) \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "fake limiteds \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/fakelimitedsv2/main/fakelimitedsv2", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "fps boost \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/8YZ2cc6V"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "headless (client)\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    game:GetService("Players")
                                    game.PlayerService.LocalPlayer.Character.Head.Transparency = 1
                                    game.PlayerService.LocalPlayer.Character.Head.Transparency = 1
                                    local v199, v200, v201 = pairs(game.PlayerService.LocalPlayer.Character.Head:GetChildren())
                                    while true do
                                        local v202
                                        v201, v202 = v199(v200, v201)
                                        if v201 == nil then
                                            break
                                        end
                                        if v202:IsA("Decal") then
                                            v202.Transparency = 1
                                        end
                                    end
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "walk on walls \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/walk-on-walls/main/walk%20on%20walls"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Hitbox expander \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Update-script-hitbox-9326"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Aimbot ( Mobile&PC )\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/utHyEcbk"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Aimbot 2 ( Hold MB2 )\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox/main/AimbotMB2"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Equinox HUB\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/wzB1Qh78", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Unnamed ESP\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Universal ESP \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Ragdoll walker \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ragdoll-walker-13966", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Ultimate Trolling Hub \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Orealated/Oreal/main/orealated.lol%20UTH%20Loader"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "fe reach script \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://gist.githubusercontent.com/ayayy/4d529b721e7d6934ff16356a6e71b4ba/raw"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "fe hitbox expander \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "npc control \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/rZPYaAaT/raw", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "part mover \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/Vcuyg09O/raw", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "telekineses \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Rochips haven ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/yumu499O/raw", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Saturn Hub ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/saturncrack/main/source.lua"))("")
                                    wait(1)
                                    game:GetService("Players").LocalPlayer.PlayerGui.Gui.Whitelist.Visible = false
                                    game:GetService("Players").LocalPlayer.PlayerGui.Gui.Saturnhub.Visible = true
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Necto Hub ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/NectoLauncher.lua", true))()
                                end
                            })
                            vu76.universal:CreateButton({
                                ["Name"] = "Sirius Pro ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Sirius-Pro-9527", true))()
                                end
                            })
                            vu76.scripttools:CreateSection("Scripting (Help) Tools \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
                            vu76.scripttools:CreateButton({
                                ["Name"] = "Scripting Tools Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/Debuggers.txt"))()
                                end
                            })
                            vu76.scripttools:CreateButton({
                                ["Name"] = "HTTP SPY \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(request({
                                        ["Url"] = "https://seere.vip/cracks/httpspy.lua"
                                    }).Body)()
                                end
                            })
                            vu76.scripttools:CreateButton({
                                ["Name"] = "Simple Spy V3 \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
                                end
                            })
                            vu76.scripttools:CreateButton({
                                ["Name"] = "Remotespy for Solara \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Remotespy-for-solara-14630"))()
                                end
                            })
                            vu76.scripttools:CreateButton({
                                ["Name"] = "RemoteEvent and Function Log \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rscripts.net/raw/remoteeventandfunctionlogger_1718763469941_uu4KT3DNwf.txt"))()
                                end
                            })
                            vu76.scripttools:CreateButton({
                                ["Name"] = "Reamsrpy \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
                                end
                            })
                            vu76.scripttools:CreateButton({
                                ["Name"] = "Dark Dex V3 Secured \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
                                end
                            })
                            vu76.solara:CreateSection("Universal \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Anti Afk script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/BCbtujG1"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "UTH HUB\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Orealated/Oreal/main/orealated%20Easy.gg%20UTH%20Loader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Chat Bypasser (key copies)\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    setclipboard("P1d#uT")
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Bypass/main/vadrifts"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Hitbox Expander\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "UTH HUB\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Orealated/Oreal/main/orealated%20Easy.gg%20UTH%20Loader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Universal Aimbot\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "midnight.cc  aimbot etc\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Nut Solara Script Hub\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/working/main/pc"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "FFJ Hub Steamsniper (Requires key) \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Sniper.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Universal Aimbot and ESP \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMobCheatEngine.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "fling all \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Chat Bypass \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Classic games script \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnonymusScripter/The-Classic-Hub/main/All%20in%201%20Script"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Sky HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Ghost HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Unnamed ESP \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Air HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Sirius \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox-Exploit/main/Sirius"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "NamelessAdmin \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Equinox HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/wzB1Qh78", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Aimbot ( Mobile&PC )  \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/utHyEcbk"))()
                                end
                            })
                            vu76.solara:CreateSection("RE:XL \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "V.Ghub   \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
                                end
                            })
                            vu76.solara:CreateSection("Rush Point \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "rushpoint  \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/noobscripter38493/Rush-point/main/RUSH%20POINT!!!!!.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Sharkbite \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "sharkbite multiple  \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://scriptblox.com/raw/STEALTH-SharkBite-2-script-13895"))()
                                end
                            })
                            vu76.solara:CreateSection("Project Delta \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "project delta \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/gmofi/BBC/main/source.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Adopt Me \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Adopt Me \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua", true))()
                                end
                            })
                            vu76.solara:CreateSection("Sakura Stand \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Sakura Hub \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Primera-Espada-Sakura-Stand-Hub-15702"))()
                                end
                            })
                            vu76.solara:CreateSection("Heroes Battlegrounds \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "HBG \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Faizrek/Heroes-Battlegrounds/main/Heroes%20Battlegrounds"))()
                                end
                            })
                            vu76.solara:CreateSection("Big Paintball 2 \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "zaphub \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
                                end
                            })
                            vu76.solara:CreateSection("Mining Simulator \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "MS  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/p4ihNBSw", true))()
                                end
                            })
                            vu76.solara:CreateSection("Anime Fly Race \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "AFR  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/fGrfWBKp"))()
                                end
                            })
                            vu76.solara:CreateSection("Project Slayers \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Kiwi Hub Solara  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/kiwixcheat/000x999/main/KiwiX%20Hub%20X%20Solara%20.lua", true))()
                                end
                            })
                            vu76.solara:CreateSection("Pressure \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Bedol HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/New-C4-Remote.lua/main/pressure_kuy.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "TTJY HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/NewCMain/main/Main.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Frontlines\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "thunder client lite \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://scriptblox.com/raw/FRONTLINES-Thunder-Client-Lite-14265"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "frontlines \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/frontlines2"))()
                                end
                            })
                            vu76.solara:CreateSection("Rivals (idk if mobile support)\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "auto farm(copies script,put in autoexec)",
                                ["Callback"] = function()
                                    setclipboard("loadstring(game:HttpGet((\'https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/autowin.lua\')))()")
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "venoxware  (best fr) \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivalsv2"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Venox Rivals V1 \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivals"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Silent Rivals (key without ads)\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/KxGOATESQUE/SilentRivals/main/SilentRivals"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Frosties Rivals \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/Rivals.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Random one \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/5oxin/Phantom/main/main"))()
                                end
                            })
                            vu76.solara:CreateSection("Fight in a School\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "FiaS \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/Fight-in-a-school/main/Solara"))()
                                end
                            })
                            vu76.solara:CreateSection("Track Field Infinite\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "macro, Walkspeed, jumpboost \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/Track-And-Field-Infinite/main/Solara"))()
                                end
                            })
                            vu76.solara:CreateSection("Sol\'s RNG\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "EruditeHub V1.69 \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol\'s%20RNG/V1.69"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "EruditeHub V1.4 \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol\'s%20RNG/V1.4"))()
                                end
                            })
                            vu76.solara:CreateSection("Lumber Tycoon 2\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "LuaWare \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "AncestorV2 \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/Maid.txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Butter Hub \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Butterisgood/Butter/main/Root2.lua"))("")
                                end
                            })
                            vu76.solara:CreateSection("Bee Swarm Simulator\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "some script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2d1db598823e0bc6d90ed4892189fe22.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "bss script  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Tabby  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/Tabby/main/TabbyMaster.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Histy HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "beecon hub\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeSwarmSim/main/BeeSwarmSim"))()
                                end
                            })
                            vu76.solara:CreateSection("Gym League\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "GymLeague\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/x64communist/tupo/main/GymLeague.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "No-Name Hub\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Essenly/NoName-Hub/main/Loader.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Natural Disasters\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Nice script\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pr0jectNight/Script-Hubs/main/Antares/NaturalDisasters.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Lucky Blocks Battlegrounds\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Script\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/bruhhwtf/LUCKY-BLOCKS-Battlegrounds-GUI/raw/main/Main"))()
                                end
                            })
                            vu76.solara:CreateSection("Zombie Attack\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Void Hub\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Better Music\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "BetterMusic Autofarm\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BetterMusic"))()
                                end
                            })
                            vu76.solara:CreateSection("Legend of Speed\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Vynixius \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Neptune \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/KezerKol/FREESCRIPTORGETRAIDER/main/LegendOfSpeedNeptunes.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Sim Hub \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/E1Kp2r3Y"))()
                                end
                            })
                            vu76.solara:CreateSection("KAT\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "KAT F*CKER\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/6G9GfqjC"))()
                                end
                            })
                            vu76.solara:CreateSection("Card RNG\226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Tatsumaki Hub\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tatsumaki49/main/123/CardRNG"))()
                                end
                            })
                            vu76.solara:CreateSection("Block Mayhem \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "autofarm",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/block%20mayhem"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Tatsumaki Hub\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tatsumaki49/main/123/BlockMayhem"))()
                                end
                            })
                            vu76.solara:CreateSection("Vehicle Legends \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Autofarm\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))()
                                end
                            })
                            vu76.solara:CreateSection("Build a Boat for Treasure \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Auto Gold Farm  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://scriptblox.com/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Ski Hub  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "TTJY HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/NewCMain/main/Main.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Zeroox Hub\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("starving Artists \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Auto Draw Script (key copies)\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    setclipboard("usernaxo")
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/usernaxo/RobloxScripts/main/StarvingArtists/DrawingScript.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Murder vs Sheriff \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Pitbull Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHub/main/Scripting"))()
                                end
                            })
                            vu76.solara:CreateSection("Muscle Legends \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Pitbull Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHub/main/Scripting"))()
                                end
                            })
                            vu76.solara:CreateSection("Drive World \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Fall Angel Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/x3fall3nangel/FallAngelHub/main/DriveWorld.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Ant War \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Antwar  Auto Kill (Go Near User) \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/9KKqjeM8"))()
                                end
                            })
                            vu76.solara:CreateSection("Demonfall \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "demonfall \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/LabibKazi858/Scripts/main/DemonFall"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Solix HUB ( keysystem :/ ) \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Demonfall-Solara/main/Protected_5312497258853096.txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Demonfall script \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/LabibKazi858/Scripts/main/DemonFall"))()
                                end
                            })
                            vu76.solara:CreateSection("Ninja Legends \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Ninja Legends ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/GeronimoZhidkova/0n1-Hub/main/Obfuscated"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "nj script \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Games/NinjaLegends.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Ninja Legends sc \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yousuck780/ninja-legends/main/no"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Rage Hub \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/IndexXhub/rage-hub/main/Rage%20Hub"))()
                                end
                            })
                            vu76.solara:CreateSection("Pull A Sword \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Pull a sword script \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/Utilities/main/Closed/Pull%20a%20Sword.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Slap Battle \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Slap Battles Script \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "DestroyerX \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Aquoupi/DestroyerX/main/DestroyerX"))()
                                end
                            })
                            vu76.solara:CreateSection("War Tycoon \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "wartycoon \226\173\144NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/AA-Tank-War-Tycoon-Script-8894"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Awaken Hub \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Awakenchan/Misc-Release/main/WarTycoon"))()
                                end
                            })
                            vu76.solara:CreateSection("Tower of Hell \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Starry\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/hello-n-bye/starry/main/main.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "SprinHub",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/SprinHub"))()
                                end
                            })
                            vu76.solara:CreateSection("Jailbreak \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Auto Crate Farm \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/TempIsGay/Cashfarm/main/AutoCrateFree.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "ski hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Small Simple Jailbreak Script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/zyn789/Aoi-Script/main/Jailbreak"))()
                                end
                            })
                            vu76.solara:CreateSection("Breaking Point \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Breaking Point Script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ColdStep2/Breaking-Point-Funny-Squid-Hax/main/Breaking%20Point%20Funny%20Squid%20Hax", true))()
                                end
                            })
                            vu76.solara:CreateSection("The Strongest Battleground \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "KadeHubV2 \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/ray-makk/main/Loader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "LHUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/LHUB"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "random script \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/zx3081xc"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "TSBG Utils \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/TSBUtils.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "TSBG SCRIPT \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/TSBG/main/Solara"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "SillyHub (good) \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/TSB/main/SillyHub"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Nobulem Hub \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/NBLMSCRIPTS/NBLMSCRIPTHUB/main/SKIBIDI"))()
                                end
                            })
                            vu76.solara:CreateSection("King Legacy \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Arc Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/PC.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Driving Empire \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "AutoFarm \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "MAX HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3f4c258405c294983a9b0e113dad3de7.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Attack on Titan \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "AOT Script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/jIAPA2zS/raw", true))()
                                end
                            })
                            vu76.solara:CreateSection("Untitled Tag Game \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "RanxwareHub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zer0ids/Qwerty/main/UntitledTag/NewScript.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Phantom Forces \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "homohack \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/homohack.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "ski hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Homohack Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/homohack.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Ro Ghoul \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "roghoul script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Roghoul", true))()
                                end
                            })
                            vu76.solara:CreateSection("Counter Blox \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "CB Script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckmath/shit/main/main.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "DeleteMobV2 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMobV2.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Sirex Ware\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/skyteg99/Sirex_Wave_v3_free/main/Sirex_Ware_v3%20(1).txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "CB Script\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/fliskScript/jaran.vip/main/free.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Murder Mystery 2 \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "hightlightMM2 (copies key)\226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    setclipboard("hlvipcomingsoon")
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Main"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Tbao Hub\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubMurderMystery2"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Prosto Hub\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/testikwatafak/-ProstoHub/main/ProstoHub"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Haxhell\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/haxhell/roblox-scripts/main/murder-mystery-2.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Byte Hub\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-ByteHub-10357"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Amenteso\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Amenteso/robloxscripts/main/Key.lua", true))()
                                end
                            })
                            vu76.solara:CreateSection("Brookhaven \226\157\132\239\184\143NEW")
                            vu76.solara:CreateButton({
                                ["Name"] = "Serpente \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/err0r129/SerpenteXbetaByDefense129/main/Serpente.Scripts"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Brookhaven \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
                                end
                            })
                            vu76.solara:CreateSection("Arm Wrestle Simulator \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Tupo Script \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d1d21fe29816f4b85fa1bd132d64ba52.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Blade Ball \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "infinix hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Nexam HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Astral HUB \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/A-s-t-r-a-l/main/Loader_BladeBall.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Bedol HUB V4.3 \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    _G.UI_Size = 200
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Expo HUB V1 (copies key) \226\157\132\239\184\143NEW ",
                                ["Callback"] = function()
                                    setclipboard("Expo#1")
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ExpoSploits/expo-key-system/main/Expo%20Key", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Visual V3.5 \226\157\132\239\184\143NEW  ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/a5945467f3b9388503ca653c0ea49cba.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "blade ball \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/main/Games/Blade%20Ball/sub.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Pitbull Hub (key copies)\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    setclipboard(",&^i~6KcQ\195\130\194\163gP29TBD1/T")
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHub/main/Scripting"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = " visual 3.4 fixed \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bc54a02ef03b7586aa05ab425f722312.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Visual V3 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0aefed07fd25b2369e282001ca3c2838.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Visual v2 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tevfn/BladeBall-Script/main/Visual-V2-Script-By-T-e-v-f-n"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "FFJ HUB V3 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/BladeBallV3.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "OP Manual Spam \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/SlzAX17vGCub7iRKVmJid61Bg/main/KwKVzV5SgcFBd9fnpLr4lKCg6.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Ether HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/6w0s/_6w0s/main/Loader.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Nurysium \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/flezzpe/Nurysium/main/nury_source.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "FFJ V2 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Schema HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/manimanni/Schema/main/posse.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Zap HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
                                end
                            })
                            vu76.solara:CreateSection("Blox Fruit \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "matsune hub v4\226\157\132\239\184\143 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yatsuraa/Matsune/main/matssunehub.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "MAMA hub \226\157\132\239\184\143 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMAhub1/Mmahub/main/README.md"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Zen Hub \226\157\132\239\184\143 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Bloxfruit \226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Annie Hub \226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/1st-Mars/Annie/main/1st.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "New Dominance Hub \226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Script-Blox/Script/main/Dominance"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "New Trez Hub V2 ( Key required )\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BestScriptEverr/Main-/main/Trezzyisbest", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "MatsuneHubV2 - Winter Update \226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yatsuraa/Yuri/main/Winterhub_V2.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = " PeatEX \226\157\132\239\184\143 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/koonpeatch/PeatEX/master/BKHAX/BloxFruits", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "YagoX HUB ( best auto farm )\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/pokelok/yagoX/main/main"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Fiend HUB\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fiend1sh/FiendMain/main/FiendMainLoader", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "mama hub\226\157\132\239\184\143 ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMAhub1/Mmahub/main/README.md"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "BKHAX\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/koonpeatch/PeatEX/master/BKHAX/BloxFruits"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Perd HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/PerdHub/Blosfruitscript/main/PerdLoader"))()
                                end
                            })
                            vu76.solara:CreateSection("Arsenal \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "AdvanceTech V1.6\226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/AdvanceFTeam/Our-Scripts/main/AdvanceTech/Arsenal_V1.6.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Tbao Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Untitled Script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/JackyPoopoo/cartel/main/0000000000000000000000000000000000000000000000000"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "random sc \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/j5AjqK3i", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Arsenal Script \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Arsenal-IGNORE-13841"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Kowa Hub \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/blix200/kowa-hub/main/kowamain"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Thunder Client \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    lrm_load_script("41f7d88bf584cfbb05c0f507eda3a130")
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "QP HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/QPScript/Script/main/Arsenal.txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Leg HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/G6Ubkkuv"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Hitbox Expander \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/GcS8ZsFZ"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Tanqr HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/mXQLj82U"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Stormware Lite \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox-Exploit/main/Stormware_Crack"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Slient Aim Gui \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/iFDUTWfp"))()
                                end
                            })
                            vu76.solara:CreateSection("Combat Warrior \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Flare Hub  \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/flare"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "CW Hub \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Aimbot \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/utHyEcbk"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Head Hitbox \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/UauTz6D4"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Max HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/1d4db6a1b04aaeccf046f7c63fbad31a.lua"))()
                                end
                            })
                            vu76.solara:CreateSection("Prison Life \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "pladmin (OP) \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Tiger Admin \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox-Exploit/main/TigerAdmin"))()
                                end
                            })
                            vu76.solara:CreateSection("Da Hood \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "vazz \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/mp-8/vazz/main/vvvv", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "OMB Hub \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://paste.gg/p/anonymous/daea1fad85ba4aa782d6409ff5c99de9/files/d9907cfc857a4d0fa8ad8c038bc48bf2/raw", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Azure Modded \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Casahood \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/josheeb0/casahood/main/maingui-obfuscated.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "BeamedWare 2.0 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/EliasAtto1/BeamedWare/main/BeamedWare2.0", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Vortex HUB ( All Module Work ) \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Azure V4  \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomUserRay/UnknownScript/main/AzureV4Test.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Polyaka HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
                                end
                            })
                            vu76.solara:CreateSection("Doors \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Doors \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastefy.app/Sje3EJsH/raw"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "AncestorV2 \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/Maid.txt"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "FFJ HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Doors HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://pastebin.com/raw/M4mpGErb", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Blacking HUB \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGetAsync("https://pastebin.com/raw/R8QMbhzv"))()
                                end
                            })
                            vu76.solara:CreateSection("Bedwars \226\157\132\239\184\143")
                            vu76.solara:CreateButton({
                                ["Name"] = "Snyware NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/AFGCLIENT/Snyware/main/Loader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Polaris V2 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/RunAccount1/PolarisRewrite/main/TempMainScript.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Aether Client NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/CakScripts/AetherClientBW/main/MainScript"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "CoCoKiwi\226\157\132\239\184\143 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/CocoKiwi/main/Cocokiwi"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Red Raven\226\157\132\239\184\143 NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Red-Raven/main/RedRaven_Loader"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "icecat v4\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Baconontop/V4/main/Bedwars"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "icecat v2\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://github.com/Baconontop/bedwarsV2/raw/main/IcecatBedwars", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Oxygen HUB\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/AbsurdFacts/Oxygen/main/MainScript.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Flame X V2\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingDrey/Flame-X-v2/main/Flame%20X%20Bedwars%20V2"))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "Autumn \226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/0x0xLol/Autumn/main/MainScript.lua", true))()
                                end
                            })
                            vu76.solara:CreateButton({
                                ["Name"] = "CoCosploit V2 (dead?)\226\157\132\239\184\143",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/CocoSploit_Solara/main/CocoSploit_Solara_Version_Loader"))()
                                end
                            })
                            vu76.hubs:CreateSection("Hubs \226\173\144")
                            vu76.hubs:CreateButton({
                                ["Name"] = "Argon Hub V6 \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/mcletshacks/Argon-Hub-V6/main/Main.lua", true))()
                                end
                            })
                            vu76.hubs:CreateButton({
                                ["Name"] = "RAFAN HUB \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/NEWBUTIF/Universal-Script-Hub/main/BUTIF%26RAFAN"))()
                                end
                            })
                            vu76.hubs:CreateButton({
                                ["Name"] = "EZ HUB \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua", true))()
                                end
                            })
                            vu76.hubs:CreateButton({
                                ["Name"] = "Unfair HUB \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/rbIxscriptsnet/unfair/main/rblxhub.lua", true))()
                                end
                            })
                            vu76.hubs:CreateButton({
                                ["Name"] = "BidoSkins Hub \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Bido%20Skins%20V1.8"))()
                                end
                            })
                            vu76.hubs:CreateButton({
                                ["Name"] = "BT Project Hub \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-BT-Project-8158"))()
                                end
                            })
                            vu76.hubs:CreateButton({
                                ["Name"] = "QP HUB \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox-Exploit/main/Loader.lua"))()
                                end
                            })
                            vu76.execUI:CreateSection("Executor UI")
                            vu76.execUI:CreateButton({
                                ["Name"] = "Vega X UI \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FreezyWare/Remake-Executor/main/Executor/Krnl-Legacy.Lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "KRNL UI Remake",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/FreezyWare/Remake-Executor/main/Executor/Krnl-Legacy.Lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "Codex ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Codex.lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "Arceus X V3 \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "Synapse X",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "KRNL",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/wtfplayer/redemption/main/krnlnoui.lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "Kiwi ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kiwi-Ui.lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "Krypton ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Krypton.lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "Executor UI ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Execute%20%7C%20UI%20Library.lua"))()
                                end
                            })
                            vu76.execUI:CreateButton({
                                ["Name"] = "MoonUI ",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10"))()
                                end
                            })
                            vu76.admins:CreateSection("Admins")
                            vu76.admins:CreateButton({
                                ["Name"] = "Infinityield delta \226\157\132\239\184\143NEW",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://gist.githubusercontent.com/lxnnydev/c533c374ca4c1dcef4e1e10e33fa4a0c/raw/03e74f184f801dad77d3ebe1e2f18c6ac87ca612/delta___IY.gistfile1.txt.lua", true))()
                                end
                            })
                            vu76.admins:CreateButton({
                                ["Name"] = "Reviz Admin \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Reviz-3841"))()
                                end
                            })
                            vu76.admins:CreateButton({
                                ["Name"] = "Infinityield \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
                                end
                            })
                            vu76.admins:CreateButton({
                                ["Name"] = "Brick Admin BETA \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Brick-Admin-BETA-12105"))()
                                end
                            })
                            vu76.admins:CreateButton({
                                ["Name"] = "QuirkyCMD FE admin \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
                                end
                            })
                            vu76.admins:CreateButton({
                                ["Name"] = "Fates Admin \226\173\144",
                                ["Callback"] = function()
                                    loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
                                end
                            })
                            if getgenv().showAllGameTabs == true then
                                vu26("Venox Hub", "Loading Tabcontent... could take some time!", 4)
                            end
                            getgenv().gameTabs = getgenv().gameTabs or {}
                            getgenv().gameTabsOrder = getgenv().gameTabsOrder or {}
                            local function vu209()
                                local v203 = game.PlaceId
                                local v204 = game.GameId
                                if not getgenv().gameTabs or type(getgenv().gameTabs) ~= "table" then
                                    warn("getgenv().gameTabs is not initialized or is not a table!")
                                    return nil
                                end
                                local v205, v206, v207 = pairs(getgenv().gameTabs)
                                while true do
                                    local v208
                                    v207, v208 = v205(v206, v207)
                                    if v207 == nil then
                                        break
                                    end
                                    if type(v208) == "table" and (v207 == v203 or v208.GameId == v204) and (v208.tabName and v208.tabTitle) then
                                        return v208
                                    end
                                end
                                return nil
                            end;
                            (function()
								-- upvalues: (ref) vu76, (ref) vu66, (ref) vu209
                                if not getgenv().gameTabs or type(getgenv().gameTabs) ~= "table" then
                                    error("getgenv().gameTabs is not a valid table!")
                                end
                                if not getgenv().gameTabsOrder or type(getgenv().gameTabsOrder) ~= "table" then
                                    error("getgenv().gameTabsOrder is not a valid table!")
                                end
                                if getgenv().showAllGameTabs then
                                    local v210, v211, v212 = pairs(getgenv().gameTabsOrder)
                                    while true do
                                        local v213
                                        v212, v213 = v210(v211, v212)
                                        if v212 == nil then
                                            break
                                        end
                                        local v214 = getgenv().gameTabs[v213]
                                        if type(v214) ~= "table" or not (v214.tabName and v214.tabTitle) then
                                            warn("Invalid gameTab for gameId:", v213)
                                        else
                                            local v215 = vu66
                                            vu76[v214.tabName] = v215:CreateTab(v214.tabTitle)
                                        end
                                    end
                                else
                                    local v216 = vu209()
                                    if v216 then
                                        if v216.tabName and v216.tabTitle then
                                            local v217 = vu66:CreateTab(v216.tabTitle)
                                            vu76[v216.tabName] = v217
                                            getgenv().gameTab1 = v216.tabName
                                        else
                                            warn("gameTab is missing required fields: tabName or tabTitle")
                                        end
                                    else
                                        warn("No matching gameTab found for the current game")
                                    end
                                end
                            end)()
                            function GKRSTAB()
								-- upvalues: (ref) vu76
                                vu76.GKRS:CreateSection("Go Kart Race Simulator")
                                vu76.GKRS:CreateButton({
                                    ["Name"] = "OP Script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaitofyp/Go-Kart-Race-Simulator/main/Op%20script"))()
                                    end
                                })
                            end
                            function zosamuraiTAB()
								-- upvalues: (ref) vu76
                                vu76.zosamurai:CreateSection("ZO SAMURAI SWORD FIGHTING")
                                vu76.zosamurai:CreateButton({
                                    ["Name"] = "Gigati \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/negatienjoyer/lumous/main/Gigati.lua"))()
                                    end
                                })
                            end
                            function RateMyAvatarTAB()
								-- upvalues: (ref) vu76
                                vu76.RateMyAvatar:CreateSection("Rate My Avatar")
                                vu76.RateMyAvatar:CreateButton({
                                    ["Name"] = "RateMyAvatar \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/bRnFqhqw"))()
                                    end
                                })
                            end
                            function SurviveTheKillerTAB()
								-- upvalues: (ref) vu76
                                vu76.SurviveTheKiller:CreateSection("Survive the Killer!")
                                vu76.SurviveTheKiller:CreateButton({
                                    ["Name"] = "Serenade Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/4xdhondiscord/SerenadeHub/main/Serenade", true))()
                                    end
                                })
                            end
                            function whoisthespyTAB()
								-- upvalues: (ref) vu76
                                vu76.whosthespy:CreateSection("Who\'s the Spy?")
                                vu76.whosthespy:CreateButton({
                                    ["Name"] = "Who\'s the Spy? \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheExploiterBoy/New-Script/main/who_is_spy"))()
                                    end
                                })
                            end
                            function FlexYourFPSTAB()
								-- upvalues: (ref) vu76
                                vu76.FlexYourFPS:CreateSection("Flex Your FPS!")
                                vu76.FlexYourFPS:CreateButton({
                                    ["Name"] = "Flex Your FPS! \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/flexyourfps"))()
                                    end
                                })
                            end
                            function therapyTAB()
								-- upvalues: (ref) vu76
                                vu76.therapy:CreateSection("therapy")
                                vu76.therapy:CreateButton({
                                    ["Name"] = "therapy  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://gist.githubusercontent.com/Dustin21335/33e8d94f98ff3ed0b5f5cb59a8c3e248/raw/fdfe0c3edebd46d1523cf76aed0f74b0bb33f012/Therapy%20script"))()
                                    end
                                })
                            end
                            function STSimTAB()
								-- upvalues: (ref) vu76
                                vu76.STSim:CreateSection("sword training sim")
                                vu76.STSim:CreateButton({
                                    ["Name"] = "sword training sim  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/0e9Mk0uY"))()
                                        while wait(0.1) do
                                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GameFinalOutcome"):FireServer(unpack({
                                                true,
                                                "Classic"
                                            }))
                                        end
                                    end
                                })
                            end
                            function BasketballLegendsTAB()
								-- upvalues: (ref) vu76
                                vu76.BasketballLegends:CreateSection("Basketball Legends")
                                vu76.BasketballLegends:CreateButton({
                                    ["Name"] = "Basketball Legends \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/arcadie69/Basketball-Legends/main/script"))()
                                    end
                                })
                            end
                            function AOTRevoTAB()
								-- upvalues: (ref) vu76
                                vu76.AOTRevo:CreateSection("Attack on Titan Revolution")
                                vu76.AOTRevo:CreateButton({
                                    ["Name"] = "infinix hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        local v218 = loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua", true))
                                        v218(v218)
                                    end
                                })
                            end
                            function katTAB()
								-- upvalues: (ref) vu76
                                vu76.kat:CreateSection("KAT")
                                vu76.kat:CreateButton({
                                    ["Name"] = "KAT \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Kat-Plus/main/Script"))()
                                    end
                                })
                            end
                            function BoogaBoogaREBORNTAB()
								-- upvalues: (ref) vu76
                                vu76.BoogaBoogaREBORN:CreateSection("Booga Booga [REBORN]")
                                vu76.BoogaBoogaREBORN:CreateButton({
                                    ["Name"] = "booga booga \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/main-booga-booga/main/script%20by%20%40lqmc"))()
                                    end
                                })
                                vu76.BoogaBoogaREBORN:CreateButton({
                                    ["Name"] = "DEVIL HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DEVIL-Script/DEVIL-Hub/main/DEVIL-Hub-Main", true))()
                                    end
                                })
                                vu76.BoogaBoogaREBORN:CreateButton({
                                    ["Name"] = "Slideurs HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/boogauser3533/natsuloader/main/SlideursHub-Loader.lua"))()
                                    end
                                })
                                vu76.BoogaBoogaREBORN:CreateButton({
                                    ["Name"] = "Nil HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Texchy/Nilhub/main/NilhubFree.lua"))()
                                    end
                                })
                                vu76.BoogaBoogaREBORN:CreateButton({
                                    ["Name"] = "Booga Booga HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        getgenv().TSSettings = {
                                            ["key"] = "robloxscripts.com",
                                            ["Style"] = 1,
                                            ["SizeX"] = 500,
                                            ["SizeY"] = 350,
                                            ["Theme"] = "Light",
                                            ["MainFrame"] = Color3.fromRGB(0, 0, 0)
                                        };
                                        (function(p219)
                                            loadstring(game:HttpGet("https://raw.githubusercontent.com/lazywarew/Script/" .. p219))()
                                        end)("/main/loadermain.lua")
                                    end
                                })
                            end
                            function AnimeDefendersTAB()
								-- upvalues: (ref) vu76
                                vu76.AnimeDefenders:CreateSection("Anime Defenders")
                                vu76.AnimeDefenders:CreateButton({
                                    ["Name"] = "BUANG HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/buang5516/buanghub/main/BUANGHUB.lua"))()
                                    end
                                })
                            end
                            function LifeinPrisonTAB()
								-- upvalues: (ref) vu76
                                vu76.LifeinPrison:CreateSection("Life in Prison")
                                vu76.LifeinPrison:CreateButton({
                                    ["Name"] = "LifeinPrison  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Emircxy/Lear/main/Life%20\196\176n%20Prison"))()
                                    end
                                })
                            end
                            function TappingLegendsFinalTAB()
								-- upvalues: (ref) vu76
                                vu76.TappingLegendsFinal:CreateSection("Tapping Legends Final")
                                vu76.TappingLegendsFinal:CreateButton({
                                    ["Name"] = "World Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NhatMinhVNQ/w-hub/main/WORLDHUB.lua"))()
                                    end
                                })
                            end
                            function CloseYourEyesTAB()
								-- upvalues: (ref) vu76
                                vu76.CloseYourEyes:CreateSection("Close Your Eyes")
                                vu76.CloseYourEyes:CreateButton({
                                    ["Name"] = "hub cye  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/CloseYourEyes.lua"))()
                                    end
                                })
                            end
                            function WarriorSimulatorTAB()
								-- upvalues: (ref) vu76
                                vu76.WarriorSimulator:CreateSection("Warrior Simulator")
                                vu76.WarriorSimulator:CreateButton({
                                    ["Name"] = "Project Nexus \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Warrior-Simulator/main/Warrior%20Simulator%20Fluent"))()
                                    end
                                })
                            end
                            function PressureTAB()
								-- upvalues: (ref) vu76
                                vu76.Pressure:CreateSection("Pressure")
                                vu76.Pressure:CreateButton({
                                    ["Name"] = "pressure script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2024/main/pressure"))()
                                    end
                                })
                                vu76.Pressure:CreateButton({
                                    ["Name"] = "Invincible \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/pressure%20god.lua"))()
                                    end
                                })
                            end
                            function BRQUIZFreakyTAB()
								-- upvalues: (ref) vu76
                                vu76.BRQUIZFreaky:CreateSection("BRAINROT Quiz Freaky")
                                vu76.BRQUIZFreaky:CreateButton({
                                    ["Name"] = "lqmc script   \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/brainrot-quiz/main/made%20by%20%40lqmc%20open%20source%20idc"))()
                                    end
                                })
                            end
                            function LivetopiaTownHallTAB()
								-- upvalues: (ref) vu76
                                vu76.LivetopiaTownHall:CreateSection("Livetopia Town Hall")
                                vu76.LivetopiaTownHall:CreateButton({
                                    ["Name"] = "Darkones L1ve Topia \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Live%20Topia%20GUI"))()
                                    end
                                })
                            end
                            function westboundTAB()
								-- upvalues: (ref) vu76
                                vu76.westbound:CreateSection("Westbound")
                                vu76.westbound:CreateButton({
                                    ["Name"] = "Westbound \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/westbound"))()
                                    end
                                })
                                vu76.westbound:CreateButton({
                                    ["Name"] = "Speed, Aimbot, ESP and more.. \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Westbound-Speed-and-Aimbot-and-ESP-and-Teleports-and-More-6503"))()
                                    end
                                })
                                vu76.westbound:CreateButton({
                                    ["Name"] = "Thunderclient Solara \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Arsenal-Thunder-Client-For-Solara-13092"))()
                                    end
                                })
                            end
                            function CarDrivingUltimateTAB()
								-- upvalues: (ref) vu76
                                vu76.CarDrivingUltimate:CreateSection("Car Driving Ultimate")
                                vu76.CarDrivingUltimate:CreateButton({
                                    ["Name"] = "owner id script (idk what it does) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        if game.CreatorType == Enum.CreatorType.User then
                                            game:GetService("Players").LocalPlayer.UserId = game.CreatorId
                                        end
                                        if game.CreatorType == Enum.CreatorType.Group then
                                            game:GetService("Players").LocalPlayer.UserId = game:GetService("GroupService"):GetGroupInfoAsync(game.CreatorId).Owner.Id
                                        end
                                    end
                                })
                            end
                            function untitledboxinggameTAB()
								-- upvalues: (ref) vu76
                                vu76.untitledboxinggame:CreateSection("Untitled Boxing Game")
                                vu76.untitledboxinggame:CreateButton({
                                    ["Name"] = "Boxing  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nyaha3222/Visualz/main/Untitled/Boxing%20/Game/Script"))()
                                    end
                                })
                            end
                            function DestructionSimulatorTAB()
								-- upvalues: (ref) vu76
                                vu76.DestructionSimulator:CreateSection("Destruction Simulator")
                                vu76.DestructionSimulator:CreateButton({
                                    ["Name"] = "Waza Script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://waza-scripts.vercel.app/script/DestructionSimulator"))()
                                    end
                                })
                                vu76.DestructionSimulator:CreateButton({
                                    ["Name"] = "DS HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Destruction-Simulator-*OP*-GUI-1858"))()
                                    end
                                })
                                vu76.DestructionSimulator:CreateButton({
                                    ["Name"] = "INF COIN + LV \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/destructionsim"))()
                                    end
                                })
                            end
                            function beaparkourninjaTAB()
								-- upvalues: (ref) vu76
                                vu76.beaparkourninja:CreateSection("Be a Parkour Ninja")
                                vu76.beaparkourninja:CreateButton({
                                    ["Name"] = "AutoFarm 2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/Quasar/main/src/Scripts/Non-Related/Ninja.lua"))()
                                    end
                                })
                                vu76.beaparkourninja:CreateButton({
                                    ["Name"] = "Autofarm \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/beaparkourninja_AutoFarm"))()
                                    end
                                })
                            end
                            function FTNLCTAB()
								-- upvalues: (ref) vu76
                                vu76.FTNLC:CreateSection("Feed The Noob Like Crazy")
                                vu76.FTNLC:CreateButton({
                                    ["Name"] = "Feed The Noob Like Crazy \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        local vu220 = game:GetService("ReplicatedStorage")
                                        local vu221 = game:GetService("Players").LocalPlayer
                                        local vu222 = {
                                            "Galaxy Taco",
                                            "LeftHand"
                                        }
                                        local vu223 = {
                                            "Galaxy Taco",
                                            "RightHand"
                                        }
                                        local vu224 = CFrame.new(11.9789648, 2.99999952, 27.8490162, - 0.124070153, 8.17105814e-8, - 0.99227345, - 1.86184206e-8, 1, 8.46748165e-8, 0.99227345, 2.898018e-8, - 0.124070153)
                                        local vu225 = false
                                        local function v227()
											-- upvalues: (ref) vu225, (ref) vu221, (ref) vu224, (ref) vu220, (ref) vu222, (ref) vu223
                                            local v226 = not vu225 and workspace:FindFirstChild("FoodEating")
                                            if v226 then
                                                v226:Destroy()
                                                vu225 = true
                                            end
                                            vu221.Character.HumanoidRootPart.CFrame = vu224
                                            vu220:WaitForChild("Rebirth"):FireServer()
                                            vu220:WaitForChild("FoodRemoteEvent"):FireServer(unpack(vu222))
                                            vu220:WaitForChild("FoodRemoteEvent"):FireServer(unpack(vu223))
                                        end
                                        while task.wait(0.35) do
                                            v227()
                                        end
                                    end
                                })
                            end
                            function BaddiesTAB()
								-- upvalues: (ref) vu76
                                vu76.Baddies:CreateSection("Baddies")
                                vu76.Baddies:CreateButton({
                                    ["Name"] = "Baddies \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/baddies"))()
                                    end
                                })
                            end
                            function ZombieRushTAB()
								-- upvalues: (ref) vu76
                                vu76.ZombieRush:CreateSection("Zombie-Rush")
                                vu76.ZombieRush:CreateButton({
                                    ["Name"] = "ZombieRush newest script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptfree/lua/main/private/zombie-rush"))()
                                    end
                                })
                            end
                            function BIGPaintball1TAB()
								-- upvalues: (ref) vu76
                                vu76.BIGPaintball1:CreateSection("BIG Paintball Classic")
                                vu76.BIGPaintball1:CreateButton({
                                    ["Name"] = "BIGPaintball1  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://paste.ee/r/06eGU/0"))()
                                    end
                                })
                            end
                            function TPS_StreetSoccerTAB()
								-- upvalues: (ref) vu76
                                vu76.TPS_StreetSoccer:CreateSection("TPS: Street Soccer")
                                vu76.TPS_StreetSoccer:CreateButton({
                                    ["Name"] = "Byte Hub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/TPS-Script/main/Main-ByteHub.lua"))()
                                    end
                                })
                                vu76.TPS_StreetSoccer:CreateButton({
                                    ["Name"] = "xf  \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/xfaz/newtps/main/kuchi"))()
                                    end
                                })
                            end
                            function RushPointTAB()
								-- upvalues: (ref) vu76
                                vu76.RushPoint:CreateSection("Rush Point")
                                vu76.RushPoint:CreateButton({
                                    ["Name"] = "ESP Sc  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AtomGotIce/Scripts/main/RushPoint%20Chams"))()
                                    end
                                })
                            end
                            function eatslimetogethugeTAB()
								-- upvalues: (ref) vu76
                                vu76.eatslimetogethuge:CreateSection("eat slime to get huge")
                                vu76.eatslimetogethuge:CreateButton({
                                    ["Name"] = "Vision Hub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/eat-slime-to-get-huge/main/by%20%40lqmc"))()
                                    end
                                })
                            end
                            function LumberTycoon2TAB()
								-- upvalues: (ref) vu76
                                vu76.LumberTycoon2:CreateSection("Lumber-Tycoon-2")
                                vu76.LumberTycoon2:CreateButton({
                                    ["Name"] = "Butter Hub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Butterisgood/Butter/main/Root2.lua"))()
                                    end
                                })
                            end
                            function ESYG1SBYOaBikeTAB()
								-- upvalues: (ref) vu76
                                vu76.ESYG1SBYOaBike:CreateSection("Every Second You Get +1 Speed But You\226\128\153re On a Bike")
                                vu76.ESYG1SBYOaBike:CreateButton({
                                    ["Name"] = "by lqmc script  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/every-second-u-get-1-speed-but-ur-on-a-bike/main/script%20by%20me"))()
                                    end
                                })
                            end
                            function OperationsSiegeTAB()
								-- upvalues: (ref) vu76
                                vu76.OperationsSiege:CreateSection("Operations-Siege")
                                vu76.OperationsSiege:CreateButton({
                                    ["Name"] = "AirHub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
                                    end
                                })
                                vu76.OperationsSiege:CreateButton({
                                    ["Name"] = "AirHub-V2  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub-V2/main/src/Main.lua"))()
                                    end
                                })
                                vu76.OperationsSiege:CreateButton({
                                    ["Name"] = "2 combined?  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        game:HttpGet("https://getexploits.com/cexecution/730857759301718016")
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
                                    end
                                })
                            end
                            function BridgeDuelsTAB()
								-- upvalues: (ref) vu76
                                vu76.BridgeDuels:CreateSection("Bridge Duels")
                                vu76.BridgeDuels:CreateButton({
                                    ["Name"] = "Levitate  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/StaryLOL/LevitateRoblox/main/LevitateLoader.lua", true))()
                                    end
                                })
                                vu76.BridgeDuels:CreateButton({
                                    ["Name"] = "8 ball hub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:GetObjects("rbxassetid://18520035557")[1].Source)()
                                    end
                                })
                            end
                            function DemonPieceTAB()
								-- upvalues: (ref) vu76
                                vu76.DemonPiece:CreateSection("Demon Piece")
                                vu76.DemonPiece:CreateButton({
                                    ["Name"] = "Demonic HUB V2 (keysystem :/ )  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        getgenv().ValidateType = "Key"
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Prosexy/Demonic-HUB-V2/main/DemonicHub_V2.lua", true))()
                                    end
                                })
                                vu76.DemonPiece:CreateButton({
                                    ["Name"] = "OMG HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
                                    end
                                })
                            end
                            function ProjectSmashTAB()
								-- upvalues: (ref) vu76
                                vu76.ProjectSmash:CreateSection("Project Smash")
                                vu76.ProjectSmash:CreateButton({
                                    ["Name"] = "Lightux HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md", true))()
                                    end
                                })
                                vu76.ProjectSmash:CreateButton({
                                    ["Name"] = "skid hub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kelv1v/skidhub/main/Loader/loader.lua"))()
                                    end
                                })
                                vu76.ProjectSmash:CreateButton({
                                    ["Name"] = "AutoFarm  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(Game:HttpGet("https://raw.githubusercontent.com/SumitScripts/Lil/main/Source"))()
                                    end
                                })
                            end
                            function DungeonRNGTAB()
								-- upvalues: (ref) vu76
                                vu76.DungeonRNG:CreateSection("Dungeon RNG")
                                vu76.DungeonRNG:CreateButton({
                                    ["Name"] = "Solix HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/DungeonsRng/main/Demon%20Fall.lua", true))()
                                    end
                                })
                                vu76.DungeonRNG:CreateButton({
                                    ["Name"] = "ywxoscripts  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/YdBXp4B4"))()
                                    end
                                })
                                vu76.DungeonRNG:CreateButton({
                                    ["Name"] = "Tora HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/DungeonRNG", true))()
                                    end
                                })
                            end
                            function DemonFallTAB()
								-- upvalues: (ref) vu76
                                vu76.DemonFall:CreateSection("Demon Fall")
                                vu76.DemonFall:CreateButton({
                                    ["Name"] = "script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Demonfall-2.65-Demon-Fall-Script-6131"))()
                                    end
                                })
                                vu76.DemonFall:CreateButton({
                                    ["Name"] = "LH HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/BladeNew/main/Demon"))()
                                    end
                                })
                                vu76.DemonFall:CreateButton({
                                    ["Name"] = "L4BIB HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LabibKazi858/Scripts/main/DemonFall"))()
                                    end
                                })
                                vu76.DemonFall:CreateButton({
                                    ["Name"] = "NOOB HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NOOBHUBX/DemonFall/main/NOOB%20HUB.Lua", true))()
                                    end
                                })
                                vu76.DemonFall:CreateButton({
                                    ["Name"] = "Solix HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/DemonFall/main/Protected_5890964956813037.txt", true))()
                                    end
                                })
                            end
                            function BeeSwarmSimTAB()
								-- upvalues: (ref) vu76
                                vu76.BeeSwarmSim:CreateSection("Bee Swarm Simulator")
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "RBScr1pts HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/N4weEdmM"))()
                                    end
                                })
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "bws script  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/Tabby/main/TabbyMaster.lua", true))()
                                    end
                                })
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "Snowflakes Farm \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox/main/BSSSnowFarm"))()
                                    end
                                })
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "BaconBoss HUB \226\173\144\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeSwarmSim/main/BeeSwarmSim"))()
                                    end
                                })
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "Macro V3 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://www.macrov2-script.xyz/macrov3.lua"))()
                                    end
                                })
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "Adel HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AdelOnTheTop/Adel-Hub/main/Main.lua"))()
                                    end
                                })
                                vu76.BeeSwarmSim:CreateButton({
                                    ["Name"] = "Histy HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Histy"))()
                                    end
                                })
                            end
                            function ZombieUprisingTAB()
								-- upvalues: (ref) vu76
                                vu76.ZombieUprising:CreateSection("Zombie Uprising")
                                vu76.ZombieUprising:CreateButton({
                                    ["Name"] = "Unknow HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownproooolucky/Unknown-Hub-X-Universal-Games/main/Games/Zombie-Uprising"))()
                                    end
                                })
                            end
                            function fightinaschoolTAB()
								-- upvalues: (ref) vu76
                                vu76.fightinaschool:CreateSection("fight in a school")
                                vu76.fightinaschool:CreateButton({
                                    ["Name"] = "Dope Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/VC-+-NEW-STYLES-fight-in-a-school-Dope-Hub-14582"))()
                                    end
                                })
                                vu76.fightinaschool:CreateButton({
                                    ["Name"] = "script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2d566786c4bcee0a23e4543e0d3bd8b0.lua"))()
                                    end
                                })
                                vu76.fightinaschool:CreateButton({
                                    ["Name"] = "fight in a school \226\173\144Solara Support",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/Fight-in-a-school/main/Solara"))()
                                    end
                                })
                            end
                            function JimsRNGTAB()
								-- upvalues: (ref) vu76
                                vu76.JimsRNG:CreateSection("Jim\'s RNG")
                                vu76.JimsRNG:CreateButton({
                                    ["Name"] = "Jim\'s RNG \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/jimsrng"))()
                                    end
                                })
                                vu76.JimsRNG:CreateButton({
                                    ["Name"] = "Jim\'s RNG \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/jimsrng.lua"))()
                                    end
                                })
                            end
                            function DinosaurSimulatorTAB()
								-- upvalues: (ref) vu76
                                vu76.DinosaurSimulator:CreateSection("Dinosaur Simulator")
                                vu76.DinosaurSimulator:CreateButton({
                                    ["Name"] = "Dinosaur Simulator \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/dinosim.lua"))()
                                    end
                                })
                            end
                            function WizardTycoon2PlayerTAB()
								-- upvalues: (ref) vu76
                                vu76.WizardTycoon2Player:CreateSection("Wizard Tycoon - 2 Player")
                                vu76.WizardTycoon2Player:CreateButton({
                                    ["Name"] = "Wizard Tycoon - 2 Player \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Wizard%20Tycoon%20-%202%20Player/2pWizardTycoonGUI"))()
                                    end
                                })
                            end
                            function BreakIn1TAB()
								-- upvalues: (ref) vu76
                                vu76.BreakIn1:CreateSection("Break In 1")
                                vu76.BreakIn1:CreateButton({
                                    ["Name"] = "Break In 1 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/submitted/breakin1.lua"))()
                                    end
                                })
                            end
                            function raiseafloppa2TAB()
								-- upvalues: (ref) vu76
                                vu76.raiseafloppa2:CreateSection("raise a floppa 2")
                                vu76.raiseafloppa2:CreateButton({
                                    ["Name"] = "raise a floppa 2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/raisefloppa.lua"))()
                                    end
                                })
                            end
                            function MonkeyTycoonTAB()
								-- upvalues: (ref) vu76
                                vu76.MonkeyTycoon:CreateSection("Monkey Tycoon")
                                vu76.MonkeyTycoon:CreateButton({
                                    ["Name"] = "Monkey Tycoon \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/monkeytycoon.lua"))()
                                    end
                                })
                            end
                            function CarDealershipTycoonTAB()
								-- upvalues: (ref) vu76
                                vu76.CarDealershipTycoon:CreateSection("Car Dealership Tycoon")
                                vu76.CarDealershipTycoon:CreateButton({
                                    ["Name"] = "Car Dealership Tycoon \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/cardealership.lua"))()
                                    end
                                })
                            end
                            function JujutsuShenanigansTAB()
								-- upvalues: (ref) vu76
                                vu76.JujutsuShenanigans:CreateSection("Jujutsu Shenanigans")
                                vu76.JujutsuShenanigans:CreateButton({
                                    ["Name"] = "JS Script \226\157\132\239\184\143NEW ",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/ray-makk/main/Loader"))()
                                    end
                                })
                                vu76.JujutsuShenanigans:CreateButton({
                                    ["Name"] = "Jujutsu Shenanigans\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Jujutsu/main/Shenanigans"))()
                                    end
                                })
                            end
                            function FlingThingsandPeopleTAB()
								-- upvalues: (ref) vu76
                                vu76.FlingThingsandPeople:CreateSection("Fling Things and People")
                                vu76.FlingThingsandPeople:CreateButton({
                                    ["Name"] = "Fling Things and People (copies key)\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/FTAP.lua"))()
                                        setclipboard("JuniorFilhoDoBlizT")
                                    end
                                })
                            end
                            function ProjectSlayerTAB()
								-- upvalues: (ref) vu76
                                vu76.ProjectSlayer:CreateSection("Project Slayer")
                                vu76.ProjectSlayer:CreateButton({
                                    ["Name"] = "try out \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/Scripts2024/main/newprojslayrs"))()
                                    end
                                })
                                vu76.ProjectSlayer:CreateButton({
                                    ["Name"] = "Project Slayer \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/projectslayer.lua"))()
                                    end
                                })
                            end
                            function TaxiBossTAB()
								-- upvalues: (ref) vu76
                                vu76.TaxiBoss:CreateSection("Taxi Boss")
                                vu76.TaxiBoss:CreateButton({
                                    ["Name"] = "TaxiBoss \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/5ScA4pR9"))()
                                    end
                                })
                                vu76.TaxiBoss:CreateButton({
                                    ["Name"] = "Taxi Boss \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Taxi%20Boss"))()
                                    end
                                })
                            end
                            function CRDSTAB()
								-- upvalues: (ref) vu76
                                vu76.CRDS:CreateSection("Cart Ride Delivery Service")
                                vu76.CRDS:CreateButton({
                                    ["Name"] = "Cart Ride Delivery Service \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/cartridedeliveryservice.lua"))()
                                    end
                                })
                            end
                            function RaceClickerTAB()
								-- upvalues: (ref) vu76
                                vu76.RaceClicker:CreateSection("Race Clicker")
                                vu76.RaceClicker:CreateButton({
                                    ["Name"] = "raceclicker script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Saaakai/Random-Roblox-Script/main/Race%20Clicker"))()
                                    end
                                })
                                vu76.RaceClicker:CreateButton({
                                    ["Name"] = "new rc \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/race-clicker/main/race%20clicker"))()
                                    end
                                })
                                vu76.RaceClicker:CreateButton({
                                    ["Name"] = "Race Clicker \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/raceclicker.lua"))()
                                    end
                                })
                            end
                            function TypesoulTAB()
								-- upvalues: (ref) vu76
                                vu76.Typesoul:CreateSection("Type soul")
                                vu76.Typesoul:CreateButton({
                                    ["Name"] = "Type soul \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/newtype/main/soul"))()
                                    end
                                })
                            end
                            function PillarChase2TAB()
								-- upvalues: (ref) vu76
                                vu76.PillarChase2:CreateSection("Pillar Chase 2")
                                vu76.PillarChase2:CreateButton({
                                    ["Name"] = "[4th Skins] Pillar Chase 2\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://rawscripts.net/raw/4th-Skins-Pillar-Chase-2-felssj-15496"))()
                                    end
                                })
                                vu76.PillarChase2:CreateButton({
                                    ["Name"] = "Pillar Chase 2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/fbenable.lua"))()
                                    end
                                })
                                vu76.PillarChase2:CreateButton({
                                    ["Name"] = "Pillar Chase 2 anth\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/pillarchase2.lua"))()
                                    end
                                })
                            end
                            function AbilityWarsTAB()
								-- upvalues: (ref) vu76
                                vu76.AbilityWars:CreateSection("Ability Wars")
                                vu76.AbilityWars:CreateButton({
                                    ["Name"] = "AbilityWars Script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptMaster1/ScriptMaster-Hub/main/AbilityWars.lua"))()
                                    end
                                })
                                vu76.AbilityWars:CreateButton({
                                    ["Name"] = "Ability Wars \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://paste.ee/r/Wo5Kj"))()
                                    end
                                })
                            end
                            function AOPGTAB()
								-- upvalues: (ref) vu76
                                vu76.AOPG:CreateSection("A One Piece game")
                                vu76.AOPG:CreateButton({
                                    ["Name"] = "A One Piece game \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://rawscripts.net/raw/Testing-A-0ne-Piece-Game-LeadMarkerAOPG-1595"))()
                                    end
                                })
                            end
                            function DungeonquestTAB()
								-- upvalues: (ref) vu76
                                vu76.Dungeonquest:CreateSection("Dungeon quest")
                                vu76.Dungeonquest:CreateButton({
                                    ["Name"] = "Dungeon quest \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/F5vSFHZt"))()
                                    end
                                })
                            end
                            function BadBusinessTAB()
								-- upvalues: (ref) vu76
                                vu76.BadBusiness:CreateSection("Bad Busines")
                                vu76.BadBusiness:CreateButton({
                                    ["Name"] = "homehack \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/loader.lua"))()
                                    end
                                })
                                vu76.BadBusiness:CreateButton({
                                    ["Name"] = "Bad Busines \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/bad%20business.lua"))()
                                    end
                                })
                            end
                            function funkyfridayTAB()
								-- upvalues: (ref) vu76
                                vu76.funkyfriday:CreateSection("funky friday")
                                vu76.funkyfriday:CreateButton({
                                    ["Name"] = "Uni Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/dcyuEgyK"))()
                                    end
                                })
                                vu76.funkyfriday:CreateButton({
                                    ["Name"] = "AutoPlay ( by Fsploit ) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/Funkyfriday-new/main/How-to-funky-friday-script-new", true))()
                                    end
                                })
                                vu76.funkyfriday:CreateButton({
                                    ["Name"] = "Best AutoPlayer \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/Funky%20Friday/BotPlayer.lua"))()
                                    end
                                })
                                vu76.funkyfriday:CreateButton({
                                    ["Name"] = "AutoPlayer Mobile \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/RandomScript/main/FunkyFridayMobile"))()
                                    end
                                })
                                vu76.funkyfriday:CreateButton({
                                    ["Name"] = "funky friday \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZoinkyPoinkie/FunkyFridayDevTools/main/Un-Obfuscated"))()
                                    end
                                })
                            end
                            function RoBeatsTAB()
								-- upvalues: (ref) vu76
                                vu76.RoBeats:CreateSection("RoBeats")
                                vu76.RoBeats:CreateButton({
                                    ["Name"] = "RoBeats \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/RoBeats.lua"))()
                                    end
                                })
                            end
                            function NavalWarfareTAB()
								-- upvalues: (ref) vu76
                                vu76.NavalWarfare:CreateSection("Naval Warfare")
                                vu76.NavalWarfare:CreateButton({
                                    ["Name"] = "New one \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://shz.al/~naval"))()
                                    end
                                })
                                vu76.NavalWarfare:CreateButton({
                                    ["Name"] = "Naval Warfare \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/NavalWarfare.lua"))()
                                    end
                                })
                            end
                            function undergroundwar2TAB()
								-- upvalues: (ref) vu76
                                vu76.undergroundwar2:CreateSection("underground war 2.0")
                                vu76.undergroundwar2:CreateButton({
                                    ["Name"] = "underground war 2.0 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/UndergroundWar"))()
                                    end
                                })
                            end
                            function fleethefacilityTAB()
								-- upvalues: (ref) vu76
                                vu76.fleethefacility:CreateSection("flee the facility")
                                vu76.fleethefacility:CreateButton({
                                    ["Name"] = "flee the facility \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/paste/fleethefacility.lua"))()
                                    end
                                })
                            end
                            function CabinCrewSimulatorTAB()
								-- upvalues: (ref) vu76
                                vu76.CabinCrewSimulator:CreateSection("Cabin Crew Simulator")
                                vu76.CabinCrewSimulator:CreateButton({
                                    ["Name"] = "Cabin Crew Simulator \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/CabinCrewSim.lua"))()
                                    end
                                })
                            end
                            function CarDrivingSimulatorTAB()
								-- upvalues: (ref) vu76
                                vu76.CarDrivingSimulator:CreateSection("Car Driving Simulator")
                                vu76.CarDrivingSimulator:CreateButton({
                                    ["Name"] = "Car Driving Simulator \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/CarDrivingSimulator.lua"))()
                                    end
                                })
                            end
                            function RarityFactoryTycoonTAB()
								-- upvalues: (ref) vu76
                                vu76.RarityFactoryTycoon:CreateSection("Rarity Factory Tycoon")
                                vu76.RarityFactoryTycoon:CreateButton({
                                    ["Name"] = "Rarity Factory Tycoon \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/RarityFactoryTycoon.lua"))()
                                    end
                                })
                            end
                            function RivalsTAB()
								-- upvalues: (ref) vu76
                                vu76.Rivals:CreateSection("Rivals")
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Thunder Client \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/25bef65fd4756876a25c68d1297b80a6.lua"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Tide Client \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/flowsouthw/tidehub/main/scriptloader"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "venoxware \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivalsv2"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Reiatsu.fr \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d4ba34a735cc7f21331af91315cc70ed.lua"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "homehack  \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/loader.lua"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Tbao Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubRivals"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "midnightcc \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Frosties Rival Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/Rivals.lua"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Phantom HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/5oxin/Phantom/main/main"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "jonny hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/rivals/main/rival"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "RV HUB \226\173\144",
                                    ["Callback"] = function()
                                        local v228 = game:HttpGet("https://raw.githubusercontent.com/Sheeshablee73/Scriptss/main/RivalsUPD2.lua")
                                        loadstring(v228)()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "LB HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/RIVALS/main/Roblox"))()
                                    end
                                })
                                vu76.Rivals:CreateButton({
                                    ["Name"] = "Rivals \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
                                    end
                                })
                            end
                            function UnnamedShooterTAB()
								-- upvalues: (ref) vu76
                                vu76.UnnamedShooter:CreateSection("Unnamed Shooter")
                                vu76.UnnamedShooter:CreateButton({
                                    ["Name"] = "UnnamedShooter \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/unnamed-shooter/main/unnamed%20shooter?token=GHSAT0AAAAAACUEJGNCF5HUPQ34ZESDUSOMZUKXYGQ"))()
                                    end
                                })
                            end
                            function ScytheSimTAB()
								-- upvalues: (ref) vu76
                                vu76.ScytheSim:CreateSection("Scythe Sim")
                                vu76.ScytheSim:CreateButton({
                                    ["Name"] = "scythe sim sc \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/scythe-sim/main/scythe%20sim"))()
                                    end
                                })
                            end
                            function EpicMinigamesTAB()
								-- upvalues: (ref) vu76
                                vu76.EpicMinigames:CreateSection("EpicMinigames")
                                vu76.EpicMinigames:CreateButton({
                                    ["Name"] = "EMG GUI \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
                                    end
                                })
                            end
                            function HoopzTAB()
								-- upvalues: (ref) vu76
                                vu76.Hoopz:CreateSection("Hoopz")
                                vu76.Hoopz:CreateButton({
                                    ["Name"] = "Hoopz OP \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Hoopz-VEHICLES-(Basketball)-Best-Hoopz-OP-Script-2152"))()
                                    end
                                })
                                vu76.Hoopz:CreateButton({
                                    ["Name"] = "6ce GUI \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/6ce/Roblox-Hoopz-Scripts/main/GUI.lua", true))()
                                    end
                                })
                            end
                            function TrackFieldInfiniteTAB()
								-- upvalues: (ref) vu76
                                vu76.TrackFieldInfinite:CreateSection("Track Field Infinite")
                                vu76.TrackFieldInfinite:CreateButton({
                                    ["Name"] = "taf \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cnzins1/scripts/main/track%20and%20field"))()
                                    end
                                })
                                vu76.TrackFieldInfinite:CreateButton({
                                    ["Name"] = "retardwar3 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RETARDWAR3/retardware-main/main/Trackandfield.lua"))()
                                    end
                                })
                                vu76.TrackFieldInfinite:CreateButton({
                                    ["Name"] = "another sc \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/GuizzyisbackV2LOL/Track-Field/main/free.lua"))()
                                    end
                                })
                                vu76.TrackFieldInfinite:CreateButton({
                                    ["Name"] = "Best one? (key copies) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        setclipboard("BestTrackGood!!23144")
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Field/main/Track"))()
                                    end
                                })
                            end
                            function FootballFusion2TAB()
								-- upvalues: (ref) vu76
                                vu76.FootballFusion2:CreateSection("Football Fusion 2")
                                vu76.FootballFusion2:CreateButton({
                                    ["Name"] = "fr idk  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bb2ce6c8f95b42ecec9c45399081758b.lua"))()
                                    end
                                })
                                vu76.FootballFusion2:CreateButton({
                                    ["Name"] = "sc1 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bc2d4cf963197247f6ad8df82ee73817.lua"))()
                                    end
                                })
                                vu76.FootballFusion2:CreateButton({
                                    ["Name"] = "sc2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bc2d4cf963197247f6ad8df82ee73817.lua"))()
                                    end
                                })
                            end
                            function criminalityTAB()
								-- upvalues: (ref) vu76
                                vu76.criminality:CreateSection("Criminality")
                                vu76.criminality:CreateButton({
                                    ["Name"] = "ESP \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/FREE-Criminality-ESP-or-Free-and-undetected-1885"))()
                                    end
                                })
                            end
                            function eattheworldTAB()
								-- upvalues: (ref) vu76
                                vu76.eattheworld:CreateSection("Eat The World")
                                vu76.eattheworld:CreateButton({
                                    ["Name"] = "EatTheWorld \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/EatWorld"))()
                                    end
                                })
                            end
                            function flagwarsTAB()
								-- upvalues: (ref) vu76
                                vu76.flagwars:CreateSection("Flag Wars")
                                vu76.flagwars:CreateButton({
                                    ["Name"] = "Flag Wars Sc \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/frankblox/rbxscripts/main/0flagwarssss"))()
                                    end
                                })
                            end
                            function gunfightarenaTAB()
								-- upvalues: (ref) vu76
                                vu76.gunfightarena:CreateSection("Gun Fight Arena")
                                vu76.gunfightarena:CreateButton({
                                    ["Name"] = "GFA \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastefy.app/FL5mxhtj/raw", true))()
                                    end
                                })
                            end
                            function micupTAB()
								-- upvalues: (ref) vu76
                                vu76.micup:CreateSection("Mic Up")
                                vu76.micup:CreateButton({
                                    ["Name"] = "kitty hub  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
                                    end
                                })
                                vu76.micup:CreateButton({
                                    ["Name"] = "Sky Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/3008-2.73-teleport-to-player-worker-esp-grab-food-no-fall-damage-12949"))()
                                    end
                                })
                            end
                            function recodeuntitledtaggameTAB()
								-- upvalues: (ref) vu76
                                vu76.recodeuntitledtaggame:CreateSection("Recode Untitled Tag Game")
                                vu76.recodeuntitledtaggame:CreateButton({
                                    ["Name"] = "Tag All \226\173\144",
                                    ["Callback"] = function()
                                        local v229, v230 = pcall(game.HttpGet, game, ("https://%s/%s"):format("skibiditoilet.free-robux.click", "p/raw/bryvmasag5"))
                                        taggame = v230
                                        untitled = v229
                                        assert(untitled, "Couldnt retrieve script,", taggame)
                                        loadstring(taggame)()
                                        game:GetService("UserInputService").MouseIconEnabled = true
                                    end
                                })
                            end
                            function tridentsurvivalTAB()
								-- upvalues: (ref) vu76
                                vu76.tridentsurvival:CreateSection("Trident Survival")
                                vu76.tridentsurvival:CreateButton({
                                    ["Name"] = "fartspl \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://farts.pl/fartspl.lua"), true)()
                                    end
                                })
                                vu76.tridentsurvival:CreateButton({
                                    ["Name"] = "2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/zalg0231/load/main/load"))()
                                    end
                                })
                                vu76.tridentsurvival:CreateButton({
                                    ["Name"] = "TS \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://efial.wtf/Scripts/Trident%20(NEW).lua", true))()
                                    end
                                })
                            end
                            function myrestaurantTAB()
								-- upvalues: (ref) vu76
                                vu76.myrestaurant:CreateSection("My Restaurant")
                                vu76.myrestaurant:CreateButton({
                                    ["Name"] = "MR HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/uBpUr2vU"))()
                                    end
                                })
                                vu76.myrestaurant:CreateButton({
                                    ["Name"] = "MR HUB 2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/mr.lua"))()
                                    end
                                })
                            end
                            function warmachinesTAB()
								-- upvalues: (ref) vu76
                                vu76.warmachines:CreateSection("War Machines")
                                vu76.warmachines:CreateButton({
                                    ["Name"] = "war machines script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/NTQ3Tszv"))()
                                    end
                                })
                                vu76.warmachines:CreateButton({
                                    ["Name"] = "AutoFarm \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox/main/WarMachines"))()
                                    end
                                })
                            end
                            function phantomforceTAB()
								-- upvalues: (ref) vu76
                                vu76.phantomforce:CreateSection("Phantom Force")
                                vu76.phantomforce:CreateButton({
                                    ["Name"] = "homehack \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        getgenv().load_rewrite = true
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/loader.lua"))()
                                    end
                                })
                                vu76.phantomforce:CreateButton({
                                    ["Name"] = "Parvus HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        local v231 = "main"
                                        local v232 = "https://raw.githubusercontent.com/AlexR32/Parvus/" .. v231 .. "/"
                                        loadstring(game:HttpGet(v232 .. "Loader.lua"), "Loader")(v231, 30)
                                    end
                                })
                                vu76.phantomforce:CreateButton({
                                    ["Name"] = "DeleteMob \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/QaK6BeWq"))()
                                    end
                                })
                                vu76.phantomforce:CreateButton({
                                    ["Name"] = "Homehack \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/homohack.lua"))()
                                    end
                                })
                            end
                            function tycoonRngTAB()
								-- upvalues: (ref) vu76, (ref) vu26
                                vu76.tycoonrng:CreateSection("Tycoon RNG")
                                vu76.tycoonrng:CreateButton({
                                    ["Name"] = "LH HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
										-- upvalues: (ref) vu26
                                        setclipboard("TycoonRNGBest!!8437New")
                                        vu26("Venox Hub", "key copied to clipboard!", 3)
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Tycoon/main/RNG"))()
                                    end
                                })
                                vu76.tycoonrng:CreateButton({
                                    ["Name"] = "WING HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vernyfx/LDR/main/LDR"))()
                                    end
                                })
                                vu76.tycoonrng:CreateButton({
                                    ["Name"] = "RINNS HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
                                    end
                                })
                                vu76.tycoonrng:CreateButton({
                                    ["Name"] = "Jip HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/jjp2iky/scripts/main/TycoonRNG"))()
                                    end
                                })
                            end
                            function musclelegendsTAB()
								-- upvalues: (ref) vu76
                                vu76.musclelegends:CreateSection("Muscle Legends")
                                vu76.musclelegends:CreateButton({
                                    ["Name"] = "musclelegends \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/littlegui/main/MuscleLegends"))()
                                    end
                                })
                                vu76.musclelegends:CreateButton({
                                    ["Name"] = "Speed X HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Muscle%20Legends.lua"))()
                                    end
                                })
                                vu76.musclelegends:CreateButton({
                                    ["Name"] = "ML HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidProAArsenal/main/main/Musclas%20Legenos.lua"))()
                                    end
                                })
                                vu76.musclelegends:CreateButton({
                                    ["Name"] = "Cryo HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryoScript/ScriptHub/main/Connector.lua", true))()
                                    end
                                })
                                vu76.musclelegends:CreateButton({
                                    ["Name"] = "ML HUB 2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/ScriptHub/main/KeySystem"))()
                                    end
                                })
                            end
                            function gymleagueTAB()
								-- upvalues: (ref) vu76
                                vu76.gymleague:CreateSection("Gym League")
                                vu76.gymleague:CreateButton({
                                    ["Name"] = "Reaper HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(http.request({
                                            ["Url"] = "https://reaperscripts.com/loader?l=1"
                                        }).Body, "0zek8y2bld7.qowl6c7o~1")()
                                    end
                                })
                                vu76.gymleague:CreateButton({
                                    ["Name"] = "Speed X HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Gym%20League.lua"))()
                                    end
                                })
                                vu76.gymleague:CreateButton({
                                    ["Name"] = "Lightux HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/LightuxSolaraSup/main/README.md"))()
                                    end
                                })
                                vu76.gymleague:CreateButton({
                                    ["Name"] = "RYK HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://ryk.bloxteam.com/loader.lua"))()
                                    end
                                })
                                vu76.gymleague:CreateButton({
                                    ["Name"] = "Speed X HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Gym%20League.lua"))()
                                    end
                                })
                            end
                            function slapbattleTAB()
								-- upvalues: (ref) vu76
                                vu76.slapbattle:CreateSection("Slap Battle")
                                vu76.slapbattle:CreateButton({
                                    ["Name"] = "slap battle \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/slap-god/main/script"))()
                                    end
                                })
                                vu76.slapbattle:CreateButton({
                                    ["Name"] = "GFET Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Latundra/GFET/main/script"))()
                                    end
                                })
                                vu76.slapbattle:CreateButton({
                                    ["Name"] = "Reaper HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(http.request({
                                            ["Url"] = "https://reaperscripts.com/loader?l=1"
                                        }).Body, "0zek8y2bld7.qowl6c7o~1")()
                                    end
                                })
                                vu76.slapbattle:CreateButton({
                                    ["Name"] = "SB HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
                                    end
                                })
                                vu76.slapbattle:CreateButton({
                                    ["Name"] = "SB HUB that Exists \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles"))()
                                    end
                                })
                                vu76.slapbattle:CreateButton({
                                    ["Name"] = "Destroyer X \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Aquoupi/DestroyerX/main/DestroyerX"))()
                                    end
                                })
                            end
                            function animepunch2TAB()
								-- upvalues: (ref) vu76
                                vu76.animepunch2:CreateSection("Anime Punching Sim 2 \226\157\132\239\184\143NEW")
                                vu76.animepunch2:CreateButton({
                                    ["Name"] = "dkhub script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Christian2703/Main/main/Mainscript", true))()
                                    end
                                })
                            end
                            function animeswordXTAB()
								-- upvalues: (ref) vu76
                                vu76.animeswordx:CreateSection("Anime Swords X")
                                vu76.animeswordX:CreateButton({
                                    ["Name"] = "Wing Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vernyfx/LDR/main/LDR"))()
                                    end
                                })
                            end
                            function animeChampSimTAB()
								-- upvalues: (ref) vu76
                                vu76.animeChampSim:CreateSection("Anime Champion Sim")
                                vu76.animeChampSim:CreateButton({
                                    ["Name"] = "Auto Dungeon, Keyless, 100+ Features \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
                                    end
                                })
                            end
                            function monsterbattlesimTAB()
								-- upvalues: (ref) vu76
                                vu76.monsterbattlesim:CreateSection("Monster Battle Sim")
                                vu76.monsterbattlesim:CreateButton({
                                    ["Name"] = "Bacon Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastefy.app/uZugkXkT/raw", true))()
                                    end
                                })
                            end
                            function adoptmeTAB()
								-- upvalues: (ref) vu76
                                vu76.adoptme:CreateSection("Adopt Me")
                                vu76.adoptme:CreateButton({
                                    ["Name"] = "JulHUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://rentry.org/xhf8vzb6/raw", true))()
                                    end
                                })
                                vu76.adoptme:CreateButton({
                                    ["Name"] = "Prodigy X Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://gitfront.io/r/ReQiuYTPL/wFUydaK74uGx/hub/raw/ReQiuYTPLHub.lua", true))()
                                    end
                                })
                                vu76.adoptme:CreateButton({
                                    ["Name"] = "Get All NFR and MFR Pet ( Visual ) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/lf4d7/daphie/main/ame.lua"))()
                                    end
                                })
                            end
                            function lifesentenceTAB()
								-- upvalues: (ref) vu76
                                vu76.lifesentence:CreateSection("ESCAPING Life Sentence")
                                vu76.lifesentence:CreateButton({
                                    ["Name"] = "Life Sentence Autofarm Script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/main/lifesentence.lua", true))()
                                    end
                                })
                            end
                            function launchintospaceTAB()
								-- upvalues: (ref) vu76
                                vu76.launchintospace:CreateSection("Launch Into Space Sim")
                                vu76.launchintospace:CreateButton({
                                    ["Name"] = "cat hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://whimper.xyz/cathub.lua"))()
                                    end
                                })
                                vu76.launchintospace:CreateButton({
                                    ["Name"] = "LaunchIntoSpaceSimulator \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/paste/launchintospace"))()
                                    end
                                })
                            end
                            function carcrusher2TAB()
								-- upvalues: (ref) vu76
                                vu76.carcrusher2:CreateSection("Car Crusher 2")
                                vu76.carcrusher2:CreateButton({
                                    ["Name"] = "Kitty Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
                                    end
                                })
                                vu76.carcrusher2:CreateButton({
                                    ["Name"] = "cathub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://whimper.xyz/cathub.lua"))()
                                    end
                                })
                                vu76.carcrusher2:CreateButton({
                                    ["Name"] = "Car Crushers 2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/paste/carcrush2"))()
                                    end
                                })
                            end
                            function ninjalegendsTAB()
								-- upvalues: (ref) vu76
                                vu76.ninjalegends:CreateSection("Ninja Legends")
                                vu76.ninjalegends:CreateButton({
                                    ["Name"] = "BLACKTRAP \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGetAsync("https://lua-library.btteam.net/script-auth.txt"))()
                                    end
                                })
                                vu76.ninjalegends:CreateButton({
                                    ["Name"] = "Sky HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/arlists/Sky-Hub/main/Main", true))()
                                    end
                                })
                                vu76.ninjalegends:CreateButton({
                                    ["Name"] = "Proxima HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
                                    end
                                })
                                vu76.ninjalegends:CreateButton({
                                    ["Name"] = "horizon.cc v5 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadetamic/horizon/main/loadstring.lua"))()
                                    end
                                })
                                vu76.ninjalegends:CreateButton({
                                    ["Name"] = "HiraHub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Stochalt/HiraganaDev-Hub/main/HiraHub.lua"))()
                                    end
                                })
                            end
                            function frontlinesTAB()
								-- upvalues: (ref) vu76
                                vu76.frontlines:CreateSection("Frontlines")
                                vu76.frontlines:CreateButton({
                                    ["Name"] = "frontlines \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/frontlines2"))()
                                    end
                                })
                                vu76.frontlines:CreateButton({
                                    ["Name"] = "frontlines \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/frontlines"))()
                                    end
                                })
                                vu76.frontlines:CreateButton({
                                    ["Name"] = "Thunder Client Lite \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5bebf0b1e173f4baff73449722204837.lua"))()
                                    end
                                })
                            end
                            function fruitbgTAB()
								-- upvalues: (ref) vu76
                                vu76.fruitbg:CreateSection("Fruit Battleground")
                                vu76.fruitbg:CreateButton({
                                    ["Name"] = "Full Auto Farm \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/kyoichi35/KyoichiFree/main/Loader"))()
                                    end
                                })
                            end
                            function legendofspeedTAB()
								-- upvalues: (ref) vu76
                                vu76.legendofspeed:CreateSection("Legend Of Speed")
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "legend of speed \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkoterScripts/Legends-Of-Speed-Script/main/Script%20For%20Legends%20Of%20Speed.txt"))()
                                    end
                                })
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "Vynixius Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
                                    end
                                })
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "itzperson.ru hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/od1ri/Legends-Of-Speed/main/loadstring.lua"))()
                                    end
                                })
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "EZ HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua", true))()
                                    end
                                })
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "Tbao HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()
                                    end
                                })
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "LOS HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidProAArsenal/main/main/Legenos%20of%20speedos"))()
                                    end
                                })
                                vu76.legendofspeed:CreateButton({
                                    ["Name"] = "Auto Farm & Glitch Pet \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/farghii/relzhub/main/execute.hack", true))()
                                    end
                                })
                            end
                            function bettermusicTAB()
								-- upvalues: (ref) vu76
                                vu76.bettermusic:CreateSection("Better Music")
                                vu76.bettermusic:CreateButton({
                                    ["Name"] = "Fast Money and Wins\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BetterMusic"))("t.me/arceusxscripts")
                                    end
                                })
                            end
                            function adminrngTAB()
								-- upvalues: (ref) vu76
                                vu76.adminrng:CreateSection("Admin RNG")
                                vu76.adminrng:CreateButton({
                                    ["Name"] = "Dora HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DoraScriptHub/DoraScriptHub-/main/ADMIN%20RNG"))()
                                    end
                                })
                                vu76.adminrng:CreateButton({
                                    ["Name"] = "Tora HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/AdminRNG", true))()
                                    end
                                })
                                vu76.adminrng:CreateButton({
                                    ["Name"] = "Version HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Iamnewcodethis2/AdminRNG/main/Ah/SUS/RNGisbest/Skids.lua", true))()
                                    end
                                })
                                vu76.adminrng:CreateButton({
                                    ["Name"] = "Auto roll \226\173\144",
                                    ["Callback"] = function()
                                        pcall(function()
                                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Spin"):InvokeServer(unpack({
                                                false
                                            }))
                                        end)
                                    end
                                })
                                vu76.adminrng:CreateButton({
                                    ["Name"] = "Auto Spin + Free Fast Spin \226\173\144",
                                    ["Callback"] = function()
                                        while wait() do
                                            game:GetService("ReplicatedStorage").Events.Spin:InvokeServer(true)
                                        end
                                    end
                                })
                            end
                            function zombieattackTAB()
								-- upvalues: (ref) vu76
                                vu76.zombieattack:CreateSection("Zombie Attack")
                                vu76.zombieattack:CreateButton({
                                    ["Name"] = "lqmc script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/zombie-attack-by-lqmc/main/by%20%40lqmc%20on%20discord"))()
                                    end
                                })
                                vu76.zombieattack:CreateButton({
                                    ["Name"] = "Lightux HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md", true))()
                                    end
                                })
                                vu76.zombieattack:CreateButton({
                                    ["Name"] = "Ghost HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://ghost-storage.7m.pl/scripts/ghosthublauncher.lua"))()
                                    end
                                })
                                vu76.zombieattack:CreateButton({
                                    ["Name"] = "Voidz HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RTrade/Voidz/main/Games.lua", true))()
                                    end
                                })
                            end
                            function bulkupTAB()
								-- upvalues: (ref) vu76
                                vu76.bulkup:CreateSection("Bulked Up")
                                vu76.bulkup:CreateButton({
                                    ["Name"] = "Lightux HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md", true))()
                                    end
                                })
                            end
                            function piggyTAB()
								-- upvalues: (ref) vu76
                                vu76.piggy:CreateSection("Piggy")
                                vu76.piggy:CreateButton({
                                    ["Name"] = "Piggy script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/xRHcjXVs", true))()
                                    end
                                })
                            end
                            function mimicTAB()
								-- upvalues: (ref) vu76
                                vu76.mimic:CreateSection("Mimic\226\157\132\239\184\143")
                                vu76.mimic:CreateButton({
                                    ["Name"] = "TTJY HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/NewCMain/main/Main.lua"))()
                                    end
                                })
                                vu76.mimic:CreateButton({
                                    ["Name"] = "AutoWin \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/KTollT/KTollT/main/README.md"))()
                                    end
                                })
                                vu76.mimic:CreateButton({
                                    ["Name"] = "NovaMimic \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://icxy.xyz/NovaGui/NovaMimic", true))()
                                    end
                                })
                            end
                            function mVsTAB()
								-- upvalues: (ref) vu76
                                vu76.mVs:CreateSection("Murder vs Sheriffs Duels\226\157\132\239\184\143")
                                vu76.mVs:CreateButton({
                                    ["Name"] = "Tbao HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubMurdervssheriff"))()
                                    end
                                })
                                vu76.mVs:CreateButton({
                                    ["Name"] = "Ruby HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub", true))()
                                    end
                                })
                                vu76.mVs:CreateButton({
                                    ["Name"] = "MVSD HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/qBQE4hN0"))()
                                    end
                                })
                                vu76.mVs:CreateButton({
                                    ["Name"] = "Pitbull HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHub/main/Scripting", true))()
                                    end
                                })
                                vu76.mVs:CreateButton({
                                    ["Name"] = "Nigg HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://shz.al/~wetvwat"))()
                                    end
                                })
                            end
                            function solsrngTAB()
								-- upvalues: (ref) vu76, (ref) vu65
                                vu76.solsrng:CreateSection("Sol\'s RNG\226\157\132\239\184\143")
                                vu76.solsrng:CreateButton({
                                    ["Name"] = "Erudite HUB V1.69 \226\157\132\239\184\143",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol\'s%20RNG/V1.69"))()
                                    end
                                })
                                vu76.solsrng:CreateButton({
                                    ["Name"] = "Sol\'s RNG  \226\173\144",
                                    ["Callback"] = function()
										-- upvalues: (ref) vu65
                                        setclipboard("vy5fBGS6nNUuJjgxWhCLpR")
                                        vu65:Notify({
                                            ["Title"] = "key has been copied to clipboard!",
                                            ["Content"] = "Venox Hub",
                                            ["Duration"] = 6.5,
                                            ["Image"] = 6026568227
                                        })
                                        loadstring(game:HttpGet("https://pastefy.app/55pnwOy3/raw", true))()
                                    end
                                })
                                vu76.solsrng:CreateButton({
                                    ["Name"] = "3itx HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Just3itx/Backup/main/loader.lua"))()
                                    end
                                })
                                vu76.solsrng:CreateButton({
                                    ["Name"] = "HOHO HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
                                    end
                                })
                                vu76.solsrng:CreateButton({
                                    ["Name"] = "Xeo HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/MercyfulSmoked/Xeo/main/Main.lua"))()
                                    end
                                })
                            end
                            function animerngTAB()
								-- upvalues: (ref) vu76
                                vu76.animerng:CreateSection("Ragdoll Engine\226\157\132\239\184\143NEW")
                                vu76.animerng:CreateButton({
                                    ["Name"] = "animerng gui script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://rawscripts.net/raw/4X-LUCK-Anime-RNG-Gui-Script-13972"))()
                                    end
                                })
                            end
                            function ragdollengineTAB()
								-- upvalues: (ref) vu76
                                vu76.ragdollengine:CreateSection("Ragdoll Engine\226\157\132\239\184\143NEW")
                                vu76.ragdollengine:CreateButton({
                                    ["Name"] = "ragdoll engine script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/ragdollscr/main/script"))()
                                    end
                                })
                            end
                            function vehiclelegendTAB()
								-- upvalues: (ref) vu76
                                vu76.vehiclelegend:CreateSection("Vehicle Legends \226\157\132\239\184\143NEW")
                                vu76.vehiclelegend:CreateButton({
                                    ["Name"] = "VestaHub NEW?\226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/xlykor/MikeBayraktarVehicleLegends/main/VestaHubVehicleLegends"))()
                                    end
                                })
                                vu76.vehiclelegend:CreateButton({
                                    ["Name"] = "VestaHub Autofarm Gui \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:httpget("https://raw.githubusercontent.com/mikebayraktar/VestaHubVehicleLegends/main/obf_3Kq47x47S5lSO04jlhtV0D7y13550SG4v0G8Z4vL9pyQ69T85pUQGkum4uMm7314.lua.txt"))()
                                    end
                                })
                            end
                            function bathroomattackTAB()
								-- upvalues: (ref) vu76
                                vu76.bathroomattack:CreateSection("Bathroom Attack \226\157\132\239\184\143NEW")
                                vu76.bathroomattack:CreateButton({
                                    ["Name"] = "bathroom killaura\226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://paste.ee/r/lNEPU/raw", true))()
                                    end
                                })
                            end
                            function towerofhellTAB()
								-- upvalues: (ref) vu76
                                vu76.towerofhell:CreateSection("Tower of Hell \226\157\132\239\184\143NEW")
                                vu76.towerofhell:CreateButton({
                                    ["Name"] = "takes u to the end \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        local v233 = game:GetService("Players").LocalPlayer
                                        local v234 = game.Workspace.tower.finishes.Finish
                                        if v233 and v234 then
                                            local v235 = v233.Character
                                            if v235 and v235:FindFirstChild("HumanoidRootPart") then
                                                v235.HumanoidRootPart.CFrame = v234.CFrame
                                            end
                                        end
                                    end
                                })
                                vu76.towerofhell:CreateButton({
                                    ["Name"] = "Pitbull Hub (KEY: fwzWPm9y5KD2y15ci7E0 )\226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullUI-Scripting/main/PitbullUI", true))()
                                    end
                                })
                            end
                            function ttdTAB()
								-- upvalues: (ref) vu76
                                vu76.ttd:CreateSection("Toilet Tower Defense \226\157\132\239\184\143")
                                vu76.ttd:CreateButton({
                                    ["Name"] = "Auto Game Main Script\226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/REWIND-Toilet-Tower-Defense-AUTO-GAME-MAIN-SCRIPT-13803"))()
                                    end
                                })
                            end
                            function sharkbite2TAB()
								-- upvalues: (ref) vu76
                                vu76.sharkbite2:CreateSection("Sharkbite 2 \226\157\132\239\184\143")
                                vu76.sharkbite2:CreateButton({
                                    ["Name"] = "Sharkbite V3.1 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lolboxo/SharkBiteV3/main/SharkBiteV3.1"))()
                                    end
                                })
                                vu76.sharkbite2:CreateButton({
                                    ["Name"] = "Autofarm and All Boats \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Luces245434/script/main/sharkbite2"))()
                                    end
                                })
                                vu76.sharkbite2:CreateButton({
                                    ["Name"] = "All Boats + Hubs\226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Luces245434/script/main/sharkbite2"))()
                                    end
                                })
                            end
                            function bloxburgTAB()
								-- upvalues: (ref) vu76
                                vu76.bloxburg:CreateSection("Bloxburg \226\157\132\239\184\143")
                                vu76.bloxburg:CreateButton({
                                    ["Name"] = "Autofarm Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/harsizcool/bloxburg-auto-farm-unpatched-2024/main/main.lua", true))()
                                    end
                                })
                                vu76.bloxburg:CreateButton({
                                    ["Name"] = "Phanm hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/zbkD7BbW"))()
                                    end
                                })
                                vu76.bloxburg:CreateButton({
                                    ["Name"] = "kitty hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://whimper.xyz/kitty"))()
                                    end
                                })
                            end
                            function prisonlifeTAB()
								-- upvalues: (ref) vu76
                                vu76.prisonlife:CreateSection("Prison Life \226\157\132\239\184\143")
                                vu76.prisonlife:CreateButton({
                                    ["Name"] = "Prison Ware V1.3 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
                                    end
                                })
                                vu76.prisonlife:CreateButton({
                                    ["Name"] = "Admin \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Prison-Life-(Cars-fixed!)-Prison-life-admin-6241"))()
                                    end
                                })
                                vu76.prisonlife:CreateButton({
                                    ["Name"] = "Tiger Admin \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Prison-Life-Tiger-admin-v3-13501"))()
                                    end
                                })
                            end
                            function kinglegacyTAB()
								-- upvalues: (ref) vu76
                                vu76.kinglegacy:CreateSection("King Legacy \226\157\132\239\184\143")
                                vu76.kinglegacy:CreateButton({
                                    ["Name"] = "BT Project HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGetAsync("https://lua-library.btteam.net/script-auth.txt"))()
                                    end
                                })
                                vu76.kinglegacy:CreateButton({
                                    ["Name"] = "Zee HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub-KL"))()
                                    end
                                })
                                vu76.kinglegacy:CreateButton({
                                    ["Name"] = "Zen HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()
                                    end
                                })
                                vu76.kinglegacy:CreateButton({
                                    ["Name"] = "Hyper HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()
                                    end
                                })
                                vu76.kinglegacy:CreateButton({
                                    ["Name"] = "Ace HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/KL/main/main.lua"))()
                                    end
                                })
                                vu76.kinglegacy:CreateButton({
                                    ["Name"] = "Quartyx HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
                                    end
                                })
                            end
                            function drivingempireTAB()
								-- upvalues: (ref) vu76
                                vu76.drivingempire:CreateSection("Driving Empire \226\157\132\239\184\143")
                                vu76.drivingempire:CreateButton({
                                    ["Name"] = "Cake Farm Event Script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/DrivingEmpireEvents/main/README.md", true))()
                                    end
                                })
                                vu76.drivingempire:CreateButton({
                                    ["Name"] = "driving empire \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
                                    end
                                })
                                vu76.drivingempire:CreateButton({
                                    ["Name"] = "Lightux HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md", true))()
                                    end
                                })
                                vu76.drivingempire:CreateButton({
                                    ["Name"] = "Max HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3f4c258405c294983a9b0e113dad3de7.lua"))()
                                    end
                                })
                                vu76.drivingempire:CreateButton({
                                    ["Name"] = "AutoFarm \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
                                    end
                                })
                            end
                            function petsimulator99TAB()
								-- upvalues: (ref) vu76
                                vu76.petsimulator99:CreateSection("Pet Simulator 99 \226\157\132\239\184\143")
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Speed X HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/PS99.lua"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Lenut HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/lenutjr/lenut/main/scripts"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "RiverHub / Skyhub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Auto StairWay \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/fissurectomy/woah/main/ps99_stairway.lua"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Syrex Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/gerisxx/ps99-Script/main/syrexhub"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Redz Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Banana Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Zap Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Speed X HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Script--Game/main/PS99.lua", true))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Auto Collect Chrismas Gift \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/EekcdYVL"))()
                                    end
                                })
                                vu76.petsimulator99:CreateButton({
                                    ["Name"] = "Stop Collect Chrismas Gift \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/z2M4vJuZ"))()
                                    end
                                })
                            end
                            function bladeballTAB()
								-- upvalues: (ref) vu76
                                vu76.bladeball:CreateSection("blade ball \226\154\189")
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Pitbull HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Loader.lua", true))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "infinix hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        local v236 = loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua", true))
                                        v236(v236)
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Nexam HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Expo HUB V1 (copies key) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        setclipboard("Expo#1")
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExpoSploits/expo-key-system/main/Expo%20Key", true))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Bedol HUB V4.3  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        _G.UI_Size = 200
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Astral HUB  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/A-s-t-r-a-l/main/Loader_BladeBall.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Atreus HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZYT/DenDenZ-s-Creations/main/Blade%20Ball%20v1.3%20FIX.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Nexam HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5ebefab5c68bfa67271dcbf6430d3c7d.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Triple HUB (key copies) \226\173\144",
                                    ["Callback"] = function()
                                        setclipboard("Triple Hub")
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TripleScript/TripleHub/main/TripleHubV2.txt"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "HOHO HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Baller \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Blade231/main/Baller"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Autoparry with visual \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/UPD-Blade-Ball-op-autoparry-with-visualizer-8652"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Goose Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Orangecatgamer696969/Goose-hub-blade-ball/main/Script", true))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "SpyD \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/WolfcutLatinas/StallingSecurity/main/SpyD.txt"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "AutoParry OP Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://github.com/Stang001/pulawat/blob/main/BladeBall.lua?raw=true"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "FFJ HUB V3 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/BladeBallV3.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Nurysium \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/flezzpe/Nurysium/main/nury_source.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "infinix hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua", true))
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Ether HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/6w0s/_6w0s/main/Loader.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "SumitScripts HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SumitScripts/SumitScripts-hub/main/Bladeball/Releases.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "OP Manual Spam \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/SlzAX17vGCub7iRKVmJid61Bg/main/KwKVzV5SgcFBd9fnpLr4lKCg6.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Schema HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/manimanni/Schema/main/posse.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Visual 0.3 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/135f1b286971e50ac6c81f6845242ca3.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Zygarde HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/main/Protected%20zygarde.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Auto Parry \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry", true))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Auto Spam \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/t2391h1A"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "EminX Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoaderV2.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Bedol Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "NovaX Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/novaxnewgen/main/novax.lua", true))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Joe Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JoeBidenhub/Script-releases-latest-download/main/main.lua", true))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Baryon Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/VickzinJs/Auto-Parry123/main/Untitled-2.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "DarkRai Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastefy.app/scPne8wv/raw"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Best Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
                                    end
                                })
                                vu76.bladeball:CreateButton({
                                    ["Name"] = "Atreus Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DenDenZYT/DenDenZ-On-YouTube/main/Atreus%20Hub%20KEYSYSTEM"))()
                                    end
                                })
                            end
                            function breakin2TAB()
								-- upvalues: (ref) vu76
                                vu76.breakin2:CreateSection("Break In 2 \226\157\132\239\184\143")
                                vu76.breakin2:CreateButton({
                                    ["Name"] = "Breaking Blitz \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua"))()
                                    end
                                })
                                vu76.breakin2:CreateButton({
                                    ["Name"] = "Harlen Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/harlenscripts/HarlenHub/main/HarlenScripts"))()
                                    end
                                })
                                vu76.breakin2:CreateButton({
                                    ["Name"] = "Dark Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Games/Break%20In%202.lua", true))()
                                    end
                                })
                                vu76.breakin2:CreateButton({
                                    ["Name"] = "items Giver \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://freenote.biz/raw/qLlMYwbVNd", true))()
                                    end
                                })
                            end
                            function bloxfruitTAB()
								-- upvalues: (ref) vu76
                                vu76.bloxfruit:CreateSection("BloxFruit \226\157\132\239\184\143")
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Mago Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/MagoScripts5/MagoHub/main/MagoHub.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Solix HUB (key copies) \226\173\144",
                                    ["Callback"] = function()
                                        setclipboard("lessgoobloxfruitfinnally")
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solix-Blox-Fruits/main/Protected_9116683145502467.txt"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "minhubv4 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/bloxfruits/main/minhubv4"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Speed X HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "BLACKTRAP \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGetAsync("https://lua-library.btteam.net/script-auth.txt"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "HoHo HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "MinGaming HUB key: xk06nst6bgj8a",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiSupremacy/Loader.xyz/main/Pronto.yxz%20ST%20%3A%20G"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "LunarXHUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenLam2504/LunarXHubNextGeneration/main/GameShit.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Sea Gate HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiSupremacy/Loader.xyz/main/NextGen"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "REDzHUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "W-Azure V2 \226\173\144",
                                    ["Callback"] = function()
                                        getgenv().Team = "Pirate"
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "BLOX FRUITS Script Mobile \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rah-Md/Bloxs-Fruit-Script/main/Lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Lane V3 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/WolfcutLatinas/StallingSecurity/main/Lane%20V3"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "XTay \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/WolfcutLatinas/StallingSecurity/main/X-Ray.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Purple \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/WolfcutLatinas/StallingSecurity/main/Ming"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Halox Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HALOxHUB/ScriptLoader/main/Loader.lua")())
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Annie Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Anniecuti/Free-Scr/main/Annie-Hub.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Hoho Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Domadic Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/Domadichub/NottoGay/Start.ranscript"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Night Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NIGHTHUBONTOP/Main/main/NightHub.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Phantom Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ao-0/Banana-Inc/main/BananaPortableLoader.rbxm"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Xero Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/main/xero.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Dragon Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Dragon-Hub/main/Script-Execute.lua"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "BLACKTRAP \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGetAsync("https://lua-library.btteam.net/script-auth.txt"))()
                                    end
                                })
                                vu76.bloxfruit:CreateButton({
                                    ["Name"] = "Stingray Autofarm \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Manta/Public-Stingray/main/Script_BloxFruitsFullAuto"))()
                                    end
                                })
                            end
                            function brookhavenTAB()
								-- upvalues: (ref) vu76
                                vu76.brookhaven:CreateSection("Brookhaven \226\157\132\239\184\143")
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Car Fly \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/xlykor/MikeBayraktarCarFly/main/CarFly"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "JulHubz \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JulHubz/JulHub/main/JulHub"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Ice Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Owl Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Redz Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-REDz-HUB-6559"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Antares Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/main/AntaresHub.lua"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Mateon Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hydro4Music/MeteonHub/ad8bbba8b8e492674c382b7992f05ce7fa130e87/Brookhaven"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Meta Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NocturneMoDz/BROOKHAVEN-GUI-/main/METAB", true))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "SalaKitos Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SAKALITOS/Salakitoshub/main/scriptSK"))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Imperial Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Trev0rZ/LoaderM/main/ImperialHub-Working.lua", true))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "TpTool Gui \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/mikebayraktar/MikeBayraktarTptool/main/MikeBayraktarTpTool", true))()
                                    end
                                })
                                vu76.brookhaven:CreateButton({
                                    ["Name"] = "Car Fly \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/mikebayraktar/MikeBayraktarCarFly/main/MikeBayraktarCarFly"))()
                                    end
                                })
                            end
                            function evadeTAB()
								-- upvalues: (ref) vu76
                                vu76.evade:CreateSection("Evade \226\157\132\239\184\143")
                                vu76.evade:CreateButton({
                                    ["Name"] = "Evade UPDATED \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/PepesGH1/stuff/main/evade.lua"))()
                                    end
                                })
                                vu76.evade:CreateButton({
                                    ["Name"] = "Hydra Network \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/6BbcWQJs"))()
                                    end
                                })
                                vu76.evade:CreateButton({
                                    ["Name"] = "9Strew Evade \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua"))()
                                    end
                                })
                                vu76.evade:CreateButton({
                                    ["Name"] = "Tbao Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
                                    end
                                })
                            end
                            function doorsTAB()
								-- upvalues: (ref) vu76
                                vu76.doors:CreateSection("Doors \226\157\132\239\184\143")
                                vu76.doors:CreateButton({
                                    ["Name"] = "Zygarde HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/main/Protected%20zygarde.lua"))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Chiba HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/KindIhave/ChibaHubcomeback/main/Chiba-Doors.txt", true))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "FFJ HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Doors HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/9QPGnLx6", true))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Blacking HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGetAsync("https://pastebin.com/raw/R8QMbhzv"))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Poop Hub Doors \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua", true))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Doors Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/R8QMbhzv),true"))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Tablet Rooms \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua"))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "King Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/R8QMbhzv"))()
                                    end
                                })
                                vu76.doors:CreateButton({
                                    ["Name"] = "Vynixius \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
                                    end
                                })
                            end
                            function murdermystery2TAB()
								-- upvalues: (ref) vu76
                                vu76.murdermystery2:CreateSection("Murder Mystery 2 \226\157\132\239\184\143")
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Trolling Gui \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "R3THPRIV \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/loader.lua"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "mm2 script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/besthackerrbc/roblox/main/mm2", true))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Ski Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7", true))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Collect BeachBall \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/summer2024", true))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "SnapSanix HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Roman34296589/SnapSanix-GUI-MM2/main/SnapSanix%20GUI%20mm2.lua"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Symphony HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/ArrayField/main/SymphonyHub.lua"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Nexus HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Highlight HUB (key copies) \226\173\144",
                                    ["Callback"] = function()
                                        setclipboard("hlvipcomingsoon")
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Main"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "R3TH PRIV HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SimplySentinel/r3th/main/loader.lua"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Zygarde HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/main/Protected%20zygarde.lua"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Vynixu HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Neon-Fox/roblox-scripts/main/VynixuMM2"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Ghost HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Haxhell HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/haxhell/roblox-scripts/main/murder-mystery-2.lua", true))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Byte HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/mMqS6s5F"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Darkxy Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Psxvoidyx/Murdermysvoid2/main/Darkxyz23", true))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Drifter MM2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drifter0507/GUIS/main/MURDER%20MYSTERY%202"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "YARHM HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Eclipse Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/gZH7sjgq"))()
                                    end
                                })
                                vu76.murdermystery2:CreateButton({
                                    ["Name"] = "Murder Mystery 2 Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pa1nx/RRCreations/main/MurdererMystery2"))()
                                    end
                                })
                            end
                            function fishingsimTAB()
								-- upvalues: (ref) vu76
                                vu76.fishingsim:CreateSection("Fishing Simulator \226\157\132\239\184\143")
                                vu76.fishingsim:CreateButton({
                                    ["Name"] = "fishing sim \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostapustaja/legionhub/main/fishingsimulator/main.lua", true))()
                                    end
                                })
                                vu76.fishingsim:CreateButton({
                                    ["Name"] = "fishing sim script 2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/fishing-simulator-by-me/main/by%20%40lqmc"))()
                                    end
                                })
                                vu76.fishingsim:CreateButton({
                                    ["Name"] = "SLH Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/SmellLikeHacker/MyEdit/main/Hub"))()
                                    end
                                })
                                vu76.fishingsim:CreateButton({
                                    ["Name"] = "Ansit Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnSitDz/AnSitHub/main/FishingSimulator"))()
                                    end
                                })
                            end
                            function arsenalTAB()
								-- upvalues: (ref) vu76
                                vu76.arsenal:CreateSection("Arsenal  \226\157\132\239\184\143")
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Thunder Client V2 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        if not game:IsLoaded() then
                                            game.Loaded:Wait()
                                        end
                                        loadstring(http.request({
                                            ["Url"] = string.format("https://raw.githubusercontent.com/%s/thunderclient/%s/main.lua", "andrewdarkyyofficial", "main"),
                                            ["Method"] = "GET"
                                        }).Body)()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Tanqr HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/mXQLj82U"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Hitbox Expander \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/GcS8ZsFZ"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Leg HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/G6Ubkkuv"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "QP HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/QPScript/Script/main/Arsenal.txt"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Midnight.cc \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "HOHO HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Tect Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Arsenalscript.txt"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Thunder Client \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/andrewdarkyyofficial/thunderclient/main/main.lua"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Lighting Hub v2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://rawscripts.net/raw/Arsenal-IGNORE-13841"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Bolts Hub ( OP ) \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "DexHub Script Arsenal \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HonestlyDex/DexHub/main/Arsenal"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "tbao Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/ArsenalTbaoHubNew"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "Elijah Hub V2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ElijahGamingRBLX2/Elijah-Hub-V2/main/NewElijahHubV2Arsenal.lua"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "VG Hub \226\157\132\239\184\143Solara Support",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "jaran.vip \226\157\132\239\184\143",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/fliskScript/jaran.vip/main/free.lua"))()
                                    end
                                })
                                vu76.arsenal:CreateButton({
                                    ["Name"] = "pepsi hub \226\157\132\239\184\143",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/deaddigi/pepsi.club/main/3.0/loader.lua", true))()
                                    end
                                })
                            end
                            function three008TAB()
								-- upvalues: (ref) vu76
                                vu76.three008:CreateSection("3008 \226\157\132\239\184\143")
                                vu76.three008:CreateButton({
                                    ["Name"] = "Zygarde HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/main/Protected%20zygarde.lua"))()
                                    end
                                })
                                vu76.three008:CreateButton({
                                    ["Name"] = "3008 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RunDTM/scripts/main/3008.lua"))()
                                    end
                                })
                                vu76.three008:CreateButton({
                                    ["Name"] = "Auto Get Food \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://rawscripts.net/raw/3008-2.71-OP-GET-FOOD-5538"))()
                                    end
                                })
                                vu76.three008:CreateButton({
                                    ["Name"] = "No Fall Damage \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/NDR5JTEY"))()
                                    end
                                })
                                vu76.three008:CreateButton({
                                    ["Name"] = "3008 Uni Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/Xwk6sgeY"))()
                                    end
                                })
                            end
                            function dahoodTAB()
								-- upvalues: (ref) vu76
                                vu76.dahood:CreateSection("Da Hood \226\157\132\239\184\143")
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Vision Hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/da-hood-by-lqmc/main/lqmc%20da%20hood?token=GHSAT0AAAAAACUEJGNCBKUF7T3EWK54ONPKZUUKDEQ"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "SwagMode \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "tofuware \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://gist.githubusercontent.com/itzbeorz/b8f1e1e47f5a11194669217fb20cc4e7/raw/eaa9ff2eed03b3390bc9ab1646530950da697d38/gistfile1.txt"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "DX9 remake \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/DX9user-renpy/DX9WARE/main/Private/UI/Lib/script.lua"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Vortex \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Aimlock 1 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox-Scripts/main/Rainbow%20Sunshine%20Aimlock.lua", true))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Aimlock 2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/03koios/SilentAimLock/main/README.md"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Azure Modded \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "OP Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/XXAWmifh"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "DIAMG Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimag16/DimagX_NEW/main/dimagx", true))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Hood Aim Trailer \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/WinterTime"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "FADED Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/HdExQysw"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "Seller Gui Da Hood \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Crostide/cdhc/main/gui"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "OP DAHOOD STREAMBLE LOCK \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/UQVqNThV"))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "SPACE X Da Hood \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/spacexrandom/Lua/main/DaHood", true))()
                                    end
                                })
                                vu76.dahood:CreateButton({
                                    ["Name"] = "nukerHUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Allvideo1/Nukermode/main/Nukerscript"))()
                                    end
                                })
                            end
                            function armwrestlesimTAB()
								-- upvalues: (ref) vu76
                                vu76.armwrestlesim:CreateSection("Arm Wrestle Simulator \226\157\132\239\184\143")
                                vu76.armwrestlesim:CreateButton({
                                    ["Name"] = "LDS HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/limaspeedy/limaspeedy/main/HubLDS"))()
                                    end
                                })
                                vu76.armwrestlesim:CreateButton({
                                    ["Name"] = "Yowai HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScripterYowai/Arm-Wrestle-Sim-Script/main/Arm%20Wrestle%20Sim%20(Yowai%20Hub)"))()
                                    end
                                })
                                vu76.armwrestlesim:CreateButton({
                                    ["Name"] = "AWS HUB \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThisIsTuff/Main/main/TuffMain.lua"))()
                                    end
                                })
                                vu76.armwrestlesim:CreateButton({
                                    ["Name"] = "BLACKTRAP \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGetAsync("https://lua-library.btteam.net/script-auth.txt"))()
                                    end
                                })
                                vu76.armwrestlesim:CreateButton({
                                    ["Name"] = "Pikachu Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/99d16edc79729a038994f85ce7335971.lua"))()
                                    end
                                })
                                vu76.armwrestlesim:CreateButton({
                                    ["Name"] = "Op Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/6TmL5ZXG"))()
                                    end
                                })
                            end
                            function babftTAB()
								-- upvalues: (ref) vu76
                                vu76.babft:CreateSection("BABFT \226\157\132\239\184\143")
                                vu76.babft:CreateButton({
                                    ["Name"] = "Gold Farm \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://scriptblox.com/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))()
                                    end
                                })
                                vu76.babft:CreateButton({
                                    ["Name"] = "Auto Build \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
                                    end
                                })
                                vu76.babft:CreateButton({
                                    ["Name"] = "Cndy Frm \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://shz.al/PZ6M"))()
                                    end
                                })
                                vu76.babft:CreateButton({
                                    ["Name"] = "Ruby Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/main/main/RubyHub.lua", true))()
                                    end
                                })
                                vu76.babft:CreateButton({
                                    ["Name"] = "VipFirst Hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/Protected_8627265294288055.lua"))()
                                    end
                                })
                                vu76.babft:CreateButton({
                                    ["Name"] = "NeverloseHub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mana42138/Neverlose-UI/main/Scripts/Build%20A%20Boat.lua"))()
                                    end
                                })
                                vu76.babft:CreateButton({
                                    ["Name"] = "Auto Farm Gold\226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Waza80/scripts-new/main/BuildABoat.lua"))()
                                    end
                                })
                            end
                            function deathballTAB()
								-- upvalues: (ref) vu76
                                vu76.deathball:CreateSection("Death Ball \226\157\132\239\184\143")
                                vu76.deathball:CreateButton({
                                    ["Name"] = "Op-Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/sirapobsriumang/Death-Bal/main/Op-Script-by-me"))()
                                    end
                                })
                            end
                            function dustytripTAB()
								-- upvalues: (ref) vu76
                                vu76.dustytrip:CreateSection("Dusty Trip \226\157\132\239\184\143")
                                vu76.dustytrip:CreateButton({
                                    ["Name"] = "Connect HUB  \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip", true))()
                                    end
                                })
                                vu76.dustytrip:CreateButton({
                                    ["Name"] = "LH HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/dusty/main/trip"))()
                                    end
                                })
                                vu76.dustytrip:CreateButton({
                                    ["Name"] = "Lighux HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md", true))()
                                    end
                                })
                                vu76.dustytrip:CreateButton({
                                    ["Name"] = "Zygarde HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/main/Protected%20zygarde.lua"))()
                                    end
                                })
                                vu76.dustytrip:CreateButton({
                                    ["Name"] = "Legend \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/trip/main/dusty"))()
                                    end
                                })
                            end
                            function strucidTAB()
								-- upvalues: (ref) vu76
                                vu76.strucid:CreateSection("Strucid \226\157\132\239\184\143")
                                vu76.strucid:CreateButton({
                                    ["Name"] = "Thunder Client \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d68deea6f4a631c50d0de7cd55eee638.lua"))()
                                    end
                                })
                                vu76.strucid:CreateButton({
                                    ["Name"] = "AdvanceTech Script V2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AdvanceFTeam/Our-Scripts/main/AdvanceTech/StrucidV2.lua"))()
                                    end
                                })
                            end
                            function counterbloxTAB()
								-- upvalues: (ref) vu76
                                vu76.counterblox:CreateSection("Counter Blox \226\157\132\239\184\143")
                                vu76.counterblox:CreateButton({
                                    ["Name"] = "happy Hub? \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/Happy-Hub/main/Counter%20Blox%3A%20Source%202"))()
                                    end
                                })
                                vu76.counterblox:CreateButton({
                                    ["Name"] = "jaran.vip \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/fliskScript/jaran.vip/main/free.lua"))()
                                    end
                                })
                                vu76.counterblox:CreateButton({
                                    ["Name"] = "pepsi hub \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/deaddigi/pepsi.club/main/3.0/loader.lua", true))()
                                    end
                                })
                                vu76.counterblox:CreateButton({
                                    ["Name"] = "Midnight.cc \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
                                    end
                                })
                                vu76.counterblox:CreateButton({
                                    ["Name"] = "Solaris \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua", true))()
                                    end
                                })
                                vu76.counterblox:CreateButton({
                                    ["Name"] = "Counterblox Script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/FREE-Counter-Blox-script/main/V1.1"))()
                                    end
                                })
                            end
                            function tsbgTAB()
								-- upvalues: (ref) vu76
                                vu76.tsbg:CreateSection("The Strongest Battle Ground \226\157\132\239\184\143 NEW!")
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "random hub?  \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/ray-makk/main/Loader"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "NBLM  \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/NBLMSCRIPTS/NBLMSCRIPTHUB/main/SKIBIDI"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "random script \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/zx3081xc"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "TSBG Utils \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/TSBUtils.lua"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "BadWare \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "Speed X HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "HOHO HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "Lightux HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md", true))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "TSBG GUI \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md", true))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "Bedol HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/New-C4-Remote.lua/main/TSBG.jsx"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "Zygarde HUB \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/main/Protected%20zygarde.lua"))()
                                    end
                                })
                                vu76.tsbg:CreateButton({
                                    ["Name"] = "NS HUB V2 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HenSeu87PofghYT/ALL-IN-ONE/main/NSHUBV2"))()
                                    end
                                })
                            end
                            function jailbreakTAB()
								-- upvalues: (ref) vu76
                                vu76.jailbreak:CreateSection("Jailbreak \226\157\132\239\184\143 ")
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Ski hub \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7", true))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Jailbreak script \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/jailbreak2", true))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Jailbreak v5.5 \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/jailbreak1", true))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Chaos \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/xChaoticVoid/Jailbreak/main/Chaos.lua", true))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Aio Scripts \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/zyn789/Aoi-Script/main/Jailbreak"))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Sensation \226\157\132\239\184\143BEST FOR WAVE!",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Universal Auto Arrest/Rob \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Cashfarm (Autorob) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TempIsGay/Cashfarm/main/AutoCrateFree.lua"))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "AutoCrate Farm \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TempIsGay/Cashfarm/main/AutoCrateFree.lua"))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Project Aura \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/AutoRobV4Release"))()
                                    end
                                })
                                vu76.jailbreak:CreateButton({
                                    ["Name"] = "Universal AutoRob \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular"))()
                                    end
                                })
                            end
                            function bedwarsTAB()
								-- upvalues: (ref) vu76
                                vu76.bedwars:CreateSection("Bedwars \226\157\132\239\184\143")
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "OldAlSploit \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox/main/OldAlSploit.lua"))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Nebulaware \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/nebulawaree/NebulaForRoblox/main/NewMainScript.lua", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Voidware ( Vape UI ) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Voidware ( Rise UI ) \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/RiseForRoblox/main/main.lua", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Godsploit \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/MainScript", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "AlSploit \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/AlSploit/main/AlSploit/Bedwars/Loader.lua", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "CoCoSkid \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox/main/CoCoSkid"))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "CoCoPaste \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox/main/CoCoPaste"))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Aristois \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        shared.ReadFile = true
                                        pcall(function()
                                            loadstring(game:HttpGet("https://raw.githubusercontent.com/XzynAstralz/Aristois/main/NewMainScript.lua"))()
                                        end)
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Snyware \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/AFGCLIENT/Snyware/main/Loader"))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Aether Client \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/CakScripts/AetherClientBW/main/MainScript"))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Polaris \226\157\132\239\184\143NEW",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/RunAccount1/PolarisRewrite/main/TempMainScript.lua", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Raven B4 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Near-B4/Raven-B4-For-Roblox/main/Raven%20B4%20Loader"))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Vape V4 \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
                                    end
                                })
                                vu76.bedwars:CreateButton({
                                    ["Name"] = "Rise \226\173\144",
                                    ["Callback"] = function()
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/RiseForRoblox/main/main.lua", true))()
                                    end
                                })
                            end
                            local function v241(p237, p238)
								-- upvalues: (ref) vu26
                                local v239, v240 = pcall(p237)
                                if not v239 then
                                    warn("Venox Hub: Error Loading " .. p238 .. "\nErrorCode: ", v240)
                                    vu26("Venox Hub", "Error Loading " .. p238, 4)
                                end
                            end
                            vu26("Venox Hub", "Successfully loaded Tabcontent!", 4)
                            local v242 = game.PlaceId
                            if getgenv().showAllGameTabs then
                                v241(GKRSTAB, "GKRSTAB")
                                v241(zosamuraiTAB, "zosamuraiTAB")
                                v241(RateMyAvatarTAB, "RateMyAvatarTAB")
                                v241(SurviveTheKillerTAB, "SurviveTheKillerTAB")
                                v241(whoisthespyTAB, "whoisthespyTAB")
                                v241(FlexYourFPSTAB, "FlexYourFPSTAB")
                                v241(therapyTAB, "therapyTAB")
                                v241(STSimTAB, "STSimTAB")
                                v241(BasketballLegendsTAB, "BasketballLegendsTAB")
                                v241(AOTRevoTAB, "AOTRevoTAB")
                                v241(katTAB, "katTAB")
                                v241(BoogaBoogaREBORNTAB, "BoogaBoogaREBORNTAB")
                                v241(AnimeDefendersTAB, "AnimeDefendersTAB")
                                v241(LifeinPrisonTAB, "LifeinPrisonTAB")
                                v241(TappingLegendsFinalTAB, "TappingLegendsFinalTAB")
                                v241(CloseYourEyesTAB, "CloseYourEyesTAB")
                                v241(WarriorSimulatorTAB, "WarriorSimulatorTAB")
                                v241(PressureTAB, "PressureTAB")
                                v241(BRQUIZFreakyTAB, "BRQUIZFreakyTAB")
                                v241(LivetopiaTownHallTAB, "LivetopiaTownHallTAB")
                                v241(westboundTAB, "westboundTAB")
                                v241(CarDrivingUltimateTAB, "CarDrivingUltimateTAB")
                                v241(untitledboxinggameTAB, "untitledboxinggameTAB")
                                v241(DestructionSimulatorTAB, "DestructionSimulatorTAB")
                                v241(beaparkourninjaTAB, "beaparkourninjaTAB")
                                v241(FTNLCTAB, "FTNLCTAB")
                                v241(BaddiesTAB, "BaddiesTAB")
                                v241(ZombieRushTAB, "ZombieRushTAB")
                                v241(BIGPaintball1TAB, "BIGPaintball1TAB")
                                v241(TPS_StreetSoccerTAB, "TPS_StreetSoccerTAB")
                                v241(RushPointTAB, "RushPointTAB")
                                v241(eatslimetogethugeTAB, "eatslimetogethugeTAB")
                                v241(LumberTycoon2TAB, "LumberTycoon2TAB")
                                v241(ESYG1SBYOaBikeTAB, "ESYG1SBYOaBikeTAB")
                                v241(OperationsSiegeTAB, "OperationsSiegeTAB")
                                v241(BridgeDuelsTAB, "BridgeDuelsTAB")
                                v241(DemonPieceTAB, "DemonPieceTAB")
                                v241(ProjectSmashTAB, "ProjectSmashTAB")
                                v241(DungeonRNGTAB, "DungeonRNGTAB")
                                v241(DemonFallTAB, "DemonFallTAB")
                                v241(BeeSwarmSimTAB, "BeeSwarmSimTAB")
                                v241(ZombieUprisingTAB, "ZombieUprisingTAB")
                                v241(fightinaschoolTAB, "fightinaschoolTAB")
                                v241(JimsRNGTAB, "JimsRNGTAB")
                                v241(DinosaurSimulatorTAB, "DinosaurSimulatorTAB")
                                v241(WizardTycoon2PlayerTAB, "WizardTycoon2PlayerTAB")
                                v241(BreakIn1TAB, "BreakIn1TAB")
                                v241(raiseafloppa2TAB, "raiseafloppa2TAB")
                                v241(MonkeyTycoonTAB, "MonkeyTycoonTAB")
                                v241(CarDealershipTycoonTAB, "CarDealershipTycoonTAB")
                                v241(JujutsuShenanigansTAB, "JujutsuShenanigansTAB")
                                v241(FlingThingsandPeopleTAB, "FlingThingsandPeopleTAB")
                                v241(ProjectSlayerTAB, "ProjectSlayerTAB")
                                v241(TaxiBossTAB, "TaxiBossTAB")
                                v241(CRDSTAB, "CRDSTAB")
                                v241(RaceClickerTAB, "RaceClickerTAB")
                                v241(TypesoulTAB, "TypesoulTAB")
                                v241(PillarChase2TAB, "PillarChase2TAB")
                                v241(AbilityWarsTAB, "AbilityWarsTAB")
                                v241(AOPGTAB, "AOPGTAB")
                                v241(DungeonquestTAB, "DungeonquestTAB")
                                v241(BadBusinessTAB, "BadBusinessTAB")
                                v241(funkyfridayTAB, "funkyfridayTAB")
                                v241(RoBeatsTAB, "RoBeatsTAB")
                                v241(NavalWarfareTAB, "NavalWarfareTAB")
                                v241(undergroundwar2TAB, "undergroundwar2TAB")
                                v241(fleethefacilityTAB, "fleethefacilityTAB")
                                v241(CabinCrewSimulatorTAB, "CabinCrewSimulatorTAB")
                                v241(CarDrivingSimulatorTAB, "CarDrivingSimulatorTAB")
                                v241(RarityFactoryTycoonTAB, "RarityFactoryTycoonTAB")
                                v241(RivalsTAB, "RivalsTAB")
                                v241(UnnamedShooterTAB, "UnnamedShooterTAB")
                                v241(ScytheSimTAB, "ScytheSimTAB")
                                v241(EpicMinigamesTAB, "EpicMinigamesTAB")
                                v241(HoopzTAB, "HoopzTAB")
                                v241(TrackFieldInfiniteTAB, "TrackFieldInfiniteTAB")
                                v241(FootballFusion2TAB, "FootballFusion2TAB")
                                v241(criminalityTAB, "criminalityTAB")
                                v241(eattheworldTAB, "eattheworldTAB")
                                v241(flagwarsTAB, "flagwarsTAB")
                                v241(gunfightarenaTAB, "gunfightarenaTAB")
                                v241(micupTAB, "micupTAB")
                                v241(recodeuntitledtaggameTAB, "recodeuntitledtaggameTAB")
                                v241(tridentsurvivalTAB, "tridentsurvivalTAB")
                                v241(myrestaurantTAB, "myrestaurantTAB")
                                v241(warmachinesTAB, "warmachinesTAB")
                                v241(phantomforceTAB, "phantomforceTAB")
                                v241(tycoonRngTAB, "tycoonRngTAB")
                                v241(musclelegendsTAB, "musclelegendsTAB")
                                v241(gymleagueTAB, "gymleagueTAB")
                                v241(slapbattleTAB, "slapbattleTAB")
                                v241(monsterbattlesimTAB, "monsterbattlesimTAB")
                                v241(adoptmeTAB, "adoptmeTAB")
                                v241(lifesentenceTAB, "lifesentenceTAB")
                                v241(launchintospaceTAB, "launchintospaceTAB")
                                v241(carcrusher2TAB, "carcrusher2TAB")
                                v241(ninjalegendsTAB, "ninjalegendsTAB")
                                v241(frontlinesTAB, "frontlinesTAB")
                                v241(fruitbgTAB, "fruitbgTAB")
                                v241(legendofspeedTAB, "legendofspeedTAB")
                                v241(bettermusicTAB, "bettermusicTAB")
                                v241(adminrngTAB, "adminrngTAB")
                                v241(zombieattackTAB, "zombieattackTAB")
                                v241(bulkupTAB, "bulkupTAB")
                                v241(piggyTAB, "piggyTAB")
                                v241(mimicTAB, "mimicTAB")
                                v241(mVsTAB, "mVsTAB")
                                v241(solsrngTAB, "solsrngTAB")
                                v241(animerngTAB, "animerngTAB")
                                v241(ragdollengineTAB, "ragdollengineTAB")
                                v241(vehiclelegendTAB, "vehiclelegendTAB")
                                v241(bathroomattackTAB, "bathroomattackTAB")
                                v241(towerofhellTAB, "towerofhellTAB")
                                v241(ttdTAB, "ttdTAB")
                                v241(sharkbite2TAB, "sharkbite2TAB")
                                v241(bloxburgTAB, "bloxburgTAB")
                                v241(prisonlifeTAB, "prisonlifeTAB")
                                v241(kinglegacyTAB, "kinglegacyTAB")
                                v241(drivingempireTAB, "drivingempireTAB")
                                v241(petsimulator99TAB, "petsimulator99TAB")
                                v241(bladeballTAB, "bladeballTAB")
                                v241(breakin2TAB, "breakin2TAB")
                                v241(bloxfruitTAB, "bloxfruitTAB")
                                v241(brookhavenTAB, "brookhavenTAB")
                                v241(evadeTAB, "evadeTAB")
                                v241(doorsTAB, "doorsTAB")
                                v241(murdermystery2TAB, "murdermystery2TAB")
                                v241(fishingsimTAB, "fishingsimTAB")
                                v241(arsenalTAB, "arsenalTAB")
                                v241(three008TAB, "three008TAB")
                                v241(dahoodTAB, "dahoodTAB")
                                v241(armwrestlesimTAB, "armwrestlesimTAB")
                                v241(babftTAB, "babftTAB")
                                v241(deathballTAB, "deathballTAB")
                                v241(dustytripTAB, "dustytripTAB")
                                v241(strucidTAB, "strucidTAB")
                                v241(counterbloxTAB, "counterbloxTAB")
                                v241(jailbreakTAB, "jailbreakTAB")
                                v241(bedwarsTAB, "bedwarsTAB")
                                v241(tsbgTAB, "tsbgTAB")
                            elseif v72 and v72[v242] then
                                if v72[v242].tabName ~= "jailbreak" then
                                    if v72[v242].tabName ~= "bedwars" then
                                        if v72[v242].tabName ~= "GKRS" then
                                            if v72[v242].tabName ~= "zosamurai" then
                                                if v72[v242].tabName ~= "RateMyAvatar" then
                                                    if v72[v242].tabName ~= "SurviveTheKiller" then
                                                        if v72[v242].tabName ~= "whoisthespy" then
                                                            if v72[v242].tabName ~= "FlexYourFPS" then
                                                                if v72[v242].tabName ~= "therapy" then
                                                                    if v72[v242].tabName ~= "STSim" then
                                                                        if v72[v242].tabName ~= "BasketballLegends" then
                                                                            if v72[v242].tabName ~= "AOTRevo" then
                                                                                if v72[v242].tabName ~= "kat" then
                                                                                    if v72[v242].tabName ~= "BoogaBoogaREBORN" then
                                                                                        if v72[v242].tabName ~= "AnimeDefenders" then
                                                                                            if v72[v242].tabName ~= "LifeinPrison" then
                                                                                                if v72[v242].tabName ~= "TappingLegendsFinal" then
                                                                                                    if v72[v242].tabName ~= "CloseYourEyes" then
                                                                                                        if v72[v242].tabName ~= "WarriorSimulator" then
                                                                                                            if v72[v242].tabName ~= "Pressure" then
                                                                                                                if v72[v242].tabName ~= "BRQUIZFreaky" then
                                                                                                                    if v72[v242].tabName ~= "LivetopiaTownHall" then
                                                                                                                        if v72[v242].tabName ~= "westbound" then
                                                                                                                            if v72[v242].tabName ~= "CarDrivingUltimate" then
                                                                                                                                if v72[v242].tabName ~= "untitledboxinggame" then
                                                                                                                                    if v72[v242].tabName ~= "DestructionSimulator" then
                                                                                                                                        if v72[v242].tabName ~= "beaparkourninja" then
                                                                                                                                            if v72[v242].tabName ~= "FTNLC" then
                                                                                                                                                if v72[v242].tabName ~= "Baddies" then
                                                                                                                                                    if v72[v242].tabName ~= "ZombieRush" then
                                                                                                                                                        if v72[v242].tabName ~= "BIGPaintball1" then
                                                                                                                                                            if v72[v242].tabName ~= "TPS_StreetSoccer" then
                                                                                                                                                                if v72[v242].tabName ~= "RushPoint" then
                                                                                                                                                                    if v72[v242].tabName ~= "eatslimetogethuge" then
                                                                                                                                                                        if v72[v242].tabName ~= "LumberTycoon2" then
                                                                                                                                                                            if v72[v242].tabName ~= "ESYG1SBYOaBike" then
                                                                                                                                                                                if v72[v242].tabName ~= "OperationsSiege" then
                                                                                                                                                                                    if v72[v242].tabName ~= "BridgeDuels" then
                                                                                                                                                                                        if v72[v242].tabName ~= "DemonPiece" then
                                                                                                                                                                                            if v72[v242].tabName ~= "ProjectSmash" then
                                                                                                                                                                                                if v72[v242].tabName ~= "DungeonRNG" then
                                                                                                                                                                                                    if v72[v242].tabName ~= "DemonFall" then
                                                                                                                                                                                                        if v72[v242].tabName ~= "ZombieUprising" then
                                                                                                                                                                                                            if v72[v242].tabName ~= "fightinaschool" then
                                                                                                                                                                                                                if v72[v242].tabName ~= "JimsRNG" then
                                                                                                                                                                                                                    if v72[v242].tabName ~= "DinosaurSimulator" then
                                                                                                                                                                                                                        if v72[v242].tabName ~= "WizardTycoon2Player" then
                                                                                                                                                                                                                            if v72[v242].tabName ~= "BreakIn1" then
                                                                                                                                                                                                                                if v72[v242].tabName ~= "raiseafloppa2" then
                                                                                                                                                                                                                                    if v72[v242].tabName ~= "MonkeyTycoon" then
                                                                                                                                                                                                                                        if v72[v242].tabName ~= "CarDealershipTycoon" then
                                                                                                                                                                                                                                            if v72[v242].tabName ~= "JujutsuShenanigans" then
                                                                                                                                                                                                                                                if v72[v242].tabName ~= "FlingThingsandPeople" then
                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "ProjectSlayer" then
                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "TaxiBoss" then
                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "CRDS" then
                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "RaceClicker" then
                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "Typesoul" then
                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "PillarChase2" then
                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "AbilityWars" then
                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "AOPG" then
                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "Dungeonquest" then
                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "BadBusiness" then
                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "funkyfriday" then
                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "RoBeats" then
                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "NavalWarfare" then
                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "undergroundwar2TAB" then
                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "fleethefacility" then
                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "CabinCrewSimulator" then
                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "CarDrivingSimulator" then
                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "RarityFactoryTycoon" then
                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "Rivals" then
                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "UnnamedShooter" then
                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "ScytheSim" then
                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "EpicMinigames" then
                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "Hoopz" then
                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "TrackFieldInfinite" then
                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "FootballFusion2" then
                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "criminality" then
                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "eattheworld" then
                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "flagwars" then
                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "micup" then
                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "recodeuntitledtaggame" then
                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "tridentsurvival" then
                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "myrestaurant" then
                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "warmachines" then
                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "phantomforce" then
                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "tycoonRng" then
                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "musclelegends" then
                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "gymleague" then
                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "slapbattle" then
                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "monsterbattlesim" then
                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "adoptme" then
                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "lifesentence" then
                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "launchintospace" then
                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "carcrusher2" then
                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "ninjalegends" then
                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "frontlines" then
                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "animeChampSim" then
                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "fruitbg" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "animeswordX" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "legendofspeed" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "bettermusic" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "adminrng" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "zombieattack" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "bulkup" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "piggy" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "mimic" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "mVs" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "solsrng" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "animerng" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "ragdollengine" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "animepunch2" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "vehiclelegend" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "bathroomattack" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "towerofhell" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "ttd" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "sharkbite2" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "bloxburg" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "prisonlife" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "kinglegacy" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "drivingempire" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "petsimulator99" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "bladeball" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "breakin2" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "bloxfruit" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "brookhaven" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "evade" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "doors" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "murdermystery2" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "fishingsim" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "arsenal" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "three008" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "dahood" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "armwrestlesim" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "babft" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "deathball" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if v72[v242].tabName ~= "dustytrip" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if v72[v242].tabName ~= "strucid" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if v72[v242].tabName ~= "counterblox" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if v72[v242].tabName ~= "tsbg" then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    print("no supported game detected! (excluding solara tab)")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    tsbgTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                counterbloxTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            strucidTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        dustytripTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    deathballTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                babftTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            armwrestlesimTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        dahoodTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    three008TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                arsenalTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            fishingsimTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        murdermystery2TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    doorsTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                evadeTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            brookhavenTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        bloxfruitTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    breakin2TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                bladeballTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            petsimulator99TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        drivingempireTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    kinglegacyTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                prisonlifeTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            bloxburgTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        sharkbite2TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ttdTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                towerofhellTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            bathroomattackTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        vehiclelegendTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    animepunch2TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ragdollengineTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            animerngTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        solsrngTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    mVsTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                mimicTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            piggyTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        bulkupTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    zombieattackTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                                adminrngTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                                            bettermusicTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                                        legendofspeedTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                                    animeswordXTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                                fruitbgTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                                            animeChampSimTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                                        frontlinesTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                                    ninjalegendsTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                                carcrusher2TAB()
                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                                            launchintospaceTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                                        lifesentenceTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                                    adoptmeTAB()
                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                monsterbattlesimTAB()
                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                            slapbattleTAB()
                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                        gymleagueTAB()
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                    musclelegendsTAB()
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                tycoonRngTAB()
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                            phantomforceTAB()
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                        warmachinesTAB()
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                    myrestaurantTAB()
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                tridentsurvivalTAB()
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                            recodeuntitledtaggameTAB()
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                        micupTAB()
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                    flagwarsTAB()
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                eattheworldTAB()
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                            criminalityTAB()
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                        FootballFusion2TAB()
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                    TrackFieldInfiniteTAB()
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                HoopzTAB()
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                            EpicMinigamesTAB()
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                        ScytheSimTAB()
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                    UnnamedShooterTAB()
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                v241(RivalsTAB, "RivalsTAB")
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                            v241(RarityFactoryTycoonTAB, "RarityFactoryTycoonTAB")
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                        v241(CarDrivingSimulatorTAB, "CarDrivingSimulatorTAB")
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                    v241(CabinCrewSimulatorTAB, "CabinCrewSimulatorTAB")
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                v241(fleethefacilityTAB, "fleethefacilityTAB")
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                            v241(undergroundwar2TAB, "undergroundwar2")
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                        v241(NavalWarfareTAB, "NavalWarfareTAB")
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                    v241(RoBeatsTAB, "RoBeatsTAB")
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                v241(funkyfridayTAB, "funkyfridayTAB")
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                            v241(BadBusinessTAB, "BadBusinessTAB")
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                        v241(DungeonquestTAB, "DungeonquestTAB")
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                    v241(AOPGTAB, "AOPGTAB")
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                v241(AbilityWarsTAB, "AbilityWarsTAB")
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                            v241(PillarChase2TAB, "PillarChase2TAB")
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                        v241(TypesoulTAB, "TypesoulTAB")
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                    v241(RaceClickerTAB, "RaceClickerTAB")
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                v241(CRDSTAB, "CRDSTAB")
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                            v241(TaxiBossTAB, "TaxiBossTAB")
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                        v241(ProjectSlayerTAB, "ProjectSlayerTAB")
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                    v241(FlingThingsandPeopleTAB, "FlingThingsandPeopleTAB")
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                v241(JujutsuShenanigansTAB, "JujutsuShenanigansTAB")
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                            v241(CarDealershipTycoonTAB, "CarDealershipTycoonTAB")
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                        v241(MonkeyTycoonTAB, "MonkeyTycoonTAB")
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                    v241(raiseafloppa2TAB, "raiseafloppa2TAB")
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                v241(BreakIn1TAB, "BreakIn1TAB")
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                            v241(WizardTycoon2PlayerTAB, "WizardTycoon2PlayerTAB")
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                        v241(DinosaurSimulatorTAB, "DinosaurSimulatorTAB")
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                else
                                                                                                                                                                                                                    v241(JimsRNGTAB, "JimsRNGTAB")
                                                                                                                                                                                                                end
                                                                                                                                                                                                            else
                                                                                                                                                                                                                v241(fightinaschoolTAB, "fightinaschoolTAB")
                                                                                                                                                                                                            end
                                                                                                                                                                                                        else
                                                                                                                                                                                                            v241(ZombieUprisingTAB, "ZombieUprisingTAB")
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        v241(DemonFallTAB, "DemonFallTAB")
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    v241(DungeonRNGTAB, "DungeonRNGTAB")
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                v241(ProjectSmashTAB, "ProjectSmashTAB")
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            v241(DemonPieceTAB, "DemonPieceTAB")
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        v241(BridgeDuelsTAB, "BridgeDuelsTAB")
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    v241(OperationsSiegeTAB, "OperationsSiegeTAB")
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                v241(ESYG1SBYOaBikeTAB, "ESYG1SBYOaBikeTAB")
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            v241(LumberTycoon2TAB, "LumberTycoon2TAB")
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        v241(eatslimetogethugeTAB, "eatslimetogethugeTAB")
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    v241(RushPointTAB, "RushPointTAB")
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                v241(TPS_StreetSoccerTAB, "TPS_StreetSoccerTAB")
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            v241(BIGPaintball1TAB, "BIGPaintball1TAB")
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        v241(ZombieRushTAB, "ZombieRushTAB")
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    v241(BaddiesTAB, "BaddiesTAB")
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                v241(FTNLCTAB, "FTNLCTAB")
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            v241(beaparkourninjaTAB, "beaparkourninjaTAB")
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        v241(DestructionSimulatorTAB, "DestructionSimulatorTAB")
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    v241(untitledboxinggameTAB, "untitledboxinggameTAB")
                                                                                                                                end
                                                                                                                            else
                                                                                                                                v241(CarDrivingUltimateTAB, "CarDrivingUltimateTAB")
                                                                                                                            end
                                                                                                                        else
                                                                                                                            v241(westboundTAB, "westboundTAB")
                                                                                                                        end
                                                                                                                    else
                                                                                                                        v241(LivetopiaTownHallTAB, "LivetopiaTownHallTAB")
                                                                                                                    end
                                                                                                                else
                                                                                                                    v241(BRQUIZFreakyTAB, "BRQUIZFreakyTAB")
                                                                                                                end
                                                                                                            else
                                                                                                                v241(PressureTAB, "PressureTAB")
                                                                                                            end
                                                                                                        else
                                                                                                            v241(WarriorSimulatorTAB, "WarriorSimulatorTAB")
                                                                                                        end
                                                                                                    else
                                                                                                        v241(CloseYourEyesTAB, "CloseYourEyesTAB")
                                                                                                    end
                                                                                                else
                                                                                                    v241(TappingLegendsFinalTAB, "TappingLegendsFinalTAB")
                                                                                                end
                                                                                            else
                                                                                                v241(LifeinPrisonTAB, "LifeinPrisonTAB")
                                                                                            end
                                                                                        else
                                                                                            v241(AnimeDefendersTAB, "AnimeDefendersTAB")
                                                                                        end
                                                                                    else
                                                                                        v241(BoogaBoogaREBORNTAB, "BoogaBoogaREBORNTAB")
                                                                                    end
                                                                                else
                                                                                    v241(katTAB, "katTAB")
                                                                                end
                                                                            else
                                                                                v241(AOTRevoTAB, "AOTRevoTAB")
                                                                            end
                                                                        else
                                                                            v241(BasketballLegendsTAB, "BasketballLegends")
                                                                        end
                                                                    else
                                                                        v241(STSimTAB, "STSimTAB")
                                                                    end
                                                                else
                                                                    v241(therapyTAB, "therapyTAB")
                                                                end
                                                            else
                                                                v241(FlexYourFPSTAB, "FlexYourFPSTAB")
                                                            end
                                                        else
                                                            v241(whoisthespyTAB, "whoisthespyTAB")
                                                        end
                                                    else
                                                        v241(SurviveTheKillerTAB, "SurviveTheKillerTAB")
                                                    end
                                                else
                                                    v241(RateMyAvatarTAB, "RateMyAvatarTAB")
                                                end
                                            else
                                                v241(zosamuraiTAB, "zosamuraiTAB")
                                            end
                                        else
                                            v241(GKRSTAB, "GKRSTAB")
                                        end
                                    else
                                        bedwarsTAB()
                                    end
                                else
                                    jailbreakTAB()
                                end
                            elseif game.GameId ~= 124283622 then
                                if game.GameId ~= 2162282815 then
                                    if game.GameId ~= 5493012775 then
                                        if game.GameId ~= 5663142217 then
                                            if game.GameId ~= 4124008017 then
                                                if game.GameId ~= 2633076999 then
                                                    if game.GameId ~= 5200655965 then
                                                        if game.GameId ~= 6002149925 then
                                                            if game.GameId ~= 1650291138 then
                                                                if game.GameId ~= 1709832923 then
                                                                    if game.GameId ~= 6061766680 then
                                                                        if game.GameId ~= 5780359296 then
                                                                            if game.GameId ~= 98839997 then
                                                                                if game.GameId ~= 110988953 then
                                                                                    if game.GameId ~= 1318971886 then
                                                                                        if game.GameId ~= 3620011279 then
                                                                                            if game.GameId ~= 4055984814 then
                                                                                                if game.GameId ~= 605887098 then
                                                                                                    if game.GameId ~= 3508322461 then
                                                                                                        if game.GameId ~= 2668101271 then
                                                                                                            if game.GameId ~= 2142948266 then
                                                                                                                if game.GameId ~= 2851381018 then
                                                                                                                    if game.GameId ~= 4072288216 then
                                                                                                                        if game.GameId ~= 3476371299 then
                                                                                                                            if game.GameId ~= 4871329703 then
                                                                                                                                if game.GameId ~= 5700746583 then
                                                                                                                                    if game.GameId ~= 3168615253 then
                                                                                                                                        if game.GameId ~= 3213362013 then
                                                                                                                                            if game.GameId ~= 848145103 then
                                                                                                                                                if game.GameId ~= 1168263273 then
                                                                                                                                                    if game.GameId ~= 1802741133 then
                                                                                                                                                        if game.GameId ~= 468158842 then
                                                                                                                                                            if game.GameId ~= 3938551440 then
                                                                                                                                                                if game.GameId == 2440500124 then
                                                                                                                                                                    v241(doorsTAB, "doorsTAB")
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                v241(RarityFactoryTycoonTAB, "RarityFactoryTycoonTAB")
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            v241(CarDrivingSimulatorTAB, "CarDrivingSimulatorTAB")
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        v241(CabinCrewSimulatorTAB, "CabinCrewSimulatorTAB")
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    v241(BadBusinessTAB, "BadBusinessTAB")
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                v241(DungeonquestTAB, "DungeonquestTAB")
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            v241(AOPGTAB, "AOPGTAB")
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        v241(AbilityWarsTAB, "AbilityWarsTAB")
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    v241(PillarChase2TAB, "PillarChase2TAB")
                                                                                                                                end
                                                                                                                            else
                                                                                                                                v241(TypesoulTAB, "TypesoulTAB")
                                                                                                                            end
                                                                                                                        else
                                                                                                                            v241(RaceClickerTAB, "RaceClickerTAB")
                                                                                                                        end
                                                                                                                    else
                                                                                                                        v241(CRDSTAB, "CRDSTAB")
                                                                                                                    end
                                                                                                                else
                                                                                                                    v241(TaxiBossTAB, "TaxiBossTAB")
                                                                                                                end
                                                                                                            else
                                                                                                                v241(ProjectSlayerTAB, "ProjectSlayerTAB")
                                                                                                            end
                                                                                                        else
                                                                                                            v241(FlingThingsandPeopleTAB, "FlingThingsandPeopleTAB")
                                                                                                        end
                                                                                                    else
                                                                                                        v241(JujutsuShenanigansTAB, "JujutsuShenanigansTAB")
                                                                                                    end
                                                                                                else
                                                                                                    v241(CarDealershipTycoonTAB, "CarDealershipTycoonTAB")
                                                                                                end
                                                                                            else
                                                                                                v241(MonkeyTycoonTAB, "MonkeyTycoonTAB")
                                                                                            end
                                                                                        else
                                                                                            v241(raiseafloppa2TAB, "raiseafloppa2TAB")
                                                                                        end
                                                                                    else
                                                                                        v241(BreakIn1TAB, "BreakIn1TAB")
                                                                                    end
                                                                                else
                                                                                    v241(WizardTycoon2PlayerTAB, "WizardTycoon2PlayerTAB")
                                                                                end
                                                                            else
                                                                                v241(DinosaurSimulatorTAB, "DinosaurSimulatorTAB")
                                                                            end
                                                                        else
                                                                            v241(JimsRNGTAB, "JimsRNGTAB")
                                                                        end
                                                                    else
                                                                        v241(fightinaschoolTAB, "fightinaschoolTAB")
                                                                    end
                                                                else
                                                                    v241(ZombieUprisingTAB, "ZombieUprisingTAB")
                                                                end
                                                            else
                                                                v241(DemonFallTAB, "DemonFallTAB")
                                                            end
                                                        else
                                                            v241(DungeonRNGTAB, "DungeonRNGTAB")
                                                        end
                                                    else
                                                        v241(ProjectSmashTAB, "ProjectSmashTAB")
                                                    end
                                                else
                                                    v241(DemonPieceTAB, "DemonPieceTAB")
                                                end
                                            else
                                                v241(BridgeDuelsTAB, "BridgeDuelsTAB")
                                            end
                                        else
                                            v241(ESYG1SBYOaBikeTAB, "ESYG1SBYOaBikeTAB")
                                        end
                                    else
                                        v241(eatslimetogethugeTAB, "eatslimetogethugeTAB")
                                    end
                                else
                                    v241(RushPointTAB, "RushPointTAB")
                                end
                            else
                                v241(TPS_StreetSoccerTAB, "TPS_StreetSoccerTAB")
                            end
                        end)
                        local v245 = os.clock()
                        local v246 = string.format("%.2f", v245 - v71)
                        if v243 then
                            print("Venox Hub Loaded Successfully! In", v246 .. "s")
                            print("Venox Hub Loaded on " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " / PlaceId: " .. game.PlaceId .. " GameId:" .. game.GameId)
                            vu65:Notify({
                                ["Title"] = "Venox Hub Loaded Successfully!",
                                ["Content"] = "Venox Hub",
                                ["Duration"] = 6.5,
                                ["Image"] = 6026568227
                            })
                        else
                            vu65:Notify({
                                ["Title"] = "Venox Hub Failed to Load!see f9",
                                ["Content"] = "Venox Hubb",
                                ["Duration"] = 6.5,
                                ["Image"] = 6026568227
                            })
                            print("Error Loading Venox Hub: \n" .. v244 .. "\n\nDebug:" .. debug.traceback())
                            print("")
                            print("Error Loading Venox Hub? Report it on my Discord so i can fix it! .gg/X4Rhrzemyq")
                        end
                    end
                else
                    print("Your Venox Hub version is outdated. Using old or cracked versions could put your account at risk.")
                    print("Outdated versions might be detected and could harm your account security.")
                    print("Please visit discord.gg/venoxhub to get the latest version and keep your account safe!")
                end
            end
        else
            return
        end
    else
        print("cmon bro stop it :/ better try crack wave than a random scripthub")
        return
    end
end
function z7T8Q3W(p247, p248)
	-- upvalues: (ref) vu50, (ref) vu27, (ref) vu48
    if p247 then
        vu50(getgenv().pe75UjfuKY)
        vu27.venoxLoader:Destroy()
        local v249 = "Venox Hub"
        if not isfolder(v249) then
            makefolder(v249)
        end
        writefile(v249 .. "/savedkey.txt", p248)
        local v250 = readfile("Venox Hub/savedkey.txt")
        if v250 == "25msWasHere" then
            return
        end
        if (function(p251, p252)
            local v253, v254, v255 = ipairs(p252)
            while true do
                local v256
                v255, v256 = v253(v254, v255)
                if v255 == nil then
                    break
                end
                if string.find(p251, v256) then
                    return true
                end
            end
            return false
        end)(v250, {
            "25ms",
            "crack",
            "25msWasHere"
        }) then
            return
        end
        v4C6S9U(getgenv().s6Cuu6sES, getgenv().pe75UjfuKY, "0xZ8Y7X6W5V4U3T2S1R0Q9P8O7N6M5L4K3J2I1H0G9F8E7D6C5B4A3B2C1")
    else
        vu48()
    end
end
if isfile("Venox Hub/savedkey.txt") then
    vu26("Venox Hub", "checking existing key...", 3)
    wait(3)
    local v257 = readfile("Venox Hub/savedkey.txt")
    local v258 = x1Y9P4R(v257)
    if v258 then
        vu26("Venox Hub", "existing key valid!", 3)
    else
        vu26("Venox Hub", "existing key expired!", 3)
    end
    wait(1)
    z7T8Q3W(v258, v257)
else
    print("Get Venox Hub Key Now!")
end
vu27.check_key.MouseButton1Click:Connect(function()
	-- upvalues: (ref) vu27, (ref) vu26
    local v259 = vu27.input_field.Text
    vu26("Venox Hub", "cracked by @riplagardoz on dc", 2)
    local v260 = x1Y9P4R(v259)
    z7T8Q3W(v260, v259)
end)