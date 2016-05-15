creative = {}
creative.building_nodes = {}

function creative.build(player)
	-- add items
	for k,v in pairs(creative.building_nodes) do
		player:get_inventory():add_item('main', v)
	end
end

function creative.register_building_node(name)
	table.insert(creative.building_nodes, name)
end

function creative.play(player)
	-- clear inventory
	local inv = player:get_inventory()
	local m = inv:get_list("main")
	for k,v in pairs(m) do
		v:clear()
	end
	inv:set_list("main", m)
end

creative.register_building_node("levelnodes:finishline 4")
creative.register_building_node("levelnodes:dirt 99")
creative.register_building_node("levelnodes:grass 99")
creative.register_building_node("levelnodes:ice 99")
creative.register_building_node("levelnodes:dirt_with_grass 99")
creative.register_building_node("levelnodes:spikes 99")
creative.register_building_node("levelnodes:dirt_with_ice 99")
creative.register_building_node("levelnodes:cushion 99")
creative.register_building_node("levelnodes:bouncer 99")

minetest.register_chatcommand("build", {
	params = "",
	description = "Switch to building mode",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		creative.build(player)
		return true, "Done."
	end,
})

minetest.register_chatcommand("play", {
	params = "",
	description = "Switch to play mode",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		creative.play(player)
		teleport.back(player)
		return true, "Done."
	end,
})

minetest.register_chatcommand("lobby", {
	params = "",
	description = "Teleport to lobby",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		creative.play(player)
		teleport.lobby(player)
		return true, "Done."
	end,
})

minetest.register_chatcommand("goto", {
	params = "",
	description = "Goto level",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		teleport.players[name] = tonumber(param)-1 or 0
		creative.play(player)
		teleport.back(player)
		return true, "Done."
	end,
})

if minetest.setting_getbool("creative_mode") then

-- Place node at player pos
minetest.nodedef_default.on_secondary_use = function(itemstack, user, pointed)
	local pos = user:getpos()
	local s_name = itemstack:get_name()
	minetest.set_node(pos, {name = s_name})
end

end
