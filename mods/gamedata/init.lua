-- This mod will be able to save and load tables from/to files

gamedata = {}
gamedata.data = {}

function gamedata.new(mod, data)
	gamedata.data[mod] = data
end

function gamedata.set(mod, k, v)
	gamedata.data[mod][k] = v
end

function gamedata.get(mod, k)
	return gamedata.data[mod][k]
end

function gamedata.save()
end

function gamedata.load()
end
