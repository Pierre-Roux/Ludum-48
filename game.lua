require("hero")
require("ennemis")
require("scoreboard")


playState = "play"

function loadgame()
  loadHero()
  loadEnnemis()
end

function updateGame(dt)
  
  if playState == "play" then
    updateHero(dt)
    inputHero(dt)
    jumpHero(dt)
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
    drawHero()
    drawEnnemis()
  end
  if playState == "scoreboard" then
    drawScoreBoard()
  end
  print("flute")
end

function keypressedGame(key)
  if playState == "play" then

  end
  if playState == "scoreboard" then
    if key == "space" then
      loadgame()
      playState = "play"
    end
  end
end