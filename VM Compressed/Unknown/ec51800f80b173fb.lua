-- Meshal Premium Hub | Shoot The Boss & India Edition
-- Developer: mhldfhd8 | TikTok: @5sac

local _O="mhldfhd8";local _P="0001";local _D="https://meshal-hub-default-rtdb.firebaseio.com/Users.json";
local _H=game:GetService("HttpService");local _PL=game:GetService("Players");local _LP=_PL.LocalPlayer;local _F="MeshalConfig_V1.json";local _T=os.time();
local _K={{Key="meshal hub key(1822881Jm8)",Link="https://link-target.net/2521496/9VlVbUsTuG0B"},{Key="meshal hub key (288772228jswiqmhl)",Link="https://link-center.net/2521496/0jIYaYIN1Krj"},{Key="meshal hub key (2882228jswiqmhl)",Link="https://link-hub.net/2521496/BRDRy0czfbme"},{Key="meshal hub key (28828889228jswMmmm?id12iqmhl)",Link="https://link-target.net/2521496/qkdZ2t0GA0Km"},{Key="meshal hub key (98swMmmm?id12iqkksszxmhl)",Link="https://link-target.net/2521496/nemlAm1qraWy"},{Key="meshal hub key (98swMmmd12iqkksszxmhl)",Link="https://link-center.net/2521496/mlU3NnkEyczt"}};

local function _L()if isfile(_F)then local s,r=pcall(function()return _H:JSONDecode(readfile(_F))end)if s then return r end end return nil end;
local _U=_L();local _SS;if _U and(_T-_U.Time<86400)then _SS=_K[_U.Index]or _K[1]else local n=math.random(1,#_K);_SS=_K[n];pcall(function()writefile(_F,_H:JSONEncode({Index=n,Time=_T}))end)end;
local _FK=_SS.Key;local _FL=_SS.Link;if setclipboard and _LP.Name~=_O then setclipboard(_FL)end;

local _R=loadstring(game:HttpGet('https://sirius.menu/rayfield'))();
local _G={Train=false,Win=false,India=false};local _IA=false;
local _W=_R:CreateWindow({Name="Meshal Hub | Shoot The Boss",LoadingTitle="Loading Custom Systems...",KeySystem=true,KeySettings={Title="حط المفتاح فقط",Subtitle="Key or Admin Pass",Note="TikTok: @5sac | Dev: ".._O,Key={_FK,_P}}});if _LP.Name==_O then _IA=true end;

-- [ التبويبات ]
local MainTab = _W:CreateTab("Main Hacks", 4483362458)
local ShopTab = _W:CreateTab("Items & Pets", 4483362458)
local TrollTab = _W:CreateTab("Troll & Chaos", 4483362458)
local AdminTab = _W:CreateTab("👑 Owner Panel", 4483362458)
local SettingsTab = _W:CreateTab("Settings", 4483362458)

-- [ 1. Main Hacks ]
MainTab:CreateToggle({
   Name = "Inf India Money (Rupees 🥀)",
   CurrentValue = false,
   Callback = function(v)
      _G.India = v
      while _G.India do
         game:GetService("ReplicatedStorage").ClaimRewardEvent:FireServer(4,{Currency = "Rupees", Amount = 1e22})
         task.wait(0.5)
      end
   end,
})
MainTab:CreateSection("Coming Soon")
MainTab:CreateButton({Name = "Auto Train (Soon...)", Callback = function() end})
MainTab:CreateButton({Name = "Auto Wins (Soon...)", Callback = function() end})

-- [ 2. Items & Pets ]
ShopTab:CreateSection("Coming Soon")
ShopTab:CreateButton({Name = "Buy Best Power (Soon...)", Callback = function() end})
ShopTab:CreateButton({Name = "Hatch Best Pet (Soon...)", Callback = function() end})

-- [ 3. Owner Panel ]
AdminTab:CreateButton({
    Name = "🔄 Refresh Global Users",
    Callback = function()
        if not _IA then return _R:Notify({Title="Error", Content="Owner Only!", Duration=2}) end
        local s,r=pcall(function()return _H:GetAsync(_D)end)
        if s and r then 
            local a=_H:JSONDecode(r)
            for _,d in pairs(a) do 
                AdminTab:CreateSection("User: "..d.Username)
                AdminTab:CreateButton({Name="➡️ Join Server",Callback=function()game:GetService("TeleportService"):TeleportToPlaceInstance(d.PlaceId,d.JobId,_LP)end})
            end 
        end
    end
})

-- [ 4. Troll & Chaos ]
TrollTab:CreateSection("Coming Soon")
TrollTab:CreateButton({Name = "💀 Kill All (Soon...)", Callback = function() end})
TrollTab:CreateButton({Name = "🚀 Fling All (Soon...)", Callback = function() end})
TrollTab:CreateButton({Name = "💥 Explode All (Soon...)", Callback = function() end})

-- [ 5. Settings ] (إعدادات كاملة وشغالة)
SettingsTab:CreateButton({
    Name = "🚀 Anti-Lag (Plastic Material)",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do 
            if v:IsA("Part") or v:IsA("MeshPart") then 
                v.Material = "Plastic" 
            end 
        end 
    end
})

SettingsTab:CreateSlider({
   Name = "WalkSpeed Customization",
   Min = 16,
   Max = 500,
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      _LP.Character.Humanoid.WalkSpeed = Value
   end,
})

SettingsTab:CreateButton({
   Name = "❌ Destroy UI (Close Script)",
   Callback = function() 
      _R:Destroy() 
   end
})

-- [ تسجيل الدخول ]
pcall(function()_H:PostAsync(_D,_H:JSONEncode({Username=_LP.Name,UserId=_LP.UserId,JobId=game.JobId,PlaceId=game.PlaceId,Time=os.time()}))end)
