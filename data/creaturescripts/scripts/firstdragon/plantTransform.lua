local function removePlant(position)
	local flowerBowl = Tile(position):getItemById(2102)
	if flowerBowl then
		flowerBowl:remove()
		position:sendMagicEffect(CONST_ME_HITBYFIRE)
	end
end

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'angry plant' then
		return true
	end

	local position = targetMonster:getPosition()
	local spectators, spectator = Game.getSpectators(position, false, false, 20, 20, 20, 20)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() and spectator:getName():lower() == "unbeatable dragon" then
			spectator:remove()
			Game.createMonster("somewhat beatable", position, false, true)
			position:sendMagicEffect(CONST_ME_HITBYFIRE)
			return true
		end
	end
	return true
end