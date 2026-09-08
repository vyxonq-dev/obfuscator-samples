-- ====================================================================
-- === 1. شاشة التحميل المخصصة (Loader Screen) - [بالتعديلات الجديدة] ===
-- ====================================================================

local shared = {}
shared.LoaderTitle = "Clan DIX Hub";
local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = { Main = Color3.fromRGB(15, 15, 15), Topic = Color3.fromRGB(0, 255, 0), Title = Color3.fromRGB(255, 255, 255), LoaderBackground = Color3.fromRGB(30, 30, 30), LoaderSplash = Color3.fromRGB(0, 150, 255), }
    }
};
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
function TweenObject(v178, v179, v180) return TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180) end
function CreateObject(v181, v182) local v183 = Instance.new(v181); local v184; for v416, v417 in pairs(v182) do if (v416 ~= "Parent") then v183[v416] = v417; else v184 = v417; end end v183.Parent = v184; return v183; end
local function v4(v186, v187) local v188 = Instance.new("UICorner"); v188.CornerRadius = UDim.new(0, v186); v188.Parent = v187; end

local v5 = CreateObject("ScreenGui", { Name = "CoreLoader", Parent = game.CoreGui, ZIndexBehavior = Enum.ZIndexBehavior.Sibling })
local v6 = CreateObject("Frame", { Name = "Main", Parent = v5, BackgroundColor3 = v2.LoaderData.Colors.Main, BorderSizePixel = 0, ClipsDescendants = true, Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.new(0, 0, 0, 0) }); v4(12, v6);
local v7 = CreateObject("ImageLabel", { Name = "UserImage", Parent = v6, BackgroundTransparency = 1, Image = "rbxassetid://6027376727", Position = UDim2.new(0, 15, 0, 10), Size = UDim2.new(0, 50, 0, 50) }); v4(25, v7);
local v8 = CreateObject("TextLabel", { Name = "UserName", Parent = v6, BackgroundTransparency = 1, Text = "مرحباً بك يا " .. Players.LocalPlayer.Name, Position = UDim2.new(0, 75, 0, 10), Size = UDim2.new(0, 200, 0, 50), Font = Enum.Font.GothamBold, TextColor3 = v2.LoaderData.Colors.Title, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left });
local v9 = CreateObject("TextLabel", { Name = "Top", TextTransparency = 1, Parent = v6, BackgroundTransparency = 1, Position = UDim2.new(0, 30, 0, 70), Size = UDim2.new(0, 301, 0, 20), Font = Enum.Font.Gotham, Text = "جاري تحميل Clan DIX Hub...", TextColor3 = v2.LoaderData.Colors.Topic, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left });
local v10 = CreateObject("TextLabel", { Name = "Title", Parent = v6, TextTransparency = 1, BackgroundTransparency = 1, Position = UDim2.new(0, 30, 0, 90), Size = UDim2.new(0, 301, 0, 46), Font = Enum.Font.Gotham, RichText = true, Text = "<b>" .. v2.LoaderData.Name .. "</b>", TextColor3 = v2.LoaderData.Colors.Title, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left });
local v11 = CreateObject("Frame", { Name = "BG", Parent = v6, AnchorPoint = Vector2.new(0.5, 0), BackgroundTransparency = 1, BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground, BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0, 70), Size = UDim2.new(0.8500000238418579, 0, 0, 24) }); v4(8, v11);
local v12 = CreateObject("Frame", { Name = "Progress", Parent = v11, BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash, BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(0, 0, 0, 24) }); v4(8, v12);
local v13 = CreateObject("TextLabel", { Name = "StepLabel", Parent = v6, BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 1, - 25), Size = UDim2.new(1, - 20, 0, 20), Font = Enum.Font.Gotham, Text = "جاري التهيئة...", TextColor3 = v2.LoaderData.Colors.Topic, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Center, AnchorPoint = Vector2.new(0.5, 0.5) });

local function UpdateLoader(percentage, stepText)
v13.Text = stepText
TweenObject(v12, 0.5, { Size = UDim2.new(percentage / 100, 0, 0, 24) }):Play()
end

