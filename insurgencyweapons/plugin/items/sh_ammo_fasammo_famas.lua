--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "Famas Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/famasmag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_famas";
	ITEM.ammoClass = "fivefivesix";
	ITEM.ammoAmount = 25;
	ITEM.description = "A magazine for a Famas Rifle.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);