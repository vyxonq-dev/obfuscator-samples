loadstring(game:HttpGet("https://luau.pro/loader"))()

local discordLink = "https://discord.gg/G2WvRycjbu"

if setclipboard then
    setclipboard(discordLink)
elseif toclipboard then
    toclipboard(discordLink)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Discord",
    Text = "Discord copied to clipboard",
    Duration = 5
})
