--Written by TFA's Exporter
--Place in lua\tfa_vox\packs\
TFAVOX_Models = TFAVOX_Models or {}
TFAVOX_Models["models/vjfix/combine_super_soldier.mdl"] = {
	['taunt'] = {
		[ACT_GMOD_GESTURE_AGREE] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTaunt"
		},
		[ACT_GMOD_GESTURE_BECON] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntBecon"
		},
		[ACT_GMOD_GESTURE_BOW] = {
		},
		[ACT_GMOD_GESTURE_DISAGREE] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntDisAgree"
		},
		[ACT_GMOD_TAUNT_SALUTE] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntSalute"
		},
		[ACT_GMOD_GESTURE_WAVE] = {
		},
		[ACT_GMOD_TAUNT_PERSISTENCE] = {
		},
		[ACT_GMOD_TAUNT_MUSCLE] = {
		},
		[ACT_GMOD_TAUNT_LAUGH] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntLaugh"
		},
		[ACT_GMOD_GESTURE_POINT] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntForward"
		},
		[ACT_GMOD_TAUNT_CHEER] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntCheer"
		},
		[ACT_SIGNAL_FORWARD] = {
			['sound'] = "TFA_VOX_COMBINE.PlayerTauntForward"
		},
		[ACT_SIGNAL_GROUP] = {
		},
		[ACT_SIGNAL_HALT] = {
		}
	},
	['murder'] = {
		['generic'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerMurder'
		}
	},
	['main'] = {
		['spawn'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerSpawn'
		},
		['fall'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerFall'
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
			['sound'] = 'TFA_VOX_COMBINE.PlayerReload',
			['delay'] = 1
		},
		['death'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerDeath'
		},
		['step'] = {
		},
		['crithit'] = {
		},
		['noammo'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerNoAmmo'
		},
		['jump'] = {
		--	['sound'] = 'TFA_VOX_COMBINE.PlayerJump'
		}
	},
	['damage'] = {
		[HITGROUP_GENERIC] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerDamage'
		}
	},
	['spot'] = {
		['turret'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyTurret'
		},
		['zombie'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyZombie'
		},
		['generic'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyOther'
		},
		['headcrab'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyHeadcrab'
		},
		['ally'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerAlly'
		},
		['manhack'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyManhack'
		},
		['cp'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyCP'
		},
		['combine'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyCombine'
		},
		['scanner'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemyScanner'
		},
		['sniper'] = {
			['sound'] = 'TFA_VOX_COMBINE.PlayerEnemySniper'
		}
	},
	['callouts'] = {
		['agree'] = {
			['name'] = "Agree",
			['sound'] = 'TFA_VOX_COMBINE.PlayerTauntAgree'
		},
		['disagree'] = {
			['name'] = "Disagree",
			['sound'] = 'TFA_VOX_COMBINE.PlayerTauntDisAgree'
		},
		['clear'] = {
			['name'] = "Clear",
			['sound'] = 'TFA_VOX_COMBINE.Clear'
		},
		['help'] = {
			['name'] = "Help",
			['sound'] = 'TFA_VOX_COMBINE.Help'
		},
		['go'] = {
			['name'] = "Move Out",
			['sound'] = 'TFA_VOX_COMBINE.MoveOut'
		},
		['laugh'] = {
			['name'] = "Laugh",
			['sound'] = 'TFA_VOX_COMBINE.PlayerTauntLaugh'
		},
		['taunt'] = {
			['name'] = "Taunt",
			['sound'] = 'TFA_VOX_COMBINE.Taunt'
		},
		['heal'] = {
			['name'] = "Heal Me",
			['sound'] = 'TFA_VOX_COMBINE.HealMe'
		}
	}
}

TFAVOX_Models["models/vjfix/combine_soldier_prisonguard.mdl"] = TFAVOX_Models["models/vjfix/combine_super_soldier.mdl"]
TFAVOX_Models["models/vjfix/combine_soldier.mdl"] = TFAVOX_Models["models/vjfix/combine_super_soldier.mdl"]

--Soundlevels--

SNDLVL_TALKING = SNDLVL_TALKING or 60
SNDLVL_80dB = SNDLVL_80dB or 80

