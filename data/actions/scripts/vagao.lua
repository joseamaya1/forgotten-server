function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32624, y = 31514, z = 9} -- 32694, 31495, 11
local p1 = {x = 32725, y = 31487, z = 15}
if(getPlayerStorageValue(cid, 10050) < 1000) then
	if  item.actionid == 50109 then
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
	
	
	elseif Player(cid):getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) == 4 then
    if item.actionid == 42150 then
	doTeleportThing(cid,p1)
	doSendMagicEffect(p1,10)
	else doCreatureSay(cid, "You need talk with Tehlim first.", TALKTYPE_ORANGE_1)	
end
end
end
end 