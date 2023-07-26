--Written by TFA's Exporter
--Place in lua\tfa_vox\packs\
TFAVOX_Models = TFAVOX_Models or {}
TFAVOX_Models["models/vjfix/police.mdl"] = {
	['taunt'] = {
		[1610] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntAgree'
		},
		[1612] = {
		},
		[1619] = {
		},
		[55] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntHalt'
		},
		[1618] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntLaugh'
		},
		[53] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntForward'
		},
		[1617] = {
		},
		[1642] = {
		},
		[54] = {
		},
		[1616] = {
		},
		[1620] = {
		},
		[1615] = {
		},
		[1614] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntSalute'
		},
		[1613] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntDisAgree'
		},
		[1611] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerTauntBecon'
		}
	},
	['murder'] = {
		['generic'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerMurder',
			['delay'] = 2
		}
	},
	['main'] = {
		['spawn'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerSpawn'
		},
		['fall'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerFall'
		},
		['heal'] = {
		},
		['pickup'] = {
		},
		['crithealth'] = {
		},
		['healmax'] = {
		},
		['reload'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerReload'
		},
		['death'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerDeath'
		},
		['step'] = {
		},
		['crithit'] = {
		},
		['noammo'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerNoAmmo'
		},
		['jump'] = {
		}
	},
	['damage'] = {
		[HITGROUP_GENERIC] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerDamage'
		}
	},
	['spot'] = {
		['turret'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['zombie'] = {
		},
		['generic'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['headcrab'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['ally'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerAlly'
		},
		['manhack'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['cp'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['combine'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['scanner'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		},
		['sniper'] = {
			['sound'] = 'TFA_VOX_MPolice.PlayerEnemyOther'
		}
	},
	['callouts'] = {
		['agree'] = {
			['name'] = "Agree",
			['sound'] = "TFA_VOX_MPolice.PlayerTauntAgree"
		},
		['disagree'] = {
			['name'] = "Disagree",
			['sound'] = "TFA_VOX_MPolice.PlayerTauntDisAgree"
		},
		['halt'] = {
			['name'] = "Halt",
			['sound'] = "TFA_VOX_MPolice.Halt"
		},
		['laugh'] = {
			['name'] = "Laugh",
			['sound'] = "TFA_VOX_MPolice.PlayerTauntLaugh"
		},
		['move'] = {
			['name'] = "Move",
			['sound'] = "TFA_VOX_MPolice.PlayerTauntForward"
		},
		['can'] = {
			['name'] = "Can It",
			['sound'] = "TFA_VOX_MPolice.CanIt"
		}
	}
}

--constants

SNDLVL_TALKING = SNDLVL_TALKING or 60
SNDLVL_80dB = SNDLVL_80dB or 80
PITCH_NORM = PITCH_NORM or 100

--EnemyScan--
sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyCombine",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/movebackrightnow.wav", "npc/metropolice/vo/allunitscloseonsuspect.wav", "npc/metropolice/vo/allunitsreportlocationsuspect.wav", "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/confirmpriority1sighted.wav", "npc/metropolice/vo/contactwith243suspect.wav", "npc/metropolice/vo/contactwithpriority2.wav", "npc/metropolice/vo/level3civilprivacyviolator.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyCP",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/movebackrightnow.wav", "npc/metropolice/vo/allunitscloseonsuspect.wav", "npc/metropolice/vo/allunitsreportlocationsuspect.wav", "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/confirmpriority1sighted.wav", "npc/metropolice/vo/contactwith243suspect.wav", "npc/metropolice/vo/contactwithpriority2.wav", "npc/metropolice/vo/level3civilprivacyviolator.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyZombie",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/infection.wav", "npc/metropolice/vo/necrotics.wav", "npc/metropolice/vo/tagonenecrotic.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyHeadcrab",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/tagoneparasitic.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyManhack",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/movebackrightnow.wav", "npc/metropolice/vo/allunitscloseonsuspect.wav", "npc/metropolice/vo/allunitsreportlocationsuspect.wav", "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/confirmpriority1sighted.wav", "npc/metropolice/vo/contactwith243suspect.wav", "npc/metropolice/vo/contactwithpriority2.wav", "npc/metropolice/vo/level3civilprivacyviolator.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyScanner",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/movebackrightnow.wav", "npc/metropolice/vo/allunitscloseonsuspect.wav", "npc/metropolice/vo/allunitsreportlocationsuspect.wav", "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/confirmpriority1sighted.wav", "npc/metropolice/vo/contactwith243suspect.wav", "npc/metropolice/vo/contactwithpriority2.wav", "npc/metropolice/vo/level3civilprivacyviolator.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerAlly",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/clearandcode100.wav", "npc/metropolice/vo/controlsection.wav", "npc/metropolice/vo/novisualonupi.wav", "npc/metropolice/vo/protectioncomplete.wav", "npc/combine_soldier/vo/reportallradialsfree.wav", "npc/metropolice/vo/ten8standingby.wav", "npc/metropolice/vo/checkformiscount.wav", "npc/metropolice/vo/control100percent.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerEnemyOther",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/movebackrightnow.wav", "npc/metropolice/vo/allunitscloseonsuspect.wav", "npc/metropolice/vo/allunitsreportlocationsuspect.wav", "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/confirmpriority1sighted.wav", "npc/metropolice/vo/contactwith243suspect.wav", "npc/metropolice/vo/contactwithpriority2.wav", "npc/metropolice/vo/level3civilprivacyviolator.wav" }
} )
--end--
--CustomTaunts--
sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntAgree",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/affirmative.wav", "npc/metropolice/vo/affirmative.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntDisAgree",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/nocontact.wav", "npc/metropolice/vo/novisualonupi.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntBecon",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/movebackrightnow.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntForward",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/move.wav", "npc/metropolice/vo/moveit.wav", "npc/metropolice/vo/moveit2.wav", "npc/metropolice/vo/keepmoving.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.CanIt",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/pickupthecan1.wav", "npc/metropolice/vo/pickupthecan2.wav", "npc/metropolice/vo/pickupthecan3.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntHalt",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/holdit.wav", "npc/metropolice/vo/holditrightthere.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.Halt",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/dontmove.wav", "npc/metropolice/vo/holdit.wav", "npc/metropolice/vo/holditrightthere.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntLaugh",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/chuckle.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerTauntSalute",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/administer.wav" }
} )
--end--
sound.Add( {
	name = "TFA_VOX_MPolice.PlayerNoAmmo",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/shit.wav", "npc/metropolice/vo/help.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerReload",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/backmeupimout.wav", "npc/metropolice/vo/runninglowonverdicts.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerSpawn",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/inpositiononeready.wav", "npc/metropolice/vo/inposition.wav", "npc/metropolice/vo/readytojudge.wav", "npc/metropolice/vo/readytoprosecute.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerDeath",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/die1.wav", "npc/metropolice/die2.wav", "npc/metropolice/die3.wav", "npc/metropolice/die4.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerWalk",
	channel = CHAN_AUTO,
	volume = 1.800,
	level = SNDLVL_80dB,
	pitch = { 95, 110 },
	sound = { "npc/metropolice/gear1.wav", "npc/metropolice/gear2.wav", "npc/metropolice/gear3.wav", "npc/metropolice/gear4.wav", "npc/metropolice/gear5.wav", "npc/metropolice/gear6.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerFall",
	channel = CHAN_AUTO,
	volume = 1.800,
	level = SNDLVL_80dB,
	pitch = { 95, 110 },
	sound = { "ambient/wind/wind_gust_10.wav", "ambient/wind/wind_gust_2.wav", "ambient/wind/wind_snippet4.wav", "ambient/wind/wind_snippet5.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerDamage",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/pain1.wav", "npc/metropolice/pain2.wav", "npc/metropolice/pain3.wav", "npc/metropolice/pain4.wav" }
} )

sound.Add( {
	name = "TFA_VOX_MPolice.PlayerMurder",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/chuckle.wav", "npc/metropolice/vo/suspectisbleeding.wav", "npc/metropolice/vo/pacifying.wav", "npc/metropolice/vo/sterilize.wav", "npc/metropolice/vo/amputate.wav", "npc/metropolice/vo/expired.wav" }
} )
