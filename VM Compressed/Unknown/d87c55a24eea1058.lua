if not game then error("\83\99\114\105\112\116\32\114\101\113\117\105\114\101\115\32\82\111\98\108\111\120") end
local _a1b2c = game:GetService("\80\108\97\121\101\114\115")
local _b3c4d = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101")
local _c5d6e = game:GetService("\82\117\110\83\101\114\118\105\99\101")
local _d7e8f = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local _e9f0g = _a1b2c.LocalPlayer

local _f1g2h
local _g3h4i, _err = pcall(function()
    _f1g2h = loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\100\101\112\116\104\115\111\47\68\101\97\114\45\82\101\71\117\105\47\109\97\105\110\47\82\101\71\117\105\46\108\117\97"))()
end)
if not _g3h4i then warn("\82\101\71\117\105\32\70\97\105\108\58\32" .. tostring(_err)) return end

local _h5i6j = nil
local function _i7j8k()
    local _j9k0l = _e9f0g.Character or _e9f0g.CharacterAdded:Wait()
    _h5i6j = _j9k0l:WaitForChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
end

_i7j8k()
_e9f0g.CharacterAdded:Connect(_i7j8k)

local _k1l2m, _l3m4n, _m5n6o, _n7o8p = false, false, false, false

local _o9p0q = _f1g2h:TabsWindow({
    Title = "\67\104\101\115\116\32\38\32\82\101\119\97\114\100\32\83\99\114\105\112\116",
    Size = UDim2.fromOffset(520, 330),
    Position = UDim2.fromOffset(100, 100),
})

local _p1q2r = _o9p0q:CreateTab({ Name = "\128298\32\77\97\105\110" })
local _q3r4s = _o9p0q:CreateTab({ Name = "\127939\32\77\111\118\101\109\101\110\116" })
local _r5s6t = _o9p0q:CreateTab({ Name = "\127881\32\82\101\119\97\114\100\115" })

_p1q2r:CollapsingHeader({ Title = "\65\117\116\111\32\67\104\101\115\116" }):Checkbox({
    Label = "\65\117\116\111\32\84\80\32\38\32\87\105\110\32\40\78\111\114\109\97\108\41",
    Value = false,
    Callback = function(_s7t8u, _t9u0v) _k1l2m = _t9u0v end
})

_p1q2r:Checkbox({
    Label = "\65\117\116\111\32\84\80\32\38\32\87\105\110\32\40\86\101\114\121\32\70\97\115\116\41",
    Value = false,
    Callback = function(_u1v2w, _v3w4x) _l3m4n = _v3w4x end
})

_r5s6t:CollapsingHeader({ Title = "\65\117\116\111\32\67\108\97\105\109\32\82\101\119\97\114\100\115" }):Checkbox({
    Label = "\65\117\116\111\32\67\108\97\105\109\32\40\70\114\101\101\32\38\32\86\73\80\41",
    Value = false,
    Callback = function(_w5x6y, _x7y8z) _n7o8p = _x7y8z end
})

local _y9z0a = _q3r4s:CollapsingHeader({ Title = "\80\108\97\121\101\114\32\77\111\118\101\109\101\110\116" })

_y9z0a:SliderFloat({
    Label = "\87\97\108\107\83\112\101\101\100",
    Minimum = 16,
    Maximum = 200,
    Value = 16,
    Callback = function(_z1a2b, _a3b4c)
        local _b5c6d = _e9f0g.Character and _e9f0g.Character:FindFirstChild("\72\117\109\97\110\111\105\100")
        if _b5c6d and math.random(1, 100) > 0 then
            _b5c6d.WalkSpeed = _a3b4c
        end
    end
})

_y9z0a:SliderFloat({
    Label = "\74\117\109\112\80\111\119\101\114",
    Minimum = 50,
    Maximum = 200,
    Value = 50,
    Callback = function(_c7d8e, _d9e0f)
        local _e1f2g = _e9f0g.Character and _e9f0g.Character:FindFirstChild("\72\117\109\97\110\111\105\100")
        if _e1f2g and true then
            _e1f2g.JumpPower = _d9e0f
        end
    end
})

_y9z0a:Checkbox({
    Label = "\73\110\102\105\110\105\116\101\32\74\117\109\112",
    Value = false,
    Callback = function(_f3g4h, _g5h6i) _m5n6o = _g5h6i end
})

_d7e8f.JumpRequest:Connect(function()
    if _m5n6o and _e9f0g.Character and _e9f0g.Character:FindFirstChild("\72\117\109\97\110\111\105\100") then
        local _h7i8j = math.random(1, 10)
        if _h7i8j > 0 then
            _e9f0g.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

_c5d6e.Stepped:Connect(function()
    if _h5i6j then
        if _k1l2m and workspace:FindFirstChild("\82\101\119\97\114\100\67\104\101\115\116") then
            _h5i6j.CFrame = workspace.RewardChest.CFrame + Vector3.new(0, 5, 0)
            task.wait(1)
        elseif _l3m4n and workspace:FindFirstChild("\82\101\119\97\114\100\67\104\101\115\116") then
            _h5i6j.CFrame = workspace.RewardChest.CFrame + Vector3.new(0, 5, 0)
        end
    end

    if _n7o8p then
        local _i9j0k = _b3c4d:FindFirstChild("\82\101\109\111\116\101\115")
        if _i9j0k and _i9j0k:FindFirstChild("\67\108\97\105\109\70\114\101\101\82\101\119\97\114\100") and _i9j0k:FindFirstChild("\67\108\97\105\109\86\73\80\82\101\119\97\114\100") then
            for _j1k2l = 1, 8 do
                _i9j0k.ClaimFreeReward:FireServer(_j1k2l)
                _i9j0k.ClaimVIPReward:FireServer(_j1k2l)
                task.wait(0.2)
            end
        end
    end
end)