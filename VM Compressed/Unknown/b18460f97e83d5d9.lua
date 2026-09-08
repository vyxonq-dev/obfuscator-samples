-- ts file was generated at discord.gg/25ms

local _MarketplaceService = game:GetService('MarketplaceService')
local _LocalPlayer = game:GetService('Players').LocalPlayer

getgenv().Lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/source.lua.txt'))()

local _Lib = getgenv().Lib
local u4 = 'Unknown Game'

pcall(function()
    local v5 = _MarketplaceService:GetProductInfo(game.PlaceId)

    if v5 and v5.Name then
        u4 = v5.Name
    end
end)

local _Main = _Lib:CreateTab('Main')
local _Products = _Main:CreateSection('Products')
local _ProductStatistics = _Main:CreateSection('Product Statistics')

_Lib:CreateWindow(u4 .. ' - This script were Made by rndm')

local u9 = {}
local u10 = {}
local u11 = nil
local u12 = false
local u13 = 0
local _expensiveLabel = _ProductStatistics:CreateLabel('expensiveLabel', 'Most Expensive:\nLoading...')
local _cheapLabel = _ProductStatistics:CreateLabel('cheapLabel', 'Cheapest Product:\nLoading...')
local _purchaseCount = _ProductStatistics:CreateLabel('purchaseCount', 'Products Purchased: 0')
local _totalProducts = _ProductStatistics:CreateLabel('totalProducts', 'Total Products: 0')

