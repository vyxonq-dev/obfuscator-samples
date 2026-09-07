--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local StarterGui = game:GetService("StarterGui");
local backpack = game.Players.LocalPlayer.Backpack;
local player = Players.LocalPlayer;
local backpack = player:WaitForChild("Backpack");
local camera = workspace.CurrentCamera;
local mouse = player:GetMouse();
local fixedDistance = 1;
local defaultAngle = 45;
local tool = Instance.new("Tool");
tool.Name = "Flash Light";
tool.RequiresHandle = true;
tool.Parent = backpack;
tool.TextureId = "rbxassetid://96213441150462";
tool.GripForward = Vector3.new(-0.989, 0, 0.149);
tool.GripPos = Vector3.new(0.55, -0.1, -0.1);
tool.GripRight = Vector3.new(-0.149, 0, -0.989);
tool.GripUp = Vector3.new(0, 1, 0);
local handle = Instance.new("Part");
handle.Name = "Handle";
handle.Size = Vector3.new(1, 1, 1);
handle.CanCollide = false;
handle.Parent = tool;
local mesh = Instance.new("SpecialMesh");
mesh.MeshId = "rbxassetid://6158692587";
mesh.TextureId = "rbxassetid://6158692758";
mesh.Scale = Vector3.new(-0.1, 0.1, -0.1);
mesh.Parent = handle;
local flashPart = nil;
local updateConnection = nil;
local function updateLightSource()
	local character = player.Character;
	if not character then
		return;
	end
	local head = character:FindFirstChild("Head");
	local hrp = character:FindFirstChild("HumanoidRootPart");
	if (not head or not hrp) then
		return;
	end
	local isFirstPerson = (camera.CFrame.Position - head.Position).Magnitude < 5;
	local origin, direction;
	if isFirstPerson then
		origin = camera.CFrame.Position;
		direction = (mouse.Hit.p - origin).Unit;
		handle.Transparency = 1;
	else
		origin = hrp.Position + Vector3.new(0, 2, 0);
		direction = hrp.CFrame.LookVector;
		handle.Transparency = 0;
	end
	local newPos = origin + (direction * fixedDistance);
	if flashPart then
		flashPart.CFrame = CFrame.new(newPos, newPos + direction);
		local spot = flashPart:FindFirstChildOfClass("SpotLight");
		if spot then
			spot.Angle = defaultAngle;
		end
	end
end
local function turnOnLight()
	if flashPart then
		return;
	end
	flashPart = Instance.new("Part");
	flashPart.Name = "FlashLightPart";
	flashPart.Size = Vector3.new(6, 6, 0.1);
	flashPart.Transparency = 1;
	flashPart.Anchored = true;
	flashPart.CanCollide = false;
	flashPart.Parent = workspace;
	local spot = Instance.new("SpotLight");
	spot.Name = "FlashSpot";
	spot.Angle = defaultAngle;
	spot.Brightness = 15;
	spot.Range = 50;
	spot.Shadows = false;
	spot.Enabled = true;
	spot.Parent = flashPart;
	updateConnection = RunService.RenderStepped:Connect(updateLightSource);
end
local function turnOffLight()
	if updateConnection then
		updateConnection:Disconnect();
		updateConnection = nil;
	end
	if flashPart then
		flashPart:Destroy();
		flashPart = nil;
	end
end
local lightOn = false;
tool.Activated:Connect(function()
	lightOn = not lightOn;
	if lightOn then
		turnOnLight();
	else
		turnOffLight();
	end
end);
tool.Equipped:Connect(function()
end);
tool.Unequipped:Connect(function()
	turnOffLight();
	lightOn = false;
end);
--Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib
--best Obfuscator frfr
local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v8,v9) local v10={};for v11=1, #v8 do v6(v10,v0(v4(v1(v2(v8,v11,v11 + 1 )),v1(v2(v9,1 + (v11% #v9) ,1 + (v11% #v9) + 1 )))%256 ));end return v5(v10);end StarterGui:SetCore(v7("\226\198\213\33\200\180\211\23\215\202\216\36\242\178\200\16","\126\177\163\187\69\134\219\167"),{[v7("\23\196\62\201\249","\156\67\173\74\165")]=v7("\18\187\72\5\180\102\106\61\176\65\2\253","\38\84\215\41\118\220\70"),[v7("\100\19\58\6","\158\48\118\66\114")]=v7("\134\37\20\51\51\167\226\241\8\5\59\99\172\250","\155\203\68\112\86\19\197"),[v7("\98\200\36\253\84\113\234\246","\152\38\189\86\156\32\24\133")]=14 -9 ,[v7("\213\84\168\72","\38\156\55\199")]=v7("\186\127\100\41\0\103\255\87\161\121\38\103\92\38\168\22\241\40\37\127\74","\35\200\29\28\72\115\20\154")});
