local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
 
 
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LOLP"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false  
 
 
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 463, 0, 719) 
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 4
mainFrame.BorderColor3 = Color3.fromRGB(143,0,255) 
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
 
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Parent = mainFrame
ImageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 463, 0, 719)
ImageLabel.Image = "http://www.roblox.com/asset/?id="
 
local titleLabel            = Instance.new("TextLabel")
titleLabel.Size             = UDim2.new(1, 0, 0, 40)
titleLabel.Position         = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
titleLabel.BorderSizePixel  = 1
titleLabel.BorderColor3     = Color3.fromRGB(143,0,255)
titleLabel.Font             = Enum.Font.JosefinSans
titleLabel.Text             = "1x8x7x2x9 Scirpt Gui v10 Private Edition"
titleLabel.TextColor3       = Color3.fromRGB(255,255,255)
titleLabel.TextSize         = 25
titleLabel.Parent           = mainFrame
 
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0.04, 1)
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BorderSizePixel = 1
titleLabel.BorderColor3 = Color3.fromRGB(143, 0, 255)
titleLabel.Font = Enum.Font.JosefinSans
titleLabel.Text = "Music"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 30
titleLabel.Parent = mainFrame
 
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 0.3, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0.1, 0)
scrollingFrame.BackgroundColor3 = Color3.new(0.02, 0.02, 0.02)
scrollingFrame.BorderSizePixel = 1
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.Parent = mainFrame
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.03, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "1x1x1x1x1 music"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
scriptbyblue2spooky.Parent = scrollingFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer(";music 139488665764275")
    RequestCommand:InvokeServer(";pitch 0.85")
    RequestCommand:InvokeServer(";volume inf")
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.25, 0, 0.03, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "unmusic"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
scriptbyblue2spooky.Parent = scrollingFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer("/e ;unmusic")
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.25, 0, 0.00, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Patrick Laugh"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
scriptbyblue2spooky.Parent = scrollingFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer("/e ;music 7816195044")
    RequestCommand:InvokeServer("/e ;pitch 0.3")
    RequestCommand:InvokeServer("/e ;volume inf")
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.49, 0, 0.06, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "RUMBLE!"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 15 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
scriptbyblue2spooky.Parent = scrollingFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer("/e ;music 7795812961")
    RequestCommand:InvokeServer("/e ;volume inf")
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.25, 0, 0.06, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Opening Theme"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 15 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
scriptbyblue2spooky.Parent = scrollingFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer("/e ;music 132046898251409")
    RequestCommand:InvokeServer("/e ;pitch 0.3")
    RequestCommand:InvokeServer("/e ;volume inf")
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.49, 0, 0.03, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Spooky Remix"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 15 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
scriptbyblue2spooky.Parent = scrollingFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer("/e ;music 118324869664952")
    RequestCommand:InvokeServer("/e ;pitch 1.26")
    RequestCommand:InvokeServer("/e ;volume inf")
end)
 
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0.37, 1)
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
titleLabel.Font = Enum.Font.JosefinSans
titleLabel.Text = "f3x scirpt"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BorderColor3 = Color3.fromRGB(143,0,255)
titleLabel.TextSize = 30
titleLabel.Parent = mainFrame
 
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0.37, 1)
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
titleLabel.Font = Enum.Font.JosefinSans
titleLabel.Text = "f3x scirpt"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BorderColor3 = Color3.fromRGB(143,0,255)
titleLabel.TextSize = 30
titleLabel.Parent = mainFrame
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.43, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "get f3x"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 15 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
    RequestCommand:InvokeServer("/e ;btools")
    RequestCommand:InvokeServer("/e ;buildingtools")
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.43, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Decal"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/z7XyxYfQ',true))()
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.43, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Skeleton Skybox"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/SEQET6qh',true))()
 
