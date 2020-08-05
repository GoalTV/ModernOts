function onTimer()
local days = 7*24*60*60
doSaveServer()
local query = db.getResult("SELECT `owner`,`id` FROM `houses`;")
if (query:getID() ~= -1) then
while true do
local own,houseid = query:getDataInt("owner"),query:getDataInt("id")
local qry = db.getResult("SELECT `lastlogin` FROM `players` WHERE `id` = "..own)
if(qry:getID() ~= -1) then
last = tonumber(qry:getDataInt("lastlogin"))
if last < os.time() - days then
setHouseOwner(houseid, NO_OWNER_PHRASE,true)
end
end
if not(query:next()) then
break
end
end
query:free()
end
return true
end