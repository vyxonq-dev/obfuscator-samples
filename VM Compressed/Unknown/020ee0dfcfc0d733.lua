loadstring(game:HttpGet("https://raw.githubusercontent.com/Guilded1/keysys/refs/heads/main/linorialib.lua"))()
local Library = getgenv().Library
local HttpService = game:GetService("HttpService")

local Window = Library:CreateWindow({
    Title = "Chess Club",
    Center = true,
    AutoShow = true,
    Size = UDim2.fromOffset(550, 600),
})

local Tabs = {
    Main = Window:AddTab("Main"),
    Settings = Window:AddTab("Settings"),
}

local MainLeft = Tabs.Main:AddLeftGroupbox("Controls")
local MainRight = Tabs.Main:AddRightGroupbox("Options")
local SettingsLeft = Tabs.Settings:AddLeftGroupbox("Configuration")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local function calculatebestmove(api)
    if api == 'API' then
        local response
        local success, err = pcall(function()
            response = httprequest({
                Url = "https://chess-api.com/v1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({fen = game:GetService("ReplicatedStorage").InternalClientEvents.GetActiveTableset:Invoke():WaitForChild("FEN").Value})
            })
        end)

        if success and response.Success then
            local res = HttpService:JSONDecode(response.Body)
            return res.from, res.to
        else
            warn("API request failed:", err or response.StatusCode)
        end
    else
        local sunfish = require(game:GetService("Players").LocalPlayer.PlayerScripts.AI.Sunfish)
        return sunfish:GetBestMove(game:GetService("ReplicatedStorage").InternalClientEvents.GetActiveTableset:Invoke():WaitForChild("FEN").Value, 2000)
    end
end

MainLeft:AddButton("Play best move", function()
    task.spawn(function()
        local from, to = calculatebestmove(getgenv().Options.my_dropdown.Value)
        if from and to then
            print("best move played from", from, "to", to)
            game:GetService("ReplicatedStorage"):WaitForChild("Chess"):WaitForChild("SubmitMove"):InvokeServer(from..to)
        elseif from ~= nil and to == nil then
            print("best move played ", from)
            game:GetService("ReplicatedStorage"):WaitForChild("Chess"):WaitForChild("SubmitMove"):InvokeServer(from)
        else
            warn("Failed to calculate best move")
        end
    end)
end)

MainRight:AddDropdown("my_dropdown", {
    Text = "Select Option",
    Values = {"API", "sundown"},
    Default = "API",
    Callback = function(val)
        print("Dropdown selected:", val)
    end,
})

SettingsLeft:AddButton("Unload UI", function()
    Library:Unload()
    print("UI unloaded")
end)

SettingsLeft:AddLabel("Toggle UI"):AddKeyPicker("ui_toggle_bind", {
    Default = "RightShift",
    Mode = "Toggle",
    Text = "UI Bind",
    NoUI = false,
    Callback = function()
        local visible = Library.ScreenGui.Enabled
        Library.ScreenGui.Enabled = not visible
        print("UI toggled:", not visible)
    end,
})

getgenv().Options.my_toggle:SetValue(true)
getgenv().Options.volume_slider:SetValue(75)
