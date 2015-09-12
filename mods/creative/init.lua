if minetest.setting_getbool("creative_mode") then

-- Place node at player pos
minetest.nodedef_default.on_place = function(itemstack, user, pointed)
	local pos = user:getpos()
	local inv = user:get_inventory()
	local idx = user:get_wield_index()
	local stack = inv:get_stack("main", idx)
	local s_name = stack:get_name()
	minetest.set_node(pos, {name = s_name})
end

end
