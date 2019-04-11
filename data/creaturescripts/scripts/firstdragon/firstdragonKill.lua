-- registrar evento 'TfdKill'
local p = {x = 33602, y = 31078, z = 14} -- sala da recompensa

function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "the first dragon") then
            setGlobalStorageValue(Storage.TheFirstDragon.Progresso, 2)

			-- teleporta os jogadores para a sala de recompensa
			local spectators, spectator = Game.getSpectators(Position(33604, 31023, 14), false, false, 15, 15, 15, 15)
			for i = 1, #spectators do
				spectator = spectators[i]
				if spectator:isPlayer() then
					spectator:teleportTo(p)
					spectator:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				end
			end
		end
	end
	return true
end