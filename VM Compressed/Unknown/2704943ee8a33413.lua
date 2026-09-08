local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Admin Control Panel",
    Icon = 0,
    LoadingTitle = "Loading Admin Panel",
    LoadingSubtitle = "Please wait...",
    ShowText = "Admin Panel UI",
    Theme = "Midnight",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "AdminPanelConfig"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local AdminTab = Window:CreateTab("Admin Panel", "lock")

AdminTab:CreateButton({
    Name = "Admin Panel",
    Callback = function()
        local gui = game:GetService("Players").LocalPlayer.PlayerGui
        gui.Hud_UI.SideBtns.AdminPanel.Visible = true
    end
})

AdminTab:CreateToggle({
    Name = "Owner Panel More Stuff",
    CurrentValue = false,
    Callback = function(state)
        local gui = game:GetService("Players").LocalPlayer.PlayerGui
        gui.OwnerPanel.Frame.Visible = state
        if state then
            gui.DeezPanel.Frame.Visible = false
        end
    end
})

AdminTab:CreateToggle({
    Name = "Deez Panel A Lil More Stuff",
    CurrentValue = false,
    Callback = function(state)
        local gui = game:GetService("Players").LocalPlayer.PlayerGui
        gui.DeezPanel.Frame.Visible = state
        if state then
            gui.OwnerPanel.Frame.Visible = false
        end
    end
})