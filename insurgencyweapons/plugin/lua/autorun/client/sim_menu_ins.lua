
/*---------------------------------------------------------
   Name: AdminOptions()
---------------------------------------------------------*/
local function InsurgencyAdminOptions(panel)
	if not LocalPlayer():IsAdmin() then return end

	panel:AddControl("Label", {Text = ""})
	
	local  InsurgencyAdminOptions = {Options = {}, CVars = {}, Label = "#Presets", MenuButton = "1", Folder = "mad_cows_weapon"}
									
	 InsurgencyAdminOptions.CVars = {"sim_jam_t","sim_draw_t"}
	
	panel:AddControl("CheckBox", {
		Label = "Weapon Jamming",
		Command = "sim_jam_t",
	})
	panel:AddControl("CheckBox", {
		Label = "Reload On Draw",
		Command = "sim_draw_t",
	})
end	

/*---------------------------------------------------------
   Name: MadCowsToolMenu()
---------------------------------------------------------*/
function SiminovsToolMenuIns()

	spawnmenu.AddToolMenuOption("Options", "Siminov's Weapons", "Insurgency Options", "Insurgency Options", "", "", InsurgencyAdminOptions, {SwitchConVar = 'sim_draw_t'}, {SwitchConVar = 'sim_jam_t'})
end
hook.Add("PopulateToolMenu", "SiminovsToolMenuIns", SiminovsToolMenuIns)