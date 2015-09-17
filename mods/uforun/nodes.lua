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

minetest.register_node(
   "uforun:finishline",
   {
      description = "(Uforun) Finishline",
      tiles = {"uforun_finishline.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:startline",
   {
      description = "(Uforun) Startline",
      tiles = {"uforun_startline.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:dirt",
   {
      description = "(Uforun) Dirt",
      tiles = {"uforun_dirt.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:grass",
   {
      description = "(Uforun) Grass",
      tiles = {"uforun_grass.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:ice",
   {
      description = "(Uforun) Ice",
      tiles = {"uforun_ice.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:dirt_with_grass",
   {
      description = "(Uforun) Dirt with Grass",
      tiles = {"uforun_grass.png", "uforun_dirt.png", "uforun_grass_side.png"},
      groups = {crumbly=3},
   })

minetest.register_node(
   "uforun:dirt_with_ice",
   {
      description = "(Uforun) Dirt with Ice",
      tiles = {"uforun_ice.png", "uforun_dirt.png", "uforun_ice_side"},
      groups = {crumbly=3},
   })
