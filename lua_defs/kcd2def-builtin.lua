---@meta kcd2def-builtin

--- this file contains the altered and unaltered (listed for convenience) lua 5.1 builtins

--- Altered Builtins


math = {
	---@deprecated
	---@type kcd2def*unknown_function
	Clamp = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Lerp = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	PseudoGaussPDF = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	RandomFloat = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Round = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Sign = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	SkewedPseudoGauss = ...;
	---@deprecated
	---@type kcd2def*unknown_function
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
	---@deprecated
	---@type kcd2def*unknown_function
	CapitaliseFirst = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Explode = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	IsEmpty = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Split = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	StartsWith = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Trim = ...;
	byte = string.byte;
	char = string.char;
	dump = string.dump;
	find = string.find;
	format = string.format;
	---@deprecated
	---@type kcd2def*unknown_function
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
	---@deprecated
	---@type kcd2def*unknown_function
	Append = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	ArrayShiftOne = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	ArrayShiftZero = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Contains = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	ContainsIgnoreCase = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Count = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	CountWithPredicate = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	DeepCopy = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Find = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	IndexArrayOfObjects = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	IsEmpty = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Lookup = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	MakeFromType = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Merge = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	PopFirst = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	PopLast = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	ReindexTableToMBT = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	RemoveValue = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	RemoveWithPredicate = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	ReservoirSample = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	RollingSample = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	SafeGet = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Select = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	SelectOne = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	SelectValues = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	ShallowCopy = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	Shuffle = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	SortArrayOfObjects = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	WeightedReservoirSample = ...;
	---@deprecated
	---@type kcd2def*unknown_function
	WeightedSample = ...;
	concat = table.concat;
	foreach = table.foreach;
	foreachi = table.foreachi;
	getn = table.getn;
	insert = table.insert;
	maxn = table.maxn;
	remove = table.remove;
	---@deprecated
	---@type kcd2def*unknown_function
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