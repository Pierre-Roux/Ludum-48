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
require("images")
require("sons")

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
    
    if shootTab[1] ~= nil and shootTab[2] == nil and shootTab[3] == nil then
      print(shootTab[1].id)
    elseif shootTab[1] ~= nil and shootTab[2] ~= nil and shootTab[3] == nil then
      print(shootTab[1].id,shootTab[2].id)
    elseif shootTab[1] ~= nil and shootTab[2] ~= nil and shootTab[3] ~= nil then
      print(shootTab[1].id,shootTab[2].id,shootTab[3].id)
    end

    
  end

end

function love.keypressed(key)
  
  keypressedGame(key)
  
end
  
function love.mousepressed(X,Y,key)
  
  mousepressedGame(X,Y,key)
  
end