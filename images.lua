--Menu
backgroundMenu = love.graphics.newImage("images/mainmenu.png")

title = {}
for i=1,60 do
  title[i] = love.graphics.newImage("images/title_1.png")
end

title[61] = love.graphics.newImage("images/title_2.png")
title[62] = love.graphics.newImage("images/title_3.png")
title[63] = love.graphics.newImage("images/title_4.png")
title[64] = love.graphics.newImage("images/title_5.png")
title[65] = love.graphics.newImage("images/title_1.png")

--scoreboard

gameover = love.graphics.newImage("images/gameover.png")

--fade
black = love.graphics.newImage("images/black.png")

--BG
background = love.graphics.newImage("images/bg_test.jpg")

-- UI
imgHPBar = love.graphics.newImage("images/hpbar.png")
imgHP = love.graphics.newImage("images/hp.png")

-- Hero
imgChara = love.graphics.newImage("images/charalegs.png")
imgCharatop = love.graphics.newImage("images/charatop.png")
imgch = love.graphics.newImage("images/chara.png")

runSheet = love.graphics.newImage("images/run_sheet.png")

runTexture = SplitSheet(runSheet,73,79)

-- Ennemis
imgDrone = love.graphics.newImage("images/drone.png")

-- Arme
imgBullet = love.graphics.newImage("images/bullet.png")
imgMuzzlefx = love.graphics.newImage("images/muzzlefx.png")

ExploDroneSheet = love.graphics.newImage("images/explosion_sheet.png")

ExploDroneTexture = SplitSheet(ExploDroneSheet,76,62)

