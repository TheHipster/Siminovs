--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "M82 Sniper Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/m82mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_m82";
	ITEM.ammoClass = "fiftybmg";
	ITEM.ammoAmount = 10;
	ITEM.description = "A magazine for an M82 Sniper.";
	ITEM.value = 0.01;
Clockwork.item:Register(ITEM);