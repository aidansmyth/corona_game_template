--[[----------------------------------------------------------------------------

MODULE NAME: debug.lua

DATE: 

AUTHOR: 


SCENE NOTES: 




------------------------------------------------------------------------------]]

--------------------------------------------------------------------------------
-- SETUP MODULE
--------------------------------------------------------------------------------

-- LOAD MODULES
----------------------------------------
local GD = require("globals")								-- Load global data module

-- CONSTRUCTOR
----------------------------------------
-- print("debug module loaded")
local DEBUG = {}


--------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------

-- LOCAL VARIABES
----------------------------------------
local x = 1


-- GLOBAL VARIABLES
----------------------------------------
DEBUG.example = x 											-- Device orientation



--------------------------------------------------------------------------------
-- PRIVATE FUNCTIONS
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- PUBLIC FUNCTIONS
--------------------------------------------------------------------------------

-- DEBUG.displayDebug = function()
-- 	local debugGroup = display.newGroup()

-- 	-- Create box to hold the information
-- 	local debugRect = display.newRect( debugGroup, 0, 0, 50, 50)
-- 	debugRect:setFillColor(255, 255, 255)
-- 	debugRect:setStrokeColor(45, 180, 100)
-- end





-- #############################################################################
-- MEMORY MANAGEMENT
-- Add this code to your main.lua and it will always appear on each screen of your app
-- #############################################################################

-- local fps = require("fps")
-- local performance = fps.PerformanceOutput.new();
-- performance.group.x, performance.group.y = display.contentWidth/2,  0;
-- performance.alpha = 0.6; -- So it doesn't get in the way of the rest of the scene


--[[
DEBUG.displayDebug = function()

	if GD.memtest == true then
		local debugInfoBox = display.newGroup()

		-- Create box to hold the information
		local debugRect = display.newRect( debugInfoBox, 0, 0, 300, 50)
		debugRect:setFillColor(255, 255, 255)
		debugRect:setStrokeColor(45, 180, 100)

		-- Create text to show the memory usage
		local memUsageText = display.newText( debugInfoBox, "Hello, World", 0, 0, "Arial", 18 )
		memUsageText:setTextColor(0, 0, 255)

		-- Create text to show the texture memory usage
		local textureMemUsageText = display.newText( debugInfoBox, "Hello, World", 0, 25, "Arial", 18 )
		textureMemUsageText:setTextColor(0, 0, 255)

		-- Reset debugRect width & height to fix text
		debugRect.width = debugInfoBox.width + 10
		debugRect.height = debugInfoBox.height + 10
	end
end 	-- End DEBUG.displayInfo() function


-- Create monitor function
DEBUG.monitorMem = function()

   collectgarbage()

   -- 
    local textMem = system.getInfo( "textureMemoryUsed" ) / 1000000
    memUsageText.text = "App Memory: " .. collectgarbage("count")
    memUsageText:setReferencePoint(display.TopLeftReferencePoint)
    memUsageText.x = 10
    -- 
    textureMemUsageText.text = "Texture Memory: " .. textMem
    textureMemUsageText:setReferencePoint(display.TopLeftReferencePoint)
    textureMemUsageText.x = 10
end
]]

--------------------------------------------------------------------------------
-- EXPORT DATA AND FUNCTIONS
-------------------------------------------------------------------------------- 
return DEBUG