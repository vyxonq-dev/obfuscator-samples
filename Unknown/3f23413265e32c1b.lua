-- I don't recommend using any of this code since its not near optimal.

local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local lighting = game:GetService("Lighting")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = localPlayer:GetMouse()

local menu = game:GetObjects("rbxassetid://7142010382")[1]
local tabholder = menu.outline.outline.main.group
menu.outline.Position = UDim2.new(0.5,-menu.outline.Size.X.Offset/2,0.5,-menu.outline.Size.Y.Offset/2)
menu.Parent = game:GetService("CoreGui")

local library = {name = "Counter Blox",colorpicking = false,tabbuttons = {},tabs = {},options = {},flags = {},scrolling = false,notifyText = Drawing.new("Text"),playing = false,multiZindex = 100,toInvis = {},libColor = Color3.fromRGB(100,60,80),blacklisted = {Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.UserInputType.MouseMovement}}

function draggable(a)local b=userInputService;local c;local d;local e;local f;local function g(h)if not library.colorpicking then local i=h.Position-e;a.Position=UDim2.new(f.X.Scale,f.X.Offset+i.X,f.Y.Scale,f.Y.Offset+i.Y)end end;a.InputBegan:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.UserInputType.Touch then c=true;e=h.Position;f=a.Position;h.Changed:Connect(function()if h.UserInputState==Enum.UserInputState.End then c=false end end)end end)a.InputChanged:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseMovement or h.UserInputType==Enum.UserInputType.Touch then d=h end end)b.InputChanged:Connect(function(h)if h==d and c then g(h)end end)end
draggable(menu.outline)

local cursor = Drawing.new("Image")
cursor.Data = game:HttpGet("https://raw.githubusercontent.com/sj0rs1/alora/refs/heads/main/cursor.png")
cursor.Size = Vector2.new(32,32)
cursor.Visible = true

library.notifyText.Font = 2
library.notifyText.Size = 13
library.notifyText.Outline = true
library.notifyText.Color = Color3.new(1,1,1)
library.notifyText.Position = Vector2.new(10,60)

userInputService.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.Delete then
        menu.Enabled = not menu.Enabled
        cursor.Visible = menu.Enabled
        library.scrolling = false
        library.colorpicking = false
        for i,v in next, library.toInvis do
            v.Visible = false
        end
    end
end)

menu.outline.outline.main.text.Text = "alora"

function library:notify(text)
    if playing then return end
    playing = true
    library.notifyText.Text = text
    library.notifyText.Transparency = 0
    library.notifyText.Visible = true
    for i = 0,1,0.1 do wait()
        library.notifyText.Transparency = i
    end
    spawn(function()
        wait(3)
        for i = 1,0,-0.1 do wait()
            library.notifyText.Transparency = i
        end
        playing = false
        library.notifyText.Visible = false
    end)
