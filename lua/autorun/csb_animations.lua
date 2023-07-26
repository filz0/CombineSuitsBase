
hook.Add( "UpdateAnimation", "CSB_UpdateAnimation", function(ply, velocity, maxseqgroundspeed)
	
	if ply:IsCSBUser() then

		if ply:IsNPCAnim() == true then

			ply:SetPoseParameter("head_roll", 0)
--[[
			if ply:KeyDown( IN_MOVERIGHT ) && !ply:KeyDown( IN_FORWARD ) && !ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", -90)
			
			elseif ply:KeyDown( IN_MOVERIGHT ) && ply:KeyDown( IN_FORWARD ) && !ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", -45)
			
			elseif ply:KeyDown( IN_MOVERIGHT ) && !ply:KeyDown( IN_FORWARD ) && ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", -135)
			
			elseif ply:KeyDown( IN_MOVELEFT ) && !ply:KeyDown( IN_FORWARD ) && !ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", 90)
			
			elseif ply:KeyDown( IN_MOVELEFT ) && ply:KeyDown( IN_FORWARD ) && !ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", 45)
			
			elseif ply:KeyDown( IN_MOVELEFT ) && !ply:KeyDown( IN_FORWARD ) && ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", 135)
			
			elseif ply:KeyDown( IN_BACK ) then
		
				ply:SetNWInt("MoveDirection", 180)
			
			elseif ply:KeyDown( IN_FORWARD ) then
		
				ply:SetNWInt("MoveDirection", 0)
			
			end	
		
			ply:SetPoseParameter("move_yaw", ply:GetNWInt("MoveDirection"))
]]

			if (SERVER) then ply:SetNW2Angle("CSB_UpdateAnimDir", ply:WorldToLocalAngles(ply:GetVelocity():Angle())) end -- Guess it works.
            ply:SetPoseParameter("move_yaw", ply:GetNW2Angle("CSB_UpdateAnimDir").y)
			
		end
	
	end
	
end)

hook.Add("DoAnimationEvent", "CSB_CustomDoAnimationEvent", function(ply, event, data)
	
    if ply:IsCSBUser() then
		
		if event == PLAYERANIMEVENT_CUSTOM && (data == ply:EntIndex()+1 || data == ply:EntIndex()+2) then
			
			if ply:GetNW2Int("CSB_Anim") == -1 then

				CSBDevMessage("STOP")

				ply:AddVCDSequenceToGestureSlot( ply:GetNW2Int("CSB_Gslot"), ACT_IDLE, 1, true )
				
				return ACT_INVALID
			
			else
		
			if !ply || !ply:Alive() then return end
					
				CSBDevMessage("Gesture Slot:".."			".. ply:GetNW2Int("CSB_Gslot"))
				CSBDevMessage("Sequence/ACT ID:".."		".. ply:GetNW2Int("CSB_Anim"))
				CSBDevMessage("Looping:".."			".. tostring(ply:GetNW2Bool("CSB_Loop")))
				CSBDevMessage("Thirdperson:".."			".. tostring(ply:GetNW2Bool("CSB_AnimInTP")))
				CSBDevMessage("No Movement/TP Cam Time:".."	".. ply:GetNW2Float("CSB_Dmovecam"))
				CSBDevMessage("Don't Move:".."			".. tostring(ply:GetNW2Bool("CSB_Dmove")))
				CSBDevMessage("Current Client Time:".."		".. CurTime())

				if data == ply:EntIndex()+1 then
					
					ply:AddVCDSequenceToGestureSlot( ply:GetNW2Int("CSB_Gslot"), ply:GetNW2Int("CSB_Anim"), 0, ply:GetNW2Bool("CSB_Loop") )
					
					CSBDevMessage("SEQ ".. ply:GetNW2Int("CSB_Anim"))
					
					return ACT_INVALID
					
				elseif data == ply:EntIndex()+2 then

					ply:AnimRestartGesture( ply:GetNW2Int("CSB_Gslot"), ply:GetNW2Int("CSB_Anim"), ply:GetNW2Bool("CSB_Loop") )
					
					CSBDevMessage("ACT ".. ply:GetNW2Int("CSB_Anim"))
					
					return ACT_INVALID
					
				end
				
			end
			
		end
		
	end
	
end)

