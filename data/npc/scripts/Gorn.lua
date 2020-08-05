local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local thinkMsg = {
	"If you need basic equipment, perhaps a rope or shovel, ask me. I sell all of that.",
	"Hey, tell Sam to get off my turf!",
	"Welcome to my shop!"
}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function thinkCallback(cid)
	local rand = math.random(100)
	if thinkMsg[rand] then
		npcHandler:say(thinkMsg[rand])
	end
	return true
end

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())