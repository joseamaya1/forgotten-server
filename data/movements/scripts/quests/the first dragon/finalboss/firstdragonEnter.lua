local t = {x = 33564, y = 30989, z = 14}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()

    if player:getStorageValue(Storage.TheFirstDragon.Progresso) >= 1 and player:getStorageValue(Storage.TheFirstDragon.FirstDragon) < os.time() then
        player:teleportTo(t)
		player:setDirection(DIRECTION_SOUTH)
    else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have to wait 5 days to face The First Dragon again")
		player:teleportTo(fromPosition)
    end
end    