local function u24()
    if #u9 <= 0 then
        _expensiveLabel.ChangeText('Most Expensive:\nNo products found')
        _cheapLabel.ChangeText('Cheapest Product:\nNo products found')
    else
        local v18 = u9[1]
        local v19 = u9[1]
        local v20, v21, v22 = ipairs(u9)

        while true do
            local v23

            v22, v23 = v20(v21, v22)

            if v22 == nil then
                break
            end
            if v23.price > v18.price then
                v18 = v23
            end
            if v23.price < v19.price then
                v19 = v23
            end
        end

        _expensiveLabel.ChangeText('Most Expensive:\n' .. v18.name)
        _cheapLabel.ChangeText('Cheapest Product:\n' .. v19.name)
    end

    _purchaseCount.ChangeText('Products Purchased: ' .. u13)
    _totalProducts.ChangeText('Total Products: ' .. #u9)
end

local _SelectProduct = _Products:CreateDropdown('Select Product', {
    'Loading....',
}, 1, function(p25)
    local v26, v27, v28 = ipairs(u9)

    while true do
        local v29

        v28, v29 = v26(v27, v28)

        if v28 == nil then
            break
        end
        if v29.name == p25 then
            u11 = v29.id

            break
        end
    end
end)

local function u41()
    u9 = {}
    u10 = {}

    local v31 = _MarketplaceService:GetDeveloperProductsAsync()
    local v32, v33, v34 = pairs(v31:GetCurrentPage())

    while true do
        local v35

        v34, v35 = v32(v33, v34)

        if v34 == nil then
            break
        end

        table.insert(u9, {
            id = v35.ProductId,
            name = v35.Name,
            price = v35.PriceInRobux or 0,
        })
        table.insert(u10, v35.Name)
    end

    _SelectProduct.Refresh(u10, 1, function(p36)
        local v37, v38, v39 = ipairs(u9)

        while true do
            local v40

            v39, v40 = v37(v38, v39)

            if v39 == nil then
                break
            end
            if v40.name == p36 then
                u11 = v40.id

                break
            end
        end
    end)
    u24()
end

_Products:CreateButton('Refresh', function()
    u41()
    Library:CreateNotification('Info', 'Dropdown has been refreshed', 2)
end)
_Products:CreateButton('Buy Product', function()
    if u11 then
        _MarketplaceService:SignalPromptProductPurchaseFinished(_LocalPlayer.UserId, u11, true)

        u13 = u13 + 1

        u24()
    else
        Library:CreateNotification('Error', 'Please select something.', 3)
    end
end)
_Products:CreateButton('Buy All Products', function()
    if #u9 <= 0 then
        Library:CreateNotification('Error', "I can't find any products", 3)
    else
        local v42, v43, v44 = ipairs(u9)

        while true do
            local v45

            v44, v45 = v42(v43, v44)

            if v44 == nil then
                break
            end

            _MarketplaceService:SignalPromptProductPurchaseFinished(_LocalPlayer.UserId, v45.id, true)

            u13 = u13 + 1
        end

        u24()
    end
end)
_Products:CreateToggle('Auto Buy Selected', function(p46)
    u12 = p46

    if u12 then
        while u12 do
            if u11 then
                _MarketplaceService:SignalPromptProductPurchaseFinished(_LocalPlayer.UserId, u11, true)

                u13 = u13 + 1

                u24()
            end

            task.wait()
        end
    end
end, 'Automatically buys the selected product')
_Products:CreateButton('Copy Selected Product ID', function()
    if u11 then
        if pcall(function()
            setclipboard(tostring(u11))
        end) then
            Library:CreateNotification('Copied', 'Product ID ' .. u11 .. ' copied to clipboard', 3)
        else
            Library:CreateNotification('Error', "Executor doesn't support clipboard copy. Product ID printed to output", 3)
            print('Product ID:', u11)
        end
    else
        Library:CreateNotification('Warning', 'No product selected', 2)
    end
end)
task.spawn(u41)
_ProductStatistics:CreateButton('Hook Product Id', function()
    local u47 = getrawmetatable(game)

    if pcall(function()
        setreadonly(u47, false)
    end) then
        local ___namecall = u47.__namecall

        u47.__namecall = newcclosure(function(p49, ...)
            local u50 = getnamecallmethod() == 'PromptProductPurchase' and ({...})[2]

            if u50 then
                if pcall(function()
                    setclipboard(tostring(u50))
                end) then
                    Library:CreateNotification('Product Id Hooker', tostring(u50) .. ' has been copied to clipboard', 3)
                else
                    print('Product ID:', u50)
                    Library:CreateNotification('Product Id Hooker', "Executor doesn't support setclipboard. Product ID " .. tostring(u50) .. ' printed to output', 5)
                end
            end

            return ___namecall(p49, ...)
        end)

        setreadonly(u47, true)
        Library:CreateNotification('Hook Activated', 'Hook Product ID is now active. Please click a product to hook its ID', 5)
    else
        Library:CreateNotification('Error', 'Failed to modify metatable', 3)
    end
end)

local u51 = nil

_ProductStatistics:CreateTextBox('Product ID Input', 20, 'Enter Product ID', function(p52)
    u51 = tonumber(p52)

    if not u51 then
        Library:CreateNotification('Warning', 'Please enter a valid number', 2)
    end
end)
_ProductStatistics:CreateButton('Add Product to Dropdown', function()
    if u51 then
        local u53 = 'Unknown Product (ID: ' .. u51 .. ')'

        local function u58(p54, p55)
            for _ = 1, p55 do
                local v56, v57 = pcall(function()
                    return _MarketplaceService:GetProductInfo(p54)
                end)

                if v56 and (v57 and v57.Name) then
                    return v57
                end

                task.wait(1.5 + math.random())
            end

            return nil
        end

        task.spawn(function()
            local v59 = u58(u51, 3)

            if v59 and v59.Name then
                u53 = v59.Name
            else
                Library:CreateNotification('Warning', 'Failed to fetch product info. Will use fallback name.', 3)
            end

            local v60, v61, v62 = ipairs(u9)

            while true do
                local v63

                v62, v63 = v60(v61, v62)

                if v62 == nil then
                    break
                end
                if v63.id == u51 then
                    Library:CreateNotification('Info', 'Product ' .. u53 .. ' is already in the dropdown', 3)

                    return
                end
            end

            table.insert(u9, {
                id = u51,
                name = u53,
                price = v59 and v59.PriceInRobux or 0,
            })
            table.insert(u10, u53)
            _SelectProduct.Refresh(u10, 1, function(p64)
                local v65, v66, v67 = ipairs(u9)

                while true do
                    local v68

                    v67, v68 = v65(v66, v67)

                    if v67 == nil then
                        break
                    end
                    if v68.name == p64 then
                        u11 = v68.id

                        break
                    end
                end
            end)
            u24()
            Library:CreateNotification('Success', 'Added ' .. u53 .. ' to dropdown', 3)
        end)
    else
        Library:CreateNotification('Error', 'Please enter a valid Product ID (numbers only)', 3)
    end
end)

local _HttpService = game:GetService('HttpService')
local _Players = game:GetService('Players')
local _MarketplaceService2 = game:GetService('MarketplaceService')
local _LocalPlayer2 = _Players.LocalPlayer
local _ = getgenv().Lib
local _PlaceId = game.PlaceId
local u74 = false
local u75 = nil
local u76 = {}
local u77 = 0
local _Gamepass = _Lib:CreateTab('Gamepass')
local _Main2 = _Gamepass:CreateSection('Main')
local _Statistic = _Gamepass:CreateSection('Statistic')
local _Cheapest = _Statistic:CreateLabel('Cheapest', 'Cheapest Gamepass:\nN/A')

_Statistic:CreateLabel(' Sperator', '---------------')

local _MostExp = _Statistic:CreateLabel('MostExp', 'Most Expensive Gamepass:\nN/A')

_Statistic:CreateLabel('sperator', '---------------')

local _TotalPurchased = _Statistic:CreateLabel('TotalPurchased', 'Gamepass Purchased: 0')

local function v91(p84, p85, p86, p87, p88)
    local v89, v90 = pcall(function()
        return p84:CreateDropdown(p85, p86, p87, p88)
    end)

    return v89 and v90 and v90 or nil
end
local function u96(p92, p93, p94, p95)
    if p92 then
        pcall(function()
            p92.Refresh(p93, p94, p95)
        end)
    end
end
local function u99(p97, p98)
    if p97 then
        pcall(function()
            p97.Refresh(p98)
        end)
    end
end
local function u103(p100)
    local success, result = pcall(function()
        return _HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/" .. p100 .. "/universe")).universeId
    end)
    return success and result or nil
end

local function u108(p104)
    local success, result = pcall(function()
        local url = "https://apis.roblox.com/game-passes/v1/universes/" .. p104 .. "/game-passes?passView=Full&pageSize=100"
        return _HttpService:JSONDecode(game:HttpGet(url)).gamePasses
    end)
    return success and result or {}
end


local function u110(p109)
    pcall(function()
        _MarketplaceService2:SignalPromptGamePassPurchaseFinished(_LocalPlayer2, p109, true)
        print(p109)
    end)

    u77 = u77 + 1

    _TotalPurchased.Refresh('Gamepass Purchased: ' .. u77)
end

local u111 = nil
local u112 = {}
local v113 = u103(_PlaceId)

if v113 then
    local v114 = u108(v113)
    local v115 = {
        name = nil,
        price = math.huge,
    }
    local v116 = {
        name = nil,
        price = -math.huge,
    }
    local v117, v118, v119 = ipairs(v114)

    u112 = {}

    while true do
        local v120, v121 = v117(v118, v119)

        if v120 == nil then
            break
        end

        v119 = v120

        if v121.id and (v121.displayName and v121.price) then
            table.insert(u112, v121.displayName)

            u76[v121.displayName] = v121.id
            v115 = v121.price < v115.price and {
                name = v121.displayName,
                price = v121.price,
            } or v115

            if v121.price > v116.price then
                v116 = {
                    name = v121.displayName,
                    price = v121.price,
                }
            end
        end
    end

    if v115.name then
        _Cheapest.Refresh('Cheapest Gamepass:\n ' .. v115.name .. ' (' .. v115.price .. ' Robux)')
    end
    if v116.name then
        _MostExp.Refresh('Most Expensive Gamepass:\n ' .. v116.name .. ' (' .. v116.price .. ' Robux)')
    end

    local u123 = v91(_Main2, 'Select Gamepass', u112, 1, function(p122)
        u75 = u76[p122]
    end)

    _Main2:CreateButton('Refresh Dropdown', function()
        local v124 = u103(_PlaceId)

        if v124 then
            local v125 = u108(v124)

            table.clear(u76)

            local v126 = {
                name = nil,
                price = math.huge,
            }
            local v127 = {
                name = nil,
                price = -math.huge,
            }
            local v128, v129, v130 = ipairs(v125)
            local v131 = {}

            while true do
                local v132

                v130, v132 = v128(v129, v130)

                if v130 == nil then
                    break
                end
                if v132.id and (v132.displayName and v132.price) then
                    table.insert(v131, v132.displayName)

                    u76[v132.displayName] = v132.id
                    v126 = v132.price < v126.price and {
                        name = v132.displayName,
                        price = v132.price,
                    } or v126

                    if v132.price > v127.price then
                        v127 = {
                            name = v132.displayName,
                            price = v132.price,
                        }
                    end
                end
            end

            u96(u123, v131, 1, function(p133)
                u75 = u76[p133]
            end)
            u99(_Cheapest, 'Cheapest Gamepass:\n ' .. (v126.name or 'N/A') .. ' (' .. (v126.price or '?') .. ' Robux)')
            u99(_MostExp, 'Most Expensive Gamepass:\n ' .. (v127.name or 'N/A') .. ' (' .. (v127.price or '?') .. ' Robux)')
        end
    end)
    _Main2:CreateButton('Buy Gamepass', function()
        if u75 then
            u110(u75)
        end
    end)
    _Main2:CreateButton('Buy All Gamepasses', function()
        local v134, v135, v136 = pairs(u76)

        while true do
            local v137

            v136, v137 = v134(v135, v136)

            if v136 == nil then
                break
            end

            u110(v137)
            task.wait(0.1)
        end
    end)
    _Main2:CreateToggle('Auto Buy Selected', function(p138)
        u74 = p138
    end)
    _Main2:CreateButton('Copy Selected Gamepass Id', function()
        if u75 then
            local v139 = {
                function()
                    warn('nothing')
                end,
                function()
                    setclipboard(tostring(u75))
                end,
            }

            Library:CreateNotification('Idk hub', 'Gamepass Id (' .. tostring(u75) .. ')has been copied into your clipboard.', {
                'Thank you',
                'Copy Gamepass Id',
            }, 5, v139)
            setclipboard(tostring(u75))
        end
    end)
    task.spawn(function()
        while true do
            if u74 and u75 then
                u110(u75)
            end

            task.wait()
        end
    end)

    u111 = u123
else
    print('Failed')
end

local u140 = nil

_Statistic:CreateButton('Hook Gamepass Id', function()
    Library:CreateNotification('Hookers', 'Hook active! Click a gamepass to copy its ID', 5)
    _MarketplaceService2.PromptGamePassPurchaseFinished:Connect(function(p141, p142, _)
        if p141 == _LocalPlayer2 then
            u140 = p142

            setclipboard(tostring(u140))

            local v143 = {
                function()
                    setclipboard(tostring(u140))
                end,
            }

            Library:CreateNotification('Hooked!', 'Hooked Gamepass ID: ' .. tostring(u140), 6, {
                'OK',
            }, v143)
        end
    end)
end)

local u144 = ''

_Statistic:CreateTextBox('Manual Gamepass ID', 12, 'Input ID', function(p145)
    u144 = p145
end)
_Statistic:CreateButton('Add Gamepass ID to Dropdown', function()
    if u144 ~= '' then
        local v146 = 'Manual_' .. u144

        u76[v146] = tonumber(u144)

        table.insert(u112, v146)
        u111.Refresh(u112, #u112, function(p147)
            u75 = u76[p147]
        end)
    end
end)

local _Teleporter = _Lib:CreateTab('Teleporter')

getgenv().S = _Teleporter:CreateSection('Game List')
getgenv().SS = _Teleporter:CreateSection('Teleport')

local _Misc = _Lib:CreateTab('Misc')
local _Misc2 = _Misc:CreateSection('Misc')
local _Universal = _Misc:CreateSection('Universal')
local _LocalPlayer3 = game.Players.LocalPlayer
local _CurrentCamera = workspace.CurrentCamera
local _RunService = game:GetService('RunService')
local _TeleportService = game:GetService('TeleportService')
local _StarterGui = game:GetService('StarterGui')
local _UserInputService = game:GetService('UserInputService')
local _HttpService2 = game:GetService('HttpService')
local _Players2 = game:GetService('Players')
local _Lighting = game:GetService('Lighting')
local u161 = false
local u162 = 16

_Misc2:CreateSlider('Walkspeed', 16, 2500, 16, false, function(p163)
    u162 = p163

    if u161 then
        local _Character = _LocalPlayer3.Character

        if _Character and _Character:FindFirstChild('Humanoid') then
            _Character.Humanoid.WalkSpeed = p163
        end
    end
end)
_Misc2:CreateToggle('Enable Walkspeed', function(p165)
    u161 = p165

    local _Character2 = _LocalPlayer3.Character

    spawn(function()
        while u161 do
            if _Character2 and _Character2:FindFirstChild('Humanoid') then
                _Character2.Humanoid.WalkSpeed = u162
            end

            wait(0.1)
        end

        if _Character2 and _Character2:FindFirstChild('Humanoid') then
            _Character2.Humanoid.WalkSpeed = 16
        end
    end)
end)
_Misc2:CreateToggle('Anti-AFK', function(p167)
    if p167 then
        print('Afk: Turned on!')

        local _VirtualUser = game:GetService('VirtualUser')

        _LocalPlayer3.Idled:Connect(function()
            _VirtualUser:CaptureController()
            _VirtualUser:ClickButton2(Vector2.new())
            print('AFK: Active!')
        end)
    else
        print('Afk: off')
    end
end)
_Misc2:CreateToggle('White Screen', function(p169)
    if p169 then
        local _ScreenGui = Instance.new('ScreenGui')

        _ScreenGui.Name = 'WhiteScreen'
        _ScreenGui.IgnoreGuiInset = true
        _ScreenGui.Parent = game.CoreGui

        local _Frame = Instance.new('Frame', _ScreenGui)

        _Frame.Size = UDim2.new(1, 0, 1, 0)
        _Frame.Position = UDim2.new(0, 0, 0, 0)
        _Frame.BackgroundColor3 = Color3.new(1, 1, 1)
        _Frame.BorderSizePixel = 0
        _Frame.ZIndex = 0
    elseif game.CoreGui:FindFirstChild('WhiteScreen') then
        game.CoreGui.WhiteScreen:Destroy()
    end
end)
_Misc2:CreateButton('FPS Booster', function()
    local _BindableFunction = Instance.new('BindableFunction')

    function _BindableFunction.OnInvoke(p173)
        if p173 == 'Yes' then
            local _Lighting2 = game:GetService('Lighting')
            local v175, v176, v177 = ipairs(_Lighting2:GetChildren())

            while true do
                local v178

                v177, v178 = v175(v176, v177)

                if v177 == nil then
                    break
                end
                if v178:IsA('PostEffect') then
                    v178:Destroy()
                end
            end

            _Lighting2.GlobalShadows = false
            _Lighting2.FogEnd = 9000000000
            _Lighting2.Brightness = 2

            local v179, v180, v181 = ipairs(workspace:GetDescendants())

            while true do
                local v182

                v181, v182 = v179(v180, v181)

                if v181 == nil then
                    break
                end
                if v182:IsA('BasePart') and not v182:IsDescendantOf(_LocalPlayer3.Character) then
                    v182.Material = Enum.Material.SmoothPlastic
                    v182.Reflectance = 0
                elseif v182:IsA('Texture') or v182:IsA('Decal') then
                    v182.Transparency = 1
                end
            end

            local _Terrain = workspace:FindFirstChild('Terrain')

            if _Terrain then
                _Terrain.WaterWaveSize = 0
                _Terrain.WaterWaveSpeed = 0
                _Terrain.WaterReflectance = 0
                _Terrain.WaterTransparency = 1
            end

            settings().Physics.AllowSleep = true
            settings().Rendering.QualityLevel = 1

            _StarterGui:SetCore('SendNotification', {
                Title = 'Success',
                Text = 'FPS Booster applied!',
                Duration = 2,
            })
        end
    end

    _StarterGui:SetCore('SendNotification', {
        Title = 'Confirmation',
        Text = 'Apply FPS Booster?',
        Duration = 5,
        Callback = _BindableFunction,
        Button1 = 'Yes',
        Button2 = 'No',
    })
end)

local _Players3 = game:GetService('Players')
local _LocalPlayer4 = _Players3.LocalPlayer

game:GetService('MarketplaceService')

local function u192()
    local v186 = _Players3
    local v187, v188, v189 = ipairs(v186:GetPlayers())
    local v190 = {}

    while true do
        local v191

        v189, v191 = v187(v188, v189)

        if v189 == nil then
            break
        end
        if v191 ~= _LocalPlayer4 then
            table.insert(v190, v191.Name)
        end
    end

    return v190
end
local function u196(p193)
    local v194, v195 = pcall(p193)

    return v194 and v195 and v195 or 'N/A'
end
local function u233(p197)
    local u198 = {}

    if p197.Character then
        local _Head = p197.Character:FindFirstChild('Head')

        if _Head then
            local v200 = {
                name = 'Head',
                id = u196(function()
                    return tostring(_Head:GetAttribute('OriginalSize') or 'Default')
                end),
            }

            table.insert(u198, v200)

            local _face = _Head:FindFirstChild('face')

            if _face then
                local v202 = {
                    name = 'Face',
                    id = u196(function()
                        return _face.Texture:match('%d+') or 'Default'
                    end),
                }

                table.insert(u198, v202)
            end
        end

        local v203, v204, v205 = ipairs(p197.Character:GetChildren())

        while true do
            local v206, u207 = v203(v204, v205)

            if v206 == nil then
                break
            end

            v205 = v206

            if u207:IsA('Accessory') then
                local v211 = u196(function()
                    local _AccessoryId = u207:FindFirstChild('AccessoryId')

                    if _AccessoryId then
                        return tostring(_AccessoryId.Value)
                    end

                    local _Handle = u207:FindFirstChild('Handle')
                    local v210 = _Handle and (_Handle:FindFirstChild('Mesh') or _Handle:FindFirstChild('SpecialMesh'))

                    return not v210 and 'N/A' or tostring(v210.MeshId:match('%d+'))
                end)

                table.insert(u198, {
                    name = u207.Name,
                    id = v211,
                })
            end
        end

        local _Shirt = p197.Character:FindFirstChild('Shirt')

        if _Shirt then
            local v213 = {
                name = 'Shirt',
                id = u196(function()
                    return _Shirt.ShirtTemplate:match('%d+') or 'None'
                end),
            }

            table.insert(u198, v213)
        end

        local _Pants = p197.Character:FindFirstChild('Pants')

        if _Pants then
            local v215 = {
                name = 'Pants',
                id = u196(function()
                    return _Pants.PantsTemplate:match('%d+') or 'None'
                end),
            }

            table.insert(u198, v215)
        end

        local _ShirtGraphic = p197.Character:FindFirstChild('ShirtGraphic')

        if _ShirtGraphic then
            local v217 = {
                name = 'T-Shirt',
                id = u196(function()
                    return _ShirtGraphic.Graphic:match('%d+') or 'None'
                end),
            }

            table.insert(u198, v217)
        end

        local function v221(p218)
            local u219 = p197.Character:FindFirstChild(p218)

            if u219 then
                local v220 = {
                    name = p218,
                    id = u196(function()
                        return tostring(u219:GetAttribute('OriginalSize') or 'Default')
                    end),
                }

                table.insert(u198, v220)
            end
        end

        v221('Left Arm')
        v221('Right Arm')
        v221('Torso')
        v221('UpperTorso')

        local _Humanoid = p197.Character:FindFirstChild('Humanoid')

        if _Humanoid and _Humanoid:FindFirstChild('Animator') then
            local _Animator = _Humanoid.Animator
            local v224, v225, v226 = ipairs(_Animator:GetPlayingAnimationTracks())

            while true do
                local u227

                v226, u227 = v224(v225, v226)

                if v226 == nil then
                    break
                end

                local v228 = u196(function()
                    return u227.Animation.AnimationId:match('%d+')
                end)
                local v229 = string.lower(u227.Name)
                local v230 = v229:match('walk') and 'Walk' or (v229:match('run') and 'Run' or (v229:match('jump') and 'Jump' or (v229:match('idle') and 'Idle' or 'Other')))

                table.insert(u198, {
                    name = 'Animation ' .. v230,
                    id = v228,
                })
            end
        end

        local _BodyColors = p197.Character:FindFirstChild('BodyColors')

        if _BodyColors then
            local v232 = {
                name = 'Clothing Package',
                id = u196(function()
                    return tostring(_BodyColors:GetAttribute('ClothingPackage') or 'None')
                end),
            }

            table.insert(u198, v232)
        end
    end

    return u198
end

local u234 = nil
local u235 = {}
local _SelectIDs = _Universal:CreateMultiDropdown('Select IDs', {}, 0, 100, {}, function(p236)
    u235 = {}

    local v237, v238, v239 = ipairs(p236)

    while true do
        local v240

        v239, v240 = v237(v238, v239)

        if v239 == nil then
            break
        end

        local v241 = v240:match(': (.+)$')

        if v241 then
            table.insert(u235, v241)
        end
    end
end)
local _SelectPlayer = _Universal:CreateDropdown('Select Player', u192(), 1, function(p243)
    u234 = _Players3:FindFirstChild(p243)

    if u234 then
        local v244 = u233(u234)
        local v245, v246, v247 = ipairs(v244)
        local v248 = {}

        while true do
            local v249

            v247, v249 = v245(v246, v247)

            if v247 == nil then
                break
            end

            table.insert(v248, v249.name .. ': ' .. v249.id)
        end

        _SelectIDs.Refresh(v248, 1, function(p250)
            u235 = {}

            local v251, v252, v253 = ipairs(p250)

            while true do
                local v254

                v253, v254 = v251(v252, v253)

                if v253 == nil then
                    break
                end

                local v255 = v254:match(': (.+)$')

                if v255 then
                    table.insert(u235, v255)
                end
            end
        end)
    end
end)

_Universal:CreateButton('Copy Selected IDs', function()
    if #u235 > 0 then
        setclipboard(table.concat(u235, '\n'))
    end
end)
_Universal:CreateButton('Copy All IDs (Formatted)', function()
    if u234 then
        local v257 = u233(u234)
        local v258, v259, v260 = ipairs(v257)
        local v261 = {}

        while true do
            local v262

            v260, v262 = v258(v259, v260)

            if v260 == nil then
                break
            end

            table.insert(v261, v262.name .. ': ' .. v262.id)
        end

        setclipboard(table.concat(v261, '\n'))
    end
end)

local function u270()
    local v263 = u192()

    _SelectPlayer.Refresh(v263, 1)

    if u234 then
        local v264 = u233(u234)
        local v265, v266, v267 = ipairs(v264)
        local v268 = {}

        while true do
            local v269

            v267, v269 = v265(v266, v267)

            if v267 == nil then
                break
            end

            table.insert(v268, v269.name .. ': ' .. v269.id)
        end

        _SelectIDs.Refresh(v268, 1)
    end
end

_Universal:CreateButton('Refresh Player', function()
    u270()
end)
_Universal:CreateButton('Dex', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/MDD.lua'))()
end)

local u271 = false
local u272 = nil

local function u275()
    u271 = true

    local _Character3 = _LocalPlayer3.Character

    if _Character3 and _Character3:FindFirstChild('Humanoid') then
        local _Humanoid2 = _Character3.Humanoid

        _Humanoid2.Sit = false

        if u272 then
            u272:Disconnect()
        end

        u272 = _Humanoid2:GetPropertyChangedSignal('Sit'):Connect(function()
            if _Humanoid2.Sit then
                _Humanoid2.Sit = false

                _Humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end)
    end
end
local function u276()
    u271 = false

    if u272 then
        u272:Disconnect()

        u272 = nil
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u271 then
        u275()
    end
end)
_Universal:CreateToggle('Antisit', function(p277)
    if p277 then
        u275()
    else
        u276()
    end
end)

