local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Create LibWare marker in PlayerGui (only if not already there)
if not LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LibWareUser") then
    local marker = Instance.new("BoolValue")
    marker.Name = "LibWareUser"
    marker.Value = true
    marker.Parent = LocalPlayer.PlayerGui
end

loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/DiscordInvter.lua'
    )
)()

local Games = {
    ['Eat Brainrot To Grow HUGE'] = {
        id = 130709722424357,
        file = 'Eat_Brainrot_To_Grow_HUGE',
    },
    ['Eat Slimes To Grow HUGE'] = {
        id = 15885874861,
        file = 'Eat_Slimes_To_Grow_HUGE',
    },
    ['Color Game!'] = { 
        id = 99421051519131, 
        file = 'Color_Game'
    },
    ['Snake Simulator'] = {
        id = 18199234764,
        file = 'Snake_Simulator' 
    },
    ['Block Eaters'] = { 
        id = 14237317686, 
        file = 'Block_Eaters'
    },
    ['Merge Pets!'] = { 
        id = 95389336626164,
        file = 'Merge_Pets' 
    },
    ['Merge Monsters!'] = { 
        id = 95830184338037, 
        file = 'Merge_Monsters' 
    },
    ['Merge Labubu'] = { 
        id = 128857408119456, 
        file = 'Merge_Labubu' 
    },
    ['Merge Gubby'] = { 
        id = 126849358937279, 
        file = 'Merge_Gubby' 
    },
    ['ESYG +1 Health'] = { 
        id = 140416783969775, 
        file = 'ESYG1H' 
    },
    ['Tower For Admin 2'] = { 
        id = 71426585714528, 
        file = 'Tower_For_Admin_2' 
    },
}

local id = game.PlaceId

for name, data in pairs(Games) do
    if id == data.id then
        local success, response = pcall(function()
            return game:HttpGet(
                'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/main/games/'
                    .. data.file
                    .. '.lua'
            )
        end)

        if success and response and response ~= '' then
            local func, loadErr = loadstring(response)
            if func then
                local ran, runErr = pcall(func)
                if not ran then
                    warn(
                        '[LibWare] Error running script for '
                            .. name
                            .. ': '
                            .. tostring(runErr)
                    )
                end
            else
                warn(
                    '[LibWare] Failed to compile script for '
                        .. name
                        .. ': '
                        .. tostring(loadErr)
                )
            end
        else
            warn(
                '[LibWare] Failed to fetch script for '
                    .. name
                    .. ' ('
                    .. tostring(data.file)
                    .. ')'
            )
        end
        break
    end
end
