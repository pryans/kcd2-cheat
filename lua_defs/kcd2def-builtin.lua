---@meta kcd2def-builtin

--- this file contains the altered and unaltered (listed for convenience) lua 5.1 builtins

--- Altered Builtins


math = {
	---@nodiscard
	---@type fun(n: number, min: number, max: number): number
	Clamp = ...;
	---@nodiscard
	---@type fun(m: number, n: number, k: number): number
	Lerp = ...;
	---@nodiscard
	---@type fun(m: number, o: number, x:number): number
	PseudoGaussPDF = ...;
	---@nodiscard
	---@type fun(a: number, b: number): number
	RandomFloat = ...;
	---@nodiscard
	---@type fun(num: number, index: number?): number
	Round = ...;
	---@nodiscard
	---@type fun(n: number): 0|1|-1
	Sign = ...;
	---@nodiscard
	---@type fun(m: number, o: number, s:number, x:number): number
	SkewedPseudoGauss = ...;
	---@nodiscard
	---@type fun(a: number): number
	Sqr = ...;
	abs = math.abs;
	acos = math.acos;
	asin = math.asin;
	atan = math.atan;
	atan2 = math.atan2;
	ceil = math.ceil;
	cos = math.cos;
	cosh = math.cosh;
	deg = math.deg;
	exp = math.exp;
	floor = math.floor;
	fmod = math.fmod;
	frexp = math.frexp;
	huge = math.huge;
	ldexp = math.ldexp;
	log = math.log;
	log10 = math.log10;
	max = math.max;
	min = math.min;
	mod = math.mod;
	modf = math.modf;
	pi = math.pi;
	pow = math.pow;
	rad = math.rad;
	random = math.random;
	randomseed = math.randomseed;
	sin = math.sin;
	sinh = math.sinh;
	sqrt = math.sqrt;
	tan = math.tan;
	tanh = math.tanh;
}

os = { -- reduced functions available
	clock = os.clock;
	time = os.time;
}

string = {
	---@nodiscard
	---@type fun(s: string): string
	CapitaliseFirst = ...;
	---@nodiscard
	---@type fun(s: string, delim: string): string[]
	Explode = ...;
	---@nodiscard
	---@type fun(str: string?): boolean
	IsEmpty = ...;
	---@nodiscard
	---@type fun(str: string, delimiter: string?, omitEmpty: boolean?): string[]
	Split = ...;
	---@nodiscard
	---@type fun(s: string, start: string): boolean
	StartsWith = ...;
	---@nodiscard
	---@type fun(s: string): string
	Trim = ...;
	byte = string.byte;
	char = string.char;
	dump = string.dump;
	find = string.find;
	format = string.format;
	---@nodiscard
	---@type fun(text: string, pattern: string): kcd2def*iterator<string,string,nil>
	gfind = ...;
	gmatch = string.gmatch;
	gsub = string.gsub;
	len = string.len;
	lower = string.lower;
	match = string.match;
	rep = string.rep;
	reverse = string.reverse;
	sub = string.sub;
	upper = string.upper;
}

