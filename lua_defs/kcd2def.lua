---@meta kcd2def

--- definition file containing LuaCATS annotations for the lua state (except builtins) after all typical packages of Kingdom Come Deliverance II have loaded
--- if a parameter is annotated starting with 'unk_', the purpose or type of that parameter is merely being guessed


---@module "kcd2def-builtin"
---@module "kcd2def-magic"
---@module "kcd2def-enums"


---@alias kcd2def*unknown_function fun(...): ... this function has not been investigated yet
---@alias kcd2def*luaindex integer array index from 1 to length inclusive (position)
---@alias kcd2def*cppindex integer array index from 0 to length - 1 (offset)
---@alias kcd2def*luakey boolean|string|number|integer|function|table|thread|userdata|lightuserdata any valid table key (so anything not nil)



--- Generics (these definitions can be buggy)

--- credit: Minerofmillions
---@generic K: kcd2def*luakey
---@generic V: kcd2def*luakey
---@alias kcd2def*DatabaseUtils.RemapColumns fun(columns: {[K]: V[]}, indexColumn: K): {[V]: {[K]: V}}
---@alias kcd2def*DatabaseUtils.RemapSingleColumn fun(columns: {[K]: V[]}, indexColumn: K): {[V]: V}


--- Common Structures (no metatable, but common fields)


---@class kdc2def*Actor.PhysicalStats
---@field public mass number

---@class kcd2def*Database.TableInfo
---@field public ColumnCount integer
---@field public LineCount integer

---@class kcd2def*Database.TableLine
---@class kcd2def*Database.TableColumn

---@class kdc2def*Database.TableColumnInfo
---@field public Name string

---@class kdc2def*Database.TableColumnData

---@class kcd2def*Vector
---@field public x number
---@field public y number
---@field public z number


--- Actual Classes (structure of something with a metatable or is a global metatable)


---@class kcd2def*Actor
---@field public AwakePhysics fun(self: kcd2def*Actor, unk_1: 1|number): nil
---@field public AddImpulse fun(self: kcd2def*Actor, unk_1: -1|number, unk_position: kcd2def*Vector, unk_up: kcd2def*Vector, unk_acceleration: number): nil
---@field public GetPhysicalStats fun(self:kcd2def*Actor): kdc2def*Actor.PhysicalStats
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
---@field public GetColumnInfo fun(tableName: string, columnIndex: integer): kdc2def*Database.TableColumnInfo?
---
---@nodiscard
---@field public GetTableColumnData fun(tableName: string, columns: string[]): {string : kdc2def*Database.TableColumnData}?
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


--- Global Annotations



---@type kcd2def*Database
Database = ...

---@type kcd2def*DatabaseUtils
DatabaseUtils = ...


---@type kcd2def*unknown_function
_IAction = ...
---@type kcd2def*unknown_function
_IActionMap = ...
---@type kcd2def*unknown_function
_IClass = ...
---@type kcd2def*unknown_function
_IDisabledBarkMetarole = ...
---@type kcd2def*unknown_function
_IEnabled = ...
---@type kcd2def*unknown_function
_IFunc = ...
---@type kcd2def*unknown_function
_IHint = ...
---@type kcd2def*unknown_function
_IInteraction = ...
---@type kcd2def*unknown_function
_IReason = ...
---@type kcd2def*unknown_function
_IType = ...
---@type kcd2def*unknown_function
_IUiOrder = ...
---@type kcd2def*unknown_function
_IUiVisible = ...

_dataMetaTable = {
    ---@type kcd2def*unknown_function
	__index = ...;
    ---@type kcd2def*unknown_function
	__newindex = ...;
}

---@type kcd2def*unknown_function
expr = ...

---@type kcd2def*unknown_function
forwardTime = ...

---@type kcd2def*unknown_function
gcinfo = ...

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

---@type kcd2def*unknown_function
newproxy = ...

q = {
    ---@type kcd2def*unknown_function
	ci = ...;
    ---@type kcd2def*unknown_function
	dd = ...;
    ---@type kcd2def*unknown_function
	en = ...;
    ---@type kcd2def*unknown_function
	nen = ...;
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