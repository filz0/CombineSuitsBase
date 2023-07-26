if CLIENT then

local function CSBAdminPanel(panel)
    panel:ClearControls()
	
	local poster = vgui.Create( "DImage" )
	poster:SetImage( "csb_poster" )
	poster:SetSize( 300, 300 )
	
	panel:AddPanel( poster )
	
	panel:AddControl("CheckBox", {
	    Label = "Keep The Suit:",
	    Command = "csb_keep_suit_on_death"
	})
	panel:ControlHelp("Players won't drop their suits after death.")
	
	panel:AddControl("CheckBox", {
	    Label = "Suit Abilities:",
	    Command = "csb_allow_abilities"
	})
    panel:ControlHelp("Suit users will be allowed to utilize suit abilities.")
	
	panel:AddControl("CheckBox", {
	    Label = "Weapons And Ammo:",
	    Command = "csb_give_weapons_and_ammo"
	})
	panel:ControlHelp("After equipping the suit, players will be granted assigned weapons and ammo.")
	
	panel:AddControl("CheckBox", {
	    Label = "Weapons And Ammo Strip:",
	    Command = "csb_strip_weapons_and_ammo"
	})
	panel:ControlHelp("Players will lose weapons and ammo they got from their suits.")
	
	panel:AddControl("CheckBox", {
	    Label = "CSB Footsteps:",
	    Command = "csb_enable_custom_footsteps"
	})
	panel:ControlHelp("Custom footstep sounds.")
	
	panel:AddControl("CheckBox", {
	    Label = "Disable PVP Friendly Fire:",
	    Command = "csb_player_friendly_fire"
	})
	panel:ControlHelp("Players with suits that possess the same class won't be able to hurt each other. (VJ CLASS BASED!)")
	
	panel:AddControl("CheckBox", {
	    Label = "Disable PVE Friendly Fire:",
	    Command = "csb_npc_friendly_fire"
	})
	panel:ControlHelp("Players won't be able to hurt or kill friendly NPCs.")
	
	panel:AddControl("CheckBox", {
	    Label = "Weapon Swap Animations:",
	    Command = "csb_allow_weapon_swap_animations"
	})
    panel:ControlHelp("Enable weapon swap animations.")
	
	panel:AddControl("CheckBox", {
	    Label = "Disable EPMS' PME:",
	    Command = "csb_force_disable_epms_pm_enforcement"
	})
	panel:ControlHelp("CS[B] will automaticly disable Enhanced PlayerModel Selector's playermodel enforcement.")
	
	panel:AddControl("Slider", {
	    Label = "Melee Stealth Damage Multiplier:",
		Command = "csb_stealth_melee_mul",
	    Min = 1,
	    Max = 10
	})
	panel:ControlHelp("Applies to NPCs with no enemies or attacking player is not the enemy.")
	
	panel:AddControl("CheckBox", {
	    Label = "Kick Locked Doors:",
	    Command = "csb_door_kick_open_locked"
	})
	panel:ControlHelp("Players will be able to kick open locked doors.")
	
	panel:AddControl("Slider", {
	    Label = "Min Door Kicks:",
		Command = "csb_door_kick_open_tries",
	    Min = 1,
	    Max = 20
	})
	panel:ControlHelp("How many 'kicks' are required to open doors.")
    
end

local function CSBClientPanel(panel)
    panel:ClearControls()

	local poster = vgui.Create( "DImage" )
	poster:SetImage( "csb_poster" )
	poster:SetSize( 300, 300 )
	
	panel:AddPanel( poster )
	
	panel:AddControl("CheckBox", {
	    Label = "Use-Tips:",
	    Command = "csb_tips"
	})
	panel:ControlHelp("Allow render of use-tips on certain entities.")
	
	panel:AddControl("CheckBox", {
	    Label = "Enforce First-Person:",
	    Command = "csb_enforce_firstperson_animations"
	})
	panel:ControlHelp("All animated events will not activate Third-Person.")
	
	panel:AddControl("CheckBox", {
	    Label = "Third-Person:",
	    Command = "csb_thirdperson"
	})
	panel:ControlHelp("Enable Third-Person.")
	
	panel:AddControl("CheckBox", {
	    Label = "Third-Person Free Cam:",
	    Command = "csb_thirdperson_freecam"
	})
	panel:ControlHelp("Enable freecam in Third-Person.")
	
	panel:AddControl("CheckBox", {
	    Label = "Dynamic Third-Person:",
	    Command = "csb_thirdperson_dynamic"
	})
	panel:ControlHelp("The camera will follow the head-bone instead of being static.")
	
	panel:AddControl("CheckBox", {
	    Label = "Third-Person Position:",
	    Command = "csb_thirdperson_c_pos"
	})
	panel:ControlHelp("It will override the suit's default camera position.")
	
	panel:AddControl("Slider", {
	    Label = "Camera X:",
		Command = "csb_thirdperson_x",
	    Min = -100,
	    Max = 100	    
	})
	panel:ControlHelp("Forward / Backward.")
	
	panel:AddControl("Slider", {
	    Label = "Camera Y:",
		Command = "csb_thirdperson_y",
	    Min = -100,
	    Max = 100	    
	})
	panel:ControlHelp("Up / Down.")
	
	panel:AddControl("Slider", {
	    Label = "Camera Z:",
		Command = "csb_thirdperson_z",
	    Min = -100,
	    Max = 100	    
	})
	panel:ControlHelp("Left / Right.")
	
	panel:AddControl("Slider", {
	    Label = "Camera Crouch Multiplier:",
		Command = "csb_thirdperson_c",
	    Min = 0,
	    Max = 10    
	})
	panel:ControlHelp("It will multiply camera height when crouching.")
	 
