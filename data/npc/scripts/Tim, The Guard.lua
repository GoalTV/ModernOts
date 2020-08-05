local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
			return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	-- CONFIG --
	local storage_join = 2101
	local storage_mission = 2102
	-- END CONFIG --
	
	if msgcontains(msg, 'trouble') then
		if getPlayerStorageValue(cid, storage_join) == 1 then
			if getPlayerStorageValue(cid, storage_mission) == 4 then
				npcHandler:say("Ah, well. Just this morning my new toothbrush fell into the toilet.", cid)
				talkState[talkUser] = 1
			else
				npcHandler:say("You must speak to {Miles, the Guard} first.", cid)
				talkState[talkUser] = 0
			end
		else
			npcHandler:say("I don't feel like chatting.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'authorities') and talkState[talkUser] == 1 then
		npcHandler:say("What do you mean? Of course they will immediately send someone with extra long and thin arms to retrieve it!", cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, 'avoided') and talkState[talkUser] == 2 then
		npcHandler:say("Your humour might let end you up beaten in some dark alley, you know? No, I don't think someone could have prevented that accident!", cid)
		talkState[talkUser] = 3
	elseif msgcontains(msg, 'gods would allow') and talkState[talkUser] == 3 then
		doNPCTalkALot({"It's not a drama!! I think there is just no god who's responsible for toothbrush safety, that's all ...", "And even IF through some miracle the stupid toothbrush had jumped out of the toilet into my hand, I honestly doubt I would ever use it again."}, 10000, cid)
		setPlayerStorageValue(cid, storage_mission, 5)
		talkState[talkUser] = 0
	end
	
	return true
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())