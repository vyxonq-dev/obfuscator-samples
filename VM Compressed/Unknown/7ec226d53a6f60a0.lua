--[[
Credits:
    discord.gg/rbxfanclub

Table:
    getgenv().AlysumMobile = {
        enabled = true, -- // Global Switch
        ui = true, -- // Enable UI
        givetool = true, -- // Give yourself the tool to select a target
        button_position = {104,4}, -- // Button Position
        legitness = "Super Legit", -- // Super Legit (Closest Point), Semi Legit (Closest Part), Normal (Torso), Blatant (Head)
        prediction = "1", -- // Prediction version (1,2,3,custom)
        custom_pred_x = 0.133,
        custom_pred_y = 0.133,
        notif = true, -- // Notifications
        highlight = true, -- // Highlight Target
        line = false, -- // Line to target
        checks = {true, true, false}, -- // Visible, Knocked, Friend
        assist = {false, 0.058}, -- // Enabled, Strength
        fov = {true,50} -- // Visible, Size
    }

]]
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/24d045871c488464c0c15c2f0b2435b5.lua"))()
