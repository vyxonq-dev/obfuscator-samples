if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
repeat task.wait() until player and player:FindFirstChild("PlayerGui")
if getgenv().reavscripts then
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer

	local infoGui = Instance.new("ScreenGui")
	infoGui.Name = "ReavAlreadyRunning"
	infoGui.ResetOnSpawn = false
	infoGui.IgnoreGuiInset = true
	infoGui.Parent = player:WaitForChild("PlayerGui")

	-- Optional: UIScale for better mobile/PC responsiveness
	local scale = Instance.new("UIScale")
	scale.Parent = infoGui
	scale.Scale = 1  -- You can dynamically tweak this if needed

	-- Container Frame (centered)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0.8, 0, 0.2, 0)
	container.Position = UDim2.new(0.5, 0, 0.85, 0)
	container.AnchorPoint = Vector2.new(0.5, 0.5)
	container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	container.BackgroundTransparency = 0.2
	container.Parent = infoGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = container

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 1, -20)
	label.Position = UDim2.new(0.5, 0, 0.5, 0)
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(255, 100, 100)
	label.Font = Enum.Font.GothamBold
	label.Text = "🚫 reav's Scripts already running!"
	label.TextScaled = true
	label.TextWrapped = true
	label.TextStrokeTransparency = 0.4
	label.TextStrokeColor3 = Color3.new(0, 0, 0)
	label.Parent = container

	local constraint = Instance.new("UITextSizeConstraint")
	constraint.MinTextSize = 14
	constraint.MaxTextSize = 60
	constraint.Parent = label

	-- Optional Padding
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0.02, 0)
	padding.PaddingRight = UDim.new(0.02, 0)
	padding.PaddingTop = UDim.new(0.02, 0)
	padding.PaddingBottom = UDim.new(0.02, 0)
	padding.Parent = label

	task.delay(3, function()
		infoGui:Destroy()
	end)

	return
end

getgenv().reavscripts = true
local function waitForSetCore(name)
    local success = false
    repeat
        success = pcall(function()
            StarterGui:SetCore(name, nil)
        end)
        if not success then task.wait() end
    until success
