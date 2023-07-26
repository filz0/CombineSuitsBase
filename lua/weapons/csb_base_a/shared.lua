SWEP.Author					= "FiLzO"
SWEP.Category				= "Combine Suits [Base]"
SWEP.Purpose				= "NULL"
SWEP.PrintName				= "CSB BASE"
SWEP.AbilityPrimaryDesc		= "NULL"
SWEP.AbilitySecondaryDesc	= "NULL"

if CLIENT then
SWEP.WepSelectIcon 		= surface.GetTextureID("")
SWEP.Slot				= 5
SWEP.SlotPos			= 1
SWEP.IconLetter			= "O"
SWEP.ViewModelFlip		= false
end
--SWEP.RenderGroup		= RENDERGROUP_OPAQUE

SWEP.Spawnable 				= false
SWEP.AdminOnly 				= false
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "None"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "None"
SWEP.DrawAmmo				= false
SWEP.DrawCrosshair			= false
SWEP.ViewModel				= "models/csb/c_equiphands.mdl"
SWEP.WorldModel				= "models/Items/combine_rifle_ammo01.mdl"
SWEP.HoldType 				= "normal"
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom 		= false
SWEP.UseHands 				= true
SWEP.EnableFancyPhysics		= true

sound.Add( { -- Default footsteps.
	name = "CSBPlySound.FootStep.Default",
	channel = CHAN_BODY,
	volume = 1,
	level = SNDLVL_75dB,
	pitch = { 95, 110 },
	sound = { "npc/combine_soldier/gear1.wav", "npc/combine_soldier/gear2.wav", "npc/combine_soldier/gear3.wav", "npc/combine_soldier/gear4.wav", "npc/combine_soldier/gear5.wav", "npc/combine_soldier/gear6.wav" }
} )

SWEP.PlyModel = "" -- Player model.
SWEP.PlyBodyGroups = nil 
SWEP.PlySkin = 0		
SWEP.PlySubMaterials = nil
SWEP.PlyHandsModel = "" -- Player's hands model.
SWEP.PlyHandsMaterial = "" -- Hands material.
SWEP.PlyColor = Color(255,255,255,255)
SWEP.PlyPlayerColor = Color(255,255,255)
SWEP.NPCAnims = false -- Should we use animation transtlation?
SWEP.EquipAnimation = "" -- Animation played when equiping the suit, leave it as such to have no animation.
SWEP.VMEquipAnimation = "" -- View model animation on equip.
SWEP.EquipSound = nil -- Sound played when equiping a suit.
SWEP.DropSound = nil -- The opposite.

SWEP.WorldModel					= "" -- World model, you can use the player model.
SWEP.WorldModelScale			= 1 -- World model scale...
SWEP.WorldModelAnim				= nil -- Either animation name or a table with bone merge.
SWEP.WorldModelAnimPlaybackRate	= 0 -- Animation playback speed.
SWEP.UseCSBHud = true -- If you want to use default hud for abilities.

SWEP.NotifyTab = {
--[[
	['notpan'] = { -- Notification base frame.
		['pos'] 	= {x = 36, y = 36}, -- Base frame position on screen.
		['size'] 	= {w = 300, h = 270}, -- Base frame size.
		['color'] 	= Color(0, 0, 0, 80), -- Fase frame background color.
		['time'] 	= 5, -- Notify panel life time.
	},
	['notmdlpan'] = { -- Model panel
		['pos'] 	= {x = 10, y = 10}, -- Model panel position.
		['size'] 	= {w = 130, h = 130}, -- Model panel size.
		['color'] 	= Color(0, 255, 255, 255), -- Model panel background color.
		['olcolor'] = Color(0, 55, 55, 255), -- Model panel background outline color.
		['olsize'] 	= 5, -- Model panel background online size.
		['ang'] 	= Angle(0, 20, 0), -- Model angle.
	},
	['notmdlcam'] = { -- Model planel camera.
		['bone'] 	= "ValveBiped.Bip01_Head1", -- Bone for focus on (best to chose a head bone).
		['pos'] 	= Vector(-15, 0, 0), -- Camera position.
	},
	['nottext'] = {
		[1] = { -- You can add as many as you wish.
			['pos'] 	= {x = 150, y = -15}, -- Label position.
			['size'] 	= {w = 188, h = 72}, -- Label size (not the text size).
			['text'] 	= "[Faction]", -- Label text.
			['font'] 	= "CSB_Notify_Primary", -- Label font.
			['color'] 	= Color(0, 255, 255), -- Label text color.
		},
	},
]]
}


SWEP.HUDTab = {
	--[[
	['health'] = {
		['bghppos'] 		= {x = 37, y = 922}, -- Health background pos.
		['bghpsize'] 		= {w = 255, h = 60}, -- Health background size.
		['bghpround'] 		= 8, -- Health background rounded corners.
		['bghpcolor'] 		= Color(0, 0, 0, 155), -- Health background color.
		--
		['nhppos'] 			= {x = 170, y = 952}, -- Health vaule pos.
		['nhpfont'] 		= "csb_font_playerinfo", -- Health vaule font.
		['nhpcolor'] 		= Color(0,255,155,255), -- Health vaule color.
		--
		['thppos'] 			= {x = 76, y = 967}, -- Health text pos.
		['thptext'] 		= "HEALTH", -- Health text.
		['thpfont'] 		= "csb_font_barinfo", -- Health text font.
		['thpcolor'] 		= Color(0,255,155,255), -- Health text color.
		--
		['nmhppos'] 		= {x = 260, y = 940.5}, -- Max health value pos.
		['nmhpfont'] 		= "csb_font_ammoinfo2", -- Max health value font.
		['nmhpcolor'] 		= Color(0,255,155,255), -- Max health value color.
		--
		['tmhppos'] 		= {x = 260, y = 967}, -- Max health text pos.
		['tmhptext'] 		= "MAX", -- Max health text.
		['tmhpfont'] 		= "csb_font_barinfo", -- Max health text font.
		['tmhpcolor'] 		= Color(0,255,155,255), -- Max health text color.
	},
	]]
	--[[
	['armor'] = {
		['bgarmrpos'] 		= {x = 37, y = 992}, -- Armor background pos.
		['bgarmrsize'] 		= {w = 255, h = 60}, -- Armor background size.
		['bgarmrround']		= 8, -- Armor background rounded corners.
		['bgarmrcolor'] 	= Color(0, 0, 0, 155), -- Armor background color.
		--
		['narmrpos'] 		= {x = 170, y = 1022}, -- Armor value pos.
		['narmrfont'] 		= "csb_font_playerinfo", -- Armor value font.
		['narmrcolor'] 		= Color(0,255,155,255), -- Armor value color
		--
		['tarmrpos'] 		= {x = 70, y = 1037}, -- Armor text pos.
		['tarmrtext'] 		= "ARMOR", -- Armor text.
		['tarmrfont'] 		= "csb_font_barinfo", -- Armor text font.
		['tarmrcolor'] 		= Color(0,255,155,255), -- Armor text color.
		--
		['nmarmrpos'] 		= {x = 260, y = 1010}, -- Max armor value pos.
		['nmarmrfont'] 		= "csb_font_ammoinfo2", -- Max armor value font.
		['nmarmrcolor'] 	= Color(0,255,155,255), -- Max armor value color.
		--
		['tmarmrpos'] 		= {x = 260, y = 1037}, -- Max armor text pos.
		['tmarmrtext'] 		= "MAX", -- Max armor text.
		['tmarmrfont'] 		= "csb_font_barinfo", -- Max armor text font.
		['tmarmrcolor'] 	= Color(0,255,155,255), -- Max armor text color.
	},
	]]
	--[[
	['weaponname'] = {
		['bgwepnpos'] 		= {x = 1618, y = 922}, -- Weapon background pos.
		['bgwepnsize'] 		= {w = 260, h = 25}, -- Weapon background size.
		['bgwepnround']		= 8, -- Weapon background rounded corners.
		['bgwepncolor'] 		= Color(0, 0, 0, 155), -- Weapon background color.
		--
		['twepnpos'] 		= {x = 1748, y = 933.5}, -- Weapon name text (curently held) pos.
		['twepnfont'] 		= "csb_font_barinfo", -- Weapon name text (curently held) font.
		['twepncolor'] 		= Color(0,255,155,255), -- Weapon name text (curently held) color.
	},
	]]
	--[[
	['weaponstat'] = {
		['bgweppos'] 		= {x = 1618, y = 957}, -- Weapon stats background pos.
		['bgwepsize'] 		= {w = 260, h = 95}, -- Weapon stats background size.
		['bgwepround']		= 8, -- Weapon stats background rounded corners.
		['bgwepcolor'] 		= Color(0, 0, 0, 155), -- Weapon stats background color.
		--
		['n1weppos'] 		= {x = 1730, y = 1022}, -- Weapon stats clip value pos.
		['n1wepfont'] 		= "csb_font_ammoinfo", -- Weapon stats clip value font.
		['n1wepcolor'] 		= Color(0,255,155,255), -- Weapon stats clip value color.
		--
		['n2weppos'] 		= {x = 1830, y = 1017}, -- Weapon stats reserve ammo value pos.
		['n2wepfont'] 		= "csb_font_ammoinfo2", -- Weapon stats reserve ammo value font.
		['n2wepcolor'] 		= Color(0,255,155,255), -- Weapon stats reserve ammo value color.
		--
		['n3weppos'] 		= {x = 1830, y = 973}, -- Weapon stats secondary ammo value pos.
		['n3wepfont'] 		= "csb_font_ammoinfo2", -- Weapon stats secondary ammo value font.
		['n3wepcolor'] 		= Color(0,255,155,255), -- Weapon stats secondary ammo value color.
		--
		['dmgweppos'] 		= {x = 1830, y = 970}, -- Weapon stats damage value pos.
		['dmgwepfont'] 		= "csb_font_ammoinfo2", -- Weapon stats damage value font.
		['dmgwepcolor'] 	= Color(0,255,155,255), -- Weapon stats damage value color.
		--
		['tweppos'] 		= {x = 1650, y = 1037}, -- Weapon stats ammo text pos.
		['tweptext'] 		= "AMMO", -- Weapon stats ammo text.
		['twepfont'] 		= "csb_font_barinfo", -- Weapon stats ammo text font.
		['twepcolor'] 		= Color(0,255,155,255), -- Weapon stats ammo text color.
		--
		['tpaweppos'] 		= {x = 1830, y = 1037}, -- Weapon stats reserve ammo text pos.
		['tpaweptext'] 		= "RESERVE", -- Weapon stats reserve ammo text.
		['tpawepfont'] 		= "csb_font_barinfo", -- Weapon stats reserve ammo text font.
		['tpawepcolor'] 	= Color(0,255,155,255), -- Weapon stats reserve ammo text color.
		--
		['tspweppos'] 		= {x = 1830, y = 993}, -- Weapon stats secondary ammo text pos.
		['tspweptext'] 		= "SPECIAL", -- Weapon stats secondary ammo text.
		['tspwepfont'] 		= "csb_font_barinfo", -- Weapon stats secondary ammo text font.
		['tspwepcolor'] 	= Color(0,255,155,255), -- Weapon stats secondary ammo text color.
		--
		['tdmgweppos'] 		= {x = 1830, y = 990}, -- Weapon stats damage text pos.
		['tdmgweptext'] 	= "DAMAGE", -- Weapon stats damage text.
		['tdmgwepfont'] 	= "csb_font_barinfo", -- Weapon stats damage text font.
		['tdmgwepcolor'] 	= Color(0,255,155,255), -- Weapon stats damage text color.
	},
	]]
}

