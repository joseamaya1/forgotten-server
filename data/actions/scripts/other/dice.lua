function onUse(player, item, fromPosition, target, toPosition, isHotkey, cid, itemEx)
	local segundos = 1
	if player:getStorageValue(Storage.Tempo) >= os.time() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'you are exaust.')
	return false
    end
	
	local dicePosition = item:getPosition()
	local value = math.random(6)
	local isInGhostMode = player:isInGhostMode()

	dicePosition:sendMagicEffect(CONST_ME_CRAPS, isInGhostMode and player)

	local spectators = Game.getSpectators(dicePosition, false, true, 3, 3)
	for i = 1, #spectators do
		player:say(player:getName() .. " rolled a " .. value .. ".", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], dicePosition)
	end

	player:setStorageValue(Storage.Time, os.time() + segundos)
	item:transform(5791 + value)
	return true
end