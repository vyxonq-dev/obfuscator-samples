--[[






                                                                                                    
                             ##                                   ##                                
                             ###                                 ####                               
                             #  ##               ##             ######                              
                            ##   ##             ####          ########                              
                            ##   #*##          ######        ##########                             
                           ##    #*###        ########       ###**#####                             
                           ##    #**##       ###########     ++++++#####                            
                           ##     #***## ########**######     ++++++#####                           
                          ##     ** ***########******#####      ++***####                           
                          ##    **  ****#####*********#####     ##*++*####                          
                          ##    **   *****##************####   ##++++++****                         
                          **     **  ************* *****##### ####*+++++++                          
                           **      ** ***********   *****#####** ### +++                            
                            #**   **************     *****#####*** ##*                              
                             #** ******##*****##      *****######*****                              
                               *****####******####    ******######**    **                          
                           ####* ######******########  ******######     **#                         
                          ############***********###### ******######    ***  ##                     
                         ####***#####****** ***+++#######******#######  ***#####                    
                       #### ****####*******##++===+*######******####### ++*#***#                    
                      ####   +#####*******#####+====+######******####### +*#*+*##                   
                     ## #  #######*******####### +====+#####******#######**  *+*#                   
                     #### #######*******++++*#### ++===++###*******#######    **#                   
                      ##***+####*******   ++++*#####++====+##*******#######    **#                  
                  #####***+####*******     +++++*######-====+#*******#######    **                  
                   ###***####*+=+****       +++++++++++      =+***++=+*#######   #                  
                    **#####*+=====+*          ++++++=           *+=====+*######                     
                    #**##*+=====++             ++++=              ++=====+*#####                    
                   ####*+===+++                  ++                  +++===+*####                   
                  ###*+==++=                                            ++===++###                  
                 ##*+=++                                                    =+=+*##                 
               ##*++=                                                          +++*##               
               +++                                                                ++*#              
                                                                                                     

                                       ALCHEMY HUB SCRIPT

                      This was made by Alchemy Team ( discord.gg/alchemyhub )
                        Modification of the script, including attempting to 
                     bypass or crack the script for any reason is not allowed.

                     Copyright © 2023-2026 Alchemy Team - All Rights Reserved.







]]--

for alchemy, hub in pairs({
function(is) return is end
}) do if not hub(true) then
return end end --[[ASOE.]]

repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer

---------/// Set All Config to Global ///---------

getgenv().script_key = license or script_key or nil
getgenv().skip_loading = skip_loading or false
getgenv().auto_execute = auto_execute or false
getgenv().disable_auto_exec = disable_auto_exec or false
getgenv().delay_execute = delay_execute or 0

getgenv().whitescreen = whitescreen or false
getgenv().blackscreen = blackscreen or false
getgenv().auto_rejoin = auto_rejoin or false
getgenv().streamer_mode = streamer_mode or false
getgenv().fully_rejoin = fully_rejoin or false
getgenv().avoid_player = avoid_player or nil

getgenv().premium = premium or false
getgenv().farmer_mode = farmer_mode or false
getgenv().oneclick = oneclick or kaitan or kaitun or false

getgenv().setting = setting or nil
getgenv().force_config = force_config or nil
getgenv().specific_config = specific_config or nil

---------/// Set Necessary Function ///---------

task.wait(delay_execute or 0)

---------/// Set Necessary Function ///---------

local getService = setmetatable({}, {
    __index = function(selff: {}, serviceName: any)
        local service = cloneref(game:GetService(serviceName))
        rawset(selff, serviceName, service)
        return service
    end
})

xpcall(function()
    if force_config and typeof(force_config) == "table" then
        getgenv().force_config = getService.HttpService:JSONEncode(force_config)
    end
end, function(err: string)
    warn(string.format("</> Compile force config error %s\n", err))
end)

