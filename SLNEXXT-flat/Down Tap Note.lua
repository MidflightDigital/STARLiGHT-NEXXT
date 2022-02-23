return Def.ActorFrame{
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Note' ),
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Outline'),
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Mask' ),
		InitCommand=function(self)
			self:MaskSource(true) 
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Scroll' ),
		InitCommand=function(self) 
			self:y(80)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:texcoordvelocity(0,-0.2)
				:MaskDest()
				:blend(Blend.Multiply)
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Top' ),
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:SetAllStateDelays(0.25)
		end
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
