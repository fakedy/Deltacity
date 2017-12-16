if SERVER then 

    concommand.Add("PleaseExp", function(ply, cmd, args)

        tempShit = ply:GetNWInt("experience")
        ply:SetNWInt("experience", tempShit + 1000)
        ply:ChatPrint("exp on player at give is: "..ply:GetNWInt("experience"));
        
    end)

end