---@meta kcd2def

--- definition file containing LuaCATS annotations for the lua state after all typical packages of Kingdom Come Deliverance II have loaded
--- if a parameter is annotated starting with 'unk_', the purpose or type of that parameter is merely being guessed


--- Common Structures (no metatable, but common fields)


---@class kcd2def*Vector
---@field public x number
---@field public y number
---@field public z number

---@class kdc2def*Actor.PhysicalStats
---@field public mass number

---@class kcd2def*Database.TableInfo
---@field public LineCount integer

---@class kcd2def*Database.TableLine: table


--- Actual Classes (have a metatable)


---@class kcd2def*Actor
---@field public GetWorldPos fun(self: kcd2def*Actor): kcd2def*Vector
---@field public GetWorldDir fun(self: kcd2def*Actor): kcd2def*Vector
---@field public AwakePhysics fun(self: kcd2def*Actor, unk_1: 1|number): nil
---@field public AddImpulse fun(self: kcd2def*Actor, unk_1: -1|number, unk_position: kcd2def*Vector, unk_up: kcd2def*Vector, unk_acceleration: number): nil
---@field public GetPhysicalStats fun(self:kcd2def*Actor): kdc2def*Actor.PhysicalStats


--- Type Coercions (must use ---@type at consumer)


---@class kcd2def*Database.TableLine-quest:kcd2def*Database.TableLine
---@field public quest_id ...
---@field public quest_name string

---@class kcd2def*Database.TableLine-quest_objective:kcd2def*Database.TableLine
---@field public quest_id ...
---@field public objective_id ...
---@field public objective_name string


--- Singleton Types (mainly for the fields of nested global tables)


---@class kcd2def*Actor-player:kcd2def*Actor

---@class kcd2def*Database
---@field public GetTableInfo fun(tableName: string): kcd2def*Database.TableInfo
---@field public GetTableLine fun(tableName: string, lineIndex: integer): kcd2def*Database.TableLine?


--- Global Annotations

---@type kcd2def*Actor-player
player = ...

---@type kcd2def*Database
Database = ...

