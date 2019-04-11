local ITEM_IDS = {
[24809] = 24810,
[24810] = 24809
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
if(not ITEM_IDS[item.itemid]) then
return false
end


doTransformItem(item.uid, ITEM_IDS[item.itemid])
doDecayItem(item.uid)

return true
end