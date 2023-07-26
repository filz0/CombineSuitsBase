if (CLIENT) then

	local function CornerCords( ent )
	local min, max = ent:OBBMins(), ent:OBBMaxs()
	local findcorners = {
        Vector( min.x, min.y, min.z ),
        Vector( min.x, min.y, max.z ),
        Vector( min.x, max.y, min.z ),
        Vector( min.x, max.y, max.z ),
        Vector( max.x, min.y, min.z ),
        Vector( max.x, min.y, max.z ),
        Vector( max.x, max.y, min.z ),
        Vector( max.x, max.y, max.z )
}
	local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
	
		for _, corner in pairs( findcorners ) do
	
			local onScreen = ent:LocalToWorld( corner ):ToScreen()
			minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
			maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
			
		end
	
		return minX, minY, maxX, maxY
	
	end

	hook.Add( "HUDPaint", "CSB_CombineElite_AbilityONE", function()
	local ply = LocalPlayer()
		if ply && IsValid(ply:GetNW2Entity("CSB_UserSuit")) && ply:GetNW2Bool("CSB_CombineE_AbilityONE") == true then
		--[[
			for k, v in pairs ( ents.FindInSphere(ply:GetPos(), 500) ) do
				if (v:IsNPC() || v:IsPlayer()) && v:Health() > 0 && v != ply then
					cam.Start3D(EyePos(), EyeAngles())
						cam.IgnoreZ( true )
						render.SuppressEngineLighting( true )
						v:DrawModel()
						if IsValid(v:GetActiveWeapon()) then v:GetActiveWeapon():DrawModel() end
						--v:SetRenderFX(kRenderFxHologram)
						cam.IgnoreZ( false )
						render.SuppressEngineLighting( false )
					cam.End3D()
				end
			end
		]]--
		
			for k,v in pairs ( ents.FindInSphere(ply:GetPos(), 500) ) do
				if ((v:IsNPC() && !ply:IsNPCFriend(v)) || (v:IsPlayer() && !ply:IsPlayerFriend(v))) && v:Health() > 0 && v != ply then
					surface.SetDrawColor(Color(255,0,0,255))
					local x1,y1,x2,y2 = CornerCords(v)
					surface.DrawLine( x1, y1, math.min( x1 + 500, x2 ), y1 )
					surface.DrawLine( x1, y1, x1, math.min( y1 + 500, y2 ) )
					surface.DrawLine( x2, y1, math.max( x2 - 500, x1 ), y1 )
					surface.DrawLine( x2, y1, x2, math.min( y1 + 500, y2 ) )
					surface.DrawLine( x1, y2, math.min( x1 + 500, x2 ), y2 )
					surface.DrawLine( x1, y2, x1, math.max( y2 - 500, y1 ) )
					surface.DrawLine( x2, y2, math.max( x2 - 500, x1 ), y2 )
					surface.DrawLine( x2, y2, x2, math.max( y2 - 500, y1 ) )
				
					local vpos = v:GetPos() + Vector(0,0,v:BoundingRadius()*2)
					local vinfopos = vpos:ToScreen()

					draw.SimpleTextOutlined( v:CSBGetName(), "TargetID", vinfopos.x, vinfopos.y + 5, Color(255,0,0,255), 1, 1, 1, Color( 0, 0, 0 ) )
	
					local vdistance = "Distance: "..math.Round(((ply:GetPos():Distance( v:GetPos()))))/100 .."m"
					draw.SimpleTextOutlined( vdistance, "TargetIDSmall", vinfopos.x, vinfopos.y + 25, Color(255,0,0,255), 1, 1, 1, Color( 0, 0, 0 ) )
					
					local plyHP = plyHP || "Vitals: Excellent"
				
					if v:Health() >= v:GetMaxHealth() then
				
						plyHP = "Vitals: Excellent"
					
					elseif v:Health() < v:GetMaxHealth() && v:Health() >= v:GetMaxHealth()*0.75 then
				
						plyHP = "Vitals: High"
				
					elseif v:Health() < v:GetMaxHealth()*0.75 && v:Health() >= v:GetMaxHealth()*0.5 then
				
						plyHP = "Vitals: Medium"
				
					elseif v:Health() < v:GetMaxHealth()*0.5 && v:Health() >= v:GetMaxHealth()*0.25 then
				
						plyHP = "Vitals: Low"
				
					elseif v:Health() < v:GetMaxHealth()*0.25 then
				
						plyHP = "Vitals: Critical"
				
					end
				
					draw.SimpleTextOutlined( plyHP, "TargetIDSmall", vinfopos.x, vinfopos.y + 40, Color( 255, 0, 0 ), 1, 1, 1, Color( 0, 0, 0 ) )
		
					if v:IsPlayer() then
					
						local plyARMOR = "Armor: " .. v:Armor()
					
						draw.SimpleTextOutlined( plyARMOR, "TargetIDSmall", vinfopos.x, vinfopos.y + 55, Color( 255, 0, 0 ), 1, 1, 1, Color( 0, 0, 0 ) )
					
					end
					
				end
				
			end
			
		end
		
	end)

	hook.Add("PreDrawHalos", "CSB_MedicDebufferHalo",function()
		
		for _, mdeb in pairs( ents.FindByClass("sent_medic_debuffer") ) do
				
			halo.Add(mdeb.Debuffed,Color( 255, 200, 100, 255 ))
					
		end

	end)

	hook.Add( "HUDPaint", "CSB_MedicDebufferPaint", function()
	
		local ply = LocalPlayer()
		
		for _, mdeb in pairs( ents.FindByClass("sent_medic_debuffer") ) do
				
			for k, v in ipairs( mdeb.Debuffed ) do
				
				if IsValid(v) && v:Health() > 0 && v.CSBMedicDebuff == true then

					local offsetVec = Vector( 0, 0, v:BoundingRadius()*1.85 )
					local offsetAng = Angle( 0, 0, 0 )

					local newPos, newAng = LocalToWorld( offsetVec, offsetAng, v:GetPos(), v:GetAngles() )
					
					cam.Start3D()
					
					render.SetMaterial(	Material( "effects/med_debuff_ico.png" ) )
					render.DrawSprite( newPos, 10, 10, Color( 255, 200, 100, 255 ) )
					
					cam.End3D()
					
				end
		
			end
			
		end
	
	end)

end

hook.Add("EntityTakeDamage", "CSBHumans_EntityTakeDamage", function(target, dmginfo) 

	local attacker = dmginfo:GetAttacker()
	
	if IsValid(target) && target.CSBMedicDebuff == true then
	
		dmginfo:ScaleDamage(2)
		target:EmitServerSound("CSB.Medic.Debuff.DMG")
		
	end
	
	if IsValid(attacker) && attacker:GetClass("env_fire") && attacker.molofire == true && IsValid(target) && attacker != target then

		target:Ignite(3)
		
	end
	
end)

hook.Add("EntityFireBullets", "CSB_EntityFireBulletsCombineSouldier", function(ent, bullet)

	if ent:IsPlayer() && ent:IsCSBUser() && ent:GetNW2Bool("CSB_CombineS_AbilityONE") == true then
	
		bullet.Spread = bullet.Spread * 0.2
		
		return true
		
	end

end)
