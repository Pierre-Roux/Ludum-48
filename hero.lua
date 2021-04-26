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
  if hero.direction == "right" then
    love.graphics.draw(runSheet,runTexture[currentFrame],hero.x,hero.y,0,1,1,73/2,79/2)
    love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
  else
    love.graphics.draw(runSheet,runTexture[currentFrame],hero.x,hero.y,0,-1,1,73/2,79/2)
    love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,-1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
  end
  --love.graphics.setShader()
  displayHPBar()

  love.graphics.rectangle("fill",hero.x,hero.y,2,2)
  
  --love.graphics.print("|",hero.x+hero.sprite:getWidth()/2,hero.y)
  --love.graphics.print("|",hero.x-hero.sprite:getWidth()/2,hero.y)
  --love.graphics.print("|",hero.x,hero.y + hero.sprite:getHeight()/2)
  --love.graphics.print("|",hero.x,hero.y - hero.sprite:getHei ght()/2)
  
  love.graphics.rectangle("fill",hero.x,hero.y + hero.sprite:getHeight()/2,5,5)
  love.graphics.rectangle("fill",hero.x,hero.y - hero.sprite:getHeight()/2,5,5)
  love.graphics.rectangle("fill",hero.x + hero.sprite:getWidth()/2,hero.y,5,5)
  love.graphics.rectangle("fill",hero.x - hero.sprite:getWidth()/2,hero.y,5,5)
  
  --love.graphics.print("<-4",oldHeroX,oldHeroY)
  
  
end

function initHero()
  
  dtValue = 0
  frameCounter = 0
  currentFrame = 1
  
  hero = {}
  hero.sprite = imgChara
  hero.spritetop = imgCharatop 
  hero.delta = 0
  hero.direction = "right"
  hero.jump = false
  hero.x = screenWidth/2 + 2*(1280)
  hero.y = 50
  hero.vx = 0
  hero.vy = 0
  hero.life = 100
  hero.lifeMax = 100
  hero.dead = false
  hero.reload = false
  hero.reloadTime = 10
  hero.weapon = ""
  hero.bonus = {}
  
end

function deplacementHero(dt)
  
  dtValue=dt
  
  oldHeroX = hero.x
  oldHeroY = hero.y -2
  
  IDcollision = {}
  
  if hero.x + imgChara:getWidth() < screenWidth*5 and hero.x - imgChara:getWidth() > 0 and hero.y + imgChara:getHeight() < screenHeight and hero.y - imgChara:getHeight() > 0 then
    IDcollision[1] = twoDimMap[math.floor(hero.y/32+1)][math.floor((hero.x + hero.sprite:getWidth()/2)/32 +1)]
    IDcollision[2] = twoDimMap[math.floor(hero.y/32+1)][math.floor((hero.x - hero.sprite:getWidth()/2)/32 +1)]
    IDcollision[3] = twoDimMap[math.floor((hero.y + hero.sprite:getHeight()/2)/32+1)][math.floor(hero.x/32+1)]
    IDcollision[4] = twoDimMap[math.floor((hero.y - hero.sprite:getHeight()/2)/32+1)][math.floor(hero.x/32+1)]
  end
  
  if hero.vx > 0 then
    hero.vx = hero.vx - (100*dt)
  elseif hero.vx < 0 then
    hero.vx = hero.vx + (100*dt)
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
    hero.y = oldHeroY
    hero.vy = 0
  else
    hero.y = hero.y + (hero.vy * dt)
  end

  

  if isOnGround(hero) then
    hero.jump = false
  end  
end

function inputHero(dt)
  
  if hero.vx < 400 then
    if love.keyboard.isDown("d") then
      hero.vx = hero.vx + (1500 * dt)
    end
  end

  if hero.vx > -400 then
    if love.keyboard.isDown("q") then
      hero.vx = hero.vx - (1500 * dt)
    end  
  end
  
  if love.keyboard.isDown("d") then
    animate(dt)
  end
  
  if love.keyboard.isDown("q") then
    animate(dt)
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

  frameCounter = frameCounter + (15 * dt)
 
  --hero.sprite = runTexture[currentFrame]
end

function jumpHero()
  if love.keyboard.isDown("space") then
    if hero.jump == false then
      hero.vy = hero.vy - (60000 * dtValue)
      hero.jump = true
    end
  end
end

function losingLife(dt)
  if hero.life >= 0 then
      --hero.life =  hero.life - (3 * dt)
  end
  if hero.life <= 0 then
    hero.dead = true
  end
end

function displayHPBar()
  love.graphics.draw(imgHPBar,50,50,0,1,1)
  local barSize = (imgHP:getWidth()) * (hero.life/hero.lifeMax)
  if barSize >= 0 then
    local barQuad = love.graphics.newQuad(0,0,barSize,imgHP:getHeight(),imgHP:getWidth(),imgHP:getHeight())
    love.graphics.draw(imgHP,barQuad,50,50)
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
        hero.reloadTime = 10
      else
        hero.reloadTime = hero.reloadTime - (50*dt)
      end
    else
      xShoot = hero.x + 0
      yShoot = hero.y + 0
      createBullet(xShoot,yShoot,hero.delta) 
      hero.reload = true
      DecodeGunShoot= love.sound.newDecoder("sons/sd_gun_shot.wav")
      GunShoot = love.audio.newSource(DecodeGunShoot,"stream") 
      love.audio.play(GunShoot)
    end
  end
  

end