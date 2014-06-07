// Variables that are used on both client and server
local Walkspeed = CreateConVar ("sim_walk_speed", "250", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local Runspeed = CreateConVar ("sim_run_speed", "500", {FCVAR_REPLICATED, FCVAR_ARCHIVE})
local WeightMod	= CreateClientConVar("sim_weightmod_t", 1, true, false)		// Enable/Disable
local FirstDraw = CreateClientConVar("sim_draw_t", 1, true, false)		// Enable/Disable
local Jamming	= CreateClientConVar("sim_jam_t", 1, true, false)		// Enable/Disable

SWEP.Instructions			= "Uses 12 Gauge Buckshot, Switch Weapons: E + Left Click"
SWEP.Base 				= "weapon_insa_sim_base_shot"

SWEP.HoldType				= "shotgun"
SWEP.ViewModelFlip		= false
SWEP.ViewModel			= Model("models/weapons/i_shot_spas4.mdl")
SWEP.WorldModel			= Model("models/weapons/j_shot_spas4.mdl")

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound 		= Sound("Weapoi_spas.Single")
SWEP.Primary.Recoil		= 6
SWEP.Primary.Damage		= 5.0
SWEP.Primary.NumShots		= 20
SWEP.Primary.Cone			= 0.065
SWEP.Primary.Delay 		= 0.5

SWEP.Primary.ClipSize		= 9				// Size of a clip
SWEP.Primary.DefaultClip	= 0					// Default number of bullets in a clip
SWEP.Primary.Automatic		= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "shotgunshell"
SWEP.ShellEffect			= "sim_shelleject_fas_12gabuck"	// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.IronSightsPos = Vector (-2.0774, -2.0007, 1.4141)
SWEP.IronSightsAng = Vector (-0.058, 0.0359, 0)

SWEP.RunArmOffset  = Vector (4.0928, 0.4246, 2.3712)
SWEP.RunArmAngle   = Vector (-18.4406, 33.1846, 0)

SWEP.Type				= 0 					// 1 = Automatic/Semi-Automatic mode, 2 = Suppressor mode, 3 = Burst fire mode
SWEP.Mode				= false

SWEP.ShotgunReloading		= true
SWEP.ShotgunFinish		= 1.5
SWEP.ShotgunBeginReload		= 1.5

SWEP.Speed = 0.6 
SWEP.Mass = 0.85 

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: +attack1 has been pressed.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	// Holst/Deploy your fucking weapon
	if (self.Owner:KeyDown(IN_SPEED) or self:GetNWBool("LittleJammed") or self:GetNWBool("BigJammed")) then return end 
	if (not self.Owner:KeyDown(IN_RELOAD) and self.Owner:KeyDown(IN_USE)) then
		bHolsted = !self.Weapon:GetDTBool(0)
		self:SetHolsted(bHolsted)

		self.Weapon:SetNextPrimaryFire(CurTime() + 1.0)
		self.Weapon:SetNextSecondaryFire(CurTime() + 1.0)

		self:SetIronsights(false)

		return
	end

	if (not self:CanPrimaryAttack()or self:GetNWBool("LittleJammed") or self:GetNWBool("BigJammed")) then return end
	
	self.Reloadaftershoot = CurTime() + self.Primary.Delay
	self.ActionDelay = (CurTime() + self.Primary.Delay + 0.05)
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:EmitSound(self.Primary.Sound)
	self:TakePrimaryAmmo(1)

	if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
		self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration() + 0.5)
	end
	
	self:ShootBulletInformation()
	
	local jamchance = math.random(1,1000) // 1000
	
	if Jamming:GetBool() then
		if self.Weapon:GetDTBool(0) or self.Weapon:Clip1()  <= 1 then return end
		if jamchance > 995 then
			self:SetNWBool("LittleJammed",true)
			self:Jammed()
		end
		if jamchance < 5 then
			self:SetNWBool("BigJammed",true)
			self:Jammed()
		end
	end
	if ((game.SinglePlayer() and SERVER) or CLIENT) then
		self.Weapon:SetNetworkedFloat("LastShootTime", CurTime())
	end
end

