
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "BodyGroup Holo"
ENT.Author			= "FiLzO"
ENT.Purpose			= "sus"
ENT.Category		= "Combine Suits [Base]"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
	self:SetModel("models/editor/playerstart.mdl")
	self:SetModelScale(0.3, 0)
	self:SetRenderFX(kRenderFxDistort)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	--self:SetCollisionBounds( Vector(-13,-13,0), Vector(13,13,72) )
	self:PhysicsInitBox( Vector(-13,-13,0), Vector(13,13,72) )
	self:DrawShadow( false )
	self:SetUseType(SIMPLE_USE)
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	timer.Simple(0.1, function()
	
		if !IsValid(self) then return end
		
		if self:GetModel() == "models/editor/playerstart.mdl" then SafeRemoveEntity(self) end
		
	end)
	
end

util.AddNetworkString("csb_bg_ch_bg_set")
util.AddNetworkString("csb_bg_ch_bg_model_change")
util.AddNetworkString("CSB_SAM_Interface")

function ENT:Use(ply)

	if self:GetParent().SaveTab.saved or !ply:IsPlayer() or !ply:IsCSBUser() then
	
		self:EmitSound("CSBBodyChanger.Deny")
	
	elseif ply:IsPlayer() and ply:IsCSBUser() then
		
		local suit = ply:GetCSBSuit()
		
		net.Receive("csb_bg_ch_bg_model_change", function(_, ply)	
		
		local newmodel = net.ReadString()		
		
		self:SetModel(newmodel)
		
		local applyself = EffectData()
		applyself:SetStart( self:GetPos() )
		applyself:SetOrigin( self:GetPos() )
		applyself:SetMagnitude(1)
		applyself:SetEntity( self )
		util.Effect( "propspawn", applyself, true, true )
		
		end)
		
		self.BGTab = {}
		
		for i = 1,self:GetNumBodyGroups() do
			
		if !table.HasValue(self.BGTab, i) then table.insert(self.BGTab, i) end
		
		end
		
		for i = 1,#self.BGTab do
			
			self.BGTab[i] = self:GetBodygroup(i)
		
		end

		self.VTab = {
		['model'] = self:GetModel(),
		['vmodel'] = self.HandsModel,
		['material'] = self:GetSubMaterial(0),
		['overlaytab'] = self.SuitOverlay,
		['equipmenttab'] = self.Equipment,
		['color'] = self:GetColor(),
		['skin'] = self:GetSkin(),
		['headtab'] = self.PlyForceHeadRotation,
		['seq'] = self:GetSequence(),
		['cycle'] = self:GetCycle(),
		['bodygtab'] = self.BGTab,
		['allylist'] = self.Allies,
		['vjclass'] = self.VJClass,
		['statstab'] = self.StatsTab
		}

		net.Start("CSB_SAM_Interface")
		net.WriteTable(self.VTab)
		net.Send(ply)
		
		net.Receive("csb_bg_ch_bg_set", function(_, ply)
		
		self.VTab = net.ReadTable()
		
		self:SetModel(self.VTab.model)
		self:SetSubMaterial(0, self.VTab.material)
		self:SetColor(self.VTab.color)
		self:SetSkin(self.VTab.skin)
		self.PlyForceHeadRotation = self.VTab.headtab
		self.HandsModel = self.VTab.vmodel
		self.Allies = self.VTab.allylist
		self.VJClass = self.VTab.vjclass
		self.StatsTab = self.VTab.statstab
		self.SuitOverlay = self.VTab.overlaytab
		self.Equipment = self.VTab.equipmenttab
	
		for i = 1,#self.VTab.bodygtab do
			
			self:SetBodygroup(i,self.VTab.bodygtab[i])

		end

		if table.HasValue(self:GetSequenceList(), self:GetSequenceName(self.VTab.seq)) then
			self:SetSequence(self.VTab.seq)
			self:SetPlaybackRate(1)
			self:SetCycle(self.VTab.cycle)
		
		end
		
		self:EmitSound("CSBBodyChanger.Apply")
		
		local applyself = EffectData()
		applyself:SetStart( self:GetPos() )
		applyself:SetOrigin( self:GetPos() )
		applyself:SetMagnitude(1)
		applyself:SetEntity( self )
		util.Effect( "propspawn", applyself, true, true )
			
		end)
		
	end
	
end

end

function ENT:CanTool(ply,tr,toolname,tool,button)
	if toolname != "duplicator" then return true end
end

if CLIENT then

function ENT:Draw()
	
	local parent = self:GetParent()
	--local bananalevitate = math.sin( CurTime() * 3 ) * ( 1 * 0.2 )
	local bananarotate = ( CurTime() * ( 100 * 0.2 ) ) % 360
	
	local offsetVec = Vector(0,0,0)
	local offsetAng = Angle(0,bananarotate,0)
	
	local newPos, newAng = LocalToWorld(offsetVec, offsetAng, parent:GetPos(), parent:GetAngles())
	
	self:SetAngles( newAng )
	
	self:DrawModel()
	
end

end