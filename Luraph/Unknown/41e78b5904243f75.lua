

-- # all credits go to linemaster, ignore horrid source



if (not LPH_OBFUSCATED) then
    LPH_NO_VIRTUALIZE = function(...) return (...) end;
    LPH_JIT_MAX = function(...) return (...) end;
    LPH_JIT_ULTRA = function(...) return (...) end;
end


function load()
    --// Services
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local Lighting = game:GetService("Lighting")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    --// Variables
    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace:FindFirstChildWhichIsA("Camera")
    local Hitsounds = {}

    --// Script Table
    local Script = {
        Functions = {},
        Locals = {
            Target = nil,
            IsTargetting = false,
            Resolver = {
                OldTick = tick(),
                OldPos = Vector3.new(0, 0, 0),
                ResolvedVelocity = Vector3.new(0, 0, 0)
            },
            AutoSelectTick = tick(),
            AntiAimViewer = {
                MouseRemoteFound = false,
                MouseRemote = nil,
                MouseRemoteArgs = nil,
                MouseRemotePositionIndex = nil
            },
            HitEffect = nil,
            Gun = {
                PreviousGun = nil,
                PreviousAmmo = 999,
                Shotguns = {"[Double-Barrel SG]", "[TacticalShotgun]", "[Shotgun]"}
            },
            PlayerHealth = {},
            JumpOffset = 0,
            BulletPath = {
                [4312377180] = Workspace:FindFirstChild("MAP") and Workspace.MAP:FindFirstChild("Ignored") or nil,
                [1008451066] = Workspace:FindFirstChild("Ignored") and Workspace.Ignored:FindFirstChild("Siren") and Workspace.Ignored.Siren:FindFirstChild("Radius") or nil,
                [3985694250] = Workspace and Workspace:FindFirstChild("Ignored") or nil,
                [5106782457] = Workspace and Workspace:FindFirstChild("Ignored") or nil,
                [4937639028] = Workspace and Workspace:FindFirstChild("Ignored") or nil,
                [1958807588] = Workspace and Workspace:FindFirstChild("Ignored") or nil
            },
            World = {
                FogColor = Lighting.FogColor,
                FogStart = Lighting.FogStart,
                FogEnd = Lighting.FogEnd,
                Ambient = Lighting.Ambient,
                Brightness = Lighting.Brightness,
                ClockTime = Lighting.ClockTime,
                ExposureCompensation = Lighting.ExposureCompensation
            },
            SavedCFrame = nil,
            NetworkPreviousTick = tick(),
            NetworkShouldSleep = false,
            FFlags = {
      }
            ,OriginalVelocity = {},
            RotationAngle = 0
        },
        Utility = {
            Drawings = {},
            EspCache = {}
        },
        Connections = {
            GunConnections = {}
        },
        AzureIgnoreFolder = Instance.new("Folder", game:GetService("Workspace"))
    }

    --// Settings Table
    local Settings = {
        Combat = {
            Enabled = false,
            AimPart = "HumanoidRootPart",
            Silent = false,
            Mouse = false,
            Alerts = false,
            LookAt = false,
            Spectate = false,
            AntiAimViewer = false,
            AutoSelect = {
                Enabled = false,
                Cooldown = {
                    Enabled = false,
                    Amount = 0.5
                }
            },
            Checks = {
                Enabled = false,
                Knocked = false,
                Crew = false,
                Wall = false,
                Grabbed = false,
                Vehicle = false
            },
            Smoothing = {
                Horizontal = 1,
                Vertical = 1
            },
            Prediction = {
                Horizontal = 0.134,
                Vertical = 0.134
            },
            Resolver = {
                Enabled = false,
                RefreshRate = 0
            },
            Fov = {
                Enabled = false,
                Visualize = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1)
                },
                Radius = 80
            },
            Visuals = {
                Enabled = false,
                Tracer = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1),
                    Thickness = 2
                },
                Dot = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1),
                    Filled = false,
                    Size = 6
                },
                Chams = {
                    Enabled = false,
                    Fill = {
                        Color = Color3.new(1, 1, 1),
                        Transparency = 0.5
                    },
                    Outline = {
                        Color = Color3.new(1, 1, 1),
                        Transparency = 0.5
                    }
                }
            },
            Air = {
                Enabled = false,
                AirAimPart = {
                    Enabled = false,
                    HitPart = "LowerTorso"
                },
                JumpOffset = {
                    Enabled = false,
                    Offset = 0.09
                }
            }
        },
        Visuals = {
            Esp = {
                Enabled = false,
                Boxes = {
                    Enabled = false,
                    Filled = {
                        Enabled = false,
                        Color = Color3.new(1, 1, 1),
                        Transparency = 0.3
                    },
                    Color = Color3.new(1, 1, 1)
                }
            },
            BulletTracers = {
                Enabled = false,
                Color = {
                    Gradient1 = Color3.new(1, 1, 1),
                    Gradient2 = Color3.new(0, 0, 0)
                },
                Duration = 1,
                Fade = {
                    Enabled = false,
                    Duration = 0.5
                }
            },
            BulletImpacts = {
                Enabled = false,
                Color = Color3.new(1, 1, 1),
                Duration = 1,
                Size = 1,
                Material = "SmoothPlastic",
                Fade = {
                    Enabled = false,
                    Duration = 0.5
                }
            },
            OnHit = {
                Enabled = false,
                Effect = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1)
                },
                Sound = {
                    Enabled = false,
                    Volume = 5,
                    Value = "Skeet"
                },
                Chams = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1),
                    Material = "ForceField",
                    Duration = 1
                }
            },
            World = {
                Enabled = false,
                Fog = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1),
                    End = 1000,
                    Start = 10000
                },
                Ambient = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1)
                },
                Brightness = {
                    Enabled = false,
                    Value = 0
                },
                ClockTime = {
                    Enabled = false,
                    Value = 24
                },
                WorldExposure = {
                    Enabled = false,
                    Value = -0.1
                }
            },
            Crosshair = {
                Enabled = false,
                Color = Color3.new(1, 1, 1),
                Size = 10,
                Gap = 2,
                Rotation = {
                    Enabled = false,
                    Speed = 1
                }
            }
        },
        AntiAim = {
            VelocitySpoofer = {
                Enabled = false,
                Visualize = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1),
                    Prediction = 0.134
                },
                Type = "Underground",
                Roll = 0,
                Pitch = 0,
                Yaw = 0
            },
            CSync = {
                Enabled = false,
                Type = "Custom",
                Visualize = {
                    Enabled = false,
                    Color = Color3.new(1, 1, 1)
                },
                RandomDistance = 16,
                Custom = {
                    X = 0,
                    Y = 0,
                    Z = 0
                },
                TargetStrafe = {
                    Speed = 1,
                    Distance = 1,
                    Height = 1
                }
            },
            Network = {
                Enabled = false,
                WalkingCheck = false,
                Amount = 0.1
            },
            VelocityDesync = {
                Enabled = false,
                Range = 1
            },
            FFlagDesync = {
                Enabled = false,
                SetNew = false,
                FFlags = {"S2PhysicsSenderRate"},
                SetNewAmount = 15,
                Amount = 2
            },
        },
        Misc = {
            Movement = {
                Speed = {
                    Enabled = false,
                    Amount = 1
                },
            },
            Exploits = {
                Enabled = false,
                NoRecoil = false,
                NoJumpCooldown = false,
                NoSlowDown = false
            }
        }
    }

    --// Functions
    do
        --// Utility Functions
        do
            Script.Functions.WorldToScreen = function(Position: Vector3)
                if not Position then return end

                local ViewportPointPosition, OnScreen = Camera:WorldToViewportPoint(Position)
                local ScreenPosition = Vector2.new(ViewportPointPosition.X, ViewportPointPosition.Y)
                return {
                    Position = ScreenPosition,
                    OnScreen = OnScreen
                }
            end

            Script.Functions.Connection = function(ConnectionType: any, Function: any)
                local Connection = ConnectionType:Connect(Function)
                return Connection
            end

            Script.Functions.MoveMouse = function(Position: Vector2, SmoothingX: number, SmoothingY: number)
                local MousePosition = UserInputService:GetMouseLocation()

                mousemoverel((Position.X - MousePosition.X) / SmoothingX, (Position.Y - MousePosition.Y) / SmoothingY)
            end

            Script.Functions.CreateDrawing = function(DrawingType: string, Properties: any)
                local DrawingObject = Drawing.new(DrawingType)

                for Property, Value in pairs(Properties) do
                    DrawingObject[Property] = Value
                end
                return DrawingObject
            end

            Script.Functions.WallCheck = function(Part: any)
                local RayCastParams = RaycastParams.new()
                RayCastParams.FilterType = Enum.RaycastFilterType.Exclude
                RayCastParams.IgnoreWater = true
                RayCastParams.FilterDescendantsInstances = Script.AzureIgnoreFolder:GetChildren()

                local CameraPosition = Camera.CFrame.Position
                local Direction = (Part.Position - CameraPosition).Unit
                local RayCastResult = workspace:Raycast(CameraPosition, Direction * 10000, RayCastParams)

                return RayCastResult.Instance and RayCastResult.Instance == Part
            end

            Script.Functions.Create = function(ObjectType: string, Properties: any)
                local Object = Instance.new(ObjectType)

                for Property, Value in pairs(Properties) do
                    Object[Property] = Value
                end
                return Object
            end

            Script.Functions.GetGun = function(Player: any)
                local Info = {
                    Tool = nil,
                    Ammo = nil,
                    IsGunEquipped = false
                }

                local Tool = Player.Character:FindFirstChildWhichIsA("Tool")

                if not Tool then return end

                if game.GameId == 1958807588 then
                    local ArmoryGun = Player.Information.Armory:FindFirstChild(Tool.Name)
                    if ArmoryGun then
                        Info.Tool = Tool
                        Info.Ammo = ArmoryGun.Ammo.Normal
                        Info.IsGunEquipped = true
                    else
                        for _, Object in pairs(Tool:GetChildren()) do
                            if Object.Name:lower():find("ammo") and not Object.Name:lower():find("max") then
                                Info.Tool = Tool
                                Info.IsGunEquipped = true
                                Info.Ammo = Object
                            end
                        end
                    end
                elseif game.GameId == 3634139746 then
                    for _, Object in pairs(Tool:getdescendants()) do
                        if Object.Name:lower():find("ammo") and not Object.Name:lower():find("max") and not Object.Name:lower():find("no") then
                            Info.Tool = Tool
                            Info.Ammo = Object
                            Info.IsGunEquipped = true
                        end
                    end
                else
                    for _, Object in pairs(Tool:GetChildren()) do
                        if Object.Name:lower():find("ammo") and not Object.Name:lower():find("max") then
                            Info.Tool = Tool
                            Info.IsGunEquipped = true
                            Info.Ammo = Object
                        end
                    end
                end


                return Info
            end

            Script.Functions.Beam = function(StartPos: Vector3, EndPos: Vector3)
                local ColorSequence = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Settings.Visuals.BulletTracers.Color.Gradient1),
                    ColorSequenceKeypoint.new(1, Settings.Visuals.BulletTracers.Color.Gradient2),
                })
                local Part = Instance.new("Part", Script.AzureIgnoreFolder)
                Part.Size = Vector3.new(0, 0, 0)
                Part.Massless = true
                Part.Transparency = 1
                Part.CanCollide = false
                Part.Position = StartPos
                Part.Anchored = true
                local Attachment = Instance.new("Attachment", Part)
                local Part2 = Instance.new("Part", Script.AzureIgnoreFolder)
                Part2.Size = Vector3.new(0, 0, 0)
                Part2.Transparency = 0
                Part2.CanCollide = false
                Part2.Position = EndPos
                Part2.Anchored = true
                Part2.Material = Enum.Material.ForceField
                Part2.Color = Color3.fromRGB(255, 0, 212)
                Part2.Massless = true
                local Attachment2 = Instance.new("Attachment", Part2)
                local Beam = Instance.new("Beam", Part)
                Beam.FaceCamera = true
                Beam.Color = ColorSequence
                Beam.Attachment0 = Attachment
                Beam.Attachment1 = Attachment2
                Beam.LightEmission = 6
                Beam.LightInfluence = 1
                Beam.Width0 = 1.5
                Beam.Width1 = 1.5
                Beam.Texture = "http://www.roblox.com/asset/?id=446111271"
                Beam.TextureSpeed = 2
                Beam.TextureLength = 1
                task.delay(Settings.Visuals.BulletTracers.Duration, function()
                    if Settings.Visuals.BulletTracers.Fade.Enabled then
                        local TweenValue = Instance.new("NumberValue")
                        TweenValue.Parent = Beam
                        local Tween = TweenService:Create(TweenValue, TweenInfo.new(Settings.Visuals.BulletTracers.Fade.Duration), {Value = 1})
                        Tween:Play()

                        local Connection
                        Connection = Script.Functions.Connection(TweenValue:GetPropertyChangedSignal("Value"), function()
                            Beam.Transparency = NumberSequence.new(TweenValue.Value, TweenValue.Value)
                        end)

                        Script.Functions.Connection(Tween.Completed, function()
                            Connection:Disconnect()
                            Part:Destroy()
                            Part2:Destroy()
                        end)
                    else
                        Part:Destroy()
                        Part2:Destroy()
                    end
                end)
            end

            Script.Functions.Impact = function(Pos: Vector3)
                local Part = Script.Functions.Create("Part", {
                    Parent = Script.AzureIgnoreFolder,
                    Color = Settings.Visuals.BulletImpacts.Color,
                    Size = Vector3.new(Settings.Visuals.BulletImpacts.Size, Settings.Visuals.BulletImpacts.Size, Settings.Visuals.BulletImpacts.Size),
                    Position = Pos,
                    Anchored = true,
                    Material = Enum.Material[Settings.Visuals.BulletImpacts.Material]
                })

                task.delay(Settings.Visuals.BulletImpacts.Duration, function()
                    if Settings.Visuals.BulletImpacts.Fade.Enabled then
                        local Tween = TweenService:Create(Part, TweenInfo.new(Settings.Visuals.BulletImpacts.Fade.Duration), {Transparency = 1})
                        Tween:Play()

                        Script.Functions.Connection(Tween.Completed, function()
                            Part:Destroy()
                        end)
                    else
                        Part:Destroy()
                    end
                end)
            end

            Script.Functions.GetClosestPlayerDamage = function(Position: Vector3, MaxRadius: number)
                local Radius = MaxRadius
                local ClosestPlayer

                for PlayerName, Health in pairs(Script.Locals.PlayerHealth) do
                    local Player = Players:FindFirstChild(PlayerName)
                    if Player and Player.Character then
                        local PlayerPosition = Player.Character.PrimaryPart.Position
                        local Distance = (Position - PlayerPosition).Magnitude
                        local CurrentHealth = Player.Character.Humanoid.Health
                        if (Distance < Radius) and (CurrentHealth < Health) then
                            Radius = Distance
                            ClosestPlayer = Player
                        end
                    end
                end
                return ClosestPlayer
            end


            Script.Functions.Effect = function(Part, Color)
                local Clone = Script.Locals.HitEffect:Clone()
                Clone.Parent = Part

                for _, Effect in pairs(Clone:GetChildren()) do
                    if Effect:IsA("ParticleEmitter") then
                        Effect.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                            ColorSequenceKeypoint.new(0.495, Settings.Visuals.OnHit.Effect.Color),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
                        })
                        Effect:Emit(1)
                    end
                end

                task.delay(2, function()
                    Clone:Destroy()
                end)
            end

            Script.Functions.PlaySound = function(SoundId, Volume)
                local Sound = Instance.new("Sound")
                Sound.Parent = Script.AzureIgnoreFolder
                Sound.Volume = Volume
                Sound.SoundId = SoundId

                Sound:Play()

                Script.Functions.Connection(Sound.Ended, function()
                    Sound:Destroy()
                end)
            end

            Script.Functions.Hitcham = function(Player, Color)
                for _, BodyPart in pairs(Player.Character:GetChildren()) do
                    if BodyPart.Name ~= "HumanoidRootPart" and BodyPart:IsA("BasePart") then
                        local Part = Instance.new("Part")
                        Part.Name = BodyPart.Name .. "_Clone"
                        Part.Parent = Script.AzureIgnoreFolder
                        Part.Material = Enum.Material[Settings.Visuals.OnHit.Chams.Material]
                        Part.Color = Settings.Visuals.OnHit.Chams.Color
                        Part.Transparency = 0
                        Part.Anchored = true
                        Part.Size = BodyPart.Size
                        Part.CFrame = BodyPart.CFrame

                        task.delay(Settings.Visuals.OnHit.Chams.Duration, function()
                            Part:Destroy()
                        end)
                    end
                end
            end

            Script.Functions.Rotate = function(Vector, Origin, Angle)
                local CosA = math.cos(Angle)
                local SinA = math.sin(Angle)
                local X = Vector.X - Origin.X
                local Y = Vector.Y - Origin.Y
                local NewX = X * CosA - Y * SinA
                local NewY = X * SinA + Y * CosA
                return Vector2.new(NewX + Origin.x, NewY + Origin.y)
            end
        end

        --// General Functions
        do
            Script.Functions.GetClosestPlayer = function()
                local Radius = Settings.Combat.Fov.Enabled and Settings.Combat.Fov.Radius or math.huge
                local ClosestPlayer
                local Mouse = UserInputService:GetMouseLocation()

                for _, Player in pairs(Players:GetPlayers()) do
                    if Player ~= LocalPlayer then
                        --// Variables
                        local ScreenPosition = Script.Functions.WorldToScreen(Player.Character.PrimaryPart.Position)
                        local Distance = (Mouse - ScreenPosition.Position).Magnitude

                        --// OnScreen Check
                        if not ScreenPosition.OnScreen then continue end

                        --// Checks
                        if (Settings.Combat.Checks.Enabled and (Settings.Combat.Checks.Vehicle and Player.Character:FindFirstChild("[CarHitBox]")) or (Settings.Combat.Checks.Knocked and Player.Character.BodyEffects["K.O"].Value == true) or (Settings.Combat.Checks.Grabbed and Player.Character:FindFirstChild("GRABBING_CONSTRAINT")) or (Settings.Combat.Checks.Crew and Player.DataFolder.Information.Crew.Value == LocalPlayer.DataFolder.Information.Crew.Value) or (Settings.Combat.Checks.Wall and Script.Functions.WallCheck(Player.Character.PrimaryPart))) then continue end

                        if (Distance < Radius) then
                            Radius = Distance
                            ClosestPlayer = Player
                        end
                    end
                end

                return ClosestPlayer
            end

            Script.Functions.GetPredictedPosition = function()
                local BodyPart = Script.Locals.Target.Character[Settings.Combat.AimPart]
                local Velocity = Settings.Combat.Resolver.Enabled and Script.Locals.Resolver.ResolvedVelocity or Script.Locals.Target.Character.HumanoidRootPart.Velocity
                local Position = BodyPart.Position + Velocity * Vector3.new(Settings.Combat.Prediction.Horizontal, Settings.Combat.Prediction.Vertical, Settings.Combat.Prediction.Horizontal)

                if Settings.Combat.Air.Enabled and Settings.Combat.Air.JumpOffset.Enabled then
                    Position = Position + Vector3.new(0, Script.Locals.JumpOffset, 0)
                end

                return Position
            end

            Script.Functions.Resolve = function()
                if Settings.Combat.Enabled and Settings.Combat.Resolver.Enabled and Script.Locals.IsTargetting and Script.Locals.Target then
                    --// Variables
                    local HumanoidRootPart = Script.Locals.Target.Character.HumanoidRootPart
                    local CurrentPosition = HumanoidRootPart.Position
                    local DeltaTime = tick() - Script.Locals.Resolver.OldTick
                    local NewVelocity = (CurrentPosition - Script.Locals.Resolver.OldPos) / DeltaTime

                    --// Set the velocity
                    Script.Locals.Resolver.ResolvedVelocity = NewVelocity

                    --// Update the old tick and old position
                    if tick() - Script.Locals.Resolver.OldTick >= 1 / Settings.Combat.Resolver.RefreshRate then
                        Script.Locals.Resolver.OldTick, Script.Locals.Resolver.OldPos = tick(), HumanoidRootPart.Position
                    end
                end
            end

            Script.Functions.MouseAim = function()
                if Settings.Combat.Enabled and Settings.Combat.Mouse and Script.Locals.IsTargetting and Script.Locals.Target then
                    local Position = Script.Functions.GetPredictedPosition()
                    local ScreenPosition = Script.Functions.WorldToScreen(Position)

                    if ScreenPosition.OnScreen then
                        Script.Functions.MoveMouse(ScreenPosition.Position, Settings.Combat.Smoothing.Horizontal, Settings.Combat.Smoothing.Vertical)
                    end
                end
            end

            Script.Functions.UpdateFieldOfView = function()
                Script.Utility.Drawings["FieldOfViewVisualizer"].Visible = Settings.Combat.Enabled and Settings.Combat.Fov.Enabled and Settings.Combat.Fov.Visualize.Enabled
                Script.Utility.Drawings["FieldOfViewVisualizer"].Color = Settings.Combat.Fov.Visualize.Color
                Script.Utility.Drawings["FieldOfViewVisualizer"].Radius = Settings.Combat.Fov.Radius
                Script.Utility.Drawings["FieldOfViewVisualizer"].Position = UserInputService:GetMouseLocation()
            end

            Script.Functions.UpdateTargetVisuals = function()
                --// ScreenPosition, Will be changed later
                local Position

                --// Variable to indicate if you"re targetting or not with a check if the target visuals are enabled
                local IsTargetting = Settings.Combat.Enabled and Settings.Combat.Visuals.Enabled and Script.Locals.IsTargetting and Script.Locals.Target or false

                --// Change the position
                if IsTargetting then
                    local PredictedPosition = Script.Functions.GetPredictedPosition()
                    Position = Script.Functions.WorldToScreen(PredictedPosition)
                end

                --// Variable to indicate if the drawing elements should show
                local TracerShow = IsTargetting and Settings.Combat.Visuals.Tracer.Enabled and Position.OnScreen or false
                local DotShow = IsTargetting and Settings.Combat.Visuals.Dot.Enabled and Position.OnScreen or false
                local ChamsShow = IsTargetting and Settings.Combat.Visuals.Chams.Enabled and Script.Locals.Target and Script.Locals.Target.Character or nil


                --// Set the drawing elements visibility
                Script.Utility.Drawings["TargetTracer"].Visible = TracerShow
                Script.Utility.Drawings["TargetDot"].Visible = DotShow
                Script.Utility.Drawings["TargetChams"].Parent = ChamsShow


                --// Update the drawing elements
                if TracerShow then
                    Script.Utility.Drawings["TargetTracer"].From = UserInputService:GetMouseLocation()
                    Script.Utility.Drawings["TargetTracer"].To = Position.Position
                    Script.Utility.Drawings["TargetTracer"].Color = Settings.Combat.Visuals.Tracer.Color
                    Script.Utility.Drawings["TargetTracer"].Thickness = Settings.Combat.Visuals.Tracer.Thickness
                end

                if DotShow then
                    Script.Utility.Drawings["TargetDot"].Position = Position.Position
                    Script.Utility.Drawings["TargetDot"].Radius = Settings.Combat.Visuals.Dot.Size
                    Script.Utility.Drawings["TargetDot"].Filled = Settings.Combat.Visuals.Dot.Filled
                    Script.Utility.Drawings["TargetDot"].Color = Settings.Combat.Visuals.Dot.Color
                end

                if ChamsShow then
                    Script.Utility.Drawings["TargetChams"].FillColor = Settings.Combat.Visuals.Chams.Fill.Color
                    Script.Utility.Drawings["TargetChams"].FillTransparency = Settings.Combat.Visuals.Chams.Fill.Transparency
                    Script.Utility.Drawings["TargetChams"].OutlineTransparency = Settings.Combat.Visuals.Chams.Outline.Transparency
                    Script.Utility.Drawings["TargetChams"].OutlineColor = Settings.Combat.Visuals.Chams.Outline.Color
                end
            end

            Script.Functions.AutoSelect = function()
                if (Settings.Combat.Enabled and Settings.Combat.AutoSelect.Enabled) and (tick() - Script.Locals.AutoSelectTick >= Settings.Combat.AutoSelect.Cooldown.Amount and Settings.Combat.AutoSelect.Cooldown.Enabled or true) then
                    local NewTarget = Script.Functions.GetClosestPlayer()
                    Script.Locals.Target = NewTarget or nil
                    Script.Locals.IsTargetting =  NewTarget and true or false
                    Script.Locals.AutoSelectTick = tick()
                end
            end

            Script.Functions.GunEvents = function()
                local CurrentGun = Script.Functions.GetGun(LocalPlayer)

                if CurrentGun and CurrentGun.IsGunEquipped and CurrentGun.Tool then
                    if CurrentGun.Tool ~= Script.Locals.Gun.PreviousGun then
                        Script.Locals.Gun.PreviousGun = CurrentGun.Tool
                        Script.Locals.Gun.PreviousAmmo = 999

                        --// Connections
                        for _, Connection in pairs(Script.Connections.GunConnections) do
                            Connection:Disconnect()
                        end
                        Script.Connections.GunConnections = {}
                    end

                    if not Script.Connections.GunConnections["GunActivated"] and Settings.Combat.Enabled and Settings.Combat.Silent and Script.Locals.AntiAimViewer.MouseRemoteFound then
                        Script.Connections.GunConnections["GunActivated"] = Script.Functions.Connection(CurrentGun.Tool.Activated, function()
                            if Script.Locals.IsTargetting and Script.Locals.Target then
                                if Settings.Combat.AntiAimViewer then
                                    local Arguments = Script.Locals.AntiAimViewer.MouseRemoteArgs

                                    Arguments[Script.Locals.AntiAimViewer.MouseRemotePositionIndex] = Script.Functions.GetPredictedPosition()
                                    Script.Locals.AntiAimViewer.MouseRemote:FireServer(unpack(Arguments))
                                end
                            end
                        end)
                    end


                    if not Script.Connections.GunConnections["GunAmmoChanged"] then
                        Script.Connections.GunConnections["GunAmmoChanged"] = Script.Functions.Connection(CurrentGun.Ammo:GetPropertyChangedSignal("Value") , function()
                            local NewAmmo = CurrentGun.Ammo.Value
                            if (NewAmmo < Script.Locals.Gun.PreviousAmmo or (game.GameId == 3985694250 and NewAmmo > Script.Locals.Gun.PreviousAmmo)) and Script.Locals.Gun.PreviousAmmo then

                                local ChildAdded
                                local ChildrenAdded = 0
                                ChildAdded = Script.Functions.Connection(Script.Locals.BulletPath[game.GameId].ChildAdded, function(Object)
                                    if Object.Name == "BULLET_RAYS" then
                                        ChildrenAdded += 1
                                        if (table.find(Script.Locals.Gun.Shotguns, CurrentGun.Tool.Name) and ChildrenAdded <= 5) or (ChildrenAdded == 1) then
                                            local GunBeam = Object:WaitForChild("GunBeam")
                                            local StartPos, EndPos = Object.Position, GunBeam.Attachment1.WorldPosition

                                            if Settings.Visuals.BulletTracers.Enabled then
                                                GunBeam:Destroy()
                                                Script.Functions.Beam(StartPos, EndPos)
                                            end

                                            if Settings.Visuals.BulletImpacts.Enabled then
                                                Script.Functions.Impact(EndPos)
                                            end

                                            if Settings.Visuals.OnHit.Enabled then
                                                local Player = Script.Functions.GetClosestPlayerDamage(EndPos, 20)
                                                if Player then
                                                    if Settings.Visuals.OnHit.Effect.Enabled then
                                                        Script.Functions.Effect(Player.Character.HumanoidRootPart)
                                                    end

                                                    if Settings.Visuals.OnHit.Sound.Enabled then
                                                        local Sound = string.format("hitsounds/%s", Settings.Visuals.OnHit.Sound.Value)
                                                        Script.Functions.PlaySound(getcustomasset(Sound), Settings.Visuals.OnHit.Sound.Volume)
                                                    end

                                                    if Settings.Visuals.OnHit.Chams.Enabled then
                                                        Script.Functions.Hitcham(Player, Settings.Visuals.OnHit.Chams.Color)
                                                    end
                                                end
                                            end
                                            ChildAdded:Disconnect()
                                        end
                                    else
                                        ChildAdded:Disconnect()
                                    end
                                end)
                            end
                            Script.Locals.Gun.PreviousAmmo = NewAmmo
                        end)
                    end
                end
            end

            Script.Functions.Air = function()
                if Settings.Combat.Enabled and Script.Locals.IsTargetting and Script.Locals.Target and Settings.Combat.Air.Enabled then
                    local Humanoid = Script.Locals.Target.Character.Humanoid

                    if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                        Script.Locals.JumpOffset = Settings.Combat.Air.JumpOffset.Offset
                    else
                        Script.Locals.JumpOffset = 0
                    end
                end
            end

            Script.Functions.UpdateHealth = function()
                if Settings.Visuals.OnHit.Enabled then
                    for _, Player in pairs(Players:GetPlayers()) do
                        if Player.Character and Player.Character.Humanoid then
                            Script.Locals.PlayerHealth[Player.Name] = Player.Character.Humanoid.Health
                        end
                    end
                end
            end

            Script.Functions.UpdateAtmosphere = function()
                Lighting.FogColor = Settings.Visuals.World.Enabled and Settings.Visuals.World.Fog.Enabled and Settings.Visuals.World.Fog.Color or Script.Locals.World.FogColor
                Lighting.FogStart = Settings.Visuals.World.Enabled and Settings.Visuals.World.Fog.Enabled and Settings.Visuals.World.Fog.Start or Script.Locals.World.FogStart
                Lighting.FogEnd = Settings.Visuals.World.Enabled and Settings.Visuals.World.Fog.Enabled and Settings.Visuals.World.Fog.End or Script.Locals.World.FogEnd
                Lighting.Ambient = Settings.Visuals.World.Enabled and Settings.Visuals.World.Ambient.Enabled and Settings.Visuals.World.Ambient.Color or Script.Locals.World.Ambient
                Lighting.Brightness = Settings.Visuals.World.Enabled and Settings.Visuals.World.Brightness.Enabled and Settings.Visuals.World.Brightness.Value or Script.Locals.World.Brightness
                Lighting.ClockTime = Settings.Visuals.World.Enabled and Settings.Visuals.World.ClockTime.Enabled and Settings.Visuals.World.ClockTime.Value or Script.Locals.World.ClockTime
                Lighting.ExposureCompensation = Settings.Visuals.World.Enabled and Settings.Visuals.World.WorldExposure.Enabled and Settings.Visuals.World.WorldExposure.Value or Script.Locals.World.ExposureCompensation
            end

            Script.Functions.VelocitySpoof = function()
                local ShowVisualizerDot = Settings.AntiAim.VelocitySpoofer.Enabled and Settings.AntiAim.VelocitySpoofer.Visualize.Enabled

                Script.Utility.Drawings["VelocityDot"].Visible = ShowVisualizerDot


                if Settings.AntiAim.VelocitySpoofer.Enabled then
                    --// Variables
                    local Type = Settings.AntiAim.VelocitySpoofer.Type
                    local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
                    local Velocity = HumanoidRootPart.Velocity

                    --// Main
                    if Type == "Underground" then
                        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity + Vector3.new(0, -Settings.AntiAim.VelocitySpoofer.Yaw, 0)
                    elseif Type == "Sky" then
                        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity + Vector3.new(0, Settings.AntiAim.VelocitySpoofer.Yaw, 0)
                    elseif Type == "Multiplier" then
                        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity + Vector3.new(Settings.AntiAim.VelocitySpoofer.Yaw, Settings.AntiAim.VelocitySpoofer.Pitch, Settings.AntiAim.VelocitySpoofer.Roll)
                    elseif Type == "Custom" then
                        HumanoidRootPart.Velocity = Vector3.new(Settings.AntiAim.VelocitySpoofer.Yaw, Settings.AntiAim.VelocitySpoofer.Pitch, Settings.AntiAim.VelocitySpoofer.Roll)
                    elseif Type == "Prediction Breaker" then
                        HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    end

                    if ShowVisualizerDot then
                        local ScreenPosition = Script.Functions.WorldToScreen(LocalPlayer.Character.HumanoidRootPart.Position + LocalPlayer.Character.HumanoidRootPart.Velocity * Settings.AntiAim.VelocitySpoofer.Visualize.Prediction)

                        Script.Utility.Drawings["VelocityDot"].Position = ScreenPosition.Position
                        Script.Utility.Drawings["VelocityDot"].Color = Settings.AntiAim.VelocitySpoofer.Visualize.Color
                    end

                    RunService.RenderStepped:Wait()
                    HumanoidRootPart.Velocity = Velocity
                end
            end

            Script.Functions.CSync = function()
                Script.Utility.Drawings["CFrameVisualize"].Parent = Settings.AntiAim.CSync.Visualize.Enabled and Settings.AntiAim.CSync.Enabled and Script.AzureIgnoreFolder or nil

                if Settings.AntiAim.CSync.Enabled then
                    local Type = Settings.AntiAim.CSync.Type
                    local FakeCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                    Script.Locals.SavedCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                    if Type == "Custom" then
                        FakeCFrame = FakeCFrame * CFrame.new(Settings.AntiAim.CSync.Custom.X, Settings.AntiAim.CSync.Custom.Y, Settings.AntiAim.CSync.Custom.Z)
                    elseif Type == "Target Strafe" and Script.Locals.IsTargetting and Script.Locals.Target and Settings.Combat.Enabled then
                        local CurrentTime = tick()
                        FakeCFrame = CFrame.new(Script.Locals.Target.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * CurrentTime * Settings.AntiAim.CSync.TargetStrafe.Speed % (2 * math.pi), 0) * CFrame.new(0, Settings.AntiAim.CSync.TargetStrafe.Height, Settings.AntiAim.CSync.TargetStrafe.Distance)
                    elseif Type == "Local Strafe" then
                        local CurrentTime = tick()
                        FakeCFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * CurrentTime * Settings.AntiAim.CSync.TargetStrafe.Speed % (2 * math.pi), 0) * CFrame.new(0, Settings.AntiAim.CSync.TargetStrafe.Height, Settings.AntiAim.CSync.TargetStrafe.Distance)
                    elseif Type == "Random" then
                        FakeCFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-Settings.AntiAim.CSync.RandomDistance, Settings.AntiAim.CSync.RandomDistance), math.random(-Settings.AntiAim.CSync.RandomDistance, Settings.AntiAim.CSync.RandomDistance), math.random(-Settings.AntiAim.CSync.RandomDistance, Settings.AntiAim.CSync.RandomDistance))) * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)))
                    elseif Type == "Random Target" and Script.Locals.IsTargetting and Script.Locals.Target and Settings.Combat.Enabled then
                        FakeCFrame = CFrame.new(Script.Locals.Target.Character.HumanoidRootPart.Position + Vector3.new(math.random(-Settings.AntiAim.CSync.RandomDistance, Settings.AntiAim.CSync.RandomDistance), math.random(-Settings.AntiAim.CSync.RandomDistance, Settings.AntiAim.CSync.RandomDistance), math.random(-Settings.AntiAim.CSync.RandomDistance, Settings.AntiAim.CSync.RandomDistance))) * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)))
                    end

                    Script.Utility.Drawings["CFrameVisualize"]:SetPrimaryPartCFrame(FakeCFrame)

                    for _, Part in pairs(Script.Utility.Drawings["CFrameVisualize"]:GetChildren()) do
                        Part.Color = Settings.AntiAim.CSync.Visualize.Color
                    end

                    LocalPlayer.Character.HumanoidRootPart.CFrame = FakeCFrame
                    RunService.RenderStepped:Wait()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = Script.Locals.SavedCFrame
                end
            end

            Script.Functions.Network = function()
                if Settings.AntiAim.Network.Enabled then
                    if (tick() - Script.Locals.NetworkPreviousTick) >= ((Settings.AntiAim.Network.Amount / math.pi) / 10000) or (Settings.AntiAim.Network.WalkingCheck and LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0) then
                        Script.Locals.NetworkShouldSleep = not Script.Locals.NetworkShouldSleep
                        Script.Locals.NetworkPreviousTick = tick()
                        sethiddenproperty(LocalPlayer.Character.HumanoidRootPart, "NetworkIsSleeping", Script.Locals.NetworkShouldSleep)
                    end
                end
            end

            Script.Functions.Speed = function()
                if Settings.Misc.Movement.Speed.Enabled then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + LocalPlayer.Character.Humanoid.MoveDirection * Settings.Misc.Movement.Speed.Amount
                end
            end

            Script.Functions.VelocityDesync = function()
                if Settings.AntiAim.VelocityDesync.Enabled then
                    local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
                    local Velocity = HumanoidRootPart.Velocity
                    local Amount = Settings.AntiAim.VelocityDesync.Range * 1000
                    HumanoidRootPart.Velocity = Vector3.new(math.random(-Amount, Amount), math.random(-Amount, Amount), math.random(-Amount, Amount))
                    RunService.RenderStepped:Wait()
                    HumanoidRootPart.Velocity = Velocity
                end
            end

            Script.Functions.FFlagDesync = function()
                if Settings.AntiAim.FFlagDesync.Enabled then
                    for FFlag, _ in pairs(Settings.AntiAim.FFlagDesync.FFlags) do
                        local Value = Settings.AntiAim.FFlagDesync.Amount
                        setfflag(FFlag, tostring(Value))

                        RunService.RenderStepped:Wait()
                        if Settings.AntiAim.FFlagDesync.SetNew then
                            setfflag(FFlag, Settings.AntiAim.FFlagDesync.SetNewAmount)
                        end
                    end
                end
            end


            --// Invisible Desync

            Script.Functions.NoSlowdown = function()
                if Settings.Misc.Exploits.NoSlowDown then
                    for _, Slowdown in pairs(LocalPlayer.Character.BodyEffects.Movement:GetChildren()) do
                        Slowdown:Destroy()
                    end
                end
            end

            --// Horrid code
            Script.Functions.UpdateCrosshair = function()
                if Settings.Visuals.Crosshair.Enabled then
                    local MouseX, MouseY
                    local RotationAngle = Script.Locals.RotationAngle
                    local RealSize = Settings.Visuals.Crosshair.Size * 2

                    if not MouseX or not MouseY then
                        MouseX, MouseY = UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y
                    end

                    local Gap = Settings.Visuals.Crosshair.Gap
                    if Settings.Visuals.Crosshair.Rotation.Enabled then
                        Script.Locals.RotationAngle = Script.Locals.RotationAngle + Settings.Visuals.Crosshair.Rotation.Speed
                    else
                        Script.Locals.RotationAngle = 0
                    end

                    Script.Utility.Drawings["CrosshairLeft"].Visible = true
                    Script.Utility.Drawings["CrosshairLeft"].Color = Settings.Visuals.Crosshair.Color
                    Script.Utility.Drawings["CrosshairLeft"].Thickness = 1
                    Script.Utility.Drawings["CrosshairLeft"].Transparency = 1
                    Script.Utility.Drawings["CrosshairLeft"].From = Vector2.new(MouseX + Gap, MouseY)
                    Script.Utility.Drawings["CrosshairLeft"].To = Vector2.new(MouseX + RealSize, MouseY)
                    if Settings.Visuals.Crosshair.Rotation.Enabled then
                        Script.Utility.Drawings["CrosshairLeft"].From = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairLeft"].From, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                        Script.Utility.Drawings["CrosshairLeft"].To = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairLeft"].To, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                    end

                    Script.Utility.Drawings["CrosshairRight"].Visible = true
                    Script.Utility.Drawings["CrosshairRight"].Color = Settings.Visuals.Crosshair.Color
                    Script.Utility.Drawings["CrosshairRight"].Thickness = 1
                    Script.Utility.Drawings["CrosshairRight"].Transparency = 1
                    Script.Utility.Drawings["CrosshairRight"].From = Vector2.new(MouseX - Gap, MouseY)
                    Script.Utility.Drawings["CrosshairRight"].To = Vector2.new(MouseX - RealSize, MouseY)
                    if Settings.Visuals.Crosshair.Rotation.Enabled then
                        Script.Utility.Drawings["CrosshairRight"].From = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairRight"].From, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                        Script.Utility.Drawings["CrosshairRight"].To = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairRight"].To, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                    end

                    Script.Utility.Drawings["CrosshairTop"].Visible = true
                    Script.Utility.Drawings["CrosshairTop"].Color = Settings.Visuals.Crosshair.Color
                    Script.Utility.Drawings["CrosshairTop"].Thickness = 1
                    Script.Utility.Drawings["CrosshairTop"].Transparency = 1
                    Script.Utility.Drawings["CrosshairTop"].From = Vector2.new(MouseX, MouseY + Gap)
                    Script.Utility.Drawings["CrosshairTop"].To = Vector2.new(MouseX, MouseY + RealSize)
                    if Settings.Visuals.Crosshair.Rotation.Enabled then
                        Script.Utility.Drawings["CrosshairTop"].From = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairTop"].From, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                        Script.Utility.Drawings["CrosshairTop"].To = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairTop"].To, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                    end

                    Script.Utility.Drawings["CrosshairBottom"].Visible = true
                    Script.Utility.Drawings["CrosshairBottom"].Color = Settings.Visuals.Crosshair.Color
                    Script.Utility.Drawings["CrosshairBottom"].Thickness = 1
                    Script.Utility.Drawings["CrosshairBottom"].Transparency = 1
                    Script.Utility.Drawings["CrosshairBottom"].From = Vector2.new(MouseX, MouseY - Gap)
                    Script.Utility.Drawings["CrosshairBottom"].To = Vector2.new(MouseX, MouseY - RealSize)
                    if Settings.Visuals.Crosshair.Rotation.Enabled then
                        Script.Utility.Drawings["CrosshairBottom"].From = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairBottom"].From, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                        Script.Utility.Drawings["CrosshairBottom"].To = Script.Functions.Rotate(Script.Utility.Drawings["CrosshairBottom"].To, Vector2.new(MouseX, MouseY), math.rad(RotationAngle))
                    end
                else
                    Script.Utility.Drawings["CrosshairBottom"].Visible = false
                    Script.Utility.Drawings["CrosshairTop"].Visible = false
                    Script.Utility.Drawings["CrosshairRight"].Visible = false
                    Script.Utility.Drawings["CrosshairLeft"].Visible = false
                end
            end

            Script.Functions.UpdateLookAt = function()
                if Settings.Combat.Enabled and Settings.Combat.LookAt and Script.Locals.IsTargetting and Script.Locals.Target then
                    LocalPlayer.Character.Humanoid.AutoRotate = false
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.Position, Vector3.new(Script.Locals.Target.Character.HumanoidRootPart.CFrame.X, LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, Script.Locals.Target.Character.HumanoidRootPart.CFrame.Z))
                else
                    LocalPlayer.Character.Humanoid.AutoRotate = true
                end
            end

            Script.Functions.UpdateSpectate = function()
                if Settings.Combat.Enabled and Settings.Combat.Spectate and Script.Locals.IsTargetting and Script.Locals.Target then
                    Camera.CameraSubject = Script.Locals.Target.Character.Humanoid
                else
                    Camera.CameraSubject = LocalPlayer.Character.Humanoid
                end
            end
        end

        --// Esp Function
        do

        end
    end

    --// Drawing objects
    do
        Script.Utility.Drawings["FieldOfViewVisualizer"] = Script.Functions.CreateDrawing("Circle", {
            Visible = Settings.Combat.Fov.Visualize.Enabled,
            Color = Settings.Combat.Fov.Visualize.Color,
            Radius = Settings.Combat.Fov.Radius
        })

        Script.Utility.Drawings["TargetTracer"] = Script.Functions.CreateDrawing("Line",{
            Visible = false,
            Color = Settings.Combat.Visuals.Tracer.Color,
            Thickness = Settings.Combat.Visuals.Tracer.Thickness
        })

        Script.Utility.Drawings["TargetDot"] = Script.Functions.CreateDrawing("Circle", {
            Visible = false,
            Color = Settings.Combat.Visuals.Dot.Color,
            Radius = Settings.Combat.Visuals.Dot.Size
        })

        Script.Utility.Drawings["VelocityDot"] = Script.Functions.CreateDrawing("Circle", {
            Visible = false,
            Color = Settings.AntiAim.VelocitySpoofer.Visualize.Color,
            Radius = 6,
            Filled = true
        })

        Script.Utility.Drawings["TargetChams"] = Script.Functions.Create("Highlight", {
            Parent = nil,
            FillColor = Settings.Combat.Visuals.Chams.Fill.Color,
            FillTransparency = Settings.Combat.Visuals.Chams.Fill.Transparency,
            OutlineColor = Settings.Combat.Visuals.Chams.Fill.Color,
            OutlineTransparency = Settings.Combat.Visuals.Chams.Outline.Transparency
        })

        Script.Utility.Drawings["CrosshairTop"] = Script.Functions.CreateDrawing("Line", {
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = 1,
            Visible = false,
            ZIndex = 10000
        })

        Script.Utility.Drawings["CrosshairBottom"] = Script.Functions.CreateDrawing("Line", {
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = 1,
            Visible = false,
            ZIndex = 10000
        })

        Script.Utility.Drawings["CrosshairLeft"] = Script.Functions.CreateDrawing("Line", {
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = 1,
            Visible = false,
            ZIndex = 10000
        })

        Script.Utility.Drawings["CrosshairRight"] = Script.Functions.CreateDrawing("Line", {
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = 1,
            Visible = false,
            ZIndex = 10000
        })


        Script.Utility.Drawings["CFrameVisualize"] = game:GetObjects("rbxassetid://9474737816")[1]; Script.Utility.Drawings["CFrameVisualize"].Head.Face:Destroy(); for _, v in pairs(Script.Utility.Drawings["CFrameVisualize"]:GetChildren()) do v.Transparency = v.Name == "HumanoidRootPart" and 1 or 0.70; v.Material = "Neon"; v.Color = Settings.AntiAim.CSync.Visualize.Color; v.CanCollide = false; v.Anchored = false end
    end


    --// Hitsounds
    do
        --// Hitsounds
        Hitsounds = {
            ["ginos bubbles.wav"] = "https://raw.githubusercontent.com/linemaster2/hitsounds/main/hitsound(3).wav",
            ["bell.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/bell.wav?raw=true",
            ["bepis.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/bepis.wav?raw=true",
            ["bubble.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/bubble.wav?raw=true",
            ["cock.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/cock.wav?raw=true",
            ["cod.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/cod.wav?raw=true",
            ["fatality.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/fatality.wav?raw=true",
            ["phonk.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/phonk.wav?raw=true",
            ["sparkle.wav"] = "https://github.com/nyulachan/nyula/blob/main/Sounds/sparkle.wav?raw=true",
            ["rust headshot.wav"] = "https://raw.githubusercontent.com/linemaster2/hitsounds/main/eaolwpzhgsba.wav"
        }

        if not isfolder("hitsounds") then
            makefolder("hitsounds")
        end

        for Name, Url in pairs(Hitsounds) do
            local Path = "hitsounds" .. "/" .. Name
            if not isfile(Path) then
                writefile(Path, game:HttpGet(Url))
            end
        end
    end

    --// Hit Effects
    do
        --// Nova
        do
            local Part = Instance.new("Part")
            Part.Parent = ReplicatedStorage

            local Attachment = Instance.new("Attachment")
            Attachment.Name = "Attachment"
            Attachment.Parent = Part

            Script.Locals.HitEffect = Attachment

            local ParticleEmitter = Instance.new("ParticleEmitter")
            ParticleEmitter.Name = "ParticleEmitter"
            ParticleEmitter.Acceleration = Vector3.new(0, 0, 1)
            ParticleEmitter.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.495, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
            })
            ParticleEmitter.Lifetime = NumberRange.new(0.5, 0.5)
            ParticleEmitter.LightEmission = 1
            ParticleEmitter.LockedToPart = true
            ParticleEmitter.Rate = 1
            ParticleEmitter.Rotation = NumberRange.new(0, 360)
            ParticleEmitter.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(1, 10),
                NumberSequenceKeypoint.new(1, 1),
            })
            ParticleEmitter.Speed = NumberRange.new(0, 0)
            ParticleEmitter.Texture = "rbxassetid://1084991215"
            ParticleEmitter.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0, 0.1),
                NumberSequenceKeypoint.new(0.534, 0.25),
                NumberSequenceKeypoint.new(1, 0.5),
                NumberSequenceKeypoint.new(1, 0),
            })
            ParticleEmitter.ZOffset = 1
            ParticleEmitter.Parent = Attachment
            local ParticleEmitter1 = Instance.new("ParticleEmitter")
            ParticleEmitter1.Name = "ParticleEmitter"
            ParticleEmitter1.Acceleration = Vector3.new(0, 1, -0.001)
            ParticleEmitter1.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.495, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
            })
            ParticleEmitter1.Lifetime = NumberRange.new(0.5, 0.5)
            ParticleEmitter1.LightEmission = 1
            ParticleEmitter1.LockedToPart = true
            ParticleEmitter1.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
            ParticleEmitter1.Rate = 1
            ParticleEmitter1.Rotation = NumberRange.new(0, 360)
            ParticleEmitter1.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(1, 10),
                NumberSequenceKeypoint.new(1, 1),
            })
            ParticleEmitter1.Speed = NumberRange.new(0, 0)
            ParticleEmitter1.Texture = "rbxassetid://1084991215"
            ParticleEmitter1.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0, 0.1),
                NumberSequenceKeypoint.new(0.534, 0.25),
                NumberSequenceKeypoint.new(1, 0.5),
                NumberSequenceKeypoint.new(1, 0),
            })
            ParticleEmitter1.ZOffset = 1
            ParticleEmitter1.Parent = Attachment
        end
    end

    --// Connections
    do
        --// Combat Connections
        do
            Script.Functions.Connection(RunService.Heartbeat, function()
                Script.Functions.MouseAim()

                Script.Functions.Resolve()

                Script.Functions.Air()

                Script.Functions.UpdateLookAt()
            end)

            Script.Functions.Connection(RunService.RenderStepped, function()
                Script.Functions.UpdateFieldOfView()

                Script.Functions.UpdateTargetVisuals()

                Script.Functions.AutoSelect()

                Script.Functions.UpdateSpectate()
            end)
        end

        --// Visual Connections
        do
            Script.Functions.Connection(RunService.RenderStepped, function()
                Script.Functions.GunEvents()

                Script.Functions.UpdateHealth()

                Script.Functions.UpdateAtmosphere()

                Script.Functions.UpdateCrosshair()
            end)
        end

        --// Anti Aim Connection
        do
            Script.Functions.Connection(RunService.Heartbeat, function()
                Script.Functions.VelocitySpoof()

                Script.Functions.CSync()

                Script.Functions.Network()

                Script.Functions.VelocityDesync()

                Script.Functions.FFlagDesync()
            end)
        end

        --// Movement Connections
        do
            Script.Functions.Connection(RunService.Heartbeat, function()
                Script.Functions.Speed()

                Script.Functions.NoSlowdown()
            end)
        end
    end

    --// Hooks
    do
        local __namecall
        local __newindex
        local __index

        __index = hookmetamethod(game, "__index", LPH_NO_VIRTUALIZE(function(Self, Index)
            if not checkcaller() and Settings.AntiAim.CSync.Enabled and Script.Locals.SavedCFrame and Index == "CFrame" and Self == LocalPlayer.Character.HumanoidRootPart then
                return Script.Locals.SavedCFrame
            end
            return __index(Self, Index)
        end))

        __namecall = hookmetamethod(game, "__namecall", LPH_NO_VIRTUALIZE(function(Self, ...)
            local Arguments = {...}
            local Method = tostring(getnamecallmethod())

            if not checkcaller() and Method == "FireServer" then
                for _, Argument in pairs(Arguments) do
                    if typeof(Argument) == "Vector3" then
                        Script.Locals.AntiAimViewer.MouseRemote = Self
                        Script.Locals.AntiAimViewer.MouseRemoteFound = true
                        Script.Locals.AntiAimViewer.MouseRemoteArgs = Arguments
                        Script.Locals.AntiAimViewer.MouseRemotePositionIndex = _

                        if Settings.Combat.Enabled and Settings.Combat.Silent and not Settings.Combat.AntiAimViewer and Script.Locals.IsTargetting and Script.Locals.Target then
                            Arguments[_] =  Script.Functions.GetPredictedPosition()
                        end

                        return __namecall(Self, unpack(Arguments))
                    end
                end
            end
            return __namecall(Self, ...)
        end))

        __newindex = hookmetamethod(game, "__newindex", LPH_NO_VIRTUALIZE(function(Self, Property, Value)
            local CallingScript = getcallingscript()


            --// Atmosphere caching
            if not checkcaller() and Self == Lighting and Script.Locals.World[Property] ~= Value then
                Script.Locals.World[Property] = Value
            end

            --// No Recoil
            if CallingScript.Name == "Framework" and Self == Camera and Property == "CFrame" and Settings.Misc.Exploits.Enabled and Settings.Misc.Exploits.NoRecoil then
                return
            end

            --// No Jump Cooldown
            if CallingScript.Name == "Framework" and Self == LocalPlayer.Character.Humanoid and Property == "JumpPower" and Settings.Misc.Exploits.Enabled and Settings.Misc.Exploits.NoJumpCooldown then
                return
            end

            return __newindex(Self, Property, Value)
        end))
    end

    do
        --// UI
        local Library = loadstring(game:HttpGet("https://rentry.co/oytemtig/raw"))()
        local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()
        local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/caIIed/Linoria-Rewrite/main/Theme%20Manager.lua"))()

        --// Main Window
        local Window = Library:CreateWindow({
            Title = "Ratz V99 NiggersK -- farzad, Credits : LineMaster",
            Center = true,
            AutoShow = true,
            TabPadding = 8,
            MenuFadeTime = 0.2
        })

        local Tabs = {
            Combat = Window:AddTab("Combat"),
            Visuals = Window:AddTab("Visuals"),
            AntiAim = Window:AddTab("Anti Aim"),
            Misc = Window:AddTab("Misc"),
            Settings = Window:AddTab("Settings")
        }

        local Sections = {
            Combat = {
                Main = Tabs.Combat:AddLeftGroupbox("Main"),
                Checks = Tabs.Combat:AddRightGroupbox("Checks"),
                AutoSelect = Tabs.Combat:AddRightGroupbox("Auto Select"),
                Visuals = Tabs.Combat:AddRightGroupbox("Visuals"),
                Smoothing = Tabs.Combat:AddLeftGroupbox("Smoothing"),
                Resolver = Tabs.Combat:AddLeftGroupbox("Resolver"),
                FieldOfView = Tabs.Combat:AddLeftGroupbox("Field Of View"),
                Air = Tabs.Combat:AddRightGroupbox("Air")
            },
            Visuals = {
                --// Esp = Tabs.Visuals:AddLeftGroupbox("Esp"),
                Atmosphere = Tabs.Visuals:AddLeftGroupbox("Atmosphere"),
                Crosshair = Tabs.Visuals:AddLeftGroupbox("Crosshair"),
                BulletTracers = Tabs.Visuals:AddRightGroupbox("Bullet Tracers"),
                BulletImpacts = Tabs.Visuals:AddRightGroupbox("Bullet Impacts"),
                OnHit = Tabs.Visuals:AddRightGroupbox("On Hit")
            },
            AntiAim = {
                CSync = Tabs.AntiAim:AddLeftGroupbox("C-Sync"),
                Network = Tabs.AntiAim:AddLeftGroupbox("Network"),
                VelocitySpoofer = Tabs.AntiAim:AddRightGroupbox("Velocity Spoofer"),
                VelocityDesync = Tabs.AntiAim:AddRightGroupbox("Velocity Desync"),
                FFlag = Tabs.AntiAim:AddRightGroupbox("FFlag Desync"),
            },
            Misc = {
                Speed = Tabs.Misc:AddLeftGroupbox("CFrame Speed"),
                Exploits = Tabs.Misc:AddRightGroupbox("Exploits")
            }
        }

        --// Combat Tab
        do
            --// Main
            do
                Sections.Combat.Main:AddToggle("CombatMainEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                }):AddKeyPicker("CombatMainToggle", {
                    Default = "Q",
                    SyncToggleState = false,
                    Mode = "Toggle",
                    Text = "Targetting",
                    NoUI = false,
                })

                Toggles.CombatMainEnabled:OnChanged(function()
                    Settings.Combat.Enabled = Toggles.CombatMainEnabled.Value
                end)

                Options.CombatMainToggle:OnClick(function()
                    if Settings.Combat.Enabled then
                        Script.Locals.IsTargetting = not Script.Locals.IsTargetting

                        local NewTarget = Script.Functions.GetClosestPlayer()
                        Script.Locals.Target = Script.Locals.IsTargetting and NewTarget.Character and NewTarget or nil

                        if Settings.Combat.Alerts then
                            Library:Notify(string.format("Targetting: %s", Script.Locals.Target.Character.Humanoid.DisplayName))
                        end
                    end
                end)

                Sections.Combat.Main:AddToggle("CombatSilentEnabled", {
                    Text = "Silent",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatSilentEnabled:OnChanged(function()
                    Settings.Combat.Silent = Toggles.CombatSilentEnabled.Value
                end)

                Sections.Combat.Main:AddToggle("CombatMouseEnabled", {
                    Text = "Mouse",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatMouseEnabled:OnChanged(function()
                    Settings.Combat.Mouse = Toggles.CombatMouseEnabled.Value
                end)

                Sections.Combat.Main:AddToggle("CombatAlertsEnabled", {
                    Text = "Alerts",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatAlertsEnabled:OnChanged(function()
                    Settings.Combat.Alerts = Toggles.CombatAlertsEnabled.Value
                end)

                Sections.Combat.Main:AddToggle("CombatLookAtEnabled", {
                    Text = "Look At",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatLookAtEnabled:OnChanged(function()
                    Settings.Combat.LookAt = Toggles.CombatLookAtEnabled.Value
                end)

                Sections.Combat.Main:AddToggle("CombatSpectatEnabled", {
                    Text = "Spectate",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatSpectatEnabled:OnChanged(function()
                    Settings.Combat.Spectate = Toggles.CombatSpectatEnabled.Value
                end)

                Sections.Combat.Main:AddToggle("CombatAntiAimViewerEnabled", {
                    Text = "Anti AimViewer",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatAntiAimViewerEnabled:OnChanged(function()
                    Settings.Combat.AntiAimViewer = Toggles.CombatAntiAimViewerEnabled.Value
                end)

                Sections.Combat.Main:AddDropdown("CombatHitPartDropdown", {
                    Values = {"Head","HumanoidRootPart","LeftHand","RightHand","LeftLowerArm","RightLowerArm","LeftUpperArm","RightUpperArm","LeftFoot","LeftLowerLeg","UpperTorso","LeftUpperLeg","RightFoot","RightLowerLeg","LowerTorso","RightUpperLeg"},
                    Default = 2,
                    Multi = false,

                    Text = "Aim Part",
                    Tooltip = nil
                })

                Options.CombatHitPartDropdown:OnChanged(function()
                    Settings.Combat.AimPart = Options.CombatHitPartDropdown.Value
                end)

                Sections.Combat.Main:AddInput("CombatVerticalPrediction", {
                    Default = nil,
                    Numeric = false,
                    Finished = false,

                    Text = "Vertical Prediction",
                    Tooltip = nil,

                    Placeholder = "Vertical Prediction Amount"
                })

                Options.CombatVerticalPrediction:OnChanged(function()
                    Settings.Combat.Prediction.Vertical = tonumber(Options.CombatVerticalPrediction.Value)
                end)

                Sections.Combat.Main:AddInput("CombatHorizontalPrediction", {
                    Default = nil,
                    Numeric = false,
                    Finished = false,

                    Text = "Horizontal Prediction",
                    Tooltip = nil,

                    Placeholder = "Horizontal Prediction Amount"
                })


                Options.CombatHorizontalPrediction:OnChanged(function()
                    Settings.Combat.Prediction.Horizontal = tonumber(Options.CombatHorizontalPrediction.Value)
                end)
            end

            --// Checks
            do
                Sections.Combat.Checks:AddToggle("CombatChecksEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatChecksEnabled:OnChanged(function()
                    Settings.Combat.Checks.Enabled = Toggles.CombatChecksEnabled.Value
                end)

                Sections.Combat.Checks:AddToggle("CombatChecksKnockedEnabled", {
                    Text = "Knocked",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatChecksKnockedEnabled:OnChanged(function()
                    Settings.Combat.Checks.Knocked = Toggles.CombatChecksKnockedEnabled.Value
                end)

                Sections.Combat.Checks:AddToggle("CombatChecksGrabbedEnabled", {
                    Text = "Grabbed",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatChecksGrabbedEnabled:OnChanged(function()
                    Settings.Combat.Checks.Grabbed = Toggles.CombatChecksGrabbedEnabled.Value
                end)

                Sections.Combat.Checks:AddToggle("CombatChecksCrewEnabled", {
                    Text = "Crew",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatChecksCrewEnabled:OnChanged(function()
                    Settings.Combat.Checks.Crew = Toggles.CombatChecksCrewEnabled.Value
                end)

                Sections.Combat.Checks:AddToggle("CombatChecksVehicleEnabled", {
                    Text = "Vehicle",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatChecksVehicleEnabled:OnChanged(function()
                    Settings.Combat.Checks.Vehicle = Toggles.CombatChecksVehicleEnabled.Value
                end)

                Sections.Combat.Checks:AddToggle("CombatChecksWallEnabled", {
                    Text = "Wall",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatChecksWallEnabled:OnChanged(function()
                    Settings.Combat.Checks.Wall = Toggles.CombatChecksWallEnabled.Value
                end)
            end

            --// Auto Select
            do
                Sections.Combat.AutoSelect:AddToggle("CombatAutoSelectEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatAutoSelectEnabled:OnChanged(function()
                    Settings.Combat.AutoSelect.Enabled = Toggles.CombatAutoSelectEnabled.Value
                end)

                Sections.Combat.AutoSelect:AddToggle("CombatAutoSelectCooldownEnabled", {
                    Text = "Cooldown",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatAutoSelectCooldownEnabled:OnChanged(function()
                    Settings.Combat.AutoSelect.Cooldown.Enabled = Toggles.CombatAutoSelectCooldownEnabled.Value
                end)

                Sections.Combat.AutoSelect:AddSlider("CombatAutoSelectCooldownAmount", {
                    Text = "Cooldown Amount (MS)",
                    Default = 0.1,
                    Min = 0,
                    Max = 1,
                    Rounding = 3,
                    Compact = false
                })

                Options.CombatAutoSelectCooldownAmount:OnChanged(function()
                    Settings.Combat.AutoSelect.Cooldown.Amount = Options.CombatAutoSelectCooldownAmount.Value
                end)
            end

            --// Smoothing
            do
                Sections.Combat.Smoothing:AddSlider("CombatSmoothingVertical", {
                    Text = "Vertical Smoothing",
                    Default = 10,
                    Min = 1,
                    Max = 50,
                    Rounding = 2,
                    Compact = false
                })

                Options.CombatSmoothingVertical:OnChanged(function()
                    Settings.Combat.Smoothing.Vertical = Options.CombatSmoothingVertical.Value
                end)

                Sections.Combat.Smoothing:AddSlider("CombatSmoothingHorizontal", {
                    Text = "Horizontal Smoothing",
                    Default = 10,
                    Min = 1,
                    Max = 50,
                    Rounding = 2,
                    Compact = false
                })

                Options.CombatSmoothingHorizontal:OnChanged(function()
                    Settings.Combat.Smoothing.Horizontal = Options.CombatSmoothingHorizontal.Value
                end)
            end

            --// Resolver
            do
                Sections.Combat.Resolver:AddToggle("CombatResolverEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatResolverEnabled:OnChanged(function()
                    Settings.Combat.Resolver.Enabled = Toggles.CombatResolverEnabled.Value
                end)

                Sections.Combat.Resolver:AddSlider("CombatResolverRefreshRate", {
                    Text = "Refresh Rate",
                    Default = 200,
                    Min = 1,
                    Max = 200,
                    Rounding = 1,
                    Compact = false
                })

                Options.CombatResolverRefreshRate:OnChanged(function()
                    Settings.Combat.Resolver.RefreshRate = Options.CombatResolverRefreshRate.Value
                end)
            end

            --// Field Of View
            do
                Sections.Combat.FieldOfView:AddToggle("CombatFovEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatFovEnabled:OnChanged(function()
                    Settings.Combat.Fov.Enabled = Toggles.CombatFovEnabled.Value
                end)

                Sections.Combat.FieldOfView:AddToggle("CombatFovVisualizeEnabled", {
                    Text = "Visualize",
                    Default = false,
                    Tooltip = nil
                }):AddColorPicker("CombatFovVisualizeColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Fov Visualize Color",
                    Transparency = nil
                })

                Toggles.CombatFovVisualizeEnabled:OnChanged(function()
                    Settings.Combat.Fov.Visualize.Enabled = Toggles.CombatFovVisualizeEnabled.Value
                end)

                Options.CombatFovVisualizeColor:OnChanged(function()
                    Settings.Combat.Fov.Visualize.Color = Options.CombatFovVisualizeColor.Value
                end)

                Sections.Combat.FieldOfView:AddSlider("CombatFieldOfViewRadius", {
                    Text = "Radius",
                    Default = 80,
                    Min = 1,
                    Max = 800,
                    Rounding = 2,
                    Compact = false
                })

                Options.CombatFieldOfViewRadius:OnChanged(function()
                    Settings.Combat.Fov.Radius = Options.CombatFieldOfViewRadius.Value
                end)
            end

            --// Visuals
            do
                Sections.Combat.Visuals:AddToggle("CombatVisualsEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatVisualsEnabled:OnChanged(function()
                    Settings.Combat.Visuals.Enabled = Toggles.CombatVisualsEnabled.Value
                end)

                Sections.Combat.Visuals:AddToggle("CombatVisualsTracerEnabled", {
                    Text = "Tracer",
                    Default = false,
                    Tooltip = nil
                }):AddColorPicker("CombatVisualsTracerColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Tracer Color",
                    Transparency = nil
                })

                Toggles.CombatVisualsTracerEnabled:OnChanged(function()
                    Settings.Combat.Visuals.Tracer.Enabled = Toggles.CombatVisualsTracerEnabled.Value
                end)

                Options.CombatVisualsTracerColor:OnChanged(function()
                    Settings.Combat.Visuals.Tracer.Color = Options.CombatVisualsTracerColor.Value
                end)

                Sections.Combat.Visuals:AddSlider("CombatVisualsTracerThickness", {
                    Text = "Thickness",
                    Default = 2,
                    Min = 1,
                    Max = 10,
                    Rounding = 2,
                    Compact = false
                })

                Options.CombatVisualsTracerThickness:OnChanged(function()
                    Settings.Combat.Visuals.Tracer.Thickness = Options.CombatVisualsTracerThickness.Value
                end)

                Sections.Combat.Visuals:AddToggle("CombatVisualsDotEnabled", {
                    Text = "Dot",
                    Default = false,
                    Tooltip = nil
                }):AddColorPicker("CombatVisualsDotColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Dot Color",
                    Transparency = nil
                })

                Toggles.CombatVisualsDotEnabled:OnChanged(function()
                    Settings.Combat.Visuals.Dot.Enabled = Toggles.CombatVisualsDotEnabled.Value
                end)

                Options.CombatVisualsDotColor:OnChanged(function()
                    Settings.Combat.Visuals.Dot.Color = Options.CombatVisualsDotColor.Value
                end)

                Sections.Combat.Visuals:AddToggle("CombatVisualsDotFilled", {
                    Text = "Dot Filled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatVisualsDotFilled:OnChanged(function()
                    Settings.Combat.Visuals.Dot.Filled = Toggles.CombatVisualsDotFilled.Value
                end)

                Sections.Combat.Visuals:AddSlider("CombatVisualsDotSize", {
                    Text = "Size",
                    Default = 6,
                    Min = 1,
                    Max = 20,
                    Rounding = 2,
                    Compact = false
                })

                Options.CombatVisualsDotSize:OnChanged(function()
                    Settings.Combat.Visuals.Dot.Size = Options.CombatVisualsDotSize.Value
                end)

                local TargetChamsToggle = Sections.Combat.Visuals:AddToggle("CombatVisualsChamsEnabled", {
                    Text = "Chams",
                    Default = false,
                    Tooltip = nil
                })

                TargetChamsToggle:AddColorPicker("CombatVisualsChamsFillColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Fill Color",
                    Transparency = 0.5
                })

                TargetChamsToggle:AddColorPicker("CombatVisualsChamsOutlineColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Outline Color",
                    Transparency = 0.5
                })

                Toggles.CombatVisualsChamsEnabled:OnChanged(function()
                    Settings.Combat.Visuals.Chams.Enabled = Toggles.CombatVisualsChamsEnabled.Value
                end)

                Options.CombatVisualsChamsFillColor:OnChanged(function()
                    Settings.Combat.Visuals.Chams.Fill.Color = Options.CombatVisualsChamsFillColor.Value
                    Settings.Combat.Visuals.Chams.Fill.Transparency = Options.CombatVisualsChamsFillColor.Transparency
                end)

                Options.CombatVisualsChamsOutlineColor:OnChanged(function()
                    Settings.Combat.Visuals.Chams.Outline.Color = Options.CombatVisualsChamsOutlineColor.Value
                    Settings.Combat.Visuals.Chams.Outline.Transparency = Options.CombatVisualsChamsOutlineColor.Transparency
                end)
            end

            --// Air
            do
                Sections.Combat.Air:AddToggle("CombatAirEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatAirEnabled:OnChanged(function()
                    Settings.Combat.Air.Enabled = Toggles.CombatAirEnabled.Value
                end)

                Sections.Combat.Air:AddToggle("CombatJumpOffsetEnabled", {
                    Text = "Jump Offset",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.CombatJumpOffsetEnabled:OnChanged(function()
                    Settings.Combat.Air.JumpOffset.Enabled = Toggles.CombatJumpOffsetEnabled.Value
                end)

                Sections.Combat.Air:AddSlider("CombatJumpOffSet", {
                    Text = "Offset",
                    Default = 0.09,
                    Min = -10,
                    Max = 10,
                    Rounding = 3,
                    Compact = false
                })

                Options.CombatJumpOffSet:OnChanged(function()
                    Settings.Combat.Air.JumpOffset.Offset = Options.CombatJumpOffSet.Value
                end)
            end
        end

        --// Visuals tab
        do
 
            --// Bullet Tracers
            do

                local BulletTracersToggle = Sections.Visuals.BulletTracers:AddToggle("VisualsBulletTracersEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                BulletTracersToggle:AddColorPicker("VisualsBulletTracersColor1", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Bullet Tracers Color Gradient 1",
                    Transparency = nil
                })

                BulletTracersToggle:AddColorPicker("VisualsBulletTracersColor2", {
                    Default = Color3.new(0, 0, 0),
                    Title = "Bullet Tracers Color Gradient 2",
                    Transparency = nil
                })

                Sections.Visuals.BulletTracers:AddToggle("VisualsBulletTracersFadeEnabled", {
                    Text = "Fade",
                    Default = false,
                    Tooltip = nil
                })

                Toggles.VisualsBulletTracersEnabled:OnChanged(function()
                    Settings.Visuals.BulletTracers.Enabled = Toggles.VisualsBulletTracersEnabled.Value
                end)

                Toggles.VisualsBulletTracersFadeEnabled:OnChanged(function()
                    Settings.Visuals.BulletTracers.Fade.Enabled = Toggles.VisualsBulletTracersFadeEnabled.Value
                end)

                Options.VisualsBulletTracersColor1:OnChanged(function()
                    Settings.Visuals.BulletTracers.Color.Gradient1 = Options.VisualsBulletTracersColor1.Value
                end)

                Options.VisualsBulletTracersColor2:OnChanged(function()
                    Settings.Visuals.BulletTracers.Color.Gradient2 = Options.VisualsBulletTracersColor2.Value
                end)

                Sections.Visuals.BulletTracers:AddSlider("VisualsBulletTracersDuration", {
                    Text = "Duration",
                    Default = 1,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 1,
                    Compact = false
                })

                Sections.Visuals.BulletTracers:AddSlider("VisualsBulletTracersFadeDuration", {
                    Text = "Fade Duration",
                    Default = 0.5,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 1,
                    Compact = false
                })


                Options.VisualsBulletTracersDuration:OnChanged(function()
                    Settings.Visuals.BulletTracers.Duration = Options.VisualsBulletTracersDuration.Value
                end)

                Options.VisualsBulletTracersFadeDuration:OnChanged(function()
                    Settings.Visuals.BulletTracers.Fade.Duration = Options.VisualsBulletTracersFadeDuration.Value
                end)
            end

            --// Bullet Impacts
            do
                Sections.Visuals.BulletImpacts:AddToggle("VisualsBulletImpactsEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                }):AddColorPicker("VisualsBulletImpactsColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Bullet Impact Color",
                    Transparency = nil
                })

                Sections.Visuals.BulletImpacts:AddToggle("VisualsBulletImpactsFadeEnabled", {
                    Text = "Fade",
                    Default = false,
                    Tooltip = nil
                })

                Sections.Visuals.BulletImpacts:AddDropdown("VisualsBulletImpactsMaterial", {
                    Values = {"SmoothPlastic", "ForceField", "Neon"},
                    Default = 1,
                    Multi = false,

                    Text = "Material",
                    Tooltip = nil
                })

                Options.VisualsBulletImpactsMaterial:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Material = Options.VisualsBulletImpactsMaterial.Value
                end)

                Sections.Visuals.BulletImpacts:AddSlider("VisualsBulletImpactsSize", {
                    Text = "Size",
                    Default = 1,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 2,
                    Compact = false
                })

                Sections.Visuals.BulletImpacts:AddSlider("VisualsBulletImpactsDuration", {
                    Text = "Duration",
                    Default = 1,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 1,
                    Compact = false
                })

                Sections.Visuals.BulletImpacts:AddSlider("VisualsBulletImpactsFadeDuration", {
                    Text = "Fade Duration",
                    Default = 0.5,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 1,
                    Compact = false
                })


                Options.VisualsBulletImpactsDuration:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Duration = Options.VisualsBulletImpactsDuration.Value
                end)

                Options.VisualsBulletImpactsSize:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Size = Options.VisualsBulletImpactsSize.Value
                end)

                Options.VisualsBulletImpactsFadeDuration:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Fade.Duration = Options.VisualsBulletImpactsFadeDuration.Value
                end)

                Toggles.VisualsBulletImpactsEnabled:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Enabled = Toggles.VisualsBulletImpactsEnabled.Value
                end)

                Toggles.VisualsBulletImpactsFadeEnabled:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Fade.Enabled = Toggles.VisualsBulletImpactsFadeEnabled.Value
                end)

                Options.VisualsBulletImpactsColor:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Color = Options.VisualsBulletImpactsColor.Value
                end)
            end

            --// On Hit
            do
                Sections.Visuals.OnHit:AddToggle("VisualsOnHitEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil
                })

                Sections.Visuals.OnHit:AddToggle("VisualsOnHitEffectEnabled", {
                    Text = "Effect",
                    Default = false,
                    Tooltip = nil
                }):AddColorPicker("VisualsOnHitEffectColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Bullet Impact Color",
                    Transparency = nil
                })

                Sections.Visuals.OnHit:AddToggle("VisualsOnHiSoundEnabled", {
                    Text = "Sound",
                    Default = false,
                    Tooltip = nil
                })

                Sections.Visuals.OnHit:AddSlider("VisualsOnHitSoundVolume", {
                    Text = "Sound Volume",
                    Default = 5,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 2,
                    Compact = false
                })

                local Sounds = {}

                for Sound, _ in pairs(Hitsounds) do
                    table.insert(Sounds, Sound)
                end

                Sections.Visuals.OnHit:AddDropdown("VisualsOnHitSound", {
                    Values = Sounds,
                    Default = 1,
                    Multi = false,
                    Text = "Sound To Play",
                    Tooltip = nil
                })


                Sections.Visuals.OnHit:AddToggle("VisualsOnHitChamsEnabled", {
                    Text = "Chams",
                    Default = false,
                    Tooltip = nil
                }):AddColorPicker("VisualsOnHitChamsColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Hit Chams Color",
                    Transparency = nil
                })

                Sections.Visuals.OnHit:AddSlider("VisualsOnHitChamsDuration", {
                    Text = "Duration",
                    Default = 1,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 2,
                    Compact = false
                })

                Sections.Visuals.OnHit:AddDropdown("VisualsOnHitChamsMaterial", {
                    Values = {"ForceField", "Neon"},
                    Default = 1,
                    Multi = false,
                    Text = "Material",
                    Tooltip = nil
                })

                Options.VisualsOnHitChamsDuration:OnChanged(function()
                    Settings.Visuals.OnHit.Chams.Duration = Options.VisualsOnHitChamsDuration.Value
                end)

                Options.VisualsOnHitChamsMaterial:OnChanged(function()
                    Settings.Visuals.OnHit.Chams.Material = Options.VisualsOnHitChamsMaterial.Value
                end)

                Options.VisualsBulletImpactsMaterial:OnChanged(function()
                    Settings.Visuals.BulletImpacts.Material = Options.VisualsBulletImpactsMaterial.Value
                end)

                Toggles.VisualsOnHitEnabled:OnChanged(function()
                    Settings.Visuals.OnHit.Enabled = Toggles.VisualsOnHitEnabled.Value
                end)

                Toggles.VisualsOnHitChamsEnabled:OnChanged(function()
                    Settings.Visuals.OnHit.Chams.Enabled = Toggles.VisualsOnHitChamsEnabled.Value
                end)

                Options.VisualsOnHitChamsColor:OnChanged(function()
                    Settings.Visuals.OnHit.Chams.Color = Options.VisualsOnHitChamsColor.Value
                end)

                Toggles.VisualsOnHitEffectEnabled:OnChanged(function()
                    Settings.Visuals.OnHit.Effect.Enabled = Toggles.VisualsOnHitEffectEnabled.Value
                end)

                Options.VisualsOnHitEffectColor:OnChanged(function()
                    Settings.Visuals.OnHit.Effect.Color = Options.VisualsOnHitEffectColor.Value
                end)

                Toggles.VisualsOnHiSoundEnabled:OnChanged(function()
                    Settings.Visuals.OnHit.Sound.Enabled = Toggles.VisualsOnHiSoundEnabled.Value
                end)

                Options.VisualsOnHitSoundVolume:OnChanged(function()
                    Settings.Visuals.OnHit.Sound.Volume = Options.VisualsOnHitSoundVolume.Value
                end)

                Options.VisualsOnHitSound:OnChanged(function()
                    Settings.Visuals.OnHit.Sound.Value = Options.VisualsOnHitSound.Value
                end)
            end

            --// Atmosphere
            do
                Sections.Visuals.Atmosphere:AddToggle("VisualsAtmosphereEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                })


                Toggles.VisualsAtmosphereEnabled:OnChanged(function()
                    Settings.Visuals.World.Enabled = Toggles.VisualsAtmosphereEnabled.Value
                end)

                Sections.Visuals.Atmosphere:AddToggle("VisualsAtmosphereFogEnabled", {
                    Text = "Fog",
                    Default = false,
                    Tooltip = nil,
                }):AddColorPicker("VisualsAtmosphereFogColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Fog Color",
                    Transparency = nil,
                })

                Toggles.VisualsAtmosphereFogEnabled:OnChanged(function()
                    Settings.Visuals.World.Fog.Enabled = Toggles.VisualsAtmosphereFogEnabled.Value
                end)

                Options.VisualsAtmosphereFogColor:OnChanged(function()
                    Settings.Visuals.World.Fog.Color = Options.VisualsAtmosphereFogColor.Value
                end)

                Sections.Visuals.Atmosphere:AddSlider("VisualsAtmosphereFogStart", {
                    Text = "Fog Start",
                    Default = 1000,
                    Min = 1,
                    Max = 10000,
                    Rounding = 0,
                    Compact = false,
                })

                Sections.Visuals.Atmosphere:AddSlider("VisualsAtmosphereFogEnd", {
                    Text = "Fog End",
                    Default = 1000,
                    Min = 1,
                    Max = 10000,
                    Rounding = 0,
                    Compact = false,
                })

                Options.VisualsAtmosphereFogStart:OnChanged(function()
                    Settings.Visuals.World.Fog.Start = Options.VisualsAtmosphereFogStart.Value
                end)

                Options.VisualsAtmosphereFogEnd:OnChanged(function()
                    Settings.Visuals.World.Fog.End = Options.VisualsAtmosphereFogEnd.Value
                end)

                Sections.Visuals.Atmosphere:AddToggle("VisualsAtmosphereAmbientEnabled", {
                    Text = "Ambient",
                    Default = false,
                    Tooltip = nil,
                }):AddColorPicker("VisualsAtmosphereAmbientColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Ambient Color",
                    Transparency = nil,
                })

                Toggles.VisualsAtmosphereAmbientEnabled:OnChanged(function()
                    Settings.Visuals.World.Ambient.Enabled = Toggles.VisualsAtmosphereAmbientEnabled.Value
                end)

                Options.VisualsAtmosphereAmbientColor:OnChanged(function()
                    Settings.Visuals.World.Ambient.Color = Options.VisualsAtmosphereAmbientColor.Value
                end)

                Sections.Visuals.Atmosphere:AddToggle("VisualsAtmosphereBrightnessChangerEnabled", {
                    Text = "Brightness Changer",
                    Default = false,
                    Tooltip = nil,
                })

                Sections.Visuals.Atmosphere:AddSlider("VisualsAtmosphereBrightnessChangerValue", {
                    Text = "Brightness Value",
                    Default = 0,
                    Min = 0,
                    Max = 10,
                    Rounding = 2,
                    Compact = false,
                })

                Toggles.VisualsAtmosphereBrightnessChangerEnabled:OnChanged(function()
                    Settings.Visuals.World.Brightness.Enabled = Toggles.VisualsAtmosphereBrightnessChangerEnabled.Value
                end)

                Options.VisualsAtmosphereBrightnessChangerValue:OnChanged(function()
                    Settings.Visuals.World.Brightness.Value = Options.VisualsAtmosphereBrightnessChangerValue.Value
                end)

                Sections.Visuals.Atmosphere:AddToggle("VisualsAtmosphereTimeChangerEnabled", {
                    Text = "Clock Time",
                    Default = false,
                    Tooltip = nil,
                })

                Sections.Visuals.Atmosphere:AddSlider("VisualsAtmosphereTimeChangerValue", {
                    Text = "Time",
                    Default = 1,
                    Min = 0.1,
                    Max = 24,
                    Rounding = 1,
                    Compact = false,
                })

                Toggles.VisualsAtmosphereTimeChangerEnabled:OnChanged(function()
                    Settings.Visuals.World.ClockTime.Enabled = Toggles.VisualsAtmosphereTimeChangerEnabled.Value
                end)

                Options.VisualsAtmosphereTimeChangerValue:OnChanged(function()
                    Settings.Visuals.World.ClockTime.Value = Options.VisualsAtmosphereTimeChangerValue.Value
                end)

                Sections.Visuals.Atmosphere:AddToggle("VisualsAtmosphereExposureChangerEnabled", {
                    Text = "Exposure Changer",
                    Default = false,
                    Tooltip = nil,
                })

                Sections.Visuals.Atmosphere:AddSlider("VisualsAtmosphereExposureChangerValue", {
                    Text = "Exposure",
                    Default = 1,
                    Min = -3,
                    Max = 3,
                    Rounding = 1,
                    Compact = false,
                })

                Toggles.VisualsAtmosphereExposureChangerEnabled:OnChanged(function()
                    Settings.Visuals.World.WorldExposure.Enabled = Toggles.VisualsAtmosphereExposureChangerEnabled.Value
                end)

                Options.VisualsAtmosphereExposureChangerValue:OnChanged(function()
                    Settings.Visuals.World.WorldExposure.Value = Options.VisualsAtmosphereExposureChangerValue.Value
                end)
            end

            --// Crosshair
            do
                Sections.Visuals.Crosshair:AddToggle("VisualsCrosshairEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                }):AddColorPicker("VisualsCrossahairColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Crosshair Color",
                    Transparency = nil,
                })

                Toggles.VisualsCrosshairEnabled:OnChanged(function()
                    Settings.Visuals.Crosshair.Enabled = Toggles.VisualsCrosshairEnabled.Value
                end)

                Options.VisualsCrossahairColor:OnChanged(function()
                    Settings.Visuals.Crosshair.Color = Options.VisualsCrossahairColor.Value
                end)

                Sections.Visuals.Crosshair:AddSlider("VisualsCrosshairSize", {
                    Text = "Size",
                    Default = 1,
                    Min = 0.1,
                    Max = 30,
                    Rounding = 3,
                    Compact = false,
                })

                Options.VisualsCrosshairSize:OnChanged(function()
                    Settings.Visuals.Crosshair.Size = Options.VisualsCrosshairSize.Value
                end)

                Sections.Visuals.Crosshair:AddSlider("VisualsCrosshairGap", {
                    Text = "Gap",
                    Default = 2,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 3,
                    Compact = false,
                })

                Options.VisualsCrosshairGap:OnChanged(function()
                    Settings.Visuals.Crosshair.Gap = Options.VisualsCrosshairGap.Value
                end)

                Sections.Visuals.Crosshair:AddToggle("VisualsCrosshairRotateEnabled", {
                    Text = "Rotate",
                    Default = false,
                    Tooltip = nil,
                })

                Sections.Visuals.Crosshair:AddSlider("VisualsCrosshairRotateAmount", {
                    Text = "Rotation Speed",
                    Default = 1,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 3,
                    Compact = false,
                })

                Toggles.VisualsCrosshairRotateEnabled:OnChanged(function()
                    Settings.Visuals.Crosshair.Rotation.Enabled = Toggles.VisualsCrosshairRotateEnabled.Value
                end)

                Options.VisualsCrosshairRotateAmount:OnChanged(function()
                    Settings.Visuals.Crosshair.Rotation.Speed = Options.VisualsCrosshairRotateAmount.Value
                end)
            end
        end

        --// Anti Aim
        do

            --// Velocity Spoofer
            do
                Sections.AntiAim.VelocitySpoofer:AddToggle("AntiAimVelocitySpooferEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.AntiAimVelocitySpooferEnabled:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Enabled = Toggles.AntiAimVelocitySpooferEnabled.Value
                end)

                Sections.AntiAim.VelocitySpoofer:AddDropdown("AntiAimVelocitySpooferType", {
                    Values = {"Underground", "Sky", "Multiplier", "Prediction Breaker", "Custom"},
                    Default = 1,
                    Multi = false,

                    Text = "Type",
                    Tooltip = nil
                })

                Options.AntiAimVelocitySpooferType:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Type = Options.AntiAimVelocitySpooferType.Value
                end)

                Sections.AntiAim.VelocitySpoofer:AddToggle("AntiAimVelocitySpooferVisualizeEnabled", {
                    Text = "Visualize",
                    Default = false,
                    Tooltip = nil,
                }):AddColorPicker("AntiAimVelocitySpooferVisualizeColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "Velocity Visualize Color",
                    Transparency = nil,
                })

                Sections.AntiAim.VelocitySpoofer:AddInput("AntiAimVelocitySpooferVisualizePrediction", {
                    Default = nil,
                    Numeric = false,
                    Finished = false,

                    Text = "Visualize Prediction",
                    Tooltip = nil,

                    Placeholder = "Visualize Prediction Amount"
                })

                Options.AntiAimVelocitySpooferVisualizePrediction:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Visualize.Prediction = tonumber(Options.AntiAimVelocitySpooferVisualizePrediction.Value)
                end)

                Toggles.AntiAimVelocitySpooferVisualizeEnabled:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Visualize.Enabled = Toggles.AntiAimVelocitySpooferVisualizeEnabled.Value
                end)

                Options.AntiAimVelocitySpooferVisualizeColor:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Visualize.Color = Options.AntiAimVelocitySpooferVisualizeColor.Value
                end)

                Sections.AntiAim.VelocitySpoofer:AddSlider("AntiAimVelocitySpooferYaw", {
                    Text = "Yaw",
                    Default = 0,
                    Min = 0,
                    Max = 100,
                    Rounding = 3,
                    Compact = false
                })

                Options.AntiAimVelocitySpooferYaw:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Yaw = Options.AntiAimVelocitySpooferYaw.Value
                end)

                Sections.AntiAim.VelocitySpoofer:AddSlider("AntiAimVelocitySpooferPitch", {
                    Text = "Pitch",
                    Default = 0,
                    Min = 0,
                    Max = 100,
                    Rounding = 3,
                    Compact = false
                })

                Options.AntiAimVelocitySpooferPitch:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Pitch = Options.AntiAimVelocitySpooferPitch.Value
                end)

                Sections.AntiAim.VelocitySpoofer:AddSlider("AntiAimVelocitySpooferRoll", {
                    Text = "Roll",
                    Default = 0,
                    Min = 0,
                    Max = 100,
                    Rounding = 3,
                    Compact = false
                })

                Options.AntiAimVelocitySpooferRoll:OnChanged(function()
                    Settings.AntiAim.VelocitySpoofer.Roll = Options.AntiAimVelocitySpooferRoll.Value
                end)
            end

            --// C-Sync
            do
                Sections.AntiAim.CSync:AddToggle("CSyncAntiAimEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                }):AddKeyPicker("CSyncAntiAimKeyPicker", {
                    Default = "b",
                    SyncToggleState = true,
                    Mode = "Toggle",

                    Text = "C-Sync",
                    NoUI = false,
                })

                Toggles.CSyncAntiAimEnabled:OnChanged(function()
                    Settings.AntiAim.CSync.Enabled = Toggles.CSyncAntiAimEnabled.Value
                end)

                Sections.AntiAim.CSync:AddToggle("CSyncAntiAimVisualizeEnabled", {
                    Text = "Visualize",
                    Default = false,
                    Tooltip = nil,
                }):AddColorPicker("CSyncAntiAimVisualizeColor", {
                    Default = Color3.new(1, 1, 1),
                    Title = "CFrame Visualize Color",
                    Transparency = nil,
                })

                Sections.AntiAim.CSync:AddDropdown("CSyncAntiAimType", {
                    Values = {"Custom", "Random", "Random Target", "Target Strafe", "Local Strafe"},
                    Default = 1,
                    Multi = false,
                    Text = "Type",
                    Tooltip = nil,
                })

                Toggles.CSyncAntiAimVisualizeEnabled:OnChanged(function()
                    Settings.AntiAim.CSync.Visualize.Enabled = Toggles.CSyncAntiAimVisualizeEnabled.Value
                end)

                Options.CSyncAntiAimVisualizeColor:OnChanged(function()
                    Settings.AntiAim.CSync.Visualize.Color = Options.CSyncAntiAimVisualizeColor.Value
                end)

                Options.CSyncAntiAimType:OnChanged(function()
                    Settings.AntiAim.CSync.Type = Options.CSyncAntiAimType.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimRandomRange", {
                    Text = "Random Range",
                    Default = 0.1,
                    Min = 0,
                    Max = 20,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimRandomRange:OnChanged(function()
                    Settings.AntiAim.CSync.RandomDistance = Options.CSyncAntiAimRandomRange.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimCustomX", {
                    Text = "Custom X",
                    Default = 0.1,
                    Min = 0,
                    Max = 500,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimCustomX:OnChanged(function()
                    Settings.AntiAim.CSync.Custom.X = Options.CSyncAntiAimCustomX.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimCustomY", {
                    Text = "Custom Y",
                    Default = 0.1,
                    Min = 0,
                    Max = 500,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimCustomY:OnChanged(function()
                    Settings.AntiAim.CSync.Custom.Y = Options.CSyncAntiAimCustomY.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimCustomZ", {
                    Text = "Custom Z",
                    Default = 0.1,
                    Min = 0,
                    Max = 500,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimCustomZ:OnChanged(function()
                    Settings.AntiAim.CSync.Custom.Z = Options.CSyncAntiAimCustomZ.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimTargetStrafeSpeed", {
                    Text = "Target Strafe Speed",
                    Default = 1,
                    Min = 0,
                    Max = 20,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimTargetStrafeSpeed:OnChanged(function()
                    Settings.AntiAim.CSync.TargetStrafe.Speed = Options.CSyncAntiAimTargetStrafeSpeed.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimTargetStrafeDistance", {
                    Text = "Target Strafe Distance",
                    Default = 1,
                    Min = 0,
                    Max = 20,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimTargetStrafeDistance:OnChanged(function()
                    Settings.AntiAim.CSync.TargetStrafe.Distance = Options.CSyncAntiAimTargetStrafeDistance.Value
                end)

                Sections.AntiAim.CSync:AddSlider("CSyncAntiAimTargetStrafeHeight", {
                    Text = "Target Strafe Height",
                    Default = 1,
                    Min = 0,
                    Max = 20,
                    Rounding = 1,
                    Compact = false,
                })

                Options.CSyncAntiAimTargetStrafeHeight:OnChanged(function()
                    Settings.AntiAim.CSync.TargetStrafe.Height = Options.CSyncAntiAimTargetStrafeHeight.Value
                end)
            end

            --// Fake Lag
            do
                Sections.AntiAim.Network:AddToggle("AntiAimNetworkEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                }):AddKeyPicker("AntiAimNetworkKeyPicker", {
                    Default = "b",
                    SyncToggleState = true,
                    Mode = "Toggle",

                    Text = "Network",
                    NoUI = false,
                })

                Toggles.AntiAimNetworkEnabled:OnChanged(function()
                    Settings.AntiAim.Network.Enabled = Toggles.AntiAimNetworkEnabled.Value
                end)

                Sections.AntiAim.Network:AddToggle("AntiAimNetworkWalkingCheck", {
                    Text = "Walking Check",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.AntiAimNetworkWalkingCheck:OnChanged(function()
                    Settings.AntiAim.Network.WalkingCheck = Toggles.AntiAimNetworkWalkingCheck.Value
                end)

                Sections.AntiAim.Network:AddSlider("AntiAimNetworkAmount", {
                    Text = "Amount",
                    Default = 0.1,
                    Min = 0,
                    Max = 30,
                    Rounding = 3,
                    Compact = false,
                })

                Options.AntiAimNetworkAmount:OnChanged(function()
                    Settings.AntiAim.Network.Amount = Options.AntiAimNetworkAmount.Value
                end)
            end

            --// Velocity Desync
            do
                Sections.AntiAim.VelocityDesync:AddToggle("AntiAimVelocityDesyncEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                }):AddKeyPicker("AntiAimVelocityDesyncKeyPicker", {
                    Default = "b",
                    SyncToggleState = true,
                    Mode = "Toggle",

                    Text = "Velocity Desync",
                    NoUI = false,
                })

                Toggles.AntiAimVelocityDesyncEnabled:OnChanged(function()
                    Settings.AntiAim.VelocityDesync.Enabled = Toggles.AntiAimVelocityDesyncEnabled.Value
                end)

                Sections.AntiAim.VelocityDesync:AddSlider("AntiAimVelocityDesyncRange", {
                    Text = "Range",
                    Default = 1,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 3,
                    Compact = false,
                })

                Options.AntiAimVelocityDesyncRange:OnChanged(function()
                    Settings.AntiAim.VelocityDesync.Range = Options.AntiAimVelocityDesyncRange.Value
                end)
            end

            --// FFlag Desync
            do
                Sections.AntiAim.FFlag:AddToggle("AntiAimFFlagDesyncEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                }):AddKeyPicker("AntiAimFFlagDesyncKeyPicker", {
                    Default = "b",
                    SyncToggleState = true,
                    Mode = "Toggle",

                    Text = "FFlag Desync",
                    NoUI = false,
                })

                Toggles.AntiAimFFlagDesyncEnabled:OnChanged(function()
                    Settings.AntiAim.FFlagDesync.Enabled = Toggles.AntiAimFFlagDesyncEnabled.Value

                    if not Settings.AntiAim.FFlagDesync.Enabled then
                        for FFlag, Value in pairs(Script.Locals.FFlags) do
                            setfflag(FFlag, Value)
                        end
                    end
                end)

                Sections.AntiAim.FFlag:AddToggle("AntiAimFFlagDesyncSetNew", {
                    Text = "Set New",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.AntiAimFFlagDesyncSetNew:OnChanged(function()
                    Settings.AntiAim.FFlagDesync.SetNew = Toggles.AntiAimFFlagDesyncSetNew.Value
                end)

                Sections.AntiAim.FFlag:AddDropdown("AntiAimFFlagDesyncFFlags", {
                    Values = {"S2PhysicsSenderRate", "PhysicsSenderMaxBandwidthBps", "DataSenderMaxJoinBandwidthBps"},
                    Default = {"S2PhysicsSenderRate"},
                    Multi = true,
                    Text = "FFlags",
                    Tooltip = nil,
                })

                Options.AntiAimFFlagDesyncFFlags:OnChanged(function()
                    Settings.AntiAim.FFlagDesync.FFlags = Options.AntiAimFFlagDesyncFFlags.Value
                end)

                Sections.AntiAim.FFlag:AddSlider("AntiAimFFlagDesyncAmount", {
                    Text = "Amount",
                    Default = 2,
                    Min = 0.1,
                    Max = 10,
                    Rounding = 3,
                    Compact = false,
                })

                Options.AntiAimFFlagDesyncAmount:OnChanged(function()
                    Settings.AntiAim.FFlagDesync.Amount = Options.AntiAimFFlagDesyncAmount.Value
                end)

                Sections.AntiAim.FFlag:AddSlider("AntiAimFFlagDesyncSetnewAmount", {
                    Text = "Set New Amount",
                    Default = 15,
                    Min = 0.1,
                    Max = 20,
                    Rounding = 3,
                    Compact = false,
                })

                Options.AntiAimFFlagDesyncSetnewAmount:OnChanged(function()
                    Settings.AntiAim.FFlagDesync.SetNewAmount = Options.AntiAimFFlagDesyncSetnewAmount.Value
                end)
            end

            --// Invisible Desync
        end

        --// Misc
        do

            --// Speed
            do
                Sections.Misc.Speed:AddToggle("MiscCFrameSpeedEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                }):AddKeyPicker("MiscCFrameSpeedKeybind", {
                    Default = "b",
                    SyncToggleState = true,
                    Mode = "Toggle",

                    Text = "Speed",
                    NoUI = false,
                })

                Toggles.MiscCFrameSpeedEnabled:OnChanged(function()
                    Settings.Misc.Movement.Speed.Enabled = Toggles.MiscCFrameSpeedEnabled.Value
                end)

                Sections.Misc.Speed:AddSlider("MiscCFrameSpeedAmount", {
                    Text = "Amount",
                    Default = 0.1,
                    Min = 0,
                    Max = 10,
                    Rounding = 3,
                    Compact = false,
                })

                Options.MiscCFrameSpeedAmount:OnChanged(function()
                    Settings.Misc.Movement.Speed.Amount = Options.MiscCFrameSpeedAmount.Value
                end)
            end

            --// Exploits
            do
                Sections.Misc.Exploits:AddToggle("MiscExploitsEnabled", {
                    Text = "Enabled",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.MiscExploitsEnabled:OnChanged(function()
                    Settings.Misc.Exploits.Enabled = Toggles.MiscExploitsEnabled.Value
                end)

                Sections.Misc.Exploits:AddToggle("MiscExploitsNoRecoil", {
                    Text = "No Recoil",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.MiscExploitsNoRecoil:OnChanged(function()
                    Settings.Misc.Exploits.NoRecoil = Toggles.MiscExploitsNoRecoil.Value
                end)

                Sections.Misc.Exploits:AddToggle("MiscExploitsNoJumpCooldown", {
                    Text = "No Jumpcooldown",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.MiscExploitsNoJumpCooldown:OnChanged(function()
                    Settings.Misc.Exploits.NoJumpCooldown = Toggles.MiscExploitsNoJumpCooldown.Value
                end)

                Sections.Misc.Exploits:AddToggle("MiscExploitsNoSlowdown", {
                    Text = "No Slowdown",
                    Default = false,
                    Tooltip = nil,
                })

                Toggles.MiscExploitsNoSlowdown:OnChanged(function()
                    Settings.Misc.Exploits.NoSlowDown = Toggles.MiscExploitsNoSlowdown.Value
                end)
            end
        end

        --// Settings Tab
        do
            local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu")

            Library.KeybindFrame.Visible = true

            MenuGroup:AddToggle("KeybindsListEnabled", {
                Text = "Keybinds List",
                Default = true,
                Tooltip = nil,
            })

            Toggles.KeybindsListEnabled:OnChanged(function()
                Library.KeybindFrame.Visible = Toggles.KeybindsListEnabled.Value
            end)

            MenuGroup:AddButton("Unload", function() Library:Unload() end)
            MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "End", NoUI = true, Text = "Menu keybind" })
            Library.ToggleKeybind = Options.MenuKeybind

            ThemeManager:SetLibrary(Library)
            SaveManager:SetLibrary(Library)

            ThemeManager:SetFolder("Azure")
            SaveManager:SetFolder("Azure/Hood")

            SaveManager:BuildConfigSection(Tabs.Settings)
            ThemeManager:ApplyToTab(Tabs.Settings)
        end
    end
end

load()
