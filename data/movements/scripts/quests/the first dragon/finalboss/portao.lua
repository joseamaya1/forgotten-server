local config = {
    scale = 27607,
    tooth = 27608,
    bones = 27609,
    horn = 27610,
    pos = {x = 31994, y = 32391, z = 9}
}

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()

    if player:getStorageValue(Storage.TheFirstDragon.Progresso) == 1 then
        if player:getItemCount(config.scale) >= 1 and player:getItemCount(config.tooth) >= 1 and player:getItemCount(config.bones) >= 1 and player:getItemCount(config.horn) >= 1 then
            player:teleportTo(config.pos)
            player:setDirection(DIRECTION_SOUTH)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
            player:removeItem(config.scale, 1)
            player:removeItem(config.tooth, 1)
            player:removeItem(config.bones, 1)
            player:removeItem(config.horn, 1)
            player:setStorageValue(Storage.TheFirstDragon.Progresso, 2)
        end
    elseif player:getStorageValue(Storage.TheFirstDragon.Progresso) > 1 then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:teleportTo(config.pos)
        player:setDirection(DIRECTION_SOUTH)
    elseif player:getStorageValue(Storage.TheFirstDragon.Progresso) < 1 then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not worthy.")
		return true
    end
end