if CSB_INSTALLED != true then return end

SWEP.Base = "csb_base_a"
SWEP.Author					= "FiLzO"
SWEP.Category				= "CS[Base] - Humans + Resistance"
SWEP.Purpose				= "Rebelion"
SWEP.PrintName				= "Citizen Female [SUIT]"
SWEP.AbilityPrimaryDesc		= "None"
SWEP.AbilitySecondaryDesc	= "None"

if CLIENT then
SWEP.WepSelectIcon 			= surface.GetTextureID("vgui/entities/csb_citizen_icon_f.vtf")
SWEP.Slot					= 5
SWEP.SlotPos				= 5
SWEP.IconLetter				= "O"
SWEP.ViewModelFlip			= false
--SWEP.RenderGroup			= RENDERGROUP_OPAQUE
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
	name = "CSBPlySound.GearSound.CitizenB",
	channel = CHAN_AUTO,
	volume = 0.2,
	level = 70,
	pitch = { 95, 110 },
	sound = { "csb/humans/csprint1.wav", "csb/humans/csprint2.wav", "csb/humans/csprint3.wav", "csb/humans/csprint4.wav" }
} )

sound.Add( {
	name = "CSBPlySound.GearSound.CitizenL",
	channel = CHAN_AUTO,
	volume = 0.1,
	level = 70,
	pitch = { 95, 110 },
	sound = { "csb/humans/csprint1.wav", "csb/humans/csprint2.wav" }
} )

sound.Add( {
	name = "CSBPlySound.GearSound.CitizenR",
	channel = CHAN_AUTO,
	volume = 0.1,
	level = 70,
	pitch = { 95, 110 },
	sound = { "csb/humans/csprint3.wav", "csb/humans/csprint4.wav" }
} )

sound.Add( {
	name = "CSBPlySound.RebelF.Grenade",
	channel = CHAN_AUTO,
	volume = 1,
	level = 75,
	pitch = 100,
	sound = {"vo/npc/female01/headsup01.wav","vo/npc/female01/headsup02.wav"}, 
} )

sound.Add( {
	name = "CSBPlySound.RebelF.Melee",
	channel = CHAN_AUTO,
	volume = 1,
	level = 75,
	pitch = {90, 105},
	sound = { "vo/npc/female01/pain04.wav", "vo/npc/female01/pain05.wav", "vo/npc/female01/pain09.wav", "vo/npc/female01/pain07.wav" }
} )

SWEP.PlyModel 					= "models/Humans/Group01/Female_01.mdl"
SWEP.PlyHandsModel 				= "models/weapons/c_arms_rebel.mdl"
SWEP.PlyColor 					= Color(255,255,255,255) -- might get removed.
SWEP.PlyPlayerColor 			= Color(255,255,255) -- might get removed.
SWEP.NPCAnims 					= true
SWEP.EquipAnimation 			= "csb_suit_equip"
SWEP.VMEquipAnimation 			= "admire"
SWEP.EquipSound 				= "CSBPlySound.Rebel.Wear"
SWEP.DropSound 					= "CSBPlySound.Combine.Drop"

SWEP.WorldModel					= SWEP.PlyModel
SWEP.WorldModelScale			= 1
SWEP.WorldModelAnim				= false --"batonidle1"
SWEP.WorldModelAnimPlaybackRate	= 0

SWEP.UseCSBHud					= true

SWEP.NotifyTab = {
	['notpan'] = {
		['pos'] 	= {x = 36, y = 36},
		['size'] 	= {w = 300, h = 150},
		['color'] 	= Color(0, 0, 0, 155),
		['time'] 	= 10,
	},
	['notmdlpan'] = {
		['pos'] 	= {x = 10, y = 10},
		['size'] 	= {w = 130, h = 130},
		['color'] 	= Color(255,200,100,255),
		['olcolor'] = Color(100, 100, 55, 255),
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
			['font'] 	= "CSB_Notify_Primary_Rebel",
			['color'] 	= Color(255,200,100,255),
		},
		[2] = {
			['pos'] 	= {x = 150, y = 5},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "-RESISTANCE-",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(255,200,100,255),
		},
		[3] = {
			['pos'] 	= {x = 150, y = 25},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "[Name]",
			['font'] 	= "CSB_Notify_Primary_Rebel",
			['color'] 	= Color(255,200,100,255),
		},
		[4] = {
			['pos'] 	= {x = 150, y = 45},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "Bob",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(255,200,100,255),
		},
		[5] = {
			['pos'] 	= {x = 150, y = 65},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "[Last Name]",
			['font'] 	= "CSB_Notify_Primary_Rebel",
			['color'] 	= Color(255,200,100,255),
		},
		[6] = {
			['pos'] 	= {x = 150, y = 85},
			['size'] 	= {w = 188, h = 72},
			['text'] 	= "Bobson",
			['font'] 	= "CSB_Notify_Secondary",
			['color'] 	= Color(255,200,100,255),
		},
	},
}

