function createBullet(x,y) 
  Bullet = {}
  Bullet.label = "bullet"
  Bullet.sprite = imgBullet
  Bullet.state = "idle"
  Bullet.reload = false
  Bullet.reloadTime = 10
  Bullet.x = x
  Bullet.y = y
  Bullet.vx = 200
  Bullet.vy = 200
  Bullet.hp = 10
  Bullet.rayonDetect = 8
  Bullet.dmg = 5
  Bullet.delta = 0
  table.insert(shootTab,Bullet)
end

function updtateBullet(bullet,dt)
  
  

end