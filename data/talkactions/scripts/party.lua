function onSay(cid, words, param, channel)
local players = getPartyMembers(getPartyLeader(cid))
local str = ""
if isInParty(cid) == true then
str = str .. "" .. #players .. " Players in Party:\n"
for i, k in ipairs(players) do
str = str .. "" .. getCreatureName(k) .. "[".. getPlayerLevel(k) .."]"
if i ~= #players then str = str .. ", " end
end
str = str .. "."   
doShowTextDialog(cid, 6579, str)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"You need to be party.")
end
return TRUE
end