table = {
	---@generic V: any
	---@type fun(t1: V[], t2: V[])
	Append = ...;
	---@generic V: any
	---@type fun(t1: {[kcd2def*cppindex]:V}, t2: {[kcd2def*cppindex]:V}?)
	ArrayShiftOne = ...;
	---@generic V: any
	---@type fun(t1: V[], t2: V[]?)
	ArrayShiftZero = ...;
	--- Returns a boolean value based on whether
	-- the provided table contains the provided value.
	---@generic V: any
	---@nodiscard
	---@type fun(t: {[kcd2def*luakey]: V}, val: V): boolean
	Contains = ...;
	---@nodiscard
	---@type fun(t: {[kcd2def*luakey]: string}, val: string): boolean
	ContainsIgnoreCase = ...;
	---@nodiscard
	---@type fun(_tbl: kcd2def*tablelike?): integer
	Count = ...;
	---@generic V: any
	---@nodiscard
	---@type fun(t: {[kcd2def*luakey]: V}, pred: fun(v: V): boolean?): integer
	CountWithPredicate = ...;
	--- Creates a deep copy of a table. Handles recursive tables.
	---@generic V: any
	---@nodiscard
	---@type fun(obj: V): V
	DeepCopy = ...;
	--- Find a value in a table. Returns its index if found and nil if not.
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@nodiscard
	---@type fun(t: {[K]: V}, val: V): K?
	Find = ...;
	--- Given a simple indexed array of objects (tables with string keys) the function creates an indexing table;
	-- returns table which contains keys for every value of indexKey among the original objects,
	-- the value of these keys is a simple indexed array of all objects, that have according indexKey value
	-- (e.g. for input array { {ik="A", val="a1"}, {ik="B", val="b1"}, {ik="B", val="b2"} }
	-- and indexKey parameter "ik" returns { A = { {ik="A", val="a1"} }, B = { {ik="B", val="b1"}, {ik="B", val="b2"} } })
	---@generic K: kcd2def*luakey
	---@generic V: kcd2def*luakey
	---@nodiscard
	---@type fun(array:{[K]: V}, indexKey: K): {[V]: {[K]: V}}
	IndexArrayOfObjects = ...;
	---@nodiscard
	---@type fun(t: table): boolean
	IsEmpty = ...;
	--- Returns an index on which the provided value is stored in the provided table.
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@nodiscard
	---@type fun(t: {[K]: V}, val: V): K?
	Lookup = ...;
	---@deprecated
	---@type fun(typeName: string, override: kcd2def*tablelike?)
	MakeFromType = ...;
	--- Merges tables from varargs (starting from the second) to the first table without overwriting fields.
	-- Example: table.Merge(A, B, C) = table.Merge(table.Merge(A, B), C)
	-- Handles recursive tables
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@type fun(target: {[K]: V}, ...: {[K]: V}): {[K]: V}
	Merge = ...;
	--- Returns the first element in a sequence, and removes it from the sequence.
	---@generic V: any
	---@type fun(t: V[]): V
	PopFirst = ...;
	--- Returns the last element in a sequence, and removes it from the sequence.
	---@generic V: any
	---@type fun(t: V[]): V
	PopLast = ...;
	--- Reindex first level Lua Table (indexed from 1) to Modular Behavior Tree array (indexed from 0)
	-- No need to make this recursice since MBT does not support 2d arrays
	---@generic V: any
	---@type fun(array: V[]): {[kcd2def*cppindex]: V}
	ReindexTableToMBT = ...;
	--- Removes a value contained in the table.
	---@generic V: any
	---@type fun(t: {[kcd2def*luakey]:V}, val: V): nil
	RemoveValue = ...;
	--- Removes all the values in the table that meet the provided predicate.
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@type fun(t: {[K]:V}, pred: fun(v: V): boolean?): nil
	RemoveWithPredicate = ...;
	---@generic V: any
	---@nodiscard
	---@type fun(k: integer, list: V[]): V[]
	ReservoirSample = ...;
	--- Picks random element from list, considering only valid elements.
	-- Valid are those elements, for which callback(element,callbackParams) is not false
	---@generic V: any
	---@generic P: any
	---@nodiscard
	---@type fun(list: V[], callback: fun(element: V, callbackParams: P): boolean?, callbackParams: P): V?
	RollingSample = ...;
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@nodiscard
	---@type fun(table: {[K]:V}, name: K): V?
	SafeGet = ...;
	--- Returns a table which contains exactly those key-value pairs present
	-- in the provided table where the value meets the provided predicate.
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@nodiscard
	---@type fun(t: {[K]:V}, pred: (fun(V): boolean?)): {[K]:V}
	Select = ...;
	--- Returns a value in the provided
	-- table that meets the provided predicate.
	---@generic V: any
	---@nodiscard
	---@type fun(t: {[kcd2def*luakey]:V}, pred: (fun(V): boolean?)): V?
	SelectOne = ...;
	--- Returns a sequence which contains all the values
	-- in the provided sequence that meet the provided predicate.
	---@generic V: any
	---@nodiscard
	---@type fun(t: V[], pred: (fun(V): boolean?)): V[]
	SelectValues = ...;
	---@generic K: kcd2def*luakey
	---@generic V: any
	---@nodiscard
	---@type fun(obj: {[K]:V}): copy: {[K]:V}
	ShallowCopy = ...;
	---@type fun(list: any[]): nil
	Shuffle = ...;
	--- Sorts simple indexed array of objects (tables with string keys)
	-- based on the provided keys (additional function arguments as strings)
	-- in descending order of importance (i.e. the first additional argument is
	-- the most important sorting key which can decide the comparison of two elements first)
	---@source Data/Scripts/Utils/TableUtils.lua:281
	---@generic V: any
	---@type fun(array: {[string]: V}[], ...: string): nil
	SortArrayOfObjects = ...;
	--- Picks K items from list, items probability is given by it's weight
	-- A-Chao algorithm
	---@source Data/Scripts/Utils/TableUtils.lua:444
	---@generic V: any
	---@nodiscard
	---@type fun(k: integer, list: V[], weights: number[]): V[]
	WeightedReservoirSample = ...;
	--- Picks random element from list. weightCallback returns weights for each element.
	---@source Data/Scripts/Utils/TableUtils.lua:424
	---@generic V: any
	---@nodiscard
	---@type fun(list: V[], weights: number[]): V
	WeightedSample = ...;
	concat = table.concat;
	foreach = table.foreach;
	foreachi = table.foreachi;
	getn = table.getn;
	insert = table.insert;
	maxn = table.maxn;
	remove = table.remove;
	---@type fun(a: table, n: integer): nil
	setn = ...;
	sort = table.sort;
}


--- Unaltered Builtins


_VERSION = 'Lua 5.1'
arshift = arshift
assert = assert
band = band
bnot = bnot
bor = bor
bxor = bxor
collectgarbage = collectgarbage
coroutine = {
	create = coroutine.create;
	resume = coroutine.resume;
	running = coroutine.running;
	status = coroutine.status;
	wrap = coroutine.wrap;
	yield = coroutine.yield;
}
debug = {
	debug = debug.debug;
	getfenv = debug.getfenv;
	gethook = debug.gethook;
	getinfo = debug.getinfo;
	getlocal = debug.getlocal;
	getmetatable = debug.getmetatable;
	getregistry = debug.getregistry;
	getupvalue = debug.getupvalue;
	setfenv = debug.setfenv;
	sethook = debug.sethook;
	setlocal = debug.setlocal;
	setmetatable = debug.setmetatable;
	setupvalue = debug.setupvalue;
	traceback = debug.traceback;
}
dofile = dofile
error = error
getfenv = getfenv
getmetatable = getmetatable
ipairs = ipairs
load = load
loadfile = loadfile
loadstring = loadstring
lshift = lshift
module = module
next = next
package = package -- not worth expanding
pairs = pairs
pcall = pcall
print = print
random = random
rawequal = rawequal
rawget = rawget
rawset = rawset
require = require
rshift = rshift
select = select
setfenv = setfenv
setmetatable = setmetatable
tonumber = tonumber
tostring = tostring
type = type
unpack = unpack
xpcall = xpcall