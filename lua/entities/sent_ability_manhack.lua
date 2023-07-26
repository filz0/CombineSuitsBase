
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "CSB Manhack"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Quite sweet with the vanilla aftertaste."
ENT.Category		= "Combine Suits [Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBSupply.Manhack.Deploy",
	channel = CHAN_ITEM,
	volume = 0.8,
	level = 70,
	pitch = 150,
	sound = { "ambient/machines/thumper_startup1.wav" }
} )

sound.Add( {
	name = "CSBSupply.Manhack.Down",
	channel = CHAN_ITEM,
	volume = 0.8,
	level = 70,
	pitch = 150,
	sound = { "ambient/machines/thumper_shutdown1.wav" }
} )

if (SERVER) then

	function ENT:Initialize()
		self:SetModel("models/weapons/flare.mdl")
		self:PhysicsInit( SOLID_NONE )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
		self:DrawShadow( false )
		self:SetNoDraw( true )
		self:AddEFlags( EFL_DONTBLOCKLOS )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		self:EmitSound("CSBSupply.Manhack.Deploy")

		self.ent = ents.Create( "npc_manhack" )
		local offsetVec = Vector(0, 0, 0)
		local offsetAng = Angle(0, 0, 0)
		local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), self:GetAngles())
		self.ent:SetPos(newPos)
		self.ent:SetAngles(newAng)
		self.ent:SetKeyValue( "spawnflags", "256" + "65536")
		self.ent:Fire("Unpack")
		self.ent:Spawn()
		self.ent:Activate()
		self.ent:SetNW2Bool("CSB_SpawnedNPC", true)
		self.ent.CSBDamageMult = 5
		self.ent:SetOwner(self.Owner) -- just in case
		self.ent:DeleteOnRemove(self)
		self:DeleteOnRemove(self.ent)

		local equiped = EffectData()
		equiped:SetStart( self:GetPos() )
		equiped:SetOrigin( self:GetPos() )
		equiped:SetMagnitude(0)
		equiped:SetEntity( self )
		util.Effect( "propspawn", equiped )

		local self_phys = self:GetPhysicsObject()
		if ( IsValid( self_phys ) ) then
			--self_phys:EnableMotion(false)
		end
	
	end

	function ENT:Destroy()
		if IsValid(self.ent) then
			self.ent:EmitSound("CSBSupply.Manhack.Down")
			self.ent:Fire("Break")
		end
	end

	function ENT:PreEntityCopy()
		self:Remove()
	end

	function ENT:OnRemove()
		if IsValid(self.Owner) and IsValid(self.Owner:GetCSBSuit()) then
			self.Owner:GetCSBSuit():CSBSecondaryRecharge()
		end
	end

end