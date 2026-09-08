-- Load notifications and info THIS IS A TEST BEFORE GITHUB UPLOAD GITHUBTESTEI
loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestei/GACHA-ONLINE-GUI/main/test%20%3F%3F%3F%3F%20notification%20update"))()

-- Load the library
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/cueshut/saves/main/criminality%20paste%20ui%20library'))()

-- // Window \\ --
local window = library.new('Gacha Troll GUI V1.0.1 - 12slash25 on scriptblox / GachaOnlineScripter - discord.gg/ecz2SuUhgE', 'Les go')

-- // Tabs \\ --
local tab = window.new_tab('rbxassetid://4483345998')
local tab2 = window.new_tab('rbxassetid://4483345998')
local tab3 = window.new_tab('rbxassetid://4483345998')
local tab4 = window.new_tab('rbxassetid://4483345998')
local tab5 = window.new_tab('rbxassetid://4483345998')

-- // Sections \\ --
local section = tab.new_section('Character | discord.gg/ecz2SuUhgE')
local section2 = tab2.new_section('Items | discord.gg/ecz2SuUhgE')
local section3 = tab3.new_section('Universal | discord.gg/ecz2SuUhgE')
local section4 = tab4.new_section('Annoy | discord.gg/ecz2SuUhgE')
local section5 = tab5.new_section('Developer Tools | discord.gg/ecz2SuUhgE')

-- // Sectors \\ --
local sector1_left = section.new_sector('Make avatar rainbow you cant see but others can', 'Left')
local sector1_left1 = section.new_sector('Teleport to secret dance', 'Left')
local sector1_left2 = section.new_sector('Randomize character add-ons you cant see but others can', 'Left')
local sector1_left3 = section.new_sector('Moderator animated name you cant see but others can', 'Left')
local sector1_right = section.new_sector('Invisibility re-execute every now and then', 'Right')
local sector1_right2 = section.new_sector('Spam scale 0.6-1.25 you cant see but others can', 'Right')
local sector1_right3 = section.new_sector('Randomize presets', 'Right')
local sector1_right4 = section.new_sector('Spam twerk 😏 you cant see but others can', 'Right')
local sector2_left = section2.new_sector('Spam drop prop', 'Left')
local sector2_right = section2.new_sector('Drop any prop GUI - has toggle', 'Right')
local sector3_left = section3.new_sector('Infinite Yield Admin', 'Left')
local sector3_right = section3.new_sector('Chat Bypass and more', 'Right')
local sector4_left = section4.new_sector('Spam give and throw props', 'Left')
local sector4_right = section4.new_sector('Sing California Gurls lol', 'Right')
local sector5_left = section5.new_sector('Remote spy', 'Left')
local sector5_right = section5.new_sector('Dex Workspace mobile support', 'Right')
local sector5_right1 = section5.new_sector('Rejon server takes couple seconds', 'Right')
local sector5_left1 = section5.new_sector('Copy current CFrame', 'Left')
local sector5_left2 = section5.new_sector('JOIN DISCORD FOR SUPPORT OR CUSTOM SCRIPTS', 'Left')

-- // Elements \\ --

-- Button in the 'Infinite Yield Admin' sector (Left)
local button1 = sector3_left.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

-- Button in the 'Chat Bypass button' sector (Right)
local button2 = sector3_right.element('Button', 'Button', nil, function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua"))()
end)

local button3 = sector1_left2.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://pastebin.com/raw/H81UV2dM"))()
end)

-- Button to execute scripts with a delay
local button3 = sector1_left.element('Button', 'Button', nil, function()
    local function executeScript(url)
        local success, result = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Failed to load or execute script from " .. url .. ": " .. result)
        end
    end

    local function executeScriptsWithDelay(urls, delay)
        for _, url in ipairs(urls) do
            spawn(function()
                executeScript(url)
            end)
            wait(delay)
        end
    end

    local urls = {
        "https://pastebin.com/raw/RUyAFsD8",
        "https://raw.githubusercontent.com/GitHubTestei/Yessier/main/rainbowfinalfinale6"
    }

    executeScriptsWithDelay(urls, 0.1)
end)

local button = sector1_right.element('Button', 'Button', nil, function()
   local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Define the new location
local newLocation = CFrame.new(-5888888888888, 99999999999999, -700000000000000000000)

-- Make the player jump
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

-- Wait for a short period to ensure the jump state is applied
wait(0.1)

-- Move the player to the new location
humanoidRootPart.CFrame = newLocation

-- Wait for 1 second before resetting the player
wait(1)

-- Reset the player by setting the humanoid's health to 0
humanoid.Health = 0
end)

