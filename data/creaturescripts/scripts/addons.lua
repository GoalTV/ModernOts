function onAdvance(cid, skill, oldLevel, newLevel)
 
 
--- Other Config ---
local TextType = MESSAGE_STATUS_CONSOLE_ORANGE
 
--- Citizen ---
local citizentext = "You have now citizen addons."
local citizenlevel = 20
local citizenstorage = 11500
--- Hunter ---
local huntertext = "You have now hunter addons."
local hunterlevel = 40
local hunterstorage = 11505
--- Mage ---
local magetext = "You have now mage addons."
local magelevel = 200
local magestorage = 11510
--- Knight ---
local knighttext = "You have now knight addons."
local knightlevel = 80
local knightstorage = 11515
--- Noble ---
local nobletext = "You have now noble addons."
local noblelevel = 60
local noblestorage = 11520
--- Summoner ---
local summonertext = "You have now summoner addons."
local summonerlevel = 300
local summonerstorage = 11525
--- Warrior ---
local Warriortext = "You have now Warrior addons."
local Warriorlevel = 240
local Warriorstorage = 11530
--- Barbarian ---
local Barbariantext = "You have now Barbarian addons."
local Barbarianlevel = 420
local Barbarianstorage = 11605
--- Druid ---
local Druidtext = "You have now Druid addons."
local Druidlevel = 260
local Druidstorage = 11535
--- Wizard ---
local Wizardtext = "You have now Wizard addons."
local Wizardlevel = 100
local Wizardstorage = 11540
--- Oriental ---
local Orientaltext = "You have now Oriental addons."
local Orientallevel = 220
local Orientalstorage = 11545
--- Pirate ---
local Piratetext = "You have now Pirate addons."
local Piratelevel = 120
local Piratestorage = 11550
--- Assassin ---
local Assassintext = "You have now Assassin addons."
local Assassinlevel = 440
local Assassinstorage = 11555
--- Beggar ---
local Beggartext = "You have now Beggar addons."
local Beggarlevel = 140
local Beggarstorage = 11560
--- Shaman ---
local Shamantext = "You have now Shaman addons."
local Shamanlevel = 340
local Shamanstorage = 11565
--- Norse ---
local Norsetext = "You have now Norse addons."
local Norselevel = 160
local Norsestorage = 11570
--- Nightmare ---
local Nightmaretext = "You have now Nightmare addons."
local Nightmarelevel = 380
local Nightmarestorage = 11575
--- Jester ---
local Jestertext = "You have now Jester addons."
local Jesterlevel = 180
local Jesterstorage = 11580
--- Brotherhood ---
local Brotherhoodtext = "You have now Brotherhood addons."
local Brotherhoodlevel = 400
local Brotherhoodstorage = 11585
--- Demonhunter ---
local Demonhuntertext = "You have now Demonhunter addons."
local Demonhunterlevel = 320
local Demonhunterstorage = 11590
--- Yalaharian ---
local Yalahariantext = "You have now Yalaharian addons."
local Yalaharianlevel = 280
local Yalaharianstorage = 11595
--- Warmaster ---
local Warmastertext = "You have now Warmaster addons."
local Warmasterlevel = 360
local Warmasterstorage = 11600
 
 
--- Citizen ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= citizenlevel) then
			if(getPlayerStorageValue(cid, citizenstorage) == -1)then 
				doPlayerAddOutfit(cid, 136, 3)
				doPlayerAddOutfit(cid, 128, 3)
				setPlayerStorageValue(cid, citizenstorage, 1)
				doPlayerSendTextMessage(cid, TextType, citizentext)
				end
		end
	end
--- Hunter ---	
	if (skill == SKILL__LEVEL) then
		if(newLevel >= hunterlevel) then
			if(getPlayerStorageValue(cid, hunterstorage) == -1)then 
				doPlayerAddOutfit(cid, 137, 3)
				doPlayerAddOutfit(cid, 129, 3)
				setPlayerStorageValue(cid, hunterstorage, 1)
				doPlayerSendTextMessage(cid, TextType, huntertext)
				end
		end
	end
