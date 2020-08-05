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
        local tokenid = 9020
        local storage = 9020
        local getstorage = getPlayerStorageValue(cid, storage)
        local sorrymessage = "Sorry, you don't have enough tokens to progress in rank..."
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		
		if msgcontains(msg, 'mission') or msgcontains(msg, 'inquisition') then
				if getPlayerStorageValue(cid, 1889) == 22 then
						npcHandler:say("I have a problems with a vampire lord... Can you kill him?", cid)
						talkState[talkUser] = 2
				elseif getPlayerStorageValue(cid, 1889) == 0 then
						npcHandler:say("You aren't a member of the inquisition", cid)
						talkState[talkUser] = 0
				elseif getPlayerStorageValue(cid, 1889) > 0 then
						npcHandler:say("You can not help me now, come back when you have more experience.", cid)
						talkState[talkUser] = 0 
				end
		elseif msgcontains(msg, 'vampire') or msgcontains(msg, 'hunt') then		
				if getPlayerStorageValue(cid, 1889) == 23 then
						npcHandler:say("So, if you kill the vampire lord... You have his present?", cid)
						talkState[talkUser] = 3
				elseif getPlayerStorageValue(cid, 1889) ~= 23 then
						npcHandler:say("You haven't kill the vampire lord...", cid)
						talkState[talkUser] = 0
				end
        elseif msgcontains(msg, 'vampire lord token') then
			if getPlayerStorageValue(cid, 1889) == 8 then
                if getstorage == 6 then
                        npcHandler:say("You are the highest vampire hunter rank now.", cid)
                elseif getstorage < 6 then
                        npcHandler:say("Would ye' like to give me vampire tokens?", cid)
                        talkState[talkUser] = 1
                end
			else
			npcHandler:say("You have not complete the vampire lord quest yet...", cid)
			end
        elseif msgcontains(msg, 'rank') then
                if getstorage < 1 then
                        npcHandler:say("You don't have any rank yet.", cid)
                elseif getstorage == 1 then
                        npcHandler:say("You are {fluke} rank now.", cid)
                elseif getstorage == 2 then
                        npcHandler:say("You are {lucky} rank now.", cid)
                elseif getstorage == 3 then
                        npcHandler:say("You are {determined} rank now.", cid)
                elseif getstorage == 4 then
                        npcHandler:say("You are {painstaking} rank now.", cid)
                elseif getstorage == 5 then
                        npcHandler:say("You are {obliterative} rank now.", cid)
                elseif getstorage == 6 then
                        npcHandler:say("You are {razing} rank now.", cid)
                end
        elseif msgcontains(msg, 'yes') then
                if talkState[talkUser] == 1 then
                        if getstorage < 0 then
                                if doPlayerRemoveItem(cid, tokenid, 1) == TRUE then
                                        npcHandler:say("Ye' brought the token needed to advance to the first vampire hunter rank. I consider that a fluke, but still, congrats! Let me share some of my experience with ye'.", cid)
                                        setPlayerStorageValue(cid, storage, 1)
                                        doPlayerAddExp(cid, 1000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 1 then
                                if doPlayerRemoveItem(cid, tokenid, 4) == TRUE then
                                        npcHandler:say("Ye' brought the token needed to advance to the second vampire hunter rank. I consider that a fluke, but still, congrats! Let me share some of my experience with ye'.", cid)
                                        setPlayerStorageValue(cid, storage, 2)
                                        doPlayerAddExp(cid, 5000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 4) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 2 then
                                if doPlayerRemoveItem(cid, tokenid, 5) == TRUE then
                                        npcHandler:say("Ye' brought the token needed to advance to the third vampire hunter rank. I consider that a fluke, but still, congrats! Let me share some of my experience with ye'.", cid)
                                        setPlayerStorageValue(cid, storage, 3)
                                        doPlayerAddExp(cid, 10000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 5) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 3 then
                                if doPlayerRemoveItem(cid, tokenid, 10) == TRUE then
                                        npcHandler:say("Ye' brought the ten tokens needed to advance to the fourth vampire hunter rank. You're absolutely painstaking! Let me share some of my experience with ye'.", cid)
                                        setPlayerStorageValue(cid, storage, 4)
                                        doPlayerAddExp(cid, 20000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 10) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 4 then
                                if doPlayerRemoveItem(cid, tokenid, 30) == TRUE then
                                        npcHandler:say("Ye' brought the thirty tokens needed to advance to the fifth vampire hunter rank. You're completely obliterative, kid! Let me share some of my experience with ye'.", cid)
                                        setPlayerStorageValue(cid, storage, 5)
                                        doPlayerAddExp(cid, 50000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 30) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 5 then
                                if doPlayerRemoveItem(cid, tokenid, 50) == TRUE then
                                        npcHandler:say("Ye' brought the fifty tokens needed to advance to the last vampire hunter rank. Now that's something. You're razing-amazing! Let me share some of my experience and a little something with ye'!", cid)
                                        setPlayerStorageValue(cid, storage, 6)
                                        doPlayerAddExp(cid, 100000)
                                        doPlayerAddItem(cid, 9019, 1)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 50) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        end
				elseif talkState[talkUser] == 2 then
					if doPlayerRemoveItem(cid, 5905, 20) == TRUE then
						npcHandler:say("Ok, then go to his secret room and kill he, give me her present and you can continue with the job...", cid)
						talkState[talkUser] = 0
					elseif doPlayerRemoveItem(cid, 5905, 20) == FALSE then
						npcHandler:say("Sorry, but i need 20 vampire dust for this mission", cid)
						talkState[talkUser] = 0
					end
				elseif talkState[talkUser] == 3 then
					if doPlayerRemoveItem(cid, 8752, 1) == TRUE then
						npcHandler:say("Ohhh... Thanks. You do the job so go to Henricus and start a new mission.", cid)
						setPlayerStorageValue(cid, 1889, 24)
						talkState[talkUser] = 0
					elseif doPlayerRemoveItem(cid, 8752, 1) == FALSE then
						npcHandler:say("Sorry, but i need The Ring Of The Count for my job...", cid)
						talkState[talkUser] = 0
					end
			end
        elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
                npcHandler:say("Sure, come back when ye'll have enough tokens.", cid)
                talkState[talkUser] = 0
        end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 