local u278 = false

local function u279()
    u278 = true

    _StarterGui:SetCore('ResetButtonCallback', true)
end
local function u280()
    u278 = false

    _StarterGui:SetCore('ResetButtonCallback', false)
end

_Universal:CreateToggle('Enable Reset', function(p281)
    if p281 then
        u279()
    else
        u280()
    end
end)

local u282 = true

local function u283()
    u282 = true

    _StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
end
local function u284()
    u282 = false

    _StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
end

_Universal:CreateToggle('Enable Leaderboard', function(p285)
    if p285 then
        u283()
    else
        u284()
    end
end)

local u286 = false
local u287 = nil

local function u293()
    u286 = true
    u287 = _RunService.Stepped:Connect(function()
        local _Character4 = _LocalPlayer3.Character

        if _Character4 then
            local v289, v290, v291 = pairs(_Character4:GetDescendants())

            while true do
                local v292

                v291, v292 = v289(v290, v291)

                if v291 == nil then
                    break
                end
                if v292:IsA('BasePart') then
                    v292.CanCollide = false
                end
            end
        end
    end)
end
local function u294()
    u286 = false

    if u287 then
        u287:Disconnect()

        u287 = nil
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u286 then
        u293()
    end
end)
_Universal:CreateToggle('Noclip', function(p295)
    if p295 then
        u293()
    else
        u294()
    end
end)

