if minetest.setting_getbool("creative_mode") then
   -- Don't do anything with on_place(Should fix this so you don't
   -- have to point at something to place a block)
   function minetest.nodedef_default.on_place(itemstack, user, pointed)
      local upos = user:getpos()
      local node_name = itemstack:get_name()
      minetest.set_node(upos, {name = node_name})
   end
   
   -- Place at player's location instead(Doesn't work yet)
   function minetest.nodedef_default.on_use(pos, node, user, itemstack, pointed_thing)
      --      print(dump(user))
      local upos = user:getpos()
      local node_name = itemstack:get_name()
      --      print(dump(upos)..node_name)
      --      minetest.set_node(upos, {name = node_name})
   end
end
