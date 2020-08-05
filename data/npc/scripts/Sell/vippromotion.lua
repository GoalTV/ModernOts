local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end

local node1 = keywordHandler:addKeyword({'vip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 200000 gold coins. Do you want me to promote you?'})
    node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 200000, premium = true, level = 10, promotion = 2, text = 'Congratulations! You are now promoted.'})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready boy.', reset = true})


npcHandler:addModule(FocusModule:new())  