-- Niveau
map0 = require("maps/myMapFromPanel")
map = map0.layers[1].data

-- Tile images
tileImages = {}
local n
for n=1,2 do
  tileImages[n] = love.graphics.newImage("images/tile"..n..".png")
end

function drawMap()
  -- Draw map
  local nbRows = #map/40
  local row, col
  local x, y
  
  x = 0
  y = 0
  for row = 1, nbRows do
    for col = 1, 40 do
      -- Draw tile
      local tile = map[ ((row-1)*40) + col]
      print(tile)
      if tile > 0 then
        love.graphics.draw(tileImages[tile], x, y, 0, 1, 1)
      end
      x = x + 32
    end
    x = 0
    y = y + 32
  end
end

function love.keypressed(key)
  print(key)
end
  