-- [( Script edited by: DoidinMapper )] --
function onSay(cid, words, param, channel)
local saving = 0
if(isNumber(param)) then
stopEvent(saving)
save(tonumber(param) * 60 * 1000)
else
doSaveServer()
end
return true
end
function save(delay)
doSaveServer()
if(delay > 0) then
saving = addEvent(save, delay, delay)
end
end