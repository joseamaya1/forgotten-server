function onKill(creature, target)
        local targetMonster = target:getMonster()
        if not targetMonster then
                return true
        end

        if targetMonster:getName():lower() ~= 'soul of dragonking zyrtarch' then
                return true
        end

        local player = creature:getPlayer()
        if player:getStorageValue(Storage.ForgottenKnowledge.DragonkingKilled) == -1 then
                player:setStorageValue(Storage.ForgottenKnowledge.DragonkingKilled, 1)
        end
        return true
end