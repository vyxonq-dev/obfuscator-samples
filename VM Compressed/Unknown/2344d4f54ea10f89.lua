local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local BillboardUpdate = ReplicatedStorage.Remotes.BillboardUpdate
local SubmitWord      = ReplicatedStorage.Remotes.SubmitWord
local TypeSound       = ReplicatedStorage.Remotes.TypeSound
local WordServerLabel = PlayerGui.MatchUI.BottomUI.TopUI.WordServerFrame.WordServer
local UsedWordWarn    = PlayerGui.MatchUI.UsedWordWarn
local KeyboardFrame   = PlayerGui.MatchUI.BottomUI.Keyboard

local cheatEnabled = false
local usedWords    = {}
local lastHuruf    = ""
local isTyping     = false
local wordRejected = false
local KBBI         = {}
local kbbiLoaded   = false

-- =============================================
-- LOAD KBBI DARI GITHUB
-- =============================================
local function loadKBBI()
    print("[SBX] Mengunduh KBBI dari GitHub...")
    local ok, result = pcall(function()
        local json = game:HttpGet("https://raw.githubusercontent.com/pearanoids/Sambung-Kata-Roblox/refs/heads/main/Kamus%20Besar%20Bahasa%20Indonesia/kbbi.json")
        return HttpService:JSONDecode(json)
    end)

    if ok and result then
        KBBI = result
        local count = 0
        for _, words in pairs(KBBI) do
            count = count + #words
        end
        kbbiLoaded = true
        print("[SBX] Berhasil load " .. count .. " kata!")
        Rayfield:Notify({
            Title = "KBBI Berhasil Dimuat!",
            Content = count .. " kata siap digunakan",
            Duration = 5,
        })
    else
        kbbiLoaded = false
        print("[SBX] Gagal load: " .. tostring(result))
        Rayfield:Notify({
            Title = "KBBI Gagal Dimuat!",
            Content = "Cek koneksi atau link GitHub",
            Duration = 4,
        })
    end
end

task.spawn(loadKBBI)

-- =============================================
-- AMBIL KATA DARI INDEX GAME
-- =============================================
local function getGameWords(huruf)
    local words = {}
    pcall(function()
        local label = PlayerGui.MenuUI.IndexFrame.IndexContent.Book["WordIndex"..huruf:upper()].IndexScrolling.Words
        for word in label.Text:gmatch("[^\n]+") do
            word = word:match("^%s*(.-)%s*$")
            if #word > 0 then table.insert(words, word:lower()) end
        end
    end)
    return words
end

