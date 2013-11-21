--[[----------------------------------------------------------------------------

SCENE NAME: scene_test.lua

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

-- test table
local testTable = {1,2,3,4,5,6,7,8,9}

local deepTestTable = {
	{1,2,3},
	{4,5,6},
	{7,8,9}
}

local Array={"Forest","Beach","Home"} --places
Array["Forest"] = {"Trees","Flowers"} --things you find there
Array["Forest"]["Trees"] = "A tree is a perennial woody plant" --description


-- local forward references should go here --



-- LOCAL FUNCTIONS
----------------------------------------
function tprint (tbl, indent)
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



--------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
--------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local sceneGroup = self.view

	local background = display.newRect(sceneGroup, 0,0,display.contentWidth,display.contentHeight)
	background:setFillColor(140, 140, 140)

	local sceneTitle = display.newText(sceneGroup, "scene_test", GD.l + 20, GD.t + 20, F.default, F.size[2])

	local sizeInfoGroup = display.newGroup()



	sceneGroup:insert(sizeInfoGroup)

	local sizeInfoBg = display.newRect(sizeInfoGroup, 0, 0, 350, 600)
	sizeInfoBg:setFillColor(200, 200, 200)


	local screenWidth = display.newText(sizeInfoGroup, "Screen Width: " .. display.pixelWidth, 10, 30, F.default, F.size[1])
	screenWidth:setTextColor( 0, 0, 0 )

	local screenHeight = display.newText(sizeInfoGroup, "Screen height: " .. display.pixelHeight, 10, screenWidth.y + 20, F.default, F.size[1])
	screenHeight:setTextColor( 0, 0, 0 )

	local contentWidth = display.newText(sizeInfoGroup, "Content Width: " .. display.contentWidth, 10, screenHeight.y + 20, F.default, F.size[1])
	contentWidth:setTextColor( 0, 0, 0 )

	local contentHeight = display.newText(sizeInfoGroup, "Content height: " .. display.contentHeight, 10, contentWidth.y + 20, F.default, F.size[1])
	contentHeight:setTextColor( 0, 0, 0 )

	local screenOriginX = display.newText(sizeInfoGroup, "screenOriginX: " .. display.screenOriginX, 10, contentHeight.y + 20, F.default, F.size[1])
	screenOriginX:setTextColor( 0, 0, 0 )

	local screenOriginY = display.newText(sizeInfoGroup, "screenOriginY: " .. display.screenOriginY, 10, screenOriginX.y + 20, F.default, F.size[1])
	screenOriginY:setTextColor( 0, 0, 0 )

	sizeInfoGroup:setReferencePoint(display.CenterReferencePoint)
	sizeInfoGroup.x, sizeInfoGroup.y = display.contentWidth/2, display.contentHeight/2

end

-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
	local sceneGroup = self.view

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local sceneGroup = self.view

	-- Completely remove the previous scene.
    -- Handy in this case where we want to keep everything simple.
    storyboard.removeAll()

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