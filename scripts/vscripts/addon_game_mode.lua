require("game_setup")

if InfiniteWar == nil then
	InfiniteWar = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

function Activate()
	GameRules.AddonTemplate = InfiniteWar()
	GameRules.AddonTemplate:InitGameMode()
end

function InfiniteWar:InitGameMode()
	print( "Infinite War init..." )

	GameSetup:init()

	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
end

function InfiniteWar:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end