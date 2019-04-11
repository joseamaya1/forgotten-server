function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32527, y = 31842, z = 9} -- 32694, 31495, 11
local p1 = {x = 32559, y = 31852, z = 7} -- 32694, 31495, 11
local p2 = {x = 32498, y = 31828, z = 9} -- 32694, 31495, 11
local p3 = {x = 32517, y = 31830, z = 9} -- 32694, 31495, 11
local p4 = {x = 32490, y = 31810, z = 9}
local p5 = {x = 32494, y = 31831, z = 9} -- 32694, 31495, 11
local p6 = {x = 32514, y = 31805, z = 9} -- 32694, 31495, 11
local p7 = {x = 32497, y = 31805, z = 9} -- 32694, 31495, 11
local p8 = {x = 32518, y = 31827, z = 9} -- 32694, 31495, 11
local p9 = {x = 32517, y = 31806, z = 9} -- 32694, 31495, 11

if(getPlayerStorageValue(cid, 10050) < 1000) then
if item.actionid == 50245 then
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
	
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50246 then
	        doTeleportThing(cid,p1)
			doSendMagicEffect(p1,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50247 then
	        doTeleportThing(cid,p2)
			doSendMagicEffect(p2,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50249 then
	        doTeleportThing(cid,p3)
			doSendMagicEffect(p3,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50250 then
	        doTeleportThing(cid,p4)
			doSendMagicEffect(p4,10)
			
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50251 then
	        doTeleportThing(cid,p5)
			doSendMagicEffect(p5,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50252 then
	        doTeleportThing(cid,p6)
			doSendMagicEffect(p6,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50253 then
	        doTeleportThing(cid,p7)
			doSendMagicEffect(p7,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50254 then
	        doTeleportThing(cid,p8)
			doSendMagicEffect(p8,10)
			
	elseif (getPlayerStorageValue(cid, 10050) < 1000) then
	  if  item.actionid == 50248 then
	        doTeleportThing(cid,p9)
			doSendMagicEffect(p9,10)
					
	else doCreatureSay(cid, "Zzz Dont working.", TALKTYPE_ORANGE_1)
return true
end
   end
     end
       end
          end
            end
              end
                end
                  end
                    end
					  end
					    end