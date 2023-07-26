TFAVOX_Models = TFAVOX_Models or {}

local defaultModel = "models/humans/group01/male_01.mdl"

TFAVOX_Models["models/humans/group01/male_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_05.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_07.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_08.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group01/male_09.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models["models/humans/group02/male_01.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_05.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_07.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_08.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group02/male_09.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models["models/humans/group03/male_01.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_05.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_07.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_08.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03/male_09.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models["models/humans/group03m/male_01.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_02.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_03.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_04.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_05.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_06.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_07.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_08.mdl"] = TFAVOX_Models[defaultModel]
TFAVOX_Models["models/humans/group03m/male_09.mdl"] = TFAVOX_Models[defaultModel]

TFAVOX_Models[defaultModel] = {
	['main'] = {
		['death'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "death", { "vo/npc/male01/pain07.wav", "vo/npc/male01/pain08.wav", "vo/npc/male01/pain09.wav" } )
		},
		['spawn'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "spawn", { "vo/npc/male01/ahgordon01.wav", "vo/npc/male01/ahgordon02.wav", "vo/npc/male01/docfreeman01.wav", "vo/npc/male01/docfreeman02.wav", "vo/npc/male01/freeman.wav" } )
		},
		['reload'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "reload", { "vo/npc/male01/gottareload01.wav", "vo/npc/male01/coverwhilereload01.wav", "vo/npc/male01/coverwhilereload02.wav" } )
		},
		['noammo'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "noammo", { "vo/npc/male01/ohno.wav", "vo/npc/male01/uhoh.wav", "vo/npc/male01/fantastic01.wav" } )
		},
		['fall'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "fall", { "ambient/wind/wind_gust_10.wav", "ambient/wind/wind_gust_2.wav", "ambient/wind/wind_snippet4.wav", "ambient/wind/wind_snippet5.wav" } )
		}
	},
	['murder'] = {
		['combine'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdcomb", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdcp", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdzomb", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdhc", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdmh", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdsca", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['sniper'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdsni", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['turret'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdtur", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		},
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdgener", { "vo/npc/male01/gotone01.wav", "vo/npc/male01/gotone02.wav", "vo/npc/male01/likethat.wav", "vo/npc/male01/yeah02.wav", "vo/npc/male01/fantastic02.wav", "vo/npc/male01/oneforme.wav" } )
		}
	},
	['spot'] = {
		['combine'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "spotcomb", { "vo/npc/male01/combine01.wav", "vo/npc/male01/combine02.wav" } )
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "spotcp", { "vo/npc/male01/civilprotection01.wav", "vo/npc/male01/civilprotection02.wav", "vo/npc/male01/cps01.wav", "vo/npc/male01/cps02.wav" } )
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "spotzom", { "vo/npc/male01/zombies01.wav", "vo/npc/male01/zombies02.wav" } )
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "spothc", { "vo/npc/male01/headcrabs01.wav", "vo/npc/male01/headcrabs02.wav" } )
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "spotmh", { "vo/npc/male01/hacks01.wav", "vo/npc/male01/hacks02.wav", "vo/npc/male01/herecomehacks01.wav", "vo/npc/male01/herecomehacks02.wav" } )
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdsca", { "vo/npc/male01/scanners01.wav", "vo/npc/male01/scanners02.wav" } )
		},
		['ally'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdally", { "vo/npc/male01/answer01.wav", 
	"vo/npc/male01/answer02.wav", 
	"vo/npc/male01/answer03.wav", 
	"vo/npc/male01/answer04.wav", 
	"vo/npc/male01/answer05.wav", 
	"vo/npc/male01/answer07.wav", 
	"vo/npc/male01/answer08.wav", 
	"vo/npc/male01/answer09.wav", 
	"vo/npc/male01/answer10.wav", 
	"vo/npc/male01/answer11.wav", 
	"vo/npc/male01/answer12.wav", 
	"vo/npc/male01/answer13.wav", 
	"vo/npc/male01/answer14.wav", 
	"vo/npc/male01/answer15.wav", 
	"vo/npc/male01/answer16.wav", 
	"vo/npc/male01/answer17.wav", 
	"vo/npc/male01/answer18.wav", 
	"vo/npc/male01/answer19.wav", 
	"vo/npc/male01/answer20.wav", 
	"vo/npc/male01/answer21.wav", 
	"vo/npc/male01/answer22.wav", 
	"vo/npc/male01/answer23.wav", 
	"vo/npc/male01/answer24.wav", 
	"vo/npc/male01/answer25.wav", 
	"vo/npc/male01/answer26.wav", 
	"vo/npc/male01/answer27.wav", 
	"vo/npc/male01/answer28.wav",
	"vo/npc/male01/answer29.wav", 
	"vo/npc/male01/answer30.wav", 	
	"vo/npc/male01/question01.wav",
	"vo/npc/male01/question02.wav",
	"vo/npc/male01/question03.wav",
	"vo/npc/male01/question04.wav",
	"vo/npc/male01/question05.wav",
	"vo/npc/male01/question06.wav",
	"vo/npc/male01/question07.wav",
	"vo/npc/male01/question08.wav",
	"vo/npc/male01/question09.wav",
	"vo/npc/male01/question10.wav",
	"vo/npc/male01/question11.wav",
	"vo/npc/male01/question12.wav",
	"vo/npc/male01/question13.wav",
	"vo/npc/male01/question14.wav",
	"vo/npc/male01/question15.wav",
	"vo/npc/male01/question16.wav",
	"vo/npc/male01/question17.wav",
	"vo/npc/male01/question18.wav",
	"vo/npc/male01/question19.wav",
	"vo/npc/male01/question20.wav",
	"vo/npc/male01/question21.wav",
	"vo/npc/male01/question22.wav",
	"vo/npc/male01/question23.wav",
	"vo/npc/male01/question25.wav",
	"vo/npc/male01/question26.wav",
	"vo/npc/male01/question27.wav",
	"vo/npc/male01/question28.wav",
	"vo/npc/male01/question29.wav",
	"vo/npc/male01/question30.wav" } )
		},
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "murdgener", { "vo/npc/male01/startle01.wav", "vo/npc/male01/startle02.wav", "vo/npc/male01/getdown02.wav", "vo/npc/male01/headsup01.wav", "vo/npc/male01/headsup02.wav" } )
		}
	},
	['taunt'] = {
		[ACT_GMOD_GESTURE_AGREE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_GESTURE_AGREE", { "vo/npc/male01/ok01.wav", "vo/npc/male01/ok02.wav", "vo/npc/male01/nice.wav", "vo/npc/male01/yougotit02.wav" } )
		},
		[ACT_GMOD_GESTURE_BECON] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_GESTURE_BECON", { "vo/npc/male01/overhere01.wav", "vo/npc/male01/squad_away01.wav", "vo/npc/male01/squad_away02.wav", "vo/npc/male01/squad_away03.wav" } )
		},
		[ACT_GMOD_GESTURE_BOW] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_GESTURE_BOW", { "vo/npc/male01/sorry01.wav", "vo/npc/male01/sorry02.wav", "vo/npc/male01/sorry03.wav", "vo/npc/male01/pardonme01.wav", "vo/npc/male01/pardonme02.wav" } )
		},
		[ACT_GMOD_GESTURE_DISAGREE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_GESTURE_DISAGREE", { "vo/npc/male01/no01.wav", "vo/npc/male01/no02.wav" } )
		},
		[ACT_GMOD_TAUNT_SALUTE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_TAUNT_SALUTE", { "vo/npc/male01/leadtheway01.wav", "vo/npc/male01/leadtheway02.wav" } )
		},
		[ACT_GMOD_GESTURE_WAVE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_GESTURE_WAVE", { "vo/npc/male01/hi01.wav", "vo/npc/male01/hi02.wav" } )
		},
		[ACT_GMOD_TAUNT_PERSISTENCE] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_TAUNT_PERSISTENCE", { "vo/npc/male01/help01.wav", "vo/npc/male01/watchout.wav" } )
		},
		[ACT_GMOD_TAUNT_LAUGH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_TAUNT_LAUGH", { "vo/coast/odessa/male01/nlo_cheer03.wav" } )
		},
		[ACT_GMOD_TAUNT_CHEER] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_GMOD_TAUNT_CHEER", { "vo/coast/odessa/male01/nlo_cheer01.wav", "vo/coast/odessa/male01/nlo_cheer02.wav", "vo/coast/odessa/male01/nlo_cheer04.wav" } )
		},
		[ACT_SIGNAL_FORWARD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "ACT_SIGNAL_FORWARD", { "vo/npc/male01/squad_follow03.wav", "vo/npc/male01/letsgo01.wav", "vo/npc/male01/letsgo02.wav" } )
		}
	},
	['damage'] = {
		[HITGROUP_GENERIC] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_GENERIC", { "vo/npc/male01/pain01.wav", "vo/npc/male01/pain02.wav", "vo/npc/male01/pain03.wav", "vo/npc/male01/pain04.wav", "vo/npc/male01/pain05.wav", "vo/npc/male01/pain06.wav" } )
		},
		[HITGROUP_HEAD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_HEAD", { "vo/npc/male01/moan01.wav", "vo/npc/male01/moan02.wav", "vo/npc/male01/moan03.wav", "vo/npc/male01/moan04.wav" , "vo/npc/male01/moan05.wav" } )
		},
		[HITGROUP_CHEST] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_CHEST", { "vo/npc/male01/hitingut01.wav", "vo/npc/male01/hitingut02.wav", "vo/npc/male01/mygut02.wav" } )
		},
		[HITGROUP_STOMACH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_STOMACH", { "vo/npc/male01/hitingut01.wav", "vo/npc/male01/hitingut02.wav", "vo/npc/male01/mygut02.wav" } )
		},
		[HITGROUP_LEFTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_LEFTARM", { "vo/npc/male01/myarm01.wav", "vo/npc/male01/myarm02.wav" } )
		},
		[HITGROUP_RIGHTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_RIGHTARM", { "vo/npc/male01/myarm01.wav", "vo/npc/male01/myarm02.wav" } )
		},
		[HITGROUP_LEFTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_LEFTLEG", { "vo/npc/male01/myleg01.wav", "vo/npc/male01/myleg02.wav" } )
		},
		[HITGROUP_RIGHTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_RIGHTLEG", { "vo/npc/male01/myleg01.wav", "vo/npc/male01/myleg02.wav" } )
		},
		[HITGROUP_GEAR] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "HITGROUP_GEAR", { "vo/npc/male01/pain01.wav", "vo/npc/male01/pain02.wav", "vo/npc/male01/pain03.wav", "vo/npc/male01/pain04.wav", "vo/npc/male01/pain05.wav", "vo/npc/male01/pain06.wav" } )
		}
	},
	['callouts'] = {
		['hi'] = {
			['name'] = "Hi",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Hi", { "vo/npc/male01/hi01.wav", "vo/npc/male01/hi02.wav" } )
		},
		['agree'] = {
			['name'] = "Agree",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Agree", { "vo/npc/male01/ok01.wav", "vo/npc/male01/ok02.wav", "vo/npc/male01/nice.wav", "vo/npc/male01/yougotit02.wav" } )
		},
		['disagree'] = {
			['name'] = "Disagree/No!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Disagree", { "vo/npc/male01/no01.wav", "vo/npc/male01/no02.wav" } )
		},
		['readywhenyouare'] = {
			['name'] = "Ready when you are!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_ReadyWhenYouAre", { "vo/npc/male01/readywhenyouare01.wav", "vo/npc/male01/readywhenyouare02.wav" } )
		},
		['behindyou'] = {
			['name'] = "Behind you!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_BehindYou", { "vo/npc/male01/behindyou01.wav", "vo/npc/male01/behindyou02.wav" } )
		},
		['help'] = {
			['name'] = "Help!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Help", { "vo/npc/male01/help01.wav" } )
		},
		['incoming'] = {
			['name'] = "Incoming!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Incoming", { "vo/npc/male01/watchout.wav",
	"vo/npc/male01/headsup02.wav",
	"vo/npc/male01/incoming02.wav",
	"vo/npc/male01/headsup01.wav",
	"vo/npc/male01/takecover02.wav",
	"vo/npc/male01/getdown02.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/heretheycome01.wav" } )
		},
		['followme'] = {
			['name'] = "Follow me!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_FollowMe", { "vo/npc/male01/squad_away03.wav",
	"vo/npc/male01/squad_follow02.wav",
	"vo/npc/male01/squad_follow03.wav",
	"vo/npc/male01/squad_away01.wav",
	"vo/npc/male01/squad_away02.wav" } )
		},
		['letsgo'] = {
			['name'] = "Let's go!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_LetsGo", { "vo/npc/male01/letsgo01.wav", "vo/npc/male01/letsgo02.wav", "vo/npc/male01/doingsomething.wav", "vo/npc/male01/getgoingsoon.wav", "vo/npc/male01/waitingsomebody.wav" } )
		},
		['leadon'] = {
			['name'] = "Lead on!",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_LeadOn", { "vo/npc/male01/leadtheway01.wav", "vo/npc/male01/leadtheway02.wav" } )
		},
		['question'] = {
			['name'] = "Question",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Question", { "vo/npc/male01/question01.wav",
	"vo/npc/male01/question02.wav",
	"vo/npc/male01/question03.wav",
	"vo/npc/male01/question04.wav",
	"vo/npc/male01/question05.wav",
	"vo/npc/male01/question06.wav",
	"vo/npc/male01/question07.wav",
	"vo/npc/male01/question08.wav",
	"vo/npc/male01/question09.wav",
	"vo/npc/male01/question10.wav",
	"vo/npc/male01/question11.wav",
	"vo/npc/male01/question12.wav",
	"vo/npc/male01/question13.wav",
	"vo/npc/male01/question14.wav",
	"vo/npc/male01/question15.wav",
	"vo/npc/male01/question16.wav",
	"vo/npc/male01/question17.wav",
	"vo/npc/male01/question18.wav",
	"vo/npc/male01/question19.wav",
	"vo/npc/male01/question20.wav",
	"vo/npc/male01/question21.wav",
	"vo/npc/male01/question22.wav",
	"vo/npc/male01/question23.wav",
	"vo/npc/male01/question25.wav",
	"vo/npc/male01/question26.wav",
	"vo/npc/male01/question27.wav",
	"vo/npc/male01/question28.wav",
	"vo/npc/male01/question29.wav",
	"vo/npc/male01/question30.wav" } )
		},
		['answer'] = {
			['name'] = "Answer",
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound( "citizens", "Wheel_Answer", { "vo/npc/male01/answer01.wav",
	"vo/npc/male01/answer02.wav",
	"vo/npc/male01/answer03.wav",
	"vo/npc/male01/answer04.wav",
	"vo/npc/male01/answer05.wav",
	"vo/npc/male01/answer07.wav",
	"vo/npc/male01/answer08.wav",
	"vo/npc/male01/answer09.wav",
	"vo/npc/male01/answer10.wav",
	"vo/npc/male01/answer11.wav",
	"vo/npc/male01/answer12.wav",
	"vo/npc/male01/answer13.wav",
	"vo/npc/male01/answer14.wav",
	"vo/npc/male01/answer15.wav",
	"vo/npc/male01/answer16.wav",
	"vo/npc/male01/answer17.wav",
	"vo/npc/male01/answer18.wav",
	"vo/npc/male01/answer19.wav",
	"vo/npc/male01/answer20.wav",
	"vo/npc/male01/answer21.wav",
	"vo/npc/male01/answer22.wav",
	"vo/npc/male01/answer23.wav",
	"vo/npc/male01/answer24.wav",
	"vo/npc/male01/answer25.wav",
	"vo/npc/male01/answer26.wav",
	"vo/npc/male01/answer27.wav",
	"vo/npc/male01/answer28.wav",
	"vo/npc/male01/answer29.wav",
	"vo/npc/male01/answer30.wav",
	"vo/npc/male01/answer31.wav",
	"vo/npc/male01/answer32.wav",
	"vo/npc/male01/answer33.wav",
	"vo/npc/male01/answer34.wav",
	"vo/npc/male01/answer35.wav",
	"vo/npc/male01/answer36.wav",
	"vo/npc/male01/answer37.wav",
	"vo/npc/male01/answer38.wav",
	"vo/npc/male01/answer39.wav",
	"vo/npc/male01/answer40.wav" } )
		}
	}
}

