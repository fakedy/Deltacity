function PlayerInitialSpawn( ply )
	print( ply:GetName().." joined the server.\n" )
	player_manager.SetPlayerClass( ply, "player_newdefault")
end

-- That way you are overriding the default hook
-- you can use hook.Add to make more functions get called when this event occurs
local function spawn( ply )
	print( ply:GetName().." joined the game.\n" )
end
hook.Add( "PlayerInitialSpawn", "some_unique_name", PlayerInitialSpawn )