_G.StrokeAnimation = true -- Enabled Stroke Animation

-- Load Notification
local WertUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/idcgj36/WertNotify/refs/heads/main/Source"))()

-- Notification
local myNotifyId = WertUi:Notify({
    Title = "Full Example",    -- Main heading
    Description = "Notification example.",    -- Subtext
    Duration = 4,    -- Display time in seconds
    Location = "BottomRight",    -- BottomRight, TopRight, TopCenter
    RotationIcon = false,    -- Spin Icon 
    Transparent = 0.2,    -- Background transparency
    Icon = "rbxassetid://78246583582436",    -- Icon ID
    -- UiStroke (optional)
    StrokeThickness = 2,    -- Border thickness
    StrokeTransparency = 0,    -- Border Transparency
    StrokeColors = {  
        Color3.fromRGB(0, 170, 255),
        Color3.fromRGB(0, 255, 127)
        -- You can add more colors than that.
    },
    -- Buttons (optional)
    Buttons = {
        {
            Text = "Cancel",    -- Button text
            WhiteText = false,    -- Change text color
            Color = Color3.fromRGB(50, 255, 0),    -- Button color
            Callback = function()
                WertUi:Destroy(myNotifyId)
            end
        },
        {
            Text = "No",
            WhiteText = true, 
            Color = Color3.fromRGB(255, 55, 55),
            Callback = function()
                print("Clicked No!")
            end
        }
        -- You can add multiple buttons.
    }
})

task.wait(2.5)
if myNotifyId then
    WertUi:SetTitle("Test1", myNotifyId)
    WertUi:SetDescription("Description Example!", myNotifyId)
    WertUi:SetIcon("rbxassetid://86681986971272", myNotifyId)
end
