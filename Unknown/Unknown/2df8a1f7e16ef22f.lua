-- ═══════════════════════════════════════════════════════════════════════
--  ANTI IP LOGGER + ANTI STEALER  |  v2.1.5  «Pickle Rick Edition»
--  Три фичи:
--   • ANTI IP LOGGER — блокирует утечку IP через HTTP/WebSocket-запросы
--     на известные логгер/трекер-домены, подчищает ответы.
--   • ANTI STEALER — cookie guard, loadstring scan, anti-kick.
--   • ANTI ROBUX/ABUSE — блокирует попытки скриптов ложно репортнуть тебя
--     (ReportAbuse) и показать промпт покупки Robux без твоего ведома.
--
--  ИЗМЕНЕНИЯ В v2.1.0 (идеи взяты из стороннего скрипта RoTotal, но
--  реализованы заново под нашу архитектуру — без UI с кнопками Allow/
--  Block, в стиле "автоблок + подробный лог", как остальной скрипт):
--
--   • ANTI REPORT ABUSE: блокирует Players:ReportAbuse(), вызванный из
--     Lua/loadstring — защита от скриптов, которые могли бы ложно
--     репортнуть тебя администрации игры.
--
--   • ANTI ROBUX PROMPT: блокирует MarketplaceService:PromptPurchase /
--     PromptGamePassPurchase / PromptProductPurchase / PromptBundlePurchase
--     / PromptPremiumPurchase / PromptSubscriptionPurchase / PerformPurchase
--     / PerformPurchaseV2, если их вызывает Lua-скрипт, а не движок.
--     ВАЖНО (честно): это НЕ защита от уже подтверждённой тобой покупки —
--     Roblox физически не позволяет скрипту завершить покупку Robux без
--     твоего явного клика в НАТИВНОМ окне подтверждения. Наша защита —
--     это блокировка самого ЗАПРОСА на показ такого окна плюс подробный
--     лог (владелец товара, цена через MarketplaceService:GetProductInfo),
--     чтобы подозрительный промпт вообще не появился у тебя перед глазами.
--
--  ИЗМЕНЕНИЯ В v2.1.1 — КРИТИЧНО:
--   • Полностью убран ANTI-BYPASS (перехват hookfunction/clonefunction на
--     самих себе, чтобы защитить остальные хуки от снятия). На Android
--     (как минимум на одном executor'е) это вызвало реальный краш
--     клиента (SIGSEGV) — стектрейс показывал бесконечную рекурсию,
--     характерную именно для самохука hookfunction через hookfunction:
--     на некоторых executor'ах внутренняя реализация при установке хука
--     сама обращается к hookfunction, а мы к этому моменту уже подменили
--     глобальную ссылку на свою версию — зацикливание на нативном уровне,
--     которое pcall не ловит и не может остановить. Если ты обновлялся с
--     v2.1.0 — обязательно замени файл на эту версию.
--
--  ИЗМЕНЕНИЯ В v2.1.2:
--   • ИСПРАВЛЕНО (важно): ANTI ROBUX PROMPT раньше блокировал ЛЮБОЙ вызов
--     Prompt*Purchase, если он шёл не с C-стороны движка. Проблема: в
--     обычных играх Roblox эти методы штатно вызываются из LocalScript
--     самой игры (клик "купить" в магазине) — это официальный способ,
--     а не что-то подозрительное. Из-за этого блокировались ВСЕ покупки
--     во ВСЕХ играх, а не только скрытые попытки от вредоносных скриптов.
--     Теперь вызов пропускается, если он идёт из реального скрипта игры
--     (Instance, лежащий в дереве game), и блокируется только код без
--     такого происхождения — типичный признак loadstring/инжекта.
--   • ИСПРАВЛЕНО: sanitizeBody раньше заменял любую подстроку вида
--     "N.N.N.N" в ЛЮБОМ теле ответа, включая ответы от доменов из
--     белого списка — рискуя испортить легитимные данные (версии,
--     координаты и т.п.), случайно похожие на IP. Теперь ответы от
--     доменов из _whitelist не трогаются.
--   • Известное ограничение осталось прежним: анти-байпас (защита самих
--     хуков от снятия) по-прежнему убран из-за краша на Android — см.
--     запись v2.1.1 выше. Это не изменилось в этой версии.
--
--  ИЗМЕНЕНИЯ В v2.1.3:
--   • Добавлен EXACT_DOMAIN_SET — 242 точных домена из курируемой части
--     Piperun's IP-Logger Filter (github.com/piperun/iploggerfilter),
--     не дублирующие уже покрытые ключевые слова из BLACKLIST. Проверка
--     O(1) через hash-таблицу, не влияет на скорость существующих циклов.
--   • НЕ включены массовые списки "Blazse Loggers"/"PS3CFW Loggers" из
--     того же фильтр-листа (~680 доменов, последнее обновление 2020) —
--     это старые списки взломанных обычных сайтов, собранные для
--     контекста браузерного ad-block'а. В контексте Roblox-скрипта их
--     добавление не даёт ощутимой защиты (такие URL почти никогда не
--     встретятся в реальном трафике игр), зато со временем часть таких
--     доменов освобождается и переходит к никак не связанным владельцам —
--     то есть чистый риск ложных срабатываний без реальной пользы взамен.
--
--  ИЗМЕНЕНИЯ В v2.1.4 (по итогам разбора 8 живых семплов стилеров):
--   • ЗАКРЫТА ГЛАВНАЯ ДЫРА: блокировка webhook-релеев (_block_relay_hosts).
--     Раньше скрипт блокировал POST на discord.com/api/webhooks — но ни
--     один из разобранных семплов туда напрямую и не ходит. Все они шлют
--     данные на СВОЙ маленький релей на бесплатном хостинге
--     (proxykoyeb.onrender.com, rubix-scanner.vercel.app,
--     proxy-plum-beta.vercel.app), а тот уже пересылает в Discord.
--     Для старой версии это был обычный POST на незнакомый домен — то
--     есть защита от webhook'ов не срабатывала на них вообще ни разу.
--     Теперь POST на *.vercel.app, *.onrender.com, *.workers.dev и ещё
--     ~20 подобных платформ блокируется. ЭТО ЭВРИСТИКА, не список
--     known-bad: часть легитимных скриптов хостит свои API там же.
--     Ложняк лечится добавлением домена в _whitelist.
--   • Блокировка голых IPv4-хостов (_block_bare_ip). В семплах живьём
--     встречались эндпоинты вида http://93.183.83.94:8000/webhook/... и
--     http://180.93.3.83:4800/script/... — у сырого IP нет домена,
--     который можно внести в блок-лист, и он не палится в чужих списках.
--     Локальные адреса (127.*, 10.*, 192.168.*, 172.16-31.*) не трогаются.
--   • Добавлены точные exfil-хосты из семплов (KnownExfilHosts) и новые
--     маркеры конфигов загрузчиков в ENV_INJECTION_MARKERS.
--
--  ЧЕГО ЭТА ВЕРСИЯ ПО-ПРЕЖНЕМУ НЕ ДЕЛАЕТ (важно понимать):
--   • Все 8 разобранных стилеров — тонкие загрузчики: они прописывают
--     конфиг в getfenv()/_G и делают loadstring(HttpGet(url))(). Внутри
--     самого загрузчика вредоносного кода НЕТ, только ссылка. Поэтому
--     скан исходника по «плохим словам» ловит их плохо, и основная
--     защита — сетевая, по URL. А URL меняется за минуту: достаточно
--     перезалить релей на новый поддомен. Блокировка доменов защищает
--     в основном от старых, уже засвеченных скриптов.
--   • Анти-байпас по-прежнему убран (краш на Android, см. v2.1.1):
--     любой скрипт, запущенный ПОСЛЕ этого, может перехукать request/
--     __namecall/loadstring заново и снять защиту целиком.
--   • Вывод: это снижает риск, но не заменяет главное правило —
--     не запускать скрипты из случайных источников.
--
--  ИЗМЕНЕНИЯ В v2.1.5 «Pickle Rick Edition»:
--   • Иконка уведомлений — Огурчик Рик (rbxassetid://83768500686029).
--     Меняется через getgenv()._icon_asset.
--   • ИСПРАВЛЕН ЛОЖНЯК НА «STEAL A BRAINROT» И ТРЕЙД-ИГРАХ
--     (_game_context_aware). Раньше слова "steal"/"trade"/"brainrot" в
--     коде считались подозрительными. Но есть огромные легальные игры,
--     где это просто название и механика — там ЛЮБОЙ нормальный скрипт
--     содержит эти слова. Теперь скрипт читает название текущей игры, и
--     если слово есть в названии — в этой игре оно уликой не считается.
--     Жёсткие сигнатуры (cookie, authticket, exfil-домены) НЕ подавляются
--     никогда и ни в какой игре — иначе стилеру хватило бы запуститься
--     в игре с подходящим названием.
--   • ЛЕГИТИМНЫЕ WEBHOOK'И БОЛЬШЕ НЕ ЛОМАЮТСЯ. Раньше блокировался любой
--     webhook. Но куча нормальных скриптов шлёт в свой Discord рекорды и
--     статистику. Теперь решение принимается ПО СОДЕРЖИМОМУ тела:
--     cookie / authticket / hwid / опись инвентаря = блок;
--     счёт, время, уровень, «скрипт запущен» = пропуск.
--     Кому спокойнее по-старому — getgenv()._strict_webhook = true.
--     Та же логика применена к релей-хостам из v2.1.4.
--   • ФОРЕНЗИКА КИКА (_kick_forensics). Стилер обычно кикает сразу после
--     кражи, чтобы жертва не увидела пропажу и не отменила трейд. Кик мы
--     и так блокируем — теперь в этот момент в консоль выводится журнал
--     последних 25 заблокированных действий и напоминание немедленно
--     проверить инвентарь и входящие трейды.
--
--  ЧЕСТНО О ГЛАВНОМ ОГРАНИЧЕНИИ (внутриигровая кража предметов):
--   Универсально защитить от кражи предметов ВНУТРИ игры невозможно, и
--   ни один скрипт этого не умеет — включая этот. Причина: кража идёт
--   через обычные RemoteEvent'ы самой игры, те же самые, которыми ты
--   пользуешься при настоящем трейде. Вызов «отдать предмет игроку X»
--   выглядит одинаково и когда это твой осознанный обмен, и когда это
--   стилер. Отличить можно было бы, только зная логику каждой игры
--   отдельно — а игр миллионы, и в каждой свои remote'ы.
--   Что этот скрипт реально закрывает: кражу КУКИ/ТОКЕНОВ и утечку IP
--   (сетевой слой — тут защита работает), плюс блокировку кика и журнал,
--   дающий шанс заметить кражу и успеть отменить трейд.
--   Что НЕ закрывает: сам факт передачи предметов внутри игры.
--   Поэтому главное правило не отменяется: не запускать скрипты из
--   случайных источников, особенно на игры с ценным инвентарём.
-- ═══════════════════════════════════════════════════════════════════════
--
--  Что НЕ исправлено и не может быть исправлено в такой архитектуре —
--  это не баги, а фундаментальные границы возможностей ЛОКАЛЬНОГО скрипта:
--   - Anti-kick блокирует только вызовы Kick() со стороны Lua/loadstring.
--     Серверный кик (сама игра выгоняет игрока) заблокировать НЕЛЬЗЯ —
--     это решение сервера, локальный хук на него не влияет.
--   - sanitizeBody подчищает уже ПОЛУЧЕННЫЙ ответ. Если вредный скрипт
--     успел ОТПРАВИТЬ настоящий IP на сервер до блокировки — заменить
--     то, что уже ушло, невозможно.
--   - Redirect-цепочки, WebSocket-содержимое кроме cookie-сигнатуры,
--     сильно обфусцированный/динамически собранный код и альтернативные
--     сетевые API, которых executor не предоставляет через стандартные
--     функции — всё это может обойти фильтр. Полной гарантии не даёт ни
--     один локальный anti-logger, это ограничение подхода, а не версии.
-- ═══════════════════════════════════════════════════════════════════════

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 0 — GUARD ОТ ПОВТОРНОГО ЗАПУСКА
-- ═══════════════════════════════════════════════════════════════════════
if getgenv().__AntiLoggerUnifiedLoaded then
    warn("[AntiLogger] Уже загружен, повторный запуск пропущен (во избежание наслоения хуков).")
    return
end
getgenv().__AntiLoggerUnifiedLoaded = true

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 1 — НАСТРОЙКИ
-- ═══════════════════════════════════════════════════════════════════════
getgenv()._blockwebhook = true
getgenv()._sanitize_ip = true
getgenv()._log_blocks = true
getgenv()._anti_kick = true
getgenv()._scan_loadstring = true
getgenv()._verbose_soft_warnings = false

-- v2.1.0: новые переключатели
getgenv()._anti_reportabuse = true
getgenv()._anti_robux_prompt = true

-- v2.1.4: два новых переключателя, закрывающие реальные дыры, найденные при
-- разборе живых семплов стилеров (см. changelog в шапке).
--
-- _block_bare_ip — блокировать запросы, у которых хост это голый IPv4
-- (например http://93.183.83.94:8000/webhook/...). Легитимный трафик
-- игры практически никогда не ходит на сырой IP — там всегда домен.
-- А вот стилеры так делают часто: у сырого IP нет домена, который можно
-- было бы внести в блок-лист, и он не палится в чужих списках доменов.
getgenv()._block_bare_ip = true
--
-- _block_relay_hosts — блокировать POST на бесплатные хостинг-платформы
-- (vercel.app, onrender.com, workers.dev и т.п.). Это главный современный
-- обход: стилер НЕ шлёт данные напрямую на discord.com/api/webhooks
-- (это все блокируют), а шлёт на свой маленький релей, развёрнутый
-- бесплатно на Vercel/Render, а тот уже пересылает в Discord. Для нашего
-- хука это выглядит как обычный POST на незнакомый домен.
-- ВНИМАНИЕ: это эвристика, а не список known-bad. Часть легитимных
-- скриптов хостит свои API на тех же платформах. Если какой-то нужный
-- тебе скрипт перестал работать — добавь его домен в _whitelist ниже
-- или выключи этот переключатель.
getgenv()._block_relay_hosts = true

-- v2.1.5: новые переключатели
--
-- _strict_webhook — если true, блокируется ЛЮБОЙ webhook, даже безобидный.
-- По умолчанию false: многие нормальные скрипты шлют в свой Discord
-- рекорды и статистику, и блокировать их без разбора — значит ломать
-- легитимные скрипты. При false решение принимается по содержимому тела
-- (cookie/токен/инвентарь = блок, счёт и время = пропуск).
getgenv()._strict_webhook = false
--
-- _game_context_aware — не считать уликой слова, которые есть в названии
-- самой игры. Без этого «Steal a Brainrot» помечает почти любой скрипт,
-- потому что слово "steal" там в названии. Жёстких сигнатур
-- (cookie, authticket и т.п.) это послабление НЕ касается.
getgenv()._game_context_aware = true
--
-- _kick_forensics — при попытке кика показать, что скрипт делал
-- перед этим. Стилеры часто кикают сразу после кражи, чтобы жертва
-- не увидела пропажу и не успела отменить трейд.
getgenv()._kick_forensics = true

-- Иконка уведомлений: Огурчик Рик
getgenv()._icon_asset = getgenv()._icon_asset or "rbxassetid://83768500686029"

getgenv()._whitelist = getgenv()._whitelist or {
    "roblox.com", "rbxcdn.com",
}

getgenv()._loadstring_whitelist = getgenv()._loadstring_whitelist or {
}

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 2 — БАЗОВЫЕ УТИЛИТЫ
-- ═══════════════════════════════════════════════════════════════════════
local cloneref = cloneref or clone_reference or function(o) return o end
local realGame = cloneref(game)
local HttpService = cloneref(game:GetService("HttpService"))
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Market = game:GetService("MarketplaceService")

local sfind, slower, smatch, gsub = string.find, string.lower, string.match, string.gsub
local rnd = math.random

local COOKIE_SIG = "warning:-do-not-share-this."

local function urlDecode(s)
    if type(s) ~= "string" then return s end
    local ok, out = pcall(function()
        return (gsub(s, "%%(%x%x)", function(h) return string.char(tonumber(h, 16)) end))
    end)
    return ok and out or s
end

local function getHost(url)
    if type(url) ~= "string" then return "" end
    local rest = gsub(url, "^%w[%w%+%.%-]*://", "")
    local authority = smatch(rest, "^([^/?#]+)") or rest
    authority = smatch(authority, "@(.+)$") or authority
    local host = smatch(authority, "^([^:]+)") or authority
    host = gsub(host, "%.$", "")
    return slower(host)
end

local function isWhitelisted(host)
    if not host or host == "" then return false end
    for _, w in ipairs(getgenv()._whitelist or {}) do
        w = slower(w)
        if host == w or (#host > #w and host:sub(-(#w + 1)) == "." .. w) then
            return true
        end
    end
    return false
end

local function fakeIPv4()
    local a = rnd(1, 223); if a == 127 then a = 128 end
    return ("%d.%d.%d.%d"):format(a, rnd(0, 255), rnd(0, 255), rnd(1, 254))
end

local function fakeIPv6()
    return ("fd00:%x:%x:%x:%x:%x:%x:%x"):format(
        rnd(0, 0xffff), rnd(0, 0xffff), rnd(0, 0xffff), rnd(0, 0xffff),
        rnd(0, 0xffff), rnd(0, 0xffff), rnd(0, 0xffff)
    )
end

local function getCallingScriptName()
    if type(getcallingscript) ~= "function" then
        return "unknown (getcallingscript недоступен)"
    end
    local ok, scr = pcall(getcallingscript)
    if not ok or not scr then return "unknown" end
    local nameOk, fullName = pcall(function() return scr:GetFullName() end)
    if nameOk and fullName then return fullName end
    local n2ok, n2 = pcall(function() return scr.Name end)
    if n2ok and n2 then return tostring(n2) end
    return "unknown"
end

-- Отличаем вызов из НАСТОЯЩЕГО скрипта игры (обычный LocalScript,
-- который реально запарентен в дерево game — так вызывают
-- PromptPurchase и т.п. сами разработчики игр) от вызова из
-- инжектнутого/loadstring-кода (у такого либо нет реального Instance
-- за душой, либо checkcaller() уже вернул true раньше в этой же
-- цепочке проверок). Не идеальная защита (некоторые executor'ы могут
-- подделать Instance), но резко снижает число false positive на
-- легитимных покупках в играх.
local function isCallFromRealGameScript()
    if type(getcallingscript) ~= "function" then return false end
    local ok, scr = pcall(getcallingscript)
    if not ok or not scr then return false end
    local descOk, isDesc = pcall(function() return scr:IsDescendantOf(game) end)
    return descOk and isDesc == true
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 3 — СПИСКИ
-- ═══════════════════════════════════════════════════════════════════════
local BLACKLIST = {
    "grabify", "iplogger", "cliip", "blasze", "stopify", "goo.by", "2no.co",
    "yip.su", "leakix", "spylogger", "ip-tracker", "ip-track", "ip-grab",
    "ip-collect", "ip-sniff", "ip-harvest", "ip-capture", "ip-gather",
    "ip-api", "ipify", "apiip", "ipwho", "ipinfo", "ipgeolocation", "ipdata",
    "ipapi", "ipstack", "ip2location", "maxmind", "db-ip", "country.is",
    "ipxapi", "radar", "whoisxmlapi", "geoapify", "iplocate", "iptrackertool",
    "api-ninjas", "apifreaks", "geo.ipify", "findip", "freeipapi", "neutrinoapi",
    "hackertarget", "api.ip.sb", "ipinfodb", "getgeoapi", "geoplugin", "ipregistry",
    "abstractapi", "extreme-ip-lookup", "geolocation-db", "checkip.amazonaws",
    "api.myip", "wtfismyip", "icanhazip", "ifconfig", "ident.me", "httpbin.org",
    "abuseipdb", "virustotal", "otx.alienvault", "threatcrowd", "urlscan",
    "whatismyipaddress", "myip.ms", "ip-detect", "ipchicken", "ip-address.org",
    "ip-score", "ipqualityscore", "scamalytics", "ipscore", "ipintel",
    "ipblacklist", "dnslytics", "viewdns", "yougetsignal", "iplocation.net",
    "geotargeting", "geobytes", "geocode", "maps.googleapis",
    "nominatim.openstreetmap", "ipvigilante", "ip-geolocation.io", "ip-api.io",
    "ip-info.io", "ip-lookup.net", "ip-details.com", "ip-tracker.org",
    "iplogger.com.ua", "iplogger.org.ua", "iplogger.net", "ip-logger.com",
    "logip.net", "trackip.net", "ip-tracker.net", "ipgrabber", "ipgraber",
    "iplis.ru", "iplog.co", "maper.info", "ps3cfw.com", "wl.gl", "bc.ax",
    "ed.tc", "ezstat.ru", "02ip.ru", "browserleaks", "whoer", "ipleak",
    "canarytokens", "roproxy",
    "roware.space", "globalcheats.cc", "darkscripts", "egorikusa",
    "hookbin", "pipedream", "webhook-test.com",
    "webhook.site", "webhook.in", "hook.io",
    "pushover.net", "ntfy.sh", "gotify.net", "matrix.org",
    "requestbin", "leancoding", "beeceptor", "requestcatcher", "run.mocky.io",
}

local SuspiciousTLDs = { "tk", "ml", "ga", "cf", "gq" }

-- Точные домены известных IP-логгеров/шортенеров/буттеров, взятые из
-- публичного фильтр-листа Piperun's IP-Logger Filter (github.com/piperun/
-- iploggerfilter), курируемая часть "Main"/"Standalones". Массовые списки
-- скомпрометированных сайтов 2020 года (разделы "Blazse Loggers" и
-- "PS3CFW Loggers", ~680 доменов) НЕ включены сюда намеренно — это старые,
-- давно не обновлявшиеся списки взломанных обычных сайтов (турагентства,
-- стоматологии, локальный бизнес и т.п.), собранные для контекста
-- ad-block'а в браузере, где цена ложной блокировки нулевая. В контексте
-- скрипта для Roblox эти конкретные домены почти наверняка никогда не
-- встретятся в реальном трафике — а раз так, овчинка выделки не стоит:
-- ежегодно часть таких доменов освобождается и перепродаётся не связанным
-- с логгерами владельцам, что превращает старый список в тихий источник
-- будущих false positive без реальной пользы взамен. Если хочешь — можно
-- добавить и их отдельным файлом, но по умолчанию оставлены только домены
-- из курируемой/актуальной части списка.
-- Проверяются точным совпадением хоста или его поддоменов, O(1) через hash-таблицу.
local EXACT_DOMAIN_SET = {
    ["5.gp"] = true,
    ["7.ly"] = true,
    ["adf.ly"] = true,
    ["adfly-bot.online"] = true,
    ["adfoc.us"] = true,
    ["ahref.tech"] = true,
    ["ajc1.cn"] = true,
    ["alanlindsay.net"] = true,
    ["ampnode.host"] = true,
    ["anonfiles.download"] = true,
    ["anonymousforum.pw"] = true,
    ["aruljohn.com"] = true,
    ["asianrbtrade.net"] = true,
    ["atharori.net"] = true,
    ["barefoot.pics"] = true,
    ["bathtub.pics"] = true,
    ["battlė.net"] = true,
    ["bbcbloggers.co.uk"] = true,
    ["bbcnews.today"] = true,
    ["bc.vc"] = true,
    ["bit.do"] = true,
    ["bitly-bot.com"] = true,
    ["biturl.io"] = true,
    ["bmwforum.co"] = true,
    ["boot4free.com"] = true,
    ["booter.icu"] = true,
    ["bootyou.net"] = true,
    ["bucks.as"] = true,
    ["bvog.com"] = true,
    ["catsnthing.com"] = true,
    ["catsnthings.fun"] = true,
    ["cheapcinema.club"] = true,
    ["cloudfsx.com"] = true,
    ["cnyc99.com"] = true,
    ["community.hackersclub.net"] = true,
    ["crabrave.pw"] = true,
    ["critical-boot.com"] = true,
    ["csgopot.zone"] = true,
    ["cubeupload.xyz"] = true,
    ["cur.lv"] = true,
    ["curiouscat.club"] = true,
    ["cutt.ly"] = true,
    ["cyberh1.xyz"] = true,
    ["dank.host"] = true,
    ["datasig.io"] = true,
    ["datauth.io"] = true,
    ["dateing.club"] = true,
    ["ddos.city"] = true,
    ["deviantartt.ga"] = true,
    ["deviantartt.ml"] = true,
    ["discordcrypt.xyz"] = true,
    ["discörd.com"] = true,
    ["disçordapp.com"] = true,
    ["disċordapp.com"] = true,
    ["downthe.design"] = true,
    ["dr.tl"] = true,
    ["dropbox.desi"] = true,
    ["dropboxx.cf"] = true,
    ["dropboxx.ga"] = true,
    ["dropboxx.lm"] = true,
    ["dxrbc.cn"] = true,
    ["exec-true.eu"] = true,
    ["exploit-db.xyz"] = true,
    ["files.uploads.ws"] = true,
    ["foot.wiki"] = true,
    ["fortnight.space"] = true,
    ["fortnite-stats.site"] = true,
    ["fortnitechat.site"] = true,
    ["fotocerdas.com"] = true,
    ["freeanonymous.host"] = true,
    ["freebooter.pro"] = true,
    ["freegiftcards.co"] = true,
    ["fuglekos.com"] = true,
    ["gamer.hair"] = true,
    ["gamer.tattoo"] = true,
    ["gamergirl.pro"] = true,
    ["gameskeys.shop"] = true,
    ["gaming-at-my.best"] = true,
    ["gamingfun.me"] = true,
    ["go.budurl.co"] = true,
    ["gtadb.net"] = true,
    ["gyazo.nl"] = true,
    ["gyazoo.ga"] = true,
    ["gyazoo.xyz"] = true,
    ["hackernews.online"] = true,
    ["hackforu.ms"] = true,
    ["hackfȯrums.com"] = true,
    ["hackfȯrums.net"] = true,
    ["hbotv.co"] = true,
    ["hdblog.tech"] = true,
    ["headshot.monster"] = true,
    ["hondachat.com"] = true,
    ["hostingonline.desi"] = true,
    ["hs.vc"] = true,
    ["hwhssc.cn"] = true,
    ["i.imger.me"] = true,
    ["iany.pl"] = true,
    ["ikwyd.com"] = true,
    ["imagehost.pics"] = true,
    ["imageshack.ml"] = true,
    ["imageshare.best"] = true,
    ["imagevault.cloud"] = true,
    ["imger.me"] = true,
    ["imghost.pics"] = true,
    ["imgurl.us"] = true,
    ["imgúr.com"] = true,
    ["ip-puller.com"] = true,
    ["ip-trap.com"] = true,
    ["ip.jlynx.net"] = true,
    ["ipddoser.xyz"] = true,
    ["iplo.ru"] = true,
    ["ipsnatcher.com"] = true,
    ["joinmy.site"] = true,
    ["l-imgur.pl"] = true,
    ["leakforum.ga"] = true,
    ["linkify.me"] = true,
    ["linkit.cf"] = true,
    ["login.anal-porn.info"] = true,
    ["lovebird.guru"] = true,
    ["maifile.cn"] = true,
    ["mailble.com"] = true,
    ["mapper.info"] = true,
    ["massive.boats"] = true,
    ["massive.mom"] = true,
    ["media.appspot.com"] = true,
    ["minecraft-skins.xyz"] = true,
    ["minecräft.com"] = true,
    ["mjzssc.cn"] = true,
    ["my-alts.eu"] = true,
    ["my.su"] = true,
    ["myiptest.com"] = true,
    ["mymassive.store"] = true,
    ["mymassive.top"] = true,
    ["mymassive.yachts"] = true,
    ["myprivate.pics"] = true,
    ["networkstresser.com"] = true,
    ["nnmssc.cn"] = true,
    ["noodshare.pics"] = true,
    ["orboot.pw"] = true,
    ["orcahub.com"] = true,
    ["otherhalf.life"] = true,
    ["ouo.io"] = true,
    ["oxystress.eu"] = true,
    ["panel.teamspeak.bz"] = true,
    ["parlament.usa.cc"] = true,
    ["paypal.sellbitcoins.com"] = true,
    ["photovault.pics"] = true,
    ["pichost.pics"] = true,
    ["picshost.pics"] = true,
    ["plz.life"] = true,
    ["postimage.co"] = true,
    ["printscr.ga"] = true,
    ["privatexmpp.me"] = true,
    ["prntsc.cf"] = true,
    ["progaming.monster"] = true,
    ["proxyfill.co"] = true,
    ["publicwiki.m"] = true,
    ["publicwiki.me"] = true,
    ["quickmessage.io"] = true,
    ["quickmessage.us"] = true,
    ["r1p.pw"] = true,
    ["restresser.com"] = true,
    ["rikiki.net"] = true,
    ["rëddït.com"] = true,
    ["sciencefuture.tk"] = true,
    ["screenshare.host"] = true,
    ["screenshare.pics"] = true,
    ["screenshot.best"] = true,
    ["sexy18.webcam"] = true,
    ["shareit.pics"] = true,
    ["shipment.website"] = true,
    ["shorte.st"] = true,
    ["shrekis.life"] = true,
    ["shört.co"] = true,
    ["skidpaste.org"] = true,
    ["skypecracker.xyz"] = true,
    ["skypegrab.net"] = true,
    ["slsh.us"] = true,
    ["snipe.blue"] = true,
    ["soo.gd"] = true,
    ["spoofing.host"] = true,
    ["spottyfly.com"] = true,
    ["spötify.com"] = true,
    ["starbucks.bio"] = true,
    ["starbucksisbadforyou.com"] = true,
    ["starbucksiswrong.com"] = true,
    ["steamtools.co"] = true,
    ["stock-images.0o.si"] = true,
    ["stonks.boats"] = true,
    ["stonks.fun"] = true,
    ["strawpoll.ga"] = true,
    ["strawpolll.ga"] = true,
    ["stresser.science"] = true,
    ["sugma.mom"] = true,
    ["särahah.eu"] = true,
    ["särahah.pl"] = true,
    ["sĸype.com"] = true,
    ["taveo.net"] = true,
    ["thisdomainislong.lol"] = true,
    ["tigercore.eu"] = true,
    ["tiny.cc"] = true,
    ["tldr.ly"] = true,
    ["tnfbc.cn"] = true,
    ["toes.beauty"] = true,
    ["toldyouso.lol"] = true,
    ["toldyouso.pics"] = true,
    ["toolce.cn"] = true,
    ["topcdn.biz"] = true,
    ["topstreaming.us"] = true,
    ["transferfiles.cloud"] = true,
    ["trulove.guru"] = true,
    ["ts3free.top"] = true,
    ["tvshare.co"] = true,
    ["twitch-stats.stream"] = true,
    ["twitte.ga"] = true,
    ["twiţter.com"] = true,
    ["vbooter.org"] = true,
    ["vdos-s.com"] = true,
    ["videoblog.tech"] = true,
    ["viphackforum.xyz"] = true,
    ["viphackforums.xyz"] = true,
    ["watches-my.stream"] = true,
    ["webprofile.me"] = true,
    ["wzurl.me"] = true,
    ["xda-developers.io"] = true,
    ["xda-developers.us"] = true,
    ["xxox.co.uk"] = true,
    ["youramonkey.com"] = true,
    ["yourmy.monster"] = true,
    ["youshouldclick.us"] = true,
    ["youutube.gq"] = true,
    ["yoütu.be"] = true,
    ["yoütübe.co"] = true,
    ["yoütübe.com"] = true,
    ["ythingy.com"] = true,
    ["yum.mom"] = true,
    ["yòutube.com"] = true,
    ["yȯutube.com"] = true,
    ["zjrbc.cn"] = true,
    ["zzb.bz"] = true,
    ["ìṃgur.com"] = true,
    ["ġooģle.com"] = true,
}

-- O(1)-проверка хоста и его родительских доменов по EXACT_DOMAIN_SET
-- (например host = "sub.grabify.link" должен матчиться на "grabify.link").
local function isExactBlacklisted(host)
    if not host or host == "" then return false end
    if EXACT_DOMAIN_SET[host] then return true end
    local rest = host
    while true do
        local dot = sfind(rest, ".", 1, true)
        if not dot then break end
        rest = rest:sub(dot + 1)
        if rest == "" then break end
        if EXACT_DOMAIN_SET[rest] then return true end
    end
    return false
end

local WebhookPatterns = {
    { "discord.com", "/api/webhooks" },
    { "discordapp.com", "/api/webhooks" },
    { "telegram.org", "/bot" },
    { "api.telegram.org", "/bot" },
    { "hooks.slack.com", "/services" },
    { "slack.com", "/services" },
    { "teams.microsoft.com", "/webhook" },
    { "guilded.gg", "/api/webhooks" },
    { "hooks.hyra.io", "" },
    { "hooks.guilded.gg", "" },
    { "zapier.com", "/hooks" },
    { "make.com", "/webhook" },
    { "n8n.cloud", "" },
    { "automate.io", "" },
    { "integromat.com", "" },
}

-- v2.1.4: суффиксы бесплатных хостинг-платформ, на которых стилеры
-- разворачивают webhook-релеи. В разобранных семплах живьём встретились
-- proxykoyeb.onrender.com, rubix-scanner.vercel.app и
-- proxy-plum-beta.vercel.app — все три просто пересылают собранные данные
-- в Discord, обходя блокировку самого discord.com/api/webhooks.
-- Проверяются ТОЛЬКО на POST-запросах (GET на такие домены безобиден:
-- на них часто лежат обычные сайты и статика).
local RelayHostSuffixes = {
    "vercel.app", "onrender.com", "koyeb.app", "workers.dev", "deno.dev",
    "replit.dev", "repl.co", "railway.app", "up.railway.app", "glitch.me",
    "fly.dev", "netlify.app", "pages.dev", "cyclic.app", "adaptable.app",
    "herokuapp.com", "trycloudflare.com", "loca.lt", "serveo.net",
    "ngrok.io", "ngrok-free.app", "ngrok.app", "telebit.io", "cloudno.de",
}

-- v2.1.4: точные exfil-эндпоинты, вытащенные из разобранных семплов.
-- Эти уже засвечены и, скорее всего, часть из них умрёт — но пока живы,
-- блокируются точным совпадением.
local KnownExfilHosts = {
    ["proxykoyeb.onrender.com"] = true,
    ["rubix-scanner.vercel.app"] = true,
    ["proxy-plum-beta.vercel.app"] = true,
    ["pastefy.app"] = true,
}

-- v2.1.5: поля, которые в теле запроса означают РЕАЛЬНУЮ утечку.
-- Идея: webhook сам по себе не преступление. Куча нормальных скриптов
-- шлёт в свой Discord рекорды, статистику фарма, «скрипт запущен» и т.п.
-- Отличается не адрес, а СОДЕРЖИМОЕ: рекорд — это счёт и время, а кража —
-- это cookie, токен авторизации или опись твоего инвентаря.
local SensitiveBodyFields = {
    -- авторизация / захват аккаунта — это всегда красная линия
    "roblosec" .. "urity", "getauthticket", "authticket", "auth_ticket",
    ".robloxsecurity", "securitytoken", "x-csrf-token", "csrftoken",
    "cookie", "cookies", "sessionid", "session_id", "refreshtoken",
    "accesstoken", "access_token", "bearer ",
    -- идентификаторы устройства/сессии, по которым тебя связывают между акками
    "clientid", "client_id", "sessionlogid", "playsessionid",
    "hwid", "hardwareid", "machineid", "identityhash",
    -- опись имущества: типичная «витрина» стилера перед кражей
    "inventory", "backpack_items", "iteminventory", "ownedgamepasses",
    "collectibles", "limiteds", "rap", "totalrap", "networth",
}

-- Поля, характерные для БЕЗОБИДНЫХ webhook'ов (рекорды, лидерборды,
-- статистика). Наличие этих полей само по себе ничего не разрешает,
-- но помогает не считать подозрительным обычный пост про рекорд.
local BenignBodyFields = {
    "score", "highscore", "high_score", "record", "leaderboard",
    "time", "elapsed", "duration", "kills", "deaths", "wins", "losses",
    "level", "stage", "wave", "round", "checkpoint", "progress",
    "version", "status", "started", "finished", "completed",
}

local function countFieldHits(bodyStr, fields)
    if type(bodyStr) ~= "string" or bodyStr == "" then return 0 end
    local bl = bodyStr:lower()
    local hits = 0
    for _, f in ipairs(fields) do
        if sfind(bl, f, 1, true) then
            hits = hits + 1
        end
    end
    return hits
end

-- Решение по webhook'у: блокировать только если в теле есть чувствительные
-- данные. Пустое тело/рекорд/статистика — пропускаем.
-- Возвращает: shouldBlock (bool), reason (string|nil)
local function webhookBodyVerdict(bodyStr)
    local sensitive = countFieldHits(bodyStr, SensitiveBodyFields)
    if sensitive > 0 then
        return true, "утечка чувствительных полей (" .. sensitive .. ")"
    end
    -- Тело есть, но чувствительного в нём нет — это, скорее всего,
    -- обычный рекорд/уведомление. Пропускаем.
    return false, nil
end

local LocationFields = {
    "country", "region", "city", "zip", "postal",
    "lat", "latitude", "lon", "longitude", "timezone",
    "isp", "org", "as", "asn", "country_code", "region_code",
    "continent", "continent_code", "ip", "ipaddress", "ip_address",
    "query", "origin", "ipv4", "ipv6", "publicip", "public_ip"
}

local SuspiciousHeaders = {
    "^x%-forwarded%-for", "^x%-real%-ip", "^cf%-connecting%-ip",
    "^x%-client%-ip", "^forwarded$", "^true%-client%-ip",
    "%-ip$", "^ip$", "^ipaddress$", "^ip_address$",
    "^publicip$", "^public_ip$", "^remoteip$", "^remote_ip$"
}

-- ВАЖНО: строки собраны через конкатенацию (".." вместо цельных литералов).
-- Если написать их одной строкой, наш ЖЕ файл (при повторном запуске
-- через loadstring, например если пользователь выполнит скрипт дважды в
-- одной сессии — второй запуск пройдёт уже ЧЕРЕЗ наш собственный
-- loadstring-хук) будет содержать точно такую подстроку в этой самой
-- таблице и заблокирует сам себя как "стилера". Конкатенация разбивает
-- совпадение на уровне исходного текста, runtime-значение не меняется.
local CodeBlacklistHard = {
    "getcookiesa" .. "sync",
    "roblosecur" .. "ity",
    "webhookrou" .. "ter",
    "getdiscu" .. "ser",
    "cmd" .. ".exe",
    ":50" .. "00/",
    "smallhitswebh" .. "ook",
    "__sab_run_on" .. "ce",
    "stealerst" .. "ock",
}

local CodeBlacklistSoft = {
    "stealer", "stolen", "ratt", "all your items", "linkingservice",
    "grabify", "iplogger", "ipify", "canihazip", "checkip", "externalip",
    "tobi's", "myip", "ipconfig", "trade", "mailbox",
    "discordid", "usernames = {", "usernames = ",
    "discord.com/api/webhooks", "discordapp.com/api/webhooks",
}

local CodeSignaturePatterns = {
    { pattern = "webhook%s*=%s*[\"']", label = "webhook assignment", hard = false },
    { pattern = "%d+%.%d+%.%d+%.%d+:%d+/", label = "raw IP:port URL", hard = false },
}

local ENV_INJECTION_MARKERS = {
    "get" .. "fenv(",
    "_g" .. "." .. "scan",
    "_g" .. "." .. "join",
    "fenv" .. "." .. "webhook",
    "genv" .. "." .. "webhook",
    -- v2.1.4: ещё маркеры из разобранных семплов. Все 8 живых стилеров
    -- устроены одинаково: тонкий загрузчик прописывает конфиг в
    -- getfenv()/genv/_G, а потом делает loadstring(HttpGet(url))().
    -- В самом загрузчике вредоносного кода нет вообще — только URL,
    -- поэтому ловить его по «плохим словам» почти бесполезно, и основная
    -- защита всё равно сетевая (блокировка самого URL). Эти маркеры —
    -- дешёвое дополнение, а не основная линия обороны: любой из них
    -- обходится переименованием переменной.
    "genv" .. "." .. "scripturl",
    "fenv" .. "." .. "scripturl",
    "starscripts" .. "config",
    "genv" .. "." .. "discordid",
    "fenv" .. "." .. "username",
}

local isBlocked
local lastWebhookReason = nil
-- форвард-декларация: журнал активности определяется ниже (в разделе
-- анти-кика), но писать в него нужно уже отсюда, из logBlock.
local logActivity

-- ═══════════════════════════════════════════════════════════════════════
--  v2.1.5 — КОНТЕКСТ ИГРЫ (фикс ложняков на «Steal a Brainrot» и трейд-играх)
-- ═══════════════════════════════════════════════════════════════════════
-- Проблема: скрипт помечал подозрительными слова вроде "steal", "trade",
-- "brainrot". Но есть огромные легальные игры, где эти слова — просто
-- название и механика: Steal a Brainrot, Murder Mystery 2 (трейды),
-- Adopt Me (трейды), Pet Simulator. В таких играх ЛЮБОЙ нормальный
-- скрипт будет содержать эти слова, и он не стилер.
--
-- Решение: смотрим название текущей игры. Если слово встречается в
-- названии игры — оно перестаёт быть уликой ИМЕННО В ЭТОЙ ИГРЕ.
-- Важно: подавляются только «слабые» слова из soft-списка. Жёсткие
-- сигнатуры (cookie, authticket, известные exfil-домены) НЕ подавляются
-- никогда и ни в какой игре — иначе стилеру достаточно было бы
-- запуститься в игре с подходящим названием.
local GameContextWords = {}

do
    local ok = pcall(function()
        local name = ""
        pcall(function()
            local info = Market and Market:GetProductInfo(realGame.PlaceId)
            if info and info.Name then name = tostring(info.Name) end
        end)
        if name == "" then
            -- запасной вариант, если GetProductInfo недоступен/зафейлился
            pcall(function() name = tostring(realGame.Name or "") end)
        end
        name = name:lower()
        -- Слова, которые «прощаются», если они есть в названии игры
        local forgivable = {
            "steal", "stealer", "stealing", "brainrot", "trade", "trading",
            "rob", "robbery", "heist", "grab", "snatch", "loot", "mailbox",
            "murder", "kill", "hack", "obby", "simulator", "tycoon", "pet",
        }
        for _, w in ipairs(forgivable) do
            if sfind(name, w, 1, true) then
                GameContextWords[w] = true
            end
        end
        if next(GameContextWords) ~= nil and getgenv()._log_blocks then
            local list = {}
            for w in pairs(GameContextWords) do list[#list + 1] = w end
            warn("[AntiLogger] Контекст игры «" .. name .. "»: слова {" ..
                 table.concat(list, ", ") .. "} не считаются уликой в этой игре.")
        end
    end)
    if not ok then GameContextWords = {} end
end

-- Слово подавлено контекстом игры?
local function isForgivenByGameContext(word)
    if not getgenv()._game_context_aware then return false end
    return GameContextWords[word:lower()] == true
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 4 — СКАЧИВАНИЕ ИЗОБРАЖЕНИЙ
-- ═══════════════════════════════════════════════════════════════════════
local imageCounter = 0

local function ensureFolder(path)
    pcall(function()
        if not isfolder(path) then
            makefolder(path)
        end
    end)
end

local function autoDeleteFile(filepath)
    task.delay(10, function()
        pcall(function()
            if isfile(filepath) then
                delfile(filepath)
            end
        end)
    end)
end

local function downloadImage(url)
    if isBlocked and type(isBlocked) == "function" then
        local blocked = isBlocked(url, nil, nil, false)
        if blocked then
            warn("[AntiLogger] downloadImage: URL заблокирован фильтром, иконка не загружена: " .. tostring(url))
            return nil
        end
    end

    local req = http_request or (syn and syn.request) or request
    if not req then return nil end

    local folderPath = "./temp/img"
    ensureFolder(folderPath)
    imageCounter = imageCounter + 1
    local filename = folderPath .. "/" .. imageCounter .. ".png"

    local success, res = pcall(function()
        return req({Url = url, Method = "GET"}).Body
    end)

    if success and res then
        pcall(function() writefile(filename, res) end)
        autoDeleteFile(filename)
        if getcustomasset then
            return getcustomasset(filename)
        elseif syn and syn.crypt and syn.crypt.customasset then
            return syn.crypt.customasset(filename)
        end
    end
    return nil
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 5 — СИСТЕМА УВЕДОМЛЕНИЙ (NotifyToast)
-- ═══════════════════════════════════════════════════════════════════════
local CONFIG = {
    SLIDE_IN_TIME = 0.4,
    SLIDE_OUT_TIME = 0.05,
    SCALE_TIME = 0.11,
    SCALE_DOWN = 0.96,
    START_Y = -1,
    END_Y = 59,
    DEFAULT_DURATION = 2,
    BACKGROUND_COLOR = Color3.fromHex("#23262C"),
    TEXT_COLOR = Color3.fromRGB(247, 247, 248),
    WIDTH_OFFSET = -24,
    TITLE_SIZE = 20,
    SUBTITLE_SIZE = 15,
    ICON_SIZE = 40,
    ICON_TEXT_SIZE = 26,
    REMOVE_PREVIOUS = true,
    CORNER_RADIUS = 6,
    MIN_HEIGHT = 55,
    TOAST_HEIGHT_FULL = 77,
    TOAST_HEIGHT_SMALL = 55,
    DEFAULT_ICON = getgenv()._icon_asset or "rbxassetid://83768500686029",
}

local currentToast = nil
local _lastToastKey = nil
local _lastToastTime = 0

local function NotifyToast(config)
    config = config or {}

    local dedupKey = tostring(config.title) .. "||" .. tostring(config.content or config.subtitle)
    local now = tick()
    if dedupKey == _lastToastKey and (now - _lastToastTime) < 1 then
        return
    end
    _lastToastKey = dedupKey
    _lastToastTime = now

    if CONFIG.REMOVE_PREVIOUS and currentToast and currentToast.Parent then
        currentToast:Destroy()
    end

    local toastId = "Toast_" .. HttpService:GenerateGUID(false)

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = toastId
    screenGui.DisplayOrder = 9
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.AutoLocalize = false
    screenGui.ResetOnSpawn = false
    screenGui.ScreenInsets = Enum.ScreenInsets.None
    screenGui.Parent = CoreGui

    currentToast = screenGui

    local container = Instance.new("TextButton")
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.Position = UDim2.new(0.5, 0, 0, CONFIG.START_Y)
    container.BackgroundTransparency = 1
    container.Text = ""
    container.Parent = screenGui

    local sizeConstraint = Instance.new("UISizeConstraint")
    sizeConstraint.MaxSize = Vector2.new(400, math.huge)
    sizeConstraint.Parent = container

    local bg = Instance.new("Frame")
    bg.BackgroundColor3 = CONFIG.BACKGROUND_COLOR
    bg.BackgroundTransparency = 0
    bg.BorderSizePixel = 0
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, CONFIG.CORNER_RADIUS)
    corner.Parent = bg

    local innerFrame = Instance.new("Frame")
    innerFrame.BackgroundTransparency = 1
    innerFrame.Size = UDim2.new(1, 0, 1, 0)
    innerFrame.Parent = bg

    local hList = Instance.new("UIListLayout")
    hList.Padding = UDim.new(0, 12)
    hList.FillDirection = Enum.FillDirection.Horizontal
    hList.SortOrder = Enum.SortOrder.LayoutOrder
    hList.VerticalAlignment = Enum.VerticalAlignment.Center
    hList.Parent = innerFrame

    local msgFrame = Instance.new("Frame")
    msgFrame.BackgroundTransparency = 1
    msgFrame.Size = UDim2.new(1, 0, 1, 0)
    msgFrame.LayoutOrder = 2
    msgFrame.Parent = innerFrame

    local vList = Instance.new("UIListLayout")
    vList.Padding = UDim.new(0, 12)
    vList.SortOrder = Enum.SortOrder.LayoutOrder
    vList.VerticalAlignment = Enum.VerticalAlignment.Center
    vList.Parent = msgFrame

    local textFrame = Instance.new("Frame")
    textFrame.BackgroundTransparency = 1
    textFrame.Size = UDim2.new(1, -48, 0, 0)
    textFrame.AutomaticSize = Enum.AutomaticSize.Y
    textFrame.Parent = msgFrame

    local vList2 = Instance.new("UIListLayout")
    vList2.SortOrder = Enum.SortOrder.LayoutOrder
    vList2.VerticalAlignment = Enum.VerticalAlignment.Center
    vList2.Parent = textFrame

    local title = Instance.new("TextLabel")
    title.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
    title.TextColor3 = CONFIG.TEXT_COLOR
    title.TextSize = CONFIG.TITLE_SIZE
    title.TextWrapped = true
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 0)
    title.AutomaticSize = Enum.AutomaticSize.Y
    title.RichText = true
    title.LayoutOrder = 1
    title.Text = config.title or ""
    title.Parent = textFrame

    local subtitle = Instance.new("TextLabel")
    subtitle.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json")
    subtitle.TextColor3 = CONFIG.TEXT_COLOR
    subtitle.TextSize = CONFIG.SUBTITLE_SIZE
    subtitle.TextWrapped = true
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.BackgroundTransparency = 1
    subtitle.Size = UDim2.new(1, 0, 0, 0)
    subtitle.AutomaticSize = Enum.AutomaticSize.Y
    subtitle.RichText = true
    subtitle.LayoutOrder = 2
    subtitle.Text = config.content or config.subtitle or ""
    subtitle.Parent = textFrame

    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.Parent = innerFrame

    local scaler = Instance.new("UIScale")
    scaler.Scale = 1
    scaler.Parent = container

    local showIcon = config.icon and config.icon ~= ""
    local iconObj

    if showIcon then
        local isUrl = type(config.icon) == "string" and config.icon:match("^https?://")
        local isAsset = type(config.icon) == "string" and (config.icon:match("^rbxassetid://") or config.icon:match("^rbxasset://")) or type(config.icon) == "number"

        if isUrl then
            local asset = downloadImage(config.icon)
            if asset then
                iconObj = Instance.new("ImageLabel")
                iconObj.Image = asset
                iconObj.BackgroundTransparency = 1
                iconObj.Size = UDim2.new(0, CONFIG.ICON_SIZE, 0, CONFIG.ICON_SIZE)
                iconObj.LayoutOrder = 1
                iconObj.Parent = innerFrame
            end
        elseif isAsset then
            local id = type(config.icon) == "number" and "rbxassetid://" .. config.icon or config.icon
            iconObj = Instance.new("ImageLabel")
            iconObj.Image = id
            iconObj.BackgroundTransparency = 1
            iconObj.Size = UDim2.new(0, CONFIG.ICON_SIZE, 0, CONFIG.ICON_SIZE)
            iconObj.LayoutOrder = 1
            iconObj.Parent = innerFrame
        else
            iconObj = Instance.new("TextLabel")
            iconObj.FontFace = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Bold)
            iconObj.Text = config.icon
            iconObj.TextColor3 = CONFIG.TEXT_COLOR
            iconObj.TextSize = CONFIG.ICON_TEXT_SIZE
            iconObj.TextXAlignment = Enum.TextXAlignment.Center
            iconObj.TextYAlignment = Enum.TextYAlignment.Center
            iconObj.BackgroundTransparency = 1
            iconObj.Size = UDim2.new(0, CONFIG.ICON_SIZE, 0, CONFIG.ICON_SIZE)
            iconObj.LayoutOrder = 1
            iconObj.Parent = innerFrame
        end
    end

    local textOffset = showIcon and -48 or 0
    textFrame.Size = UDim2.new(1, textOffset, 0, 0)

    local hasTitle = title.Text ~= ""
    local hasSubtitle = subtitle.Text ~= ""
    local toastHeight = (hasTitle and hasSubtitle) and CONFIG.TOAST_HEIGHT_FULL or CONFIG.TOAST_HEIGHT_SMALL
    toastHeight = math.max(toastHeight, CONFIG.MIN_HEIGHT)

    container.Size = UDim2.new(1, CONFIG.WIDTH_OFFSET, 0, toastHeight)
    bg.Size = UDim2.new(1, 0, 1, 0)
    innerFrame.Size = UDim2.new(1, 0, 1, 0)
    msgFrame.Size = UDim2.new(1, 0, 1, 0)

    local minHeightConstraint = Instance.new("UISizeConstraint")
    minHeightConstraint.MinSize = Vector2.new(0, CONFIG.MIN_HEIGHT)
    minHeightConstraint.Parent = container

    task.wait()

    local actualHeight = container.AbsoluteSize.Y
    local dynamicShowY = CONFIG.END_Y / 2.818 + (actualHeight / 2)

    container.Position = UDim2.new(0.5, 0, 0, CONFIG.START_Y)

    TweenService:Create(container, TweenInfo.new(CONFIG.SLIDE_IN_TIME, Enum.EasingStyle.Quint), {
        Position = UDim2.new(0.5, 0, 0, dynamicShowY)
    }):Play()

    local function hideToast()
        TweenService:Create(container, TweenInfo.new(CONFIG.SLIDE_OUT_TIME, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 0, CONFIG.START_Y)
        }):Play()
        task.delay(CONFIG.SLIDE_OUT_TIME, function()
            if currentToast == screenGui then currentToast = nil end
            screenGui:Destroy()
        end)
    end

    task.delay(config.duration or CONFIG.DEFAULT_DURATION, function()
        if screenGui and screenGui.Parent then hideToast() end
    end)

    container.MouseButton1Down:Connect(function()
        TweenService:Create(scaler, TweenInfo.new(CONFIG.SCALE_TIME), { Scale = CONFIG.SCALE_DOWN }):Play()
    end)

    container.MouseButton1Up:Connect(function()
        TweenService:Create(scaler, TweenInfo.new(CONFIG.SCALE_TIME), { Scale = 1 }):Play()
    end)

    container.MouseButton1Click:Connect(function()
        hideToast()
        if config.callback then config.callback() end
    end)

    container.MouseLeave:Connect(function()
        TweenService:Create(scaler, TweenInfo.new(CONFIG.SCALE_TIME), { Scale = 1 }):Play()
    end)
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 6 — ЛОГИРОВАНИЕ + УВЕДОМЛЕНИЯ
-- ═══════════════════════════════════════════════════════════════════════
local function logBlock(tag, url)
    if logActivity then
        pcall(logActivity, tag, tostring(url))
    end
    if not getgenv()._log_blocks then return end
    local source = getCallingScriptName()

    local consoleTitle
    if tag == "STEALER" then
        consoleTitle = "STEALER - BLOCKED"
    elseif tag == "RELAY" then
        -- v2.1.4: отдельный заголовок, потому что это эвристика, а не
        -- известный плохой домен — пользователю важно понимать разницу,
        -- чтобы он мог занести домен в _whitelist, если это ложняк.
        consoleTitle = "WEBHOOK RELAY (heuristic) - BLOCKED"
    elseif tag == "BARE_IP" then
        consoleTitle = "RAW IP ENDPOINT - BLOCKED"
    else
        consoleTitle = "IP LOGGER - BLOCKED"
    end

    warn("╔═════════━━━ • ━━━═════════╗")
    warn("[ " .. consoleTitle .. " ]")
    warn("Time : " .. os.date("%H:%M:%S"))
    warn("URL : " .. tostring(url))
    warn("Host : " .. getHost(urlDecode(url)))
    warn("Source script : " .. source)
    if lastWebhookReason then
        warn("Reason : " .. lastWebhookReason)
        lastWebhookReason = nil
    end
    warn("╚═════════━━━ • ━━━═════════╝")

    NotifyToast({
        title = consoleTitle,
        content = "Learn more in the console...",
        duration = 5,
        icon = CONFIG.DEFAULT_ICON
    })
