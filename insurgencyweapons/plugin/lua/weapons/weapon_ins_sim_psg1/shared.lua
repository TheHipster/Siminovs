local RecoilMul = CreateConVar ("mad_recoilmul", "1", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local DamageMul = CreateConVar ("mad_damagemul", "1", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local FirstDraw = CreateClientConVar("sim_draw_t", 1, true, false)		// Enable/Disable

// Variables that are used on both client and server
SWEP.Base 				= "weapon_insa_sim_base_snip"
SWEP.HoldType				= "smg"
SWEP.ViewModelFlip		= false
SWEP.ViewModel			= Model("models/weapons/i_snip_psg.mdl")
SWEP.WorldModel			= Model("models/weapons/j_snip_psg.mdl")

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound 		= Sound("Weapoi_PSG.Single")
SWEP.Primary.Recoil		= 3
SWEP.Primary.Damage		= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.0008
SWEP.Primary.Delay 		= 0.15

SWEP.Primary.ClipSize		= 20					// Size of a clip
SWEP.Primary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Primary.Automatic		= false			// Automatic/Semi Auto
SWEP.Primary.Ammo			= "sevensixtwobyfiftyone"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "sim_shelleject_fas_762x51"	// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay			= 0.02

SWEP.IronSightsPos = Vector (-2.2068, -1.1982, 1.1065)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.RunArmOffset  = Vector (4.0928, 0.4246, 2.3712)
SWEP.RunArmAngle   = Vector (-18.4406, 33.1846, 0)

SWEP.Pistol				= false
SWEP.Rifle				= false
SWEP.Shotgun			= false
SWEP.Sniper				= true

SWEP.ScopeZooms			= {8}
SWEP.ScopeScale 			= 0.4
SWEP.Type				= 1 					// 1 = Automatic/Semi-Automatic mode, 2 = Suppressor mode, 3 = Burst fire mode
SWEP.Mode				= false

SWEP.Speed = 0.6
SWEP.Mass = 0.75

/*--------------------------------------------------------
   Name: SWEP:Precache()
   Desc: Use this function to precache stuff.
---------------------------------------------------------*/
function SWEP:Precache()

    	util.PrecacheSound("weapons/sniper_sr25/sr25_fire1.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_fire2.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_fire3.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_fire4.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_fire5.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_magout.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_magin.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_magslap.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_charge.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_boltcatch.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_boltcatchslap.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_boltcatchhandle.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_stockpull.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_stocklock.wav")
	util.PrecacheSound("weapons/sniper_sr25/sr25_safety.wav")
	util.PrecacheSound("weapons/accessories/harrisbipod_up1.wav")
	util.PrecacheSound("weapons/accessories/harrisbipod_up2.wav")
	util.PrecacheSound("weapons/accessories/harrisbipod_down1.wav")
	util.PrecacheSound("weapons/accessories/harrisbipod_down2.wav")
end
/*---------------------------------------------------------
   Name: SWEP:DeployAnimation()
---------------------------------------------------------*/
function SWEP:DeployAnimation()
	self.Weapon:SetDTBool(3, false)
	self.Weapon:SetNWInt("NextChangeMode", CurTime())
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
   Name: SWEP:Reload()
   Desc: Reload is being pressed.
---------------------------------------------------------*/
function SWEP:Reload()

	if (self.Owner:KeyDown(IN_USE)) then
		
		if self.Weapon:GetDTBool(0) or self.Owner:KeyDown(IN_SPEED) then return end
		self.Weapon:SetNextPrimaryFire(CurTime() + 3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 3)

		if (SERVER) then
			
			local knife = ents.Create("weapon_ins_sim_ent_psg1")
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
			
			self.Owner:StripWeapon("weapon_ins_sim_psg1")
			if (SERVER) then
				RunConsoleCommand("lastinv")
			end

		end
	else

		// When the weapon is already doing an animation, just return end because we don't want to interrupt it
		if (self.ActionDelay > CurTime()) or self.Owner:KeyDown(IN_SPEED) or self.Weapon:GetDTBool(0) then return end
		
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