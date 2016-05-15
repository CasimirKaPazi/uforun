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

function teleport.back(player)
	local name = player:get_player_name()
	if not teleport.players[name] then
		teleport.players[name] = 0
	end
	player:setpos({x = teleport.players[name]*50, y = 10, z = 0})
end

function teleport.lobby(player)
	local name = player:get_player_name()
	player:setpos({x = 0, y = 100, z = 0})
end

function teleport.set_level(player, p)
	local name = player:get_player_name()
	teleport.players[name] = math.floor(p.x/50+0.5) or teleport.players[name]
end

function teleport.new_player(name)
	teleport.players[name] = 0
end

function teleport.create_level(player)
	-- teleports a player to an empty level
end
