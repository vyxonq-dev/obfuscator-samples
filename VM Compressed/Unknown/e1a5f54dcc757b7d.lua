
local Info = {
    ["imgui"]    = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))(),
    ["wsurl"]    = "wss://gateway.discord.gg/?v=10&encoding=json",
    ["token"]    = "",
    ["tojson"]   = function(tbl)
        return game:GetService("HttpService"):JSONEncode(tbl)
    end,
    ["tolua"]    = function(json)
        return game:GetService("HttpService"):JSONDecode(json)
    end,
     
}

local Window = Info["imgui"]:CreateWindow({
    Title = "Output",
    Size = UDim2.new(0, 620,0,420),
    Position = UDim2.new(0.5, 0, 0, 70)
})
local ConsoleTab = Window:CreateTab({
	Name = "Console"
})


local ButtonRow = ConsoleTab:Row()
ConsoleTab:Separator({Text = "Console"})
local Console = ConsoleTab:Console({
        Text        = `<font color="rgb(245, 0, 245)">[+] Successfully started console.</font>`,
	ReadOnly    = true,
	LineNumbers = true,
	Border      = false,
	Fill        = true,
	Enabled     = true,
	AutoScroll  = true,
	RichText    = true,
	MaxLines    = 20000,
})
ButtonRow:Button({Text = "Clear",Callback = Console.Clear})
ButtonRow:Button({Text = "Pause",Callback = function(self)
	local Paused = shared.Pause
	Paused = not (Paused or false)
	shared.Pause = Paused
		
	self.Text = Paused and "Paused" or "Pause"
	Console.Enabled = not Paused
end,})
ButtonRow:Fill()

Window:ShowTab(ConsoleTab) 


local Ws = nil
local Commands = {}

function Commands:getcommand(content)
    local args = content:split(" ")
    if Commands[args[1]] then 
        return Commands[args[1]]
    end
    
    return "not found"
end 

function Commands:addCommand(name,func)
    Commands[name] = func 
end 


function Commands:not1(tab: table)
    local out = "" ; for i,v in pairs(tab) do if i ~= 1 then out = out.." "..v  end ; end 
    return out
end 

function Commands:Output(message,r,g,b)
    Console:AppendText(`<font color="rgb({r},{g},{b})">{message}</font>`)
end 

local Ops = {
    [10] = function(data)
        Console:AppendText(`<font color="rgb(3, 252, 7)">[+] Connected to Discord Gateway.</font>`)

        local payload = {
            op = 2,
            d = {
                token = Info["token"],
                intents = 53608447,
                properties = {
                    os = "linux",
                    browser = "roblox",
                    device = "roblox",
                }
            }
        }
        Ws:Send(Info["tojson"](payload))
        Console:AppendText(`<font color="rgb(3, 252, 7)">[+] Payload sent.</font>`)
    end,

    [0] = function(data)
        if data.t ~= "MESSAGE_CREATE" then 
            return 
        end 

        local author    = data.d.author
        local userId    = author.id 
        local username  = author.username 
        local content   = data.d.content 
        local command   = Commands:getcommand(content)
        
        if type(command) ~= "string" then 
            command({
                author = author,
                userId = userId,
                username = username,
                content = Commands:not1(string.split(content," "))
            })
        end 
    end,
}

Window:Center()
function Commands:Websocket(info)
    if info["token"] then 
    	Info["token"] = info["token"]
    end 
    Ws = WebSocket.connect(Info["wsurl"])

    Ws.OnMessage:Connect(function(message)
        local success, data = pcall(Info["tolua"], message)
        if not success then
            warn(`Failed to parse json sigma: {message}`)
            return
        end

        if Ops[data.op] then
            Ops[data.op](data)
        end
    end)

    Ws.OnClose:Connect(function()
        Console:AppendText(`<font color="rgb(194, 120, 17)">[~] Websocket has been closed...</font>`)
        Console:AppendText(`<font color="rgb(194, 120, 17)">[~] Restarting the WebSocket connection...</font>`)
        Commands:Websocket(info)
    end)

    return Ws
end

return Commands
