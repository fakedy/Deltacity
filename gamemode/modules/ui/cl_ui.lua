AddCSLuaFile()
hook.Add("HUDPaint", "DrawMyHud", function()

	// Custom Font
	surface.CreateFont( "DeltaFont",{
	font = "Arial",
	extended = false,
	size = 13,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
	})
	
	
	
	
	
	
    // Money/Level Box
    surface.SetDrawColor(0,0,0, 128)
    surface.DrawRect(0,0,168,48)
    // Text
    surface.SetTextColor(255,255,255,255)
    surface.SetTextPos(0,0)
    // Money
    surface.DrawText("Cash: " .. LocalPlayer():GetNWInt("money"))
    // Level 
    surface.SetTextPos(0,20)
    surface.DrawText("Level: " .. LocalPlayer():GetNWInt("level"))

    // Experience Box
    surface.SetDrawColor(0,0,0, 128)
    surface.DrawRect(ScrW() / 2 - 100,0, 165, 30)
    // Experience
    surface.SetTextPos(ScrW() / 2 - 80,0 )
    surface.DrawText("Exp: " .. LocalPlayer():GetNWInt("experience") .. "/" .. LocalPlayer():GetNWInt("expreq"))
	
	
end)