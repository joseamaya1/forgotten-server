local crude_horn_with_mouthpiece = 22390

local config = {
	[22391] = { -- mouthpiece for a horn
	
		{{50001, 100000}, crude_horn_with_mouthpiece}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetItem = config[target.itemid]
	if not targetItem then
		return true
	end

	local chance = math.random(100000)
	for i = 1, #targetItem do
		if chance >= targetItem[i][1][1] and chance <= targetItem[i][1][2] then
			if targetItem[i][2] then
				target:transform(targetItem[i][2])
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			else
				player:say((isInArray({22391}, target.itemid) and "this item broke, try again." or "this item broke, try again."),TALKTYPE_MONSTER_SAY)
				target:remove()
				toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
			end
			return item:remove(1)
		end
	end
end