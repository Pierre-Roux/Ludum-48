function updateMenu(dt)
  
  if not MusiqueMenuStart:isPlaying() then
    love.audio.play(MusiqueMenuLoop)
  end
  
  animateMenu(dt) 
  
  if fadeIn == true then
    animateMenuFade(dt) 
  end

  if fadeEnd == true then
    love.audio.stop(MusiqueMenuStart)
    loadGame()
    gameState = "Game"
  end
end

function drawMenu()
  
  displayMenu()
  
end

function loadMenu()
  
  love.audio.stop(MusiqueMenuStart)
  love.audio.play(MusiqueMenuStart)
  MusiqueMenuStart:setVolume(0.5)
  frameCounter = 0
  currentFrame = 1
  
  opacityFade = 1
  frameCounterFade = 0
  fadeEnd = false
  fadeIn = false
end

function keypressedMenu(key)

  if key == "space" then
    fadeIn = true
    love.audio.play(Fade)
  end

end

function displayMenu()
  
  love.graphics.draw (backgroundMenu,0,0,0,1,1)
  love.graphics.draw (title[currentFrame],0,0,0,1,1)
  
  if fadeIn == true then
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",0,0,screenWidth,screenHeight)
    love.graphics.setColor(0,0,0)
  end
  
end

function animateMenu(dt) 
  if frameCounter >= 1 then
    currentFrame = currentFrame + 1
    if currentFrame >= #title then
      currentFrame = 1
    end
    frameCounter = 0
  end
  
  frameCounter = frameCounter + (30* dt)
end

function animateMenuFade(dt) 
  if frameCounterFade >= 1 then
    opacityFade = opacityFade - 0.1
    frameCounterFade = 0
  end
  
  if opacityFade <= 0 then
    fadeEnd = true
  end
  
  frameCounterFade = frameCounterFade + (6 * dt)
end
