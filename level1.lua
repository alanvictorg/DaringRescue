-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local mte = require( "MTE.mte" ).createMTE()
local widget = require ("widget")
local physics = require "physics"
local progressRing = require("progressRing")
------------------- CARREGANDO SOUNDS ---------------------------------------------------
soundTable = {
 backgroundsnd = audio.loadStream( "sounds/principal.ogg" ),
 jump = audio.loadSound ("sounds/jump.ogg"),
}

display.setDefault( "magTextureFilter", "nearest" )
display.setDefault( "minTextureFilter", "nearest" )


system.activate( "multitouch" )



-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenTop = display.screenOriginY
local screenLeft = display.screenOriginX
local screenBottom = display.screenOriginY+display.actualContentHeight
local screenRight = display.screenOriginX+display.actualContentWidth
local screenWidth = screenRight - screenLeft
local screenHeight = screenBottom - screenTop


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
	mte.physics.setGravity(0, 9.8)
	--mte.physics.setDrawMode("hybrid")
	
---------- CARREGANDO MAPA -------------------------------------------------------
	mte.toggleWorldWrapX(false)
	mte.toggleWorldWrapY(false)
	mte.loadMap("maps/mapa.tmx")
	mte.drawObjects()
	local map = mte.setCamera({levelPosX = 0, levelPosY = 0,blockScale = 14.5})
	mte.constrainCamera()
--------------------MOVIMENTAÇÃO SPRITES------------------------

	local SheetInfo = require("sprites.sprites")
	
	local sheet = graphics.newImageSheet("sprites/sprites.png", SheetInfo:getSheet())

	local sequencePrincesa = {
		{ name = "princesaParada", frames={6,7}, time = 1000, loopCount = 0},
		{ name = "princesaAndando", frames={10,11}, time = 900, loopCount = 0},
		{ name = "trans", frames={2,3}, time= 900,loopCount = 0 },
	}


	local playerProperties = mte.getObject({name = "player"})

	player = display.newSprite(sheet, sequencePrincesa)
	
	local setup = {
			kind = "sprite",
			layer = 1,	
			levelPosX = playerProperties[1].x, 
			levelPosY = playerProperties[1].y,
			
	}

	mte.physics.addBody(player, "dynamic", {friction = 0.2, bounce = 0.0, density = 2 })
	mte.addSprite(player, setup)
	mte.setCameraFocus(player)
	mte.update()
	player:setSequence("princesaParada")
	player:play()
	player.transformou = false
	player.isFixedRotation = true
	player.collision = onCollision
 	player:addEventListener("collision")
	
	

local function destransformar( event )
    	player:setSequence("princesaParada")
    	player.transformou = false
    	relogio:removeSelf()
    	relogio = nil
	end
	


	local function functionTrans( event )
		if ( "ended" == event.phase ) then
			if(not transformou) then
				player:setSequence("trans")
				player.transformou = true
				timer.performWithDelay(10000, destransformar)

				 relogio = progressRing.new({
				     radius = 30,
				     bgColor = {.29, .29, .29, 1},
				     ringColor = {243/255, 126/255, 48/255, 1},
				     ringDepth = .1,
				     strokeWidth = 2,
				     strokeColor = {1,1,1,1},
				     time = 4000,
				     topImage = "icons/relogio-bg.png"
				})

				relogio:goTo(1, 9000)

				relogio.x, relogio.y = 10, 40
				sceneGroup:insert( relogio )
	

			else
				player:setSequence("princesaParada")
				player:play()
			end
		end
	end

	
	
	
	
	local botaoTran = widget.newButton({
		defaultFile = "icons/gamepad.png",
		x = 400,
		y = 300,
		onEvent = functionTrans
	})
	




	local buttons = {}

	buttons[1] = display.newImage("icons/arrowRight.png")
	buttons[1].x = 490
	buttons[1].y = 300
	buttons[1].myName = "right"

	buttons[2] = display.newImage("icons/arrowUp.png")
	buttons[2].x = -15
	buttons[2].y = 300
	buttons[2].myName = "up"



	passosX = 0
	passosY = 0


	local touchFunction = function(e)
		if e.phase == "began" or e.phase == "moved" then
			if e.target.myName == "right" then
				player:setSequence("princesaAndando")
				passosX = 3
				passosY = 0
				
			elseif e.target.myName == "up" then
				if(not player.jumping) then
					player.jumping = true
					player:applyLinearImpulse(0, -150, player.x, player.y)
				end
			end
		else
			passosX = 0
			player:setSequence("princesaParada")
			player:play()
		end
	end


	local j=1

	for j=1, #buttons do 
		buttons[j]:addEventListener("touch", touchFunction)
	end


	sceneGroup:insert( map )
	
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
	elseif phase == "did" then
		audio.play( soundTable["backgroundsnd"], {loops=-1})
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


function update(event)
	--print("babalu", mte.physics.getGravity())
	
	player.x = player.x + passosX
	player:play()
	mte.update()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
Runtime:addEventListener("enterFrame", update)

-----------------------------------------------------------------------------------------

return scene