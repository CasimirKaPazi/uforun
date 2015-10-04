--basic nodes (colored)
uforun.register_node = function(color)
	minetest.register_node("uforun:"..color, {
		description = color.." Block",
		tiles = {"uforun_basic_node.png^[colorize:"..color..":100"},
		groups = {crumbly=3},
	})
end

uforun.register_node("red")
uforun.register_node("green")
uforun.register_node("yellow")
uforun.register_node("brown")
uforun.register_node("white")
uforun.register_node("black")

-- special nodes (with extra textures/functions...)
minetest.register_node(
   "uforun:finishline",
   {
      description = "finish line",
      tiles = {"uforun_finishline.png"},
      groups = {crumbly=3},
	on_punch = function(pos, node, puncher, pointed_thing)
		if puncher:is_player() then
			pos.y = pos.y +1
			puncher:setpos(pos)
			local playername = puncher:get_player_name() 
			local privs = minetest.get_player_privs(playername)
			privs.fly = true
			minetest.set_player_privs(playername, privs)
		end
	end
   })

minetest.register_node("uforun:startline",
{
	description = "start line",
	tiles = {"uforun_startline.png"},
	groups = {crumbly=3},
	on_punch = function(pos, node, puncher, pointed_thing)
		if puncher:is_player() then
			pos.y = pos.y +1
			puncher:setpos(pos)

			local playername = puncher:get_player_name() 
			local privs = minetest.get_player_privs(playername)
			privs.fly = false
			minetest.set_player_privs(playername, privs)
		end
	end
})

minetest.register_node(
   "uforun:dirt",
   {
      description = "dirt",
      tiles = {"uforun_dirt.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:grass",
   {
      description = "grass",
      tiles = {"uforun_grass.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:ice",
   {
      description = "ice",
      tiles = {"uforun_ice.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:dirt_with_grass",
   {
      description = "dirt with grass",
      tiles = {"uforun_grass.png", "uforun_dirt.png", "uforun_grass_side.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:dirt_with_ice",
   {
      description = "dirt with ice",
      tiles = {"uforun_ice.png", "uforun_dirt.png", "uforun_ice_side"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:spikes",
   {
      description = "spikes",
      drawtype = "plantlike",
      tiles = {"uforun_spikes.png"},
      inventory_image = "uforun_spikes.png",
      sunlight_propagates = true,
      walkable = false,
      paramtype = "light",
      damage_per_second = 2,
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:cushion",
   {
      description = "cushion",
      tiles = {"uforun_cushion_top.png", "uforun_cushion_bottom.png", "uforun_cushion_side.png"},
      groups = {crumbly=3, fall_damage_add_percent=-100},
   })

minetest.register_node(
   "uforun:bouncer",
   {
      description = "bouncer",
      tiles = {"uforun_bouncer.png"},
      groups = {crumbly=3, bouncy=75, fall_damage_add_percent=-50},
   })
