-- configs
templepos = {x=200,y=200,z=7}
cityid = 1
-- end configs

function onLogin(cid)
timenow = os.time()
viptime = getPlayerStorageValue(cid,29000)
quantity = math.floor((getPlayerStorageValue(cid,29000) - timenow)(360024))
if quantity = 0 and viptime  0 then
setPlayerStorageValue(cid,29000,0)
doTeleportThing(cid,templepos)
-- setPlayerTown (estou sem minha listinha de functions para ver qual function que � para colocar townid), voc� pode colocar aqui se quiser
end
return TRUE
end