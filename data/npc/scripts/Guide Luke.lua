local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local mapMarks = {
	[{x = 32346, y = 32225, z = 7}] = {MAPMARK_LOCK, 'Depot'},
	[{x = 32342, y = 32230, z = 7}] = {MAPMARK_DOLLAR, 'Bank'},
	[{x = 32369, y = 32237, z = 7}] = {MAPMARK_TEMPLE, 'Temple'},
	[{x = 32375, y = 32200, z = 7}] = {MAPMARK_SHOVEL, 'Equipment'},
	[{x = 32368, y = 32181, z = 7}] = {MAPMARK_REDNORTH, 'Thais North Gate'},
	[{x = 32342, y = 32280, z = 7}] = {MAPMARK_REDSOUTH, 'Thais South Gate'},
	[{x = 32429, y = 32225, z = 7}] = {MAPMARK_REDEAST, 'Thais East Gate'},
	[{x = 32284, y = 32266, z = 7}] = {MAPMARK_REDWEST, 'Thais West Gate'}
}

local thinkMsg = {
	"Need some help finding your way through Thais? Let me assist you.",
	"Free escort to the depot for newcomers!",
	"Hello, is this your first visit to Thais? I can show you around a little.",
	"Talk to me if you need directions."
}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function thinkCallback(cid)
	local rand = math.random(200)
	if thinkMsg[rand] then
		npcHandler:say(thinkMsg[rand])
	end
	return true
end

function greetCallback(cid)
	Topic[cid] = 1
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif getPlayerLevel(cid) < 10 and msgcontains(msg, 'escort') then
		npcHandler:say('Yes, I escort newcomers to the depot. Do you want me to bring you there?', cid)
		Topic[cid] = 3
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		npcHandler:say('Well, I can {mark} all important locations in this town on your map. I can also give you {information} about Thais in general.', cid)
		Topic[cid] = 0
	elseif Topic[cid] == 2 and msgcontains(msg, 'yes') then
		npcHandler:say('Here you go.', cid)
		for pos, v in pairs(mapMarks) do
			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'escort') then
		npcHandler:say('This service is only for newcomers below level 10. I think you can manage the way on your own! If you need {marks} on your map, let me know.', cid)
		Topic[cid] = 0
	elseif Topic[cid] == 1 and getPlayerLevel(cid) < 10 then
		npcHandler:say('Hmm, maybe a free escort to the depot then? Just in case you\'d like to store some stuff before you head out for adventure. How about it?', cid)
		Topic[cid] = 3
	elseif Topic[cid] == 2 then
		npcHandler:say('Well, nothing wrong about exploring the town on your own. Let me know if you need something!', cid)
		Topic[cid] = 0
	elseif Topic[cid] == 3 and msgcontains(msg, 'yes') then
		npcHandler:say('And here we go!', cid)
		npcHandler:releaseFocus(cid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 32345, y = 32220, z = 7})
		doSendMagicEffect({x = 32345, y = 32220, z = 7}, CONST_ME_TELEPORT)
		Topic[cid] = 0
	elseif msgcontains(msg, 'name') then
		npcHandler:say('I\'m Luke. No jokes, please, I heard them all!', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'job') then
		npcHandler:say('I\'m a guide, overworked and underpaid. I can {mark} important locations on your {map} and give you some {information} about the town.', cid)
		Topic[cid] = 0
	elseif Topic[cid] == 3 then
		npcHandler:say('Well, you seem to know your way around. Take care!', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'information') then
		npcHandler:say('Currently, I can tell you all about the {town}, its {temple}, the {bank}, {shops}, {spell trainers} and the {depot}.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'map') or msgcontains(msg, 'mark') then
		npcHandler:say('Would you like me to mark locations like - for example - the depot, bank and shops on your map?', cid)
		Topic[cid] = 2
	elseif Topic[cid] == 1 then
		npcHandler:say('Well, you seem to know your way around. Take care!', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'town') or msgcontains(msg, 'thais') then
		npcHandler:say('Thais is the oldest settlement in Tibia. You can hear its history whisper when walking through the streets. Beware of criminals, but else it\'s a fine city.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'temple') then
		npcHandler:say('The temple is in the centre of Thais. Walk east from the harbour and pass by the {depot} until you reach the infamous crossroads, then turn south.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'bank') then
		npcHandler:say('We have two bankers, Suzy and Naji. Naji is right in the depot. For Suzi, exit the {depot} to the west and walk south-west. Don\'t forget that I can {mark} important locations on your map.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'shop') then
		npcHandler:say('You can buy {weapons}, {armor}, {tools}, {gems}, {magical} equipment, {furniture} and {food} here.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'spell') then
		if isSorcerer(cid) then
			npcHandler:say('Muriel is your sorcerer trainer. You can find the sorcerer guild in the utmost south-western part of Thais. I can {mark} it on your map for you.', cid)
		elseif isDruid(cid) then
			npcHandler:say('Marvik, the druid trainer, lives a bit secluded in the eastern part of the city. From the harbour, walk east until you reach the eastern wall, then go up the stony ramp and down the white stairs. I can {mark} it for you.', cid)
		elseif isPaladin(cid) then
			npcHandler:say('Exit the {depot} to the west and walk south to reach the paladin guild. You are looking for Elane there - your paladin trainer.', cid)
		elseif isKnight(cid) then
			npcHandler:say('Gregor, your trainer, can be found upstairs the knight arena. Walk east from this harbour, pass by the {depot}, crossroads and shops until you see a muddy arena. There go upstairs. I can {mark} it for you.', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'depot') then
		npcHandler:say('The depot is a place where you can safely store your belongings. You are also protected against attacks there. I {escort} newcomers there.', cid)
		Topic[cid] = 0
	else
		npcHandler:say('Sorry, I don\'t have anything to tell you about this topic.', cid)
		Topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye and enjoy your stay in Thais, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_GREET, 'Hello there, |PLAYERNAME| and welcome to Thais! Would you like some {information} and a {map} guide?')
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())