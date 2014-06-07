local Walkspeed = CreateConVar ("sim_walk_speed", "250", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local Runspeed = CreateConVar ("sim_run_speed", "500", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local WeightMod	= CreateClientConVar("sim_weightmod_t", 1, true, false)		// Enable/Disable

SWEP.ViewModelFlip	= false
SWEP.ViewModel		= Model("models/weapons/i_rif_m16m202.mdl")
SWEP.WorldModel		= Model("models/weapons/j_rif_m16m202.mdl")
SWEP.ViewModelFOV      = 65
SWEP.Instructions			= "Uses RPG ammo, Switch Weapons: E + Left Click"
SWEP.Base 				= "weapon_insa_sim_base"
SWEP.HoldType				= "shotgun"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound			= Sound( "Weapoi_M16A4.M203" )
SWEP.Primary.Recoil		= 0
SWEP.Primary.Damage		= 0
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.075
SWEP.Primary.ClipSize		= 1					// Size of a clip
SWEP.Primary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Primary.Automatic		= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "fourtymmgrenade"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "none"				// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay			= 0

SWEP.Pistol				= false
SWEP.Rifle				= true
SWEP.Shotgun			= false
SWEP.Sniper				= false
SWEP.IronSightsPos = Vector (-3.4092, -2.4499, -1.1276)
SWEP.IronSightsAng = Vector (3.4814, -0.0072, 0)
SWEP.RunArmOffset  = Vector (4.0928, 0.4246, 2.3712)
SWEP.RunArmAngle   = Vector (-18.4406, 33.1846, 0)

SWEP.Speed = 0.6 
SWEP.Mass = 0.8

/*---------------------------------------------------------
   Name: SWEP:Precache()
   Desc: Use this function to precache stuff.
---------------------------------------------------------*/
function SWEP:Precache()
	util.PrecacheSound("weapons_ins/m16A4/m203-1.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-open.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-close.wav")
	util.PrecacheSound("weapons_ins/m16A4/m203-load.wav")
end	
/*---------------------------------------------------------
   Name: SWEP:ReloadAnimation()
---------------------------------------------------------*/
function SWEP:ReloadAnimation()

	// Reload with the suppressor animation if you're suppressor is on the FUCKING gun
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		local Animation = self.Owner:GetViewModel()
		Animation:SetSequence(Animation:LookupSequence("m203_reload"))

	if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
		self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
	end
end
/*---------------------------------------------------------
   Name: SWEP:Grenade()
---------------------------------------------------------*/
SWEP.Force = 10000

function SWEP:Grenade()

	if (CLIENT) then return end

	local grenade = ents.Create("weapon_ins_sim_ent_m203_round")
		grenade:SetOwner(self.Owner)
		
		if not (self.Weapon:GetNetworkedBool("Ironsights")) then
			local pos = self.Owner:GetShootPos()
				pos = pos + self.Owner:GetForward() * 5
				pos = pos + self.Owner:GetRight() * 9
				pos = pos + self.Owner:GetUp() * -7
			grenade:SetPos(pos)	
		else
			grenade:SetPos(self.Owner:EyePos() + (self.Owner:GetAimVector()))
		end
		
		grenade:SetAngles(self.Owner:GetAngles())
		grenade:Spawn()
		grenade:Activate()

	local phys = grenade:GetPhysicsObject()
	phys:ApplyForceCenter(self.Owner:GetAimVector() * self.Force + Vector(0, 0, 100))
end

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: +attack1 has been pressed.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	// Holst/Deploy your fucking weapon
	if (not self.Owner:IsNPC() and not self.Owner:KeyDown(IN_SPEED) and not self.Weapon:GetDTBool(3) and not self.Owner:KeyDown(IN_RELOAD) and self.Owner:KeyDown(IN_USE)) then
		if (SERVER) then
			bHolsted = !self.Weapon:GetDTBool(0)
			self:SetHolsted(bHolsted)
		end

		self.Weapon:SetNextPrimaryFire(CurTime() + 1.0)
		self.Weapon:SetNextSecondaryFire(CurTime() + 1.0)

		self:SetIronsights(false)

		return
	end

	if (not self:CanPrimaryAttack()) then return end

	self.ActionDelay = (CurTime() + self.Primary.Delay)
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	local Animation = self.Owner:GetViewModel()
	Animation:SetSequence(Animation:LookupSequence("m203_fire"))
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
					
	self.Weapon:EmitSound(self.Primary.Sound)

	self:TakePrimaryAmmo(1)

	self:Grenade()

	self.Owner:ViewPunch(Angle(math.Rand(-5, -15), math.Rand(0, 0), math.Rand(0, 0)))	

	if ((game.SinglePlayer() and SERVER) or CLIENT) then
		self.Weapon:SetNetworkedFloat("LastShootTime", CurTime())
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(self.Owner:GetShootPos())
		effectdata:SetEntity(self.Weapon)
		effectdata:SetStart(self.Owner:GetShootPos())
		effectdata:SetNormal(self.Owner:GetAimVector())
		effectdata:SetAttachment(1)
	util.Effect("effect_mad_shotgunsmoke", effectdata)

	local WeaponModel = self.Weapon:GetOwner():GetActiveWeapon():GetClass()
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
				local Animation = self.Owner:GetViewModel()
				Animation:SetSequence(Animation:LookupSequence("m203_idle"))
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
   Name: SWEP:Think()
   Desc: Called every frame.
---------------------------------------------------------*/
function SWEP:Think()

	self:SecondThink()

	if self.Weapon:Clip1() > 0 and self.IdleDelay < CurTime() and self.IdleApply then
		local WeaponModel = self.Weapon:GetOwner():GetActiveWeapon():GetClass()

		if self.Owner and self.Weapon:GetOwner():GetActiveWeapon():GetClass() == WeaponModel and self.Owner:Alive() then
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		local Animation = self.Owner:GetViewModel()
		Animation:SetSequence(Animation:LookupSequence("m203_idle"))

		if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
			self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
		end


			

			if self.AllowPlaybackRate and not self.Weapon:GetDTBool(1) then
				self.Owner:GetViewModel():SetPlaybackRate(1)
			else
				self.Owner:GetViewModel():SetPlaybackRate(0)
			end		
		end

		self.IdleApply = false
	elseif self.Weapon:Clip1() == 0 then
		self.IdleApply = false
	end

	if self.Weapon:GetDTBool(1) and self.Owner:KeyDown(IN_SPEED) then
		self:SetIronsights(false)
	end

	// If you're running or if your weapon is holsted, the third person animation is going to change
	if self.Owner:KeyDown(IN_SPEED) or self.Weapon:GetDTBool(0) then
		
		if self.Rifle or self.Sniper or self.Shotgun then
			if self.Owner:KeyDown(IN_DUCK) then
				self:SetWeaponHoldType("normal")
			else
				self:SetWeaponHoldType("passive")
			end

		elseif self.Pistol then
			self:SetWeaponHoldType("normal")
		end
	else
		self:SetWeaponHoldType(self.HoldType)
	end

	self:NextThink(CurTime())
end

/*---------------------------------------------------------
   Name: SWEP:DeployAnimation()
---------------------------------------------------------*/
function SWEP:DeployAnimation()

	// Weapon has a suppressor
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		local Animation = self.Owner:GetViewModel()
		Animation:SetSequence(Animation:LookupSequence("m203_drawfull"))

		if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
			self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
		end
	end

/*---------------------------------------------------------
   Name: SWEP:SetHolsted()
---------------------------------------------------------*/
function SWEP:SetHolsted(b)

	if (self.Owner) then
		if (b) then
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
			local Animation = self.Owner:GetViewModel()
			Animation:SetSequence(Animation:LookupSequence("m203_holsterfull"))	
		else
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
			local Animation = self.Owner:GetViewModel()
			Animation:SetSequence(Animation:LookupSequence("m203_drawfull"))
		end
	end

	if (self.Weapon) then
		self.Weapon:SetDTBool(0, b)
	end
end
/*---------------------------------------------------------
   Name: SWEP:CanPrimaryAttack()
   Desc: Helper function for checking for no ammo.
---------------------------------------------------------*/
function SWEP:CanPrimaryAttack()
	
	// Clip is empty or you're under water
	if ( self.Weapon:Clip1() <= 0 ) and self.Primary.ClipSize > -1 then
		if self.Weapon:GetDTBool(0) then return end
		self.Reloadaftershoot = CurTime() + self.Primary.Delay
		self.ActionDelay = (CurTime() + self.Primary.Delay + 0.05)
		self.Weapon:SetNextPrimaryFire(CurTime() + 1)
		self.Weapon:EmitSound("Universai.Pistol")
		return false
	end

	// You're sprinting or your weapon is holsted
	if not self.Owner:IsNPC() and (self.Owner:KeyDown(IN_SPEED) or self.Weapon:GetDTBool(0) or self.Owner:WaterLevel() > 2) then
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
		return false
	end

	return true
end