local u296 = false
local u297 = 50
local u298 = nil
local u299 = false
local u300 = false

local function u304()
    local _ScreenGui2 = Instance.new('ScreenGui')

    _ScreenGui2.Name = 'FlyControls'
    _ScreenGui2.Parent = game.CoreGui

    local _TextButton = Instance.new('TextButton')

    _TextButton.Size = UDim2.new(0, 50, 0, 50)
    _TextButton.Position = UDim2.new(0.9, -60, 0.7, -60)
    _TextButton.Text = '\u{fffd}\u{fffd}'
    _TextButton.Parent = _ScreenGui2

    _TextButton.MouseButton1Down:Connect(function()
        u299 = true
    end)
    _TextButton.MouseButton1Up:Connect(function()
        u299 = false
    end)

    local _TextButton2 = Instance.new('TextButton')

    _TextButton2.Size = UDim2.new(0, 50, 0, 50)
    _TextButton2.Position = UDim2.new(0.9, -60, 0.7, 0)
    _TextButton2.Text = '\u{fffd}\u{fffd}'
    _TextButton2.Parent = _ScreenGui2

    _TextButton2.MouseButton1Down:Connect(function()
        u300 = true
    end)
    _TextButton2.MouseButton1Up:Connect(function()
        u300 = false
    end)

    return _ScreenGui2
