require("hero")
require("ennemis")
require("scoreboard")
require("map")
require("camera")
require("shoot")
require("shaders")
require("ui")

playState = "play"
Level = 1

function loadGame()
  initMap()
  loadGlobals()
  fullLoadHero()
  loadShoot()
  loadEnnemis()
  Level = 1
  gameScore = 0
  dangerFactor = 0
  love.audio.stop(MusiqueLoop)
  love.audio.play(MusiqueLoop)
  MusiqueStart:setVolume(0.4)
  shader = love.graphics.newShader(shader_code)
end

function updateGame(dt)

  if playState == "play" then
    if not MusiqueStart:isPlaying() then
      love.audio.play(MusiqueLoop)
    end
    
    -- Camera
    camera.x = (hero.x - 1280/2)
    camera.y = (hero.y - 720/2)
    -- Hero and ennemies
    updateShoot(dt)
    updateHero(dt)
    updateEnnemis(dt)
    
    if livingMobs == 0 and tileTypes[13] ~= "" then
      for i=13,24 do
        tileTypes[i] = ""
      end
    end
    
    if hero.dead == true then
      playState = "scoreboard"
      loadScoreBoard()
    end
  end
  if playState == "scoreboard" then
      updateScoreBoard()
  end

end

function drawGame()
  
  if playState == "play" then
    love.graphics.setShader(shader) 
    love.graphics.setColor(0.2,0.4,0.4,1.0)
    shader:send("screen",{
        love.graphics.getWidth(),
        love.graphics.getHeight()
      })
    shader:send("num_lights", 1)
    shader:send("lights[0].position", {
        hero.x - camera.x,
        hero.y - camera.y
        })
    shader:send("lights[0].diffuse", {
        0.9, 1.0, 0.85
    })
    shader:send("lights[0].power", 64)
    
    camera:set()
    drawBackground(background)
    drawMap()
    drawShoot()
    drawHero()
    drawEnnemis()
    camera:unset()
    drawUI()
  end
  love.graphics.setShader() 
    
  if playState == "scoreboard" then
    drawScoreBoard()
  end
end

function keypressedGame(key)
  if playState == "play" then
    jumpHero()
    if key == "a" then
      twoDimMap = twoDimMap -1
    end
    if key == "e" then
      twoDimMap = twoDimMap +1
    end
    if key == "x" then
      hero.weapon = "rifle"
    end
    if key == "w" then
      hero.weapon = "gun"
    end
    if key == "c" then
      hero.weapon = "machinegun"
    end
  end
  if playState == "scoreboard" then
    if key == "space" then
      loadGame()
      playState = "play"
    end
  end
end

function mousepressedGame(X,Y,key)
  
end

function drawBackground(img)
  love.graphics.draw(img,0,0,0)
end

function openDoor()
  
end

function initNextLevel()
  Level = Level + 1
  initMap()
  loadGlobals()
  partialLoadHero()
  loadShoot()
  loadEnnemis()
end

function nextMapL()
  twoDimMap = twoDimMap - 1
  initPartialMap()
  loadGlobals()
  partialLoadHero()
  loadShoot()
  loadEnnemis()
end

function nextMapR()
  twoDimMap = twoDimMap + 1
  initPartialMap()
  loadGlobals()
  partialLoadHero()
  loadShoot()
  loadEnnemis()
end

function loadGlobals()
  globalBulletID = 1
  globalDroneID = 1
end