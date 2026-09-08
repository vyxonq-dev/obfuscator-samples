local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game.Players.LocalPlayer.DisplayName
local User = game.Players.LocalPlayer.Name

local function Notify(T, C, D, I)
    Rayfield:Notify({
       Title = T or "Notification Title",
       Content = C or "Notification Content",
       Duration = D or 0,
       Image = I or 4483362458,
    })
end

local Window = Rayfield:CreateWindow({
   Name = "Obby Creator: Troll Gui",
   Icon = 0,
   LoadingTitle = "Loading",
   LoadingSubtitle = "0-o",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "OC"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"amgis"}
   }
})

local H = Window:CreateTab("Home", 4483362458)
H:CreateLabel("Welcome! " .. Player .. " (" .. User .. ") Thank you for using my script! :)", 4483362458, Color3.fromRGB(255, 255, 255), false)
H:CreateParagraph({Title = "This script is open-source", Content = "Feel free to improve or take parts of the code, Credits are appreciated!"})

H:CreateButton({
    Name = "Remove UI",
    Callback = function()
        Notify("Notification!", "Removing UI :(", 3, 4483362458)
        wait(3.5)
        Rayfield:Destroy()
    end,
})

H:CreateButton({
    Name = "Join Discord Server",
    Callback = function()
        Notify("Notification!", "Copied Discord Server Link!", 3, 4483362458)
        setclipboard("https://discord.gg/y2jW3MUxdx")
    end,
})

local M = Window:CreateTab("Main (Visual)", 4483345998)

local playerNames = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

local obby

local UserO = M:CreateDropdown({
   Name = "Select User Obby",
   Options = playerNames,
   CurrentOption = "None",
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(Selected)
       if type(Selected) == "table" then
           plrname = Selected[1]
       else
           plrname = Selected
       end

       obby = workspace.Obbies:FindFirstChild(plrname)
       if obby then
           Notify("Notification!", "Selected " .. plrname .. "'s obby!", 3, 4483362458)
       else
           Notify("Warning!", "Obby not found for " .. plrname .. "!", 3, 4483362458)
       end
   end,
})

local playerNames = {}

local function updatePlayerNames()
    playerNames = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
end

M:CreateButton({
   Name = "Refresh User Obby",
   Callback = function()
       updatePlayerNames()
       UserO:Refresh(playerNames)
       Notify("Notification!", "User Obby list refreshed!", 3, 4483362458)
   end,
})

