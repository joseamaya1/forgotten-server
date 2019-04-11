function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	if(isMonster(target)) then
	local killAmount = player:getStorageValue(Storage.TheFirstDragon.DragonCount)
		if(string.lower(getCreatureName(target)) == "dragon") and killAmount < 210 and player:getStorageValue(Storage.TheFirstDragon.Progresso) == 1 then
			 player:setStorageValue(Storage.TheFirstDragon.DragonCount, killAmount + 1)
		elseif(string.lower(getCreatureName(target)) == "dragon") and killAmount == 200 and player:getStorageValue(Storage.TheFirstDragon.Progresso) == 1 then
			player:setStorageValue(Storage.TheFirstDragon.DragonCount, killAmount + 1)
			player:getPosition():sendMagicEffect(CONST_ME_THUNDER)
		else
			return true
		end
	end

	return true
end