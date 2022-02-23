local Active = string.find(Var "Element", "Active") ~= nil

local Button = Var "Button"

local Colours = {
	["Left"]	= "#7028c5",
	["Down"] = "#00bfba",
	["Up"] = "#56d207",
	["Right"] = "#c20002",
}


return Def.ActorFrame{
    Def.Sprite{
        Texture=NOTESKIN:GetPath('_Down' , 'Hold Body'),
        InitCommand=function(self)
			self:SetAllStateDelays(0)
            if not Active then
                self:setstate(1)
            else
                self:setstate(0)
            end
		end
    },
    Def.Quad{
        InitCommand=function(self)
            self:setsize(23,32)
				:diffuse(color(Colours[Button]))
				:blend(Blend.Multiply)
		end
    }
}