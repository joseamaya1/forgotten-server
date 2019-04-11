local config = {
	BossPosition = Position(33357, 31182, 10),
	newPosition = Position(33359, 31186, 10),
	SoulPosition = Position(33359, 31182, 12)
}

local monsters = {
	{position = Position(33352, 31187, 10)},
	{position = Position(33363, 31187, 10)},
	{position = Position(33353, 31176, 10)},
	{position = Position(33363, 31176, 10)}
}

local function clearForgottenDragonKing()
	for v = 10, 12 do
	local spectators = Game.getSpectators(Position(33357, 31182, v), false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(Position(33407, 31172, 10))
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
end
	Game.setStorageValue(GlobalStorage.ForgottenKnowledge.DragonkingTimer, 0)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(33391, 31178, 10) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.DragonkingTimer) >= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Dragonking Zyrtarch.")
			return true
		end
		for v = 10, 12 do
			local specs, spec = Game.getSpectators(Position(33357, 31182, v), false, false, 15, 15, 15, 15)
			for i = 1, #specs do
				spec = specs[i]
				if spec:isPlayer() then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Dragonking Zyrtarch.")
					return true
				end
			end
		end
		for d = 1, #monsters do
			Game.createMonster('soulcatcher', monsters[d].position, true, true)
		end
		Game.createMonster("dragonking zyrtarch", config.BossPosition, true, true)
		Game.createMonster("soul of dragonking zyrtarch", config.SoulPosition, true, true)
		for y = 31178, 31182 do
			local playerTile = Tile(Position(33391, y, 10)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				playerTile:setExhaustion(Storage.ForgottenKnowledge.DragonkingTimer, 20 * 60 * 60)
			end
		end
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.DragonkingTimer, 1)
		addEvent(clearForgottenDragonKing, 30 * 60 * 1000)
		item:transform(9826)
		elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
		
		
		
		