local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Free Gamepasses",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "stop reading me",
    ConfigurationSaving = {
       Enabled = false
    },
    Discord = {
       Enabled = false
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Dev Products")

the_mode = "fire" 

local MarketplaceService = game:GetService("MarketplaceService")
local developerProducts = MarketplaceService:GetDeveloperProductsAsync():GetCurrentPage()

for _, devProduct in pairs(developerProducts) do
    local id = devProduct.ProductId or "no id lol"
    local name = devProduct.Name or "Unnamed Trash"
    local desc = devProduct.Description or "No desc, dev lazy af"
    local price = devProduct.PriceInRobux or "??"

    MainTab:CreateButton({
        Name = name .. " [" .. id .. "]\n" .. desc .. " | R$" .. price,
        Callback = function()
            if the_mode == "copy" then
                setclipboard(tostring(id))
                Rayfield:Notify({
                    Title = "Copied",
                    Content = "Copied ID: " .. tostring(id),
                    Duration = 3
                })
            elseif the_mode == "fire" then
                MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, id, true)
                Rayfield:Notify({
                    Title = "Fired",
                    Content = "Product Signal Fired",
                    Duration = 3
                })
            end
        end
    })
end