---@meta kcd2def-builtin

--- this file contains the altered and unaltered (listed for convenience) lua 5.1 builtins

--- Altered Builtins


math = {
	---@type kcd2def*unknown_function
	Clamp = ...;
	---@type kcd2def*unknown_function
	Lerp = ...;
	---@type kcd2def*unknown_function
	PseudoGaussPDF = ...;
	---@type kcd2def*unknown_function
	RandomFloat = ...;
	---@type kcd2def*unknown_function
	Round = ...;
	---@type kcd2def*unknown_function
	Sign = ...;
	---@type kcd2def*unknown_function
	SkewedPseudoGauss = ...;
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
	---@type kcd2def*unknown_function
	CapitaliseFirst = ...;
	---@type kcd2def*unknown_function
	Explode = ...;
	---@type kcd2def*unknown_function
	IsEmpty = ...;
	---@type kcd2def*unknown_function
	Split = ...;
	---@type kcd2def*unknown_function
	StartsWith = ...;
	---@type kcd2def*unknown_function
	Trim = ...;
	byte = string.byte;
	char = string.char;
	dump = string.dump;
	find = string.find;
	format = string.format;
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
	---@type kcd2def*unknown_function
	Append = ...;
	---@type kcd2def*unknown_function
	ArrayShiftOne = ...;
	---@type kcd2def*unknown_function
	ArrayShiftZero = ...;
	---@type kcd2def*unknown_function
	Contains = ...;
	---@type kcd2def*unknown_function
	ContainsIgnoreCase = ...;
	---@type kcd2def*unknown_function
	Count = ...;
	---@type kcd2def*unknown_function
	CountWithPredicate = ...;
	---@type kcd2def*unknown_function
	DeepCopy = ...;
	---@type kcd2def*unknown_function
	Find = ...;
	---@type kcd2def*unknown_function
	IndexArrayOfObjects = ...;
	---@type kcd2def*unknown_function
	IsEmpty = ...;
	---@type kcd2def*unknown_function
	Lookup = ...;
	---@type kcd2def*unknown_function
	MakeFromType = ...;
	---@type kcd2def*unknown_function
	Merge = ...;
	---@type kcd2def*unknown_function
	PopFirst = ...;
	---@type kcd2def*unknown_function
	PopLast = ...;
	---@type kcd2def*unknown_function
	ReindexTableToMBT = ...;
	---@type kcd2def*unknown_function
	RemoveValue = ...;
	---@type kcd2def*unknown_function
	RemoveWithPredicate = ...;
	---@type kcd2def*unknown_function
	ReservoirSample = ...;
	---@type kcd2def*unknown_function
	RollingSample = ...;
	---@type kcd2def*unknown_function
	SafeGet = ...;
	---@type kcd2def*unknown_function
	Select = ...;
	---@type kcd2def*unknown_function
	SelectOne = ...;
	---@type kcd2def*unknown_function
	SelectValues = ...;
	---@type kcd2def*unknown_function
	ShallowCopy = ...;
	---@type kcd2def*unknown_function
	Shuffle = ...;
	---@type kcd2def*unknown_function
	SortArrayOfObjects = ...;
	---@type kcd2def*unknown_function
	WeightedReservoirSample = ...;
	---@type kcd2def*unknown_function
	WeightedSample = ...;
	concat = table.concat;
	foreach = table.foreach;
	foreachi = table.foreachi;
	getn = table.getn;
	insert = table.insert;
	maxn = table.maxn;
	remove = table.remove;
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