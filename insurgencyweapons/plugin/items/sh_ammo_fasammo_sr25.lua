--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "SR25 Sniper Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/sr25mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_sr25";
	ITEM.ammoClass = "sevensixtwobyfiftyone";
	ITEM.ammoAmount = 10;
	ITEM.description = "A magazine for the SR-25 Sniper-Rifle.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);