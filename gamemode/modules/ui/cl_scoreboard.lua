AddCSLuaFile()
scoreboard = scoreboard or {}



function scoreboard:show()



    -- Warning, this is the ugliest scoreboard you will ever see in your life.
    -- For some reason the font change everytime you hold tab :(
    -- So I kinda understand how it should work but what I dont understand is why it isnt working.
    -- Wtf is (w,h)? width and height?
    -- Lol it stopped changing the font :O

    // Creates the background and the list 
    DPanel1 = vgui.Create("DPanel")
    DPanel1:SetPos(ScrW() /4,ScrH() / 6)
    DPanel1:SetSize(ScrW() /2,ScrH()/ 2)
	
	
	// Creats the list
	local DListView = vgui.Create("DListView", DPanel1)
    DListView:SetSize(ScrW() /2, ScrH() /2)	
	
	// Setting up the Columns
	local colName = DListView:AddColumn("Name")
		local colSteamId = DListView:AddColumn("SteamID")
		local colFrags = DListView:AddColumn("Kills")
		local colDeaths = DListView:AddColumn("Deaths")
		local colRank = DListView:AddColumn("Rank(Not implemented")
		local colPing = DListView:AddColumn("Ping")
		

		// Loops through all players and adds them to the scoreboard
    for _, v in pairs ( player.GetAll()) do			
        local line = DListView:AddLine( v:Name(),v:SteamID(), v:Frags(), v:Deaths(),"Regular", v:Ping() )
        function line:Paint( w, h)
        
		draw.RoundedBox(5,0,5,w,h,Color(145,234,255))
		
        end
    end
	
	

end

function scoreboard:hide()
	
	DPanel1:Remove()
	
	
	
end


function GM:ScoreboardShow()
	scoreboard:show()
end

function GM:ScoreboardHide()
	scoreboard:hide()
end