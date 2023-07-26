
AddCSLuaFile()

DEFINE_BASECLASS( "base_gmodentity" )

ENT.PrintName		= "Suit's Appearance Modifier"
ENT.Author			= "FiLzO"
ENT.Purpose			= "This little thing lets you to change" ..
					"\n a lot about your currently equipped suit." ..
					"\n From the current model to stats." ..
					"\n It can also be duped or saved" .. 
					"\n when hologram is active."
ENT.Desc			= ""
ENT.Category		= "CS[Base]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

sound.Add( {
	name = "CSBBodyChanger.Holo.Spawn",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 65,
	pitch = 130,
	sound = "csb/combine/sam_apply.wav"
} )

sound.Add( {
	name = "CSBBodyChanger.Deny",
	channel = CHAN_ITEM,
	volume = 0.7,
	level = 60,
	pitch = { 60 },
	sound = { "buttons/button16.wav" }
} )

sound.Add( {
	name = "CSBBodyChanger.Change",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 60,
	pitch = { 80, 100 },
	sound = { "csb/combine/change.wav" }
} )

sound.Add( {
	name = "CSBBodyChanger.Holo.Start",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 60,
	pitch = 120,
	sound = { "ambient/machines/combine_terminal_idle2.wav" }
} )

sound.Add( {
	name = "CSBBodyChanger.Holo.Loop",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 60,
	pitch = 100,
	sound = { "ambient/machines/combine_terminal_loop1.wav" }
} )

sound.Add( {
	name = "CSBBodyChanger.Holo.End",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 60,
	pitch = 120,
	sound = { "ambient/machines/combine_terminal_idle4.wav" }
} )

sound.Add( {
	name = "CSBBodyChanger.Phys.Soft",
	channel = CHAN_BODY,
	volume = 1.0,
	level = 70,
	pitch = { 80, 90 },
	sound = { "physics/metal/metal_canister_impact_soft1.wav", "physics/metal/metal_canister_impact_soft2.wav", "physics/metal/metal_canister_impact_soft3.wav" }
} )

sound.Add( {
	name = "CSBBodyChanger.Phys.Hard",
	channel = CHAN_BODY,
	volume = 1.0,
	level = 70,
	pitch = { 80, 90 },
	sound = { "physics/metal/metal_canister_impact_hard1.wav", "physics/metal/metal_canister_impact_hard2.wav", "physics/metal/metal_canister_impact_hard3.wav" }
} )

if (SERVER) then

util.AddNetworkString("csb_ent_saved")
util.AddNetworkString("csb_set_overlay")
util.AddNetworkString("csb_relations_table_to_client")
util.AddNetworkString("csb_set_head_rotation")

function ENT:Initialize()

	--self:SetModel("models/props_combine/combine_mine01.mdl")
	self:SetModel("models/maxofs2d/hover_plate.mdl")
	--self:SetMaterial("models/alyx/emptool_glow")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:DrawShadow( true )
	self:SetTrigger( true )
	self:SetAngles(self:GetAngles()+Angle(0,-90,0))
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetColor( Color(137, 107, 40, 255) )	
	self:SetUseType(SIMPLE_USE)
	local self_phys = self:GetPhysicsObject()
	if ( IsValid( self_phys ) ) then
		self_phys:SetMaterial("weapon")
		self_phys:Wake()
	end
	
	self:SetNW2Int("CSB_UseMode", 1)
	self:SetNW2String("CSB_EntSaved", "effects/test_save_empty.png")
	--effects/combinedisplay_core_
	--effects/prisonmap_disp
	
end

