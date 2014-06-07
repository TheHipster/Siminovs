//SHOTGUN GROUP

// *********************************
// *********************************
// *                               *
// *         M1014 Shotgun         *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/m1014/m1014-01.wav","^weapons_ins/m1014/m1014-02.wav"}
instbl["name"] = "Weapoi_M1014.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = {"weapons_ins/m1014/m1014-shell-insert1.wav","weapons_ins/m1014/m1014-shell-insert2.wav","weapons_ins/m1014/m1014-shell-insert3.wav","weapons_ins/m1014/m1014-shell-insert4.wav","weapons_ins/m1014/m1014-shell-insert5.wav"}
instbl["name"] = "Weapoi_M1014.ShellInsert"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m1014/m1014-pumpback.wav"
instbl["name"] = "Weapoi_M1014.BoltBack"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m1014/m1014-pumpforward.wav"
instbl["name"] = "Weapoi_M1014.BoltRelease"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m1014/m1014-stockextend.wav"
instbl["name"] = "Weapoi_M1014.StockExtend"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["sound"] = "weapons_ins/m1014/m1014-stockcollapse.wav"
instbl["name"] = "Weapoi_M1014.StockCollapse"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *         TOZ             
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/toz_shotgun/toz_01.wav","^weapons_ins/toz_shotgun/toz_02.wav"}
instbl["name"] = "Weapoi_TOZ.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/toz_shotgun/toz_pumpback.wav"
instbl["name"] = "Weapoi_TOZ.BoltBack"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/toz_shotgun/toz_pumpforward.wav"
instbl["name"] = "Weapoi_TOZ.BoltRelease"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/toz_shotgun/toz_shell.wav"
instbl["name"] = "Weapoi_TOZ.ShellInsert"

sound.Add(instbl)

//PISTOL GROUP

// *********************************
// *********************************
// *                               *
// *             M1911             *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/1911/1911-1.wav"
instbl["name"] = "Weapoi_1911.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/1911/1911-magin.wav"
instbl["name"] = "Weapoi_1911.Clipin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/1911/1911-magout.wav"
instbl["name"] = "Weapoi_1911.Clipout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/1911/1911-slideforward.wav"
instbl["name"] = "Weapoi_1911.slideforward"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/1911/1911-slideback.wav"
instbl["name"] = "Weapoi_1911.slideback"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/1911/1911-safety.wav"
instbl["name"] = "Weapoi_1911.safety"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-empty.wav"
instbl["name"] = "Weapoi_1911.Empty"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *         Makarov               *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/makarov/makarov-01.wav"
instbl["name"] = "Weapoi_Makarov.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/makarov/makarov-magin.wav"
instbl["name"] = "Weapoi_Makarov.Magin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/makarov/makarov-magout.wav"
instbl["name"] = "Weapoi_Makarov.Magout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/makarov/makarov-slideforward.wav"
instbl["name"] = "Weapoi_Makarov.SlideForward"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/makarov/makarov-slideback.wav"
instbl["name"] = "Weapoi_Makarov.SlideBack"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/makarov/makarov-empty.wav"
instbl["name"] = "Weapoi_Makarov.Empty"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/makarov/makarov-slideback.wav"
instbl["name"] = "Weapoi_Makarov.Safety"

sound.Add(instbl)
// *********************************
// *********************************
// *                               *
// *         Beretta 92FS          *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["soundlevel"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.40"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/m9/m9-1.wav"
instbl["name"] = "Weapoi_M9.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-magin.wav"
instbl["name"] = "Weapoi_M9.Clipin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-magout.wav"
instbl["name"] = "Weapoi_M9.Clipout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-slideforward.wav"
instbl["name"] = "Weapoi_M9.slideforward"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-slideback.wav"
instbl["name"] = "Weapoi_M9.slideback"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-safety.wav"
instbl["name"] = "Weapoi_M9.safety"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m9/m9-empty.wav"
instbl["name"] = "Weapoi_M9.Empty"

sound.Add(instbl)

//ASSAULT RIFLE GROUP

