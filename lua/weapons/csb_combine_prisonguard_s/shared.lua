if CSB_INSTALLED != true then return end

SWEP.Base = "csb_base_a"
SWEP.Author					= "FiLzO"
SWEP.Category				= "CS[Base] - Combine"
SWEP.Purpose				= "Kek"
SWEP.PrintName				= "Combine Prison Shotgunner [SUIT]"
SWEP.AbilityPrimaryDesc		= "[Stimshot]: A powerful Combine chem, increases speed, mobility and heals you a bit."
SWEP.AbilitySecondaryDesc	= "[Proxy Nade]: A throwable contact grenade, remotely detonable."

if CLIENT then
SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/entities/csb_combine_prisonguard_s_icon.vtf")
SWEP.Slot				= 5
SWEP.SlotPos			= 5
SWEP.IconLetter			= "O"
SWEP.ViewModelFlip		= false
--SWEP.RenderGroup		= RENDERGROUP_OPAQUE
end

SWEP.Spawnable 				= true
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
SWEP.HoldType 				= "normal"
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom 		= false
SWEP.UseHands 				= true
SWEP.EnableFancyPhysics		= true

sound.Add( {
	name = "CSBPlySound.GearSound.CombineSoldier",
	channel = CHAN_AUTO,
	volume = 0.4,
	level = 70,
	pitch = { 95, 110 },
	sound = { "npc/combine_soldier/gear1.wav", "npc/combine_soldier/gear2.wav", "npc/combine_soldier/gear3.wav", "npc/combine_soldier/gear4.wav", "npc/combine_soldier/gear5.wav", "npc/combine_soldier/gear6.wav" }
} )

sound.Add( {
	name = "CSBPlySound.GearSound.CombineSoldierL",
	channel = CHAN_AUTO,
	volume = 0.4,
	level = 70,
	pitch = { 95, 110 },
	sound = { "npc/combine_soldier/gear1.wav", "npc/combine_soldier/gear2.wav", "npc/combine_soldier/gear3.wav" }
} )

sound.Add( {
	name = "CSBPlySound.GearSound.CombineSoldierR",
	channel = CHAN_AUTO,
	volume = 0.4,
	level = 70,
	pitch = { 95, 110 },
	sound = { "npc/combine_soldier/gear4.wav", "npc/combine_soldier/gear5.wav", "npc/combine_soldier/gear6.wav" }
} )

sound.Add( {
	name = "CSBPlySound.CombineS.Item.AbilityONEActive",
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = PITCH_NORM,
	sound = { "csb/abilities/cs_drug_inhale.wav" }
} )

sound.Add( {
	name = "CSBPlySound.CombineS.Voice.AbilityONEActive",
	channel = CHAN_AUTO,
	volume = 0.5,
	level = 75,
	pitch = 80,
	sound = { "npc/combine_soldier/die1.wav", "npc/combine_soldier/die2.wav", "npc/combine_soldier/die3.wav" }
} )

SWEP.CSBPlyCombineSTPG = {
sound = {"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/boomer.wav",{"npc/combine_soldier/vo/delivered.wav","npc/combine_soldier/vo/inbound.wav","npc/combine_soldier/vo/fullactive.wav"}},
duration = {0,0,0},
channel = CHAN_AUTO,
volume = VOL_NORM,
level = 75,
pitch = 100
}

sound.Add( {
	name = "CSBPlySound.CombineSoldier.Melee",
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = {75, 90},
	sound = { "npc/combine_soldier/pain1.wav", "npc/combine_soldier/pain2.wav", "npc/combine_soldier/pain3.wav" }
} )

resource.AddFile( "materials/abilities/csoldiershotgunner_ability_one.png" )
resource.AddFile( "materials/abilities/csoldiershotgunner_ability_two.png" )

SWEP.PlyModel 					= "models/vjfix/combine_soldier_prisonguard.mdl"
SWEP.PlyBodyGroups 				= nil 
SWEP.PlySkin		 			= 1	
SWEP.PlySubMaterials 			= nil
SWEP.PlyHandsModel 				= "models/weapons/combine_arms/juonovom/hl2 vanilla/c_arms_combine_prison.mdl"
SWEP.NPCAnims					= true
SWEP.EquipAnimation 			= "csb_suit_equip"
SWEP.VMEquipAnimation 			= "admire"
SWEP.EquipSound 				= "CSBPlySound.Combine.Wear"
SWEP.DropSound 					= "CSBPlySound.Combine.Drop"

SWEP.WorldModel					= SWEP.PlyModel
SWEP.WorldModelScale			= 1
SWEP.WorldModelAnim				= false--"Idle_Unarmed"
SWEP.WorldModelAnimPlaybackRate	= 0

SWEP.UseCSBHud					= true

