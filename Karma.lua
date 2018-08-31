--init a plugin
--Author theJian,Lorain.Li
g_Plugin = nil
function Initialize(a_Plugin)
	a_Plugin:SetName("Karma")
	a_Plugin:SetVersion(1)
	g_Plugin = a_Plugin
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_JOINED, MyOnPlayerJoined)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_DESTROYED, MyOnPlayerDestroyed)
	cPluginManager:AddHook(cPluginManager.HOOK_TAKE_DAMAGE, MyOnTakeDamage)
	return true
end

function OnDisable()
	LOG("Karma v" .. g_Plugin:GetVersion() .. " is disabling")
end

function MyOnPlayerJoined(a_Player)
	-- body
end

function MyOnPlayerDestroyed(a_Player)
	-- body
end

function MyOnTakeDamage(a_Entity, a_TDI)
	-- body
end