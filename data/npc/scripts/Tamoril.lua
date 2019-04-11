local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local player = Player(cid)

    if msgcontains(msg, 'magic') and npcHandler.topic[cid] == 0 then
        npcHandler:say({
            "What you call magic is only a pale shadow of real magic. The more you try, the more magic will retreat from you. ...",
            "To us dragons magic comes natural. It is a part of us, and not a tool we have to learn to control like you do."
        }, cid)
        npcHandler.topic[cid] = 0
    
    elseif msgcontains(msg, 'dragon') and npcHandler.topic[cid] == 0 then
        npcHandler:say({
            "Dragons are the most powerful creatures of the world. Every year, we gain more and more power. ...",
            "Hardly anyone of us dies of old age. Instead we find death by diseases brought to our race by you mortal pests, and countless of my younger brethren and sisters have been slaughtered by humans. ...",
            "Expect little from me mortal. And even for that little, you will have to pay dearly."
        }, cid)
        npcHandler.topic[cid] = 0
    end

    if player:getStorageValue(34014) <= 0 then 
        if msgcontains(msg, 'first dragon') or msgcontains(msg, 'the first dragon') then
            npcHandler:say({"The First Dragon? The first of all of us? The Son of Garsharak? I'm surprised you heard about him. It is such a long time that he wandered Tibia. Yet, there are some {rumours}."}, cid)
            npcHandler.topic[cid] = 1	
     
        elseif msgcontains(msg, 'rumours') and npcHandler.topic[cid] == 1 then
            npcHandler:say({
                "It is told that the First Dragon had four {descendants}, who became the ancestors of the four kinds of dragons we know in Tibia. They perhaps still have knowledge about the First Dragon's whereabouts - if one could find them."}, cid)
        npcHandler.topic[cid] = 2

        elseif msgcontains(msg, 'descendants') and npcHandler.topic[cid] == 2 then
            npcHandler:say({
                "The names of these four are Tazhadur, Kalyassa, Gelidrazah and Zorvorax. Not only were they the ancestors of all dragons after but also the primal representation of the {draconic incitements}. About whom do you want to learn more?"}, cid)
            npcHandler.topic[cid] = 3

        elseif msgcontains(msg, 'draconic incitements') or msgcontains(msg, 'draconic') and npcHandler.topic[cid] == 3 then
            npcHandler:say({
            "Each kind of dragon has its own incitement, an important aspect that impels them and occupies their mind. For the common dragons this is the lust for power, for the dragon lords the greed for treasures. ...",
            "The frost dragons' incitement is the thirst for knowledge and for the undead dragons it's the desire for life, as they regret their ancestor's mistake. ...",
            "These incitements are also a kind of trial that has to be undergone if one wants to {find} the First Dragon's four descendants."
        }, cid)
        npcHandler.topic[cid] = 4

        elseif msgcontains(msg, 'find') and npcHandler.topic[cid] == 4 then
            npcHandler:say({
            "What do you want to do, if you know about these mighty dragons' abodes? Go there and look for a fight?"
        }, cid)
        npcHandler.topic[cid] = 5

        elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 5 then
            npcHandler:say({
            "Fine! I'll tell you where to find our ancestors. You now may ask yourself why I should want you to go there and fight them. It's quite simple: I am a straight descendant of Kalyassa herself. She was not really a caring mother. ...",
            "No, she called herself an empress and behaved exactly like that. She was domineering, farouche and conceited and this finally culminated in a serious quarrel between us. ...",
            "I sought support by my aunt and my uncles but they were not a bit better than my mother was! So, feel free to go to their lairs and challenge them. I doubt you will succeed but then again that's not my problem. ...",
            "So, you want to know about their secret lairs?"
        }, cid)
        npcHandler.topic[cid] = 6

        elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 6 then
            npcHandler:say({
            "The lairs are secluded and you can only reach them by using a magical gem teleporter. You will find a teleporter carved out of a giant emerald in the dragon lairs deep beneath the Darama desert, which will lead you to Tazhadur's lair. ...",
            "A ruby teleporter located in the western Dragonblaze Peaks allows you to enter the lair of Kalyassa. A teleporter carved out of sapphire is on the island Okolnir and leads you to Gelidrazah's lair. ...",
            "And finally an amethyst teleporter in undead-infested caverns underneath Edron allows you to enter the lair of Zorvorax."
        }, cid)
        player:setStorageValue(Storage.TheFirstDragon.Progresso, 1)
        player:setStorageValue(Storage.TheFirstDragon.DragonCount, 1)
        player:setStorageValue(Storage.TheFirstDragon.Treasure, 1)
        player:setStorageValue(Storage.TheFirstDragon.Npc, 1)
        player:setStorageValue(Storage.TheFirstDragon.Steps, 0)
        npcHandler.topic[cid] = 7

        end
    elseif player:getStorageValue(Storage.TheFirstDragon.Progresso) == 1 and npcHandler.topic[cid] == 7 then
            npcHandler:say({"I already told you everything I knew. Leave puny mortal."}, cid)
            npcHandler.topic[cid] = 0
    end
return TRUE
end

keywordHandler:addKeyword({'mortal'}, StdModule.say, {npcHandler = npcHandler, text = "You puny mortals are an annoyance. However, the little magic your simple minds are able to comprehend earns me enough money not to kill you."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, text = "I share some of my eternal knowledge of spells with you humans ... for a price of course. You should be grateful."})
keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, text = "I share some of my eternal knowledge of spells with you humans ... for a price of course. You should be grateful."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't teach spells for your vocation."})
keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, text = "The city is dying. It is mortal just like you and for this reason, it is insignificant. I will still be around when this city is long forgotten."})
keywordHandler:addKeyword({'magician'}, StdModule.say, {npcHandler = npcHandler, text = "Another bunch of humans who dabbles in the arcane arts to become godlike beings."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My real name is not pronounceable for a human."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I share some of my eternal knowledge of spells with you humans ... for a price of course. You should be grateful."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
