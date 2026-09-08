repeat task.wait() until game:IsLoaded()

local CONFIG = {
    API_SCRIPT_ID = "30b156d1b5322e48d977bdb219bf4053",
    API_URL = "https://api.luarmor.net/files/v3/loaders/...",
    
    FOLDER_ROOT = "Pathos",
    FOLDER_KEYS = "Pathos/Keys",
    FOLDER_SETTINGS = "Pathos/Settings",
    
    COLORS = {
        PRIMARY = Color3.fromRGB(220, 50, 50),
        ACCENT = Color3.fromRGB(120, 20, 20),
        BG_MAIN = Color3.fromRGB(45, 45, 52),
    },
    
    DISCORD = {
        INVITE_CODE = "pathoscc",
        LINK = "https://discord.gg/pathoscc"
    },
    
    KEY_PROVIDERS = {
        LINKVERTISE = "https://ads.luarmor.net/get_key?for=Pathos-HqyRBSscucst"
    },
    
    UNSUPPORTED_EXECUTORS = {
        "Solara",
        -- "Xeno",
        "Luna"
    }
}

local UNCONFIGURED_PLACE_ID = 000000

local GAMES = {
    ["Fight In A School"] = {
        placeName = "Fight In A School",
        placeIds = { 10449761463 },
        patterns = { "fight in a school", "fias" },
    },

    ["Sniper Duels"] = {
        placeName = "Sniper Duels",
        placeIds = { UNCONFIGURED_PLACE_ID },
        patterns = { "sniper duels" },
    },

    ["Hadal Blacksite"] = {
        placeName = "Hadal Blacksite",
        placeIds = { UNCONFIGURED_PLACE_ID },
        patterns = { "hadal blacksite", "pressure" },
    },

    -- ["Untitled Boxing Game"] = {
    --     placeName = "Untitled Boxing Game",
    --     placeIds = { UNCONFIGURED_PLACE_ID },
    --     patterns = { "untitled boxing game", "ubg" },
    -- },

    ["South London"] = {
        placeName = "South London",
        placeIds = { UNCONFIGURED_PLACE_ID },
        patterns = { "south london" },
    },

    ["Hypershot"] = {
        placeName = "Hypershot",
        placeIds = { UNCONFIGURED_PLACE_ID },
        patterns = { "hypershot" },
    },

    ["Rivals"] = {
        placeName = "Rivals",
        placeIds = { 117398147513099 },
        patterns = { "rivals" },
    },
}

local BRM5_MAPS = {
    { key = "OW_Ronograd", placeName = "BRM5 - Ronograd", patterns = { "ronograd" } },
    { key = "PVP_Office",  placeName = "BRM5 - Office",   patterns = { "office" } },
    { key = "PVP_NYC",     placeName = "BRM5 - NYC",      patterns = { "nyc" } },
    { key = "PVP_Favela",  placeName = "BRM5 - Favela",   patterns = { "favela" } },
    { key = "PVP_Coast",   placeName = "BRM5 - Coast",    patterns = { "coast" } },
    { key = "PVP_Tokyo",   placeName = "BRM5 - Tokyo",    patterns = { "tokyo" } },
}

for _, map in BRM5_MAPS do
    GAMES[map.key] = {
        placeName = map.placeName,
        placeIds = { 000000000000 },
        patterns = map.patterns,
    }
end

local Utils = {} do
  DEBUG_MODE = false

  function Utils.log(level, msg)
      local prefix = string.format("[Pathos][%s]", level)
      if level == "ERROR" then 
        warn(prefix, msg) 
      elseif DEBUG_MODE then 
        print(prefix, msg) 
      end
  end
  
  function Utils.try(fn, ctx)
      local ok, result = pcall(fn)
      if not ok then
          
          Utils.log("ERROR", ctx .. ": " .. tostring(result))
          return nil
      end
      return result
  end

  function Utils.sanitize(input)
      if type(input) ~= "string" then
    		return ""
    	end
    
    	local sanitized = input
    	sanitized = sanitized:gsub("%c", "")
    	sanitized = sanitized:match("^%s*(.-)%s*$") or ""
    	sanitized = sanitized:gsub("%s+", " ")
    
    	return sanitized
  end
  
  function Utils.ensureFolder(path)
      if not isfolder(path) then makefolder(path) end
  end
end

