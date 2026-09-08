local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("DaHood Buy GUI")
local FirstPage = MainUI.AddPage("Buy")
wait()
        for _, v in pairs(workspace.Ignored.Shop:GetChildren()) do
            local FirstButton = FirstPage.AddButton(v.Name, function()
                local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local k = game.Workspace.Ignored.Shop[v.Name]
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
                    wait(.2)
                    fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
                end
            end)
        end
        wait()