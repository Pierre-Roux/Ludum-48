function updateHero(dt)
  deplacementHero(dt)
end

function drawHero()
  
end

function initHero()
  
  hero = {}
  hero.sprite = love.graphics.rectangle("fill",0,0,10,10)
  hero.x = 100
  hero.y = 100
  hero.vx = 0
  hero.vy = 0
  hero.life = 100
  hero.weapon = ""
  hero.bonus = {}
  
end

function deplacementHero(dt)
  
  hero.x = hero.x + (hero.vx * dt)
  hero.y = hero.y + (hero.vy * dt)
  
end