end
waitForSetCore("SendNotification")
-- Quotes
local quotes = {
    -- English
		"“The only thing we have to fear is fear itself.” – Franklin D. Roosevelt",
		"“Success is not final, failure is not fatal: It is the courage to continue that counts.” – Winston Churchill",
		"“Life is what happens when you're busy making other plans.” – John Lennon",
		"“Be yourself; everyone else is already taken.” – Oscar Wilde",
		"“In the middle of every difficulty lies opportunity.” – Albert Einstein",
		"“You miss 100% of the shots you don’t take.” – Wayne Gretzky",
		"“The best way to predict the future is to invent it.” – Alan Kay",
		"“Do not go where the path may lead, go instead where there is no path and leave a trail.” – Ralph Waldo Emerson",
		"“It does not matter how slowly you go as long as you do not stop.” – Confucius",
		"“The essence of strategy is choosing what not to do.“ - Michael Porter",
		"“One cannot and must not try to erase the past merely because it does not fit the present.“ - Golda Meir",
		"“Patriotism means to stand by the country. It does not mean to stand by the president.“ - Theodore Roosevelt",
		"“Death is something inevitable. When a man has done what he considers to be his duty to his people and his country, he can rest in peace. I believe I have made that effort and that is, therefore, why I will sleep for the eternity.“ - Nelson Mandela",
		"“You have to love a nation that celebrates its independence every July 4, not with a parade of guns, tanks, and soldiers who file by the White House in a show of strength and muscle, but with family picnics where kids throw Frisbees, the potato salad gets iffy, and the flies die from happiness. You may think you have overeaten, but it is patriotism.“ - Erma Bombeck",
		"“Be more concerned with your character than your reputation, because your character is what you really are, while your reputation is merely what others think you are.“ - John Wooden",
		"“Weak people revenge. Strong people forgive. Intelligent People Ignore.“ - Albert Einstein",
		"“A mind is like a parachute. It doesn't work if it is not open.“ - Frank Zappa",
		"“Never be afraid to raise your voice for honesty and truth and compassion against injustice and lying and greed.“ If people all over the world...would do this, it would change the earth. - William Faulkner",
		"“There are three kinds of men. The one that learns by reading. The few who learn by observation. The rest of them have to pee on the electric fence for themselves.“ - Will Rogers",
		"“A strong nation, like a strong person, can afford to be gentle, firm, thoughtful, and restrained. It can afford to extend a helping hand to others. It's a weak nation, like a weak person, that must behave with bluster and boasting and rashness and other signs of insecurity.“ - Jimmy Carter",
		"“The difference between stupidity and genius is that genius has its limits.“ - Albert Einstein",
		"“We the people are the rightful masters of both Congress and the courts, not to overthrow the Constitution but to overthrow the men who pervert the Constitution.“ - Abraham Lincoln",
		"“With or without religion, you would have good people doing good things and evil people doing evil things. But for good people to do evil things, that takes religion.“ - Steven Weinberg",
		"“Human kindness has never weakened the stamina or softened the fiber of a free people. A nation does not have to be cruel to be tough.“ - Franklin D. Roosevelt",
		"“A person who never made a mistake never tried anything new.“ - Albert Einstein",
		"“My mission in life is not merely to survive, but to thrive; and to do so with some passion, some compassion, some humor, and some style.“ - Maya Angelou",
		"“Life is short, break the rules... is often attributed to Mark Twain, and it encourages embracing life fully. The full quote is: Life is short, break the rules, forgive quickly, kiss slowly, love truly, laugh uncontrollably, and never regret anything that made you smile.“ (Goodreads)", 
		"You've gotta dance like there's nobody watching, Love like you'll never be hurt, Sing like there's nobody listening, And live like it's heaven on earth.“ - William W. Purkey",
		"Be the change that you wish to see in the world.“ - Mahatma Gandhi",
		"Live as if you were to die tomorrow. Learn as if you were to live forever.“ - Mahatma Gandhi",
		"“Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.“ - Marilyn Monroe",
		"“Listen to the mustn'ts, child. Listen to the don'ts. Listen to the shouldn'ts, the impossibles, the won'ts. Listen to the never haves, then listen close to me... Anything can happen, child. Anything can be.“ - Shel Silverstein",
		"“You may say I'm a dreamer, but I'm not the only one. I hope someday you'll join us. And the world will live as one.“ - John Lennon",
		"“Our deepest fear is not that we are inadequate. Our deepest fear is that we are powerful beyond measure. It is our light, not our darkness that most frightens us.“ - Marianne Williamson",
		"“I have not failed. I've just found 10,000 ways that won't work.“ - Thomas A. Edison",

    -- Italian
    	"“Chi ha tempo non aspetti tempo.” – Proverbio italiano",
    	"“L’essenziale è invisibile agli occhi.” – Antoine de Saint-Exupéry",
    	"“Vivere è la cosa più rara al mondo. La maggior parte della gente esiste, e nulla più.” – Oscar Wilde",

    -- French
    	"“Liberté, égalité, fraternité.” – Maximilien Robespierre",
    	"“Je pense, donc je suis.” – René Descartes",
    	"“Il n’y a qu’un bonheur dans la vie, c’est d’aimer et d’être aimé.” – George Sand",

    -- Spanish
    	"“La vida es sueño.” – Pedro Calderón de la Barca",
    	"“En un lugar de la Mancha, de cuyo nombre no quiero acordarme...” – Miguel de Cervantes",
    	"“Caminante, no hay camino, se hace camino al andar.” – Antonio Machado",

    -- German
    	"“Was mich nicht umbringt, macht mich stärker.” – Friedrich Nietzsche",
    	"“Zwei Dinge sind unendlich, das Universum und die menschliche Dummheit.” – Albert Einstein",
    	"“Im Anfang war die Tat.” – Johann Wolfgang von Goethe",

    -- Japanese
		"“「七転び八起き」” (Nanakorobi ya oki) - Fall seven times, stand up eight - Japanese proverb",
		"“「明日は明日の風が吹く。」” (Ashita wa ashita no kaze ga fuku) - Tomorrow's wind will blow tomorrow - Japanese proverb",
		"“「落花流水」” (Rakka ryūsui) - Flowers fall, water flows - Japanese proverb",
		"“「一期一会」” (Ichigo ichie) - One life, one encounter - Japanese proverb",
		"“「修羅の道」” (Shura no michi) - The path of the warrior - Japanese proverb",
		"“「風林火山」” (Fūrin kaizan) - Wind, forest, fire, mountain - Japanese proverb",
		"“「不器用な人ほど器用な人に会う」” (Fukirō na hito hodo kirō na hito ni au) - The less skilled you are, the more you meet skilled people - Japanese proverb",

    -- Latin
    	"“Veni, vidi, vici.” – Julius Caesar",
		"“Carpe diem.” – Horace",
    	"“Amor vincit omnia.” – Virgil",

    -- Chinese
		"“「己を知り、敵を知れば百戦危うからず。」“ – Sun Tzu",
    	"“千里之行，始於足下。” – Laozi",
    	"“知人者智，自知者明。” – Laozi",
    	"“学而不思则罔，思而不学则殆。” – Confucius"
}
local monthNames = {
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
}

