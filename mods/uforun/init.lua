uforun = {}

local modpath = minetest.get_modpath("uforun")

dofile(modpath.."/player.lua")
dofile(modpath.."/ufo.lua")

# Proberties

minetest.register_on_joinplayer(function(player)
	local player = minetest.get_player_by_name(name)
	player:set_eye_offset({x=0,y=-10,z=0},{x=0,y=0,z=0})
end)
