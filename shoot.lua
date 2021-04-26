require("bullet/bullet")

function loadShoot()
  initShoot()
end

function updateShoot(dt)
  
  for k,tir in ipairs(shootTab) do
    
    if tir.label == "bullet" then
      updtateBullet(tir,dt)
      
      for k,mob in ipairs(ennemis) do
        if collide(tir, mob) then
          mob.life = mob.life - tir.dmg
          tir.collide = true
          break
        end 
      end
      if tir.x + tir.sprite:getWidth() < screenWidth*5 and tir.x - tir.sprite:getWidth() > 0 and tir.y + tir.sprite:getHeight() < screenHeight and tir.y - tir.sprite:getHeight() > 0 then
        local IDcollision = twoDimMap[math.floor(tir.y/32+1)][math.floor(tir.x/32 +1)]
        if (isSolid(IDcollision,twoDimMap)) then
          tir.collide = true
        end
      else
        tir.collide = true
      end
    end
    if tir.label == "autre" then
    end
  end
  
end

function drawShoot()

  displayShoot()

end

function initShoot()
  
  shootTab = {}
  
end

function displayShoot()
  
  
  for k,tir in ipairs(shootTab) do
    love.graphics.draw(tir.sprite,tir.x,tir.y,tir.delta,1.5,1.5,tir.sprite:getWidth()/2,tir.sprite:getHeight()/2)
  end
  
end