end)
 
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.43, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "skybox"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 15 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
    local player = game.Players.LocalPlayer
    local char = player.Character
    local tool
    for i,v in player:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
        end
    end
    for i,v in game.ReplicatedStorage:GetDescendants() do
        if v.Name == "SyncAPI" then
            tool = v.Parent
        end
    end
    --craaa
    remote = tool.SyncAPI.ServerEndpoint
    function _(args)
        remote:InvokeServer(unpack(args))
    end
    function SetCollision(part,boolean)
        local args = {
        [1] = "SyncCollision",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["CanCollide"] = boolean
        }
        }
        }
        _(args)
    end
    function SetAnchor(boolean,part)
        local args = {
        [1] = "SyncAnchor",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["Anchored"] = boolean
        }
        }
        }
        _(args)
    end
    function CreatePart(cf,parent)
        local args = {
        [1] = "CreatePart",
        [2] = "Normal",
        [3] = cf,
        [4] = parent
        }
        _(args)
    end
    function DestroyPart(part)
        local args = {
        [1] = "Remove",
        [2] = {
        [1] = part
        }
        }
        _(args)
    end
    function MovePart(part,cf)
        local args = {
        [1] = "SyncMove",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["CFrame"] = cf
        }
        }
        }
        _(args)
    end
    function Resize(part,size,cf)
        local args = {
        [1] = "SyncResize",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["CFrame"] = cf,
        ["Size"] = size
        }
        }
        }
        _(args)
    end
    function AddMesh(part)
        local args = {
        [1] = "CreateMeshes",
        [2] = {
        [1] = {
        ["Part"] = part
        }
        }
        }
        _(args)
    end
 
    function SetMesh(part,meshid)
        local args = {
        [1] = "SyncMesh",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["MeshId"] = "rbxassetid://"..meshid
        }
        }
        }
        _(args)
    end
    function SetTexture(part, texid)
        local args = {
        [1] = "SyncMesh",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["TextureId"] = "rbxassetid://"..texid
        }
        }
        }
        _(args)
    end
    function SetName(part, stringg)
        local args = {
        [1] = "SetName",
        [2] = {
        [1] = part
        },
        [3] = stringg
        }
 
        _(args)
    end
    function MeshResize(part,size)
        local args = {
        [1] = "SyncMesh",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["Scale"] = size
        }
        }
        }
        _(args)
    end
    function Weld(part1, part2,lead)
        local args = {
        [1] = "CreateWelds",
        [2] = {
        [1] = part1,
        [2] = part2
        },
        [3] = lead
        }
        _(args)
 
    end
    function SetLocked(part,boolean)
        local args = {
        [1] = "SetLocked",
        [2] = {
        [1] = part
        },
        [3] = boolean
        }
        _(args)
    end
    function SetTrans(part,int)
        local args = {
        [1] = "SyncMaterial",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["Transparency"] = int
        }
        }
        }
        _(args)
    end
    function CreateSpotlight(part)
        local args = {
        [1] = "CreateLights",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["LightType"] = "SpotLight"
        }
        }
        }
        _(args)
    end
    function SyncLighting(part,brightness)
        local args = {
        [1] = "SyncLighting",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["LightType"] = "SpotLight",
        ["Brightness"] = brightness
        }
        }
        }
        _(args)
    end
    function Color(part,color)
        local args = {
        [1] = "SyncColor",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["Color"] = color --[[Color3]],
        ["UnionColoring"] = false
        }
        }
        }
        _(args)
    end
    function SpawnDecal(part,side)
        local args = {
        [1] = "CreateTextures",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["Face"] = side,
        ["TextureType"] = "Decal"
        }
        }
        }
 
        _(args)
    end
    function AddDecal(part,asset,side)
        local args = {
        [1] = "SyncTexture",
        [2] = {
        [1] = {
        ["Part"] = part,
        ["Face"] = side,
        ["TextureType"] = "Decal",
        ["Texture"] = "rbxassetid://".. asset
        }
        }
        }
        _(args)
    end
 
    function Sky(id)
        e = char.HumanoidRootPart.CFrame.x
        f = char.HumanoidRootPart.CFrame.y
        g = char.HumanoidRootPart.CFrame.z
        CreatePart(CFrame.new(math.floor(e),math.floor(f),math.floor(g)) + Vector3.new(0,6,0),workspace)
        for i,v in game.Workspace:GetDescendants() do
            if v:IsA("BasePart") and v.CFrame.x == math.floor(e) and v.CFrame.z == math.floor(g) then
                --spawn(function()
                    SetName(v,"Sky")
                    AddMesh(v)
                    --end)
                    --spawn(function()
                        SetMesh(v,"111891702759441")
                        SetTexture(v,id)
                        --end)
                        MeshResize(v,Vector3.new(6000,6000,6000))
                        SetLocked(v,true)
                    end
                end
            end
            Sky("99357687153861")
        end)
 
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.49, 0, 0.00, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Trump The Tank Engine"scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 15 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
            RequestCommand:InvokeServer("/e ;music 89293274845575")
            RequestCommand:InvokeServer("/e ;pitch 0.25")
            RequestCommand:InvokeServer("/e ;volume inf")
        end)
       local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.000, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Bobby2pistolz"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 112226782551255")
            RequestCommand:InvokeServer(";pitch 0.129")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.73, 0, 0.03, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Erika"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 89306716065974")
            RequestCommand:InvokeServer(";pitch 0.12")
            RequestCommand:InvokeServer(";volume inf")
 
        end)        
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.06, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Lotsa spaghetti"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 99907604701668")
            RequestCommand:InvokeServer(";pitch 0.13")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 70, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.005, 0, 0.04, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "R6"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";R6")
 
        end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 70, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.840, 0, 0.04, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "🤑🤑"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/3K1dpHg0',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.73, 0, 0.00, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Πiggers"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 1499703495")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.73, 0, 0.06, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Scatman"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 73056619288510")
            RequestCommand:InvokeServer(";pitch 0.18")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.09, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "king Von"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 98650792566150")
            RequestCommand:InvokeServer(";pitch 0.2")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.25, 0, 0.09, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "troll"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 84690995964261")
            RequestCommand:InvokeServer(";pitch 0.11")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.49, 0, 0.09, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "what the black say?"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 89441845224124")
            RequestCommand:InvokeServer(";pitch 0.168")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.73, 0, 0.09, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Chicken Jockey Phonk"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 129546408528391")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.12, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "BANGRANGRANG"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 82685880394495")
            RequestCommand:InvokeServer(";pitch 0.27")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.25, 0, 0.12, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Hoodtrap"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 107990547300911")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.49, 0, 0.12, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "RAINING MEN"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 104497567166761")
            RequestCommand:InvokeServer(";pitch 0.27")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.73, 0, 0.12, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Sonic Exe"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 133180219581309")
            RequestCommand:InvokeServer(";pitch 0.11")
            RequestCommand:InvokeServer(";volume inf")
 
        end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.15, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Cailou Funk"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 113768944849093")
            RequestCommand:InvokeServer(";volume inf")
 
        end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.25, 0, 0.15, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Moon Man Crank Dat"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 99416674507000")
            RequestCommand:InvokeServer(";pitch 0.12")
            RequestCommand:InvokeServer(";volume inf")
 
        end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.15, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Cailou Funk"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
        scriptbyblue2spooky.Parent = scrollingFrame
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";music 113768944849093")
            RequestCommand:InvokeServer(";volume inf")
 
        end)
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/0A0xyFPX',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.61, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Toadroast"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/3Kj0xzjy',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.61, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Scary Face Sky"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/qMtemdzE',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.67, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Scary Face decal"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/MTZGK4R6',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.67, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Shedletsky Avatar"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";Char all Shedletsky")
 
        end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.67, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Remove Skybox"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/ztad2TUz',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.67, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Remove Decal"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/ENhng5G5',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.73, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Black Fog"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";Fog")
            RequestCommand:InvokeServer(";FogColor black")
            RequestCommand:InvokeServer(";time 0")            
        end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.73, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Fire all"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/WspEKiBL',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.73, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Bat(R6)"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";Gear me 55301897")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.73, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Knife (R6)"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";Gear me 121946387")
 
        end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.79, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "R15 ALL"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";R15 all")
 
        end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.79, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Noot Noot"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/MNxnGgza',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.79, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Walmart Sky"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/ir5EFrdY',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.79, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Shedletsky Sky"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/7k8PDvXu',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.61, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Sparklle all"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/h5f6QXne',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.61, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "lazyTown Sky"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/0A0xyFPX',true))()
 
