// Variables that are used on both client and server

SWEP.Base 				= "weapon_insa_sim_base"

SWEP.ViewModelFlip		= false
SWEP.ViewModel			= Model("models/weapons/i_pist_takarov.mdl")
SWEP.WorldModel			= Model("models/weapons/j_pist_takarov.mdl")
SWEP.ViewModelFOV			= 65

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound 		= Sound("Weapoi_tokarev.Single")
SWEP.Primary.Recoil		= 2.6
SWEP.Primary.Damage		= 18
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.Delay 		= 0.17
SWEP.Primary.ClipSize		= 8					// Size of a clip
SWEP.Primary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Primary.Automatic		= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "sevensixtwopistol"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "sim_shelleject_fas_9x18mm"	// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"

SWEP.Pistol				= true
SWEP.Rifle				= false
SWEP.Shotgun			= false
SWEP.Sniper				= false

SWEP.Type				= 1 					// 1 = Automatic/Semi-Automatic mode, 2 = Suppressor mode, 3 = Burst fire mode
SWEP.Mode				= false

SWEP.data 				= {}
SWEP.data.NormalMsg		= "Switched to automatic."
SWEP.data.ModeMsg			= "Switched to semi-automatic."

SWEP.IronSightsPos = Vector (-2.321, -2.0005, 1.8112)
SWEP.IronSightsAng = Vector (0.3058, 0.0108, 0)

SWEP.Speed = 0.6 
SWEP.Mass = 0.9

/*---------------------------------------------------------
   Name: SWEP:Precache()
   Desc: Use this function to precache stuff.
---------------------------------------------------------*/
function SWEP:Precache()

    	util.PrecacheSound("weapons/pistol_ots33/ots33_fire1.wav")
	util.PrecacheSound("weapons/pistol_ots33/ots33_fire2.wav")
	util.PrecacheSound("weapons/pistol_ots33/ots33_fire3.wav")
	util.PrecacheSound("weapons/pistol_ots33/ots33_fire4.wav")
	util.PrecacheSound("weapons/pistol_ots33/ots33_fire5.wav")
	util.PrecacheSound("weapons/pistol_ots33/ots33_magin.wav")
	util.PrecacheSound("weapons/pistol_ots33/ots33_magout.wav")	
	util.PrecacheSound("weapons/pistol_ots33/ots33_slidestop.wav")
end

/*---------------------------------------------------------
   Name: SWEP:ShootAnimation()
---------------------------------------------------------*/
function SWEP:ShootAnimation()

	if (self.Weapon:Clip1() <= 0) then
		self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
	else
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	end
end

function SWEP:Reload()

	if (self.Owner:KeyDown(IN_USE)) then
		
		if self.Weapon:GetDTBool(0) or self.Owner:KeyDown(IN_SPEED) then return end
		self.Weapon:SetNextPrimaryFire(CurTime() + 3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 3)

		if (SERVER) then
			
			local knife = ents.Create("weapon_ins_sim_ent_tt33")
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
			
			self.Owner:StripWeapon("weapon_ins_sim_tt33")
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
   Name: SWEP:ReloadAnimation()
---------------------------------------------------------*/
function SWEP:ReloadAnimation()


	if (self.Weapon:Clip1() == 0) then
		self.Weapon:DefaultReload(ACT_VM_RELOAD_EMPTY)
	else
		self.Weapon:DefaultReload(ACT_VM_RELOAD)
		timer.Simple(self.Owner:GetViewModel():SequenceDuration() + 0.01, function()
			if (not IsValid(self.Owner) or not IsValid(self.Weapon) or not self.Owner:Alive())then return end
			self:SetClip1( self.Primary.ClipSize + 1 )
			self.Owner:RemoveAmmo( 1, self:GetPrimaryAmmoType() )
		end)
	end

	if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
		self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
	end
end