end
function library:addTab(name)
    local newTab = tabholder.tab:Clone()
    local newButton = tabholder.tabbuttons.button:Clone()

    table.insert(library.tabs,newTab)
    newTab.Parent = tabholder
    newTab.Visible = false

    table.insert(library.tabbuttons,newButton)
    newButton.Parent = tabholder.tabbuttons
    newButton.Modal = true
    newButton.Visible = true
    newButton.Text = name

    newButton.MouseButton1Click:Connect(function()
        for i,v in next, library.tabs do
            v.Visible = v == newTab
        end
        for i,v in next, library.toInvis do
            v.Visible = false
        end
    end)

    for i,v in next, library.tabbuttons do
        v.Size = UDim2.new(1/#library.tabbuttons,0,1,0)
    end

    local tab = {}
    local groupCount = 0
    local jigCount = 0
    local topStuff = 2000
    function tab:createGroup(pos)
        local groupbox = Instance.new("Frame")
        local grouper = Instance.new("Frame")
        local layout = Instance.new("UIListLayout")
        groupCount -= 1
        groupbox.Parent = newTab[pos == 0 and "left" or "right"]
        groupbox.BackgroundColor3 = Color3.fromRGB(35,35,35)
        groupbox.BorderSizePixel = 0
        groupbox.Size = UDim2.new(1,-5,0,10)
        groupbox.ZIndex = groupCount
        groupbox.Parent.UIListLayout.Padding = UDim.new(0,5)

        grouper.Parent = groupbox
        grouper.BackgroundColor3 = Color3.fromRGB(255,255,255)
        grouper.BackgroundTransparency = 1
        grouper.Position = UDim2.new(0,5,0,7)
        grouper.Size = UDim2.new(1,0,1,0)

        layout.Parent = grouper
        layout.Padding = UDim.new(0,5)
        layout.SortOrder = "LayoutOrder"

        local group = {}
        function group:addToggle(args)
            if not args.flag and args.text then args.flag = args.text end
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0,0,0,23)

            local checkbox = Instance.new("TextButton")
            local box = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            jigCount -= 1

            checkbox.Parent = grouper
            checkbox.BackgroundColor3 = Color3.fromRGB(255,255,255)
            checkbox.BackgroundTransparency = 1
            checkbox.Size = UDim2.new(1,0,0,18)
            checkbox.Text = ""
            checkbox.TextColor3 = Color3.fromRGB(0,0,0)
            checkbox.TextSize = 14
            checkbox.ZIndex = jigCount

            box.Parent = checkbox
            box.BackgroundColor3 = Color3.fromRGB(20,20,20)
            box.BorderColor3 = Color3.fromRGB(50,50,50)
            box.Size = UDim2.new(0,18,0,18)

            text.Parent = box
            text.BackgroundColor3 = Color3.fromRGB(255,255,255)
            text.BorderSizePixel = 0
            text.Position = UDim2.new(1,10,0,0)
            text.Size = UDim2.new(0,0,1,0)
            text.Font = "SourceSans"
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(255,255,255)
            text.TextSize = 16
            text.TextXAlignment = "Left"

            local state = false
            function toggle(newState)
                state = newState
                box.BackgroundColor3 = state and library.libColor or Color3.fromRGB(20,20,20)
                library.flags[args.flag] = state
                if args.callback then
                    args.callback(state)
                end
            end
            -- this is stupid but it just doesnt want to work properly
            checkbox.MouseButton1Click:Connect(function()
                state = not state
                box.BackgroundColor3 = state and library.libColor or Color3.fromRGB(20,20,20)
                library.flags[args.flag] = state
                if args.callback then
                    args.callback(state)
                end
            end)

            library.flags[args.flag] = false
            library.options[args.flag] = {type = "toggle",changeState = toggle,skipflag = args.skipflag,oldargs = args}
        end
        function group:addButton(args)
            if not args.callback or not args.text then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0,0,0,23)

            local button = Instance.new("TextButton")
            button.Parent = grouper
            button.BackgroundColor3 = Color3.fromRGB(20,20,20)
            button.BorderColor3 = Color3.fromRGB(50,50,50)
            button.Size = UDim2.new(1,-10,0,18)
            button.AutoButtonColor = false
            button.TextColor3 = Color3.fromRGB(255,255,255)
            button.Font = "SourceSans"
            button.TextSize = 16
            button.Text = args.text

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    args.callback()
                end
            end)
        end
        function group:addSlider(args)
            if not args.flag or not args.max then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0,0,0,41)

            local slider = Instance.new("Frame")
            local slider_2 = Instance.new("TextButton")
            local text = Instance.new("TextLabel")
            local fill = Instance.new("Frame")
            local valueText = Instance.new("TextLabel")

            slider.Parent = grouper
            slider.BackgroundColor3 = Color3.fromRGB(255,255,255)
            slider.BackgroundTransparency = 1
            slider.Size = UDim2.new(1,0,0,36)

            slider_2.Parent = slider
            slider_2.BackgroundColor3 = Color3.fromRGB(20,20,20)
            slider_2.BorderColor3 = Color3.fromRGB(50,50,50)
            slider_2.Position = UDim2.new(0,0,0,18)
            slider_2.Size = UDim2.new(1,-10,0,18)
            slider_2.AutoButtonColor = false
            slider_2.Font = Enum.Font.SourceSans
            slider_2.Text = ""
            slider_2.TextColor3 = Color3.fromRGB(255,255,255)
            slider_2.TextSize = 14

            text.Parent = slider_2
            text.BackgroundColor3 = Color3.fromRGB(255,255,255)
            text.BackgroundTransparency = 1
            text.BorderSizePixel = 0
            text.Position = UDim2.new(0,0,-1,0)
            text.Size = UDim2.new(1,0,1,0)
            text.Font = Enum.Font.SourceSans
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(255,255,255)
            text.TextSize = 16
            text.TextXAlignment = "Left"
            text.TextYAlignment = "Top"

            fill.Parent = slider_2
            fill.BackgroundColor3 = library.libColor
            fill.BorderSizePixel = 0
            fill.Size = UDim2.new(0,0,1,0)
            fill.ZIndex = 0

            valueText.Parent = slider_2
            valueText.BackgroundColor3 = Color3.fromRGB(255,255,255)
            valueText.BackgroundTransparency = 1
            valueText.Size = UDim2.new(1,0,1,0)
            valueText.Font = Enum.Font.SourceSans
            valueText.Text = "0"
            valueText.TextColor3 = Color3.fromRGB(150,150,150)
            valueText.TextSize = 16

            local entered = false
			local scrolling = false
			local amount = 0

            local function updateValue(value)
				if value ~= 0 then
					fill:TweenSize(UDim2.new(value/args.max,0,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
				else
					fill:TweenSize(UDim2.new(0,1,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
                end
                valueText.Text = value
                library.flags[args.flag] = value
                if args.callback then
                    args.callback(value)
                end
			end
			local function updateScroll()
                if scrolling or library.scrolling or not newTab.Visible or library.colorpicking then return end
                while userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do runService.RenderStepped:Wait()
                    library.scrolling = true
                    valueText.TextColor3 = Color3.fromRGB(255,255,255)
					scrolling = true
					local value = args.min + ((mouse.X - slider_2.AbsolutePosition.X) / slider_2.AbsoluteSize.X) * (args.max - args.min)
					if value < 0 then value = 0 end
					if value > args.max then value = args.max end
					updateValue(math.floor(value))
                end
                if scrolling and not entered then
                    valueText.TextColor3 = Color3.fromRGB(150,150,150)
                end
                if not menu.Enabled then
                    entered = false
                end
                scrolling = false
                library.scrolling = false
			end
			slider_2.MouseEnter:connect(function()
				if scrolling or entered then return end
                entered = true
                valueText.TextColor3 = Color3.fromRGB(255,255,255)
				while entered do wait()
					updateScroll()
				end
			end)
			slider_2.MouseLeave:connect(function()
                entered = false
                valueText.TextColor3 = Color3.fromRGB(150,150,150)
			end)
            if args.value then
                updateValue(args.value)
            end
            library.flags[args.flag] = 0
            library.options[args.flag] = {type = "slider",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
            updateValue(args.value or 0)
        end
        function group:addDivider()
            groupbox.Size += UDim2.new(0,0,0,3)
            local divider = Instance.new("Frame")

            divider.Parent = grouper
            divider.BackgroundColor3 = Color3.fromRGB(25,25,25)
            divider.Size = UDim2.new(1,-10,0,1)
            divider.BorderSizePixel = 0
            divider.Name = "dontchange"
        end
        function group:addTextbox(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            local textbox = Instance.new("TextBox")
            groupbox.Size += UDim2.new(0,0,0,23)

            textbox:GetPropertyChangedSignal('Text'):Connect(function(val)
                library.flags[args.flag] = textbox.Text
            end)

            textbox.Parent = grouper
            textbox.BackgroundColor3 = Color3.fromRGB(20,20,20)
            textbox.BorderColor3 = Color3.fromRGB(50,50,50)
            textbox.Size = UDim2.new(1,-10,0,18)
            textbox.ClearTextOnFocus = false
            textbox.Font = Enum.Font.SourceSans
            textbox.PlaceholderColor3 = Color3.fromRGB(130,130,130)
            textbox.PlaceholderText = args.text or ""
            textbox.Text = ""
            textbox.TextColor3 = Color3.fromRGB(255,255,255)
            textbox.TextSize = 16

            library.flags[args.flag] = ""
            library.options[args.flag] = {type = "textbox",changeState = function(text) textbox.Text = text end,skipflag = args.skipflag,oldargs = args}
        end
        function group:addKeybind(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0,0,0,23)

            local button = Instance.new("TextButton")
            local text = Instance.new("TextLabel")
            local newText = Instance.new("TextLabel")
            local next = false

            button.Parent = grouper
            button.BackgroundColor3 = Color3.fromRGB(20,20,20)
            button.BorderColor3 = Color3.fromRGB(50,50,50)
            button.Size = UDim2.new(0.55,0,0,18)
            button.AutoButtonColor = false
            button.TextColor3 = Color3.new(1,1,1)
            button.Font = "SourceSans"
            button.TextSize = 16
            button.Text = ""

            newText.Parent = button
            newText.BackgroundTransparency = 1
            newText.Position = UDim2.new(0,0,0,0)
            newText.Size = UDim2.new(1,0,1,0)
            newText.Font = "SourceSans"
            newText.Text = ""
            newText.TextColor3 = Color3.fromRGB(255,255,255)
            newText.TextSize = 16
            newText.TextXAlignment = "Left"
            newText.ClipsDescendants = true
            newText.TextXAlignment = "Center"

            text.Parent = button
            text.BackgroundColor3 = Color3.fromRGB(255,255,255)
            text.BorderSizePixel = 0
            text.Position = UDim2.new(1,10,0,0)
            text.Size = UDim2.new(0,0,1,0)
            text.Font = "SourceSans"
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(255,255,255)
            text.TextSize = 16
            text.TextXAlignment = "Left"

            function updateValue(val)
                library.flags[args.flag] = val
                newText.Text = string.split(tostring(val),".")[3]:gsub("MouseButton","Mouse") 
            end

            userInputService.InputBegan:Connect(function(key)
                local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                if next then
                    if not table.find(library.blacklisted,key) then
                        next = false
                        library.flags[args.flag] = key
                        newText.Text = string.split(tostring(key),".")[3]:gsub("MouseButton","Mouse") 
                    end
                end
                if not next and key == library.flags[args.flag] and args.callback then
                    args.callback()
                end
            end)

            button.MouseButton1Click:Connect(function()
                library.flags[args.flag] = Enum.KeyCode.Unknown
                newText.Text = "..."
                next = true
            end)

            library.flags[args.flag] = Enum.KeyCode.Unknown
            library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            updateValue(args.key or Enum.KeyCode.Unknown)
        end
        function group:addList(args)
            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0,0,0,23)

            library.multiZindex -= 1
            local button = Instance.new("TextButton")
            local listFrame = Instance.new("Frame")
            local layout = Instance.new("UIListLayout")
            local text = Instance.new("TextLabel")
            local newText = Instance.new("TextLabel")

            layout.Parent = listFrame
            layout.Padding = UDim.new(0,0)
            layout.SortOrder = "LayoutOrder"

            button.Parent = grouper
            button.BackgroundColor3 = Color3.fromRGB(20,20,20)
            button.BorderColor3 = Color3.fromRGB(50,50,50)
            button.Size = UDim2.new(0.65,0,0,18)
            button.AutoButtonColor = false
            button.TextColor3 = Color3.new(1,1,1)
            button.Font = "SourceSans"
            button.TextSize = 16
            button.Text = ""
            button.ZIndex = library.multiZindex 

            newText.Parent = button
            newText.BackgroundTransparency = 1
            newText.Position = UDim2.new(0,0,0,0)
            newText.Size = UDim2.new(1,0,1,0)
            newText.Font = "SourceSans"
            newText.Text = args.multiselect and "..." or ""
            newText.TextColor3 = Color3.fromRGB(255,255,255)
            newText.TextSize = 16
            newText.TextXAlignment = "Left"
            newText.ClipsDescendants = true
            newText.TextXAlignment = "Center"

            listFrame.ZIndex = library.multiZindex
            listFrame.Visible = false
            listFrame.Parent = button
            listFrame.Transparency = 0
            listFrame.Size = UDim2.new(1,0,0,#args.values*18)
            listFrame.BorderColor3 = Color3.fromRGB(50,50,50)
            listFrame.Position = UDim2.new(0,0,1,0)

            text.Parent = button
            text.BackgroundColor3 = Color3.fromRGB(255,255,255)
            text.BorderSizePixel = 0
            text.Position = UDim2.new(1,10,0,0)
            text.Size = UDim2.new(0,0,1,0)
            text.Font = "SourceSans"
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(255,255,255)
            text.TextSize = 16
            text.TextXAlignment = "Left"

			local function updateValue(value)
                if value == nil then newText.Text = "" return end
				if args.multiselect then
                    if type(value) == "string" then
                        if not table.find(library.options[args.flag].values,value) then return end
                        if table.find(library.flags[args.flag],value) then
                            for i,v in pairs(library.flags[args.flag]) do
                                if v == value then
                                    table.remove(library.flags[args.flag],i)
                                end
                            end
                        else
                            table.insert(library.flags[args.flag],value)
                        end
                    else
                        library.flags[args.flag] = value
                    end
					local buttonText = ""
					for i,v in pairs(library.flags[args.flag]) do
						local jig = i ~= #library.flags[args.flag] and "," or ""
						buttonText = buttonText.." "..v..jig
					end
                    if buttonText == "" then buttonText = "..." end
					for i,v in next, listFrame:GetChildren() do
						if v.ClassName ~= "TextButton" then continue end
						v.TextColor3 = Color3.new(0.65,0.65,0.65)
						for _i,_v in next, library.flags[args.flag] do
							if v.Name == _v then
								v.TextColor3 = Color3.new(1,1,1)
							end
						end
					end
					newText.Text = buttonText
					if args.callback then
						args.callback(library.flags[args.flag])
					end
				else
                    if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                    library.flags[args.flag] = value
					for i,v in next, listFrame:GetChildren() do
						if v.ClassName ~= "TextButton" then continue end
						v.TextColor3 = Color3.new(0.65,0.65,0.65)
                        if v.Name == library.flags[args.flag] then
                            v.TextColor3 = Color3.new(1,1,1)
                        end
					end
					listFrame.Visible = false
                    if library.flags[args.flag] then
                        newText.Text = library.flags[args.flag]
                        if args.callback then
                            args.callback(library.flags[args.flag])
                        end
                    end
				end
			end

            function refresh(tbl)
                for i,v in next, listFrame:GetChildren() do
                    if v.ClassName == "TextButton" then
                        v:Destroy()
                    end
                end
                for i,v in pairs(tbl) do
                    local valueButton = Instance.new("TextButton")
                    valueButton.ZIndex = 1000
                    valueButton.Visible = true
                    valueButton.Parent = listFrame
                    valueButton.Transparency = 0
                    valueButton.Size = UDim2.new(1,0,0,18)
                    valueButton.Position = UDim2.new(0,0,0,0)
                    valueButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
                    valueButton.TextColor3 = args.multiselect and Color3.new(0.65,0.65,0.65) or Color3.new(1,1,1)
                    valueButton.BorderSizePixel = 0
                    valueButton.AutoButtonColor = false
                    valueButton.TextSize = 16
                    valueButton.Font = "SourceSans"
                    valueButton.Text = v
                    valueButton.Name = v
    
                    valueButton.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
                library.options[args.flag].values = tbl
                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
            end

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    listFrame.Visible = not listFrame.Visible
                end
            end)

            table.insert(library.toInvis,listFrame)
            library.flags[args.flag] = args.multiselect and {} or ""
            library.options[args.flag] = {type = "list",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}

            refresh(args.values)
            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
        end
        function group:addColorpicker(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0,0,0,20)

            library.multiZindex -= 1
            jigCount -= 1
            topStuff -= 1
            local button = Instance.new("TextButton")
            local colorFrame = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local picker = Instance.new("ImageLabel")
            local hue = Instance.new("ImageLabel")

            colorFrame.ZIndex = library.multiZindex
            colorFrame.Visible = false
            colorFrame.Parent = button
            colorFrame.Transparency = 0
            colorFrame.Size = UDim2.new(0,120,0,100)
            colorFrame.Position = UDim2.new(1,0,1,0)

            picker.Parent = colorFrame
            picker.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
            picker.Size = UDim2.new(0, 100, 0, 100)
            picker.Image = "rbxassetid://2615689005"
            picker.Name = "dontchange"

            hue.Parent = colorFrame
            hue.AnchorPoint = Vector2.new(1, 0)
            hue.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
            hue.Position = UDim2.new(1, 0, 0, 0)
            hue.Size = UDim2.new(0, 20, 0, 100)
            hue.Image = "rbxassetid://2615692420"

            button.Parent = grouper
            button.BackgroundColor3 = args.color or Color3.new(1,1,1)
            button.BorderColor3 = Color3.fromRGB(50,50,50)
            button.Size = UDim2.new(0,35,0,15)
            button.AutoButtonColor = false
            button.ZIndex = args.ontop and topStuff or jigCount
            button.TextColor3 = Color3.fromRGB(255,255,255)
            button.Font = "SourceSans"
            button.TextSize = 16
            button.Text = ""
            button.Name = "dontchange"

            text.Parent = button
            text.BackgroundColor3 = Color3.fromRGB(255,255,255)
            text.BorderSizePixel = 0
            text.Position = UDim2.new(1,10,0,0)
            text.Size = UDim2.new(0,0,1,0)
            text.Font = "SourceSans"
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(255,255,255)
            text.TextSize = 16
            text.TextXAlignment = "Left"

            button.MouseButton1Click:Connect(function()
                colorFrame.Visible = not colorFrame.Visible
            end)

            local function updateValue(value,fakevalue)
                if typeof(value) == "table" then value = fakevalue end
                button.BackgroundColor3 = value
                library.flags[args.flag] = value
                if args.callback then
                    args.callback(value)
                end
			end

            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
            local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
            local heartbeat = game:GetService("RunService").Heartbeat

            local pickerX,pickerY,hueY = 0,0,0
            local oldpercentX,oldpercentY = 0,0

            hue.MouseEnter:Connect(function()
                local input = hue.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                            local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                            local startC = colors[math.floor(num)]
                            local endC = colors[math.ceil(num)]
                            local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                            picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                            updateValue(color)
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = hue.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            picker.MouseEnter:Connect(function()
                local input = picker.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                            local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                            local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                            updateValue(color)
                            oldpercentX,oldpercentY = xPercent,yPercent
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = picker.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            hue.MouseMoved:connect(function(_, y)
                hueY = y
            end)

            picker.MouseMoved:connect(function(x, y)
                pickerX,pickerY = x,y
            end)

            table.insert(library.toInvis,colorFrame)
            library.flags[args.flag] = Color3.new(1,1,1)
            library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            updateValue(args.color or Color3.new(1,1,1))
        end
        return group,groupbox
    end
    return tab
end

function library:saveConfig()
    local name = library.flags["config_name"]
    if name == "" then name = library.flags["selected_config"] end
    local jig = {}
    for i,v in next, library.flags do
        if library.options[i].skipflag then continue end
        if typeof(v) == "Color3" then
            jig[i] = {v.R,v.G,v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
        else
            jig[i] = v
        end
    end
    writefile("alora/"..tostring(game.GameId).."/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Succesfully saved config "..name..".cfg!")
    library:refreshConfigs()
end

function library:loadConfig()
    local name = library.flags["selected_config"]
    if not isfile("alora/"..tostring(game.GameId).."/"..name..".cfg") then
        library:notify("Config file not found!")
        return
    end
    local config = game:GetService("HttpService"):JSONDecode(readfile("alora/"..tostring(game.GameId).."/"..name..".cfg"))
    for i,v in next, library.options do
        spawn(function()pcall(function()
            if config[i] then
                if v.type == "colorpicker" then
                    v.changeState(Color3.new(config[i][1],config[i][2],config[i][3]))
                elseif v.type == "keybind" then
                    v.changeState(Enum[config[i][1]][config[i][2]])
                else
                    if config[i] ~= library.flags[i] then
                        v.changeState(config[i])
                    end
                end
            else
                if v.type == "toggle" then
                    v.changeState(false)
                elseif v.type == "slider" then
                    v.changeState(v.args.value or 0)
                elseif v.type == "textbox" or v.type == "list" then
                    v.changeState(v.args.text or "")
                elseif v.type == "colorpicker" then
                    v.changeState(v.args.color or Color3.new(1,1,1))
                elseif option.type == "list" then
                    v.changeState("")
                elseif option.type == "keybind" then
                    v.changeState(v.args.key or Enum.KeyCode.Unknown)
                end
            end
        end)end)
    end
    library:notify("Succesfully loaded config "..name..".cfg!")
end

function library:refreshConfigs()
    local tbl = {}
    for i,v in next, listfiles("alora/"..tostring(game.GameId)) do
        table.insert(tbl,v:split("\\")[2]:split(".")[1])
    end
    library.options["selected_config"].refresh(tbl)
end

function library:deleteConfig()
    if isfile("alora/"..tostring(game.GameId).."/"..library.flags["selected_config"]..".cfg") then
        delfile("alora/"..tostring(game.GameId).."/"..library.flags["selected_config"]..".cfg")
        library:refreshConfigs()
    end
end

local mouse = game:GetService("Players").LocalPlayer:GetMouse()
runService.RenderStepped:Connect(function()
    cursor.Position = Vector2.new(mouse.X-16,mouse.Y+40)	
end)

return library,menu,tabholder
