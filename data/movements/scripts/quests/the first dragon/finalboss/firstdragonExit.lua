local t = {x = 33578, y = 30995, z = 14} -- tp back

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(t)
	player:setStorageValue(Storage.TheFirstDragon.FirstDragon, os.time() + 432000) 
	player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	player:setDirection(DIRECTION_SOUTH)
end