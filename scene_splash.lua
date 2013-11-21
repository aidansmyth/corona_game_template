--[[----------------------------------------------------------------------------

SCENE NAME: scene_splash.lua

DATE: 

AUTHOR: 


SCENE NOTES: 




------------------------------------------------------------------------------]]


--------------------------------------------------------------------------------
-- SCENE SETUP
--------------------------------------------------------------------------------

-- Load libraries
----------------------------------------
local storyboard = require( "storyboard" ) 					-- Load storyboard library


-- Load modules
----------------------------------------
local GD = require("globals")								-- Load global data module
local UTIL = require("modules.utilities")					-- Load utility module
local F = require("modules.fonts")							-- Load fonts module


-- Start scene
local scene = storyboard.newScene()


-- VARIABLES
----------------------------------------

-- Memory management variables
local timerStash = {}
local transitionStash = {}

-- Display groups
local splashGroup = display.newGroup()



-- local forward references should go here --


-- LOCAL FUNCTIONS
----------------------------------------

function startTimer()
	-- disableSceneOnChange()
	local waitTime = 1

    -- Check the time on each loop of the timer
    function checkTime()
    	waitTime = waitTime - 1
    	if waitTime <= 0 then
    		storyboard.gotoScene( "scene_test", "fade", 400 )	-- Go to main menu
    	end
	end

	-- Start the timer
    timerStash.exitTimer = timer.performWithDelay(1000, checkTime, 20)

end



--------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
--------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local sceneGroup = self.view

	local background = display.newRect(sceneGroup, 0,0,display.contentWidth,display.contentHeight)
	background:setFillColor(140, 140, 140)

	local sceneTitle = display.newText(sceneGroup, "scene_splash", GD.l + 20, GD.t + 20, F.default, F.size[2])
end

-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
	local sceneGroup = self.view

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local sceneGroup = self.view

	-----------------------------------------------------------------------------
    --	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
    -----------------------------------------------------------------------------

	-- Completely remove the previous scene.
    -- Handy in this case where we want to keep everything simple.
    storyboard.removeAll()

    startTimer()

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local sceneGroup = self.view

	-- Call UTIL functions to stop all timers/transitions in the scene
	UTIL.cancelAllTimers( timerStash )
	UTIL.cancelAllTransitions( transitionStash )
end

-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
	local sceneGroup = self.view

end

-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
	local sceneGroup = self.view

end

-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
	local sceneGroup = self.view
	local overlay_name = event.sceneName  -- name of the overlay scene

end

-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
	local sceneGroup = self.view
	local overlay_name = event.sceneName  -- name of the overlay scene

end


--------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
--------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )

-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )

--------------------------------------------------------------------------------

return scene