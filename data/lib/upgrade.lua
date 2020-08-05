-- Azi's item upgrading system -- 
config = {
    brokeChance = 10, -- % chance to broke upgrading item
    upgradePercent = 10, -- % of rise upgrading item atributtes 
    maxUpgrade = 100, -- maximum level of item
    notAllowed = {} -- items id between comma which you cannot upgrade it
}
function onUse(cid, item, fromPosition, itemEx, toPosition)

    local getUpgraded = itemEx.actionid-10000
    if getUpgraded < 0 then
    getUpgraded = 0
    end
    if getUpgraded < config.maxUpgrade then
        if itemEx.itemid > 100 then
            if isItemMoveable(itemEx.itemid) == 1 and isItemRune(itemEx.itemid) == 0 and isCorpse(itemEx.uid) == 0 and isContainer(itemEx.uid) == 0 and isItemStackable(itemEx.itemid) == 0 and isItemFluidContainer(itemEx.itemid) == 0 and isInArray(config.notAllowed, itemEx.itemid) == 0 then
                if config.brokeChance <= math.random(1,100) then
                    setItemName(itemEx.uid, getItemNameById(itemEx.itemid) .. "+" .. (getUpgraded+1))
                    doSetItemActionId(itemEx.uid, 10000+(getUpgraded+1))
                    doSendMagicEffect(toPosition, 30)
                    doPlayerSendTextMessage(cid, 22, "You successfuly upgraded " .. getItemNameById(itemEx.itemid) .. " to " .. (getUpgraded+1) .. " level.")
                    if getItemAttack(itemEx.uid) > 0 then
                        setItemAttack(itemEx.uid, (getItemAttack(itemEx.uid)+((getItemAttack(itemEx.uid)/100)*config.upgradePercent))+1)
                    end        
                    if getItemExtraAttack(itemEx.uid) > 0 then
                        setExtraItemAttack(itemEx.uid, (getExtraItemAttack(itemEx.uid)+((getExtraItemAttack(itemEx.uid)/100)*config.upgradePercent))+1)
                    end            
                    if getItemDefense(itemEx.uid) > 0 then
                        setItemDefense(itemEx.uid, (getItemDefense(itemEx.uid)+((getItemDefense(itemEx.uid)/100)*config.upgradePercent))+1)
                    end            
                    if getItemExtraDefense(itemEx.uid) > 0 then
                        setItemExtraDefense(itemEx.uid, (getItemExtraDefense(itemEx.uid)+((getItemExtraDefense(itemEx.uid)/100)*config.upgradePercent))+1)
                    end        
                    if getItemArmor(itemEx.uid) > 0 then
                        setItemArmor(itemEx.uid, (getItemArmor(itemEx.uid)+((getItemArmor(itemEx.uid)/100)*config.upgradePercent))+1)
                    end        
                    if getItemAttackSpeed(itemEx.uid) > 0 then
                        setItemAttackSpeed(itemEx.uid, (getItemAttackSpeed(itemEx.uid)+((getItemAttackSpeed(itemEx.uid)/100)*config.upgradePercent))+1)
                    end        
                    if getItemHitChance(itemEx.uid) > 0 then
                        setItemHitChance(itemEx.uid, (getItemHitChance(itemEx.uid)+((getItemHitChance(itemEx.uid)/100)*config.upgradePercent))+1)
                    end
                else
                    doPlayerSendTextMessage(cid, 22, getItemNameById(itemEx.itemid).." upgrading to level " .. (getUpgraded+1) .. " fail! You lose item!")
                    doRemoveItem(itemEx.uid, 1)
                    doSendMagicEffect(toPosition, 34)
                end
                doRemoveItem(item.uid, 1)
            else
                doPlayerSendCancel(cid, "You cannot upgrade this item!")
            end
        end
    else
        doPlayerSendCancel(cid, "This item is already upgraded to maximum item level.")
    end
        return TRUE
end  