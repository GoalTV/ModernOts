local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 2 + maglevel * 3) * 3.2
	max = (level * 2 + maglevel * 3) * 4.2
	if min < 250 then
		min = 250
	end
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)

if variantToNumber(var) ~= cid then
		if getTopCreature(variantToPosition(var)).uid ~= cid then
			doPlayerSendCancel(cid, 'You can only use this rune on yourself.')
			return true
		end
	end
	return doCombat(cid, combat, var)
end
