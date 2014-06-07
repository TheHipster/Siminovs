//MACHINE GUN GROUP

// *********************************
// *********************************
// *                               *
// *             M249              *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/m249/m249-1.wav"
instbl["name"] = "Weapoi_M249.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-beltin.wav"
instbl["name"] = "Weapoi_M249.BulletsLoad"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.3"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-beltout.wav"
instbl["name"] = "Weapoi_M249.BulletsUnload"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.3"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-open.wav"
instbl["name"] = "Weapoi_M249.OpenLid"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.3"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-close.wav"
instbl["name"] = "Weapoi_M249.CloseLid"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.3"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-bipodown.wav"
instbl["name"] = "Weapoi_M249.BipodOpen"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.3"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-bipoup.wav"
instbl["name"] = "Weapoi_M249.BipodClose"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.3"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-boxin.wav"
instbl["name"] = "Weapoi_M249.BoxIn"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-boxout.wav"
instbl["name"] = "Weapoi_M249.BoxOut"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-empty.wav"
instbl["name"] = "Weapoi_M249.Empty"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m249/m249-boltback.wav"
instbl["name"] = "Weapoi_M249.Boltpull"

sound.Add(instbl)


// *********************************
// *********************************
// *                               *
// *             RPK               *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/rpk/rpk-1.wav","^weapons_ins/rpk/rpk-2.wav"}
instbl["name"] = "Weapoi_RPK.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/fnfal/fal_clip_in.wav"
instbl["name"] = "Weapoi_RPK.Clipin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpk/rpk-magout.wav"
instbl["name"] = "Weapoi_RPK.Clipout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpk/rpk-bipodown.wav"
instbl["name"] = "Weapoi_RPK.BipodDown"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpk/rpk-bipodup.wav"
instbl["name"] = "Weapoi_RPK.BipodUp"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpk/rpk-cock.wav"
instbl["name"] = "Weapoi_RPK.BoltPull"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpk/rpk-ironsight.wav"
instbl["name"] = "Weapoi_RPK.Ironsight"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpk/rpk-empty.wav"
instbl["name"] = "Weapoi_RPK.Empty"

sound.Add(instbl)

//SNIPER RIFLE GROUP

// *********************************
// *********************************
// *                               *
// *           SVD	           	*
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/svd/svd-fire.wav"
instbl["name"] = "Weapoi_SVD.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/svd/svd-clipin1.wav"
instbl["name"] = "Weapoi_SVD.Clipin1"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/svd/svd-clipin2.wav"
instbl["name"] = "Weapoi_SVD.Clipin2"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/svd/svd-clipout.wav"
instbl["name"] = "Weapoi_SVD.Clipout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/svd/svd-boltback.wav"
instbl["name"] = "Weapoi_SVD.Boltback"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/svd/svd-boltforward.wav"
instbl["name"] = "Weapoi_SVD.Boltforward"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *       Enfield L42A1           *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/enfield/enfield-01.wav","^weapons_ins/enfield/enfield-02.wav"}
instbl["name"] = "Weapoi_L42A1.Single"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/enfield/enfield-roundin.wav"
instbl["name"] = "Weapoi_L42A1.Roundin"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/enfield/enfield-roundout.wav"
instbl["name"] = "Weapoi_L42A1.Roundout"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/enfield/enfield-boltback.wav"
instbl["name"] = "Weapoi_L42A1.Boltback"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/enfield/enfield-boltforward.wav"
instbl["name"] = "Weapoi_L42A1.Boltforward"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/enfield/enfield-empty.wav"
instbl["name"] = "Weapoi_L42A1.Empty"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *         M14         			*
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.2"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/m14/m14-01.wav","^weapons_ins/m14/m14-02.wav"}
instbl["name"] = "Weapoi_M14.Single"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m14/m14-magin.wav"
instbl["name"] = "Weapoi_M14.Clipin"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m14/m14-magout.wav"
instbl["name"] = "Weapoi_M14.Clipout"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m14/m14-boltback.wav"
instbl["name"] = "Weapoi_M14.Boltback"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m14/m14-boltforward.wav"
instbl["name"] = "Weapoi_M14.Boltforward"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m14/m14-hit.wav"
instbl["name"] = "Weapoi_M14.Hit"

