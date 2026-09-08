local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌸 Soft Blossom Hub 🌸",
    Icon = 0,
    LoadingTitle = "Soft Blossom Interface",
    LoadingSubtitle = "by Moon",
    ShowText = "Rayfield",
    Theme = "Bloom", -- Blossom theme
    ToggleUIKeybind = "M",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SoftBlossomUI",
        FileName = "CuteBlossoms"
    },
    KeySystem = false,
    KeySettings = {
        Title = "🌸Soft Blossom Key System🌸",
        Subtitle = "Enter the secret key",
        Note = "🌸The Journey Awaits🌺",
        FileName = "BlossomKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"themoonandsunreunite"}
    }
})

-- 🌸 Create Main Tab
local MainTab = Window:CreateTab("🌸 Main 🌸", "flower")

local MainSection = MainTab:CreateSection("Game Scripts 🌺")

MainTab:CreateButton({
    Name = "🌸Activate Evermoon 2 Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/7cb557718565155b2e0128e32613d41a/raw/51cd1cebfba1445b6f9972e9434d15fae5ab8684/gistfile1.txt'))()
        Rayfield:Notify({Title="Evermoon 2", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Activate The Witches Phrophecies Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/b0b136384af2234cf006f4d1291a15d5/raw/74b9ba72acb4e3afce027832ec8703adc8d21ca3/gistfile1.txt'))()
        Rayfield:Notify({Title="The Witches Phrophecies", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Activate Realms Of The Multiverse Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/sleepyn1x/n1x-scripts/main/ROTM script'))()
        Rayfield:Notify({Title="Realms Of The Multiverse", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Coven Of Chaos🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/04b18425a59a5599e6a6086a33258221/raw/49ba283695476e1a19ecbbf44aacad27c0670c31/gistfile1.txt'))()
        Rayfield:Notify({Title="Coven Of Chaos", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Total Roblox Drama🌸",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SylaHub/Syla-Hub/refs/heads/main/Loader"))()
        Rayfield:Notify({Title="Total Roblox Drama", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸The Vampire Origins🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/00bbe61db327943199b4714097221add/raw/60b04f713feae065fe6af06fce899ee22d8e0383/op%2520script'))()
        Rayfield:Notify({Title="The Vampire Origins", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸AHS: Collided Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/c53eb6bf9c39b4298596ff5f1ea78e98/raw/b4d57588f2972fc24dcf854e0f643802e081e126/gistfile1.txt'))()
        Rayfield:Notify({Title="AHS: Collided", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Bitten Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/9b6f3e092a754cf626ec98ea45a48ef1/raw/6c840af90a7c764f62354f481527dab852fd92cd/gistfile1.txt'))()
        Rayfield:Notify({Title="Bitten", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Multiversal: Awakening Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/a9a7027dcda4d8bc85b2628dae00efcd/raw/248c133adbdfa0eba409c2450c8f4810ea99b741/gistfile1.txt'))()
        Rayfield:Notify({Title="Multiversal: Awakening", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

MainTab:CreateButton({
    Name = "🌸Multiverse Reborn Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/169b9d7a14bbb00596f1acb1e4499fd4/raw/f1cd8abd825d7e9209e803a69425cdf8d43ca439/gistfile1.txt'))()
        Rayfield:Notify({Title="Multiverse Reborn", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})


local OthersTab = Window:CreateTab("🌸 Others 🌸", "flower")

local OthersSection = OthersTab:CreateSection("Simple Scripts 🌺")

OthersTab:CreateButton({
    Name = "🌸Infinite Yield Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        Rayfield:Notify({Title="Infinite Yield", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})

OthersTab:CreateButton({
    Name = "🌸ESP Script🌸",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/lookingforscriptsmoon/5d1783ef64610523b0c77054439a8ced/raw/96ab3d0be8b11b7e5ef1eeb6871c598fd8c00ed7/gistfile1.txt'))()    
        Rayfield:Notify({Title="ESP", Content="Has Been Activated 🌸", Duration=3, Image="flower"})
    end
})





-- 🌸 Load Configuration
Rayfield:LoadConfiguration()
