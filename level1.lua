-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------
--local sprite = require( "sprite" )
local composer = require( "composer" )
local scene = composer.newScene()
local mte = require( "MTE.mte" ).createMTE()
-- include Corona's "physics" library


display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )


local physicsData = (require "sprites.vertexes").physicsData(1)


system.activate( "multitouch" )





-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX


local function onCollision(self, event)
	if(event.other.name == "ground" and event.phase == "began") then
		player.jumping = false
	end
end




function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	mte.enableBox2DPhysics()
	mte.physics.start()
	mte.physics.setGravity(0, 3)
	--mte.physics.setDrawMode("hybrid")

	-- We need physics started to add bodies, but we don't want the simulaton
	-- running until the scene is on the screen.
	--physics.pause()


	-- create a grey rectangle as the backdrop
	-- the physical screen will likely be a different shape than our defined content area
	-- since we are going to position the background from it's top, left corner, draw the
	-- background at the real top, left corner.
	
	
	mte.toggleWorldWrapX(false)
	mte.toggleWorldWrapY(false)
	mte.loadMap("mapa.tmx")
	mte.drawObjects()
	map = mte.setCamera({levelPosX = 0, levelPosY = 0,blockScale = 15.5})
	mte.constrainCamera()


--[[	local background = display.newImageRect( "sprites/floresta.png", display.actualContentWidth, display.actualContentHeight)
	background.anchorX = 0.08
	background.anchorY = 0
	background:setFillColor( .8 )

	local chao = display.newRect(1,display.actualContentHeight-45,display.contentWidth*3, 1)

	physics.addBody(chao, "static", { friction = 0.1})

]]--
--------------------MOVIMENTAÇÃO SPRITES------------------------

	local SheetInfo = require("sprites.sprites")
	--local sheetData = {width=78, height=96, numFrames=3}

	local sheet = graphics.newImageSheet("sprites/sprites.png", SheetInfo:getSheet())

	local sequencePrincesa = {
		{ name = "princesaParada", frames={6,7}, time = 1000, loopCount = 0},
		{ name = "princesaAndando", frames={10,11}, time = 900, loopCount = 0},
		{ name = "trans", frames={2,3}, time= 900,loopCount = 0 },
	}

	local morro = {
		{ name = "morro", frames={1}, time = 1000, loopCount = 0 },
	}

	local playerProperties = mte.getObject({name = "player"})

	local player = display.newSprite(sheet, sequencePrincesa)
	local setup = {
			kind = "sprite",
			layer = 1,
			levelWidth = 60,
			levelHeight = 60,
			levelPosX = playerProperties[1].x, 
			levelPosY = playerProperties[1].y
}

	--player.x = display.contentWidth * .1
	--player.y = 218
	
	mte.physics.addBody(player, "dynamic", {friction = 0.2, bounce = 0.0, density = 0.4 })
	mte.addSprite(player, setup)
	mte.setCameraFocus(player)
	--player:setSequence("princesaParada")
	player.isFixedRotation = true
	player.collision = onCollision
 	player:addEventListener("collision")
	
	-- make a princesa (off-screen), position it, and rotate slightly
	--local princesa = display.newImageRect( "sprites/princesa1.png", 90, 90 )
	--princesa.x, princesa.y = 130, 230
	--princesa.myName = "princesa1"
	--physics.addBody( princesa, physicsData:get("princesa1"))

	--local monstro = display.newImageRect( "sprites/monstro.png", 100, 100 )
	--monstro.x, monstro.y = 300, 235
	--monstro.myName = "monstro"
	--physics.addBody( monstro, "static",physicsData:get("monstro"))

	--local morro = display.newSprite(sheet, morro)

	--morro.x, morro.y = 400, 242
	--mte.physics.addBody(morro, "static", { friction = 0.1})
	--morro:setSequence("morro")

	
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

	buttons[3] = display.newImage("gamepad.png")
	buttons[3].x = 400
	buttons[3].y = 300
	buttons[3].myName = "trans"

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
				if(not player.jumping) then
					player.jumping = true
					player:applyLinearImpulse(0, -0.6, player.x, player.y)
				end
			elseif e.target.myName == "trans" then
				player:setSequence("trans")
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
		mte.update()
	end

	Runtime:addEventListener("enterFrame", update)


	--function focusCameraInRen()
	--	mte.setCameraFocus(player, 0, 226)
	--end



	-- add physics to the princesa
	
	
	-- all display objects must be inserted int group
	--sceneGroup:insert( background )
	sceneGroup:insert( map )
	--sceneGroup:insert( morro )
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