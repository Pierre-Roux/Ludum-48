-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

require("utils")
require("menu")
require("game")

gameState = "Game"

function love.load()
  
  love.window.setTitle("AwesomeGame")
  love.window.setMode(1280, 720)
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()
  print(screenWidth, screenHeight)
  
  loadgame()
  
end

function love.update(dt)

  if gameState == "Menu" then
    updateMenu(dt)
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
  
  keypressedGame()
  print(dt)
  
end
  