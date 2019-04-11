local t = {x = 33160, y = 31321, z = 5} -- tp back

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(t)
	player:setStorageValue(Storage.TheFirstDragon.Kalyassa, os.time() + 72000)
	player:setStorageValue(Storage.TheFirstDragon.Treasure, 0)
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	player:setDirection(DIRECTION_SOUTH)
end