hook.Add("StartCommand", "CSB_StartCommand", function(ply, cmd)

	if (ply:GetNW2Bool("CSB_PlayerGesture_StopMovement") == true || ply:GetNW2Bool("CSB_Player_StopMovement") == true) && !ply:IsNoClipping() then

		cmd:ClearMovement() 
		cmd:ClearButtons()

	end

end)

hook.Add("SetupMove", "CSB_SetupMove", function(ply, mvd, cmd)
	
	if !ply:IsCSBUser() && ply.gEndPos then ply.gEndPos = nil end
	
	if ply:IsCSBUser() then
	
	local suit = ply:GetCSBSuit()
	
		if suit.PlyRappelTab && ply.gEndPos && !ply:IsOnGround() && !ply:IsNoClipping() && !ply:IsOnLadder() then
			
			local rappleTab = suit.PlyRappelTab
			local startSND = rappleTab.rapstartsnd
			local startAnim = rappleTab.rapstart
			local loopSND = rappleTab.raploopsnd

			       
				if ply.startRapple != true then
					ply:EmitServerSound(startSND)
					ply:EmitServerSound(loopSND)
					ply:SendCSBAnimation(6, startAnim[1], startAnim[2], startAnim[3], startAnim[4], startAnim[5], nil, false)
					ply.startRapple = true
				end
			
            local targetVel = -200

            if ply:KeyDown(IN_JUMP) then
			
                if ply.gSliding then
				
					ply:StopSound(loopSND)
                    ply.gSliding = false
					
                end

                targetVel = 0
				
            else
			
                if !ply.gSliding then
				
					ply:EmitServerSound(loopSND)                  
                    ply.gSliding = true
					
                end
				
            end

            if mvd:GetVelocity().z < targetVel then
			
                local latforce = (ply.gEndPos - mvd:GetOrigin()) * .05
                latforce.z = 0
                mvd:SetVelocity(mvd:GetVelocity() + latforce)
                local curvel = mvd:GetVelocity()
                curvel.z = targetVel
                mvd:SetVelocity(curvel)
				
            end
			
		elseif ply.gEndPos && (ply:IsOnGround() || ply:IsNoClipping() || ply:IsOnLadder()) then
		
			local rappleTab = suit.PlyRappelTab
			local landSND = rappleTab.rapendsnd
			local landAnim = rappleTab.rapend
			local loopSND = rappleTab.raploopsnd
			
			ply:StopSound(loopSND)
			ply:EmitServerSound(landSND)
			ply:SendCSBAnimation(6, landAnim[1], landAnim[2], landAnim[3], landAnim[4], landAnim[5], nil, true)
			ply.startRapple = false
			ply.gEndPos = nil
			
        end
		
		--if ply:GetNW2Bool("CSB_Loop") != true && (mvd:KeyDown(IN_ATTACK) || mvd:KeyDown(IN_ATTACK2) || mvd:KeyDown(IN_JUMP) || mvd:KeyDown(IN_RELOAD)) then
		
		--	ply:SetNW2Bool("CSB_Loop", nil)
		--	ply:SetNW2Bool("CSB_PlayingAnim", false)
		---	ply:SetNW2Bool("CSB_AnimInTP", false)
		--	ply:SetNW2Bool("CSB_AnimInTPFreeCam", false)
			--if IsLuaAnimation(ply:GetNW2String("CSB_LuaAnim")) then ply:StopLuaAnimation(ply:GetNW2String("CSB_LuaAnim")) end
		--	ply:SendCSBAnimation(ply:GetNW2Int("CSB_Gslot"),nil,nil,nil,nil,0,nil,nil)
			
		--end
		
		if ply:GetNW2Bool("CSB_Dmove") == true then
		
			ply:SetNW2Bool("CSB_Dmove", false)
			ply:SetNW2Bool("CSB_PlayerGesture_StopMovement", true)
			
			timer.Create("CSB_PlayerInAnimDontMoveCancel"..ply:EntIndex(), ply:GetNW2Float("CSB_Dmovecam"), 1, function()
			
				if !IsValid(ply) then return end
				
				ply:SetNW2Bool("CSB_PlayerGesture_StopMovement", false)
				
			end)
			
		end
		
		--if ply:GetNW2Bool("CSB_PlayerSwitchingWeapon") == true && ply:GetNW2Bool("CSB_PlayerGesture_StopMovement") == true && (mvd:KeyDown(IN_ATTACK) || mvd:KeyDown(IN_ATTACK2) || mvd:KeyDown(IN_JUMP)) then
		
		--	ply:SetNW2Bool("CSB_PlayerGesture_StopMovement", false)
		--	ply:SendCSBAnimation(0,nil,nil,nil,0,nil,nil)
			
		--end

		if ply:IsNPCAnim() == true && suit.AnimationStatesTab && suit.AnimationStatesTab.combat && (mvd:KeyDown(IN_ATTACK) || mvd:KeyDown(IN_ATTACK2)) then
	
			ply:CSBSetAnimationState(suit.AnimationStatesTab.combat[1],suit.AnimationStatesTab.combat[2],suit.AnimationStatesTab.combat[3])
			
		end
		
		if ply:Alive() then ply:CSBRotateGesture() end
			
		ply:CSBFootStep()
			
		if (SERVER) && ply:Alive() then ply:CSBHideWeapons() end
		
	end
	
end)

