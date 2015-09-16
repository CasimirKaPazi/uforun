-- Called when a player's appearance needs to be updated
function uforun.player_set_model(player, model_name)
	local name = player:get_player_name()
	player:set_properties({
		textures = {"player.png", "player_back.png"},
		visual = "upright_sprite",
		collisionbox = {-0.5,-1,-0.5, 0.5,0.0,0.5},
	})
end

minetest.register_on_joinplayer(function(player)
	uforun.player_set_model(player)
	player:set_eye_offset({x=0,y=-10,z=0},{x=0,y=0,z=0})
end)

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
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=4},
	}
})

