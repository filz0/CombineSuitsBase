CSB_INSTALLED = true

if (SERVER) then
	include("bone_animapi/boneanimlib.lua")
end

if (CLIENT) then	
	include("bone_animapi/cl_boneanimlib.lua")
end

local PLAYER = FindMetaTable("Player")
local ENT = FindMetaTable("Entity")

function CSBDevMessage(msg)

	if !GetConVar("csb_dev_mode"):GetBool() then return end
	
	print("CSB DevMode" .. " CurTime: " .. CurTime() .. " FrameTime: " .. FrameTime())
	print(" ")
	
	if istable(msg) then
		
		PrintTable(msg)
	
	else
		
		print(msg)
	
	end
	
	print("------------------------------------------------------------------------")
	
end

function PLAYER:RotatingHead()

	if (self:GetPoseParameter("head_yaw") + self:GetPoseParameter("head_pitch") + self:GetPoseParameter("head_roll")) > 0 then
	
		return true
		
	else
	
		return false
		
	end

end

function PLAYER:FullyLoaded() -- if player finished loading into the game/server

	if self:GetNW2Bool("CSB_PlayerFullyLoaded") == true then
	
		return true
		
	else
	
		return false
		
	end

end

function ENT:IsCSBUser()

	if self:IsPlayer() and self:FullyLoaded() and IsValid(self:GetNW2Entity("CSB_UserSuit")) then
	
		return true
		
	else
	
		return false
		
	end
	
end

function PLAYER:GetCSBSuit()

	if IsValid(self:GetNW2Entity("CSB_UserSuit")) then
	
		return self:GetNW2Entity("CSB_UserSuit")
		
	else
	
		return nil
		
	end
	
end

function ENT:IsCSB()

	if self:IsScripted() and self.Base == "csb_base_a" then
	
		return true
		
	else
	
		return false
		
	end
	
end

function PLAYER:IsNoClipping()

	if (self:GetMoveType()==MOVETYPE_NOCLIP) then
		
		return true
		
	else
	
		return false
		
	end
	
end

function PLAYER:IsOnLadder()

	if (self:GetMoveType()==MOVETYPE_LADDER) then
		
		return true
		
	else
	
		return false
		
	end
	
end 

function GetLuaAnimationDuration(luaanim)

	if !IsLuaAnimation(luaanim) then return 0 end

	local findanim = GetLuaAnimations()['' .. luaanim .. '']
	local anim = findanim.FrameData
	local animDur = 0
	
	for i = 1, #anim do
	animDur = animDur + (1/anim[i].FrameRate)
	end
	
	return animDur
	
end

function IsLuaAnimation(anim)
	
	if !anim then return false end
	
	local findanim = GetLuaAnimations()['' .. anim .. '']
	
	if findanim then
	
		return true
		
	else
	
		return false
		
	end
	
end

function PLAYER:GetAnimDuration(anim)
	
	if !anim then return 0 end
	
	if IsLuaAnimation(anim) then
	
		return GetLuaAnimationDuration(anim)
		
	else
	
		return self:SequenceDuration(self:LookupSequence(anim))
		
	end
	
end

CSBIgnoredNPCs = {
['npc_bullseye'] = true,
['npc_antlion_template_maker'] = true,
['npc_blob'] = true,
['npc_cranedriver'] = true,
['npc_enemyfinder'] = true,
['npc_grenade_frag'] = true,
['npc_grenade_magna '] = true,
['npc_heli_avoidbox'] = true,
['npc_heli_avoidsphere'] = true,
['npc_heli_nobomb'] = true,
['npc_maker'] = true,
['npc_spotlight'] = true,
['npc_vehicledriver'] = true,
['npc_hunter_maker'] = true,
['npc_enemyfinder'] = true
}

function IsNPCIgnored(npc)

	if CSBIgnoredNPCs[npc:GetClass()] then
	
		return true
		
	else
	
		return false	
		
	end

end

