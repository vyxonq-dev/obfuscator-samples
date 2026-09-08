local screenGui = Instance.new("ScreenGui")  
screenGui.Name = "ScriptedFEGui"  
screenGui.Parent = game.CoreGui  

local mainFrame = Instance.new("Frame")  
mainFrame.Size = UDim2.new(0, 400, 0, 300)  
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)  
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
mainFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)  
mainFrame.BorderSizePixel = 4  
mainFrame.Parent = screenGui  

-- Title  
local title = Instance.new("TextLabel")  
title.Size = UDim2.new(1, 0, 0, 40)  
title.Text = "Purple Gui by ContactusRoblox404"  
title.TextColor3 = Color3.new(1, 1, 1)  
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
title.BorderColor3 = Color3.fromRGB(128, 0, 128)  
title.BorderSizePixel = 2  
title.Font = Enum.Font.SourceSansBold  
title.TextSize = 22  
title.Parent = mainFrame  

-- Close Button  
local closeButton = Instance.new("TextButton")  
closeButton.Size = UDim2.new(0, 30, 0, 30)  
closeButton.Position = UDim2.new(1, -35, 0, 5)  
closeButton.Text = "X"  
closeButton.TextColor3 = Color3.new(1, 1, 1)  
closeButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)  
closeButton.Font = Enum.Font.SourceSansBold  
closeButton.TextSize = 20  
closeButton.Parent = mainFrame  
closeButton.MouseButton1Click:Connect(function()  
    screenGui:Destroy()  
end)  

-- Button System  
local buttons = {}  
local function clearButtons()  
    for _, b in pairs(buttons) do b:Destroy() end  
    buttons = {}  
end  

local function createScriptButton(name, yPos, scriptURL, optionalBeforeRun)  
    local button = Instance.new("TextButton")  
    button.Size = UDim2.new(0, 300, 0, 40)  
    button.Position = UDim2.new(0, 50, 0, yPos)  
    button.Text = name  
    button.TextColor3 = Color3.new(1, 1, 1)  
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
    button.BorderColor3 = Color3.fromRGB(128, 0, 128)  
    button.BorderSizePixel = 2  
    button.Font = Enum.Font.SourceSans  
    button.TextSize = 20  
    button.Parent = mainFrame  

    button.MouseButton1Click:Connect(function()    
        if optionalBeforeRun then pcall(optionalBeforeRun) end    
        if scriptURL and scriptURL ~= "" then    
            loadstring(game:HttpGet(scriptURL))()    
        end    
    end)    

    table.insert(buttons, button)  
end  

local currentPage = 1  
local totalPages = 20  

