uforun.gui = {}
uforun.gui.bg = "bgcolor[#666666;false]"
uforun.gui.colors = "listcolors[#333333FF;#101010FF;#000000FF;#68B259;#FFF]"

-- Called when a player's appearance needs to be updated
function uforun.player_set_model(player, model_name, texture_name)
	local name = player:get_player_name()
	player:set_properties({
		mesh = model_name,
		textures = {texture_name},
		visual = "mesh",
		collisionbox = {-0.5,-1,-0.5, 0.5,0.0,0.5},
		visual_size = {x=1, y=1},
	})
end

uforun.inv_form = "size[8,7;]"
uforun.inv_form = uforun.inv_form..uforun.gui.colors
uforun.inv_form = uforun.inv_form..uforun.gui.bg
uforun.inv_form = uforun.inv_form.."list[current_player;main;0,3;8,4;]"

minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			levelnode = {times={[2]=0.70, [2]=0.50, [3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=4},
	}
})

