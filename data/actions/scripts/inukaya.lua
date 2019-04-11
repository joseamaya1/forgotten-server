local p1 = {x = 32370, y = 31058, z = 7} 
local p = {x = 32412, y = 31066, z = 7}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if  (getPlayerStorageValue(cid, 10050) < 100) then
   if  item.uid == 12026 then
	doTeleportThing(cid,p1)
	doSendMagicEffect(p1,10)
	
	else
	
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
return true
end
end
end