sound.Add( {
	name = "CSB.UI.Menu.Open",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/menu_open.wav",
} )

sound.Add( {
	name = "CSB.UI.Menu.Close",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/menu_close.wav",
} )

sound.Add( {
	name = "CSB.UI.Deny",
	channel = CHAN_ITEM,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 60,
	sound = "buttons/button16.wav",
} )

sound.Add( {
	name = "CSB.UI.Click",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/click.wav",
} )

sound.Add( {
	name = "CSB.UI.Hover",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/hover.wav",
} )

sound.Add( {
	name = "CSB.UI.List.Open",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/list_open.wav",
} )

sound.Add( {
	name = "CSB.UI.List.Close",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/list_close.wav",
} )

sound.Add( {
	name = "CSB.UI.Text",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/text.wav",
} )

sound.Add( {
	name = "CSB.UI.Slider",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = "csb/ui/slider_apply.wav",
} )

if SERVER then

util.AddNetworkString("CSB_Action1")
net.Receive("CSB_Action1", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction1()
end)

util.AddNetworkString("CSB_Action2")
net.Receive("CSB_Action2", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction2()
end)

util.AddNetworkString("CSB_Action3")
net.Receive("CSB_Action3", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction3()
end)

util.AddNetworkString("CSB_Action4")
net.Receive("CSB_Action4", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction4()
end)

util.AddNetworkString("CSB_Action5")
net.Receive("CSB_Action5", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction5()
end)

util.AddNetworkString("CSB_Action6")
net.Receive("CSB_Action6", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction6()
end)

util.AddNetworkString("CSB_Action7")
net.Receive("CSB_Action7", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction7()
end)

util.AddNetworkString("CSB_Action8")
net.Receive("CSB_Action8", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction8()
end)

util.AddNetworkString("CSB_Action9")
net.Receive("CSB_Action9", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSBAction9()
end)


util.AddNetworkString("CSB_NPCCommand1")
net.Receive("CSB_NPCCommand1", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand1()
end)

util.AddNetworkString("CSB_NPCCommand2")
net.Receive("CSB_NPCCommand2", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand2()
end)

util.AddNetworkString("CSB_NPCCommand3")
net.Receive("CSB_NPCCommand3", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand3()
end)

util.AddNetworkString("CSB_NPCCommand4")
net.Receive("CSB_NPCCommand4", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand4()
end)

util.AddNetworkString("CSB_NPCCommand5")
net.Receive("CSB_NPCCommand5", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand5()
end)

util.AddNetworkString("CSB_NPCCommand6")
net.Receive("CSB_NPCCommand6", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand6()
end)

util.AddNetworkString("CSB_NPCCommand7")
net.Receive("CSB_NPCCommand7", function(_, ply)
ply:GetNW2Entity("CSB_UserSuit"):CSB_NPCCommand7()
end)

elseif CLIENT then

function CSB_ActionMenu()

	local ply = LocalPlayer()	
	if !ply:IsCSBUser() then return end	
	
	local plymenudata = ply:GetNW2Entity("CSB_UserSuit").CSBActionMenuData -- .CSBActionMenuData.title / .CSBActionMenuData.button1-9
	local colorM = plymenudata.menuc
	local colorB = plymenudata.buttonc	
	local colorBH = plymenudata.buttonchover	
	local tF = plymenudata.tfont	
	local colorT = plymenudata.tcolor
	
	local h = ScrH()
	local w = ScrW()

	local function CSB_CreateButton( x, y, w, h, text, parent, click )
		local dbutton = vgui.Create( "DButton", parent )
		dbutton:SetParent( parent )
		dbutton:SetPos( x, y)
		dbutton:SetSize( w, h )
		dbutton:SetText( text )
		dbutton:SetFont( tF )
		dbutton:SetTextColor( colorT )
		dbutton:SetParent( parent )
		dbutton.Paint = function( self, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, colorB )
		end
		dbutton.OnCursorEntered = function()
			dbutton.Paint = function( self, w, h )
				draw.RoundedBox( 8, 3, 3, w - 6, h - 6, colorBH )
			end
		end
		dbutton.OnCursorExited = function()
			dbutton.Paint = function( self, w, h )
				draw.RoundedBox( 8, 0, 0, w, h, colorB )
			end
		end
		function dbutton:DoClick()
			click()
		end
	end

	local AMFrame = vgui.Create( "DFrame" )
	AMFrame:SetTitle( plymenudata.title )
	AMFrame:SetSize(430, 500)
	AMFrame:Center()
	AMFrame:SetVisible( true )
	AMFrame:SetDraggable( true )
	AMFrame:ShowCloseButton( false )
	AMFrame:MakePopup()
	AMFrame.OnClose = function ()

	end
	AMFrame.Paint = function( self, w, h )
		draw.RoundedBox( 8, 0, 0, w, h, colorM )
	end

	CSB_CreateButton( 370, 4, 50, 16, "Close", AMFrame, function()
		AMFrame:Close()
	end)
	
	if plymenudata.button1 != "none" then
		CSB_CreateButton( 220, 50, 200, 40, plymenudata.button1, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action1")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button2 != "none" then
		CSB_CreateButton( 220, 100, 200, 40, plymenudata.button2, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action2")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button3 != "none" then
		CSB_CreateButton( 220, 150, 200, 40, plymenudata.button3, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action3")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button4 != "none" then
		CSB_CreateButton( 220, 200, 200, 40, plymenudata.button4, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action4")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button5 != "none" then
		CSB_CreateButton( 220, 250, 200, 40, plymenudata.button5, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action5")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button6 != "none" then
		CSB_CreateButton( 220, 300, 200, 40, plymenudata.button6, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action6")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button7 != "none" then
		CSB_CreateButton( 220, 350, 200, 40, plymenudata.button7, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action7")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button8 != "none" then
		CSB_CreateButton( 220, 400, 200, 40, plymenudata.button8, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action8")
			net.SendToServer() 
		end)
	end
	
	if plymenudata.button9 != "none" then
		CSB_CreateButton( 220, 450, 200, 40, plymenudata.button9, AMFrame, function()
			AMFrame:Close()
			net.Start("CSB_Action9")
			net.SendToServer() 
		end)
	end
	
	CSB_CreateButton( 10, 50, 200, 40, "Squad: Help!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand1")
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 10, 100, 200, 40, "Squad: Advance!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand2")
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 10, 150, 200, 40, "Squad: Forward!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand3")
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 10, 200, 200, 40, "Squad: Follow!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand4")
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 10, 250, 200, 40, "Squad: Stop!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand5")
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 10, 300, 200, 40, "Squad: Patrol!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand6")
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 10, 350, 200, 40, "Squad: Take Cover!", AMFrame, function()
		AMFrame:Close()
		net.Start("CSB_NPCCommand7")
		net.SendToServer() 
	end)
	
end

net.Receive("CSB_ActionMenu", CSB_ActionMenu)

function CSB_SAM_Interface( tab )

	EmitSound( "CSB.UI.Menu.Open", Vector(0 ,0 ,0 ), -2 )

	local ply = LocalPlayer()

	if isnumber(tab) then tab = net.ReadTable() end
	
	local newtab = tab	
	
	if !ply:IsCSBUser() then return end	
	
	local h = ScrH()
	local w = ScrW()

	local function CSB_CreateButton( x, y, w, h, text, tooltp, parent, click )
		local dbutton = vgui.Create( "DButton", parent )
		dbutton:SetParent( parent )
		dbutton:SetPos( x, y)
		dbutton:SetSize( w, h )
		dbutton:SetText( text )
		dbutton:SetTextColor( Color ( 100, 100, 100, 255 ) )
		dbutton:SetFont( "DermaDefaultBold" )
		dbutton:SetParent( parent )
		dbutton:SetTooltip(tooltp)
		dbutton.Paint = function( self, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, Color( 200, 200, 200, 255 ) )
		end
		dbutton.OnCursorEntered = function()
			dbutton.Paint = function( self, w, h )
				draw.RoundedBox( 8, 3, 3, w - 6, h - 6, Color( 150, 150, 150, 255 ) )
			end
			EmitSound( "CSB.UI.Hover", Vector(0 ,0 ,0 ), -2 )
		end
		dbutton.OnCursorExited = function()
			dbutton.Paint = function( self, w, h )
				draw.RoundedBox( 8, 0, 0, w, h, Color( 200, 200, 200, 255 ) )
			end
		end
		function dbutton:DoClick()
			click()
		end
	end
	
	local function CSB_HighlightTextColor(dpanel, r1, g1, b1, timed, r2, g2, b2)
	
		dpanel:SetTextColor( Color( r1, g1, b1, 255 ) )
		
		timer.Create("SAM_UI_Normal", timed, 1, function()
		
			if !IsValid(dpanel) then return end
			
			dpanel:SetTextColor( Color( r2, g2, b2, 255 ) )
			
		end)
	
	end

	local samFrame = vgui.Create( "DFrame" )
	samFrame:SetTitle( "" )
	--samFrame:SetFont( "DebugFixed" )
	--samFrame:SetFontInternal( "DebugFixed" )
	--samFrame:SetTextColor( Color ( 0, 0, 0, 255 ) )
	samFrame:SetSize(450, 350)
	samFrame:Center()
	samFrame:SetVisible( true )
	samFrame:SetDraggable( true )
	samFrame:ShowCloseButton( false )
	samFrame:NoClipping( true )
	samFrame:SetSizable( true )
	samFrame:SetMinWidth( samFrame:GetWide() )
	samFrame:SetMinHeight( samFrame:GetTall() )
	--samFrame:SetIcon("vgui/csb_ico2.png")
	samFrame:MakePopup()
	function samFrame:PerformLayout()

		self:SetFontInternal( "ChatFont" )
		self:SetFGColor( color_white )
	
	end
	samFrame.OnClose = function ()
	
		EmitSound( "CSB.UI.Menu.Close", Vector(0 ,0 ,0 ), -2 )
	
	end
	samFrame.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 50, 50, 50, 200 ) )
		
	end
	
	local samFrameIco = vgui.Create( "DImage", samFrame )
	samFrameIco:SetImage( "vgui/sam_interface_logo" )
	samFrameIco:SetPos( 10, 5 )
	samFrameIco:SetSize( 80, 20 )

