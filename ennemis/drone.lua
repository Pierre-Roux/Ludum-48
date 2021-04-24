function createDrone(x,y) 
  Drone = {}
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
  Drone.rayonDetect = 8
  Drone.dmg = 5
  Drone.delta = 0
  table.insert(ennemis,Drone)
end

function updtateDrone(drone,dt)
  
  distance = math.dist(hero.x,hero.y,drone.x,drone.y)
  
  if distance < 800 then
    drone.state = "follow"
  else
    drone.state = "idle"
  end
  
  if drone.state == "follow" then
    drone.delta = math.angle(drone.x,drone.y,hero.x,hero.y)
    drone.x = drone.x + (Drone.vx * math.cos(drone.delta) * dt)
    drone.y = drone.y + (Drone.vy * math.sin(drone.delta) * dt)
  end
  print(Drone.reloadTime)
  if drone.reload == true then
    if Drone.reloadTime <= 0 then
      drone.reload = false
      drone.reloadTime = 10
    else
      drone.reloadTime = drone.reloadTime - (10*dt)
    end
  end
end