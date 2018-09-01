--init a plugin
--Author theJian,Lorain.Li
g_Plugin = nil
function Initialize(a_Plugin)
	a_Plugin:SetName("Karma")
	a_Plugin:SetVersion(1)
	g_Plugin = a_Plugin
	Merits:Load()
	cPluginManager:AddHook(cPluginManager.HOOK_KILLED, MyOnKilled)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_JOINED, MyOnPlayerJoined)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_DESTROYED, MyOnPlayerDestroyed)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, MyOnPlayerBrokenBlock)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_PLACED_BLOCK, MyOnPlayerPlacedBlock)
	return true
end

function OnDisable()
	LOG("Karma v" .. g_Plugin:GetVersion() .. " is disabling")
	Merits:Save()
end

function MyOnPlayerJoined(a_Player)
	Merits:PlayerJoin(a_Player)
end

function MyOnPlayerDestroyed(a_Player)
	Merits:PlayerQuit(a_Player)
end

function MyOnKilled(a_Victim, a_TDI, a_DeathMessage)
	if(cMonster:FamilyFromType(a_Victim:GetMonsterType()) == mfHostile) then
		if(a_TDI.Attacker:IsPlayer()) then
			Merits:PlayerDoMerits(a_TDI.Attacker, 10)
		end
	end
	if(cMonster:FamilyFromType(a_Victim:GetMonsterType()) == mfPassive) then
		if(a_TDI.Attacker:IsPlayer()) then
			Merits:PlayerDoMerits(a_TDI.Attacker, -10)
		end
	end
end

function MyOnPlayerBrokenBlock(a_Player, a_BlockX, a_BlockY, a_BlockZ, a_BlockFace, a_BlockType, a_BlockMeta)
	if(a_BlockType == E_BLOCK_LOG or a_BlockType == E_BLOCK_NEW_LOG) then
		Merits:PlayerDoMerits(a_Player, -1)
	end
end

function MyOnPlayerPlacedBlock(a_Player, a_BlockX, a_BlockY, a_BlockZ, a_BlockFace, a_BlockType, a_BlockMeta)
	if((a_BlockType == E_BLOCK_LOG or a_BlockType == E_BLOCK_NEW_LOG) and (a_BlockMeta <= E_META_SAPLING_DARK_OAK)) then
		Merits:PlayerDoMerits(a_Player, 1)
	end
end
