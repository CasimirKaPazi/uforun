if minetest.setting_get("testing_mod") then

minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname="v7"})
end)

minetest.register_node("testing:node", {
	description = "Testing",
	tiles = {"testing_node.png"},
	groups = {oddly_breakable_by_hand=3},
})

minetest.register_alias("mapgen_stone", "testing:node")
minetest.register_alias("mapgen_tree", "testing:node")
minetest.register_alias("mapgen_leaves", "testing:node")
minetest.register_alias("mapgen_jungletree", "testing:node")
minetest.register_alias("mapgen_jungleleaves", "testing:node")
minetest.register_alias("mapgen_apple", "testing:node")
minetest.register_alias("mapgen_water_source", "testing:node")
minetest.register_alias("mapgen_dirt", "testing:node")
minetest.register_alias("mapgen_sand", "testing:node")
minetest.register_alias("mapgen_gravel", "testing:node")
minetest.register_alias("mapgen_clay", "testing:node")
minetest.register_alias("mapgen_lava_source", "testing:node")
minetest.register_alias("mapgen_cobble", "testing:node")
minetest.register_alias("mapgen_mossycobble", "testing:node")
minetest.register_alias("mapgen_dirt_with_grass", "testing:node")
minetest.register_alias("mapgen_junglegrass", "testing:node")
minetest.register_alias("mapgen_stone_with_coal", "testing:node")
minetest.register_alias("mapgen_stone_with_iron", "testing:node")
minetest.register_alias("mapgen_mese", "testing:node")
minetest.register_alias("mapgen_desert_sand", "testing:node")
minetest.register_alias("mapgen_desert_stone", "testing:node")
minetest.register_alias("mapgen_stair_cobble", "testing:node")
minetest.register_alias("mapgen_sandstonebrick", "testing:node")
minetest.register_alias("mapgen_stair_sandstone", "testing:node")

end
