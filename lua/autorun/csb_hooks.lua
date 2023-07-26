
hook.Add( "PlayerButtonDown", "CSB_PlayerButtonDown", function( ply, button )

	if ( button == ply:GetInfoNum("csb_menu_primary_key", 17) ) then
	
		if ply:IsCSBUser() and !ply:Crouching() and GetConVar("csb_allow_abilities"):GetBool() then
		
			ply:GetCSBSuit():CSBPrimaryAbility()
			
		end
		
	end
	
	if ( button == ply:GetInfoNum("csb_menu_secondary_key", 12) ) then
	
		if ply:IsCSBUser() and !ply:Crouching() and GetConVar("csb_allow_abilities"):GetBool() then
		
			ply:GetCSBSuit():CSBSecondaryAbility()
			
		end
		
	end
	
	if ( button == ply:GetInfoNum("csb_menu_drop_key", 18) ) then
	
		if SERVER and ply:IsCSBUser() and IsValid(ply:GetWeapon("".. ply:GetNW2String("CSB_CurrentSuitModel") .."")) then
		
			ply:DropWeapon(ply:GetCSBSuit())
			
		end
		
	end
	
	if ( button == ply:GetInfoNum("csb_menu_strip_key", 19) ) then
	
		if SERVER and ply:IsCSBUser() and IsValid(ply:GetWeapon("".. ply:GetNW2String("CSB_CurrentSuitModel") .."")) then
		
			ply:StripWeapon("".. ply:GetNW2String("CSB_CurrentSuitModel") .."")
			
		end
		
	end
	
	if ( button == ply:GetInfoNum("csb_menu_melee_key", 34) ) then
	
		if ply:IsCSBUser() and !ply:Crouching() and #ply:GetCSBSuit().PlyMeleeTable.meleeanims > 0 then
			
			local plyMeleeTab = ply:GetCSBSuit().PlyMeleeTable
			local plyMeleeRand = math.Round(util.SharedRandom("CSB_RandomMelee" ,1 ,#plyMeleeTab.meleeanims))
			local plyMeleeDMG = plyMeleeTab.meleedmg
			local plyMeleeRange = plyMeleeTab.meleerang
			local plyMeleeAnim = plyMeleeTab.meleeanims[plyMeleeRand]
			local plyMeleeDelay = ply:GetAnimDuration(plyMeleeAnim)	
			local plyMeleeDMGTime = plyMeleeTab.dmgdelay[plyMeleeRand]
			local plyMeleeSnd = plyMeleeTab.meleesound

			local plyDKTab = ply:GetCSBSuit().DoorKickTable
			local plyDKRand = math.Round(util.SharedRandom("CSB_RandomDK" ,1 ,#plyDKTab.dkanims))
			local plyDKRange = plyDKTab.dkrang
			local plyDKAnim = plyDKTab.dkanims[plyDKRand]
			local plyDKDelay = ply:GetAnimDuration(plyDKAnim)		
			local plyDKTime = plyDKTab.dkopendelay[plyDKRand]
			local plyDKSnd = plyDKTab.dksound
			local plyDKVL = plyDKTab.dkvl
			local plyDKVLD = plyDKTab.dkvld
			
			ply:LagCompensation( true )
	
			local tr = util.TraceHull( {
			start = ply:EyePos(),
			endpos = ply:EyePos() + ply:GetAimVector() * plyDKRange,
			filter = {ply, ply:GetActiveWeapon()},
			ignoreworld = true,
			mins = Vector(-20,-20,-20),
			maxs = Vector(20,20,20),
			mask = MASK_SHOT_HULL
			} )
		
			ply:LagCompensation( false )
			
			if (!tr.Hit) or (tr.Hit and tr.Entity and !tr.Entity:IsDoor()) then
			
			ply:CSBMeleeAttack(plyMeleeAnim, plyMeleeDelay, plyMeleeRange, plyMeleeSnd, plyMeleeDMGTime, plyMeleeDMG, DMG_CLUB)
			
			elseif (tr.Hit and tr.Entity and tr.Entity:IsDoor() and !tr.Entity:IsDoorOpen() and !tr.Entity:IsDoorLocked()) and plyDKTab and plyDKTab and #plyDKTab.dkanims > 0 then
			
			ply:CSBKickDoor(plyDKAnim, plyDKDelay, plyDKRange, plyDKSnd, plyDKVL, plyDKVLD, plyDKTime)
			
			end
			
		end
		
	end
	
	if ( button == ply:GetInfoNum("csb_menu_grenade_key", 34) ) then
	
		if ply:IsCSBUser() and !ply:Crouching() and ply:IsOnGround() then
		
			if #ply:GetCSBSuit().PlyGrenadeTable.ganims > 0 then
			
				local plyGTab = ply:GetCSBSuit().PlyGrenadeTable
				local plyGRand = math.Round(util.SharedRandom("CSB_RandomGrenade" ,1 ,#plyGTab.ganims))
				local plyGAnim = plyGTab.ganims[plyGRand]
				local plyGEnt = plyGTab.gentity
				local plyGAmmo = plyGTab.gammo
				local plyGFuse = plyGTab.gfuse
				local plyGForce = plyGTab.gforce
				local plyGSRemove = plyGTab.gselfremove
				local plyGModel = plyGTab.gmodel
				local plyGMaterial = plyGTab.gmaterial
				local plyGBone = plyGTab.gbone
				local plyGPos = plyGTab.gpos
				local plyGAng = plyGTab.gang
				local plyGPPos = plyGTab.gppos
				local plyGPAng = plyGTab.gpang
				local plyGDelay = ply:GetAnimDuration(plyGAnim)		
				local plyGTDelay = plyGTab.gdelay[plyGRand]
				local plyGSnd = plyGTab.gsound
				local plyGSndD = plyGTab.gsounddelay
			
				ply:CSBGrenadeThrow(plyGAnim, plyGEnt, plyGAmmo, plyGFuse, plyGForce, plyGSRemove, plyGModel, plyGMaterial, plyGBone, plyGDelay, plyGSnd, plyGSndD, plyGTDelay, plyGPos, plyGAng, plyGPPos, plyGPAng)
				
				ply:SetNW2Bool("CSB_GrenadeKeyDown", true)
			
			end
			
		elseif ply:IsCSBUser() and ply:GetCSBSuit().PlyRappelTab and ply:GetCSBSuit().PlyRappelTab.rapattach and !ply:IsOnGround() and !ply.gEndPos and !ply:InVehicle() and !ply:IsNoClipping() and !ply:IsOnLadder() then
		
		--local suit = ply:GetCSBSuit()
			
			local rappelTab = ply:GetCSBSuit().PlyRappelTab
            local tr = ply:GetEyeTrace()

            if (tr.Fraction < 0.002) then
				
                ply.gEndPos = tr.HitPos
                ply.gSliding = true
				
                local effectdata = EffectData()
                effectdata:SetOrigin(ply.gEndPos)
                effectdata:SetAttachment(ply:LookupAttachment(rappelTab.rapattach))
                effectdata:SetEntity(ply)
                util.Effect("rappel_rope", effectdata, true, true)
				
            end
			
		end
		
	end
	
	if ( button == ply:GetInfoNum("csb_menu_am_key", 24) ) then
	
		if ply:IsCSBUser() then
			
			local suit = ply:GetCSBSuit()
			
			ply:LagCompensation( true )
			
			local trHitBox = ply:GetInfoNum("csb_menu_am_hitbox_size", 20)
		
			local tr = util.TraceLine({
			start = ply:GetShootPos(),
			endpos = ply:GetShootPos() + (ply:GetAimVector()*1e8) + Vector(0,0,10),
			filter = {ply, ply:GetActiveWeapon()},
			mask = MASK_SHOT
			})
			
			
			ply:LagCompensation( false )
			
			ply:SetNW2Entity("CSB_NPCOrderTargetF", NULL)
			ply:SetNW2Entity("CSB_NPCOrderTargetE", NULL)
			
			if tr.Hit and IsValid(tr.Entity) and (tr.Entity:IsNPC() or tr.Entity:IsPlayer()) then

				if (tr.Entity:IsNPC() and ply:IsNPCFriend(tr.Entity) and !IsNPCIgnored(tr.Entity)) then
				
					ply:SetNW2Entity("CSB_NPCOrderTargetF", tr.Entity)
					
				elseif (tr.Entity:IsNPC() and !ply:IsNPCFriend(tr.Entity) and !IsNPCIgnored(tr.Entity)) or (tr.Entity:IsPlayer() and !ply:IsPlayerFriend(tr.Entity)) then

					ply:SetNW2Entity("CSB_NPCOrderTargetE", tr.Entity)
					
				end
			
			elseif tr.Hit and (!IsValid(tr.Entity) or (IsValid(tr.Entity) and !tr.Entity:IsNPC() and !tr.Entity:IsPlayer())) then
			
				for _, target in pairs( ents.FindInSphere(tr.HitPos, trHitBox) ) do
				
					if IsValid(target) then
					
						if (target:IsNPC() and ply:IsNPCFriend(target) and !IsNPCIgnored(target)) then
				
							ply:SetNW2Entity("CSB_NPCOrderTargetF", target)
					
						elseif (target:IsNPC() and !ply:IsNPCFriend(target) and !IsNPCIgnored(target)) or (target:IsPlayer() and !ply:IsPlayerFriend(target)) then

							ply:SetNW2Entity("CSB_NPCOrderTargetE", target)
					
						end
						
					end
			
				end
				
				if !IsValid(ply:GetNW2Entity("CSB_NPCOrderTargetE")) then
				
					for _, target in pairs( ents.FindInSphere(ply:GetPos(), 5000) ) do
					
						if IsValid(target) and ply:CSBVisibleInFOV(target) then
						
							if (target:IsNPC() and !ply:IsNPCFriend(target) and !IsNPCIgnored(target)) or (target:IsPlayer() and !ply:IsPlayerFriend(target)) then

								ply:SetNW2Entity("CSB_NPCOrderTargetE", target)
					
							end
							
						end
			
					end
				
				end
			
			end

			if (SERVER) then
				
				net.Start("CSB_ActionMenu")
				net.Send(ply)
				
			end
			
		end
		
	end
	
end)

hook.Add( "PlayerButtonUp", "CSB_PlayerButtonUp", function( ply, button )

	if ( button == ply:GetInfoNum("csb_menu_grenade_key", 34) ) then
	
		if ply:IsCSBUser() then
		
			ply:SetNW2Bool("CSB_GrenadeKeyDown", false)
			
		end
		
	end
	
end)
--[[
hook.Add( "Think", "CSB_Think", function()

	for _,ply in pairs ( player.GetAll() ) do	

		if IsValid(ply) and ply:IsPlayer() and ply:CSBAlive() and ply:IsCSBUser() then
			


		end

	end

end)
]]--
CSBFootStepBlackList = { -- all of this because valve's lazy and wouldn't bother puting em all in to player/footsteps
	"player/footsteps",
	"physics/glass/glass_sheet_step",
	"physics/flesh/flesh_impact_hard1.wav",
	"physics/body/body_medium_impact_soft3.wav",
	"physics/flesh/flesh_impact_hard2.wav",
	"physics/body/body_medium_impact_soft4.wav",
	"physics/plaster/ceiling_tile_step",
	"physics/plaster/drywall_footstep",
	"physics/cardboard/cardboard_box_impact_soft",
	"physics/plastic/plastic_barrel_impact_soft",
	"physics/plastic/plastic_box_impact_soft",
	"physics/wood/wood_box_footstep",
	"physics/metal/metal_box_footstep"
}

hook.Add( "EntityEmitSound", "CSB_EntityEmitSound", function( data )
	local name = data.SoundName 
	local oname = data.OriginalSoundName
	local time = data.SoundTime
	local dsp = data.DSP 
	local level = data.SoundLevel
	local pitch = data.Pitch 
	local flags = data.Flags 
	local channel = data.Channel 
	local volume = data.Volume 
	local ent = data.Entity
	local pos = data.Pos

	
	if IsValid(ent) and ent:IsPlayer() and ent:IsCSBUser() and IsValid(ent:GetCSBSuit()) then
		
		if CLIENT and IsValid(ent:GetActiveWeapon()) and ent:GetActiveWeapon():GetActivity() == ACT_VM_RELOAD then

			--ent:DrawViewModel(true)
			--ent:GetActiveWeapon():SendServerSound(name)
			--ent:DrawViewModel(false)
			--print(name)
		
			--return false
		end
		
		
		
		if ent:GetInfoNum("csb_enable_custom_footsteps", 1) > 0 then
	
			local suit = ent:GetCSBSuit()
		
			if suit.PlyFootStepsTable and suit.PlyFootStepsTable.bothstep.ladder and string.find( string.lower( name ), "player/footsteps/ladder") and (channel == CHAN_BODY or channel == CHAN_AUTO) then
			
				local bfsTable = suit.PlyFootStepsTable.bothstep
				local fsTab = bfsTable.ladder
			
				if #fsTab > 0 then
				
					ent:EmitServerSound(fsTab[math.random(1,#fsTab)])
			
				end
			
				return false

			end
			
			for _,sound in pairs(CSBFootStepBlackList) do
			
				if string.find(string.lower(name), sound) and (channel == CHAN_BODY or channel == CHAN_AUTO) and ent:GetCSBSuit().PlyFootStepsTable.deffssound == false then
					
					return false
					
				end
				
			end
		
		end
	
	end
	
end)

hook.Add("PlayerFootstep","CSB_PlayerFootsteps", function(ply,pos,foot,snd,vol,filter)

	if ply:IsCSBUser() and ply:CSBAlive() and ply:GetInfoNum("csb_enable_custom_footsteps", 1) >= 1 then
	
	if ( game.SinglePlayer() && CLIENT ) then return end
	
	if ( !game.SinglePlayer() && SERVER ) then return end
	
	if ( ply:IsBot() ) then return end
		
	local suit = ply:GetCSBSuit()
		
		if suit.PlyFootStepsTable.deffssound == true then
		
			return true
			
		else
		
			return false
			
		end
		
	end
	
end)

--[[
function CSBMovement(ply, bool)
	if bool == true then
		ply:SetRunSpeed(1)
		ply:SetWalkSpeed(1)
		ply:SetSlowWalkSpeed(1)
		ply:SetJumpPower(1)
	else
		if ply:IsCSBUser() then
			ply:SetRunSpeed(ply:GetCSBSuit().RunSpeed)
			ply:SetWalkSpeed(ply:GetCSBSuit().WalkSpeed)
			ply:SetSlowWalkSpeed(ply:GetCSBSuit().WalkSpeedAlt)
			ply:SetJumpPower(ply:GetCSBSuit().JumpPower)
		else
			ply:SetRunSpeed(500)
			ply:SetWalkSpeed(250)
			ply:SetSlowWalkSpeed(100)
			ply:SetJumpPower(200)
		end
	end
end
]]--

local function sendAnim(ply, text) 

	if not string.find(text,",") then
	
		for i, ply in ipairs(player.GetAll()) do
		
			local animData = string.Split( text, "," )
			ply:ChatPrint("")--if there's no comma
			
		end
		
	else
	
		local animData = string.Split( text, "," )
		animData[1] = animData[1] or "cower"  
		animData[2] = animData[2] or true 
		animData[3] = animData[3] or nil
		--if animData[4] == nil then animData[4] = true end 
		--if animData[5] == nil then animData[5] = nil end 
		--if animData[6] == nil then animData[6] = nil end 
		--if animData[7] == nil then animData[7] = nil end 
		ply:SendCSBAnimation(nil, tostring(animData[1]), tobool(animData[2]), true, true, nil, nil, tostring(animData[3]))
		
	end

    return false
	
end

hook.Add( "PlayerSay", "CSB_PlayAnimationsViaChat", function( ply, text, team )

	if !ply:IsCSBUser() then return end
	
    text = string.Trim(text) -- No more phantom spaces --

    if string.StartWith(text, "/pa") then
	
        if text == "/pa info" then
		
				ply:ChatPrint("Check Your console for help.")
				print("-----------------------------------------------------")
				print("Usage:")
				print("/pa 1,2,3")
				print("1: Animation Name (string)")
				print("2: Disable Loop (true/false)")
				print("3: Sound (path to the file)")
				print("Example:")
				print("/pa cower,true,npc/antlion/attack_single1.wav")
				print("-----------------------------------------------------")
				print("Type /pa sstop to stop looping sounds")
				print("Type /pa alist for a full animation list for Your current model")
				print("-----------------------------------------------------")
				
            return ""
			
			elseif text == "/pa sstop" then
			
				ply:EmitSound("npc/combine_soldier/vo/_comma.wav", 5, 5, 1, CHAN_VOICE)
				ply:ChatPrint("Sound Stopped!")
			
			return ""
			
			elseif text == "/pa alist" then
			
				ply:ChatPrint("Check Your Console For The Full Animation List Of Your Model")
				print(ply:GetModel() .. " Animation List:")
				PrintTable(ply:GetSequenceList())
			
			return ""
			
        end -- Happens when there's no input --

        text = string.Replace(text, "/pa ","") -- Getting rid of the "/pa " --
		
        return sendAnim(ply, text)
		
    end
	
	if string.StartWith(text, "/sm") then
	
	    if text == "/sm" then
		
            ply:ChatPrint("Don't spam empty messages or at all.")
			
            return ""
			
        end -- Happens when there's no input --
		
	text = string.Replace(text, "/sm ","") -- Getting rid of the "/sm" --
	
		for _,v in pairs (player.GetAll()) do
	
			if v:IsPlayer() and IsValid(v:GetCSBSuit()) and table.HasValue(ply.VJ_NPC_Class, v.VJ_NPC_Class[#v.VJ_NPC_Class]) then
				
				local suit = v:GetCSBSuit()
				local color = suit.CSB_AllyMarkers.allymarkcolor

				--v:EmitSound( "CSBPlySound.RadioOn" )
				net.Start("CSB.Message")
				net.WriteColor(color, false)
				net.WriteString(" " .. ply:GetName() .. ": ")
				net.WriteString(text)
				net.WriteString("CSBPlySound.RadioOff")
				net.Send(v)
		
				return ""
		
			end
	
		end
	
	end
	
end)

hook.Add("EntityTakeDamage", "CSB_EntityTakeDamage", function(target, dmginfo) 
	local attacker = dmginfo:GetAttacker()
	local dmgt = dmginfo:GetDamageType()
	
	if IsValid(attacker) and (attacker:GetNW2Bool("CSB_SpawnedNPC") == true or attacker:GetNW2Bool("CSB_SpawnedEQ") == true) and attacker.CSBDamageMult != nil then
		
		dmginfo:ScaleDamage(attacker.CSBDamageMult)
		if IsValid(attacker:GetOwner()) then dmginfo:SetInflictor(attacker); dmginfo:SetAttacker(attacker:GetOwner()) end
		
	end
	
	if IsValid(target) and target:IsPlayer() and target:GetCSBSuit() and target:GetCSBSuit().AnimationStatesTab and target:GetCSBSuit().AnimationStatesTab.hurt then
	
		local animStateTab = target:GetCSBSuit().AnimationStatesTab
		target:CSBSetAnimationState(animStateTab.hurt[1],animStateTab.hurt[2],animStateTab.hurt[3])
		
	end
	
	if IsValid(target) and target:IsPlayer() and target:GetCSBSuit() and IsValid(attacker) and attacker:IsNPC() and attacker:Disposition(target) == D_LI and GetConVar("csb_npc_friendly_fire"):GetBool() then
	
		dmginfo:SetDamage(0)
		dmginfo:ScaleDamage(0)
		
	end
	
	if IsValid(attacker) and attacker:IsPlayer() and attacker:GetCSBSuit() and IsValid(target) and target:IsNPC() and target:Disposition(attacker) == D_LI and GetConVar("csb_npc_friendly_fire"):GetBool() then
	
		dmginfo:SetDamage(0)
		dmginfo:ScaleDamage(0)
		
	end
	
	if IsValid(target) and target:IsPlayer() and target:GetCSBSuit() and IsValid(attacker) and attacker:IsPlayer() and attacker:GetCSBSuit() and target != attacker and table.HasValue(target.VJ_NPC_Class, attacker.VJ_NPC_Class[#attacker.VJ_NPC_Class]) and GetConVar("csb_player_friendly_fire"):GetBool() then
		
		dmginfo:SetDamage(0)
		dmginfo:ScaleDamage(0)
		
	end
	
end)

hook.Add( "OnEntityCreated", "CSB_OnEntityCreated", function(ent)
	
	if IsValid(ent) then
	
		if ent:IsNPC() and ent.IsVJBaseSNPC == true and ent.VJ_NPC_Class then
		
			local none = {}
				
			timer.Simple(0.2, function()
				
			if !IsValid(ent) then return end
					
				net.Start("csb_relations_table_to_client")
				net.WriteEntity(ent)
				net.WriteTable(ent.VJ_NPC_Class)
				net.WriteTable(none)
				net.Broadcast()
				
			end)
			
		end
		
		if (SERVER) and ent:IsNPC() then
		
			for k,ply in pairs ( player.GetAll() ) do
				
				if ply:IsCSBUser() then ply:GetCSBSuit().CSBRelationLast = 0 end
				
			end
			
			timer.Simple(0.2, function()

				if !IsValid(ent) then return end

				local name = name or ent:GetClass() .. " " .. ent:EntIndex()
		
				if ent:GetName() != "" then	
					name = ent:GetName()
				end
					
				net.Start("csb_getNforCLc")
				net.WriteEntity(ent)
				net.WriteString(name)
				net.Broadcast()
			
			end)
		
		end
		
	end
	
end)

hook.Add( "PhysgunPickup", "CSB_PhysgunPickup", function(ply,ent)

	if ent:GetClass() == "sent_bg_changer_holo" then return false end

end)

if (SERVER) then

	resource.AddWorkshop( "2838040070" )
	
	hook.Add("Initialize", "CSB_DisableEPMS_PlayerModelEforcement", function()
	
		if GetConVar("csb_force_disable_epms_pm_enforcement"):GetBool() then
		
			timer.Simple(0.05, function()
			
				RunConsoleCommand("sv_playermodel_selector_force", "0") -- Why is this even a thing is beyond me.
				
			end)
			
		end
		
	end)

	hook.Add("PlayerCanPickupWeapon", "CSB_PlayerCanPickupWeapon", function(ply, wep)

		if ply:IsCSBUser() then
	
			local suit = ply:GetCSBSuit()
			local wepBlackList = suit.WeaponBlackList
			local wepWhiteList = suit.WeaponWhiteList

			if (ply:IsCSBUser() and wep:IsCSB()) then return false end

			if  (!wep:IsCSB() and wepWhiteList and !wepWhiteList[wep:GetClass()]) and suit.CanPickUpWeapons == false then
		
				return false
		
			elseif (!wep:IsCSB() and wepBlackList and wepBlackList[wep:GetClass()]) and suit.CanPickUpWeapons == true then
			
				if wep.PickedUpAlready == true then return false end
			
				wep.PickedUpAlready = true
			
				if wep:GetPrimaryAmmoType() > -1 then
			
					local aCount = wep:Clip1() or 0
				
					if wep:GetPrimaryAmmoType() == 10 then aCount = 1 end
				
					ply:GiveAmmo(aCount, wep:GetPrimaryAmmoType())
			
				end
			
				if wep:GetSecondaryAmmoType() > -1 then
			
					local aCount = wep:Clip2() or 0
				
					if wep:GetSecondaryAmmoType() == 10 then aCount = 1 end
				
					ply:GiveAmmo(aCount, wep:GetSecondaryAmmoType())
			
				end
			
				SafeRemoveEntity(wep)
					
				return false
		
			end
		
		end
	
	end)
	
	--hook.Add("ShutDown", "CSB_CleanUp", function()
	
		--
	
	--end)

	hook.Add("PlayerSpawn", "CSB_PlayerSpawn", function(ply, weapon, killer)
	
		ply:CBS_Restore()
		
		ply.CSBPlayEAnimation = false
		
		timer.Create("CSBPlayerEquipAnimDelay" .. ply:EntIndex(), 1, 1, function()
		
			if IsValid(ply) then
			
				ply.CSBPlayEAnimation = true
			
			end
		
		end)
		
	end)

	hook.Add("PlayerDeath", "CSB_PlayerDeath", function(ply, weapon, killer)
	
		local rag = ply:GetRagdollEntity()

		ply:CSBMatchPlayerRagdoll( IsValid(rag) && rag || nil )

		net.Start("csb_player_ragdoll")
		net.Broadcast()

	end)

	hook.Add("PlayerSilentDeath", "CSB_PlayerSilentDeath", function(ply, weapon, killer) -- Just in case.
		--if ply:GetNW2Bool("CSB_SuitOn") and csb_keep_suit_on_death <= 0 then CBS_SuitStrip(ply) end
	end)

end

if (CLIENT) then

	hook.Add("InitPostEntity", "CSB_PlayerInitialSpawnCheck", function()
	
		net.Start("csb_player_initial_spawn_check")
		net.SendToServer()
		
	end)

	local defaultAng = nil
	local fixedAng = nil

	hook.Add("Think", "CSB_CalcViewT", function()
		
		local ply = LocalPlayer()
		
		if ply:AllowThirdPerson() or ply:IsWorldClicking() or ply:IsNoClipping() or !GetConVar("csb_thirdperson_freecam"):GetBool() then return end
		
		if !ply:IsCSBUser() then fixedAng = ( ply:GetEyeTrace().HitPos - ply:EyePos() ):Angle() end

		if (!ply:FirstPersonAnims() and !ply:GetNW2Bool("CSB_AnimInTPFreeCam")) then

			if (fixedAng) then

				ply:SetEyeAngles(fixedAng)
				ply.viewAng = fixedAng

			end
				
			fixedAng = nil
				
			return 
		
		end
		
		if ply:IsCSBUser() and !ply:GetNW2Bool("CSB_AnimInTPFreeCam") then fixedAng = ( ply:GetEyeTrace().HitPos - ply:EyePos() ):Angle() end

		if !ply:IsCSBUser() then return end
		
		if !GetConVar("csb_thirdperson"):GetBool() and !ply:GetNW2Bool("CSB_AnimInTPFreeCam") or (ply:GetNW2Bool("CSB_AnimInTP") and !ply:GetNW2Bool("CSB_AnimInTPFreeCam")) then return end

		if (!input.IsKeyDown( ply:GetInfoNum(  "csb_menu_tp_free_cam_key", 81 )) and !ply:GetNW2Bool("CSB_AnimInTPFreeCam") ) then 

			if (defaultAng) then

				ply.viewAng = defaultAng

			end

				defaultAng = nil

			return
			
		end

		defaultAng = ( ply:GetEyeTrace().HitPos - ply:EyePos() ):Angle()
		
		if (!fixedAng) then

			ply:SetEyeAngles(defaultAng)

		else
		
			if ply:GetNW2Bool("CSB_AnimInTPFreeCam") then ply.viewAng = fixedAng end
			ply:SetEyeAngles(fixedAng)
			fixedAng = nil
		
		end

	end)

	hook.Add("CalcView", "CSB_CalcView", function(ply, pos, angle, fov)
	
		if ply:AllowThirdPerson() then return end

		if (!ply:FirstPersonAnims() or GetConVar("csb_thirdperson"):GetBool()) and ply:IsCSBUser() then
			
			if ply:GetCSBSuit().TPCameraPOS == nil or !ply.viewAng then return end
			
			local suit = ply:GetCSBSuit()
			
			local CamX = CamX or 0
			local CamY = CamY or 0
			local CamZ = CamZ or 0
			local CamC = CamC or 0
			
			local trFilter = function( ent ) if ( ply or ply:GetActiveweapon() or ent:IsNPC() or ent:GetNW2Bool("CSB_SpawnedNPC") or ent:GetNW2Bool("CSB_SpawnedEQ") ) then return false end end

			local CCam = GetConVar("csb_thirdperson_c_pos"):GetInt() or 0
		
			if CCam > 0 then
		
				CamX = GetConVar("csb_thirdperson_x"):GetFloat() or 0
				CamY = GetConVar("csb_thirdperson_y"):GetFloat() or 0
				CamZ = GetConVar("csb_thirdperson_z"):GetFloat() or 0
				CamC = GetConVar("csb_thirdperson_c"):GetFloat() or 0
		
			else
		
				CamX = ply:GetCSBSuit().TPCameraPOS.x or 0
				CamY = ply:GetCSBSuit().TPCameraPOS.y or 0
				CamZ = ply:GetCSBSuit().TPCameraPOS.z or 0
				CamC = ply:GetCSBSuit().TPCameraPOS.crouch or 0
		
			end
			
			local camBone = ply:LookupBone(suit.TPCameraPOS.bone)			
			local camPos = camPos or pos
			
			if camBone and GetConVar("csb_thirdperson_dynamic"):GetBool() then
			
				local camBonePos, camBoneAng = ply:GetBonePosition( camBone )
				camPos = camBonePos
				--CamC = 0
			
			end
			
			local noclipFix = noclipFix or false
			
				if ply:IsNoClipping() then 
				
					noclipFix = true
					
				else
				
					noclipFix = false
					
				end
		
			local camTr  = util.TraceLine({
				start = camPos ,
				endpos = camPos + (ply.viewAng:Forward( ) * 1e8),
				ignoreworld = noclipFix,
				filter = trFilter,
			})
		
			local trace = {}
			
			local trEndPos = trEndPos or camPos
			
			if ply:Crouching() then
				trEndPos = camPos - ply.viewAng:Forward() * (CamZ) - ply.viewAng:Right() * (CamX) - ply.viewAng:Up() * (CamY) * (CamC)
			else
				trEndPos = camPos - ply.viewAng:Forward() * (CamZ) - ply.viewAng:Right() * (CamX) - ply.viewAng:Up() * (CamY)
			end
			
			local trace = util.TraceHull({
				start = camPos,
				endpos = trEndPos,
				--filter = {ply:GetActiveWeapon(), ply},
				ignoreworld = noclipFix,
				filter = trFilter,
				mins = Vector(-6, -6, -4),
				maxs = Vector(6, 6, 4),
			})
		
			local pos
		
			if trace.Hit then
			
				local heightFix = (camPos - trace.HitPos):Length()
				pos = trace.HitPos + Vector(0,0,(CamZ-heightFix)*0.5)
			
			else
		
				pos = camPos - ply.viewAng:Forward() * (CamZ)
				pos = pos - ply.viewAng:Right() * (CamX)
			
				if ply:Crouching() then
			
					pos = pos - ply.viewAng:Up() * (CamY) * (CamC)
				
				else
			
					pos = pos - ply.viewAng:Up() * (CamY)
				
				end
			
			end
		
			local view = GAMEMODE:CalcView(ply, pos, angle, fov)
			view.fov = fov
			view.drawviewer = true
			view.origin = pos
			view.angles = ply.viewAng
		
			ply:SetEyeAngles( ( camTr.HitPos - ply:EyePos() ):Angle() )

			return view
	
		end
	
	end)

	hook.Add("InputMouseApply", "CSB_CalcViewM", function(cmd, x, y, ang)
	
		local ply = LocalPlayer()
		
		if ply:AllowThirdPerson() then return end
		
		if (!ply:FirstPersonAnims() or GetConVar("csb_thirdperson"):GetBool()) and ply:IsCSBUser() then
	
			if(!ply.viewAng)then
		
				ply.viewAng = Angle(0, 0, 0)
			
			end
		
		ply.viewAng.p = math.NormalizeAngle(ply.viewAng.p + y / 50)
		ply.viewAng.y = math.NormalizeAngle(ply.viewAng.y - x / 50)
		
			if(ply.viewAng.p > 80)then
		
				ply.viewAng.p = 80
			
			elseif(ply.viewAng.p < -60)then
		
				ply.viewAng.p = -60
			
			end
		
			return GetConVar("csb_thirdperson_freecam"):GetBool()
		
		end
		
	end)

	net.Receive("csb_relations_table_to_client", function()
		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local VJ_NPC_Class = net.ReadTable()
		local CSB_Allies = net.ReadTable()

		ent.VJ_NPC_Class = VJ_NPC_Class

		if !ent:IsNPC() then ent.CSB_Allies = CSB_Allies end

	end)

end

