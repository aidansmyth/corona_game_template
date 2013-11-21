--[[----------------------------------------------------------------------------

MODULE NAME: globals.lua

DATE: 

AUTHOR: 


MODULE NOTES: 




------------------------------------------------------------------------------]]

--------------------------------------------------------------------------------
-- SETUP MODULE
--------------------------------------------------------------------------------

-- LOAD MODULES
----------------------------------------


-- CONSTRUCTOR
----------------------------------------
-- print("global data loaded")
local GD = {}




--------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------

-- LOCAL VARIABLES
----------------------------------------
local x = 1


-- GLOBAL VARIABLES
----------------------------------------

-- DEBUG VARIABLES
GD.debugging = true					-- Turn on/off dubugging
GD.memtest = false						-- Turn on/off memory test info


-- POSITIONING VARIABLES
GD.orientation = system.orientation		-- Device orientation

GD.cenX = display.contentCenterX 		-- Horizontal Center 
GD.cenY = display.contentCenterY 		-- Vertical Center

GD.w = display.contentWidth 			-- content width
GD.h = display.contentHeight 			-- content height
GD.l = 0 								-- left
GD.r = GD.w 				 			-- right
GD.t = 0 								-- top
GD.b = GD.h 							-- bottom

GD.sw = display.pixelWidth 				-- screen width
GD.sh = display.pixelHeight 			-- screen heigth


-- COLORS
GD.textColors = {
	
}

GD.mainColors = {
	
}

--------------------------------------------------------------------------------
-- PRIVATE FUNCTIONS
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- EXPORT DATA AND FUNCTIONS
-------------------------------------------------------------------------------- 
return GD