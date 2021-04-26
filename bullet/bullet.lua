globalBulletID = 1

function createBullet(x,y,delta) 
  Bullet = {}
  Bullet.id = globalBulletID
  Bullet.label = "bullet"
  Bullet.sprite = imgBullet
  Bullet.x = x
  Bullet.y = y
  Bullet.vx = 600
  Bullet.vy = 600
  Bullet.hp = 10
  Bullet.collide = false
  Bullet.dmg = 5
  Bullet.delta = delta
  table.insert(shootTab,Bullet)
  globalBulletID = globalBulletID + 1
end

function updtateBullet(bullet,dt)
  
  if bullet.collide == true then
    table.remove(shootTab,bullet.id)
    for i=bullet.id,#shootTab do
      shootTab[i].id = shootTab[i].id - 1
    end
    globalBulletID = globalBulletID -1
  end
  
  bullet.x = bullet.x + (bullet.vx * math.cos(bullet.delta) * dt)
  bullet.y = bullet.y + (bullet.vy * math.sin(bullet.delta) * dt)

end