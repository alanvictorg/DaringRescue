-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local mte = require( "lib.MTE.mte" ).createMTE()
local widget = require ("widget")
local physics = require "physics"
local progressRing = require("lib.progressRing")

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
local currentChar

local function inimigosUpdate (inimigo, player)
	local camX, camY = mte.getCamera().levelPosX, mte.getCamera().levelPosY
	local startCamX, startCamY = camX - screenW / 2, camY - screenH / 2;
	local isEnemyOnScreen = inimigo.x > startCamX and inimigo.x < startCamX + screenW
	local screenW, screenH = display.contentWidth, display.contentHeight;

	if isEnemyOnScreen then
		if player.x < inimigo.x then

			--follow left

			inimigo:setSequence("inimigo")

			inimigo.x = inimigo.x - 2

		elseif player.x > inimigo.x then

			--follow right

			inimigo:setSequence("inimigo")

			inimigo.x = inimigo.x + 2

		end
	end
	inimigo:play()
end


local function oncollision( self, event )
	if (event.other.name == "ground" and event.phase == "began") then
		player.canJump = 0  
    elseif (event.other.myName == "inimigo") then
    	if (event.phase == "began") then
    		player.hpBonus = -1
    	else
    		player.hpBonus = 0
    	end
	end
end


local function die()
	audio.stop()
	player:removeSelf()
	inimigo:removeSelf()
	mte.physics.setGravity(0, 0)
	local options = {
		effect = "fade",
		time = 500,
		params = {}
	}
	composer.removeScene("level1")
	composer.gotoScene("gameover", options)
end


local function setupStatus()
	if hpRect ~= nil then
		hpRect:removeSelf()
	end

	player.hp = player.hp + player.hpBonus

	hpRect = display.newRoundedRect(0, 20, player.hp, 10, 12)
	hpRect.anchorX = 0
	hpRect:setFillColor(1, 0, 0)

	if player.hp <= 0 then
		die()
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
	
------------------------ CARREGANDO MAPA ---------------------------------

	mte.toggleWorldWrapX(false)
	mte.toggleWorldWrapY(false)
	mte.loadMap("maps/mapa.tmx")
	mte.drawObjects()
	local map = mte.setCamera({levelPosX = 0, levelPosY = 0,blockScale = 14.5})
	mte.constrainCamera()

-------------------- ADICIONANDO PLAYER E INIMIGO ------------------------

	local SheetInfo = require("sprites.spritesGame")
	
	local sheet = graphics.newImageSheet("sprites/spritesGame.png", SheetInfo:getSheet())

	local sequencePrincesa = {
		{ name = "princesaParada", frames={7,8}, time = 1000, loopCount = 0},
		{ name = "walkRight", frames={21,22,23,24}, time = 900, loopCount = 0},
		{ name = "trans", frames={10,11}, time= 900,loopCount = 0 },
		{ name = "walkLeft", frames={15,16,17,18,19,20}, time = 900, loopCount = 0},
		{ name = "transAndando", frames={10,11,12,13,14}, time= 900,loopCount = 0 },
	}

	local sequenceInimigo = {
		{ name = "inimigo", frames ={3,4,5,6}, time = 1000, loopCount = 0 },
	}

	local principe = {
		{ name = "principe", frames ={9}, time = 1000, loopCount = 0 },
	}

	local playerProperties = mte.getObject({name = "player"})

	local playerPropertiesI = mte.getObject({name = "inimigo"})

	local playerPropertiesII = mte.getObject({name = "principe"})

	player = display.newSprite(sheet, sequencePrincesa)
	
	inimigo = display.newSprite(sheet, sequenceInimigo)

	principe = display.newSprite(sheet, principe)


	local setup = {
			kind = "sprite",
			layer = 1,	
			levelPosX = playerProperties[1].x, 
			levelPosY = playerProperties[1].y,
			
	}

	local setupI = {
			kind = "sprite",
			layer = 1,	
			levelPosX = playerPropertiesI[1].x, 
			levelPosY = playerPropertiesI[1].y,
			
	}

	local setupII = {
			kind = "sprite",
			layer = 1,	
			levelPosX = playerPropertiesII[1].x, 
			levelPosY = playerPropertiesII[1].y,
			
	}

	

	mte.physics.addBody(player, "dynamic", {friction = 0.2, bounce = 0.0, density = 2 })
	mte.physics.addBody(inimigo, "dynamic", {friction = 0.2, bounce = 0.0, density = 2 })
	mte.physics.addBody(principe, "dynamic", {friction = 0.2, bounce = 0.0, density = 2 })

	

	mte.addSprite(player, setup)
	mte.addSprite(inimigo, setupI)
	mte.addSprite(principe, setupII)
	
	mte.setCameraFocus(player)
	mte.update()
	player:setSequence("princesaParada")
	player.myName = "player"
	--player.xScale = 1.70
	--player.yScale = 1.70
	player:play()
	player.transformou = false
	player.isFixedRotation = true
	player.canJump = 0
	player.hp = 100
	player.hpBonus = 0
	player.collision = oncollision
	player:addEventListener( "collision")
	
	inimigo:setSequence("inimigo")
	inimigo.myName = "inimigo"
	inimigo:play()
	transition.moveTo(inimigo , {player.x, player.y, time=100})
	
	setupStatus()
	
