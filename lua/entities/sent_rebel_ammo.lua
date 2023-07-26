
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "CSB Ammo"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Lazlow was here."
ENT.Category		= "CS[Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBRebel.Ammo.Use",
	channel = CHAN_ITEM,
	volume = 1,
	level = 100,
	pitch = 90,
	sound = { "csb/abilities/ammopickup1.wav", "csb/abilities/ammopickup2.wav" }
} )

sound.Add( {
	name = "CSBRebel.Ammo.Deploy",
	channel = CHAN_ITEM,
	volume = 1,
	level = 70,
	pitch = 80,
	sound = { "physics/metal/metal_box_impact_soft1.wav", "physics/metal/metal_box_impact_soft2.wav", "physics/metal/metal_box_impact_soft3.wav" }
} )

ENT.Uses = 5

if (SERVER) then

	function ENT:Initialize()

		self:SetModel("models/Items/BoxMRounds.mdl")
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_VPHYSICS )
		self:DrawShadow( true )
		self:SetNoDraw( false )
		self:AddEFlags( EFL_DONTBLOCKLOS )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		self:EmitSound("CSBRebel.Ammo.Use")
		self:SetUseType( SIMPLE_USE )
		
		local a1pos = self:GetPos() + self:GetForward() * 0 + self:GetUp() * 13 + self:GetRight() * -3
		self.a1 = ents.Create("prop_physics")
		self.a1:SetModel("models/Items/BoxSRounds.mdl")
		self.a1:SetModelScale( self.a1:GetModelScale() * 0.8, 0 )
		self.a1:PhysicsInit( SOLID_NONE )
		self.a1:SetMoveType( MOVETYPE_NONE )
		self.a1:SetSolid( SOLID_NONE )
		self.a1:SetPos( a1pos )
		self.a1:SetAngles( self:GetAngles() + Angle( 0, -35, 0 ) )
		self.a1:SetParent( self )
		self.a1:SetOwner( self )
		self.a1:Spawn()
		self.a1:Activate()
		self.a1:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
		self:DeleteOnRemove( self.a1 )
		
		local a2pos = self:GetPos() + self:GetForward() * 2 + self:GetUp() * 13 + self:GetRight() * 6
		self.a2 = ents.Create("prop_physics")
		self.a2:SetModel("models/Items/BoxBuckshot.mdl")
		self.a2:SetModelScale( self.a2:GetModelScale() * 0.8, 0 )
		self.a2:PhysicsInit( SOLID_NONE )
		self.a2:SetMoveType( MOVETYPE_NONE )
		self.a2:SetSolid( SOLID_NONE )
		self.a2:SetPos( a2pos )
		self.a2:SetAngles( self:GetAngles() + Angle( 0, 0, 0 ) )
		self.a2:SetParent( self )
		self.a2:SetOwner( self )
		self.a2:Spawn()
		self.a2:Activate()
		self.a2:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
		self:DeleteOnRemove( self.a2 )

		local self_phys = self:GetPhysicsObject()

		if ( IsValid( self_phys ) ) then
			--self_phys:EnableMotion(false)
		end
	
	end

	function ENT:Use(ply)

		if ply:IsPlayer() and ply:IsCSBUser() and IsValid(ply:GetActiveWeapon()) and self.Uses > 0 then 
		
			for i = 1, #ply:GetWeapons() do
			
				local wep = ply:GetWeapons()[i]
			
				if (wep:Clip1() != nil or wep:Clip1() != -1) and (wep:GetPrimaryAmmoType() != nil or wep:GetPrimaryAmmoType() != -1) then
				
					ply:GiveAmmo( wep:GetMaxClip1(), wep:GetPrimaryAmmoType() )
				
				end
			
			end
			
			local ue1 = EffectData()
			ue1:SetOrigin( self:GetPos() )
			ue1:SetStart( self:GetPos() )
			ue1:SetAngles( self:GetAngles() + Angle(-90,0,0) )
			ue1:SetEntity( self )
			util.Effect( "ShotgunShellEject", ue1, true, true )
		
			local ue2 = EffectData()
			ue2:SetOrigin( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue2:SetStart( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue2:SetAngles( self:GetAngles() + Angle(-90,0,0) )
			ue2:SetEntity( self )
			util.Effect( "RifleShellEject", ue2, true, true )
		
			local ue3 = EffectData()
			ue3:SetOrigin( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue3:SetStart( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue3:SetAngles( self:GetAngles() + Angle(-90,0,0) )
			ue3:SetEntity( self )
			util.Effect( "ShellEject", ue3, true, true )
		
			local ue4 = EffectData()
			ue4:SetOrigin( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue4:SetStart( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue4:SetAngles( self:GetAngles() + Angle(-90,0,0) )
			ue4:SetEntity( self )
			util.Effect( "RifleShellEject", ue4, true, true )
		
			local ue5 = EffectData()
			ue5:SetOrigin( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue5:SetStart( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue5:SetAngles( self:GetAngles() + Angle(-90,0,0) )
			ue5:SetEntity( self )
			util.Effect( "ShotgunShellEject", ue5, true, true )
		
			local ue6 = EffectData()
			ue6:SetOrigin( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue6:SetStart( self:GetPos() + Vector( 0, 0 ,13 ) )
			ue6:SetAngles( self:GetAngles() + Angle(-90,0,0) )
			ue6:SetEntity( self )
			util.Effect( "ShellEject", ue6, true, true )
		
			self.Uses = self.Uses - 1
			
			if self.Uses <= 0 then
			
				SafeRemoveEntity(self)
			
			end
		
		end
	
	end

	function ENT:Destroy()

		self:Remove()

	end
	
	function ENT:PreEntityCopy()
		self:Remove()
	end
	
	function ENT:OnRemove()

		if IsValid(self.Owner) and IsValid(self.Owner:GetNW2Entity("CSB_UserSuit")) then
	
			self.Owner:GetNW2Entity("CSB_UserSuit"):CSBPrimaryRecharge()
		
		end
	
	end

end

if (CLIENT) then
	local icon = Material( "effects/ammo_rebel_icon.png" )
	function ENT:Draw()
		
		self:DrawModel()
		
		local offsetVec = Vector( 6.5, 0, 6 )
		local offsetAng = Angle( 0, 90, 90 )
		
		local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), self:GetAngles())
	
		cam.Start3D2D(newPos, newAng, 1)

			surface.SetDrawColor( 255, 200, 100, 255 ) -- Set the drawing color
			surface.SetMaterial( icon ) -- Use our cached material
			surface.DrawTexturedRect( -5, -5, 10, 10 ) -- Actually draw the rectangle
		
		cam.End3D2D()
		
		local offsetVec2 = Vector( -6.5, 0, 6 )
		local offsetAng2 = Angle( 180, 90, -90 )
	
		local newPos2, newAng2 = LocalToWorld(offsetVec2, offsetAng2, self:GetPos(), self:GetAngles())
		
		cam.Start3D2D(newPos2, newAng2, 1)

			surface.SetDrawColor( 255, 200, 100, 255 ) -- Set the drawing color
			surface.SetMaterial( icon ) -- Use our cached material
			surface.DrawTexturedRect( -5, -5, 10, 10 ) -- Actually draw the rectangle
		
		cam.End3D2D()
	
	end

end