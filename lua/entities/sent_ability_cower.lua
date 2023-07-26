
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "CSB Cower"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Quite sweet with the vanilla aftertaste."
ENT.Category		= "Combine Suits [Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBSupply.Cower.Deploy",
	channel = CHAN_ITEM,
	volume = 0.8,
	level = 70,
	pitch = 150,
	sound = { "ambient/machines/thumper_startup1.wav" }
} )

sound.Add( {
	name = "CSBSupply.Cower.Down",
	channel = CHAN_ITEM,
	volume = 0.8,
	level = 70,
	pitch = 150,
	sound = { "ambient/machines/thumper_shutdown1.wav" }
} )

if (SERVER) then

	function ENT:Initialize()

		self:SetModel("models/props_combine/combine_barricade_med02c.mdl")

		self:SetModelScale(0.3, 0)

		--self:SetMaterial("models/alyx/emptool_glow")

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )

		self:SetHealth(200)
		self:SetMaxHealth(200)
		self:DrawShadow( true )
		self:SetNW2Bool("CSB_SpawnedEQ", true)
		self:SetRenderFX(kRenderFxHologram)
		self:AddEFlags( EFL_DONTBLOCKLOS )
		self:SetAngles(self:GetAngles()+Angle(0,0,0))
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )

		self:EmitSound("CSBSupply.Cower.Deploy")

		local self_phys = self:GetPhysicsObject()

		if ( IsValid( self_phys ) ) then
	
			self_phys:EnableMotion(false)
		
		end
		
	end

	function ENT:Destroy()
		self:EmitSound("CSBSupply.Cower.Down")
		self:SetModelScale(0.05, 1)
		SafeRemoveEntityDelayed(self,1)
	end

	function ENT:OnTakeDamage( dmginfo )
	
		local attacker = dmginfo:GetAttacker()
		local dmgt = dmginfo:GetDamageType()
		local dmg = dmginfo:GetDamage()

		self:SetHealth(self:Health() - dmg)
		if self:Health() <= 0 then
			self:Destroy()
		end
		
	end

	function ENT:PreEntityCopy()
		self:Remove()
	end

	function ENT:OnRemove()
		if IsValid(self.Owner) and IsValid(self.Owner:GetNW2Entity("CSB_UserSuit")) then
		self.Owner:GetNW2Entity("CSB_UserSuit"):CSBSecondaryRecharge()
		end
	end

end