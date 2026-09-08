local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()local Window = OrionLib:MakeWindow({Name = "FG hub [Dog! 😨]", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

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
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "Esp players",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/EL43jEFe"))();
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Esp Ben",
	Callback = function()
-- Configuration
local highlightColor = Color3.new(1, 0, 0) -- Red color
local highlightThickness = 3
local highlightName = "NPC_Highlight"
local npcFolderName = "NPCs" -- Name of the folder containing NPCs

-- Function to add a highlight to a model
local function addHighlight(model)
    if not model:FindFirstChild(highlightName) then
        local highlight = Instance.new("Highlight")
        highlight.Name = highlightName
        highlight.Parent = model
        highlight.FillColor = highlightColor
        highlight.OutlineColor = highlightColor
        highlight.OutlineTransparency = 0
        highlight.Thickness = highlightThickness
    end
end

-- Function to remove a highlight from a model
local function removeHighlight(model)
    local highlight = model:FindFirstChild(highlightName)
    if highlight then
        highlight:Destroy()
    end
end

-- Function to process an NPC
local function processNPC(npc)
    if npc:IsA("Model") then
        -- Check if the model has a Humanoid and HumanoidRootPart
        if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
            addHighlight(npc)
        else
            removeHighlight(npc)
        end
    else
        removeHighlight(npc.Parent)
    end
end

-- Function to highlight NPCs in the specified folder
local function highlightNPCsInFolder(folder)
    if folder then
        for _, npc in pairs(folder:GetChildren()) do
            processNPC(npc)
        end
    end
end

-- Get the NPCs folder
local npcFolder = game.Workspace:FindFirstChild(npcFolderName)

-- Highlight existing NPCs in the folder
highlightNPCsInFolder(npcFolder)

-- Listen for new NPCs added to the folder
if npcFolder then
    npcFolder.ChildAdded:Connect(function(child)
        processNPC(child)
    end)

    npcFolder.ChildRemoved:Connect(function(child)
        if child:IsA("Model") then
            removeHighlight(child)
        end
    end)
end

print("NPC Highlighter script initialized.")

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Esp Tools",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/F9STRkNz"))();
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]