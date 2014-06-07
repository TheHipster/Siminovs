--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "M14 AR Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/m14mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_m14";
	ITEM.ammoClass = "sevensixtwobyfiftyone";
	ITEM.ammoAmount = 20;
	ITEM.description = "A magazine for an M14 Assault Rifle.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);