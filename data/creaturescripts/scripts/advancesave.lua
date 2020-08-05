-- [( Script edited by: DoidinMapper for XTibia.com )] --
function onAdvance(cid, skill, oldLevel, newLevel)
local config = {savePlayersOnAdvance = true}
if(config.savePlayersOnAdvance) then
doPlayerSave(cid, TRUE)
end
return TRUE
end