--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
	--[[
	local samMdlBG = vgui.Create( "DImage", samFrame )
	samMdlBG:SetImage( "effects/prisonmap_disp" )
	samMdlBG:SetPos( 250, 90 )
	samMdlBG:SetSize( 200, 300 )
	samMdlBG.Paint = function( self, w, h )
	
		local texturedQuadStructure = {
		texture = surface.GetTextureID( "effects/prisonmap_disp" ),
		color   = Color( 255, 255, 255, 255 ),
		x 	= 0,
		y 	= 0,
		w 	= w,
		h 	= h
	}

	draw.TexturedQuad( texturedQuadStructure )
		
	end
	]]
	local samMdl = vgui.Create("DModelPanel", samFrame )
	samMdl:SetPos( 210, 60 )
	samMdl:SetSize( 280, 340 )
	samMdl:SetAnimated( true )
	samMdl:SetModel( newtab.model )
	samMdl:SetColor( newtab.color )
	samMdl:SetTooltip("Suit's Visualization.")
	function samMdl:LayoutEntity( ent )
	
		ent:SetSequence( tab.seq )
		ent:SetAngles( Angle(0, RealTime()*20,  0) )
		ent:SetSubMaterial(0, tab.material )
		ent:SetSkin( tab.skin )
		
		for i = 1,#tab.bodygtab do
			
			ent:SetBodygroup(i,tab.bodygtab[i])

		end
		
	end
	
	local samEnt = samMdl:GetEntity()
	
--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
	
	local samSuitColor = vgui.Create( "DColorCombo", samFrame )
	samSuitColor:SetPos( 10, 110 )
	samSuitColor:SetSize( 256, 230 )
	samSuitColor:SetColor( newtab.color )
	samSuitColor:SetTooltip("Color of your suit.")
	function samSuitColor:OnValueChanged( col )
		
		samMdl:SetColor( col )
		newtab.color = col
		
	--	if samSuitColor.snd != true then
		--	samSuitColor.snd = true
		--	EmitSound( "CSB.UI.Spray", Vector(0 ,0 ,0 ), -2 )
		--end
		
		--timer.Create("CSB_sam_ColorChange", 0.1, 1, function()
		--if samSuitColor:IsEditing() != true then
		--	samSuitColor.snd = false
		--end
		--end)
		
	end