--------------------- TRANSFORMAR PLAYER --------------------------------------

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

				relogio.x, relogio.y = 450, 40
				sceneGroup:insert( relogio )
			else
				player:setSequence("princesaParada")
				player:play()
			end
		end
	end

--------------------------- PULO --------------------------------------

	local function jump( event )
		if(player.canJump < 1) then
			player.canJump = player.canJump + 1
			player:applyLinearImpulse(0, -170, player.x, player.y)
			audio.play( soundTable["jump"], {loops=1})
		end
	end
	
	

--------------------- BOTÕES ------------------------------------------
	
	local botaoTran = widget.newButton({
		defaultFile = "icons/buttonY.png",
		x = 400,
		y = 300,
		onEvent = functionTrans
	})
	
	local jumpbtn = widget.newButton({
		defaultFile = "icons/arrowUp.png",
		x = 15,
		y = 297,
		onRelease = jump
	})

	local botaoAtaque = widget.newButton({
		defaultFile = "icons/buttonX.png",
		x = 490,
		y = 300,
		--onEvent = functionAtack
	})
	
	local buttons = {}

	buttons[1] = display.newImage("icons/arrowRight.png")
	buttons[1].x = 60
	buttons[1].y = 300
	buttons[1].myName = "right"

	buttons[2] = display.newImage("icons/arrowLeft.png")
	buttons[2].x = -27
	buttons[2].y = 300
	buttons[2].myName = "left"

	passosX = 0
	passosY = 0


	local touchFunction = function(e)
		if e.phase == "began" or e.phase == "moved" then
			if e.target.myName == "right" then
				if (player.transformou) then
					player:setSequence("transAndando")
					passosX = 3
					passosY = 0
				else
					player:setSequence("walkRight")
					passosX = 3
					passosY = 0
				end
				else if e.target.myName == "left" then
					if (player.transformou) then
					player:setSequence("transAndando")
					passosX = -3
					passosY = 0
					else
						player:setSequence("walkLeft")
						passosX = -3
						passosY = 0
					end
				end
			end
		else if (player.transformou) then
			passosX = 0
			player:setSequence("trans")
			player:play()
			else
				passosX = 0
				player:setSequence("princesaParada")
				player:play()
			end
		end
	end


	local j=1

	for j=1, #buttons do 
		buttons[j]:addEventListener("touch", touchFunction)
	end


	sceneGroup:insert( map )
	sceneGroup:insert(hpRect)
	sceneGroup:insert(jumpbtn)
	sceneGroup:insert(botaoTran)
	sceneGroup:insert(botaoAtaque)
	sceneGroup:insert(buttons[1])
	sceneGroup:insert(buttons[2])

end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
	elseif phase == "did" then
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
	local sceneGroup = self.view
	package.loaded[physics] = nil
	physics = nil
	
	Runtime:removeEventListener("enterFrame", update)

	
	
end


function update(event)
	
	setupStatus()
	player.x = player.x + passosX
	player:play()
	inimigosUpdate(inimigo, player)
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