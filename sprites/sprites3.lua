--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d8850e2e4a7648ee5c37cdd34e2bae15:a354ce8e728148fa74d144d0c47acc8d:d8ba0221c747e9cded2941ab54159bdf$
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
            -- atack1
            x=93,
            y=1,
            width=78,
            height=61,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- atack2
            x=1,
            y=1,
            width=90,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (2)
            x=779,
            y=1,
            width=40,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (3)
            x=467,
            y=1,
            width=50,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (5)
            x=821,
            y=1,
            width=40,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (7)
            x=863,
            y=1,
            width=40,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (9)
            x=519,
            y=1,
            width=50,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (11)
            x=293,
            y=1,
            width=56,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (12)
            x=351,
            y=1,
            width=56,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (13)
            x=173,
            y=1,
            width=58,
            height=61,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (14)
            x=233,
            y=1,
            width=58,
            height=61,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download (15)
            x=409,
            y=1,
            width=56,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- download
            x=571,
            y=1,
            width=50,
            height=61,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- right1
            x=623,
            y=1,
            width=50,
            height=61,

            sourceX = 41,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- right2
            x=675,
            y=1,
            width=50,
            height=61,

            sourceX = 41,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- right3
            x=905,
            y=1,
            width=40,
            height=61,

            sourceX = 51,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- right4
            x=947,
            y=1,
            width=40,
            height=61,

            sourceX = 51,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
        {
            -- right5
            x=727,
            y=1,
            width=50,
            height=61,

            sourceX = 41,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 61
        },
    },
    
    sheetContentWidth = 988,
    sheetContentHeight = 63
}

SheetInfo.frameIndex =
{

    ["atack1"] = 1,
    ["atack2"] = 2,
    ["download (2)"] = 3,
    ["download (3)"] = 4,
    ["download (5)"] = 5,
    ["download (7)"] = 6,
    ["download (9)"] = 7,
    ["download (11)"] = 8,
    ["download (12)"] = 9,
    ["download (13)"] = 10,
    ["download (14)"] = 11,
    ["download (15)"] = 12,
    ["download"] = 13,
    ["right1"] = 14,
    ["right2"] = 15,
    ["right3"] = 16,
    ["right4"] = 17,
    ["right5"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
