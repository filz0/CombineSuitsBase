AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "CSB Molotov"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Funky Cola."
ENT.Category		= "CS[Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBRebel.Molo.Break",
	channel = CHAN_AUTO,
	volume = 1,
	level = 75,
	pitch = {90, 105},
	sound = { "csb/abilities/molo_break1.wav", "csb/abilities/molo_break2.wav", "csb/abilities/molo_break3.wav", "csb/abilities/molo_break4.wav" }
} )

sound.Add( {
	name = "CSBRebel.Molo.Explosion",
	channel = CHAN_AUTO,
	volume = 1,
	level = 75,
	pitch = {90, 105},
	sound = { "csb/abilities/molo_fire1.wav", "csb/abilities/molo_fire2.wav" }
} )

if (SERVER) then

	function ENT:Initialize()

		self:SetModel("models/w_molotov.mdl")
	
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )

		local phys = self:GetPhysicsObject()
	
		if (phys:IsValid()) then	
			phys:Wake()		
		end
	
		local zfire = ents.Create( "env_fire_trail" )
		zfire:SetPos( self:GetPos() )
		zfire:SetParent( self )
		zfire:Spawn()
		zfire:Activate()
	
	end

	function ENT:Think() 
	end

	function ENT:Explosion()

		util.BlastDamage( self, self:GetOwner(), self:GetPos(), 200, 50 )
		
		local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
		util.Effect( "HelicopterMegaBomb", effectdata )	 -- Big flame
	
		local shake = ents.Create( "env_shake" )
		shake:SetOwner( self.Owner )
		shake:SetPos( self:GetPos() )
		shake:SetKeyValue( "amplitude", "700" )	-- Power of the shake
		shake:SetKeyValue( "radius", "800" )	-- Radius of the shake
		shake:SetKeyValue( "duration", "1" )	-- Time of shake
		shake:SetKeyValue( "frequency", "100" )	-- How har should the screenshake be
		shake:SetKeyValue( "spawnflags", "4" )	-- Spawnflags( In Air )
		shake:Spawn()
		shake:Activate()
		shake:Fire( "StartShake", "", 0 )
		
		local physExplo = ents.Create( "env_physexplosion" )
		physExplo:SetOwner( self.Owner )
		physExplo:SetPos( self:GetPos() )
		physExplo:SetKeyValue( "Magnitude", "20" )	-- Power of the Physicsexplosion
		physExplo:SetKeyValue( "radius", "300" )	-- Radius of the explosion
		physExplo:SetKeyValue( "spawnflags", "19" )
		physExplo:Spawn()
		physExplo:Fire( "Explode", "", 0.02 )	
	
		for i=1, 12 do
	
			local fire = ents.Create( "env_fire" )
			fire:SetPos( self:GetPos() + Vector( math.random( -100, 100 ), math.random( -100, 100 ), 0 ) )
			fire:SetKeyValue( "health", math.random( 10, 15 ) )
			fire:SetKeyValue( "firesize", "30" )
			fire:SetKeyValue( "fireattack", "8" )
			fire:SetKeyValue( "damagescale", "2.0" )
			fire:SetKeyValue( "StartDisabled", "0" )
			fire:SetKeyValue( "firetype", "0" )
			fire:SetKeyValue( "spawnflags", "132" + "128" )
			fire.molofire = true
			fire:Spawn()
			fire:Fire( "StartFire", "", 0.2 )
			
		end		
			
		for k, v in pairs ( ents.FindInSphere( self:GetPos(), 200 ) ) do
	
			if v:IsValid() and (v:IsWeapon() or v == self.Owner or (v:IsNPC() and self.Owner:IsNPCFriend(v) and !IsNPCIgnored(v)) or (v:IsPlayer() and self.Owner:IsPlayerFriend(v))) then return end
		
			v:Ignite( 5, 0 )
		
		end
	
	end
	
	function ENT:PreEntityCopy()
		self:Remove()
	end
	
	function ENT:PhysicsCollide( data, physobj ) 

		util.Decal("Scorch", data.HitPos + data.HitNormal , data.HitPos - data.HitNormal) 
		self:EmitSound("CSBRebel.Molo.Break")
		self:EmitSound("CSBRebel.Molo.Explosion")
		self:Explosion()
		self:Remove()
	
	end

end