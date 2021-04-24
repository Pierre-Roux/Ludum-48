require("hero")

function loadgame()
  loadHero()
end

function updateGame(dt)
  updateHero(dt)
  inputHero(dt)
  jumpHero(dt)
end

function drawGame()
  drawHero()
end

function keypressedGame()
  
end