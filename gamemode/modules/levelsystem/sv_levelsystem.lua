if SERVER then 

    baseExp = 1000
    
    liro.diagnosticPrint("Module Loaded \n")
    
    function PlayerInitialSpawn( ply )

        playerlevel = ply:GetNWInt("level")
        ExpPoints = ply:GetNWInt("experience") 
        ply:ChatPrint(ExpPoints) 
        --expreq =  ExpPoints + ( baseExp + playerlevel^1.06 )
        --ply:SetNWInt("expreq", expreq)


        --timer.Create("LevelUpChecker", 0.1,0, function() Ticker( ply ) end)
	
    end

    function AddExp(ply, amt)
        ply:ChatPrint("Adding "..amt.." EXP to player.");
        tempShit = ply:GetNWInt("experience")
        ply:SetNWInt("experience", tempShit + amt)
        ply:ChatPrint("exp on player at give is: "..ply:GetNWInt("experience"));
        
        ShouldPlayerLevel(ply)
        
    end
    
    function ShouldPlayerLevel(ply)
        //ply:ChatPrint("fml")
        
        CurrentEXP = ply:GetNWInt("experience")
        RequirementEXP = ply:GetNWInt("expreq")

        if CurrentEXP >= RequirementEXP then
		
            levelUp(ply)

        end
    end

    // If player got enough exp points to level up!
    --[[function Ticker( ply )
        //ply:ChatPrint("fml")
        if ExpPoints >= expreq then
            ply:ChatPrint("FUCK MY LIFE")
            levelUp()
        end
    end ]]--

    function levelUp ( ply )
        
        CurrentLevel = ply:GetNWInt("level")
        CurrentEXP = ply:GetNWInt("experience")
        
        
        // Calculate required exp for next level
        expreq =  math.Round( baseExp + (CurrentLevel^3.5 ))
        ply:SetNWInt("expreq", expreq)
        
        // Increase level by 1.
        ply:SetNWInt("level", CurrentLevel + 1)
        
        // Reset EXP.
        ply:SetNWInt("experience", 0)
        
    end 
    hook.Add( "PlayerInitialSpawn", "MultipleHookz", PlayerInitialSpawn )
end