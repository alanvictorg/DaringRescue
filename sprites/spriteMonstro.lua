--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a2216e8bc4ca0aacd32ba37e1dd06514:a2d000b28a6956579414c379a0c7ffe8:0db15cd8d772c854646d5eb8c2378e58$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- monstro1
            x=1,
            y=93,
            width=66,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- monstro2
            x=1,
            y=1,
            width=66,
            height=90,

            sourceX = 16,
            sourceY = 1,
            sourceWidth = 96,
            sourceHeight = 96
        },
    },
    
    sheetContentWidth = 68,
    sheetContentHeight = 180
}

SheetInfo.frameIndex =
{

    ["monstro1"] = 1,
    ["monstro2"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
