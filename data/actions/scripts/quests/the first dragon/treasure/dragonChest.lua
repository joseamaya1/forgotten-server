local rewards = {
	[54003] = { -- crystal gardens
		storage = 29982,
		items = {
			{itemId = 18413, count = 1}
		}
	},
	[54001] = { -- banuta ok
		storage = 29980,
		items = { 
			{itemId = 7632, count = 1}
		}
	},
	[54002] = { -- cemetery chest
		storage = 29981,
		items = {
			{itemId = 2157, count = 2}
		}
	},
	[54005] = { -- dragon lair darashia
		storage = 29984,
		items = {
			{itemId = 18416, count = 2}
		}
	},
	[54006] = { -- dragon lair khazeel
		storage = 29985,
		items = {
			{itemId = 2156, count = 1}
		}
	},
	[54004] = { -- draconia
		storage = 29983,
		items = {
			{itemId = 18414, count = 1}
		}
	},
	[54007] = { -- drefia
		storage = 29986,
		items = {
			{itemId = 24849, count = 1}
		}
	},
	[54008] = { -- ghostlands
		storage = 29987,
		items = {
			{itemId = 2152, count = 2}
		}
	},
	[54009] = { -- goroma
		storage = 29988,
		items = {
			{itemId = 18420, count = 2}
		}
	},
	[54010] = { -- hero fortress
		storage = 29989,
		items = {
			{itemId = 2154, count = 1}
		}
	},
	[54011] = { -- isle of evil
		storage = 29990,
		items = {
			{itemId = 2151, count = 3}
		}
	},	
	[54012] = { -- jakundaf
		storage = 29991,
		items = {
			{itemId = 2143, count = 2}
		}
	},	
	[54013] = { -- kazordoon
		storage = 29992,
		items = {
			{itemId = 9971, count = 1}
		}
	},	
	[54014] = { -- krailos
		storage = 29993,
		items = {
			{itemId = 24850, count = 3}
		}
	},	
	[54015] = { -- okolnir
		storage = 29994,
		items = {
			{itemId = 2145, count = 2}
		}
	},
	[54016] = { -- shargon
		storage = 29995,
		items = {
			{itemId = 18415, count = 2}
		}
	},
	[54017] = { -- spider caves
		storage = 29996,
		items = {
			{itemId = 2144, count = 3}
		}
	},
	[54018] = { -- treasure island
		storage = 29997,
		items = {
			{itemId = 2127, count = 1}
		}
	},
	[54019] = { -- vengoth
		storage = 29998,
		items = {
			{itemId = 2155, count = 1}
		}
	},
	[54020] = { -- zao steppe
		storage = 29999,
		items = {
			{itemId = 7633, count = 1}
		}
	},
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chestCount = player:getStorageValue(Storage.TheFirstDragon.Treasure)
	if item.uid > 54000 and item.uid < 54021 then
		local reward = rewards[item.uid]
		if not reward then
			return true
		end
		if player:getStorageValue(Storage.TheFirstDragon.Progresso) >= 1 then
			if player:getStorageValue(Storage.TheFirstDragon.Treasure) < 20 and player:getStorageValue(reward.storage) < 1 then
				for i = 1, #reward.items do
					local items = reward.items[i]
					player:addItem(items.itemId, items.count or 1)
					player:setStorageValue(reward.storage, 1)
					player:setStorageValue(Storage.TheFirstDragon.Treasure, chestCount + 1)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have digged through a dragon treasure and found some valuables.")
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This dragon treasure is depleted.")
			end
		else
			player:getPosition():sendMagicEffect(CONST_ME_REDSMOKE)
			return true
		end
	end
	return true
end
