AddCSLuaFile()

function sql_value_stats(ply, data)
    baseExp = 1000
    data = sql.Query("SELECT * FROM player_info WHERE unique_id = 'STEAM_0:1:55625934'")
    --Msg(data[1]['unique_id'])
    unique_id = data[1]['unique_id']--sql.QueryValue("SELECT unique_id FROM player_info WHERE unique_id = '"..steamID.."'")
    --Msg(type(unique_id))
    money = tonumber(data[1]['money'], 10) --sql.QueryValue("SELECT money FROM player_info WHERE unique_id = '"..steamID.."'")
    --Msg(type(money))
    level = tonumber(data[1]['level'], 10) --sql.QueryValue("SELECT level FROM player_info WHERE unique_id = '"..steamID.."'")
    --Msg(type(level))
    experience = tonumber(data[1]['exp'], 10) --sql.QueryValue("SELECT exp FROM player_info WHERE unique_id = '"..steamID.."'")
    --Msg(type(experience))
    ply:SetNWString("unique_id", unique_id)
    ply:SetNWInt("money", money) 
    ply:SetNWInt("level", level)
    ply:SetNWInt("experience", experience)
    expreq = math.Round( baseExp + (level^3.5 ))
    ply:SetNWInt("expreq", expreq)
end

function saveStat(ply)
   --Msg("Player name is: "..ply:Name())
    
    --Msg("Money is: "..money)
    --Msg("EXP is: "..experience)
    money = ply:GetNWInt("money")
    level = ply:GetNWInt("level")
    experience = ply:GetNWInt("experience")
    unique_id = ply:GetNWString ("SteamID")
    sql.Query("UPDATE player_info SET money = "..money..", level = "..level..", exp = "..experience.." WHERE unique_id = '"..unique_id.."'")
    
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

function new_player(ply, result)
	
    steamID = ply:SteamID()
    
    // Inserts the base player stats
    sql.Query("INSERT INTO player_info ('unique_id', 'money', 'level', 'exp') VALUES ('"..steamID.."', '100', '1','0')")
    --result = sql.Query( "SELECT * FROM player_info WHERE unique_id = '"..steamID.."'")
    
    if (result) then
        Msg("Player account created!\n")
        sql_value_stats(ply)
    else
        Msg("Some crazy shit went wrong with creating a player info!:O\n")
        Msg(sql.LastError(result).."\n")
    end
		
end


function Initialize()
	tables_exist()
	
	timer.Create("SaveStat", 10, 0, function() SaveAllPlayers() end)
	
end


function SaveAllPlayers()
    for k, v in pairs(player.GetAll()) do
       Msg("Stats saved!\n") // chat message saying stats updated :)
       saveStat(v)
    end
end

// Fires after the player spawned for the first time
function PlayerInitialSpawn( ply )
    
    // Sets up a little delay cause otherwise the steamid wont be available yet
	timer.Create("Steam_id_delay", 1, 1, function()
    
        // Sets the variable SteamID to the players SteamID
        SteamID = ply:SteamID()
        // Networks the variable so we can use it everywhere
        ply:SetNWString("SteamID", SteamID)
        
        // Checks if player already exists in database.
		result = sql.Query("SELECT * FROM player_info WHERE unique_id = '"..ply:SteamID().."'")
		if (result) then
            // Retrieves stats from database.
            sql_value_stats(ply, result) 
		else
            // Creates new player since player wasnt in database.
			new_player(ply, result)
		end
        
	end)

end

hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn", PlayerInitialSpawn )
hook.Add( "Initialize", "Initialize", Initialize)

