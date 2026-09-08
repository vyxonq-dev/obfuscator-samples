-- =================================================================================================
--  UILIB | Final Stable Example
-- =================================================================================================

-- Step 1: Load the Library
local UILIB = loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/testing/Library/Source.lua'
    )
)()

-- Step 2: Create the Main Window
local Window = UILIB:CreateWindow({
    Title = 'Brainrot Gear Tower',
    Version = 'LibWare v6.2',
})

-- Step 3: Create Tabs
local CoinsTab = Window:CreateTab('Coins')
local TeleportTab = Window:CreateTab('Teleports')
local ShopTab = Window:CreateTab('Shop')
local DoorTab = Window:CreateTab('Doors')

local CreditsTab = Window:CreateTab('Credits')
local MiscTab = Window:CreateTab('Misc')

----------------------------------------------------
-- Coins Tab
----------------------------------------------------
CoinsTab:AddLabel('500 Coins Auto Farm(s)')
local Coins500TP = false
local Coins500Pos = CFrame.new(-175, 75, 172)
CoinsTab:AddToggle({
    Name = '+500 Coins',
    Callback = function(state)
        Coins500TP = state
        if Coins500TP then
            task.spawn(function()
                while Coins500TP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins500Pos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins500Pos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+500 Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

local Coins500TP2 = false
local Coins500Pos2 = CFrame.new(-68, 3, 365)
CoinsTab:AddToggle({
    Name = '+500 Coins 2',
    Callback = function(state)
        Coins500TP2 = state
        if Coins500TP2 then
            task.spawn(function()
                while Coins500TP2 do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins500Pos2 * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins500Pos2 * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+500 Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

local Coins500TP3 = false
local Coins500Pos3 = CFrame.new(-126, 8, -42)
CoinsTab:AddToggle({
    Name = '+500 Coins 3',
    Callback = function(state)
        Coins500TP3 = state
        if Coins500TP3 then
            task.spawn(function()
                while Coins500TP3 do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins500Pos3 * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins500Pos3 * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+500 Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

local Coins500TP4 = false
local Coins500Pos4 = CFrame.new(-6, 23, -120)
CoinsTab:AddToggle({
    Name = '+500 Coins 4',
    Callback = function(state)
        Coins500TP4 = state
        if Coins500TP4 then
            task.spawn(function()
                while Coins500TP4 do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins500Pos4 * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins500Pos4 * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+500 Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})
CoinsTab:AddLabel('1k Coins Auto Farm(s)')

local Coins1kTP = false
local Coins1KPos = CFrame.new(-240, 144, 73)
CoinsTab:AddToggle({
    Name = '+1K Coins ',
    Callback = function(state)
        Coins1kTP = state
        if Coins1kTP then
            task.spawn(function()
                while Coins1kTP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins1KPos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins1KPos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+1K Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

CoinsTab:AddLabel('1.5K Coins Auto Farm(s)')

local Coins15kTP = false
local Coins15KPos = CFrame.new(121, 67, 147)
CoinsTab:AddToggle({
    Name = '+1.5K Coins ',
    Callback = function(state)
        Coins15kTP = state
        if Coins15kTP then
            task.spawn(function()
                while Coins15kTP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins15KPos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins15KPos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+1.5K Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

CoinsTab:AddLabel('2K Coins Auto Farm(s)')

local Coins2KTP = false
local Coins2KPos = CFrame.new(-3, 200, -70)
CoinsTab:AddToggle({
    Name = '+2K Coins ',
    Callback = function(state)
        Coins2KTP = state
        if Coins2KTP then
            task.spawn(function()
                while Coins2KTP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins2KPos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins2KPos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+2K Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

CoinsTab:AddLabel('2.5K Coins Auto Farm(s)')

local Coins25kTP = false
local Coins25KPos = CFrame.new(210, 113, 165)
CoinsTab:AddToggle({
    Name = '+2.5K Coins ',
    Callback = function(state)
        Coins25kTP = state
        if Coins25kTP then
            task.spawn(function()
                while Coins25kTP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins25KPos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins25KPos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+2.5K Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

CoinsTab:AddLabel('5K Coins Auto Farm(s)')

local Coins5kTP = false
local Coins5KPos = CFrame.new(-28, 4, 170)
CoinsTab:AddToggle({
    Name = '+5K Coins ',
    Callback = function(state)
        Coins5kTP = state
        if Coins5kTP then
            task.spawn(function()
                while Coins5kTP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins5KPos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins5KPos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+5K Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

CoinsTab:AddLabel('8K Coins Auto Farm(s)')

local Coins8kTP = false
local Coins8KPos = CFrame.new(-187, 461, 115)
CoinsTab:AddToggle({
    Name = '+8K Coins ',
    Callback = function(state)
        Coins8kTP = state
        if Coins8kTP then
            task.spawn(function()
                while Coins8kTP do
                    local hrp = game:GetService('Players').LocalPlayer.Character
                        and game:GetService('Players').LocalPlayer.Character
                            :FindFirstChild('HumanoidRootPart')
                    if hrp then
                        hrp.CFrame = Coins8KPos * CFrame.new(0, 0, 1)
                        task.wait(0.1)
                        hrp.CFrame = Coins8KPos * CFrame.new(0, 0, -1)
                        task.wait(0.1)
                    end
                end
            end)
        end
        UILIB:Notify({
            Title = '+8K Coins',
            Text = 'Toggled ' .. (state and 'ON' or 'OFF'),
        })
    end,
})

----------------------------------------------------
-- Teleports Tab
----------------------------------------------------

TeleportTab:AddButton({
    Name = 'Finish Obby',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
            -185.50950622558594,
            460.9123229980469,
            121.86112213134766
        )
    end,
})

----------------------------------------------------
-- Shop Tab
----------------------------------------------------

ShopTab:AddButton({
    Name = 'Trap (1K Coins)',
    Callback = function()
        local args = {
            [1] = 0,
        }

        game:GetService('ReplicatedStorage')
            :WaitForChild('BuyTrap', 9e9)
            :FireServer(unpack(args))
    end,
})

ShopTab:AddButton({
    Name = 'Laser Gun(15K Coins)',
    Callback = function()
        local args = {
            [1] = 0,
        }

        game:GetService('ReplicatedStorage')
            :WaitForChild('BuyLaser', 9e9)
            :FireServer(unpack(args))
    end,
})

ShopTab:AddButton({
    Name = 'Rainbow Carpet (15K Coins)',
    Callback = function()
        local args = {
            [1] = 0,
        }

        game:GetService('ReplicatedStorage')
            :WaitForChild('BuyRainbowCarpet', 9e9)
            :FireServer(unpack(args))
    end,
})

ShopTab:AddButton({
    Name = 'Swap (15K Coins)',
    Callback = function()
        local args = {
            [1] = 0,
        }

        game:GetService('ReplicatedStorage')
            :WaitForChild('BuySwap', 9e9)
            :FireServer(unpack(args))
    end,
})

ShopTab:AddButton({
    Name = 'Admin (35K Coins)',
    Callback = function()
        local args = {
            [1] = 0,
        }

        game:GetService('ReplicatedStorage')
            :WaitForChild('BuyAdmin', 9e9)
            :FireServer(unpack(args))
    end,
})

----------------------------------------------------
-- doors Tab
----------------------------------------------------
DoorTab:AddLabel('Deletes the 1st floor doors')
DoorTab:AddParagraph('The doors for the x50 slap, Gauntlet, Group Only')
DoorTab:AddButton({
    Name = 'Delete 1st floor doors',
    Callback = function()
        local itemsToDelete = {
            'DoorPart', -- will delete any descendant named "DoorPart"
            'DoorPart2',
            'PartRemove3',
            -- same for DoorPart2
            -- workspace.SomeModel.SomePart, -- you can also add direct Instance references
        }

        local function destroyInstance(inst)
            if not inst then
                return 0
            end
            local ok, _ = pcall(function()
                inst:Destroy()
            end)
            return ok and 1 or 0
        end

        local totalDestroyed = 0
        for _, item in ipairs(itemsToDelete) do
            if type(item) == 'string' then
                local destroyedForName = 0
                for _, desc in ipairs(workspace:GetDescendants()) do
                    if desc.Name == item then
                        destroyedForName = destroyedForName
                            + destroyInstance(desc)
                    end
                end
                if destroyedForName == 0 then
                    warn(
                        "No instances named '"
                            .. item
                            .. "' found in workspace."
                    )
                else
                    print(
                        'Destroyed '
                            .. destroyedForName
                            .. " instance(s) named '"
                            .. item
                            .. "'."
                    )
                end
                totalDestroyed = totalDestroyed + destroyedForName
            else -- likely an Instance (userdata)
                if item then
                    totalDestroyed = totalDestroyed + destroyInstance(item)
                else
                    warn('Found nil entry in delete list.')
                end
            end
        end

        print('Total destroyed:', totalDestroyed)
    end,
})

----------------------------------------------------
-- Credits Tab
----------------------------------------------------
CreditsTab:AddLabel('Scripters')
CreditsTab:AddParagraph('The scripts in this ui are made by UILib/Doze')

CreditsTab:AddLabel('UI')
CreditsTab:AddParagraph('This UI was made by UILib')

----------------------------------------------------
-- Misc Tab
----------------------------------------------------

MiscTab:AddLabel('UI Settings')

MiscTab:AddKeybind({
    Name = 'Toggle UI',
    Key = Enum.KeyCode.LeftControl,
    Callback = function()
        UILIB:Toggle()
    end,
})

MiscTab:AddLabel('Discord')

-- Executor detection
local requestFunc = syn and syn.request
    or http_request
    or fluxus and fluxus.request
    or Krnl and Krnl.request
    or zenith and zenith.request

if not requestFunc then
    warn('No supported executor detected! This script may not work.')
end

-- Discord invite code
local INVITE_CODE = 'QYRBbM4gHp' -- Replace with any invite

MiscTab:AddButton({
    Name = 'Join Discord',
    Callback = function()
        if not requestFunc then
            warn('No supported executor found!')
            return
        end
        requestFunc({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                ['Origin'] = 'https://discord.com',
            },
            Body = game:GetService('HttpService'):JSONEncode({
                cmd = 'INVITE_BROWSER',
                args = { code = INVITE_CODE },
                nonce = game:GetService('HttpService'):GenerateGUID(false),
            }),
        })
    end,
})

-- Initial welcome notification
task.wait(1)
UILIB:Notify({
    Title = 'UILIB Loaded',
    Text = 'Version 6.2 is ready.',
    Duration = 5,
})

loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/Developer%20Detection%20System.lua'
    )
)()

loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/DevTag.lua'
    )
)()
