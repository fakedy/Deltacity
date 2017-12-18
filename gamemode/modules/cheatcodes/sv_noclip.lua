

if SERVER then 
// There probably is a much smarter way to do this :)
NoClipEnabled = false

concommand.Add("noclip_on", function()


	NoClipEnabled = true


end)

concommand.Add("noclip_off", function()


	NoClipEnabled = false


end)



hook.Add( "PlayerNoClip", "IsInNoClip", function(ply, desiredMode)

	
	
		if NoClipEnabled == true then
	
			return true
	
		end 

	end)





end