--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

	local samHeadBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samHeadBase:SetLabel( "Head Rotation" )		
	samHeadBase:SetPos( 95, 105 )
	samHeadBase:SetSize( 170, 550 )
	samHeadBase:SetExpanded( false )
	samHeadBase:SetTooltip("Here you can enforce head rotation on models that don't support it. Wont work on models that do that.")
	samHeadBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samHeadBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samHeadSP = vgui.Create( "DScrollPanel", samFrame )
	samHeadSP:SetSize( 170, 250 )
	samHeadBase:SetContents( samHeadSP )
	
	local samHeadLabel = samHeadSP:Add( "DLabel", samFrame )
	samHeadLabel:SetPos( 5, 0 )
	samHeadLabel:SetWidth( 100 )
	samHeadLabel:SetText( "Head Bone:" )
	samHeadLabel:SetFont( "DermaDefaultBold" )
	samHeadLabel:SetTooltip("Name of the bone that should count as the Head.")
	samHeadLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samHeadBoneText = samHeadSP:Add( "DTextEntry" ) 
	samHeadBoneText:SetPos( 1, 17 )
	samHeadBoneText:SetSize( 168, 17 )
	samHeadBoneText:SetFont( "DermaDefaultBold" )
	samHeadBoneText:SetTooltip("Name of the bone that should count as the Head.")
	samHeadBoneText:SetTextColor( Color ( 100, 100, 100, 255 ) )

	if tab.headtab && tab.headtab.headbone != "" then
	samHeadBoneText:SetText( tab.headtab.headbone )
	end
	
	function samHeadBoneText:OnEnter( text )
		
		local validBone = samEnt:LookupBone(text)

		if validBone || text == "" then
			
			newtab.headtab.headbone = text
			
			EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
			CSB_HighlightTextColor(samHeadBoneText, 0, 255, 0, 0.5, 0, 0, 0)
			
		else
		
			EmitSound( "CSB.UI.Deny", Vector(0 ,0 ,0 ), -2 )		
			CSB_HighlightTextColor(samHeadBoneText, 255, 0, 0, 0.5, 0, 0, 0)
		
		end
		
	end
	
	local samHeadYawLabel = samHeadSP:Add( "DLabel", samFrame )
	samHeadYawLabel:SetPos( 5, 45 )
	samHeadYawLabel:SetWidth( 100 )
	samHeadYawLabel:SetText( "Max/Min Yaw:" )
	samHeadYawLabel:SetFont( "DermaDefaultBold" )
	samHeadYawLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samHeadYawWang = samHeadSP:Add( "DNumberWang", samFrame )
	samHeadYawWang:SetPos( 95, 48 )
	samHeadYawWang:SetSize( 45, 17 )
	samHeadYawWang:SetMin( 0 )
	samHeadYawWang:SetMax( 1e8 )
	samHeadYawWang:SetTooltip("Max and min Yaw (left/right).")
	
	if tab.headtab && tab.headtab.yawlimit != "" then
	samHeadYawWang:SetValue( tab.headtab.yawlimit )
	end
	
	samHeadYawWang:SetDecimals( 1 )
	function samHeadYawWang:OnValueChanged( val )
	
		newtab.headtab.yawlimit = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samHeadPitchLabel = samHeadSP:Add( "DLabel", samFrame )
	samHeadPitchLabel:SetPos( 5, 65 )
	samHeadPitchLabel:SetWidth( 100 )
	samHeadPitchLabel:SetText( "Max/Min Pitch:" )
	samHeadPitchLabel:SetFont( "DermaDefaultBold" )
	samHeadPitchLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samHeadPitchWang = samHeadSP:Add( "DNumberWang", samFrame )
	samHeadPitchWang:SetPos( 95, 68 )
	samHeadPitchWang:SetSize( 45, 17 )
	samHeadPitchWang:SetMin( 0 )
	samHeadPitchWang:SetMax( 1e8 )
	samHeadPitchWang:SetTooltip("Max and min Pitch (up/down).")
	
	if tab.headtab && tab.headtab.pitchlimit != "" then
	samHeadPitchWang:SetValue( tab.headtab.pitchlimit )
	end
	
	samHeadPitchWang:SetDecimals( 1 )
	function samHeadPitchWang:OnValueChanged( val )
	
		newtab.headtab.pitchlimit = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samHeadRollLabel = samHeadSP:Add( "DLabel", samFrame )
	samHeadRollLabel:SetPos( 5, 85 )
	samHeadRollLabel:SetWidth( 100 )
	samHeadRollLabel:SetText( "Max/Min Roll:" )
	samHeadRollLabel:SetFont( "DermaDefaultBold" )
	samHeadRollLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samHeadRollWang = samHeadSP:Add( "DNumberWang", samFrame )
	samHeadRollWang:SetPos( 95, 88 )
	samHeadRollWang:SetSize( 45, 17 )
	samHeadRollWang:SetMin( 0 )
	samHeadRollWang:SetMax( 1e8 )
	samHeadRollWang:SetTooltip("Max and min Roll (head tilt based on the head direction).")
	
	if tab.headtab && tab.headtab.rolllimit != "" then
	samHeadRollWang:SetValue( tab.headtab.rolllimit )
	end
	
	samHeadRollWang:SetDecimals( 1 )
	function samHeadRollWang:OnValueChanged( val )
	
		newtab.headtab.rolllimit = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
	
	local samSkinBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samSkinBase:SetLabel( "Skin & Texture" )		
	samSkinBase:SetPos( 10, 80 )
	samSkinBase:SetSize( 255, 550 )
	samSkinBase:SetExpanded( false )
	samSkinBase:SetTooltip("Here you can change Suit's skin and texture(material).")
	samSkinBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samSkinBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samSkinSP = vgui.Create( "DScrollPanel", samFrame )
	samSkinSP:SetSize( 170, 250 )
	samSkinBase:SetContents( samSkinSP )
	
	local samSkinLabel = samSkinSP:Add( "DLabel", samFrame )
	samSkinLabel:SetPos( 5, 0 )
	samSkinLabel:SetWidth( 50 )
	samSkinLabel:SetText( "Skins:" )
	samSkinLabel:SetFont( "DermaDefaultBold" )
	samSkinLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	if samEnt:SkinCount() > 1 then
	
		local samSkinSlider = samSkinSP:Add( "DNumSlider", samFrame )
		samSkinSlider:SetPos( -140, 10 )
		samSkinSlider:SetWidth( 340 )
		samSkinSlider:SetMin( 0 ) 
		samSkinSlider:SetMax( samEnt:SkinCount() ) 
		samSkinSlider:SetValue( samEnt:GetSkin() ) 
		samSkinSlider:SetDecimals( 0 )
		samSkinSlider:SetTooltip("Suit's skin.")
		function samSkinSlider:ValueChanged(v)
			
			local rV = math.Round(v)
			
			if samEnt:GetSkin() == rV && samSkinSlider.snd == false then
				EmitSound( "CSB.UI.Slider", Vector(0 ,0 ,0 ), -2 )
				samSkinSlider.snd = true
			elseif samEnt:GetSkin() != rV && samSkinSlider.snd != false then
				samSkinSlider.snd = false
			end
			
			samEnt:SetSkin(v)
			newtab.skin = v
			
		end
	
	else
	
		local samNoSkin = samSkinSP:Add( "DLabel", samFrame )
		samNoSkin:SetPos( 5, 17 )
		samNoSkin:SetWidth( 200 )
		samNoSkin:SetText( "NO SKINS AVAILABLE" )
		samNoSkin:SetFont( "DermaDefaultBold" )
		samNoSkin:SetTextColor( Color ( 200, 200, 200, 255 ) )
	
	end
	
	local samMaterialLabel = samSkinSP:Add( "DLabel", samFrame )
	samMaterialLabel:SetPos( 5, 35 )
	samMaterialLabel:SetWidth( 100 )
	samMaterialLabel:SetText( "Texture:" )
	samMaterialLabel:SetFont( "DermaDefaultBold" )
	samMaterialLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samMaterialText = samSkinSP:Add( "DTextEntry" ) 
	samMaterialText:SetPos( 1, 52 )
	samMaterialText:SetSize( 253, 17 )
	samMaterialText:SetFont( "DermaDefaultBold" )
	samMaterialText:SetTooltip("Texture/Material.")
	samMaterialText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	if tab.material then
	samMaterialText:SetText( tab.material )
	end
	function samMaterialText:OnEnter( text )
		
		samEnt:SetSubMaterial(0, text)
		newtab.material = text	
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
		CSB_HighlightTextColor(samMaterialText, 0, 255, 0, 0.5, 0, 0, 0)
		
	end
	
