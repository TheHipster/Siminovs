--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "M24 Sniper Rounds";
	ITEM.batch = 1;
	ITEM.model = "models/items/762bullets.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_m24";
	ITEM.ammoClass = "sevensixtwobyfiftyone";
	ITEM.ammoAmount = 5;
	ITEM.description = "Rounds for an M24 Sniper.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);