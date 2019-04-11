local config = {
    boss = "kalyassa", -- boss name
    posBoss = {x = 32082, y = 32464, z = 8}, -- boss spawn position
    pos = {x = 32073, y = 32458, z = 8}, -- pos player will spawn
    centerRoom = {x = 32080, y = 32459, z = 8}, -- declares the center of the room
    exit = {x = 33160, y = 31321, z = 5},
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
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting Kalyassa right now.")
            return true
        end
    end

    if player:getStorageValue(Storage.TheFirstDragon.Treasure) >= 5 and player:getStorageValue(Storage.TheFirstDragon.Kalyassa) < os.time() then
        limpaArea()
        player:teleportTo(config.pos)
        player:setDirection(DIRECTION_SOUTH)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have 10 minutes to kill Kalyassa, otherwise you'll be kicked from the room.")
        Game.createMonster(config.boss, config.posBoss, false, true)
        addEvent(playerTp, 10 * 60 * 1000)
        addEvent(limpaArea, 10 * 60 * 1000)
    elseif player:getStorageValue(Storage.TheFirstDragon.Treasure) < 5 then
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
    else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have to wait 20 hours to kill Kalyassa again")
		player:teleportTo(fromPosition)
    end
end