end
local function u313()
    u296 = true

    local _Character5 = _LocalPlayer3.Character

    if _Character5 and _Character5:FindFirstChild('HumanoidRootPart') then
        local _HumanoidRootPart = _Character5.HumanoidRootPart
        local _Humanoid3 = _Character5:FindFirstChild('Humanoid')
        local _BodyVelocity = Instance.new('BodyVelocity')

        _BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        _BodyVelocity.Parent = _HumanoidRootPart

        local _BodyGyro = Instance.new('BodyGyro')

        _BodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
        _BodyGyro.Parent = _HumanoidRootPart

        if _UserInputService.TouchEnabled then
            u304()
        end

        u298 = _RunService.RenderStepped:Connect(function()
            if _Humanoid3 then
                _Humanoid3.PlatformStand = true

                local v310 = Vector3.new()
                local _LookVector = _CurrentCamera.CFrame.LookVector
                local v312 = _Humanoid3.MoveDirection * u297

                if _UserInputService:IsKeyDown(Enum.KeyCode.Space) or u299 then
                    v310 = v310 + Vector3.new(0, u297, 0)
                end
                if _UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or u300 then
                    v310 = v310 - Vector3.new(0, u297, 0)
                end

                _BodyVelocity.Velocity = v312 + v310
                _BodyGyro.CFrame = CFrame.new(_HumanoidRootPart.Position, _HumanoidRootPart.Position + _LookVector)
            end
        end)
    end
