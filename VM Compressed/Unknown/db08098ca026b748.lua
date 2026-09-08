getgenv().SecureMode = true

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function GetSecureURL(id, token)
    return "https://webhook.lewisakura.moe/api/webhooks/" .. id .. "/" .. token
end

local FEEDBACK_WEBHOOK = GetSecureURL("1469509445573808280", "dnrfCZeiSS9r48Kg2u1krwYkX8Qg_3at6bI_kubS7rEa1hSiPWIdSi5XPgvOkATvCz-I")
local BAN_WEBHOOK = GetSecureURL("1469509426514890834", "jLTVVY7HHF5R_fhVfcwdwSXDfAtD1Rk4RI7-_6YM6NhtISjfIm3fl2X-rUnjOyDvsvJZ")

local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
local BAN_FILE = "DX_Bans.json"

local function GetPlayerAvatar(userId)
    return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
end

local function SaveBans(data) 
    if writefile then 
        writefile(BAN_FILE, HttpService:JSONEncode(data)) 
    end 
end

local function LoadBans() 
    if isfile and isfile(BAN_FILE) then 
        local content = readfile(BAN_FILE)
        local success, result = pcall(function() return HttpService:JSONDecode(content) end)
        if success then return result end
    end 
    return {} 
end

local BanList = LoadBans()

if BanList[player.Name] or BanList[tostring(player.UserId)] then 
    local data = BanList[player.Name] or BanList[tostring(player.UserId)]
    local reason = data.Reason or "No reason specified."
    player:Kick("\n[PANEL BAN]\n\nYou are banned from using this panel.\nReason: " .. reason) 
    return 
end

local currentMoveSpeed = 50
local customSpawnPoint = nil
getgenv().SpeedEnabled = false
getgenv().JumpEnabled = false
local flyBV, flyConn, camPart, camConn
local infJumpConnection = nil
local airPlatform = nil
local airLevel = 0

local function SendWebhook(url, title, description, color, userId)
    local request = (syn and syn.request) or (http and http.request) or http_request or request
    if request then
        request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({
                embeds = {{
                    title = title,
                    description = description,
                    color = color,
                    thumbnail = { url = GetPlayerAvatar(userId or player.UserId) },
                    footer = {text = "Game: " .. gameName},
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
                }}
            })
        })
    end
end

local function GetCameraRelativeDirection()
    local dir = Vector3.new(0, 0, 0)
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end

    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local moveDir = player.Character.Humanoid.MoveDirection
        if moveDir.Magnitude > 0 and dir.Magnitude == 0 then
            local look = camera.CFrame.LookVector
            local right = camera.CFrame.RightVector
            local forwardAmt = moveDir:Dot(camera.CFrame.LookVector.Unit)
            local rightAmt = moveDir:Dot(camera.CFrame.RightVector.Unit)
            dir = (look * forwardAmt) + (right * rightAmt)
        end
    end
    return dir
end

local function ApplyEyeMorph(char)
    pcall(function()
        local model = Players:GetCharacterAppearanceAsync(7782621813)
        for _, v in pairs(char:GetChildren()) do
             if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("CharacterMesh") or v:IsA("BodyColors") then v:Destroy() end
        end
        for _, v in pairs(model:GetChildren()) do v.Parent = char end
        model:Destroy()
    end)
end

local Window = Rayfield:CreateWindow({
   Name = "Script Of J",
   LoadingTitle = "Script Of J",
   LoadingSubtitle = "Loading...",
   ConfigurationSaving = { Enabled = true, FolderName = "ScriptOfJ_Configs", FileName = "J_Config" },
   KeySystem = true,
   KeySettings = {
      Title = "Script Of J | Key System",
      Subtitle = "Key System",
      Note = "Join the Discord to get the key!\nDiscord: discord.gg/wZkYuPMkdb\n\nKey: J_Mode",
      FileName = "ScriptOfJ_Key",
      SaveKey = true,
      GrabKeyFromWebsite = false,
      Key = {"J_Mode"}
   }
})

local RulesTab = Window:CreateTab("Rules", 4483362458)
local MainTab = Window:CreateTab("Main", 4483362458)
local WorldTab = Window:CreateTab("World", 4483345998)
local PromptTab = Window:CreateTab("Prompts", 7072706663)
local ChatTab = Window:CreateTab("View Player Msgs", 4483362458)
local UtilityTab = Window:CreateTab("Utils", 4483362458)

RulesTab:CreateButton({
    Name = "JOIN DISCORD SERVER",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/wZkYuPMkdb")
            Rayfield:Notify({Title = "Discord", Content = "Link copied to clipboard!", Duration = 3})
        end
    end
})

local ChatLogLabel = ChatTab:CreateParagraph({Title = "Recent Messages", Content = "Waiting for messages..."})
local ChatHistory = {}

