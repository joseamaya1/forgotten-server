function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 33462, y = 32081, z = 8} 
local p1 = {x = 33576, y = 31954, z = 7}
local p2 = {x = 33665, y = 31922, z = 7}



if(getPlayerStorageValue(cid, 10050) < 6) then
	doTeleportThing(cid,p)
	setPlayerStorageValue(cid, 10050, 6)
	doSendMagicEffect(p,10)
	doCreatureSay(cid, "There we go.", TALKTYPE_ORANGE_1)
	
	elseif (getPlayerStorageValue(cid, 10050) == 14) then
	doTeleportThing(cid,p1)
	doSendMagicEffect(p1,10)
	
	elseif(getPlayerStorageValue(cid, 10050) == 17) then
	doTeleportThing(cid,p2)
	doSendMagicEffect(p2,10)
	
	else 
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)	
	doCreatureSay(cid, "You've been teleported.", TALKTYPE_ORANGE_1)
return true
end

end