local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end


-- Don"t forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({"carlin"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you seek a passage to Carlin for " .. (getConfigInfo("freeTravel") and "free?" or "80 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 80, destination = {x=32387, y=31820, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

local travelNode = keywordHandler:addKeyword({"edron"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you seek a passage to Edron for " .. (getConfigInfo("freeTravel") and "free?" or "70 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 70, destination = {x=33173, y=31764, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})
	
local travelNode = keywordHandler:addKeyword({"venore"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you seek a passage to Venore for " .. (getConfigInfo("freeTravel") and "free?" or "90 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 90, destination = {x=32954, y=32022, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})
	
local travelNode = keywordHandler:addKeyword({"yalahar"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you seek a passage to Yalahar for " .. (getConfigInfo("freeTravel") and "free?" or "160 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 160, destination = {x=32816, y=31272, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})
	
local travelNode = keywordHandler:addKeyword({"thais"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you seek a passage to Thais for " .. (getConfigInfo("freeTravel") and "free?" or "130 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 130, destination = {x=32310, y=32210, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

keywordHandler:addKeyword({"sail"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Carlin, Venore, Yalahar or Edron?"})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})

npcHandler:addModule(FocusModule:new())