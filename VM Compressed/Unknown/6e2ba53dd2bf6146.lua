local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Wait = task.wait

function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

local function Chat(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/its-starflow/Scripts/main/Utility/Webhook.lua"))()
end)

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Random Genesis Hub",
    LoadingTitle = "Random Genesis Hub",
    LoadingSubtitle = "By StarFlow",
    Theme = {
    TextColor = Color3.fromRGB(255, 255, 255),

    Background = Color3.fromRGB(0, 0, 0),
    Topbar = Color3.fromRGB(15, 15, 15),
    Shadow = Color3.fromRGB(10, 10, 10),

    NotificationBackground = Color3.fromRGB(10, 10, 10),
    NotificationActionsBackground = Color3.fromRGB(200, 200, 200),

    TabBackground = Color3.fromRGB(40, 40, 40),
    TabStroke = Color3.fromRGB(60, 60, 60),
    TabBackgroundSelected = Color3.fromRGB(255, 255, 255),
    TabTextColor = Color3.fromRGB(255, 255, 255),
    SelectedTabTextColor = Color3.fromRGB(0, 0, 0),

    ElementBackground = Color3.fromRGB(20, 20, 20),
    ElementBackgroundHover = Color3.fromRGB(30, 30, 30),
    SecondaryElementBackground = Color3.fromRGB(10, 10, 10),
    ElementStroke = Color3.fromRGB(80, 80, 80),
    SecondaryElementStroke = Color3.fromRGB(60, 60, 60),
            
    SliderBackground = Color3.fromRGB(80, 80, 80),
    SliderProgress = Color3.fromRGB(255, 255, 255),
    SliderStroke = Color3.fromRGB(120, 120, 120),

    ToggleBackground = Color3.fromRGB(25, 25, 25),
    ToggleEnabled = Color3.fromRGB(255, 255, 255),
    ToggleDisabled = Color3.fromRGB(80, 80, 80),
    ToggleEnabledStroke = Color3.fromRGB(200, 200, 200),
    ToggleDisabledStroke = Color3.fromRGB(100, 100, 100),
    ToggleEnabledOuterStroke = Color3.fromRGB(150, 150, 150),
    ToggleDisabledOuterStroke = Color3.fromRGB(50, 50, 50),

    DropdownSelected = Color3.fromRGB(30, 30, 30),
    DropdownUnselected = Color3.fromRGB(20, 20, 20),

    InputBackground = Color3.fromRGB(15, 15, 15),
    InputStroke = Color3.fromRGB(100, 100, 100),
    PlaceholderColor = Color3.fromRGB(140, 140, 140)
    },
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RandomGenHub",
        FileName = "Settings"
    },
    Discord = {Enabled = false},
    KeySystem = false
})

local player = Players.LocalPlayer
local Place = game.PlaceId

local ReadTab = Window:CreateTab("README")

ReadTab:CreateParagraph({
    Title = "README"
    Content = "This hub only supports just a baseplate."
)}

local GenTab = Window:CreateTab("Genesis")

GenTab:CreateButton({
    Name = "Krystal Dance",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q, E, R, T, Y, U, P, F, G, H, J, K, L"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Neptunian V",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "F, Z, X, R"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Sin Dragon",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "G, Z, X, C"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Lightning Cannon",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, Z, X, C, V, B, M"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Goner",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Ban Hammer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, R"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Motorcycle",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
    end
})

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Z (While driving)"
})

local HatsTab = Window:CreateTab("Genesis rigs")

HatsTab:CreateParagraph({
    Title = "IMPORTANT",
    Content = "Always load PermaDeath before reanimating."
})

HatsTab:CreateButton({
    Name = "PermaDeath",
    Callback = function()
        Chat("-pd ")
    end
})

HatsTab:CreateButton({
    Name = "Remove Hats",
    Callback = function()
        Chat("-ch ")
    end
})

HatsTab:CreateButton({
    Name = "Respawn",
    Callback = function()
        Chat("-re ")
    end
})

HatsTab:CreateButton({
    Name = "Save hats",
    Callback = function()
        Chat("-sh ")
    end
})

HatsTab:CreateDivider()

HatsTab:CreateParagraph({
    Title = "IMPORTANT!",
    Content = "It's important to always load the rigs so everyone can see you!"
})

HatsTab:CreateButton({
    Name = "Genesis Rigs",
    Callback = function()
        Chat("-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993 ")
    end
})

HatsTab:CreateButton({
    Name = "Genesis Rigs [Black]",
    Callback = function()
        Chat("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811 ")
    end
})

HatsTab:CreateSection("Custom Rigs")

HatsTab:CreateButton({
    Name = "Genesis Rigs [Noob]",
    Callback = function()
        Chat("-gh 95290698984301, 84451219120140, 72292903231768, 108186273151388, 139904067056008 ")
    end
})

HatsTab:CreateButton({ 
    Name = "Genesis Rigs [Guest]", 
    Callback = function()
        Chat("-gh 13058406993 138364679836274 131385506535381 85392395166623 129462518582032 106249329428811 108224319902592 82404150383568 100856932339214")
    end
})

HatsTab:CreateButton({ 
    Name = "Genesis Rigs [1x1x1x1]", 
    Callback = function()
        Chat("-gh 131385506535381 85392395166623 129462518582032 12850150835 106249329428811 17681457649 17532925923 16296624548")
    end
})

HatsTab:CreateDivider()

HatsTab:CreateButton({
    Name = "Neptunian V",
    Callback = function()
        Chat("-gh 5316479641")
    end
})

HatsTab:CreateButton({
    Name = "Sin Dragon",
    Callback = function()
        Chat("-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783")
    end
})

HatsTab:CreateButton({
    Name = "Lightning Cannon",
    Callback = function()
        Chat("-gh 111672581230926 126145101810389 136055191177936 4504231783")
    end
})

HatsTab:CreateButton({
    Name = "Goner",
    Callback = function()
        Chat("-gh 17770317484 17822722698 17822749561 17772174303 17835236579")
    end
})

HatsTab:CreateButton({
    Name = "Ban Hammer",
    Callback = function()
        Chat("-gh 15548314241")
    end
})

HatsTab:CreateButton({
    Name = "Motorcycle",
    Callback = function()
        Chat("-gh 4504231783, 11354413365, 191101707, 18209672127 ")
    end
})

local KeyTab = Window:CreateTab("Keyboards")

KeyTab:CreateSection("By StarFlow:")
KeyTab:CreateButton({
    Name = "Better Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/its-starflow/Scripts/main/Keyboards/B_KD.luau"))()
    end
})

KeyTab:CreateButton({
    Name = "Kilobyte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/its-starflow/Scripts/main/Kilobyte.luau"))()
    end
})

KeyTab:CreateSection("Other Keyboards:")
KeyTab:CreateButton({
    Name = "Delta Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/its-starflow/Scripts/main/Keyboards/Delta.luau"))()
    end
})

pcall(function()
KeyTab:CreateButton({
    Name = "Virtual Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
    end
})
)

KeyTab:CreateButton({
    Name = "Mob Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})