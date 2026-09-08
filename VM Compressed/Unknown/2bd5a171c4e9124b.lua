if not game:IsLoaded() then game.Loaded:Wait() end

getgenv().get_github_file = function(file)
    local user, repo = "uzu01", "uzu02"
    local file = ("https://raw.githubusercontent.com/%*/%*/refs/heads/main/%*"):format(user, repo, file)
    return loadstring(game:HttpGet(file))()
end

get_github_file("global.lua")

player.Idled:Connect(function()
    virtual_user:CaptureController()
    virtual_user:ClickButton2(Vector2.new())
end)

local list = {
    [6884266247] = "anime_ranger_x",
    [6115988515] = "anime_saga",
    [7483057113] = "anime_shadow_2",
}

local name = rawget(list, game.GameId) 
local file = ("list/%*/script.lua"):format(name):gsub(" ", "%%20")
if not name then return end

getgenv().load_file = function(name, file)
    local file = ("list/%*/func/%*"):format(name, file):gsub(" ", "%%20")
    return get_github_file(file)
end

get_github_file(file)
