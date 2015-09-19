minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname="singlenode"})
end)

minetest.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	local c_air = minetest.get_content_id("air")
	local c_startline = minetest.get_content_id("uforun:startline")

	for z = minp.z, maxp.z do
		for y = minp.y, maxp.y do
			for x = minp.x, maxp.x do
				local pos = area:index(x, y, z)
				if y % 50 == 0 and x < 3 and x > 0 and z < 3 and z > 0 then
					data[pos] = c_startline
				end
			end
		end
	end

	vm:set_data(data)
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	vm:write_to_map(data)
	vm:update_liquids()
end)