getgenv().setAutoExec = function(): nil
    if not(disable_auto_exec) and not(already_set_auto_exec) then
        xpcall(function()
            local future_execute: (string) -> nil = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
            if future_execute and not(farmer_mode or oneclick or kaitan or kaitun) then
                print("</> Set Auto Execute")

                local rawsetting: string = 'getgenv().json_setting=nil;'
                if setting and typeof(setting) == 'table' then
                    rawsetting = (string.format('getgenv().json_setting=[=[%s]=];', getService.HttpService:JSONEncode(setting)))
                end

                local raw_specific_config: string = 'getgenv().json_specific_config=nil;'
                if specific_config and typeof(specific_config) == 'table' then
                    raw_specific_config = (string.format('getgenv().json_specific_config=[=[%s]=];', getService.HttpService:JSONEncode(specific_config)))
                end

                local raw_avoidplayer: string = 'getgenv().json_avoid_player=nil;'
                if avoid_player and typeof(avoid_player) == 'table' then
                    if #avoid_player > 0 then
                        raw_avoidplayer = (string.format('getgenv().json_avoid_player=[=[%s]=];', getService.HttpService:JSONEncode(avoid_player)))
                    end
                end
                
                if script_key or premium or rollback then
                    future_execute(
                        string.format('%s%s%sgetgenv().cometeleport=true;script_key="%s";premium=%s;rollback=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                        raw_specific_config, rawsetting, raw_avoidplayer, tostring(script_key), tostring(premium), tostring(rollback), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading))
                    )
                else
                    future_execute(
                        string.format('%s%s%sgetgenv().cometeleport=true;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                        raw_specific_config,rawsetting, raw_avoidplayer, tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading))
                    )
                end
            end

            getgenv().already_set_auto_exec = true
        end, function(err: string)
            warn(string.format("</> Auto execute function error %s\n", err))
        end)
    end
end

pcall(function()
    if not(PreLoad) then
        if isfolder("alchemy/preload") then
            delfolder("alchemy/preload")
        end

        if isfolder("alchemy/language") then
            delfolder("alchemy/language")
        end
    end
end)

pcall(function()
    if alchemyBranch then return end
    local _, subbed = pcall(function() return game:HttpGet('https://github.com/x2neptunereal/Alchemy') end)
    local commit = subbed:find('currentOid');commit = commit and subbed:sub(commit + 13, commit + 52) or nil
    getgenv().alchemyBranch = commit and #commit == 40 and commit or 'main'
end)

getgenv().getGit = getGit or function(project: string, path: string): string
    local first: boolean = (project == "Alchemy")
    local branch: string = (first and alchemyBranch) or 'main'
    local githubUrl: string = "https://raw.githubusercontent.com/x2neptunereal/" .. project .. "/" .. branch .. "/" .. path
    local jsdelivrUrl: string = "https://cdn.jsdelivr.net/gh/x2neptunereal/" .. project .. "@" .. branch .. "/" .. path

    if first and alchemyBranch and not(alchemyBranch == "main") and not(string.find(path, ".png")) then
        local prework: boolean = false
        local file: string = string.gsub(project .. "_" .. path, "/", "_")

        if not isfolder("alchemy") then
			makefolder("alchemy")
		end

		if not isfolder("alchemy/preload") then
			makefolder("alchemy/preload")
		end

        if isfile("alchemy/preload/branch.txt") then
            if readfile("alchemy/preload/branch.txt") == alchemyBranch then
                prework = true
            else
                writefile("alchemy/preload/branch.txt", alchemyBranch)
            end
        else
            writefile("alchemy/preload/branch.txt", alchemyBranch)
        end

        if isfile("alchemy/preload/" .. file) and prework then
            return readfile("alchemy/preload/" .. file)
        else
            local git_succ, git_result = pcall(function() return game:HttpGet(githubUrl) end)
            if git_succ and git_result then
                writefile("alchemy/preload/" .. file, git_result)
                return git_result
            end

            local jsd_succ, jsd_result = pcall(function() return game:HttpGet(jsdelivrUrl) end)
            if jsd_succ and jsd_result then
                writefile("alchemy/preload/" .. file, jsd_result)
                return jsd_result
            end
        end

        return "warn('noooo way')"
    end

    local git_succ, git_result = pcall(function() return game:HttpGet(githubUrl) end)
    if git_succ and git_result then return git_result end

    local jsd_succ, jsd_result = pcall(function() return game:HttpGet(jsdelivrUrl) end)
    if jsd_succ and jsd_result then return jsd_result end
    
    return "warn('noooo way')"
end

local errorMessage = (load or loadstring)(getGit('Alchemy', 'library/debug/removed.lua'))()

---------/// Script Data ///---------

local g: number = game.GameId
type array<I,V> = {[I]: V}

local script_direct: array<number, any> = {
    [994732206] = { -- Blox Fruits
        name = "bloxfruits",
        force_autoexec = true,
        skip_autoexec = false,
	};[5750914919] = { -- Fisch
        name = "fisch",
        force_autoexec = false,
        skip_autoexec = false,
	};[10200395747] = { -- Grow a Garden 2
        name = "growagarden2",
        force_autoexec = false,
        skip_autoexec = false,
	};
}

---------/// Set Auto Execute ///---------

do
    local available: any = script_direct[g]
    if available and typeof(available) == "table" then
        if available.force_autoexec or auto_execute then
            setAutoExec()
        end
    end
end

---------/// Check Environment ///---------

if cometeleport then
    local available: any = script_direct[g]
    if not(available and typeof(available) == "table") then getgenv().cometeleport = false; return print('</> Auto Execute Skip'); end
    if available.skip_autoexec then getgenv().cometeleport = false; return print('</> Auto Execute Skip'); end

    print('</> Auto Execute Active'); task.wait(3)
end; if (oneclick or kaitan or kaitun) then task.wait(3) end

---------/// Main Function ///---------

local alchemy: array<string, any> = {
    ['.npm run game'] = function(): string
        local available: any = script_direct[g]
        if available and typeof(available) == "table" then
            print("</> Loading: " .. available.name)
            return available.name
        else
            errorMessage("Alchemy", "<b>(ERROR-404)</b>\nThis game, our product wasn't supported.\n<i>#" .. tostring(game.GameId) .. "</i>")
            return "\n"
        end
    end;
    ['.npm run farmer'] = function(): string
        errorMessage("Alchemy", "<b>(ERROR-404)</b>\nThis product wasn't activated anymore.\n<i>#farmer_mode</i>")
        return "\n"
    end;
    ['.npm run oneclick'] = function(): string
        errorMessage("Alchemy", "<b>(ERROR-404)</b>\nThis product wasn't activated anymore.\n<i>#oneclick</i>")
        return "\n"
    end;
    ['.npm run rollback'] = function(): string
        errorMessage("Alchemy", "<b>(ERROR-404)</b>\nThis product wasn't activated anymore.\n<i>#rollback</i>")
        return "\n"
    end;
    ['.npm run build'] = function(s: string): nil (load or loadstring)(s)() end;
}

---------/// Old Script Config ///---------

_G.Config = setting or _G.Config

---------/// Disable Debug File ///---------

getgenv().diableFile = true

---------/// Loading Screen ///---------

local LoadingDelay: number = 0
local LoaderWindow: () -> {} = (function()
    local fake: {} = {}

    function fake:AddLabel() end
    function fake:Close() end

    return fake
end)()

xpcall(function()
    if not(oneclick or kaitan or kaitun or rollback) and not(skip_loading) then
        local LoaderLib: {} = (load or loadstring)(getGit('Alchemy', 'ui/loader_v2.luau'))()
        LoaderWindow = LoaderLib.new();
        LoadingDelay = 1
    end
end, function(err: string)
    warn(string.format("</> Loading screen function error %s\n", err))
end)

LoaderWindow:AddLabel("Executor: " .. tostring(identifyexecutor()), "Info")

---------/// Convert Json Config to Normal Config ///---------

xpcall(function()
    if not(setting) and json_setting then
        getgenv().setting = getService.HttpService:JSONDecode(json_setting)
    end

    if not(specific_config) and json_specific_config then
        getgenv().specific_config = getService.HttpService:JSONDecode(json_specific_config)
    end

    if not(avoid_player) and json_avoid_player then
        getgenv().avoid_player = getService.HttpService:JSONDecode(json_avoid_player)
    end
end, function(err: string)
    warn(string.format("</> Convert json function error %s\n", err))
end)

if disable_auto_exec then LoaderWindow:AddLabel("Skipped set up [Auto Execute]","Error")
else LoaderWindow:AddLabel("Set up [Auto Execute]","Success"); end; task.wait(LoadingDelay)

---------/// x2Neptune's Software ///---------

task.delay(6, function()
    xpcall(function()
        (load or loadstring)(getGit('x2neptunereal', 'software/_rbx.lua'))()
    end, function(err: string)
        warn(string.format("</> Software function error %s\n", err))
    end)
end)

LoaderWindow:AddLabel("Set up [Software]","Success"); task.wait(LoadingDelay)

---------/// Security Report ///---------

task.spawn(function()
    xpcall(function()
        (load or loadstring)(getGit('Alchemy', 'library/debug/scope.lua'))()
    end, function(err: string)
        warn(string.format("</> Security report error %s\n", err))
    end)
end)

LoaderWindow:AddLabel("Set up [Security Report]","Success"); task.wait(LoadingDelay)

---------/// Avoid Players ///---------

local hopServer = function(): nil
    local req: {} = (request or http_request)({Url = string.format('https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true', game.PlaceId)})
    local body: {} = getService.HttpService:JSONDecode(req.Body)

    if body and body.data then
        for i, v in next, body.data do
            if type(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                task.wait(0.2)
                getService.TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
            end
        end
    end
end

xpcall(function()
    if avoid_player and typeof(avoid_player) == 'table' then
        task.spawn(function()
            while #avoid_player > 0 do task.wait(2)
                for i, v in pairs(getService.Players:GetPlayers()) do
                    if table.find(avoid_player, v.UserId) then
                        warn(string.format('Found User: %s (%d)\nTry to Hop Server...', tostring(v.Name), v.UserId))
                        setAutoExec();task.wait();hopServer()
                    end
                end
            end
        end)
    end
end, function(err: string)
    warn(string.format("</> Avoid players function error %s\n", err))
end)

---------/// Anti Gameplay Paused ///---------

getService.Players.LocalPlayer.Changed:Connect(function(data)
	xpcall(function()
		if data == "GameplayPaused" then
			getService.Players.LocalPlayer.GameplayPaused = false
		end
	end, function(err: string)
        warn(string.format("</> Anit gameplay paused function error %s\n", err))
    end)
end)

LoaderWindow:AddLabel("Set up [Anti Gameplay Paused]","Success"); task.wait(LoadingDelay)

---------/// Auto Rejoin ///---------

if auto_rejoin or (oneclick or kaitan or kaitun or rollback) then
    task.spawn(function()
        xpcall(function()
            getService.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child: Instance)
                if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
                    setAutoExec(); task.wait(5)
                    getService.TeleportService:Teleport(game.PlaceId, getService.Players.LocalPlayer) 
                end
            end)
        end, function(err: string)
            warn(string.format("</> Auto rejoin function error %s\n", err))
        end)
    end)
end

LoaderWindow:AddLabel("Set up [Auto Rejoin]","Success"); task.wait(LoadingDelay)

---------/// Streamer Mode ///---------

if streamer_mode then
    xpcall(function()
        local protectMessage = function(messageTarget: string, messageChange: string): nil
            local allSpace = game:GetDescendants()
        
            for i=1, #allSpace do
                if allSpace[i].ClassName == "TextLabel" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                elseif allSpace[i].ClassName == "TextButton" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                elseif allSpace[i].ClassName == "TextBox" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                end
            end
        
            game.DescendantAdded:Connect(function(descendant: Instance)
                if descendant.ClassName == "TextLabel" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                elseif descendant.ClassName == "TextButton" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                elseif descendant.ClassName == "TextBox" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                end
            end)
        end
        
        protectMessage(game.Players.LocalPlayer.Name, "[Protect By Alchemy Hub]")
        protectMessage(game.Players.LocalPlayer.DisplayName, "[Protect By Alchemy Hub]")

        LoaderWindow:AddLabel("Set up [Streamer Mode]","Success"); task.wait(LoadingDelay)
    end, function(err: string)
        warn(string.format("</> Streamer mode function error %s\n", err))
    end)
end;

---------/// WhiteScreen & BlackScreen ///---------

xpcall(function()
    if (whitescreen or farmer_mode) or blackscreen then
        local setblackscreen = function(state: boolean): nil end
        local Blackscreen: nil = nil
        local Blackscreen2: {} = {}

        if blackscreen then
            Blackscreen = Instance.new("ScreenGui")
            Blackscreen2 = Instance.new("Frame")

            Blackscreen.Name = "BLACK"
            Blackscreen.Parent = getService.CoreGui
            Blackscreen2.Name = "Blackscreen"
            Blackscreen2.Parent = Blackscreen
            Blackscreen2.Size = UDim2.new(500, 0, 500, 0)
            Blackscreen2.AnchorPoint = Vector2.new(0.5, 0.5)
            Blackscreen2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Blackscreen2.BackgroundTransparency = 0
            Blackscreen2.BackgroundColor3 = Color3.new(0, 0, 0)
            Blackscreen2.Visible = false

            setblackscreen = function(state: boolean): nil
                Blackscreen2.Visible = state
            end
        end
        getService.UserInputService.WindowFocusReleased:Connect(function()
            getService.RunService:Set3dRenderingEnabled(false)
            setblackscreen(true)
        end)

        getService.UserInputService.WindowFocused:Connect(function()
            getService.RunService:Set3dRenderingEnabled(true)
            setblackscreen(false)
        end)

        LoaderWindow:AddLabel("Set up [White/Black Screen]","Success"); task.wait(LoadingDelay)
    end
end, function(err: string)
    warn(string.format("</> WhiteScreen function error %s\n", err))
end)

---------/// Fully Rejoin ///---------

if fully_rejoin and typeof(fully_rejoin) == "number" then
    getgenv().start_fully_rejoin = tick()

    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                if tick() - start_fully_rejoin >= (fully_rejoin or 1200) then
                    setAutoExec(); task.wait(1)
                    getService.TeleportService:Teleport(game.PlaceId) 
                end
            end, function(err: string)
                warn(string.format("</> Fully rejoin function error %s\n", err))
            end)
        end
    end)

    LoaderWindow:AddLabel("Set up [Fully Rejoin]","Success"); task.wait(LoadingDelay)
