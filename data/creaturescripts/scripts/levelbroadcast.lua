local old = 400 --Level you want broadcasted
local new = 399 --1 Level below what you want broadcasted
function onAdvance(cid, skill, oldlevel, newlevel)
local name = getCreatureName(cid)
if skill == SKILL__LEVEL and oldlevel < old and newlevel > new then
doBroadcastMessage("Congratulations " .. name .. " on level " .. old .. "!", MESSAGE_STATUS_CONSOLE_RED)
return TRUE
end
end
