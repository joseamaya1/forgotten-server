local config = {
	centerRoom = Position(32269, 31091, 14),
	BossPosition = Position(32269, 31091, 14),
	newPosition = Position(32271, 31097, 14)
}

local monsters = {
	{monster = 'icicle', pos = Position(32266, 31084, 14)},
	{monster = 'icicle', pos = Position(32272, 31084, 14)},
	{monster = 'dragon egg', pos = Position(32269, 31084, 14)},
	{monster = 'melting frozen horror', pos = Position(32267, 31071, 14)}
}

local function clearForgottenHorror()
	local spectators = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(Position(32319, 31091, 14))
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
	Game.setStorageValue(GlobalStorage.ForgottenKnowledge.HorrorTimer, 0)
end


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(32302, 31088, 14) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.HorrorTimer) >= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Frozen Horror.")
			return true
		end
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Frozen Horror.")
				return true
			end
		end
		for n = 1, #monsters do
			Game.createMonster(monsters[n].monster, monsters[n].pos, true, true)
		end
		Game.createMonster("solid frozen horror", config.BossPosition, true, true)
		for y = 31088, 31092 do
			local playerTile = Tile(Position(32302, y, 14)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				playerTile:setExhaustion(Storage.ForgottenKnowledge.HorrorTimer, 20 * 60 * 60)
			end
		end
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.HorrorTimer, 1)
		addEvent(clearForgottenHorror, 30 * 60 * 1000)
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
		
		
		
		