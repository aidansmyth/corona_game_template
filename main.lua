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
-- PRIVATE FUNCTIONS
----------------------------------------

-- LETTERBOXBORDER ---------------------------------------------
--[[
http://developer.coronalabs.com/code/putting-borders-where-needed-when-using-letterbox-zoom-mode

-- Blocks out the original screen resolution for devices with a different aspect ratio.
-- Note it is designed to work for apps with scale mode of "letterbox".
-- As a result it is impossible that both the screenOriginX and screenOriginY ~= 0, only 1 can be
-- This should always be the last thing called if used, so that it goes on top of anything else,
-- although if borders are created, it returns a display group containing the bars, so you can use
-- this later with :toFront() should it be needed.
]]

function letterboxBorder(params)
 
    -- Missed parameters
    -- if not params.r then params.r = 50; end
    -- if not params.g then params.g = 50; end
    -- if not params.b then params.b = 50; end

    local params = {}
    params.r = 0
    params.g = 0
    params.b = 0
    
    -- Use display resolution information to block out areas if needed - makes the letter box thing nicer
    -- Should probably use images in the future...
    if display.screenOriginX ~= 0 then
        local group = display.newGroup()
        
        local leftBar = display.newRect(0, 0, -display.screenOriginX, display.contentHeight)
            leftBar:setFillColor(params.r, params.g, params.b)
        leftBar.x     = display.screenOriginX * 0.5
        group:insert(leftBar)
        
        local rightBar = display.newRect(0, 0, -display.screenOriginX, display.contentHeight)
        rightBar:setFillColor(params.r, params.g, params.b)
            rightBar.x     = display.contentWidth - display.screenOriginX * 0.5
        group:insert(rightBar)
 
        return group
        
    elseif displayscreenOriginY ~= 0 then
        local group = display.newGroup()
        
        local topBar = display.newRect(0, 0, display.contentWidth, -display.screenOriginY)
            topBar:setFillColor(params.r, params.g, params.b)
        topBar.y     = display.screenOriginY * 0.5
        group:insert(topBar)
 
        local bottomBar = display.newRect(0, 0, display.contentWidth, -display.screenOriginY)
            bottomBar:setFillColor(params.r, params.g, params.b)
        bottomBar.y     = display.contentHeight - display.screenOriginY * 0.5
        group:insert(bottomBar)
 
        return group
    end
 
    -- Desired screen resolution fills the device's screen
    return false
    
end


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
-- #############################################################################
-- MEMORY MANAGEMENT
-- Add this code to your main.lua and it will always appear on each screen of your app
-- #############################################################################

-- local fps = require("fps")
-- local performance = fps.PerformanceOutput.new();
-- performance.group.x, performance.group.y = display.contentWidth/2,  0;
-- performance.alpha = 0.6; -- So it doesn't get in the way of the rest of the scene


--[[ 
if GD.debugging then

	audio.setVolume(0) 															-- Debug: turn off all audio
	
	local debugInfoBox = display.newGroup()

	if memtest == true then
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

		-- Create monitor function
		local monitorMem = function()

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

		-- Reset debugRect width & height to fix text
		debugRect.width = debugInfoBox.width + 10
		debugRect.height = debugInfoBox.height + 10

		-- Add runtime listener to display/update memory display
		Runtime:addEventListener( "enterFrame", monitorMem ) -- Runtime Listerner to run monitorMem function
	end
end
]]



----------------------------------------
letterboxBorder()