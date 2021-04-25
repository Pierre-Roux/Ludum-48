require("hero")
require("ennemis")
require("scoreboard")
require("map")
require("camera")
require("shoot")

playState = "play"

function loadgame()
  initMap()
  loadHero()
  loadShoot()
  loadEnnemis()
  love.audio.stop(MusiqueStart)
  --love.audio.play(MusiqueStart)
end

function updateGame(dt)
  if not MusiqueStart:isPlaying() then
    --love.audio.play(MusiqueLoop)
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
    camera:set()
    love.graphics.draw(background,0,0,0)
    drawMap()
    drawHero()
    drawEnnemis()
    camera:unset()
  end
  if playState == "scoreboard" then
    drawScoreBoard()
  end
end

function keypressedGame(key)
  if playState == "play" then
    jumpHero()
    
  end
  if playState == "scoreboard" then
    if key == "space" then
      loadgame()
      playState = "play"
    end
  end
end

function mousepressedGame(X,Y,key)
  
end