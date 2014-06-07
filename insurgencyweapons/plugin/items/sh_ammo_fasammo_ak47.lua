--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "AK47 Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/akmag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_ak47";
	ITEM.ammoClass = "sevensixtwoshort";
	ITEM.ammoAmount = 30;
	ITEM.description = "A magazine for an AK47 Rifle.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);