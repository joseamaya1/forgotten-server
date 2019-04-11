function onKill(creature, target)
        local targetMonster = target:getMonster()
        if not targetMonster then
                return true
        end

        if targetMonster:getName():lower() ~= 'lloyd' then
                return true
        end

        local player = creature:getPlayer()
        if player:getStorageValue(Storage.ForgottenKnowledge.LloydKilled) == -1  then
                player:setStorageValue(Storage.ForgottenKnowledge.LloydKilled, 1)
        end
        return true
end


