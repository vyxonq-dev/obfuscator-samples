loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/UI-Library/refs/heads/main/Ghost%20Gui'))() 

game.CoreGui.GhostGui.MainFrame.Title.Text = "Cuong Hub"

---

AddContent("TextButton", "fullbright", [[ 

local Light = game:GetService("Lighting")



function dofullbright()

Light.Ambient = Color3.new(1, 1, 1)

Light.ColorShift_Bottom = Color3.new(1, 1, 1)

Light.ColorShift_Top = Color3.new(1, 1, 1)

end



dofullbright()



Light.LightingChanged:Connect(dofullbright)

]])

AddContent("TextButton", "Infinite Yield", [[ 

loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()

]])

AddContent("TextButton", "Fly", [[ 

loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()

]])

game:GetService("StarterGui"):SetCore("SendNotification",{

Title = "Welcome To Cuong Hub",

Text = "Creator Nel_huuthinh", 

Button1 = "Tysm",

Button2 = "Ok",

Duration = 30 

})