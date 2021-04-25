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

ExploSheet = love.graphics.newImage("images/explosion_sheet.png")

--ExploTexture = SplitSheet(ExploSheet,73,79)