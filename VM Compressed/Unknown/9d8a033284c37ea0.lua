-- Script Protegido Por LxnnyyEzystek - Script Protected By LxnnyyEzystek
local a1B2c3=loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
local d4E5f6=a1B2c3:CreateWindow({
   Name="👾Gean Hub👾",
   Icon=0,
   LoadingTitle="👾Gean Hub👾",
   LoadingSubtitle="by LxnnyLyax ft. gean0495 on roblox",
   Theme="Amethyst",
   DisableRayfieldPrompts=false,
   DisableBuildWarnings=false,
   ConfigurationSaving={Enabled=true, FolderName=nil, FileName="Your Saves LOL!"},
   Discord={Enabled=false, Invite="noinvitelink", RememberJoins=true},
   KeySystem=true,
   KeySettings={Title="gean0495", Subtitle="gean0495", Note="No method of obtaining the key is provided", FileName="Key", SaveKey=true, GrabKeyFromSite=false, Key={"gean0495"}}
})

local g7H8I9=d4E5f6:CreateTab("💫 Home", nil)
local j0K1L2=g7H8I9:CreateSection("💖 Principal - Main")

a1B2c3:Notify({
   Title="Tu Executou Com Sucesso Meu Amigo!",
   Content="Boa Sorte Gean! Espero Que Goste Do Script, Atualização Em Breve!",
   Duration=5.5,
   Image=4483362458,
})

local m3N4O5={ 
   ["🏎️Car Dealership Tycoon"]="https://raw.githubusercontent.com/gumanba/Scripts/main/CarDealershipPagani",
   ["🎟️Infinite Yield v6.2"]='https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source',
   ["🏠Brookhaven RP - Rael Hub"]="https://raw.githubusercontent.com/Laelmano24/Rael-Hub/main/main.txt",
   ["🥷Delta Keyboard For Reverse"]="https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt",
   ["🔫Gun Grounds FFA AimBot"]="https://raw.githubusercontent.com/Jonthedruger/LatvixDoc/script/idkgamenameforgot.lua",
   ["🌱BeanzHub"]="https://raw.githubusercontent.com/pid4k/scripts/main/BeanzHub.lua",
   ["🟦Shiftlock"]="https://rawscripts.net/raw/Universal-Script-Shiftlock-22314",
   ["🐇Bunny Hop Script, Auto Jump"]="https://rawscripts.net/raw/Universal-Script-Bunny-Hop-Script-22209"
}

for p1Q2R3,s4T5U6 in pairs(m3N4O5) do 
   g7H8I9:CreateButton({
      Name=p1Q2R3,
      Callback=function() 
         loadstring(game:HttpGet(s4T5U6))() 
      end
   })
end