
AddCSLuaFile()

DEFINE_BASECLASS( "base_gmodentity" )

ENT.PrintName		= "Equipment Crate"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Can be used to replenish your default suit \nequipment or to get extra gear."
ENT.Desc			= "(Grab your [REDACTED] issued equipment)"
ENT.Category		= "CS[Base]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBSupply.Box.Phys.Soft",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 70,
	pitch = { 80, 90 },
	sound = { "physics/wood/wood_box_impact_soft1.wav", "physics/wood/wood_box_impact_soft2.wav", "physics/wood/wood_box_impact_soft3.wav" }
} )

sound.Add( {
	name = "CSBSupply.Box.Phys.Hard",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 70,
	pitch = { 80, 90 },
	sound = { "physics/wood/wood_box_impact_hard1.wav", "physics/wood/wood_box_impact_hard2.wav", "physics/wood/wood_box_impact_hard3.wav", "physics/wood/wood_box_impact_hard4.wav", "physics/wood/wood_box_impact_hard5.wav", "physics/wood/wood_box_impact_hard6.wav" }
} )

if (SERVER) then

	function ENT:Initialize()

		self:SetModel("models/Items/item_item_crate.mdl")
		--self:SetMaterial("models/alyx/emptool_glow")
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:DrawShadow( true )
		self:SetTrigger( true )
		self:SetAngles(self:GetAngles()+Angle(0,-90,0))
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		--self:SetColor( Color(255, 255, 0, 255) )	
		self:SetUseType(SIMPLE_USE)
	
		local self_phys = self:GetPhysicsObject()
	
			if ( IsValid( self_phys ) ) then
		
				self_phys:SetMaterial("Wood_Crate")
			
				self_phys:Wake()
			
			end
		
	end

	function ENT:Use(ply)

		if (ply:IsPlayer() and IsValid(ply:GetCSBSuit())) then 
		
			local suit = ply:GetCSBSuit()
			local wepTab = suit.Equipment.weapons
			local ammoTab = suit.Equipment.ammo 
		
			for i = 1,#wepTab do
		
				local wepTabT = wepTab[i]
				ply:Give(wepTabT[1], wepTabT[2])
			
			end
	
			for i = 1,#ammoTab do
		
				local ammoTabT = ammoTab[i]
				ply:GiveAmmo(ammoTabT[2], ammoTabT[1])
			
			end

			SafeRemoveEntity(self)
		
		end
	
	end

	function ENT:PhysicsCollide(data, physobj)
		local SurTab = util.GetSurfaceData(util.GetSurfaceIndex(physobj:GetMaterial())) 
		if (data.Speed > 80 and data.Speed <= 250 and data.DeltaTime > 0.1) and SurTab.impactSoftSound then
			self:EmitSound(SurTab.impactSoftSound)	
		elseif (data.Speed > 250 and data.DeltaTime > 0.1) and SurTab.impactHardSound then	
			self:EmitSound(SurTab.impactHardSound)		
		end	
	end

	function ENT:OnRemove()
	-----------------------
	end

end

if (CLIENT) then

	function ENT:GetOverlayText()
	
		if GetConVar("csb_tips"):GetBool() then
	
			self.Purpose = self.Purpose or ""
			self.Desc = self.Desc or ""
	
			return self.Purpose .. "\n" .. self.Desc
		
		else
		
			return ""
		
		end
		
	end
	
end