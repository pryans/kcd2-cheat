---@meta kcd2def

--- definition file containing LuaCATS annotations for the lua state (except builtins) after all typical packages of Kingdom Come Deliverance II have loaded
--- if a parameter is annotated starting with 'unk_', the purpose or type of that parameter is merely being guessed


---@module "kcd2def-builtin"
---@module "kcd2def-magic"
---@module "kcd2def-enums"


---@alias kcd2def*unknown_function (fun(...): ...)? this function has not been investigated yet (pair with '---@deprecated' or 'private' to generate warning)
---@alias kcd2def*luaindex integer array index from 1 to length inclusive (position)
---@alias kcd2def*cppindex integer array index from 0 to length - 1 (offset)
---@alias kcd2def*flatvalue boolean|string|number|integer|function|thread|lightuserdata
---@alias kcd2def*tablelike table|userdata
---@alias kcd2def*luakey kcd2def*flatvalue|kcd2def*tablelike any valid table key (so anything not nil)
---@alias kcd2def*package.loader fun(modulename: string): chunk_or_errmsg: function|string

--- Generics (these definitions can be buggy)

--- credit: Minerofmillions
---@generic K: kcd2def*luakey
---@generic V: kcd2def*luakey
---@alias kcd2def*DatabaseUtils.RemapColumns fun(columns: {[K]: V[]}, indexColumn: K): {[V]: {[K]: V}}
---@alias kcd2def*DatabaseUtils.RemapSingleColumn fun(columns: {[K]: V[]}, indexColumn: K): {[V]: V}

---@generic O: any
---@generic K: any
---@generic V: any
---@alias kcd2def*iterator<O,K,V> fun(obj: O?, key: K?): K?, V?


--- Common Structures (no metatable, but common fields)


---@class kcd2def*Actor.PhysicalStats
---@field public mass number

---@class kcd2def*AnimDoor.FlowEvents.Input
---@field private [01] kcd2def*unknown_function
---@field public [02] 'bool'

---@class kcd2def*Database.TableInfo
---@field public ColumnCount integer
---@field public LineCount integer

---@class kcd2def*Database.TableLine
---@class kcd2def*Database.TableColumn

---@class kcd2def*Database.TableColumnInfo
---@field public Name string

---@class kcd2def*Database.TableColumnData

---@class kcd2def*Vector
---@field public x number
---@field public y number
---@field public z number


--- Actual Classes (structure of something with a metatable or is a global metatable)


---@class kcd2def*Actor
---@field public AwakePhysics fun(self: kcd2def*Actor, unk_1: 1|number): nil
---@field public AddImpulse fun(self: kcd2def*Actor, unk_1: -1|number, unk_position: kcd2def*Vector, unk_up: kcd2def*Vector, unk_acceleration: number): nil
---@field public GetPhysicalStats fun(self:kcd2def*Actor): kcd2def*Actor.PhysicalStats
---@field public GetWorldDir fun(self: kcd2def*Actor): kcd2def*Vector
---@field public GetWorldPos fun(self: kcd2def*Actor): kcd2def*Vector


--- Type Coercions (must use ---@type at consumer)




--- Singleton Types (mainly for the fields of nested global tables)


---@class kcd2def*Actor-player:kcd2def*Actor

---@class kcd2def*AnimDoor.Client
---@field private OnLevelLoaded kcd2def*unknown_function

---@class kcd2def*AnimDoor.Editor
---@field public Icon 'Door.bmp'
---@field public ShowBounds 1

---@class kcd2def*AnimDoor.FlowEvents.Inputs: {[string]: kcd2def*AnimDoor.FlowEvents.Input}
---@field public Close kcd2def*AnimDoor.FlowEvents.Input
---@field public Hide kcd2def*AnimDoor.FlowEvents.Input
---@field public Lock kcd2def*AnimDoor.FlowEvents.Input
---@field public Open kcd2def*AnimDoor.FlowEvents.Input
---@field public UnHide kcd2def*AnimDoor.FlowEvents.Input
---@field public Unlock kcd2def*AnimDoor.FlowEvents.Input

