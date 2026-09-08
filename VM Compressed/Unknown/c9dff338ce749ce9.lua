local ArgetnarLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Library/main/ArgetnarLibrary.lua"))()
local win = ArgetnarLib:Window("Argetnar Hub")
ArgetnarLib:Notify("KeyHub", "Yuor in!")
local TabKey = win:Tab("Key")

loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/Key.lua"))()


function MakeScriptHub()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/Sheep%20Tycoon.lua"))()
end

function CorrectKeyNotifications()
ArgetnarLib:Notify("KeyHub", "Key Correct!")
end

function WrongKeyNotifications()
ArgetnarLib:Notify("KeyHub", "Key Wrong!")
end

function GetKeyNotifications()
ArgetnarLib:Notify("KeyHub", "Discord Link Copied =)")
end
TabKey:TextBox("Enter Key", function(Value)
       _G.KeyInput = Value
end)
TabKey:Button("Check Key!", function()
            if _G.KeyInput == _G.EnterKey then
			CorrectKeyNotifications()
			wait(3)
         MakeScriptHub()
     else
        WrongKeyNotifications()
        end
end)
TabKey:Button("GetKey", function()
          		setclipboard("https://discord.gg/w7H6G66xCK")
			  GetKeyNotifications()
end)
