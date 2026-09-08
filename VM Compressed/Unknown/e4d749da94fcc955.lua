local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Services
local Workspace = (workspace);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");
local GuiService = game:GetService("GuiService");
local CoreGui = game:GetService("CoreGui");
local RunService = game:GetService("RunService")

-- Variables
local Cleanup = { InfiniteBullets = false, AntiSpawn = false, DistanceFarm = false, CartNoclip = false };
local LocalPlayer = Players.LocalPlayer

local Equip = ReplicatedStorage.GetEquipped
local Shoot = ReplicatedStorage.Shoot
local PurchaseCart = ReplicatedStorage.PurchaseCart
local PurchaseBullet = ReplicatedStorage.PurchaseBullet
local Forward = ReplicatedStorage.Forward
local Carts = Workspace.GameCarts

-- UI
local Window = Fluent:CreateWindow({
    Title = "Ride A Cart Down A Slide",
    SubTitle = "v1.0.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 400),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl,
})

local Tabs = ({
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
});

-- Functions
local LoopFunctions = {}
local GetHumanoid = function()
    local Character = LocalPlayer.Character
    local Humanoid = Character.FindFirstChildOfClass(Character, "Humanoid")

    return Humanoid
end

local GetEquippedCart = function()
    return (LocalPlayer.EquippedCart.Value or "Default");
end

local GetSeatedCart = function()
    local Humanoid = GetHumanoid()
    local Root = Humanoid.RootPart
    
    local SeatPart = Humanoid.SeatPart
    local Cart = SeatPart and SeatPart.FindFirstAncestorOfClass(SeatPart, "Model")

    return Cart
end

local RespawnCart = function()
    local Humanoid = GetHumanoid();
    local Root = (Humanoid.RootPart);
    local OldCoordinate = (Root.CFrame);

    Humanoid.Sit = false
    Equip:InvokeServer(GetEquippedCart());

    repeat
        task.wait();
    until (Humanoid.Sit)

    for _ = 1, 10 do
        local SeatPart = (Humanoid.SeatPart);
        local Cart = SeatPart and SeatPart:FindFirstAncestorOfClass("Model");

        if (Cart) then
            Cart:PivotTo(OldCoordinate);
        end

        task.wait(0.1);
    end
end

local SetCollision = function(Target, State)
    if (not Target) then
        return
    end

    for _, BasePart in next, (Target:GetDescendants()) do
        if (BasePart:IsA("BasePart")) then
            BasePart.CanCollide = State
        end
    end
end

local NoclipCart = function(Cart: Model)
    if (Cart:IsA("Model") and Cleanup.CartNoclip) then
        local PlayerValue = Cart:FindFirstChild("Player");
        local Owner = (PlayerValue and PlayerValue.Value);
        local Player = (Owner and Players:FindFirstChild(Owner));
        local Character = (Player and Player.Character);

        if (Owner ~= LocalPlayer.Name) then
            SetCollision(Cart, false);
            SetCollision(Character, false);

            Cart.ChildAdded:Connect(function(Child)
                if (Child:IsA("BasePart")) then
                    SetCollision(Cart, false);
                end
            end)
        end
    end
end

-- Components
--> Home
Tabs.Home:AddSection("Equip")
Tabs.Home:AddDropdown("Dropdown", {
    Title = "Equip Cart",
    Description = "Select a Cart you'd like to equip (paid carts in robux most likely will not work!)",
    Values = (function()
        local Values = {}

        for _, Cart in next, (ReplicatedStorage.NewCarts:GetChildren()) do
            if (Cart:IsA("Model")) then
                table.insert(Values, Cart.Name);
            end
        end

        return Values
    end)(),
    Multi = false,
    Default = 1,
}):OnChanged(function(Value)
    PurchaseCart:FireServer(Value, 0, 100);
    Fluent:Notify({
        Title = "Cart",
        Content = ("Changed cart to %s"):format(Value),
        Duration = 3
    })
end)

Tabs.Home:AddDropdown("Dropdown", {
    Title = "Equip Bullet",
    Description = "Select a Bullet you'd like to equip (changes the amount of bullets you have)",
    Values = (function()
        local Values = {}

        for _, Bullet in next, (ReplicatedStorage.NewBullets:GetChildren()) do
            table.insert(Values, Bullet.Name);
        end

        return Values
    end)(),
    Multi = false,
    Default = 1,
}):OnChanged(function(Value)
    PurchaseBullet:FireServer(Value, 0);
    Fluent:Notify({
        Title = "Bullet",
        Content = ("Changed bullet to %s"):format(Value),
        Duration = 1
    })
end)

Tabs.Home:AddButton({
    Title = "Spawn Cart",
    Callback = function()
        Equip:InvokeServer(GetEquippedCart());
    end
})

Tabs.Home:AddButton({
    Title = "Respawn Cart",
    Description = "Respawns your cart to your current location",
    Callback = RespawnCart,
})

Tabs.Home:AddSection("Free Gamepasses")
Tabs.Home:AddToggle("InfiniteBullets", {
    Title = "Infinite Bullets", 
    Description = "Respawns your cart after shooting to give you infinite bullets",
    Default = Cleanup.InfiniteBullets,
    Callback = function(State)
	    Cleanup.InfiniteBullets = State

        if (State) then
            PurchaseBullet:FireServer("Big", 0);
        end
    end 
})

