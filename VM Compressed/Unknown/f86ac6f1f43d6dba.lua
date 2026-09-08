-- Fixz Hub | Remote Scanner & Exporter 🔍
-- Made By Fixz 64

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Tables to store results
local AllRemotes = {}
local RemoteTree = {}

-- ===== Fluent UI =====
local Window = Fluent:CreateWindow({
    Title = "Remote Scanner 🔍",
    SubTitle = "Made By fixz64 on discord :p",
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 450),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Scanner = Window:AddTab({ Title = "Scanner", Icon = "search" }),
    Export = Window:AddTab({ Title = "Export", Icon = "clipboard" }),
    Live = Window:AddTab({ Title = "Live Monitor", Icon = "activity" })
}

-- ===== SCANNER FUNCTIONS =====
local function scanForRemotes(folder, path, depth)
    depth = depth or 0
    if depth > 10 then return end -- Prevent infinite loops
    
    for _, child in ipairs(folder:GetChildren()) do
        local fullPath = path .. "." .. child.Name
        
        if child:IsA("RemoteEvent") then
            table.insert(AllRemotes, {
                Name = child.Name,
                Type = "RemoteEvent",
                Path = fullPath,
                Parent = folder.Name,
                FullPath = fullPath,
                Object = child
            })
        elseif child:IsA("RemoteFunction") then
            table.insert(AllRemotes, {
                Name = child.Name,
                Type = "RemoteFunction",
                Path = fullPath,
                Parent = folder.Name,
                FullPath = fullPath,
                Object = child
            })
        elseif child:IsA("BindableEvent") then
            table.insert(AllRemotes, {
                Name = child.Name,
                Type = "BindableEvent",
                Path = fullPath,
                Parent = folder.Name,
                FullPath = fullPath,
                Object = child
            })
        elseif child:IsA("BindableFunction") then
            table.insert(AllRemotes, {
                Name = child.Name,
                Type = "BindableFunction",
                Path = fullPath,
                Parent = folder.Name,
                FullPath = fullPath,
                Object = child
            })
        end
        
        -- Scan children recursively
        if child:IsA("Folder") or child:IsA("Configuration") or child:IsA("ModuleScript") then
            scanForRemotes(child, fullPath, depth + 1)
        end
    end
end

-- ===== SCANNER TAB =====
Tabs.Scanner:AddSection("Quick Scan")

local scanStatus = Tabs.Scanner:AddParagraph({
    Title = "Status",
    Desc = "Ready to scan. Click button below to start."
})

local totalFound = Tabs.Scanner:AddParagraph({
    Title = "Results",
    Desc = "RemoteEvents: 0\nRemoteFunctions: 0\nBindables: 0\nTotal: 0"
})

