creative = {}
creative.building_nodes = {}

function creative.build(player)
	for k,v in pairs(creative.building_nodes) do
		player:get_inventory():add_item('main', v)
	end
end

function creative.register_building_node(name)
	table.insert(creative.building_nodes, name)
end

function creative.play(player)
	-- TODO: clear inventory
end

if minetest.setting_getbool("creative_mode") then

-- Place node at player pos
minetest.nodedef_default.on_secondary_use = function(itemstack, user, pointed)
	local pos = user:getpos()
	local s_name = itemstack:get_name()
	minetest.set_node(pos, {name = s_name})
end

end
