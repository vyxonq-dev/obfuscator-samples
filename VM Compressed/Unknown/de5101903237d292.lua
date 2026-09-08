local function executeFallback()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1Qlua-RBXscript/1qlua/refs/heads/main/V2/Proverka"))()
end

local function checkFolderAndExecute()
    -- Обертка в pcall для перехвата любых ошибок
    local success, err = pcall(function()
        if isfolder and isfolder("1qluaNoRuKey") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1Qlua-RBXscript/1qlua/refs/heads/main/V2/ru/key/1qluaKeyRu"))()
        else
            executeFallback() -- Если папки нет, запускаем Proverka
        end
    end)

    -- Если возникла ошибка (например, Players is not a valid member), запускаем Proverka
    if not success then
        warn("Ошибка: " .. err .. "\nЗапуск резервного скрипта...")
        executeFallback()
    end
end

checkFolderAndExecute()