end

local function CSBHUDPanel(panel)
    panel:ClearControls()

	local poster = vgui.Create( "DImage" )
	poster:SetImage( "csb_poster" )
	poster:SetSize( 300, 300 )
	
	panel:AddPanel( poster )

	panel:AddControl("CheckBox", {
	    Label = "Overlays:",
	    Command = "csb_overlay_enable"
	})
	panel:ControlHelp("Enable suit assigned screen overlay.")
	
	panel:AddControl("CheckBox", {
	    Label = "Enable Suit HUD:",
	    Command = "csb_allow_hud"
	})
	panel:ControlHelp("Allow suits to load custom HUD.")
	
	panel:AddControl("Slider", {
	    Label = "Primary Ability Icon Pos X:",
		Command = "csb_primary_ability_pos_x",
	    Min = -100,
	    Max = 200	    
	})
	panel:ControlHelp("Primary ability icon position X.")
	
	panel:AddControl("Slider", {
	    Label = "Primary Ability Icon Pos Y:",
		Command = "csb_primary_ability_pos_y",
	    Min = -100,
	    Max = 200	    
	})
	panel:ControlHelp("Primary ability icon position Y.")
	
	panel:AddControl("Slider", {
	    Label = "Primary Secondary Icon Pos X:",
		Command = "csb_secondary_ability_pos_x",
	    Min = -100,
	    Max = 200	    
	})
	panel:ControlHelp("Secondary ability icon position X.")
	
	panel:AddControl("Slider", {
	    Label = "Primary Secondary Icon Pos Y:",
		Command = "csb_secondary_ability_pos_y",
	    Min = -100,
	    Max = 200	    
	})
	panel:ControlHelp("Secondary ability icon position Y.")
	
	panel:AddControl("CheckBox", {
	    Label = "Ally Markers:",
	    Command = "csb_ally_markers"
	})
	panel:ControlHelp("Enable ally markers that'll mark nearby allies.")
	
	panel:AddControl("CheckBox", {
	    Label = "Ally Names:",
	    Command = "csb_ally_markers_names"
	})
	panel:ControlHelp("Enable ally names above markers (might tank performance).")
	
	panel:AddControl("TextBox", {
	    Label = "Ally Markers Distance:",
	    Command = "csb_ally_markers_max"
	})
	panel:ControlHelp("The max distance at which ally markers will show on your screen.")
	
	panel:AddControl("Slider", {
	    Label = "Crosshair Dynamic Scale:",
		Command = "csb_thirdperson_crosshair_movement_scale",
	    Min = 0,
	    Max = 100    
	})
	panel:ControlHelp("Third-Person crosshair movement scale (0 to disable).")
	
	panel:AddControl("Color", {
	    Label = "Crosshair Color:",
	    Red = "csb_thirdperson_crosshair_color_r",
	    Green = "csb_thirdperson_crosshair_color_g",
	    Blue = "csb_thirdperson_crosshair_color_b",
	    Alpha = "csb_thirdperson_crosshair_color_a"
	    
	})
	panel:ControlHelp("Choose the color of your Third-Person crosshair.")
	
	panel:AddControl("Color", {
	    Label = "Ally Crosshair Color:",
	    Red = "csb_thirdperson_crosshair_a_color_r",
	    Green = "csb_thirdperson_crosshair_a_color_g",
	    Blue = "csb_thirdperson_crosshair_a_color_b",
	    
	})
	panel:ControlHelp("Crosshair color when aimed at one of your allies.")
	
	panel:AddControl("Color", {
	    Label = "Enemy Crosshair Color:",
	    Red = "csb_thirdperson_crosshair_e_color_r",
	    Green = "csb_thirdperson_crosshair_e_color_g",
	    Blue = "csb_thirdperson_crosshair_e_color_b",
	    
	})
	panel:ControlHelp("Crosshair color when aimed at one of your enemies.")
	
	panel:AddControl("Color", {
	    Label = "Crosshair BG Color:",
	    Red = "csb_thirdperson_crosshair_bg_color_r",
	    Green = "csb_thirdperson_crosshair_bg_color_g",
	    Blue = "csb_thirdperson_crosshair_bg_color_b",
	    Alpha = "csb_thirdperson_crosshair_bg_color_a"
	    
	})
	panel:ControlHelp("Choose the background color of your Third-Person crosshair.")
	 
