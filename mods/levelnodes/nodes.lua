--basic nodes (colored)
levelnodes.register_node = function(color)
	minetest.register_node("levelnodes:"..color, {
		description = color.." Block",
		tiles = {"levelnodes_basic_node.png^[colorize:"..color..":100"},
		groups = {levelnode=3},
	})
end

levelnodes.register_node("red")
levelnodes.register_node("green")
levelnodes.register_node("yellow")
levelnodes.register_node("brown")
levelnodes.register_node("white")
levelnodes.register_node("black")

-- special nodes (with extra textures/functions...)
minetest.register_node("levelnodes:finishline", {
      description = "finish line",
      tiles = {"levelnodes_finishline.png"},
      groups = {levelnode=3},
	on_punch = function(pos, node, puncher, pointed_thing)
		if puncher:is_player() then
			pos.y = pos.y +1
		end
	end
})

minetest.register_node("levelnodes:startline", {
	description = "start line",
	tiles = {"levelnodes_startline.png"},
	groups = {hard=3},
	on_punch = function(pos, node, puncher, pointed_thing)
		if puncher:is_player() then
			pos.y = pos.y +1
			minetest.add_entity(pos, "uforun:ufo")
		end
	end
})

minetest.register_node("levelnodes:dirt", {
      description = "dirt",
      tiles = {"levelnodes_dirt.png"},
      groups = {levelnode=3},
})

minetest.register_node("levelnodes:grass", {
      description = "grass",
      tiles = {"levelnodes_grass.png"},
      groups = {levelnode=3},
})

minetest.register_node("levelnodes:ice", {
      description = "ice",
      tiles = {"levelnodes_ice.png"},
      groups = {levelnode=3},
})

minetest.register_node("levelnodes:dirt_with_grass", {
      description = "dirt with grass",
      tiles = {"levelnodes_grass.png", "levelnodes_dirt.png", "levelnodes_grass_side.png"},
      groups = {levelnode=3},
})

minetest.register_node("levelnodes:dirt_with_ice", {
      description = "dirt with ice",
      tiles = {"levelnodes_ice.png", "levelnodes_dirt.png", "levelnodes_ice_side.png"},
      groups = {levelnode=3},
})

minetest.register_node("levelnodes:spikes", {
      description = "spikes",
      drawtype = "plantlike",
      tiles = {"levelnodes_spikes.png"},
      inventory_image = "levelnodes_spikes.png",
      sunlight_propagates = true,
      walkable = false,
      paramtype = "light",
      damage_per_second = 2,
      groups = {levelnode=3},
})

minetest.register_node("levelnodes:cushion", {
      description = "cushion",
      tiles = {"levelnodes_cushion_top.png", "levelnodes_cushion_bottom.png", "levelnodes_cushion_side.png"},
      groups = {levelnode=3, fall_damage_add_percent=-100},
})

minetest.register_node("levelnodes:bouncer", {
      description = "bouncer",
      tiles = {"levelnodes_bouncer.png"},
      groups = {levelnode=3, bouncy=75, fall_damage_add_percent=-50},
})

minetest.register_node("levelnodes:coin", {
	description = "coin",
	tiles = {"levelnodes_coin.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
	},
	groups = {levelnode=3},
	walkable     = false,
	paramtype = "light",
})

minetest.register_node("levelnodes:coin_removed", {
	description = "coin (REMOVED)",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable     = false,
	pointable    = false,
	diggable     = false, 
	buildable_to = true, 
	groups = {levelnode=3},
})


minetest.register_abm({
	nodenames = {"levelnodes:coin_removed"},
	interval = 30.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "levelnodes:coin"})
	end
})