---@class kcd2def*AnimDoor.FlowEvents.Outputs
---@field public Close 'bool'
---@field public Hide 'bool'
---@field public Lock 'bool'
---@field public Open 'bool'
---@field public UnHide 'bool'
---@field public Unlock 'bool'

---@class kcd2def*AnimDoor.FlowEvents
---@field public Inputs kcd2def*AnimDoor.FlowEvents.Inputs
---@field public Outputs kcd2def*AnimDoor.FlowEvents.Outputs

---@class kcd2def*AnimDoor.Properties.Animation
---@field public anim_Close 'Close'
---@field public anim_Open 'Open'

---@class kcd2def*AnimDoor.Properties.Lock
---@field public bCanLockPick true
---@field public bCanUnlockWithDynamicKey true
---@field public bDoLockOnMissingHomeArea true
---@field public bLockDifficultyOverride false
---@field public bLockInside false
---@field public bLockOutside false
---@field public bLockReversed false
---@field public bLocked false
---@field public bNeverLockByPassingNPC true
---@field public bSendMessage false
---@field public esLockFanciness 'Common'
---@field public esLockTypes 'none/none'
---@field public fKeepUnlockedFrom number 7.5
---@field public fKeepUnlockedTo number 19.5
---@field public fLockDifficulty number 0.5
---@field public guidItemClassId ''

---@class kcd2def*AnimDoor.Properties.Physics
---@field public Density -1
---@field public Mass -1
---@field public bPhysicalize true
---@field public bPushableByPlayers false
---@field public bRigidBody false

---@class kcd2def*AnimDoor.Properties.Sounds
---@field public snd_Close 'Sounds/environment:doors:door_wood_1_close'
---@field public snd_Open 'Sounds/environment:doors:door_wood_1_open'

---@class kcd2def*AnimDoor.Properties
---@field public Animation kcd2def*AnimDoor.Properties.Animation
---@field public Lock kcd2def*AnimDoor.Properties.Lock
---@field public Physics kcd2def*AnimDoor.Properties.Physics
---@field public Sounds kcd2def*AnimDoor.Properties.Sounds
---@field public bActivatePortal false
---@field public bExported_to_game true
---@field public bExported_to_test true
---@field public bInteractiveCollisionClass true
---@field public bNoFriendlyFire false
---@field public bSaved_by_game true
---@field public esDoorAnimSet ''
---@field public esNavCompoment 'Door'
---@field public fUseDistance number 2.5
---@field public guidSmartObjectType ''
---@field public object_Model ''
---@field public sWH_AI_EntityCategory 'Door'
---@field public soclass_SmartObjectHelpers ''
---@field public soclasses_SmartObjectClass ''

---@class kcd2def*AnimDoor.Server	
---@field private OnUpdate kcd2def*unknown_function

