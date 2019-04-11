local config = {
	-- Ankrahmun
	[1] = {
		removeItems = {
			{position = Position(33096, 32882, 6), itemId = 4978}
		},
		fromPosition = Position(33099, 32875, 7),
		toPosition = Position(33106, 32893, 7),
		mapName = 'Ankhramun_tar_pits'
	},
	-- Drefia
	[2] = {
		removeItems = {
			{position = Position(33043, 32401, 7), itemId = 2784}
		},
		fromPosition = Position(33033, 32395, 7),
		toPosition = Position( 33043, 32406, 7),
		mapName = 'river_near_Drefia'
	},
	-- Darashia
	[3] = {
		removeItems = {
			{position = Position(33219, 32276, 7), itemId = 2725}
		},
		fromPosition = Position(33207, 32264, 7),
		toPosition = Position(33222, 32277, 7),
		mapName = 'northernmost_coast'
	}
}

local niEnabled = true
local niChance = 100

function onStartup()
	if niEnabled then
		math.randomseed(os.time())
		if math.random(100) <= niChance then
			local randTown = config[math.random(#config)]
			print('>> A sandstorm travels through Darama, leading to isles full of deadly creatures inside a nightmare. Avoid the '.. randTown.mapName ..'!')
			iterateArea(
				function(position)
					local tile = Tile(position)
					if tile then
						local items = tile:getItems()
						if items then
							for i = 1, #items do
								items[i]:remove()
							end
						end

						local ground = tile:getGround()
						if ground then
							ground:remove()
						end
					end
				end,
				randTown.fromPosition,
				randTown.toPosition
			)

			if randTown.removeItems then
				local item
				for i = 1, #randTown.removeItems do
					item = Tile(randTown.removeItems[i].position):getItemById(randTown.removeItems[i].itemId)
					if item then
						item:remove()
					end
				end
			end

			Game.loadMap('data/world/worldchanges/nightmare_isles/' .. randTown.mapName .. '.otbm')
		else
			print('>> Nightmare Isles: not this time.')
		end
	end
end