end

---------/// Anit AFK ///---------

task.spawn(function()
    xpcall(function()
        for i, v in pairs((getconnections or get_signal_cons)(getService.Players.LocalPlayer.Idled))do
            if v.Disable then
                v.Disable(v)
            elseif v.Disconnect then
                v.Disconnect(v)
            end
        end
    end, function(err: string)
        warn(string.format("</> Anti afk function error %s\n", err))
    end)
end)

LoaderWindow:AddLabel("Set up [Anti AFK]","Success"); task.wait(LoadingDelay)

---------/// Auto Join Discord ///---------

if not(premium or farmer_mode or oneclick or kaitan or kaitun or rollback) then
    xpcall(function()
        local discord: () -> nil = function()
            (request or http_request)({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = getService.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {code = "alchemyhub"},
                    nonce = getService.HttpService:GenerateGUID(false)
                })
            })
        end

        if not isfile('MaDuHereARai.png') then
            discord();writefile('MaDuHereARai.png', tostring(tick()))
        end

        if (tick() - tonumber(readfile('MaDuHereARai.png')) > 21600) or (tick() - tonumber(readfile('MaDuHereARai.png')) < 0) then
            discord();writefile('MaDuHereARai.png', tostring(tick()))
        end
    end, function(err: string)
        warn(string.format("</> Auto join discord function error %s\n", err))
    end)
