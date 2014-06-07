--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("ammo_base");
	ITEM.cost = 71;
	ITEM.name = "Colt 1911 Magazine";
	ITEM.batch = 1;
	ITEM.model = "models/items/1911mag.mdl";
	ITEM.weight = 0.8;
	ITEM.access = "W";
	ITEM.business = true;
	ITEM.uniqueID = "ammo_fasammo_pistol_1911";
	ITEM.ammoClass = "fourtyfiveacp";
	ITEM.ammoAmount = 7;
	ITEM.description = "A magazine for a Colt 1911 Pistol.";
	ITEM.value = 0.3;
Clockwork.item:Register(ITEM);