function ENT:Use(ply)
	
	if !self.SaveTab then self.SaveTab = {} end
	
	if !ply:IsPlayer() or !ply:IsCSBUser() then

		if self.SaveTab.saved then
		
			if self.SaveTab and self.SaveTab.suitclass and !IsValid(ply:GetWeapon(self.SaveTab.suitclass)) then ply:Give(self.SaveTab.suitclass, true) end
		
		else
		
			self:EmitSound("CSBBodyChanger.Deny")
		
		end
	
	elseif ply:IsPlayer() and ply:IsCSBUser() and self:GetNW2Int("CSB_UseMode") == 1 then
		
		local suit = ply:GetCSBSuit()
		
		self:EmitSound("CSBBodyChanger.Holo.Start")
		self:EmitSound("CSBBodyChanger.Holo.Loop")
		
		self.SuitClass = ply:GetCSBSuit():GetClass()
		
		self.holotop = ents.Create("env_projectedtexture")
		self.holotop:SetPos(self:GetPos())
		self.holotop:SetAngles(self:GetAngles() + Angle(-90,0,0))
		self.holotop:SetKeyValue("spawnflags", "1" + "2")
		self.holotop:SetKeyValue('lightcolor', "137 107 40")
		self.holotop:SetKeyValue('lightfov', "90")
		self.holotop:SetKeyValue('farz', "50")
		self.holotop:SetKeyValue('nearz', "1")
		self.holotop:SetKeyValue('shadowquality', "0")
		self.holotop:SetKeyValue('texturename', "effects/flashlight/soft")
		self.holotop:SetOwner(self)
		self.holotop:SetParent(self)
		self.holotop:Spawn()
		self.holotop:Activate()
		
		self.holobase = ents.Create("beam_spotlight")
		self.holobase:SetPos(self:GetPos() + Vector(0,0,2))
		self.holobase:SetAngles(self:GetAngles() + Angle(-90,0,0))
		self.holobase:SetKeyValue("spawnflags", "1" + "2")
		self.holobase:SetKeyValue("spotlightwidth", "25")
		self.holobase:SetKeyValue("spotlightlength", "20")
		self.holobase:SetKeyValue("HaloScale", "0")
		self.holobase:SetColor(Color(137,107,40,255))
		self.holobase:SetOwner(self)
		self.holobase:SetParent(self)
		self.holobase:Spawn()
		self.holobase:Activate()
		
		self.hologram = ents.Create("sent_bg_changer_holo")
		self.hologram:SetParent(self)
		self.hologram:SetPos(self:GetPos() + Vector(0,0,4))
		self.hologram:SetOwner(self)
		self.hologram:Spawn()
		self.hologram:Activate()
		self.hologram:DeleteOnRemove(self)
		
		self.hologram:EmitSound("CSBBodyChanger.Holo.Spawn")

		if self.SaveTab and self.SaveTab.saved then
		
			self.hologram:SetModel(self.SaveTab.model)
			self.hologram:SetSubMaterial(0, self.SaveTab.material)
			self.hologram:SetColor(self.SaveTab.color)
			self.hologram:SetSkin(self.SaveTab.skin)
			self.hologram.PlyForceHeadRotation = self.SaveTab.headtab
			self.hologram.HandsModel = self.SaveTab.vmodel
			self.hologram.Allies = self.SaveTab.allylist
			self.hologram.VJClass = self.SaveTab.vjclass		
			self.hologram.StatsTab = self.SaveTab.statstab
			self.hologram.SuitOverlay = self.SaveTab.overlaytab
			self.hologram.Equipment = self.SaveTab.equipmenttab
			
			self.hologram:SetSequence(self.SaveTab.seq)
			self.hologram:SetPlaybackRate(1)
			self.hologram:SetCycle(self.SaveTab.cycle)

		
			for i = 1,self.hologram:GetNumBodyGroups() do
				
				self.hologram:SetBodygroup(i,self.SaveTab.bodygval[i])
		
			end
		
		else
		
			self.hologram:SetModel(ply:GetModel())
			self.hologram:SetSubMaterial(0, ply:GetSubMaterial(0))
			self.hologram:SetColor(ply:GetColor())
			self.hologram:SetSkin(ply:GetSkin())
			self.hologram.PlyForceHeadRotation = suit.PlyForceHeadRotation
			self.hologram.HandsModel = ply:GetHands():GetModel()
			self.hologram.Allies = ply.CSB_Allies
			self.hologram.VJClass = ply.VJ_NPC_Class
			self.hologram.SuitOverlay = suit.SuitOverlay
			self.hologram.Equipment = suit.Equipment

			self.hologram.StatsTab = {
			['runspeed'] = ply:GetRunSpeed(),
			['walkspeed'] = ply:GetWalkSpeed(),
			['walkaltspeed'] = ply:GetSlowWalkSpeed(),
			['crouchspeed'] = ply:GetCrouchedWalkSpeed(),
			['jumppower'] = ply:GetJumpPower(),
			['health'] = ply:Health(),
			['healthmax'] = ply:GetMaxHealth(),
			['armor'] = ply:Armor(),
			['armormax'] = ply:GetMaxArmor()	
			}
			
			self.hologram:SetSequence(ply:GetSequence())
			self.hologram:SetPlaybackRate(1)
			self.hologram:SetCycle(ply:GetCycle())

			for i = 1,ply:GetNumBodyGroups() do
		
				self.hologram:SetBodygroup(i,ply:GetBodygroup(i))
		
			end
			
		end
		
		self.hologram:SetRenderFX(kRenderFxDistort)
		
		local spawn = EffectData()
		spawn:SetStart( self.hologram:GetPos() )
		spawn:SetOrigin( self.hologram:GetPos() )
		spawn:SetMagnitude(1)
		spawn:SetEntity( self.hologram )
		util.Effect( "propspawn", spawn, true, true )
		
		local activation = EffectData()
		activation:SetStart( self:GetPos() )
		activation:SetOrigin( self:GetPos() )
		activation:SetMagnitude(1)
		activation:SetEntity( self )
		util.Effect( "cball_bounce", activation, true, true )
		
		self:SetNW2Int("CSB_UseMode", 2)
		
	elseif (ply:IsPlayer() and ply:IsCSBUser()) and self:GetNW2Int("CSB_UseMode") == 2 then
		
		self:EmitSound("CSBBodyChanger.Holo.End")
		
		local suit = ply:GetCSBSuit()
		
		ply:SetModel(self.hologram:GetModel())
		ply:SetSubMaterial(0, self.hologram:GetSubMaterial(0))
		
		ply.CSBCurSMS = ply.CSBCurSMS || {}
		ply.CSBCurSMS[1] = self.hologram:GetSubMaterial(0)
		
		net.Start("csb_player_sms_cl")
		net.WriteTable(ply.CSBCurSMS)
		net.Send(ply)
		
		ply:SetColor(self.hologram:GetColor())
		ply.CSBCurColor = self.hologram:GetColor()
		net.Start("csb_player_col_cl")
		net.WriteColor(ply.CSBCurColor)
		net.Send(ply)
		
		ply:SetSkin(self.hologram:GetSkin())	
		ply:GetHands():SetModel(self.hologram.HandsModel)
		
		ply.CSBCurBGS = ply.CSBCurBGS || {}
		
		for i = 1, self.hologram:GetNumBodyGroups() do
		
			ply:SetBodygroup(i, self.hologram:GetBodygroup(i))
			ply.CSBCurBGS[i] = self.hologram:GetBodygroup(i)
			
		end
		
		net.Start("csb_player_bgs_cl")
		net.WriteTable(ply.CSBCurBGS)
		net.Send(ply)

		ply:SetRunSpeed(self.hologram.StatsTab.runspeed)
		ply:SetWalkSpeed(self.hologram.StatsTab.walkspeed)
		ply:SetSlowWalkSpeed(self.hologram.StatsTab.walkaltspeed)
		ply:SetCrouchedWalkSpeed(self.hologram.StatsTab.crouchspeed)
		ply:SetJumpPower(self.hologram.StatsTab.jumppower)
		ply:SetHealth(self.hologram.StatsTab.health)
		ply:SetMaxHealth(self.hologram.StatsTab.healthmax)
		ply:SetArmor(self.hologram.StatsTab.armor)
		ply:SetMaxArmor(self.hologram.StatsTab.armormax)

		ply.VJ_NPC_Class = self.hologram.VJClass		
		ply.CSB_Allies = self.hologram.Allies

		net.Start("csb_relations_table_to_client")
		net.WriteEntity(ply)
		net.WriteTable(ply.VJ_NPC_Class)
		net.WriteTable(ply.CSB_Allies)
		net.Broadcast()

		suit.PlyForceHeadRotation = self.hologram.PlyForceHeadRotation
		
		net.Start("csb_set_head_rotation")
		net.WriteEntity(suit)
		net.WriteTable(suit.PlyForceHeadRotation)
		net.Send(ply)
		
		suit.SuitOverlay = self.hologram.SuitOverlay
		
		net.Start("csb_set_overlay")
		net.WriteEntity(suit)
		net.WriteTable(suit.SuitOverlay)
		net.Send(ply)
		
		suit:CSBStripEquipment(ply)
		suit.Equipment = self.hologram.Equipment
		suit:CSBGiveEquipment(ply)
		
		ply:EmitSound("CSBBodyChanger.Apply")
		
		suit.SAM_Modified = true
		suit:SAMApply()
		
		local apply = EffectData()
		apply:SetStart( ply:GetPos() )
		apply:SetOrigin( ply:GetPos() )
		apply:SetMagnitude(1)
		apply:SetEntity( ply )
		util.Effect( "propspawn", apply, true, true )
		
		local applyvm = EffectData()
		applyvm:SetStart( ply:GetPos() )
		applyvm:SetOrigin( ply:GetPos() )
		applyvm:SetMagnitude(1)
		applyvm:SetEntity( ply:GetHands() )
		util.Effect( "propspawn", applyvm, true, true )
		
		local shutdown = EffectData()
		shutdown:SetStart( self:GetPos() )
		shutdown:SetOrigin( self:GetPos() )
		shutdown:SetMagnitude(1)
		shutdown:SetEntity( self )
		util.Effect( "cball_explode", shutdown, true, true )
		
		self.hologram:SetModelScale(1, 1)
		
		self:StopSound("CSBBodyChanger.Holo.Loop")
		self.hologram:DontDeleteOnRemove(self)
		SafeRemoveEntity(self.hologram)
		if IsValid(self.holotop) then self.holotop:Fire("KillHierarchy") end
		if IsValid(self.holobase) then self.holobase:Fire("KillHierarchy") end
		
		self:SetNW2Int("CSB_UseMode", 1)
		
	end
	