sound.Add(instbl)

//EXPLOSIVES GROUP

// *********************************
// *********************************
// *                               *
// *       Smoke Grenade	       *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "SNDLVL_90dB"
instbl["volume"] = "1.0"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/m18/smokeburn.wav"
instbl["name"] = "Weapoi_Smoke.Explode"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.7"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/pullpin.wav"
instbl["name"] = "Weapoi_Smoke.Pin"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/throw.wav"
instbl["name"] = "Weapoi_Smoke.Throw"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.7"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/roll.wav"
instbl["name"] = "Weapoi_Smoke.Roll"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *             Frag              *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "150"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.2"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/m67/frag-01.wav","^weapons_ins/m67/frag-02.wav","^weapons_ins/m67/frag-03.wav"}
instbl["name"] = "Weapoi_M67.Explode"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/pullpin.wav"
instbl["name"] = "Weapoi_M67.Pin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/spoon.wav"
instbl["name"] = "Weapoi_M67.Spoon"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/throw.wav"
instbl["name"] = "Weapoi_M67.Throw"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m67/bakethrow.wav"
instbl["name"] = "Weapoi_M67.BakeThrow"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = {"weapons_ins/m67/roll1.wav","weapons_ins/m67/roll2.wav","weapons_ins/m67/roll3.wav","weapons_ins/m67/roll4.wav","weapons_ins/m67/roll5.wav","weapons_ins/m67/roll6.wav"}
instbl["name"] = "Weapoi_M67.Bounce"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *             RPG7              *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.2"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/rpg7/rpg7-hit.wav"
instbl["name"] = "Weapoi_RPG7.Hit"

sound.Add(instbl)

instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/rpg7/rpg7-fire.wav"
instbl["name"] = "Weapoi_RPG7.Single"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpg7/rpg7-empty.wav"
instbl["name"] = "Weapoi_RPG7.Empty"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpg7/rpg7-reload.wav"
instbl["name"] = "Weapoi_RPG7.Reload"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpg7/rpg7-load.wav"
instbl["name"] = "Weapoi_RPG7.Load"

sound.Add(instbl)

instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/rpg7/rpg7-unload.wav"
instbl["name"] = "Weapoi_RPG7.Unload"

sound.Add(instbl)


//HAND WEAPONS GROUP

// *********************************
// *********************************
// *                               *
// *   Knife 					   *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "100"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.5"
instbl["pitch"] = "95,105"
instbl["sound"] = {"weapons_ins/knife/knife_hit1.wav","weapons_ins/knife/knife_hit2.wav","weapons_ins/knife/knife_hit3.wav","weapons/knife/knife_hit4.wav"}
instbl["name"] = "Weapoi_Knife.Hit"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "100"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.5"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-quickmove.wav"
instbl["name"] = "Weapoi_Knife.Slash"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1.0"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/knife/knife_deploy1.wav"
instbl["name"] = "Weapoi_Knife.Deploy"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "100"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/knife/knife_hitwall1.wav"
instbl["name"] = "Weapoi_Knife.HitWall"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "100"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/knife/knife_stab.wav"
instbl["name"] = "Weapoi_Knife.Stab"

sound.Add(instbl)


//EXTRAS

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/c4/c4-knob.wav"
instbl["name"] = "Weapoi_C4.Knobturn"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-ironin.wav"
instbl["name"] = "Universai.IronIn"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-ironout.wav"
instbl["name"] = "Universai.IronOut"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-draw.wav"
instbl["name"] = "Universai.Draw"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-holster.wav"
instbl["name"] = "Universai.Holster"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-grab.wav"
instbl["name"] = "Universai.Grab"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.25"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-pistol-empty.wav"
instbl["name"] = "Universai.Pistol"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.25"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/universal/uni-rifle-empty.wav"
instbl["name"] = "Universai.Rifle"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.25"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/jamming/jam1.wav"
instbl["name"] = "Jam.Short.Rifle"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.25"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/jamming/jam2.wav"
instbl["name"] = "Jam.Long.Rifle"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.25"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/jamming/jam3.wav"
instbl["name"] = "Jam.Short.Pistol"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "0.25"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/jamming/jam4.wav"
instbl["name"] = "Jam.Long.Pistol"

sound.Add(instbl)