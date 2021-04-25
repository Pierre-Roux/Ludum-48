-- Niveau
map0 = require("maps/panel0")
map = map0.layers[1].data

twoDimMap = {}

TILE_HEIGHT = 32
TILE_WIDTH = 32

-- Tile images
tileImages = {}
local n
for n=1,2 do
  tileImages[n] = love.graphics.newImage("images/tile"..n..".png")
end

function initMap()
  twoDimMap = turnOneDimTableToTwoDimTable(map, 23, 40)
end

function drawMap()
  -- Draw map
  local row, col
  local x, y
  
  x = 0
  y = 0
  for row = 1, 23 do
    for col = 1, 40 do
      -- Draw tile
      local tile = twoDimMap[row][col] 
      if tile > 0 then
        love.graphics.draw(tileImages[tile], x, y, 0, 1, 1)
      end
      x = x + TILE_WIDTH
    end
    x = 0
    y = y + TILE_HEIGHT
  end
end

function love.keypressed(key)
  print(key)
end
  