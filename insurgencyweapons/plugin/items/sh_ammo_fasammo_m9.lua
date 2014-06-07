--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "M9 Pistol Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/m9mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_m9";
	ITEM.ammoClass = "ninemmgerman";
	ITEM.ammoAmount = 15;
	ITEM.description = "A magazine for an M9 Pistol.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);