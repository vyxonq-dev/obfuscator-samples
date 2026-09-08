

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
print("[DEBUG] Rayfield loaded.")

local Window = Rayfield:CreateWindow({
    Name="MoonHook Rivals", LoadingTitle="MoonHook", LoadingSubtitle="by eszkeredzon",
    ConfigurationSaving={Enabled=true,FolderName="MoonHook",FileName="Settings"},
    Discord={Enabled=false}, KeySystem=false
})
print("[DEBUG] Rayfield Window created.")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local Local = Players.LocalPlayer

-- Ustawienia Aimbota
local Aimbot = {
    Enabled = false, Key = Enum.KeyCode.Q, Radius = 200, Smooth = 0.35,
    VisibilityCheck = true, TargetPart = "Head"
}
print("[DEBUG] Initial Aimbot.Key:", Aimbot.Key.Name, "(Type:", typeof(Aimbot.Key), ")")

-- Ustawienia ESP
local ESP = {
    Highlight = {Enabled=false, Color=Color3.new(1,1,0)},
    Box       = {Enabled=false, Color=Color3.new(1,0,0)},
    Name      = {Enabled=false, Color=Color3.new(1,0,0)},
    Health    = {Enabled=false, Color=Color3.new(0,1,0)},
    Distance  = {Enabled=false, Color=Color3.new(1,1,1)},
    Skeleton  = {Enabled=false, Color=Color3.new(1,1,0)},
    ShowFOV = false, -- Przeniesiono ShowFOV do ustawień ESP
    FOVColor = Color3.new(1, 1, 1) -- Dodano kolor FOV
}

-- Przechowywanie obiektów ESP
local ESPstore = {}

-- Obiekt rysowania okręgu FOV
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Filled = false
FOVCircle.Thickness = 2
FOVCircle.Color = ESP.FOVColor -- Użyj koloru z ustawień ESP


if typeof(Aimbot.Key) == "string" then
    local loadedKeyName = Aimbot.Key
    local foundKey = nil

    -- Sprawdź Enum.KeyCode
    if Enum.KeyCode[loadedKeyName] then
        foundKey = Enum.KeyCode[loadedKeyName]
    end

    -- Sprawdź Enum.UserInputType (dla przycisków myszy)
    if not foundKey and Enum.UserInputType[loadedKeyName] then
        foundKey = Enum.UserInputType[loadedKeyName]
    end

    if foundKey then
        Aimbot.Key = foundKey
        print("[DEBUG] Aimbot Key loaded and converted to EnumItem:", Aimbot.Key.Name)
    else
        Aimbot.Key = Enum.KeyCode.Q -- Domyślny klawisz, jeśli konwersja się nie powiedzie
        warn("[DEBUG] Failed to convert loaded Aimbot Key '" .. loadedKeyName .. "' to EnumItem. Defaulting to Q.")
    end
else
    print("[DEBUG] Aimbot Key already EnumItem:", Aimbot.Key.Name)
end
-- ************************************************************************************************

