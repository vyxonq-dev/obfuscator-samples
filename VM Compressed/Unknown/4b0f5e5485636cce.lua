
print("jnkie")








print("jnkie")



setclipboard("https://discord.gg/jYkbeWtYsf")

local ClickBindable = Instance.new("BindableEvent")

ClickBindable.Event:Connect(function(ButtonText)

    if ButtonText == "Copy Link" then

        if setclipboard then
            setclipboard("https://discord.gg/jYkbeWtYsf")
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Liquid Hub",
            Text = "Discord invite copied to clipboard.",
            Duration = 3
        })

    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Liquid Hub",
    Text = "Join our Discord server for updates, support, and new releases!",
    Duration = 15,
    Callback = ClickBindable,
    Button1 = "Copy Link"
})


game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Liquid Hub",
            Text = "Loading Key System",
            Duration = 3
        })




loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/4fb150aae19cf4e71e8033c2b096f606cb82ef5f94982f4e06910779d65633a4/download"))()


