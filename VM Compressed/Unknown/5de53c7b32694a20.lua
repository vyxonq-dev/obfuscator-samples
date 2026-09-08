-- // Load Rayfield (Sirius)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "NovaZHub | Tool Picker",
   LoadingTitle = "NovaZHub",
   LoadingSubtitle = "By Carlos",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false
})

-- Create Tab
local MainTab = Window:CreateTab("Tools", 4483362458) -- random icon

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to get all Tools
local function GetAllTools()
    local tools = {}
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("Tool") then
            table.insert(tools, v.Name)
        end
    end
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Tool") then
            table.insert(tools, v.Name)
        end
    end
    return tools
end

-- Function to give Tool to player
local function GiveTool(name)
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("Tool") and v.Name == name then
            v:Clone().Parent = LocalPlayer.Backpack
            return
        end
    end
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Tool") and v.Name == name then
            v:Clone().Parent = LocalPlayer.Backpack
            return
        end
    end
end

local ToolDropdown

-- Dropdown to select Tool
ToolDropdown = MainTab:CreateDropdown({
    Name = "Select Tool",
    Options = GetAllTools(),
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(Option)
        -- Just selects, doesn't give automatically
    end,
})

-- Button to get selected Tool
MainTab:CreateButton({
    Name = "🎯 Get Selected Tool",
    Callback = function()
        local selected = ToolDropdown.CurrentOption
        if selected and selected[1] then
            GiveTool(selected[1])
            Rayfield:Notify({
                Title = "NovaZHub",
                Content = "You picked the Tool: " .. selected[1],
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "NovaZHub",
                Content = "Please select a Tool first!",
                Duration = 5
            })
        end
    end,
})

-- Button to get all Tools
MainTab:CreateButton({
    Name = "📦 Get All Tools",
    Callback = function()
        local tools = GetAllTools()
        for _, tool in pairs(tools) do
            GiveTool(tool)
        end
        Rayfield:Notify({
            Title = "NovaZHub",
            Content = "You picked ALL Tools!",
            Duration = 6
        })
    end,
})

-- Button to manually refresh Tool list
MainTab:CreateButton({
    Name = "🔄 Refresh Tool List",
    Callback = function()
        ToolDropdown:Refresh(GetAllTools(), true)
    end,
})

-- 🔁 Auto Refresh system (every 20 seconds)
task.spawn(function()
    while task.wait(20) do
        if ToolDropdown then
            ToolDropdown:Refresh(GetAllTools(), true)
        end
    end
end)
