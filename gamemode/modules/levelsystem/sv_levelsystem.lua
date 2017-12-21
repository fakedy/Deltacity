if SERVER then 

    LevelSystem = {}
    LevelSystem.baseExp = 1000

    baseExp = 1000
    
    liro.diagnosticPrint("Module Loaded \n")
    
    function PlayerInitialSpawn( ply )

        playerlevel = ply:GetNWInt("level")
        ExpPoints = ply:GetNWInt("experience")
        Msg(LevelSystem.baseExp.."\n")
    end 

    function AddExp(ply, amt)
    
        tempShit = ply:GetNWInt("experience")
        ply:SetNWInt("experience", tempShit + amt)
        ShouldPlayerLevel(ply)
        
    end
    
    function ShouldPlayerLevel(ply)
        
        CurrentEXP = ply:GetNWInt("experience")
        RequirementEXP = ply:GetNWInt("expreq")

        // If player got enough exp points to level up!
        if CurrentEXP >= RequirementEXP then
            levelUp(ply)
        end
        
    end

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