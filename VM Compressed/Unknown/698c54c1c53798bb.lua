local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "T3CHN0S sab GUI",
    Icon = 0,
    LoadingTitle = "Loading",
    LoadingSubtitle = "by T3CHN0",
    ShowText = "T3CHN0S Skidded Ui",
    Theme = "Default",

    ToggleUIKeybind = "R",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- fixed comma

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "K3Y",
        Subtitle = "K3Y Syst£m",
        Note = "https://discord.gg/4aPJEXKM",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"T3CHN0OnT0P"}
    }
})

-- Create Tab
local TpTab = Window:CreateTab("TP", 4483362458)

-- Save Section
local SaveSection = TpTab:CreateSection("Save Position")

local SaveButton = TpTab:CreateButton({
    Name = "Save Position",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:WaitForChild("HumanoidRootPart")

        getgenv().SavedCFrame = root.CFrame
        print("Position Saved.")
    end,
})

-- Teleport Section
local TpSection = TpTab:CreateSection("Teleport To Position")

local TpButton = TpTab:CreateButton({
    Name = "Teleport To Saved Position",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if getgenv().SavedCFrame then
            character:PivotTo(getgenv().SavedCFrame)
            print("Teleported to Saved Position.")
        else
            warn("No Saved Position Found.")
        end
    end,
})