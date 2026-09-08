local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
    Title = "Mada hub",
    SubTitle = "by z4trox",
    SaveFolder = "UniversalScriptConfig"
})
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://77855434347030",
        BackgroundTransparency = 0
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})
local customSpeed = 16
local customJump = 50
local customGravity = 196.2
local speedEnabled = false
local jumpEnabled = false
local gravityEnabled = false
local infiniteJumpEnabled = false
local jumpConnection
local MainCheatsTab = Window:MakeTab({"Universal Exploits", "bug"})
MainCheatsTab:AddSection({"Speed Hacks"})
local Toggle1 = MainCheatsTab:AddToggle({
    Name = "Enable Speed Hack",
    Description = "Use this to toggle your <font color='rgb(0, 0, 225)'>speed</font>",
    Default = false
})
Toggle1:Callback(function(Value)
    speedEnabled = Value
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = Value and customSpeed or 16
    else
        warn("Humanoid not found.")
    end
end)
MainCheatsTab:AddTextBox({
    Name = "Speed Modifier TextBox",
    Description = "Use this to change your <font color='rgb(0, 0, 225)'>speed</font>",
    PlaceholderText = "Enter speed value",
    Callback = function(Value)
        local speedValue = tonumber(Value)
        if not speedValue then
            warn("Invalid input. Please enter a valid number for speed.")
            return
        end
        customSpeed = speedValue
        if speedEnabled then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = customSpeed
            end
        end
    end
})
MainCheatsTab:AddSection({"JumpPower Hacks"})
local JumpToggle = MainCheatsTab:AddToggle({
    Name = "Enable JumpPower Hack",
    Description = "Use this to toggle your <font color='rgb(0, 255, 255)'>JumpPower</font>",
    Default = false
})
JumpToggle:Callback(function(Value)
    jumpEnabled = Value
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = Value and customJump or 50
    else
        warn("Humanoid not found.")
    end
end)
MainCheatsTab:AddTextBox({
    Name = "JumpPower Modifier TextBox",
    Description = "Use this to change your <font color='rgb(0, 255, 255)'>JumpPower</font>",
    PlaceholderText = "Enter jump power value",
    Callback = function(Value)
        local jumpValue = tonumber(Value)
        if not jumpValue then
            warn("Invalid input. Please enter a valid number for JumpPower.")
            return
        end
        customJump = jumpValue
        if jumpEnabled then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = customJump
            end
        end
    end
})
MainCheatsTab:AddSection({"Gravity Modification"})
local GravityToggle = MainCheatsTab:AddToggle({
    Name = "Enable Gravity Modification",
    Description = "Use this to toggle your <font color='rgb(128, 128, 128)'>Gravity</font>",
    Default = false
})
GravityToggle:Callback(function(Value)
    gravityEnabled = Value
    game.Workspace.Gravity = Value and customGravity or 196.2
end)
MainCheatsTab:AddTextBox({
    Name = "Gravity Modifier TextBox",
    Description = "Use this to change your <font color='rgb(128, 128, 128)'>Gravity</font>",
    PlaceholderText = "Enter gravity value",
    Callback = function(Value)
        local gravValue = tonumber(Value)
        if not gravValue then
            warn("Invalid input. Please enter a valid number for Gravity.")
            return
        end
        customGravity = gravValue
        if gravityEnabled then
            game.Workspace.Gravity = customGravity
        end
    end
})
MainCheatsTab:AddSection({"Infinite Jump"})
local InfiniteJumpToggle = MainCheatsTab:AddToggle({
    Name = "Enable Infinite Jump",
    Description = "Use this to toggle <font color='rgb(255, 0, 0)'>Infinite Jump</font>",
    Default = false
})
InfiniteJumpToggle:Callback(function(Value)
    infiniteJumpEnabled = Value
    if Value then
        if not jumpConnection then
            jumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if infiniteJumpEnabled then
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState("Jumping")
                    end
                end
            end)
        end
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end
end)
local UniversalScriptsTab = Window:MakeTab({"Universal Scripts", "code"})
UniversalScriptsTab:AddButton({
    Name = "<font color='rgb(255, 0, 0)'>Infinite Yield</font>",
    Description = "Loads Infinite Yield.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})
UniversalScriptsTab:AddButton({
    Name = "<font color='rgb(128, 128, 128)'>Dex Explorer</font>",
    Description = "Loads Dex Explorer.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
    end
})
local MadaScriptTab = Window:MakeTab({"Mada Script", "home"})
MadaScriptTab:AddSection({"Mada Script Scripts"})
MadaScriptTab:AddButton({
    Name = "⚡ KOLINSKI admin FE",
    Description = "Loads KOLINSKI admin FE script.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/KOLINSKI/refs/heads/main/KOLINSKI.lua", true))()
    end
})
MadaScriptTab:AddButton({
    Name = "💀 z4trox Hub v1",
    Description = "Loads z4trox Hub v1 script.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/z4trox-hub-v1/main/z4trox%20hub", true))()
    end
})
MadaScriptTab:AddButton({
    Name = "👑 Mada Admin",
    Description = "Loads Mada Admin script.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/Mada-admin/refs/heads/main/Mada%20admin2.txt", true))()
    end
})
MadaScriptTab:AddButton({
    Name = "🖥️ CMD FE",
    Description = "Loads CMD FE script.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua", true))()
    end
})
MadaScriptTab:AddButton({
    Name = "🎵 Nameless music",
    Description = "Loads Nameless music script.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/Nameless-music-lunch/refs/heads/main/Main", true))()
    end
})
MadaScriptTab:AddButton({
    Name = "🔧 Honoka Executor",
    Description = "Loads Honoka Executor script.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/honoka-executor/main/Honoka%20executor%20byz4trox", true))()
    end
})
local MusicTab = Window:MakeTab({"Music", "music"})
local sound = Instance.new("Sound", game.Workspace)
MusicTab:AddTextBox({
    Name = "Music ID TextBox",
    Description = "Enter a music ID to play",
    PlaceholderText = "Music ID",
    Callback = function(Value)
        if Value and Value ~= "" then
            sound.SoundId = "rbxassetid://" .. Value
            sound:Play()
        else
            warn("Invalid Music ID")
        end
    end
})
MusicTab:AddButton({
    Name = "Music: 107764433772204",
    Description = "Plays music ID 107764433772204",
    Callback = function()
        sound.SoundId = "rbxassetid://107764433772204"
        sound:Play()
    end
})
MusicTab:AddButton({
    Name = "Music: 16662830706",
    Description = "Plays music ID 16662830706",
    Callback = function()
        sound.SoundId = "rbxassetid://16662830706"
        sound:Play()
    end
})
MusicTab:AddButton({
    Name = "Music: 1836142077",
    Description = "Plays music ID 1836142077",
    Callback = function()
        sound.SoundId = "rbxassetid://1836142077"
        sound:Play()
    end
})
MusicTab:AddButton({
    Name = "Music: 112723885774179",
    Description = "Plays music ID 112723885774179",
    Callback = function()
        sound.SoundId = "rbxassetid://112723885774179"
        sound:Play()
    end
})
MusicTab:AddButton({
    Name = "Music: 81902909302285",
    Description = "Plays music ID 81902909302285",
    Callback = function()
        sound.SoundId = "rbxassetid://81902909302285"
        sound:Play()
    end
})