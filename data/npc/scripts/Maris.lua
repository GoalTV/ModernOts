local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'mistrock'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Mistrock for 0 gold coins?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=446, y=847, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here!'})
        
	local travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Yalahar for 0 gold coins?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=446, y=692, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here!'})
        
	local travelNode = keywordHandler:addKeyword({'fenrock'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Fenrock for 0 gold coins?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=327, y=747, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here!'})
			
        keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to Mistrock, Fenrock and Yalahar'})
        keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
        keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to Mistrock, Fenrock and Yalahar.'})
		
-- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())