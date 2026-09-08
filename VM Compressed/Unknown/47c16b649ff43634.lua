--[[ ROHAN V2 - Improved Bypasser ]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local TextChatService = game:GetService("TextChatService")
local ChatService = game:GetService("Chat")
Method = "None"
Bypass = ""
UnBypassedString = ""

local Window = Rayfield:CreateWindow({
   Name = "Bypasser | Rohan official",
   Icon = 0, LoadingTitle = "System Loading", LoadingSubtitle = "by Rohan official",
   ShowText = "Rohan official", Theme = "Default", ToggleUIKeybind = "Z",
   ConfigurationSaving = {Enabled = true, FolderName = nil, FileName = "RohanConfig"},
   Discord = {Enabled = true, Invite = "Vp3XVQrBtF", RememberJoins = true},
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", nil)
MainTab:CreateSection("Information")
local ServiceLabel = MainTab:CreateLabel("Detecting Service...", nil, nil, false)
local CharCountLabel = MainTab:CreateLabel("Character Count: 0", nil, nil, false)

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    ServiceLabel:Set("Chat: TextChatService", nil, nil, false)
elseif TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
    ServiceLabel:Set("Chat: LegacyChatService", nil, nil, false)
end

MainTab:CreateSection("Methods")
local MethodLabel = MainTab:CreateLabel("Selected: None", nil, nil, false)

local MethodDropdown = MainTab:CreateDropdown({
   Name = "Select Bypass Method",
   Options = {"CommaV1", "CommaV2", "LineV1", "LineV2", "Dot", "Quote", "DoubleQuote", "Star"},
   CurrentOption = {"None"},
   MultipleOptions = false,
   Callback = function(Option)
      Method = Option[1]
      MethodLabel:Set("Selected: " .. Method .. " Method", nil, nil, false)
      if UnBypassedString ~= "" then BypassFunction(UnBypassedString) end
   end,
})

MainTab:CreateSection("Bypass")
local UnBypassInput = MainTab:CreateLabel("Input: None", nil, nil, false)
local BypassOutput = MainTab:CreateLabel("Output: None", nil, nil, false)

local BypassInput = MainTab:CreateInput({
    Name = "Input Field",
    CurrentValue = "",
    PlaceholderText = "Enter Here",
    RemoveTextAfterFocusLost = false,
    Flag = "Bypassing",
    Callback = function(UnBypassed)  
        UnBypassInput:Set("Input: " .. tostring(UnBypassed), nil, nil, false)
        CharCountLabel:Set("Character Count: " .. #tostring(UnBypassed))
        UnBypassedString = UnBypassed
        BypassFunction(UnBypassed)
    end,
})

local SayButton = MainTab:CreateButton({
   Name = "Send Message",
   Callback = function()
        local Chatting, Chat = pcall(function() return TextChatService.ChatInputBarConfiguration.TargetTextChannel end)
        if Chatting and Chat then Chat:SendAsync(Bypass) end
   end,
})

local CopyButton = MainTab:CreateButton({
   Name = "Copy Result",
   Callback = function()
        setclipboard(tostring(Bypass))
        Rayfield:Notify({Title = "Copied", Content = "Bypassed text copied to clipboard!", Duration = 2})
   end,
})

local ClearButton = MainTab:CreateButton({
    Name = "Clear Input",
    Callback = function()
        UnBypassedString = ""
        UnBypassInput:Set("Input: None")
        BypassOutput:Set("Output: None")
        CharCountLabel:Set("Character Count: 0")
    end,
})

local OthersTab = Window:CreateTab("Links", nil)
OthersTab:CreateButton({Name = "YouTube Channel", Callback = function() setclipboard("https://www.instagram.com/0for1?igsh=MWU2aTFpc3Z1Y3lveg==") end})
OthersTab:CreateButton({Name = "Discord Server", Callback = function() setclipboard("https://www.instagram.com/0for1?igsh=MWU2aTFpc3Z1Y3lveg==") end})
OthersTab:CreateButton({Name = "Unload Script", Callback = function() Rayfield:Destroy() end})

function BypassFunction(UnBypassed)
    if UnBypassed == "" then return end
    if Method == "None" then
        Rayfield:Notify({Title = "No Method Selected", Content = "Please Choose a Bypass Method To Continue", Duration = 5})
    elseif Method == "CommaV1" then
        local Tricker = "؍"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "CommaV2" then
        local Tricker = "ﹺ"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "LineV1" then
        local Tricker = "ـ"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "LineV2" then
        local Tricker = "־"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "Dot" then
        local Tricker = "؞"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "Quote" then
        local Tricker = "׳"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "DoubleQuote" then
        local Tricker = "״"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    elseif Method == "Star" then
        local Tricker = "٭"
        Bypass = ""
        local Reversed, Characters, ReversedDisplay, CharactersDisplay, IsLTR = {}, {}, {}, {}, true
        for Count, CodePoint in utf8.codes(UnBypassed) do table.insert(Characters, utf8.char(CodePoint)) end
        for _, CodePoint in utf8.codes(UnBypassed) do
            if (CodePoint >= 0x0590 and CodePoint <= 0x08FF) or (CodePoint >= 0xFB50 and CodePoint <= 0xFEFF) then IsLTR = false break end
        end
        if IsLTR then for Count = #Characters, 1, -1 do table.insert(Reversed, Characters[Count]) end else Reversed = Characters end
        for Count, Letter in ipairs(Reversed) do Bypass = Bypass .. Tricker .. Letter end
        for Count, CodePoint in utf8.codes(Bypass) do table.insert(CharactersDisplay, utf8.char(CodePoint)) end
        if IsLTR then for Count = #CharactersDisplay, 1, -1 do table.insert(ReversedDisplay, CharactersDisplay[Count]) end else ReversedDisplay = CharactersDisplay end
        BypassOutput:Set("Output: " .. table.concat(ReversedDisplay), nil, nil, false)
    end
end
