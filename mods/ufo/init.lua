use_entity = false
sliding = false


if use_entity then
	local function get_sign(i)
		return i == 0 and 0 or i/math.abs(i)
	end

	local function get_velocity(v, yaw, y)
		return vector.new(-math.sin(yaw)*v, y, math.cos(yaw)*v)
	end

	local function get_v(v)
		return math.sqrt(v.x^2+v.z^2)
	end

	minetest.register_entity("ufo:ufo", {
		visual = "wielditem",
		textures = {"ufo:ufo"},
		visual_size = {x=0.667, y=0.667},
		collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.4, 0.5},
		physical = true,

		speed = 0,
		driver = nil,
		removed = nil,

		on_activate = function(self, staticdata)
			self.object:set_armor_groups({immortal = 1})
			self.object:setacceleration(vector.new(0, -20, 0))
		end,
		on_punch = function(self, puncher)
			if not puncher or not puncher:is_player() or self.removed then
				return
			end
			if puncher == self.driver then
				self.removed = true
				self.driver = nil
				self.object:remove()
				puncher:set_detach()
				--default.player_attached[puncher:get_player_name()] = false
			elseif not self.driver then
				self.removed = true
				self.object:remove()
				if not minetest.setting_getbool("creative_mode") then
					puncher:get_inventory():add_item("main", "ufo:ufo")
				end
			end
		end,
		on_rightclick = function(self, clicker)
			if not clicker or not clicker:is_player() then
				return
			end
			local name = clicker:get_player_name()
			if clicker == self.driver then
				clicker:set_detach()
				self.driver = nil
				self.object:setvelocity(vector.new(0, 0, 0))
				--default.player_attached[name] = false
				--default.player_set_animation(clicker, "stand" , 30)
				local pos = clicker:getpos()
				pos.y = pos.y+0.2
				minetest.after(0.1, function()
					clicker:setpos(pos)
				end)
			elseif not self.driver then
				self.driver = clicker
				clicker:set_attach(self.object, "", vector.new(0, 0, 0), vector.new(0, 0, 0))
				--default.player_attached[name] = true
				--minetest.after(0.2, function()
				--	default.player_set_animation(clicker, "sit" , 30)
				--end)
				self.object:setyaw(clicker:get_look_yaw()-math.pi/2)
			end
		end,
		on_step = function(self, dtime)
			local pos = self.object:getpos()
			local velocity = self.object:getvelocity()

			self.speed = get_v(velocity) * get_sign(self.speed)

			if self.driver then
				local control = self.driver:get_player_control()
				local yaw = self.object:getyaw()
			
				if sliding then
					if control.up then
						self.speed = self.speed+0.2
					elseif control.down then
						self.speed = self.speed-0.2
					end
				else
					if control.up then
						self.speed = self.speed+0.3
					elseif control.down then
						self.speed = self.speed-0.3
					else
						self.speed = 0
					end
				end

				if control.left then
					if self.speed < 0 then
						self.object:setyaw(yaw-(1+dtime)*0.05)
					else
						self.object:setyaw(yaw+(1+dtime)*0.05)
					end
				elseif control.right then
					if self.speed < 0 then
						self.object:setyaw(yaw+(1+dtime)*0.05)
					else
						self.object:setyaw(yaw-(1+dtime)*0.05)
					end
				end
			
				-- remove coins
				local is_coin = minetest.get_node(pos).name == "levelnodes:coin"
				if is_coin then
					minetest.set_node(pos, {name="levelnodes:coin_removed"})
				end


				local node = minetest.get_node(vector.new(pos.x, pos.y-1, pos.z))
				local nodedef = node and minetest.registered_nodes[node.name]
				if control.jump and velocity.y == 0
				and nodedef and nodedef.walkable then
					self.object:setvelocity(vector.new(velocity.x, 10, velocity.z))
				end
				if node and node.name == "levelnodes:finishline" then
					self.removed = true
					if self.driver and self.driver:is_player() then
						self.driver:set_detach()
						teleport.tp(self.driver)
						self.driver = nil
					end
					self.object:remove()
				end
				if self.object:getpos().y < -50 then
					self.removed = true
					if self.driver and self.driver:is_player() then
						self.driver:set_detach()
						local driver_pos = self.driver:getpos()
						driver_pos.y = driver_pos.y + 70
						self.driver:setpos(driver_pos)
						self.driver = nil
					end
					self.object:remove()
				end
			end

			velocity = self.object:getvelocity()

			if self.speed == 0 and velocity.x == 0 and velocity.y == 0 and velocity.z == 0 then
				self.object:setpos(self.object:getpos())
				return
			end

			local speed = get_sign(self.speed)
			self.speed = self.speed-0.02*speed
			if speed ~= get_sign(self.speed) then
				self.object:setvelocity(vector.new(0, 0, 0))
				self.speed = 0
				return
			end

			if math.abs(self.speed) > 5 then
				self.speed = 5*get_sign(self.speed)
			end

			self.object:setpos(self.object:getpos())
			self.object:setvelocity(get_velocity(self.speed, self.object:getyaw(), velocity.y))
		end
	})

	minetest.register_node("ufo:ufo", {
		description = "UFO",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {"uforun_ufo_top.png", "uforun_ufo_bottom.png", "uforun_ufo_side.png"},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.3125, 0, -0.3125, 0.3125, 0.5, 0.3125}
			}
		},
		on_place = function(itemstack, _, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			minetest.add_entity(pointed_thing.above, "ufo:ufo")
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	})
else

	minetest.register_on_joinplayer(function(player)

		uforun.player_set_model(player, "ufo.obj", "uforun_ufo.png")
		player:set_eye_offset({x=0,y=-10,z=0},{x=0,y=0,z=0})
		player:set_inventory_formspec(uforun.inv_form)

	end)


	minetest.register_globalstep(function(dtime)
		for _, player in pairs(minetest.get_connected_players()) do
			local pos = player:getpos()
		
			-- check for coins
			local is_coin = minetest.get_node(pos).name == "levelnodes:coin"
			if is_coin then
				minetest.set_node(pos, {name="levelnodes:coin_removed"})
			end

			-- check for spikes
			local is_spike = minetest.get_node(pos).name == "levelnodes:spikes"
			if is_spike then
				teleport.back(player)
			end

			-- is on finishline
			local node = minetest.get_node(vector.new(pos.x, pos.y-1, pos.z))
			local nodedef = node and minetest.registered_nodes[node.name]
			if node and node.name == "levelnodes:finishline" then
				teleport.tp(player)
			end

			-- is on startline
			if node and node.name == "levelnodes:startline" then
				teleport.set_level(player, vector.new(pos.x, pos.y-1, pos.z))
			end
		end
	end)
end
