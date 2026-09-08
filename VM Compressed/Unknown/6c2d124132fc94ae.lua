local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function WIrlNEVOHFSwONkSxPj(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


-- [[ KLD HUB â¡ - Updated Version ]]
local success, err = pcall(function()
    local Fluent = loadstring(game:HttpGet(WIrlNEVOHFSwONkSxPj('HMOMWJMwvudzRcCfNbFBEufVQVogMsjaboWAKTEtHCPxFkLXMgRoaKZaHR0cHM6Ly9naXRodWIuY29tL2Rhd2lkLXNjcmlwdHMvRmx1ZW50L3JlbGVhc2VzL2xhdGVzdC9kb3dubG9hZC9tYWluLmx1YQ==')))()
    local Players = game:GetService(WIrlNEVOHFSwONkSxPj('JvFNfBlOXwhROeIOWoFthYHtVXdWxufgIKUfVKoEInGUmuWpENvAqRSUGxheWVycw=='))
    local Player = Players.LocalPlayer
    local TeleportService = game:GetService(WIrlNEVOHFSwONkSxPj('NHkUCjdXNyPWAYSsmyKvmhlCxzEeRUogQKgSPeKrJqILvFhSsxZRZklVGVsZXBvcnRTZXJ2aWNl'))
    local HttpService = game:GetService(WIrlNEVOHFSwONkSxPj('xINuezgKTLNQFzlyHcFNEGMFjPqpYUPqTGQKMPdIGMgEVVIszQnfqqsSHR0cFNlcnZpY2U='))
    local RunService = game:GetService(WIrlNEVOHFSwONkSxPj('FDZBLNUcDqPbKPyMBdDywfOgnIlobmWIOOUjrohUjouOheJmOyFjJqoUnVuU2VydmljZQ=='))
    local Workspace = game:GetService(WIrlNEVOHFSwONkSxPj('OYGtxNcyhIEYpxtxfIXbQrJRKtwahsSBdqqUHgxwbiknCxLrFnXaLEqV29ya3NwYWNl'))
    local UserInputService = game:GetService(WIrlNEVOHFSwONkSxPj('ZricTCsdyynhPIAfWQcgyQIswalOVzqXXEQbSyKDEKSZRwwjDFEcNVOVXNlcklucHV0U2VydmljZQ=='))
    local TextChatService = game:GetService(WIrlNEVOHFSwONkSxPj('EhTxLNSROaQLYZPuwHDgzgRwNVeDEaFZcpSytgVeUpXJwmVizqlbrCfVGV4dENoYXRTZXJ2aWNl'))
    local ReplicatedStorage = game:GetService(WIrlNEVOHFSwONkSxPj('iANEtjhzOSfoZAlFQCdnEaPJEfDVrbvSwayTZmOzMeAQITcbkUveLpbUmVwbGljYXRlZFN0b3JhZ2U='))
    local Camera = Workspace.CurrentCamera

    local Window = Fluent:CreateWindow({
        Title = WIrlNEVOHFSwONkSxPj('uSpgbnAXLuiPbckgcKECwfAKaEnIUZtftFdwNXMyXSCklXHGVgYwheAS0xEIEhVQiDimqE='),
        SubTitle = WIrlNEVOHFSwONkSxPj('EFRtbhRvgpHNCCyzOCQxDnyJDhKACloKzzlXWzdDzZaLhWwzEJyNGrj2KfZhNil2LXYr9in2LEg2KfZhNmF2LfZiNix'),
        TabWidth = 130,
        Size = UDim2.fromOffset(480, 320),
        Theme = WIrlNEVOHFSwONkSxPj('fpYpzGEtZEsNUurEyCsQvyKvgOOOAPJVAUYBkZfNKLRYfTQFqICBtZBRGFyaw=='),
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Home = Window:AddTab({ Title = WIrlNEVOHFSwONkSxPj('OKzvhJdEZqegAyxkbanqnLTAVYHFkVKTSfGLUYQtAKouHCloTtJOCqI2KfZhNix2KbZitiz2YrYqQ=='), Icon = WIrlNEVOHFSwONkSxPj('RQwgoKQeUTxvOVqYtijTvMydfKyaKRBuWhRVWcCRUyBzdlmOitQlBQEaG9tZQ==') }),
        Player = Window:AddTab({ Title = WIrlNEVOHFSwONkSxPj('WRPPljqRtvffhbWRDFzaaOnGPpxwzpOkPvYSdiEvMkGqGTNtmDVpeuK2KfZhNmE2KfYudio'), Icon = WIrlNEVOHFSwONkSxPj('CLMiBGDhFJSqihoEtpffwlXTMlnqekUjfRVkRwwUmmMqCgyReAlTsZxdXNlcg==') }),
        Target = Window:AddTab({ Title = WIrlNEVOHFSwONkSxPj('waJYucYuKLYcnykDZguhWgxpnIcrxgUWhJDrDZdNQQmntPsIhlylfJI2KfZhNin2LPYqtmH2K/Yp9mB'), Icon = WIrlNEVOHFSwONkSxPj('hjTnmgJqLBfelIjriVkDUEPaJWaTflnOCNRQtUeXsuCPXFrOzyhkDnnY3Jvc3NoYWly') }),
        Troll = Window:AddTab({ Title = WIrlNEVOHFSwONkSxPj('LkyplFrsgKsEnQIGjaTOvJpntmEWtRLBVXxQrbkCdEUAnPkQPKYdfRI2KrYrtix2YrYqA=='), Icon = WIrlNEVOHFSwONkSxPj('pTxGCEaUjBGAhJQvVJXwNdbfoNUbyhTkWnIphEVShitVmlWnigHHUfIYnVn') }),
        Library = Window:AddTab({ Title = WIrlNEVOHFSwONkSxPj('hLYwRtuZadVmRlfvODoVAlYJazxIdCbrfwyVtxEaoouIOxfyFlbLWXc2KfZhNiz2YPYsdio2KrYp9iq'), Icon = WIrlNEVOHFSwONkSxPj('ckjzZzsfNTjwADsxafOnIPwYMViThJNPDArmPHCrQwUpUexzGZCkfTXY29kZQ==') }),
        Misc = Window:AddTab({ Title = WIrlNEVOHFSwONkSxPj('QVUECyPTEsFljtBcBZSUabQbuWouqIlMlSNbUfzigEHaArIHymBWSrC2KPYrtix2Yk='), Icon = WIrlNEVOHFSwONkSxPj('KVMyLqOQNNNDMvDmIpAaGWCNOwqjhDXZtfxHRSZICgnoYgkEINqYxnubW9yZS1ob3Jpem9udGFs') })
    }

    local Options = Fluent.Options

    -- ==================== Ø§ÙØ±Ø¦ÙØ³ÙØ© ====================
    Tabs.Home:AddParagraph({
        Title = WIrlNEVOHFSwONkSxPj('nQRNfKHfCFBCPAPsRPfFOnKhDOGoMqccTdnWQfEILAJpvYVGXvokWTi8J+RkSDYtdin2K3YqCDYp9mE2LPZg9ix2KjYqiA6IElOT1RDYW5TZWV5b3VfMA=='),
        Content = WIrlNEVOHFSwONkSxPj('RCnaxPdnJLxBPNVoErdjVnszqfwCPViGISjLzxHuGRgfTZegVEsSITp2KPZh9mE2KfZiyDYqNmDINmK2Kcg') .. Player.Name .. WIrlNEVOHFSwONkSxPj('jMkleHDUDzyVAEdapUWRdDKXINbuQothblwPmTdcEafXmIEOwXOKDrMIOKYgO+4jyDZgdmKIEtMRCBIVUIh')
    })
    Tabs.Home:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('xbwTzrvWKMuOSvbwLDiwtknMZbgnABRRGOxIIRRzvMfptWUyBaUDPra2YbYs9iuINix2KfYqNi3INiv2YrYs9mD2YjYsdivINin2YTYs9mK2LHZgdix'),
        Callback = function()
            if setclipboard then
                setclipboard(WIrlNEVOHFSwONkSxPj('jCmSeTexYxvZAdOGuFmewNkEAsxTkHFPyubozcxIdHBBJfNUbDZQVpDaHR0cHM6Ly9kaXNjb3JkLmdnL3lvdXJpbnZpdGU='))
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('EEIbsWCqZzlSplViurQUKDJlHxCQNjbXMMHXqAmCtMzjqBpBkNTEUBNRGlzY29yZA=='), Content = WIrlNEVOHFSwONkSxPj('aOOVjKmreVAJeshLbEHiATTQoneDGRJrMvCzmKOkmkHskFZjjehBaQY2KrZhSDZhtiz2K4g2LHYp9io2Lcg2KfZhNiv2YrYs9mD2YjYsdivIQ=='), Duration = 3})
            end
        end
    })
    Tabs.Home:AddButton({Title = WIrlNEVOHFSwONkSxPj('pcXrjcfjlVRysHIiTWYKJszyPlwsyzjHPvIajzsZGKMPQFqCuYGnOSQ2KXYrtmB2KfYoSAvINil2LjZh9in2LEg2KfZhNmI2KfYrNmH2Kk='), Callback = function() Window:Minimize() end})
    Tabs.Home:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('dBWMBrWfkkiDYAWKUmOvOZtipKZMPLWlYInNptwefNmWmPdGwHspcBL8J+UhCDYpdi52KfYr9ipINin2YTYr9iu2YjZhCDZhNmG2YHYsyDYp9mE2LPZitix2YHYsSAoUmVqb2luKQ=='),
        Callback = function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
        end
    })
    Tabs.Home:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('qaNDcmcuHBazZUQJmbWPWKfYiejwhMjiqtgEFdEnLSupojcOzkaEAmk4p2MINil2LrZhNin2YIg2KfZhNiz2YPYsdio2Kog2YbZh9in2KbZitin2YsgKERlc3Ryb3kgVUkp'),
        Callback = function()
            Fluent:Destroy()
        end
    })

    -- ==================== Ø§ÙÙØ§Ø¹Ø¨ ====================
    Tabs.Player:AddSlider(WIrlNEVOHFSwONkSxPj('BfLzVcNhDFfZMXwGurBZYWnLhZPdQCuDEWKkSnNogOYRXqMVteyXoQoU3BlZWRTbGlkZXI='), {
        Title = WIrlNEVOHFSwONkSxPj('rURaAttGOIJcyJDIwLNtHfYqabdkvifCDFPKgQYRaPXvgSjCMrjmnTd2KfZhNiz2LHYudipIChTcGVlZCk='), Default = 16, Min = 16, Max = 500, Rounding = 0,
        Callback = function(Value)
            if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('XFpykPaVidiCvIEgkJkYnxyWsHdtKNzodmFzIZgVVOmBMlEfdcZndicSHVtYW5vaWQ=')) then
                Player.Character.Humanoid.WalkSpeed = Value
            end
        end
    })
    Tabs.Player:AddSlider(WIrlNEVOHFSwONkSxPj('WAWPdkZXlLetQssHEkSaVyaZSBAqQHzJanrQOSeoZOHFnqFhTGeQabWSnVtcFNsaWRlcg=='), {
        Title = WIrlNEVOHFSwONkSxPj('MSqUVRMqpEEyvLFKgtUZrFuSiryeiDjORvqEvXSEPWZAPnixtmITlpQ2YLZiNipINin2YTZgtmB2LIgKEp1bXAgUG93ZXIp'), Default = 50, Min = 50, Max = 500, Rounding = 0,
        Callback = function(Value)
            if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('KuamfTBrauLfjxHtXAomKbcwPcucDioFuOkmEZEwvOgoNpexZGrHrfUSHVtYW5vaWQ=')) then
                local Humanoid = Player.Character.Humanoid
                Humanoid.UseJumpPower = true
                Humanoid.JumpPower = Value
            end
        end
    })

    local LowGrav = false
    Tabs.Player:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('siPpqQcXClRnlurVchTKRgIzvCAJndmfyyEPAdmkHDUFHOTXkagSJWU2KrZgdi52YrZhCAvINil2YTYutin2KEg2KzYp9iw2KjZitipINin2YTZgtmF2LE='),
        Callback = function()
            LowGrav = not LowGrav
            Workspace.Gravity = LowGrav and 50 or 196.2
            Fluent:Notify({ Title = WIrlNEVOHFSwONkSxPj('blgiMBfKWJokoLMQjKDAfSVKHXnyKRwFzKsBwmwNXRuytprzPIGgAJdR3Jhdml0eQ=='), Content = LowGrav and WIrlNEVOHFSwONkSxPj('eYilSPwGXSXfNpuVoLHlBOkIxznyRVAwvHQbnxIWSlZbcQpFUUVnPpj2KrZhSDYqtmC2YTZitmEINin2YTYrNin2LDYqNmK2Kkh') or WIrlNEVOHFSwONkSxPj('luhvMnltiLwkAhDQQQgJsWaYjNoabltoGXjeOUZPRXrmXLXakQDRtSX2KfZhNis2KfYsNio2YrYqSDYt9io2YrYudmK2Kk='), Duration = 2 })
        end
    })
    Tabs.Player:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('ddIsakfHjunCxLwCpKFUKeliURejFdfQzfcgCxNvRBdYduEytHWHqow2KXYudin2K/YqSDYttio2Lcg2KfZhNit2LHZg9ip'),
        Callback = function()
            if Options.SpeedSlider then Options.SpeedSlider:SetValue(16) end
            if Options.JumpSlider then Options.JumpSlider:SetValue(50) end
            Workspace.Gravity = 196.2
        end
    })

    local InfJump = false
    UserInputService.JumpRequest:Connect(function()
        if InfJump and Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('KVzxdUaLYGUdRyEAdOxJRbpSPkpSmpOamuPZWWAtAubWRIUVwmfVwCfSHVtYW5vaWQ=')) then
            Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    Tabs.Player:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('scKYrNObrSAkgLQkGKzEYaNsDtLbBnpQUXeYcRjNYkYvyeVkImaJdTQ2KrZgdi52YrZhCAvINil2YTYutin2KEg2KfZhNmC2YHYsiDYp9mE2YTYp9mG2YfYp9im2YogKEluZiBKdW1wKQ=='),
        Callback = function()
            InfJump = not InfJump
            Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('pSpDeQvdvfOEsQgVMNJSgqtQGEaWbsVeyXajGTPapCxTXsnGFrFvAAASW5mIEp1bXA='), Content = InfJump and WIrlNEVOHFSwONkSxPj('DhJKmpEZPnNPwmczCIdlLIKuYSWjByvTkpgnCBUjeHZSqnZlhfGYMVQ2YXZgdi52YQgKNmK2YXZg9mG2YMg2KfZhNmC2YHYsiDYqNin2YTZh9mI2KfYoSk=') or WIrlNEVOHFSwONkSxPj('skdvcjrwcbXSoMMFNiDfjMAryIYMSRsPBzznmQjiyzGOxabOQkPrAar2YXYudi32YQ='), Duration = 2})
        end
    })

    Tabs.Player:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('fvjqLutsuGqpWaRKyTXbWAJcATGoGFgCmaSbKoDeJXkHhcrprznaAsl2YXZhti5INil2KjYt9in2KEg2KfZhNi02K7YtdmK2KkgKEFudGktU2xvdyk='),
        Callback = function()
            RunService.Heartbeat:Connect(function()
                if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('TaseEjzEYIcKuHDURmeoucYtpkXDyDQWXWrtupIacPkgEhEUNWNTPnvSHVtYW5vaWQ=')) then
                    Player.Character.Humanoid.WalkSpeed = Options.SpeedSlider and Options.SpeedSlider.Value or 16
                end
            end)
            Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('jNyrBcisvQlnuOXfuRWRJhaoeOpVAZGNTGjrBtrwnRlgMeUPeNAjiqfQW50aS1TbG93'), Content = WIrlNEVOHFSwONkSxPj('YllybxICwXnNDpJGydsjPmnUqIURQtvRRnpMDJUgVylYtNAbDuNenuS2YXZgdi52YQh'), Duration = 2})
        end
    })

    local Noclip = false
    Tabs.Player:AddToggle(WIrlNEVOHFSwONkSxPj('jyMKWlLeLLgtsUJefCSwgWZHmlSGuUaOrupOYfeOEoJbcvtuKwQETfKTm9jbGlwVG9nZ2xl'), {
        Title = WIrlNEVOHFSwONkSxPj('GYsGvmoaYmaJOuDjGfUzZzWWeuhJKNLWgqMilNOEXNDlSGoQzClTUjO2KfYrtiq2LHYp9mCINin2YTYrNiv2LHYp9mGIChOb2NsaXAp'), Default = false,
        Callback = function(Value)
            Noclip = Value
            RunService.Stepped:Connect(function()
                if Noclip and Player.Character then
                    for _, child in pairs(Player.Character:GetDescendants()) do
                        if child:IsA(WIrlNEVOHFSwONkSxPj('XKDufhkaQbfxdVaMFFuUuUyJaPrQTExNhylaZEAdKoYthXjNIilBofgQmFzZVBhcnQ=')) then child.CanCollide = false end
                    end
                end
            end)
        end
    })

    -- ==================== Ø§ÙØ§Ø³ØªÙØ¯Ø§Ù ====================
    local targetedPlayerObj = nil
    local isFlinging = false
    local flingConnection = nil

    local targetInfoParagraph = Tabs.Target:AddParagraph({
        Title = WIrlNEVOHFSwONkSxPj('KXjjiheHVxTkPKxDImhJmqVMDoUePrjklalOoUrvpjdqUnOpOGuzndK2KfZhNmE2KfYudioINin2YTZhdiz2KrZh9iv2YE6INmE2Kcg2YrZiNis2K8='),
        Content = WIrlNEVOHFSwONkSxPj('ntMDiLOsZJkUDaddwIUCXVFkwJqKqmhrsodYREbjPmclMKyZazDDSGV2YLZhSDYqNmD2KrYp9io2Kkg2KfYs9mFINin2YTZhNin2LnYqCDYqNin2YTYo9iz2YHZhCDZhNin2K7YqtmK2KfYsdmHLg==')
    })

    local targetAvatarImage = Instance.new(WIrlNEVOHFSwONkSxPj('NUHnflSKiEDCKMKjsAWUFhqBgcaeuDQfzTlTYnqUhZgFLvwFVCZIGWSSW1hZ2VMYWJlbA=='))
    targetAvatarImage.Size = UDim2.new(0, 50, 0, 50)
    targetAvatarImage.Position = UDim2.new(1, -60, 0, 10)
    targetAvatarImage.BackgroundTransparency = 1
    targetAvatarImage.Visible = false
    targetAvatarImage.ZIndex = 10

    local imgCorner = Instance.new(WIrlNEVOHFSwONkSxPj('YLZPbHCIsFHJtmJhRVVuIiESeObhvRfkdpIumppdbDviZtZZievITqMVUlDb3JuZXI='), targetAvatarImage)
    imgCorner.CornerRadius = UDim.new(0, 8)

    task.spawn(function()
        task.wait(0.5)
        local gui = Player:WaitForChild(WIrlNEVOHFSwONkSxPj('HynIkAlpLfhAHvsVNjOvVVswGwLRxsXdJUoKhDpmOxEbkISCNYoQNeGUGxheWVyR3Vp')):FindFirstChild(WIrlNEVOHFSwONkSxPj('kHUeEfVuYrxSKkaYpDpriboTVLgoANVtTHggpgzRFPqJwOkcafZctKGRmx1ZW50VUk=')) or game:GetService(WIrlNEVOHFSwONkSxPj('fqZbcRlNzoUcDDpoLTgaMRbDNQVkpPSCqelhoBPvhnbEndgZqGcTUidQ29yZUd1aQ==')):FindFirstChild(WIrlNEVOHFSwONkSxPj('jzEFdtXCIOAUcrHvBVvDKnkKtADymWlsWGbAyUuKOgaWNkWdFoZugKCRmx1ZW50VUk='))
        if gui then
            local targetTabFrame = gui:FindFirstChild(WIrlNEVOHFSwONkSxPj('ioQwhsZYJzZyEVDZsGQPrtioFXdmFoHwknzoFEfsiQanXPdkQnSAqcMVGFyZ2V0'), true)
            if targetTabFrame then
                local paragraphContainer = targetTabFrame:FindFirstChildOfClass(WIrlNEVOHFSwONkSxPj('DZKpUjCxqbGgvaCRHjWrHAxfADBHUmNIEXJhCeOENSPgyMjvuJlNFcKRnJhbWU=')) or targetTabFrame
                targetAvatarImage.Parent = paragraphContainer
            end
        end
    end)

    Tabs.Target:AddInput(WIrlNEVOHFSwONkSxPj('eEFdSjVyCSlYViWnuMXBBWIqJtPqTZcFVRJZVJqshqTKVOwmJtmOOygVGFyZ2V0SW5wdXQ='), {
        Title = WIrlNEVOHFSwONkSxPj('DVILXptepPSUwiybYLbwpchtHfMVYjBIvfodipwYQnTrlDYBgVVhepW2KfZg9iq2Kgg2KfYs9mFINin2YTZhNin2LnYqCDYo9mIINij2YjZhCDYrdix2YEg2YXZhtmH'),
        Default = WIrlNEVOHFSwONkSxPj('tuCNoHDSGVfqBVVZqIvKQceSxTfFgbasAQoSxeMIJvOCbFcGIrIGuUL'), Placeholder = WIrlNEVOHFSwONkSxPj('AeLyncNsTnVPxkdBPmfEMlltDtOTgtXYCXrOwTceielooypvSKynBpX2KfYs9mFINin2YTZhNin2LnYqC4uLg=='),
        Numeric = false, Finished = true,
        Callback = function(Value)
            targetedPlayerObj = nil
            if Value ~= WIrlNEVOHFSwONkSxPj('PKlildfRDsfUcjLSQqSosFgSrxKKCaOIuyriQWDmgLTmWsRONZoRWXT') then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= Player then
                        if string.sub(string.lower(p.Name), 1, #Value) == string.lower(Value) or string.sub(string.lower(p.DisplayName), 1, #Value) == string.lower(Value) then
                            targetedPlayerObj = p
                            break
                        end
                    end
                end
            end

            if targetedPlayerObj then
                targetInfoParagraph:SetTitle(WIrlNEVOHFSwONkSxPj('yGbyPtrWmVJyBJwSMjQoSGFhvTxckDKnKiJIRShjZuVdyLxRwuCJiXd8J+OryDYp9mE2YXYs9iq2YfYr9mBOiA=') .. targetedPlayerObj.DisplayName)
                targetInfoParagraph:SetDesc(WIrlNEVOHFSwONkSxPj('PZYpvlnGVTjHUChpZpzKgvfDEfCGzyeiuMvxMvkDHHfuRhqEcDiMqmQQA==') .. targetedPlayerObj.Name)
                
                task.spawn(function()
                    local content, isReady = Players:GetUserThumbnailAsync(
                        targetedPlayerObj.UserId,
                        Enum.ThumbnailType.HeadShot,
                        Enum.ThumbnailSize.Size100x100
                    )
                    if isReady then
                        targetAvatarImage.Image = content
                        targetAvatarImage.Visible = true
                    end
                end)

                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('eJTmnPetJWLUTnekatykRAkOeJipPQyHpfGneJEAXvmTzVYaBPqxdoL2KrZhSDYp9mE2KrYrdiv2YrYrw=='), Content = WIrlNEVOHFSwONkSxPj('ocsThuCtzEefKfhXSZhspwHcphYGwtUGuONxGVaJcnrvlHWQKFvjQfy2KfZhNmE2KfYudioOiA=') .. targetedPlayerObj.Name, Duration = 2})
            else
                targetInfoParagraph:SetTitle(WIrlNEVOHFSwONkSxPj('rCSkCPwvZjuBVKGAkjUZKpDRgbnJoUROAGPWiIJRNbACLHUNKCmOaJi2KfZhNmE2KfYudioINin2YTZhdiz2KrZh9iv2YE6INmE2Kcg2YrZiNis2K8='))
                targetInfoParagraph:SetDesc(WIrlNEVOHFSwONkSxPj('vkVXeGwERzZKqhmHiKIjOYuacPJklekdjmcpWYFUAggPFKBRLdKIrvV2YLZhSDYqNmD2KrYp9io2Kkg2KfYs9mFINin2YTZhNin2LnYqCDYqNin2YTYo9iz2YHZhCDZhNin2K7YqtmK2KfYsdmHLg=='))
                targetAvatarImage.Visible = false
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('vnIPabLHCaUtgNimLJFHjXjdAicOZuKgtsQZzYvQmntWXvnroUgaPHy2K7Yt9ij'), Content = WIrlNEVOHFSwONkSxPj('PbZWLnumvQVHVLnriugznInKywXkeXNElEQvXswfVOlmxVacSTwQDax2YTZhSDZitiq2YUg2KfZhNi52KvZiNixINi52YTZiSDYp9mE2YTYp9i52Kgh'), Duration = 2})
            end
        end
    })

    Tabs.Target:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('FjREfXcHseREatUboktjhAsWdVYIQCvOAYHkNXJXSUocQLRoKgPiLlV8J+TjSDYp9mG2KrZgtin2YQg2KXZhNmJINin2YTZhNin2LnYqCAoVGVsZXBvcnQp'),
        Callback = function()
            if targetedPlayerObj and targetedPlayerObj.Character and targetedPlayerObj.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('ckzQKTBxxUZKVVUCydWqfLXmKEMxvxLbElyzCsodpNGCFFvnwxvWVUESHVtYW5vaWRSb290UGFydA==')) then
                if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('lmHPZDDlvxmUwlQaKxwzPxrieHbZPUGdYhzUCFQkoQpuenJsqXHlFbnSHVtYW5vaWRSb290UGFydA==')) then
                    Player.Character.HumanoidRootPart.CFrame = targetedPlayerObj.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                    Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('WdSFhFTdaxsuqDMorngVcdsLtABnlzchuSYuCvfWKXnrldBviurUpfCVGVsZXBvcnQ='), Content = WIrlNEVOHFSwONkSxPj('RiydLwJJCsJPhhmVZmRSkRvxjomxzfhyuKcrlgADYIMUxILWeRdgUmG2KrZhSDYp9mE2KfZhtiq2YLYp9mEINio2YbYrNin2K0='), Duration = 2})
                end
            else
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('NVAabDPrxyvkmxiiNNOSVUpnvVjBGfalNidKIGnxtbgpuxByxIEPpKq2K7Yt9ij'), Content = WIrlNEVOHFSwONkSxPj('LunCpJqisNFZUfrbSGmmoktKzdYsiTiIBntHbPbLWnLNmrjHqskYVZd2KfYrtiq2LEg2YTYp9i52KjYp9mLINmF2YjYrNmI2K/Yp9mLINij2YjZhNin2Ysh'), Duration = 2})
            end
        end
    })

    local isSpectating = false
    Tabs.Target:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('ejzCLdVSVrjROJZlOqjXKnRILsrdWISnwKvgLcliJDmjhpyHhxZRUnX8J+Rge+4jyDZhdi02KfZh9iv2Kkg2KfZhNmE2KfYudioIChTcGVjdGF0ZSk='),
        Callback = function()
            isSpectating = not isSpectating
            if isSpectating and targetedPlayerObj and targetedPlayerObj.Character and targetedPlayerObj.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('KDoNlVIkNrsmofjfGyziMglJsvDsXZgGqVcGXpvTbFXcRkfmglhJSIHSHVtYW5vaWQ=')) then
                Camera.CameraSubject = targetedPlayerObj.Character.Humanoid
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('GDzhqGUeuMbcOqNbBolhATRJeFrkUuvDvUESyRcGMtTqLlqALCAZNTeU3BlY3RhdGU='), Content = WIrlNEVOHFSwONkSxPj('kTnuudwQCqbzhYJjDXXhVmFvglsvQcqLKcEWTPUgQYtINWNhReyWtwI2KzYp9ix2Yog2KfZhNmF2KrYp9io2LnYqS4uLg=='), Duration = 2})
            else
                isSpectating = false
                if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('sYROfCGjAQSrNrkwUksniRawVVZPHdUjRsQezZaCenizEEvIVBhEmPeSHVtYW5vaWQ=')) then
                    Camera.CameraSubject = Player.Character.Humanoid
                end
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('UrIlPiTccGhnlMDeUionSRSswStSyINzIGLXXbdXTtFDveqVKJPOqULU3BlY3RhdGU='), Content = WIrlNEVOHFSwONkSxPj('bfeMjjFHiJoClugRrzvpGuFIAmxouduHHOmLDndtGZRldWOzbvGFnuK2KrZhSDYpdmK2YLYp9mBINin2YTZhdiq2KfYqNi52Kk='), Duration = 2})
            end
        end
    })

    Tabs.Target:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('aLSYZRkQYmtbSrfNLlekdayFvUwgFYNFeHdcGmebgnEkyiHiroCMphl8J+MgCDYqti02LrZitmEIC8g2KXZitmC2KfZgSDYp9mE2YHZhNmG2Kwg2YXYuSDYp9mE2KfZhtiq2YLYp9mEIChUUCBGbGluZyk='),
        Callback = function()
            isFlinging = not isFlinging
            
            if isFlinging then
                if not targetedPlayerObj or not targetedPlayerObj.Character or not targetedPlayerObj.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('hBSyyJdrEaZlEzjmLAuvcBpDiKyhXLwPfmqKhYegLrNBNTulaKCNdfXSHVtYW5vaWRSb290UGFydA==')) then
                    isFlinging = false
                    Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('hkafmEwjfjgFWAQApWnuBvfIKqKJytSwGyudIWeILRoLJcUTOqggyrP2K7Yt9ij'), Content = WIrlNEVOHFSwONkSxPj('AfrZLcUGbxNyrWXztIhUVvPSjvvEtzEkSkoMfKQeomGwnCJOYHGbUzT2KfYrtiq2LEg2YTYp9i52KjYp9mLINij2YjZhNin2Ysh'), Duration = 2})
                    return
                end

                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('VnPYgtYFqyfRkiyVKxGzuACmMSSOJyjkMguwvPUZWwgpqHETRiwZmfmRmxpbmc='), Content = WIrlNEVOHFSwONkSxPj('AMfWeAjUTuQrpdFqQujmhmatXwwTMBkjrHdJmiNXYYulGncbjckrEKc2KrZhSDYqtmB2LnZitmEINin2YTZgdmE2YbYrCDYqNin2YTYp9mG2KrZgtin2YQg2KfZhNmF2KjYp9i02LEh'), Duration = 3})
                
                local localHRP = Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('AHEqNoMfVfcEaJtBZZLwPHskLxtKgKutQKRPRpUWzjMonjrHXJPEoitSHVtYW5vaWRSb290UGFydA=='))
                local bav = Instance.new(WIrlNEVOHFSwONkSxPj('XLQEwdpsgLYvKPsSpRcAkJDglckUUsvoSTvtyCIZAVCPkjjQvwahmarQm9keUFuZ3VsYXJWZWxvY2l0eQ=='))
                bav.Name = WIrlNEVOHFSwONkSxPj('yaPIrqOitVuKItYUDnKbTxLjPGEcGjxzQBRGlqMgILlOKmqPrfqfayBRmxpbmdWZWxvY2l0eQ==')
                bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                bav.AngularVelocity = Vector3.new(0, 999999, 0)
                if localHRP then bav.Parent = localHRP end

                flingConnection = RunService.Heartbeat:Connect(function()
                    if isFlinging and targetedPlayerObj and targetedPlayerObj.Character and targetedPlayerObj.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('HbEohtirjEuizsAmQbzgHAmpCmzkLVnxanuPLKQrwilxGZbKyIwqXLuSHVtYW5vaWRSb290UGFydA==')) then
                        if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('dMMZBCQehhDtsNEocqBUmKUsRbmWqnCUvbsjDVwJHewhUDVwlHjkYZcSHVtYW5vaWRSb290UGFydA==')) then
                            local targetHRP = targetedPlayerObj.Character.HumanoidRootPart
                            local distance = (Player.Character.HumanoidRootPart.Position - targetHRP.Position).Magnitude
                            
                            if distance > 2 then
                                Player.Character.HumanoidRootPart.CFrame = targetHRP.CFrame + Vector3.new(math.random(-1,1)/10, 0, math.random(-1,1)/10)
                            else
                                Player.Character.HumanoidRootPart.CFrame = targetHRP.CFrame
                            end
                            Player.Character.HumanoidRootPart.Velocity = Vector3.new(9999, 9999, 9999)
                        end
                    else
                        if flingConnection then flingConnection:Disconnect() end
                        if bav then bav:Destroy() end
                    end
                end)
            else
                if flingConnection then flingConnection:Disconnect() end
                if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('kcaRarDldfWVinORYULAbZLaZfSEsSsplpfZjVKJtnycJNcoRLFXNekSHVtYW5vaWRSb290UGFydA==')) and Player.Character.HumanoidRootPart:FindFirstChild(WIrlNEVOHFSwONkSxPj('NRLiSxpVmTmyAAsgcAByPQzplNnznOETUtXTdWFozQRLdWzHSPiMJlkRmxpbmdWZWxvY2l0eQ==')) then
                    Player.Character.HumanoidRootPart.FlingVelocity:Destroy()
                end
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('tuwPYNqQAHPrNQwMMVsUQNNaAqVKfuKgpJzTlLvZSByUtwqGgsdeIbBRmxpbmc='), Content = WIrlNEVOHFSwONkSxPj('DqIBENqTgQfKnoWlpBqhBRHGwwfdrdJfCiPkdjfEAeXhgXPLZnRdbOh2KrZhSDYpdmK2YLYp9mBINin2YTZgdmE2YbYrC4='), Duration = 2})
            end
        end
    })

    Tabs.Target:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('jRHzyJmcRGGgxygoZEnIWOvgNuPRUcnuDgjOGevBlZQFhtErUmrtDZS8J+TiyDZhtiz2K4g2KfYs9mFINin2YTZhNin2LnYqCDYp9mE2YXYs9iq2YfYr9mB'),
        Callback = function()
            if targetedPlayerObj and setclipboard then
                setclipboard(targetedPlayerObj.Name)
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('nxtqtRggzZLwSwEBdFEwzTpxrWTYpBVLmrRtAyaWZtJpdqskdxOiwVHQ29waWVk'), Content = WIrlNEVOHFSwONkSxPj('oEPKmkuZwcsIystSRkdpoPjXDPnanUlduCnmEkCLcHuwMNBHIragnOO2KrZhSDYp9mE2YbYs9iuOiA=') .. targetedPlayerObj.Name, Duration = 2})
            end
        end
    })
    Tabs.Target:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('ObkLlVpDKmmhRcpCYkqmlVBIGVgYndaliXAWuRziqWSzdhkVMnWtscG8J+UhCDYpdi52KfYr9ipINiq2LnZitmK2YYg2KfZhNin2LPYqtmH2K/Yp9mB'),
        Callback = function()
            targetedPlayerObj = nil
            isFlinging = false
            if flingConnection then flingConnection:Disconnect() end
            targetInfoParagraph:SetTitle(WIrlNEVOHFSwONkSxPj('NoAfedmRlODIBBAsuxxGuGpeTMhHiRuZdceKWSnzBAXFdUNGyNxXlDM2KfZhNmE2KfYudioINin2YTZhdiz2KrZh9iv2YE6INmE2Kcg2YrZiNis2K8='))
            targetInfoParagraph:SetDesc(WIrlNEVOHFSwONkSxPj('fzfeQbCvOEEODapVtMzIWgaFDudZdPbjhyxVDPXVSycpRdGmsRKTGoo2YLZhSDYqNmD2KrYp9io2Kkg2KfYs9mFINin2YTZhNin2LnYqCDYqNin2YTYo9iz2YHZhCDZhNin2K7YqtmK2KfYsdmHLg=='))
            targetAvatarImage.Visible = false
            Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('GQOtdDxUWooNDXhQPSkIxHoqyuwsAKmVcRWkhnftTasNxmjppoOMlGaUmVzZXQ='), Content = WIrlNEVOHFSwONkSxPj('AHdOQxvnOgCuqiOPhPJzTBdWRvZfSPgzHOzJAZEQDWpZOfRsMyZCksa2KrZhSDYpdi52KfYr9ipINin2YTYqti52YrZitmG'), Duration = 2})
        end
    })

    -- ==================== ÙØ§Ø¦ÙØ© Ø§ÙØªØ®Ø±ÙØ¨ ====================
    local isFlingingAll = false
    Tabs.Troll:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('pEmTBEjTQcEZbgZaEAymWRjREamwnXejvdBxGreKZvIrIhiopPUHnFp8J+MgCDZgdmE2YbZgiDYp9mE2YPZhCAoRmxpbmcgQWxsIFBsYXllcnMp'),
        Callback = function()
            isFlingingAll = not isFlingingAll
            
            if isFlingingAll then
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('cyAmTddeboQRJSSYWkWwPMmLPXGjBPgQHMvBdBVXbZjWNBaGcRBfCTVRmxpbmcgQWxs'), Content = WIrlNEVOHFSwONkSxPj('PSmVdsgySFLyGddnPmOquMGkHaMnpzVJMgWJMCgkAGJRpVzFggaYpBO2KjYr9ijINmB2YTZhtmCINis2YXZiti5INin2YTZhNin2LnYqNmK2YYgKDUg2KvZiNin2YbZjSDZhNmD2YQg2YTYp9i52KgpIQ=='), Duration = 3})
                
                task.spawn(function()
                    local allPlayers = Players:GetPlayers()
                    for _, p in pairs(allPlayers) do
                        if not isFlingingAll then break end
                        
                        if p ~= Player and p.Character and p.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('yJDpEgWQVywoIbKhJZLBzhHzylEevpqWvTCWMQOkgkQJKSwHRulciNjSHVtYW5vaWRSb290UGFydA==')) then
                            local localHRP = Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('hpzrZUGmNDGViddOWmrLINNlZQHwYtRcwJbuEkQOOvTDhvMrvcmMoqRSHVtYW5vaWRSb290UGFydA=='))
                            if localHRP then
                                local bav = Instance.new(WIrlNEVOHFSwONkSxPj('xDLKwkOPuMIzbVlWbuCYSKwjKjdjUlUblEDrIMKhjkrHFMEcjwybQSSQm9keUFuZ3VsYXJWZWxvY2l0eQ=='))
                                bav.Name = WIrlNEVOHFSwONkSxPj('JGagNWELiROGebLOjKYcKAPIAzXblKEMuhXBamHSweDazzPgiVkvyFJRmxpbmdBbGxWZWxvY2l0eQ==')
                                bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                                bav.AngularVelocity = Vector3.new(0, 999999, 0)
                                bav.Parent = localHRP

                                local startTime = tick()
                                local conn
                                conn = RunService.Heartbeat:Connect(function()
                                    if isFlingingAll and (tick() - startTime < 5) and p.Character and p.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('eVVeBMMiQvQOqcsUXxDyZDaAzMmvWrHzAlCbVIWGSnywgCstYedRGUiSHVtYW5vaWRSb290UGFydA==')) and Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('URnMRpskALYhIzAPXKUJHdnbGaHozjPvMqMkTKVmSSJOFhIABKZcWGhSHVtYW5vaWRSb290UGFydA==')) then
                                        local targetHRP = p.Character.HumanoidRootPart
                                        Player.Character.HumanoidRootPart.CFrame = targetHRP.CFrame + Vector3.new(math.random(-1,1)/10, 0, math.random(-1,1)/10)
                                        Player.Character.HumanoidRootPart.Velocity = Vector3.new(9999, 9999, 9999)
                                    else
                                        if conn then conn:Disconnect() end
                                        if bav then bav:Destroy() end
                                    end
                                end)

                                task.wait(5)
                                if conn then conn:Disconnect() end
                                if bav then bav:Destroy() end
                            end
                        end
                    end
                    
                    isFlingingAll = false
                    Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('fRdCUeTPVWuotUuRMxiMYYnvommnMSMxauDQNkbUqBIsWHBOskyOYxQRmxpbmcgQWxs'), Content = WIrlNEVOHFSwONkSxPj('nfkamfAKLKhLBJFAKyOpzdZwykevTzoUFklodhECUIDUKZujuIvkMST2KrZhSDYp9mE2KfZhtiq2YfYp9ihINmF2YYg2YHZhNmG2YIg2KfZhNis2YXZiti5IQ=='), Duration = 3})
                end)
            else
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('eNWQsGuaCsKmiljxJpxlcHZinMjnoUpDutQzXKBWPjcVoHbrYTwFfucRmxpbmcgQWxs'), Content = WIrlNEVOHFSwONkSxPj('EtbkHEMiRxBxhKNwIdhujNMeTBclWxaGnFopzpNLdDXgZDxAsKcVMrp2KrZhSDYpdmK2YLYp9mBINmB2YTZhtmCINin2YTZg9mELg=='), Duration = 2})
            end
        end
    })

    -- Ø³Ø¨Ø§Ù Ø§ÙØ´Ø§Øª
    local spamMessage = WIrlNEVOHFSwONkSxPj('CyrNMHJlDgpEcldFIbUkItJAiNiuRuLaXnDyCjgzTcIHwkLQvsEpVRnS0xEIEhVQiBPTiBUT1Ag4pqh')
    local spamDelay = 1
    local isSpamming = false

    local function SendChatMessage(msg)
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local textChannel = TextChatService.TextChannels.RBXGeneral
            if textChannel then
                textChannel:SendAsync(msg)
            end
        else
            local defaultChat = ReplicatedStorage:FindFirstChild(WIrlNEVOHFSwONkSxPj('uHtVqbUrBrwbtytencLWlDPneuxASxkQGWRllAFyOMmTbwQYltpoRwrRGVmYXVsdENoYXRTeXN0ZW1DaGF0RXZlbnRz'))
            if defaultChat and defaultChat:FindFirstChild(WIrlNEVOHFSwONkSxPj('biZYijAFMnmkTdJOGQFqgsutlUSOneMsIeskeljclszuEOENJfIESHFU2F5TWVzc2FnZVJlcXVlc3Q=')) then
                defaultChat.SayMessageRequest:FireServer(msg, WIrlNEVOHFSwONkSxPj('kOLFfjktrWHAxiePEpqOylKREvYiiHHjZeAHVGiPdbORDnEOQJnkBJrQWxs'))
            end
        end
    end

    Tabs.Troll:AddInput(WIrlNEVOHFSwONkSxPj('LzvqUJymggNHxSNqpTBCCHzqcZmMReOMonhLXPqjQnDFFPggJdLfyaPU3BhbUlucHV0'), {
        Title = WIrlNEVOHFSwONkSxPj('DEwVooGWfaMMDdAaxSHLGvXScHjpBfujWMvqTRJvkoqRAlghuHqrpnd2LHYs9in2YTYqSDYp9mE2LPYqNin2YU='),
        Default = WIrlNEVOHFSwONkSxPj('bqvwzObAnITHnnlQuQMsddSEgBYiGstAXHEMQCJOwJGgJlONLzhkJULS0xEIEhVQiBPTiBUT1Ag4pqh'),
        Placeholder = WIrlNEVOHFSwONkSxPj('VlgNXCtQICHtSNqKViAJyPSaNumfiUcGcyDoWTcUgmQNLgQpgveOGKa2KfZg9iq2Kgg2KfZhNix2LPYp9mE2Kkg2YfZhtinLi4u'),
        Numeric = false,
        Finished = true,
        Callback = function(Value)
            if Value ~= WIrlNEVOHFSwONkSxPj('FzyMnmgkuKBbVKDMHHcjegczjteiENaLlHxuUGgxtEBYewQtKeZUkak') then
                spamMessage = Value
            end
        end
    })

    Tabs.Troll:AddSlider(WIrlNEVOHFSwONkSxPj('jKnTQnexQNdHJCmPkATtztdjtGaGuKLXBLDWLcnVAJlKpMvtpNPZFGQU3BhbURlbGF5U2xpZGVy'), {
        Title = WIrlNEVOHFSwONkSxPj('yFIzJjIuerrFtZSEROTFccDpgqbzDxmOOrmKijvPtNePcrIgfxMdIZY2KfZhNiz2LHYudipINio2YrZhiDYp9mE2LHYs9in2KbZhCAo2KjYp9mE2KvZiNin2YbZiik='),
        Default = 1,
        Min = 0.5,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            spamDelay = Value
        end
    })

    Tabs.Troll:AddToggle(WIrlNEVOHFSwONkSxPj('wlvGWEaqikuVKGyxftrfexfpafMmBkIbhINveWwmuIEMKhrGMeweswSU3BhbVRvZ2dsZQ=='), {
        Title = WIrlNEVOHFSwONkSxPj('sGGoqmOGWvnYBMDARVACWDFlgcFbvAyiaKqAkYXehRhZMqpOWMofTyE2KrYtNi62YrZhCAvINil2YrZgtin2YEg2LPYqNin2YUg2KfZhNi02KfYqg=='),
        Default = false,
        Callback = function(Value)
            isSpamming = Value
            if isSpamming then
                task.spawn(function()
                    while isSpamming do
                        SendChatMessage(spamMessage)
                        task.wait(spamDelay)
                    end
                end)
            end
        end
    })

    -- ==================== Ø§ÙØ³ÙØ±Ø¨ØªØ§Øª ====================
    Tabs.Library:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('oaBQXikmMwTWeHCMBwMVBLixnIsdpgRaSITdkjaSnwCvQWVMgbnxJDQ8J+SgyDYs9mD2LHYqNiqINix2YLYtdin2KogKEVtb3Rlcyk='),
        Callback = function()
            loadstring(game:HttpGet(WIrlNEVOHFSwONkSxPj('HBHnIlMfWyfBDAwDHazLAOyRmngmLDYtzAWohPBgSwNTGSUJJJvDzvfaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tLzd5ZDcvSHViL3JlZnMvaGVhZHMvQnJhbmNoL0dVSVMvRW1vdGVzLmx1YQ==')))()
        end
    })

    Tabs.Library:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('hRkxGYSFEygaaCvvxJZQGdKclvHoTdvnBDpvXNSgdttHBLeATsJykiU4pqhINiq2LTYutmK2YQgSW5maW5pdGUgWWllbGQg2KfZhNij2LXZhNmK'),
        Callback = function()
            loadstring(game:HttpGet(WIrlNEVOHFSwONkSxPj('SDFyENfceWLLzDdkqaYjxkUYEQJyLtjiLusDGaIlZRRIUmLFwBfUbQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0VkZ2VJWS9pbmZpbml0ZXlpZWxkL21hc3Rlci9zb3VyY2U=')))()
        end
    })

    Tabs.Library:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('nbqpBrGlUZqIBlzOgGyTXHQrFtxsnCKnqXJCdXJzgYcyaoBUWDnJger8J+Viu+4jyBmbHkgZ3VpIFYxMQ=='),
        Callback = function()
            loadstring(game:HttpGet(WIrlNEVOHFSwONkSxPj('UYuSxAkakyAqfBPqPPxVGUktgbxJVqoYEyGKrXioKjWhVQtaWgehFllaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3NlR2JlNnRu')))()
        end
    })

    Tabs.Library:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('gCTnRDbRCxTnIgeJgmXCaKTgjxsFBaaCQqoVwczqSNaHyOIsSuBCRqF8J+UjSDZgdiq2K0g2KPYr9in2KkgRGV4IEV4cGxvcmVyINin2YTZhdi52KrZhdiv2Kk='),
        Callback = function()
            loadstring(game:HttpGet(WIrlNEVOHFSwONkSxPj('oBlSshnSeboOdFipucRYafpawuicLMTdNRtZpJaPgZGiDcBHQTWrOmLaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2luZnlpZmYvYmFja3VwL21haW4vZGV4Lmx1YQ==')))()
        end
    })

    -- ==================== Ø£Ø®Ø±Ù ====================
    Tabs.Misc:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('UvlYJXNTCsZpHqAeSpOYAvqyJOHlpqQrZwVMNyERnxSrSDOjFgmHwYy2KfZhNin2YbYqtmC2KfZhCDZhNiz2YrYsdmB2LEg2KLYrtixIChTZXJ2ZXIgSG9wKQ=='),
        Callback = function()
            local PlaceId = game.PlaceId
            local Servers = HttpService:JSONDecode(game:HttpGet(WIrlNEVOHFSwONkSxPj('GWXLPrbzpUXIcoyOOHkbBiSXuzuiDpbpTaNhCWWYCvXIBBCNAIdZsTyaHR0cHM6Ly9nYW1lcy5yb2Jsb3guY29tL3YxL2dhbWVzLw==') .. PlaceId .. WIrlNEVOHFSwONkSxPj('gNMzEmWlqZKdSteMOvGVaxfgtSyZaVeHntcpJXORPKtRzMBcqUnQJESL3NlcnZlcnMvUHVibGljP3NvcnRPcmRlcj1Bc2MmbGltaXQ9MTAw'))).data
            for _, s in pairs(Servers) do
                if s.id ~= game.JobId and s.playing < s.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(PlaceId, s.id, Player)
                    break
                end
            end
        end
    })
    Tabs.Misc:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('VVJefWUoDsjJAgGMITIDFJyCajRvxmYtjDzpOhQDXuuAZhqqhFuqkzZ2KrZgdi52YrZhCDZhdmG2Lkg2KfZhNi32LHYryAoQW50aS1BRksp'),
        Callback = function()
            local VU = game:GetService(WIrlNEVOHFSwONkSxPj('hpHxVKyGsTEdnNcwwgxDHDmfCIRMbXLTfcXXtFmYyFgENzfncocdMFyVmlydHVhbFVzZXI='))
            Player.Idled:Connect(function()
                VU:CaptureController()
                VU:ClickButton2(Vector2.new())
            end)
            Fluent:Notify({ Title = WIrlNEVOHFSwONkSxPj('iJGxxyINVSRKoUaYhnJlWAjAxZMrPhUfCINUTjtujHkQJSJZtZlTwbfQW50aS1BRks='), Content = WIrlNEVOHFSwONkSxPj('qomHsEMlQLvJohmOCfzSQCUAHDxVStOLkLHCHxKiqNSkaeGQoMjwKFg2YXZgdi52YQh'), Duration = 2 })
        end
    })
    Tabs.Misc:AddButton({Title = WIrlNEVOHFSwONkSxPj('loUdtuqvywZaZeERciYXkOouNtTTBBvQIEikPcRbuwWlzhkMKMbhVEr2KXYudin2K/YqSDYpdit2YrYp9ihINin2YTYtNiu2LXZitipIChSZXNldCk='), Callback = function() if Player.Character and Player.Character:FindFirstChild(WIrlNEVOHFSwONkSxPj('uhKDZnIWGucfgZVLWdBKFBBUkXfXDBahsvFkCQRBNkAfivllThUrAeXSHVtYW5vaWQ=')) then Player.Character.Humanoid.Health = 0 end end})
    Tabs.Misc:AddButton({Title = WIrlNEVOHFSwONkSxPj('FdHgemRonkQUtBzYCMduQfsXhLVQaanhfRicNARnKZKxJxrWuflSony2KXYstin2YTYqSDYp9mE2LbYqNin2Kgg2KjYp9mE2YPYp9mF2YQ='), Callback = function() game:GetService(WIrlNEVOHFSwONkSxPj('gzhZActFlINenCgWXvjLrKqtjnLeIQVfZyYWucpADaHRHyiAGCnWOuCTGlnaHRpbmc=')).FogEnd = 9e9 Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('FtKikPRrXZdzKsBTHxcXxTvmyKrbzCCFYrmukFMaWADPeKojkECwHuMRm9n'), Content = WIrlNEVOHFSwONkSxPj('vZcGLygrTHVLdYoSXomUDeOkmAiSDRXfDuihCWDUGJDVcExpnGpldFk2KrZhdiqINil2LLYp9mE2Kkg2KfZhNi22KjYp9io'), Duration = 2}) end})
    Tabs.Misc:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('JGGyDDJnVxxwuzDjaFieEzrXGYZKrqHCTQmgMpLroqCMoxhlpYVBTVM8J+agCDYqtiz2LHZiti5INin2YTZhNi52KjYqSDZiNiq2YbYuNmK2YEg2KfZhNmAIExhZyAoRlBTIEJvb3N0ZXIp'),
        Callback = function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA(WIrlNEVOHFSwONkSxPj('sxsOygCbjBfcJhxQtncMKcYJSyihdqMMmMzYGiWpHlhjqnSnRYBqGUrUGFydGljbGVFbWl0dGVy')) or v:IsA(WIrlNEVOHFSwONkSxPj('kdXouxoficShCKsBXeGhBPaCiOmNVOzCvGCQcBtLmHqheRXKMiSXiKbU21va2U=')) or v:IsA(WIrlNEVOHFSwONkSxPj('PxIPyFjvgyhODNvnEsJttiApCuNQYCVwHNStNILjvGuRveXDRkJXAqsRmlyZQ==')) or v:IsA(WIrlNEVOHFSwONkSxPj('CsejOBxhhiyPFJOgegpYzryLzeWfRTWmBwjjKzeRHrUIDtvctYOqkUNU3BhcmtsZXM=')) then
                    v.Enabled = false
                end
            end
            Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('zhDMvryexfMtaGFujrLTOZIZFfmzGObgUiXBqfqhtDptxCrZxyuiSfYRlBTIEJvb3N0'), Content = WIrlNEVOHFSwONkSxPj('PTJWpbgJVgjsdvEfhJvNhDPAedopCFHLFZCWiXoyAivjiMrAGfDtSnM2KrZhSDYqtmG2LjZitmBINin2YTZhdik2KvYsdin2Kog2YTYqtiz2LHZiti5INin2YTZhNi52KjYqSE='), Duration = 2})
        end
    })
    Tabs.Misc:AddButton({
        Title = WIrlNEVOHFSwONkSxPj('oikJSLktMzFhOPgQWWABpEtgHYyiBJmJtqPcWcOjEShJEkKMQOEdtYZ8J+TiyDZhtiz2K4g2YXYudix2YEg2KfZhNiz2YrYsdmB2LEgKENvcHkgSm9iSWQp'),
        Callback = function()
            if setclipboard then
                setclipboard(game.JobId)
                Fluent:Notify({Title = WIrlNEVOHFSwONkSxPj('XuDkYLohXArbjNOgARfBINGjSvxQrEmTGrvKskLpmyVTyFgqyiedhneSm9iSWQ='), Content = WIrlNEVOHFSwONkSxPj('SZrRqNEkqRSdrAmIfbmcUzlcfInUcilWsmajvDLLWkxuBTdjUJArswz2KrZhSDZhtiz2K4g2YXYudix2YEg2KfZhNiz2YrYsdmB2LEh'), Duration = 2})
            end
        end
    })

    -- Ø¥Ø´Ø¹Ø§Ø± Ø§ÙØ¨Ø¯Ø¡
    Fluent:Notify({ Title = WIrlNEVOHFSwONkSxPj('tZlvYagXuEBiLIwyWyuheBvOEVclDgUlyPbhhMwbWdaVuTETLMEzAnOS0xEIEhVQiDimqE='), Content = WIrlNEVOHFSwONkSxPj('mRrTrdTWdegsqwrgUpjBWJHKusVjAnagtMEriQBAcDDjOexdLxBaSEx2KrZhSDYqti02LrZitmEINin2YTYs9mD2LHYqNiqINio2YbYrNin2K0h'), Duration = 4 })
end)

if not success then
    warn(WIrlNEVOHFSwONkSxPj('LwmBfnDzmtuSSxqFXfdNESWJHlnNiPytypMWVyARedEoGQdyGOTghvB2K7Yt9ijINmB2Yog2KrYtNi62YrZhCDYp9mE2LPZg9ix2KjYqjog') .. tostring(err))
end
     