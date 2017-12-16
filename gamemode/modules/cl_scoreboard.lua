scoreboard = scoreboard or {}

surface.CreateFont( "DefFont", {
	font = "Arial",
	size = 22,
	weight = 500,
	antialias = true,
	additive = false

} )



function scoreboard:show()

Msg( "Red is a noob at LUA\n" )

	function scoreboard:hide()
	
	Msg( "Racer is even worse at LUA\n")
	
	end
	
end




function GM:ScoreboardShow()
	scoreboard:show()
end

function GM:ScoreboardHide()
	scoreboard:hide()
end