AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "CSB HP Bomb"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Bazinga."
ENT.Category		= "Combine Suits [Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBMedic.HPBomb.Deploy",
	channel = CHAN_ITEM,
	volume = 0.8,
	level = 70,
	pitch = 150,
	sound = { "npc/attack_helicopter/aheli_mine_drop1.wav" }
} )

sound.Add( {
	name = "CSBMedic.HPBomb.Tick",
	channel = CHAN_ITEM,
	volume = 1,
	level = 75,
	pitch = 70,
	sound = { "items/medshotno1.wav" }
} )

sound.Add( {
	name = "CSBMedic.HPBomb.Explode",
	channel = CHAN_ITEM,
	volume = 1,
	level = 75,
	pitch = 70,
	sound = { "items/smallmedkit1.wav" }
} )

ENT.PrepTimes = 4
ENT.Prep = 0

if (SERVER) then
	
	local function HPEffect(ent)
	
		local tick = EffectData()
		tick:SetEntity( ent )
		util.Effect( "csb_heal_eff", tick )					
	
	end
	
	function ENT:Initialize()
		self:SetModel("models/Items/HealthKit.mdl")
		self:SetModelScale(0.4, 0)
		--self:SetSolid( SOLID_VPHYSICS )
		
		self:SetMoveType( MOVETYPE_FLYGRAVITY )
		self:SetMoveCollide( MOVECOLLIDE_FLY_BOUNCE )
		
		self:DrawShadow( true )
		self:SetNoDraw( false )
		self:AddEFlags( EFL_DONTBLOCKLOS )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		self:EmitSound("CSBMedic.HPBomb.Deploy")

		local self_phys = self:GetPhysicsObject()
		
		if ( IsValid( self_phys ) ) then
		
			self_phys:EnableMotion(true)
			
		end
		
		timer.Create("CSBMedBomb" .. self:EntIndex(), 1, self.PrepTimes, function()
		
			if !IsValid(self) then return end
			
			self.Prep = self.Prep +1
			
			if self.Prep < self.PrepTimes then
			
				HPEffect(self)
				self:EmitSound("CSBMedic.HPBomb.Tick")
			
			elseif self.Prep >= self.PrepTimes then
			
				self:Explode()
			
			end
		
		end)
		
	end
	
	function ENT:Explode()
	
		for k, v in pairs( ents.FindInSphere(self:GetPos(), 180) ) do
		
			if IsValid(self.Owner) and IsValid(v) and v:Health() != nil and ((v:IsNPC() and self.Owner:IsNPCFriend(v) and !IsNPCIgnored(v) and v:Health() > 0) or (v:IsPlayer() and self.Owner:IsPlayerFriend(v) and v:Alive())) then
		
				local need = math.min( v:GetMaxHealth() - v:Health(), v:GetMaxHealth()*0.5 )-- Dont overheal
				v:SetHealth( math.min( v:GetMaxHealth(), v:Health() + need ) )
				
				v:Extinguish()
				
				HPEffect(v)
		
			end
			
		end
		
		self:Destroy()
		
	end

	function ENT:Destroy()
	
		local eff = EffectData()
		eff:SetOrigin( self:GetPos() + Vector(0,0,5) )
		eff:SetEntity( self )
		util.Effect( "VortDispel", eff )
		
		self:EmitSound("CSBMedic.HPBomb.Explode")

		self:Remove()
	
	end
	
	function ENT:PreEntityCopy()
		self:Remove()
	end
	
	function ENT:OnRemove()
	
	--	if IsValid(self.Owner) and IsValid(self.Owner:GetNW2Entity("CSB_UserSuit")) then
		
			--self.Owner:GetNW2Entity("CSB_UserSuit"):CSBSecondaryRecharge()
			
		--end
		
	end

end