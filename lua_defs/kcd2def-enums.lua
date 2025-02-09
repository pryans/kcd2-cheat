---@meta kcd2def-enums

--- this file holds the 'enum_' prefixed tables, annotated as enums

--- Enum Tables


---@enum kcd2def*enum-CombatEvent
enum_CombatEvent = {
	aoutOfAmmo = 0;
}
---@enum kcd2def*enum-CombatMoveEvent
enum_CombatMoveEvent = {
	any = 4;
	onMeleeRange = 2;
	tooFar = 1;
	unreachable = 0;
	unreached = 3;
	unreachedUnreachable = 5;
	unreachedUnreachableTooFar = 6;
}
---@enum kcd2def*enum-CompanionType
enum_CompanionType = {
	Dog = 1;
	Horse = 0;
}
---@enum kcd2def*enum-HitReactionStrength
enum_HitReactionStrength = {
	Exhausting = 4;
	Fatal = 7;
	Healing = 1;
	MajorInjury = 6;
	MinorInjury = 5;
	Tickle = 2;
	Unpleasant = 3;
	Zero = 0;
}
---@enum kcd2def*enum-HitReactionType
enum_HitReactionType = {
	Bullet = 6;
	Collision = 3;
	Decoy = 8;
	Fall = 5;
	Melee = 1;
	MeleeStealth = 2;
	Shock = 10;
	Stone = 9;
}
---@enum kcd2def*enum-HorseCommands
enum_HorseCommands = {
	Autopilot_Dash = 31;
	Autopilot_Run = 29;
	Autopilot_Sprint = 30;
	Autopilot_Walk = 28;
	ClearPlayerHorse = 3;
	ComeToMe = 1;
	CreateFormation = 4;
	CustomBehavior = 19;
	Dash = 27;
	Eat = 17;
	GoInFormation = 16;
	GoToHome = 14;
	GoToPath = 15;
	GoToPoint = 11;
	GoToPointExact = 12;
	GoToWaypoints = 13;
	Halt = 0;
	OnDismount = 23;
	OnLead = 18;
	OnMount = 22;
	Reserve = 20;
	ReserveRelease = 21;
	RideHome = 8;
	RideInFormation = 10;
	RidePath = 9;
	RidePoint = 5;
	RidePointExact = 6;
	RideWaypoints = 7;
	Run = 25;
	SetPlayerHorse = 2;
	Sprint = 26;
	Walk = 24;
}
---@enum kcd2def*enum-HorseResult
enum_HorseResult = {
	Failed = 0;
	Fall = 2;
	Success = 1;
}
---@enum kcd2def*enum-MeleeHit
enum_MeleeHit = {
	receivedComboHit = 4;
	receivedDefendedHit = 2;
	receivedFinalComboHit = 6;
	receivedHit = 0;
	receivedHitByBrokenBlock = 3;
	receivedHitWithoutFreeAttack = 7;
	receivedNonFinalComboHit = 5;
	receivedUndefendedHit = 1;
}
---@enum kcd2def*enum-PatrolType
enum_PatrolType = {
	BackAndForth = 1;
	Loop = 2;
	ToEndPoint = 0;
}
---@enum kcd2def*enum-UnconsciousReason
enum_UnconsciousReason = {
	alcohol = 2;
	exhaustion = 3;
	knockout = 1;
	unknown = 0;
}
---@enum kcd2def*enum-WeaponChangeFilter
enum_WeaponChangeFilter = {
	any = 0;
	melee = 1;
	missile = 2;
	oversized = 3;
	unarmed = 4;
	weapon = 5;
}
---@enum kcd2def*enum-achievement
enum_achievement = {
	closeOne = 4;
	collector = 3;
	sweetDreams = 1;
	thatWasMyFavouritePair = 2;
	unknown = 0;
}
---@enum kcd2def*enum-actorState
enum_actorState = {
	actorAnim = 39;
	battleArcheryNpc = 16;
	battleArcheryPlayer = 15;
	blacksmithing = 17;
	butchering = 40;
	carried = 12;
	carryCorpse = 11;
	carryItem = 13;
	cart = 27;
	combat = 25;
	crouch = 36;
	cutscene = 34;
	dead = 22;
	dialogue = 31;
	dogInteraction = 6;
	dying = 21;
	fall = 18;
	fastTravel = 33;
	follow = 26;
	hit = 10;
	holdingDecoy = 24;
	horse = 37;
	idle = 0;
	inAir = 29;
	interactiveScene = 30;
	itemInteraction = 5;
	jump = 1;
	ladder = 3;
	land = 19;
	ledge = 2;
	minigame = 4;
	none = 44;
	onBed = 38;
	ragdoll = 8;
	reading = 41;
	readingFromInventory = 42;
	rear = 43;
	shooting = 7;
	skipTime = 32;
	sprinting = 28;
	standingUp = 20;
	stoneThrowing = 14;
	tenseCircumstance = 35;
	trackview = 23;
	unconscious = 9;
}
---@enum kcd2def*enum-addRemove
enum_addRemove = {
	add = 1;
	remove = 0;
}
---@enum kcd2def*enum-aliveness
enum_aliveness = {
	alive = 0;
	aliveOrUnconscious = 4;
	any = 6;
	dead = 1;
	deadOrAlive = 5;
	deadOrUnconscious = 3;
	unconscious = 2;
}
---@enum kcd2def*enum-allOne
enum_allOne = {
	all = 0;
	atLeastOne = 1;
}
---@enum kcd2def*enum-ammo_class
enum_ammo_class = {
	Arrow = 1;
	Ball = 3;
	Bolt = 2;
	Shotgun = 4;
}
---@enum kcd2def*enum-angrinessType
enum_angrinessType = {
	material = 1;
	violence = 0;
}
---@enum kcd2def*enum-angrinessValue
enum_angrinessValue = {
	material = 1;
	violence = 0;
}
---@enum kcd2def*enum-animationApproach
enum_animationApproach = {
	dontPlayDialogAnimations = 0;
	ingameDialogPoseAndAnimations = 3;
	playDialogAnimationsIfFaderDialog = 2;
	tryDialogAnimations = 1;
}
---@enum kcd2def*enum-animationOverride
enum_animationOverride = {
	dialogControlled = 1;
	dialogControlledItemsAllowed = 3;
	noOverride = 2;
	userControlled = 0;
}
---@enum kcd2def*enum-archeryContest_refereeCommand
enum_archeryContest_refereeCommand = {
	endShooting = 3;
	getReady = 1;
	none = 0;
	playerLost = 7;
	playerWon = 6;
	startShooting = 2;
	timeIsRunningOut = 4;
	timeIsUp = 5;
}
---@enum kcd2def*enum-armor_archetype
enum_armor_archetype = {
	ArmsPlateBackGuardsLong = 33;
	ArmsPlateBackGuardsShort = 29;
	ArmsPlateCombinedLong = 32;
	ArmsPlateForearmBack = 34;
	ArmsPlateForearmFull = 35;
	ArmsPlateFullBack_withShoulders = 84;
	ArmsPlateFullComplete_withShoulders = 85;
	ArmsPlateFullGuardsLong = 31;
	ArmsPlateFullGuardsShort = 30;
	ArmsPlateShoulderGuards = 28;
	Belt = 103;
	BodyChainOverall_longSleeves = 21;
	BodyChainOverall_noSleeves = 20;
	BodyChainShirtLong_longSleeves = 19;
	BodyChainShirtLong_shortSleeves = 18;
	BodyChainShirt_longSleeves = 16;
	BodyChainShirt_shortSleeves = 15;
	BodyChainVestLong = 17;
	BodyChainVestShort = 14;
	BodyClothShirtLong_longSleeves = 27;
	BodyClothShirtLong_noSleeves = 25;
	BodyClothShirtLong_shortSleeves = 26;
	BodyClothShirt_longSleeves = 24;
	BodyClothShirt_noSleeves = 22;
	BodyClothShirt_shortSleeves = 23;
	BodyDecorLong_noSleeves = 91;
	BodyDecorShirtLong_shortSleeves = 86;
	BodyDecorUltraLong_noSleeves = 92;
	BodyPlateCuirassDoubleLong = 0;
	BodyPlateCuirassDoubleShort = 3;
	BodyPlateCuirassFrontLong = 2;
	BodyPlateCuirassFrontShort = 1;
	BodyPlateCuirassFullLong = 11;
	BodyPlateCuirassFullLong_longSleeves = 12;
	BodyPlateCuirassFullLong_shortSleeves = 13;
	BodyPlateCuirassFullShort = 10;
	Boots = 97;
	BootsAnkle = 98;
	BootsKnee = 99;
	CattlePaint = 105;
	Coat = 83;
	Coat_Bergov = 102;
	Coat_noSleeves = 67;
	Collar = 94;
	HandsGloves = 45;
	HandsGlovesPlate_toBeDeleted = 46;
	HeadChainCap = 38;
	HeadChainCap_collarOnly = 88;
	HeadChainCap_withCollar = 89;
	HeadClothCap = 36;
	HeadClothCap_withCollar = 90;
	HeadClothFullMask = 37;
	HeadPlateHatBig = 40;
	HeadPlateHatSmall = 39;
	HeadPlateHelmFull = 43;
	HeadPlateHelmFull_collar = 44;
	HeadPlateHelmOpen = 41;
	HeadPlateHelmOpen_collar = 42;
	HoodDown = 96;
	HoodOn = 95;
	HorseArmorHeadNeck = 76;
	HorseBridle = 77;
	HorseSaddle = 75;
	HorseShoe = 87;
	HorseTrappingsFull = 74;
	LegsClothTrousersLong = 47;
	LegsClothTrousersLong_withFeet = 106;
	LegsClothTrousersShort = 48;
	LegsPlateProtsLongFront = 55;
	LegsPlateProtsLongFront_withFeet = 57;
	LegsPlateProtsLongFull = 56;
	LegsPlateProtsLongFull_withFeet = 58;
	LegsPlateProtsLowerFront = 53;
	LegsPlateProtsLowerFull = 54;
	LegsPlateProtsUpperFront = 51;
	LegsPlateProtsUpperFull = 52;
	Necklace = 82;
	Pouch = 104;
	Ring = 80;
	Robe_cape = 93;
	Spur = 81;
	Tmp_HoodDown = 79;
	Tmp_HoodOn = 78;
	_UberlodPlaceholder = 100;
}
---@enum kcd2def*enum-armor_type
enum_armor_type = {
	ArmBrigandine = 38;
	ArmPlate = 39;
	BascinetOpen = 20;
	BascinetVisor = 21;
	Bells = 79;
	Belt = 76;
	BootsAnkle = 50;
	BootsKnee = 51;
	Bridle = 56;
	Brigandine = 34;
	Caftan = 29;
	Cap = 17;
	Caparison = 58;
	Coat = 35;
	CoifCap = 13;
	CoifLarge = 15;
	CoifMail = 16;
	CoifSmall = 14;
	CollarMail = 23;
	CollarPadded = 22;
	Cuirass = 33;
	F_Bonnet = 63;
	F_CapAndWimple = 64;
	F_Hat = 72;
	F_Hood = 62;
	F_HoodOpen = 73;
	F_Shoes = 65;
	F_SimpleDress = 68;
	F_Smock = 69;
	F_Veil = 74;
	F_VeilAndWimple = 75;
	GambesonLong = 28;
	GambesonShort = 27;
	Gauntlets = 40;
	Gloves = 41;
	Habit = 37;
	Hood = 24;
	HorsePadded = 61;
	HorsePlate = 59;
	HorseShoe = 60;
	HoseJoined = 42;
	HoseLoose = 43;
	HoseSeparate = 44;
	KettleHat = 18;
	LeatherApron = 81;
	LeatherCap = 80;
	LegsBrigandine = 47;
	LegsChain = 46;
	LegsPadded = 45;
	LegsPlate = 48;
	MailLong = 32;
	MailShort = 31;
	Necklace = 55;
	Pouch = 77;
	Pourpoint = 30;
	Ring = 54;
	Saddle = 57;
	Scabbard = 53;
	Shoes = 49;
	SkullCap = 19;
	Spectacles = 78;
	Spurs = 52;
	TunicLong = 26;
	TunicShort = 25;
	Waffenrock = 36;
}
---@enum kcd2def*enum-assaultVictimKind
enum_assaultVictimKind = {
	animal = 2;
	flock = 3;
	none = 0;
	npc = 1;
}
---@enum kcd2def*enum-badgeTier
enum_badgeTier = {
	gold = 2;
	invalidTier = 3;
	plumb = 0;
	silver = 1;
}
---@enum kcd2def*enum-bathhouse_barberTry
enum_bathhouse_barberTry = {
	revert = 2;
	tryChosenBeard = 1;
	tryChosenHair = 0;
}
---@enum kcd2def*enum-bathhouse_serviceType
enum_bathhouse_serviceType = {
	BarberBeard = 7;
	BarberHaircut = 6;
	Clean = 1;
	CleanHorse = 3;
	CureClean = 2;
	Love = 4;
	Love_censored = 5;
	None = 0;
}
---@enum kcd2def*enum-bathhouse_skiptimeDuration
enum_bathhouse_skiptimeDuration = {
	['1h'] = 0;
	['2h'] = 1;
	['3h'] = 2;
}
---@enum kcd2def*enum-battleRequestPriority
enum_battleRequestPriority = {
	high = 1;
	normal = 0;
}
---@enum kcd2def*enum-bedType
enum_bedType = {
	bench = 0;
	ground = 1;
	normal = 2;
	shelter = 3;
	tent = 4;
}
---@enum kcd2def*enum-bohutovaVlozka_erik_battlefieldPhases
enum_bohutovaVlozka_erik_battlefieldPhases = {
	Completed = 3;
	GivingOrders = 2;
	None = 0;
	WaitingForBohuta = 1;
}
---@enum kcd2def*enum-bohutovaVlozka_playerFollowsErikToNebakov
enum_bohutovaVlozka_playerFollowsErikToNebakov = {
	Completed = 3;
	GetHorse = 1;
	MoveToDestination = 2;
	None = 0;
}
---@enum kcd2def*enum-boidHit
enum_boidHit = {
	collision = 2;
	melee = 0;
	ranged = 1;
}
---@enum kcd2def*enum-buffTagId
enum_buffTagId = {
	alcohol_blackout = 2;
	alcohol_drunk = 1;
	alcohol_hangover = 14;
	alcohol_mood = 0;
	bleed = 4;
	encumbered = 16;
	exhausted = 15;
	food_poison = 13;
	injury = 7;
	low_health = 11;
	overeat = 6;
	poison = 3;
	q_romanceWithTheresa_alphaMale = 10;
	q_tournament_poison = 9;
	savegame = 8;
	sleep = 5;
	smell = 17;
	unstream_protection = 12;
}
---@enum kcd2def*enum-buffTimestampType
enum_buffTimestampType = {
	buffAdded = 0;
	clear = 1;
}
---@enum kcd2def*enum-cartSlotRequest
enum_cartSlotRequest = {
	any = 0;
	driver = 1;
	horseLeft = 7;
	horseRight = 8;
	leftBack = 4;
	leftFront = 2;
	playerBack = 6;
	playerFront = 5;
	rightFront = 3;
}
---@enum kcd2def*enum-cartSpeed
enum_cartSpeed = {
	fast = 1;
	instant = 2;
	normal = 0;
}
---@enum kcd2def*enum-cartUserType
enum_cartUserType = {
	driver = 0;
	horse = 1;
	passenger = 2;
}
---@enum kcd2def*enum-checkManyMode
enum_checkManyMode = {
	HasAll = 0;
	HasSome = 1;
}
---@enum kcd2def*enum-cheering_reactionType
enum_cheering_reactionType = {
	Happy = 0;
	Sad = 1;
}
---@enum kcd2def*enum-cheering_shoutingType
enum_cheering_shoutingType = {
	ongoing = 0;
	reaction = 1;
}
---@enum kcd2def*enum-circularSpatialQueryFilter
enum_circularSpatialQueryFilter = {
	ConsciousHumanNPCsPlayerExcluded = 8;
	LivingHumanNPCsPlayerExcluded = 7;
	all = 0;
	humanNPCs = 2;
	humanNPCsPlayerExcluded = 3;
	livingHumanNPCs = 6;
	nonHumanNPCs = 4;
	npcs = 1;
	perceivableItems = 5;
}
---@enum kcd2def*enum-combatAttackKind
enum_combatAttackKind = {
	dogBite = 5;
	melee = 4;
	missile = 1;
	none = 0;
	stealthAction = 2;
	unarmed = 3;
}
---@enum kcd2def*enum-combatAttackTypes
enum_combatAttackTypes = {
	heavy = 1;
	light = 0;
	special = 2;
}
---@enum kcd2def*enum-combatAutomationGuardMode
enum_combatAutomationGuardMode = {
	automate = 0;
	forceDisable = 2;
	forceEnable = 1;
	freeBlock = 3;
}
---@enum kcd2def*enum-combatGuardMode
enum_combatGuardMode = {
	automate = 0;
	forceDisable = 2;
	forceEnable = 1;
}
---@enum kcd2def*enum-combatGuardType
enum_combatGuardType = {
	clinch = 1;
	main = 0;
	none = 2;
}
---@enum kcd2def*enum-combatSlots
enum_combatSlots = {
	combo = 2;
	dodge = 1;
	perfectBlock = 0;
	riposte = 3;
	specialPerfectBlock = 4;
}
---@enum kcd2def*enum-combatStates
enum_combatStates = {
	clinch = 10;
	death = 7;
	failedAttack = 4;
	guard = 1;
	hit = 6;
	idle = 0;
	parryInPlace = 9;
	prepareToParry = 8;
	readyToStrike = 2;
	strike = 3;
	withdraw = 5;
}
---@enum kcd2def*enum-combatZoneType
enum_combatZoneType = {
	attack = 0;
	block = 2;
	guard = 1;
}
---@enum kcd2def*enum-combatZones
enum_combatZones = {
	center = 5;
	head = 0;
	lowerLeft = 3;
	lowerRight = 4;
	upperLeft = 1;
	upperRight = 2;
}
---@enum kcd2def*enum-combat_combatChatResult
enum_combat_combatChatResult = {
	surrender = 0;
}
---@enum kcd2def*enum-combat_questFightStatus
enum_combat_questFightStatus = {
	fled = 1;
	started = 0;
}
---@enum kcd2def*enum-combat_skirmishFoul
enum_combat_skirmishFoul = {
	DogIsInCombat = 4;
	DrawMissileWeapon = 1;
	DrawWeapon = 2;
	MountHorse = 3;
	NewCrimeCreated = 5;
	none = 0;
}
---@enum kcd2def*enum-combat_skirmishReaction
enum_combat_skirmishReaction = {
	indifference = 3;
	join = 1;
	none = 0;
	withdraw = 2;
}
---@enum kcd2def*enum-concept_weaponSet
enum_concept_weaponSet = {
	oversized = 2;
	primary = 0;
	secondary = 1;
}
---@enum kcd2def*enum-confiscateItems
enum_confiscateItems = {
	all = 4;
	none = 0;
	poached = 3;
	relevant = 1;
	relevantOwnAndMates = 2;
}
---@enum kcd2def*enum-consciousness
enum_consciousness = {
	conscious = 0;
	dead = 2;
	unconscious = 1;
}
---@enum kcd2def*enum-corpseState
enum_corpseState = {
	cleared = 4;
	discovered = 1;
	investigated = 2;
	undiscovered = 0;
	watched = 3;
}
---@enum kcd2def*enum-crafting_material_subtype
enum_crafting_material_subtype = {
	bezoar = 6;
	craftingSkin = 7;
	dryable = 5;
	horn = 2;
	lard = 4;
	q_disguise_anyfeather = 3;
	tusk = 1;
}
---@enum kcd2def*enum-crafting_material_type
enum_crafting_material_type = {
	blacksmithing = 3;
	herb = 1;
	special = 2;
}
---@enum kcd2def*enum-crimeFollowingMode
enum_crimeFollowingMode = {
	default = 0;
	dontBackOff = 1;
	noMoveOnlyTurn = 2;
}
---@enum kcd2def*enum-crimeFollowingRole
enum_crimeFollowingRole = {
	assist = 1;
	main = 0;
	observer = 2;
}
---@enum kcd2def*enum-crime_alarmReactionType
enum_crime_alarmReactionType = {
	calm = 1;
	none = 0;
	urgent = 2;
}
---@enum kcd2def*enum-crime_allowedSharePlayerPosAssistance
enum_crime_allowedSharePlayerPosAssistance = {
	barkAndAnimation = 2;
	none = 0;
	onlyBark = 1;
}
---@enum kcd2def*enum-crime_animalAbuseKind
enum_crime_animalAbuseKind = {
	assault = 1;
	murder = 2;
	none = 0;
	theft = 3;
}
---@enum kcd2def*enum-crime_animalKind
enum_crime_animalKind = {
	domestic = 1;
	unknown = 0;
	wild = 2;
}
---@enum kcd2def*enum-crime_animalSpecies
enum_crime_animalSpecies = {
	Boar = 1;
	Bull = 2;
	Cow = 5;
	DeerDoe = 3;
	Dog = 4;
	Horse = 6;
	Pig = 7;
	RedDeer = 8;
	Sheep = 9;
	Unknown = 0;
	WildDog = 10;
	Wolf = 11;
}
---@enum kcd2def*enum-crime_animal_escapeKind
enum_crime_animal_escapeKind = {
	annoyedReposition = 1;
	sprintAway = 2;
	unknown = 0;
}
---@enum kcd2def*enum-crime_animal_impulseLevel
enum_crime_animal_impulseLevel = {
	annoying = 1;
	critical = 2;
	unknown = 0;
}
---@enum kcd2def*enum-crime_animal_reactionKind
enum_crime_animal_reactionKind = {
	annoyance = 1;
	attack = 2;
	check = 3;
	eatDroppedFood = 4;
	escape = 5;
	horseWait = 6;
	lookAround = 7;
	reposition = 9;
	returnFromStartle = 8;
	startle = 10;
	unknown = 0;
	watchTrespass = 11;
}
---@enum kcd2def*enum-crime_animal_stimulusKind
enum_crime_animal_stimulusKind = {
	combat = 1;
	enemy = 2;
	flyBy = 3;
	hit = 5;
	human = 4;
	item = 6;
	sound = 7;
	startle = 8;
	trespass = 9;
	unknown = 0;
}
---@enum kcd2def*enum-crime_arrestChatResult
enum_crime_arrestChatResult = {
	accept = 0;
	evade = 2;
	reject = 1;
}
---@enum kcd2def*enum-crime_attackKind
enum_crime_attackKind = {
	armed = 8;
	collision = 2;
	dog = 5;
	missile = 7;
	pebble = 1;
	playerHorseCollision = 3;
	stealth = 6;
	stone = 9;
	unarmed = 4;
	unknown = 0;
}
---@enum kcd2def*enum-crime_authorityKind
enum_crime_authorityKind = {
	activeDuty = 4;
	offDuty = 2;
	offDuty_sleeping = 3;
	onDuty = 1;
	stationaryDuty = 5;
	unknown = 0;
}
---@enum kcd2def*enum-crime_banishCompanionType
enum_crime_banishCompanionType = {
	Dog = 1;
	Horse = 2;
	Unknown = 0;
}
---@enum kcd2def*enum-crime_barkPriority
enum_crime_barkPriority = {
	addressingPlayer = 4;
	addressingPlayer_important = 5;
	flavor = 0;
	important = 3;
	low = 1;
	medium = 2;
}
---@enum kcd2def*enum-crime_barkReactionKind
enum_crime_barkReactionKind = {
	bodyFound = 12;
	companionComment = 15;
	companionDog = 4;
	companionHorse = 2;
	greetPlayer = 3;
	hasWeapon = 7;
	heldBodyEnemy = 14;
	heldBodyFriendly = 10;
	ignoredPickpocket = 11;
	indifferentCombat = 9;
	isTorchless = 6;
	kettleEatingGoodRep = 13;
	mourn = 1;
	playerInStealth = 5;
	semipublicTrespass = 8;
	unknown = 0;
}
---@enum kcd2def*enum-crime_barkReactionType
enum_crime_barkReactionType = {
	chat = 1;
	ingameMonolog = 0;
}
---@enum kcd2def*enum-crime_barkSituation
enum_crime_barkSituation = {
	crimeReported = 1;
	hitReaction = 0;
	lookAround = 2;
	report_reporting = 4;
	report_running = 3;
}
---@enum kcd2def*enum-crime_campTrespassChatResult
enum_crime_campTrespassChatResult = {
	evade = 4;
	fight = 3;
	freeRoam = 2;
	leave = 1;
	none = 0;
}
---@enum kcd2def*enum-crime_chaseState
enum_crime_chaseState = {
	lockedOn = 1;
	lockedOut = 2;
	lockingOn = 3;
	lockingOut = 4;
	none = 0;
}
---@enum kcd2def*enum-crime_cooperationNotification
enum_crime_cooperationNotification = {
	arrestEscalation = 4;
	crimeResolved = 0;
	informationTransformed = 1;
	playerLeftCamp = 2;
	selfhelpEscalation = 3;
}
---@enum kcd2def*enum-crime_createInformationPositionType
enum_crime_createInformationPositionType = {
	perceivedWuid = 0;
	positionVec3 = 1;
	positionWuid = 2;
}
---@enum kcd2def*enum-crime_crimeLevel
enum_crime_crimeLevel = {
	murder = 5;
	none = 0;
	offence = 1;
	property = 3;
	trespass = 2;
	violent = 4;
}
---@enum kcd2def*enum-crime_crimeSceneSearchMode
enum_crime_crimeSceneSearchMode = {
	concentrated = 0;
	widespread = 1;
}
---@enum kcd2def*enum-crime_criminalFreshness
enum_crime_criminalFreshness = {
	notFresh = 3;
	somewhatFresh = 2;
	unknown = 0;
	veryFresh = 1;
}
---@enum kcd2def*enum-crime_doorKind
enum_crime_doorKind = {
	basic = 0;
	entrance = 1;
	storage = 2;
}
---@enum kcd2def*enum-crime_findStolenItems_wuidFilterType
enum_crime_findStolenItems_wuidFilterType = {
	inventory = 2;
	none = 0;
	relation = 1;
}
---@enum kcd2def*enum-crime_friskChatResult
enum_crime_friskChatResult = {
	discuss = 1;
	evade = 2;
	frisk = 0;
}
---@enum kcd2def*enum-crime_friskDialogResult
enum_crime_friskDialogResult = {
	fight = 2;
	frisk = 0;
	release = 1;
}
---@enum kcd2def*enum-crime_hearingSubscription
enum_crime_hearingSubscription = {
	subscribe = 0;
	unsubscribe = 1;
}
---@enum kcd2def*enum-crime_hearingSubscriptionNotificationType
enum_crime_hearingSubscriptionNotificationType = {
	diedOrLostConsciousness = 0;
	fedUp = 4;
	notHeard = 1;
	notReacting = 2;
	reacting = 3;
}
---@enum kcd2def*enum-crime_horseReturnReason
enum_crime_horseReturnReason = {
	afterArrest = 4;
	fromFollowUp = 3;
	sawMissingVolume = 2;
	sawStartledAnimal = 1;
	unknown = 0;
}
---@enum kcd2def*enum-crime_informationDiffStatus
enum_crime_informationDiffStatus = {
	Forgot = 2;
	Learned = 1;
	unknown = 0;
}
---@enum kcd2def*enum-crime_interruptAttackState
enum_crime_interruptAttackState = {
	attacking = 0;
	fightIsDone = 5;
	fightIsPaused = 4;
	playerInUnconscious = 2;
	playerIsSurrendering = 1;
	playerSurrendered = 3;
}
---@enum kcd2def*enum-crime_lookAround_approachType
enum_crime_lookAround_approachType = {
	approximate = 0;
	close = 2;
	loose = 1;
	special_animal_corpse = 4;
	special_corpse = 3;
	special_sound = 5;
	special_sound_dog_bark_align = 6;
}
---@enum kcd2def*enum-crime_lookAround_movementType
enum_crime_lookAround_movementType = {
	fast = 1;
	receiveReport = 2;
	slow = 0;
}
---@enum kcd2def*enum-crime_lookAround_searchMode
enum_crime_lookAround_searchMode = {
	barkAtUninterestingPlayer = 2;
	followWuid = 1;
	points = 0;
	stopWhileRecognizingPlayer = 3;
}
---@enum kcd2def*enum-crime_mercyDialogueResult
enum_crime_mercyDialogueResult = {
	continueFight = 2;
	forceDialogue = 4;
	friendsAgain = 3;
	itemsGiven = 6;
	playerAway = 5;
	run = 1;
	standUp = 7;
	unknown = 0;
}
---@enum kcd2def*enum-crime_offence
enum_crime_offence = {
	drawnWeapon = 0;
	noTorch = 1;
}
---@enum kcd2def*enum-crime_offenceChatAction
enum_crime_offenceChatAction = {
	unequipForbiddenEquipment = 0;
}
---@enum kcd2def*enum-crime_pickpocketBagType
enum_crime_pickpocketBagType = {
	pouch = 0;
	satchel = 1;
}
---@enum kcd2def*enum-crime_playerUrgingPriority
enum_crime_playerUrgingPriority = {
	arrest = 11;
	arrest_far = 3;
	frisk = 10;
	frisk_far = 1;
	kzik_openworldGate = 9;
	postResolveWatchTrespass = 6;
	resolve = 12;
	selfhelp = 7;
	selfhelp_far = 2;
	selfhelp_security = 8;
	unknown = 0;
	watchTrespass = 4;
	watchTrespass_authority = 5;
}
---@enum kcd2def*enum-crime_projectileType
enum_crime_projectileType = {
	arrow = 1;
	pebble = 2;
	unknown = 0;
}
---@enum kcd2def*enum-crime_punishmentLocation
enum_crime_punishmentLocation = {
	Kutnahora = 2;
	Malesov = 3;
	Miskovice = 4;
	Suchdol = 5;
	Troskovice = 1;
	Unknown = 0;
	Zikmundtabor = 6;
}
---@enum kcd2def*enum-crime_punishmentType
enum_crime_punishmentType = {
	beating = 2;
	branding = 3;
	execution = 4;
	pillory = 1;
	unknown = 0;
}
---@enum kcd2def*enum-crime_reactionKind
enum_crime_reactionKind = {
	arrest = 1;
	attack = 2;
	bandageMyself = 3;
	banishCompanion = 4;
	check = 5;
	checkHomeStashes = 7;
	checkLyingBody = 8;
	checkPockets = 9;
	checkProperty = 10;
	checkStash = 11;
	choke = 6;
	flee = 12;
	frisk = 13;
	haulGameMeat = 14;
	lookAround = 15;
	markKettleAsPoisoned = 16;
	mercy = 17;
	mindPlayer = 18;
	missingNpcFound = 19;
	mourn = 20;
	pickUpItem = 21;
	postSkirmish = 22;
	report = 23;
	returnStartledAnimal = 24;
	returnWithHelp = 25;
	scan = 26;
	selfhelp = 27;
	throwOutUnconsciousPlayer = 30;
	unknown = 0;
	wakeUp = 28;
	warnPlayer = 29;
	watch = 31;
	watchCampTrespass = 32;
	watchCorpse = 33;
	watchTrespass = 34;
}
---@enum kcd2def*enum-crime_reactionType
enum_crime_reactionType = {
	arrest = 16;
	banishCompanion = 5;
	blindInvestigate = 12;
	checkHomeStashes = 4;
	investigate = 15;
	mildWatchTrespass = 7;
	none = 1;
	passive = 2;
	pickUpItem = 3;
	reactToCorpse = 8;
	reactToUnconsciousBody = 10;
	report = 14;
	reportNonattributedCrime = 6;
	shooterInvestigate = 13;
	unknown = 0;
	warnOrFrisk = 11;
	watchTrespass = 9;
}
---@enum kcd2def*enum-crime_reportDestinationDistanceConditionType
enum_crime_reportDestinationDistanceConditionType = {
	close = 0;
	far = 1;
	unlimited = 2;
}
---@enum kcd2def*enum-crime_reportDestinationType
enum_crime_reportDestinationType = {
	authority = 2;
	mate = 1;
	none = 0;
	security = 3;
}
---@enum kcd2def*enum-crime_reputationHitForm
enum_crime_reputationHitForm = {
	faction = 1;
	unknown = 0;
	witness = 2;
}
---@enum kcd2def*enum-crime_resolutionDialogIntroKind
enum_crime_resolutionDialogIntroKind = {
	notResistingArrest_crimeSeenByGuard = 0;
	notResistingArrest_foundAccidentally = 1;
	notResistingArrest_lookedFor = 2;
	resistingArrest_beaten = 5;
	resistingArrest_repeated = 6;
	resistingArrest_running = 4;
	resistingArrest_violent = 3;
	unconscious = 7;
}
---@enum kcd2def*enum-crime_resolutionKind
enum_crime_resolutionKind = {
	fight = 5;
	fine = 0;
	leaveUnconscious = 1;
	punishment = 2;
	questPunishment = 3;
	skillCheck = 4;
}
---@enum kcd2def*enum-crime_secondArrestFeedbackResult
enum_crime_secondArrestFeedbackResult = {
	acceptPunishment = 1;
	none = 0;
	rejectPunishment = 2;
}
---@enum kcd2def*enum-crime_selfhelpChatResult
enum_crime_selfhelpChatResult = {
	accept = 0;
	evade = 2;
	reject = 1;
}
---@enum kcd2def*enum-crime_selfhelpParticipants
enum_crime_selfhelpParticipants = {
	meAndMates = 1;
	onlyMe = 0;
	unrelated = 2;
}
---@enum kcd2def*enum-crime_selfhelpResolutionKind
enum_crime_selfhelpResolutionKind = {
	fight = 0;
	leaveUnconscious = 1;
	pay = 2;
	payAllMoney = 3;
	punishment = 4;
	questPunishment = 5;
	report = 6;
	skillCheck = 7;
}
---@enum kcd2def*enum-crime_settlementLevel
enum_crime_settlementLevel = {
	city = 2;
	none = 0;
	settlement = 1;
}
---@enum kcd2def*enum-crime_soundReactionType
enum_crime_soundReactionType = {
	bark = 1;
	ignore = 2;
	react = 0;
}
---@enum kcd2def*enum-crime_source
enum_crime_source = {
	direct = 2;
	hearing = 1;
	indirect = 0;
	personal = 3;
}
---@enum kcd2def*enum-crime_startleSource
enum_crime_startleSource = {
	attack = 3;
	decoy = 2;
	interactor = 1;
	unknown = 0;
}
---@enum kcd2def*enum-crime_stimulusKind
enum_crime_stimulusKind = {
	aim = 1;
	alarm = 2;
	animalAbuse = 3;
	animalCorpse = 4;
	combat = 5;
	corpse = 6;
	corpseMissing = 8;
	corpseViolation = 7;
	criminal = 9;
	disturbance = 10;
	dramaticBark = 11;
	enemy = 12;
	escalatedTrespass = 13;
	foul = 14;
	friskRefusal = 16;
	friskable = 15;
	graveRobbing = 17;
	hit = 18;
	horseTheft = 19;
	information = 20;
	item = 21;
	kettlePoisoning = 22;
	lockpick = 23;
	lyingBody = 24;
	missingAnimal = 25;
	missingNpc = 26;
	murder = 27;
	nearTrespass = 28;
	nonAttributedCrime = 29;
	offence = 30;
	pickpocket = 31;
	pilloryBreak = 32;
	playerCompanion = 33;
	shooter = 34;
	sound = 35;
	suspiciousDoor = 36;
	takedown = 37;
	theft = 38;
	threat = 39;
	trespass = 40;
	unconsciousBody = 41;
	unknown = 0;
	unknownShooter = 42;
}
---@enum kcd2def*enum-crime_surrenderChatResult
enum_crime_surrenderChatResult = {
	accept = 1;
	refuse = 2;
	unknown = 0;
}
---@enum kcd2def*enum-crime_surrenderDialogResult
enum_crime_surrenderDialogResult = {
	fight = 2;
	peace = 1;
	unknown = 0;
}
---@enum kcd2def*enum-crime_surrenderStatement
enum_crime_surrenderStatement = {
	noInformation = 1;
	none = 0;
	rejected = 4;
	solvedByAuthority = 2;
	solvedBySelfhelper = 3;
}
---@enum kcd2def*enum-crime_theftMethod
enum_crime_theftMethod = {
	kettleEating = 4;
	loot = 1;
	lootCorpse = 2;
	lootUnconsciousBody = 3;
	pick = 5;
	pickpocket = 6;
	seenEquipped = 7;
	unknown = 0;
}
---@enum kcd2def*enum-crime_theftVolumeReactionKind
enum_crime_theftVolumeReactionKind = {
	attributed = 2;
	ignored = 0;
	immediate = 3;
	nonAttributed = 1;
}
---@enum kcd2def*enum-crime_theft_seenEquippedType
enum_crime_theft_seenEquippedType = {
	multipleOwners = 3;
	owner_multipleItems = 2;
	owner_singleArmor = 1;
	owner_singleWeapon = 0;
}
---@enum kcd2def*enum-crime_trespassInformationWuid
enum_crime_trespassInformationWuid = {
	home = 1;
	homeArea = 2;
	none = 0;
}
---@enum kcd2def*enum-crime_weaponCheckingMethod
enum_crime_weaponCheckingMethod = {
	graphSearch = 1;
	perceivableState = 0;
}
---@enum kcd2def*enum-customHaltingReason
enum_customHaltingReason = {
	none = 0;
}
---@enum kcd2def*enum-dialogPreset
enum_dialogPreset = {
	chat = 3;
	fader = 1;
	ignored = 0;
	ingame = 2;
}
---@enum kcd2def*enum-dialogResult
enum_dialogResult = {
	interruptedDialog = 4;
	invalidDialog = 3;
	refusedByReceiver = 2;
	success = 5;
	timeout = 1;
	undefined = 0;
}
---@enum kcd2def*enum-diceBadge
enum_diceBadge = {
	antibust = 4;
	doubleTake = 5;
	extraDice = 7;
	extraValue = 3;
	formations = 1;
	headStart = 0;
	invalidBadge = 11;
	multiplier = 6;
	null = 2;
	rerollDice = 8;
	rerollPips = 10;
	setDice = 9;
}
---@enum kcd2def*enum-diceEventType
enum_diceEventType = {
	cancelled = 2;
	['end'] = 1;
	highScore = 5;
	onTurnEnded = 0;
	readyToStart = 4;
	start = 3;
}
---@enum kcd2def*enum-diceGameTypes
enum_diceGameTypes = {
	beggar = 0;
	cardinal = 10;
	courtier = 9;
	craftsman = 5;
	emperor = 13;
	king = 12;
	knight = 8;
	lord = 11;
	miner = 3;
	noType = 14;
	novice = 4;
	peasant = 2;
	priest = 7;
	soldier = 6;
	wagoner = 1;
}
---@enum kcd2def*enum-diceTurnEndType
enum_diceTurnEndType = {
	bust = 2;
	careful = 1;
	gaveUp = 4;
	normal = 0;
	won = 3;
}
---@enum kcd2def*enum-dice_badgeEffects
enum_dice_badgeEffects = {
	antibust = 4;
	doubleTake = 5;
	extraDice = 7;
	extraValue = 3;
	formations = 0;
	headstart = 1;
	multiplier = 6;
	null = 2;
	rerollDice = 8;
	rerollPips = 10;
	setDice = 9;
}
---@enum kcd2def*enum-dice_badge_subtype
enum_dice_badge_subtype = {
	Antibust = 4;
	DoubleTake = 5;
	ExtraDice = 7;
	ExtraValue = 3;
	Formations = 1;
	Headstart = 0;
	Multiplier = 6;
	Null = 2;
	RerollDice = 8;
	RerollPips = 10;
	SetDice = 9;
}
---@enum kcd2def*enum-dice_badge_type
enum_dice_badge_type = {
	gold = 2;
	plumb = 0;
	silver = 1;
}
---@enum kcd2def*enum-dice_betType
enum_dice_betType = {
	mixed = 3;
	money = 1;
	none = 0;
	token = 2;
}
---@enum kcd2def*enum-dice_gamblerState
enum_dice_gamblerState = {
	arriving = 0;
	leaving = 5;
	playingAgainstNpc = 2;
	playingAgainstPlayer = 4;
	waitingForMinigame = 3;
	waitingForOpponent = 1;
}
---@enum kcd2def*enum-dice_gameLevel
enum_dice_gameLevel = {
	beggar = 0;
	cardinal = 10;
	courtier = 9;
	craftsman = 5;
	emperor = 13;
	farmer = 2;
	king = 12;
	knight = 8;
	lord = 11;
	miner = 3;
	novice = 4;
	priest = 7;
	soldier = 6;
	wagoner = 1;
}
---@enum kcd2def*enum-dice_initDialogResultType
enum_dice_initDialogResultType = {
	npcOutOfMoney = 1;
	startMinigame = 0;
}
---@enum kcd2def*enum-dice_kibitzMood
enum_dice_kibitzMood = {
	dissapointed = 1;
	extaticHappy = 5;
	facepalm = 2;
	leaving = 6;
	mildlyHappy = 4;
	neutral = 3;
	waiting = 0;
}
---@enum kcd2def*enum-dice_minigameEndReaction
enum_dice_minigameEndReaction = {
	negative = 2;
	neutral = 0;
	positive = 1;
}
---@enum kcd2def*enum-dice_minigameResult
enum_dice_minigameResult = {
	gameInterrupted = 3;
	playerLeft = 2;
	playerLost = 1;
	playerWon = 0;
}
---@enum kcd2def*enum-dice_npcSychronizationEvent
enum_dice_npcSychronizationEvent = {
	bust = 3;
	endGame = 4;
	pass = 2;
	score = 1;
	startGame = 0;
}
---@enum kcd2def*enum-dice_reasonToLeaveTable
enum_dice_reasonToLeaveTable = {
	kickedByPlayer = 2;
	lostAllMoney = 1;
	unspecified = 0;
}
---@enum kcd2def*enum-dice_tablePlayState
enum_dice_tablePlayState = {
	inactive = 0;
	minigameActive = 3;
	npcWaitingForOpponent = 1;
	twoNpcsPlay = 2;
}
---@enum kcd2def*enum-directions
enum_directions = {
	backward = 3;
	forward = 2;
	left = 0;
	right = 1;
}
---@enum kcd2def*enum-document_class
enum_document_class = {
	book = 1;
	letter = 5;
	map = 4;
	recipe = 2;
	skillBook = 3;
}
---@enum kcd2def*enum-dogBehavior
enum_dogBehavior = {
	campGuard = 1;
	event = 2;
	none = 0;
}
---@enum kcd2def*enum-dogCompanionMode
enum_dogCompanionMode = {
	aggressive = 3;
	ambush = 7;
	follow = 1;
	free = 2;
	guard = 6;
	hunt = 5;
	search = 4;
	wait = 0;
}
---@enum kcd2def*enum-dogCompanionPriority
enum_dogCompanionPriority = {
	attack = 6;
	bestFun = 3;
	doable = 2;
	duty = 4;
	executingOrder = 7;
	follow = 5;
	gettingOrder = 9;
	hit = 8;
	impossible = 0;
	lowest = 1;
	runAway = 10;
}
---@enum kcd2def*enum-dogObjective
enum_dogObjective = {
	alarm = 12;
	bark = 2;
	chase = 18;
	dig = 3;
	distract = 21;
	eat = 19;
	fail = 13;
	fetch = 9;
	follow = 4;
	followHeel = 5;
	followRider = 6;
	funMove = 15;
	funOnPoint = 17;
	funOnSo = 16;
	hunt = 10;
	invalid = 25;
	mark = 1;
	meleeCombat = 8;
	move = 14;
	pet = 22;
	runaway = 11;
	search = 7;
	searchItem = 23;
	shakeOut = 20;
	teleport = 24;
	wait = 0;
}
---@enum kcd2def*enum-dogObservableActivityType
enum_dogObservableActivityType = {
	counterSniffing = 2;
	forsaken = 1;
	none = 0;
}
---@enum kcd2def*enum-dogState
enum_dogState = {
	alive = 0;
	dead = 1;
	deadAndHiden = 2;
}
---@enum kcd2def*enum-dvojityAgent_jan_duringAmbush
enum_dvojityAgent_jan_duringAmbush = {
	Canceled = 7;
	Done = 6;
	HealedAfterAmbush = 5;
	HidingDuringFight = 1;
	LyingInTheWood = 4;
	None = 0;
	RunningAway = 2;
	Unconcious = 3;
}
---@enum kcd2def*enum-extraGuards_location
enum_extraGuards_location = {
	Unknown = 0;
	kh_DanemarkMlyn = 14;
	kh_HoranskoMines = 16;
	kh_KutnaHoraKupecka = 22;
	kh_MalesovStudFarm = 19;
	kh_PritokyHospoda = 13;
	kh_PritokyVillage = 20;
	kh_RabstejnskoLogging = 17;
	kh_RabstejnskoMlyn = 18;
	kh_RatborickoVillage = 21;
	kh_StaraKutnaHospoda = 15;
	kh_bohounoviceVillage = 30;
	kh_bylanskoVillage = 28;
	kh_horanskaVillage = 31;
	kh_lorecVineyard = 24;
	kh_miskovickoVillage = 27;
	kh_pachIndustryArea = 23;
	kh_staraKutnaVillage = 26;
	kh_suchdolVillage = 25;
	kh_vysokaVillage = 29;
	tr_ApolenaOvcak = 5;
	tr_NebakovMlyn = 10;
	tr_SeminVillage = 12;
	tr_SlatejovFarma = 1;
	tr_TachovVillage = 11;
	tr_Troskovice = 9;
	tr_VidlakFisherman = 8;
	tr_VidlakLovec = 6;
	tr_VidlakTanner = 7;
	tr_ZdarFarmaVychod = 3;
	tr_ZdarFarmaZapad = 2;
	tr_ZelejovHospoda = 4;
}
---@enum kcd2def*enum-extraGuards_operation
enum_extraGuards_operation = {
	Despawn = 1;
	Spawn = 0;
}
---@enum kcd2def*enum-extremeType
enum_extremeType = {
	max = 1;
	min = 0;
}
---@enum kcd2def*enum-fTIconType
enum_fTIconType = {
	couple = 3;
	group = 1;
	player = 0;
	woman = 2;
}
---@enum kcd2def*enum-fightclub_proposingFights
enum_fightclub_proposingFights = {
	Active_WaitingAndTurningTowardsPlayer = 3;
	Active_WavingAtPlayer = 2;
	Active_WavingAtPlayerWithForcedInRangeAlias = 1;
	Disabled = 0;
	Inactive_PlayerIsFarAway = 4;
}
---@enum kcd2def*enum-finale_lordsDialog
enum_finale_lordsDialog = {
	Approaching = 1;
	Bowing = 2;
	Done = 4;
	None = 0;
	Talking = 3;
}
---@enum kcd2def*enum-fistfights_proposingFistFightsState
enum_fistfights_proposingFistFightsState = {
	InRange = 0;
	OutOfRange = 1;
}
---@enum kcd2def*enum-food_subtype
enum_food_subtype = {
	aesopPotion = 10;
	antidotePotion = 23;
	apple = 0;
	aquaVitalisPotion = 12;
	artemisiaPotion = 22;
	bacon = 2;
	bardPotion = 21;
	beer = 7;
	bowmanBrewPotion = 27;
	chamomileDecoctionPotion = 18;
	dryable = 15;
	embrocationPotion = 16;
	hairODogPotion = 20;
	insomniaPotion = 19;
	liquor = 8;
	marigoldPotion = 24;
	nighthawkPotion = 4;
	padfootPotion = 26;
	painkillerPotion = 17;
	pear = 13;
	poison = 5;
	preserver = 9;
	raw = 6;
	staminaPotion = 25;
	vegetable = 14;
	water = 11;
	wine = 3;
}
---@enum kcd2def*enum-food_type
enum_food_type = {
	bowel = 5;
	dairy = 9;
	drink = 3;
	fruit = 0;
	meat = 2;
	mushroom = 7;
	pastry = 8;
	potion = 1;
	vegetable = 6;
}
---@enum kcd2def*enum-formationMode
enum_formationMode = {
	KeepDistance = 1;
	KeepShape = 3;
	MoveHistory = 2;
	Relaxed = 0;
}
---@enum kcd2def*enum-formationType
enum_formationType = {
	KeepDistance = 1;
	KeepShape = 3;
	MoveHistory = 2;
	Relaxed = 0;
}
---@enum kcd2def*enum-frontBack
enum_frontBack = {
	back = 1;
	front = 0;
}
---@enum kcd2def*enum-gameVersion
enum_gameVersion = {
	Invalid = '2.14748e+09';
	ver_01_00 = 10000;
	ver_01_01 = 10100;
	ver_01_01_01 = 10101;
}
---@enum kcd2def*enum-gender
enum_gender = {
	female = 2;
	male = 1;
	['not-defined'] = 0;
	unisex = 3;
}
---@enum kcd2def*enum-genericRandomEventType
enum_genericRandomEventType = {
	arrest = 1;
	combat = 3;
	enemy = 4;
	frisk = 0;
	selfHelp = 2;
}
---@enum kcd2def*enum-handType
enum_handType = {
	left = 1;
	right = 0;
}
---@enum kcd2def*enum-hideType
enum_hideType = {
	Any = 0;
	NPCLOD = 1;
	NPCVisibility = 2;
}
---@enum kcd2def*enum-hledaniLichtenstejna_kozina_ambushingSomeDrunk
enum_hledaniLichtenstejna_kozina_ambushingSomeDrunk = {
	AmbushingPlayer_ExpectedSide = 5;
	AmbushingPlayer_UnexpectedSide = 7;
	AmbushingUdo = 3;
	Canceled = 9;
	ConfrontingPlayer_ExpectedSide = 6;
	ConfrontingPlayer_UnexpectedSide = 8;
	ConfrontingUdo = 4;
	LyingInAmbush = 2;
	None = 0;
	PreparingForAmbush = 1;
}
---@enum kcd2def*enum-hledaniLichtenstejna_udo_goingToGetAmbushed
enum_hledaniLichtenstejna_udo_goingToGetAmbushed = {
	BeingConfronted = 2;
	Canceled = 4;
	GoingFromBaths = 1;
	GotToSafety = 3;
	None = 0;
}
---@enum kcd2def*enum-hledaniLichtenstejna_vsivaMari_warningKozina
enum_hledaniLichtenstejna_vsivaMari_warningKozina = {
	ConfrontedNearHideout = 4;
	Done = 6;
	GoingToWarn = 2;
	None = 0;
	Returning = 3;
	WaitingToGo = 1;
	YellingAtPlayer = 5;
}
---@enum kcd2def*enum-horseHandler_operation
enum_horseHandler_operation = {
	PlayerHorseAdded = 3;
	PlayerHorseRemoved = 4;
	ResetValidHorsesCount = 5;
	Unknown = 0;
	ValidHorseAdded = 1;
	ValidHorseRemoved = 2;
}
---@enum kcd2def*enum-hostageSituation
enum_hostageSituation = {
	HoldHostage_Calm = 2;
	HoldHostage_Tense = 1;
	HostageGetsHit_HostageDies_KidnapperToCombat = 9;
	KidnapperGetsHit_KidnapperDies_HostageToGround = 8;
	KidnapperGetsHit_KidnapperToCombat_HostageToGround = 7;
	KidnapperKillsHostage_KidnapperToCombat = 6;
	KidnapperKillsHostage_KidnapperToIdle = 5;
	KidnapperReleasesHostage_BothToIdle = 3;
	KidnapperReleasesHostage_HostageKillsKidnapper = 4;
	None = 0;
	SituationFinished = 10;
}
---@enum kcd2def*enum-hostageSituation_femaleHoldsFemale
enum_hostageSituation_femaleHoldsFemale = {
	HoldHostage = 1;
	KidnapperKillsHostage = 3;
	KidnapperReleasesHostage = 2;
	None = 0;
	SituationFinished = 4;
}
---@enum kcd2def*enum-hostageSituation_maleHoldsLooseFemale
enum_hostageSituation_maleHoldsLooseFemale = {
	HoldHostage = 1;
	HostageGetsHit_HostageDies_KidnapperToCombat = 9;
	HostageGetsHit_HostageToIdle_KidnapperToCombat = 8;
	KidnapperGetsHit_KidnapperDies_HostageToIdle = 7;
	KidnapperGetsHit_KidnapperToCombat_HostageToIdle = 6;
	KidnapperKillsHostage_KidnapperToCombat = 5;
	KidnapperKillsHostage_KidnapperToIdle = 4;
	KidnapperReleasesHostage_BothToIdle = 2;
	KidnapperReleasesHostage_KidnapperToCombat = 3;
	None = 0;
	SituationFinished = 10;
}
---@enum kcd2def*enum-hostageSituation_maleHoldsTiedFemale
enum_hostageSituation_maleHoldsTiedFemale = {
	HoldHostage_Calm = 2;
	HoldHostage_Tense = 1;
	HostageGetsHit_HostageDies_KidnapperToCombat = 6;
	KidnapperGetsHit_KidnapperDies_HostageToGround = 5;
	KidnapperKillsHostage_KidnapperToCombat = 4;
	KidnapperReleasesHostage_HostageKillsKidnapper = 3;
	None = 0;
	SituationFinished = 7;
}
---@enum kcd2def*enum-humanGender
enum_humanGender = {
	female = 2;
	male = 1;
	notDefined = 0;
}
---@enum kcd2def*enum-ingameDialogType
enum_ingameDialogType = {
	Bark = 1;
	Chat = 0;
}
---@enum kcd2def*enum-intellectHaltingReason
enum_intellectHaltingReason = {
	layerUnload = 1;
	none = 0;
}
---@enum kcd2def*enum-itemClassProperty
enum_itemClassProperty = {
	hasVisor = 4;
	isDivisible = 3;
	manipulationId = 2;
	price = 0;
	weight = 1;
}
---@enum kcd2def*enum-itemProperty
enum_itemProperty = {
	amount = 4;
	consumableBuff = 6;
	guid = 3;
	hasVisor = 11;
	health = 5;
	inHand = 7;
	inInventory = 9;
	isDivisible = 10;
	manipulationId = 8;
	owner = 2;
	price = 0;
	weight = 1;
}
---@enum kcd2def*enum-item_category
enum_item_category = {
	alchemy_base = 11;
	ammo = 3;
	armor = 4;
	consumable_item = 28;
	crafting_material = 9;
	dice_badge = 7;
	die = 15;
	divisible_item = 23;
	document = 8;
	equippable_item = 26;
	food = 5;
	helmet = 16;
	herb = 10;
	hood = 29;
	item = 21;
	key = 17;
	keyring = 18;
	melee_weapon = 1;
	misc = 0;
	missile_weapon = 2;
	money = 6;
	npc_tool = 12;
	ointment_item = 13;
	pickable_item = 22;
	player_item = 25;
	poison = 14;
	quick_slot_container = 19;
	weapon = 27;
	weapon_equip = 24;
}
---@enum kcd2def*enum-jizdniLukostrelba_spectatorsReactionType
enum_jizdniLukostrelba_spectatorsReactionType = {
	hattrick = 0;
	miss = 2;
	normalHit = 1;
}
---@enum kcd2def*enum-kettleFireState
enum_kettleFireState = {
	off = 1;
	on = 0;
}
---@enum kcd2def*enum-kettleState
enum_kettleState = {
	eaten = 1;
	empty = 3;
	full = 0;
	halfEmpty = 2;
}
---@enum kcd2def*enum-kettleType
enum_kettleType = {
	kettle = 0;
	wineBarrel = 1;
}
---@enum kcd2def*enum-kumaniNaTrosecku_pubFightEscalation
enum_kumaniNaTrosecku_pubFightEscalation = {
	BarkingFromTable = 1;
	BarkingNearPubExit = 4;
	ChasingOutCumans = 3;
	CumansLeaving = 2;
	Done = 5;
	None = 0;
}
---@enum kcd2def*enum-kzik_actionRequest
enum_kzik_actionRequest = {
	Escalate = 1;
	GivePlayerAccess = 2;
	MindPlayer = 0;
}
---@enum kcd2def*enum-kzik_gateGuardState
enum_kzik_gateGuardState = {
	Escalate = 1;
	MindPlayer = 2;
	SeePlayerApproaching = 0;
}
---@enum kcd2def*enum-ladderState
enum_ladderState = {
	unused = 0;
	usedForClimbDown = 2;
	usedForClimbUp = 1;
}
---@enum kcd2def*enum-lastHitAttackKind
enum_lastHitAttackKind = {
	dogBite = 5;
	melee = 4;
	missile = 1;
	none = 0;
	stealthAction = 2;
	unarmed = 3;
}
---@enum kcd2def*enum-linkOpHandleMode
enum_linkOpHandleMode = {
	error = 2;
	fail = 1;
	overwrite = 3;
	success = 0;
}
---@enum kcd2def*enum-lockManagerType
enum_lockManagerType = {
	Global = 0;
	Intellect = 2;
	Local = 1;
}
---@enum kcd2def*enum-lovVlku_behaviourType
enum_lovVlku_behaviourType = {
	Fight = 1;
	Flee = 2;
	Unknown = 0;
}
---@enum kcd2def*enum-measureMode
enum_measureMode = {
	threeDimensions = 1;
	twoDimensions = 0;
}
---@enum kcd2def*enum-minigameType
enum_minigameType = {
	alchemy = 3;
	battleArchery = 10;
	blacksmithing = 12;
	dice = 7;
	distract = 11;
	herbGathering = 4;
	holeDigging = 6;
	lockPicking = 5;
	pickpocketing = 8;
	reading = 2;
	sharpening = 1;
	stoneThrowing = 9;
	undefined = 0;
}
---@enum kcd2def*enum-misc_subtype
enum_misc_subtype = {
	clean_carryable_item = 1;
	loot = 2;
	spice = 3;
	trash_metal = 0;
}
---@enum kcd2def*enum-misc_type
enum_misc_type = {
	broken_ammo = 6;
	carryable_item = 3;
	common = 5;
	ear = 2;
	skin = 1;
	usable = 4;
}
---@enum kcd2def*enum-moneySliderSetupResult
enum_moneySliderSetupResult = {
	npcLimitFail = 3;
	parametersFail = 1;
	playerLimitFail = 2;
	success = 0;
}
---@enum kcd2def*enum-movementDoorClosingPolicy
enum_movementDoorClosingPolicy = {
	automatic = 0;
	leaveClosed = 1;
	leaveOpened = 2;
}
---@enum kcd2def*enum-movementSpeed
enum_movementSpeed = {
	alertedWalk = 2;
	dash = 11;
	fastRun = 4;
	moderateDash = 10;
	moderateSprint = 6;
	relaxedWalk = 0;
	run = 3;
	slowDash = 9;
	slowSprint = 5;
	slowestDash = 8;
	sprint = 7;
	walk = 1;
}
---@enum kcd2def*enum-movementTargetType
enum_movementTargetType = {
	path = 2;
	vec3 = 1;
	wuid = 0;
}
---@enum kcd2def*enum-movementType
enum_movementType = {
	FollowPlayer = 0;
	NoMovement = 2;
	TurnBody = 1;
}
---@enum kcd2def*enum-mucirna_prisonerHealthState
enum_mucirna_prisonerHealthState = {
	Alive = 0;
	Dead = 2;
	Dying = 1;
}
---@enum kcd2def*enum-nPCCombatHelperRequestResult
enum_nPCCombatHelperRequestResult = {
	combatCanceled = 3;
	combatEnded = 0;
	failedAddingToSkirmish = 2;
	nPCStateSearchFailed = 1;
}
---@enum kcd2def*enum-navmeshTracking
enum_navmeshTracking = {
	MNMPos = 1;
	NPCPos = 0;
}
---@enum kcd2def*enum-npc_tool_subtype
enum_npc_tool_subtype = {
	hammer = 0;
	pocketed = 2;
	spawned = 1;
}
---@enum kcd2def*enum-npc_tool_type
enum_npc_tool_type = {
	axe = 1;
	basket = 2;
	broom = 3;
	bucket = 4;
	cage_left = 5;
	cage_right = 6;
	chicken_tray = 10;
	cleaver = 21;
	default = 0;
	fishing_rod = 8;
	hammer = 7;
	hoe = 19;
	knife = 22;
	leather_scraper = 9;
	light = 26;
	meal_tray = 25;
	meat = 24;
	rasp = 16;
	rope = 20;
	sack = 11;
	semifinished_sword = 17;
	shovel = 12;
	stein = 13;
	tankard = 14;
	treasure_chest = 18;
	two_handed_knife = 23;
	washing_stick = 15;
}
---@enum kcd2def*enum-ointment_item_subtype
enum_ointment_item_subtype = {
	armor = 1;
	bow = 4;
	clothes = 2;
	gun = 7;
	perfumeLongWeak = 6;
	perfumeShortStrong = 5;
	shoes = 3;
	weapon = 0;
}
---@enum kcd2def*enum-ointment_item_type
enum_ointment_item_type = {
	bandage = 0;
	perfume = 2;
	repairkit = 1;
	soap = 3;
}
---@enum kcd2def*enum-openWorld_cooldownEventType
enum_openWorld_cooldownEventType = {
	commentCompanionDog = 8;
	commentCompanionHorse = 7;
	dialogPlayerGreeting = 0;
	playerCrimeReaction = 2;
	playerGreeting = 1;
	playerSoliloquy = 6;
	situation_npcGreeting = 3;
	situation_other = 4;
	soliloquy = 5;
}
---@enum kcd2def*enum-papezskyLegat_legateChase
enum_papezskyLegat_legateChase = {
	Chasing = 1;
	Dying = 2;
	Waiting = 0;
}
---@enum kcd2def*enum-papezskyLegat_rozaSecretTunnel
enum_papezskyLegat_rozaSecretTunnel = {
	BeCarriedFirstTime = 6;
	BeforeWaypoint = 2;
	Done = 10;
	Entrance = 1;
	None = 0;
	PostWater = 7;
	PreWater = 3;
	WaitingAtDoor = 8;
	WaitingAtWindow = 9;
	WaitingForDialog = 4;
	WaitingForUber = 5;
}
---@enum kcd2def*enum-party_dancingPlayerWithFemale_variant
enum_party_dancingPlayerWithFemale_variant = {
	variant_01 = 0;
	variant_02 = 1;
}
---@enum kcd2def*enum-pickpocketEvent
enum_pickpocketEvent = {
	failedPouch = 0;
	failedSatchel = 1;
	failedWithoutCrime = 3;
	success = 2;
}
---@enum kcd2def*enum-pickpocket_stage
enum_pickpocket_stage = {
	none = 0;
	onPlace = 1;
	ready = 2;
}
---@enum kcd2def*enum-playerAction_stanceObject_stance
enum_playerAction_stanceObject_stance = {
	lying = 1;
	sitting = 0;
}
---@enum kcd2def*enum-playerBedType
enum_playerBedType = {
	bench = 2;
	chair = 3;
	groundBed = 0;
	normalBed = 1;
}
---@enum kcd2def*enum-playerOnBedState
enum_playerOnBedState = {
	inTransition = 0;
	lying = 2;
	sitting = 1;
}
---@enum kcd2def*enum-playerSittingAction
enum_playerSittingAction = {
	endImmediately = 6;
	lyingToEnd = 3;
	lyingToSit = 2;
	prepareForSittingDialog = 4;
	prepareForStandingDialog = 5;
	sittingToEnd = 1;
	sittingToLay = 0;
	startToLay = 8;
	startToSit = 7;
}
---@enum kcd2def*enum-pogrom_dialogType
enum_pogrom_dialogType = {
	chat = 1;
	ingameDialog = 2;
	none = 0;
}
---@enum kcd2def*enum-pour_wine
enum_pour_wine = {
	None = 0;
	Red = 2;
	White = 1;
}
---@enum kcd2def*enum-prefab_phase_category
enum_prefab_phase_category = {
	_autotest_fireplace_burning = '2.14748e+09';
	bowls_pile = 2;
	bowls_pile_normal_goulash = 8;
	bowls_pile_normal_lentil = 9;
	bowls_pile_normal_soup = 10;
	bowls_pile_tin_goulash = 11;
	bowls_pile_tin_lentil = 12;
	bowls_pile_tin_soup = 13;
	fireplace_burning = 1;
	fireplace_burning_camp = 16;
	fireplace_cauldron_camp = 7;
	fireplace_cauldron_home = 6;
	fireplace_chimneySmoke = 3;
	fireplace_steam = 5;
	fireplace_windowSmoke = 15;
	torch = 4;
	torch_special = 14;
}
---@enum kcd2def*enum-prepadeni_ptacekInFormation
enum_prepadeni_ptacekInFormation = {
	Chat = 1;
	Complete = 3;
	None = 0;
	Polylog = 2;
}
---@enum kcd2def*enum-prepadeni_throughForrest
enum_prepadeni_throughForrest = {
	AroundBoulder = 3;
	AtEntranceToMaze = 10;
	AtTheEndOfMaze = 14;
	AtTheMazeGuarding = 11;
	BeforeEndOfMaze = 13;
	CrouchToTheFirstCrossroad = 2;
	Done = 17;
	None = 0;
	OverTheFallenTree = 6;
	Slide = 16;
	TemporaryPlace = 12;
	ThroughTheRockPath = 8;
	ToTheEndOfBoulders = 4;
	ToTheEndOfRoad = 15;
	ToTheFallenTree = 5;
	ToTheFirstCrossroad = 1;
	ToTheMaze = 9;
	ToTheRockPath = 7;
}
---@enum kcd2def*enum-prepareFood
enum_prepareFood = {
	cook = 0;
	dry = 2;
	smoke = 1;
}
---@enum kcd2def*enum-presentNotThere
enum_presentNotThere = {
	notThere = 1;
	present = 0;
}
---@enum kcd2def*enum-priorityManipulation
enum_priorityManipulation = {
	boostNothing = 3;
	boostPlayer = 2;
	boostRangedWeapon = 1;
	none = 0;
}
---@enum kcd2def*enum-questTourState
enum_questTourState = {
	move = 0;
	timeout = 2;
	wait = 1;
}
---@enum kcd2def*enum-relocationPolicy
enum_relocationPolicy = {
	DynamicRelocation = 1;
	KeepDistance = 3;
	KeepPosition = 0;
	RelaxedFollow = 2;
}
---@enum kcd2def*enum-roomRenting_accommodation
enum_roomRenting_accommodation = {
	infinite = 2;
	none = 0;
	oneNight = 1;
}
---@enum kcd2def*enum-roundOperation
enum_roundOperation = {
	down = 1;
	nearest = 0;
	up = 2;
}
---@enum kcd2def*enum-shockReaction
enum_shockReaction = {
	low = 0;
	medium = 1;
	pickpocket = 2;
}
---@enum kcd2def*enum-shootingContest_autotestHandler
enum_shootingContest_autotestHandler = {
	HasteActivated = 2;
	None = 0;
	WaitForSignal = 1;
}
---@enum kcd2def*enum-shootingContest_bark
enum_shootingContest_bark = {
	hitBad = 2;
	hitGood = 1;
	hitPerfect = 0;
	miss = 3;
	sameTarget = 4;
	winner = 5;
}
---@enum kcd2def*enum-shootingContest_difficulty
enum_shootingContest_difficulty = {
	Advanced = 2;
	Beginner = 1;
	Expert = 3;
	None = 0;
}
---@enum kcd2def*enum-shootingContest_progress
enum_shootingContest_progress = {
	Running = 1;
	Stopped = 0;
}
---@enum kcd2def*enum-shootingContest_result
enum_shootingContest_result = {
	FirstTime = 0;
	Lost = 2;
	WaitForResult = 3;
	Won = 1;
}
---@enum kcd2def*enum-shootingContest_situation
enum_shootingContest_situation = {
	disable = 0;
	enable = 1;
}
---@enum kcd2def*enum-shootingContest_type
enum_shootingContest_type = {
	Birds = 1;
	CircleTarget = 0;
}
---@enum kcd2def*enum-shootingContest_weapon
enum_shootingContest_weapon = {
	Bow = 0;
	Crossbow = 1;
	Rifle = 2;
}
---@enum kcd2def*enum-sittingBehindTableMood
enum_sittingBehindTableMood = {
	angry = 1;
	drunk = 2;
	injured = 3;
	judge = 4;
	nervous = 5;
	neutral = 0;
	pensive = 6;
	sad = 7;
}
---@enum kcd2def*enum-situation_beggarStyle
enum_situation_beggarStyle = {
	kneeling = 0;
	laying = 1;
}
---@enum kcd2def*enum-situation_gossipStanceType
enum_situation_gossipStanceType = {
	leaning = 3;
	sitting = 2;
	standing = 1;
	unknown = 0;
}
---@enum kcd2def*enum-situation_gossipState
enum_situation_gossipState = {
	exitGossipBehaviour = 5;
	none = 0;
	readyForDialog = 4;
	useBasicMovement = 1;
	useShapePositionMovement = 2;
	useTurn = 3;
}
---@enum kcd2def*enum-skirmishDecisionReason
enum_skirmishDecisionReason = {
	hit = 1;
	perception = 0;
}
---@enum kcd2def*enum-skirmishRelationOverride
enum_skirmishRelationOverride = {
	hostile = 1;
	none = 0;
}
---@enum kcd2def*enum-smartBehaviorState
enum_smartBehaviorState = {
	disabled = 2;
	enabled = 0;
	noRequests = 1;
	requestsByHolders = 3;
}
---@enum kcd2def*enum-soul_ability
enum_soul_ability = {
	AimToMaim = 75;
	Alarm = 58;
	Archer = 86;
	ArmOfBeowulf = 72;
	Attack = 57;
	Bacchus = 23;
	Bark = 68;
	BatteringRam = 21;
	BeerBibber = 27;
	BlacksmithingMaster = 65;
	Blacksmithsson = 55;
	Bonebreaker = 78;
	Bumper = 7;
	BundleAlchemist = 30;
	CauseAlwaysHeavyBleeding = 85;
	CauseMoralHitOnCollision = 89;
	ChainStrikeHeavyWeapon = 74;
	ChainStrikePolearm = 43;
	ChainStrikeSword = 51;
	ChainStrikeUnarmed = 11;
	CleanCut = 82;
	CleanlinessIsNextToGodliness = 71;
	Comrade = 10;
	CripplingHit = 76;
	CripplingHit_ = 91;
	CuttingEdge = 81;
	DisarmStrike = 17;
	Distract = 59;
	Dodge = 0;
	DownToSize = 93;
	EasyWayOut = 12;
	Empathic = 48;
	EutuBrutus = 36;
	ExperimentalPowder = 92;
	Finticka = 3;
	FirstAid = 47;
	ForbiddenWeapon = 90;
	GreenKnight = 83;
	HardenedSteel = 87;
	Harvester = 38;
	HeavyTip = 50;
	HorrendousWounds = 40;
	HorsePullDown = 6;
	HumanDustbin = 31;
	Hunt = 60;
	HuntAttack = 45;
	HuntingPermit = 56;
	Inconspicuous = 69;
	LetEmCome = 8;
	Letailleur = 53;
	LiquorAntidote = 34;
	LiquorBibber = 28;
	LooseTongue = 29;
	Looter = 98;
	LuckyFind = 24;
	MasterStrike = 73;
	MasterStrikeUnarmed = 9;
	Masterchef = 95;
	MercyKill = 46;
	MischiefArtist = 97;
	NoHangoverWhenSleeping = 94;
	OneShotAtGlory = 99;
	OneWayOrTheOther = 39;
	OpeningStrike = 79;
	OpeningStrike_ = 80;
	Padding = 54;
	Painkiller = 84;
	PerfectBlock = 1;
	RazorSharp = 67;
	Reading_ArtAdmirer = 15;
	Reading_AvidReader = 16;
	Reading_Wanderer = 37;
	Riposte = 2;
	SaltAndSmoke = 33;
	Salty = 42;
	Salva = 77;
	Search = 61;
	SecretOfSecrets = 63;
	Serration = 49;
	SevenLeague = 52;
	SevenLeague_ = 88;
	SkillcheckDifficulty = 25;
	SmartBootstraping = 66;
	SteakTartare = 18;
	StealthKill = 5;
	StealthKnockOut = 4;
	StrangeMan = 96;
	Taunt = 44;
	ThiefSight = 64;
	TormentingStrike = 41;
	Totentanz = 70;
	TrialAndError = 19;
	TwoHanded = 62;
	Undercut = 13;
	Undercut_ = 14;
	WineBibber = 26;
}
---@enum kcd2def*enum-sound
enum_sound = {
	alarm = 19;
	arrow_hit = 15;
	bio_drunkeness = 12;
	bio_exhaustion = 11;
	bio_hunger = 10;
	bow_fired = 13;
	bullet_hit = 16;
	combat = 1;
	combatScript = 6;
	decoy_distract = 8;
	dog_attack_command = 23;
	dog_bark = 22;
	dog_distract = 24;
	door = 7;
	dramatic_bark = 18;
	gun_fired = 14;
	hunting_alarm = 21;
	invalid = 0;
	lockpick = 2;
	lure_distract = 26;
	movement = 3;
	perfume = 28;
	photo_mode = 27;
	sharpener = 4;
	smell = 9;
	speech = 17;
	startled_critter = 20;
	thrash = 25;
	whistle = 5;
}
---@enum kcd2def*enum-speech_ingameDialogPoseTransition_type
enum_speech_ingameDialogPoseTransition_type = {
	intoDialogPose = 0;
	outOfDialogPose = 1;
}
---@enum kcd2def*enum-speech_ingameDialogType
enum_speech_ingameDialogType = {
	Bark = 2;
	Chat = 1;
	Ingame = 0;
}
---@enum kcd2def*enum-stanceCategory
enum_stanceCategory = {
	cart = 7;
	crouch = 6;
	horse = 5;
	kneel = 4;
	lying = 2;
	sitting = 3;
	standing = 1;
	undefined = 0;
}
---@enum kcd2def*enum-stateMachineStates
enum_stateMachineStates = {
	Any = 0;
	InteractiveGround = 1;
	ItemInteraction = 2;
	OnBed = 3;
}
---@enum kcd2def*enum-stealthTakedown_stage
enum_stealthTakedown_stage = {
	firstTakedown = 0;
	none = 3;
	repeatTakedown = 2;
	secondTakedown = 1;
}
---@enum kcd2def*enum-stealthTakedown_treeState
enum_stealthTakedown_treeState = {
	ChatAndTurn = 1;
	MoveToPoint = 0;
	ReadyForTakedown = 2;
}
---@enum kcd2def*enum-surfaceTest
enum_surfaceTest = {
	eatSpot = 0;
	sleepSpot = 1;
}
---@enum kcd2def*enum-sweetSpotLockPolicy
enum_sweetSpotLockPolicy = {
	locked = 0;
	semiLocked = 2;
	unlocked = 1;
}
---@enum kcd2def*enum-switch_genericAwareness
enum_switch_genericAwareness = {
	npcGreeted = 0;
}
---@enum kcd2def*enum-switch_hotEntityReason
enum_switch_hotEntityReason = {
	assaultAnimal = 15;
	check = 1;
	dogWhistle = 12;
	lookAround = 2;
	missingAnimal = 3;
	missingCorpse = 4;
	missingNpc = 5;
	murder = 19;
	murderAnimal = 16;
	nearTrespass = 7;
	poaching = 17;
	shooter = 10;
	sound = 11;
	stolenCorpse = 8;
	suspiciousDoor = 6;
	theft = 14;
	unconsciousBody = 18;
	unknown = 0;
	unknownShooter = 13;
	weaponSound = 9;
}
---@enum kcd2def*enum-switch_interruptInitiator
enum_switch_interruptInitiator = {
	concept = 1;
	scheduler = 2;
	switch = 3;
	unknown = 0;
}
---@enum kcd2def*enum-switch_recognitionState
enum_switch_recognitionState = {
	state_0 = 0;
	state_I = 1;
	state_II = 2;
	state_III = 3;
}
---@enum kcd2def*enum-switch_unconsciousBodyState
enum_switch_unconsciousBodyState = {
	discovered = 1;
	undiscovered = 0;
}
---@enum kcd2def*enum-test_zachrana_synchroWalk
enum_test_zachrana_synchroWalk = {
	Fail = 3;
	None = 0;
	Start = 1;
	Success = 2;
}
---@enum kcd2def*enum-timerType
enum_timerType = {
	gameTime = 1;
	worldTime = 0;
}
---@enum kcd2def*enum-tour_dialogType
enum_tour_dialogType = {
	bark = 1;
	chat = 0;
	ingameDialog = 2;
	none = 3;
}
---@enum kcd2def*enum-tour_followType
enum_tour_followType = {
	followableNpcCenter = 1;
	followableNpcLeft = 2;
	followableNpcRight = 3;
	none = 0;
}
---@enum kcd2def*enum-tour_forceLookEnabled
enum_tour_forceLookEnabled = {
	always = 0;
	inDestination = 1;
	never = 2;
}
---@enum kcd2def*enum-tour_handContentElementMode
enum_tour_handContentElementMode = {
	all = 0;
	leader = 1;
	none = 2;
}
---@enum kcd2def*enum-tour_handType
enum_tour_handType = {
	both = 2;
	left = 1;
	none = 3;
	right = 0;
}
---@enum kcd2def*enum-tour_nextPhaseTrigger
enum_tour_nextPhaseTrigger = {
	both = 0;
	dialogFinished = 2;
	none = 3;
	tagpointReached = 1;
}
---@enum kcd2def*enum-tour_onPlayerLeft_dialogProgression
enum_tour_onPlayerLeft_dialogProgression = {
	startDialog = 2;
	waitForPlayerSkipDialog = 0;
	waitForPlayerStopDialog = 1;
}
---@enum kcd2def*enum-tour_onPlayerLeft_wait
enum_tour_onPlayerLeft_wait = {
	afterPlayerGetsClose = 1;
	always = 0;
	never = 2;
}
---@enum kcd2def*enum-tour_onPlayerLeft_waitMode
enum_tour_onPlayerLeft_waitMode = {
	everybodyTurnsOnPlayer = 1;
	leaderTurnsOnPlayer = 0;
}
---@enum kcd2def*enum-tour_tourProgress
enum_tour_tourProgress = {
	none = 0;
	progress = 1;
	stop = 2;
}
---@enum kcd2def*enum-tour_weaponSet
enum_tour_weaponSet = {
	none = 3;
	oversized = 0;
	primary = 1;
	secondary = 2;
}
---@enum kcd2def*enum-tournamentCrowdSpotType
enum_tournamentCrowdSpotType = {
	leaning = 1;
	standing = 0;
}
---@enum kcd2def*enum-trespassLevel
enum_trespassLevel = {
	personal = 3;
	prohibited = 4;
	public = 0;
	semipersonal = 2;
	semipublic = 1;
}
---@enum kcd2def*enum-trigonometryOperation
enum_trigonometryOperation = {
	acos = 4;
	asin = 3;
	atan = 5;
	cos = 1;
	sin = 0;
	tan = 2;
}
---@enum kcd2def*enum-urgency
enum_urgency = {
	default = 0;
	fast = 2;
	instant = 3;
	slow = 1;
}
---@enum kcd2def*enum-weaponChange
enum_weaponChange = {
	melee = 1;
	missile = 2;
	none = 0;
	oversized = 3;
	unarmed = 4;
}
---@enum kcd2def*enum-weaponSelection_mainHand
enum_weaponSelection_mainHand = {
	any_meleeWeapon = 1;
	specifiedByItemClassId = 0;
	type_axe = 4;
	type_bow = 9;
	type_crossbowHeavy = 12;
	type_crossbowLight = 10;
	type_crossbowMedium = 11;
	type_flail = 7;
	type_huntingSword = 14;
	type_longSword = 5;
	type_mace = 6;
	type_polearm = 8;
	type_rifle = 13;
	type_sabre = 3;
	type_sword = 2;
	type_swordOrLongSword = 15;
}
---@enum kcd2def*enum-weaponSelection_offHand
enum_weaponSelection_offHand = {
	anything = 0;
	emptyHand = 1;
	specifiedByItemClassId = 2;
	type_shield = 3;
}
---@enum kcd2def*enum-weaponSet
enum_weaponSet = {
	oversized = 2;
	primary = 0;
	secondary = 1;
}
---@enum kcd2def*enum-weaponType
enum_weaponType = {
	Any = 0;
	None = 1;
}
---@enum kcd2def*enum-weapon_class
enum_weapon_class = {
	axe = 3;
	bow = 9;
	crossbow_heavy = 15;
	crossbow_light = 10;
	crossbow_medium = 14;
	dagger = 0;
	flail = 6;
	halberd = 7;
	hunting_sword = 16;
	longsword = 4;
	mace = 5;
	rifle = 13;
	sabre = 2;
	shield = 8;
	shield_broken = 17;
	sword = 1;
	torch = 11;
	unarmed = 12;
	undefined = '2.14748e+09';
}
---@enum kcd2def*enum-wildDogBehavior
enum_wildDogBehavior = {
	eat = 3;
	fight = 2;
	goToFinalPosition = 1;
	normal = 0;
}
---@enum kcd2def*enum-wildDogQuestBehavior
enum_wildDogQuestBehavior = {
	fight = 1;
	go = 0;
	huntSheep = 3;
	lookingFor = 2;
}
---@enum kcd2def*enum-zaby_cooking
enum_zaby_cooking = {
	Carrying = 4;
	Cooking = 2;
	Done = 7;
	FoodDespawnDelay = 6;
	FoodWaitingForAlsik = 5;
	Goto = 1;
	None = 0;
	PickingUp = 3;
}
---@enum kcd2def*enum-zaby_eating
enum_zaby_eating = {
	Done = 4;
	Eat = 1;
	None = 0;
	Transition = 2;
	Vomit = 3;
}
---@enum kcd2def*enum-zachranaPtacka_prisonersMovementMode
enum_zachranaPtacka_prisonersMovementMode = {
	Run = 1;
	Sneak = 0;
	Wait = 2;
}
---@enum kcd2def*enum-zachranaPtacka_prisonersWaitingAnimation
enum_zachranaPtacka_prisonersWaitingAnimation = {
	Crouch = 1;
	Kneel = 0;
	WaitingNervous = 2;
}
---@enum kcd2def*enum-zachranaPtacka_prisonersWithdrawnItemMode
enum_zachranaPtacka_prisonersWithdrawnItemMode = {
	Done = 3;
	None = 0;
	TorchBeforeMovement = 1;
	Weapon = 2;
}
---@enum kcd2def*enum-zakopanyZitrek_hankaProgress
enum_zakopanyZitrek_hankaProgress = {
	BothDead = 3;
	CrisisAverted = 5;
	NobodyDead = 1;
	None = 0;
	TimeLimitExpired = 4;
	VendulaDead = 2;
}
---@enum kcd2def*enum-zakopanyZitrek_killingSvatavaProgress
enum_zakopanyZitrek_killingSvatavaProgress = {
	Attacking = 1;
	Talking = 0;
}
---@enum kcd2def*enum-zbranePanaSemina_TalkInTroskovice
enum_zbranePanaSemina_TalkInTroskovice = {
	BehaviorStarted = 2;
	Done = 4;
	None = 0;
	TrackingDistance = 1;
	TurnToHenry = 3;
}
---@enum kcd2def*enum-zbranePanaSemina_crossroadSearchPhases
enum_zbranePanaSemina_crossroadSearchPhases = {
	Done = 7;
	Finding = 5;
	None = 0;
	Reporting = 6;
	Searching1 = 1;
	Searching2 = 2;
	Searching3 = 3;
	Searching4 = 4;
}
---@enum kcd2def*enum-zoufalaObranaZaBohutu_prazanSituation
enum_zoufalaObranaZaBohutu_prazanSituation = {
	ClimbingLadder = 1;
	Done = 3;
	JumpingFromLadder = 2;
	None = 0;
	PrazanDied = 4;
}


