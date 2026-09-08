local drag = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Drag-UI-SUPPORTS-MOBILE-22790"))()
if not getgenv().bgcolor then
	getgenv().bgcolor = Color3.fromRGB(60,60,60)
end
if not getgenv().areyoumentaluis then
	getgenv().areyoumentaluis = {}
end
if not getgenv().deletewhendupefound then
	getgenv().deletewhendupefound = false
end
local lib = {}
lib.bgcolor = bgcolor
local connectfuncs = {}
local dropdownstuff = {}
local tabnum = 0
local amtsize = 100000
local amtsize2 = amtsize*10 -- incase something idk
local localplr = game.Players.LocalPlayer
local titletext = ""
local huifunc = gethui or get_hidden_gui
function lib.makelib(titletext2)
	titletext = titletext2 or "Untitled"
	if deletewhendupefound == true and getgenv().areyoumentaluis[titletext] then
		getgenv().areyoumentaluis[titletext]:Destroy()
	end
	getgenv().areyoumentaluis[titletext] = Instance.new'ScreenGui'
	local mainframe = Instance.new'Frame'
	if huifunc then
		getgenv().areyoumentaluis[titletext].Parent = huifunc()
	else
		getgenv().areyoumentaluis[titletext].Parent = game.CoreGui
	end
	mainframe.Parent = getgenv().areyoumentaluis[titletext]
	mainframe.Size = UDim2.new(.3,0,.375,0)
	mainframe.Position = UDim2.new(.35,0,.5-(.375/2))
	drag(mainframe)
	mainframe.BorderColor3 = Color3.fromRGB(255,255,255)
	mainframe.BackgroundColor3 = bgcolor
	local uiconstraint = Instance.new("UIAspectRatioConstraint")
	uiconstraint.Parent = mainframe
	uiconstraint.AspectRatio = 2
	local exitbutton = Instance.new'TextButton'
	exitbutton.Parent = mainframe
	exitbutton.Size = UDim2.new(.15,0,.2,0)
	exitbutton.Position = UDim2.new(.88,0,-.02,0)
	exitbutton.BackgroundTransparency = 1
	exitbutton.TextScaled = true
	exitbutton.Text = "X"
	exitbutton.TextColor3 = Color3.fromRGB(255,0,0)
	exitbutton.TextStrokeTransparency = 0
	exitbutton.ZIndex = 5
	local title = Instance.new'TextLabel'
	title.Parent = mainframe
	title.Size = UDim2.new(.910,0,.14,0)
	title.BorderColor3 = Color3.fromRGB(255,255,255)
	title.BackgroundColor3 = bgcolor
	title.TextScaled = true
	title.Text = titletext
	title.TextColor3 = Color3.fromRGB(255,255,255)
	title.TextStrokeTransparency = 0	
	table.insert(connectfuncs,exitbutton.MouseButton1Click:Connect(function()
		local bindfunc = Instance.new("BindableFunction")
		function bindfunc.OnInvoke(bpress)
			if bpress == "Yes" then
				mainframe.Parent:Destroy()
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification",{Title="Notification",Text="Close out of the script?",Callback=bindfunc,Button1="Yes",Button2="No"})
	end))
	table.insert(connectfuncs,getgenv().areyoumentaluis[titletext].Destroying:Connect(function()
		for i,v in pairs(connectfuncs) do
			v:Disconnect()
		end
		if lib.ondestroyedfunc then
			lib.ondestroyedfunc()
		end
	end))
	return getgenv().areyoumentaluis[titletext],mainframe
