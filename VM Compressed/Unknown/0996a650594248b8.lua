local destroyed = false
local httpservice = game:GetService("HttpService")
local tpservice = game:GetService("TeleportService")
local joinfuncs = {}
local serverhopguiqueue = false
local serverstorage
-- im sorry infinite yield that i had to copy from you twice!!
request = request or syn.request or http.request or fluxus.request
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if getgenv ~= nil and getgenv().serverhopgui then
    getgenv().serverhopgui:Destroy()
end
local supportsfiles = false
pcall(function()
    writefile("hijdfgshjkfdbwsafgbvrdhewbfhdewsa.txt","testing")
    wait(1)
    if readfile("hijdfgshjkfdbwsafgbvrdhewbfhdewsa.txt") == "testing" then
        supportsfiles = true
    end
end)
local prevserver = 69
if supportsfiles then
    local success = pcall(function()
        prevserver = readfile("previousserverss.txt")
    end)
    if not success then
        pcall(function()
            writefile("previousserverss.txt","0")
        end)
    end
end
local currserver = game.JobId
game.Players.PlayerRemoving:Connect(function(plr)
    if plr == game.Players.LocalPlayer then
        writefile("previousserverss.txt",tostring(currserver))
    end
end)
local serverhopgui = Instance.new("ScreenGui")
getgenv().serverhopgui = serverhopgui
serverhopgui.Parent = game.CoreGui
local a = serverhopgui.Destroying:Connect(function()
    destroyed = true
end)
local drag = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Drag-UI-SUPPORTS-MOBILE-22790"))()
local mainmainframe = Instance.new("Frame")
mainmainframe.Parent = serverhopgui
mainmainframe.Size = UDim2.new(.15,0,.6,0)
mainmainframe.Position = UDim2.new(.43,0,.175,0)
mainmainframe.BackgroundColor3 = Color3.fromRGB(60,60,60)
mainmainframe.BorderColor3 = Color3.fromRGB(255,255,255)
drag(mainmainframe)
local mainframe = Instance.new("ScrollingFrame")
mainframe.Parent = mainmainframe
mainframe.Size = UDim2.new(1,0,.8,0)
mainframe.Position = UDim2.new(0,0,.2,0)
mainframe.CanvasSize = UDim2.new(0,0,0,10000)
mainframe.BackgroundColor3 = Color3.fromRGB(60,60,60)
mainframe.BorderColor3 = Color3.fromRGB(255,255,255)
mainframe.ScrollBarImageTransparency = 0
local credits = Instance.new("TextLabel")
credits.Parent = mainmainframe
credits.Size = UDim2.new(1,0,.1,0)
credits.BackgroundColor3 = Color3.fromRGB(60,60,60)
credits.BorderColor3 = Color3.fromRGB(255,255,255)
credits.TextColor3 = Color3.fromRGB(255,255,255)
credits.TextScaled = true
credits.Text = [[Server Hopper
the maximum servers it can get is 100]]
local credits2 = Instance.new("TextLabel")
credits2.Parent = mainmainframe
credits2.Size = UDim2.new(.33333,0,.1,0)
credits2.Position = UDim2.new(0,0,.1,0)
credits2.BackgroundColor3 = Color3.fromRGB(60,60,60)
credits2.BorderColor3 = Color3.fromRGB(255,255,255)
credits2.TextColor3 = Color3.fromRGB(255,255,255)
credits2.TextScaled = true
credits2.Text = "Made By 2AreYou Mental110"
local credits3 = Instance.new("TextLabel")
credits3.Parent = mainmainframe
credits3.Size = UDim2.new(.33333,0,.1,0)
credits3.Position = UDim2.new(.66666,0,.1,0)
credits3.BackgroundColor3 = Color3.fromRGB(60,60,60)
credits3.BorderColor3 = Color3.fromRGB(255,255,255)
credits3.TextColor3 = Color3.fromRGB(255,255,255)
credits3.TextScaled = true
credits3.Text = "Some parts from infinite yield"
local switchbutton = Instance.new("TextButton")
switchbutton.Parent = mainmainframe
switchbutton.Size = UDim2.new(.33333,0,.1,0)
switchbutton.Position = UDim2.new(.33333,0,.1,0)
switchbutton.TextColor3 = Color3.fromRGB(255,255,255)
switchbutton.TextScaled = true
switchbutton.BackgroundColor3 = Color3.fromRGB(0,150,0)
switchbutton.BorderColor3 = Color3.fromRGB(255,255,255)
switchbutton.Text = "Switch Descending / Ascending"
local asc = false
table.insert(joinfuncs,switchbutton.MouseButton1Click:Connect(function()
    asc = not asc
    if asc then
        switchbutton.BackgroundColor3 = Color3.fromRGB(150,0,0)
    else
        switchbutton.BackgroundColor3 = Color3.fromRGB(0,150,0)
    end
    updatestorage()
end))
local sort = Instance.new("UIListLayout")
sort.Parent = mainframe
function createserver(serverid,playing,max)
    local serverframe = Instance.new("Frame")
    serverframe.Parent = mainframe
    serverframe.Size = UDim2.new(.95,0,0,50)
    serverframe.BackgroundColor3 = Color3.fromRGB(60,60,60)
    serverframe.BorderColor3 = Color3.fromRGB(255,255,255)
    local joinbutton = Instance.new("TextButton")
    joinbutton.Parent = serverframe
    joinbutton.Size = UDim2.new(.5,0,.5,0)
    joinbutton.Position = UDim2.new(.5,0,0,0)
    joinbutton.TextColor3 = Color3.fromRGB(255,255,255)
    joinbutton.TextScaled = true
    joinbutton.BackgroundColor3 = Color3.fromRGB(0,255,0)
    joinbutton.BorderColor3 = Color3.fromRGB(255,255,255)
    joinbutton.Text = "Join Server"
    table.insert(joinfuncs,joinbutton.MouseButton1Click:Connect(function()
        pcall(function()
            if serverhopguiqueue == false then
                serverhopguiqueue = true
                queueteleport(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Server-Hopper-21123"))
            end
        end)
        tpservice:TeleportToPlaceInstance(game.PlaceId,serverid,game.Players.LocalPlayer)
    end))
    local playingtext = Instance.new("TextLabel")
    playingtext.Parent = serverframe
    playingtext.Size = UDim2.new(.5,0,.5,0)
    playingtext.BackgroundColor3 = Color3.fromRGB(60,60,60)
    playingtext.BorderColor3 = Color3.fromRGB(255,255,255)
    playingtext.TextColor3 = Color3.fromRGB(255,255,255)
    playingtext.TextScaled = true
    playingtext.Text = "Playing: "..tostring(playing)..max
    if max and string.find(max,"previous server") then
        playingtext.BackgroundColor3 = Color3.fromRGB(160,160,0)
    elseif max and string.find(max,"your server") then
        playingtext.BackgroundColor3 = Color3.fromRGB(0,0,60)
    elseif max and string.find(max,"max") then
        playingtext.BackgroundColor3 = Color3.fromRGB(60,0,0)
    end
    local idtext = Instance.new("TextLabel")
    idtext.Parent = serverframe
    idtext.Size = UDim2.new(1,0,.5,0)
    idtext.Position = UDim2.new(0,0,.5,0)
    idtext.BackgroundColor3 = Color3.fromRGB(60,60,60)
    idtext.BorderColor3 = Color3.fromRGB(255,255,255)
    idtext.TextColor3 = Color3.fromRGB(255,255,255)
    idtext.TextScaled = true
    idtext.Text = tostring(serverid)
    mainframe.CanvasSize = UDim2.new(0,0,0,(#mainframe:GetChildren()-1)*50)
end
function updatestorage()
    updating = true
    credits2.Text = "Updating..."
    local ascendingtxt = "Asc"
    if not asc then
        ascendingtxt = "Desc"
    end
    local url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder="..ascendingtxt.."&limit=100"
    serverstorage = httpservice:JSONDecode(request({Url = url}).Body).data
    for i,v in pairs(mainframe:GetChildren()) do
        if v:IsA("Frame") then
            v:Destroy()
        end
    end
    local rl = false
    if not serverstorage then
        rl = true
        credits2.Text = "Rate Limited (you switched too much/rejoined too much)"
		serverstorage = httpservice:JSONDecode(game:HttpGet(url)).data
    end
    if serverstorage then
        for i,v in pairs(serverstorage) do
            if type(v) == "table" and v.id and v.maxPlayers and v.playing then
                if tonumber(v.playing) >= tonumber(v.maxPlayers) then
                    if v.id == currserver then
                        createserver(v.id,v.playing," (max + your server)")
                    elseif supportsfiles and tostring(v.id) == tostring(readfile("previousserverss.txt")) then
                        createserver(v.id,v.playing," (max + previous server)")
                    else
                        createserver(v.id,v.playing," (max)")
                    end
                elseif tonumber(v.playing) < tonumber(v.maxPlayers) then
                    if v.id == currserver then
                        createserver(v.id,v.playing," (your server)")
                    elseif supportsfiles and tostring(v.id) == tostring(readfile("previousserverss.txt")) then
                        createserver(v.id,v.playing," (previous server)")
                    else
                        createserver(v.id,v.playing,"")
                    end
                end
            end
        end
    end
    wait(3)
    updating = false
    if not rl then
        credits2.Text = "Made By 2AreYou Mental110"
    end
end
coroutine.wrap(function()
    while destroyed == false do
        updatestorage()
        for i=1,70 do
            wait(1) -- we have to wait a minute because if it does it too much then roblox will rate limit you.
            if destroyed then
                break
            elseif updating then
                repeat wait() until not updating
                for i=1,70 do
                    wait(1)
                end
            end
        end
    end
    a:Disconnect()
    for i,v in pairs(joinfuncs) do
        v:Disconnect()
    end
end)()