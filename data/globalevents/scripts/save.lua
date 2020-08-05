function executeSaveServer()
	doSaveServer()
	doBroadcastMessage("Server saved, next save in 30 minutes.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
    doBroadcastMessage("Automatic Serversave in 10seconds!")
	addEvent(executeSaveServer, 10000)
	return true
end