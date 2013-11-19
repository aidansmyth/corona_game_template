--[[----------------------------------------------------------------------------

SCENE NAME: main.lua

DATE: 

AUTHOR: 


SCENE NOTES: 




------------------------------------------------------------------------------]]


--------------------------------------------------------------------------------
-- APP SETUP
--------------------------------------------------------------------------------

-- Load modules
----------------------------------------
local GD = require("globals")								-- Load global data module
local device = require("modules.device")					-- Load device module
local debug = require("modules.debug")						-- Load debug module
local storyboard = require ("storyboard")					-- Load Storyboard



-- VARIABLES
----------------------------------------


-- local forward references should go here --



----------------------------------------
-- SCREEN SETTINGS
----------------------------------------
display.setStatusBar( display.HiddenStatusBar )				-- Remove status bar
display.setDefault( "background", 0, 0, 0 )					-- set background color to white


----------------------------------------
-- START APP
----------------------------------------
storyboard.purgeOnSceneChange = true 						-- Set scenes to purge automatically
storyboard.gotoScene( "scene_splash", "fade", 200 )		-- Go to splash screen


----------------------------------------
-- DEBUG
----------------------------------------
-- os.execute("cls") -- Clear the Corona SDK terminal on restart
-- print("OS is: " .. device.OS)
-- print("Simulator: " .. tostring(device.isSimulator))

if GD.debugging == true then

	-- Show debug menu
	debug.displayDebug()

	-- Add runtime listener to display/update memory display
	-- Runtime:addEventListener( "enterFrame", debug.monitorMem ) -- Runtime Listerner to run monitorMem function
end
