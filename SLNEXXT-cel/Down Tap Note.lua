local Colour = Var "Color"

local Colours = {
	["4th"]	= "4th",
	["8th"] = "8th",
	["12th"] = "12th",
	["16th"] = "16th",
	["24th"] = "12th",
	["32nd"] = "32nd",
	["48th"] = "12th",
	["64th"] = "64th",
	["192nd"] = "192nd"
}

return Def.ActorFrame{
	InitCommand=function(s) s:basezoom(0.98) end,
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Note' ),
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Mask' ),
		InitCommand=function(self)
			self:MaskSource(true) 
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Scroll '..Colours[Colour] ),
		InitCommand=function(self) 
			self:y(32)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:texcoordvelocity(0,-0.2)
				:MaskDest()
				:blend(Blend.Multiply)
				:diffuse(color("0.65,0.65,0.65,0.5"))
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Top' ),
		Frames = Sprite.LinearFrames( 4, 1 );
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:SetAllStateDelays(1)
				:blend(Blend.Add):diffusealpha(0.25)

		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Outline'),
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Stroke'),
	},
	Def.Quad {
		InitCommand=function(self)
			self:MaskSource(true)
				:MaskDest()
		end
	}
}