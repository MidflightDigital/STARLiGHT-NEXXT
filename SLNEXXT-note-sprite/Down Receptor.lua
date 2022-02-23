local player = Var "Player";
local start=0;
local mem_song;
-- [ja] 現在のビートを取得する（譜面で異なるものに対応）
function GetPlayerSongBeat(player)
	local csteps=GAMESTATE:GetCurrentSteps(player);
	local timing=csteps:GetTimingData();
	return timing:GetBeatFromElapsedTime(GAMESTATE:GetSongPosition():GetMusicSeconds());
end;

local t = Def.ActorFrame {
	LoadActor(NOTESKIN:GetPath( '', '_down receptor' ))..{
		Name="Receptor";
		InitCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'InitCommand');
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'NoneCommand');
		OnCommand=function(self)
			self:animate(false);
			self:setstate(1);
		end;
	};
	--[[Def.Sprite {
		Name="Inlay";
		Texture=NOTESKIN:GetPath( '_down', 'tap Receptor Overlay' );
		Frames = Sprite.LinearFrames(4, 1);
		InitCommand=NOTESKIN:GetMetricA('ReceptorArrowOverlay', 'InitCommand');
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrowOverlay', 'NoneCommand');
	};]]
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'tap Flash' );
		Name="Flash",
		Frame0000=0;
		Delay0000=1;
		InitCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'InitCommand');
		PressCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'PressCommand');
		LiftCommand=NOTESKIN:GetMetricA('ReceptorOverlay', 'LiftCommand');
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'NoneCommand');
	};
};
local function update(self)
	local song=GAMESTATE:GetCurrentSong();
	if song and mem_song~=song then
		start=song:GetFirstBeat()-8.0;
		mem_song=song;
	end;
	local rec = self:GetChild("Receptor");
	local now=GetPlayerSongBeat(player);
	local beat=(now*10)%10;
	if now>=start then
		if beat>=1 and beat<9 then
			rec:setstate(1);
		else
			rec:setstate(0);
		end;
	else
		rec:setstate(1);
	end;
end;
t.InitCommand=cmd(SetUpdateFunction,update;);
return t;
