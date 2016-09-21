--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1ef9efa67bf0f2123a6f943524024a7c:87e035bde824526ff73b6582e42c1fd6:ce59e0ef6b4af9fefc088af809f682f1$
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
            x=727,
            y=1,
            width=70,
            height=70,

        },
        {
            -- guerreira
            x=531,
            y=1,
            width=62,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- guerreira1
            x=595,
            y=1,
            width=62,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- monstro
            x=659,
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
        {
            -- princesa5
            x=403,
            y=1,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa6
            x=467,
            y=1,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
    },
    
    sheetContentWidth = 798,
    sheetContentHeight = 98
}

SheetInfo.frameIndex =
{

    ["grass"] = 1,
    ["guerreira"] = 2,
    ["guerreira1"] = 3,
    ["monstro"] = 4,
    ["morro"] = 5,
    ["princesa1"] = 6,
    ["princesa2"] = 7,
    ["princesa3"] = 8,
    ["princesa4"] = 9,
    ["princesa5"] = 10,
    ["princesa6"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