--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

	local samStatsBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samStatsBase:SetLabel( "Suit Stats" )		
	samStatsBase:SetPos( 270, 105 )
	samStatsBase:SetSize( 170, 550 )
	samStatsBase:SetExpanded( false )
	samStatsBase:SetTooltip("Here you can set basics Suit's statistics (health/armor/etc).")
	samStatsBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samStatsBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samStatsSP = vgui.Create( "DScrollPanel", samFrame )
	samStatsSP:SetSize( 170, 250 )
	samStatsBase:SetContents( samStatsSP )
	
	local samStatsRUNLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsRUNLabel:SetPos( 5, 5 )
	samStatsRUNLabel:SetWidth( 100 )
	samStatsRUNLabel:SetText( "Run Speed:" )
	samStatsRUNLabel:SetFont( "DermaDefaultBold" )
	samStatsRUNLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsRUNWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsRUNWang:SetPos( 120, 7 )
	samStatsRUNWang:SetSize( 45, 17 )
	samStatsRUNWang:SetMin( 0 )
	samStatsRUNWang:SetMax( 1e8 )
	samStatsRUNWang:SetTooltip("Sprint speed.")
	
	if tab.statstab && tab.statstab.runspeed != "" then
	samStatsRUNWang:SetValue( tab.statstab.runspeed )
	end
	
	samStatsRUNWang:SetDecimals( 1 )
	function samStatsRUNWang:OnValueChanged( val )
	
		newtab.statstab.runspeed = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end

	
	local samStatsWALKLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsWALKLabel:SetPos( 5, 25 )
	samStatsWALKLabel:SetWidth( 100 )
	samStatsWALKLabel:SetText( "Walk Speed:" )
	samStatsWALKLabel:SetFont( "DermaDefaultBold" )
	samStatsWALKLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsWALKWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsWALKWang:SetPos( 120, 27 )
	samStatsWALKWang:SetSize( 45, 17 )
	samStatsWALKWang:SetMin( 0 )
	samStatsWALKWang:SetMax( 1e8 )
	samStatsWALKWang:SetTooltip("Sprint speed.")
	
	if tab.statstab && tab.statstab.walkspeed != "" then
	samStatsWALKWang:SetValue( tab.statstab.walkspeed )
	end
	
	samStatsWALKWang:SetDecimals( 1 )
	function samStatsWALKWang:OnValueChanged( val )
	
		newtab.statstab.walkspeed = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsSWALKLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsSWALKLabel:SetPos( 5, 45 )
	samStatsSWALKLabel:SetWidth( 100 )
	samStatsSWALKLabel:SetText( "Slow Walk Speed:" )
	samStatsSWALKLabel:SetFont( "DermaDefaultBold" )
	samStatsSWALKLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsSWALKWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsSWALKWang:SetPos( 120, 47 )
	samStatsSWALKWang:SetSize( 45, 17 )
	samStatsSWALKWang:SetMin( 0 )
	samStatsSWALKWang:SetMax( 1e8 )
	samStatsSWALKWang:SetTooltip("Walk speed.")
	
	if tab.statstab && tab.statstab.walkaltspeed != "" then
	samStatsSWALKWang:SetValue( tab.statstab.walkaltspeed )
	end
	
	samStatsSWALKWang:SetDecimals( 1 )
	function samStatsSWALKWang:OnValueChanged( val )
	
		newtab.statstab.walkaltspeed = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsCROUCHLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsCROUCHLabel:SetPos( 5, 65 )
	samStatsCROUCHLabel:SetWidth( 150 )
	samStatsCROUCHLabel:SetText( "Crouch Speed:" )
	samStatsCROUCHLabel:SetFont( "DermaDefaultBold" )
	samStatsCROUCHLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsCROUCHWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsCROUCHWang:SetPos( 120, 67 )
	samStatsCROUCHWang:SetSize( 45, 17 )
	samStatsCROUCHWang:SetMin( 0 )
	samStatsCROUCHWang:SetMax( 1e8 )
	samStatsCROUCHWang:SetTooltip("Crouch walk speed (it's a multiplier).")

	if tab.statstab && tab.statstab.crouchspeed != "" then
	samStatsCROUCHWang:SetValue( tab.statstab.crouchspeed )
	end
	
	samStatsCROUCHWang:SetDecimals( 1 )
	function samStatsCROUCHWang:OnValueChanged( val )
	
		newtab.statstab.crouchspeed = val
		
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsJUMPLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsJUMPLabel:SetPos( 5, 85 )
	samStatsJUMPLabel:SetWidth( 150 )
	samStatsJUMPLabel:SetText( "Jump Power:" )
	samStatsJUMPLabel:SetFont( "DermaDefaultBold" )
	samStatsJUMPLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsJUMPWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsJUMPWang:SetPos( 120, 87 )
	samStatsJUMPWang:SetSize( 45, 17 )
	samStatsJUMPWang:SetMin( 0 )
	samStatsJUMPWang:SetMax( 1e8 )
	samStatsJUMPWang:SetTooltip("Jump height.")

	if tab.statstab && tab.statstab.jumppower != "" then
	samStatsJUMPWang:SetValue( tab.statstab.jumppower )
	end
	
	samStatsJUMPWang:SetDecimals( 1 )
	function samStatsJUMPWang:OnValueChanged( val )
	
		newtab.statstab.jumppower = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsHEALTHLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsHEALTHLabel:SetPos( 5, 115 )
	samStatsHEALTHLabel:SetWidth( 150 )
	samStatsHEALTHLabel:SetText( "Health:" )
	samStatsHEALTHLabel:SetFont( "DermaDefaultBold" )
	samStatsHEALTHLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsHEALTHWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsHEALTHWang:SetPos( 120, 117 )
	samStatsHEALTHWang:SetSize( 45, 17 )
	samStatsHEALTHWang:SetMin( 0 )
	samStatsHEALTHWang:SetMax( 1e8 )
	samStatsHEALTHWang:SetTooltip("Amount of health to be set after S.A.M.'s application.")
	
	if tab.statstab && tab.statstab.health != "" then
	samStatsHEALTHWang:SetValue( tab.statstab.health )
	end
	
	samStatsHEALTHWang:SetDecimals( 1 )
	function samStatsHEALTHWang:OnValueChanged( val )
	
		newtab.statstab.health = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsHEALTHmLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsHEALTHmLabel:SetPos( 5, 135 )
	samStatsHEALTHmLabel:SetWidth( 150 )
	samStatsHEALTHmLabel:SetText( "Max Health:" )
	samStatsHEALTHmLabel:SetFont( "DermaDefaultBold" )
	samStatsHEALTHmLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsHEALTHmWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsHEALTHmWang:SetPos( 120, 137 )
	samStatsHEALTHmWang:SetSize( 45, 17 )
	samStatsHEALTHmWang:SetMin( 0 )
	samStatsHEALTHmWang:SetMax( 1e8 )
	samStatsHEALTHmWang:SetTooltip("Max health.")
	
	if tab.statstab && tab.statstab.healthmax != "" then
	samStatsHEALTHmWang:SetValue( tab.statstab.healthmax )
	end
	
	samStatsHEALTHmWang:SetDecimals( 1 )
	function samStatsHEALTHmWang:OnValueChanged( val )
	
		newtab.statstab.healthmax = val
		
		samStatsHEALTHWang:SetValue( val )
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsARMORLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsARMORLabel:SetPos( 5, 155 )
	samStatsARMORLabel:SetWidth( 150 )
	samStatsARMORLabel:SetText( "Armor:" )
	samStatsARMORLabel:SetFont( "DermaDefaultBold" )
	samStatsARMORLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsARMORWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsARMORWang:SetPos( 120, 157 )
	samStatsARMORWang:SetSize( 45, 17 )
	samStatsARMORWang:SetMin( 0 )
	samStatsARMORWang:SetMax( 1e8 )
	samStatsARMORWang:SetTooltip("Amount of armor to be set after S.A.M.'s application.")
	
	if tab.statstab && tab.statstab.armor != "" then
	samStatsARMORWang:SetValue( tab.statstab.armor )
	end
	
	samStatsARMORWang:SetDecimals( 1 )
	function samStatsARMORWang:OnValueChanged( val )
	
		newtab.statstab.armor = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samStatsARMORmLabel = samStatsSP:Add( "DLabel", samFrame )
	samStatsARMORmLabel:SetPos( 5, 175 )
	samStatsARMORmLabel:SetWidth( 150 )
	samStatsARMORmLabel:SetText( "Max Armor:" )
	samStatsARMORmLabel:SetFont( "DermaDefaultBold" )
	samStatsARMORmLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samStatsARMORmWang = samStatsSP:Add( "DNumberWang", samFrame )
	samStatsARMORmWang:SetPos( 120, 177 )
	samStatsARMORmWang:SetSize( 45, 17 )
	samStatsARMORmWang:SetMin( 0 )
	samStatsARMORmWang:SetMax( 1e8 )
	samStatsARMORmWang:SetTooltip("Max armor.")
	
	if tab.statstab && tab.statstab.armormax != "" then
	samStatsARMORmWang:SetValue( tab.statstab.armormax )
	end
	
	samStatsARMORmWang:SetDecimals( 1 )
	function samStatsARMORmWang:OnValueChanged( val )
	
		newtab.statstab.armormax = val
			
		samStatsARMORWang:SetValue( val )
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
	
	local samVJClassBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samVJClassBase:SetLabel( "VJ Class" )		
	samVJClassBase:SetPos( 270, 80 )
	samVJClassBase:SetSize( 170, 550 )
	samVJClassBase:SetExpanded( false )
	samVJClassBase:SetTooltip("Here you can set which VJ SNPCs are friendly to you by using CLASS_* system (same as the SNPCs).")
	samVJClassBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samVJClassBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samVJClassSP = vgui.Create( "DScrollPanel", samFrame )
	samVJClassSP:SetSize( 170, 250 )
	samVJClassBase:SetContents( samVJClassSP )
	
	local samVJClass = samVJClassSP:Add( "DListView", samFrame )
	samVJClass:SetPos( 0, 17 )
	samVJClass:SetSize( 170, 250 )
	samVJClass:SetMultiSelect( false )
	samVJClass:SetSortable( false )
	samVJClass:AddColumn( "VJ CLasses (CLASS_COMBINE)" )
	samVJClass.OnRowRightClick = function( panel, rowIndex, row )
		
		local v = row:GetValue(1)
		local rID = row:GetID()
		
		if table.HasValue(newtab.vjclass, v) then
			samVJClass:RemoveLine( rID )	
			table.RemoveByValue(newtab.vjclass, v)
			EmitSound( "CSB.UI.Menu.Close", Vector(0 ,0 ,0 ), -2 )
		end
		
	end
	
	for i = 1,#tab.vjclass do
		samVJClass:AddLine(tab.vjclass[i])
	end
	
	local samVJClassText = samVJClassSP:Add( "DTextEntry" ) 
	samVJClassText:SetPos( 0, 0 )
	samVJClassText:SetSize( 170, 17 )
	samVJClassText:SetFont( "DermaDefaultBold" )
	samVJClassText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	samVJClassText:SetTooltip("CLASS_* only.")
	--samVJClassText:SetText( "VJ Class (CLASS_COMBINE)" )
	function samVJClassText:OnEnter( text )
		
		--samVJClassText:SetTextColor( Color( 0, 0, 255, 255 ) )

		if string.find( string.lower( text ), "class_") && !table.HasValue(newtab.vjclass, text) then

			samVJClass:AddLine( text )	
			table.insert(newtab.vjclass, text)
			
			EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
			CSB_HighlightTextColor(samVJClassText, 0, 255, 0, 0.5, 0, 0, 0)
		else
		
			EmitSound( "CSB.UI.Deny", Vector(0 ,0 ,0 ), -2 )
			CSB_HighlightTextColor(samVJClassText, 255, 0, 0, 0.5, 0, 0, 0)
		
		end
		
	end
	
	local samAllyListBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samAllyListBase:SetLabel( "Ally List" )		
	samAllyListBase:SetPos( 270, 55 )
	samAllyListBase:SetSize( 170, 550 )
	samAllyListBase:SetExpanded( false )
	samAllyListBase:SetTooltip("Here you can set which any other NPC should be friendly to you.")
	samAllyListBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samAllyListBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samAllyListSP = vgui.Create( "DScrollPanel", samFrame )
	samAllyListSP:SetSize( 170, 250 )
	samAllyListBase:SetContents( samAllyListSP )
	
	local samAllyList = samAllyListSP:Add( "DListView", samFrame )
	samAllyList:SetPos( 0, 17 )
	samAllyList:SetSize( 170, 250 )
	samAllyList:SetMultiSelect( false )
	samAllyList:SetSortable( false )
	samAllyList:AddColumn( "Ally Class (npc_citizen)" )
	samAllyList.OnRowRightClick = function( panel, rowIndex, row )
		
		local vl = row:GetValue(1)
		local rID = row:GetID()
		if samAllyList:GetLine(rID) != nil then samAllyList:RemoveLine( rID ) end
		EmitSound( "CSB.UI.Menu.Close", Vector(0 ,0 ,0 ), -2 )
		
		for k, v in pairs( tab.allylist ) do
		
			if newtab.allylist[k] && k == vl then
			
				newtab.allylist[k] = nil
			
			end
			
		end
		
	end
	
	for k, v in pairs( tab.allylist ) do
		if k != "BaseClass" then
			samAllyList:AddLine(k)
		end
	end
	
	local samAllyText = samAllyListSP:Add( "DTextEntry" ) 
	samAllyText:SetPos( 0, 0 )
	samAllyText:SetSize( 170, 17 )
	samAllyText:SetFont( "DermaDefaultBold" )
	samAllyText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	samAllyText:SetTooltip("Anything except VJ SNPCs (they have their own list).")
	--samAllyText:SetText( "Ally Class (npc_citizen)" )
	function samAllyText:OnEnter( text )
		
		if !newtab.allylist[''.. tostring(text) ..''] then
			samAllyList:AddLine( text )	
			--table.insert(newtab.allylist, text)
			
			local addtab = {[''.. tostring(text) ..''] = true}
			table.Merge(newtab.allylist, addtab)
			
			EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
			CSB_HighlightTextColor(samAllyText, 0, 255, 0, 0.5, 0, 0, 0)
			
		else
			
			EmitSound( "CSB.UI.Deny", Vector(0 ,0 ,0 ), -2 )
			CSB_HighlightTextColor(samAllyText, 255, 0, 0, 0.5, 0, 0, 0)
		
		end
		
	end

