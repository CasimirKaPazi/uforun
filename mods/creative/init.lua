if minetest.setting_getbool("creative_mode") then

-- Place node at player pos
minetest.nodedef_default.on_secondary_use = function(itemstack, user, pointed)
	local pos = user:getpos()
	local s_name = itemstack:get_name()
	minetest.set_node(pos, {name = s_name})
end

end
