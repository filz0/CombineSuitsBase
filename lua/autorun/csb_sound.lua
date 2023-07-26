sound.Add( {
	name = "CSB.Medic.Debuff.DMG",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 90,
	pitch = 70,
	sound = { "csb/abilities/hitsound.wav" }
} )

sound.Add( {
	name = "CSBPlySound.Rebel.Wear",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = { "csb/humans/suit_rebel_equip.wav" }
} )

sound.Add( {
	name = "CSBPlySound.Combine.Drop",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = { "csb/combine/suit_combine_drop.wav" }
} )

sound.Add( {
	name = "CSBPlySound.Combine.Wear",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = { "csb/combine/suit_combine_equip.wav" }
} )

sound.Add( {
	name = "CSB.Rappel.Start",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/combine/zipline_clip1.wav","csb/combine/zipline_clip1.wav" }
} )

sound.Add( {
	name = "CSB.Rappel.Loop",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/combine/zipline1.wav","csb/combine/zipline2.wav" }
} )

sound.Add( {
	name = "CSB.Rappel.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/combine/zipline_hitground1.wav","csb/combine/zipline_hitground1.wav" }
} )

sound.Add( {
	name = "CSBDoorKick.Pound",
	channel = CHAN_AUTO,
	volume = VOL_NORM,
	level = 90,
	pitch = { 110, 130 },
	--sound = { "physics/metal/metal_grate_impact_hard1.wav", "physics/metal/metal_grate_impact_hard2.wav", "physics/metal/metal_grate_impact_hard3.wav" }
	sound = "ambient/materials/door_hit1.wav"
} )

sound.Add( {
	name = "CSBDoorKick.Break",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 100,
	pitch = { 80, 100 },
	sound = "ambient/materials/door_hit1.wav"
} )

sound.Add( {
	name = "CSBBodyChanger.Apply",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = 60,
	pitch = 100,
	sound = "csb/combine/sam_apply.wav"
} )

sound.Add( {
	name = "CSBPlySound.Suit.Drop",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = { 90, 110 },
	sound = { "npc/combine_soldier/zipline_hitground1.wav", "npc/combine_soldier/zipline_hitground2.wav" }
} )

sound.Add( {
	name = "CSBPlySound.Suit.Wear",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = { 90, 110 },
	sound = { "npc/combine_soldier/zipline_clothing1.wav", "npc/combine_soldier/zipline_clothing2.wav" }
} )

sound.Add( {
	name = "CSBPlySound.RadioOn",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = { "npc/metropolice/vo/on1.wav", "npc/metropolice/vo/on2.wav" }
} )

sound.Add( {
	name = "CSBPlySound.RadioOff",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 100,
	sound = { "npc/metropolice/vo/off1.wav", "npc/metropolice/vo/off2.wav", "npc/metropolice/vo/off3.wav", "npc/metropolice/vo/off4.wav" }
} )

sound.Add( {
	name = "CSBSuit.AbilityReady",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 110,
	sound = "buttons/combine_button3.wav"
} )

sound.Add( {
	name = "CSBSuit.AbilityNotReady",
	channel = CHAN_AUTO,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 110,
	sound = "buttons/combine_button2.wav"
} )

sound.Add( {
	name = "CSBSuit.MeleeHit.Something",
	channel = CHAN_BODY,
	volume = 0.7,
	level = SNDLVL_NORM,
	pitch = 110,
	sound = { "physics/body/body_medium_impact_hard1.wav", "physics/body/body_medium_impact_hard2.wav", "physics/body/body_medium_impact_hard3.wav", "physics/body/body_medium_impact_hard4.wav", "physics/body/body_medium_impact_hard5.wav", "physics/body/body_medium_impact_hard6.wav" }
} )