end)local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.55, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "MLG FROG"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/DDVeQx1Q',true))()
 
end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.55, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Disco"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";Disco")
            RequestCommand:InvokeServer(";time 0")
 
        end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.55, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "illegal"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/8ubiSEhC',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.55, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "World Tour Sky"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/0TE9Y6D3',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.49, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "UnAchor"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/nLdnURwp',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.49, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Thomas"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/kB5RXirc',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.49, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Baseplate"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/vqiVvsZn',true))()
 
end)
        local scriptbyblue2spooky = Instance.new("TextButton")
        scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
        scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.49, 0) 
        scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
        scriptbyblue2spooky.BorderSizePixel = 1
        scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
        scriptbyblue2spooky.Font = Enum.Font.JosefinSans
        scriptbyblue2spooky.Text = "Message"
        scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
        scriptbyblue2spooky.TextSize = 20 
        scriptbyblue2spooky.TextWrapped = true
        scriptbyblue2spooky.Parent = mainFrame
 
 
        scriptbyblue2spooky.MouseButton1Click:Connect(function()
 
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
 
            RequestCommand:InvokeServer(";SM Team 1x8x7x2x9 Join Today!")
 
        end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.85, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Arab Text Sky"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/mpFCczPi',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.85, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Mario.Exe"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/wyT5nFem',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.85, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Skybox 2"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/DYmKLtTD',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.85, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Decal Spam 2"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/m9ZRhWBy',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.01, 0, 0.91, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Deleted all player"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/EXibjYrH',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.26, 0, 0.91, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Realm"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/XfpE8dQQ',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.50, 0, 0.91, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Patrick :O"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/EUwgCNdH',true))()
 
end)
local scriptbyblue2spooky = Instance.new("TextButton")
scriptbyblue2spooky.Size = UDim2.new(0, 110, 0, 40)
scriptbyblue2spooky.Position = UDim2.new(0.74, 0, 0.91, 0) 
scriptbyblue2spooky.BackgroundColor3 = Color3.new(0, 0, 0)
scriptbyblue2spooky.BorderSizePixel = 1
scriptbyblue2spooky.BorderColor3 = Color3.fromRGB(143,0,255)
scriptbyblue2spooky.Font = Enum.Font.JosefinSans
scriptbyblue2spooky.Text = "Troll Rain"
scriptbyblue2spooky.TextColor3 = Color3.new(1, 1, 1)
scriptbyblue2spooky.TextSize = 20 
scriptbyblue2spooky.TextWrapped = true
scriptbyblue2spooky.Parent = mainFrame
 
scriptbyblue2spooky.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/svNGf0B6',true))()
 
end)