local rewards = {
	[30082] = { -- final chest of the first dragon
		items = {
			{itemId = 27058, count = 1},
			{itemId = 12614, count = 1},
			{itemId = 24170, count = 2},
			{itemId = 10577, count = 2},
			{itemId = 25377, count = 3},
			{itemId = 2158, count = 1},
			{itemId = 2156, count = 1},
			{itemId = 2154, count = 1},
			{itemId = 5954, count = 2},
			{itemId = 23565, count = 2},
			{itemId = 26164, count = 2},
			{itemId = 11337, count = 2},
			{itemId = 12659, count = 2},
			{itemId = 15425, count = 2},
			{itemId = 10582, count = 2},
			{itemId = 11221, count = 2},
		},
		storage = 30082,
	},
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chestCount = player:getStorageValue(Storage.TheFirstDragon.Treasure)
	if item.uid == 30082 then
		local reward = rewards[item.uid]
		if not reward then
			return true
		end
		if player:getStorageValue(30082) < 1 then
			for i = 1, #reward.items do
				local items = reward.items[i]
				player:addItem(items.itemId, items.count or 1)
				player:setStorageValue(reward.storage, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found some of The First Dragon treasures.")
			end
		else
			player:getPosition():sendMagicEffect(CONST_ME_REDSMOKE)
			return true
		end
	end
	return true
end
