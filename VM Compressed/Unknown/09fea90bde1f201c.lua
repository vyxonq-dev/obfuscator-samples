if game.placeId == 2909493629 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Lithium Hub", HidePremium = false, IntroText = "Lithium Hub", IntroEnabled = true, SaveConfig = true, ConfigFolder = "LithiumConfig"})

    local SpecialTransformTab = Window:MakeTab({
        Name = "Special Transform Tab",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
 
    })
    
    SpecialTransformTab:AddButton({
        Name = "Godzilla 1",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s2"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Mecha Godzilla",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s3"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Ultra Man",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s4"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Gipsy",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s5"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "King Kong",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s6"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "American Godzilla",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s7"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Shin Godzilla",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s8"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "2019/2022 Godzilla",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s9"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "SkullCrawler",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s10"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Ghidorah",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s11"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Destroyah",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s12"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    SpecialTransformTab:AddButton({
        Name = "Eva 0",
        Callback = function()
            local args = {
                [1] = "Morph",
                [2] = "s13"
            }
            
            game:GetService("ReplicatedStorage").Morphing2:FireServer(unpack(args))
            
          end    
    })

    local CreditsTab = Window:MakeTab({
        Name = "Credits",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
CreditsTab:AddLabel("Credits:Fog5438")



    end
    OrionLib:Init()

