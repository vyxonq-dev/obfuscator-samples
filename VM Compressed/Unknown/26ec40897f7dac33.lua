local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()

local window = Lib:CreateWindow("USOpen UGC GUI v1.1")
local tab = window:CreateTab("Main")

local items = {
    { name = "PATCHED ", id = "137811828506497" }
}

game:GetService("StarterGui"):SetCore("SendNotification", { Title = "PATCHED PATCHED PATCHED PATCHED "; Text = "9 ugc available"; Icon = "rbxthumb://type=Asset&id=17834951927&w=150&h=150"}) Duration = 5;

local itemNames = {}
for i, item in ipairs(items) do
    table.insert(itemNames, item.name)
end

tab:CreateDropdown("Select Item", itemNames, function(selectedName)
    for i, item in ipairs(items) do
        if item.name == selectedName then
            selectedItem = tonumber(item.id)
            break
        end
    end
end)

tab:CreateButton("Redeem Item", function()
    if selectedItem then
        local a = { [1] = "PurchaseItem", [2] = selectedItem }
        game:GetService("ReplicatedStorage"):WaitForChild("Shop_purchaseUnlimitedUGCServerEvent"):FireServer(unpack(a))
    end
end)
