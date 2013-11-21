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
local F = require("modules.fonts")							-- Load fonts module

-- CONSTRUCTOR
----------------------------------------
-- print("debug module loaded")
local DEBUG = {}


--------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------

-- LOCAL VARIABES
----------------------------------------

local menuWidth = 350
local menuHeight = GD.h
local menuItemX = 100
local menuItemSpacing = 40
local menuOpen = false

local debugInfoGroup = display.newGroup()


-- GLOBAL VARIABLES
----------------------------------------




--------------------------------------------------------------------------------
-- PRIVATE FUNCTIONS
--------------------------------------------------------------------------------
function openMenu( event )
	if menuOpen then
		debugInfoGroup.x = debugInfoGroup.x - menuWidth
	else
		debugInfoGroup.x = debugInfoGroup.x + menuWidth
	end
end


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


--[[ ]]
DEBUG.displayDebug = function()

	-- Create debug menu button
	local debugMenuBtn = display.newRect( debugInfoGroup, 0, 0, 80, 80)
	debugMenuBtn:addEventListener("tap", openMenu)

	-- Create box to hold the information
	local debugMenuBg = display.newRect( debugInfoGroup, debugMenuBtn.width, 0, menuWidth, menuHeight)
	debugMenuBg:setFillColor(255, 255, 255)
	debugMenuBg:setStrokeColor(45, 180, 100)

	-- Create text to show the memory usage
	local memUsageText = display.newText( debugInfoGroup, "Hello, World", menuItemX, 0, "Arial", 18 )
	memUsageText:setTextColor(0, 0, 255)

	-- Create text to show the texture memory usage
	local textureMemUsageText = display.newText( debugInfoGroup, "Hello, World", menuItemX, 25, "Arial", 18 )
	textureMemUsageText:setTextColor(0, 0, 255)

	-- -- Create monitor function
	-- monitorMem = function()

	-- 	collectgarbage()

	-- 	-- 
	-- 	local textMem = system.getInfo( "textureMemoryUsed" ) / 1000000
	-- 	memUsageText.text = "App Memory: " .. collectgarbage("count")
	-- 	memUsageText:setReferencePoint(display.TopLeftReferencePoint)
	-- 	memUsageText.x = 10
	-- 	-- 
	-- 	textureMemUsageText.text = "Texture Memory: " .. textMem
	-- 	textureMemUsageText:setReferencePoint(display.TopLeftReferencePoint)
	-- 	textureMemUsageText.x = 10
	-- end

	-- Reposition manu off screen
	debugInfoGroup:setReferencePoint(display.TopLeftReferencePoint)
	debugInfoGroup.x, debugInfoGroup.y = GD.r - debugMenuBtn.width, GD.t

end 	-- End DEBUG.displayInfo() function



--------------------------------------------------------------------------------
-- EXPORT DATA AND FUNCTIONS
-------------------------------------------------------------------------------- 
return DEBUG