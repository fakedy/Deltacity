liro.diagnosticPrint("Module Loaded \n")

local PLAYER = {}

PLAYER.MaxHealth = 100
PLAYER.StartHealth = 100
PLAYER.StartArmor = 0
PLAYER.WalkSpeed = 400
PLAYER.RunSpeed = 600
PLAYER.CrouchedWalkSpeed = 0.2
PLAYER.JumpPower = 200
PLAYER.CanUseFlashlight	= true
PLAYER.DuckSpeed			= 0.2		-- How fast to go from not ducking, to ducking
PLAYER.UnDuckSpeed			= 0.2		-- How fast to go from ducking, to not ducking
PLAYER.PlayerModel	= "models/player/swat.mdl"

function PLAYER:SetupDataTables()
end


function PLAYER:Init()
end


function PLAYER:Spawn()

end





function PLAYER:Loadout()

self.Player:Give( "weapon_ak47" )
self.Player:GiveAmmo(255, "Ar2")

end

function PLAYER:SetModel()

	
	self.Player:SetModel( "models/player/swat.mdl" )
	

end


if CLIENT then 

function PLAYER:CalcView( view ) end
function PLAYER:CreateMove( cmd ) end
function PLAYER:ShouldDrawLocal() end
end

function PLAYER:StartMove( cmd, mv ) end	-- Copies from the user command to the move
function PLAYER:Move( mv ) end				-- Runs the move (can run multiple times for the same client)
function PLAYER:FinishMove( mv ) end		-- Copy the results of the move back to the Player

function PLAYER:ViewModelChanged( vm, old, new )
end

--
-- Name: PLAYER:PreDrawViewmodel
-- Desc: Called before the viewmodel is being drawn (clientside)
-- Arg1: Entity|viewmodel|The viewmodel
-- Arg2: Entity|weapon|The weapon
-- Ret1:
--
function PLAYER:PreDrawViewModel( vm, weapon )
end

--
-- Name: PLAYER:PostDrawViewModel
-- Desc: Called after the viewmodel has been drawn (clientside)
-- Arg1: Entity|viewmodel|The viewmodel
-- Arg2: Entity|weapon|The weapon
-- Ret1:
--
function PLAYER:PostDrawViewModel( vm, weapon )
end

function PLAYER:GetHandsModel()

-- return { model = "models/weapons/c_arms_cstrike.mdl", skin = 1, body = "0100000" }

	local cl_playermodel = self.Player:GetInfo( "cl_playermodel" )
	return player_manager.TranslatePlayerHands( cl_playermodel )

end

player_manager.RegisterClass("player_newdefault", PLAYER, player_default)
