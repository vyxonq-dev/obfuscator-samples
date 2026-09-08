local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local RANDOM_IDS = {978663613,5261700291,1846241644,4993456331,424866237,4312175249,176548116,2270483006,1387071394,2705922253,10115152913,254675749,5282085572,2819144629,2342272463,3877709773,3641789924,5023103942,2298753899,5022264302,66372478,1059023987,2530406197,1992137495,402058769,1208673935,1735121788,3236271187,4797655515,8820259986,1538346377,7081300715,1648676291,2818915354,263336582,1510381464,683993767,1033636351,4004052767,7709627778,5196381745,4983064295,937392108,974086214,6004535943,744532329,2216132529,797871247,442581442,7927897698,4344692203,113408119,4439685307,670917583,5158458988,373349,2994206407,596318021,2574010621,7757117305,1780106970,3872493784,382383327,1921058820,1817915221,2799348313,189511979}

local SVC = setmetatable({}, {__index = function(s, n) s[n] = game:GetService(n) return s[n] end})
local LP = SVC.Players.LocalPlayer
local HttpService = SVC.HttpService

local CURRENT_AVATAR = nil
local ORIGINAL_DESC = nil
local FAVORITES = {}

local FavDropdownRef = nil
local SelectedFavIndex = 0
local InputValue = ""
local Applying = false
local RespawnConnection = nil

local function GetHumanoid(char)
    if not char then
        return nil
    end
    return char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 10)
end

local function CaptureOriginal()
    local char = LP.Character
    local hum = GetHumanoid(char)
    if hum then
        local ok, desc = pcall(function()
            return hum:GetAppliedDescription()
        end)
        if ok and desc then
            ORIGINAL_DESC = desc
        end
    end
end

local function LoadFavorites()
    FAVORITES = {}
    pcall(function()
        if not isfolder("AvatarChanger") then
            makefolder("AvatarChanger")
        end
        if isfile("AvatarChanger/favorites.json") then
            local data = readfile("AvatarChanger/favorites.json")
            local decoded = HttpService:JSONDecode(data)
            if type(decoded) == "table" then
                FAVORITES = decoded
            end
        end
    end)
end

local function SaveFavorites()
    pcall(function()
        if not isfolder("AvatarChanger") then
            makefolder("AvatarChanger")
        end
        writefile("AvatarChanger/favorites.json", HttpService:JSONEncode(FAVORITES))
    end)
end

local function SafeClearCharacter(char)
    if not char then
        return
    end

    for _, v in ipairs(char:GetChildren()) do
        if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("CharacterMesh") or v:IsA("BodyColors") then
            v:Destroy()
        end
    end

    local head = char:FindFirstChild("Head")
    if head then
        local face = head:FindFirstChild("face")
        if face then
            face:Destroy()
        end
    end
end

local function MorphChar(char, name, id, desc)
    task.spawn(function()
        local hum = GetHumanoid(char)
        if not hum then
            return
        end

        SafeClearCharacter(char)

        local ok = pcall(function()
            hum:ApplyDescriptionClientServer(desc)
            hum.DisplayName = name
        end)

        if not ok then
            task.wait(0.2)
            pcall(function()
                hum:ApplyDescriptionClientServer(desc)
                hum.DisplayName = name
            end)
        end
    end)
end

local function ResolveUser(input)
    local inputText = tostring(input):gsub("%s+", "")
    local id = tonumber(inputText)
    local name = nil

    if id then
        local ok = pcall(function()
            name = SVC.Players:GetNameFromUserIdAsync(id)
        end)
        if not ok or not name then
            return nil, nil
        end
        return id, name
    else
        local ok = pcall(function()
            id = SVC.Players:GetUserIdFromNameAsync(inputText)
            name = SVC.Players:GetNameFromUserIdAsync(id)
        end)
        if not ok or not id or not name then
            return nil, nil
        end
        return id, name
    end
end

local function ApplyAvatar(userid)
    if Applying then
        return
    end

    Applying = true

    task.spawn(function()
        local ok = xpcall(function()
            local id, name = ResolveUser(userid)

            if not id or not name then
                Rayfield:Notify({Title = "Error", Content = "Could not find that user.", Duration = 3})
                Applying = false
                return
            end

            if CURRENT_AVATAR and CURRENT_AVATAR.id == id then
                Rayfield:Notify({Title = "Error", Content = "This avatar is already applied!", Duration = 3})
                Applying = false
                return
            end

            local desc = SVC.Players:GetHumanoidDescriptionFromUserId(id)
            if not desc then
                Rayfield:Notify({Title = "Error", Content = "Could not get avatar description.", Duration = 3})
                Applying = false
                return
            end

            CURRENT_AVATAR = {id = id, name = name, desc = desc}

            if RespawnConnection then
                RespawnConnection:Disconnect()
                RespawnConnection = nil
            end

            if LP.Character then
                MorphChar(LP.Character, name, id, desc)
            end

            RespawnConnection = LP.CharacterAdded:Connect(function(char)
                task.wait(0.3)
                if CURRENT_AVATAR and CURRENT_AVATAR.id == id then
                    MorphChar(char, name, id, desc)
                end
            end)

            Rayfield:Notify({Title = "Applied", Content = "Now using " .. name .. " avatar.", Duration = 3})
        end, warn)

        Applying = false

        if not ok then
            Rayfield:Notify({Title = "Error", Content = "Failed to apply avatar.", Duration = 3})
        end
    end)
end

