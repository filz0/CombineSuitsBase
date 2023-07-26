
if !ConVarExists("csb_dev_mode") then	
   CreateConVar("csb_dev_mode", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Enables some prints in the console.")
end

if !ConVarExists("csb_keep_suit_on_death") then	
   CreateConVar("csb_keep_suit_on_death", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Players keep their suits on death.")
end

if !ConVarExists("csb_allow_abilities") then	
   CreateConVar("csb_allow_abilities", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Allow players to use suit abilities.")
end

if !ConVarExists("csb_give_weapons_and_ammo") then	
   CreateConVar("csb_give_weapons_and_ammo", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Allow suits to give assigned weapons and ammo to their users on equip.")
end

if !ConVarExists("csb_strip_weapons_and_ammo") then	
   CreateConVar("csb_strip_weapons_and_ammo", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Allow suits to strip assigned weapons and ammo from their users on drop/strip.")
end

if !ConVarExists("csb_player_friendly_fire") then	
   CreateConVar("csb_player_friendly_fire", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Allow friendly fire between players.")
end

if !ConVarExists("csb_npc_friendly_fire") then	
   CreateConVar("csb_npc_friendly_fire", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Allow friendly fire between players and npcs.")
end

if !ConVarExists("csb_stealth_melee_mul") then	
   CreateConVar("csb_stealth_melee_mul", '2', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Set stealth damage of melee attacks.")
end

if !ConVarExists("csb_enable_followers") then	
   CreateConVar("csb_enable_followers", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enable entire following system.")
end

if !ConVarExists("csb_allow_follower_teleport") then	
   CreateConVar("csb_allow_follower_teleport", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Allow followers to teleport if they can't reach you.")
end

if !ConVarExists("csb_allow_follower_crouch") then	
   CreateConVar("csb_allow_follower_crouch", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Allow followers to crouch with you.")
end

if !ConVarExists("csb_follower_enter_radius") then	
   CreateConVar("csb_follower_enter_radius", '200', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Followers seat enter radius.")
end

if !ConVarExists("csb_door_kick_open_locked") then	
   CreateConVar("csb_door_kick_open_locked", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Allow players to kick open locked doors.")
end

if !ConVarExists("csb_door_kick_open_tries") then	
   CreateConVar("csb_door_kick_open_tries", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Hits required to open doors.")
end

if !ConVarExists("csb_force_disable_epms_pm_enforcement") then	
   CreateConVar("csb_force_disable_epms_pm_enforcement", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Forcefully disables Enhanced PlayerModel Selector' player model enforcer.")
end

if !ConVarExists("csb_allow_weapon_swap_animations") then	
   CreateConVar("csb_allow_weapon_swap_animations", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), "Forcefully disables Enhanced PlayerModel Selector' player model enforcer.")
end

if !ConVarExists("csb_enable_custom_footsteps") then	
   CreateConVar("csb_enable_custom_footsteps", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), ".")
end

if !ConVarExists("csb_allow_follower_collisions") then	
   CreateConVar("csb_allow_follower_collisions", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_NOTIFY), ".")
end

--if !ConVarExists("csb_enable_custom_footstep") then	
  -- CreateConVar("csb_enable_custom_footstep", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Allow custom footstep sounds.")
--end

if (CLIENT) then

if !ConVarExists("csb_allow_hud") then	
   CreateClientConVar("csb_allow_hud", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Allow suit based HUD.")
end

if !ConVarExists("csb_thirdperson_freecam") then	
   CreateClientConVar("csb_thirdperson_freecam", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enable freecamn in tp.")
end

if !ConVarExists("csb_enforce_firstperson_animations") then	
   CreateClientConVar("csb_enforce_firstperson_animations", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enforce all of the animated events to play in first person.")
end

if !ConVarExists("csb_overlay_enable") then	
   CreateClientConVar("csb_overlay_enable", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enable suit overlay.")
end

if !ConVarExists("csb_thirdperson") then	
   CreateClientConVar("csb_thirdperson", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enable thirdperson view.")
end

if !ConVarExists("csb_thirdperson_c_pos") then	
   CreateClientConVar("csb_thirdperson_c_pos", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Allow custom thirdperson camera position.")
end

if !ConVarExists("csb_thirdperson_x") then	
   CreateClientConVar("csb_thirdperson_x", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Set X-Axis of the camera.")
end

if !ConVarExists("csb_thirdperson_y") then	
   CreateClientConVar("csb_thirdperson_y", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Set Y-Axis of the camera.")
end

if !ConVarExists("csb_thirdperson_z") then	
   CreateClientConVar("csb_thirdperson_z", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Set Z-Axis of the camera.")
end

if !ConVarExists("csb_thirdperson_c") then	
   CreateClientConVar("csb_thirdperson_c", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Set Y-Axis multiplier while player is crouching.")
end

if !ConVarExists("csb_thirdperson_dynamic") then	
   CreateClientConVar("csb_thirdperson_dynamic", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Should the third-person camera follow the head bone.")
end

-----------------CROSSHAIR

--DEFAULT
if !ConVarExists("csb_thirdperson_crosshair_color_r") then	
   CreateClientConVar("csb_thirdperson_crosshair_color_r", '255', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair color RED.")
end

if !ConVarExists("csb_thirdperson_crosshair_color_g") then	
   CreateClientConVar("csb_thirdperson_crosshair_color_g", '255', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair color GREEN.")
end

if !ConVarExists("csb_thirdperson_crosshair_color_b") then	
   CreateClientConVar("csb_thirdperson_crosshair_color_b", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair color BLUE.")
end

if !ConVarExists("csb_thirdperson_crosshair_color_a") then	
   CreateClientConVar("csb_thirdperson_crosshair_color_a", '200', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair ALPHA.")
end

--ALLY

if !ConVarExists("csb_thirdperson_crosshair_a_color_r") then	
   CreateClientConVar("csb_thirdperson_crosshair_a_color_r", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair on ally color RED.")
end

if !ConVarExists("csb_thirdperson_crosshair_a_color_g") then	
   CreateClientConVar("csb_thirdperson_crosshair_a_color_g", '255', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair on ally color GREEN.")
end

if !ConVarExists("csb_thirdperson_crosshair_a_color_b") then	
   CreateClientConVar("csb_thirdperson_crosshair_a_color_b", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair on ally color BLUE.")
end

--ENEMY

if !ConVarExists("csb_thirdperson_crosshair_e_color_r") then	
   CreateClientConVar("csb_thirdperson_crosshair_e_color_r", '255', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair on enemy color RED.")
end

if !ConVarExists("csb_thirdperson_crosshair_e_color_g") then	
   CreateClientConVar("csb_thirdperson_crosshair_e_color_g", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair on enemy color GREEN.")
end

if !ConVarExists("csb_thirdperson_crosshair_e_color_b") then	
   CreateClientConVar("csb_thirdperson_crosshair_e_color_b", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair on enemy color BLUE.")
end

--BG

if !ConVarExists("csb_thirdperson_crosshair_bg_color_r") then	
   CreateClientConVar("csb_thirdperson_crosshair_bg_color_r", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair background color RED.")
end

if !ConVarExists("csb_thirdperson_crosshair_bg_color_g") then	
   CreateClientConVar("csb_thirdperson_crosshair_bg_color_g", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair background color GREEN.")
end

if !ConVarExists("csb_thirdperson_crosshair_bg_color_b") then	
   CreateClientConVar("csb_thirdperson_crosshair_bg_color_b", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair background color BLUE.")
end

if !ConVarExists("csb_thirdperson_crosshair_bg_color_a") then	
   CreateClientConVar("csb_thirdperson_crosshair_bg_color_a", '200', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair background ALPHA.")
end

if !ConVarExists("csb_thirdperson_crosshair_movement_scale") then	
   CreateClientConVar("csb_thirdperson_crosshair_movement_scale", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair movement scale.")
end

--if !ConVarExists("csb_thirdperson_crosshair_scale") then	
  -- CreateClientConVar("csb_thirdperson_crosshair_scale", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Thirdperson crosshair scale.")
--end
-----------------CROSSHAIR

if !ConVarExists("csb_tips") then	
   CreateClientConVar("csb_tips", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Allow use-tips on certain things.")
end

if !ConVarExists("csb_primary_ability_pos_x") then	
   CreateClientConVar("csb_primary_ability_pos_x", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Primary ability x pos.")
end

if !ConVarExists("csb_primary_ability_pos_y") then	
   CreateClientConVar("csb_primary_ability_pos_y", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Primary ability y pos.")
end

if !ConVarExists("csb_secondary_ability_pos_x") then	
   CreateClientConVar("csb_secondary_ability_pos_x", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Secondary ability x pos.")
end

if !ConVarExists("csb_secondary_ability_pos_y") then	
   CreateClientConVar("csb_secondary_ability_pos_y", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Secondary ability y pos.")
end

if !ConVarExists("csb_ally_markers") then	
   CreateClientConVar("csb_ally_markers", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enable ally markers.")
end

if !ConVarExists("csb_ally_markers_names") then	
   CreateClientConVar("csb_ally_markers_names", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Enable ally names.")
end

if !ConVarExists("csb_ally_markers_max") then	
   CreateClientConVar("csb_ally_markers_max", '700', (FCVAR_GAMEDLL + FCVAR_ARCHIVE), "Ally markers maks render distance.")
end

if !ConVarExists("csb_allow_follower_chat") then	
   CreateClientConVar("csb_allow_follower_chat", '1', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), "Allow followers to use text chat.")
end

if !ConVarExists("csb_menu_primary_key") then	
   CreateClientConVar("csb_menu_primary_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_secondary_key") then	
   CreateClientConVar("csb_menu_secondary_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_drop_key") then	
   CreateClientConVar("csb_menu_drop_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_strip_key") then	
   CreateClientConVar("csb_menu_strip_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_melee_key") then	
   CreateClientConVar("csb_menu_melee_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_tp_free_cam_key") then	
   CreateClientConVar("csb_menu_tp_free_cam_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_am_key") then	
   CreateClientConVar("csb_menu_am_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_am_hitbox_size") then	
   CreateClientConVar("csb_menu_am_hitbox_size", '20', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), "When Action Menu is open, it fires a tracer that selects the target for your orders. This command sets the hitbox size of that tracer for easier selection.")
end

if !ConVarExists("csb_menu_grenade_key") then	
   CreateClientConVar("csb_menu_grenade_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

if !ConVarExists("csb_menu_rappel_key") then	
   CreateClientConVar("csb_menu_rappel_key", '0', (FCVAR_GAMEDLL + FCVAR_ARCHIVE + FCVAR_USERINFO), ".")
end

local csb_boneanimapi_loaded = nil

concommand.Add( "csb_load_lua_animator", function(ply,cmd,args,argStr)
	
	if (ply:IsAdmin() or ply:IsSuperAdmin()) and csb_boneanimapi_loaded != true then
	
		include("bone_animapi/cl_animeditor.lua")
		
		print("Bone Animation API editor loaded. Use command 'animate' to active the editor or 'animprint' to print animation related information.")
		
		csb_boneanimapi_loaded = true
		
	elseif !ply:IsAdmin() and !ply:IsSuperAdmin() and csb_boneanimapi_loaded != true then
	
		print("This command can be used by Admins and Super Admins only.")
		
	elseif (ply:IsAdmin() or ply:IsSuperAdmin()) and csb_boneanimapi_loaded == true then
		
		print("Bone Animation API is already loaded. If you wish to deload it, restart your game (go to the main menu and load back). Use command 'animate' to active the editor or 'animprint' to print animation related information.")
		
	end
	
end)

end



