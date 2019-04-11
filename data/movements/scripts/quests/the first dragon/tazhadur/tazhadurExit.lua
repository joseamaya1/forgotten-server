local t = {x = 33234, y = 32277, z = 12} -- tp back

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(t)
	player:setStorageValue(Storage.TheFirstDragon.Tazhadur, os.time() + 72000)
	player:setStorageValue(Storage.TheFirstDragon.DragonCount, 0)
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	player:setDirection(DIRECTION_SOUTH)
end