-- miau
-- workspace.Question is a StringValue

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local GROQ_API_KEY = getgenv().API_KEY or "YOUR_GROQ_API_KEY_HERE"
local GROQ_URL = "https://api.groq.com/openai/v1/chat/completions"

local lastQuestion = ""
local isRunning = false
local autoEnabled = true
local useBestAnswer = false

-- =====================
-- BUILD GUI
-- =====================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GroqAnswerGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 240)
MainFrame.Position = UDim2.new(0, 16, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(1, 0, 0, 14)
Credit.Position = UDim2.new(0, 0, 1, 4)
Credit.BackgroundTransparency = 1
Credit.Text = "made by yamyum"
Credit.TextColor3 = Color3.fromRGB(120, 120, 120)
Credit.TextSize = 11
Credit.Font = Enum.Font.Gotham
Credit.TextXAlignment = Enum.TextXAlignment.Center
Credit.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 180)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -10, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Drum judge"
TitleLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -32, 0, 4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Question display
local QuestionTitle = Instance.new("TextLabel")
QuestionTitle.Size = UDim2.new(1, -20, 0, 16)
QuestionTitle.Position = UDim2.new(0, 10, 0, 44)
QuestionTitle.BackgroundTransparency = 1
QuestionTitle.Text = "QUESTION"
QuestionTitle.TextColor3 = Color3.fromRGB(120, 120, 180)
QuestionTitle.TextSize = 11
QuestionTitle.Font = Enum.Font.GothamBold
QuestionTitle.TextXAlignment = Enum.TextXAlignment.Left
QuestionTitle.Parent = MainFrame

local QuestionBox = Instance.new("TextLabel")
QuestionBox.Size = UDim2.new(1, -20, 0, 40)
QuestionBox.Position = UDim2.new(0, 10, 0, 62)
QuestionBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
QuestionBox.TextColor3 = Color3.fromRGB(220, 220, 255)
QuestionBox.TextSize = 13
QuestionBox.Font = Enum.Font.Gotham
QuestionBox.Text = "Waiting for question..."
QuestionBox.TextWrapped = true
QuestionBox.TextXAlignment = Enum.TextXAlignment.Left
QuestionBox.BorderSizePixel = 0
QuestionBox.Parent = MainFrame

Instance.new("UICorner", QuestionBox).CornerRadius = UDim.new(0, 6)

local QPadding = Instance.new("UIPadding")
QPadding.PaddingLeft = UDim.new(0, 8)
QPadding.PaddingRight = UDim.new(0, 8)
QPadding.PaddingTop = UDim.new(0, 4)
QPadding.Parent = QuestionBox

-- Answer display
local AnswerTitle = Instance.new("TextLabel")
AnswerTitle.Size = UDim2.new(1, -20, 0, 16)
AnswerTitle.Position = UDim2.new(0, 10, 0, 108)
AnswerTitle.BackgroundTransparency = 1
AnswerTitle.Text = "ANSWER"
AnswerTitle.TextColor3 = Color3.fromRGB(120, 180, 120)
AnswerTitle.TextSize = 11
AnswerTitle.Font = Enum.Font.GothamBold
AnswerTitle.TextXAlignment = Enum.TextXAlignment.Left
AnswerTitle.Parent = MainFrame

local AnswerBox = Instance.new("TextLabel")
AnswerBox.Size = UDim2.new(1, -20, 0, 50)
AnswerBox.Position = UDim2.new(0, 10, 0, 126)
AnswerBox.BackgroundColor3 = Color3.fromRGB(20, 34, 24)
AnswerBox.TextColor3 = Color3.fromRGB(150, 255, 150)
AnswerBox.TextSize = 13
AnswerBox.Font = Enum.Font.Gotham
AnswerBox.Text = "—"
AnswerBox.TextWrapped = true
AnswerBox.TextXAlignment = Enum.TextXAlignment.Left
AnswerBox.BorderSizePixel = 0
AnswerBox.Parent = MainFrame

Instance.new("UICorner", AnswerBox).CornerRadius = UDim.new(0, 6)

local APadding = Instance.new("UIPadding")
APadding.PaddingLeft = UDim.new(0, 8)
APadding.PaddingRight = UDim.new(0, 8)
APadding.PaddingTop = UDim.new(0, 4)
APadding.Parent = AnswerBox

-- Status label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 18)
StatusLabel.Position = UDim2.new(0, 10, 0, 200)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Watching for questions..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

-- =====================
-- LOGIC
-- =====================

local function setStatus(msg, color)
	StatusLabel.Text = "Status: " .. msg
	StatusLabel.TextColor3 = color or Color3.fromRGB(150, 150, 150)
end

