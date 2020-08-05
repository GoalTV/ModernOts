local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local thinkMsg = {
	"If you need help with letters or parcels, just ask me. I can explain everything.",
	"Hey, send a letter to your friend now and then. Keep in touch, you know.",
	"No, no, no, there IS no parcel bug, I'm telling you!",
	"Welcome to the post office!"
}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function thinkCallback(cid)
	local rand = math.random(250)
	if thinkMsg[rand] then
		npcHandler:say(thinkMsg[rand])
	end
	return true
end

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())