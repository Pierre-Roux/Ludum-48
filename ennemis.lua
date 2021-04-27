require("ennemis/drone")

ennemis = {}

function loadEnnemis(dangerFactor)
  initEnnemis(dangerFactor)

end

function updateEnnemis(dt)

  livingDrone = 0
  for k,mob in ipairs(ennemis) do
    if mob.label == "drone" then
      livingDrone = livingDrone + 1
    end
  end
  
  if livingDrone ~= 0 then
    love.audio.play(Swarm)
    Swarm:setVolume(0.30)
  else
    love.audio.stop(Swarm)
  end

  for k,mob in ipairs(ennemis) do
    if mob.label == "drone" then
      updateDrone(mob,dt)
      if collide(mob, hero) then
        if mob.reload == false then
          mob.reload = true
          hero.life = hero.life - 1
        end
      end 
    end
    
    if mob.label == "autre" then
    end
  end

end

function drawEnnemis()
  displayEnnemis()
end

function initEnnemis(dangerFactor)
  ennemis = {}
  livingDrone = 0
  nbDrone = 10
  xSpawn = 0
  ySpawn = 0
  for i=1, nbDrone do
    xSpawn = math.random(screenWidth*5)
    while xSpawn < (screenWidth*2) and xSpawn > (screenWidth*3) do
      xSpawn = math.random(screenWidth*5)
    end
    ySpawn = math.random(screenHeight)
    createDrone(xSpawn ,ySpawn)
  end

end

function displayEnnemis()

  for k,mob in ipairs(ennemis) do
    love.graphics.draw(mob.sprite,mob.x,mob.y,mob.delta,1,1,mob.sprite:getWidth()/2,mob.sprite:getHeight()/2)
    --love.graphics.print(mob.id,mob.x,mob.y,0,3,3)
  end
  
end