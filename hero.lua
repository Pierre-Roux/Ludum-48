function loadHero()
  initHero()
end

function updateHero(dt)
  deplacementHero(dt)
end

function drawHero()
  love.graphics.rectangle("fill",hero.x,hero.y,30,80)
  --love.graphics.draw(hero.sprite,hero.x,hero.y,0,1,1)
  love.graphics.print("<-",hero.x,hero.y,0,10,10)
  print("vx :")
  print(hero.x)
  print("vy :")
  print(hero.y)
  print(screenHeight)
end

function initHero()
  
  hero = {}
  hero.sprite = ""
  hero.x = 100
  hero.y = 100
  hero.vx = 0
  hero.vy = 0
  hero.life = 100
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
    hero.vy = hero.vy + (2000*dt)
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
        hero.vy = hero.vy - (60000 * dt)
      end
    end  
  end
end