end

local function logKick()
    if not getgenv()._log_blocks then return end
    local source = getCallingScriptName()
    warn("╔═════════━━━ • ━━━═════════╗")
    warn("[ STEALER - BLOCKED ]")
    warn("Time : " .. os.date("%H:%M:%S"))
    warn("Source script : " .. source)
    warn("Reason : a stealer (or other Lua script) attempted to kick you")
    warn("╚═════════━━━ • ━━━═════════╝")

    NotifyToast({
        title = "STEALER - BLOCKED",
        content = "Learn more in the console...",
        duration = 5,
        icon = CONFIG.DEFAULT_ICON
    })
end

-- v2.1.0: лог для ReportAbuse-блока
local function logReportAbuse()
    if not getgenv()._log_blocks then return end
    local source = getCallingScriptName()
    warn("╔═════════━━━ • ━━━═════════╗")
    warn("[ REPORTABUSE - BLOCKED ]")
    warn("Time : " .. os.date("%H:%M:%S"))
    warn("Source script : " .. source)
    warn("Reason : script tried to call Players:ReportAbuse() on your behalf")
    warn("╚═════════━━━ • ━━━═════════╝")

    NotifyToast({
        title = "REPORTABUSE - BLOCKED",
        content = "A script tried to file a report using your account. Blocked.",
        duration = 6,
        icon = CONFIG.DEFAULT_ICON
    })
