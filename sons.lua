--Musique
DecodeMusiqueStart = love.sound.newDecoder("sons/music_level1_start.ogg")
MusiqueStart = love.audio.newSource(DecodeMusiqueStart,"stream")

DecodeMusiqueLoop= love.sound.newDecoder("sons/music_level1_loop.ogg")
MusiqueLoop = love.audio.newSource(DecodeMusiqueLoop,"stream")

--bruit

DecodeGunShoot= love.sound.newDecoder("sons/sd_gun_shot.wav")
GunShoot = love.audio.newSource(DecodeGunShoot,"stream")