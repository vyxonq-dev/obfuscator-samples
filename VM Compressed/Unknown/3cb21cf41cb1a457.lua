local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Tank Evolution Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "TankEvolv"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = ":D"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
	Name = "Get Level (Not toggle)",
	Callback = function()
      		-- Get the folder containing the polygons
local polygonsFolder = workspace.Polygons

-- Loop through each child in the polygons folder
for _, polygon in ipairs(polygonsFolder:GetChildren()) do
    -- Check if the child is a valid part or model
    if polygon:IsA("BasePart") or polygon:IsA("Model") then
        -- Prepare the arguments for the remote event
        local args = {
            [1] = polygon,
            [2] = "Part"
        }

        -- Fire the remote event with the current polygon
        game:GetService("ReplicatedStorage").Remotes.BulletDamageEvent:FireServer(unpack(args))
    end
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

-- Define a variable to track the toggle state
local toggleEnabled = false

-- Create the toggle and set its callback
Tab:AddToggle({
    Name = "Farm levels toggle.",
    Default = false,
    Callback = function(Value)
        toggleEnabled = Value
        print("Toggle is now:", Value)
        
        -- Start or stop the loop based on the toggle state
        if toggleEnabled then
            startLoop()
        end
    end    
})

-- Function to execute the main logic
local function executeMainLogic()
    -- Get the folder containing the polygons
    local polygonsFolder = workspace.Polygons

    -- Loop through each child in the polygons folder
    for _, polygon in ipairs(polygonsFolder:GetChildren()) do
        -- Check if the child is a valid part or model
        if polygon:IsA("BasePart") or polygon:IsA("Model") then
            -- Prepare the arguments for the remote event
            local args = {
                [1] = polygon,
                [2] = "Part"
            }

            -- Fire the remote event with the current polygon
            game:GetService("ReplicatedStorage").Remotes.BulletDamageEvent:FireServer(unpack(args))
        end
    end
end

-- Function to start the loop
function startLoop()
    -- Spawn a new thread to run the loop
    spawn(function()
        while toggleEnabled do
            executeMainLogic()
            wait(0)  -- Adjust the wait time as needed
        end
    end)
end