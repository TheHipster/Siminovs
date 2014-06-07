--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "G20 Glock Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/g20mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_glock";
	ITEM.ammoClass = "tenmmauto";
	ITEM.ammoAmount = 15;
	ITEM.description = "A magazine for a Glock.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);