--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

	local samBGBase = vgui.Create("DCollapsibleCategory", samFrame)
	samBGBase:SetPos( 10, 55 )
	samBGBase:SetSize( 255, 50 )
	samBGBase:SetExpanded( 0 )
	samBGBase:SetLabel( "Models & Bodygroups" )
	samBGBase:SetTooltip("Here you can change Suit's bodygroups and Hands model.")
	samBGBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samBGBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	samBGList = vgui.Create( "DScrollPanel" )
	samBGList:SetSize( 255, 50 )
	--samBGList:SetAutoSize( true )
	--samBGList:SetSpacing( -10 )
	--samBGList:SetPadding( 5 )
	--samBGList:EnableHorizontal( false )
	--samBGList:EnableVerticalScrollbar( true )

	samBGBase:SetContents( samBGList ) 
	
	local samMdlTextLabel = samBGList:Add( "DLabel", samFrame )
	samMdlTextLabel:SetPos( 5, 0 )
	samMdlTextLabel:SetWidth( 250 )
	samMdlTextLabel:SetText( "Model:" )
	samMdlTextLabel:SetFont( "DermaDefaultBold" )
	samMdlTextLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samMdlText = samBGList:Add( "DTextEntry", samFrame ) 
	samMdlText:SetPos( 1, 17 )
	samMdlText:SetSize( 253, 17 )
	samMdlText:SetFont( "DermaDefaultBold" )
	samMdlText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	samMdlText:SetTooltip("Use this Text Box to set a new model for your suit. It will reload the interface.")
	if tab.model && tab.model != "" then
	samMdlText:SetText( tostring(tab.model) )
	end
	
	function samMdlText:OnEnter( text )
	
		if !string.find( string.lower( text ), ".mdl") then EmitSound( "CSB.UI.Deny", Vector(0 ,0 ,0), -2); CSB_HighlightTextColor(samMdlText, 255, 0, 0, 0.5, 0, 0, 0) end
		
		samEnt:SetModel(text)
		
		samEnt.BGTab = {}
		
		for i = 1,samEnt:GetNumBodyGroups() do
			
		if !table.HasValue(samEnt.BGTab, i) then table.insert(samEnt.BGTab, i) end
		
		end
		
		for i = 1,#samEnt.BGTab do
			
			samEnt.BGTab[i] = samEnt:GetBodygroup(i)
		
		end
		
		local newtab = {
		['model'] = samEnt:GetModel(),
		['vmodel'] = tab.vmodel,
		['material'] = samEnt:GetSubMaterial(0),
		['overlaytab'] = tab.overlaytab,
		['equipmenttab'] = tab.equipmenttab,
		['color'] = samEnt:GetColor(),
		['skin'] = samEnt:GetSkin(),
		['headtab'] = tab.headtab,
		['seq'] = samEnt:GetSequence(),
		['cycle'] = samEnt:GetCycle(),
		['bodygtab'] = samEnt.BGTab,
		['allylist'] = tab.allylist,
		['vjclass'] = tab.vjclass,
		['statstab'] = tab.statstab
		}
		
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
		CSB_HighlightTextColor(samMdlText, 0, 255, 0, 0.5, 0, 0, 0)
		
		samFrame:Close()
		CSB_SAM_Interface( newtab )
		
	end
	
	local samVMLabel = samBGList:Add( "DLabel", samFrame )
	samVMLabel:SetPos( 5, 35 )
	samVMLabel:SetWidth( 80 )
	samVMLabel:SetText( "Hands Model:" )
	samVMLabel:SetFont( "DermaDefaultBold" )
	samVMLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samVMModel = samBGList:Add( "DTextEntry", samFrame ) -- create the form as a child of frame
	samVMModel:SetPos( 1, 52 )
	samVMModel:SetSize( 253, 17 )
	samVMModel:SetFont( "DermaDefaultBold" )
	samVMModel:SetTextColor( Color ( 100, 100, 100, 255 ) )
	samVMModel:SetText( tab.vmodel )
	samVMModel:SetTooltip("View model Hands.")
	function samVMModel:OnEnter( text )
		
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
		--samVMModel:SetTextColor( Color( 0, 0, 255, 255 ) )

		if !string.find( string.lower( text ), ".mdl") then CSB_HighlightTextColor(samVMModel, 255, 0, 0, 0.5, 0, 0, 0); text = tab.vmodel end
		
		newtab.vmodel = text
		
		CSB_HighlightTextColor(samVMModel, 0, 255, 0, 0.5, 0, 0, 0)
		
	end

	for i = 1, samEnt:GetNumBodyGroups() do
		
		if samEnt:GetBodygroupCount(i) > 1 then
			local label = samBGList:Add( "DLabel", samFrame )
			label:SetPos( 5, (i * 30) + 43 )
			label:SetWidth( 200 )
			label:SetText( samEnt:GetBodygroupName(i) .. ":" )
			label:SetFont( "DermaDefaultBold" )
			label:SetTextColor( Color ( 245, 245, 245, 255 ) )
		
			local slider = samBGList:Add( "DNumSlider", samFrame )
			slider:SetPos( -180, (i * 30) + 53 )
			slider:SetWidth( 460 )
			slider:SetMin( 0 ) 
			slider:SetMax( samEnt:GetBodygroupCount(i) - 1 ) 
			slider:SetValue( newtab.bodygtab[i] ) 
			slider:SetDecimals( 0 )
			slider:SetDark( true )	
			function slider:ValueChanged(v)
				
				local rV = math.Round(v)
				
				if samEnt:GetBodygroup(i) == rV && slider.snd == false then
					EmitSound( "CSB.UI.Slider", Vector(0 ,0 ,0 ), -2 )
					slider.snd = true
				elseif samEnt:GetBodygroup(i) != rV && slider.snd != false then
					slider.snd = false
				end
				
				newtab.bodygtab[i] = rV
				samEnt:SetBodygroup(i,rV)
				
			end
		
		end
		
	end
	
	if samEnt:GetNumBodyGroups() <= 1 then
	
		local label = vgui.Create( "DLabel", samFrame )
		label:SetPos( 5, 70 )
		label:SetWidth( 300 )
		label:SetText( "NO BODYGROUPS AVAILABLE" )
		label:SetFont( "DermaDefaultBold" )
		label:SetTextColor( Color ( 200, 200, 200, 255 ) )
			
		samBGList:AddItem( label )
	
	end

