--[[

		@comicallynathan/Out
		- A simple module for logging and debugging made by and for @buckmad.
		
		Usage:
			local Out = require("@game/ReplicatedStorage/Shared/Modules/Out")
			
			Out.Print("Hello world!") -- [Script]: Hello world!
			Out.PrintV("Hello world!") -- [Script] @10: Hello world!
			Out.Warn("Hello world!") -- [Script] @11: Hello world! (will also warn)
			Out.Error("Hello world!") -- [Script] @12: Hello world! (will also error)
			
		Require me!!
			require("@game/ReplicatedStorage/Shared/Modules/Out")

]]

type Output = (any | string)

local out = {}

--[[
	Outputs: **ERROR**
	```
	[src/Service] @1: Hello World!
	```
]]
function out.Error(... : Output) : nil
	error(`[{debug.info(2, "s")}] @{debug.info(2, "l")}: {...}`, 2)
end

--[[
	Outputs:
	```
	[Service] @1: Hello World!
	```
]]
function out.Print(... : Output) : ()
	local index = string.split(debug.info(2, "s"), ".")
	print(`[{index[#index]}]: {...}`)
end

--[[
	Outputs:
	```
	[src/Service] @1: Hello World!
	```
]]
function out.PrintV(... : Output) : ()
	print(`[{debug.info(2, "s")}] @{debug.info(2, "l")}: {...}`)
end

--[[
	Outputs: **WARNING**
	```
	[src/Service] @1: Hello World!
	```
]]
function out.Warn(... : Output) : ()
	warn(`[{debug.info(2, "s")}] @{debug.info(2, "l")}: {...}`)
end

return out
