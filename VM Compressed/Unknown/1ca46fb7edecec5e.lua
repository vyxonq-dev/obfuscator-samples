--Welcome To DevTools
--This DevTools Script Hub will allow you to get started making amazing script for games!
--This was made by GemstoneDev

game.StarterGui:SetCore("SendNotification", {
    Title = "WARNING";
    Text = "If you are using Synapse X V3. DO NOT use any remote spies as it will break the game.";
})

_G.ButtonColor = Color3.fromRGB(0, 110, 255)

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/GemstoneDev/Wally-V3-Backup/main/script/main.lua')))()

local DevToolWindow = library:CreateWindow("Dev Tools")

local DecompilerFolder = DevToolWindow:CreateFolder("Decompilers")

local RemoteSpyFolder = DevToolWindow:CreateFolder("Remote Spies")

local InfYieldFolder = DevToolWindow:CreateFolder("Inf Yield")

local GuiUtil = DevToolWindow:CreateFolder("Other")

DecompilerFolder:Button("Dark Dex",function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/fPP8bZ8Z"))()
end)

DecompilerFolder:Button("Save Game",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dev Tools";
        Text = "Don't move around while it's decompiling";
        Duration = "25";
    })
    
    saveinstance()
end)

DecompilerFolder:Button("Script Dumper",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dev Tools";
        Text = "Press F9 to see the decompiling process\nDon't move around while it's decompiling";
        Duration = "25";
    })
    
    loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/yafyz/558ff37ffe48ff2ca30fdaac0605bd31/raw/55bc3947f0e31999084e99ad9d2509300158beac/better_script_dump.lua"))()
end)

RemoteSpyFolder:Button("SimpleSpy V1",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nameless9000/Archives/main/SimpleSpy/SimpleSpyV1.lua"))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dev Tools";
        Text = "It's not reccomended to have both SimpleSpy V2 and V1 open at the same time.\nBad idea...";
        Duration = "25";
    })
end)

RemoteSpyFolder:Button("SimpleSpy V2",function()
    loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dev Tools";
        Text = "It's not reccomended to have both SimpleSpy V2 and V1 open at the same time.\nBad idea...";
        Duration = "25";
    })
end)

RemoteSpyFolder:Button("Hydroxide",function()
    local owner = "Upbolt"
    local branch = "revision"

    local function webImport(file)
        return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
    end

    webImport("init")
    webImport("ui/main")
end)

RemoteSpyFolder:Button("Mr. Spy V2",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/hYPZCW3i", true))()

end)

InfYieldFolder:Button("Infinite Yield",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

GuiUtil:Button("Funcs from GC",function()
    for i, v in pairs(getgc()) do
        if type(v) == 'function' and not is_synapse_function(v) and getinfo(v).name then
            rconsolwarn(getinfo(v).name)
        end
    end
     game.StarterGui:SetCore("SendNotification", {
        Title = "Dev Tools";
        Text = "Don't close the second window.";
        Duration = "25";
    })
end)

GuiUtil:Button("Rejoin Server",function()
   game.StarterGui:SetCore("SendNotification", {
        Title = "Dev Tools";
        Text = "Upon rejoining, you do not need to execute the script again.";
        Duration = "25";
    })
    wait(3)
    game.TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    wait(3)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GemstoneDev/Dev-Tools-UI/main/script/Dev-Tools.lua'))()
end)

GuiUtil:DestroyGui()
