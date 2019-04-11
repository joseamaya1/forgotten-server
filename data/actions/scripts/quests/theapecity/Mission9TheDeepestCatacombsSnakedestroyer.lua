local function revertSnakeHead(position)
	local headItem = Tile(position):getItemById(4862)
	if headItem then
		headItem:transform(4861)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 4861 then
		return false
	end

	if player:getStorageValue(Storage.TheApeCity.Questline) ~= 17
			or player:getStorageValue(Storage.TheApeCity.SnakeDestroyer) == 1 then
		return false
	end

	player:setStorageValue(Storage.TheApeCity.SnakeDestroyer, 1)
	item:remove()
	target:transform(4862)
	addEvent(revertSnakeHead, 40 * 1000, toPosition)
	target:decay()
	toPosition:sendMagicEffect(CONST_ME_FIREAREA)
	return true
end