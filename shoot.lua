require("bullet/bullet")

function loadShoot()
  initShoot()
end

function updateShoot(dt)
  
  for k,tir in ipairs(shootTab) do
    
    if tir.label == "bullet" then
      updtateBullet(tir,dt)
      
      for k,mob in ipairs(ennemis) do
        --if mob ~= nil then
          if collide(tir, mob) then
            mob.life = mob.life - tir.dmg
            table.remove(shootTab,tir.id)
            break
          end 
        --end
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
    love.graphics.draw(tir.sprite,tir.x,tir.y,tir.delta,1,1,tir.sprite:getWidth()/2,tir.sprite:getHeight()/2)
  end
  
end