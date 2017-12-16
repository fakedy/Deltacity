
function PlayerInitialSpawn( ply )

    baseExp = 100
    playerlevel = ply:GetNWInt("level")
    ExpPoints = ply:GetNWInt("experience")
    ply:ChatPrint(ExpPoints)
    expreq =  ExpPoints + ( baseExp + playerlevel^1.06 )
    ply:SetNWInt("expreq", expreq)


    timer.Create("LevelUpChecker", 0.1,0, function() Ticker( ply ) end)

end


// If player got enough exp points to level up!
function Ticker( ply )
	playerlevel = ply:GetNWInt("level")
	ExpPoints = ply:GetNWInt("experience")
	expreq = ply:GetNWInt("expreq")
    //ply:ChatPrint("fml")
	
ply:ChatPrint("LIFE IS SHIT")
    if ExpPoints >= expreq then
        ply:ChatPrint("FUCK MY LIFE")
        levelUp()

    end

end

function levelUp ( ply )

    ply:SetNWInt("level", playerlevel + 1)
    expreq =  ExpPoints + ( baseExp + playerlevel^1.06 )
	ply:SetNWInt("experience", 0)
	ply:SetNWInt("expreq", expreq)

end 
hook.Add( "PlayerInitialSpawn", "MultipleHookz", PlayerInitialSpawn )