Tabs.Home:AddToggle("CartNoclip", {
    Title = "Cart Noclip", 
    Description = "Allows your cart to go through other carts",
    Default = Cleanup.CartNoclip,
    Callback = function(State)
	    Cleanup.CartNoclip = State
    end 
})

Tabs.Home:AddButton({
    Title = "Infinite Flips",
    Callback = function()
        LocalPlayer.Passes.CanFlip.Value = true
        Fluent:Notify({
            Title = "Infinite Flips",
            Content = "Enabled",
            Duration = 1
        })
    end
})

Tabs.Home:AddSection("Trolling")
Tabs.Home:AddToggle("AntiSpawn", {
    Title = "Anti Cart Spawn", 
    Description = "Makes players not able to spawn their carts",
    Default = Cleanup.AntiSpawn,
    Callback = function(State)
	    Cleanup.AntiSpawn = State

        if (not State) then
            local Humanoid = GetHumanoid();
            task.wait(0.5);
            Humanoid:SetStateEnabled("Seated", true);
		    Humanoid.Sit = false
        else
            LoopFunctions.AntiSpawn();
        end
    end 
})

Tabs.Home:AddSection("Grinding")
Tabs.Home:AddToggle("DistanceGrinding", {
    Title = "Distance AFK Farm", 
    Description = "Farms for distance (recommended to use multiplier farm first)",
    Default = Cleanup.DistanceFarm,
    Callback = function(State)
	    Cleanup.DistanceFarm = State

        if (State) then
            if (Cleanup.AntiSpawn) then
                Fluent:Notify({
                    Title = "Warning",
                    Content = "It is recommended to disable Anti Cart Spawn (while using Distance Farm)",
                    Duration = 5
                })
            end

            LoopFunctions.DistanceFarm();
        end
    end 
})

Tabs.Home:AddButton({
    Title = "Multiplier Farm (testing)",
    Description = "Farms for distance multiplier (rejoins a bunch of times in process), to stop: close roblox",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/projects/refs/heads/main/RideACartDownASlide/MultiplierFarmer.luau"))();
    end
})

--> Settings
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

-- Init
local OldCleanup = getgenv().Cleanup
local OldWindow = getgenv().FluentWindow

if (OldWindow) and (OldCleanup) then
    getgenv().FluentWindow:Destroy()

    for Name, Object in next, OldCleanup do
        if (typeof(Object) == "RBXScriptConnection") then
            Object:Disconnect();
        elseif (typeof(Object) == "boolean") then
            OldCleanup[Name] = (false);
        end
    end
end

getgenv().FluentWindow = Window
getgenv().Cleanup = Cleanup
Window:SelectTab(1)

LoopFunctions.AntiSpawn = function()
    PurchaseBullet:FireServer("Default", 0);

    repeat task.wait(0.5)
        if (not Cleanup.AntiSpawn) then
            break
        end

        local Button = Workspace.UnorganisedParts.Button
        local Humanoid = GetHumanoid()
        local RootPart = Humanoid and Humanoid.RootPart

        if (Button and RootPart) then
            task.spawn(function()
                Shoot:FireServer();
                Equip:InvokeServer(GetEquippedCart()); 
            end)
        end

        if (Humanoid) then
            Humanoid:SetStateEnabled("Seated", false);
            Humanoid.Sit = true
        end
    until (not Window)
end

LoopFunctions.DistanceFarm = function()
    Equip:InvokeServer(GetEquippedCart());

    task.wait(2);

    repeat
        if (not Cleanup.DistanceFarm) then
            break
        end

        local Cart = GetSeatedCart();

        if (Cart) then
            local Velocity = Instance.new("BodyAngularVelocity");
            Velocity.MaxTorque = Vector3.new(0, 9e9, 0);
            Velocity.AngularVelocity = Vector3.new(0, 50, 0);
            Velocity.Parent = Cart.PrimaryPart

            Cart.PrimaryPart:ApplyImpulse(Vector3.new(0, 10000000, math.random(100000, 1000000)))
            Forward:FireServer("norm");
        end

        task.wait(1)
    until (not Window)
end

local Old; Old = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod();

    if (not checkcaller()) and (Cleanup.InfiniteBullets) and (self == Shoot) and (Method == "FireServer") then
        local CurrentCart = GetSeatedCart();
        local CurrentBullets = CurrentCart and CurrentCart.NewBulletsAmount
        local Amount = (CurrentBullets and tonumber(CurrentBullets.Value)) or 0

        if (Amount <= 1) then
            task.delay(0.5, RespawnCart);
        end
    end

    return Old(self, ...);
end);

GuiService:SetGameplayPausedNotificationEnabled(false); -- gets rid of the gameplay paused screen that's pretty annoying
CoreGui.PurchasePromptApp.Enabled = false -- since this game likes to spam purchase prompts whenever you fire the shoot remote
table.insert(Cleanup, RunService.RenderStepped:Connect(function()
    if (Cleanup.CartNoclip) then
        for _, Cart in next, (Carts:GetChildren()) do
            NoclipCart(Cart);
        end
    end
end))