hook.Add("TranslateActivity", "CSB_TranslateActivity", function(ply,act)

	if ply:IsCSBUser() && ply:IsNPCAnim() then
		
		ply:SetNW2Int("CSB_PlyCurACT", act)
		local suit = ply:GetCSBSuit()

			if IsValid(ply:GetActiveWeapon()) && !ply:InVehicle() then
			
				local hl2MPTab = suit.CSBTransAct.hl2mp_gestures
			
				if hl2MPTab != nil && hl2MPTab[ act ] then

					return hl2MPTab[ act ]
				
				end
			
				local wep = ply:GetActiveWeapon()
				local wepHoldAct = wep:GetHoldType()

				if wepHoldAct == "" then wepHoldAct = "invalid" end
				
				local transTab = suit.CSBTransAct[wepHoldAct]
				local transTabSet = transTab[ act ]			
				local transTabSetCur = transTabSetCur || nil
				
				if transTabSet != nil then transTabSetCur = transTabSet[ ply:GetNW2Int("CSB_AnimatonState") ]  || transTabSet[ 1 ] end
				
				if ( transTabSet != nil && transTabSetCur != nil ) then

					return ply:CSBTranslateSequence(transTabSetCur)

				end
				
				return 2027
				
			elseif !IsValid(ply:GetActiveWeapon()) && !ply:InVehicle() then
			
				local transTab = suit.CSBTransAct["normal"]
				local transTabSet = transTab[ act ]
				local transTabSetCur = transTabSetCur || nil
				
				if transTabSet != nil then transTabSetCur = transTabSet[ ply:GetNW2Int("CSB_AnimatonState") ]  || transTabSet[ 1 ] end
				
				if ( transTabSet != nil && transTabSetCur != nil ) then
				
					return ply:CSBTranslateSequence(transTabSetCur)

				end
				
				return 2027
				
			elseif ply:InVehicle() && ply:GetNW2Bool("CSB_PlyInVehicle") == true then
				
				local transTab = suit.CSBTransAct["vehicle"]
				local transTabSet = transTab[ act ]
				local transTabSetCur = transTabSetCur || nil
				
				if transTabSet != nil then transTabSetCur = transTabSet[ ply:GetNW2Int("CSB_AnimatonState") ]  || transTabSet[ 1 ] end
				
				if ( transTabSet != nil && transTabSetCur != nil ) then

					return ply:CSBTranslateSequence(transTabSetCur)

				end
				
				return 2027
				
			end
		
	end
	
end)

hook.Add("CalcMainActivity", "CSB_CalcMainActivity", function(ply, velocity)
	--[[
	if ply:IsCSBUser() then
	
	local suit = ply:GetCSBSuit()
    ply.CalcIdeal = ACT_MP_STAND_IDLE

    local len2d = velocity:Length2D()

        ply.CalcSeqOverride = ply:LookupSequence("scaredidle")

 
    return ply.CalcIdeal, ply.CalcSeqOverride
	end
	]]
end)

