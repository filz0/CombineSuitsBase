local data = {
	["csb_combine_soldier_blue"] = {
		["filter"] = {
			[0] = { class = "player", model = "models/vjfix/combine_soldier.mdl", skin = 0 },
		},
		["parts"] = {
			[0] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(0, 2, 0)
					}
				},
				trail = true,
				size = 8,
				color = Vector(0, 120, 140),
				bone = "eyes",
			},
			[1] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(0, -2, 0)
					}
				},
				trail = true,
				size = 8,
				color = Vector(0, 120, 140),
				bone = "eyes",
				--Init = function(self)
				--	local color = self:GetParent():GetPlayerColor() 
				--	self.color = Vector( color*255, color*255, color*255 ) 
				--end
			},
			[2] = {
				name = "Light",
				command = "r_extended_eyes",
				brightness = 3,
				size = 20,
				color = Vector(0, 120, 140),
				renderInView = true,
				bone = "eyes",
			}
		}
	},
	["csb_combine_soldier_red"] = {
		["filter"] = {
			[0] = { class = "player", model = "models/vjfix/combine_soldier_prisonguard.mdl", skin = 1 },
			[1] = { class = "player", model = "models/vjfix/combine_soldier.mdl", skin = 1 },
		},
		["parts"] = {
			[0] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(0, 2, 0)
					}
				},
				trail = true,
				size = 8,
				color = Vector(255, 0, 0),
				bone = "eyes"
			},
			[1] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(0, -2, 0)
					}
				},
				trail = true,
				size = 8,
				color = Vector(255, 0, 0),
				bone = "eyes"
			}
		}
	},
	["csb_combine_soldier_yellow"] = {
		["filter"] = {
			[0] = { class = "player", model = "models/vjfix/combine_soldier_prisonguard.mdl", skin = 0 }
		},
		["parts"] = {
			[0] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(0, 2, 0)
					}
				},
				trail = true,
				size = 8,
				color = Vector(255, 240, 0),
				bone = "eyes"
			},
			[1] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(0, -2, 0)
					}
				},
				trail = true,
				size = 8,
				color = Vector(255, 240, 0),
				bone = "eyes"
			}
		}
	},
	["csb_combine_elite_player"] = {
		["filter"] = {
			[0] = { class = "player", model = "models/vjfix/combine_super_soldier.mdl" }
		},
		["parts"] = {
			[0] = {
				name = "Glow",
				command = "r_extended_eyes",
				transform = {
					world = {
						pos = Vector(-1.5, 0, 0.3)
					}
				},
				trail = true,
				size = 16,
				opacity = 255,
				shimmer = true,
				color = Vector(255, 0, 0),
				bone = "eyes",
			},
			[1] = {
				name = "Light",
				command = "r_extended_eyes",
				brightness = 3,
				size = 20,
				color = Vector(255, 0, 0),
				renderInView = true,
				bone = "eyes",
			}
		}
	}
}

ExtendedRender.Data:Include( "Packages", data )