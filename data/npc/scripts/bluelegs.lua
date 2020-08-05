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
        local tokenid = 8265
        local storage = 6555
        local getstorage = getPlayerStorageValue(cid, storage)
        local sorrymessage = "Sorry, are you sure you got all 4 piece's  of broken amulets?."
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
        if msgcontains(msg, 'piece of broken amulet') then
                if getstorage == 1 then
                        npcHandler:say("You are now finished.", cid)
                elseif getstorage < 1 then
                        npcHandler:say("Would ye' like to give me 4 piece's of broken amulets.?", cid)
                        talkState[talkUser] = 1
                end
        elseif msgcontains(msg, 'Remove This shit if you want!') then
                if getstorage < 1 then
                        npcHandler:say("You have not give me 4 pice's of broken amulets.", cid)
                elseif getstorage == 1 then
                        npcHandler:say("I have aledry give you {koshei's ancient amulet} !!.", cid)
                end
        elseif msgcontains(msg, 'yes') then
                if talkState[talkUser] == 1 then
                        if getstorage < 0 then
                                if doPlayerRemoveItem(cid, tokenid, 1) == TRUE then
                                        npcHandler:say("Ye' brought the 4 piece's of broken amulets. needed to complete blue legs quest'.", cid)
                                        setPlayerStorageValue(cid, storage, 1)
                                                                                doPlayerAddItem(cid, 8266, 1)
                                                                                doPlayerRemoveItem(cid, 8264, 1)
                                                                                doPlayerRemoveItem(cid, 8263, 1)
                                                                                doPlayerRemoveItem(cid, 8262, 1)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, tokenid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        end
                end
        elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
                npcHandler:say("Sure, come back when you have 4 piece's of broken amulets..", cid)
                talkState[talkUser] = 0
        end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())