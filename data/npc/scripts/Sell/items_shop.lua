local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)



function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end

function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end

function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end

function onThink()                                      npcHandler:onThink()                                    end



local shopModule = ShopModule:new()



npcHandler:addModule(shopModule)



shopModule:addSellableItem({'chain helmet'}, 2458,20, 1, 'chain helmet')
shopModule:addSellableItem({'brass helmet'}, 2460,120, 1, 'brass helmet')
shopModule:addSellableItem({'leather helmet'}, 2461,15, 1, 'leather helmet')
shopModule:addSellableItem({'viking helmet'}, 2473,265, 1, 'viking helmet')
shopModule:addSellableItem({'soldier helmet'}, 2481,50, 1, 'soldier helmet')
shopModule:addSellableItem({'iron helmet'}, 2459,150, 1, 'iron helmet')
shopModule:addSellableItem({'dark helmet'}, 2490,250, 1, 'dark helmet')
shopModule:addSellableItem({'steel helmet'}, 2457,300, 1, 'steel helmet')

shopModule:addSellableItem({'chain armor'}, 2464,70, 1, 'chain armor')
shopModule:addSellableItem({'brass armor'}, 2465,450, 1, 'brass armor')
shopModule:addSellableItem({'leather armor'}, 2467,35, 1, 'leather armor')
shopModule:addSellableItem({'belted cape'}, 8872,300, 1, 'belted cape')
shopModule:addSellableItem({'plate armor'}, 2463,800, 1, 'plate armor')

shopModule:addSellableItem({'brass legs'}, 2478,50, 1, 'brass legs')
shopModule:addSellableItem({'chain legs'}, 2648,20, 1, 'chain legs')
shopModule:addSellableItem({'plate legs'}, 2647,115, 1, 'plate legs')
shopModule:addSellableItem({'brass shield'}, 2511,65, 1, 'brass shield')
shopModule:addSellableItem({'wooden shield'}, 2512,15, 1, 'wooden shield')
shopModule:addSellableItem({'plate shield'}, 2510,45, 1, 'plate shield')
shopModule:addSellableItem({'steel shield'}, 2509,80, 1, 'steel shield')
shopModule:addSellableItem({'dwarven shield'}, 2525,100, 1, 'dwarven shield')

shopModule:addSellableItem({'spear'}, 2389,2, 1, 'spear')
shopModule:addSellableItem({'royal spear'}, 7378,15, 1, 'royal spear')
shopModule:addSellableItem({'bow'}, 2456,100, 1, 'bow')
shopModule:addSellableItem({'crossbow'}, 2455,200, 1, 'crossbow')
shopModule:addSellableItem({'mace'}, 2398,30, 1, 'mace')
shopModule:addSellableItem({'battle hammer'}, 2417,140, 1, 'battle hammer')
shopModule:addSellableItem({'morning star'}, 2394,90, 1, 'morning star')
shopModule:addSellableItem({'clerical mace'}, 2423,170, 1, 'clerical mace')
shopModule:addSellableItem({'hatchet'}, 2378,25, 1, 'hatchet')
shopModule:addSellableItem({'battle axe'}, 2378,80, 1, 'battle axe')
shopModule:addSellableItem({'halberd'}, 2381,400, 1, 'halberd')
shopModule:addSellableItem({'double axe'}, 2387,260, 1, 'double axe')
shopModule:addSellableItem({'sword'}, 2376,30, 1, 'sword')
shopModule:addSellableItem({'longsword'}, 2397,90, 1, 'longsword')
shopModule:addSellableItem({'scimitar'}, 2419,150, 1, 'scimitar')

npcHandler:addModule(FocusModule:new()) 