sound.Add( {
	name = "CSB..StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/.wav" }
} )
sound.Add( {
	name = "CSB..StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//

sound.Add( {
	name = "CSB.SolidMetal.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_solid_35.wav","csb/ply/footsteps/metal_solid_37.wav","csb/ply/footsteps/metal_solid_39.wav","csb/ply/footsteps/metal_solid_41.wav","csb/ply/footsteps/metal_solid_43.wav","csb/ply/footsteps/metal_solid_45.wav","csb/ply/footsteps/metal_solid_47.wav","csb/ply/footsteps/metal_solid_49.wav" }
} )
sound.Add( {
	name = "CSB.SolidMetal.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_solid_36.wav","csb/ply/footsteps/metal_solid_38.wav","csb/ply/footsteps/metal_solid_40.wav","csb/ply/footsteps/metal_solid_42.wav","csb/ply/footsteps/metal_solid_44.wav","csb/ply/footsteps/metal_solid_46.wav","csb/ply/footsteps/metal_solid_48.wav","csb/ply/footsteps/metal_solid_50.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.MetalGrate.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_grate_01.wav","csb/ply/footsteps/metal_grate_03.wav","csb/ply/footsteps/metal_grate_05.wav","csb/ply/footsteps/metal_grate_07.wav","csb/ply/footsteps/metal_grate_09.wav","csb/ply/footsteps/metal_grate_11.wav","csb/ply/footsteps/metal_grate_13.wav" }
} )
sound.Add( {
	name = "CSB.MetalGrate.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_grate_02.wav","csb/ply/footsteps/metal_grate_04.wav","csb/ply/footsteps/metal_grate_06.wav","csb/ply/footsteps/metal_grate_08.wav","csb/ply/footsteps/metal_grate_10.wav","csb/ply/footsteps/metal_grate_12.wav","csb/ply/footsteps/metal_grate_14.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Snow.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/snow_01.wav","csb/ply/footsteps/snow_03.wav","csb/ply/footsteps/snow_05.wav","csb/ply/footsteps/snow_07.wav","csb/ply/footsteps/snow_09.wav","csb/ply/footsteps/snow_11.wav" }
} )
sound.Add( {
	name = "CSB.Snow.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/snow_02.wav","csb/ply/footsteps/snow_04.wav","csb/ply/footsteps/snow_06.wav","csb/ply/footsteps/snow_08.wav","csb/ply/footsteps/snow_10.wav","csb/ply/footsteps/snow_12.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Dirt.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/dirt_01.wav","csb/ply/footsteps/dirt_03.wav","csb/ply/footsteps/dirt_05.wav","csb/ply/footsteps/dirt_07.wav","csb/ply/footsteps/dirt_09.wav","csb/ply/footsteps/dirt_11.wav","csb/ply/footsteps/dirt_13.wav" }
} )
sound.Add( {
	name = "CSB.Dirt.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/dirt_02.wav","csb/ply/footsteps/dirt_04.wav","csb/ply/footsteps/dirt_06.wav","csb/ply/footsteps/dirt_08.wav","csb/ply/footsteps/dirt_10.wav","csb/ply/footsteps/dirt_12.wav","csb/ply/footsteps/dirt_14.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Mud.StepLeft", --
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/mud_01.wav","csb/ply/footsteps/mud_03.wav","csb/ply/footsteps/mud_05.wav","csb/ply/footsteps/mud_07.wav" }
} )
sound.Add( {
	name = "CSB.Mud.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/mud_02.wav","csb/ply/footsteps/mud_04.wav","csb/ply/footsteps/mud_06.wav","csb/ply/footsteps/mud_08.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Grass.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.3,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/grass_01.wav","csb/ply/footsteps/grass_03.wav","csb/ply/footsteps/grass_05.wav","csb/ply/footsteps/grass_07.wav","csb/ply/footsteps/grass_09.wav","csb/ply/footsteps/grass_11.wav" }
} )
sound.Add( {
	name = "CSB.Grass.StepRight",
	channel = CHAN_AUTO,
	volume = 0.3,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/grass_02.wav","csb/ply/footsteps/grass_04.wav","csb/ply/footsteps/grass_06.wav","csb/ply/footsteps/grass_08.wav","csb/ply/footsteps/grass_10.wav","csb/ply/footsteps/grass_12.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.MetalVent.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/duct1.wav","csb/ply/footsteps/duct3.wav","csb/ply/footsteps/duct5.wav" }
} )
sound.Add( {
	name = "CSB.MetalVent.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/duct2.wav","csb/ply/footsteps/duct4.wav","csb/ply/footsteps/duct6.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Tile.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/tile_01.wav","csb/ply/footsteps/tile_03.wav","csb/ply/footsteps/tile_05.wav","csb/ply/footsteps/tile_07.wav","csb/ply/footsteps/tile_09.wav","csb/ply/footsteps/tile_11.wav","csb/ply/footsteps/tile_13.wav" }
} )
sound.Add( {
	name = "CSB.Tile.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/tile_02.wav","csb/ply/footsteps/tile_04.wav","csb/ply/footsteps/tile_06.wav","csb/ply/footsteps/tile_08.wav","csb/ply/footsteps/tile_10.wav","csb/ply/footsteps/tile_12.wav","csb/ply/footsteps/tile_14.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Water.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/slosh1.wav","csb/ply/footsteps/slosh3.wav","csb/ply/footsteps/slosh5.wav" }
} )
sound.Add( {
	name = "CSB.Water.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/slosh2.wav","csb/ply/footsteps/slosh4.wav","csb/ply/footsteps/slosh6.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Wade.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wade1.wav","csb/ply/footsteps/wade3.wav","csb/ply/footsteps/wade5.wav","csb/ply/footsteps/wade7.wav" }
} )
sound.Add( {
	name = "CSB.Wade.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wade2.wav","csb/ply/footsteps/wade4.wav","csb/ply/footsteps/wade6.wav","csb/ply/footsteps/wade8.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Ladder.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/ladder_01.wav","csb/ply/footsteps/ladder_03.wav","csb/ply/footsteps/ladder_05.wav","csb/ply/footsteps/ladder_07.wav","csb/ply/footsteps/ladder_09.wav","csb/ply/footsteps/ladder_11.wav" }
} )
sound.Add( {
	name = "CSB.Ladder.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/ladder_02.wav","csb/ply/footsteps/ladder_04.wav","csb/ply/footsteps/ladder_06.wav","csb/ply/footsteps/ladder_08.wav","csb/ply/footsteps/ladder_10.wav","csb/ply/footsteps/ladder_12.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Glass.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/glass_01.wav","csb/ply/footsteps/glass_08.wav","csb/ply/footsteps/glass_10.wav","csb/ply/footsteps/glass_12.wav" }
} )
sound.Add( {
	name = "CSB.Glass.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/glass_07.wav","csb/ply/footsteps/glass_09.wav","csb/ply/footsteps/glass_11.wav","csb/ply/footsteps/glass_13.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Concrete.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/concrete_ct_01.wav","csb/ply/footsteps/concrete_ct_03.wav","csb/ply/footsteps/concrete_ct_05.wav","csb/ply/footsteps/concrete_ct_07.wav","csb/ply/footsteps/concrete_ct_09.wav","csb/ply/footsteps/concrete_ct_11.wav","csb/ply/footsteps/concrete_ct_13.wav","csb/ply/footsteps/concrete_ct_15.wav" }
} )
sound.Add( {
	name = "CSB.Concrete.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/concrete_ct_02.wav","csb/ply/footsteps/concrete_ct_04.wav","csb/ply/footsteps/concrete_ct_06.wav","csb/ply/footsteps/concrete_ct_08.wav","csb/ply/footsteps/concrete_ct_10.wav","csb/ply/footsteps/concrete_ct_12.wav","csb/ply/footsteps/concrete_ct_14.wav","csb/ply/footsteps/concrete_ct_16.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Gravel.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/gravel_01.wav","csb/ply/footsteps/gravel_03.wav","csb/ply/footsteps/gravel_05.wav","csb/ply/footsteps/gravel_07.wav","csb/ply/footsteps/gravel_09.wav" }
} )
sound.Add( {
	name = "CSB.Gravel.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/gravel_02.wav","csb/ply/footsteps/gravel_04.wav","csb/ply/footsteps/gravel_06.wav","csb/ply/footsteps/gravel_08.wav","csb/ply/footsteps/gravel_10.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.ChainLink.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_chainlink_01.wav","csb/ply/footsteps/metal_chainlink_03.wav","csb/ply/footsteps/metal_chainlink_05.wav","csb/ply/footsteps/metal_chainlink_07.wav" }
} )
sound.Add( {
	name = "CSB.ChainLink.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_chainlink_02.wav","csb/ply/footsteps/metal_chainlink_04.wav","csb/ply/footsteps/metal_chainlink_06.wav","csb/ply/footsteps/metal_chainlink_09.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Flesh.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/flesh_footstep1.wav","csb/ply/footsteps/flesh_footstep3.wav","csb/ply/footsteps/flesh_footstep5.wav" }
} )
sound.Add( {
	name = "CSB.Flesh.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/flesh_footstep2.wav","csb/ply/footsteps/flesh_footstep4.wav","csb/ply/footsteps/flesh_footstep6.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Sand.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/sand_01.wav","csb/ply/footsteps/sand_03.wav","csb/ply/footsteps/sand_05.wav","csb/ply/footsteps/sand_07.wav","csb/ply/footsteps/sand_09.wav","csb/ply/footsteps/sand_11.wav" }
} )
sound.Add( {
	name = "CSB.Sand.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/sand_02.wav","csb/ply/footsteps/sand_04.wav","csb/ply/footsteps/sand_06.wav","csb/ply/footsteps/sand_08.wav","csb/ply/footsteps/sand_10.wav","csb/ply/footsteps/sand_12.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.CeilingTile.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/ceiling_tile_step1.wav","csb/ply/footsteps/ceiling_tile_step3.wav" }
} )
sound.Add( {
	name = "CSB.CeilingTile.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/ceiling_tile_step2.wav","csb/ply/footsteps/ceiling_tile_step4.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.DryWall.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/drywall_footstep1.wav","csb/ply/footsteps/drywall_footstep3.wav" }
} )
sound.Add( {
	name = "CSB.DryWall.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/drywall_footstep2.wav","csb/ply/footsteps/drywall_footstep4.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Cardboard.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/cardboard_box_footstep1.wav","csb/ply/footsteps/cardboard_box_footstep3.wav","csb/ply/footsteps/cardboard_box_footstep5.wav" }
} )
sound.Add( {
	name = "CSB.Cardboard.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/cardboard_box_footstep2.wav","csb/ply/footsteps/cardboard_box_footstep4.wav","csb/ply/footsteps/cardboard_box_footstep6.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.PlasticBarrel.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/plastic_barrel_footstep1.wav","csb/ply/footsteps/plastic_barrel_footstep3.wav","csb/ply/footsteps/plastic_barrel_footstep5.wav" }
} )
sound.Add( {
	name = "CSB.PlasticBarrel.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/plastic_barrel_footstep2.wav","csb/ply/footsteps/plastic_barrel_footstep4.wav","csb/ply/footsteps/plastic_barrel_footstep6.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.PlasticBox.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/plastic_box_footstep1.wav","csb/ply/footsteps/plastic_box_footstep3.wav" }
} )
sound.Add( {
	name = "CSB.PlasticBox.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/plastic_box_footstep2.wav","csb/ply/footsteps/plastic_box_footstep4.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Rubber.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/rubber_03.wav","csb/ply/footsteps/rubber_05.wav","csb/ply/footsteps/rubber_07.wav","csb/ply/footsteps/rubber_11.wav" }
} )
sound.Add( {
	name = "CSB.Rubber.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/rubber_04.wav","csb/ply/footsteps/rubber_06.wav","csb/ply/footsteps/rubber_08.wav","csb/ply/footsteps/rubber_12.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Wood.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wood_01.wav","csb/ply/footsteps/wood_03.wav","csb/ply/footsteps/wood_05.wav","csb/ply/footsteps/wood_07.wav","csb/ply/footsteps/wood_09.wav","csb/ply/footsteps/wood_11.wav","csb/ply/footsteps/wood_13.wav" }
} )
sound.Add( {
	name = "CSB.Wood.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wood_02.wav","csb/ply/footsteps/wood_04.wav","csb/ply/footsteps/wood_06.wav","csb/ply/footsteps/wood_08.wav","csb/ply/footsteps/wood_10.wav","csb/ply/footsteps/wood_12.wav","csb/ply/footsteps/wood_14.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.WoodBox.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wood_box_footstep1.wav","csb/ply/footsteps/wood_box_footstep3.wav" }
} )
sound.Add( {
	name = "CSB.WoodBox.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wood_box_footstep2.wav","csb/ply/footsteps/wood_box_footstep4.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.WoodCrate.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wood_box_footstep1.wav","csb/ply/footsteps/wood_box_footstep3.wav" }
} )
sound.Add( {
	name = "CSB.WoodCrate.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/wood_box_footstep2.wav","csb/ply/footsteps/wood_box_footstep4.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.WoodPanel.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/woodpanel1.wav","csb/ply/footsteps/woodpanel3.wav","csb/ply/footsteps/woodpanel5.wav" }
} )
sound.Add( {
	name = "CSB.WoodPanel.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/woodpanel2.wav","csb/ply/footsteps/woodpanel4.wav","csb/ply/footsteps/woodpanel6.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.MetalBox.StepLeft",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_box_footstep1.wav","csb/ply/footsteps/metal_box_footstep2.wav" }
} )
sound.Add( {
	name = "CSB.MetalBox.StepRight",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/metal_box_footstep2.wav","csb/ply/footsteps/metal_box_footstep4.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB..Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//

sound.Add( {
	name = "CSB.Cardboard.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_cardboard_01.wav","csb/ply/footsteps/land_cardboard_02.wav","csb/ply/footsteps/land_cardboard_03.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Concrete.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_concrete_01.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Dirt.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_dirt_01.wav","csb/ply/footsteps/land_dirt_02.wav","csb/ply/footsteps/land_dirt_03.wav","csb/ply/footsteps/land_dirt_04.wav","csb/ply/footsteps/land_dirt_05.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Glass.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_glass_01.wav","csb/ply/footsteps/land_glass_02.wav","csb/ply/footsteps/land_glass_03.wav","csb/ply/footsteps/land_glass_04.wav","csb/ply/footsteps/land_glass_05.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Grass.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_grass_01.wav","csb/ply/footsteps/land_grass_02.wav","csb/ply/footsteps/land_grass_03.wav","csb/ply/footsteps/land_grass_04.wav","csb/ply/footsteps/land_grass_05.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Gravel.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_gravel_01.wav","csb/ply/footsteps/land_gravel_02.wav","csb/ply/footsteps/land_gravel_03.wav","csb/ply/footsteps/land_gravel_04.wav","csb/ply/footsteps/land_gravel_05.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.MetalGrate.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_metal_grate_01.wav","csb/ply/footsteps/land_metal_grate_02.wav","csb/ply/footsteps/land_metal_grate_03.wav","csb/ply/footsteps/land_metal_grate_04.wav","csb/ply/footsteps/land_metal_grate_05.wav","csb/ply/footsteps/land_metal_grate_06.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.SolidMetal.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_metal_solid_01.wav","csb/ply/footsteps/land_metal_solid_02.wav","csb/ply/footsteps/land_metal_solid_03.wav","csb/ply/footsteps/land_metal_solid_04.wav","csb/ply/footsteps/land_metal_solid_05.wav","csb/ply/footsteps/land_metal_solid_06.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//

sound.Add( {
	name = "CSB.MetalVent.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_metal_vent_01.wav","csb/ply/footsteps/land_metal_vent_02.wav","csb/ply/footsteps/land_metal_vent_03.wav","csb/ply/footsteps/land_metal_vent_04.wav","csb/ply/footsteps/land_metal_vent_05.wav","csb/ply/footsteps/land_metal_vent_06.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//

sound.Add( {
	name = "CSB.Mud.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_mud_01.wav","csb/ply/footsteps/land_mud_02.wav","csb/ply/footsteps/land_mud_03.wav","csb/ply/footsteps/land_mud_04.wav","csb/ply/footsteps/land_mud_05.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Rubber.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_rubber_01.wav","csb/ply/footsteps/land_rubber_02.wav","csb/ply/footsteps/land_rubber_03.wav","csb/ply/footsteps/land_rubber_04.wav","csb/ply/footsteps/land_rubber_05.wav","csb/ply/footsteps/land_rubber_06.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Sand.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_sand_01.wav","csb/ply/footsteps/land_sand_02.wav","csb/ply/footsteps/land_sand_03.wav","csb/ply/footsteps/land_sand_04.wav","csb/ply/footsteps/land_sand_05.wav","csb/ply/footsteps/land_sand_06.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Snow.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_snow_01.wav","csb/ply/footsteps/land_snow_02.wav","csb/ply/footsteps/land_snow_03.wav","csb/ply/footsteps/land_snow_04.wav","csb/ply/footsteps/land_snow_05.wav","csb/ply/footsteps/land_snow_06.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//
sound.Add( {
	name = "CSB.Tile.Land",
	channel = CHAN_AUTO,
	volume = 0.6,
	level = 70,
	pitch = {90,105},
	sound = { "csb/ply/footsteps/land_tile_01.wav","csb/ply/footsteps/land_tile_02.wav","csb/ply/footsteps/land_tile_03.wav","csb/ply/footsteps/land_tile_04.wav","csb/ply/footsteps/land_tile_05.wav" }
} )
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//


