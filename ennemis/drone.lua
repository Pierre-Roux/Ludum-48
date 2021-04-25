globalDroneID = 1

function createDrone(x,y) 
  Drone = {}
  Drone.id = globalDroneID
  Drone.label = "drone"
  Drone.sprite = imgDrone
  Drone.state = "idle"
  Drone.reload = false
  Drone.reloadTime = 10
  Drone.x = x
  Drone.y = y
  Drone.vx = 200
  Drone.vy = 200
  Drone.hp = 10
  Drone.rayonDetect = 800
  Drone.life = 5
  Drone.dmg = 5
  Drone.delta = 0
  table.insert(ennemis,Drone)
  globalDroneID = globalDroneID + 1
end

function updtateDrone(drone,dt)
  
  if drone.life <= 0 then
    print(drone.id)
    ennemis[drone.id] = nil
    --table.remove(ennemis,drone.id)
  end
  
  distance = math.dist(hero.x,hero.y,drone.x,drone.y)
  
  if distance < Drone.rayonDetect then
    drone.state = "follow"
  else
    drone.state = "idle"
  end
  
  if drone.state == "follow" then
    drone.delta = math.angle(drone.x,drone.y,hero.x,hero.y)
    drone.x = drone.x + (Drone.vx * math.cos(drone.delta) * dt)
    drone.y = drone.y + (Drone.vy * math.sin(drone.delta) * dt)
  end
  if drone.reload == true then
    if Drone.reloadTime <= 0 then
      drone.reload = false
      drone.reloadTime = 10
    else
      drone.reloadTime = drone.reloadTime - (10*dt)
    end
  end
end