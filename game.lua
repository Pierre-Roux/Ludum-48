require("hero")
require("ennemis")
require("scoreboard")
require("map")

playState = "play"

function loadgame()
  initMap()
  loadHero()
  loadEnnemis()
  love.audio.stop(MusiqueStart)
  --love.audio.play(MusiqueStart)
end

function updateGame(dt)
  if not MusiqueStart:isPlaying() then
    --love.audio.play(MusiqueLoop)
  end
  if playState == "play" then
    updateHero(dt)
    inputHero(dt)
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
    love.graphics.translate((-hero.x + 1280/2), (-hero.y + 720/2))
    drawMap()
    drawHero()
    drawEnnemis()
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