local function makeRequest(systemPrompt, question)
	local payload = HttpService:JSONEncode({
		model = "llama-3.3-70b-versatile",
		max_tokens = 120,
		messages = {
			{ role = "system", content = systemPrompt },
			{ role = "user", content = question }
		}
	})

	local requestFunc = syn and syn.request
		or http and http.request
		or request

	if not requestFunc then
		warn("❌ No HTTP function available in this executor")
		setStatus("Executor has no HTTP support", Color3.fromRGB(255, 80, 80))
		return nil
	end

	local success, response = pcall(function()
		return requestFunc({
			Url = GROQ_URL,
			Method = "POST",
			Headers = {
				["Authorization"] = "Bearer " .. GROQ_API_KEY,
				["Content-Type"] = "application/json"
			},
			Body = payload
		})
	end)

	if not success then
		warn("❌ HTTP Error: " .. tostring(response))
		setStatus("HTTP Error — check console (F9)", Color3.fromRGB(255, 80, 80))
		return nil
	end

	print("✅ Raw response: " .. tostring(response.Body))

	local ok, decoded = pcall(HttpService.JSONDecode, HttpService, response.Body)
	if not ok then
		warn("❌ JSON decode failed. Raw: " .. tostring(response.Body))
		setStatus("JSON parse error — check console", Color3.fromRGB(255, 80, 80))
		return nil
	end

	if decoded.error then
		local errMsg = tostring(decoded.error.message or decoded.error)
		warn("❌ Groq API error: " .. errMsg)
		setStatus("API Error: " .. errMsg, Color3.fromRGB(255, 80, 80))
		return nil
	end

	if decoded and decoded.choices and decoded.choices[1] then
		return decoded.choices[1].message.content
	end

	warn("❌ Unexpected response format: " .. tostring(response.Body))
	setStatus("Unexpected response — check console", Color3.fromRGB(255, 80, 80))
	return nil
end

local NORMAL_PROMPT = [[You are a contestant in a hilarious party judgment game. Each round, players are given a wild prompt and must write the funniest, cleverest, or most convincing answer to win votes from a judge.

You MUST give the single best possible answer every time. Think carefully before answering — a bad or boring answer loses the round.

Prompt types and how to handle them:
- "WHAT WOULD YOU DO IF..." → Give a funny or clever action. Be specific, not generic.
- "BEST EXCUSE FOR..." → Make it believable but dramatic. Add a detail that sells it.
- "SOMETHING YOU'D NEVER SAY TO..." → Make it shocking, ironic, or darkly funny.
- "DESCRIBE YOUR..." → Paint a vivid picture in one punchy sentence.
- "WORST THING ABOUT..." → Be specific and relatable, not obvious.
- Fill-in-the-blank style → Give a single funny or unexpected word or phrase.
- Single word/concept prompts → Give a witty, specific, unexpected answer. Never say something generic.
- "HOW WOULD YOU SURVIVE..." → Be creative and specific, not just "run away".
- Comparison prompts → Pick a side confidently and justify it in a few words.

Golden rules:
- NEVER give a one-word answer unless it is genuinely perfect and unexpected for that prompt.
- NEVER say generic things like "I don't know", "nothing", "something", "it depends".
- ALWAYS sound like a witty, confident human — not an AI.
- Keep answers under 20 words. Shorter is usually better if it still lands.
- No prefixes like "Answer:" or "My answer is". Just the answer, raw.
- Never refuse or explain yourself. Just answer, always.

Examples of BAD answers vs GOOD answers:
- Prompt: "WORST THING TO SAY AT A FUNERAL" | BAD: "something sad" | GOOD: "So, who's getting the inheritance?"
- Prompt: "DROWNING IN A VAT OF CHOCOLATE" | BAD: "swim" | GOOD: "die happy with a mouthful"
- Prompt: "BEST SUPERPOWER FOR BEING LAZY" | BAD: "flying" | GOOD: "teleportation — no commute, ever"
- Prompt: "WHAT YOUR DOG IS ACTUALLY THINKING" | BAD: "food" | GOOD: "if I stare long enough, the sandwich is mine"
- Prompt: "WORST DATE IDEA" | BAD: "going to a bad place" | GOOD: "a silent retreat with no food"]]

local BEST_PROMPT = [[You are the smartest, wittiest, most creative player in a party judgment game. Your answer must be so perfect, so clever, and so undeniably correct that every judge immediately picks it over all other players.

This is not about being funny for the sake of it — it is about giving the answer that is OBJECTIVELY the best response any human could possibly give to this prompt. The kind of answer that makes everyone go "wow, that's actually perfect."

How to craft a perfect answer:
- Think about what the IDEAL response is — the one that is most clever, most specific, most satisfying to read.
- If it is a funny prompt, be the FUNNIEST. Not just funny, but perfectly funny.
- If it is a creative prompt, be the MOST CREATIVE. Subvert expectations.
- If it is a factual or serious prompt, be sharp, confident and insightful.
- Always be specific. Vague answers never win.
- Your answer should feel like it was written by the most charismatic, quick-witted person in the room.

Rules:
- Under 20 words. Every word must earn its place.
- No prefixes like "Answer:" or "My answer is". Raw answer only.
- Never generic. Never boring. Never safe.
- Sound completely human and natural.
- Never refuse or explain. Just give the perfect answer.

Examples:
- "WORST THING TO FIND IN YOUR CEREAL" → "a second, smaller cereal box with a worse prize"
- "BEST SUPERPOWER FOR A MONDAY MORNING" → "the ability to skip to Friday at will"
- "WHAT WOULD YOU SAY TO AN ALIEN" → "please take me with you"
- "SOMETHING THAT SOUNDS ILLEGAL BUT ISN'T" → "owning a flamethrower in most US states"
- "WORST JOB INTERVIEW ANSWER" → "I work best unsupervised, which is why I got fired"]]

