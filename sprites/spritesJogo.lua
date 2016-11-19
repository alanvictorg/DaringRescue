--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0b9744a8eb67586db77b8ff6e669dd0c:083179cf6caffd4c03b38345e37f02fb:31a4d6b0900af683da9ecf51ce19d15d$
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
            -- atack
            x=1117,
            y=1,
            width=88,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- atack1
            x=1207,
            y=1,
            width=88,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- inimigo1
            x=1727,
            y=1,
            width=66,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- inimigo2
            x=1795,
            y=1,
            width=66,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- inimigo3
            x=1645,
            y=1,
            width=80,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- inimigo4
            x=1561,
            y=1,
            width=82,
            height=86,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- parada1
            x=1,
            y=1,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- parada2
            x=81,
            y=1,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- principe
            x=481,
            y=1,
            width=66,
            height=96,

            sourceX = 16,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans
            x=1297,
            y=1,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans1
            x=1385,
            y=1,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- transWalk1
            x=933,
            y=1,
            width=90,
            height=94,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- transWalk2
            x=1025,
            y=1,
            width=90,
            height=94,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- transWalk3
            x=1473,
            y=1,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkLeft1
            x=161,
            y=1,
            width=78,
            height=96,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkLeft2
            x=549,
            y=1,
            width=62,
            height=96,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkLeft3
            x=241,
            y=1,
            width=78,
            height=96,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkLeft4
            x=613,
            y=1,
            width=62,
            height=96,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkLeft5
            x=677,
            y=1,
            width=62,
            height=96,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkLeft6
            x=321,
            y=1,
            width=78,
            height=96,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkRight1
            x=741,
            y=1,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkRight2
            x=805,
            y=1,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkRight3
            x=869,
            y=1,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- walkRight4
            x=401,
            y=1,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
    },
    
    sheetContentWidth = 1862,
    sheetContentHeight = 98
}

SheetInfo.frameIndex =
{

    ["atack"] = 1,
    ["atack1"] = 2,
    ["inimigo1"] = 3,
    ["inimigo2"] = 4,
    ["inimigo3"] = 5,
    ["inimigo4"] = 6,
    ["parada1"] = 7,
    ["parada2"] = 8,
    ["principe"] = 9,
    ["trans"] = 10,
    ["trans1"] = 11,
    ["transWalk1"] = 12,
    ["transWalk2"] = 13,
    ["transWalk3"] = 14,
    ["walkLeft1"] = 15,
    ["walkLeft2"] = 16,
    ["walkLeft3"] = 17,
    ["walkLeft4"] = 18,
    ["walkLeft5"] = 19,
    ["walkLeft6"] = 20,
    ["walkRight1"] = 21,
    ["walkRight2"] = 22,
    ["walkRight3"] = 23,
    ["walkRight4"] = 24,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
