function onUpdateDatabase()
	print("> Updating database to version 29 (Fix item high values)")
	db.query("ALTER TABLE `player_items` CHANGE `itemtype` `count` INT(11) NOT NULL DEFAULT '0';")
	db.query("ALTER TABLE `player_depotitems` CHANGE `itemtype` `count` INT(11) NOT NULL DEFAULT '0';")
	db.query("ALTER TABLE `player_inboxitems` CHANGE `itemtype` `count` INT(11) NOT NULL DEFAULT '0';")
	db.query("ALTER TABLE `player_rewards` CHANGE `itemtype` `count` INT(11) NOT NULL DEFAULT '0';")
	return true
end
