
if SERVER then

    concommand.Add("ak47", function( ply, cmd, args )
        
    ply:GiveAmmo(256, "Ar2")
    ply:Give("weapon_ak47")

    end )

end




