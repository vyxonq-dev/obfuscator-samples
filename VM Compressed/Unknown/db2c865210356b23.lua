loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/UI-Library/refs/heads/main/Ghost%20Gui'))() 

game.CoreGui.GhostGui.MainFrame.Title.Text = "Cuong Hub"

---

AddContent("Toogle", "Esok", [[ 

local args = {

	"Esok Sekolah"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckBought"):InvokeServer(unpack(args))

]])

AddContent("Toogle", "Karkerkar", [[ 

local args = {

	"KarKerKar KurKur"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckBought"):InvokeServer(unpack(args))

]])

AddContent("Toogle", "Ketchuru", [[ 

local args = {

	"Ketchuru and Musturu"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckBought"):InvokeServer(unpack(args))

]])

AddContent("Toogle", "Smurf Cat", [[ 

local args = {

	"Smurf Cat"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckBought"):InvokeServer(unpack(args))

 

]])

AddContent("Toogle", "Spaghetti", [[ 

local args = {

	"Spaghetti Tualetti"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("CheckBought"):InvokeServer(unpack(args))

]])

game:GetService("StarterGui"):SetCore("SendNotification",{

Title = "Welcome To Cuong Hub",

Text = "Script Farm A Brainrot", 

Duration = 3

})