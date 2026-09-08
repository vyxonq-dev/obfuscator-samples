--[[
 ─────────▄──────────────▄────
────────▌▒█───────────▄▀▒▌───
────────▌▒▒▀▄───────▄▀▒▒▒▐───
───────▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐───
─────▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐───
───▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌───
──▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌──
──▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐──
─▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌─
─▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌─
─▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐─
▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌
▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐─
─▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌─
─▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐──
──▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌──
────▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀───
───▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀─────
──▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▀────────

created by shib#1337
while you're here, heres a picture of my shiba inu:
https://media.discordapp.net/attachments/931817753910865960/948993361648447498/unknown.png
bobby was here :D

ok bye
]]
shared.CustomCorrections = shared.CustomCorrections or {}
--// EARKLY VARIALBES GJYUIS OMG \\--

local Corrections = {
    ["i"] = "I",
    ["im"] = "I'm",
    ["ive"] = "I've",
    ["dont"] = "don't",
    ["doesnt"] = "doesn't",
    ["cant"] = "can't",
    ["youre"] = "you're",
    ["ur"] = "your",
    ["u"] = "you",
    ["its"] = "it's",
    ["oh"] = "oh,",
    ["thnks"] = "thanks",
    ["thx"] = "thanks",
    ["git"] = "get",
    ["gud"] = "good",
    ["gramer"] = "grammar",
    ["grammer"] = "grammar",
    ["anymor"] = "anymore",
    ["amerika"] = "america",
    ["gremmer"] = "grammar",
    
}

for i, v in pairs(shared.CustomCorrections) do
    if table.find(Corrections,v) then
        table.remove(Corrections[i])
    end
    table.insert(Corrections,v)
    Corrections[i] = v
end
table.clear(shared.CustomCorrections)

local Questions = {
    "mean",
    "ask",
    "you",
    "care",
    "script",
    "is",
    "what",
    "it",
    "question",
    "here"
}

-- "ufjhjsdg add functions or im gonna cry :((( p;ls!! ur script so ugly!!" HERE YOU GO
-- what is the point of this man
local function GrabFirstLetter(Text)
    return string.sub(Text,1,1)
end
local function GrabLowercased(Text)
   return string.sub(Text,2)
end
local function AddStrings(String1,String2)
    return tostring(String1..String2)
end
local function GrabLastCharacter(Text)
    return string.sub(Text,string.len(Text),string.len(Text))
end
local function ConvertWords(Table)
    for i, v in pairs(Table) do
            v = v:lower()
            if Corrections[v] then
                pcall(function()
                if Table[i] == Table[1] then
                    -- Making the first letter uppercase just in case if it needs to be corrected.
                    local Corrected = Corrections[v]
                    local FirstLetter = GrabFirstLetter(Corrected)
                    local Lowercased = GrabLowercased(Corrected)

                    Table[i] = FirstLetter:upper()..Lowercased
                else
                    -- Just replace it.
                    Table[i] = Corrections[v]
                end
            end)
        end
    end
end

-- Checking just incase yk
if not hookmetamethod then
    return game.Players.LocalPlayer:Kick("Your executor sadly does not currently support this script. :(")
end


OldNamecall = hookmetamethod(game,"__namecall",function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    if Method == "FireServer" and tostring(Arguments[1]) == "SayMessageRequest" then
        local Text = Arguments[2]


        -- First letter converting
        local FirstLetter = GrabFirstLetter(Text)
        local Lowercased = GrabLowercased(Text)
        local CapitalText = AddStrings(FirstLetter:upper(),Lowercased)
        
        -- Word correction
        local Table = string.split(CapitalText," ")
        local Corrected = ConvertWords(Table)  
        local Final = ""

        -- Adding all the words back
        for i, v in pairs(Table) do
            if Table[i] == Table[1] then
                Final = Final..v
            else
                Final = Final.." "..v
            end
        end

        -- Adding dots n shit
        local LastCharacter = GrabLastCharacter(Final)
        if LastCharacter == "!" or LastCharacter == "." or LastCharacter == "?" then
            Arguments[2] = Final
        
        else
            if table.find(Questions,Table[#Table]:lower()) then
                Arguments[2] = Final.."?"
            else
                Arguments[2] = Final.."."
            end
        end
        return OldNamecall(unpack(Arguments))
    end
    return OldNamecall(...)
end)


-- lil join prompt thing
loadstring(game:HttpGet("https://raw.githubusercontent.com/eosuwu/boblox/main/invite.lua"))()
