--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:00ac5812793d5b3e0eb38ed221a1fe5e:32031454c6cf366fd3c2976fb1a48ccc:ce59e0ef6b4af9fefc088af809f682f1$
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
            x=173,
            y=197,
            width=66,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- monstro2
            x=171,
            y=285,
            width=66,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- monstro3
            x=89,
            y=281,
            width=80,
            height=86,

            sourceX = 16,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- monstro4
            x=89,
            y=193,
            width=82,
            height=86,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa1
            x=1,
            y=373,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa2
            x=81,
            y=373,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa3
            x=177,
            y=1,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa4
            x=177,
            y=99,
            width=62,
            height=96,

            sourceX = 8,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- princesa5
            x=161,
            y=373,
            width=78,
            height=96,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans1
            x=1,
            y=1,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans2
            x=89,
            y=1,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans3
            x=1,
            y=97,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans4
            x=89,
            y=97,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- trans5
            x=1,
            y=193,
            width=86,
            height=94,

            sourceX = 8,
            sourceY = 2,
            sourceWidth = 96,
            sourceHeight = 96
        },
    },
    
    sheetContentWidth = 240,
    sheetContentHeight = 470
}

SheetInfo.frameIndex =
{

    ["monstro1"] = 1,
    ["monstro2"] = 2,
    ["monstro3"] = 3,
    ["monstro4"] = 4,
    ["princesa1"] = 5,
    ["princesa2"] = 6,
    ["princesa3"] = 7,
    ["princesa4"] = 8,
    ["princesa5"] = 9,
    ["trans1"] = 10,
    ["trans2"] = 11,
    ["trans3"] = 12,
    ["trans4"] = 13,
    ["trans5"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