end

LoaderWindow:AddLabel("Loading [Gateway] successful","Success"); task.wait(LoadingDelay)
LoaderWindow:AddLabel("Starting connect Nexora","Success"); task.wait(LoadingDelay)
LoaderWindow:AddLabel("Starting connect Alchemy's API","Success"); task.wait(LoadingDelay)
LoaderWindow:AddLabel("Preparing best experience for you <3","Success"); task.delay(2.5, LoaderWindow.Close);
task.wait(LoadingDelay * 3.68);

---------/// Check if not execute 2 times ///---------

if not(getgenv().run_time) then

    ---------/// Mark as already execute ///---------

    getgenv().run_time = true

    ---------/// Continue ///---------

    local UILibrary: {} = (load or loadstring)(getGit('Alchemy', 'ui/quintus/notify.luau'))()
    local Notification: {new: () -> nil} = UILibrary:Notification();
    
    ---------/// Send Notify ///---------

    if premium or farmer_mode or (oneclick or kaitan or kaitun or rollback) then
        Notification.new({
	        Icon = "tag-sparkle-bold",
            Title = "Thank you all for the support!",
            Description = "Enjoy scripts and features.\nAlso, don't forget to write a review.",
            Duration = 10,
        })
    else
        Notification.new({
	        Icon = "discord-bold",
            Title = "Wanna join our Discord community?",
            Description = "We have a huge community, and\nour community has a news update.\nThank you all for the support!! ",
            Dialog = true,
            Buttons = {
                {
                    Title = "Sure!",
                    Callback = function()
                        if setclipboard then
                            Notification.new({
                                Icon = "discord-bold",
                                Title = "Copied completed!",
                                Description = "We have sent the server invite link\nto your clipboard.",
                                Duration = 6,
                            })
                            setclipboard("https://discord.gg/alchemyhub")
                        end
                    end,
                },
                {
                    Title = "No Thanks",
                    Callback = function() return end,
                }
            }
        })
    end

    ---------/// Miscellaneous ///---------

    if script_key then
        print(string.format("</> Key: %s\n", script_key))
    end

    if not(premium or farmer_mode or oneclick or kaitan or kaitun or rollback) then
        local og: number = tick() + 21600
        task.spawn(function()
            repeat task.wait(1) until og < tick()
            errorMessage("Alchemy", "<b>(ERROR-429)</b>\nYou have reached the product usage limit.\nYou can upgrade your plan to have unlimited usage.\n<i>#at -> \"www.buyalchemy.net\"</i>")
            task.wait(8); getService.TeleportService:Teleport(game.PlaceId, getService.Players.LocalPlayer)
        end)
    end

    ---------/// Load Scripts ///---------

    local serviceBranch = "main"
    pcall(function()
        local _, subbed = pcall(function() return game:HttpGet('https://github.com/x2neptunereal/Alchemy-Station') end)
        local commit = subbed:find('currentOid');commit = commit and subbed:sub(commit + 13, commit + 52) or nil
        serviceBranch = commit and #commit == 40 and commit or 'main'
    end)

    local loadService = function(called: string, path: string): string
        local project: string = "Alchemy-Station"
        local branch: string = serviceBranch or 'main'
        local location: string = called or "services"
        local githubUrl: string = "https://raw.githubusercontent.com/x2neptunereal/" .. project .. "/" .. branch .. "/alchemy/" .. location .. "/" .. path .. ".lua"
        local jsdelivrUrl: string = "https://cdn.jsdelivr.net/gh/x2neptunereal/" .. project .. "@" .. branch .. "/alchemy/" .. location .. "/" .. path .. ".lua"

        if serviceBranch and not(serviceBranch == "main") then
            local prework: boolean = false
            local file: string = string.gsub(path, "/", "_")

            if not isfolder("alchemy") then
                makefolder("alchemy")
            end

            if not isfolder("alchemy/collector") then
                makefolder("alchemy/collector")
            end

            if not isfolder("alchemy/collector/" .. file) then
                makefolder("alchemy/collector/" .. file)
            end

            if isfile("alchemy/collector/" .. file .. "/branch.txt") then
                if readfile("alchemy/collector/" .. file .. "/branch.txt") == serviceBranch then
                    prework = true
                else
                    writefile("alchemy/collector/" .. file .. "/branch.txt", serviceBranch)
                end
            else
                writefile("alchemy/collector/" .. file .. "/branch.txt", serviceBranch)
            end

            if isfile("alchemy/collector/" .. file .. "/DONT_EDIT_THIS.txt") and prework then
                return readfile("alchemy/collector/" .. file .. "/DONT_EDIT_THIS.txt")
            else
                local git_succ, git_result = pcall(function() return game:HttpGet(githubUrl) end)
                if git_succ and git_result then
                    writefile("alchemy/collector/" .. file .. "/DONT_EDIT_THIS.txt", git_result)
                    return git_result
                end

                local jsd_succ, jsd_result = pcall(function() return game:HttpGet(jsdelivrUrl) end)
                if jsd_succ and jsd_result then
                    writefile("alchemy/collector/" .. file .. "/DONT_EDIT_THIS.txt", jsd_result)
                    return jsd_result
                end
            end

            return "warn('noooo way')"
        end

        local git_succ, git_result = pcall(function() return game:HttpGet(githubUrl) end)
        if git_succ and git_result then return git_result end

        local jsd_succ, jsd_result = pcall(function() return game:HttpGet(jsdelivrUrl) end)
        if jsd_succ and jsd_result then return jsd_result end
        
        return "warn('noooo way')"
    end

    if farmer_mode then alchemy['.npm run build'](loadService("farmer_mode", alchemy['.npm run farmer']()))
    elseif premium then alchemy['.npm run build'](loadService("services", alchemy['.npm run game']())) 
    elseif oneclick then alchemy['.npm run build'](loadService("oneclick", alchemy['.npm run oneclick']())) 
    elseif rollback then alchemy['.npm run build'](loadService("rollback", alchemy['.npm run rollback']()))
    else getgenv().loader = alchemy['.npm run game'](); getgenv().loadService = loadService; (load or loadstring)(getGit('Alchemy', 'keysystem/nexora.lua'))(); end;
end
