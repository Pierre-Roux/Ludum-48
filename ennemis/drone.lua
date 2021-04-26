globalDroneID = 1

function createDrone(x,y) 
  Drone = {}
  Drone.id = globalDroneID
  Drone.label = "drone"
  Drone.sprite = imgDrone
  Drone.state = "idle"
  Drone.reload = false
  Drone.reloadTime = 10
  Drone.scoreValue = 10
  Drone.x = x
  Drone.y = y
  Drone.vx = 450
  Drone.vy = 450
  Drone.rayonDetect = 800
  Drone.life = 15
  Drone.dmg = 50
  Drone.delta = 0
  table.insert(ennemis,Drone)
  globalDroneID = globalDroneID + 1
end

function updateDrone(drone,dt)
  
  if drone.life <= 0 then
    table.remove(ennemis,drone.id)
    for i=drone.id,#ennemis do
      ennemis[i].id = ennemis[i].id - 1
    end
    globalDroneID = globalDroneID - 1
    DecodeDronedie = love.sound.newDecoder("sons/sd_drone_explosion.wav")
    Dronedie = love.audio.newSource(DecodeDronedie,"stream")
    love.audio.play(Dronedie)
    Dronedie:setVolume(1)
    gameScore = gameScore + Drone.scoreValue
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