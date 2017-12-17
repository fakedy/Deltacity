AddCSLuaFile()
hook.Add("HUDPaint", "DrawMyHud", function()
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