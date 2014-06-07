// Variables that are used on both client and server
local FirstDraw = CreateClientConVar("sim_draw_t", 1, true, false)		// Enable/Disable
SWEP.Base 				= "weapon_insa_sim_base_acog"
SWEP.HoldType				= "smg"
SWEP.ViewModelFlip		= false
SWEP.ViewModel			= Model("models/weapons/i_rif_au.mdl")
SWEP.WorldModel			= Model("models/weapons/j_rif_au.mdl")
SWEP.ViewModelFOV      = 65
SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound 		= Sound("Weapoi_AUG.Single")
SWEP.Primary.Recoil		= 1.2
SWEP.Primary.Damage		= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.004
SWEP.Primary.Delay 		= 0.092307692307692307692307692307692

SWEP.Primary.ClipSize		= 30					// Size of a clip
SWEP.Primary.DefaultClip	= 0				// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "fivefivesix"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "sim_shelleject_fas_556"	// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"

SWEP.ShellDelay			= 0.02
SWEP.Pistol				= false
SWEP.Rifle				= false
SWEP.Shotgun			= false
SWEP.Sniper				= true

SWEP.IronSightsPos = Vector (-2.0228, -4.5016, 0.9868)
SWEP.IronSightsAng = Vector (-0.0989, 0.0043, 0)
SWEP.RunArmOffset  = Vector (4.0928, 0.4246, 2.3712)
SWEP.RunArmAngle   = Vector (-18.4406, 33.1846, 0)

SWEP.ScopeZooms			= {6}
SWEP.Type				= 3 					// 1 = Automatic/Semi-Automatic mode, 2 = Suppressor mode, 3 = Burst fire mode
SWEP.Mode				= false
SWEP.RedDot				= false

SWEP.Speed = 0.5
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
   Name: SWEP:Reload()
   Desc: Reload is being pressed.
---------------------------------------------------------*/
function SWEP:Reload()

	if (self.Owner:KeyDown(IN_USE)) then
		
		if self.Weapon:GetDTBool(0) or self.Owner:KeyDown(IN_SPEED) then return end
		self.Weapon:SetNextPrimaryFire(CurTime() + 3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 3)

		if (SERVER) then
			
			local knife = ents.Create("weapon_ins_sim_ent_aug")
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
			
			self.Owner:StripWeapon("weapon_ins_sim_aug")
			if (SERVER) then
				RunConsoleCommand("lastinv")
			end

		end
	else

		if (self.ActionDelay > CurTime()) or self.Owner:KeyDown(IN_SPEED) then return end 
		if self.Weapon:GetDTBool(0) or (self:GetNWBool("LittleJammed") or self:GetNWBool("BigJammed")) or (self:Clip1() == (self.Primary.ClipSize + 1)) then return end
		self.Weapon:SetNextPrimaryFire(CurTime() + 1.0)
		self.Weapon:SetNextSecondaryFire(CurTime() + self.DeployDelay + 1.0)
		self.ActionDelay = (CurTime())

		// Need to call the default reload before the real reload animation (don't try to understand my reason)
		self.Weapon:DefaultReload(ACT_VM_RELOAD)

		if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
			self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
		end

		if (self.Weapon:Clip1() < self.Primary.ClipSize) and (self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
			self:SetIronsights(false)
			self:ReloadAnimation()

			self:ResetVariables()

			if not (CLIENT) then
				self.Owner:DrawViewModel(true)
			end
		end
	end
end
/*---------------------------------------------------------
   Name: SWEP:SetHolsted()
---------------------------------------------------------*/
function SWEP:SetHolsted(b)

	if (self.Owner) then
		if (b) then
			self.Weapon:SendWeaponAnim(ACT_VM_HOLSTER)
			self.Weapon:EmitSound("Universai.Holster")
		else
			self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
			self.Weapon:EmitSound("Universai.Draw")
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
		self.Weapon:EmitSound("Universai.Draw")
		self.Weapon:SendWeaponAnim(ACT_FIRE_END)
		self.FirstDraw = true
	else	
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self.Weapon:EmitSound("Universai.Draw")
	end
end
/*---------------------------------------------------------
   Name: SWEP:ReloadAnimation()
---------------------------------------------------------*/
function SWEP:ReloadAnimation()


	if (self.Weapon:Clip1() == 0) then
		self.Weapon:DefaultReload(ACT_VM_MISSCENTER2)
	else
		self.Weapon:DefaultReload(ACT_VM_RELOAD)
		timer.Simple(self.Owner:GetViewModel():SequenceDuration() + 0.03, function()
			if (not IsValid(self.Owner) or not IsValid(self.Weapon) or not self.Owner:Alive())then return end
			self:SetClip1( self.Primary.ClipSize + 1 )
			self.Owner:RemoveAmmo( 1, self:GetPrimaryAmmoType() )
		end)
	end

	if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
		self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
	end
end

