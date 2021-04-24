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
  love.graphics.print("<-",hero.x,hero.y,0,1,1)
  
  love.graphics.print("|",hero.x+hero.sprite:getWidth()/2,hero.y)
  love.graphics.print("|",hero.x-hero.sprite:getWidth()/2,hero.y)
  love.graphics.print("|",hero.x,hero.y + hero.sprite:getHeight()/2)
  love.graphics.print("|",hero.x,hero.y - hero.sprite:getHeight()/2)
  
end

function initHero()
  
  hero = {}
  hero.sprite = imgChara
  hero.spritetop = imgCharatop 
  hero.delta = 0
  hero.direction = "right"
  hero.x = 100
  hero.y = 100
  hero.vx = 0
  hero.vy = 0
  hero.life = 100
  hero.lifeMax = 100
  hero.dead = false
  hero.weapon = ""
  hero.bonus = {}
  
end

function deplacementHero(dt)
  
  oldHeroX = hero.x
  oldHeroY = hero.y
  
  hero.x = hero.x + (hero.vx * dt)
  hero.y = hero.y + (hero.vy * dt)
  
  if hero.vx > 0 then
    hero.vx = hero.vx - (500*dt)
  elseif hero.vx < 0 then
    hero.vx = hero.vx + (500*dt)
  end

  if hero.vy < 1000 then
    hero.vy = hero.vy + (2500*dt)
  end

  if hero.x > screenWidth or hero.x < 0 then
    hero.x = oldHeroX
    hero.vx = 0
  end
  if hero.y > screenHeight - 80 or hero.y < 0 then
      hero.y = oldHeroY
      hero.vy = 0
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

function jumpHero(dt)
  if 1==1 then
    if love.keyboard.isDown("space") then
      if isOnGround(hero) then
        hero.vy = hero.vy - (80000 * dt)
      end
    end  
  end
end

function losingLife(dt)
  if hero.life >= 0 then
      hero.life =  hero.life - (3 * dt)
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
  
  print(hero.delta)
end