SWEP.SuitOverlay = {
['overlay'] = {
['texture'] = "",
['refract'] = -0.06
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

SWEP.HUDTab = {
	['health'] = {
		['bghppos'] 		= {x = 37, y = 900}, -- Health background pos.
		['bghpsize'] 		= {w = 340, h = 65}, -- Health background size.
		['bghpround'] 		= 8, -- Health background rounded corners.
		['bghpcolor'] 		= Color(0, 0, 0, 155), -- Health background color.
		--
		['nhppos'] 			= {x = 235, y = 934}, -- Health vaule pos.
		['nhpfont'] 		= "csb_font_playerinfo_rebel", -- Health vaule font.
		['nhpcolor'] 		= Color(255,200,100,255), -- Health vaule color.
		['nhplimit'] 		= 999, -- Health vaule limit.
		--
		['thppos'] 			= {x = 97, y = 945}, -- Health text pos.
		['thptext'] 		= "HEALTH", -- Health text.
		['thpfont'] 		= "csb_font_barinfo_rebel", -- Health text font.
		['thpcolor'] 		= Color(255,200,100,255), -- Health text color.
		--
		['nmhppos'] 		= {x = 340, y = 920}, -- Max health value pos.
		['nmhpfont'] 		= "csb_font_ammoinfo2_rebel", -- Max health value font.
		['nmhpcolor'] 		= Color(255,200,100,255), -- Max health value color.
		['nmhplimit'] 		= 999, -- Max health value limit.
		--
		['tmhppos'] 		= {x = 340, y = 946}, -- Max health text pos.
		['tmhptext'] 		= "MAX", -- Max health text.
		['tmhpfont'] 		= "csb_font_barinfo_rebel", -- Max health text font.
		['tmhpcolor'] 		= Color(255,200,100,255), -- Max health text color.
	},
	['name'] = {
		['bgnamepos'] 		= {x = 81.5, y = 1049}, -- Health background pos.
		['bgnamesize'] 		= {w = 250, h = 25}, -- Health background size.
		['bgnameround'] 	= 8, -- Health background rounded corners.
		['bgnamecolor'] 	= Color(0, 0, 0, 155), -- Health background color.
		--
		['tnamepos'] 		= {x = 206, y = 1062.5}, -- Max health text pos.
		['tnametext'] 		= "Obtaining...", -- Max health text.
		['tnamefont'] 		= "csb_font_name_rebel", -- Max health text font.
		['tnamecolor'] 		= Color(255,200,100,255), -- Max health text color.
	},
	['armor'] = {
		['bgarmrpos'] 		= {x = 37, y = 972}, -- Armor background pos.
		['bgarmrsize'] 		= {w = 340, h = 70}, -- Armor background size.
		['bgarmrround']		= 8, -- Armor background rounded corners.
		['bgarmrcolor'] 	= Color(0, 0, 0, 155), -- Armor background color.
		--
		['narmrpos'] 		= {x = 235, y = 1011}, -- Armor value pos.
		['narmrfont'] 		= "csb_font_playerinfo_rebel", -- Armor value font.
		['narmrcolor'] 		= Color(255,200,100,255), -- Armor value color.
		['narmrlimit'] 		= 999, -- Armor value limit.
		--
		['tarmrpos'] 		= {x = 105, y = 1017.5}, -- Armor text pos.
		['tarmrtext'] 		= "BATTERY", -- Armor text.
		['tarmrfont'] 		= "csb_font_barinfo_rebel", -- Armor text font.
		['tarmrcolor'] 		= Color(255,200,100,255), -- Armor text color.
		--
		['nmarmrpos'] 		= {x = 340, y = 995}, -- Max armor value pos.
		['nmarmrfont'] 		= "csb_font_ammoinfo2_rebel", -- Max armor value font.
		['nmarmrcolor'] 	= Color(255,200,100,255), -- Max armor value color.
		['nmarmrlimit'] 	= 999, -- Max armor value limit.
		--
		['tmarmrpos'] 		= {x = 340, y = 1021}, -- Max armor text pos.
		['tmarmrtext'] 		= "MAX", -- Max armor text.
		['tmarmrfont'] 		= "csb_font_barinfo_rebel", -- Max armor text font.
		['tmarmrcolor'] 	= Color(255,200,100,255), -- Max armor text color.
	},
	['weaponname'] = {
		['bgwepnpos'] 		= {x = 1500, y = 896}, -- Weapon background pos.
		['bgwepnsize'] 		= {w = 380, h = 27}, -- Weapon background size.
		['bgwepnround']		= 8, -- Weapon background rounded corners.
		['bgwepncolor'] 	= Color(0, 0, 0, 155), -- Weapon background color.
		--
		['twepnpos'] 		= {x = 1690, y = 910}, -- Weapon name text (curently held) pos.
		['twepnfont'] 		= "csb_font_barinfo_rebel", -- Weapon name text (curently held) font.
		['twepncolor'] 		= Color(255,200,100,255), -- Weapon name text (curently held) color.
	},
	['weaponstat'] = {
		['bgweppos'] 		= {x = 1500, y = 930}, -- Weapon stats background pos.
		['bgwepsize'] 		= {w = 380, h = 112}, -- Weapon stats background size.
		['bgwepround']		= 8, -- Weapon stats background rounded corners.
		['bgwepcolor'] 		= Color(0, 0, 0, 155), -- Weapon stats background color.
		--
		['n1weppos'] 		= {x = 1660, y = 1011}, -- Weapon stats clip value pos.
		['n1wepfont'] 		= "csb_font_ammoinfo_rebel", -- Weapon stats clip value font.
		['n1wepcolor'] 		= Color(255,200,100,255), -- Weapon stats clip value color.
		['n1weplimit'] 		= 999, -- Weapon stats clip value limit.
		--
		['n2weppos'] 		= {x = 1805, y = 997}, -- Weapon stats reserve ammo value pos.
		['n2wepfont'] 		= "csb_font_ammoinfo2_rebel", -- Weapon stats reserve ammo value font.
		['n2wepcolor'] 		= Color(255,200,100,255), -- Weapon stats reserve ammo value color.
		['n2weplimit'] 		= 999, -- Weapon stats reserve ammo value limit.
		--
		['n3weppos'] 		= {x = 1805, y = 946}, -- Weapon stats secondary ammo value pos.
		['n3wepfont'] 		= "csb_font_ammoinfo2_rebel", -- Weapon stats secondary ammo value font.
		['n3wepcolor'] 		= Color(255,200,100,255), -- Weapon stats secondary ammo value color.
		['n3weplimit'] 		= 999, -- Weapon stats secondary ammo value limit.
		--
		['dmgweppos'] 		= {x = 1805, y = 970}, -- Weapon stats damage value pos.
		['dmgwepfont'] 		= "csb_font_ammoinfo2_rebel", -- Weapon stats damage value font.
		['dmgwepcolor'] 	= Color(255,200,100,255), -- Weapon stats damage value color.
		['dmgweplimit'] 	= 999, -- Weapon stats damage value limit.
		--
		['tweppos'] 		= {x = 1547, y = 1018}, -- Weapon stats ammo text pos.
		['tweptext'] 		= "AMMO", -- Weapon stats ammo text.
		['twepfont'] 		= "csb_font_barinfo_rebel", -- Weapon stats ammo text font.
		['twepcolor'] 		= Color(255,200,100,255), -- Weapon stats ammo text color.
		--
		['tpaweppos'] 		= {x = 1805, y = 1022}, -- Weapon stats reserve ammo text pos.
		['tpaweptext'] 		= "RESERVE", -- Weapon stats reserve ammo text.
		['tpawepfont'] 		= "csb_font_barinfo_rebel", -- Weapon stats reserve ammo text font.
		['tpawepcolor'] 	= Color(255,200,100,255), -- Weapon stats reserve ammo text color.
		--
		['tspweppos'] 		= {x = 1805, y = 971}, -- Weapon stats secondary ammo text pos.
		['tspweptext'] 		= "SPECIAL", -- Weapon stats secondary ammo text.
		['tspwepfont'] 		= "csb_font_barinfo_rebel", -- Weapon stats secondary ammo text font.
		['tspwepcolor'] 	= Color(255,200,100,255), -- Weapon stats secondary ammo text color.
		--
		['tdmgweppos'] 		= {x = 1833, y = 990}, -- Weapon stats damage text pos.
		['tdmgweptext'] 	= "DAMAGE", -- Weapon stats damage text.
		['tdmgwepfont'] 	= "csb_font_barinfo_rebel", -- Weapon stats damage text font.
		['tdmgwepcolor'] 	= Color(255,200,100,255), -- Weapon stats damage text color.
	},
}

SWEP.SuitAbilityPrimaryIcon 	= false
SWEP.SuitAbilitySecondaryIcon 	= false

SWEP.SuitAbilityIconColorTab = {
	['primary'] = Color(255,200,100,255),
	['secondary'] = Color(255,200,100,255),
}

SWEP.TPCameraPOS 				= {bone = "ValveBiped.Bip01_Head1", x = -20, y = -10, z = 40, crouch = 2}
SWEP.TPCameraPOSDefault 		= SWEP.TPCameraPOS

SWEP.PlyForceHeadRotation = {
['headbone'] 		= "",
['yawlimit']		= 0,
['pitchlimit']		= 0,
['rolllimit']		= 0
}

SWEP.PlyRappelTab = {
--['rapattach'] 	= "chest",
['rapstart']	= {"jump_holding_glide", false, true, false, nil}, -- Don't loop?
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

['lfootsoundrun'] 	= {"CSBPlySound.GearSound.CitizenL"},
['rfootsoundrun'] 	= {"CSBPlySound.GearSound.CitizenR"},
['runsndminspeed']	= 120,

['bothstep']		= {
['ladder']			= {"CSB.Ladder.StepLeft","CSB.Ladder.StepRight"},
['bloodyflesh'] 	= {"CSB.Flesh.StepLeft","CSB.Flesh.StepRight","CSBPlySound.GearSound.CitizenB"},
['concrete'] 		= {"CSB.Concrete.Land","CSBPlySound.GearSound.CitizenB"},
['plaster'] 		= {"CSB.DryWall.StepLeft","CSB.DryWall.StepRight","CSBPlySound.GearSound.CitizenB"},
['ceiling_tile'] 	= {"CSB.CeilingTile.StepLeft","CSB.CeilingTile.StepRight","CSBPlySound.GearSound.CitizenB"},
['dirt'] 			= {"CSB.Dirt.Land","CSBPlySound.GearSound.CitizenB"},
['flesh']			= {"CSB.Flesh.StepLeft","CSB.Flesh.StepRight","CSBPlySound.GearSound.CitizenB"},
['metalgrate'] 		= {"CSB.MetalGrate.Land","CSBPlySound.GearSound.CitizenB"},
['chainlink'] 		= {"CSB.ChainLink.StepLeft","CSB.ChainLink.StepRight","CSBPlySound.GearSound.CitizenB"},
['snow'] 			= {"CSB.Snow.Land","CSBPlySound.GearSound.CitizenB"},
['plastic'] 		= {"CSB.PlasticBox.StepLeft","CSB.PlasticBox.StepRight","CSBPlySound.GearSound.CitizenB"},
['plastic_box'] 	= {"CSB.PlasticBox.StepLeft","CSB.PlasticBox.StepRight","CSBPlySound.GearSound.CitizenB"},
['plastic_barrel'] 	= {"CSB.PlasticBarrel.StepLeft","CSB.PlasticBarrel.StepRight","CSBPlySound.GearSound.CitizenB"},
['solidmetal'] 		= {"CSB.SolidMetal.Land","CSBPlySound.GearSound.CitizenB"},
['metal'] 			= {"CSB.SolidMetal.Land","CSBPlySound.GearSound.CitizenB"},
['metal_box'] 		= {"CSB.SolidMetal.Land","CSBPlySound.GearSound.CitizenB"},
['sand'] 			= {"CSB.Sand.Land","CSBPlySound.GearSound.CitizenB"},
['antlionsand'] 	= {"CSB.Sand.Land","CSBPlySound.GearSound.CitizenB"},
['gravel'] 			= {"CSB.Gravel.Land","CSBPlySound.GearSound.CitizenB"},
['mud'] 			= {"CSB.Mud.Land","CSBPlySound.GearSound.CitizenB"},
['slime'] 			= {"CSB.Mud.Land","CSBPlySound.GearSound.CitizenB"},
['slipperyslime'] 	= {"CSB.Mud.Land","CSBPlySound.GearSound.CitizenB"},
['water'] 			= {"CSB.Water.StepLeft","CSB.Water.StepRight","CSBPlySound.GearSound.CitizenB"},
['wade'] 			= {"CSB.Wade.StepLeft","CSB.Wade.StepRight","CSBPlySound.GearSound.CitizenB"},
['tile'] 			= {"CSB.Tile.Land","CSBPlySound.GearSound.CitizenB"},
['grass'] 			= {"CSB.Grass.Land","CSBPlySound.GearSound.CitizenB"},
['metalvent'] 		= {"CSB.MetalVent.Land","CSBPlySound.GearSound.CitizenB"},
['wood'] 			= {"CSB.Wood.StepLeft","CSB.Wood.StepRight","CSBPlySound.GearSound.CitizenB"},
['wood_crate'] 		= {"CSB.WoodCrate.StepLeft","CSB.WoodCrate.StepRight","CSBPlySound.GearSound.CitizenB"},
['wood_panel'] 		= {"CSB.WoodPanel.StepLeft","CSB.WoodPanel.StepRight","CSBPlySound.GearSound.CitizenB"},
['cardboard'] 		= {"CSB.Cardboard.Land","CSBPlySound.GearSound.CitizenB"},
['glass'] 			= {"CSB.Glass.Land","CSBPlySound.GearSound.CitizenB"},
['rubber'] 			= {"CSB.Rubber.Land","CSBPlySound.GearSound.CitizenB"},
['default'] 		= {"CSB.Concrete.Land","CSBPlySound.GearSound.CitizenB"},
['defaultstep'] 	= {"CSB.Concrete.Land","CSBPlySound.GearSound.CitizenB"}
},

['stepcolboxmin'] 	= Vector(-3, -3, 0),
['stepcolboxmax'] 	= Vector(3, 3, 5),
['grounddist'] 		= 5,
['toeposmul'] 		= 0,
['fssounddelay'] 	= 0.05,
['deffssound'] 		= false
}

SWEP.RunSpeed 					= 210
SWEP.WalkSpeed 					= 80
SWEP.WalkSpeedAlt 				= 80
SWEP.CrouchedWalkSpeed 			= 0.8
SWEP.JumpPower 					= 200

SWEP.PlyHealth 					= 80
SWEP.PlyMaxHealth 				= 80
SWEP.PlyArmor 					= 0
SWEP.PlyMaxArmor			 	= 0

SWEP.HideWeapons				= false
SWEP.CanPickUpWeapons			= true
SWEP.WeaponBlackList			= {
['weapon_frag'] = true
}
SWEP.WeaponWhiteList			= {}

SWEP.Equipment = {
['weapons'] = {
},
['ammo'] 	= {
},
}

SWEP.CSB_Allies = {
['npc_citizen'] 		= true,
['npc_monk'] 			= true,
['monster_scientist'] 	= true,
['monster_barney'] 		= true,
['npc_alyx'] 			= true,
['npc_barney'] 			= true,
['npc_dog'] 			= true,
['npc_magnusson'] 		= true,
['npc_kleiner'] 		= true,
['npc_mossman'] 		= true,
['npc_eli'] 			= true,
['npc_fisherman'] 		= true,
['npc_vortigaunt'] 		= true
}

SWEP.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}

SWEP.CSB_AllyMarkers = {
['allymarksymbol'] 			= "u",
['allymarkfont'] 			= "Marlett",
['allymarkcolor'] 			= Color(255, 200, 100, 255), -- Icon color.
['allymarkcoloroutline'] 	= Color(0, 0, 0, 255) -- Icon's outline color.
}

SWEP.CSBActionMenuData = {
['title'] = "Action Menu",
['button1'] = "Idk what to do here",
['menuc'] = Color(0, 0, 0, 155), -- Menu color.
['tfont'] = "DermaDefaultBold", -- Button text font.
['tcolor'] = Color(0, 0, 0, 255), -- Button text color.
['buttonc'] = Color(255, 200, 100, 255), -- Button color.
['buttonchover'] = Color(100, 100, 55, 255) -- Button color when hovered over with mouse.
}

SWEP.PlyMeleeTable = {
['meleesound']	= "CSBPlySound.RebelF.Melee",
['meleedmg']	= 20,
['meleerang']	= 64,
['meleeanims']	= {"swing","MeleeAttack01"},
['dmgdelay'] 	= {1.4,0.6}
}

sound.Add( {
	name = "CSBPlySound.RebelF.KickVL",
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 75,
	pitch = 100,
	sound = {"vo/npc/female01/letsgo01.wav", "vo/npc/female01/letsgo02.wav", "vo/npc/female01/myleg01.wav", "vo/npc/female01/myleg02.wav"},
} )

SWEP.DoorKickTable = {
['dksound']		= "CSBPlySound.RebelF.Melee",
['dkvl']		= "CSBPlySound.RebelF.KickVL", -- good for voice lines
['dkvld']		= 0,
['dkrang']		= 32,
['dkanims']		= {"csb_door_kick"},
['dkopendelay'] = {0.7} -- animation duration - dkopendelay = moment at which door will get kicked
}

SWEP.PlyGrenadeTable = {
['gsound']		= "CSBPlySound.RebelF.Grenade",
['gentity']		= "npc_grenade_frag",
['gammo']		= "Grenade",
['gmodel']		= "models/weapons/w_npcnade.mdl",
['gmaterial']	= "",
['gfuse']		= "3",
['gforce']		= 650,
['gselfremove']	= 10,
['gsounddelay']	= 0.55,
['ganims']		= {"swing"},
['gdelay'] 		= {1.4},
['gbone']		= "ValveBiped.Bip01_R_Hand",
['gpos']		= Vector(-5,-20,60),
['gang']		= Angle(0,0,0),
['gppos']		= Vector(2.5,-2,1),
['gpang']		= Angle(0,0,180)
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
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['duel']		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['revolver'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['smg'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['ar2'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['shotgun'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['rpg'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['crossbow'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['camera'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['physgun'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['melee']		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['melee2'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['knife'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['fist'] 		= {
['anim'] 	= "",
['dmove'] 	= nil,
['canim'] 	= {2,1,1},
},
['grenade'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['slam'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['normal'] 		= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['passive'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
},
['invalid'] 	= {
['anim'] 	= "smgdraw",
['dmove'] 	= true,
['canim'] 	= {2,1,1},
}
}

SWEP.FlinchGestures = {
--['1']		= "flinchheadgest1", -- HITGROUP_HEAD
--['2']		= "flinchgutgest1", -- HITGROUP_CHEST
--['3']		= "flinchgutgest1", -- HITGROUP_STOMACH
--['4']		= "flinchlarmgest", -- HITGROUP_LEFTARM
--['5']		= "flinchrarmgest", -- HITGROUP_RIGHTARM
--['6']		= "flinchgutgest2", -- HITGROUP_LEFTLEG
--['7']		= "flinchgutgest2", -- HITGROUP_RIGHTLEG
--['fgdelay']		= 1,
--['fglast']		= 0
}

SWEP.FallAnimations = {
"jump_holding_land"
}

--SUIT SPECIFIC--
function SWEP:LoadVariables() -- Put here anything that you wish to reload on level transition.
self:SetNW2Bool("CSB_PrimaryAbility", true)
self:SetNW2Float("CSB_PrimaryAbilityCooldown", 20)

self:SetNW2Bool("CSB_SecondaryAbility", true)
self:SetNW2Float("CSB_SecondaryAbilityCooldown", 20)
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

function SWEP:CThink()
	--self:CSBIdleSounds()
end

SWEP.WorldModelSpawnPose = {
	
	['ValveBiped.Bip01_Head1'] = { ang = Angle( 0, 0, 0 ), pos = Vector( -10, 0, 0 ) },
	
	['ValveBiped.Bip01_R_UpperArm'] = { ang = Angle( -30, 5, 0 ) },
    ['ValveBiped.Bip01_L_UpperArm'] = { ang = Angle( 30, 5, 0 ) },

    ['ValveBiped.Bip01_R_ForeArm'] = { ang = Angle( -90, -80, 0 ) },
    ['ValveBiped.Bip01_L_ForeArm'] = { ang = Angle( 90, -80, 0 ) },
	
	['ValveBiped.Bip01_R_Hand'] = { ang = Angle( 90, 0, 0 ), pos = Vector( 0, 0, 2 ) },
    ['ValveBiped.Bip01_L_Hand'] = { ang = Angle( -90, 0, 0 ), pos = Vector( 0, 0, -2 ) },
	
	['ValveBiped.Bip01_R_Thigh'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 20, -5 ) },
    ['ValveBiped.Bip01_L_Thigh'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 20, -5 ) },
		
	['ValveBiped.Bip01_R_Calf'] = { ang = Angle( 0, 0, 0 ), pos = Vector( -16, -3, 0 ) },
    ['ValveBiped.Bip01_L_Calf'] = { ang = Angle( 0, 0, 0 ), pos = Vector( -16, -3, 0 ) },
		
	['ValveBiped.Bip01_R_Foot'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 0, 0 ) },
    ['ValveBiped.Bip01_L_Foot'] = { ang = Angle( 0, 0, 0 ), pos = Vector( 0, 0, 0 ) },
	
    ['ValveBiped.Bip01_Spine'] = { ang = Angle( 0, 0, 0 ) },
		
	['ValveBiped.Bip01_Pelvis'] = { ang = Angle( 0, 0, -90 ), pos = Vector( 0, 0, -37 ) }

}

function SWEP:CSBHoloPlay()

	local stuffToShrink = {
	"ValveBiped.Bip01_Head1",
	"ValveBiped.Bip01_Neck1",
	}

	for i = 1, #stuffToShrink do
	
		local bone = self:LookupBone(stuffToShrink[i])
	
		if bone then
	
			self:ManipulateBoneScale(bone,Vector(0,0,0))
	
		end
	
	end
	
	local stuffToFlatX = {
	"ValveBiped.Bip01_Spine",
	"ValveBiped.Bip01_Spine1",
	"ValveBiped.Bip01_Spine2",
	"ValveBiped.Bip01_Spine3",
	"ValveBiped.Bip01_Spine4",
	"ValveBiped.Bip01_L_Clavicle",
	"ValveBiped.Bip01_L_UpperArm",
	"ValveBiped.Bip01_L_Shoulder",
	"ValveBiped.Bip01_L_Bicep",
	"ValveBiped.Bip01_L_Elbow",
	"ValveBiped.Bip01_L_ForeArm",
	"ValveBiped.Bip01_L_Thigh",
	"ValveBiped.Bip01_L_Calf",
	"ValveBiped.Bip01_R_Clavicle",
	"ValveBiped.Bip01_R_UpperArm",
	"ValveBiped.Bip01_R_Shoulder",
	"ValveBiped.Bip01_R_Bicep",
	"ValveBiped.Bip01_R_Elbow",
	"ValveBiped.Bip01_R_ForeArm",
	"ValveBiped.Bip01_R_Thigh",
	"ValveBiped.Bip01_R_Calf",
	}

	for i = 1, #stuffToFlatX do
	
		local bone = self:LookupBone(stuffToFlatX[i])
	
		if bone then
	
			self:ManipulateBoneScale(bone,Vector(1,0.3,1))
	
		end
	
	end
	
	local stuffToFlatZ = {
	"ValveBiped.Bip01_Pelvis",
	"ValveBiped.Bip01_L_Trapezius",
	"ValveBiped.Bip01_R_Trapezius",
	}

	for i = 1, #stuffToFlatZ do
	
		local bone = self:LookupBone(stuffToFlatZ[i])
	
		if bone then
	
			self:ManipulateBoneScale(bone,Vector(1,1,0.1))
	
		end
	
	end
	
end

function SWEP:CSBInitialize()

end

local CSBRandomNameTab = {
"Peg",
"Myla",
"Dionne",
"Iris",
"Meadow",
"Chantel",
"Sunny",
"Winnie",
"Marianne",
"Gray",
"Blaire",
"Delia",
"Zelma",
"Ruthie",
"Aliona",
"Sharla",
"Emmaline",
"Marta",
"Nanette",
"Mikhaila",
"Franziska",
"Tammy",
"Hilda",
"Pheobe",
"Clover",
"Malinda",
"Jacki",
"Gundula",
"Gretta",
"Audrea",
"Nichola",
"Janka",
"Prissy",
"Laryn",
"Brook",
"Chrystal",
"Rike",
"Calista",
"Irene",
"Alene",
"Layla",
"Shantelle",
"Elinor",
"Frieda",
"Mysie",
"Aviana",
"Magda",
"Sharmaine",
"Katia"
}

local CSBRandomLastNameTab = {
"Penny",
"Keyes",
"Hampton",
"Derrickson",
"Madison",
"Rennold",
"Winfield",
"Winchester",
"Jarrett",
"Arnold",
"Roydon",
"Paige",
"Tipton",
"Pierce",
"Thompsett",
"Spooner",
"Martel",
"Szweda",
"Stoddard",
"Cock",
"Stanek",
"Newell",
"Freeman",
"Vance",
"Shephard",
"Calhoun",
"Mann",
"Quckie",
"Doe",
"Conagher",
"DeGroot",
"Fatso",
"Mundy",
"Ludwig",
"Mama",
"Weaver",
"Phillips",
"Queen",
"Day",
"Jacobs",
"Harlan",
"Meadows",
"Sadler",
"Thorburn",
"Marsh",
"Akers",
"Brewster",
"Alexander",
"Moses",
"Tittensor",
"Managan"
}

local RandomModels = {
{"models/Humans/Group01/Female_01.mdl", "0200000", 0, Color(0,65,85)},
{"models/Humans/Group01/Female_02.mdl", "0200000", 0, Color(0,65,85)},
{"models/Humans/Group01/Female_03.mdl", "0200000", 1, Color(0,65,85)},
{"models/Humans/Group01/Female_04.mdl", "0200000", 0, Color(0,65,85)},
{"models/Humans/Group01/Female_06.mdl", "0200000", 0, Color(0,65,85)},
{"models/Humans/Group01/Female_07.mdl", "0200000", 1, Color(0,65,85)},
}

function SWEP:CSBPreSuitApply()
	
	local plyName = plyName or CSBRandomNameTab[math.random(#CSBRandomNameTab)]
	local plyLastName = plyLastName or CSBRandomLastNameTab[math.random(#CSBRandomLastNameTab)]
	
	self.NotifyTab.nottext[4].text = plyName
	self.NotifyTab.nottext[6].text = plyLastName
	
	self.HUDTab.name.tnametext = plyName .. " " .. plyLastName
	
	self.newModel = RandomModels[math.random(#RandomModels)]
	
	self.PlyModel = self.newModel[1]
	
	self.Owner.vmBGTab = {
		['bgs'] = {}
	}
	
	if IsValid(self.Owner:GetHands()) then
	
		for i = 1,self.Owner:GetHands():GetNumBodyGroups() do
			
			if !table.HasValue(self.Owner.vmBGTab.bgs, i) then table.insert(self.Owner.vmBGTab.bgs, i) end
		
		end
		
		for i = 1,#self.Owner.vmBGTab.bgs do
			
			self.Owner.vmBGTab.bgs[i] = self.Owner:GetHands():GetBodygroup(i)
		
		end
	
	end
	
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
	
	self.CommandOperator = "Outpost"
	self.CommandOutOfRange = {"We have no one to spare, sorry " .. plyName .. ".", "Sorry, We are stretched thin as it is.", "We have no one in your area."}
	self.CommandTargetOutOfRange = {"This is out of our range.", "Don't be ridiculous " .. plyName ..".", "Are you crazy? No way!"}
	self.CommandInvalid = {"What are you talking about? Stop playing with the radio.", "There is no one here. Calm down.", "Haha, very funny " .. plyLastName .. ".", "This is White Forest, what do you need to report? What, is that you " .. plyLastName .. " again? God dammit."}
	self.Command1Answer = {"Alright, I'm comming!", "Hold in there " .. plyName ..". I'm on my way!", "Comming!"}
	self.Command2Answer = {"Let's get them!", "Screw You!", "I'll mess you up!"}
	self.Command3Answer = {"Alright, I'm going.", "Whatever you say " .. plyName ..".", "Sure thing.", "As you say."}
	self.Command4Answer = {"I'm right behind you.", "You lead the way.", "Lead on " .. plyName .. "."}
	self.Command5Answer = {"I'll stay here.", "Yes Sir! ...heh.", "Yeah, I could use a rest.", "Alright, I'll wait " .. plyName .. "."}
	self.Command6Answer = {"I'll look around.", "Alright, I'll let you know if I see anything " .. plyName .. ".", "I sure hope that I won't find anything.", "I'll let you know."} 
	self.Command7Answer = {"RUN!", "Take cover!", plyName .. ", watch out!"}

end

function SWEP:CSBPostSuitApply()
	
	local r = math.Remap(self.newModel[4].r, 0, 255, 0, 1)
	local g = math.Remap(self.newModel[4].g, 0, 255, 0, 1)
	local b = math.Remap(self.newModel[4].b, 0, 255, 0, 1)
	
	self.Owner:PlayerColorUpdate(nil, Vector(r,g,b))
	
	if IsValid(self.Owner:GetHands()) and self.newModel != nil then
	
		local hands = self.Owner:GetHands()
		
		hands:SetBodyGroups(self.newModel[2])
		hands:SetSkin(self.newModel[3])
		
	end

end

function SWEP:CSBDeploy()
end

function SWEP:CSBHolster()
end

function SWEP:CSBPrimaryAbility()

	return false
	
end

function SWEP:CSBSecondaryAbility()

	return false
	
end


function SWEP:CSBOnDrop()

	local ply = self:GetNW2Entity("CSB_SuitUser")
	
	if IsValid(self) and IsValid(ply) then
	
		if (SERVER) then
		
			if IsValid(self.abent1) then SafeRemoveEntity(self.abent1) end
			if IsValid(self.abent2) then SafeRemoveEntity(self.abent2) end
		
			if IsValid(ply) and ply.vmBGTab and IsValid(ply:GetHands()) then
	
				for i = 1,#ply.vmBGTab.bgs do
			
					ply:GetHands():SetBodygroup(i,ply.vmBGTab.bgs[i])

				end
		
			end
			
		end
	
		if timer.Exists("CSB_PRIMARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_PRIMARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityActive" .. ply:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityReady" .. ply:EntIndex() .. self:EntIndex()) end
		
	end
	
	if IsValid(self.manhack) then
	
		SafeRemoveEntity(self.manhack)
			
	end
	
end

function SWEP:CSBOnRemove()

	if IsValid(self) and IsValid(self.Owner) then
		
		if (SERVER) then
		
			if IsValid(self.abent1) then SafeRemoveEntity(self.abent1) end
			if IsValid(self.abent2) then SafeRemoveEntity(self.abent2) end
		
			if IsValid(self.Owner) and self.Owner.vmBGTab and IsValid(self.Owner:GetHands()) then
	
				for i = 1,#self.Owner.vmBGTab.bgs do
			
					self.Owner:GetHands():SetBodygroup(i,self.Owner.vmBGTab.bgs[i])

				end
		
			end
		
		end
		
		if timer.Exists("CSB_PRIMARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_PRIMARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_PRIMARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityActive" .. self.Owner:EntIndex() .. self:EntIndex()) end
		if timer.Exists("CSB_SECONDARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) then timer.Remove("CSB_SECONDARYAbilityReady" .. self.Owner:EntIndex() .. self:EntIndex()) end
		
	end
	
end

function SWEP:CSBOnRestore()
end


function SWEP:CSBAction1()

	--local tr = self.Owner:GetEyeTrace()
	
	--if tr.Hit and IsValid(tr.Entity) then
	--	tr.Entity:SetName("giga Chad")
	--	print("nameset")
	--	--PrintTable(tr.Entity:GetSaveTable( true ))
	
	--end
	
	--for i = 1, self.Owner:GetSequenceCount() do
	
	--	if self.Owner:GetSequenceActivityName(i) != "" and self.Owner:GetSequenceActivityName(i) != nil then
		
	--	print("------")
	--	print("sID " .. self.Owner:LookupSequence( self.Owner:GetSequenceName( i ) ) .. " sName " .. self.Owner:GetSequenceName( i ) .. " aID " .. self.Owner:GetSequenceActivity( i ) .. " aName " .. self.Owner:GetSequenceActivityName( i ))
	--	
	--	end
	
	--end
	
	self.Owner:CSBSetAnimationState(2, 0, 1)
	
end

SWEP.CSBPlyNPCCommand1 = {
	sound = {{"vo/npc/female01/help01.wav", "vo/npc/female01/headsup01.wav", "vo/npc/female01/headsup02.wav", "vo/npc/female01/overthere01.wav", "vo/npc/female01/overthere02.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand2 = {
	sound = {{"vo/npc/female01/letsgo01.wav", "vo/npc/female01/letsgo02.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand3 = {
	sound = {{"vo/npc/female01/leadtheway01.wav", "vo/npc/female01/leadtheway02.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}
--
SWEP.CSBPlyNPCCommand4 = {
	sound = {{"vo/npc/female01/squad_away01.wav", "vo/npc/female01/squad_away02.wav", "vo/npc/female01/squad_away03.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand5 = {
	sound = {{"npc/citizen/stayhere_f.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

SWEP.CSBPlyNPCCommand6 = {
	sound = {{"npc/citizen/holdspot01_f.wav", "npc/citizen/holdspot02_f.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}
 
SWEP.CSBPlyNPCCommand7 = {
	sound = {{"vo/npc/female01/watchout.wav", "vo/npc/female01/strider_run.wav", "vo/npc/female01/runforyourlife01.wav", "vo/npc/female01/runforyourlife02.wav"}},
	duration = {0},
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = SNDLVL_TALKING,
	pitch = 100
}

if (CLIENT) then--CLIENT--------------CLIENT------------------CLIENT-----------------------CLIENT-------------------------CLIENT----------------------CLIENT-----------------CLIENT

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
	--vm:SetMaterial("models/make_invisible")
end

function SWEP:CSBPostDrawViewModel( vm, weapon, ply )
	--vm:SetMaterial("")
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
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL ] 		= ACT_GESTURE_RANGE_ATTACK_PISTOL;
	[ ACT_HL2MP_GESTURE_RELOAD_PISTOL ] 			= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL ] 		= ACT_GESTURE_RANGE_ATTACK_PISTOL;
	[ ACT_HL2MP_GESTURE_RELOAD_DUEL ] 				= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER ] 	= ACT_GESTURE_RANGE_ATTACK_PISTOL;
	[ ACT_HL2MP_GESTURE_RELOAD_REVOLVER ] 			= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1 ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_SMG1 ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 ] 			= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_AR2 ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_SHOTGUN ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG ] 			= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_RPG ] 				= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW ] 	= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_CROSSBOW ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA ] 		= ACT_GESTURE_RANGE_ATTACK_PISTOL;
	[ ACT_HL2MP_GESTURE_RELOAD_CAMERA ] 			= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN ] 		= ACT_GESTURE_RANGE_ATTACK_SMG1;
	[ ACT_HL2MP_GESTURE_RELOAD_PHYSGUN ] 			= ACT_GESTURE_RELOAD_SMG1;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE ] 		= ACT_MELEE_ATTACK_SWING_GESTURE;
	[ ACT_HL2MP_GESTURE_RELOAD_MELEE ] 				= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2 ] 		= ACT_MELEE_ATTACK_SWING_GESTURE;
	[ ACT_HL2MP_GESTURE_RELOAD_MELEE2 ] 			= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE ] 		= ACT_MELEE_ATTACK_SWING_GESTURE;
	[ ACT_HL2MP_GESTURE_RELOAD_KNIFE ] 				= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST ] 		= ACT_MELEE_ATTACK_SWING_GESTURE;
	[ ACT_HL2MP_GESTURE_RELOAD_FIST ] 				= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE ] 		= ACT_MELEE_ATTACK_SWING_GESTURE;
	[ ACT_HL2MP_GESTURE_RELOAD_GRENADE ] 			= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM ] 		= ACT_MELEE_ATTACK_SWING_GESTURE;
	[ ACT_HL2MP_GESTURE_RELOAD_SLAM ] 				= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC ] 		= ACT_GESTURE_RANGE_ATTACK_PISTOL;
	[ ACT_HL2MP_GESTURE_RELOAD_MAGIC ] 				= ACT_GESTURE_RELOAD_PISTOL;
	
	[ ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE ] 		= ACT_GESTURE_RANGE_ATTACK_PISTOL;
	[ ACT_HL2MP_GESTURE_RELOAD_PASSIVE ] 			= ACT_GESTURE_RELOAD_PISTOL;
},
	['pistol'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_PISTOL, ACT_IDLE_ANGRY_PISTOL};
	[ ACT_MP_WALK ] 						        = {ACT_WALK, ACT_WALK_AIM_PISTOL};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN, ACT_RUN_AIM_PISTOL};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},	
	['duel'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_PISTOL, ACT_IDLE_ANGRY_PISTOL};
	[ ACT_MP_WALK ] 						        = {ACT_WALK, ACT_WALK_AIM_PISTOL};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN, ACT_RUN_AIM_PISTOL};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['revolver'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_PISTOL, ACT_IDLE_ANGRY_PISTOL};
	[ ACT_MP_WALK ] 						        = {ACT_WALK, ACT_WALK_AIM_PISTOL};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN, ACT_RUN_AIM_PISTOL};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_PISTOL};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['smg'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1_STIMULATED, ACT_IDLE_ANGRY_SMG1};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RIFLE_RELAXED, ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['ar2'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1_STIMULATED, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {"run_AR2_Relaxed_all", ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_AR2};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_ar2"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_ar2"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['shotgun'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SHOTGUN_STIMULATED, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {"run_AR2_Relaxed_all", ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['rpg'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_RPG, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RPG_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_RPG_RELAXED, ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_RPG};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_RPG};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_RPG};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_RPG};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_ar2"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_ar2"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['crossbow'] = { 
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SHOTGUN_STIMULATED, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {"run_AR2_Relaxed_all", ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['camera'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_PISTOL, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK, "walkAlertAim_AR2_ALL1"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN, "run_alert_aiming_ar2_all"};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['physgun'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SHOTGUN_STIMULATED, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {"run_AR2_Relaxed_all", ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_SHOTGUN};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['melee'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['melee2'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['knife'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['fist'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['grenade'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['slam'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['normal'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE, ACT_IDLE}; -- "scaredidle" <- no ACT assigned
	[ ACT_MP_WALK ] 						        = {ACT_WALK, "walk_panicked_all"};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN, "run_panicked_2_all"};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, "crouch_panicked"};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	    	= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	    		= {ACT_MELEE_ATTACK_SWING};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['passive'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE};
	[ ACT_MP_RUN ] 						   			= {ACT_RUN_RIFLE};
	[ ACT_MP_CROUCH_IDLE ] 				    		= {ACT_COVER_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH};
	[ ACT_MP_RELOAD_STAND ]		 		    		= {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {ACT_GESTURE_RELOAD_SMG1};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['invalid'] = { 
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_IDLE_SMG1_STIMULATED, "idle_ar2_aim"};
	[ ACT_MP_WALK ] 						        = {ACT_WALK_RIFLE_RELAXED, ACT_WALK_AIM_RIFLE};
	[ ACT_MP_RUN ] 						   		    = {ACT_RUN_AIM_RIFLE, ACT_RUN_AIM_RIFLE_STIMULATED};
	[ ACT_MP_CROUCH_IDLE ] 				    	    = {ACT_COVER_LOW, ACT_RANGE_AIM_SMG1_LOW};
	[ ACT_MP_CROUCHWALK ] 						    = {ACT_WALK_CROUCH_RIFLE, ACT_WALK_CROUCH_AIM_RIFLE};
	[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_STAND_SECONDARY ] 	    	    = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	        = {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_ATTACK_CROUCH_SECONDARY ]	       		= {ACT_GESTURE_RANGE_ATTACK_SMG1};
	[ ACT_MP_RELOAD_STAND ]		 		    	    = {"gesture_reload_smg1"};
	[ ACT_MP_RELOAD_CROUCH ]		 		        = {"gesture_reload_smg1"};
	[ ACT_MP_JUMP ] 						        = {ACT_JUMP};
	[ ACT_MP_SWIM_IDLE ] 						    = {ACT_JUMP};
	[ ACT_MP_SWIM ] 						        = {ACT_JUMP};
},
	['vehicle'] = {
	[ ACT_MP_STAND_IDLE ] 						    = {ACT_INVALID};
}
}