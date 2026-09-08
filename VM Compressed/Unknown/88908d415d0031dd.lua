local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Run on the Moon",
    LoadingTitle = "RotM Basic Teleport",
    LoadingSubtitle = "by True Gamer",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "RotM"
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
       Key = {"Hello"}
    }
})

Rayfield:Notify({
    Title = "Game Version",
    Content = "This was made/updated for 289",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          --print("The user tapped Okay!")
       end
    },
 },
 })


local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UserInputService = game:GetService("UserInputService")

_G.CurrentVehicleCode = nil -- Initialize global variable

local player = game.Players.LocalPlayer

-- Function to handle seat checking
local function setupSeatCheck(character)
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Function to check the seat and print parent of the grandparent
    local function checkSeat()
        if humanoid.SeatPart then
            local seat = humanoid.SeatPart
            if seat.Parent and seat.Parent.Parent and seat.Parent.Parent.Parent then
                local seatGreatGrandParent = seat.Parent.Parent.Parent  -- Get the parent of the grandparent
              --  print("Parent of the grandparent:", seatGreatGrandParent.Name)
                _G.CurrentVehicleCode = seatGreatGrandParent.Name
            else
                --print("Seat has no parent of grandparent.")
            end
        else
            --print("Character is not seated.")
        end
    end
    
    -- Connect the SeatPart changed event to detect when the character sits or leaves a seat
    humanoid:GetPropertyChangedSignal("SeatPart"):Connect(checkSeat)
    
    -- Check seat immediately if the player is already seated
    checkSeat()
end

-- Set up the seat check for the current character
if player.Character then
    setupSeatCheck(player.Character)
end

-- Listen for when the character respawns
player.CharacterAdded:Connect(setupSeatCheck)

local function onMouseClick()
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then -- Check if Ctrl is pressed
        local target = mouse.Target -- Get the clicked object

        if target then
            -- Check if the clicked object is a vehicle part
            local vehiclePart = target:FindFirstAncestor("VehicleParts") -- Check for VehicleParts folder
            if vehiclePart then
                -- Find the parent vehicle (the folder containing the vehicle code)
                local vehicleFolder = vehiclePart:FindFirstAncestorWhichIsA("Model") -- Get the nearest Model ancestor (the vehicle)
                    _G.CurrentTrailerCode = nil -- Initialize global variable
                -- Inside your onMouseClick function:
                if vehicleFolder and vehicleFolder:IsDescendantOf(workspace.Trailers) then
                    _G.CurrentTrailerCode = vehicleFolder.Name -- Set global variable
                    print("Your trailer code is: " .. _G.CurrentTrailerCode)

                    --print("Your vehicle code is: " .. vehicleCode) -- Output the vehicle code
                else
                    print("Trailer not found or not under Trailer folder.")
                end
            else
                print("You clicked on a non-trailer object.")
            end
        end
    end
end

-- Connect the function to the mouse click event
mouse.Button1Down:Connect(onMouseClick)


local positions = {X = 0, Y = 0, Z = 0}
local Tab = Window:CreateTab("Teleport", 4483362458)
local Section = Tab:CreateSection("Position")
local Paragraph = Tab:CreateParagraph({Title = "How to get positions", Content = "This is simple, you can use the game map to get the position you want to teleport, but on map it will show only X and Y(or in game X and Z)"})

local InputX = Tab:CreateInput({
    Name = "X",
    PlaceholderText = "X Position",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        positions.X = tonumber(Text) or 0
    end,
})

local InputY = Tab:CreateInput({
    Name = "Y",
    PlaceholderText = "Y Position",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        positions.Y = tonumber(Text) or 0
    end,
})

local InputZ = Tab:CreateInput({
    Name = "Z",
    PlaceholderText = "Z Position",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        positions.Z = tonumber(Text) or 0
    end,
})

local Button = Tab:CreateButton({
    Name = "Teleport",
    Callback = function()
        local vehicleCode = _G.CurrentVehicleCode
        local targetPosition = Vector3.new(positions.X, positions.Y, positions.Z)

        if vehicleCode then
            local vehicleModel = workspace.Vehicles:FindFirstChild(vehicleCode)
            if vehicleModel then
                vehicleModel:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                --print("Teleported vehicle " .. vehicleCode .. " to " .. tostring(targetPosition))
            else
                print("Vehicle model not found for code: " .. vehicleCode)
            end
        else
            print("No vehicle code is stored.")
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Teleport Trailer",
    Callback = function()
        local vehicleCode = _G.CurrentTrailerCode -- Retrieve the vehicle code from _G
            local targetPosition = Vector3.new(positions.X+30, positions.Y, positions.Z+30) -- Change this to your desired coordinates

        if vehicleCode then
            local vehicleModel = workspace.Trailers:FindFirstChild(vehicleCode)
            if vehicleModel then
                vehicleModel:SetPrimaryPartCFrame(CFrame.new(targetPosition))
        
                print("Teleported trailer " .. vehicleCode .. " to " .. tostring(targetPosition))
            else
                print("Trailer model not found for code: " .. vehicleCode)
            end
        else
            print("No trailer code is stored.")
        end
    end
})


local Tab1 = Window:CreateTab("Credits", 4483362458) -- Title, Image
local Label = Tab1:CreateLabel("Script")
local Paragraph = Tab1:CreateParagraph({Title = "Discord/V3rm", Content = "true_gamer_4959/True Gamer"})