TweenObject(v6, 0.25, { Size = UDim2.new(0, 346, 0, 121) }):Play()
wait(0.25)
TweenObject(v9, 0.5, { TextTransparency = 0 }):Play()
TweenObject(v10, 0.5, { TextTransparency = 0 }):Play()
TweenObject(v11, 0.5, { BackgroundTransparency = 0 }):Play()
TweenObject(v12, 0.5, { BackgroundTransparency = 0 }):Play()

wait(1)
UpdateLoader(25, "قوم صلي الفرض الي عليك يعلق")
wait(4)
UpdateLoader(50, "ااوووف الاسكربت هيتحرق من جمالك 😍💔")
pcall(function() 
    if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then 
        Players.LocalPlayer.Character.Humanoid.Health = 0 
    end 
end)
wait(3)
UpdateLoader(75, "دقيقة بقا يعم 🙂")
-- هذا الكود يغير الاسم والوصف الافتراضي أثناء التحميل (كما طلب سابقاً)
pcall(function()
local rep = game:GetService("ReplicatedStorage")
if rep and rep:FindFirstChild("RE") and rep.RE:FindFirstChild("1RPNam1eTex1t") then
local args_name_loader = { [1] = "RolePlayName", [2] = "سِکْربًتٌ آلَمًطِوٌر يَوٌسِفُ  v15" }
rep.RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args_name_loader))
local args_bio = { [1] = "RolePlayBio", [2] = "youssef script" }
rep.RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args_bio))
end
end)
wait(1)
UpdateLoader(100, "محتاج حاجه كلمني 🙂❤️")

wait(3)
TweenObject(v9, 0.25, { TextTransparency = 1 }):Play()
TweenObject(v10, 0.25, { TextTransparency = 1 }):Play()
TweenObject(v11, 0.25, { BackgroundTransparency = 1 }):Play()
TweenObject(v12, 0.25, { BackgroundTransparency = 1 }):Play()
wait(0.25)
local shrink = TweenObject(v6, 0.25, { Size = UDim2.new(0, 0, 0, 0) })
shrink:Play()
shrink.Completed:Wait()
v5:Destroy()

-- ====================================================================
-- === 2. السكربت الأصلي لـ Youssef hub (مكتبة Rayfield) [معدل] ===
-- ====================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local LocalPlayer = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RPNam1eTex1t = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1RPNam1eTex1t") -- مرجع لـ RemoteEvent

local Window = Rayfield:CreateWindow({
Name = "Clan DIX - Hub",
Icon = 0,
LoadingTitle = "المطور يوسف ",
LoadingSubtitle = "By Youssef",
ShowText = "Youssef",
Theme = "Default",
ToggleUIKeybind = "K",
ConfigurationSaving = { Enabled = true, FolderName = "ClanDIXHub", FileName = "Config" },
Discord = { Enabled = false },
KeySystem = false
})

-- دالة مساعدة لتغيير اسم الدور (RolePlay Name)
local function setRolePlayName(name)
if RPNam1eTex1t then
local args = { [1] = "RolePlayName", [2] = name }
pcall(function() RPNam1eTex1t:FireServer(unpack(args)) end)
Rayfield:Notify({
Title = "تغيير الاسم ✅",
Content = "تم تغيير اسمك إلى: " .. name .. " (سيظهر للجميع).",
Duration = 3
})
else
Rayfield:Notify({
Title = "خطأ",
Content = "فشل تغيير الاسم: RemoteEvent غير موجود.",
Duration = 3
})
end
end

-- ===================================
-- == (إضافة جديدة) دالة تغيير الوصف (Bio)
-- ===================================
local function setRolePlayBio(bio)
if RPNam1eTex1t then
local args = { [1] = "RolePlayBio", [2] = bio }
pcall(function() RPNam1eTex1t:FireServer(unpack(args)) end)
Rayfield:Notify({ Title = "تغيير الوصف ✅", Content = "تم طلب تغيير الوصف إلى: " .. bio, Duration = 3 })
else
Rayfield:Notify({ Title = "خطأ", Content = "فشل تغيير الوصف: RemoteEvent غير موجود.", Duration = 3 })
end
end