end

-- v2.1.0: лог для блока промпта покупки Robux, с деталями товара если получилось их узнать
local function logRobuxPrompt(methodName, productId, ownerName, price)
    if not getgenv()._log_blocks then return end
    local source = getCallingScriptName()
    warn("╔═════════━━━ • ━━━═════════╗")
    warn("[ ROBUX PROMPT - BLOCKED ]")
    warn("Time : " .. os.date("%H:%M:%S"))
    warn("Method : " .. tostring(methodName))
    warn("Product ID : " .. tostring(productId))
    warn("Owner : " .. tostring(ownerName))
    warn("Price (Robux) : " .. tostring(price))
    warn("Source script : " .. source)
    warn("Reason : script tried to open a Robux purchase prompt without your input")
    warn("╚═════════━━━ • ━━━═════════╝")

    NotifyToast({
        title = "ROBUX PROMPT - BLOCKED",
        content = "Source: " .. source .. " — details in console.",
        duration = 6,
        icon = CONFIG.DEFAULT_ICON
    })
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 7 — ПРОВЕРКА ЗАПРОСОВ
-- ═══════════════════════════════════════════════════════════════════════
local function hasSuspiciousHeaders(headers)
    if type(headers) ~= "table" then return false end
    for k in pairs(headers) do
        local lk = slower(tostring(k))
        for _, pat in ipairs(SuspiciousHeaders) do
            if smatch(lk, pat) then return true end
        end
    end
    return false