// *********************************
// *********************************
// *                               *
// *             SKS             *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/sks/SKS_01.wav","^weapons_ins/sks/SKS_01.wav"}
instbl["name"] = "Weapoi_SKS.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/sks/sks_clipin.wav"
instbl["name"] = "Weapoi_SKS.Magin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/sks/sks_clipin2.wav"
instbl["name"] = "Weapoi_SKS.Magin2"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/sks/sks_stripper_off.wav"
instbl["name"] = "Weapoi_SKS.StripperOff"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/sks/sks_bolt_close.wav"
instbl["name"] = "Weapoi_SKS.Boltrelease"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/sks/sks_bolt_back.wav"
instbl["name"] = "Weapoi_SKS.Boltback"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *             M4A1              *
// *                               *
// *********************************
// *********************************
local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/M4/M4-1.wav","^weapons_ins/M4/M4-2.wav"}
instbl["name"] = "Weapoi_M4.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/m16A4/m16a4-1.wav","^weapons_ins/m16A4/m16a4-2.wav"}
instbl["name"] = "Weapoi_M16A4.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m16A4/m16a4-magin.wav"
instbl["name"] = "Weapoi_M16A4.Magin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m16A4/m16a4-magout.wav"
instbl["name"] = "Weapoi_M16A4.Magout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m16A4/m16a4-boltback.wav"
instbl["name"] = "Weapoi_M16A4.Boltback"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m16A4/m16a4-boltrelease.wav"
instbl["name"] = "Weapoi_M16A4.Boltrelease"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m16A4/m16a4-hit.wav"
instbl["name"] = "Weapoi_M16A4.Hit"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = {"weapons_ins/m16A4/m16A4-selectordown.wav","weapons_ins/m16A4/m16A4-selectorup.wav"}
instbl["name"] = "Weapoi_M16A4.ROF"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/m16A4/m16a4-empty.wav"
instbl["name"] = "Weapoi_M16A4.Empty"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/m16A4/m203-1.wav"
instbl["name"] = "Weapoi_M16A4.M203"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = ")weapons_ins/m16A4/m203-open.wav"
instbl["name"] = "Weapoi_M203.Open"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = ")weapons_ins/m16A4/m203-close.wav"
instbl["name"] = "Weapoi_M203.Close"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = ")weapons_ins/m16A4/m203-load.wav"
instbl["name"] = "Weapoi_M203.Load"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/ak47/ak47-selectorup.wav"
instbl["name"] = "Weapoi_M203.Sightup"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/ak47/ak47-selectordown.wav"
instbl["name"] = "Weapoi_M203.Sightdown"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *             AK47              *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/aK47/ak47-1.wav","^weapons_ins/aK47/ak47-2.wav"}
instbl["name"] = "Weapoi_AK47.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = "^weapons_ins/aks74u/aks74u-fire.wav"
instbl["name"] = "Weapoi_AKS74U.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/aK47/ak47-magin.wav"
instbl["name"] = "Weapoi_AK47.Magin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/aK47/ak47-magout.wav"
instbl["name"] = "Weapoi_AK47.Magout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/ak47/ak47-empty.wav"
instbl["name"] = "Weapoi_AK47.Empty"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/ak47/ak47-boltback.wav"
instbl["name"] = "Weapoi_AK47.Boltback"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/ak47/ak47-boltrelease.wav"
instbl["name"] = "Weapoi_AK47.Boltrelease"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/ak47/ak47-boltrelease.wav"
instbl["name"] = "Weapoi_AK47.Boltrelease"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = {"weapons_ins/ak47/ak47-selectordown.wav","weapons_ins/ak47/ak47-selectorup.wav"}
instbl["name"] = "Weapoi_AK47.ROF"

sound.Add(instbl)

// *********************************
// *********************************
// *                               *
// *              FAL              *
// *                               *
// *********************************
// *********************************

local instbl = {}
instbl["channel"] = "1"
instbl["level"] = "140"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "0.27"
instbl["pitch"] = "95,105"
instbl["sound"] = {"^weapons_ins/fnfal/fal-01.wav","^weapons_ins/fnfal/fal-02.wav"}
instbl["name"] = "Weapoi_FAL.Single"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/fnfal/fal_clip_in.wav"
instbl["name"] = "Weapoi_FAL.Magin"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/fnfal/fal_clip_out.wav"
instbl["name"] = "Weapoi_FAL.Magout"

sound.Add(instbl)

local instbl = {}
instbl["channel"] = "3"
instbl["level"] = "75"
instbl["volume"] = "1.0"
instbl["CompatibilityAttenuation"] = "1"
instbl["pitch"] = "95,105"
instbl["sound"] = "weapons_ins/fnfal/fal_chamber.wav"
instbl["name"] = "Weapoi_FAL.Chamber"

sound.Add(instbl)