end
function lib.maketab(name)
	tabnum += 1
	local tabbutton = Instance.new'TextButton'
	tabbutton.Size = UDim2.new(.25,0,.15,0)
	tabbutton.ZIndex = -tabnum
	tabbutton.Parent = getgenv().areyoumentaluis[titletext].Frame
	tabbutton.BackgroundColor3 = bgcolor
	tabbutton.TextColor3 = Color3.fromRGB(255,255,255)
	tabbutton.TextScaled = true
	tabbutton.Text = name
	tabbutton.BorderColor3 = Color3.fromRGB(255,255,255)
	local tabframe = Instance.new'ScrollingFrame'
	tabframe.Parent = getgenv().areyoumentaluis[titletext].Frame
	tabframe.Size = UDim2.new(1,0,.820,0)
	tabframe.Position = UDim2.new(0,0,.160,0)
	tabframe.BackgroundColor3 = bgcolor
	tabframe.BorderColor3 = Color3.fromRGB(255,255,255)
	tabframe.Visible = false
	tabframe.CanvasSize = UDim2.new(0,0,amtsize,0)
	local sort = Instance.new'UIListLayout'
	sort.Parent = tabframe
	sort.SortOrder = "LayoutOrder"
	local ypos = -(((math.floor(tabnum/4.001))/8)*1.1+.15)
	if tabnum%4 == 1 then
		tabbutton.Position = UDim2.new(0,0,ypos)
	elseif tabnum%4 == 2 then
		tabbutton.Position = UDim2.new(.25,0,ypos)
	elseif tabnum%4 == 3 then
		tabbutton.Position = UDim2.new(.50,0,ypos)
	elseif tabnum%4 == 0 then
		tabbutton.Position = UDim2.new(.75,0,ypos)
	end
	local thistabnum = tabnum
	table.insert(connectfuncs,tabbutton.MouseEnter:Connect(function()
		tabbutton.Position = UDim2.new(tabbutton.Position.X.Scale,0,ypos)
		tabbutton.Size = UDim2.new(.25,0,.2,0)
		tabbutton.ZIndex = 20
	end))
	table.insert(connectfuncs,tabbutton.MouseLeave:Connect(function()
		tabbutton.Position = UDim2.new(tabbutton.Position.X.Scale,0,ypos)
		tabbutton.Size = UDim2.new(.25,0,.15,0)
		tabbutton.ZIndex = -thistabnum
	end))
	table.insert(connectfuncs,tabbutton.MouseButton1Click:Connect(function()
		for i,v in pairs(tabbutton.Parent:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Visible = false
			end
		end
		tabframe.Visible = true
	end))
	return tabframe
end
function lib.makelabel(name,tab)
	local label = Instance.new'TextLabel'
	label.Parent = tab
	label.Size = UDim2.new(.95,0,2/amtsize2,0)
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(255,255,255)
	label.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-40),math.abs((bgcolor.G*255)-40),math.abs((bgcolor.B*255)-40))
	label.BorderColor3 = Color3.fromRGB(255,255,255)
	label.Text = name
	return label
end
function lib.makebutton(name,tab,func)
	local button = Instance.new'TextButton'
	button.Parent = tab
	button.Size = UDim2.new(.95,0,2/amtsize2,0)
	button.TextScaled = true
	button.TextColor3 = Color3.fromRGB(255,255,255)
	button.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-20),math.abs((bgcolor.G*255)-20),math.abs((bgcolor.B*255)-20))
	button.BorderColor3 = Color3.fromRGB(255,255,255)
	button.Text = name
	table.insert(connectfuncs,button.MouseButton1Click:Connect(func))
	return button
