function loadHero()
  initHero()
end

function updateHero(dt)
  deplacementHero(dt)
  losingLife(dt) 
  aim()
end


  heroShader = love.graphics.newShader("shaderTest.fs")


function drawHero()
    
  love.graphics.setShader(heroShader)
  
  if hero.state == "idle" then
    if hero.direction == "right" then
      love.graphics.draw(hero.animSprite,hero.x,hero.y,0,1,1,hero.animSprite:getWidth()/2,hero.animSprite:getHeight()/2)
      love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
    else
      love.graphics.draw(hero.animSprite,hero.x,hero.y,0,-1,1,hero.animSprite:getWidth()/2,hero.animSprite:getHeight()/2)
      love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,-1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
    end
  elseif hero.state == "run" then
    if hero.direction == "right" then
      love.graphics.draw(runSheet,hero.animSprite,hero.x,hero.y,0,1,1,73/2,79/2)
      love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
    else
      love.graphics.draw(runSheet,hero.animSprite,hero.x,hero.y,0,-1,1,73/2,79/2)
      love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,-1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
    end
  end
  

  --love.graphics.setShader()

  --love.graphics.rectangle("fill",hero.x,hero.y,2,2)
  
  --love.graphics.rectangle("fill",hero.x,hero.y + hero.sprite:getHeight()/2,5,5)
  --love.graphics.rectangle("fill",hero.x,hero.y - hero.sprite:getHeight()/2,5,5)
  --love.graphics.rectangle("fill",hero.x + hero.sprite:getWidth()/2,hero.y,5,5)
  --love.graphics.rectangle("fill",hero.x - hero.sprite:getWidth()/2,hero.y,5,5)
  
end

function initHero()
  
  dtValue = 0
  frameCounter = 0
  currentFrame = 1
  
  hero = {}
  hero.sprite = imgChara
  hero.state = "idle"
  hero.animSprite = imgChara
  hero.spritetop = imgCharatop 
  hero.delta = 0
  hero.direction = "right"
  hero.jump = false
  hero.x = screenWidth/2 + 2*(1280)
  hero.y = 50
  hero.vx = 0
  hero.vy = 0
  hero.life = 300
  hero.lifeMax = 300
  hero.dead = false
  hero.reload = false
  hero.reloadTime = 10
  hero.bonus = {}
  
end

function deplacementHero(dt)
  
  dtValue=dt
  
  oldHeroX = hero.x
  oldHeroY = hero.y
  
  IDcollision = {}
  
  if hero.x + imgChara:getWidth() < screenWidth*5 and hero.x - imgChara:getWidth() > 0 and hero.y + imgChara:getHeight() < screenHeight and hero.y - imgChara:getHeight() > 0 then
    IDcollision[1] = twoDimMap[math.floor(hero.y/32+1)][math.floor((hero.x + hero.sprite:getWidth()/2)/32 +1)]
    IDcollision[2] = twoDimMap[math.floor(hero.y/32+1)][math.floor((hero.x - hero.sprite:getWidth()/2)/32 +1)]
    IDcollision[3] = twoDimMap[math.floor((hero.y + hero.sprite:getHeight()/2)/32+1)][math.floor(hero.x/32+1)]
    IDcollision[4] = twoDimMap[math.floor((hero.y - hero.sprite:getHeight()/2)/32+1)][math.floor(hero.x/32+1)]
  end
  
  if hero.vx > 0 then
    hero.vx = hero.vx - (1500*dt)
  elseif hero.vx < 0 then
    hero.vx = hero.vx + (1500*dt)
  end
  
  if not isOnGround(hero) then
    if hero.vy < 1000 then
      hero.vy = hero.vy + (2500*dt)
    end
  end
  
  if (isSolid(IDcollision[1],twoDimMap)) or (isSolid(IDcollision[2],twoDimMap)) then
    hero.x = hero.x - (hero.vx * dt)
    hero.vx = 0
  else
    hero.x = hero.x + (hero.vx * dt)
  end
  
  if (isSolid(IDcollision[3],twoDimMap)) or (isSolid(IDcollision[4],twoDimMap)) then
    if (isSolid(IDcollision[3],twoDimMap)) then
      oldHeroY = hero.y - 3
    end
    if (isSolid(IDcollision[4],twoDimMap)) then
      oldHeroY = hero.y + 3
    end
    hero.y = oldHeroY
    hero.vy = 0
  else
    hero.y = hero.y + (hero.vy * dt)
  end

  if isOnGround(hero) then
    hero.jump = false
  end  
  
  if hero.y + imgChara:getHeight() > screenHeight then
    hero.jump = false
    oldHeroY = hero.y - 3
    hero.y = oldHeroY
    hero.vy = 0
  end
  
  if hero.y - imgChara:getHeight() < 0 then
    oldHeroY = hero.y + 3
    hero.y = oldHeroY
    hero.vy = 0
  end
  
  nextLevel()
