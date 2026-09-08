--loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()

local Players = ServicesAPI.Players
local ReplicatedStorage = ServicesAPI.ReplicatedStorage
local LocalPlayer = DynamicAPI.LocalPlayer

local CommF = ReplicatedStorage.Remotes.CommF_

local function findNpcDirectory()
    local targetScriptName = "NPC"
    for _, func in ipairs(getgc()) do
        if islclosure(func) then
            local success, info = pcall(debug.getinfo, func, "s")
            if success and info and info.source and info.source:match(targetScriptName) then
                local upvalues = getupvalues(func)
                local potentialDirectory = upvalues[2]
                if type(potentialDirectory) == "table" and #potentialDirectory > 100 then
                    return potentialDirectory
                end
            end
        end
    end
    return nil
end

-- --- Main Execution ---
local NPCDirectory = nil
repeat
	NPCDirectory = findNpcDirectory()
	task.wait()
until NPCDirectory
print("Found NPCDirectory")

local function GetNPC(TargetName)
	for i, NPCRef in pairs(NPCDirectory) do
		local NPCObject = NPCRef.Object
		if NPCObject.Name == TargetName then
			return NPCRef
		end
	end
end

local function GetQuestInfo(NPCRef)
	local Object = NPCRef.Object
	local Dialogue = Object.GetDialogue(Object, LocalPlayer)

	return {
		["InternalQuestName"] = Dialogue.InternalQuestName,
		["QuestInfo"] = Dialogue.Get(Dialogue)
	}
end

local function StartQuest(NPCName, QuestNumber)
    local NPCRef = GetNPC(NPCName)
	local QuestInfo = GetQuestInfo(NPCRef)
	local QuestChoice = QuestNumber
	print("StartQuest Call: Name:", QuestInfo.InternalQuestName,
		  "Choice", QuestChoice
		 )
	CommF:InvokeServer("StartQuest",
		QuestInfo.InternalQuestName,
		QuestChoice
	)
end
local API = {}
API.StartQuest = StartQuest
return API
