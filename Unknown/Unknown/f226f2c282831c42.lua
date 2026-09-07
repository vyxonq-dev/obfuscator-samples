-- Updater configuration
local title = "Delta Upgrade";
local url = "https://deltaexploits.gg";

local versionsToUpdate = {"2.621.528"};

-- Updater internals [START]
local fVersion, fStringFormat = Version, string.format;
local currentVersion = fVersion();
local localizationService = game:GetService("LocalizationService");

local sLocaleId = localizationService.SystemLocaleId;
local translationVector1 = {[0]={code="es",locale="es-es",translated="Copiar URL"},[1]={code="nl",locale="nl-nl",translated="Kopie URL"},[2]={code="pt",locale="pt-br",translated="Copiar URL"},[3]={code="tr",locale="tr-tr",translated="Url'yi kopyala"},[4]={code="fi",locale="fi-fi",translated="Kopioida URL -osoite"},[5]={code="de",locale="de-de",translated="URL kopieren"},[6]={code="it",locale="it-it",translated="Copia URL"},[7]={code="ko",locale="ko-kr",translated="URL을 복사하십시오"},[8]={code="tl",locale="tl-ph",translated="Kopyahin ang URL"},[9]={code="ar",locale="ar-sa",translated="إنسخ الرابط"},[10]={code="hi",locale="hi-in",translated="यूआरएल कॉपी करें"},[11]={code="da",locale="da-dk",translated="Kopier URL"},[12]={code="ru",locale="ru-ru",translated="Копия URL"},[13]={code="el",locale="el-gr",translated="Αντιγραφή URL"},[14]={code="cs",locale="cs-cz",translated="Kopírovat URL"},[15]={code="en",locale="en-us",translated="Copy URL"},[16]={code="pl",locale="pl-pl",translated="Kopiuj URL"},[17]={code="fr",locale="fr-fr",translated="Copier le lien"},[18]={code="sv",locale="sv-se",translated="Kopiera URL"},[19]={code="th",locale="th-th",translated="คัดลอก URL"},[20]={code="ja",locale="ja-jp",translated="URLをコピーします"},[21]={code="zh",locale="zh-cn",translated="复制URL"},[22]={code="zh",locale="zh-tw",translated="複製URL"},[23]={code="vi",locale="vi-vn",translated="Sao chép URL"},[24]={code="ms",locale="ms-my",translated="Salin URL"},[25]={code="hu",locale="hu-hu",translated="Másolja az URL -t"},[26]={code="id",locale="id-id",translated="Salin URL"},[27]={code="ro",locale="ro-ro",translated="URL de copiere"}}
local translationVector2 = {[0]={code="en",locale="en-us",translated="Your version (%s) of Roblox is out of date and will not work properly. Please update it at Delta's website: https://deltaexploits.gg"},[1]={code="hi",locale="hi-in",translated="Roblox का आपका संस्करण (%s) पुराना है और ठीक से काम नहीं करेगा।कृपया इसे डेल्टा की वेबसाइट पर अपडेट करें: https://deltaexploits.gg"},[2]={code="zh",locale="zh-cn",translated="您的Roblox版本（%s）已过时，无法正常工作。请在Delta的网站上进行更新：https：//deltaexploits.gg"},[3]={code="es",locale="es-es",translated="Su versión (%s) de Roblox está desactualizada y no funcionará correctamente.Actualizarlo en el sitio web de Delta: https://deltaexploits.gg"},[4]={code="vi",locale="vi-vn",translated="Phiên bản của bạn (%s) của Roblox đã lỗi thời và sẽ không hoạt động đúng.Vui lòng cập nhật nó tại trang web của Delta: https://deltaexploits.gg"},[5]={code="id",locale="id-id",translated="Versi Anda (%s) dari Roblox sudah ketinggalan zaman dan tidak akan berfungsi dengan baik.Harap perbarui di situs web Delta: https://deltaexploits.gg"},[6]={code="el",locale="el-gr",translated="Η έκδοση σας (%s) του Roblox είναι ξεπερασμένη και δεν θα λειτουργήσει σωστά.Ενημερώστε το στην ιστοσελίδα της Delta: https://deltaexploits.gg"},[7]={code="da",locale="da-dk",translated="Din version (%s) af Roblox er forældet og fungerer ikke korrekt.Opdater det på Delta's websted: https://deltaexploits.gg"},[8]={code="tl",locale="tl-ph",translated="Ang iyong bersyon (%s) ng Roblox ay wala sa oras at hindi gagana nang maayos.Mangyaring i -update ito sa website ng Delta: https://deltaexploits.gg"},[9]={code="sv",locale="sv-se",translated="Din version (%s) av Roblox är föråldrad och fungerar inte korrekt.Uppdatera den på Deltas webbplats: https://delaexploits.net"},[10]={code="ko",locale="ko-kr",translated="Roblox의 버전 (%s)은 구식이 아니며 제대로 작동하지 않습니다.델타 웹 사이 트 https://deltaexploits.gg에서 업데이트하십시오"},[11]={code="pl",locale="pl-pl",translated="Twoja wersja (%s) Roblox jest nieaktualna i nie będzie działać poprawnie.Zaktualizuj go na stronie internetowej Delta: https://deltaexploits.gg"},[12]={code="ru",locale="ru-ru",translated="Ваша версия (%s) Roblox устарела и не будет работать должным образом.Пожалуйста, обновите его на веб -сайте Delta: https://deltaexploits.gg"},[13]={code="ja",locale="ja-jp",translated="Robloxのバージョン（%s）は時代遅れであり、適切に機能しません。DeltaのWeb サイトhttps://deltaexploits.ggで更新してください"},[14]={code="nl",locale="nl-nl",translated="Uw versie (%s) van Roblox is verouderd en werkt niet goed.Werk het bij op de website van Delta: https://deltaexploits.gg"},[15]={code="ms",locale="ms-my",translated="Versi anda (%s) Roblox sudah ketinggalan zaman dan tidak akan berfungsi dengan baik.Sila kemas kini di laman web Delta: https://deltaexploits.gg"},[16]={code="pt",locale="pt-br",translated="Sua versão (%s) do Roblox está desatualizada e não funcionará corretamente.Atualize -o no site da Delta: https://deltaexploits.gg"},[17]={code="tr",locale="tr-tr",translated="Roblox'un sürümünüz (%s) güncel değil ve düzgün çalışmayacak.Lütfen Delta'nın web sitesinde güncelleyin: https://deltaexploits.gg"},[18]={code="hu",locale="hu-hu",translated="A Roblox verziója (%s) elavult, és nem fog megfelelően működni.Kérjük, frissítse a Delta weboldalán: https://deltaexploits.gg"},[19]={code="fi",locale="fi-fi",translated="Robloxin versio (%s) on vanhentunut eikä toimi kunnolla.Päivitä se Delta -verkkosivustolla: https://deltaexploits.gg"},[20]={code="de",locale="de-de",translated="Ihre Version (%s) von Roblox ist veraltet und funktioniert nicht ordnungsgemäß.Bitte aktualisieren Sie es auf der Website von Delta: https://deltaexploits.gg"},[21]={code="th",locale="th-th",translated="เวอร์ชันของคุณ (%s) ของ Roblox ล้าสมัยและจะทำงานไม่ถูกต้องโปรดอัปเดตที่เว          ว็บไซต์ของ Delta: https://deltaexploits.gg"},[22]={code="ar",locale="ar-sa",translated="نسختك (%s) من Roblox قديمة ولن تعمل بشكل صحيح.يرجى تحديثه على موقع Delta على الويب: https://deltaexploits.gg"},[23]={code="cs",locale="cs-cz",translated="Vaše verze (%s) ROBLOX je zastaralá a nebude fungovat správně.Aktualizujte ji na webových stránkách Delta: https://deltaexploits.gg"},[24]={code="zh",locale="zh-tw",translated="您的Roblox版本（%s）已過時，無法正常工作。請在Delta的網站上進行更新：https：//deltaexploits.gg"},[25]={code="it",locale="it-it",translated="La tua versione (%s) di Roblox è obsole e non funzionerà correttamente.Aggiornalo sul sito web di Delta: https://deltaexploits.gg"}}