local function renderPage(page)  
    clearButtons()  

    if page == 1 then    
        createScriptButton("Nameless", 60, "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source")    
        createScriptButton("Infinite Yield", 110, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")    
        createScriptButton("Backdoor MrPurple", 160, "https://raw.githubusercontent.com/contactusRoblox404/Backdoor-MrPurple/refs/heads/main/Backdoor-MrPurple")    
        createScriptButton("Prison Life", 210, "https://rawscripts.net/raw/Prison-Life-Prizz-Life-33936")    

    elseif page == 2 then    
        createScriptButton("c00lgui", 60, "https://rawscripts.net/raw/Universal-Script-c00lgui-42358")    
        createScriptButton("Dex", 110, "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua")    
        createScriptButton("Fling Gui", 160, "https://raw.githubusercontent.com/contactusRoblox404/FlingGui/refs/heads/main/UltraFlinger")    
        createScriptButton("Hitbox Gui", 210, "https://pastefy.app/ItfO0tdg/raw")    

    elseif page == 3 then    
        createScriptButton("Telekinesis", 60, "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty1.lua")    
        createScriptButton("Control NPC", 110, "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty38.lua")    
        createScriptButton("Tptools", 160, "https://rawscripts.net/raw/Universal-Script-Tptools-41801")    
        createScriptButton("Plasma Shotgun", 210, "https://raw.githubusercontent.com/contactusRoblox404/Plasma-Shotgun/refs/heads/main/Plasma%20Shotgun")    

    elseif page == 4 then    
        createScriptButton("666", 60, "https://raw.githubusercontent.com/contactusRoblox404/666/refs/heads/main/666")    
        createScriptButton("Killaura", 110, "https://raw.githubusercontent.com/contactusRoblox404/Killaura/refs/heads/main/Killaura")    
        createScriptButton("Ban Hammer", 160, "https://rawscripts.net/raw/Universal-Script-Ban-Hammer-33938")    
        createScriptButton("POLARIA", 210, "https://rawscripts.net/raw/Universal-Script-FE-POLARIA-43824")    

    elseif page == 5 then    
        createScriptButton("FE SCP-096", 60, "https://rawscripts.net/raw/Universal-Script-FE-SCP-096-36948")    
        createScriptButton("ak-47", 110, "https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ak47")    
        createScriptButton("Grab Knife", 160, "https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753")    
        createScriptButton("1x1x1x1 purple gui", 210, "https://raw.githubusercontent.com/contactusRoblox404/1x1x1x1/refs/heads/main/1x1x1x1")    

    elseif page == 6 then    
        createScriptButton("LaserGun", 60, "https://raw.githubusercontent.com/contactusRoblox404/LaserGun/refs/heads/main/LaserGun")    
        createScriptButton("McDonalds", 110, "https://rawscripts.net/raw/Universal-Script-Spooky-Scary-MCDonalds-Script-28270")    
        createScriptButton("Spam Decal C00lkidd", 160, "https://raw.githubusercontent.com/contactusRoblox404/C00lkidd/refs/heads/main/C00lkidd")    
        createScriptButton("Dodge", 210, "https://rawscripts.net/raw/Universal-Script-Universal-FE-Sans-Dodge-40667")    

    elseif page == 7 then    
        createScriptButton("Btools", 60, "https://rawscripts.net/raw/Universal-Script-Universal-BTools-or-Tools-24223")    
        createScriptButton("ForceField", 110, "https://rawscripts.net/raw/Client-Replication-ForceField-script-fe-in-made-by-w000mkidd-29643")    
        createScriptButton("Hollow Purple", 160, "https://rawscripts.net/raw/Universal-Script-Temu-Hollow-Purple-36286")    
        createScriptButton("RC7", 210, "https://raw.githubusercontent.com/contactusRoblox404/RC7/refs/heads/main/.gitignore")   
 
elseif page == 8 then    
        createScriptButton("Fe Chara", 60, "https://rawscripts.net/raw/Universal-Script-Psycho-Chara-use-an-reanimation-42989")    
        createScriptButton("Giant Sword", 110, "https://rawscripts.net/raw/Universal-Script-TXT-UNIVERSAL-GIANT-X-SWORD-43287")    
        createScriptButton("Invisible", 160, "https://raw.githubusercontent.com/khen791/script-khen/refs/heads/main/Fe%20Invisible.txt")    
        createScriptButton("Nuke", 210, "https://rawscripts.net/raw/Universal-Script-TXT-NUKE-TOOL-43278")  
  
elseif page == 9 then    
        createScriptButton("Fe Shotgun", 60, "https://rawscripts.net/raw/Universal-Script-TXT-SNIPER-43274")    
        createScriptButton("Fe Guardian", 110, "https://rawscripts.net/raw/Universal-Script-TXT-Guardia-Yellow-43283")    
        createScriptButton("Fe Sword Red", 160, "https://rawscripts.net/raw/Universal-Script-TXT-KNIFE-RED-BIG-43286")    
        createScriptButton("Fe Sans", 210, "https://rawscripts.net/raw/Universal-Script-TXT-SANS-CRAZY-RAINBOW-EDITION-43282")  

elseif page == 10 then    
        createScriptButton("Fe Magic", 60, "https://rawscripts.net/raw/Universal-Script-TXT-God-43319")    
        createScriptButton("Fe DEV-UZI", 110, "https://rawscripts.net/raw/Universal-Script-TXT-DEV-UZI-43276")    
        createScriptButton("Fe Axe", 160, "https://rawscripts.net/raw/Universal-Script-TXT-FIRE-AXE-43272")    
        createScriptButton("Fe Sniper", 210, "https://rawscripts.net/raw/Universal-Script-TXT-L96A1-GUN-43273")     

elseif page == 11 then    
        createScriptButton("Fe Fighter", 60, "https://rawscripts.net/raw/Universal-Script-FE-Fighter-inspired-by-Gale-21557")    
        createScriptButton("Fe Dominador", 110, "https://rawscripts.net/raw/Universal-Script-TXT-Dominador-Powers-43284")    
        createScriptButton("Fe Saitama", 160, "https://rawscripts.net/raw/Universal-Script-TXT-saitama-43285")    
        createScriptButton("Fe Baldi", 210, "https://raw.githubusercontent.com/contactusRoblox404/Baldi/refs/heads/main/Baldi")    

elseif page == 12 then    
        createScriptButton("SimpleSpyV3", 60, "https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua")    
        createScriptButton("Orbit Part", 110, "https://raw.githubusercontent.com/contactusRoblox404/Orbit-Part/refs/heads/main/Orbit-Part")    
        createScriptButton("Bring Part", 160, "https://rawscripts.net/raw/Universal-Script-Bring-Parts-27586")    
        createScriptButton("Chat Bypass", 210, "https://rawscripts.net/raw/Universal-Script-byterpass-CHAT-BYPASSER-47366")     

elseif page == 13 then    
        createScriptButton("Noli", 60, "https://rawscripts.net/raw/Universal-Script-FE-Temu-Noli-Script-broken-idle-38315")    
        createScriptButton("John Doe", 110, "https://rawscripts.net/raw/Universal-Script-forsaken-cript-builder-john-doe-script-40004")    
        createScriptButton("C00lkidd", 160, "https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107")    
        createScriptButton("Lua Hammer", 210, "https://rawscripts.net/raw/Universal-Script-Lua-Hammer-Script-44008")    

elseif page == 14 then    
        createScriptButton("Fly Angel", 60, "https://rawscripts.net/raw/Universal-Script-Fe-iron-man-26749")    
        createScriptButton("Wings", 110, "https://rawscripts.net/raw/Universal-Script-Cool-wings-38639")    
        createScriptButton("The Honored One", 160, "https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Honored.lua")    
        createScriptButton("Fe Forsaken", 210, "https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/ForsakationHub")    

elseif page == 15 then    
        createScriptButton("Fe Zombie", 60, "https://rawscripts.net/raw/Universal-Script-FE-ZOMBIE-plus-its-made-by-G10-43814")    
        createScriptButton("Silly Neko", 110, "https://rawscripts.net/raw/Universal-Script-Fe-Silly-Neko-16736")    
        createScriptButton("Ro-exploit 6.0", 160, "https://rawscripts.net/raw/Universal-Script-Uh-dk-8206")    
        createScriptButton("Hat Hub", 210, "https://rawscripts.net/raw/Just-a-baseplate.-Hat-Hub-44944")    

elseif page == 16 then    
        createScriptButton("sonic.exe", 60, "https://raw.githubusercontent.com/contactusRoblox404/Sonic.exe/refs/heads/main/Sonic.exe")    
        createScriptButton("F3X", 110, "https://raw.githubusercontent.com/contactusRoblox404/Sonic.exe/refs/heads/main/F3X")    
        createScriptButton("Gubby", 160, "https://rawscripts.net/raw/Universal-Script-Gubby-45530")    
        createScriptButton("Guest 666 Spawner", 210, "https://rawscripts.net/raw/Universal-Script-Guest-666-spawner-43556")    

elseif page == 17 then    
        createScriptButton("Linked Sword", 60, "https://rawscripts.net/raw/Universal-Script-FE-Classic-Sword-Fling-Tool-16842")    
        createScriptButton("Firebrand Sword", 110, "https://rawscripts.net/raw/Universal-Script-Linked-Sword-R6-Script-40329")    
        createScriptButton("Fe Seraphic Blade", 160, "https://pastefy.app/59mJGQGe/raw")    
        createScriptButton("Pickaxe", 210, "https://raw.githubusercontent.com/Ahma174/Tool/refs/heads/main/Minecraft%20Tools")   

elseif page == 18 then    
        createScriptButton("Fe Backfilp", 60, "https://raw.githubusercontent.com/contactusRoblox404/Fe-Backfilp/refs/heads/main/Fe%20Backfilp")    
        createScriptButton("Spawner Dummy", 110, "https://raw.githubusercontent.com/sigmaboy123z/MYFRIENDSCRIPT/refs/heads/main/MYNEWFRIENDSPAWNER")    
        createScriptButton("Invincible Fly", 160, "https://raw.githubusercontent.com/396abc/Script/refs/heads/main/Fly.lua")    
        createScriptButton("Fe Ragdoll", 210, "https://raw.githubusercontent.com/shakk-code/fe-ragdoll-script/refs/heads/main/script.lua")

elseif page == 19 then    
        createScriptButton("Fake Lag", 60, "https://rawscripts.net/raw/Universal-Script-Fake-lag-41217")    
        createScriptButton("Spider-Man", 110, "https://raw.githubusercontent.com/contactusRoblox404/Spider-Man/refs/heads/main/Spider-Man")    
        createScriptButton("Portal Gun", 160, "https://raw.githubusercontent.com/contactusRoblox404/Portal-Gun/refs/heads/main/Portal%20Gun")    
        createScriptButton("Death Note", 210, "https://rawscripts.net/raw/Universal-Script-Death-Note-20690")    

    elseif page == 20 then   
        local thankYouLabel = Instance.new("TextLabel")    
        thankYouLabel.Size = UDim2.new(1, 0, 1, -40)    
        thankYouLabel.Position = UDim2.new(0, 0, 0, 40)    
        thankYouLabel.Text = "Thank you for using Purple Gui by ContactusRoblox404"    
        thankYouLabel.TextColor3 = Color3.new(1, 1, 1)    
        thankYouLabel.BackgroundTransparency = 1    
        thankYouLabel.Font = Enum.Font.SourceSansBold    
        thankYouLabel.TextSize = 24    
        thankYouLabel.TextWrapped = true    
        thankYouLabel.Parent = mainFrame    
        table.insert(buttons, thankYouLabel)

        createScriptButton("Settings", 210, "", function()    
            local settingsFrame = Instance.new("Frame")    
            settingsFrame.Size = UDim2.new(0, 300, 0, 200)    
            settingsFrame.Position = UDim2.new(0.5, -150, 0.5, -100)    
            settingsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)    
            settingsFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)    
            settingsFrame.BorderSizePixel = 2    
            settingsFrame.Parent = screenGui

            local function createInput(labelText, defaultText, yPos)    
                local label = Instance.new("TextLabel")    
                label.Size = UDim2.new(0, 80, 0, 30)    
                label.Position = UDim2.new(0, 10, 0, yPos)    
                label.Text = labelText    
                label.TextColor3 = Color3.new(1,1,1)    
                label.BackgroundTransparency = 1    
                label.Font = Enum.Font.SourceSans    
                label.TextSize = 18    
                label.Parent = settingsFrame

                local box = Instance.new("TextBox")    
                box.Size = UDim2.new(0, 180, 0, 30)    
                box.Position = UDim2.new(0, 100, 0, yPos)    
                box.Text = defaultText    
                box.TextColor3 = Color3.new(1,1,1)    
                box.BackgroundColor3 = Color3.fromRGB(0,0,0)    
                box.BorderColor3 = Color3.fromRGB(128,0,128)    
                box.BorderSizePixel = 2    
                box.Font = Enum.Font.SourceSans    
                box.TextSize = 18    
                box.Parent = settingsFrame

                return box    
            end

            local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")    
            local speedBox = createInput("Speed", tostring(hum and hum.WalkSpeed or 16), 10)    
            local jumpBox = createInput("Jump", tostring(hum and hum.JumpPower or 50), 50)    
            local gravBox = createInput("Gravity", tostring(workspace.Gravity), 90)    

            local applyBtn = Instance.new("TextButton")    
            applyBtn.Size = UDim2.new(0, 280, 0, 40)    
            applyBtn.Position = UDim2.new(0, 10, 0, 140)    
            applyBtn.Text = "Apply Settings"    
            applyBtn.TextColor3 = Color3.new(1, 1, 1)    
            applyBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)    
            applyBtn.BorderColor3 = Color3.fromRGB(128, 0, 128)    
            applyBtn.BorderSizePixel = 2    
            applyBtn.Font = Enum.Font.SourceSansBold    
            applyBtn.TextSize = 20    
            applyBtn.Parent = settingsFrame

            applyBtn.MouseButton1Click:Connect(function()    
                local char = game.Players.LocalPlayer.Character    
                if char then    
                    local hum = char:FindFirstChildOfClass("Humanoid")    
                    if hum then    
                        hum.WalkSpeed = tonumber(speedBox.Text) or hum.WalkSpeed    
                        hum.JumpPower = tonumber(jumpBox.Text) or hum.JumpPower    
                        workspace.Gravity = tonumber(gravBox.Text) or workspace.Gravity    
                    end    
                end    
                settingsFrame:Destroy()    
            end)
        end)
    end  