end

local function CSBCompanionPanel(panel)
    panel:ClearControls()

	local poster = vgui.Create( "DImage" )
	poster:SetImage( "csb_poster" )
	poster:SetSize( 300, 300 )
	
	panel:AddPanel( poster )

	panel:AddControl("CheckBox", {
	    Label = "Companions:",
	    Command = "csb_enable_followers"
	})
	panel:ControlHelp("Enable companions and an entire commanding system.")
	
	panel:AddControl("CheckBox", {
	    Label = "Teleporting:",
	    Command = "csb_allow_follower_teleport"
	})
	panel:ControlHelp("Your companions will teleport to you if you're out of reach.")
	
	panel:AddControl("CheckBox", {
	    Label = "Crouching:",
	    Command = "csb_allow_follower_crouch"
	})
	panel:ControlHelp("They will crouch with you which may allow them to enter vents, etc.")
	
	panel:AddControl("CheckBox", {
	    Label = "Chat:",
	    Command = "csb_allow_follower_chat"
	})
	panel:ControlHelp("If enabled, npcs will inform you of their actions via text chat.")
	
	panel:AddControl("CheckBox", {
	    Label = "Collisions:",
	    Command = "csb_allow_follower_collisions"
	})
	panel:ControlHelp("Enable companion collisions. You'll have to dismiss and assign them back to your squad for this to take an effect.")
	
	panel:AddControl("Slider", {
	    Label = "Selection Range:",
		Command = "csb_menu_am_hitbox_size",
	    Min = 1,
	    Max = 200    
	})
	panel:ControlHelp("When Action Menu is open, it fires a tracer that selects the target for your orders. This slider sets the hitbox size of that tracer for easier selection.")
	
	panel:AddControl("Slider", {
	    Label = "Seat Enter Radius:",
		Command = "csb_follower_enter_radius",
	    Min = 0,
	    Max = 1000    
	})
	panel:ControlHelp("Radius in which followers will enter vehicles.")
	
end

local function CSBControls(panel)
    panel:ClearControls()
	
	local poster = vgui.Create( "DImage" )
	poster:SetImage( "csb_poster" )
	poster:SetSize( 300, 300 )
	
	panel:AddPanel( poster )
	
	panel:AddControl( "Numpad", {
		Label = "Primary Ability:",
		Label2 = "Secondary Ability:",
		Command = "csb_menu_primary_key",
		Command2 = "csb_menu_secondary_key",
		ButtonSize = 22})
	  
	panel:AddControl( "Numpad", {
		Label = "Drop Suit:",
		Label2 = "Strip Suit:",
		Command = "csb_menu_drop_key",
		Command2 = "csb_menu_strip_key",
		ButtonSize = 22})
		
	panel:AddControl( "Numpad", {
		Label = "Melee Attack:",
		Label2 = "Grenade Throw:",
		Command = "csb_menu_melee_key",
		Command2 = "csb_menu_grenade_key",
		ButtonSize = 22})
	
	panel:AddControl( "Numpad", {		
		Label = "Action Menu:",
		Label2 = "Third-Person FreeCam:",
		Command = "csb_menu_am_key",
		Command2 = "csb_menu_tp_free_cam_key",
		ButtonSize = 22})
	
end

hook.Add("AddToolMenuTabs", "CSB_MenuTHook", function()
	spawnmenu.AddToolTab("filz0", "filz0", "vgui/csb_ico.png")
	spawnmenu.AddToolMenuOption("filz0", "Combine Suits [BASE]", "CSB_Server", "Server Settings", "", "", CSBAdminPanel)
    spawnmenu.AddToolMenuOption("filz0", "Combine Suits [BASE]", "CSB_Client", "Client Settings", "", "", CSBClientPanel)
    spawnmenu.AddToolMenuOption("filz0", "Combine Suits [BASE]", "CSB_HUD", "HUD Settings", "", "", CSBHUDPanel)
	spawnmenu.AddToolMenuOption("filz0", "Combine Suits [BASE]", "CSB_Companions", "Companions", "", "", CSBCompanionPanel)
    spawnmenu.AddToolMenuOption("filz0", "Combine Suits [BASE]", "CSB_SControls", "Client Controls", "", "", CSBControls)
end)

end