--[[----------------------------------------------------------------------------

MODULE NAME: debug.lua

DATE: 

AUTHOR: 


SCENE NOTES: 




------------------------------------------------------------------------------]]

--------------------------------------------------------------------------------
-- SETUP MODULE
--------------------------------------------------------------------------------

print("debug module loaded")

-- LOAD MODULES
----------------------------------------
local GD = require("globals")								-- Load global data module

-- CONSTRUCTOR
----------------------------------------
-- print("debug module loaded")
local debug = {}


--------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------

-- LOCAL VARIABES
----------------------------------------
local x = 1


-- GLOBAL VARIABLES
----------------------------------------
debug.example = x 											-- Device orientation



--------------------------------------------------------------------------------
-- PRIVATE FUNCTIONS
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- PUBLIC FUNCTIONS
--------------------------------------------------------------------------------

debug.displayDebug = function()
	print("debug.displayDebug called")

	-- Create display groups
	local debugGroup = display.newGroup()
		local debugMenuGroup = display.newGroup()

	-- Organise our groups
	debugGroup:insert(debugMenuGroup)


	-- Create debug menu button
	local debugMenuBtn = display.newRect(debugMenuGroup, 0, 0, 50, 50)
	debugMenuBtn:setReferencePoint(display.TopRightReferencePoint)
	debugMenuBtn.x = GD.screenRight
	debugMenuBtn.y = GD.screenTop
	debugMenuBtn:setFillColor(255, 255, 255)
	debugMenuBtn:setStrokeColor(45, 180, 100)

	-- Create debug menu box
	local debugMenuBg = display.newRect(debugMenuGroup, 0, 0, 250, GD.screenHeight)
	debugMenuBg:setReferencePoint(display.TopLeftReferencePoint)
	debugMenuBg.x = GD.screenRight
	debugMenuBg.y = GD.screenTop
	debugMenuBg:setFillColor(200, 200, 200)
	debugMenuBg:setStrokeColor(45, 180, 100)
end





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
return debug