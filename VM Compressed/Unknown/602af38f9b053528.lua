

local service = setmetatable({}, {
    __index = function(self, key)
        local s = game:GetService(key)
        self[key] = s
        return s
    end
})
local function getChar()
    local player = game.Players.LocalPlayer
    return player.Character or player.CharacterAdded:Wait()
end
local function getHRP()
    return getChar():WaitForChild("HumanoidRootPart")
end


local fts = getfenv().FireTouchInterest or getfenv().firetouchinterest or firetouchinterest;
local fps = getfenv().fireproximityprompt or getfenv().FireProximityPrompt or fireproximityprompt;
local WS = service.Workspace
local T = WS:WaitForChild("TouchTestParts")
local drop_f = WS:WaitForChild('Drops')
local wantedParts = {}

local function GetWL()
    local WL = T:FindFirstChild("WantedParts") or T:WaitForChild("WantedParts")
    for _, v in (WL:GetChildren()) do 
        if v:IsA("BasePart") then
            table.insert(wantedParts, v)
        end
    end
end

coroutine.wrap(GetWL)()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()
local w = library:CreateWindow('Wanted Levels')

if fts then 
    for _, part in (wantedParts) do
        w:Button('Set Wanted To: ' .. part.Name, function()
            local myp = getHRP()
            if myp then 
                pcall(function()
                    fts(myp, part, 1)
                    task.wait(0.1)
                    fts(myp, part, 0)
                end)
            end
         end)
     end
end
-----------------

local Npc_folder = WS:WaitForChild('NPCs')

local function HeadSet1(arg,Input, ISize)
    if not arg then return end
    if arg:IsA("Model") then
        local head = arg:FindFirstChild("Head") or arg:WaitForChild("Head")
        if head and head:IsA("MeshPart") then
            head.Size = ISize
            head.Transparency = 0.5
            head.CanCollide = false
        end
    end
end

local ISize = Vector3.new(20, 20, 20)
local function SetHSIZE(Head)
    if Head.Size ~= ISize then
        HeadSet1(Head.Parent, Head, ISize)
    end
end
local w1 = library:CreateWindow("NPC's")
local _GlobalEnv = (getgenv and getgenv()) or _G
_GlobalEnv.SetHSize = true 

local box = w1:Box('HeadSize', {
   flag = "HeadSize";
   type = 'number';
}, function(new)
task.spawn(function()
while _GlobalEnv.SetHSize do
task.wait(1)
    for _, npc in pairs(Npc_folder:GetChildren()) do
         local head = npc:FindFirstChild("Head")
             if head then
               SetHSIZE(head)
             end
           end
       end
    end)
end)
local b1 = w1:Button("Stop Resizing", function()
    _GlobalEnv.SetHSize = false 
end)
local b2 = w1:Button("Resize Head(Only if you clicked Stop Resizing)", function()
    _GlobalEnv.SetHSize = true 
end)
---------------------------------

local w2 = library:CreateWindow("Local Player")
local Vest = T:WaitForChild('Vest')
local AutoVest = w2:Toggle('AutoVest', {flag = "toggle1"})
task.spawn(function()
    while true do
        task.wait(1)
        if w2.flags.toggle1 then 
            local myp = getHRP()
            if myp then
                pcall(function()
                    fts(myp, Vest, 1)
                    task.wait(0.1)
                    fts(myp, Vest, 0)
                end)
            end        
        end
    end
end)
w2:Section('Guns')
w2:Button("Grab AR", function()
    local myp = getHRP()
    if myp then   
        local wq = myp.CFrame
        for _, v in drop_f:GetChildren() do 
        if v:IsA('Model') and not v:FindFirstChild('Fake_9mmx19') then
            local h = v:FindFirstChild('Hitbox') 
            if h then
                local prox = h:FindFirstChildOfClass('ProximityPrompt')
                if prox then
                    myp.CFrame = CFrame.new(h.Position)
                    task.wait(0.1)
                    pcall(function()
                        fps(prox, 1)
                        task.wait(0.1)
                        fps(prox, 0)
                        task.wait(0.1)
                        myp.CFrame = wq
                    end)
                    break
                end
            end
        end
      end
    end
end)



--[[
/*  .--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--.  */
/* / .. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \ */
/* \ \/\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ \/ / */
/*  \/ /`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'\/ /  */
/*  / /\     ___      ___ _______   ________   ________  ___     ___    ___     / /\  */
/* / /\ \   |\  \    /  /|\  ___ \ |\   ___  \|\   ____\|\  \   |\  \  /  /|   / /\ \ */
/* \ \/ /   \ \  \  /  / | \   __/|\ \  \\ \  \ \  \___|\ \  \  \ \  \/  / /   \ \/ / */
/*  \/ /     \ \  \/  / / \ \  \_|/_\ \  \\ \  \ \_____  \ \  \  \ \    / /     \/ /  */
/*  / /\      \ \    / /   \ \  \_|\ \ \  \\ \  \|____|\  \ \  \  /     \/      / /\  */
/* / /\ \      \ \__/ /     \ \_______\ \__\\ \__\____\_\  \ \__\/  /\   \     / /\ \ */
/* \ \/ /       \|__|/       \|_______|\|__| \|__|\_________\|__/__/ /\ __\    \ \/ / */
/*  \/ /                                         \|_________|   |__|/ \|__|     \/ /  */
/*  / /\.--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--./ /\  */
/* / /\ \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \/\ \ */
/* \ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `' / */
/*  `--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'  */
--]]
while task.wait(100) do 
    warn('join our discord for updates: .gg/Gb4H6Mr4ms')
end
