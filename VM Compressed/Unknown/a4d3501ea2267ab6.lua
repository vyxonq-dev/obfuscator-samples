local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("SBPT")

local KillingCheats = PhantomForcesWindow:NewSection("TP Sec.1")

KillingCheats:CreateButton("Brazil", function()
    game:GetService("TeleportService"):Teleport(7234087065)
print("HI")
end)

KillingCheats:CreateButton("100 players", function()
    game:GetService("TeleportService"):Teleport(8550289322)
print("HI")
end)

KillingCheats:CreateButton("Place N.39", function()
    game:GetService("TeleportService"):Teleport(8550291053)
print("HI")
end)

KillingCheats:CreateButton("No oneshot", function()
    game:GetService("TeleportService"):Teleport(9015014224)
print("HI")
end)

KillingCheats:CreateButton("Testing place", function()
    game:GetService("TeleportService"):Teleport(9020359053)
print("HI")
end)

local KillingCheats = PhantomForcesWindow:NewSection("TP Sec.2")

KillingCheats:CreateButton("Glove customization", function()
    game:GetService("TeleportService"):Teleport(9068206286)
print("HI")
end)

KillingCheats:CreateButton("Slap royale queue", function()
    game:GetService("TeleportService"):Teleport(9412139218)
print("HI")
end)

KillingCheats:CreateButton("Ice essence", function()
    game:GetService("TeleportService"):Teleport(17290438723)
print("HI")
end)

KillingCheats:CreateButton("M-making", function()
    game:GetService("TeleportService"):Teleport(9426735655)
print("HI")
end)

KillingCheats:CreateButton("Slap royale matchmaking", function()
    game:GetService("TeleportService"):Teleport(9426795465)
print("HI")
end)

local KillingCheats = PhantomForcesWindow:NewSection("TP Sec.3")

KillingCheats:CreateButton("Slap royale", function()
    game:GetService("TeleportService"):Teleport(9431156611)
print("HI")
end)

KillingCheats:CreateButton("??? m", function()
    game:GetService("TeleportService"):Teleport(11359765900)
print("HI")
end)

KillingCheats:CreateButton("??", function()
    game:GetService("TeleportService"):Teleport(11367956190)
print("HI")
end)

KillingCheats:CreateButton("KS only", function()
    game:GetService("TeleportService"):Teleport(11520107397)
print("HI")
end)

KillingCheats:CreateButton("Experimental place", function()
    game:GetService("TeleportService"):Teleport(12432152490)
print("HI")
end)

local KillingCheats = PhantomForcesWindow:NewSection("TP Sec.4")

KillingCheats:CreateButton("Soft updating dododo", function()
    game:GetService("TeleportService"):Teleport(12712288037)
print("HI")
end)

KillingCheats:CreateButton("Slap battles A", function()
    game:GetService("TeleportService"):Teleport(12845859004)
print("HI")
end)

KillingCheats:CreateButton("200 players", function()
    game:GetService("TeleportService"):Teleport(13592060273)
print("HI")
end)

KillingCheats:CreateButton("The dark realm", function()
    game:GetService("TeleportService"):Teleport(13833961666)
print("HI")
end)

KillingCheats:CreateButton("The null zone", function()
    game:GetService("TeleportService"):Teleport(14422118326)
print("HI")
end)

local KillingCheats = PhantomForcesWindow:NewSection("TP Sec.5")

KillingCheats:CreateButton("Tower defence", function()
    game:GetService("TeleportService"):Teleport(15228348051)
print("HI")
end)

KillingCheats:CreateButton("Christmas event", function()
    game:GetService("TeleportService"):Teleport(15507333474)
print("HI")
end)

KillingCheats:CreateButton("The C", function()
    game:GetService("TeleportService"):Teleport(15880267452)
print("HI")
end)

KillingCheats:CreateButton("Staff application", function()
    game:GetService("TeleportService"):Teleport(16034567693)
print("HI")
end)
KillingCheats:CreateButton("SR matchmaking testing", function()
    game:GetService("TeleportService"):Teleport(16467982597)
print("HI")
end)

local KillingCheats = PhantomForcesWindow:NewSection("TP Sec.6")

KillingCheats:CreateButton("?", function()
    game:GetService("TeleportService"):Teleport(11828384869)
print("HI")
end)

KillingCheats:CreateButton("Where Guide Resides", function()
    game:GetService("TeleportService"):Teleport(18550498098)
print("HI")
end)

KillingCheats:CreateButton("knnyism's Place: 07282024_1", function()
    game:GetService("TeleportService"):Teleport(18698003301)
print("HI")
end)

KillingCheats:CreateButton("Binded maze", function()
    game:GetService("TeleportService"):Teleport(74169485398268)
print("HI")
end)

KillingCheats:CreateButton("Dev_crow's Place: 10102024_2", function()
    game:GetService("TeleportService"):Teleport(89837553336708)
print("HI")
end)

local KillingCheats = PhantomForcesWindow:NewSection("Extras")

KillingCheats:CreateButton("SB hub updated", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Slap%20battles.lua"))()
print("HI")
end)

KillingCheats:CreateButton("Fly gui", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Fly.lua'))()
print("HI")
end)

KillingCheats:CreateButton("tp tool", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Teleport_Tool.lua'))()
print("HI")
end)

KillingCheats:CreateButton("join small server", function()
        local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
  local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
  return Http:JSONDecode(Raw)
end

local Server, Next; repeat
  local Servers = ListServers(Next)
  Server = Servers.data[1]
  Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
print("HI")
end)

KillingCheats:CreateButton("Anti afk", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/ANTI_AFK.lua'))()
print("HI")
end)
