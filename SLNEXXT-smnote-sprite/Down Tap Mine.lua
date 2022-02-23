return Def.ActorFrame {
	InitCommand=function(s) s:zoom(1.1) end,
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Mine a' );
		InitCommand=function(s) s:spin():effectclock('beat'):effectmagnitude(0,0,-60) end,
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Mine b' );
		InitCommand=function(s) s:spin():effectclock('beat'):effectmagnitude(0,0,50) end,
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Mine c' );
	};
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Tap Mine c' );
		InitCommand=function(s) s:blend(Blend.Add):effectclock("beat"):diffuseramp(effectcolor1,color("0,0,0,0")):effectcolor2(color("1,1,1,1")) end,
	};
};
