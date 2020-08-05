local conf = {}
-- // config // ---
    conf.danceTexts = {"GO GO DANCE!", "DANCE NOW!", "DANCE IS FUNY!"}
    conf.textSpeed = 1500 -- how fast animated texts is sending?
    conf.danceSpeed = 100 -- dance speed
    conf.outfitSpeed = 250 -- outfit changer speed
    conf.outfitMale = {128, 129, 130, 131, 132, 133, 134, 143, 144, 145, 146, 151, 152, 153, 154, 251, 268, 273, 278, 289, 325} -- all male outfits
    conf.outfitFemale = {136, 137, 138, 139, 140, 141, 142, 147, 148, 149, 150, 155, 156, 157, 158, 252, 269, 270, 279, 288, 324} -- all female outfits
-- // end // --



function dancer(tab)
    if isPlayer(tab[1]) then
        local dirs = {[0] = {1,3},[1] = {0,2},[2] = {1,3},[3] = {0,2}}
        local look = dirs[getCreatureLookDirection(tab[1])]
        doCreatureSetLookDir(tab[1], look[math.random(1,2)])
        tab[2].dancer = addEvent(dancer,conf.danceSpeed, {tab[1], tab[2]})
    end
end

function messager(tab)
    if isPlayer(tab[1]) then
        doCreatureSay(tab[1], conf.danceTexts[math.random(1, #conf.danceTexts)], TALKTYPE_ORANGE_2)
        tab[2].messager = addEvent(messager,conf.textSpeed, tab)
    end
end

function outfitChanger(tab)
    if isPlayer(tab[1]) then
        if getPlayerSex(tab[1]) == PLAYERSEX_FEMALE then
            outs = conf.outfitFemale
        else
            outs = conf.outfitMale
        end
        local outfit = {
        lookType = outs[math.random(1, #outs)],
        lookHead = math.random(1,133),
        lookBody = math.random(1,133),
        lookLegs = math.random(1,133),
        lookFeet = math.random(1,133),
        lookTypeEx = math.random(1,133),
        lookAddons = math.random(0,3)}
        doCreatureChangeOutfit(tab[1], outfit)
        tab[2].outfitChanger = addEvent(outfitChanger,conf.outfitSpeed, tab)
    end
end
backOutfit = {}
local backOutfit = {}
function onSay(cid, words, param, channel)

    local pid = getPlayerGUID(cid)
    
    if type(events[pid]) ~= "table" then
        events[pid] = {}
    end
    
    if string.lower(param) == "start" and not(events[pid].dancer) then
        outBack = getCreatureOutfit(cid)
        backOutfit[pid] = outBack
        backOutfit[pid].lookType = outBack.lookType
        backOutfit[pid].lookAddons = outBack.lookAddons
        dancer({cid, events[pid]})
        messager({cid, events[pid]})
        outfitChanger({cid, events[pid]})
    elseif string.lower(param) == "stop" and events[pid].dancer then
        stopEvent(events[pid].dancer)
        stopEvent(events[pid].messager)
        stopEvent(events[pid].outfitChanger)
        events[pid] = {}
        doCreatureChangeOutfit(cid, backOutfit[pid])
    end
    return TRUE
end  