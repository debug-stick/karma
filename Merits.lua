--Manage Players Merits
Merits = {}
Merits.Players = {}

function Merits:Load()
	local IniFile = cIniFile()
	IniFile:ReadFIle(cPluginManager:GetPluginsPath() .. "/Karma/Merits.ini")
	for i=0,(IniFile:GetNumKeys() - 1) do
		local uuid = IniFile:GetKeyName(i)
		self.Players[uuid] = IniFile:GetValueSetI(uuid, "Merits")
	end
end

function Merits:Save()
	local IniFile = cIniFile()
	IniFile:ReadFIle(cPluginManager:GetPluginsPath() .. "/Karma/Merits.ini")
	for uuid,value in ipairs(self.Players) do
		IniFile:AddKeyName(uuid)
		IniFile:SetValueF(uuid, "Merits", value, true)
	end
end

function Merits:PlayerJoin(a_Player)
	if not self.Players[a_Player:GetUUID()] then 
		self.Players[a_Player:GetUUID()] = 0
	end
end

function Merits:PlayerQuit(a_Player)
	self.Save()
end

function Merits:PlayerDoMerits(a_Player, v)
	self.Players[a_Player:GetUUID()] = self.Players[a_Player:GetUUID()] + v
end

return Merits