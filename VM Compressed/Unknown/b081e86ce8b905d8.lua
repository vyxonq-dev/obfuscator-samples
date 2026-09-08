local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Just a VNGEx Hub",
   LoadingTitle = "VNGEx Interface | Namoblox",
   LoadingSubtitle = "Hub & Script Classified",
   ConfigurationSaving = {Enabled = false}
})

-- Private Tab
local MainHubTab = Window:CreateTab("All Hubs", 4483362458)
local ScriptFETab = Window:CreateTab("FE Scripts", 4483345998)
local MovementTab = Window:CreateTab("Movement", 4483362748)

-- Execution Function
local function Exec(name, url, tab)
    tab:CreateButton({
        Name = name,
        Callback = function()
            local success, err = pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            if not success then
                Rayfield:Notify({Title = "Error", Content = "Script Error or link was failed!", Duration = 2})
            end
        end,
    })
end

--- ==========================================
--- 1. TAB ALL HUBS 
--- ==========================================
MainHubTab:CreateSection("--- [ Mega Hubs ] ---")
Exec("Rob Hub", "https://rawscripts.net/raw/Universal-Script-Rob-Hub-86585", MainHubTab)
Exec("Minhz Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-MinhZ-Hub-86411", MainHubTab)
Exec("Seven Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-seven-hub-75158", MainHubTab)
Exec("Jab Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-jab-hub-74800", MainHubTab)
Exec("Holi Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-holi-hub-77549", MainHubTab)
Exec("Holiday Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-holiday-hub-74312", MainHubTab)
Exec("Roca Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-roca-hub-77107", MainHubTab)
Exec("Zeros Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-zerox-hub-77002", MainHubTab)
Exec("Red Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-reb-hub-76633", MainHubTab)
Exec("Combine Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-combine-hub-74129", MainHubTab)
Exec("Gras Hub", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-gr*-hub-72841", MainHubTab)

--- ==========================================
--- 2. TAB FE SCRIPTS (Single scripts, trolls, characters)
--- ==========================================
ScriptFETab:CreateSection("--- [ Combat & Fling ] ---")
Exec("Bring Player (FE)", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Fe-bring-player-73881", ScriptFETab)
Exec("Ban Hammer Fling", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-ban-hammer-fling-73289", ScriptFETab)
Exec("Cop Fling", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-cop-fling-73078", ScriptFETab)

ScriptFETab:CreateSection("--- [ Character & Fun ] ---")
Exec("Fries FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Fe-fries-script-76719", ScriptFETab)
Exec("Dog Friend", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-dog-friend-75418", ScriptFETab)
Exec("Firing Arm", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-firing-arm-74891", ScriptFETab)
Exec("Car FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-car-74888", ScriptFETab)
Exec("More Minions", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-more-minions-74467", ScriptFETab)
Exec("Clovr FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-clovr-74349", ScriptFETab)
Exec("Roblox Egor", "https://rawscripts.net/raw/Just-a-baseplate-Fe-Roblox-EGOR-script-73900", ScriptFETab)
Exec("Achromatix", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-achromatix-73585", ScriptFETab)
Exec("Giant Dance", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Giant-Dance-81191", ScriptFETab)
Exec("Drophats Giant", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Giant-Hats-drop-72829", ScriptFETab)
Exec("Warden FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-warden-72526", ScriptFETab)
Exec("Buger Blood", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-burger-bloodwater-86341", ScriptFETab)
Exec("Neko FE", "https://rawscripts.net/raw/Universal-Script-Fe-neko-skidded-by-me-86252", ScriptFETab)
Exec("Police FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-police-85840", ScriptFETab)
Exec("Sword Master", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Fe-Sword-Master-85225", ScriptFETab)
Exec("Pumpkin Glitch", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-pumpkin-glitcher-82753", ScriptFETab)
Exec("Kids Script", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-kids-script-79917", ScriptFETab)
Exec("Eggs FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Fe-egg-script-76718", ScriptFETab)
Exec("Burger FE", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Fe-burger-script-76712", ScriptFETab)
Exec("Fake Sword", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-fake-sword-76631", ScriptFETab)
Exec("Motorcycle V2", "https://rawscripts.net/raw/UP-Just-a-baseplate.-FE-motorcycle-V2-by-monoscripts-80645", ScriptFETab)

ScriptFETab:CreateSection("--- [ Orbits ] ---")
Exec("Crystal Orbit", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Super-hat-orbin-50-modes-79791", ScriptFETab)
Exec("Hat Orbit V1", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Hat-Orbit-V1-77710", ScriptFETab)
Exec("Krystal Orbit", "https://rawscripts.net/raw/UP-Just-a-baseplate.-Krystal-Orbit-Modded-by-cooolguy238-Dusekkar-Orbit-76903", ScriptFETab)
Exec("Flame Hat Orbit", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-flame-hat-orbit-75783", ScriptFETab)

--- ==========================================
--- 3. TAB MOVEMENT (Move)
--- ==========================================
MovementTab:CreateSection("--- [ Parkour & Flight ] ---")
Exec("Wall Hop", "https://rawscripts.net/raw/Universal-Script-Wall-hop-68410", MovementTab)
Exec("Fly Script", "https://rawscripts.net/raw/UP-Just-a-baseplate.-fly-script-81027", MovementTab)

MovementTab:CreateSection("--- [ Quick Stats ] ---")
MovementTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end) end,
})

Rayfield:Notify({Title = "VNGEx Hub", Content = "Hello! Hub interface download is complete.", Duration = 4})