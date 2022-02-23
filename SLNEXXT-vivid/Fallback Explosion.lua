--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(), to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini"),

--The NOTESKIN:LoadActor() just tells us the name of the image the Actor redirects on.
--Oh and if you wonder about the "Button" in the "NOTESKIN:LoadActor( )" it means that it will check for that direction.
--So you dont have to do "Down" or "Up" or "Left" etc for every direction which will save space ,)
return Def.ActorFrame {
	--Hold Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "Hold Explosion" ) .. {
		HoldingOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOnCommand"),
		HoldingOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOffCommand"),
		InitCommand=function(self) self:playcommand("HoldingOff"):finishtweening() end,
	},
	--Roll Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "Hold Explosion" ) .. {
		RollOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOnCommand"),
		RollOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOffCommand"),
		InitCommand=function(self) self:playcommand("RollOff"):finishtweening() end,
		BrightCommand=function(self) self:visible(false) end,
		DimCommand=function(self)  self:visible(false) end,		
	},
    --We use this for Seperate Explosions for every Judgement
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W1" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W1Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		JudgmentCommand=function(self) self:finishtweening() end,
		HeldCommand=NOTESKIN:GetMetricA("GhostArrowDim", "HeldCommand"),
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W2" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W2Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W3" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W3Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W4" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W4Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim W5" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		W5Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	--SM5.3 explosion
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim ProW1" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		ProW1Command=NOTESKIN:GetMetricA("GhostArrowDim", "ProW1Command"),
		ProW2Command=NOTESKIN:GetMetricA("GhostArrowDim", "ProW2Command"),
		ProW3Command=NOTESKIN:GetMetricA("GhostArrowDim", "ProW3Command"),
		ProW4Command=NOTESKIN:GetMetricA("GhostArrowDim", "ProW4Command"),
		ProW5Command=NOTESKIN:GetMetricA("GhostArrowDim", "ProW5Command"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( Var "Button", "sparkles (doubleres)" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		ProW1Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW2Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW3Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW4Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		ProW5Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		W1Command=NOTESKIN:GetMetricA("ExplosionParticle", "DimCommand"),
		JudgmentCommand=function(self) self:finishtweening():rotationz(math.random() * 360) end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	NOTESKIN:LoadActor( Var "Button", "sparkles ex (doubleres)" ) .. {
		InitCommand=function(self) self:diffusealpha(0) end,
		ProW1Command=NOTESKIN:GetMetricA("ExplosionParticle", "BrightCommand"),
		ProW2Command=NOTESKIN:GetMetricA("ExplosionParticle", "BrightCommand"),
		ProW3Command=NOTESKIN:GetMetricA("ExplosionParticle", "BrightCommand"),
		JudgmentCommand=function(self) self:finishtweening():rotationz(math.random() * 360) end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(true) end,
	},
	--Mine Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "HitMine Explosion" ) .. {
		InitCommand=NOTESKIN:GetMetricA("GhostArrowBright", "MineInitCommand"),
		HitMineCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HitMineCommand"),
	},
}