---@class kcd2def*AnimDoor
---@field private BuildNPCAnimationName kcd2def*unknown_function
---@field private BuildObjectAnimationName kcd2def*unknown_function
---@field public Client kcd2def*AnimDoor.Client
---@field private Close kcd2def*unknown_function
---@field private DespawnSuspiciousVolume kcd2def*unknown_function
---@field private DisableLockpick kcd2def*unknown_function
---@field private DoLockOnMissingHomeArea kcd2def*unknown_function
---@field private DoPlayAnimation kcd2def*unknown_function
---@field private DoPlaySound kcd2def*unknown_function
---@field private DoStopSound kcd2def*unknown_function
---@field private DumpState kcd2def*unknown_function
---@field public Editor kcd2def*AnimDoor.Editor
---@field private EnableLockpick kcd2def*unknown_function
---@field private Event_Close kcd2def*unknown_function
---@field private Event_Hide kcd2def*unknown_function
---@field private Event_Lock kcd2def*unknown_function
---@field private Event_Open kcd2def*unknown_function
---@field private Event_UnHide kcd2def*unknown_function
---@field private Event_Unlock kcd2def*unknown_function
---@field public FlowEvents kcd2def*AnimDoor.FlowEvents
---@field private GenerateLockDifficulty kcd2def*unknown_function
---@field private GetActions kcd2def*unknown_function
---@field private GetLockDifficulty kcd2def*unknown_function
---@field private GetSuspiciousVolume kcd2def*unknown_function
---@field private IsAccessedFromFront kcd2def*unknown_function
---@field private IsInUse kcd2def*unknown_function
---@field private IsInteractive kcd2def*unknown_function
---@field private IsLocked kcd2def*unknown_function
---@field private IsOnKeySide kcd2def*unknown_function
---@field private IsOpen kcd2def*unknown_function
---@field private IsRightDoor kcd2def*unknown_function
---@field private IsUsable kcd2def*unknown_function
---@field private IsUsableMsgChanged kcd2def*unknown_function
---@field private Lock kcd2def*unknown_function
---@field public LockType 'door'
---@field private Lockpick kcd2def*unknown_function
---@field private NeedSerialize kcd2def*unknown_function
---@field private OnEnablePhysics kcd2def*unknown_function
---@field private OnLoad kcd2def*unknown_function
---@field private OnPropertyChange kcd2def*unknown_function
---@field private OnReset kcd2def*unknown_function
---@field private OnSave kcd2def*unknown_function
---@field private OnSpawn kcd2def*unknown_function
---@field private OnUsed kcd2def*unknown_function
---@field private Open kcd2def*unknown_function
---@field private PhysicalizeThis kcd2def*unknown_function
---@field private ProduceAiSound kcd2def*unknown_function
---@field public Properties kcd2def*AnimDoor.Properties
---@field private Reset kcd2def*unknown_function
---@field public Server kcd2def*AnimDoor.Server	
---@field private SetInteractiveCollisionType kcd2def*unknown_function
---@field private SetLockedDueToPrivate kcd2def*unknown_function
---@field private SetPhysicalFlags kcd2def*unknown_function
---@field private SetShouldBeLockedOverride kcd2def*unknown_function
---@field private SetUnlockedDueExpected kcd2def*unknown_function
---@field private ShouldBeLocked kcd2def*unknown_function
---@field private SpawnSuspiciousVolume kcd2def*unknown_function
---@field private Unlock kcd2def*unknown_function
---@field public bLocked false
---@field public bNeedUpdate 0
---@field public bNoAnims 0
---@field public bUseSameAnim 0
---@field public bUseableMsgChanged 0
---@field public lastAnim ''
---@field public nDirection -1
---@field public nSoundId 0
---@field public nUpdateAfterLoad 0
---@field public nUserId 0


---@class kcd2def*Database
---
---@nodiscard
---@field public GetColumnInfo fun(tableName: string, columnIndex: integer): kcd2def*Database.TableColumnInfo?
---
---@nodiscard
---@field public GetTableColumnData fun(tableName: string, columns: string[]): {string : kcd2def*Database.TableColumnData}?
---
---@nodiscard
---@field public GetTableInfo fun(tableName: string): kcd2def*Database.TableInfo?
---
---@nodiscard
---@field public GetTableLine fun(tableName: string, lineIndex: kcd2def*cppindex): kcd2def*Database.TableLine?
---
---@field public LoadTable fun(tableName): boolean

