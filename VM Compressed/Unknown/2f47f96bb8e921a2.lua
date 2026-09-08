game.StarterGui:SetCore("SendNotification", {
    Title = "Neverlose.net"; 
    Text = "Injected Successfully"; 
    Icon = ""; 
    Duration = 5;
    Callback = bindableFunction;
    Button1 = "";  
    Button2 = "";
})

game.StarterGui:SetCore("SendNotification", {
    Title = "Neverlose.net"; 
    Text = "THE HUB NO LONGER FLICKERS  and i removed the broken scripts"; 
    Icon = ""; 
    Duration = 5;
    Callback = bindableFunction;
    Button1 = "";  
    Button2 = "";
})

game.StarterGui:SetCore("SendNotification", {
    Title = "Neverlose.net"; 
    Text = "Made by Fsploit powered by Exploit X"; 
    Icon = ""; 
    Duration = 5;
    Callback = bindableFunction;
    Button1 = "";  
    Button2 = "";
})


local Library = loadstring(game:HttpGet("https://bitbucket.org/cat__/uis/raw/Loady/Module"), "Neverlose net")()
local Window = Library:Window("Neverlose.net", function(Script)
        loadstring(game:HttpGet(Script))()
end)

Window:Game({
   Place = 13772394625,
   Status = "Working",
   Script = "https://raw.githubusercontent.com/k00pz/Fsploit-boredom/main/Mainly-Fsploit-Exploit-X%20better%20hacks%20better%20days%2012%2019%2010",
   UpdateDate = Window:GetDate("Local", "3/13/24"),
   Creator = "Fsploit"
})

Window:Game({
   Place = 621129760,
   Status = "Working",
   Script = "https://raw.githubusercontent.com/k00pz/Kat-NEVERWIN/main/Akaka",
   UpdateDate = Window:GetDate("Local", "3/13/24"),
   Creator = "Fsploit"
})

Window:Game({
   Place = 2788229376,
   Status = "Working",
   Script = "https://raw.githubusercontent.com/k00pz/Abakads/main/Ahahahha",
   UpdateDate = Window:GetDate("Local", "3/13/24"),
   Creator = "Fsploit"
})

Window:Initiate()