end

function nextLevel() 
  
  if hero.y + imgChara:getHeight() > screenHeight and livingDrone <= 0 then
    initNextLevel()
  end
  
end

function inputHero(dt)
  
  if hero.vx < 600 then
    if love.keyboard.isDown("d") then
      hero.vx = hero.vx + (2400 * dt)
    end
  end

  if hero.vx > -600 then
    if love.keyboard.isDown("q") then
      hero.vx = hero.vx - (2400 * dt)
    end  
  end
  
  if love.keyboard.isDown("d") then
    animate(dt)
  elseif love.keyboard.isDown("q") then
    animate(dt)
  else
    hero.state = "idle"
    hero.animSprite = imgChara
  end  
end

function animate(dt)
  
  if frameCounter >= 1 then
    currentFrame = currentFrame + 1
    if currentFrame >= 13 then
      currentFrame = 1
    end
    frameCounter = 0
  end

  if currentFrame == 2 and isOnGround(hero) and played1 == false then
    DecodeStep1= love.sound.newDecoder("sons/Footsteps/sd_footstep1_long.wav")
    Step1 = love.audio.newSource(DecodeStep1,"stream")
    love.audio.play(Step1)
    played1 = true
  end
  
  if currentFrame == 7 and isOnGround(hero) and played2 == false then
    DecodeStep2= love.sound.newDecoder("sons/Footsteps/sd_footstep2_long.wav")
    Step2 = love.audio.newSource(DecodeStep2,"stream")
    love.audio.play(Step2)
    played2 = true
  end
  
  if currentFrame == 12 then
    played1 = false
    played2 = false
  end
  
  frameCounter = frameCounter + (15 * dt)
  hero.state = "run"
  hero.animSprite = runTexture[currentFrame]
end

function jumpHero()
  if love.keyboard.isDown("space") then
    if hero.jump == false then
      hero.vy = hero.vy - (70000 * dtValue)
      hero.jump = true
      DecodeJump = love.sound.newDecoder("sons/sd_character_jump.wav")
      Jump = love.audio.newSource(DecodeJump,"stream")
      love.audio.play(Jump)
      Jump:setVolume(3)
    end
  end
end

function losingLife(dt)
  if hero.life >= 0 then
      hero.life =  hero.life - (2 * dt)
  end
  if hero.life <= 0 then
    hero.dead = true
  end
end

function aim()
  x, y = love.mouse.getPosition()
  X = x + hero.x - screenWidth/2
  Y = y + hero.y - screenHeight/2
  hero.delta = math.angle(X,Y,hero.x-30,hero.y-30) + 3
  if hero.delta >= 1.5 and hero.delta <= 4.5 then
    hero.direction = "left"
  else
    hero.direction = "right"
  end
end

function shootHero(dt)
  local xShoot = 0
  local yShoot = 0
  if love.mouse.isDown(1) then
    if hero.reload == true then
      if hero.reloadTime <= 0 then
        hero.reload = false
        hero.reloadTime = 6
      else
        hero.reloadTime = hero.reloadTime - (50*dt)
      end
    else
      xShoot = hero.x + 0
      yShoot = hero.y - 22
      createBullet(xShoot,yShoot,hero.delta) 
      hero.reload = true
      DecodeGunShoot= love.sound.newDecoder("sons/sd_gun_shot.wav")
      GunShoot = love.audio.newSource(DecodeGunShoot,"stream") 
      love.audio.play(GunShoot)
      GunShoot:setVolume(0.7)
    end
  end
  

end