--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

	local samEquipmentBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samEquipmentBase:SetLabel( "Equipment" )		
	samEquipmentBase:SetPos( 10, 30 )
	samEquipmentBase:SetSize( 430, 550 )
	samEquipmentBase:SetExpanded( false )
	samEquipmentBase:SetTooltip("Here you can change default equipment provided by the suit.")
	samEquipmentBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samEquipmentBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samEquipmentSP = vgui.Create( "DScrollPanel", samFrame )
	samEquipmentSP:SetSize( 170, 250 )
	samEquipmentBase:SetContents( samEquipmentSP )
	
	local samWeapons = samEquipmentSP:Add( "DListView", samFrame )
	samWeapons:SetPos(0, 17 )
	samWeapons:SetSize(215, 250 )
	samWeapons:SetMultiSelect( false )
	samWeapons:SetSortable( false )
	samWeapons:AddColumn( "Weapons" )
	samWeapons:AddColumn( "Empty Mag" )
	samWeapons.OnRowRightClick = function( panel, rowIndex, row )
		
		local v1 = row:GetValue(1)
		local v2 = row:GetValue(2)
		local rID = row:GetID()
		local wepTab = newtab.equipmenttab.weapons
		
		if samWeapons:GetLine(rID) != nil then samWeapons:RemoveLine( rID ) end
		EmitSound( "CSB.UI.Menu.Close", Vector(0 ,0 ,0 ), -2 )
		
		for i = 1, #wepTab do

			if wepTab[i] && wepTab[i][1] == v1 && wepTab[i][2] == v2 then
			
				table.Empty(wepTab[i])
				table.remove(wepTab, i)
				
			end
		
		end

	end
	
	for i = 1,#tab.equipmenttab.weapons do
		local wepTab = tab.equipmenttab.weapons[i]
		samWeapons:AddLine( wepTab[1] ,wepTab[2] )
	end
	
	local samWeaponsCB = samEquipmentSP:Add( "DCheckBoxLabel", samFrame )
	samWeaponsCB:SetPos( 117, 1 )
	samWeaponsCB:SetText("Empty Mag")
	samWeaponsCB:SetValue( false )
	samWeaponsCB:SetTooltip("Set if weapon should be given with no extra ammo.") 
	
	local samWeaponsText = samEquipmentSP:Add( "DTextEntry", samFrame ) 
	samWeaponsText:SetPos( 0, 0 )
	samWeaponsText:SetSize( 107, 17 )
	samWeaponsText:SetFont( "DermaDefaultBold" )
	samWeaponsText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	samWeaponsText:SetTooltip("Weapon class (eg: weapon_crowbar).")
	--samWeaponsText:SetText( "VJ Class (CLASS_COMBINE)" )
	function samWeaponsText:OnEnter( text )
		
		local wepTab = newtab.equipmenttab.weapons
		local textTab = {
		['tab'] = {text, samWeaponsCB:GetChecked()}
		}

				samWeapons:AddLine( text, samWeaponsCB:GetChecked() )	
				table.Add(wepTab, textTab)
			
				EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
				CSB_HighlightTextColor(samWeaponsText, 0, 255, 0, 0.5, 0, 0, 0)
		
	end

	local samAmmo = samEquipmentSP:Add( "DListView", samFrame )
	samAmmo:SetPos( 215, 17 )
	samAmmo:SetSize( 215, 250 )
	samAmmo:SetMultiSelect( false )
	samAmmo:SetSortable( false )
	samAmmo:AddColumn( "Ammo Type" )
	samAmmo:AddColumn( "Ammo Count" )
	samAmmo.OnRowRightClick = function( panel, rowIndex, row )
		
		local v1 = row:GetValue(1)
		local v2 = row:GetValue(2)
		local rID = row:GetID()
		local ammoTab = newtab.equipmenttab.ammo
		
		if samAmmo:GetLine(rID) != nil then samAmmo:RemoveLine( rID ) end
		EmitSound( "CSB.UI.Menu.Close", Vector(0 ,0 ,0 ), -2 )
		
		for i = 1, #ammoTab do

			if ammoTab[i] && ammoTab[i][1] == v1 then
		
				table.Empty(ammoTab[i])
				table.remove(ammoTab, i)
				
			end
		
		end

	end
	
	for i = 1,#tab.equipmenttab.ammo do
		local ammoTab = tab.equipmenttab.ammo[i]
		samAmmo:AddLine( ammoTab[1] ,ammoTab[2] )
	end
	
	local samAmmoWang = samEquipmentSP:Add( "DNumberWang", samFrame )
	samAmmoWang:SetPos( 323, 0 )
	samAmmoWang:SetSize( 107, 17 )
	samAmmoWang:SetMin( 0 )
	samAmmoWang:SetMax( 1e8 )
	samAmmoWang:SetTooltip("Ammo count (eg: 54).")
	samAmmoWang:SetDecimals( 1 )
	
	local samAmmoText = samEquipmentSP:Add( "DTextEntry", samFrame ) 
	samAmmoText:SetPos( 215, 0 )
	samAmmoText:SetSize( 107, 17 )
	samAmmoText:SetFont( "DermaDefaultBold" )
	samAmmoText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	samAmmoText:SetTooltip("Ammo type (eg: Pistol).")
	--samAmmoText:SetText( "VJ Class (CLASS_COMBINE)" )
	function samAmmoText:OnEnter( text )
		
		local ammoTab = newtab.equipmenttab.ammo
		local textTab = {
		['tab'] = {text, samAmmoWang:GetValue()}
		}
			
		samAmmo:AddLine( text, samAmmoWang:GetValue() )	
		table.Add(ammoTab, textTab)
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
		CSB_HighlightTextColor(samAmmoText, 0, 255, 0, 0.5, 0, 0, 0)

		
	end

