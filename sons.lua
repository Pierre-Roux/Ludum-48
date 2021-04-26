--Musique
DecodeMusiqueStart = love.sound.newDecoder("sons/music_level1_start.ogg")
MusiqueStart = love.audio.newSource(DecodeMusiqueStart,"stream")

DecodeMusiqueLoop= love.sound.newDecoder("sons/music_level1_loop.ogg")
MusiqueLoop = love.audio.newSource(DecodeMusiqueLoop,"stream")

DecodeMusiqueMenuStart= love.sound.newDecoder("sons/music_menu_start.ogg")
MusiqueMenuStart = love.audio.newSource(DecodeMusiqueMenuStart,"stream")

DecodeMusiqueMenuLoop= love.sound.newDecoder("sons/music_menu_loop.ogg")
MusiqueMenuLoop = love.audio.newSource(DecodeMusiqueMenuLoop,"stream")

--bruit

DecodeGroundImpact= love.sound.newDecoder("sons/sd_character_impact_ground_2.wav")
GroundImpact = love.audio.newSource(DecodeGroundImpact,"stream")

DecodeGunShoot= love.sound.newDecoder("sons/sd_gun_shot.wav")
GunShoot = love.audio.newSource(DecodeGunShoot,"stream")

DecodeWound= love.sound.newDecoder("sons/sd_character_wound_impact.wav")
Wound = love.audio.newSource(DecodeWound,"stream")

DecodeSwarm= love.sound.newDecoder("sons/sd_drone_swarm_loop.wav")
Swarm = love.audio.newSource(DecodeSwarm,"stream")

DecodeFade= love.sound.newDecoder("sons/sd_menu_fx.wav")
Fade = love.audio.newSource(DecodeFade,"stream")
