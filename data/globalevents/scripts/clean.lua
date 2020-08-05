function executeclean()
	doCleanMap()
	doBroadcastMessage("Server Cleared, next clean in 30 minutes.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
    doBroadcastMessage("Game map cleaning within 30 seconds, please pick up your items!")
	addEvent(executeclean, 30000)
	return true
end