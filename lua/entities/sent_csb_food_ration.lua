
AddCSLuaFile()

DEFINE_BASECLASS( "base_gmodentity" )

ENT.PrintName		= "Food Ration"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Heals you for 5hp.\n Hold your USE KEY to keep on noming.\n Enjoy your water flavored food ration!"
ENT.Desc			= "(Water flavored?)"
ENT.Category		= "CS[Base]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

sound.Add( {
	name = "CSB_FR_Eat.Ply",
	channel = CHAN_ITEM,
	volume = VOL_NORM,
	level = 60,
	pitch = { 80, 110 },
	sound = { "csb/combine/csb_fr_eat_ply1.wav", "csb/combine/csb_fr_eat_ply2.wav", "csb/combine/csb_fr_eat_ply3.wav" }
} )

sound.Add( {
	name = "CSB_FR_Eat.Fr",
	channel = CHAN_BODY,
	volume = 0.8,
	level = 50,
	pitch = { 80, 110 },
	sound = { "csb/combine/csb_fr_eat1.wav" ,"csb/combine/csb_fr_eat2.wav" ,"csb/combine/csb_fr_eat3.wav" ,"csb/combine/csb_fr_eat4.wav"}
} )

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

ENT.CSB_FR_Food = 50
ENT.CSB_FR_FoodMax = 50
ENT.CSB_FR_Bite = 5
ENT.CSB_FR_LastSucc = 0
ENT.CSB_FR_SuccDelay = 1

if (SERVER) then

	function ENT:Initialize()

		self:SetModel("models/weapons/w_package.mdl")
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:DrawShadow( true )
		self:SetTrigger( true )
		self:SetAngles(self:GetAngles()+Angle(0,0,0))
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		--self:SetColor( Color(255, 255, 0, 255) )	
		--self:SetUseType(SIMPLE_USE)
	
		local self_phys = self:GetPhysicsObject()
	
		if ( IsValid( self_phys ) ) then
		
			self_phys:SetMaterial("cardboard")
			
			self_phys:Wake()
			
		end
	
		self:ManipulateBoneScale(0,Vector(1,1,1))
		self:SetNW2Float("CSB_FR_Food", math.Remap( self.CSB_FR_Food, 0, self.CSB_FR_FoodMax, 0, 100 ))
		self:SetNW2Float("CSB_FR_TextHeight", 0.3)
		
	end

	function ENT:Use(ply)

		if (ply:IsPlayer()) and self.CSB_FR_Food > 0 and ply:Health() < ply:GetMaxHealth() and (CurTime() - self.CSB_FR_LastSucc >= self.CSB_FR_SuccDelay) then 
		
			local bite = math.min( ply:GetMaxHealth() - ply:Health(), self.CSB_FR_Bite )-- Dont overheal
		
			ply:SetHealth(math.Approach( ply:Health(), ply:GetMaxHealth(), bite ))
		
			self.CSB_FR_Food = self.CSB_FR_Food - bite
		
			self:SetNW2Float("CSB_FR_Food", math.Remap( self.CSB_FR_Food, 0, self.CSB_FR_FoodMax, 0, 100 ))
		
			local boneSRemap = math.Remap( self:GetNW2Float("CSB_FR_Food"), 0, 100, 0, 1 )
			local boneS = math.Approach( boneSRemap, 0.2, 0.01 )

			self:ManipulateBoneScale( 0, Vector( 1, 1, boneS ) )
		
			local textHeightRemap = math.Remap( self:GetManipulateBoneScale( 0 ).z, 0, 1, -4, 0.3 )

			self:SetNW2Float("CSB_FR_TextHeight", textHeightRemap)
		
			self:EmitServerSound("CSB_FR_Eat.Fr")
			ply:EmitServerSound("CSB_FR_Eat.Ply")
		
			local offsetVec = Vector(6,-5,self:GetNW2Float("CSB_FR_TextHeight") + 0.5)
			local offsetAng = Angle(0,0,0)
	
			local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), self:GetAngles())
		
			local shutdown = EffectData()
			shutdown:SetStart( newPos )
			shutdown:SetOrigin( newPos )
			shutdown:SetAngles( newAng )
			shutdown:SetColor(1)
			shutdown:SetMagnitude(1)
			shutdown:SetEntity( self )
			util.Effect( "BloodImpact", shutdown, true, true )
		
			self.CSB_FR_LastSucc = CurTime()		
			if self.CSB_FR_Food <= 0 then SafeRemoveEntityDelayed(self, 5) end

		end
	
	end

	function ENT:PreEntityCopy()

		self.SaveTab = {
			['saved'] = nil,
			['sizez'] = self:GetManipulateBoneScale( 0 ).z,
			['foodnw'] = self:GetNW2Float("CSB_FR_Food"),
			['texthnw'] = self:GetNW2Float("CSB_FR_TextHeight"),
		}
	
	end

	function ENT:OnDuplicated( dupeTable )
	
		if dupeTable.SaveTab then
	
			self.SaveTab = dupeTable.SaveTab
		
			self:ManipulateBoneScale(0,Vector(1,1,self.SaveTab.sizez))
			self:SetNW2Float("CSB_FR_Food", self.SaveTab.foodnw)
			self:SetNW2Float("CSB_FR_TextHeight", self.SaveTab.texthnw)
		
		end
	
	end

	function ENT:PostEntityPaste()

		self.SaveTab.saved = true
	
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

	function ENT:Draw()

		self:DrawModel()
	
		local offsetVec = Vector(-1.5,-6.8,self:GetNW2Float("CSB_FR_TextHeight"))
		local offsetAng = Angle(0,90,0)
	
		local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), self:GetAngles())

	
			cam.Start3D2D(newPos, newAng, 0.1)
		
				surface.SetFont( "CSB_FRfont" )
				surface.SetTextColor( 205, 115, 155 )
				surface.SetTextPos( 0, 0 ) 
				surface.DrawText( self:GetNW2Float("CSB_FR_Food") .. "%" )
		
			cam.End3D2D()
	
	end

	surface.CreateFont( "CSB_FRfont", {
		font = "Default",    
		size = 20,
		weight = 100,
		blursize = 0,
		scanlines = 0,
		antialias = false,
		underline = false,
		italic = false,
		--bold = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = true,
	})

end