local ExecutorCheck = {} do
    function ExecutorCheck.getExecutorName()
        local name = "Unknown"
        pcall(function()
            if identifyexecutor then
                name = identifyexecutor()
            elseif getexecutorname then
                name = getexecutorname()
            end
        end)
        return name
    end
    
    function ExecutorCheck.isUnsupported()
        local execName = ExecutorCheck.getExecutorName():lower()
        for _, unsupported in CONFIG.UNSUPPORTED_EXECUTORS do
            if execName:find(unsupported:lower(), 1, true) then
                return true, unsupported
            end
        end
        return false, nil
    end
    
    function ExecutorCheck.triggerDiscord()
        task.spawn(function()
            pcall(function()
                local req = request or http_request or (syn and syn.request)
                if req then
                    req({
                        Url = "http://127.0.0.1:6463/rpc?v=1",
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json", ["origin"] = "https://discord.com"},
                        Body = game:GetService("HttpService"):JSONEncode({args = {code = CONFIG.DISCORD.INVITE_CODE}, cmd = "INVITE_BROWSER", nonce = "."})
                    })
                end
            end)
            pcall(function()
                if setclipboard then
                    setclipboard(CONFIG.DISCORD.LINK)
                end
            end)
        end)
    end
    
    function ExecutorCheck.showAlert(execName)
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        
        local gui = Instance.new("ScreenGui")
        gui.Name = "PathosUnsupportedAlert"
        gui.ResetOnSpawn = false
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.Parent = game:GetService("CoreGui")
        
        local bg = Instance.new("Frame")
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        bg.BackgroundTransparency = 1
        bg.ZIndex = 100
        bg.Parent = gui
        
        local main = Instance.new("Frame")
        main.Size = UDim2.new(0, 0, 0, 0)
        main.Position = UDim2.new(0.5, 0, 0.5, 0)
        main.AnchorPoint = Vector2.new(0.5, 0.5)
        main.BackgroundColor3 = CONFIG.COLORS.BG_MAIN
        main.BorderSizePixel = 0
        main.ZIndex = 101
        main.Parent = gui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 12)
        corner.Parent = main
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(180, 30, 30)
        stroke.Thickness = 2
        stroke.Parent = main
        
        local icon = Instance.new("TextLabel")
        icon.Size = UDim2.new(0, 60, 0, 60)
        icon.Position = UDim2.new(0.5, 0, 0, 25)
        icon.AnchorPoint = Vector2.new(0.5, 0)
        icon.BackgroundTransparency = 1
        icon.Text = "⚠"
        icon.TextColor3 = Color3.fromRGB(180, 30, 30)
        icon.TextSize = 48
        icon.Font = Enum.Font.GothamBold
        icon.ZIndex = 102
        icon.Parent = main
        
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, -40, 0, 30)
        title.Position = UDim2.new(0, 20, 0, 90)
        title.BackgroundTransparency = 1
        title.Text = "Unsupported Executor"
        title.TextColor3 = CONFIG.COLORS.PRIMARY
        title.TextSize = 20
        title.Font = Enum.Font.GothamBold
        title.ZIndex = 102
        title.Parent = main
        
        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(1, -40, 0, 50)
        desc.Position = UDim2.new(0, 20, 0, 125)
        desc.BackgroundTransparency = 1
        desc.Text = execName .. " is not supported.\nJoin our Discord for supported executors."
        desc.TextColor3 = Color3.fromRGB(200, 200, 200)
        desc.TextSize = 14
        desc.Font = Enum.Font.Gotham
        desc.TextWrapped = true
        desc.ZIndex = 102
        desc.Parent = main
        
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -40, 0, 40)
        btn.Position = UDim2.new(0, 20, 0, 190)
        btn.BackgroundColor3 = CONFIG.COLORS.PRIMARY
        btn.BorderSizePixel = 0
        btn.Text = "Join Discord"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 14
        btn.Font = Enum.Font.GothamBold
        btn.ZIndex = 102
        btn.Parent = main
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        
        local statusLabel = Instance.new("TextLabel")
        statusLabel.Size = UDim2.new(1, -40, 0, 20)
        statusLabel.Position = UDim2.new(0, 20, 0, 240)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = ""
        statusLabel.TextColor3 = Color3.fromRGB(100, 200, 100)
        statusLabel.TextSize = 12
        statusLabel.Font = Enum.Font.Gotham
        statusLabel.ZIndex = 102
        statusLabel.Parent = main
        
        TweenService:Create(bg, TweenInfo.new(0.3), {BackgroundTransparency = 0.5}):Play()
        TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 350, 0, 280)}):Play()
        
        ExecutorCheck.triggerDiscord()
        statusLabel.Text = "Discord link copied to clipboard!"
        
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(240, 70, 70)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.COLORS.PRIMARY}):Play()
        end)
        
        btn.MouseButton1Click:Connect(function()
            ExecutorCheck.triggerDiscord()
            statusLabel.Text = "Discord link copied to clipboard!"
        end)
    end
