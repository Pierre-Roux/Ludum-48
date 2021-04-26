require("hero")
require("ennemis")
require("scoreboard")
require("map")
require("camera")
require("shoot")
require("shaders")
require("ui")

playState = "play"

function loadGame()
  initMap()
  loadGlobals()
  loadHero()
  loadShoot()
  loadEnnemis()
  Level = 1
  gameScore = 0
  dangerFactor = 0
  love.audio.stop(MusiqueLoop)
  love.audio.play(MusiqueLoop)
  MusiqueStart:setVolume(0.5)
  shader = love.graphics.newShader(shader_code)
end

function updateGame(dt)
  if not MusiqueStart:isPlaying() then
    love.audio.play(MusiqueLoop)
  end
  if playState == "play" then
    -- Camera
    camera.x = (hero.x - 1280/2)
    camera.y = (hero.y - 720/2)
    -- Hero and ennemies
    updateShoot(dt)
    updateHero(dt)
    inputHero(dt)
    shootHero(dt)
    updateEnnemis(dt)
    if hero.dead == true then
      playState = "scoreboard"
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
    if key == "r" then
      playState = "scoreboard"
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
  local xbg = 0
  for i=1,5 do
    love.graphics.draw(img,xbg,0,0)
    xbg = xbg + 1280
  end
end

function initNextLevel()
  Level = Level + 1
  dangerFactor = dangerFactor + 5
  initMap()
  loadGlobals()
  loadHero()
  loadShoot()
  loadEnnemis(dangerFactor)

end

function loadGlobals()
  globalBulletID = 1
  globalDroneID = 1
end