SWEP.SuitOverlay = { -- Suits screen overlay with colormod built in.
['overlay'] = {
['texture'] = "",
['refract'] = 0,
},
['colormod'] = {
["$pp_colour_addr"] = 0,
["$pp_colour_addg"] = 0,
["$pp_colour_addb"] = 0,
["$pp_colour_brightness"] = 0,
["$pp_colour_contrast"] = 1,
["$pp_colour_colour"] = 1,
["$pp_colour_mulr"] = 0,
["$pp_colour_mulg"] = 0,
["$pp_colour_mulb"] = 0
},
}

SWEP.SuitAbilityPrimaryIcon = false -- Primary ability icon.
SWEP.SuitAbilitySecondaryIcon = false -- Secondary ability icon. 

SWEP.SuitAbilityIconColorTab = {
	['primary'] = Color(0,255,155,255),
	['secondary'] = Color(0,255,155,255),
}

SWEP.TPCameraPOS = {bone = "ValveBiped.Bip01_Head1", x = -20, y = 0, z = 0, crouch = 0} -- Thirdperson camera position. "crouch" applies when player is crouching and works as a multiplier.
SWEP.TPCameraPOSDefault = SWEP.TPCameraPOS

SWEP.PlyForceHeadRotation = { -- Can be used on models that don't normally support head rotation (won't have an effect on models that do).
['headbone'] 		= "", -- Name of a bone that should count as the head.
['yawlimit']		= 0, -- Max left/right.
['pitchlimit']		= 0, -- Max up/down
['rolllimit']		= 0	-- Max head tilt when looking left and right.
}

SWEP.PlyFootStepsTable = { -- Table used by the new footstep system.
['lfootbone'] 		= "ValveBiped.Bip01_L_Foot", -- Left foot bone.
['rfootbone'] 		= "ValveBiped.Bip01_R_Foot", -- Right foot bone

['lfootsound'] 		= { -- Sounds for the left foot.
['bloodyflesh'] 	= {"CSB.Flesh.StepLeft"},
['concrete'] 		= {"CSB.Concrete.StepLeft"},
['plaster'] 		= {"CSB.DryWall.StepLeft"},
['ceiling_tile'] 	= {"CSB.CeilingTile.StepLeft"},
['dirt'] 			= {"CSB.Dirt.StepLeft"},
['flesh']			= {"CSB.Flesh.StepLeft"},
['metalgrate'] 		= {"CSB.MetalGrate.StepLeft"},
['chainlink'] 		= {"CSB.ChainLink.StepLeft"},
['snow'] 			= {"CSB.Snow.StepLeft"},
['plastic'] 		= {"CSB.PlasticBox.StepLeft"},
['plastic_box'] 	= {"CSB.PlasticBox.StepLeft"},
['plastic_barrel'] 	= {"CSB.PlasticBarrel.StepLeft"},
['solidmetal'] 		= {"CSB.SolidMetal.StepLeft"},
['metal'] 			= {"CSB.SolidMetal.StepLeft"},
['metal_box'] 		= {"CSB.MetalBox.StepLeft"},
['sand'] 			= {"CSB.Sand.StepLeft"},
['antlionsand'] 	= {"CSB.Sand.StepLeft"},
['gravel'] 			= {"CSB.Gravel.StepLeft"},
['mud'] 			= {"CSB.Mud.StepLeft"},
['slime'] 			= {"CSB.Mud.StepLeft"},
['slipperyslime'] 	= {"CSB.Mud.StepLeft"},
['water'] 			= {"CSB.Water.StepLeft"},
['wade'] 			= {"CSB.Wade.StepLeft"},
['tile'] 			= {"CSB.Tile.StepLeft"},
['grass'] 			= {"CSB.Grass.StepLeft"},
['metalvent'] 		= {"CSB.MetalVent.StepLeft"},
['wood'] 			= {"CSB.Wood.StepLeft"},
['wood_crate'] 		= {"CSB.WoodCrate.StepLeft"},
['wood_panel'] 		= {"CSB.WoodPanel.StepLeft"},
['cardboard'] 		= {"CSB.Cardboard.StepLeft"},
['glass'] 			= {"CSB.Glass.StepLeft"},
['rubber'] 			= {"CSB.Rubber.StepLeft"},
['default'] 		= {"CSB.Concrete.StepLeft"},
['defaultstep'] 	= {"CSB.Concrete.StepLeft"}
},

['rfootsound'] = { -- Sounds for the right foot.
['bloodyflesh'] 	= {"CSB.Flesh.StepRight"},
['concrete'] 		= {"CSB.Concrete.StepRight"},
['plaster'] 		= {"CSB.DryWall.StepRight"},
['ceiling_tile'] 	= {"CSB.CeilingTile.StepRight"},
['dirt'] 			= {"CSB.Dirt.StepRight"},
['flesh']			= {"CSB.Flesh.StepRight"},
['metalgrate'] 		= {"CSB.MetalGrate.StepRight"},
['chainlink'] 		= {"CSB.ChainLink.StepRight"},
['snow'] 			= {"CSB.Snow.StepRight"},
['plastic'] 		= {"CSB.PlasticBox.StepRight"},
['plastic_box'] 	= {"CSB.PlasticBox.StepRight"},
['plastic_barrel'] 	= {"CSB.PlasticBarrel.StepRight"},
['solidmetal'] 		= {"CSB.SolidMetal.StepRight"},
['metal'] 			= {"CSB.SolidMetal.StepRight"},
['metal_box'] 		= {"CSB.MetalBox.StepRight"},
['sand'] 			= {"CSB.Sand.StepRight"},
['antlionsand'] 	= {"CSB.Sand.StepRight"},
['gravel'] 			= {"CSB.Gravel.StepRight"},
['mud'] 			= {"CSB.Mud.StepRight"},
['slime'] 			= {"CSB.Mud.StepRight"},
['slipperyslime'] 	= {"CSB.Mud.StepRight"},
['water'] 			= {"CSB.Water.StepRight"},
['wade'] 			= {"CSB.Wade.StepRight"},
['tile'] 			= {"CSB.Tile.StepRight"},
['grass'] 			= {"CSB.Grass.StepRight"},
['metalvent'] 		= {"CSB.MetalVent.StepRight"},
['wood'] 			= {"CSB.Wood.StepRight"},
['wood_crate'] 		= {"CSB.WoodCrate.StepRight"},
['wood_panel'] 		= {"CSB.WoodPanel.StepRight"},
['cardboard'] 		= {"CSB.Cardboard.StepRight"},
['glass'] 			= {"CSB.Glass.StepRight"},
['rubber'] 			= {"CSB.Rubber.StepRight"},
['default'] 		= {"CSB.Concrete.StepRight"},
['defaultstep'] 	= {"CSB.Concrete.StepRight"}
},

['lfootsoundrun'] 	= {""},
['rfootsoundrun'] 	= {""},
['runsndminspeed']	= 120,

['bothstep']		= { -- Aka landing sounds and ladder.
['ladder']			= {"CSB.Ladder.StepLeft","CSB.Ladder.StepRight"},
['bloodyflesh'] 	= {"CSB.Flesh.StepLeft","CSB.Flesh.StepRight"},
['concrete'] 		= {"CSB.Concrete.Land"},
['plaster'] 		= {"CSB.DryWall.StepLeft","CSB.DryWall.StepRight"},
['ceiling_tile'] 	= {"CSB.CeilingTile.StepLeft","CSB.CeilingTile.StepRight"},
['dirt'] 			= {"CSB.Dirt.Land"},
['flesh']			= {"CSB.Flesh.StepLeft","CSB.Flesh.StepRight"},
['metalgrate'] 		= {"CSB.MetalGrate.Land"},
['chainlink'] 		= {"CSB.ChainLink.StepLeft","CSB.ChainLink.StepRight"},
['snow'] 			= {"CSB.Snow.Land"},
['plastic'] 		= {"CSB.PlasticBox.StepLeft","CSB.PlasticBox.StepRight"},
['plastic_box'] 	= {"CSB.PlasticBox.StepLeft","CSB.PlasticBox.StepRight"},
['plastic_barrel'] 	= {"CSB.PlasticBarrel.StepLeft","CSB.PlasticBarrel.StepRight"},
['solidmetal'] 		= {"CSB.SolidMetal.Land"},
['metal'] 			= {"CSB.SolidMetal.Land"},
['metal_box'] 		= {"CSB.SolidMetal.Land"},
['sand'] 			= {"CSB.Sand.Land"},
['antlionsand'] 	= {"CSB.Sand.Land"},
['antlionsand'] 	= {"CSB.Sand.Land"},
['gravel'] 			= {"CSB.Gravel.Land"},
['mud'] 			= {"CSB.Mud.Land"},
['slime'] 			= {"CSB.Mud.Land"},
['slipperyslime'] 	= {"CSB.Mud.Land"},
['water'] 			= {"CSB.Water.StepLeft","CSB.Water.StepRight"},
['wade'] 			= {"CSB.Wade.StepLeft","CSB.Wade.StepRight"},
['tile'] 			= {"CSB.Tile.Land"},
['grass'] 			= {"CSB.Grass.Land"},
['metalvent'] 		= {"CSB.MetalVent.Land"},
['wood'] 			= {"CSB.Wood.StepLeft","CSB.Wood.StepRight"},
['wood_crate'] 		= {"CSB.WoodCrate.StepLeft","CSB.WoodCrate.StepRight"},
['wood_panel'] 		= {"CSB.WoodPanel.StepLeft","CSB.WoodPanel.StepRight"},
['cardboard'] 		= {"CSB.Cardboard.Land"},
['glass'] 			= {"CSB.Glass.Land"},
['rubber'] 			= {"CSB.Rubber.Land"},
['default'] 		= {"CSB.Concrete.Land"},
['defaultstep'] 	= {"CSB.Concrete.Land"}
},

['stepcolboxmin'] 	= Vector(-3, -3, 0.45), -- Foot hitbox.
['stepcolboxmax'] 	= Vector(3, 3, 5), -- Foot hitbox.
['grounddist'] 		= 7, -- Hitbox height.
['toeposmul'] 		= 0, -- Hitbox forward/backward position.
['fssounddelay'] 	= 0.05, -- Extra delay between footsteps just in case, you don't really have to touch this.
['deffssound'] 		= false -- if you want default footsteps to be heard.
}

