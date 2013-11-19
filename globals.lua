--[[----------------------------------------------------------------------------

MODULE NAME: globals.lua

DATE: 

AUTHOR: 


SCENE NOTES: 




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

-- POSITIONING VARIABLES
GD.orientation = system.orientation							-- Device orientation
GD.screenWidth = display.contentWidth           			-- Screen width
GD.screenHeight = display.contentHeight         			-- Screen height
GD.screenTop = 0                                			-- Screen Top
GD.screenRight = display.contentWidth           			-- Screen Right
GD.screenBottom = display.contentHeight         			-- Screen Bottom
GD.screenLeft = 0                               			-- Screen Left
GD.screenCenterX = display.contentWidth/2       			-- Horizontal Center 
GD.screenCenterY = display.contentHeight/2      			-- Vertical Center

-- DEBUG VARIABLES
GD.debugging = false


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