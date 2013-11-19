--[[-----------------------------------------------------------------------
    Device Module

    File: device.lua
	
	Description: 

    Date: 14/08/2013

    Authors: Aidan Smyth

    Notes: 
	Corona SDK version used: 2012.971
	
-------------------------------------------------------------------------]]

-- Create a table that will contain all of our tests we are setting up.
local M = {}
 
-- Set up some defaults...
M.iOS = false
M.windows = false
M.isApple = false
M.isAndroid = false
M.isGoogle = false
M.isKindleFire = false
M.isNook = false
M.is_iPad = false
M.isTall = false

M.OS = system.getInfo( "platformName" )
M.isSimulator = false

-- local OS = system.getInfo( "platformName" )
local model = system.getInfo("model")

-- Are we on the Simulator?
if ( "simulator" == system.getInfo("environment") ) then
    M.isSimulator = true
end

if ( (display.pixelHeight/display.pixelWidth) > 1.5 ) then
   M.isTall = true
end
 
-- Now identify the Apple family of devices:
if ( string.sub( model, 1, 2 ) == "iP" ) then 
   -- We are an iOS device of some sort
   M.isApple = true
 
   if ( string.sub( model, 1, 4 ) == "iPad" ) then
      M.is_iPad = true
   end
 
else --...(the rest of the else is below)

   -- Not Apple, so it must be one of the Android devices
   M.isAndroid = true
 
   -- Let's assume we are on Google Play for the moment
   M.isGoogle = true
 
   -- All of the Kindles start with "K", although Corona builds before #976 returned
   -- "WFJWI" instead of "KFJWI" (this is now fixed, and our clause handles it regardless)
   if ( model == "Kindle Fire" or model == "WFJWI" or string.sub( model, 1, 2 ) == "KF" ) then
      M.isKindleFire = true
      M.isGoogle = false  --revert Google Play to false
   end
 
   -- Are we on a Nook?
   if ( string.sub( model, 1 ,4 ) == "Nook") then
      M.isNook = true
      M.isGoogle = false  --revert Google Play to false
   end
 
end

-- Return the table "M", providing access to it from where the module is "require"d
return M