end

function ENT:PreEntityCopy()
	
	if IsValid(self.hologram) then
		
		local bgval = {}
	
		for i = 1,self.hologram:GetNumBodyGroups() do
	
			table.insert(bgval, self.hologram:GetBodygroup(i))
	
		end

		self.SaveTab = {
			['saved'] = nil,
			['suitclass'] = self.SuitClass,
			['usemode'] = self:GetNW2Int("CSB_UseMode"),
			['model'] = self.hologram:GetModel(),
			['vmodel'] = self.hologram.HandsModel,
			['material'] = self.hologram:GetSubMaterial(0),
			['overlaytab'] = self.hologram.SuitOverlay,
			['equipmenttab'] = self.hologram.Equipment,
			['color'] = self.hologram:GetColor(),
			['skin'] = self.hologram:GetSkin(),
			['headtab'] = self.hologram.PlyForceHeadRotation,
			['seq'] = self.hologram:GetSequence(),
			['cycle'] = self.hologram:GetCycle(),
			['bodygval'] = bgval,
			['allylist'] = self.hologram.Allies,
			['vjclass'] = self.hologram.VJClass,
			['statstab'] = self.hologram.StatsTab
		}
		
	end
	
end

function ENT:OnDuplicated( dupeTable )

	self:SetNW2Int("CSB_UseMode", 1)
	
	if dupeTable.SaveTab then
	
		self.SaveTab = dupeTable.SaveTab
		--self:SetNW2Bool("CSB_EntSaved", true)
		
	end
	
