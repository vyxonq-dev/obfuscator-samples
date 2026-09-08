getgenv().safewhile = setmetatable({}, {
    __call = function(_, cond)
        return function(fn)
            task.spawn(function()
                while cond do
                    fn()
                    task.wait()
                    if _G.Violet_IsLoad then break end
                end
            end)
        end
    end
})

getgenv().r = function(as)
    debuglog = debuglog or {}
    table.insert(debuglog,as)
end

safewhile true do
    r("make by violet")
end

if _G.Violet_IsLoad then
    _G.Violet_IsLoad = false
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()

task.spawn(function()
    for i = 1,100 do
        local success, Payload = pcall(function()
            return loadstring(game:HttpGet("https://violethub.netlify.app/payload/".. i ..".lua"))()
        end)
        if not success then
            continue
        end
        task.wait(0.1)
    end
end)

Library:Notify{
    Title = "Violet Notification",
    Content = "[ Violet Script ] Will start in 5s",
    SubContent = "",
    Duration = 5
}


task.wait(5)

local executorName = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "Unknown"
local gameid = tostring(game.PlaceId)

local success, SupportGameList = pcall(function()
    return loadstring(game:HttpGet("https://violethub.netlify.app/setting/game-support.lua"))()
end)

local found = false

if success and type(SupportGameList) == "table" then
    local support = SupportGameList[gameid]
    if support == true then
        repeat
            task.wait()
        until _G.jgjOROGJKR42trg2SDjk_F34PFEIOPJokqg24g24g2tflkdkgjw920t5g92024yt2qgf5vg5 == true

        found = true
        loadstring(game:HttpGet("https://violethub.netlify.app/script/" .. gameid .. ".lua"))()
    elseif support == false then
        repeat
            task.wait()
        until _G.jgjOROGJKR42trg2SDjk_F34PFEIOPJokqg24g24g2tflkdkgjw920t5g92024yt2qgf5vg5 == true
        
        found = true
        loadstring(game:HttpGet("https://violethub.netlify.app/script/" .. gameid .. ".lua"))()
    else
        print("⚠️ Game not supported or not listed.")
    end
else
    warn("❌ Failed to load support list.")
end

if not found then
    warn("Game not supported: " .. tostring(gameid))
    if Library and Library.Notify then
        Library:Notify{
            Title = "Violet Notification",
            Content = "[ Violet Script ] Game not supported: " .. tostring(gameid),
            SubContent = "",
            Duration = 5
        }
    end
    task.wait(5)
end


_G.Violet_IsLoad = true