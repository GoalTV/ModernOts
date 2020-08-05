function onStartup()
	db.executeQuery("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	db.executeQuery("UPDATE `players` SET `posx` = " ..getConfigValue('newPlayerSpawnPosX').. " WHERE `name` = 'Account Manager';")
	db.executeQuery("UPDATE `players` SET `posy` = " ..getConfigValue('newPlayerSpawnPosY').. " WHERE `name` = 'Account Manager';")
	db.executeQuery("UPDATE `players` SET `posz` = " ..getConfigValue('newPlayerSpawnPosZ').. " WHERE `name` = 'Account Manager';")
	return TRUE
end