hook.Add("PlayerSwitchWeapon", "CSB_PlayerSwitchWeapon", function(ply, oldWeapon, newWeapon)

	if ply:IsCSBUser() then
	
		if (ply:GetNW2Bool("CSB_PlayingAnim") == true && ply:GetNW2Int("CSB_Gslot") == 6) || ply:GetNW2Bool("CSB_Loop") == false then
		return true
		--	ply:SetNW2Bool("CSB_Loop", nil)
		--	ply:SetNW2Bool("CSB_PlayingAnim", false)
		--	ply:SetNW2Bool("CSB_AnimInTP", false)
		--	ply:SetNW2Bool("CSB_AnimInTPFreeCam", false)
		--	ply:SendCSBAnimation(0,nil,nil,nil,nil,nil,0,nil,nil)
			
		end
		
		if (ply:GetNW2Bool("CSB_PlayingAnim") != true || (ply:GetNW2Bool("CSB_PlayingAnim") == true && ply:GetNW2Int("CSB_Gslot") != 6)) && ply:GetNW2Bool("CSB_Loop") != false && IsValid(newWeapon) && !newWeapon:IsCSB() && !CSBTools[newWeapon:GetClass()] && GetConVar("csb_allow_weapon_swap_animations"):GetBool() then
		
			local wepAnimT = ply:GetCSBSuit().WeaponSwapAnim
			local wep = ply:GetActiveWeapon()
			local wepHoldType = newWeapon:GetHoldType()
			
			if wepHoldType == "" then wepHoldType = "invalid" end
			
			local wepHoldTAnim = wepAnimT[wepHoldType]
			local wepHoldAnim = wepHoldTAnim.anim
			local wepHoldDmove = wepHoldTAnim.dmove
			local wepHoldCanim = wepHoldTAnim.canim
			
			if wepAnimT && wepHoldTAnim != nil && wepHoldAnim then
			
				timer.Create("CSBPlayerSwitchWeapon"..ply:EntIndex(), 0, 1, function()
					
					local dur = ply:GetAnimDuration(wepHoldAnim) 
					local wepAnim = wepAnimT[wepHoldType]
					ply:SetNW2Bool("CSB_PlayerGesture_StopMovement", false)
					ply:SetNW2Bool("CSB_PlayerSwitchingWeapon", true)
	
					ply:SendCSBAnimation(6,wepHoldAnim,true,false,nil,nil,0,wepHoldDmove,nil,true)
					
					if wepHoldCanim && #wepHoldCanim > 0 then ply:CSBSetAnimationState(wepHoldCanim[1],wepHoldCanim[2],wepHoldCanim[3]) end
					
					timer.Create("CSB_PlayerSwitchWeaponDuration"..ply:EntIndex(), dur, 1, function()
						if !IsValid(ply) then return end
						ply:SetNW2Bool("CSB_PlayerSwitchingWeapon", false)
					end)
					
				end)
				
			end
			
		end
		
	end
	
end)

hook.Add("PlayerEnteredVehicle", "CSB_PlayerEnteredVehicle", function(ply, veh, role)
	
	if ply:IsCSBUser() then
	
		local vehtable = ply:GetCSBSuit().VehicleAnim
	
		ply:SetNW2Bool("CSB_PlyInVehicle", true)

		if vehtable[veh:GetModel()] && ply:GetCSBSuit().VehicleHide == false then
			
			--ply:SetActiveWeapon(ply:GetCSBSuit())
			ply:CSBEditBone(vehtable[veh:GetModel()])
			
			ply:ClientSetIK(false)
			
		elseif vehtable[veh:GetClass()] && ply:GetCSBSuit().VehicleHide == false then
			
			--ply:SetActiveWeapon(ply:GetCSBSuit())
			ply:CSBEditBone(vehtable[veh:GetClass()])
			
			ply:ClientSetIK(false)
				
		elseif (!vehtable[veh:GetModel()] && !vehtable[veh:GetClass()]) && ply:GetCSBSuit().VehicleHide == true then
				
			ply:SetNoDraw(true)
			ply:DrawShadow(false)
			ply:SetNW2Bool("CSB_PlyInVehicleInvisible", true)
			
		end	
		
	end
	
end)

