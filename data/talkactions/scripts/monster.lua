function onSay(cid, words, param, channel)
local exp = getConfigValue('rateExperience')
local time = 60 -- in second
    if param == "" then
        doPlayerSendCancel(cid, "Param Needed(For Ex:!exp rotworm)")
        doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
        return true
    end

    if not getMonsterInfo(param) then
    doPlayerSendCancel(cid, "Monster Name Is Incorrect")
    return true
    end

    if exhaustion.check(cid, 1023) then
    doPlayerSendCancel(cid, "You Need To Wait "..math.floor(exhaustion.get(cid,1023))..".")
    doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
        return true
    end

    if getExperienceForLevel(getPlayerLevel(cid)+1) > getPlayerExperience(cid) then
        local exped = getExperienceForLevel(getPlayerLevel(cid)+1) - getPlayerExperience(cid)
        local monsterned = string.lower(getMonsterInfo(param).experience) * exp
        local expneed = math.floor(exped / monsterned)+1
        doPlayerPopupFYI(cid, "You Need To Kill "..expneed.." "..param.." To Advance To Level "..getPlayerLevel(cid)+1 .."")
        exhaustion.set(cid, 1023, time*1000)
        elseif getPlayerExperience(cid) > getExperienceForLevel(getPlayerLevel(cid)+1) then
        local exped2 = getPlayerExperience(cid) - getExperienceForLevel(getPlayerLevel(cid)+1)
        local monsterned2 = string.lower(getMonsterInfo(param).experience) * exp
        local expneed = math.floor(exped2 / monsterned2)+1
        doPlayerPopupFYI(cid,"You Need To Kill "..expneed2.." "..param.." To Advance To Level "..getPlayerLevel(cid)+1 .."")
        exhaustion.set(cid, 1023, time*1000)
    end
    return true
end
