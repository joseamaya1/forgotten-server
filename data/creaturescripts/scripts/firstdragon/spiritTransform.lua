function onKill(creature, item, position, fromPosition)
	local hp = (creature:getHealth()/creature:getMaxHealth())*100
    local player = creature:getPlayer()
    local pos = Position(33595, 31023, 14)
	
	if not player then
		return true
    end
    
    local spectators, spectator = Game.getSpectators(Position(33594, 31019, 14), false, false, 1, 1, 1, 9)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() and spectator:getName():lower() == "spirit of fertility" then
			spectator:remove()
			Game.createMonster("angry plant", pos, false, true)
			return true
		end
	end

end