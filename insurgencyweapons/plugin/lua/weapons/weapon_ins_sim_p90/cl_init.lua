include('shared.lua')

SWEP.PrintName			= "FN P90"					// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 2							// Slot in the weapon selection menu
SWEP.SlotPos			= 1							// Position in the slot
SWEP.Instructions			= "Uses 5.7mm ammo, Alternate Mode: E + Right Click, Switch Weapons: E + Left Click"
// Override this in your SWEP to set the icon in the weapon selection
if (file.Exists("materials/weapons/weapon_ins_sim_p90.vmt","GAME")) then
	SWEP.WepSelectIcon	= surface.GetTextureID("weapons/weapon_ins_sim_p90")
end