/*---------------------------------------------------------
   Name: SWEP:ResetVariables()
   Desc: Reset all varibles.
---------------------------------------------------------*/
function SWEP:ResetVariables()

	self.bLastIron = false
	self.Weapon:SetDTBool(1, false)
	self.CurScopeZoom 		= 1
	self.fLastScopeZoom 		= 1
	self.bLastScope 			= false
	self.Weapon:SetDTBool(2, false)
	self.Owner:SetRunSpeed(self.Runspeed*self.Mass)
	self.Owner:SetWalkSpeed(self.Walkspeed*self.Mass)
	self.Weapon:SetNetworkedFloat("ScopeZoom", self.ScopeZooms[1])
	
	
	if (SERVER) then
		self.Owner:SetFOV(0, 0.2)
	end
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
			
			local knife = ents.Create("weapon_ins_sim_ent_spas12")
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
			
			self.Owner:StripWeapon("weapon_ins_sim_spas12")
			if (SERVER) then
				RunConsoleCommand("lastinv")
			end

		end
	else

		if (self.ActionDelay > CurTime()) or self.Owner:KeyDown(IN_SPEED) then return end 
		if self.Weapon:GetDTBool(0) or (self:GetNWBool("BigJammed") or self:GetNWBool("LittleJammed")) or (self:Clip1() == (self.Primary.ClipSize + 1)) then return end
	
		if (self.Weapon:GetNWBool("Reloading") or self.ShotgunReloading) then return end

		if (self.Weapon:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
			if not IsValid(self.Weapon) then return end
			self.ShotgunReloading = true
			self.Owner:DoReloadEvent()
			self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunBeginReload + 0.1)
			self.Weapon:SetNextSecondaryFire(CurTime() + self.ShotgunBeginReload + 0.1)
			self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)

			timer.Simple(self.ShotgunBeginReload, function()
				if not IsValid(self.Weapon) then return end
				self.ShotgunReloading = false
				self.Weapon:SetNetworkedBool("Reloading", true)
				self.Weapon:SetVar("ReloadTime", CurTime() + 1)
				self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
				self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
			end)
		
			if (SERVER) then
				self.Owner:SetFOV( 0, 0.15 )
				self:SetIronsights(false)
			end
		end
	end
end

/*---------------------------------------------------------
   Name: SWEP:Think()
   Desc: Called every frame.
---------------------------------------------------------*/
function SWEP:Think()

	if self.Weapon:Clip1() > self.Primary.ClipSize then
		self.Weapon:SetClip1(self.Primary.ClipSize)
	end

	if (self.Weapon:Clip1() == 0) then
	if self.Weapon:GetNetworkedBool("Reloading") == true then
		if self.Weapon:GetNetworkedInt("ReloadTime") < CurTime() then
			if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
				self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNextSecondaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNetworkedBool("Reloading", false)
				self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER2)
				if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
				end
			else
				self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + 1.7)
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
				local Animation = self.Owner:GetViewModel()
				Animation:SetSequence(Animation:LookupSequence("m1014_reload_insert_pull"))
				self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
				self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
				self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
				self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)

				if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
					self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
				else
					self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
				end
			end
		end
	end
	else
	if self.Weapon:GetNetworkedBool("Reloading") == true then
		if self.Weapon:GetNetworkedInt("ReloadTime") < CurTime() then
			if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
				self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNextSecondaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNetworkedBool("Reloading", false)
				self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER2)
				if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
				end
			else
				self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + 1.0)
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
				self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
				self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
				self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
				self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)

				if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
					self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
				else
					self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
				end
			end
		end
	end
	end

	if (self.Owner:KeyPressed(IN_ATTACK)) and self.Weapon:Clip1() < 9 and (self.Weapon:GetNWBool("Reloading", true)) then
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
		self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + self.ShotgunFinish)
		self.Weapon:SetNetworkedBool("Reloading", false)

		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
			if not IsValid(self.Owner) then return end
			self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER2)

			if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
			end
		end)
	end

	self:SecondThink()

	if self.IdleDelay < CurTime() and self.IdleApply and self.Weapon:Clip1() > 0 then
		local WeaponModel = self.Weapon:GetOwner():GetActiveWeapon():GetClass()

		if self.Weapon:GetOwner():GetActiveWeapon():GetClass() == WeaponModel and self.Owner:Alive() then

			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	

			if self.AllowPlaybackRate and not self.Weapon:GetDTBool(1) then
				self.Owner:GetViewModel():SetPlaybackRate(1)
			else
				self.Owner:GetViewModel():SetPlaybackRate(0)
			end	
		end

		self.IdleApply = false
	elseif self.Weapon:Clip1() <= 0 then
		self.IdleApply = false
	end

	if self.Weapon:GetDTBool(1) and self.Owner:KeyDown(IN_SPEED) then
		self:SetIronsights(false)
	end
	
	// If you're running or if your weapon is holsted, the third person animation is going to change
	if self.Owner:KeyDown(IN_SPEED) or self.Weapon:GetDTBool(0) then
		if self.Rifle or self.Sniper or self.Shotgun then
			self:SetWeaponHoldType("passive")
		
		elseif self.Pistol then
			self:SetWeaponHoldType("normal")
		end
		
	else
		self:SetWeaponHoldType(self.HoldType)
	end

	self:NextThink(CurTime())
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
