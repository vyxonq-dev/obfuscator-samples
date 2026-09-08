
local base_debounce = 0.3 
local debounces = getgenv().configuration or nil 
if not debounces then 
	debounces = {
		['1'] = base_debounce;
		['1.25'] = base_debounce;
		['1.5'] = base_debounce-0.05;
		['1.75'] = base_debounce-0.1;
		['2'] = base_debounce-0.12;
		['2.25'] = base_debounce-0.25;
		['2.5'] = base_debounce-2;
	}
end 

local vim = game:GetService('VirtualInputManager')
local players = game:GetService('Players')

local plr = players.LocalPlayer 
local player_gui = plr.PlayerGui 

local bird = player_gui.Game.Game.MainBird 
local pipes = player_gui.Game.Game.Pipes 

local speed_change_func = getconnections(player_gui.Game.Game.Menus.Settings.Container["3_Speed"].Left.MouseButton1Click)[1].Function

local function mouse_press()
	vim:SendMouseButtonEvent(0, 0, 0, true, game, 0) 
	task.wait(0.01)
	vim:SendMouseButtonEvent(0, 0, 0, false, game, 0) 
end  

local passed_pipes = {}
local function get_closest_pipe()
	local closest = nil 
	local dist = math.huge 
	for i,v in next, pipes:GetChildren() do 
		if v:IsA('Frame') and v:FindFirstChild('down') and not table.find(passed_pipes, v) then 
			local down = v.down 
			local mag = (bird.AbsolutePosition - down.AbsolutePosition).magnitude 
			if mag < dist then 
				dist = mag 
				closest = v 
			end 
		end  
	end  
	return closest 
end  

local function change_pipe_color(pipe, color)
	for i,v in next, pipe:GetChildren() do 
		if v:IsA('ImageLabel') then 
			v.ImageColor3 = color
		end 
	end  
end  

local old_closest = nil 
local pipe_manager = require(game.Players.LocalPlayer.PlayerGui.Game.Main.Sound)
local old = pipe_manager.Play 

local speed = getupvalue(speed_change_func, 2)
local debounce = debounces[tostring(speed)]

local game_over = false
pipe_manager.Play = function(what) 
	if what == 'point' then
		task.delay(debounce, function()
			table.insert(passed_pipes, old_closest)
		end)
	elseif what == 'die' then 
		passed_pipes = {}
		old_closest = nil 
		game_over = true 
	elseif what == 'wing' then 
		speed = getupvalue(speed_change_func, 2)
		debounce = debounces[tostring(speed)]
		game_over = false 
	end 
	return old(what)
end

task.spawn(function() -- closest pipe handler
	while task.wait() do 
		if not game_over then 
			local closest = get_closest_pipe() 
			if closest then 
				if old_closest ~= nil and old_closest ~= closest then 
					change_pipe_color(old_closest, Color3.new(1,1,1))
				end  
				old_closest = closest 
				change_pipe_color(old_closest, Color3.new(1,0,0))
			else 
				old_closest = nil 
			end
		else 
			old_closest = nil 
		end  
	end  
end) 

task.spawn(function()
	while task.wait() do 
		local closest_pipe = old_closest 
		if closest_pipe then 
			local pos_x = closest_pipe.down.Position.X.Scale 
			local pos_y = closest_pipe.down.Position.Y.Scale 
			local gap_pos = UDim2.new(pos_x, 0, pos_y-0.20, 0) 

			local y_min = pos_y-0.25 
			local y_max = pos_y-0.05

			local bird_y = bird.Position.Y.Scale
			
			if bird_y > y_max then 
				mouse_press()
			elseif bird_y < y_min then 
				--wait 
			end    
		end 
	end  
end) 

local intro = loadstring(game:HttpGet('https://raw.githubusercontent.com/konoSubaraship/roblox_scripts/refs/heads/main/utility/intro.luau'))()
intro('Flappy Bird (Auto Play)')
