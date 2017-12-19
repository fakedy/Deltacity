AddCSLuaFile()

if (SERVER) then

AddCSLuaFile("shared.lua")



function ENT:Initialize()


self:SetModel("models/props_lab/huladoll.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS)
self:SetSolid(SOLID_VPHYSICS)


        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	


end 

if (CLIENT) then

include("shared.lua")

function ENT:Draw()

self:DrawModel()



end



ENT:Type = "anim"
ENT:Base = "base_gmodentity"


