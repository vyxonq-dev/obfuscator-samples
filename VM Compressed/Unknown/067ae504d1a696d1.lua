local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players: Players = cloneref(game:GetService("Players"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local TweenService: TweenService = cloneref(game:GetService("TweenService"))
local UserInputService: UserInputService = cloneref(game:GetService("UserInputService"))
local LocalPlayer: Player = Players.LocalPlayer

local RNG = Random.new()

local function SafeCall<T...>(func: (T...) -> any, ...: T...): (boolean, any)
    return xpcall(func, function(err)
        return tostring(err)
    end, ...)
end

type StackData = {
    Level: number,
    Index: number,
    Value: any,
    Type: string
}

type ProtoData = {
    Func: (...any) -> ...any,
    Index: number,
    Name: string,
    Source: string,
    Line: number,
    Constants: {[number]: any},
    Upvalues: {[number]: any},
    Parent: FunctionData?
}

type FunctionData = {
    Func: (...any) -> ...any,
    Hash: string,
    Name: string,
    Source: string,
    Line: number,
    Upvalues: {[number]: any},
    Constants: {[number]: any},
    Protos: {ProtoData},
    Stack: {StackData},
    IsHooked: boolean
}

type ScriptData = {
    Instance: Instance?,
    Name: string,
    Type: string,
    Functions: {FunctionData},
    Path: string,
    FunctionCount: number,
    IsDeleted: boolean
}

type SerializedValue = {
    Type: string,
    Value: string,
    Raw: any,
    DisplayType: string
}

local SyntaxColors = {
    Keyword = Color3.fromRGB(248, 109, 124),
    String = Color3.fromRGB(138, 219, 114),
    Number = Color3.fromRGB(255, 198, 109),
    Comment = Color3.fromRGB(106, 115, 125),
    Function = Color3.fromRGB(102, 217, 239),
    FunctionName = Color3.fromRGB(166, 226, 46),
    Operator = Color3.fromRGB(255, 255, 255),
    Builtin = Color3.fromRGB(102, 217, 239),
    Variable = Color3.fromRGB(220, 220, 220),
    Boolean = Color3.fromRGB(255, 198, 109),
    Nil = Color3.fromRGB(255, 198, 109),
    Self = Color3.fromRGB(248, 109, 124),
    Background = Color3.fromRGB(30, 30, 30),
    LineNumber = Color3.fromRGB(106, 115, 125),
    Selection = Color3.fromRGB(50, 50, 80),
    Constant = Color3.fromRGB(174, 129, 255),
    Upvalue = Color3.fromRGB(253, 151, 31),
    Proto = Color3.fromRGB(102, 217, 239),
    Annotation = Color3.fromRGB(86, 156, 214)
}

local Keywords = {
    ["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true,
    ["elseif"] = true, ["end"] = true, ["false"] = true, ["for"] = true,
    ["function"] = true, ["if"] = true, ["in"] = true, ["local"] = true,
    ["nil"] = true, ["not"] = true, ["or"] = true, ["repeat"] = true,
    ["return"] = true, ["then"] = true, ["true"] = true, ["until"] = true,
    ["while"] = true, ["continue"] = true, ["export"] = true, ["type"] = true
}

local Builtins = {
    ["print"] = true, ["warn"] = true, ["error"] = true, ["assert"] = true,
    ["pairs"] = true, ["ipairs"] = true, ["next"] = true, ["select"] = true,
    ["tonumber"] = true, ["tostring"] = true, ["type"] = true, ["typeof"] = true,
    ["unpack"] = true, ["pcall"] = true, ["xpcall"] = true, ["rawget"] = true,
    ["rawset"] = true, ["rawequal"] = true, ["setmetatable"] = true,
    ["getmetatable"] = true, ["require"] = true, ["spawn"] = true,
    ["delay"] = true, ["wait"] = true, ["tick"] = true, ["time"] = true,
    ["game"] = true, ["workspace"] = true, ["script"] = true, ["math"] = true,
    ["string"] = true, ["table"] = true, ["coroutine"] = true, ["debug"] = true,
    ["task"] = true, ["os"] = true, ["utf8"] = true, ["bit32"] = true,
    ["Instance"] = true, ["Vector3"] = true, ["Vector2"] = true, ["CFrame"] = true,
    ["Color3"] = true, ["UDim2"] = true, ["UDim"] = true, ["Enum"] = true,
    ["Ray"] = true, ["Region3"] = true, ["TweenInfo"] = true, ["NumberRange"] = true,
    ["NumberSequence"] = true, ["ColorSequence"] = true, ["Rect"] = true,
    ["BrickColor"] = true, ["Random"] = true, ["DateTime"] = true
}

local CodeViewerWindow = {}
CodeViewerWindow.__index = CodeViewerWindow

function CodeViewerWindow.new()
    local self = setmetatable({}, CodeViewerWindow)
    self.Gui = nil
    self.Visible = false
    self.CurrentSource = ""
    self.Lines = {}
    self.FunctionInfo = nil
    self.AllFunctions = {}
    return self
end

function CodeViewerWindow:Create()
    if self.Gui then
        self.Gui:Destroy()
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ScriptDumperCodeViewer"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local parent = gethui and gethui() or CoreGui
    screenGui.Parent = parent
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 1000, 0, 750)
    mainFrame.Position = UDim2.new(0.5, -500, 0.5, -375)
    mainFrame.BackgroundColor3 = SyntaxColors.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false
    mainFrame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = mainFrame
    
local function getAssetFromId(assetId, fileName)
    if isfile(fileName) then
        return getcustomasset(fileName)
    end
    
    local success, data = pcall(function()
        return game:HttpGet("https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(assetId))
    end)
    
    if success and data then
        writefile(fileName, data)
        return getcustomasset(fileName)
    end
    
    return "rbxassetid://" .. tostring(assetId)
end

local shadowAsset = getAssetFromId(5554236805, "shadow.png")

local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.BackgroundTransparency = 1
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.ZIndex = -1
shadow.Image = shadowAsset
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(23, 23, 277, 277)
shadow.Parent = mainFrame
    
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 35)
    titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    local titleFix = Instance.new("Frame")
    titleFix.Size = UDim2.new(1, 0, 0, 10)
    titleFix.Position = UDim2.new(0, 0, 1, -10)
    titleFix.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleFix.BorderSizePixel = 0
    titleFix.Parent = titleBar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = "Code Viewer - No Script"
    titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "Close"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 2.5)
    closeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    closeButton.TextSize = 14
    closeButton.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton
    
    closeButton.MouseEnter:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}):Play()
    end)
    
    closeButton.MouseLeave:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        self:Hide()
    end)
    
    local copyButton = Instance.new("TextButton")
    copyButton.Name = "Copy"
    copyButton.Size = UDim2.new(0, 60, 0, 25)
    copyButton.Position = UDim2.new(1, -100, 0, 5)
    copyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    copyButton.Font = Enum.Font.GothamMedium
    copyButton.Text = "Copy"
    copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    copyButton.TextSize = 12
    copyButton.Parent = titleBar
    
    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 6)
    copyCorner.Parent = copyButton
    
    copyButton.MouseButton1Click:Connect(function()
        if setclipboard and self.CurrentSource ~= "" then
            setclipboard(self.CurrentSource)
            copyButton.Text = "Copied!"
            task.wait(1)
            copyButton.Text = "Copy"
        end
    end)
    
    local infoBar = Instance.new("Frame")
    infoBar.Name = "InfoBar"
    infoBar.Size = UDim2.new(1, 0, 0, 25)
    infoBar.Position = UDim2.new(0, 0, 0, 35)
    infoBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    infoBar.BorderSizePixel = 0
    infoBar.Parent = mainFrame
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "Info"
    infoLabel.Size = UDim2.new(1, -20, 1, 0)
    infoLabel.Position = UDim2.new(0, 10, 0, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Font = Enum.Font.Code
    infoLabel.Text = "Lines: 0 | Characters: 0"
    infoLabel.TextColor3 = SyntaxColors.LineNumber
    infoLabel.TextSize = 11
    infoLabel.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel.TextYAlignment = Enum.TextYAlignment.Center
    infoLabel.RichText = true
    infoLabel.Parent = infoBar
    
    local codeContainer = Instance.new("Frame")
    codeContainer.Name = "CodeContainer"
    codeContainer.Size = UDim2.new(1, -10, 1, -70)
    codeContainer.Position = UDim2.new(0, 5, 0, 65)
    codeContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    codeContainer.BorderSizePixel = 0
    codeContainer.ClipsDescendants = true
    codeContainer.Parent = mainFrame
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 6)
    containerCorner.Parent = codeContainer
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 8
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.Parent = codeContainer
    
    local lineNumbers = Instance.new("Frame")
    lineNumbers.Name = "LineNumbers"
    lineNumbers.Size = UDim2.new(0, 50, 1, 0)
    lineNumbers.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    lineNumbers.BorderSizePixel = 0
    lineNumbers.Parent = scrollFrame
    
    local lineLayout = Instance.new("UIListLayout")
    lineLayout.SortOrder = Enum.SortOrder.LayoutOrder
    lineLayout.Parent = lineNumbers
    
    local codeFrame = Instance.new("Frame")
    codeFrame.Name = "CodeFrame"
    codeFrame.Size = UDim2.new(1, -55, 1, 0)
    codeFrame.Position = UDim2.new(0, 55, 0, 0)
    codeFrame.BackgroundTransparency = 1
    codeFrame.Parent = scrollFrame
    
    local codeLayout = Instance.new("UIListLayout")
    codeLayout.SortOrder = Enum.SortOrder.LayoutOrder
    codeLayout.Parent = codeFrame
    
    self.Gui = screenGui
    self.MainFrame = mainFrame
    self.TitleLabel = titleLabel
    self.InfoLabel = infoLabel
    self.ScrollFrame = scrollFrame
    self.LineNumbers = lineNumbers
    self.CodeFrame = codeFrame
    
    self:MakeDraggable(mainFrame, titleBar)
    self:MakeResizable(mainFrame)
    
    return self
end

function CodeViewerWindow:MakeDraggable(frame: Frame, handle: Frame)
    local dragging = false
    local dragStart = Vector2.new()
    local startPos = UDim2.new()
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = Vector2.new(input.Position.X, input.Position.Y)
            startPos = frame.Position
        end
    end)
    
    handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

function CodeViewerWindow:MakeResizable(frame: Frame)
    local resizeHandle = Instance.new("TextButton")
    resizeHandle.Name = "ResizeHandle"
    resizeHandle.Size = UDim2.new(0, 20, 0, 20)
    resizeHandle.Position = UDim2.new(1, -20, 1, -20)
    resizeHandle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    resizeHandle.Text = "◢"
    resizeHandle.TextColor3 = Color3.fromRGB(150, 150, 150)
    resizeHandle.TextSize = 12
    resizeHandle.Font = Enum.Font.GothamBold
    resizeHandle.Parent = frame
    
    local resizeCorner = Instance.new("UICorner")
    resizeCorner.CornerRadius = UDim.new(0, 4)
    resizeCorner.Parent = resizeHandle
    
    local resizing = false
    local resizeStart = Vector2.new()
    local startSize = UDim2.new()
    
    resizeHandle.MouseButton1Down:Connect(function()
        resizing = true
        resizeStart = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
        startSize = frame.Size
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation()
            local delta = Vector2.new(mousePos.X, mousePos.Y) - resizeStart
            
            local newWidth = math.max(600, startSize.X.Offset + delta.X)
            local newHeight = math.max(400, startSize.Y.Offset + delta.Y)
            
            frame.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)
