--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "Deagle Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/deaglemag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_Deagle";
	ITEM.ammoClass = "fiftyae";
	ITEM.ammoAmount = 7;
	ITEM.description = "A magazine for the Desert Eagle pistol.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);