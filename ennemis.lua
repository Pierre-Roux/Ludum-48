require("ennemis/drone")

ennemis = {}

function loadEnnemis()
  initEnnemis()

end

function updateEnnemis(dt)

  for k,mob in ipairs(ennemis) do
    
    if mob.label == "drone" then
      updtateDrone(mob,dt)
      if collide(mob, hero) then
        if mob.reload == false then
          mob.reload = true
          hero.life = hero.life - 1
        end
      end 
    end
    
    if mob.label == "autre" then
    end
  
  end

end

function drawEnnemis()
  DisplayEnnemis()

end

function initEnnemis()
  ennemis = {}
  --createDrone(1000,10)
  --createDrone(800,200)
  --createDrone(1130,300)
end

function DisplayEnnemis()

  for k,mob in ipairs(ennemis) do
    love.graphics.draw(mob.sprite,mob.x,mob.y,mob.delta,1,1,mob.sprite:getWidth()/2,mob.sprite:getHeight()/2)
    love.graphics.print("|",mob.x+mob.sprite:getWidth()/2,mob.y)
    love.graphics.print("|",mob.x-mob.sprite:getWidth()/2,mob.y)
    love.graphics.print("|",mob.x,mob.y + mob.sprite:getHeight()/2)
    love.graphics.print("|",mob.x,mob.y - mob.sprite:getHeight()/2)
  end
  
end