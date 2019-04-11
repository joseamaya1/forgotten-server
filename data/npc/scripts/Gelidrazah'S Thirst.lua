local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local player = Player(cid)

    if player:getStorageValue(34014) == 1 and player:getStorageValue(34009) < 4 then 
        if msgcontains(msg, 'yes') then
            npcHandler:say({
                "There are three questions. First: What is the name of the princess who fell in love with a Thaian nobleman during the regency of pharaoh Uthemath? Second: Who is the author of the book 'The Language of the Wolves'? ...",
                "Third: Which ancient Tibian race reportedly travelled the sky in cloud ships? Can you answer these {questions}?"
            }, cid)
            npcHandler.topic[cid] = 2	
     
            elseif msgcontains(msg, 'questions') and npcHandler.topic[cid] == 2 then
                npcHandler:say({
                    "So I ask you: What is the name of the princess who fell in love with a Thaian nobleman during the regency of pharaoh Uthemath?"}, cid)
            npcHandler.topic[cid] = 3

            elseif msgcontains(msg, 'tahmehe') and npcHandler.topic[cid] == 3 then
                npcHandler:say({
                    "That's right. Listen to the second question: Who is the author of the book 'The Language of the Wolves'?"}, cid)
                npcHandler.topic[cid] = 4
                player:setStorageValue(34009, 2)
        
            elseif msgcontains(msg, 'ishara') and npcHandler.topic[cid] == 4 then
                npcHandler:say({
                "That's right. Listen to the third question: Which ancient Tibian race reportedly travelled the sky in cloud ships?"
            }, cid)
            npcHandler.topic[cid] = 5
            player:setStorageValue(34009, 3)

            elseif msgcontains(msg, 'svir') and npcHandler.topic[cid] == 5 then
                npcHandler:say({
                "That is correct. You satisfactorily answered all questions. You may pass and enter Gelidrazah's lair."
            }, cid)
            player:setStorageValue(34009, 4)
            npcHandler.topic[cid] = 0
    
        else
            npcHandler:say({
                "That's wrong. You have to answer again all the questions. ...",
                "So I ask you again: What is the name of the princess who fell in love with a Thaian nobleman during the regency of pharaoh Uthemath?"
            }, cid)
            player:setStorageValue(34009, 1)
            npcHandler.topic[cid] = 3
        end
        else
            npcHandler:say({"I don't have anything to say to you."}, cid)
            npcHandler.topic[cid] = 0
        end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())