---@class kcd2def*DatabaseUtils
---@source Data/Scripts/Utils/DatabaseUtils.lua:4
---@nodiscard
---@field public LoadTable fun(tableName: string): kcd2def*Database.TableLine[]
---@source Data/Scripts/Utils/DatabaseUtils.lua:37
---@nodiscard
---@field public LoadTableColumn fun(tableName: string, column: string): kcd2def*Database.TableColumn
---@source Data/Scripts/Utils/DatabaseUtils.lua:84
---@nodiscard
---@field public LoadTableColumnWithIndex fun(tableName: string, primaryColumn: string, secondaryColumn: string): kcd2def*Database.TableColumn
---@source Data/Scripts/Utils/DatabaseUtils.lua:18
---@nodiscard
---@field public LoadTableColumns fun(tableName: string, columns: string[]): {[string]: kcd2def*Database.TableColumn}
---@source Data/Scripts/Utils/DatabaseUtils.lua:78
---@nodiscard
---@field public LoadTableColumnsWithIndex fun(tableName: string, primaryColumn: string, columns: string[]): {[string]: kcd2def*Database.TableColumn}
---@source Data/Scripts/Utils/DatabaseUtils.lua:42
---@nodiscard
---@field public RemapColumns kcd2def*DatabaseUtils.RemapColumns
---@source Data/Scripts/Utils/DatabaseUtils.lua:62
---@nodiscard
---@field public RemapSingleColumn kcd2def*DatabaseUtils.RemapSingleColumn

---@class kcd2def*BasicAIActions
---@field private ActorCanTalk kcd2def*unknown_function
---@field private AddLootAction kcd2def*unknown_function
---@field private ForceUsable kcd2def*unknown_function
---@field private GetActions kcd2def*unknown_function
---@field private GetCanTalkHintType kcd2def*unknown_function
---@field private GetChatActions kcd2def*unknown_function
---@field private OnChat kcd2def*unknown_function
---@field private OnChatOpen kcd2def*unknown_function
---@field private OnChatRequestAccepted kcd2def*unknown_function
---@field private OnChatWithFocus kcd2def*unknown_function
---@field private OnFollow kcd2def*unknown_function
---@field private OnGrabCorpse kcd2def*unknown_function
---@field private OnHorsePullDown kcd2def*unknown_function
---@field private OnKnockout kcd2def*unknown_function
---@field private OnLoot kcd2def*unknown_function
---@field private OnMercyKill kcd2def*unknown_function
---@field private OnPickpocketing kcd2def*unknown_function
---@field private OnStealthKill kcd2def*unknown_function
---@field private OnTalk kcd2def*unknown_function

---@class kcd2def*Calendar
---@field private GetGameTime kcd2def*unknown_function
---@field private GetWorldDay kcd2def*unknown_function
---@field private GetWorldDayOfWeek kcd2def*unknown_function
---@field private GetWorldHourOfDay kcd2def*unknown_function
---@field private GetWorldTime kcd2def*unknown_function
---@field private GetWorldTimeRatio kcd2def*unknown_function
---@field private IsFakedTimeOfDay kcd2def*unknown_function
---@field private IsNightTimeOfDay kcd2def*unknown_function
---@field private IsWorldTimePaused kcd2def*unknown_function
---@field private SetFakeTimeOfDay kcd2def*unknown_function
---@field private SetWorldTime kcd2def*unknown_function
---@field private SetWorldTimeRatio kcd2def*unknown_function
---@field private UnfakeTimeOfDay kcd2def*unknown_function

---@class kcd2def*EntityModule
---@field private AnimCharCopyVisual kcd2def*unknown_function
---@field private CanUseInventory kcd2def*unknown_function
---@field private GetEntityScriptMisc kcd2def*unknown_function
---@field private GetInventoryOwner kcd2def*unknown_function
---@field private GetSlotItemClassId kcd2def*unknown_function
---@field private IsInventoryReadOnly kcd2def*unknown_function
---@field private MakeParticleEffectActive kcd2def*unknown_function
---@field private MakeParticleEffectIdle kcd2def*unknown_function
---@field private SequenceEntitiesCopyVisual kcd2def*unknown_function
---@field private WillSleepingOnThisBedSave kcd2def*unknown_function

---@class kcd2def*EnvironmentModule
---@field private BlendTimeOfDay kcd2def*unknown_function
---@field private CoverHole kcd2def*unknown_function
---@field private ForceImmediateWeatherUpdate kcd2def*unknown_function
---@field private GetRainIntensity kcd2def*unknown_function
---@field private MakeHole kcd2def*unknown_function
---@field private RebuildClouds kcd2def*unknown_function

