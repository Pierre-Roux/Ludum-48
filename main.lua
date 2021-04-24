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
  
  ScreenWidth = love.graphics.getWidth()
  ScreenHeight = love.graphics.getHeight()
  
end

function love.update(dt)

  if gameState == "Menu" then

  end

  if gameState == "Game" then
    
  end

end

function love.draw()
  
  if gameState == "Menu" then
    
  end

  if gameState == "Game" then
    
  end

end

function love.keypressed(key)
  
  print(key)
  
end
  