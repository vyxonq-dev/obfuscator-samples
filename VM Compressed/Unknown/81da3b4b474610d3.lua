--[[

                ,_
                 :`.            .--._
                  `.`-.        /  ',-""""'
                    `. ``~-._.'_."/
                      `~-._ .` `~;
                           ;.    /
                          /     /
                 Asu ,_.-';_,.'`
                      `"-;`/
                        ,'`

            Sept 2025 source - Build A Tank
        This game sucks, it's a Robux printer
                and it's plagiarism

                    love you all <3

]]

--[[
    link: https://www.roblox.com/fr/games/90268214441888/Build-A-Tank
    Features:
        - Dupe Money
        - Dupe blocks
        - give admin, robux blocks

]]
        
-- locals
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local PrefabsId = "rbxassetid://" .. tostring(ReGui.PrefabsId)
local Dupe_Money = false
local Dupe_Blocks = false
local force = 1

ReGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})

local Exploit = ReGui:TabsWindow({
        Title = "Build Saver",
        Size = UDim2.fromOffset(254, 308),
        Position = UDim2.new(0.5, 7, 0.5, -100),
        NoClose = true,
    })

local Exp = Exploit:CreateTab({
	Name = "Save"
})

local Credit = Exploit:CreateTab({
	Name = "Credit"
})


-- funcs
function joindiscord()
    local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    if requestFunc then
        pcall(function()
            requestFunc({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = game.HttpService:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = game.HttpService:GenerateGUID(false),
                    args = {code = "eyUFHKV2cM"}
                })
            })
        end)
    end
end

local function MoneyGiver()
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BlockShop"):WaitForChild("BuyItem")

    while Dupe_Money do
            task.spawn(function()
                local payload = {
                    {
                        stock = {
                            min = 5,
                            max = 1
                        },
                        price = {
                            productAmount = 1,
                            money = -math.random(65465,65446898) * (math.random(force, force^2) * math.random(1, 1.8)),
                            productId = 3377006387
                        },
                        rarity = "Common",
                        unlock = {
                            damage = 0
                        },
                        name = "Ammo Box"
                    }
                }

                remote:InvokeServer(unpack(payload))
            end)

        task.wait(.1)
    end
end

local function ItemGiver()
    local Blocks_folder = game:GetService("ReplicatedStorage").Blocks
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BlockShop"):WaitForChild("BuyItem")
    local Blocktable = {}

    for _, Block in pairs(Blocks_folder:GetChildren()) do
        if Block:IsA("Model") then
            table.insert(Blocktable, Block.Name)
        end
    end

    while Dupe_Blocks do
        for _, v in pairs(Blocktable) do
            task.spawn(function()
                local payload = {
                    {
                        stock = {
                            min = 5,
                            max = 1
                        },
                        price = {
                            productAmount = 1,
                            money = 0,
                            productId = 3377006387
                        },
                        rarity = "Common",
                        unlock = {
                            damage = 0
                        },
                        name = v
                    }
                }

                remote:InvokeServer(unpack(payload))
            end)
        end

        task.wait(.2)
    end
end

-- Exp tab
Exp:Separator({Text = "Credit"})

Exp:Button({
	Text = "Unload Script",
	Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(245, 60, 60),
	Callback = function()
        Exploit:Remove()
        Dupe_Money = false
        Dupe_Blocks = false
	end,
})

Exp:Checkbox({
	Value = false,
	Label = "Dupe Items",
	Callback = function(self, Value)
        Dupe_Blocks = Value
		ItemGiver()
	end
})

Exp:Checkbox({
	Value = false,
	Label = "Dupe Money",
	Callback = function(self, Value)
		Dupe_Money = Value
        MoneyGiver()
	end
})

Exp:SliderProgress({
    Label = "force",
    Value = 1,
    Minimum = 1,
    Maximum = 8,
    Size = UDim2.fromOffset(128, 21),
    Callback = function(self, Value)
        force = Value
end,
})

Exp:Separator({Text = "Info"})

Exp:Label({
    TextWrapped = true,
	Text = "Vuln is laggy, it will freeze your screen, you still can toggle off while freezing!\nDupe blocks will also give you all blocks, including admin and robux items.\nThe Force slider is only for dupe money exploit."
})

-- Credit tab
Credit:Button({
	Text = "Join Discord",
	Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(80, 200, 90),
	Callback = function()
        pcall(function() joindiscord() end)
        setclipboard("https://discord.gg/eyUFHKV2cM")
	end,
})

Credit:Separator({Text = "Credit"})

Credit:Label({
    TextWrapped = true,
	Text = "Scripter: @thereal_asu - Asu\nLibrary by @depthso - Depso\n "
})

Credit:Separator({Text = "Other"})

Credit:Label({
    TextWrapped = true,
	Text = "Join the discord for more things like this :)"
})

-- script end
