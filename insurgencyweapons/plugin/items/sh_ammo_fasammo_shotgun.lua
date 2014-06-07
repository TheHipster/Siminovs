--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "Shotgun Shells";
	ITEM.batch = 1;
	ITEM.model = "models/items/boxbuckshot.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_shotgun";
	ITEM.ammoClass = "shotgunshell";
	ITEM.ammoAmount = 20;
	ITEM.description = "Shells for the Shotguns.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);