SWEP.RunSpeed = 500 -- Player's max run speed.
SWEP.WalkSpeed = 250 -- Player's max walk speed.
SWEP.WalkSpeedAlt = 150 -- Player's max alt walk speed.
SWEP.CrouchedWalkSpeed = 1 -- Player's max crouch speed (multiplier).
SWEP.JumpPower = 200 -- Jump height.

SWEP.PlyHealth = 100 -- Player health value on suit equip.
SWEP.PlyMaxHealth = 100 -- Max health.
SWEP.PlyArmor = 100 -- Player armor value on suit equip. 
SWEP.PlyMaxArmor = 100 -- Max armor.

SWEP.HideWeapons = false -- Make weapons invisible.
SWEP.CanPickUpWeapons			= true -- Don't allow player to pick up any weapons.
SWEP.WeaponBlackList			= {} -- Don't allow player to pick up these weapons.
SWEP.WeaponWhiteList			= {} -- Allow player to only pick up these weapons.

SWEP.Equipment = {
['weapons'] = { -- Weapons that player gets when equiping the suit. Bool is used to set if given weapon should come with empty mag or not.
	--[1] = {"weapon_pistol", true}
},
['ammo'] 	= { -- Well... Ammo.
	--[1] 	= {"Pistol", 54},
},
}

SWEP.CSB_Allies = { -- Friendly NPCs by class.
--['npc_citizen'] 		= true,
}

SWEP.VJ_NPC_Class = { -- Used for VJ Base.
--"CLASS_PLAYER_ALLY"
}

SWEP.CSB_AllyMarkers = {
['allymarksymbol'] 			= "u", -- An icon that will appear above allies.
['allymarkfont'] 			= "Marlett", -- Font.
['allymarkcolor'] 			= Color(0, 255, 255, 255), -- Icon color.
['allymarkcoloroutline'] 	= Color(0, 0, 0, 255) -- Icon's outline color.
}

SWEP.CSBActionMenuData = { -- You can set up to 9 different custom actions to be accessed from this menu.
['title'] = "none", -- Menu tittle.
['button1'] = "none", -- Button text.
['button2'] = "none",
['button3'] = "none",
['button4'] = "none",
['button5'] = "none",
['button6'] = "none",
['button7'] = "none",
['button8'] = "none",
['button9'] = "none",
['menuc'] = Color(255, 0, 0, 255), -- Menu color.
['tfont'] = "DermaDefaultBold", -- Button text font.
['tcolor'] = Color(0, 0, 0, 255), -- Button text color.
['buttonc'] = Color(0, 255, 0, 255), -- Button color.
['buttonchover'] = Color(0, 0, 255, 255) -- Button color when hovered over with mouse.
}

SWEP.PlyMeleeTable = { -- A table with all melee related stuff.
--['meleesound']	= "", -- Melee voiceline.
--['meleedmg']	= 0, -- Melee damage.
--['meleerang']	= 0, -- Melee range.
--['meleeanims']	= {}, -- Table with animations, you can also use bone anims here.
--['dmgdelay'] 	= {} -- Let's say that your melee animation goes for 1 second and dmgdelay is set to 0.4. Damage will be applied after 0.6 sec.
}

SWEP.DoorKickTable = {
--['dksound']		= "CSBPlySound.Metropolice.Melee", -- Door kick sound. Good for like... Grunts or something.
--['dkvl']		= SWEP.CSBDoorKickVL, -- Good for voice lines.
--['dkvld']		= 0, -- Voice line delay, same thing as with dmgdelay.
--['dkrang']		= 32, -- Door detection range.
--['dkanims']	= {"csb_door_kick"}, -- Door kick animation.
--['dkopendelay'] = {0.7} -- animation duration - dkopendelay = moment at which door will get kicked
}

SWEP.PlyGrenadeTable = { -- Table used by grenade throw function.
--['gsound']		= SWEP.CSBMetroGrenade, -- Voice line.
--['gentity']		= "npc_grenade_frag", -- Entity to be used as the grenade
--['gammo']		= "Grenade",
--['gmodel']		= "models/weapons/w_npcnade.mdl", -- Grenade model.
--['gmaterial']	= "", -- Grenade material.
--['gfuse']		= "3", -- Fuse time (for npc_grenade_frag).
--['gforce']		= 7000, -- Throw force.
--['gselfremove']	= 10, -- Auto remove just in case in seconds.
--['gsounddelay']	= 0.55, -- Sound delay.
--['ganims']		= {"swing"}, -- Grenade throw animations.
--['gdelay'] 		= {0.55}, -- Grenade spawn delay.
--['gbone']		= "ValveBiped.Bip01_R_Hand", -- Bone to attach fake grenade to.
--['gpos']		= Vector(-5,-20,60), -- Grenade spawn pos.
--['gang']		= Angle(0,0,0), -- Grenade spawn angle.
--['gppos']		= Vector(3,-2,0), -- Fake grenade spawn pos.
--['gpang']		= Angle(0,0,0) -- Fake grenade spawn angle.
}

SWEP.VehicleHide = true -- Player will turn invisible if no bone merge could be found.
SWEP.VehicleAnim = {} -- Vehicle bone merge table.

SWEP.AnimationStatesTab = { -- Sets which value (column) of animation translation table we should use. Usefull if we have more than 2 sets of animations.
['idle'] 	= {1, 0, 1}, -- The first value sets the animation state when called, the second sets for how long and the third is the return state. If the second value is set to 0, the initial state will be permanent until overwritten.
['alert'] 	= {2, 5, 1}, -- When enemy seen.
['combat'] 	= {2, 3, 1}, -- When LMB or RMB pressed.
['grenade'] = {2, 3, 1}, -- When grenade thrown.
['doork'] 	= {2, 3, 1}, -- When door kicked.
['melee'] 	= {2, 3, 1}, -- Wheen melee.
['hurt'] 	= {2, 10, 1}, -- Wheen took damage.
['lowhp'] 	= {2, 0, 1} -- When low HP. WIP
}

SWEP.CameraRotationGestures = { -- Animations played when turning your camera.
--['left'] = "",
--['right'] = ""
}

