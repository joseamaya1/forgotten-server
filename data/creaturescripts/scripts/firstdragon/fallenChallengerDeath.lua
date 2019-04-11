local teleportToPosition = Position(33604, 31023, 14)

local function apagarTeleport(position)
	local teleportItem = Tile(position):getItemById(1397)
	if teleportItem then
		teleportItem:remove()
		position:sendMagicEffect(CONST_ME_POFF)
	end
end

local function limpaArea()
	-- clean mob area after 10 min of boss death
	local spectators, spectator = Game.getSpectators(Position(33564, 31023, 14), false, false, 40, 30, 40, 30)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		end
	end
end

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'fallen challenger' then
		return true
	end

	local position = targetMonster:getPosition()
	position:sendMagicEffect(CONST_ME_TELEPORT)
	local item = Game.createItem(1397, 1, position)
	if item:isTeleport() then
		item:setDestination(teleportToPosition)
	end

	--remove portal after 3 min
	addEvent(limpaArea, 10 * 60 * 1000)
	addEvent(apagarTeleport, 3 * 60 * 1000, position)
	return true
end