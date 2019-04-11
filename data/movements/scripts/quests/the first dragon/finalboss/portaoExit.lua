function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    local pos = {x = 33047, y = 32713, z = 3}
    player:teleportTo(pos)
    player:setDirection(DIRECTION_SOUTH)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
end