-- =============================================
-- CARI KATA (support awalan 1/2/3 huruf)
-- Prioritas: KBBI spesifik awalan > KBBI huruf pertama > Index game
-- Minimal 3 huruf
-- =============================================
local function findWord(awalan)
    awalan = awalan:lower()
    local firstChar = awalan:sub(1,1):upper()
    local list, seen = {}, {}

    -- Prioritas 1: KBBI dengan key awalan spesifik (misal "ia", "sib", dll)
    local specificList = KBBI[awalan] or KBBI[awalan:upper()] or {}
    for _, w in ipairs(specificList) do
        w = tostring(w):lower()
        if not seen[w] then seen[w]=true; table.insert(list, w) end
    end

    -- Prioritas 2: KBBI huruf pertama (misal "I", "S", dll)
    local generalList = KBBI[firstChar] or {}
    for _, w in ipairs(generalList) do
        w = tostring(w):lower()
        if not seen[w] then seen[w]=true; table.insert(list, w) end
    end

    -- Prioritas 3: Index game sebagai fallback terakhir
    for _, w in ipairs(getGameWords(firstChar)) do
        if not seen[w] then seen[w]=true; table.insert(list, w) end
    end

    for _, word in ipairs(list) do
        if not usedWords[word]
        and word:sub(1, #awalan) == awalan
        and #word >= 3 then
            return word
        end
    end
    return nil
end

-- =============================================
-- CLEAR INPUT
-- =============================================
local function clearCurrentWord(currentWord)
    for i = #currentWord - 1, 0, -1 do
        if i == 0 then
            pcall(function() BillboardUpdate:FireServer("") end)
        else
            pcall(function() BillboardUpdate:FireServer(currentWord:sub(1, i)) end)
        end
        task.wait(0.05)
    end
    task.wait(0.1)
end

-- =============================================
-- SUBMIT KATA
-- =============================================
local function submitAnswer(fullWord)
    wordRejected = false

    for i = 2, #fullWord do
        local current = fullWord:sub(1, i)
        pcall(function() TypeSound:FireServer() end)
        pcall(function() BillboardUpdate:FireServer(current) end)
        task.wait(0.15)
    end

    task.wait(0.1)
    pcall(function() SubmitWord:FireServer(fullWord) end)
    print("[SBX] Mengirim: " .. fullWord)

    local waited = 0
    while waited < 1.5 do
        task.wait(0.1)
        waited = waited + 0.1
        if wordRejected then return false end
        if not KeyboardFrame.Visible then return true end
    end

    if wordRejected then return false end
    return true
end

-- =============================================
-- DETEKSI KATA DITOLAK
-- =============================================
local UpdatePrompt = ReplicatedStorage.Remotes:FindFirstChild("UpdatePromptVisibility")
if UpdatePrompt then
    UpdatePrompt.OnClientEvent:Connect(function()
        if isTyping then
            wordRejected = true
            print("[SBX] Server menolak kata!")
        end
    end)
end

task.spawn(function()
    local lastWarn = ""
    while true do
        task.wait(0.2)
        local ok, text = pcall(function() return UsedWordWarn.Text end)
        if ok and text and text ~= "" and text ~= lastWarn then
            lastWarn = text
            if isTyping then
                wordRejected = true
            end
            local rejected = text:lower():match("'([a-z]+)'")
                          or text:lower():match('"([a-z]+)"')
                          or text:lower():match("kata[%s:]+([a-z]+)")
            if rejected then
                usedWords[rejected] = true
                print("[SBX] Ditolak: " .. rejected)
            end
        end
    end
end)

-- =============================================
-- CEK GILIRAN
-- =============================================
local function isMyTurn()
    local ok, visible = pcall(function() return KeyboardFrame.Visible end)
    return ok and visible == true
end

-- =============================================
-- JAWAB DENGAN AUTO RETRY
-- =============================================
local function doAnswer(awalan)
    local maxTry = 15
    local tried  = 0

    while tried < maxTry do
        if not isMyTurn() or not cheatEnabled then return end

        local word = findWord(awalan)
        if not word then
            print("[SBX] Semua kata sudah habis untuk awalan: '" .. awalan .. "'")
            Rayfield:Notify({
                Title = "Data Kamus Sudah Habis!",
                Content = "Tidak ada kata untuk '"..awalan.."'",
                Duration = 5,
            })
            return
        end

        tried = tried + 1
        usedWords[word] = true
        wordRejected    = false

        print("[SBX] Coba ["..tried.."]: " .. word)

        local success = submitAnswer(word)

        if success then
            print("[SBX] Berhasil: " .. word)
            Rayfield:Notify({
                Title = "Auto Jawab ✓",
                Content = "['"..awalan.."'] → " .. word,
                Duration = 2,
            })
            return
        else
            print("[SBX] Ditolak, coba kata lain...")
            wordRejected = false
            clearCurrentWord(word)
            task.wait(0.3)
        end
    end

    print("[SBX] Gagal setelah " .. maxTry .. " percobaan")
    Rayfield:Notify({
        Title = "Gagal!",
        Content = "Tidak bisa jawab '"..awalan.."'",
        Duration = 3,
    })
end

-- =============================================
-- MAIN LOOP
-- =============================================
task.spawn(function()
    while true do
        task.wait(0.3)
        if not cheatEnabled or isTyping then continue end

        if not isMyTurn() then
            lastHuruf = ""
            continue
        end

        local ok, awalan = pcall(function()
            return WordServerLabel.Text:gsub("%s+","")
        end)
        if not ok or not awalan or #awalan == 0 or #awalan > 3 then continue end
        if not awalan:match("^[A-Za-z]+$") then continue end

        awalan = awalan:lower()
        if awalan == lastHuruf then continue end

        lastHuruf = awalan
        print("[SBX] GILIRAN KITA! Awalan: '" .. awalan .. "'")

        task.wait(math.random(60, 120) / 100)

        if not cheatEnabled or not isMyTurn() then continue end

        isTyping = true
        doAnswer(awalan)
        isTyping = false
    end
end)

-- =============================================
-- RAYFIELD GUI
-- =============================================
local Window = Rayfield:CreateWindow({
    Name = "SBX Script  |  Sambung Kata",
    LoadingTitle = "SBX Script",
    LoadingSubtitle = "Sambung Kata — by pearanoids",
    Theme = "Default",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- =============================================
-- TAB: MAIN
-- =============================================
local TabMain = Window:CreateTab("Main", 4483362458)

TabMain:CreateSection("Automation")

TabMain:CreateToggle({
    Name = "Auto Jawab",
    CurrentValue = false,
    Flag = "AutoJawab",
    Callback = function(val)
        cheatEnabled = val
        lastHuruf = ""
        if val then
            Rayfield:Notify({ Title = "Auto Jawab ON", Content = "SBX mulai memantau giliranmu!", Duration = 2 })
        else
            Rayfield:Notify({ Title = "Auto Jawab OFF", Content = "SBX dihentikan.", Duration = 2 })
        end
    end,
})

-- =============================================
-- TAB: REFRESH
-- =============================================
local TabRefresh = Window:CreateTab("Refresh", 4483362458)

TabRefresh:CreateSection("Database")

TabRefresh:CreateButton({
    Name = "Reload KBBI",
    Callback = function()
        KBBI = {}
        kbbiLoaded = false
        Rayfield:Notify({ Title = "Memuat Ulang...", Content = "Mengunduh database KBBI", Duration = 2 })
        task.spawn(loadKBBI)
    end,
})

TabRefresh:CreateButton({
    Name = "Reset Kata Terpakai",
    Callback = function()
        usedWords = {}
        lastHuruf = ""
        Rayfield:Notify({ Title = "Reset Berhasil", Content = "Kosa kata telah direset!", Duration = 2 })
    end,
})

TabRefresh:CreateSection("Informations")

TabRefresh:CreateParagraph({
    Title = "● Reload KBBI",
    Content = "Untuk memuat ulang kosakata dari Database. Gunakan ini jika cheat tidak berfungsi.",
})

TabRefresh:CreateParagraph({
    Title = "● Reset Kata Terpakai",
    Content = "Gunakan ini setelah permainan selesai agar Script berjalan dengan baik.",
})

-- =============================================
-- TAB: INFORMATION
-- =============================================
local TabInfo = Window:CreateTab("Information", 4483362458)

TabInfo:CreateSection("Credits")

TabInfo:CreateLabel("Developed by @pearanoids")

print("[SBX Script] Sambung Kata loaded!")
