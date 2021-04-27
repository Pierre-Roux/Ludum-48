function loadScoreBoard()
 initScoreBoard()

end

function updateScoreBoard(dt)


end

function drawScoreBoard()
  DisplayScoreBoard()

end

function initScoreBoard()
  love.audio.stop(MusiqueLoop)
  love.audio.stop(Swarm)
  love.audio.play(MusiqueMenuScore)
end

function DisplayScoreBoard()
  love.graphics.draw(gameover,0,0)
  love.graphics.print(gameScore ,screenWidth/2 - 10,screenHeight/2 + 100,0,2,2)
end