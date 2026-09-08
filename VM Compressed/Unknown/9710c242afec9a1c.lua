if (not game:IsLoaded()) then
	task.wait(2.5);
end

-- Services
local Workspace = (workspace);
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TeleportService = game:GetService("TeleportService");

-- Variables
local Equip = ReplicatedStorage:WaitForChild("GetEquipped", 5);
local Coordinate = CFrame.new(-587.462341, -210.403809, 2842.21436)

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild("Humanoid", 5);
local RootPart = Humanoid.RootPart

-- Init
Equip:InvokeServer("Default");

repeat
	task.wait();
until Humanoid.SeatPart

local SeatPart = (Humanoid.SeatPart);
local Cart = SeatPart and SeatPart:FindFirstAncestorOfClass("Model");

if (Cart) then
  for _ = 1, 20 do
    task.wait(0.1);
    Cart:PivotTo(Coordinate);
	Humanoid.RootPart.CFrame = Coordinate
  end
end

queueonteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/projects/refs/heads/main/RideACartDownASlide/MultiplierFarmer.luau"))()')
TeleportService:Teleport(game.PlaceId, LocalPlayer);