end  

-- Navigation Buttons  
local backBtn = Instance.new("TextButton")  
backBtn.Size = UDim2.new(0, 30, 0, 30)  
backBtn.Position = UDim2.new(0, 10, 1, -35)  
backBtn.Text = "<"  
backBtn.TextColor3 = Color3.new(1, 1, 1)  
backBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
backBtn.BorderColor3 = Color3.fromRGB(128, 0, 128)  
backBtn.BorderSizePixel = 2  
backBtn.Font = Enum.Font.SourceSansBold  
backBtn.TextSize = 20  
backBtn.Parent = mainFrame  
backBtn.MouseButton1Click:Connect(function()  
    if currentPage > 1 then  
        currentPage -= 1  
        renderPage(currentPage)  
    end  
end)  

local nextBtn = Instance.new("TextButton")  
nextBtn.Size = UDim2.new(0, 30, 0, 30)  
nextBtn.Position = UDim2.new(1, -40, 1, -35)  
nextBtn.Text = ">"  
nextBtn.TextColor3 = Color3.new(1, 1, 1)  
nextBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
nextBtn.BorderColor3 = Color3.fromRGB(128, 0, 128)  
nextBtn.BorderSizePixel = 2  
nextBtn.Font = Enum.Font.SourceSansBold  
nextBtn.TextSize = 20  
nextBtn.Parent = mainFrame  
nextBtn.MouseButton1Click:Connect(function()  
    if currentPage < totalPages then  
        currentPage += 1  
        renderPage(currentPage)  
    end  
end)  

-- Show the first page  
renderPage(1)
