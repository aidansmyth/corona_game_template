local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
	content = {
		-- width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio ), 	-- 
		-- height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio ), 	-- 
    width = 768,
    height = 1024, 
		scale = "letterBox", 			-- letterbox, zoomEven, zoomStretch
		fps = 30, 						-- 30, 60

		imageSuffix = {
			["@2x"] = 1.3, 				-- 	
		},
	},

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    

    license =
    {
        google =
        {
            key = "your key here",
            policy = "this is optional",
        },
    }, 
    ]]   
}


--[[
-- iPad Configuration
if ( string.sub( system.getInfo("model"), 1, 4 ) == "iPad" ) then
    application =
    {
        content =
        {
            width = 360,
            height = 480,
            scale = "letterBox",
            xAlign = "center",
            yAlign = "center",
            imageSuffix =
            {
                ["@2x"] = 1.5,
                ["@4x"] = 3.0,
            },
        },
    }
-- iPhone5 Configuration
elseif ( string.sub( system.getInfo("model"), 1, 2 ) == "iPhone" and display.pixelHeight > 960 ) then
   application =
   {
      content =
      {
         width = 320,
         height = 568,
         scale = "letterBox",
         xAlign = "center",
         yAlign = "center",
         imageSuffix =
         {
            ["@2x"] = 1.5,
            ["@4x"] = 3.0,
         },
      },
   }

-- iPhone 3,4 and Older iPod Touch
elseif ( string.sub( system.getInfo("model"), 1, 2 ) == "iPhone" ) then
   application =
   {
      content =
      {
         width = 320,
         height = 480,
         scale = "letterBox",
         xAlign = "center",
         yAlign = "center",
         imageSuffix =
         {
            ["@2x"] = 1.5,
            ["@4x"] = 3.0,
         },
      },
   }

-- Android, Kindle Fire, and Nook
elseif ( display.pixelHeight / display.pixelWidth > 1.72 ) then
   application =
   {
      content =
      {
         width = 320,
         height = 570,
         scale = "letterBox",
         xAlign = "center",
         yAlign = "center",
         imageSuffix =
         {
            ["@2x"] = 1.5,
            ["@4x"] = 3.0,
         },
      },
   }
 
else
   application =
   {
      content =
      {
         width = 320,
         height = 512,
         scale = "letterBox",
         xAlign = "center",
         yAlign = "center",
         imageSuffix =
         {
            ["@2x"] = 1.5,
            ["@4x"] = 3.0,
         },
      },
   }
end 
]]