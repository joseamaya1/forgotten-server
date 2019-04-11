local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local vocation = {}
local town = {}
local config = {
	towns = {
		["venore"] = 1,
		["thais"] = 2,
		["carlin"] = 4
	},

	vocations = {
		["sorcerer"] = {
			text = "A SORCERER! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = 1,
			--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
			{{2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion, adventurer's stone
			{{2120, 1}, {2554, 1}, {7620, 1}, {18559, 1}}
		},

		["druid"] = {
			text = "A DRUID! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = 2,
			--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
			{{2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion, adventurer's stone
			{{2120, 1}, {2554, 1}, {7620, 1}, {18559, 1}}
		},

		["paladin"] = {
			text = "A PALADIN! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = 3,
			--equipment dwrven shield, 5 spear, ranger's cloak, ranger legs scarf, legion helmet
			{{2525, 1}, {2389, 5}, {2660, 1}, {8923, 1}, {2643, 1}, {2661, 1}, {2480, 1}},
			--container rope, shovel, health potion, bow, 50 arrow, adventurer's stone
			{{2120, 1}, {2554, 1}, {7618, 1}, {2456, 1}, {2544, 50}, {18559, 1}}
		},

		["knight"] = {
			text = "A KNIGHT! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!",
			vocationId = 4,
			--equipment dwarven shield, steel axe, brass armor, brass helmet, brass legs scarf
			{{2525, 1}, {8601, 1}, {2465, 1}, {2460, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion, adventurer's stone
			{{8602, 1}, {2439, 1}, {2120, 1}, {2554, 1}, {7618, 1}, {18559, 1}}
		}
	}
}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	local level = player:getLevel()
	if level < 8 then
		npcHandler:say("CHILD! COME BACK WHEN YOU HAVE GROWN UP!", cid)
		npcHandler:resetNpc(cid)
		return false
	elseif level > 10 then
		npcHandler:say(player:getName() ..", I CAN'T LET YOU LEAVE - YOU ARE TOO STRONG ALREADY! YOU CAN ONLY LEAVE WITH LEVEL 9 OR LOWER.", cid)
		npcHandler:resetNpc(cid)
		return false
	elseif player:getVocation():getId() > 0 then
		npcHandler:say("YOU ALREADY HAVE A VOCATION!", cid)
		npcHandler:resetNpc(cid)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, player:getName() ..", ARE YOU PREPARED TO FACE YOUR DESTINY?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if npcHandler.topic[cid] == 0 then
		if msgcontains(msg, "yes") then
			npcHandler:say("IN WHICH TOWN DO YOU WANT TO LIVE: {CARLIN}, {THAIS}, OR {VENORE}?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif npcHandler.topic[cid] == 1 then
		local cityTable = config.towns[msg:lower()]
		if cityTable then
			town[cid] = cityTable
			npcHandler:say("IN ".. string.upper(msg) .."! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("IN WHICH TOWN DO YOU WANT TO LIVE: {CARLIN}, {THAIS}, OR {VENORE}?", cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		local vocationTable = config.vocations[msg:lower()]
		if vocationTable then
			npcHandler:say(vocationTable.text, cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = vocationTable.vocationId
		else
			npcHandler:say("{KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			npcHandler:say("SO BE IT!", cid)
			player:setVocation(Vocation(vocation[cid]))
			player:setTown(Town(town[cid]))


				--In Service Of Yalahar
			player:setStorageValue(12240, 48) --QuestLine
			player:setStorageValue(12241, 6)  --Missions
			player:setStorageValue(12242, 8)
			player:setStorageValue(12243, 6)
			player:setStorageValue(12244, 6)
			player:setStorageValue(12245, 8)
			player:setStorageValue(12246, 5)
			player:setStorageValue(12247, 5)
			player:setStorageValue(12248, 4)
			player:setStorageValue(Storage.TheWayToYalahar.QuestLine, 30) --The Way to Yalahar Quest
			player:setStorageValue(12800, 8)	--SearoutesAroundYalahar
		--Children Of The Revolution
			player:setStorageValue(12300, 18) --QuestLine
			player:setStorageValue(12301, 2)  --Missions
			player:setStorageValue(12302, 3)
			player:setStorageValue(12303, 5)
			player:setStorageValue(12304, 3)
			player:setStorageValue(12305, 6)
		--The Travelling Trader
			player:setStorageValue(101, 2) --Mission
			player:setStorageValue(102, 5) 
			player:setStorageValue(103, 3)
			player:setStorageValue(104, 3)
			player:setStorageValue(105, 3)
			player:setStorageValue(106, 2)
			player:setStorageValue(107, 1)
		--The Inquisition
			player:setStorageValue(12160, 14) --QuestLine
			player:setStorageValue(12161, 7)  --Mission
			player:setStorageValue(12162, 3)
			player:setStorageValue(12163, 6)
			player:setStorageValue(12164, 3)
		--The New Frontier
			player:setStorageValue(12130, 24) --QuestLine
			player:setStorageValue(12131, 3)  --Missions
			player:setStorageValue(12132, 6)
			player:setStorageValue(12133, 3)
			player:setStorageValue(12134, 2)
			player:setStorageValue(12135, 7)
			player:setStorageValue(12136, 3)
			player:setStorageValue(12137, 3)
			player:setStorageValue(12138, 2)
			player:setStorageValue(12141, 12) -- Tome of Knowledge
		--Barbarian Test
			player:setStorageValue(12190, 8) --QuestLine
			player:setStorageValue(12191, 3) --Missions
			player:setStorageValue(12192, 3)
			player:setStorageValue(12193, 3)
		--Wrath Of The Emperor
			player:setStorageValue(12350, 24) --QuestLine
			player:setStorageValue(12351, 3)  --Missions
			player:setStorageValue(12352, 3)
			player:setStorageValue(12353, 3)
			player:setStorageValue(12354, 3)
			player:setStorageValue(12355, 3)
			player:setStorageValue(12356, 4)
			player:setStorageValue(12357, 6)
		--White Raven Monastery
			player:setStorageValue(50200, 1) --Missions
			player:setStorageValue(50201, 1)
			player:setStorageValue(50202, 2)
		--Factions
			player:setStorageValue(120, 1) --Missions Efreet Faction
			player:setStorageValue(121, 3)
			player:setStorageValue(122, 3)
			player:setStorageValue(123, 3)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Start, 1) --Missions Marid Faction
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission01, 2)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 2)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission03, 3)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.RataMari, 2)
		--The Ape City
			player:setStorageValue(12121, 15) --QuestLine
			player:setStorageValue(12120, 1) --Mission
		--Big Foot Burden
			player:setStorageValue(900, 30) --Missions
			player:setStorageValue(932, 5)
			player:setStorageValue(934, 7)
			player:setStorageValue(937, 10)
			player:setStorageValue(940, 3)
			player:setStorageValue(943, 1)
			player:setStorageValue(946, 4)
			player:setStorageValue(921, 1440)
			player:setStorageValue(955, 2)
			player:setStorageValue(956, 2)
			player:setStorageValue(957, 2)
		--The Postman Missions		
			player:setStorageValue(12450, 6) --Missions
			player:setStorageValue(12451, 3)
			player:setStorageValue(12452, 3)
			player:setStorageValue(12453, 2)
			player:setStorageValue(12454, 4)
			player:setStorageValue(12455, 13)
			player:setStorageValue(12456, 8)
			player:setStorageValue(12457, 3)
			player:setStorageValue(12458, 4)
			player:setStorageValue(12459, 3)
			player:setStorageValue(12460, 5)
			player:setStorageValue(12461)
		--The Shattered Isles
			player:setStorageValue(12700, 1) --Acess
			player:setStorageValue(12707, 1)
			player:setStorageValue(12706, 1)
			player:setStorageValue(12703, 1) --Eleonore
			player:setStorageValue(12705, 5)
			player:setStorageValue(12704, 3)
			player:setStorageValue(12710, 4)
			player:setStorageValue(12702, 2)
			player:setStorageValue(12701, 3)

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Town(town[cid]):getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received a backpack with starting items for reaching the mainlands.")
			local targetVocation = config.vocations[Vocation(vocation[cid]):getName():lower()]
			for i = 1, #targetVocation[1] do
				player:addItem(targetVocation[1][i][1], targetVocation[1][i][2])
			end
			local backpack = player:addItem(1988)
			for i = 1, #targetVocation[2] do
				backpack:addItem(targetVocation[2][i][1], targetVocation[2][i][2])
			end
		else
			npcHandler:say("THEN WHAT? {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

local function onAddFocus(cid)
	town[cid] = 0
	vocation[cid] = 0
end

local function onReleaseFocus(cid)
	town[cid] = nil
	vocation[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
