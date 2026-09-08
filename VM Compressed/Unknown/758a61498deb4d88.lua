--[[ you can make alot of things, you can add a loading screen with a wait(time) before loading the UI on the player's face, its recommended using loading UIs to engage players using your hub, check docs for further instructions.: https://galaxyshubdocumentation.netlify.app/ ]]--

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Galaxy-BloxYT/Galaxy-s-Hub-Script-Library/refs/heads/main/Library%20engine"))()

-- Key System mechanic
local keySuccess = Library:InitKeySystem({
    UseKeySystem = false, -- Enable or Disable key system 
    Key = "TEST", -- static key, i'll add dynamic (auto generated) and improve the KeySuccess function to appear the lib smoothly instead of just spawning :P
    KeySystemTitle = "My Incredible Hub! | Key System", -- key system title
    SaveKey = true, -- if the library should save the key into the UNDER functionââ
    FileName = "GalaxysHubLibKeyPlaceholder.txt" -- filename to save the key
})

-- if bro closed or invalid key, nothing happens
if not keySuccess then return end -- delete the first line from the key system until here if you wish to not use it, i'll fix the UseKeySystem later, it won't load even if you put it to false. I'll make this "if not keySuccess..." Not be in here, only in the source.

wait(0.35) -- this is the time where the key GUI gets destroyed, i'll remove this wait later.

local Window = Library.CreateWindow("My Incredible Hub!") -- title

Window:Notify("Hello, this is a placeholder notification!", "Description Example", true, {
    ["Noti. button example1"] = function() game.Players.LocalPlayer.Character.Humanoid.Health = 0 end,
    ["Noti. button example2"] = function() game.Players.LocalPlayer.Character.Humanoid.Health = 100 end
})

local Tab = Window:CreateTab("General")

Tab:AddButton("Placeholder Button", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

Tab:AddLabel("Placeholder label")

Tab:AddSection("Placeholder section")

local speedSlider = Tab:AddSlider("Slider Example", 16, 100, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

local mainToggle = Tab:AddToggle("Placeholder Toggle", false, function(state)
    print("Toggle state:", state)
end)

Tab:AddColorSelection("Color Selection example", Color3.fromRGB(0, 100, 255), function(color)
    print("Color:", color)
end)

Tab:AddTextBox("Textbox", "Type here...", function(text, enterPressed)
    if enterPressed then
        print("Text:", text)
    end
end)

Tab:AddDropdown(
    "Placeholder Name 1", -- name
    {"Option 1", "Option 2", "Option3"}, -- options
    "Option 1", -- default
    false, -- MultipleChoice, put true and use table.concat(chosen, ", ")
    function(chosen)
        print("you choose:", chosen)
    end
)

Tab:AddDropdown(
    "Placeholder Name 2 - MultipleChoice",               -- Dropdown's Name
    {"Option 1", "Option 2", "Option 3", "Option 4"}, -- Current available options
    {"Option 1", "Option 3"},                     -- Default Options
    true,                                -- MultipleChoice (true = more than one)
    function(chosen)
        print("Option selected:", table.concat(chosen, ", ")) -- do not delete the concat.
    end -- you shall use "= chosen" or "(chosen)" to change anything from your script. (like auto farms)
)

local ConfigTab = Window:CreateTab("Configurations")

ConfigTab:AddButton("Save configs", function()
    Window:Notify("Saved", "Saved succesfully!") -- you can put the writefile and readfile system here btw
end)