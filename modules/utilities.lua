--[[----------------------------------------------------------------------------

MODULE NAME: utilities.lua

DESCRIPTION:
Collection of common useful functions

DATE: 

AUTHOR: Aidan Smyth  smyth.aidan@gmail.com


MODULE NOTES: 
Corona SDK version used: 2012.971




------------------------------------------------------------------------------]]

--------------------------------------------------------------------------------
-- SETUP MODULE
--------------------------------------------------------------------------------

-- LOAD LIBRARIES
----------------------------------------
local json = require ("json")

-- LOAD MODULES
----------------------------------------
local GD = require("globals")					-- Load Global data


-- CONSTRUCTOR
----------------------------------------
local UTIL = {}
-- print("utilities module loaded")


--------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------

-- LOCAL VARIABES
----------------------------------------



-- GLOBAL VARIABLES
----------------------------------------



--------------------------------------------------------------------------------
-- PRIVATE FUNCTIONS
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- PUBLIC FUNCTIONS
--------------------------------------------------------------------------------


 -- TABLE FUNCTIONS
----------------------------------------

--[[
Print contents of a table
https://gist.github.com/hashmal/874792


]]

function UTIL.tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
		formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			print(formatting)
			tprint(v, indent+1)
		else
			print(formatting .. v)
		end
	end
end


--[[
Completely copy a multi level table
http://lua-users.org/wiki/CopyTable

]]
function UTIL.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--[[
-- Completely copy a single level table
http://lua-users.org/wiki/CopyTable

]]
function UTIL.shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--[[
-- Shuffle a table

]]
function UTIL.shuffle(t)
    local rand = math.random 
    assert(t, "table.shuffle() expected a table, got nil")
    local len = #t
    local j
    
    for i = len, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

--[[
-- A function to check an item against the contents of an table

]] 
function UTIL.isInTable(table, item)
	local len = #table
	local isDuplicate = false
	
	for i=1, len do
		if item == table[i] then
			isDuplicate = true
			break
		end
	end
	
	return isDuplicate
end



-- FILE HANDLING
----------------------------------------

-- Function to save table to json file
function UTIL.saveJSON( table, fileNane )
	-- Create path to the file
	local path = system.pathForFile( fileName..".json", system.DocumentsDirectory )
	-- Open file path & create/write to file mode
	local file = io.open( path, "w" )
	assert( file, "Error: "..fileName..".json not found!" )
	-- Encode preferences to JSON
	local contents = json.encode( table )
	-- Write the JSON string to file
	file:write(contents)
	-- Close file connection
	io.close( file )
end

-- Function to load json file to table
function UTIL.loadJSON( table, fileName )
	-- Create path to the file
	local path = system.pathForFile( fileName..".json", system.DocumentsDirectory )
	-- Open file path & read mode, will be nil if it does not exist
	local file = io.open( path, "r" )
	
	if file then
		-- Read all contents of file into a string
		local contents = file:read( "*a" )
		-- Decode json string the table
		table = json.decode(contents)
		-- Close file connection
		io.close( file )
	else
		-- if no file exists create it
		saveJSON( table, fileName )
		-- Load json file
		loadJSON( table, fileName )
	end
end



-- CONSOLE OUTPUT
----------------------------------------

-- Print debug messages to the console
function UTIL.dbprint(message)
	-- print("dbprint called")
	local msg = message
	if GD.debugging == true then
		print(msg)
	end
end




-- MEMORY MANAGEMENT
----------------------------------------

-- Clear timers
function UTIL.cancelAllTimers( timerStash )
    local k, v

    for k,v in pairs(timerStash) do
        timer.cancel( v )
        v = nil; k = nil
    end

    timerStash = nil
    timerStash = {}
end

-- clear transitions
function UTIL.cancelAllTransitions( transitionStash )
    local k, v

    for k,v in pairs(transitionStash) do
        transition.cancel( v )
        v = nil; k = nil
    end

    transitionStash = nil
    transitionStash = {}
end




--------------------------------------------------------------------------------
-- EXPORT DATA AND FUNCTIONS
-------------------------------------------------------------------------------- 
return UTIL
