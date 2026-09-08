local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Scary Spelling", "DarkTheme")

local Tab = Window:NewTab("Main")

local Section = Tab:NewSection("Cheats")

Section:NewButton("Helper Gui", "", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Loader"))()
end)

local Section = Tab:NewSection("Field Of View")

Section:NewSlider("FOV", "", 120, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    workspace.Camera.FieldOfView = s
end)

local Tab = Window:NewTab("Long Words")

local Section = Tab:NewSection("deoxyribonucleic")

local Section = Tab:NewSection("discombobulate")

local Section = Tab:NewSection("unconstitutional")

local Section = Tab:NewSection("mathematics")

local Section = Tab:NewSection("spectacular")

local Section = Tab:NewSection("tantamount")

local Section = Tab:NewSection("serendipity")

local Section = Tab:NewSection("perfidious")

local Section = Tab:NewSection("juxtaposition")

local Section = Tab:NewSection("architecture")

local Section = Tab:NewSection("rejuvenate")

local Section = Tab:NewSection("hedgehog")

local Section = Tab:NewSection("meteorology")

local Section = Tab:NewSection("investigator")

local Section = Tab:NewSection("incongruous")

local Section = Tab:NewSection("phenomenon")

local Section = Tab:NewSection("kaleidoscope")

local Section = Tab:NewSection("gauge")

local Section = Tab:NewSection("sustainability")

local Section = Tab:NewSection("microscope")

local Section = Tab:NewSection("bureaucracy")

local Section = Tab:NewSection("hypothermic")

local Section = Tab:NewSection("cartography")

local Section = Tab:NewSection("hydroelectric")

local Section = Tab:NewSection("surveillance")

local Section = Tab:NewSection("electricity")

local Section = Tab:NewSection("handkerchief")

local Section = Tab:NewSection("heterogeneous")

local Section = Tab:NewSection("temperamental")

local Section = Tab:NewSection("extemporaneous")

local Section = Tab:NewSection("ubiquitous")

local Section = Tab:NewSection("parliamentary")

local Section = Tab:NewSection("archaeologist")

local Section = Tab:NewSection("paleontology")

local Section = Tab:NewSection("responsibility")

local Section = Tab:NewSection("technology")

local Section = Tab:NewSection("cytokinesis")