SWEP.WeaponSwapAnim = { -- Weapon deploy animations based on hold type.
--[[
['pistol']		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['duel']		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['revolver'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['smg'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['ar2'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['shotgun'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['rpg'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['crossbow'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['camera'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['physgun'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['melee']		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['melee2'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['knife'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['fist'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['grenade'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['slam'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['normal'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['passive'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
},
['invalid'] 	= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {1,0,1},
}
]]
}

SWEP.WeaponPrimaryGesture = { -- Weapon fireing gestures

}

SWEP.WeaponSecondaryGesture = { -- Alt fire gestures?
['pistol']		= "",
['duel']		= "",
['revolver'] 	= "",
['smg'] 		= "",
['ar2'] 		= "",
['shotgun'] 	= "",
['rpg'] 		= "",
['crossbow'] 	= "",
['camera']		= "",
['physgun'] 	= "",
['melee']		= "",
['melee2'] 		= "",
['knife'] 		= "",
['fist']  		= "",
['grenade'] 	= "",
['slam'] 		= "",
['normal'] 		= "",
['passive'] 	= "",
['invalid']		= ""
}

SWEP.WeaponReloadGesture = { -- Reloading gestures.
['pistol']		= "",
['duel']		= "",
['revolver']	= "",
['smg'] 		= "",
['ar2'] 		= "",
['shotgun'] 	= "",
['rpg'] 		= "",
['crossbow'] 	= "",
['camera'] 		= "",
['physgun'] 	= "",
['melee']		= "",
['melee2'] 		= "",
['knife'] 		= "",
['fist']  		= "",
['grenade'] 	= "",
['slam'] 		= "",
['normal'] 		= "",
['passive'] 	= "",
['invalid']		= ""
}

SWEP.FlinchGestures = {
['1']		= "", -- HITGROUP_HEAD
['2']		= "", -- HITGROUP_CHEST
['3']		= "", -- HITGROUP_STOMACH
['4']		= "", -- HITGROUP_LEFTARM
['5']		= "", -- HITGROUP_RIGHTARM
['6']		= "", -- HITGROUP_LEFTLEG
['7']		= "", -- HITGROUP_RIGHTLEG
['fgdelay']		= 0.02, -- Delay between flinch animations.
['fglast']		= 0 -- Don't change that.
}

SWEP.FallAnimations = {}
SWEP.CSBRelationLast = 0
SWEP.CSBRelationDelay = 1

function SWEP:LoadVariables() -- Put here anything that you wish to reload on level transition.
print("shrex")
end

function SWEP:CSBFancyPhysics()
	self:SetMoveType( MOVETYPE_FLYGRAVITY )
	self:SetMoveCollide( MOVECOLLIDE_FLY_BOUNCE )
end

SWEP.WorldModelSpawnPose = {

}

function SWEP:CSBHoloPlay() end

function SWEP:HoloPlay()

	if self.WorldModelAnim != false and isstring(self.WorldModelAnim) then
	
		local spawnanim = self:LookupSequence(self.WorldModelAnim)
		self:SetSequence(spawnanim)
		self:SetPlaybackRate(self.WorldModelAnimPlaybackRate)
		
	elseif self.WorldModelAnim == false or !isstring(self.WorldModelAnim) then
	
		self:CSBEditBone(self.WorldModelSpawnPose)
		
	end
	
	self:SetModelScale(self.WorldModelScale, 0)
	
	self:CSBHoloPlay()
	
end

function SWEP:CSBEquipEffect(ply, bool)
	
	local equiped = EffectData()
	equiped:SetStart( ply:GetPos() )
	equiped:SetOrigin( ply:GetPos() )
	equiped:SetMagnitude(0)
	equiped:SetEntity( ply )
	util.Effect( "propspawn", equiped )

	timer.Simple(0.1, function()
	
	if !IsValid(self) or !IsValid(ply) or !ply:Alive() then return end
		
		if self.EquipAnimation != nil and bool == true then
			
			local camtable = {x = 0, y = 0, z = 80, crouch = 2}
			ply:SendCSBAnimation(6, self.EquipAnimation, true, GetConVar("csb_thirdperson"):GetBool(), GetConVar("csb_thirdperson"):GetBool(), camtable, 0, true)

		end	
		
	end)
	
end

function SWEP:CSBSetLooks(ply)
	
	ply.OldSkin = ply:GetSkin()
	ply:SetSkin(self.PlySkin || 0)
		
	ply.OldColor = ply:GetColor()
	ply:SetColor(self.PlyColor)
	ply.CSBCurColor = ply:GetColor()
	
	if (SERVER) && ply:IsPlayer() then
		net.Start("csb_player_col_cl")
		net.WriteColor(ply.CSBCurColor)
		net.Send(ply)
	end
	
	if ply:IsPlayer() then
		ply.OldPlyColor = ply:GetPlayerColor()
		ply:SetPlayerColor(self.PlyPlayerColor:ToVector())
		ply:PlayerColorUpdate(self.PlyColor, self.PlyPlayerColor:ToVector())
	end
	
	ply.CSBOldBGS = {}
		
	for i = 1, ply:GetNumBodyGroups() do		
		if !table.HasValue( ply.CSBOldBGS, i ) then table.insert( ply.CSBOldBGS, i ) end		
	end
		
	for i = 1, #ply.CSBOldBGS do		
		ply.CSBOldBGS[ i ] = ply:GetBodygroup( i )	
	end
	
	if self.PlyBodyGroups then
					
		ply.CSBCurBGS = {}
		
		for i = 1, #self.PlyBodyGroups do				
			local curBG = self.PlyBodyGroups[ i ]
			local curBGR = curBG && istable(curBG) && math.random( curBG[ 1 ], curBG[ 2 ] ) || curBG || ply:GetBodygroup( i )					
			ply:SetBodygroup( i, curBGR )					
		end
				
		for i = 1, ply:GetNumBodyGroups() do		
			if !table.HasValue( ply.CSBCurBGS, i ) then table.insert( ply.CSBCurBGS, i ) end		
		end
		
		for i = 1, #ply.CSBCurBGS do		
			ply.CSBCurBGS[ i ] = ply:GetBodygroup( i )	
		end
		
		if (SERVER) && ply:IsPlayer() then
			net.Start("csb_player_bgs_cl")
			net.WriteTable(ply.CSBCurBGS)
			net.Send(ply)
		end
		
	end
	
	ply.CSBOldSMS = {}
		
	for i = 0, #ply:GetMaterials() do			
		ply.CSBOldSMS[ i + 1 ] = ply:GetSubMaterial( i ) || ply:GetMaterials()[ i ]	
	end
	
	if self.PlySubMaterials then
				
		ply.CSBCurSMS = {}
		
		for i = 1, #self.PlySubMaterials do
			local curSM = self.PlySubMaterials[ i ]
			local curSMR = curSM && istable(curSM) && curSM[ math.random( 1, #curSM ) ] || curSM || ply:GetMaterials()[ i ]	
			ply:SetSubMaterial( i - 1, curSMR )		
		end
				
		for i = 0, #ply:GetMaterials() do			
			ply.CSBCurSMS[ i + 1 ] = ply:GetSubMaterial( i ) || ply:GetMaterials()[ i ]	
		end
		
		if (SERVER) && ply:IsPlayer() then	
			net.Start("csb_player_sms_cl")
			net.WriteTable(ply.CSBCurSMS)
			net.Send(ply)
		end
		
	end
	
end

function SWEP:CSBRestoreLooks(ply)
	
	ply:SetSkin(ply.OldSkin || 0)
	ply.OldColor = ply.OldColor || Color(255,255,255,255)	
	ply:SetColor(ply.OldColor)
	ply:SetNW2Vector( "CSB_CurColor", !ply:CSBAlive() && ply:GetNW2Vector( "CSB_CurColor" ) || nil )
	
	if ply:IsPlayer() then
		ply.OldPlyColor = ply.OldPlyColor || Vector(1,1,1)	
		ply:SetPlayerColor(ply.OldPlyColor)		
		ply:PlayerColorUpdate(ply.OldColor, ply.OldPlyColor)
	end
	
	ply:SetMaterial("")
	
	if ply.CSBOldBGS then
		
		for i = 1, #ply.CSBOldBGS do							
			ply:SetBodygroup( i, ply.CSBOldBGS[ i ] )					
		end
		
		ply.CSBCurBGS = !ply:CSBAlive() && ply.CSBCurBGS || {}
		ply.CSBOldBGS = {}
		
	end
				
	if ply.CSBOldSMS then
		
		for i = 1, #ply.CSBOldSMS do
			ply:SetSubMaterial( i - 1, ply.CSBOldSMS[ i ] )				
		end

		ply.CSBCurSMS = !ply:CSBAlive() && ply.CSBCurSMS || {}
		ply.CSBOldSMS = {}

	end
	
end

function SWEP:CSBPreSuitApply() end ---- CUSTOM

function SWEP:CSBSuitApply(animbool)
	
	self:CSBPreSuitApply()
	
	timer.Simple(0.1, function()
	
		if !IsValid(self) then return end
		
		self:LoadVariables()
		
	end)
	
	if self.EquipSound != nil then self.Owner:EmitServerSound(self.EquipSound) end
	
	self:SetNW2Entity("CSB_SuitUser", self.Owner)
	self.Owner:SetNW2Entity("CSB_UserSuit", self)	
	self.Owner:SetNW2Int("CSB_AnimatonState", 1)	
	self.Owner:SetNW2Int("CSB_AnimatonStateSpare", 1)
	self.Owner:SetNW2Bool("CSB_ShowAllies", true)	
	self.Owner:SetNW2String("CSB_CurrentSuitModel", self:GetClass())	
	self.Owner:SetNW2String("CSB_OldModel", self.Owner:GetModel())	
	self.Owner:SetNW2String("CSB_OldHandsModel", self.Owner:GetHands():GetModel())	
	--self.Owner:SetNW2String("CSB_OldHandsMaterial", self.Owner:GetHands():GetMaterial())
	
	if self.PlyHealth != nil then self.Owner:SetHealth(self.PlyHealth) end
	
	if self.PlyMaxHealth != nil then	
		self.Owner:SetNW2Float("CSB_DefaultPlayerMaxHealth", self.Owner:GetMaxHealth())
		self.Owner:SetMaxHealth(self.PlyMaxHealth)		
	end
			
	if self.PlyArmor != nil then self.Owner:SetArmor(self.PlyArmor) end
	
	if self.PlyMaxArmor != nil then	
		self.Owner:SetNW2Float("CSB_DefaultPlayerMaxArmor", self.Owner:GetMaxArmor())
		self.Owner:SetMaxArmor(self.PlyMaxArmor)		
	end
	
	if self.PlyModel != nil then	
		self.Owner:SetModel(self.PlyModel)
		self.Owner:SetNW2String("CSB_PlayerBasedModel", self.PlyModel)		
	end	
	
	if self.PlyHandsModel != nil then self.Owner:GetHands():SetModel(self.PlyHandsModel) end		
	if self.PlyHandsMaterial != nil then self.Owner:GetHands():SetMaterial(self.PlyHandsMaterial) end		
	self.Owner:SetNW2Float("CSB_DefaultRunSpeed",self.Owner:GetRunSpeed())	
	if self.RunSpeed != nil then self.Owner:SetRunSpeed(self.RunSpeed) end	
	self.Owner:SetNW2Float("CSB_DefaultWalkSpeed",self.Owner:GetWalkSpeed())	
	if self.WalkSpeed != nil then self.Owner:SetWalkSpeed(self.WalkSpeed) end
	self.Owner:SetNW2Float("CSB_DefaultWalkSpeedAlt",self.Owner:GetWalkSpeed())	
	if self.WalkSpeedAlt != nil then self.Owner:SetSlowWalkSpeed(self.WalkSpeedAlt) end	
	self.Owner:SetNW2Float("CSB_DefaultCrouchedWalkSpeed",self.Owner:GetCrouchedWalkSpeed())	
	if self.CrouchedWalkSpeed != nil then self.Owner:SetCrouchedWalkSpeed(self.CrouchedWalkSpeed) end	
	self.Owner:SetNW2Float("CSB_DefaultJumpPower",self.Owner:GetJumpPower())	
	if self.JumpPower != nil then self.Owner:SetJumpPower(self.JumpPower) end
	
	self.Owner.VJ_NPC_Class = self.VJ_NPC_Class	
	self.Owner.CSB_Allies = self.CSB_Allies
	
	if (SERVER) then
		
		self:CSBSetLooks(self.Owner)
		
		self:CSBPrimaryIconColor(self.Owner, self.SuitAbilityIconColorTab.primary)
		self:CSBSecondaryIconColor(self.Owner, self.SuitAbilityIconColorTab.secondary)
		
		self:CSBGiveEquipment(self.Owner)

		net.Start("csb_relations_table_to_client")
		net.WriteEntity(self.Owner)
		net.WriteTable(self.Owner.VJ_NPC_Class)
		net.WriteTable(self.Owner.CSB_Allies)
		net.Broadcast()
	
		timer.Simple(1, function()
	
			if !IsValid(self) or !IsValid(self.Owner) or !self.NotifyTab then return end
			
			self.NotifyTab.notmdlpan.model = self.Owner:GetModel()
			self.NotifyTab.notmdlpan.mcolor = self.Owner:GetColor()
			self.NotifyTab.notmdlpan.skin = self.Owner:GetSkin()
			self.NotifyTab.notmdlpan.bgtab = self.Owner.CSBCurBGS
			self.NotifyTab.notmdlpan.smtab = self.Owner.CSBCurSMS
			
			net.Start("CSB_Info_Notify")
			net.WriteTable(self.NotifyTab)
			net.Send(self.Owner)

		end)

	end
	
	self:CSBPostSuitApply()
	
	local animbool = animbool or false
	
	if animbool != true or self.Owner.CSBPlayEAnimation != true then return end
	
	self:CSBEquipEffect(self.Owner, animbool)
	
end

function SWEP:CSBPostSuitApply() end ---- CUSTOM

function SWEP:CSBSuitDrop()

	local ply = self:GetNW2Entity("CSB_SuitUser")
	
	if self.DropSound != nil then ply:EmitServerSound(self.DropSound) end
		
	ply:SetNW2Bool("CSB_PlayerGesture_DontLoop", nil)
	ply:SetNW2Bool("CSB_PlayingAnim", false)
	ply:SendCSBAnimation(0,nil, nil, nil, nil, nil, nil, nil, nil)
	ply:SetNW2Int("CSB_AnimatonState", 1)
	
	ply:SetMaterial("")
	ply:CSBResetBone()
	
	ply:SetNW2Bool("CSB_ShowAllies", false)	
	ply:SetNW2String("CSB_CurrentSuitModel", nil)	
	ply:SetModel(ply:GetNW2String("CSB_OldModel"))
	
	if ply:GetNW2String("CSB_OldHandsModel") != nil and IsValid(ply:GetHands()) then ply:GetHands():SetModel(ply:GetNW2String("CSB_OldHandsModel")) end	
	ply:SetNW2String("CSB_PlayerBasedModel", nil)	
	if self.RunSpeed != nil then ply:SetRunSpeed(ply:GetNW2Float("CSB_DefaultRunSpeed")) end	
	if self.WalkSpeed != nil then ply:SetWalkSpeed(ply:GetNW2Float("CSB_DefaultWalkSpeed")) end	
	if self.WalkSpeedAlt != nil then ply:SetSlowWalkSpeed(ply:GetNW2Float("CSB_DefaultWalkSpeedAlt")) end	
	if self.CrouchedWalkSpeed != nil then ply:SetCrouchedWalkSpeed(ply:GetNW2Float("CSB_DefaultCrouchedWalkSpeed")) end		
	if self.JumpPower != nil then ply:SetJumpPower(ply:GetNW2Float("CSB_DefaultJumpPower")) end
	
	ply.VJ_NPC_Class = {}	
	ply.CSB_Allies = {}
	
	if (SERVER) then
				
		self:CSBRestoreLooks(ply)
		
		self:CSBRelationsRESTORE(ply)
		if IsValid(ply:GetHands()) then ply:GetHands():SetMaterial("") end
		
		if self.PlyMaxHealth != nil then	
			ply:SetMaxHealth(ply:GetNW2Float("CSB_DefaultPlayerMaxHealth"))
			if ply:Health() > ply:GetMaxHealth() or ply:Health() == self.PlyMaxHealth then ply:SetHealth(ply:GetMaxHealth()) end		
		end
	
		if self.PlyMaxArmor != nil then
			ply:SetMaxArmor(ply:GetNW2Float("CSB_DefaultPlayerMaxArmor"))
			if ply:Armor() > ply:GetMaxArmor() or ply:Armor() == self.PlyMaxArmor then ply:SetArmor(ply:GetMaxArmor()) end	
		end
	
		net.Start("csb_relations_table_to_client")
		net.WriteEntity(ply)
		net.WriteTable(ply.VJ_NPC_Class)
		net.WriteTable(ply.CSB_Allies)
		net.Broadcast()
		
		self:CSBStripEquipment(ply)
		
	end
	
	undo.Create( self.PrintName )
	undo.AddEntity( self )
	undo.SetPlayer( ply )
	undo.Finish()
	
	if self.EnableFancyPhysics == true then self:CSBFancyPhysics() end
	if self.TimerThink != nil and timer.Exists(self.TimerThink) then timer.Remove(self.TimerThink) end
	
	self:CSBEquipEffect(ply, false)
	
	ply:SetNW2Entity("CSB_UserSuit", false)
	
	if self.SAM_Modified == true then ply:CSB_MessageToPlayer(self.PrintName, "S.A.M. Modification Detected! Removing...", 255, 0, 0); SafeRemoveEntity(self) end
	
	self:SetNW2Entity("CSB_SuitUser", false)

end

function SWEP:CSBSuitStrip()
	
	--self.Owner:SetMaterial("")	
	--self.Owner:SetColor(Color(255,255,255,255))
	self.Owner:SetNW2Bool("CSB_PlayerGesture_DontLoop", nil)	
	self.Owner:SetNW2Bool("CSB_PlayingAnim", false)	
	self.Owner:SendCSBAnimation(0, nil, nil, nil, nil, nil, nil, nil, nil)	
	self.Owner:SetNW2Int("CSB_AnimatonState", 1)	
	self.Owner:CSBResetBone()	

	self.Owner:SetNW2Bool("CSB_ShowAllies", false)
	self.Owner:SetModel(self.Owner:GetNW2String("CSB_OldModel"))
	
	--if SERVER and self.Owner:GetNW2String("CSB_OldHandsModel") != nil then self.Owner:GetHands():SetModel(self.Owner:GetNW2String("CSB_OldHandsModel")) end
	
	self.Owner:SetNW2String("CSB_PlayerBasedModel", nil)	
	if self.RunSpeed != nil then self.Owner:SetRunSpeed(self.Owner:GetNW2Float("CSB_DefaultRunSpeed")) end	
	if self.WalkSpeed != nil then self.Owner:SetWalkSpeed(self.Owner:GetNW2Float("CSB_DefaultWalkSpeed")) end	
	if self.WalkSpeedAlt != nil then self.Owner:SetSlowWalkSpeed(self.Owner:GetNW2Float("CSB_DefaultWalkSpeedAlt")) end	
	if self.CrouchedWalkSpeed != nil then self.Owner:SetCrouchedWalkSpeed(self.Owner:GetNW2Float("CSB_DefaultCrouchedWalkSpeed")) end	
	if self.JumpPower != nil then self.Owner:SetJumpPower(self.Owner:GetNW2Float("CSB_DefaultJumpPower")) end	
	if self.TimerThink != nil and timer.Exists(self.TimerThink) then timer.Remove(self.TimerThink) end
	
	self.Owner.VJ_NPC_Class = {}	
	self.Owner.CSB_Allies = {}
	
	if (SERVER) then
		
		self:CSBRestoreLooks(self.Owner)
		
		self:CSBRelationsRESTORE(self.Owner)
		if IsValid(self.Owner:GetHands()) then self.Owner:GetHands():SetMaterial("") end
		
		if self.PlyMaxHealth != nil and self.Owner:Health() > 0 then	
			self.Owner:SetMaxHealth(self.Owner:GetNW2Float("CSB_DefaultPlayerMaxHealth"))
			if self.Owner:Health() > self.Owner:GetMaxHealth() then self.Owner:SetHealth(self.Owner:GetMaxHealth()) end		
		end
	
		if self.PlyMaxArmor != nil and self.Owner:Health() > 0 then
			self.Owner:SetMaxArmor(self.Owner:GetNW2Float("CSB_DefaultPlayerMaxArmor"))
			if self.Owner:Armor() > self.Owner:GetMaxArmor() then self.Owner:SetArmor(self.Owner:GetMaxArmor()) end	
		end

		net.Start("csb_relations_table_to_client")
		net.WriteEntity(self.Owner)
		net.WriteTable(self.Owner.VJ_NPC_Class)
		net.WriteTable(self.Owner.CSB_Allies)
		net.Broadcast()
		
		self:CSBStripEquipment(self.Owner)
		
	end
	
	self.Owner:SetNW2Entity("CSB_UserSuit", false)
	self:SetNW2Entity("CSB_SuitUser", false)
	
end

if (SERVER) then

function SWEP:CSBOnNPCStartFollow(npc) end

function SWEP:CSBOnNPCStopFollow(npc) end

function SWEP:CSBGiveEquipment(ply)

	if GetConVar("csb_give_weapons_and_ammo"):GetFloat() > 0 and ply:Alive() and self.Equipment then
	
		local wepTab = self.Equipment.weapons
		local ammoTab = self.Equipment.ammo 
	
		if wepTab and table.Count(wepTab) > 0 then
		
			for i = 1,#wepTab do
				
				local wepTabT = wepTab[i]
				
				ply:Give(wepTabT[1], wepTabT[2])
				
			end
			
		end
	
		if ammoTab and table.Count(ammoTab) > 0 then
			
			for i = 1,#ammoTab do
			
				local ammoTabT = ammoTab[i]
			
				if ply:GetAmmoCount( ammoTabT[1] ) < ammoTabT[2] then

					ply:GiveAmmo(ammoTabT[2], ammoTabT[1])
				
				end
				
			end
			
		end
	
	end
	
end

function SWEP:CSBStripEquipment(ply)

	if GetConVar("csb_strip_weapons_and_ammo"):GetFloat() > 0 and ply:Alive() and self.Equipment then
		
		local wepTab = self.Equipment.weapons
		local ammoTab = self.Equipment.ammo 
		
		if wepTab and table.Count(wepTab) > 0 then
			
			for i = 1,#wepTab do
				
				local wepTabT = wepTab[i]
				
				ply:StripWeapon(wepTabT[1])
				
			end
			
		end
		
		if ammoTab and table.Count(ammoTab) > 0 then
		
			for i = 1,#ammoTab do
				
				local ammoTabT = ammoTab[i]

				ply:RemoveAmmo(ammoTabT[2], ammoTabT[1])
				
			end
			
		end
		
	end
	
end

function SWEP:CSBRelationsSET(ply)
	
	if CurTime() - self.CSBRelationLast < self.CSBRelationDelay then return end
	
	for _, v in pairs( ents.GetAll() ) do
		
		if IsValid(v) and v:IsNPC() and ply.CSB_Allies and table.Count(ply.CSB_Allies) > 0 then
		--print(v:GetGroundSpeedVelocity():Length())
		
			if (SERVER) and v:Disposition(ply) == D_LI and v.IAlreadyLikedThemAll == nil then
				
				v.IAlreadyLikedThemAll = true 
					
			elseif (SERVER) and v:Disposition(ply) != D_LI and v.IAlreadyLikedThemAll == nil then
				
				v.IAlreadyLikedThemAll = false
					
			end
			
			if (SERVER) and v:Disposition(ply) == D_HT and v.IAlreadyHatedThemAll == nil then
				
				v.IAlreadyHatedThemAll = true 
					
			elseif (SERVER) and v:Disposition(ply) != D_HT and v.IAlreadyHatedThemAll == nil then
				
				v.IAlreadyHatedThemAll = false
					
			end
		
			if ply:IsNPCFriend(v) and !IsNPCIgnored(v) then
			
				v:CSB_NPCGiveWayToPlayer()
				
				if v:Disposition(ply) != D_LI and v.IAlreadyLikedThemAll == false then
				
				v:AddEntityRelationship(ply,D_LI,0)
				
					if v.IsVJBaseSNPC == true and table.HasValue(v.VJ_NPC_Class, "CLASS_PLAYER_ALLY") and table.HasValue(v.VJ_AddCertainEntityAsEnemy, ply) then
				
						table.RemoveByValue(v.VJ_AddCertainEntityAsEnemy, ply)
					
					end
					
				end
				
			elseif !ply:IsNPCFriend(v) and !IsNPCIgnored(v) then
				
				if (SERVER) and v:Disposition(ply) != D_HT and v.IAlreadyHatedThemAll == false and v:Visible(ply) then 
									
				if v.IsVJBaseSNPC == true and table.HasValue(v.VJ_NPC_Class, "CLASS_PLAYER_ALLY") and !table.HasValue(v.VJ_AddCertainEntityAsEnemy, ply) then
				
					table.insert(v.VJ_AddCertainEntityAsEnemy,ply)
					
				end
					
				v:AddEntityRelationship(ply,D_HT,0)	
					
				end
				
			end
			
		end
		
		if self.AnimationStatesTab and self.AnimationStatesTab.combat and ((v:IsNPC() and self.Owner:CSBVisibleInFOV(v) and !ply:IsNPCFriend(v)) or (v:IsPlayer() and v != self.Owner and self.Owner:CSBVisibleInFOV(v) and !ply:IsPlayerFriend(v))) then
		
			self.Owner:CSBSetAnimationState(self.AnimationStatesTab.combat[1],self.AnimationStatesTab.combat[2],self.AnimationStatesTab.combat[3])
			
		end
		
	end
	
	self.CSBRelationLast = CurTime() + self.CSBRelationDelay

end

function SWEP:CSBRelationsRESTORE(ply)

	for _, v in pairs( ents.GetAll() ) do
		
		if IsValid(v) and v:IsNPC() and ply.CSB_Allies and table.Count(ply.CSB_Allies) > 0 then

			if ply:IsNPCFriend(v) then
			
				if v:Disposition(ply) == D_LI and v.IAlreadyLikedThemAll != true then

				v:AddEntityRelationship(ply,D_HT,0)
		
				end
				
			elseif !ply:IsNPCFriend(v) then		
			
				if v:Disposition(ply) == D_HT then 
					
				if v.IsVJBaseSNPC == true and table.HasValue(v.VJ_NPC_Class, "CLASS_PLAYER_ALLY") and table.HasValue(v.VJ_AddCertainEntityAsEnemy, ply) then
				
					table.RemoveByValue(v.VJ_AddCertainEntityAsEnemy, ply)
					
				end
					
				if v.IAlreadyHatedThemAll == false then v:AddEntityRelationship(ply,D_LI,0)	end
					
				end
				
			end
			
		end
		
	end	
	
end

end

function SWEP:CThink() end --------------------------------------------------------------- CUSTOM

function SWEP:CSBThink()

	if (not timer.Exists(self.TimerThink)) then
	
		timer.Create(self.TimerThink, 0, 0, function()
		
			if !IsValid(self) or !IsValid(self.Owner) then return false end
		
			if (SERVER) then self:CSBRelationsSET(self.Owner) end
		
			self:CThink()
			
		end)
		
	end
	
end

function SWEP:CSBInitialize() end --------------------------------------------------------------- CUSTOM

function SWEP:Initialize()

	if self.EnableFancyPhysics == true then self:CSBFancyPhysics() end
	self:SetNW2Bool("CSB_Suit", true)
	self:SetHoldType(self.HoldType)
	self:DrawShadow(false)
	self:HoloPlay()
	self:CSBSetLooks(self)
	self:CSBInitialize()
	
end

function SWEP:CSBOnRestore() end --------------------------------------------------------------- CUSTOM

function SWEP:OnRestore()

	timer.Simple(1, function()	
	
		if IsValid(self) and IsValid(self.Owner) then
			
			self.dontEquip = false
			
			self:CSBSuitApply(false)
		
			if self.TimerThink == nil then self.TimerThink = "csb_relations_timer" .. self.Owner:EntIndex() .. "" .. self:EntIndex() .. "" end
		
			self:CSBThink()
		
			self:CSBOnRestore()
		
		 end
		
	end)
	
end

function SWEP:Equip()

	if IsValid(self.Owner) and self.Owner:FullyLoaded() then
	
		timer.Simple(0, function() self:CSBSuitApply(self.Owner:FullyLoaded()) end)
	
		self.FirstDeploy = true
	
		self.Owner:SelectWeapon(self:GetClass())
	
		if self.TimerThink == nil then self.TimerThink = "csb_relations_timer" .. self.Owner:EntIndex() .. "" .. self:EntIndex() .. "" end
	
		self:CSBThink()
	
	end
	
end

function SWEP:CSBDeploy() end --------------------------------------------------------------- CUSTOM

function SWEP:Deploy()

	if IsValid(self.Owner) and IsValid(self.Owner:GetViewModel()) then
	
		local plyvm = self.Owner:GetViewModel()
		local plyvmanim = plyvm:LookupSequence(self.VMEquipAnimation)
		plyvm:SendViewModelMatchingSequence(plyvmanim)
		self.ViewModel = ""
		
	end

	self:CSBDeploy()
	
end

function SWEP:CSBHolster() end --------------------------------------------------------------- CUSTOM

function SWEP:Holster()
	self:CSBHolster()
	return true
end

function SWEP:CSBPrimaryAbility() end --------------------------------------------------------------- CUSTOM

function SWEP:PrimaryAttack()
	if GetConVar("csb_allow_abilities"):GetFloat() <= 0 then return end
end

function SWEP:CSBSecondaryAbility() end --------------------------------------------------------------- CUSTOM

function SWEP:SecondaryAttack()
	if GetConVar("csb_allow_abilities"):GetFloat() <= 0 then return end
end

--function SWEP:CSBReload()
----------------------
--end

function SWEP:Reload()
	--if SERVER then self.Owner:DropWeapon(self) end
	--self:CSBReload()
end

function SWEP:CSBOnDrop() end --------------------------------------------------------------- CUSTOM

function SWEP:OnDrop()

	local ply = self:GetNW2Entity("CSB_SuitUser")
	
	self:CSBOnDrop()
	
	if IsValid(ply) then self:CSBSuitDrop() end
	
	self.ViewModel = "models/csb/c_equiphands.mdl"
	
	self:SetKeyValue( "spawnflags", "2")
	
	timer.Create("CSB_PickupDelay" .. self:EntIndex(), 4, 1, function()

		if !IsValid(self) then return end
		
		self:SetKeyValue( "spawnflags", "")
		
	end)
	
	self:HoloPlay()
	
end

function SWEP:SAMApply() end

function SWEP:CSBOnRemove() end --------------------------------------------------------------- CUSTOM

function SWEP:OnRemove()
	self:CSBOnRemove()
	if IsValid(self.Owner) then self:CSBSuitStrip() end
end
	
function SWEP:CSBAction1()
return false
end
function SWEP:CSBAction2() 
return false
end
function SWEP:CSBAction3() 
return false
end
function SWEP:CSBAction4() 
return false
end
function SWEP:CSBAction5() 
return false
end
function SWEP:CSBAction6() 
return false
end
function SWEP:CSBAction7() 
return false
end
function SWEP:CSBAction8() 
return false
end
function SWEP:CSBAction9() 
return false
end

SWEP.CSBPlyNPCCommand1 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand2 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand3 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}
--
SWEP.CSBPlyNPCCommand4 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand5 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand6 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}
 
SWEP.CSBPlyNPCCommand7 = {
	sound = {""},
	duration = {0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CommandOperator = "Overwatch"
SWEP.CommandOutOfRange = {"No friendly units in range..."}
SWEP.CommandTargetOutOfRange = {"Point out of range or invalid..."}
SWEP.CommandInvalid = {"No target..."}
SWEP.Command1Answer = {"copy, moving in..."}
SWEP.Command2Answer = {"charging the enemy..."}
SWEP.Command3Answer = {"going to the position..."}
SWEP.Command4Answer = {"following..."}
SWEP.Command5Answer = {"holding this position..."}
SWEP.Command6Answer = {"patrolling the area..."}
SWEP.Command7Answer = {"taking cover!"}

function SWEP:CSB_NPCCommand1()
	
	local inRange = false
	local ordTargF = self.Owner:GetNW2Entity("CSB_NPCOrderTargetF")
	local ordTargE = self.Owner:GetNW2Entity("CSB_NPCOrderTargetE")
	
	if IsValid(ordTargF) and IsValid(ordTargE) and ordTargF:IsNPC() then

		inRange = true
		ordTargF:CSB_NPCAlert(self.Owner, ordTargE, self.Command1Answer[math.random(1,#self.Command1Answer)])
	
	elseif !IsValid(ordTargF) and IsValid(ordTargE) then

		for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 5000) ) do
		
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and !IsNPCIgnored(npc) then
				
				if IsValid(ordTargE) then
					
					inRange = true
					npc:CSB_NPCAlert(self.Owner, ordTargE, self.Command1Answer[math.random(1,#self.Command1Answer)])
			
				end
	
			end
	
		end	
	
	end
	
	if !inRange then

		if IsValid(ordTargE) then 
			self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
		else
			self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandInvalid[math.random(1,#self.CommandInvalid)])
		end
	
		return
	
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand1, true)

end

function SWEP:CSB_NPCCommand2()
	
	local inRange = false
	local ordTarg = self.Owner:GetNW2Entity("CSB_NPCOrderTargetF")

	if IsValid(ordTarg) and ordTarg:IsNPC() and self.Owner:IsNPCFriend(ordTarg) then
		
		inRange = true
		ordTarg:CSB_NPCRushEnemy(self.Owner, self.Command2Answer[math.random(1,#self.Command2Answer)])
	
	elseif !IsValid(ordTarg) then

		for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 500) ) do
			
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and self.Owner:Visible(npc) then
				
				inRange = true
				npc:CSB_NPCRushEnemy(self.Owner, self.Command2Answer[math.random(1,#self.Command2Answer)])
			
			end
		
		end
	
	end
	
	if !inRange then

		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
		
		return
	
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand2, true)

end

function SWEP:CSB_NPCCommand3()
	
	local inRange = false
	local pointInRange = false
	
	for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 500) ) do
	
		local tr = self.Owner:GetEyeTrace()
		
		if tr.Hit then
			
			pointInRange = true
			
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and self.Owner:Visible(npc) then
				
				inRange = true
				npc:CSB_NPCGoToPos(tr.HitPos, self.Owner, self.Command3Answer[math.random(1,#self.Command3Answer)])
				
			end
			
		end
		
	end
	
	if !pointInRange then
		
		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandTargetOutOfRange[math.random(1,#self.CommandTargetOutOfRange)])
		
		return
		
	end
	
	if !inRange then

		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
		
		return
		
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand3, true)

end

function SWEP:CSB_NPCCommand4()
	
	local inRange = false
	local ordTarg = self.Owner:GetNW2Entity("CSB_NPCOrderTargetF")
		
	if IsValid(ordTarg) and ordTarg:IsNPC() and self.Owner:IsNPCFriend(ordTarg) then
		
		inRange = true
		ordTarg:CSB_NPCFollowPlayer(self.Owner, 100, 200, 200, 300, self.Command4Answer[math.random(1,#self.Command4Answer)])
	
	elseif !IsValid(ordTarg) then

		for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 500) ) do
			
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and self.Owner:Visible(npc) then
				
				inRange = true
				npc:CSB_NPCFollowPlayer(self.Owner, 100, 200, 200, 300, self.Command4Answer[math.random(1,#self.Command4Answer)])
			
			end
		
		end
	
	end
	
	if !inRange then

		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
		
		return
	
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand4, true)

end

function SWEP:CSB_NPCCommand5()
	
	local inRange = false
	local ordTarg = self.Owner:GetNW2Entity("CSB_NPCOrderTargetF")
		
	if IsValid(ordTarg) and ordTarg:IsNPC() and self.Owner:IsNPCFriend(ordTarg) then
		
		inRange = true
		ordTarg:CSB_NPCStop(self.Owner, self.Command5Answer[math.random(1,#self.Command5Answer)])
	
	elseif !IsValid(ordTarg) then

		for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 500) ) do
			
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and self.Owner:Visible(npc) then
				
				inRange = true
				npc:CSB_NPCStop(self.Owner, self.Command5Answer[math.random(1,#self.Command5Answer)])
			
			end
		
		end
	
	end
	
	if !inRange then

		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
		
		return
		
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand5, true)

end

function SWEP:CSB_NPCCommand6()
	
	local inRange = false
	local ordTarg = self.Owner:GetNW2Entity("CSB_NPCOrderTargetF")
		
	if IsValid(ordTarg) and ordTarg:IsNPC() and self.Owner:IsNPCFriend(ordTarg) then
		
		inRange = true
		ordTarg:CSB_NPCPatrol(self.Owner, self.Command6Answer[math.random(1,#self.Command6Answer)])
	
	elseif !IsValid(ordTarg) then

		for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 500) ) do
			
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and self.Owner:Visible(npc) then
				
				inRange = true
				npc:CSB_NPCPatrol(self.Owner, self.Command6Answer[math.random(1,#self.Command6Answer)])
			
			end
		
		end
	
	end
	
	if !inRange then

		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
		
		return
		
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand6, true)

end

function SWEP:CSB_NPCCommand7()
	
	local inRange = false
	local ordTarg = self.Owner:GetNW2Entity("CSB_NPCOrderTargetF")
		
	if IsValid(ordTarg) and ordTarg:IsNPC() and self.Owner:IsNPCFriend(ordTarg) then
		
		inRange = true
		ordTarg:CSB_NPCTakeCover(self.Owner, self.Command7Answer[math.random(1,#self.Command7Answer)])
	
	elseif !IsValid(ordTarg) then

		for _, npc in pairs( ents.FindInSphere(self.Owner:GetPos(), 500) ) do
			
			if npc:IsNPC() and self.Owner:IsNPCFriend(npc) and self.Owner:Visible(npc) then
				
				inRange = true
				npc:CSB_NPCTakeCover(self.Owner, self.Command7Answer[math.random(1,#self.Command7Answer)])
			
			end
		
		end
	
	end
	
	if !inRange then

		self.Owner:CSB_MessageToPlayer(self.CommandOperator, self.CommandOutOfRange[math.random(1,#self.CommandOutOfRange)])
	
		return
	end
	
	self.Owner:CSBEmitSoundSequence(self.CSBPlyNPCCommand7, true)
	
end

if CLIENT then --CLIENT--------------CLIENT------------------CLIENT-----------------------CLIENT-------------------------CLIENT----------------------CLIENT-----------------CLIENT

function SWEP:CSBDrawHUD() --------------------------------------------------------------- CUSTOM
end

function SWEP:DrawHUD()
	
	self:CSBDrawHUD()
end

function SWEP:CSBTranslateFOV(current_fov) --------------------------------------------------------------- CUSTOM
	return current_fov
end

function SWEP:TranslateFOV(current_fov)

	self:CSBTranslateFOV(current_fov)
end

function SWEP:CSBDrawWorldModel() --------------------------------------------------------------- CUSTOM
	if IsValid(self:GetOwner()) then
		self:DrawShadow(true)
	else
		self:DrawModel()
		self:DrawShadow(false)
	end
end

function SWEP:DrawWorldModel()
	self:CSBDrawWorldModel()
end

function SWEP:CSBPreDrawViewModel(vm, weapon, ply) end --------------------------------------------------------------- CUSTOM

function SWEP:PreDrawViewModel( vm, weapon, ply )
	self:CSBPreDrawViewModel(vm, weapon, ply)
end

function SWEP:CSBPostDrawViewModel( vm, weapon, ply ) end --------------------------------------------------------------- CUSTOM

function SWEP:PostDrawViewModel( vm, weapon, ply )
	self:CSBPostDrawViewModel( vm, weapon, ply )
end

function SWEP:CSBDrawWorldModelTranslucent() --------------------------------------------------------------- CUSTOM
	self.Weapon:DrawModel()
end

function SWEP:DrawWorldModelTranslucent()

	self:CSBDrawWorldModelTranslucent()
end

function SWEP:CSBAdjustMouseSensitivity() --------------------------------------------------------------- CUSTOM
	return nil
end

function SWEP:AdjustMouseSensitivity()
	self:CSBAdjustMouseSensitivity()
end

function SWEP:PrintWeaponInfo( x, y, alpha )
	//if ( self.DrawWeaponInfoBox == false ) then return end

	if (self.InfoMarkup == nil ) then
		local str
		local title_color = "<color=230,230,230,255>"
		local text_color = "<color=150,150,150,255>"
		
		str = "<font=HudSelectionText>"
		if ( self.Author != "" ) then str = str .. title_color .. "Author:</color>\t"..text_color..self.Author.."</color>\n" end
		if ( self.Contact != "" ) then str = str .. title_color .. "Contact:</color>\t"..text_color..self.Contact.."</color>\n\n" end
		if ( self.Purpose != "" ) then str = str .. title_color .. "Purpose:</color>\n"..text_color..self.Purpose.."</color>\n\n" end
		if ( self.AbilityPrimaryDesc != "" ) then str = str .. title_color .. "Primary Ability:</color>\n"..text_color..self.AbilityPrimaryDesc.."</color>\n" end
		if ( self.AbilitySecondaryDesc != "" ) then str = str .. title_color .. "Secondary Ability:</color>\n"..text_color..self.AbilitySecondaryDesc.."</color>\n" end
		str = str .. "</font>"
		
		self.InfoMarkup = markup.Parse( str, 250 )
	end
	
	surface.SetDrawColor( 60, 60, 60, alpha )
	surface.SetTexture( self.SpeechBubbleLid )
	
	surface.DrawTexturedRect( x, y - 64 - 5, 128, 64 ) 
	draw.RoundedBox( 8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, Color( 60, 60, 60, alpha ) )
	
	self.InfoMarkup:Draw( x+5, y+5, nil, nil, alpha )
	
end

end

RegisterLuaAnimation('csb_door_kick', {
	FrameData = {
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 90
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -140,
					RF = 10
				},
				['ValveBiped.Bip01_Head1'] = {
					RF = 32
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RR = 32,
					RF = -48
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -30
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -112,
					RR = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RR = -32,
					RF = 48
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -8.8888888888889,
					MF = -8.8888888888889,
					RR = -16,
					RF = -16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 16,
					RF = -16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -112,
					RR = 16
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -32,
					RR = -16,
					RF = -16
				},
				['ValveBiped.Bip01_Spine'] = {
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 64
				}
			},
			FrameRate = 3.3333333333333
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -90,
					RR = 16,
					RF = 10
				},
				['ValveBiped.Bip01_Head1'] = {
					RU = -16,
					RR = -16,
					RF = -24
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RF = -48
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -96,
					RR = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RF = 48
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -8.8888888888889,
					MF = 4.4444444444445,
					RR = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = -16,
					RF = 16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -48
				},
				['ValveBiped.Bip01_Spine'] = {
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 80
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -32
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 64
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -48,
					RR = 16,
					RF = 10
				},
				['ValveBiped.Bip01_Head1'] = {
					RF = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 32
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RR = 16,
					RF = -16
				},
				['ValveBiped.Bip01_Spine'] = {
				},
				['ValveBiped.Bip01_Spine1'] = {
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -48,
					RR = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -4.4444444444444,
					RR = 16,
					MF = 4.4444444444445
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RR = -32,
					RF = 48
				}
			},
			FrameRate = 2.5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
				},
				['ValveBiped.Bip01_R_Thigh'] = {
				},
				['ValveBiped.Bip01_Head1'] = {
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RR = -32
				},
				['ValveBiped.Bip01_R_Foot'] = {
				},
				['ValveBiped.Bip01_R_Forearm'] = {
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RR = 32
				},
				['ValveBiped.Bip01_Pelvis'] = {
				},
				['ValveBiped.Bip01_Spine1'] = {
				},
				['ValveBiped.Bip01_L_Forearm'] = {
				},
				['ValveBiped.Bip01_L_Thigh'] = {
				},
				['ValveBiped.Bip01_Spine'] = {
				},
				['ValveBiped.Bip01_L_Foot'] = {
				},
				['ValveBiped.Bip01_L_Calf'] = {
				}
			},
			FrameRate = 10
		}
	},
	Type = TYPE_SEQUENCE
})

RegisterLuaAnimation('csb_suit_equip', {
	FrameData = {
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -32
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80,
					RR = -16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -48
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -32
				}
			},
			FrameRate = 2.5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -48
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 32
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -64,
					RR = -16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80,
					RR = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -16
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -32,
					RR = -32
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -48,
					RR = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -16
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -32
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -48
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80,
					RR = -16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -32
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -48
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80,
					RR = 16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -64,
					RR = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 32
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -16
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -32,
					RR = -32
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -48,
					RR = -16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -16
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -32
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -80,
					RR = -16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -48
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = -32
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RU = 32
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -48,
					RR = -32
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -48,
					RR = 16
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -64,
					RR = -16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_Spine2'] = {
					RU = 16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RF = 32
				}
			},
			FrameRate = 3.3333333333333
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 128
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -96,
					RR = -16,
					RF = 5
				},
				['ValveBiped.Bip01_Spine2'] = {
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
					RU = 32
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -16,
					RR = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -32
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -96,
					RR = 32
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -48,
					RR = -16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 112
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -19,
					RR = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = 32,
					RR = -32,
					RF = 32
				}
			},
			FrameRate = 3.3333333333333
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 96
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -64,
					RR = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -32
				},
				['ValveBiped.Bip01_Spine2'] = {
				},
				['ValveBiped.Bip01_Head1'] = {
					RU = 32
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -16,
					RR = -16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -48
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -64,
					RR = 32
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -32
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 96,
					RR = 5
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 32,
					RF = 16
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -32,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine4'] = {
					RU = 16
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -13.333333333333,
					RR = -16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -64
				},
				['ValveBiped.Bip01_L_Hand'] = {
					RU = 32,
					RR = -48,
					RF = 32
				}
			},
			FrameRate = 3.3333333333333
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 48
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -32,
					RR = -16
				},
				['ValveBiped.Bip01_Spine2'] = {
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -32,
					RR = -16
				},
				['ValveBiped.Bip01_Head1'] = {
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -16,
					RR = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RU = -16,
					RR = -13
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RU = -16,
					RR = 18
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 16,
					RF = 16
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 16
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 48
				},
				['ValveBiped.Bip01_Spine4'] = {
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -4.4444444444444
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16,
					RF = -16
				},
				['ValveBiped.Bip01_L_Hand'] = {
				}
			},
			FrameRate = 5
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 32
				},
				['ValveBiped.Bip01_L_Thigh'] = {
					RU = -16,
					RR = -6,
					RF = -16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_Foot'] = {
					RU = -16
				},
				['ValveBiped.Bip01_Head1'] = {
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -16
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RR = 32
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -16
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RR = -32
				},
				['ValveBiped.Bip01_L_Calf'] = {
					RU = 32
				},
				['ValveBiped.Bip01_Spine1'] = {
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -16,
					RR = 6,
					RF = 16
				},
				['ValveBiped.Bip01_Spine4'] = {
				},
				['ValveBiped.Bip01_Pelvis'] = {
					MU = -2
				},
				['ValveBiped.Bip01_Spine2'] = {
				},
				['ValveBiped.Bip01_L_Hand'] = {
				}
			},
			FrameRate = 5
		}
	},
	Type = TYPE_SEQUENCE
})

--[[
RegisterLuaAnimation('csb_door_kick', {
	FrameData = {
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = 90
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -140,
					RF = 10
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = 10
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -112,
					RR = 16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = -30
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RR = 32,
					RF = -48
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RR = -32,
					RF = 48
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -112,
					RR = -16
				}
			},
			FrameRate = 4
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
					RU = -20
				},
				['ValveBiped.Bip01_R_Thigh'] = {
					RU = -90,
					RF = 10
				},
				['ValveBiped.Bip01_Spine1'] = {
					RU = -10
				},
				['ValveBiped.Bip01_L_Forearm'] = {
					RU = -96,
					RR = 16
				},
				['ValveBiped.Bip01_R_Foot'] = {
					RU = 20
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RF = -48
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RF = 48
				},
				['ValveBiped.Bip01_R_Forearm'] = {
					RU = -96,
					RR = -16
				}
			},
			FrameRate = 6
		},
		{
			BoneInfo = {
				['ValveBiped.Bip01_R_Calf'] = {
				},
				['ValveBiped.Bip01_R_Thigh'] = {
				},
				['ValveBiped.Bip01_Spine1'] = {
				},
				['ValveBiped.Bip01_L_Forearm'] = {
				},
				['ValveBiped.Bip01_R_Foot'] = {
				},
				['ValveBiped.Bip01_L_UpperArm'] = {
					RR = 32
				},
				['ValveBiped.Bip01_R_UpperArm'] = {
					RR = -32
				},
				['ValveBiped.Bip01_R_Forearm'] = {
				}
			},
			FrameRate = 2
		}
	},
	Type = TYPE_SEQUENCE
})
]]