function PLAYER:IsNPCFriend(npc)
	
	if (self.CSB_Allies and table.Count(self.CSB_Allies) > 0 and self.CSB_Allies[npc:GetClass()]) then
	
		return true
		
	elseif (npc.IsVJBaseSNPC == true and self.VJ_NPC_Class and npc.VJ_NPC_Class and table.HasValue(npc.VJ_NPC_Class, self.VJ_NPC_Class[#self.VJ_NPC_Class])) then
	
		return true		
		
	else
	
		return false	
		
	end
	
end

function PLAYER:IsPlayerFriend(ply)
	
	if ply:IsCSBUser() and self.VJ_NPC_Class and ply.VJ_NPC_Class and table.HasValue(ply.VJ_NPC_Class, self.VJ_NPC_Class[#self.VJ_NPC_Class])then
	
		return true	
		
	elseif !ply:IsCSBUser() and self.VJ_NPC_Class and table.HasValue(self.VJ_NPC_Class, "CLASS_PLAYER_ALLY") then
		
		return true		
		
	else
	
		return false	
		
	end
	
end

--self:GetCurrentSchedule() == SCHED_SCRIPTED_CUSTOM_MOVE or self:GetCurrentSchedule() == SCHED_SCRIPTED_FACE or self:GetCurrentSchedule() == SCHED_SCRIPTED_RUN or self:GetCurrentSchedule() == SCHED_SCRIPTED_WAIT or self:GetCurrentSchedule() == SCHED_SCRIPTED_WALK or self:GetCurrentSchedule() == SCHED_WAIT_FOR_SCRIPT
function ENT:IsNPCScripting() -- Compared to suit itself!
	
	if self:GetInternalVariable("m_hCine") == "scripted_sequence" or self:GetInternalVariable("m_hGoalEnt") == "scripted_sequence" or self:GetInternalVariable("m_vecCommandGoal") == "scripted_sequence" or self:GetInternalVariable("m_bInAScript") == true then
	
		return true
		
	else
	
		return false	
		
	end
	
end

CSBTools = {
weapon_physgun = true,
gmod_tool = true,
gmod_camera = true
}

function ENT:IsCSBHoldingTool()

	if IsValid(self:GetActiveWeapon()) and CSBTools[self:GetActiveWeapon():GetClass()] then
	
		return true
		
	else
	
		return false
		
	end
	
end

function PLAYER:IsAiming()
--[[
	if GetConVar("fov_desired"):GetInt() != self:GetFOV() + 1 then
		return true
	else
		return false
	end
]]
return false
end

function ENT:CSBTranslateSequence(anim)

	if isstring(anim) then
	
		local result = self:GetSequenceActivity(self:LookupSequence(anim))
		
		if result == nil or result == -1 then
		
			return false
			
		else
		
			return result
			
		end
		
	elseif isnumber(anim) then 
	
		return anim
		
	else
	
		return false
		
	end
	
end

function ENT:IsPropPhysics()

	if self:GetClass() == "prop_physics" then
	
		return true
		
	else
	
		return false
		
	end
	
end

function ENT:IsPropStatic()

	if self:GetClass() == "prop_static" then
	
		return true
		
	else
	
		return false
		
	end
	
end

function ENT:IsDoor()
	
	local doorClass = self:GetClass()
	
	if ( doorClass == "func_door" or doorClass == "func_door_rotating" or doorClass == "prop_door" or doorClass == "prop_door_rotating" ) then
	
		return true
		
	else
	
		return false
		
	end
	
end

function ENT:IsDoorOpen()
	
	local doorClass = self:GetClass()

	if ( doorClass == "func_door" or doorClass == "func_door_rotating" ) then

		return self:GetInternalVariable( "m_toggle_state" ) == 0

	elseif ( doorClass == "prop_door_rotating" ) then

		return self:GetInternalVariable( "m_eDoorState" ) ~= 0

	else

		return false

	end

end

function CSBIsSpaceEmpty(ent, startpos, endpos, filterTab, min, max) -- Check why aren't they throwing.
		
	local cbX, cbY = IsValid(ent) && ent:GetCollisionBounds() || Vector(0, 0, 0), Vector(0, 0, 0)
	local tr = util.TraceHull( {
		start = startpos,
		endpos = endpos,
		mins = min || cbX,
		maxs = max || cbY,
		filter = filterTab
	})
		
	if tr.Hit then
		
		return false
			
	else
		
		return true
		
	end
		
end

function CSBCanDropToFloor(ent, startpos, endpos, filterTab) -- Check why aren't they throwing.

	local tr = util.TraceLine( {
		start = IsValid(ent) && ent:GetPos() || startpos,
		endpos = IsValid(ent) && ent:GetPos() * ent:GetUp() * -256 || endpos + Vector( 0, 0, -256 ),
		filter = filterTab || IsValid(ent) && {ent} || nil
	})
		
	if tr.Hit then
		
		return true
			
	else
		
		return false
		
	end
		
end

function ENT:IsDoorLocked()
	
	if GetConVar("csb_door_kick_open_locked"):GetBool() then
	
		return false
		
	else
	
		return ( self:GetInternalVariable( "m_bLocked" ) )
		
	end

end

function PLAYER:GetClientAngles()
	
	if (SERVER) then
	net.Start("csb_player_getnagles_fix")
	net.WriteAngle(self:GetAngles())
	net.Send(self)
	end
	
	if (CLIENT) then

		return self.ClientAngles
		
	else
	
		return ply:GetAngles()
		
	end
	
end

function ENT:EmitServerSound(soundName,soundLevel,pitchPercent,volume,channel,soundFlags,dsp)
	if soundName == nil then return end
	soundLevel = soundLevel or 75
	pitchPercent = pitchPercent or 100
	volume = volume or 1
	channel = channel or CHAN_AUTO
	soundFlags = soundFlags or 0
	dsp = dsp or 0
	if (SERVER) then self:EmitSound(soundName, soundLevel, pitchPercent, volume, channel, soundFlags, dsp) end
end

function ENT:EmitClientSound(soundName,soundLevel,pitchPercent,volume,channel,soundFlags,dsp) -- Be serious...
	--if ( game.SinglePlayer() && CLIENT ) then return end
	--if ( !game.SinglePlayer() && SERVER ) then return end
	if soundName == nil then return end
	soundLevel = soundLevel or 75
	pitchPercent = pitchPercent or 100
	volume = volume or 1
	channel = channel or CHAN_AUTO
	soundFlags = soundFlags or 0
	dsp = dsp or 0
	if (CLIENT) then self:EmitSound(soundName, soundLevel, pitchPercent, volume, channel, soundFlags, dsp) end
end

function ENT:IsNPCAnim()

	return self:GetCSBSuit().NPCAnims
	
end

function ENT:CSBWithinDistance(ent,dist)
	-- Square the input distance in order to perform our distance check on Source units.
	local distSqr = dist * dist

	return self:GetPos():DistToSqr( ent:GetPos() ) < distSqr
	
end

function ENT:CSBDistance(ent)
	return self:GetPos():DistToSqr( ent:GetPos() )	
end

function ENT:CSBResetBone()
	
	local bonecount = self:GetBoneCount()
	
	for i = 0, bonecount do
	
		self:ManipulateBonePosition( i, Vector( 0, 0, 0 ) )
		self:ManipulateBoneAngles( i, Angle( 0, 0, 0 ) )
		
	end
	
	if (SERVER) then
			
		net.Start("csb_fix_bones")
		net.WriteEntity(self)
		net.Broadcast()
	
	end

end

function ENT:CSBEditBone(tab)

	self:CSBResetBone()
	
	timer.Simple(0, function()
	
	if !IsValid(self) then return end
	
		for bone, params in pairs(tab) do
	
			local boneid = self:LookupBone( bone )
		
			if boneid then
		
				self:ManipulateBonePosition( boneid, params.pos or Vector( 0, 0, 0 ) )
				self:ManipulateBoneAngles( boneid, params.ang or Angle( 0, 0, 0 ) )
			
			end
		
		end
	
	end)
	
end

function ENT:CSBRemoveSpawnFlag(sflag) 

	-- Using bitwise operations to clear the key bits.
	
	local newsflags = bit.band(self:GetSpawnFlags(), bit.bnot(sflag))
	
	self:SetKeyValue( "spawnflags", "" .. newsflags .. "" )
	
end

function ENT:CSBCapabilitiesHas(cap) 

	-- Using bitwise operations to clear the key bits.
	
	if bit.band( self:CapabilitiesGet(), cap ) == cap then
		return true
	else
		return false
	end
	
end

function CSBSoundDuration(strfile) -- We want to round the sound duration.

	local sounddur = SoundDuration(strfile)
	
	if sounddur then
	
		sounddur = math.Round(sounddur * 1000) / 1000
		
	end
	
	return sounddur
end

function ENT:CSBEmitSoundSequence(stable, stopdead, callback)

	if !(SERVER) then return end
	
	stopdead = stopdead or false
	
	if !IsValid(self) or stable == nil or !istable(stable) or (((self:IsPlayer() and !self:Alive()) or (self:IsNPC() and self:Health() <= 0)) and stopdead) then return end
	
	if #stable.sound == 1 then 
		
		if istable(stable.sound[1]) then
	
			local snd = stable.sound[1]
			self:EmitSound(snd[math.random(#snd)],stable.level,stable.pitch,stable.volume,stable.channel)
			
		else
		
			self:EmitSound(self:EmitSound(snd[1],stable.level,stable.pitch,stable.volume,stable.channel),stable.level,stable.pitch,stable.volume,stable.channel)
			
		end

		return 
		
	end
	
	self:CSBStopSoundSequence(true)
	
	local CSB_ESS_CurAudio = 1
	local CSB_ESS_SoundLast = 0
	local CSB_ESS_SoundDelay = 0
	
	local timerName = "CSBEmitSoundSequenceTimer"..self:EntIndex()
	
	timer.Remove(timerName)
	
	timer.Create(timerName, 0.01, 0, function()
	
		if !IsValid(self) or stable == nil or (((self:IsPlayer() and !self:Alive()) or (self:IsNPC() and self:Health() <= 0)) and stopdead) or (CSB_ESS_CurAudio > #stable.sound) then
		
			timer.Remove(timerName)
			CSB_ESS_CurSound = 1
			
			if isfunction(callback) then
			
				local CSBESSFunction = callback
				
				self:CSBESSFunction()
				
			end
			
		return end
	
		if CurTime() - CSB_ESS_SoundLast >= CSB_ESS_SoundDelay then
			
			if CSB_ESS_CurAudio <= #stable.sound then
				
				local curAudio = stable.sound[CSB_ESS_CurAudio]
				local curDur = stable.duration[CSB_ESS_CurAudio]
				local curRand = math.random(#curAudio)
				local dur = 0
				local snd = 0
				local sndtab = 0
				local durtab = 0
				
				if istable(curAudio) then
					
					sndtab = curAudio[curRand]
	
				end
				
				if istable(curDur) then
					
					durtab = curDur[curRand]
	
				end

				if istable(curDur) and durtab > 0 then 
				
					dur = durtab
				
				elseif !istable(curDur) and curDur > 0 then 
				
					dur = stable.duration[CSB_ESS_CurAudio]
				
				else
				
					if istable(stable.sound[CSB_ESS_CurAudio]) then

						dur = CSBSoundDuration(sndtab)
						
					else
					
						dur = CSBSoundDuration(stable.sound[CSB_ESS_CurAudio])
						
					end
					
				end
				
				CSB_ESS_SoundDelay = dur
				
				if istable(stable.sound[CSB_ESS_CurAudio]) then

					snd = sndtab
					
				else
				
					snd = stable.sound[CSB_ESS_CurAudio]
					
				end
				
				self:SetNW2String("CSB_ESS_CurSound", snd)
				self:EmitSound(snd,stable.level,stable.pitch,stable.volume,stable.channel)
				
				CSB_ESS_CurAudio = CSB_ESS_CurAudio + 1
				CSB_ESS_SoundLast = CurTime()
				
			end
			
		end
		
	end)
	
end

function ENT:CSBStopSoundSequence(fullstop)

	if timer.Exists("CSBEmitSoundSequenceTimer"..self:EntIndex()) then 
	
	timer.Remove("CSBEmitSoundSequenceTimer"..self:EntIndex()) 
		
		if fullstop == true and self:GetNW2String("CSB_ESS_CurSound") != nil then
		
			self:StopSound(self:GetNW2String("CSB_ESS_CurSound"))
			self:SetNW2String("CSB_ESS_CurSound", nil)
			
		end
		
	end
	
end

function PLAYER:CSBMatchPlayerRagdoll(rag)
	
	if self.CSBCurBGS then
		
		for i = 1, IsValid(rag) && #self.CSBCurBGS || -1 do									
			rag:SetBodygroup( i, self.CSBCurBGS[ i ] )					
		end

		self.CSBCurBGS = {}
		
	end
				
	if self.CSBCurSMS then
		
		for i = 1, IsValid(rag) && #self.CSBCurSMS || -1 do
			rag:SetSubMaterial( i - 1, self.CSBCurSMS[ i ] )	
			
		end
		
		self.CSBCurSMS = {}

	end
	
	if IsValid(rag) && self.CSBCurColor then 
		rag:SetColor(self.CSBCurColor)
		self.CSBCurColor = nil
	end
	
end

function PLAYER:CSBThirdperson(bool, time)

	self:SetNW2Bool("CSB_Thirdperson_Enabled", bool)
	
	if time != nil and isnumber(time) then
	
		timer.Create("CSB_PlayerEnableThirdperson"..self:EntIndex(), time, 1, function()
		
			if !IsValid(self) then return end
		
			self:SetNW2Bool("CSB_Thirdperson_Enabled", false)
		
		end)
	
	end
	
end

function PLAYER:CSBGrenadeThrow(anim, gtype, gammo, fuse, force, clean, model, material, bone, delay, esound, soundd, gspawn, gpos, gang, gppos, gpang)

	if !self:IsCSBUser() or self:InVehicle() or self:GetNW2Bool("CSB_PlayerThrowingGrenade") == true or !self:Alive() or self:Crouching() or (self:GetNW2Bool("CSB_PlayingAnim") == true and self:GetNW2Int("CSB_Gslot") == 6) then return end
	if self:GetAmmoCount(gammo) <= 0 then return end
	
	self:SetNW2Bool("CSB_PlayerThrowingGrenade", true)
	
	local suit = self:GetCSBSuit()
	
	if suit.AnimationStatesTab and suit.AnimationStatesTab.grenade then
	
		self:CSBSetAnimationState(suit.AnimationStatesTab.grenade[1],suit.AnimationStatesTab.grenade[2],suit.AnimationStatesTab.grenade[3])
	
	end
	
	self:SendCSBAnimation(6, anim, true, true, nil, nil, delay, true)

	if (SERVER) then self:CSBDrawProp(model, material, 1, 0, bone, delay - gspawn, gppos, gpang) end
	
	self:SetAmmo(self:GetAmmoCount(gammo)-1, gammo)
	
	timer.Create("CSB_PlayerGrenadeSoundDelay"..self:EntIndex(), delay - soundd, 1, function()
	
	if !self:IsCSBUser() or !self:Alive() or self:Crouching() or !(SERVER) then return end
	
		if esound then 
		
			if isstring(esound) then self:EmitServerSound(esound) 
			elseif istable(esound) then self:CSBEmitSoundSequence(esound) end
		
		end
	
	end)
	
	timer.Create("CSB_PlayerGrenadeThrowDelay"..self:EntIndex(), delay - gspawn, 1, function()
	
	if !self:IsCSBUser() or !self:Alive() or self:Crouching() or !(SERVER) then return end
	
		local grenade = ents.Create( gtype )
		local plyAng = Angle(0, self:GetAngles().y, 0)
		local offsetVec = gpos
		local offsetAng = gang
		local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self:GetPos(), plyAng)
		
		grenade:SetPos(newPos)
		grenade:SetAngles(newAng)
		grenade:SetModel(model)
		grenade:SetMaterial(material)
		grenade:SetOwner(self)
		grenade:Fire("SetTimer", fuse)
		grenade:Spawn()
		grenade:Activate()		
		grenade:SetNW2Bool("CSB_SpawnedEQ", true)
		
		if clean != nil and clean > 0 then SafeRemoveEntityDelayed(grenade, clean) end
		
		if !self:GetNW2Bool("CSB_GrenadeKeyDown") then force = force * 0.5 end
			
		local vel = self:GetAimVector() * force + Vector(0, 0, force * 0.5)
        
		local phys = grenade:GetPhysicsObject()
		
		if IsValid(phys) then
		
			phys:SetMass( 1 ) -- just in case.
			phys:AddAngleVelocity(Vector(math.random(-2000,2000),math.random(-2000,2000),math.random(-2000,2000)))
			phys:ApplyForceCenter(vel)
			
		end
	
	end)
	
	timer.Create("CSB_PlayerGrenadeThrowCooldown"..self:EntIndex(), delay, 1, function()
	
		if IsValid(self) then self:SetNW2Bool("CSB_PlayerThrowingGrenade", false) end
		
	end)
	
end

local knockedDoors = knockedDoors or {}

function ENT:DoorKickEffect(bone, pos) -- pos from the bone

	local handle = self:LookupBone( bone )
	pos = pos or Vector(0,0,0)
	
	local effPos = effPos or (self:GetPos() + self:OBBCenter())
	
	if handle then
		
		local offsetPos = Vector(pos.x, pos.y, pos.z)
		local offsetAng = Angle(0,0,0)
		local handlePos, handleAng = self:GetBonePosition( handle )	
		local newPos, newAng = LocalToWorld(offsetPos, offsetAng, handlePos, handleAng)
		
		effPos = newPos
				
	end
			
	local effect = EffectData()
	effect:SetStart(effPos)
	effect:SetOrigin(effPos)
	effect:SetMagnitude( 1 )
	effect:SetScale( 1 )
	effect:SetRadius( 6 )
	util.Effect( "door_hit", effect, true, nil )

end

function ENT:DoorOpenFastAndReset(ply)
	
	local doorClass = self:GetClass()
	
	local defDirection = self:GetInternalVariable( "opendir" ) or 0
	self:SetKeyValue( "opendir", "0" )
		
	local defSpeed = self:GetInternalVariable( "Speed" ) or 500
	self:SetKeyValue( "Speed", "900" )
	
	if GetConVar("csb_door_kick_open_locked"):GetBool() then self:Fire("unlock", .02) end
	
	if doorClass == "func_door" or doorClass == "func_door_rotating" then
	
		self:Fire( "open", .02 )
	
	else
	
		ply:SetName( "" .. ply:Nick() .. ply:EntIndex() .. "" )
		self:Fire( "openawayfrom", "" .. ply:Nick() .. ply:EntIndex() .. "" , .02 )
	
	end
	
	self:EmitServerSound("CSBDoorKick.Break")
	
	self:DoorKickEffect("handle", Vector(0,0,-1))
	self:DoorKickEffect("handle", Vector(-40,50,-1))
	self:DoorKickEffect("handle", Vector(-40,-30,-1))
	
	local doorshake = ents.Create( "env_shake" )
	doorshake:SetOwner(self)
	doorshake:SetPos( self:GetPos() )
	doorshake:SetKeyValue( "amplitude", "5500" )
	doorshake:SetKeyValue( "radius", "100" )
	doorshake:SetKeyValue( "duration", "0.5" )
	doorshake:SetKeyValue( "frequency", "555" )
	doorshake:SetKeyValue( "spawnflags", "4" )	
	doorshake:Spawn()
	doorshake:Activate()
	doorshake:Fire( "StartShake", "", 0 )
		
	timer.Simple(0.3, function()
		if !IsValid(self) then return end
		
		self:SetKeyValue( "Speed", defSpeed )
		self:SetKeyValue( "opendir", defDirection )
		self.pounds = 0
			
	end)

end

function ENT:KickDoorOpen(ply, tr, evline, evlined, delay)
	
	if !IsValid(self) then return end
	
	local maxDoorPounds = GetConVar("csb_door_kick_open_tries"):GetInt()	
	local doorClass = self:GetClass()
	
	self.pounds = self.pounds or 0
	
	local cbA, cbB = self:GetCollisionBounds()
	self.CollisionBoundsA = self.CollisionBoundsA or cbA
	self.CollisionBoundsB = self.CollisionBoundsB or cbB
	
	if ( doorClass == "func_door" or doorClass == "func_door_rotating" or doorClass == "prop_door" or doorClass == "prop_door_rotating" ) and !self:IsDoorOpen() and !self:IsDoorLocked() then
		
		self.pounds = self.pounds + 1
		
		if self.pounds < maxDoorPounds then
		
			self:EmitServerSound("CSBDoorKick.Pound")
		
			local doorshake = ents.Create( "env_shake" )
			doorshake:SetOwner(self)
			doorshake:SetPos( self:GetPos() )
			doorshake:SetKeyValue( "amplitude", "100" )
			doorshake:SetKeyValue( "radius", "100" )
			doorshake:SetKeyValue( "duration", "0.1" )
			doorshake:SetKeyValue( "frequency", "10" )
			doorshake:SetKeyValue( "spawnflags", "4" )	
			doorshake:Spawn()
			doorshake:Activate()
			doorshake:Fire( "StartShake", "", 0 )
		
			self:DoorKickEffect("handle", Vector(0,0,-1))
			self:DoorKickEffect("handle", Vector(-40,50,-1))
			self:DoorKickEffect("handle", Vector(-40,-30,-1))
			
				local offsetPos = Vector(0,20,0)
				local offsetAng = Angle(0,0,0)
				local newPos, newAng = LocalToWorld(offsetPos, offsetAng, self:GetPos(), self:GetAngles())
		
				local findPos = newPos
			
			for _, door in pairs( ents.FindInSphere(findPos, 30) ) do
		
				if IsValid(door) and door:IsDoor() and door:GetInternalVariable("slavename") == self:GetInternalVariable("slavename") and door != self then

					door:DoorKickEffect("handle", Vector(0,0,-1))
					door:DoorKickEffect("handle", Vector(-40,50,-1))
					door:DoorKickEffect("handle", Vector(-40,-30,-1))
			
				end
		
			end
		
		elseif self.pounds >= maxDoorPounds then
		
			self:DoorOpenFastAndReset(ply)
			
			local delay = delay or evlined or 0
			
			timer.Create("CSB_PlayerKickDoorVoiceLineDelay"..ply:EntIndex(), delay - evlined, 1, function()
			if !ply:IsCSBUser() or !ply:Alive() or !(SERVER) then return end
	
				if evline then 
		
					if isstring(evline) then ply:EmitServerSound(evline) 
					elseif istable(evline) then ply:CSBEmitSoundSequence(evline) end
		
				end
	
			end)
			
			local offsetPos = Vector(0,20,0)
			local offsetAng = Angle(0,0,0)
			local newPos, newAng = LocalToWorld(offsetPos, offsetAng, self:GetPos(), self:GetAngles())
		
			local findPos = newPos
			
			for _, door in pairs( ents.FindInSphere(findPos, 30) ) do
		
				if IsValid(door) and door:IsDoor() and door:GetInternalVariable("slavename") == self:GetInternalVariable("slavename") and door != self then

					door:DoorOpenFastAndReset(ply)
			
				end
		
			end

		end
	
	end

end

function ENT:TakeDoorDown(tr) -- HEAVY "inspiration" from ttps://steamcommunity.com/sharedfiles/filedetails/?id=290961117&searchtext=door
		
		if !IsValid(self) then return end
		
		local maxDoorPounds = GetConVar("csb_door_kick_open_tries"):GetInt()
		local doorClass = self:GetClass()
		
		local cbA, cbB = self:GetCollisionBounds()
		self.CollisionBoundsA = self.CollisionBoundsA or cbA
		self.CollisionBoundsB = self.CollisionBoundsB or cbB
		
		if ( doorClass == "func_door" or doorClass == "func_door_rotating" or doorClass == "prop_door" or doorClass == "prop_door_rotating" ) and !self:IsDoorOpen() and !self:IsDoorLocked() then
		
			if (!self.phys_door or !IsValid(self.phys_door)) then
			
			self.pounds = self.pounds or 0
			
			if self.pounds < maxDoorPounds then
			
				self:EmitSound("CSBDoorKick.Pound")
				
				local doorshake = ents.Create( "env_shake" )
				doorshake:SetOwner(self)
				doorshake:SetPos( self:GetPos() )
				doorshake:SetKeyValue( "amplitude", "200" )
				doorshake:SetKeyValue( "radius", "100" )
				doorshake:SetKeyValue( "duration", "0.3" )
				doorshake:SetKeyValue( "frequency", "50" )
				doorshake:SetKeyValue( "spawnflags", "4" )	
				doorshake:Spawn()
				doorshake:Activate()
				doorshake:Fire( "StartShake", "", 0 )
				
				self:DoorKickEffect("handle", Vector(0,0,-1))
				
				self.pounds = self.pounds + 1
			
			elseif self.pounds >= maxDoorPounds then
			
				-- Now we create a self version of the self to be knocked down for looks
				local pdoor = ents.Create( "prop_physics" )
				pdoor:SetCollisionGroup(COLLISION_GROUP_WEAPON)
				pdoor:SetMoveType(MOVETYPE_VPHYSICS)
				pdoor:SetSolid(SOLID_BBOX) 
				pdoor:SetPos( self:GetPos() + Vector(0, 0, 2))
				pdoor:SetAngles( self:GetAngles() ) 
				pdoor:SetModel( self:GetModel() )
				pdoor:SetSkin( self:GetSkin() or 0 )
				pdoor:SetVelocity(tr.HitNormal*5000)
				
				local self_phys = pdoor:GetPhysicsObject()
	
					if ( IsValid( self_phys ) ) then
			
						self_phys:Wake()
						
						self_phys:SetVelocity(tr.HitNormal*5000)
			
				end
				
				table.insert(knockedDoors, self)
				self:Extinguish()
				self:SetNoDraw(true)
				self:SetNotSolid(true)
				pdoor:Spawn()
				
				pdoor:EmitSound("CSBDoorKick.Break")
				
				local doorshake = ents.Create( "env_shake" )
				doorshake:SetOwner(self)
				doorshake:SetPos( self:GetPos() )
				doorshake:SetKeyValue( "amplitude", "5500" )
				doorshake:SetKeyValue( "radius", "100" )
				doorshake:SetKeyValue( "duration", "0.5" )
				doorshake:SetKeyValue( "frequency", "555" )
				doorshake:SetKeyValue( "spawnflags", "4" )	
				doorshake:Spawn()
				doorshake:Activate()
				doorshake:Fire( "StartShake", "", 0 )
		
				self.phys_door = pdoor

				timer.Simple(5, function()
				
				if !IsValid(self) then return end
					
					self:ResetDoor()
						
				end)

			end
			
		end
		
	end

end

function ENT:ResetDoor() -- HEAVY "inspiration" from ttps://steamcommunity.com/sharedfiles/filedetails/?id=290961117&searchtext=door

	if IsValid(self) then
	
		self:SetNoDraw(false)
		self:SetNotSolid(false)
		self.pounds = 0
		
		if IsValid(self.phys_door) then
		
			SafeRemoveEntity(self.phys_door)
			self.phys_door = nil
			
		end

		for i = 1, #knockedDoors do
		
			if knockedDoors[i] == self then
			
				knockedDoors[i] = nil
				
			end
			
		end
		
	end
	
end

function PLAYER:CSBKickDoor(anim, delay, range, esound, evline, evlined, kicktime)

	if !self:IsCSBUser() or self:InVehicle() or self:GetNW2Bool("CSB_PlayerKickingDoor") == true or !self:Alive() or self:Crouching() or (self:GetNW2Bool("CSB_PlayingAnim") == true and self:GetNW2Int("CSB_Gslot") == 6) then return end
	
	self:SetNW2Bool("CSB_PlayerKickingDoor", true)
	
	--self:CSBThirdperson(false)
	
	self:SendCSBAnimation(6, anim, true, true, true, nil, delay, true)	
	
	local suit = self:GetCSBSuit()
	
	if suit.AnimationStatesTab and suit.AnimationStatesTab.doork then
	
		self:CSBSetAnimationState(suit.AnimationStatesTab.doork[1],suit.AnimationStatesTab.doork[2],suit.AnimationStatesTab.doork[3])
	
	end
	
	timer.Create("CSB_PlayerKickDoorDelay"..self:EntIndex(), delay - kicktime, 1, function()
	
	if !self:IsCSBUser() or !self:Alive() or self:Crouching() then return end
		
		if esound then 
		
			if isstring(esound) then self:EmitServerSound(esound) 
			elseif istable(esound) then self:CSBEmitSoundSequence(esound) end
		
		end
		
		self:LagCompensation( true )
	
		local tr = util.TraceHull( {
		start = self:EyePos(),
		endpos = self:EyePos() + self:GetAimVector() * range,
		filter = {self, self:GetActiveWeapon()},
		ignoreworld = true,
		mins = Vector(-20,-20,-20),
		maxs = Vector(20,20,20),
		mask = MASK_SHOT_HULL
		} )
		
		self:LagCompensation( false )
		
		if (tr.Hit) then
		
			local targ = tr.Entity
			local owie = DamageInfo()

			if (SERVER) and IsValid(targ) and targ:IsDoor() and !targ:IsDoorOpen() and !targ:IsDoorLocked() then
				
				targ:KickDoorOpen(self, tr, evline, evlined, delay)
			
			end
			
		end
		
	end)
	
	timer.Create("CSB_PlayerKickDoorCooldown"..self:EntIndex(), delay, 1, function()
	
		if IsValid(self) then self:SetNW2Bool("CSB_PlayerKickingDoor", false) end
		
	end)
	
end

function PLAYER:CSBMeleeAttack(anim, delay, range, esound, dmgtime, dmg, dmgtype)

	if !self:IsCSBUser() or self:InVehicle() or self:GetNW2Bool("CSB_PlayerMeleeAttacking") == true or !self:Alive() or self:Crouching() or (self:GetNW2Bool("CSB_PlayingAnim") == true and self:GetNW2Int("CSB_Gslot") == 6) then return end
	
	self:SetNW2Bool("CSB_PlayerMeleeAttacking", true)
	
	local suit = self:GetCSBSuit()
	
	if suit.AnimationStatesTab and suit.AnimationStatesTab.melee then
	
		self:CSBSetAnimationState(suit.AnimationStatesTab.melee[1],suit.AnimationStatesTab.melee[2],suit.AnimationStatesTab.melee[3])
	
	end
	
	self:SendCSBAnimation(6, anim, true, true, nil, nil, delay, true)
	
	timer.Create("CSB_PlayerMeleeAttackDelay"..self:EntIndex(), delay - dmgtime, 1, function()
	
	if !self:IsCSBUser() or !self:Alive() or self:Crouching() then return end
		
		if esound then 
		
		if isstring(esound) then self:EmitServerSound(esound) 
		elseif istable(esound) then self:CSBEmitSoundSequence(esound) end
		
		end
		
		self:LagCompensation( true )
	
		local tr = util.TraceHull( {
		start = self:EyePos(),
		endpos = self:EyePos() + self:GetAimVector() * range,
		filter = {self, self:GetActiveWeapon()},
		ignoreworld = true,
		mins = Vector(-20,-20,-20),
		maxs = Vector(20,20,20),
		mask = MASK_SHOT_HULL
		} )
		
		self:LagCompensation( false )
		
		if (tr.Hit) then
		
			local targ = tr.Entity
			local owie = DamageInfo()
			
			if (SERVER) and (targ:IsNPC() and (!IsValid(targ:GetEnemy()) or (!targ:Visible(self)))) then dmg = dmg*GetConVar("csb_stealth_melee_mul"):GetFloat() end
			
			owie:SetDamage(dmg)
			owie:SetDamageType(dmgtype)
			owie:SetAttacker(self)
			owie:SetInflictor(self)
			
			if (SERVER) and self:Visible(targ) and IsValid(targ) and !targ:IsDoor() then
			
				owie:SetDamageForce(self:GetForward()*200)
				targ:SetVelocity(self:GetUp()*150 + self:GetForward()*500)
				targ:TakeDamageInfo(owie)
			
				if targ:IsNPC() then targ:ClearGoal(); targ:StopMoving() end
				if targ:IsPlayer() then targ:ViewPunch(Angle(-20,math.random(-50,50),math.random(-15,15))) end
			
				targ:EmitServerSound("CSBSuit.MeleeHit.Something")
			
			end

			if targ:IsPlayer() or targ:IsNPC() then
			
				local bloodcol = targ:GetBloodColor()	
				local fleshimpact = EffectData()
				fleshimpact:SetEntity(targ)
				fleshimpact:SetOrigin(tr.HitPos)
				fleshimpact:SetNormal(tr.HitPos)
				
				if bloodcol >= 0 then
					
					fleshimpact:SetColor(bloodcol)
					util.Effect("BloodImpact", fleshimpact)
						
				end
				
			end
			
		end
		
	end)
	
	timer.Create("CSB_PlayerMeleeAttackCooldown"..self:EntIndex(), delay, 1, function()
	
		if IsValid(self) then self:SetNW2Bool("CSB_PlayerMeleeAttacking", false) end
		
	end)
	
end

function PLAYER:SendCSBAnimation(gslot, anim, loop, tp, freecam, camtable, dmovecam, dmove, esound, fserver)
	
	if !self:IsCSBUser() then return end
	if fserver == true and (CLIENT) then return end
	
	if gslot == nil or !isnumber(gslot) then gslot = 0 end
	if loop == nil or !isbool(loop) then loop = true end
	if tp == nil or !isbool(tp) then tp = false end
	if freecam == nil or !isbool(freecam) then freecam = false end
	if camtable == nil or !istable(camtable) then camtable = nil end
	
	local anim = anim or -1
	
	if anim == -1 or anim == nil then
		
		if IsLuaAnimation(self:GetNW2Int("CSB_Anim")) then
		
			self:StopLuaAnimation(self:GetNW2Int("CSB_Anim"))
		
		end
		
		self:SetNW2Int("CSB_Anim", -1)
		
		self:DoCustomAnimEvent(PLAYERANIMEVENT_CUSTOM, self:EntIndex()+1)
		
		self:SetNW2Int("CSB_Gslot", 0)
		self:SetNW2Bool("CSB_PlayingAnim", false)
		self:SetNW2Bool("CSB_Loop", true)
		self:SetNW2Bool("CSB_AnimInTP", false)
		self:SetNW2Bool("CSB_AnimInTPFreeCam", false)
		self:SetNW2Float("CSB_Dmovecam", 0)
		self:SetNW2Bool("CSB_Dmove", false)
		
		if (SERVER) then
			net.Start("csb_change_campos")
			net.WriteFloat(0)
			net.WriteFloat(0)
			net.WriteFloat(0)
			net.WriteFloat(0)
			net.WriteBool(true)
			net.Send(self)
		end
		
		return 
	
	end
	
	if dmovecam == nil or dmovecam == 0 or !isnumber(dmovecam) then
	
		if anim != -1 or anim != nil then
		
			if IsLuaAnimation(anim) then
			
				dmovecam = GetLuaAnimationDuration(anim)
				
			else
		
				dmovecam = self:SequenceDuration(self:LookupSequence("" .. anim .. "")) 
				
			end
			
		else
		
			dmovecam = 0
			
		end
		
	end
	
	if dmove == nil or !isbool(dmove) then dmove = false end
	
	self:SetNW2Bool("CSB_PlayingAnim", true)
	self:SetNW2Bool("CSB_Loop", loop)
	self:SetNW2Bool("CSB_AnimInTP", tp)
	self:SetNW2Bool("CSB_AnimInTPFreeCam", freecam)
	self:SetNW2Float("CSB_Dmovecam", dmovecam)
	self:SetNW2Bool("CSB_Dmove", dmove)
	
	if (SERVER) and camtable and istable(camtable) then
		net.Start("csb_change_campos")
		net.WriteFloat(camtable.x)
		net.WriteFloat(camtable.y)
		net.WriteFloat(camtable.z)
		net.WriteFloat(camtable.crouch)
		net.WriteBool(false)
		net.Send(self)
	end
	
	if esound != nil and isstring(esound) then self:EmitServerSound("".. esound .."", 75, 100, 1, CHAN_VOICE) end

	if IsLuaAnimation(anim) then
		
		self:SetNW2String("CSB_LuaAnim", anim)
		self:SetNW2Int("CSB_Gslot", gslot)
		self:SetLuaAnimation(anim)		
			
		if loop then self:StopLuaAnimation(anim, GetLuaAnimationDuration(anim)) end
	
	else

		if isstring(anim) then
		
			local seqid = self:LookupSequence(anim)
			self:SetNW2Int("CSB_Anim", seqid)
			self:SetNW2Int("CSB_Gslot", gslot)
			self:DoCustomAnimEvent(PLAYERANIMEVENT_CUSTOM, self:EntIndex()+1)

		elseif isnumber(anim) then
	
			self:SetNW2Int("CSB_Anim", anim)
			self:SetNW2Int("CSB_Gslot", gslot)
			self:DoCustomAnimEvent(PLAYERANIMEVENT_CUSTOM, self:EntIndex()+2)

		end
	
	end
	
	local animDur = dmovecam or GetAnimDuration(anim)

	timer.Create("CSB_PlayerInAnim"..self:EntIndex(), animDur, 1, function()
		
		if IsValid(self) and loop then
			
			self:SetNW2Bool("CSB_PlayingAnim", false)
				
		end
			
	end)
		
	timer.Create("CSB_PlayerInAnimThirdPerson"..self:EntIndex(), animDur, 1, function()
		
		if IsValid(self) and loop then
			
			self:SetNW2Bool("CSB_AnimInTP", false)
			self:SetNW2Bool("CSB_AnimInTPFreeCam", false)
			
			if (SERVER) then
			net.Start("csb_change_campos")
			net.WriteFloat(0)
			net.WriteFloat(0)
			net.WriteFloat(0)
			net.WriteFloat(0)
			net.WriteBool(true)
			net.Send(self)
			end
				
		end
			
	end)
	
end

function PLAYER:CSBSetAnimationState(animstateon, delay, animstateoff)

	self:SetNW2Int("CSB_AnimatonState", animstateon)

	if !self:IsCSBUser() or delay == nil or !isnumber(delay) or delay == 0 then return end

	timer.Create("CSB_PlayerInCombatCancel"..self:EntIndex(), delay, 1, function()
	
		if IsValid(self) and self:IsCSBUser() and self:IsNPCAnim() == true and self:GetNW2Int("CSB_AnimatonState") != animstateoff then
		
			self:SetNW2Int("CSB_AnimatonState", animstateoff)
			
		end
		
	end)
	
end

function ENT:CSBAlive()

	if IsValid(self) && ( ( self:IsNPC() && ( ( SERVER && self:GetNPCState() != 7 ) || ( CLIENT && self:Health() > 0 ) ) ) || ( self:IsPlayer() && self:Alive() ) ) then
	
		return true
		
	else
	
		return false
		
	end

end

function ENT:CSBHasEntLOS(ent) -- Big credit to the Captain Applesauce for this piece of work https://steamcommunity.com/profiles/76561198070248149

	if !IsValid(self) then return end
		
	local currENT = self
	
	if ( ( !IsValid(currENT) ) || ( ( !currENT:IsPlayer() ) && ( !currENT:IsNPC() ) ) ) then
	
		return false
			
	end
	
	local posOffset = ent:GetAngles():Up() * ent:BoundingRadius()
	local traceBlocked = false	
	local exclusions = { ent }
	
	if ( currENT && IsValid(currENT) ) then
		
		table.insert( exclusions, currENT )
			
	end
	
		local tr = util.TraceLine(
		{
			start     = currENT:EyePos(),
			endpos     = ent:GetPos() + posOffset,
			filter     = exclusions,
			mask     = MASK_OPAQUE
		})
		
		traceBlocked = tr.Hit

	return ( !traceBlocked )
	
end
	
function ENT:CSBVisibleInFOV(ent, plyfovmul, npcfov) -- Big credit to the Captain Applesauce for this piece of work https://steamcommunity.com/profiles/76561198070248149

	if !IsValid(self) then return end
		
	local function crossDist( vec1, vec2 )
		
		return math.sqrt( vec1:LengthSqr() * vec2:LengthSqr() - vec1:Dot( vec2 )^2 )
			
	end
	
	local function arctan2( y, x )
		
		if ( ( x != 0 ) || ( y != 0 ) ) then
			
			if ( math.abs( x ) >= math.abs( y ) ) then
				
				if ( x >= 0 ) then
				
					return math.atan( y / x )
						
				elseif ( y >= 0 ) then
					
					return math.atan( y / x ) + math.pi
				
				else
					
					return math.atan( y / x ) - math.pi
						
				end
					
			elseif ( y >= 0 ) then
				
				return math.pi / 2 - math.atan( x / y )
					
			else
				
				return -math.pi / 2 - math.atan( x / y )
					
			end
				
		else
			
			return 0.0
				
		end
			
	end
	
	local currENT = self
	
	if ( ( !currENT:IsValid() ) || ( ( !currENT:IsPlayer() ) && ( !currENT:IsNPC() ) ) ) then
		
		return false
			
	end
		
		if self:CSBHasEntLOS( ent ) then
			
			local posOffset = ent:GetAngles():Up() * ent:BoundingRadius()
			
			if currENT:IsPlayer() && currENT:CSBAlive() then
					
				local disp = ent:GetPos() + posOffset - currENT:EyePos()
						
				local radius = ent:BoundingRadius()
					
				if ( ( disp:LengthSqr() > ( radius^2 ) ) && ( disp:LengthSqr() > 0 ) ) then
						
					local fov = currENT:GetFOV() * ( plyfovmul || 1.5 )

					
					local distSqr = disp:LengthSqr()
					local aimVec = currENT:GetEyeTraceNoCursor().Normal					
					local dir = disp:GetNormalized()
					local viewRadius = arctan2( radius / math.sqrt( distSqr ), math.sqrt( 1 - radius^2 / distSqr ) ) * 180 / math.pi
					local viewOffset = arctan2( crossDist( dir, aimVec ), dir:Dot( aimVec ) ) * 180 / math.pi
						
					if ( viewOffset <= ( fov / 2 + viewRadius ) ) then
							
						return true
								
					end
							
				else
						
					return true
							
				end
					
			elseif currENT:IsNPC() && currENT:CSBAlive() then
				
				local disp = ent:GetPos() + posOffset - currENT:EyePos()
					
				local radius = ent:BoundingRadius()
				
				if ( ( disp:LengthSqr() > ( radius^2 ) ) && ( disp:LengthSqr() > 0 ) ) then
					
					local fov = npcfov || 90
					local distSqr = disp:LengthSqr()
					local aimVec = currENT:GetAimVector()
					local dir = disp:GetNormalized()
					local viewRadius = arctan2( radius / math.sqrt( distSqr ), math.sqrt( 1 - radius^2 / distSqr ) ) * 180 / math.pi
					local viewOffset = arctan2( crossDist( dir, aimVec ), dir:Dot( aimVec) ) * 180 / math.pi
					
					if ( viewOffset <= ( fov / 2 + viewRadius ) ) then
						
						return true
							
					end
						
				else
					
					return true
						
				end
					
			end
				
		end
	
	return false
	
end

function CSBMovement(ply, mvd, cmd)

	mvd:SetMaxClientSpeed(1)
	
	mvd:CSBRemoveKeys(IN_JUMP+IN_DUCK)

end

local CMoveData = FindMetaTable("CMoveData")

function CMoveData:CSBRemoveKeys(keys)

	-- Using bitwise operations to clear the key bits.
	
	local newbuttons = bit.band(self:GetButtons(), bit.bnot(keys))
	
	self:SetButtons(newbuttons)
	
end

function PLAYER:CSBRotateGesture()

if !self:IsCSBUser() or self:InVehicle() then return end

	self.rg_ang1 = self:LocalEyeAngles().y
	self.rg_ang2 =  self:GetRenderAngles().y

	local vel = self:GetVelocity():Length()
	local ang = math.abs(math.AngleDifference(self.rg_ang1, self.rg_ang2))
	local angmath = math.Round(ang)
	
	if vel <= 0 and ang > 44.55 and self:GetNW2Bool("CSB_PlayerMeleeAttacking") != true and self:GetNW2Bool("CSB_PlayingAnim") != true and table.Count(self:GetCSBSuit().CameraRotationGestures) > 0 then
	
		local rleft = self:GetCSBSuit().CameraRotationGestures.left
		local rright = self:GetCSBSuit().CameraRotationGestures.right
		
		if self.rg_ang1 >= self.rg_ang2 then
		
			self.rotate_anim = rleft
			
		elseif self.rg_ang1 <= self.rg_ang2 then
		
			self.rotate_anim = rright
			
		end
			
		self:SendCSBAnimation(5, self.rotate_anim, true, nil, nil, nil, nil, false, nil)
		
		local delay = self:GetAnimDuration(self.rotate_anim)
		
		timer.Create("CSB_PlayerRotateGestureDelay"..self:EntIndex(), delay + 0.5, 1, function()
		
			if !IsValid(self) then return end
			
			self.rotate_anim = nil
			
		end)
		
	end
	
end

function PLAYER:CSBFootStep()

	if (CLIENT) then return end
	
	if self:IsCSBUser() and self:Alive() and GetConVar("csb_enable_custom_footsteps"):GetBool() then

		local suit = self:GetCSBSuit()
	
		if !suit.PlyFootStepsTable then return end
		
		local plyFSTable = suit.PlyFootStepsTable
		
		local plyLFS = plyFSTable.lfootsound
		local plyRFS = plyFSTable.rfootsound
		
		local plyBFS = plyFSTable.bothstep	
		
		local fsDelay = plyFSTable.fssounddelay
		
		local plyRunLFS = plyFSTable.lfootsoundrun
		local plyRunRFS = plyFSTable.rfootsoundrun
		
		local fsRunMinSpeed = plyFSTable.runsndminspeed
		
		self.fsLast = self.fsLast or 0
		
		local lFoot = self:LookupBone( plyFSTable.lfootbone )
		local rFoot = self:LookupBone( plyFSTable.rfootbone )
			
		if lFoot and rFoot and (CurTime() - self.fsLast >= fsDelay) then
	
			local groundZDist = Vector(0, 0, 1) * plyFSTable.grounddist
			
			local lFootPos, lFootAng = self:GetBonePosition( lFoot )
			local rFootPos, rFootAng =  self:GetBonePosition( rFoot )
					
			if lFootPos and rFootPos and lFootAng and rFootAng then
		
				local lFootForward = lFootAng:Forward()
				lFootForward.z = 0
				lFootForward:Normalize()

				local rFootForward = rFootAng:Forward()
				rFootForward.z = 0
				rFootForward:Normalize()

				local lToePos = lFootPos + lFootForward * plyFSTable.toeposmul
				local rToePos = rFootPos + rFootForward * plyFSTable.toeposmul
						
				local lToeStart = Vector(lToePos.x, lToePos.y, lToePos.z)
				local rToeStart = Vector(rToePos.x, rToePos.y, rToePos.z)
						
				local mins = plyFSTable.stepcolboxmin
				local maxs = plyFSTable.stepcolboxmax
				
				local floatFix = Vector(0,0,0)
				
				if self:IsOnGround() then
					floatFix = Vector(0,0,20)
				else
					floatFix = Vector(0,0,0)
				end
				
				local offsetLeftVec = Vector(0,5,0)
				local offsetLeftAng = Angle(0,0,0)
				local newLeftPos, newLeftAng = LocalToWorld(offsetLeftVec, offsetLeftAng, self:GetPos(), self:GetAngles())
				
				local plyLTraceDist = util.TraceHull( {
					start = newLeftPos,
					endpos = newLeftPos - floatFix,
					mins = mins,
					maxs = maxs,
					filter = self
				})
				
				local plyLDist = (newLeftPos - plyLTraceDist.HitPos):Length()
				
				local offsetRightVec = Vector(0,-5,0)
				local offsetRightAng = Angle(0,0,0)
				local newRightPos, newRightAng = LocalToWorld(offsetRightVec, offsetRightAng, self:GetPos(), self:GetAngles())
				
				local plyRTraceDist = util.TraceHull( {
					start = newRightPos,
					endpos = newRightPos - floatFix,
					mins = mins,
					maxs = maxs,
					filter = self
				})
				
				local plyRDist = (newRightPos - plyRTraceDist.HitPos):Length()
				
				local lTraceToe = util.TraceHull( {
					start = lToeStart,
					endpos = lToeStart - (Vector(0,0,plyLDist)) - groundZDist,
					mins = mins,
					maxs = maxs,
					filter = self
				})
				
				local rTraceToe = util.TraceHull( {
					start = rToeStart,
					endpos = rToeStart - (Vector(0,0,plyRDist)) - groundZDist,
					mins = mins,
					maxs = maxs,
					filter = self
				})
				
				local plySpeed = self:GetVelocity():Length()
				
				if !lTraceToe.Hit and !rTraceToe.Hit and !self:IsOnGround() then self.playLandSound = true end

				if self.playLandSound != true and !self:IsNoClipping() and !self:IsOnLadder() then

					if lTraceToe.Hit and self.lFootSound != true then

						self.lFootSound = true
				
						if plyLFS[util.GetSurfacePropName( lTraceToe.SurfaceProps )] and #plyLFS[util.GetSurfacePropName( lTraceToe.SurfaceProps )] > 0 then
				
							local fsMatTable = plyLFS[util.GetSurfacePropName( lTraceToe.SurfaceProps )]
							
							for i = 1,#fsMatTable do
							
								self:EmitSound(fsMatTable[i])
							end
					
						else
				
							local fsMatDefTable = plyLFS['defaultstep']
						
							for i = 1,#fsMatDefTable do
						
								self:EmitSound(fsMatDefTable[i])
						
							end
					
						end
						
						if #plyRunLFS > 0 and plySpeed >= fsRunMinSpeed then
							
							for i = 1,#plyRunLFS do
								
								self:EmitSound(plyRunLFS[i])
								
							end
								
						end
					
					elseif !lTraceToe.Hit and self.lFootSound == true then
						
						self.lFootSound = false
						
					end
						
					if rTraceToe.Hit and self.rFootSound != true then

						self.rFootSound = true
				
						if plyRFS[util.GetSurfacePropName( rTraceToe.SurfaceProps )] and #plyRFS[util.GetSurfacePropName( rTraceToe.SurfaceProps )] > 0 then
						
							local fsMatTable = plyRFS[util.GetSurfacePropName( rTraceToe.SurfaceProps )]
							
							for i = 1,#fsMatTable do
							
								self:EmitSound(fsMatTable[i])
						
							end
						
						else
						
							local fsMatDefTable = plyRFS['defaultstep']
						
							for i = 1,#fsMatDefTable do

								self:EmitSound(fsMatDefTable[i])
						
							end

						end
						
						if #plyRunRFS > 0 and plySpeed >= fsRunMinSpeed then
							
							for i = 1,#plyRunRFS do

								self:EmitSound(plyRunRFS[i])
								
							end
								
						end
						
					elseif !rTraceToe.Hit and self.rFootSound == true then
						
						self.rFootSound = false
						
					end
					
				elseif self.playLandSound == true and (lTraceToe.Hit or rTraceToe.Hit) and !self:IsNoClipping() and !self:IsOnLadder() then
					
					local unitedSurfaceName = util.GetSurfacePropName( lTraceToe.SurfaceProps ) or util.GetSurfacePropName( rTraceToe.SurfaceProps )
					
					if util.GetSurfacePropName( lTraceToe.SurfaceProps ) == "default" and util.GetSurfacePropName( rTraceToe.SurfaceProps )  != "default" then unitedSurfaceName = util.GetSurfacePropName( rTraceToe.SurfaceProps ) end -- we must make sure that surface type is the same.
					if util.GetSurfacePropName( lTraceToe.SurfaceProps ) != "default" and util.GetSurfacePropName( rTraceToe.SurfaceProps )  == "default" then unitedSurfaceName = util.GetSurfacePropName( lTraceToe.SurfaceProps ) end
					
					self.playLandSound = false	

					if plyBFS[unitedSurfaceName] and #plyBFS[unitedSurfaceName] > 0  then
						
						local fsMatTable = plyBFS[unitedSurfaceName]

						for i = 1,#fsMatTable do
							
							self:EmitSound(fsMatTable[i])
							
						end
						
					else
						
						local fsMatDefTable = plyRFS['defaultstep']
						
						for i = 1,#fsMatDefTable do
						
							self:EmitSound(fsMatDefTable[i])
						
						end

					end
				
				end
			
			end
		
			self.fsLast = CurTime()
		
		end
		
	end
	
end

function ENT:CSBGetName()

	local name = name or false

	if (SERVER) and self:IsNPC() and self:GetName() != "" or nil then
	
		name = self:GetName()
	
	elseif (CLIENT) and self:IsNPC() and self.CLGetName != nil then

		name = self.CLGetName
	
	elseif self:IsNPC() then

		name = self:GetClass() .. " " .. self:EntIndex()
	
	elseif self:IsPlayer() then
	
		name = self:Nick()
	
	end

	return name
end

NPCVehicleAnims = {
    ["models/buggy.mdl"] = {
		
		['attachment'] = "vehicle_feet_passenger0",
		
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( 0, -50, 50 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 0, -50, -50 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -50, -20, 0 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 50, -20, 0 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 20, -115, 20 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -10, -105, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 75, -10 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 55, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, -10, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( 8, 0, -30 ) }

    },
	["models/vehicle.mdl"] = {		
	
		['attachment'] = "vehicle_feet_passenger0",
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( 0, -40, 50 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 0, -40, -50 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -50, -20, 0 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 50, -20, 0 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 10, -95, 20 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -10, -100, -20 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 5, 50, 0 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 55, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( 10, 0, -30 ) }

    },
	["models/airboat.mdl"] = {
	
		['attachment'] = "vehicle_feet_passenger0",
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( 10, -60, 50 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( -10, -60, -50 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -40, -20, -90 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 40, -20, 90 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 5, -100, 20 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -5, -90, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 60, 0 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 30, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 20, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 20, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( 1, 0, -35 ) }

    },
	["models/vehicles/prisoner_pod_inner.mdl"] = {
	
		['attachment'] = "enter1",
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( -50, 5, 0 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 50, -5, 0 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( 0, 0, 0 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 0, 0, 0 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 0, 0 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 25, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 25, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { ang = Angle( 180, 0, 0 ), pos = Vector( 14, 0, -25 ) }

    },
	["models/props_lab/cactus.mdl"] = {
	
		['attachment'] = false,
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( -50, 5, 0 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 50, -5, 0 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( 0, 0, 0 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 0, 0, 0 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 0, 0 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 25, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 25, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { ang = Angle( 180, 0, 0 ), pos = Vector( 14, 0, -25 ) }

    },
	["prop_vehicle_prisoner_pod"] = {
	
		['attachment'] = "vehicle_feet_passenger0",
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( -20, -30, 30 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 20, -30, -30 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -40, -20, -90 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 40, -20, 90 ) },
		
		['ValveBiped.Bip01_R_Hand'] = { ang = Angle( 0, 40, 0 ) },
        ['ValveBiped.Bip01_L_Hand'] = { ang = Angle( 0, 40, 0 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 10, -90, 0 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -10, -90, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 80, 0 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 80, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 20, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 20, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( -4, 0, -37 ) }

    },
	["prop_vehicle_jeep"] = {
	
		['attachment'] = "vehicle_feet_passenger0",
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( 0, -50, 50 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 0, -50, -50 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -50, -20, 0 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 50, -20, 0 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 20, -115, 20 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -10, -105, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 75, -10 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 55, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, -10, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 0, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( 8, 0, -30 ) }

    },
	["prop_vehicle_airboat"] = {
	
		['attachment'] = "vehicle_feet_passenger0",
	
        ['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( 10, -60, 50 ) },
        ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( -10, -60, -50 ) },

        ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -40, -20, -90 ) },
        ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 40, -20, 90 ) },
		
		['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 5, -100, 20 ) },
        ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -5, -90, 0 ) },
		
		['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 60, 0 ) },
        ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 30, 0 ) },
		
		['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 20, 0 ) },
        ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 20, 0 ) },
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( 1, 0, -35 ) }

    },
}

function ENT:SetNPCPassenger(npc)

	if !IsValid(npc) then 
	
		self.CSB_VehicleNPCPassenger = NULL
	
		return
	
	else
	
		self.CSB_VehicleNPCPassenger = npc
	
	end
	
end

function ENT:SetNPCVehicle(veh)

	if !IsValid(veh) then 
	
		self.CSB_NPCsVehicle = NULL
	
		return
	
	else
	
		self.CSB_NPCsVehicle = veh
	
	end
	
end

function ENT:GetNPCPassenger()

	if !IsValid(self.CSB_VehicleNPCPassenger) then 
	
		return NULL
	
	else
	
		return self.CSB_VehicleNPCPassenger
	
	end
	
end

function ENT:GetNPCVehicle()

	if !IsValid(self.CSB_NPCsVehicle) then 
	
		return NULL
	
	else
	
		return self.CSB_NPCsVehicle
	
	end
	
end

function ENT:NPCEnterVehicle(veh)

	if !IsValid(self) then return end
	if IsValid(self:GetNPCVehicle()) then return end
	
	if veh:IsVehicle() and !IsValid(veh:GetDriver()) and !IsValid(veh:GetNPCPassenger()) and self:OrderValidNPC() and NPCVehicleAnims then
		
		local vehtable = NPCVehicleAnims
		
		local lookforseat = -1
		
		if vehtable[veh:GetModel()] and (!vehtable[veh:GetModel()].attachment or vehtable[veh:GetModel()].attachment == false) then

			self:SetNoDraw(true)
			self:DrawShadow(false)
			
			if IsValid(self:GetActiveWeapon()) then		
				self:GetActiveWeapon():SetNoDraw(true)
				self:GetActiveWeapon():DrawShadow(false)			
			end
			
			lookforseat = -1
			
		elseif vehtable[veh:GetClass()] and (!vehtable[veh:GetClass()].attachment or vehtable[veh:GetClass()].attachment == false) then

			self:SetNoDraw(true)
			self:DrawShadow(false)
			
			if IsValid(self:GetActiveWeapon()) then		
				self:GetActiveWeapon():SetNoDraw(true)
				self:GetActiveWeapon():DrawShadow(false)			
			end
			
			lookforseat = -1
		
		elseif vehtable[veh:GetModel()] and vehtable[veh:GetModel()].attachment then
			
			self:CSBEditBone(vehtable[veh:GetModel()])
			lookforseat = veh:LookupAttachment(vehtable[veh:GetModel()].attachment) or -1
			
		elseif vehtable[veh:GetClass()] and vehtable[veh:GetClass()].attachment then
			
			self:CSBEditBone(vehtable[veh:GetClass()])
			lookforseat = veh:LookupAttachment(vehtable[veh:GetClass()].attachment) or -1
			
		end	
		
		local seat = veh:GetAttachment(lookforseat)
		
		local seatPos = seatPos or veh:GetPos()
		local seatAng = seatAng or veh:GetAngles()
		
		if seat then	
			seatPos = seat.Pos
			seatAng = seat.Ang		
		end
		
		veh:SetNPCPassenger(self)
		self:SetVelocity( Vector(0,0,0) )
		self:SetNPCVehicle(veh)
		self:SetPos(seatPos)
		self:SetAngles(seatAng)
		self:SetParent(veh)
		self:SetCondition(67)
		self:SetSchedule(SCHED_NPC_FREEZE)
		
		if self.IsVJBaseSNPC == true then			
			self.defMoveType = self.MovementType
			self.MovementType = VJ_MOVETYPE_STATIONARY
			self:SetState(VJ_STATE_FREEZE)		
		end			
		
		self:ClientSetIK(false)	
	
	end

end

function ENT:NPCExitVehicle()

	if !IsValid(self) then return end
	
	if !IsValid(self:GetNPCVehicle()) then
		self:SetParent()
		self:SetAngles(Angle(0,0,0))
		self:SetNPCVehicle()
		self:SetCondition(68)
		self:DropToFloor()
		self:ClientSetIK(true)
		self:SetNoDraw(false)
		self:DrawShadow(true)

		self:SetMoveType( self.defMoveType )
		
		if IsValid(self:GetActiveWeapon()) then		
			self:GetActiveWeapon():SetNoDraw(false)
			self:GetActiveWeapon():DrawShadow(true)			
		end
	
		return 
	
	end

	local veh = self:GetNPCVehicle()
	
	self:SetParent()
	self:SetPos(veh:GetPos()+veh:SafeToExitVehicle(self))
	self:SetAngles(Angle(0,0,0))
	self:CSBResetBone()
	self:SetCondition(68)
	
	if self.IsVJBaseSNPC == true then		
		self.MovementType = self.defMoveType
		self:SetState() 	
	end
	
	self:DropToFloor()
	self:ClientSetIK(true)
	self:SetNoDraw(false)
	self:DrawShadow(true)
	
	if IsValid(self:GetActiveWeapon()) then		
		self:GetActiveWeapon():SetNoDraw(false)
		self:GetActiveWeapon():DrawShadow(true)			
	end
	
	veh:SetNPCPassenger()
	self:SetNPCVehicle()
	
end

if (SERVER) then

	util.AddNetworkString("csb_player_getnagles_fix")
	util.AddNetworkString("csb_toggle_crosshair")
	util.AddNetworkString("csb_send_server_sound")
	util.AddNetworkString("csb_send_client_sound")
	util.AddNetworkString("csb_npc_set_ik")
	util.AddNetworkString("CSB.Message")
	util.AddNetworkString("CSB_ActionMenu")
	util.AddNetworkString("CSB_Info_Notify")
	util.AddNetworkString("csb_getNforCLc")
	util.AddNetworkString("csb_fix_bones")
	util.AddNetworkString("csb_change_campos")
	util.AddNetworkString("csb_order_eff")
	util.AddNetworkString("csb_ability_primary_color")
	util.AddNetworkString("csb_ability_secondary_color")
	util.AddNetworkString("csb_update_name_HUD")
	util.AddNetworkString("csb_ply_color")
	util.AddNetworkString("csb_create_cprop")
	util.AddNetworkString("csb_player_initial_spawn_check")
	util.AddNetworkString("csb_player_ragdoll")
	util.AddNetworkString("csb_player_bgs_cl")
	util.AddNetworkString("csb_player_sms_cl")
	util.AddNetworkString("csb_player_col_cl")
	
	net.Receive("csb_player_initial_spawn_check", function(len, ply)
	
		timer.Simple(0.1, function()

			if IsValid(ply) then
				
				--ply:CSBResetBone()
				ply:SetNW2Bool("CSB_PlayerFullyLoaded", true)
				
			end
				
		end)
		
	end)
	
	function PLAYER:CSBDrawProp(model, material, scale, scalespeed, bonename, duration, pos, ang)
		
		local model = model or "models/Gibs/HGIBS.mdl"
		local material = material or ""
		local scale = scale or 1
		local scalespeed = scalespeed or 0
		local bonename = bonename or "nutin"
		local duration = duration or 0
		local pos = pos or Vector(0,0,0)
		local ang = ang or Angle(0,0,0)
		
		net.Start("csb_create_cprop")
		net.WriteEntity(self)
		net.WriteString(model)
		net.WriteString(material)
		net.WriteFloat(scale)
		net.WriteFloat(scalespeed)
		net.WriteString(bonename)
		net.WriteFloat(duration)
		net.WriteVector(pos)
		net.WriteAngle(ang)	
		net.Broadcast()
	
	end
	
	function PLAYER:PlayerColorUpdate(col, plyCol) -- bool
		
		local col = col or self:GetColor()
		local plyCol = plyCol or self:GetPlayerColor()
		
		self:SetColor(col)
		self:SetPlayerColor(plyCol)
		
		net.Start("csb_ply_color")
		net.WriteColor(col, true)
		net.WriteVector(plyCol)
		net.Send(self)
	
	end
	
	function ENT:MarkOrderEff(ply, friend) -- bool
	
		if !IsValid(self) or !IsValid(ply) then return end
		
		net.Start("csb_order_eff")
		net.WriteEntity(self)
		net.WriteBool(friend)
		net.Send(ply)
	
	end
	
	function ENT:ClientSetIK(bool)
			
		net.Start("csb_npc_set_ik")
		net.WriteEntity(self)
		net.WriteBool(bool)
		net.Broadcast()
	
	end
	
	function ENT:CSBPrimaryIconColor(ply, pColor)
		
		local suitCT = self.SuitAbilityIconColorTab
		local pColor = pColor or suitCT.primary
		
		net.Start("csb_ability_primary_color")
		net.WriteEntity(self)
		net.WriteColor(pColor)
		net.Send(ply)
	
	end
	
	function ENT:CSBSecondaryIconColor(ply, sColor)
		
		local suitCT = self.SuitAbilityIconColorTab
		local sColor = sColor or suitCT.secondary
		
		net.Start("csb_ability_secondary_color")
		net.WriteEntity(self)
		net.WriteColor(sColor)
		net.Send(ply)
	
	end

	net.Receive("csb_toggle_crosshair", function(_, ply)

		local crosshairBool = net.ReadBool()

		if crosshairBool == true and ply.CrosshairEnabled != true then 
	
			ply:CrosshairEnable() 
			ply.CrosshairEnabled = true
		
		elseif crosshairBool == false and ply.CrosshairEnabled != false then 
	
			ply:CrosshairDisable() 
			ply.CrosshairEnabled = false
		
		end
	
	end)

	net.Receive("csb_send_server_sound", function(_, ply)

		local soundName = net.ReadString()
		local soundLevel = net.ReadFloat()
		local pitchPercent = net.ReadFloat()
		local volume = net.ReadFloat()
		local channel = net.ReadString()
		local soundFlags = net.ReadFloat()
		local dsp = net.ReadFloat()
		local ent = net.ReadEntity()

		ent:EmitSound(soundName, soundLevel, pitchPercent, volume, channel, soundFlags, dsp)
	
	end)

	function ENT:SendClientSound(ply,soundName,soundLevel,pitchPercent,volume,channel,soundFlags,dsp) -- Be serious...

		if soundName == nil then return end
		soundLevel = soundLevel or 75
		pitchPercent = pitchPercent or 100
		volume = volume or 1
		channel = channel or CHAN_AUTO
		soundFlags = soundFlags or 0
		dsp = dsp or 0
	
		--for k,ply in pairs ( player.GetAll() ) do	
		net.Start("csb_send_client_sound")
		net.WriteString(soundName)
		net.WriteFloat(soundLevel)
		net.WriteFloat(pitchPercent)
		net.WriteFloat(volume)
		net.WriteString(channel)
		net.WriteFloat(soundFlags)
		net.WriteFloat(dsp)
		net.WriteEntity(self)
		net.Send(ply)
		--end
	end

	function ENT:OrderValidNPC()

		if (bit.band(self:CapabilitiesGet(), CAP_MOVE_FLY) == CAP_MOVE_FLY or bit.band(self:CapabilitiesGet(), CAP_MOVE_GROUND) == CAP_MOVE_GROUND) then

			return true
	
		else
	
			return false
	
		end

	end

	function ENT:CSB_NPCAlert(ply, enemy, msg) -- called by suit itself

	if (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() then return end
		
		--for _, enemy in pairs( ents.FindInSphere(self:GetPos(), 5000) ) do

			if IsValid(enemy) and (enemy:IsNPC() or enemy:IsPlayer()) and ply:CSBVisibleInFOV(enemy) and self:Disposition(enemy) != D_LI and !IsValid(self:GetEnemy()) and self != enemy and !self:IsNPCScripting() then

				--self:CSB_NPCFollowStop()
		
				--self:SetNW2Bool("CSB_NPCPatroller", false)
			
				if self.IsVJBaseSNPC == true then
				
					self:VJ_DoSetEnemy(enemy, false, false)
					
				end
			
				self:SetEnemy(enemy)
				self:UpdateEnemyMemory(enemy, enemy:GetPos())
		
				--self:SetSaveValue( "m_vecLastPosition", enemy:GetPos())
			
				timer.Simple(0.1, function()
			
					if !IsValid(self) or IsValid(self:GetNPCVehicle()) then return end
			
					self:SetSchedule(SCHED_ESTABLISH_LINE_OF_FIRE)
			
				end)
				
				if IsValid(ply) then
					ply:CSB_MessageToPlayer(self:CSBGetName(), msg) 				
					enemy:MarkOrderEff(ply, false)
				end
					
			end
	
		--end
	
		if IsValid(ply) then self:MarkOrderEff(ply, true) end
	
	end

	function ENT:CSB_NPCRushEnemy(ply, msg)
	
	if !IsValid(self) then return end
	if self:IsNPCScripting() or (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() then return end
	
		if IsValid(self:GetEnemy()) then
		
			self:CSB_NPCFollowStop()
		
			self:SetNW2Bool("CSB_NPCPatroller", false)
			
			self:ClearGoal()
			
			timer.Simple(0.1, function()
			
			if !IsValid(self) or IsValid(self:GetNPCVehicle()) then return end
			
				self:SetSaveValue( "m_vecLastPosition", self:GetEnemy():GetPos())
				self:SetSchedule(SCHED_FORCED_GO_RUN)
				
			end)
	
			if IsValid(ply) then
				ply:CSB_MessageToPlayer(self:CSBGetName(), msg) 
				self:MarkOrderEff(ply, true)
			end
		
		end
	
	end
	
	function ENT:CSBCapabilitiesHas(cap) 
	
		if bit.band( self:CapabilitiesGet(), cap ) == cap then
		
			return true
			
		else
		
			return false
			
		end
	
	end
	
	function ENT:CSB_NPCGoToPos(pos, ply, msg)
	
		if !IsValid(self) then return end
		if self:IsNPCScripting() or (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() then return end

		if !pos or pos == nil then return end
			
		self:CSB_NPCFollowStop()
		
		self:SetNW2Bool("CSB_NPCPatroller", false)
		
		self:ClearGoal()
		
		timer.Simple(0.1, function()
			
		if !IsValid(self) or IsValid(self:GetNPCVehicle()) then return end
		
			self:SetSaveValue( "m_vecLastPosition", pos)
			self:SetSchedule(SCHED_FORCED_GO_RUN)
		
		end)
	
		local selfname = self:GetClass()
	
		if IsValid(ply) then
			ply:CSB_MessageToPlayer(self:CSBGetName(), msg) 		
			self:MarkOrderEff(ply, true)
		end
	
	end

	function ENT:CSB_NPCStop(ply, msg)
	
	if !IsValid(self) then return end
	if self:IsNPCScripting() or (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() then return end
	
		self:CSB_NPCFollowStop()
	
		self:SetNW2Bool("CSB_NPCPatroller", false)
		
		self:ClearGoal()
		
		timer.Simple(0.1, function()
			
		if !IsValid(self) or IsValid(self:GetNPCVehicle()) then return end
		
			self:StopMoving()
			
		end)
	
		if IsValid(ply) then
			ply:CSB_MessageToPlayer(self:CSBGetName(), msg) 
			self:MarkOrderEff(ply, true)
		end
	
	end

	function ENT:CSB_NPCTakeCover(ply, msg)

	if !IsValid(self) then return end
	if self:IsNPCScripting() or (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() then return end
			
		self:CSB_NPCFollowStop()
	
		self:SetNW2Bool("CSB_NPCPatroller", false)
		
		self:ClearGoal()
		
		timer.Simple(0.1, function()
			
		if !IsValid(self) or IsValid(self:GetNPCVehicle()) then return end
		
			self:SetSchedule(SCHED_TAKE_COVER_FROM_ENEMY)
		
		end)
	
		if IsValid(ply) then
			ply:CSB_MessageToPlayer(self:CSBGetName(), msg)
			self:MarkOrderEff(ply, true)
		end
	
	end

	function ENT:CSB_NPCPatrol(ply, msg, ignoreAI)
	
		if !IsValid(self) or IsValid(self:GetEnemy()) then return end
		
		if self:IsNPCScripting() or ((GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) and !ignoreAI) or !self:OrderValidNPC() then return end
	
		if self:GetNW2Bool("CSB_NPCPatroller") == true then return end
			
		self:CSB_NPCFollowStop()

		self:SetNW2Bool("CSB_NPCPatroller", true)
		
		self:ClearGoal()
		
		if IsValid(ply) then
			ply:CSB_MessageToPlayer(self:CSBGetName(), msg)
			self:MarkOrderEff(ply, true)
		end
	
		local timerName = "CSB_NPCPatrolBeh" .. self:EntIndex()
	
		timer.Create(timerName, 1, 0, function()
	
			if !IsValid(self) or !IsValid(self) or self:GetNW2Bool("CSB_NPCFollower") == true or self:GetNW2Bool("CSB_NPCPatroller") != true then
		
				timer.Remove(timerName)
			
				if IsValid(self) then self:SetNW2Bool("CSB_NPCPatroller", false) end
		
				return 
		
			end
		
			self.patrolLast = self.patrolLast or 0
			self.patrolDelay = math.random(3,20)
		
			if CurTime() - self.patrolLast >= self.patrolDelay and self:GetCurrentSchedule() != SCHED_PATROL_WALK and !IsValid(self:GetEnemy()) then
			
				self:SetSchedule(SCHED_PATROL_WALK)
			
				self.patrolLast = CurTime()
			
			end
		
		end)
	
	end

	function ENT:SafeToTeleport()
	
		local selfcbA, selfcbB = self:GetCollisionBounds()
	
		local tr = util.TraceHull{
		start = self:GetPos(),
		endpos = self:GetPos(),
		filter = {self},
		mins = Vector(selfcbA.x*3, selfcbA.y*3, selfcbA.z+5),
		maxs = Vector(selfcbB.x*3, selfcbB.y*3, selfcbB.z)
		}
	
		if tr.Hit or !self:IsOnGround() then 
	
			return false
		
		else
	
			return true 
	
		end
	
	end

	function ENT:SafeToStand()

		local tr = util.TraceHull{
		start = self:GetPos(),
		endpos = self:GetPos(),
		filter = {self},
		mins = self.CollisionBoundsA,
		maxs = self.CollisionBoundsB
		}
	
		if tr.Hit then 
	
			return false
	
		else
	
			return true 
	
		end
	
	end

	function ENT:SafeToExitVehicle(npc)

		local selfcbA, selfcbB = self:GetCollisionBounds()
		local npccbA, npccbB = npc:GetCollisionBounds()
		local extraspace = Vector(0,0,30)
	
		local trHitBox = util.TraceHull{
		start = self:GetPos(),
		endpos = self:GetPos(),
		filter = {self, npc},
		mins = selfcbA,
		maxs = selfcbB
		}
	
		if IsValid(trHitBox.Entity) then
	
			local ent = trHitBox.Entity
			local entcbA, entcbB = ent:GetCollisionBounds()
	
			local trForward = util.TraceHull{
			start = ((ent:GetPos() + entcbA) + ent:GetForward() * (entcbB.x + npccbB.x)) + extraspace,
			endpos = ((ent:GetPos() + entcbB) + ent:GetForward() * (entcbB.x + npccbB.x)) + extraspace,
			filter = {ent, npc, self},
			mins = npccbA,
			maxs = npccbB
			}
	
			local trBackward = util.TraceHull{
			start = ((ent:GetPos() + entcbA) + ent:GetForward() * - (entcbB.x + npccbB.x)) + extraspace,
			endpos = ((ent:GetPos() + entcbB) + ent:GetForward() * - (entcbB.x + npccbB.x)) + extraspace,
			filter = {ent, npc, self},
			mins = npccbA,
			maxs = npccbB
			}
	
			local trRight = util.TraceHull{
			start = ((ent:GetPos() + entcbA) + ent:GetRight() * (entcbB.y + npccbB.y)) + extraspace,
			endpos = ((ent:GetPos() + entcbB) + ent:GetRight() * (entcbB.y + npccbB.y)) + extraspace,
			filter = {ent, npc, self},
			mins = npccbA,
			maxs = npccbB
			}
	
			local trLeft = util.TraceHull{
			start = ((ent:GetPos() + entcbA) + ent:GetRight() * - (entcbB.y + npccbB.y)) + extraspace,
			endpos = ((ent:GetPos() + entcbB) + ent:GetRight() * - (entcbB.y + npccbB.y)) + extraspace,
			filter = {ent, npc, self},
			mins = npccbA,
			maxs = npccbB
			}
	
			if !trLeft.Hit then

				return ent:GetRight()*-(entcbB.y + npccbB.y)+extraspace
		
			elseif !trRight.Hit then

				return ent:GetRight()*(entcbB.y + npccbB.y)+extraspace
	
			elseif !trBackward.Hit then

				return ent:GetForward()*-(entcbB.x + npccbB.x)+extraspace
		
			elseif !trForward.Hit then

				return ent:GetForward()*(entcbB.x + npccbB.x)+extraspace
	
			elseif trForward.Hit and trBackward.Hit and trRight.Hit and trLeft.Hit then

				return Vector(0,0,0) -- gotta go somewhere :<
	
			end
	
		else
	
			local trForward = util.TraceHull{
			start = ((self:GetPos() + selfcbA) + self:GetForward() * (selfcbB.x + npccbB.x)) + extraspace,
			endpos = ((self:GetPos() + selfcbB) + self:GetForward() * (selfcbB.x + npccbB.x)) + extraspace,
			filter = {self, npc, trHitBox.Entity},
			mins = npccbA,
			maxs = npccbB
			}
	
			local trBackward = util.TraceHull{
			start = ((self:GetPos() + selfcbA) + self:GetForward() * - (selfcbB.x + npccbB.x)) + extraspace,
			endpos = ((self:GetPos() + selfcbB) + self:GetForward() * - (selfcbB.x + npccbB.x)) + extraspace,
			filter = {self, npc, trHitBox.Entity},
			mins = npccbA,
			maxs = npccbB
			}
	
			local trRight = util.TraceHull{
			start = ((self:GetPos() + selfcbA) + self:GetRight() * (selfcbB.y + npccbB.y)) + extraspace,
			endpos = ((self:GetPos() + selfcbB) + self:GetRight() * (selfcbB.y + npccbB.y)) + extraspace,
			filter = {self, npc, trHitBox.Entity},
			mins = npccbA,
			maxs = npccbB
			}
	
			local trLeft = util.TraceHull{
			start = ((self:GetPos() + selfcbA) + self:GetRight() * - (selfcbB.y + npccbB.y)) + extraspace,
			endpos = ((self:GetPos() + selfcbB) + self:GetRight() * - (selfcbB.y + npccbB.y)) + extraspace,
			filter = {self, npc, trHitBox.Entity},
			mins = npccbA,
			maxs = npccbB
			}

			if !trLeft.Hit then
	
				return self:GetRight()*-(selfcbB.y + npccbB.y)+extraspace
		
			elseif !trRight.Hit then

				return self:GetRight()*(selfcbB.y + npccbB.y)+extraspace
	
			elseif !trBackward.Hit then

				return self:GetForward()*-(selfcbB.x + npccbB.x)+extraspace
		
			elseif !trForward.Hit then

				return self:GetForward()*(selfcbB.x + npccbB.x)+extraspace
	
			elseif trForward.Hit and trBackward.Hit and trRight.Hit and trLeft.Hit then

				return Vector(0,0,0) -- gotta go somewhere :<
	
			end
	
		end
	
	end

	function ENT:CSB_NPCFollowStop()

		if self:GetNW2Bool("CSB_SpawnedNPC") != true and self:GetNW2Bool("CSB_SpawnedEQ") != true then
	
			if IsValid(self:GetNPCVehicle()) then self:NPCExitVehicle() end 
	
			self:SetNW2Bool("CSB_NPCFollower", false)
	
		end
	
	end

	function PLAYER:CSB_MessageToPlayer(senderName, msg, r, g, b)

		if IsValid(self) and self:IsPlayer() and self:GetInfoNum("csb_allow_follower_chat", 1) > 0 then
			
			if self:IsCSBUser() then

				local suit = self:GetCSBSuit()
				local color = suit.CSB_AllyMarkers.allymarkcolor
					
				net.Start("CSB.Message")
				net.WriteColor(color, false)
				net.WriteString(" " .. senderName .. ": ")
				net.WriteString(msg)
				net.WriteString("CSBPlySound.RadioOff")
				net.Send(self)
					
			else
			
				r = r or 255
				g = g or 255
				b = b or 255
			
				local color = Color(r,g,b,255)
			
				net.Start("CSB.Message") 
				net.WriteColor(color, false)
				net.WriteString(" " .. senderName .. ": ")
				net.WriteString(msg)
				net.WriteString("CSBPlySound.RadioOff")
				net.Send(self)
					
			end

		end
	
	end

CSBCrouchAnimLOL = {
		
	['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 5, -40, 0 ) },
    ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -5, -40, 0 ) },
		
	['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 60, 0 ) },
    ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 60, 0 ) },
		
	['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 0, 0 ) },
    ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 0, 0 ) },
	
    ['ValveBiped.Bip01_Spine'] = { ang = Angle( 0, 20, 0 ) },
		
	['ValveBiped.Bip01_Pelvis'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 0, -15 ) }

}

	function ENT:CSB_NPCGiveWayToPlayer()
	
		if !IsValid(self) or (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() or self:IsNPCScripting() or IsValid(self:GetNPCVehicle()) then return end
	
		local selfcbA, selfcbB = self:GetCollisionBounds()
	
		local tr = util.TraceHull{
		start = self:GetPos(),
		endpos = self:GetPos(),
		filter = {self, self:GetActiveWeapon()},
		mins = Vector(selfcbA.x,selfcbA.y,selfcbA.z)*1.05,
		maxs = Vector(selfcbB.x,selfcbB.y,selfcbB.z)*1.05
		}
	
		local ent = tr.Entity
	
		if tr.Hit and IsValid(ent) and ent:IsPlayer() and self:Disposition(ent) == D_LI and self:GetCurrentSchedule() != SCHED_MOVE_AWAY then 

			self:SetSchedule(SCHED_MOVE_AWAY)
	
		end
	
	end
	
	function ENT:CSB_NPCIdealFollowerCaps(bool)
		
		if bool then
		
			if self:CSBCapabilitiesHas(CAP_MOVE_JUMP) then self.HadCapJump = true end
			self:CapabilitiesAdd(CAP_MOVE_JUMP)
	
			if self:CSBCapabilitiesHas(CAP_MOVE_CLIMB) then self.HadCapClimb = true end
			self:CapabilitiesAdd(CAP_MOVE_CLIMB)
	
			if self:CSBCapabilitiesHas(CAP_USE) then self.HadCapUse = true end
			self:CapabilitiesAdd(CAP_USE)
	
			if self:CSBCapabilitiesHas(CAP_AUTO_DOORS) then self.HadCapAutoDoors = true end
			self:CapabilitiesAdd(CAP_AUTO_DOORS)
	
			if self:CSBCapabilitiesHas(CAP_OPEN_DOORS) then self.HadCapOpenDoors = true end
			self:CapabilitiesAdd(CAP_OPEN_DOORS)
	
			if self:CSBCapabilitiesHas(CAP_FRIENDLY_DMG_IMMUNE) then self.HadCapFDMGImmune = true end
			self:CapabilitiesAdd(CAP_FRIENDLY_DMG_IMMUNE)
	
			if self:CSBCapabilitiesHas(CAP_DUCK) then self.HadCapDuck = true end
			self:CapabilitiesAdd(CAP_DUCK)
	
			if self:CSBCapabilitiesHas(CAP_SQUAD) then self.HadCapSquad = true end
			self:CapabilitiesAdd(CAP_SQUAD)
		
		else
		
			if self.HadCapJump != true then self:CapabilitiesRemove(CAP_MOVE_JUMP) end	
			if self.HadCapClimb != true then self:CapabilitiesRemove(CAP_MOVE_CLIMB) end	
			if self.HadCapUse != true then self:CapabilitiesRemove(CAP_USE) end
			if self.HadAutoDoors != true then self:CapabilitiesRemove(CAP_AUTO_DOORS) end	
			if self.HadOpenDoors != true then self:CapabilitiesRemove(CAP_OPEN_DOORS) end	
			if self.HadCapFDMGImmune != true then self:CapabilitiesRemove(CAP_FRIENDLY_DMG_IMMUNE) end	
			if self.HadCapDuck != true then self:CapabilitiesRemove(CAP_DUCK) end	
			if self.HadCapSquad != true then self:CapabilitiesRemove(CAP_SQUAD) end
		
		end
		
	end
	
	function ENT:CSB_NPCFollowPlayer(ply, closeFollDist, farFollDist, closeFollDistE, farFollDistE, msg)
	
		if !IsValid(self) or (GetConVar("ai_disabled"):GetBool() or GetConVar("ai_ignoreplayers"):GetBool()) or !self:OrderValidNPC() then return end

		if self:IsNPCScripting() or IsValid(self:GetNPCVehicle()) then return end
	
		if self:GetNW2Bool("CSB_NPCFollower") == true then return end
	
		self:SetNW2Bool("CSB_NPCPatroller", false)
	
		local sizeMins, sizeMaxs = self:GetModelBounds()
	
		closeFollDist = closeFollDist or 100
		closeFollDistE = closeFollDistE or 200
		farFollDist = farFollDist or 200
		closeFollDistE = closeFollDistE or 300
	
		local gdistTrStart = self:GetPos() + sizeMaxs
	
		local gdistTr = util.TraceHull( {
		start = gdistTrStart,
		endpos = gdistTrStart - Vector(0,0,99999),
		mins = mins,
		maxs = maxs,
		filter = self
		})
				
		local gdistTrDist = (self:GetPos() - gdistTr.HitPos):Length()
	
		closeFollDist = closeFollDist + gdistTrDist
		closeFollDistE = closeFollDistE + gdistTrDist
		farFollDist = farFollDist + gdistTrDist
		closeFollDistE = closeFollDistE + gdistTrDist

		self:MarkOrderEff(ply, true)
		
		self:CSB_NPCIdealFollowerCaps(true)
	
		local timerName = "CSB_NPCFollowBeh" .. self:EntIndex()
	
		if self:GetNW2Bool("CSB_NPCFollower") != true and self:GetNW2Bool("CSB_SpawnedNPC") != true then
			
			local msg = msg or ""
			
			ply:CSB_MessageToPlayer(self:CSBGetName(), msg)
			
			local selfName = self:CSBGetName()
		
		end
		
		self:SetNW2Bool("CSB_NPCFollower", true)
	
		if !GetConVar("csb_allow_follower_collisions"):GetBool() then self:SetOwner(ply) end
	
		if IsValid(ply) and IsValid(ply:GetCSBSuit()) then ply:GetCSBSuit():CSBOnNPCStartFollow(self) end
	
		timer.Create(timerName, 0.1, 0, function()
	
			if !IsValid(self) or !IsValid(ply) or (IsValid(ply) and (self:Disposition(ply) != D_LI or !ply:IsCSBUser())) or self:GetNW2Bool("CSB_NPCPatroller") == true or self:GetNW2Bool("CSB_NPCFollower") != true then
			
				timer.Remove(timerName)
			
				if IsValid(ply) and ply:IsPlayer() and selfName != nil then
			
					ply:CSB_MessageToPlayer(selfName, "left squad...")

				end
			
				if IsValid(self) then

					self:SetNW2Bool("CSB_NPCFollower", false)
					self:CSB_NPCIdealFollowerCaps(false)
					if IsValid(ply) and IsValid(ply:GetCSBSuit()) then ply:GetCSBSuit():CSBOnNPCStopFollow(self) end
				
					if self:GetNW2Bool("CSB_SpawnedNPC") != true and self:GetNW2Bool("CSB_SpawnedEQ") != true then self:SetOwner(nil) end
					
					if self.crouching == true then self:CSBResetBone() end
					timer.Remove(timerName)
				
				end
		
				ply = NULL
			
				return 
		
			end
		
			local aidisabled = GetConVar("ai_disabled"):GetBool()
			local aiignore = GetConVar("ai_ignoreplayers"):GetBool()
	
			local distance = ply:GetPos():Distance(self:GetPos())

			--if self.followRandPos == nil then self.followRandPos = Vector(math.random(-80,80),math.random(-80,80),0) end
			self.followRandPos = self.followRandPos or Vector(0,0,0)
		
		
			if !IsValid(self:GetEnemy()) and !IsValid(self:GetNPCVehicle()) and (!aidisabled and !aiignore) then
		
				if distance > closeFollDist then self:NavSetGoalTarget( ply, self.followRandPos ) end
		
				if distance < closeFollDist and (self:GetCurrentSchedule() == SCHED_FORCED_GO or self:GetCurrentSchedule() == SCHED_FORCED_GO_RUN) then
	
					self:ClearSchedule()
					self:ClearGoal()
					self:StopMoving()
					self:SetSaveValue( "m_vecLastPosition", Vector(0,0,0))
				
				elseif distance >= closeFollDist and distance < farFollDist and self:GetCurrentSchedule() != SCHED_FORCED_GO then
		
					self:SetSchedule(SCHED_FORCED_GO)
					self:SetSaveValue( "m_vecLastPosition", ply:GetPos() + self.followRandPos )
				
		
				elseif distance >= farFollDist and self:GetCurrentSchedule() != SCHED_FORCED_GO_RUN then
			
					self:SetSchedule(SCHED_FORCED_GO_RUN)
					self:SetSaveValue( "m_vecLastPosition", ply:GetPos() + self.followRandPos )
	
				end
					
			elseif IsValid(self:GetEnemy()) and !IsValid(self:GetNPCVehicle()) and (!aidisabled and !aiignore) then
			
				if distance < closeFollDistE and (self:GetCurrentSchedule() == SCHED_FORCED_GO or self:GetCurrentSchedule() == SCHED_FORCED_GO_RUN) then
	
					self:ClearSchedule()
					self:ClearGoal()
					self:StopMoving()
					self:SetSaveValue( "m_vecLastPosition", Vector(0,0,0))
	
				elseif distance >= closeFollDistE and distance < farFollDistE and self:GetCurrentSchedule() != SCHED_FORCED_GO then
		
					self:SetSchedule(SCHED_FORCED_GO)
					self:SetSaveValue( "m_vecLastPosition", ply:GetPos() + self.followRandPos)
		
				elseif distance >= farFollDistE and self:GetCurrentSchedule() != SCHED_FORCED_GO_RUN then
	
					self:SetSchedule(SCHED_FORCED_GO_RUN)
					self:SetSaveValue( "m_vecLastPosition", ply:GetPos() + self.followRandPos )
	
				end
			
			end	
			--self:GetGroundSpeedVelocity():Length() <= 0
		
		
			local cbA, cbB = self:GetCollisionBounds()
			self.CollisionBoundsA = self.CollisionBoundsA or cbA
			self.CollisionBoundsB = self.CollisionBoundsB or cbB
			
		
			if (ply:Crouching() and self.crouching != true and !IsValid(self:GetEnemy())) and self:GetInternalVariable( "m_bIsCrouching") != true and !IsValid(self:GetNPCVehicle()) and GetConVar("csb_allow_follower_crouch"):GetBool() and !aidisabled and !aiignore then
		
				self.crouching = true
				self:CSBEditBone(CSBCrouchAnimLOL)
		
				local hull = self:GetHullType()
				self:SetSolid(SOLID_BBOX)
				self:SetPos(self:GetPos()+self:GetUp()*6)
				self:SetHullType(hull)
				self:SetHullSizeNormal()
				self:SetCollisionBounds(self.CollisionBoundsA,Vector(self.CollisionBoundsB.x,self.CollisionBoundsB.y,self.CollisionBoundsB.z*0.4))
				self:DropToFloor()
			
				if self:GetMovementActivity() != ACT_WALK then
					self:SetMovementActivity( ACT_WALK )
				end
			
			elseif (!ply:Crouching() and self.crouching == true and self:SafeToStand()) or self:GetInternalVariable( "m_bIsCrouching") == true and !IsValid(self:GetNPCVehicle()) then

				self.crouching = false
				self:CSBResetBone()
			
				local hull = self:GetHullType()
				self:SetSolid(SOLID_BBOX)
				self:SetPos(self:GetPos()+self:GetUp()*6)
				self:SetHullType(hull)
				self:SetHullSizeNormal()
				self:SetCollisionBounds(self.CollisionBoundsA,self.CollisionBoundsB) 
				self:DropToFloor()

			end
		
			if self:GetMovementActivity() != ACT_WALK_CROUCH and (self:GetInternalVariable( "m_bIsCrouching") == true and self.crouching != true) and !IsValid(self:GetNPCVehicle()) and GetConVar("csb_allow_follower_crouch"):GetBool() and !aidisabled and !aiignore then
				self:SetMovementActivity( ACT_WALK_CROUCH )
			end 
		
			if (ply:InVehicle()) and !IsValid(self:GetNPCVehicle()) and !aidisabled then
			
				for _, veh in pairs( ents.FindInSphere(self:GetPos(), GetConVar("csb_follower_enter_radius"):GetInt()) ) do
			
					if veh:IsVehicle() then
				
						self:NPCEnterVehicle(veh)
					
					end
				
				end
			
				if !self:GetActivity() != -1 and IsValid(self:GetNPCVehicle()) then self:SetActivity(-1) end
			
			elseif (!ply:InVehicle()) and IsValid(self:GetNPCVehicle()) then
			
				self:NPCExitVehicle()
			
			end
		
			if (self:HasCondition(35) or !self:HasCondition(49)) and ply:SafeToTeleport() and self:SafeToStand() and !IsValid(self:GetNPCVehicle()) and !ply:Visible(self) and !self:Visible(ply) and GetConVar("csb_allow_follower_teleport"):GetBool() and !aidisabled and !aiignore then
				--self:SetPos(ply:GetPos()*1.5 + Vector(math.random(-50,50,0)))
				self:SetPos(ply:GetPos()+ply:GetForward()*-40+ply:GetUp()*6)
			end
		
		end)
	
	end

	function ENT:CBS_Restore()

		timer.Simple(0.2, function()
	
			if IsValid(self) and self:GetNW2String("CSB_CurrentSuitModel") and GetConVar("csb_keep_suit_on_death"):GetBool() then
			
				self:Give(self:GetNW2String("CSB_CurrentSuitModel"))
			
			end
		
		end)
	
	end

	function PLAYER:CSBHideWeapons()

		if !self:GetActiveWeapon() then return end

		local realWep = self:GetActiveWeapon()

		if IsValid(realWep) and realWep:GetModel() ~= "" and self:GetCSBSuit().HideWeapons == true and not realWep:GetNoDraw() then
	
			realWep:SetNoDraw(true)
			
		end
	
	end

end

if (CLIENT) then
	
	net.Receive("csb_create_cprop", function()

		self = net.ReadEntity()
		model = net.ReadString()
		material = net.ReadString()
		scale = net.ReadFloat()
		scalespeed = net.ReadFloat()
		bonename = net.ReadString()
		duration = net.ReadFloat()
		pos = net.ReadVector()
		ang = net.ReadAngle()
	
		if !IsValid(self) or model == nil then return end
		if IsValid(self:GetNW2Entity("CSB_FakeProp")) then return end
	
		local fakeprop = ClientsideModel( model )

		local offsetPos = pos
		local offsetAng = ang

		local boneid = self:LookupBone(bonename)
	
		if !boneid then return end
		
		fakeprop:SetSolid( SOLID_NONE )
		fakeprop:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)	
		
		if material != nil then	fakeprop:SetMaterial(material) end
	
		fakeprop:SetModelScale(scale, scalespeed)
		fakeprop:SetOwner(self)
		fakeprop:Spawn()
		fakeprop:Activate()
		
		local matrix = self:GetBoneMatrix(boneid)
				
		if !matrix then return end
				
		local newPos, newAng = LocalToWorld(offsetPos, offsetAng, matrix:GetTranslation(), matrix:GetAngles())
				
		fakeprop:SetPos(newPos)
		fakeprop:SetAngles(newAng)
		fakeprop:SetupBones()
		
		SafeRemoveEntityDelayed(fakeprop, duration)
		
		timer.Create("CSBFakePropPosThink"..fakeprop:EntIndex(), 0, 0, function()
		
			if IsValid(fakeprop) and IsValid(self) and self:Alive() then
			
				local matrix = self:GetBoneMatrix(boneid)
				
				if !matrix then return end
				
				local newPos, newAng = LocalToWorld(offsetPos, offsetAng, matrix:GetTranslation(), matrix:GetAngles())
				
				fakeprop:SetPos(newPos)
				fakeprop:SetAngles(newAng)
				fakeprop:SetupBones()
			
			else
				
				if IsValid(fakeprop) then
					fakeprop:Remove()
					timer.Remove("CSBFakePropPosThink"..fakeprop:EntIndex())
				end
	
			end
		
		end)

	end)
	
	function PLAYER:AllowThirdPerson()
	
		if !self:IsValid() or !self:Alive() or self:InVehicle() or self:GetViewEntity() != self or self:IsAiming() or (self:IsCSBUser() and self:IsCSBHoldingTool()) then
		
			return true
			
		else
		
			return false
			
		end
	
	end
	
	function PLAYER:FirstPersonAnims()

		if self:GetNW2Bool("CSB_AnimInTP") != true and self:GetNW2Bool("CSB_Thirdperson_Enabled") != true then
		--if self:GetNW2Bool("CSB_AnimInTP") != true and self:GetNW2Bool("CSB_Loop") != false and self:GetNW2Bool("CSB_Thirdperson_Enabled") != true then

			return true
		
		elseif (self:GetNW2Bool("CSB_AnimInTP") == true or self:GetNW2Bool("CSB_Thirdperson_Enabled") == true) and GetConVar("csb_enforce_firstperson_animations"):GetBool() then
		--elseif (self:GetNW2Bool("CSB_AnimInTP") == true or self:GetNW2Bool("CSB_Loop") == false or self:GetNW2Bool("CSB_Thirdperson_Enabled") == true) and GetConVar("csb_enforce_firstperson_animations"):GetBool() then

			return true
		
		elseif (self:GetNW2Bool("CSB_AnimInTP") == true or self:GetNW2Bool("CSB_Thirdperson_Enabled") == true) and !GetConVar("csb_enforce_firstperson_animations"):GetBool() then
		--elseif (self:GetNW2Bool("CSB_AnimInTP") == true or self:GetNW2Bool("CSB_Loop") == false or self:GetNW2Bool("CSB_Thirdperson_Enabled") == true) and !GetConVar("csb_enforce_firstperson_animations"):GetBool() then

			return false
		
		end

	end

	function PLAYER:CSBResetHeadAngle()

		if self.headAngleReset == true and self.headBoneToReset then

			local headBone = self:LookupBone(self.headBoneToReset)
		
			if headBone then
		
				self:ManipulateBoneAngles( headBone, Angle(0,0,0))
				self:ManipulateBonePosition( headBone, Vector(0,0,0))
				
				self:SetupBones()
			
			end
		
			self.headAngleReset = false
			self.headBoneToReset = nil
		
		end

	end
	
	net.Receive("csb_player_ragdoll", function()
		local ply = LocalPlayer()		
		timer.Simple(0.01, function()
			local rag = ply:GetRagdollEntity()
			ply:CSBMatchPlayerRagdoll(rag)
		end)
	end)
	
	net.Receive("csb_player_bgs_cl", function()
		local ply = LocalPlayer()		
		local tab = net.ReadTable()
		ply.CSBCurBGS = tab
	end)
	
	net.Receive("csb_player_sms_cl", function()
		local ply = LocalPlayer()		
		local tab = net.ReadTable()
		ply.CSBCurSMS = tab
	end)
	
	net.Receive("csb_player_col_cl", function()
		local ply = LocalPlayer()		
		local col = net.ReadColor()
		ply.CSBCurColor = col
	end)
	
	net.Receive("csb_getNforCLc", function()

		local ent = net.ReadEntity()
		local name = net.ReadString()

		ent.CLGetName = name

	end)
	
	net.Receive("csb_player_getnagles_fix", function()

		local ply = LocalPlayer()
		local angle = net.ReadAngle()
	
		--ply:SetNW2Angle("CSB_PlayerGetnAgles_fix",angle)
		ply.ClientAngles = angle

	end)

	net.Receive("csb_set_head_rotation", function()

		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local tab = net.ReadTable()
	
		ply:CSBResetHeadAngle()
		ent.PlyForceHeadRotation = tab

	end)

	net.Receive("csb_set_overlay", function()

		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local tab = net.ReadTable()
	
		ent.SuitOverlay = tab

	end)

	function ENT:SendServerSound(soundName,soundLevel,pitchPercent,volume,channel,soundFlags,dsp)

		if soundName == nil then return end
		soundLevel = soundLevel or 75
		pitchPercent = pitchPercent or 100
		volume = volume or 1
		channel = channel or CHAN_AUTO
		soundFlags = soundFlags or 0
		dsp = dsp or 0
	
		--for k,ply in pairs ( player.GetAll() ) do	
		net.Start("csb_send_server_sound")
		net.WriteString(soundName)
		net.WriteFloat(soundLevel)
		net.WriteFloat(pitchPercent)
		net.WriteFloat(volume)
		net.WriteString(channel)
		net.WriteFloat(soundFlags)
		net.WriteFloat(dsp)
		net.WriteEntity(self)
		net.SendToServer()
		--end
	end

	net.Receive("csb_send_client_sound", function()

		local ply = LocalPlayer()
		local soundName = net.ReadString()
		local soundLevel = net.ReadFloat()
		local pitchPercent = net.ReadFloat()
		local volume = net.ReadFloat()
		local channel = net.ReadString()
		local soundFlags = net.ReadFloat()
		local dsp = net.ReadFloat()
		local ent = net.ReadEntity()

		ent:EmitSound(soundName, soundLevel, pitchPercent, volume, channel, soundFlags, dsp)

	end)

	function PLAYER:CrosshairClientToggle(bool)

		net.Start("csb_toggle_crosshair")
		net.WriteBool(bool)
		net.SendToServer()

	end

	net.Receive("csb_npc_set_ik", function()

		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local bool = net.ReadBool()

		ent:SetIK(bool)

	end)
	
	net.Receive("csb_fix_bones", function()

		local ply = LocalPlayer()
		local ent = net.ReadEntity()

		if IsValid(ent) then
		ent:SetupBones() 
		ent:DestroyShadow()
		end
		
	end)
	
	net.Receive("csb_change_campos", function()

		local ply = LocalPlayer()
		local newX = net.ReadFloat()
		local newY = net.ReadFloat()
		local newZ = net.ReadFloat()
		local newC = net.ReadFloat()
		local reset = net.ReadBool()
		local suit = ply:GetCSBSuit()

		if IsValid(suit) and suit.TPCameraPOS and !reset then
		suit.TPCameraPOS = {bone = suit.TPCameraPOS.bone, x = newX, y = newY, z = newZ, crouch = newC} 
		elseif IsValid(suit) and suit.TPCameraPOS and reset then
		suit.TPCameraPOS = {bone = suit.TPCameraPOSDefault.bone, x = suit.TPCameraPOSDefault.x, y = suit.TPCameraPOSDefault.y, z = suit.TPCameraPOSDefault.z, crouch = suit.TPCameraPOSDefault.crouch} 
		end
		
	end)
	
	net.Receive("csb_ply_color", function()

		local ply = LocalPlayer()
		local col = net.ReadColor()
		local plyCol = net.ReadVector()
			
		if col then ply:SetColor(col) end
		if plyCol then ply:SetPlayerColor(plyCol) end
		
	end)
	
	net.Receive("csb_ability_primary_color", function()

		local ply = LocalPlayer()
		local suit = net.ReadEntity()
		local pColor = net.ReadColor()
		local suitCT = suit.SuitAbilityIconColorTab

		if IsValid(suit) and suitCT and pColor and pColor != suitCT.primary then
			suitCT.primary = pColor
		end
		
	end)
	
	net.Receive("csb_ability_secondary_color", function()

		local ply = LocalPlayer()
		local suit = net.ReadEntity()
		local sColor = net.ReadColor()
		local suitCT = suit.SuitAbilityIconColorTab
		
		if IsValid(suit) and suitCT and sColor and sColor != suitCT.secondary then
			suitCT.secondary = sColor
		end
		
	end)
	
	net.Receive("csb_update_name_HUD", function()

		local ply = LocalPlayer()
		local suit = net.ReadEntity()
		local tab = net.ReadTable()
		
		if IsValid(suit) and tab then
			suit.HUDTab = tab
		end
		
	end)
			
	net.Receive("csb_order_eff", function()

		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local friend = net.ReadBool()

		if IsValid(ent) and ent.effCoolDown != true then

			if friend then
			
				local eff = EffectData()
				eff:SetStart( ent:GetPos() )
				eff:SetOrigin( ent:GetPos() )
				eff:SetMagnitude(1)
				eff:SetEntity( ent )
				util.Effect( "phys_freeze", eff, true, true )
				ent.effCoolDown = true
			
			elseif !friend then

				local eff = EffectData()
				eff:SetStart( ent:GetPos() )
				eff:SetOrigin( ent:GetPos() )
				eff:SetMagnitude(1)
				eff:SetEntity( ent )
				util.Effect( "phys_unfreeze", eff, true, true )
				ent.effCoolDown = true

			end
		
			timer.Create("CSB_OrderEffCoolDown" .. ent:EntIndex(), 0.1, 1, function()
				
				if !IsValid(ent) then return end
				ent.effCoolDown = false
				
			end)
		
		end
		
	end)
	
	net.Receive("CSB.Message", function()

		local ply = LocalPlayer()
		local color = net.ReadColor()
		local senderName = net.ReadString()
		local messageText = net.ReadString()
		local sound = net.ReadString()

		ply.CSB_MessageCooldown = ply.CSB_MessageCooldown or 0
		
		if ply.CSB_MessageCooldown == 3 then senderName = "And More: " end
		
		if ply.CSB_MessageCooldown <= 3 then
		
			if sound != nil and ply.CSB_MessageCooldown == 0 and ply then
		
				EmitSound( sound, Vector(0 ,0 ,0 ), -2 )
			
			end
		
			ply.CSB_MessageCooldown = ply.CSB_MessageCooldown + 1
		
			chat.AddText(color, senderName, Color(255,255,255), messageText)
		
			timer.Create("CSB.MessageCooldownTimer", 0.01, 0, function()
		
				if !IsValid(ply) then return end
			
				ply.CSB_MessageCooldown = 0
			
			end)
	
		end
		
	end)

end