---@class kcd2def*Game
---@field private AddSaveLock kcd2def*unknown_function
---@field private AllowTutorials kcd2def*unknown_function
---@field private BlockTutorials kcd2def*unknown_function
---@field private CacheResource kcd2def*unknown_function
---@field private CreatePrefab kcd2def*unknown_function
---@field private DeletePrefab kcd2def*unknown_function
---@field private HideCurrentTutorial kcd2def*unknown_function
---@field private HideInfoText kcd2def*unknown_function
---@field private HidePrefab kcd2def*unknown_function
---@field private HideTutorial kcd2def*unknown_function
---@field private InventoryModeOnlyCodex kcd2def*unknown_function
---@field private IsDemo kcd2def*unknown_function
---@field public IsLoadingEngineSaveGame fun(): boolean
---@field private IsPlayer kcd2def*unknown_function
---@field private KeybindsRebindInput kcd2def*unknown_function
---@field private LogGameEvent kcd2def*unknown_function
---@field private MovePrefab kcd2def*unknown_function
---@field private QuickLoad kcd2def*unknown_function
---@field private QuickSave kcd2def*unknown_function
---@field public RemoveSaveLock fun(lockName: string?): nil
---@field private ResetEntity kcd2def*unknown_function
---@field private ResetTutorial kcd2def*unknown_function
---@field public SaveGameViaResting fun(): nil
---@field private SendInfoText kcd2def*unknown_function
---@field private SetPrefabPhase kcd2def*unknown_function
---@field private SetPrefabPhaseById kcd2def*unknown_function
---@field private ShadowplayStartStop kcd2def*unknown_function
---@field private ShowItemsTransfer kcd2def*unknown_function
---@field private ShowNotification kcd2def*unknown_function
---@field private ShowOverlayTutorial kcd2def*unknown_function
---@field private ShowStatCheckResult kcd2def*unknown_function
---@field private ShowTutorial kcd2def*unknown_function
---@field private SpawnPrefab kcd2def*unknown_function

---@class kcd2def*Horsetraders
---@field private RemoveHaggleMetarole kcd2def*unknown_function
---@field private SetupHaggle kcd2def*unknown_function

---@class kcd2def*ItemManager
---@field private AddOnEquipBuff kcd2def*unknown_function
---@field private GetItem kcd2def*unknown_function
---@field private GetItemName kcd2def*unknown_function
---@field private GetItemOwner kcd2def*unknown_function
---@field private GetItemUIName kcd2def*unknown_function
---@field private IsItemOversized kcd2def*unknown_function
---@field private RemoveItem kcd2def*unknown_function

---@class kcd2def*Minigame
---@field private CanStartReadingMinigame kcd2def*unknown_function
---@field private CanUseMinigame kcd2def*unknown_function
---@field private GetBookStudyProgress kcd2def*unknown_function
---@field private StartDice kcd2def*unknown_function
---@field private StartDiceByName kcd2def*unknown_function
---@field private StartDiceWithScore kcd2def*unknown_function
---@field private StartHerbGathering kcd2def*unknown_function
---@field private StartHoleDigging kcd2def*unknown_function
---@field private StartLockPicking kcd2def*unknown_function
---@field private WasBookOpened kcd2def*unknown_function

---@class kcd2def*Physics
---@field private RayTraceCheck kcd2def*unknown_function
---@field private RayWorldIntersection kcd2def*unknown_function
---@field private RegisterExplosionCrack kcd2def*unknown_function
---@field private RegisterExplosionShape kcd2def*unknown_function
---@field private SamplePhysEnvironment kcd2def*unknown_function
---@field private SimulateExplosion kcd2def*unknown_function

