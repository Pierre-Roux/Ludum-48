function displayHPBar()
  love.graphics.draw(imgHPBar,15,15,0,1,1)
  local barSize = (imgHP:getWidth()) * (hero.life/hero.lifeMax)
  if barSize >= 0 then
    local barQuad = love.graphics.newQuad(0,0,barSize,imgHP:getHeight(),imgHP:getWidth(),imgHP:getHeight())
    love.graphics.draw(imgHP,barQuad,100,50)
  end
end

function displayScore()
  love.graphics.print("SCORE : ",50,100,0,2,2)
  love.graphics.print(gameScore,150,100,0,2,2)
  love.graphics.print("LEVEL : ",250,100,0,2,2)
  love.graphics.print(Level,350,100,0,2,2)
end

function drawUI()
  displayHPBar()
  displayScore()
end