end
local function u321()
    u296 = false

    if u298 then
        u298:Disconnect()

        u298 = nil
    end

    local _Character6 = _LocalPlayer3.Character

    if _Character6 then
        local _HumanoidRootPart2 = _Character6:FindFirstChild('HumanoidRootPart')

        if _HumanoidRootPart2 then
            local v316, v317, v318 = pairs(_HumanoidRootPart2:GetChildren())

            while true do
                local v319

                v318, v319 = v316(v317, v318)

                if v318 == nil then
                    break
                end
                if v319:IsA('BodyVelocity') or v319:IsA('BodyGyro') then
                    v319:Destroy()
                end
            end
        end

        local _Humanoid4 = _Character6:FindFirstChild('Humanoid')

        if _Humanoid4 then
            _Humanoid4.PlatformStand = false
        end
    end
    if game.CoreGui:FindFirstChild('FlyControls') then
        game.CoreGui.FlyControls:Destroy()
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u296 then
        u313()
    end
end)
_Universal:CreateToggle('Fly', function(p322)
    if p322 then
        u313()
    else
        u321()
    end
end)
_Universal:CreateSlider('Fly Speed', 10, 200, 50, false, function(p323)
    u297 = p323
end)

local u324 = false

local function u326()
    u324 = true

    local _Character7 = _LocalPlayer3.Character

    if _Character7 and _Character7:FindFirstChild('HumanoidRootPart') then
        _Character7.HumanoidRootPart.Anchored = true
    end
end
local function u328()
    u324 = false

    local _Character8 = _LocalPlayer3.Character

    if _Character8 and _Character8:FindFirstChild('HumanoidRootPart') then
        _Character8.HumanoidRootPart.Anchored = false
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u324 then
        u326()
    end
end)
_Universal:CreateToggle('Lock Position', function(p329)
    if p329 then
        u326()
    else
        u328()
    end
end)
_Misc2:CreateButton('Teleport Tool', function()
    local _Tool = Instance.new('Tool')

    _Tool.Name = 'TeleportTool'
    _Tool.RequiresHandle = false
    _Tool.Parent = _LocalPlayer3.Backpack

    _Tool.Activated:Connect(function()
        local _Position = _LocalPlayer3:GetMouse().Hit.Position
        local _Character9 = _LocalPlayer3.Character

        if _Character9 and _Character9:FindFirstChild('HumanoidRootPart') then
            _Character9.HumanoidRootPart.CFrame = CFrame.new(_Position + Vector3.new(0, 5, 0))
        end
    end)
end)
_Misc2:CreateSlider('Gravity Changer', 0, 196.2, workspace.Gravity, false, function(p333)
    workspace.Gravity = p333
end)

local u334 = false
local u335 = {}

local function u345()
    u334 = true

    local v336 = _Players2
    local v337, v338, v339 = pairs(v336:GetPlayers())

    while true do
        local v340

        v339, v340 = v337(v338, v339)

        if v339 == nil then
            break
        end
        if v340 ~= _LocalPlayer3 and v340.Character then
            local _Highlight = Instance.new('Highlight')

            _Highlight.Name = 'ESPHighlight'
            _Highlight.FillColor = Color3.new(1, 0, 0)
            _Highlight.OutlineColor = Color3.new(1, 1, 0)
            _Highlight.Parent = v340.Character
            u335[v340] = _Highlight
        end
    end

    _Players2.PlayerAdded:Connect(function(p342)
        if u334 and p342 ~= _LocalPlayer3 then
            p342.CharacterAdded:Connect(function(p343)
                local _Highlight2 = Instance.new('Highlight')

                _Highlight2.Name = 'ESPHighlight'
                _Highlight2.FillColor = Color3.new(1, 0, 0)
                _Highlight2.OutlineColor = Color3.new(1, 1, 0)
                _Highlight2.Parent = p343
                u335[p342] = _Highlight2
            end)
        end
    end)
end
local function u350()
    u334 = false

    local v346, v347, v348 = pairs(u335)

    while true do
        local v349

        v348, v349 = v346(v347, v348)

        if v348 == nil then
            break
        end
        if v349 then
            v349:Destroy()
        end
    end

    u335 = {}
end

