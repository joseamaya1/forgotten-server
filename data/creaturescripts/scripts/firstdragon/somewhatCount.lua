local creatures = {
	['somewhat beatable dragon'] = {status = 2, storage = Storage.TheFirstDragon.SomewhatCounter}
}

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local bossConfig = creatures[targetMonster:getName():lower()]
	if not bossConfig then
		return true
	end

	for i = 1, 5 do
		for k = 1, math.random(7, 19) do
			pos = {x = math.random(33598, 33609), y = math.random(31016, 31028), z = 14}
				addEvent(doSummonCreature, i * 15 * 1000, "dragon essence", pos)
				addEvent(doSendMagicEffect, i * 15 * 1000, pos, CONST_ME_ICEATTACK)
			end
		end		
	posBoss = {x = 33604, y = 31023, z = 14}
	addEvent(doSummonCreature, 2 * 60 * 1000, "the first dragon", posBoss)
	addEvent(doSendMagicEffect, 2 * 60 * 1000, posBoss, CONST_ME_EXPLOSIONAREA)
end