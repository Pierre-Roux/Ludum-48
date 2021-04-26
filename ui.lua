function displayHPBar()
  love.graphics.draw(imgHPBar,50,50,0,1,1)
  local barSize = (imgHP:getWidth()) * (hero.life/hero.lifeMax)
  if barSize >= 0 then
    local barQuad = love.graphics.newQuad(0,0,barSize,imgHP:getHeight(),imgHP:getWidth(),imgHP:getHeight())
    love.graphics.draw(imgHP,barQuad,50,50)
  end
end

function drawUI()
  displayHPBar()
end