local button = sector1_left1.element('Button', 'Button', nil, function()
   local args={
    [1]="/secretdance",
    [2]="All"
  }
  
  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end)

local button = sector1_right2.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestei/GACHA-ONLINE-GUI/main/test%20%3F%3F%3F%20scale%20spam%20test"))()
end)

local button1 = sector1_right3.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://pastebin.com/raw/Pzj83iRT"))()
end)

local button1 = sector1_left3.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://pastebin.com/raw/4EdyhA0V"))()
end)

local button2 = sector1_right4.element('Button', 'Button', nil, function()
   while true do
  local args={
    [1]="idle_leanin",
    [2]="idle"
  }
  
  game:GetService("ReplicatedStorage"):WaitForChild("ServerChangeAnim"):FireServer(unpack(args))
  wait(0.05)
  
  local args={
    [1]="idle_sad",
    [2]="idle"
  }
  
  game:GetService("ReplicatedStorage"):WaitForChild("ServerChangeAnim"):FireServer(unpack(args))
  wait(0.00001)
end
end)


-- Button to spam drop props
local button4 = sector2_left.element('Button', 'Button', nil, function()
    while true do
        local dropCount = 2
        
        for i = 1, dropCount do
            local args = {
                [1] = {
                    ["itemId"] = 15946
                }
            }
        
            game:GetService("ReplicatedStorage"):WaitForChild("AskDoPlayerDropItem"):FireServer(unpack(args))
        
            local args = {
                [1] = "Prop",
                [2] = 1,
                [3] = true,
                [4] = true
            }
        
            game:GetService("ReplicatedStorage"):WaitForChild("ChangeAssetEvent"):FireServer(unpack(args))
        
            local args = {
                [1] = "Prop",
                [2] = 15946
            }
        
            game:GetService("ReplicatedStorage"):WaitForChild("ChangeAssetEvent"):FireServer(unpack(args))
        end
        
        wait(0.0001)
    end
end)

local button2 = sector2_right.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://pastebin.com/raw/bjzkYbPZ"))()
end)

-- Button to execute more scripts with a delay
local button5 = sector4_left.element('Button', 'Button', nil, function()
    local function executeScript(url)
        local success, result = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Failed to load or execute script from " .. url .. ": " .. result)
        end
    end

    local function executeScriptsWithDelay(urls, delay)
        for _, url in ipairs(urls) do
            spawn(function()
                executeScript(url)
            end)
            wait(delay)
        end
    end

    local urls = {
        "https://pastebin.com/raw/i43jdREj",
        "https://pastebin.com/raw/EKMapTpN"
    }

    executeScriptsWithDelay(urls, 0.1)
end)

local button5 = sector5_left.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end)

local button5 = sector5_right.element('Button', 'Button', nil, function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
end)

local button5 = sector5_left1.element('Button', 'Button', nil, function()
   setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
end)

local button5 = sector4_right.element('Button', 'Button', nil, function()
   -- // Dependencies
local SongModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestei/GachaOnline/main/NOT%20MINE%2C%20LYRIC%20SING"))()

-- // Configuration
local Artist = "Katy Perry & Snoop Dog"
local Title = "California Gurls"
local Delay = 2.25

-- // Chat each lyric
SongModule.ChatLyrics(Artist, Title, Delay)
end)

local button5 = sector5_left2.element('Button', 'Button', nil, function()
   -- LocalScript

-- Function to set clipboard
local function setClipboard(text)
    -- Check if the text parameter is a valid string
    if type(text) == "string" then
        -- Set clipboard using the clipboard API
        local success, message = pcall(function()
            -- Set the clipboard text
            setclipboard(text)
        end)
        -- Output success or failure
        if success then
            print("Clipboard set to: " .. text)
        else
            warn("Failed to set clipboard: " .. tostring(message))
        end
    else
        warn("Invalid text parameter. Expected a string.")
    end
end

-- Call the function with the desired Discord link
setClipboard("discord.gg/ecz2SuUhgE")
end)

local button5 = sector5_right1.element('Button', 'Button', nil, function()
   -- Rejoin script

-- Function to handle rejoining
local function rejoinServer()
    -- Wait for a short moment to ensure any necessary clean-up has been done
    wait(1)

    -- Rejoin the server
    game:GetService("Players").LocalPlayer:Kick("Rejoining server...")
end

-- Call the rejoin function
rejoinServer()
end)