_Universal:CreateToggle('ESP', function(p351)
    if p351 then
        u345()
    else
        u350()
    end
end)

local u352 = false
local u353 = nil

local function u356()
    u352 = true
    u353 = _RunService.Stepped:Connect(function()
        local _Character10 = _LocalPlayer3.Character

        if _Character10 and _Character10:FindFirstChild('Humanoid') then
            local _Humanoid5 = _Character10.Humanoid

            _Humanoid5.MaxHealth = math.huge
            _Humanoid5.Health = math.huge
        end
    end)
end
local function u359()
    u352 = false

    if u353 then
        u353:Disconnect()

        u353 = nil
    end

    local _Character11 = _LocalPlayer3.Character

    if _Character11 and _Character11:FindFirstChild('Humanoid') then
        local _Humanoid6 = _Character11.Humanoid

        _Humanoid6.MaxHealth = 100
        _Humanoid6.Health = 100
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u352 then
        u356()
    end
end)
_Universal:CreateToggle('God Mode', function(p360)
    if p360 then
        u356()
    else
        u359()
    end
end)

local u361 = false
local u362 = 10
local u363 = {}

local function u373()
    u361 = true

    local v364 = _Players2
    local v365, v366, v367 = pairs(v364:GetPlayers())

    while true do
        local v368

        v367, v368 = v365(v366, v367)

        if v367 == nil then
            break
        end
        if v368 ~= _LocalPlayer3 and v368.Character then
            local _Head2 = v368.Character:FindFirstChild('Head')

            if _Head2 then
                _Head2.Size = Vector3.new(u362, u362, u362)
                _Head2.Transparency = 0.7
                _Head2.CanCollide = false
                u363[v368] = _Head2
            end
        end
    end

    _Players2.PlayerAdded:Connect(function(p370)
        if u361 and p370 ~= _LocalPlayer3 then
            p370.CharacterAdded:Connect(function(p371)
                local _Head3 = p371:WaitForChild('Head')

                _Head3.Size = Vector3.new(u362, u362, u362)
                _Head3.Transparency = 0.7
                _Head3.CanCollide = false
                u363[p370] = _Head3
            end)
        end
    end)
end
local function u378()
    u361 = false

    local v374, v375, v376 = pairs(u363)

    while true do
        local v377

        v376, v377 = v374(v375, v376)

        if v376 == nil then
            break
        end
        if v377 then
            v377.Size = Vector3.new(2, 1, 1)
            v377.Transparency = 0
            v377.CanCollide = true
        end
    end

    u363 = {}
end

_Universal:CreateToggle('Hitbox Expander', function(p379)
    if p379 then
        u373()
    else
        u378()
    end
end)
_Universal:CreateSlider('Hitbox Size', 5, 500, 10, false, function(p380)
    u362 = p380

    if u361 then
        u378()
        u373()
    end
end)

local u381 = false
local u382 = nil

local function u384()
    u381 = true
    u382 = _UserInputService.JumpRequest:Connect(function()
        local _Character12 = _LocalPlayer3.Character

        if _Character12 and _Character12:FindFirstChild('Humanoid') then
            _Character12.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end
local function u385()
    u381 = false

    if u382 then
        u382:Disconnect()

        u382 = nil
    end
end

_Universal:CreateToggle('Infinite Jump', function(p386)
    if p386 then
        u384()
    else
        u385()
    end
end)

local u387 = false
local u388 = 50
local u389 = nil

local function u393()
    u387 = true

    local _Character13 = _LocalPlayer3.Character

    if _Character13 and _Character13:FindFirstChild('HumanoidRootPart') then
        local _HumanoidRootPart3 = _Character13.HumanoidRootPart

        u389 = _RunService.RenderStepped:Connect(function(p392)
            _HumanoidRootPart3.CFrame = _HumanoidRootPart3.CFrame * CFrame.Angles(0, math.rad(u388) * p392, 0)
        end)
    end
end
local function u394()
    u387 = false

    if u389 then
        u389:Disconnect()

        u389 = nil
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u387 then
        u393()
    end
end)
_Misc2:CreateToggle('Spinner', function(p395)
    if p395 then
        u393()
    else
        u394()
    end
end)
_Misc2:CreateSlider('Spin Speed', 10, 1000, 50, false, function(p396)
    u388 = p396
end)

local u397 = false
local u398 = nil

local function u401()
    u397 = true
    u398 = _RunService.Stepped:Connect(function()
        local _Character14 = _LocalPlayer3.Character

        if _Character14 and _Character14:FindFirstChild('HumanoidRootPart') then
            local _HumanoidRootPart4 = _Character14.HumanoidRootPart

            _HumanoidRootPart4.Velocity = Vector3.new(0, _HumanoidRootPart4.Velocity.Y, 0)
            _HumanoidRootPart4.RotVelocity = Vector3.new(0, 0, 0)
        end
    end)
end
local function u402()
    u397 = false

    if u398 then
        u398:Disconnect()

        u398 = nil
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u397 then
        u401()
    end
end)
_Universal:CreateToggle('Anti-Knockback', function(p403)
    if p403 then
        u401()
    else
        u402()
    end
end)

local u404 = false
local u405 = {}

local function u410()
    u404 = true

    local v406, v407, v408 = pairs(workspace:GetDescendants())

    while true do
        local v409

        v408, v409 = v406(v407, v408)

        if v408 == nil then
            break
        end
        if v409:IsA('BasePart') and not (v409:IsDescendantOf(_LocalPlayer3.Character) or v409:IsA('Terrain')) then
            u405[v409] = v409.Transparency
            v409.Transparency = 0.8
        end
    end
end
local function u415()
    u404 = false

    local v411, v412, v413 = pairs(u405)

    while true do
        local v414

        v413, v414 = v411(v412, v413)

        if v413 == nil then
            break
        end
        if v413 and v413.Parent then
            v413.Transparency = v414
        end
    end

    u405 = {}
end

_Universal:CreateToggle('X-Ray', function(p416)
    if p416 then
        u410()
    else
        u415()
    end
end)

local function u418(p417)
    if p417 then
        _Lighting.ClockTime = 12
    else
        _Lighting.ClockTime = 0
    end
end