end

function CodeViewerWindow:EscapeRichText(text: string): string
    return text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

function CodeViewerWindow:HighlightLine(line: string, isAnnotation: boolean?): string
    if isAnnotation then
        return '<font color="rgb(86,156,214)">' .. self:EscapeRichText(line) .. '</font>'
    end
    
    local result = ""
    local i = 1
    local len = #line
    
    while i <= len do
        local char = string.sub(line, i, i)
        
        if string.sub(line, i, i + 1) == "--" then
            local comment = string.sub(line, i)
            if string.find(comment, "@CONST") or string.find(comment, "@UPVAL") or string.find(comment, "@PROTO") or string.find(comment, "@FUNC") then
                result = result .. '<font color="rgb(86,156,214)">' .. self:EscapeRichText(comment) .. '</font>'
            else
                result = result .. '<font color="rgb(106,115,125)">' .. self:EscapeRichText(comment) .. '</font>'
            end
            break
        end
        
        if char == '"' or char == "'" then
            local quote = char
            local str = char
            i = i + 1
            while i <= len do
                local c = string.sub(line, i, i)
                str = str .. c
                if c == quote and string.sub(line, i - 1, i - 1) ~= "\\" then
                    break
                end
                i = i + 1
            end
            result = result .. '<font color="rgb(138,219,114)">' .. self:EscapeRichText(str) .. '</font>'
            i = i + 1
        elseif string.match(char, "%d") then
            local num = ""
            while i <= len and string.match(string.sub(line, i, i), "[%d%.xXaAbBcCdDeEfF]") do
                num = num .. string.sub(line, i, i)
                i = i + 1
            end
            result = result .. '<font color="rgb(255,198,109)">' .. num .. '</font>'
        elseif string.match(char, "[%a_]") then
            local word = ""
            while i <= len and string.match(string.sub(line, i, i), "[%w_]") do
                word = word .. string.sub(line, i, i)
                i = i + 1
            end
            
            local nextChar = string.sub(line, i, i)
            local isFunction = nextChar == "("
            
            if Keywords[word] then
                result = result .. '<font color="rgb(248,109,124)">' .. word .. '</font>'
            elseif word == "self" then
                result = result .. '<font color="rgb(248,109,124)">' .. word .. '</font>'
            elseif word == "true" or word == "false" then
                result = result .. '<font color="rgb(255,198,109)">' .. word .. '</font>'
            elseif word == "nil" then
                result = result .. '<font color="rgb(255,198,109)">' .. word .. '</font>'
            elseif Builtins[word] then
                result = result .. '<font color="rgb(102,217,239)">' .. word .. '</font>'
            elseif isFunction then
                result = result .. '<font color="rgb(166,226,46)">' .. word .. '</font>'
            else
                result = result .. word
            end
        else
            if char == "<" then
                result = result .. "&lt;"
            elseif char == ">" then
                result = result .. "&gt;"
            elseif char == "&" then
                result = result .. "&amp;"
            else
                result = result .. char
            end
            i = i + 1
        end
    end
    
    return result
end

