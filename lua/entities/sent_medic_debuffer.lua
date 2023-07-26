
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "CSB Debuffer"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Lazlow was here."
ENT.Category		= "CS[Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBMedic.Debuffer.Explode",
	channel = CHAN_ITEM,
	volume = 1,
	level = 75,
	pitch = 80,
	sound = { "weapons/mortar/mortar_explode2.wav" }
} )

sound.Add( {
	name = "CSBMedic.Debuffer.Loop",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 60,
	pitch = 80,
	sound = { "ambient/energy/force_field_loop1.wav" }
} )

ENT.Debuffed = {}

if (SERVER) then

	util.AddNetworkString("csb_medic_debuff_tab")
	
	function ENT:Initialize()

		self:SetModel("models/props_c17/utilityconnecter006c.mdl")
		--self:SetModelScale(0.4, 0)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_VPHYSICS )
		self:DrawShadow( true )
		self:SetNoDraw( false )
		self:AddEFlags( EFL_DONTBLOCKLOS )
		self:SetMaxHealth(50)
		self:SetHealth(self:GetMaxHealth())
		self:EmitSound("CSBMedic.Debuffer.Loop")
		
		self.tar = ents.Create("npc_bullseye")
		self.tar:SetPos(self:GetPos() + Vector(0,0,10))
		self.tar:SetAngles(self:GetAngles())
		self.tar:SetKeyValue("spawnflags", "65536" + "131072")
		self.tar:SetKeyValue('lightcolor', "255 200 0")
		self.tar:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
		self.tar:SetOwner(self)
		self.tar:SetParent(self)
		self.tar:Spawn()
		self.tar:Activate()
		self:DeleteOnRemove(self.tar)

		local self_phys = self:GetPhysicsObject()

		if ( IsValid( self_phys ) ) then
			--self_phys:EnableMotion(false)
		end
		
		timer.Create("CSBMedDebuffer" .. self:EntIndex(), 60, 0, function()
		
			if !IsValid(self) then return end
			
			self:Destroy()
			
		end)
	
	end

	function ENT:Destroy()
	
		local ue1 = EffectData()
		ue1:SetOrigin( self:GetPos() + Vector(0,0,-10) )
		ue1:SetNormal( Vector(0,0,90) )
		ue1:SetRadius( 100 )
		ue1:SetEntity( self )
		util.Effect( "AR2Explosion", ue1, true, true )
		
		self:EmitSound("CSBMedic.Debuffer.Explode")

		self:Remove()

	end
	
	function ENT:OnTakeDamage( dmginfo )
	
		local attacker = dmginfo:GetAttacker()
		local dmgt = dmginfo:GetDamageType()
		local dmg = dmginfo:GetDamage()
		
		if IsValid(self.Owner) and IsValid(attacker) and ((attacker:IsNPC() and self.Owner:IsNPCFriend(attacker) or IsNPCIgnored(attacker)) or (attacker:IsPlayer() and self.Owner:IsPlayerFriend(attacker))) then return end

		self:SetHealth(self:Health() - dmg)
		
		if self:Health() <= 0 then
			self:Destroy()
		end
		
	end
	
	function ENT:PreEntityCopy()
		self:Remove()
	end
	
	function ENT:OnRemove()
		
		if IsValid(self) then
		
			for k, v in ipairs( self.Debuffed ) do
		
				if IsValid(v) and v.CSBMedicDebuff == true then
			
					v.CSBMedicDebuff = false
					--v:SetColor(Color(255,255,255))
			
				end
			
			end
			
			self:StopSound("CSBMedic.Debuffer.Loop")
		
		end
		
		if IsValid(self.Owner) and IsValid(self.Owner:GetNW2Entity("CSB_UserSuit")) then
	
			self.Owner:GetNW2Entity("CSB_UserSuit"):CSBPrimaryRecharge()
		
		end
	
	end

end

	function ENT:Think()
	
		for k, v in pairs( ents.GetAll() ) do
		
			if IsValid(self.Owner) and IsValid(v) and ((v:IsNPC() and !self.Owner:IsNPCFriend(v) and !IsNPCIgnored(v)) or (v:IsPlayer() and !self.Owner:IsPlayerFriend(v))) then
				
				if IsValid(self.tar) and self.tar:CSBWithinDistance(v, 400) and v:Disposition(self.tar) != D_HT then
				
					v:AddEntityRelationship(self.tar,D_HT,0)
					
				end
				
				if self:CSBWithinDistance(v, 400) and !table.HasValue(self.Debuffed, v) then
			
					v.CSBMedicDebuff = true
					--v:SetColor(Color(255,0,0))
					
					table.insert(self.Debuffed, v)
					
				elseif !self:CSBWithinDistance(v, 400) and v.CSBMedicDebuff == true and table.HasValue(self.Debuffed, v) then
				
					v.CSBMedicDebuff = false
					--v:SetColor(Color(255,255,255))
					
					table.RemoveByValue(self.Debuffed, v)
					
				end
			
			end
			
		end
	
	end

if (CLIENT) then

	function ENT:Draw()
	
		self:DrawModel()
		
		local ply = LocalPlayer()
		local bananalevitate = math.sin( CurTime() * 3 ) * ( 1 * 5 )
		local bananarotate = ( CurTime() * ( 100 * 0.2 ) ) % 360
		
		local dir = (self:GetPos() - ply:GetPos()):Angle()
	
		local offsetVec = Vector( 0, 0, 40 + bananalevitate )
		local offsetAng = Angle(0,-90+dir.y,90)
	
		local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), Angle(0,0,0))
	
		cam.Start3D2D(newPos, newAng, 1)
		
			surface.SetDrawColor( 255, 200, 100, 255 ) -- Set the drawing color
			surface.SetMaterial( Material( "effects/med_debuff_ico.png" ) ) -- Use our cached material
			surface.DrawTexturedRect( -10, -10, 20, 20 ) -- Actually draw the rectangle
		
		cam.End3D2D()
		
		
		cam.Start3D2D(self:GetPos(), self:GetAngles(), 1)
		
			surface.DrawCircle( 0, 0, 400, Color( 255, 200, 100, 255 ) )
		
		cam.End3D2D()
	
	
	end

end