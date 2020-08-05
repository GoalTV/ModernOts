local t, storage = {
	{1000, 10}
}, 256
 
function onAdvance(cid, skill, oldLevel, newLevel)
    if skill ~= SKILL__LEVEL then
        return true
    end
    for i = 1, #t do
        local v = t[i]
        if newLevel >= v[1] and getCreatureStorage(cid, storage) < i then
            db.executeQuery('UPDATE znote_accounts SET points=points+'.. v[2] ..' WHERE id=' .. getPlayerAccountId(cid))
            doCreatureSetStorage(cid, storage, i)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations! You have advanced to level ' .. v[1] .. ' and you have recived '.. v[2] ..' Premium Points!')
			doBroadcastMessage('Congratulations! ' .. getCreatureName(cid) .. ' Advenced To LeveL ' .. v[1] .. ' And Got ' .. v[2] .. ' Premium Points.')
        end
    end
    return true
end
