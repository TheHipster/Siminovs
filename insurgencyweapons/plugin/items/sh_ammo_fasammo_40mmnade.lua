--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "40mm Grenade";
	ITEM.batch = 1;
	ITEM.model = "models/weapons/w_40mmgren.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_40mmnade";
	ITEM.ammoClass = "fourtymmgrenade";
	ITEM.ammoAmount = 1;
	ITEM.description = "A Grenade for the Grenade Launcher.";
	ITEM.value = 0.03;
Clockwork.item:Register(ITEM);