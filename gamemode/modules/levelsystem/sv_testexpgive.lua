if SERVER then 

    concommand.Add("PleaseExp", function(ply, cmd, args)
        AddExp(ply, 10)
        --tempShit = ply:GetNWInt("experience")
        --ply:SetNWInt("experience", tempShit + 1000)
        --ply:ChatPrint("exp on player at give is: "..ply:GetNWInt("experience"));
        --templevel = ply:GetNWInt("level")
        --ply:SetNWInt("level", templevel + 1)
    end)

end