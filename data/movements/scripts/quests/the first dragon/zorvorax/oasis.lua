function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	
	if not player then
		return true
	end

	local stepsCount = player:getStorageValue(Storage.TheFirstDragon.Steps)
	if player:getStorageValue(Storage.TheFirstDragon.Oasis) < 1 and player:getStorageValue(Storage.TheFirstDragon.Progresso) >= 1  then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You enter the beautiful oasis. By visiting this sacred site you're infused with the power of water bringing life to the desert.")
		player:setStorageValue(Storage.TheFirstDragon.Oasis, 1)
		player:setStorageValue(Storage.TheFirstDragon.Steps, stepsCount + 1)
	else
		return true
	end
end