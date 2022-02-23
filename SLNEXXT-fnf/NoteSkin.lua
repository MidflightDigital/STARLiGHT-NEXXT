local USWN = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
USWN.ButtonRedir =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down"
}

-- Defined the parts to be rotated at which degree
USWN.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 135,
	UpRight = -135,	
}


USWN.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Roll Explosion"] = "Hold Explosion",
}

USWN.PartsToRotate =
{
	["Receptor"] = true,
	["Tap Explosion Dim W1"] = true,
	["Tap Explosion Dim W2"] = true,
	["Tap Explosion Dim W3"] = true,
	["Tap Explosion Dim W4"] = true,
	["Tap Explosion Dim W5"] = true,
	["Tap Note"] = true,
	["Tap Mine"] = true,
	["Tap Fake"] = true,
	["Tap Addition"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Hold Explosion"] = true,
	["Roll Explosion"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
}

USWN.Blank =
{
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
}

function USWN.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"
	local sPlayer = Var "Player"
	local Player = sPlayer
	if sPlayer == nil then
		Player = GAMESTATE:GetMasterPlayerNumber()
	end
	local Reverse = string.find(GAMESTATE:GetPlayerState(Player):GetPlayerOptionsString("ModsLevel_Preferred"):lower(), "reverse")
	

	local Button = USWN.ButtonRedir[sButton] or sButton	
	local Element = USWN.ElementRedir[sElement] or sElement

	if string.find(sElement, "Head") then
		Element = "Tap Note"
	end

	if (string.find(Element, "Active") or 
	   string.find(Element, "Inactive")) then
		Button = sButton
		if Reverse and sButton == "Up" then Button = "Down" end
		if Reverse and sButton == "Down" then Button = "Up" end

	end

	if string.find(sElement, "Hold Body") or string.find(sElement, "Hold Bottomcap") then
		Button = sButton
	end
	
	local Actor = loadfile(NOTESKIN:GetPath(Button,Element))
	
	if type(Actor) == "function" then
		Actor = Actor(nil)
	else
		Actor = Def.Sprite { Texture=NOTESKIN:GetPath(Button,Element) }
	end
	
	if USWN.Blank[sElement] then
		Actor = Def.Actor {}
		if Var "SpriteOnly" then
			Actor = Def.Sprite{ Texture=NOTESKIN:GetPath("","_blank") }
		end
	end
	
	if USWN.PartsToRotate[sElement] then
		Actor.BaseRotationZ = USWN.Rotate[sButton] or nil
	end
		
	return Actor
end

return USWN
