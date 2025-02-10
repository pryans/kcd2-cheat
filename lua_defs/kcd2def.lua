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


---@class kcd2def*Database.TableLine-quest: kcd2def*Database.TableLine
---@field public quest_id ...
---@field public quest_name string

---@class kcd2def*Database.TableLine-quest_objective: kcd2def*Database.TableLine
---@field public quest_id ...
---@field public objective_id ...
---@field public objective_name string


--- Singleton Types (mainly for the fields of nested global tables)


---@class kcd2def*Actor-player:kcd2def*Actor

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

---@source Data/Scripts/Utils/DatabaseUtils.lua:1
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


--- Global Annotations



---@type kcd2def*Database
Database = ...

---@type kcd2def*DatabaseUtils
DatabaseUtils = ...

---@type kcd2def*Game
Game = ...

---@type kcd2def*RPG
RPG = ...

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