end

local GameDetector = {} do
  function GameDetector.getCurrentPlace()
      local placeId = game.PlaceId
      local placeName = "Unknown"
      
      local ok, info = pcall(function()
          return game:GetService("MarketplaceService"):GetProductInfo(placeId)
      end)
      
      if ok and info then
          placeName = info.Name:lower()
      end
      
      return placeId, placeName
  end
  
  function GameDetector.matchByPlaceId(gameData, placeId)
      if not gameData.placeIds then return false end
      for _, id in gameData.placeIds do
          if id == placeId then return true end
      end
      return false
  end
  
  function GameDetector.matchByPattern(gameData, placeName)
      if not gameData.patterns then return false end
      for _, pattern in gameData.patterns do
          if string.find(placeName, pattern:lower(), 1, true) then
              return true
          end
      end
      return false
  end
  
  function GameDetector.findGame()
      local placeId, placeName = GameDetector.getCurrentPlace()
      Utils.log("INFO", string.format("Detecting game - PlaceId: %d, Name: %s", placeId, placeName))
      
      for gameKey, gameData in GAMES do
          if GameDetector.matchByPlaceId(gameData, placeId) then
              Utils.log("INFO", "Game detected by PlaceId: " .. gameData.placeName)
              return gameKey, gameData
          end
      end
      
      for gameKey, gameData in GAMES do
          if GameDetector.matchByPattern(gameData, placeName) then
              Utils.log("INFO", "Game detected by pattern: " .. gameData.placeName)
              return gameKey, gameData
          end
      end
      
      Utils.log("INFO", "No game detected, using universal mode")
      return nil, nil
  end
end

local KeyManager = {} do
  function KeyManager.new(gameKey, api)
      local self = {
          gameKey = gameKey,
          api = api,
          keyFile = CONFIG.FOLDER_KEYS .. "/" .. gameKey
      }
      
      function self.load()
          if isfile(self.keyFile) then
              return readfile(self.keyFile)
          end
          return nil
      end
      
      function self.save(key)
          Utils.ensureFolder(CONFIG.FOLDER_KEYS)
          writefile(self.keyFile, key)
      end
      
      function self.delete()
          if isfile(self.keyFile) then
              delfile(self.keyFile)
          end
      end
      
      function self.validate(key)
          local status = self.api.check_key(key)
          
          if status.code == "KEY_VALID" then
              self.save(key)
              return true, "Key validated successfully"
          elseif status.code:find("KEY_") then
              local msgs = {
                  KEY_HWID_LOCKED = "Key linked to different HWID. Reset via Discord",
                  KEY_INCORRECT = "Key is incorrect",
                  KEY_INVALID = "Key is invalid"
              }
              return false, msgs[status.code] or "Unknown key error"
          else
              return false, status.message or "Validation failed"
          end
      end
      return self
  end
end