-- Funkcja do tworzenia ESP dla gracza
local function createESP(player)
    -- Twórz ESP tylko dla innych graczy, nie dla lokalnego gracza
    if player == Local then return end
    if ESPstore[player] then return end -- Zapobiegaj duplikacji ESP

    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end

    local hl = Instance.new("Highlight", char)
    hl.Enabled = false

    local box = Drawing.new("Square")
    box.Visible = false; box.Filled = false; box.Thickness = 2

    local nameText = Drawing.new("Text")
    nameText.Visible = false; nameText.Center = true; nameText.Outline = true

    local healthLine = Drawing.new("Line")
    healthLine.Visible = false; healthLine.Thickness = 4

    local distText = Drawing.new("Text")
    distText.Visible = false; distText.Center = true; distText.Outline = true

    -- Linie szkieletu
    local skeleton = {}
    for _, bone in ipairs({
        {"Head","UpperTorso"}, {"UpperTorso","LowerTorso"},
        {"UpperTorso","LeftUpperArm"}, {"LeftUpperArm","LeftLowerArm"}, {"LeftLowerArm","LeftHand"},
        {"UpperTorso","RightUpperArm"}, {"RightUpperArm","RightLowerArm"}, {"RightLowerArm","RightHand"},
        {"LowerTorso","LeftUpperLeg"}, {"LeftUpperLeg","LeftLowerLeg"}, {"LeftLowerLeg","LeftFoot"},
        {"LowerTorso","RightUpperLeg"}, {"RightUpperLeg","RightLowerLeg"}, {"RightLowerLeg","RightFoot"}
    }) do
        local ln = Drawing.new("Line")
        ln.Visible = false; ln.Thickness = 2
        skeleton[#skeleton+1] = {line=ln, a=bone[1], b=bone[2]}
    end

    ESPstore[player] = {
        root=root, hum=hum, hl=hl, box=box,
        nameText=nameText, healthLine=healthLine, distText=distText, skeleton=skeleton
    }
end

-- Funkcja do usuwania ESP dla gracza
local function removeESP(player)
    local e = ESPstore[player]
    if not e then return end
    e.hl:Destroy()
    e.box:Remove()
    e.nameText:Remove()
    e.healthLine:Remove()
    e.distText:Remove()
    for _,b in ipairs(e.skeleton) do b.line:Remove() end
    ESPstore[player] = nil
end

-- Wybór celu Aimbota (najbliższy cel w FOV)
local function getClosest()
    local best, bestD = nil, Aimbot.Radius
    local mx, my = UserInput:GetMouseLocation().X, UserInput:GetMouseLocation().Y

    local localCharacter = Local.Character
    local localRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

    for _,p in pairs(Players:GetPlayers()) do
        -- Pomiń lokalnego gracza i graczy bez postaci lub części docelowej
        if p == Local or not p.Character then continue end
        local targetPart = p.Character:FindFirstChild(Aimbot.TargetPart)
        if not targetPart then continue end

        local pos, vis = Camera:WorldToViewportPoint(targetPart.Position)
        local d = (Vector2.new(pos.X,pos.Y)-Vector2.new(mx,my)).Magnitude

        -- Sprawdź, czy cel jest w promieniu FOV
        if d < bestD then
            local isVisible = true
            -- Wykonaj raycast tylko jeśli VisibilityCheck jest włączony i mamy HumanoidRootPart lokalnego gracza
            if Aimbot.VisibilityCheck and localRootPart then
                local rayOrigin = localRootPart.Position -- Zmieniono origin na HumanoidRootPart lokalnego gracza
                local rayDirection = targetPart.Position - rayOrigin -- Wektor od origin do celu
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                -- Wyklucz postać lokalnego gracza i postać celu, aby raycast ich nie uderzył
                rayParams.FilterDescendantsInstances = {localCharacter, p.Character}

                local rayResult = workspace:Raycast(rayOrigin, rayDirection, rayParams)

                -- Jeśli rayResult jest nil, nic nie zostało trafione, więc jest widoczne.
                -- Jeśli rayResult istnieje, sprawdź, czy trafiona część nie jest częścią celu ani jego postaci.
                -- Jeśli nie jest, to cel jest zasłonięty.
                if rayResult then
                    if rayResult.Instance ~= targetPart and not rayResult.Instance:IsDescendantOf(p.Character) then
                        isVisible = false
                    end
                end
            end

            if isVisible then
                best, bestD = p, d
            end
        end
    end
    return best
end

-- Funkcja do celowania w część
local function aimAt(part)
    local pos, on = Camera:WorldToViewportPoint(part.Position)
    if on then
        local m = UserInput:GetMouseLocation()
        -- 'mousemoverel' to globalna funkcja dostarczana przez kontekst exploita,
        -- która przesuwa mysz względem jej bieżącej pozycji.
        -- Jeśli aimbot nie działa, upewnij się, że Twoje środowisko exploita obsługuje 'mousemoverel'
        -- lub że nie ma innych funkcji do sterowania myszą.
        mousemoverel((pos.X-m.X)*Aimbot.Smooth, (pos.Y-m.Y)*Aimbot.Smooth)
    end
end

-- Główna pętla RenderStepped
RunService.RenderStepped:Connect(function()
    -- print("[DEBUG] RenderStepped - Current Aimbot.Key:", Aimbot.Key.Name, "(Type:", typeof(Aimbot.Key), ")") -- Odkomentuj do debugowania
    -- print("[DEBUG] RenderStepped - Is Aimbot Key Pressed (Q):", UserInput:IsKeyDown(Enum.KeyCode.Q)) -- Odkomentuj do debugowania
    -- print("[DEBUG] RenderStepped - Is Aimbot Key Pressed (Current Aimbot.Key):", typeof(Aimbot.Key) == "EnumItem" and (Aimbot.Key.EnumType == Enum.UserInputType and UserInput:IsMouseButtonPressed(Aimbot.Key) or Aimbot.Key.EnumType == Enum.KeyCode and UserInput:IsKeyDown(Aimbot.Key)) or "N/A") -- Odkomentuj do debugowania

    -- Aktualizuj okrąg FOV
    if ESP.ShowFOV then
        local mx, my = UserInput:GetMouseLocation().X, UserInput:GetMouseLocation().Y
        FOVCircle.Position = Vector2.new(mx, my)
        FOVCircle.Radius = Aimbot.Radius -- FOV Radius nadal zależy od Aimbot.Radius
        FOVCircle.Color = ESP.FOVColor -- Użyj koloru z ustawień ESP
        FOVCircle.Visible = true
    else
        FOVCircle.Visible = false
    end

    for player, e in pairs(ESPstore) do
        -- Upewnij się, że gracz istnieje i jego postać jest prawidłowa
        if not player or not player.Character or not e.root.Parent then
            removeESP(player)
            continue -- Przejdź do następnego gracza
        end

        local pos, vis = Camera:WorldToViewportPoint(e.root.Position)
        local depth = (e.root.Position - Camera.CFrame.Position).Magnitude
        local sz = depth > 0 and (2000/depth) or 0

        -- Highlight
        e.hl.Enabled = ESP.Highlight.Enabled
        e.hl.FillColor = ESP.Highlight.Color
        e.hl.OutlineColor = ESP.Highlight.Color

        -- Box
        if ESP.Box.Enabled and vis then
            e.box.Position = Vector2.new(pos.X - sz/2, pos.Y - sz/2)
            e.box.Size = Vector2.new(sz, sz)
            e.box.Color = ESP.Box.Color
            e.box.Visible = true
        else
            e.box.Visible = false
        end

        -- Name
        if ESP.Name.Enabled and vis then
            e.nameText.Text = player.Name
            e.nameText.Position = Vector2.new(pos.X, pos.Y - sz/2 - 20)
            e.nameText.Color = ESP.Name.Color
            e.nameText.Size = 18
            e.nameText.Visible = true
        else
            e.nameText.Visible = false
        end

        -- Pasek zdrowia (pionowy po prawej)
        if ESP.Health.Enabled and vis then
            local pct = math.clamp(e.hum.Health/e.hum.MaxHealth,0,1)
            e.healthLine.From = Vector2.new(pos.X + sz/2 + 6, pos.Y + sz/2)
            e.healthLine.To = Vector2.new(pos.X + sz/2 + 6, pos.Y + sz/2 - sz*pct)
            e.healthLine.Color = ESP.Health.Color
            e.healthLine.Visible = true
        else
            e.healthLine.Visible = false
        end

        -- Dystans
        if ESP.Distance.Enabled and vis then
            local dist = math.floor(depth)
            e.distText.Text = dist.."m"
            e.distText.Position = Vector2.new(pos.X, pos.Y + sz/2 + 6)
            e.distText.Color = ESP.Distance.Color
            e.distText.Size = 16
            e.distText.Visible = true
        else
            e.distText.Visible = false
        end

        -- Szkielet
        if ESP.Skeleton.Enabled and vis then
            for _,b in ipairs(e.skeleton) do
                local pA = e.root.Parent:FindFirstChild(b.a)
                local pB = e.root.Parent:FindFirstChild(b.b)
                if pA and pB then
                    local sA,_ = Camera:WorldToViewportPoint(pA.Position)
                    local sB,_ = Camera:WorldToViewportPoint(pB.Position)
                    b.line.From = Vector2.new(sA.X, sA.Y)
                    b.line.To = Vector2.new(sB.X, sB.Y)
                    b.line.Color = ESP.Skeleton.Color
                    b.line.Visible = true
                else
                    b.line.Visible = false
                end
            end
        else
            for _,b in ipairs(e.skeleton) do b.line.Visible = false end
        end
    end

    -- Wykonanie Aimbota
    -- Sprawdź, czy klawisz Aimbota jest aktualnie wciśnięty.
    -- Dla przycisków myszy, UserInput:IsMouseButtonPressed() jest bardziej niezawodne.
    local isAimbotKeyPressed = false
    if typeof(Aimbot.Key) == "EnumItem" then
        if Aimbot.Key.EnumType == Enum.UserInputType then -- Przycisk myszy
            isAimbotKeyPressed = UserInput:IsMouseButtonPressed(Aimbot.Key)
        elseif Aimbot.Key.EnumType == Enum.KeyCode then -- Klawisz klawiatury
            isAimbotKeyPressed = UserInput:IsKeyDown(Aimbot.Key)
        end
    end

    if Aimbot.Enabled and isAimbotKeyPressed then
        local tgt = getClosest()
        if tgt and tgt.Character and tgt.Character:FindFirstChild(Aimbot.TargetPart) then
            aimAt(tgt.Character[Aimbot.TargetPart])
        end
    end
end)

-- GUI
local tab1 = Window:CreateTab("Aimbot",0)
print("[DEBUG] Aimbot Tab created.")
tab1:CreateToggle({Name="Enable Aimbot", CurrentValue=Aimbot.Enabled, Callback=function(v) Aimbot.Enabled=v end})
tab1:CreateToggle({Name="Visibility Check", CurrentValue=Aimbot.VisibilityCheck, Callback=function(v) Aimbot.VisibilityCheck=v end})
-- Przywrócono CreateDropdown dla wyboru klawisza
tab1:CreateDropdown({
    Name="Aimbot Key",
    Options={"Q","E","R","F","MouseButton1", "MouseButton2"},
    CurrentOption = typeof(Aimbot.Key) == "EnumItem" and Aimbot.Key.Name or (typeof(Aimbot.Key) == "string" and Aimbot.Key or "Q"), -- Upewnij się, że CurrentOption jest stringiem
    Callback=function(v)
        local newKey = nil
        if v == "MouseButton1" then
            newKey = Enum.UserInputType.MouseButton1
        elseif v == "MouseButton2" then
            newKey = Enum.UserInputType.MouseButton2
        else
            newKey = Enum.KeyCode[v]
        end

        if newKey then
            Aimbot.Key = newKey
            print("[DEBUG] Aimbot Key set via dropdown to:", Aimbot.Key.Name, "(Type:", typeof(Aimbot.Key), ")")
        else
            warn("[DEBUG] Failed to set Aimbot Key from dropdown for value:", v)
        end
    end
})
tab1:CreateSlider({Name="FOV Radius", Range={50,500}, Increment=10, CurrentValue=Aimbot.Radius, Callback=function(v) Aimbot.Radius=v end})
tab1:CreateSlider({Name="Smoothness", Range={0.01,1}, Increment=0.01, CurrentValue=Aimbot.Smooth, Callback=function(v) Aimbot.Smooth=v end})
tab1:CreateDropdown({Name="Target Part", Options={"Head","Torso","HumanoidRootPart"}, CurrentOption=Aimbot.TargetPart, Callback=function(v) Aimbot.TargetPart=v end})

local tab2 = Window:CreateTab("Visual",1)
print("[DEBUG] Visual Tab created.")
tab2:CreateToggle({Name="Highlight ESP", CurrentValue=ESP.Highlight.Enabled, Callback=function(v) ESP.Highlight.Enabled=v end})
tab2:CreateColorPicker({Name="Highlight Color", Color=ESP.Highlight.Color, Callback=function(c) ESP.Highlight.Color=c end})
tab2:CreateToggle({Name="Box ESP", CurrentValue=ESP.Box.Enabled, Callback=function(v) ESP.Box.Enabled=v end})
tab2:CreateColorPicker({Name="Box Color", Color=ESP.Box.Color, Callback=function(c) ESP.Box.Color=c end})
tab2:CreateToggle({Name="Name ESP", CurrentValue=ESP.Name.Enabled, Callback=function(v) ESP.Name.Enabled=v end})
tab2:CreateColorPicker({Name="Name Color", Color=ESP.Name.Color, Callback=function(c) ESP.Name.Color=c end})
tab2:CreateToggle({Name="Health Bar", CurrentValue=ESP.Health.Enabled, Callback=function(v) ESP.Health.Enabled=v end})
tab2:CreateColorPicker({Name="Health Color", Color=ESP.Health.Color, Callback=function(c) ESP.Health.Color=c end})
tab2:CreateToggle({Name="Distance ESP", CurrentValue=ESP.Distance.Enabled, Callback=function(v) ESP.Distance.Enabled=v end})
tab2:CreateColorPicker({Name="Distance Color", Color=ESP.Distance.Color, Callback=function(c) ESP.Distance.Color=c end})
tab2:CreateToggle({Name="Skeleton ESP", CurrentValue=ESP.Skeleton.Enabled, Callback=function(v) ESP.Skeleton.Enabled=v end})
tab2:CreateColorPicker({Name="Skeleton Color", Color=ESP.Skeleton.Color, Callback=function(c) ESP.Skeleton.Color=c end})
-- Przeniesiono Show FOV Circle i dodano Color Picker
tab2:CreateToggle({Name="Show FOV Circle", CurrentValue=ESP.ShowFOV, Callback=function(v) ESP.ShowFOV=v end})
tab2:CreateColorPicker({Name="FOV Color", Color=ESP.FOVColor, Callback=function(c) ESP.FOVColor=c; FOVCircle.Color = c end})


-- Inicjalizuj istniejących graczy i obsługuj nowych graczy
-- Podłącz PlayerAdded, aby tworzyć ESP dla nowych graczy
Players.PlayerAdded:Connect(function(player)
    -- Poczekaj krótko na załadowanie postaci, a następnie utwórz ESP
    player.CharacterAdded:Connect(function() task.wait(0.5); createESP(player) end)
    -- Jeśli postać już istnieje (np. gracz dołączył przed pełnym wykonaniem skryptu), utwórz ESP natychmiast
    if player.Character then createESP(player) end
end)

-- Inicjalizuj istniejących graczy, którzy są już w grze, gdy skrypt się uruchamia
for _,pl in pairs(Players:GetPlayers()) do
    if pl ~= Local then
        -- Podłącz CharacterAdded dla odrodzeń
        pl.CharacterAdded:Connect(function() task.wait(0.5); createESP(pl) end)
        -- Utwórz ESP, jeśli postać już istnieje
        if pl.Character then createESP(pl) end
    end
end
Players.PlayerRemoving:Connect(removeESP)