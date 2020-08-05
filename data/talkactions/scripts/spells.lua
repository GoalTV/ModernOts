-- [( Script edited by Doidin for XTibia.com )] --
function onSay(cid, item, words, param)

local count = getPlayerInstantSpellCount(cid)
local text = ""
local t = {}
local prevLevel = -1
local line = ""

for i = 0, count - 1 do
local spell = getPlayerInstantSpellInfo(cid, i)
if spell.level ~= 0 then
if spell.manapercent > 0 then
spell.mana = spell.manapercent .. "%"
end
table.insert(t, spell)
end
end
table.sort(t, function(a, b) return a.level < b.level end)
for i, spell in ipairs(t) do
if prevLevel ~= spell.level then
if i ~= 1 then
line = ""
end
line = line .. "- Spells for Level " .. spell.level .. ":\n"
prevLevel = spell.level
end
text = text .. line .."• ".. spell.words .." - " .. spell.name .. ": " .. spell.mana .. "\n"
end
doShowTextDialog(cid, 7528, text)
return TRUE
end