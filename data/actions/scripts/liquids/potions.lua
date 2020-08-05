local config = {
  removeOnUse = "no",
  splashable = "no",
  realAnimation = "no", -- make text effect visible only for players in range 1x1
  healthMultiplier = 1.5,
  manaMultiplier = 1.5
}

config.removeOnUse = getBooleanFromString(config.removeOnUse)
config.splashable = getBooleanFromString(config.splashable)
config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
  [7618] = {empty = 7618, splash = 2, health = {80, 120}}, -- health potion
  [7588] = {empty = 7588, splash = 2, health = {150, 400}, level = 50, vocations = {3, 4, 7, 8, 11, 12}, vocStr = "knights and paladins"}, -- strong health potion
  [7591] = {empty = 7591, splash = 2, health = {500, 600}, level = 80, vocations = {4, 8, 12}, vocStr = "knights"}, -- great health potion
  [8473] = {empty = 8473, splash = 2, health = {700, 800}, level = 130, vocations = {4, 8, 12}, vocStr = "knights"}, -- ultimate health potion

  [7620] = {empty = 7620, splash = 7, mana = {110, 170}}, -- mana potion
  [7589] = {empty = 7589, splash = 7, mana = {190, 230}, level = 50, vocations = {1, 2, 3, 5, 6, 7, 9, 10, 11}, vocStr = "sorcerers, druids and paladins"}, -- strong mana potion
  [7590] = {empty = 7590, splash = 7, mana = {250, 330}, level = 80, vocations = {1, 2, 5, 6, 9, 10}, vocStr = "sorcerers and druids"}, -- great mana potion

  [8472] = {empty = 8472, splash = 3, health = {250, 300}, mana = {190, 250}, level = 80, vocations = {3, 7, 11}, vocStr = "paladins"} -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
  local potion = POTIONS[item.itemid]
  if(not potion) then
      return false
  end

  if(not isPlayer(itemEx.uid)) then
      if(not config.splashable) then
        return false
      end

      if(toPosition.x == CONTAINER_POSITION) then
        toPosition = getThingPos(item.uid)
      end

      doDecayItem(doCreateItem(2016, potion.splash, toPosition))
      doTransformItem(item.uid, potion.empty)
      return true
  end

  if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then
      doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
      return true
  end

  if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
      not getPlayerCustomFlagValue(cid, PlayerCustomFlag_GamemasterPrivileges))
  then
      doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1)
      return true
  end

  local health = potion.health
  if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
      return false
  end

  local mana = potion.mana
  if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
      return false
  end

  doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
  if(not realAnimation) then
      doCreatureSay(itemEx.uid, "Marihuana...", TALKTYPE_ORANGE_1)
  else
      for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
        if(isPlayer(tid)) then
            doCreatureSay(itemEx.uid, "Marihuana...", TALKTYPE_ORANGE_1, false, tid)
        end
      end
  end

  doAddCondition(cid, exhaust)
  if(not potion.empty or config.removeOnUse) then
      doRemoveItem(item.uid)
      return true
  end

 
  return true
end