--local Console =  loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/STX"))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))()
local fcs = loadstring(game:HttpGet("https://raw.githubusercontent.com/I2345/EX-Scripts/main/AimbotFunctions.lua"))()

local UIS = game:GetService("UserInputService")

function GetClosest(DontGetTeamMembers)

    local cDist = math.huge
    local cPlayer = nil
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do

        if DontGetTeamMembers then

            if v ~= game:GetService("Players").LocalPlayer then

                if v.Team ~= game:GetService("Players").LocalPlayer.Team then

                    local client = game:GetService("Players").LocalPlayer

                    local distance = (client.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

                    if distance < cDist then
                        cDist = distance
                        cPlayer = v
                    end

                end

            end

        else

            if v ~= game:GetService("Players").LocalPlayer then

                local client = game:GetService("Players").LocalPlayer

                local distance = (client.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

                if distance < cDist then
                    cDist = distance
                    cPlayer = v
                end


            end

        end

    end

    return cPlayer

end

local scriptInfo = {
    version = "v0.1.0",
}
local developerInfo = {
    name = "Kasma",
    discordtag = "!Puppy#1625",
    discordserver = "N/A",
    website = "N/A",
}
local serverInfo = {
    website = "Offline",
    discordserver = "Offline",
}

local venyx = library.new("EX Scripts")
--[[
local ConsoleLog = Console:Window({
    Title = "[EX Scripts]",
    Position = UDim2.new(0.5, 0, 0.5, 0),
    DragSpeed = 12
})
]]--

local info = venyx:addPage("Infomation")

local scriptinfo = info:addSection("Script Info")
local developerinfo = info:addSection("Developer Info")
local serverinfo = info:addSection("Server Info")

scriptinfo:addButton("Version: "..scriptInfo.version)
developerinfo:addButton("Developer Name: "..developerInfo.name)
developerinfo:addButton("Discord Tag: "..developerInfo.discordtag)
developerinfo:addButton("Discord Server: "..developerInfo.discordserver)
developerinfo:addButton("Script Website: "..developerInfo.website)
serverinfo:addButton("Website: "..serverInfo.website)
serverinfo:addButton("Discord Server: "..serverInfo.discordserver)
--[[
function ConsoleLogged(text, ty)
    local tp = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    }
    ConsoleLog:Prompt({
        Title = text,
        TypesWeHave = {
            "default",
            "success",
            "fail",
            "warning",
            "nofitication"
        },
        Type = tp[ty]
    })
end
]]--

local env = {
    ["AIMBOT"] = false,
    ["Aim Options"] = {
        ["TargetOtherTeams"] = false,
        ["AimArea"] = "Head",
        ["AimbotButton"] = Enum.UserInputType.MouseButton2
    }
}

local aimbot = venyx:addPage("Aimbot")
local aimbot2 = aimbot:addSection("Aimbot Main")

aimbot2:addToggle("Aimbot", false, function(x)
    env["AIMBOT"] = x
end)

aimbot2:addDropdown("Aim Part", {"Head", "Torso", "Random"}, function(x)
    env["Aim Options"]["AimArea"] = x
end)

aimbot2:addToggle("Ignore Team", false, function(x)
    env["Aim Options"]["TargetOtherTeams"] = x
end)

aimbot2:addKeybind("Aimbot Button (Doesnt work use MB2)", Enum.UserInputType.MouseButton2, function() end, function(x)
    --env["Aim Options"]["AimbotButton"] = x
end)
getgenv().aimbot = false
UIS.InputBegan:Connect(function(input)
    local s,e = pcall(function()
        if input.UserInputType == env["Aim Options"]["AimbotButton"] or input.KeyCode == env["Aim Options"]["AimbotButton"] then

            if env["AIMBOT"] then
                getgenv().aimbot = true
                while wait() do
                    if not getgenv().aimbot then return end
                    local curCamera = workspace.CurrentCamera
                    --[[
                    if env["Aim Options"]["AimArea"] == "Torso" then
                        curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, fcs:GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Torso.Position)
                    elseif env["Aim Options"]["AimArea"] == "Head" then
                        curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, fcs:GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Head.Position)
                    else
                        if math.random(0,1) == 0 then
                            curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, fcs:GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Head.Position)
                        else
                            curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, fcs:GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Torso.Position)
                        end
                    end
                    ]]--
                    if env["Aim Options"]["AimArea"] == "Torso" then
                        curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Torso.Position)
                    elseif env["Aim Options"]["AimArea"] == "Head" then
                        curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Head.Position)
                    else
                        if math.random(0,1) == 0 then
                            curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Head.Position)
                        else
                            curCamera.CFrame = CFrame.new(curCamera.CFrame.Position, GetClosest(env["Aim Options"]["TargetOtherTeams"]).Character.Torso.Position)
                        end
                    end
                    if not env["AIMBOT"] then return end
                end
    
            end
    
        end
    end)
    if e then
        --ConsoleLogged(e, 3)
        print(e)
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessedEvent)
    local s,e = pcall(function()
        if input.UserInputType == env["Aim Options"]["AimbotButton"] or input.KeyCode == env["Aim Options"]["AimbotButton"] then
            getgenv().aimbot = false
        end
    end)
    if e then
        --ConsoleLogged(e, 3)
        print(e)
    end
end)
