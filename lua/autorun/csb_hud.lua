if (SERVER) then

	resource.AddFile( "resource/fonts/universal_union.ttf" )
	resource.AddFile( "resource/fonts/sprayme.ttf" )

end

if (CLIENT) then

	local scrWidth = 1920
	local scrHeight = 1080

	multX = ScrW() / scrWidth
	local multY = ScrH() / scrHeight

	surface.CreateFont("csb_font_playerinfo", {
		font = "Universal Union",
		size = 62*multX
	})

	surface.CreateFont("csb_font_barinfo", {
		font = "Universal Union",
		size = 29*multX
	})

	surface.CreateFont("csb_font_ammoinfo", {
		font = "Universal Union",
		size = 62*multX
	})

	surface.CreateFont("csb_font_ammoinfo2", {
		font = "Universal Union",
		size = 29*multX
	})
	
	surface.CreateFont("csb_font_name", {
		font = "Universal Union",
		size = 27*multX
	})
	
	surface.CreateFont("csb_font_playerinfo_rebel", {
		font = "Spray.ME",
		size = 62*multX
	})

	surface.CreateFont("csb_font_barinfo_rebel", {
		font = "Spray.ME",
		size = 29*multX
	})

	surface.CreateFont("csb_font_ammoinfo_rebel", {
		font = "Spray.ME",
		size = 62*multX
	})

	surface.CreateFont("csb_font_ammoinfo2_rebel", {
		font = "Spray.ME",
		size = 29*multX
	})
	
	surface.CreateFont("csb_font_name_rebel", {
		font = "Spray.ME",
		size = 21*multX
	})

	function draw.OutlinedBox( x, y, w, h, thickness, clr )

		surface.SetDrawColor( clr )
	
		for i=0, thickness - 1 do
	
			surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
		
		end
	
	end

	local HideElementsTable = {
		["CHudHealth"]				= true,
		["CHudBattery"]				= true,
		["CHudSuitPower"]			= true,
		["CHudAmmo"]				= true,
		["CHudSecondaryAmmo"]		= true,
	}

	local function HideElements(element)
	
		local ply = LocalPlayer()
		local allowh = GetConVar( "csb_allow_hud" ):GetBool()
	
		if allowh and IsValid(ply) and ply:IsCSBUser() and ply:GetCSBSuit().HUDTab and HideElementsTable[element] then

			return false
			
		end

	end
	hook.Add("HUDShouldDraw", "CSB_HideElements", HideElements)


	local start = SysTime()

	local CSBAnimateHudDelay = SysTime()
	local CSBAnimateHudReset = -1

	local function CSBAnimateHud( speed, startVal, endVal )
	
		if speed <= 0 or speed == nil then return endVal end
		
		local newVal = Lerp( 1 - 0.1, startVal, endVal )
		
		if SysTime() - CSBAnimateHudDelay > speed then
			CSBAnimateHudDelay = SysTime()		
		end

		return newVal
	
	end
	
	local function Base()

		local ply = LocalPlayer()
		local suit = ply:GetCSBSuit()
		local drawh = GetConVar( "cl_drawhud" ):GetBool()
		local allowh = GetConVar( "csb_allow_hud" ):GetBool()

		if drawh and allowh then
	
			if IsValid(ply) and ply:IsCSBUser() and ply:Alive() and suit.HUDTab then
			
				if suit.HUDTab.health then
				
					local hpTab = suit.HUDTab.health
					local hpBGPos = hpTab.bghppos
					local hpBGSize = hpTab.bghpsize
					local hpBGRound = hpTab.bghpround
					local hpBGColor = hpTab.bghpcolor
					
					draw.RoundedBox( hpBGRound, hpBGPos.x * multX, hpBGPos.y * multY, hpBGSize.w * multX, hpBGSize.h * multY, hpBGColor ) 
				
				end
				
				if suit.HUDTab.name then
				
					local nameTab = suit.HUDTab.name
					local nameBGPos = nameTab.bgnamepos
					local nameBGSize = nameTab.bgnamesize
					local nameBGRound = nameTab.bgnameround
					local nameBGColor = nameTab.bgnamecolor
				
					draw.RoundedBox( nameBGRound, nameBGPos.x * multX, nameBGPos.y * multY, nameBGSize.w * multX, nameBGSize.h * multY, nameBGColor ) 
					
				end
				
				if suit.HUDTab.armor and ply:Armor()>0 then
				
					local armrTab = suit.HUDTab.armor
					local armrBGPos = armrTab.bgarmrpos
					local armrBGSize = armrTab.bgarmrsize
					local armrBGRound = armrTab.bgarmrround
					local armrBGColor = armrTab.bgarmrcolor
				
					draw.RoundedBox( armrBGRound, armrBGPos.x * multX, armrBGPos.y * multY, armrBGSize.w * multX, armrBGSize.h * multY, armrBGColor ) 
				
				end
				
				if suit.HUDTab.weaponname and IsValid(ply:GetActiveWeapon()) and !ply:GetActiveWeapon():IsCSB() then
				
					local wepTab = suit.HUDTab.weaponname
					local wepBGPos = wepTab.bgwepnpos
					local wepBGSize = wepTab.bgwepnsize
					local wepBGRound = wepTab.bgwepnround
					local wepBGColor = wepTab.bgwepncolor
				
					draw.RoundedBox( wepBGRound, wepBGPos.x * multX, wepBGPos.y * multY, wepBGSize.w * multX, wepBGSize.h * multY, wepBGColor )
 
				end
				
				if suit.HUDTab.weaponstat and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetPrimaryAmmoType()!=-1 then
				
					local wepTab = suit.HUDTab.weaponstat
					local wepBGPos = wepTab.bgweppos
					local wepBGSize = wepTab.bgwepsize
					local wepBGRound = wepTab.bgwepround
					local wepBGColor = wepTab.bgwepcolor
				
					draw.RoundedBox( wepBGRound, wepBGPos.x * multX, wepBGPos.y * multY, wepBGSize.w * multX, wepBGSize.h * multY, wepBGColor )
 
				end

			end
		
		end
	
	end

	local function Bars()
	
		local ply = LocalPlayer()
		local suit = ply:GetCSBSuit()
		local drawh = GetConVar( "cl_drawhud" ):GetBool()
		local allowh = GetConVar( "csb_allow_hud" ):GetBool()
	
		if drawh and allowh then
	
			if IsValid(ply) and ply:IsCSBUser() and ply:Alive() and suit.HUDTab then
				
				if suit.HUDTab.health then
				
					local hpTab = suit.HUDTab.health
					local hpNPos = hpTab.nhppos
					local hpNFont = hpTab.nhpfont
					local hpNColor = hpTab.nhpcolor
					local hpNLimit = hpTab.nhplimit
	
					local hpTPos = hpTab.thppos
					local hpTText = hpTab.thptext
					local hpTFont = hpTab.thpfont
					local hpTColor = hpTab.thpcolor
					
					local hpNMPos = hpTab.nmhppos
					local hpNMFont = hpTab.nmhpfont
					local hpNMColor = hpTab.nmhpcolor
					local hpNMLimit = hpTab.nmhplimit
					
					local hpTMPos = hpTab.tmhppos
					local hpTMText = hpTab.tmhptext
					local hpTMFont = hpTab.tmhpfont
					local hpTMColor = hpTab.tmhpcolor
					
					local fixVal = fixVal or ply:Health()
					if ply:Health() > hpNLimit then fixVal = hpNLimit end
					
					local fixVal2 = fixVal2 or ply:GetMaxHealth()
					if ply:GetMaxHealth() > hpNMLimit then fixVal2 = hpNMLimit end
				
					draw.SimpleText( fixVal, hpNFont, hpNPos.x * multX, hpNPos.y * multY, hpNColor, 1, 1 )
					draw.SimpleText( hpTText, hpTFont, hpTPos.x * multX, hpTPos.y * multY, hpTColor, 1, 1 )

					draw.SimpleText( fixVal2, hpNMFont, hpNMPos.x * multX, hpNMPos.y * multY, hpNMColor, 1, 1 )					
					draw.SimpleText( hpTMText, hpTMFont, hpTMPos.x * multX, hpTMPos.y * multY, hpTMColor, 1, 1 )	
					
				end
				
				if suit.HUDTab.name then
				
					local nameTab = suit.HUDTab.name
	
					local nameTPos = nameTab.tnamepos
					local nameTText = nameTab.tnametext
					local nameTFont = nameTab.tnamefont
					local nameTColor = nameTab.tnamecolor
				
					draw.SimpleText( nameTText, nameTFont, nameTPos.x * multX, nameTPos.y * multY, nameTColor, 1, 1 )
					
				end
				
				if suit.HUDTab.armor and ply:Armor()>0 then
				
					local armrTab = suit.HUDTab.armor
					local armrNPos = armrTab.narmrpos
					local armrNFont = armrTab.narmrfont
					local armrNColor = armrTab.narmrcolor
					local armrNLimit = armrTab.narmrlimit
	
					local armrTPos = armrTab.tarmrpos
					local armrTText = armrTab.tarmrtext
					local armrTFont = armrTab.tarmrfont
					local armrTColor = armrTab.tarmrcolor
					
					local armrNMPos = armrTab.nmarmrpos
					local armrNMFont = armrTab.nmarmrfont
					local armrNMColor = armrTab.nmarmrcolor
					local armrNMLimit = armrTab.nmarmrlimit
					
					local armrTMPos = armrTab.tmarmrpos
					local armrTMText = armrTab.tmarmrtext
					local armrTMFont = armrTab.tmarmrfont
					local armrTMColor = armrTab.tmarmrcolor
					
					local fixVal1 = fixVal1 or ply:Armor()
					if ply:Armor() > armrNLimit then fixVal1 = armrNLimit end
					
					local fixVal2 = fixVal2 or ply:GetMaxArmor()
					if ply:GetMaxArmor() > armrNMLimit then fixVal2 = armrNMLimit end
	
					draw.SimpleText( fixVal1, armrNFont, armrNPos.x * multX, armrNPos.y * multY, armrNColor, 1, 1 )
					draw.SimpleText( armrTText, armrTFont, armrTPos.x * multX, armrTPos.y * multY, armrTColor, 1, 1 )
					
					draw.SimpleText( fixVal2, armrNMFont, armrNMPos.x * multX, armrNMPos.y * multY, armrNMColor, 1, 1 )
					draw.SimpleText( armrTMText, armrTMFont, armrTMPos.x * multX, armrTMPos.y * multY, armrTMColor, 1, 1 )
	
				end 
				
				local wepNameTab = suit.HUDTab.weaponname
				
				if wepNameTab and wepNameTab.twepnpos and IsValid(ply:GetActiveWeapon()) and !ply:GetActiveWeapon():IsCSB() then
					
					local wepTWNPos = wepNameTab.twepnpos
					local wepTWNFont = wepNameTab.twepnfont
					local wepTWNColor = wepNameTab.twepncolor
					local wepNameFromPrint = ply:GetActiveWeapon():GetPrintName()
					local wepNameFromLang = language.GetPhrase(ply:GetActiveWeapon():GetClass())
						
					local wepName = wepName or ""

					if wepNameFromPrint and wepNameFromPrint != "" then						
						wepName = wepNameFromPrint					
					elseif wepNameFromLang and wepNameFromLang != "" then						
						wepName = wepNameFromLang				
					else
						wepName = "! UNKNOWN !"						
					end
								
					draw.SimpleText( wepName, wepTWNFont, wepTWNPos.x * multX, wepTWNPos.y * multY, wepTWNColor, 1, 1 )
						
				end
				
				if suit.HUDTab.weaponstat and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetPrimaryAmmoType()!=-1 then
				
					local wepStatTab = suit.HUDTab.weaponstat
					
					if ply:GetActiveWeapon():Clip1() !=-1 or (ply:GetActiveWeapon():GetPrimaryAmmoType()!=0 and ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())!=0) and wepStatTab.n1weppos then
						
						local wepN1Pos = wepStatTab.n1weppos
						local wepN1Font = wepStatTab.n1wepfont
						local wepN1Color = wepStatTab.n1wepcolor
						local wepN1Limit = wepStatTab.n1weplimit
						
						local wepN2Pos = wepStatTab.n2weppos
						local wepN2Font = wepStatTab.n2wepfont
						local wepN2Color = wepStatTab.n2wepcolor
						local wepN2Limit = wepStatTab.n2weplimit
						
						local wepTPAPos = wepStatTab.tpaweppos
						local wepTPAText = wepStatTab.tpaweptext
						local wepTPAFont = wepStatTab.tpawepfont
						local wepTPAColor = wepStatTab.tpawepcolor
						--
						local c1 = ply:GetActiveWeapon():Clip1()
						
						if c1 == -1 then c1 = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()) end
						
						local fixVal1 = fixVal1 or c1
						if ply:GetActiveWeapon():Clip1() > wepN1Limit then fixVal1 = wepN1Limit end
						
						local fixVal2 = fixVal2 or ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
						if ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()) > wepN2Limit then fixVal2 = wepN2Limit end
						
						draw.SimpleText( fixVal1, wepN1Font, wepN1Pos.x * multX, wepN1Pos.y  * multY, wepN1Color, 1, 1 )
						draw.SimpleText( fixVal2, wepN2Font, wepN2Pos.x * multX, wepN2Pos.y * multY, wepN2Color, 1, 1 )
						draw.SimpleText( wepTPAText, wepTPAFont, wepTPAPos.x * multX, wepTPAPos.y * multY, wepTPAColor, 1, 1 )						
						
					end
						
					if (ply:GetActiveWeapon():Clip1() !=-1 or (ply:GetActiveWeapon():GetPrimaryAmmoType()!=0 and ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())!=0)) and wepStatTab.tweppos then
						
						local wepTPos = wepStatTab.tweppos
						local wepTText = wepStatTab.tweptext
						local wepTFont = wepStatTab.twepfont
						local wepTColor = wepStatTab.twepcolor
						
						draw.SimpleText( wepTText, wepTFont, wepTPos.x * multX, wepTPos.y * multY, wepTColor, 1, 1 )
							
					end
						
					
					if ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType())!=0 and wepStatTab.n3weppos and wepStatTab.tspweppos then
						
						local wepN3Pos = wepStatTab.n3weppos
						local wepN3Font = wepStatTab.n3wepfont
						local wepN3Color = wepStatTab.n3wepcolor
						local wepN3Limit = wepStatTab.n3weplimit
						
						local wepTSPPos = wepStatTab.tspweppos
						local wepTSPText = wepStatTab.tspweptext
						local wepTSPFont = wepStatTab.tspwepfont
						local wepTSPColor = wepStatTab.tspwepcolor
						
						local fixVal1 = fixVal1 or ply:GetAmmoCount( ply:GetActiveWeapon():GetSecondaryAmmoType())
						if ply:GetAmmoCount( ply:GetActiveWeapon():GetSecondaryAmmoType()) > wepN3Limit then fixVal1 = wepN3Limit end
					
						draw.SimpleText( fixVal1, wepN3Font, wepN3Pos.x * multX, wepN3Pos.y  * multY, wepN3Color, 1, 1 )
						draw.SimpleText( wepTSPText, wepTSPFont, wepTSPPos.x * multX, wepTSPPos.y * multY, wepTSPColor, 1, 1 )	
				
					end
				
				end
				
			end
			
		end
		
	end

	hook.Add("HUDPaint", "CSB_HUDPaint", function()

		Base()
		Bars()

	end)
	
	hook.Add( "HUDPaint", "CSB_PostDrawHUD", function()
		local ply = LocalPlayer()
	
		if !ply:IsCSBUser() then ply:CrosshairClientToggle(true) return end
		
		local suit = ply:GetCSBSuit()
		
		if ply:GetNW2Bool("CSB_ShowAllies") == true and GetConVar("csb_ally_markers"):GetBool() then
		
			local allies = ply.CSB_Allies
			local plyallyclass = ply.VJ_NPC_Class
			local allyMarkTab = suit.CSB_AllyMarkers

			for k,v in pairs ( ents.FindInSphere(ply:GetPos(), GetConVar("csb_ally_markers_max"):GetFloat()) ) do	
			
				if (v:IsNPC() and ply:IsNPCFriend(v) and !IsNPCIgnored(v)) or (v:IsPlayer() and ply:IsPlayerFriend(v)) and v:Health() > 0 and v != ply then
					
					local vpos = v:GetPos() + Vector(0,0,v:BoundingRadius()*1.85)
					local vpos2 = v:GetPos() + Vector(0,0,v:BoundingRadius()*2)
					local vinfopos = vpos:ToScreen()
					local vinfopos2 = vpos2:ToScreen()
					local vname = allyMarkTab.allymarksymbol 

					draw.SimpleTextOutlined( vname, allyMarkTab.allymarkfont, vinfopos.x, vinfopos.y, allyMarkTab.allymarkcolor, 1, 1, 1, allyMarkTab.allymarkcoloroutline )					
					
					if GetConVar("csb_ally_markers_names"):GetBool() then draw.SimpleTextOutlined( v:CSBGetName(), "DermaDefault", vinfopos2.x, vinfopos2.y, allyMarkTab.allymarkcolor, 1, 1, 1, allyMarkTab.allymarkcoloroutline ) end
				
				end
			
			end
		
		end
	
		if ( !ply:IsValid() or !ply:Alive() or ply:InVehicle() or ply:GetViewEntity() != ply or ply:IsAiming() or ply:IsCSBHoldingTool()) then ply:CrosshairClientToggle(true) return end
	
		if ply:FirstPersonAnims() and ply:ShouldDrawLocalPlayer() and GetConVar("csb_thirdperson"):GetBool() then
			
			local tr = ply:GetEyeTrace()

			local ent = tr.Entity
			
			local pos = tr.HitPos:ToScreen()
			local crossMoveScale = GetConVar("csb_thirdperson_crosshair_movement_scale"):GetFloat()
			--local crossScale = GetConVar("csb_thirdperson_crosshair_scale"):GetFloat()
			local movement = (ply:GetVelocity():Length()/100)*crossMoveScale
		
			ply:CrosshairClientToggle(false)
		
			if movement > 80 then movement = 80 end
		
			local crossBR = GetConVar("csb_thirdperson_crosshair_bg_color_r"):GetFloat()
			local crossBG = GetConVar("csb_thirdperson_crosshair_bg_color_g"):GetFloat()
			local crossBB = GetConVar("csb_thirdperson_crosshair_bg_color_b"):GetFloat()
			local crossBA = GetConVar("csb_thirdperson_crosshair_bg_color_a"):GetFloat()
		
			local crossR = crossR or 255
			local crossG = crossG or 255
			local crossB = crossB or 255
			local crossA = crossA or GetConVar("csb_thirdperson_crosshair_color_a"):GetFloat()
			
			if IsValid(ent) and ((ent:IsNPC() and ply:IsNPCFriend(ent) and !IsNPCIgnored(ent)) or (ent:IsPlayer() and ply:IsPlayerFriend(ent))) then
				
				crossR = GetConVar("csb_thirdperson_crosshair_a_color_r"):GetFloat()
				crossG = GetConVar("csb_thirdperson_crosshair_a_color_g"):GetFloat()
				crossB = GetConVar("csb_thirdperson_crosshair_a_color_b"):GetFloat()
				
			elseif IsValid(ent) and ((ent:IsNPC() and !ply:IsNPCFriend(ent) and !IsNPCIgnored(ent)) or (ent:IsPlayer() and !ply:IsPlayerFriend(ent))) then
			
				crossR = GetConVar("csb_thirdperson_crosshair_e_color_r"):GetFloat()
				crossG = GetConVar("csb_thirdperson_crosshair_e_color_g"):GetFloat()
				crossB = GetConVar("csb_thirdperson_crosshair_e_color_b"):GetFloat()
			
			else
			
				crossR = GetConVar("csb_thirdperson_crosshair_color_r"):GetFloat()
				crossG = GetConVar("csb_thirdperson_crosshair_color_g"):GetFloat()
				crossB = GetConVar("csb_thirdperson_crosshair_color_b"):GetFloat()
			
			end
	
			draw.RoundedBox(0, pos.x - 26-movement, pos.y - 2, 15 , 3, Color(crossBR,crossBG,crossBB,crossBA))
			draw.RoundedBox(0, pos.x + 10+movement, pos.y - 2, 15 , 3, Color(crossBR,crossBG,crossBB,crossBA))
			draw.RoundedBox(0, pos.x - 2, pos.y - 26-movement, 3 , 15, Color(crossBR,crossBG,crossBB,crossBA))
			draw.RoundedBox(0, pos.x - 2, pos.y + 10+movement, 3 , 15, Color(crossBR,crossBG,crossBB,crossBA))
	
			draw.RoundedBox(0, pos.x - 25-movement, pos.y - 1, 15 , 1, Color(crossR,crossG,crossB,crossA))
			draw.RoundedBox(0, pos.x + 9+movement, pos.y - 1, 15 , 1, Color(crossR,crossG,crossB,crossA))
			draw.RoundedBox(0, pos.x - 1, pos.y - 25-movement, 1 , 15, Color(crossR,crossG,crossB,crossA))
			draw.RoundedBox(0, pos.x - 1, pos.y + 9+movement, 1 , 15, Color(crossR,crossG,crossB,crossA))
	
		else
	
			ply:CrosshairClientToggle(true)
	
		end
	
		if GetConVar("csb_allow_abilities"):GetBool() and ply:GetCSBSuit().UseCSBHud == true and !ply:IsWorldClicking() and suit.SuitAbilityIconColorTab then
	
			local ply = LocalPlayer()
			local colTab = suit.SuitAbilityIconColorTab
			
			local scrWidth = 1920
			local scrHeight = 1080

			local multX = ScrW() / scrWidth
			local multY = ScrH() / scrHeight
			
			local posPX = GetConVar("csb_primary_ability_pos_x"):GetFloat()
			local posPY = GetConVar("csb_primary_ability_pos_y"):GetFloat()
			local posSX = GetConVar("csb_secondary_ability_pos_x"):GetFloat()
			local posSY = GetConVar("csb_secondary_ability_pos_y"):GetFloat()
			
			local posPW = 10*posPX
			local posPH = 10*posPY
			
			local posSW = 10*posSX
			local posSH = 10*posSY
	
			if suit.SuitAbilityPrimaryIcon != false then
				
				draw.RoundedBox( 8, (posPW + 36.5) * multX, (posPH + 813) * multY, 80 * multX, 80 * multY, Color( 0, 0, 0, 155 ) )
				
				local colP = colTab.primary
				
				draw.RoundedBox( 8, (posPW + 42) * multX, (posPH + 817.5) * multY, 70 * multX, 70 * multY, colP )
				
				surface.SetMaterial( Material( suit.SuitAbilityPrimaryIcon ) )
				surface.SetDrawColor( Color( 255, 255, 255, 255 ) )
				surface.DrawTexturedRect( (posPW + 42) * multX, (posPH + 817.5) * multY, 70 * multX, 70 * multY )
			
			end

			if suit.SuitAbilitySecondaryIcon != false then 
				
				draw.RoundedBox( 8,  (posSW + 296.5) * multX, (posSH + 813) * multY, 80 * multX, 80 * multY, Color( 0, 0, 0, 155 ) )
				
				local colS = colTab.secondary
				
				draw.RoundedBox( 8, (posSW + 301.5) * multX, (posSH + 817.5) * multY, 70 * multX, 70 * multY, colS )
				
				surface.SetMaterial( Material( suit.SuitAbilitySecondaryIcon ) )
				surface.SetDrawColor( Color( 255, 255, 255, 255 ) )
				surface.DrawTexturedRect( (posSW + 301.5) * multX, (posSH + 817.5) * multY, 70 * multX, 70 * multY )
			
			end
		
		end
	
	end)

	hook.Add( "RenderScreenspaceEffects", "CSB_OverlayHandler", function()

		local ply = LocalPlayer()
	
		if ply:IsCSBUser() and ply:GetCSBSuit().SuitOverlay and ply:FirstPersonAnims() and !ply:ShouldDrawLocalPlayer() and !ply:InVehicle() and GetConVar("csb_overlay_enable"):GetBool() and !ply:IsAiming() and !ply:IsCSBHoldingTool() and !GetConVar("csb_thirdperson"):GetBool() then
		
			local suit = ply:GetCSBSuit()
			local overTab = suit.SuitOverlay
		
			if overTab.overlay then DrawMaterialOverlay( overTab.overlay.texture, overTab.overlay.refract ) end
			if overTab.colormod then DrawColorModify( overTab.colormod ) end 
		
		end
	
	end)

end