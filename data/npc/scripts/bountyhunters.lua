local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end
local talkState = {}
local huntN = {}
local huntP = {}

local function checkName(player)
	local sp_id = getPlayerGUIDByName(player)
	if sp_id == nil then
		return FALSE
	end
	
	local id = 0
	local result_plr = db.getResult("SELECT * FROM `bounty_hunters` WHERE `sp_id` = "..sp_id.." AND `killed` = 0;")
    if(result_plr:getID() ~= -1) then
		id = tonumber(result_plr:getDataInt("sp_id"))
		result_plr:free()
    end
	
	if id ~= sp_id then
		return TRUE
	end
return FALSE
end

local function huntPlayer(cid,player,cost)
local guid = tonumber(getPlayerGUID(cid))
local player = tonumber(getPlayerGUIDByName(player))
local cost = tonumber(cost)

if guid == nil or player == nil or cost == nil then 
	return FALSE
end
	db.executeQuery("INSERT INTO `bounty_hunters` VALUES (NULL,"..guid..","..player..",0," .. os.time() .. ","..cost..",0,0);")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] Hunt has been added successfuly!")
	return TRUE
end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
if(not(npcHandler:isFocused(cid))) then
	return false
end
	if talkState[cid] == nil then
		talkState[cid] = 0
	end
        if (msgcontains(msg, 'tak') or msgcontains(msg, 'yes') or msgcontains(msg, 'hunt')) and talkState[cid] == 0 then
			selfSay('Oh, you want to kill somebody, don`t you? Tell me, what is his name.',cid)
			talkState[cid] = 1
		elseif talkState[cid]==1 then
			talkState[cid] = 0
			if checkName(msg) == TRUE then
				huntN[cid] = msg
				selfSay('Okay. You can hunt him. Tell me, how much {thousands} {of} {gold} {coins} will you pay to the killer.',cid)
				talkState[cid] = 2
			else
				selfSay('Sorry, this player is already hunted or does not exist. Really sorry!',cid)
			end
		elseif talkState[cid] == 2 then
				talkState[cid] = 0
				kwota = tonumber(msg)
				if kwota == nil then
					selfSay('What? I don`t understand you.', cid)
				elseif kwota > 10000000 then
					selfSay('Sorry, the maximum amount of gold coins is 10 000 000K.', cid)
				elseif kwota < 1 then
					selfSay('Sorry, the minimum amount of gold coins is 1 000.', cid)
				else
					huntP[cid] =  kwota
					selfSay('Do you want to hunt the player {'..huntN[cid]..'} for {'..huntP[cid]..'K} gold coins?', cid)
					talkState[cid] = 3
				end
		elseif talkState[cid] == 3 then
					if msgcontains(msg, 'yes') then
						if doPlayerRemoveMoney(cid,huntP[cid]*1000) then
						
						if huntPlayer(cid,huntN[cid],huntP[cid]*1000) == TRUE then
							selfSay('You have added the hunt announcement of killing the player {'..huntN[cid]..'} for {'..huntP[cid]..'K} gold coins!', cid)
							else
								selfSay('Maybe next time.',cid)
							end

						else
							selfSay('Sorry, you do not have enough money. Maybe next time!',cid)
						end
					else
						selfSay('Maybe next time.',cid)
					end
					talkState[cid]=0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
