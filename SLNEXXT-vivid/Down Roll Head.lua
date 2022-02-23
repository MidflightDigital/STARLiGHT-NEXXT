local Active = string.find(Var "Element", "Active") ~= nil

return Def.ActorFrame{
    Def.Sprite{
        Texture=NOTESKIN:GetPath('_Down' , 'Roll Head'),
    },
    Def.Sprite {
		Texture=NOTESKIN:GetPath( '_Down', 'Note Top' ),
		InitCommand=function(self)
			self:SetAllStateDelays(0)
            if not Active then
                self:setstate(0)
            else
                self:setstate(3)
            end
		end
	}
    
    
}