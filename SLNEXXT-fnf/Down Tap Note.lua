local Colour = Var "Color"

local Button = Var "Button"

local Colours = {
	["Left"]	= "#7028c5",
	["Down"] = "#00bfba",
	["Up"] = "#56d207",
	["Right"] = "#c20002",
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
	Def.Quad{
		InitCommand=function(self) 
			self:setsize(64,64)
				:diffuse(color(Colours[Button]))
				:MaskDest()
				:blend(Blend.Multiply)
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Top' ),
		Frames = Sprite.LinearFrames( 4, 1 );
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:SetAllStateDelays(0.25)
				:blend(Blend.Add):diffusealpha(0.25)

		end
	},
	Def.Quad {
		InitCommand=function(self)
			self:MaskSource(true)
				:MaskDest()
		end
	}
}
