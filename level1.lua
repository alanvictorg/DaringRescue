-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------
--local sprite = require( "sprite" )
local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start()

physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")

local physicsData = (require "sprites.vertexes").physicsData(1.0)





-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- We need physics started to add bodies, but we don't want the simulaton
	-- running until the scene is on the screen.
	physics.pause()


	-- create a grey rectangle as the backdrop
	-- the physical screen will likely be a different shape than our defined content area
	-- since we are going to position the background from it's top, left corner, draw the
	-- background at the real top, left corner.
	



	local background = display.newImageRect( "sprites/floresta.png", display.actualContentWidth, display.actualContentHeight)
	background.anchorX = 0.08
	background.anchorY = 0
	background:setFillColor( .8 )

	local chao = display.newRect(1,display.actualContentHeight-45,display.contentWidth*3, 1)

	physics.addBody(chao, "static", { friction = 0.1})


--------------------MOVIMENTAÇÃO SPRITES------------------------

	local SheetInfo = require("sprites.sprites")
	--local sheetData = {width=78, height=96, numFrames=3}

	local sheet = graphics.newImageSheet("sprites/sprites.png", SheetInfo:getSheet())

	local sequencePrincesa = {
		{ name = "princesaParada", frames={4,5}, time = 1000, loopCount = 0},
		{ name = "princesaAndando", frames={4,5,6,7}, time = 900, loopCount = 0},

	}

	local morro = {
		{ name = "morro", frames={1}, time = 1000, loopCount = 0 },
	}

	local player = display.newSprite(sheet, sequencePrincesa)

	player.x = display.contentWidth * .1
	player.y = 229
	player:setSequence("princesaParada")
	
	-- make a princesa (off-screen), position it, and rotate slightly
	--local princesa = display.newImageRect( "sprites/princesa1.png", 90, 90 )
	--princesa.x, princesa.y = 130, 230
	--princesa.myName = "princesa1"
	--physics.addBody( princesa, physicsData:get("princesa1"))

	--local monstro = display.newImageRect( "sprites/monstro.png", 100, 100 )
	--monstro.x, monstro.y = 300, 235
	--monstro.myName = "monstro"
	--physics.addBody( monstro, "static",physicsData:get("monstro"))

	local morro = display.newSprite(sheet, morro)

	morro.x, morro.y = 400, 242
	morro:setSequence("morro")


	--local morro = display.newImageRect( "sprites/morro.png", 90, 90 )
	--morro.x, morro.y = 400, 230
	--morro.myName = "morro"
	--physics.addBody(morro, "static", physicsData:get("morro"))

	local buttons = {}

	buttons[1] = display.newImage("arrowRight.png")
	buttons[1].x = 490
	buttons[1].y = 300
	buttons[1].myName = "right"

	buttons[2] = display.newImage("arrowUp.png")
	buttons[2].x = -15
	buttons[2].y = 300
	buttons[2].myName = "up"

	local passosX = 0
	local passosY = 0

	
	--local princesa1 = sprite.newSpriteSheet("sprite.png",require("princesa1").getSpriteSheetData())
	--local spriteSet1 = sprite.newSpriteSet(princesa1, 1,8)
	--sprite.add(spriteSet1, "princesa1", 1, 6, 500, 0)
	
	--instance1 = sprite.newSprite( spriteSet1 )

	--spriteInstance.x = 480
	--spriteInstance.y = 320

	 
	--instance1:prepare("princesa1")
	--instance1:play()



	local touchFunction = function(e)
		if e.phase == "began" or e.phase == "moved" then
			if e.target.myName == "right" then
				player:setSequence("princesaAndando")
				passosX = 3
				passosY = 0
			elseif e.target.myName == "up" then
				
			end
		else
			passosX = 0
			player:setSequence("princesaParada")

		end
	end


	local j=1

	for j=1, #buttons do 
		buttons[j]:addEventListener("touch", touchFunction)
	end

	

	local update = function ()
		player.x = player.x + passosX
		player:play()
		
	end

	Runtime:addEventListener("enterFrame", update)



	-- add physics to the princesa
	
	
	-- all display objects must be inserted int group
	sceneGroup:insert( background )
	sceneGroup:insert( morro )
	sceneGroup:insert( player )
	--sceneGroup:insert( princesa )
	--sceneGroup:insert( monstro )
	

end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		physics.start()
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene