// Variables that are used on both client and server
local Walkspeed = CreateConVar ("sim_walk_speed", "250", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local Runspeed = CreateConVar ("sim_run_speed", "500", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local WeightMod	= CreateClientConVar("sim_weightmod_t", 1, true, false)		// Enable/Disable
local FirstDraw = CreateClientConVar("sim_draw_t", 1, true, false)		// Enable/Disable

SWEP.Instructions			= "Uses 5.56mm ammo, Alternate Mode: E + Right Click, Switch Weapons: E + Left Click"
SWEP.Base 				= "weapon_insa_sim_base"
SWEP.HoldType				= "smg"
SWEP.ViewModelFlip		= false
SWEP.ViewModel			= Model("models/weapons/i_rif_m16m202.mdl")
SWEP.WorldModel			= Model("models/weapons/j_rif_m16m202.mdl")
SWEP.ViewModelFOV      = 65

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound 		= Sound("Weapoi_M16A4.Single")
SWEP.Primary.Recoil		= 1.6
SWEP.Primary.Damage		= 24
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.004
SWEP.Primary.Delay 		= 0.08

SWEP.Primary.ClipSize		= 30					// Size of a clip
SWEP.Primary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true			// Automatic/Semi Auto
SWEP.Primary.Ammo			= "fivefivesix"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "sim_shelleject_fas_556"	// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"

SWEP.Pistol				= false
SWEP.Rifle				= true
SWEP.Shotgun			= false
SWEP.Sniper				= false

SWEP.IronSightsPos = Vector (-2.6075, -4.0, 1.9103)
SWEP.IronSightsAng = Vector (0.0297, 0.0137, 0)

SWEP.RunArmOffset  = Vector (4.0928, 0.4246, 2.3712)
SWEP.RunArmAngle   = Vector (-18.4406, 33.1846, 0)

SWEP.Type				= 1
SWEP.Mode				= true

SWEP.Speed = 0.6
SWEP.Mass = 0.8

/*---------------------------------------------------------
   Name: SWEP:Precache()
   Desc: Use this function to precache stuff.
---------------------------------------------------------*/
function SWEP:Precache()
	util.PrecacheSound("weapons_ins/M4/M4-1.wav")
	util.PrecacheSound("weapons_ins/M4/M4-2.wav")
    util.PrecacheSound("weapons_ins/m16A4/m16a4-1.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-2.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-magin.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-magout.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-boltback.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-boltrelease.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-hit.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16A4-selectordown.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16A4-selectorup.wav")
	util.PrecacheSound("weapons_ins/m16A4/m16a4-empty.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-1.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-open.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-close.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-load.wav")
	util.PrecacheSound("weapons_ins/ak47/ak47-selectorup.wav")
	util.PrecacheSound("weapons_ins/ak47/ak47-selectordown.wav")
end	

/*---------------------------------------------------------
   Name: SWEP:SetIronsights()
---------------------------------------------------------*/
function SWEP:SetIronsights(b)

	if (self.Owner) then
		if (b) then
			if (SERVER) then
				self.Owner:SetFOV(65, 0.2)
			end
	
			if self.AllowIdleAnimation then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
				self.Owner:GetViewModel():SetPlaybackRate(0)
			end
			if WeightMod:GetBool() then
				self.Weapon:EmitSound("Universai.IronIn")
				self.Owner:SetRunSpeed(Walkspeed:GetFloat()*self.Speed*self.Mass)
				self.Owner:SetWalkSpeed(Walkspeed:GetFloat()*self.Speed*self.Mass)
			else
				self.Weapon:EmitSound("Universai.IronIn")
			end
		else
			if (SERVER) then
				self.Owner:SetFOV(0, 0.2)
			end

			if self.AllowPlaybackRate and self.AllowIdleAnimation then
				self.Owner:GetViewModel():SetPlaybackRate(1)
			end	
			if WeightMod:GetBool() and not self.Weapon:GetDTBool(0) then
				self.Owner:SetRunSpeed(Runspeed:GetFloat()*self.Mass)
				self.Owner:SetWalkSpeed(Walkspeed:GetFloat()*self.Mass)
				self.Weapon:EmitSound("Universai.IronOut")
			else
				self.Weapon:EmitSound("Universai.IronOut")
			end
		end
	end

	if (self.Weapon) then
		self.Weapon:SetDTBool(1, b)
	end
end

/*---------------------------------------------------------
   Name: SWEP:Reload()
   Desc: Reload is being pressed.
---------------------------------------------------------*/
function SWEP:Reload()

	if (self.Owner:KeyDown(IN_USE)) then
		
		if self.Weapon:GetDTBool(0) or self.Owner:KeyDown(IN_SPEED) then return end
		self.Weapon:SetNextPrimaryFire(CurTime() + 3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 3)

		if (SERVER) then
			
			local knife = ents.Create("weapon_ins_sim_ent_m16a3m203")
			knife:SetAngles(self.Owner:EyeAngles())

//				if (self:GetIronsights() == false) then
				local pos = self.Owner:GetShootPos()
					pos = pos + self.Owner:GetForward() * 5
					pos = pos + self.Owner:GetRight() * 9
					pos = pos + self.Owner:GetUp() * -5
				knife:SetPos(pos)
//			else
//				knife:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector()))
//			end

			knife:Spawn()
			knife:Activate()

			local phys = knife:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 100)
			phys:AddAngleVelocity(Vector(0, 0, 0))
			
			self.Owner:StripWeapon("weapon_ins_sim_m203a3")
			self.Owner:StripWeapon("weapon_ins_sim_m16a3m203") 
			
			if (SERVER) then
				RunConsoleCommand("lastinv")
			end

		end
	else

		// When the weapon is already doing an animation, just return end because we don't want to interrupt it
		if (self.ActionDelay > CurTime()) or self.Owner:KeyDown(IN_SPEED) then return end 
		if self.Weapon:GetDTBool(0) or (self:GetNWBool("LittleJammed") or self:GetNWBool("BigJammed")) or (self:Clip1() == (self.Primary.ClipSize + 1)) then return end
		
		if (SERVER) then
			if ( self.Reloadaftershoot > CurTime() ) then return end 
		end

		// Need to call the default reload before the real reload animation
		self.Weapon:DefaultReload(ACT_VM_RELOAD)

		if (self.Weapon:Clip1() < self.Primary.ClipSize) and (self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
			self:SetIronsights(false)
			self:ReloadAnimation()
		end
	end
end

/*---------------------------------------------------------
   Name: SWEP:SetMode()
---------------------------------------------------------*/
function SWEP:SetMode(b)

	if (self.Owner) then
		if (b) then
			if self.Type == 1 then
				self.Weapon:EmitSound("Weapoi_M16A4.ROF")
				self.Primary.Automatic = self.data.Automatic
				self.Weapon:SendWeaponAnim(ACT_VM_UNDEPLOY)
			elseif self.Type == 2 then
				// Nothing here for the burst fire mode
				
			elseif self.Type == 3 then
				self.Weapon:SendWeaponAnim(ACT_VM_UNDEPLOY)
			end

			if (SERVER) then
				self.Owner:PrintMessage(HUD_PRINTTALK, self.data.ModeMsg)
			end
		else
			if self.Type == 1 then
				self.Weapon:EmitSound("Weapoi_M16A4.ROF")
				self.Primary.Automatic = !self.data.Automatic
				self.Weapon:SendWeaponAnim(ACT_VM_UNDEPLOY)
			elseif self.Type == 2 then
				// Nothing here for the burst fire mode
				self.Weapon:EmitSound("Weapof_Misc.Switch")
			elseif self.Type == 3 then
				// Nothing here for the burst fire mode
				self.Weapon:SendWeaponAnim(ACT_VM_UNDEPLOY)
			end

			if (SERVER) then
				self.Owner:PrintMessage(HUD_PRINTTALK, self.data.NormalMsg)
			end
		end
	end

	if (self.Weapon) then
		self.Weapon:SetDTBool(3, b)
	end
end

/*---------------------------------------------------------
   Name: SWEP:SetHolsted()
---------------------------------------------------------*/
function SWEP:SetHolsted(b)

	if (self.Owner) then
		if (b) then
			self.Weapon:SendWeaponAnim(ACT_VM_HOLSTER)
		else
			self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		end
	end

	if (self.Weapon) then
		self.Weapon:SetDTBool(0, b)
	end
end

/*---------------------------------------------------------
   Name: SWEP:DeployAnimation()
---------------------------------------------------------*/
function SWEP:DeployAnimation()
	if not self.FirstDraw and self.Weapon:Clip1() > 0 then
		self.FirstDraw = true
	end
	if not self.FirstDraw and (self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) and FirstDraw:GetBool() then
		self:Reload()
		self.Weapon:SendWeaponAnim(ACT_FIRE_END)
		self.FirstDraw = true
	else	
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	end
end

