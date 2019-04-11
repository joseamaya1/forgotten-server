local t = {x = 32276, y = 31366, z = 4} -- tp back

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(t)
	player:setStorageValue(Storage.TheFirstDragon.Gelidrazah, os.time() + 72000)
	player:setStorageValue(34003, 1)
	player:setStorageValue(34009, 1)
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	player:setDirection(DIRECTION_SOUTH)
end