local t = {x = 33000, y = 31594, z = 11} -- tp back
 
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(t)
	player:setStorageValue(Storage.TheFirstDragon.Zorvorax, os.time() + 72000)
	player:setStorageValue(34015, 1)
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	player:setDirection(DIRECTION_SOUTH)
end