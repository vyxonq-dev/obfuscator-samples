local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "Script template",
    subtitle = "Template",
    sidebarLayout = true
})

local mainTab = window:CreateTab({ 
    name = "Main", 
    icon = "home" 
})

mainTab:CreateButton({
    name = "Clicktest",
    callback = function()
        window:Notify({
            title = "test",
            content = "Testwork",
            duration = 3
        })
    end,
})

local test = mainTab:CreateToggle({
    name = "Test",
    flag = "Testt",
    value = true,
    callback = function(value)
        print("Test:", value)
    end,
})

test:Set(false)

window:Notify({
    title = "Template",
    content = "Template",
    duration = 3
})