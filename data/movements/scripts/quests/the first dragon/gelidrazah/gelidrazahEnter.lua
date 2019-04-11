local config = {
    boss = "gelidrazah the frozen", -- boss name
    posBoss = {x = 32083, y = 32396, z = 8}, -- boss spawn position
    pos = {x = 32078, y = 32407, z = 8}, -- pos player will spawn
    centerRoom = {x = 32079, y = 32399, z = 8}, -- declares the center of the room
    exit = {x = 32276, y = 31366, z = 4},
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
    local specs, spec = Game.getSpectators(config.centerRoom, false, false, 20, 20, 20, 20)
    for i = 1, #specs do
        spec = specs[i]
        if spec:isPlayer() then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting Gelidrazah right now.")
            return true
        end
    end

    if player:getStorageValue(Storage.TheFirstDragon.Npc) == 4 and player:getStorageValue(Storage.TheFirstDragon.Gelidrazah) < os.time() then
        limpaArea()
        player:teleportTo(config.pos)
        player:setDirection(DIRECTION_NORTH)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have 10 minutes to kill Gelidrazah, otherwise you'll be kicked from the room.")
        Game.createMonster(config.boss, config.posBoss, false, true)
        addEvent(playerTp, 10 * 60 * 1000)
        addEvent(limpaArea, 10 * 60 * 1000)
    elseif player:getStorageValue(Storage.TheFirstDragon.Npc) < 4 then
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
    else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have to wait 20 hours to kill Gelidrazah again")
		player:teleportTo(fromPosition)
    end

    
end