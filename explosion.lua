globalExplosionID = 1

function createExplosion(x,y) 
  Explosion = {}
  Explosion.label = "explosion1"
  Explosion.sprite = ExploTexture
  Explosion.state = "idle"
  Explosion.x = x
  Explosion.y = y
  table.insert(fxtable,Explosion)
  globalExplosionID = globalExplosionID + 1
end