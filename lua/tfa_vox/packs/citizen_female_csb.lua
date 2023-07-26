TFAVOX_Models = TFAVOX_Models or {}

local defaultModel = "models/humans/group01/female_01.mdl"

TFAVOX_Models["models/humans/group01/female_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/female_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/female_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/female_05.mdl"] = TFAVOX_Models[defaultModel] -- some day, eyy?
TFAVOX_Models["models/humans/group01/female_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/female_07.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models["models/humans/group02/female_01.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/female_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/female_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/female_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/female_05.mdl"] = TFAVOX_Models[defaultModel] -- some day, eyy?
TFAVOX_Models["models/humans/group02/female_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/female_07.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models["models/humans/group03/female_01.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/female_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/female_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/female_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/female_05.mdl"] = TFAVOX_Models[defaultModel] -- some day, eyy?
TFAVOX_Models["models/humans/group03/female_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/female_07.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models["models/humans/group03m/female_01.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/female_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/female_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/female_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/female_05.mdl"] = TFAVOX_Models[defaultModel] -- some day, eyy?
TFAVOX_Models["models/humans/group03m/female_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/female_07.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models[defaultModel] = {
	['main'] = {
		['death'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "death", { "vo/npc/female01/pain07.wav", "vo/npc/female01/pain08.wav", "vo/npc/female01/pain09.wav" } )
		},
		['spawn'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "spawn", { "vo/npc/female01/ahgordon01.wav", "vo/npc/female01/ahgordon02.wav", "vo/npc/female01/docfreeman01.wav", "vo/npc/female01/docfreeman02.wav", "vo/npc/female01/freeman.wav" } )
		},
		['reload'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "reload", { "vo/npc/female01/gottareload01.wav", "vo/npc/female01/coverwhilereload01.wav", "vo/npc/female01/coverwhilereload02.wav" } )
		},
		['noammo'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "noammo", { "vo/npc/female01/goodgod.wav", "vo/npc/female01/uhoh.wav", "vo/npc/female01/fantastic01.wav" } )
		},
		['fall'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "fall", { "ambient/wind/wind_gust_10.wav", "ambient/wind/wind_gust_2.wav", "ambient/wind/wind_snippet4.wav", "ambient/wind/wind_snippet5.wav" } )
		}
	},
	['murder'] = {
		['combine'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdcomb", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdcp", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdzomb", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdhc", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdmh", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdsca", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['sniper'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdsni", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['turret'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdtur", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		},
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdgener", { "vo/npc/female01/gotone01.wav", "vo/npc/female01/gotone02.wav", "vo/npc/female01/likethat.wav", "vo/npc/female01/yeah02.wav", "vo/npc/female01/fantastic02.wav", "vo/npc/female01/vanswer06.wav" } )
		}
	},
	['spot'] = {
		['combine'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "spotcomb", { "vo/npc/female01/combine01.wav", "vo/npc/female01/combine02.wav" } )
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "spotcp", { "vo/npc/female01/civilprotection01.wav", "vo/npc/female01/civilprotection02.wav", "vo/npc/female01/cps01.wav", "vo/npc/female01/cps02.wav" } )
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "spotzom", { "vo/npc/female01/zombies01.wav", "vo/npc/female01/zombies02.wav" } )
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "spothc", { "vo/npc/female01/headcrabs01.wav", "vo/npc/female01/headcrabs02.wav" } )
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "spotmh", { "vo/npc/female01/hacks01.wav", "vo/npc/female01/hacks02.wav", "vo/npc/female01/herecomehacks01.wav", "vo/npc/female01/herecomehacks02.wav" } )
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdsca", { "vo/npc/female01/scanners01.wav", "vo/npc/female01/scanners02.wav" } )
		},
		['ally'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdally", { "vo/npc/female01/answer01.wav", 
	"vo/npc/female01/answer02.wav", 
	"vo/npc/female01/answer03.wav", 
	"vo/npc/female01/answer04.wav", 
	"vo/npc/female01/answer05.wav", 
	"vo/npc/female01/answer07.wav", 
	"vo/npc/female01/answer08.wav", 
	"vo/npc/female01/answer09.wav", 
	"vo/npc/female01/answer10.wav", 
	"vo/npc/female01/answer11.wav", 
	"vo/npc/female01/answer12.wav", 
	"vo/npc/female01/answer13.wav", 
	"vo/npc/female01/answer14.wav", 
	"vo/npc/female01/answer15.wav", 
	"vo/npc/female01/answer16.wav", 
	"vo/npc/female01/answer17.wav", 
	"vo/npc/female01/answer18.wav", 
	"vo/npc/female01/answer19.wav", 
	"vo/npc/female01/answer20.wav", 
	"vo/npc/female01/answer21.wav", 
	"vo/npc/female01/answer22.wav", 
	"vo/npc/female01/answer23.wav", 
	"vo/npc/female01/answer24.wav", 
	"vo/npc/female01/answer25.wav", 
	"vo/npc/female01/answer26.wav", 
	"vo/npc/female01/answer27.wav", 
	"vo/npc/female01/answer28.wav",
	"vo/npc/female01/answer29.wav", 
	"vo/npc/female01/answer30.wav", 	
	"vo/npc/female01/question01.wav",
	"vo/npc/female01/question02.wav",
	"vo/npc/female01/question03.wav",
	"vo/npc/female01/question04.wav",
	"vo/npc/female01/question05.wav",
	"vo/npc/female01/question06.wav",
	"vo/npc/female01/question07.wav",
	"vo/npc/female01/question08.wav",
	"vo/npc/female01/question09.wav",
	"vo/npc/female01/question10.wav",
	"vo/npc/female01/question11.wav",
	"vo/npc/female01/question12.wav",
	"vo/npc/female01/question13.wav",
	"vo/npc/female01/question14.wav",
	"vo/npc/female01/question15.wav",
	"vo/npc/female01/question16.wav",
	"vo/npc/female01/question17.wav",
	"vo/npc/female01/question18.wav",
	"vo/npc/female01/question19.wav",
	"vo/npc/female01/question20.wav",
	"vo/npc/female01/question21.wav",
	"vo/npc/female01/question22.wav",
	"vo/npc/female01/question23.wav",
	"vo/npc/female01/question25.wav",
	"vo/npc/female01/question26.wav",
	"vo/npc/female01/question27.wav",
	"vo/npc/female01/question28.wav",
	"vo/npc/female01/question29.wav",
	"vo/npc/female01/question30.wav",
	"vo/npc/female01/question31.wav" } )
		},
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "murdgener", { "vo/npc/female01/startle01.wav", "vo/npc/female01/startle02.wav", "vo/npc/female01/getdown02.wav", "vo/npc/female01/headsup01.wav", "vo/npc/female01/headsup02.wav" } )
		}
	},
	['taunt'] = {
		[ACT_GMOD_GESTURE_AGREE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_GESTURE_AGREE", { "vo/npc/female01/ok01.wav", "vo/npc/female01/ok02.wav", "vo/npc/female01/nice01.wav", "vo/npc/female01/nice02.wav" } )
		},
		[ACT_GMOD_GESTURE_BECON] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_GESTURE_BECON", { "vo/npc/female01/overhere01.wav", "vo/npc/female01/squad_away01.wav", "vo/npc/female01/squad_away02.wav", "vo/npc/female01/squad_away03.wav" } )
		},
		[ACT_GMOD_GESTURE_BOW] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_GESTURE_BOW", { "vo/npc/female01/sorry01.wav", "vo/npc/female01/sorry02.wav", "vo/npc/female01/sorry03.wav", "vo/npc/female01/pardonme01.wav", "vo/npc/female01/pardonme02.wav" } )
		},
		[ACT_GMOD_GESTURE_DISAGREE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_GESTURE_DISAGREE", { "vo/npc/female01/no01.wav", "vo/npc/female01/no02.wav" } )
		},
		[ACT_GMOD_TAUNT_SALUTE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_TAUNT_SALUTE", { "vo/npc/female01/leadtheway01.wav", "vo/npc/female01/leadtheway02.wav" } )
		},
		[ACT_GMOD_GESTURE_WAVE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_GESTURE_WAVE", { "vo/npc/female01/hi01.wav", "vo/npc/female01/hi02.wav" } )
		},
		[ACT_GMOD_TAUNT_PERSISTENCE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_TAUNT_PERSISTENCE", { "vo/npc/female01/help01.wav", "bvo/npc/female01/watchout.wav" } )
		},
		[ACT_GMOD_TAUNT_LAUGH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_TAUNT_LAUGH", { "vo/coast/odessa/female01/nlo_cheer03.wav" } )
		},
		[ACT_GMOD_TAUNT_CHEER] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_GMOD_TAUNT_CHEER", { "vo/coast/odessa/female01/nlo_cheer01.wav", "vo/coast/odessa/female01/nlo_cheer02.wav" } )
		},
		[ACT_SIGNAL_FORWARD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "ACT_SIGNAL_FORWARD", { "vo/npc/female01/squad_follow03.wav", "vo/npc/female01/letsgo01.wav", "vo/npc/female01/letsgo02.wav" } )
		}
	},
	['damage'] = {
		[HITGROUP_GENERIC] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_GENERIC", { "vo/npc/female01/pain01.wav", "vo/npc/female01/pain02.wav", "vo/npc/female01/pain03.wav", "vo/npc/female01/pain04.wav", "vo/npc/female01/pain05.wav", "vo/npc/female01/pain06.wav" } )
		},
		[HITGROUP_HEAD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_HEAD", { "vo/npc/female01/moan01.wav", "vo/npc/female01/moan02.wav", "vo/npc/female01/moan03.wav", "vo/npc/female01/moan04.wav" , "vo/npc/female01/moan05.wav" } )
		},
		[HITGROUP_CHEST] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_CHEST", { "vo/npc/female01/hitingut01.wav", "vo/npc/female01/hitingut02.wav", "vo/npc/female01/mygut02.wav" } )
		},
		[HITGROUP_STOMACH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_STOMACH", { "vo/npc/female01/hitingut01.wav", "vo/npc/female01/hitingut02.wav", "vo/npc/female01/mygut02.wav" } )
		},
		[HITGROUP_LEFTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_LEFTARM", { "vo/npc/female01/myarm01.wav", "vo/npc/female01/myarm02.wav" } )
		},
		[HITGROUP_RIGHTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_RIGHTARM", { "vo/npc/female01/myarm01.wav", "vo/npc/female01/myarm02.wav" } )
		},
		[HITGROUP_LEFTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_LEFTLEG", { "vo/npc/female01/myleg01.wav", "vo/npc/female01/myleg02.wav" } )
		},
		[HITGROUP_RIGHTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_RIGHTLEG", { "vo/npc/female01/myleg01.wav", "vo/npc/female01/myleg02.wav" } )
		},
		[HITGROUP_GEAR] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "HITGROUP_GEAR", { "vo/npc/female01/pain01.wav", "vo/npc/female01/pain02.wav", "vo/npc/female01/pain03.wav", "vo/npc/female01/pain04.wav", "vo/npc/female01/pain05.wav", "vo/npc/female01/pain06.wav" } )
		}
	},
	['callouts'] = {
		['hi'] = {
			['name'] = "Hi",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Hi", { "vo/npc/female01/hi01.wav", "vo/npc/female01/hi02.wav" } )
		},
		['agree'] = {
			['name'] = "Agree",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Agree", { "vo/npc/female01/ok01.wav", "vo/npc/female01/ok02.wav", "vo/npc/female01/nice01.wav", "vo/npc/female01/nice02.wav" } )
		},
		['disagree'] = {
			['name'] = "Disagree/No!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Disagree", { "vo/npc/female01/no01.wav", "vo/npc/female01/no02.wav" } )
		},
		['readywhenyouare'] = {
			['name'] = "Ready when you are!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_ReadyWhenYouAre", { "vo/npc/female01/readywhenyouare01.wav", "vo/npc/female01/readywhenyouare02.wav" } )
		},
		['behindyou'] = {
			['name'] = "Behind you!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_BehindYou", { "vo/npc/female01/behindyou01.wav", "vo/npc/female01/behindyou02.wav" } )
		},
		['help'] = {
			['name'] = "Help!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Help", { "vo/npc/female01/help01.wav" } )
		},
		['incoming'] = {
			['name'] = "Incoming!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Incoming", { "vo/npc/female01/watchout.wav",
	"vo/npc/female01/headsup02.wav",
	"vo/npc/female01/incoming02.wav",
	"vo/npc/female01/headsup01.wav",
	"vo/npc/female01/takecover02.wav",
	"vo/npc/female01/getdown02.wav",
	"vo/npc/female01/gethellout.wav",
	"vo/npc/female01/heretheycome01.wav" } )
		},
		['followme'] = {
			['name'] = "Follow me!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_FollowMe", { "vo/npc/female01/squad_away03.wav",
	"vo/npc/female01/squad_follow02.wav",
	"vo/npc/female01/squad_follow03.wav",
	"vo/npc/female01/squad_away01.wav",
	"vo/npc/female01/squad_away02.wav" } )
		},
		['letsgo'] = {
			['name'] = "Let's go!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_LetsGo", { "vo/npc/female01/letsgo01.wav", "vo/npc/female01/letsgo02.wav", "vo/npc/female01/doingsomething.wav", "vo/npc/female01/getgoingsoon.wav", "vo/npc/female01/waitingsomebody.wav" } )
		},
		['leadon'] = {
			['name'] = "Lead on!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_LeadOn", { "vo/npc/female01/leadtheway01.wav", "vo/npc/female01/leadtheway02.wav" } )
		},
		['question'] = {
			['name'] = "Question",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Question", { "vo/npc/female01/question01.wav",
	"vo/npc/female01/question02.wav",
	"vo/npc/female01/question03.wav",
	"vo/npc/female01/question04.wav",
	"vo/npc/female01/question05.wav",
	"vo/npc/female01/question06.wav",
	"vo/npc/female01/question07.wav",
	"vo/npc/female01/question08.wav",
	"vo/npc/female01/question09.wav",
	"vo/npc/female01/question10.wav",
	"vo/npc/female01/question11.wav",
	"vo/npc/female01/question12.wav",
	"vo/npc/female01/question13.wav",
	"vo/npc/female01/question14.wav",
	"vo/npc/female01/question15.wav",
	"vo/npc/female01/question16.wav",
	"vo/npc/female01/question17.wav",
	"vo/npc/female01/question18.wav",
	"vo/npc/female01/question19.wav",
	"vo/npc/female01/question20.wav",
	"vo/npc/female01/question21.wav",
	"vo/npc/female01/question22.wav",
	"vo/npc/female01/question23.wav",
	"vo/npc/female01/question25.wav",
	"vo/npc/female01/question26.wav",
	"vo/npc/female01/question27.wav",
	"vo/npc/female01/question28.wav",
	"vo/npc/female01/question29.wav",
	"vo/npc/female01/question30.wav",
	"vo/npc/female01/question31.wav" } )
		},
		['answer'] = {
			['name'] = "Answer",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "fcitizens", "Wheel_Answer", { "vo/npc/female01/answer01.wav",
	"vo/npc/female01/answer02.wav",
	"vo/npc/female01/answer03.wav",
	"vo/npc/female01/answer04.wav",
	"vo/npc/female01/answer05.wav",
	"vo/npc/female01/answer07.wav",
	"vo/npc/female01/answer08.wav",
	"vo/npc/female01/answer09.wav",
	"vo/npc/female01/answer10.wav",
	"vo/npc/female01/answer11.wav",
	"vo/npc/female01/answer12.wav",
	"vo/npc/female01/answer13.wav",
	"vo/npc/female01/answer14.wav",
	"vo/npc/female01/answer15.wav",
	"vo/npc/female01/answer16.wav",
	"vo/npc/female01/answer17.wav",
	"vo/npc/female01/answer18.wav",
	"vo/npc/female01/answer19.wav",
	"vo/npc/female01/answer20.wav",
	"vo/npc/female01/answer21.wav",
	"vo/npc/female01/answer22.wav",
	"vo/npc/female01/answer23.wav",
	"vo/npc/female01/answer24.wav",
	"vo/npc/female01/answer25.wav",
	"vo/npc/female01/answer26.wav",
	"vo/npc/female01/answer27.wav",
	"vo/npc/female01/answer28.wav",
	"vo/npc/female01/answer29.wav",
	"vo/npc/female01/answer30.wav",
	"vo/npc/female01/answer31.wav",
	"vo/npc/female01/answer32.wav",
	"vo/npc/female01/answer33.wav",
	"vo/npc/female01/answer34.wav",
	"vo/npc/female01/answer35.wav",
	"vo/npc/female01/answer36.wav",
	"vo/npc/female01/answer37.wav",
	"vo/npc/female01/answer38.wav",
	"vo/npc/female01/answer39.wav",
	"vo/npc/female01/answer40.wav" } )
		}
	}
}