local function getDailyQuoteIndex(utcTime)
    local year = utcTime.Year
    local month = utcTime.Month
    local day = utcTime.Day

    local dayString = string.format("%04d-%02d-%02d", year, month, day)

    local hash = 0
    for i = 1, #dayString do
        hash = (hash * 31 + string.byte(dayString, i)) % #quotes
    end

    return hash + 1
end

pcall(function()
    local utcTime = DateTime.now():ToUniversalTime()
    local day = utcTime.Day
    local monthName = monthNames[utcTime.Month]
    local dateStr = string.format("%d %s", day, monthName)

    local quoteIndex = getDailyQuoteIndex(utcTime)

    StarterGui:SetCore("SendNotification", {
        Title = "💬 Quote of the Day - " .. dateStr,
        Text = quotes[quoteIndex],
        Duration = 15
    })
end)

local IMAGE_ID = "rbxassetid://104873171443907"

-- Create ScreenGui
local introGui = Instance.new("ScreenGui")
introGui.Name = "IntroGui"
introGui.IgnoreGuiInset = true
introGui.ResetOnSpawn = false
local LocalPlayer = Players.LocalPlayer
introGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- UIScale per la responsività (Meglio metterlo dopo il parent, e aggiornarlo se la dimensione cambia)
local uiScale = Instance.new("UIScale")
uiScale.Parent = introGui

-- Funzione per impostare la scala in base alla dimensione dello schermo
local function updateUIScale()
    local screenSize = workspace.CurrentCamera.ViewportSize
    if screenSize.X < 800 then
        uiScale.Scale = 0.75 -- Mobile
    else
        uiScale.Scale = 1 -- PC
    end
end

updateUIScale()
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(updateUIScale) 

local image = Instance.new("ImageLabel")
image.Name = "IntroImage"
image.AnchorPoint = Vector2.new(0.5, 0.5) 
image.Position = UDim2.new(0.5, 0, 0.5, 0) 
image.Size = UDim2.new(0, 50, 0, 50) 
image.BackgroundTransparency = 1
image.Image = IMAGE_ID
image.Parent = introGui

local aspect = Instance.new("UIAspectRatioConstraint")
aspect.Parent = image
aspect.AspectRatio = 1
aspect.DominantAxis = Enum.DominantAxis.Height 

-- Label (inizialmente trasparente)
local label = Instance.new("TextLabel")
label.AnchorPoint = Vector2.new(0.5, 0)
label.Position = UDim2.new(0.5, 0, 0.65, 0) 
label.Size = UDim2.new(0.8, 0, 0.1, 0)
label.BackgroundTransparency = 1
label.Text = "Reav'S sCriptS"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextStrokeTransparency = 0.5
label.TextStrokeColor3 = Color3.new(0, 0, 0)
label.Font = Enum.Font.LuckiestGuy
label.TextScaled = true
label.TextTransparency = 1 
label.Parent = introGui

