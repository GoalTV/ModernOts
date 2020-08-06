-- The Forgotten Server Config


	accountManager = false
	namelockManager = true
	newPlayerChooseVoc = false
	newPlayerSpawnPosX = 95
	newPlayerSpawnPosY = 117
	newPlayerSpawnPosZ = 7
	newPlayerTownId = 1
	newPlayerLevel = 1
	newPlayerMagicLevel = 0
	generateAccountNumber = false


 	comboTime = 100
   	 comboMembers = 2
    	comboFriends = 3
    	comboFriendsClearTime = 5 * 60 * 1000
    	comboFriendsClearInterval = 1 * 60 * 1000
    	comboShowAnimation = 1  


	noDamageToGuildMates = false
	noDamageToPartyMembers = false



	redSkullLength = 1 * 24 * 60 * 60
	blackSkullLength = 45 * 24 * 60 * 60
	dailyFragsToRedSkull = 30
	weeklyFragsToRedSkull = 60
	monthlyFragsToRedSkull = 120
	dailyFragsToBlackSkull = dailyFragsToRedSkull
	weeklyFragsToBlackSkull = weeklyFragsToRedSkull
	monthlyFragsToBlackSkull = monthlyFragsToRedSkull
	dailyFragsToBanishment = dailyFragsToRedSkull
	weeklyFragsToBanishment = weeklyFragsToRedSkull
	monthlyFragsToBanishment = monthlyFragsToRedSkull
	blackSkulledDeathHealth = 40
	blackSkulledDeathMana = 0
	useBlackSkull = true
	useFragHandler = true
	advancedFragList = true


	notationsToBan = 2
	warningsToFinalBan = 100
	warningsToDeletion = 200
	banLength = 2 * 24 * 60 * 60
	killsBanLength = 7 * 24 * 60 * 60
	finalBanLength = 30 * 24 * 60 * 60
	ipBanishmentLength = 1 * 24 * 60 * 60
	broadcastBanishments = true
	maxViolationCommentSize = 200
	violationNameReportActionType = 2
	autoBanishUnknownBytes = true


	worldType = "pvp"
	protectionLevel = 100
	pvpTileIgnoreLevelAndVocationProtection = true
	pzLocked = 5 * 1000
	huntingDuration = 3 * 1000
	criticalHitChance = 7
	criticalHitMultiplier = 1
	displayCriticalHitNotify = false
	removeWeaponAmmunition = false
	removeWeaponCharges = false
	removeRuneCharges = false
	whiteSkullTime = 2 * 2 * 1000
	noDamageToSameLookfeet = false
	showHealingDamage = true
	showHealingDamageForMonsters = true
	fieldOwnershipDuration = 5 * 1000
	stopAttackingAtExit = false
	oldConditionAccuracy = false
	loginProtectionPeriod = 10 * 1000
	deathLostPercent = 10
	stairhopDelay = 2 * 1000
	pushCreatureDelay = 2 * 1000
	deathContainerId = 1987
	gainExperienceColor = 215
	addManaSpentInPvPZone = true
	squareColor = 0
	allowFightback = true
	healthHealingColor = TEXTCOLOR_RED
    manaHealingColor = TEXTCOLOR_BLUE
	attackSpeed = 0


	worldId = 0
	ip = "192.168.93.129"
	bindOnlyConfiguredIpAddress = false
	loginPort = 7171
	gamePort = 7172
	adminPort = 7171
	statusPort = 7171
	loginTries = 10
	retryTimeout = 5 * 1000
	loginTimeout = 60 * 1000
	maxPlayers = 1000
	motd = "Welcome to ModernOts Evo 8.60"
	displayOnOrOffAtCharlist = true
	onePlayerOnlinePerAccount = true
	allowClones = false
	serverName = "ModernOts!"
	loginMessage = "Welcome to ModernOts Evo 8.60"
	statusTimeout = 5 * 60 * 1000
	replaceKickOnLogin = true
	forceSlowConnectionsToDisconnect = false
	loginOnlyWithLoginServer = false
	premiumPlayerSkipWaitList = false


	sqlType = "mysql"
	sqlHost = "localhost"
	sqlPort = 3306
	sqlUser = "root"
	sqlPass = "Enter-Password-Here"
	sqlDatabase = "ots"
	sqlFile = "forgottenserver.s3db"
	sqlKeepAlive = 0
	mysqlReadTimeout = 10
	mysqlWriteTimeout = 10
	encryptionType = "sha1"


	deathListEnabled = true
	deathListRequiredTime = 1 * 60 * 1000
	deathAssistCount = 19
	maxDeathRecords = 5


	ingameGuildManagement = false
	levelToFormGuild = 8
	premiumDaysToFormGuild = 0
	guildNameMinLength = 4
	guildNameMaxLength = 20


	highscoreDisplayPlayers = 15
	updateHighscoresAfterMinutes = 10


	buyableAndSellableHouses = true
	houseNeedPremium = true
	bedsRequirePremium = true
	levelToBuyHouse = 100
	housesPerAccount = 1
	houseRentAsPrice = false
	housePriceAsRent = false
	housePriceEachSquare = 1000
	houseRentPeriod = "never"
	houseCleanOld = 0
	guildHalls = true

	timeBetweenActions = 200
	timeBetweenExActions = 400
	hotkeyAimbotEnabled = true

	
	mapName = "forgotten"
	mapAuthor = "Daniel"
	randomizeTiles = true
	storeTrash = true
	cleanProtectedZones = true
	mailboxDisabledTowns = "-1"


	defaultPriority = "high"
	niceLevel = 5
	coresUsed = "-1"


	optimizeDatabaseAtStartup = true
	removePremiumOnInit = false
	confirmOutdatedVersion = false


	formulaLevel = 5.0
	formulaMagic = 1.0
	bufferMutedOnSpellFailure = false
	spellNameInsteadOfWords = false
	emoteSpells = true


	allowChangeOutfit = true
	allowChangeColors = true
	allowChangeAddons = true
	disableOutfitsForPrivilegedPlayers = false
	addonsOnlyPremium = true


	dataDirectory = "data/"
	bankSystem = true
	displaySkillLevelOnAdvance = true
	promptExceptionTracerErrorBox = true
	separateViplistPerCharacter = false
	maximumDoorLevel = 500
	maxMessageBuffer = 4


	saveGlobalStorage = true
	useHouseDataStorage = true
	storePlayerDirection = true


	checkCorpseOwner = true
	monsterLootMessage = 3
	monsterLootMessageType = 25


	ghostModeInvisibleEffect = false
	ghostModeSpellEffects = true


	idleWarningTime = 60 * 3 * 1000
        idleKickTime = 5 * 60 * 1000
	expireReportsAfterReads = 1
	playerQueryDeepness = 2
	maxItemsPerPZTile = 0
	maxItemsPerHouseTile = 0


	freePremium = true
	premiumForPromotion = true


	blessingOnlyPremium = true
	blessingReductionBase = 30
	blessingReductionDecreament = 5
	eachBlessReduction = 8


	experienceStages = true
	rateExperience = 5.0
	rateExperienceFromPlayers = 0
	rateSkill = 50.0
	rateMagic = 35.0
	rateLoot = 2.0
	rateSpawn = 2


	rateMonsterHealth = 1.0
	rateMonsterMana = 1.0
	rateMonsterAttack = 1.0
	rateMonsterDefense = 1.0


	minLevelThresholdForKilledPlayer = 0.9
	maxLevelThresholdForKilledPlayer = 1.1


	rateStaminaLoss = 1
	rateStaminaGain = 3
	rateStaminaThresholdGain = 12
	staminaRatingLimitTop = 41 * 60
	staminaRatingLimitBottom = 14 * 60
	rateStaminaAboveNormal = 1.5
	rateStaminaUnderNormal = 0.5
	staminaThresholdOnlyPremium = true


	experienceShareRadiusX = 30
	experienceShareRadiusY = 30
	experienceShareRadiusZ = 1
	experienceShareLevelDifference = 2 / 3
	extraPartyExperienceLimit = 20
	extraPartyExperiencePercent = 5
	experienceShareActivity = 2 * 60 * 1000


	globalSaveEnabled = true
	globalSaveHour = 2
	shutdownAtGlobalSave = false
	cleanMapAtGlobalSave = true


	deSpawnRange = 2
	deSpawnRadius = 50


	maxPlayerSummons = 2
	teleportAllSummons = false
	teleportPlayerSummons = false


	ownerName = "mlody.1039"
	ownerEmail = "mlody.1039@freesa-mp.com"
	url = "http://modernots.eu/"
	location = "Europe"
	displayGamemastersWithOnlineCommand = true


	adminLogsEnabled = true
	displayPlayersLogging = true
	prefixChannelLogs = ""
	runFile = ""
	outLogName = ""
	errorLogName = ""
	truncateLogsOnStartup = false