--- Mage ---	
	if (skill == SKILL__LEVEL) then
		if(newLevel >= magelevel) then
			if(getPlayerStorageValue(cid, magestorage) == -1)then 
				doPlayerAddOutfit(cid, 138, 3)
				doPlayerAddOutfit(cid, 130, 3)
				setPlayerStorageValue(cid, magestorage, 1)
				doPlayerSendTextMessage(cid, TextType, magetext)
				end
		end
	end
--- Knight ---	
	if (skill == SKILL__LEVEL) then
		if(newLevel >= knightlevel) then
			if(getPlayerStorageValue(cid, knightstorage) == -1)then 
				doPlayerAddOutfit(cid, 139, 3)
				doPlayerAddOutfit(cid, 131, 3)
				setPlayerStorageValue(cid, knightstorage, 1)
				doPlayerSendTextMessage(cid, TextType, knighttext)
				end
		end
	end
--- Nobleman and Noblewoman ---	
	if (skill == SKILL__LEVEL) then
		if(newLevel >= noblelevel) then
			if(getPlayerStorageValue(cid, noblestorage) == -1)then 
				doPlayerAddOutfit(cid, 140, 3)
				doPlayerAddOutfit(cid, 132, 3)
				setPlayerStorageValue(cid, noblestorage, 1)
				doPlayerSendTextMessage(cid, TextType, nobletext)
				end
		end
	end
