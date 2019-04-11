local config = {
    boss = "zorvorax", -- boss name
    posBoss = {x = 32020, y = 32396, z = 8}, -- boss spawn position
    pos = {x = 32004, y = 32396, z = 8}, -- pos player will spawn
    centerRoom = {x = 32016, y = 32396, z = 8}, -- declares the center of the room
    exit = {x = 33000, y = 31594, z = 11},
}

local function limpaArea()
    local spectators, spectator = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		end
	end
end

local function playerTp()
    local spectators, spectator = Game.getSpectators(Position(config.centerRoom), false, false, 15, 15, 15, 15)
    for i = 1, #spectators do
        spectator = spectators[i]
        if spectator:isPlayer() then
            spectator:teleportTo(config.exit)
            spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    end
end

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
		return true
	end

    -- block others player from entering the room
    local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
    for i = 1, #specs do
        spec = specs[i]
        if spec:isPlayer() then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting Zorvorax right now.")
            return true
        end
    end

    if player:getStorageValue(Storage.TheFirstDragon.Zorvorax) < os.time() and player:getStorageValue(Storage.TheFirstDragon.Steps) >= 3 then
        limpaArea()
        player:teleportTo(config.pos)
        player:setDirection(DIRECTION_EAST)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have 10 minutes to kill Zorvorax, otherwise you'll be kicked from the room.")
        Game.createMonster(config.boss, config.posBoss, false, true)
        addEvent(playerTp, 10 * 60 * 1000)
        addEvent(limpaArea, 10 * 60 * 1000)
    elseif player:getStorageValue(Storage.TheFirstDragon.Steps) < 4 then
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
    else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have to wait 20 hours to kill Zorvorax again")
		player:teleportTo(fromPosition)
    end


end