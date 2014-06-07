
SIMINSM = {}

include("autorun/weapon_sounds_ins1.lua")
include("autorun/weapon_sounds_ins2.lua")
include("autorun/weapon_sounds_ins3.lua")
include("autorun/weapon_sounds_ins4.lua")

if (CLIENT) then
	include("autorun/client/sim_menu_updated.lua")
	include("autorun/client/sim_menu_ins.lua")
end