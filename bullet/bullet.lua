function createBullet(x,y,delta) 
  Bullet = {}
  Bullet.label = "bullet"
  Bullet.sprite = imgBullet
  Bullet.state = "idle"
  Bullet.reload = false
  Bullet.reloadTime = 10
  Bullet.x = x
  Bullet.y = y
  Bullet.vx = 600
  Bullet.vy = 600
  Bullet.hp = 10
  Bullet.rayonDetect = 8
  Bullet.dmg = 5
  Bullet.delta = delta
  table.insert(shootTab,Bullet)
end

function updtateBullet(bullet,dt)
  
  bullet.x = bullet.x + (bullet.vx * math.cos(bullet.delta) * dt)
  bullet.y = bullet.y + (bullet.vy * math.sin(bullet.delta) * dt)

end