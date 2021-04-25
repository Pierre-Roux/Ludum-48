dtValue = 0

function loadHero()
  initHero()
end

function updateHero(dt)
  deplacementHero(dt)
  losingLife(dt) 
  aim()
end

function drawHero()
  
  if hero.direction == "right" then
  love.graphics.draw(hero.sprite,hero.x,hero.y,0,1,1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
  love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
  else
  love.graphics.draw(hero.sprite,hero.x,hero.y,0,-1,1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
  love.graphics.draw(hero.spritetop,hero.x,hero.y-20,hero.delta,1,-1,hero.sprite:getWidth()/2,hero.sprite:getHeight()/2)
  end

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
  
  hero = {}
  hero.sprite = imgChara
  hero.spritetop = imgCharatop 
  hero.delta = 0
  hero.direction = "right"
  hero.jump = false
  hero.x = screenWidth/2
  hero.y = 50
  hero.vx = 0
  hero.vy = 0
  hero.life = 100
  hero.lifeMax = 100
  hero.dead = false
  hero.weapon = ""
  hero.bonus = {}
  
end
deplaced = false
function deplacementHero(dt)
  
  dtValue=dt
  
  oldHeroX = hero.x
  oldHeroY = hero.y
  
  IDcollision = {}
  
  
  --if hero.x + imgChara:getWidth() < screenWidth and hero.x - imgChara:getWidth() > 0 and hero.y + imgChara:getHeight() < screenHeight and hero.y - imgChara:getHeight() > 0 then
  --IDcollision[1] = twoDimMap[math.floor((  hero.y + imgChara:getHeight()/2  )/32)+1][math.floor(  hero.x  /32)+1]
  --end
  
  IDcollision[1] = twoDimMap[math.floor(hero.y/32+1)][math.floor((hero.x + hero.sprite:getWidth()/2)/32 +1)]
  IDcollision[2] = twoDimMap[math.floor(hero.y/32+1)][math.floor((hero.x - hero.sprite:getWidth()/2)/32 +1)]
  IDcollision[3] = twoDimMap[math.floor((hero.y + hero.sprite:getHeight()/2)/32+1)][math.floor(hero.x/32+1)]
  IDcollision[4] = twoDimMap[math.floor((hero.y - hero.sprite:getHeight()/2)/32+1)][math.floor(hero.x/32+1)]
  
  
  
  if hero.vx > 0 then
    hero.vx = hero.vx - (100*dt)
  elseif hero.vx < 0 then
    hero.vx = hero.vx + (100*dt)
  end
  
  if hero.vy < 1000 then
    hero.vy = hero.vy + (2500*dt)
  end  
  
  if (isSolid(IDcollision[1],twoDimMap)) then
    print("OB DROITE")
    hero.vx = 0
    hero.x = oldHeroX - (50*dt)
  else
    hero.x = hero.x + (hero.vx * dt)
  end
  
  if  (isSolid(IDcollision[2],twoDimMap)) then
    print("OB GAUCHE")
    hero.vx = 0
    hero.x = oldHeroX + (50*dt)
  else
    hero.x = hero.x + (hero.vx * dt)
  end
  
  if (isSolid(IDcollision[3],twoDimMap)) then
    print("OB BAS")
    hero.vy = 0
    hero.y = oldHeroY 
  else
    hero.y = hero.y + (hero.vy * dt)
    deplacedY = true
  end
  
  if (isSolid(IDcollision[4],twoDimMap)) then
    print("OB HAUT")
    hero.vy = 0
    hero.y = oldHeroY + (10*dt)
  else
    if deplacedY == true then
      hero.y = hero.y + (hero.vy * dt)      
    end
  end
  
  deplacedX = false
  deplacedY = false
  
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
  hero.delta = math.angle(x,y,hero.x-30,hero.y-30) + 3
  if hero.delta >= 1.5 and hero.delta <= 4.5 then
    hero.direction = "left"
  else
    hero.direction = "right"
  end
end