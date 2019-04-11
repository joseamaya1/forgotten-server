function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	
	if not player then
		return true
	end

	local stepsCount = player:getStorageValue(Storage.TheFirstDragon.Steps)
	if player:getStorageValue(Storage.TheFirstDragon.Suntower) < 1 and player:getStorageValue(Storage.TheFirstDragon.Progresso) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You entered the Suntower of Ab'dendriel. By visiting this sacred site you're infused with the power of the life-giving sun.")
		player:setStorageValue(Storage.TheFirstDragon.Suntower, 1)
		player:setStorageValue(Storage.TheFirstDragon.Steps, stepsCount + 1)
	else
		return true
	end
end