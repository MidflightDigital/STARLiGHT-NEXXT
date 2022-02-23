local Colour = Var "Color"

local Colours = {
	["4th"]	= "#c20002",
	["8th"] = "#0013fb",
	["12th"] = "#56d207",
	["16th"] = "#cf921e",
	["24th"] = "#510370",
	["32nd"] = "#00bfba",
	["48th"] = "#f80658",
	["64th"] = "#5b3617",
	["192nd"] = "#cbcbcb"
}

local InsideColours = {
	["4th"]	= "#fdd6cc",
	["8th"] = "#bee8f5",
	["12th"] = "#e8f7d4",
	["16th"] = "#fff7c6",
	["24th"] = "#eaccec",
	["32nd"] = "#befafa",
	["48th"] = "#facfed",
	["64th"] = "#eae5db",
	["192nd"] = "#cbcbcb"
}

local OutsideColours = {
	["4th"]	= "#7e0404",
	["8th"] = "#091658",
	["12th"] = "#135d16",
	["16th"] = "#713810",
	["24th"] = "#7028c5",
	["32nd"] = "#04a4a4",
	["48th"] = "#f3265d",
	["64th"] = "#433733",
	["192nd"] = "#333333"
}

return Def.ActorFrame{
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Note' ),
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Mask' ),
		InitCommand=function(self)
			self:MaskSource(true) 
		end
	},
	Def.Quad {
		InitCommand=function(self) 
			self:setsize(64,64)
				:diffuse(color(Colours[Colour]))
				:MaskDest():blend(Blend.Multiply)
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Top' ),
		Frames = Sprite.LinearFrames( 4, 1 );
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:SetAllStateDelays(0.25)
				:diffuse(color(InsideColours[Colour]))

		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Outline'),
		InitCommand=function(self) 
			self:diffuse(color(InsideColours[Colour]))
		end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Stroke'),
		InitCommand=function(self)
			self:diffuse(color(OutsideColours[Colour]))
		end
	},
	Def.Quad {
		InitCommand=function(self)
			self:MaskSource(true)
				:MaskDest()
		end
	}
}