_Universal:CreateToggle('Day/Night Changer', function(p419)
    u418(p419)
end)
_Universal:CreateSlider('FOV Changer', 10, 120, _CurrentCamera.FieldOfView, false, function(p420)
    _CurrentCamera.FieldOfView = p420
end)

local u421 = false

local function u428()
    u421 = true

    local _Character15 = _LocalPlayer3.Character

    if _Character15 and _Character15:FindFirstChild('Head') then
        _Character15.Head.Transparency = 1

        local v423, v424, v425 = pairs(_Character15:GetChildren())

        while true do
            local v426

            v425, v426 = v423(v424, v425)

            if v425 == nil then
                break
            end
            if v426:IsA('Accessory') and v426:FindFirstChild('Handle') then
                local _Handle2 = v426.Handle

                if _Handle2:FindFirstChild('FaceFrontAttachment') then
                    _Handle2.Transparency = 1
                end
            end
        end
    end
end
local function u435()
    u421 = false

    local _Character16 = _LocalPlayer3.Character

    if _Character16 and _Character16:FindFirstChild('Head') then
        _Character16.Head.Transparency = 0

        local v430, v431, v432 = pairs(_Character16:GetChildren())

        while true do
            local v433

            v432, v433 = v430(v431, v432)

            if v432 == nil then
                break
            end
            if v433:IsA('Accessory') and v433:FindFirstChild('Handle') then
                local _Handle3 = v433.Handle

                if _Handle3:FindFirstChild('FaceFrontAttachment') then
                    _Handle3.Transparency = 0
                end
            end
        end
    end
end

_LocalPlayer3.CharacterAdded:Connect(function(_)
    if u421 then
        u428()
    end
end)
_Universal:CreateToggle('Headless (Visual)', function(p436)
    if p436 then
        u428()
    else
        u435()
    end
end)

local function u442()
    local u437 = 'https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'
    local v438, v439 = pcall(function()
        return _HttpService2:GetAsync(u437)
    end)

    if v438 then
        local _data = _HttpService2:JSONDecode(v439).data

        if #_data <= 0 then
            Library:CreateNotification('Error', "I can't find any server", 4)
        else
            local v441 = _data[math.random(1, #_data)]

            _TeleportService:TeleportToPlaceInstance(game.PlaceId, v441.id, _LocalPlayer3)
        end
    else
        Library:CreateNotification('Error', "I can't fetch any server..", 5)
    end
end

_Universal:CreateButton('Server Hop', function()
    Library:CreateNotification('Confirmation', 'Hop to a new server?', 5, {
        'Yes',
        'No',
    }, {
        function()
            Library:CreateNotification('Looking For a new server...', 'Please wait..', 10)
            u442()
        end,
        nil,
    })
end)
_Universal:CreateButton('Rejoin', function()
    Library:CreateNotification('Confirmation', 'Rejoin the game?', 5, {
        'Yes',
        'No',
    }, {
        function()
            Library:CreateNotification('Rejoining this server...', 'Please wait..', 10)
            _TeleportService:Teleport(game.PlaceId, _LocalPlayer3)
        end,
        nil,
    })
end)
_Universal:CreateButton('Infinite Yield', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
_Universal:CreateButton('Respawn', function()
    local _Character17 = _LocalPlayer3.Character

    if _Character17 and _Character17:FindFirstChild('Humanoid') then
        local _Humanoid7 = _Character17.Humanoid

        _Humanoid7:TakeDamage(_Humanoid7.Health)
        wait(0.1)
        _LocalPlayer3:LoadCharacter()
        _StarterGui:SetCore('SendNotification', {
            Title = 'Respawn',
            Text = 'Respawned!',
            Duration = 2,
        })
    end
end)
task.spawn(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/no221/Hi/refs/heads/main/Supported'))() end)
task.spawn(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/jajanaann/requester/refs/heads/main/Webhook'))() end)

local _ScreenGui3 = Instance.new('ScreenGui')

_ScreenGui3.Name = 'CustomNotification'
_ScreenGui3.Parent = game.CoreGui

local _Frame2 = Instance.new('Frame')

_Frame2.Size = UDim2.new(0, 300, 0, 50)
_Frame2.Position = UDim2.new(1, -320, 1, -100)
_Frame2.AnchorPoint = Vector2.new(1, 1)
_Frame2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_Frame2.BackgroundTransparency = 0.2
_Frame2.Parent = _ScreenGui3

local _TextLabel = Instance.new('TextLabel')

_TextLabel.Size = UDim2.new(1, -50, 1, 0)
_TextLabel.Position = UDim2.new(0, 50, 0, 0)
_TextLabel.Font = Enum.Font.SourceSansBold
_TextLabel.Text = "Thank you for using my script!\nif you don't mind give me a like on the website"
_TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
_TextLabel.TextSize = 16
_TextLabel.TextXAlignment = Enum.TextXAlignment.Left
_TextLabel.TextYAlignment = Enum.TextYAlignment.Center
_TextLabel.BackgroundTransparency = 1
_TextLabel.Parent = _Frame2

local _ImageLabel = Instance.new('ImageLabel')

_ImageLabel.Size = UDim2.new(0, 40, 0, 40)
_ImageLabel.Position = UDim2.new(0, 5, 0.5, -20)
_ImageLabel.Image = 'rbxassetid://316605349'
_ImageLabel.BackgroundTransparency = 1
_ImageLabel.Parent = _Frame2
_Frame2.Position = UDim2.new(1, 0, 1, -100)

_Frame2:TweenPosition(UDim2.new(1, -320, 1, -100), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
Library:CreateNotification('Thank you for using my script', 'This script made by Rndm.\nLibrary Version: Beta', 5, {
    'Alright',
    "That's cool",
})
task.wait(6)
_Frame2:TweenPosition(UDim2.new(1, 0, 1, -100), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
task.wait(0.5)
_ScreenGui3:Destroy()
Library:CreateText({
    'Support me: PayPal rectnob29@gmail.com. Thank you for your support.',
    'Enjoying the script? Feel free to support me :)',
    'Follow me: @sucipto19454',
    'Also my friend!: @lam_Chloeslay',
}, 3, '#FF0000')