end

local function scanForLocationFields(t, depth)
    depth = depth or 0
    if depth > 4 or type(t) ~= "table" then return false end
    for k, v in pairs(t) do
        for _, field in ipairs(LocationFields) do
            if slower(tostring(k)) == field then return true end
        end
        if type(v) == "table" then
            if scanForLocationFields(v, depth + 1) then return true end
        end
    end
    return false
end

local function bodyLeaksLocationFields(body)
    if type(body) ~= "string" or body == "" then return false end
    local ok, decoded = pcall(function() return HttpService:JSONDecode(body) end)
    if not ok or type(decoded) ~= "table" then return false end
    return scanForLocationFields(decoded)
end

isBlocked = function(url, body, headers, isPost)
    if type(url) ~= "string" or url == "" then return false, nil end
    local dUrl = urlDecode(url)
    local host = getHost(dUrl)
    local path = smatch(dUrl, "://[^/]+(/[^?]*)") or ""
    local ul = slower(dUrl)
    local pl = slower(path)
    local bl = slower(type(body) == "string" and urlDecode(body) or "")

    -- ВАЖНО: сигнатура ROBLOX-cookie собрана через конкатенацию по той же
    -- причине, что и CodeBlacklistHard выше — иначе наш собственный
    -- исходник (если его повторно загрузят через loadstring уже после
    -- установки нашего же loadstring-хука) содержал бы это слово одной
    -- строкой и спалил бы сам себя как утечку cookie.
    local COOKIE_SIG_WORD_2 = "roblosecur" .. "ity"
    if sfind(ul, COOKIE_SIG, 1, true) or sfind(ul, COOKIE_SIG_WORD_2, 1, true) or
       sfind(bl, COOKIE_SIG, 1, true) or sfind(bl, COOKIE_SIG_WORD_2, 1, true) then
        if not (host == "roblox.com" or host:sub(-11) == ".roblox.com") then
            return true, "STEALER"
        end
    end

    if isWhitelisted(host) then
        return false, nil
    end

    if isExactBlacklisted(host) then
        return true, "LOGGER"
    end

    -- v2.1.4: точные exfil-эндпоинты из разобранных семплов стилеров
    if KnownExfilHosts[host] then
        return true, "STEALER"
    end

    -- v2.1.4: голый IPv4 вместо домена. Легитимный трафик игры так почти
    -- никогда не ходит, а стилеры используют это, чтобы у их эндпоинта
    -- вообще не было домена, который можно внести в блок-лист.
    if getgenv()._block_bare_ip then
        local a, b, c, d = smatch(host, "^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
        if a then
            a, b, c, d = tonumber(a), tonumber(b), tonumber(c), tonumber(d)
            if a <= 255 and b <= 255 and c <= 255 and d <= 255 then
                -- localhost/LAN не трогаем: некоторые executor'ы гоняют
                -- через них свои локальные сервисы.
                local isLocal = (a == 127) or (a == 10) or
                                (a == 192 and b == 168) or
                                (a == 172 and b >= 16 and b <= 31)
                if not isLocal then
                    return true, "BARE_IP"
                end
            end
        end
    end

    -- v2.1.4: POST на бесплатные хостинг-платформы — типичный webhook-релей.
    if getgenv()._block_relay_hosts and isPost then
        for _, suffix in ipairs(RelayHostSuffixes) do
            if host == suffix or host:sub(-(#suffix + 1)) == "." .. suffix then
                -- v2.1.5: та же логика, что и для webhook'ов. Свой API
                -- на Vercel — не преступление; преступление — слать туда
                -- cookie или опись инвентаря.
                local shouldBlock, why = webhookBodyVerdict(body)
                if shouldBlock then
                    lastWebhookReason = why
                    return true, "RELAY"
                end
                if getgenv()._verbose_soft_warnings then
                    warn("[AntiLogger] Пропущен POST на релей-платформу без чувствительных данных: " .. tostring(host))
                end
            end
        end
    end

    if getgenv()._blockwebhook and isPost then
        for _, pat in ipairs(WebhookPatterns) do
            local hostSuffix, pathSub = pat[1], pat[2]
            local hostMatches = (host == hostSuffix or host:sub(-(#hostSuffix + 1)) == "." .. hostSuffix)
            if hostMatches and (pathSub == "" or sfind(pl, pathSub, 1, true)) then
                -- v2.1.5: РАНЬШЕ здесь стоял безусловный блок любого
                -- webhook'а. Это ломало нормальные скрипты, которые шлют
                -- в свой Discord рекорды/статистику — а таких много.
                -- Теперь решаем по содержимому: cookie/токен/опись
                -- инвентаря = блок, счёт и время = пропускаем.
                if getgenv()._strict_webhook then
                    -- Строгий режим для тех, кому спокойнее блокировать всё.
                    return true, "WEBHOOK"
                end
                local shouldBlock, why = webhookBodyVerdict(body)
                if shouldBlock then
                    lastWebhookReason = why
                    return true, "WEBHOOK"
                end
                -- Пропускаем, но отмечаем в консоли — пусть пользователь
                -- знает, что скрипт куда-то пишет, даже если безобидно.
                if getgenv()._verbose_soft_warnings then
                    warn("[AntiLogger] Пропущен webhook без чувствительных данных: " .. tostring(host))
                end
            end
        end
    end

    for _, p in ipairs(BLACKLIST) do
        if host == p or host:sub(-(#p + 1)) == "." .. p or sfind(host, p, 1, true) then
            return true, "LOGGER"
        end
    end

    for _, tld in ipairs(SuspiciousTLDs) do
        if host:sub(-(#tld + 1)) == "." .. tld then
            return true, "LOGGER"
        end
    end

    if hasSuspiciousHeaders(headers) then
        return true, "STEALER"
    end

    if bodyLeaksLocationFields(body) then
        return true, "LOGGER"
    end

    return false, nil
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 8 — САНИТАЙЗ ОТВЕТА
-- ═══════════════════════════════════════════════════════════════════════
local function sanitizeBody(bodyStr, host)
    if type(bodyStr) ~= "string" or bodyStr == "" then return bodyStr end
    if not getgenv()._sanitize_ip then return bodyStr end
    -- Не трогаем ответы от доверенных/белых доменов — это снижает
    -- риск случайно испортить легитимные данные (версии, координаты
    -- в игре и т.п.), которые совпадают с шаблоном "N.N.N.N", но не
    -- являются IP-адресом и пришли не от подозрительного источника.
    if host and isWhitelisted(host) then return bodyStr end
    local ipv4, ipv6 = fakeIPv4(), fakeIPv6()
    local out = bodyStr:gsub("%d+%.%d+%.%d+%.%d+", ipv4)
    out = out:gsub("%x+:%x+:%x+:%x+:%x+:%x+:%x+:%x+", ipv6)
    return out
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 9 — СКАНИРОВАНИЕ loadstring
-- ═══════════════════════════════════════════════════════════════════════
if getgenv()._scan_loadstring and hookfunction and type(loadstring) == "function" then
    local origLoadstring
    origLoadstring = hookfunction(loadstring, newcclosure(function(code, chunkname)
        local codeStr = tostring(code):lower()
        local source = getCallingScriptName()

        if type(code) == "string" then
            for _, w in ipairs(getgenv()._loadstring_whitelist or {}) do
                if type(w) == "string" and w ~= "" and sfind(codeStr, slower(w), 1, true) then
                    return origLoadstring(code, chunkname)
                end
            end
        end

        for _, word in ipairs(CodeBlacklistHard) do
            if sfind(codeStr, word, 1, true) then
                warn("╔═════════━━━ • ━━━═════════╗")
                warn("[ STEALER - BLOCKED ]")
                warn("Time : " .. os.date("%H:%M:%S"))
                warn("Source script : " .. source)
                warn("Reason : hard signature \"" .. word .. "\"")
                warn("╚═════════━━━ • ━━━═════════╝")
                NotifyToast({
                    title = "STEALER - BLOCKED",
                    content = "Learn more in the console...",
                    duration = 5,
                    icon = CONFIG.DEFAULT_ICON
                })
                return newcclosure(function() end)
            end
        end

        for _, word in ipairs(CodeBlacklistSoft) do
            if sfind(codeStr, word, 1, true) then
                -- v2.1.5: если слово есть в названии самой игры (например
                -- "steal" в «Steal a Brainrot»), это не улика — в такой
                -- игре его содержит любой нормальный скрипт.
                if isForgivenByGameContext(word) then
                    -- пропускаем это слово, ищем дальше
                else
                    if getgenv()._verbose_soft_warnings then
                        warn("[AntiLogger] Внимание: loadstring из \"" .. source .. "\" содержит подозрительное слово \"" .. word .. "\" — код НЕ заблокирован, только предупреждение.")
                    end
                    break
                end
            end
        end

        for _, sig in ipairs(CodeSignaturePatterns) do
            local matched = smatch(codeStr, sig.pattern)
            if matched then
                if sig.hard then
                    warn("╔═════════━━━ • ━━━═════════╗")
                    warn("[ STEALER - BLOCKED ]")
                    warn("Time : " .. os.date("%H:%M:%S"))
                    warn("Source script : " .. source)
                    warn("Reason : pattern signature \"" .. sig.label .. "\"")
                    warn("╚═════════━━━ • ━━━═════════╝")
                    NotifyToast({
                        title = "STEALER - BLOCKED",
                        content = "Learn more in the console...",
                        duration = 5,
                        icon = CONFIG.DEFAULT_ICON
                    })
                    return newcclosure(function() end)
                else
                    if getgenv()._verbose_soft_warnings then
                        warn("[AntiLogger] Внимание: loadstring из \"" .. source .. "\" содержит подозрительный паттерн \"" .. sig.label .. "\" — код НЕ заблокирован, только предупреждение.")
                    end
                end
            end
        end

        if sfind(codeStr, "webhook", 1, true) then
            for _, marker in ipairs(ENV_INJECTION_MARKERS) do
                if sfind(codeStr, marker, 1, true) then
                    if getgenv()._verbose_soft_warnings then
                        warn("[AntiLogger] Внимание: loadstring из \"" .. source .. "\" содержит webhook + признак \"" .. marker .. "\" — код НЕ заблокирован, только предупреждение.")
                    end
                    break
                end
            end
        end

        return origLoadstring(code, chunkname)
    end))
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 10 — ПЕРЕХВАТ __namecall
-- ═══════════════════════════════════════════════════════════════════════
local oldNamecall
local namecallHookOk, namecallHookErr = pcall(function()
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = { ... }
    local url = args[1]
    local body = args[2]

    if method == "HttpGet" or method == "HttpGetAsync" or method == "GetAsync" then
        local blocked, tag = isBlocked(url, nil, nil, false)
        if blocked then
            logBlock(tag, url)
            return ""
        end
        local result = oldNamecall(self, ...)
        if type(result) == "string" then
            return sanitizeBody(result, getHost(urlDecode(url)))
        end
        return result

    elseif method == "HttpPost" or method == "HttpPostAsync" or method == "PostAsync" then
        local blocked, tag = isBlocked(url, body, nil, true)
        if blocked then
            logBlock(tag, url)
            return ""
        end
        return oldNamecall(self, ...)

    elseif method == "RequestAsync" and type(url) == "table" then
        local reqUrl = url.Url or url.url
        local reqBody = url.Body or url.body
        local reqHeaders = url.Headers or url.headers
        local reqMethod = string.upper(tostring(url.Method or "GET"))
        local isPost = (reqMethod ~= "GET")
        local blocked, tag = isBlocked(reqUrl, reqBody, reqHeaders, isPost)
        if blocked then
            logBlock(tag, reqUrl)
            return {
                Success = false,
                StatusCode = 403,
                StatusMessage = "Blocked",
                Body = "",
                Headers = {}
            }
        end
        local result = oldNamecall(self, ...)
        if type(result) == "table" then
            local newResult = {}
            for k, v in pairs(result) do newResult[k] = v end
            if newResult.Body then newResult.Body = sanitizeBody(newResult.Body, getHost(urlDecode(reqUrl))) end
            if newResult.body then newResult.body = sanitizeBody(newResult.body, getHost(urlDecode(reqUrl))) end
            return newResult
        end
        return result

    -- v2.1.0: ReportAbuse через __namecall (некоторые executor'ы роутят
    -- вызов именно через этот путь, а не только через прямой hookfunction
    -- на самой функции — перекрываем оба пути для надёжности)
    elseif method == "ReportAbuse" and getgenv()._anti_reportabuse and not checkcaller() then
        logReportAbuse()
        return
    end

    return oldNamecall(self, ...)
    end))
end)

if not namecallHookOk then
    warn("[AntiLogger] КРИТИЧНО: не удалось установить __namecall хук (Раздел 10). Ошибка: " .. tostring(namecallHookErr))
end

-- ═══════════════════════════════════════════════════════════════════════
--  АНТИ-КИК
-- ═══════════════════════════════════════════════════════════════════════
local kickHookTarget -- ссылка на нашу же __namecall-обёртку в анти-кике (не используется активно после удаления anti-bypass в v2.1.1, оставлена на случай будущих защитных фич)
-- ═══════════════════════════════════════════════════════════════════════
--  v2.1.5 — ЖУРНАЛ АКТИВНОСТИ ДЛЯ ФОРЕНЗИКИ КИКА
-- ═══════════════════════════════════════════════════════════════════════
-- Зачем: типичный сценарий стилера — «скрипт как будто грузится», в это
-- время он через RemoteEvent'ы игры отдаёт твои предметы, а потом кикает,
-- чтобы ты не увидел пропажу и не успел отменить трейд.
--
-- ЧЕСТНО О ГРАНИЦАХ: перехватить саму кражу предметов универсально
-- НЕВОЗМОЖНО. Кража идёт через обычные RemoteEvent'ы самой игры — те же
-- самые, которыми ты пользуешься, когда торгуешь по-настоящему. Со
-- стороны нашего хука вызов «отдать предмет игроку X» выглядит одинаково
-- и когда это твой осознанный трейд, и когда это стилер. Отличить их
-- можно было бы только зная логику каждой игры отдельно, а игр миллионы.
--
-- Что мы РЕАЛЬНО можем: вести короткий журнал подозрительной активности
-- и показать его в момент кика. Кик мы и так блокируем — значит у тебя
-- есть время прочитать журнал, проверить инвентарь и отменить трейд,
-- пока стилер думает, что ты уже вылетел.
local ACTIVITY_LOG_MAX = 25
local activityLog = {}

function logActivity(kind, detail)
    activityLog[#activityLog + 1] = {
        t = os.date("%H:%M:%S"),
        kind = tostring(kind),
        detail = tostring(detail),
    }
    if #activityLog > ACTIVITY_LOG_MAX then
        table.remove(activityLog, 1)
    end
end

local function dumpActivityLog()
    if #activityLog == 0 then
        warn("[AntiLogger] Журнал активности пуст — перед киком ничего подозрительного не зафиксировано.")
        return
    end
    warn("╔═══ ЧТО ПРОИСХОДИЛО ПЕРЕД КИКОМ ═══╗")
    for _, e in ipairs(activityLog) do
        warn("  [" .. e.t .. "] " .. e.kind .. " — " .. e.detail)
    end
    warn("╚═══════════════════════════════════╝")
    warn("[AntiLogger] Кик заблокирован. ПРОВЕРЬ ИНВЕНТАРЬ И ВХОДЯЩИЕ ТРЕЙДЫ ПРЯМО СЕЙЧАС.")
end

if getgenv()._anti_kick then
    local kickHookOk, kickHookErr = pcall(function()
        local p = game:GetService("Players").LocalPlayer
        local o = getrawmetatable(game)
        local s = o.__namecall
        local w = newcclosure(function(self, ...)
            local m = getnamecallmethod()
            if m == "Kick" and self == p then
                logKick()
                if getgenv()._kick_forensics then
                    pcall(dumpActivityLog)
                end
                return
            end
            return s(self, ...)
        end)
        setreadonly(o, false)
        o.__namecall = w
        setreadonly(o, true)
        kickHookTarget = w
    end)

    if not kickHookOk then
        warn("[AntiLogger] Не удалось установить анти-кик хук. Ошибка: " .. tostring(kickHookErr))
    end
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 11 — ХУКИ EXECUTOR-ФУНКЦИЙ
-- ═══════════════════════════════════════════════════════════════════════
local function wrapExecutorRequest(fn)
    if type(fn) ~= "function" then return fn end
    return function(opts, ...)
        if type(opts) ~= "table" then return fn(opts, ...) end
        local reqUrl = opts.Url or opts.URL or opts.url
        local reqBody = opts.Body or opts.body
        local reqHeaders = opts.Headers or opts.headers
        local reqMethod = string.upper(tostring(opts.Method or opts.method or "GET"))
        local isPost = (reqMethod ~= "GET")
        local blocked, tag = isBlocked(reqUrl, reqBody, reqHeaders, isPost)
        if blocked then
            logBlock(tag, reqUrl)
            return { Success = false, StatusCode = 403, StatusMessage = "Blocked", Body = "", Headers = {} }
        end
        local result = fn(opts, ...)
        if type(result) == "table" then
            local newResult = {}
            for k, v in pairs(result) do newResult[k] = v end
            local respHost = getHost(urlDecode(reqUrl))
            if newResult.Body then newResult.Body = sanitizeBody(newResult.Body, respHost) end
            if newResult.body then newResult.body = sanitizeBody(newResult.body, respHost) end
            return newResult
        end
        return result
    end
end

local HookStatus = {}

local function tryHookGlobal(name, getter, setter)
    local ok, fn = pcall(getter)
    if not ok or type(fn) ~= "function" then
        HookStatus[name] = "не найдена"
        return
    end
    local wrapped = wrapExecutorRequest(fn)
    local applied = pcall(setter, wrapped)
    if not applied then
        HookStatus[name] = "ошибка установки"
        return
    end
    local verifyOk, current = pcall(getter)
    if verifyOk and current == wrapped then
        HookStatus[name] = "ok"
    else
        HookStatus[name] = "не применилось (возможно readonly)"
    end
end

tryHookGlobal("request", function() return request end, function(w) getgenv().request = w; _G.request = w end)
tryHookGlobal("http_request", function() return http_request end, function(w) getgenv().http_request = w; _G.http_request = w end)
tryHookGlobal("syn.request", function() return syn and syn.request end, function(w) syn.request = w end)
tryHookGlobal("Fluxus.request", function() return Fluxus and Fluxus.request end, function(w) Fluxus.request = w end)
tryHookGlobal("KRNL_LOADED.request", function() return KRNL_LOADED and KRNL_LOADED.request end, function(w) KRNL_LOADED.request = w end)

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 12 — WEBSOCKET
-- ═══════════════════════════════════════════════════════════════════════
if type(WebSocket) == "table" and type(WebSocket.connect) == "function" then
    local origConnect = WebSocket.connect
    local function newConnect(url, ...)
        local blocked, tag = isBlocked(url, nil, nil, false)
        if blocked then
            logBlock(tag, url)
            return nil
        end
        local sock = origConnect(url, ...)
        if sock and type(sock) == "table" and type(sock.Send) == "function" then
            local origSend = sock.Send
            local function newSend(self, message)
                if type(message) == "string" and sfind(slower(message), COOKIE_SIG, 1, true) then
                    logBlock("STEALER", url)
                    return
                end
                return origSend(self, message)
            end
            pcall(function() sock.Send = newSend end)
        end
        return sock
    end
    pcall(function() WebSocket.connect = newConnect end)
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 13 — ANTI ROBUX/ABUSE (новое в v2.1.0)
--  Прямые hookfunction на ReportAbuse и всех промптах покупки — дублирует
--  проверку ReportAbuse из Раздела 10 (некоторые executor'ы вызывают метод
--  напрямую как функцию, минуя __namecall — перекрываем оба пути).
-- ═══════════════════════════════════════════════════════════════════════
local protectedFunctions = {} -- заполняется ниже, нужно для anti-bypass (Раздел 14)

if getgenv()._anti_reportabuse and type(hookfunction) == "function" then
    local ok, origReportAbuse = pcall(function()
        return hookfunction(Players.ReportAbuse, newcclosure(function(self, ...)
            if not checkcaller() then
                logReportAbuse()
                return
            end
            return protectedFunctions.ReportAbuse.orig(self, ...)
        end))
    end)
    if ok then
        protectedFunctions.ReportAbuse = { orig = origReportAbuse, wrapped = Players.ReportAbuse }
    else
        warn("[AntiLogger] Не удалось захукать ReportAbuse: " .. tostring(origReportAbuse))
    end
end

if getgenv()._anti_robux_prompt and type(hookfunction) == "function" then
    local robuxMethods = {
        "PromptPurchase", "PromptGamePassPurchase", "PromptProductPurchase",
        "PromptBundlePurchase", "PromptPremiumPurchase", "PromptSubscriptionPurchase",
        "PerformPurchase", "PerformPurchaseV2",
    }

    for _, methodName in ipairs(robuxMethods) do
        local target = Market[methodName]
        if type(target) == "function" then
            local ok, origFn = pcall(function()
                return hookfunction(target, newcclosure(function(self, ...)
                    -- checkcaller() == true: вызов пришёл с C-стороны (сам движок/executor).
                    -- isCallFromRealGameScript() == true: вызов пришёл из обычного
                    -- LocalScript, который реально лежит в дереве game — это штатный
                    -- способ, которым игры показывают магазин при клике "купить".
                    -- Блокируем ТОЛЬКО то, что не подходит ни под один из этих
                    -- случаев (типичный признак инжектнутого/loadstring-кода).
                    if checkcaller() or isCallFromRealGameScript() then
                        return protectedFunctions[methodName].orig(self, ...)
                    end

                    local args = { ... }
                    local productId = args[2] or args[1]
                    local ownerName, price = "unknown", "unknown"

                    pcall(function()
                        local info = Market:GetProductInfo(productId)
                        if info then
                            price = info.PriceInRobux or "unknown"
                            if info.CreatorTargetId then
                                local nameOk, n = pcall(function()
                                    return Players:GetNameFromUserIdAsync(info.CreatorTargetId)
                                end)
                                if nameOk then ownerName = n end
                            end
                        end
                    end)

                    logRobuxPrompt(methodName, productId, ownerName, price)
                    return
                end))
            end)
            if ok then
                protectedFunctions[methodName] = { orig = origFn, wrapped = target }
            end
        end
    end
end

-- ═══════════════════════════════════════════════════════════════════════
--  РАЗДЕЛ 14 — (убран в v2.1.1)
--  Здесь был Anti-Bypass: перехват hookfunction/clonefunction на самих
--  себе, чтобы защитить наши хуки от снятия. Убран после того, как
--  вызвал реальный краш клиента (SIGSEGV) на Android — стектрейс
--  показывал бесконечную рекурсию, характерную именно для самохука
--  hookfunction через hookfunction: на некоторых executor'ах внутренняя
--  реализация при установке хука сама обращается к hookfunction, а мы
--  к этому моменту уже подменили глобальную ссылку на свою версию —
--  получается зацикливание на нативном уровне, а не в Lua, которое
--  pcall не ловит и не может остановить. Выгода от этой защиты (блок
--  попыток снять другие наши хуки) не стоит риска краша всего клиента.
-- ═══════════════════════════════════════════════════════════════════════
