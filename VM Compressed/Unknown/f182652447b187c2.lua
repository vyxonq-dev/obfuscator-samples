-- 1. Get necessary services and player information / 获取必要的服务和玩家信息 / Получить необходимые сервисы и информацию об игроке
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 2. Get the player's language code / 获取玩家的语言代码 / Получить языковой код игрока
-- 使用 player.LocaleId 获取语言代码，这是现代且推荐的方法
-- Use player.LocaleId to get the language code, this is the modern and recommended method
-- Использовать player.LocaleId для получения языкового кода, это современный и рекомендуемый метод
local locale = player.LocaleId

-- 3. Determine the language / 判断语言 / Определить язык
-- Use string.find to match language variants / 使用 string.find 来匹配语言变体 / Использовать string.find для сопоставления языковых вариантов
local isChinese = false
local isRussian = false

if string.find(locale, "zh") then
    isChinese = true
    print("Chinese language detected (" .. locale .. ") / 检测到中文语言 (" .. locale .. ") / Обнаружен китайский язык (" .. locale .. ")")
elseif string.find(locale, "ru") then
    isRussian = true
    print("Russian language detected (" .. locale .. ") / 检测到俄语语言 (" .. locale .. ") / Обнаружен русский язык (" .. locale .. ")")
else
    print("Chinese/Russian not detected (" .. locale .. "), defaulting to English. / 未检测到中文/俄语 (" .. locale .. ")，默认为英语。 / Китайский/русский не обнаружен (" .. locale .. "), по умолчанию английский.")
end

-- 4. Load the appropriate script based on language detection / 根据语言检测加载相应的脚本 / Загрузить соответствующий скрипт на основе определения языка
if isChinese then
    -- 如果是中文，加载中文脚本
    -- If it's Chinese, load Chinese script
    -- Если китайский, загрузить китайский скрипт
    print("正在加载中文脚本... / Loading Chinese script... / Загрузка китайского скрипта...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DUKECCB1337/PigGodAssets/main/ChenfengHu-zh.lua"))()
elseif isRussian then
    -- 如果是俄语，加载俄语脚本
    -- If it's Russian, load Russian script
    -- Если русский, загрузить русский скрипт
    print("正在加载俄语脚本... / Loading Russian script... / Загрузка русского скрипта...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DUKECCB1337/PigGodAssets/main/ChenfengHu-ru.lua"))()
else
    -- 如果不是中文或俄语，加载英文脚本
    -- If it's not Chinese or Russian, load English script
    -- Если не китайский и не русский, загрузить английский скрипт
    print("正在加载英文脚本... / Loading English script... / Загрузка английского скрипта...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DUKECCB1337/PigGodAssets/main/ChenfengHu-en.lua"))()
end