local combat = Combat()

function onCastSpell(creature, var)
	local x = math.random(-5, 7)
	local tpSala = Position(33605 + x, 31024 + x, 14)
	creature:teleportTo(tpSala)
	return true
end