--EnemyScan--
sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyCombine",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = {
		"npc/combine_soldier/vo/contactconfim.wav",
		"npc/combine_soldier/vo/overwatch.wav",
		"npc/combine_soldier/vo/executingfullresponse.wav",
		"npc/combine_soldier/vo/target.wav",
		"npc/combine_soldier/vo/heavyresistance.wav",
		"npc/combine_soldier/vo/readyweaponshostilesinbound.wav"  }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyCP",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/callcontacttarget1.wav",
		"npc/combine_soldier/vo/contactconfim.wav",
		"npc/combine_soldier/vo/overwatch.wav",
		"npc/combine_soldier/vo/target.wav",
		"npc/combine_soldier/vo/readyweaponshostilesinbound.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyZombie",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/infected.wav",
		"npc/combine_soldier/vo/necrotics.wav",
		"npc/combine_soldier/vo/necroticsinbound.wav",
		"npc/combine_soldier/vo/engagedincleanup.wav",
	 	"npc/combine_soldier/vo/outbreak.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyHeadcrab",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/callcontactparasitics.wav",
		"npc/combine_soldier/vo/antiseptic.wav",
		"npc/combine_soldier/vo/engagedincleanup.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyTurret",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = {  "npc/combine_soldier/vo/callcontacttarget1.wav",
		"npc/combine_soldier/vo/contactconfim.wav",
		"npc/combine_soldier/vo/contactconfirmprosecuting.wav",
		"npc/combine_soldier/vo/executingfullresponse.wav",
		"npc/combine_soldier/vo/target.wav",
		"npc/combine_soldier/vo/heavyresistance.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyManhack",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/callcontacttarget1.wav",
		"npc/combine_soldier/vo/contactconfim.wav",
		"npc/combine_soldier/vo/contactconfirmprosecuting.wav",
		"npc/combine_soldier/vo/overwatch.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyScanner",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/callcontacttarget1.wav",
		"npc/combine_soldier/vo/contactconfim.wav",
		"npc/combine_soldier/vo/contactconfirmprosecuting.wav",
		"npc/combine_soldier/vo/overwatch.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemySniper",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/ghost.wav",
		 "npc/combine_soldier/vo/ghost2.wav",
	 	 "npc/combine_soldier/vo/fixsightlinesmovein.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerAlly",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/hasnegativemovement.wav",
		"npc/combine_soldier/vo/reportingclear.wav",
		"npc/combine_soldier/vo/reportallpositionsclear.wav",
		"npc/combine_soldier/vo/contactconfirmprosecuting.wav",
		"npc/combine_soldier/vo/reportallradialsfree.wav",
		"npc/combine_soldier/vo/sectorissecurenovison.wav",
		"npc/combine_soldier/vo/stabilizationteamhassector.wav",
		"npc/combine_soldier/vo/stayalertreportsightlines.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerEnemyOther",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/callcontacttarget1.wav",
		"npc/combine_soldier/vo/contactconfim.wav",
		"npc/combine_soldier/vo/contactconfirmprosecuting.wav",
		"npc/combine_soldier/vo/executingfullresponse.wav",
		"npc/combine_soldier/vo/target.wav",
		"npc/combine_soldier/vo/readyweaponshostilesinbound.wav"  }
} )
--end--
--CustomTaunts--
sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntAgree",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/affirmative.wav",
		"npc/combine_soldier/vo/affirmative2.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntDisAgree",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/sundown.wav",
		"npc/combine_soldier/vo/noviscon.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntBecon",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/closing.wav",
		"npc/combine_soldier/vo/closing.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntForward",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/movein.wav",
		 "npc/combine_soldier/vo/alert1.wav",
		  "npc/combine_soldier/vo/gosharp.wav",
		   "npc/combine_soldier/vo/gosharpgosharp.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntCheer",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/sectorissecurenovison.wav",
		 "npc/combine_soldier/vo/stabilizationteamhassector.wav",
		  "npc/combine_soldier/vo/reportallpositionsclear.wav",
		   "npc/combine_soldier/vo/reportallradialsfree.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntLaugh",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/metropolice/vo/chuckle.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntDance",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "player/headshot1.wav",
		 "player/headshot2.wav",
		  "player/headshot3.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerTauntSalute",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/administer.wav" }
} )
--end--
sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerNoAmmo",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/cleaned.wav",
		 "npc/combine_soldier/vo/gosharp.wav",
		  "npc/combine_soldier/vo/ripcordripcord.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerReload",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/coverme.wav",
		 "npc/combine_soldier/vo/cover.wav",
		  "npc/combine_soldier/vo/readyweapons.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerSpawn",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/teamdeployedandscanning.wav",
		 "npc/combine_soldier/vo/priority1objective.wav",
		  "npc/combine_soldier/vo/inbound.wav",
		   "npc/combine_soldier/vo/unitismovingin.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerDeath",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/die1.wav",
		 "npc/combine_soldier/die2.wav",
		  "npc/combine_soldier/die3.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerJump",
	channel = CHAN_AUTO,
	volume = 1.800,
	level = SNDLVL_80dB,
	pitch = { 95, 110 },
	sound = { "npc/combine_soldier/gear1.wav",
		"npc/combine_soldier/gear2.wav",
		"npc/combine_soldier/gear3.wav",
		"npc/combine_soldier/gear4.wav",
		"npc/combine_soldier/gear5.wav",
		"npc/combine_soldier/gear6.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerWalk",
	channel = CHAN_AUTO,
	volume = 1.800,
	level = SNDLVL_80dB,
	pitch = { 95, 110 },
	sound = { "npc/combine_soldier/gear1.wav",
		"npc/combine_soldier/gear2.wav",
		"npc/combine_soldier/gear3.wav",
		"npc/combine_soldier/gear4.wav",
		"npc/combine_soldier/gear5.wav",
		"npc/combine_soldier/gear6.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerFall",
	channel = CHAN_AUTO,
	volume = 1.800,
	level = SNDLVL_80dB,
	pitch = { 95, 110 },
	sound = {
		"ambient/wind/wind_gust_10.wav",
		"ambient/wind/wind_gust_2.wav",
		"ambient/wind/wind_snippet4.wav",
		"ambient/wind/wind_snippet5.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerDamage",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.PlayerMurder",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/targetblackout.wav",
		"npc/combine_soldier/vo/targetcompromisedmovein.wav",
		"npc/combine_soldier/vo/targetineffective.wav",
		"npc/combine_soldier/vo/thatsitwrapitup.wav",
	 	"npc/combine_soldier/vo/payback.wav",
	 	"npc/combine_soldier/vo/onedown.wav",
	 	"npc/combine_soldier/vo/onecontained.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.Clear",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = { "npc/combine_soldier/vo/secure.wav",
		"npc/combine_soldier/vo/assaultpointsecureadvance.wav",
		"npc/combine_soldier/vo/sectorissecurenovison.wav",
		"npc/combine_soldier/vo/hasnegativemovement.wav",
		"npc/combine_soldier/vo/vo/overwatchconfirmhvtcontained.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.Taunt",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = {
		 "npc/metropolice/vo/chuckle.wav" ,
		"npc/combine_soldier/vo/thatsitwrapitup.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.Help",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = {
		"npc/combine_soldier/vo/coverme.wav",
		"npc/combine_soldier/vo/isfinalteamunitbackup.wav",
		"npc/combine_soldier/vo/overwatchrequestreinforcement.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.HealMe",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = {
		"npc/combine_soldier/vo/requestmedical.wav",
		"npc/combine_soldier/vo/requeststimdose.wav" }
} )

sound.Add( {
	name = "TFA_VOX_COMBINE.MoveOut",
	channel = CHAN_AUTO,
	volume = 1,
	level = SNDLVL_TALKING,
	pitch = PITCH_NORM,
	sound = {
		"npc/combine_soldier/vo/fixsightlinesmovein.wav",
		"npc/combine_soldier/vo/gosharp.wav",
		"npc/combine_soldier/vo/gosharpgosharp.wav",
		"npc/combine_soldier/vo/displace.wav",
		"npc/combine_soldier/vo/displace2.wav" }
} )