end
function lib.makeslider(name,tab,min,max,func)
	local sliderframe = Instance.new'Frame'
	sliderframe.Parent = tab
	sliderframe.Size = UDim2.new(.95,0,2/amtsize2,0)
	sliderframe.BackgroundColor3 = Color3.fromRGB(40,40,40)
	sliderframe.BorderColor3 = Color3.fromRGB(255,255,255)
	local nametext = Instance.new'TextLabel'
	nametext.Parent = sliderframe
	nametext.Size = UDim2.new(.4,0,1,0)
	nametext.TextScaled = true
	nametext.TextColor3 = Color3.fromRGB(255,255,255)
	nametext.BackgroundColor3 = Color3.fromRGB(20,20,20)
	nametext.BorderColor3 = Color3.fromRGB(255,255,255)
	nametext.Text = name
	local num = Instance.new'TextLabel'
	num.Parent = sliderframe
	num.Size = UDim2.new(.1,0,1,0)
	num.Position = UDim2.new(.4,0,0,0)
	num.TextScaled = true
	num.TextColor3 = Color3.fromRGB(255,255,255)
	num.BackgroundColor3 = Color3.fromRGB(20,20,20)
	num.BorderColor3 = Color3.fromRGB(255,255,255)
	num.Text = "0"
	local slider = Instance.new'TextButton'
	slider.Parent = sliderframe
	slider.Position = UDim2.new(.725,0,0,0)
	slider.Size = UDim2.new(.05,0,1,0)
	slider.TextScaled = true
	slider.TextColor3 = Color3.fromRGB(255,255,255)
	slider.BackgroundColor3 = Color3.fromRGB(40,40,40)
	slider.BorderColor3 = Color3.fromRGB(255,255,255)
	slider.Text = "|"
	local UI = Instance.new("ScreenGui")
	UI.ScreenInsets = Enum.ScreenInsets.None 
	UI.Parent = game.CoreGui
	local size = UI.AbsoluteSize
	UI:Destroy()
	local minoffset = -size.X/16
	local maxoffset = size.X/16
	local hoverover = false
	table.insert(connectfuncs,slider.MouseButton1Up:Connect(function()
		hoverover = false
	end))
	table.insert(connectfuncs,game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			hoverover = false
		end
	end))
	table.insert(connectfuncs,game:GetService("UserInputService").TouchEnded:Connect(function(input)
		hoverover = false
	end))
	local libsize = getgenv().areyoumentaluis[titletext].Frame.AbsoluteSize
	table.insert(connectfuncs,slider.MouseButton1Down:Connect(function()
		hoverover = true
		while hoverover do
			wait()
			slider.Position = UDim2.new(.725,localplr:GetMouse().X-((libsize.X*1.875)+getgenv().areyoumentaluis[titletext].Frame.Position.X.Offset),0,0)
			local percent = (slider.Position.X.Offset + maxoffset) / (math.abs(minoffset) + maxoffset)
			percent = math.clamp(percent,0,1)
			slider.Position = UDim2.new(.725,math.clamp(slider.Position.X.Offset,minoffset,maxoffset),0,0)
			local number = (min + (max - min)*percent)
			num.Text = tostring(math.floor(number))
			if num.Text == "-0" then
				num.Text = "0"
			end
			func(number)
		end
	end))
	return sliderframe
end
function lib.maketextbox(name,tab,func)
	local box = Instance.new'TextBox'
	box.Parent = tab
	box.Size = UDim2.new(.95,0,2/amtsize2,0)
	box.TextScaled = true
	box.TextColor3 = Color3.fromRGB(255,255,255)
	box.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-20),math.abs((bgcolor.G*255)-20),math.abs((bgcolor.B*255)-20))
	box.BorderColor3 = Color3.fromRGB(255,255,255)
	box.Text = ""
	box.PlaceholderText = name
	table.insert(connectfuncs,box.FocusLost:Connect(function()
		func(box.Text)
	end))
	return box
end
function lib.maketoggle(name,tab,func,startingbool,notcolor)
	local button = Instance.new'TextButton'
	button.Parent = tab
	button.Size = UDim2.new(.95,0,2/amtsize2,0)
	button.TextScaled = true
	button.TextColor3 = Color3.fromRGB(255,255,255)
	button.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-20),math.abs((bgcolor.G*255)-20),math.abs((bgcolor.B*255)-20))
	button.BorderColor3 = Color3.fromRGB(255,255,255)
	if startingbool == nil then
		startingbool = false
	end
	if startingbool then
		button.Text = name..": ON"
	else
		button.Text = name..": OFF"
	end
	local toggled = startingbool
	function onpressed()
		if toggled == false then
			toggled = true
			button.Text = name..": ON"
		elseif toggled == true then
			toggled = false
			button.Text = name..": OFF"
		end
		func(toggled)
	end
	table.insert(connectfuncs,button.MouseButton1Click:Connect(onpressed))
	if notcolor then
		Instance.new("BoolValue",button).Name = "excludecolor"
	end
	return button
