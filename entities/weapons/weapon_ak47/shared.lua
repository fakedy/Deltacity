-- Read the weapon_real_base if you really want to know what each action does
AddCSLuaFile()
if (SERVER) then
	AddCSLuaFile("shared.lua")
end

if (CLIENT) then
	SWEP.PrintName 		= "Ak47"
	SWEP.ViewModelFOV		= 70
	SWEP.Slot 			= 3
	SWEP.SlotPos 		= 1
	SWEP.DrawAmmo = true
	SWEP.DrawCrosshair = true
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 54
	
end

SWEP.Author = "Fakedy"
SWEP.Base = "weapon_base"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.HoldType = "ar2"
SWEP.UseHands = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Ar2"


SWEP.Primary.Delay = 0.1
SWEP.Primary.Recoil = 1.5
SWEP.Primary.Damage = 20
SWEP.Primary.Cone = 0.018
SWEP.Primary.Spread = 0.04

local ShootSound = Sound("Weapon_ak47.Single")

function SWEP:Initialize()

self:SetHoldType(self.HoldType)


end


function SWEP:PrimaryAttack()

	if( not self:CanPrimaryAttack() ) then
		return
	end
		
	local ply = self:GetOwner()
	
	ply:LagCompensation( true )
	
	local Bullet = {}
		Bullet.Num = self.Primary.NumShots
		Bullet.Src = ply:GetShootPos()
		Bullet.Dir = ply:GetAimVector()
		Bullet.Spread = Vector( self.Primary.Spread * math.random(-1,1), self.Primary.Spread * -1 , 0)
		Bullet.Tracer = 0
		Bullet.Damage = self.Primary.Damage
		Bullet.AmmoType = self.Primary.Ammo
	
	local rnda = self.Primary.Recoil * -1.5
	local rndb = self.Primary.Recoil * math.random(-0.1,0.1)
	
	self:FireBullets( Bullet )
	self:ShootEffects()
	
	self:EmitSound ( ShootSound )
	self.BaseClass.ShootEffects( self )
	self.Owner:ViewPunch(Angle( rnda,rndb,rndb))
	self:TakePrimaryAmmo ( 1 )
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	ply:LagCompensation ( false )
	
end

function SWEP:CanSecondaryAttack()

return false

end








