if not game:IsLoaded() then game.Loaded:Wait() end
if game.GameId~=1722988797  then
    error("this isnt space sailors code wont run")
    return
end

local http=game:GetService("HttpService")
if not game:IsLoaded() then game.Loaded:Wait() end
local Init=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownMoons/SpaceSailors-Auto-Farm/refs/heads/main/AutoFarm-v1.0.0.lua"))()
end
local FileName="Save.JSON"
local AutoFarm
if not isfile(FileName) then
    Init()
end
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()
local MainData
local a=readfile(FileName)
local data=http:JSONDecode(a)
MainData=data
AutoFarm=MainData.AutoFarm
function SaveData()
    local data=http:JSONEncode(MainData)
    delfile(FileName)
    writefile(FileName,data)
    MainData=http:JSONDecode(readfile(FileName))
    Init()
    print("saved")
end


local UI = Lib:Create{
   Theme = "Dark", -- or any other theme
   Size = UDim2.new(0, 555, 0, 400) -- default
}
local Main = UI:Tab{
   Name = "Space Sailors"
}
local Divider = Main:Divider{
   Name = "Auto Farm"
}
local QuitDivider = Main:Divider{
   Name = "Quit"
}
local autofarm=Divider:Toggle{
    Name="Auto Farm",
    Description="If disabled wait for the current auto farm to complete",
    State=MainData.AutoFarm,
    Callback=function(state)
        

        MainData.AutoFarm=state
        local data=http:JSONEncode(MainData)
        delfile(FileName)
        writefile(FileName,data)
        MainData=http:JSONDecode(readfile(FileName))
        Init()
        print("saved")
        Init()
        
    end
}
local Quit = QuitDivider:Button{
   Name = "Close Ui",
   Callback = function()
       UI:Quit{
           Message = "Closed", -- closing message
           Length = 1 -- seconds the closing message shows for
       }
   end
}
Init()