local function GetFavNames()
    local names = {}

    for i, v in ipairs(FAVORITES) do
        table.insert(names, tostring(i) .. ":" .. v.name .. " (" .. tostring(v.id) .. ")")
    end

    if #names == 0 then
        table.insert(names, "No favorites saved")
    end

    return names
end

local function RefreshFavoritesDropdown()
    if not FavDropdownRef then
        return
    end

    local options = GetFavNames()
    SelectedFavIndex = 0

    pcall(function()
        FavDropdownRef:Refresh(options)
    end)
end

CaptureOriginal()
LP.CharacterAdded:Connect(function()
    task.wait(0.5)
    CaptureOriginal()
end)

LoadFavorites()

local Window = Rayfield:CreateWindow({
    Name = "Gojo Skin Changer",
    LoadingTitle = "Gojo Skin Changer",
    LoadingSubtitle = "Loading...",
    Theme = "Default",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

local ChangerTab = Window:CreateTab("Changer")
local FavoritesTab = Window:CreateTab("Favorites")

ChangerTab:CreateInput({
    Name = "User ID or Username",
    CurrentValue = "",
    PlaceholderText = "Enter User ID or Username",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        InputValue = text
    end
})

ChangerTab:CreateButton({
    Name = "Apply",
    Callback = function()
        if InputValue == "" then
            Rayfield:Notify({Title = "Error", Content = "Please enter a User ID or Username.", Duration = 3})
            return
        end
        ApplyAvatar(InputValue)
    end
})

ChangerTab:CreateButton({
    Name = "Random",
    Callback = function()
        local rnd = RANDOM_IDS[math.random(1, #RANDOM_IDS)]
        InputValue = tostring(rnd)
        ApplyAvatar(rnd)
    end
})

ChangerTab:CreateButton({
    Name = "Reset to Original",
    Callback = function()
        if not CURRENT_AVATAR then
            Rayfield:Notify({Title = "Error", Content = "Already reset.", Duration = 3})
            return
        end

        if ORIGINAL_DESC and LP.Character then
            local char = LP.Character
            local hum = GetHumanoid(char)

            if hum then
                SafeClearCharacter(char)
                pcall(function()
                    hum:ApplyDescriptionClientServer(ORIGINAL_DESC)
                    hum.DisplayName = LP.DisplayName
                end)
            end
        end

        CURRENT_AVATAR = nil

        if RespawnConnection then
            RespawnConnection:Disconnect()
            RespawnConnection = nil
        end

        Rayfield:Notify({Title = "Reset", Content = "Avatar reset to original.", Duration = 3})
    end
})

FavDropdownRef = FavoritesTab:CreateDropdown({
    Name = "Select Favorite",
    Options = GetFavNames(),
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(option)
        local selected = option

        if type(option) == "table" then
            selected = option[1]
        end

        if type(selected) == "string" and selected:match("^%d+:") then
            local idx = tonumber(selected:match("^(%d+):"))
            if idx and idx >= 1 and idx <= #FAVORITES then
                SelectedFavIndex = idx
            else
                SelectedFavIndex = 0
            end
        else
            SelectedFavIndex = 0
        end
    end
})

FavoritesTab:CreateButton({
    Name = "Add Current Avatar to Favorites",
    Callback = function()
        if not CURRENT_AVATAR then
            Rayfield:Notify({Title = "Error", Content = "No avatar is currently applied.", Duration = 3})
            return
        end

        for _, v in ipairs(FAVORITES) do
            if tonumber(v.id) == tonumber(CURRENT_AVATAR.id) then
                Rayfield:Notify({Title = "Error", Content = "This avatar is already in favorites.", Duration = 3})
                return
            end
        end

        table.insert(FAVORITES, {
            id = CURRENT_AVATAR.id,
            name = CURRENT_AVATAR.name
        })

        SaveFavorites()
        RefreshFavoritesDropdown()

        Rayfield:Notify({Title = "Added", Content = "Saved " .. CURRENT_AVATAR.name .. " to favorites.", Duration = 3})
    end
})

FavoritesTab:CreateButton({
    Name = "Apply Selected Favorite",
    Callback = function()
        if #FAVORITES == 0 then
            Rayfield:Notify({Title = "Error", Content = "No favorites saved.", Duration = 3})
            return
        end

        if SelectedFavIndex < 1 or SelectedFavIndex > #FAVORITES then
            Rayfield:Notify({Title = "Error", Content = "Please select a favorite from the dropdown.", Duration = 3})
            return
        end

        local fav = FAVORITES[SelectedFavIndex]
        if not fav then
            Rayfield:Notify({Title = "Error", Content = "Favorite not found.", Duration = 3})
            return
        end

        ApplyAvatar(fav.id)
    end
})

FavoritesTab:CreateButton({
    Name = "Delete Selected Favorite",
    Callback = function()
        if #FAVORITES == 0 then
            Rayfield:Notify({Title = "Error", Content = "No favorites to delete.", Duration = 3})
            return
        end

        if SelectedFavIndex < 1 or SelectedFavIndex > #FAVORITES then
            Rayfield:Notify({Title = "Error", Content = "Please select a favorite to delete.", Duration = 3})
            return
        end

        local removedName = FAVORITES[SelectedFavIndex].name
        table.remove(FAVORITES, SelectedFavIndex)
        SelectedFavIndex = 0

        SaveFavorites()
        RefreshFavoritesDropdown()

        Rayfield:Notify({Title = "Deleted", Content = removedName .. " removed from favorites.", Duration = 3})
    end
})