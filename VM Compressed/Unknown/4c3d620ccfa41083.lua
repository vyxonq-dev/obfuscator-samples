local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/refs/heads/main/Orion/source.lua')))()

local Window = OrionLib:MakeWindow({Name = "Bible script", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionBible"})

local HttpService = game:GetService("HttpService")

local bookToVerses = nil
local bookNames = {}
local verses = {}
local versenum = 1
local currentBookName = nil

local function clamp(n, minV, maxV)
	if n < minV then return minV end
	if n > maxV then return maxV end
	return n
end

local function chat(msg)
	msg = tostring(msg or ""):gsub("[{}]", "")
	local limit = #("11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111")
	local chunks = {}
	local i = 1
	while i <= #msg do
		table.insert(chunks, string.sub(msg, i, i + limit - 1))
		i = i + limit
	end
	for idx, part in ipairs(chunks) do
		if game.ReplicatedStorage:FindFirstChild('DefaultChatSystemChatEvents') then
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(part, "All")
		else
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(part)
		end
		if idx < #chunks then
			wait(1.5)
		end
	end
end

local function loadBibleKJV()
	local url = "https://raw.githubusercontent.com/thiagobodruk/bible/master/json/en_kjv.json"
	local ok, body = pcall(function()
		return game:HttpGet(url)
	end)
	if not ok or not body then return nil, nil end
	local success, data = pcall(function()
		return HttpService:JSONDecode(body)
	end)
	if not success or type(data) ~= "table" then return nil, nil end
	local map = {}
	local names = {}
	for _, b in ipairs(data) do
		local bookName = b.name or b.book
		local chapters = b.chapters or b.Chapters or b.chapter
		if type(bookName) == "string" and type(chapters) == "table" then
			local list = {}
			for chapterIndex, versesArray in ipairs(chapters) do
				if type(versesArray) == "table" then
					for verseIndex, verseText in ipairs(versesArray) do
						table.insert(list, string.format("%s %d:%d – %s", bookName, chapterIndex, verseIndex, tostring(verseText)))
					end
				end
			end
			map[bookName] = list
			table.insert(names, bookName)
		end
	end
	return map, names
end

local function setCurrentBook(bookName)
	if not bookToVerses then return end
	local list = bookToVerses[bookName]
	if not list or #list == 0 then return end
	currentBookName = bookName
	verses = list
	versenum = 1
end

bookToVerses, bookNames = loadBibleKJV()
if not bookToVerses or #bookNames == 0 then
	bookToVerses = {Genesis = {"Genesis 1:1 – In the beginning God created the heavens and the earth."}}
	bookNames = {"Genesis"}
end

if not currentBookName then
	setCurrentBook("Genesis")
end

local BibleTab = Window:MakeTab({
	Name = "Bible",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local controlsSection = BibleTab:AddSection({
	Name = "Controls"
})

local verseParagraph = BibleTab:AddParagraph("Verse", verses[versenum] or "Loaded KJV. Select a book and press Random.")

local function refreshVerse()
	if verseParagraph and verses and #verses > 0 then
		verseParagraph:Set(verses[versenum] or "")
	end
end

local bookDropdown = BibleTab:AddDropdown({
	Name = "Book",
	Default = currentBookName or bookNames[1],
	Options = bookNames,
	Callback = function(Value)
		setCurrentBook(Value)
		refreshVerse()
	end
})

BibleTab:AddButton({
	Name = "Random Verse",
	Callback = function()
		if verses and #verses > 0 then
			versenum = math.random(1, #verses)
			refreshVerse()
		end
	end
})

BibleTab:AddButton({
	Name = "Prev",
	Callback = function()
		if verses and #verses > 0 then
			versenum = clamp(versenum - 1, 1, #verses)
			refreshVerse()
		end
	end
})

BibleTab:AddButton({
	Name = "Next",
	Callback = function()
		if verses and #verses > 0 then
			versenum = clamp(versenum + 1, 1, #verses)
			refreshVerse()
		end
	end
})

BibleTab:AddButton({
	Name = "Copy Verse",
	Callback = function()
		pcall(function()
			setclipboard(verses[versenum] or "")
		end)
	end
})

BibleTab:AddButton({
	Name = "Say Verse",
	Callback = function()
		if verses and #verses > 0 then
			chat(verses[versenum])
		end
	end
})

local unloadSection = BibleTab:AddSection({
	Name = "Unload"
})

BibleTab:AddButton({
	Name = "Unload (X)",
	Callback = function()
		pcall(function()
			OrionLib:Destroy()
		end)
		bookToVerses = nil
		bookNames = {}
		verses = {}
		versenum = 1
		currentBookName = nil
	end
})


local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local _creditsSection = CreditsTab:AddSection({
	Name = ""
})

CreditsTab:AddLabel("Made by Red")

OrionLib:Init()