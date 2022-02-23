local Colour = Var "Color"

local Colours = {
	["4th"]	= "#c20002",
	["8th"] = "#0013fb",
	["12th"] = "#56d207",
	["16th"] = "#cf921e",
	["24th"] = "#56d207",
	["32nd"] = "#56d207",
	["48th"] = "#56d207",
	["64th"] = "#56d207",
	["192nd"] = "#56d207"
}

local InsideColours = {
	["4th"]	= "#fdd6cc",
	["8th"] = "#bee8f5",
	["12th"] = "#e8f7d4",
	["16th"] = "#fff7c6",
	["24th"] = "#e8f7d4",
	["32nd"] = "#e8f7d4",
	["48th"] = "#e8f7d4",
	["64th"] = "#e8f7d4",
	["192nd"] = "#e8f7d4"
}

local OutsideColours = {
	["4th"]	= "#7e0404",
	["8th"] = "#091658",
	["12th"] = "#135d16",
	["16th"] = "#713810",
	["24th"] = "#135d16",
	["32nd"] = "#135d16",
	["48th"] = "#135d16",
	["64th"] = "#135d16",
	["192nd"] = "#135d16"
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