function CodeViewerWindow:GenerateAnnotatedSource(source: string, functions: {FunctionData}): string
    local lines = string.split(source, "\n")
    local annotatedLines = {}
    local functionsByLine = {}
    
    for _, func in ipairs(functions) do
        if func.Line and func.Line > 0 then
            if not functionsByLine[func.Line] then
                functionsByLine[func.Line] = {}
            end
            table.insert(functionsByLine[func.Line], func)
        end
    end
    
    local header = {
        "--[[ SCRIPT DUMPER - FUNCTION ANALYSIS",
        ""
    }
    
    for _, func in ipairs(functions) do
        table.insert(header, "     +-- FUNCTION: " .. func.Name)
        table.insert(header, "     |   Source: " .. tostring(func.Source))
        table.insert(header, "     |   Line: " .. tostring(func.Line))
        
        local constCount = 0
        for _ in pairs(func.Constants) do constCount = constCount + 1 end
        local upvalCount = 0
        for _ in pairs(func.Upvalues) do upvalCount = upvalCount + 1 end
        
        table.insert(header, "     |")
        table.insert(header, "     |   @CONSTANTS (" .. tostring(constCount) .. "):")
        for idx, val in pairs(func.Constants) do
            local valStr = tostring(val)
            if type(val) == "string" then
                valStr = '"' .. string.sub(val, 1, 50) .. (string.len(val) > 50 and '..."' or '"')
            end
            table.insert(header, "     |     [" .. tostring(idx) .. "] = " .. valStr .. " (" .. typeof(val) .. ")")
        end
        
        table.insert(header, "     |")
        table.insert(header, "     |   @UPVALUES (" .. tostring(upvalCount) .. "):")
        for idx, val in pairs(func.Upvalues) do
            local valStr = tostring(val)
            if type(val) == "string" then
                valStr = '"' .. string.sub(val, 1, 50) .. (string.len(val) > 50 and '..."' or '"')
            elseif type(val) == "function" then
                local info = ""
                SafeCall(function()
                    local src, name, line = debug.info(val, "sln")
                    info = (name or "anonymous") .. "@" .. tostring(line or "?")
                end)
                valStr = "(function: " .. info .. ")"
            elseif type(val) == "table" then
                local count = 0
                for _ in pairs(val) do count = count + 1 end
                valStr = "(table[" .. tostring(count) .. "])"
            end
            table.insert(header, "     |     [" .. tostring(idx) .. "] = " .. valStr .. " (" .. typeof(val) .. ")")
        end
        
        if #func.Protos > 0 then
            table.insert(header, "     |")
            table.insert(header, "     |   @PROTOS (" .. tostring(#func.Protos) .. "):")
            for i, proto in ipairs(func.Protos) do
                local pConstCount = 0
                for _ in pairs(proto.Constants) do pConstCount = pConstCount + 1 end
                local pUpvalCount = 0
                for _ in pairs(proto.Upvalues) do pUpvalCount = pUpvalCount + 1 end
                table.insert(header, "     |     [" .. tostring(i) .. "] " .. proto.Name .. " (C:" .. tostring(pConstCount) .. " U:" .. tostring(pUpvalCount) .. ")")
                
                if pConstCount > 0 then
                    table.insert(header, "     |         Constants:")
                    for idx, val in pairs(proto.Constants) do
                        local valStr = tostring(val)
                        if type(val) == "string" then
                            valStr = '"' .. string.sub(val, 1, 30) .. (string.len(val) > 30 and '..."' or '"')
                        end
                        table.insert(header, "     |           [" .. tostring(idx) .. "] = " .. valStr)
                    end
                end
                
                if pUpvalCount > 0 then
                    table.insert(header, "     |         Upvalues:")
                    for idx, val in pairs(proto.Upvalues) do
                        local valStr = tostring(val)
                        if type(val) == "string" then
                            valStr = '"' .. string.sub(val, 1, 30) .. (string.len(val) > 30 and '..."' or '"')
                        elseif type(val) == "function" then
                            valStr = "(function)"
                        elseif type(val) == "table" then
                            valStr = "(table)"
                        end
                        table.insert(header, "     |           [" .. tostring(idx) .. "] = " .. valStr)
                    end
                end
            end
        end
        
        table.insert(header, "     +---------------------------------------------------------------")
        table.insert(header, "")
    end
    
    table.insert(header, "]]--")
    table.insert(header, "")
    
    for _, headerLine in ipairs(header) do
        table.insert(annotatedLines, headerLine)
    end
    
    for lineNum, line in ipairs(lines) do
        local funcsAtLine = functionsByLine[lineNum]
        
        if funcsAtLine then
            for _, func in ipairs(funcsAtLine) do
                local constCount = 0
                for _ in pairs(func.Constants) do constCount = constCount + 1 end
                local upvalCount = 0
                for _ in pairs(func.Upvalues) do upvalCount = upvalCount + 1 end
                
                local annotation = "-- @FUNC[" .. func.Name .. "] C:" .. tostring(constCount) .. " U:" .. tostring(upvalCount) .. " P:" .. tostring(#func.Protos)
                table.insert(annotatedLines, annotation)
            end
        end
        
        table.insert(annotatedLines, line)
    end
    
    return table.concat(annotatedLines, "\n")
end

function CodeViewerWindow:SetSource(source: string, scriptName: string?, funcInfo: FunctionData?, allFunctions: {FunctionData}?)
    if not self.Gui then
        self:Create()
    end
    
    self.AllFunctions = allFunctions or {}
    self.FunctionInfo = funcInfo
    
    local annotatedSource = source
    if #self.AllFunctions > 0 then
        annotatedSource = self:GenerateAnnotatedSource(source, self.AllFunctions)
    end
    
    self.CurrentSource = annotatedSource
    self.Lines = string.split(annotatedSource, "\n")
    
    self.TitleLabel.Text = "Code Viewer - " .. (scriptName or "Unknown Script")
    
    local totalConsts = 0
    local totalUpvals = 0
    local totalProtos = 0
    
    for _, func in ipairs(self.AllFunctions) do
        for _ in pairs(func.Constants) do totalConsts = totalConsts + 1 end
        for _ in pairs(func.Upvalues) do totalUpvals = totalUpvals + 1 end
        totalProtos = totalProtos + #func.Protos
    end
    
    local infoText = "Lines: " .. tostring(#self.Lines) .. " | Chars: " .. tostring(#annotatedSource)
    infoText = infoText .. " | <font color=\"rgb(166,226,46)\">Funcs: " .. tostring(#self.AllFunctions) .. "</font>"
    infoText = infoText .. " | <font color=\"rgb(174,129,255)\">Consts: " .. tostring(totalConsts) .. "</font>"
    infoText = infoText .. " | <font color=\"rgb(253,151,31)\">Upvals: " .. tostring(totalUpvals) .. "</font>"
    infoText = infoText .. " | <font color=\"rgb(102,217,239)\">Protos: " .. tostring(totalProtos) .. "</font>"
    
    self.InfoLabel.Text = infoText
    
    for _, child in ipairs(self.LineNumbers:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    for _, child in ipairs(self.CodeFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    local lineHeight = 18
    local batchSize = 100
    
    task.spawn(function()
        for i, line in ipairs(self.Lines) do
            local isAnnotation = string.match(line, "^%-%-") or string.match(line, "^%s*%-%-") or 
                                 string.match(line, "^%s*%+") or string.match(line, "^%s*|")
            
            local lineNumLabel = Instance.new("TextLabel")
            lineNumLabel.Size = UDim2.new(1, 0, 0, lineHeight)
            lineNumLabel.BackgroundTransparency = 1
            lineNumLabel.Font = Enum.Font.Code
            lineNumLabel.Text = tostring(i)
            lineNumLabel.TextColor3 = SyntaxColors.LineNumber
            lineNumLabel.TextSize = 13
            lineNumLabel.TextXAlignment = Enum.TextXAlignment.Right
            lineNumLabel.LayoutOrder = i
            lineNumLabel.Parent = self.LineNumbers
            
            local codeLine = Instance.new("TextLabel")
            codeLine.Size = UDim2.new(1, 0, 0, lineHeight)
            codeLine.BackgroundTransparency = 1
            codeLine.Font = Enum.Font.Code
            codeLine.RichText = true
            codeLine.Text = "  " .. self:HighlightLine(line, isAnnotation)
            codeLine.TextColor3 = SyntaxColors.Variable
            codeLine.TextSize = 13
            codeLine.TextXAlignment = Enum.TextXAlignment.Left
            codeLine.TextTruncate = Enum.TextTruncate.None
            codeLine.LayoutOrder = i
            codeLine.Parent = self.CodeFrame
            
            if i % batchSize == 0 then
                task.wait()
            end
        end
        
        local canvasHeight = #self.Lines * lineHeight + 20
        self.ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, canvasHeight)
    end)
end

function CodeViewerWindow:Show()
    if not self.Gui then
        self:Create()
    end
    
    self.MainFrame.Visible = true
    self.Visible = true
    
    self.MainFrame.Size = UDim2.new(0, 0, 0, 0)
    self.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    TweenService:Create(self.MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 1000, 0, 750),
        Position = UDim2.new(0.5, -500, 0.5, -375)
    }):Play()
end

function CodeViewerWindow:Hide()
    if not self.MainFrame then return end
    
    TweenService:Create(self.MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    
    task.wait(0.2)
    self.MainFrame.Visible = false
    self.Visible = false
end

function CodeViewerWindow:Destroy()
    if self.Gui then
        self.Gui:Destroy()
        self.Gui = nil
    end
end

local Serializer = {}
Serializer.__index = Serializer

Serializer.Cache = setmetatable({}, {__mode = "k"})
Serializer.MaxDepth = 3
Serializer.MaxTableSize = 50
Serializer.MaxStringLength = 100

function Serializer.GetType(value: any): string
    local t = typeof(value)
    if t == "table" then
        local mt = getmetatable(value)
        if mt and rawget(mt, "__tostring") then
            return "custom_table"
        end
    end
    return t
end

function Serializer.GetDisplayType(value: any): string
    local t = typeof(value)
    if t == "function" then
        local success, info = SafeCall(function()
            local src, name, line = debug.info(value, "sln")
            return (name or "anonymous") .. "@" .. tostring(line or "?")
        end)
        if success then
            return "function(" .. info .. ")"
        end
        return "function"
    elseif t == "table" then
        local count = 0
        for _ in pairs(value) do count = count + 1 end
        return "table[" .. tostring(count) .. "]"
    elseif t == "Instance" then
        local success, class = SafeCall(function() return value.ClassName end)
        if success then
            return "Instance(" .. class .. ")"
        end
        return "Instance"
    end
    return t
end

function Serializer.SerializeTable(tbl: {[any]: any}, depth: number?): string
    depth = depth or 0
    
    if depth > Serializer.MaxDepth then
        return "{...}"
    end
    
    local cached = Serializer.Cache[tbl]
    if cached then
        return cached
    end
    
    local parts = {}
    local count = 0
    
    for k, v in pairs(tbl) do
        if count >= Serializer.MaxTableSize then
            table.insert(parts, "...")
            break
        end
        
        local keyStr = Serializer.Serialize(k, depth + 1)
        local valStr = Serializer.Serialize(v, depth + 1)
        table.insert(parts, "[" .. keyStr .. "]=" .. valStr)
        count = count + 1
    end
    
    local result = "{" .. table.concat(parts, ", ") .. "}"
    Serializer.Cache[tbl] = result
    
    return result
end

function Serializer.Serialize(value: any, depth: number?): string
    depth = depth or 0
    
    local valueType = Serializer.GetType(value)
    
    if valueType == "nil" then
        return "nil"
    elseif valueType == "boolean" then
        return tostring(value)
    elseif valueType == "number" then
        if value ~= value then
            return "nan"
        elseif value == math.huge then
            return "inf"
        elseif value == -math.huge then
            return "-inf"
        end
        return tostring(value)
    elseif valueType == "string" then
        if #value > Serializer.MaxStringLength then
            return '"' .. string.sub(value, 1, Serializer.MaxStringLength - 3) .. '..."'
        end
        return '"' .. value:gsub('[\n\r\t\\"]', {
            ["\n"] = "\\n",
            ["\r"] = "\\r",
            ["\t"] = "\\t",
            ["\\"] = "\\\\",
            ['"'] = '\\"'
        }) .. '"'
    elseif valueType == "function" then
        local info = ""
        local success, result = SafeCall(function()
            local src, name, line = debug.info(value, "sln")
            return (name or "anonymous") .. "@" .. tostring(line or "?")
        end)
        if success then
            info = result
        end
        return "(function: " .. info .. ")"
    elseif valueType == "table" then
        return Serializer.SerializeTable(value, depth)
    elseif valueType == "custom_table" then
        local success, str = SafeCall(tostring, value)
        if success then
            return "(" .. str .. ")"
        end
        return "(custom_table)"
    elseif valueType == "userdata" then
        local success, str = SafeCall(tostring, value)
        if success then
            return "(userdata: " .. str .. ")"
        end
        return "(userdata)"
    elseif valueType == "thread" then
        return "(thread: " .. tostring(coroutine.status(value)) .. ")"
    elseif valueType == "Instance" then
        local success, path = SafeCall(function()
            return value:GetFullName()
        end)
        if success then
            return "(Instance: " .. path .. ")"
        end
        return "(Instance)"
    elseif valueType == "Vector3" then
        return string.format("Vector3(%g, %g, %g)", value.X, value.Y, value.Z)
    elseif valueType == "Vector2" then
        return string.format("Vector2(%g, %g)", value.X, value.Y)
    elseif valueType == "CFrame" then
        return string.format("CFrame(%g, %g, %g)", value.X, value.Y, value.Z)
    elseif valueType == "Color3" then
        return string.format("Color3(%g, %g, %g)", value.R, value.G, value.B)
    elseif valueType == "UDim2" then
        return string.format("UDim2(%g, %d, %g, %d)", value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset)
    elseif valueType == "UDim" then
        return string.format("UDim(%g, %d)", value.Scale, value.Offset)
    elseif valueType == "Enum" then
        return tostring(value)
    elseif valueType == "EnumItem" then
        return tostring(value)
    else
        return "(" .. valueType .. ")"
    end
end

function Serializer.SerializeWithType(value: any): SerializedValue
    return {
        Type = Serializer.GetType(value),
        DisplayType = Serializer.GetDisplayType(value),
        Value = Serializer.Serialize(value),
        Raw = value
    }
end

function Serializer.ClearCache()
    Serializer.Cache = setmetatable({}, {__mode = "k"})
end

local FunctionHasher = {}
FunctionHasher.__index = FunctionHasher

function FunctionHasher.ComputeHash(func: (...any) -> ...any): string
    local parts = {}
    
    SafeCall(function()
        local source, name, line = debug.info(func, "sln")
        table.insert(parts, tostring(source or ""))
        table.insert(parts, tostring(line or 0))
    end)
    
    SafeCall(function()
        local constants = debug.getconstants(func)
        local constCount = 0
        for _ in pairs(constants) do
            constCount = constCount + 1
        end
        table.insert(parts, "c" .. tostring(constCount))
    end)
    
    SafeCall(function()
        local upvalues = debug.getupvalues(func)
        local upvalCount = 0
        for _ in pairs(upvalues) do
            upvalCount = upvalCount + 1
        end
        table.insert(parts, "u" .. tostring(upvalCount))
    end)
    
    SafeCall(function()
        local protos = debug.getprotos(func)
        table.insert(parts, "p" .. tostring(#protos))
    end)
    
    return table.concat(parts, "_")
end

local ScriptAnalyzer = {}
ScriptAnalyzer.__index = ScriptAnalyzer

function ScriptAnalyzer.new()
    local self = setmetatable({}, ScriptAnalyzer)
    self.Scripts = {} :: {ScriptData}
    self.ScriptMap = {} :: {[string]: ScriptData}
    self.FunctionCache = {} :: {[string]: FunctionData}
    self.HookedFunctions = {} :: {[(...any) -> ...any]: (...any) -> ...any}
    self.OriginalFunctions = {} :: {[(...any) -> ...any]: (...any) -> ...any}
    return self
end

function ScriptAnalyzer:AnalyzeProto(proto: (...any) -> ...any, index: number, parent: FunctionData?): ProtoData
    local data: ProtoData = {
        Func = proto,
        Index = index,
        Name = "proto_" .. tostring(index),
        Source = "unknown",
        Line = 0,
        Constants = {},
        Upvalues = {},
        Parent = parent
    }
    
    SafeCall(function()
        local source, name, line = debug.info(proto, "sln")
        data.Source = source or "unknown"
        data.Line = tonumber(line) or 0
        data.Name = tostring(data.Line) .. ":" .. (name or "proto_" .. tostring(index))
    end)
    
    SafeCall(function()
        data.Constants = debug.getconstants(proto)
    end)
    
    SafeCall(function()
        data.Upvalues = debug.getupvalues(proto)
    end)
    
    return data
end

function ScriptAnalyzer:AnalyzeFunction(func: (...any) -> ...any): FunctionData?
    local hash = FunctionHasher.ComputeHash(func)
    
    if self.FunctionCache[hash] then
        return nil
    end
    
    local data: FunctionData = {
        Func = func,
        Hash = hash,
        Name = "unknown",
        Source = "unknown",
        Line = 0,
        Upvalues = {},
        Constants = {},
        Protos = {},
        Stack = {},
        IsHooked = false
    }
    
    SafeCall(function()
        local source, name, line = debug.info(func, "sln")
        data.Source = source or "unknown"
        data.Line = tonumber(line) or 0
        data.Name = tostring(data.Line) .. ":" .. (name or "anonymous")
    end)
    
    SafeCall(function()
        data.Constants = debug.getconstants(func)
    end)
    
    SafeCall(function()
        data.Upvalues = debug.getupvalues(func)
    end)
    
    SafeCall(function()
        local protos = debug.getprotos(func)
        for i, proto in ipairs(protos) do
            local protoData = self:AnalyzeProto(proto, i, data)
            table.insert(data.Protos, protoData)
        end
    end)
    
    if self.HookedFunctions[func] then
        data.IsHooked = true
    end
    
    self.FunctionCache[hash] = data
    return data
end

function ScriptAnalyzer:RefreshFunctionData(func: FunctionData)
    SafeCall(function()
        func.Constants = debug.getconstants(func.Func)
    end)
    
    SafeCall(function()
        func.Upvalues = debug.getupvalues(func.Func)
    end)
    
    for _, proto in ipairs(func.Protos) do
        SafeCall(function()
            proto.Constants = debug.getconstants(proto.Func)
        end)
        SafeCall(function()
            proto.Upvalues = debug.getupvalues(proto.Func)
        end)
    end
end

function ScriptAnalyzer:GetScriptFunctions(scriptInstance: Instance): {FunctionData}
    local functions: {FunctionData} = {}
    
    if not scriptInstance then
        return functions
    end
    
    local scriptName = scriptInstance.Name
    local batchSize = 1000
    local processed = 0
    
    SafeCall(function()
        local gcObjects = getgc(true)
        
        for _, obj in ipairs(gcObjects) do
            if typeof(obj) == "function" then
                local source = ""
                
                SafeCall(function()
                    source = debug.info(obj, "s") or ""
                end)
                
                if source ~= "" and string.find(source, scriptName, 1, true) then
                    local funcData = self:AnalyzeFunction(obj)
                    if funcData then
                        table.insert(functions, funcData)
                    end
                end
            end
            
            processed = processed + 1
            
            if processed % batchSize == 0 then
                task.wait()
            end
        end
    end)
    
    table.sort(functions, function(a, b)
        return a.Line < b.Line
    end)
    
    return functions
end

function ScriptAnalyzer:FindDeletedScripts(): {ScriptData}
    local deletedScripts: {ScriptData} = {}
    local foundSources: {[string]: boolean} = {}
    
    SafeCall(function()
        local gcObjects = getgc(true)
        
        for _, obj in ipairs(gcObjects) do
            if typeof(obj) == "function" then
                local source = ""
                
                SafeCall(function()
                    source = debug.info(obj, "s") or ""
                end)
                
                if source ~= "" and not foundSources[source] then
                    local isDeleted = true
                    
                    SafeCall(function()
                        local scripts = getscripts()
                        for _, script in ipairs(scripts) do
                            if string.find(source, script.Name, 1, true) then
                                isDeleted = false
                                break
                            end
                        end
                    end)
                    
                    if isDeleted and string.match(source, "^[%w_%.]+$") then
                        foundSources[source] = true
                        
                        local scriptData: ScriptData = {
                            Instance = nil,
                            Name = source .. " [DELETED]",
                            Type = "Deleted",
                            Functions = {},
                            Path = "deleted." .. source,
                            FunctionCount = 0,
                            IsDeleted = true
                        }
                        
                        table.insert(deletedScripts, scriptData)
                    end
                end
            end
        end
    end)
    
    return deletedScripts
end

function ScriptAnalyzer:ScanAllScripts(): {ScriptData}
    local scripts: {ScriptData} = {}
    local addedPaths: {[string]: boolean} = {}
    
    self.ScriptMap = {}
    self.FunctionCache = {}
    Serializer.ClearCache()
    
    SafeCall(function()
        local allScripts = getscripts()
        
        if allScripts and typeof(allScripts) == "table" then
            for _, script in ipairs(allScripts) do
                if script and typeof(script) == "Instance" then
                    local fullPath = ""
                    
                    SafeCall(function()
                        fullPath = script:GetFullName()
                    end)
                    
                    if fullPath == "" then
                        fullPath = script.Name .. "_" .. tostring(RNG:NextInteger(100000, 999999))
                    end
                    
                    if not addedPaths[fullPath] then
                        addedPaths[fullPath] = true
                        
                        local scriptType = "Unknown"
                        SafeCall(function()
                            scriptType = script.ClassName
                        end)
                        
                        local scriptName = "Unknown"
                        SafeCall(function()
                            scriptName = script.Name
                        end)
                        
                        local prefix = scriptType == "LocalScript" and "[L] " or "[M] "
                        local displayName = prefix .. scriptName
                        
                        local scriptData: ScriptData = {
                            Instance = script,
                            Name = scriptName,
                            Type = scriptType,
                            Functions = {},
                            Path = fullPath,
                            FunctionCount = 0,
                            IsDeleted = false
                        }
                        
                        table.insert(scripts, scriptData)
                        self.ScriptMap[displayName] = scriptData
                    end
                end
            end
        end
    end)
    
    local deletedScripts = self:FindDeletedScripts()
    for _, scriptData in ipairs(deletedScripts) do
        local displayName = "[D] " .. scriptData.Name
        table.insert(scripts, scriptData)
        self.ScriptMap[displayName] = scriptData
    end
    
    self.Scripts = scripts
    return scripts
end

function ScriptAnalyzer:GetScriptList(): {string}
    local list = {}
    for name, _ in pairs(self.ScriptMap) do
        table.insert(list, name)
    end
    table.sort(list)
    return list
end

function ScriptAnalyzer:GetScriptByName(name: string): ScriptData?
    return self.ScriptMap[name]
end

function ScriptAnalyzer:DecompileScript(scriptInstance: Instance): string
    if not scriptInstance then
        return "-- No script selected"
    end
    
    local success, result = SafeCall(function()
        return decompile(scriptInstance)
    end)
    
    if success and result then
        return tostring(result)
    else
        return "-- Decompilation failed\n-- Error: " .. tostring(result or "Unknown error")
    end
end

function ScriptAnalyzer:SetConstant(func: (...any) -> ...any, index: number, value: any): (boolean, string?)
    local success, err = SafeCall(function()
        debug.setconstant(func, index, value)
    end)
    
    if success then
        return true, nil
    else
        return false, tostring(err)
    end
end

function ScriptAnalyzer:SetUpvalue(func: (...any) -> ...any, index: number, value: any): (boolean, string?)
    local success, err = SafeCall(function()
        debug.setupvalue(func, index, value)
    end)
    
    if success then
        return true, nil
    else
        return false, tostring(err)
    end
end

function ScriptAnalyzer:GetStack(level: number, index: number?): any
    local success, result = SafeCall(function()
        return debug.getstack(level, index)
    end)
    
    if success then
        return result
    end
    return nil
end

function ScriptAnalyzer:SetStack(level: number, index: number, value: any): (boolean, string?)
    local success, err = SafeCall(function()
        debug.setstack(level, index, value)
    end)
    
    if success then
        return true, nil
    else
        return false, tostring(err)
    end
end

function ScriptAnalyzer:HookFunctionToNil(func: (...any) -> ...any): (boolean, string?, (...any) -> ...any?)
    if not hookfunction then
        return false, "hookfunction not available", nil
    end
    
    if not clonefunction then
        return false, "clonefunction not available", nil
    end
    
    local success, result = SafeCall(function()
        local cloned = clonefunction(func)
        self.OriginalFunctions[func] = cloned
        
        local original = hookfunction(func, newcclosure(function(...)
            return coroutine.yield(coroutine.running())
        end))
        
        return original
    end)
    
    if success then
        self.HookedFunctions[func] = result
        return true, nil, result
    else
        return false, tostring(result), nil
    end
end

function ScriptAnalyzer:RestoreFunction(func: (...any) -> ...any): (boolean, string?)
    local original = self.OriginalFunctions[func] or self.HookedFunctions[func]
    
    if not original then
        return false, "Function not hooked or original not found"
    end
    
    if restorefunction then
        local success, err = SafeCall(function()
            restorefunction(func)
        end)
        
        if success then
            self.HookedFunctions[func] = nil
            self.OriginalFunctions[func] = nil
            return true, nil
        else
            return false, tostring(err)
        end
    else
        local success, err = SafeCall(function()
            hookfunction(func, original)
        end)
        
        if success then
            self.HookedFunctions[func] = nil
            self.OriginalFunctions[func] = nil
            return true, nil
        else
            return false, tostring(err)
        end
    end
end

function ScriptAnalyzer:SetProtoConstant(proto: ProtoData, index: number, value: any): (boolean, string?)
    return self:SetConstant(proto.Func, index, value)
end

function ScriptAnalyzer:SetProtoUpvalue(proto: ProtoData, index: number, value: any): (boolean, string?)
    return self:SetUpvalue(proto.Func, index, value)
end

function ScriptAnalyzer:GetFunctionStats(func: FunctionData): {[string]: number}
    local constCount = 0
    local upvalCount = 0
    local protoCount = #func.Protos
    local totalProtoConsts = 0
    local totalProtoUpvals = 0
    
    for _ in pairs(func.Constants) do
        constCount = constCount + 1
    end
    
    for _ in pairs(func.Upvalues) do
        upvalCount = upvalCount + 1
    end
    
    for _, proto in ipairs(func.Protos) do
        for _ in pairs(proto.Constants) do
            totalProtoConsts = totalProtoConsts + 1
        end
        for _ in pairs(proto.Upvalues) do
            totalProtoUpvals = totalProtoUpvals + 1
        end
    end
    
    return {
        Constants = constCount,
        Upvalues = upvalCount,
        Protos = protoCount,
        ProtoConstants = totalProtoConsts,
        ProtoUpvalues = totalProtoUpvals,
        Total = constCount + upvalCount + totalProtoConsts + totalProtoUpvals
    }
end

function ScriptAnalyzer:ClearCache()
    self.FunctionCache = {}
    Serializer.ClearCache()
end

local Config = {
    RequiredFunctions = {"getgc", "decompile", "getscripts", "identifyexecutor", "hookfunction", "clonefunction"},
    RequiredDebugFunctions = {"getconstants", "getupvalues", "getprotos", "setconstant", "setupvalue", "info", "getstack", "setstack"}
}

local Utils = {}

function Utils.GetExecutorName(): string
    if identifyexecutor then
        local success, name = SafeCall(identifyexecutor)
        if success and name then
            return tostring(name)
        end
    end
    return "Unknown"
end

function Utils.CheckFunction(name: string): boolean
    local env = getfenv()
    if env[name] ~= nil then
        return true
    end
    if getgenv and getgenv()[name] ~= nil then
        return true
    end
    return false
end

function Utils.CheckDebugFunction(name: string): boolean
    if debug and debug[name] ~= nil then
        return true
    end
    return false
end

function Utils.CheckAllFunctions(): (boolean, {string})
    local missing: {string} = {}
    
    for _, funcName in ipairs(Config.RequiredFunctions) do
        if not Utils.CheckFunction(funcName) then
            table.insert(missing, funcName)
        end
    end
    
    for _, funcName in ipairs(Config.RequiredDebugFunctions) do
        if not Utils.CheckDebugFunction(funcName) then
            table.insert(missing, "debug." .. funcName)
        end
    end
    
    return #missing == 0, missing
end

function Utils.TruncateText(text: any, maxLen: number): string
    local str = tostring(text)
    
    if #str > maxLen then
        return string.sub(str, 1, maxLen - 3) .. "..."
    end
    
    return str
end

function Utils.CountTable(tbl: {[any]: any}): number
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function Utils.ParseValue(valueStr: string): any
    if valueStr == "nil" then
        return nil
    elseif valueStr == "true" then
        return true
    elseif valueStr == "false" then
        return false
    else
        local numValue = tonumber(valueStr)
        if numValue then
            return numValue
        else
            return valueStr
        end
    end
end

function Utils.ParseEditInput(text: string, selectedIndex: number?): (number?, any?, string?)
    local colonPos = string.find(text, ":", 1, true)
    
    if colonPos then
        local indexStr = string.sub(text, 1, colonPos - 1)
        local valueStr = string.sub(text, colonPos + 1)
        
        local index = tonumber(indexStr)
        if not index then
            return nil, nil, "Invalid index"
        end
        
        return index, Utils.ParseValue(valueStr), nil
    else
        if selectedIndex then
            return selectedIndex, Utils.ParseValue(text), nil
        else
            return nil, nil, "No index selected. Use index:value format or select an item first"
        end
    end
end

local UIController = {}
UIController.__index = UIController

function UIController.new(analyzer: typeof(ScriptAnalyzer.new()))
    local self = setmetatable({}, UIController)
    
    self.Analyzer = analyzer
    self.Window = nil
    self.CodeViewer = CodeViewerWindow.new()
    
    self.CurrentScript = nil :: ScriptData?
    self.CurrentFunction = nil :: FunctionData?
    self.CurrentProto = nil :: ProtoData?
    
    self.SelectedConstantIndex = nil :: number?
    self.SelectedUpvalueIndex = nil :: number?
    self.SelectedProtoConstantIndex = nil :: number?
    self.SelectedProtoUpvalueIndex = nil :: number?
    self.SelectedStackLevel = nil :: number?
    self.SelectedStackIndex = nil :: number?
    
    self.FunctionMap = {} :: {[string]: FunctionData}
    self.ConstantMap = {} :: {[string]: {index: number, value: any}}
    self.UpvalueMap = {} :: {[string]: {index: number, value: any}}
    self.ProtoMap = {} :: {[string]: ProtoData}
    self.ProtoConstantMap = {} :: {[string]: {proto: ProtoData, index: number, value: any}}
    self.ProtoUpvalueMap = {} :: {[string]: {proto: ProtoData, index: number, value: any}}
    self.StackMap = {} :: {[string]: StackData}
    
    self.DecompiledSource = ""
    
    self.Dropdowns = {}
    self.Paragraphs = {}
    
    return self
end

function UIController:Initialize()
    self.Window = Fluent:CreateWindow({
        Title = "Script.Dumper",
        SubTitle = "Advanced Script Analyzer",
        TabWidth = 160,
        Size = UDim2.fromOffset(650, 550),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })
    
    self:CreateScriptsTab()
    self:CreateFunctionsTab()
    self:CreateConstantsTab()
    self:CreateUpvaluesTab()
    self:CreateStackTab()
    self:CreateProtosTab()
    self:CreateDecompileTab()
    self:CreateFAQTab()
    self:CreateSettingsTab()
    
    self.Window:SelectTab(1)
    
    Fluent:Notify({
        Title = "Script.Dumper",
        Content = "Loaded. Found " .. tostring(#self.Analyzer.Scripts) .. " scripts.",
        Duration = 3
    })
end

function UIController:CreateScriptsTab()
    local tab = self.Window:AddTab({Title = "Scripts", Icon = "file-text"})
    
    tab:AddParagraph({
        Title = "Info",
        Content = "Executor: " .. Utils.GetExecutorName() .. "\nScripts: " .. tostring(#self.Analyzer.Scripts)
    })
    
    self.Dropdowns.Script = tab:AddDropdown("ScriptSelect", {
        Title = "Select Script",
        Values = self.Analyzer:GetScriptList(),
        Multi = false,
        Default = nil
    })
    
    self.Paragraphs.ScriptInfo = tab:AddParagraph({
        Title = "Selected Script",
        Content = "No script selected"
    })
    
    self.Dropdowns.Script:OnChanged(function(value)
        self:OnScriptSelected(value)
    end)
    
    tab:AddButton({
        Title = "Refresh Scripts",
        Callback = function()
            self:RefreshScripts()
        end
    })
end

function UIController:CreateFunctionsTab()
    local tab = self.Window:AddTab({Title = "Functions", Icon = "code"})
    
    tab:AddParagraph({
        Title = "Functions",
        Content = "Select a script first"
    })
    
    self.Dropdowns.Function = tab:AddDropdown("FunctionSelect", {
        Title = "Select Function",
        Values = {"No script selected"},
        Multi = false,
        Default = nil
    })
    
    self.Paragraphs.FunctionInfo = tab:AddParagraph({
        Title = "Function Info",
        Content = "No function selected"
    })
    
    self.Dropdowns.Function:OnChanged(function(value)
        self:OnFunctionSelected(value)
    end)
    
    tab:AddButton({
        Title = "Hook Function (yield)",
        Description = "Hook function to freeze with coroutine.yield",
        Callback = function()
            self:HookSelectedFunction()
        end
    })
    
    tab:AddButton({
        Title = "Restore Function",
        Description = "Restore hooked function to original",
        Callback = function()
            self:RestoreSelectedFunction()
        end
    })
end

function UIController:CreateConstantsTab()
    local tab = self.Window:AddTab({Title = "Constants", Icon = "hash"})
    
    self.Dropdowns.Constant = tab:AddDropdown("ConstantSelect", {
        Title = "Select Constant",
        Values = {"No function selected"},
        Multi = false,
        Default = nil
    })
    
    self.Paragraphs.ConstantInfo = tab:AddParagraph({
        Title = "Constant Details",
        Content = "Select a constant"
    })
    
    self.Dropdowns.Constant:OnChanged(function(value)
        self:OnConstantSelected(value)
    end)
    
    tab:AddInput("ConstantEdit", {
        Title = "Edit Constant (value or index:value)",
        Default = "",
        Placeholder = "newvalue or 1:newvalue",
        Numeric = false,
        Finished = true,
        Callback = function(text)
            self:EditConstant(text)
        end
    })
end

function UIController:CreateUpvaluesTab()
    local tab = self.Window:AddTab({Title = "Upvalues", Icon = "arrow-up"})
    
    self.Dropdowns.Upvalue = tab:AddDropdown("UpvalueSelect", {
        Title = "Select Upvalue",
        Values = {"No function selected"},
        Multi = false,
        Default = nil
    })
    
    self.Paragraphs.UpvalueInfo = tab:AddParagraph({
        Title = "Upvalue Details",
        Content = "Select an upvalue"
    })
    
    self.Dropdowns.Upvalue:OnChanged(function(value)
        self:OnUpvalueSelected(value)
    end)
    
    tab:AddInput("UpvalueEdit", {
        Title = "Edit Upvalue (value or index:value)",
        Default = "",
        Placeholder = "newvalue or 1:newvalue",
        Numeric = false,
        Finished = true,
        Callback = function(text)
            self:EditUpvalue(text)
        end
    })
end

function UIController:CreateStackTab()
    local tab = self.Window:AddTab({Title = "Stack", Icon = "layers"})
    
    self.Dropdowns.Stack = tab:AddDropdown("StackSelect", {
        Title = "Select Stack Variable",
        Values = {"No stack data"},
        Multi = false,
        Default = nil
    })
    
    self.Paragraphs.StackInfo = tab:AddParagraph({
        Title = "Stack Details",
        Content = "Select a stack variable"
    })
    
    self.Dropdowns.Stack:OnChanged(function(value)
        self:OnStackSelected(value)
    end)
    
    tab:AddInput("StackEdit", {
        Title = "Edit Stack (value or level:index:value)",
        Default = "",
        Placeholder = "newvalue or 1:1:newvalue",
        Numeric = false,
        Finished = true,
        Callback = function(text)
            self:EditStack(text)
        end
    })
    
    tab:AddButton({
        Title = "Refresh Stack",
        Callback = function()
            self:RefreshStack()
        end
    })
end

function UIController:CreateProtosTab()
    local tab = self.Window:AddTab({Title = "Protos", Icon = "git-branch"})
    
    self.Dropdowns.Proto = tab:AddDropdown("ProtoSelect", {
        Title = "Select Proto",
        Values = {"No function selected"},
        Multi = false,
        Default = nil
    })
    
    self.Paragraphs.ProtoInfo = tab:AddParagraph({
        Title = "Proto Details",
        Content = "Select a proto"
    })
    
    self.Dropdowns.Proto:OnChanged(function(value)
        self:OnProtoSelected(value)
    end)
    
    self.Dropdowns.ProtoConstant = tab:AddDropdown("ProtoConstantSelect", {
        Title = "Proto Constants",
        Values = {"No proto selected"},
        Multi = false,
        Default = nil
    })
    
    self.Dropdowns.ProtoConstant:OnChanged(function(value)
        self:OnProtoConstantSelected(value)
    end)
    
    tab:AddInput("ProtoConstantEdit", {
        Title = "Edit Proto Constant (value or index:value)",
        Default = "",
        Placeholder = "newvalue or 1:newvalue",
        Numeric = false,
        Finished = true,
        Callback = function(text)
            self:EditProtoConstant(text)
        end
    })
    
    self.Dropdowns.ProtoUpvalue = tab:AddDropdown("ProtoUpvalueSelect", {
        Title = "Proto Upvalues",
        Values = {"No proto selected"},
        Multi = false,
        Default = nil
    })
    
    self.Dropdowns.ProtoUpvalue:OnChanged(function(value)
        self:OnProtoUpvalueSelected(value)
    end)
    
    tab:AddInput("ProtoUpvalueEdit", {
        Title = "Edit Proto Upvalue (value or index:value)",
        Default = "",
        Placeholder = "newvalue or 1:newvalue",
        Numeric = false,
        Finished = true,
        Callback = function(text)
            self:EditProtoUpvalue(text)
        end
    })
    
    tab:AddButton({
        Title = "Hook Proto (yield)",
        Description = "Hook proto to freeze with coroutine.yield",
        Callback = function()
            self:HookSelectedProto()
        end
    })
end

function UIController:CreateDecompileTab()
    local tab = self.Window:AddTab({Title = "Decompile", Icon = "file-code"})
    
    self.Paragraphs.DecompileStatus = tab:AddParagraph({
        Title = "Status",
        Content = "No script decompiled"
    })
    
    tab:AddButton({
        Title = "Decompile Script",
        Callback = function()
            self:DecompileScript()
        end
    })
    
    tab:AddButton({
        Title = "Open Code Viewer (with annotations)",
        Callback = function()
            if self.DecompiledSource == "" then
                Fluent:Notify({Title = "Error", Content = "Decompile a script first", Duration = 2})
                return
            end
            
            local allFuncs = self.CurrentScript and self.CurrentScript.Functions or {}
            self.CodeViewer:SetSource(self.DecompiledSource, self.CurrentScript and self.CurrentScript.Name or "Unknown", self.CurrentFunction, allFuncs)
            self.CodeViewer:Show()
        end
    })
    
    tab:AddButton({
        Title = "Copy to Clipboard",
        Callback = function()
            self:CopySource()
        end
    })
    
    tab:AddButton({
        Title = "Save to File",
        Callback = function()
            self:SaveSource()
        end
    })
end

function UIController:CreateFAQTab()
    local tab = self.Window:AddTab({Title = "FAQ", Icon = "help-circle"})
    
    tab:AddParagraph({
        Title = "Script Developer",
        Content = "Developer: TesterD\nDiscord: testerd."
    })
    
    tab:AddParagraph({
        Title = "What is Script.Dumper?",
        Content = "Script.Dumper is an advanced tool for analyzing and modifying Luau scripts. Inspect functions, constants, upvalues, stack, and protos."
    })
    
    tab:AddParagraph({
        Title = "Code Viewer Annotations",
        Content = "The Code Viewer shows ALL constants, upvalues, and protos directly in the decompiled code with detailed annotations."
    })
    
    tab:AddParagraph({
        Title = "What are Constants?",
        Content = "Constants are fixed values used inside a function - strings, numbers, booleans hardcoded in the script."
    })
    
    tab:AddParagraph({
        Title = "What are Upvalues?",
        Content = "Upvalues are variables from outer scopes that a function uses."
    })
    
    tab:AddParagraph({
        Title = "What is Stack?",
        Content = "Stack contains local variables at different call levels."
    })
    
    tab:AddParagraph({
        Title = "What are Protos?",
        Content = "Protos are nested/inner functions with their own constants and upvalues."
    })
    
    tab:AddParagraph({
        Title = "How to Edit Values?",
        Content = "Select an item and enter new value, or use index:value format."
    })
    
    tab:AddParagraph({
        Title = "Hook Function",
        Content = "Hooks function with coroutine.yield()"
    })
    
    tab:AddParagraph({
        Title = "Script Types",
        Content = "[L] - LocalScript\n[M] - ModuleScript\n[D] - Deleted Script"
    })
end

function UIController:CreateSettingsTab()
    local tab = self.Window:AddTab({Title = "Settings", Icon = "settings"})
    
    tab:AddParagraph({
        Title = "Script.Dumper",
        Content = "Executor: " .. Utils.GetExecutorName() .. "\nScripts: " .. tostring(#self.Analyzer.Scripts)
    })
    
    tab:AddButton({
        Title = "Refresh All",
        Callback = function()
            self:RefreshAll()
        end
    })
    
    tab:AddButton({
        Title = "Clear Selection",
        Callback = function()
            self:ClearSelection()
        end
    })
    
    tab:AddButton({
        Title = "Clear Cache",
        Callback = function()
            self.Analyzer:ClearCache()
            Fluent:Notify({Title = "Cache Cleared", Content = "Function cache cleared", Duration = 2})
        end
    })
    
    tab:AddButton({
        Title = "Close Code Viewer",
        Callback = function()
            self.CodeViewer:Hide()
        end
    })
    
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    SaveManager:SetFolder("ScriptDumper")
    InterfaceManager:SetFolder("ScriptDumper")
    
    InterfaceManager:BuildInterfaceSection(tab)
    SaveManager:BuildConfigSection(tab)
end

function UIController:OnScriptSelected(value: string)
    self.CurrentScript = self.Analyzer:GetScriptByName(value)
    self.CurrentFunction = nil
    self.CurrentProto = nil
    self.FunctionMap = {}
    self.SelectedConstantIndex = nil
    self.SelectedUpvalueIndex = nil
    
    if not self.CurrentScript then
        return
    end
    
    self.Paragraphs.ScriptInfo:SetDesc(
        "Name: " .. self.CurrentScript.Name ..
        "\nType: " .. self.CurrentScript.Type ..
        "\nPath: " .. Utils.TruncateText(self.CurrentScript.Path, 60)
    )
    
    Fluent:Notify({Title = "Analyzing", Content = "Scanning " .. self.CurrentScript.Name, Duration = 2})
    
    task.spawn(function()
        if self.CurrentScript.Instance then
            self.CurrentScript.Functions = self.Analyzer:GetScriptFunctions(self.CurrentScript.Instance)
            self.CurrentScript.FunctionCount = #self.CurrentScript.Functions
        elseif self.CurrentScript.IsDeleted then
            self.CurrentScript.Functions = {}
            
            SafeCall(function()
                local gcObjects = getgc(true)
                local scriptSource = string.gsub(self.CurrentScript.Name, " %[DELETED%]", "")
                
                for _, obj in ipairs(gcObjects) do
                    if typeof(obj) == "function" then
                        local source = ""
                        SafeCall(function()
                            source = debug.info(obj, "s") or ""
                        end)
                        
                        if source == scriptSource then
                            local funcData = self.Analyzer:AnalyzeFunction(obj)
                            if funcData then
                                table.insert(self.CurrentScript.Functions, funcData)
                            end
                        end
                    end
                end
            end)
            
            self.CurrentScript.FunctionCount = #self.CurrentScript.Functions
        else
            self.CurrentScript.Functions = {}
            self.CurrentScript.FunctionCount = 0
        end
        
        local funcList = {}
        self.FunctionMap = {}
        
        for _, func in ipairs(self.CurrentScript.Functions) do
            local displayName = func.Name
            if func.IsHooked then
                displayName = displayName .. " [HOOKED]"
            end
            table.insert(funcList, displayName)
            self.FunctionMap[displayName] = func
        end
        
        if #funcList == 0 then
            table.insert(funcList, "No functions found")
        end
        
        self.Dropdowns.Function:SetValues(funcList)
        
        self.Paragraphs.ScriptInfo:SetDesc(
            "Name: " .. self.CurrentScript.Name ..
            "\nType: " .. self.CurrentScript.Type ..
            "\nFunctions: " .. tostring(self.CurrentScript.FunctionCount) ..
            "\nPath: " .. Utils.TruncateText(self.CurrentScript.Path, 50)
        )
        
        Fluent:Notify({Title = "Complete", Content = "Found " .. tostring(#self.CurrentScript.Functions) .. " functions", Duration = 2})
    end)
end

function UIController:OnFunctionSelected(value: string)
    if value == "No functions found" or value == "No script selected" then
        return
    end
    
    self.CurrentFunction = self.FunctionMap[value]
    self.CurrentProto = nil
    self.SelectedConstantIndex = nil
    self.SelectedUpvalueIndex = nil
    
    if not self.CurrentFunction then
        return
    end
    
    self.Analyzer:RefreshFunctionData(self.CurrentFunction)
    
    local stats = self.Analyzer:GetFunctionStats(self.CurrentFunction)
    
    local hookedStatus = self.CurrentFunction.IsHooked and " [HOOKED]" or ""
    
    self.Paragraphs.FunctionInfo:SetDesc(
        "Name: " .. tostring(self.CurrentFunction.Name) .. hookedStatus ..
        "\nLine: " .. tostring(self.CurrentFunction.Line) ..
        "\nSource: " .. Utils.TruncateText(tostring(self.CurrentFunction.Source), 40) ..
        "\nConstants: " .. tostring(stats.Constants) ..
        "\nUpvalues: " .. tostring(stats.Upvalues) ..
        "\nProtos: " .. tostring(stats.Protos)
    )
    
    self:UpdateConstantsList()
    self:UpdateUpvaluesList()
    self:UpdateProtosList()
    self:RefreshStack()
    
    Fluent:Notify({Title = "Selected", Content = self.CurrentFunction.Name, Duration = 2})
end

function UIController:UpdateConstantsList()
    local constList = {}
    self.ConstantMap = {}
    
    if self.CurrentFunction then
        self.Analyzer:RefreshFunctionData(self.CurrentFunction)
        
        for idx, val in pairs(self.CurrentFunction.Constants) do
            local serialized = Serializer.SerializeWithType(val)
            local displayName = "[" .. tostring(idx) .. "] (" .. serialized.DisplayType .. ") " .. Utils.TruncateText(serialized.Value, 40)
            table.insert(constList, displayName)
            self.ConstantMap[displayName] = {index = idx, value = val}
        end
    end
    
    if #constList == 0 then
        table.insert(constList, "No constants")
    end
    
    self.Dropdowns.Constant:SetValues(constList)
end

function UIController:UpdateUpvaluesList()
    local upvalList = {}
    self.UpvalueMap = {}
    
    if self.CurrentFunction then
        self.Analyzer:RefreshFunctionData(self.CurrentFunction)
        
        for idx, val in pairs(self.CurrentFunction.Upvalues) do
            local serialized = Serializer.SerializeWithType(val)
            local displayName = "[" .. tostring(idx) .. "] (" .. serialized.DisplayType .. ") " .. Utils.TruncateText(serialized.Value, 40)
            table.insert(upvalList, displayName)
            self.UpvalueMap[displayName] = {index = idx, value = val}
        end
    end
    
    if #upvalList == 0 then
        table.insert(upvalList, "No upvalues")
    end
    
    self.Dropdowns.Upvalue:SetValues(upvalList)
end

function UIController:UpdateProtosList()
    local protoList = {}
    self.ProtoMap = {}
    
    if self.CurrentFunction then
        for i, proto in ipairs(self.CurrentFunction.Protos) do
            local constCount = Utils.CountTable(proto.Constants)
            local upvalCount = Utils.CountTable(proto.Upvalues)
            local displayName = proto.Name .. " (C:" .. tostring(constCount) .. " U:" .. tostring(upvalCount) .. ")"
            table.insert(protoList, displayName)
            self.ProtoMap[displayName] = proto
        end
    end
    
    if #protoList == 0 then
        table.insert(protoList, "No protos")
    end
    
    self.Dropdowns.Proto:SetValues(protoList)
    self.Dropdowns.ProtoConstant:SetValues({"No proto selected"})
    self.Dropdowns.ProtoUpvalue:SetValues({"No proto selected"})
end

function UIController:RefreshStack()
    local stackList = {}
    self.StackMap = {}
    
    SafeCall(function()
        for level = 1, 5 do
            local success, stack = SafeCall(function()
                return debug.getstack(level)
            end)
            
            if success and stack and typeof(stack) == "table" then
                for idx, val in pairs(stack) do
                    local serialized = Serializer.SerializeWithType(val)
                    local displayName = "L" .. tostring(level) .. ":[" .. tostring(idx) .. "] (" .. serialized.DisplayType .. ") " .. Utils.TruncateText(serialized.Value, 35)
                    table.insert(stackList, displayName)
                    self.StackMap[displayName] = {
                        Level = level,
                        Index = idx,
                        Value = val,
                        Type = typeof(val)
                    }
                end
            end
        end
    end)
    
    if #stackList == 0 then
        table.insert(stackList, "No stack data")
    end
    
    self.Dropdowns.Stack:SetValues(stackList)
end

function UIController:OnConstantSelected(value: string)
    if value == "No constants" or value == "No function selected" then
        self.SelectedConstantIndex = nil
        return
    end
    
    local data = self.ConstantMap[value]
    if data then
        self.SelectedConstantIndex = data.index
        
        local freshValue = nil
        SafeCall(function()
            local consts = debug.getconstants(self.CurrentFunction.Func)
            freshValue = consts[data.index]
        end)
        
        local serialized = Serializer.SerializeWithType(freshValue or data.value)
        self.Paragraphs.ConstantInfo:SetDesc(
            "Index: " .. tostring(data.index) .. " (selected)" ..
            "\nType: " .. serialized.Type ..
            "\nDisplay Type: " .. serialized.DisplayType ..
            "\nValue: " .. serialized.Value
        )
    end
end

function UIController:OnUpvalueSelected(value: string)
    if value == "No upvalues" or value == "No function selected" then
        self.SelectedUpvalueIndex = nil
        return
    end
    
    local data = self.UpvalueMap[value]
    if data then
        self.SelectedUpvalueIndex = data.index
        
        local freshValue = nil
        SafeCall(function()
            local upvals = debug.getupvalues(self.CurrentFunction.Func)
            freshValue = upvals[data.index]
        end)
        
        local serialized = Serializer.SerializeWithType(freshValue or data.value)
        self.Paragraphs.UpvalueInfo:SetDesc(
            "Index: " .. tostring(data.index) .. " (selected)" ..
            "\nType: " .. serialized.Type ..
            "\nDisplay Type: " .. serialized.DisplayType ..
            "\nValue: " .. serialized.Value
        )
    end
end

function UIController:OnStackSelected(value: string)
    if value == "No stack data" then
        self.SelectedStackLevel = nil
        self.SelectedStackIndex = nil
        return
    end
    
    local data = self.StackMap[value]
    if data then
        self.SelectedStackLevel = data.Level
        self.SelectedStackIndex = data.Index
        local serialized = Serializer.SerializeWithType(data.Value)
        self.Paragraphs.StackInfo:SetDesc(
            "Level: " .. tostring(data.Level) .. " (selected)" ..
            "\nIndex: " .. tostring(data.Index) .. " (selected)" ..
            "\nType: " .. serialized.Type ..
            "\nValue: " .. serialized.Value
        )
    end
end

function UIController:OnProtoSelected(value: string)
    if value == "No protos" or value == "No function selected" then
        return
    end
    
    self.CurrentProto = self.ProtoMap[value]
    self.SelectedProtoConstantIndex = nil
    self.SelectedProtoUpvalueIndex = nil
    
    if not self.CurrentProto then
        return
    end
    
    SafeCall(function()
        self.CurrentProto.Constants = debug.getconstants(self.CurrentProto.Func)
    end)
    SafeCall(function()
        self.CurrentProto.Upvalues = debug.getupvalues(self.CurrentProto.Func)
    end)
    
    local constCount = Utils.CountTable(self.CurrentProto.Constants)
    local upvalCount = Utils.CountTable(self.CurrentProto.Upvalues)
    
    self.Paragraphs.ProtoInfo:SetDesc(
        "Index: " .. tostring(self.CurrentProto.Index) ..
        "\nName: " .. tostring(self.CurrentProto.Name) ..
        "\nLine: " .. tostring(self.CurrentProto.Line) ..
        "\nConstants: " .. tostring(constCount) ..
        "\nUpvalues: " .. tostring(upvalCount)
    )
    
    local protoConstList = {}
    self.ProtoConstantMap = {}
    
    for idx, val in pairs(self.CurrentProto.Constants) do
        local serialized = Serializer.SerializeWithType(val)
        local displayName = "[" .. tostring(idx) .. "] (" .. serialized.DisplayType .. ") " .. Utils.TruncateText(serialized.Value, 35)
        table.insert(protoConstList, displayName)
        self.ProtoConstantMap[displayName] = {proto = self.CurrentProto, index = idx, value = val}
    end
    
    if #protoConstList == 0 then
        table.insert(protoConstList, "No constants")
    end
    
    self.Dropdowns.ProtoConstant:SetValues(protoConstList)
    
    local protoUpvalList = {}
    self.ProtoUpvalueMap = {}
    
    for idx, val in pairs(self.CurrentProto.Upvalues) do
        local serialized = Serializer.SerializeWithType(val)
        local displayName = "[" .. tostring(idx) .. "] (" .. serialized.DisplayType .. ") " .. Utils.TruncateText(serialized.Value, 35)
        table.insert(protoUpvalList, displayName)
        self.ProtoUpvalueMap[displayName] = {proto = self.CurrentProto, index = idx, value = val}
    end
    
    if #protoUpvalList == 0 then
        table.insert(protoUpvalList, "No upvalues")
    end
    
    self.Dropdowns.ProtoUpvalue:SetValues(protoUpvalList)
end

function UIController:OnProtoConstantSelected(value: string)
    if value == "No constants" or value == "No proto selected" then
        self.SelectedProtoConstantIndex = nil
        return
    end
    
    local data = self.ProtoConstantMap[value]
    if data then
        self.SelectedProtoConstantIndex = data.index
        
        local freshValue = nil
        SafeCall(function()
            local consts = debug.getconstants(data.proto.Func)
            freshValue = consts[data.index]
        end)
        
        local serialized = Serializer.SerializeWithType(freshValue or data.value)
        self.Paragraphs.ProtoInfo:SetDesc(
            "Proto: " .. tostring(data.proto.Name) ..
            "\nConstant Index: " .. tostring(data.index) .. " (selected)" ..
            "\nType: " .. serialized.Type ..
            "\nValue: " .. serialized.Value
        )
    end
end

function UIController:OnProtoUpvalueSelected(value: string)
    if value == "No upvalues" or value == "No proto selected" then
        self.SelectedProtoUpvalueIndex = nil
        return
    end
    
    local data = self.ProtoUpvalueMap[value]
    if data then
        self.SelectedProtoUpvalueIndex = data.index
        
        local freshValue = nil
        SafeCall(function()
            local upvals = debug.getupvalues(data.proto.Func)
            freshValue = upvals[data.index]
        end)
        
        local serialized = Serializer.SerializeWithType(freshValue or data.value)
        self.Paragraphs.ProtoInfo:SetDesc(
            "Proto: " .. tostring(data.proto.Name) ..
            "\nUpvalue Index: " .. tostring(data.index) .. " (selected)" ..
            "\nType: " .. serialized.Type ..
            "\nValue: " .. serialized.Value
        )
    end
end

function UIController:EditConstant(text: string)
    if not self.CurrentFunction then
        Fluent:Notify({Title = "Error", Content = "No function selected", Duration = 2})
        return
    end
    
    local index, value, err = Utils.ParseEditInput(text, self.SelectedConstantIndex)
    
    if err then
        Fluent:Notify({Title = "Error", Content = err, Duration = 2})
        return
    end
    
    local success, editErr = self.Analyzer:SetConstant(self.CurrentFunction.Func, index, value)
    
    if success then
        self.CurrentFunction.Constants[index] = value
        self:UpdateConstantsList()
        
        if self.SelectedConstantIndex == index then
            local serialized = Serializer.SerializeWithType(value)
            self.Paragraphs.ConstantInfo:SetDesc(
                "Index: " .. tostring(index) .. " (selected)" ..
                "\nType: " .. serialized.Type ..
                "\nDisplay Type: " .. serialized.DisplayType ..
                "\nValue: " .. serialized.Value
            )
        end
        
        Fluent:Notify({Title = "Success", Content = "Constant [" .. tostring(index) .. "] updated", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = editErr or "Failed", Duration = 2})
    end
end

function UIController:EditUpvalue(text: string)
    if not self.CurrentFunction then
        Fluent:Notify({Title = "Error", Content = "No function selected", Duration = 2})
        return
    end
    
    local index, value, err = Utils.ParseEditInput(text, self.SelectedUpvalueIndex)
    
    if err then
        Fluent:Notify({Title = "Error", Content = err, Duration = 2})
        return
    end
    
    local success, editErr = self.Analyzer:SetUpvalue(self.CurrentFunction.Func, index, value)
    
    if success then
        self.CurrentFunction.Upvalues[index] = value
        self:UpdateUpvaluesList()
        
        if self.SelectedUpvalueIndex == index then
            local serialized = Serializer.SerializeWithType(value)
            self.Paragraphs.UpvalueInfo:SetDesc(
                "Index: " .. tostring(index) .. " (selected)" ..
                "\nType: " .. serialized.Type ..
                "\nDisplay Type: " .. serialized.DisplayType ..
                "\nValue: " .. serialized.Value
            )
        end
        
        Fluent:Notify({Title = "Success", Content = "Upvalue [" .. tostring(index) .. "] updated", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = editErr or "Failed", Duration = 2})
    end
end

function UIController:EditStack(text: string)
    local colonCount = select(2, string.gsub(text, ":", ""))
    
    if colonCount >= 2 then
        local parts = string.split(text, ":")
        local level = tonumber(parts[1])
        local index = tonumber(parts[2])
        local valueStr = table.concat({select(3, unpack(parts))}, ":")
        
        if not level or not index then
            Fluent:Notify({Title = "Error", Content = "Invalid level:index format", Duration = 2})
            return
        end
        
        local value = Utils.ParseValue(valueStr)
        local success, err = self.Analyzer:SetStack(level, index, value)
        
        if success then
            self:RefreshStack()
            Fluent:Notify({Title = "Success", Content = "Stack L" .. tostring(level) .. ":[" .. tostring(index) .. "] updated", Duration = 2})
        else
            Fluent:Notify({Title = "Error", Content = err or "Failed", Duration = 2})
        end
    else
        if self.SelectedStackLevel and self.SelectedStackIndex then
            local value = Utils.ParseValue(text)
            local success, err = self.Analyzer:SetStack(self.SelectedStackLevel, self.SelectedStackIndex, value)
            
            if success then
                self:RefreshStack()
                Fluent:Notify({Title = "Success", Content = "Stack updated", Duration = 2})
            else
                Fluent:Notify({Title = "Error", Content = err or "Failed", Duration = 2})
            end
        else
            Fluent:Notify({Title = "Error", Content = "Select a stack variable or use level:index:value format", Duration = 2})
        end
    end
end

function UIController:EditProtoConstant(text: string)
    if not self.CurrentProto then
        Fluent:Notify({Title = "Error", Content = "No proto selected", Duration = 2})
        return
    end
    
    local index, value, err = Utils.ParseEditInput(text, self.SelectedProtoConstantIndex)
    
    if err then
        Fluent:Notify({Title = "Error", Content = err, Duration = 2})
        return
    end
    
    local success, editErr = self.Analyzer:SetProtoConstant(self.CurrentProto, index, value)
    
    if success then
        self.CurrentProto.Constants[index] = value
        self:OnProtoSelected(self.Dropdowns.Proto:GetValue())
        Fluent:Notify({Title = "Success", Content = "Proto constant [" .. tostring(index) .. "] updated", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = editErr or "Failed", Duration = 2})
    end
end

function UIController:EditProtoUpvalue(text: string)
    if not self.CurrentProto then
        Fluent:Notify({Title = "Error", Content = "No proto selected", Duration = 2})
        return
    end
    
    local index, value, err = Utils.ParseEditInput(text, self.SelectedProtoUpvalueIndex)
    
    if err then
        Fluent:Notify({Title = "Error", Content = err, Duration = 2})
        return
    end
    
    local success, editErr = self.Analyzer:SetProtoUpvalue(self.CurrentProto, index, value)
    
    if success then
        self.CurrentProto.Upvalues[index] = value
        self:OnProtoSelected(self.Dropdowns.Proto:GetValue())
        Fluent:Notify({Title = "Success", Content = "Proto upvalue [" .. tostring(index) .. "] updated", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = editErr or "Failed", Duration = 2})
    end
end

function UIController:HookSelectedFunction()
    if not self.CurrentFunction then
        Fluent:Notify({Title = "Error", Content = "No function selected", Duration = 2})
        return
    end
    
    if self.CurrentFunction.IsHooked then
        Fluent:Notify({Title = "Warning", Content = "Function is already hooked", Duration = 2})
        return
    end
    
    local success, err, original = self.Analyzer:HookFunctionToNil(self.CurrentFunction.Func)
    
    if success then
        self.CurrentFunction.IsHooked = true
        
        local funcList = {}
        for displayName, func in pairs(self.FunctionMap) do
            local newName = displayName
            if func == self.CurrentFunction and not string.find(displayName, "%[HOOKED%]") then
                newName = displayName .. " [HOOKED]"
                self.FunctionMap[newName] = func
                self.FunctionMap[displayName] = nil
            end
            table.insert(funcList, newName)
        end
        self.Dropdowns.Function:SetValues(funcList)
        
        Fluent:Notify({Title = "Success", Content = "Function hooked with coroutine.yield", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = err or "Failed to hook", Duration = 2})
    end
end

function UIController:RestoreSelectedFunction()
    if not self.CurrentFunction then
        Fluent:Notify({Title = "Error", Content = "No function selected", Duration = 2})
        return
    end
    
    if not self.CurrentFunction.IsHooked then
        Fluent:Notify({Title = "Warning", Content = "Function is not hooked", Duration = 2})
        return
    end
    
    local success, err = self.Analyzer:RestoreFunction(self.CurrentFunction.Func)
    
    if success then
        self.CurrentFunction.IsHooked = false
        
        local funcList = {}
        for displayName, func in pairs(self.FunctionMap) do
            local newName = displayName
            if func == self.CurrentFunction and string.find(displayName, " %[HOOKED%]") then
                newName = string.gsub(displayName, " %[HOOKED%]", "")
                self.FunctionMap[newName] = func
                self.FunctionMap[displayName] = nil
            end
            table.insert(funcList, newName)
        end
        self.Dropdowns.Function:SetValues(funcList)
        
        Fluent:Notify({Title = "Success", Content = "Function restored", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = err or "Failed to restore", Duration = 2})
    end
end

function UIController:HookSelectedProto()
    if not self.CurrentProto then
        Fluent:Notify({Title = "Error", Content = "No proto selected", Duration = 2})
        return
    end
    
    local success, err = self.Analyzer:HookFunctionToNil(self.CurrentProto.Func)
    
    if success then
        Fluent:Notify({Title = "Success", Content = "Proto hooked with coroutine.yield", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = err or "Failed to hook", Duration = 2})
    end
end

function UIController:DecompileScript()
    if not self.CurrentScript then
        Fluent:Notify({Title = "Error", Content = "No script selected", Duration = 2})
        return
    end
    
    if self.CurrentScript.IsDeleted then
        Fluent:Notify({Title = "Error", Content = "Cannot decompile deleted scripts", Duration = 2})
        return
    end
    
    self.Paragraphs.DecompileStatus:SetDesc("Decompiling...")
    
    Fluent:Notify({Title = "Decompiling", Content = "Please wait...", Duration = 2})
    
    task.spawn(function()
        self.DecompiledSource = self.Analyzer:DecompileScript(self.CurrentScript.Instance)
        
        local lineCount = #string.split(self.DecompiledSource, "\n")
        local charCount = #self.DecompiledSource
        
        self.Paragraphs.DecompileStatus:SetDesc(
            "Script: " .. self.CurrentScript.Name ..
            "\nLines: " .. tostring(lineCount) ..
            "\nCharacters: " .. tostring(charCount) ..
            "\nFunctions: " .. tostring(#self.CurrentScript.Functions)
        )
        
        Fluent:Notify({Title = "Complete", Content = tostring(lineCount) .. " lines decompiled", Duration = 2})
    end)
end

function UIController:CopySource()
    if self.DecompiledSource == "" then
        Fluent:Notify({Title = "Error", Content = "No source to copy", Duration = 2})
        return
    end
    
    if setclipboard then
        local allFuncs = self.CurrentScript and self.CurrentScript.Functions or {}
        local annotated = self.DecompiledSource
        if #allFuncs > 0 then
            annotated = self.CodeViewer:GenerateAnnotatedSource(self.DecompiledSource, allFuncs)
        end
        setclipboard(annotated)
        Fluent:Notify({Title = "Copied", Content = "Annotated source copied to clipboard", Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = "Clipboard not supported", Duration = 2})
    end
end

function UIController:SaveSource()
    if self.DecompiledSource == "" then
        Fluent:Notify({Title = "Error", Content = "No source to save", Duration = 2})
        return
    end
    
    if writefile then
        local fileName = "decompiled_" .. (self.CurrentScript and self.CurrentScript.Name or "script") .. ".lua"
        fileName = string.gsub(fileName, "[^%w_%.%-]", "_")
        
        local allFuncs = self.CurrentScript and self.CurrentScript.Functions or {}
        local annotated = self.DecompiledSource
        if #allFuncs > 0 then
            annotated = self.CodeViewer:GenerateAnnotatedSource(self.DecompiledSource, allFuncs)
        end
        
        writefile(fileName, annotated)
        Fluent:Notify({Title = "Saved", Content = fileName, Duration = 2})
    else
        Fluent:Notify({Title = "Error", Content = "File system not supported", Duration = 2})
    end
end

function UIController:RefreshScripts()
    self.Analyzer:ScanAllScripts()
    self.Dropdowns.Script:SetValues(self.Analyzer:GetScriptList())
    
    Fluent:Notify({
        Title = "Refreshed",
        Content = "Found " .. tostring(#self.Analyzer.Scripts) .. " scripts",
        Duration = 2
    })
end

function UIController:RefreshAll()
    self:ClearSelection()
    self.Analyzer:ClearCache()
    self:RefreshScripts()
end

function UIController:ClearSelection()
    self.CurrentScript = nil
    self.CurrentFunction = nil
    self.CurrentProto = nil
    self.FunctionMap = {}
    self.ConstantMap = {}
    self.UpvalueMap = {}
    self.ProtoMap = {}
    self.ProtoConstantMap = {}
    self.ProtoUpvalueMap = {}
    self.StackMap = {}
    self.DecompiledSource = ""
    self.SelectedConstantIndex = nil
    self.SelectedUpvalueIndex = nil
    self.SelectedProtoConstantIndex = nil
    self.SelectedProtoUpvalueIndex = nil
    self.SelectedStackLevel = nil
    self.SelectedStackIndex = nil
    
    self.Dropdowns.Function:SetValues({"No script selected"})
    self.Dropdowns.Constant:SetValues({"No function selected"})
    self.Dropdowns.Upvalue:SetValues({"No function selected"})
    self.Dropdowns.Stack:SetValues({"No stack data"})
    self.Dropdowns.Proto:SetValues({"No function selected"})
    self.Dropdowns.ProtoConstant:SetValues({"No proto selected"})
    self.Dropdowns.ProtoUpvalue:SetValues({"No proto selected"})
    
    self.Paragraphs.ScriptInfo:SetDesc("No script selected")
    self.Paragraphs.FunctionInfo:SetDesc("No function selected")
    self.Paragraphs.ConstantInfo:SetDesc("Select a constant")
    self.Paragraphs.UpvalueInfo:SetDesc("Select an upvalue")
    self.Paragraphs.StackInfo:SetDesc("Select a stack variable")
    self.Paragraphs.ProtoInfo:SetDesc("Select a proto")
    self.Paragraphs.DecompileStatus:SetDesc("No script decompiled")
    
    Fluent:Notify({
        Title = "Cleared",
        Content = "All selections cleared",
        Duration = 2
    })
end

function UIController:Destroy()
    if self.CodeViewer then
        self.CodeViewer:Destroy()
    end
    
    if self.Window then
        self.Window:Destroy()
    end
end

local supported, missing = Utils.CheckAllFunctions()

if not supported then
    local ErrorWindow = Fluent:CreateWindow({
        Title = "Script.Dumper - Error",
        SubTitle = "Missing Functions",
        TabWidth = 160,
        Size = UDim2.fromOffset(450, 250),
        Theme = "Dark"
    })
    
    local ErrorTab = ErrorWindow:AddTab({
        Title = "Error",
        Icon = "alert-triangle"
    })
    
    ErrorTab:AddParagraph({
        Title = "Missing Required Functions",
        Content = "The following functions are required but not available:\n\n" .. table.concat(missing, "\n") .. "\n\nPlease use a compatible executor."
    })
    
    ErrorTab:AddButton({
        Title = "Close",
        Callback = function()
            ErrorWindow:Destroy()
        end
    })
    
    return {
        Error = true,
        Missing = missing
    }
end

local Analyzer = ScriptAnalyzer.new()
Analyzer:ScanAllScripts()

local UI = UIController.new(Analyzer)
UI:Initialize()

return {
    Analyzer = Analyzer,
    UI = UI,
    Serializer = Serializer,
    CodeViewer = UI.CodeViewer,
    
    Refresh = function()
        UI:RefreshAll()
    end,
    
    GetCurrentScript = function()
        return UI.CurrentScript
    end,
    
    GetCurrentFunction = function()
        return UI.CurrentFunction
    end,
    
    GetCurrentProto = function()
        return UI.CurrentProto
    end,
    
    GetDecompiledSource = function()
        return UI.DecompiledSource
    end,
    
    HookFunction = function(func: (...any) -> ...any)
        return Analyzer:HookFunctionToNil(func)
    end,
    
    RestoreFunction = function(func: (...any) -> ...any)
        return Analyzer:RestoreFunction(func)
    end,
    
    GetStack = function(level: number, index: number?)
        return Analyzer:GetStack(level, index)
    end,
    
    SetStack = function(level: number, index: number, value: any)
        return Analyzer:SetStack(level, index, value)
    end,
    
    OpenCodeViewer = function(source: string?, scriptName: string?, funcInfo: FunctionData?, allFunctions: {FunctionData}?)
        if source then
            UI.CodeViewer:SetSource(source, scriptName or "Custom Source", funcInfo, allFunctions or {})
        end
        UI.CodeViewer:Show()
    end,
    
    CloseCodeViewer = function()
        UI.CodeViewer:Hide()
    end,
    
    Destroy = function()
        UI:Destroy()
    end
}
