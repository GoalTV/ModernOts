local v = {} 
for k = 1, 100000 do 
table.insert(v, createConditionObject(CONDITION_MUTED)) 
setConditionParam(v[k], CONDITION_PARAM_TICKS, k*1000) 
end 
function onLogin(cid) 
if getPlayerStorageValue(cid, 90000) >= os.time() then 
doAddCondition(cid, v[tonumber(getPlayerStorageValue(cid, 90000) - os.time())]) 
end 
return TRUE 
end 
