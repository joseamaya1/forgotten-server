function onUse(cid, item, fromPosition, itemEx, toPosition)


local p1 = {x = 32306, y = 31082, z = 7}
local p = {x = 32330, y = 31048, z = 7} -- where to tp to 33672, 31884, 5


if(getPlayerStorageValue(cid, 10050) < 100) then
	if item.uid == 12028 then 
	doTeleportThing(cid,p1)
	--setPlayerStorageValue(cid, 10050, 18)
	doSendMagicEffect(p1,10)
	elseif doTeleportThing(cid,p) then
	doSendMagicEffect(p,10)
	
	else doCreatureSay(cid, "You already used the sign, go to north and use the teleport to go back.", TALKTYPE_ORANGE_1)
return true
end
end
end