Tabs.Scanner:AddButton({
    Title = "🔍 Scan Entire Game",
    Description = "Scans ReplicatedStorage, Workspace, Players, and more",
    Callback = function()
        scanStatus:SetDesc("⏳ Scanning entire game...")
        AllRemotes = {}
        
        -- Scan all major game locations
        task.spawn(function()
            scanForRemotes(ReplicatedStorage, "game:GetService('ReplicatedStorage')")
            scanForRemotes(Workspace, "game:GetService('Workspace')")
            
            pcall(function()
                scanForRemotes(game:GetService("ServerScriptService"), "game:GetService('ServerScriptService')")
            end)
            
            pcall(function()
                scanForRemotes(game:GetService("StarterPlayer"), "game:GetService('StarterPlayer')")
            end)
            
            -- Count results
            local remoteEvents = 0
            local remoteFunctions = 0
            local bindables = 0
            
            for _, remote in ipairs(AllRemotes) do
                if remote.Type == "RemoteEvent" then
                    remoteEvents = remoteEvents + 1
                elseif remote.Type == "RemoteFunction" then
                    remoteFunctions = remoteFunctions + 1
                else
                    bindables = bindables + 1
                end
            end
            
            scanStatus:SetDesc(string.format("✅ Scan Complete! Found %d total remotes", #AllRemotes))
            totalFound:SetDesc(string.format(
                "RemoteEvents: %d\nRemoteFunctions: %d\nBindables: %d\n\nTotal: %d",
                remoteEvents, remoteFunctions, bindables, #AllRemotes
            ))
            
            Fluent:Notify({
                Title = "Scan Complete!",
                Content = string.format("Found %d remotes! Check Export tab.", #AllRemotes),
                Duration = 5
            })
        end)
    end
})

Tabs.Scanner:AddButton({
    Title = "🎯 Quick Scan (ReplicatedStorage Only)",
    Description = "Faster scan of just ReplicatedStorage",
    Callback = function()
        scanStatus:SetDesc("⏳ Scanning ReplicatedStorage...")
        AllRemotes = {}
        
        scanForRemotes(ReplicatedStorage, "game:GetService('ReplicatedStorage')")
        
        local remoteEvents = 0
        local remoteFunctions = 0
        
        for _, remote in ipairs(AllRemotes) do
            if remote.Type == "RemoteEvent" then
                remoteEvents = remoteEvents + 1
            elseif remote.Type == "RemoteFunction" then
                remoteFunctions = remoteFunctions + 1
            end
        end
        
        scanStatus:SetDesc(string.format("✅ Quick Scan Complete! Found %d remotes", #AllRemotes))
        totalFound:SetDesc(string.format(
            "RemoteEvents: %d\nRemoteFunctions: %d\n\nTotal: %d",
            remoteEvents, remoteFunctions, #AllRemotes
        ))
        
        Fluent:Notify({
            Title = "Quick Scan Complete!",
            Content = string.format("Found %d remotes!", #AllRemotes),
            Duration = 3
        })
    end
})

-- ===== EXPORT TAB =====
Tabs.Export:AddSection("Export Options")

Tabs.Export:AddButton({
    Title = "📋 Copy All Remote Paths",
    Description = "Copies all found remotes to clipboard",
    Callback = function()
        if #AllRemotes == 0 then
            Fluent:Notify({
                Title = "No Remotes Found",
                Content = "Please scan first!",
                Duration = 3
            })
            return
        end
        
        local output = "========== REMOTE SCANNER RESULTS ==========\n"
        output = output .. string.format("Total Remotes Found: %d\n\n", #AllRemotes)
        
        for i, remote in ipairs(AllRemotes) do
            output = output .. string.format("[%d] %s\n", i, remote.Name)
            output = output .. string.format("    Type: %s\n", remote.Type)
            output = output .. string.format("    Path: %s\n\n", remote.FullPath)
        end
        
        output = output .. "============================================"
        
        setclipboard(output)
        
        Fluent:Notify({
            Title = "Copied!",
            Content = string.format("Copied %d remotes to clipboard!", #AllRemotes),
            Duration = 3
        })
    end
})

Tabs.Export:AddButton({
    Title = "🔥 Copy as Lua Code",
    Description = "Exports as ready-to-use Lua variables",
    Callback = function()
        if #AllRemotes == 0 then
            Fluent:Notify({
                Title = "No Remotes Found",
                Content = "Please scan first!",
                Duration = 3
            })
            return
        end
        
        local output = "-- Remote Scanner Export\n"
        output = output .. "-- Total Remotes: " .. #AllRemotes .. "\n\n"
        output = output .. "local Remotes = {\n"
        
        for i, remote in ipairs(AllRemotes) do
            local varName = remote.Name:gsub("%s+", ""):gsub("[^%w]", "")
            output = output .. string.format('    %s = %s, -- %s\n', 
                varName, remote.FullPath, remote.Type)
        end
        
        output = output .. "}\n\n"
        output = output .. "return Remotes"
        
        setclipboard(output)
        
        Fluent:Notify({
            Title = "Copied as Lua!",
            Content = "Ready to paste into your script!",
            Duration = 3
        })
    end
})

Tabs.Export:AddButton({
    Title = "📝 Print to Console (F9)",
    Description = "Prints detailed list to developer console",
    Callback = function()
        if #AllRemotes == 0 then
            Fluent:Notify({
                Title = "No Remotes Found",
                Content = "Please scan first!",
                Duration = 3
            })
            return
        end
        
        print("========== REMOTE SCANNER RESULTS ==========")
        print("Total Remotes Found:", #AllRemotes)
        print("")
        
        for i, remote in ipairs(AllRemotes) do
            print(string.format("[%d] %s (%s)", i, remote.Name, remote.Type))
            print("    Path:", remote.FullPath)
            print("    Parent:", remote.Parent)
            print("")
        end
        
        print("============================================")
        
        Fluent:Notify({
            Title = "Printed!",
            Content = "Check console (F9) for full details",
            Duration = 3
        })
    end
})

Tabs.Export:AddSection("Filter by Type")

Tabs.Export:AddButton({
    Title = "Copy RemoteEvents Only",
    Callback = function()
        local filtered = {}
        for _, remote in ipairs(AllRemotes) do
            if remote.Type == "RemoteEvent" then
                table.insert(filtered, remote.FullPath .. " -- " .. remote.Name)
            end
        end
        
        setclipboard(table.concat(filtered, "\n"))
        
        Fluent:Notify({
            Title = "Copied!",
            Content = string.format("Copied %d RemoteEvents", #filtered),
            Duration = 3
        })
    end
})

Tabs.Export:AddButton({
    Title = "Copy RemoteFunctions Only",
    Callback = function()
        local filtered = {}
        for _, remote in ipairs(AllRemotes) do
            if remote.Type == "RemoteFunction" then
                table.insert(filtered, remote.FullPath .. " -- " .. remote.Name)
            end
        end
        
        setclipboard(table.concat(filtered, "\n"))
        
        Fluent:Notify({
            Title = "Copied!",
            Content = string.format("Copied %d RemoteFunctions", #filtered),
            Duration = 3
        })
    end
})

-- ===== LIVE MONITOR TAB =====
Tabs.Live:AddSection("Live Remote Monitor")

local monitored = {}
local monitoring = false

Tabs.Live:AddParagraph({
    Title = "Instructions",
    Desc = "1. Scan for remotes first\n2. Click 'Start Monitoring'\n3. Play the game\n4. See what remotes fire in real-time"
})

local liveStatus = Tabs.Live:AddParagraph({
    Title = "Status",
    Desc = "Not monitoring. Click Start below."
})

Tabs.Live:AddButton({
    Title = "▶️ Start Monitoring",
    Callback = function()
        if monitoring then
            Fluent:Notify({
                Title = "Already Running",
                Content = "Monitor is already active!",
                Duration = 2
            })
            return
        end
        
        if #AllRemotes == 0 then
            Fluent:Notify({
                Title = "Scan First",
                Content = "Please scan for remotes first!",
                Duration = 3
            })
            return
        end
        
        monitoring = true
        monitored = {}
        liveStatus:SetDesc("🔴 MONITORING ACTIVE - Play the game!")
        
        -- Hook remotes
        for _, remote in ipairs(AllRemotes) do
            if remote.Type == "RemoteEvent" then
                pcall(function()
                    remote.Object.OnClientEvent:Connect(function(...)
                        local args = {...}
                        local argStr = {}
                        for i, arg in ipairs(args) do
                            table.insert(argStr, tostring(arg))
                        end
                        
                        local call = string.format("[%s] %s(%s)", 
                            os.date("%X"), remote.Name, table.concat(argStr, ", "))
                        
                        table.insert(monitored, call)
                        print(call)
                    end)
                end)
            end
        end
        
        Fluent:Notify({
            Title = "Monitoring Started!",
            Content = "Check console for live remote calls",
            Duration = 3
        })
    end
})

Tabs.Live:AddButton({
    Title = "📋 Copy Monitored Calls",
    Callback = function()
        if #monitored == 0 then
            Fluent:Notify({
                Title = "No Calls Yet",
                Content = "No remote calls captured yet",
                Duration = 2
            })
            return
        end
        
        setclipboard(table.concat(monitored, "\n"))
        
        Fluent:Notify({
            Title = "Copied!",
            Content = string.format("Copied %d remote calls", #monitored),
            Duration = 3
        })
    end
})

Tabs.Live:AddButton({
    Title = "🗑️ Clear Monitor",
    Callback = function()
        monitored = {}
        monitoring = false
        liveStatus:SetDesc("Cleared. Ready to start monitoring again.")
        
        Fluent:Notify({
            Title = "Cleared",
            Content = "Monitor cleared",
            Duration = 2
        })
    end
})

-- Select first tab
Window:SelectTab(1)

Fluent:Notify({
    Title = "Remote Scanner Ready!",
    Content = "Click 'Scan Entire Game' to start!",
    Duration = 5
})

print("Fixz Hub | Remote Scanner loaded!")