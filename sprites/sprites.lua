--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:342c22bbf3500dee5e6c045ba0d6441f:fd9a7d4c68baa4681f5d4d5af9336d08:ce59e0ef6b4af9fefc088af809f682f1$
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
            -- grass
            x=471,
            y=1,
            width=70,
            height=70,

        },
        {
            -- monstro
            x=403,
            y=1,
            width=66,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- morro
            x=1,
            y=1,
            width=92,
            height=96,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa1
            x=95,
            y=1,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa2
            x=175,
            y=1,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa3
            x=335,
            y=1,
            width=66,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa4
            x=255,
            y=1,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
    },
    
    sheetContentWidth = 542,
    sheetContentHeight = 98
}

SheetInfo.frameIndex =
{

    ["grass"] = 1,
    ["monstro"] = 2,
    ["morro"] = 3,
    ["princesa1"] = 4,
    ["princesa2"] = 5,
    ["princesa3"] = 6,
    ["princesa4"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
