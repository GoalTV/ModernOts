function onLogin(cid)

local rate = 1.5 -- 30%
local config = {
vip = "Você tem "..((rate - 1)*100).."% de exp a mais agora!",
notvip = "Tornesse vip e ganhe "..((rate - 1)*100).."% a mais de experiencia!",
}

if vip.hasVip(cid) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.notvip)
else
doPlayerSetExperienceRate(cid, rate)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.vip)
end
return TRUE
end