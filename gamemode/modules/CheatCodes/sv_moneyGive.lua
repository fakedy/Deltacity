
if SERVER then 

    concommand.Add("MoneyPlease", function( ply, cmd, args )
    tempmoney = ply:GetNWInt("money")
    ply:SetNWInt("money", tempmoney + 1000)
	

    end)

end