function split_locale(input_locale)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(input_locale, "-", from)
    while delim_from do
        table.insert(result, string.sub(input_locale, from , delim_from-1))
        from = delim_to + 1
        delim_from, delim_to = string.find(input_locale, "-", from)
    end
    table.insert(result, string.sub(input_locale, from))
    return result
end

function searchTranslationVector(vector, locale)
    --find by locale
    for _, translation in next, vector do
        if (string.lower(translation.locale) == string.lower(locale)) then
            return translation.translated;
        end
    end

    --find by code
    for _, translation in next, vector do
        if (string.lower(translation.code) == string.lower(locale)) then
            return translation.translated;
        end
    end

    if string.find(locale, "-") then
        local l1, l2 = unpack(split_locale(locale));

        for _, translation in next, vector do
            if (string.lower(translation.code) == string.lower(l1)) then
                return translation.translated;
            end
        end

        for _, translation in next, vector do
            if (string.lower(translation.code) == string.lower(l2)) then
                return translation.translated;
            end
        end
    end

    for _, translation in next, vector do
        if (string.lower(translation.code) == "en") then
            return translation.translated;
        end
    end
end

function showModal(a,b,c)local d={}local e=game:GetService("GuiService")d["1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))d["1"]["IgnoreGuiInset"]=true;d["1"]["Enabled"]=false;d["1"]["ScreenInsets"]=Enum.ScreenInsets.DeviceSafeInsets;d["1"]["Name"]=[[LOADERLoadingScreen]]d["1"]["ZIndexBehavior"]=Enum.ZIndexBehavior.Sibling;d["1"]["ResetOnSpawn"]=false;d["2"]=Instance.new("Frame",d["1"])d["2"]["ZIndex"]=-100;d["2"]["BackgroundColor3"]=Color3.fromRGB(0,0,0)d["2"]["BackgroundTransparency"]=0.6600000262260437;d["2"]["Size"]=UDim2.new(2,0,2,0)d["2"]["Position"]=UDim2.new(-1,0,-1,0)d["2"]["Name"]=[[DarkOverlay]]d["3"]=Instance.new("ImageLabel",d["1"])d["3"].BorderSizePixel=0;d["3"].ScaleType=Enum.ScaleType.Crop;d["3"].BackgroundColor3=Color3.fromRGB(255,255,255)d["3"].Image="rbxassetid://13387419794"d["3"].LayoutOrder=10;d["3"].Size=UDim2.new(0.32863849401474,0,0.31259891390800476,0)d["3"].BorderColor3=Color3.fromRGB(0,0,0)d["3"].Name="MainFrame"local f=d["3"].Size;local g=e:GetScreenResolution().X/2;local h=e:GetScreenResolution().Y/2;local i=g-f.X.Offset/2;local j=h-f.Y.Offset/2;d["3"].Position=UDim2.new(0,i,0,j/20)d["4"]=Instance.new("UICorner",d["3"])d["4"]["CornerRadius"]=UDim.new(0.07000000029802322,0)d["5"]=Instance.new("ImageLabel",d["3"])d["5"]["BackgroundColor3"]=Color3.fromRGB(26,27,36)d["5"]["Image"]=[[rbxassetid://13387657138]]d["5"]["LayoutOrder"]=10;d["5"]["Size"]=UDim2.new(1,0,1,0)d["5"]["Name"]=[[Overlay]]d["5"]["BackgroundTransparency"]=0.800000011920929;d["6"]=Instance.new("UICorner",d["5"])d["6"]["CornerRadius"]=UDim.new(0.07000000029802322,0)d["7"]=Instance.new("TextLabel",d["5"])d["7"]["TextWrapped"]=true;d["7"]["TextScaled"]=true;d["7"]["BackgroundColor3"]=Color3.fromRGB(118,192,255)d["7"]["FontFace"]=Font.new([[rbxassetid://11702779517]],Enum.FontWeight.Bold,Enum.FontStyle.Normal)d["7"]["TextSize"]=14;d["7"]["TextColor3"]=Color3.fromRGB(203,244,255)d["7"]["AnchorPoint"]=Vector2.new(0,0.5)d["7"]["Size"]=UDim2.new(0.6451469659805298,0,0.1418459564447403,0)d["7"]["Text"]=a;d["7"]["Name"]=[[Title]]d["7"]["BackgroundTransparency"]=1;d["7"]["Position"]=UDim2.new(0.1773512363433838,0,0.2073548913002014,0)d["8"]=Instance.new("TextLabel",d["5"])d["8"]["TextWrapped"]=true;d["8"]["TextScaled"]=true;d["8"]["BackgroundColor3"]=Color3.fromRGB(255,255,255)d["8"]["FontFace"]=Font.new([[rbxassetid://11702779517]],Enum.FontWeight.Regular,Enum.FontStyle.Normal)d["8"]["TextSize"]=36;d["8"]["TextColor3"]=Color3.fromRGB(203,244,255)d["8"]["AnchorPoint"]=Vector2.new(0,0.5)d["8"]["Size"]=UDim2.new(0.8879498243331909,0,0.4277613639831543,0)d["8"]["Text"]=b;local k=d;k["13"]=Instance.new("ImageButton",k["5"])k["13"]["Active"]=false;k["13"]["BorderSizePixel"]=0;k["13"]["BackgroundColor3"]=Color3.fromRGB(31,37,47)k["13"]["Selectable"]=false;k["13"]["AnchorPoint"]=Vector2.new(0,1)k["13"]["Size"]=UDim2.new(0.6975729584693909,0,0.1604293990135193,0)k["13"]["Name"]=[[Button2]]k["13"]["Position"]=UDim2.new(0.15,0,0.9699996423721313,0)k["14"]=Instance.new("UICorner",k["13"])k["14"]["CornerRadius"]=UDim.new(0.20000000298023224,0)k["15"]=Instance.new("UIStroke",k["13"])k["15"]["Color"]=Color3.fromRGB(31,37,47)k["15"]["Thickness"]=2;k["16"]=Instance.new("TextLabel",k["13"])k["16"]["TextWrapped"]=true;k["16"]["BorderSizePixel"]=0;k["16"]["TextScaled"]=true;k["16"]["BackgroundColor3"]=Color3.fromRGB(31,37,47)k["16"]["FontFace"]=Font.new([[rbxassetid://11702779517]],Enum.FontWeight.Bold,Enum.FontStyle.Normal)k["16"]["TextSize"]=14;k["16"]["TextColor3"]=Color3.fromRGB(162,191,212)k["16"]["AnchorPoint"]=Vector2.new(0.5,0.5)k["16"]["Size"]=UDim2.new(0.8865329027175903,0,0.5,0)k["16"]["Text"]=searchTranslationVector(translationVector1, sLocaleId);k["16"]["Name"]=[[Input]]k["16"]["BackgroundTransparency"]=1;k["16"]["Position"]=UDim2.new(0.5,0,0.5,0)k["13"].MouseButton1Click:Connect(function()setclipboard(c)end)d["8"]["Name"]=[[Desc]]d["8"]["BackgroundTransparency"]=1;d["8"]["Position"]=UDim2.new(0.06185942143201828,0,0.5393086075782776,0)d["9"]=Instance.new("Frame",d["3"])d["9"]["ZIndex"]=0;d["9"]["BorderSizePixel"]=0;d["9"]["BackgroundTransparency"]=1;d["9"]["Size"]=UDim2.new(1,0,1,0)d["9"]["Name"]=[[DropShadowHolder]]d["a"]=Instance.new("ImageLabel",d["9"])d["a"]["ZIndex"]=0;d["a"]["BorderSizePixel"]=0;d["a"]["SliceCenter"]=Rect.new(49,49,450,450)d["a"]["ScaleType"]=Enum.ScaleType.Slice;d["a"]["ImageColor3"]=Color3.fromRGB(0,0,0)d["a"]["ImageTransparency"]=0.699999988079071;d["a"]["AnchorPoint"]=Vector2.new(0.5,0.5)d["a"]["Image"]=[[rbxassetid://6014261993]]d["a"]["Size"]=UDim2.new(1,47,1,47)d["a"]["Name"]=[[DropShadow]]d["a"]["BackgroundTransparency"]=1;d["a"]["Position"]=UDim2.new(0.5,0,0.5,0)d["b"]=Instance.new("UIAspectRatioConstraint",d["3"])d["b"]["AspectRatio"]=1.8712739944458008;local l={}local m=d["1"]local n=game:GetService("TweenService")local o=m.MainFrame;local p=m.DarkOverlay;local q=false;local r=0.6;function l:Start()q=true;m.Enabled=true;o.Position=UDim2.new(0.336,0,-0.372,0)p.Transparency=1;local s=n:Create(o,TweenInfo.new(r,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(0.336,0,0.322,0)})local t=n:Create(p,TweenInfo.new(r,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Transparency=0.66})s:Play()t:Play()t.Completed:Wait()end;coroutine.wrap(function()l:Start()end)()end

for _, outdatedVersion in next, versionsToUpdate do
    if (currentVersion == outdatedVersion) then
        local message = fStringFormat(searchTranslationVector(translationVector2, sLocaleId), currentVersion);
        showModal(title, message, url);
        error(message);
    end
end
-- Updater internals [END]
