local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storage = 16669
	
	if msgcontains(msg, "job") then
		npcHandler:say("How dare you asking me this?!? I'm Arkulius - Master of Elements, the HEADMASTER of this academy!!", cid)
		npcHandler:releaseFocus(cid)
		talkState[talkUser] = 0
 	elseif msgcontains(msg, "name") then
		npcHandler:say("I'm Arkulius - Master of Elements, the headmaster of this academy.", cid)
		npcHandler:releaseFocus(cid)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "help") then
		npcHandler:say("I have better things to do than helping you. See that ice statue over there? My dear friend Alverus needs to be revived!", cid)
		npcHandler:releaseFocus(cid)
		talkState[talkUser] = 0
 	elseif msgcontains(msg, "time") then
		npcHandler:say("Time is an illusion and completely irrelevant to me.", cid)
		npcHandler:releaseFocus(cid)
		talkState[talkUser] = 0
 	elseif msgcontains(msg, "weapon") then
		npcHandler:say("Weapons are for those people who aren't able to use their heads or better what's INSIDE their heads. No offence <coughs>.", cid) -- < Knight; FIXME !!!
		npcHandler:releaseFocus(cid)
		talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "alverus") then
		if getPlayerStorageValue(cid, 17000) == 1 then
			npcHandler:say("He is doing just fine. I am busy, come back some other time my friend.", cid)
			npcHandler:releaseFocus(cid)
			talkState[talkUser] = 0
		else
			doNPCTalkALot({"It happened while he carried out an experiment concerning the creation of the elemental {shrines}. I still get goose bumps just by thinking of it. ...", "You need to know about the process of creating an elemental shrine to understand it completely, but I don't want to go into detail now. ...", "Anyway, his spell had a different outcome than he had planned. He accidentally created an Ice Overlord, pure living elemental ice, who froze him in a blink of an eye."}, 10000, cid)
			talkState[talkUser] = 1
		end
	end
	if msgcontains(msg, "shrines") and talkState[talkUser] == 1 then
		doNPCTalkALot({"The creation of the elemental shrines is a really complex matter. They are actually nodes, locations where the matching elemental sphere is very close. ...", "The shrine itself is like a portal between our world and the elemental {sphere} and enables us to use the elemental energy emerging from it."}, 10000, cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, "sphere") and talkState[talkUser] == 2 then
		doNPCTalkALot({"There are four spheres we know of: ice, fire, earth and energy. ....<mumbles> Hmmm, should I ask or not?....The heck with it! Now that you know about the spheres ...", " I found a way to visit them. It's VERY dangerous and there is a decent chance that you won't come back BUT if you succeed you'll write history!!! Ask me about that {mission} if you're interested."}, 10000, cid)
		talkState[talkUser] = 3
	elseif msgcontains(msg, "mission") and talkState[talkUser] == 3 then
		if getPlayerLevel(cid) >= 80 then
			doNPCTalkALot({"Okay, listen closely: First of all, you need to gather 20 enchanted amethysts in order to go to the energy sphere. Deep under the academy, one floor below the elemental shrines, there is a machine. Put the gems in there and activate it. ...", "Once you got there, find a way to gather elemental energy in any form. You will face energy elementals, that's for sure, but I don't know how the energy is stored. ...", "Anyway, there should be a way to use that energy and strengthen one of the elementals. If my calculations are right, you will create an Energy Overlord who hopefully will consist of some sort of 'concentrated' energy. ...", "THAT'S what we need!! Are you in on it?"}, 10000, cid)
			talkState[talkUser] = 4
		else
			npcHandler:say("I'm sorry this task is highly dangerous and I need experienced people for it.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 4 then
		npcHandler:say("Good, don't waste time! Come back here when you have the elemental object!", cid)
		talkState[talkUser] = 5
	elseif msgcontains(msg, "mission") and talkState[talkUser] == 5 then
		if doPlayerRemoveItem(cid, isSorcerer(cid) and 8304 or isDruid(cid) and 8305 or isPaladin(cid) and 8300 or isKnight(cid) and 8306, 1) == TRUE then
			doNPCTalkALot({isSorcerer(cid) and "Impressive!! Let me take a look.......Ahh, an ETERNAL FLAME! Now you need to find a knight, a druid, and a paladin who also completed this first task. ..."	or isDruid(cid) and "Impressive!! Let me take a look.......Ahh, MOTHER SOIL! Now you need to find a knight, a paladin, and a sorcerer who also completed this first task. ..." or isPaladin(cid) and "Impressive!! Let me take a look.......Ahh, a FLAWLESS ICE CRYSTAL! Now you need to find a knight, a druid, and a sorcerer who also completed this first task. ..." or isKnight(cid) and "Impressive!! Let me take a look.......Ahh, PURE ENERGY! Now you need to find a druid, a paladin, and a sorcerer who also completed this first task. ...", "Go down in the cellar again. I prepared a room under the academy where it should be safe. Your task is to charge the machines with the elemental substances and summon the LORD OF THE ELEMENTS. ...", "When you use an obsidian knife on it's corpse you hopefully get some of the precious neutral matter. It's the only way to revive my dear friend Alverus!!", "Go down in the cellar again. I prepared a room under the academy where it should be safe. Your task is to charge the machines with the elemental substances and summon the LORD OF THE ELEMENTS. ...", "When you use an obsidian knife on it's corpse you hopefully get some of the precious neutral matter. It's the only way to revive my dear friend Alverus!!"}, 10000, cid)
			setPlayerStorageValue(cid, storage, 1)
			talkState[talkUser] = 6
		else
			npcHandler:say("You need some kind of pure elemental soil from the Fire Overlord. Come back when you've got it.", cid)
			talkState[talkUser] = 5
		end
	elseif msgcontains(msg, "mission") and talkState[talkUser] == 6 then
		if getPlayerItemCount(cid, 8310) >= 1 then
			npcHandler:say("AMAZING!! I'm going to start immediately with the research. If it turns out the way I expect it, Alverus will be revived soon!! Here, take this as a reward and try to collect more of this substance. I'll make you a good offer, I promise.", cid)
			doPlayerAddItem(cid, isSorcerer(cid) and 8867 or isDruid(cid) and 8869 or isPaladin(cid) and 8853 or isKnight(cid) and 8883, 1)
			setPlayerStorageValue(cid, 17000, 1)
			doPlayerRemoveItem(cid, 8310, 1)
			talkState[talkUser] = 0
		else
			npcHandler:say("WHAT!? You didn't bring the neutral matter!", cid)
			talkState[talkUser] = 6
		end
	end
	
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())