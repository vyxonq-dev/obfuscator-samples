-- Star Fishing [ALPHA] Auto Fish with Rayfield GUI

-- Toggle for instant reel/collect auto farm

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({

   Name = "Star Fishing Auto",

   LoadingTitle = "Auto Fish GUI",

   LoadingSubtitle = "by the_guywhowantsnothin",   -- Changed here

   ConfigurationSaving = {

      Enabled = true,

      FolderName = "StarFishingAuto",

      FileName = "Config"

   }

})

local Tab = Window:CreateTab("Main", 4483362458) -- Fishing rod icon

local Toggle = Tab:CreateToggle({

   Name = "Auto Fish (Instant Reel/Confirm)",

   CurrentValue = false,

   Flag = "AutoFishToggle",

   Callback = function(Value)

      shared.afy = Value

      Rayfield:Notify({

         Title = "Auto Fish",

         Content = Value and "Enabled! Casting & instant confirming..." or "Disabled.",

         Duration = 4,

         Image = 4483362458,

      })

      

      if Value then

         -- Start the auto logic

         local Flags = { Farm = 'Self' } -- Change to 'Milky Way', 'Andromeda', etc. if you want

         

         local Players = game:GetService("Players")

         local ReplicatedStorage = game:GetService("ReplicatedStorage")

         local Client = Players.LocalPlayer

         local Connections = {}

         

         local function GetRoot(Character) return Character and Character:FindFirstChild('HumanoidRootPart') end

         local function GetHumanoid(Character) return Character and Character:FindFirstChild('Humanoid') end

         

         local function Cast()

            local Character = Client.Character

            local Humanoid = GetHumanoid(Character)

            local Root = GetRoot(Character)

            if not Root then return end

         

            local Rod = Character:FindFirstChild('Rod')

            if not Rod then return end

         

            local Farming = Flags.Farm == 'Self' and Root or workspace.Galaxies:FindFirstChild(Flags.Farm) or Root

            local FarmType = {Farming:GetPivot().Position + Vector3.new(0, 5, 0), Farming:GetPivot().LookVector}

            local CastArguments = {

               Humanoid,

               FarmType[1],

               FarmType[2],

               Rod.Model.Nodes.RodTip.Attachment

            }

         

            local Cast = ReplicatedStorage.Events.Global.Cast

            Cast:FireServer(table.unpack(CastArguments))

         

            local WithdrawBobber = ReplicatedStorage.Events.Global.WithdrawBobber

            WithdrawBobber:FireServer(Client.Character.Humanoid)

         end

         

         -- Auto confirm catches (instant reel part)

         local ClientRecieveItems = ReplicatedStorage.Events.Global.ClientRecieveItems

         table.insert(Connections, ClientRecieveItems.OnClientEvent:Connect(function(...)

            local Data = {...}

            local Info = Data[4] or {}

            local TimingTbl = Data[6] or {}

         

            for Index, StarData in Info do

               local Id = StarData['id']

               if Id then

                  task.wait(TimingTbl[Index] or 3) -- Small delay to avoid kick

                  local ClientItemConfirm = ReplicatedStorage.Events.Global.ClientItemConfirm

                  ClientItemConfirm:FireServer(Id)

               end

            end

         end))

         

         -- Main loop

         spawn(function()

            while shared.afy and task.wait() do

               local Character = Client.Character

               local Root = GetRoot(Character)

               if not Root then continue end

               

               Cast()

            end

         end)

         

         -- Cleanup

         game:BindToClose(function()

            for _, conn in Connections do conn:Disconnect() end

         end)

      end

   end,

})

Rayfield:Notify({

   Title = "Loaded!",

   Content = "Toggle 'Auto Fish' to start instant reeling & collecting. Equip rod first!",

   Duration = 6.5,

   Image = 4483362458,

})

-- Optional: Destroy GUI button

local DestroyButton = Tab:CreateButton({

   Name = "Destroy GUI",

   Callback = function()

      Rayfield:Destroy()

   end,

})