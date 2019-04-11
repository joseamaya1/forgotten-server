function onUse(player, item, itemEx)
    if  item.actionid == 17393 then
	if player:getStorageValue(935481) < 1 then
        local newItem = Game.createItem(26654, 1)
        player:addItemEx(newItem)
		player:setStorageValue(935481, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
	
      end
	  
	  elseif item.actionid == 17391 then
	  if player:getStorageValue(935482) < 1 then
	  local newItem = Game.createItem(26654, 1)
	     player:addItemEx(newItem)
	     player:setStorageValue(935482, 1)
         player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
		
	end	
		
	 elseif item.actionid == 17394 then
	 if player:getStorageValue(935483) < 1 then
	 local newItem = Game.createItem(26654, 1)
	    player:addItemEx(newItem)
	   	player:setStorageValue(935483, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
		
	end	
	
	 elseif item.actionid == 17395 then
	 if player:getStorageValue(935484) < 1 then
	  local newItem = Game.createItem(26654, 1)
	    player:addItemEx(newItem)
	   	player:setStorageValue(935484, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
		
		end
		
	 elseif item.actionid == 17392 then
	 if player:getStorageValue(935485) < 1 then
	  local newItem = Game.createItem(26654, 1)
	    player:addItemEx(newItem)
	   	player:setStorageValue(935485, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy old Tome, but you have no room to take it.")
			
    else player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already took a beginner reward.")
		return true
   end
     end
       end