--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

	local samOverlayBase = vgui.Create( "DCollapsibleCategory", samFrame )
	samOverlayBase:SetLabel( "Overlay & Post Process" )		
	samOverlayBase:SetPos( 95, 5 )
	samOverlayBase:SetSize( 235, 550 )
	samOverlayBase:SetExpanded( false )
	samOverlayBase:SetTooltip("Here you can change Suit's Overlay && texture(material).")
	samOverlayBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 150, 150, 150, 255 ) )
		
	end
	function samOverlayBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samOverlaySP = vgui.Create( "DScrollPanel", samFrame )
	samOverlaySP:SetSize( 235, 250 )
	samOverlayBase:SetContents( samOverlaySP )
	
	local samOverlayLabel = samOverlaySP:Add( "DLabel", samFrame )
	samOverlayLabel:SetPos( 5, 0 )
	samOverlayLabel:SetWidth( 100 )
	samOverlayLabel:SetText( "Overlay:" )
	samOverlayLabel:SetFont( "DermaDefaultBold" )
	samOverlayLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samOverlayText = samOverlaySP:Add( "DTextEntry" ) 
	samOverlayText:SetPos( 1, 17 )
	samOverlayText:SetSize( 233, 17 )
	samOverlayText:SetFont( "DermaDefaultBold" )
	samOverlayText:SetTooltip("Overlay texture.")
	samOverlayText:SetTextColor( Color ( 100, 100, 100, 255 ) )
	if tab.overlaytab && tab.overlaytab.overlay.texture != "" then
	samOverlayText:SetText( tab.overlaytab.overlay.texture )
	end
	function samOverlayText:OnEnter( text )
		
		newtab.overlaytab.overlay.texture = text	
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
		CSB_HighlightTextColor(samOverlayText, 0, 255, 0, 0.5, 0, 0, 0)
		
	end
	
	local samOverlayRefractLabel = samOverlaySP:Add( "DLabel", samFrame )
	samOverlayRefractLabel:SetPos( 5, 37 )
	samOverlayRefractLabel:SetWidth( 100 )
	samOverlayRefractLabel:SetText( "Refract:" )
	samOverlayRefractLabel:SetFont( "DermaDefaultBold" )
	samOverlayRefractLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samOverlayRefractWang = samOverlaySP:Add( "DNumberWang", samFrame )
	samOverlayRefractWang:SetPos( 55, 39 )
	samOverlayRefractWang:SetSize( 45, 17 )
	samOverlayRefractWang:SetMin( -1e8 )
	samOverlayRefractWang:SetMax( 1e8 )
	samOverlayRefractWang:SetTooltip("How much should overlay affect the screen.")
	
	if tab.overlaytab && tab.overlaytab.overlay.refract != "" then
	samOverlayRefractWang:SetValue( tab.overlaytab.overlay.refract )
	end
	
	samOverlayRefractWang:SetDecimals( 1 )
	function samOverlayRefractWang:OnValueChanged( val )
	
		newtab.overlaytab.overlay.refract = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
--[[---------------------------------------------------------]]
	
	local samColorModBase = samOverlaySP:Add( "DCollapsibleCategory", samFrame )
	samColorModBase:SetLabel( "Color Modification" )		
	samColorModBase:SetPos( 0, 60 )
	samColorModBase:SetSize( 235, 550 )
	samColorModBase:SetExpanded( false )
	samColorModBase:SetTooltip("Color Modification (related to the overlay).")
	samColorModBase.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, Color( 120, 120, 120, 255 ) )
		
	end
	function samColorModBase:OnToggle( bool )
		
		if bool == true then
		
			EmitSound( "CSB.UI.List.Open", Vector(0 ,0 ,0 ), -2 )
			
		elseif bool == false then
		
			EmitSound( "CSB.UI.List.Close", Vector(0 ,0 ,0 ), -2 )
		
		end
		
	end
	
	local samColorModSP = samOverlaySP:Add( "DScrollPanel", samFrame )
	samColorModSP:SetSize( 235, 250 )
	samColorModBase:SetContents( samColorModSP )

	local samBrightnessLabel = samColorModSP:Add( "DLabel", samFrame )
	samBrightnessLabel:SetPos( 5, 90 )
	samBrightnessLabel:SetWidth( 100 )
	samBrightnessLabel:SetText( "Brightness:" )
	samBrightnessLabel:SetFont( "DermaDefaultBold" )
	samBrightnessLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samBrightnessWang = samColorModSP:Add( "DNumberWang", samFrame )
	samBrightnessWang:SetPos( 70, 92 )
	samBrightnessWang:SetSize( 30, 17 )
	samBrightnessWang:SetMin( -1e8 )
	samBrightnessWang:SetMax( 1e8 )
	samBrightnessWang:SetTooltip("Brightness multiplier.")
	
	if tab.overlaytab.colormod && tab.overlaytab.colormod['$pp_colour_brightness'] != "" then
	samBrightnessWang:SetValue( tab.overlaytab.colormod['$pp_colour_brightness'])
	end
	
	samBrightnessWang:SetDecimals( 1 )
	function samBrightnessWang:OnValueChanged( val )
	
		newtab.overlaytab.colormod['$pp_colour_brightness'] = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samContrastLabel = samColorModSP:Add( "DLabel", samFrame )
	samContrastLabel:SetPos( 5, 110 )
	samContrastLabel:SetWidth( 100 )
	samContrastLabel:SetText( "Contrast:" )
	samContrastLabel:SetFont( "DermaDefaultBold" )
	samContrastLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samContrastWang = samColorModSP:Add( "DNumberWang", samFrame )
	samContrastWang:SetPos( 70, 112 )
	samContrastWang:SetSize( 30, 17 )
	samContrastWang:SetMin( -1e8 )
	samContrastWang:SetMax( 1e8 )
	samContrastWang:SetTooltip("Contrast multiplier.")
	
	if tab.overlaytab.colormod && tab.overlaytab.colormod['$pp_colour_contrast'] != "" then
	samContrastWang:SetValue( tab.overlaytab.colormod['$pp_colour_contrast'])
	end
	
	samContrastWang:SetDecimals( 1 )
	function samContrastWang:OnValueChanged( val )
	
		newtab.overlaytab.colormod['$pp_colour_contrast'] = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end
	
	local samColorMLabel = samColorModSP:Add( "DLabel", samFrame )
	samColorMLabel:SetPos( 5, 130 )
	samColorMLabel:SetWidth( 100 )
	samColorMLabel:SetText( "Color Mult:" )
	samColorMLabel:SetFont( "DermaDefaultBold" )
	samColorMLabel:SetTextColor( Color ( 245, 245, 245, 255 ) )
	
	local samColorMWang = samColorModSP:Add( "DNumberWang", samFrame )
	samColorMWang:SetPos( 70, 132 )
	samColorMWang:SetSize( 30, 17 )
	samColorMWang:SetMin( -1e8 )
	samColorMWang:SetMax( 1e8 )
	samColorMWang:SetTooltip("Color multiplier.")
	
	if tab.overlaytab.colormod && tab.overlaytab.colormod['$pp_colour_colour'] != "" then
	samColorMWang:SetValue( tab.overlaytab.colormod['$pp_colour_colour'])
	end
	
	samColorMWang:SetDecimals( 1 )
	function samColorMWang:OnValueChanged( val )
	
		newtab.overlaytab.colormod['$pp_colour_colour'] = val
			
		EmitSound( "CSB.UI.Text", Vector(0 ,0 ,0 ), -2 )
	
	end

	local samCMColorAddLabel = samColorModSP:Add( "DColorMixer", samFrame )
	samCMColorAddLabel:SetLabel( "Color Add" )
	samCMColorAddLabel:SetPos( 5, 0 )
	samCMColorAddLabel:SetSize( 225, 90 )
	samCMColorAddLabel:SetColor( Color( math.Remap( newtab.overlaytab.colormod['$pp_colour_addr'], 0, 1, 0, 255 ), math.Remap( newtab.overlaytab.colormod['$pp_colour_addg'], 0, 1, 0, 255 ), math.Remap( newtab.overlaytab.colormod['$pp_colour_addb'], 0, 1, 0, 255 )))
	samCMColorAddLabel:SetPalette( false )
	samCMColorAddLabel:SetAlphaBar( false )
	
	function samCMColorAddLabel:ValueChanged( col )

		newtab.overlaytab.colormod['$pp_colour_addr'] = math.Remap( col.r, 0, 255, 0, 1 )
		newtab.overlaytab.colormod['$pp_colour_addg'] = math.Remap( col.g, 0, 255, 0, 1 )
		newtab.overlaytab.colormod['$pp_colour_addb'] = math.Remap( col.b, 0, 255, 0, 1 )

	end
	
	local samCMColorMulLabel = samColorModSP:Add( "DColorMixer", samFrame )
	samCMColorMulLabel:SetLabel( "Color Multiply" )
	samCMColorMulLabel:SetPos( 5, 150 )
	samCMColorMulLabel:SetSize( 225, 90 )
	samCMColorMulLabel:SetColor( Color( math.Remap( newtab.overlaytab.colormod['$pp_colour_mulr'], 0, 1, 0, 255 ), math.Remap( newtab.overlaytab.colormod['$pp_colour_mulg'], 0, 1, 0, 255 ), math.Remap( newtab.overlaytab.colormod['$pp_colour_mulb'], 0, 1, 0, 255 )))
	samCMColorMulLabel:SetPalette( false )
	samCMColorMulLabel:SetAlphaBar( false )
	
	function samCMColorMulLabel:ValueChanged( col )
		
		newtab.overlaytab.colormod['$pp_colour_mulr'] = math.Remap( col.r, 0, 255, 0, 1 )
		newtab.overlaytab.colormod['$pp_colour_mulg'] = math.Remap( col.g, 0, 255, 0, 1 )
		newtab.overlaytab.colormod['$pp_colour_mulb'] = math.Remap( col.b, 0, 255, 0, 1 )

	end

	
