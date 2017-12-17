AddCSLuaFile()
function sql_value_stats ( ply )
        baseExp = 100

		unique_id = sql.QueryValue("SELECT unique_id FROM player_info WHERE unique_id = '"..steamID.."'")
		money = sql.QueryValue("SELECT money FROM player_info WHERE unique_id = '"..steamID.."'")
		level = sql.QueryValue("SELECT level FROM player_info WHERE unique_id = '"..steamID.."'")
		experience = sql.QueryValue("SELECT exp FROM player_info WHERE unique_id = '"..steamID.."'")
		ply:SetNWString("unique_id", unique_id)
		ply:SetNWInt("money", money) 
		ply:SetNWInt("level", level)
		ply:SetNWInt("experience", experience)
        expreq = math.Round( baseExp + (level^3.5 ))
        ply:SetNWInt("expreq", expreq)
end

function saveStat ( ply )
        ply:ChatPrint("Player name is: "..ply:Name())
		money = ply:GetNWInt("money")
		level = ply:GetNWInt("level")
		experience = ply:GetNWInt("experience")
        
		ply:ChatPrint("Money is: "..money)
		ply:ChatPrint("EXP is: "..experience)
		unique_id = ply:GetNWString ("SteamID")
		sql.Query("UPDATE player_info SET money = "..money..", level = "..level..", exp = "..experience.." WHERE unique_id = '"..unique_id.."'")
		ply:ChatPrint("Stats updated!") // chat message saying stats updated :)
		
		
end

function tables_exist()
	if sql.TableExists("player_info") then
		Msg("Both tables already exists !\n")
	else
        //create tables
        Msg("Lets create this shit!")
        query = "CREATE TABLE player_info ( unique_id varchar(255), money int, level int, exp int)"
        result = sql.Query(query)
        if (sql.TableExists("player_info")) then
            Msg("Damn !  table 1 created!!!")
        else
                Msg("Some shit went wrong with the player_info query")
                Msg( sql.LastError( result ) .. "\n" )
                
        end
        
    end
end

function player_exists( ply )
		steamID = ply:GetNWString("steamID")
		
		result = sql.Query("SELECT unique_id, money, level, exp FROM player_info WHERE unique_id = '"..steamID.."'")
		if ( result ) then
        
						sql_value_stats( ply ) // We will call this to retrieve the stats
		else
				new_player( steamID, ply )
		end
							
		
end

function new_player( SteamID, ply )
	
		steamID = SteamID
		// Inserts the base player stats
		sql.Query ( "INSERT INTO player_info ('unique_id', 'money', 'level', 'exp')VALUES ('"..steamID.."', '100', '1','0')" )
		result = sql.Query( "SELECT unique_id, money, level, exp FROM player_info WHERE unique_id = '"..steamID.."'")
		if (result) then
			Msg("Player account created!\n")
			
			sql_value_stats( ply ) 
		
		else
				Msg("Some crazy shit went wrong with creating a player info!:O\n")
				Msg( sql.LastError( result ) .. "\n" )
		end
		
end


function Initialize()
	tables_exist()
end

function PlayerInitialSpawn( ply )
// Fires after the player spawned for the first time

	timer.Create("Steam_id_delay", 1, 1, function()
        // Sets up a little delay cause otherwise the steamid wont be available yet
        
        SteamID = ply:SteamID()
        // Sets the variable SteamID to the players SteamID
        
        ply:SetNWString("SteamID", SteamID)
        // Networks the variable so we can use it everywhere
        
        
        player_exists ( ply )
        
        
        
        // Creates a timer loop that repeats infinite every 5 seconds to save our stats
        timer.Create("SaveStat", 5, 0, function() saveStat( ply ) end)
    
	
	end)

end

hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn", PlayerInitialSpawn )
hook.Add( "Initialize", "Initialize", Initialize)

