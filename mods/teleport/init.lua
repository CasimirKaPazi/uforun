-- This mod will handle level teleportation
teleport = {}
teleport.players = {}

function teleport.tp(player)
	local name = player:get_player_name()
	if not teleport.players[name] then
		teleport.players[name] = 0
	end
	teleport.players[name] = teleport.players[name] + 1 
	player:setpos({x = teleport.players[name]*50, y = 10, z = 0})
end

function teleport.new_player(name)
	teleport.players[name] = 0
end

function teleport.create_level(player)
	-- teleports a player to an empty level
end
