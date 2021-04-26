require("ennemis/drone")

ennemis = {}

function loadEnnemis()
  initEnnemis()

end

function updateEnnemis(dt)

  for k,mob in ipairs(ennemis) do
    if mob.label == "drone" then
      updateDrone(mob,dt)
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
  displayEnnemis()

end

function initEnnemis()
  ennemis = {}
  
  for i=1, 40 do
    createDrone(math.random(screenWidth*5),math.random(screenHeight))
  end

end

function displayEnnemis()

  for k,mob in ipairs(ennemis) do
    love.graphics.draw(mob.sprite,mob.x,mob.y,mob.delta,1,1,mob.sprite:getWidth()/2,mob.sprite:getHeight()/2)
    love.graphics.print(mob.id,mob.x,mob.y,0,3,3)
    love.graphics.print("|",mob.x+mob.sprite:getWidth()/2,mob.y)
    love.graphics.print("|",mob.x-mob.sprite:getWidth()/2,mob.y)
    love.graphics.print("|",mob.x,mob.y + mob.sprite:getHeight()/2)
    love.graphics.print("|",mob.x,mob.y - mob.sprite:getHeight()/2)
  end
  
end