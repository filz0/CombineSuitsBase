--[[

local defaultAng = nil
	local fixedAng = nil

	hook.Add("Think", "CSB_CalcViewT", function()
		
		local ply = LocalPlayer()
		
		if ply:AllowThirdPerson() or ply:IsWorldClicking() or ply:IsNoClipping() then return end
		
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

		if (!input.IsKeyDown( ply:GetInfoNum("csb_menu_tp_free_cam_key", 81 )) and !ply:GetNW2Bool("CSB_AnimInTPFreeCam") ) then 

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
		
			return true
		
		end
		
	end)
	
]]--


--[[
hook.Add("CalcView", "CSB_CalcView", function(ply, pos, angle, fov)
	
		if ply:AllowThirdPerson() then return end

		if (!ply:FirstPersonAnims() or GetConVar("csb_thirdperson"):GetBool()) and ply:IsCSBUser() then
			
			if ply:GetCSBSuit().TPCameraPOS == nil then return end
			
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
				start = camPos,
				endpos = camPos + angle:Forward() * 1e8, --+ Vector(0,0,),
				ignoreworld = noclipFix,
				filter = trFilter,
			})
		
			local trace = {}
			
			local trEndPos = trEndPos or camPos
			
			if ply:Crouching() then
				trEndPos = camPos - angle:Forward() * (CamZ) - angle:Right() * (CamX) - angle:Up() * (CamY) * (CamC)
			else
				trEndPos = camPos - angle:Forward() * (CamZ) - angle:Right() * (CamX) - angle:Up() * (CamY)
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
		
				pos = camPos - angle:Forward() * (CamZ)
				pos = pos - angle:Right() * (CamX)
			
				if ply:Crouching() then
			
					pos = pos - angle:Up() * (CamY) * (CamC)
				
				else
			
					pos = pos - angle:Up() * (CamY)
				
				end
			
			end
		
			local view = GAMEMODE:CalcView(ply, pos, angle, fov)
			view.fov = fov
			view.drawviewer = true
			view.origin = pos
			view.angles = ply.viewAng

			return view
	
		end
	
	end)
]]--