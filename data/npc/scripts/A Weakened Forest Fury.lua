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

    if msgcontains(msg, 'distress') and npcHandler.topic[cid] == 0 then
        npcHandler:say({
            "My pride is great but not greater than reason. I am not too proud to ask for help as this is a dark hour. ...",
            "This glade has been desecrated. We kept it secret for centuries, yet evil has found a way to sully and destroy what was our most sacred. ...",
            "There is only one way to reinvigorate its spirits, a guardian must venture down there and bring life back into the forest. ...",
            "Stolen {seeds} need to be wrested from the {intruder}s and planted where the soil still hungers. ...",
            "The purest {water} from the purest well needs to be brought there and poured and {birds} that give life need to be brought back to the inner sanctum of the glade. ...",
            "Will you be our guardian?"
        }, cid)
        npcHandler.topic[cid] = 0
    end

    if player:getStorageValue(10142) <= 0 then
        if msgcontains(msg, 'yes') then
            npcHandler:say({"Indeed, you will. Take one of these {cages}, which have been crafted generations ago to rob a creature of its freedom for that it may ",
                "earn it again truthfully. Return the birds back to their home in the glade. ...",
                "You will find {phials} for {water} near this sacred well which will take you safely to the glade. No seeds are left, they are in the hands of the {intruders} now. Have faith in yourself, guardian."
        }, cid)
            npcHandler.topic[cid] = 1

         player:setStorageValue(Storage.ForgottenKnowledge.Phial, 1)
         player:addItem(26480, 1)
         npcHandler.topic[cid] = 1

        end

    end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

