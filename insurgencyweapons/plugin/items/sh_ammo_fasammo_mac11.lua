--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "Mac11 SMG Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/mac11mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_mac11";
	ITEM.ammoClass = "ninemmshort";
	ITEM.ammoAmount = 32;
	ITEM.description = "A magazine for the Mac11 SMG.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);