local function UpdateChatLog(newMsg)
    table.insert(ChatHistory, 1, newMsg)
    if #ChatHistory > 15 then table.remove(ChatHistory) end
    ChatLogLabel:Set({Title = "Server Chat Logs", Content = table.concat(ChatHistory, "\n")})
end

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    TextChatService.OnIncomingMessage = function(message)
        if message.TextSource then UpdateChatLog("[" .. message.TextSource.DisplayName .. "]: " .. message.Text) end
    end
else
    for _, p in pairs(Players:GetPlayers()) do
        p.Chatted:Connect(function(msg) UpdateChatLog("[" .. p.DisplayName .. "]: " .. msg) end)
    end
    Players.PlayerAdded:Connect(function(p)
        p.Chatted:Connect(function(msg) UpdateChatLog("[" .. p.DisplayName .. "]: " .. msg) end)
    end)
end

if player.Name == "elijah145887" then
    local AdminTab = Window:CreateTab("Admin", 4483362458)
    local target, bReason = "", "No reason provided."
    AdminTab:CreateInput({Name = "Target Username", PlaceholderText = "User...", Callback = function(v) target = v end})
    AdminTab:CreateInput({Name = "Ban Reason", PlaceholderText = "Reason...", Callback = function(v) bReason = v end})
    
    AdminTab:CreateButton({Name = "BAN PLAYER", Callback = function()
        if target == "elijah145887" then
            Rayfield:Notify({Title = "Error", Content = "You cannot ban elijah145887!", Duration = 3})
            return
        end
 
        if target ~= "" then
            BanList[target] = {Banned = true, Reason = bReason}
            SaveBans(BanList)
            
            local targetId = 0
            pcall(function() targetId = Players:GetUserIdFromNameAsync(target) end)
            
            SendWebhook(BAN_WEBHOOK, "User Banned", "Admin banned: **"..target.."**\nReason: "..bReason, 16711680, targetId)
            Rayfield:Notify({Title = "Success", Content = target.." has been banned locally.", Duration = 3})
        end
    end})
    
    AdminTab:CreateButton({Name = "UNBAN PLAYER", Callback = function()
        if BanList[target] then
            BanList[target] = nil;
            SaveBans(BanList)
            SendWebhook(BAN_WEBHOOK, "User Unbanned", "Admin unbanned: **"..target.."**", 255)
            Rayfield:Notify({Title = "Success", Content = target.." unbanned.", Duration = 3})
        end
    end})
end

MainTab:CreateSlider({Name = "Movement Speed", Range = {0, 400}, Increment = 1, Suffix = " SPD", CurrentValue = 50, Callback = function(Value) currentMoveSpeed = Value end})

MainTab:CreateToggle({
   Name = "Air Walk",
   CurrentValue = false,
   Callback = function(state)
      getgenv().AirWalkEnabled = state
      if state then
         if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            airLevel = player.Character.HumanoidRootPart.Position.Y - 3.5
            airPlatform = Instance.new("Part")
            airPlatform.Name = "DX_AirPlatform"
            airPlatform.Size = Vector3.new(10, 1, 10)
            airPlatform.Transparency = 1;
            airPlatform.Anchored = true; airPlatform.Parent = workspace
            RunService.Heartbeat:Connect(function()
               if getgenv().AirWalkEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                  local rootPos = player.Character.HumanoidRootPart.Position
                  airPlatform.CFrame = CFrame.new(rootPos.X, airLevel, rootPos.Z)
               elseif airPlatform then airPlatform:Destroy() 
                  airPlatform = nil end
            end)
         end
      else if airPlatform then airPlatform:Destroy() airPlatform = nil end end
   end,
})

MainTab:CreateToggle({
   Name = "FLY",
   CurrentValue = false,
   Callback = function(state)
      if state then
         if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            flyBV = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
            flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            flyConn = RunService.RenderStepped:Connect(function()
                local dir = GetCameraRelativeDirection()
                flyBV.Velocity = dir.Magnitude > 0 and dir.Unit * currentMoveSpeed or Vector3.new(0,0,0)
            end)
         end
      else if flyConn then flyConn:Disconnect() 
         end if flyBV then flyBV:Destroy() end end
   end,
})

MainTab:CreateToggle({
   Name = "FREECAM",
   CurrentValue = false,
   Callback = function(state)
      if state then
         if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.Anchored = true end
         camPart = Instance.new("Part", workspace);
         camPart.Anchored = true; camPart.Transparency = 1; camPart.CanCollide = false
         camPart.CFrame = camera.CFrame;
         camera.CameraSubject = camPart
         camConn = RunService.RenderStepped:Connect(function()
            local dir = GetCameraRelativeDirection()
            if dir.Magnitude > 0 then camPart.CFrame = camPart.CFrame + (dir.Unit * (currentMoveSpeed/60)) end
         end)
      else
         if camConn then camConn:Disconnect() end if camPart then camPart:Destroy() end
         if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.Anchored = false end
         if player.Character and player.Character:FindFirstChild("Humanoid") then camera.CameraSubject = player.Character.Humanoid end
      end
   end,
})