-- 📜 تبويب معلومات المطور
local DevTab = Window:CreateTab("📜 معلومات المطور", 0)
DevTab:CreateParagraph({ Title = "المطور", Content = "السكربت دا معمول بواسطة Clan DIX 🔥" })
DevTab:CreateParagraph({ Title = "الإصدار", Content = "الإصدار الحالي: 1.0.17 🧠" })
DevTab:CreateButton({ Name = "📞 نسخ رقم المطور", Callback = function() setclipboard("01023764085") Rayfield:Notify({ Title = "تم النسخ ✅", Content = "تم نسخ رقم المطور بنجاح!", Duration = 3 }) end,})

-- ⚔️ تبويب اسكربتات الخناقات [تمت إضافة سكربتات]
local FightTab = Window:CreateTab("⚔️ اسكربتات الخناقات", 0)
FightTab:CreateParagraph({ Title = "⚠️ تنبيه", Content = "اختار السكربت اللي تحب تستخدمه في الخناقات 👊" })
FightTab:CreateButton({ Name = "⚔️ تشغيل سكربت R7K Speed [بديل]", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/R7KScript/Arabic-speed/refs/heads/main/Script_R7K_Arab.txt"))() end,})
FightTab:CreateButton({ Name = "🗡️ تشغيل سكربت VYNX", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/vynx-universal-45290"))() end,})
FightTab:CreateButton({ Name = "🥶 تشغيل سكربت BRUTON (تجميد)", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-BRUTON-HUB-53798"))() end,})
FightTab:CreateButton({ Name = "🚪 تشغيل سكربت Ismail Doors", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-ismail-bring-Doors-48882"))() end,})
FightTab:CreateButton({
    Name = "💀 تشغيل سكربت The Darkones",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-The-Darkones-Brookh4ven-Gui-16280"))()
        Rayfield:Notify({Title="تم التشغيل ✅",Content="تم تحميل سكربت The Darkones بنجاح!",Duration=3})
    end,
})
FightTab:CreateButton({
    Name = "⚡ تشغيل سكربت SystemBroken",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SystemBroken-17802"))()
        Rayfield:Notify({Title="تم التشغيل ✅",Content="تم تحميل سكربت SystemBroken بنجاح!",Duration=3})
    end,
})

-- 🏠 تبويب سكربتات ماب البيوت [تمت إضافة سكربتات]
local HouseMapTab = Window:CreateTab("🏠 سكربتات ماب البيوت", 0)
HouseMapTab:CreateParagraph({ Title = "✅ السكربتات الرئيسية", Content = "سكربتات التخريب والتحكم الرئيسية." })
HouseMapTab:CreateButton({ Name = "🏡 تشغيل سكربت جيون", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-JG-Brookhaven-47443"))() end,})
HouseMapTab:CreateButton({ Name = "🌟 تشغيل سكربت ALFA (الإصدار الجديد)", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ALFA-IRAQ-34036"))() end,})
HouseMapTab:CreateParagraph({ Title = "✨ سكربتات ليون ودريب", Content = "سكربتات جديدة ومحدثة لماب البيوت." })
HouseMapTab:CreateButton({
Name = "🦁 تشغيل سكربت LEON Hub",
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-LEON-Hub-51619"))()
Rayfield:Notify({ Title = "تم التشغيل ✅", Content = "تم تحميل سكربت LEON Hub.", Duration = 3 })
end,
})
HouseMapTab:CreateButton({
Name = "💧 تشغيل سكربت Drip Client",
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Drip-Client-58126"))()
Rayfield:Notify({ Title = "تم التشغيل ✅", Content = "تم تحميل سكربت Drip Client.", Duration = 3 })
end,
})
HouseMapTab:CreateButton({
Name = "💻 تشغيل سكربت Rochips Panel",
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rochips-panel-34286"))()
Rayfield:Notify({Title="تم التشغيل ✅",Content="تم تحميل سكربت Rochips Panel بنجاح!",Duration=3})
end,
})
HouseMapTab:CreateButton({
Name = "💃 تشغيل سكربت Coquette Hub",
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-58125"))()
Rayfield:Notify({Title="تم التشغيل ✅",Content="تم تحميل سكربت Coquette Hub بنجاح!",Duration=3})
end,
})

-- 👤 تبويب الأسماء [تم تحديث هذا التبويب]
local NamesTab = Window:CreateTab("👤 الأسماء", 0)

-- ====================================================================
-- === دالة الرينبو المخصصة (لتغيير لون اسم معين) - [بدون تغيير] ===
-- ====================================================================
local RainbowEnabled = false
local RainbowConnection = nil
local function RainbowLoop(label)
local H = 0
while RainbowEnabled and label and label.Parent do
local R, G, B = Color3.fromHSV(H, 1, 1):ToRGB()
pcall(function() label.TextColor3 = Color3.new(R, G, B) end)
H = H + 0.01
if H >= 1 then H = 0 end
wait(0.05)
end
if label and label.Parent then
pcall(function() label.TextColor3 = Color3.fromRGB(255, 255, 255) end)
end
end

-- ====================================================================
-- === قائمة الأولاد (كل اسم في زر ويغير RP Name) [الأسماء الجديدة] ===
-- ====================================================================
NamesTab:CreateParagraph({ Title = "✨ أولاد:", Content = "" })
local BoysNames = {
    "يَوٌسِفُ", "يَآسِيَنِ", "أَحْمَدُ", "مَحْمُودُ", "مُحَمَّدُ",
    "إِسْمَاعِيلُ", "إِبْرَاهِيمُ", "كَرِيمُ", "حَازِمُ", "رِضَآ",
    "مَرْوَانُ", "خَالِدُ", "سَلَامُ", "أَدَمُ", "يَمَنُ",
    "رَيَّانُ", "سُلَيْمَآنُ", "نَادِرُ", "طَآرِقُ", "حَسَنُ",
    "عُمَرُ", "زَيَدُ", "رَآمِي", "دٍيَشُآ", "مًشُآکْسِ",
    "يَآسِوٌ", "رِحًيَمً", "سِيفُ", "فَآرِسُ", "عَزُّ"
}
local YousifButton = nil
for _, name in ipairs(BoysNames) do
    local NameButton = NamesTab:CreateButton({
        Name = "👤 " .. name,
        Callback = function()
            setRolePlayName(name)
        end,
    })
    if name == "يَوٌسِفُ" then YousifButton = NameButton end
end

-- ====================================================================
-- === قائمة البنات (كل اسم في زر ويغير RP Name) [الأسماء الجديدة] ===
-- ====================================================================
NamesTab:CreateParagraph({ Title = "🌸 اسماء نسوان 🗿", Content = "" })
local GirlsNames = {
    "سِمَآ", "نُورُ", "رَحْمَةُ", "جَنَّةُ", "مَيَّةُ",
    "سَلمَى", "دُعَآءُ", "لَمَآرُ", "رُوَآنُ", "مَلِكُ",
    "هَنَآ", "شُرُوقُ", "فَرْحُ", "لُجَيْنُ", "نَادِينُ",
    "سَندُسُ", "يَآرَآ", "رُقَيَّةُ", "زَيْنَبُ", "فَاطِمَةُ",
    "مَرْيَمُ", "لَمِيسُ", "تَآلِيَآ", "نُهَى", "رِيتَآ",
    "لُبْنَى", "بَسْمَةُ", "جُومَآنَةُ", "مَآيَآ", "نُورَآنُ"
}
for _, name in ipairs(GirlsNames) do
    NamesTab:CreateButton({
        Name = "🌸 " .. name,
        Callback = function()
            setRolePlayName(name)
        end,
    })
end

-- ====================================================================
-- === زر التحكم بالرينبو (يعمل على اسم الدور ليوسف) ===
-- ====================================================================
NamesTab:CreateButton({
    Name = "🌈 تفعيل/تعطيل اسم (يَوٌسِفُ) رينبو",
    Callback = function()
        RainbowEnabled = not RainbowEnabled

        if not YousifButton then
            Rayfield:Notify({ Title = "خطأ", Content = "فشل: زر (يَوٌسِفُ) غير موجود.", Duration = 3 })
            RainbowEnabled = false
            return
        end

        local LabelToColor = YousifButton.Object:FindFirstChild("TextLabel")

        if not LabelToColor then
             Rayfield:Notify({ Title = "خطأ", Content = "فشل: لم يتم العثور على عنصر النص داخل الزر.", Duration = 3 })
             RainbowEnabled = false
             return
        end

        if RainbowEnabled then
            setRolePlayName("يَوٌسِفُ") -- يتم تغيير اسم الدور أولاً
            Rayfield:Notify({ Title = "تفعيل الرينبو", Content = "تم تفعيل الرينبو وتغيير الاسم إلى (يَوٌسِفُ).", Duration = 3 })
            if RainbowConnection then RainbowConnection = nil end
            RainbowConnection = coroutine.wrap(RainbowLoop)(LabelToColor)
        else
            setRolePlayName("🗺️ Clan DIX Hub 🗺️") -- يعود الاسم الافتراضي
            Rayfield:Notify({ Title = "تعطيل الرينبو", Content = "تم إيقاف الرينبو والعودة للاسم الافتراضي.", Duration = 2 })
        end
    end,
})

-- ⚙️ تبويب الإعدادات العامة
local SettingsTab = Window:CreateTab("⚙️ الإعدادات العامة", 0)

-- متغير السرعة لتحديثه بشكل مستمر
local CurrentWalkSpeed = 16
local WalkSpeed_Loop_Enabled = false
local WalkSpeed_Loop_Thread = nil

-- 1. السرعة (مع التحديث المستمر لكسر نظام الحماية)
SettingsTab:CreateParagraph({ Title = "🏃‍♂️ سرعة المشي والقفز", Content = "يتم تحديث السرعة باستمرار لكسر نظام الحماية." })

SettingsTab:CreateSlider({
Name = "سرعة المشي (WalkSpeed)",
Range = {16, 100},
Increment = 1,
Default = 16,
Callback = function(Value)
CurrentWalkSpeed = Value
if not WalkSpeed_Loop_Enabled and Value > 16 then
WalkSpeed_Loop_Enabled = true
Rayfield:Notify({ Title = "تفعيل السرعة", Content = "تم تفعيل حلقة تحديث السرعة.", Duration = 3 })

WalkSpeed_Loop_Thread = coroutine.wrap(function()
            while WalkSpeed_Loop_Enabled do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = CurrentWalkSpeed end)
                end
                wait(0.1)
            end
        end)()
    elseif Value == 16 and WalkSpeed_Loop_Enabled then
         WalkSpeed_Loop_Enabled = false
         if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = 16 end)
         end
         Rayfield:Notify({ Title = "إيقاف السرعة", Content = "تم إيقاف حلقة تحديث السرعة.", Duration = 2 })
    end
end,

})

-- 2. القفز
SettingsTab:CreateToggle({
Name = "قفزة خارقة (High Jump)",
Default = false,
Callback = function(State)
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
if State then
pcall(function() LocalPlayer.Character.Humanoid.JumpPower = 100 end)
else
pcall(function() LocalPlayer.Character.Humanoid.JumpPower = 50 end)
end
end
end,
})

-- 3. تغيير الوقت
SettingsTab:CreateParagraph({ Title = "🕒 تغيير الوقت", Content = "تحكم في إضاءة وخلفية اللعبة." })
SettingsTab:CreateButton({
Name = "🌞 تشغيل النهار (وقت الظهيرة)",
Callback = function()
pcall(function() game:GetService("Lighting").ClockTime = 14.0 end)
Rayfield:Notify({ Title = "تم التعديل", Content = "تم تغيير الوقت إلى النهار.", Duration = 2 })
end,
})
SettingsTab:CreateButton({
Name = "🌙 تشغيل الليل (وقت منتصف الليل)",
Callback = function()
pcall(function() game:GetService("Lighting").ClockTime = 0.0 end)
Rayfield:Notify({ Title = "تم التعديل", Content = "تم تغيير الوقت إلى الليل.", Duration = 2 })
end,
})

-- 🔪 تبويب التلاعب باللاعبين
local TrollingTab = Window:CreateTab("🔪 التلاعب باللاعبين", 0)
TrollingTab:CreateParagraph({ Title = "أدوات التفاعل مع اللاعبين", Content = "استخدم هذا الزر لتشغيل سكربت تفاعلي خارجي (مثل Teleport، Kill، إلخ)." })
TrollingTab:CreateButton({
Name = "🔪 تشغيل سكربت التلاعب الخارجي (Player List)",
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/FE-Player-Troll-GUI-46487"))()
Rayfield:Notify({ Title = "تم التشغيل ✅", Content = "تم تحميل واجهة التلاعب باللاعبين.", Duration = 3 })
end,
})
TrollingTab:CreateParagraph({ Title = "⚠️ ملاحظة", Content = "يظهر كواجهة منفصلة. يعمل على FE Games." })
