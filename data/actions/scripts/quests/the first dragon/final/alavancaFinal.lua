local function limpaArea()
	-- clean mob area after 10 min of boss death
	local spectators, spectator = Game.getSpectators(Position(33604, 31023, 14), false, false, 12, 12, 12, 12)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		end
	end
end

local config = {
	centerBossRoomPosition = Position(33564, 31022, 14),
	playerPositions = {
		Position(33563, 30993, 14),
		Position(33563, 30994, 14),
		Position(33563, 30995, 14),
		Position(33563, 30996, 14),
		Position(33563, 30997, 14),

		Position(33564, 30993, 14),
		Position(33564, 30994, 14),
		Position(33564, 30995, 14),
		Position(33564, 30996, 14),
		Position(33564, 30997, 14),
		
		Position(33565, 30993, 14),
		Position(33565, 30994, 14),
		Position(33565, 30995, 14),
		Position(33565, 30996, 14),
		Position(33565, 30997, 14)
	},
	newPositions = {
		-- first team room
		Position(33545, 31027, 14),
		Position(33545, 31027, 14),
		Position(33545, 31027, 14),

		-- second team room
		Position(33554, 31036, 14),
		Position(33554, 31036, 14),
		Position(33554, 31036, 14),

		-- third team room
		Position(33555, 31018, 14),
		Position(33555, 31018, 14),
		Position(33555, 31018, 14),

		-- fourth team room
		Position(33563, 31027, 14),
		Position(33563, 31027, 14),
		Position(33563, 31027, 14),

		-- fifth team room
		Position(33572, 31036, 14),
		Position(33572, 31036, 14),
		Position(33572, 31036, 14)
	}
}



function onUse(player, item, fromPosition, target, toPosition, isHotkey, creature)
	if item.itemid == 9826 then
		local storePlayers, playerTile = {}

		for i = 1, #config.playerPositions do
			playerTile = Tile(config.playerPositions[i]):getTopCreature()
			if not playerTile or not playerTile:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 15 players.")
				return true
			end

			storePlayers[#storePlayers + 1] = playerTile
		end

		local specs, spec = Game.getSpectators(config.centerBossRoomPosition, false, false, 13, 13, 12, 12)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
				return true
			end

			spec:remove()
        end

		for i = 1, 5 do
			for k = 1, math.random(2, 10) do
				pos = {x = math.random(33598, 33609), y = math.random(31016, 31028), z = 14}
				addEvent(doSummonCreature, i * 30 * 1000, "dragon warden", pos)
				addEvent(doSendMagicEffect, i * 30 * 1000, pos, CONST_ME_TELEPORT)
			end
		end		
	
		for j = 1, 3 do
			for l = 1, 1 do 
				posSpirit = {x = 33611, y = math.random(31019, 31028), z = 14}
				addEvent(doSummonCreature, j * 50 * 1000, "spirit of fertility", posSpirit)
				addEvent(doSendMagicEffect, j * 50 * 1000, pos, CONST_ME_TELEPORT)
			end
		end
	
		Game.createMonster("Unbeatable Dragon", Position(33604, 31018, 14))
		Game.createMonster("Fallen Challenger", Position(33545, 31023, 14))
		Game.createMonster("Fallen Challenger", Position(33555, 31032, 14))
		Game.createMonster("Fallen Challenger", Position(33555, 31014, 14))
		Game.createMonster("Fallen Challenger", Position(33564, 31023, 14))
		Game.createMonster("Fallen Challenger", Position(33573, 31032, 14))

		local players
		for i = 1, #storePlayers do
			players = storePlayers[i]
			config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
			players:teleportTo(config.newPositions[i])
			config.newPositions[i]:sendMagicEffect(CONST_ME_TELEPORT)
			players:setDirection(DIRECTION_NORTH)
			limpaArea()
		end
	elseif item.itemid == 9826 then
		return true
	end

	item:transform(item.itemid == 9825 and 9826 or 9825)
	return true
end