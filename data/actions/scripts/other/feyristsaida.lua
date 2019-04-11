function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.actionid == 24999 then
		player:teleportTo(Position(32972, 32227, 7))
		player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
		return true
	end
	
	if item.actionid == 25000 then
		player:teleportTo(Position(32192, 31419, 2))
		player:getPosition():sendMagicEffect(CONST_ME_ICEATTACK)
		return true
	end
	if item.actionid == 25001 then
		player:teleportTo(Position(33059, 32716, 5))
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
		return true
	end
	if item.actionid == 25002 then
		player:teleportTo(Position(32911, 32336, 15))
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	end	
	end
	
