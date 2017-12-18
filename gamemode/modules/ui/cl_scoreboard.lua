AddCSLuaFile()
scoreboard = scoreboard or {}



function scoreboard:show()

     DPanel = vgui.Create("DPanel")

    -- Warning, this is the ugliest scoreboard you will ever see in your life.
    -- For some reason the font change everytime you hold tab :(
    -- So I kinda understand how it should work but what I dont understand is why it isnt working.
    -- Wtf is (w,h)? width and height?
    -- Lol it stopped changing the font :O

    Msg( "Red is a noob at LUA\n" )
    
    DPanel:SetPos(ScrW() /4,ScrH() / 6)
    DPanel:SetSize(ScrW() /2,ScrH()/ 2)

    local DListView = vgui.Create("DListView", DPanel)
    DListView:SetSize(ScrW() /2, ScrH() /2)
    for _, v in pairs ( player.GetAll()) do
        local line = DListView:AddLine( "bob", v:Frags(), v:Deaths(), v:Ping() )
        function line:Paint( w, h)
        
        
        end
    end
	
	

end

function scoreboard:hide()
	
	DPanel:Remove()
	
	Msg( "Racer is even worse at LUA\n")
	
end


function GM:ScoreboardShow()
	scoreboard:show()
end

function GM:ScoreboardHide()
	scoreboard:hide()
end