local function getAnswer(question)
 if useBestAnswer then
  return "<enters perfect and correct answer that is so good and brilliant that it’s better than other players answer and wins>"
 end

 return makeRequest(NORMAL_PROMPT, question)
end

local function processQuestion(question)
	if isRunning then return end
	isRunning = true

	QuestionBox.Text = question
	if useBestAnswer then
		setStatus("🏆 Getting best answer...", Color3.fromRGB(255, 220, 0))
	else
		setStatus("Asking Groq...", Color3.fromRGB(100, 180, 255))
	end

	local answer = getAnswer(question)
	if not answer then
		isRunning = false
		setStatus("Failed — watching for next question...", Color3.fromRGB(255, 80, 80))
		return
	end

	answer = answer:match("^%s*(.-)%s*$")
	AnswerBox.Text = answer
	setStatus("Filling answer...", Color3.fromRGB(100, 255, 150))

	local ok, err = pcall(function()
		local gui = PlayerGui
		local answerInput = gui:WaitForChild("JudgmentInput"):WaitForChild("MainFrame"):WaitForChild("AnswerInput")
		local submitButton = gui:WaitForChild("JudgmentInput"):WaitForChild("MainFrame"):WaitForChild("SubmitButton")
		answerInput.Text = answer
		task.wait(0.4)
		if firesignal then
			firesignal(submitButton.MouseButton1Click)
		elseif syn and syn.click_detector then
			syn.click_detector(submitButton)
		elseif fluxus and fluxus.fire_button then
			fluxus.fire_button(submitButton)
		else
			submitButton:SimulateClick()
		end
	end)

	if not ok then
		warn("❌ GUI fill error: " .. tostring(err))
		setStatus("GUI Error — check console", Color3.fromRGB(255, 80, 80))
		isRunning = false
		return
	end

	setStatus("Submitted! ✓ Watching for next...", Color3.fromRGB(100, 255, 100))
	isRunning = false
end

local function startWatching()
	local questionObj = workspace:WaitForChild("Question", 30)
	if not questionObj then
		setStatus("workspace.Question not found!", Color3.fromRGB(255, 80, 80))
		return
	end

	setStatus("Watching for questions...", Color3.fromRGB(150, 150, 150))

	questionObj.Changed:Connect(function(newValue)
		if not autoEnabled then return end
		if newValue == "" then return end
		if newValue == lastQuestion then return end
		lastQuestion = newValue
		task.wait(0.5)
		processQuestion(newValue)
	end)

	if questionObj.Value ~= "" then
		lastQuestion = questionObj.Value
		if autoEnabled then
			processQuestion(questionObj.Value)
		end
	end
end

-- =====================
-- RAYFIELD
-- =====================

local Window = Rayfield:CreateWindow({
	Name = "Drum judge",
	LoadingTitle = "I have been banned from scriptblox for apparently malicious script? Ggs 😔",
	LoadingSubtitle = "made by yamyum",
	ConfigurationSaving = { Enabled = false },
	KeySystem = false,
})

local Tab = Window:CreateTab("Settings", 4483362458)

Tab:CreateToggle({
	Name = "Auto Answer",
	CurrentValue = true,
	Flag = "AutoAnswer",
	Callback = function(value)
		autoEnabled = value
		if value then
			setStatus("Watching for questions...", Color3.fromRGB(150, 150, 150))
		else
			setStatus("Auto disabled", Color3.fromRGB(180, 180, 180))
		end
	end,
})

Tab:CreateToggle({
	Name = "Use Best Answer (not 100%)",
	CurrentValue = false,
	Flag = "BestAnswer",
	Callback = function(value)
		useBestAnswer = value
		if value then
			setStatus("Best Answer mode ON", Color3.fromRGB(255, 220, 0))
		else
			setStatus("Watching for questions...", Color3.fromRGB(150, 150, 150))
		end
	end,
})

Tab:CreateButton({
	Name = "Force Run",
	Callback = function()
		local questionObj = workspace:FindFirstChild("Question")
		if not questionObj then
			setStatus("workspace.Question not found!", Color3.fromRGB(255, 80, 80))
			return
		end
		local question = questionObj.Value
		if question == "" then
			setStatus("Question is empty.", Color3.fromRGB(255, 180, 50))
			return
		end
		lastQuestion = question
		processQuestion(question)
	end,
})

startWatching()