end

function ENT:PostEntityPaste()

	--if self.SaveTab and self.SaveTab.saved then
		self.SaveTab.saved = true
		self:SetNW2String("CSB_EntSaved", "effects/test_save_full.png")
		
	--end
	
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
	
	self:StopSound("CSBBodyChanger.Holo.Loop")
	if IsValid(self.hologram) then SafeRemoveEntity(self.hologram) end
	if IsValid(self.holotop) then self.holotop:Fire("KillHierarchy") end
	if IsValid(self.holobase) then self.holobase:Fire("KillHierarchy") end
		
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
	
		--local bananalevitate = math.sin( CurTime() * 3 ) * ( 1 * 0.2 )
		local bananarotate = ( CurTime() * ( 100 * 0.2 ) ) % 360
	
		local offsetVec = Vector( 0,0,1.5 )--+ bananalevitate )
		local offsetAng = Angle(0,bananarotate,0)
	
		local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), self:GetAngles())

	
		cam.Start3D2D(newPos, newAng, 1)
		
			surface.SetDrawColor( 255, 255, 255, 255 ) -- Set the drawing color
			surface.SetMaterial( Material( self:GetNW2String("CSB_EntSaved") ) ) -- Use our cached material
			surface.DrawTexturedRect( -5, -5, 10, 10 ) -- Actually draw the rectangle
		
		cam.End3D2D()
	
	end

end