end
function lib.makedropdown(name,tab,list,func)
	local ddbutton = Instance.new'TextButton'
	ddbutton.Parent = tab
	ddbutton.Size = UDim2.new(.95,0,2/amtsize2,0)
	ddbutton.TextScaled = true
	ddbutton.TextColor3 = Color3.fromRGB(255,255,255)
	ddbutton.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-20),math.abs((bgcolor.G*255)-20),math.abs((bgcolor.B*255)-20))
	ddbutton.BorderColor3 = Color3.fromRGB(255,255,255)
	ddbutton.Text = name.." (dropdown)"
	dropdownstuff[ddbutton] = {false,func}
	local listpart = Instance.new("ScrollingFrame")
	listpart.Parent = ddbutton
	listpart.BackgroundTransparency = 1
	listpart.Visible = false
	local sort = Instance.new'UIListLayout'
	sort.Parent = listpart
	sort.SortOrder = "LayoutOrder"
	listpart.Position = UDim2.new(.175,0,1,0)
	listpart.Size = UDim2.new(.8,0,5,0)
	listpart.CanvasSize = UDim2.new(0,0,amtsize,0)
	for i,v in pairs(list) do
		local ddlistbutton = Instance.new'TextButton'
		ddlistbutton.Parent = listpart
		ddlistbutton.Size = UDim2.new(.8,0,1/amtsize,0)
		ddlistbutton.TextScaled = true
		ddlistbutton.TextColor3 = Color3.fromRGB(255,255,255)
		ddlistbutton.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-20),math.abs((bgcolor.G*255)-20),math.abs((bgcolor.B*255)-20))
		ddlistbutton.BorderColor3 = Color3.fromRGB(255,255,255)
		ddlistbutton.Text = v
		ddlistbutton.ZIndex = 20
		table.insert(connectfuncs,ddlistbutton.MouseButton1Click:Connect(function()
			func(ddlistbutton.Text)
			dropdownstuff[ddbutton] = {false,func}
			listpart.Visible = false
			return ddlistbutton.Text
		end))
	end
	table.insert(connectfuncs,ddbutton.MouseButton1Click:Connect(function()
		if dropdownstuff[ddbutton][1] == true then
			dropdownstuff[ddbutton] = {false,func}
			listpart.Visible = false
		elseif dropdownstuff[ddbutton][1] == false then
			dropdownstuff[ddbutton] = {true,func}
			listpart.Visible = true
		end
	end))
	return ddbutton
end
function lib.updatedropdown(dropdown,list)
	local func = dropdownstuff[dropdown][2]
	local listpart = dropdown.ScrollingFrame
	for i,v in pairs(listpart:GetChildren()) do
		v:Destroy()
	end
	local sort = Instance.new'UIListLayout'
	sort.Parent = listpart
	sort.SortOrder = "LayoutOrder"
	listpart.Position = UDim2.new(.175,0,1,0)
	listpart.Size = UDim2.new(.8,0,5,0)
	listpart.CanvasSize = UDim2.new(0,0,amtsize,0)
	for i,v in pairs(list) do
		local ddlistbutton = Instance.new'TextButton'
		ddlistbutton.Parent = listpart
		ddlistbutton.Size = UDim2.new(.8,0,1/amtsize)
		ddlistbutton.TextScaled = true
		ddlistbutton.TextColor3 = Color3.fromRGB(255,255,255)
		ddlistbutton.BackgroundColor3 = Color3.fromRGB(math.abs((bgcolor.R*255)-20),math.abs((bgcolor.G*255)-20),math.abs((bgcolor.B*255)-20))
		ddlistbutton.BorderColor3 = Color3.fromRGB(255,255,255)
		ddlistbutton.Text = v
		ddlistbutton.ZIndex = 20
		listpart.Size = UDim2.new(.8,0,amtsize,0)
		table.insert(connectfuncs,ddlistbutton.MouseButton1Click:Connect(function()
			func(ddlistbutton.Text)
			dropdownstuff[dropdown] = {false,func}
			listpart.Visible = false
			return ddlistbutton.Text
		end))
	end
end
function lib.updatelabel(text,label)
	label.Text = text
end
function lib.updateallcolors_secret(color3)
	for i,v in pairs(getgenv().areyoumentaluis[titletext]:GetDescendants()) do
		local success,err = pcall(function()
			if not v:FindFirstChild("excludecolor") then
				v.BackgroundColor3 = color3
			end
		end)
	end
	return "shh"
end
return lib