---@class kcd2def*RPG
---@field private AddLocationPoint kcd2def*unknown_function
---@field private AddStatXP kcd2def*unknown_function
---@field private CaptionObjectUsed kcd2def*unknown_function
---@field private GetFactionById kcd2def*unknown_function
---@field private GetFactions kcd2def*unknown_function
---@field private GetIndulgencePrice kcd2def*unknown_function
---@field private GetLocationById kcd2def*unknown_function
---@field private GetLocationByName kcd2def*unknown_function
---@field private GetLocations kcd2def*unknown_function
---@field private IsPublicEnemy kcd2def*unknown_function
---@field private NotifyLevelXpGain kcd2def*unknown_function
---@field private ReconcileWithPublicFriends kcd2def*unknown_function
---@field private _GetConstant kcd2def*unknown_function

---@class kcd2def*VectorUtils
---@field private Copy kcd2def*unknown_function
---@field private CrossProduct kcd2def*unknown_function
---@field private Distance kcd2def*unknown_function
---@field private DistanceSquared kcd2def*unknown_function
---@field private DistanceSquared2D kcd2def*unknown_function
---@field private DotProduct kcd2def*unknown_function
---@field private DotProduct2D kcd2def*unknown_function
---@field private GetAngleBetween kcd2def*unknown_function
---@field private GetAngleBetween2D kcd2def*unknown_function
---@field private GetDirection kcd2def*unknown_function
---@field private IsZero kcd2def*unknown_function
---@field private Length kcd2def*unknown_function
---@field private LengthSquared kcd2def*unknown_function
---@field private Lerp kcd2def*unknown_function
---@field private LogVector kcd2def*unknown_function
---@field private Negate kcd2def*unknown_function
---@field private Normalize kcd2def*unknown_function
---@field private Product kcd2def*unknown_function
---@field private Rotate2D kcd2def*unknown_function
---@field private Rotate90AroundZ kcd2def*unknown_function
---@field private RotateAround kcd2def*unknown_function
---@field private RotateMinus90AroundZ kcd2def*unknown_function
---@field private Scale kcd2def*unknown_function
---@field private Subtract kcd2def*unknown_function
---@field private Sum kcd2def*unknown_function
---@field private ToString kcd2def*unknown_function

---@class kcd2def*XGenAIModule
---@field private AddLink kcd2def*unknown_function
---@field private AddRecordedIntellectForFaderProfiling kcd2def*unknown_function
---@field private DespawnPerceptibleVolume kcd2def*unknown_function
---@field private FindLinks kcd2def*unknown_function
---@field private GetBrainVariable kcd2def*unknown_function
---@field private GetEntityByWUID kcd2def*unknown_function
---@field private GetEntityIdByWUID kcd2def*unknown_function
---@field private GetMyWUID kcd2def*unknown_function
---@field private GetOwner kcd2def*unknown_function
---@field private GetWuidDebugString kcd2def*unknown_function
---@field private HasClothingLink kcd2def*unknown_function
---@field private IgnorePerception kcd2def*unknown_function
---@field private IsOneshotAvailable kcd2def*unknown_function
---@field private IsOneshotBlocked kcd2def*unknown_function
---@field private IsPointInAreaWithLabel kcd2def*unknown_function
---@field private IsPointInAreaWithLabelWUID kcd2def*unknown_function
---@field private IsStanceAvailable kcd2def*unknown_function
---@field private IsStanceBlocked kcd2def*unknown_function
---@field private IsUnstanceAvailable kcd2def*unknown_function
---@field private IsUnstanceBlocked kcd2def*unknown_function
---@field private LootEnd kcd2def*unknown_function
---@field private LootInventoryBegin kcd2def*unknown_function
---@field private MakeTableFromType kcd2def*unknown_function
---@field private OnDestroy kcd2def*unknown_function
---@field private OnPropertyChange kcd2def*unknown_function
---@field private OnSpawn kcd2def*unknown_function
---@field private OnStart kcd2def*unknown_function
---@field private PlaceToSlotFromInventory kcd2def*unknown_function
---@field private ProduceSound kcd2def*unknown_function
---@field private ProduceSoundWUID kcd2def*unknown_function
---@field private SendMessageToEntity kcd2def*unknown_function
---@field private SendMessageToEntityArray kcd2def*unknown_function
---@field private SendMessageToEntityData kcd2def*unknown_function
---@field private SetBrainVariable kcd2def*unknown_function
---@field private SetPlayerDogMode kcd2def*unknown_function
---@field private SpawnPerceptibleVolume kcd2def*unknown_function
---@field private SpawnPerceptibleVolumeOnWUID kcd2def*unknown_function
---@field private _GetDataVariable kcd2def*unknown_function
---@field private _SetDataVariable kcd2def*unknown_function