M:CreateDropdown({
   Name = "Skybox Changer (Visual)",
   Options = {"Alien Sunset","Approaching Neptune","Black","Blue Skies","Dark Night","Deep Blue Sky","Deep Space Purple","Default","Dreamy Ocean","Dusty Clouds","Green","Light Night Sky","Mountain Night","Mountains","Open Ocean","Orange Sky","Orbital Scenery","Purple Nebula","Rainy Day","Retro","Rocky Volcanoes","Setting Sun","Stormy Days","The Sky","White"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "Dropdown2",
   Callback = function(Options)
       if obby and obby:FindFirstChild("Skybox") then
           obby.Skybox.Value = Options[1]
       else
           Notify("Warning!", "Obby or Skybox property not found!", 3, 4483362458)
       end
   end,
})

local function safeSet(propertyPath, value, message)
    if obby then
        local property = obby
        for _, part in ipairs(propertyPath) do
            if property:FindFirstChild(part) then
                property = property[part]
            else
                Notify("Warning!", message, 3, 4483362458)
                return
            end
        end
        property.Value = value
    else
        Notify("Warning!", "No obby selected!", 3, 4483362458)
    end
end

M:CreateInput({
   Name = "Jump Limit (FE) [Only work on selected obby]",
   CurrentValue = "",
   PlaceholderText = "0 is inf (only you can use it)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
       safeSet({"JumpLimit"}, Text, "Jump Limit property not found!")
   end,
})

M:CreateInput({
   Name = "Music ID (Visual)",
   CurrentValue = "",
   PlaceholderText = "Music ID here",
   RemoveTextAfterFocusLost = false,
   Flag = "Input2",
   Callback = function(Text)
       safeSet({"MusicId"}, Text, "Music ID property not found!")
   end,
})

M:CreateInput({
   Name = "Walkspeed (FE) [Only work on selected obby]",
   CurrentValue = "",
   PlaceholderText = "0 is unwalkable (only you can use it)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input3",
   Callback = function(Text)
       safeSet({"Avatar", "Walk"}, Text, "Walkspeed property not found!")
   end,
})

M:CreateInput({
   Name = "Jump Power (FE) [Only work on selected obby]",
   CurrentValue = "",
   PlaceholderText = "0 is unjumpable (only you can use it)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input4",
   Callback = function(Text)
       safeSet({"Avatar", "Jump"}, Text, "Jump Power property not found!")
   end,
})

M:CreateInput({
   Name = "Gravity (FE) [Only work on selected obby]",
   CurrentValue = "",
   PlaceholderText = "0 is floating (only you can use it)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input5",
   Callback = function(Text)
       safeSet({"GravityVal"}, Text, "Gravity property not found!")
   end,
})

M:CreateInput({
   Name = "Minimum Zoom (Visual) [Only work on selected obby]",
   CurrentValue = "",
   PlaceholderText = "(only you can use it)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input6",
   Callback = function(Text)
       safeSet({"Camera", "MinZoom"}, Text, "Minimum Zoom property not found!")
   end,
})

M:CreateInput({
   Name = "Maximum Zoom (Visual) [Only work on selected obby]",
   CurrentValue = "",
   PlaceholderText = "(only you can use it)",
   RemoveTextAfterFocusLost = false,
   Flag = "Input7",
   Callback = function(Text)
       safeSet({"Camera", "MaxZoom"}, Text, "Maximum Zoom property not found!")
   end,
})

M:CreateInput({
   Name = "Change Obby ID (Visual)",
   PlaceholderText = "Enter new Obby ID",
   Flag = "Input8",
   Callback = function(Text)
       if obby then
           local idLabel = obby.GetObby.NamePlate.Star.IdGui:FindFirstChild("TextLabel")
           if idLabel:IsA("TextLabel") then
               idLabel.Text = "ObbyID: " .. Text
               obby:FindFirstChild("IdVAL").Value = Text
               Notify("Notification!", "Obby ID changed!", 3, 4483362458)
           else
               Notify("Warning!", "Obby ID text not found!", 3, 4483362458)
           end
       else
           Notify("Warning!", "No obby selected!", 3, 4483362458)
       end
   end
})

M:CreateInput({
   Name = "Change Obby Creator (Visual)",
   PlaceholderText = "Enter new creator name",
   Flag = "Input9",
   Callback = function(Text)
       if obby then
           local creatorLabel = obby.GetObby.NamePlate.Main.SurfaceGui:FindFirstChild("TextLabel")
           if creatorLabel:IsA("TextLabel") then
               creatorLabel.Text = Text
               obby.OwnerNameVAL.Value = Text
               Notify("Notification!", "Obby Creator changed!", 3, 4483362458)
           else
               Notify("Warning!", "Obby Creator text not found!", 3, 4483362458)
           end
       else
           Notify("Warning!", "No obby selected!", 3, 4483362458)
       end
   end
})

M:CreateInput({
   Name = "Change Obby Name (Visual)",
   PlaceholderText = "Enter new obby name",
   Flag = "Input10",
   Callback = function(Text)
       if obby then
           local obbyNameLabel = obby.GetObby.Ratings.NameBit.SurfaceGui:FindFirstChild("TextLabel")
           if obbyNameLabel:IsA("TextLabel") then
               obbyNameLabel.Text = Text
               obby.ObbyNameVAL.Value = Text
               Notify("Notification!", "Obby Name changed!", 3, 4483362458)
           else
               Notify("Warning!", "Obby Name text not found!", 3, 4483362458)
           end
       else
           Notify("Warning!", "No obby selected!", 3, 4483362458)
       end
   end
})

M:CreateInput({
   Name = "Spoof Like Count (Visual)",
   PlaceholderText = "Enter like count",
   Flag = "Input11",
   Callback = function(Text)
       if obby then
           local likeLabel = obby.GetObby.Ratings.Likes.SurfaceGui:FindFirstChild("TextLabel")
           if likeLabel:IsA("TextLabel") then
               likeLabel.Text = Text
               Notify("Notification!", "Like count changed!", 3, 4483362458)
           else
               Notify("Warning!", "Like count text not found!", 3, 4483362458)
           end
       else
           Notify("Warning!", "No obby selected!", 3, 4483362458)
       end
   end
})

M:CreateToggle({
   Name = "Give Fly Tool [Only works on selected obby]",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Val)
       if obby and obby:FindFirstChild("Options") and obby.Options:FindFirstChild("Fly") then
           obby.Options.Fly.Value = Val
       else
           Notify("Warning!", "Fly tool option not found in the selected obby!", 3, 4483362458)
       end
   end,
})

M:CreateButton({
   Name = "Give Teleport Tools",
   Callback = function()
       mouse = game.Players.LocalPlayer:GetMouse()
       tool = Instance.new("Tool")
       tool.RequiresHandle = false
       tool.Name = "Teleport Tool"
       tool.Activated:connect(function()
           local pos = mouse.Hit+Vector3.new(0,2.5,0)
           pos = CFrame.new(pos.X,pos.Y,pos.Z)
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
       end)
       tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})

M:CreateToggle({
    Name = "Make Selected Obby Area Bigger (Cannot place out of bounds)",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Val)
        if obby and obby:FindFirstChild("Area") and obby.Area:FindFirstChild("Area") then
            local areaPart = obby.Area.Area

            if areaPart:IsA("BasePart") then
                if Val then
                    areaPart.Size = Vector3.new(2048, 2048, 2048)
                    Notify("Notification!", "This function is great for flying or spectating in your obby!", 5, 4483362458)
                else
                    areaPart.Size = Vector3.new(180.1, 200.1, 500.1)
                    Notify("Notification!", "Function disabled!", 5, 4483362458)
                end
            else
                Notify("Warning!", "Obby area is not a valid Part!", 5, 4483362458)
            end
        else
            Notify("Warning!", "Obby area not found!", 5, 4483362458)
        end
    end,
})

local S = Window:CreateTab("Scripts", 4483345998)

S:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source'))()
    end,
})

S:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
    end,
})

S:CreateButton({
    Name = "Animation Gui",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Blocky69/boblus-scriptz/refs/heads/main/anim"))()
    end,
})

Notify("Notification!", "Script Loaded!", 5, 4483362458)
