local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)



function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end

function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end

function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end

function onThink()                                      npcHandler:onThink()                                    end



local shopModule = ShopModule:new()



npcHandler:addModule(shopModule)



shopModule:addSellableItem({'chain helmet'}, 2458,20, 'chain helmet')
shopModule:addSellableItem({'brass helmet'}, 2460,120, 'brass helmet')
shopModule:addSellableItem({'leather helmet'}, 2461,15, 'leather helmet')
shopModule:addSellableItem({'viking helmet'}, 2473,265, 'viking helmet')
shopModule:addSellableItem({'soldier helmet'}, 2481,50, 'soldier helmet')
shopModule:addSellableItem({'iron helmet'}, 2459,150,'iron helmet')
shopModule:addSellableItem({'dark helmet'}, 2490,250,'dark helmet')
shopModule:addSellableItem({'steel helmet'}, 2457,300,'steel helmet')

shopModule:addSellableItem({'chain armor'}, 2464,70,'chain armor')
shopModule:addSellableItem({'brass armor'}, 2465,450,'brass armor')
shopModule:addSellableItem({'leather armor'}, 2467,35,'leather armor')
shopModule:addSellableItem({'belted cape'}, 8872,300, 'belted cape')
shopModule:addSellableItem({'plate armor'}, 2463,800, 'plate armor')

shopModule:addSellableItem({'brass legs'}, 2478,50, 'brass legs')
shopModule:addSellableItem({'chain legs'}, 2648,20, 'chain legs')
shopModule:addSellableItem({'plate legs'}, 2647,115, 'plate legs')
shopModule:addSellableItem({'brass shield'}, 2511,65, 'brass shield')
shopModule:addSellableItem({'wooden shield'}, 2512,15, 'wooden shield')
shopModule:addSellableItem({'plate shield'}, 2510,45, 'plate shield')
shopModule:addSellableItem({'steel shield'}, 2509,80, 'steel shield')
shopModule:addSellableItem({'dwarven shield'}, 2525,100, 'dwarven shield')

shopModule:addSellableItem({'spear'}, 2389,2,'spear')
shopModule:addSellableItem({'bow'}, 2456,100, 'bow')
shopModule:addSellableItem({'crossbow'}, 2455,200, 'crossbow')
shopModule:addSellableItem({'mace'}, 2398,30, 'mace')
shopModule:addSellableItem({'battle hammer'}, 2417,140, 'battle hammer')
shopModule:addSellableItem({'morning star'}, 2394,90, 'morning star')
shopModule:addSellableItem({'clerical mace'}, 2423,170, 'clerical mace')
shopModule:addSellableItem({'hatchet'}, 2378,25, 'hatchet')
shopModule:addSellableItem({'battle axe'}, 2378,80, 'battle axe')
shopModule:addSellableItem({'halberd'}, 2381,400, 'halberd')
shopModule:addSellableItem({'double axe'}, 2387,260, 'double axe')
shopModule:addSellableItem({'sword'}, 2376,30, 'sword')
shopModule:addSellableItem({'longsword'}, 2397,90, 'longsword')
shopModule:addSellableItem({'scimitar'}, 2419,150, 'scimitar')

npcHandler:addModule(FocusModule:new()) 