local textConstraint = Instance.new("UITextSizeConstraint")
textConstraint.MaxTextSize = 72
textConstraint.MinTextSize = 14
textConstraint.Parent = label

-- Definisci le proprietà di destinazione per l'immagine
local targetImageSize = UDim2.new(0.25, 0, 0.25, 0) 
local targetImagePosition = UDim2.new(0.5, 0, 0.35, 0) 

-- Tween per l'immagine (ingrandimento e spostamento verso l'alto)
local imageTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local imageTween = TweenService:Create(image, imageTweenInfo, {
    Size = targetImageSize,
    Position = targetImagePosition 
})

imageTween:Play()

-- Collega la fine del tween dell'immagine
imageTween.Completed:Connect(function()
    local imageAbsoluteY = (targetImagePosition.Y.Scale * introGui.AbsoluteSize.Y) + (targetImagePosition.Y.Offset)
    local imageAbsoluteHeight = (targetImageSize.Y.Scale * introGui.AbsoluteSize.Y) + (targetImageSize.Y.Offset)
    local labelOffsetFromImage = 20
    local labelYPosition = imageAbsoluteY + (imageAbsoluteHeight / 2) + labelOffsetFromImage
    label.Position = UDim2.new(0.5, 0, 0, labelYPosition) 
    local labelTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local labelTween = TweenService:Create(label, labelTweenInfo, {TextTransparency = 0})
    labelTween:Play()

    labelTween.Completed:Connect(function()
        task.delay(5, function()
            introGui:Destroy()
            if RunServiceConnection then
                RunServiceConnection:Disconnect()
                RunServiceConnection = nil
            end
        end)
    end)
end)

local function showMessage(message, duration)
    local success, err = pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "reavscripts",
            Text = message,
            Duration = duration or 5
        })
    end)
    if not success then
        warn("[ReavScripts] Failed to show notification:", err)
    end
end


local function getScriptUrl()
    local scripts = {
        [7074860883] = { 
            [128336380114944] = "https://raw.githubusercontent.com/reavscripts/arise/refs/heads/main/dungeon.lua", 
            [116614712661486] = "https://raw.githubusercontent.com/reavscripts/arise/refs/heads/main/afk.lua",
            default = "https://raw.githubusercontent.com/reavscripts/arise/refs/heads/main/main.lua"
        },
        [7513130835] = {
            [game.PlaceId] = "https://raw.githubusercontent.com/reavscripts/untitleddrillgame/main/main.lua",
            default = "https://raw.githubusercontent.com/reavscripts/untitleddrillgame/main/main.lua"
        },
        [7546582051] = {
            [94845773826960] = "https://raw.githubusercontent.com/reavscripts/dungeon-heroes/main/main.lua",
            default = "https://raw.githubusercontent.com/reavscripts/dungeon-heroes/main/main.lua"
        },
        [6944155317] = {
            [72615021017011] = "https://raw.githubusercontent.com/reavscripts/unlimitedworld/refs/heads/main/main.lua",
            default = "https://raw.githubusercontent.com/reavscripts/unlimitedworld/refs/heads/main/main.lua"
        }
    }

    -- Optional world check override
    local room1
    local main = workspace:FindFirstChild("__Main")
    if main then
        local world = main:FindFirstChild("__World")
        if world then
            room1 = world:FindFirstChild("Room_1")
        end
    end

    if room1 and room1:FindFirstChild("Portal") then
        if showMessage then
            showMessage("Special script triggered due to Room_1 and Portal.", 3)
        end
        return "https://raw.githubusercontent.com/reavscripts/arise/refs/heads/main/infernal.lua"
    end

    -- Load based on game and place
    local gameScripts = scripts[game.GameId]
    if gameScripts then
        return gameScripts[game.PlaceId] or gameScripts.default
    end

    return nil
end

local function executeScript()
    local scriptUrl = getScriptUrl()

    if scriptUrl then
        showMessage("Loading script from: " .. scriptUrl, 3)
        local success, err = pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)

        if not success then
            showMessage("Failed to load script. Error: " .. err, 3)
        end
    else
        showMessage("No valid script found for this game/Place.", 3)
    end
end

executeScript()
