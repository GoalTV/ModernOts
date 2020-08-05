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
	
	if msgcontains(msg, 'inquisitor') then
		if getPlayerStorageValue(cid, storage_join) == -1 then
			npcHandler:say("The churches of the gods entrusted me with the enormous and responsible task to lead the inquisition. I leave the field work to inquisitors who I recruit from fitting people that cross my way.", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("You are already a member of the Inquisition.", cid)
			talkState[talkUser] = 0
		end
	end
	if msgcontains(msg, 'join') and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid, storage_join) == -1 then
			npcHandler:say("Do you want to join the Inquisition?", cid)
			talkState[talkUser] = 2
		end
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then
		if getPlayerStorageValue(cid, storage_join) == -1 then
			npcHandler:say("So be it. Now you are a member of the inquisition. You might ask me for a {mission} to raise in my esteem.", cid)
			setPlayerStorageValue(cid, storage_join, 1)
			talkState[talkUser] = 3
		else
			npcHandler:say("You are already a member of the Inquisition.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'mission') and talkState[talkUser] == 3 then
		if getPlayerStorageValue(cid, storage_join) == 1 then
			doNPCTalkALot({"Let's see if you are worthy. Take an inquisitor's field guide from the box in the back room. ...", "Follow the instructions in the guide to talk to the Thaian guards that protect the walls and gates of the city and test their loyalty. Then report to me about your mission."}, 10000, cid)
			setPlayerStorageValue(cid, storage_mission, 1)
			talkState[talkUser] = 4
		else
			npcHandler:say("You have not joined the {Inquisition}.", cid)
			talkState[talkUser] = 0
		end
	end
	
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage_mission) == 5 then
		npcHandler:say("Your current mission is to investigate the reliability of certain guards. Are you done with that mission?", cid)
		talkState[talkUser] = 4
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 4 then
		doNPCTalkALot({"Indeed, this is exactly what my other sources told me. Of course I knew the outcome of this investigation in advance. This was just a test. ...", "Well, now that you've proven yourself as useful, you can ask me for another mission. Let's see if you can handle some field duty, too."}, 10000, cid)
		talkState[talkUser] = 5
	elseif msgcontains(msg, 'task') and talkState[talkUser] == 5 then
		doNPCTalkALot({"Listen, we have information about a heretic coven that hides in a mountain called the Big Old One. The witches reach this cursed place on flying brooms and think theyare safe there. ...", "I've arranged a flying carpet that will bring you to their hideout. Travel to Femor Hills and tell the carpet pilot the code word 'eclipse'. ... ", "He'll bring you to your destination. At their meeting place, you'll find a cauldron in which they cook some forbidden brew. ...", "Use this vial of holy water to destroy the brew. Also steal their grimoire and bring it to me."}, 10000, cid)
		setPlayerStorageValue(cid, storage_mission, 6)
		doPlayerAddItem(cid, 2006, 0)
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())