MainTab:CreateToggle({Name = "Speed Enable", CurrentValue = false, Callback = function(state) getgenv().SpeedEnabled = state task.spawn(function() while getgenv().SpeedEnabled do if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = currentMoveSpeed end task.wait() end if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = 16 end end) end})
MainTab:CreateToggle({Name = "Jump [150]", CurrentValue = false, Callback = function(state) getgenv().JumpEnabled = state task.spawn(function() while getgenv().JumpEnabled do if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.JumpPower = 150 player.Character.Humanoid.UseJumpPower = true end task.wait() end if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.JumpPower = 50 end end) end})
MainTab:CreateToggle({Name = "INF JUMP", CurrentValue = false, Callback = function(state) if infJumpConnection then infJumpConnection:Disconnect() infJumpConnection = nil end if state then infJumpConnection = UserInputService.JumpRequest:Connect(function() if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end end})

PromptTab:CreateToggle({Name = "Disable Prompts", CurrentValue = false, Callback = function(state) getgenv().DisablePrompts = state for _, v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then v.Enabled = not state end end end})
workspace.DescendantAdded:Connect(function(d) if d:IsA("ProximityPrompt") and getgenv().DisablePrompts then d.Enabled = false end end)
PromptTab:CreateToggle({Name = "Instant Interact", CurrentValue = false, Callback = function(s) for _, v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then v.HoldDuration = s and 0 or 0.1 end end end})
PromptTab:CreateToggle({Name = "Infinite Distance", CurrentValue = false, Callback = function(s) for _, v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then v.MaxActivationDistance = s and 9999 or 32 end end end})
PromptTab:CreateToggle({Name = "Wall Reach", CurrentValue = false, Callback = function(s) for _, v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then v.RequiresLineOfSight = not s end end end})

WorldTab:CreateToggle({Name = "NOCLIP", CurrentValue = false, Callback = function(s) getgenv().NoclipEnabled = s RunService.Stepped:Connect(function() if getgenv().NoclipEnabled and player.Character then for _, v in pairs(player.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end) end})
WorldTab:CreateToggle({Name = "PLAYER ESP", CurrentValue = false, Callback = function(s) if s then for _, p in pairs(Players:GetPlayers()) do if p ~= player and p.Character then local h = Instance.new("Highlight", p.Character); h.Name = "DX_Highlight"; h.FillColor = Color3.fromRGB(255, 0, 0) end end else for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("DX_Highlight") then p.Character.DX_Highlight:Destroy() end end end end})
WorldTab:CreateToggle({Name = "FULLBRIGHT", CurrentValue = false, Callback = function(s) Lighting.Brightness = s and 2 or 1 Lighting.GlobalShadows = not s end})
WorldTab:CreateToggle({Name = "LOW GRAVITY", CurrentValue = false, Callback = function(s) workspace.Gravity = s and 30 or 196.2 end})

UtilityTab:CreateToggle({Name = "eye.exe", CurrentValue = false, Callback = function(s) if s then local sky = Instance.new("Sky", Lighting); sky.Name = "EyeSky"; local id = "rbxassetid://137779052339052"; sky.SkyboxBk = id sky.SkyboxDn = id sky.SkyboxFt = id sky.SkyboxLf = id sky.SkyboxRt = id sky.SkyboxUp = id if player.Character then ApplyEyeMorph(player.Character) end else if Lighting:FindFirstChild("EyeSky") then Lighting.EyeSky:Destroy() end player:LoadCharacter() end end})
UtilityTab:CreateButton({Name = "SET SPAWN", Callback = function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then customSpawnPoint = player.Character.HumanoidRootPart.CFrame end end})
UtilityTab:CreateButton({Name = "TP TO SPAWN", Callback = function() if customSpawnPoint and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = customSpawnPoint end end})
UtilityTab:CreateButton({Name = "GOTO CLOSEST", Callback = function() local closestPlr, dist = nil, math.huge for _, p in pairs(Players:GetPlayers()) do if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then local d = (player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude if d < dist then dist = d closestPlr = p end end end if closestPlr then player.Character.HumanoidRootPart.CFrame = closestPlr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3) end end})
UtilityTab:CreateButton({Name = "BLIND SHOT", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Blind-Shot-esp-OPen-Source-79301"))() end})

Rayfield:Notify({
   Title = "Script Of J",
   Content = "Welcome to Script Of J!\nKey: J_Mode | Discord: discord.gg/wZkYuPMkdb",
   Duration = 5,
   Image = 4483362458,
})