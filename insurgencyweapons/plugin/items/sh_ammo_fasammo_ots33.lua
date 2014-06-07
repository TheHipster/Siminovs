--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "OTS33 Pistol Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/ots33mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_ots33";
	ITEM.ammoClass = "ninemmrussian";
	ITEM.ammoAmount = 18;
	ITEM.description = "A magazine for the OTS33 Pistol.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);