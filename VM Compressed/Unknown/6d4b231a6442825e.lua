local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()

local window = library:Window("FISCH AUTO FARM")

window:Button("Enable Auto Farm", function()
 local Players = game:GetService('Players')
local CoreGui = game:GetService('StarterGui')
local GuiService = game:GetService('GuiService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ContextActionService = game:GetService('ContextActionService')
local VirtualInputManager = game:GetService('VirtualInputManager')
local UserInputService = game:GetService('UserInputService')

local LocalPlayer = Players.LocalPlayer

local Enabled = false
local Rod = false
local Casted = false
local Progress = false
local Finished = false

local LoopPosition

local Keybind = Enum.KeyCode.X

function ShowNotification(String)
    CoreGui:SetCore('SendNotification', {
        Title = 'Auto Farm',
        Text = String,
        Duration = 1
    })
end

function ToggleFarm(Name, State, Input)
    if State == Enum.UserInputState.Begin then
        Enabled = not Enabled
    
        if Enabled then
            LoopPosition = LocalPlayer.Character.HumanoidRootPart.Position
        else
            Finished = false
            Progress = false
            GuiService.SelectedObject = nil
        
            if Rod then
                Rod.events.reset:FireServer()
            end
        end
    
        ShowNotification(`Status: {Enabled}`)
    end
end

LocalPlayer.Character.ChildAdded:Connect(function(Child)
    if Child:IsA('Tool') and Child.Name:lower():find('rod') then
        Rod = Child
    end
end)

LocalPlayer.Character.ChildRemoved:Connect(function(Child)
    if Child == Rod then
        Enabled = false
        Finished = false
        Progress = false
        Rod = nil
        GuiService.SelectedObject = nil
    end
end)

LocalPlayer.PlayerGui.DescendantAdded:Connect(function(Descendant)
    if Enabled then
        if Descendant.Name == 'button' and Descendant.Parent.Name == 'safezone' then
            task.wait(0.3)
            GuiService.SelectedObject = Descendant
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            task.wait(0.1)
            GuiService.SelectedObject = nil
        elseif Descendant.Name == 'playerbar' and Descendant.Parent.Name == 'bar' then
            Finished = true
            Descendant:GetPropertyChangedSignal('Position'):Wait()
            ReplicatedStorage.events.reelfinished:FireServer(100, true)
        end
    end
end)

LocalPlayer.PlayerGui.DescendantRemoving:Connect(function(Descendant)
    if Descendant.Name == 'reel' then
        Finished = false
        Progress = false
    end
end)

task.spawn(function()
    while true do
        if Enabled and not Progress then
            if Rod then
                Progress = true
                task.wait(0.5)
                Rod.events.reset:FireServer()
                Rod.events.cast:FireServer(100.5)
            end
        end
 
        task.wait()
    end
end)

task.spawn(function()
    while true do
        if Enabled then
            LocalPlayer.Character.HumanoidRootPart.Position = LoopPosition
        end

        task.wait(0.75)
    end
end)

local NewRod = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')

if NewRod and NewRod.Name:lower():find('rod') then
    Rod = NewRod
end

if not UserInputService.KeyboardEnabled then
    ContextActionService:BindAction('ToggleFarm', ToggleFarm, false, Keybind, Enum.UserInputType.Touch)
    ContextActionService:SetTitle('ToggleFarm', 'Toggle Farm')
    ContextActionService:SetPosition('ToggleFarm', UDim2.new(0.9, -50, 0.9, -150))
    ShowNotification('Press the onscreen button to enable/disable')
else
    ContextActionService:BindAction('ToggleFarm', ToggleFarm, false, Keybind)
    ShowNotification(`Press '{Keybind.Name}' to enable/disable`)
end
end)


window:Label("X - ON/OFF", Color3.fromRGB(127, 143, 166))
window:Label("Hold Rod to Auto Farm", Color3.fromRGB(127, 143, 166))



window:Label("RBLXSCRIPTS.NET", Color3.fromRGB(327, 343, 366))
