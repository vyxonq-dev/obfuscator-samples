--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = game:GetService("Players");
local v1 = game:GetService("RunService");
local v2 = game:GetService("PathfindingService");
local v3 = v0.LocalPlayer;
local v4, v5, v6;
local function v7(v26)
	v4 = v26;
	v5 = v26:WaitForChild("Humanoid");
	v6 = v26:WaitForChild("HumanoidRootPart");
	v5.WalkSpeed = 22;
	v5.AutoRotate = false;
end
v7(v3.Character or v3.CharacterAdded:Wait());
v3.CharacterAdded:Connect(v7);
local v8 = 0.5;
local v9 = 3;
local v10 = 0.35;
local v11 = 6;
local v12 = 5;
local v13;
local v14 = 0;
local v15 = 0;
local v16 = {AgentRadius=3,AgentHeight=6,AgentCanJump=true,WaypointSpacing=5};
local v17 = RaycastParams.new();
v17.FilterType = Enum.RaycastFilterType.Blacklist;
v17.IgnoreWater = true;
local function v21()
	v17.FilterDescendantsInstances = {v4};
	return workspace:Raycast(v6.Position, v6.CFrame.LookVector * v12, v17);
end
local function v22()
	local v30, v31 = nil, math.huge;
	for v44, v45 in ipairs(v0:GetPlayers()) do
		if ((v45 ~= v3) and v45.Character and v45.Character:FindFirstChild("HumanoidRootPart")) then
			if (v45.Character.Humanoid.Health > 0) then
				local v50 = (v6.Position - v45.Character.HumanoidRootPart.Position).Magnitude;
				if (v50 < v31) then
					v31 = v50;
					v30 = v45;
				end
			end
		end
	end
	v13 = v30;
end
local function v23(v32)
	if not v13 then
		return;
	end
	local v33 = v13.Character.HumanoidRootPart;
	v15 += (v32 * 10)
	local v34 = CFrame.lookAt(v6.Position, Vector3.new(v33.Position.X, v6.Position.Y, v33.Position.Z));
	v6.CFrame = CFrame.new(v6.Position) * v34.Rotation;
end
local function v24(v36)
	if v21() then
		local v46 = ((math.random() > 0.5) and 1) or -1;
		v5:MoveTo(v6.Position + (v6.CFrame.RightVector * v11 * v46));
	else
		v5:MoveTo(v36);
	end
end
local function v25()
	if not v13 then
		return;
	end
	if ((tick() - v14) < v8) then
		return;
	end
	v14 = tick();
	local v37 = v13.Character.HumanoidRootPart;
	local v38 = v13.Character.Humanoid;
	local v39 = v37.Position + (v37.Velocity * v10);
	local v40 = v2:CreatePath(v16);
	local v41 = pcall(function()
		v40:ComputeAsync(v6.Position, v39);
	end);
	if (v41 and (v40.Status == Enum.PathStatus.Success)) then
		local v47 = v40:GetWaypoints();
		local v48 = math.clamp(v9, 2, #v47);
		if v47[v48] then
			v24(v47[v48].Position);
		end
	end
end
v5.MoveToFinished:Connect(function(v42)
	if not v42 then
		v5.Jump = true;
	end
end);
v1.Heartbeat:Connect(function(v43)
	v22();
	v23(v43);
	v25();
end);
print("[HARDCORE AI] เน€เธ”เธดเธเธกเธฑเนเธเนเธ เนเธฅเนเธเธฃเธดเธ เนเธกเนเธฅเธฑเธเน€เธฅ");