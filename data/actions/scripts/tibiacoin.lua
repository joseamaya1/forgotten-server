local config = {
   idcoin = 24774
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
   local player = Player(cid)
   local item = Item(item.uid)
   if player:getItemCount(config.idcoin) > 0 then
       local coinplayer = player:getCoinsBalance()+item:getCount()
       player:getPosition():sendMagicEffect(15)
       item:remove()
       player:setCoinsBalance(coinplayer)
   else
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to carry tibia coins in your backpack.")
   end
   return true
end