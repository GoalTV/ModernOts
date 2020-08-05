local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

function creatureSayCallback(cid, type, msg)
    if(npcHandler.focus ~= cid) then
        return false
    end
    
    -- NPC The Queen of the Banshees feito por Rodrigo (Nottinghster) 
    -- Inicio The Queen of the Banshees NPC
    
    local primeiro_selo = getPlayerStorageValue(cid, 90001)
    local segundo_selo = getPlayerStorageValue(cid, 90002)
    local terceiro_selo = getPlayerStorageValue(cid, 90003)
    local quarto_selo = getPlayerStorageValue(cid, 90004)
    local quinto_selo = getPlayerStorageValue(cid, 90005)
    local sexto_selo = getPlayerStorageValue(cid, 90006)
    local setimo_selo = getPlayerStorageValue(cid, 90007)
    local teletransporte = {x=32202, y=31812, z=8, stackpos =0}
    
    if msgcontains(msg, 'seventh') or msgcontains(msg, 'last') and getPlayerLevel(cid) < 60 then
    selfSay('You are not experienced enough to master the challenges ahead or to receive knowledge about the seventh seal. Go and learn more before asking me again.')
    
    elseif msgcontains(msg, 'seventh') or msgcontains(msg, 'last') and getPlayerLevel(cid) > 59 then
    selfSay('If you have passed the first six seals and entered the blue fires that lead to the chamber of the seal you might receive my kiss ... It will open the last seal. Do you think you are ready?')
    talk_state = 2
    
    elseif msgcontains(msg, 'kiss') and setimo_selo == -1 and talk_state == 8 then
    selfSay('Are you prepared to receive my kiss, even though this will mean that your death as well as a part of your soul will forever belong to me, my dear?')
    talk_state = 1
    elseif msgcontains(msg, 'kiss') and setimo_selo == -1 then
    selfSay('To receive my kiss you have to pass all other seals first.')
    talk_state = 0
    elseif msgcontains(msg, 'kiss') and setimo_selo == 1 then
    selfSay('You have already received my kiss. You should know better then to ask for it.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 1 then
    selfSay('So be it! Hmmmmmm...')
    doTeleportThing(cid, teletransporte)
    setPlayerStorageValue(cid, 90007, 1)
    elseif msgcontains(msg, 'no') and talk_state == 1 then
    selfSay('Perhaps it is the better choice for you, my dear.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 2 and quarto_selo == 1 then
    selfSay('Yessss, I can sense you have passed the seal of sacrifice. Have you passed any other seal yet?')
    talk_state = 3
    elseif msgcontains(msg, 'yes') and talk_state == 2 and quarto_selo == -1 then
    selfSay('You have not passed the seal of sacrifice yet. Return to me when you are better prepared.')
    talk_state = 0
    elseif msgcontains(msg, 'no') and talk_state == 2 then
    selfSay('Then try to be better prepared next time we meet.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 3 and primeiro_selo == 1 then
    selfSay('I sense you have passed the hidden seal as well. Have you passed any other seal yet?')
    talk_state = 4
    elseif msgcontains(msg, 'yes') and talk_state == 3 and primeiro_selo == -1 then
    selfSay('You have not found the hidden seal yet. Return when you are better prepared.')
    talk_state = 0
    elseif msgcontains(msg, 'no') and talk_state == 3 then
    selfSay('Then try to be better prepared next time we meet.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 4 and segundo_selo == 1 then
    selfSay('Oh yes, you have braved the plagueseal. Have you passed any other seal yet?')
    talk_state = 5
    elseif msgcontains(msg, 'yes') and talk_state == 4 and segundo_selo == -1 then
    selfSay('You have not faced the plagueseal yet. Return to me when you are better prepared.')
    talk_state = 0
    elseif msgcontains(msg, 'no') and talk_state == 4 then
    selfSay('Then try to be better prepared next time we meet.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 5 and terceiro_selo == 1 then
    selfSay('Ah, I can sense the power of the seal of demonrage burning in your heart. Have you passed any other seal yet?')
    talk_state = 6
    elseif msgcontains(msg, 'yes') and talk_state == 5 and terceiro_selo == -1 then
    selfSay('You are not filled with the fury of the imprisoned demon. Return when you are better prepared.')
    talk_state = 0
    elseif msgcontains(msg, 'no') and talk_state == 5 then
    selfSay('Then try to be better prepared next time we meet.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 6 and quinto_selo == 1 then
    selfSay('So, you have managed to pass the seal of the 1 path. Have you passed any other seal yet?')
    talk_state = 7
    elseif msgcontains(msg, 'yes') and talk_state == 6 and quinto_selo == -1 then
    selfSay('You have not found your 1 path yet. Return when you are better prepared.')
    talk_state = 0
    elseif msgcontains(msg, 'no') and talk_state == 6 then
    selfSay('Then try to be better prepared next time we meet.')
    talk_state = 0
    
    elseif msgcontains(msg, 'yes') and talk_state == 7 and sexto_selo == 1 then
    selfSay('I see! You have mastered the seal of logic. You have made the sacrifice, you have seen the unseen, you possess fortitude, you have filled yourself with power and found your path. You may ask me for my kiss now.')
    talk_state = 8
    elseif msgcontains(msg, 'yes') and talk_state == 7 and sexto_selo == -1 then
    selfSay('You have not found your 1 path yet. Return to meh when you are better prepared.')
    talk_state = 0
    elseif msgcontains(msg, 'no') and talk_state == 7 then
    selfSay('Then try to be better prepared next time we meet.')
    talk_state = 0
    
    elseif msgcontains(msg, 'spectral dress') then
    selfSay('Your wish for a spectral dress is silly. Allthough I will grant you the permission to take one. My maidens left one in a box in a room, directly south of here.')
    setPlayerStorageValue(cid, 327, 1)
    doPlayerAddItem(cid, 2657, 1)
    
    elseif msgcontains(msg, 'bye') and (talk_state >= 1 and talk_state <= 8) then
    selfSay('We will meet again.')
    talk_state = 0
    
    end
    -- Final The Queen of the Banshees NPC
    -- NPC The Queen of the Banshees feito por Rodrigo (Nottinghster)
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())