SWEP.NotifyTab = {
	['notpan'] = {
		['pos'] 	= {x = 36, y = 36},
		['size'] 	= {w = 300, h = 270},
		['color'] 	= Color(0, 0, 0, 155),
		['time'] 	= 10,
	},
	['notmdlpan'] = {
		['pos'] 	= {x = 10, y = 10},
		['size'] 	= {w = 130, h = 130},
		['color'] 	= Color(0, 255, 155, 255),
		['olcolor'] = Color(0, 55, 55, 255),
		['olsize'] 	= 5,
		['ang'] 	= Angle(0, 20, 0),
	},
	['notmdlcam'] = {
		['bone'] 	= "ValveBiped.Bip01_Head1",
		['pos'] 	= Vector(-15, 0, 0),
	},
	['nottext'] = {
		[1] = {
			['pos'] 	= {x = 150, y = -15},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "[Faction]",
			['font'] 	= "CSB_Notify_Primary",
			['color'] 	= Color(0, 255, 155),
		},
		[2] = {
			['pos'] 	= {x = 150, y = 5},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "-COMBINE-",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(0, 255, 155),
		},
		[3] = {
			['pos'] 	= {x = 150, y = 25},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "[Unit Number]",
			['font'] 	= "CSB_Notify_Primary",
			['color'] 	= Color(0, 255, 155),
		},
		[4] = {
			['pos'] 	= {x = 150, y = 45},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "-3560-",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(0, 255, 155),
		},
		[5] = {
			['pos'] 	= {x = 150, y = 65},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "[Unit Type]",
			['font'] 	= "CSB_Notify_Primary",
			['color'] 	= Color(0, 255, 155),
		},
		[6] = {
			['pos'] 	= {x = 150, y = 85},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "-Transhuman Infantry-",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(0, 255, 155),
		},
		[7] = {
			['pos'] 	= {x = 15, y = 120},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "[Abilities]",
			['font'] 	= "CSB_Notify_Primary",
			['color'] 	= Color(0, 255, 155),
		},
		[8] = {
			['pos'] 	= {x = 15, y = 150},
			['size'] 	= {w = 220, h = 72},
			['text'] 	= "-STIMSHOT- Adrenaline injection. Increased movement speed and melee damage.",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(0, 255, 155),
		},
		[9] = {
			['pos'] 	= {x = 15, y = 200},
			['size'] 	= {w = 220, h = 72},
			['text'] 	= "-PROXY NADE- Throwable proxymity grenade. Remotely detonable.",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(0, 255, 155),
		},
	},
}

