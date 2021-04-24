-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

require("menu")
require("game")

gameState = "Menu"

function love.load()
  
  love.window.setTitle("AwesomeGame")
  love.window.setMode(1600, 900)
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()
  print(screenWidth, screenHeight)
  
end

function love.update(dt)

  if gameState == "Menu" then
    updateMenu()
  end

  if gameState == "Game" then
    updateGame(dt)
  end

end

function love.draw()
  
  if gameState == "Menu" then
    drawMenu()
  end

  if gameState == "Game" then
    drawGame()
  end

end

function love.keypressed(key)
  
  print(key)
  
end
  