--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
	
	CSB_CreateButton( 336, 5, 50, 20, "Apply", "Apply all of the changes.", samFrame, function()
		EmitSound( "CSB.UI.Click", Vector(0 ,0 ,0 ), -2 )
		net.Start("csb_bg_ch_bg_set")

		net.WriteTable(newtab)
		net.SendToServer() 
	end)
	
	CSB_CreateButton( 390, 5, 50, 20, "Close", "Close the interface.", samFrame, function()
		samFrame:Close()
	end)
	
end

net.Receive("CSB_SAM_Interface", CSB_SAM_Interface)

local scrWidth = 1920
local scrHeight = 1080

local multX = ScrW() / scrWidth
local multY = ScrH() / scrHeight

function CSB_Info_Notify()

	local ply = LocalPlayer()
	local tab = net.ReadTable()
	
	if !ply:IsCSBUser() || !tab then return end	
	
	local notpan = tab.notpan
	local notmdlpan = tab.notmdlpan
	local notmdlcam = tab.notmdlcam
	local nottext = tab.nottext
	
	if !notpan then return end
	
	if IsValid(ply.notPanel) then ply.notPanel:Remove() end
	
	EmitSound( "CSB.UI.Text", Vector( 0 ,0 ,0 ), -2 )
	
	-- Notification panel
	ply.notPanel = vgui.Create( "DNotify" )	
	ply.notPanel:SetPos( notpan.pos.x * multX, notpan.pos.y * multY )
	ply.notPanel:SetSize( notpan.size.w * multX, notpan.size.h * multY )
	ply.notPanel:SetLife( notpan.time )

	-- Gray background panel
	local notBG = vgui.Create( "DPanel", ply.notPanel )
	notBG:Dock( FILL )
	notBG.Paint = function( self, w, h )
	
		draw.RoundedBox( 8, 0, 0, w, h, notpan.color )
		
	end

	notMdlPanel = vgui.Create( "DPanel", notBG )
	notMdlPanel:SetPos( notmdlpan.pos.x * multX, notmdlpan.pos.y * multY )
	notMdlPanel:SetSize( notmdlpan.size.w * multX, notmdlpan.size.h * multY )
	notMdlPanel.Paint = function( self, w, h )
		
		draw.RoundedBox( 8, 0, 0, w, h, notmdlpan.color )

	end
	notMdlPanel.PaintOver = function( self, w, h )	
		
		if notmdlpan.olsize > 0 then
		
			surface.SetDrawColor(notmdlpan.olcolor)
			surface.DrawOutlinedRect( 0, 0, w, h, notmdlpan.olsize )
			
		end
		
	end	
	
	local notMdl = vgui.Create("DModelPanel", notMdlPanel)	
	notMdl:SetSize( notMdlPanel:GetSize() )
	notMdl:SetModel( notmdlpan.model )
	function notMdl:LayoutEntity( Entity ) return end	-- Disable cam rotation
	
	local notEnt = notMdl:GetEntity()

	notEnt:SetAngles( notEnt:GetAngles() + notmdlpan.ang )
	notEnt:SetPos( Vector(100,0,0) )
	notEnt:SetColor( notmdlpan.mcolor )
	notEnt:SetSkin( notmdlpan.skin )
	
	for i = 1, notmdlpan.bgtab && #notmdlpan.bgtab || -1 do			
		notEnt:SetBodygroup(i, notmdlpan.bgtab[i])
	end
	
	for i = 1, notmdlpan.smtab && #notmdlpan.smtab || -1 do
		notEnt:SetSubMaterial( i - 1, notmdlpan.smtab[ i ] )		
	end
	
	local head = notEnt:LookupBone( notmdlcam.bone )
	
	if head then
	
		local headpos = notEnt:GetBonePosition( notEnt:LookupBone( notmdlcam.bone ) )
		notMdl:SetLookAt( headpos )
		notMdl:SetCamPos( headpos - notmdlcam.pos )	-- Move cam in front of face
		notEnt:SetEyeTarget( headpos - notmdlcam.pos )
		-- Makes Odessa look at the camera
		-- Commented out because the result is funnier without this
		
	end

	-- A yellow label message (parented to background panel)
	
	for i = 1,#nottext do
	
	local notLbl = vgui.Create( "DLabel", notBG )
	notLbl:SetPos( nottext[i].pos.x * multX, nottext[i].pos.y * multY )
	notLbl:SetSize( nottext[i].size.w * multX, nottext[i].size.h * multY )
	notLbl:SetText( nottext[i].text )
	notLbl:SetTextColor( nottext[i].color )
	notLbl:SetFont( nottext[i].font )
	notLbl:SetWrap( true )
	
	end

	-- Add the background panel to the notification
	ply.notPanel:AddItem(notBG)
	
end

net.Receive("CSB_Info_Notify", CSB_Info_Notify)

surface.CreateFont( "CSB_Font", {
    font = "DermaDefaultBold",    
	size = 13,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

surface.CreateFont( "CSB_Notify_Primary", {
    font = "Universal Union",    
	size = 17 * multX,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

surface.CreateFont( "CSB_Notify_Primary_Rebel", {
    font = "Spray.ME",    
	size = 22 * multX,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

surface.CreateFont( "CSB_Notify_Secondary", {
    font = "DermaDefaultBold",    
	size = 14 * multX,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

end
