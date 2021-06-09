require("ennemis/drone")

globalAnimID = 1

ennemis = {}
dieAnimation = {}
livingMobs = 0

function loadEnnemis()
  initEnnemis()

end

function updateEnnemis(dt)

  -- boucle de vérification des mobs en vie
  livingMobs = 0
  for k,mob in ipairs(ennemis) do
    if mob.label == "drone" then
      livingMobs = livingMobs + 1
    end
  end
  
  if livingMobs ~= 0 then
    love.audio.play(Swarm)
    Swarm:setVolume(0.30)
  else
    love.audio.stop(Swarm)
  end

  -- Boucle de gestion des mobs
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
  
  -- Boucle de gestion des décès
  for k,anim in ipairs(dieAnimation) do
    if anim.frameCounter >= 1 then
      if anim.currentFrame < #anim.animationTable then
        anim.currentFrame = anim.currentFrame + 1
      end
      if anim.currentFrame >= #anim.animationTable then
        table.remove(dieAnimation,anim.id)
        for i=anim.id,#dieAnimation do
          dieAnimation[i].id = dieAnimation[i].id - 1
        end
        globalAnimID = globalAnimID - 1
      end
      anim.frameCounter = 0
    end
    anim.frameCounter = anim.frameCounter + (15 * dt)
  end
end

function drawEnnemis()
  displayEnnemis()
  displayDieAnim()
end

function initEnnemis()
  ennemis = {}
  livingDrone = 0
  nbDrone = 2 + Level
  xSpawn = 0
  ySpawn = 0
  for i=1, nbDrone do
    xSpawn = math.random(screenWidth)
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

function createDieAnimation(x,y,ennemisType)
  if ennemisType == "drone" then
    
    love.audio.play(DroneExplosion)
    DroneExplosion:setVolume(1)
    
    local oneDrone = {}
    oneDrone.id = globalAnimID
    oneDrone.x = x
    oneDrone.y = y
    oneDrone.width = 76
    oneDrone.height = 62
    oneDrone.sheet = ExploDroneSheet
    oneDrone.animationTable = ExploDroneTexture
    oneDrone.frameCounter = 0
    oneDrone.currentFrame = 1
    table.insert(dieAnimation ,oneDrone)
    globalAnimID = globalAnimID + 1
  end
end

function displayDieAnim()

  for k,anim in ipairs(dieAnimation) do
    love.graphics.draw(anim.sheet,anim.animationTable[anim.currentFrame],anim.x,anim.y,0,1,1,anim.width/2,anim.height/2)
  end

end