local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "moma hub",
    Icon = 0,
    LoadingTitle = "moma hub loading",
    LoadingSubtitle = "by moma1133222",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "moma hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hello"}
    }
 })

 local Tab = Window:CreateTab("Main", 4483362458)
 local Section = Tab:CreateSection("Main stuff")

 Rayfield:Notify({
    Title = "Follow me please",
    Content = "my script blox moma1133222",
    Duration = 6.5,
    Image = 4483362458,
 })

 local Button = Tab:CreateButton({
    Name = "Rocket Launcher(robux stuff)",
    Callback = function()
		local args = {
			[1] = "Rocket Launcher",
			[2] = 0
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("BuyPower"):FireServer(unpack(args))
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Minigun(robux stuff)",
    Callback = function()
		local args = {
			[1] = "Minigun",
			[2] = 0
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("BuyPower"):FireServer(unpack(args))
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Get Endtime Orb(best thing in the game)",
    Callback = function()
		local args = {
			[1] = "Endtime Orb",
			[2] = 0
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("BuyPower"):FireServer(unpack(args))
    end,
 })

local Button = Tab:CreateButton({
    Name = "Bomb(Starter pack only)",
    Callback = function()
		local args = {
			[1] = "Bomb",
			[2] = 0
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("BuyPower"):FireServer(unpack(args))
    end,
 })
 
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local materialsInputValue = ""

local Input = Tab:CreateInput({
    Name = "Materials",
    CurrentValue = "",
    PlaceholderText = "Enter materials to give",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
        local numberInput = tonumber(Text)
        if numberInput then
            materialsInputValue = numberInput
        else
            print("Please enter a valid number.")
        end
    end,
})

local function craftMaterials()
    local args = {
        [1] = materialsInputValue
    }
    ReplicatedStorage:WaitForChild("Event"):WaitForChild("Train"):FireServer(unpack(args))
end

local craftButton = Tab:CreateButton({
    Name = "Give Materials",
    Callback = function()
        craftMaterials()
    end,
})

local quantity = ""

local quantityInput = Tab:CreateInput({
    Name = "Weapons",
    CurrentValue = "",
    PlaceholderText = "Enter how many weapons to give",
    RemoveTextAfterFocusLost = false,
    Flag = "QuantityInput",
    Callback = function(Text)
        quantity = tonumber(Text) or 1
    end,
})

local function craftWeapon()
    local args = {
        [1] = "Stick",
        [2] = quantity
    }
    ReplicatedStorage:WaitForChild("Event"):WaitForChild("CraftWeapon"):FireServer(unpack(args))
end

local craftButton = Tab:CreateButton({
    Name = "Give Weapon",
    Callback = function()
        craftWeapon()
    end,
})

local moneyToGive = ""

local moneyInput = Tab:CreateInput({
    Name = "Money to Give",
    CurrentValue = "",
    PlaceholderText = "Enter amount of money to give",
    RemoveTextAfterFocusLost = false,
    Flag = "MoneyInput",
    Callback = function(Text)
        local numberInput = tonumber(Text)
        if numberInput then
            moneyToGive = numberInput
        else
            print("Please enter a valid number.")
        end
    end,
})

local function giveMoney()
    local args = {
        [1] = moneyToGive,
        [2] = 1
    }
    ReplicatedStorage:WaitForChild("Event"):WaitForChild("SellWeapon"):FireServer(unpack(args))
end

local giveMoneyButton = Tab:CreateButton({
    Name = "Give Money",
    Callback = function()
        giveMoney()
    end,
})

local titleToSet = ""

local titleInput = Tab:CreateInput({
    Name = "Title",
    CurrentValue = "",
    PlaceholderText = "Enter your title",
    RemoveTextAfterFocusLost = false,
    Flag = "TitleInput",
    Callback = function(Text)
        titleToSet = Text
    end,
})

local function setTitle()
    local args = {
        [1] = titleToSet,
        [2] = 0
    }
    ReplicatedStorage:WaitForChild("Event"):WaitForChild("BuyPower"):FireServer(unpack(args))
end

local setTitleButton = Tab:CreateButton({
    Name = "Set Title",
    Callback = function()
        setTitle()
    end,
})

































































































































































































































































































































































































































































































































































































































































































































































































































































































































































