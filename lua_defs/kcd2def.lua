---@meta kcd2def

---@class kcd2def*Vector
---@field public x number
---@field public y number
---@field public z number

---@class kdc2def*Actor.PhysicalStats
---@field public mass number

---@class kcd2def*Actor
---@field public GetWorldPos fun(self:kcd2def*Actor): kcd2def*Vector
---@field public GetWorldDir fun(self:kcd2def*Actor): kcd2def*Vector
---@field public AwakePhysics fun(self:kcd2def*Actor, unk_1:1|number): nil
---@field public AddImpulse fun(self:kcd2def*Actor, unk_1:-1|number, unk_position:kcd2def*Vector, unk_up:kcd2def*Vector, unk_acceleration:number): nil
---@field public GetPhysicalStats fun(self:kcd2def*Actor): kdc2def*Actor.PhysicalStats

---@class kcd2def*Actor-player:kcd2def*Actor

---@class kcd2def*Database.TableInfo
---@field public lineCount integer

---@class kcd2def*Database.TableLine:table

---@class kcd2def*Database.TableLine-quest:kcd2def*Database.TableLine
---@field public quest_id ...
---@field public quest_name string

---@class kcd2def*Database.TableLine-quest_objective:kcd2def*Database.TableLine
---@field public quest_id ...
---@field public objective_id ...
---@field public objective_name string

---@type kcd2def*Actor-player
player = ...

---@type fun(tableName:string): kcd2def*Database.TableInfo
Database.GetTableInfo = function(...) end

---@type fun(tableName:string, lineIndex:integer): kcd2def*Database.TableLine?
Database.GetTableLine = function(...) end