local UI = {} do
  function UI.tween(inst, props, dur, style, dir)
      local info = TweenInfo.new(
          dur or 0.3,
          style or Enum.EasingStyle.Quad,
          dir or Enum.EasingDirection.Out
      )
      return game:GetService("TweenService"):Create(inst, info, props)
  end
  
  function UI.hover(btn, normalColor, hoverColor)
      btn.MouseEnter:Connect(function()
          UI.tween(btn, {BackgroundColor3 = hoverColor}, 0.2):Play()
      end)
      btn.MouseLeave:Connect(function()
          UI.tween(btn, {BackgroundColor3 = normalColor}, 0.2):Play()
      end)
  end
  
  function UI.createNotificationSystem(parent)
      local container = Instance.new("Frame")
      container.Name = "NotificationContainer"
      container.Size = UDim2.new(0, 300, 1, 0)
      container.Position = UDim2.new(1, -320, 0, 20)
      container.BackgroundTransparency = 1
      container.ZIndex = 50
      container.Parent = parent
      
      local active = {}
      local id = 0
      
      local styles = {
          success = {bg = CONFIG.COLORS.BG_MAIN, border = CONFIG.COLORS.ACCENT, icon = "✓"},
          error = {bg = CONFIG.COLORS.BG_MAIN, border = Color3.fromRGB(180, 30, 30), icon = "✗"},
          info = {bg = CONFIG.COLORS.BG_MAIN, border = Color3.fromRGB(100, 100, 110), icon = "ℹ"},
          warning = {bg = CONFIG.COLORS.BG_MAIN, border = Color3.fromRGB(160, 80, 20), icon = "⚠"}
      }
      
      return function(msg, type, dur)
          id = id + 1
          local currentId = id
          local style = styles[type] or styles.info
          dur = dur or 4
          
          local notif = Instance.new("Frame")
          notif.Size = UDim2.new(1, 0, 0, 60)
          notif.Position = UDim2.new(0, 300, 0, #active * 70)
          notif.BackgroundColor3 = style.bg
          notif.BorderSizePixel = 0
          notif.ZIndex = 51
          notif.Parent = container
          
          local corner = Instance.new("UICorner")
          corner.CornerRadius = UDim.new(0, 8)
          corner.Parent = notif
          
          local stroke = Instance.new("UIStroke")
          stroke.Color = style.border
          stroke.Thickness = 2
          stroke.Parent = notif
          
          local icon = Instance.new("TextLabel")
          icon.Size = UDim2.new(0, 30, 1, 0)
          icon.Position = UDim2.new(0, 10, 0, 0)
          icon.BackgroundTransparency = 1
          icon.Text = style.icon
          icon.TextColor3 = style.border
          icon.TextSize = 20
          icon.Font = Enum.Font.GothamBold
          icon.ZIndex = 52
          icon.Parent = notif
          
          local label = Instance.new("TextLabel")
          label.Size = UDim2.new(1, -80, 1, 0)
          label.Position = UDim2.new(0, 45, 0, 0)
          label.BackgroundTransparency = 1
          label.Text = msg
          label.TextColor3 = Color3.fromRGB(255, 255, 255)
          label.TextSize = 12
          label.TextXAlignment = Enum.TextXAlignment.Left
          label.Font = Enum.Font.Gotham
          label.TextWrapped = true
          label.ZIndex = 52
          label.Parent = notif
          
          local close = Instance.new("TextButton")
          close.Size = UDim2.new(0, 25, 0, 25)
          close.Position = UDim2.new(1, -35, 0, 5)
          close.BackgroundTransparency = 1
          close.Text = "×"
          close.TextColor3 = Color3.fromRGB(180, 180, 180)
          close.TextSize = 16
          close.Font = Enum.Font.GothamBold
          close.ZIndex = 52
          close.Parent = notif
          
          local progress = Instance.new("Frame")
          progress.Size = UDim2.new(1, 0, 0, 3)
          progress.Position = UDim2.new(0, 0, 1, -3)
          progress.BackgroundColor3 = style.border
          progress.BorderSizePixel = 0
          progress.ZIndex = 52
          progress.Parent = notif
          
          table.insert(active, {frame = notif, id = currentId})
          
          UI.tween(notif, {Position = UDim2.new(0, 0, 0, (#active - 1) * 70)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
          UI.tween(progress, {Size = UDim2.new(0, 0, 0, 3)}, dur, Enum.EasingStyle.Linear):Play()
          
          local function dismiss()
              UI.tween(notif, {Position = UDim2.new(0, 300, 0, notif.Position.Y.Offset)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In):Play()
              
              for i, n in ipairs(active) do
                  if n.id == currentId then
                      table.remove(active, i)
                      break
                  end
              end
              
              for i, n in ipairs(active) do
                  UI.tween(n.frame, {Position = UDim2.new(0, 0, 0, (i - 1) * 70)}, 0.3):Play()
              end
              
              task.delay(0.5, function()
                  if notif and notif.Parent then notif:Destroy() end
              end)
          end
          
          close.MouseButton1Click:Connect(dismiss)
          task.delay(dur, dismiss)
      end
  end
  
  function UI.build()
      if getgenv().PathosLoader then
          getgenv().PathosLoader:Destroy()
      end
      
      local gui = Instance.new("ScreenGui")
      gui.Name = ""
      gui.ResetOnSpawn = false
      gui.IgnoreGuiInset = true
      gui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
      gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      gui.DisplayOrder = 999
      gui.Parent = game:GetService("CoreGui")
      
      getgenv().PathosLoader = gui
      
      local c = {}
      
      c.bg = Instance.new("Frame")
      c.bg.Size = UDim2.new(1, 0, 1, 0)
      c.bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
      c.bg.BackgroundTransparency = 0.3
      c.bg.BorderSizePixel = 0
      c.bg.Parent = gui
      
      c.glow = Instance.new("Frame")
      c.glow.Size = UDim2.new(0, 408, 0, 328)
      c.glow.Position = UDim2.new(0.5, -204, 0.5, -164)
      c.glow.BackgroundColor3 = CONFIG.COLORS.PRIMARY
      c.glow.BackgroundTransparency = 0.92
      c.glow.BorderSizePixel = 0
      c.glow.Parent = gui
      
      local glowCorner = Instance.new("UICorner")
      glowCorner.CornerRadius = UDim.new(0, 15)
      glowCorner.Parent = c.glow
      
      c.main = Instance.new("Frame")
      c.main.Size = UDim2.new(0, 400, 0, 320)
      c.main.Position = UDim2.new(0.5, -200, 0.5, -160)
      c.main.BackgroundColor3 = CONFIG.COLORS.BG_MAIN
      c.main.BorderSizePixel = 0
      c.main.ZIndex = 2
      c.main.Parent = gui
      
      local mainCorner = Instance.new("UICorner")
      mainCorner.CornerRadius = UDim.new(0, 12)
      mainCorner.Parent = c.main
      
      local mainStroke = Instance.new("UIStroke")
      mainStroke.Color = CONFIG.COLORS.ACCENT
      mainStroke.Thickness = 2
      mainStroke.Parent = c.main
      
      local titleBar = Instance.new("Frame")
      titleBar.Size = UDim2.new(1, 0, 0, 50)
      titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 58)
      titleBar.BorderSizePixel = 0
      titleBar.ZIndex = 3
      titleBar.Parent = c.main
      
      local titleCorner = Instance.new("UICorner")
      titleCorner.CornerRadius = UDim.new(0, 12)
      titleCorner.Parent = titleBar
      
      local titleFix = Instance.new("Frame")
      titleFix.Size = UDim2.new(1, 0, 0, 12)
      titleFix.Position = UDim2.new(0, 0, 1, -12)
      titleFix.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
      titleFix.BorderSizePixel = 0
      titleFix.ZIndex = 3
      titleFix.Parent = titleBar
      
      local titleText = Instance.new("TextLabel")
      titleText.Size = UDim2.new(1, -100, 1, 0)
      titleText.Position = UDim2.new(0.32, 0, -0.07, 0)
      titleText.BackgroundTransparency = 1
      titleText.Text = "PATHOS LOADER"
      titleText.TextColor3 = CONFIG.COLORS.PRIMARY
      titleText.TextSize = 20
      titleText.TextXAlignment = Enum.TextXAlignment.Left
      titleText.Font = Enum.Font.GothamBold
      titleText.ZIndex = 4
      titleText.Parent = titleBar
      
      c.closeBtn = Instance.new("TextButton")
      c.closeBtn.Size = UDim2.new(0, 30, 0, 30)
      c.closeBtn.Position = UDim2.new(1, -40, 0.35, -15)
      c.closeBtn.BackgroundTransparency = 1
      c.closeBtn.Text = "x"
      c.closeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
      c.closeBtn.TextSize = 32
      c.closeBtn.Font = Enum.Font.GothamBold
      c.closeBtn.ZIndex = 4
      c.closeBtn.Parent = titleBar
      
      local desc = Instance.new("TextLabel")
      desc.Size = UDim2.new(1, -40, 0, 40)
      desc.Position = UDim2.new(0, 20, 0.048, 70)
      desc.BackgroundTransparency = 1
      desc.Text = "Please enter your key to access scripts"
      desc.TextColor3 = Color3.fromRGB(180, 180, 180)
      desc.TextSize = 14
      desc.Font = Enum.Font.Gotham
      desc.ZIndex = 3
      desc.Parent = c.main
      
      local inputFrame = Instance.new("Frame")
      inputFrame.Size = UDim2.new(1, -40, 0, 40)
      inputFrame.Position = UDim2.new(0, 20, 0, 130)
      inputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
      inputFrame.BorderSizePixel = 0
      inputFrame.ZIndex = 3
      inputFrame.Parent = c.main
      
      local inputCorner = Instance.new("UICorner")
      inputCorner.CornerRadius = UDim.new(0, 8)
      inputCorner.Parent = inputFrame
      
      c.inputStroke = Instance.new("UIStroke")
      c.inputStroke.Color = CONFIG.COLORS.ACCENT
      c.inputStroke.Thickness = 1
      c.inputStroke.Parent = inputFrame
      
      c.keyBox = Instance.new("TextBox")
      c.keyBox.Size = UDim2.new(1, -20, 1, 0)
      c.keyBox.Position = UDim2.new(0, 10, 0, 0)
      c.keyBox.BackgroundTransparency = 1
      c.keyBox.PlaceholderText = "Enter Key"
      c.keyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
      c.keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
      c.keyBox.Text = ""
      c.keyBox.TextSize = 14
      c.keyBox.TextXAlignment = Enum.TextXAlignment.Left
      c.keyBox.Font = Enum.Font.Gotham
      c.keyBox.ClearTextOnFocus = false
      c.keyBox.ZIndex = 4
      c.keyBox.Parent = inputFrame
      
      local btnContainer = Instance.new("Frame")
      btnContainer.Size = UDim2.new(1, -40, 0, 40)
      btnContainer.Position = UDim2.new(0, 20, 0, 190)
      btnContainer.BackgroundTransparency = 1
      btnContainer.ZIndex = 3
      btnContainer.Parent = c.main
      
      c.getKeyBtn = Instance.new("TextButton")
      c.getKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
      c.getKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
      c.getKeyBtn.BorderSizePixel = 0
      c.getKeyBtn.Text = "Get Key"
      c.getKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
      c.getKeyBtn.TextSize = 14
      c.getKeyBtn.Font = Enum.Font.GothamBold
      c.getKeyBtn.ZIndex = 4
      c.getKeyBtn.Parent = btnContainer
      
      local getKeyCorner = Instance.new("UICorner")
      getKeyCorner.CornerRadius = UDim.new(0, 8)
      getKeyCorner.Parent = c.getKeyBtn
      
      c.checkKeyBtn = Instance.new("TextButton")
      c.checkKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
      c.checkKeyBtn.Position = UDim2.new(0.52, 0, 0, 0)
      c.checkKeyBtn.BackgroundColor3 = CONFIG.COLORS.PRIMARY
      c.checkKeyBtn.BorderSizePixel = 0
      c.checkKeyBtn.Text = "Check Key"
      c.checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
      c.checkKeyBtn.TextSize = 14
      c.checkKeyBtn.Font = Enum.Font.GothamBold
      c.checkKeyBtn.ZIndex = 4
      c.checkKeyBtn.Parent = btnContainer
      
      local checkKeyCorner = Instance.new("UICorner")
      checkKeyCorner.CornerRadius = UDim.new(0, 8)
      checkKeyCorner.Parent = c.checkKeyBtn
      
      local autoCheckContainer = Instance.new("Frame")
      autoCheckContainer.Size = UDim2.new(1, -40, 0, 25)
      autoCheckContainer.Position = UDim2.new(0, 20, 0, 240)
      autoCheckContainer.BackgroundTransparency = 1
      autoCheckContainer.ZIndex = 3
      autoCheckContainer.Parent = c.main
      
      local autoCheckLabel = Instance.new("TextLabel")
      autoCheckLabel.Size = UDim2.new(0.7, 0, 1, 0)
      autoCheckLabel.BackgroundTransparency = 1
      autoCheckLabel.Text = "Auto-check key on launch"
      autoCheckLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
      autoCheckLabel.TextSize = 12
      autoCheckLabel.Font = Enum.Font.Gotham
      autoCheckLabel.TextXAlignment = Enum.TextXAlignment.Left
      autoCheckLabel.ZIndex = 4
      autoCheckLabel.Parent = autoCheckContainer
      
      c.autoCheckToggle = Instance.new("TextButton")
      c.autoCheckToggle.Size = UDim2.new(0, 40, 0, 20)
      c.autoCheckToggle.Position = UDim2.new(1, -40, 0.5, -10)
      c.autoCheckToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
      c.autoCheckToggle.BorderSizePixel = 0
      c.autoCheckToggle.Text = ""
      c.autoCheckToggle.ZIndex = 4
      c.autoCheckToggle.Parent = autoCheckContainer
      
      local toggleCorner = Instance.new("UICorner")
      toggleCorner.CornerRadius = UDim.new(0, 10)
      toggleCorner.Parent = c.autoCheckToggle
      
      c.toggleCircle = Instance.new("Frame")
      c.toggleCircle.Size = UDim2.new(0, 16, 0, 16)
      c.toggleCircle.Position = UDim2.new(0, 2, 0.5, -8)
      c.toggleCircle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
      c.toggleCircle.BorderSizePixel = 0
      c.toggleCircle.ZIndex = 5
      c.toggleCircle.Parent = c.autoCheckToggle
      
      local circleCorner = Instance.new("UICorner")
      circleCorner.CornerRadius = UDim.new(1, 0)
      circleCorner.Parent = c.toggleCircle
      
      c.discordBtn = Instance.new("TextButton")
      c.discordBtn.Size = UDim2.new(1, -40, 0, 30)
      c.discordBtn.Position = UDim2.new(0, 20, 1, -40)
      c.discordBtn.BackgroundTransparency = 1
      c.discordBtn.Text = "(Click Here For Support)"
      c.discordBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
      c.discordBtn.TextSize = 12
      c.discordBtn.Font = Enum.Font.Gotham
      c.discordBtn.ZIndex = 4
      c.discordBtn.Parent = c.main

      UI.hover(c.getKeyBtn, Color3.fromRGB(60, 60, 65), Color3.fromRGB(80, 80, 85))
      UI.hover(c.checkKeyBtn, CONFIG.COLORS.PRIMARY, Color3.fromRGB(240, 70, 70))
      
      c.keyBox.Focused:Connect(function()
          UI.tween(c.inputStroke, {Color = CONFIG.COLORS.PRIMARY}, 0.3):Play()
      end)
      c.keyBox.FocusLost:Connect(function()
          UI.tween(c.inputStroke, {Color = CONFIG.COLORS.ACCENT}, 0.3):Play()
      end)
      
      task.spawn(function()
          while c.glow and c.glow.Parent do
              UI.tween(c.glow, {Size = UDim2.new(0, 415, 0, 335), Position = UDim2.new(0.5, -207.5, 0.5, -167.5), BackgroundTransparency = 0.95}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut):Play()
              task.wait(2)
              if not (c.glow and c.glow.Parent) then break end
              UI.tween(c.glow, {Size = UDim2.new(0, 408, 0, 328), Position = UDim2.new(0.5, -204, 0.5, -164), BackgroundTransparency = 0.92}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut):Play()
              task.wait(2)
          end
      end)
      
      c.main.Size = UDim2.new(0, 0, 0, 0)
      c.main.Position = UDim2.new(0.5, 0, 0.5, 0)
      c.glow.Size = UDim2.new(0, 0, 0, 0)
      c.glow.Position = UDim2.new(0.5, 0, 0.5, 0)
      c.glow.BackgroundTransparency = 1
      
      UI.tween(c.main, {Size = UDim2.new(0, 400, 0, 320), Position = UDim2.new(0.5, -200, 0.5, -160)}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
      UI.tween(c.glow, {Size = UDim2.new(0, 408, 0, 328), Position = UDim2.new(0.5, -204, 0.5, -164), BackgroundTransparency = 0.92}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
      
      c.notify = UI.createNotificationSystem(gui)
      
      return c
  end
end


local Loader = {} do
  function Loader.new()
      local self = {
          ui = nil,
          keyMgr = nil,
          api = nil,
          gameKey = nil,
          gameData = nil,
          autoCheckEnabled = false
      }
      
      local settingsFile = CONFIG.FOLDER_SETTINGS .. "/autocheck"
      
      function self.loadAutoCheckSetting()
          Utils.ensureFolder(CONFIG.FOLDER_SETTINGS)
          if isfile(settingsFile) then
              return readfile(settingsFile) == "true"
          end
          return false
      end
      
      function self.saveAutoCheckSetting(enabled)
          Utils.ensureFolder(CONFIG.FOLDER_SETTINGS)
          writefile(settingsFile, enabled and "true" or "false")
      end
      
      function self.updateToggleVisual(enabled)
          if enabled then
              UI.tween(self.ui.autoCheckToggle, {BackgroundColor3 = CONFIG.COLORS.PRIMARY}, 0.2):Play()
              UI.tween(self.ui.toggleCircle, {Position = UDim2.new(0, 22, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.2):Play()
          else
              UI.tween(self.ui.autoCheckToggle, {BackgroundColor3 = Color3.fromRGB(60, 60, 65)}, 0.2):Play()
              UI.tween(self.ui.toggleCircle, {Position = UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Color3.fromRGB(150, 150, 150)}, 0.2):Play()
          end
      end
      
      function self.init()
          Utils.log("INFO", "Initializing Pathos Loader v3.0...")
          
          Utils.ensureFolder(CONFIG.FOLDER_ROOT)
          Utils.ensureFolder(CONFIG.FOLDER_KEYS)
          Utils.ensureFolder(CONFIG.FOLDER_SETTINGS)
          
          self.api = Utils.try(function()
              return loadstring(game:HttpGet('https://sdkAPI-public.luarmor.net/library.lua'))()
          end, "Failed to load API")
          
          if not self.api then error("API load failed") end
          self.api.script_id = CONFIG.API_SCRIPT_ID
          
          self.gameKey, self.gameData = GameDetector.findGame()
          if not self.gameKey then
              self.gameKey = "universal"
          end
          
          self.keyMgr = KeyManager.new(self.gameKey, self.api)
          
          self.ui = UI.build()
          self.autoCheckEnabled = self.loadAutoCheckSetting()
          self.updateToggleVisual(self.autoCheckEnabled)
          self.setupEvents()
          self.tryAutoLogin()
          
          Utils.log("INFO", "Loader ready")
      end
      
      function self.tryAutoLogin()
          local key = self.keyMgr.load()
          if key then
              self.ui.keyBox.Text = key
              if self.autoCheckEnabled then
                  task.delay(0.5, function()
                      self.validateKey(key)
                  end)
              end
          end
      end
      
      function self.validateKey(key)
          if not key or key == "" then
              self.ui.notify("Please enter a key!", "warning", 3)
              self.shake()
              return
          end
          key = Utils.sanitize(key)
          
          self.ui.notify("Validating key...", "info", 2)
          
          local ok, msg = self.keyMgr.validate(key)
          if ok then
              self.ui.notify("Key valid! Loading...", "success", 2)
              task.delay(0.5, function()
                  script_key = key
                  self.close()
                  self.api.load_script()
              end)
          else
              self.ui.notify("Key failed: " .. msg, "error", 4)
              self.shake()
          end
      end
      
      function self.shake()
          local origMain = self.ui.main.Position
          local origGlow = self.ui.glow.Position
          task.spawn(function()
              for i = 1, 6 do
                  local rx, ry = math.random(-8, 8), math.random(-8, 8)
                  UI.tween(self.ui.main, {Position = UDim2.new(origMain.X.Scale, origMain.X.Offset + rx, origMain.Y.Scale, origMain.Y.Offset + ry)}, 0.05):Play()
                  UI.tween(self.ui.glow, {Position = UDim2.new(0.5, -204 + rx, 0.5, -164 + ry)}, 0.05):Play()
                  task.wait(0.05)
              end
              UI.tween(self.ui.main, {Position = origMain}, 0.1):Play()
              UI.tween(self.ui.glow, {Position = origGlow}, 0.1):Play()
          end)
      end
      
      function self.close()
          local closeTween = UI.tween(self.ui.main, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
          UI.tween(self.ui.glow, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 1}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In):Play()
          UI.tween(self.ui.bg, {BackgroundTransparency = 1}, 0.4):Play()
          closeTween:Play()
          closeTween.Completed:Connect(function()
              if getgenv().PathosLoader then
                  getgenv().PathosLoader:Destroy()
              end
          end)
      end
      
      function self.setupEvents()
          self.ui.checkKeyBtn.MouseButton1Click:Connect(function()
              self.validateKey(self.ui.keyBox.Text)
          end)
          
          self.ui.getKeyBtn.MouseButton1Click:Connect(function()
              if setclipboard then
                  setclipboard(CONFIG.KEY_PROVIDERS.LINKVERTISE)
                  self.ui.notify("Linkvertise link copied!", "info", 3)
              else
                  self.ui.notify("Clipboard unavailable", "warning", 3)
              end
          end)
          
          self.ui.autoCheckToggle.MouseButton1Click:Connect(function()
              self.autoCheckEnabled = not self.autoCheckEnabled
              self.saveAutoCheckSetting(self.autoCheckEnabled)
              self.updateToggleVisual(self.autoCheckEnabled)
              self.ui.notify(self.autoCheckEnabled and "Auto-check enabled" or "Auto-check disabled", "info", 2)
          end)
          
          self.ui.closeBtn.MouseButton1Click:Connect(function()
              self.close()
          end)
          
          self.ui.discordBtn.MouseButton1Click:Connect(function()
              task.spawn(function()
                  pcall(function()
                      local req = request or http_request or (syn and syn.request)
                      if req then
                          req({
                              Url = "http://127.0.0.1:6463/rpc?v=1",
                              Method = "POST",
                              Headers = {["Content-Type"] = "application/json", ["origin"] = "https://discord.com"},
                              Body = game:GetService("HttpService"):JSONEncode({args = {code = CONFIG.DISCORD.INVITE_CODE}, cmd = "INVITE_BROWSER", nonce = "."})
                          })
                      end
                  end)
                  if setclipboard then
                      setclipboard(CONFIG.DISCORD.LINK)
                      self.ui.notify("Discord link copied!", "info", 3)
                  end
              end)
          end)
      end
      return self
  end
end

local isUnsupported, execName = ExecutorCheck.isUnsupported()
if isUnsupported then
    ExecutorCheck.showAlert(execName)
    return
end

local loader = Loader.new()
Utils.try(function() loader.init() end, "Loader initialization failed")

pcall(function()
    local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
    if queueteleport then
        queueteleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/th3-osc/Pathos/main/Pathos%20Key%20System.lua"))()]])
    end
end)