SWEP.SuitOverlay = {
['overlay'] = {
['texture'] = "overlays/metrooverlay",
['refract'] = -0.06,
},
['colormod'] = {
["$pp_colour_addr"] = 0.05,
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

SWEP.HUDTab = {
	['health'] = {
		['bghppos'] 		= {x = 37, y = 900}, -- Health background pos.
		['bghpsize'] 		= {w = 340, h = 65}, -- Health background size.
		['bghpround'] 		= 8, -- Health background rounded corners.
		['bghpcolor'] 		= Color(0, 0, 0, 155), -- Health background color.
		--
		['nhppos'] 			= {x = 235, y = 932}, -- Health vaule pos.
		['nhpfont'] 		= "csb_font_playerinfo", -- Health vaule font.
		['nhpcolor'] 		= Color(0,255,155,255), -- Health vaule color.
		['nhplimit'] 		= 999, -- Health vaule limit.
		--
		['thppos'] 			= {x = 97, y = 945}, -- Health text pos.
		['thptext'] 		= "VITALS", -- Health text.
		['thpfont'] 		= "csb_font_barinfo", -- Health text font.
		['thpcolor'] 		= Color(0,255,155,255), -- Health text color.
		--
		['nmhppos'] 		= {x = 340, y = 920}, -- Max health value pos.
		['nmhpfont'] 		= "csb_font_ammoinfo2", -- Max health value font.
		['nmhpcolor'] 		= Color(0,255,155,255), -- Max health value color.
		['nmhplimit'] 		= 999, -- Max health value limit.
		--
		['tmhppos'] 		= {x = 340, y = 942.5}, -- Max health text pos.
		['tmhptext'] 		= "MAX", -- Max health text.
		['tmhpfont'] 		= "csb_font_barinfo", -- Max health text font.
		['tmhpcolor'] 		= Color(0,255,155,255), -- Max health text color.
	},
	['name'] = {
		['bgnamepos'] 		= {x = 121.5, y = 868.5}, -- Health background pos.
		['bgnamesize'] 		= {w = 170, h = 25}, -- Health background size.
		['bgnameround'] 	= 8, -- Health background rounded corners.
		['bgnamecolor'] 	= Color(0, 0, 0, 155), -- Health background color.
		--
		['tnamepos'] 		= {x = 206, y = 880}, -- Max health text pos.
		['tnametext'] 		= "Obtaining...", -- Max health text.
		['tnamefont'] 		= "csb_font_name", -- Max health text font.
		['tnamecolor'] 		= Color(0,255,155,255), -- Max health text color.
	},
	['armor'] = {
		['bgarmrpos'] 		= {x = 37, y = 972}, -- Armor background pos.
		['bgarmrsize'] 		= {w = 340, h = 70}, -- Armor background size.
		['bgarmrround']		= 8, -- Armor background rounded corners.
		['bgarmrcolor'] 	= Color(0, 0, 0, 155), -- Armor background color.
		--
		['narmrpos'] 		= {x = 235, y = 1007}, -- Armor value pos.
		['narmrfont'] 		= "csb_font_playerinfo", -- Armor value font.
		['narmrcolor'] 		= Color(0,255,155,255), -- Armor value color.
		['narmrlimit'] 		= 999, -- Armor value limit.
		--
		['tarmrpos'] 		= {x = 105, y = 1017.5}, -- Armor text pos.
		['tarmrtext'] 		= "ENERGY", -- Armor text.
		['tarmrfont'] 		= "csb_font_barinfo", -- Armor text font.
		['tarmrcolor'] 		= Color(0,255,155,255), -- Armor text color.
		--
		['nmarmrpos'] 		= {x = 340, y = 995}, -- Max armor value pos.
		['nmarmrfont'] 		= "csb_font_ammoinfo2", -- Max armor value font.
		['nmarmrcolor'] 	= Color(0,255,155,255), -- Max armor value color.
		['nmarmrlimit'] 	= 999, -- Max armor value limit.
		--
		['tmarmrpos'] 		= {x = 340, y = 1017.5}, -- Max armor text pos.
		['tmarmrtext'] 		= "MAX", -- Max armor text.
		['tmarmrfont'] 		= "csb_font_barinfo", -- Max armor text font.
		['tmarmrcolor'] 	= Color(0,255,155,255), -- Max armor text color.
	},
	['weaponname'] = {
		['bgwepnpos'] 		= {x = 1500, y = 898}, -- Weapon background pos.
		['bgwepnsize'] 		= {w = 380, h = 25}, -- Weapon background size.
		['bgwepnround']		= 8, -- Weapon background rounded corners.
		['bgwepncolor'] 		= Color(0, 0, 0, 155), -- Weapon background color.
		--
		['twepnpos'] 		= {x = 1690, y = 910}, -- Weapon name text (curently held) pos.
		['twepnfont'] 		= "csb_font_barinfo", -- Weapon name text (curently held) font.
		['twepncolor'] 		= Color(0,255,155,255), -- Weapon name text (curently held) color.
	},
	['weaponstat'] = {
		['bgweppos'] 		= {x = 1500, y = 930}, -- Weapon stats background pos.
		['bgwepsize'] 		= {w = 380, h = 112}, -- Weapon stats background size.
		['bgwepround']		= 8, -- Weapon stats background rounded corners.
		['bgwepcolor'] 		= Color(0, 0, 0, 155), -- Weapon stats background color.
		--
		['n1weppos'] 		= {x = 1660, y = 1007.5}, -- Weapon stats clip value pos.
		['n1wepfont'] 		= "csb_font_ammoinfo", -- Weapon stats clip value font.
		['n1wepcolor'] 		= Color(0,255,155,255), -- Weapon stats clip value color.
		['n1weplimit'] 		= 999, -- Weapon stats clip value limit.
		--
		['n2weppos'] 		= {x = 1805, y = 995}, -- Weapon stats reserve ammo value pos.
		['n2wepfont'] 		= "csb_font_ammoinfo2", -- Weapon stats reserve ammo value font.
		['n2wepcolor'] 		= Color(0,255,155,255), -- Weapon stats reserve ammo value color.
		['n2weplimit'] 		= 999, -- Weapon stats reserve ammo value limit.
		--
		['n3weppos'] 		= {x = 1805, y = 951}, -- Weapon stats secondary ammo value pos.
		['n3wepfont'] 		= "csb_font_ammoinfo2", -- Weapon stats secondary ammo value font.
		['n3wepcolor'] 		= Color(0,255,155,255), -- Weapon stats secondary ammo value color.
		['n3weplimit'] 		= 999, -- Weapon stats secondary ammo value limit.
		--
		['dmgweppos'] 		= {x = 1805, y = 970}, -- Weapon stats damage value pos.
		['dmgwepfont'] 		= "csb_font_ammoinfo2", -- Weapon stats damage value font.
		['dmgwepcolor'] 	= Color(0,255,155,255), -- Weapon stats damage value color.
		['dmgweplimit'] 	= 999, -- Weapon stats damage value limit.
		--
		['tweppos'] 		= {x = 1547, y = 1018}, -- Weapon stats ammo text pos.
		['tweptext'] 		= "AMMO", -- Weapon stats ammo text.
		['twepfont'] 		= "csb_font_barinfo", -- Weapon stats ammo text font.
		['twepcolor'] 		= Color(0,255,155,255), -- Weapon stats ammo text color.
		--
		['tpaweppos'] 		= {x = 1805, y = 1018}, -- Weapon stats reserve ammo text pos.
		['tpaweptext'] 		= "RESERVE", -- Weapon stats reserve ammo text.
		['tpawepfont'] 		= "csb_font_barinfo", -- Weapon stats reserve ammo text font.
		['tpawepcolor'] 	= Color(0,255,155,255), -- Weapon stats reserve ammo text color.
		--
		['tspweppos'] 		= {x = 1805, y = 973}, -- Weapon stats secondary ammo text pos.
		['tspweptext'] 		= "SPECIAL", -- Weapon stats secondary ammo text.
		['tspwepfont'] 		= "csb_font_barinfo", -- Weapon stats secondary ammo text font.
		['tspwepcolor'] 	= Color(0,255,155,255), -- Weapon stats secondary ammo text color.
		--
		['tdmgweppos'] 		= {x = 1833, y = 990}, -- Weapon stats damage text pos.
		['tdmgweptext'] 	= "DAMAGE", -- Weapon stats damage text.
		['tdmgwepfont'] 	= "csb_font_barinfo", -- Weapon stats damage text font.
		['tdmgwepcolor'] 	= Color(0,255,155,255), -- Weapon stats damage text color.
	},
}

SWEP.SuitAbilityPrimaryIcon 	= "materials/abilities/csoldiershotgunner_ability_one.png"
SWEP.SuitAbilitySecondaryIcon 	= "materials/abilities/csoldiershotgunner_ability_two.png"

SWEP.SuitAbilityIconColorTab = {
	['primary'] = Color(0,255,155,255),
	['secondary'] = Color(0,255,155,255),
}

SWEP.TPCameraPOS 				= {bone = "ValveBiped.Bip01_Head1", x = -20, y = -10, z = 40, crouch = 2}
SWEP.TPCameraPOSDefault 		= SWEP.TPCameraPOS

SWEP.PlyForceHeadRotation = {
['headbone'] 		= "ValveBiped.Bip01_Head1",
['yawlimit']		= 35,
['pitchlimit']		= 15,
['rolllimit']		= 5
}

SWEP.PlyRappelTab = {
['rapattach'] 	= "zipline",
['rapstart']	= {"rappelloop", false, true, false, nil}, -- Don't loop?
['rapstartsnd']	= "CSB.Rappel.Start", 
--['raploop']		= {"anim", false},
['raploopsnd']	= "CSB.Rappel.Loop",
['rapend']		= {"jump_holding_land", true, true, true, nil},
['rapendsnd']	= "CSB.Rappel.Land"
}

SWEP.PlyFootStepsTable = {
['lfootbone'] 		= "ValveBiped.Bip01_L_Foot",
['rfootbone'] 		= "ValveBiped.Bip01_R_Foot",

['lfootsound'] 		= {
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

['rfootsound'] = {
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

['lfootsoundrun'] 	= {"CSBPlySound.GearSound.CombineSoldierL"},
['rfootsoundrun'] 	= {"CSBPlySound.GearSound.CombineSoldierR"},
['runsndminspeed']	= 120,

['bothstep']		= {
['ladder']			= {"CSB.Ladder.StepLeft","CSB.Ladder.StepRight"},
['bloodyflesh'] 	= {"CSB.Flesh.StepLeft","CSB.Flesh.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['concrete'] 		= {"CSB.Concrete.Land","CSBPlySound.GearSound.CombineSoldier"},
['plaster'] 		= {"CSB.DryWall.StepLeft","CSB.DryWall.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['ceiling_tile'] 	= {"CSB.CeilingTile.StepLeft","CSB.CeilingTile.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['dirt'] 			= {"CSB.Dirt.Land","CSBPlySound.GearSound.CombineSoldier"},
['flesh']			= {"CSB.Flesh.StepLeft","CSB.Flesh.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['metalgrate'] 		= {"CSB.MetalGrate.Land","CSBPlySound.GearSound.CombineSoldier"},
['chainlink'] 		= {"CSB.ChainLink.StepLeft","CSB.ChainLink.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['snow'] 			= {"CSB.Snow.Land","CSBPlySound.GearSound.CombineSoldier"},
['plastic'] 		= {"CSB.PlasticBox.StepLeft","CSB.PlasticBox.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['plastic_box'] 	= {"CSB.PlasticBox.StepLeft","CSB.PlasticBox.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['plastic_barrel'] 	= {"CSB.PlasticBarrel.StepLeft","CSB.PlasticBarrel.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['solidmetal'] 		= {"CSB.SolidMetal.Land","CSBPlySound.GearSound.CombineSoldier"},
['metal'] 			= {"CSB.SolidMetal.Land","CSBPlySound.GearSound.CombineSoldier"},
['metal_box'] 		= {"CSB.SolidMetal.Land","CSBPlySound.GearSound.CombineSoldier"},
['sand'] 			= {"CSB.Sand.Land","CSBPlySound.GearSound.CombineSoldier"},
['antlionsand'] 	= {"CSB.Sand.Land","CSBPlySound.GearSound.CombineSoldier"},
['gravel'] 			= {"CSB.Gravel.Land","CSBPlySound.GearSound.CombineSoldier"},
['mud'] 			= {"CSB.Mud.Land","CSBPlySound.GearSound.CombineSoldier"},
['slime'] 			= {"CSB.Mud.Land","CSBPlySound.GearSound.CombineSoldier"},
['slipperyslime'] 	= {"CSB.Mud.Land","CSBPlySound.GearSound.CombineSoldier"},
['water'] 			= {"CSB.Water.StepLeft","CSB.Water.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['wade'] 			= {"CSB.Wade.StepLeft","CSB.Wade.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['tile'] 			= {"CSB.Tile.Land","CSBPlySound.GearSound.CombineSoldier"},
['grass'] 			= {"CSB.Grass.Land","CSBPlySound.GearSound.CombineSoldier"},
['metalvent'] 		= {"CSB.MetalVent.Land","CSBPlySound.GearSound.CombineSoldier"},
['wood'] 			= {"CSB.Wood.StepLeft","CSB.Wood.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['wood_crate'] 		= {"CSB.WoodCrate.StepLeft","CSB.WoodCrate.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['wood_panel'] 		= {"CSB.WoodPanel.StepLeft","CSB.WoodPanel.StepRight","CSBPlySound.GearSound.CombineSoldier"},
['cardboard'] 		= {"CSB.Cardboard.Land","CSBPlySound.GearSound.CombineSoldier"},
['glass'] 			= {"CSB.Glass.Land","CSBPlySound.GearSound.CombineSoldier"},
['rubber'] 			= {"CSB.Rubber.Land","CSBPlySound.GearSound.CombineSoldier"},
['default'] 		= {"CSB.Concrete.Land","CSBPlySound.GearSound.CombineSoldier"},
['defaultstep'] 	= {"CSB.Concrete.Land","CSBPlySound.GearSound.CombineSoldier"}
},

['stepcolboxmin'] 	= Vector(-3, -3, 0),
['stepcolboxmax'] 	= Vector(3, 3, 5),
['grounddist'] 		= 6,
['toeposmul'] 		= 0,
['fssounddelay'] 	= 0.05,
['deffssound'] 		= false
}

SWEP.RunSpeed 					= 215
SWEP.WalkSpeed 					= 72
SWEP.WalkSpeedAlt 				= 72
SWEP.CrouchedWalkSpeed 			= 0.8
SWEP.JumpPower 					= 200

SWEP.PlyHealth 					= 100
SWEP.PlyMaxHealth 				= 100
SWEP.PlyArmor 					= 100
SWEP.PlyMaxArmor			 	= 100

SWEP.HideWeapons				= false
SWEP.WeaponBlackList			= {
['weapon_frag'] = true
}
SWEP.WeaponWhiteList			= {}

SWEP.Equipment = {
['weapons'] = {
	[1] = {"weapon_shotgun", false},
},
['ammo'] 	= {
	[1] 	= {"Buckshot", 36},
	[2]	 	= {"Grenade", 2},
},
}

SWEP.CSB_Allies = {
['npc_combine_s'] 		= true,
['npc_metropolice'] 	= true,
['npc_hunter'] 			= true,
['npc_manhack'] 		= true,
['npc_strider'] 		= true,
['npc_combine_camera'] 	= true,
['npc_turret_ceiling'] 	= true,
['npc_cscanner'] 		= true,
['npc_combinedropship'] = true,
['npc_combinegunship'] 	= true,
['npc_helicopter'] 		= true,
['npc_rollermine'] 		= true,
['npc_clawscanner'] 	= true,
['npc_stalker'] 		= true,
['npc_turret_floor'] 	= true,
['npc_breen'] 			= true,
['npc_apcdriver'] 		= true,
['npc_sniper'] 			= true,
['combine_mine'] 		= true,
['npc_advisor'] 		= true,
['npc_combine_cannon'] 	= true,
['npc_crabsynth'] 		= true,
['npc_enemyfinder_combinecannon'] 		= true,
['npc_mortarsynth'] 	= true,
['npc_spotlight'] 		= true,
['npc_turret_ground'] 	= true
}

SWEP.VJ_NPC_Class = {"CLASS_COMBINE"}

SWEP.CSB_AllyMarkers = {
['allymarksymbol'] 			= "u",
['allymarkfont'] 			= "Marlett",
['allymarkcolor'] 			= Color(0, 255, 155, 255), -- Icon color.
['allymarkcoloroutline'] 	= Color(0, 0, 0, 255) -- Icon's outline color.
}

SWEP.CSBActionMenuData = {
['title'] = "Action Menu",
['button1'] = "Signal: Advance!",
['button2'] = "Signal: Forward!",
['button3'] = "Signal: Group!",
['button4'] = "Signal: Halt!",
['button5'] = "Signal: Left!",
['button6'] = "Signal: Right!",
['button7'] = "Signal: Take Cover!",
['button8'] = "March Walk",
['menuc'] = Color(0, 0, 0, 155), -- Menu color.
['tfont'] = "DermaDefaultBold", -- Button text font.
['tcolor'] = Color(0, 0, 0, 255), -- Button text color.
['buttonc'] = Color(0, 255, 155, 255), -- Button color.
['buttonchover'] = Color(0, 135, 80, 255) -- Button color when hovered over with mouse.
}

SWEP.PlyMeleeTable = {
['meleesound']	= "CSBPlySound.Metropolice.Melee",
['meleedmg']	= 35,
['meleerang']	= 64,
['meleeanims']	= {"melee_gunhit"},
['dmgdelay'] 	= {0.65}
}

SWEP.CSBDoorKickVL = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav",{"npc/combine_soldier/vo/fixsightlinesmovein.wav","npc/combine_soldier/vo/flash.wav","npc/combine_soldier/vo/flush.wav","npc/combine_soldier/vo/movein.wav"},{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.DoorKickTable = {
['dksound']		= "CSBPlySound.Metropolice.Melee",
['dkvl']		= SWEP.CSBDoorKickVL, -- good for voice lines
['dkvld']		= 0,
['dkrang']		= 32,
['dkanims']	= {"csb_door_kick"},
['dkopendelay'] = {0.7} -- animation duration - dkopendelay = moment at which door will get kicked
}

SWEP.PlyGrenadeTable = {
['gsound']		= SWEP.CSBMetroGrenade,
['gentity']		= "npc_grenade_frag",
['gammo']		= "Grenade",
['gmodel']		= "models/weapons/w_npcnade.mdl",
['gmaterial']	= "",
['gfuse']		= "3",
['gforce']		= 650,
['gselfremove']	= 10,
['gsounddelay']	= 0.7,
['ganims']		= {"grenThrow"},
['gdelay'] 		= {0.7},
['gbone']		= "ValveBiped.Bip01_L_Hand",
['gpos']		= Vector(10,15,60),
['gang']		= Angle(0,0,0),
['gppos']		= Vector(2.5,-2,1),
['gpang']		= Angle(0,0,0)
}

--prop_vehicle_jeep
--prop_vehicle_airboat
--prop_vehicle_prisoner_pod
SWEP.VehicleHide = false
SWEP.VehicleAnim = {
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
		
		['ValveBiped.Bip01_Pelvis'] = { pos = Vector( -5, 0, 0 ) }

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

SWEP.CameraRotationGestures = {
['left'] = "gesture_turn_left_45",
['right'] = "gesture_turn_right_45"
}

SWEP.WeaponSwapAnim = {
['pistol']		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= false,
['canim'] 	= {2,1,1},
},
['duel']		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['revolver'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['smg'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['ar2'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['shotgun'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['rpg'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['crossbow'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['camera'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['physgun'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['melee']		= {
['anim'] 	= "activatebaton",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['melee2'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['knife'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['fist'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['grenade'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['slam'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['normal'] 		= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['passive'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['invalid'] 	= {
['anim'] 	= "flinchrarmgest",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
}
}

SWEP.FlinchGestures = {
['1']		= "flinchheadgest", -- HITGROUP_HEAD
['2']		= "flinchgutgest", -- HITGROUP_CHEST
['3']		= "flinchgutgest", -- HITGROUP_STOMACH
['4']		= "flinchlarmgest", -- HITGROUP_LEFTARM
['5']		= "flinchrarmgest", -- HITGROUP_RIGHTARM
['6']		= "flinchlarmgest", -- HITGROUP_LEFTLEG
['7']		= "flinchrarmgest", -- HITGROUP_RIGHTLEG
--['fgdelay']		= 1,
--['fglast']		= 0
}
 
SWEP.FallAnimations = {
"jump_holding_land"
}

--SUIT SPECIFIC--
function SWEP:LoadVariables() -- Put here anything that you wish to reload on level transition.
print("Loaded")
self:SetNW2Bool("CSB_PrimaryAbility", true)
self:SetNW2Float("CSB_PrimaryAbilityCooldown", 20)
self:SetNW2Float("CSB_PrimaryAbilityDuration", 11) -- +1 one second due to the 1 second timer present

self:SetNW2Bool("CSB_SecondaryAbility", true)
self:SetNW2Float("CSB_SecondaryAbilityCooldown", 10)
end

if (SERVER) then

	function SWEP:CSBOnNPCStartFollow(npc) -- Things to set on joining you NPCs.

		if npc:GetClass() == "npc_metropolice" then
	
			npc:SetKeyValue( "spawnflags", "2097152" )
	
		end

	end

	function SWEP:CSBOnNPCStopFollow(npc)  -- Things to set on leaving you NPCs.
	end

end

SWEP.WorldModelSpawnPose = {
	
	['ValveBiped.Bip01_Head1'] = { ang = Angle( 0, 0, 0 ), pos = Vector( -13, -22, 0 ) },
	
	['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( -30, -20, 0 ) },
    ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 30, -20, 0 ) },

    ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -30, -35, 60 ) },
    ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 30, -35, -60 ) },
	
	['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 20, -2 ) },
    ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 20, -2 ) },
		
	['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 0, 10 ), pos = Vector( -18, -10, -5 ) },
    ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, -90, -30 ), pos = Vector( 0, 2, 6 ) },
		
	['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 0, 0 ) },
    ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 0, 0 ) },
	
    ['ValveBiped.Bip01_Spine'] = { ang = Angle( 0, 0, 0 ) },
		
	['ValveBiped.Bip01_Pelvis'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 0, -45 ) }

}

function SWEP:CSBHoloPlay() end

function SWEP:CThink()
end

function SWEP:CSBInitialize()

end

function SWEP:CSBPreSuitApply()
	
	local newName = 0	
	
	if math.random(1,50) == 50 then
	
		newName = 3650	-- haha funny egg
		
	elseif self.Owner:SteamID64() != nil then
	
		newName = string.sub( self.Owner:SteamID64(), 1, 6 ) -- too long, gotta trim
	else
	
		newName = "69piratedgame"
	end
	
	self.NotifyTab.nottext[4].text = tostring(newName)
	
	self.HUDTab.name.tnametext = newName
	
	if (SERVER) then
	
		timer.Simple(0.1, function()
		
			if IsValid(self.Owner) then
		
				net.Start("csb_update_name_HUD")
				net.WriteEntity(self)
				net.WriteTable(self.HUDTab)
				net.Send(self.Owner)
		
			end
			
		end)
		
	end
	
end

function SWEP:CSBDeploy()
end

function SWEP:CSBHolster()
end

function SWEP:CSBPrimaryAbility()

	if !IsValid(self.Owner) then return end
	
	if self:GetNW2Bool("CSB_PrimaryAbility") == false and (self.Owner:GetNW2Bool("CSB_PlayingAnim") != true or (self.Owner:GetNW2Bool("CSB_PlayingAnim") == true and self.Owner:GetNW2Int("CSB_Gslot") != 6)) then
	
		self:EmitClientSound("CSBSuit.AbilityNotReady")
		
	elseif self:GetNW2Bool("CSB_PrimaryAbility") == true and (self.Owner:GetNW2Bool("CSB_PlayingAnim") != true or (self.Owner:GetNW2Bool("CSB_PlayingAnim") == true and self.Owner:GetNW2Int("CSB_Gslot") != 6)) then
	
		self:SetNW2Bool("CSB_PrimaryAbility", false)
		self.Owner:SendCSBAnimation(6, "flinchbig", true, true, true, nil, nil, true, nil)
		self.Owner:EmitServerSound("CSBPlySound.CombineS.Item.AbilityONEActive")
		
		timer.Simple(1, function()
		
		if !IsValid(self) or !IsValid(self.Owner) then return end
		
			self.Owner:EmitServerSound("CSBPlySound.CombineS.Voice.AbilityONEActive")
			self.Owner:SetRunSpeed(self.RunSpeed*2)
			self.Owner:SetWalkSpeed(self.WalkSpeed*2)
			self.Owner:SetSlowWalkSpeed(self.WalkSpeedAlt*2)
			self.Owner:SetCrouchedWalkSpeed(self.CrouchedWalkSpeed*2)
			self.PlyMeleeDMG = 50
			--self.Owner:SetJumpPower(self.JumpPower*2)
			local need = math.min( self.Owner:GetMaxHealth() - self.Owner:Health(), 20 )-- Dont overheal
			self.Owner:SetHealth( math.min( self.Owner:GetMaxHealth(), self.Owner:Health() + need ) )
			
		end)
		
		if (SERVER) then self:CSBPrimaryIconColor(self.Owner, Color(100, 255, 100, 255)) end

		if (not timer.Exists("CSB_PRIMARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex())) then
		
			timer.Create("CSB_PRIMARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex(), self:GetNW2Float("CSB_PrimaryAbilityDuration"), 1, function()
			
				if !IsValid(self) or !IsValid(self.Owner) then return end
				
				self.Owner:SetRunSpeed(self.RunSpeed)
				self.Owner:SetWalkSpeed(self.WalkSpeed)
				self.Owner:SetSlowWalkSpeed(self.WalkSpeedAlt)
				self.Owner:SetCrouchedWalkSpeed(self.CrouchedWalkSpeed)
				self.PlyMeleeDMG = 25
				--self.Owner:SetJumpPower(self.JumpPower)
				
				self:EmitServerSound("CSBPlySound.CombineSoldier.Melee")

				if (SERVER) then self:CSBPrimaryIconColor(self.Owner, Color(0, 135, 80, 255)) end
				
					if (not timer.Exists("CSB_PRIMARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex())) then
					
						timer.Create("CSB_PRIMARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex(), self:GetNW2Float("CSB_PrimaryAbilityCooldown"), 1, function()
						
						if !IsValid(self) or !IsValid(self.Owner) then return end
						
						self:SetNW2Bool("CSB_PrimaryAbility", true)
						self:EmitClientSound("CSBSuit.AbilityReady")

						if (SERVER) then self:CSBPrimaryIconColor(self.Owner, Color(0, 255, 155, 255)) end
						
					end)
					
				end
				
			end)
			
		end
		
	end
	
end

function SWEP:CSBSecondaryRecharge()

	if (not timer.Exists("CSB_SECONDARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex())) then
	
		timer.Create("CSB_SECONDARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex(), self:GetNW2Float("CSB_SecondaryAbilityCooldown"), 1, function()
		
		if !IsValid(self) or !IsValid(self.Owner) then return end
		
			self:SetNW2Bool("CSB_SecondaryAbility", true)
			
			if (SERVER) then self:SendClientSound(self.Owner,"CSBSuit.AbilityReady") end
			
			if (SERVER) then self:CSBSecondaryIconColor(self.Owner, Color(0, 255, 155, 255)) end
			
		end)
		
	end
	
end


function SWEP:CSBSecondaryAbility()

	if !IsValid(self.Owner) then return end
	
	if self:GetNW2Bool("CSB_SecondaryAbility") == false and (self.Owner:GetNW2Bool("CSB_PlayingAnim") != true or (self.Owner:GetNW2Bool("CSB_PlayingAnim") == true and self.Owner:GetNW2Int("CSB_Gslot") != 6)) then
	
		self:EmitClientSound("CSBSuit.AbilityNotReady")
		
		if IsValid(self.proxnade) then
		
			self.proxnade:Destroy()
			
		end
		
		self:CSBSecondaryRecharge()
		
	elseif self:GetNW2Bool("CSB_SecondaryAbility") == true and (self.Owner:GetNW2Bool("CSB_PlayingAnim") != true or (self.Owner:GetNW2Bool("CSB_PlayingAnim") == true and self.Owner:GetNW2Int("CSB_Gslot") != 6)) then
		
		self:SetNW2Bool("CSB_SecondaryAbility", false)
		
		if (SERVER) then self:CSBSecondaryIconColor(self.Owner, Color(0, 135, 80, 255)) end
		
		if (SERVER) then
		
			timer.Simple(0.5, function()
			
				if !IsValid(self) or !IsValid(self.Owner) or IsValid(self.proxnade) then return end
			
				self.proxnade = ents.Create( "sent_ability_prox_nade" )
				local plyAng = Angle(0, self.Owner:GetAngles().y, 0)
				local offsetVec = Vector(20, 9, 70)
				local offsetAng = Angle(0, 0, 0)
				local newPos, newAng = LocalToWorld(offsetVec, offsetAng, self.Owner:GetPos(), plyAng)
				self.proxnade:SetPos(newPos)
				self.proxnade:SetAngles(newAng)
				self.proxnade:Spawn()
				self.proxnade:Activate()
				self.proxnade:SetOwner(self.Owner)
				self.proxnade.ent:SetOwner(self.Owner)
			
				local vel = self.Owner:GetAimVector() * 5000 + Vector(0, 0, 1100)
        
				local phys = self.proxnade.ent:GetPhysicsObject()
		
				if IsValid(phys) then
					phys:AddAngleVelocity(Vector(math.random(-2000,2000),math.random(-2000,2000),math.random(-2000,2000)))
					phys:ApplyForceCenter(vel)
				end
			
				self:DeleteOnRemove(self.proxnade)

			end)
			
		end
		
		self.Owner:SendCSBAnimation(6, "grenThrow", true, true, nil, nil, nil, true, nil)
		
		local delay = self.Owner:SequenceDuration(self.Owner:LookupSequence("grenThrow"))
		
		if (SERVER) then self.Owner:CSBDrawProp("models/Combine_Helicopter/helicopter_bomb01.mdl", nil, 0.2, 0, "ValveBiped.Bip01_L_Hand", delay-0.6, Vector(2,-2,0), Angle(-20,0,180)) end

		self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineSTPG, true)
		
	end
	
end

function SWEP:CSBOnDrop()

	local ply = self:GetNW2Entity("CSB_SuitUser")
	
	if IsValid(ply) then
	
		if timer.Exists("CSB_PRIMARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_PRIMARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) end
		
	end
	

	if IsValid(self.proxnade) then
	
		SafeRemoveEntity(self.proxnade)
		
	end
	
end

function SWEP:CSBOnRemove()

	if IsValid(self.Owner) then
	
		if timer.Exists("CSB_PRIMARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_PRIMARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) end
		
	end
	
end

SWEP.CSBPlyCombineAction1 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/prosecuting.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyCombineAction2 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/movein.wav","npc/combine_soldier/vo/twelve.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}
--
SWEP.CSBPlyCombineAction3 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/closing.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyCombineAction4 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/hardenthatposition.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyCombineAction5 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/movein.wav","npc/combine_soldier/vo/nine.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyCombineAction6 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/movein.wav","npc/combine_soldier/vo/three.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyCombineAction7 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/displace.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

function SWEP:CSBAction1()
self.Owner:SendCSBAnimation(6, "signal_advance", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction1, true)
end

function SWEP:CSBAction2()
self.Owner:SendCSBAnimation(6, "signal_forward", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction2, true)
end

function SWEP:CSBAction3()
self.Owner:SendCSBAnimation(6, "signal_group", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction3, true)
end

function SWEP:CSBAction4()
self.Owner:SendCSBAnimation(6, "signal_halt", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction4, true)
end

function SWEP:CSBAction5()
self.Owner:SendCSBAnimation(6, "signal_left", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction5, true)
end

function SWEP:CSBAction6()
self.Owner:SendCSBAnimation(6, "signal_right", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction6, true)
end

function SWEP:CSBAction7()
self.Owner:SendCSBAnimation(6, "signal_takecover", true, true, nil, nil, true, nil)
self.Owner:CSBEmitSoundSequence(self.CSBPlyCombineAction7, true)
end

function SWEP:CSBAction8()
self.Owner:CSBSetAnimationState(3, 0, 1)
end

SWEP.CSBPlyNPCCommand1 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav",{"npc/combine_soldier/vo/outbreak.wav","npc/combine_soldier/vo/sectorisnotsecure.wav","npc/combine_soldier/vo/confirmsectornotsterile.wav"},{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyNPCCommand2 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/prosecuting.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyNPCCommand3 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/movein.wav","npc/combine_soldier/vo/twelve.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}
--
SWEP.CSBPlyNPCCommand4 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/closing.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyNPCCommand5 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/hardenthatposition.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

SWEP.CSBPlyNPCCommand6 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav",{"npc/combine_soldier/vo/stayalert.wav","npc/combine_soldier/vo/stayalertreportsightlines.wav"},"npc/combine_soldier/vo/secure.wav","npc/combine_soldier/vo/sector.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}
 
SWEP.CSBPlyNPCCommand7 = {
	sound = {{"npc/combine_soldier/vo/on1.wav","npc/combine_soldier/vo/on2.wav"},"npc/combine_soldier/vo/team.wav","npc/combine_soldier/vo/displace.wav",{"npc/combine_soldier/vo/off1.wav","npc/combine_soldier/vo/off2.wav","npc/combine_soldier/vo/off3.wav"}},
	duration = {0,0,0,0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100
}

if CLIENT then--CLIENT--------------CLIENT------------------CLIENT-----------------------CLIENT-------------------------CLIENT----------------------CLIENT-----------------CLIENT

function SWEP:CSBDrawHUD()
end

function SWEP:CSBTranslateFOV(current_fov)
	return current_fov
end

function SWEP:CSBDrawWorldModel()

	local ply = self:GetOwner()
	
	if IsValid(ply) then
	
	else
	
		self:DrawModel()
	
	end
	
end

function SWEP:CSBPreDrawViewModel(vm, weapon, ply)

end

function SWEP:CSBPostDrawViewModel( vm, weapon, ply )

end

function SWEP:CSBDrawWorldModelTranslucent()
	self.Weapon:DrawModel()
end

function SWEP:CSBAdjustMouseSensitivity()
	return nil
end

end

--ANIMATIONS FOR NPC BASED MODELS
SWEP.CSBTransAct = {
	['hl2mp_gestures'] = {
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_PISTOL ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_DUEL ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER ] 	= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_REVOLVER ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1 ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_SMG1 ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 ] 			= ACT_GESTURE_RANGE_ATTACK_AR2;
	[ ACT_HL2MP_GESTURE_RELOAD_AR2 ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN ] 		= ACT_GESTURE_RANGE_ATTACK_SHOTGUN;
	[ ACT_HL2MP_GESTURE_RELOAD_SHOTGUN ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG ] 			= ACT_GESTURE_RANGE_ATTACK_SHOTGUN;
	[ ACT_HL2MP_GESTURE_RELOAD_RPG ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW ] 	= ACT_GESTURE_RANGE_ATTACK_SHOTGUN;
	[ ACT_HL2MP_GESTURE_RELOAD_CROSSBOW ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_CAMERA ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN ] 		= ACT_GESTURE_RANGE_ATTACK_SHOTGUN;
	[ ACT_HL2MP_GESTURE_RELOAD_PHYSGUN ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE ] 		= ACT_MELEE_ATTACK1;
	[ ACT_HL2MP_GESTURE_RELOAD_MELEE ] 				= ACT_MELEE_ATTACK1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2 ] 		= ACT_MELEE_ATTACK1;
	[ ACT_HL2MP_GESTURE_RELOAD_MELEE2 ] 			= ACT_MELEE_ATTACK1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE ] 		= ACT_MELEE_ATTACK1;
	[ ACT_HL2MP_GESTURE_RELOAD_KNIFE ] 				= ACT_MELEE_ATTACK1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST ] 		= ACT_MELEE_ATTACK1;
	[ ACT_HL2MP_GESTURE_RELOAD_FIST ] 				= ACT_MELEE_ATTACK1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE ] 		= ACT_COMBINE_THROW_GRENADE;
	[ ACT_HL2MP_GESTURE_RELOAD_GRENADE ] 			= ACT_COMBINE_THROW_GRENADE;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM ] 		= ACT_COMBINE_THROW_GRENADE;
	[ ACT_HL2MP_GESTURE_RELOAD_SLAM ] 				= ACT_COMBINE_THROW_GRENADE;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC ] 		= ACT_COMBINE_THROW_GRENADE;
	[ ACT_HL2MP_GESTURE_RELOAD_MAGIC ] 				= ACT_COMBINE_THROW_GRENADE;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_PASSIVE ] 			= ACT_GESTURE_RELOAD_SMG1;
},
	['pistol'] = { 
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['duel'] = { 
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['revolver'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['smg'] = { 
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['ar2'] = {
	[ ACT_MP_STAND_IDLE ] 						   	= {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_AR2_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['shotgun'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SHOTGUN};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_SHOTGUN, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_RIFLE, ACT_RUN_AIM_SHOTGUN};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_RANGE_AIM_AR2_LOW, ACT_RANGE_AIM_AR2_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    		= {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['rpg'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SHOTGUN};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_SHOTGUN, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_RIFLE, ACT_RUN_AIM_SHOTGUN};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_RANGE_AIM_AR2_LOW, ACT_RANGE_AIM_AR2_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    		= {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['crossbow'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SHOTGUN};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_SHOTGUN, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_RIFLE, ACT_RUN_AIM_SHOTGUN};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_RANGE_AIM_AR2_LOW, ACT_RANGE_AIM_AR2_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    		= {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['camera'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_AIM_RIFLE, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['magic'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_AIM_RIFLE, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['physgun'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SHOTGUN};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_SHOTGUN, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_RIFLE, ACT_RUN_AIM_SHOTGUN};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_RANGE_AIM_AR2_LOW, ACT_RANGE_AIM_AR2_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    		= {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['melee'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "breen_gravCarry_Idle"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkGravCarry_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	       	= {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['melee2'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "breen_gravCarry_Idle"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkGravCarry_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	       	= {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['knife'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "Idle_Unarmed"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkUnarmed_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	       	= {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['fist'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "Idle_Unarmed"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkUnarmed_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	       	= {ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_MELEE_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['grenade'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "Idle_Unarmed"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_AIM_RIFLE, ACT_WALK_AIM_RIFLE, "WalkUnarmed_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_COMBINE_THROW_GRENADE};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_SPECIAL_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_COMBINE_THROW_GRENADE};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_SPECIAL_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['slam'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "Idle_Unarmed"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_AIM_RIFLE, ACT_WALK_AIM_RIFLE, "WalkUnarmed_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_COMBINE_THROW_GRENADE};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_SPECIAL_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_COMBINE_THROW_GRENADE};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_SPECIAL_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['normal'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1, "Idle_Unarmed"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkUnarmed_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['passive'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE, ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_RIFLE, ACT_RUN_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['invalid'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE, "WalkEasy_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_RANGE_AIM_SMG1_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_RUN_CROUCH_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['vehicle'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_INVALID};
}
}