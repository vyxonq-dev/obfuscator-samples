local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Cuong Hub V2", "RJTheme3")
local Tab = Window:NewTab("Update")
local Section = Tab:NewSection(":)")
local Tab = Window:NewTab("Buy Egg")
local Section = Tab:NewSection("Egg")
Section:NewButton("Sea Monster", "ButtonInfo", function()
local args = {
    [1] = "Sea Monster Egg";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("PurchaseEggFunc", 9e9):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Postie"):WaitForChild("Sent"):FireServer(unpack(args))
end)
Section:NewButton("Wild Shark", "ButtonInfo", function()
local args = {
    [1] = "Wild Shark Egg";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("PurchaseEggFunc", 9e9):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Postie"):WaitForChild("Sent"):FireServer(unpack(args))
end)
Section:NewButton("Dragon", "ButtonInfo", function()
local args = {
    [1] = "Dragon Egg";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("PurchaseEggFunc", 9e9):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Postie"):WaitForChild("Sent"):FireServer(unpack(args))
end)
Section:NewButton("Orchidra", "ButtonInfo", function()
local args = {
    [1] = "Orchidra Egg";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("PurchaseEggFunc", 9e9):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Postie"):WaitForChild("Sent"):FireServer(unpack(args))
end)
Section:NewButton("Venom Dragon", "ButtonInfo", function()
local args = {
    [1] = "Venom Dragon Egg";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("PurchaseEggFunc", 9e9):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Postie"):WaitForChild("Sent"):FireServer(unpack(args))
end)
Section:NewButton("Dreadmaw", "ButtonInfo", function()
local args = {
    [1] = "Dreadmaw Egg";
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("PurchaseEggFunc", 9e9):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Postie"):WaitForChild("Sent"):FireServer(unpack(args))
end)
local Tab = Window:NewTab("Owner Script")
local Section = Tab:NewSection("NEL_Ejiro")