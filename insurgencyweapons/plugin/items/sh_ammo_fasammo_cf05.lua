--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "CF-05 Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/cf05mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_cf05";
	ITEM.ammoClass = "ninemmgerman";
	ITEM.ammoAmount = 50;
	ITEM.description = "A magazine for a CF-05 SMG.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);