hook.Add("PlayerLeaveVehicle", "CSB_PlayerLeaveVehicle", function(ply, veh)

	if ply:GetNW2Bool("CSB_PlyInVehicle") == true then
	
		ply:CSBResetBone()
		
		ply:ClientSetIK(true)
		
		ply:SetNW2Bool("CSB_PlyInVehicle", false)
		
		if ply:GetNW2Bool("CSB_PlyInVehicleInvisible") == true then
		
			ply:SetNoDraw(false)
			ply:DrawShadow(true)
			ply:SetNW2Bool("CSB_PlyInVehicleInvisible", false)
			
		end
		
	end
	
end)

hook.Add("EntityTakeDamage", "CSB_DamageAnims", function(target, dmginfo) 
	local attacker = dmginfo:GetAttacker()
	local dmgt = dmginfo:GetDamageType()
	
	if target:IsPlayer() && target:GetCSBSuit() then
		
		local hitGroup = target:GetCSBSuit().FlinchGestures
		
		if IsValid(target:GetCSBSuit()) && CurTime() - hitGroup.fglast >= hitGroup.fgdelay && target:GetNW2Bool("CSB_PlayingAnim") != true then
		
			if hitGroup[tostring(target:LastHitGroup())] then

				target:SendCSBAnimation(4,hitGroup[tostring(target:LastHitGroup())], true, false, nil, nil, 0, false)
			
			end
		
			hitGroup.fglast = CurTime()
			
		end
		
	end
	
	if target:IsPlayer() && IsValid(target:GetCSBSuit()) && table.Count(target:GetCSBSuit().FallAnimations) > 0 && dmgt == DMG_FALL then
	
		local anims = target:GetCSBSuit().FallAnimations
		
		timer.Simple(0, function()
		
			local mathRand = math.Round(util.SharedRandom("CSB_mathRand" ,1 ,#anims))
			target:SendCSBAnimation(6, anims[mathRand], true, true, true, nil, nil, true, nil)
		
		end)
		
	end
	
end)

if (CLIENT) then

	hook.Add("PostPlayerDraw", "CSB_HeadRotation", function(ply, flags)

		if ply:IsCSBUser() then

			local suit = ply:GetCSBSuit()
			local headTab = suit.PlyForceHeadRotation
	
			if headTab && headTab.headbone != "" && !ply:RotatingHead() && ply:Alive() then
					
				if ply:InVehicle() then ply:CSBResetHeadAngle() return end
				
				ply.headBoneToReset = headTab.headbone

				local yaw = math.AngleDifference(ply:EyeAngles().y, ply:GetRenderAngles().y)
				local yaw2 = yaw

				local pitch = math.AngleDifference(ply:EyeAngles().x, ply:GetRenderAngles().x)

				local headBone = ply:LookupBone(headTab.headbone)
				
				if headBone then
				
				local headBonePos, headBoneAng = ply:GetBonePosition( headBone )
		
				if headTab.yawlimit && yaw > headTab.yawlimit then yaw = headTab.yawlimit end
				if headTab.yawlimit && yaw < -headTab.yawlimit then yaw = -headTab.yawlimit end
				if headTab.pitchlimit && pitch > headTab.pitchlimit then pitch = headTab.pitchlimit end
				if headTab.pitchlimit && pitch < -headTab.pitchlimit then pitch = -headTab.pitchlimit end
			
				pitch = -pitch
			
				local roll = yaw/2 * pitch/100
			
				if headTab.rolllimit && roll > headTab.rolllimit then roll = headTab.rolllimit end
				if headTab.rolllimit && roll < -headTab.rolllimit then roll = -headTab.rolllimit end
				
					if headBone && (yaw2 < 45 && yaw2 > -45) then
					
						local lerpAng = LerpAngle( FrameTime() * 10, ply:GetManipulateBoneAngles( headBone ), Angle(roll,pitch,yaw) )
						ply:ManipulateBoneAngles( headBone, lerpAng )
						---ply:SetEyeTarget(ply:GetEyeTrace().HitPos || ply:GetEyeTrace().Entity:GetPos())
					
					elseif headBone then
				
						local lerpAng = LerpAngle( FrameTime() * 2, ply:GetManipulateBoneAngles( headBone ), Angle(0,0,0) )
						ply:ManipulateBoneAngles( headBone, lerpAng )
					
					end
				
				end
				
				ply.headAngleReset = true
		
			else
	
				ply:CSBResetHeadAngle()
		
			end
		
		else
	
			ply:CSBResetHeadAngle()
		
		end
	
	end)

end