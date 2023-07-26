--[[
-- SHARED FUNCTIONS -- 

function CSBDevMessage( msg = "string" or table ) 
-- Just a glorified print() + PrintTable(). 
-- Works only when "csb_dev_mode" is enabled.


function PLAYER:RotatingHead() 
-- Check player model for head pose parameters (head_yaw, head_pitch and head_roll). 
-- Returns true if present and false if not.


function PLAYER:FullyLoaded() 
-- Checks if player has fully loaded into the server (is past the loading screen).


function ENT:IsCSBUser() 
-- Checks if player is using CS[B] based suit.


function PLAYER:GetCSBSuit() 
-- Returns player's suit entity.


function ENT:IsCSB() 
-- Returns if entity is a CS[B] suit.


function PLAYER:IsNoClipping() 
-- Checks if player is using noclip.


function PLAYER:IsOnLadder() 
-- Checks if player is using a ladder.


function GetLuaAnimationDuration( luaanim = "string" ) 
-- Returns Lua animation duration.


function IsLuaAnimation( anim = "string" ) 
-- Checks if provided animation is a Lua animation


function PLAYER:GetAnimDuration( anim = "string" ) 
-- Checks animation duration. Can be used both on normal and Lua animations.


function PLAYER:IsNPCFriend( npc = entity ) 
-- Checks if NPC is friendly to player (by checking if it's class is in the CSB_Allies table or has the same VJ_NPC_Class as the player).


function PLAYER:IsPlayerFriend( ply = player ) 
-- Checks if target-player is in the same faction as us. 
-- Returns true if it is or false if not or is not a suit user at all.
	

function ENT:IsNPCScripting() 
-- Checks if NPC is currently in a scripted sequence.


CSBTools = { -- A global table containing weapons that should deactive third-person as well as the suits overlay.
weapon_physgun = true,
gmod_tool = true,
gmod_camera = true
}

function PLAYER:IsCSBHoldingTool() 
-- Checks if player is holding any of weapons/tools listed above.


function PLAYER:IsAiming() 
-- Unused.


function ENT:IsPropPhysics() 
-- Checks if entity is a prop_physics.


function ENT:IsPropStatic() 
-- Is this even right?


function ENT:IsDoor() 
-- Checks if entity is a door (func_door, func_door_rotating, prop_door or prop_door_rotating).
	

function ENT:IsDoorOpen() 
-- Checks if door is open already.
	

function ENT:IsDoorLocked() 
-- Checks if door is locked and returns it's internal variable (m_bLocked). 
-- Will also return false if csb_door_kick_open_locked is set to 1.
	

function PLAYER:GetClientAngles()
-- Returns player angles from the client realm.
	

function ENT:EmitServerSound( soundName = "string", soundLevel = number, pitchPercent = number, volume = number, channel = CHAN_*, soundFlags = number, dsp = number ) 
-- Should force sound to only play server-side (ignore clients, doesn't work client-side).


function ENT:EmitClientSound( soundName = "string", soundLevel = number, pitchPercent = number, volume = number, channel = CHAN_*, soundFlags = number, dsp = number ) 
-- Should force sound to only play client-side (ignore server, doesn't work server-side).


function ENT:IsNPCAnim() 
-- Checks if suit should have it's animations translated.


function ENT:CSBResetBone() 
-- Restore entity bones (pos, ang). Also sends it client-side.

TemplateBoneMergeTab = {
		
	['ValveBiped.Bip01_Pelvis'] = { pos = Vector( 0, 0, 0 ), ang = Angle( 0, 0, 0 ) }, -- You can add more bones.
	['ValveBiped.Bip01_Head1'] = { pos = Vector( 0, 0, 0 ), ang = Angle( 0, 0, 0 ) } -- Like so.

}

function ENT:CSBEditBone(table) 
-- Merges bones with a prived table (example above)


function CSBSoundDuration(strfile) 
-- Returns sound duration and rounds it up a bit.

TemplateSoundSequencerTab = {
sound = {"test.wav","test.wav",{"test_in_a_table.wav","test_in_a_table.wav"}}, -- You can either use single sound or insert a table in which case random sound will be played. Though this function supports single sounds, avoid doing that and use ENTITY:EmitSound() instead.
duration = {0,0,{0,0}}, -- You must set duration of said sounds. If set to 0, sound will play by it's default duration.
channel = CHAN_AUTO, -- The rest of the table is pretty much the same as your typical sound.add function.
volume = VOL_NORM,
level = SNDLVL_TALKING,
pitch = 100
}

function ENT:CSBEmitSoundSequence( stable = soundtable, stopdead = bool, callback = function ) 
-- This function is used to play sound seqences. 
-- You must provide a table (stable) with all the data (example above). 
-- Altho this function will stop automaticly if entity is missing/dead you can use stopdead bool to also stop the current sound. 
-- Function callback is called when sequencer has finished playing all of the sounds.


function ENT:CSBStopSoundSequence( fullstop = bool ) 
-- Stops the sound sequencer currently running on that entity. 
-- If fullstop is set to true it will also fully stop currently played sound.


function PLAYER:CSBThirdperson(bool, time) 
-- Enables the third-person view on a player (must be a suit user). 
-- Using variable time you can set for how long t-p should be active or leave empty to set it infinitly.


function PLAYER:SendCSBAnimation( gslot = number, anim = "string", loop = bool, tp = bool, dmovecam = number, dmove = bool, esound = "string" ) 
-- Forces player to play certain animation (also Lua).

-- gslot = which animation slot to use:
-- GESTURE_SLOT_ATTACK_AND_RELOAD	0	Slot for weapon gestures
-- GESTURE_SLOT_GRENADE				1	
-- GESTURE_SLOT_JUMP				2	Slot for jump gestures
-- GESTURE_SLOT_SWIM				3	Slot for swimming gestures
-- GESTURE_SLOT_FLINCH				4	Slot for flinching gestures
-- GESTURE_SLOT_VCD					5	
-- GESTURE_SLOT_CUSTOM				6	Slot for custom gestures

-- anim = aniamtion name
-- loop = false if animation should loop or true if it should not
-- tp = if animation should play in third-person
-- dmovecam = for how long player shouldn't be able to move (also sets the duration of t-p camera and might be used without setting dmove).
-- dmove = if player movement should be restricted during the animation.
-- esound = sound to play during the animation. (never used it but it's here)


function PLAYER:CSBSetAnimationState( animstateon = number, delay = number, animstateoff = number ) 
-- Can be used to set current player animation state.
-- First value is our new state.
-- Second value sets the duration of our new state. If set to 0, our new state will be pernament.
-- Third value is our return state

function PLAYER:CSBDrawProp( model = "string", material = "string", scale = number, scalespeed = number, bonename = "string", duration = number, pos = vector, ang = angle ) 
-- This function is used to create a prop attached to a player for a limited time. 
-- For instance, it's used with grenade throw function to add grenade in player's hand.

-- model = well... a model
-- material = if you wish to change our prop's material
-- scale = to change scale of said model
-- scalespeed = how fast should our model change it's scale
-- bonename = bone that we wish to attach said prop to
-- duration = when should it get removed
-- pos = model's position
-- ang = model's angle


function PLAYER:CanEntSeeUs( ent = entity ) -- Big credit to the Captain Applesauce for this piece of work https://steamcommunity.com/profiles/76561198070248149
-- Checks if entity appears in player's field of view.

function CMoveData:CSBRemoveKeys( keys = button id )
-- Using bitwise operations to clear the key bits.


function ENT:CSBGetName()
-- If used on NPC, returns entity name or class + EntIndex().
-- If used on a player, returns player's Nick().
-- Works in the client realm (the main reason why does it exist).

NPCVehicleAnims = { -- A table with default NPC bone merges used in the vehicles. You may add keys and values to this table using table.Merge. It detects vehicle models and classes.
    ["models/buggy.mdl"] = {		
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

-- SERVER FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
function ENT:ClientSetIK( bool )
-- Sets if entity's inverse kinematics should be enabled or disabled.


function ENT:CSBPrimaryIconColor( ply = player, pColor = Color(R,G,B,A) )
-- Chagnes the color of primary ability icon.
	
	
function ENT:CSBSecondaryIconColor( ply = player, sColor = Color(R,G,B,A) )
-- Chagnes the color of secondary ability icon.


function ENT:SendClientSound(ply,soundName,soundLevel,pitchPercent,volume,channel,soundFlags,dsp) -- Be serious...
-- Let's you play sound in the client realm from a server realm.

function ENT:OrderValidNPC()
-- Checks if NPC is valid to recive orders (if it can move on it's onw or atleast fly).
	

function ENT:CSB_NPCAlert( ply = player, enemy = npc, msg = "string" )
-- Alerts NPC that there is a enemy and tells it to try and reach it.

-- ply = player who gave the order
-- enemy = that we are informing NPCs about
-- msg = to be sent to a player who gave the order (a chat message)

function ENT:CSB_NPCRushEnemy( ply = player, msg = "string" )
-- Orders NPC to rush its enemy's position.

-- ply = player who gave the order
-- msg = to be sent to a player who gave the order (a chat message)

function ENT:CSB_NPCGoToPos( pos = vector, ply = player, msg = "string" )
-- Orders NPC to go to a new position.

-- pos = our new position
-- ply = player who gave the order
-- msg = to be sent to a player who gave the order (a chat message)
	

function ENT:CSB_NPCStop( ply = player, msg = "string" )
-- Orders NPC to stop following a player or stop patrolling.

-- ply = player who gave the order
-- msg = to be sent to a player who gave the order (a chat message)
	
function ENT:CSB_NPCTakeCover( ply = player, msg = "string" )
-- Orders NPC to seek cover.

-- ply = player who gave the order
-- msg = to be sent to a player who gave the order (a chat message)

function ENT:CSB_NPCPatrol( ply = player, msg = "string" )
-- Orders NPC to start patrolling the area. It will do that until a new enemy is found and if dealth with, will continue patrolling.

-- ply = player who gave the order
-- msg = to be sent to a player who gave the order (a chat message)
	
function ENT:CSB_MessageToPlayer(ply = player, senderName = "string", msg = "string", r = number, g = number, b = number )
-- Sends a chat message to a player. It's used internally by the commanding system and it's ment to looks like a message from the NPC.

-- ply = player who shall recieve the message
-- senderName = name of the entity that send the message
-- msg = message itself
-- r/g/b = color values (0-255) which will be used if player doesn't have a suit equiped as this function uses suit.CSB_AllyMarkers.allymarkcolor by default


CSBCrouchAnimLOL = { -- Default, global crouch "animation" tab for NPCs
		
	['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 5, -40, 0 ) },
    ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( -5, -40, 0 ) },
		
	['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 60, 0 ) },
    ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 60, 0 ) },
		
	['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 0, 0 ) },
    ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 0, 0 ) },
	
    ['ValveBiped.Bip01_Spine'] = { ang = Angle( 0, 20, 0 ) },
		
	['ValveBiped.Bip01_Pelvis'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 0, -15 ) }

}

function ENT:CSB_NPCFollowPlayer( leave = bool , ply = player, closeFollDist = number, farFollDist = number, closeFollDistE = number, farFollDistE = number )
-- Orders NPC to follow (join squad) given player.

-- leave = called internally
-- ply = player who gave the order / to follow
-- closeFollDist = distance at which npc should stop moving as it gets too close to a player
-- farFollDist = distance at which npc should start running instead of walking
-- closeFollDistE = distance at which npc in combat should stop moving as it gets too close to a player
-- farFollDistE = distance at which npc in combat should start running instead of walking


function PLAYER:CSBHideWeapons() 
-- Hides player's weapon.


-- CLIENT FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ENT:SendServerSound( soundName = "string", soundLevel = number, pitchPercent = number, volume = number, channel = CHAN_*, soundFlags = number, dsp = number )
-- Let's you play a sound in a server realm from a client realm.


function PLAYER:CrosshairClientToggle( bool )
-- Disables or enables players crosshair but in the client realm.

]]