--- Global Annotations

---@type kcd2def*AnimDoor
AnimDoor = ...

---@type kcd2def*BasicAIActions
BasicAIActions = ...

---@type kcd2def*Calendar
Calendar = ...

---@type kcd2def*Database
Database = ...

---@type kcd2def*DatabaseUtils
DatabaseUtils = ...

---@type kcd2def*EntityModule
EntityModule = ...

---@type kcd2def*EnvironmentModule
EnvironmentModule = ...

---@type kcd2def*Game
Game = ...

---@type kcd2def*Horsetraders
Horsetraders = ...

---@type kcd2def*ItemManager
ItemManager = ...

---@type kcd2def*Minigame
Minigame = ...

---@type kcd2def*Physics
Physics = ...

---@type kcd2def*RPG
RPG = ...

SocialClass = {
	---@deprecated
	---@type kcd2def*unknown_function
	GetEntitySocialClassData = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	GetSocialClassData = ...;
	data = {
		apothecary = {
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 5;
			wealthyCustomer = true;
		};
		armorer = {
			crimePunishmentMultiplier = 1.5;
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 4;
			wealthyCustomer = true;
		};
		bailiff = {
			crimePunishmentMultiplier = 5;
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 5;
			wealthyCustomer = true;
		};
		baker = {
			dirtMultiplier = 0.3;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		bandit = {
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		bartender = {
			dirtMultiplier = 0.3;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		bathhouseAbbess = {
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		bathhouseMaid = {
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		beggar = {
			persuadeToTalkWithLowReputationPriceMultiplier = 0.5;
		};
		blacksmith = {
			crimePunishmentMultiplier = 1.5;
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
			wealthyCustomer = true;
		};
		blacksmithApprentice = {
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		butcher = {
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		circator = {
			crimePunishmentMultiplier = 2;
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 5;
		};
		collier = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		craftsman = {
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		cuman = {
			isCuman = true;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		fake_soldier = {
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		fightClubFighter = {
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		fortuneTeller = {
			dirtMultiplier = 0.3;
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		herbalist = {
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		innkeeper = {
			dirtMultiplier = 0.3;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		lumberjack = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		mason = {
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		mercenary = {
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		merchant = {
			crimePunishmentMultiplier = 1.5;
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
			wealthyCustomer = true;
		};
		miller = {
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		miner = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		monk = {
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		nobleman = {
			crimePunishmentMultiplier = 12.5;
			dirtMultiplier = 0;
			greetMeWithWave = false;
			lunchInPub = false;
			persuadeToTalkWithLowReputationPriceMultiplier = 10;
			wealthyCustomer = true;
		};
		officer = {
			crimePunishmentMultiplier = 2.5;
			dirtMultiplier = 0;
			lunchInPub = false;
			persuadeToTalkWithLowReputationPriceMultiplier = 6;
			suppressWatchCorpse = true;
			wealthyCustomer = true;
		};
		poacher = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		priest = {
			crimePunishmentMultiplier = 1.5;
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 5;
		};
		quarryman = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		refugee = {
			persuadeToTalkWithLowReputationPriceMultiplier = 0.5;
		};
		renegade = {
			neverAcceptsSurrender = true;
		};
		ruffian = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		scribe = {
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 4;
			wealthyCustomer = true;
		};
		security = {
			dirtMultiplier = 0.5;
			neverAcceptsSurrender = true;
			persuadeToTalkWithLowReputationPriceMultiplier = 5;
		};
		shoemaker = {
			dirtMultiplier = 0.3;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		shootmaster = {
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		soldier = {
			crimePunishmentMultiplier = 2.5;
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		tailor = {
			dirtMultiplier = 0.3;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		tanner = {
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 2;
		};
		townsman = {
			dirtMultiplier = 0;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		villager = {
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		wanderer = {
			persuadeToTalkWithLowReputationPriceMultiplier = 1;
		};
		watchman = {
			crimePunishmentMultiplier = 2.5;
			dirtMultiplier = 0.5;
			persuadeToTalkWithLowReputationPriceMultiplier = 3;
		};
		weaponsmith = {
			crimePunishmentMultiplier = 1.5;
			dirtMultiplier = 0.7;
			persuadeToTalkWithLowReputationPriceMultiplier = 4;
			wealthyCustomer = true;
		};
	};
	defaultValues = {
		crimePunishmentMultiplier = 1;
		dealsWithStolenItems = false;
		diceMaximumBet = 1000;
		diceMinimumBet = 10;
		dirtMultiplier = 1;
		greetMeWithWave = true;
		isCuman = false;
		lunchInPub = true;
		neverAcceptsSurrender = false;
		persuadeToTalkWithLowReputationPriceMultiplier = 1;
		suppressWatchCorpse = false;
		wealthyCustomer = false;
	};
};

---@type kcd2def*VectorUtils
VectorUtils = ...

---@type kcd2def*XGenAIModule
XGenAIModule = ...

---@deprecated
---@type kcd2def*unknown_function
_IAction = ...

---@deprecated
---@type kcd2def*unknown_function
_IActionMap = ...

---@deprecated
---@type kcd2def*unknown_function
_IClass = ...

---@deprecated
---@type kcd2def*unknown_function
_IDisabledBarkMetarole = ...

---@deprecated
---@type kcd2def*unknown_function
_IEnabled = ...

---@deprecated
---@type kcd2def*unknown_function
_IFunc = ...

---@deprecated
---@type kcd2def*unknown_function
_IHint = ...

---@deprecated
---@type kcd2def*unknown_function
_IInteraction = ...

---@deprecated
---@type kcd2def*unknown_function
_IReason = ...

---@deprecated
---@type kcd2def*unknown_function
_IType = ...

---@deprecated
---@type kcd2def*unknown_function
_IUiOrder = ...

---@deprecated
---@type kcd2def*unknown_function
_IUiVisible = ...

_dataMetaTable = {
	---@deprecated
    ---@type kcd2def*unknown_function
	__index = ...;
	---@deprecated
    ---@type kcd2def*unknown_function
	__newindex = ...;
}

---@deprecated
---@type kcd2def*unknown_function
expr = ...

---@deprecated
---@type kcd2def*unknown_function
forwardTime = ...

---@deprecated
---@type kcd2def*unknown_function
gcinfo = ...

---@deprecated
---@type kcd2def*unknown_function
imod = ...

json = {
	_version = '0.1.1';
    ---@type kcd2def*unknown_function
	decode = ...;
    ---@type kcd2def*unknown_function
	encode = ...;
}

---@type kcd2def*Actor-player
player = ...

---@deprecated
---@type kcd2def*unknown_function
newproxy = ...

q = {
	---@deprecated
    ---@type kcd2def*unknown_function
	ci = ...;
	---@deprecated
    ---@type kcd2def*unknown_function
	dd = ...;
	---@deprecated
    ---@type kcd2def*unknown_function
	en = ...;
	---@deprecated
    ---@type kcd2def*unknown_function
	nen = ...;
	---@deprecated
    ---@type kcd2def*unknown_function
	sm = ...;
	utils = {
        ---@type kcd2def*unknown_function
		parseEntityParam = ...
	};
};

---@type kcd2def*unknown_function
rd = ...

---@type kcd2def*unknown_function
rp = ...