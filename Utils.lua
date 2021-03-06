function isOnGround(entity) 
  if entity.x + imgChara:getWidth() < currentMapW and entity.x - imgChara:getWidth() > 0 and entity.y + imgChara:getHeight() < currentMapH and entity.y - imgChara:getHeight() > 0 then
    ID = currentMap[math.floor((entity.y + imgChara:getHeight()/2+5)/32)+1][math.floor(entity.x/32)+1]
    if isSolid(ID,currentMap) then
      return true
    else
      return false
    end
  end
end

function isSolid(ID,map)
  local tileType = tileTypes[ID]
  if tileType == "fill" then
    return true
  else
    return false
  end
end

function math.dist(x1,y1, x2,y2) 
  return ((x2-x1)^2+(y2-y1)^2)^0.5 
end

function math.angle(x1,y1, x2,y2) 
  return math.atan2(y2-y1, x2-x1) 
end

function collide(a1, a2)
 if (a1==a2) then return false end
 local dx = a1.x - a2.x
 local dy = a1.y - a2.y
 if (math.abs(dx) < (a1.sprite:getWidth()/2)+(a2.sprite:getWidth()/2)) then
  if (math.abs(dy) < (a1.sprite:getHeight()/2)+(a2.sprite:getHeight()/2)) then
   return true
  end
 end
 return false
end

function turnOneDimTableToTwoDimTable(oneDimTable, nbRows, nbCols)
  local twoDimTable = {}
  local row, col
  local nbEntries = #oneDimTable
  for row = 1, nbRows do
    table.insert(twoDimTable, {})
    for col = 1, nbCols do
      twoDimTable[row][col] = oneDimTable[(row-1)*nbCols + col]
    end
  end
  return twoDimTable
end

function math.clamp(x, min, max)
  if x < min then
    return min
  elseif x > max then
    return max
  else
    return x
  end
end

function SplitSheet(sheet,tileW,tileH)

  resultTab = {}

  local nbColumns = sheet:getWidth()/tileW
  local nbRows = sheet:getHeight()/tileH
  resultTab[0] = nil
  
  local r, c
  local id = 1
  for r=1,nbRows do
    for c=1,nbColumns do
      resultTab[id] = love.graphics.newQuad(
        (c-1)*tileW,
        (r-1)*tileH,
        tileW,
        tileH,
        sheet:getWidth(),
        sheet:getHeight()
        )
      id = id + 1 
    end
  end
  
  return resultTab
  
end