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
          print("mob touché")
        end 
        
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
    love.graphics.rectangle("fill",tir.x,tir.y,5,5)
    love.graphics.draw(tir.sprite,tir.x,tir.y,tir.delta,5,5,tir.sprite:getWidth()/2,tir.sprite:getHeight()/2)
  end
  
end