--- Summoner ---	
	if (skill == SKILL__LEVEL) then
		if(newLevel >= summonerlevel) then
			if(getPlayerStorageValue(cid, summonerstorage) == -1)then 
				doPlayerAddOutfit(cid, 141, 3)
				doPlayerAddOutfit(cid, 133, 3)
				setPlayerStorageValue(cid, summonerstorage, 1)
				doPlayerSendTextMessage(cid, TextType, summonertext)
				end
		end
	end
	--- Warrior ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Warriorlevel) then
			if(getPlayerStorageValue(cid, Warriorstorage) == -1)then 
				doPlayerAddOutfit(cid, 142, 3)
				doPlayerAddOutfit(cid, 134, 3)
				setPlayerStorageValue(cid, Warriorstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Warriortext)
				end
		end
	end
	--- Barbarian ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Barbarianlevel) then
			if(getPlayerStorageValue(cid, Barbarianstorage) == -1)then 
				doPlayerAddOutfit(cid, 147, 3)
				doPlayerAddOutfit(cid, 143, 3)
				setPlayerStorageValue(cid, Barbarianstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Barbariantext)
				end
		end
	end
	--- Druid ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Druidlevel) then
			if(getPlayerStorageValue(cid, Druidstorage) == -1)then 
				doPlayerAddOutfit(cid, 148, 3)
				doPlayerAddOutfit(cid, 144, 3)
				setPlayerStorageValue(cid, Druidstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Druidtext)
				end
		end
	end
	--- Wizard ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Wizardlevel) then
			if(getPlayerStorageValue(cid, Wizardstorage) == -1)then 
				doPlayerAddOutfit(cid, 149, 3)
				doPlayerAddOutfit(cid, 145, 3)
				setPlayerStorageValue(cid, Wizardstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Wizardtext)
				end
		end
	end
	--- Oriental ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Orientallevel) then
			if(getPlayerStorageValue(cid, Orientalstorage) == -1)then 
				doPlayerAddOutfit(cid, 150, 3)
				doPlayerAddOutfit(cid, 146, 3)
				setPlayerStorageValue(cid, Orientalstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Orientaltext)
				end
		end
	end
	--- Pirate ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Piratelevel) then
			if(getPlayerStorageValue(cid, Piratestorage) == -1)then 
				doPlayerAddOutfit(cid, 155, 3)
				doPlayerAddOutfit(cid, 151, 3)
				setPlayerStorageValue(cid, Piratestorage, 1)
				doPlayerSendTextMessage(cid, TextType, Piratetext)
				end
		end
	end
	--- Assassin ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Assassinlevel) then
			if(getPlayerStorageValue(cid, Assassinstorage) == -1)then 
				doPlayerAddOutfit(cid, 156, 3)
				doPlayerAddOutfit(cid, 152, 3)
				setPlayerStorageValue(cid, Assassinstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Assassintext)
				end
		end
	end
	--- Beggar ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Beggarlevel) then
			if(getPlayerStorageValue(cid, Beggarstorage) == -1)then 
				doPlayerAddOutfit(cid, 157, 3)
				doPlayerAddOutfit(cid, 153, 3)
				setPlayerStorageValue(cid, Beggarstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Beggartext)
				end
		end
	end
	--- Shaman ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Shamanlevel) then
			if(getPlayerStorageValue(cid, Shamanstorage) == -1)then 
				doPlayerAddOutfit(cid, 158, 3)
				doPlayerAddOutfit(cid, 154, 3)
				setPlayerStorageValue(cid, Shamanstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Shamantext)
				end
		end
	end
	--- Norse ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Norselevel) then
			if(getPlayerStorageValue(cid, Norsestorage) == -1)then 
				doPlayerAddOutfit(cid, 252, 3)
				doPlayerAddOutfit(cid, 251, 3)
				setPlayerStorageValue(cid, Norsestorage, 1)
				doPlayerSendTextMessage(cid, TextType, Norsetext)
				end
		end
	end
	--- Nightmare ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Nightmarelevel) then
			if(getPlayerStorageValue(cid, Nightmarestorage) == -1)then 
				doPlayerAddOutfit(cid, 269, 3)
				doPlayerAddOutfit(cid, 268, 3)
				setPlayerStorageValue(cid, Nightmarestorage, 1)
				doPlayerSendTextMessage(cid, TextType, Nightmaretext)
				end
		end
	end
	--- Jester ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Jesterlevel) then
			if(getPlayerStorageValue(cid, Jesterstorage) == -1)then 
				doPlayerAddOutfit(cid, 270, 3)
				doPlayerAddOutfit(cid, 273, 3)
				setPlayerStorageValue(cid, Jesterstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Jestertext)
				end
		end
	end
	--- Brotherhood ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Brotherhoodlevel) then
			if(getPlayerStorageValue(cid, Brotherhoodstorage) == -1)then 
				doPlayerAddOutfit(cid, 279, 3)
				doPlayerAddOutfit(cid, 278, 3)
				setPlayerStorageValue(cid, Brotherhoodstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Brotherhoodtext)
				end
		end
	end
	--- Demonhunter ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Demonhunterlevel) then
			if(getPlayerStorageValue(cid, Demonhunterstorage) == -1)then 
				doPlayerAddOutfit(cid, 288, 3)
				doPlayerAddOutfit(cid, 289, 3)
				setPlayerStorageValue(cid, Demonhunterstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Demonhuntertext)
				end
		end
	end
	--- Yalaharian ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Yalaharianlevel) then
			if(getPlayerStorageValue(cid, Yalaharianstorage) == -1)then 
				doPlayerAddOutfit(cid, 324, 3)
				doPlayerAddOutfit(cid, 325, 3)
				setPlayerStorageValue(cid, Yalaharianstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Yalahariantext)
				end
		end
	end
	--- Warmaster ---
	if (skill == SKILL__LEVEL) then
		if(newLevel >= Warmasterlevel) then
			if(getPlayerStorageValue(cid, Warmasterstorage) == -1)then 
				doPlayerAddOutfit(cid, 336, 3)
				doPlayerAddOutfit(cid, 335, 3)
				setPlayerStorageValue(cid, Warmasterstorage, 1)
				doPlayerSendTextMessage(cid, TextType, Warmastertext)
				end
		end
	end
 
 
	return true
	end