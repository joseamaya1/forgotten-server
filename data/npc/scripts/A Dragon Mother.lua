local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                              npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local player = Player(cid)

    if msgcontains(msg, 'help') and npcHandler.topic[cid] == 0 then
        npcHandler:say({
            "I'm aware what you are looking for. Usually I would rather devour you, but due to unfortunate circumstances, I need your {assistance}.",
            "..."
        }, cid)
        npcHandler.topic[cid] = 0
    end

    if player:getStorageValue(10168) <= 0 then 
        if msgcontains(msg, 'assistance') then
            npcHandler:say({
			"Wretched creatures of ice have stolen my egg that was close to hatching. Since I'm to huge to enter those lower Tunnels I have to ask you to take care of my {egg}. Will you do this?"}, cid)
            npcHandler.topic[cid] = 1
     
        elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
            npcHandler:say({ 
                "So return to the upper tunnels where cultists and ice golems dwell. Somewhere in these tunnels you will find a small prison haunted by a ghost. South of this prison cell there is a tunnel that will lead you eastwards. ... Follow the tunnel until you reach a small cave. Step down and down until you see a blue energy field. It will lead you to my egg. It is sealed so that not everyone may enter the room. But you have the permission now."
				}, cid)
        player:setStorageValue(Storage.ForgottenKnowledge.BabyDragon, 1)    
        npcHandler.topic[cid] = 2

        end
    end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())